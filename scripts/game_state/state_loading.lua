require("scripts/game_state/server_join_state_machine")
require("scripts/game_state/loading_sub_states/win32/state_loading_running")
require("scripts/game_state/loading_sub_states/win32/state_loading_restart_network")
require("scripts/game_state/loading_sub_states/win32/state_loading_migrate_host")
require("scripts/settings/level_settings")

StateLoading = class(StateLoading)
StateLoading.NAME = "StateLoading"
local DO_RELOAD = false
local AFK_TIMER = 30
StateLoading.round_start_auto_join = 10
StateLoading.round_start_join_allowed = 20
StateLoading.join_lobby_timeout = 120
StateLoading.join_lobby_refresh_interval = 5
StateLoading.LoadoutResyncStates = {
	NEEDS_RESYNC = "needs_resync",
	WAIT_FOR_RPC_LOAD_LEVEL = "wait_for_rpc_load_level",
	IDLE = "idle",
	DONE = "done",
	CHECK_RESYNC = "check_resync",
	RESYNCING = "resyncing"
}
local RPCS = {
	"rpc_load_level"
}

local function check_bool_string(text)
	if text == "false" then
		return false
	else
		return text
	end
end

StateLoading.on_enter = function (self, param_block)
	print("[Gamestate] Enter state StateLoading")
	Managers.load_time:start_timer()

	if not Managers.play_go:installed() then
		Managers.play_go:set_install_speed("suspended")
	end

	if PLATFORM == "xb1" then
		Application.set_kinect_enabled(true)
	end

	if PLATFORM ~= "win32" then
		Managers.chat:set_chat_enabled(Application.user_setting("chat_enabled"))
	end

	Framerate.set_low_power()
	Wwise.set_state("inside_waystone", "false")

	self._registered_rpcs = false
	self._loading_view_setup_is_done = false

	self:set_loadout_resync_state(StateLoading.LoadoutResyncStates.IDLE)
	self:_setup_garbage_collection()
	self:_setup_world()
	self:_setup_input()
	self:_parse_loading_context()
	self:_create_loading_view()
	self:_setup_end_of_level_ui()
	self:_setup_first_time_ui()
	self:_setup_init_network_view()
	Managers.popup:set_input_manager(self._input_manager)

	if Managers.rcon ~= nil then
		Managers.rcon:set_input_manager(self._input_manager)
	end

	Managers.chat:set_input_manager(self._input_manager)
	self:_setup_level_transition()
	self:_setup_state_machine()
	self:_unmute_all_world_sounds()

	if self._switch_to_tutorial_backend then
		Managers.backend:start_tutorial()
		Managers.mechanism:choose_next_state(self._wanted_tutorial_state)
		Managers.mechanism:progress_state()

		self.parent.loading_context.switch_to_tutorial_backend = nil
		self.parent.loading_context.wanted_tutorial_state = nil
	elseif LAUNCH_MODE == "attract_benchmark" then
		Managers.backend:start_benchmark()
	end

	if self._lobby_client ~= nil and not self._lobby_client:is_dedicated_server() then
		Managers.party:set_leader(self._lobby_client:lobby_host())
	end

	Managers.transition:hide_icon_background()
	Managers.transition:fade_out(GameSettings.transition_fade_out_speed)
	Managers.light_fx:set_lightfx_color_scheme("loading")

	self._menu_setup_done = false

	if PLATFORM == "xb1" and self._lobby_host then
		Managers.account:set_round_id()
	end

	if self._network_client then
		self._network_client.voip:set_input_manager(self._input_manager)
	end

	if self._network_server then
		self._network_server.voip:set_input_manager(self._input_manager)
	end

	if self.parent.loading_context.finished_tutorial then
		self.parent.loading_context.finished_tutorial = nil
		self.parent.loading_context.show_profile_on_startup = true

		if not Managers.play_go:installed() then
			self._wanted_state = StateTitleScreen
			self._teardown_network = true
		end
	end

	self._has_invitation_error = false

	if DEDICATED_SERVER then
		local level_key = self:get_next_level_key()

		if not self:loading_view_setup_done() then
			self:setup_loading_view(level_key)
		end
	end
end

StateLoading.set_loadout_resync_state = function (self, state)
	fassert(table.contains(StateLoading.LoadoutResyncStates, state), "[StateLoading] State %s not found in LoadoutResyncStates", tostring(state))

	self._loadout_resync_state = state
end

StateLoading.loadout_resync_state = function (self)
	return self._loadout_resync_state
end

StateLoading._setup_input = function (self)
	local input_manager = InputManager:new()
	Managers.input = input_manager
	self._input_manager = input_manager

	input_manager:initialize_device("keyboard", 1)
	input_manager:initialize_device("mouse", 1)
	input_manager:initialize_device("gamepad", 1)
	input_manager:create_input_service("Player", "PlayerControllerKeymaps", "PlayerControllerFilters")
	input_manager:map_device_to_service("Player", "keyboard")
	input_manager:map_device_to_service("Player", "mouse")
	input_manager:map_device_to_service("Player", "gamepad")
	input_manager:create_input_service("ingame_menu", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("ingame_menu", "keyboard")
	input_manager:map_device_to_service("ingame_menu", "mouse")
	input_manager:map_device_to_service("ingame_menu", "gamepad")
end

StateLoading._parse_loading_context = function (self)
	local loading_context = self.parent.loading_context

	if loading_context then
		self._network_server = loading_context.network_server
		self._network_client = loading_context.network_client
		self._lobby_host = loading_context.lobby_host
		self._lobby_client = loading_context.lobby_client
		self._checkpoint_data = loading_context.checkpoint_data
		self._quickplay_bonus = loading_context.quickplay_bonus
		self._level_end_view_context = loading_context.level_end_view_context
		self._switch_to_tutorial_backend = loading_context.switch_to_tutorial_backend
		self._wanted_tutorial_state = loading_context.wanted_tutorial_state
		self._saved_scoreboard_stats = loading_context.saved_scoreboard_stats
	end
end

StateLoading._setup_garbage_collection = function (self)
	local assert_on_leak = true

	GarbageLeakDetector.run_leak_detection(assert_on_leak)
	GarbageLeakDetector.register_object(self, "StateLoadingRunning")
end

StateLoading._setup_world = function (self)
	self._world_name = "loading_world"
	self._viewport_name = "loading_viewport"
	self._world = Managers.world:create_world(self._world_name, GameSettingsDevelopment.default_environment, nil, nil, Application.DISABLE_PHYSICS, Application.DISABLE_APEX_CLOTH)
	self._viewport = ScriptWorld.create_viewport(self._world, self._viewport_name, "overlay", 1)
end

StateLoading._setup_init_network_view = function (self)
	if Development.parameter("goto_endoflevel") and false then
		require("scripts/game_state/state_loading")

		local async = false

		Managers.package:load("resource_packages/levels/dicegame", "state_loading", nil, async)

		self.parent.loading_context.play_end_of_level_game = true
		self._wanted_state = StateLoading
	else
		require("scripts/game_state/state_ingame")

		self._wanted_state = StateIngame
	end
end

StateLoading._setup_end_of_level_ui = function (self)
	if self._level_end_view_context then
		self._level_end_view_context.lobby = self._lobby_host or self._lobby_client
		self._level_end_view_wrappers = {
			LevelEndViewWrapper:new(self._level_end_view_context)
		}

		self._level_end_view_wrappers[1]:start()

		self._level_end_view_context = nil
		self.parent.loading_context.level_end_view_context = nil
	end
end

StateLoading._setup_first_time_ui = function (self)
	local loading_context = self.parent.loading_context

	if (loading_context.first_time or loading_context.gamma_correct or loading_context.play_trailer) and not GameSettingsDevelopment.disable_intro_trailer and not script_data.skip_intro_trailer then
		local mechanism = Managers.mechanism:game_mechanism()
		local inn_level_name = mechanism:get_hub_level_key()
		local level_name = (Boot.loading_context and Boot.loading_context.level_key) or inn_level_name
		local auto_skip = nil
		local params = {}

		if loading_context.level_transition_handler then
			local next_level_key = loading_context.level_transition_handler:get_next_level_key()
			params.is_prologue = next_level_key == "prologue"
		else
			params.is_prologue = false
		end

		local platform = PLATFORM

		if platform == "win32" then
			if Development.parameter("attract_mode") then
				level_name = BenchmarkSettings.auto_host_level or level_name
			end

			level_name = check_bool_string(Development.parameter("auto_host_level")) or level_name
			local level_settings = LevelSettings[level_name]
			auto_skip = not level_settings.hub_level
			auto_skip = loading_context.join_lobby_data or Development.parameter("auto_join") or auto_skip or Development.parameter("skip_splash")

			if not auto_skip and Development.parameter("weave_name") then
				auto_skip = true
			end

			local save_data = SaveData
			params.gamma = not save_data.gamma_corrected
			params.trailer = Application.user_setting("play_intro_cinematic")
		elseif platform == "ps4" or platform == "xb1" then
			level_name = check_bool_string(Development.parameter("auto_host_level")) or level_name
			local level_settings = LevelSettings[level_name]
			auto_skip = not level_settings.hub_level
			auto_skip = loading_context.join_lobby_data or Development.parameter("auto_join") or auto_skip or Development.parameter("skip_splash")

			if not auto_skip and Development.parameter("weave_name") then
				auto_skip = true
			end

			params.gamma = loading_context.gamma_correct
			params.trailer = loading_context.play_trailer or Application.user_setting("play_intro_cinematic")

			if params.gamma or params.trailer then
				auto_skip = false
			end

			params.is_prologue = level_name == "prologue"
		end

		print("[StateLoading] Auto Skip: ", auto_skip)

		loading_context.gamma_correct = nil
		loading_context.play_trailer = nil
		self._first_time_view = TitleLoadingUI:new(self._world, params, auto_skip)

		Managers.transition:hide_loading_icon()
		Managers.chat:enable_gui(false)
		self._loading_view:deactivate()
	end

	loading_context.first_time = nil
end

StateLoading._unmute_all_world_sounds = function (self)
	Managers.music:trigger_event("unmute_all_world_sounds")
end

StateLoading._get_game_difficulty = function (self)
	local game_difficulty = Managers.mechanism:get_difficulty()

	if self._lobby_host then
		local stored_lobby_data = self._lobby_host:get_stored_lobby_data()

		if stored_lobby_data and stored_lobby_data.difficulty then
			game_difficulty = stored_lobby_data.difficulty
		end
	elseif self._lobby_client then
		local stored_lobby_data = self._lobby_client:get_stored_lobby_data()

		if stored_lobby_data and stored_lobby_data.difficulty then
			game_difficulty = stored_lobby_data.difficulty
		end
	end

	return game_difficulty or "normal"
end

StateLoading._create_loading_view = function (self, level_key, act_progression_index)
	if DEDICATED_SERVER then
		return
	end

	local game_difficulty = self:_get_game_difficulty()
	local ui_context = {
		world = self._world,
		input_manager = self._input_manager,
		level_key = level_key,
		game_difficulty = game_difficulty,
		world_manager = Managers.world,
		chat_manager = Managers.chat,
		profile_synchronizer = self._profile_synchronizer,
		act_progression_index = act_progression_index,
		return_to_pc_menu = self.parent.loading_context.return_to_pc_menu
	}
	self._loading_view = LoadingView:new(ui_context)
	self.parent.loading_context.return_to_pc_menu = nil
end

StateLoading._trigger_loading_view = function (self, level_key, act_progression_index)
	level_key = level_key or self._level_transition_handler:default_level_key()

	if not self._loading_music_triggered then
		if not Development.parameter("gdc") then
			local level_settings = LevelSettings[level_key]
			local weave_name = (self._lobby_client and self._lobby_client:lobby_data("weave_name")) or Managers.weave:get_next_weave() or Development.parameter("weave_name")
			local weave_template = WeaveSettings.templates[weave_name]

			if weave_template then
				self._weave_wwise_events = self:_trigger_weave_sound_events(weave_template, level_key, level_settings.is_arena)
			else
				self._wwise_event = self:_trigger_sound_events(level_key)

				self._loading_view:trigger_subtitles(self._wwise_event, Managers.time:time("main"))
			end
		end

		local event_name = nil
		local active_weave = Managers.weave:get_active_weave()

		if active_weave then
			event_name = "reset_between_winds"
		else
			event_name = "Play_loading_screen_music"
		end

		if act_progression_index and act_progression_index >= 1 and act_progression_index < 4 then
			event_name = event_name .. "_act" .. act_progression_index
		elseif act_progression_index and act_progression_index >= 4 then
			event_name = event_name .. "_finished"
		end

		Managers.music:trigger_event(event_name)
	end

	self._activate_loading_view = true
	self._loading_music_triggered = true

	Managers.transition:hide_icon_background()
	Managers.transition:force_fade_in()
end

StateLoading.setup_loading_view = function (self, level_key)
	self._level_key = level_key or self._level_transition_handler:default_level_key()

	if not DEDICATED_SERVER then
		local package_manager = Managers.package

		if self._ui_package_name and (package_manager:has_loaded(self._ui_package_name, "global_loading_screens") or package_manager:is_loading(self._ui_package_name)) then
			package_manager:unload(self._ui_package_name, "global_loading_screens")
		end

		local level_key = self._level_key
		local level_settings = LevelSettings[level_key]
		local weave_name = Managers.weave:get_next_weave() or Development.parameter("weave_name")

		if level_settings.game_mode == "weave" then
			local weave_name = (self._lobby_client and self._lobby_client:lobby_data("weave_name")) or weave_name

			if not weave_name or weave_name == "false" then
				if PLATFORM == "xb1" and not self._lobby_client:is_updating_lobby_data() then
					self._lobby_client:force_update_lobby_data()
				end

				return
			end

			local weave_template = WeaveSettings.templates[weave_name]
			local objectives = weave_template.objectives
			local objective = objectives[1]
			local level_id = objective.level_id
			local level_key = LevelSettings[level_id].level_key
			local wind_name = weave_template.wind

			if level_settings.is_arena then
				local level_key = self._level_key
				local package_name = LevelSettings[level_key].loading_ui_package_name
				self._ui_package_name = "resource_packages/loading_screens/" .. package_name
				self._loading_material_path = nil
				self._loading_material_name = nil
			else
				self._ui_package_name = "resource_packages/loading_screens/" .. "weaves/" .. level_key .. "/" .. level_key .. "_" .. wind_name
				self._loading_material_path = "weaves/" .. level_key .. "/" .. level_key .. "_" .. wind_name
				self._loading_material_name = level_key .. "_" .. wind_name
			end

			self._weave_data = {
				weave_display_name = weave_template.display_name,
				location_display_name = level_settings.display_name,
				wind_name = weave_template.wind,
				is_arena = level_settings.is_arena,
				objective_name = objective.display_name
			}
		else
			local package_name = LevelSettings[level_key].loading_ui_package_name
			self._ui_package_name = "resource_packages/loading_screens/" .. package_name
			self._loading_material_path = nil
			self._loading_material_name = nil
			self._weave_data = nil
		end

		local act_progression_index = nil

		if not package_manager:has_loaded(self._ui_package_name) and not package_manager:has_loaded(self._ui_package_name, "global_loading_screens") then
			package_manager:load(self._ui_package_name, "global_loading_screens", callback(self, "cb_loading_screen_loaded", self._level_key, act_progression_index), true, true)
		else
			self:cb_loading_screen_loaded(self._level_key, act_progression_index, true)
		end
	end

	self._loading_view_setup_is_done = true
end

StateLoading.loading_view_setup_done = function (self)
	return self._loading_view_setup_is_done
end

StateLoading.setup_menu_assets = function (self)
	local reference_name = "menu_assets"
	local package_name_ingame = "resource_packages/menu_assets"
	local package_manager = Managers.package
	local ingame_package_loaded = package_manager:has_loaded(package_name_ingame, reference_name) or package_manager:is_loading(package_name_ingame, reference_name)
	local load_package_path = nil

	if not ingame_package_loaded then
		load_package_path = package_name_ingame
	end

	if load_package_path then
		package_manager:load(load_package_path, reference_name, nil, true, true)

		self._ui_loading_package_reference_name = reference_name
		self._ui_loading_package_path = load_package_path
	end

	self._menu_setup_done = true
end

StateLoading.menu_assets_setup_done = function (self)
	return self._menu_setup_done
end

StateLoading.cb_loading_screen_loaded = function (self, level_key, act_progression_index, skip_fade)
	if self._first_time_view or self._level_end_view_wrappers then
		local game_difficulty = self:_get_game_difficulty()

		self._loading_view:texture_resource_loaded(level_key, act_progression_index, game_difficulty, self._loading_material_path, self._loading_material_name, self._weave_data)
	elseif skip_fade then
		self:cb_loading_screen_change_fade(level_key, act_progression_index, skip_fade)
	else
		Managers.transition:fade_in(3, callback(self, "cb_loading_screen_change_fade", level_key, act_progression_index))
	end
end

StateLoading.cb_loading_screen_change_fade = function (self, level_key, act_progression_index, skip_fade)
	local game_difficulty = self:_get_game_difficulty()

	self._loading_view:texture_resource_loaded(level_key, act_progression_index, game_difficulty, self._loading_material_path, self._loading_material_name, self._weave_data)
	self:_trigger_loading_view(level_key, act_progression_index)

	if not skip_fade then
		Managers.transition:fade_out(3)
	end
end

StateLoading._trigger_sound_events = function (self, level_key)
	local level_settings = LevelSettings[level_key]
	local wwise_events = level_settings.loading_screen_wwise_events

	if wwise_events ~= nil then
		local wwise_event = wwise_events[math.random(1, #wwise_events)]
		local wwise_playing_id, wwise_source_id = Managers.music:trigger_event(wwise_event)
		self.wwise_playing_id = wwise_playing_id

		return wwise_event
	end
end

StateLoading._trigger_weave_sound_events = function (self, weave_template, level_key, is_arena)
	local wwise_events = nil
	local level_settings = LevelSettings[level_key]
	local wind_name = weave_template.wind
	local wind_settings = WindSettings[wind_name]
	local wind_wwise_events = wind_settings.loading_screen_wwise_events

	if is_arena then
		local primary_arena_wwise_event = wind_wwise_events.primary_arena_wwise_events[Math.random(#wind_wwise_events.primary_arena_wwise_events)]
		local secondary_arena_wwise_event = wind_wwise_events.secondary_arena_wwise_events[Math.random(#wind_wwise_events.secondary_arena_wwise_events)]
		wwise_events = {
			primary_arena_wwise_event,
			secondary_arena_wwise_event
		}
	else
		local lore_wwise_event = wind_wwise_events.lore[Math.random(#wind_wwise_events.lore)]
		local mechanics_wwise_event = wind_wwise_events.mechanics[Math.random(#wind_wwise_events.mechanics)]
		local objective_wwise_event = nil

		if not level_settings.is_arena then
			local first_objective = 1
			local weave_objective_data = weave_template.objectives[first_objective]
			local objective_name = weave_objective_data.display_name
			local wwise_objective_events = wind_wwise_events.objectives[objective_name]
			objective_wwise_event = wwise_objective_events[Math.random(#wwise_objective_events)]
		end

		wwise_events = {
			lore_wwise_event,
			mechanics_wwise_event,
			objective_wwise_event
		}
	end

	Managers.music:stop_event_queue("weave_loading_vo")

	local delay = 0.5
	local wwise_playing_id, wwise_source_id = Managers.music:trigger_event_queue("weave_loading_vo", wwise_events, delay)
	self.wwise_playing_id = wwise_playing_id

	return wwise_events
end

StateLoading._setup_state_machine = function (self)
	local params = {
		world = self._world,
		viewport = self._viewport,
		loading_view = self._loading_view,
		level_transition_handler = self._level_transition_handler,
		starting_tutorial = self._switch_to_tutorial_backend
	}

	if self.parent.loading_context.restart_network then
		self._machine = GameStateMachine:new(self, StateLoadingRestartNetwork, params, true)
	elseif self.parent.loading_context.host_migration_info then
		self._machine = GameStateMachine:new(self, StateLoadingMigrateHost, params, true)
	else
		self._machine = GameStateMachine:new(self, StateLoadingRunning, params, true)
	end
end

StateLoading._handle_do_reload = function (self)
	if self.wwise_playing_id then
		Managers.music:stop_event_id(self.wwise_playing_id)

		self.wwise_playing_id = nil
	end

	if DO_RELOAD and self._wwise_event then
		self.wwise_playing_id = Managers.music:trigger_event(self._wwise_event)
		DO_RELOAD = false
	elseif DO_RELOAD and self._weave_wwise_events then
		Managers.music:stop_event_queue("weave_loading_vo")

		local delay = 0.5
		self.wwise_playing_id = Managers.music:trigger_event_queue("weave_loading_vo", self._weave_wwise_events, delay)
		DO_RELOAD = false
	end
end

StateLoading.set_invitation_error = function (self)
	self._has_invitation_error = true
end

StateLoading.update = function (self, dt, t)
	if script_data.subtitle_debug then
		self:_handle_do_reload()
	end

	Network.update_receive(dt, self._network_event_delegate.event_table)
	self:_update_network(dt)

	if PLATFORM == "ps4" and not self._popup_id and not self._handled_psn_client_error and self._level_transition_handler:all_packages_loaded() and self._level_transition_handler.enemy_package_loader:loading_completed() and Managers.backend:profiles_loaded() and self:global_packages_loaded() then
		local psn_client_error = Managers.account:psn_client_error()

		if psn_client_error then
			printf("[StateLoading] PSN CLIENT ERROR %s", psn_client_error)
			self:create_popup("failure_psn_client_error", "popup_error_topic", "restart_as_server", "menu_accept")

			self._handled_psn_client_error = true
			self._wanted_state = StateTitleScreen
		end
	end

	if PLATFORM ~= "win32" and self._has_invitation_error and not self._popup_id then
		self:create_popup("invite_broken", "invite_error", "restart_as_server", "menu_accept")

		self._wanted_state = StateTitleScreen
		self._has_invitation_error = false
	end

	if script_data.debug_enabled then
		VisualAssertLog.update(dt)
	end

	Managers.backend:update(dt)
	Managers.input:update(dt)
	self._level_transition_handler:update(dt)

	if self._should_start_breed_loading and self._level_transition_handler:all_packages_loaded() then
		local loading_context = self.parent.loading_context
		local weave_name = Managers.weave:get_next_weave() or Development.parameter("weave_name")
		local weave_objective_index = Managers.weave:get_next_objective() or 1
		local weave_data = WeaveSettings.templates[weave_name]
		local level_key = self._level_transition_handler.level_key
		local weave_objective_data = nil

		if weave_data then
			weave_objective_data = weave_data.objectives[weave_objective_index]

			ConflictUtils.patch_terror_events_with_weaves(level_key, weave_data, weave_objective_index)
		end

		local level_seed = Managers.mechanism:get_level_seed()
		local locked_director_functions = Managers.mechanism:get_locked_director_functions()

		self._level_transition_handler.enemy_package_loader:setup_startup_enemies(level_key, level_seed, locked_director_functions, weave_objective_data)

		self._should_start_breed_loading = nil
	end

	Managers.music:update(dt, t)

	if Managers.voice_chat then
		Managers.voice_chat:update(dt, t)
	end

	if self._level_end_view_wrappers then
		local level_end_view_wrapper = self._level_end_view_wrappers[1]

		level_end_view_wrapper:update(dt, t)

		if level_end_view_wrapper:done() then
			if level_end_view_wrapper:do_retry() then
				self._wanted_state = StateLoading
				self._do_reload = true
			end

			self:_tear_down_level_end_view_wrappers()
			Managers.weave:clear_weave_data()
		end
	elseif self._first_time_view then
		self._first_time_view:update(dt, t)
	elseif self._loading_view and not self._do_reload then
		if self._activate_loading_view then
			self._loading_view:activate()
			Managers.transition:fade_out(GameSettings.transition_fade_out_speed)

			self._activate_loading_view = nil
		end

		self._loading_view:update(dt)
	end

	self:_update_loading_screen(dt, t)
	self._machine:update(dt, t)
	self:_update_lobbies(dt, t)

	if Managers.matchmaking then
		Managers.matchmaking:update(dt, t)
	end

	if Managers.game_server then
		Managers.game_server:update(dt, t)
	end

	if Managers.eac ~= nil then
		Managers.eac:update(dt, t)
	end

	local menu_active = false
	local menu_input_service = nil

	if self._level_end_view_wrappers then
		local level_end_view = self._level_end_view_wrappers[1]:level_end_view()

		if level_end_view:enable_chat() then
			menu_active = true
			menu_input_service = level_end_view:active_input_service()
		end
	end

	if Managers.rcon ~= nil then
		Managers.rcon:update(dt, t, menu_active, menu_input_service)
	end

	Managers.chat:update(dt, t, menu_active, menu_input_service)
	Network.update_transmit(dt)

	return self:_try_next_state(dt)
end

StateLoading._update_network = function (self, dt)
	if self._network_server then
		self._network_server:update(dt)

		local disconnected = self._network_server:disconnected()

		if disconnected and not self._popup_id then
			local text_id = self:_get_lost_connection_text_id()

			self:create_popup(text_id, "popup_error_topic", "restart_as_server", "menu_accept")
			self:_destroy_lobby_host()
			self._network_server:disconnect_all_peers("unknown_error")
			self._network_server:destroy()

			self._network_server = nil
		end
	elseif self._network_client then
		self._network_client:update(dt)

		if self._network_client:is_in_post_game() and not self._in_post_game_popup_id and not self._in_post_game_popup_shown then
			self._in_post_game_popup_id = Managers.popup:queue_popup(Localize("popup_is_in_post_game"), Localize("matchmaking_status_waiting_for_host"), "return_to_inn", Localize("return_to_inn"))
			self._in_post_game_popup_shown = true

			Managers.popup:activate_timer(self._in_post_game_popup_id, 200, "timeout", "center", false, function (timer)
				return string.format(Localize("timer_max_time") .. ": %.2d:%.2d", (timer / 60) % 60, timer % 60)
			end, 28)
		elseif not self._network_client:is_in_post_game() and self._in_post_game_popup_id then
			Managers.popup:cancel_popup(self._in_post_game_popup_id)

			self._in_post_game_popup_id = nil
		end

		local bad_state = self._network_client:has_bad_state()

		if bad_state and not self._popup_id then
			self._wanted_state = StateTitleScreen

			if self._in_post_game_popup_id then
				Managers.popup:cancel_popup(self._in_post_game_popup_id)

				self._in_post_game_popup_id = nil
			end

			local fail_reason = self._network_client.fail_reason or "broken_connection"

			self._network_client:destroy()

			self._network_client = nil

			self._level_transition_handler.enemy_package_loader:network_context_destroyed()

			if self._lobby_client then
				self:create_popup(fail_reason, "popup_error_topic", "restart_as_server", "menu_accept")
				self:_destroy_lobby_client()
			end
		end
	end
end

StateLoading._get_lost_connection_text_id = function (self)
	local text_id = nil

	if PLATFORM == "win32" then
		if rawget(_G, "Steam") then
			text_id = "failure_start_no_steam"
		else
			text_id = "broken_connection"
		end
	elseif PLATFORM == "xb1" then
		if not Network.xboxlive_client_exists() then
			text_id = "failure_start_xbox_live_client"
		else
			text_id = "failure_start_xbox_lobby_create"
		end
	elseif PLATFORM == "ps4" then
		text_id = "failure_psn_client_error"
	else
		text_id = "failure_start"
	end

	return text_id
end

StateLoading._update_lobbies = function (self, dt, t)
	if not self:global_packages_loaded() then
		return
	end

	if self._network_transmit then
		self._network_transmit:transmit_local_rpcs()
	end

	if self._password_request ~= nil then
		self._password_request:update(dt)

		local action, user_data, password = self._password_request:result()

		if action ~= nil then
			if action == "join" then
				self._server_lobby = GameServerLobbyClient:new(user_data.network_options, user_data.game_server_data, password)
			else
				self._teardown_network = true
				self._permission_to_go_to_next_state = true
				self._wanted_state = StateTitleScreen
			end

			self._password_request:destroy()

			self._password_request = nil
		end
	end

	if self._lobby_host then
		local lobby_host = self._lobby_host
		local old_state = lobby_host.state

		lobby_host:update(dt)

		if lobby_host:is_joined() and not lobby_host:network_initialized() and self._lobby_host:lobby_host() ~= "0" then
			local lobby_host = self._lobby_host

			if not self._network_server then
				self:host_joined()
			end

			local own_peer_id = Network.peer_id()
			local host_peer_id = lobby_host:lobby_host()

			self:setup_chat_manager(lobby_host, host_peer_id, own_peer_id, true)
			self:setup_deed_manager(lobby_host, host_peer_id, own_peer_id, true, self._network_server)
			self:setup_enemy_package_loader(lobby_host, host_peer_id, own_peer_id)
			self:setup_global_managers(lobby_host, host_peer_id, own_peer_id)
			lobby_host:set_network_initialized(true)
		elseif self._lobby_host.state == LobbyState.FAILED and not self._popup_id then
			local text_id = nil

			if PLATFORM == "win32" then
				if rawget(_G, "Steam") then
					if Steam.connected() then
						text_id = "failure_start_steam_lobby_create"
					else
						text_id = "failure_start_no_steam"
					end
				else
					text_id = "failure_start_no_lan"
				end
			elseif PLATFORM == "xb1" then
				if not Network.xboxlive_client_exists() then
					text_id = "failure_start_xbox_live_client"
				else
					text_id = "failure_start_xbox_lobby_create"
				end
			elseif PLATFORM == "ps4" then
				text_id = "failure_start_psn_lobby_create"
			else
				text_id = "failure_start"
			end

			self:_destroy_lobby_host()

			if self._network_server then
				self._network_server:disconnect_all_peers("unknown_error")
				self._network_server:destroy()

				self._network_server = nil
			end

			self:create_popup(text_id, "popup_error_topic", "restart_as_server", "menu_accept")
		end
	elseif self._lobby_finder then
		self:_update_lobby_join(dt, t)
	elseif self._server_lobby then
		self:_update_server_lobby_join(dt, t)
	elseif self._lobby_client then
		self._lobby_client:update(dt)

		local new_lobby_state = self._lobby_client.state

		if not self._lobby_verified and self._lobby_client:is_joined() then
			self:_verify_joined_lobby()
		elseif self._lobby_client:failed() and not self._popup_id then
			self:_destroy_lobby_client()
			self:create_popup("failure_start_join_server", "popup_error_topic", "restart_as_server", "menu_accept")
			Managers.transition:fade_out(GameSettings.transition_fade_out_speed)
		end
	end

	if PLATFORM == "xb1" and self._waiting_for_cleanup and Managers.account:all_lobbies_freed() then
		self:setup_join_lobby(true)

		self._waiting_for_cleanup = nil
	end
end

StateLoading._verify_joined_lobby = function (self)
	local host = self._lobby_client:lobby_host()
	local lobby_data = self._lobby_client:get_stored_lobby_data()
	local lobby_id = lobby_data.id
	local lobby_network_hash = lobby_data.network_hash
	local lobby_game_mode_id = lobby_data.game_mode
	local lobby_difficulty = lobby_data.difficulty

	if lobby_id then
		lobby_network_hash = LobbyInternal.get_lobby_data_from_id_by_key(lobby_id, "network_hash") or lobby_network_hash
		lobby_game_mode_id = LobbyInternal.get_lobby_data_from_id_by_key(lobby_id, "game_mode") or lobby_game_mode_id
		lobby_difficulty = LobbyInternal.get_lobby_data_from_id_by_key(lobby_id, "difficulty") or lobby_difficulty
	end

	lobby_network_hash = lobby_network_hash or self._lobby_client:lobby_data("network_hash")
	lobby_game_mode_id = lobby_game_mode_id or self._lobby_client:lobby_data("game_mode")
	lobby_difficulty = lobby_difficulty or self._lobby_client:lobby_data("difficulty")
	local lobby_game_mode = (PLATFORM == "ps4" and lobby_game_mode_id) or (lobby_game_mode_id and NetworkLookup.game_modes[tonumber(lobby_game_mode_id)])

	if lobby_game_mode == "weave_find_group" then
		lobby_game_mode = "weave"
	end

	local ready_to_compare_data = host ~= "0" and lobby_network_hash and lobby_game_mode and lobby_difficulty and self._popup_id == nil

	if ready_to_compare_data then
		local client_network_hash = self._lobby_client.network_hash
		local has_required_dlcs = true
		local required_dlcs = {}
		local game_mode_settings = GameModeSettings[lobby_game_mode] or {}

		if game_mode_settings.required_dlc then
			required_dlcs[game_mode_settings.required_dlc] = true
		end

		local difficulty_settings = DifficultySettings[lobby_difficulty]

		if difficulty_settings and difficulty_settings.dlc_requirement then
			required_dlcs[difficulty_settings.dlc_requirement] = true
		end

		for dlc_name, _ in pairs(required_dlcs) do
			if not Managers.unlock:is_dlc_unlocked(dlc_name) then
				has_required_dlcs = false

				break
			end
		end

		local has_unlocked_game_mode = true
		local game_mode_error_message = ""

		if not script_data.unlock_all_levels and game_mode_settings.extra_requirements_function and not game_mode_settings.extra_requirements_function() then
			has_unlocked_game_mode = false
		end

		local has_unlocked_difficulty = true
		local difficulty_error_message = ""

		if not Development.parameter("unlock_all_difficulties") and not game_mode_settings.disable_difficulty_check then
			local best_aquired_power_level = BulldozerPlayer.best_aquired_power_level()

			if best_aquired_power_level < difficulty_settings.required_power_level then
				has_unlocked_difficulty = false
				local required_power_level_localized = Localize("required_power_level")
				difficulty_error_message = string.format("* %s: %s", required_power_level_localized, tostring(UIUtils.presentable_hero_power_level(difficulty_settings.required_power_level))) .. "\n"
			end

			if difficulty_settings.extra_requirement_name then
				local extra_requirement_data = ExtraDifficultyRequirements[difficulty_settings.extra_requirement_name]

				if not extra_requirement_data.requirement_function() then
					has_unlocked_difficulty = false
					difficulty_error_message = difficulty_error_message .. "* " .. Localize(extra_requirement_data.description_text)
				end
			end
		end

		if not has_required_dlcs then
			self:_destroy_lobby_client()
			self:create_popup("failure_start_join_server_required_dlc_missing", "popup_error_topic", "restart_as_server", "menu_accept")
		elseif not has_unlocked_game_mode then
			self:_destroy_lobby_client()
			self:create_popup("failure_start_join_server_game_mode_requirements_failed", "popup_error_topic", "restart_as_server", "menu_accept")
		elseif not has_unlocked_difficulty then
			self:_destroy_lobby_client()

			local failure_start_join_server_difficulty_requirement_failed = Localize("failure_start_join_server_difficulty_requirements_failed")

			self:create_popup(failure_start_join_server_difficulty_requirement_failed, "popup_error_topic", "restart_as_server", "menu_accept", difficulty_error_message)
		elseif client_network_hash == lobby_network_hash then
			if self._handle_new_lobby_connection then
				self:setup_network_client(self._joined_matchmaking_lobby)

				local own_peer_id = Network.peer_id()

				self:setup_chat_manager(self._lobby_client, host, own_peer_id, false)
				self:setup_deed_manager(self._lobby_client, host, own_peer_id, false, nil)
				self:setup_enemy_package_loader(self._lobby_client, host, own_peer_id)
				self:setup_global_managers(self._lobby_client, host, own_peer_id)
			end
		else
			self:_destroy_lobby_client()
			self:create_popup("failure_start_join_server_incorrect_hash", "popup_error_topic", "restart_as_server", "menu_accept", client_network_hash, lobby_network_hash)
		end

		self._lobby_verified = true
	end
end

StateLoading._destroy_lobby_client = function (self)
	self._lobby_client:destroy()

	self._lobby_client = nil
	self.parent.loading_context.lobby_client = nil

	Managers.account:set_current_lobby(nil)

	if self._level_end_view_wrappers then
		for i, level_end_view_wrapper in ipairs(self._level_end_view_wrappers) do
			level_end_view_wrapper:left_lobby()
		end
	end

	self._wanted_state = StateTitleScreen
end

StateLoading._destroy_lobby_host = function (self)
	self._lobby_host:destroy()

	self._lobby_host = nil
	self.parent.loading_context.lobby_host = nil

	Managers.account:set_current_lobby(nil)

	if Managers.matchmaking then
		if self._registered_rpcs then
			Managers.matchmaking:unregister_rpcs()
		end

		Managers.matchmaking:destroy()

		Managers.matchmaking = nil
	end

	self._wanted_state = StateTitleScreen
end

StateLoading._update_lobby_join = function (self, dt, t)
	local unique_server_name = Development.parameter("unique_server_name")
	local found = false
	local lobby_finder = self._lobby_finder

	lobby_finder:update(dt)

	local lobbies = lobby_finder:lobbies()

	for i, lobby in ipairs(lobbies) do
		local auto_join_this_lobby = false

		if not self._lobby_to_join and not self._host_to_join and unique_server_name and lobby.unique_server_name == unique_server_name then
			auto_join_this_lobby = true
		elseif self._lobby_to_join and self._lobby_to_join == lobby.id then
			auto_join_this_lobby = true
		elseif self._host_to_join and self._host_to_join == lobby.host then
			auto_join_this_lobby = true
		end

		if lobby.valid and auto_join_this_lobby then
			local network_options = Managers.lobby:network_options()

			self:_load_global_packages()

			self._lobby_client = LobbyClient:new(network_options, lobby)
			self._lobby_finder = nil
			self._handle_new_lobby_connection = true
			found = true

			Managers.account:set_current_lobby(self._lobby_client.lobby)

			if self._lobby_joined_callback then
				self._lobby_joined_callback()

				self._lobby_joined_callback = nil
			end

			break
		end
	end

	if not found and self._lobby_finder_timeout < t and not self._popup_id then
		self._lobby_finder = nil
		local name = self._host_to_join_name or Development.parameter("unique_server_name")

		self:create_popup("failure_start_join_server_timeout", "failure_find_host", "restart_as_server", "menu_accept", name)

		self._wanted_state = StateTitleScreen
	end

	if self._lobby_finder and not found and self._lobby_finder_refresh_timer < t then
		self._lobby_finder:refresh()

		self._lobby_finder_refresh_timer = t + StateLoading.join_lobby_refresh_interval
	end
end

StateLoading._update_server_lobby_join = function (self, dt, t)
	local lobby = self._server_lobby

	lobby:update(dt)

	local state = lobby:state()

	if lobby:is_joined() then
		self._load_global_packages()

		self._lobby_client = lobby
		self._server_lobby = nil
		self._handle_new_lobby_connection = true

		Managers.account:set_current_lobby(self._lobby_client.lobby)

		if self._lobby_joined_callback then
			self._lobby_joined_callback()

			self._lobby_joined_callback = nil
		end

		return
	elseif lobby:failed() then
		self._server_lobby:destroy()

		self._server_lobby = nil

		self:create_popup("failure_start_join_server", "popup_error_topic", "restart_as_server", "menu_accept")
		Managers.transition:fade_out(GameSettings.transition_fade_out_speed)

		self._wanted_state = StateTitleScreen

		return
	end

	if self._lobby_finder_timeout < t and not self._popup_id then
		local name = self._server_lobby:id()

		self._server_lobby:destroy()

		self._server_lobby = nil

		self:create_popup("failure_start_join_server_timeout", "failure_find_host", "restart_as_server", "menu_accept", name)

		self._wanted_state = StateTitleScreen
	end
end

StateLoading._update_loading_screen = function (self, dt, t)
	local permission_to_go_to_next_state = nil

	if self._network_server then
		local lobby_host = self._lobby_host

		if lobby_host and lobby_host:is_joined() and self._network_server:waiting_to_enter_game() then
			permission_to_go_to_next_state = true
		end
	elseif self._network_client and self._network_client.state == "waiting_enter_game" then
		permission_to_go_to_next_state = true
	end

	local waiting_for_vo = false

	if script_data.subtitle_debug and not DEDICATED_SERVER then
		local skip = Mouse.button(Mouse.button_index("left")) == 1 and Mouse.button(Mouse.button_index("right")) == 1
		waiting_for_vo = not skip

		if permission_to_go_to_next_state and waiting_for_vo then
			Debug.text("[SubtitleDebug] Waiting for both mouse buttons to progress...")
		end
	end

	local level_name = self._level_transition_handler:get_current_level_keys()

	if permission_to_go_to_next_state and not self._permission_to_go_to_next_state and not waiting_for_vo and level_name then
		local level_index = NetworkLookup.level_keys[level_name]

		if self._network_server then
			self._network_server:rpc_level_loaded(Network.peer_id(), level_index)
		end

		Managers.mechanism:load_packages()

		self._permission_to_go_to_next_state = permission_to_go_to_next_state
	end
end

StateLoading._try_next_state = function (self, dt)
	if self._popup_id then
		self:_handle_popup()
	end

	if self._join_popup_id then
		self:_handle_join_popup()
	end

	if self._in_post_game_popup_id and not Managers.account:leaving_game() then
		self:_handle_in_post_game_popup()
	elseif self._in_post_game_popup_id then
		Managers.popup:cancel_popup(self._in_post_game_popup_id)
	end

	if script_data.honduras_demo and Managers.time:get_demo_transition() then
		self._teardown_network = true
		self._join_popup_id = nil
		self._permission_to_go_to_next_state = true

		if self._first_time_view then
			self._first_time_view:force_done()
		end

		self._new_state = StateTitleScreen
	end

	if Managers.account:leaving_game() then
		if not self._ui_package_name or (self._ui_package_name and Managers.package:has_loaded(self._ui_package_name)) then
			if self._first_time_view then
				self._first_time_view:destroy()

				self._first_time_view = nil
			end

			Managers.transition:show_loading_icon()

			Managers.transition._callback = nil

			Managers.transition:force_fade_in()

			self._teardown_network = true
			self._new_state = StateTitleScreen
		end
	elseif self.offline_invite then
		self._teardown_network = true
		self._join_popup_id = nil
		self._permission_to_go_to_next_state = true

		if self._first_time_view then
			self._first_time_view:force_done()
		end

		self._new_state = StateTitleScreen
	elseif not self._transitioning then
		local ui_done = true

		if self._first_time_view then
			ui_done = self._first_time_view:is_done()

			if ui_done and not self._popup_id and not self:_packages_loaded() and self._level_key then
				self:_trigger_loading_view()
				Managers.transition:show_loading_icon()
				self._first_time_view:destroy()

				self._first_time_view = nil

				Managers.chat:enable_gui(true)
			end
		elseif self._loading_view then
			ui_done = self._loading_view:is_done()
		end

		if self._level_end_view_wrappers then
			ui_done = self:_level_end_view_done()
		end

		local backend_manager = Managers.backend

		if backend_manager:is_disconnected() and not self._popup_id then
			self:_backend_broken()
		end

		if backend_manager:is_waiting_for_user_input() then
			return
		end

		local eac_allowed_to_play = true

		if self._network_client then
			eac_allowed_to_play = self._network_client:eac_allowed_to_play()
		end

		local packages_loaded = self:_packages_loaded()
		local can_go_to_next_state = self._wanted_state and ui_done and eac_allowed_to_play and not self._popup_id

		if can_go_to_next_state then
			local ready_to_go_to_next_state = self._permission_to_go_to_next_state and packages_loaded
			local backend_is_disconnected = backend_manager:is_disconnected()

			if ready_to_go_to_next_state or backend_is_disconnected or self._teardown_network then
				local allowed_to_continue = nil

				if script_data.honduras_demo then
					allowed_to_continue = false

					if not self._loading_view:showing_press_to_continue() and not self._press_to_continue_shown then
						self._loading_view:show_press_to_continue(true)

						self._press_to_continue_shown = true

						Managers.transition:hide_loading_icon()
					else
						local device = Managers.input:get_most_recent_device()
						local any_pressed = device.any_pressed()
						self._demo_continue_pressed = self._demo_continue_pressed or any_pressed
						allowed_to_continue = self._demo_continue_pressed

						if allowed_to_continue and self._loading_view:showing_press_to_continue() then
							self._loading_view:show_press_to_continue(false)
							Managers.transition:show_loading_icon()
						end
					end
				elseif GameSettingsDevelopment.use_global_chat then
					allowed_to_continue = Irc.is_connected()
				else
					allowed_to_continue = true
				end

				if allowed_to_continue then
					local level_end_view_wrappers = self._level_end_view_wrappers

					if not level_end_view_wrappers and Managers.transition:fade_state() == "out" then
						Managers.transition:fade_in(GameSettings.transition_fade_out_speed)
						printf("[StateLoading] started fadeing in, want to go to state:%s", self._wanted_state.NAME)
					elseif level_end_view_wrappers or Managers.transition:fade_in_completed() then
						self._new_state = self._wanted_state

						printf("[StateLoading] fade_in_completed, new state:%s", self._new_state.NAME)

						if self._join_popup_id then
							Managers.popup:cancel_popup(self._join_popup_id)

							self._join_popup_id = nil
						end
					end
				end
			end
		end
	end

	if PLATFORM ~= "win32" then
		self:_handle_afk_timer(dt)
	end

	if (Managers.popup:has_popup() or Managers.account:user_detached() or Managers.account:has_popup()) and not Managers.account:leaving_game() then
		return
	end

	Managers.popup:cancel_all_popups()

	return self._new_state
end

StateLoading._handle_afk_timer = function (self, dt)
	if Managers.account:leaving_game() then
		return
	end

	if Managers.account:has_popup() or self._popup_id then
		local time = Managers.time:time("main")
		self._afk_timer = self._afk_timer or time + AFK_TIMER

		if self._afk_timer < time and (not self._ui_package_name or (self._ui_package_name and Managers.package:has_loaded(self._ui_package_name))) then
			if self._first_time_view then
				self._first_time_view:destroy()

				self._first_time_view = nil
			end

			Managers.transition:show_loading_icon()

			Managers.transition._callback = nil

			Managers.transition:force_fade_in()

			self._teardown_network = true
			self._new_state = StateTitleScreen
			self._previous_session_error = "afk_kick"

			Managers.account:initiate_leave_game()
		end
	elseif self._afk_timer then
		self._afk_timer = nil
	end
end

StateLoading._level_end_view_done = function (self)
	local level_end_view_wrapper = self._level_end_view_wrappers[1]

	return level_end_view_wrapper and level_end_view_wrapper:done()
end

StateLoading._handle_popup = function (self)
	local result = Managers.popup:query_result(self._popup_id)

	if result == "continue" then
		self._popup_id = nil
	elseif result == "restart_as_server" then
		self._teardown_network = true
		self._popup_id = nil
		self._permission_to_go_to_next_state = true

		if self._first_time_view then
			self._first_time_view:force_done()
		end
	elseif result == "quit" then
		Boot.quit_game = true
		self._teardown_network = true
		self._popup_id = nil
		self._permission_to_go_to_next_state = true

		if self._first_time_view then
			self._first_time_view:force_done()
		end
	elseif result then
		print(string.format("[StateLoading:_handle_popup] No such result handled (%s)", result))
	end
end

StateLoading._handle_join_popup = function (self)
	local result = Managers.popup:query_result(self._join_popup_id)

	if result == "cancel" or result == "timeout" then
		Managers.popup:cancel_popup(self._join_popup_id)

		self._teardown_network = true
		self._join_popup_id = nil
		self._permission_to_go_to_next_state = true

		if self._first_time_view then
			self._first_time_view:force_done()
		end

		self._new_state = StateTitleScreen
	elseif result then
		print(string.format("[StateLoading:_handle_join_popup] No such result handled (%s)", result))
	end
end

StateLoading._handle_in_post_game_popup = function (self)
	local result = Managers.popup:query_result(self._in_post_game_popup_id)

	if result then
		if result == "return_to_inn" then
			self._teardown_network = true
			self._restart_network = true
			self._permission_to_go_to_next_state = true

			if self._first_time_view then
				self._first_time_view:force_done()
			end

			self._wanted_state = StateLoading
		end

		self._in_post_game_popup_id = nil
	end
end

StateLoading._backend_broken = function (self)
	print("[StateLoading] Backend_broken, returning to StateTitleScreen")

	self._wanted_state = StateTitleScreen
	self._teardown_network = true
	self._permission_to_go_to_next_state = true

	if self._first_time_view then
		self._first_time_view:force_done()
	end

	if PLATFORM == "xb1" then
		Managers.account:initiate_leave_game()
	end
end

StateLoading.on_exit = function (self, application_shutdown)
	Framerate.set_playing()

	if self._registered_rpcs then
		self:_unregister_rpcs()
	end

	if self._password_request ~= nil then
		self._password_request:destroy()

		self._password_request = nil
	end

	self._should_start_breed_loading = nil
	local skip_signin = self.parent.loading_context.skip_signin

	if application_shutdown then
		self:_destroy_network(application_shutdown)
	elseif self._teardown_network then
		self:_destroy_network()
	else
		local loading_context = {
			level_transition_handler = self._level_transition_handler,
			network_transmit = self._network_transmit,
			checkpoint_data = self._checkpoint_data,
			quickplay_bonus = self._quickplay_bonus,
			level_end_view_wrappers = self._level_end_view_wrappers,
			saved_scoreboard_stats = self._saved_scoreboard_stats
		}

		if self._lobby_host then
			loading_context.lobby_host = self._lobby_host
			local level_key = self._level_transition_handler:get_current_level_keys()
			local stored_lobby_host_data = self._lobby_host:get_stored_lobby_data() or {}
			local country_code = nil

			if DEDICATED_SERVER then
				country_code = SteamGameServer.server_country_code()
			elseif PLATFORM == "ps4" then
				country_code = Managers.account:region()
			elseif rawget(_G, "Steam") then
				country_code = Steam.user_country_code()
			end

			stored_lobby_host_data.level_key = level_key
			stored_lobby_host_data.unique_server_name = stored_lobby_host_data.unique_server_name or LobbyAux.get_unique_server_name()
			stored_lobby_host_data.host = stored_lobby_host_data.host or Network.peer_id()
			stored_lobby_host_data.num_players = stored_lobby_host_data.num_players or 1
			stored_lobby_host_data.country_code = country_code

			self._lobby_host:set_lobby_data(stored_lobby_host_data)

			if self._lobby_host:is_dedicated_server() then
				self._lobby_host:set_level_name(Localize(LevelSettings[level_key].display_name))
			end

			loading_context.network_server = self._network_server

			self._network_server:unregister_rpcs()
			self._network_server.voip:set_input_manager(nil)
		else
			loading_context.lobby_client = self._lobby_client
			loading_context.network_client = self._network_client

			self._network_client:unregister_rpcs()
			self._network_client.voip:set_input_manager(nil)
		end

		if self._do_reload then
			local weave_manager = Managers.weave
			local current_objective_index = 1
			local current_weave = weave_manager:get_active_weave()
			local current_weave_template = WeaveSettings.templates[current_weave]
			local current_objective = current_weave_template.objectives[current_objective_index]
			local level_key = current_objective.level_id

			self._level_transition_handler:set_next_level(level_key)
			self._level_transition_handler:reload_level()
		end

		loading_context.show_profile_on_startup = self.parent.loading_context.show_profile_on_startup
		self.parent.loading_context = loading_context
	end

	self._profile_synchronizer = nil

	if self._network_event_delegate then
		self._network_event_delegate:destroy()

		self._network_event_delegate = nil
	end

	Managers.state:destroy()

	if self._first_time_view then
		self._first_time_view:destroy()

		self._first_time_view = nil
	end

	if self._loading_view then
		if self.parent.loading_context then
			self.parent.loading_context.subtitle_gui = self._loading_view:subtitle_gui()
		end

		self._loading_view:destroy()

		self._loading_view = nil
	end

	self:_tear_down_level_end_view_wrappers()
	self._machine:destroy(application_shutdown)

	if self.parent.loading_context then
		self.parent.loading_context.host_to_migrate_to = nil
		self.parent.loading_context.restart_network = nil
		self.parent.loading_context.players = nil
		self.parent.loading_context.local_player_index = nil
		self.parent.loading_context.skip_signin = skip_signin
		self.parent.loading_context.previous_session_error = self._previous_session_error

		if self._restart_network then
			self.parent.loading_context.restart_network = true
		end
	end

	ScriptWorld.destroy_viewport(self._world, self._viewport_name)
	Managers.world:destroy_world(self._world)

	local package_manager = Managers.package

	if self._ui_package_name and (package_manager:has_loaded(self._ui_package_name, "global_loading_screens") or package_manager:is_loading(self._ui_package_name)) and package_manager:can_unload(self._ui_package_name) then
		package_manager:unload(self._ui_package_name, "global_loading_screens")
	end

	Managers.music:trigger_event("Stop_loading_screen_music")

	if PLATFORM == "win32" then
		fassert(application_shutdown or self._popup_id == nil, "StateLoading added a popup right before exiting")
	else
		Managers.popup:cancel_all_popups()
	end

	Managers.popup:remove_input_manager(application_shutdown)
	Managers.chat:set_input_manager(nil)
	Managers.chat:enable_gui(true)

	if not Managers.play_go:installed() then
		Managers.play_go:set_install_speed("slow")
	end
end

StateLoading._load_global_packages = function (self)
	if not GlobalResources.loaded then
		local package_manager = Managers.package

		for i, name in ipairs(GlobalResources) do
			if not package_manager:has_loaded(name) then
				package_manager:load(name, "global", nil, true)
			end
		end

		GlobalResources.loaded = true
	end
end

StateLoading.global_packages_loaded = function (self)
	if not GlobalResources.loaded then
		self:_load_global_packages()
	end

	local package_manager = Managers.package

	for i, name in ipairs(GlobalResources) do
		if not package_manager:has_loaded(name) then
			return false
		end
	end

	return true
end

StateLoading._packages_loaded = function (self)
	if self._level_transition_handler:all_packages_loaded() and Managers.backend:profiles_loaded() then
		local network_server = self._network_server

		if not DEDICATED_SERVER and network_server and not self._has_sent_level_loaded then
			self._has_sent_level_loaded = true
			local level_name = self._level_transition_handler:get_current_level_keys()
			local level_index = NetworkLookup.level_keys[level_name]

			network_server:rpc_level_loaded(Network.peer_id(), level_index)
		end

		local package_manager = Managers.package

		for i, name in ipairs(GlobalResources) do
			if not package_manager:has_loaded(name) then
				return false
			end
		end

		if not self._level_transition_handler.enemy_package_loader:loading_completed() then
			return false
		end

		local resync_state = self:_update_loadout_resync()

		if resync_state ~= StateLoading.LoadoutResyncStates.DONE then
			return false
		end

		if self._ui_loading_package_path and self._ui_loading_package_reference_name and not package_manager:has_loaded(self._ui_loading_package_path, self._ui_loading_package_reference_name) then
			return false
		end

		if not Managers.mechanism:is_packages_loaded() then
			return false
		end

		return true
	end
end

StateLoading.rpc_load_level = function (self, sender, level_index, level_seed, difficulty_id, locked_director_functions_ids)
	self._rpc_load_level_received = true

	print("[StateLoading] got rpc_load_level", level_index, NetworkLookup.level_keys[level_index])
end

StateLoading._update_loadout_resync = function (self)
	local state = self:loadout_resync_state()
	local states = StateLoading.LoadoutResyncStates

	if state == states.IDLE then
		return state
	end

	if state == states.WAIT_FOR_RPC_LOAD_LEVEL and self._rpc_load_level_received then
		state = states.CHECK_RESYNC

		print("[StateLoading] loadout_resync_state WAIT_FOR_RPC_LOAD_LEVEL -> CHECK_RESYNC")
	end

	if state == states.CHECK_RESYNC and self:has_joined() then
		local game_mode = nil
		local level_key = self:get_next_level_key()

		if Development.parameter("weave_name") then
			game_mode = "weave"
		else
			local level_setting = LevelSettings[level_key]

			if level_setting.hub_level then
				game_mode = "inn"
			else
				local lobby = self:get_lobby()
				game_mode = lobby:lobby_data("game_mode") or lobby:get_stored_lobby_data().game_mode

				if PLATFORM ~= "ps4" then
					game_mode = game_mode and NetworkLookup.game_modes[tonumber(game_mode)]
				end
			end
		end

		local loadout_changed, old_loadout, new_loadout = Managers.backend:set_loadout_interface_override(game_mode)

		print("[StateLoading] loadout_changed:", loadout_changed, "old_loadout:", old_loadout, "new_loadout:", new_loadout, "level_key:", level_key, "game_mode:", game_mode)

		if loadout_changed then
			state = states.NEEDS_RESYNC

			print("[StateLoading] loadout_resync_state CHECK_RESYNC -> NEEDS_RESYNC")
		else
			state = states.DONE

			print("[StateLoading] loadout_resync_state CHECK_RESYNC -> DONE")
		end
	end

	if state == states.NEEDS_RESYNC then
		local network_server = self._network_server
		local network_client = self._network_client
		local profile_synchronizer = (network_server and network_server.profile_synchronizer) or (network_client and network_client.profile_synchronizer)

		if profile_synchronizer then
			local peer_id = Network.peer_id()
			local profile_index, career_index = profile_synchronizer:profile_by_peer(peer_id, 1)

			profile_synchronizer:resync_loadout(profile_index, career_index, nil)

			state = states.RESYNCING

			print("[StateLoading] loadout_resync_state NEEDS_RESYNC -> RESYNCING")
		end
	end

	if state == states.RESYNCING then
		local network_server = self._network_server
		local network_client = self._network_client
		local profile_synchronizer = (network_server and network_server.profile_synchronizer) or (network_client and network_client.profile_synchronizer)

		if profile_synchronizer then
			local inventory_synchronizer = profile_synchronizer:inventory_package_synchronizer()

			if inventory_synchronizer.all_loaded then
				state = states.DONE

				print("[StateLoading] loadout_resync_state RESYNCING -> DONE")
			end
		end
	end

	if state ~= self:loadout_resync_state() then
		self:set_loadout_resync_state(state)
	end

	return state
end

StateLoading._destroy_network = function (self, application_shutdown)
	PartyManager.reset()

	if Managers.matchmaking then
		Managers.matchmaking:destroy()

		Managers.matchmaking = nil
	end

	if self._lobby_finder then
		self._lobby_finder:destroy()

		self._lobby_finder = nil
	end

	if self._server_lobby then
		self._server_lobby:destroy()

		self._server_lobby = nil
	end

	if self._lobby_client then
		self._lobby_client:destroy()

		self._lobby_client = nil

		Managers.account:set_current_lobby(nil)
	end

	if self._lobby_host and not self._lobby_host:is_dedicated_server() then
		self._lobby_host:destroy()

		self._lobby_host = nil

		Managers.account:set_current_lobby(nil)
	end

	if self._network_server then
		self._network_server:destroy()

		self._network_server = nil
	elseif self._network_client then
		self._network_client:destroy()

		self._network_client = nil
	end

	if self._lobby_host and self._lobby_host:is_dedicated_server() then
		self._lobby_host:destroy()

		self._lobby_host = nil

		Managers.account:set_current_lobby(nil)
	end

	if rawget(_G, "LobbyInternal") then
		LobbyInternal.shutdown_client()
	end

	Managers.chat:unregister_channel(1)

	self.parent.loading_context = {}

	if self.offline_invite then
		self.offline_invite = nil
		self.parent.loading_context.offline_invite = true
	end

	local level_transition_handler = self._level_transition_handler
	local enemy_package_loader = level_transition_handler.enemy_package_loader

	enemy_package_loader:unload_enemy_packages(application_shutdown)
	enemy_package_loader:network_context_destroyed()
	level_transition_handler:release_level_resources(self:get_current_level_keys())

	self._level_transition_handler = nil

	Managers.party:network_context_destroyed()
	Managers.mechanism:network_context_destroyed()

	if self._network_transmit then
		self._network_transmit:destroy()

		self._network_transmit = nil
	end

	if self._switch_to_tutorial_backend then
		Managers.backend:stop_tutorial()
	end
end

StateLoading._tear_down_level_end_view_wrappers = function (self)
	local level_end_view_wrappers = self._level_end_view_wrappers

	if level_end_view_wrappers then
		for i = 1, #level_end_view_wrappers, 1 do
			level_end_view_wrappers[i]:destroy()
		end
	end

	self._level_end_view_wrappers = nil
end

StateLoading.set_matchmaking = function (self, matchmaking)
	self._joined_matchmaking_lobby = matchmaking
end

StateLoading._setup_level_transition = function (self)
	local loading_context = self.parent.loading_context

	if loading_context.level_transition_handler then
		self._level_transition_handler = loading_context.level_transition_handler
	else
		self._level_transition_handler = LevelTransitionHandler:new()

		self._level_transition_handler:set_next_level(self._level_transition_handler:default_level_key())
		Managers.account:set_level_transition_handler(self._level_transition_handler)
	end
end

StateLoading.has_registered_rpcs = function (self)
	return self._registered_rpcs
end

StateLoading.register_rpcs = function (self)
	local network_event_delegate = NetworkEventDelegate:new()
	self._network_event_delegate = network_event_delegate

	self._level_transition_handler:register_rpcs(network_event_delegate)
	Managers.mechanism:register_rpcs(network_event_delegate)
	Managers.party:register_rpcs(network_event_delegate)

	if Managers.matchmaking then
		Managers.matchmaking:register_rpcs(network_event_delegate)
		Managers.matchmaking:setup_post_init_data({})
	end

	Managers.chat:register_network_event_delegate(network_event_delegate)
	Managers.deed:register_rpcs(network_event_delegate)

	if self._level_end_view_wrappers then
		for i, level_end_view_wrapper in ipairs(self._level_end_view_wrappers) do
			level_end_view_wrapper:register_rpcs(network_event_delegate)
		end
	end

	network_event_delegate:register(self, unpack(RPCS))

	self._registered_rpcs = true

	print("registering RPCs")
end

StateLoading._unregister_rpcs = function (self)
	self._level_transition_handler:unregister_rpcs()
	Managers.mechanism:unregister_rpcs()
	Managers.party:unregister_rpcs()

	if Managers.matchmaking then
		Managers.matchmaking:unregister_rpcs()
	end

	Managers.chat:unregister_network_event_delegate(self._network_event_delegate)
	Managers.deed:unregister_rpcs()

	if self._level_end_view_wrappers then
		for i, level_end_view_wrapper in ipairs(self._level_end_view_wrappers) do
			level_end_view_wrapper:unregister_rpcs()
		end
	end

	self._network_event_delegate:unregister(self)

	self._registered_rpcs = false
end

StateLoading.waiting_for_cleanup = function (self)
	return self._waiting_for_cleanup
end

StateLoading.setup_join_lobby = function (self)
	if PLATFORM == "xb1" and not Managers.account:all_lobbies_freed() then
		self._waiting_for_cleanup = true

		return
	end

	if not self._lobby_client then
		local network_options = Managers.lobby:network_options()
		local loading_context = self.parent.loading_context

		if loading_context.join_lobby_data then
			self._lobby_client = LobbyClient:new(network_options, self.parent.loading_context.join_lobby_data)
		elseif loading_context.join_server_data then
			local user_data = {
				network_options = network_options,
				game_server_data = self.parent.loading_context.join_server_data
			}
			self._password_request = ServerJoinStateMachine:new(network_options, self.parent.loading_context.join_server_data.server_info.ip_port, user_data)
		else
			ferror("no join lobby data")
		end

		self.parent.loading_context.join_lobby_data = nil
		self._handle_new_lobby_connection = true

		if self._lobby_client ~= nil then
			Managers.account:set_current_lobby(self._lobby_client.lobby)
		end

		local main_time = Managers.time:time("main")
		self._lobby_finder_timeout = main_time + StateLoading.join_lobby_timeout
	end
end

StateLoading.setup_lobby_finder = function (self, lobby_joined_callback, lobby_to_join, host_to_join, lobby_is_server)
	if Managers.package:is_loading("resource_packages/inventory", "global") then
		Managers.package:load("resource_packages/inventory", "global")
	end

	if Managers.package:is_loading("resource_packages/careers", "global") then
		Managers.package:load("resource_packages/careers", "global")
	end

	local network_options = Managers.lobby:network_options()

	if lobby_is_server then
		local game_server_data = {
			server_info = {
				ip_port = lobby_to_join
			}
		}
		local user_data = {
			network_options = network_options,
			game_server_data = game_server_data
		}
		self._password_request = ServerJoinStateMachine:new(network_options, game_server_data.server_info.ip_port, user_data)
	else
		self._lobby_finder = LobbyFinder:new(network_options, nil, true)
		self._lobby_to_join = lobby_to_join
		self._host_to_join = host_to_join and host_to_join.peer_id
		self._host_to_join_name = host_to_join and host_to_join.name

		self._lobby_finder:refresh()
		printf("[StateLoading] StateLoading will try to find a lobby with id=%s or host=%s or unique_server_name=%s", tostring(lobby_to_join), tostring(self._host_to_join), tostring(script_data.unique_server_name))
	end

	local main_time = Managers.time:time("main")
	self._lobby_joined_callback = lobby_joined_callback
	self._lobby_finder_timeout = main_time + StateLoading.join_lobby_timeout
	self._lobby_finder_refresh_timer = main_time + StateLoading.join_lobby_refresh_interval

	if host_to_join then
		self:create_join_popup(self._host_to_join_name)
	end
end

StateLoading.should_start_breed_load_process = function (self)
	self._should_start_breed_loading = true
end

StateLoading.setup_lobby_host = function (self, wait_for_joined_callback)
	local loading_context = self.parent.loading_context

	assert(not loading_context.profile_synchronizer)
	assert(not loading_context.network_server)

	local network_options = Managers.lobby:network_options()
	self._lobby_host = LobbyHost:new(network_options)
	local level_key = self:get_next_level_key()

	if not self:loading_view_setup_done() then
		self:setup_loading_view(level_key)
	end

	if not self:menu_assets_setup_done() then
		self:setup_menu_assets()
	end

	self._load_global_packages()

	local level_transition_handler = self._level_transition_handler

	Managers.mechanism:generate_locked_director_functions(level_key)
	Managers.mechanism:generate_level_seed()
	level_transition_handler:load_level(level_key)
	self:should_start_breed_load_process()

	if not wait_for_joined_callback then
		local initial_level = level_transition_handler:get_current_level_keys()
		local wanted_profile_index = self.parent.loading_context.wanted_profile_index
		self._network_server = NetworkServer:new(Managers.player, self._lobby_host, initial_level, wanted_profile_index, level_transition_handler)
		self._network_transmit = loading_context.network_transmit or NetworkTransmit:new(true, self._network_server.connection_handler)

		self._network_transmit:set_network_event_delegate(self._network_event_delegate)
		self._network_server:register_rpcs(self._network_event_delegate, self._network_transmit)
		self._network_server:server_join()

		self._profile_synchronizer = self._network_server.profile_synchronizer

		self._network_server.voip:set_input_manager(self._input_manager)

		loading_context.network_transmit = self._network_transmit
	end

	Managers.account:set_current_lobby(self._lobby_host.lobby)

	self._waiting_for_joined_callback = wait_for_joined_callback
end

StateLoading.host_joined = function (self)
	local loading_context = self.parent.loading_context
	local initial_level = self._level_transition_handler:get_current_level_keys()
	local wanted_profile_index = self.parent.loading_context.wanted_profile_index
	self._network_server = NetworkServer:new(Managers.player, self._lobby_host, initial_level, wanted_profile_index, self._level_transition_handler)
	self._network_transmit = loading_context.network_transmit or NetworkTransmit:new(true, self._network_server.connection_handler)

	self._network_transmit:set_network_event_delegate(self._network_event_delegate)
	self._network_server:register_rpcs(self._network_event_delegate, self._network_transmit)
	self._network_server:server_join()

	self._profile_synchronizer = self._network_server.profile_synchronizer

	self._network_server.voip:set_input_manager(self._input_manager)

	loading_context.network_transmit = self._network_transmit

	if self._waiting_for_joined_callback then
		self._waiting_for_joined_callback()

		self._waiting_for_joined_callback = nil
	end
end

StateLoading.setup_chat_manager = function (self, lobby, host_peer_id, my_peer_id, is_server)
	local network_context = {
		is_server = is_server,
		host_peer_id = host_peer_id,
		my_peer_id = my_peer_id
	}

	Managers.chat:setup_network_context(network_context)

	local function member_func()
		return lobby:members():get_members()
	end

	Managers.chat:register_channel(1, member_func)
end

StateLoading.setup_deed_manager = function (self, lobby, host_peer_id, my_peer_id, is_server, network_server)
	Managers.deed:network_context_created(lobby, host_peer_id, my_peer_id, is_server, network_server)
end

StateLoading.setup_enemy_package_loader = function (self, lobby, host_peer_id, my_peer_id)
	self._level_transition_handler.enemy_package_loader:network_context_created(lobby, host_peer_id, my_peer_id)
end

StateLoading.setup_global_managers = function (self, lobby, host_peer_id, my_peer_id)
	Managers.mechanism:network_context_created(lobby, host_peer_id, my_peer_id)
	Managers.party:network_context_created(lobby, host_peer_id, my_peer_id)
end

StateLoading.setup_network_transmit = function (self, network_handler)
	self._network_transmit = self.parent.loading_context.network_transmit or NetworkTransmit:new(true, network_handler.connection_handler)

	self._network_transmit:set_network_event_delegate(self._network_event_delegate)
	network_handler:register_rpcs(self._network_event_delegate, self._network_transmit)

	self.parent.loading_context.network_transmit = self._network_transmit
end

StateLoading.create_popup = function (self, error, header, action, right_button, ...)
	if Managers.account:leaving_game() then
		return
	end

	print("StateLoading:create_popup", Script.callstack())

	if self._join_popup_id then
		Managers.popup:cancel_popup(self._join_popup_id)

		self._join_popup_id = nil
	end

	assert(error, "[StateLoading] No error was passed to popup handler")

	local header = header or "popup_error_topic"
	local action = action or "restart_as_server"
	local right_button = right_button or "menu_ok"
	local localized_error = Localize(error)
	localized_error = string.format(localized_error, ...)

	assert(self._popup_id == nil, "Tried to show popup even though we already had one.")

	self._popup_id = Managers.popup:queue_popup(localized_error, Localize(header), action, Localize(right_button))
end

StateLoading.create_join_popup = function (self, host_name)
	if Managers.account:leaving_game() then
		return
	end

	local header = Localize("popup_migrating_to_host_header")
	local message = Localize("popup_migrating_to_host_message") .. "\n" .. host_name
	local time = StateLoading.join_lobby_timeout

	assert(self._join_popup_id == nil, "Tried to show popup even though we already had one.")

	self._join_popup_id = Managers.popup:queue_popup(message, header, "cancel", Localize("popup_choice_cancel"))
	local default_result = "timeout"
	local timer_alignment = "center"
	local blink = false

	Managers.popup:activate_timer(self._join_popup_id, time, default_result, timer_alignment, blink)
end

StateLoading.clear_network_loading_context = function (self)
	local loading_context = self.parent.loading_context

	if loading_context.network_client then
		loading_context.network_client:destroy()

		loading_context.network_client = nil
	end

	if loading_context.network_server then
		loading_context.network_server:destroy()

		loading_context.network_server = nil
	end

	if self._lobby_host then
		self._lobby_host:destroy()

		self._lobby_host = nil
		self.parent.loading_context.lobby_host = nil

		Managers.account:set_current_lobby(nil)
	end
end

StateLoading.setup_network_client = function (self, clear_peer_state, lobby_client)
	self._lobby_client = lobby_client or self._lobby_client

	if self._lobby_client.lobby == nil then
		self._wanted_state = StateTitleScreen
		self._lobby_client = nil
		self.parent.loading_context.lobby_client = nil

		self:create_popup("failure_start_join_server", "popup_error_topic", "restart_as_server", "menu_accept")

		return false
	end

	Application.warning("Setting up network client")

	local host = self._lobby_client:lobby_host()
	local level_key = self._level_transition_handler:get_current_level_keys()
	local level_index = (level_key and NetworkLookup.level_keys[level_key]) or nil
	local wanted_profile_index = self.parent.loading_context.wanted_profile_index
	self._network_client = NetworkClient:new(self._level_transition_handler, host, level_index, wanted_profile_index, clear_peer_state, self._lobby_client)
	self._network_transmit = NetworkTransmit:new(false, self._network_client.connection_handler)

	self._network_transmit:set_network_event_delegate(self._network_event_delegate)
	self._network_client:register_rpcs(self._network_event_delegate, self._network_transmit)

	self._profile_synchronizer = self._network_client.profile_synchronizer
	self._handle_new_lobby_connection = nil

	self._network_client.voip:set_input_manager(self._input_manager)

	local loading_context = self.parent.loading_context
	loading_context.network_client = self._network_client
	loading_context.network_transmit = self._network_transmit
	loading_context.lobby_client = self._lobby_client
	local lobby = self._lobby_client.lobby

	Managers.account:set_current_lobby(lobby)

	return true
end

StateLoading.get_current_level_keys = function (self)
	return self._level_transition_handler:get_current_level_keys()
end

StateLoading.get_next_level_key = function (self)
	return self._level_transition_handler:get_next_level_key()
end

StateLoading.set_lobby_host_data = function (self, level_key)
	if self._lobby_host then
		local lobby_host = self._lobby_host
		local stored_lobby_host_data = lobby_host:get_stored_lobby_data() or {}
		stored_lobby_host_data.level_key = level_key
		stored_lobby_host_data.matchmaking = stored_lobby_host_data.matchmaking or "true"
		local level_setting = LevelSettings[level_key]

		if level_setting.hub_level then
			stored_lobby_host_data.matchmaking = "false"
			stored_lobby_host_data.game_mode = (PLATFORM == "ps4" and "n/a") or NetworkLookup.game_modes["n/a"]
		end

		if level_key == "prologue" then
			stored_lobby_host_data.matchmaking = "false"
			stored_lobby_host_data.game_mode = (PLATFORM == "ps4" and "tutorial") or NetworkLookup.game_modes.tutorial
		end

		if PLATFORM == "ps4" then
			local region = Managers.account:region()
			local primary, secondary = MatchmakingRegionsHelper.get_matchmaking_regions(region)
			stored_lobby_host_data.primary_region = primary
			stored_lobby_host_data.secondary_region = secondary
		end

		local weave_name = Development.parameter("weave_name")

		if weave_name then
			stored_lobby_host_data.weave_name = weave_name
			stored_lobby_host_data.game_mode = (PLATFORM == "ps4" and "weave") or NetworkLookup.game_modes.weave
		elseif Development.parameter("auto_host_level") then
			stored_lobby_host_data.game_mode = (PLATFORM == "ps4" and "custom") or NetworkLookup.game_modes.custom
		end

		lobby_host:set_lobby_data(stored_lobby_host_data)
	end
end

StateLoading.start_matchmaking = function (self)
	assert(self._lobby_host)

	local lobby_host = self._lobby_host
	local stored_lobby_host_data = lobby_host:get_stored_lobby_data() or {}
	stored_lobby_host_data.matchmaking = "true"

	lobby_host:set_lobby_data(stored_lobby_host_data)
end

StateLoading.get_lobby = function (self)
	local lobby = self._lobby_host or self._lobby_client

	return lobby
end

StateLoading.has_joined = function (self)
	local lobby = self._lobby_host or self._lobby_client

	return lobby and lobby:is_joined()
end

return

require("scripts/flow/flow_callbacks")
require("scripts/managers/backend/statistics_database")
require("scripts/managers/bot_nav_transition/bot_nav_transition_manager")
require("scripts/managers/camera/camera_manager")
require("scripts/managers/debug/debug_text_manager")
require("scripts/managers/debug/debug_event_manager_rpc")
require("scripts/managers/network/game_network_manager")
require("scripts/managers/networked_flow_state/networked_flow_state_manager")
require("scripts/managers/spawn/spawn_manager")
require("scripts/managers/game_mode/game_mode_manager")
require("scripts/managers/debug/debug_manager")
require("scripts/managers/conflict_director/conflict_director")
require("scripts/managers/entity/entity_manager2")
require("scripts/managers/room/room_manager_server")
require("scripts/managers/room/room_manager_client")
require("scripts/managers/difficulty/difficulty_manager")
require("scripts/managers/matchmaking/matchmaking_manager")
require("scripts/managers/url_loader/url_loader_manager")
require("scripts/helpers/action_utils")
require("scripts/helpers/camera_carrier")
require("scripts/helpers/damage_utils")
require("scripts/helpers/graph_drawer")
require("scripts/helpers/locomotion_utils")
require("scripts/helpers/status_utils")
require("scripts/utils/debug_screen")
require("scripts/utils/debug_key_handler")
require("scripts/utils/function_call_profiler")
require("scripts/utils/pool_table_visualizer")
require("scripts/utils/visual_assert_log")
require("scripts/helpers/graph_helper")
require("scripts/network/network_event_delegate")
require("scripts/managers/input/input_manager")
require("scripts/utils/debug_keymap")
require("scripts/settings/render_settings_templates")
require("scripts/settings/game_settings")
require("scripts/network/network_clock_server")
require("scripts/network/network_clock_client")
require("scripts/network/network_timer_handler")
require("scripts/game_state/state_ingame_running")
require("scripts/game_state/state_loading")
require("scripts/entity_system/entity_system_bag")
require("scripts/level/environment/environment_blender")
require("scripts/managers/voting/vote_manager")
require("scripts/managers/voting/vote_templates")
require("scripts/game_state/components/dice_keeper")
require("foundation/scripts/util/datacounter")
require("scripts/managers/blood/blood_manager")
require("scripts/managers/blood/blood_manager_dummy")
require("scripts/managers/crafting/crafting_manager")
require("scripts/managers/performance/performance_manager")
require("scripts/managers/world_interaction/world_interaction_manager")
require("scripts/managers/decal/decal_manager")
require("scripts/managers/performance_title/performance_title_manager")
require("scripts/settings/quest_settings")
require("scripts/managers/achievements/achievement_manager")
require("scripts/managers/quest/quest_manager")
require("scripts/managers/badge/badge_manager")
require("scripts/utils/fps_reporter")
require("scripts/managers/side/side_manager")

for _, dlc in pairs(DLCSettings) do
	local files = dlc.statistics_database

	if files then
		for _, file in ipairs(files) do
			require(file)
		end
	end
end

StateIngame = class(StateIngame)
StateIngame.NAME = "StateIngame"

StateIngame.on_enter = function (self)
	if PLATFORM == "xb1" then
		Application.set_kinect_enabled(false)

		self.hero_stats_updated = false
	end

	local loading_context = self.parent.loading_context
	self._lobby_host = loading_context.lobby_host
	self._lobby_client = loading_context.lobby_client
	local is_server = not not self._lobby_host
	self.is_server = is_server

	print("[Gamestate] Enter StateIngame", (is_server and "HOST") or "CLIENT")

	local assert_on_leak = true

	GarbageLeakDetector.run_leak_detection(assert_on_leak)
	GarbageLeakDetector.register_object(self, "StateIngame")
	NetworkUnit.reset_unit_data()
	Managers.time:register_timer("game", "main")
	CLEAR_POSITION_LOOKUP()

	local input_manager = InputManager:new()
	self.input_manager = input_manager
	Managers.input = self.input_manager

	input_manager:initialize_device("keyboard")
	input_manager:initialize_device("mouse")
	input_manager:initialize_device("gamepad")

	if script_data.debug_enabled then
		input_manager:create_input_service("Debug", "DebugKeymap", "DebugInputFilters")
		input_manager:map_device_to_service("Debug", "keyboard")
		input_manager:map_device_to_service("Debug", "mouse")
		input_manager:map_device_to_service("Debug", "gamepad")
		input_manager:create_input_service("DebugMenu", "DebugKeymap", "DebugInputFilters")
		input_manager:map_device_to_service("DebugMenu", "keyboard")
		input_manager:map_device_to_service("DebugMenu", "mouse")
		input_manager:map_device_to_service("DebugMenu", "gamepad")
	end

	Managers.popup:set_input_manager(input_manager)

	self.level_transition_handler = loading_context.level_transition_handler
	local level_key = self.level_transition_handler:get_current_level_keys()

	Crashify.print_property("level", level_key)

	self.level_key = level_key
	local level_setting = LevelSettings[level_key]
	self.is_in_inn = level_setting.hub_level
	self.is_in_tutorial = level_key == "prologue"
	DamageUtils.is_in_inn = self.is_in_inn
	self._called_level_flow_events = false
	self._onclose_popup_id = nil
	self._onclose_called = false
	self._quit_game = false
	self._gm_event_end_conditions_met = false

	Managers.light_fx:set_lightfx_color_scheme((self.is_in_inn and "inn_level") or "ingame")

	if PLATFORM ~= "win32" then
		if self.is_in_tutorial then
			Managers.backend:set_user_data("prologue_started", true)
			Managers.backend:commit()
		elseif self.is_in_inn then
			Managers.unlock:enable_update_unlocks(true)
		end
	end

	local db = StatisticsDatabase:new()

	db:register("session", "session", nil)

	loading_context.statistics_db = db
	self.statistics_db = db

	Managers.player:set_statistics_db(self.statistics_db)

	self._max_local_players = PlayerManager.MAX_PLAYERS

	if self.is_server then
		local lobby_data = self._lobby_host:get_stored_lobby_data()
		lobby_data.selected_level_key = self.level_key

		self._lobby_host:set_lobby_data(lobby_data)
	end

	self.world_name = "level_world"

	self:_setup_world()

	local world = self.world
	self.peer_id = Network.peer_id()
	local network_event_delegate = NetworkEventDelegate:new()
	self.network_event_delegate = network_event_delegate
	self.network_server = loading_context.network_server
	self.network_client = loading_context.network_client

	if self.network_server then
		self.network_transmit = loading_context.network_transmit or NetworkTransmit:new(is_server, self.network_server.connection_handler)

		self.network_server:register_rpcs(network_event_delegate, self.network_transmit)

		self.profile_synchronizer = self.network_server.profile_synchronizer

		self.network_server.voip:set_input_manager(self.input_manager)
		print("[StateIngame] Server ingame")
	elseif self.network_client then
		print("[StateIngame] Client ingame")

		self.network_transmit = loading_context.network_transmit or NetworkTransmit:new(is_server, self.network_client.connection_handler)

		self.network_client:register_rpcs(network_event_delegate, self.network_transmit)

		self.profile_synchronizer = self.network_client.profile_synchronizer

		self.network_client.voip:set_input_manager(self.input_manager)
	end

	self.network_transmit:set_network_event_delegate(network_event_delegate)
	network_event_delegate:register(self, "rpc_kick_peer")
	self.statistics_db:register_network_event_delegate(network_event_delegate)

	loading_context.network_transmit = self.network_transmit
	local top_gui_world_name = "top_ingame_view"
	local top_gui_world = Managers.world:world(top_gui_world_name)

	Debug.setup(top_gui_world, top_gui_world_name)

	local debug_screen_data = require("scripts/utils/debug_screen_config")

	DebugScreen.setup(top_gui_world, debug_screen_data.settings, debug_screen_data.callbacks)
	VisualAssertLog.setup(world)
	DebugKeyHandler.setup(world, self.input_manager)
	FunctionCallProfiler.setup(world)
	PoolTableVisualizer.setup(world)

	if not script_data.debug_enabled then
		DebugKeyHandler.set_enabled(false)
	end

	Managers.state.crafting = CraftingManager:new()
	local difficulty = Managers.mechanism:get_difficulty()

	if Development.parameter("weave_name") then
		local weave_name = Development.parameter("weave_name")
		local weave_template = WeaveSettings.templates[weave_name]
		difficulty = weave_template.difficulty_key
	end

	Managers.state.difficulty = DifficultyManager:new(world, is_server, network_event_delegate, self._lobby_host)

	Managers.state.difficulty:set_difficulty(difficulty)

	local num_players = (DEDICATED_SERVER and 0) or 1
	self.num_local_human_players = num_players

	if Managers.matchmaking then
		Managers.matchmaking:reset_ping()

		if not DEDICATED_SERVER then
			Managers.matchmaking:reset_lobby_filters()
		end
	else
		local matchmaking_params = {
			level_transition_handler = self.level_transition_handler,
			network_transmit = self.network_transmit,
			network_server = self.network_server,
			lobby = self._lobby_host or self._lobby_client,
			peer_id = self.peer_id,
			is_server = is_server,
			profile_synchronizer = self.profile_synchronizer,
			statistics_db = self.statistics_db,
			slot_allocator = (self.network_server and self.network_server.slot_allocator) or self.network_client.slot_allocator,
			quick_game = loading_context.quickplay_bonus
		}
		Managers.matchmaking = MatchmakingManager:new(matchmaking_params)
	end

	Managers.matchmaking:register_rpcs(network_event_delegate)
	Managers.matchmaking:set_statistics_db(self.statistics_db)
	Managers.deed:register_rpcs(network_event_delegate)
	self:_setup_state_context(world, is_server, network_event_delegate)
	self.level_transition_handler:register_rpcs(network_event_delegate)
	Managers.mechanism:register_rpcs(network_event_delegate)
	Managers.party:register_rpcs(network_event_delegate)

	if is_server then
		local is_quick_game = self._lobby_host:lobby_data("quick_game") == "true"

		Managers.matchmaking:set_quick_game(is_quick_game)
	end

	if rawget(_G, "ControllerFeaturesManager") then
		Managers.state.controller_features = ControllerFeaturesManager:new(self.is_in_inn)
	end

	Managers.telemetry.rpc_listener:register(self.network_event_delegate)
	Managers.telemetry:reset()

	local engine_revision = script_data.build_identifier
	local content_revision = script_data.settings.content_revision

	Managers.telemetry.events:header(engine_revision, content_revision)

	if is_server then
		local session_id = Managers.state.network:session_id()

		Managers.telemetry.events:session_id(session_id)
	end

	local event_manager = Managers.state.event

	event_manager:register(self, "event_play_particle_effect", "event_play_particle_effect", "event_start_network_timer", "event_start_network_timer", "xbox_one_hack_start_game", "event_xbox_one_hack_start_game", "gm_event_end_conditions_met", "gm_event_end_conditions_met")

	local level, level_key = self:_create_level()
	self.level = level

	Managers.state.entity:system("darkness_system"):set_level(level)
	Managers.state.entity:system("ai_group_system"):set_level(level)

	local level_seed = Managers.mechanism:get_level_seed()
	local checkpoint_data = loading_context.checkpoint_data

	if self.is_server then
		Managers.state.entity:system("pickup_system"):setup_taken_pickups(checkpoint_data)

		if checkpoint_data then
			local state_managers = Managers.state

			state_managers.spawn:load_checkpoint_data(checkpoint_data)
			state_managers.conflict.level_analysis:set_random_seed(checkpoint_data.level_analysis)

			loading_context.checkpoint_data = nil
		else
			local override_seed = (Development.parameter("attract_mode") and BenchmarkSettings.game_seed) or level_seed

			Managers.state.conflict.level_analysis:set_random_seed(checkpoint_data, override_seed)
		end
	end

	self:_request_live_events()

	if Managers.state.room then
		Managers.state.room:setup_level_anchor_points(self.level)
	end

	local level_name = LevelSettings[level_key].level_name

	ScriptWorld.optimize_level_units(world, level_name)
	InputDebugger:setup(world, self.input_manager)

	self.machines = {}
	local level_end_view_wrappers = loading_context.level_end_view_wrappers

	for i = 1, num_players, 1 do
		local viewport_name = "player_" .. i
		self.viewport_name = viewport_name
		local network_options = Managers.lobby:network_options()
		local params = {
			local_player_id = i,
			viewport_name = viewport_name,
			is_in_inn = self.is_in_inn,
			is_in_tutorial = self.is_in_tutorial,
			is_server = is_server,
			network_options = network_options,
			input_manager = self.input_manager,
			world_name = self.world_name,
			free_flight_manager = self.free_flight_manager,
			lobby_host = loading_context.lobby_host,
			lobby_client = loading_context.lobby_client,
			level_transition_handler = loading_context.level_transition_handler,
			profile_synchronizer = self.profile_synchronizer,
			network_event_delegate = self.network_event_delegate,
			statistics_db = self.statistics_db,
			dice_keeper = self.dice_keeper,
			level_key = level_key,
			network_server = self.network_server,
			network_client = self.network_client,
			network_transmit = self.network_transmit,
			voip = (self.network_server and self.network_server.voip) or self.network_client.voip,
			quickplay_bonus = loading_context.quickplay_bonus
		}

		if level_end_view_wrappers and level_end_view_wrappers[i] then
			params.level_end_view_wrapper = level_end_view_wrappers[i]
		end

		local player = Managers.player:add_player(nil, viewport_name, self.world_name, i)

		if loading_context.quickplay_bonus then
			StatisticsUtil.register_played_quickplay_level(self.statistics_db, player, level_key)
		end

		self.machines[i] = GameStateMachine:new(self, StateInGameRunning, params, true)
	end

	if checkpoint_data then
		Managers.state.entity:system("mission_system"):load_checkpoint_data(checkpoint_data.mission)
	end

	local wwise_world = Managers.world:wwise_world(world)

	if Managers.matchmaking then
		local post_init_data = {
			hero_spawner_handler = Managers.state.spawn.hero_spawner_handler,
			difficulty = Managers.state.difficulty,
			wwise_world = wwise_world,
			reset_matchmaking = self.is_in_inn,
			is_in_inn = self.is_in_inn
		}

		Managers.matchmaking:setup_post_init_data(post_init_data)
	end

	ScriptWorld.trigger_level_loaded(world, level_name)
	World.set_data(self.world, "level_seed", nil)

	if checkpoint_data then
		Managers.state.networked_flow_state:load_checkpoint_data(checkpoint_data.networked_flow_state)
	end

	if self.is_in_inn and not SaveData.first_time_in_inn then
		Level.trigger_event(level, "first_time_started_game")

		SaveData.first_time_in_inn = true

		Managers.save:auto_save(SaveFileName, SaveData, callback(self, "cb_save_data"))
	end

	local platform = PLATFORM

	if platform == "win32" then
		Window.set_mouse_focus(true)
	end

	Network.write_dump_tag("start of game")

	local network_manager = Managers.state.network
	local network_game = network_manager:game()
	local is_spawn_owner = self._lobby_host and network_game

	if is_spawn_owner or LEVEL_EDITOR_TEST then
		Managers.state.conflict:ai_ready(level_seed)

		local volume_system = Managers.state.entity:system("volume_system")

		volume_system:ai_ready()
	else
		Managers.state.conflict:client_ready()
	end

	if self.is_server and checkpoint_data then
		if Managers.state.game_mode:setting("specified_pickups") then
			Managers.state.entity:system("pickup_system"):populate_specified_pickups(checkpoint_data.pickup)
		else
			Managers.state.entity:system("pickup_system"):populate_pickups(checkpoint_data.pickup)
		end
	elseif self.is_server then
		if Managers.state.game_mode:setting("specified_pickups") then
			Managers.state.entity:system("pickup_system"):populate_specified_pickups()
		else
			Managers.state.entity:system("pickup_system"):populate_pickups()
		end
	end

	Managers.state.entity:system("payload_system"):init_payloads()

	local dynamic_range_sound = Application.user_setting("dynamic_range_sound")

	if dynamic_range_sound ~= nil then
		local value = nil

		if dynamic_range_sound == "low" then
			value = 1
		elseif dynamic_range_sound == "high" then
			value = 0
		else
			local default = DefaultUserSettings.get("user_settings", "dynamic_range_sound")

			if default == "low" then
				value = 1
			elseif default == "high" then
				value = 0
			end
		end

		WwiseWorld.set_global_parameter(wwise_world, "dynamic_range_sound", value)
	end

	if PLATFORM == "win32" then
		local sound_quality = Application.user_setting("sound_quality")

		SoundQualitySettings.set_sound_quality(wwise_world, sound_quality)

		local sfx_bus_volume = Application.user_setting("sfx_bus_volume")

		if sfx_bus_volume ~= nil then
			local wwise_world = Managers.world:wwise_world(world)

			WwiseWorld.set_global_parameter(wwise_world, "sfx_bus_volume", sfx_bus_volume)
		end

		local voice_bus_volume = Application.user_setting("voice_bus_volume")

		if voice_bus_volume ~= nil then
			local wwise_world = Managers.world:wwise_world(world)

			WwiseWorld.set_global_parameter(wwise_world, "voice_bus_volume", voice_bus_volume)
		end

		local master_bus_volume = Application.user_setting("master_bus_volume")

		if master_bus_volume ~= nil then
			local wwise_world = Managers.world:wwise_world(world)

			WwiseWorld.set_global_parameter(wwise_world, "master_bus_volume", master_bus_volume)
		end
	end

	Managers.music:on_enter_level(network_event_delegate, is_server)
	Managers.chat:register_network_event_delegate(network_event_delegate)
	Managers.state.game_mode:setup_done()

	local player_id = Managers.backend:player_id()
	local difficulty = Managers.state.difficulty:get_difficulty()
	local mutators = Managers.state.game_mode:activated_mutators()
	local game_mode = Managers.state.game_mode:settings().key

	Managers.telemetry.events:game_started({
		player_id = player_id,
		peer_type = self:peer_type(),
		game_mode = game_mode,
		level_key = level_key,
		difficulty = difficulty,
		mutators = mutators
	})

	if self.network_server then
		self.network_server:on_game_entered(network_manager)
	elseif self.network_client then
		self.network_client:on_game_entered()
	end

	self._camera_carrier = CameraCarrier:new()
	local fullscreen = Application.user_setting("fullscreen")
	local borderless_fullscreen = Application.user_setting("borderless_fullscreen")
	local windowed = not fullscreen and not borderless_fullscreen
	local screen_mode = (fullscreen and "fullscreen") or (borderless_fullscreen and "borderless_fullscreen") or (windowed and "windowed")
	local res_x, res_y = Application.resolution()
	local resolution_string = string.format("%dx%d", res_x, res_y)
	local graphics_quality = Application.user_setting("graphics_quality")
	local rendering_backend = Renderer.render_device_string()

	Managers.telemetry.events:tech_settings(resolution_string, graphics_quality, screen_mode, rendering_backend)

	local system_info = Application.sysinfo()
	local adapter_index = Application.user_setting("adapter_index")

	Managers.telemetry.events:tech_system(system_info, adapter_index)

	if PLATFORM == "xb1" then
		Managers.account:set_presence("playing")
	elseif platform == "ps4" then
		if self.is_in_inn then
			Managers.account:set_presence("inn")
		else
			local level_display_name = LevelSettings[self.level_key].display_name

			Managers.account:set_presence("playing", level_display_name)
		end
	end

	if Managers.deed:has_deed() then
		local is_owner = Managers.deed:is_deed_owner(self.peer_id)

		printf("Entered StateIngame with a deed active! is_owner(%s)", tostring(is_owner))
	end

	self._fps_reporter = FPSReporter:new()

	Managers.state.event:trigger("start_game_time", Managers.state.network:network_time())
end

StateIngame.peer_type = function (self)
	if DEDICATED_SERVER then
		return "dedicated-server"
	elseif self.is_server then
		return "server"
	else
		return "client"
	end
end

StateIngame.event_xbox_one_hack_start_game = function (self, level_key, difficulty)
	print(level_key, difficulty)
	Managers.state.difficulty:set_difficulty(difficulty)
	self.level_transition_handler:set_next_level(level_key)
	Managers.state.game_mode:complete_level()
end

StateIngame.cb_save_data = function (self)
	print("saved data")
end

StateIngame._setup_world = function (self)
	local shading_callback = callback(self, "shading_callback")
	local layer = 1
	local flags = {
		Application.ENABLE_UMBRA,
		Application.ENABLE_VOLUMETRICS
	}

	if Application.user_setting("disable_apex_cloth") then
		table.insert(flags, Application.DISABLE_APEX_CLOTH)
	else
		table.insert(flags, Application.APEX_LOD_RESOURCE_BUDGET)
		table.insert(flags, Application.user_setting("apex_lod_resource_budget") or ApexClothQuality.high.apex_lod_resource_budget)
	end

	self.world = Managers.world:create_world(self.world_name, nil, shading_callback, layer, unpack(flags))

	local function update_ui()
		for i, machine in ipairs(self.machines) do
			machine:state():update_ui()
		end
	end

	Managers.world:set_anim_update_callback(self.world, update_ui)
	Managers.world:set_scene_update_callback(self.world, function ()
		self:physics_async_update(self.dt)
	end)

	if Managers.splitscreen then
		Managers.splitscreen:add_splitscreen_viewport(self.world)
	end
end

StateIngame._safe_to_do_entity_update = function (self)
	local network_manager = Managers.state.network

	if network_manager:has_left_game() or not network_manager:in_game_session() then
		return false
	end

	local t = Managers.time:time("game")
	local game_mode_ended = Managers.state.game_mode:is_game_mode_ended()
	local left_game_mode = game_mode_ended and self.game_mode_end_timer and self.game_mode_end_timer <= t

	return not left_game_mode
end

StateIngame.physics_async_update = function (self, dt)
	local t = Managers.time:time("game")

	Managers.music:update(self.dt, t)

	if self:_safe_to_do_entity_update() then
		self.entity_system:physics_async_update()
	end
end

StateIngame.shading_callback = function (self, world, shading_env, viewport)
	Managers.state.camera:shading_callback(world, shading_env, viewport)
end

StateIngame._teardown_level = function (self)
	ScriptWorld.destroy_level_from_reference(self.world, self.level)
end

StateIngame._teardown_world = function (self)
	if Managers.splitscreen then
		Managers.splitscreen:remove_splitscreen_viewport()
	end

	if Debug.active then
		Debug.teardown()
	end

	World.destroy_gui(self.world, self._debug_gui)
	World.destroy_gui(self.world, self._debug_gui_immediate)
	Managers.world:destroy_world(self.world_name)
end

StateIngame.spawn_unit = function (self, unit, ...)
	if not Managers.state.entity then
		printf("Unit %s is spawned after level destroy?", tostring(unit))

		return
	end

	Managers.state.entity:register_unit(self.world, unit, ...)
end

StateIngame.unspawn_unit = function (self, unit)
	if not Managers.state.entity then
		printf("Unit %s has not been destroyed by entity manager or level destroy", tostring(unit))

		return
	end

	Unit.flow_event(unit, "unit_despawned")
	Managers.state.entity:unregister_unit(unit)
end

StateIngame._create_level = function (self)
	local level_key = self.level_transition_handler:get_current_level_keys()
	local level_name = LevelSettings[level_key].level_name
	local game_mode_manager = Managers.state.game_mode
	local game_mode_object_sets = game_mode_manager:object_sets()
	local spawned_object_sets = {}
	local object_sets = {}
	local num_nested_levels = LevelResource.nested_level_count(level_name)

	if num_nested_levels > 0 then
		local available_level_sets = LevelResource.nested_level_object_set_names(level_name, 1)

		for key, set in ipairs(available_level_sets) do
			local object_set_table = {
				type = "",
				key = key,
				units = LevelResource.nested_level_unit_indices_in_object_set(level_name, 1, set)
			}

			if game_mode_object_sets[set] or set == "shadow_lights" then
				spawned_object_sets[#spawned_object_sets + 1] = set
			elseif string.sub(set, 1, 5) == "flow_" then
				spawned_object_sets[#spawned_object_sets + 1] = set
				object_set_table.type = "flow"
			elseif string.sub(set, 1, 5) == "team_" then
				spawned_object_sets[#spawned_object_sets + 1] = set
				object_set_table.type = "team"
			end

			object_sets[set] = object_set_table
		end
	else
		local available_level_sets = LevelResource.object_set_names(level_name)

		for key, set in ipairs(available_level_sets) do
			local object_set_table = {
				type = "",
				key = key,
				units = LevelResource.unit_indices_in_object_set(level_name, set)
			}

			if game_mode_object_sets[set] or set == "shadow_lights" then
				spawned_object_sets[#spawned_object_sets + 1] = set
			elseif string.sub(set, 1, 5) == "flow_" then
				spawned_object_sets[#spawned_object_sets + 1] = set
				object_set_table.type = "flow"
			elseif string.sub(set, 1, 5) == "team_" then
				spawned_object_sets[#spawned_object_sets + 1] = set
				object_set_table.type = "team"
			end

			object_sets[set] = object_set_table
		end
	end

	local level_seed = Managers.mechanism:get_level_seed()

	print("[StateIngame] Level seed:", level_seed)
	World.set_data(self.world, "level_seed", level_seed)
	World.set_data(self.world, "debug_level_seed", {})

	local level = ScriptWorld.load_level(self.world, level_name, spawned_object_sets, nil, nil, callback(self, "shading_callback"))

	Managers.state.networked_flow_state:set_level(level)
	World.set_flow_callback_object(self.world, self)
	Managers.state.entity:add_and_register_units(self.world, World.units(self.world))
	game_mode_manager:register_object_sets(object_sets)
	Level.spawn_background(level)

	return level, level_key
end

StateIngame._request_live_events = function (self)
	local live_event_interface = Managers.backend:get_interface("live_events")
	self._live_event_request_id = live_event_interface:request_live_events()
end

StateIngame._live_events_ready = function (self)
	local live_event_interface = Managers.backend:get_interface("live_events")
	local live_events = live_event_interface:get_live_events()
	local level_flow_events = {}
	local environment_level_flow_event = "keep_event_default"

	for i = 1, #live_events, 1 do
		local live_event = live_events[i]
		local level_settings = live_event.level_settings and live_event.level_settings[self.level_key]

		if level_settings then
			local environment_flow_event = level_settings.environment_flow_event

			if environment_flow_event then
				environment_level_flow_event = environment_flow_event
			end

			local flow_events = level_settings.level_flow_events

			if flow_events then
				for j = 1, #flow_events, 1 do
					local flow_event = flow_events[j]
					level_flow_events[#level_flow_events + 1] = flow_event
				end
			end
		end
	end

	if environment_level_flow_event then
		level_flow_events[#level_flow_events + 1] = environment_level_flow_event
	end

	self._level_flow_events = level_flow_events
end

StateIngame.pre_update = function (self, dt)
	local t = Managers.time:time("game")
	local network_manager = Managers.state.network

	UPDATE_POSITION_LOOKUP()
	Managers.state.side:update_frame_tables()
	network_manager:update_receive(dt)

	if self.network_server then
		self.network_server:update(dt)
	end

	if self.network_client then
		self.network_client:update(dt)
	end

	Managers.state.spawn:pre_update(dt, t)
	Managers.state.game_mode:pre_update(t, dt)
	Managers.state.conflict:pre_update()
	self.entity_system:commit_and_remove_pending_units()

	if self:_safe_to_do_entity_update() then
		self.entity_system:pre_update(dt, t)
	end
end

local knoywloke = nil

StateIngame.update = function (self, dt, main_t)
	self.dt = dt

	if not self.network_client or self.network_client.state == "game_started" then
		self.network_clock:update(dt)
		self.network_timer_handler:update(dt, main_t)
	end

	local is_server = self.is_server
	local Managers = Managers

	Managers.state.network:update(dt)
	Managers.backend:update(dt)
	self.input_manager:update(dt, main_t)
	Managers.state.badge:update(dt, main_t)
	self.level_transition_handler:update()

	local t = Managers.time:time("game")

	if self._lobby_host then
		self._lobby_host:update(dt)
	end

	if self._lobby_client then
		self._lobby_client:update(dt)
	end

	Managers.state.voting:update(dt, t)

	if Managers.matchmaking then
		Managers.matchmaking:update(dt, main_t)
	end

	if Managers.game_server then
		Managers.game_server:update(dt, t)
	end

	self:_update_deed_manager(dt)
	Managers.deed:update(dt)
	Managers.party:update(t, dt)

	if Managers.state.quest then
		Managers.state.quest:update(dt, t)
	end

	Managers.state.achievement:update(dt, t)

	if Managers.state.decal ~= nil then
		Managers.state.decal:update(dt, t)
	end

	if Managers.eac ~= nil then
		Managers.eac:update(dt, t)
	end

	Managers.state.blood:update(dt, t)
	Managers.state.world_interaction:update(dt, t)

	if Managers.state.controller_features then
		Managers.state.controller_features:update(dt, t)
	end

	if is_server then
		Managers.state.conflict:reset_data()

		if self._lobby_host:is_joined() and Managers.state.network:game() then
			Managers.state.conflict:update(dt, t)
		end
	elseif Managers.state.network:game() then
		Managers.state.conflict:update_client(dt, t)
	end

	for _, machine in pairs(self.machines) do
		machine:update(dt, t)
	end

	local game_mode_ended = Managers.state.game_mode:is_game_mode_ended()

	if not game_mode_ended and self.game_mode_end_timer then
		self.game_mode_end_timer = nil
	end

	if game_mode_ended and not self.game_mode_end_timer then
		self.game_mode_end_timer = t + 0.2
	end

	if self:_safe_to_do_entity_update() then
		self.entity_system:update(dt, t)
	end

	Managers.state.game_mode:update(dt, t)

	if is_server then
		Managers.state.game_mode:server_update(dt, t)
	end

	if not self._new_state then
		self._new_state = self:_check_exit(t)
	end

	if self.exit_type then
		for _, machine in pairs(self.machines) do
			machine._state:disable_ui()
		end
	end

	if self._new_state then
		if self.parent.loading_context.restart_network then
			self.leave_lobby = true
		end

		if not Managers.popup:has_popup() then
			return self._new_state
		end
	end

	Managers.state.bot_nav_transition:update(dt, t)
	Managers.state.performance:update(dt, t)
	self._fps_reporter:update(dt, t)
	self:_update_onclose_check(dt, t)
	self:_generate_ingame_clock()
	self._camera_carrier:update(dt)

	if self._live_event_request_id then
		local live_event_interface = Managers.backend:get_interface("live_events")
		local request_complete = live_event_interface:live_events_request_complete(self._live_event_request_id)

		if request_complete then
			self._live_event_request_id = nil

			self:_live_events_ready()
		end
	end

	if self._level_flow_events and #self._level_flow_events > 0 and not self._called_level_flow_events then
		local flow_events = self._level_flow_events

		for i = 1, #flow_events, 1 do
			local flow_event = flow_events[i]

			LevelHelper:flow_event(self.world, flow_event)
		end

		self._called_level_flow_events = true
	end
end

StateIngame._update_onclose_check = function (self, dt, t)
	if self._onclose_called and not self._onclose_popup_id then
		local popup_text = Localize("exit_game_popup_text") .. "\n\n" .. Localize("exit_game_popup_text_is_hosting_players")
		self._onclose_popup_id = Managers.popup:queue_popup(popup_text, Localize("popup_exit_game_topic"), "end_game", Localize("popup_choice_yes"), "cancel_popup", Localize("popup_choice_no"))
	end

	self:_handle_onclose_warning_result()
end

StateIngame._update_deed_manager = function (self, dt)
	local deed_manager = Managers.deed

	deed_manager:update(dt)

	if self.is_server and deed_manager:has_deed() and deed_manager:is_session_faulty() then
		if self.is_in_inn then
			deed_manager:reset()
		else
			Managers.state.game_mode:complete_level()
		end
	end
end

StateIngame.cb_transition_fade_in_done = function (self, new_state)
	self._new_state = new_state
end

StateIngame.event_start_network_timer = function (self, time)
	self.network_timer_handler:start_timer_server(time)
end

StateIngame._check_exit = function (self, t)
	local network_manager = Managers.state.network
	local lobby = self._lobby_host or self._lobby_client
	local platform = PLATFORM
	local game_mode_key = self.game_mode_key
	local difficulty = Managers.state.difficulty:get_difficulty()
	local difficulty_id = NetworkLookup.difficulties[difficulty]
	local backend_manager = Managers.backend
	local waiting_user_input = backend_manager:is_waiting_for_user_input()
	local backend_items = backend_manager:get_interface("items")
	local waiting_for_item_poll = (backend_items:num_current_item_server_requests() ~= 0 or UISettings.waiting_for_response) and not backend_manager:is_disconnected()

	if not self.exit_type and not waiting_user_input and not waiting_for_item_poll then
		local transition, join_lobby_data = nil

		for _, machine in pairs(self.machines) do
			machine:state():check_invites()

			transition, join_lobby_data = machine:state():wanted_transition()
		end

		if script_data.hammer_join and Managers.time:time("game") > 5 then
			transition = "restart_game"

			Development.set_parameter("auto_join", true)
		elseif PLATFORM == "xb1" and Managers.account:leaving_game() then
			transition = "return_to_title_screen"
		end

		transition = transition or Managers.state.game_mode:wanted_transition()

		if not transition and Managers.game_server then
			transition = Managers.game_server:get_transition()
		end

		if not transition and script_data.honduras_demo then
			transition = Managers.time:get_demo_transition()
		end

		local level_transition_type = self.level_transition_handler.transition_type

		if transition or join_lobby_data or level_transition_type then
			print("TRANSITION", transition, join_lobby_data, level_transition_type)
		end

		if backend_manager:is_disconnected() then
			self.exit_type = "backend_disconnected"

			if network_manager:in_game_session() then
				local force_diconnect = true

				network_manager:leave_game(force_diconnect)
			end

			self.leave_lobby = true

			Managers.transition:fade_in(GameSettings.transition_fade_in_speed, nil)
			Managers.transition:show_loading_icon()
		elseif transition == "offline_invite" then
			self.exit_type = "offline_invite"

			if not Managers.account:leaving_game() then
				Managers.account:initiate_leave_game()
			end

			if network_manager:in_game_session() then
				local force_diconnect = true

				network_manager:leave_game(force_diconnect)
			end

			self.leave_lobby = true

			Managers.account:set_should_teardown_xboxlive()
			Managers.transition:fade_in(GameSettings.transition_fade_in_speed, nil)
			Managers.transition:show_loading_icon()
		elseif transition == "return_to_title_screen" then
			self.exit_type = "return_to_title_screen"

			if not Managers.account:leaving_game() then
				Managers.account:initiate_leave_game()
			end

			if network_manager:in_game_session() then
				local force_diconnect = true

				network_manager:leave_game(force_diconnect)
			end

			self.leave_lobby = true

			Managers.account:set_should_teardown_xboxlive()
			Managers.transition:fade_in(GameSettings.transition_fade_in_speed, nil)
			Managers.transition:show_loading_icon()
		elseif transition == "return_to_demo_title_screen" then
			self.exit_type = "return_to_demo_title_screen"

			if network_manager:in_game_session() then
				local force_diconnect = true

				network_manager:leave_game(force_diconnect)
			end

			self.leave_lobby = true

			Managers.transition:fade_in(GameSettings.transition_fade_in_speed, nil)
			Managers.transition:show_loading_icon()
		elseif self.is_in_inn and lobby and lobby:lost_connection_to_lobby() then
			print("Lost connection to lobby, restarting to inn.")

			self.exit_type = "lobby_state_failed"

			if network_manager:in_game_session() then
				network_manager:leave_game()
			end

			Managers.transition:fade_in(GameSettings.transition_fade_in_speed, nil)
			Managers.transition:show_loading_icon()
		elseif self.network_client and self.network_client.state == "denied_enter_game" then
			if self.network_client.host_to_migrate_to == nil or platform ~= "win32" then
				self.exit_type = "join_lobby_failed"

				if self.network_client.host_to_migrate_to ~= nil and platform ~= "win32" then
					Application.error("[StateIngame] Consoles doesn't support host migration yet")
				end
			else
				self.exit_type = "perform_host_migration"
			end

			if network_manager:in_game_session() then
				local force_diconnect = true

				network_manager:leave_game(force_diconnect)
			end

			Managers.transition:fade_in(GameSettings.transition_fade_in_speed, nil)
			Managers.transition:show_loading_icon()
		elseif self.network_client and self.network_client.state == "eac_match_failed" then
			self.exit_type = "join_lobby_failed"

			if network_manager:in_game_session() then
				local force_diconnect = true

				network_manager:leave_game(force_diconnect)
			end

			Managers.transition:fade_in(GameSettings.transition_fade_in_speed, nil)
			Managers.transition:show_loading_icon()
		elseif (lobby and lobby.state == LobbyState.FAILED) or (self.network_client and self.network_client.state == "lost_connection_to_host") then
			if self.network_client == nil or self.network_client.host_to_migrate_to == nil or platform ~= "win32" then
				self.exit_type = "lobby_state_failed"

				if self.network_client ~= nil and self.network_client.host_to_migrate_to ~= nil and platform ~= "win32" then
					Application.error("[StateIngame] Consoles doesn't support host migration yet")
				end
			else
				self.exit_type = "perform_host_migration"
			end

			if network_manager:in_game_session() then
				local force_diconnect = true

				network_manager:leave_game(force_diconnect)
			end

			Managers.transition:fade_in(GameSettings.transition_fade_in_speed, nil)
			Managers.transition:show_loading_icon()
		elseif self.kicked_by_server then
			self.kicked_by_server = nil
			self.exit_type = "kicked_by_server"

			if self._lobby_client and self._lobby_client.state == LobbyState.JOINED then
				Managers.matchmaking:add_broken_lobby_client(self._lobby_client, t, true)
			end

			if network_manager:in_game_session() then
				local force_diconnect = true

				network_manager:leave_game(force_diconnect)
			end

			Managers.transition:fade_in(GameSettings.transition_fade_in_speed, nil)
			Managers.transition:show_loading_icon()
		elseif transition == "finish_tutorial" then
			self.exit_type = "finished_tutorial"

			self.network_server:disconnect_all_peers("host_left_game")

			if network_manager:in_game_session() then
				local force_diconnect = true

				network_manager:leave_game(force_diconnect)
			end

			Managers.transition:fade_in(GameSettings.transition_fade_in_speed)
			Managers.transition:show_loading_icon()
		elseif transition == "demo_completed" then
			self.exit_type = "demo_completed"

			if network_manager:in_game_session() then
				local force_diconnect = true

				network_manager:leave_game(force_diconnect)
			end

			Managers.transition:force_fade_in()
			Managers.transition:show_video(true)
			Managers.transition:show_loading_icon()
		elseif level_transition_type == "reload_level" then
			self.exit_type = "reload_level"

			if self.is_server then
				local _, locked_director_function_ids = Managers.mechanism:generate_locked_director_functions(self.level_key)
				local level_seed = Managers.mechanism:generate_level_seed()

				network_manager.network_transmit:send_rpc_clients("rpc_reload_level", level_seed, locked_director_function_ids)
				network_manager:leave_game()
			end

			Managers.transition:fade_in(GameSettings.transition_fade_in_speed, nil)
			Managers.transition:show_loading_icon()
		elseif level_transition_type then
			self.exit_type = "load_next_level"

			printf("Transition type %q, is server: %s", tostring(level_transition_type), tostring(self.is_server))

			if self.is_server then
				local level_to_transition_to = self.level_transition_handler:get_current_transition_level()
				local _, locked_director_function_ids = Managers.mechanism:generate_locked_director_functions(level_to_transition_to)
				local level_seed = Managers.mechanism:generate_level_seed()

				self.network_server:set_current_level(level_to_transition_to)
				network_manager.network_transmit:send_rpc_clients("rpc_load_level", NetworkLookup.level_keys[level_to_transition_to], level_seed, difficulty_id, locked_director_function_ids)
				network_manager:leave_game()

				if level_to_transition_to == "prologue" then
					self.parent.loading_context.play_trailer = true
					local switch_to_tutorial_backend, tutorial_state = Managers.mechanism:should_run_tutorial()
					self.parent.loading_context.switch_to_tutorial_backend = switch_to_tutorial_backend
					self.parent.loading_context.wanted_tutorial_state = tutorial_state
				end
			else
				self.network_client:set_wait_for_state_loading(true)
			end

			Managers.transition:fade_in(GameSettings.transition_fade_in_speed, nil)
			Managers.transition:show_loading_icon()
		elseif transition == "leave_game" or transition == "quit_game" or self._quit_game then
			if transition == "leave_game" then
				self.exit_type = "left_game"
			else
				self.exit_type = "quit_game"
			end

			if self.network_server then
				self.network_server:disconnect_all_peers("host_left_game")
			elseif self._lobby_client and self._lobby_client.state == LobbyState.JOINED then
				print("Leaving lobby, noting it as one I don't want to matchmake back into soon")
				Managers.matchmaking:add_broken_lobby_client(self._lobby_client, t, true)
			end

			if network_manager:in_game_session() then
				local force_diconnect = not self.is_server

				network_manager:leave_game(force_diconnect)
			end

			if Development.parameter("attract_mode") then
				Managers.transition:force_fade_in()
			else
				Managers.transition:fade_in(GameSettings.transition_fade_in_speed)
			end

			Managers.transition:show_loading_icon()
		elseif transition == "return_to_pc_menu" then
			self.exit_type = "return_to_pc_menu"

			if self.network_server then
				self.network_server:disconnect_all_peers("host_left_game")
			elseif self._lobby_client and self._lobby_client.state == LobbyState.JOINED then
				print("Leaving lobby, noting it as one I don't want to matchmake back into soon")
				Managers.matchmaking:add_broken_lobby_client(self._lobby_client, t, true)
			end

			if network_manager:in_game_session() then
				local force_diconnect = not self.is_server

				network_manager:leave_game(force_diconnect)
			end

			Managers.matchmaking:cancel_matchmaking()
			Managers.transition:fade_in(GameSettings.transition_fade_in_speed)
			Managers.transition:show_loading_icon()
		elseif transition == "afk_kick" then
			self.exit_type = "afk_kick"

			if network_manager:in_game_session() then
				local force_diconnect = true

				network_manager:leave_game(force_diconnect)
			end

			Managers.transition:fade_in(GameSettings.transition_fade_in_speed, nil)
			Managers.transition:show_loading_icon()
		elseif transition == "join_lobby" then
			self.exit_type = "join_game"

			if network_manager:in_game_session() then
				network_manager:leave_game()
			end

			self.parent.loading_context.join_lobby_data = join_lobby_data

			Managers.transition:fade_in(GameSettings.transition_fade_in_speed)
			Managers.transition:show_loading_icon()
		elseif transition == "start_lobby" then
			self.exit_type = "join_game"

			if network_manager:in_game_session() then
				network_manager:leave_game()
			end

			self.parent.loading_context.start_lobby_data = join_lobby_data

			Managers.transition:fade_in(GameSettings.transition_fade_in_speed)
			Managers.transition:show_loading_icon()
		elseif transition == "join_server" then
			self.exit_type = "join_game"

			if network_manager:in_game_session() then
				network_manager:leave_game()
			end

			self.parent.loading_context.join_server_data = join_lobby_data

			Managers.transition:fade_in(GameSettings.transition_fade_in_speed)
			Managers.transition:show_loading_icon()
		elseif transition == "restart_game" then
			self.exit_type = "restart_game"

			if network_manager:in_game_session() then
				network_manager:leave_game()
			end

			Managers.transition:fade_in(GameSettings.transition_fade_in_speed)
			Managers.transition:show_loading_icon()
		elseif transition == "restart_demo" then
			self.exit_type = "load_next_level"

			printf("Transition type %q, is server: %s", tostring(level_transition_type), tostring(self.is_server))

			if self.is_server then
				local _, locked_director_function_ids = Managers.mechanism:generate_locked_director_functions(level_to_transition_to)
				local level_to_transition_to = DemoSettings.demo_level
				local level_seed = Managers.mechanism:generate_level_seed()

				self.network_server:set_current_level(level_to_transition_to)
				network_manager.network_transmit:send_rpc_clients("rpc_load_level", NetworkLookup.level_keys[level_to_transition_to], level_seed, difficulty_id, locked_director_function_ids)
				network_manager:leave_game()
			else
				self.network_client:set_wait_for_state_loading(true)
			end

			Managers.transition:fade_in(GameSettings.transition_fade_in_speed, nil)
			Managers.transition:show_loading_icon()
		elseif transition == "rejoin_party" then
			self.exit_type = "rejoin_party"

			if network_manager:in_game_session() then
				local force_disconnect = true

				network_manager:leave_game(force_disconnect)
			end

			Managers.transition:fade_in(GameSettings.transition_fade_in_speed, nil)
			Managers.transition:show_loading_icon()
		elseif transition == "restart_game_server" then
			self.exit_type = "restart_game_server"

			if network_manager:in_game_session() then
				local force_diconnect = true

				network_manager:leave_game(force_diconnect)
			end

			Managers.transition:fade_in(GameSettings.transition_fade_in_speed, nil)
			Managers.transition:show_loading_icon()
		elseif transition == "complete_level" then
			self.level_transition_handler:level_completed()
		end

		if self.exit_type then
			if self.is_server and not self.is_in_inn and self.exit_type ~= "reload_level" and Managers.matchmaking and Managers.matchmaking:game_mode_event_data() then
				Managers.matchmaking:clear_game_mode_event_data()
			end

			local exit_time = 2
			self.exit_time = t + exit_time

			printf("StateIngame: Got transition %s, set exit type to %s. Will exit at t=%.2f", tostring(transition), self.exit_type, self.exit_time)

			local input_manager = self.input_manager

			input_manager:block_device_except_service(nil, "keyboard", 1)
			input_manager:block_device_except_service(nil, "mouse", 1)
			input_manager:block_device_except_service(nil, "gamepad", 1)
			Managers.popup:cancel_all_popups()
			self.level_transition_handler:set_transition_exit_type(self.exit_type)

			if platform == "xb1" then
				self.machines[1]:state():trigger_xbox_multiplayer_round_end_events()
			end

			if platform == "ps4" then
				Managers.account:set_realtime_multiplay(false)
			end

			if self.is_in_tutorial then
				local play_go_tutorial_system = Managers.state.entity:system("play_go_tutorial_system")

				if play_go_tutorial_system then
					play_go_tutorial_system:clear_hooks()
				end
			end
		end
	end

	local SESSION_LEAVE_TIMEOUT = 4

	if script_data.honduras_demo then
		local transition_manager = Managers.transition

		if transition_manager:is_video_active() and not transition_manager:is_video_done() then
			return
		end
	end

	if self.exit_time and self.exit_time <= t then
		Managers.popup:cancel_all_popups()
		Managers.account:check_popup_retrigger()

		local exit_type = self.exit_type
		local has_left = network_manager:has_left_game()
		local game_session_is_closed = has_left or not network_manager:in_game_session()

		if not game_session_is_closed and t >= self.exit_time + SESSION_LEAVE_TIMEOUT then
			print("Session leave timeout reached, force disconnecting")
			network_manager:force_disconnect_from_session()

			return
		elseif not game_session_is_closed then
			return
		end

		if self.is_in_tutorial then
			Managers.backend:stop_tutorial()
		end

		if Managers.deed:has_deed() and not self.is_in_inn and self.is_server then
			Managers.deed:reset()
		end

		if exit_type == "quit_game" then
			if network_manager:in_game_session() then
				local force_diconnect = true

				network_manager:leave_game(force_diconnect)
			end

			if PLATFORM == "xb1" and Managers.voice_chat then
				Managers.voice_chat:_remove_all_users()
			end

			Boot.quit_game = true
		elseif exit_type == "join_lobby_failed" or exit_type == "left_game" or exit_type == "lobby_state_failed" or exit_type == "kicked_by_server" or exit_type == "afk_kick" then
			printf("[StateIngame] Transition to StateLoadingRestartNetwork on %q", self.exit_type)
			self.level_transition_handler:set_next_level(self.level_transition_handler:default_level_key())

			if PLATFORM == "xb1" and Managers.voice_chat then
				Managers.voice_chat:_remove_all_users()
			end

			if exit_type == "lobby_state_failed" then
				if self.is_server then
					self.parent.loading_context.previous_session_error = "broken_connection"
				else
					self.parent.loading_context.previous_session_error = "lobby_disconnected"
				end
			elseif exit_type == "kicked_by_server" then
				self.parent.loading_context.previous_session_error = "kicked_by_server"
			elseif exit_type == "join_lobby_failed" and self.network_client then
				self.parent.loading_context.previous_session_error = self.network_client.fail_reason
			elseif exit_type == "afk_kick" then
				self.parent.loading_context.previous_session_error = "afk_kick"
			elseif (exit_type == "return_to_pc_menu" or exit_type == "left_game") and network_manager:in_game_session() then
				local force_diconnect = true

				network_manager:leave_game(force_diconnect)
			end

			self.parent.loading_context.restart_network = true
			self.parent.loading_context.level_end_view_context = nil

			if exit_type == "lobby_state_failed" then
				if PLATFORM ~= "win32" then
					return StateLoading
				else
					return StateTitleScreen
				end
			else
				return StateLoading
			end
		elseif exit_type == "return_to_pc_menu" then
			printf("[StateIngame] Transition to StateLoadingRestartNetwork on %q", self.exit_type)
			self.level_transition_handler:set_next_level(self.level_transition_handler:default_level_key())

			self.parent.loading_context.restart_network = true
			self.parent.loading_context.show_profile_on_startup = true
			self.parent.loading_context.return_to_pc_menu = true

			return StateLoading
		elseif exit_type == "demo_completed" then
			self.parent.loading_context.restart_network = true

			return StateDemoEnd
		elseif exit_type == "finished_tutorial" then
			local loading_context = self.parent.loading_context
			loading_context.finished_tutorial = true

			if Managers.play_go:installed() then
				loading_context.restart_network = true

				self.level_transition_handler:set_next_level(self.level_transition_handler:default_level_key())

				loading_context.play_trailer = Application.user_setting("play_intro_cinematic")

				printf("[StateIngame] Transition to StateLoadingRestartNetwork on %q", exit_type)
			else
				loading_context.restart_network = nil
				local switch_to_tutorial_backend, tutorial_state = Managers.mechanism:should_run_tutorial()
				loading_context.switch_to_tutorial_backend = switch_to_tutorial_backend
				loading_context.wanted_tutorial_state = tutorial_state

				printf("[StateIngame] Transition to StateLoadingRunning on %q", exit_type)
			end

			return StateLoading
		elseif exit_type == "perform_host_migration" then
			local host_migration_info = {
				host_to_migrate_to = self.network_client.host_to_migrate_to
			}

			if Managers.state.game_mode:is_game_mode_ended() then
				local level_key = self.level_transition_handler:default_level_key()
				host_migration_info.level_to_load = level_key
			end

			local is_private = self._lobby_client:lobby_data("is_private")
			local game_mode_key = nil

			if PLATFORM == "ps4" then
				game_mode_key = self._lobby_client:lobby_data("game_mode") or "n/a"
			else
				game_mode_key = self._lobby_client:lobby_data("game_mode") or NetworkLookup.game_modes["n/a"]
			end

			host_migration_info.lobby_data = {
				game_mode = game_mode_key,
				is_private = is_private,
				difficulty = difficulty
			}
			host_migration_info.current_level_key = self.level_transition_handler:get_current_level_keys()
			self.parent.loading_context.host_migration_info = host_migration_info
			self.parent.loading_context.wanted_profile_index = self:wanted_profile_index()
			self.leave_lobby = true

			return StateLoading
		elseif exit_type == "rejoin_party" then
			local loading_context = self.parent.loading_context
			loading_context.restart_network = true
			loading_context.rejoin_lobby = true

			self.level_transition_handler:set_next_level(self.level_transition_handler:default_level_key())

			self.leave_lobby = true

			return StateLoading
		elseif exit_type == "restart_game_server" then
			self.leave_lobby = true

			return StateDedicatedServer
		elseif exit_type == "backend_disconnected" then
			printf("[StateIngame] Transition to StateTitleScreen on %q", self.exit_type)

			self.release_level_resources = true
			self.parent.loading_context = {}

			return StateTitleScreen
		elseif exit_type == "offline_invite" then
			printf("[StateIngame] Transition to StateTitleScreen on %q", self.exit_type)

			self.release_level_resources = true
			self.parent.loading_context = {
				offline_invite = true
			}

			return StateTitleScreen
		elseif exit_type == "return_to_title_screen" then
			printf("[StateIngame] Transition to StateTitleScreen on %q", self.exit_type)

			self.release_level_resources = true
			self.parent.loading_context = {}

			return StateTitleScreen
		elseif exit_type == "return_to_demo_title_screen" then
			printf("[StateIngame] Transition to Demo StateTitleScreen on %q", self.exit_type)

			self.parent.loading_context = {}

			return StateTitleScreen
		elseif exit_type == "load_next_level" or exit_type == "reload_level" then
			self.parent.loading_context.checkpoint_data = self.level_transition_handler.checkpoint_data
			self.parent.loading_context.lobby_host = self._lobby_host
			self.parent.loading_context.lobby_client = self._lobby_client
			self.parent.loading_context.matchmaking_loading_context = Managers.matchmaking:loading_context()
			self.parent.loading_context.wanted_profile_index = self:wanted_profile_index()
			self.parent.loading_context.quickplay_bonus = Managers.matchmaking:is_quick_game()
			self.parent.loading_context.previous_session_error = Managers.twitch and Managers.twitch:get_twitch_popup_message()

			return StateLoading
		elseif exit_type == "join_game" then
			self.leave_lobby = true
			self.parent.loading_context.matchmaking_loading_context = Managers.matchmaking:loading_context()
			self.parent.loading_context.wanted_profile_index = self:wanted_profile_index()
			self.parent.loading_context.quickplay_bonus = Managers.matchmaking:is_quick_game()

			return StateLoading
		elseif exit_type == "restart_game" then
			printf("[StateIngame] Transition to StateSplashScreen on %q", self.exit_type)

			self.leave_lobby = true
			self.release_level_resources = true
			self.parent.loading_context.restart_network = true
			self.parent.loading_context.reload_packages = true

			return StateSplashScreen
		end
	end
end

StateIngame.wanted_profile_index = function (self)
	local peer_id = Network.peer_id()
	local player = Managers.player:player_from_peer_id(peer_id)
	local current_profile_index = player and player:profile_index()

	if self.is_in_tutorial then
		current_profile_index = nil
	end

	local selected_profile_index = Managers.matchmaking.selected_profile_index
	local saved_profile_index = SaveData.wanted_profile_index
	local wanted_profile_index = selected_profile_index or current_profile_index or saved_profile_index or 0

	return wanted_profile_index
end

StateIngame.post_update = function (self, dt)
	local t = Managers.time:time("game")

	self.entity_system:post_update(dt, t)

	for _, machine in pairs(self.machines) do
		if machine.post_update then
			machine:post_update(dt, t)
		end
	end

	Managers.state.game_mode:update_flow_object_set_enable(dt)

	local network_manager = Managers.state.network

	network_manager.network_transmit:transmit_local_rpcs()
	Managers.state.unit_spawner:update_death_watch_list(dt, t)
	Managers.state.conflict:post_update()
	self.entity_system:commit_and_remove_pending_units()
	network_manager:update_transmit(dt)

	if Managers.voice_chat then
		Managers.voice_chat:update(dt, t)
	end
end

StateIngame.pre_render = function (self)
	if not self.machines then
		return
	end

	for _, machine in pairs(self.machines) do
		if machine.pre_render then
			machine:pre_render()
		end
	end
end

StateIngame.render = function (self)
	if not self.machines then
		return
	end

	for _, machine in pairs(self.machines) do
		if machine.render then
			machine:render()
		end
	end
end

StateIngame.post_render = function (self)
	if not self.machines then
		return
	end

	for _, machine in pairs(self.machines) do
		if machine.post_render then
			machine:post_render()
		end
	end
end

StateIngame.on_exit = function (self, application_shutdown)
	UPDATE_POSITION_LOOKUP()

	if self.is_in_inn and not self._gm_event_end_conditions_met and not application_shutdown then
		Managers.backend:commit()
	end

	self._camera_carrier:destroy()

	self._camera_carrier = nil

	self.free_flight_manager:cleanup_free_flight()

	if PLATFORM == "xb1" and not self.hero_stats_updated then
		Managers.xbox_stats:update_hero_stats(nil)

		self.hero_stats_updated = true
	end

	self._fps_reporter:report()
	self:_check_and_add_end_game_telemetry(application_shutdown)

	if TelemetrySettings.collect_memory then
		local memory_tree = Profiler.memory_tree()
		local memory_resources = Profiler.memory_resources("all")

		Managers.telemetry.events:memory_statistics(memory_tree, memory_resources, "game_ended")
	end

	if TelemetrySettings.send then
		Managers.telemetry:send()
	else
		printf("[StateIngame] Skipped uploading telemetry data")
	end

	Managers.telemetry.rpc_listener:unregister(self.network_event_delegate)
	Managers.state.performance_title:unregister_rpcs()
	DebugKeyHandler.set_enabled(false)
	DebugScreen.destroy()
	self.network_timer_handler:unregister_rpcs()
	self.network_timer_handler:destroy()

	self.network_timer_handler = nil

	self.network_clock:unregister_rpcs()
	self.network_clock:destroy()

	self.network_clock = nil

	if Managers.twitch then
		local level_key = self.level_transition_handler:get_current_level_keys()
		local level_settings = LevelSettings[level_key]

		if level_settings and not level_settings.disable_twitch_game_mode then
			Managers.twitch:deactivate_twitch_game_mode()
		end
	end

	for local_player_id, machine in pairs(self.machines) do
		Managers.player:remove_player(Network.peer_id(), local_player_id)
		machine:destroy()
	end

	self.machines = nil

	Network.write_dump_tag("end of game")
	Managers.music:on_exit_level()
	self.level_transition_handler:unregister_rpcs()
	self.level_transition_handler:unregister_events(Managers.state.event)
	self.level_transition_handler:clear_transition_exit_type()
	Managers.mechanism:unregister_rpcs()
	Managers.party:unregister_rpcs()
	Managers.state.game_mode:cleanup_game_mode_units()

	local unit_spawner = Managers.state.unit_spawner
	unit_spawner.locked = false

	unit_spawner:commit_and_remove_pending_units()

	local world = self.world
	local unit_storage = Managers.state.unit_storage
	local units = unit_storage:units()

	for id, unit_to_destroy in pairs(units) do
		Managers.state.entity:unregister_unit(unit_to_destroy)
		World.destroy_unit(world, unit_to_destroy)
	end

	self.entity_system:destroy()
	self.entity_system_bag:destroy()
	Level.trigger_level_shutdown(self.level)
	Managers.player:exit_ingame()
	self:_teardown_level()
	Managers.weave:teardown()

	local difficulty = Managers.state.difficulty:get_difficulty()

	Managers.state:destroy()
	VisualAssertLog.cleanup()
	self:_teardown_world()
	ScriptUnit.check_all_units_deleted()
	self.level_transition_handler.enemy_package_loader:unload_enemy_packages(application_shutdown)
	self.statistics_db:unregister_network_event_delegate()
	Managers.time:unregister_timer("game")

	local matchmaking_loading_context = self.parent.loading_context.matchmaking_loading_context

	if matchmaking_loading_context and matchmaking_loading_context.network_client then
		matchmaking_loading_context.network_client:unregister_rpcs()
	end

	if self.network_client then
		self.network_client:unregister_rpcs()
	end

	if self.network_server and not application_shutdown then
		self.network_server:on_level_exit()
	end

	if self.network_client then
		self.network_client.voip:set_input_manager(nil)
	end

	if self.network_server then
		self.network_server.voip:set_input_manager(nil)
	end

	if Managers.matchmaking then
		Managers.matchmaking:unregister_rpcs()
	end

	Managers.deed:unregister_rpcs()

	if application_shutdown or self.leave_lobby then
		if Managers.matchmaking then
			Managers.matchmaking:destroy()

			Managers.matchmaking = nil
		end

		if Managers.game_server then
			Managers.game_server:destroy()

			Managers.game_server = nil
		end

		Managers.chat:unregister_channel(1)
		Managers.deed:network_context_destroyed()
		self.level_transition_handler.enemy_package_loader:network_context_destroyed()
		Managers.party:network_context_destroyed()

		local loading_context = self.parent.loading_context
		local host_migration_info = loading_context and loading_context.host_migration_info
		local current_level_key = host_migration_info and host_migration_info.current_level_key

		Managers.mechanism:network_context_destroyed(current_level_key)

		local network_event_meta_table = {
			__index = function (event_table, event_key)
				return function ()
					Application.warning("Got RPC %s during forced network update when exiting StateIngame", event_key)
				end
			end
		}

		if self._lobby_host then
			if self.network_server then
				self.network_server:destroy()

				self.network_server = nil
			end

			self._lobby_host:destroy()

			self._lobby_host = nil

			Network.update(0, setmetatable({}, network_event_meta_table))
			Managers.account:set_current_lobby(nil)

			self.parent.loading_context.lobby_host = nil
		end

		if self._lobby_client then
			if self.network_client then
				self.network_client:destroy()

				self.network_client = nil
			end

			self._lobby_client:destroy()

			self._lobby_client = nil

			Network.update(0, setmetatable({}, network_event_meta_table))
			Managers.account:set_current_lobby(nil)

			self.parent.loading_context.lobby_client = nil
		end

		if application_shutdown and rawget(_G, "LobbyInternal") then
			LobbyInternal.shutdown_client()
		end

		self.profile_synchronizer = nil
		self.parent.loading_context.network_client = nil
		self.parent.loading_context.network_server = nil
		self.parent.loading_context.network_transmit = nil

		self.network_transmit:destroy()

		self.network_transmit = nil
	else
		self.profile_synchronizer:unregister_network_events()

		if self.is_server and not self.is_in_inn and not self.is_in_tutorial and PLATFORM == "xb1" and not script_data.honduras_demo then
			local level_key = self.level_transition_handler:get_next_level_key()
			local level_setting = LevelSettings[level_key]

			if level_setting.hub_level or level_key == "prologue" then
				Application.warning("Cancelling matchmaking")
				self._lobby_host:enable_matchmaking(false)
			end
		end

		if DEDICATED_SERVER and self.is_in_inn then
			local leader_peer_id = Managers.party:leader()

			print(string.format("Start loading leader %s's characters and gear in the backend", leader_peer_id))
			Managers.backend:update_items(leader_peer_id)
		end
	end

	self.free_flight_manager:unregister_input_manager()

	self.free_flight_manager = nil
	self.parent = nil

	if self._debug_event_manager_rpc then
		self._debug_event_manager_rpc:delete()

		self._debug_event_manager_rpc = nil
	end

	Managers.chat:unregister_network_event_delegate()
	self.dice_keeper:unregister_rpc()

	self.dice_keeper = nil

	Managers.popup:remove_input_manager(application_shutdown)
	InputDebugger:clear()
	self.input_manager:destroy()

	self.input_manager = nil
	Managers.input = nil

	self.network_event_delegate:unregister(self)
	self.network_event_delegate:destroy()

	self.network_event_delegate = nil

	if application_shutdown or self.release_level_resources then
		self.level_transition_handler:release_level_resources(self.level_key)
	end

	Managers.transition:show_loading_icon()
	self:_remove_ingame_clock()
	Managers.unlock:enable_update_unlocks(false)
	Managers.package:unload_dangling_painting_materials()
end

StateIngame.on_close = function (self)
	if self.network_server and self.network_server:num_active_peers() > 1 and not Development.parameter("disable_exit_popup_warning") then
		if self._onclose_called then
			if self.is_in_inn then
				self:_commit_playfab_stats()
			else
				self._quit_game = true
			end
		else
			self._onclose_called = true

			Managers.chat.chat_gui:hide_chat()
			Managers.chat.chat_gui:unblock_input()
		end
	elseif self.is_in_inn then
		self:_commit_playfab_stats()
	else
		self._quit_game = true
	end

	return false
end

StateIngame._commit_playfab_stats = function (self)
	local backend_manager = Managers.backend

	local function callback(status)
		self._quit_game = true
	end

	if backend_manager:is_local() then
		backend_manager:commit(true)
		callback()
	else
		backend_manager:commit(true, callback)
	end
end

StateIngame._check_and_add_end_game_telemetry = function (self, application_shutdown)
	local player = Managers.player:player_from_peer_id(self.peer_id)
	local level_key = self.level_key
	local difficulty = Managers.state.difficulty:get_difficulty()
	local reason = self.exit_type

	if application_shutdown then
		local controlled_exit = Boot.is_controlled_exit

		if controlled_exit then
			reason = "controlled_exit"
		else
			reason = "forced_exit"
		end
	else
		local level_related_reason = self.exit_type == "load_next_level" or self.exit_type == "reload_level"

		if level_related_reason then
			if Managers.state.game_mode:game_won(player) then
				reason = "won"
			elseif Managers.state.game_mode:game_lost(player) then
				reason = "lost"
			end
		end
	end

	Managers.telemetry.events:game_ended(reason)
end

StateIngame._setup_state_context = function (self, world, is_server, network_event_delegate)
	local network_clock = nil

	if self.is_server then
		network_clock = NetworkClockServer:new()
	else
		network_clock = NetworkClockClient:new()
	end

	self.network_clock = network_clock

	network_clock:register_rpcs(network_event_delegate)

	local network_manager = GameNetworkManager:new(world, self._lobby_host or self._lobby_client, is_server, network_event_delegate)
	Managers.state.network = network_manager
	local build = BUILD

	if build == "debug" or build == "dev" then
		self._debug_event_manager_rpc = DebugEventManagerRPC:new(network_event_delegate)
	end

	if Development.parameter("weave_name") and not Managers.weave:get_active_objective() then
		Managers.mechanism:choose_next_state("weave")
		Managers.mechanism:progress_state()
	end

	local game_mode_key, side_compositions = Managers.mechanism:start_next_round(self.level_transition_handler)
	Managers.state.side = SideManager:new(side_compositions)
	Managers.state.event = EventManager:new()

	self.level_transition_handler:register_events(Managers.state.event)

	self.game_mode_key = game_mode_key

	Managers.weave:initiate(world, network_event_delegate, is_server, game_mode_key)
	Managers.backend:set_talents_interface_override(game_mode_key)

	local loadout_changed = Managers.backend:set_loadout_interface_override(game_mode_key)

	fassert(not loadout_changed, "[StateIngame] Correct loadout should already have been selected and re-synced in StateLoading")

	Managers.state.game_mode = GameModeManager:new(world, self._lobby_host, self._lobby_client, self.level_transition_handler, network_event_delegate, self.statistics_db, game_mode_key, self.network_server, self.network_transmit, self.profile_synchronizer)
	local level_key = self.level_transition_handler:get_current_level_keys()
	local level_seed = Managers.mechanism:get_level_seed()
	Managers.state.conflict = ConflictDirector:new(world, level_key, network_event_delegate, level_seed, is_server)
	Managers.state.networked_flow_state = NetworkedFlowStateManager:new(world, is_server, network_event_delegate)

	GarbageLeakDetector.register_object(Managers.state.game_mode, "GameModeManager")
	GarbageLeakDetector.register_object(Managers.state.conflict, "ConflictDirector")

	local is_server = (self._lobby_host and true) or false
	local is_client = (self._lobby_client and true) or false
	Managers.state.camera = CameraManager:new(world)

	GarbageLeakDetector.register_object(Managers.state.camera, "CameraManager")

	local entity_manager = EntityManager2:new()
	Managers.state.entity = entity_manager

	if not DEDICATED_SERVER then
		Managers.state.decal = DecalManager:new(world)
	end

	local unit_templates = require("scripts/network/unit_extension_templates")

	local function extension_extractor_function(unit, unit_template_name)
		if not unit_template_name then
			local extensions = ScriptUnit.extension_definitions(unit)
			local num_extensions = #extensions

			return extensions, num_extensions
		end

		local is_network_unit = NetworkUnit.is_network_unit(unit)
		local is_husk = is_network_unit and NetworkUnit.is_husk_unit(unit)

		assert(is_server or is_client)

		local extensions, num_extensions = unit_templates.get_extensions(unit_template_name, is_husk, is_server)

		return extensions, num_extensions
	end

	Managers.state.entity:set_extension_extractor_function(extension_extractor_function)

	self._debug_gui = World.create_screen_gui(world, "material", "materials/fonts/gw_fonts")
	self._debug_gui_immediate = World.create_screen_gui(world, "material", "materials/fonts/gw_fonts", "immediate")
	Managers.state.debug_text = DebugTextManager:new(world, self._debug_gui, is_server, network_event_delegate)
	Managers.state.performance = PerformanceManager:new(self._debug_gui_immediate, is_server, level_key)
	Managers.state.world_interaction = WorldInteractionManager:new(self.world)
	local wwise_world = Managers.world:wwise_world(world)
	local voting_params = {
		level_transition_handler = self.level_transition_handler,
		network_event_delegate = network_event_delegate,
		is_server = self.is_server,
		input_manager = self.input_manager,
		network_server = self.network_server,
		wwise_world = wwise_world
	}
	Managers.state.voting = VoteManager:new(voting_params)
	self.dice_keeper = DiceKeeper:new(7)

	self.dice_keeper:register_rpcs(network_event_delegate)

	local unit_spawner = UnitSpawner:new(world, entity_manager, is_server)
	Managers.state.unit_spawner = unit_spawner

	self.level_transition_handler.enemy_package_loader:set_unit_spawner(unit_spawner)
	unit_spawner:set_unit_template_lookup_table(unit_templates)

	local unit_storage = NetworkUnitStorage:new()
	Managers.state.unit_storage = unit_storage

	unit_spawner:set_unit_storage(unit_storage)

	local go_context = {
		world = world
	}
	local unit_go_sync_functions = require("scripts/network/game_object_initializers_extractors")

	unit_spawner:set_gameobject_initializer_data(unit_go_sync_functions.initializers, unit_go_sync_functions.extractors, go_context)
	unit_spawner:set_gameobject_to_unit_creator_function(unit_go_sync_functions.unit_from_gameobject_creator_func)

	self.free_flight_manager = Managers.free_flight

	self.free_flight_manager:register_input_manager(self.input_manager)

	self.network_timer_handler = NetworkTimerHandler:new(self.world, self.network_clock, self.is_server)

	self.network_timer_handler:register_rpcs(network_event_delegate)

	Managers.state.debug = DebugManager:new(world, self.free_flight_manager, self.input_manager, network_event_delegate, is_server)
	Managers.state.spawn = SpawnManager:new(world, is_server, network_event_delegate, unit_spawner, self.profile_synchronizer, self.network_server)
	local level_transition_handler = self.level_transition_handler
	local level_key = level_transition_handler:get_current_level_keys()
	local network_manager_post_init_data = {
		profile_synchronizer = self.profile_synchronizer,
		game_mode = Managers.state.game_mode,
		networked_flow_state = Managers.state.networked_flow_state,
		room_manager = Managers.state.room,
		spawn_manager = Managers.state.spawn,
		network_clock = self.network_clock,
		player_manager = Managers.player,
		network_transmit = self.network_transmit,
		network_server = self.network_server,
		network_client = self.network_client,
		statistics_db = self.statistics_db,
		difficulty_manager = Managers.state.difficulty,
		weave_manager = Managers.weave,
		matchmaking_manager = Managers.matchmaking,
		voting_manager = Managers.state.voting,
		game_server_manager = Managers.game_server
	}

	network_manager:post_init(network_manager_post_init_data)

	self.entity_system_bag = EntitySystemBag:new()
	local entity_systems_init_context = {
		entity_manager = entity_manager,
		input_manager = self.input_manager,
		unit_spawner = unit_spawner,
		world = self.world,
		startup_data = {
			level_key = level_key
		},
		is_server = is_server,
		free_flight_manager = self.free_flight_manager,
		network_event_delegate = network_event_delegate,
		unit_storage = unit_storage,
		entity_system_bag = self.entity_system_bag,
		network_clock = self.network_clock,
		network_manager = Managers.state.network,
		network_lobby = self._lobby_host or self._lobby_client,
		network_transmit = self.network_transmit,
		network_server = self.network_server,
		profile_synchronizer = self.profile_synchronizer,
		dice_keeper = self.dice_keeper,
		system_api = {},
		statistics_db = self.statistics_db,
		num_local_human_players = self.num_local_human_players,
		level_transition_handler = level_transition_handler
	}
	local entity_system = EntitySystem:new(entity_systems_init_context)

	GarbageLeakDetector.register_object(entity_system, "EntitySystem")
	GarbageLeakDetector.register_object(entity_systems_init_context, "entity_systems_init_context")
	GarbageLeakDetector.register_object(entity_systems_init_context.system_api, "system_api")

	self.entity_system = entity_system

	Managers.player:set_is_server(is_server, network_event_delegate, Managers.state.network)
	Managers.state.network:set_entity_system(entity_system)
	Managers.state.network:set_unit_storage(unit_storage)
	Managers.state.network:set_unit_spawner(unit_spawner)

	local ai_system = Managers.state.entity:system("ai_system")
	local nav_world = ai_system:nav_world()
	local physics_world = World.get_data(world, "physics_world")
	Managers.state.bot_nav_transition = BotNavTransitionManager:new(world, physics_world, nav_world, is_server, network_event_delegate)
	Managers.state.quest = QuestManager:new(self.statistics_db)
	Managers.state.badge = BadgeManager:new(self.statistics_db, network_event_delegate, is_server)
	Managers.state.achievement = AchievementManager:new(self.world, self.statistics_db)

	if DEDICATED_SERVER then
		Managers.state.blood = BloodManagerDummy:new()
	else
		Managers.state.blood = BloodManager:new(self.world)
	end

	Managers.state.performance_title = PerformanceTitleManager:new(self.network_transmit, self.statistics_db, is_server)

	Managers.state.performance_title:register_rpcs(network_event_delegate)
end

StateIngame.rpc_kick_peer = function (self, sender)
	if self.network_client == nil then
		return
	end

	if self.network_client.server_peer_id ~= sender then
		return
	end

	if self.is_server then
		return
	end

	if Managers.party:is_leader(self.peer_id) then
		return
	end

	self.kicked_by_server = true
end

StateIngame.event_play_particle_effect = function (self, effect_name, unit, node, offset, rotation_offset, linked)
	if linked then
		ScriptWorld.create_particles_linked(self.world, effect_name, unit, node, "destroy", Matrix4x4.from_quaternion_position(rotation_offset, offset))
	else
		local pos, rot = nil

		if unit then
			pos = Unit.world_position(unit, node)
			rot = Unit.world_rotation(unit, node)
		else
			pos = Vector3(0, 0, 0)
			rot = Quaternion.identity()
		end

		local global_transform = Matrix4x4.from_quaternion_position(rot, pos)
		local local_transform = Matrix4x4.from_quaternion_position(rotation_offset, offset)
		local transform = Matrix4x4.multiply(local_transform, global_transform)

		World.create_particles(self.world, effect_name, Matrix4x4.translation(transform), Matrix4x4.rotation(transform))
	end
end

StateIngame.gm_event_end_conditions_met = function (self, reason, checkpoint_available, percentages_completed)
	Managers.state.game_mode:gm_event_end_conditions_met(reason, checkpoint_available, percentages_completed)
	LevelHelper:flow_event(self.world, "gm_event_end_conditions_met")

	self._gm_event_end_conditions_met = true

	if self.is_server then
		Managers.state.voting:set_vote_kick_enabled(false)
	end

	Managers.state.conflict:set_disabled(true)

	local player = Managers.player:player_from_peer_id(self.peer_id)
	local game_mode_key = Managers.state.game_mode:game_mode_key()
	local game_won, game_lost = Managers.state.game_mode:evaluate_end_condition_outcome(reason, player)

	print("gm_event_end_conditions_met", game_won, game_lost)
	Managers.popup:cancel_all_popups()
	Managers.account:check_popup_retrigger()

	if game_mode_key == "survival" then
		if game_won and self.is_server then
			local leaderboard_system = Managers.state.entity:system("leaderboard_system")

			leaderboard_system:round_completed()

			if GameSettingsDevelopment.use_leaderboards or Development.parameter("use_leaderboards") then
				StatisticsUtil.register_online_leaderboards_data(self.statistics_db)
			end
		end
	elseif game_won then
		local mission_system = Managers.state.entity:system("mission_system")

		mission_system:start_mission("players_alive_mission")
		mission_system:evaluate_level_end_missions()

		if PLATFORM == "ps4" then
			local level_key = Managers.state.game_mode:level_key()
			local level_display_name = LevelSettings[level_key].display_name
			local difficulty_display_name = Managers.state.difficulty:get_difficulty_settings().display_name

			Managers.account:activity_feed_post_mission_completed(level_display_name, difficulty_display_name)
		end
	elseif game_lost and self.is_server and checkpoint_available then
		Managers.state.voting:request_vote("continue_level", nil, Network.peer_id())
	end

	if self.is_server and not self.is_in_inn then
		local human_players = Managers.player:human_players()

		Managers.state.performance_title:evaluate_titles(human_players)
	end

	for _, machine in pairs(self.machines) do
		machine:state():gm_event_end_conditions_met(reason, checkpoint_available, percentages_completed)
	end
end

StateIngame._generate_ingame_clock = function (self)
	if self.network_server and Managers.time:time("client_ingame") == nil then
		local peer_state_machines = self.network_server.peer_state_machines

		for peer, machine in pairs(peer_state_machines) do
			if machine.current_state.state_name == "InGame" then
				Managers.time:register_timer("client_ingame", "main", 0)

				break
			end
		end
	end
end

StateIngame._remove_ingame_clock = function (self)
	local time_system = Managers.time

	if time_system:has_timer("client_ingame") then
		time_system:unregister_timer("client_ingame")
	end
end

StateIngame._handle_onclose_warning_result = function (self)
	if self._onclose_popup_id then
		local popup_result = Managers.popup:query_result(self._onclose_popup_id)

		if popup_result == "end_game" then
			if self.is_in_inn then
				self:_commit_playfab_stats()
			else
				self._quit_game = true
			end
		elseif popup_result == "cancel_popup" then
			self._onclose_popup_id = nil
			self._onclose_called = false
		end
	end
end

return

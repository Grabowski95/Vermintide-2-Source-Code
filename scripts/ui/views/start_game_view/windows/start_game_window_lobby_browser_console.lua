require("scripts/ui/views/lobby_item_list")
require("scripts/network/lobby_aux")

local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_lobby_browser_console_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local console_cursor_definition = definitions.console_cursor_definition
local input_delay_before_start_new_search = 0
local platform = PLATFORM

if platform ~= "ps4" or not {
	LobbyDistanceFilter.CLOSE,
	LobbyDistanceFilter.MEDIUM,
	LobbyDistanceFilter.WORLD
} then
	local MapLobbyDistanceFilter = {
		LobbyDistanceFilter.CLOSE,
		LobbyDistanceFilter.MEDIUM,
		LobbyDistanceFilter.FAR,
		LobbyDistanceFilter.WORLD
	}
end

local network_options = {
	project_hash = "bulldozer",
	config_file_name = "global",
	lobby_port = GameSettingsDevelopment.network_port,
	max_members = MatchmakingSettings.MAX_NUMBER_OF_PLAYERS
}
StartGameWindowLobbyBrowserConsole = class(StartGameWindowLobbyBrowserConsole)
StartGameWindowLobbyBrowserConsole.NAME = "StartGameWindowLobbyBrowserConsole"

StartGameWindowLobbyBrowserConsole.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowLobbyBrowserConsole")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.difficulty_manager = Managers.state.difficulty
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}
	self._ui_animations = {}
	local lobby_finder = LobbyFinder:new(network_options, MatchmakingSettings.MAX_NUM_LOBBIES, true)
	self.lobby_finder = lobby_finder
	local disable_dedicated_servers = Development.parameter("use_lan_backend") or rawget(_G, "Steam") == nil
	local supported_on_platform = PLATFORM == "win32"
	local game_server_finder = nil

	if disable_dedicated_servers or not supported_on_platform then
		game_server_finder = GameServerFinderLan:new(network_options, MatchmakingSettings.MAX_NUM_SERVERS)
	else
		game_server_finder = GameServerFinder:new(network_options, MatchmakingSettings.MAX_NUM_SERVERS)
	end

	self.game_server_finder = game_server_finder
	definitions.game_mode_data = definitions.setup_game_mode_data(self.statistics_db, self._stats_id)

	self:create_ui_elements(params, offset)

	self._current_lobby_type = "lobbies"
	local input_service = self.parent:window_input_service()
	local input_service_name = input_service.name
	local settings = {
		use_top_renderer = true,
		num_list_items = 15,
		input_service_name = input_service_name,
		offset = offset
	}
	self.lobby_list = LobbyItemsList:new(ingame_ui_context, settings)
	self.lobby_list_update_timer = MatchmakingSettings.TIME_BETWEEN_EACH_SEARCH
	self.show_invalid = false
	self.selected_gamepad_widget_index = 1
	self._draw_invalid_checkbox = BUILD == "dev" or BUILD == "debug"
	self._base_widgets_by_name.invalid_checkbox.content.visible = self._draw_invalid_checkbox
	self._current_server_name = ""

	Managers.matchmaking:set_active_lobby_browser(self)
	self:_populate_lobby_list()
	self:_start_transition_animation("on_enter")
	Managers.input:enable_gamepad_cursor()
	self.parent:change_generic_actions("default_lobby_browser")
end

StartGameWindowLobbyBrowserConsole._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

StartGameWindowLobbyBrowserConsole.create_ui_elements = function (self, params, offset)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions.base) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._base_widgets = widgets
	self._base_widgets_by_name = widgets_by_name
	local lobbies_widgets = {}
	local lobbies_widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions.lobbies) do
		local widget = UIWidget.init(widget_definition)
		lobbies_widgets[#lobbies_widgets + 1] = widget
		lobbies_widgets_by_name[name] = widget
	end

	self._lobbies_widgets = lobbies_widgets
	self._lobbies_widgets_by_name = lobbies_widgets_by_name
	local server_widgets = {}
	local server_widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions.servers) do
		local widget = UIWidget.init(widget_definition)
		server_widgets[#server_widgets + 1] = widget
		server_widgets_by_name[name] = widget
	end

	self._server_widgets = server_widgets
	self._server_widgets_by_name = server_widgets_by_name
	local lobby_info_box_base_widgets = {}
	local lobby_info_box_base_widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions.lobby_info_box_base) do
		local widget = UIWidget.init(widget_definition)
		lobby_info_box_base_widgets[#lobby_info_box_base_widgets + 1] = widget
		lobby_info_box_base_widgets_by_name[name] = widget
	end

	self._lobby_info_box_base_widgets = lobby_info_box_base_widgets
	self._lobby_info_box_base_widgets_by_name = lobby_info_box_base_widgets_by_name
	local lobby_info_box_lobbies_widgets = {}
	local lobby_info_box_lobbies_widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions.lobby_info_box_lobbies) do
		local widget = UIWidget.init(widget_definition)
		lobby_info_box_lobbies_widgets[#lobby_info_box_lobbies_widgets + 1] = widget
		lobby_info_box_lobbies_widgets_by_name[name] = widget
	end

	self._lobby_info_box_lobbies_widgets = lobby_info_box_lobbies_widgets
	self._lobby_info_box_lobbies_widgets_by_name = lobby_info_box_lobbies_widgets_by_name
	local lobby_info_box_servers_widgets = {}
	local lobby_info_box_servers_widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions.lobby_info_box_servers) do
		local widget = UIWidget.init(widget_definition)
		lobby_info_box_servers_widgets[#lobby_info_box_servers_widgets + 1] = widget
		lobby_info_box_servers_widgets_by_name[name] = widget
	end

	self._lobby_info_box_servers_widgets = lobby_info_box_servers_widgets
	self._lobby_info_box_servers_widgets_by_name = lobby_info_box_servers_widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	self._console_cursor = UIWidget.init(console_cursor_definition)

	self:_assign_hero_portraits()
	self:_reset_filters()
end

StartGameWindowLobbyBrowserConsole._assign_hero_portraits = function (self)
	local widget = self._lobby_info_box_base_widgets_by_name.hero_tabs
	local content = widget.content

	for index, profile_index in ipairs(ProfilePriority) do
		local name_sufix = "_" .. tostring(index)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = content[hotspot_name]
		local icon_name = "icon" .. name_sufix
		local profile_settings = SPProfiles[profile_index]
		local ui_portrait = profile_settings.ui_portrait
		hotspot_content[icon_name] = ui_portrait
	end
end

StartGameWindowLobbyBrowserConsole.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowLobbyBrowserConsole")

	self.ui_animator = nil

	Managers.matchmaking:set_active_lobby_browser(nil)
	self.lobby_finder:destroy()

	self.lobby_finder = nil

	Managers.input:disable_gamepad_cursor()
end

StartGameWindowLobbyBrowserConsole.update = function (self, dt, t)
	self.lobby_finder:update(dt)
	self.game_server_finder:update(dt)

	local is_refreshing = self:_is_refreshing()

	if self._searching and not is_refreshing then
		self._searching = false

		self:_populate_lobby_list()
	end

	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:draw(dt)
	self:_update_auto_refresh(dt)

	local loading = self._searching
	local lobby_list = self.lobby_list

	lobby_list:update(dt, loading)
	lobby_list:draw(dt, self.ui_top_renderer)

	local lobby_index_selected = lobby_list.lobby_list_index_changed

	if lobby_index_selected then
		lobby_list:on_lobby_selected(lobby_index_selected)

		local lobby_data = lobby_list:selected_lobby()

		self:_setup_lobby_info_box(lobby_data)
	end

	local widgets_by_name = self._base_widgets_by_name
	local join_button_hotspot = widgets_by_name.join_button.content.button_hotspot
	local search_button_hotspot = widgets_by_name.search_button.content.button_hotspot
	local reset_button_hotspot = widgets_by_name.reset_button.content.button_hotspot
	local lobby_type_button_hotspot = widgets_by_name.lobby_type_button.content.button_hotspot
	local lobby_data = lobby_list:selected_lobby()

	self:_update_join_button(lobby_data)

	if self._draw_invalid_checkbox then
		local checkbox_content = self._base_widgets_by_name.invalid_checkbox.content
		local checkbox_hotspot = checkbox_content.button_hotspot

		if checkbox_hotspot.on_hover_enter then
			self:_play_sound("Play_hud_hover")
		end

		if checkbox_hotspot.on_release then
			checkbox_content.checked = not checkbox_content.checked
			self.search_timer = input_delay_before_start_new_search

			self:_play_sound("Play_hud_select")
		end
	end

	if search_button_hotspot.on_hover_enter or join_button_hotspot.on_hover_enter or reset_button_hotspot.on_hover_enter or lobby_type_button_hotspot.on_hover_enter then
		self:_play_sound("Play_hud_hover")
	end

	if not join_button_hotspot.disable_button then
		local join_lobby_data_id = self.join_lobby_data_id

		if join_button_hotspot.on_release and not join_lobby_data_id and lobby_data then
			self:_play_sound("Play_hud_select")
			self:_join(lobby_data)
		end
	end

	if lobby_type_button_hotspot.on_release then
		self:_play_sound("Play_hud_select")

		lobby_type_button_hotspot.on_release = nil
		local current_lobby_type = self._current_lobby_type
		local new_lobby_type = "lobbies"

		if current_lobby_type == "lobbies" then
			new_lobby_type = "servers"
		end

		self:_switch_lobby_type(new_lobby_type)
	end

	if search_button_hotspot.on_release then
		self:_play_sound("Play_hud_select")

		search_button_hotspot.on_release = nil

		self:_search()
	end

	if reset_button_hotspot.on_release then
		self:_play_sound("Play_hud_select")

		reset_button_hotspot.on_release = nil

		self:_reset_filters()
	end

	if self.search_timer then
		self.search_timer = self.search_timer - dt

		if self.search_timer < 0 then
			self:_search()

			self.search_timer = nil
		end
	end
end

StartGameWindowLobbyBrowserConsole.post_update = function (self, dt, t)
	return
end

StartGameWindowLobbyBrowserConsole._setup_lobby_info_box = function (self, lobby_data)
	local info_box_widgets = self._lobby_info_box_base_widgets_by_name
	local info_box_widgets_lobbies = self._lobby_info_box_lobbies_widgets_by_name
	local info_box_widgets_servers = self._lobby_info_box_servers_widgets_by_name
	local level_image = "level_image_any"
	local level_name = "lb_level_unknown"
	local level_key = lobby_data.selected_level_key or lobby_data.level_key

	if level_key then
		local level_settings = LevelSettings[level_key]
		level_image = level_settings.level_image
		level_name = level_settings.display_name
	end

	local level_image_widget = info_box_widgets.level_image
	level_image_widget.content.texture_id = level_image
	local level_name_widget = info_box_widgets.level_name
	level_name_widget.content.text = Localize(level_name)
	local info_frame_level_name_lobbies_widget = info_box_widgets_lobbies.info_frame_level_name_text
	info_frame_level_name_lobbies_widget.content.text = Localize(level_name)
	local info_frame_level_name_servers_widget = info_box_widgets_servers.info_frame_level_name_text
	info_frame_level_name_servers_widget.content.text = Localize(level_name)
	local occupied_profiles = {}
	local num_profiles = #SPProfiles

	for i = 1, num_profiles, 1 do
		if not SlotAllocator.is_free_in_lobby(i, lobby_data) then
			occupied_profiles[i] = true
		end
	end

	local content = info_box_widgets.hero_tabs.content

	for i = 1, #ProfilePriority, 1 do
		local profile_index = ProfilePriority[i]
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = content[hotspot_name]

		if occupied_profiles[profile_index] then
			hotspot_content.disable_button = true
		else
			hotspot_content.disable_button = false
		end
	end

	local difficulty_text = "lb_difficulty_unknown"
	local difficulty = lobby_data.difficulty

	if difficulty then
		difficulty_text = DifficultySettings[difficulty].display_name
	end

	info_box_widgets_lobbies.info_frame_difficulty_text.content.text = Localize(difficulty_text)
	info_box_widgets_servers.info_frame_difficulty_text.content.text = Localize(difficulty_text)
	local num_players_text = "n/a"
	local num_players = lobby_data.num_players

	if num_players then
		num_players_text = string.format("%s/%s", num_players, tostring(MatchmakingSettings.MAX_NUMBER_OF_PLAYERS))
	end

	info_box_widgets_lobbies.info_frame_players_text.content.text = num_players_text
	info_box_widgets_servers.info_frame_players_text.content.text = num_players_text
	local status_text = LobbyItemsList.lobby_status_text(lobby_data)
	info_box_widgets_lobbies.info_frame_status_text.content.text = status_text
	info_box_widgets_servers.info_frame_status_text.content.text = status_text
	local server_info = lobby_data.server_info
	local is_dedicated_server = server_info ~= nil

	if not is_dedicated_server then
		local host = lobby_data.server_name or lobby_data.unique_server_name or lobby_data.name or lobby_data.host
		info_box_widgets_lobbies.info_frame_host_text.content.text = host or Localize("lb_unknown")
	else
		local server_name = server_info.server_name
		info_box_widgets_servers.info_frame_name_text.content.text = server_name or Localize("lb_unknown")
		local ip_adress = server_info.ip_address
		info_box_widgets_servers.info_frame_ip_adress_text.content.text = ip_adress or Localize("lb_unknown")
		local password_protected = server_info.password
		local password_text = (password_protected == true and "lb_yes") or (password_protected == false and "lb_no") or "lb_unknown"
		info_box_widgets_servers.info_frame_password_protected_text.content.text = Localize(password_text)
		local ping = server_info.ping
		info_box_widgets_servers.info_frame_ping_text.content.text = (ping and tostring(ping)) or Localize("lb_unknown")
		local favorite = server_info.favorite
		info_box_widgets_servers.info_frame_favorite_text.content.text = (favorite and Localize("lb_yes")) or Localize("lb_no")
		info_box_widgets_servers.add_to_favorites_button.content.button_text = (favorite and Localize("lb_remove_from_favorites")) or Localize("lb_add_to_favorites")
	end
end

StartGameWindowLobbyBrowserConsole._update_animations = function (self, dt)
	local ui_animator = self.ui_animator

	ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local ui_animations = self._ui_animations

	for name, animation in pairs(ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end
end

StartGameWindowLobbyBrowserConsole._is_refreshing = function (self)
	local current_lobby_type = self._current_lobby_type

	if current_lobby_type == "lobbies" then
		return self.lobby_finder:is_refreshing()
	elseif current_lobby_type == "servers" then
		return self.game_server_finder:is_refreshing()
	else
		ferror("Unknown lobby types (%s)", current_lobby_type)
	end
end

StartGameWindowLobbyBrowserConsole._handle_input = function (self, dt, t)
	local lobbies_widgets_by_name = self._lobbies_widgets_by_name

	self:_handle_stepper_input("level_stepper", lobbies_widgets_by_name.level_stepper, callback(self, "_on_level_stepper_input"))
	self:_handle_stepper_input("difficulty_stepper", lobbies_widgets_by_name.difficulty_stepper, callback(self, "_on_difficulty_stepper_input"))
	self:_handle_stepper_input("show_lobbies_stepper", lobbies_widgets_by_name.show_lobbies_stepper, callback(self, "_on_show_lobbies_stepper_input"))
	self:_handle_stepper_input("distance_stepper", lobbies_widgets_by_name.distance_stepper, callback(self, "_on_distance_stepper_input"))

	local server_widgets_by_name = self._server_widgets_by_name

	self:_handle_stepper_input("search_type_stepper", server_widgets_by_name.search_type_stepper, callback(self, "_on_search_type_stepper_input"))
	self:_handle_name_input_box(dt, t)
	self:_handle_selected_lobby_input()
end

StartGameWindowLobbyBrowserConsole._handle_name_input_box = function (self, dt, t)
	local input_service = self.parent:window_input_service()
	local name_input_box_content = self._server_widgets_by_name.name_input_box.content

	if name_input_box_content.on_release then
		name_input_box_content.active = true
	elseif input_service:get("left_release") then
		name_input_box_content.active = false
	end

	local new_server_name = name_input_box_content.input

	if new_server_name ~= self._current_server_name then
		self._current_server_name = new_server_name

		self:_populate_lobby_list()
	end
end

StartGameWindowLobbyBrowserConsole._handle_selected_lobby_input = function (self)
	local lobby_data = self.lobby_list:selected_lobby()

	if not lobby_data then
		return
	end

	if self._current_lobby_type == "servers" then
		local lobby_info_box_servers = self._lobby_info_box_servers_widgets_by_name
		local add_to_favorites_button_content = lobby_info_box_servers.add_to_favorites_button.content

		if add_to_favorites_button_content.button_hotspot.on_release then
			local server_info = lobby_data.server_info

			if server_info.favorite then
				self:_remove_server_from_favorites(lobby_data)
			else
				self:_add_server_to_favorites(lobby_data)
			end
		end
	end
end

StartGameWindowLobbyBrowserConsole._add_server_to_favorites = function (self, lobby_data)
	local server_info = lobby_data.server_info
	local ip = server_info.ip_address
	local connection_port = server_info.connection_port
	local query_port = server_info.query_port

	self.game_server_finder:add_to_favorites(ip, connection_port, query_port)
end

StartGameWindowLobbyBrowserConsole._remove_server_from_favorites = function (self, lobby_data)
	local server_info = lobby_data.server_info
	local ip = server_info.ip_address
	local connection_port = server_info.connection_port
	local query_port = server_info.query_port

	self.game_server_finder:remove_from_favorites(ip, connection_port, query_port)
end

StartGameWindowLobbyBrowserConsole.draw = function (self, dt)
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()
	local input_manager = self.input_manager
	local gamepad_active = input_manager:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	local loading = self.lobby_list_update_timer ~= nil
	local join_lobby_data_id = self.join_lobby_data_id
	self._base_widgets_by_name.search_button.content.button_hotspot.disable_button = join_lobby_data_id or loading
	local base_widgets = self._base_widgets

	for i = 1, #base_widgets, 1 do
		local widget = base_widgets[i]

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local current_lobby_type = self._current_lobby_type

	if self.lobby_list:selected_lobby() then
		local lobby_info_box_base_widgets = self._lobby_info_box_base_widgets

		for i = 1, #lobby_info_box_base_widgets, 1 do
			local widget = lobby_info_box_base_widgets[i]

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end

		if current_lobby_type == "lobbies" then
			local lobby_info_box_lobbies_widgets = self._lobby_info_box_lobbies_widgets

			for i = 1, #lobby_info_box_lobbies_widgets, 1 do
				local widget = lobby_info_box_lobbies_widgets[i]

				UIRenderer.draw_widget(ui_top_renderer, widget)
			end
		elseif current_lobby_type == "servers" then
			local lobby_info_box_servers_widgets = self._lobby_info_box_servers_widgets

			for i = 1, #lobby_info_box_servers_widgets, 1 do
				local widget = lobby_info_box_servers_widgets[i]

				UIRenderer.draw_widget(ui_top_renderer, widget)
			end
		end
	end

	if current_lobby_type == "lobbies" then
		local lobbies_widgets = self._lobbies_widgets

		for i = 1, #lobbies_widgets, 1 do
			local widget = lobbies_widgets[i]

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	elseif current_lobby_type == "servers" then
		local server_widgets = self._server_widgets

		for i = 1, #server_widgets, 1 do
			local widget = server_widgets[i]

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	else
		ferror("Unknown lobby type (%s)", current_lobby_type)
	end

	if gamepad_active then
		UIRenderer.draw_widget(ui_top_renderer, self._console_cursor)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

StartGameWindowLobbyBrowserConsole._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameWindowLobbyBrowserConsole.cancel_join_lobby = function (self, status_message)
	self.join_lobby_data_id = nil
end

StartGameWindowLobbyBrowserConsole._populate_lobby_list = function (self, auto_update)
	local selected_lobby_data = self.lobby_list:selected_lobby()
	local lobbies = self:_get_lobbies()
	local ignore_scroll_reset = true
	local show_lobbies_index = self.selected_show_lobbies_index
	local show_all_lobbies = (show_lobbies_index == 2 and true) or false
	local lobbies_to_present = {}
	local lobby_count = 0

	for _, lobby_data in pairs(lobbies) do
		if show_all_lobbies or self:_valid_lobby(lobby_data) then
			lobby_count = lobby_count + 1
			lobbies_to_present[lobby_count] = lobby_data
		end
	end

	local keep_searching = false

	if auto_update and keep_searching and self.lobby_list_update_timer then
		self.lobby_list:animate_loading_text()
	end

	self.lobby_list_update_timer = (keep_searching and MatchmakingSettings.TIME_BETWEEN_EACH_SEARCH) or nil

	self.lobby_list:populate_lobby_list(lobbies_to_present, ignore_scroll_reset)

	if selected_lobby_data then
		self.lobby_list:set_selected_lobby(selected_lobby_data)
	end
end

local empty_lobby_list = {}

StartGameWindowLobbyBrowserConsole._get_lobbies = function (self)
	local current_lobby_type = self._current_lobby_type

	if current_lobby_type == "lobbies" then
		local lobby_finder = self.lobby_finder

		return lobby_finder:lobbies() or empty_lobby_list
	elseif current_lobby_type == "servers" then
		local game_server_finder = self.game_server_finder

		return game_server_finder:servers() or empty_lobby_list
	else
		ferror("Unknown lobby type (%s)", current_lobby_type)
	end
end

StartGameWindowLobbyBrowserConsole._valid_lobby = function (self, lobby_data)
	local is_valid = lobby_data.valid

	if not is_valid then
		return false
	end

	local is_server = lobby_data.server_info ~= nil

	if not is_server then
		local is_matchmaking = lobby_data.matchmaking and lobby_data.matchmaking ~= "false"
		local level_key = lobby_data.selected_level_key or lobby_data.level_key
		local difficulty = lobby_data.difficulty
		local num_players = tonumber(lobby_data.num_players)

		if not is_matchmaking or not level_key or not difficulty or num_players == MatchmakingSettings.MAX_NUMBER_OF_PLAYERS then
			return false
		end

		local player_manager = Managers.player
		local player = player_manager:local_player()
		local statistics_db = player_manager:statistics_db()
		local player_stats_id = player:stats_id()
		local level_unlocked = LevelUnlockUtils.level_unlocked(statistics_db, player_stats_id, level_key)

		if not level_unlocked then
			return false
		end

		local profile_name = player:profile_display_name()
		local career_name = player:career_name()
		local has_required_power_level = Managers.matchmaking:has_required_power_level(lobby_data, profile_name, career_name)

		if not has_required_power_level then
			return false
		end
	elseif is_server then
		local wanted_server_name = self._current_server_name

		if wanted_server_name ~= "" and string.find(lobby_data.server_info.server_name, wanted_server_name) == nil then
			return false
		end
	else
		ferror("Sanity check")
	end

	return true
end

StartGameWindowLobbyBrowserConsole._input_service = function (self)
	return self.parent:input_service()
end

StartGameWindowLobbyBrowserConsole._update_auto_refresh = function (self, dt)
	local lobby_list_update_timer = self.lobby_list_update_timer

	if lobby_list_update_timer then
		lobby_list_update_timer = lobby_list_update_timer - dt

		if lobby_list_update_timer < 0 then
			self:_populate_lobby_list(true)
		else
			self.lobby_list_update_timer = lobby_list_update_timer
		end
	end
end

StartGameWindowLobbyBrowserConsole._update_join_button = function (self, lobby_data)
	local matchmaking_manager = Managers.matchmaking
	local is_matchmaking = matchmaking_manager:is_game_matchmaking()
	local widget = self._base_widgets_by_name.join_button

	if lobby_data and not is_matchmaking then
		local valid_lobby = self:_valid_lobby(lobby_data)

		if valid_lobby then
			widget.content.button_hotspot.disable_button = false
		else
			widget.content.button_hotspot.disable_button = true
		end
	else
		widget.content.button_hotspot.disable_button = true
	end
end

StartGameWindowLobbyBrowserConsole._reset_filters = function (self)
	local levels_table = self:_get_levels()
	local any_level_index = #levels_table

	self:_on_level_stepper_input(0, any_level_index)

	local difficulties_table = self:_get_difficulties()
	local any_difficulty_index = #difficulties_table

	self:_on_difficulty_stepper_input(0, any_difficulty_index)
	self:_on_show_lobbies_stepper_input(0, 1)
	self:_on_distance_stepper_input(0, 2)
end

StartGameWindowLobbyBrowserConsole._switch_lobby_type = function (self, new_lobby_type)
	self._current_lobby_type = new_lobby_type
	local lobby_type_button = self._base_widgets_by_name.lobby_type_button
	lobby_type_button.content.button_text = (new_lobby_type == "lobbies" and Localize("lb_lobby_type_lobbies")) or Localize("lb_lobby_type_servers")

	if new_lobby_type == "lobbies" then
	elseif new_lobby_type == "servers" then
		self:_on_search_type_stepper_input(0, 1)
	else
		ferror("Unknown lobby type (%s)", new_lobby_type)
	end

	self:_search()
end

StartGameWindowLobbyBrowserConsole._create_filter_requirements = function (self)
	local lobby_finder = self.lobby_finder
	local level_index = self.selected_level_index
	local levels_table = self:_get_levels()
	local level_key = levels_table[level_index]
	local difficulty_index = self.selected_difficulty_index
	local difficulty_table = self:_get_difficulties()
	local difficulty_key = difficulty_table[difficulty_index]
	local only_show_valid_lobbies = not self._base_widgets_by_name.invalid_checkbox.content.checked
	local distance_index = self.selected_distance_index
	local distance_filter = MapLobbyDistanceFilter[distance_index]
	local show_lobbies_index = self.selected_show_lobbies_index
	local show_all_lobbies = (show_lobbies_index == 2 and true) or false
	local matchmaking = not show_all_lobbies
	local free_slots = 1
	local requirements = {
		filters = {},
		near_filters = {}
	}
	local current_lobby_type = self._current_lobby_type

	if current_lobby_type == "lobbies" then
		requirements.free_slots = free_slots
		requirements.distance_filter = platform ~= "ps4" and distance_filter
	end

	if platform == "ps4" then
		local user_region = Managers.account:region()

		if distance_filter == LobbyDistanceFilter.CLOSE then
			requirements.filters.primary_region = {
				value = MatchmakingRegionLookup.primary[user_region],
				comparison = LobbyComparison.EQUAL
			}
		elseif distance_filter == LobbyDistanceFilter.MEDIUM then
			requirements.filters.secondary_region = {
				value = MatchmakingRegionLookup.secondary[user_region],
				comparison = LobbyComparison.EQUAL
			}
		end
	end

	local eac_state = EAC.state()
	local eac_authorized = eac_state == "trusted"
	requirements.filters.eac_authorized = {
		value = (eac_authorized and "true") or "false",
		comparison = LobbyComparison.EQUAL
	}

	if difficulty_key ~= "any" then
		requirements.filters.difficulty = {
			value = difficulty_key,
			comparison = LobbyComparison.EQUAL
		}
	end

	if level_key ~= "any" then
		requirements.filters.selected_level_key = {
			value = level_key,
			comparison = LobbyComparison.EQUAL
		}
	end

	requirements.filters.game_mode = {
		value = "event",
		comparison = LobbyComparison.NOT_EQUAL
	}

	if only_show_valid_lobbies then
		requirements.filters.network_hash = {
			value = lobby_finder:network_hash(),
			comparison = LobbyComparison.EQUAL
		}
	end

	if matchmaking and current_lobby_type == "lobbies" then
		requirements.filters.matchmaking = {
			value = "false",
			comparison = LobbyComparison.NOT_EQUAL
		}
	end

	return requirements
end

StartGameWindowLobbyBrowserConsole._join = function (self, lobby_data, join_params)
	Managers.matchmaking:request_join_lobby(lobby_data, join_params)

	self.join_lobby_data_id = lobby_data.id
end

StartGameWindowLobbyBrowserConsole._search = function (self)
	local requirements = self:_create_filter_requirements()

	if self._current_lobby_type == "lobbies" then
		LobbyInternal.clear_filter_requirements()

		local force_refresh = true
		local lobby_finder = self.lobby_finder

		lobby_finder:add_filter_requirements(requirements, force_refresh)
	elseif self._current_lobby_type == "servers" then
		local server_finder = self.game_server_finder
		local game_server_requirements = {
			server_browser_filters = {
				dedicated = "valuenotused",
				full = "valuenotused",
				gamedir = "vermintide2"
			},
			matchmaking_filters = requirements.filters
		}
		local skip_verify_lobby_data = true

		server_finder:add_filter_requirements(game_server_requirements, skip_verify_lobby_data)
		server_finder:refresh()
	else
		ferror("Unknown lobby type (%s)", self._current_lobby_type)
	end

	self._searching = true

	self:_populate_lobby_list()
end

StartGameWindowLobbyBrowserConsole._get_levels = function (self)
	local game_mode_data = definitions.game_mode_data
	local game_mode_index = self.selected_game_mode_index or 1
	local data = game_mode_data[game_mode_index]
	local levels = data.levels

	return levels
end

StartGameWindowLobbyBrowserConsole._get_difficulties = function (self)
	local game_mode_data = definitions.game_mode_data
	local game_mode_index = self.selected_game_mode_index or 1
	local data = game_mode_data[game_mode_index]
	local difficulties = data.difficulties

	return difficulties
end

StartGameWindowLobbyBrowserConsole._on_level_stepper_input = function (self, index_change, specific_index)
	local stepper = self._lobbies_widgets_by_name.level_stepper
	local levels_table = self:_get_levels()
	local current_index = self.selected_level_index or 1
	local new_index = self:_on_stepper_input(stepper, levels_table, current_index, index_change, specific_index)
	local level_display_name = "lobby_browser_mission"
	local level = levels_table[new_index]

	if level ~= "any" then
		local level_setting = LevelSettings[level]
		level_display_name = level_setting.display_name
	end

	stepper.content.setting_text = Localize(level_display_name)
	self.selected_level_index = new_index
	self.search_timer = input_delay_before_start_new_search
end

StartGameWindowLobbyBrowserConsole._on_difficulty_stepper_input = function (self, index_change, specific_index)
	local stepper = self._lobbies_widgets_by_name.difficulty_stepper
	local difficulties_table = self:_get_difficulties()
	local current_index = self.selected_difficulty_index or 1
	local new_index = self:_on_stepper_input(stepper, difficulties_table, current_index, index_change, specific_index)
	local difficulty_display_name = "lobby_browser_difficulty"
	local difficulty = difficulties_table[new_index]

	if difficulty ~= "any" then
		local difficulty_setting = DifficultySettings[difficulty]
		difficulty_display_name = difficulty_setting.display_name
	end

	stepper.content.setting_text = Localize(difficulty_display_name)
	self.selected_difficulty_index = new_index
	self.search_timer = input_delay_before_start_new_search
end

StartGameWindowLobbyBrowserConsole._on_show_lobbies_stepper_input = function (self, index_change, specific_index)
	local stepper = self._lobbies_widgets_by_name.show_lobbies_stepper
	local show_lobbies_table = definitions.show_lobbies_table
	local current_index = self.selected_show_lobbies_index or 1
	local new_index = self:_on_stepper_input(stepper, show_lobbies_table, current_index, index_change, specific_index)
	local show_lobbies_text = show_lobbies_table[new_index]
	stepper.content.setting_text = Localize(show_lobbies_text)
	self.selected_show_lobbies_index = new_index
	self.search_timer = input_delay_before_start_new_search
end

StartGameWindowLobbyBrowserConsole._on_distance_stepper_input = function (self, index_change, specific_index)
	local stepper = self._lobbies_widgets_by_name.distance_stepper
	local distance_table = definitions.distance_table
	local current_index = self.selected_distance_index or 1
	local new_index = self:_on_stepper_input(stepper, distance_table, current_index, index_change, specific_index)
	local distance_text = distance_table[new_index]
	stepper.content.setting_text = Localize(distance_text)
	self.selected_distance_index = new_index
	self.search_timer = input_delay_before_start_new_search
end

StartGameWindowLobbyBrowserConsole._on_search_type_stepper_input = function (self, index_change, specific_index)
	local stepper = self._server_widgets_by_name.search_type_stepper
	local search_type_text_table = definitions.search_type_text_table
	local current_index = self.selected_search_type_index or 1
	local new_index = self:_on_stepper_input(stepper, search_type_text_table, current_index, index_change, specific_index)
	local search_type_text = search_type_text_table[new_index]
	stepper.content.setting_text = Localize(search_type_text)
	self.selected_search_type_index = new_index
	self.search_timer = input_delay_before_start_new_search
	local search_type_table = definitions.search_type_table
	local search_type = search_type_table[new_index]

	self.game_server_finder:set_search_type(search_type)
end

StartGameWindowLobbyBrowserConsole._on_stepper_input = function (self, stepper, data_table, current_index, index_change, specific_index)
	local num_data = #data_table

	if specific_index then
		fassert(specific_index > 0 and specific_index <= num_data, "stepper_index out of range")

		return specific_index
	end

	local new_index = current_index + index_change

	if new_index < 1 then
		new_index = num_data
	elseif num_data < new_index then
		new_index = 1
	end

	return new_index
end

StartGameWindowLobbyBrowserConsole._handle_stepper_input = function (self, stepper_name, stepper, step_function)
	local stepper_widget = stepper
	local stepper_content = stepper_widget.content
	local stepper_left_hotspot = stepper_content.button_hotspot_left
	local stepper_right_hotspot = stepper_content.button_hotspot_right

	if stepper_left_hotspot.on_hover_enter then
		self:_on_stepper_arrow_hover(stepper_widget, stepper_name, "left_button_icon_clicked")
	elseif stepper_right_hotspot.on_hover_enter then
		self:_on_stepper_arrow_hover(stepper_widget, stepper_name, "right_button_icon_clicked")
	end

	if stepper_left_hotspot.on_hover_exit then
		self:_on_stepper_arrow_dehover(stepper_widget, stepper_name, "left_button_icon_clicked")
	elseif stepper_right_hotspot.on_hover_exit then
		self:_on_stepper_arrow_dehover(stepper_widget, stepper_name, "right_button_icon_clicked")
	end

	if stepper_left_hotspot.on_hover_enter or stepper_right_hotspot.on_hover_enter then
		self:_play_sound("Play_hud_hover")
	end

	if stepper_left_hotspot.on_release then
		stepper_left_hotspot.on_release = nil

		step_function(-1)
		self:_play_sound("Play_hud_select")
		self:_on_stepper_arrow_pressed(stepper_widget, stepper_name, "left_button_icon")
		self:_on_stepper_arrow_pressed(stepper_widget, stepper_name, "left_button_icon_clicked")
	elseif stepper_right_hotspot.on_release then
		stepper_right_hotspot.on_release = nil

		step_function(1)
		self:_play_sound("Play_hud_select")
		self:_on_stepper_arrow_pressed(stepper_widget, stepper_name, "right_button_icon")
		self:_on_stepper_arrow_pressed(stepper_widget, stepper_name, "right_button_icon_clicked")
	end
end

StartGameWindowLobbyBrowserConsole._on_stepper_arrow_pressed = function (self, widget, name, style_id)
	local ui_animations = self._ui_animations
	local animation_name = "stepper_widget_arrow_" .. name .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
	local default_size = {
		28,
		34
	}
	local current_alpha = pass_style.color[1]
	local target_alpha = 255
	local total_time = UISettings.scoreboard.topic_hover_duration
	local animation_duration = total_time

	if animation_duration > 0 then
		ui_animations[animation_name .. "_hover"] = self:_animate_element_by_time(pass_style.color, 1, current_alpha, target_alpha, animation_duration)
		ui_animations[animation_name .. "_selected_size_width"] = self:_animate_element_by_catmullrom(pass_style.size, 1, default_size[1], 0.7, 1, 1, 0.7, animation_duration)
		ui_animations[animation_name .. "_selected_size_height"] = self:_animate_element_by_catmullrom(pass_style.size, 2, default_size[2], 0.7, 1, 1, 0.7, animation_duration)
	else
		pass_style.color[1] = target_alpha
	end
end

StartGameWindowLobbyBrowserConsole._on_stepper_arrow_hover = function (self, widget, name, style_id)
	local ui_animations = self._ui_animations
	local animation_name = "stepper_widget_arrow_" .. name .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
	local current_alpha = pass_style.color[1]
	local target_alpha = 255
	local total_time = UISettings.scoreboard.topic_hover_duration
	local animation_duration = (1 - current_alpha / target_alpha) * total_time

	if animation_duration > 0 then
		ui_animations[animation_name .. "_hover"] = self:_animate_element_by_time(pass_style.color, 1, current_alpha, target_alpha, animation_duration)
	else
		pass_style.color[1] = target_alpha
	end

	self:_play_sound("Play_hud_hover")
end

StartGameWindowLobbyBrowserConsole._on_stepper_arrow_dehover = function (self, widget, name, style_id)
	local ui_animations = self._ui_animations
	local animation_name = "stepper_widget_arrow_" .. name .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
	local current_alpha = pass_style.color[1]
	local target_alpha = 0
	local total_time = UISettings.scoreboard.topic_hover_duration
	local animation_duration = current_alpha / 255 * total_time

	if animation_duration > 0 then
		ui_animations[animation_name .. "_hover"] = self:_animate_element_by_time(pass_style.color, 1, current_alpha, target_alpha, animation_duration)
	else
		pass_style.color[1] = target_alpha
	end
end

StartGameWindowLobbyBrowserConsole._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

StartGameWindowLobbyBrowserConsole._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end

return

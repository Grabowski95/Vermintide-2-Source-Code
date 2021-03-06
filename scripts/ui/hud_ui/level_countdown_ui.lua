local definitions = local_require("scripts/ui/hud_ui/level_countdown_ui_definitions")
local DO_RELOAD = true
LevelCountdownUI = class(LevelCountdownUI)

LevelCountdownUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.level_transition_handler = ingame_ui_context.level_transition_handler
	self.network_event_delegate = ingame_ui_context.network_event_delegate
	self.camera_manager = ingame_ui_context.camera_manager
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.is_in_inn = ingame_ui_context.is_in_inn
	self.is_server = ingame_ui_context.is_server
	self.world_manager = ingame_ui_context.world_manager
	self.input_manager = ingame_ui_context.input_manager
	self.matchmaking_manager = Managers.matchmaking
	local world = self.world_manager:world("level_world")
	self.wwise_world = Managers.world:wwise_world(world)

	self:create_ui_elements()

	self.colors = {
		normal = Colors.get_table("font_default"),
		selected = Colors.get_table("font_title")
	}
end

LevelCountdownUI.create_ui_elements = function (self)
	DO_RELOAD = false
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self.countdown_widget = UIWidget.init(definitions.widgets.fullscreen_countdown)

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)
end

LevelCountdownUI.update = function (self, dt)
	if DO_RELOAD then
		self:create_ui_elements()

		self.colors = {
			normal = Colors.get_table("font_default"),
			selected = Colors.get_table("font_title")
		}
	end

	if not self.is_in_inn then
		return
	end

	local ui_suspended = self.ingame_ui.menu_suspended

	if ui_suspended then
		return
	end

	local countdown_active = false
	local start_time, max_start_time = self:_get_start_time()

	if start_time and max_start_time then
		if self:update_enter_game_counter(start_time, max_start_time, dt) then
			countdown_active = true

			self:draw(dt)
		else
			self.last_timer_value = max_start_time
		end
	end

	self._countdown_active = countdown_active
end

LevelCountdownUI.is_enter_game = function (self)
	return self._countdown_active
end

LevelCountdownUI.draw = function (self, dt)
	local input_service = self.input_manager:get_service("ingame_menu")
	local ui_renderer = self.ui_renderer

	UIRenderer.begin_pass(ui_renderer, self.ui_scenegraph, input_service, dt)
	UIRenderer.draw_widget(ui_renderer, self.countdown_widget)
	UIRenderer.end_pass(ui_renderer)
end

LevelCountdownUI.update_enter_game_counter = function (self, start_time, max_start_time, dt)
	local widget = self.countdown_widget
	local widget_content = widget.content
	local widget_style = widget.style
	local colors = self.colors
	local new_timer_value = math.round(start_time)
	local draw = new_timer_value ~= max_start_time
	local play_sound_event = nil

	if new_timer_value ~= self.last_timer_value then
		if new_timer_value ~= 0 then
			play_sound_event = "Play_hud_matchmaking_countdown"
			widget_content.timer_text = new_timer_value
			self.color_timer = 0
		else
			play_sound_event = "Play_hud_matchmaking_countdown_final"
			widget_content.timer_text = ""
		end

		self.last_timer_value = new_timer_value

		Colors.lerp_color_tables(colors.normal, colors.selected, 0, widget_style.timer_text.text_color)
	else
		local color_timer = self.color_timer

		if color_timer then
			local total_color_time = 0.5
			color_timer = math.min(color_timer + dt, total_color_time)
			local color_progress = color_timer / total_color_time
			self.color_timer = color_timer

			Colors.lerp_color_tables(colors.normal, colors.selected, color_progress, widget_style.timer_text.text_color)
		end
	end

	if draw and play_sound_event then
		self:play_sound(play_sound_event)
	end

	if start_time <= 0 then
		self.matchmaking_manager:countdown_completed()
	end

	return draw
end

LevelCountdownUI.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)
end

LevelCountdownUI.destroy = function (self)
	if self._waystone_unit then
		self:set_waystone_activation(false)
	end
end

LevelCountdownUI._get_start_time = function (self)
	local status_extension = self:_get_active_waystone_extension()

	if status_extension then
		local max_start_time = status_extension:end_time()
		local current_start_time = status_extension:end_time_left()

		return current_start_time, max_start_time
	end
end

LevelCountdownUI._get_active_waystone_extension = function (self)
	local world_manager = Managers.world

	if world_manager:has_world("level_world") then
		local world = world_manager:world("level_world")
		local mechanism = Managers.mechanism:game_mechanism()
		local inn_level_name = mechanism:get_hub_level_key()
		local level_settings = LevelSettings[inn_level_name]
		local level_name = level_settings.level_name
		local level = ScriptWorld.level(world, level_name)

		if level then
			local units = Level.units(level)

			for i, unit in ipairs(units) do
				if Unit.alive(unit) and Unit.has_data(unit, "waystone_type") then
					local status_extension = ScriptUnit.extension(unit, "end_zone_system")

					if status_extension then
						local activated = status_extension:activated()

						if activated then
							return status_extension
						end
					end
				end
			end
		end
	end
end

LevelCountdownUI.set_waystone_activation = function (self, enable, optional_waystone_type)
	self._waystone_unit = LevelCountdownUI.set_waystone_activation_without_ui(enable, optional_waystone_type)
end

LevelCountdownUI.set_waystone_activation_without_ui = function (enable, optional_waystone_type)
	local waystone_unit = nil
	local world_manager = Managers.world

	if world_manager:has_world("level_world") then
		local world = world_manager:world("level_world")
		local mechanism = Managers.mechanism:game_mechanism()
		local inn_level_name = mechanism:get_hub_level_key()
		local level_settings = LevelSettings[inn_level_name]
		local level_name = level_settings.level_name
		local level = ScriptWorld.level(world, level_name)

		if level then
			local units = Level.units(level)

			for i, level_unit in ipairs(units) do
				if Unit.has_data(level_unit, "waystone_type") then
					if enable then
						local waystone_type = Unit.get_data(level_unit, "waystone_type")

						if waystone_type == optional_waystone_type then
							Unit.flow_event(level_unit, "activate")
							fassert(waystone_unit == nil, "[LevelCountdownUI] - Found multiple waystone units with the same type: %s", tostring(waystone_type))

							waystone_unit = level_unit
						else
							Unit.flow_event(level_unit, "deactivate")
						end
					else
						Unit.flow_event(level_unit, "deactivate")
					end
				end
			end
		end
	end

	return waystone_unit
end

return

require("scripts/helpers/navigation_utils")

LinkerTransportationExtension = class(LinkerTransportationExtension)
local UPDATE_INTERVAL_OOBB_NO_HUMANS_INSIDE = 1
local UPDATE_INTERVAL_OOBB_HUMANS_INSIDE = 0.05
local LINK_UNITS_ON_TRANSPORT = false
local STORY_STATES = {
	"stopped_beginning",
	"moving_forward",
	"moving_backward",
	"stopped_end"
}

for i, state in ipairs(STORY_STATES) do
	STORY_STATES[state] = i
end

local unit_alive = Unit.alive
LinkerTransportationExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.world = extension_init_context.world
	self.is_server = Managers.player.is_server
	local story_name = Unit.get_data(unit, "transportation_data", "story_name")
	local story_teller = World.storyteller(self.world)
	local level = LevelHelper:current_level(self.world)
	self._bot_slots_offset = {
		0,
		1,
		-1
	}
	self._bot_slots = {}
	self.story_teller = story_teller
	local story_id = story_teller.play_level_story(story_teller, level, story_name)
	self.story_id = story_id

	story_teller.set_speed(story_teller, story_id, 0)

	self.story_state = "stopped_beginning"
	self.current_story_time = 0
	self.auto_exit = Unit.get_data(unit, "transportation_data", "auto_exit")
	self.teleport_on_enter = Unit.get_data(unit, "transportation_data", "teleport_on_enter")
	self.teleport_on_exit = Unit.get_data(unit, "transportation_data", "teleport_on_exit")
	self.takes_party = Unit.get_data(unit, "transportation_data", "takes_party")
	self.return_to_start = Unit.get_data(unit, "transportation_data", "return_to_start")
	self.transported_units = {}
	self.has_nav_obstacles = false
	local bounding_box_mesh_name = Unit.get_data(unit, "transportation_data", "bounding_box_mesh")

	if bounding_box_mesh_name ~= "" then
		local mesh = Unit.mesh(unit, bounding_box_mesh_name)
		local _, size = Mesh.box(mesh)
		local max_extent = math.max(size.x, size.y, size.z)
		self.oobb_mesh_max_extent = max_extent
		self.oobb_mesh = mesh
		self.oobb_next_update = 0
		self.units_inside_oobb = {
			human = {
				count = 0,
				units = {}
			},
			bot = {
				count = 0,
				units = {}
			},
			ai = {
				count = 0,
				units = {}
			}
		}
	end

	self._transporting = false
	self._movement_delta = Vector3Box(0, 0, 0)
	self._old_position = Vector3Box(Unit.local_position(unit, 0))

	return 
end
LinkerTransportationExtension.extensions_ready = function (self)
	return 
end
LinkerTransportationExtension.movement_delta = function (self)
	return self._movement_delta:unbox()
end
LinkerTransportationExtension.register_navmesh_units = function (self, start_unit, end_unit)
	local nav_world = GLOBAL_AI_NAVWORLD
	local obstacle_start, transform_start = NavigationUtils.create_exclusive_box_obstacle_from_unit_data(nav_world, start_unit)

	GwNavBoxObstacle.add_to_world(obstacle_start)
	GwNavBoxObstacle.set_transform(obstacle_start, transform_start)

	local obstacle_end, transform_end = NavigationUtils.create_exclusive_box_obstacle_from_unit_data(nav_world, end_unit)

	GwNavBoxObstacle.add_to_world(obstacle_end)
	GwNavBoxObstacle.set_transform(obstacle_end, transform_end)

	self.nav_obstacle_start = obstacle_start
	self.nav_obstacle_end = obstacle_end
	self.has_nav_obstacles = true

	self.update_nav_obstacles(self)

	return 
end
LinkerTransportationExtension.interacted_with = function (self, interactor_unit)
	if self.story_state == "stopped_beginning" then
		self.story_state = "moving_forward"

		Unit.flow_event(self.unit, "lua_transportation_story_started")
	end

	self.update_nav_obstacles(self)

	local transported_units = self.transported_units
	local num_transported_units = #transported_units

	if 0 < num_transported_units then
		self._unlink_all_transported_units(self)
	else
		self._link_all_transported_units(self, interactor_unit)
	end

	return 
end
LinkerTransportationExtension.hot_join_sync = function (self, peer)
	local network_manager = Managers.state.network
	local level_id = Level.unit_index(LevelHelper:current_level(self.world), self.unit)
	local state = self.story_state
	local story_time = self.current_story_time

	if self._transporting then
		local interactor_unit = nil

		for i, unit in ipairs(self.transported_units) do
			if Unit.alive(unit) then
				interactor_unit = unit

				break
			end
		end

		if interactor_unit then
			local interactor_unit_id = network_manager.unit_game_object_id(network_manager, interactor_unit)

			RPC.rpc_hot_join_sync_linker_transporting(peer, level_id, interactor_unit_id)
		end
	end

	RPC.rpc_hot_join_sync_linker_transport_state(peer, level_id, STORY_STATES[state], story_time)

	return 
end
LinkerTransportationExtension.rpc_hot_join_sync_linker_transporting = function (self, interactor_unit_id)
	local interactor_unit = Managers.state.network.unit_storage:unit(interactor_unit_id)

	self.interacted_with(self, interactor_unit)

	return 
end
LinkerTransportationExtension.rpc_hot_join_sync_linker_transport_state = function (self, state_id, story_time)
	self.story_state = STORY_STATES[state_id]
	self.current_story_time = story_time

	self.update_nav_obstacles(self)

	return 
end
LinkerTransportationExtension._link_all_transported_units = function (self, interactor_unit)
	print("===============================")

	local story_teller = self.story_teller
	local story_id = self.story_id
	local story_length = story_teller.length(story_teller, story_id)

	print("Linking all transported units", self.current_story_time, story_length)
	print(Script.callstack())
	print("===============================")
	assert(not self._transporting, "Trying to link units before unlinking.")

	self._transporting = true

	if self.is_server then
		Managers.state.spawn:disable_spawning(true, self.unit)
	end

	local num_transported_units = 1
	local transported_units = self.transported_units
	transported_units[1] = interactor_unit

	self._link_transported_unit(self, interactor_unit)

	if self.takes_party then
		local players = Managers.player:players()

		for _, player in pairs(players) do
			local unit = player.player_unit

			if unit_alive(unit) and unit ~= interactor_unit then
				local is_bot = self._is_bot(self, player)
				local status_ext = ScriptUnit.extension(unit, "status_system")
				local is_dead = status_ext.is_dead(status_ext)
				local is_inside_transportation_unit = self._is_inside_transportation_unit(self, unit)
				local is_disabled = status_ext.is_disabled(status_ext)

				if not is_dead and is_inside_transportation_unit then
					num_transported_units = num_transported_units + 1
					transported_units[num_transported_units] = unit

					self._link_transported_unit(self, unit)
				elseif self._is_bot(self, player) and not is_disabled then
					num_transported_units = num_transported_units + 1
					transported_units[num_transported_units] = player.player_unit

					self._link_transported_unit(self, player.player_unit, true)
				elseif player.local_player and not is_dead and not is_disabled and not is_inside_transportation_unit then
					num_transported_units = num_transported_units + 1
					transported_units[num_transported_units] = player.player_unit

					self._link_transported_unit(self, player.player_unit, true)
				end
			end
		end
	end

	Unit.flow_event(self.unit, "activate_collision")

	return 
end
LinkerTransportationExtension._is_inside_transportation_unit = function (self, unit, size_modifier)
	local oobb_mesh = self.oobb_mesh
	local oobb_pose, oobb_size = Mesh.box(oobb_mesh)
	local unit_pos = Unit.world_position(unit, 0)

	if size_modifier then
		oobb_size[1] = oobb_size[1] + size_modifier
		oobb_size[2] = oobb_size[2] + size_modifier
		oobb_size[3] = oobb_size[3] + size_modifier
	end

	return math.point_is_inside_oobb(unit_pos, oobb_pose, oobb_size)
end
LinkerTransportationExtension._is_bot = function (self, player)
	if self.is_server then
		return player.bot_player
	elseif player._player_controlled or player.local_player then
		return false
	else
		return true
	end

	return 
end
LinkerTransportationExtension.update_units_inside_oobb = function (self)
	local unit = self.unit
	local oobb_mesh = self.oobb_mesh
	local oobb_pose, oobb_size = Mesh.box(oobb_mesh)
	local units_inside_oobb = self.units_inside_oobb

	for _, data in pairs(units_inside_oobb) do
		for u, _ in pairs(data.units) do
			if not AiUtils.unit_alive(u) then
				data.units[u] = nil
				data.count = data.count - 1
			end
		end
	end

	local location = FrameTable.alloc_table()
	location.human = {}
	location.ai = {}
	local players = Managers.player:players()

	for _, player in pairs(players) do
		if not self._is_bot(self, player) then
			local u = player.player_unit

			if AiUtils.unit_alive(u) then
				local u_pos = Unit.world_position(u, 0)
				local is_inside = math.point_is_inside_oobb(u_pos, oobb_pose, oobb_size)
				location.human[u] = is_inside
			end
		end
	end

	local ai_system = Managers.state.entity:system("ai_system")
	local ai_broadphase = ai_system.broadphase
	local position = Unit.world_position(unit, 0)
	local nearby_ai_units = FrameTable.alloc_table()
	local num_nearby_ai_units = Broadphase.query(ai_broadphase, position, self.oobb_mesh_max_extent + 1, nearby_ai_units)

	for i = 1, num_nearby_ai_units, 1 do
		local u = nearby_ai_units[i]

		if AiUtils.unit_alive(u) then
			local u_pos = Unit.world_position(u, 0)
			local is_inside = math.point_is_inside_oobb(u_pos, oobb_pose, oobb_size)
			location.ai[u] = is_inside
		end
	end

	for type, units in pairs(location) do
		for u, is_inside in pairs(units) do
			local oobb_data = units_inside_oobb[type]

			if is_inside and not oobb_data.units[u] then
				oobb_data.units[u] = true
				oobb_data.count = oobb_data.count + 1
			elseif not is_inside and oobb_data.units[u] then
				oobb_data.units[u] = nil
				oobb_data.count = oobb_data.count - 1
			end
		end
	end

	for u, is_inside in pairs(location.human) do
		local status_extension = ScriptUnit.extension(u, "status_system")
		local arg = (is_inside and unit) or nil

		status_extension.set_inside_transport_unit(status_extension, arg)
	end

	return 
end
LinkerTransportationExtension.update_nav_obstacles = function (self)
	if not self.has_nav_obstacles then
		return 
	end

	local story_state = self.story_state
	local obstacle_start = self.nav_obstacle_start
	local obstacle_end = self.nav_obstacle_end

	if story_state == "stopped_beginning" then
		GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle_start, false)
		GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle_end, true)
	elseif story_state == "moving_forward" then
		GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle_start, true)
		GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle_end, true)
	elseif story_state == "stopped_end" then
		GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle_start, true)
		GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle_end, false)
	elseif story_state == "moving_backward" then
		GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle_start, true)
		GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle_end, true)
	end

	return 
end
LinkerTransportationExtension.update = function (self, unit, input, dt, context, t)
	local story_teller = self.story_teller
	local story_id = self.story_id
	local story_length = story_teller.length(story_teller, story_id)
	local current_time = self.current_story_time
	local new_time = current_time

	if self.story_state == "moving_forward" then
		new_time = current_time + dt

		self._update_local_player_position(self)

		if story_length <= new_time then
			new_time = story_length
			self.story_state = "stopped_end"

			if self.auto_exit then
				self.update_nav_obstacles(self)
				self._unlink_all_transported_units(self)
			end

			Unit.flow_event(self.unit, "lua_transportation_story_stopped")
		end
	elseif self.story_state == "stopped_end" then
		local units_inside_oobb = self.units_inside_oobb

		if self.return_to_start and units_inside_oobb and units_inside_oobb.human.count == 0 and units_inside_oobb.bot.count == 0 then
			self.story_state = "moving_backward"

			self.update_nav_obstacles(self)
			Unit.flow_event(self.unit, "lua_transportation_story_started")
		end
	elseif self.story_state == "moving_backward" then
		new_time = current_time - dt

		if new_time <= 0 then
			new_time = 0
			self.story_state = "stopped_beginning"

			self.update_nav_obstacles(self)
			Unit.flow_event(self.unit, "lua_transportation_story_stopped")
		end
	end

	story_teller.set_time(story_teller, story_id, new_time)

	self.current_story_time = new_time
	local units_inside_oobb = self.units_inside_oobb

	if units_inside_oobb and self.oobb_next_update <= t then
		self.update_units_inside_oobb(self)

		local update_interval = (0 < units_inside_oobb.human.count and UPDATE_INTERVAL_OOBB_HUMANS_INSIDE) or UPDATE_INTERVAL_OOBB_NO_HUMANS_INSIDE
		self.oobb_next_update = t + update_interval
	end

	local new_pos = Unit.local_position(unit, 0)
	local old_pos_box = self._old_position

	self._movement_delta:store(new_pos - old_pos_box.unbox(old_pos_box))
	old_pos_box.store(old_pos_box, new_pos)

	return 
end
LinkerTransportationExtension._update_local_player_position = function (self)
	local player_manager = Managers.player
	local transported_units = self.transported_units
	local num_transported_units = #transported_units

	for i = 1, num_transported_units, 1 do
		local unit = transported_units[i]

		if not Unit.alive(unit) then
		else
			local unit_owner = player_manager.owner(player_manager, unit)

			if unit_owner then
				if not unit_owner.local_player then
				else
					local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
					local platform_unit = locomotion_extension.get_moving_platform(locomotion_extension)

					if platform_unit ~= self.unit then
					else
						local is_inside_transportation_unit = self._is_inside_transportation_unit(self, unit, 1)

						if not is_inside_transportation_unit then
							local index = table.find(self._bot_slots, unit)

							if index == false then
								index = math.random(1, 4)
							end

							local position = self._get_position_from_index(self, index)
							local current_rotation = locomotion_extension.current_rotation(locomotion_extension)

							locomotion_extension.teleport_to(locomotion_extension, position, current_rotation)
						end
					end
				end
			end
		end
	end

	return 
end
LinkerTransportationExtension.is_stationary = function (self)
	return self.story_state == "stopped_beginning" or self.story_state == "stopped_end"
end
LinkerTransportationExtension.can_interact = function (self, interactor_unit)
	return (self.story_state == "stopped_beginning" and #self.transported_units == 0) or (self.story_state == "stopped_end" and not self.auto_exit and self.transported_units[1] == interactor_unit)
end
LinkerTransportationExtension.destroy = function (self)
	if self._transporting and self.is_server then
		local unit = self.unit
		local safe_node = "elevator_slot_01"
		local position, rotation = nil
		local node = Unit.node(unit, safe_node)
		position = Unit.world_position(unit, node)
		rotation = Unit.world_rotation(unit, node)

		Managers.state.spawn:disable_spawning(false, unit, position, rotation)
	end

	if self.has_nav_obstacles then
		GwNavBoxObstacle.destroy(self.nav_obstacle_start)

		self.nav_obstacle_start = nil

		GwNavBoxObstacle.destroy(self.nav_obstacle_end)

		self.nav_obstacle_end = nil
	end

	if self.units_inside_oobb then
		local human_players = self.units_inside_oobb.human.units

		for player_unit, _ in pairs(human_players) do
			if unit_alive(player_unit) then
				local status_extension = ScriptUnit.extension(player_unit, "status_system")

				status_extension.set_inside_transport_unit(status_extension, nil)
			end
		end

		self.units_inside_oobb = nil
	end

	self.transported_units = nil
	self.oobb_mesh = nil

	return 
end
LinkerTransportationExtension._unlink_all_transported_units = function (self)
	print("===============================")

	local story_teller = self.story_teller
	local story_id = self.story_id
	local story_length = story_teller.length(story_teller, story_id)

	print("Unlinking all transported units", self.current_story_time, story_length)
	print(Script.callstack())
	print("===============================")
	assert(self._transporting, "Trying to unlink units before linking.")

	self._transporting = false
	local unit = self.unit

	if self.is_server then
		local unit = self.unit
		local safe_node = "elevator_slot_01"
		local node = Unit.node(unit, safe_node)
		local position = Unit.world_position(unit, node)
		local rotation = Unit.world_rotation(unit, node)

		Managers.state.spawn:disable_spawning(false, unit, position + Vector3(0, 0, 1), rotation)
	end

	local transported_units = self.transported_units
	local num_transported_units = #transported_units

	for i = 1, num_transported_units, 1 do
		local unit = transported_units[i]
		transported_units[i] = nil

		if unit_alive(unit) then
			self._unlink_transported_unit(self, unit)
		end
	end

	Unit.flow_event(self.unit, "deactivate_collision")

	return 
end
LinkerTransportationExtension._unlink_transported_unit = function (self, unit_to_unlink)
	local unit = self.unit
	local locomotion_extension = ScriptUnit.extension(unit_to_unlink, "locomotion_system")
	local status_extension = ScriptUnit.extension(unit_to_unlink, "status_system")
	local player_manager = Managers.player
	local player = player_manager.owner(player_manager, unit_to_unlink)
	local index = table.find(self._bot_slots, unit_to_unlink)

	if index then
		table.remove(self._bot_slots, index)
	end

	if LINK_UNITS_ON_TRANSPORT then
		if player.local_player or player.bot_player then
			local end_position = nil

			if self.teleport_on_exit then
				end_position = Unit.world_position(unit, Unit.node(unit, "g_end"))
			else
				local link_node = Unit.node(unit, "rp_transport")

				if index and Unit.has_node(unit, "elevator_slot_0" .. index) then
					link_node = Unit.node(unit, "elevator_slot_0" .. index)
				end

				local transport_position = Unit.world_position(unit, link_node)
				local link_data = locomotion_extension.get_link_data(locomotion_extension)
				end_position = transport_position + link_data.offset:unbox()
			end

			local current_rotation = locomotion_extension.current_rotation(locomotion_extension)

			locomotion_extension.teleport_to(locomotion_extension, end_position, current_rotation)
			locomotion_extension.enable_script_driven_movement(locomotion_extension)
		end

		status_extension.set_using_transport(status_extension, false)
		LocomotionUtils.disable_linked_movement(unit_to_unlink)
	elseif player.local_player or player.bot_player then
		locomotion_extension.set_on_moving_platform(locomotion_extension, nil)

		if self.teleport_on_exit then
			local end_position = Unit.world_position(unit, Unit.node(unit, "g_end"))
			local current_rotation = locomotion_extension.current_rotation(locomotion_extension)

			locomotion_extension.teleport_to(locomotion_extension, end_position, current_rotation)
		end
	end

	return 
end
LinkerTransportationExtension._get_position_from_index = function (self, index)
	local unit = self.unit
	local position = nil

	if Unit.has_node(unit, "elevator_slot_0" .. index) then
		local node = Unit.node(unit, "elevator_slot_0" .. index)
		position = Unit.world_position(unit, node)
	else
		local pose, half_extents = Unit.box(unit)
		local translation = Matrix4x4.translation(pose)
		local rotation = Matrix4x4.rotation(pose)
		translation.z = transport_position.z
		position = translation + Quaternion.rotate(rotation, Vector3(half_extents[1]*0.5, half_extents[2]*0.5*self._bot_slots_offset[index], 0))
	end

	return position
end
LinkerTransportationExtension._link_transported_unit = function (self, unit_to_link, teleport_on_enter)
	local unit = self.unit
	local link_node = Unit.node(unit, "rp_transport")
	local transport_position = Unit.world_position(unit, link_node)
	local player_position = Unit.world_position(unit_to_link, 0)
	local offset = nil
	local player_manager = Managers.player
	local player = player_manager.owner(player_manager, unit_to_link)

	if LINK_UNITS_ON_TRANSPORT then
		if teleport_on_enter or self.teleport_on_enter then
			local index = #self._bot_slots + 1

			if Unit.has_node(unit, "elevator_slot_0" .. index) then
				link_node = Unit.node(unit, "elevator_slot_0" .. index)
				offset = Vector3(0, 0, 0)
			else
				local pose, half_extents = Unit.box(unit)
				local translation = Matrix4x4.translation(pose)
				local rotation = Matrix4x4.rotation(pose)
				translation.z = transport_position.z
				local position = translation + Quaternion.rotate(rotation, Vector3(half_extents[1]*0.5, half_extents[2]*0.5*self._bot_slots_offset[index], 0))
				offset = position - transport_position
			end

			self._bot_slots[#self._bot_slots + 1] = unit_to_link
		else
			offset = player_position - transport_position
		end

		local status_extension = ScriptUnit.extension(unit_to_link, "status_system")

		status_extension.set_using_transport(status_extension, true)
		LocomotionUtils.enable_linked_movement(self.world, unit_to_link, unit, link_node, offset)
	else
		local locomotion_extension = ScriptUnit.extension(unit_to_link, "locomotion_system")

		if teleport_on_enter or self.teleport_on_enter then
			local index = #self._bot_slots + 1
			self._bot_slots[index] = unit_to_link
			local position = self._get_position_from_index(self, index)

			if not player.remote then
				local current_rotation = locomotion_extension.current_rotation(locomotion_extension)

				locomotion_extension.teleport_to(locomotion_extension, position, current_rotation)
			end
		end

		if not player.remote then
			locomotion_extension.set_on_moving_platform(locomotion_extension, unit)
		end
	end

	return 
end
LinkerTransportationExtension.assign_position_to_bot = function (self)
	return Unit.world_position(self.unit, 0)
end

return 

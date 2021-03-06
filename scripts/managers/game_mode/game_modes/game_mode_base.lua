GameModeBase = class(GameModeBase)

GameModeBase.init = function (self, settings, world, network_server, level_transition_handler, is_server, profile_synchronizer, level_key, statistics_db)
	self._network_server = network_server
	self._settings = settings
	self._world = world
	self._level_transition_handler = level_transition_handler
	self._is_server = is_server
	self._profile_synchronizer = profile_synchronizer
	self._level_completed = false
	self._level_failed = false
	self._lose_condition_disabled = false
	self._end_level_areas = {}
	self._debug_end_level_areas = {}
	self._initial_peers_ready = false
	self._level_key = level_key
	self._statistics_db = statistics_db

	if script_data.ai_specials_spawning_disabled == nil then
		script_data.ai_specials_spawning_disabled = self._settings.ai_specials_spawning_disabled
	end

	self._player_spawners = {}
	self._pending_bot_remove = {}
	self._num_pending_bot_remove = 0
	self._game_mode_state = "initial_state"
end

GameModeBase.destroy = function (self)
	return
end

GameModeBase.add_hud_components = function (self, ingame_hud)
	local hud_components = self._settings.hud_components

	if hud_components then
		ingame_hud:add_components(hud_components)
	end
end

GameModeBase.cleanup_game_mode_units = function (self)
	return
end

GameModeBase.register_rpcs = function (self, network_event_delegate, network_transmit)
	self._network_event_delegate = network_event_delegate
	self._network_transmit = network_transmit
end

GameModeBase.unregister_rpcs = function (self)
	self._network_event_delegate = nil
	self._network_transmit = nil
end

GameModeBase._register_player_spawner = function (self, player_spawner)
	self._player_spawners[#self._player_spawners + 1] = player_spawner
end

GameModeBase.settings = function (self)
	return self._settings
end

GameModeBase.setup_done = function (self)
	return
end

GameModeBase.fail_level = function (self)
	self._level_failed = true
end

GameModeBase._is_time_up = function (self)
	if LEVEL_EDITOR_TEST then
		return false
	end

	local network_time = Managers.state.network:network_time()
	local max_time = NetworkConstants.clock_time.max
	local time_up = network_time / max_time > 0.9

	return time_up
end

GameModeBase._add_bot_to_party = function (self, party_id, profile_index, career_index)
	local local_peer_id = Network.peer_id()
	local local_player_id = Managers.player:next_available_local_player_id(local_peer_id)
	local slot_id = nil
	local is_bot = true

	Managers.party:assign_peer_to_party(local_peer_id, local_player_id, party_id, slot_id, is_bot)

	local profile = SPProfiles[profile_index]
	local bot_player = Managers.player:add_bot_player(profile.display_name, local_peer_id, "default", profile_index, career_index, local_player_id)

	bot_player:create_game_object()
	self._profile_synchronizer:select_profile(local_peer_id, local_player_id, profile_index, career_index)

	return bot_player
end

GameModeBase._remove_bot_instant = function (self, bot_player)
	if bot_player.player_unit then
		bot_player:despawn()
	end

	local peer_id = bot_player:network_id()
	local local_player_id = bot_player:local_player_id()
	local profile_index = bot_player:profile_index()
	local career_index = bot_player:career_index()

	self._profile_synchronizer:unassign_peer_to_profile(peer_id, local_player_id, profile_index, career_index)

	local status = Managers.party:get_player_status(peer_id, local_player_id)

	if status.party_id then
		Managers.party:remove_peer_from_party(peer_id, local_player_id, status.party_id)
	end

	Managers.player:remove_player(peer_id, local_player_id)
end

GameModeBase._remove_bot_update_safe = function (self, bot_player)
	if not Unit.alive(bot_player.player_unit) then
		self:_remove_bot_instant(bot_player)

		return
	end

	self._num_pending_bot_remove = self._num_pending_bot_remove + 1
	self._pending_bot_remove[self._num_pending_bot_remove] = bot_player

	Managers.state.spawn:delayed_despawn(bot_player)
end

GameModeBase.disable_lose_condition = function (self)
	self._lose_condition_disabled = true
end

GameModeBase.level_completed = function (self)
	return self._level_completed
end

GameModeBase.complete_level = function (self)
	self._level_completed = true
end

GameModeBase.ended = function (self, reason)
	return
end

GameModeBase.gm_event_end_conditions_met = function (self, reason, checkpoint_available, percentages_completed)
	return
end

GameModeBase.pre_update = function (self, t, dt)
	return
end

GameModeBase.server_update = function (self, t, dt)
	self:_update_bot_remove()
end

GameModeBase._update_bot_remove = function (self)
	local pending_bot_remove = self._pending_bot_remove
	local num_pending_bot_remove = self._num_pending_bot_remove

	for i = num_pending_bot_remove, 1, -1 do
		local bot_player = pending_bot_remove[i]

		if not bot_player.player_unit then
			self:_remove_bot_instant(bot_player)

			local last = pending_bot_remove[num_pending_bot_remove]
			pending_bot_remove[i] = last
			pending_bot_remove[last] = nil
			num_pending_bot_remove = num_pending_bot_remove - 1
		end
	end

	self._num_pending_bot_remove = num_pending_bot_remove
end

GameModeBase.evaluate_end_conditions = function (self)
	return false, nil
end

GameModeBase.ready_to_transition = function (self)
	self._level_transition_handler:level_completed()
end

GameModeBase.object_sets = function (self)
	return self._settings.object_sets
end

GameModeBase.wanted_transition = function (self)
	return
end

GameModeBase.hot_join_sync = function (self, sender)
	return
end

GameModeBase.mutators = function (self)
	local game_mode_event_data = Managers.matchmaking and Managers.matchmaking:game_mode_event_data()

	if game_mode_event_data then
		local mutators = game_mode_event_data.mutators

		return mutators
	else
		return Managers.deed:mutators()
	end
end

GameModeBase.spawning_update = function (self)
	return
end

GameModeBase.ready_to_spawn = function (self, status)
	return
end

GameModeBase.player_entered_game_session = function (self, peer_id, local_player_id)
	local player_spawners = self._player_spawners

	for i = 1, #player_spawners, 1 do
		player_spawners[i]:player_entered_game_session(peer_id, local_player_id)
	end
end

GameModeBase.player_left_game_session = function (self, peer_id, local_player_id)
	return
end

GameModeBase.all_peers_ready = function (self)
	self._initial_peers_ready = true
end

GameModeBase.player_joined_party = function (self, peer_id, local_player_id, new_party_id, slot_id)
	local player_spawners = self._player_spawners

	for i = 1, #player_spawners, 1 do
		player_spawners[i]:player_joined_party(peer_id, local_player_id, new_party_id, slot_id)
	end
end

GameModeBase.player_left_party = function (self, peer_id, local_player_id, party_id, slot_id)
	local player_spawners = self._player_spawners

	for i = 1, #player_spawners, 1 do
		player_spawners[i]:player_left_party(peer_id, local_player_id, party_id, slot_id)
	end
end

GameModeBase.game_mode_state = function (self)
	return self._game_mode_state
end

GameModeBase.change_game_mode_state = function (self, state_name)
	printf("[GameMode] Changing game mode state to %s", state_name)

	self._game_mode_state = state_name

	self:_game_mode_state_changed(state_name)

	if self._is_server then
		Managers.state.game_mode:change_game_mode_state(state_name)
	end
end

GameModeBase._game_mode_state_changed = function (self, state_name)
	return
end

GameModeBase.disable_player_spawning = function (self)
	return
end

GameModeBase.enable_player_spawning = function (self, safe_position, safe_rotation)
	return
end

GameModeBase.teleport_despawned_players = function (self, position)
	return
end

GameModeBase.respawn_unit_spawned = function (self, unit)
	return
end

GameModeBase.flow_callback_add_spawn_point = function (self, unit)
	return
end

GameModeBase.force_respawn = function (self, peer_id, local_player_id)
	return
end

GameModeBase.force_respawn_dead_players = function (self)
	return
end

local empty_table = {}

GameModeBase.get_active_respawn_units = function (self)
	return empty_table
end

GameModeBase.get_player_wounds = function (self, profile)
	return 5
end

GameModeBase.get_initial_inventory = function (self, healthkit, potion, grenade, profile)
	local initial_inventory = {
		slot_packmaster_claw = "packmaster_claw",
		slot_healthkit = healthkit,
		slot_potion = potion,
		slot_grenade = grenade
	}

	return initial_inventory
end

GameModeBase.get_conflict_settings = function (self)
	return
end

GameModeBase.activate_end_level_area = function (self, unit, object, from, to)
	local extents = (to - from) * 0.5
	local offset = (from + to) * 0.5
	self._end_level_areas[unit] = {
		object = object,
		extents = Vector3Box(extents),
		offset = Vector3Box(offset)
	}
end

GameModeBase.debug_end_level_area = function (self, unit, object, from, to)
	local extents = (to - from) * 0.5
	local offset = (from + to) * 0.5
	self._debug_end_level_areas[unit] = {
		object = object,
		extents = Vector3Box(extents),
		offset = Vector3Box(offset)
	}
end

GameModeBase.disable_end_level_area = function (self, unit)
	self._end_level_areas[unit] = nil
end

GameModeBase.trigger_end_level_area_events = function (self)
	for unit, _ in pairs(self._end_level_areas) do
		Unit.flow_event(unit, "lua_level_completed_triggered")
	end
end

GameModeBase.update_end_level_areas = function (self)
	for unit, data in pairs(self._debug_end_level_areas) do
		local node = Unit.node(unit, data.object)
		local rot = Unit.world_rotation(unit, node)
		local right = Quaternion.right(rot)
		local fwd = Quaternion.forward(rot)
		local up = Quaternion.up(rot)
		local object_pos = Unit.world_position(unit, node)
		local offset = data.offset:unbox()
		local pos = object_pos + right * offset.x + fwd * offset.y + up * offset.z
		local pose = Matrix4x4.from_quaternion_position(rot, pos)
		local extents = data.extents:unbox()

		QuickDrawer:quaternion(object_pos, rot)

		local enabled = self._end_level_areas[unit]

		QuickDrawer:box(pose, extents, (enabled and Color(0, 255, 0)) or Color(255, 0, 0))
	end

	if table.is_empty(self._end_level_areas) then
		return false
	else
		local dot = Vector3.dot
		local abs = math.abs
		local num_non_disabled_players = 0

		for _, player in pairs(Managers.player:human_players()) do
			local player_unit = player.player_unit
			local non_disabled = Unit.alive(player_unit) and not ScriptUnit.extension(player_unit, "status_system"):is_disabled()

			if non_disabled then
				num_non_disabled_players = num_non_disabled_players + 1
				local pos = POSITION_LOOKUP[player_unit]
				local in_end_area = false

				for unit, data in pairs(self._end_level_areas) do
					local node = Unit.node(unit, data.object)
					local object_pos = Unit.world_position(unit, node)
					local object_rot = Unit.world_rotation(unit, node)
					local right = Quaternion.right(object_rot)
					local forward = Quaternion.forward(object_rot)
					local up = Quaternion.up(object_rot)
					local offset = data.offset:unbox()
					local center_pos = object_pos + right * offset.x + forward * offset.y + up * offset.z
					local extents = data.extents:unbox()
					local player_offset = pos - center_pos

					if abs(dot(player_offset, right)) < abs(extents.x) and abs(dot(player_offset, forward)) < abs(extents.y) and abs(dot(player_offset, up)) < abs(extents.z) then
						in_end_area = true

						break
					end
				end

				if not in_end_area then
					return false
				end
			end
		end

		return num_non_disabled_players > 0
	end
end

GameModeBase.get_end_screen_config = function (self, game_won, game_lost, player)
	return "none", {}
end

GameModeBase.local_player_ready_to_start = function (self, player)
	return true
end

GameModeBase.local_player_game_starts = function (self, player, loading_context)
	return
end

return

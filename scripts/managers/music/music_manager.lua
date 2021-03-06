require("scripts/settings/music_settings")
require("scripts/managers/music/music_player")

local function dprint(...)
	if script_data.debug_music then
		print("[MusicManager] ", ...)
	end
end

MusicManager = class(MusicManager)
MusicManager.bus_transition_functions = {
	linear = function (transition, t)
		return math.lerp(transition.start_value, transition.target_value, t)
	end,
	sine = function (transition, t)
		return math.lerp(transition.start_value, transition.target_value, math.sin(t * math.pi * 0.5))
	end,
	smoothstep = function (transition, t)
		return math.lerp(transition.start_value, transition.target_value, math.smoothstep(t, 0, 1))
	end
}
MusicManager.panning_rules = {
	PANNING_RULE_SPEAKERS = 0,
	PANNING_RULE_HEADPHONES = 1
}

MusicManager.init = function (self)
	if GLOBAL_MUSIC_WORLD then
		self._world = MUSIC_WORLD
		self._wwise_world = MUSIC_WWISE_WORLD
	else
		self._world = Managers.world:create_world("music_world", nil, nil, nil, Application.DISABLE_PHYSICS, Application.DISABLE_RENDERING)
		self._wwise_world = Managers.world:wwise_world(self._world)

		ScriptWorld.deactivate(self._world)
	end

	self._music_players = {}
	self._bus_transitions = {}
	self._flags = {}
	self._game_state = nil
	self._game_object_id = nil
	self._group_states = {}
	self._event_queues = {}
	local master_bus_volume = Application.user_setting("master_bus_volume")

	if master_bus_volume ~= nil then
		self:set_master_volume(master_bus_volume)
	end

	local music_bus_volume = Application.user_setting("music_bus_volume")

	if music_bus_volume ~= nil then
		self:set_music_volume(music_bus_volume)
	end

	local sound_panning_rule = Application.user_setting("sound_panning_rule")

	if sound_panning_rule ~= nil then
		local rule = (sound_panning_rule == "headphones" and "PANNING_RULE_HEADPHONES") or "PANNING_RULE_SPEAKERS"

		self:set_panning_rule(rule)
	end

	local sound_channel_configuration = Application.user_setting("sound_channel_configuration")

	if not DEDICATED_SERVER then
		Wwise.set_bus_config("ingame_mastering_channel", sound_channel_configuration)
	end
end

MusicManager.stop_all_sounds = function (self)
	dprint("stop_all_sounds")
	self._wwise_world:stop_all()
end

MusicManager.stop_event_id = function (self, event_id)
	if self._wwise_world:is_playing(event_id) then
		self._wwise_world:stop_event(event_id)
	end
end

MusicManager.trigger_event = function (self, event_name)
	dprint("trigger_event", event_name)

	local wwise_world = self._wwise_world
	local wwise_playing_id, wwise_source_id = WwiseWorld.trigger_event(wwise_world, event_name)

	print("MUSIC MANAGER", event_name, wwise_playing_id, wwise_source_id)

	return wwise_playing_id, wwise_source_id
end

MusicManager.trigger_event_queue = function (self, event_queue_name, event_queue, delay)
	fassert(not self._event_queues[event_queue_name], "[MusicManager:trigger_event_queue] There is already an event queue playing with that name")

	local event_index = 1
	local first_event = event_queue[1]
	local wwise_playing_id, wwise_source_id = self:trigger_event(first_event)
	self._event_queues[event_queue_name] = {
		delay = delay or 0.5,
		event_index = event_index,
		wwise_playing_id = wwise_playing_id,
		wwise_source_id = wwise_source_id,
		event_queue = event_queue
	}
end

MusicManager.update = function (self, dt, t)
	local conflict_director = Managers.state.conflict

	if conflict_director then
		self:_update_flag_in_combat(conflict_director)
		self:_update_combat_intensity(conflict_director)
		self:_update_boss_state(conflict_director)
		self:_update_game_state(dt, t, conflict_director)
		self:_update_player_state(dt, t)
		self:_update_career_state(dt, t)
		self:_update_enemy_aggro_state(dt, t)
	end

	self:_update_flags()
	self:_handle_event_queues(dt, t)

	local flags = self._flags

	for _, player in pairs(self._music_players) do
		player:update(flags, self._game_object_id)
	end
end

local EVENT_QUEUS_TO_REMOVE = {}

MusicManager._handle_event_queues = function (self, dt, t)
	table.clear(EVENT_QUEUS_TO_REMOVE)

	for event_queue_name, event_queue_data in pairs(self._event_queues) do
		local wwise_playing_id = event_queue_data.wwise_playing_id

		if not self:is_playing(wwise_playing_id) then
			if not event_queue_data.current_delay then
				event_queue_data.current_delay = t + event_queue_data.delay
			elseif event_queue_data.current_delay < t then
				local event_queue = event_queue_data.event_queue
				local new_index = event_queue_data.event_index + 1
				local new_event = event_queue[new_index]

				if new_event then
					local wwise_playing_id, wwise_source_id = self:trigger_event(new_event)
					event_queue_data.event_index = new_index
					event_queue_data.wwise_playing_id = wwise_playing_id
					event_queue_data.wwise_source_id = wwise_source_id
					event_queue_data.current_delay = nil
				else
					EVENT_QUEUS_TO_REMOVE[#EVENT_QUEUS_TO_REMOVE + 1] = event_queue_name
				end
			end
		end
	end

	for _, event_queue_name in ipairs(EVENT_QUEUS_TO_REMOVE) do
		self:stop_event_queue(event_queue_name)
	end
end

MusicManager.stop_event_queue = function (self, event_queue_name)
	local event_queue_data = self._event_queues[event_queue_name]

	if not event_queue_data then
		return
	end

	local wwise_playing_id = event_queue_data.wwise_playing_id

	if self:is_playing(wwise_playing_id) then
		self:stop_event_id(wwise_playing_id)
	end

	self._event_queues[event_queue_name] = nil
end

MusicManager.destroy = function (self)
	if not GLOBAL_MUSIC_WORLD then
		Application.release_world(self._world)
	end
end

MusicManager.on_enter_level = function (self, network_event_delegate, is_server)
	self:set_flag("in_level", true)
	self:_setup_level_music_players()

	self._network_event_delegate = network_event_delegate

	if is_server then
		local go_type = NetworkLookup.go_types.music_states
		local intensity_state_id = NetworkLookup.music_group_states.low_battle
		local game_state_id = NetworkLookup.music_group_states.explore
		local boss_state_id = NetworkLookup.music_group_states.no_boss
		local init_data = {
			go_type = go_type,
			combat_intensity = intensity_state_id,
			game_state = game_state_id,
			boss_state = boss_state_id
		}
		local session = Managers.state.network.game_session

		fassert(not self._game_object_id, "Creating game object when already exists")

		self._game_object_id = Managers.state.network:create_game_object("music_states", init_data, function (game_object_id)
			self:server_game_session_disconnect_music_states(game_object_id)
		end)
	end

	self._is_server = is_server
	self.last_man_standing = false
end

MusicManager.on_exit_level = function (self)
	dprint("on_exit_level")
	self:_reset_level_music_players()
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil

	self:set_flag("in_level", false)

	self._is_server = false
	self.last_man_standing = false
end

MusicManager.client_game_session_disconnect_music_states = function (self, game_object_id)
	return
end

MusicManager.server_game_session_disconnect_music_states = function (self, game_object_id)
	self:game_object_destroyed(game_object_id, self._owner_id, self._go_template)
end

MusicManager.game_object_created = function (self, game_object_id, owner_id, go_template)
	self._game_object_id = game_object_id
	self._owner_id = owner_id
	self._go_template = go_template
end

MusicManager.game_object_destroyed = function (self, game_object_id, owner_id, go_template)
	Application.warning("[MusicManager:game_object_destroyed] Removed go_template == self._go_template check due to crash")

	self._game_object_id = nil
	self._owner_id = nil
	self._go_template = nil
end

MusicManager._update_flags = function (self)
	self:set_flag("combat_music_enabled", not script_data.debug_disable_combat_music)

	local game_object_id = self._game_object_id

	if self._is_server or not game_object_id then
		return
	end

	local session = Managers.state.network:game()

	for flag, _ in pairs(SyncedMusicFlags) do
		local value = GameSession.game_object_field(session, game_object_id, flag)

		self:set_flag(flag, value)
	end
end

MusicManager.set_flag = function (self, flag, value)
	if self._flags[flag] == value then
		return
	end

	dprint("set_flag", flag, value)

	self._flags[flag] = value

	if self._is_server and SyncedMusicGroupFlags[flag] then
		local session = Managers.state.network:game()

		GameSession.set_game_object_field(session, self._game_object_id, flag, value)
	end
end

MusicManager._setup_level_music_players = function (self)
	local music_configs = MusicSettings

	for config_name, config in pairs(music_configs) do
		if config.ingame_only then
			local start = config.start_event
			local stop = config.stop
			local set_flags = config.set_flags
			local unset_flags = config.unset_flags
			local parameters = config.parameters
			local groups = config.default_group_states
			local game_state_voice_thresholds = config.game_state_voice_thresholds
			local player = MusicPlayer:new(self._wwise_world, start, stop, config_name, set_flags, unset_flags, parameters, groups, game_state_voice_thresholds)
			self._music_players[config_name] = player
		end
	end
end

MusicManager._reset_level_music_players = function (self)
	local music_configs = MusicSettings

	for config_name, config in pairs(music_configs) do
		if config.ingame_only then
			local player = self._music_players[config_name]

			if player then
				player:destroy()

				self._music_players[config_name] = nil
			end
		end
	end
end

MusicManager._number_of_aggroed_enemies = function (self)
	local ai_slot_system = Managers.state.entity:system("ai_slot_system")
	local num_enemies = ai_slot_system.num_total_enemies

	return num_enemies
end

MusicManager._update_flag_in_combat = function (self, conflict_director)
	local num_aggroed_enemies = self:_number_of_aggroed_enemies()
	local pacing = conflict_director.pacing
	local intensity = pacing.total_intensity
	local in_combat = CombatMusic.minimum_enemies < num_aggroed_enemies and CombatMusic.minimum_intensity < intensity

	self:set_flag("in_combat", in_combat)
end

MusicManager._update_combat_intensity = function (self, conflict_director)
	if not self._flags.in_combat then
		return
	end

	local pacing = conflict_director.pacing
	local intensity = pacing.total_intensity
	local highest_state = nil

	for _, data in ipairs(IntensityThresholds) do
		if data.threshold < intensity then
			highest_state = data.state
		end
	end

	if highest_state then
		self:set_music_group_state("combat_music", "combat_intensity", highest_state)
	end
end

MusicManager._update_boss_state = function (self, conflict_director)
	local music_player = self._music_players.combat_music

	if music_player and self._is_server then
		local angry_boss = conflict_director:angry_boss()
		local state = nil

		if angry_boss then
			state = self:_get_combat_music_state(conflict_director)
		else
			state = "no_boss"
		end

		self:set_music_group_state("combat_music", "boss_state", state)
	end

	if not DEDICATED_SERVER then
		self:_update_boss_music_intensity(conflict_director)
	end
end

MusicManager._get_combat_music_state = function (self, conflict_director)
	local state = "rat_ogre"
	local boss_units = conflict_director:alive_bosses()
	local BLACKBOARDS = BLACKBOARDS

	for i = #boss_units, 1, -1 do
		local unit = boss_units[i]
		local blackboard = BLACKBOARDS[unit]

		if blackboard and blackboard.is_angry then
			local breed = blackboard.breed
			state = breed.combat_music_state or state

			if breed.combat_music_state ~= "no_boss" then
				break
			end
		end
	end

	return state
end

MusicManager._update_boss_music_intensity = function (self, conflict_director)
	local player_manager = Managers.player
	local state_name = BossFightMusicIntensity.default_state
	local group_name = BossFightMusicIntensity.group_name
	local local_player = player_manager:local_player()

	if local_player then
		local player_unit = local_player.player_unit

		if Unit.alive(player_unit) then
			local player_position = POSITION_LOOKUP[player_unit]
			local boss_units = conflict_director:alive_bosses()
			local additional_contributing_units = FrameTable.alloc_table()

			for _, breed in pairs(BossFightMusicIntensity.additional_contributing_units) do
				table.append_non_indexed(additional_contributing_units, conflict_director:spawned_units_by_breed(breed))
			end

			local min_distance_sq = math.huge

			for _, unit in pairs(boss_units) do
				local unit_position = POSITION_LOOKUP[unit]
				local distance_sq = Vector3.distance_squared(player_position, unit_position)

				if distance_sq < min_distance_sq then
					min_distance_sq = distance_sq or min_distance_sq
				end
			end

			for _, unit in pairs(additional_contributing_units) do
				local unit_position = POSITION_LOOKUP[unit]
				local distance_sq = Vector3.distance_squared(player_position, unit_position)

				if distance_sq < min_distance_sq then
					min_distance_sq = distance_sq or min_distance_sq
				end
			end

			for _, boss_intensity_data in ipairs(BossFightMusicIntensity) do
				if min_distance_sq < boss_intensity_data.max_distance^2 then
					state_name = boss_intensity_data.state

					break
				end
			end
		end
	end

	self:set_wwise_state(group_name, state_name)
end

MusicManager.set_wwise_state = function (self, group_name, state_name)
	self._group_states[group_name] = self._group_states[group_name] or nil

	if state_name ~= self._group_states[group_name] then
		Wwise.set_state(group_name, state_name)
	end

	self._group_states[group_name] = state_name
end

MusicManager.check_last_man_standing_music_state = function (self)
	local player_manager = Managers.player
	local num_players = player_manager:num_players()

	if num_players == 1 then
		self.last_man_standing = false

		return
	end

	local local_player = player_manager:local_player()
	local player_unit = local_player and local_player.player_unit

	if Unit.alive(player_unit) then
		local status_extension = ScriptUnit.has_extension(player_unit, "status_system")

		if status_extension and not status_extension:is_disabled() then
			local num_alive_allies = player_manager:num_alive_allies(local_player)
			local last_man_standing = num_alive_allies == 0
			self.last_man_standing = last_man_standing

			if last_man_standing then
				local dialogue_extension = ScriptUnit.has_extension(player_unit, "dialogue_system")

				if dialogue_extension then
					local dialogue_input = ScriptUnit.extension_input(player_unit, "dialogue_system")
					local event_data = FrameTable.alloc_table()

					dialogue_input:trigger_dialogue_event("last_hero_standing", event_data)
				end
			end
		else
			self.last_man_standing = false
		end
	else
		self.last_man_standing = false
	end
end

local function get_horde_music_state(state, sound_settings)
	local music_state_settings = sound_settings.music_states
	local music_state = music_state_settings[state]

	return music_state or state
end

local HORDE_MUSIC_STATES = {
	pre_ambush = true,
	pre_horde = true,
	ambush = true,
	horde = true
}

MusicManager._update_game_state = function (self, dt, t, conflict_director)
	local music_player = self._music_players.combat_music

	if music_player and self._is_server then
		local state = nil
		local horde_type, sound_settings = conflict_director:has_horde()
		local game_mode_manager = Managers.state.game_mode
		local lost = (game_mode_manager:game_mode().about_to_lose and true) or false
		local player_manager = Managers.player
		local local_player = player_manager:local_player()
		local won = game_mode_manager:game_won(local_player)
		local old_state = self._game_state
		local is_survival = game_mode_manager:game_mode_key() == "survival"
		local horde_size, horde_ends_at = conflict_director:horde_size()
		local is_pre_horde = old_state == "pre_horde" or old_state == "pre_ambush"
		local is_horde_alive = (is_survival and horde_size >= 1) or (horde_size >= 7 and t < horde_ends_at) or horde_type

		if lost then
			if is_survival then
				state = "survival_lost"
			else
				state = "lost"
			end
		elseif won then
			local level_settings = LevelHelper:current_level_settings()
			state = (level_settings and level_settings.music_won_state) or "won"
			local active_weave = Managers.weave:get_active_weave()

			if active_weave then
				local weave_phase = Managers.weave:get_active_weave_phase() or 0

				if weave_phase == 2 then
					state = "won_between_winds"
				end
			end
		elseif is_pre_horde and self._scream_delay and self._scream_delay < t then
			self._scream_delay = nil
			state = "horde"
		elseif is_pre_horde and not self._scream_delay and self:_horde_done_spawning(horde_type) then
			if horde_type == "ambush" then
				self:delay_trigger_horde_dialogue(t, t + DialogueSettings.ambush_delay, "ambush")

				self._scream_delay = t + 1.5
				state = old_state
			else
				state = "horde"
			end
		elseif is_pre_horde and is_horde_alive then
			state = old_state
		elseif old_state == "horde" and is_horde_alive then
			state = "horde"
		elseif horde_type == "vector" or horde_type == "vector_blob" or horde_type == "event" then
			state = "pre_horde"

			self:delay_trigger_horde_dialogue(t, t + DialogueSettings.vector_delay, "vector")

			self._current_horde_sound_settings = sound_settings
		elseif horde_type == "ambush" then
			state = "pre_ambush"
			self._current_horde_sound_settings = sound_settings
		else
			state = "explore"
		end

		if state ~= old_state then
			print("MUSIC: ", old_state, "->", state)
		end

		self._game_state = state
		local music_state = nil

		if self._current_horde_sound_settings and HORDE_MUSIC_STATES[state] then
			music_state = get_horde_music_state(state, self._current_horde_sound_settings)
		else
			music_state = state
		end

		self:set_music_group_state("combat_music", "game_state", music_state)
		self:delay_trigger_horde_dialogue(t)
	end
end

local ai_units = {}

MusicManager._horde_done_spawning = function (self, horde)
	local engage_distance = (horde == "ambush" and 25) or 25
	local pos = nil
	local players = Managers.player:players()

	for _, player in pairs(players) do
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			pos = POSITION_LOOKUP[player_unit]
			local num_units = AiUtils.broadphase_query(pos, engage_distance, ai_units)

			for i = 1, num_units, 1 do
				local unit = ai_units[i]
				local ai_extension = ScriptUnit.extension(unit, "ai_system")
				local blackboard = ai_extension:blackboard()
				local spawn_type = blackboard.spawn_type

				if (spawn_type == "horde_hidden" or spawn_type == "horde") and AiUtils.unit_alive(unit) then
					return true
				end
			end
		end
	end

	return false
end

MusicManager._update_player_state = function (self, dt, t)
	local music_player = self._music_players.combat_music
	local local_player_id = self._active_local_player_id

	if music_player and local_player_id then
		local player = Managers.player:local_player(local_player_id)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local state = nil
			local status_ext = ScriptUnit.extension(player_unit, "status_system")

			if Managers.state.game_mode:game_mode().about_to_lose then
				state = "normal"
			elseif status_ext:is_ready_for_assisted_respawn() then
				state = "normal"
			elseif status_ext:is_dead() then
				state = "dead"
			elseif status_ext:is_knocked_down() then
				state = "knocked_down"
			elseif status_ext:is_in_vortex() then
				state = "normal"
			elseif status_ext:is_disabled() and not status_ext:is_grabbed_by_chaos_spawn() and not status_ext:is_grabbed_by_corruptor() then
				state = "need_help"
			elseif self.last_man_standing then
				state = "last_man_standing"
			else
				state = "normal"
			end

			music_player:set_group_state("player_state", state)
		else
			music_player:set_group_state("player_state", "normal")
		end
	elseif music_player then
		music_player:set_group_state("player_state", "normal")
	end
end

MusicManager._update_career_state = function (self, dt, t)
	local music_player = self._music_players.combat_music
	local local_player_id = self._active_local_player_id
	local player = Managers.player:local_player(local_player_id)

	if player and player.bot_player then
		return
	end

	local career_state = "default"

	if player then
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local career_extension = ScriptUnit.extension(player_unit, "career_system")
			career_state = career_extension:get_state()
		end
	end

	if music_player then
		music_player:set_group_state("career_state", career_state)
	end
end

MusicManager._update_enemy_aggro_state = function (self, dt, t)
	local music_player = self._music_players.combat_music
	local local_player_id = self._active_local_player_id

	if music_player and local_player_id then
		local player = Managers.player:local_player(local_player_id)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local sound_effect_extension = ScriptUnit.extension(player_unit, "sound_effect_system")
			local aggro_state = sound_effect_extension:get_music_aggro_state()

			music_player:set_group_state("music_target_aggro", aggro_state)
		else
			music_player:set_group_state("music_target_aggro", "husk")
		end
	elseif music_player then
		music_player:set_group_state("music_target_aggro", "husk")
	end
end

MusicManager.register_active_player = function (self, player_id)
	fassert(not self._active_local_player_id, "Active player %q already registered!", player_id)

	self._active_local_player_id = player_id
end

MusicManager.unregister_active_player = function (self, player_id)
	fassert(self._active_local_player_id == player_id, "Trying to unregister player %q when player %q is active player", player_id, self._player_id)

	self._active_local_player_id = nil
end

MusicManager.set_music_group_state = function (self, music_player, group, state)
	local game_object_id = self._game_object_id

	if self._is_server and game_object_id then
		local state_id = NetworkLookup.music_group_states[state]
		local session = Managers.state.network:game()

		GameSession.set_game_object_field(session, game_object_id, group, state_id)
	end
end

MusicManager.music_trigger = function (self, music_player, event)
	local player = self._music_players[music_player]

	player:post_trigger(event)
end

MusicManager.set_music_volume = function (self, value)
	WwiseWorld.set_global_parameter(self._wwise_world, "music_bus_volume", value)
end

MusicManager.set_master_volume = function (self, value)
	WwiseWorld.set_global_parameter(self._wwise_world, "master_bus_volume", value)
end

MusicManager.set_panning_rule = function (self, rule)
	fassert(MusicManager.panning_rules[rule] ~= nil, "[MusicManager] Panning rule does not exist: %q", rule)
	Wwise.set_panning_rule(MusicManager.panning_rules[rule])
end

MusicManager.is_playing = function (self, wwise_playing_id)
	return WwiseWorld.is_playing(self._wwise_world, wwise_playing_id)
end

MusicManager.delay_trigger_horde_dialogue = function (self, t, delay, horde_name)
	if delay ~= nil then
		self._horde_delay = delay
		self._horde_type = horde_name
	end

	if self._horde_delay ~= nil and self._horde_delay < t then
		MusicManager:trigger_horde_dialogue(self._horde_type)

		self._horde_delay = nil
		self._horde_type = nil
	end
end

MusicManager.trigger_horde_dialogue = function (self, horde_name)
	local dummy_unit = DialogueSystem:get_random_player()

	if dummy_unit then
		SurroundingAwareSystem.add_event(dummy_unit, "horde", DialogueSettings.discover_enemy_attack_distance, "horde_type", horde_name)
	end
end

return

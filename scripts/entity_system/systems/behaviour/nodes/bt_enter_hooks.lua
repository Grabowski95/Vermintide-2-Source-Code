BTEnterHooks = BTEnterHooks or {}
local BTEnterHooks = BTEnterHooks
local unit_alive = Unit.alive
local ScriptUnit = ScriptUnit
BTEnterHooks.crouch_on_enter = function (unit, blackboard, t)
	Managers.state.network:anim_event(unit, "to_crouch")

	blackboard.is_upright = false

	return 
end
BTEnterHooks.upright_on_enter = function (unit, blackboard, t)
	if not blackboard.is_upright then
		Managers.state.network:anim_event(unit, "to_upright")

		blackboard.is_upright = true
	end

	return 
end
BTEnterHooks.crouch_or_upright_on_enter = function (unit, blackboard, t)
	if blackboard.needs_to_crouch == nil then
		PerceptionUtils.troll_crouch_check(unit, blackboard, t)
	end

	if blackboard.needs_to_crouch then
		Managers.state.network:anim_event(unit, "to_crouch")
	else
		Managers.state.network:anim_event(unit, "to_upright")
	end

	return 
end
BTEnterHooks.rage_on_enter = function (unit, blackboard, t)
	blackboard.next_rage_time = t + 7

	return 
end
BTEnterHooks.attack_grabbed_smash = function (unit, blackboard, t)
	if Unit.alive(blackboard.victim_grabbed) then
		StatusUtils.set_grabbed_by_chaos_spawn_status_network(blackboard.victim_grabbed, "beating_with")
	end

	blackboard.grabbed_state = "attack_smash"
	blackboard.attack_grabbed_attacks = blackboard.attack_grabbed_attacks + 1

	if blackboard.breed.max_grabbed_attacks <= blackboard.attack_grabbed_attacks then
		blackboard.wants_to_throw = true
		blackboard.attack_grabbed_attacks = 0
	end

	return 
end
BTEnterHooks.on_warlord_dual_wield = function (unit, blackboard, t)
	if blackboard.inventory_item_set ~= 2 then
		blackboard.switching_weapons = 2
	end

	return 
end
BTEnterHooks.on_warlord_halberd = function (unit, blackboard, t)
	if blackboard.inventory_item_set ~= 1 then
		blackboard.switching_weapons = 1
	end

	return 
end
BTEnterHooks.on_warlord_disable_blocking = function (unit, blackboard, t)
	local ai_shield_extension = ScriptUnit.has_extension(unit, "ai_shield_system")

	if ai_shield_extension then
		ai_shield_extension.set_is_blocking(ai_shield_extension, false)
		ai_shield_extension.set_is_dodging(ai_shield_extension, false)
	end

	return 
end
BTEnterHooks.on_grey_seer_intro_enter = function (unit, blackboard, t)
	local health_extension = ScriptUnit.extension(unit, "health_system")
	health_extension.is_invincible = true
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local go_id = Managers.state.unit_storage:go_id(unit)

	network_transmit.send_rpc_clients(network_transmit, "rpc_set_hit_reaction_template", go_id, "HitEffectsSkavenGreySeerMounted")

	return 
end
BTEnterHooks.grey_seer_death_sequence_teleport = function (unit, blackboard, t)
	local index = blackboard.current_death_sequence_index or 1
	local teleport_position = blackboard.death_sequence_positions[index]

	if teleport_position then
		blackboard.quick_teleport_exit_pos = Vector3Box(teleport_position.unbox(teleport_position))
		blackboard.quick_teleport = true
		blackboard.current_death_sequence_index = index + 1
	end

	return 
end
BTEnterHooks.to_combat = function (unit, blackboard, t)
	Managers.state.network:anim_event(unit, "to_combat")

	return 
end
BTEnterHooks.on_chaos_exalted_champion_intro_enter = function (unit, blackboard, t)
	local level_analysis = Managers.state.conflict.level_analysis
	local node_units = level_analysis.generic_ai_node_units.chaos_exalted_intro_move_to

	if node_units then
		local node_unit = node_units[1]
		local pos = Unit.local_position(node_unit, 0)
		blackboard.goal_destination = Vector3Box(pos)
		local health_extension = ScriptUnit.extension(unit, "health_system")
		health_extension.is_invincible = true
	else
		print("Found no generic AI node (chaos_exalted_intro_move_to) for lord intro, ", unit)

		blackboard.intro_timer = nil
	end

	return 
end
BTEnterHooks.on_chaos_exalted_sorcerer_intro_enter = function (unit, blackboard, t)
	local level_analysis = Managers.state.conflict.level_analysis
	local node_units = level_analysis.generic_ai_node_units.sorcerer_boss_intro

	if node_units then
		local node_unit = node_units[1]
		local pos = Unit.local_position(node_unit, 0)
		local rot = Unit.local_rotation(node_unit, 0)
		blackboard.quick_teleport_exit_pos = Vector3Box(pos)
		blackboard.quick_teleport = true

		Unit.set_local_rotation(unit, 0, rot)

		local health_extension = ScriptUnit.extension(unit, "health_system")
		health_extension.is_invincible = true
	else
		print("Found no generic AI node (sorcerer_boss_intro) for lord intro, ", unit)

		blackboard.intro_timer = nil
	end

	local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input.trigger_networked_dialogue_event(dialogue_input, "ebh_intro", event_data)

	return 
end
BTEnterHooks.on_skaven_warlord_intro_enter = function (unit, blackboard, t)
	local level_analysis = Managers.state.conflict.level_analysis
	local node_units = level_analysis.generic_ai_node_units.skaven_warlord_intro_move_to

	if node_units then
		local node_unit = node_units[1]
		local pos = Unit.local_position(node_unit, 0)
		blackboard.goal_destination = Vector3Box(pos)
		local health_extension = ScriptUnit.extension(unit, "health_system")
		health_extension.is_invincible = true
	else
		print("Found no generic AI node (skaven_warlord_intro_move_to) for lord intro, ", unit)

		blackboard.intro_timer = nil
	end

	return 
end
BTEnterHooks.sorcerer_dummy_idle = function (unit, blackboard, t)
	Managers.state.network:anim_event(unit, "to_plague_wave")

	return 
end
BTEnterHooks.corruptor_enter = function (unit, blackboard, t)
	Managers.state.network:anim_event(unit, "to_corruptor")

	return 
end
BTEnterHooks.grey_seer_stagger_enter = function (unit, blackboard, t)
	local damage_wave_extension = blackboard.damage_wave_extension

	if damage_wave_extension then
		damage_wave_extension.abort(damage_wave_extension)
	end

	return 
end

local function setup_sorcerer_boss_spawning(unit, blackboard, data)
	local call_position = nil
	local spawner = ConflictUtils.get_random_spawner_with_id("sorcerer_boss")

	if spawner then
		call_position = Unit.local_position(spawner, 0)
		local fwd = Vector3.normalize(Vector3.flat(Quaternion.forward(ScriptUnit.extension(spawner, "spawner_system"):spawn_rotation())))
		data.spawn_forward = Vector3Box(fwd)
		local spawners = {
			ConflictUtils.get_random_spawner_with_id("sorcerer_boss_minion")
		}

		print("found spawner for sorcerer_boss_minion:", spawners[1])

		spawners[2] = ConflictUtils.get_random_spawner_with_id("sorcerer_boss_minion", spawners[1])

		print("found spawner for sorcerer_boss_minion:", spawners[2])

		data.spawners = spawners
		blackboard.defensive_spawner = spawner
	else
		local dummy_action = {
			spawn_group = "default",
			use_fallback_spawners = true
		}
		call_position = BTSpawnAllies.find_spawn_point(unit, blackboard, dummy_action, data)
	end

	return call_position
end

BTEnterHooks.sorcerer_begin_defensive_mode = function (unit, blackboard, t)
	local data = {
		stay_still = true,
		end_time = math.huge
	}
	local call_position = setup_sorcerer_boss_spawning(unit, blackboard, data)
	blackboard.spawning_allies = data
	blackboard.quick_teleport_exit_pos = Vector3Box(call_position)
	blackboard.quick_teleport = true
	data.call_position = blackboard.quick_teleport_exit_pos
	blackboard.has_call_position = true
	blackboard.teleport_health_percent = blackboard.health_extension:current_health_percent() - 0.1
	blackboard.spell_count = 0
	blackboard.phase = "defensive_starts"
	local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input.trigger_networked_dialogue_event(dialogue_input, "ebh_summon", event_data)

	return 
end
BTEnterHooks.sorcerer_spawn_horde = function (unit, blackboard, t)
	local data = {
		stay_still = true,
		end_time = math.huge
	}

	setup_sorcerer_boss_spawning(unit, blackboard, data)

	blackboard.spawning_allies = data

	return 
end
BTEnterHooks.sorcerer_defensive_seeking_bomb = function (unit, blackboard, t)
	local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input.trigger_networked_dialogue_event(dialogue_input, "ebh_insect_spell", event_data)

	return 
end
BTEnterHooks.teleport_to_center = function (unit, blackboard, t)
	local level_analysis = Managers.state.conflict.level_analysis
	local node_units = level_analysis.generic_ai_node_units.sorcerer_boss_center
	local center_unit = node_units[1]
	local teleport_pos = Unit.local_position(center_unit, 0)

	if teleport_pos then
		blackboard.quick_teleport_exit_pos = Vector3Box(teleport_pos)
		blackboard.quick_teleport = true
		blackboard.move_pos = nil

		return 
	end

	return 
end
BTEnterHooks.summoning_starts = function (unit, blackboard, t)
	blackboard.is_summoning = true

	return 
end
BTEnterHooks.block_stagger_start = function (unit, blackboard, t)
	if blackboard.mode == "defensive" then
		local current_health_percent = blackboard.health_extension:current_health_percent()

		if current_health_percent < blackboard.teleport_health_percent then
			blackboard.teleport_health_percent = blackboard.health_extension:current_health_percent() - 0.05
			blackboard.escape_teleport = true
		end

		return 
	end

	if not blackboard.stagger_time_end then
		blackboard.stagger_time_end = t + blackboard.breed.max_chain_stagger_time
	elseif blackboard.stagger_time_end < t then
		blackboard.stagger_time_end = nil
		local unit_position = POSITION_LOOKUP[unit]
		local teleport_pos = ConflictUtils.get_spawn_pos_on_circle(blackboard.nav_world, unit_position, 15, 7, 15)

		if teleport_pos then
			blackboard.quick_teleport_exit_pos = Vector3Box(teleport_pos)
			blackboard.quick_teleport = true
			blackboard.move_pos = nil

			return 
		end
	end

	return 
end
BTEnterHooks.sorcerer_evade = function (unit, blackboard, t)
	blackboard.quick_teleport = true
	local difficulty = Managers.state.difficulty:get_difficulty()
	local composition_type = "sorcerer_boss_hit_extra"
	local spawner_event_id = "sorcerer_boss_minion"
	local conflict_director = Managers.state.conflict
	local strictly_not_close_to_players = true
	local silent = true
	local limit_spawners = nil

	conflict_director.horde_spawner:execute_event_horde(t, spawner_event_id, composition_type, limit_spawners, silent, nil, strictly_not_close_to_players)

	local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input.trigger_networked_dialogue_event(dialogue_input, "ebh_taunt", event_data)

	return 
end
BTEnterHooks.warlord_defensive_on_enter = function (unit, blackboard, t)
	local spawn_allies_positions = blackboard.spawn_allies_positions
	local self_position = POSITION_LOOKUP[unit]
	local furthest_distance = 0
	local wanted_pos = nil

	for i = 1, #spawn_allies_positions, 1 do
		local position = spawn_allies_positions[i]:unbox()
		local distance = Vector3.distance(self_position, position)

		if furthest_distance < distance then
			wanted_pos = position
			furthest_distance = distance
		end
	end

	blackboard.override_spawn_allies_call_position = Vector3Box(wanted_pos)

	return 
end
BTEnterHooks.keep_target = function (unit, blackboard, t)
	blackboard.keep_target = true

	return 
end

return 

BuffFunctionTemplates = BuffFunctionTemplates or {}

local function get_variable(path_to_movement_setting_to_modify, unit)
	fassert(#path_to_movement_setting_to_modify > 0, "movement_setting_exists needs at least a movement_setting_to_modify")

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local movement_value = movement_settings_table

	for _, movement_setting in ipairs(path_to_movement_setting_to_modify) do
		movement_value = movement_value[movement_setting]

		if not movement_value then
			break
		end
	end

	if movement_value then
		return movement_value
	else
		ferror("Variable does not exist in PlayerUnitMovementSettings")
	end
end

local function set_variable(path_to_movement_setting_to_modify, unit, value)
	local nr_of_settings = #path_to_movement_setting_to_modify

	fassert(nr_of_settings > 0, "movement_setting_exists needs at least a movement_setting_to_modify")

	local unit_movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local movement_value = unit_movement_settings_table
	local index = 1

	while nr_of_settings >= index do
		if nr_of_settings < index + 1 then
			movement_value[path_to_movement_setting_to_modify[index]] = value
		else
			movement_value = movement_value[path_to_movement_setting_to_modify[index]]
		end

		index = index + 1
	end
end

local clearable_params = {}
local broadphase_results = {}

local function is_local(unit)
	local player = Managers.player:owner(unit)

	return player and not player.remote
end

local function is_bot(unit)
	local player = Managers.player:owner(unit)

	return player and player.bot_player
end

local function is_server()
	return Managers.state.network.is_server
end

local function is_husk(unit)
	local player = Managers.player:owner(unit)
	local is_husk = (player and (player.remote or player.bot_player)) or false

	return is_husk
end

BuffFunctionTemplates.functions = {
	apply_action_lerp_movement_buff = function (unit, buff, params)
		local bonus = params.bonus
		local multiplier = params.multiplier

		if bonus then
			buff.current_lerped_value = 0
		end

		if multiplier then
			buff.current_lerped_multiplier = 1
		end
	end,
	update_action_lerp_movement_buff = function (unit, buff, params)
		local bonus = params.bonus
		local multiplier = params.multiplier
		local time_into_buff = params.time_into_buff
		local old_value_to_update_movement_setting, value_to_update_movement_setting, old_multiplier_to_update_movement_setting, multiplier_to_update_movement_setting = nil
		local percentage_in_lerp = math.min(1, time_into_buff / buff.template.lerp_time)

		if bonus then
			local new_value = math.lerp(0, bonus, percentage_in_lerp)
			old_value_to_update_movement_setting = buff.current_lerped_value
			buff.current_lerped_value = new_value
			value_to_update_movement_setting = new_value
		end

		if multiplier then
			local new_multiplier = math.lerp(1, multiplier, percentage_in_lerp)
			old_multiplier_to_update_movement_setting = buff.current_lerped_multiplier
			buff.current_lerped_multiplier = new_multiplier
			multiplier_to_update_movement_setting = new_multiplier
		end

		if value_to_update_movement_setting or multiplier_to_update_movement_setting then
			if buff.has_added_movement_previous_turn then
				buff_extension_function_params.value = old_value_to_update_movement_setting
				buff_extension_function_params.multiplier = old_multiplier_to_update_movement_setting

				BuffFunctionTemplates.functions.remove_movement_buff(unit, buff, buff_extension_function_params)
			end

			buff.has_added_movement_previous_turn = true
			buff_extension_function_params.value = value_to_update_movement_setting
			buff_extension_function_params.multiplier = multiplier_to_update_movement_setting

			BuffFunctionTemplates.functions.apply_movement_buff(unit, buff, buff_extension_function_params)
		end
	end,
	remove_action_lerp_movement_buff = function (unit, buff, params)
		local buff_extension = ScriptUnit.extension(unit, "buff_system")

		table.clear(clearable_params)

		clearable_params.external_optional_duration = nil
		clearable_params.external_optional_bonus = buff.current_lerped_value
		clearable_params.external_optional_multiplier = buff.current_lerped_multiplier

		buff_extension:add_buff(buff.template.remove_buff_name, clearable_params)
	end,
	apply_action_lerp_remove_movement_buff = function (unit, buff, params)
		local bonus = params.bonus
		local multiplier = params.multiplier

		if bonus then
			buff.current_lerped_value = bonus
		end

		if multiplier then
			buff.current_lerped_multiplier = multiplier
		end

		buff.last_frame_percentage = 1
	end,
	update_action_lerp_remove_movement_buff = function (unit, buff, params)
		local bonus = params.bonus
		local multiplier = params.multiplier
		local time_into_buff = params.time_into_buff
		local value_to_update_movement_setting, old_value_to_update_movement_setting, old_multiplier_to_update_movement_setting, multiplier_to_update_movement_setting = nil

		if buff.last_frame_percentage == 0 then
			return
		end

		local percentage_in_lerp = math.min(1, time_into_buff / buff.template.lerp_time)
		percentage_in_lerp = 1 - percentage_in_lerp
		buff.last_frame_percentage = percentage_in_lerp

		if bonus then
			local new_value = math.lerp(0, bonus, percentage_in_lerp)
			old_value_to_update_movement_setting = buff.current_lerped_value
			buff.current_lerped_value = new_value
			value_to_update_movement_setting = new_value
		end

		if multiplier then
			local new_multiplier = math.lerp(1, multiplier, percentage_in_lerp)
			old_multiplier_to_update_movement_setting = buff.current_lerped_multiplier
			buff.current_lerped_multiplier = new_multiplier
			multiplier_to_update_movement_setting = new_multiplier
		end

		if value_to_update_movement_setting or multiplier_to_update_movement_setting then
			buff_extension_function_params.value = old_value_to_update_movement_setting
			buff_extension_function_params.multiplier = old_multiplier_to_update_movement_setting

			BuffFunctionTemplates.functions.remove_movement_buff(unit, buff, buff_extension_function_params)

			if percentage_in_lerp > 0 then
				buff_extension_function_params.value = value_to_update_movement_setting
				buff_extension_function_params.multiplier = multiplier_to_update_movement_setting

				BuffFunctionTemplates.functions.apply_movement_buff(unit, buff, buff_extension_function_params)
			end
		end
	end,
	apply_movement_buff = function (unit, buff, params)
		local bonus = params.bonus
		local multiplier = params.multiplier

		if buff.template.wind_mutator then
			local wind_strength = Managers.weave:get_wind_strength()
			multiplier = multiplier[wind_strength]
		end

		local path_to_movement_setting_to_modify = buff.template.path_to_movement_setting_to_modify
		local movement_setting_value = get_variable(path_to_movement_setting_to_modify, unit)

		if bonus then
			movement_setting_value = movement_setting_value + bonus
		end

		if multiplier then
			movement_setting_value = movement_setting_value * multiplier
		end

		set_variable(path_to_movement_setting_to_modify, unit, movement_setting_value)
	end,
	remove_movement_buff = function (unit, buff, params)
		local bonus = params.bonus
		local multiplier = params.multiplier

		if buff.template.wind_mutator then
			local wind_strength = Managers.weave:get_wind_strength()
			multiplier = multiplier[wind_strength]
		end

		local path_to_movement_setting_to_modify = buff.template.path_to_movement_setting_to_modify
		local movement_setting_value = get_variable(path_to_movement_setting_to_modify, unit)

		if multiplier then
			movement_setting_value = movement_setting_value / multiplier
		end

		if bonus then
			movement_setting_value = movement_setting_value - bonus
		end

		set_variable(path_to_movement_setting_to_modify, unit, movement_setting_value)
	end,
	apply_ai_movement_buff = function (unit, buff, params)
		local blackboard = BLACKBOARDS[unit]
		local multiplier = params.multiplier

		if buff.template.wind_mutator then
			local wind_strength = Managers.weave:get_wind_strength()
			multiplier = multiplier[wind_strength]
		end

		local navigation_extension = blackboard.navigation_extension
		buff.id = navigation_extension:add_movement_modifier(multiplier)
	end,
	remove_ai_movement_buff = function (unit, buff, params)
		local blackboard = BLACKBOARDS[unit]
		local navigation_extension = blackboard.navigation_extension

		navigation_extension:remove_movement_modifier(buff.id)
	end,
	apply_screenspace_effect = function (unit, buff, params, world)
		local screenspace_effect_name = buff.template.screenspace_effect_name
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:create_screen_particles(screenspace_effect_name)
		end
	end,
	knock_down_bleed_start = function (unit, buff, params)
		buff.next_damage_time = params.t + buff.template.time_between_damage
	end,
	knock_down_bleed_update = function (unit, buff, params)
		if buff.next_damage_time < params.t then
			local buff_template = buff.template
			buff.next_damage_time = buff.next_damage_time + buff_template.time_between_damage
			local damage = buff_template.damage
			local damage_type = buff_template.damage_type

			DamageUtils.add_damage_network(unit, unit, damage, "full", damage_type, nil, Vector3(1, 0, 0), "knockdown_bleed")
		end
	end,
	temporary_health_degen_start = function (unit, buff, params)
		buff.next_damage_time = params.t + buff.template.time_between_damage
	end,
	temporary_health_degen_update = function (unit, buff, params)
		if buff.next_damage_time < params.t then
			local buff_template = buff.template
			buff.next_damage_time = buff.next_damage_time + buff_template.time_between_damage
			local damage = buff_template.damage
			local damage_type = buff_template.damage_type

			DamageUtils.add_damage_network(unit, unit, damage, "full", damage_type, nil, Vector3(1, 0, 0), "temporary_health_degen")
		end
	end,
	health_degen_start = function (unit, buff, params)
		buff.next_damage_time = params.t + buff.template.time_between_damage
	end,
	health_degen_update = function (unit, buff, params)
		if buff.next_damage_time < params.t then
			local buff_template = buff.template
			buff.next_damage_time = buff.next_damage_time + buff_template.time_between_damage
			local damage = buff_template.damage
			local damage_type = buff_template.damage_type

			DamageUtils.add_damage_network(unit, unit, damage, "full", damage_type, nil, Vector3(1, 0, 0), "health_degen")
		end
	end,
	convert_permanent_to_temporary_health = function (unit, buff, params)
		if Managers.state.network.is_server then
			local health_extension = ScriptUnit.has_extension(unit, "health_system")

			if health_extension then
				health_extension:convert_permanent_to_temporary_health()
			end
		end
	end,
	life_drain_update_no_kill = function (unit, buff, params)
		if buff.next_damage_time < params.t then
			local buff_template = buff.template
			buff.next_damage_time = buff.next_damage_time + buff_template.time_between_damage
			local damage = nil
			local health_extension = ScriptUnit.extension(unit, "health_system")
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local current_health = health_extension:current_health()
			local in_end_zone = status_extension:is_in_end_zone()

			if not in_end_zone and current_health > 1 then
				if current_health - buff_template.damage > 1 then
					damage = buff_template.damage
				else
					damage = current_health - 1
				end

				local damage_type = buff_template.damage_type

				DamageUtils.add_damage_network(unit, unit, damage, "full", damage_type, nil, Vector3(1, 0, 0), "life_drain")
			end
		end
	end,
	health_regen_all_start = function (unit, buff, params)
		if Managers.state.network.is_server then
			buff.next_heal_time = params.t + buff.template.time_between_heal
		end
	end,
	health_regen_all_update = function (unit, buff, params)
		if Managers.state.network.is_server and buff.next_heal_time < params.t then
			local buff_template = buff.template
			buff.next_heal_time = buff.next_heal_time + buff_template.time_between_heal
			local heal_amount = buff_template.heal
			local heal_type = buff_template.heal_type or "health_regen"
			local side = Managers.state.side.side_by_unit[unit]
			local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

			for i = 1, #player_and_bot_units, 1 do
				DamageUtils.heal_network(player_and_bot_units[i], unit, heal_amount, heal_type)
			end
		end
	end,
	health_regen_start = function (unit, buff, params)
		if Managers.state.network.is_server then
			buff.next_heal_time = params.t + buff.template.time_between_heal
		end
	end,
	health_regen_update = function (unit, buff, params)
		if Managers.state.network.is_server and buff.next_heal_time < params.t then
			local buff_template = buff.template
			buff.next_heal_time = buff.next_heal_time + buff_template.time_between_heal
			local heal_amount = buff_template.heal
			local heal_type = buff_template.heal_type or "health_regen"

			DamageUtils.heal_network(unit, unit, heal_amount, heal_type)
		end
	end,
	mutator_life_health_regeneration_start = function (unit, buff, params)
		if Managers.state.network.is_server then
			buff.next_buff_time = params.t + 5
			buff.health_regeneration_stack_ids = {}
		end
	end,
	mutator_life_health_regeneration_update = function (unit, buff, params)
		if Managers.state.network.is_server and buff.next_buff_time < params.t then
			local buff_template = buff.template
			buff.next_buff_time = buff.next_buff_time + 5
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

			if buff_extension then
				local num_stacks = #buff.health_regeneration_stack_ids

				if num_stacks < 3 then
					local id = buff_extension:add_buff("mutator_life_health_regeneration_stacks")
					buff.health_regeneration_stack_ids[num_stacks + 1] = id
				end
			end
		end
	end,
	remove_metal_mutator_gromril_armour = function (unit, buff, params)
		local buff_params = {
			attacker_unit = unit
		}
		local buff_ext = ScriptUnit.extension(unit, "buff_system")

		buff_ext:add_buff("metal_mutator_damage_boost", buff_params)
	end,
	start_blade_dance = function (unit, buff, params, world)
		params.next_tick_t = params.t + 0.5
		params.linked_effects = params.linked_effects or {}
		local network_manager = Managers.state.network
		local unit_id = network_manager:unit_game_object_id(unit)
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit
		local wwise_world = Managers.world:wwise_world(world)
		local fx = nil

		if unit == local_player_unit or (is_server() and is_bot(unit)) then
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
			local first_person_unit = first_person_extension.first_person_unit
			fx = World.create_particles(world, "fx/magic_wind_metal_blade_dance_01_1p", POSITION_LOOKUP[first_person_unit])

			World.link_particles(world, fx, first_person_unit, Unit.node(first_person_unit, "root_point"), Matrix4x4.identity(), "stop")
			WwiseWorld.trigger_event(wwise_world, "Play_wind_metal_gameplay_mutator_wind_loop")
		else
			WwiseUtils.trigger_unit_event(world, "Play_wind_metal_gameplay_mutator_wind_loop", unit, 0)

			fx = World.create_particles(world, "fx/magic_wind_metal_blade_dance_01", POSITION_LOOKUP[unit])

			World.link_particles(world, fx, unit, Unit.node(unit, "root_point"), Matrix4x4.identity(), "stop")
		end

		params.linked_effects[unit_id] = fx
	end,
	update_blade_dance = function (unit, buff, params)
		if params.next_tick_t <= params.t then
			params.next_tick_t = params.t + 0.5
			local area_damage_system = Managers.state.entity:system("area_damage_system")
			local position = POSITION_LOOKUP[unit] + Vector3(0, 0, 1)
			local rotation = Unit.local_rotation(unit, 0)

			area_damage_system:create_explosion(unit, position, rotation, "metal_mutator_blade_dance", 1, "undefined", 0, false)
		end
	end,
	remove_blade_dance = function (unit, buff, params, world)
		local unit_id = Managers.state.network:unit_game_object_id(unit)
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit
		local wwise_world = Managers.world:wwise_world(world)

		if unit == local_player_unit then
			WwiseWorld.trigger_event(wwise_world, "Stop_wind_metal_gameplay_mutator_wind_loop")
		else
			WwiseUtils.trigger_unit_event(world, "Stop_wind_metal_gameplay_mutator_wind_loop", unit, 0)
		end

		if params.linked_effects[unit_id] then
			World.destroy_particles(world, params.linked_effects[unit_id])

			params.linked_effects[unit_id] = nil
		end
	end,
	apply_beasts_totem_buff = function (unit, buff, params, world)
		if not buff.fx_id then
			local fx = World.create_particles(world, "fx/chr_beastmen_standard_bearer_buff_01", POSITION_LOOKUP[unit])
			buff.fx_id = fx

			World.link_particles(world, fx, unit, Unit.node(unit, "root_point"), Matrix4x4.identity(), "stop")
		end
	end,
	remove_beasts_totem_buff = function (unit, buff, params, world)
		if buff.fx_id then
			World.stop_spawning_particles(world, buff.fx_id)
		end
	end,
	apply_fire_mutator_bomb = function (unit, buff, params, world)
		params.linked_effects = params.linked_effects or {}
		local network_manager = Managers.state.network
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit

		if unit == local_player_unit then
			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			if first_person_extension then
				buff.screenspace_particle_id = first_person_extension:create_screen_particles("fx/screenspace_magic_wind_fire_01")
			end
		else
			local fx = World.create_particles(world, "fx/magic_wind_fire_timer_01", POSITION_LOOKUP[unit])
			local unit_id = network_manager:unit_game_object_id(unit)
			params.linked_effects[unit_id] = fx

			World.link_particles(world, fx, unit, Unit.node(unit, "root_point"), Matrix4x4.identity(), "stop")
		end
	end,
	update_fire_mutator_bomb = function (unit, buff, params, world)
		return
	end,
	remove_fire_mutator_bomb = function (unit, buff, params, world)
		local unit_id = Managers.state.network:unit_game_object_id(unit)

		if params.linked_effects[unit_id] then
			World.destroy_particles(world, params.linked_effects[unit_id])

			params.linked_effects[unit_id] = nil
		end

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:destroy_screen_particles(buff.screenspace_particle_id)
		end
	end,
	apply_mutator_life_poison_buff = function (unit, buff, params, world)
		local wind_settings = WindSettings.life
		local weave_manager = Managers.weave
		local wind_strength = weave_manager:get_wind_strength()
		local thorns_damage = wind_settings.thorns_damage[wind_strength]
	end,
	start_dot_damage = function (unit, buff, params)
		local random_mod_next_dot_time = 0.75 * buff.template.time_between_dot_damages + math.random() * 0.5 * buff.template.time_between_dot_damages
		buff.next_poison_damage_time = params.t + random_mod_next_dot_time

		if buff.template.start_flow_event then
			Unit.flow_event(unit, buff.template.start_flow_event)
		end

		if buff.template.damage_type == "burninating" then
			local attacker_unit = params.attacker_unit
			local attacker_buff_extension = attacker_unit and ScriptUnit.has_extension(attacker_unit, "buff_system")
			local target_buff_extension = ScriptUnit.has_extension(unit, "buff_system")

			if target_buff_extension and attacker_buff_extension and attacker_buff_extension:has_buff_type("sienna_unchained_burn_increases_damage_taken") then
				local buff_data = attacker_buff_extension:get_non_stacking_buff("sienna_unchained_burn_increases_damage_taken")

				table.clear(clearable_params)

				clearable_params.external_optional_multiplier = buff_data.multiplier
				clearable_params.external_optional_duration = buff.duration

				target_buff_extension:add_buff("increase_damage_recieved_while_burning", clearable_params)
			end
		end
	end,
	reapply_dot_damage = function (unit, buff, params)
		if buff.template.damage_type == "burninating" then
			local attacker_unit = params.attacker_unit
			local attacker_buff_extension = attacker_unit and ScriptUnit.has_extension(attacker_unit, "buff_system")
			local target_buff_extension = ScriptUnit.has_extension(unit, "buff_system")

			if target_buff_extension and attacker_buff_extension and attacker_buff_extension:has_buff_type("sienna_unchained_burn_increases_damage_taken") then
				local buff_data = attacker_buff_extension:get_non_stacking_buff("sienna_unchained_burn_increases_damage_taken")

				table.clear(clearable_params)

				clearable_params.external_optional_multiplier = buff_data.multiplier
				clearable_params.external_optional_duration = buff.duration

				target_buff_extension:add_buff("increase_damage_recieved_while_burning", clearable_params)
			end
		end
	end,
	apply_dot_damage = function (unit, buff, params)
		local t = params.t

		if buff.next_poison_damage_time < t then
			local health_extension = ScriptUnit.extension(unit, "health_system")

			if health_extension:is_alive() then
				local buff_template = buff.template
				local random_mod_next_dot_time = 0.75 * buff.template.time_between_dot_damages + math.random() * 0.5 * buff.template.time_between_dot_damages
				buff.next_poison_damage_time = buff.next_poison_damage_time + random_mod_next_dot_time

				if Managers.state.network.is_server then
					local attacker_unit = params.attacker_unit
					local source_attacker_unit = params.source_attacker_unit

					if Unit.alive(attacker_unit) then
						local target_unit = unit
						local hit_zone_name = buff.template.hit_zone or "full"
						local attack_direction = Vector3.down()
						local hit_ragdoll_actor = nil
						local damage_source = buff.damage_source or "dot_debuff"
						local power_level = buff.power_level or DefaultPowerLevel
						local damage_profile_name = buff_template.damage_profile or "default"
						local damage_profile = DamageProfileTemplates[damage_profile_name]
						local target_index = nil
						local boost_curve_multiplier = 0
						local is_critical_strike = false
						local can_damage = true
						local can_stagger = false
						local blocking = false
						local shield_breaking_hit = false
						local backstab_multiplier, first_hit, total_hits = nil

						DamageUtils.server_apply_hit(t, attacker_unit, target_unit, hit_zone_name, nil, attack_direction, hit_ragdoll_actor, damage_source, power_level, damage_profile, target_index, boost_curve_multiplier, is_critical_strike, can_damage, can_stagger, blocking, shield_breaking_hit, backstab_multiplier, first_hit, total_hits, source_attacker_unit)
					end
				end
			end

			if buff.template.sound_event and is_local(unit) then
				local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

				if first_person_extension then
					first_person_extension:play_hud_sound_event(buff.template.sound_event)
				end
			end
		end
	end,
	remove_dot_damage = function (unit, buff, params)
		local end_flow_event = buff.template.end_flow_event

		if end_flow_event then
			Unit.flow_event(unit, end_flow_event)
		end

		if not AiUtils.unit_alive(unit) then
			local death_flow_event = buff.template.death_flow_event

			if death_flow_event then
				Unit.flow_event(unit, death_flow_event)
			end
		end
	end,
	apply_moving_through_vomit = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]
		buff.damage = damage
		local breed = Unit.get_data(unit, "breed")
		buff.armor_type = breed.armor_category or 1
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.vomit_particle_id = first_person_extension:create_screen_particles("fx/screenspace_vomit_hit_onfeet")
		end

		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local liquid_extension = ScriptUnit.has_extension(attacker_unit, "area_damage_system")

			if liquid_extension then
				local source_unit = liquid_extension:get_source_attacker_unit()
				local source_breed = ALIVE[source_unit] and Unit.get_data(source_unit, "breed")
				buff.damage_source = (source_breed and source_breed.name) or "dot_debuff"
			end
		end

		buff.vomit_next_t = params.t + 0
	end,
	update_moving_through_vomit = function (unit, buff, params, world)
		local t = params.t
		local vomit_next_t = buff.vomit_next_t
		local buff_template = buff.template

		if vomit_next_t < t then
			if Managers.state.network.is_server then
				local health_extension = ScriptUnit.extension(unit, "health_system")

				if health_extension:is_alive() then
					local attacker_unit = (ALIVE[params.attacker_unit] and params.attacker_unit) or unit
					local armor_type = buff.armor_type
					local damage_type = buff_template.damage_type
					local damage = buff.damage[armor_type]
					local damage_source = buff.damage_source

					DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
				end
			end

			local fatigue_type = buff_template.fatigue_type
			local status_extension = ScriptUnit.has_extension(unit, "status_system")

			if status_extension then
				status_extension:add_fatigue_points(fatigue_type)
			end

			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local slowdown_buff_name = buff_template.slowdown_buff_name

			if slowdown_buff_name then
				buff_extension:add_buff(slowdown_buff_name, params)
			end

			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			if first_person_extension then
				first_person_extension:play_hud_sound_event("Play_player_damage_puke")
			end

			buff.vomit_next_t = t + buff_template.time_between_dot_damages
		end
	end,
	remove_moving_through_vomit = function (unit, buff, params, world)
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:stop_spawning_screen_particles(buff.vomit_particle_id)
		end
	end,
	apply_catacombs_corpse_pit = function (unit, buff, params, world)
		buff.next_tick = params.t + 0
	end,
	update_catacombs_corpse_pit = function (unit, buff, params, world)
		local t = params.t
		local next_tick = buff.next_tick
		local buff_template = buff.template

		if next_tick < t then
			local fatigue_type = buff_template.fatigue_type
			local status_extension = ScriptUnit.has_extension(unit, "status_system")

			if status_extension then
				status_extension:add_fatigue_points(fatigue_type)
			end

			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local slowdown_buff_name = buff_template.slowdown_buff_name

			if slowdown_buff_name then
				buff_extension:add_buff(slowdown_buff_name, params)
			end

			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			if first_person_extension then
				first_person_extension:play_hud_sound_event("Play_player_damage_puke")
			end

			buff.next_tick = t + buff_template.time_between_ticks
		end
	end,
	remove_catacombs_corpse_pit = function (unit, buff, params, world)
		return
	end,
	apply_moving_through_plague = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]
		buff.damage = damage
		local breed = Unit.get_data(unit, "breed")
		buff.armor_type = breed.armor_category or 1
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.plague_particle_id = first_person_extension:create_screen_particles("fx/screenspace_cemetery_plague_01")
		end

		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local liquid_extension = ScriptUnit.has_extension(attacker_unit, "area_damage_system")

			if liquid_extension then
				local source_unit = liquid_extension:get_source_attacker_unit()
				local source_breed = ALIVE[source_unit] and Unit.get_data(source_unit, "breed")
				buff.damage_source = (source_breed and source_breed.name) or "dot_debuff"
			end
		end

		buff.plague_next_t = params.t + 0
	end,
	update_moving_through_plague = function (unit, buff, params, world)
		local t = params.t
		local plague_next_t = buff.plague_next_t
		local buff_template = buff.template

		if plague_next_t < t then
			if Managers.state.network.is_server then
				local health_extension = ScriptUnit.extension(unit, "health_system")

				if health_extension:is_alive() then
					local attacker_unit = (ALIVE[params.attacker_unit] and params.attacker_unit) or unit
					local armor_type = buff.armor_type
					local damage_type = buff_template.damage_type
					local damage = buff.damage[armor_type]
					local damage_source = buff.damage_source

					DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
				end
			end

			local fatigue_type = buff_template.fatigue_type
			local status_extension = ScriptUnit.has_extension(unit, "status_system")

			if status_extension then
				status_extension:add_fatigue_points(fatigue_type)
			end

			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local slowdown_buff_name = buff_template.slowdown_buff_name

			if slowdown_buff_name then
				buff_extension:add_buff(slowdown_buff_name, params)
			end

			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			if first_person_extension then
				first_person_extension:play_hud_sound_event("Play_player_damage_puke")
			end

			buff.plague_next_t = t + buff_template.time_between_dot_damages
		end
	end,
	remove_moving_through_plague = function (unit, buff, params, world)
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:stop_spawning_screen_particles(buff.plague_particle_id)
		end
	end,
	apply_mutator_life_thorns_poison = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]
		buff.damage = damage
		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local liquid_extension = ScriptUnit.has_extension(attacker_unit, "area_damage_system")

			if liquid_extension then
				local source_unit = liquid_extension._source_unit
				local source_breed = ALIVE[source_unit] and Unit.get_data(source_unit, "breed")
				buff.damage_source = (source_breed and source_breed.name) or "dot_debuff"
			end
		end

		buff.poison_next_t = params.t + 0
	end,
	update_mutator_life_thorns_poison = function (unit, buff, params, world)
		local t = params.t
		local poison_next_t = buff.poison_next_t
		local buff_template = buff.template

		if poison_next_t < t then
			if Managers.state.network.is_server then
				local health_extension = ScriptUnit.extension(unit, "health_system")

				if health_extension:is_alive() then
					local attacker_unit = (ALIVE[params.attacker_unit] and params.attacker_unit) or unit
					local damage_type = buff_template.damage_type
					local damage = buff.damage
					local damage_source = buff.damage_source

					DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
				end
			end

			local fatigue_type = buff_template.fatigue_type
			local status_extension = ScriptUnit.has_extension(unit, "status_system")

			if status_extension then
				status_extension:add_fatigue_points(fatigue_type)
			end

			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local slowdown_buff_name = buff_template.slowdown_buff_name

			if slowdown_buff_name then
				buff_extension:add_buff(slowdown_buff_name, params)
			end

			buff.poison_next_t = t + buff_template.time_between_dot_damages
		end
	end,
	remove_mutator_life_thorns_poison = function (unit, buff, params, world)
		return
	end,
	apply_ai_movement_debuff = function (unit, buff, params, world)
		local ext = ScriptUnit.extension(unit, "ai_navigation_system")
		local modifier = buff.template.multiplier
		local id = ext:add_movement_modifier(modifier)
		buff.movement_modifier_id = id
	end,
	remove_ai_movement_debuff = function (unit, buff, params, world)
		local ext = ScriptUnit.extension(unit, "ai_navigation_system")

		ext:remove_movement_modifier(buff.movement_modifier_id)
	end,
	apply_chaos_zombie_explosion_in_face = function (unit, buff, params, world)
		local buff_template = buff.template
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.nurgle_particle_id_01 = first_person_extension:create_screen_particles("fx/screenspace_nurgle_explosion_01")
			buff.nurgle_particle_id_02 = first_person_extension:create_screen_particles("fx/screenspace_nurgle_explosion_02")
		end
	end,
	update_chaos_zombie_explosion_in_face = function (unit, buff, params, world)
		return
	end,
	remove_chaos_zombie_explosion_in_face = function (unit, buff, params, world)
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:stop_spawning_screen_particles(buff.nurgle_particle_id_01)
			first_person_extension:stop_spawning_screen_particles(buff.nurgle_particle_id_02)
		end
	end,
	apply_plague_wave_in_face = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]
		buff.damage = damage
		local breed = Unit.get_data(unit, "breed")
		buff.armor_type = breed.armor_category or 1
		local owner = Managers.player:owner(unit)
		local is_husk = owner.remote or owner.bot_player or false

		if is_husk then
			Unit.flow_event(unit, "impact_vomit")
		end

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.plague_wave_opaque_particle_id = first_person_extension:create_screen_particles("fx/screenspace_plague_wave_01")
			buff.plague_wave_particle_id = first_person_extension:create_screen_particles("fx/screenspace_plauge_wave_02")

			first_person_extension:play_hud_sound_event("Play_player_hit_puke")
		end

		local pushed_direction = nil
		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local source_breed = Unit.get_data(attacker_unit, "breed")
			buff.damage_source = (source_breed and source_breed.name) or "dot_debuff"
			local victim_position = POSITION_LOOKUP[unit]
			local attacker_position = POSITION_LOOKUP[attacker_unit]
			local to_victim = victim_position - attacker_position
			pushed_direction = Vector3.normalize(to_victim)
		else
			pushed_direction = Vector3.backward()
		end

		local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
		local push_speed = buff_template.push_speed
		local pushed_velocity = pushed_direction * push_speed

		locomotion_extension:add_external_velocity(pushed_velocity)

		buff.vomit_next_t = params.t
	end,
	remove_plague_wave_in_face = function (unit, buff, params, world)
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:stop_spawning_screen_particles(buff.plague_wave_particle_id)
			first_person_extension:stop_spawning_screen_particles(buff.plague_wave_opaque_particle_id)
		end
	end,
	apply_vermintide_in_face = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]
		buff.damage = damage
		local breed = Unit.get_data(unit, "breed")
		buff.armor_type = breed.armor_category or 1
		local pushed_direction = nil
		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local source_breed = Unit.get_data(attacker_unit, "breed")
			buff.damage_source = (source_breed and source_breed.name) or "dot_debuff"
			local victim_position = POSITION_LOOKUP[unit]
			local attacker_position = POSITION_LOOKUP[attacker_unit]
			local to_victim = victim_position - attacker_position
			pushed_direction = Vector3.normalize(to_victim)
		else
			pushed_direction = Vector3.backward()
		end

		local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
		local push_speed = buff_template.push_speed
		local pushed_velocity = pushed_direction * push_speed

		locomotion_extension:add_external_velocity(pushed_velocity)

		buff.vomit_next_t = params.t
	end,
	update_vermintide_in_face = function (unit, buff, params, world)
		local t = params.t
		local vomit_next_t = buff.vomit_next_t
		local buff_template = buff.template

		if vomit_next_t < t then
			if Managers.state.network.is_server then
				local health_extension = ScriptUnit.extension(unit, "health_system")

				if health_extension:is_alive() then
					local attacker_unit = params.attacker_unit
					attacker_unit = (Unit.alive(attacker_unit) and attacker_unit) or unit
					local armor_type = buff.armor_type
					local damage_type = buff_template.damage_type
					local damage = buff.damage[armor_type]
					local damage_source = buff.damage_source

					DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
				end
			end

			local fatigue_type = buff_template.fatigue_type
			local status_extension = ScriptUnit.has_extension(unit, "status_system")

			if status_extension then
				status_extension:add_fatigue_points(fatigue_type)
			end

			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local slowdown_buff_name = buff_template.slowdown_buff_name

			if slowdown_buff_name then
				buff_extension:add_buff(slowdown_buff_name, params)
			end

			buff.vomit_next_t = t + buff_template.time_between_dot_damages
		end
	end,
	remove_vermintide_in_face = function (unit, buff, params, world)
		return
	end,
	apply_vomit_in_face = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]
		buff.damage = damage
		local breed = Unit.get_data(unit, "breed")
		buff.armor_type = breed.armor_category or 1
		local owner = Managers.player:owner(unit)
		local is_husk = owner.remote or owner.bot_player or false

		if is_husk then
			Unit.flow_event(unit, "impact_vomit")
		end

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.vomit_opaque_particle_id = first_person_extension:create_screen_particles("fx/screenspace_vomit_hit_opaque")
			buff.vomit_particle_id = first_person_extension:create_screen_particles("fx/screenspace_vomit_hit_inface")

			first_person_extension:play_hud_sound_event("Play_player_hit_puke")
		end

		local pushed_direction = nil
		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local source_breed = Unit.get_data(attacker_unit, "breed")
			buff.damage_source = (source_breed and source_breed.name) or "dot_debuff"
			local victim_position = POSITION_LOOKUP[unit]
			local attacker_position = POSITION_LOOKUP[attacker_unit]
			local to_victim = victim_position - attacker_position
			pushed_direction = Vector3.normalize(to_victim)
		else
			pushed_direction = Vector3.backward()
		end

		local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
		local push_speed = buff_template.push_speed
		local pushed_velocity = pushed_direction * push_speed

		locomotion_extension:add_external_velocity(pushed_velocity)

		buff.vomit_next_t = params.t
	end,
	update_vomit_in_face = function (unit, buff, params, world)
		local t = params.t
		local vomit_next_t = buff.vomit_next_t
		local buff_template = buff.template

		if vomit_next_t < t then
			if Managers.state.network.is_server then
				local health_extension = ScriptUnit.extension(unit, "health_system")

				if health_extension:is_alive() then
					local attacker_unit = params.attacker_unit
					local attacker_unit = (Unit.alive(attacker_unit) and attacker_unit) or unit
					local armor_type = buff.armor_type
					local damage_type = buff_template.damage_type
					local damage = buff.damage[armor_type]
					local damage_source = buff.damage_source

					DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
				end
			end

			local fatigue_type = buff_template.fatigue_type
			local status_extension = ScriptUnit.has_extension(unit, "status_system")

			if status_extension then
				status_extension:add_fatigue_points(fatigue_type)
			end

			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local slowdown_buff_name = buff_template.slowdown_buff_name

			if slowdown_buff_name then
				buff_extension:add_buff(slowdown_buff_name, params)
			end

			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			if first_person_extension then
				first_person_extension:play_hud_sound_event("Play_player_damage_puke")
			end

			buff.vomit_next_t = t + buff_template.time_between_dot_damages
		end
	end,
	remove_vomit_in_face = function (unit, buff, params, world)
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:stop_spawning_screen_particles(buff.vomit_particle_id)
			first_person_extension:stop_spawning_screen_particles(buff.vomit_opaque_particle_id)
		end
	end,
	apply_vortex = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]
		buff.damage = damage
		local breed = Unit.get_data(unit, "breed")
		buff.armor_type = breed.armor_category or 1
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.vortex_particle_id = first_person_extension:create_screen_particles("fx/screenspace_poison_globe_impact")
		end

		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local is_enemy = DamageUtils.is_enemy(attacker_unit, unit)
			local attacker_breed = ALIVE[attacker_unit] and Unit.get_data(attacker_unit, "breed")
			local attacker_breed_name = attacker_breed and attacker_breed.name
			local damage_source = (is_enemy and attacker_breed_name) or "dot_debuff"
			buff.damage_source = damage_source
		end

		buff.vortex_next_t = params.t
	end,
	update_vortex = function (unit, buff, params, world)
		local t = params.t
		local vortex_next_t = buff.vortex_next_t
		local buff_template = buff.template

		if vortex_next_t < t then
			if Managers.state.network.is_server then
				local health_extension = ScriptUnit.extension(unit, "health_system")

				if health_extension:is_alive() then
					local attacker_unit = params.attacker_unit
					local attacker_unit = (Unit.alive(attacker_unit) and attacker_unit) or unit
					local armor_type = buff.armor_type
					local damage_type = buff_template.damage_type
					local damage = buff.damage[armor_type]
					local damage_source = buff.damage_source

					DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
				end
			end

			local fatigue_type = buff_template.fatigue_type
			local status_extension = ScriptUnit.has_extension(unit, "status_system")

			if status_extension then
				status_extension:add_fatigue_points(fatigue_type)
			end

			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local slowdown_buff_name = buff_template.slowdown_buff_name

			if slowdown_buff_name then
				buff_extension:add_buff(slowdown_buff_name, params)
			end

			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			if first_person_extension then
				first_person_extension:play_hud_sound_event("Play_player_damage_puke")
			end

			buff.vortex_next_t = t + buff_template.time_between_dot_damages
		end
	end,
	remove_vortex = function (unit, buff, params, world)
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:stop_spawning_screen_particles(buff.vortex_particle_id)
		end
	end,
	apply_moving_through_warpfire = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]
		buff.damage = damage
		local breed = Unit.get_data(unit, "breed")
		buff.armor_type = breed.armor_category or 1
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.warpfire_particle_id = first_person_extension:create_screen_particles("fx/screenspace_warpfire_hit_onfeet")
		end

		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local liquid_extension = ScriptUnit.extension(attacker_unit, "area_damage_system")
			local source_unit = liquid_extension:get_source_attacker_unit()
			local source_breed = ALIVE[source_unit] and Unit.get_data(source_unit, "breed")
			buff.damage_source = (source_breed and source_breed.name) or "dot_debuff"
		end

		buff.warpfire_next_t = params.t + 0.1
	end,
	update_moving_through_warpfire = function (unit, buff, params, world)
		local t = params.t
		local warpfire_next_t = buff.warpfire_next_t

		if warpfire_next_t < t then
			local buff_template = buff.template

			if Managers.state.network.is_server then
				local health_extension = ScriptUnit.extension(unit, "health_system")

				if health_extension:is_alive() then
					local attacker_unit = params.attacker_unit
					local attacker_unit = (Unit.alive(attacker_unit) and attacker_unit) or unit
					local armor_type = buff.armor_type
					local damage_type = buff_template.damage_type
					local damage = buff.damage[armor_type]
					local damage_source = buff.damage_source

					DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
				end
			end

			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			if first_person_extension then
				first_person_extension:play_hud_sound_event("Play_player_damage_puke")
			end

			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local slowdown_buff_name = buff_template.slowdown_buff_name

			if slowdown_buff_name then
				buff_extension:add_buff(slowdown_buff_name, params)
			end

			buff.warpfire_next_t = t + buff_template.time_between_dot_damages
		end
	end,
	update_heal_ticks = function (unit, buff, params, world)
		local t = params.t
		local buff_template = buff.template
		local next_heal_tick = buff.next_heal_tick or 0
		local health_extension = ScriptUnit.extension(unit, "health_system")

		if health_extension:current_permanent_health_percent() >= 1 then
			return
		end

		if next_heal_tick < t then
			if Managers.state.network.is_server then
				local heal_amount = buff_template.heal_amount

				if health_extension:is_alive() then
					DamageUtils.heal_network(unit, unit, heal_amount, "career_passive")
				end
			end

			buff.next_heal_tick = t + buff_template.time_between_heals
		end
	end,
	markus_huntsman_update_heal_ticks = function (unit, buff, params, world)
		local t = params.t
		local buff_template = buff.template
		local next_heal_tick = buff.next_heal_tick or 0
		local health_extension = ScriptUnit.extension(unit, "health_system")

		if health_extension:current_health_percent() == 1 then
			return
		end

		if next_heal_tick < t then
			if Managers.state.network.is_server then
				local heal_amount = buff_template.heal_amount

				if health_extension:is_alive() then
					DamageUtils.heal_network(unit, unit, heal_amount, "buff")
				end
			end

			buff.next_heal_tick = t + buff_template.time_between_heals
		end
	end,
	update_kerillian_waywatcher_regen = function (unit, buff, params, world)
		local t = params.t
		local buff_template = buff.template
		local next_heal_tick = buff.next_heal_tick or 0
		local regen_cap = 0.5

		if next_heal_tick < t and Unit.alive(unit) then
			local talent_extension = ScriptUnit.extension(unit, "talent_system")
			local cooldown_talent = talent_extension:has_talent("kerillian_waywatcher_passive_cooldown_restore", "wood_elf", true)

			if cooldown_talent then
				local cooldown_reduction = 0.05
				local career_extension = ScriptUnit.extension(unit, "career_system")

				career_extension:reduce_activated_ability_cooldown_percent(cooldown_reduction)
			end

			if Managers.state.network.is_server and not cooldown_talent then
				local health_extension = ScriptUnit.extension(unit, "health_system")
				local status_extension = ScriptUnit.extension(unit, "status_system")
				local heal_amount = buff_template.heal_amount

				if health_extension:is_alive() and not status_extension:is_knocked_down() and not status_extension:is_assisted_respawning() then
					if talent_extension:has_talent("kerillian_waywatcher_group_regen", "wood_elf", true) then
						local side = Managers.state.side.side_by_unit[unit]
						local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

						for i = 1, #player_and_bot_units, 1 do
							if Unit.alive(player_and_bot_units[i]) then
								local health_extension = ScriptUnit.extension(player_and_bot_units[i], "health_system")
								local status_extension = ScriptUnit.extension(player_and_bot_units[i], "status_system")

								if health_extension:current_permanent_health_percent() <= regen_cap and not status_extension:is_knocked_down() and not status_extension:is_assisted_respawning() and health_extension:is_alive() then
									DamageUtils.heal_network(player_and_bot_units[i], unit, heal_amount, "career_passive")
								end
							end
						end
					elseif health_extension:current_permanent_health_percent() <= regen_cap then
						if talent_extension:has_talent("kerillian_waywatcher_improved_regen", "wood_elf", true) then
							heal_amount = heal_amount * 1.5
						end

						DamageUtils.heal_network(unit, unit, heal_amount, "career_passive")
					end
				end
			end

			buff.next_heal_tick = t + buff_template.time_between_heals
		end
	end,
	remove_moving_through_warpfire = function (unit, buff, params, world)
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:stop_spawning_screen_particles(buff.warpfire_particle_id)
		end
	end,
	apply_warpfirethrower_in_face = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]
		buff.damage = damage
		local breed = Unit.get_data(unit, "breed")
		buff.armor_type = breed.armor_category or 1
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.warpfire_particle_id = first_person_extension:create_screen_particles("fx/screenspace_warpfire_flamethrower_01")
			buff.warpfire_particle_id_2 = first_person_extension:create_screen_particles("fx/screenspace_warpfire_hit_inface")

			first_person_extension:play_hud_sound_event("Play_player_hit_warpfire_thrower")
		end

		local pushed_direction = nil
		local attacker_unit = params.attacker_unit
		local distance = 0

		if ALIVE[attacker_unit] then
			local source_breed = Unit.get_data(attacker_unit, "breed")
			buff.damage_source = (source_breed and source_breed.name) or "dot_debuff"
			local victim_position = POSITION_LOOKUP[unit]
			local attacker_position = POSITION_LOOKUP[attacker_unit]
			local to_victim = victim_position - attacker_position
			pushed_direction = Vector3.normalize(to_victim)
			distance = Vector3.length(to_victim)
		else
			pushed_direction = Vector3.backward()
		end

		if breed.is_hero and first_person_extension then
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
			local status_extension = ScriptUnit.has_extension(unit, "status_system")
			local no_ranged_knockback = buff_extension and buff_extension:has_buff_perk("no_ranged_knockback")
			local is_valid_push_target = not no_ranged_knockback and not status_extension:is_disabled()

			if is_valid_push_target then
				local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
				local push_speed = buff_template.push_speed
				local pushed_velocity = pushed_direction * math.max(0, push_speed - distance)

				locomotion_extension:add_external_velocity(pushed_velocity)
			end
		end

		buff.warpfire_next_t = params.t
	end,
	update_warpfirethrower_in_face = function (unit, buff, params, world)
		local t = params.t
		local warpfire_next_t = buff.warpfire_next_t

		if warpfire_next_t < t then
			local buff_template = buff.template

			if Managers.state.network.is_server then
				local attacker_unit_is_alive = ALIVE[params.attacker_unit]
				local attacker_unit = (attacker_unit_is_alive and params.attacker_unit) or unit
				local health_extension = ScriptUnit.extension(unit, "health_system")

				if health_extension:is_alive() then
					local armor_type = buff.armor_type
					local damage_type = buff_template.damage_type
					local damage = buff.damage[armor_type]
					local damage_source = buff.damage_source

					DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
				end

				local is_ai_unit = DamageUtils.is_enemy(attacker_unit, unit)

				if attacker_unit_is_alive and is_ai_unit and not AiUtils.unit_alive(unit) then
					QuestSettings.check_num_enemies_killed_by_warpfire(unit, attacker_unit)
				end
			end

			buff.warpfire_next_t = t + buff_template.time_between_dot_damages
		end
	end,
	remove_warpfirethrower_in_face = function (unit, buff, params, world)
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:stop_spawning_screen_particles(buff.warpfire_particle_id)
			first_person_extension:stop_spawning_screen_particles(buff.warpfire_particle_id_2)
			first_person_extension:play_hud_sound_event("Stop_player_hit_warpfire_thrower")
		end
	end,
	apply_warpfire_in_face = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]
		buff.damage = damage
		local breed = Unit.get_data(unit, "breed")
		buff.armor_type = breed.armor_category or 1
		local owner = Managers.player:owner(unit)
		local is_husk = owner.remote or owner.bot_player or false

		if is_husk then
			Unit.flow_event(unit, "impact_warpfire")
		end

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.warpfire_particle_id = first_person_extension:create_screen_particles("fx/screenspace_warpfire_hit_inface")

			first_person_extension:play_hud_sound_event("Play_player_hit_warpfire_thrower")
		end

		local pushed_direction = nil
		local attacker_unit = params.attacker_unit

		if ALIVE[attacker_unit] then
			local source_breed = Unit.get_data(attacker_unit, "breed")
			buff.damage_source = (source_breed and source_breed.name) or "dot_debuff"
			local victim_position = POSITION_LOOKUP[unit]
			local attacker_position = POSITION_LOOKUP[attacker_unit]
			local to_victim = victim_position - attacker_position
			pushed_direction = Vector3.normalize(to_victim)
		else
			pushed_direction = Vector3.backward()
		end

		if first_person_extension then
			local hit_unit_buff_extension = ScriptUnit.has_extension(unit, "buff_system")
			local no_ranged_knockback = hit_unit_buff_extension and hit_unit_buff_extension:has_buff_perk("no_ranged_knockback")

			if not no_ranged_knockback then
				local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
				local push_speed = buff_template.push_speed
				local pushed_velocity = pushed_direction * push_speed

				locomotion_extension:add_external_velocity(pushed_velocity)
			end
		end

		buff.warpfire_next_t = params.t
	end,
	update_warpfire_in_face = function (unit, buff, params, world)
		local t = params.t
		local warpfire_next_t = buff.warpfire_next_t

		if warpfire_next_t < t then
			local buff_template = buff.template

			if Managers.state.network.is_server then
				local attacker_unit_is_alive = ALIVE[params.attacker_unit]
				local attacker_unit = (attacker_unit_is_alive and params.attacker_unit) or unit
				local health_extension = ScriptUnit.extension(unit, "health_system")

				if health_extension:is_alive() then
					local armor_type = buff.armor_type
					local damage_type = buff_template.damage_type
					local damage = buff.damage[armor_type]
					local damage_source = buff.damage_source

					DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
				end
			end

			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			if first_person_extension then
				first_person_extension:play_hud_sound_event("Play_player_damage_puke")
			end

			buff.warpfire_next_t = t + buff_template.time_between_dot_damages
		end
	end,
	remove_warpfire_in_face = function (unit, buff, params, world)
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:stop_spawning_screen_particles(buff.warpfire_particle_id)
			first_person_extension:play_hud_sound_event("Stop_player_hit_warpfire_thrower")
		end
	end,
	start_aoe_buff = function (unit, buff, params)
		local buff_template = buff.template

		if buff_template.target == "enemies" and Managers.state.network.is_server then
			table.clear(broadphase_results)

			local ai_system = Managers.state.entity:system("ai_system")
			local ai_broadphase = ai_system.broadphase
			local position = POSITION_LOOKUP[unit]
			local range = buff_template.range
			local num_enemies = Broadphase.query(ai_broadphase, position, range, broadphase_results)
			local buff_name = buff_template.buff

			for i = 1, num_enemies, 1 do
				local enemy_unit = broadphase_results[i]
				local buff_extension = ScriptUnit.has_extension(enemy_unit, "buff_system")

				if buff_extension then
					table.clear(clearable_params)

					clearable_params.attacker_unit = unit

					buff_extension:add_buff(buff_name, clearable_params)
				end
			end
		end

		buff.reapply_t = params.t + buff_template.reapply_rate
	end,
	reapply_aoe_buff = function (unit, buff, params)
		if buff.reapply_t <= params.t then
			local buff_template = buff.template

			if buff_template.target == "enemies" and Managers.state.network.is_server then
				table.clear(broadphase_results)

				local ai_system = Managers.state.entity:system("ai_system")
				local ai_broadphase = ai_system.broadphase
				local position = POSITION_LOOKUP[unit]
				local range = buff_template.range
				local num_enemies = Broadphase.query(ai_broadphase, position, range, broadphase_results)
				local buff_name = buff_template.buff

				for i = 1, num_enemies, 1 do
					local unit = broadphase_results[i]
					local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

					if buff_extension then
						table.clear(clearable_params)

						clearable_params.attacker_unit = unit

						buff_extension:add_buff(buff_name, clearable_params)
					end
				end
			end

			buff.reapply_t = params.t + buff_template.reapply_rate
		end
	end,
	remove_aoe_buff = function (unit, buff, params)
		return
	end,
	add_buff = function (unit, buff, params)
		local game = Managers.state.network:game()

		if not game then
			return
		end

		if Unit.alive(unit) then
			local template = buff.template
			local buff_name = template.buff_to_add
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
			local is_server = Managers.state.network.is_server
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local unit_object_id = network_manager:unit_game_object_id(unit)
			local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

			if unit_object_id then
				if is_server then
					buff_extension:add_buff(buff_name, {
						attacker_unit = unit
					})
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end
			end
		end
	end,
	kerillian_maidenguard_add_power_buff_on_unharmed = function (unit, buff, params)
		if not is_server() then
			return
		end

		local game = Managers.state.network:game()

		if not game then
			return
		end

		if Unit.alive(unit) then
			local template = buff.template
			local buff_name = template.buff_to_add
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:add_buff(unit, buff_name, unit, false)
		end
	end,
	update_multiplier_based_on_enemy_proximity = function (unit, buff, params)
		local ai_system = Managers.state.entity:system("ai_system")
		local ai_broadphase = ai_system.broadphase
		local template = buff.template
		local range = buff.range
		local min_multiplier = template.min_multiplier
		local max_multiplier = template.max_multiplier
		local chunk_size = template.chunk_size
		local stat_buff_index = template.stat_buff
		local previous_multiplier = buff.previous_multiplier or 0
		local own_position = POSITION_LOOKUP[unit]

		table.clear(broadphase_results)

		local num_nearby_enemies = Broadphase.query(ai_broadphase, own_position, range, broadphase_results)
		local num_alive_nearby_enemies = 0

		for i = 1, num_nearby_enemies, 1 do
			local enemy_unit = broadphase_results[i]
			local alive = ALIVE[enemy_unit] and ScriptUnit.extension(enemy_unit, "health_system"):is_alive()

			if alive then
				num_alive_nearby_enemies = num_alive_nearby_enemies + 1
			end
		end

		local num_chunks = math.floor(num_alive_nearby_enemies / chunk_size)
		local multiplier = num_chunks * min_multiplier

		if max_multiplier < multiplier then
			multiplier = max_multiplier
		end

		buff.multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_multiplier = multiplier
	end,
	update_bonus_based_on_enemy_proximity = function (unit, buff, params)
		local ai_system = Managers.state.entity:system("ai_system")
		local ai_broadphase = ai_system.broadphase
		local template = buff.template
		local range = buff.range
		local min_bonus = template.min_bonus
		local max_bonus = template.max_bonus
		local chunk_size = template.chunk_size
		local stat_buff_index = template.stat_buff
		local previous_bonus = buff.previous_bonus or 0
		local own_position = POSITION_LOOKUP[unit]

		table.clear(broadphase_results)

		local num_nearby_enemies = Broadphase.query(ai_broadphase, own_position, range, broadphase_results)
		local num_alive_nearby_enemies = 0

		for i = 1, num_nearby_enemies, 1 do
			local enemy_unit = broadphase_results[i]
			local alive = ALIVE[enemy_unit] and ScriptUnit.extension(enemy_unit, "health_system"):is_alive()

			if alive then
				num_alive_nearby_enemies = num_alive_nearby_enemies + 1
			end
		end

		local num_chunks = math.floor(num_alive_nearby_enemies / chunk_size)
		local bonus = num_chunks * min_bonus

		if max_bonus < bonus then
			bonus = max_bonus
		end

		buff.bonus = bonus

		if previous_bonus ~= bonus and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = bonus - previous_bonus

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_bonus = bonus
	end,
	activate_buff_stacks_based_on_enemy_proximity = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local ai_system = Managers.state.entity:system("ai_system")
		local ai_broadphase = ai_system.broadphase
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local buff_system = Managers.state.entity:system("buff_system")
		local template = buff.template
		local range = buff.range
		local chunk_size = template.chunk_size
		local buff_to_add = template.buff_to_add
		local max_stacks = 5
		local own_position = POSITION_LOOKUP[unit]
		local num_nearby_enemies = Broadphase.query(ai_broadphase, own_position, range, broadphase_results)
		local num_alive_nearby_enemies = 0

		for i = 1, num_nearby_enemies, 1 do
			local enemy_unit = broadphase_results[i]
			local alive = ALIVE[enemy_unit] and ScriptUnit.extension(enemy_unit, "health_system"):is_alive()

			if alive then
				num_alive_nearby_enemies = num_alive_nearby_enemies + 1

				if math.floor(num_alive_nearby_enemies / chunk_size) == max_stacks then
					break
				end
			end
		end

		if not buff.stack_ids then
			buff.stack_ids = {}
		end

		local num_chunks = math.floor(num_alive_nearby_enemies / chunk_size)
		local num_buff_stacks = buff_extension:num_buff_type(buff_to_add)

		if num_buff_stacks < num_chunks then
			local difference = num_chunks - num_buff_stacks

			for i = 1, difference, 1 do
				local buff_id = buff_system:add_buff(unit, buff_to_add, unit, true)
				local stack_ids = buff.stack_ids
				stack_ids[#stack_ids + 1] = buff_id
			end
		elseif num_chunks < num_buff_stacks then
			local difference = num_buff_stacks - num_chunks

			for i = 1, difference, 1 do
				local stack_ids = buff.stack_ids
				local buff_id = table.remove(stack_ids, 1)

				buff_system:remove_server_controlled_buff(unit, buff_id)
			end
		end
	end,
	activate_buff_stacks_based_on_ally_proximity = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local buff_system = Managers.state.entity:system("buff_system")
		local template = buff.template
		local range = buff.range
		local range_squared = range * range
		local chunk_size = template.chunk_size
		local buff_to_add = template.buff_to_add
		local max_stacks = buff.max_stacks
		local side = Managers.state.side.side_by_unit[unit]
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local own_position = POSITION_LOOKUP[unit]
		local num_nearby_allies = 0
		local allies = #player_and_bot_units

		for i = 1, allies, 1 do
			local ally_unit = player_and_bot_units[i]

			if ally_unit ~= unit then
				local ally_position = POSITION_LOOKUP[ally_unit]
				local distance_squared = Vector3.distance_squared(own_position, ally_position)

				if distance_squared < range_squared then
					num_nearby_allies = num_nearby_allies + 1
				end

				if math.floor(num_nearby_allies / chunk_size) == max_stacks then
					break
				end
			end
		end

		if not buff.stack_ids then
			buff.stack_ids = {}
		end

		local num_chunks = math.floor(num_nearby_allies / chunk_size)
		local num_buff_stacks = buff_extension:num_buff_type(buff_to_add)

		if num_buff_stacks < num_chunks then
			local difference = num_chunks - num_buff_stacks

			for i = 1, difference, 1 do
				local buff_id = buff_system:add_buff(unit, buff_to_add, unit, true)
				local stack_ids = buff.stack_ids
				stack_ids[#stack_ids + 1] = buff_id
			end
		elseif num_chunks < num_buff_stacks then
			local difference = num_buff_stacks - num_chunks

			for i = 1, difference, 1 do
				local stack_ids = buff.stack_ids
				local buff_id = table.remove(stack_ids, 1)

				buff_system:remove_server_controlled_buff(unit, buff_id)
			end
		end
	end,
	update_multiplier_based_on_enemy_proximity = function (unit, buff, params)
		local ai_system = Managers.state.entity:system("ai_system")
		local ai_broadphase = ai_system.broadphase
		local template = buff.template
		local range = buff.range
		local min_multiplier = template.min_multiplier
		local max_multiplier = template.max_multiplier
		local chunk_size = template.chunk_size
		local stat_buff_index = template.stat_buff
		local previous_multiplier = buff.previous_multiplier or 0
		local own_position = POSITION_LOOKUP[unit]

		table.clear(broadphase_results)

		local num_nearby_enemies = Broadphase.query(ai_broadphase, own_position, range, broadphase_results)
		local num_alive_nearby_enemies = 0

		for i = 1, num_nearby_enemies, 1 do
			local enemy_unit = broadphase_results[i]
			local alive = ALIVE[enemy_unit] and ScriptUnit.extension(enemy_unit, "health_system"):is_alive()

			if alive then
				num_alive_nearby_enemies = num_alive_nearby_enemies + 1
			end
		end

		local num_chunks = math.floor(num_alive_nearby_enemies / chunk_size)
		local multiplier = num_chunks * min_multiplier

		if max_multiplier < multiplier then
			multiplier = max_multiplier
		end

		buff.multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_multiplier = multiplier
	end,
	activate_buff_stacks_based_on_overcharge_chunks = function (unit, buff, params)
		if is_local(unit) then
			local overcharge_extension = ScriptUnit.extension(unit, "overcharge_system")
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local overcharge, threshold, max_overcharge = overcharge_extension:current_overcharge_status()
			local template = buff.template
			local chunk_size = template.chunk_size
			local buff_to_add = template.buff_to_add
			local max_stacks = template.max_stacks

			if not buff.stack_ids then
				buff.stack_ids = {}
			end

			local num_chunks = math.min(math.floor(overcharge / chunk_size), max_stacks)
			local num_buff_stacks = buff_extension:num_buff_type(buff_to_add)

			if num_buff_stacks < num_chunks then
				local difference = num_chunks - num_buff_stacks

				for i = 1, difference, 1 do
					local buff_id = buff_extension:add_buff(buff_to_add)
					local stack_ids = buff.stack_ids
					stack_ids[#stack_ids + 1] = buff_id
				end
			elseif num_chunks < num_buff_stacks then
				local difference = num_buff_stacks - num_chunks

				for i = 1, difference, 1 do
					local stack_ids = buff.stack_ids
					local buff_id = table.remove(stack_ids, 1)

					buff_extension:remove_buff(buff_id)
				end
			end
		end
	end,
	activate_server_buff_stacks_based_on_overcharge_chunks = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local overcharge_extension = ScriptUnit.extension(unit, "overcharge_system")
		local buff_system = Managers.state.entity:system("buff_system")
		local overcharge, _, _ = overcharge_extension:current_overcharge_status()
		local template = buff.template
		local chunk_size = template.chunk_size
		local buff_to_add = template.buff_to_add
		local max_stacks = 5

		if not buff.stack_server_ids then
			buff.stack_server_ids = {}
		end

		local stack_server_ids = buff.stack_server_ids
		local num_chunks = math.min(math.floor(overcharge / chunk_size), max_stacks)
		local num_buff_stacks = #buff.stack_server_ids

		if num_chunks > num_buff_stacks then
			local difference = num_chunks - num_buff_stacks

			for i = 1, difference, 1 do
				local server_buff_id = buff_system:add_buff(unit, buff_to_add, unit, true)
				stack_server_ids[#stack_server_ids + 1] = server_buff_id
			end
		elseif num_chunks < num_buff_stacks then
			local difference = num_buff_stacks - num_chunks

			for i = 1, difference, 1 do
				local server_buff_id = table.remove(stack_server_ids, 1)

				buff_system:remove_server_controlled_buff(unit, server_buff_id)
			end
		end
	end,
	activate_buff_stacks_based_on_health_chunks = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local health_extension = ScriptUnit.extension(unit, "health_system")
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local buff_system = Managers.state.entity:system("buff_system")
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local chunk_size = template.chunk_size
		local damage_taken = health_extension:get_damage_taken("uncursed_max_health")
		local uncursed_max_health = health_extension:get_uncursed_max_health()
		local max_stacks = math.min(math.floor(uncursed_max_health / chunk_size) - 1, template.max_stacks)
		local health_chunks = math.floor(damage_taken / chunk_size)
		local num_chunks = math.min(max_stacks, health_chunks)
		local num_buff_stacks = buff_extension:num_buff_type(buff_to_add)

		if not buff.stack_ids then
			buff.stack_ids = {}
		end

		if num_buff_stacks < num_chunks then
			local difference = num_chunks - num_buff_stacks

			for i = 1, difference, 1 do
				local buff_id = buff_system:add_buff(unit, buff_to_add, unit, true)
				local stack_ids = buff.stack_ids
				stack_ids[#stack_ids + 1] = buff_id
			end
		elseif num_chunks < num_buff_stacks then
			local difference = num_buff_stacks - num_chunks

			for i = 1, difference, 1 do
				local stack_ids = buff.stack_ids
				local buff_id = table.remove(stack_ids, 1)

				buff_system:remove_server_controlled_buff(unit, buff_id)
			end
		end
	end,
	victor_zealot_activate_buff_stacks_based_on_health_percent = function (unit, buff, params)
		if Unit.alive(unit) then
			local health_extension = ScriptUnit.extension(unit, "health_system")
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local buff_system = Managers.state.entity:system("buff_system")
			local template = buff.template
			local health_threshold_1 = template.threshold_1
			local health_threshold_2 = template.threshold_2
			local buffed_max_health = health_extension:get_buffed_max_health()
			local current_health = health_extension:current_permanent_health()
			local current_health_percent = current_health / buffed_max_health

			if not buff.stack_ids then
				buff.stack_ids = {}
			end

			if #buff.stack_ids > 0 and health_threshold_2 < current_health_percent then
				if #buff.stack_ids > 1 or health_threshold_1 < current_health_percent then
					local buff_id = table.remove(buff.stack_ids, 1)

					buff_system:remove_server_controlled_buff(unit, buff_id)
				end
			elseif current_health_percent < health_threshold_1 then
				local buff_to_add = template.buff_to_add
				local num_buff_stacks = buff_extension:num_buff_type(buff_to_add)
				local add_second_buff = false

				if current_health_percent < health_threshold_2 then
					add_second_buff = true
				end

				if num_buff_stacks < 1 or (add_second_buff and num_buff_stacks == 1) then
					local buff_id = buff_system:add_buff(unit, buff_to_add, unit, true)
					buff.stack_ids[#buff.stack_ids + 1] = buff_id
				end
			end
		end
	end,
	activate_buff_stacks_based_on_clip_size = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if Unit.alive(unit) then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local template = buff.template
			local buff_to_add = template.buff_to_add
			local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data("slot_ranged")
			local buff_system = Managers.state.entity:system("buff_system")
			local max_ammo = 1

			if slot_data then
				local item_template = BackendUtils.get_item_template(slot_data.item_data)
				local ammo_data = item_template and item_template.ammo_data
				local ammo_per_clip = ammo_data and ammo_data.ammo_per_clip

				if ammo_per_clip and max_ammo < ammo_per_clip then
					max_ammo = ammo_per_clip
				end

				local clip_size = max_ammo
				local max_stacks = clip_size
				local num_buff_stacks = buff_extension:num_buff_type(buff_to_add)

				if not buff.stack_ids then
					buff.stack_ids = {}
				end

				if num_buff_stacks < max_stacks then
					local difference = max_stacks - num_buff_stacks

					for i = 1, difference, 1 do
						local buff_id = buff_system:add_buff(unit, buff_to_add, unit, true)
						local stack_ids = buff.stack_ids
						stack_ids[#stack_ids + 1] = buff_id
					end
				elseif max_stacks < num_buff_stacks then
					local difference = num_buff_stacks - max_stacks

					for i = 1, difference, 1 do
						local stack_ids = buff.stack_ids
						local buff_id = table.remove(stack_ids, 1)

						buff_system:remove_server_controlled_buff(unit, buff_id)
					end
				end
			end
		end
	end,
	remove_buff_stacks_based_on_clip_size = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if Unit.alive(unit) then
			local template = buff.template
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
			local buff_system = Managers.state.entity:system("buff_system")
			local buff_to_add = template.buff_to_add
			local buff_stack_ids = buff.stack_ids

			if buff_extension:has_buff_type(buff_to_add) and buff_stack_ids then
				for i = 1, #buff_stack_ids, 1 do
					local buff_id = buff_stack_ids[i]

					buff_system:remove_server_controlled_buff(unit, buff_id)
				end

				buff.stack_ids = nil
			end
		end
	end,
	pause_activated_ability = function (unit, buff, params)
		if Unit.alive(unit) then
			local career_extension = ScriptUnit.has_extension(unit, "career_system")

			if career_extension then
				career_extension:start_activated_ability_cooldown()
				career_extension:set_activated_ability_cooldown_paused()
			end
		end
	end,
	unpause_activated_ability = function (unit, buff, params)
		if Unit.alive(unit) then
			local career_extension = ScriptUnit.has_extension(unit, "career_system")

			if career_extension then
				career_extension:set_activated_ability_cooldown_unpaused()
			end
		end
	end,
	activate_buff_on_distance = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local template = buff.template
		local range = buff.range
		local range_squared = range * range
		local owner_position = POSITION_LOOKUP[owner_unit]
		local buff_to_add = template.buff_to_add
		local buff_system = Managers.state.entity:system("buff_system")
		local side = Managers.state.side.side_by_unit[owner_unit]
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units

		for i = 1, num_units, 1 do
			local unit = player_and_bot_units[i]

			if Unit.alive(unit) then
				local unit_position = POSITION_LOOKUP[unit]
				local distance_squared = Vector3.distance_squared(owner_position, unit_position)
				local buff_extension = ScriptUnit.extension(unit, "buff_system")

				if range_squared < distance_squared then
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						local buff_id = buff.server_id

						if buff_id then
							buff_system:remove_server_controlled_buff(unit, buff_id)
						end
					end
				end

				if distance_squared < range_squared and not buff_extension:has_buff_type(buff_to_add) then
					local server_buff_id = buff_system:add_buff(unit, buff_to_add, owner_unit, true)
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						buff.server_id = server_buff_id
					end
				end
			end
		end
	end,
	update_ascending_descending_buff_stacks_on_time = function (owner_unit, buff, params)
		if not Unit.alive(owner_unit) then
			return
		end

		local t = params.t
		local template = buff.template
		local update_frequency = template.update_frequency

		if not buff.next_tick then
			buff.next_tick = t + update_frequency
			buff.ascending = true
			buff.buff_ids = {}
		end

		if buff.next_tick < t then
			local buff_system = Managers.state.entity:system("buff_system")
			local buff_to_add = template.buff_to_add
			local max_sub_buff_stacks = template.max_sub_buff_stacks

			if buff.ascending then
				buff.buff_ids[#buff.buff_ids + 1] = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)

				if max_sub_buff_stacks <= #buff.buff_ids then
					buff.ascending = false
				end

				buff.next_tick = t + update_frequency
			else
				local buff_to_remove = table.remove(buff.buff_ids, 1)

				buff_system:remove_server_controlled_buff(owner_unit, buff_to_remove)

				if #buff.buff_ids <= 1 then
					buff.ascending = true
				end

				buff.next_tick = t + update_frequency
			end
		end
	end,
	activate_buff_on_closest = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local template = buff.template
		local range = buff.range
		local range_squared = range * range
		local owner_position = POSITION_LOOKUP[owner_unit]
		local buff_to_add = template.buff_to_add
		local buff_system = Managers.state.entity:system("buff_system")
		local side = Managers.state.side.side_by_unit[owner_unit]
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local closest_player = nil

		for i = 1, num_units, 1 do
			local unit = player_and_bot_units[i]

			if Unit.alive(unit) then
				local unit_position = POSITION_LOOKUP[unit]
				local distance_squared = Vector3.distance_squared(owner_position, unit_position)
				local buff_extension = ScriptUnit.extension(unit, "buff_system")

				if closest_player_distance < distance_squared then
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						local buff_id = buff.server_id

						if buff_id then
							buff_system:remove_server_controlled_buff(unit, buff_id)
						end
					end
				end

				if distance_squared < range_squared and not buff_extension:has_buff_type(buff_to_add) then
					local server_buff_id = buff_system:add_buff(unit, buff_to_add, owner_unit, true)
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						buff.server_id = server_buff_id
					end
				end
			end
		end
	end,
	markus_knight_proximity_buff_update = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local template = buff.template
		local range = buff.range
		local range_squared = range * range
		local owner_position = POSITION_LOOKUP[owner_unit]
		local side = Managers.state.side.side_by_unit[owner_unit]
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
		local buff_to_add = "markus_knight_passive_defence_aura"
		local buff_system = Managers.state.entity:system("buff_system")
		local power_talent = talent_extension:has_talent("markus_knight_passive_power_increase")

		for i = 1, num_units, 1 do
			local unit = player_and_bot_units[i]

			if Unit.alive(unit) then
				local unit_position = POSITION_LOOKUP[unit]
				local distance_squared = Vector3.distance_squared(owner_position, unit_position)
				local buff_extension = ScriptUnit.extension(unit, "buff_system")

				if range_squared < distance_squared or power_talent then
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						local buff_id = buff.server_id

						if buff_id then
							buff_system:remove_server_controlled_buff(unit, buff_id)
						end
					end
				end

				if distance_squared < range_squared and not power_talent and not buff_extension:has_buff_type(buff_to_add) then
					local server_buff_id = buff_system:add_buff(unit, buff_to_add, owner_unit, true)
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						buff.server_id = server_buff_id
					end
				end
			end
		end
	end,
	markus_knight_movespeed_on_incapacitated_ally = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local side = Managers.state.side.side_by_unit[owner_unit]
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local buff_system = Managers.state.entity:system("buff_system")
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local disabled_allies = nil

		for i = 1, num_units, 1 do
			local unit = player_and_bot_units[i]
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local is_disabled = status_extension:is_disabled()

			if is_disabled then
				disabled_allies = true
			end
		end

		if buff_extension:has_buff_type(buff_to_add) then
			if not disabled_allies then
				local buff_id = buff.buff_id

				if buff_id then
					buff_system:remove_server_controlled_buff(owner_unit, buff_id)

					buff.buff_id = nil
				end
			end
		elseif disabled_allies then
			buff.buff_id = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)
		end
	end,
	kerillian_maidenguard_proximity_buff_update = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local template = buff.template
		local range = buff.range
		local range_squared = range * range
		local owner_position = POSITION_LOOKUP[owner_unit]
		local side = Managers.state.side.side_by_unit[owner_unit]
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local buff_to_add = "kerillian_maidenguard_passive_stamina_regen_buff"
		local buff_system = Managers.state.entity:system("buff_system")

		for i = 1, num_units, 1 do
			local unit = player_and_bot_units[i]

			if Unit.alive(unit) then
				local unit_position = POSITION_LOOKUP[unit]
				local distance_squared = Vector3.distance_squared(owner_position, unit_position)
				local buff_extension = ScriptUnit.extension(unit, "buff_system")

				if range_squared < distance_squared then
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						local buff_id = buff.server_id

						if buff_id then
							buff_system:remove_server_controlled_buff(unit, buff_id)
						end
					end
				end

				if distance_squared < range_squared and not buff_extension:has_buff_type(buff_to_add) then
					local server_buff_id = buff_system:add_buff(unit, buff_to_add, owner_unit, true)
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						buff.server_id = server_buff_id
					end
				end
			end
		end
	end,
	activate_buff_on_other_buff = function (unit, buff, params)
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local activation_buff = template.activation_buff
		local activate_on_missing = template.activate_on_missing
		local has_buff = buff_extension:get_non_stacking_buff(activation_buff)
		local apply_buff = (has_buff and not activate_on_missing) or (not has_buff and activate_on_missing)
		local applied_buff = buff_extension:get_non_stacking_buff(buff_to_add)

		if apply_buff then
			if not applied_buff then
				buff_extension:add_buff(buff_to_add)
			end
		elseif applied_buff then
			buff_extension:remove_buff(applied_buff.id)
		end
	end,
	activate_bonus_on_last_standing = function (unit, buff, params)
		local template = buff.template
		local activation_bonus = template.activation_bonus
		local stat_buff_index = template.stat_buff
		local side = Managers.state.side.side_by_unit[unit]
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local owner_unit = nil
		local targets = {}

		for i = 1, num_units, 1 do
			local unit = player_and_bot_units[i]
			targets[#targets + 1] = unit
		end

		local disabled_allies = {}

		for i = 1, #targets, 1 do
			local unit = targets[i]
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local is_disabled = status_extension:is_disabled()

			if is_disabled and unit == owner_unit then
				return
			elseif is_disabled and unit ~= owner_unit then
				disabled_allies[#disabled_allies + 1] = unit
			end
		end

		local previous_bonus = buff.previous_bonus or 0
		local bonus = 0

		if #disabled_allies == num_units - 1 then
			bonus = activation_bonus
		end

		buff.bonus = bonus

		if previous_bonus ~= bonus and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = bonus - previous_bonus

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_bonus = bonus
	end,
	activate_multiplier_on_last_standing = function (unit, buff, params)
		local template = buff.template
		local activation_multiplier = template.activation_multiplier
		local stat_buff_index = template.stat_buff
		local side = Managers.state.side.side_by_unit[unit]
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local owner_unit = nil
		local targets = {}

		for i = 1, num_units, 1 do
			local unit = player_and_bot_units[i]
			targets[#targets + 1] = unit
		end

		local disabled_allies = {}

		for i = 1, #targets, 1 do
			local unit = targets[i]

			if unit then
				local status_extension = ScriptUnit.extension(unit, "status_system")
				local is_disabled = status_extension:is_disabled()

				if is_disabled and unit == owner_unit then
					return
				elseif is_disabled and unit ~= owner_unit then
					disabled_allies[#disabled_allies + 1] = unit
				end
			end
		end

		local previous_multiplier = buff.previous_multiplier or 0
		local multiplier = 0

		if #disabled_allies == num_units - 1 then
			multiplier = activation_multiplier
		end

		buff.multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_multiplier = multiplier
	end,
	activate_buff_on_last_standing = function (unit, buff, params)
		local template = buff.template
		local side = Managers.state.side.side_by_unit[unit]
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local buff_to_add = template.buff_to_add
		local owner_unit = unit
		local targets = {}
		local local_player = is_local(owner_unit)

		for i = 1, num_units, 1 do
			local unit = player_and_bot_units[i]
			targets[#targets + 1] = unit
		end

		local disabled_allies = {}

		for i = 1, #targets, 1 do
			local target_unit = targets[i]

			if target_unit then
				local status_extension = ScriptUnit.has_extension(target_unit, "status_system")
				local is_disabled = not status_extension or status_extension:is_disabled()

				if is_disabled and target_unit == owner_unit then
					return
				elseif is_disabled and target_unit ~= owner_unit then
					disabled_allies[#disabled_allies + 1] = target_unit
				end
			end
		end

		local adding_buff = nil

		if #disabled_allies == num_units - 1 then
			adding_buff = true
		end

		local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

		if buff_extension then
			local buff_system = Managers.state.entity:system("buff_system")
			local buff = buff_extension:get_non_stacking_buff(buff_to_add)

			if not adding_buff and buff then
				if local_player then
					buff_extension:remove_buff(buff.id)
				else
					local server_id = buff.server_id

					buff_system:remove_server_controlled_buff(owner_unit, server_id)
				end
			elseif adding_buff and not buff then
				if local_player then
					buff_extension:add_buff(buff_to_add)
				else
					local server_buff_id = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						buff.server_id = server_buff_id
					end
				end
			end
		end
	end,
	activate_buff_on_health_percent = function (unit, buff, params)
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local owner_unit = unit
		local targets = {}
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local local_player = is_local(owner_unit)
		local activation_health = template.activation_health
		local activate_below = template.activate_below
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local health_percent = health_extension:current_health_percent()
		local adding_buff = nil

		if (health_percent < activation_health and activate_below) or (activation_health < health_percent and not activate_below) then
			adding_buff = true
		end

		local buff_system = Managers.state.entity:system("buff_system")
		local buff = buff_extension:get_non_stacking_buff(buff_to_add)

		if not adding_buff and buff then
			if local_player then
				buff_extension:remove_buff(buff.id)
			else
				local server_id = buff.server_id

				buff_system:remove_server_controlled_buff(owner_unit, server_id)
			end
		elseif adding_buff and not buff then
			if local_player then
				buff_extension:add_buff(buff_to_add)
			else
				local server_buff_id = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)
				local buff = buff_extension:get_non_stacking_buff(buff_to_add)

				if buff then
					buff.server_id = server_buff_id
				end
			end
		end
	end,
	activate_buff_on_disabled = function (unit, buff, params)
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local owner_unit = unit
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local local_player = is_local(owner_unit)
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local is_disabled = status_extension:is_disabled() or status_extension:is_in_vortex()
		local adding_buff = nil

		if is_disabled then
			adding_buff = true
		end

		local buff_system = Managers.state.entity:system("buff_system")
		local buff = buff_extension:get_non_stacking_buff(buff_to_add)

		if not adding_buff and buff then
			if local_player then
				buff_extension:remove_buff(buff.id)
			else
				local server_id = buff.server_id

				buff_system:remove_server_controlled_buff(owner_unit, server_id)
			end
		elseif adding_buff and not buff then
			if local_player then
				buff_extension:add_buff(buff_to_add)
			else
				local server_buff_id = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)
				local buff = buff_extension:get_non_stacking_buff(buff_to_add)

				if buff then
					buff.server_id = server_buff_id
				end
			end
		end
	end,
	activate_buff_on_no_ammo = function (unit, buff, params)
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local owner_unit = unit
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local local_player = is_local(owner_unit)
		local weapon_slot = "slot_ranged"
		local ammo_amount = buff.bonus
		local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
		local slot_data = inventory_extension:get_slot_data(weapon_slot)

		if slot_data then
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension
			local adding_buff = nil

			if ammo_extension then
				adding_buff = ammo_extension:total_ammo_fraction() == 0
			end

			local buff_system = Managers.state.entity:system("buff_system")
			local buff = buff_extension:get_non_stacking_buff(buff_to_add)

			if not adding_buff and buff then
				if local_player then
					buff_extension:remove_buff(buff.id)
				else
					local server_id = buff.server_id

					buff_system:remove_server_controlled_buff(owner_unit, server_id)
				end
			elseif adding_buff and not buff then
				if local_player then
					buff_extension:add_buff(buff_to_add)
				else
					local server_buff_id = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						buff.server_id = server_buff_id
					end
				end
			end
		end

		return false, 0
	end,
	activate_buff_on_grimoire_picked_up = function (unit, buff, params)
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local owner_unit = unit
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local local_player = is_local(owner_unit)
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local is_disabled = status_extension:is_disabled() or status_extension:is_in_vortex()
		local adding_buff = nil

		if buff_extension:has_buff_perk("skaven_grimoire") then
			adding_buff = true
		end

		local buff_system = Managers.state.entity:system("buff_system")
		local buff = buff_extension:get_non_stacking_buff(buff_to_add)

		if not adding_buff and buff then
			if local_player then
				buff_extension:remove_buff(buff.id)
			else
				local server_id = buff.server_id

				buff_system:remove_server_controlled_buff(owner_unit, server_id)
			end
		elseif adding_buff and not buff then
			if local_player then
				buff_extension:add_buff(buff_to_add)
			else
				local server_buff_id = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)
				local buff = buff_extension:get_non_stacking_buff(buff_to_add)

				if buff then
					buff.server_id = server_buff_id
				end
			end
		end
	end,
	activate_multiplier_on_disabled = function (unit, buff, params)
		local template = buff.template
		local activation_multiplier = template.activation_multiplier
		local stat_buff_index = template.stat_buff
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local is_disabled = status_extension:is_disabled() or status_extension:is_in_vortex()
		local previous_multiplier = buff.previous_multiplier or 0
		local multiplier = 0

		if is_disabled then
			multiplier = activation_multiplier
		end

		buff.multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_multiplier = multiplier
	end,
	activate_multiplier_on_wounded = function (unit, buff, params)
		local template = buff.template
		local activation_multiplier = template.activation_multiplier
		local stat_buff_index = template.stat_buff
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local is_wounded = status_extension:is_wounded()
		local previous_multiplier = buff.previous_multiplier or 0
		local multiplier = 0

		if is_wounded then
			multiplier = activation_multiplier
		end

		buff.multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_multiplier = multiplier
	end,
	activate_bonus_on_wounded = function (unit, buff, params)
		local template = buff.template
		local activation_bonus = template.activation_bonus or 0
		local stat_buff_index = template.stat_buff
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local is_wounded = status_extension:is_wounded()
		local previous_bonus = buff.previous_bonus or 0
		local bonus = 0

		if is_wounded then
			bonus = activation_bonus
		end

		buff.bonus = bonus

		if previous_bonus ~= bonus and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = bonus - previous_bonus

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_bonus = bonus
	end,
	bardin_slayer_passive_update = function (unit, buff, params)
		local ai_system = Managers.state.entity:system("ai_system")
		local ai_broadphase = ai_system.broadphase
		local template = buff.template
		local range = buff.range
		local base_multiplier = template.base_multiplier
		local stat_buff_index = template.stat_buff
		local previous_bonus = buff.previous_bonus or 0
		local own_position = POSITION_LOOKUP[unit]
		local talent_extension = ScriptUnit.extension(unit, "talent_system")

		table.clear(broadphase_results)

		local num_nearby_enemies = Broadphase.query(ai_broadphase, own_position, range, broadphase_results)
		local num_alive_nearby_enemies = 0

		for i = 1, num_nearby_enemies, 1 do
			local enemy_unit = broadphase_results[i]
			local alive = ALIVE[enemy_unit] and ScriptUnit.extension(enemy_unit, "health_system"):is_alive()

			if alive then
				num_alive_nearby_enemies = num_alive_nearby_enemies + 1
			end
		end

		local bonus = 0

		if talent_extension:has_talent("bardin_slayer_increased_passive_bonus", "dwarf_ranger", true) then
			base_multiplier = base_multiplier * 1.5
		end

		if talent_extension:has_talent("bardin_slayer_increased_activation_number", "dwarf_ranger", true) then
			if num_alive_nearby_enemies <= 2 then
				bonus = base_multiplier
			end
		elseif num_alive_nearby_enemies == 1 then
			bonus = base_multiplier
		end

		buff.bonus = bonus

		if previous_bonus ~= bonus and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = bonus - previous_bonus

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_bonus = bonus
	end,
	bardin_slayer_activate_buff_on_loadout = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if Unit.alive(unit) then
			local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")
			local melee_slot_data = inventory_extension:get_slot_data("slot_melee")
			local ranged_slot_data = inventory_extension:get_slot_data("slot_ranged")

			if melee_slot_data and ranged_slot_data then
				local template = buff.template
				local buff_type = template.buff_type
				local melee_slot_template = inventory_extension:get_item_template(melee_slot_data)
				local melee_slot_buff_type = melee_slot_template and melee_slot_template.buff_type
				local ranged_slot_template = inventory_extension:get_item_template(ranged_slot_data)
				local ranged_slot_buff_type = ranged_slot_template and ranged_slot_template.buff_type
				local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
				local buff_system = Managers.state.entity:system("buff_system")
				local buff_to_add = template.buff_to_add
				local has_buff = buff_extension:has_buff_type(buff_to_add)
				local add_buff = melee_slot_buff_type == buff_type and ranged_slot_buff_type == buff_type

				if not has_buff then
					if add_buff then
						buff.added_buff_id = buff_system:add_buff(unit, buff_to_add, unit, true)
					end
				elseif buff.added_buff_id and not add_buff then
					buff_system:remove_server_controlled_buff(unit, buff.added_buff_id)

					buff.added_buff_id = nil
				else
					return
				end
			end
		end
	end,
	bardin_slayer_remove_activate_buff_on_loadout = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if Unit.alive(unit) then
			local template = buff.template
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
			local buff_system = Managers.state.entity:system("buff_system")
			local buff_to_add = template.buff_to_add

			if buff_extension:has_buff_type(buff_to_add) and buff.added_buff_id then
				buff_system:remove_server_controlled_buff(unit, buff.added_buff_id)

				buff.added_buff_id = nil
			end
		end
	end,
	bardin_slayer_active_buff_on_charge_action = function (unit, buff, params)
		if Unit.alive(unit) then
			local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")
			local lh_weapon_unit, rh_weapon_unit = inventory_extension:get_all_weapon_unit()
			local lh_weapon_extension = lh_weapon_unit and ScriptUnit.has_extension(lh_weapon_unit, "weapon_system")
			local rh_weapon_extension = rh_weapon_unit and ScriptUnit.has_extension(rh_weapon_unit, "weapon_system")
			local add_buff_on_action_type = nil

			if lh_weapon_extension then
				local has_action = lh_weapon_extension:has_current_action()

				if has_action then
					local current_action_settings = lh_weapon_extension:get_current_action_settings()
					local current_action_type = current_action_settings.kind
					add_buff_on_action_type = current_action_type == "melee_start"
				end
			end

			if not add_buff_on_action_type and rh_weapon_extension then
				local has_action = rh_weapon_extension:has_current_action()

				if has_action then
					local current_action_settings = rh_weapon_extension:get_current_action_settings()
					local current_action_type = current_action_settings.kind
					add_buff_on_action_type = current_action_type == "melee_start"
				end
			end

			if add_buff_on_action_type then
				local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
				local template = buff.template
				local buff_name = template.buff_to_add
				local has_buff = buff_extension:has_buff_type(buff_name)

				if not has_buff then
					local network_manager = Managers.state.network
					local network_transmit = network_manager.network_transmit
					local unit_object_id = network_manager:unit_game_object_id(unit)
					local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

					if is_server() then
						buff_extension:add_buff(buff_name, {
							attacker_unit = unit
						})
						network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
					else
						network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
					end
				end
			end
		end
	end,
	activate_on_single_enemy = function (unit, buff, params)
		local ai_system = Managers.state.entity:system("ai_system")
		local ai_broadphase = ai_system.broadphase
		local template = buff.template
		local range = buff.range
		local base_multiplier = template.multiplier
		local stat_buff_index = template.stat_buff
		local previous_multiplier = buff.previous_multiplier or 0
		local own_position = POSITION_LOOKUP[unit]

		table.clear(broadphase_results)

		local num_nearby_enemies = Broadphase.query(ai_broadphase, own_position, range, broadphase_results)
		local num_alive_nearby_enemies = 0

		for i = 1, num_nearby_enemies, 1 do
			local enemy_unit = broadphase_results[i]
			local alive = ALIVE[enemy_unit] and ScriptUnit.extension(enemy_unit, "health_system"):is_alive()

			if alive then
				num_alive_nearby_enemies = num_alive_nearby_enemies + 1
			end
		end

		local multiplier = 0

		if num_alive_nearby_enemies == 1 then
			multiplier = base_multiplier
		end

		buff.multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_multiplier = multiplier
	end,
	activate_bonus_on_health_percent = function (unit, buff, params)
		local template = buff.template
		local activation_bonus = template.activation_bonus
		local activation_health = template.activation_health
		local activate_below = template.activate_below
		local stat_buff_index = template.stat_buff
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local health_percent = health_extension:current_health_percent()
		local previous_bonus = buff.previous_bonus or 0
		local bonus = 0

		if (health_percent < activation_health and activate_below) or (activation_health < health_percent and not activate_below) then
			bonus = activation_bonus
		end

		buff.previous_bonus = bonus

		if previous_bonus ~= bonus and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = bonus - previous_bonus

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_bonus = bonus
	end,
	activate_multiplier_on_health_percent = function (unit, buff, params)
		local template = buff.template
		local activation_multiplier = template.activation_multiplier
		local activation_health = template.activation_health
		local activate_below = template.activate_below
		local stat_buff_index = template.stat_buff
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local health_percent = health_extension:current_health_percent()
		local previous_multiplier = buff.previous_multiplier or 0
		local multiplier = 0

		if (health_percent < activation_health and activate_below) or (activation_health < health_percent and not activate_below) then
			multiplier = activation_multiplier
		end

		buff.previous_multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_multiplier = multiplier
	end,
	activate_bonus_on_ammo_percent = function (unit, buff, params)
		local template = buff.template
		local activation_bonus = template.activation_bonus
		local activation_ammo = template.activation_ammo
		local activate_below = template.activate_below
		local stat_buff_index = template.stat_buff
		local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")
		local bonus = 0
		local slot_data = inventory_extension:get_slot_data("slot_ranged")

		if slot_data then
			local left_unit_1p = slot_data.left_unit_1p
			local right_unit_1p = slot_data.right_unit_1p
			local ammo_extension = (ScriptUnit.has_extension(left_unit_1p, "ammo_system") and ScriptUnit.extension(left_unit_1p, "ammo_system")) or (ScriptUnit.has_extension(right_unit_1p, "ammo_system") and ScriptUnit.extension(right_unit_1p, "ammo_system"))
			local ammo_percent = ammo_extension:total_ammo_fraction()
			local previous_bonus = buff.previous_bonus or 0

			if (ammo_percent < activation_ammo and activate_below) or (activation_ammo < ammo_percent and not activate_below) then
				bonus = activation_bonus
			end
		end

		buff.previous_bonus = bonus

		if previous_bonus ~= bonus and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = bonus - previous_bonus

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_bonus = bonus
	end,
	activate_multiplier_on_ammo_percent = function (unit, buff, params)
		local template = buff.template
		local activation_multiplier = template.activation_multiplier
		local activation_ammo = template.activation_ammo
		local activate_below = template.activate_below
		local stat_buff_index = template.stat_buff
		local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")
		local multiplier = 0
		local slot_data = inventory_extension:get_slot_data("slot_ranged")

		if slot_data then
			local left_unit_1p = slot_data.left_unit_1p
			local right_unit_1p = slot_data.right_unit_1p
			local ammo_extension = (ScriptUnit.has_extension(left_unit_1p, "ammo_system") and ScriptUnit.extension(left_unit_1p, "ammo_system")) or (ScriptUnit.has_extension(right_unit_1p, "ammo_system") and ScriptUnit.extension(right_unit_1p, "ammo_system"))
			local ammo_percent = ammo_extension:total_ammo_fraction()
			local previous_multiplier = buff.previous_multiplier or 0

			if (ammo_percent < activation_ammo and activate_below) or (activation_ammo < ammo_percent and not activate_below) then
				multiplier = activation_multiplier
			end
		end

		buff.previous_multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_multiplier = multiplier
	end,
	activate_multiplier_on_grimoire_picked_up = function (unit, buff, params)
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local template = buff.template
		local activation_multiplier = template.activation_multiplier
		local stat_buff_index = template.stat_buff
		local previous_multiplier = buff.previous_multiplier or 0
		local multiplier = 0

		if buff_extension:has_buff_perk("skaven_grimoire") then
			multiplier = activation_multiplier
		end

		buff.previous_multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_multiplier = multiplier
	end,
	activate_bonus_on_grimoire_picked_up = function (unit, buff, params)
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local template = buff.template
		local activation_bonus = template.activation_bonus
		local stat_buff_index = template.stat_buff
		local previous_bonus = buff.previous_bonus or 0
		local bonus = 0

		if buff_extension:has_buff_perk("skaven_grimoire") then
			bonus = activation_bonus
		end

		buff.previous_bonus = bonus

		if previous_bonus ~= bonus and stat_buff_index then
			local difference = bonus - previous_bonus

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_bonus = bonus
	end,
	update_multiplier_based_on_missing_health = function (unit, buff, params)
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local damage_taken = health_extension:get_damage_taken()
		local template = buff.template
		local base_multiplier = template.base_multiplier
		local stat_buff_index = template.stat_buff
		local previous_multiplier = buff.previous_multiplier or 0
		local multiplier = damage_taken * base_multiplier
		buff.multiplier = multiplier

		if stat_buff_index and previous_multiplier ~= multiplier then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_multiplier = multiplier
	end,
	enter_sienna_unchained_activated_ability = function (unit, buff, params)
		local go_id = Managers.state.unit_storage:go_id(unit)
		local network_manager = Managers.state.network
		local game = network_manager:game()

		if not go_id or not game then
			return
		end

		local aim_direction = GameSession.game_object_field(game, go_id, "aim_direction")
		local nav_world = Managers.state.entity:system("ai_system"):nav_world()
		local unit_pos = POSITION_LOOKUP[unit]
		local above = 2
		local below = 30
		local projected_start_pos = LocomotionUtils.pos_on_mesh(nav_world, unit_pos, above, below)
		projected_start_pos = projected_start_pos or GwNavQueries.inside_position_from_outside_position(nav_world, unit_pos, above, below, 2, 0.5)

		if projected_start_pos then
			local liquid_template_name = "sienna_unchained_ability_patch"
			local liquid_template_id = NetworkLookup.liquid_area_damage_templates[liquid_template_name]
			local owner_unit_go_id = network_manager:unit_game_object_id(unit)

			network_manager.network_transmit:send_rpc_server("rpc_create_liquid_damage_area", owner_unit_go_id, projected_start_pos, aim_direction, liquid_template_id)
		end

		if is_local(unit) then
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			first_person_extension:play_hud_sound_event("Play_career_ability_sienna_unchained", nil, true)
		end
	end,
	end_sienna_adept_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			local career_extension = ScriptUnit.extension(unit, "career_system")
			local status_extension = ScriptUnit.extension(unit, "status_system")

			status_extension:set_invisible(false)
			status_extension:set_noclip(false)
			career_extension:set_state("default")
		end
	end,
	sienna_adept_double_trail_talent_start_ability_cooldown = function (unit, buff, params)
		if is_local(unit) then
			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:stop_ability("cooldown_triggered")
			career_extension:start_activated_ability_cooldown()
		end
	end,
	end_sienna_unchained_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:set_state("default")
		end
	end,
	apply_shade_activated_ability = function (unit, buff, params, world)
		if is_husk(unit) or (is_server() and is_bot(unit)) then
			Unit.flow_event(unit, "vfx_career_ability_start")
		end

		if is_local(unit) or (is_server() and is_bot(unit)) then
			local status_extension = ScriptUnit.has_extension(unit, "status_system")

			if status_extension then
				status_extension:add_shade_stealth_counter()
			end
		end
	end,
	end_shade_activated_ability = function (unit, buff, params, world)
		local status_extension = ScriptUnit.has_extension(unit, "status_system")

		if status_extension and status_extension:subtract_shade_stealth_counter() == 0 then
			if is_local(unit) then
				local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

				first_person_extension:play_hud_sound_event("Play_career_ability_kerillian_shade_exit")
				first_person_extension:play_hud_sound_event("Stop_career_ability_kerillian_shade_loop")

				local career_extension = ScriptUnit.extension(unit, "career_system")

				career_extension:set_state("default")

				MOOD_BLACKBOARD.skill_shade = false

				if Managers.state.network:game() then
					local status_extension = ScriptUnit.extension(unit, "status_system")

					status_extension:set_is_dodging(false)
				end
			end

			if is_local(unit) or (is_server() and is_bot(unit)) then
				local status_extension = ScriptUnit.extension(unit, "status_system")

				status_extension:set_invisible(false)
				status_extension:set_noclip(false)

				local events = {
					"Play_career_ability_kerillian_shade_exit",
					"Stop_career_ability_kerillian_shade_loop_husk"
				}
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local is_server = Managers.player.is_server
				local unit_id = network_manager:unit_game_object_id(unit)
				local node_id = 0

				for i = 1, #events, 1 do
					local event = events[i]
					local event_id = NetworkLookup.sound_events[event]

					if is_server then
						network_transmit:send_rpc_clients("rpc_play_husk_unit_sound_event", unit_id, node_id, event_id)
					else
						network_transmit:send_rpc_server("rpc_play_husk_unit_sound_event", unit_id, node_id, event_id)
					end
				end
			end
		end
	end,
	apply_huntsman_activated_ability = function (unit, buff, params)
		if is_husk(unit) or (is_server() and is_bot(unit)) then
			Unit.flow_event(unit, "vfx_career_ability_start")
		end
	end,
	end_huntsman_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			local career_extension = ScriptUnit.extension(unit, "career_system")
			local status_extension = ScriptUnit.extension(unit, "status_system")

			if status_extension:is_invisible() then
				MOOD_BLACKBOARD.skill_huntsman_stealth = false
			else
				MOOD_BLACKBOARD.skill_huntsman_surge = false
			end
		end

		if is_local(unit) or (is_server() and is_bot(unit)) then
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:set_state("default")

			if status_extension:is_invisible() then
				local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

				status_extension:set_invisible(false)
				first_person_extension:play_hud_sound_event("Play_career_ability_markus_huntsman_exit")
				first_person_extension:play_hud_sound_event("Stop_career_ability_markus_huntsman_loop")

				local events = {
					"Play_career_ability_markus_huntsman_exit",
					"Stop_career_ability_markus_huntsman_loop_husk"
				}
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local is_server = Managers.player.is_server
				local unit_id = network_manager:unit_game_object_id(unit)
				local node_id = 0

				for i = 1, #events, 1 do
					local event = events[i]
					local event_id = NetworkLookup.sound_events[event]

					if is_server then
						network_transmit:send_rpc_clients("rpc_play_husk_unit_sound_event", unit_id, node_id, event_id)
					else
						network_transmit:send_rpc_server("rpc_play_husk_unit_sound_event", unit_id, node_id, event_id)
					end
				end
			end

			career_extension:set_state("default")
		end
	end,
	end_slayer_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			local career_extension = ScriptUnit.extension(unit, "career_system")
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			status_extension:set_noclip(false)
			first_person_extension:play_hud_sound_event("Play_career_ability_bardin_slayer_exit")
			first_person_extension:play_remote_unit_sound_event("Play_career_ability_bardin_slayer_exit", unit, 0)
			first_person_extension:play_hud_sound_event("Stop_career_ability_bardin_slayer_loop")
			career_extension:set_state("default")

			MOOD_BLACKBOARD.skill_slayer = false
		end
	end,
	add_victor_zealot_invulnerability_cooldown = function (unit, buff, params)
		local player_unit = unit
		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

		if Unit.alive(player_unit) then
			buff_extension:add_buff("victor_zealot_invulnerability_cooldown")
		end
	end,
	end_zealot_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			local career_extension = ScriptUnit.extension(unit, "career_system")
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			status_extension:set_noclip(false)
			first_person_extension:play_hud_sound_event("Play_career_ability_victor_zealot_exit")
			first_person_extension:play_remote_unit_sound_event("Play_career_ability_victor_zealot_exit", unit, 0)
			first_person_extension:play_hud_sound_event("Stop_career_ability_victor_zealot_loop")
			career_extension:set_state("default")

			MOOD_BLACKBOARD.skill_zealot = false
		end
	end,
	update_bardin_ironbreaker_activated_ability = function (unit, buff, params)
		local time_between_vo = 3

		if is_local(unit) then
			if not params.next_vo_time then
				params.next_vo_time = params.t + time_between_vo
			elseif params.next_vo_time <= params.t then
				params.next_vo_time = params.t + time_between_vo
				local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
				local event_data = FrameTable.alloc_table()

				dialogue_input:trigger_networked_dialogue_event("activate_ability_taunt", event_data)
			end
		end
	end,
	end_bardin_ironbreaker_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			params.next_vo_time = nil
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			first_person_extension:play_hud_sound_event("Play_career_ability_bardin_ironbreaker_exit")
			first_person_extension:play_remote_unit_sound_event("Play_career_ability_bardin_ironbreaker_exit", unit, 0)
		end
	end,
	end_ranger_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			local career_extension = ScriptUnit.extension(unit, "career_system")
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			status_extension:set_invisible(false)
			first_person_extension:play_hud_sound_event("Play_career_ability_bardin_ranger_exit")
			first_person_extension:play_remote_unit_sound_event("Play_career_ability_bardin_ranger_exit", unit, 0)
			first_person_extension:play_hud_sound_event("Stop_career_ability_bardin_ranger_loop")
			career_extension:set_state("default")

			MOOD_BLACKBOARD.skill_ranger = false
		end
	end,
	start_maidenguard_activated_ability = function (unit, buff, params)
		if is_local(unit) and not is_bot(unit) then
			local fov_multiplier = 0.8
			local lerp_time = 0.2

			Managers.state.camera:set_additional_fov_multiplier_with_lerp_time(fov_multiplier, lerp_time)
		end
	end,
	end_maidenguard_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			if not is_bot(unit) then
				local fov_multiplier = 1
				local lerp_time = 0.5

				Managers.state.camera:set_additional_fov_multiplier_with_lerp_time(fov_multiplier, lerp_time)
			end

			local status_extension = ScriptUnit.extension(unit, "status_system")

			status_extension:set_invisible(false)
			status_extension:set_noclip(false)

			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:set_state("default")

			if Managers.state.network:game() then
				local status_extension = ScriptUnit.extension(unit, "status_system")

				status_extension:set_is_dodging(false)

				local network_manager = Managers.state.network
				local unit_id = network_manager:unit_game_object_id(unit)

				network_manager.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.dodging, false, unit_id, 0)
			end
		end
	end,
	end_knight_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			local status_extension = ScriptUnit.extension(unit, "status_system")

			status_extension:set_noclip(false)
		end
	end,
	start_activated_ability_cooldown = function (unit, buff, params)
		if is_local(unit) and buff.attacker_unit == unit then
			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:start_activated_ability_cooldown()
		end
	end,
	update_bonus_based_on_missing_health_chunks = function (unit, buff, params)
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local damage_taken = health_extension:get_damage_taken()
		local template = buff.template
		local min_bonus = template.min_bonus
		local max_bonus = template.max_bonus
		local chunk_size = template.chunk_size
		local stat_buff_index = template.stat_buff
		local previous_bonus = buff.previous_bonus or 0
		local num_chunks = math.floor(damage_taken / chunk_size)
		local bonus = num_chunks * min_bonus

		if max_bonus < bonus then
			bonus = max_bonus
		end

		buff.bonus = bonus

		if stat_buff_index and previous_bonus ~= bonus then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = bonus - previous_bonus

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_bonus = bonus
	end,
	update_multiplier_based_on_missing_health_chunks = function (unit, buff, params)
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local damage_taken = health_extension:get_damage_taken()
		local template = buff.template
		local min_multiplier = template.min_multiplier
		local max_multiplier = template.max_multiplier
		local chunk_size = template.chunk_size
		local stat_buff_index = template.stat_buff
		local previous_multiplier = buff.previous_multiplier or 0
		local num_chunks = math.floor(damage_taken / chunk_size)
		local multiplier = num_chunks * min_multiplier

		if max_multiplier < multiplier then
			multiplier = max_multiplier
		end

		buff.multiplier = multiplier

		if stat_buff_index and previous_multiplier ~= multiplier then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_multiplier = multiplier
	end,
	update_bonus_based_on_overcharge_chunks = function (unit, buff, params)
		if is_local(unit) then
			local overcharge_extension = ScriptUnit.extension(unit, "overcharge_system")
			local overcharge, threshold, max_overcharge = overcharge_extension:current_overcharge_status()
			local template = buff.template
			local min_bonus = template.min_bonus
			local max_bonus = template.max_bonus
			local chunk_size = template.chunk_size
			local stat_buff_index = template.stat_buff
			local previous_bonus = buff.previous_bonus or 0
			local num_chunks = math.floor(overcharge / chunk_size)
			local bonus = num_chunks * min_bonus

			if max_bonus < bonus then
				bonus = max_bonus
			end

			buff.bonus = bonus

			if stat_buff_index and previous_bonus ~= bonus then
				local buff_extension = ScriptUnit.extension(unit, "buff_system")
				local difference = bonus - previous_bonus

				buff_extension:update_stat_buff(stat_buff_index, difference)
			end

			buff.previous_bonus = bonus
		end
	end,
	update_multiplier_based_on_overcharge_chunks = function (unit, buff, params)
		if is_local(unit) then
			local overcharge_extension = ScriptUnit.extension(unit, "overcharge_system")
			local overcharge, threshold, max_overcharge = overcharge_extension:current_overcharge_status()
			local template = buff.template
			local min_multiplier = template.min_multiplier
			local max_multiplier = template.max_multiplier
			local chunk_size = template.chunk_size
			local stat_buff_index = template.stat_buff
			local previous_multiplier = buff.previous_multiplier or 0
			local num_chunks = math.floor(overcharge / chunk_size)
			local multiplier = math.clamp(num_chunks * min_multiplier, min_multiplier, max_multiplier)
			buff.multiplier = multiplier

			if stat_buff_index and previous_multiplier ~= multiplier then
				local buff_extension = ScriptUnit.extension(unit, "buff_system")
				local difference = multiplier - previous_multiplier

				buff_extension:update_stat_buff(stat_buff_index, difference)
			end

			buff.previous_multiplier = multiplier
		end
	end,
	apply_grenade_slow = function (unit, buff, params)
		if Managers.state.network.is_server then
			local ext = ScriptUnit.extension(unit, "ai_navigation_system")
			local id = ext:add_movement_modifier(0.2)
			buff.movement_modifier_id = id
		end
	end,
	remove_grenade_slow = function (unit, buff, params)
		if Managers.state.network.is_server then
			local ext = ScriptUnit.extension(unit, "ai_navigation_system")

			ext:remove_movement_modifier(buff.movement_modifier_id)
		end
	end,
	activate_bonus_based_on_low_health = function (unit, buff, params)
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local template = buff.template
		local damage_taken = health_extension:get_damage_taken()
		local max_health = health_extension:get_max_health()
		local activation_health = template.activation_health
		local multiplier = 0

		if max_health - damage_taken < activation_health * max_health then
			multiplier = template.multiplier
		end

		local stat_buff_index = template.stat_buff
		local previous_multiplier = buff.previous_multiplier or 0

		if stat_buff_index and previous_multiplier ~= multiplier then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_multiplier = multiplier
	end,
	reduce_cooldown_on_buff_removed = function (unit, buff, params)
		local multiplier = buff.multiplier
		local career_extension = ScriptUnit.has_extension(unit, "career_system")

		if career_extension then
			career_extension:reduce_activated_ability_cooldown_percent(multiplier)
		end
	end,
	apply_volume_dot_damage = function (unit, buff, params)
		buff.next_damage_time = params.t + params.bonus.time_between_damage
	end,
	update_volume_dot_damage = function (unit, buff, params)
		if buff.next_damage_time < params.t then
			local health_extension = ScriptUnit.extension(unit, "health_system")

			if health_extension:is_alive() then
				buff.next_damage_time = buff.next_damage_time + params.bonus.time_between_damage
				local damage = DamageUtils.calculate_damage(params.bonus.damage, unit, params.attacker_unit, "full", 1)

				DamageUtils.add_damage_network(unit, params.attacker_unit, damage, "full", buff.template.damage_type, nil, Vector3(1, 0, 0))
			end
		end
	end,
	apply_volume_movement_buff = function (unit, buff, params)
		local movement_settings = PlayerUnitMovementSettings.get_movement_settings_table(unit)
		movement_settings.move_speed = movement_settings.move_speed * params.multiplier
	end,
	remove_volume_movement_buff = function (unit, buff, params)
		local movement_settings = PlayerUnitMovementSettings.get_movement_settings_table(unit)
		movement_settings.move_speed = movement_settings.move_speed / params.multiplier
	end,
	apply_speed_scaled_dot_buff = function (unit, buff, params)
		if is_local(unit) then
			buff.next_damage_t = 0
		end
	end,
	update_speed_scaled_dot_buff = function (unit, buff, params)
		if is_local(unit) then
			local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
			local flat_velocity = Vector3.flat(locomotion_extension:current_velocity())
			local length = Vector3.length(flat_velocity)

			if length > 0.5 and buff.next_damage_t < params.t then
				local health_extension = ScriptUnit.extension(unit, "health_system")

				if health_extension:is_alive() then
					local template = buff.template
					local damage_type = template.damage_type
					local damage = template.damage

					DamageUtils.add_damage_network(unit, unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), "buff")

					buff.next_damage_t = params.t + template.damage_frequency
				end
			end
		end
	end,
	remove_speed_scaled_dot_buff = function (unit, buff, params)
		if is_local(unit) then
		end
	end,
	apply_twitch_invisibility_buff = function (unit, buff, params)
		if is_local(unit) or (is_server() and is_bot(unit)) then
			local status_extension = ScriptUnit.extension(unit, "status_system")

			status_extension:set_invisible(true)
			status_extension:set_noclip(true)
		end

		if is_local(unit) then
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			first_person_extension:play_hud_sound_event("Play_career_ability_kerillian_shade_enter")
			first_person_extension:play_hud_sound_event("Play_career_ability_kerillian_shade_loop")

			MOOD_BLACKBOARD.skill_shade = true
		end
	end,
	update_twitch_invisibility_buff = function (unit, buff, params)
		return
	end,
	remove_twitch_invisibility_buff = function (unit, buff, params)
		if is_local(unit) or (is_server() and is_bot(unit)) then
			local status_extension = ScriptUnit.extension(unit, "status_system")

			status_extension:set_invisible(false)
			status_extension:set_noclip(false)

			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			first_person_extension:play_hud_sound_event("Play_career_ability_kerillian_shade_exit")
			first_person_extension:play_hud_sound_event("Stop_career_ability_kerillian_shade_loop")

			MOOD_BLACKBOARD.skill_shade = false
		end
	end,
	apply_twitch_infinite_bombs = function (unit, buff, params)
		return
	end,
	update_twitch_infinite_bombs = function (unit, buff, params)
		if is_local(unit) then
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
			local career_extension = ScriptUnit.extension(unit, "career_system")
			local pickup_settings = AllPickups.frag_grenade_t1
			local slot_name = pickup_settings.slot_name
			local item_name = pickup_settings.item_name
			local slot_data = inventory_extension:get_slot_data(slot_name)
			local item_data = slot_data and slot_data.item_data

			if not slot_data or item_data.name ~= item_name then
				local extra_extension_init_data = {}
				local item_data = ItemMasterList[item_name]

				if slot_data then
					inventory_extension:destroy_slot(slot_name)
					inventory_extension:add_equipment(slot_name, item_data, nil, extra_extension_init_data)
				else
					inventory_extension:add_equipment(slot_name, item_data, nil, extra_extension_init_data)
				end

				local go_id = Managers.state.unit_storage:go_id(unit)
				local slot_id = NetworkLookup.equipment_slots[slot_name]
				local item_id = NetworkLookup.item_names[item_name]
				local weapon_skin_id = NetworkLookup.weapon_skins["n/a"]

				if is_server() then
					network_transmit:send_rpc_clients("rpc_add_equipment", go_id, slot_id, item_id, weapon_skin_id)
				else
					network_transmit:send_rpc_server("rpc_add_equipment", go_id, slot_id, item_id, weapon_skin_id)
				end

				local wielded_slot_name = inventory_extension:get_wielded_slot_name()

				if wielded_slot_name == slot_name then
					CharacterStateHelper.stop_weapon_actions(inventory_extension, "picked_up_object")
					CharacterStateHelper.stop_career_abilities(career_extension, "picked_up_object")
					inventory_extension:wield(slot_name)
				end
			end
		end
	end,
	remove_twitch_infinite_bombs = function (unit, buff, params)
		return
	end,
	apply_twitch_invincibility = function (unit, buff, params)
		if is_server() and Unit.alive(unit) then
			local health_extension = ScriptUnit.extension(unit, "health_system")
			health_extension.is_invincible = true
		end
	end,
	remove_twitch_invincibility = function (unit, buff, params)
		if is_server() and Unit.alive(unit) then
			local health_extension = ScriptUnit.extension(unit, "health_system")
			health_extension.is_invincible = false
		end
	end,
	apply_twitch_pulsating_waves = function (unit, buff, params)
		buff.next_pulse_t = params.t
	end,
	update_twitch_pulsating_waves = function (unit, buff, params, world)
		if is_server() and Unit.alive(unit) then
			local t = params.t

			if buff.next_pulse_t < t then
				local damage_source = "grenade_frag_01"
				local explosion_template = ExplosionTemplates.twitch_pulse_explosion
				local explosion_position = POSITION_LOOKUP[unit]

				DamageUtils.create_explosion(world, unit, explosion_position, Quaternion.identity(), explosion_template, 1, damage_source, true, false, unit, false)

				local attacker_unit_id = Managers.state.unit_storage:go_id(unit)
				local explosion_template_id = NetworkLookup.explosion_templates[explosion_template.name]
				local damage_source_id = NetworkLookup.damage_sources[damage_source]

				Managers.state.network.network_transmit:send_rpc_clients("rpc_create_explosion", attacker_unit_id, false, explosion_position, Quaternion.identity(), explosion_template_id, 1, damage_source_id, 0, false)

				buff.next_pulse_t = t + 2
			end
		end
	end
}

BuffFunctionTemplates.functions.update_charging_action_lerp_movement_buff = function (unit, buff, params)
	local multiplier = params.multiplier
	local time_into_buff = params.time_into_buff
	local old_value_to_update_movement_setting, old_multiplier_to_update_movement_setting, multiplier_to_update_movement_setting = nil
	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	multiplier = multiplier and 1 - buff_extension:apply_buffs_to_value(1 - multiplier, "increased_move_speed_while_aiming")
	local percentage_in_lerp = math.min(1, time_into_buff / buff.template.lerp_time)

	if multiplier then
		local new_multiplier = math.lerp(1, multiplier, percentage_in_lerp)
		local difference = new_multiplier - buff.current_lerped_multiplier

		if math.abs(difference) > 0.001 then
			old_multiplier_to_update_movement_setting = buff.current_lerped_multiplier
			buff.current_lerped_multiplier = new_multiplier
			multiplier_to_update_movement_setting = new_multiplier
		end
	end

	if multiplier_to_update_movement_setting then
		if buff.has_added_movement_previous_turn then
			buff_extension_function_params.value = old_value_to_update_movement_setting
			buff_extension_function_params.multiplier = old_multiplier_to_update_movement_setting

			BuffFunctionTemplates.functions.remove_movement_buff(unit, buff, buff_extension_function_params)
		end

		buff.has_added_movement_previous_turn = true
		buff_extension_function_params.multiplier = multiplier_to_update_movement_setting

		BuffFunctionTemplates.functions.apply_movement_buff(unit, buff, buff_extension_function_params)
	end
end

for _, dlc in pairs(DLCSettings) do
	local buff_function_templates = dlc.buff_function_templates

	if buff_function_templates then
		for name, buff_function in pairs(buff_function_templates) do
			BuffFunctionTemplates.functions[name] = buff_function
		end
	end
end

return

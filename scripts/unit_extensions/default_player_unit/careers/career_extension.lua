CareerExtension = class(CareerExtension)
CareerExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self.world = extension_init_context.world
	self.is_server = Managers.player.is_server
	self.player = extension_init_data.player
	self._is_ready = false
	self.input_manager = Managers.input
	local profile_index = extension_init_data.profile_index
	local career_index = extension_init_data.career_index
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	self._profile_index = profile_index
	self._career_index = career_index
	self._career_name = career_data.name
	self._profile_name = profile.display_name
	self._cooldown = 0
	self._career_data = career_data

	if career_data.activated_ability.ability_class then
		self._activated_ability = career_data.activated_ability.ability_class:new(extension_init_context, unit, extension_init_data)
	end

	return 
end
CareerExtension.extensions_ready = function (self, world, unit)
	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	local passive_ability_data = self._career_data.passive_ability
	local buffs = passive_ability_data.buffs
	local player = self.player

	if buffs and (self.is_server or player.local_player) and not player.bot_player then
		for i = 1, #buffs, 1 do
			local buff = buffs[i]

			buff_extension.add_buff(buff_extension, buff)
		end
	end

	self.start_activated_ability_cooldown(self)

	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")

	if self._activated_ability then
		self._activated_ability:extensions_ready(world, unit)
	end

	return 
end
CareerExtension.update = function (self, unit, input, dt, context, t)
	local aoe_data = self._aoe_data

	if aoe_data then
		aoe_data.duration_left = math.max(aoe_data.duration_left - dt, 0)

		if aoe_data.duration_left <= 0 or not self.is_in_aoe(self, POSITION_LOOKUP[unit]) then
			ProcFunctions[aoe_data.end_function_name](self.player)

			self._aoe_data = nil
		end
	end

	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	local cooldown_speed_multiplier = buff_extension.apply_buffs_to_value(buff_extension, 1, StatBuffIndex.COOLDOWN_REGEN)
	self._cooldown = math.max(self._cooldown - dt*cooldown_speed_multiplier, 0)

	if self._is_ready then
		if self._activated_ability and self.player.local_player and not self.player.bot_player then
			self._activated_ability:update(unit, input, dt, context, t)
		end

		return 
	elseif self._cooldown == 0 then
		self._is_ready = true
		local first_person_extension = self._first_person_extension

		if first_person_extension then
			first_person_extension.play_hud_sound_event(first_person_extension, "Play_hud_ability_ready")
		end
	end

	return 
end
CareerExtension.destroy = function (self)
	return 
end
CareerExtension.get_activated_ability_data = function (self)
	local career_data = self._career_data
	local activated_ability_data = career_data.activated_ability

	return activated_ability_data
end
CareerExtension.start_activated_ability_cooldown = function (self, refund_percent)
	self._is_ready = false
	local activated_ability_data = self.get_activated_ability_data(self)
	local cooldown = activated_ability_data.cooldown
	self._max_cooldown = activated_ability_data.cooldown
	local buff_extension = ScriptUnit.extension(self._unit, "buff_system")
	local cooldown = buff_extension.apply_buffs_to_value(buff_extension, cooldown, StatBuffIndex.ACTIVATED_COOLDOWN)

	if Development.parameter("short_ability_cooldowns") then
		cooldown = 5
	end

	self._cooldown = cooldown*((refund_percent or 0) - 1)
	self._cooldown_paused = false
	local first_person_extension = self._first_person_extension

	return 
end
CareerExtension.reduce_activated_ability_cooldown = function (self, amount)
	self._cooldown = self._cooldown - amount

	return 
end
CareerExtension.set_activated_ability_cooldown_paused = function (self)
	self._cooldown_paused = true

	return 
end
CareerExtension.can_use_activated_ability = function (self)
	return self._is_ready and not self._cooldown_paused
end
CareerExtension.current_ability_cooldown = function (self)
	return self._cooldown, self._max_cooldown
end
CareerExtension.current_ability_paused = function (self)
	return self._cooldown_paused
end
CareerExtension.career_index = function (self)
	return self._career_index
end
CareerExtension.career_name = function (self)
	return self._career_name
end
CareerExtension.career_settings = function (self)
	return self._career_data
end
CareerExtension.career_skill_weapon_name = function (self)
	return self.get_activated_ability_data(self).weapon_name
end
CareerExtension.get_base_critical_strike_chance = function (self)
	return self._career_data.attributes.base_critical_strike_chance or 0
end
CareerExtension.create_aoe = function (self, position, radius, duration, end_function_name)
	self._aoe_data = {
		position = Vector3Box(position),
		radius_squared = radius*radius,
		duration_left = duration,
		end_function_name = end_function_name
	}

	return 
end
CareerExtension.is_in_aoe = function (self, position)
	if not self._aoe_data then
		return false
	end

	local distance = Vector3.length_squared(position - self._aoe_data.position:unbox())
	local within_distance = distance <= self._aoe_data.radius_squared

	return within_distance
end
CareerExtension.has_melee_boost = function (self)
	local buff_extension = self._buff_extension
	local has_buff = buff_extension.has_buff_type(buff_extension, "kerillian_shade_activated_ability") or buff_extension.has_buff_type(buff_extension, "kerillian_shade_activated_ability_duration") or buff_extension.has_buff_type(buff_extension, "markus_huntsman_activated_ability")
	local multiplier = (has_buff and 5) or 1

	return has_buff, multiplier
end
CareerExtension.has_ranged_boost = function (self)
	local buff_extension = self._buff_extension
	local has_buff = buff_extension.has_buff_type(buff_extension, "markus_huntsman_activated_ability")
	local multiplier = (has_buff and 5) or 1

	return has_buff, multiplier
end
CareerExtension.get_career_power_level = function (self)
	return BackendUtils.get_total_power_level(self._profile_name, self._career_name)
end
CareerExtension.set_state = function (self, state)
	self._state = state

	return 
end
CareerExtension.get_state = function (self)
	return self._state or "default"
end

return 

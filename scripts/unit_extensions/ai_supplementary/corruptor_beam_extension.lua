CorruptorBeamExtension = class(CorruptorBeamExtension)
local position_lookup = POSITION_LOOKUP
CorruptorBeamExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	self.world = world
	self.unit = unit
	self.is_server = Managers.player.is_server
	self.state = "no_state"
	self.projectile_speed = 25
	self.projectile_unit_name = "units/hub_elements/empty"
	self.projectile_effect_name = "fx/chr_corruptor_projectile"
	self.beam_effect_name = "fx/chr_corruptor_beam"
	self.beam_effect_name_start = "fx/chr_corruptor_in"
	self.beam_effect_name_end = "fx/chr_corruptor_out"
	self.projectile_sound = "Play_enemy_corruptor_sorcerer_throw_magic"
	self.stop_projectile_sound = "Stop_enemy_corruptor_sorcerer_throw_magic"
	self.beam_start_sound = "Play_enemy_corruptor_sorcerer_sucking_magic"
	self.stop_beam_start_sound = "Stop_enemy_corruptor_sorcerer_sucking_magic"
	self.beam_end_sound = "Play_enemy_corruptor_sorcerer_pull_magic"
	self.stop_beam_end_sound = "Stop_enemy_corruptor_sorcerer_pull_magic"

	return 
end
CorruptorBeamExtension.destroy = function (self)
	self.remove_vfx_and_sfx(self)

	return 
end
CorruptorBeamExtension.remove_vfx_and_sfx = function (self)
	local world = self.world
	local target_unit = self.target_unit

	if target_unit then
		WwiseUtils.trigger_unit_event(world, self.stop_beam_start_sound, self.unit, Unit.node(self.unit, "a_voice"))
		WwiseUtils.trigger_unit_event(world, self.stop_beam_end_sound, target_unit, Unit.node(target_unit, "j_neck"))
	end

	if self.projectile_unit then
		World.destroy_unit(world, self.projectile_unit)

		self.projectile_unit = nil
	end

	if self.beam_effect then
		World.destroy_particles(world, self.beam_effect)

		self.target_unit = nil
		self.beam_effect = nil
	end

	if self.beam_effect_start then
		World.stop_spawning_particles(world, self.beam_effect_start)
		World.stop_spawning_particles(world, self.beam_effect_end)
	end

	self.state = nil
	self.projectile_position = nil

	return 
end
CorruptorBeamExtension.set_state = function (self, state, target_unit)
	if not target_unit then
		print("Corruptor beam tried to set state to nil target unit")

		return 
	end

	local target_position = position_lookup[target_unit] + Vector3.up()
	local self_pos = position_lookup[self.unit] + Vector3.up()
	local world = self.world

	if state == "projectile" then
		self.beam_effect = World.create_particles(world, self.beam_effect_name, self_pos)
		self.beam_effect_variable_id = World.find_particles_variable(world, self.beam_effect_name, "trail_length")
		local projectile_unit = World.spawn_unit(world, self.projectile_unit_name, self_pos, Quaternion.identity())
		local pose = Matrix4x4.identity()
		self.projectile_effect = World.create_particles(world, self.projectile_effect_name, self_pos)
		self.state = state
		self.target_unit = target_unit

		World.link_particles(world, self.projectile_effect, projectile_unit, 0, pose, "stop")

		self.projectile_unit = projectile_unit

		WwiseUtils.trigger_unit_event(world, self.projectile_sound, projectile_unit, 0)
	elseif state == "start_beam" then
		self.beam_effect_start = World.create_particles(world, self.beam_effect_name_start, self_pos)
		self.beam_effect_end = World.create_particles(world, self.beam_effect_name_end, self_pos)
		self.target_unit = target_unit

		if self.projectile_unit then
			WwiseUtils.trigger_unit_event(world, self.stop_projectile_sound, self.projectile_unit, 0)
			WwiseUtils.trigger_unit_event(world, self.beam_start_sound, self.unit, Unit.node(self.unit, "a_voice"))
			WwiseUtils.trigger_unit_event(world, self.beam_end_sound, target_unit, Unit.node(target_unit, "j_neck"))
		end

		self.state = state
	elseif state == "stop_beam" then
		self.remove_vfx_and_sfx(self)

		self.state = state
	end

	return 
end
CorruptorBeamExtension.update = function (self, unit, input, dt, context, t)
	local state = self.state
	local target_unit = self.target_unit
	local projectile_unit = self.projectile_unit

	if target_unit then
		local world = self.world
		local target_position = Unit.world_position(target_unit, Unit.node(target_unit, "j_neck"))
		local self_pos = Unit.world_position(unit, Unit.node(unit, "a_voice"))
		local direction = Vector3.normalize(target_position - self_pos)
		local distance = Vector3.distance(self_pos, target_position)
		local rotation = Quaternion.look(direction)
		local material_name = "beam"
		local variable_name = "uv_dynamic_scaling"

		if state == "projectile" then
			local current_pos = Unit.local_position(projectile_unit, 0)
			local wanted_position = current_pos + direction*self.projectile_speed*dt
			local distance_to_particle = Vector3.distance(self_pos, wanted_position)

			Unit.set_local_position(projectile_unit, 0, wanted_position)
			World.move_particles(world, self.beam_effect, self_pos, rotation)
			World.set_particles_variable(world, self.beam_effect, self.beam_effect_variable_id, Vector3(0.3, distance_to_particle, 0))
			World.set_particles_material_scalar(world, self.beam_effect, material_name, variable_name, distance_to_particle*1)

			if self.is_server then
				local blackboard = BLACKBOARDS[unit]

				if blackboard.projectile_position then
					blackboard.projectile_position:store(wanted_position)
				end
			end
		elseif state == "start_beam" then
			if projectile_unit then
				World.destroy_unit(world, projectile_unit)

				self.projectile_unit = nil
			end

			local rotation_inverse = Quaternion.look(-direction)

			World.move_particles(world, self.beam_effect, self_pos, rotation)
			World.set_particles_variable(world, self.beam_effect, self.beam_effect_variable_id, Vector3(0.3, distance, 0))
			World.set_particles_material_scalar(world, self.beam_effect, material_name, variable_name, distance*1)
			World.move_particles(world, self.beam_effect_start, self_pos, rotation)
			World.move_particles(world, self.beam_effect_end, target_position, rotation_inverse)
		end
	end

	return 
end

return 

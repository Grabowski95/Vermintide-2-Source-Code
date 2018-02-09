VortexHuskExtension = class(VortexHuskExtension)
VortexHuskExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	local game = Managers.state.network:game()
	self.world = world
	self.game = game
	self.unit = unit
	local vortex_template_name = extension_init_data.vortex_template_name
	local vortex_template = VortexTemplates[vortex_template_name]
	self.vortex_template_name = vortex_template_name
	self.vortex_template = vortex_template
	local inner_fx_name = vortex_template.inner_fx_name
	local position = POSITION_LOOKUP[unit]
	local inner_fx_id = World.create_particles(world, inner_fx_name, position)
	local rotation = Unit.local_rotation(unit, 0)
	local inner_pose = Matrix4x4.from_quaternion(rotation)
	local inner_scale_xy = vortex_template.full_inner_radius/vortex_template.full_fx_radius
	local inner_fx_z_scale_multiplier = vortex_template.inner_fx_z_scale_multiplier or 1

	Matrix4x4.set_scale(inner_pose, Vector3(inner_scale_xy, inner_scale_xy, inner_fx_z_scale_multiplier))
	World.link_particles(world, inner_fx_id, unit, 0, inner_pose, "stop")

	self._inner_fx_id = inner_fx_id
	local outer_fx_name = vortex_template.outer_fx_name
	local outer_fx_id = World.create_particles(world, outer_fx_name, position)
	local outer_pose = Matrix4x4.from_quaternion(rotation)
	local outer_scale_xy = vortex_template.full_outer_radius/vortex_template.full_fx_radius
	local outer_fx_z_scale_multiplier = vortex_template.outer_fx_z_scale_multiplier or 1

	Matrix4x4.set_scale(outer_pose, Vector3(outer_scale_xy, outer_scale_xy, outer_fx_z_scale_multiplier))
	World.link_particles(world, outer_fx_id, unit, 0, outer_pose, "stop")

	self._outer_fx_id = outer_fx_id
	local inner_decal_unit = extension_init_data.inner_decal_unit

	if inner_decal_unit then
		World.link_unit(world, inner_decal_unit, unit, 0)
		Unit.set_local_scale(inner_decal_unit, 0, Vector3(inner_scale_xy, inner_scale_xy, 1))

		self._inner_decal_unit = inner_decal_unit
	end

	local outer_decal_unit = extension_init_data.outer_decal_unit

	if outer_decal_unit then
		World.link_unit(world, outer_decal_unit, unit, 0)
		Unit.set_local_scale(outer_decal_unit, 0, Vector3(outer_scale_xy, outer_scale_xy, 1))

		self._outer_decal_unit = outer_decal_unit
	end

	local unit_storage = Managers.state.unit_storage
	local go_id = unit_storage.go_id(unit_storage, unit)
	self.current_height_lerp = GameSession.game_object_field(game, go_id, "height_percentage")

	return 
end
VortexHuskExtension.extensions_ready = function (self, world, unit)
	WwiseUtils.trigger_unit_event(world, "Play_enemy_sorcerer_vortex_loop", unit)

	return 
end
VortexHuskExtension.destroy = function (self)
	local world = self.world
	local unit = self.unit

	WwiseUtils.trigger_unit_event(world, "Stop_enemy_sorcerer_vortex_loop", unit)

	return 
end
local HEIGHT_FX_LERP = 2
VortexHuskExtension.update = function (self, unit, input, dt, context, t)
	local game = self.game
	local unit_storage = Managers.state.unit_storage
	local go_id = unit_storage.go_id(unit_storage, unit)
	local fx_radius_percentage = GameSession.game_object_field(game, go_id, "fx_radius_percentage")
	local height_percentage = GameSession.game_object_field(game, go_id, "height_percentage")
	local current_height_lerp = self.current_height_lerp
	local height_lerp = math.lerp(current_height_lerp, height_percentage, math.min(dt*HEIGHT_FX_LERP, 1))
	self.current_height_lerp = height_lerp
	local vortex_template = self.vortex_template
	local scale_xy = fx_radius_percentage*vortex_template.full_fx_radius
	local scale_z = height_lerp*vortex_template.max_height

	Unit.set_local_scale(unit, 0, Vector3(scale_xy, scale_xy, scale_z))

	if script_data.debug_vortex then
		local height = vortex_template.max_height*height_percentage
		local fx_radius = vortex_template.full_fx_radius*fx_radius_percentage
		local inner_radius_percentage = GameSession.game_object_field(game, go_id, "inner_radius_percentage")
		local outer_radius = math.max(vortex_template.min_outer_radius, vortex_template.full_outer_radius*inner_radius_percentage)
		local inner_radius = vortex_template.full_inner_radius*inner_radius_percentage
		local spin_speed = vortex_template.ai_rotation_speed
		local position = POSITION_LOOKUP[unit]

		self.debug_render_vortex(self, t, dt, position, fx_radius, inner_radius, outer_radius, spin_speed, height)
		Debug.text(string.format("VORTEX : FX_RADIUS: %.2f INNER_RADIUS: %.2f OUTER_RADIUS: %.2f HEIGHT: %.2f SPIN_SPEED: %.2f HEIGHT_LERP: %.4f", fx_radius, inner_radius, outer_radius, height, spin_speed, height_lerp))
	end

	return 
end
local spiral = {}
local spiral_segments = 8
local spiral_lines = 10
VortexHuskExtension.debug_render_vortex = function (self, t, dt, pos, fx_radius, inner_radius, outer_radius, spin_speed, height)
	fx_radius = fx_radius + math.sin(t*1.7)*0.4
	local step = (math.pi*2)/6
	local col_delta = math.floor(spiral_segments/155)
	local height_step = height/spiral_segments

	for j = 1, spiral_lines, 1 do
		local alpha = (j*2*math.pi)/spiral_lines

		for i = 1, spiral_segments, 1 do
			local r = fx_radius + (i*i*0.5)/spiral_segments
			local v = t*spin_speed + i*step + alpha
			spiral[i] = Vector3(math.sin(v)*r, math.cos(v)*r, (i - 1)*height_step)
		end

		local r = fx_radius + math.sin(t)*0.2
		local v = t*spin_speed + alpha + step*0
		local pos1 = Vector3(math.sin(v)*r, math.cos(v)*r, 0)

		QuickDrawer:sphere(pos + pos1, (math.sin(v*3) + 1)/3, Color(155, 255, 155))

		for i = 1, spiral_segments, 1 do
			local pos2 = spiral[i]
			local color = Color(col_delta*i - 155, col_delta*i - 255, col_delta*i - 155)

			QuickDrawer:line(pos + pos1, pos + pos2, color)

			pos1 = pos2
		end
	end

	QuickDrawer:circle(pos, inner_radius, Vector3.up(), Colors.get("pink"))
	QuickDrawer:circle(pos, outer_radius, Vector3.up(), Colors.get("lime_green"))

	return 
end

return 

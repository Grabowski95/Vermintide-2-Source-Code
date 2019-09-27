return {
	description = "description_mutator_darkness",
	display_name = "display_name_mutator_darkness",
	icon = "mutator_icon_darkness",
	server_update_function = function (context, data)
		local side = Managers.state.side:get_side_from_name("heroes")
		local PLAYER_AND_BOT_UNITS = side.PLAYER_AND_BOT_UNITS

		if #PLAYER_AND_BOT_UNITS > 0 and not data.has_spawned_torches then
			local player_unit = PLAYER_AND_BOT_UNITS[1]
			local position = Unit.world_position(player_unit, 0) + Vector3.up()
			local rotation = Quaternion.identity()
			local network_position = AiAnimUtils.position_network_scale(position, true)
			local network_rotation = AiAnimUtils.rotation_network_scale(rotation, true)
			local network_velocity = AiAnimUtils.velocity_network_scale(Vector3(0, 0, 0), true)
			local network_angular_velocity = network_velocity
			local extension_init_data = {
				pickup_system = {
					has_physics = true,
					pickup_name = "torch",
					spawn_type = "guaranteed"
				},
				projectile_locomotion_system = {
					network_position = network_position,
					network_rotation = network_rotation,
					network_velocity = network_velocity,
					network_angular_velocity = network_angular_velocity
				}
			}
			local unit_name = "units/weapons/player/pup_torch/pup_torch"
			local unit_template_name = "pickup_torch_unit"

			Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, position, rotation)

			data.has_spawned_torches = true
		end
	end,
	client_start_function = function (context, data)
		local world = Managers.world:world("level_world")

		LevelHelper:flow_event(world, "enable_twitch_darkness")

		local darkness_system = Managers.state.entity:system("darkness_system")

		darkness_system:set_global_darkness(true)
		darkness_system:set_player_light_intensity(0.15)
	end,
	client_stop_function = function (context, data, is_destroy)
		local world = Managers.world:world("level_world")

		if world and not is_destroy then
			LevelHelper:flow_event(world, "disable_twitch_darkness")

			local darkness_system = Managers.state.entity:system("darkness_system")

			darkness_system:set_global_darkness(false)
		end
	end
}

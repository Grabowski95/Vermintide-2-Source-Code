require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTCirclePreyAction = class(BTCirclePreyAction, BTNode)
BTCirclePreyAction.init = function (self, ...)
	BTCirclePreyAction.super.init(self, ...)

	return 
end
BTCirclePreyAction.name = "BTCirclePreyAction"
BTCirclePreyAction.enter = function (self, unit, blackboard, t)
	LocomotionUtils.set_animation_driven_movement(unit, false)

	local network_manager = Managers.state.network

	network_manager.anim_event(network_manager, unit, "to_combat")

	local is_on_navmesh = GwNavQueries.triangle_from_position(blackboard.nav_world, POSITION_LOOKUP[unit], 0.5, 0.5)

	if is_on_navmesh then
		local navigation_extension = blackboard.navigation_extension

		navigation_extension.set_max_speed(navigation_extension, blackboard.breed.run_speed)

		if blackboard.skulk_pos then
			local goal_position = blackboard.skulk_pos:unbox()

			self.move_to_goal(self, unit, blackboard, goal_position)
		else
			local goal_position = self.get_new_goal(self, unit, blackboard)

			if goal_position then
				blackboard.skulk_pos = Vector3Box(goal_position)

				self.move_to_goal(self, unit, blackboard, goal_position)
			else
				self.stop(self, unit, blackboard)
			end
		end
	else
		blackboard.ninja_vanish = true

		self.stop(self, unit, blackboard)
	end

	return 
end
BTCirclePreyAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if reason == "aborted" then
		blackboard.need_to_recalculate_skulk_pos = true
	end

	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension.set_max_speed(navigation_extension, default_move_speed)

	return 
end
BTCirclePreyAction.run = function (self, unit, blackboard, t, dt)
	local navigation_extension = blackboard.navigation_extension

	if not blackboard.ninja_vanish and navigation_extension.has_reached_destination(navigation_extension) then
		local goal_position = self.get_new_goal(self, unit, blackboard)

		if goal_position then
			local skulk_pos_box = blackboard.skulk_pos or Vector3Box()

			skulk_pos_box.store(skulk_pos_box, goal_position)

			blackboard.skulk_pos = skulk_pos_box

			self.move_to_goal(self, unit, blackboard, goal_position)
		else
			self.stop(self, unit, blackboard)
		end
	end

	return "running"
end
BTCirclePreyAction.get_new_goal = function (self, unit, blackboard)
	local target_unit = blackboard.secondary_target or blackboard.target_unit

	if Unit.alive(target_unit) then
		local target_position = POSITION_LOOKUP[target_unit]
		local goal_position = LocomotionUtils.new_random_goal(blackboard.nav_world, blackboard, target_position, 5, 10, 10)

		if goal_position then
			return goal_position
		end
	end

	return 
end
BTCirclePreyAction.move_to_goal = function (self, unit, blackboard, goal_position)
	if blackboard.move_state ~= "moving" then
		Managers.state.network:anim_event(unit, "move_fwd")

		blackboard.move_state = "moving"
	end

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension.set_wanted_rotation(locomotion_extension, nil)

	local navigation_extension = blackboard.navigation_extension

	navigation_extension.move_to(navigation_extension, goal_position)

	return 
end
BTCirclePreyAction.stop = function (self, unit, blackboard)
	if blackboard.move_state ~= "idle" then
		Managers.state.network:anim_event(unit, "idle")

		blackboard.move_state = "idle"
	end

	local navigation_extension = blackboard.navigation_extension

	if navigation_extension.is_following_path(navigation_extension) then
		navigation_extension.stop(navigation_extension)
	end

	return 
end

return 

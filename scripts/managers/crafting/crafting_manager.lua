CraftingManager = class(CraftingManager)
CraftingManager.NAME = "CraftingManager"
CraftingManager.init = function (self)
	local crafting_interface = Managers.backend:get_interface("crafting")
	self._crafting_interface = crafting_interface

	return 
end
CraftingManager.update = function (self, dt)
	return 
end
CraftingManager.get_recipes = function (self)
	return self._crafting_interface:get_recipes()
end
CraftingManager.get_recipes_lookup = function (self)
	return self._crafting_interface:get_recipes_lookup()
end
CraftingManager.are_recipes_dirty = function (self)
	local crafting_interface = self._crafting_interface
	local dirty_reason = crafting_interface.are_recipes_dirty(crafting_interface)

	return dirty_reason
end
CraftingManager.destroy = function (self)
	return 
end
CraftingManager.craft = function (self, items, callback_function)
	local crafting_interface = self._crafting_interface
	local item_backend_ids = {}

	for _, backend_id in pairs(items) do
		item_backend_ids[#item_backend_ids + 1] = backend_id
	end

	local player_manager = Managers.player
	local player = player_manager.local_player(player_manager)
	local profile_index = player.profile_index(player)
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career_index = player.career_index(player)
	local career = careers[career_index]
	local career_name = career.name
	local recipe_available = crafting_interface.craft(crafting_interface, career_name, item_backend_ids, callback_function)

	if recipe_available then
		local stats_id = player.stats_id(player)
		local statistics_db = player_manager.statistics_db(player_manager)

		statistics_db.increment_stat(statistics_db, stats_id, "crafted_items")
	end

	return recipe_available
end
CraftingManager.debug_set_crafted_items_stat = function (self, value)
	local player_manager = Managers.player
	local player = player_manager.local_player(player_manager)
	local stats_id = player.stats_id(player)
	local statistics_db = player_manager.statistics_db(player_manager)

	statistics_db.set_stat(statistics_db, stats_id, "crafted_items", value)
	Managers.backend:commit()
	print("Number of crafted items set to", value)

	return 
end

return 

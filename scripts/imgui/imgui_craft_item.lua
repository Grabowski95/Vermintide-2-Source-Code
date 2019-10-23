ImguiCraftItem = class(ImguiCraftItem)
local SHOULD_RELOAD = true
local max_combo_size = 20
local min_power_level = 100
local max_power_level = 300
local min_property_str = 0.1
local max_property_str = 1

ImguiCraftItem.init = function (self)
	self._properties = {}
	self._traits = {}
	self._skins = {}
	self._types = {}
	self._rarities = {
		"plentiful",
		"common",
		"rare",
		"exotic",
		"unique"
	}
	self._items_per_type = {}
	self._power_level = 100
	self._property_strength = 1
	self._current_type = -1
	self._current_item = -1
	self._current_rarity = -1
	self._current_skin = -1
	self._current_property = -1
	self._current_trait = -1
	self._active_protperties = {}
	self._active_traits = {}

	self:_parse_master_list()
end

ImguiCraftItem.update = function (self)
	if SHOULD_RELOAD then
		self:init()

		SHOULD_RELOAD = false
	end

	Imgui.Begin("Craft Item (LOCAL BACKEND ONLY)")

	self._power_level = Imgui.SliderFloat("Power Level", self._power_level, min_power_level, max_power_level)
	self._current_type = Imgui.Combo("Item Type", self._current_type, self._types, max_combo_size) - 1
	local current_type_name = self._current_type >= 0 and self._types[self._current_type + 1]
	local current_item_list = (current_type_name and self._items_per_type[current_type_name]) or {}
	self._current_item = Imgui.Combo("Item Name", self._current_item, current_item_list, max_combo_size) - 1
	self._current_rarity = Imgui.Combo("Item Rarity", self._current_rarity, self._rarities, max_combo_size) - 1
	local current_item_name = self._current_item >= 0 and current_item_list[self._current_item + 1]
	local current_item_skins = self:_get_skins_for_item(current_item_name)
	self._current_skin = Imgui.Combo("Item Skin", self._current_skin, current_item_skins, max_combo_size) - 1

	Imgui.Separator()

	self._property_strength = Imgui.SliderFloat("Property Strength", self._property_strength, min_property_str, max_property_str)
	self._current_property = Imgui.Combo("Item Properties", self._current_property, self._properties, max_combo_size) - 1

	if Imgui.Button("Add Property") then
		local current_property_name = self._current_property >= 0 and self._properties[self._current_property + 1]

		if current_property_name then
			self._active_protperties[current_property_name] = self._property_strength
		end
	end

	Imgui.Separator()

	self._current_trait = Imgui.Combo("Item Traits", self._current_trait, self._traits, max_combo_size) - 1

	if Imgui.Button("Add Trait") then
		local current_trait_name = self._current_trait >= 0 and self._traits[self._current_trait + 1]

		if current_trait_name then
			self._active_traits[current_trait_name] = true
		end
	end

	Imgui.Separator()
	Imgui.Text("Properties:")

	for name, value in pairs(self._active_protperties) do
		Imgui.TreePush(name)
		Imgui.Text(string.format("%32s : %.2f", name, value))
		Imgui.SameLine()

		if Imgui.Button("Remove") then
			self._active_protperties[name] = nil
		end

		Imgui.TreePop()
	end

	Imgui.Text("Traits:")

	for name, value in pairs(self._active_traits) do
		Imgui.TreePush(name)
		Imgui.Text(string.format("%48s", name))
		Imgui.SameLine()

		if Imgui.Button("Remove") then
			self._active_traits[name] = nil
		end

		Imgui.TreePop()
	end

	Imgui.Separator()

	if Imgui.Button("Add Item", 100, 20) then
		local power_level = self._power_level
		local rarity_name = self._current_rarity >= 0 and self._rarities[self._current_rarity + 1]
		local skin_name = self._current_skin >= 0 and current_item_skins[self._current_skin + 1]

		self:give_item(current_item_name, power_level, skin_name, rarity_name, self._active_protperties, self._active_traits)
	end

	Imgui.End()
end

ImguiCraftItem.subwindow_count = function (self)
	return 0
end

ImguiCraftItem.update_subwindow = function (self)
	return
end

ImguiCraftItem.give_item = function (self, item_key, power_level, skin_name, rarity, properties, traits)
	if item_key and power_level then
		local item_interface = Managers.backend:get_interface("items")

		if item_interface.award_custom_item then
			item_interface:award_custom_item(item_key, power_level, skin_name, rarity, properties, traits)
		end
	end
end

ImguiCraftItem._parse_master_list = function (self)
	local types = self._types
	local items_per_type = self._items_per_type
	local item_master_list = ItemMasterList

	for key, item in pairs(item_master_list) do
		local slot_type = item.slot_type

		if slot_type then
			if not table.contains(types, slot_type) then
				table.insert(types, slot_type)
			end

			if not items_per_type[slot_type] then
				items_per_type[slot_type] = {}
			end

			table.insert(items_per_type[slot_type], key)
		end
	end

	table.sort(types)

	for name, data in pairs(items_per_type) do
		table.sort(items_per_type[name])
	end

	local properties_list = WeaponProperties.properties

	for key, item in pairs(properties_list) do
		table.insert(self._properties, key)
	end

	table.sort(self._properties)

	local traits_list = WeaponTraits.traits

	for key, item in pairs(traits_list) do
		table.insert(self._traits, key)
	end

	table.sort(self._traits)
end

ImguiCraftItem._get_skins_for_item = function (self, item_name)
	if item_name then
		local item = ItemMasterList[item_name]
		local skin_combination_table_name = item and item.skin_combination_table
		local skin_combinations = skin_combination_table_name and WeaponSkins.skin_combinations[skin_combination_table_name]
		local rarity_skins = {}

		if skin_combinations then
			for rarity, skin_names in pairs(skin_combinations) do
				table.append(rarity_skins, skin_names)
			end
		end

		table.sort(rarity_skins)

		return rarity_skins
	end

	return {}
end

return

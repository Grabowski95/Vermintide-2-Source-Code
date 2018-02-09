require("scripts/helpers/cosmetic_utils")

PlayerUnitCosmeticExtension = class(PlayerUnitCosmeticExtension)
PlayerUnitCosmeticExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._world = extension_init_context.world
	self._unit = unit
	self._profile = extension_init_data.profile
	self._is_server = extension_init_data.is_server
	self._cosmetics = {}
	local skin_name = extension_init_data.skin_name
	local frame_name = extension_init_data.frame_name
	local hero_name = self._profile.display_name

	fassert(skin_name, "No skin name passed to CosmeticExtension, somthing went wrong!")

	local skin_data = Cosmetics[skin_name]
	self._cosmetics.skin = skin_data
	local material_changes = skin_data.material_changes

	if material_changes then
		local third_person_changes = material_changes.third_person

		for slot_name, material_name in pairs(third_person_changes) do
			Unit.set_material(unit, slot_name, material_name)
		end
	end

	local tint_data = skin_data.color_tint

	if tint_data then
		local gradient_variation = tint_data.gradient_variation
		local gradient_value = tint_data.gradient_value

		CosmeticUtils.color_tint_unit(unit, hero_name, gradient_variation, gradient_value)
	end

	if frame_name then
		self._cosmetics.frame = Cosmetics[frame_name]
	end

	self._frame_name = frame_name

	return 
end
PlayerUnitCosmeticExtension.extensions_ready = function (self, world, unit)
	local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

	if first_person_extension then
		local first_person_unit = first_person_extension.get_first_person_mesh_unit(first_person_extension)
		local skin_data = self._cosmetics.skin
		local material_changes = skin_data.material_changes

		if material_changes then
			local first_person_changes = material_changes.first_person

			if first_person_changes then
				for slot_name, material_name in pairs(first_person_changes) do
					Unit.set_material(first_person_unit, slot_name, material_name)
				end
			end
		end
	end

	return 
end
PlayerUnitCosmeticExtension.get_equipped_skin = function (self)
	return self._cosmetics.skin
end
PlayerUnitCosmeticExtension.get_equipped_frame = function (self)
	return self._cosmetics.frame
end
PlayerUnitCosmeticExtension.get_equipped_frame_name = function (self)
	return self._frame_name
end
PlayerUnitCosmeticExtension.hot_join_sync = function (self, sender)
	return 
end

return 

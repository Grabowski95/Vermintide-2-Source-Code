require("scripts/settings/level_settings")
require("scripts/settings/perlin_light_configurations")

PropsSystem = class(PropsSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_thorn_bush_trigger_area_damage",
	"rpc_thorn_bush_trigger_despawn"
}
local extensions = {
	"PerlinLightExtension",
	"BotNavTransitionExtension",
	"QuestChallengePropExtension",
	"ThornMutatorExtension"
}

PropsSystem.init = function (self, entity_system_creation_context, system_name)
	PropsSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	for k, v in pairs(PerlinLightConfigurations) do
		Light.add_flicker_configuration(k, v.persistance, v.octaves, v.min_value, v.frequency_multiplier, v.translation.persistance, v.translation.octaves, v.translation.jitter_multiplier_xy, v.translation.jitter_multiplier_z, v.translation.frequency_multiplier)
	end

	PerlinLightConfigurations_reload = false
	self._network_event_delegate = entity_system_creation_context.network_event_delegate

	self._network_event_delegate:register(self, unpack(RPCS))
end

PropsSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = nil

	if extension_name == "PerlinLightExtension" then
		local flicker_config_name = Unit.get_data(unit, "flicker_config")
		local light = Unit.light(unit, 0)

		Light.set_flicker_type(light, flicker_config_name)

		extension = {}
	else
		extension = PropsSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)
	end

	return extension
end

PropsSystem.destroy = function (self)
	self._network_event_delegate:unregister(self)
end

PropsSystem.on_remove_extension = function (self, unit, extension_name)
	if extension_name ~= "PerlinLightExtension" then
		PropsSystem.super.on_remove_extension(self, unit, extension_name)
	end
end

PropsSystem.update = function (self, context, t)
	PropsSystem.super.update(self, context, t)
end

PropsSystem.rpc_thorn_bush_trigger_area_damage = function (self, sender, unit_id)
	local unit = Managers.state.unit_storage:unit(unit_id)
	local script = ScriptUnit.extension(unit, "props_system")

	if script then
		script:trigger_area_damage()
	end
end

PropsSystem.rpc_thorn_bush_trigger_despawn = function (self, sender, unit_id)
	local unit = Managers.state.unit_storage:unit(unit_id)
	local script = ScriptUnit.extension(unit, "props_system")

	if script then
		script:despawn()
	end
end

return

local settings = DLCSettings.gecko
settings.network_lookups = {
	keep_decoration_paintings = "Paintings"
}
settings.keep_decoration_file_names = {
	"scripts/settings/paintings_01"
}
settings.level_packages = {}
local hub_levels = {
	inn_level_celebrate = true,
	inn_level = true,
	inn_level_halloween = true
}

for level_name, _ in pairs(hub_levels) do
	settings.level_packages[level_name] = {
		"resource_packages/keep_paintings/keep_paintings_inn_level_sounds_01"
	}
end

return

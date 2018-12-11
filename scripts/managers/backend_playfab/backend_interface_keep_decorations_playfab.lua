local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
BackendInterfaceKeepDecorationsPlayFab = class(BackendInterfaceKeepDecorationsPlayFab)

BackendInterfaceKeepDecorationsPlayFab.init = function (self, backend_mirror)
	self._backend_mirror = backend_mirror
	self._keep_decorations = {}
	local read_only_data = backend_mirror:get_read_only_data()
	local keep_decorations = read_only_data.keep_decorations or "{}"
	self._keep_decorations = cjson.decode(keep_decorations)

	self:_refresh()
end

BackendInterfaceKeepDecorationsPlayFab.dirtify = function (self)
	self._dirty = true
end

BackendInterfaceKeepDecorationsPlayFab.ready = function (self)
	return true
end

BackendInterfaceKeepDecorationsPlayFab._refresh = function (self)
	local mirror = self._backend_mirror
	local unlocked_keep_decorations = mirror:get_unlocked_keep_decorations()
	self._unlocked_keep_decorations = unlocked_keep_decorations
end

BackendInterfaceKeepDecorationsPlayFab.update = function (self, dt)
	return
end

BackendInterfaceKeepDecorationsPlayFab.get_decoration = function (self, slot_name)
	return self._keep_decorations[slot_name]
end

BackendInterfaceKeepDecorationsPlayFab.set_decoration = function (self, slot_name, item_id)
	self._keep_decorations[slot_name] = item_id
end

BackendInterfaceKeepDecorationsPlayFab.get_keep_decorations_json = function (self)
	return cjson.encode(self._keep_decorations)
end

BackendInterfaceKeepDecorationsPlayFab.get_unlocked_keep_decorations = function (self)
	if self._dirty then
		self:_refresh()
	end

	return self._unlocked_keep_decorations
end

return

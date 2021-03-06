BackendInterfacePeddlerPlayFab = class(BackendInterfacePeddlerPlayFab)
local PEDDLER_ID = "Store"
local NON_FATAL_ERROR_CODES = {
	[1052.0] = true,
	[1053.0] = true,
	[1047.0] = true,
	[1059.0] = true
}

BackendInterfacePeddlerPlayFab.init = function (self, backend_mirror)
	self._backend_mirror = backend_mirror
	self._peddler_stock = {}
	self._chips = {}
	self._app_prices = {}
	self._stock_ready = false
	self._chips_ready = false
	self._app_prices_ready = false

	self:refresh_stock()
	self:refresh_chips()
	self:refresh_layout_override(true)
	self:refresh_app_prices()
end

BackendInterfacePeddlerPlayFab.ready = function (self)
	return self._stock_ready and self._chips_ready and self._app_prices_ready
end

BackendInterfacePeddlerPlayFab.destroy = function (self)
	self._peddler_stock = nil
	self._chips = nil
	self._app_prices = nil
end

BackendInterfacePeddlerPlayFab.get_peddler_stock = function (self)
	return self._peddler_stock
end

local empty_params = {}

BackendInterfacePeddlerPlayFab.get_filtered_items = function (self, filter, params)
	local all_items = self._peddler_stock
	local backend_common = Managers.backend:get_interface("common")
	local items = backend_common:filter_items(all_items, filter, params or empty_params)

	return items
end

BackendInterfacePeddlerPlayFab.get_chips = function (self, chip_type)
	return self._chips[chip_type]
end

BackendInterfacePeddlerPlayFab.get_app_price = function (self, app_id)
	return self._app_prices[app_id]
end

BackendInterfacePeddlerPlayFab.get_unseen_currency_rewards = function (self)
	local user_data = self._backend_mirror:get_user_data()
	local unseen_rewards_json = user_data.unseen_rewards

	if not unseen_rewards_json then
		return nil
	end

	local unseen_rewards = cjson.decode(unseen_rewards_json)
	local unseen_items = nil
	local index = 1

	while index <= #unseen_rewards do
		local reward = unseen_rewards[index]
		local reward_type = reward.reward_type

		if reward_type == "currency" and reward.currency_type == "SM" then
			unseen_items = unseen_items or {}
			unseen_items[#unseen_items + 1] = reward

			table.remove(unseen_rewards, index)
		else
			index = index + 1
		end
	end

	if unseen_items then
		self._backend_mirror:set_user_data("unseen_rewards", cjson.encode(unseen_rewards))
	end

	return unseen_items
end

BackendInterfacePeddlerPlayFab.refresh_stock = function (self, external_cb)
	local request = {
		StoreId = PEDDLER_ID
	}
	local request_cb = callback(self, "_refresh_stock_cb", external_cb)
	local mirror = self._backend_mirror
	local request_queue = mirror:request_queue()

	request_queue:enqueue_api_request("GetStoreItems", request, request_cb)
end

BackendInterfacePeddlerPlayFab._refresh_stock_cb = function (self, external_cb, result)
	local stock = result.Store
	local peddler_stock = {}
	local mirror = self._backend_mirror
	local inventory_items = mirror:get_all_inventory_items()

	for i = 1, #stock, 1 do
		local item = stock[i]
		local key = item.ItemId

		if item.ItemId and not rawget(ItemMasterList, item.ItemId) then
			Crashify.print_exception("BackendInterfacePeddlerPlayFab", string.format("ItemMasterList has no item %q", tostring(item.ItemId)))
		else
			local data = ItemMasterList[key]
			local owned = false

			for backend_id, inventory_item in pairs(inventory_items) do
				if key == inventory_item.key then
					owned = true

					break
				end
			end

			local required_dlc = data.required_dlc

			if not required_dlc or Managers.unlock:is_dlc_unlocked(required_dlc) then
				peddler_stock[i] = {
					type = "item",
					data = table.clone(data),
					key = key,
					id = key,
					regular_prices = item.CustomData.regular_prices,
					current_prices = item.VirtualCurrencyPrices,
					end_time = item.CustomData.end_time,
					owned = owned,
					dlc_name = data.dlc_name
				}
			end
		end
	end

	print(string.format("[BackendInterfacePeddlerPlayFab] Added %s item(s) to the peddler stock", #peddler_stock))

	self._peddler_stock = peddler_stock
	self._stock_ready = true

	if external_cb then
		external_cb()
	end
end

BackendInterfacePeddlerPlayFab.set_chips = function (self, chip_type, chip_amount)
	self._chips[chip_type] = chip_amount
end

BackendInterfacePeddlerPlayFab.refresh_chips = function (self, external_cb)
	local request = {
		FunctionName = "getUserChips",
		FunctionParameter = {}
	}
	local mirror = self._backend_mirror
	local request_queue = mirror:request_queue()

	request_queue:enqueue(request, callback(self, "_refresh_chips_cb", external_cb), false)
end

BackendInterfacePeddlerPlayFab._refresh_chips_cb = function (self, external_cb, result)
	local function_result = result.FunctionResult
	local chips = function_result.chips

	for chip_type, chip_amount in pairs(chips) do
		self:set_chips(chip_type, chip_amount)
	end

	self._chips_ready = true

	if external_cb then
		external_cb()
	end
end

BackendInterfacePeddlerPlayFab.refresh_layout_override = function (self, use_mirrored_title_data, external_cb)
	local mirror = self._backend_mirror

	if use_mirrored_title_data then
		local title_data = mirror:get_title_data()
		local override_json = title_data.store_layout_override

		if override_json then
			local override = cjson.decode(override_json)
			local layout = StoreLayoutConfig

			if override.menu_options then
				layout.menu_options = override.menu_options
			end

			if override.structure then
				for key, value in pairs(override.structure) do
					layout.structure[key] = value
				end
			end

			if override.pages then
				for key, value in pairs(override.pages) do
					layout.pages[key] = value
				end
			end
		end

		if external_cb then
			external_cb()
		end
	else
		local request = {
			Keys = {
				"store_layout_override"
			}
		}
		local success_cb = callback(self, "_refresh_layout_override_cb", external_cb)
		local mirror = self._backend_mirror
		local request_queue = mirror:request_queue()

		request_queue:enqueue_api_request("GetTitleData", request, success_cb)
	end
end

BackendInterfacePeddlerPlayFab._refresh_layout_override_cb = function (self, external_cb, result)
	local override = result.Data and result.Data.store_layout_override
	local mirror = self._backend_mirror

	mirror:set_title_data("store_layout_override", override)
	self:refresh_layout_override(true, external_cb)
end

BackendInterfacePeddlerPlayFab.refresh_app_prices = function (self, external_cb)
	local platform = PLATFORM

	if platform == "win32" then
		self:_refresh_app_prices_steam(external_cb)
	elseif platform == "ps4" then
		self:_refresh_app_prices_psn(external_cb)
	elseif platform == "xb1" then
		self:_refresh_app_prices_xboxlive(external_cb)
	end
end

BackendInterfacePeddlerPlayFab._refresh_app_prices_steam = function (self, external_cb)
	local request = {
		FunctionName = "getSteamAppPriceInfo",
		FunctionParameter = {}
	}
	local mirror = self._backend_mirror
	local request_queue = mirror:request_queue()

	request_queue:enqueue(request, callback(self, "_refresh_app_prices_steam_cb", external_cb), false)
end

BackendInterfacePeddlerPlayFab._refresh_app_prices_steam_cb = function (self, external_cb, result)
	local function_result = result.FunctionResult
	local success = true

	if function_result.error then
		print("[BackendInterfacePeddlerPlayFab] _refresh_app_prices_steam_cb ERROR", function_result.error)

		success = false
	else
		local price_info = function_result.price_info

		if price_info then
			for app_id, info in pairs(price_info) do
				local currency = info.currency
				local regular_price = info.initial_price
				local current_price = info.final_price
				self._app_prices[app_id] = {
					currency = currency,
					regular_price = regular_price,
					current_price = current_price
				}
			end
		end
	end

	self._app_prices_ready = true

	if external_cb then
		external_cb(success)
	end
end

BackendInterfacePeddlerPlayFab._refresh_app_prices_psn = function (self, external_cb)
	self._app_prices_ready = true

	if external_cb then
		local success = true

		external_cb(success)
	end
end

BackendInterfacePeddlerPlayFab._refresh_app_prices_xboxlive = function (self, external_cb)
	self._app_prices_ready = true

	if external_cb then
		local success = true

		external_cb(success)
	end
end

BackendInterfacePeddlerPlayFab.exchange_chips = function (self, item_id, chip_type, expected_chip_amount, external_cb)
	local request = {
		StoreId = PEDDLER_ID,
		ItemId = item_id,
		VirtualCurrency = chip_type,
		Price = expected_chip_amount
	}
	local success_cb = callback(self, "_exchange_chips_success_cb", external_cb)
	local error_cb = callback(self, "_exchange_chips_error_cb", external_cb)
	local mirror = self._backend_mirror
	local request_queue = mirror:request_queue()

	request_queue:enqueue_api_request("PurchaseItem", request, success_cb, error_cb)
end

BackendInterfacePeddlerPlayFab._exchange_chips_success_cb = function (self, external_cb, result)
	local items = result.Items
	local chips = self._chips
	local mirror = self._backend_mirror

	for i = 1, #items, 1 do
		local item = items[i]
		local item_instance_id = item.ItemInstanceId
		local chip_type = item.UnitCurrency
		local chip_amount = item.UnitPrice

		mirror:add_item(item_instance_id, item)

		chips[chip_type] = chips[chip_type] - chip_amount

		print(string.format("[BackendInterfacePeddlerPlayFab] Exchanged %s %s for %s", chip_amount, chip_type, item.ItemId))
	end

	external_cb(true, items)
end

BackendInterfacePeddlerPlayFab._exchange_chips_error_cb = function (self, external_cb, result, reenable_queue_function)
	local error_code = result.errorCode
	local is_non_fatal = NON_FATAL_ERROR_CODES[error_code]

	if is_non_fatal then
		reenable_queue_function()
		self:_refresh_on_error(external_cb)
	else
		Managers.backend:playfab_error(BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ERROR, error_code)
		external_cb(false)
	end
end

BackendInterfacePeddlerPlayFab._refresh_on_error = function (self, external_cb)
	self:refresh_stock(callback(self, "_refresh_stock_on_error_cb", external_cb))
end

BackendInterfacePeddlerPlayFab._refresh_stock_on_error_cb = function (self, external_cb)
	self:refresh_chips(callback(self, "_refresh_chips_on_error_cb", external_cb))
end

BackendInterfacePeddlerPlayFab._refresh_chips_on_error_cb = function (self, external_cb)
	self:refresh_layout_override(false, callback(self, "_refresh_layout_override_on_error_cb", external_cb))
end

BackendInterfacePeddlerPlayFab._refresh_layout_override_on_error_cb = function (self, external_cb)
	Managers.backend:playfab_error(BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_NON_FATAL_STORE_ERROR, nil)
	external_cb(false)
end

return

local RPCS = {
	"rpc_request_profile",
	"rpc_request_profile_reply"
}
ProfileRequester = class(ProfileRequester)
ProfileRequester.REQUEST_RESULTS = {
	"success",
	"failure",
	success = 1,
	failure = 2
}

ProfileRequester.init = function (self, is_server, network_server, profile_synchronizer)
	self._is_server = is_server
	self._network_server = network_server
	self._profile_synchronizer = profile_synchronizer
	self._peer_id = Network.peer_id()
	self._request_id = 0
end

ProfileRequester.destroy = function (self)
	return
end

ProfileRequester.register_rpcs = function (self, network_event_delegate, network_transmit)
	network_event_delegate:register(self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate
	self._network_transmit = network_transmit
end

ProfileRequester.unregister_rpcs = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
	self._network_transmit = nil
end

ProfileRequester.profile_available_for_peer = function (self, peer_id, local_player_id, profile_name, career_name)
	return Managers.mechanism:profile_available_for_peer(peer_id, local_player_id, profile_name, career_name)
end

ProfileRequester.request_profile = function (self, peer_id, local_player_id, profile_name, career_name, force_respawn)
	self._request_id = self._request_id + 1
	self._request_result = nil
	local profile_index = FindProfileIndex(profile_name)
	local career_index = career_index_from_name(profile_index, career_name)

	if self._is_server then
		self:_request_profile(peer_id, local_player_id, self._request_id, profile_index, career_index, force_respawn)
	else
		self._network_transmit:send_rpc_server("rpc_request_profile", local_player_id, self._request_id, profile_index, career_index, force_respawn)
	end
end

ProfileRequester._request_profile = function (self, peer_id, local_player_id, request_id, profile_index, career_index, force_respawn)
	local profile_name, career_name = hero_and_career_name_from_index(profile_index, career_index)
	local allowed_to_switch_to_profile = self:profile_available_for_peer(peer_id, local_player_id, profile_name, career_name)
	local result_id = nil

	if allowed_to_switch_to_profile then
		result_id = ProfileRequester.REQUEST_RESULTS.success
		local profile = SPProfiles[profile_index]

		if profile.affiliation == "heroes" then
			Managers.party:set_selected_profile(peer_id, local_player_id, profile_index, career_index)
		end

		self._profile_synchronizer:select_profile(peer_id, local_player_id, profile_index, career_index)

		if force_respawn then
			Managers.state.game_mode:force_respawn(peer_id, local_player_id)
		end
	else
		result_id = ProfileRequester.REQUEST_RESULTS.failure
	end

	if self._peer_id == peer_id then
		self:rpc_request_profile_reply(peer_id, local_player_id, request_id, profile_index, career_index, force_respawn, result_id)
	else
		self._network_transmit:send_rpc("rpc_request_profile_reply", peer_id, local_player_id, request_id, profile_index, career_index, force_respawn, result_id)
	end
end

ProfileRequester._despawn_player_unit = function (self, player)
	local player_unit = player.player_unit
	self._despawning_player_unit = player_unit

	Managers.state.spawn:delayed_despawn(player)
end

ProfileRequester.update = function (self, dt)
	if self._despawning_player_unit and not Unit.alive(self._despawning_player_unit) then
		self._despawning_player_unit = nil
	end
end

ProfileRequester.result = function (self)
	return self._request_result
end

ProfileRequester.rpc_request_profile = function (self, sender, local_player_id, request_id, profile_index, career_index, force_respawn)
	self:_request_profile(sender, local_player_id, request_id, profile_index, career_index, force_respawn)
end

ProfileRequester.rpc_request_profile_reply = function (self, sender, local_player_id, request_id, profile_index, career_index, force_respawn, result_id)
	if request_id < self._request_id then
		return
	end

	local result = ProfileRequester.REQUEST_RESULTS[result_id]
	self._request_result = result

	if result == "success" and force_respawn then
		local self_peer_id = self._peer_id
		local player = Managers.player:player(self_peer_id, local_player_id)

		if player then
			if player.player_unit then
				self:_despawn_player_unit(player)
			end

			player:set_profile_index(profile_index)
			player:set_career_index(career_index)
		end
	end
end

return

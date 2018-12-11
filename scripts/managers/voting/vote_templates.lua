VoteTemplates = {
	retry_level = {
		priority = 100,
		client_start_vote_rpc = "rpc_server_request_start_vote_peer_id",
		text = "vote_retry_level_title",
		minimum_voter_percent = 1,
		server_start_vote_rpc = "rpc_client_start_vote_peer_id",
		duration = 20,
		vote_options = {
			{
				text = "vote_retry_level_yes",
				vote = 1
			},
			{
				text = "vote_retry_level_no",
				vote = 2
			}
		},
		on_complete = function (vote_result, ingame_context)
			local level_transition_handler = ingame_context.level_transition_handler

			if level_transition_handler:transition_in_progress() then
				return
			end

			if vote_result == 1 then
				level_transition_handler:reload_level()
			else
				level_transition_handler:set_next_level("inn_level")
				level_transition_handler:level_completed()
			end
		end,
		pack_sync_data = function (data)
			local sync_data = {}

			return sync_data
		end,
		extract_sync_data = function (sync_data)
			local data = {}

			return data
		end
	},
	return_to_inn = {
		priority = 1000,
		client_start_vote_rpc = "rpc_server_request_start_vote_peer_id",
		text = "n/a",
		minimum_voter_percent = 1,
		server_start_vote_rpc = "rpc_client_start_vote_peer_id",
		duration = 90,
		vote_options = {
			{
				text = "n/a",
				vote = 1
			}
		},
		on_complete = function (vote_result, ingame_context)
			local level_transition_handler = ingame_context.level_transition_handler

			if level_transition_handler:transition_in_progress() then
				return
			end

			Managers.matchmaking:set_quick_game(false)
			Managers.state.game_mode:start_specific_level("inn_level", 0)
		end,
		pack_sync_data = function (data)
			local sync_data = {}

			return sync_data
		end,
		extract_sync_data = function (sync_data)
			local data = {}

			return data
		end
	},
	continue_level = {
		priority = 100,
		client_start_vote_rpc = "rpc_server_request_start_vote_peer_id",
		text = "vote_retry_level_title",
		minimum_voter_percent = 1,
		server_start_vote_rpc = "rpc_client_start_vote_peer_id",
		duration = 20,
		vote_options = {
			{
				text = "vote_retry_level_continue",
				vote = 1
			},
			{
				text = "vote_retry_level_restart",
				vote = 2
			},
			{
				text = "vote_retry_level_cancel",
				vote = 3
			}
		},
		on_complete = function (vote_result, ingame_context)
			local level_transition_handler = ingame_context.level_transition_handler

			if vote_result == 1 then
				local checkpoint_data = Managers.state.spawn:checkpoint_data()

				level_transition_handler:reload_level(checkpoint_data)
			elseif vote_result == 2 then
				level_transition_handler:reload_level()
			else
				Managers.state.event:trigger("checkpoint_vote_cancelled")
			end
		end,
		pack_sync_data = function (data)
			local sync_data = {}

			return sync_data
		end,
		extract_sync_data = function (sync_data)
			local data = {}

			return data
		end
	},
	kick_player = {
		client_start_vote_rpc = "rpc_server_request_start_vote_peer_id",
		priority = 10,
		ingame_vote = true,
		min_required_voters = 3,
		text = "input_description_vote_kick_player",
		minimum_voter_percent = 1,
		success_percent = 0.51,
		server_start_vote_rpc = "rpc_client_start_vote_peer_id",
		duration = 30,
		vote_options = {
			{
				text = "vote_kick_player_option_yes",
				vote = 1,
				input_hold_time = 1,
				gamepad_input = "ingame_vote_yes",
				input = "ingame_vote_yes"
			},
			{
				text = "vote_kick_player_option_no",
				input_hold_time = 1,
				vote = 2,
				input = "ingame_vote_no"
			}
		},
		on_complete = function (vote_result, ingame_context, data)
			if vote_result == 1 then
				local network_server = ingame_context.network_server

				network_server:kick_peer(data.kick_peer_id)
			end
		end,
		pack_sync_data = function (data)
			local sync_data = {
				data.voter_peer_id,
				data.kick_peer_id
			}

			return sync_data
		end,
		extract_sync_data = function (sync_data)
			local voter_peer_id = sync_data[1]
			local kick_peer_id = sync_data[2]
			local data = {
				voter_peer_id = voter_peer_id,
				kick_peer_id = kick_peer_id
			}

			return data
		end,
		modify_title_text = function (text, data)
			local player = Managers.player:player_from_peer_id(data.kick_peer_id)
			local name = (player and player:name()) or "n/a"

			return sprintf("%s\n%s", text, tostring(name))
		end,
		initial_vote_func = function (data)
			local votes = {
				[data.voter_peer_id] = 1,
				[data.kick_peer_id] = 2
			}

			return votes
		end,
		can_start_vote = function (data)
			if data then
				local player = Managers.player:player_from_peer_id(data.kick_peer_id)

				if player then
					return true
				end
			end

			return false
		end
	},
	afk_kick = {
		client_start_vote_rpc = "rpc_server_request_start_vote_peer_id",
		priority = 10,
		ingame_vote = true,
		min_required_voters = 2,
		text = "afk_vote_kick_player",
		minimum_voter_percent = 1,
		success_percent = 0.51,
		server_start_vote_rpc = "rpc_client_start_vote_peer_id",
		duration = 30,
		vote_options = {
			{
				text = "vote_kick_player_yes",
				vote = 1,
				input = "ingame_vote_yes"
			},
			{
				text = "vote_kick_player_no",
				vote = 2,
				input = "ingame_vote_no"
			}
		},
		on_complete = function (vote_result, ingame_context, data)
			if vote_result == 1 then
				local network_server = ingame_context.network_server

				network_server:kick_peer(data.kick_peer_id)
			end
		end,
		pack_sync_data = function (data)
			local sync_data = {
				data.voter_peer_id,
				data.kick_peer_id
			}

			return sync_data
		end,
		extract_sync_data = function (sync_data)
			local voter_peer_id = sync_data[1]
			local kick_peer_id = sync_data[2]
			local data = {
				voter_peer_id = voter_peer_id,
				kick_peer_id = kick_peer_id
			}

			return data
		end,
		modify_title_text = function (text, data)
			local player = Managers.player:player_from_peer_id(data.kick_peer_id)
			local name = player:name()

			return sprintf("%s\n%s", text, tostring(name))
		end
	},
	vote_for_level = {
		client_start_vote_rpc = "rpc_server_request_start_vote_peer_id",
		priority = 110,
		ingame_vote = false,
		min_required_voters = 1,
		text = "vote_for_next_level",
		minimum_voter_percent = 1,
		success_percent = 1,
		server_start_vote_rpc = "rpc_client_start_vote_peer_id",
		duration = 300,
		start_sound_event = "hud_dice_game_reward_sound",
		vote_options = {
			{
				text = "popup_choice_accept",
				vote = 1,
				input = "ingame_vote_yes"
			},
			{
				text = "dlc1_3_1_decline",
				vote = 2,
				input = "ingame_vote_no"
			}
		},
		on_complete = function (vote_result, ingame_context, data)
			if vote_result == 1 then
				local level_key = data.level_key

				Managers.state.game_mode:start_specific_level(level_key)
			end
		end,
		pack_sync_data = function (data)
			local sync_data = {
				data.voter_peer_id,
				NetworkLookup.level_keys[data.level_key]
			}

			return sync_data
		end,
		extract_sync_data = function (sync_data)
			local voter_peer_id = sync_data[1]
			local level_key = NetworkLookup.level_keys[tonumber(sync_data[2])]
			local data = {
				voter_peer_id = voter_peer_id,
				level_key = level_key
			}

			return data
		end
	},
	game_settings_vote = {
		client_start_vote_rpc = "rpc_server_request_start_vote_lookup",
		ingame_vote = false,
		mission_vote = true,
		gamepad_support = true,
		text = "game_settings_vote",
		minimum_voter_percent = 1,
		success_percent = 1,
		server_start_vote_rpc = "rpc_client_start_vote_lookup",
		duration = 30,
		priority = 110,
		min_required_voters = 1,
		gamepad_input_desc = "default_voting",
		timeout_vote_option = 2,
		vote_options = {
			{
				text = "popup_choice_accept",
				gamepad_input = "confirm",
				vote = 1,
				input = "ingame_vote_yes"
			},
			{
				text = "dlc1_3_1_decline",
				gamepad_input = "back",
				vote = 2,
				input = "ingame_vote_no"
			}
		},
		on_start = function (ingame_context, data)
			Managers.matchmaking:cancel_matchmaking()
		end,
		on_complete = function (vote_result, ingame_context, data)
			if vote_result == 1 then
				local level_key = data.level_key
				local difficulty = data.difficulty
				local quick_game = data.quick_game
				local private_game = data.private_game
				local always_host = data.always_host
				local strict_matchmaking = data.strict_matchmaking
				local game_mode = data.game_mode
				local search_config = {
					level_key = level_key,
					difficulty = difficulty,
					quick_game = quick_game,
					private_game = private_game,
					always_host = always_host,
					strict_matchmaking = strict_matchmaking,
					game_mode = game_mode
				}
				local matchmaking_manager = Managers.matchmaking

				matchmaking_manager:find_game(search_config)
			end
		end,
		pack_sync_data = function (data)
			local level_key = data.level_key or "n/a"
			local act_key = data.act_key or "n/a"
			local difficulty = data.difficulty
			local quick_game = data.quick_game
			local private_game = data.private_game
			local always_host = data.always_host
			local strict_matchmaking = data.strict_matchmaking
			local game_mode = data.game_mode
			local sync_data = {
				NetworkLookup.level_keys[level_key],
				NetworkLookup.act_keys[act_key],
				NetworkLookup.difficulties[difficulty],
				(quick_game and 1) or 2,
				(private_game and 1) or 2,
				(always_host and 1) or 2,
				(strict_matchmaking and 1) or 2,
				NetworkLookup.game_modes[game_mode]
			}

			return sync_data
		end,
		extract_sync_data = function (sync_data)
			local level_key_id = sync_data[1]
			local act_key_id = sync_data[2]
			local difficulty_id = sync_data[3]
			local quick_game_id = sync_data[4]
			local private_game_id = sync_data[5]
			local always_host_id = sync_data[6]
			local strict_matchmaking_id = sync_data[7]
			local game_mode_id = sync_data[8]
			local level_key = NetworkLookup.level_keys[level_key_id]

			if level_key == "n/a" then
				level_key = nil
			end

			local act_key = NetworkLookup.act_keys[act_key_id]

			if act_key == "n/a" then
				act_key = nil
			end

			local difficulty = NetworkLookup.difficulties[difficulty_id]
			local game_mode = NetworkLookup.game_modes[game_mode_id]
			local data = {
				level_key = level_key,
				act_key = act_key,
				difficulty = difficulty,
				quick_game = (quick_game_id == 1 and true) or false,
				private_game = (private_game_id == 1 and true) or false,
				always_host = (always_host_id == 1 and true) or false,
				strict_matchmaking = (strict_matchmaking_id == 1 and true) or false,
				game_mode = game_mode
			}

			return data
		end,
		initial_vote_func = function (data)
			local votes = {
				[data.voter_peer_id] = 1
			}

			return votes
		end
	},
	game_settings_deed_vote = {
		client_start_vote_rpc = "rpc_server_request_start_vote_deed",
		ingame_vote = false,
		mission_vote = true,
		gamepad_support = true,
		text = "game_settings_deed_vote",
		minimum_voter_percent = 1,
		success_percent = 1,
		server_start_vote_rpc = "rpc_client_start_vote_deed",
		duration = 30,
		priority = 110,
		min_required_voters = 1,
		gamepad_input_desc = "default_voting",
		timeout_vote_option = 2,
		vote_options = {
			{
				text = "popup_choice_accept",
				gamepad_input = "confirm",
				vote = 1,
				input = "ingame_vote_yes"
			},
			{
				text = "dlc1_3_1_decline",
				gamepad_input = "back",
				vote = 2,
				input = "ingame_vote_no"
			}
		},
		on_start = function (ingame_context, data)
			Managers.matchmaking:cancel_matchmaking()
		end,
		on_complete = function (vote_result, ingame_context, data)
			if vote_result == 1 then
				local level_key = data.level_key
				local difficulty = data.difficulty
				local private_game = true
				local quick_game = false
				local game_mode = "deed"
				local search_config = {
					level_key = level_key,
					difficulty = difficulty,
					private_game = private_game,
					quick_game = quick_game,
					game_mode = game_mode
				}

				Managers.matchmaking:find_game(search_config)
			else
				Managers.deed:reset()
			end
		end,
		pack_sync_data = function (data)
			local item_name = data.item_name
			local level_key = data.level_key
			local difficulty = data.difficulty
			local sync_data = {
				NetworkLookup.item_names[item_name],
				NetworkLookup.level_keys[level_key],
				NetworkLookup.difficulties[difficulty]
			}

			return sync_data
		end,
		extract_sync_data = function (sync_data)
			local item_name_id = sync_data[1]
			local level_key_id = sync_data[2]
			local difficulty_id = sync_data[3]
			local item_name = NetworkLookup.item_names[item_name_id]
			local level_key = NetworkLookup.level_keys[level_key_id]

			if level_key == "n/a" then
				level_key = nil
			end

			local difficulty = NetworkLookup.difficulties[difficulty_id]
			local data = {
				game_mode = "deed",
				item_name = item_name,
				level_key = level_key,
				difficulty = difficulty
			}

			return data
		end,
		initial_vote_func = function (data)
			local votes = {
				[data.voter_peer_id] = 1
			}

			return votes
		end
	},
	game_settings_event_vote = {
		client_start_vote_rpc = "rpc_server_request_start_vote_lookup",
		ingame_vote = false,
		mission_vote = true,
		gamepad_support = true,
		text = "game_settings_event_vote",
		minimum_voter_percent = 1,
		success_percent = 1,
		server_start_vote_rpc = "rpc_client_start_vote_lookup",
		duration = 30,
		priority = 110,
		min_required_voters = 1,
		gamepad_input_desc = "default_voting",
		timeout_vote_option = 2,
		vote_options = {
			{
				text = "popup_choice_accept",
				gamepad_input = "confirm",
				vote = 1,
				input = "ingame_vote_yes"
			},
			{
				text = "dlc1_3_1_decline",
				gamepad_input = "back",
				vote = 2,
				input = "ingame_vote_no"
			}
		},
		on_start = function (ingame_context, data)
			Managers.matchmaking:cancel_matchmaking()
		end,
		on_complete = function (vote_result, ingame_context, data)
			if vote_result == 1 then
				local level_key = data.level_key
				local difficulty = data.difficulty
				local private_game = false
				local quick_game = false
				local game_mode = "event"
				local search_config = {
					level_key = level_key,
					difficulty = difficulty,
					quick_game = quick_game,
					private_game = private_game,
					game_mode = game_mode
				}
				local event_data = data.event_data
				local matchmaking_manager = Managers.matchmaking

				matchmaking_manager:find_game(search_config)
				matchmaking_manager:set_game_mode_event_data(event_data)
			end
		end,
		pack_sync_data = function (data)
			local level_key = data.level_key or "n/a"
			local difficulty = data.difficulty
			local event_data = data.event_data
			local mutators = event_data.mutators
			local sync_data = {
				NetworkLookup.level_keys[level_key],
				NetworkLookup.difficulties[difficulty]
			}

			for i = 1, #mutators, 1 do
				local mutator_name = mutators[i]
				local mutator_id = NetworkLookup.mutator_templates[mutator_name]
				sync_data[#sync_data + 1] = mutator_id
			end

			return sync_data
		end,
		extract_sync_data = function (sync_data)
			local level_key_id = sync_data[1]
			local difficulty_id = sync_data[2]
			local mutators = {}
			local mutator_start_index = 3

			for i = mutator_start_index, #sync_data, 1 do
				local mutator_id = sync_data[i]
				mutators[#mutators + 1] = NetworkLookup.mutator_templates[mutator_id]
			end

			local level_key = NetworkLookup.level_keys[level_key_id]

			if level_key == "n/a" then
				level_key = nil
			end

			local difficulty = NetworkLookup.difficulties[difficulty_id]
			local data = {
				game_mode = "event",
				level_key = level_key,
				difficulty = difficulty,
				event_data = {
					mutators = mutators
				}
			}

			return data
		end,
		initial_vote_func = function (data)
			local votes = {
				[data.voter_peer_id] = 1
			}

			return votes
		end
	}
}

for name, template in pairs(VoteTemplates) do
	template.name = name
end

return

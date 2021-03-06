return function ()
	define_rule({
		name = "pwh_level_chaos_war_camp_ravine",
		response = "pwh_level_chaos_war_camp_ravine",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"chaos_war_camp_ravine"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_camp_ravine",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_ravine",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_chaos_war_camp_live_in_swamp",
		response = "pwh_level_chaos_war_camp_live_in_swamp",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"chaos_war_camp_live_in_swamp"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_camp_live_in_swamp",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_live_in_swamp",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_chaos_war_camp_cabin",
		response = "pwh_level_chaos_war_camp_cabin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"chaos_war_camp_cabin"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_camp_cabin",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_cabin",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_chaos_war_camp_which_way",
		response = "pwh_level_chaos_war_camp_which_way",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"chaos_war_camp_which_way"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_camp_which_way",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_which_way",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_chaos_war_camp_islands_01",
		response = "pwh_level_chaos_war_camp_islands_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"chaos_war_camp_islands"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_camp_islands",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_islands",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_chaos_war_camp_camp_view_01",
		response = "pwh_level_chaos_war_camp_camp_view_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"chaos_war_camp_camp_view"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_camp_camp_view",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_camp_view",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_chaos_war_camp_tree",
		response = "pwh_level_chaos_war_camp_tree",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"chaos_war_camp_tree"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_camp_tree",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_tree",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_chaos_war_camp_outer_gate_01",
		response = "pwh_level_chaos_war_camp_outer_gate_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"chaos_war_camp_outer_gate"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_camp_outer_gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_outer_gate",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_chaos_war_camp_battering_ram_01",
		response = "pwh_level_chaos_war_camp_battering_ram_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"chaos_war_camp_battering_ram"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"level_chaos_war_camp_battering_ram",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_battering_ram",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_chaos_war_camp_battering_ram_use_01",
		response = "pwh_level_chaos_war_camp_battering_ram_use_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"chaos_war_camp_battering_ram_use"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"level_chaos_war_camp_battering_ram_use",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_battering_ram_use",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_chaos_war_camp_wall_01",
		response = "pwh_level_chaos_war_camp_wall_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"chaos_war_camp_wall"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_camp_wall",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_wall",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_chaos_war_surprise_01",
		response = "pwh_level_chaos_war_surprise_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"chaos_war_surprise"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_surprise",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_surprise",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_chaos_war_camp_keep_fighting_01",
		response = "pwh_level_chaos_war_camp_keep_fighting_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"chaos_war_camp_keep_fighting"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"level_chaos_war_camp_keep_fighting",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_keep_fighting",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_chaos_war_camp_arena_01",
		response = "pwh_level_chaos_war_camp_arena_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"chaos_war_camp_arena"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"level_chaos_war_camp_arena",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_arena",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_chaos_war_camp_dead_champion_01",
		response = "pwh_level_chaos_war_camp_dead_champion_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"chaos_war_camp_dead_champion"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"level_chaos_war_camp_dead_champion",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_dead_champion",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_chaos_war_camp_depart_01",
		response = "pwh_level_chaos_war_camp_depart_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"chaos_war_camp_depart"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"level_chaos_war_camp_depart",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_depart",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_chaos_war_camp_success_01",
		response = "pwh_level_chaos_war_camp_success_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"chaos_war_camp_success"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"level_chaos_war_camp_success",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_success",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_chaos_war_camp_portal_01",
		response = "pwh_level_chaos_war_camp_portal_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"chaos_war_camp_portal"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"level_chaos_war_camp_portal",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_portal",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_chaos_war_camp_intro_a",
		response = "pwh_chaos_war_camp_intro_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"chaos_war_camp_intro_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"chaos_war_camp_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_chaos_war_camp_intro_b",
		response = "pwh_chaos_war_camp_intro_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"chaos_war_camp_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"chaos_war_camp_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_chaos_war_camp_intro_c",
		response = "pwh_chaos_war_camp_intro_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"chaos_war_camp_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"chaos_war_camp_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_intro_c",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_chaos_champion_throwing_axe",
		response = "pwh_gameplay_chaos_champion_throwing_axe",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ecc_chaos_war_camp_throw_axe"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"chaos_champion_throwing_axe",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_champion_throwing_axe",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_chaos_champion_charge_reply",
		response = "pwh_gameplay_chaos_champion_charge_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ecc_chaos_war_camp_charge"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"chaos_champion_charge_reply",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_champion_charge_reply",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_chaos_champion_summon_reply",
		response = "pwh_gameplay_chaos_champion_summon_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ecc_chaos_war_camp_ground_summon"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"chaos_champion_summon_reply",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_champion_summon_reply",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_chaos_war_camp_challenge_reply_a",
		response = "pwh_chaos_war_camp_challenge_reply_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ecc_chaos_war_camp_challenge"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"chaos_war_camp_challenge_reply",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_challenge_reply",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_chaos_war_camp_taunt_payback_reply",
		response = "pwh_chaos_war_camp_taunt_payback_reply",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ecc_chaos_war_camp_taunt_payback"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"chaos_war_camp_taunt_payback_reply",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_taunt_payback_reply",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_level_chaos_war_camp_dead_champion",
		response = "pwh_level_chaos_war_camp_dead_champion",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_exalted_champion_warcamp"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_memory",
				"chaos_war_camp_dead_champion",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"chaos_war_camp_dead_champion",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_ground_zero_cargo_elevator",
		response = "pdr_level_ground_zero_cargo_elevator",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ground_zero_cargo_elevator"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"level_ground_zero_cargo_elevator",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_cargo_elevator",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pwh_level_chaos_war_camp_tree = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_chaos_war_camp_tree_01",
				"pwh_level_chaos_war_camp_tree_02",
				"pwh_level_chaos_war_camp_tree_03",
				"pwh_level_chaos_war_camp_tree_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_level_chaos_war_camp_tree_01",
				"pwh_level_chaos_war_camp_tree_02",
				"pwh_level_chaos_war_camp_tree_03",
				"pwh_level_chaos_war_camp_tree_04"
			},
			randomize_indexes = {}
		},
		pwh_level_chaos_war_camp_ravine = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_chaos_war_camp_ravine_01",
				"pwh_level_chaos_war_camp_ravine_02",
				"pwh_level_chaos_war_camp_ravine_03",
				"pwh_level_chaos_war_camp_ravine_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pwh_level_chaos_war_camp_ravine_01",
				"pwh_level_chaos_war_camp_ravine_02",
				"pwh_level_chaos_war_camp_ravine_03",
				"pwh_level_chaos_war_camp_ravine_04"
			},
			randomize_indexes = {}
		},
		pwh_level_chaos_war_camp_battering_ram_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "cut_scene",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_chaos_war_camp_battering_ram_01",
				"pwh_level_chaos_war_camp_battering_ram_02",
				"pwh_level_chaos_war_camp_battering_ram_03",
				"pwh_level_chaos_war_camp_battering_ram_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_level_chaos_war_camp_battering_ram_01",
				"pwh_level_chaos_war_camp_battering_ram_02",
				"pwh_level_chaos_war_camp_battering_ram_03",
				"pwh_level_chaos_war_camp_battering_ram_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_chaos_champion_throwing_axe = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_chaos_champion_throwing_axe_01",
				"pwh_gameplay_chaos_champion_throwing_axe_02",
				"pwh_gameplay_chaos_champion_throwing_axe_03",
				"pwh_gameplay_chaos_champion_throwing_axe_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwh_gameplay_chaos_champion_throwing_axe_01",
				"pwh_gameplay_chaos_champion_throwing_axe_02",
				"pwh_gameplay_chaos_champion_throwing_axe_03",
				"pwh_gameplay_chaos_champion_throwing_axe_04"
			},
			randomize_indexes = {}
		},
		pwh_level_chaos_war_surprise_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_chaos_war_surprise_01",
				"pwh_level_chaos_war_surprise_02",
				"pwh_level_chaos_war_surprise_03",
				"pwh_level_chaos_war_surprise_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pwh_level_chaos_war_surprise_01",
				"pwh_level_chaos_war_surprise_02",
				"pwh_level_chaos_war_surprise_03",
				"pwh_level_chaos_war_surprise_04"
			},
			randomize_indexes = {}
		},
		pwh_level_chaos_war_camp_battering_ram_use_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_chaos_war_camp_battering_ram_use_01",
				"pwh_level_chaos_war_camp_battering_ram_use_02",
				"pwh_level_chaos_war_camp_battering_ram_use_03",
				"pwh_level_chaos_war_camp_battering_ram_use_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_level_chaos_war_camp_battering_ram_use_01",
				"pwh_level_chaos_war_camp_battering_ram_use_02",
				"pwh_level_chaos_war_camp_battering_ram_use_03",
				"pwh_level_chaos_war_camp_battering_ram_use_04"
			},
			randomize_indexes = {}
		},
		pdr_level_ground_zero_cargo_elevator = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_ground_zero_cargo_elevator_01",
				"pdr_level_ground_zero_cargo_elevator_02",
				"pdr_level_ground_zero_cargo_elevator_03",
				"pdr_level_ground_zero_cargo_elevator_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_level_ground_zero_cargo_elevator_01",
				"pdr_level_ground_zero_cargo_elevator_02",
				"pdr_level_ground_zero_cargo_elevator_03",
				"pdr_level_ground_zero_cargo_elevator_04"
			},
			randomize_indexes = {}
		},
		pwh_level_chaos_war_camp_cabin = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_chaos_war_camp_cabin_01",
				"pwh_level_chaos_war_camp_cabin_02",
				"pwh_level_chaos_war_camp_cabin_03",
				"pwh_level_chaos_war_camp_cabin_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pwh_level_chaos_war_camp_cabin_01",
				"pwh_level_chaos_war_camp_cabin_02",
				"pwh_level_chaos_war_camp_cabin_03",
				"pwh_level_chaos_war_camp_cabin_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_chaos_champion_summon_reply = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_chaos_champion_summon_reply_01",
				"pwh_gameplay_chaos_champion_summon_reply_02",
				"pwh_gameplay_chaos_champion_summon_reply_03",
				"pwh_gameplay_chaos_champion_summon_reply_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwh_gameplay_chaos_champion_summon_reply_01",
				"pwh_gameplay_chaos_champion_summon_reply_02",
				"pwh_gameplay_chaos_champion_summon_reply_03",
				"pwh_gameplay_chaos_champion_summon_reply_04"
			},
			randomize_indexes = {}
		},
		pwh_chaos_war_camp_intro_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_chaos_war_camp_intro_a_01",
				[2.0] = "pwh_chaos_war_camp_intro_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_chaos_war_camp_intro_a_01",
				[2.0] = "pwh_chaos_war_camp_intro_a_02"
			},
			randomize_indexes = {}
		},
		pwh_level_chaos_war_camp_depart_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_chaos_war_camp_depart_01",
				"pwh_level_chaos_war_camp_depart_02",
				"pwh_level_chaos_war_camp_depart_03",
				"pwh_level_chaos_war_camp_depart_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pwh_level_chaos_war_camp_depart_01",
				"pwh_level_chaos_war_camp_depart_02",
				"pwh_level_chaos_war_camp_depart_03",
				"pwh_level_chaos_war_camp_depart_04"
			},
			randomize_indexes = {}
		},
		pwh_chaos_war_camp_intro_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_chaos_war_camp_intro_c_01",
				[2.0] = "pwh_chaos_war_camp_intro_c_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_chaos_war_camp_intro_c_01",
				[2.0] = "pwh_chaos_war_camp_intro_c_02"
			},
			randomize_indexes = {}
		},
		pwh_level_chaos_war_camp_dead_champion = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "witch_hunter_warcamp",
			category = "player_alerts_boss",
			dialogue_animations_n = 3,
			sound_events = {
				"pwh_level_chaos_war_camp_dead_champion_01",
				"pwh_level_chaos_war_camp_dead_champion_02",
				"pwh_level_chaos_war_camp_dead_champion_03"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwh_level_chaos_war_camp_dead_champion_01",
				"pwh_level_chaos_war_camp_dead_champion_02",
				"pwh_level_chaos_war_camp_dead_champion_03"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_chaos_champion_charge_reply = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_chaos_champion_charge_reply_01",
				"pwh_gameplay_chaos_champion_charge_reply_02",
				"pwh_gameplay_chaos_champion_charge_reply_03",
				"pwh_gameplay_chaos_champion_charge_reply_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwh_gameplay_chaos_champion_charge_reply_01",
				"pwh_gameplay_chaos_champion_charge_reply_02",
				"pwh_gameplay_chaos_champion_charge_reply_03",
				"pwh_gameplay_chaos_champion_charge_reply_04"
			},
			randomize_indexes = {}
		},
		pwh_level_chaos_war_camp_dead_champion_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_chaos_war_camp_dead_champion_01",
				"pwh_level_chaos_war_camp_dead_champion_02",
				"pwh_level_chaos_war_camp_dead_champion_03",
				"pwh_level_chaos_war_camp_dead_champion_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pwh_level_chaos_war_camp_dead_champion_01",
				"pwh_level_chaos_war_camp_dead_champion_02",
				"pwh_level_chaos_war_camp_dead_champion_03",
				"pwh_level_chaos_war_camp_dead_champion_04"
			},
			randomize_indexes = {}
		},
		pwh_chaos_war_camp_taunt_payback_reply = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_warcamp",
			category = "player_alerts_boss",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_chaos_war_camp_taunt_payback_reply_01",
				[2.0] = "pwh_chaos_war_camp_taunt_payback_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_chaos_war_camp_taunt_payback_reply_01",
				[2.0] = "pwh_chaos_war_camp_taunt_payback_reply_02"
			},
			randomize_indexes = {}
		},
		pwh_level_chaos_war_camp_success_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_chaos_war_camp_success_01",
				"pwh_level_chaos_war_camp_success_02",
				"pwh_level_chaos_war_camp_success_03",
				"pwh_level_chaos_war_camp_success_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pwh_level_chaos_war_camp_success_01",
				"pwh_level_chaos_war_camp_success_02",
				"pwh_level_chaos_war_camp_success_03",
				"pwh_level_chaos_war_camp_success_04"
			},
			randomize_indexes = {}
		},
		pwh_chaos_war_camp_challenge_reply_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_warcamp",
			category = "player_alerts_boss",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_chaos_war_camp_challenge_reply_a_01",
				[2.0] = "pwh_chaos_war_camp_challenge_reply_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_chaos_war_camp_challenge_reply_a_01",
				[2.0] = "pwh_chaos_war_camp_challenge_reply_a_02"
			},
			randomize_indexes = {}
		},
		pwh_level_chaos_war_camp_portal_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_chaos_war_camp_portal_01",
				"pwh_level_chaos_war_camp_portal_02",
				"pwh_level_chaos_war_camp_portal_03",
				"pwh_level_chaos_war_camp_portal_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pwh_level_chaos_war_camp_portal_01",
				"pwh_level_chaos_war_camp_portal_02",
				"pwh_level_chaos_war_camp_portal_03",
				"pwh_level_chaos_war_camp_portal_04"
			},
			randomize_indexes = {}
		},
		pwh_level_chaos_war_camp_which_way = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_chaos_war_camp_which_way_01",
				"pwh_level_chaos_war_camp_which_way_02",
				"pwh_level_chaos_war_camp_which_way_03",
				"pwh_level_chaos_war_camp_which_way_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pwh_level_chaos_war_camp_which_way_01",
				"pwh_level_chaos_war_camp_which_way_02",
				"pwh_level_chaos_war_camp_which_way_03",
				"pwh_level_chaos_war_camp_which_way_04"
			},
			randomize_indexes = {}
		},
		pwh_level_chaos_war_camp_outer_gate_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_chaos_war_camp_outer_gate_01",
				"pwh_level_chaos_war_camp_outer_gate_02",
				"pwh_level_chaos_war_camp_outer_gate_03",
				"pwh_level_chaos_war_camp_outer_gate_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_level_chaos_war_camp_outer_gate_01",
				"pwh_level_chaos_war_camp_outer_gate_02",
				"pwh_level_chaos_war_camp_outer_gate_03",
				"pwh_level_chaos_war_camp_outer_gate_04"
			},
			randomize_indexes = {}
		},
		pwh_chaos_war_camp_intro_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_chaos_war_camp_intro_b_01",
				[2.0] = "pwh_chaos_war_camp_intro_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_chaos_war_camp_intro_b_01",
				[2.0] = "pwh_chaos_war_camp_intro_b_02"
			},
			randomize_indexes = {}
		},
		pwh_level_chaos_war_camp_camp_view_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_chaos_war_camp_camp_view_01",
				"pwh_level_chaos_war_camp_camp_view_02",
				"pwh_level_chaos_war_camp_camp_view_03",
				"pwh_level_chaos_war_camp_camp_view_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_level_chaos_war_camp_camp_view_01",
				"pwh_level_chaos_war_camp_camp_view_02",
				"pwh_level_chaos_war_camp_camp_view_03",
				"pwh_level_chaos_war_camp_camp_view_04"
			},
			randomize_indexes = {}
		},
		pwh_level_chaos_war_camp_wall_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_chaos_war_camp_wall_01",
				"pwh_level_chaos_war_camp_wall_02",
				"pwh_level_chaos_war_camp_wall_03",
				"pwh_level_chaos_war_camp_wall_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_level_chaos_war_camp_wall_01",
				"pwh_level_chaos_war_camp_wall_02",
				"pwh_level_chaos_war_camp_wall_03",
				"pwh_level_chaos_war_camp_wall_04"
			},
			randomize_indexes = {}
		},
		pwh_level_chaos_war_camp_keep_fighting_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_chaos_war_camp_keep_fighting_01",
				"pwh_level_chaos_war_camp_keep_fighting_02",
				"pwh_level_chaos_war_camp_keep_fighting_03",
				"pwh_level_chaos_war_camp_keep_fighting_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pwh_level_chaos_war_camp_keep_fighting_01",
				"pwh_level_chaos_war_camp_keep_fighting_02",
				"pwh_level_chaos_war_camp_keep_fighting_03",
				"pwh_level_chaos_war_camp_keep_fighting_04"
			},
			randomize_indexes = {}
		},
		pwh_level_chaos_war_camp_arena_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_chaos_war_camp_arena_01",
				"pwh_level_chaos_war_camp_arena_02",
				"pwh_level_chaos_war_camp_arena_03",
				"pwh_level_chaos_war_camp_arena_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pwh_level_chaos_war_camp_arena_01",
				"pwh_level_chaos_war_camp_arena_02",
				"pwh_level_chaos_war_camp_arena_03",
				"pwh_level_chaos_war_camp_arena_04"
			},
			randomize_indexes = {}
		},
		pwh_level_chaos_war_camp_live_in_swamp = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_chaos_war_camp_live_in_swamp_01",
				"pwh_level_chaos_war_camp_live_in_swamp_02",
				"pwh_level_chaos_war_camp_live_in_swamp_03",
				"pwh_level_chaos_war_camp_live_in_swamp_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pwh_level_chaos_war_camp_live_in_swamp_01",
				"pwh_level_chaos_war_camp_live_in_swamp_02",
				"pwh_level_chaos_war_camp_live_in_swamp_03",
				"pwh_level_chaos_war_camp_live_in_swamp_04"
			},
			randomize_indexes = {}
		},
		pwh_level_chaos_war_camp_islands_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_chaos_war_camp_islands_01",
				"pwh_level_chaos_war_camp_islands_02",
				"pwh_level_chaos_war_camp_islands_03",
				"pwh_level_chaos_war_camp_islands_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_neutral"
			},
			localization_strings = {
				"pwh_level_chaos_war_camp_islands_01",
				"pwh_level_chaos_war_camp_islands_02",
				"pwh_level_chaos_war_camp_islands_03",
				"pwh_level_chaos_war_camp_islands_04"
			},
			randomize_indexes = {}
		}
	})
end

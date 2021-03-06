return function ()
	define_rule({
		name = "pbw_level_bogenhafen_slum_slum",
		response = "pbw_level_bogenhafen_slum_slum",
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
				"level_bogenhafen_slum_slum"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_slum",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_slum",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_the_58",
		response = "pbw_level_bogenhafen_slum_the_58",
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
				"level_bogenhafen_slum_the_58"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_the_58",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_the_58",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_py_level_bogenhafen_slum_the_58",
		response = "pbw_py_level_bogenhafen_slum_the_58",
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
				"level_bogenhafen_slum_the_58"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_scholar"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_the_58",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_the_58",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_river",
		response = "pbw_level_bogenhafen_slum_river",
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
				"level_bogenhafen_slum_river"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_river",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_river",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_un_level_bogenhafen_slum_river",
		response = "pbw_un_level_bogenhafen_slum_river",
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
				"level_bogenhafen_slum_river"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_unchained"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_river",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_river",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_squalor",
		response = "pbw_level_bogenhafen_slum_squalor",
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
				"level_bogenhafen_slum_squalor"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_squalor",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_squalor",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_blackfire",
		response = "pbw_level_bogenhafen_slum_blackfire",
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
				"pit_blackfire"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pit_blackfire",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pit_blackfire",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_un_level_bogenhafen_slum_blackfire",
		response = "pbw_un_level_bogenhafen_slum_blackfire",
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
				"pit_blackfire"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_unchained"
			},
			{
				"faction_memory",
				"pit_blackfire",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pit_blackfire",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_gang",
		response = "pbw_level_bogenhafen_slum_gang",
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
				"level_bogenhafen_slum_gang"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_gang",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_gang",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_find_hideout",
		response = "pbw_level_bogenhafen_slum_find_hideout",
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
				"level_bogenhafen_slum_find_hideout"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_find_hideout",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_find_hideout",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_too_quiet",
		response = "pbw_level_bogenhafen_slum_too_quiet",
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
				"level_bogenhafen_slum_too_quiet"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_too_quiet",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_too_quiet",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_stolen_goods",
		response = "pbw_level_bogenhafen_slum_stolen_goods",
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
				"level_bogenhafen_slum_stolen_goods"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_stolen_goods",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_stolen_goods",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_py_level_bogenhafen_slum_stolen_goods",
		response = "pbw_py_level_bogenhafen_slum_stolen_goods",
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
				"level_bogenhafen_slum_stolen_goods"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_scholar"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_stolen_goods",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_stolen_goods",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_foul_air",
		response = "pbw_level_bogenhafen_slum_foul_air",
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
				"level_bogenhafen_slum_foul_air"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_foul_air",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_foul_air",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_ambush",
		response = "pbw_level_bogenhafen_slum_ambush",
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
				"level_bogenhafen_slum_ambush"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_ambush",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_ambush",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_un_level_bogenhafen_slum_ambush",
		response = "pbw_un_level_bogenhafen_slum_ambush",
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
				"level_bogenhafen_slum_ambush"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_unchained"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_ambush",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_ambush",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_fortify",
		response = "pbw_level_bogenhafen_slum_fortify",
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
				"level_bogenhafen_slum_fortify"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_fortify",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_fortify",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_search",
		response = "pbw_level_bogenhafen_slum_search",
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
				"level_bogenhafen_slum_search"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_search",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_search",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_tainted_food",
		response = "pbw_level_bogenhafen_slum_tainted_food",
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
				"level_bogenhafen_slum_tainted_food"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_tainted_food",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_tainted_food",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_un_level_bogenhafen_slum_tainted_food",
		response = "pbw_un_level_bogenhafen_slum_tainted_food",
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
				"level_bogenhafen_slum_tainted_food"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_unchained"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_tainted_food",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_tainted_food",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_noble_food",
		response = "pbw_level_bogenhafen_slum_noble_food",
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
				"level_bogenhafen_slum_noble_food"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_noble_food",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_noble_food",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_py_level_bogenhafen_slum_noble_food_01",
		response = "pbw_py_level_bogenhafen_slum_noble_food_01",
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
				"level_bogenhafen_slum_noble_food"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_scholar"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_noble_food",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_noble_food",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_burn_food",
		response = "pbw_level_bogenhafen_slum_burn_food",
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
				"level_bogenhafen_slum_burn_food"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_burn_food",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_burn_food",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_py_level_bogenhafen_slum_burn_food",
		response = "pbw_py_level_bogenhafen_slum_burn_food",
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
				"level_bogenhafen_slum_burn_food"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_scholar"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_burn_food",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_burn_food",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_un_level_bogenhafen_slum_burn_food",
		response = "pbw_un_level_bogenhafen_slum_burn_food",
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
				"level_bogenhafen_slum_burn_food"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_unchained"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_burn_food",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_burn_food",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_cannon",
		response = "pbw_level_bogenhafen_slum_cannon",
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
				"level_bogenhafen_slum_cannon"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_cannon",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_cannon",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_noisy_exit",
		response = "pbw_level_bogenhafen_slum_noisy_exit",
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
				"level_bogenhafen_slum_noisy_exit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_noisy_exit",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_noisy_exit",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_un_level_bogenhafen_slum_noisy_exit",
		response = "pbw_un_level_bogenhafen_slum_noisy_exit",
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
				"level_bogenhafen_slum_noisy_exit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_unchained"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_noisy_exit",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_noisy_exit",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_escape",
		response = "pbw_level_bogenhafen_slum_escape",
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
				"level_bogenhafen_slum_escape"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_escape",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_escape",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_the_wall",
		response = "pbw_level_bogenhafen_slum_the_wall",
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
				"pbw_level_bogenhafen_slum_the_wall"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pbw_level_bogenhafen_slum_the_wall",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_level_bogenhafen_slum_the_wall",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_end",
		response = "pbw_level_bogenhafen_slum_end",
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
				"level_bogenhafen_slum_end"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_end",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_end",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_intro_a",
		response = "pbw_level_bogenhafen_slum_intro_a",
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
				"level_bogenhafen_slum_intro_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_intro_b",
		response = "pbw_level_bogenhafen_slum_intro_b",
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
				"level_bogenhafen_slum_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_intro_c",
		response = "pbw_level_bogenhafen_slum_intro_c",
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
				"level_bogenhafen_slum_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_intro_c",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_fortify_prep",
		response = "pbw_level_bogenhafen_slum_fortify_prep",
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
				"level_bogenhafen_slum_fortify_prep"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_fortify_prep",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_fortify_prep",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pbw_un_level_bogenhafen_slum_blackfire = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_un_level_bogenhafen_slum_blackfire_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_concerned"
			},
			localization_strings = {
				[1.0] = "pbw_un_level_bogenhafen_slum_blackfire_01"
			}
		},
		pbw_py_level_bogenhafen_slum_noble_food_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_py_level_bogenhafen_slum_noble_food_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_py_level_bogenhafen_slum_noble_food_01"
			}
		},
		pbw_level_bogenhafen_slum_blackfire = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_blackfire_01",
				"pbw_level_bogenhafen_slum_blackfire_02",
				"pbw_level_bogenhafen_slum_blackfire_03",
				"pbw_level_bogenhafen_slum_blackfire_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pbw_level_bogenhafen_slum_blackfire_01",
				"pbw_level_bogenhafen_slum_blackfire_02",
				"pbw_level_bogenhafen_slum_blackfire_03",
				"pbw_level_bogenhafen_slum_blackfire_04"
			},
			randomize_indexes = {}
		},
		pbw_level_bogenhafen_slum_escape = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_escape_01",
				"pbw_level_bogenhafen_slum_escape_02",
				"pbw_level_bogenhafen_slum_escape_03",
				"pbw_level_bogenhafen_slum_escape_04"
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
				"pbw_level_bogenhafen_slum_escape_01",
				"pbw_level_bogenhafen_slum_escape_02",
				"pbw_level_bogenhafen_slum_escape_03",
				"pbw_level_bogenhafen_slum_escape_04"
			},
			randomize_indexes = {}
		},
		pbw_py_level_bogenhafen_slum_stolen_goods = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_py_level_bogenhafen_slum_stolen_goods_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_py_level_bogenhafen_slum_stolen_goods_01"
			}
		},
		pbw_level_bogenhafen_slum_fortify = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_fortify_01",
				"pbw_level_bogenhafen_slum_fortify_02",
				"pbw_level_bogenhafen_slum_fortify_03",
				"pbw_level_bogenhafen_slum_fortify_04"
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
				"pbw_level_bogenhafen_slum_fortify_01",
				"pbw_level_bogenhafen_slum_fortify_02",
				"pbw_level_bogenhafen_slum_fortify_03",
				"pbw_level_bogenhafen_slum_fortify_04"
			},
			randomize_indexes = {}
		},
		pbw_un_level_bogenhafen_slum_burn_food = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_un_level_bogenhafen_slum_burn_food_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_un_level_bogenhafen_slum_burn_food_01"
			}
		},
		pbw_un_level_bogenhafen_slum_river = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_un_level_bogenhafen_slum_river_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_un_level_bogenhafen_slum_river_01"
			}
		},
		pbw_level_bogenhafen_slum_burn_food = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_burn_food_01",
				"pbw_level_bogenhafen_slum_burn_food_02",
				"pbw_level_bogenhafen_slum_burn_food_03",
				"pbw_level_bogenhafen_slum_burn_food_04"
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
				"pbw_level_bogenhafen_slum_burn_food_01",
				"pbw_level_bogenhafen_slum_burn_food_02",
				"pbw_level_bogenhafen_slum_burn_food_03",
				"pbw_level_bogenhafen_slum_burn_food_04"
			},
			randomize_indexes = {}
		},
		pbw_level_bogenhafen_slum_the_wall = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_the_wall_01",
				"pbw_level_bogenhafen_slum_the_wall_02",
				"pbw_level_bogenhafen_slum_the_wall_03",
				"pbw_level_bogenhafen_slum_the_wall_04"
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
				"pbw_level_bogenhafen_slum_the_wall_01",
				"pbw_level_bogenhafen_slum_the_wall_02",
				"pbw_level_bogenhafen_slum_the_wall_03",
				"pbw_level_bogenhafen_slum_the_wall_04"
			},
			randomize_indexes = {}
		},
		pbw_level_bogenhafen_slum_stolen_goods = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_stolen_goods_01",
				"pbw_level_bogenhafen_slum_stolen_goods_02",
				"pbw_level_bogenhafen_slum_stolen_goods_03",
				"pbw_level_bogenhafen_slum_stolen_goods_04"
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
				"pbw_level_bogenhafen_slum_stolen_goods_01",
				"pbw_level_bogenhafen_slum_stolen_goods_02",
				"pbw_level_bogenhafen_slum_stolen_goods_03",
				"pbw_level_bogenhafen_slum_stolen_goods_04"
			},
			randomize_indexes = {}
		},
		pbw_py_level_bogenhafen_slum_the_58 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_py_level_bogenhafen_slum_the_58_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_py_level_bogenhafen_slum_the_58_01"
			}
		},
		pbw_level_bogenhafen_slum_intro_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_level_bogenhafen_slum_intro_a_01",
				[2.0] = "pbw_level_bogenhafen_slum_intro_a_02"
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
				[1.0] = "pbw_level_bogenhafen_slum_intro_a_01",
				[2.0] = "pbw_level_bogenhafen_slum_intro_a_02"
			},
			randomize_indexes = {}
		},
		pbw_level_bogenhafen_slum_noisy_exit = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_noisy_exit_01",
				"pbw_level_bogenhafen_slum_noisy_exit_02",
				"pbw_level_bogenhafen_slum_noisy_exit_03",
				"pbw_level_bogenhafen_slum_noisy_exit_04"
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
				"pbw_level_bogenhafen_slum_noisy_exit_01",
				"pbw_level_bogenhafen_slum_noisy_exit_02",
				"pbw_level_bogenhafen_slum_noisy_exit_03",
				"pbw_level_bogenhafen_slum_noisy_exit_04"
			},
			randomize_indexes = {}
		},
		pbw_un_level_bogenhafen_slum_tainted_food = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_un_level_bogenhafen_slum_tainted_food_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_un_level_bogenhafen_slum_tainted_food_01"
			}
		},
		pbw_level_bogenhafen_slum_too_quiet = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_too_quiet_01",
				"pbw_level_bogenhafen_slum_too_quiet_02",
				"pbw_level_bogenhafen_slum_too_quiet_03",
				"pbw_level_bogenhafen_slum_too_quiet_04"
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
				"pbw_level_bogenhafen_slum_too_quiet_01",
				"pbw_level_bogenhafen_slum_too_quiet_02",
				"pbw_level_bogenhafen_slum_too_quiet_03",
				"pbw_level_bogenhafen_slum_too_quiet_04"
			},
			randomize_indexes = {}
		},
		pbw_level_bogenhafen_slum_the_58 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_the_58_01",
				"pbw_level_bogenhafen_slum_the_58_02",
				"pbw_level_bogenhafen_slum_the_58_03",
				"pbw_level_bogenhafen_slum_the_58_04"
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
				"pbw_level_bogenhafen_slum_the_58_01",
				"pbw_level_bogenhafen_slum_the_58_02",
				"pbw_level_bogenhafen_slum_the_58_03",
				"pbw_level_bogenhafen_slum_the_58_04"
			},
			randomize_indexes = {}
		},
		pbw_level_bogenhafen_slum_ambush = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_ambush_01",
				"pbw_level_bogenhafen_slum_ambush_02",
				"pbw_level_bogenhafen_slum_ambush_03",
				"pbw_level_bogenhafen_slum_ambush_04"
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
				"pbw_level_bogenhafen_slum_ambush_01",
				"pbw_level_bogenhafen_slum_ambush_02",
				"pbw_level_bogenhafen_slum_ambush_03",
				"pbw_level_bogenhafen_slum_ambush_04"
			},
			randomize_indexes = {}
		},
		pbw_py_level_bogenhafen_slum_burn_food = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_py_level_bogenhafen_slum_burn_food_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_py_level_bogenhafen_slum_burn_food_01"
			}
		},
		pbw_level_bogenhafen_slum_noble_food = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_noble_food_01",
				"pbw_level_bogenhafen_slum_noble_food_02",
				"pbw_level_bogenhafen_slum_noble_food_03",
				"pbw_level_bogenhafen_slum_noble_food_04"
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
				"pbw_level_bogenhafen_slum_noble_food_01",
				"pbw_level_bogenhafen_slum_noble_food_02",
				"pbw_level_bogenhafen_slum_noble_food_03",
				"pbw_level_bogenhafen_slum_noble_food_04"
			},
			randomize_indexes = {}
		},
		pbw_level_bogenhafen_slum_gang = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_gang_01",
				"pbw_level_bogenhafen_slum_gang_02",
				"pbw_level_bogenhafen_slum_gang_03",
				"pbw_level_bogenhafen_slum_gang_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_neutral",
				"face_neutral",
				"face_curious"
			},
			localization_strings = {
				"pbw_level_bogenhafen_slum_gang_01",
				"pbw_level_bogenhafen_slum_gang_02",
				"pbw_level_bogenhafen_slum_gang_03",
				"pbw_level_bogenhafen_slum_gang_04"
			},
			randomize_indexes = {}
		},
		pbw_un_level_bogenhafen_slum_noisy_exit = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_un_level_bogenhafen_slum_noisy_exit_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_un_level_bogenhafen_slum_noisy_exit_01"
			}
		},
		pbw_level_bogenhafen_slum_river = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_river_01",
				"pbw_level_bogenhafen_slum_river_02",
				"pbw_level_bogenhafen_slum_river_03",
				"pbw_level_bogenhafen_slum_river_04"
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
				"pbw_level_bogenhafen_slum_river_01",
				"pbw_level_bogenhafen_slum_river_02",
				"pbw_level_bogenhafen_slum_river_03",
				"pbw_level_bogenhafen_slum_river_04"
			},
			randomize_indexes = {}
		},
		pbw_level_bogenhafen_slum_cannon = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_cannon_01",
				"pbw_level_bogenhafen_slum_cannon_02",
				"pbw_level_bogenhafen_slum_cannon_03",
				"pbw_level_bogenhafen_slum_cannon_04"
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
				"pbw_level_bogenhafen_slum_cannon_01",
				"pbw_level_bogenhafen_slum_cannon_02",
				"pbw_level_bogenhafen_slum_cannon_03",
				"pbw_level_bogenhafen_slum_cannon_04"
			},
			randomize_indexes = {}
		},
		pbw_level_bogenhafen_slum_search = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_search_01",
				"pbw_level_bogenhafen_slum_search_02",
				"pbw_level_bogenhafen_slum_search_03",
				"pbw_level_bogenhafen_slum_search_04"
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
				"pbw_level_bogenhafen_slum_search_01",
				"pbw_level_bogenhafen_slum_search_02",
				"pbw_level_bogenhafen_slum_search_03",
				"pbw_level_bogenhafen_slum_search_04"
			},
			randomize_indexes = {}
		},
		pbw_level_bogenhafen_slum_intro_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_level_bogenhafen_slum_intro_b_01",
				[2.0] = "pbw_level_bogenhafen_slum_intro_b_02"
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
				[1.0] = "pbw_level_bogenhafen_slum_intro_b_01",
				[2.0] = "pbw_level_bogenhafen_slum_intro_b_02"
			},
			randomize_indexes = {}
		},
		pbw_level_bogenhafen_slum_squalor = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_squalor_01",
				"pbw_level_bogenhafen_slum_squalor_02",
				"pbw_level_bogenhafen_slum_squalor_03",
				"pbw_level_bogenhafen_slum_squalor_04"
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
				"pbw_level_bogenhafen_slum_squalor_01",
				"pbw_level_bogenhafen_slum_squalor_02",
				"pbw_level_bogenhafen_slum_squalor_03",
				"pbw_level_bogenhafen_slum_squalor_04"
			},
			randomize_indexes = {}
		},
		pbw_level_bogenhafen_slum_foul_air = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_foul_air_01",
				"pbw_level_bogenhafen_slum_foul_air_02",
				"pbw_level_bogenhafen_slum_foul_air_03",
				"pbw_level_bogenhafen_slum_foul_air_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pbw_level_bogenhafen_slum_foul_air_01",
				"pbw_level_bogenhafen_slum_foul_air_02",
				"pbw_level_bogenhafen_slum_foul_air_03",
				"pbw_level_bogenhafen_slum_foul_air_04"
			},
			randomize_indexes = {}
		},
		pbw_un_level_bogenhafen_slum_ambush = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_un_level_bogenhafen_slum_ambush_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_un_level_bogenhafen_slum_ambush_01"
			}
		},
		pbw_level_bogenhafen_slum_find_hideout = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_find_hideout_01",
				"pbw_level_bogenhafen_slum_find_hideout_02",
				"pbw_level_bogenhafen_slum_find_hideout_03",
				"pbw_level_bogenhafen_slum_find_hideout_04"
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
				"pbw_level_bogenhafen_slum_find_hideout_01",
				"pbw_level_bogenhafen_slum_find_hideout_02",
				"pbw_level_bogenhafen_slum_find_hideout_03",
				"pbw_level_bogenhafen_slum_find_hideout_04"
			},
			randomize_indexes = {}
		},
		pbw_level_bogenhafen_slum_tainted_food = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "cut_scene",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_tainted_food_01",
				"pbw_level_bogenhafen_slum_tainted_food_02",
				"pbw_level_bogenhafen_slum_tainted_food_03",
				"pbw_level_bogenhafen_slum_tainted_food_04"
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
				"pbw_level_bogenhafen_slum_tainted_food_01",
				"pbw_level_bogenhafen_slum_tainted_food_02",
				"pbw_level_bogenhafen_slum_tainted_food_03",
				"pbw_level_bogenhafen_slum_tainted_food_04"
			},
			randomize_indexes = {}
		},
		pbw_level_bogenhafen_slum_end = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_end_01",
				"pbw_level_bogenhafen_slum_end_02",
				"pbw_level_bogenhafen_slum_end_03",
				"pbw_level_bogenhafen_slum_end_04"
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
				"pbw_level_bogenhafen_slum_end_01",
				"pbw_level_bogenhafen_slum_end_02",
				"pbw_level_bogenhafen_slum_end_03",
				"pbw_level_bogenhafen_slum_end_04"
			},
			randomize_indexes = {}
		},
		pbw_level_bogenhafen_slum_slum = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_slum_01",
				"pbw_level_bogenhafen_slum_slum_02",
				"pbw_level_bogenhafen_slum_slum_03",
				"pbw_level_bogenhafen_slum_slum_04"
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
				"pbw_level_bogenhafen_slum_slum_01",
				"pbw_level_bogenhafen_slum_slum_02",
				"pbw_level_bogenhafen_slum_slum_03",
				"pbw_level_bogenhafen_slum_slum_04"
			},
			randomize_indexes = {}
		},
		pbw_level_bogenhafen_slum_fortify_prep = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_bogenhafen_slum_fortify_prep_01",
				"pbw_level_bogenhafen_slum_fortify_prep_02",
				"pbw_level_bogenhafen_slum_fortify_prep_03",
				"pbw_level_bogenhafen_slum_fortify_prep_04"
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
				"pbw_level_bogenhafen_slum_fortify_prep_01",
				"pbw_level_bogenhafen_slum_fortify_prep_02",
				"pbw_level_bogenhafen_slum_fortify_prep_03",
				"pbw_level_bogenhafen_slum_fortify_prep_04"
			},
			randomize_indexes = {}
		},
		pbw_level_bogenhafen_slum_intro_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_level_bogenhafen_slum_intro_c_01",
				[2.0] = "pbw_level_bogenhafen_slum_intro_c_02"
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
				[1.0] = "pbw_level_bogenhafen_slum_intro_c_01",
				[2.0] = "pbw_level_bogenhafen_slum_intro_c_02"
			},
			randomize_indexes = {}
		}
	})
end

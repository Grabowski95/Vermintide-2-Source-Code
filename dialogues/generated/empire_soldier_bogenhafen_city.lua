return function ()
	define_rule({
		name = "pes_level_bogenhafen_city_sewers",
		response = "pes_level_bogenhafen_city_sewers",
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
				"level_bogenhafen_city_sewers"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_sewers",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_sewers",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_hu_level_bogenhafen_city_sewers",
		response = "pes_hu_level_bogenhafen_city_sewers",
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
				"level_bogenhafen_city_sewers"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"es_huntsman"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_sewers",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_sewers",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_kn_level_bogenhafen_city_sewers",
		response = "pes_kn_level_bogenhafen_city_sewers",
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
				"level_bogenhafen_city_sewers"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"es_knight"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_sewers",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_sewers",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_taking_too_long",
		response = "pes_level_bogenhafen_city_taking_too_long",
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
				"level_bogenhafen_city_taking_too_long"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_taking_too_long",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_taking_too_long",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_hu_level_bogenhafen_city_taking_too_long",
		response = "pes_hu_level_bogenhafen_city_taking_too_long",
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
				"level_bogenhafen_city_taking_too_long"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"es_huntsman"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_taking_too_long",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_taking_too_long",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_torch",
		response = "pes_level_bogenhafen_city_torch",
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
				"level_bogenhafen_city_torch"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_torch",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_torch",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_kn_level_bogenhafen_city_torch_01",
		response = "pes_kn_level_bogenhafen_city_torch_01",
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
				"level_bogenhafen_city_torch"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"es_knight"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_torch",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_torch",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_blocked",
		response = "pes_level_bogenhafen_city_blocked",
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
				"level_bogenhafen_city_blocked"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_blocked",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_blocked",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_hu_level_bogenhafen_city_blocked",
		response = "pes_hu_level_bogenhafen_city_blocked",
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
				"level_bogenhafen_city_blocked"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"es_huntsman"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_blocked",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_blocked",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_braziers",
		response = "pes_level_bogenhafen_city_braziers",
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
				"level_bogenhafen_city_braziers"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_braziers",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_braziers",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_here_they_come",
		response = "pes_level_bogenhafen_city_here_they_come",
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
				"level_bogenhafen_city_here_they_come"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_here_they_come",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_here_they_come",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_kn_level_bogenhafen_city_here_they_come",
		response = "pes_kn_level_bogenhafen_city_here_they_come",
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
				"level_bogenhafen_city_here_they_come"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"es_knight"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_here_they_come",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_here_they_come",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_way_out",
		response = "pes_level_bogenhafen_city_way_out",
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
				"level_bogenhafen_city_way_out"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_way_out",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_way_out",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_hu_level_bogenhafen_city_way_out",
		response = "pes_hu_level_bogenhafen_city_way_out",
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
				"level_bogenhafen_city_way_out"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"es_knight"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_way_out",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_way_out",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_raining",
		response = "pes_level_bogenhafen_city_raining",
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
				"level_bogenhafen_city_raining"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_raining",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_raining",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_smoke_pillar",
		response = "pes_level_bogenhafen_city_smoke_pillar",
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
				"level_bogenhafen_city_smoke_pillar"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_smoke_pillar",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_smoke_pillar",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_hu_level_bogenhafen_city_smoke_pillar",
		response = "pes_hu_level_bogenhafen_city_smoke_pillar",
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
				"level_bogenhafen_city_smoke_pillar"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"es_huntsman"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_smoke_pillar",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_smoke_pillar",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_revelry",
		response = "pes_level_bogenhafen_city_revelry",
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
				"level_bogenhafen_city_revelry"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_revelry",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_revelry",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_bogenauer",
		response = "pes_level_bogenhafen_city_bogenauer",
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
				"level_bogenhafen_city_bogenauer"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_bogenauer",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_bogenauer",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_hu_level_bogenhafen_city_bogenauer_01",
		response = "pes_hu_level_bogenhafen_city_bogenauer_01",
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
				"level_bogenhafen_city_bogenauer"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"es_huntsman"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_bogenauer",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_bogenauer",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_infestation",
		response = "pes_level_bogenhafen_city_infestation",
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
				"level_bogenhafen_city_infestation"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_infestation",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_infestation",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_kn_level_bogenhafen_city_infestation",
		response = "pes_kn_level_bogenhafen_city_infestation",
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
				"level_bogenhafen_city_infestation"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"es_knight"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_infestation",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_infestation",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_find_priest_key",
		response = "pes_level_bogenhafen_city_find_priest_key",
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
				"level_bogenhafen_city_find_priest_key"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_level_bogenhafen_city_find_priest_key",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_level_bogenhafen_city_find_priest_key",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_dead_priest",
		response = "pes_level_bogenhafen_city_dead_priest",
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
				"level_bogenhafen_city_dead_priest"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_dead_priest",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_dead_priest",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_temple",
		response = "pes_level_bogenhafen_city_temple",
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
				"level_bogenhafen_city_temple"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_temple",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_temple",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_defiled",
		response = "pes_level_bogenhafen_city_defiled",
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
				"level_bogenhafen_city_defiled"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_defiled",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_defiled",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_artefact",
		response = "pes_level_bogenhafen_city_artefact",
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
				"level_bogenhafen_city_artefact"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_artefact",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_artefact",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_found_artefact",
		response = "pes_level_bogenhafen_city_found_artefact",
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
				"level_bogenhafen_city_found_artefact"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_found_artefact",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_found_artefact",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_escape",
		response = "pes_level_bogenhafen_city_escape",
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
				"level_bogenhafen_city_escape"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_escape",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_escape",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_keep_moving",
		response = "pes_level_bogenhafen_city_keep_moving",
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
				"level_bogenhafen_city_keep_moving"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_keep_moving",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_keep_moving",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_kn_level_bogenhafen_city_keep_moving",
		response = "pes_kn_level_bogenhafen_city_keep_moving",
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
				"level_bogenhafen_city_keep_moving"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"es_knight"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_keep_moving",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_keep_moving",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_objective_find",
		response = "pes_level_bogenhafen_city_objective_find",
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
				"level_bogenhafen_city_objective_find"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_objective_find",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_objective_find",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_level_bogenhafen_city_objective_next",
		name = "pes_level_bogenhafen_city_objective_next",
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
				"level_bogenhafen_city_objective_next"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_objective_last",
		response = "pes_level_bogenhafen_city_objective_last",
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
				"level_bogenhafen_city_objective_last"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_objective_last",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_objective_last",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_noisy",
		response = "pes_level_bogenhafen_city_noisy",
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
				"level_bogenhafen_city_noisy"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_noisy",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_noisy",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_sanctum",
		response = "pes_level_bogenhafen_city_sanctum",
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
				"level_bogenhafen_city_sanctum"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_sanctum",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_sanctum",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_sanctum_books",
		response = "pes_level_bogenhafen_city_sanctum_books",
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
				"level_bogenhafen_city_sanctum_books"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_sanctum_books",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_sanctum_books",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_goblin",
		response = "pes_level_bogenhafen_city_goblin",
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
				"level_bogenhafen_city_goblin"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_goblin",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_goblin",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_intro_a",
		response = "pes_level_bogenhafen_city_intro_a",
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
				"level_bogenhafen_city_intro_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_intro_b",
		response = "pes_level_bogenhafen_city_intro_b",
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
				"level_bogenhafen_city_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_intro_c",
		response = "pes_level_bogenhafen_city_intro_c",
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
				"level_bogenhafen_city_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_intro_c",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pes_level_bogenhafen_city_intro_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_bogenhafen_city_intro_b_01",
				[2.0] = "pes_level_bogenhafen_city_intro_b_02"
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
				[1.0] = "pes_level_bogenhafen_city_intro_b_01",
				[2.0] = "pes_level_bogenhafen_city_intro_b_02"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_temple = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_temple_01",
				"pes_level_bogenhafen_city_temple_02",
				"pes_level_bogenhafen_city_temple_03",
				"pes_level_bogenhafen_city_temple_04"
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
				"pes_level_bogenhafen_city_temple_01",
				"pes_level_bogenhafen_city_temple_02",
				"pes_level_bogenhafen_city_temple_03",
				"pes_level_bogenhafen_city_temple_04"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_blocked = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_blocked_01",
				"pes_level_bogenhafen_city_blocked_02",
				"pes_level_bogenhafen_city_blocked_03",
				"pes_level_bogenhafen_city_blocked_04"
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
				"pes_level_bogenhafen_city_blocked_01",
				"pes_level_bogenhafen_city_blocked_02",
				"pes_level_bogenhafen_city_blocked_03",
				"pes_level_bogenhafen_city_blocked_04"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_goblin = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_goblin_01",
				"pes_level_bogenhafen_city_goblin_02",
				"pes_level_bogenhafen_city_goblin_03",
				"pes_level_bogenhafen_city_goblin_04"
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
				"pes_level_bogenhafen_city_goblin_01",
				"pes_level_bogenhafen_city_goblin_02",
				"pes_level_bogenhafen_city_goblin_03",
				"pes_level_bogenhafen_city_goblin_04"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_infestation = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_infestation_01",
				"pes_level_bogenhafen_city_infestation_02",
				"pes_level_bogenhafen_city_infestation_03",
				"pes_level_bogenhafen_city_infestation_04"
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
				"pes_level_bogenhafen_city_infestation_01",
				"pes_level_bogenhafen_city_infestation_02",
				"pes_level_bogenhafen_city_infestation_03",
				"pes_level_bogenhafen_city_infestation_04"
			},
			randomize_indexes = {}
		},
		pes_hu_level_bogenhafen_city_smoke_pillar = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_hu_level_bogenhafen_city_smoke_pillar_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_hu_level_bogenhafen_city_smoke_pillar_01"
			}
		},
		pes_level_bogenhafen_city_taking_too_long = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_taking_too_long_01",
				"pes_level_bogenhafen_city_taking_too_long_02",
				"pes_level_bogenhafen_city_taking_too_long_03",
				"pes_level_bogenhafen_city_taking_too_long_04"
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
				"pes_level_bogenhafen_city_taking_too_long_01",
				"pes_level_bogenhafen_city_taking_too_long_02",
				"pes_level_bogenhafen_city_taking_too_long_03",
				"pes_level_bogenhafen_city_taking_too_long_04"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_objective_last = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_objective_last_01",
				"pes_level_bogenhafen_city_objective_last_02",
				"pes_level_bogenhafen_city_objective_last_03",
				"pes_level_bogenhafen_city_objective_last_04"
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
				"pes_level_bogenhafen_city_objective_last_01",
				"pes_level_bogenhafen_city_objective_last_02",
				"pes_level_bogenhafen_city_objective_last_03",
				"pes_level_bogenhafen_city_objective_last_04"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_sewers = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_sewers_01",
				"pes_level_bogenhafen_city_sewers_02",
				"pes_level_bogenhafen_city_sewers_03",
				"pes_level_bogenhafen_city_sewers_04"
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
				"pes_level_bogenhafen_city_sewers_01",
				"pes_level_bogenhafen_city_sewers_02",
				"pes_level_bogenhafen_city_sewers_03",
				"pes_level_bogenhafen_city_sewers_04"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_here_they_come = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_here_they_come_01",
				"pes_level_bogenhafen_city_here_they_come_02",
				"pes_level_bogenhafen_city_here_they_come_03",
				"pes_level_bogenhafen_city_here_they_come_04"
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
				"pes_level_bogenhafen_city_here_they_come_01",
				"pes_level_bogenhafen_city_here_they_come_02",
				"pes_level_bogenhafen_city_here_they_come_03",
				"pes_level_bogenhafen_city_here_they_come_04"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_defiled = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_defiled_01",
				"pes_level_bogenhafen_city_defiled_02",
				"pes_level_bogenhafen_city_defiled_03",
				"pes_level_bogenhafen_city_defiled_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_level_bogenhafen_city_defiled_01",
				"pes_level_bogenhafen_city_defiled_02",
				"pes_level_bogenhafen_city_defiled_03",
				"pes_level_bogenhafen_city_defiled_04"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_artefact = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "cut_scene",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_artefact_01",
				"pes_level_bogenhafen_city_artefact_02",
				"pes_level_bogenhafen_city_artefact_03",
				"pes_level_bogenhafen_city_artefact_04"
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
				"pes_level_bogenhafen_city_artefact_01",
				"pes_level_bogenhafen_city_artefact_02",
				"pes_level_bogenhafen_city_artefact_03",
				"pes_level_bogenhafen_city_artefact_04"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_find_priest_key = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_find_priest_key_01",
				"pes_level_bogenhafen_city_find_priest_key_02",
				"pes_level_bogenhafen_city_find_priest_key_03",
				"pes_level_bogenhafen_city_find_priest_key_04"
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
				"pes_level_bogenhafen_city_find_priest_key_01",
				"pes_level_bogenhafen_city_find_priest_key_02",
				"pes_level_bogenhafen_city_find_priest_key_03",
				"pes_level_bogenhafen_city_find_priest_key_04"
			},
			randomize_indexes = {}
		},
		pes_kn_level_bogenhafen_city_sewers = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_kn_level_bogenhafen_city_sewers_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_kn_level_bogenhafen_city_sewers_01"
			}
		},
		pes_level_bogenhafen_city_torch = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_torch_01",
				"pes_level_bogenhafen_city_torch_02",
				"pes_level_bogenhafen_city_torch_03",
				"pes_level_bogenhafen_city_torch_04"
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
				"pes_level_bogenhafen_city_torch_01",
				"pes_level_bogenhafen_city_torch_02",
				"pes_level_bogenhafen_city_torch_03",
				"pes_level_bogenhafen_city_torch_04"
			},
			randomize_indexes = {}
		},
		pes_kn_level_bogenhafen_city_here_they_come = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_kn_level_bogenhafen_city_here_they_come_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_concerned"
			},
			localization_strings = {
				[1.0] = "pes_kn_level_bogenhafen_city_here_they_come_01"
			}
		},
		pes_level_bogenhafen_city_intro_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_bogenhafen_city_intro_c_01",
				[2.0] = "pes_level_bogenhafen_city_intro_c_02"
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
				[1.0] = "pes_level_bogenhafen_city_intro_c_01",
				[2.0] = "pes_level_bogenhafen_city_intro_c_02"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_raining = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_raining_01",
				"pes_level_bogenhafen_city_raining_02",
				"pes_level_bogenhafen_city_raining_03",
				"pes_level_bogenhafen_city_raining_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			localization_strings = {
				"pes_level_bogenhafen_city_raining_01",
				"pes_level_bogenhafen_city_raining_02",
				"pes_level_bogenhafen_city_raining_03",
				"pes_level_bogenhafen_city_raining_04"
			},
			randomize_indexes = {}
		},
		pes_hu_level_bogenhafen_city_way_out = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_hu_level_bogenhafen_city_way_out_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_hu_level_bogenhafen_city_way_out_01"
			}
		},
		pes_level_bogenhafen_city_intro_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_bogenhafen_city_intro_a_01",
				[2.0] = "pes_level_bogenhafen_city_intro_a_02"
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
				[1.0] = "pes_level_bogenhafen_city_intro_a_01",
				[2.0] = "pes_level_bogenhafen_city_intro_a_02"
			},
			randomize_indexes = {}
		},
		pes_kn_level_bogenhafen_city_keep_moving = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_kn_level_bogenhafen_city_keep_moving_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_kn_level_bogenhafen_city_keep_moving_01"
			}
		},
		pes_level_bogenhafen_city_sanctum_books = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_sanctum_books_01",
				"pes_level_bogenhafen_city_sanctum_books_02",
				"pes_level_bogenhafen_city_sanctum_books_03",
				"pes_level_bogenhafen_city_sanctum_books_04"
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
				"pes_level_bogenhafen_city_sanctum_books_01",
				"pes_level_bogenhafen_city_sanctum_books_02",
				"pes_level_bogenhafen_city_sanctum_books_03",
				"pes_level_bogenhafen_city_sanctum_books_04"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_sanctum = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_bogenhafen_city_sanctum_01",
				[2.0] = "pes_level_bogenhafen_city_sanctum_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_level_bogenhafen_city_sanctum_01",
				[2.0] = "pes_level_bogenhafen_city_sanctum_02"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_found_artefact = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_found_artefact_01",
				"pes_level_bogenhafen_city_found_artefact_02",
				"pes_level_bogenhafen_city_found_artefact_03",
				"pes_level_bogenhafen_city_found_artefact_04"
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
				"pes_level_bogenhafen_city_found_artefact_01",
				"pes_level_bogenhafen_city_found_artefact_02",
				"pes_level_bogenhafen_city_found_artefact_03",
				"pes_level_bogenhafen_city_found_artefact_04"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_objective_next = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_objective_next_01",
				"pes_level_bogenhafen_city_objective_next_02",
				"pes_level_bogenhafen_city_objective_next_03",
				"pes_level_bogenhafen_city_objective_next_04"
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
				"pes_level_bogenhafen_city_objective_next_01",
				"pes_level_bogenhafen_city_objective_next_02",
				"pes_level_bogenhafen_city_objective_next_03",
				"pes_level_bogenhafen_city_objective_next_04"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_keep_moving = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_keep_moving_01",
				"pes_level_bogenhafen_city_keep_moving_02",
				"pes_level_bogenhafen_city_keep_moving_03",
				"pes_level_bogenhafen_city_keep_moving_04"
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
				"pes_level_bogenhafen_city_keep_moving_01",
				"pes_level_bogenhafen_city_keep_moving_02",
				"pes_level_bogenhafen_city_keep_moving_03",
				"pes_level_bogenhafen_city_keep_moving_04"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_objective_find = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_objective_find_01",
				"pes_level_bogenhafen_city_objective_find_02",
				"pes_level_bogenhafen_city_objective_find_03",
				"pes_level_bogenhafen_city_objective_find_04"
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
				"pes_level_bogenhafen_city_objective_find_01",
				"pes_level_bogenhafen_city_objective_find_02",
				"pes_level_bogenhafen_city_objective_find_03",
				"pes_level_bogenhafen_city_objective_find_04"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_bogenauer = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_bogenauer_01",
				"pes_level_bogenhafen_city_bogenauer_02",
				"pes_level_bogenhafen_city_bogenauer_03",
				"pes_level_bogenhafen_city_bogenauer_04"
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
				"pes_level_bogenhafen_city_bogenauer_01",
				"pes_level_bogenhafen_city_bogenauer_02",
				"pes_level_bogenhafen_city_bogenauer_03",
				"pes_level_bogenhafen_city_bogenauer_04"
			},
			randomize_indexes = {}
		},
		pes_hu_level_bogenhafen_city_bogenauer_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_hu_level_bogenhafen_city_bogenauer_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_hu_level_bogenhafen_city_bogenauer_01"
			}
		},
		pes_kn_level_bogenhafen_city_infestation = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_kn_level_bogenhafen_city_infestation_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_kn_level_bogenhafen_city_infestation_01"
			}
		},
		pes_level_bogenhafen_city_way_out = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_way_out_01",
				"pes_level_bogenhafen_city_way_out_02",
				"pes_level_bogenhafen_city_way_out_03",
				"pes_level_bogenhafen_city_way_out_04"
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
				"pes_level_bogenhafen_city_way_out_01",
				"pes_level_bogenhafen_city_way_out_02",
				"pes_level_bogenhafen_city_way_out_03",
				"pes_level_bogenhafen_city_way_out_04"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_revelry = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_revelry_01",
				"pes_level_bogenhafen_city_revelry_02",
				"pes_level_bogenhafen_city_revelry_03",
				"pes_level_bogenhafen_city_revelry_04"
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
				"pes_level_bogenhafen_city_revelry_01",
				"pes_level_bogenhafen_city_revelry_02",
				"pes_level_bogenhafen_city_revelry_03",
				"pes_level_bogenhafen_city_revelry_04"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_escape = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_escape_01",
				"pes_level_bogenhafen_city_escape_02",
				"pes_level_bogenhafen_city_escape_03",
				"pes_level_bogenhafen_city_escape_04"
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
				"pes_level_bogenhafen_city_escape_01",
				"pes_level_bogenhafen_city_escape_02",
				"pes_level_bogenhafen_city_escape_03",
				"pes_level_bogenhafen_city_escape_04"
			},
			randomize_indexes = {}
		},
		pes_kn_level_bogenhafen_city_torch_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_kn_level_bogenhafen_city_torch_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_kn_level_bogenhafen_city_torch_01"
			}
		},
		pes_level_bogenhafen_city_noisy = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_noisy_01",
				"pes_level_bogenhafen_city_noisy_02",
				"pes_level_bogenhafen_city_noisy_03",
				"pes_level_bogenhafen_city_noisy_04"
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
				"pes_level_bogenhafen_city_noisy_01",
				"pes_level_bogenhafen_city_noisy_02",
				"pes_level_bogenhafen_city_noisy_03",
				"pes_level_bogenhafen_city_noisy_04"
			},
			randomize_indexes = {}
		},
		pes_hu_level_bogenhafen_city_taking_too_long = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_hu_level_bogenhafen_city_taking_too_long_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_concerned"
			},
			localization_strings = {
				[1.0] = "pes_hu_level_bogenhafen_city_taking_too_long_01"
			}
		},
		pes_level_bogenhafen_city_dead_priest = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_dead_priest_01",
				"pes_level_bogenhafen_city_dead_priest_02",
				"pes_level_bogenhafen_city_dead_priest_03",
				"pes_level_bogenhafen_city_dead_priest_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_sadness",
				"face_sadness",
				"face_sadness",
				"face_sadness"
			},
			localization_strings = {
				"pes_level_bogenhafen_city_dead_priest_01",
				"pes_level_bogenhafen_city_dead_priest_02",
				"pes_level_bogenhafen_city_dead_priest_03",
				"pes_level_bogenhafen_city_dead_priest_04"
			},
			randomize_indexes = {}
		},
		pes_hu_level_bogenhafen_city_blocked = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_hu_level_bogenhafen_city_blocked_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pes_hu_level_bogenhafen_city_blocked_01"
			}
		},
		pes_hu_level_bogenhafen_city_sewers = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_hu_level_bogenhafen_city_sewers_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_hu_level_bogenhafen_city_sewers_01"
			}
		},
		pes_level_bogenhafen_city_braziers = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_braziers_01",
				"pes_level_bogenhafen_city_braziers_02",
				"pes_level_bogenhafen_city_braziers_03",
				"pes_level_bogenhafen_city_braziers_04"
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
				"pes_level_bogenhafen_city_braziers_01",
				"pes_level_bogenhafen_city_braziers_02",
				"pes_level_bogenhafen_city_braziers_03",
				"pes_level_bogenhafen_city_braziers_04"
			},
			randomize_indexes = {}
		},
		pes_level_bogenhafen_city_smoke_pillar = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_level_bogenhafen_city_smoke_pillar_01",
				"pes_level_bogenhafen_city_smoke_pillar_02",
				"pes_level_bogenhafen_city_smoke_pillar_03",
				"pes_level_bogenhafen_city_smoke_pillar_04"
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
				"pes_level_bogenhafen_city_smoke_pillar_01",
				"pes_level_bogenhafen_city_smoke_pillar_02",
				"pes_level_bogenhafen_city_smoke_pillar_03",
				"pes_level_bogenhafen_city_smoke_pillar_04"
			},
			randomize_indexes = {}
		}
	})
end

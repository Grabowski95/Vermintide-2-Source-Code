return function ()
	define_rule({
		name = "pbw_objective_cemetery_through_crypt_a",
		response = "pbw_objective_cemetery_through_crypt_a",
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
				"objective_cemetery_through_crypt_a"
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
				"time_since_objective_cemetery_through_crypt_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_through_crypt_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_objective_cemetery_spotting_mausoleum",
		response = "pbw_objective_cemetery_spotting_mausoleum",
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
				"objective_cemetery_spotting_mausoleum"
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
				"time_since_objective_cemetery_spotting_mausoleum",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_spotting_mausoleum",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_objective_cemetery_spotting_plague_brew_stains",
		response = "pbw_objective_cemetery_spotting_plague_brew_stains",
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
				"objective_cemetery_spotting_plague_brew_stains"
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
				"time_since_cemetery_spotting_plague_brew_stains",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_cemetery_spotting_plague_brew_stains",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_objective_cemetery_spotting_crypt_maze",
		response = "pbw_objective_cemetery_spotting_crypt_maze",
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
				"objective_cemetery_spotting_crypt_maze"
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
				"time_since_objective_cemetery_spotting_crypt_maze",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_spotting_crypt_maze",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_objective_cemetery_through_crypt_b",
		response = "pbw_objective_cemetery_through_crypt_b",
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
				"objective_cemetery_through_crypt_b"
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
				"time_since_objective_cemetery_through_crypt_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_through_crypt_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_objective_cemetery_spotting_graveyard",
		response = "pbw_objective_cemetery_spotting_graveyard",
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
				"objective_cemetery_spotting_graveyard"
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
				"time_since_objective_cemetery_spotting_graveyard",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_spotting_graveyard",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_objective_cemetery_spotting_hedge_maze",
		response = "pbw_objective_cemetery_spotting_hedge_maze",
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
				"objective_cemetery_spotting_hedge_maze"
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
				"time_since_objective_cemetery_spotting_hedge_maze",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_spotting_hedge_maze",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_objective_cemetery_spotting_plague_pyre",
		response = "pbw_objective_cemetery_spotting_plague_pyre",
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
				"objective_cemetery_spotting_plague_pyre"
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
				"time_since_objective_cemetery_spotting_plague_pyre",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_spotting_plague_pyre",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_objective_cemetery_through_crypt_c",
		response = "pbw_objective_cemetery_through_crypt_c",
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
				"objective_cemetery_through_crypt_c"
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
				"time_since_objective_cemetery_through_crypt_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_through_crypt_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_objective_cemetery_spotting_skaven_tunnels",
		response = "pbw_objective_cemetery_spotting_skaven_tunnels",
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
				"objective_cemetery_spotting_skaven_tunnel"
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
				"time_since_objective_cemetery_spotting_skaven_tunnel",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_spotting_skaven_tunnel",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_objective_cemetery_spotting_plague_cauldron",
		response = "pbw_objective_cemetery_spotting_plague_cauldron",
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
				"objective_cemetery_spotting_plague_cauldron"
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
				"time_since_objective_cemetery_spotting_plague_cauldron",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_spotting_plague_cauldron",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_objective_cemetery_destroyed_plague_cauldron",
		response = "pbw_objective_cemetery_destroyed_plague_cauldron",
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
				"objective_cemetery_destroyed_plague_cauldron"
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
				"time_since_objective_cemetery_destroyed_plague_cauldron",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_destroyed_plague_cauldron",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_objective_cemetery_spotting_victim",
		response = "pbw_objective_cemetery_spotting_victim",
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
				"objective_cemetery_spotting_victim"
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
				"time_since_objective_cemetery_spotting_victim",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_spotting_victim",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_objective_cemetery_bringing_down_first_attachment",
		response = "pbw_objective_cemetery_bringing_down_first_attachment",
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
				"objective_cemetery_bringing_down_first_attachment"
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
				"time_since_objective_cemetery_bringing_down_first_attachment",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_bringing_down_first_attachment",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_objective_cemetery_bringing_down_second_attachment",
		response = "pbw_objective_cemetery_bringing_down_second_attachment",
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
				"objective_cemetery_bringing_down_second_attachment"
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
				"time_since_objective_cemetery_bringing_down_second_attachment",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_bringing_down_second_attachment",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_objective_cemetery_bringing_down_third_attachment",
		response = "pbw_objective_cemetery_bringing_down_third_attachment",
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
				"objective_cemetery_bringing_down_third_attachment"
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
				"time_since_objective_cemetery_bringing_down_third_attachment",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_bringing_down_third_attachment",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_objective_cemetery_bringing_down_fourth_attachment",
		response = "pbw_objective_cemetery_bringing_down_fourth_attachment",
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
				"objective_cemetery_bringing_down_fourth_attachment"
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
				"time_since_objective_cemetery_bringing_down_fourth_attachment",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_bringing_down_fourth_attachment",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_objective_cemetery_spotting_the_attachements",
		response = "pbw_objective_cemetery_spotting_the_attachements",
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
				"objective_cemetery_spotting_the_attachements"
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
				"time_since_objective_cemetery_spotting_the_attachements",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_spotting_the_attachements",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_objective_cemetery_done",
		response = "pbw_objective_cemetery_done",
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
				"objective_cemetery_done"
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
				"time_since_objective_cemetery_done",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_cemetery_done",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_cemetary_intro",
		response = "pbw_cemetary_intro",
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
				"objective_cemetery_intro"
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
				"time_since_cemetary_intro",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_cemetary_intro",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_cemetary_intro_b",
		response = "pbw_cemetary_intro_b",
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
				"cemetary_intro"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"time_since_cemetary_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_cemetary_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_cemetary_intro_c",
		response = "pbw_cemetary_intro_c",
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
				"cemetary_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"time_since_cemetary_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_cemetary_intro_c",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pbw_objective_cemetery_through_crypt_a = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_through_crypt_a_01",
				"pbw_objective_cemetery_through_crypt_a_02",
				"pbw_objective_cemetery_through_crypt_a_03",
				"pbw_objective_cemetery_through_crypt_a_04"
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
				"pbw_objective_cemetery_through_crypt_a_01",
				"pbw_objective_cemetery_through_crypt_a_02",
				"pbw_objective_cemetery_through_crypt_a_03",
				"pbw_objective_cemetery_through_crypt_a_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_hedge_maze = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_hedge_maze_01",
				"pbw_objective_cemetery_spotting_hedge_maze_02",
				"pbw_objective_cemetery_spotting_hedge_maze_03",
				"pbw_objective_cemetery_spotting_hedge_maze_04"
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
				"pbw_objective_cemetery_spotting_hedge_maze_01",
				"pbw_objective_cemetery_spotting_hedge_maze_02",
				"pbw_objective_cemetery_spotting_hedge_maze_03",
				"pbw_objective_cemetery_spotting_hedge_maze_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_the_attachements = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_the_attachements_01",
				"pbw_objective_cemetery_spotting_the_attachements_02",
				"pbw_objective_cemetery_spotting_the_attachements_03",
				"pbw_objective_cemetery_spotting_the_attachements_04"
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
				"pbw_objective_cemetery_spotting_the_attachements_01",
				"pbw_objective_cemetery_spotting_the_attachements_02",
				"pbw_objective_cemetery_spotting_the_attachements_03",
				"pbw_objective_cemetery_spotting_the_attachements_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_graveyard = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_graveyard_01",
				"pbw_objective_cemetery_spotting_graveyard_02",
				"pbw_objective_cemetery_spotting_graveyard_03",
				"pbw_objective_cemetery_spotting_graveyard_04"
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
				"pbw_objective_cemetery_spotting_graveyard_01",
				"pbw_objective_cemetery_spotting_graveyard_02",
				"pbw_objective_cemetery_spotting_graveyard_03",
				"pbw_objective_cemetery_spotting_graveyard_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_victim = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_victim_01",
				"pbw_objective_cemetery_spotting_victim_02",
				"pbw_objective_cemetery_spotting_victim_03",
				"pbw_objective_cemetery_spotting_victim_04"
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
				"pbw_objective_cemetery_spotting_victim_01",
				"pbw_objective_cemetery_spotting_victim_02",
				"pbw_objective_cemetery_spotting_victim_03",
				"pbw_objective_cemetery_spotting_victim_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_through_crypt_c = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_through_crypt_c_01",
				"pbw_objective_cemetery_through_crypt_c_02",
				"pbw_objective_cemetery_through_crypt_c_03",
				"pbw_objective_cemetery_through_crypt_c_04"
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
				"pbw_objective_cemetery_through_crypt_c_01",
				"pbw_objective_cemetery_through_crypt_c_02",
				"pbw_objective_cemetery_through_crypt_c_03",
				"pbw_objective_cemetery_through_crypt_c_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_plague_brew_stains = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_plague_brew_stains_01",
				"pbw_objective_cemetery_spotting_plague_brew_stains_02",
				"pbw_objective_cemetery_spotting_plague_brew_stains_03",
				"pbw_objective_cemetery_spotting_plague_brew_stains_04"
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
				"pbw_objective_cemetery_spotting_plague_brew_stains_01",
				"pbw_objective_cemetery_spotting_plague_brew_stains_02",
				"pbw_objective_cemetery_spotting_plague_brew_stains_03",
				"pbw_objective_cemetery_spotting_plague_brew_stains_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_skaven_tunnels = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_skaven_tunnels_01",
				"pbw_objective_cemetery_spotting_skaven_tunnels_02",
				"pbw_objective_cemetery_spotting_skaven_tunnels_03",
				"pbw_objective_cemetery_spotting_skaven_tunnels_04"
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
				"pbw_objective_cemetery_spotting_skaven_tunnels_01",
				"pbw_objective_cemetery_spotting_skaven_tunnels_02",
				"pbw_objective_cemetery_spotting_skaven_tunnels_03",
				"pbw_objective_cemetery_spotting_skaven_tunnels_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_bringing_down_first_attachment = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_bringing_down_first_attachment_01",
				"pbw_objective_cemetery_bringing_down_first_attachment_02",
				"pbw_objective_cemetery_bringing_down_first_attachment_03",
				"pbw_objective_cemetery_bringing_down_first_attachment_04"
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
				"pbw_objective_cemetery_bringing_down_first_attachment_01",
				"pbw_objective_cemetery_bringing_down_first_attachment_02",
				"pbw_objective_cemetery_bringing_down_first_attachment_03",
				"pbw_objective_cemetery_bringing_down_first_attachment_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_bringing_down_third_attachment = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_bringing_down_third_attachment_01",
				"pbw_objective_cemetery_bringing_down_third_attachment_02",
				"pbw_objective_cemetery_bringing_down_third_attachment_03",
				"pbw_objective_cemetery_bringing_down_third_attachment_04"
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
				"pbw_objective_cemetery_bringing_down_third_attachment_01",
				"pbw_objective_cemetery_bringing_down_third_attachment_02",
				"pbw_objective_cemetery_bringing_down_third_attachment_03",
				"pbw_objective_cemetery_bringing_down_third_attachment_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_destroyed_plague_cauldron = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_destroyed_plague_cauldron_01",
				"pbw_objective_cemetery_destroyed_plague_cauldron_02",
				"pbw_objective_cemetery_destroyed_plague_cauldron_03",
				"pbw_objective_cemetery_destroyed_plague_cauldron_04"
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
				"pbw_objective_cemetery_destroyed_plague_cauldron_01",
				"pbw_objective_cemetery_destroyed_plague_cauldron_02",
				"pbw_objective_cemetery_destroyed_plague_cauldron_03",
				"pbw_objective_cemetery_destroyed_plague_cauldron_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_done = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_done_01",
				"pbw_objective_cemetery_done_02",
				"pbw_objective_cemetery_done_03",
				"pbw_objective_cemetery_done_04"
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
				"pbw_objective_cemetery_done_01",
				"pbw_objective_cemetery_done_02",
				"pbw_objective_cemetery_done_03",
				"pbw_objective_cemetery_done_04"
			},
			randomize_indexes = {}
		},
		pbw_cemetary_intro_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_cemetary_intro_c_01",
				[2.0] = "pbw_cemetary_intro_c_02"
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
				[1.0] = "pbw_cemetary_intro_c_01",
				[2.0] = "pbw_cemetary_intro_c_02"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_plague_pyre = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_plague_pyre_01",
				"pbw_objective_cemetery_spotting_plague_pyre_02",
				"pbw_objective_cemetery_spotting_plague_pyre_03",
				"pbw_objective_cemetery_spotting_plague_pyre_04"
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
				"pbw_objective_cemetery_spotting_plague_pyre_01",
				"pbw_objective_cemetery_spotting_plague_pyre_02",
				"pbw_objective_cemetery_spotting_plague_pyre_03",
				"pbw_objective_cemetery_spotting_plague_pyre_04"
			},
			randomize_indexes = {}
		},
		pbw_cemetary_intro_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_cemetary_intro_b_01",
				[2.0] = "pbw_cemetary_intro_b_02"
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
				[1.0] = "pbw_cemetary_intro_b_01",
				[2.0] = "pbw_cemetary_intro_b_02"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_crypt_maze = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_crypt_maze_01",
				"pbw_objective_cemetery_spotting_crypt_maze_02",
				"pbw_objective_cemetery_spotting_crypt_maze_03",
				"pbw_objective_cemetery_spotting_crypt_maze_04"
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
				"pbw_objective_cemetery_spotting_crypt_maze_01",
				"pbw_objective_cemetery_spotting_crypt_maze_02",
				"pbw_objective_cemetery_spotting_crypt_maze_03",
				"pbw_objective_cemetery_spotting_crypt_maze_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_through_crypt_b = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_through_crypt_b_01",
				"pbw_objective_cemetery_through_crypt_b_02",
				"pbw_objective_cemetery_through_crypt_b_03",
				"pbw_objective_cemetery_through_crypt_b_04"
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
				"pbw_objective_cemetery_through_crypt_b_01",
				"pbw_objective_cemetery_through_crypt_b_02",
				"pbw_objective_cemetery_through_crypt_b_03",
				"pbw_objective_cemetery_through_crypt_b_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_bringing_down_fourth_attachment = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_bringing_down_fourth_attachment_01",
				"pbw_objective_cemetery_bringing_down_fourth_attachment_02",
				"pbw_objective_cemetery_bringing_down_fourth_attachment_03",
				"pbw_objective_cemetery_bringing_down_fourth_attachment_04"
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
				"pbw_objective_cemetery_bringing_down_fourth_attachment_01",
				"pbw_objective_cemetery_bringing_down_fourth_attachment_02",
				"pbw_objective_cemetery_bringing_down_fourth_attachment_03",
				"pbw_objective_cemetery_bringing_down_fourth_attachment_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_plague_cauldron = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_plague_cauldron_01",
				"pbw_objective_cemetery_spotting_plague_cauldron_02",
				"pbw_objective_cemetery_spotting_plague_cauldron_03",
				"pbw_objective_cemetery_spotting_plague_cauldron_04"
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
				"pbw_objective_cemetery_spotting_plague_cauldron_01",
				"pbw_objective_cemetery_spotting_plague_cauldron_02",
				"pbw_objective_cemetery_spotting_plague_cauldron_03",
				"pbw_objective_cemetery_spotting_plague_cauldron_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_spotting_mausoleum = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_spotting_mausoleum_01",
				"pbw_objective_cemetery_spotting_mausoleum_02",
				"pbw_objective_cemetery_spotting_mausoleum_03",
				"pbw_objective_cemetery_spotting_mausoleum_04"
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
				"pbw_objective_cemetery_spotting_mausoleum_01",
				"pbw_objective_cemetery_spotting_mausoleum_02",
				"pbw_objective_cemetery_spotting_mausoleum_03",
				"pbw_objective_cemetery_spotting_mausoleum_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_cemetery_bringing_down_second_attachment = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_cemetery_bringing_down_second_attachment_01",
				"pbw_objective_cemetery_bringing_down_second_attachment_02",
				"pbw_objective_cemetery_bringing_down_second_attachment_03",
				"pbw_objective_cemetery_bringing_down_second_attachment_04"
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
				"pbw_objective_cemetery_bringing_down_second_attachment_01",
				"pbw_objective_cemetery_bringing_down_second_attachment_02",
				"pbw_objective_cemetery_bringing_down_second_attachment_03",
				"pbw_objective_cemetery_bringing_down_second_attachment_04"
			},
			randomize_indexes = {}
		},
		pbw_cemetary_intro = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_cemetery",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_cemetary_intro_a_01",
				[2.0] = "pbw_cemetary_intro_a_02"
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
				[1.0] = "pbw_cemetary_intro_a_01",
				[2.0] = "pbw_cemetary_intro_a_02"
			},
			randomize_indexes = {}
		}
	})
end

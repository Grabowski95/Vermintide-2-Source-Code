return function ()
	define_rule({
		name = "pwh_level_helmgart_military_empty_town",
		response = "pwh_level_helmgart_military_empty_town",
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
				"helmgart_military_empty_town"
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
				"time_since_helmgart_military_empty_town",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_empty_town",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_fort_help",
		response = "pwh_level_helmgart_military_fort_help",
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
				"helmgart_military_fort_help"
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
				"time_since_helmgart_military_fort_help",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_fort_help",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_fort_entrance",
		response = "pwh_level_helmgart_military_fort_entrance",
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
				"helmgart_military_fort_entrance"
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
				"time_since_helmgart_military_fort_entrance",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_fort_entrance",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_fort_massacre",
		response = "pwh_level_helmgart_military_fort_massacre",
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
				"helmgart_military_fort_massacre"
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
				"time_since_helmgart_military_fort_massacre",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_fort_massacre",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_fort_elevator",
		response = "pwh_level_helmgart_military_fort_elevator",
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
				"helmgart_military_fort_elevator"
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
				"time_since_helmgart_military_fort_elevator",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_fort_elevator",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_armoury",
		response = "pwh_level_helmgart_military_armoury",
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
				"helmgart_military_armoury"
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
				"time_since_helmgart_military_armoury",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_armoury",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_portcullis",
		response = "pwh_level_helmgart_military_portcullis",
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
				"helmgart_military_portcullis"
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
				"time_since_helmgart_military_portcullis",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_portcullis",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_courtyard_event",
		response = "pwh_level_helmgart_military_courtyard_event",
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
				"helmgart_military_courtyard_event"
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
				"time_since_helmgart_military_courtyard_event",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_courtyard_event",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_axebite_pass_vista",
		response = "pwh_level_helmgart_military_axebite_pass_vista",
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
				"helmgart_military_axebite_pass_vista"
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
				"time_since_helmgart_military_axebite_pass_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_axebite_pass_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_helmgart_vista",
		response = "pwh_level_helmgart_military_helmgart_vista",
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
				"helmgart_military_helmgart_vista"
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
				"time_since_helmgart_military_helmgart_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_helmgart_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_locked_portcullis",
		response = "pwh_level_helmgart_military_locked_portcullis",
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
				"helmgart_military_locked_portcullis"
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
				"time_since_helmgart_military_locked_portcullis",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_locked_portcullis",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_turn_cannon",
		response = "pwh_level_helmgart_military_turn_cannon",
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
				"helmgart_military_turn_cannon"
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
				"time_since_helmgart_military_turn_cannon",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_turn_cannon",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_fire_cannon",
		response = "pwh_level_helmgart_military_fire_cannon",
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
				"helmgart_military_fire_cannon"
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
				"time_since_helmgart_military_fire_cannon",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_fire_cannon",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_oops",
		response = "pwh_level_helmgart_military_oops",
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
				"helmgart_military_oops"
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
				"time_since_helmgart_military_oops",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_oops",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_temple_ahead",
		response = "pwh_level_helmgart_military_temple_ahead",
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
				"helmgart_military_temple_ahead"
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
				"time_since_helmgart_military_temple_ahead",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_temple_ahead",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_pilgrim_path",
		response = "pwh_level_helmgart_military_pilgrim_path",
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
				"helmgart_military_pilgrim_path"
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
				"time_since_helmgart_military_pilgrim_path",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_pilgrim_path",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_arriving_temple",
		response = "pwh_level_helmgart_military_arriving_temple",
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
				"helmgart_military_arriving_temple"
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
				"time_since_helmgart_military_arriving_temple",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_arriving_temple",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_prepare",
		response = "pwh_level_helmgart_military_prepare",
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
				"helmgart_military_prepare"
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
				"time_since_helmgart_military_prepare",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_prepare",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_ring_bell",
		response = "pwh_level_helmgart_military_ring_bell",
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
				"helmgart_military_ring_bell"
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
				"time_since_helmgart_military_ring_bell",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_ring_bell",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_they_are_coming",
		response = "pwh_level_helmgart_military_they_are_coming",
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
				"helmgart_military_they_are_coming"
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
				"time_since_helmgart_military_they_are_coming",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_they_are_coming",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_halfway_through_horde",
		response = "pwh_level_helmgart_military_halfway_through_horde",
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
				"helmgart_military_halfway_through_horde"
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
				"time_since_helmgart_military_halfway_through_horde",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_halfway_through_horde",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_spooky_temple",
		response = "pwh_level_helmgart_military_spooky_temple",
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
				"helmgart_military_spooky_temple"
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
				"time_since_helmgart_military_spooky_temple",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_spooky_temple",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_door_opens",
		response = "pwh_level_helmgart_military_door_opens",
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
				"helmgart_military_door_opens"
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
				"time_since_helmgart_military_door_opens",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_door_opens",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_time_to_leave",
		response = "pwh_level_helmgart_military_time_to_leave",
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
				"helmgart_military_time_to_leave"
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
				"time_since_helmgart_military_time_to_leave",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_time_to_leave",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_helmgart_military_spotting_portal",
		response = "pwh_level_helmgart_military_spotting_portal",
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
				"helmgart_military_spotting_portal"
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
				"time_since_helmgart_military_spotting_portal",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_helmgart_military_spotting_portal",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_helmgart_military_a",
		response = "pwh_helmgart_military_a",
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
				"helmgart_military_a"
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
				"helmgart_military_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_helmgart_military_b",
		response = "pwh_helmgart_military_b",
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
				"helmgart_military_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"helmgart_military_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_helmgart_military_c",
		response = "pwh_helmgart_military_c",
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
				"helmgart_military_c"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"helmgart_military_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_c",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pwh_level_helmgart_military_axebite_pass_vista = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_axebite_pass_vista_01",
				"pwh_level_helmgart_military_axebite_pass_vista_02",
				"pwh_level_helmgart_military_axebite_pass_vista_03",
				"pwh_level_helmgart_military_axebite_pass_vista_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_axebite_pass_vista_01",
				"pwh_level_helmgart_military_axebite_pass_vista_02",
				"pwh_level_helmgart_military_axebite_pass_vista_03",
				"pwh_level_helmgart_military_axebite_pass_vista_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_fort_entrance = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_fort_entrance_01",
				"pwh_level_helmgart_military_fort_entrance_02",
				"pwh_level_helmgart_military_fort_entrance_03",
				"pwh_level_helmgart_military_fort_entrance_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_fort_entrance_01",
				"pwh_level_helmgart_military_fort_entrance_02",
				"pwh_level_helmgart_military_fort_entrance_03",
				"pwh_level_helmgart_military_fort_entrance_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_armoury = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_armoury_01",
				"pwh_level_helmgart_military_armoury_02",
				"pwh_level_helmgart_military_armoury_03",
				"pwh_level_helmgart_military_armoury_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_armoury_01",
				"pwh_level_helmgart_military_armoury_02",
				"pwh_level_helmgart_military_armoury_03",
				"pwh_level_helmgart_military_armoury_04"
			},
			randomize_indexes = {}
		},
		pwh_helmgart_military_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_helmgart_military_c_01",
				[2.0] = "pwh_helmgart_military_c_02"
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
				[1.0] = "pwh_helmgart_military_c_01",
				[2.0] = "pwh_helmgart_military_c_02"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_they_are_coming = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_they_are_coming_01",
				"pwh_level_helmgart_military_they_are_coming_02",
				"pwh_level_helmgart_military_they_are_coming_03",
				"pwh_level_helmgart_military_they_are_coming_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_they_are_coming_01",
				"pwh_level_helmgart_military_they_are_coming_02",
				"pwh_level_helmgart_military_they_are_coming_03",
				"pwh_level_helmgart_military_they_are_coming_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_arriving_temple = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_arriving_temple_01",
				"pwh_level_helmgart_military_arriving_temple_02",
				"pwh_level_helmgart_military_arriving_temple_03",
				"pwh_level_helmgart_military_arriving_temple_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_arriving_temple_01",
				"pwh_level_helmgart_military_arriving_temple_02",
				"pwh_level_helmgart_military_arriving_temple_03",
				"pwh_level_helmgart_military_arriving_temple_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_helmgart_vista = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_helmgart_vista_01",
				"pwh_level_helmgart_military_helmgart_vista_02",
				"pwh_level_helmgart_military_helmgart_vista_03",
				"pwh_level_helmgart_military_helmgart_vista_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_helmgart_vista_01",
				"pwh_level_helmgart_military_helmgart_vista_02",
				"pwh_level_helmgart_military_helmgart_vista_03",
				"pwh_level_helmgart_military_helmgart_vista_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_fort_elevator = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_fort_elevator_01",
				"pwh_level_helmgart_military_fort_elevator_02",
				"pwh_level_helmgart_military_fort_elevator_03",
				"pwh_level_helmgart_military_fort_elevator_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_fort_elevator_01",
				"pwh_level_helmgart_military_fort_elevator_02",
				"pwh_level_helmgart_military_fort_elevator_03",
				"pwh_level_helmgart_military_fort_elevator_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_temple_ahead = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_temple_ahead_01",
				"pwh_level_helmgart_military_temple_ahead_02",
				"pwh_level_helmgart_military_temple_ahead_03",
				"pwh_level_helmgart_military_temple_ahead_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_temple_ahead_01",
				"pwh_level_helmgart_military_temple_ahead_02",
				"pwh_level_helmgart_military_temple_ahead_03",
				"pwh_level_helmgart_military_temple_ahead_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_spotting_portal = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_spotting_portal_01",
				"pwh_level_helmgart_military_spotting_portal_02",
				"pwh_level_helmgart_military_spotting_portal_03",
				"pwh_level_helmgart_military_spotting_portal_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_spotting_portal_01",
				"pwh_level_helmgart_military_spotting_portal_02",
				"pwh_level_helmgart_military_spotting_portal_03",
				"pwh_level_helmgart_military_spotting_portal_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_prepare = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_prepare_01",
				"pwh_level_helmgart_military_prepare_02",
				"pwh_level_helmgart_military_prepare_03",
				"pwh_level_helmgart_military_prepare_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_prepare_01",
				"pwh_level_helmgart_military_prepare_02",
				"pwh_level_helmgart_military_prepare_03",
				"pwh_level_helmgart_military_prepare_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_courtyard_event = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_courtyard_event_01",
				"pwh_level_helmgart_military_courtyard_event_02",
				"pwh_level_helmgart_military_courtyard_event_03",
				"pwh_level_helmgart_military_courtyard_event_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_courtyard_event_01",
				"pwh_level_helmgart_military_courtyard_event_02",
				"pwh_level_helmgart_military_courtyard_event_03",
				"pwh_level_helmgart_military_courtyard_event_04"
			},
			randomize_indexes = {}
		},
		pwh_helmgart_military_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_helmgart_military_b_01",
				[2.0] = "pwh_helmgart_military_b_02"
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
				[1.0] = "pwh_helmgart_military_b_01",
				[2.0] = "pwh_helmgart_military_b_02"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_door_opens = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_door_opens_01",
				"pwh_level_helmgart_military_door_opens_02",
				"pwh_level_helmgart_military_door_opens_03",
				"pwh_level_helmgart_military_door_opens_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_door_opens_01",
				"pwh_level_helmgart_military_door_opens_02",
				"pwh_level_helmgart_military_door_opens_03",
				"pwh_level_helmgart_military_door_opens_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_fort_massacre = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_fort_massacre_01",
				"pwh_level_helmgart_military_fort_massacre_02",
				"pwh_level_helmgart_military_fort_massacre_03",
				"pwh_level_helmgart_military_fort_massacre_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_fort_massacre_01",
				"pwh_level_helmgart_military_fort_massacre_02",
				"pwh_level_helmgart_military_fort_massacre_03",
				"pwh_level_helmgart_military_fort_massacre_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_turn_cannon = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_turn_cannon_01",
				"pwh_level_helmgart_military_turn_cannon_02",
				"pwh_level_helmgart_military_turn_cannon_03",
				"pwh_level_helmgart_military_turn_cannon_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_turn_cannon_01",
				"pwh_level_helmgart_military_turn_cannon_02",
				"pwh_level_helmgart_military_turn_cannon_03",
				"pwh_level_helmgart_military_turn_cannon_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_portcullis = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_portcullis_01",
				"pwh_level_helmgart_military_portcullis_02",
				"pwh_level_helmgart_military_portcullis_03",
				"pwh_level_helmgart_military_portcullis_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_portcullis_01",
				"pwh_level_helmgart_military_portcullis_02",
				"pwh_level_helmgart_military_portcullis_03",
				"pwh_level_helmgart_military_portcullis_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_fort_help = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_fort_help_01",
				"pwh_level_helmgart_military_fort_help_02",
				"pwh_level_helmgart_military_fort_help_03",
				"pwh_level_helmgart_military_fort_help_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_fort_help_01",
				"pwh_level_helmgart_military_fort_help_02",
				"pwh_level_helmgart_military_fort_help_03",
				"pwh_level_helmgart_military_fort_help_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_halfway_through_horde = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_halfway_through_horde_01",
				"pwh_level_helmgart_military_halfway_through_horde_02",
				"pwh_level_helmgart_military_halfway_through_horde_03",
				"pwh_level_helmgart_military_halfway_through_horde_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_halfway_through_horde_01",
				"pwh_level_helmgart_military_halfway_through_horde_02",
				"pwh_level_helmgart_military_halfway_through_horde_03",
				"pwh_level_helmgart_military_halfway_through_horde_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_time_to_leave = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_time_to_leave_01",
				"pwh_level_helmgart_military_time_to_leave_02",
				"pwh_level_helmgart_military_time_to_leave_03",
				"pwh_level_helmgart_military_time_to_leave_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_time_to_leave_01",
				"pwh_level_helmgart_military_time_to_leave_02",
				"pwh_level_helmgart_military_time_to_leave_03",
				"pwh_level_helmgart_military_time_to_leave_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_empty_town = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_empty_town_01",
				"pwh_level_helmgart_military_empty_town_02",
				"pwh_level_helmgart_military_empty_town_03",
				"pwh_level_helmgart_military_empty_town_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_empty_town_01",
				"pwh_level_helmgart_military_empty_town_02",
				"pwh_level_helmgart_military_empty_town_03",
				"pwh_level_helmgart_military_empty_town_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_ring_bell = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_ring_bell_01",
				"pwh_level_helmgart_military_ring_bell_02",
				"pwh_level_helmgart_military_ring_bell_03",
				"pwh_level_helmgart_military_ring_bell_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_ring_bell_01",
				"pwh_level_helmgart_military_ring_bell_02",
				"pwh_level_helmgart_military_ring_bell_03",
				"pwh_level_helmgart_military_ring_bell_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_oops = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_oops_01",
				"pwh_level_helmgart_military_oops_02",
				"pwh_level_helmgart_military_oops_03",
				"pwh_level_helmgart_military_oops_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_oops_01",
				"pwh_level_helmgart_military_oops_02",
				"pwh_level_helmgart_military_oops_03",
				"pwh_level_helmgart_military_oops_04"
			},
			randomize_indexes = {}
		},
		pwh_helmgart_military_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_helmgart_military_a_01",
				[2.0] = "pwh_helmgart_military_a_02"
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
				[1.0] = "pwh_helmgart_military_a_01",
				[2.0] = "pwh_helmgart_military_a_02"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_pilgrim_path = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_pilgrim_path_01",
				"pwh_level_helmgart_military_pilgrim_path_02",
				"pwh_level_helmgart_military_pilgrim_path_03",
				"pwh_level_helmgart_military_pilgrim_path_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_pilgrim_path_01",
				"pwh_level_helmgart_military_pilgrim_path_02",
				"pwh_level_helmgart_military_pilgrim_path_03",
				"pwh_level_helmgart_military_pilgrim_path_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_locked_portcullis = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_locked_portcullis_01",
				"pwh_level_helmgart_military_locked_portcullis_02",
				"pwh_level_helmgart_military_locked_portcullis_03",
				"pwh_level_helmgart_military_locked_portcullis_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_locked_portcullis_01",
				"pwh_level_helmgart_military_locked_portcullis_02",
				"pwh_level_helmgart_military_locked_portcullis_03",
				"pwh_level_helmgart_military_locked_portcullis_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_spooky_temple = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_spooky_temple_01",
				"pwh_level_helmgart_military_spooky_temple_02",
				"pwh_level_helmgart_military_spooky_temple_03",
				"pwh_level_helmgart_military_spooky_temple_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_spooky_temple_01",
				"pwh_level_helmgart_military_spooky_temple_02",
				"pwh_level_helmgart_military_spooky_temple_03",
				"pwh_level_helmgart_military_spooky_temple_04"
			},
			randomize_indexes = {}
		},
		pwh_level_helmgart_military_fire_cannon = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_military",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_level_helmgart_military_fire_cannon_01",
				"pwh_level_helmgart_military_fire_cannon_02",
				"pwh_level_helmgart_military_fire_cannon_03",
				"pwh_level_helmgart_military_fire_cannon_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_level_helmgart_military_fire_cannon_01",
				"pwh_level_helmgart_military_fire_cannon_02",
				"pwh_level_helmgart_military_fire_cannon_03",
				"pwh_level_helmgart_military_fire_cannon_04"
			},
			randomize_indexes = {}
		}
	})

	return 
end

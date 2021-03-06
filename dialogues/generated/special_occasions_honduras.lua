return function ()
	define_rule({
		name = "pdr_gameplay_i_will_tank",
		response = "pdr_gameplay_i_will_tank",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"surrounded"
			},
			{
				"query_context",
				"has_shield",
				OP.EQ,
				1
			},
			{
				"query_context",
				"current_amount",
				OP.GTEQ,
				7
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
				"user_memory",
				"time_since_i_will_tank",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_i_will_tank",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_i_will_tank",
		response = "pes_gameplay_i_will_tank",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"surrounded"
			},
			{
				"query_context",
				"has_shield",
				OP.EQ,
				1
			},
			{
				"query_context",
				"current_amount",
				OP.GTEQ,
				7
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
				"user_memory",
				"time_since_i_will_tank",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_i_will_tank",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_hanging_help",
		response = "pdr_gameplay_hanging_help",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
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
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hanging_help",
		response = "pbw_gameplay_hanging_help",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
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
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hanging_help",
		response = "pwh_gameplay_hanging_help",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
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
				"time_since_ledge_hanging",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hanging_help",
		response = "pwe_gameplay_hanging_help",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hanging_help",
		response = "pes_gameplay_hanging_help",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
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
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_ranger_potions_above_half_health_01",
		response = "pbw_gameplay_ranger_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_01_reply_01",
		response = "pdr_gameplay_ranger_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_ranger_potions_above_half_health_01_reply_01",
		response = "pbw_gameplay_ranger_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_ranger_potions_above_half_health_03",
		response = "pbw_gameplay_ranger_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_03_reply_01",
		response = "pdr_gameplay_ranger_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_ranger_potions_above_half_health_03_reply_01",
		response = "pbw_gameplay_ranger_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_03_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_ranger_potions_above_half_health_02",
		response = "pbw_gameplay_ranger_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_02_reply_01",
		response = "pdr_gameplay_ranger_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_ranger_potions_above_half_health_02_reply_01",
		response = "pbw_gameplay_ranger_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_02_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_elf_potions_above_half_health_01",
		response = "pbw_gameplay_elf_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_elf_potions_above_half_health_01_reply_01",
		response = "pwe_gameplay_elf_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_elf_potions_above_half_health_01_reply_01",
		response = "pbw_gameplay_elf_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_potions_above_half_health_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_elf_potions_above_half_health_06",
		response = "pbw_gameplay_elf_potions_above_half_health_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_elf_potions_above_half_health_06_reply_01",
		response = "pwe_gameplay_elf_potions_above_half_health_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_potions_above_half_health_06"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_elf_potions_above_half_health_06_reply_01",
		response = "pbw_gameplay_elf_potions_above_half_health_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_potions_above_half_health_06_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_elf_potions_above_half_health_02",
		response = "pbw_gameplay_elf_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_elf_potions_above_half_health_02_reply_01",
		response = "pwe_gameplay_elf_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_elf_potions_above_half_health_02_reply_01",
		response = "pbw_gameplay_elf_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_potions_above_half_health_02_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_01",
		response = "pbw_gameplay_wizard_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_wizard_potions_above_half_health_01_reply_01",
		response = "pwh_gameplay_wizard_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_01_reply_01",
		response = "pbw_gameplay_wizard_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_potions_above_half_health_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_03",
		response = "pbw_gameplay_wizard_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_wizard_potions_above_half_health_03_reply_01",
		response = "pwh_gameplay_wizard_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_03_reply_01",
		response = "pbw_gameplay_wizard_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_02",
		response = "pbw_gameplay_wizard_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_wizard_potions_above_half_health_02_reply_02",
		response = "pwh_gameplay_wizard_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_02_reply_02",
		response = "pbw_gameplay_wizard_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_potions_above_half_health_02_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_soldier_potions_above_half_health_01",
		response = "pbw_gameplay_soldier_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_ameplay_soldier_potions_above_half_health_01_reply_01",
		response = "pes_ameplay_soldier_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_ameplay_soldier_potions_above_half_health_01_reply_01",
		response = "pbw_ameplay_soldier_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_ameplay_soldier_potions_above_half_health_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_soldier_potions_above_half_health_03",
		response = "pbw_gameplay_soldier_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_03_reply_01",
		response = "pes_gameplay_soldier_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_soldier_potions_above_half_health_reply_01",
		response = "pbw_gameplay_soldier_potions_above_half_health_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_03_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_soldier_potions_above_half_health_02",
		response = "pbw_gameplay_soldier_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_02_reply_01",
		response = "pes_gameplay_soldier_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_soldier_potions_above_half_health_02_reply_01",
		response = "pbw_gameplay_soldier_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_02_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_elf_potions_above_half_health_04",
		response = "pdr_gameplay_elf_potions_above_half_health_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_response_056",
		response = "pwe_gameplay_response_056",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_potions_above_half_health_04"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_response_046",
		response = "pdr_gameplay_response_046",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_056"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_elf_potions_above_half_health_03",
		response = "pdr_gameplay_elf_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_response_055",
		response = "pwe_gameplay_response_055",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_response_045",
		response = "pdr_gameplay_response_045",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_055"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_elf_potions_above_half_health_02",
		response = "pdr_gameplay_elf_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_response_054",
		response = "pwe_gameplay_response_054",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_response_044",
		response = "pdr_gameplay_response_044",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_054"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_hunter_potions_above_half_health_04",
		response = "pdr_gameplay_hunter_potions_above_half_health_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_reply_01",
		response = "pwh_gameplay_hunter_potions_above_half_health_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_potions_above_half_health_04"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_hunter_potions_above_half_health_reply_01",
		response = "pdr_gameplay_hunter_potions_above_half_health_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_hunter_potions_above_half_health_03",
		response = "pdr_gameplay_hunter_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_response_044",
		response = "pwh_gameplay_response_044",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_response_054",
		response = "pdr_gameplay_response_054",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_044"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_hunter_potions_above_half_health_02",
		response = "pdr_gameplay_hunter_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_response_043",
		response = "pwh_gameplay_response_043",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_response_053",
		response = "pdr_gameplay_response_053",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_043"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_soldier_potions_above_half_health_01",
		response = "pdr_gameplay_soldier_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_01_reply_01",
		response = "pes_gameplay_soldier_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_soldier_potions_above_half_health_01_reply_01",
		response = "pdr_gameplay_soldier_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_soldier_potions_above_half_health_03",
		response = "pdr_gameplay_soldier_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_03_reply_02",
		response = "pes_gameplay_soldier_potions_above_half_health_03_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_soldier_potions_above_half_health_03_reply_01",
		response = "pdr_gameplay_soldier_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_03_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_soldier_potions_above_half_health_02",
		response = "pdr_gameplay_soldier_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_02_reply_02",
		response = "pes_gameplay_soldier_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_soldier_potions_above_half_health_02_reply_02",
		response = "pdr_gameplay_soldier_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_02_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_wizard_potions_above_half_health_01",
		response = "pdr_gameplay_wizard_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_response_043",
		response = "pbw_gameplay_response_043",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_response_050",
		response = "pdr_gameplay_response_050",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_043"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_wizard_potions_above_half_health_03",
		response = "pdr_gameplay_wizard_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_03_reply_02",
		response = "pbw_gameplay_wizard_potions_above_half_health_03_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_wizard_potions_above_half_health_03_reply_02",
		response = "pdr_gameplay_wizard_potions_above_half_health_03_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_03_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_wizard_potions_above_half_health_02",
		response = "pdr_gameplay_wizard_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_02_reply_03",
		response = "pbw_gameplay_wizard_potions_above_half_health_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_wizard_potions_above_half_health_04",
		response = "pdr_gameplay_wizard_potions_above_half_health_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_02_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_elf_potions_above_half_health_01",
		response = "pes_gameplay_elf_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_elf_potions_above_half_health_01_reply_02",
		response = "pwe_gameplay_elf_potions_above_half_health_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_elf_potions_above_half_health_01_reply_02",
		response = "pes_gameplay_elf_potions_above_half_health_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_potions_above_half_health_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_elf_potions_above_half_health_03",
		response = "pes_gameplay_elf_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_elf_potions_above_half_health_03_reply_01",
		response = "pwe_gameplay_elf_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_elf_potions_above_half_health_03_reply_01",
		response = "pes_gameplay_elf_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_potions_above_half_health_03_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_elf_potions_above_half_health_02",
		response = "pes_gameplay_elf_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_elf_potions_above_half_health_02_reply_02",
		response = "pwe_gameplay_elf_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_elf_potions_above_half_health_02_reply_01",
		response = "pes_gameplay_elf_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_potions_above_half_health_02_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hunter_potions_above_half_health_01",
		response = "pes_gameplay_hunter_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_01_reply_01",
		response = "pwh_gameplay_hunter_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hunter_potions_above_half_health_01_reply_01",
		response = "pes_gameplay_hunter_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hunter_potions_above_half_health_03",
		response = "pes_gameplay_hunter_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_03_reply_01",
		response = "pwh_gameplay_hunter_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hunter_potions_above_half_health_03_reply_01",
		response = "pes_gameplay_hunter_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_03_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hunter_potions_above_half_health_02",
		response = "pes_gameplay_hunter_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_02_reply_01",
		response = "pwh_gameplay_hunter_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hunter_potions_above_half_health_02_reply_01",
		response = "pes_gameplay_hunter_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_02_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_ranger_potions_above_half_health_01",
		response = "pes_gameplay_ranger_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_01_reply_02",
		response = "pdr_gameplay_ranger_potions_above_half_health_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_ranger_potions_above_half_health_reply_01",
		response = "pes_gameplay_ranger_potions_above_half_health_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_ranger_potions_above_half_health_03",
		response = "pes_gameplay_ranger_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_03_reply_02",
		response = "pdr_gameplay_ranger_potions_above_half_health_03_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_ranger_potions_above_half_health_03_reply_01",
		response = "pes_gameplay_ranger_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_03_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_ranger_potions_above_half_health_02",
		response = "pes_gameplay_ranger_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_02_reply_02",
		response = "pdr_gameplay_ranger_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_ranger_potions_above_half_health_02_reply_01",
		response = "pes_gameplay_ranger_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_02_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wizard_potions_above_half_health_01",
		response = "pes_gameplay_wizard_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_01_reply_02",
		response = "pbw_gameplay_wizard_potions_above_half_health_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wizard_potions_above_half_health_reply_01",
		response = "pes_gameplay_wizard_potions_above_half_health_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wizard_potions_above_half_health_03",
		response = "pes_gameplay_wizard_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wizard_potions_above_half_health_03_reply_01",
		response = "pes_gameplay_wizard_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_pes_gameplay_wizard_potions_above_half_health_03_reply_01",
		response = "pes_pes_gameplay_wizard_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wizard_potions_above_half_health_02",
		response = "pes_gameplay_wizard_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_02_reply_04",
		response = "pbw_gameplay_wizard_potions_above_half_health_02_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wizard_potions_above_half_health_02_reply_01",
		response = "pes_gameplay_wizard_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_02_reply_04"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hunter_potions_above_half_health_01",
		response = "pwe_gameplay_hunter_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_01_reply_02",
		response = "pwh_gameplay_hunter_potions_above_half_health_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hunter_potions_above_half_health__reply_02",
		response = "pwe_gameplay_hunter_potions_above_half_health__reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hunter_potions_above_half_health_03",
		response = "pwe_gameplay_hunter_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_03_reply_02",
		response = "pwh_gameplay_hunter_potions_above_half_health_03_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hunter_potions_above_half_health_03_reply_01",
		response = "pwe_gameplay_hunter_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_03_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hunter_potions_above_half_health_02",
		response = "pwe_gameplay_hunter_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_02_reply_02",
		response = "pwh_gameplay_hunter_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hunter_potions_above_half_health_02_reply_01",
		response = "pwe_gameplay_hunter_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_02_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_ranger_potions_above_half_health_04",
		response = "pwe_gameplay_ranger_potions_above_half_health_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_04_reply_01",
		response = "pdr_gameplay_ranger_potions_above_half_health_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_potions_above_half_health_04"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_ranger_potions_above_half_health_04_reply_01",
		response = "pwe_gameplay_ranger_potions_above_half_health_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_04_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_ranger_potions_above_half_health_03",
		response = "pwe_gameplay_ranger_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_03_reply_03",
		response = "pdr_gameplay_ranger_potions_above_half_health_03_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_ranger_potions_above_half_health_03_reply_01",
		response = "pwe_gameplay_ranger_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_03_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_ranger_potions_above_half_health_02",
		response = "pwe_gameplay_ranger_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_02_reply_03",
		response = "pdr_gameplay_ranger_potions_above_half_health_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_ranger_potions_above_half_health_02_reply_01",
		response = "pwe_gameplay_ranger_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_02_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_soldier_potions_above_half_health_01",
		response = "pwe_gameplay_soldier_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_01_reply_02",
		response = "pes_gameplay_soldier_potions_above_half_health_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_soldier_potions_above_half_health_01_reply_01",
		response = "pwe_gameplay_soldier_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_soldier_potions_above_half_health_03",
		response = "pwe_gameplay_soldier_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_03_reply_03",
		response = "pes_gameplay_soldier_potions_above_half_health_03_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_soldier_potions_above_half_health_03_reply_01",
		response = "pwe_gameplay_soldier_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_03_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_soldier_potions_above_half_health_02",
		response = "pwe_gameplay_soldier_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_02_reply_03",
		response = "pes_gameplay_soldier_potions_above_half_health_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_soldier_potions_above_half_health_02_reply_01",
		response = "pwe_gameplay_soldier_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_02_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_wizard_potions_above_half_health_01",
		response = "pwe_gameplay_wizard_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_01_reply_03",
		response = "pbw_gameplay_wizard_potions_above_half_health_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_wizard_potions_above_half_health_01_reply_01",
		response = "pwe_gameplay_wizard_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_01_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_wizard_potions_above_half_health_03",
		response = "pwe_gameplay_wizard_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_03_reply_03",
		response = "pbw_gameplay_wizard_potions_above_half_health_03_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_wizard_potions_above_half_health_03_reply_02",
		response = "pwe_gameplay_wizard_potions_above_half_health_03_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_03_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_dwarf_picks_up_a_bomb",
		response = "pwe_gameplay_dwarf_picks_up_a_bomb",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"on_other_pickup"
			},
			{
				"query_context",
				"pickup_name",
				OP.EQ,
				"pickup_frag_grenade_t2"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_dwarf_picks_up_a_bomb",
				OP.TIMEDIFF,
				OP.GT,
				1800
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_dwarf_picks_up_a_bomb",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_soldier_3_special_kills_in_a_row_02",
		response = "pdr_gameplay_soldier_3_special_kills_in_a_row_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_3_special_kills_in_a_row_02",
		name = "pes_gameplay_soldier_3_special_kills_in_a_row_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_3_special_kills_in_a_row_02"
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
		response = "pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1",
		name = "pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_3_special_kills_in_a_row_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_elf_3_special_kills_in_a_row_01",
		response = "pbw_gameplay_elf_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02",
		name = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_3_special_kills_in_a_row_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		name = "pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hunter_3_special_kills_in_a_row_01",
		response = "pbw_gameplay_hunter_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_071",
		name = "pwh_gameplay_response_071",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
		name = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_071"
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
		name = "pbw_gameplay_hunter_kills_3_specials_in_a_row_02",
		response = "pbw_gameplay_hunter_kills_3_specials_in_a_row_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01",
		name = "pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_kills_3_specials_in_a_row_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01",
		name = "pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01"
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
		name = "pbw_gameplay_ranger_3_special_kills_in_a_row_01",
		response = "pbw_gameplay_ranger_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03",
		name = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		name = "pwh_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_soldier_3_special_kills_in_a_row_01",
		response = "pbw_gameplay_soldier_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03",
		name = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_3_special_kills_in_a_row_01"
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
		response = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02",
		name = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_elf_3_special_kills_in_a_row_01",
		response = "pdr_gameplay_elf_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03",
		name = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_3_special_kills_in_a_row_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02",
		name = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_hunter_3_special_kills_in_a_row_01",
		response = "pdr_gameplay_hunter_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
		name = "pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02",
		name = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
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
		name = "pdr_gameplay_wizard_3_special_kills_in_a_row_01",
		response = "pdr_gameplay_wizard_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		name = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_3_special_kills_in_a_row_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		name = "pwh_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_wizard_kills_3_specials_in_a_row_02",
		response = "pdr_gameplay_wizard_kills_3_specials_in_a_row_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01",
		name = "pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_kills_3_specials_in_a_row_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01",
		name = "pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
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
		name = "pes_gameplay_elf_3_special_kills_in_a_row_01",
		response = "pes_gameplay_elf_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_3_special_kills_in_a_row_01",
		name = "pwe_gameplay_elf_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_3_special_kills_in_a_row_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		name = "pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_3_special_kills_in_a_row_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hunter_3_special_kills_in_a_row_01",
		response = "pes_gameplay_hunter_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_3_special_kills_in_a_row_01",
		name = "pwh_gameplay_hunter_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
		name = "pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		name = "pes_gameplay_ranger_3_special_kills_in_a_row_01",
		response = "pes_gameplay_ranger_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		name = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		name = "pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hunter_3_special_kills_in_a_row_01",
		response = "pwe_gameplay_hunter_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01",
		name = "pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01",
		name = "pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_ranger_3_special_kills_in_a_row_01",
		response = "pwe_gameplay_ranger_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01",
		name = "pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01",
		name = "pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_soldier_3_special_kills_in_a_row_01",
		response = "pwe_gameplay_soldier_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
		name = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_3_special_kills_in_a_row_01"
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
		response = "pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
		name = "pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_wizard_3_special_kills_in_a_row_01",
		response = "pwe_gameplay_wizard_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02",
		name = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_3_special_kills_in_a_row_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		name = "pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02"
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
		name = "pwh_gameplay_elf_3_special_kills_in_a_row_01",
		response = "pwh_gameplay_elf_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		name = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_3_special_kills_in_a_row_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		name = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_ranger_3_special_kills_in_a_row_01",
		response = "pwh_gameplay_ranger_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02",
		name = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		name = "pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02"
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
		name = "pwh_gameplay_soldier_3_special_kills_in_a_row_01",
		response = "pwh_gameplay_soldier_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02",
		name = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_3_special_kills_in_a_row_01"
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
		response = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
		name = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_wizard_3_special_kills_in_a_row_01",
		response = "pwh_gameplay_wizard_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03",
		name = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_3_special_kills_in_a_row_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		name = "pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_ranger_killing_3_specials_in_a_row_02",
		response = "pwh_gameplay_ranger_killing_3_specials_in_a_row_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.EQ,
				2
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01",
		name = "pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_3_specials_in_a_row_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01",
		name = "pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01"
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
		response = "pes_gameplay_elf_downed_3_times_08",
		name = "pes_gameplay_elf_downed_3_times_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
		response = "pwh_gameplay_elf_downed_3_times_08_reply_01",
		name = "pwh_gameplay_elf_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_downed_3_times_08"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_elf_downed_3_times_08_reply_01",
		name = "pes_gameplay_elf_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_downed_3_times_08_reply_01"
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
		response = "pbr_gameplay_elf_downed_3_times_11",
		name = "pbr_gameplay_elf_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_downed_3_times_11_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbr_gameplay_elf_downed_3_times_11"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_elf_downed_3_times_11_reply_01",
		name = "pwh_gameplay_elf_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_11_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_elf_downed_3_times_05",
		name = "pwh_gameplay_elf_downed_3_times_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_downed_3_times_05_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_downed_3_times_05"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_elf_downed_3_times_05_reply_01",
		name = "pbw_gameplay_elf_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_05_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_elf_downed_3_times_04",
		name = "pwh_gameplay_elf_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_downed_3_times_04_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_downed_3_times_04"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_elf_downed_3_times_04_reply_01",
		name = "pwh_gameplay_elf_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_04_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_elf_downed_3_times_09",
		name = "pes_gameplay_elf_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
		response = "pwe_gameplay_elf_downed_3_times_09_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_downed_3_times_09"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_elf_downed_3_times_09_reply_01",
		name = "pes_gameplay_elf_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_09_reply_01"
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
		response = "pbw_gameplay_elf_downed_3_times_07",
		name = "pbw_gameplay_elf_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_elf_downed_3_times_07_reply_01",
		name = "pes_gameplay_elf_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_downed_3_times_07"
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
		response = "pbw_gameplay_elf_downed_3_times_07_reply_01",
		name = "pbw_gameplay_elf_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_downed_3_times_07_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_elf_downed_3_times_06",
		name = "pbw_gameplay_elf_downed_3_times_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_downed_3_times_06_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_downed_3_times_06"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_elf_downed_3_times_06_reply_01",
		name = "pbw_gameplay_elf_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_06_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_elf_downed_3_times_10",
		name = "pes_gameplay_elf_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
		response = "pwe_gameplay_elf_downed_3_times_10_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_downed_3_times_10"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_elf_downed_3_times_10_reply_01",
		name = "pwh_gameplay_elf_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_10_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_elf_downed_3_times_13",
		name = "pdr_gameplay_elf_downed_3_times_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_downed_3_times_13_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_downed_3_times_13"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_elf_downed_3_times_13_reply_01",
		name = "pdr_gameplay_elf_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_13_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_elf_downed_3_times_03_azsd",
		name = "pwh_gameplay_elf_downed_3_times_03_azsd",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_elf_downed_3_times_03_reply_01",
		name = "pes_gameplay_elf_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_downed_3_times_03_azsd"
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
		response = "pwh_gameplay_elf_downed_3_times_03_reply_01",
		name = "pwh_gameplay_elf_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_downed_3_times_03_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_elf_downed_3_times_12",
		name = "pdr_gameplay_elf_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_downed_3_times_12_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_downed_3_times_12"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_elf_downed_3_times_12_reply_01",
		name = "pdr_gameplay_elf_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_12_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_elf_downed_3_times_02",
		name = "pbw_gameplay_elf_downed_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_downed_3_times_02_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_downed_3_times_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_elf_downed_3_times_02_reply_01",
		name = "pbw_gameplay_elf_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_02_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_downed_3_times_08",
		name = "pdr_gameplay_hunter_downed_3_times_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_08_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_downed_3_times_08"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_downed_3_times_08_reply_01",
		name = "pdr_gameplay_hunter_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_08_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_hunter_downed_3_times_11",
		name = "pwe_gameplay_hunter_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_11_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_downed_3_times_11"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_hunter_downed_3_times_11_reply_01",
		name = "pwe_gameplay_hunter_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_11_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_hunter_downed_3_times_05",
		name = "pes_gameplay_hunter_downed_3_times_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
		response = "pwh_gameplay_hunter_downed_3_times_05_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_downed_3_times_05"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_hunter_downed_3_times_05_reply_01",
		name = "pes_gameplay_hunter_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_05_reply_01"
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
		response = "pbw_gameplay_hunter_downed_3_times_04",
		name = "pbw_gameplay_hunter_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_04_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_downed_3_times_04"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_downed_3_times_04_reply_01",
		name = "pdr_gameplay_hunter_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_04_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_downed_3_times_09",
		name = "pdr_gameplay_hunter_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_09_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_downed_3_times_09"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_downed_3_times_09_reply_01",
		name = "pdr_gameplay_hunter_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_09_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_hunter_downed_3_times_07",
		name = "pes_gameplay_hunter_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
		response = "pwh_gameplay_hunter_downed_3_times_07_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_downed_3_times_07"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_hunter_downed_3_times_07_reply_01",
		name = "pes_gameplay_hunter_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_07_reply_01"
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
		response = "pes_gameplay_hunter_downed_3_times_06",
		name = "pes_gameplay_hunter_downed_3_times_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
		response = "pwh_gameplay_hunter_downed_3_times_06_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_downed_3_times_06"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_hunter_downed_3_times_06_reply_01",
		name = "pes_gameplay_hunter_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_06_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_downed_3_times_10",
		name = "pdr_gameplay_hunter_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_10_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_downed_3_times_10"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_downed_3_times_10_reply_01",
		name = "pdr_gameplay_hunter_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_10_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_hunter_downed_3_times_13",
		name = "pwe_gameplay_hunter_downed_3_times_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_13_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_downed_3_times_13"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_hunter_downed_3_times_13_reply_01",
		name = "pwe_gameplay_hunter_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_13_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_hunter_downed_3_times_03",
		name = "pbw_gameplay_hunter_downed_3_times_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_03_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_downed_3_times_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_downed_3_times_03_reply_01",
		name = "pdr_gameplay_hunter_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_03_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_hunter_downed_3_times_12",
		name = "pwe_gameplay_hunter_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_11_reply_02",
		name = "pwh_gameplay_hunter_downed_3_times_11_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_downed_3_times_12"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_downed_3_times_11_reply_02",
		name = "pdr_gameplay_hunter_downed_3_times_11_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_11_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_hunter_downed_3_times_02",
		name = "pbw_gameplay_hunter_downed_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_02_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_downed_3_times_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_downed_3_times_02_reply_01",
		name = "pdr_gameplay_hunter_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_02_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_ranger_downed_3_times_08",
		name = "pbw_gameplay_ranger_downed_3_times_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_downed_3_times_08_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_downed_3_times_08"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_ranger_downed_3_times_08_reply_01",
		name = "pbw_gameplay_ranger_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_08_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_ranger_downed_3_times_11",
		name = "pwe_gameplay_ranger_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_downed_3_times_11_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_downed_3_times_11"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_ranger_downed_3_times_11_reply_01",
		name = "pbw_gameplay_ranger_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_11_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_ranger_downed_3_times_04",
		name = "pwh_gameplay_ranger_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_downed_3_times_04_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_downed_3_times_04"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_ranger_downed_3_times_04_reply_01",
		name = "pwe_gameplay_ranger_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_04_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_ranger_downed_3_times_09",
		name = "pbw_gameplay_ranger_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_downed_3_times_09_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_downed_3_times_09"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_ranger_downed_3_times_09_reply_01",
		name = "pes_gameplay_ranger_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_09_reply_01"
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
		response = "pbw_gameplay_ranger_downed_3_times_07",
		name = "pbw_gameplay_ranger_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_downed_3_times_07_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_downed_3_times_07"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_ranger_downed_3_times_07_reply_01",
		name = "pbw_gameplay_ranger_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_07_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_ranger_downed_3_times_10",
		name = "pes_gameplay_ranger_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
		response = "pdr_gameplay_ranger_downed_3_times_10_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_downed_3_times_10"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_ranger_downed_3_times_10_reply_01",
		name = "pwe_gameplay_ranger_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_10_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_ranger_downed_3_times_13",
		name = "pwe_gameplay_ranger_downed_3_times_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_downed_3_times_13_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_downed_3_times_13"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_ranger_downed_3_times_13_reply_01",
		name = "pwe_gameplay_ranger_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_13_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_ranger_downed_3_times_03",
		name = "pwh_gameplay_ranger_downed_3_times_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_downed_3_times_03_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_downed_3_times_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_ranger_downed_3_times_03_reply_01",
		name = "pwh_gameplay_ranger_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_03_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_ranger_downed_3_times_12",
		name = "pwe_gameplay_ranger_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_downed_3_times_12_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_downed_3_times_12"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_ranger_downed_3_times_12_reply_01",
		name = "pwe_gameplay_ranger_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_12_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_ranger_downed_3_time_02",
		name = "pwh_gameplay_ranger_downed_3_time_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_downed_3_times_02_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_downed_3_time_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_ranger_downed_3_times_02_reply_01",
		name = "pwh_gameplay_ranger_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_02_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_soldier_downed_3_times_08",
		response = "pbw_gameplay_soldier_downed_3_times_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_08_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_downed_3_times_08"
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
		response = "pwe_gameplay_soldier_downed_3_times_08_reply_01",
		name = "pwe_gameplay_soldier_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_08_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_soldier_downed_3_times_11",
		name = "pdr_gameplay_soldier_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_11_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_downed_3_times_11"
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
		response = "pwe_gameplay_soldier_downed_3_times_11_reply_01",
		name = "pwe_gameplay_soldier_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_11_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_soldier_downed_3_times_05",
		name = "pwh_gameplay_soldier_downed_3_times_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_soldier_downed_3_times_05_reply_01",
		name = "pbw_gameplay_soldier_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_downed_3_times_05"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_soldier_downed_3_times_05_reply_01",
		name = "pwh_gameplay_soldier_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_downed_3_times_05_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_soldier_downed_3_times_04",
		name = "pwh_gameplay_soldier_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_04_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_downed_3_times_04"
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
		response = "pwh_gameplay_soldier_downed_3_times_04_reply_01",
		name = "pwh_gameplay_soldier_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_04_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_soldier_downed_3_times_09",
		name = "pdr_gameplay_soldier_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_09_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_downed_3_times_09"
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
		response = "pwe_gameplay_soldier_downed_3_times_09_reply_01",
		name = "pwe_gameplay_soldier_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_09_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_soldier_downed_3_times_07",
		name = "pbw_gameplay_soldier_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_07_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_downed_3_times_07"
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
		response = "pbw_gameplay_soldier_downed_3_times_07_reply_01",
		name = "pbw_gameplay_soldier_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_07_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_soldier_downed_3_times_06",
		name = "pbw_gameplay_soldier_downed_3_times_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_06_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_downed_3_times_06"
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
		response = "pwe_gameplay_soldier_downed_3_times_06_reply_01",
		name = "pwe_gameplay_soldier_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_06_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_soldier_downed_3_times_10",
		name = "pdr_gameplay_soldier_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_10_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_downed_3_times_10"
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
		response = "pwe_gameplay_soldier_downed_3_times_10_reply_01",
		name = "pwe_gameplay_soldier_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_10_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_soldier_downed_3_times_13",
		name = "pwe_gameplay_soldier_downed_3_times_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_13_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_downed_3_times_13"
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
		response = "pwe_gameplay_soldier_downed_3_times_13_reply_01",
		name = "pwe_gameplay_soldier_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_13_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_soldier_downed_3_times_03",
		response = "pwh_gameplay_soldier_downed_3_times_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_downed_3_times_03"
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
		response = "pwh_gameplay_soldier_downed_3_times_reply_01",
		name = "pwh_gameplay_soldier_downed_3_times_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_soldier_downed_3_times_12",
		name = "pwe_gameplay_soldier_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_12_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_downed_3_times_12"
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
		response = "pwe_gameplay_soldier_downed_3_times_12_reply_01",
		name = "pwe_gameplay_soldier_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_12_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_soldier_downed_3_times_02",
		name = "pwe_gameplay_soldier_downed_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_02_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_downed_3_times_02"
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
		response = "pwh_gameplay_soldier_downed_3_times_02_reply_01",
		name = "pwh_gameplay_soldier_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_02_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_wizard_downed_3_times_08",
		name = "pdr_gameplay_wizard_downed_3_times_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_08_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_downed_3_times_08"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_wizard_downed_3_times_07_reply_01",
		name = "pdr_gameplay_wizard_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_08_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_wizard_downed_3_times_11",
		name = "pwe_gameplay_wizard_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_11_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_downed_3_times_11"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_wizard_downed_3_times_11_reply_01",
		name = "pwe_gameplay_wizard_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_11_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wizard_downed_3_times_05",
		response = "pes_gameplay_wizard_downed_3_times_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_05_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_downed_3_times_05"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_wizard_downed_3_times_05_reply_01",
		name = "pdr_gameplay_wizard_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_05_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wizard_downed_3_times_04",
		name = "pwh_gameplay_wizard_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_04_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_downed_3_times_04"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_wizard_downed_3_times_04_reply_01",
		name = "pes_gameplay_wizard_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_04_reply_01"
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
		response = "pwh_gameplay_wizard_downed_3_times_14",
		name = "pwh_gameplay_wizard_downed_3_times_14",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_14_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_14_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_downed_3_times_14"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wizard_downed_3_times_14_reply_01",
		name = "pwh_gameplay_wizard_downed_3_times_14_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_14_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_wizard_downed_3_times_09",
		name = "pdr_gameplay_wizard_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_09_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_downed_3_times_09"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_wizard_downed_3_times_09_reply_01",
		name = "pdr_gameplay_wizard_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_09_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_wizard_downed_3_times_07",
		name = "pes_gameplay_wizard_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
		response = "pbw_gameplay_wizard_downed_3_times_07_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_downed_3_times_07"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_wizard_downed_3_times_07_reply_01",
		name = "pes_gameplay_wizard_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_07_reply_01"
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
		response = "pes_gameplay_wizard_downed_3_times_06",
		name = "pes_gameplay_wizard_downed_3_times_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
		response = "pbw_gameplay_wizard_downed_3_times_06_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_downed_3_times_06"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_wizard_downed_3_times_06_reply_01",
		name = "pdr_gameplay_wizard_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_06_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_wizard_downed_3_times_10",
		name = "pdr_gameplay_wizard_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_10_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_downed_3_times_10"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wizard_downed_3_times_10_reply_01",
		name = "pwh_gameplay_wizard_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_10_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wizard_downed_3_times_03",
		name = "pwh_gameplay_wizard_downed_3_times_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_03_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_downed_3_times_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wizard_downed_3_times_03_reply_01",
		name = "pwh_gameplay_wizard_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_03_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_wizard_downed_3_times_12",
		name = "pwe_gameplay_wizard_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_12_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_downed_3_times_12"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_wizard_downed_3_times_12_reply_01",
		name = "pes_gameplay_wizard_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_12_reply_01"
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
		response = "pwh_gameplay_wizard_downed_3_times_02",
		name = "pwh_gameplay_wizard_downed_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wizard_downed_3_times_02_reply_01",
		name = "pwh_gameplay_wizard_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_downed_3_times_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wizard_downed_3_times_02_reply_02",
		name = "pwh_gameplay_wizard_downed_3_times_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_downed_3_times_02_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_elf_hit_by_goo_thrice_02",
		name = "pbw_gameplay_elf_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01",
		name = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_hit_by_goo_thrice_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_elf_hit_by_goo_thrice_02",
		name = "pdr_gameplay_elf_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02",
		name = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_hit_by_goo_thrice_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_elf_hit_by_goo_thrice_02",
		name = "pes_gameplay_elf_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
		response = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03",
		name = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_hit_by_goo_thrice_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_elf_hit_by_goo_thrice_02",
		name = "pwh_gameplay_elf_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04",
		name = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_hit_by_goo_thrice_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_hunter_hit_by_goo_thrice_02",
		name = "pbw_gameplay_hunter_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01",
		name = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_hit_by_goo_thrice_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_hit_by_goo_thrice_02",
		name = "pdr_gameplay_hunter_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02",
		name = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_hit_by_goo_thrice_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_hunter_hit_by_goo_thrice",
		name = "pes_gameplay_hunter_hit_by_goo_thrice",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
		response = "pwh_gameplay_hunter_hit_by_goo_thrice_reply_01",
		name = "pwh_gameplay_hunter_hit_by_goo_thrice_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_hit_by_goo_thrice"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_hunter_hit_by_goo_thrice_03",
		name = "pwe_gameplay_hunter_hit_by_goo_thrice_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01",
		name = "pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_hit_by_goo_thrice_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_ranger_hit_by_goo_thrice_02",
		name = "pbw_gameplay_ranger_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01",
		name = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_hit_by_goo_thrice_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_ranger_hit_by_goo_thrice_02",
		name = "pes_gameplay_ranger_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
		response = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02",
		name = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_hit_by_goo_thrice_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_ranger_hit_by_goo_thrice_00",
		name = "pwe_gameplay_ranger_hit_by_goo_thrice_00",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01",
		name = "pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_hit_by_goo_thrice_00"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_ranger_hit_by_goo_thrice_02",
		name = "pwh_gameplay_ranger_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03",
		name = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_hit_by_goo_thrice_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_soldier_hit_by_goo_thrice_02",
		name = "pbw_gameplay_soldier_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01",
		name = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_hit_by_goo_thrice_02"
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
		response = "pdr_gameplay_soldier_hit_by_goo_thrice_02",
		name = "pdr_gameplay_soldier_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02",
		name = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_hit_by_goo_thrice_02"
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
		response = "pwe_gameplay_soldier_hit_by_goo_thrice_02",
		name = "pwe_gameplay_soldier_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03",
		name = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_hit_by_goo_thrice_02"
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
		response = "pwh_gameplay_soldier_hit_by_goo_thrice_02",
		name = "pwh_gameplay_soldier_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04",
		name = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_hit_by_goo_thrice_02"
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
		response = "pdr_gameplay_wizard_hit_by_goo_thrice_02",
		name = "pdr_gameplay_wizard_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01",
		name = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_hit_by_goo_thrice_02"
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
		response = "pes_gameplay_wizard_hit_by_goo_thrice_02",
		name = "pes_gameplay_wizard_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
		response = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02",
		name = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_hit_by_goo_thrice_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_wizard_hit_by_goo_thrice_02",
		name = "pwe_gameplay_wizard_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03",
		name = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_hit_by_goo_thrice_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wizard_hit_by_goo_thrice_02",
		name = "pwh_gameplay_wizard_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04",
		name = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_hit_by_goo_thrice_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_elf_caught_by_slaver_3_times_02",
		name = "pbw_gameplay_elf_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_23",
		name = "pwh_gameplay_response_23",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_caught_by_slaver_3_times_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_117",
		name = "pes_gameplay_response_117",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_23"
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
		response = "pdr_gameplay_elf_caught_by_slaver_3_times_02",
		name = "pdr_gameplay_elf_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_124",
		name = "pwe_gameplay_response_124",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_caught_by_slaver_3_times_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_113",
		name = "pes_gameplay_response_113",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_124"
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
		response = "pes_gameplay_elf_caught_by_slaver_3_times_02",
		name = "pes_gameplay_elf_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
		response = "pwe_gameplay_response_125",
		name = "pwe_gameplay_response_125",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_caught_by_slaver_3_times_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_126",
		name = "pdr_gameplay_response_126",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_125"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_elf_caught_by_slaver_3_times_02",
		name = "pwh_gameplay_elf_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_130",
		name = "pwe_gameplay_response_130",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_caught_by_slaver_3_times_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_132",
		name = "pdr_gameplay_response_132",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_130"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_hunter_caught_by_slaver_3_times_02",
		name = "pbw_gameplay_hunter_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_128",
		name = "pwh_gameplay_response_128",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_130",
		name = "pdr_gameplay_response_130",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_128"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_caught_by_slaver_3_times_02",
		name = "pdr_gameplay_hunter_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_123",
		name = "pwh_gameplay_response_123",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_117",
		name = "pbw_gameplay_response_117",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_123"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_hunter_caught_by_slaver_3_times_02",
		name = "pes_gameplay_hunter_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
		response = "pwh_gameplay_response_124",
		name = "pwh_gameplay_response_124",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_120",
		name = "pbw_gameplay_response_120",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_124"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_hunter_caught_by_slaver_3_times_02",
		name = "pwe_gameplay_hunter_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_126",
		name = "pwh_gameplay_response_126",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_128",
		name = "pdr_gameplay_response_128",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_126"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_ranger_caught_by_slaver_3_times_02",
		name = "pbw_gameplay_ranger_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_129",
		name = "pdr_gameplay_response_129",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_127",
		name = "pwe_gameplay_response_127",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_129"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_ranger_caught_by_slaver_3_times_02",
		name = "pes_gameplay_ranger_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
		response = "pdr_gameplay_response_125",
		name = "pdr_gameplay_response_125",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_118",
		name = "pbw_gameplay_response_118",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_125"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_ranger_caught_by_slaver_3_times_02",
		name = "pwe_gameplay_ranger_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_127",
		name = "pdr_gameplay_response_127",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_121",
		name = "pbw_gameplay_response_121",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_127"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_ranger_caught_by_slaver_3_times_02",
		name = "pwh_gameplay_ranger_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_131",
		name = "pdr_gameplay_response_131",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_123",
		name = "pbw_gameplay_response_123",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_131"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_soldier_caught_by_slaver_3_times_02",
		name = "pbw_gameplay_soldier_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_116",
		name = "pes_gameplay_response_116",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_caught_by_slaver_3_times_02"
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
		response = "pwh_gameplay_response_127",
		name = "pwh_gameplay_response_127",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_116"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_soldier_caught_by_slaver_3_times_two",
		name = "pdr_gameplay_soldier_caught_by_slaver_3_times_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_112",
		name = "pes_gameplay_response_112",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_caught_by_slaver_3_times_two"
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
		response = "pwe_gameplay_response_123",
		name = "pwe_gameplay_response_123",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_112"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_soldier_caught_by_slaver_3_times_02",
		name = "pwe_gameplay_soldier_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_114",
		name = "pes_gameplay_response_114",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_caught_by_slaver_3_times_02"
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
		response = "pwh_gameplay_response_125",
		name = "pwh_gameplay_response_125",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_114"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_soldier_caught_by_slaver_3_times_02",
		name = "pwh_gameplay_soldier_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_118",
		name = "pes_gameplay_response_118",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_caught_by_slaver_3_times_02"
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
		response = "pwe_gameplay_response_129",
		name = "pwe_gameplay_response_129",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_118"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_wizard_caught_by_slaver_3_times_02",
		name = "pdr_gameplay_wizard_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_116",
		name = "pbw_gameplay_response_116",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_122",
		name = "pwh_gameplay_response_122",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_116"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_wizard_caught_by_slaver_3_times_02",
		name = "pes_gameplay_wizard_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
		response = "pbw_gameplay_response_119",
		name = "pbw_gameplay_response_119",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_126",
		name = "pwe_gameplay_response_126",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_119"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_wizard_caught_by_slaver_3_times_02",
		name = "pwe_gameplay_wizard_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_122",
		name = "pbw_gameplay_response_122",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_115",
		name = "pes_gameplay_response_115",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_122"
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
		response = "pwh_gameplay_wizard_caught_by_slaver_3_times_02",
		name = "pwh_gameplay_wizard_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_124",
		name = "pbw_gameplay_response_124",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_119",
		name = "pes_gameplay_response_119",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_124"
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
		response = "pdr_gameplay_killing_a_second_rat_ogre_01",
		name = "pdr_gameplay_killing_a_second_rat_ogre_01",
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
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_killing_a_second_rat_ogre_01",
		name = "pwh_gameplay_killing_a_second_rat_ogre_01",
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
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_37",
		name = "pbw_gameplay_response_37",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_killing_a_second_rat_ogre_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_37_alt1",
		name = "pwh_gameplay_response_37_alt1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_37"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_killing_a_second_rat_ogre_02",
		name = "pdr_gameplay_killing_a_second_rat_ogre_02",
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
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_30",
		name = "pes_gameplay_response_30",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_killing_a_second_rat_ogre_02"
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
		response = "pdr_gameplay_response_38",
		name = "pdr_gameplay_response_38",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_30"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_kiling_a_second_rat_ogre_01",
		name = "pwe_gameplay_kiling_a_second_rat_ogre_01",
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
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_31",
		name = "pes_gameplay_response_31",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_kiling_a_second_rat_ogre_01"
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
		response = "pwe_gameplay_killing_a_second_rat_ogre_02",
		name = "pwe_gameplay_killing_a_second_rat_ogre_02",
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
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_36",
		name = "pwh_gameplay_response_36",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_killing_a_second_rat_ogre_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_39",
		name = "pwe_gameplay_response_39",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_36"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_killing_a_second_rat_ogre_02",
		name = "pwh_gameplay_killing_a_second_rat_ogre_02",
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
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_39",
		name = "pdr_gameplay_response_39",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_killing_a_second_rat_ogre_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_killing_a_second_rat_ogre_01",
		name = "pbw_gameplay_killing_a_second_rat_ogre_01",
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
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_40",
		name = "pwe_gameplay_response_40",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_killing_a_second_rat_ogre_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_38",
		name = "pbw_gameplay_response_38",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_40"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_killing_a_second_rat_ogre_02",
		name = "pbw_killing_a_second_rat_ogre_02",
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
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_38",
		name = "pwh_gameplay_response_38",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_killing_a_second_rat_ogre_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_39",
		name = "pbw_gameplay_response_39",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_38"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_39",
		name = "pwh_gameplay_response_39",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_39"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_killing_a_second_rat_ogre_01",
		name = "pes_gameplay_killing_a_second_rat_ogre_01",
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
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_41",
		name = "pwe_gameplay_response_41",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_killing_a_second_rat_ogre_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_32",
		name = "pes_gameplay_response_32",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_41"
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
		response = "pes_gameplay_killing_a_second_rat_ogre_02",
		name = "pes_gameplay_killing_a_second_rat_ogre_02",
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
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_40",
		name = "pdr_gameplay_response_40",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_killing_a_second_rat_ogre_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_another_is_bunnyjumping_01",
		response = "pwe_gameplay_another_is_bunnyjumping_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"bunny_trigger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_another_is_bunnyjumping_01",
		response = "pes_gameplay_another_is_bunnyjumping_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"bunny_trigger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_another_is_bunnyjumping_01_alt1",
		response = "pwh_gameplay_another_is_bunnyjumping_01_alt1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"bunny_trigger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_another_is_bunnyjumping_01",
		response = "pbw_gameplay_another_is_bunnyjumping_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"bunny_trigger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_another_is_bunnyjumping_01",
		response = "pdr_gameplay_another_is_bunnyjumping_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"bunny_trigger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_elf_killing_spawn_melee_01",
		name = "pbw_gameplay_elf_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_185",
		name = "pwe_gameplay_response_185",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_spawn_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_183",
		name = "pwh_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_185"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_elf_killing_spawn_melee_01",
		name = "pdr_gameplay_elf_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_180",
		name = "pwe_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_spawn_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_177",
		name = "pwh_gameplay_response_177",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_180"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_elf_killing_spawn_melee_01",
		name = "pes_gameplay_elf_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_182",
		name = "pwe_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_spawn_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_181",
		name = "pdr_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_182"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_elf_killing_spawn_melee_01",
		name = "pwh_gameplay_elf_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_187",
		name = "pwe_gameplay_response_187",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_spawn_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_175",
		name = "pes_gameplay_response_175",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_187"
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
		response = "pbw_gameplay_hunter_killing_spawn_melee_01",
		name = "pbw_gameplay_hunter_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_184",
		name = "pwh_gameplay_response_184",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_spawn_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_185",
		name = "pdr_gameplay_response_185",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_184"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_killing_spawn_melee_01",
		name = "pdr_gameplay_hunter_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_178",
		name = "pwh_gameplay_response_178",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_spawn_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_168",
		name = "pes_gameplay_response_168",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_178"
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
		response = "pes_gameplay_hunter_killing_spawn_melee_01",
		name = "pes_gameplay_hunter_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_180",
		name = "pwh_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_killing_spawn_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_177",
		name = "pbw_gameplay_response_177",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_180"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_hunter_killing_spawn_melee_01",
		name = "pwe_gameplay_hunter_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_182",
		name = "pwh_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_spawn_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_171",
		name = "pes_gameplay_response_171",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_182"
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
		response = "pbw_gameplay_ranger_killing_spawn_melee_01",
		name = "pbw_gameplay_ranger_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_184",
		name = "pdr_gameplay_response_184",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_spawn_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_172",
		name = "pes_gameplay_response_172",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_184"
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
		response = "pes_gameplay_ranger_killing_spawn_melee_01",
		name = "pes_gameplay_ranger_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_180",
		name = "pdr_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_killing_spawn_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_179",
		name = "pwh_gameplay_response_179",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_180"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_ranger_killing_spawn_melee_01",
		name = "pwe_gameplay_ranger_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_182",
		name = "pdr_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_spawn_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_169",
		name = "pes_gameplay_response_169",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_182"
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
		response = "pwh_gameplay_ranger_killing_spawn_melee_01",
		name = "pwh_gameplay_ranger_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_186",
		name = "pdr_gameplay_response_186",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_spawn_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_179",
		name = "pbw_gameplay_response_179",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_186"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_soldier_killing_spawn_melee_01",
		name = "pbw_gameplay_soldier_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_173",
		name = "pes_gameplay_response_173",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_spawn_melee_01"
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
		response = "pwe_gameplay_response_184",
		name = "pwe_gameplay_response_184",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_173"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_soldier_killing_spawn_melee_01",
		name = "pdr_gameplay_soldier_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_167",
		name = "pes_gameplay_response_167",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_spawn_melee_01"
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
		response = "pbw_gameplay_response_174",
		name = "pbw_gameplay_response_174",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_167"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_soldier_killing_spawn_melee_01",
		name = "pwe_gameplay_soldier_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_170",
		name = "pes_gameplay_response_170",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_spawn_melee_01"
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
		response = "pwh_gameplay_response_181",
		name = "pwh_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_170"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_soldier_killing_spawn_melee_01",
		name = "pwh_gameplay_soldier_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_174",
		name = "pes_gameplay_response_174",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_spawn_melee_01"
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
		response = "pwe_gameplay_response_186",
		name = "pwe_gameplay_response_186",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_174"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_wizard_killing_spawn_melee_01",
		name = "pdr_gameplay_wizard_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_175",
		name = "pbw_gameplay_response_175",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_spawn_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_181",
		name = "pwe_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_175"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_wizard_killing_spawn_melee_01",
		name = "pes_gameplay_wizard_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_176",
		name = "pbw_gameplay_response_176",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_spawn_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_183",
		name = "pwe_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_176"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_wizard_killing_spawn_melee_01",
		name = "pwe_gameplay_wizard_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_178",
		name = "pbw_gameplay_response_178",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_spawn_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_183",
		name = "pdr_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_178"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wizard_killing_spawn_melee_01",
		name = "pwh_gameplay_wizard_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_180",
		name = "pbw_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_spawn_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_187",
		name = "pdr_gameplay_response_187",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_180"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_elf_killing_spawn_ranged_01",
		name = "pbw_gameplay_elf_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_192",
		name = "pwe_gameplay_response_192",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_spawn_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_193",
		name = "pdr_gameplay_response_193",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_192"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_elf_killing_spawn_ranged_01",
		name = "pdr_gameplay_elf_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_188",
		name = "pwe_gameplay_response_188",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_spawn_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_177",
		name = "pes_gameplay_response_177",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_188"
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
		response = "pes_gameplay_elf_killing_spawn_ranged_01",
		name = "pes_gameplay_elf_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_191",
		name = "pwe_gameplay_response_191",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_spawn_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_187",
		name = "pwh_gameplay_response_187",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_191"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_elf_killing_spawn_ranged_01",
		name = "pwh_gameplay_elf_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_195",
		name = "pwe_gameplay_response_195",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_spawn_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_187",
		name = "pbw_gameplay_response_187",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_195"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_hunter_killing_spawn_ranged_01",
		name = "pbw_gameplay_hunter_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_192",
		name = "pwh_gameplay_response_192",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_spawn_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_193",
		name = "pwe_gameplay_response_193",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_192"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_killing_spawn_ranged_01",
		name = "pdr_gameplay_hunter_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_186",
		name = "pwh_gameplay_response_186",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_spawn_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_189",
		name = "pwe_gameplay_response_189",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_186"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_hunter_killing_spawn_ranged_01",
		name = "pes_gameplay_hunter_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_188",
		name = "pwh_gameplay_response_188",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_killing_spawn_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_184",
		name = "pbw_gameplay_response_184",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_188"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_hunter_killing_spawn_ranged_01",
		name = "pwe_gameplay_hunter_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_190",
		name = "pwh_gameplay_response_190",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_spawn_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_186",
		name = "pbw_gameplay_response_186",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_190"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_ranger_killing_spawn_ranged_01",
		name = "pbw_gameplay_ranger_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_192",
		name = "pdr_gameplay_response_192",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_spawn_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_180",
		name = "pes_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_192"
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
		response = "pes_gameplay_ranger_killing_spawn_ranged_01",
		name = "pes_gameplay_ranger_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_188",
		name = "pdr_gameplay_response_188",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_killing_spawn_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_190",
		name = "pwe_gameplay_response_190",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_188"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_ranger_killing_spawn_ranged_01",
		name = "pwe_gameplay_ranger_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_190",
		name = "pdr_gameplay_response_190",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_spawn_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_189",
		name = "pwh_gameplay_response_189",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_190"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_ranger_killing_spawn_ranged_01",
		name = "pwh_gameplay_ranger_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_194",
		name = "pdr_gameplay_response_194",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_spawn_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_182",
		name = "pes_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_194"
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
		response = "pbw_gameplay_soldier_killing_spawn_ranged_01",
		name = "pbw_gameplay_soldier_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_181",
		name = "pes_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_spawn_ranged_01"
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
		response = "pwh_gameplay_response_191",
		name = "pwh_gameplay_response_191",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_181"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_soldier_killing_spawn_ranged_01",
		name = "pdr_gameplay_soldier_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_176",
		name = "pes_gameplay_response_176",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_spawn_ranged_01"
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
		response = "pbw_gameplay_response_181",
		name = "pbw_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_176"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_soldier_killing_spawn_ranged_01",
		name = "pwe_gameplay_soldier_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_178",
		name = "pes_gameplay_response_178",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_spawn_ranged_01"
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
		response = "pdr_gameplay_response_191",
		name = "pdr_gameplay_response_191",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_178"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_soldier_killing_spawn_ranged_01",
		name = "pwh_gameplay_soldier_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_183",
		name = "pes_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_spawn_ranged_01"
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
		response = "pwe_gameplay_response_194",
		name = "pwe_gameplay_response_194",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_183"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_wizard_killing_spawn_ranged_01",
		name = "pdr_gameplay_wizard_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_182",
		name = "pbw_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_spawn_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_185",
		name = "pwh_gameplay_response_185",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_182"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_wizard_killing_spawn_ranged_01",
		name = "pes_gameplay_wizard_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_183",
		name = "pbw_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_spawn_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_189",
		name = "pdr_gameplay_response_189",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_183"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_wizard_killing_spawn_ranged_01",
		name = "pwe_gameplay_wizard_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_185",
		name = "pbw_gameplay_response_185",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_spawn_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_179",
		name = "pes_gameplay_response_179",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_185"
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
		response = "pwh_gameplay_wizard_killing_spawn_ranged_01",
		name = "pwh_gameplay_wizard_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_188",
		name = "pbw_gameplay_response_188",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_spawn_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_195",
		name = "pdr_gameplay_response_195",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_188"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_elf_killing_troll_melee_01",
		name = "pbw_gameplay_elf_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_152",
		name = "pwe_gameplay_response_152",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_troll_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_151",
		name = "pwh_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_152"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_elf_killing_troll_melee_01",
		name = "pdr_gameplay_elf_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_147",
		name = "pwe_gameplay_response_147",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_troll_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_137",
		name = "pes_gameplay_response_137",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_147"
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
		response = "pes_gameplay_elf_killing_troll_melee_01",
		name = "pes_gameplay_elf_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_149",
		name = "pwe_gameplay_response_149",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_troll_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_150",
		name = "pdr_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_149"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_elf_killing_troll_melee_01",
		name = "pwh_gameplay_elf_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_154",
		name = "pwe_gameplay_response_154",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_troll_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_147",
		name = "pbw_gameplay_response_147",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_149"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_hunter_killing_troll_melee_01",
		name = "pbw_gameplay_hunter_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_152",
		name = "pwh_gameplay_response_152",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_troll_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_154",
		name = "pdr_gameplay_response_154",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_149"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_killing_troll_melee_01",
		name = "pdr_gameplay_hunter_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_146",
		name = "pwh_gameplay_response_146",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_troll_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_142",
		name = "pbw_gameplay_response_142",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_146"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_hunter_killing_troll_melee_01",
		name = "pes_gameplay_hunter_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_148",
		name = "pwh_gameplay_response_148",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_killing_troll_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_150",
		name = "pwe_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_148"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_hunter_killing_troll_melee_01",
		name = "pwe_gameplay_hunter_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_150",
		name = "pwh_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_troll_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_152",
		name = "pdr_gameplay_response_152",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_150"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_ranger_killing_troll_melee_01",
		name = "pbw_gameplay_ranger_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_153",
		name = "pdr_gameplay_response_153",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_troll_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_140",
		name = "pes_gameplay_response_140",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_153"
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
		response = "pwe_gameplay_ranger_killing_troll_melee_01",
		name = "pwe_gameplay_ranger_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_151",
		name = "pdr_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_troll_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_149",
		name = "pwh_gameplay_response_149",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_151"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_ranger_killing_troll_melee_01",
		name = "pwh_gameplay_ranger_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_155",
		name = "pdr_gameplay_response_155",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_troll_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_142",
		name = "pes_gameplay_response_142",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_155"
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
		response = "pbw_gameplay_soldier_killing_troll_melee_01",
		name = "pbw_gameplay_soldier_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_141",
		name = "pes_gameplay_response_141",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_troll_melee_01"
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
		response = "pwe_gameplay_response_151",
		name = "pwe_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_141"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_136",
		name = "pes_gameplay_response_136",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_troll_melee_01"
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
		response = "pwh_gameplay_response_145",
		name = "pwh_gameplay_response_145",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_136"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_138",
		name = "pes_gameplay_response_138",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_troll_melee_01"
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
		response = "pbw_gameplay_response_145",
		name = "pbw_gameplay_response_145",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_138"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_143",
		name = "pes_gameplay_response_143",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_troll_melee_01"
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
		response = "pbw_gameplay_response_199",
		name = "pbw_gameplay_response_199",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_143"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_141",
		name = "pbw_gameplay_response_141",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_troll_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_148",
		name = "pwe_gameplay_response_148",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_141"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_144",
		name = "pbw_gameplay_response_144",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_troll_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_147",
		name = "pwh_gameplay_response_147",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_144"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_146",
		name = "pbw_gameplay_response_146",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_troll_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_139",
		name = "pes_gameplay_response_139",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_146"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_148",
		name = "pbw_gameplay_response_148",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_troll_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_144",
		name = "pes_gameplay_response_144",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_148"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_159",
		name = "pwe_gameplay_response_159",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_troll_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_161",
		name = "pdr_gameplay_response_161",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_159"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_155",
		name = "pwe_gameplay_response_155",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_troll_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_146",
		name = "pes_gameplay_response_146",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_155"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_157",
		name = "pwe_gameplay_response_157",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_troll_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_155",
		name = "pwh_gameplay_response_155",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_157"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_162",
		name = "pwe_gameplay_response_162",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_troll_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_156",
		name = "pbw_gameplay_response_156",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_162"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_160",
		name = "pwh_gameplay_response_160",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_troll_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_160",
		name = "pwe_gameplay_response_160",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_160"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_154",
		name = "pwh_gameplay_response_154",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_troll_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_150",
		name = "pbw_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_154"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_156",
		name = "pwh_gameplay_response_156",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_killing_troll_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_157",
		name = "pdr_gameplay_response_157",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_156"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_158",
		name = "pwh_gameplay_response_158",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_troll_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_148",
		name = "pes_gameplay_response_148",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_158"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_160",
		name = "pdr_gameplay_response_160",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_troll_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_149",
		name = "pes_gameplay_response_149",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_160"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_156",
		name = "pdr_gameplay_response_156",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_killing_troll_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_151",
		name = "pbw_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_156"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_158",
		name = "pdr_gameplay_response_158",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_troll_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_157",
		name = "pwh_gameplay_response_157",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_158"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_162",
		name = "pdr_gameplay_response_162",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_troll_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_155",
		name = "pbw_gameplay_response_155",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_162"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_150",
		name = "pes_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_troll_ranged_01"
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
		response = "pwh_gameplay_response_159",
		name = "pwh_gameplay_response_159",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_150"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_145",
		name = "pes_gameplay_response_145",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_troll_ranged_01"
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
		response = "pwh_gameplay_response_153",
		name = "pwh_gameplay_response_153",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_145"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_147",
		name = "pes_gameplay_response_147",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_troll_ranged_01"
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
		response = "pbw_gameplay_response_153",
		name = "pbw_gameplay_response_153",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_147"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_151",
		name = "pes_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_troll_ranged_01"
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
		response = "pwe_gameplay_response_161",
		name = "pwe_gameplay_response_161",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_151"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_149",
		name = "pbw_gameplay_response_149",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_troll_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_156",
		name = "pwe_gameplay_response_156",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_149"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_152",
		name = "pbw_gameplay_response_152",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_troll_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_158",
		name = "pwe_gameplay_response_158",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_152"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_159",
		name = "pdr_gameplay_response_159",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_troll_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_154",
		name = "pbw_gameplay_response_154",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_159"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_157",
		name = "pbw_gameplay_response_157",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_troll_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_163",
		name = "pdr_gameplay_response_163",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_157"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_killing_rat_ogre_01",
		name = "pbw_gameplay_killing_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_04",
		name = "pes_gameplay_response_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_killing_rat_ogre_01"
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
		response = "pes_gameplay_killing_rat_ogre_01",
		name = "pes_gameplay_killing_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_07",
		name = "pdr_gameplay_response_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_killing_rat_ogre_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pdr_hunter_shoots_rat_ogre_01",
		name = "pdr_hunter_shoots_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_08",
		name = "pwh_gameplay_response_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hunter_shoots_rat_ogre_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_08",
		name = "pbw_gameplay_response_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_08"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_killing_a_rat_ogre_01",
		name = "pwh_gameplay_killing_a_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_08",
		name = "pwe_gameplay_response_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_killing_a_rat_ogre_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_elf_shoots_a_rat_ogre_01",
		name = "pes_gameplay_elf_shoots_a_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
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
		response = "pwe_gameplay_response_09",
		name = "pwe_gameplay_response_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_shoots_a_rat_ogre_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_killing_a_rat_ogre_01",
		name = "pwe_gameplay_killing_a_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_05",
		name = "pes_gameplay_response_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_killing_a_rat_ogre_01"
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
		response = "pdr_gameplay_killing_a_rat_ogre_crossbow_01",
		name = "pdr_gameplay_killing_a_rat_ogre_crossbow_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_type",
				OP.EQ,
				"dr_crossbow"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_07",
		name = "pwe_gameplay_response_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_killing_a_rat_ogre_crossbow_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_wizard_fires_a_rat_ogre_01",
		name = "pdr_gameplay_wizard_fires_a_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"dot_type",
				OP.EQ,
				"burning_dot"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_06",
		name = "pwh_gameplay_response_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_fires_a_rat_ogre_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_07_b",
		name = "pbw_gameplay_response_07_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_06"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_elf_killing_rat_ogre_melee_01",
		name = "pbw_gameplay_elf_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
		name = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_rat_ogre_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
		name = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_07"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_hunter_killing_rat_ogre_melee_01",
		name = "pbw_gameplay_hunter_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01",
		name = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_rat_ogre_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_01",
		name = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_ranger_killing_rat_ogre_melee_01",
		name = "pbw_gameplay_ranger_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01",
		name = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_ranger_killing_rat_ogre_melee_reply_01",
		name = "pbw_gameplay_ranger_killing_rat_ogre_melee_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_soldier_killing_rat_ogre_melee_01",
		name = "pbw_gameplay_soldier_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
		name = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_rat_ogre_melee_01"
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
		response = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
		name = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_elf_killing_rat_ogre_melee_01",
		name = "pdr_gameplay_elf_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02",
		name = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_rat_ogre_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_02",
		name = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_killing_rat_ogre_melee_01",
		name = "pdr_gameplay_hunter_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
		name = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_rat_ogre_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
		name = "pwe_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_soldier_killing_rat_ogre_melee_01",
		name = "pdr_gameplay_soldier_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
		name = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_rat_ogre_melee_01"
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
		response = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
		name = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_wizard_killing_rat_ogre_melee_01",
		name = "pdr_gameplay_wizard_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01",
		name = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_01",
		name = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01"
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
		response = "pes_gameplay_elf_killing_rat_ogre_melee_01",
		name = "pes_gameplay_elf_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03",
		name = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_rat_ogre_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
		name = "pbw_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_ranger_killing_rat_ogre_melee_01",
		name = "pes_gameplay_ranger_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02",
		name = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_ranger_killing_rat_ogre_melee_reply_02",
		name = "pwe_gameplay_ranger_killing_rat_ogre_melee_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_wizard_killing_rat_ogre_melee_01",
		name = "pes_gameplay_wizard_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_killing_rat_ogre_melee_01",
		name = "pbw_gameplay_wizard_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_hunter_killing_rat_ogre_melee_01",
		name = "pwe_gameplay_hunter_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04",
		name = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_rat_ogre_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
		name = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_ranger_killing_rat_ogre_melee_01",
		name = "pwe_gameplay_ranger_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03",
		name = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_ranger_killing_rat_ogre_melee_01_reply_02",
		name = "pwe_gameplay_ranger_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_soldier_killing_rat_ogre_melee_01",
		name = "pwe_gameplay_soldier_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
		name = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_rat_ogre_melee_01"
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
		response = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
		name = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_wizard_killing_rat_ogre_melee_01",
		name = "pwe_gameplay_wizard_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02",
		name = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_02",
		name = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_elf_killing_rat_ogre_melee_01",
		name = "pwh_gameplay_elf_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_082",
		name = "pwe_gameplay_response_082",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_rat_ogre_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_078",
		name = "pbw_gameplay_response_078",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_082"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_ranger_killing_rat_ogre_melee_01",
		name = "pwh_gameplay_ranger_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_079",
		name = "pdr_gameplay_response_079",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_079",
		name = "pwh_gameplay_response_079",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_079"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_soldier_killing_rat_ogre_melee_01",
		name = "pwh_gameplay_soldier_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_071",
		name = "pes_gameplay_response_071",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_rat_ogre_melee_01"
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
		response = "pwe_gameplay_response_081",
		name = "pwe_gameplay_response_081",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_071"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wizard_killing_rat_ogre_melee_01",
		name = "pwh_gameplay_wizard_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_079",
		name = "pbw_gameplay_response_079",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_080",
		name = "pdr_gameplay_response_080",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_079"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_elf_killing_rat_ogre_ranged_01",
		name = "pbw_gameplay_elf_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		name = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		name = "pdr_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_079"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_hunter_killing_rat_ogre_ranged_01",
		name = "pbw_gameplay_hunter_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		name = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		name = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
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
		response = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01",
		name = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		name = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		name = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01",
		name = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
		name = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_rat_ogre_ranged_01"
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
		response = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
		name = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_elf_killing_rat_ogre_ranged_01",
		name = "pdr_gameplay_elf_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02",
		name = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_rat_ogre_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		name = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02"
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
		response = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01",
		name = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
		name = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		name = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01",
		name = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
		name = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_rat_ogre_ranged_01"
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
		response = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
		name = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01",
		name = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01",
		name = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wizard_killing_rat_ogre_ranged_reply_01",
		name = "pwh_gameplay_wizard_killing_rat_ogre_ranged_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_elf_killing_rat_ogre_ranged_01",
		name = "pes_gameplay_elf_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03",
		name = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_rat_ogre_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		name = "pbw_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_hunter_killing_rat_ogre_ranged_01",
		name = "pes_gameplay_hunter_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		name = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
		name = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_ranger_killing_rat_ogre_ranged_01",
		name = "pes_gameplay_ranger_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		name = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		name = "pes_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
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
		response = "pes_gameplay_wizard_killing_rat_ogre_ranged_01",
		name = "pes_gameplay_wizard_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02",
		name = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02",
		name = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01",
		name = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03",
		name = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
		name = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03"
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
		response = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01",
		name = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02",
		name = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		name = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01",
		name = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03",
		name = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_rat_ogre_ranged_01"
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
		response = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
		name = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_wizard_killing_rat_ogre_ranged_01",
		name = "pwe_gameplay_wizard_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03",
		name = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_04",
		name = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_elf_killing_rat_ogre_ranged_01",
		name = "pwh_gameplay_elf_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04",
		name = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_rat_ogre_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_02",
		name = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04"
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
		response = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01",
		name = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03",
		name = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03",
		name = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_soldier_killing_rat_ogre_ranged_01",
		name = "pwh_gameplay_soldier_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04",
		name = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_rat_ogre_ranged_01"
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
		response = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
		name = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01",
		name = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05",
		name = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05",
		name = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_hunter_misses_bomb_01",
		name = "pwe_gameplay_hunter_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_19",
		name = "pwh_gameplay_response_19",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_misses_bomb_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_20",
		name = "pwe_gameplay_response_20",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_19"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_misses_bomb_01",
		name = "pdr_gameplay_hunter_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_20",
		name = "pwh_gameplay_response_20",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_misses_bomb_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_17",
		name = "pdr_gameplay_response_17",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_20"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_hunter_misses_bomb_01",
		name = "pbw_gameplay_hunter_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_21",
		name = "pwh_gameplay_response_21",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_misses_bomb_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_hunter_misses_bomb_01",
		name = "pes_gameplay_hunter_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwh_gameplay_response_22",
		name = "pwh_gameplay_response_22",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_misses_bomb_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_elf_misses_bomb_01",
		name = "pwh_gameplay_elf_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_21",
		name = "pwe_gameplay_response_21",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_misses_bomb_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_elf_misses_bomb_01",
		name = "pdr_gameplay_elf_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_22",
		name = "pwe_gameplay_response_22",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_misses_bomb_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_elf_misses_bomb_01",
		name = "pbw_gameplay_elf_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_23",
		name = "pwe_gameplay_response_23",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_misses_bomb_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_elf_misses_bomb_01",
		name = "pes_gameplay_elf_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwe_gameplay_response_24",
		name = "pwe_gameplay_response_24",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_misses_bomb_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wizard_misses_bomb_01",
		name = "pwh_gameplay_wizard_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_21",
		name = "pbw_gameplay_response_21",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_misses_bomb_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_wizard_misses_bomb_01",
		name = "pdr_gameplay_wizard_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwb_gameplay_response_18",
		name = "pwb_gameplay_response_18",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_misses_bomb_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_wizard_misses_bomb_01",
		name = "pwe_gameplay_wizard_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_19",
		name = "pbw_gameplay_response_19",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_misses_bomb_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_wizard_misses_bomb_01",
		name = "pes_gameplay_wizard_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pbw_gameplay_response_20",
		name = "pbw_gameplay_response_20",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_misses_bomb_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_solider_misses_bomb_01",
		name = "pwh_gameplay_solider_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_16",
		name = "pes_gameplay_response_16",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_solider_misses_bomb_01"
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
		response = "pdr_gameplay_soldier_misses_bomb_01",
		name = "pdr_gameplay_soldier_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_13",
		name = "pes_gameplay_response_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_misses_bomb_01"
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
		response = "pdr_gameplay_response_18",
		name = "pdr_gameplay_response_18",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_13"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_soldier_misses_bomb_01",
		name = "pwe_gameplay_soldier_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_14",
		name = "pes_gameplay_response_14",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_misses_bomb_01"
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
		response = "pbw_gameplay_soldier_misses_bomb_01",
		name = "pbw_gameplay_soldier_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_15",
		name = "pes_gameplay_response_15",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_misses_bomb_01"
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
		response = "pwh_gameplay_ranger_misses_bomb_01",
		name = "pwh_gameplay_ranger_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_19",
		name = "pdr_gameplay_response_19",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_misses_bomb_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_ranger_misses_bomb_01",
		name = "pes_gameplay_ranger_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pdr_gameplay_response_22",
		name = "pdr_gameplay_response_22",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_misses_bomb_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_17",
		name = "pes_gameplay_response_17",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_22"
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
		response = "pdr_gameplay_response_23",
		name = "pdr_gameplay_response_23",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_17"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_ranger_misses_bomb_01",
		name = "pwe_gameplay_ranger_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_20",
		name = "pdr_gameplay_response_20",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_misses_bomb_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_ranger_misses_bomb_01",
		name = "pbw_gameplay_ranger_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_21",
		name = "pdr_gameplay_response_21",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_misses_bomb_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	add_dialogues({
		pes_gameplay_elf_downed_3_times_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_downed_3_times_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_09"
			}
		},
		pwe_gameplay_soldier_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_02"
			}
		},
		pwh_gameplay_wizard_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_melee_01"
			}
		},
		pdr_gameplay_killing_a_second_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_killing_a_second_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_killing_a_second_rat_ogre_01"
			}
		},
		pwe_gameplay_ranger_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_02_reply_01"
			}
		},
		pwe_gameplay_soldier_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_01"
			}
		},
		pbw_gameplay_killing_a_second_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_killing_a_second_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_killing_a_second_rat_ogre_01"
			}
		},
		pes_gameplay_killing_a_second_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_killing_a_second_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_killing_a_second_rat_ogre_01"
			}
		},
		pdr_gameplay_soldier_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_02"
			}
		},
		pwe_gameplay_wizard_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_killing_rat_ogre_melee_01"
			}
		},
		pwe_gameplay_response_40 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_40"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_40"
			}
		},
		pwe_gameplay_response_125 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_125"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_125"
			}
		},
		pes_gameplay_response_174 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_174"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_174"
			}
		},
		pbw_gameplay_ranger_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_03_reply_01"
			}
		},
		pbw_gameplay_soldier_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_01"
			}
		},
		pwh_gameplay_response_160 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_160"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_160"
			}
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pes_gameplay_ranger_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_02_reply_01"
			}
		},
		pwh_gameplay_killing_a_second_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_killing_a_second_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_killing_a_second_rat_ogre_01"
			}
		},
		pdr_gameplay_soldier_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_01"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_04_reply_01"
			}
		},
		pdr_gameplay_wizard_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_killing_rat_ogre_melee_01"
			}
		},
		pes_gameplay_wizard_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_melee_01"
			}
		},
		pwe_gameplay_elf_potions_above_half_health_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_02_reply_02"
			}
		},
		pes_gameplay_ranger_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_rat_ogre_ranged_01"
			}
		},
		pdr_gameplay_response_188 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_188"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_188"
			}
		},
		pdr_gameplay_hunter_downed_3_times_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_09"
			}
		},
		pwh_gameplay_hunter_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_09_reply_01"
			}
		},
		pes_gameplay_elf_potions_above_half_health_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_01_reply_02"
			}
		},
		pbw_gameplay_soldier_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_spawn_melee_01"
			}
		},
		pdr_gameplay_soldier_caught_by_slaver_3_times_two = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_caught_by_slaver_3_times_two"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_caught_by_slaver_3_times_two"
			}
		},
		pdr_gameplay_soldier_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_spawn_melee_01"
			}
		},
		pes_gameplay_hunter_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_07_reply_01"
			}
		},
		pdr_gameplay_hunter_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_08_reply_01"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_02_reply_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_04"
			}
		},
		pbw_gameplay_response_123 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_123"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_123"
			}
		},
		pes_gameplay_response_32 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_32"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_32"
			}
		},
		pes_gameplay_ranger_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_03"
			}
		},
		pwe_gameplay_response_191 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_191"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_191"
			}
		},
		pwe_gameplay_response_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_08"
			}
		},
		pwe_gameplay_response_161 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_gameplay_response_161",
				[2.0] = "pdr_gameplay_wizard_killing_troll_ranged_01"
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
				[1.0] = "pwe_gameplay_response_161",
				[2.0] = "pdr_gameplay_wizard_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pes_gameplay_elf_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_ranged_01"
			}
		},
		pdr_gameplay_elf_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_rat_ogre_ranged_01"
			}
		},
		pwe_gameplay_ranger_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_spawn_melee_01"
			}
		},
		pbw_gameplay_elf_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_ranged_01"
			}
		},
		pes_gameplay_response_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_05"
			}
		},
		pdr_gameplay_response_161 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_gameplay_response_161",
				[2.0] = "pdr_gameplay_elf_killing_troll_ranged_01"
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
				[1.0] = "pdr_gameplay_response_161",
				[2.0] = "pdr_gameplay_elf_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_response_174 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_174"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_174"
			}
		},
		pbw_gameplay_ranger_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_spawn_melee_01"
			}
		},
		pwh_gameplay_ranger_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_misses_bomb_01"
			}
		},
		pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02"
			}
		},
		pbw_gameplay_soldier_potions_above_half_health_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_reply_01"
			}
		},
		pes_gameplay_response_148 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_gameplay_response_148",
				[2.0] = "pbw_gameplay_ranger_killing_troll_ranged_01"
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
				[1.0] = "pes_gameplay_response_148",
				[2.0] = "pbw_gameplay_ranger_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_response_162 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_162"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_162"
			}
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03"
			}
		},
		pes_gameplay_elf_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_03"
			}
		},
		pdr_gameplay_elf_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_03"
			}
		},
		pwh_gameplay_response_155 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_gameplay_response_155",
				[2.0] = "pwh_gameplay_elf_killing_troll_ranged_01"
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
				[1.0] = "pwh_gameplay_response_155",
				[2.0] = "pwh_gameplay_elf_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pdr_gameplay_response_131 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_131"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_131"
			}
		},
		pes_gameplay_response_171 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_171"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_171"
			}
		},
		pes_gameplay_response_139 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_gameplay_response_139",
				[2.0] = "pwh_gameplay_wizard_killing_troll_melee_01"
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
				[1.0] = "pes_gameplay_response_139",
				[2.0] = "pwh_gameplay_wizard_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pwh_gameplay_elf_downed_3_times_03_azsd = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_03_azsd"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_03_azsd"
			}
		},
		pbw_gameplay_soldier_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_02"
			}
		},
		pwh_gameplay_response_126 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_126"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_126"
			}
		},
		pes_gameplay_ranger_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_misses_bomb_01"
			}
		},
		pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pbw_gameplay_ranger_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_misses_bomb_01"
			}
		},
		pwh_gameplay_response_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_06"
			}
		},
		pbw_gameplay_another_is_bunnyjumping_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_another_is_bunnyjumping_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_another_is_bunnyjumping_01"
			}
		},
		pes_gameplay_response_119 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_119"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_119"
			}
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02"
			}
		},
		pbw_gameplay_elf_downed_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_02"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_01_reply_02"
			}
		},
		pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01"
			}
		},
		pdr_gameplay_soldier_potions_above_half_health_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_02_reply_02"
			}
		},
		pwe_gameplay_wizard_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_caught_by_slaver_3_times_02"
			}
		},
		pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03"
			}
		},
		pbw_gameplay_response_39 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_39"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_39"
			}
		},
		pwh_gameplay_ranger_downed_3_times_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_04"
			}
		},
		pwh_gameplay_wizard_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_caught_by_slaver_3_times_02"
			}
		},
		pwe_gameplay_wizard_downed_3_times_12 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_12"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_12"
			}
		},
		pwe_gameplay_wizard_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_11_reply_01"
			}
		},
		pwe_gameplay_response_082 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_082"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_082"
			}
		},
		pwe_gameplay_another_is_bunnyjumping_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_another_is_bunnyjumping_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_another_is_bunnyjumping_01"
			}
		},
		pdr_gameplay_another_is_bunnyjumping_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_another_is_bunnyjumping_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_another_is_bunnyjumping_01"
			}
		},
		pwe_gameplay_response_182 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_182"
			}
		},
		pwh_gameplay_wizard_downed_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02"
			}
		},
		pwh_gameplay_response_156 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_156"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_156"
			}
		},
		pes_gameplay_response_178 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_178"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_178"
			}
		},
		pwe_gameplay_response_149 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_149"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_149"
			}
		},
		pbw_gameplay_response_141 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_141"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_141"
			}
		},
		pwe_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pdr_gameplay_response_194 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_194"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_194"
			}
		},
		pwh_gameplay_elf_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_melee_01"
			}
		},
		pdr_gameplay_response_39 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_39"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_39"
			}
		},
		pbw_gameplay_elf_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_melee_01"
			}
		},
		pdr_gameplay_response_151 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_151"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_151"
			}
		},
		pes_gameplay_wizard_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_caught_by_slaver_3_times_02"
			}
		},
		pdr_gameplay_wizard_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_caught_by_slaver_3_times_02"
			}
		},
		pes_gameplay_response_150 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_150"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_150"
			}
		},
		pwe_gameplay_response_155 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_155"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_155"
			}
		},
		pwh_gameplay_response_191 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_191"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_191"
			}
		},
		pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pes_gameplay_response_138 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_138"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_138"
			}
		},
		pes_gameplay_response_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_04"
			}
		},
		pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01"
			}
		},
		pes_gameplay_response_116 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_116"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_116"
			}
		},
		pwe_gameplay_response_21 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_21"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_21"
			}
		},
		pbw_gameplay_response_155 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_155",
				[2.0] = "pbw_gameplay_soldier_killing_troll_ranged_01"
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
				[1.0] = "pbw_gameplay_response_155",
				[2.0] = "pbw_gameplay_soldier_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pdr_gameplay_soldier_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_03"
			}
		},
		pdr_gameplay_wizard_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_killing_spawn_ranged_01"
			}
		},
		pwh_gameplay_soldier_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_3_special_kills_in_a_row_01"
			}
		},
		pdr_gameplay_response_127 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_127"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_127"
			}
		},
		pbw_gameplay_soldier_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_03"
			}
		},
		pwe_gameplay_response_20 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_20"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_20"
			}
		},
		pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01"
			}
		},
		pbw_gameplay_ranger_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_01"
			}
		},
		pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03"
			}
		},
		pdr_gameplay_wizard_potions_above_half_health_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_04"
			}
		},
		pbw_gameplay_response_180 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_180"
			}
		},
		pes_gameplay_ranger_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_01"
			}
		},
		pwe_gameplay_soldier_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_03"
			}
		},
		pdr_gameplay_response_150 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_150"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_150"
			}
		},
		pwh_gameplay_response_159 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_gameplay_response_159",
				[2.0] = "pdr_gameplay_soldier_killing_troll_ranged_01"
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
				[1.0] = "pwh_gameplay_response_159",
				[2.0] = "pdr_gameplay_soldier_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_response_053 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_053"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_053"
			}
		},
		pwh_gameplay_wizard_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_spawn_ranged_01"
			}
		},
		pwh_gameplay_wizard_killing_rat_ogre_ranged_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_reply_01"
			}
		},
		pes_gameplay_wizard_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_12_reply_01"
			}
		},
		pes_gameplay_response_172 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_172"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_172"
			}
		},
		pbw_gameplay_wizard_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_11_reply_01"
			}
		},
		pbw_gameplay_response_184 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_184"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_184"
			}
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03"
			}
		},
		pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_04"
			}
		},
		pwh_gameplay_response_178 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_178"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_178"
			}
		},
		pdr_gameplay_soldier_downed_3_times_11 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_11"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_11"
			}
		},
		pwe_gameplay_response_124 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_124"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_124"
			}
		},
		pwh_gameplay_response_179 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_179"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_179"
			}
		},
		pbw_gameplay_soldier_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_hit_by_goo_thrice_02"
			}
		},
		pwh_gameplay_response_183 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_183"
			}
		},
		pdr_gameplay_response_21 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_21"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_21"
			}
		},
		pdr_gameplay_response_20 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_20"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_20"
			}
		},
		pwe_gameplay_ranger_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_misses_bomb_01"
			}
		},
		pdr_gameplay_response_23 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_23"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_23"
			}
		},
		pwh_gameplay_hanging_help = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_hanging_help_01",
				"pwh_gameplay_hanging_help_02",
				"pwh_gameplay_hanging_help_03",
				"pwh_gameplay_hanging_help_04",
				"pwh_gameplay_hanging_help_05",
				"pwh_gameplay_hanging_help_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_gameplay_hanging_help_01",
				"pwh_gameplay_hanging_help_02",
				"pwh_gameplay_hanging_help_03",
				"pwh_gameplay_hanging_help_04",
				"pwh_gameplay_hanging_help_05",
				"pwh_gameplay_hanging_help_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_soldier_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_02_reply_01"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_02_reply_01"
			}
		},
		pdr_gameplay_soldier_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_03_reply_01"
			}
		},
		pwe_gameplay_response_192 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_192"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_192"
			}
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03"
			}
		},
		pwe_gameplay_wizard_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_killing_spawn_melee_01"
			}
		},
		pwe_gameplay_soldier_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_misses_bomb_01"
			}
		},
		pes_gameplay_wizard_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_misses_bomb_01"
			}
		},
		pdr_gameplay_response_19 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_19"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_19"
			}
		},
		pes_gameplay_response_15 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_15"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_15"
			}
		},
		pwh_gameplay_soldier_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_hit_by_goo_thrice_02"
			}
		},
		pdr_gameplay_response_044 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_044"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_044"
			}
		},
		pwe_gameplay_hunter_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01"
			}
		},
		pes_gameplay_response_14 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_14"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_14"
			}
		},
		pdr_gameplay_response_22 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_22"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_22"
			}
		},
		pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pdr_gameplay_soldier_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_hit_by_goo_thrice_02"
			}
		},
		pdr_gameplay_response_18 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_18"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_18"
			}
		},
		pes_gameplay_response_167 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_167"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_167"
			}
		},
		pes_gameplay_elf_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_melee_01"
			}
		},
		pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pdr_gameplay_soldier_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_misses_bomb_01"
			}
		},
		pes_gameplay_response_16 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_16"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_16"
			}
		},
		pwh_gameplay_solider_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_solider_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_solider_misses_bomb_01"
			}
		},
		pdr_gameplay_ranger_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_04_reply_01"
			}
		},
		pdr_gameplay_wizard_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_killing_spawn_melee_01"
			}
		},
		pwh_gameplay_response_192 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_192"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_192"
			}
		},
		pwe_gameplay_hunter_downed_3_times_11 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_11"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_11"
			}
		},
		pwe_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pwh_gameplay_response_124 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_124"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_124"
			}
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pwe_gameplay_wizard_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_misses_bomb_01"
			}
		},
		pbw_gameplay_response_187 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_187"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_187"
			}
		},
		pwb_gameplay_response_18 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwb_gameplay_response_18"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwb_gameplay_response_18"
			}
		},
		pdr_gameplay_wizard_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_misses_bomb_01"
			}
		},
		pbw_gameplay_hunter_kills_3_specials_in_a_row_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_kills_3_specials_in_a_row_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_kills_3_specials_in_a_row_02"
			}
		},
		pwh_gameplay_wizard_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_misses_bomb_01"
			}
		},
		pbw_gameplay_response_21 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_21"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_21"
			}
		},
		pwe_gameplay_response_24 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_24"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_24"
			}
		},
		pbw_gameplay_hunter_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_killing_troll_melee_01"
			}
		},
		pes_gameplay_hunter_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_troll_melee_01"
			}
		},
		pdr_gameplay_hunter_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_troll_melee_01"
			}
		},
		pbw_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pes_gameplay_elf_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_misses_bomb_01"
			}
		},
		pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pwe_gameplay_response_23 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_23"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_23"
			}
		},
		pes_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pwh_gameplay_elf_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_03_reply_01"
			}
		},
		pwe_gameplay_response_22 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_22"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_22"
			}
		},
		pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pes_gameplay_wizard_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_spawn_melee_01"
			}
		},
		pdr_gameplay_elf_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_misses_bomb_01"
			}
		},
		pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01"
			}
		},
		pwh_gameplay_elf_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_misses_bomb_01"
			}
		},
		pes_gameplay_hunter_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01"
			}
		},
		pes_gameplay_response_177 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_177"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_177"
			}
		},
		pwh_gameplay_response_22 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_22"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_22"
			}
		},
		pdr_gameplay_hunter_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_3_special_kills_in_a_row_01"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_01"
			}
		},
		pwh_gameplay_response_21 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_21"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_21"
			}
		},
		pwh_gameplay_response_157 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_gameplay_response_157",
				[2.0] = "pwh_gameplay_ranger_killing_troll_ranged_01"
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
				[1.0] = "pwh_gameplay_response_157",
				[2.0] = "pwh_gameplay_ranger_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pes_gameplay_response_141 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_141"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_141"
			}
		},
		pdr_gameplay_response_159 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_159"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_159"
			}
		},
		pbw_gameplay_response_177 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_177"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_177"
			}
		},
		pwh_gameplay_response_20 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_20"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_20"
			}
		},
		pwe_gameplay_soldier_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_08_reply_01"
			}
		},
		pwh_gameplay_response_158 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_158"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_158"
			}
		},
		pwh_gameplay_hunter_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_01"
			}
		},
		pwe_gameplay_hunter_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_3_special_kills_in_a_row_01"
			}
		},
		pwh_gameplay_response_38 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_38"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_38"
			}
		},
		pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pes_gameplay_elf_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_caught_by_slaver_3_times_02"
			}
		},
		pdr_gameplay_elf_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_12_reply_01"
			}
		},
		pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01"
			}
		},
		pbw_gameplay_elf_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_caught_by_slaver_3_times_02"
			}
		},
		pwe_gameplay_soldier_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_01_reply_01"
			}
		},
		pdr_gameplay_elf_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_caught_by_slaver_3_times_02"
			}
		},
		pdr_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05"
			}
		},
		pes_gameplay_response_144 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_gameplay_response_144",
				[2.0] = "pbw_gameplay_elf_killing_troll_ranged_01"
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
				[1.0] = "pes_gameplay_response_144",
				[2.0] = "pbw_gameplay_elf_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_wizard_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01"
			}
		},
		pbw_gameplay_wizard_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_07_reply_01"
			}
		},
		pbw_gameplay_hunter_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_3_special_kills_in_a_row_01"
			}
		},
		pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04"
			}
		},
		pwh_gameplay_soldier_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_killing_rat_ogre_ranged_01"
			}
		},
		pes_gameplay_hunter_downed_3_times_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_05"
			}
		},
		pwe_gameplay_response_156 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_gameplay_response_156",
				[2.0] = "pes_gameplay_wizard_killing_troll_ranged_01"
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
				[1.0] = "pwe_gameplay_response_156",
				[2.0] = "pes_gameplay_wizard_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03"
			}
		},
		pwh_gameplay_ranger_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01"
			}
		},
		pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04"
			}
		},
		pwh_gameplay_elf_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_ranged_01"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03"
			}
		},
		pbw_gameplay_soldier_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01"
			}
		},
		pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03"
			}
		},
		pwe_gameplay_ranger_downed_3_times_12 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_12"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_12"
			}
		},
		pwe_gameplay_soldier_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01"
			}
		},
		pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pwe_gameplay_ranger_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01"
			}
		},
		pdr_gameplay_response_126 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_126"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_126"
			}
		},
		pwe_gameplay_response_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_09"
			}
		},
		pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pbw_gameplay_ranger_downed_3_times_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_09"
			}
		},
		pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03"
			}
		},
		pes_gameplay_soldier_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_08_reply_01"
			}
		},
		pbw_gameplay_soldier_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_misses_bomb_01"
			}
		},
		pwh_gameplay_response_19 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_19"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_19"
			}
		},
		pwe_gameplay_response_195 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_195"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_195"
			}
		},
		pdr_gameplay_wizard_kills_3_specials_in_a_row_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_kills_3_specials_in_a_row_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_kills_3_specials_in_a_row_02"
			}
		},
		pes_gameplay_wizard_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_ranged_01"
			}
		},
		pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pwe_gameplay_soldier_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_02_reply_01"
			}
		},
		pes_gameplay_hanging_help = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_hanging_help_01",
				"pes_gameplay_hanging_help_02",
				"pes_gameplay_hanging_help_03",
				"pes_gameplay_hanging_help_04",
				"pes_gameplay_hanging_help_05",
				"pes_gameplay_hanging_help_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pes_gameplay_hanging_help_01",
				"pes_gameplay_hanging_help_02",
				"pes_gameplay_hanging_help_03",
				"pes_gameplay_hanging_help_04",
				"pes_gameplay_hanging_help_05",
				"pes_gameplay_hanging_help_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_response_157 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_157"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_157"
			}
		},
		pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pes_gameplay_response_137 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_137"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_137"
			}
		},
		pwe_gameplay_response_185 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_185"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_185"
			}
		},
		pwh_gameplay_response_145 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_gameplay_response_145",
				[2.0] = "pwe_gameplay_soldier_killing_troll_melee_01"
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
				[1.0] = "pwh_gameplay_response_145",
				[2.0] = "pwe_gameplay_soldier_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pwe_gameplay_hunter_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_02"
			}
		},
		pes_gameplay_hunter_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01"
			}
		},
		pwe_gameplay_dwarf_picks_up_a_bomb = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_dwarf_picks_up_a_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_dwarf_picks_up_a_bomb_01"
			}
		},
		pbw_gameplay_elf_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pwe_gameplay_wizard_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_killing_rat_ogre_ranged_01"
			}
		},
		pdr_gameplay_elf_downed_3_times_12 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_12"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_12"
			}
		},
		pbw_gameplay_ranger_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01"
			}
		},
		pes_gameplay_wizard_downed_3_times_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_07"
			}
		},
		pbw_gameplay_hunter_downed_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_02"
			}
		},
		pes_gameplay_response_140 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_140"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_140"
			}
		},
		pdr_gameplay_response_154 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_154"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_154"
			}
		},
		pdr_gameplay_soldier_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01"
			}
		},
		pwh_gameplay_elf_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_spawn_melee_01"
			}
		},
		pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pbw_gameplay_response_19 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_19"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_19"
			}
		},
		pes_gameplay_response_180 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_180"
			}
		},
		pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pwe_gameplay_hunter_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_spawn_ranged_01"
			}
		},
		pes_gameplay_response_183 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_183"
			}
		},
		pwe_gameplay_response_159 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_159"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_159"
			}
		},
		pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pdr_gameplay_response_132 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_132"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_132"
			}
		},
		pwe_gameplay_hunter_downed_3_times_12 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_12"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_12"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03"
			}
		},
		pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01"
			}
		},
		pdr_gameplay_wizard_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01"
			}
		},
		pbw_gameplay_hunter_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_killing_rat_ogre_ranged_01"
			}
		},
		pdr_gameplay_elf_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pes_gameplay_wizard_downed_3_times_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_05"
			}
		},
		pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pwh_gameplay_response_079 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_079"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_079"
			}
		},
		pwh_gameplay_elf_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_hit_by_goo_thrice_02"
			}
		},
		pwe_gameplay_ranger_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_03"
			}
		},
		pdr_gameplay_soldier_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_spawn_ranged_01"
			}
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pes_gameplay_response_170 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_170"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_170"
			}
		},
		pwe_gameplay_hanging_help = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_hanging_help_01",
				"pwe_gameplay_hanging_help_02",
				"pwe_gameplay_hanging_help_03",
				"pwe_gameplay_hanging_help_04",
				"pwe_gameplay_hanging_help_05",
				"pwe_gameplay_hanging_help_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwe_gameplay_hanging_help_01",
				"pwe_gameplay_hanging_help_02",
				"pwe_gameplay_hanging_help_03",
				"pwe_gameplay_hanging_help_04",
				"pwe_gameplay_hanging_help_05",
				"pwe_gameplay_hanging_help_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_hunter_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_02"
			}
		},
		pes_gameplay_hunter_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_02"
			}
		},
		pwh_gameplay_soldier_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_killing_spawn_ranged_01"
			}
		},
		pbw_gameplay_elf_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_hit_by_goo_thrice_02"
			}
		},
		pbw_gameplay_response_079 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_079"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_079"
			}
		},
		pdr_gameplay_elf_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_spawn_melee_01"
			}
		},
		pes_gameplay_elf_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_spawn_melee_01"
			}
		},
		pwe_gameplay_response_081 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_081"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_081"
			}
		},
		pbw_gameplay_response_175 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_175"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_175"
			}
		},
		pes_gameplay_response_181 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_181"
			}
		},
		pwh_gameplay_soldier_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_killing_rat_ogre_melee_01"
			}
		},
		pbw_gameplay_response_186 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_186"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_186"
			}
		},
		pdr_gameplay_response_182 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_182"
			}
		},
		pwe_gameplay_soldier_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_spawn_ranged_01"
			}
		},
		pdr_gameplay_response_079 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_079"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_079"
			}
		},
		pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_01"
			}
		},
		pdr_gameplay_hunter_downed_3_times_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_08"
			}
		},
		pwh_gameplay_response_187 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_187"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_187"
			}
		},
		pbw_gameplay_ranger_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_spawn_ranged_01"
			}
		},
		pwh_gameplay_response_123 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_123"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_123"
			}
		},
		pes_gameplay_elf_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_troll_melee_01"
			}
		},
		pbw_gameplay_response_150 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_150",
				[2.0] = "pes_gameplay_hunter_killing_troll_ranged_01"
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
				[1.0] = "pbw_gameplay_response_150",
				[2.0] = "pes_gameplay_hunter_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pes_gameplay_ranger_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_spawn_ranged_01"
			}
		},
		pbw_gameplay_ranger_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_melee_01"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pwh_gameplay_elf_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_caught_by_slaver_3_times_02"
			}
		},
		pwh_gameplay_hunter_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_08_reply_01"
			}
		},
		pwh_gameplay_response_190 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_190"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_190"
			}
		},
		pwe_gameplay_response_126 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_126"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_126"
			}
		},
		pwh_gameplay_hunter_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_06_reply_01"
			}
		},
		pwe_gameplay_elf_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_06_reply_01"
			}
		},
		pwe_gameplay_elf_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_04_reply_01"
			}
		},
		pwe_gameplay_soldier_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_hit_by_goo_thrice_02"
			}
		},
		pdr_gameplay_hunter_downed_3_times_11_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_11_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_11_reply_02"
			}
		},
		pwe_gameplay_hunter_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_melee_01"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01"
			}
		},
		pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01"
			}
		},
		pwe_gameplay_ranger_killing_rat_ogre_melee_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_melee_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_melee_reply_02"
			}
		},
		pbw_gameplay_response_043 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_043"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_043"
			}
		},
		pdr_gameplay_hunter_downed_3_times_10 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_10"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_10"
			}
		},
		pdr_gameplay_response_185 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_185"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_185"
			}
		},
		pwe_gameplay_ranger_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_melee_01"
			}
		},
		pwe_gameplay_killing_a_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_killing_a_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_killing_a_rat_ogre_01"
			}
		},
		pes_gameplay_response_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_13"
			}
		},
		pwe_gameplay_response_181 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_181"
			}
		},
		pes_gameplay_hunter_downed_3_times_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_07"
			}
		},
		pwh_gameplay_ranger_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_melee_01"
			}
		},
		pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
			}
		},
		pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01"
			}
		},
		pdr_gameplay_soldier_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01"
			}
		},
		pwe_gameplay_hunter_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pes_gameplay_ranger_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_rat_ogre_melee_01"
			}
		},
		pwh_gameplay_soldier_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_caught_by_slaver_3_times_02"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pdr_gameplay_elf_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_rat_ogre_melee_01"
			}
		},
		pdr_gameplay_ranger_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_02_reply_01"
			}
		},
		pbw_gameplay_soldier_downed_3_times_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_07"
			}
		},
		pbw_gameplay_hunter_downed_3_times_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_03"
			}
		},
		pdr_gameplay_hanging_help = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pdr_gameplay_hanging_help_01",
				"pdr_gameplay_hanging_help_02",
				"pdr_gameplay_hanging_help_03",
				"pdr_gameplay_hanging_help_04",
				"pdr_gameplay_hanging_help_06",
				"pdr_gameplay_hanging_help_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_gameplay_hanging_help_01",
				"pdr_gameplay_hanging_help_02",
				"pdr_gameplay_hanging_help_03",
				"pdr_gameplay_hanging_help_04",
				"pdr_gameplay_hanging_help_06",
				"pdr_gameplay_hanging_help_05"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pdr_gameplay_response_190 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_190"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_190"
			}
		},
		pbw_gameplay_response_148 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_148"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_148"
			}
		},
		pdr_gameplay_response_045 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_045"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_045"
			}
		},
		pbw_gameplay_response_38 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_38"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_38"
			}
		},
		pwe_gameplay_soldier_downed_3_times_12 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_12"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_12"
			}
		},
		pes_gameplay_response_182 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_182"
			}
		},
		pdr_gameplay_elf_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_troll_melee_01"
			}
		},
		pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_01"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_01_reply_02"
			}
		},
		pbw_gameplay_hunter_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_killing_rat_ogre_melee_01"
			}
		},
		pdr_gameplay_elf_downed_3_times_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_13"
			}
		},
		pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_01"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_01"
			}
		},
		pbw_gameplay_response_07_b = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_07_b"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_07_b"
			}
		},
		pdr_gameplay_wizard_fires_a_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_fires_a_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_fires_a_rat_ogre_01"
			}
		},
		pwe_gameplay_hunter_downed_3_times_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_13"
			}
		},
		pbw_gameplay_soldier_downed_3_times_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_08"
			}
		},
		pwh_gameplay_response_149 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_149"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_149"
			}
		},
		pes_gameplay_wizard_downed_3_times_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_06"
			}
		},
		pwe_gameplay_response_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_07"
			}
		},
		pdr_gameplay_wizard_downed_3_times_10 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_10"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_10"
			}
		},
		pwe_gameplay_elf_potions_above_half_health_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_06_reply_01"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03"
			}
		},
		pbw_gameplay_response_37 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_37"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_37"
			}
		},
		pwh_gameplay_response_044 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_044"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_044"
			}
		},
		pes_gameplay_elf_shoots_a_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_shoots_a_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_shoots_a_rat_ogre_01"
			}
		},
		pwh_gameplay_killing_a_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_killing_a_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_killing_a_rat_ogre_01"
			}
		},
		pdr_gameplay_ranger_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_08_reply_01"
			}
		},
		pes_gameplay_ranger_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_downed_3_times_09_reply_01"
			}
		},
		pbw_gameplay_ranger_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_07_reply_01"
			}
		},
		pbw_gameplay_response_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_08"
			}
		},
		pwe_gameplay_response_054 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_054"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_054"
			}
		},
		pwh_gameplay_response_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_08"
			}
		},
		pwh_gameplay_wizard_downed_3_times_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_04"
			}
		},
		pwe_gameplay_response_147 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_147"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_147"
			}
		},
		pwh_gameplay_hunter_potions_above_half_health_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_02_reply_02"
			}
		},
		pbw_gameplay_ranger_downed_3_times_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_07"
			}
		},
		pwh_gameplay_ranger_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_spawn_melee_01"
			}
		},
		pbw_gameplay_wizard_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_08_reply_01"
			}
		},
		pbw_gameplay_wizard_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_03_reply_01"
			}
		},
		pbw_gameplay_response_154 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_154",
				[2.0] = "pwh_gameplay_wizard_killing_troll_ranged_01"
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
				[1.0] = "pbw_gameplay_response_154",
				[2.0] = "pwh_gameplay_wizard_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hunter_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_misses_bomb_01"
			}
		},
		pwe_gameplay_response_158 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_gameplay_response_158",
				[2.0] = "pwe_gameplay_wizard_killing_troll_ranged_01"
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
				[1.0] = "pwe_gameplay_response_158",
				[2.0] = "pwe_gameplay_wizard_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_response_152 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_152"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_152"
			}
		},
		pdr_gameplay_wizard_potions_above_half_health_03_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_03_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_03_reply_02"
			}
		},
		pbw_gameplay_response_149 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_149"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_149"
			}
		},
		pwe_gameplay_soldier_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_caught_by_slaver_3_times_02"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_02"
			}
		},
		pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pbw_gameplay_response_153 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_153",
				[2.0] = "pwh_gameplay_soldier_killing_troll_ranged_01"
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
				[1.0] = "pbw_gameplay_response_153",
				[2.0] = "pwh_gameplay_soldier_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hunter_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_02_reply_01"
			}
		},
		pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pwh_gameplay_response_153 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_gameplay_response_153",
				[2.0] = "pwe_gameplay_soldier_killing_troll_ranged_01"
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
				[1.0] = "pwh_gameplay_response_153",
				[2.0] = "pwe_gameplay_soldier_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pes_gameplay_response_145 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_145"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_145"
			}
		},
		pbw_gameplay_response_116 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_116"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_116"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_01"
			}
		},
		pwe_gameplay_hunter_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_03"
			}
		},
		pdr_gameplay_hunter_potions_above_half_health_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_04"
			}
		},
		pbw_gameplay_hunter_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_killing_spawn_ranged_01"
			}
		},
		pwe_gameplay_ranger_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_02"
			}
		},
		pbw_gameplay_response_151 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_151",
				[2.0] = "pwe_gameplay_ranger_killing_troll_ranged_01"
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
				[1.0] = "pbw_gameplay_response_151",
				[2.0] = "pwe_gameplay_ranger_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_soldier_downed_3_times_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_09"
			}
		},
		pes_gameplay_hunter_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_spawn_ranged_01"
			}
		},
		pwe_gameplay_wizard_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_killing_spawn_ranged_01"
			}
		},
		pes_gameplay_response_149 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_gameplay_response_149",
				[2.0] = "pes_gameplay_ranger_killing_troll_ranged_01"
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
				[1.0] = "pes_gameplay_response_149",
				[2.0] = "pes_gameplay_ranger_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pes_gameplay_hunter_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_03"
			}
		},
		pes_gameplay_hunter_hit_by_goo_thrice = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_hit_by_goo_thrice"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_hit_by_goo_thrice"
			}
		},
		pwe_gameplay_soldier_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_13_reply_01"
			}
		},
		pwe_gameplay_ranger_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_troll_melee_01"
			}
		},
		pdr_gameplay_response_157 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_gameplay_response_157",
				[2.0] = "pwe_gameplay_hunter_killing_troll_ranged_01"
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
				[1.0] = "pdr_gameplay_response_157",
				[2.0] = "pwe_gameplay_hunter_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_soldier_downed_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_02"
			}
		},
		pdr_gameplay_response_186 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_186"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_186"
			}
		},
		pes_gameplay_response_114 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_114"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_114"
			}
		},
		pbw_gameplay_hunter_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_hit_by_goo_thrice_02"
			}
		},
		pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01"
			}
		},
		pes_gameplay_response_168 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_168"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_168"
			}
		},
		pes_gameplay_ranger_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_02"
			}
		},
		pwe_gameplay_response_160 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_gameplay_response_160",
				[2.0] = "pdr_gameplay_hunter_killing_troll_ranged_01"
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
				[1.0] = "pwe_gameplay_response_160",
				[2.0] = "pdr_gameplay_hunter_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_response_184 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_184"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_184"
			}
		},
		pdr_gameplay_hunter_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_hit_by_goo_thrice_02"
			}
		},
		pwh_gameplay_ranger_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_03_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_11_reply_01"
			}
		},
		pbw_gameplay_response_144 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_144"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_144"
			}
		},
		pbw_gameplay_elf_potions_above_half_health_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_06"
			}
		},
		pbw_gameplay_soldier_downed_3_times_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_06"
			}
		},
		pwe_gameplay_response_162 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_162"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_162"
			}
		},
		pwh_gameplay_hunter_downed_3_times_11_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_11_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_11_reply_02"
			}
		},
		pbw_gameplay_soldier_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_troll_melee_01"
			}
		},
		pes_gameplay_response_146 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_gameplay_response_146",
				[2.0] = "pes_gameplay_elf_killing_troll_ranged_01"
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
				[1.0] = "pes_gameplay_response_146",
				[2.0] = "pes_gameplay_elf_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_response_056 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_056"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_056"
			}
		},
		pdr_gameplay_response_160 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_160"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_160"
			}
		},
		pwe_gameplay_elf_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_11_reply_01"
			}
		},
		pwe_gameplay_response_148 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_gameplay_response_148",
				[2.0] = "pes_gameplay_wizard_killing_troll_melee_01"
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
				[1.0] = "pwe_gameplay_response_148",
				[2.0] = "pes_gameplay_wizard_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_response_199 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_199",
				[2.0] = "pdr_gameplay_wizard_killing_troll_melee_01"
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
				[1.0] = "pbw_gameplay_response_199",
				[2.0] = "pdr_gameplay_wizard_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_wizard_downed_3_times_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_08"
			}
		},
		pes_gameplay_elf_downed_3_times_10 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_downed_3_times_10"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_10"
			}
		},
		pes_gameplay_response_143 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_143"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_143"
			}
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04"
			}
		},
		pwe_gameplay_ranger_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_spawn_ranged_01"
			}
		},
		pwh_gameplay_ranger_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_spawn_ranged_01"
			}
		},
		pbw_gameplay_soldier_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_07_reply_01"
			}
		},
		pbw_gameplay_ranger_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_02"
			}
		},
		pbw_gameplay_soldier_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_rat_ogre_melee_01"
			}
		},
		pwh_gameplay_response_150 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_150"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_150"
			}
		},
		pes_gameplay_response_175 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_175"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_175"
			}
		},
		pwe_gameplay_soldier_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01"
			}
		},
		pdr_gameplay_response_155 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_155"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_155"
			}
		},
		pbw_gameplay_hunter_downed_3_times_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_04"
			}
		},
		pwh_gameplay_ranger_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_troll_melee_01"
			}
		},
		pbw_gameplay_response_146 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_146"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_146"
			}
		},
		pdr_gameplay_response_153 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_153"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_153"
			}
		},
		pbw_gameplay_ranger_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_troll_melee_01"
			}
		},
		pwh_gameplay_hunter_hit_by_goo_thrice_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_hit_by_goo_thrice_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_hit_by_goo_thrice_reply_01"
			}
		},
		pdr_gameplay_response_152 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_152"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_152"
			}
		},
		pwe_gameplay_response_151 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_gameplay_response_151",
				[2.0] = "pdr_gameplay_soldier_killing_troll_melee_01"
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
				[1.0] = "pwe_gameplay_response_151",
				[2.0] = "pdr_gameplay_soldier_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hunter_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_troll_melee_01"
			}
		},
		pwe_gameplay_response_150 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_150"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_150"
			}
		},
		pwh_gameplay_response_148 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_148"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_148"
			}
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04"
			}
		},
		pbw_gameplay_response_142 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_142"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_142"
			}
		},
		pes_gameplay_hunter_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_caught_by_slaver_3_times_02"
			}
		},
		pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pwh_gameplay_response_152 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_152"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_152"
			}
		},
		pwe_gameplay_wizard_potions_above_half_health_03_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_03_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_03_reply_02"
			}
		},
		pes_gameplay_response_117 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_117"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_117"
			}
		},
		pwh_gameplay_hunter_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_03_reply_01"
			}
		},
		pbw_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pwh_gameplay_elf_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_troll_melee_01"
			}
		},
		pwh_gameplay_wizard_potions_above_half_health_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_02_reply_02"
			}
		},
		pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pdr_gameplay_response_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_07"
			}
		},
		pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01"
			}
		},
		pbw_gameplay_response_117 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_117"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_117"
			}
		},
		pwh_gameplay_response_151 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_151"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_151"
			}
		},
		pwe_gameplay_response_152 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_152"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_152"
			}
		},
		pes_gameplay_response_113 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_113"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_113"
			}
		},
		pbw_gameplay_elf_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_troll_melee_01"
			}
		},
		pwe_gameplay_response_127 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_127"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_127"
			}
		},
		pwe_gameplay_response_188 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_188"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_188"
			}
		},
		pdr_gameplay_response_195 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_195"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_195"
			}
		},
		pbw_gameplay_response_188 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_188"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_188"
			}
		},
		pes_gameplay_response_179 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_179"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_179"
			}
		},
		pes_gameplay_ranger_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_spawn_melee_01"
			}
		},
		pdr_gameplay_response_156 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_156"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_156"
			}
		},
		pdr_gameplay_response_189 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_189"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_189"
			}
		},
		pbw_gameplay_response_183 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_183"
			}
		},
		pes_gameplay_wizard_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_spawn_ranged_01"
			}
		},
		pwh_gameplay_response_185 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_185"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_185"
			}
		},
		pbw_gameplay_response_182 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_182"
			}
		},
		pwe_gameplay_response_194 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_194"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_194"
			}
		},
		pdr_gameplay_response_080 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_080"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_080"
			}
		},
		pdr_gameplay_response_191 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_191"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_191"
			}
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pes_gameplay_response_176 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_176"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_176"
			}
		},
		pes_gameplay_response_071 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_071"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_071"
			}
		},
		pbw_gameplay_soldier_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_spawn_ranged_01"
			}
		},
		pdr_gameplay_hunter_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_caught_by_slaver_3_times_02"
			}
		},
		pes_gameplay_hunter_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_03_reply_01"
			}
		},
		pwe_gameplay_response_190 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_190"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_190"
			}
		},
		pes_gameplay_hunter_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_01"
			}
		},
		pwh_gameplay_wizard_downed_3_times_14 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_14"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_14"
			}
		},
		pbw_gameplay_hunter_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_caught_by_slaver_3_times_02"
			}
		},
		pdr_gameplay_hunter_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01"
			}
		},
		pdr_gameplay_ranger_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_03_reply_01"
			}
		},
		pes_gameplay_response_142 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_142"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_142"
			}
		},
		pwh_gameplay_elf_downed_3_times_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_05"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pwh_gameplay_response_188 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_188"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_188"
			}
		},
		pwe_gameplay_response_189 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_189"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_189"
			}
		},
		pwh_gameplay_response_186 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_186"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_186"
			}
		},
		pdr_gameplay_hunter_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_spawn_ranged_01"
			}
		},
		pwe_gameplay_ranger_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_13_reply_01"
			}
		},
		pbw_gameplay_ranger_downed_3_times_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_08"
			}
		},
		pwe_gameplay_hunter_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_01"
			}
		},
		pbw_gameplay_soldier_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_caught_by_slaver_3_times_02"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pwe_gameplay_response_123 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_123"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_123"
			}
		},
		pes_gameplay_response_118 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_118"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_118"
			}
		},
		pdr_gameplay_wizard_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_09_reply_01"
			}
		},
		pes_gameplay_wizard_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_07_reply_01"
			}
		},
		pwh_gameplay_elf_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_spawn_ranged_01"
			}
		},
		pdr_gameplay_response_128 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_128"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_128"
			}
		},
		pbw_gameplay_response_078 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_078"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_078"
			}
		},
		pes_gameplay_i_will_tank = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "special_occasions_honduras",
			category = "player_feedback",
			dialogue_animations_n = 12,
			sound_events = {
				"pes_gameplay_i_will_tank_05",
				"pes_gameplay_i_will_tank_06",
				"pes_gameplay_i_will_tank_07",
				"pes_gameplay_i_will_tank_08",
				"pes_gameplay_i_will_tank_09",
				"pes_gameplay_i_will_tank_10",
				"pes_gameplay_i_will_tank_11",
				"pes_gameplay_i_will_tank_12",
				"pes_gameplay_i_will_tank_13",
				"pes_gameplay_i_will_tank_14",
				"pes_gameplay_i_will_tank_15",
				"pes_gameplay_i_will_tank_16"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_i_will_tank_05",
				"pes_gameplay_i_will_tank_06",
				"pes_gameplay_i_will_tank_07",
				"pes_gameplay_i_will_tank_08",
				"pes_gameplay_i_will_tank_09",
				"pes_gameplay_i_will_tank_10",
				"pes_gameplay_i_will_tank_11",
				"pes_gameplay_i_will_tank_12",
				"pes_gameplay_i_will_tank_13",
				"pes_gameplay_i_will_tank_14",
				"pes_gameplay_i_will_tank_15",
				"pes_gameplay_i_will_tank_16"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_wizard_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_05_reply_01"
			}
		},
		pwh_gameplay_ranger_killing_3_specials_in_a_row_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_3_specials_in_a_row_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_3_specials_in_a_row_02"
			}
		},
		pwe_gameplay_elf_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_13_reply_01"
			}
		},
		pbw_gameplay_wizard_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_09_reply_01"
			}
		},
		pdr_gameplay_response_193 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_193"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_193"
			}
		},
		pwh_gameplay_elf_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_10_reply_01"
			}
		},
		pes_gameplay_response_17 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_17"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_17"
			}
		},
		pwh_gameplay_wizard_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_spawn_melee_01"
			}
		},
		pdr_gameplay_response_187 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_187"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_187"
			}
		},
		pwh_gameplay_response_122 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_122"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_122"
			}
		},
		pbw_gameplay_elf_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_spawn_ranged_01"
			}
		},
		pes_gameplay_elf_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_spawn_ranged_01"
			}
		},
		pdr_gameplay_elf_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_spawn_ranged_01"
			}
		},
		pwe_gameplay_response_130 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_130"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_130"
			}
		},
		pbw_gameplay_response_176 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_176"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_176"
			}
		},
		pwh_gameplay_hunter_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_03_reply_01"
			}
		},
		pwh_gameplay_soldier_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_killing_spawn_melee_01"
			}
		},
		pes_gameplay_killing_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_killing_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_killing_rat_ogre_01"
			}
		},
		pwe_gameplay_soldier_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_spawn_melee_01"
			}
		},
		pwe_gameplay_response_184 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_184"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_184"
			}
		},
		pes_gameplay_response_173 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_173"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_173"
			}
		},
		pes_gameplay_another_is_bunnyjumping_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_another_is_bunnyjumping_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_another_is_bunnyjumping_01"
			}
		},
		pbw_gameplay_killing_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_killing_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_killing_rat_ogre_01"
			}
		},
		pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01"
			}
		},
		pdr_gameplay_response_180 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_180"
			}
		},
		pbw_gameplay_response_185 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_185"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_185"
			}
		},
		pbw_gameplay_response_156 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_156",
				[2.0] = "pbw_gameplay_hunter_killing_troll_ranged_01"
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
				[1.0] = "pbw_gameplay_response_156",
				[2.0] = "pbw_gameplay_hunter_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pes_gameplay_ranger_downed_3_times_10 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_downed_3_times_10"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_downed_3_times_10"
			}
		},
		pwe_gameplay_wizard_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_03"
			}
		},
		pwe_gameplay_hunter_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_spawn_melee_01"
			}
		},
		pdr_gameplay_response_17 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_17"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_17"
			}
		},
		pwh_gameplay_response_39 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_39"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_39"
			}
		},
		pbw_gameplay_ranger_killing_rat_ogre_melee_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_melee_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_melee_reply_01"
			}
		},
		pwh_gameplay_wizard_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_hit_by_goo_thrice_02"
			}
		},
		pwh_gameplay_response_23 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_23"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_23"
			}
		},
		pwh_gameplay_hunter_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_01_reply_01"
			}
		},
		pwh_gameplay_response_154 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_154"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_154"
			}
		},
		pbw_gameplay_response_124 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_124"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_124"
			}
		},
		pdr_gameplay_hunter_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_spawn_melee_01"
			}
		},
		pdr_gameplay_wizard_downed_3_times_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_09"
			}
		},
		pwh_gameplay_response_184 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_184"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_184"
			}
		},
		pwh_gameplay_soldier_downed_3_times_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_05"
			}
		},
		pes_gameplay_hunter_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_02_reply_01"
			}
		},
		pwe_gameplay_wizard_downed_3_times_11 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_11"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_11"
			}
		},
		pbw_gameplay_elf_downed_3_times_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_07"
			}
		},
		pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01"
			}
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01"
			}
		},
		pwh_gameplay_response_181 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_181"
			}
		},
		pes_gameplay_soldier_downed_3_times_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_reply_01"
			}
		},
		pdr_gameplay_wizard_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_hit_by_goo_thrice_02"
			}
		},
		pwh_gameplay_response_177 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_177"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_177"
			}
		},
		pwe_gameplay_response_180 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_180"
			}
		},
		pes_gameplay_wizard_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_hit_by_goo_thrice_02"
			}
		},
		pbw_gameplay_elf_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_spawn_melee_01"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_02_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_03"
			}
		},
		pdr_gameplay_response_054 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_054"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_054"
			}
		},
		pwh_gameplay_response_071 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_071"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_071"
			}
		},
		pdr_gameplay_wizard_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_02"
			}
		},
		pwh_gameplay_another_is_bunnyjumping_01_alt1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_another_is_bunnyjumping_01_alt1"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_another_is_bunnyjumping_01_alt1"
			}
		},
		pbw_gameplay_response_179 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_179"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_179"
			}
		},
		pwe_gameplay_wizard_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_01"
			}
		},
		pbw_gameplay_response_181 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_181"
			}
		},
		pwh_gameplay_soldier_downed_3_times_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_reply_01"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02"
			}
		},
		pdr_gameplay_wizard_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_3_special_kills_in_a_row_01"
			}
		},
		pdr_gameplay_response_38 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_38"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_38"
			}
		},
		pbw_gameplay_ranger_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_08_reply_01"
			}
		},
		pdr_gameplay_response_130 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_130"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_130"
			}
		},
		pwe_gameplay_hunter_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_misses_bomb_01"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03"
			}
		},
		pbw_gameplay_ranger_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_11_reply_01"
			}
		},
		pdr_gameplay_i_will_tank = {
			sound_events_n = 14,
			randomize_indexes_n = 0,
			face_animations_n = 14,
			database = "special_occasions_honduras",
			category = "player_feedback",
			dialogue_animations_n = 14,
			sound_events = {
				"pdr_gameplay_i_will_tank_05",
				"pdr_gameplay_i_will_tank_06",
				"pdr_gameplay_i_will_tank_07",
				"pdr_gameplay_i_will_tank_08",
				"pdr_gameplay_i_will_tank_09",
				"pdr_gameplay_i_will_tank_10",
				"pdr_gameplay_i_will_tank_11",
				"pdr_gameplay_i_will_tank_12",
				"pdr_gameplay_i_will_tank_13",
				"pdr_gameplay_i_will_tank_14",
				"pdr_gameplay_i_will_tank_19",
				"pdr_gameplay_i_will_tank_20",
				"pdr_gameplay_i_will_tank_21",
				"pdr_gameplay_i_will_tank_22"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_i_will_tank_05",
				"pdr_gameplay_i_will_tank_06",
				"pdr_gameplay_i_will_tank_07",
				"pdr_gameplay_i_will_tank_08",
				"pdr_gameplay_i_will_tank_09",
				"pdr_gameplay_i_will_tank_10",
				"pdr_gameplay_i_will_tank_11",
				"pdr_gameplay_i_will_tank_12",
				"pdr_gameplay_i_will_tank_13",
				"pdr_gameplay_i_will_tank_14",
				"pdr_gameplay_i_will_tank_19",
				"pdr_gameplay_i_will_tank_20",
				"pdr_gameplay_i_will_tank_21",
				"pdr_gameplay_i_will_tank_22"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_ranger_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_10_reply_01"
			}
		},
		pwe_gameplay_ranger_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_03_reply_01"
			}
		},
		pwh_gameplay_wizard_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_3_special_kills_in_a_row_01"
			}
		},
		pwe_gameplay_wizard_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_3_special_kills_in_a_row_01"
			}
		},
		pes_gameplay_wizard_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_03"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01"
			}
		},
		pwe_gameplay_wizard_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_hit_by_goo_thrice_02"
			}
		},
		pdr_gameplay_wizard_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_01"
			}
		},
		pwh_gameplay_hunter_potions_above_half_health_03_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_03_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_03_reply_02"
			}
		},
		pdr_gameplay_hunter_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_misses_bomb_01"
			}
		},
		pes_gameplay_hunter_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_misses_bomb_01"
			}
		},
		pes_gameplay_response_136 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_136"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_136"
			}
		},
		pes_pes_gameplay_wizard_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_pes_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_pes_gameplay_wizard_potions_above_half_health_03_reply_01"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_03_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_02"
			}
		},
		pes_gameplay_ranger_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_hit_by_goo_thrice_02"
			}
		},
		pbw_gameplay_ranger_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_hit_by_goo_thrice_02"
			}
		},
		pbw_gameplay_ranger_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_02_reply_01"
			}
		},
		pwh_gameplay_ranger_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_hit_by_goo_thrice_02"
			}
		},
		pes_gameplay_ranger_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_03_reply_01"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_01"
			}
		},
		pwh_gameplay_response_127 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_127"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_127"
			}
		},
		pwh_gameplay_killing_a_second_rat_ogre_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_killing_a_second_rat_ogre_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_killing_a_second_rat_ogre_02"
			}
		},
		pes_gameplay_elf_downed_3_times_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_downed_3_times_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_08"
			}
		},
		pwe_gameplay_elf_potions_above_half_health_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_01_reply_02"
			}
		},
		pwe_gameplay_hunter_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_02_reply_01"
			}
		},
		pwh_gameplay_hunter_potions_above_half_health_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_reply_01"
			}
		},
		pwe_gameplay_response_39 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_39"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_39"
			}
		},
		pwh_gameplay_response_36 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_36"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_36"
			}
		},
		pdr_gameplay_soldier_downed_3_times_10 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_10"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_10"
			}
		},
		pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pwe_gameplay_soldier_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_09_reply_01"
			}
		},
		pwe_gameplay_ranger_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pdr_gameplay_hunter_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_03"
			}
		},
		pwe_gameplay_soldier_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_11_reply_01"
			}
		},
		pwe_gameplay_kiling_a_second_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_kiling_a_second_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_kiling_a_second_rat_ogre_01"
			}
		},
		pwh_gameplay_response_180 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_180"
			}
		},
		pes_gameplay_killing_a_second_rat_ogre_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_killing_a_second_rat_ogre_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_killing_a_second_rat_ogre_02"
			}
		},
		pes_gameplay_hunter_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_05_reply_01"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_03_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_02"
			}
		},
		pdr_gameplay_killing_a_second_rat_ogre_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_killing_a_second_rat_ogre_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_killing_a_second_rat_ogre_02"
			}
		},
		pwe_gameplay_soldier_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_10_reply_01"
			}
		},
		pdr_gameplay_response_181 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_181"
			}
		},
		pwe_gameplay_ranger_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_04_reply_01"
			}
		},
		pdr_gameplay_hunter_potions_above_half_health_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_reply_01"
			}
		},
		pwh_gameplay_response_37_alt1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_37_alt1"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_37_alt1"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_03_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_02"
			}
		},
		pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pes_gameplay_elf_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_02_reply_01"
			}
		},
		pdr_gameplay_hunter_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_10_reply_01"
			}
		},
		pwe_gameplay_killing_a_second_rat_ogre_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_killing_a_second_rat_ogre_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_killing_a_second_rat_ogre_02"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_02"
			}
		},
		pes_gameplay_response_115 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_115"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_115"
			}
		},
		pwe_gameplay_response_41 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_41"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_41"
			}
		},
		pes_gameplay_response_31 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_31"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_31"
			}
		},
		pwe_gameplay_ranger_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_10_reply_01"
			}
		},
		pbw_gameplay_hunter_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_killing_spawn_melee_01"
			}
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02"
			}
		},
		pwe_gameplay_response_129 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_129"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_129"
			}
		},
		pdr_gameplay_response_046 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_046"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_046"
			}
		},
		pwe_gameplay_hunter_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_11_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_13_reply_01"
			}
		},
		pwe_gameplay_ranger_downed_3_times_11 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_11"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_11"
			}
		},
		pbr_gameplay_elf_downed_3_times_11 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbr_gameplay_elf_downed_3_times_11"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbr_gameplay_elf_downed_3_times_11"
			}
		},
		pbw_gameplay_hanging_help = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_hanging_help_01",
				"pbw_gameplay_hanging_help_02",
				"pbw_gameplay_hanging_help_03",
				"pbw_gameplay_hanging_help_04",
				"pbw_gameplay_hanging_help_05",
				"pbw_gameplay_hanging_help_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_gameplay_hanging_help_01",
				"pbw_gameplay_hanging_help_02",
				"pbw_gameplay_hanging_help_03",
				"pbw_gameplay_hanging_help_04",
				"pbw_gameplay_hanging_help_05",
				"pbw_gameplay_hanging_help_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_hunter_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01"
			}
		},
		pes_gameplay_elf_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_01"
			}
		},
		pwh_gameplay_response_125 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_125"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_125"
			}
		},
		pes_gameplay_response_151 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_151"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_151"
			}
		},
		pes_gameplay_hunter_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_spawn_melee_01"
			}
		},
		pbw_gameplay_elf_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_01"
			}
		},
		pes_gameplay_response_112 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_112"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_112"
			}
		},
		pbw_gameplay_response_118 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_118"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_118"
			}
		},
		pdr_gameplay_wizard_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_07_reply_01"
			}
		},
		pwe_gameplay_ranger_downed_3_times_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_13"
			}
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_02"
			}
		},
		pwe_gameplay_response_193 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_193"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_193"
			}
		},
		pwe_gameplay_hunter_hit_by_goo_thrice_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_03"
			}
		},
		pes_gameplay_elf_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_03_reply_01"
			}
		},
		pwh_gameplay_hunter_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_04_reply_01"
			}
		},
		pwh_gameplay_wizard_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_01_reply_01"
			}
		},
		pwe_gameplay_elf_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_09_reply_01"
			}
		},
		pwe_gameplay_response_055 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_055"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_055"
			}
		},
		pbw_gameplay_elf_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_02_reply_01"
			}
		},
		pwh_gameplay_hunter_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_05_reply_01"
			}
		},
		pwh_gameplay_ranger_downed_3_times_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_03"
			}
		},
		pbw_gameplay_elf_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_06_reply_01"
			}
		},
		pes_gameplay_ranger_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_caught_by_slaver_3_times_02"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_03_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_03"
			}
		},
		pes_gameplay_ranger_potions_above_half_health_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_reply_01"
			}
		},
		pbw_gameplay_ranger_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_caught_by_slaver_3_times_02"
			}
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02"
			}
		},
		pwe_gameplay_hunter_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_caught_by_slaver_3_times_02"
			}
		},
		pbw_gameplay_elf_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_misses_bomb_01"
			}
		},
		pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pwh_gameplay_response_146 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_146"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_146"
			}
		},
		pwh_gameplay_response_128 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_128"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_128"
			}
		},
		pes_gameplay_elf_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_03_reply_01"
			}
		},
		pbw_gameplay_response_121 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_121"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_121"
			}
		},
		pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pwe_gameplay_response_183 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_183"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pdr_gameplay_hunter_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_09_reply_01"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_02_reply_02"
			}
		},
		pes_gameplay_wizard_potions_above_half_health_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_reply_01"
			}
		},
		pes_ameplay_soldier_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_ameplay_soldier_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_ameplay_soldier_potions_above_half_health_01_reply_01"
			}
		},
		pdr_hunter_shoots_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_hunter_shoots_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_hunter_shoots_rat_ogre_01"
			}
		},
		pes_gameplay_hunter_downed_3_times_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_06"
			}
		},
		pbw_gameplay_response_119 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_119"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_119"
			}
		},
		pdr_gameplay_elf_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_hit_by_goo_thrice_02"
			}
		},
		pdr_gameplay_hunter_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_02_reply_01"
			}
		},
		pwh_gameplay_response_182 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_182"
			}
		},
		pes_gameplay_wizard_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_04_reply_01"
			}
		},
		pwh_gameplay_wizard_downed_3_times_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_03"
			}
		},
		pdr_gameplay_response_163 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_163"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_163"
			}
		},
		pwe_gameplay_response_187 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_187"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_187"
			}
		},
		pwh_gameplay_response_147 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_gameplay_response_147",
				[2.0] = "pwe_gameplay_wizard_killing_troll_melee_01"
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
				[1.0] = "pwh_gameplay_response_147",
				[2.0] = "pwe_gameplay_wizard_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pbw_ameplay_soldier_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_ameplay_soldier_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_ameplay_soldier_potions_above_half_health_01_reply_01"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_02_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_02_reply_03"
			}
		},
		pdr_gameplay_response_050 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_050"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_050"
			}
		},
		pbw_gameplay_wizard_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_12_reply_01"
			}
		},
		pwh_gameplay_elf_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_11_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_07_reply_01"
			}
		},
		pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04"
			}
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03"
			}
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pdr_gameplay_killing_a_rat_ogre_crossbow_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_killing_a_rat_ogre_crossbow_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_killing_a_rat_ogre_crossbow_01"
			}
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03"
			}
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01"
			}
		},
		pwe_gameplay_ranger_hit_by_goo_thrice_00 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_hit_by_goo_thrice_00"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_hit_by_goo_thrice_00"
			}
		},
		pbw_gameplay_wizard_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_04_reply_01"
			}
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04"
			}
		},
		pdr_gameplay_wizard_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_05_reply_01"
			}
		},
		pbw_gameplay_ranger_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_03"
			}
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01"
			}
		},
		pes_gameplay_elf_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_hit_by_goo_thrice_02"
			}
		},
		pdr_gameplay_response_125 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_125"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_125"
			}
		},
		pes_gameplay_response_147 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_147"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_147"
			}
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01"
			}
		},
		pwh_gameplay_wizard_downed_3_times_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02_reply_02"
			}
		},
		pwh_gameplay_wizard_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_03_reply_01"
			}
		},
		pwh_gameplay_wizard_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02_reply_01"
			}
		},
		pwh_gameplay_response_189 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_189"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_189"
			}
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01"
			}
		},
		pwh_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pwh_gameplay_response_043 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_043"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_043"
			}
		},
		pbw_gameplay_wizard_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_06_reply_01"
			}
		},
		pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pbw_gameplay_response_157 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_157"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_157"
			}
		},
		pwh_gameplay_wizard_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_10_reply_01"
			}
		},
		pbw_gameplay_wizard_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_10_reply_01"
			}
		},
		pes_gameplay_wizard_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_02"
			}
		},
		pdr_gameplay_wizard_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_06_reply_01"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_02"
			}
		},
		pes_gameplay_elf_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_02"
			}
		},
		pdr_gameplay_elf_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_02"
			}
		},
		pdr_gameplay_ranger_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_11_reply_01"
			}
		},
		pwe_gameplay_response_154 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_154"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_154"
			}
		},
		pbw_gameplay_elf_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_02"
			}
		},
		pbw_gameplay_ranger_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_3_special_kills_in_a_row_01"
			}
		},
		pes_gameplay_wizard_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_01"
			}
		},
		pdr_gameplay_wizard_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_03"
			}
		},
		pbw_gameplay_response_178 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_178"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_178"
			}
		},
		pwh_gameplay_wizard_downed_3_times_14_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_14_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_14_reply_01"
			}
		},
		pbw_gameplay_wizard_downed_3_times_14_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_14_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_14_reply_01"
			}
		},
		pwe_gameplay_elf_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_10_reply_01"
			}
		},
		pwe_gameplay_hunter_potions_above_half_health__reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health__reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health__reply_02"
			}
		},
		pwh_gameplay_soldier_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_02_reply_01"
			}
		},
		pwe_gameplay_hunter_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_03_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_02_reply_01"
			}
		},
		pwe_gameplay_soldier_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_12_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_12_reply_01"
			}
		},
		pwh_gameplay_soldier_downed_3_times_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_03"
			}
		},
		pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pwh_gameplay_elf_downed_3_times_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_04"
			}
		},
		pbw_gameplay_response_120 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_120"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_120"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_01_reply_01"
			}
		},
		pdr_gameplay_soldier_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_01_reply_01"
			}
		},
		pwe_gameplay_soldier_downed_3_times_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_13"
			}
		},
		pes_gameplay_soldier_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_10_reply_01"
			}
		},
		pwe_gameplay_soldier_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_06_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_06_reply_01"
			}
		},
		pbw_gameplay_response_145 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_145",
				[2.0] = "pwh_gameplay_soldier_killing_troll_melee_01"
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
				[1.0] = "pbw_gameplay_response_145",
				[2.0] = "pwh_gameplay_soldier_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03"
			}
		},
		pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
			}
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1"
			}
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02"
			}
		},
		pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_09_reply_01"
			}
		},
		pwh_gameplay_soldier_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_04_reply_01"
			}
		},
		pes_gameplay_wizard_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_03_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_04_reply_01"
			}
		},
		pwe_gameplay_ranger_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_3_special_kills_in_a_row_01"
			}
		},
		pes_gameplay_elf_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_07_reply_01"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_01"
			}
		},
		pwh_gameplay_soldier_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_05_reply_01"
			}
		},
		pbw_gameplay_elf_downed_3_times_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_06"
			}
		},
		pwh_gameplay_soldier_downed_3_times_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_04"
			}
		},
		pwh_gameplay_hunter_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_11_reply_01"
			}
		},
		pbw_gameplay_soldier_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_05_reply_01"
			}
		},
		pwh_gameplay_ranger_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_02_reply_01"
			}
		},
		pwe_gameplay_ranger_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_caught_by_slaver_3_times_02"
			}
		},
		pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
			}
		},
		pwe_gameplay_ranger_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_12_reply_01"
			}
		},
		pdr_gameplay_ranger_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_12_reply_01"
			}
		},
		pwh_gameplay_ranger_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_01"
			}
		},
		pwh_gameplay_ranger_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_caught_by_slaver_3_times_02"
			}
		},
		pdr_gameplay_response_129 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_129"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_129"
			}
		},
		pwe_gameplay_wizard_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_01_reply_01"
			}
		},
		pbw_gameplay_elf_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_01_reply_01"
			}
		},
		pes_gameplay_ranger_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_3_special_kills_in_a_row_01"
			}
		},
		pwh_gameplay_wizard_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_03_reply_01"
			}
		},
		pdr_gameplay_response_192 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_192"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_192"
			}
		},
		pdr_gameplay_ranger_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_13_reply_01"
			}
		},
		pdr_gameplay_ranger_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_07_reply_01"
			}
		},
		pdr_gameplay_ranger_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_09_reply_01"
			}
		},
		pbw_gameplay_response_20 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_20"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_20"
			}
		},
		pes_gameplay_response_169 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_169"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_169"
			}
		},
		pwh_gameplay_hunter_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_02_reply_01"
			}
		},
		pwe_gameplay_elf_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_01_reply_01"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_01_reply_01"
			}
		},
		pdr_gameplay_hunter_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_03_reply_01"
			}
		},
		pbw_gameplay_response_147 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_147"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_147"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_03_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_03"
			}
		},
		pwe_gameplay_hunter_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_13_reply_01"
			}
		},
		pwh_gameplay_hunter_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_13_reply_01"
			}
		},
		pwe_gameplay_elf_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_02_reply_01"
			}
		},
		pwh_gameplay_hunter_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_10_reply_01"
			}
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01"
			}
		},
		pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pes_gameplay_hunter_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_06_reply_01"
			}
		},
		pes_gameplay_response_30 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_30"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_30"
			}
		},
		pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03"
			}
		},
		pwh_gameplay_hunter_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_07_reply_01"
			}
		},
		pbw_gameplay_soldier_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_3_special_kills_in_a_row_01"
			}
		},
		pdr_gameplay_hunter_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_04_reply_01"
			}
		},
		pdr_gameplay_elf_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_13_reply_01"
			}
		},
		pwe_gameplay_soldier_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_03_reply_01"
			}
		},
		pwe_gameplay_ranger_potions_above_half_health_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_04_reply_01"
			}
		},
		pwh_gameplay_ranger_downed_3_time_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_downed_3_time_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_downed_3_time_02"
			}
		},
		pwh_gameplay_hunter_potions_above_half_health_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_01_reply_02"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_01"
			}
		},
		pbw_gameplay_elf_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_02_reply_01"
			}
		},
		pbw_killing_a_second_rat_ogre_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_killing_a_second_rat_ogre_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_killing_a_second_rat_ogre_02"
			}
		},
		pwe_gameplay_elf_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_02_reply_01"
			}
		},
		pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01"
			}
		},
		pwe_gameplay_elf_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_12_reply_01"
			}
		},
		pdr_gameplay_response_158 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_158"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_158"
			}
		},
		pes_gameplay_elf_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_08_reply_01"
			}
		},
		pdr_gameplay_response_40 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_40"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_40"
			}
		},
		pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pdr_gameplay_elf_potions_above_half_health_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_04"
			}
		},
		pbw_gameplay_elf_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_melee_01_reply_01"
			}
		},
		pes_gameplay_wizard_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_02_reply_01"
			}
		},
		pbw_gameplay_elf_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_07_reply_01"
			}
		},
		pbw_gameplay_elf_potions_above_half_health_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_06_reply_01"
			}
		},
		pes_gameplay_elf_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_09_reply_01"
			}
		},
		pwh_gameplay_elf_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_04_reply_01"
			}
		},
		pes_gameplay_hunter_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_01_reply_01"
			}
		},
		pwh_gameplay_elf_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_08_reply_01"
			}
		},
		pwe_gameplay_response_186 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_186"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_186"
			}
		},
		pdr_gameplay_response_183 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_183"
			}
		},
		pwe_gameplay_elf_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_05_reply_01"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_03"
			}
		},
		pwe_gameplay_elf_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_03_reply_01"
			}
		},
		pdr_gameplay_soldier_3_special_kills_in_a_row_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_3_special_kills_in_a_row_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_3_special_kills_in_a_row_02"
			}
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_03_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_03"
			}
		},
		pwh_gameplay_elf_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_3_special_kills_in_a_row_01"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_02_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_03"
			}
		},
		pbw_gameplay_response_122 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_122"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_122"
			}
		},
		pbw_gameplay_elf_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01"
			}
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01"
			}
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03"
			}
		},
		pes_gameplay_elf_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_3_special_kills_in_a_row_01"
			}
		},
		pbw_gameplay_ranger_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_01_reply_01"
			}
		},
		pbw_gameplay_elf_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_05_reply_01"
			}
		},
		pdr_gameplay_elf_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_3_special_kills_in_a_row_01"
			}
		},
		pwe_gameplay_ranger_potions_above_half_health_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_04"
			}
		}
	})
end

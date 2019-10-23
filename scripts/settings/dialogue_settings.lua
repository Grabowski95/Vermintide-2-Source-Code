DialogueSettings = DialogueSettings or {}
DialogueSettings.auto_load_files = {
	"dialogues/generated/witch_hunter_honduras",
	"dialogues/generated/bright_wizard_honduras",
	"dialogues/generated/dwarf_ranger_honduras",
	"dialogues/generated/wood_elf_honduras",
	"dialogues/generated/empire_soldier_honduras",
	"dialogues/generated/special_occasions_honduras",
	"dialogues/generated/enemies",
	"dialogues/generated/ping_dialogues_honduras"
}
DialogueSettings.level_specific_load_files = {
	whitebox_climb = {
		"dialogues/generated/wood_elf_prologue",
		"dialogues/generated/dwarf_ranger_prologue",
		"dialogues/generated/bright_wizard_prologue",
		"dialogues/generated/conversations_prologue",
		"dialogues/generated/empire_soldier_prologue",
		"dialogues/generated/enemies",
		"dialogues/generated/marker_events",
		"dialogues/generated/blightreaper_bogenhafen_city"
	},
	whitebox_bosses = {
		"dialogues/generated/dwarf_ranger_ground_zero",
		"dialogues/generated/wood_elf_warcamp",
		"dialogues/generated/empire_soldier_warcamp",
		"dialogues/generated/bright_wizard_warcamp",
		"dialogues/generated/dwarf_ranger_warcamp",
		"dialogues/generated/witch_hunter_warcamp",
		"dialogues/generated/wood_elf_skittergate",
		"dialogues/generated/empire_soldier_skittergate",
		"dialogues/generated/bright_wizard_skittergate",
		"dialogues/generated/dwarf_ranger_skittergate",
		"dialogues/generated/witch_hunter_skittergate",
		"dialogues/generated/grey_seer_skittergate"
	},
	elven_ruins = {
		"dialogues/generated/empire_soldier_elven_ruins",
		"dialogues/generated/wood_elf_elven_ruins",
		"dialogues/generated/dwarf_ranger_elven_ruins",
		"dialogues/generated/bright_wizard_elven_ruins",
		"dialogues/generated/witch_hunter_elven_ruins",
		"dialogues/generated/hero_conversations_elven_ruins"
	},
	catacombs = {
		"dialogues/generated/empire_soldier_catacombs",
		"dialogues/generated/wood_elf_catacombs",
		"dialogues/generated/dwarf_ranger_catacombs",
		"dialogues/generated/bright_wizard_catacombs",
		"dialogues/generated/witch_hunter_catacombs",
		"dialogues/generated/hero_conversations_catacombs"
	},
	military = {
		"dialogues/generated/wood_elf_military",
		"dialogues/generated/dwarf_ranger_military",
		"dialogues/generated/bright_wizard_military",
		"dialogues/generated/witch_hunter_military",
		"dialogues/generated/empire_soldier_military"
	},
	prologue = {
		"dialogues/generated/conversations_prologue",
		"dialogues/generated/enemies"
	},
	mines = {
		"dialogues/generated/wood_elf_mines",
		"dialogues/generated/dwarf_ranger_mines",
		"dialogues/generated/bright_wizard_mines",
		"dialogues/generated/witch_hunter_mines",
		"dialogues/generated/empire_soldier_mines"
	},
	ussingen = {
		"dialogues/generated/wood_elf_ussingen",
		"dialogues/generated/empire_soldier_ussingen",
		"dialogues/generated/bright_wizard_ussingen",
		"dialogues/generated/dwarf_ranger_ussingen",
		"dialogues/generated/witch_hunter_ussingen",
		"dialogues/generated/hero_conversations_ussingen"
	},
	fort = {
		"dialogues/generated/bright_wizard_fort",
		"dialogues/generated/dwarf_ranger_fort",
		"dialogues/generated/witch_hunter_fort",
		"dialogues/generated/empire_soldier_fort",
		"dialogues/generated/wood_elf_fort",
		"dialogues/generated/hero_conversations_fort"
	},
	skaven_stronghold = {
		"dialogues/generated/bright_wizard_skaven_stronghold",
		"dialogues/generated/dwarf_ranger_skaven_stronghold",
		"dialogues/generated/witch_hunter_skaven_stronghold",
		"dialogues/generated/empire_soldier_skaven_stronghold",
		"dialogues/generated/wood_elf_skaven_stronghold",
		"dialogues/generated/skaven_warlord_skaven_stronghold_level"
	},
	ussingen_demo = {
		"dialogues/generated/wood_elf_ussingen",
		"dialogues/generated/empire_soldier_ussingen",
		"dialogues/generated/bright_wizard_ussingen",
		"dialogues/generated/dwarf_ranger_ussingen",
		"dialogues/generated/witch_hunter_ussingen"
	},
	nurgle = {
		"dialogues/generated/wood_elf_nurgle",
		"dialogues/generated/empire_soldier_nurgle",
		"dialogues/generated/bright_wizard_nurgle",
		"dialogues/generated/dwarf_ranger_nurgle",
		"dialogues/generated/witch_hunter_nurgle"
	},
	warcamp = {
		"dialogues/generated/wood_elf_warcamp",
		"dialogues/generated/empire_soldier_warcamp",
		"dialogues/generated/bright_wizard_warcamp",
		"dialogues/generated/dwarf_ranger_warcamp",
		"dialogues/generated/witch_hunter_warcamp",
		"dialogues/generated/hero_conversations_war_camp"
	},
	farmlands = {
		"dialogues/generated/wood_elf_farmland",
		"dialogues/generated/empire_soldier_farmland",
		"dialogues/generated/bright_wizard_farmland",
		"dialogues/generated/dwarf_ranger_farmland",
		"dialogues/generated/witch_hunter_farmland",
		"dialogues/generated/hero_conversations_farmlands"
	},
	skittergate = {
		"dialogues/generated/wood_elf_skittergate",
		"dialogues/generated/empire_soldier_skittergate",
		"dialogues/generated/bright_wizard_skittergate",
		"dialogues/generated/dwarf_ranger_skittergate",
		"dialogues/generated/witch_hunter_skittergate",
		"dialogues/generated/grey_seer_skittergate"
	},
	inn_level = {
		"dialogues/generated/hub_conversations"
	},
	bell = {
		"dialogues/generated/wood_elf_bell",
		"dialogues/generated/empire_soldier_bell",
		"dialogues/generated/bright_wizard_bell",
		"dialogues/generated/dwarf_ranger_bell",
		"dialogues/generated/witch_hunter_bell"
	},
	ground_zero = {
		"dialogues/generated/wood_elf_ground_zero",
		"dialogues/generated/empire_soldier_ground_zero",
		"dialogues/generated/bright_wizard_ground_zero",
		"dialogues/generated/dwarf_ranger_ground_zero",
		"dialogues/generated/witch_hunter_ground_zero",
		"dialogues/generated/hero_conversations_ground_zero"
	}
}
DialogueSettings.blocked_auto_load_files = {
	inn_level = true,
	prologue = true,
	tutorial = true
}

for _, dlc in pairs(DLCSettings) do
	local auto_load_files = dlc.auto_load_files

	if auto_load_files then
		table.append(DialogueSettings.auto_load_files, auto_load_files)
	end
end

for _, dlc in pairs(DLCSettings) do
	local dialogue_settings = dlc.dialogue_settings

	if dialogue_settings then
		for level_id, dialogue_settings_table in pairs(dialogue_settings) do
			DialogueSettings.level_specific_load_files[level_id] = dialogue_settings_table
		end
	end

	local blocked_auto_load_files = dlc.blocked_auto_load_files

	if blocked_auto_load_files then
		for name, value in pairs(blocked_auto_load_files) do
			DialogueSettings.blocked_auto_load_files[name] = value
		end
	end
end

DialogueSettings.max_view_distance = 50
DialogueSettings.default_view_distance = 10
DialogueSettings.default_hear_distance = 10
DialogueSettings.death_discover_distance = 40
DialogueSettings.discover_enemy_attack_distance = 25
DialogueSettings.see_vortex_distance = 30
DialogueSettings.hear_chaos_vortex_sorcerer = 50
DialogueSettings.hear_chaos_corruptor_sorcerer = 50
DialogueSettings.view_event_trigger_interval = 1
DialogueSettings.seen_recently_threshold = 15
DialogueSettings.observer_view_distance = 8
DialogueSettings.friends_close_distance = 20
DialogueSettings.friends_distant_distance = 50
DialogueSettings.enemies_close_distance = 10
DialogueSettings.enemies_distant_distance = 40
DialogueSettings.knocked_down_broadcast_range = 40
DialogueSettings.pounced_down_broadcast_range = 40
DialogueSettings.suicide_run_broadcast_range = 40
DialogueSettings.troll_vomit_broadcast_range = 20
DialogueSettings.troll_incapacitaded_broadcast_range = 20
DialogueSettings.grabbed_broadcast_range = 40
DialogueSettings.globadier_poisoned_broadcast_range = 20
DialogueSettings.armor_hit_broadcast_range = 7
DialogueSettings.dialogue_level_start_delay = 120
DialogueSettings.story_start_delay = 60
DialogueSettings.story_tick_time = 10
DialogueSettings.ambush_delay = 2
DialogueSettings.vector_delay = 3
DialogueSettings.breed_types_trigger_on_spawn = {
	chaos_troll = true,
	chaos_spawn = true,
	chaos_corruptor_sorcerer = true,
	chaos_vortex_sorcerer = true,
	skaven_rat_ogre = true,
	skaven_stormfiend = true
}
DialogueSettings.bunny_jumping = {
	tick_time = 5,
	jump_threshold = 6
}
DialogueSettings.raycast_enemy_check_interval = 0.25
DialogueSettings.hear_enemy_check_interval = 10
DialogueSettings.special_proximity_distance = 30
DialogueSettings.special_proximity_distance_heard = 30
HealthTriggerSettings = {
	levels = {
		0.2,
		0.5,
		1
	},
	rapid_health_loss = {
		tick_time = 2,
		tick_loss_threshold = 0.2
	}
}
DialogueSettings.max_hear_distance = math.max(25, DialogueSettings.knocked_down_broadcast_range, DialogueSettings.pounced_down_broadcast_range, DialogueSettings.death_discover_distance)
DialogueSettings.dialogue_category_config = {
	default = {
		mutually_exclusive = true,
		interrupted_by = {},
		playable_during_category = {
			enemy_basic_prio = true,
			enemy_high_prio = true
		}
	},
	special_occasion = {
		mutually_exclusive = true,
		interrupted_by = {},
		playable_during_category = {
			default = true,
			enemy_high_prio = true,
			guidance = true,
			enemy_alerts = true,
			player_alerts = true,
			player_feedback = true,
			seen_items = true,
			casual_talk = true,
			story_talk = true,
			enemy_basic_prio = true,
			enemy_alerts_high = true,
			knocked_down_override = true
		}
	},
	activate_ability = {
		interrupted_by = {},
		playable_during_category = {
			enemy_alerts = true,
			npc_talk = true,
			player_feedback = true,
			enemy_basic_prio = true,
			guidance = true,
			default = true,
			boss_talk = true,
			casual_talk = true,
			activate_ability = true,
			story_talk = true,
			level_talk = true,
			boss_reaction_talk = true,
			story_talk_vce = true,
			enemy_high_prio = true,
			help_talk = true,
			seen_items = true,
			npc_talk_interrupt = true,
			player_alerts = true,
			enemy_alerts_high = true
		}
	},
	enemy_alerts_high = {
		mutually_exclusive = true,
		interrupted_by = {},
		playable_during_category = {
			default = true,
			enemy_high_prio = true,
			enemy_alerts = true,
			enemy_basic_prio = true,
			story_talk_vce = true,
			seen_items = true,
			casual_talk = true
		}
	},
	enemy_alerts = {
		mutually_exclusive = true,
		interrupted_by = {},
		playable_during_category = {
			default = true,
			enemy_high_prio = true,
			enemy_basic_prio = true,
			story_talk_vce = true,
			seen_items = true,
			casual_talk = true
		}
	},
	player_alerts_boss = {
		mutually_exclusive = true,
		interrupted_by = {},
		playable_during_category = {
			default = true,
			enemy_high_prio = true,
			guidance = true,
			player_alerts = true,
			help_talk = true,
			boss_talk = true,
			seen_items = true,
			casual_talk = true,
			boss_talk_interrupt = true,
			player_feedback = true,
			level_talk = true,
			enemy_basic_prio = true,
			activate_ability = true,
			story_talk_vce = true
		}
	},
	player_alerts = {
		mutually_exclusive = true,
		interrupted_by = {},
		playable_during_category = {
			default = true,
			enemy_high_prio = true,
			guidance = true,
			enemy_basic_prio = true,
			story_talk_vce = true,
			seen_items = true,
			casual_talk = true
		}
	},
	player_feedback = {
		mutually_exclusive = true,
		interrupted_by = {},
		playable_during_category = {
			default = true,
			enemy_high_prio = true,
			enemy_basic_prio = true,
			npc_talk_special = true,
			story_talk_vce = true
		}
	},
	player_feedback_reply = {
		mutually_exclusive = true,
		interrupted_by = {},
		playable_during_category = {
			default = true,
			enemy_high_prio = true,
			player_feedback = true,
			enemy_basic_prio = true,
			npc_talk_special = true,
			story_talk_vce = true
		}
	},
	guidance = {
		mutually_exclusive = true,
		interrupted_by = {},
		playable_during_category = {
			default = true,
			enemy_high_prio = true,
			story_talk_vce = true,
			enemy_basic_prio = true
		}
	},
	seen_items = {
		mutually_exclusive = true,
		interrupted_by = {},
		playable_during_category = {
			default = true,
			enemy_high_prio = true,
			story_talk_vce = true,
			enemy_basic_prio = true
		}
	},
	level_talk = {
		mutually_exclusive = true,
		interrupted_by = {
			level_talk_must_play = true
		},
		playable_during_category = {
			default = true,
			enemy_high_prio = true,
			enemy_basic_prio = true,
			npc_talk_special = true,
			story_talk_vce = true
		}
	},
	casual_talk = {
		mutually_exclusive = true,
		interrupted_by = {},
		playable_during_category = {
			default = true,
			enemy_high_prio = true,
			story_talk_vce = true,
			enemy_basic_prio = true
		}
	},
	story_talk = {
		mutually_exclusive = true,
		interrupted_by = {
			level_talk_must_play = true,
			npc_talk = true,
			npc_talk_interrupt = true
		},
		playable_during_category = {
			default = true,
			enemy_high_prio = true,
			story_talk_vce = true,
			enemy_basic_prio = true
		}
	},
	story_talk_vce = {
		mutually_exclusive = false,
		interrupted_by = {},
		playable_during_category = {
			enemy_alerts = true,
			npc_talk = true,
			player_feedback = true,
			enemy_basic_prio = true,
			guidance = true,
			default = true,
			boss_talk = true,
			casual_talk = true,
			activate_ability = true,
			story_talk = true,
			level_talk = true,
			boss_reaction_talk = true,
			knocked_down_override = true,
			enemy_high_prio = true,
			help_talk = true,
			cut_scene = true,
			seen_items = true,
			npc_talk_interrupt = true,
			player_alerts = true,
			enemy_alerts_high = true
		}
	},
	story_talk_keep = {
		mutually_exclusive = true,
		interrupted_by = {},
		playable_during_category = {}
	},
	cut_scene = {
		interrupted_by = {
			cut_scene_interrupt = true
		},
		playable_during_category = {
			enemy_alerts = true,
			npc_talk = true,
			player_feedback = true,
			enemy_basic_prio = true,
			guidance = true,
			level_talk_tutorial = true,
			boss_talk = true,
			casual_talk = true,
			activate_ability = true,
			story_talk = true,
			level_talk = true,
			boss_reaction_talk = true,
			default = true,
			knocked_down_override = true,
			story_talk_vce = true,
			enemy_high_prio = true,
			help_talk = true,
			cut_scene = true,
			seen_items = true,
			npc_talk_interrupt = true,
			player_alerts = true,
			enemy_alerts_high = true,
			player_alerts_boss = true
		}
	},
	cut_scene_interrupt = {
		interrupted_by = {
			cut_scene_interrupt_two = true
		},
		playable_during_category = {
			enemy_alerts = true,
			npc_talk = true,
			player_feedback = true,
			enemy_basic_prio = true,
			guidance = true,
			level_talk_tutorial = true,
			boss_talk = true,
			casual_talk = true,
			activate_ability = true,
			story_talk = true,
			level_talk = true,
			boss_reaction_talk = true,
			default = true,
			knocked_down_override = true,
			story_talk_vce = true,
			enemy_high_prio = true,
			help_talk = true,
			cut_scene = true,
			seen_items = true,
			npc_talk_interrupt = true,
			player_alerts = true,
			enemy_alerts_high = true,
			player_alerts_boss = true
		}
	},
	cut_scene_interrupt_two = {
		interrupted_by = {
			cut_scene_interrupt_three = true
		},
		playable_during_category = {
			enemy_alerts = true,
			npc_talk = true,
			player_feedback = true,
			enemy_basic_prio = true,
			guidance = true,
			level_talk_tutorial = true,
			boss_talk = true,
			casual_talk = true,
			activate_ability = true,
			story_talk = true,
			level_talk = true,
			boss_reaction_talk = true,
			default = true,
			knocked_down_override = true,
			cut_scene_interrupt = true,
			story_talk_vce = true,
			enemy_high_prio = true,
			help_talk = true,
			cut_scene = true,
			seen_items = true,
			npc_talk_interrupt = true,
			player_alerts = true,
			enemy_alerts_high = true,
			player_alerts_boss = true
		}
	},
	cut_scene_interrupt_three = {
		interrupted_by = {},
		playable_during_category = {
			enemy_alerts = true,
			npc_talk = true,
			player_feedback = true,
			enemy_basic_prio = true,
			guidance = true,
			level_talk_tutorial = true,
			boss_talk = true,
			casual_talk = true,
			activate_ability = true,
			story_talk = true,
			level_talk = true,
			boss_reaction_talk = true,
			default = true,
			knocked_down_override = true,
			cut_scene_interrupt = true,
			enemy_high_prio = true,
			help_talk = true,
			cut_scene = true,
			seen_items = true,
			npc_talk_interrupt = true,
			cut_scene_interrupt_two = true,
			player_alerts = true,
			enemy_alerts_high = true,
			player_alerts_boss = true
		}
	},
	npc_talk_special = {
		mutually_exclusive = true,
		interrupted_by = {
			level_talk_tutorial_interrupt = true,
			level_talk_tutorial = true,
			npc_talk_interrupt_special = true
		},
		playable_during_category = {
			default = true,
			enemy_high_prio = true,
			guidance = true,
			enemy_alerts = true,
			seen_items = true,
			casual_talk = true,
			story_talk = true,
			level_talk = true,
			enemy_basic_prio = true,
			enemy_alerts_high = true,
			knocked_down_override = true
		}
	},
	npc_talk_interrupt_special = {
		mutually_exclusive = true,
		interrupted_by = {},
		playable_during_category = {
			default = true,
			player_feedback = true,
			level_talk = true,
			help_talk = true,
			npc_talk_special = true,
			level_talk_tutorial = true,
			enemy_alerts = true,
			casual_talk = true,
			story_talk = true,
			npc_talk = true,
			enemy_basic_prio = true,
			knocked_down_override = true,
			enemy_high_prio = true,
			guidance = true,
			seen_items = true,
			player_alerts = true,
			enemy_alerts_high = true
		}
	},
	level_talk_tutorial = {
		interrupted_by = {
			activate_ability = true,
			champion_opening = true,
			cut_scene = true,
			level_talk_tutorial_interrupt = true,
			enemy_alerts_high = true,
			player_alerts_boss = true
		},
		playable_during_category = {
			enemy_alerts = true,
			npc_talk = true,
			help_talk = true,
			player_feedback = true,
			guidance = true,
			level_talk_tutorial = true,
			cut_scene_interrupt = true,
			casual_talk = true,
			default = true,
			story_talk = true,
			level_talk = true,
			enemy_basic_prio = true,
			knocked_down_override = true,
			cut_scene_interrupt_three = true,
			enemy_high_prio = true,
			npc_talk_interrupt_special = true,
			cut_scene = true,
			seen_items = true,
			cut_scene_interrupt_two = true,
			player_alerts = true
		}
	},
	level_talk_tutorial_interrupt = {
		interrupted_by = {
			activate_ability = true,
			champion_opening = true,
			cut_scene = true,
			enemy_alerts_high = true,
			player_alerts_boss = true
		},
		playable_during_category = {
			enemy_alerts = true,
			npc_talk = true,
			help_talk = true,
			player_feedback = true,
			guidance = true,
			level_talk_tutorial = true,
			cut_scene_interrupt = true,
			casual_talk = true,
			default = true,
			story_talk = true,
			level_talk = true,
			enemy_basic_prio = true,
			knocked_down_override = true,
			cut_scene_interrupt_three = true,
			enemy_high_prio = true,
			npc_talk_interrupt_special = true,
			cut_scene = true,
			seen_items = true,
			cut_scene_interrupt_two = true,
			player_alerts = true,
			level_talk_tutorial_interrupt = true
		}
	},
	level_talk_must_play = {
		mutually_exclusive = false,
		interrupted_by = {},
		playable_during_category = {
			enemy_alerts = true,
			npc_talk = true,
			help_talk = true,
			player_feedback = true,
			guidance = true,
			level_talk_tutorial = true,
			cut_scene_interrupt = true,
			casual_talk = true,
			default = true,
			story_talk = true,
			level_talk = true,
			enemy_basic_prio = true,
			story_talk_vce = true,
			knocked_down_override = true,
			activate_ability = true,
			cut_scene_interrupt_three = true,
			enemy_high_prio = true,
			npc_talk_interrupt_special = true,
			cut_scene = true,
			seen_items = true,
			cut_scene_interrupt_two = true,
			player_alerts = true,
			enemy_alerts_high = true
		}
	},
	npc_talk = {
		mutually_exclusive = true,
		interrupted_by = {
			level_talk_tutorial = true,
			npc_talk_interrupt_special = true,
			npc_talk_interrupt = true
		},
		playable_during_category = {
			activate_ability = true,
			story_talk = true,
			default = true,
			help_talk = true,
			enemy_alerts = true,
			level_talk_tutorial = true,
			story_talk_keep = true,
			casual_talk = true,
			story_talk_vce = true,
			player_feedback = true,
			level_talk = true,
			enemy_basic_prio = true,
			knocked_down_override = true,
			enemy_high_prio = true,
			guidance = true,
			seen_items = true,
			player_alerts = true,
			enemy_alerts_high = true
		}
	},
	npc_talk_interrupt = {
		mutually_exclusive = true,
		interrupted_by = {
			npc_talk_interrupt_special = true,
			level_talk_tutorial = true
		},
		playable_during_category = {
			activate_ability = true,
			level_talk = true,
			story_talk = true,
			default = true,
			help_talk = true,
			enemy_alerts = true,
			story_talk_vce = true,
			casual_talk = true,
			player_feedback = true,
			npc_talk = true,
			enemy_basic_prio = true,
			knocked_down_override = true,
			enemy_high_prio = true,
			guidance = true,
			seen_items = true,
			player_alerts = true,
			enemy_alerts_high = true
		}
	},
	champion_opening = {
		interrupted_by = {},
		playable_during_category = {
			enemy_alerts = true,
			npc_talk = true,
			player_feedback = true,
			enemy_basic_prio = true,
			guidance = true,
			default = true,
			boss_talk = true,
			casual_talk = true,
			activate_ability = true,
			story_talk = true,
			level_talk = true,
			boss_reaction_talk = true,
			story_talk_vce = true,
			knocked_down_override = true,
			enemy_high_prio = true,
			help_talk = true,
			seen_items = true,
			npc_talk_interrupt = true,
			player_alerts = true,
			enemy_alerts_high = true,
			player_alerts_boss = true
		}
	},
	boss_talk = {
		mutually_exclusive = true,
		interrupted_by = {
			champion_opening = true,
			boss_talk_interrupt = true,
			boss_reaction_talk = true
		},
		playable_during_category = {
			activate_ability = true,
			enemy_basic_prio = true,
			story_talk = true,
			default = true,
			help_talk = true,
			enemy_alerts = true,
			boss_talk = true,
			casual_talk = true,
			story_talk_vce = true,
			player_feedback = true,
			level_talk = true,
			boss_reaction_talk = true,
			knocked_down_override = true,
			enemy_high_prio = true,
			guidance = true,
			seen_items = true,
			player_alerts = true,
			enemy_alerts_high = true,
			player_alerts_boss = true
		}
	},
	boss_talk_interrupt = {
		mutually_exclusive = true,
		interrupted_by = {
			champion_opening = true,
			boss_reaction_talk = true
		},
		playable_during_category = {
			activate_ability = true,
			enemy_basic_prio = true,
			story_talk = true,
			default = true,
			help_talk = true,
			enemy_alerts = true,
			boss_talk = true,
			casual_talk = true,
			story_talk_vce = true,
			player_feedback = true,
			level_talk = true,
			boss_reaction_talk = true,
			knocked_down_override = true,
			enemy_high_prio = true,
			guidance = true,
			seen_items = true,
			player_alerts = true,
			enemy_alerts_high = true
		}
	},
	boss_reaction_talk = {
		mutually_exclusive = true,
		interrupted_by = {
			boss_talk = true,
			champion_opening = true
		},
		playable_during_category = {
			enemy_alerts = true,
			enemy_high_prio = true,
			help_talk = true,
			default = true,
			story_talk = true,
			player_alerts = true,
			seen_items = true,
			casual_talk = true,
			guidance = true,
			player_feedback = true,
			level_talk = true,
			enemy_basic_prio = true,
			enemy_alerts_high = true,
			knocked_down_override = true,
			activate_ability = true,
			story_talk_vce = true
		}
	},
	enemy_basic_prio = {
		interrupted_by = {
			enemy_high_prio = true
		},
		playable_during_category = {
			enemy_alerts = true,
			guidance = true,
			help_talk = true,
			player_feedback = true,
			default = true,
			player_alerts = true,
			seen_items = true,
			casual_talk = true,
			boss_talk = true,
			story_talk = true,
			level_talk = true,
			boss_reaction_talk = true,
			enemy_alerts_high = true,
			knocked_down_override = true,
			story_talk_vce = true
		}
	},
	enemy_high_prio = {
		interrupted_by = {},
		playable_during_category = {
			default = true,
			boss_reaction_talk = true,
			story_talk = true,
			knocked_down_override = true,
			guidance = true,
			enemy_alerts = true,
			boss_talk = true,
			casual_talk = true,
			special_occasion = true,
			player_feedback = true,
			level_talk = true,
			enemy_basic_prio = true,
			activate_ability = true,
			story_talk_vce = true,
			help_talk = true,
			seen_items = true,
			player_alerts = true,
			enemy_alerts_high = true
		}
	}
}
SpecialSubtitleEvents = {
	end_boss_outro = {
		outro_subtitle_04 = 24,
		outro_subtitle_09 = 53,
		outro_subtitle_03 = 17,
		outro_subtitle_06 = 37,
		outro_subtitle_05 = 30,
		outro_subtitle_08 = 45,
		outro_subtitle_07 = 40,
		outro_subtitle_02 = 11,
		outro_subtitle_01 = 0
	},
	blightreaper_1 = {
		nbr_vo_evil_sword_pickup_01 = 0
	},
	blightreaper_2 = {
		nbr_vo_evil_sword_pickup_02 = 0
	},
	blightreaper_3 = {
		nbr_vo_evil_sword_pickup_03 = 0
	},
	blightreaper_4 = {
		nbr_vo_evil_sword_pickup_04 = 0
	}
}

return

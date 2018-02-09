local pushed_data = {
	ahead_dist = 2,
	push_width = 1.25,
	push_forward_offset = 1.5,
	push_stagger_distance = 1,
	player_pushed_speed = 8,
	push_stagger_impact = {
		2,
		2,
		0,
		0
	},
	push_stagger_duration = {
		1.5,
		1,
		0,
		0
	}
}
local WARLORD_ALLOWED_STAGGERS = {
	true,
	true,
	true,
	true,
	true,
	true,
	true
}
local breed_data = {
	is_bot_aid_threat = true,
	walk_speed = 2.545454545454545,
	stagger_threshold_medium = 2,
	unbreakable_shield = true,
	behavior = "storm_vermin_warlord",
	smart_targeting_height_multiplier = 2.5,
	disable_crowd_dispersion = true,
	target_selection = "pick_rat_ogre_target_with_weights",
	animation_sync_rpc = "rpc_sync_anim_state_6",
	no_effects_on_shield_block = true,
	aoe_radius = 0.6,
	death_reaction = "storm_vermin_champion",
	bot_hitbox_radius_approximation = 1,
	shield_slashing_block_sound = "weapon_stormvermin_champion_sword_block",
	shield_stab_block_sound = "weapon_stormvermin_champion_sword_block",
	headshot_coop_stamina_fatigue_type = "headshot_special",
	shield_blunt_block_sound = "weapon_stormvermin_champion_sword_block",
	threat_value = 32,
	bot_opportunity_target_melee_range = 7,
	wield_inventory_on_spawn = true,
	default_inventory_template = "warlord_dual_setups",
	stagger_resistance = 1,
	dialogue_source_name = "skaven_storm_vermin_champion",
	awards_positive_reinforcement_message = true,
	boss_staggers = false,
	primary_armor_category = 6,
	server_controlled_health_bar = true,
	radius = 1,
	boss = true,
	bone_lod_level = 1,
	stagger_threshold_explosion = 100,
	smart_object_template = "special",
	race = "skaven",
	disable_second_hit_ragdoll = true,
	proximity_system_check = true,
	poison_resistance = 100,
	armor_category = 2,
	angry_run_speed = 6,
	death_sound_event = "Play_stormvermin_die_vce",
	smart_targeting_width = 0.2,
	perception_continuous = "perception_continuous_rat_ogre",
	initial_is_passive = false,
	bots_should_flank = true,
	has_inventory = true,
	run_speed = 6.109090909090908,
	exchange_order = 1,
	stagger_threshold_heavy = 3,
	shield_stagger_mod = 1,
	combat_music_state = "champion_skaven_stormvermin_warlord",
	stagger_threshold_light = 0.75,
	hit_reaction = "ai_default",
	passive_in_patrol = false,
	can_dodge = true,
	smart_targeting_outer_width = 1,
	hit_effect_template = "HitEffectsStormVerminChampion",
	using_combo = true,
	unit_template = "ai_unit_storm_vermin_warlord",
	has_running_attack = true,
	perception = "perception_rat_ogre",
	player_locomotion_constrain_radius = 1,
	bot_opportunity_target_melee_range_while_ranged = 5,
	weapon_reach = 2,
	far_off_despawn_immunity = true,
	override_mover_move_distance = 1.5,
	base_unit = "units/beings/enemies/skaven_stormvermin_champion/chr_skaven_stormvermin_champion",
	aoe_height = 1.7,
	displace_players_data = pushed_data,
	detection_radius = math.huge,
	perception_weights = {
		target_catapulted_mul = 0.5,
		target_stickyness_bonus_b = 10,
		targeted_by_other_special = -10,
		distance_weight = 10,
		target_stickyness_duration_b = 20,
		aggro_decay_per_sec = 10,
		target_outside_navmesh_mul = 0.5,
		target_stickyness_bonus_a = 50,
		old_target_aggro_mul = 1,
		target_disabled_aggro_mul = 0,
		max_distance = 50,
		target_stickyness_duration_a = 5,
		target_disabled_mul = 0.15,
		aggro_multipliers = {
			melee = 1,
			ranged = 3,
			grenade = 2
		}
	},
	size_variation_range = {
		1.4,
		1.4
	},
	max_health = {
		300,
		300,
		450,
		600,
		900
	},
	diff_stagger_resist = {
		2.25,
		2.25,
		3,
		4,
		6
	},
	stagger_reduction = {
		1.5,
		1.5,
		1.75,
		2.25,
		3
	},
	stagger_duration = {
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35
	},
	debug_color = {
		255,
		200,
		0,
		170
	},
	run_on_spawn = AiBreedSnippets.on_storm_vermin_champion_spawn,
	run_on_death = AiBreedSnippets.on_storm_vermin_champion_death,
	run_on_update = AiBreedSnippets.on_storm_vermin_champion_update,
	run_on_husk_spawn = AiBreedSnippets.on_storm_vermin_champion_husk_spawn,
	run_on_despawn = AiBreedSnippets.on_storm_vermin_champion_despawn,
	hot_join_sync = AiBreedSnippets.on_storm_vermin_hot_join_sync,
	stagger_modifier_function = function (stagger, duration, length, hit_zone_name, blackboard, breed)
		if not blackboard.dual_wield_mode and stagger ~= 6 then
			stagger = 0
			local ai_shield_extension = ScriptUnit.extension(blackboard.unit, "ai_shield_system")

			ai_shield_extension.set_is_blocking(ai_shield_extension, false)
		end

		return stagger, duration, length
	end,
	hitzone_multiplier_types = {
		head = "headshot",
		ward = "protected_spot"
	},
	hit_zones = {
		full = {
			prio = 2,
			actors = {}
		},
		ward = {
			prio = 1,
			actors = {
				"c_trophy_rack_ward"
			},
			push_actors = {
				"j_hips"
			}
		},
		head = {
			prio = 2,
			actors = {
				"c_head"
			},
			push_actors = {
				"j_head",
				"j_neck",
				"j_spine1"
			}
		},
		neck = {
			prio = 2,
			actors = {
				"c_neck"
			},
			push_actors = {
				"j_head",
				"j_neck",
				"j_spine1"
			}
		},
		torso = {
			prio = 3,
			actors = {
				"c_spine2",
				"c_spine",
				"c_hips"
			},
			push_actors = {
				"j_neck",
				"j_spine1",
				"j_hips"
			}
		},
		left_arm = {
			prio = 4,
			actors = {
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand"
			},
			push_actors = {
				"j_spine1",
				"j_leftshoulder",
				"j_leftarm"
			}
		},
		right_arm = {
			prio = 4,
			actors = {
				"c_rightarm",
				"c_rightforearm",
				"c_righthand"
			},
			push_actors = {
				"j_spine1",
				"j_rightshoulder",
				"j_rightarm"
			}
		},
		left_leg = {
			prio = 4,
			actors = {
				"c_leftupleg",
				"c_leftleg",
				"c_leftfoot",
				"c_lefttoebase"
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips"
			}
		},
		right_leg = {
			prio = 4,
			actors = {
				"c_rightupleg",
				"c_rightleg",
				"c_rightfoot",
				"c_righttoebase"
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips"
			}
		},
		tail = {
			prio = 4,
			actors = {
				"c_tail1",
				"c_tail2",
				"c_tail3",
				"c_tail4",
				"c_tail5",
				"c_tail6"
			},
			push_actors = {
				"j_hips",
				"j_taill"
			}
		},
		afro = {
			prio = 5,
			actors = {
				"c_afro"
			}
		}
	},
	hitbox_ragdoll_translation = {
		c_leftupleg = "j_leftupleg",
		c_rightarm = "j_rightarm",
		c_righthand = "j_righthand",
		c_rightfoot = "j_rightfoot",
		c_tail2 = "j_tail2",
		c_rightleg = "j_rightleg",
		c_lefthand = "j_lefthand",
		c_tail5 = "j_tail5",
		c_leftleg = "j_leftleg",
		c_spine2 = "j_spine1",
		c_tail6 = "j_tail6",
		c_rightupleg = "j_rightupleg",
		c_tail1 = "j_taill",
		c_tail4 = "j_tail4",
		c_spine = "j_spine",
		c_head = "j_head",
		c_leftforearm = "j_leftforearm",
		c_righttoebase = "j_righttoebase",
		c_leftfoot = "j_leftfoot",
		c_neck = "j_neck",
		c_tail3 = "j_tail3",
		c_rightforearm = "j_rightforearm",
		c_leftarm = "j_leftarm",
		c_hips = "j_hips",
		c_lefttoebase = "j_lefttoebase"
	},
	ragdoll_actor_thickness = {
		j_rightfoot = 0.2,
		j_taill = 0.05,
		j_leftarm = 0.2,
		j_leftforearm = 0.2,
		j_leftleg = 0.2,
		j_tail3 = 0.05,
		j_rightarm = 0.2,
		j_leftupleg = 0.2,
		j_rightshoulder = 0.3,
		j_righthand = 0.2,
		j_righttoebase = 0.2,
		j_tail4 = 0.05,
		j_hips = 0.3,
		j_leftshoulder = 0.3,
		j_rightleg = 0.2,
		j_leftfoot = 0.2,
		j_spine1 = 0.3,
		j_tail5 = 0.05,
		j_rightupleg = 0.2,
		j_tail6 = 0.05,
		j_lefttoebase = 0.2,
		j_head = 0.3,
		j_neck = 0.3,
		j_spine = 0.3,
		j_lefthand = 0.2,
		j_rightforearm = 0.2,
		j_tail2 = 0.05
	}
}
local pushed_data = {
	ahead_dist = 2.5,
	push_width = 1.25,
	push_forward_offset = 0.5,
	push_stagger_distance = 1,
	player_pushed_speed = 6,
	push_stagger_impact = {
		2,
		2,
		0,
		0
	},
	push_stagger_duration = {
		1.5,
		1,
		0,
		0
	}
}
Breeds.skaven_storm_vermin_warlord = table.create_copy(Breeds.skaven_storm_vermin_warlord, breed_data)
local action_data = {
	follow = {
		follow_target_function_name = "_follow_target_rat_ogre",
		move_anim = "move_fwd",
		action_weight = 1,
		considerations = UtilityConsiderations.storm_vermin_champion_follow,
		start_anims = {
			bwd = "move_start_bwd",
			fwd = "move_start_fwd",
			left = "move_start_left",
			right = "move_start_right"
		},
		start_anims_data = {
			move_start_fwd = {},
			move_start_bwd = {
				dir = -1,
				rad = math.pi
			},
			move_start_left = {
				dir = 1,
				rad = math.pi/2
			},
			move_start_right = {
				dir = -1,
				rad = math.pi/2
			}
		}
	},
	special_attack_champion = {
		action_weight = 1,
		considerations = UtilityConsiderations.storm_vermin_champion_special_attack
	},
	special_attack_cleave = {
		damage_type = "cutting",
		offset_forward = 0,
		height = 3,
		fatigue_type = "blocked_sv_cleave",
		rotation_time = 1,
		hit_react_type = "heavy",
		player_push_speed = 10,
		increment_stat_on_attack_dodged = "dodged_storm_vermin_champion",
		offset_up = 0,
		attack_anim = "attack_special",
		range = 4,
		bot_threat_duration = 0.7333333333333333,
		player_push_speed_blocked = 8,
		width = 0.4,
		throw_dialogue_system_event_on_dodged_attack = true,
		blocked_damage = {
			0,
			0,
			0
		},
		blocked_difficulty_damage = {
			easy = {
				0,
				0,
				0
			},
			normal = {
				0,
				0,
				0
			},
			hard = {
				2,
				2,
				2
			},
			survival_hard = {
				2,
				2,
				2
			},
			harder = {
				5,
				5,
				5
			},
			survival_harder = {
				5,
				5,
				5
			},
			hardest = {
				10,
				10,
				10
			},
			survival_hardest = {
				10,
				10,
				10
			}
		},
		damage = {
			30,
			25,
			20
		},
		difficulty_damage = {
			easy = {
				20,
				20,
				15
			},
			normal = {
				30,
				25,
				20
			},
			hard = {
				40,
				35,
				30
			},
			survival_hard = {
				40,
				35,
				30
			},
			harder = {
				50,
				40,
				30
			},
			survival_harder = {
				50,
				40,
				30
			},
			hardest = {
				100,
				50,
				30
			},
			survival_hardest = {
				150,
				75,
				45
			}
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false
		}
	},
	dual_attack_cleave = {
		offset_forward = 0,
		height = 3,
		hit_react_type = "medium",
		rotation_time = 1,
		fatigue_type = "blocked_sv_cleave",
		player_push_speed = 5,
		increment_stat_on_attack_dodged = "dodged_storm_vermin_champion",
		damage_type = "cutting",
		offset_up = 0,
		attack_anim = "attack_pounce",
		range = 3.2,
		bot_threat_duration = 1,
		action_weight = 1,
		player_push_speed_blocked = 2,
		width = 0.4,
		throw_dialogue_system_event_on_dodged_attack = true,
		considerations = UtilityConsiderations.storm_vermin_champion_special_attack,
		blocked_damage = {
			0,
			0,
			0
		},
		blocked_difficulty_damage = {
			easy = {
				0,
				0,
				0
			},
			normal = {
				0,
				0,
				0
			},
			hard = {
				2,
				2,
				2
			},
			survival_hard = {
				2,
				2,
				2
			},
			harder = {
				5,
				5,
				5
			},
			survival_harder = {
				5,
				5,
				5
			},
			hardest = {
				10,
				10,
				10
			},
			survival_hardest = {
				10,
				10,
				10
			}
		},
		damage = {
			30,
			25,
			20
		},
		difficulty_damage = {
			easy = {
				20,
				20,
				15
			},
			normal = {
				30,
				25,
				20
			},
			hard = {
				40,
				35,
				30
			},
			survival_hard = {
				40,
				35,
				30
			},
			harder = {
				50,
				40,
				30
			},
			survival_harder = {
				50,
				40,
				30
			},
			hardest = {
				100,
				50,
				30
			},
			survival_hardest = {
				150,
				75,
				45
			}
		},
		ignore_staggers = {
			true,
			false,
			false,
			false,
			false,
			false
		}
	},
	special_attack_spin = {
		height = 4,
		offset_forward = -6,
		hit_react_type = "heavy",
		radius = 4.5,
		collision_type = "cylinder",
		rotation_time = 0,
		fatigue_type = "blocked_slam",
		bot_threat_duration = 2.3333333333333335,
		shove_speed = 9,
		shove_z_speed = 6,
		damage_type = "cutting",
		player_push_speed = 20,
		offset_up = 0,
		offset_right = 0,
		action_weight = 4,
		player_push_speed_blocked = 15,
		considerations = UtilityConsiderations.storm_vermin_champion_spin,
		attack_sequence = {
			{
				attack_anim = "attack_spin_charge"
			},
			{
				attack_anim = "attack_spin",
				at = 2
			}
		},
		blocked_damage = {
			0,
			0,
			0
		},
		blocked_difficulty_damage = {
			easy = {
				0,
				0,
				0
			},
			normal = {
				0,
				0,
				0
			},
			hard = {
				2,
				2,
				2
			},
			survival_hard = {
				2,
				2,
				2
			},
			harder = {
				5,
				5,
				5
			},
			survival_harder = {
				5,
				5,
				5
			},
			hardest = {
				10,
				10,
				10
			},
			survival_hardest = {
				10,
				10,
				10
			}
		},
		damage = {
			20,
			10,
			5
		},
		difficulty_damage = {
			easy = {
				15,
				10,
				5
			},
			normal = {
				20,
				10,
				5
			},
			hard = {
				25,
				15,
				10
			},
			survival_hard = {
				25,
				15,
				10
			},
			harder = {
				30,
				20,
				10
			},
			survival_harder = {
				30,
				20,
				10
			},
			hardest = {
				50,
				30,
				20
			},
			survival_hardest = {
				75,
				45,
				30
			}
		},
		ignore_staggers = {
			true,
			false,
			false,
			false,
			false,
			false
		}
	},
	defensive_mode_spin = {
		height = 4,
		offset_forward = -6,
		hit_react_type = "heavy",
		radius = 6,
		collision_type = "cylinder",
		rotation_time = 0,
		fatigue_type = "blocked_slam",
		bot_threat_duration = 2.6666666666666665,
		shove_speed = 9,
		shove_z_speed = 6,
		damage_type = "cutting",
		player_push_speed = 20,
		offset_up = 0,
		offset_right = 0,
		action_weight = 4,
		player_push_speed_blocked = 15,
		considerations = UtilityConsiderations.storm_vermin_champion_defensive_spin,
		attack_sequence = {
			{
				attack_anim = "attack_spin_charge"
			},
			{
				attack_anim = "attack_spin",
				ready_function = function (unit, blackboard, t)
					local charge_t = t - blackboard.attack_sequence_start_time

					return (1.5 < charge_t and 0 < blackboard.surrounding_players) or 2.5 < charge_t
				end
			}
		},
		blocked_damage = {
			0,
			0,
			0
		},
		blocked_difficulty_damage = {
			easy = {
				0,
				0,
				0
			},
			normal = {
				0,
				0,
				0
			},
			hard = {
				2,
				2,
				2
			},
			survival_hard = {
				2,
				2,
				2
			},
			harder = {
				5,
				5,
				5
			},
			survival_harder = {
				5,
				5,
				5
			},
			hardest = {
				10,
				10,
				10
			},
			survival_hardest = {
				10,
				10,
				10
			}
		},
		damage = {
			20,
			10,
			5
		},
		difficulty_damage = {
			easy = {
				15,
				10,
				5
			},
			normal = {
				20,
				10,
				5
			},
			hard = {
				25,
				15,
				10
			},
			survival_hard = {
				25,
				15,
				10
			},
			harder = {
				30,
				20,
				10
			},
			survival_harder = {
				30,
				20,
				10
			},
			hardest = {
				50,
				30,
				20
			},
			survival_hardest = {
				75,
				45,
				30
			}
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		}
	},
	special_attack_sweep_left = {
		height = 2,
		hit_react_type = "medium",
		radius = 2.25,
		rotation_time = 0,
		fatigue_type = "blocked_sv_sweep",
		collision_filter = "filter_player_and_husk_trigger",
		offset_right = 0,
		mode = "radial_cylinder",
		direction = "counter_clockwise",
		overlap_end_time = 0.7575757575757576,
		offset_forward = -1.5,
		offset_up = 0,
		attack_anim = "attack_sweep_left",
		collision_type = "cylinder",
		bot_threat_duration = 1,
		damage_type = "cutting",
		overlap_start_time = 0.5151515151515151,
		player_push_speed = 8,
		player_push_speed_blocked = 6,
		throw_dialogue_system_event_on_dodged_attack = true,
		damage = {
			20,
			10,
			5
		},
		difficulty_damage = {
			easy = {
				15,
				10,
				5
			},
			normal = {
				20,
				10,
				5
			},
			hard = {
				25,
				15,
				10
			},
			survival_hard = {
				25,
				15,
				10
			},
			harder = {
				30,
				20,
				10
			},
			survival_harder = {
				30,
				20,
				10
			},
			hardest = {
				50,
				30,
				20
			},
			survival_hardest = {
				75,
				45,
				30
			}
		},
		overlap_start_angle_offset = -math.pi,
		overlap_end_angle_offset = math.pi*0.5,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			true,
			false
		}
	},
	special_attack_sweep_right = {
		height = 2,
		hit_react_type = "medium",
		radius = 2.25,
		rotation_time = 0,
		fatigue_type = "blocked_sv_sweep",
		collision_filter = "filter_player_and_husk_trigger",
		offset_right = 0,
		mode = "radial_cylinder",
		direction = "clockwise",
		overlap_end_time = 0.7333333333333333,
		offset_forward = -1.1,
		offset_up = 0,
		attack_anim = "attack_sweep_right",
		collision_type = "cylinder",
		bot_threat_duration = 0.8333333333333334,
		damage_type = "cutting",
		overlap_start_time = 0.36666666666666664,
		player_push_speed = 8,
		player_push_speed_blocked = 6,
		throw_dialogue_system_event_on_dodged_attack = true,
		damage = {
			20,
			10,
			5
		},
		difficulty_damage = {
			easy = {
				15,
				10,
				5
			},
			normal = {
				20,
				10,
				5
			},
			hard = {
				25,
				15,
				10
			},
			survival_hard = {
				25,
				15,
				10
			},
			harder = {
				30,
				20,
				10
			},
			survival_harder = {
				30,
				20,
				10
			},
			hardest = {
				50,
				30,
				20
			},
			survival_hardest = {
				75,
				45,
				30
			}
		},
		overlap_start_angle_offset = math.pi*-0.5,
		overlap_end_angle_offset = math.pi,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			true,
			false
		}
	},
	dual_lunge_attack = {
		animation_driven = true,
		height = 2,
		overlap_end_time = 1.1,
		fatigue_type = "blocked_attack",
		rotation_time = 1.2,
		hit_react_type = "medium",
		offset_forward = 0.15,
		mode = "continuous_overlap",
		player_push_speed = 12,
		damage_type = "cutting",
		offset_up = 0,
		movement_controlled_rotation = false,
		overlap_start_time = 0.2,
		action_weight = 5,
		player_push_speed_blocked = 12,
		width = 0.3,
		considerations = UtilityConsiderations.storm_vermin_champion_running_attack,
		attack_sequence = {
			{
				attack_anim = "attack_run_2"
			}
		},
		blocked_damage = {
			0,
			0,
			0
		},
		blocked_difficulty_damage = {
			easy = {
				0,
				0,
				0
			},
			normal = {
				0,
				0,
				0
			},
			hard = {
				2,
				2,
				2
			},
			survival_hard = {
				2,
				2,
				2
			},
			harder = {
				5,
				5,
				5
			},
			survival_harder = {
				5,
				5,
				5
			},
			hardest = {
				10,
				10,
				10
			},
			survival_hardest = {
				10,
				10,
				10
			}
		},
		damage = {
			20,
			10,
			5
		},
		difficulty_damage = {
			easy = {
				15,
				10,
				5
			},
			normal = {
				20,
				10,
				5
			},
			hard = {
				25,
				15,
				10
			},
			survival_hard = {
				25,
				15,
				10
			},
			harder = {
				30,
				20,
				10
			},
			survival_harder = {
				30,
				20,
				10
			},
			hardest = {
				50,
				30,
				20
			},
			survival_hardest = {
				75,
				45,
				30
			}
		},
		range = function (t_value)
			if t_value < 0.65 then
				return 0.4
			else
				local scaled_t = math.min((t_value - 0.65)*4, 1)

				return math.lerp(0.4, 2.95, scaled_t)
			end

			return 
		end,
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false
		}
	},
	special_running_attack = {
		animation_driven = true,
		height = 2,
		fatigue_type = "blocked_attack",
		overlap_start_time = 0.2,
		overlap_end_time = 1.1,
		rotation_time = 1.2,
		hit_react_type = "medium",
		offset_forward = 0.15,
		mode = "continuous_overlap",
		player_push_speed = 12,
		damage_type = "cutting",
		offset_up = 0,
		movement_controlled_rotation = false,
		action_weight = 5,
		player_push_speed_blocked = 12,
		width = 0.3,
		considerations = UtilityConsiderations.storm_vermin_champion_running_attack,
		attack_sequence = {
			{
				attack_anim = "charge_attack_step"
			},
			{
				attack_anim = "attack_run_2",
				at = 0.16666666666666666
			}
		},
		damage = {
			20,
			10,
			5
		},
		difficulty_damage = {
			easy = {
				15,
				10,
				5
			},
			normal = {
				20,
				10,
				5
			},
			hard = {
				25,
				15,
				10
			},
			survival_hard = {
				25,
				15,
				10
			},
			harder = {
				30,
				20,
				10
			},
			survival_harder = {
				30,
				20,
				10
			},
			hardest = {
				50,
				30,
				20
			},
			survival_hardest = {
				75,
				45,
				30
			}
		},
		range = function (t_value)
			if t_value < 0.65 then
				return 0.4
			else
				local scaled_t = math.min((t_value - 0.65)*4, 1)

				return math.lerp(0.4, 2.95, scaled_t)
			end

			return 
		end,
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false
		}
	},
	special_lunge_attack = {
		animation_driven = true,
		offset_forward = 0.25,
		wall_collision_stun_time = 1.1666666666666667,
		damage_type = "cutting",
		hit_react_type = "medium",
		rotation_time = 1,
		fatigue_type = "blocked_slam",
		mode = "continuous_overlap",
		player_push_speed = 12,
		overlap_end_time = 2.3666666666666667,
		overlap_check_walls_range = 2,
		offset_up = 0,
		overlap_check_walls_time = 1.75,
		height = 2,
		range = 2,
		overlap_start_time = 1.1,
		wall_collision_anim = "charge_attack_lunge_miss",
		action_weight = 5,
		player_push_speed_blocked = 8,
		width = 1,
		throw_dialogue_system_event_on_missed_attack = true,
		considerations = UtilityConsiderations.storm_vermin_champion_lunge_attack,
		attack_sequence = {
			{
				attack_anim = "charge_attack_step"
			},
			{
				at = 1.0666666666666667,
				animation_drive_scale = 0.4,
				attack_anim = "charge_attack_lunge"
			}
		},
		damage = {
			20,
			10,
			5
		},
		difficulty_damage = {
			easy = {
				15,
				10,
				5
			},
			normal = {
				20,
				10,
				5
			},
			hard = {
				25,
				15,
				10
			},
			survival_hard = {
				25,
				15,
				10
			},
			harder = {
				30,
				20,
				10
			},
			survival_harder = {
				30,
				20,
				10
			},
			hardest = {
				50,
				30,
				20
			},
			survival_hardest = {
				75,
				45,
				30
			}
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false
		}
	},
	smash_door = {
		unblockable = true,
		damage_type = "cutting",
		move_anim = "move_fwd",
		attack_anim = "attack_pounce",
		damage = {
			3,
			3,
			3
		}
	},
	stagger = {
		scale_animation_speeds = true,
		stagger_animation_scale = 3.5,
		custom_enter_function = function (unit, blackboard, t, action)
			assert(ScriptUnit.has_extension(unit, "ai_shield_system"), "skaven_storm_vermin_warlord dont have ai_shield_user_extension")

			local breed = blackboard.breed
			local blocked = blackboard.blocked
			local stagger = blackboard.stagger
			local stagger_type = blackboard.stagger_type
			local ai_shield_extension = ScriptUnit.extension(unit, "ai_shield_system")
			local shield_user = not ai_shield_extension.shield_broken
			local is_blocking = ai_shield_extension.is_blocking
			local is_dual_wield_mode = blackboard.dual_wield_mode
			local is_dodging = ai_shield_extension.is_dodging
			local stagger_anims = action.stagger_anims[stagger_type]
			local idle_event = nil
			local stagger_count = blackboard.stagger_count
			blackboard.stagger_ignore_anim_cb = false

			if shield_user and stagger and is_dual_wield_mode then
				blackboard.stagger_avoid_timer = blackboard.stagger_avoid_timer or t + 3
				local avoid_timer = blackboard.stagger_avoid_timer
				local avoid_broken_timer = blackboard.stagger_avoid_broken_timer
				local avoid_attack = false

				if avoid_broken_timer and t < avoid_broken_timer then
					avoid_attack = false
				elseif avoid_broken_timer and avoid_broken_timer < t then
					blackboard.stagger_avoid_timer = t + 3
					blackboard.stagger_avoid_broken_timer = nil
					avoid_attack = true
				elseif avoid_timer and t < avoid_timer then
					avoid_attack = true
				elseif avoid_timer < t then
					if blackboard.stagger_count and 5 <= blackboard.stagger_count then
						blackboard.stagger_avoid_broken_timer = t + 3
					else
						blackboard.stagger_avoid_timer = t + 3
					end

					avoid_attack = false
				end

				if avoid_attack then
					local should_dodge_next_attack = 0.5 <= math.random()
					blackboard.stagger_time = blackboard.stagger_time + 0.35

					if should_dodge_next_attack then
						ai_shield_extension.set_is_dodging(ai_shield_extension, true)
						ai_shield_extension.set_is_blocking(ai_shield_extension, false)
					else
						ai_shield_extension.set_is_blocking(ai_shield_extension, true)
						ai_shield_extension.set_is_dodging(ai_shield_extension, false)
					end

					is_blocking = ai_shield_extension.is_blocking

					if is_blocking then
						stagger_anims = action.shield_block_anims[stagger_type]
					elseif is_dodging then
						stagger_anims = action.dodge_anims[stagger_type]
					end

					idle_event = "idle_guard_up"
				else
					blackboard.stagger_time = 0
					stagger_anims = action.stagger_anims[stagger_type]
					idle_event = "idle_guard_up"

					ai_shield_extension.set_is_dodging(ai_shield_extension, false)
					ai_shield_extension.set_is_blocking(ai_shield_extension, false)
				end

				blackboard.stagger_ignore_anim_cb = true
			else
				blackboard.stagger_time = 0
				stagger_anims = action.stagger_anims[stagger_type]
				idle_event = "idle_guard_down"

				ai_shield_extension.set_is_dodging(ai_shield_extension, false)
				ai_shield_extension.set_is_blocking(ai_shield_extension, false)
			end

			idle_event = "idle"

			return stagger_anims, idle_event
		end,
		stagger_anims = {
			{
				fwd = {
					"stun_fwd_sword"
				},
				bwd = {
					"stun_bwd_sword"
				},
				left = {
					"stun_left_sword"
				},
				right = {
					"stun_right_sword"
				},
				dwn = {
					"stun_bwd_sword"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd"
				},
				left = {
					"stagger_left"
				},
				right = {
					"stagger_right"
				},
				dwn = {
					"stagger_bwd"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd"
				},
				left = {
					"stagger_left_heavy"
				},
				right = {
					"stagger_right_heavy"
				}
			},
			{
				fwd = {
					"stun_fwd_sword"
				},
				bwd = {
					"stun_bwd_sword"
				},
				left = {
					"stun_left_sword"
				},
				right = {
					"stun_right_sword"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd_stab"
				},
				left = {
					"stagger_left"
				},
				right = {
					"stagger_right"
				}
			},
			{
				fwd = {
					"stagger_fwd_exp"
				},
				bwd = {
					"stagger_bwd_exp"
				},
				left = {
					"stagger_left_exp"
				},
				right = {
					"stagger_right_exp"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd"
				},
				left = {
					"stagger_left"
				},
				right = {
					"stagger_right"
				}
			}
		},
		shield_block_anims = {
			{
				fwd = {
					"stagger_bwd_block_short"
				},
				bwd = {
					"stagger_bwd_block_short"
				},
				left = {
					"stagger_left_block"
				},
				right = {
					"stagger_right_block"
				},
				dwn = {
					"stagger_bwd_block_short"
				}
			},
			{
				fwd = {
					"stagger_bwd_block"
				},
				bwd = {
					"stagger_bwd_block"
				},
				left = {
					"stagger_left_block"
				},
				right = {
					"stagger_right_block"
				},
				dwn = {
					"stagger_bwd_block"
				}
			},
			{
				fwd = {
					"stagger_bwd_block"
				},
				bwd = {
					"stagger_bwd_block"
				},
				left = {
					"stagger_left_block"
				},
				right = {
					"stagger_right_block"
				},
				dwn = {
					"stagger_bwd_block"
				}
			},
			{
				fwd = {
					"stagger_bwd_block"
				},
				bwd = {
					"stagger_bwd_block"
				},
				left = {
					"stagger_left_block"
				},
				right = {
					"stagger_right_block"
				},
				dwn = {
					"stagger_bwd_block"
				}
			},
			{
				fwd = {
					"stagger_bwd_block"
				},
				bwd = {
					"stagger_bwd_block"
				},
				left = {
					"stagger_left_block"
				},
				right = {
					"stagger_right_block"
				},
				dwn = {
					"stagger_bwd_block"
				}
			},
			{
				fwd = {
					"stagger_bwd_block"
				},
				bwd = {
					"stagger_bwd_block"
				},
				left = {
					"stagger_left_block"
				},
				right = {
					"stagger_right_block"
				},
				dwn = {
					"stagger_bwd_block"
				}
			},
			{
				fwd = {
					"stagger_bwd_block"
				},
				bwd = {
					"stagger_bwd_block"
				},
				left = {
					"stagger_left_block"
				},
				right = {
					"stagger_right_block"
				},
				dwn = {
					"stagger_bwd_block"
				}
			}
		},
		dodge_anims = {
			{
				fwd = {
					"stagger_bwd_dodge"
				},
				bwd = {
					"stagger_bwd_dodge"
				},
				left = {
					"stagger_left_dodge"
				},
				right = {
					"stagger_right_dodge"
				},
				dwn = {
					"stagger_bwd_dodge"
				}
			},
			{
				fwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				bwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				left = {
					"stagger_bwd_dodge",
					"stagger_left_dodge"
				},
				right = {
					"stagger_bwd_dodge",
					"stagger_right_dodge"
				},
				dwn = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				}
			},
			{
				fwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				bwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				left = {
					"stagger_bwd_dodge",
					"stagger_left_dodge"
				},
				right = {
					"stagger_bwd_dodge",
					"stagger_right_dodge"
				},
				dwn = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				}
			},
			{
				fwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				bwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				left = {
					"stagger_bwd_dodge",
					"stagger_left_dodge"
				},
				right = {
					"stagger_bwd_dodge",
					"stagger_right_dodge"
				},
				dwn = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				}
			},
			{
				fwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				bwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				left = {
					"stagger_bwd_dodge",
					"stagger_left_dodge"
				},
				right = {
					"stagger_bwd_dodge",
					"stagger_right_dodge"
				},
				dwn = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				}
			},
			{
				fwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				bwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				left = {
					"stagger_bwd_dodge",
					"stagger_left_dodge"
				},
				right = {
					"stagger_bwd_dodge",
					"stagger_right_dodge"
				},
				dwn = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				}
			},
			{
				fwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				bwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				left = {
					"stagger_bwd_dodge",
					"stagger_left_dodge"
				},
				right = {
					"stagger_bwd_dodge",
					"stagger_right_dodge"
				},
				dwn = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				}
			}
		},
		shield_stagger_anims = {
			{
				fwd = {
					"stun_fwd_sword"
				},
				bwd = {
					"stun_bwd_sword"
				},
				left = {
					"stun_left_sword"
				},
				right = {
					"stun_right_sword"
				},
				dwn = {
					"stun_down"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd"
				},
				left = {
					"stagger_left"
				},
				right = {
					"stagger_right"
				},
				dwn = {
					"stagger_bwd"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd"
				},
				left = {
					"stagger_left"
				},
				right = {
					"stagger_right"
				},
				dwn = {
					"stagger_bwd"
				}
			},
			{
				fwd = {
					"stun_ranged_fwd"
				},
				bwd = {
					"stun_ranged_bwd"
				},
				left = {
					"stun_ranged_left"
				},
				right = {
					"stun_ranged_right"
				},
				dwn = {
					"stun_ranged_bwd"
				}
			},
			{
				fwd = {
					"stun_ranged_fwd"
				},
				bwd = {
					"stun_ranged_bwd"
				},
				left = {
					"stun_ranged_left"
				},
				right = {
					"stun_ranged_right"
				},
				dwn = {
					"stun_ranged_bwd"
				}
			},
			{
				fwd = {
					"stagger_fwd_exp"
				},
				bwd = {
					"stagger_bwd_exp"
				},
				left = {
					"stagger_left_exp"
				},
				right = {
					"stagger_right_exp"
				},
				dwn = {
					"stagger_bwd_exp"
				}
			},
			{
				fwd = {
					"stun_fwd_sword"
				},
				bwd = {
					"stun_bwd_sword"
				},
				left = {
					"stun_left_sword"
				},
				right = {
					"stun_right_sword"
				},
				dwn = {
					"stun_bwd_sword"
				}
			}
		}
	},
	spawn_sequence = {
		action_weight = 20,
		considerations = UtilityConsiderations.storm_vermin_champion_spawn
	},
	turn_to_face_target = {
		rage_time = 0.6,
		action_weight = 20,
		considerations = UtilityConsiderations.storm_vermin_champion_turn_to_face_target,
		start_anims_name = {
			bwd = "turn_bwd",
			left = "turn_left",
			right = "turn_right"
		},
		start_anims_data = {
			turn_bwd = {
				dir = -1,
				rad = math.pi
			},
			turn_left = {
				dir = 1,
				rad = math.pi/2
			},
			turn_right = {
				dir = -1,
				rad = math.pi/2
			}
		}
	},
	spawn_allies = {
		optional_go_to_spawn = "warlord_go_to",
		defensive_mode_duration = 10,
		find_spawn_points = true,
		run_to_spawn_speed = 7,
		animation = "call_allies",
		spawn_group = "warlord_spawners",
		move_anim = "move_fwd",
		duration = 3,
		spawn = "stormdorf_boss_event_defensive_hard",
		spawn_list = {
			"skaven_storm_vermin",
			"skaven_storm_vermin"
		},
		difficulty_spawn_list = {
			easy = {
				"skaven_storm_vermin"
			},
			normal = {
				"skaven_storm_vermin",
				"skaven_storm_vermin"
			},
			hard = {
				"skaven_storm_vermin",
				"skaven_storm_vermin"
			},
			survival_hard = {
				"skaven_storm_vermin",
				"skaven_storm_vermin"
			},
			harder = {
				"skaven_storm_vermin",
				"skaven_storm_vermin",
				"skaven_storm_vermin",
				"skaven_storm_vermin"
			},
			survival_harder = {
				"skaven_storm_vermin",
				"skaven_storm_vermin"
			},
			hardest = {
				"skaven_storm_vermin",
				"skaven_storm_vermin",
				"skaven_storm_vermin",
				"skaven_storm_vermin",
				"skaven_storm_vermin",
				"skaven_storm_vermin"
			},
			survival_hardest = {
				"skaven_storm_vermin",
				"skaven_storm_vermin",
				"skaven_storm_vermin",
				"skaven_storm_vermin",
				"skaven_storm_vermin",
				"skaven_storm_vermin"
			}
		},
		difficulty_spawn = {
			harder = "stormdorf_boss_event_defensive_harder",
			normal = "stormdorf_boss_event_defensive_normal",
			hard = "stormdorf_boss_event_defensive_hard",
			survival_hard = "stormdorf_boss_event_defensive_hard",
			survival_harder = "stormdorf_boss_event_defensive_hard",
			hardest = "stormdorf_boss_event_defensive_hardest",
			survival_hardest = "stormdorf_boss_event_defensive_hard",
			easy = "stormdorf_boss_event_defensive_easy"
		},
		start_anims = {
			bwd = "move_start_bwd",
			fwd = "move_start_fwd",
			left = "move_start_left",
			right = "move_start_right"
		},
		start_anims_data = {
			move_start_fwd = {},
			move_start_bwd = {
				dir = -1,
				rad = math.pi
			},
			move_start_left = {
				dir = 1,
				rad = math.pi/2
			},
			move_start_right = {
				dir = -1,
				rad = math.pi/2
			}
		}
	},
	defensive_idle = {
		force_idle_animation = true,
		idle_animation = "defensive_idle"
	},
	intro_idle = {
		action_weight = 0.5,
		force_idle_animation = false,
		idle_animation = {
			"defensive_idle"
		}
	},
	jump_to_position = {
		jump_animation = "intro_jump_down",
		horizontal_length = 14,
		action_weight = 1,
		land_animation = "intro_jump_down_land"
	},
	dual_combo_attack2 = {
		stagger_distance = 7,
		hit_react_type = "medium",
		unblockable = false,
		player_push_speed_blocked = 15,
		player_push_speed = 6,
		fatigue_type = "complete",
		action_weight = 1,
		is_combo_attack = true,
		damage_type = "cutting",
		considerations = UtilityConsiderations.storm_vermin_warlord_dual_combo_attack,
		init_blackboard = {
			time_since_last_combo = math.huge
		},
		attacks = {
			{
				width = 0.4,
				offset_forward = 0,
				height = 2.5,
				range = 2.5,
				rotation_time = 1.2,
				anim_driven = true,
				next_combo_index = 2,
				hit_multiple_targets = true,
				player_push_speed_blocked = 15,
				push_close_units_during_attack = true,
				attack_time = 3,
				offset_up = 0,
				attack_anim = {
					"attack_combo_1"
				},
				staggers_allowed = WARLORD_ALLOWED_STAGGERS,
				push_units_in_the_way = pushed_data,
				bot_threats = {
					{
						range = 3.5,
						duration = 0.26666666666666666,
						start_time = 0.29333333333333333
					}
				}
			},
			{
				width = 2,
				offset_forward = 0.5,
				height = 0.75,
				range = 1.75,
				rotation_time = 1.2,
				anim_driven = true,
				next_combo_index = 3,
				hit_multiple_targets = true,
				player_push_speed_blocked = 15,
				push_close_units_during_attack = true,
				attack_time = 3,
				offset_up = 1,
				attack_anim = {
					"attack_combo_2"
				},
				staggers_allowed = WARLORD_ALLOWED_STAGGERS,
				push_units_in_the_way = pushed_data,
				bot_threats = {
					{
						range = 2.75,
						duration = 0.32,
						start_time = 0
					}
				}
			},
			{
				height = 2.2,
				range = 2.5,
				offset_forward = 0,
				rotation_time = 1.2,
				anim_driven = true,
				damage_done_time = 0.5333333333333333,
				hit_multiple_targets = true,
				player_push_speed_blocked = 15,
				push_close_units_during_attack = true,
				attack_time = 3,
				width = 0.4,
				offset_up = 0,
				attack_anim = {
					"attack_combo_3"
				},
				staggers_allowed = WARLORD_ALLOWED_STAGGERS,
				push_units_in_the_way = pushed_data,
				bot_threats = {
					{
						range = 3.5,
						duration = 0.32,
						start_time = 0.21333333333333335
					}
				}
			}
		},
		damage = {
			30,
			25,
			20
		},
		difficulty_damage = {
			easy = {
				15,
				20,
				15
			},
			normal = {
				20,
				25,
				20
			},
			hard = {
				25,
				35,
				30
			},
			survival_hard = {
				25,
				35,
				30
			},
			harder = {
				35,
				40,
				30
			},
			survival_harder = {
				35,
				40,
				30
			},
			hardest = {
				50,
				50,
				30
			},
			survival_hardest = {
				50,
				75,
				45
			}
		},
		stagger_impact = {
			1,
			2,
			0,
			0
		}
	}
}
BreedActions.skaven_storm_vermin_warlord = table.create_copy(BreedActions.skaven_storm_vermin_warlord, action_data)

return 

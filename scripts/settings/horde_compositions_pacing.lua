HordeCompositionsSoundSettings = {
	skaven = {
		stinger_sound_event = "enemy_horde_stinger",
		music_states = {
			horde = "horde"
		}
	},
	chaos = {
		stinger_sound_event = "enemy_horde_chaos_stinger",
		music_states = {
			pre_ambush = "pre_ambush_chaos",
			horde = "horde_chaos"
		}
	}
}
HordeCompositionsPacing = {
	small = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"skaven_slave",
				{
					20,
					22
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.skaven
	},
	medium = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"skaven_slave",
				{
					35,
					40
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.skaven
	},
	large = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"skaven_slave",
				{
					50,
					55
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.skaven
	},
	mini_patrol = {
		{
			name = "few_clanrats",
			weight = 2,
			breeds = {
				"skaven_clan_rat_with_shield",
				{
					2,
					3
				}
			}
		},
		{
			name = "few_clanrats",
			weight = 10,
			breeds = {
				"skaven_clan_rat",
				{
					3,
					4
				}
			}
		},
		{
			name = "storm_clanrats",
			weight = 3,
			breeds = {
				"skaven_clan_rat",
				{
					2,
					3
				},
				"skaven_storm_vermin_commander",
				{
					1,
					1
				}
			}
		}
	},
	chaos_medium = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"chaos_fanatic",
				{
					20,
					20
				}
			}
		},
		{
			name = "plain",
			weight = 7,
			breeds = {
				"chaos_marauder",
				{
					3,
					4
				},
				"chaos_fanatic",
				{
					15,
					20
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.chaos
	},
	chaos_large = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"chaos_marauder",
				{
					5,
					6
				},
				"chaos_fanatic",
				{
					20,
					25
				}
			}
		},
		{
			name = "plain",
			weight = 7,
			breeds = {
				"chaos_fanatic",
				{
					25,
					30
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.chaos
	},
	chaos_mini_patrol = {
		{
			name = "few_marauders",
			weight = 10,
			breeds = {
				"chaos_marauder",
				{
					2,
					3
				}
			}
		}
	},
	mutator_chaos_warrior_mini_patrol = {
		{
			name = "few_chaos_warriors",
			weight = 10,
			breeds = {
				"chaos_warrior",
				{
					3,
					4
				}
			}
		}
	},
	mutator_mixed_horde = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"chaos_marauder",
				{
					5,
					6
				},
				"chaos_fanatic",
				{
					5,
					6
				},
				"chaos_marauder_with_shield",
				{
					2,
					3
				},
				"chaos_warrior",
				{
					1,
					2
				},
				"skaven_storm_vermin_with_shield",
				1,
				"chaos_berzerker",
				{
					2,
					3
				},
				"skaven_storm_vermin_commander",
				{
					3,
					3
				},
				"skaven_clan_rat",
				{
					5,
					6
				},
				"skaven_slave",
				{
					5,
					6
				},
				"skaven_plague_monk",
				{
					2,
					3
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.chaos
	}
}

return

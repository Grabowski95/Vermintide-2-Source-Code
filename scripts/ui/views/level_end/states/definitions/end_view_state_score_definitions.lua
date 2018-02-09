local MAX_SCORE_PANEL_ROWS = 20
local num_players = 4
local player_score_size = {
	250,
	580
}
local topics_hover_length = player_score_size[1] + 1400
local scenegraph_definition = {
	screen = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.end_screen
		}
	},
	scores_topics = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			350,
			player_score_size[2]
		},
		position = {
			0,
			0,
			1
		}
	},
	summary_title = {
		vertical_alignment = "top",
		parent = "scores_topics",
		horizontal_alignment = "center",
		size = {
			1600,
			40
		},
		position = {
			0,
			0,
			1
		}
	},
	title_bg = {
		vertical_alignment = "center",
		parent = "summary_title",
		horizontal_alignment = "center",
		size = {
			334,
			60
		},
		position = {
			0,
			0,
			-1
		}
	},
	player_panel_1 = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = player_score_size,
		position = {
			-700,
			0,
			1
		}
	},
	player_panel_2 = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = player_score_size,
		position = {
			-375,
			0,
			1
		}
	},
	player_panel_3 = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = player_score_size,
		position = {
			375,
			0,
			1
		}
	},
	player_panel_4 = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = player_score_size,
		position = {
			700,
			0,
			1
		}
	},
	player_frame_1 = {
		vertical_alignment = "top",
		parent = "player_panel_1",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-15,
			10
		}
	},
	player_frame_2 = {
		vertical_alignment = "top",
		parent = "player_panel_2",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-15,
			10
		}
	},
	player_frame_3 = {
		vertical_alignment = "top",
		parent = "player_panel_3",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-15,
			10
		}
	},
	player_frame_4 = {
		vertical_alignment = "top",
		parent = "player_panel_4",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-15,
			10
		}
	}
}
local summary_title_style = {
	word_wrap = true,
	font_size = 52,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local widgets = {
	summary_title = UIWidgets.create_simple_text(Localize("end_screen_scoreboard"), "summary_title", nil, nil, summary_title_style),
	title_bg = UIWidgets.create_simple_texture("tab_menu_bg_03", "title_bg"),
	scores_topics = UIWidgets.create_score_topics("scores_topics", scenegraph_definition.scores_topics.size, topics_hover_length, MAX_SCORE_PANEL_ROWS)
}
local score_widgets = {
	player_score_1 = UIWidgets.create_score_entry("player_panel_1", scenegraph_definition.player_panel_1.size, MAX_SCORE_PANEL_ROWS, "left"),
	player_score_2 = UIWidgets.create_score_entry("player_panel_2", scenegraph_definition.player_panel_2.size, MAX_SCORE_PANEL_ROWS),
	player_score_3 = UIWidgets.create_score_entry("player_panel_3", scenegraph_definition.player_panel_3.size, MAX_SCORE_PANEL_ROWS, "left"),
	player_score_4 = UIWidgets.create_score_entry("player_panel_4", scenegraph_definition.player_panel_4.size, MAX_SCORE_PANEL_ROWS)
}
local hero_widgets = {
	player_frame_1 = UIWidgets.create_portrait_frame("player_frame_1", "default", "-", 1, nil, "unit_frame_portrait_default"),
	player_frame_2 = UIWidgets.create_portrait_frame("player_frame_2", "default", "-", 1, nil, "unit_frame_portrait_default"),
	player_frame_3 = UIWidgets.create_portrait_frame("player_frame_3", "default", "-", 1, nil, "unit_frame_portrait_default"),
	player_frame_4 = UIWidgets.create_portrait_frame("player_frame_4", "default", "-", 1, nil, "unit_frame_portrait_default")
}
local animation_definitions = {
	transition_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "move_inner_panels",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress - 1)
				ui_scenegraph.player_panel_2.local_position[1] = anim_progress*400 - -375
				ui_scenegraph.player_panel_3.local_position[1] = anim_progress*400 + 375

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "move_outer_panels",
			start_progress = 0,
			end_progress = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress - 1)
				ui_scenegraph.player_panel_1.local_position[1] = anim_progress*400 - -700
				ui_scenegraph.player_panel_4.local_position[1] = anim_progress*400 + 700

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	transition_exit = {
		{
			name = "fade_out",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress - 1

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	}
}

return {
	widgets = widgets,
	hero_widgets = hero_widgets,
	score_widgets = score_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}

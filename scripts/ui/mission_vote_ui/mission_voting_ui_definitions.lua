local window_default_settings = UISettings.game_start_windows
local small_window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local small_window_size = window_default_settings.size
local small_window_spacing = window_default_settings.spacing
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_text_width = small_window_size[1] - window_frame_width*2
local window_size = {
	small_window_size[1] + small_window_spacing*2,
	small_window_size[2] + 60
}
local game_option_size = {
	small_window_size[1] - 20,
	233
}
local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	menu_root = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	screen = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1
		}
	},
	window_fade = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1
		}
	},
	inner_window = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = small_window_size,
		position = {
			0,
			0,
			2
		}
	},
	timer_title = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = window_size,
		position = {
			0,
			-30,
			3
		}
	},
	timer_bg = {
		vertical_alignment = "top",
		parent = "button_confirm",
		horizontal_alignment = "center",
		size = {
			500,
			16
		},
		position = {
			0,
			25,
			3
		}
	},
	timer_fg = {
		vertical_alignment = "center",
		parent = "timer_bg",
		horizontal_alignment = "left",
		size = {
			490,
			16
		},
		position = {
			5,
			0,
			3
		}
	},
	timer_glow = {
		vertical_alignment = "center",
		parent = "timer_fg",
		horizontal_alignment = "right",
		size = {
			45,
			80
		},
		position = {
			22,
			0,
			3
		}
	},
	button_confirm = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			game_option_size[1],
			72
		},
		position = {
			0,
			38,
			20
		}
	},
	button_abort = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			380,
			42
		},
		position = {
			0,
			-16,
			22
		}
	},
	game_options_right_chain = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			16,
			window_size[2]
		},
		position = {
			195,
			0,
			2
		}
	},
	game_options_left_chain = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			16,
			window_size[2]
		},
		position = {
			-195,
			0,
			2
		}
	},
	title = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			570,
			60
		},
		position = {
			0,
			34,
			22
		}
	},
	title_bg = {
		vertical_alignment = "top",
		parent = "title",
		horizontal_alignment = "center",
		size = {
			410,
			40
		},
		position = {
			0,
			-15,
			-1
		}
	},
	title_text = {
		vertical_alignment = "center",
		parent = "title",
		horizontal_alignment = "center",
		size = {
			350,
			50
		},
		position = {
			0,
			-3,
			2
		}
	},
	deed_options = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			small_window_size[1] - 20,
			700
		},
		position = {
			0,
			-36,
			3
		}
	},
	mutator_entry_root = {
		vertical_alignment = "top",
		parent = "deed_options",
		horizontal_alignment = "center",
		size = {
			game_option_size[1] - 40,
			30
		},
		position = {
			0,
			-340,
			10
		}
	},
	reward_item_1 = {
		vertical_alignment = "bottom",
		parent = "deed_options",
		horizontal_alignment = "center",
		size = {
			80,
			80
		},
		position = {
			0,
			35,
			10
		}
	},
	reward_item_2 = {
		vertical_alignment = "bottom",
		parent = "deed_options",
		horizontal_alignment = "center",
		size = {
			80,
			80
		},
		position = {
			0,
			35,
			10
		}
	},
	reward_item_3 = {
		vertical_alignment = "bottom",
		parent = "deed_options",
		horizontal_alignment = "center",
		size = {
			80,
			80
		},
		position = {
			0,
			35,
			10
		}
	},
	game_option_1 = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = game_option_size,
		position = {
			0,
			-36,
			3
		}
	},
	game_option_2 = {
		vertical_alignment = "bottom",
		parent = "game_option_1",
		horizontal_alignment = "center",
		size = game_option_size,
		position = {
			0,
			-249,
			0
		}
	},
	additional_option = {
		vertical_alignment = "bottom",
		parent = "game_option_2",
		horizontal_alignment = "center",
		size = {
			game_option_size[1],
			200
		},
		position = {
			0,
			-216,
			0
		}
	},
	reward_presentation = {
		vertical_alignment = "bottom",
		parent = "game_option_1",
		horizontal_alignment = "center",
		size = {
			game_option_size[1],
			449
		},
		position = {
			0,
			-465,
			0
		}
	}
}
local title_text_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 28,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}

local function create_mutator_entry(scenegraph_id, size)
	local background_texture = "matchmaking_window_03"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_name = "menu_frame_09"
	local frame_settings = UIFrameSettings[frame_name]
	local widget = {
		element = {}
	}
	local passes = {
		{
			style_id = "text",
			pass_type = "text",
			text_id = "text"
		},
		{
			style_id = "text_shadow",
			pass_type = "text",
			text_id = "text"
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon"
		}
	}
	local content = {
		text = "text",
		icon = "icons_placeholder"
	}
	local style = {
		icon = {
			vertical_alignment = "top",
			texture_size = {
				30,
				30
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				-5,
				0
			}
		},
		text = {
			vertical_alignment = "top",
			font_size = 28,
			localize = false,
			horizontal_alignment = "left",
			word_wrap = true,
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				40,
				-5,
				1
			}
		},
		text_shadow = {
			vertical_alignment = "top",
			font_size = 28,
			localize = false,
			horizontal_alignment = "left",
			word_wrap = true,
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				42,
				-7,
				0
			}
		}
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_deed_option(scenegraph_id, size)
	local background_texture = "game_options_bg_04"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_name = "menu_frame_08"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_width = frame_settings.texture_sizes.corner[1]
	local widget = {
		element = {
			passes = {
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					style_id = "deed_title",
					pass_type = "text",
					text_id = "deed_title"
				},
				{
					style_id = "deed_title_shadow",
					pass_type = "text",
					text_id = "deed_title"
				},
				{
					style_id = "reward_title",
					pass_type = "text",
					text_id = "reward_title"
				},
				{
					style_id = "reward_title_shadow",
					pass_type = "text",
					text_id = "reward_title"
				},
				{
					texture_id = "reward_title_divider",
					style_id = "reward_title_divider",
					pass_type = "texture"
				},
				{
					style_id = "option_text_1",
					pass_type = "text",
					text_id = "option_text_1"
				},
				{
					style_id = "option_text_shadow_1",
					pass_type = "text",
					text_id = "option_text_1"
				},
				{
					style_id = "title_text_1",
					pass_type = "text",
					text_id = "title_text_1"
				},
				{
					style_id = "title_text_shadow_1",
					pass_type = "text",
					text_id = "title_text_1"
				},
				{
					pass_type = "texture",
					style_id = "title_bg_1",
					texture_id = "title_bg"
				},
				{
					pass_type = "texture",
					style_id = "title_edge_bottom_1",
					texture_id = "title_edge"
				},
				{
					pass_type = "texture",
					style_id = "title_edge_top_1",
					texture_id = "title_edge"
				},
				{
					style_id = "option_text_2",
					pass_type = "text",
					text_id = "option_text_2"
				},
				{
					style_id = "option_text_shadow_2",
					pass_type = "text",
					text_id = "option_text_2"
				},
				{
					style_id = "title_text_2",
					pass_type = "text",
					text_id = "title_text_2"
				},
				{
					style_id = "title_text_shadow_2",
					pass_type = "text",
					text_id = "title_text_2"
				},
				{
					pass_type = "texture",
					style_id = "title_bg_2",
					texture_id = "title_bg"
				},
				{
					pass_type = "texture",
					style_id = "title_edge_bottom_2",
					texture_id = "title_edge"
				},
				{
					pass_type = "texture",
					style_id = "title_edge_top_2",
					texture_id = "title_edge"
				},
				{
					style_id = "title_text_3",
					pass_type = "text",
					text_id = "title_text_3"
				},
				{
					style_id = "title_text_shadow_3",
					pass_type = "text",
					text_id = "title_text_3"
				},
				{
					pass_type = "texture",
					style_id = "title_bg_3",
					texture_id = "title_bg"
				},
				{
					pass_type = "texture",
					style_id = "title_edge_bottom_3",
					texture_id = "title_edge"
				},
				{
					pass_type = "texture",
					style_id = "title_edge_top_3",
					texture_id = "title_edge"
				}
			}
		},
		content = {
			reward_title_divider = "divider_01_top",
			title_bg = "playername_bg_02",
			title_edge = "game_option_divider",
			frame = frame_settings.texture,
			option_text_1 = Localize("start_game_window_mission"),
			option_text_2 = Localize("start_game_window_difficulty"),
			deed_title = Localize("start_game_window_mission"),
			reward_title = Localize("deed_reward_title"),
			title_text_1 = Localize("start_game_window_mission"),
			title_text_2 = Localize("start_game_window_difficulty"),
			title_text_3 = Localize("start_game_window_mutator_title"),
			background = {
				uvs = {
					{
						0,
						math.min(size[2]/background_texture_settings.size[2], 1) - 1
					},
					{
						math.min(size[1]/background_texture_settings.size[1], 1),
						1
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			deed_title = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 32,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font_size = false,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					10,
					size[2] - 60 - frame_width,
					10
				},
				size = {
					size[1] - 20,
					50
				}
			},
			deed_title_shadow = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 32,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font_size = false,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					12,
					size[2] - 60 - (frame_width + 2),
					9
				},
				size = {
					size[1] - 20,
					50
				}
			},
			reward_title = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 28,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				dynamic_font_size = false,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					10,
					frame_width,
					10
				},
				size = {
					size[1] - 20,
					180
				}
			},
			reward_title_shadow = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 28,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				dynamic_font_size = false,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					12,
					frame_width - 2,
					9
				},
				size = {
					size[1] - 20,
					180
				}
			},
			reward_title_divider = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1]/2 - 132,
					130,
					8
				},
				size = {
					264,
					32
				}
			},
			frame = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					10
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes
			},
			background = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			title_bg_1 = {
				size = {
					size[1],
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 38 - frame_width - 80,
					2
				}
			},
			title_edge_top_1 = {
				size = {
					size[1],
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - frame_width - 80,
					4
				}
			},
			title_edge_bottom_1 = {
				size = {
					size[1],
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 38 - frame_width - 80,
					4
				}
			},
			title_text_1 = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-(frame_width + 80),
					10
				}
			},
			title_text_shadow_1 = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 80 + 2),
					9
				}
			},
			option_text_1 = {
				font_size = 28,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					frame_width + 5,
					-135,
					10
				}
			},
			option_text_shadow_1 = {
				font_size = 28,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-137,
					9
				}
			},
			title_bg_2 = {
				size = {
					size[1],
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 38 - frame_width - 180,
					2
				}
			},
			title_edge_top_2 = {
				size = {
					size[1],
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - frame_width - 180,
					4
				}
			},
			title_edge_bottom_2 = {
				size = {
					size[1],
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 38 - frame_width - 180,
					4
				}
			},
			title_text_2 = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-(frame_width + 180),
					10
				}
			},
			title_text_shadow_2 = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 180 + 2),
					9
				}
			},
			option_text_2 = {
				font_size = 28,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					frame_width + 5,
					-235,
					10
				}
			},
			option_text_shadow_2 = {
				font_size = 28,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-237,
					9
				}
			},
			title_bg_3 = {
				size = {
					size[1],
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 38 - frame_width - 280,
					2
				}
			},
			title_edge_top_3 = {
				size = {
					size[1],
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - frame_width - 280,
					4
				}
			},
			title_edge_bottom_3 = {
				size = {
					size[1],
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 38 - frame_width - 280,
					4
				}
			},
			title_text_3 = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-(frame_width + 280),
					10
				}
			},
			title_text_shadow_3 = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 280 + 2),
					9
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end

local function create_settings_option(scenegraph_id, size, title_text, icon_texture, background_texture)
	icon_texture = icon_texture or "map_frame_fade"
	local icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(icon_texture)
	local icon_texture_size = (icon_texture_settings and icon_texture_settings.size) or {
		200,
		200
	}
	local icon_scale = math.min(size[2]/icon_texture_size[2], 1) - 1
	local icon_size = {
		icon_texture_size[1],
		icon_texture_size[2]
	}
	background_texture = background_texture or "play_screen_bg"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_name = "menu_frame_08"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_width = frame_settings.texture_sizes.corner[1]
	local glow_frame_name = "frame_outer_glow_01"
	local glow_frame_settings = UIFrameSettings[glow_frame_name]
	local glow_frame_width = glow_frame_settings.texture_sizes.corner[1]
	local widget = {
		element = {
			passes = {
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					texture_id = "icon_frame",
					style_id = "icon_frame",
					pass_type = "texture"
				},
				{
					texture_id = "icon",
					style_id = "icon",
					pass_type = "texture"
				},
				{
					style_id = "option_text",
					pass_type = "text",
					text_id = "option_text"
				},
				{
					style_id = "option_text_shadow",
					pass_type = "text",
					text_id = "option_text"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					pass_type = "texture",
					style_id = "title_bg",
					texture_id = "title_bg"
				},
				{
					pass_type = "texture",
					style_id = "title_edge",
					texture_id = "title_edge"
				}
			}
		},
		content = {
			title_bg = "playername_bg_02",
			option_text = "",
			icon_frame = "map_frame_00",
			title_edge = "game_option_divider",
			frame = frame_settings.texture,
			title_text = title_text or "n/a",
			icon = icon_texture,
			background = {
				uvs = {
					{
						0,
						math.min(size[2]/background_texture_settings.size[2], 1) - 1
					},
					{
						math.min(size[1]/background_texture_settings.size[1], 1),
						1
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			frame = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					10
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes
			},
			background = {
				texture_tiling_size = {
					400,
					150
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			icon = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - icon_size[1] - frame_width,
					size[2]/2 - icon_size[2]/2,
					5
				}
			},
			icon_frame = {
				size = {
					180,
					180
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - icon_size[1] - frame_width + icon_size[1]/2 - 90,
					size[2]/2 - icon_size[2]/2 + icon_size[2]/2 - 90,
					6
				}
			},
			title_bg = {
				size = {
					size[1],
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					2
				}
			},
			title_edge = {
				size = {
					size[1],
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					4
				}
			},
			title_text = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-frame_width,
					10
				}
			},
			title_text_shadow = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2),
					9
				}
			},
			option_text = {
				font_size = 28,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					frame_width + 5,
					-55,
					10
				}
			},
			option_text_shadow = {
				font_size = 28,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-57,
					9
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end

local function create_additional_settings_option(scenegraph_id, size, title_text, background_texture)
	background_texture = background_texture or "play_screen_bg"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_name = "menu_frame_08"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_width = frame_settings.texture_sizes.corner[1]
	local widget = {
		element = {
			passes = {
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					pass_type = "texture",
					style_id = "title_bg",
					texture_id = "title_bg"
				},
				{
					pass_type = "texture",
					style_id = "title_edge",
					texture_id = "title_edge"
				},
				{
					style_id = "option_text",
					pass_type = "text",
					text_id = "option_text"
				},
				{
					style_id = "option_text_shadow",
					pass_type = "text",
					text_id = "option_text"
				}
			}
		},
		content = {
			title_bg = "playername_bg_02",
			option_text = "",
			title_edge = "game_option_divider",
			frame = frame_settings.texture,
			title_text = title_text or "n/a",
			background = {
				uvs = {
					{
						0,
						math.min(size[2]/background_texture_settings.size[2], 1) - 1
					},
					{
						math.min(size[1]/background_texture_settings.size[1], 1),
						1
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			frame = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					10
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes
			},
			background = {
				texture_tiling_size = {
					400,
					150
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			title_bg = {
				size = {
					size[1],
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					2
				}
			},
			title_edge = {
				size = {
					size[1],
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					4
				}
			},
			title_text = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-frame_width,
					10
				}
			},
			title_text_shadow = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2),
					9
				}
			},
			option_text = {
				font_size = 28,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					frame_width + 5,
					-55,
					10
				}
			},
			option_text_shadow = {
				font_size = 28,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-57,
					9
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end

local function create_reward_presentation(scenegraph_id, size)
	local background_texture = "game_options_bg_05"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_name = "menu_frame_08"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_width = frame_settings.texture_sizes.corner[1]
	local widget = {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					style_id = "option_text",
					pass_type = "text",
					text_id = "option_text"
				},
				{
					style_id = "option_text_shadow",
					pass_type = "text",
					text_id = "option_text"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					pass_type = "texture",
					style_id = "title_bg",
					texture_id = "title_bg"
				},
				{
					pass_type = "texture",
					style_id = "title_edge",
					texture_id = "title_edge"
				}
			}
		},
		content = {
			title_bg = "playername_bg_02",
			title_edge = "game_option_divider",
			button_hotspot = {},
			frame = frame_settings.texture,
			option_text = Localize("start_game_window_adventure_reward_desc"),
			title_text = Localize("start_game_window_adventure_reward_title"),
			background = {
				uvs = {
					{
						0,
						math.min(size[2]/background_texture_settings.size[2], 1) - 1
					},
					{
						math.min(size[1]/background_texture_settings.size[1], 1),
						1
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			frame = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					10
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes
			},
			background = {
				texture_tiling_size = {
					400,
					150
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			title_bg = {
				size = {
					size[1],
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					2
				}
			},
			title_edge = {
				size = {
					size[1],
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					4
				}
			},
			title_text = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-frame_width,
					10
				}
			},
			title_text_shadow = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2),
					9
				}
			},
			option_text = {
				font_size = 28,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					frame_width,
					frame_width + 10,
					10
				},
				size = {
					size[1] - frame_width*2,
					size[2]
				}
			},
			option_text_shadow = {
				font_size = 28,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 2,
					frame_width + 8,
					9
				},
				size = {
					size[1] - frame_width*2,
					size[2]
				}
			},
			button_disabled_rect = {
				color = {
					150,
					5,
					5,
					5
				},
				offset = {
					frame_width,
					frame_width,
					15
				},
				size = {
					size[1] - frame_width*2,
					size[2] - frame_width*2
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end

local widgets = {
	background = {
		scenegraph_id = "screen",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "gradient_dice_game_reward"
		},
		style = {
			color = {
				255,
				255,
				255,
				255
			}
		}
	},
	window = UIWidgets.create_frame("window", scenegraph_definition.window.size, "menu_frame_11", 10),
	window_background = UIWidgets.create_tiled_texture("window", "menu_frame_bg_01", {
		960,
		1080
	}, nil, nil, {
		255,
		100,
		100,
		100
	}),
	window_fade = UIWidgets.create_simple_texture("options_window_fade_01", "window_fade"),
	button_confirm = UIWidgets.create_play_button("button_confirm", scenegraph_definition.button_confirm.size, "Accept", 34),
	button_abort = UIWidgets.create_default_button("button_abort", scenegraph_definition.button_abort.size, nil, nil, "Decline", 24, nil, "button_detail_04", 34),
	game_options_left_chain = UIWidgets.create_tiled_texture("game_options_left_chain", "chain_link_01", {
		16,
		19
	}),
	game_options_right_chain = UIWidgets.create_tiled_texture("game_options_right_chain", "chain_link_01", {
		16,
		19
	}),
	title = UIWidgets.create_simple_texture("frame_title_bg_02", "title"),
	title_bg = UIWidgets.create_background("title_bg", scenegraph_definition.title_bg.size, "menu_frame_bg_02"),
	title_text = UIWidgets.create_simple_text("", "title_text", nil, nil, title_text_style),
	timer_bg = UIWidgets.create_simple_texture("timer_bg", "timer_bg"),
	timer_fg = UIWidgets.create_simple_uv_texture("timer_fg", {
		{
			0,
			0
		},
		{
			1,
			1
		}
	}, "timer_fg"),
	timer_glow = UIWidgets.create_simple_texture("timer_detail", "timer_glow")
}
local adventure_game_widgets = {
	game_option_1 = create_settings_option("game_option_1", scenegraph_definition.game_option_1.size, Localize("start_game_window_difficulty"), "difficulty_option_1", "game_options_bg_02"),
	reward_presentation = create_reward_presentation("reward_presentation", scenegraph_definition.reward_presentation.size)
}
local custom_game_widgets = {
	game_option_1 = create_settings_option("game_option_1", scenegraph_definition.game_option_1.size, Localize("start_game_window_mission"), nil, "game_options_bg_01"),
	game_option_2 = create_settings_option("game_option_2", scenegraph_definition.game_option_2.size, Localize("start_game_window_difficulty"), "difficulty_option_1", "game_options_bg_02"),
	additional_option = create_additional_settings_option("additional_option", scenegraph_definition.additional_option.size, Localize("start_game_window_other_options_title"), "game_options_bg_03")
}
local deed_game_widgets = {
	deed_options = create_deed_option("deed_options", scenegraph_definition.deed_options.size),
	reward_item_1 = UIWidgets.create_simple_inventory_item("reward_item_1", scenegraph_definition.reward_item_1.size),
	reward_item_2 = UIWidgets.create_simple_inventory_item("reward_item_2", scenegraph_definition.reward_item_2.size),
	reward_item_3 = UIWidgets.create_simple_inventory_item("reward_item_3", scenegraph_definition.reward_item_3.size)
}
local mutator_widgets = {}

for i = 1, 10, 1 do
	mutator_widgets[i] = create_mutator_entry("mutator_entry_root", scenegraph_definition.mutator_entry_root.size)
end

return {
	scenegraph_definition = scenegraph_definition,
	adventure_game_widgets = adventure_game_widgets,
	custom_game_widgets = custom_game_widgets,
	deed_game_widgets = deed_game_widgets,
	mutator_widgets = mutator_widgets,
	widgets = widgets
}

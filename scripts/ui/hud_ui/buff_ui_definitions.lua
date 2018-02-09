local SIZE_X = 1920
local SIZE_Y = 1080
local RETAINED_MODE_ENABLED = true
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud
		},
		size = {
			SIZE_X,
			SIZE_Y
		}
	},
	pivot = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "left",
		position = {
			150,
			18,
			1
		},
		size = {
			0,
			0
		}
	},
	buff_pivot = {
		vertical_alignment = "center",
		parent = "pivot",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			0,
			0
		}
	}
}
local MAX_NUMBER_OF_BUFFS = 5
local BUFF_SIZE = {
	66,
	66
}
local BUFF_SPACING = 8

local function create_buff_widget(index)
	local frame_offset = {
		0,
		0,
		0
	}
	local bg_color = {
		255,
		36,
		215,
		231
	}
	local size = BUFF_SIZE

	return {
		scenegraph_id = "buff_pivot",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_icon",
					texture_id = "texture_icon",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.is_cooldown
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_icon_bg",
					texture_id = "texture_icon",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "icon_mask",
					texture_id = "icon_mask",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "texture_frame",
					texture_id = "texture_frame",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "stack_count",
					pass_type = "text",
					text_id = "stack_count",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						local stack_count = content.stack_count

						return stack_count and 1 < stack_count
					end
				},
				{
					style_id = "stack_count_shadow",
					pass_type = "text",
					text_id = "stack_count",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						local stack_count = content.stack_count

						return stack_count and 1 < stack_count
					end
				},
				{
					pass_type = "gradient_mask_texture",
					style_id = "texture_duration",
					texture_id = "texture_duration",
					retained_mode = RETAINED_MODE_ENABLED
				}
			}
		},
		content = {
			icon_mask = "buff_gradient_mask",
			stack_count = 1,
			texture_cooldown = "buff_cooldown_gradient",
			texture_frame = "buff_frame",
			is_expired = false,
			texture_icon = "teammate_consumable_icon_medpack",
			texture_duration = "buff_duration_gradient",
			gris = "rect_masked",
			is_cooldown = false
		},
		style = {
			texture_icon_bg = {
				saturated = false,
				size = {
					60,
					60
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					3,
					3,
					1
				}
			},
			texture_icon = {
				saturated = false,
				masked = true,
				size = {
					60,
					60
				},
				color = {
					255,
					100,
					100,
					100
				},
				offset = {
					3,
					3,
					2
				}
			},
			icon_mask = {
				size = {
					60,
					60
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					3,
					3,
					2
				}
			},
			texture_cooldown = {
				size = {
					60,
					60
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					3,
					3,
					3
				}
			},
			texture_frame = {
				size = size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					4
				}
			},
			texture_duration = {
				size = {
					70,
					70
				},
				color = {
					150,
					255,
					255,
					255
				},
				offset = {
					-2,
					-2,
					5
				}
			},
			stack_count = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 26,
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				font_type = "hell_shark",
				size = {
					60,
					60
				},
				offset = {
					-2,
					2,
					9
				},
				text_color = Colors.get_color_table_with_alpha("white", 255)
			},
			stack_count_shadow = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 26,
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				font_type = "hell_shark",
				size = {
					60,
					60
				},
				offset = {
					0,
					0,
					8
				},
				text_color = Colors.get_color_table_with_alpha("black", 255)
			}
		},
		offset = {
			0,
			0,
			0
		}
	}
end

local buff_widget_definitions = {}

for i = 1, MAX_NUMBER_OF_BUFFS, 1 do
	buff_widget_definitions[i] = create_buff_widget(i)
end

return {
	BUFF_SIZE = BUFF_SIZE,
	BUFF_SPACING = BUFF_SPACING,
	MAX_NUMBER_OF_BUFFS = MAX_NUMBER_OF_BUFFS,
	scenegraph_definition = scenegraph_definition,
	buff_widget_definitions = buff_widget_definitions
}

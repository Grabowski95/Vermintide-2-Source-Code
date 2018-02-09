UITooltipPasses = UITooltipPasses or {}
local UIRenderer = UIRenderer
local UIRenderer_draw_texture = UIRenderer.draw_texture
local UIRenderer_draw_texture_uv = UIRenderer.draw_texture_uv
local DEFAULT_START_LAYER = 994

local function get_text_height(ui_renderer, size, ui_style, ui_content, text, ui_style_global)
	local widget_scale = nil

	if ui_style_global then
		widget_scale = ui_style_global.scale
	end

	local font_material, font_size, font_name = nil

	if ui_style.font_type then
		local font, size_of_font = UIFontByResolution(ui_style, widget_scale)
		font_name = font[3]
		font_size = font[2]
		font_material = font[1]
		font_size = size_of_font
	else
		local font = ui_style.font
		font_name = font[3]
		font_size = font[2]
		font_material = font[1]

		if not ui_style.font_size then
		end
	end

	if ui_style.localize then
		text = Localize(text)
	end

	local font_height, font_min, font_max = UIGetFontHeight(ui_renderer.gui, font_name, font_size)
	local texts = UIRenderer.word_wrap(ui_renderer, text, font_material, font_size, size[1])
	local text_start_index = ui_content.text_start_index or 1
	local max_texts = ui_content.max_texts or #texts
	local num_texts = math.min(#texts - text_start_index - 1, max_texts)
	local inv_scale = RESOLUTION_LOOKUP.inv_scale
	local full_font_height = (font_max + math.abs(font_min))*inv_scale*num_texts

	return full_font_height
end

UITooltipPasses = {
	background = {
		setup_data = function ()
			local data = {
				frame_margin = 10,
				frame_name = "item_tooltip_frame_01",
				background_color = {
					255,
					3,
					3,
					3
				},
				frame_color = {
					255,
					255,
					255,
					255
				}
			}

			return data
		end,
		draw = function (draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, data, draw_downwards)
			local alpha_multiplier = pass_definition.alpha_multiplier
			local alpha = alpha_multiplier*255
			local start_layer = pass_definition.start_layer or DEFAULT_START_LAYER
			local frame_texture_name = data.frame_name
			local frame_settings = UIFrameSettings[frame_texture_name]
			local edge_height = frame_settings.texture_sizes.horizontal[2]

			if draw then
				if draw_downwards then
					position[2] = position[2] - size[2] - edge_height*2
				end

				size[2] = size[2] + edge_height*2
				position[3] = start_layer
				local background_color = data.background_color
				background_color[1] = alpha

				UIRenderer.draw_rect(ui_renderer, position, size, background_color)

				position[3] = start_layer + 6
				local frame_color = data.frame_color
				frame_color[1] = alpha

				UIRenderer.draw_texture_frame(ui_renderer, position, size, frame_settings.texture, frame_settings.texture_size, frame_settings.texture_sizes, frame_color)
			end

			return edge_height*2
		end
	},
	item_background = {
		setup_data = function ()
			local frame_name = "item_tooltip_frame_01"
			local frame_settings = UIFrameSettings[frame_name]
			local frame_edge_height = frame_settings.texture_sizes.horizontal[2]
			local data = {
				background_texture = "item_tooltip_background",
				frame_name = frame_name,
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				},
				background_texture_size = {
					300,
					300
				},
				background_color = {
					255,
					255,
					255,
					255
				},
				frame_color = {
					255,
					255,
					255,
					255
				},
				frame_margin = frame_edge_height*2
			}

			return data
		end,
		draw = function (draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
			local alpha_multiplier = pass_definition.alpha_multiplier
			local alpha = alpha_multiplier*255
			local start_layer = pass_definition.start_layer or DEFAULT_START_LAYER
			local frame_texture_name = data.frame_name
			local frame_settings = UIFrameSettings[frame_texture_name]
			local edge_height = frame_settings.texture_sizes.horizontal[2]

			if draw then
				local item_data = item.data
				local rarity = item.rarity or item_data.rarity
				local rarity_color = Colors.get_table(rarity)
				position[2] = position[2] - size[2] - edge_height*2
				size[2] = (size[2] + edge_height*2) - 2
				position[3] = start_layer
				local background_texture = data.background_texture
				local background_texture_size = data.background_texture_size
				background_texture_size[1] = size[1]
				local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
				local background_size = background_texture_settings.size
				local uvs = data.uvs
				uvs[2][1] = math.min(size[1]/background_size[1], 1)
				uvs[2][2] = math.min(size[2]/background_size[2], 1)
				local color = data.background_color
				local color_multiplier = (rarity == "plentiful" and 0.5) or 1
				color[1] = alpha
				color[2] = rarity_color[2]*color_multiplier
				color[3] = rarity_color[3]*color_multiplier
				color[4] = rarity_color[4]*color_multiplier

				UIRenderer.draw_tiled_texture(ui_renderer, background_texture, position, size, background_texture_size, color)

				size[2] = size[2] + 2
				position[3] = start_layer + 6
				local frame_color = data.frame_color
				frame_color[1] = alpha

				UIRenderer.draw_texture_frame(ui_renderer, position, size, frame_settings.texture, frame_settings.texture_size, frame_settings.texture_sizes, frame_color)
			end

			return edge_height*2
		end
	},
	weapon_stats = {
		setup_data = function ()
			local data = {
				frame_name = "item_tooltip_frame_01",
				background_color = {
					240,
					3,
					3,
					3
				},
				text_pass_data = {},
				text_size = {},
				content = {
					slot_star = {
						"stats_star",
						"stats_star",
						"stats_star",
						"stats_star",
						"stats_star"
					},
					left_star = {
						"stats_star_left",
						"stats_star_left",
						"stats_star_left",
						"stats_star_left",
						"stats_star_left"
					},
					right_star = {
						"stats_star_right",
						"stats_star_right",
						"stats_star_right",
						"stats_star_right",
						"stats_star_right"
					}
				},
				style = {
					attack_stars = {
						direction = 1,
						axis = 1,
						draw_count = 0,
						texture_size = {
							20,
							20
						},
						spacing = {
							2,
							0
						},
						color = {
							255,
							255,
							255,
							255
						},
						slot_color = {
							200,
							50,
							50,
							50
						},
						offset = {
							0,
							0,
							0
						}
					},
					stat_title = {
						vertical_alignment = "top",
						font_size = 18,
						horizontal_alignment = "center",
						word_wrap = true,
						font_type = "hell_shark",
						text_color = Colors.get_color_table_with_alpha("font_default", 255)
					},
					title_1 = {
						text = "item_compare_attack_title_light",
						word_wrap = true,
						vertical_alignment = "bottom",
						horizontal_alignment = "left",
						font_size = 18,
						font_type = "hell_shark",
						text_color = Colors.get_color_table_with_alpha("font_title", 255)
					},
					title_2 = {
						text = "item_compare_attack_title_heavy",
						word_wrap = true,
						vertical_alignment = "bottom",
						horizontal_alignment = "right",
						font_size = 18,
						font_type = "hell_shark",
						text_color = Colors.get_color_table_with_alpha("font_title", 255)
					}
				}
			}

			return data
		end,
		draw = function (draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
			local alpha_multiplier = pass_definition.alpha_multiplier
			local alpha = alpha_multiplier*255
			local start_layer = pass_definition.start_layer or DEFAULT_START_LAYER
			local frame_margin = data.frame_margin or 0
			local item_data = item.data
			local slot_type = item_data.slot_type
			local is_weapon = slot_type == "melee" or slot_type == "ranged"

			if not is_weapon then
				return 0
			end

			local backend_id = item.backend_id
			local weapon_stats_data = nil

			if not data.stats_data then
				weapon_stats_data = ItemHelper.retrieve_weapon_item_statistics(item_data, backend_id)
				data.stats_data = weapon_stats_data
			else
				weapon_stats_data = data.stats_data
			end

			local style = data.style
			local content = data.content
			local position_x = position[1]
			local position_y = position[2]
			local position_z = position[3]
			local icon_size = style.attack_stars.texture_size
			local star_width = icon_size[1]
			local star_height = icon_size[2]
			local num_rows = #weapon_stats_data
			local star_total_length = star_width*5
			local star_total_height = star_height*num_rows
			local total_height = frame_margin

			if draw_downwards then
				position[2] = position[2] - frame_margin*2
			else
				position[2] = position[2] + star_total_height
			end

			position[3] = start_layer + 2

			if draw then
				for i = 1, 2, 1 do
					local text_id = "title_" .. i
					local text_style = style[text_id]
					local text_size = data.text_size
					text_size[1] = size[1]
					text_size[2] = star_height
					local text_pass_data = data.text_pass_data
					text_pass_data.text_id = text_id
					local text = Localize(text_style.text)
					content[text_id] = text
					local text_height = get_text_height(ui_renderer, text_size, text_style, content, text, ui_style_global)

					if i == 2 then
						position[1] = position_x - frame_margin + frame_margin/4
					else
						position[1] = position_x + frame_margin
					end

					local text_height = get_text_height(ui_renderer, text_size, text_style, content, text, ui_style_global)

					if i == 1 then
						total_height = total_height + text_height
						position[2] = position[2] - text_height
					end

					local text_color = text_style.text_color
					text_color[1] = alpha

					UIPasses.text.draw(ui_renderer, text_pass_data, ui_scenegraph, pass_definition, text_style, content, position, text_size, input_service, dt, ui_style_global)

					if i == 2 then
						position[2] = position[2] - text_height
					end
				end
			end

			position[1] = position_x

			for index, attacks_data in ipairs(weapon_stats_data) do
				for attack_index, attack_data in ipairs(attacks_data) do
					local title = attack_data.title or "n/a"
					local value = attack_data.value or 0
					local key = attack_data.key

					if attack_index == 1 then
						position[1] = position_x + frame_margin/2
						local text_id = "stat_title"
						local text_style = style[text_id]
						local text_size = data.text_size
						text_size[1] = size[1] - frame_margin
						text_size[2] = star_height
						local text_pass_data = data.text_pass_data
						text_pass_data.text_id = text_id
						content[text_id] = title
						local text_height = get_text_height(ui_renderer, text_size, text_style, content, title, ui_style_global)

						if draw then
							local text_color = text_style.text_color
							text_color[1] = alpha

							UIPasses.text.draw(ui_renderer, text_pass_data, ui_scenegraph, pass_definition, text_style, content, position, text_size, input_service, dt, ui_style_global)
						end
					end

					if attack_index == 1 then
						position[1] = position_x + frame_margin
					else
						position[1] = (position_x + size[1]) - star_total_length - star_width - frame_margin/4
					end

					local steps = math.round(value*10)
					local left_half_draw_count = 0
					local right_half_draw_count = 0

					for i = 1, steps, 1 do
						if i%2 == 1 then
							left_half_draw_count = left_half_draw_count + 1
						else
							right_half_draw_count = right_half_draw_count + 1
						end
					end

					local texture_style = style.attack_stars

					if draw then
						for i = 1, 2, 1 do
							local content_id = nil
							local draw_count = 0

							if i == 1 then
								content_id = "left_star"
								draw_count = left_half_draw_count
							else
								content_id = "right_star"
								draw_count = right_half_draw_count
							end

							local texture_size = texture_style.texture_size
							local axis = texture_style.axis
							local spacing = texture_style.spacing
							local direction = texture_style.direction
							local texture_colors = texture_style.texture_colors
							local color = texture_style.color
							color[1] = alpha

							if texture_colors then
								for i = 1, #texture_colors, 1 do
									texture_colors[i][1] = alpha
								end
							end

							UIRenderer.draw_multi_texture(ui_renderer, content[content_id], position, texture_size, nil, nil, nil, axis, spacing, direction, draw_count, texture_colors, color, nil, nil, nil)

							if i == 1 then
								local slot_color = texture_style.slot_color
								slot_color[1] = alpha
								position[3] = position[3] - 1

								UIRenderer.draw_multi_texture(ui_renderer, content.slot_star, position, texture_size, nil, nil, nil, axis, spacing, direction, 5, nil, slot_color, nil, nil, nil)

								position[3] = position[3] + 1
							end
						end
					end
				end

				total_height = total_height + star_height
				position[2] = position[2] - star_height
			end

			position[2] = position[2] + total_height + star_height
			position[1] = position_x
			position[2] = position_y
			position[3] = position_z

			return total_height
		end
	},
	keywords = {
		setup_data = function ()
			local data = {
				frame_name = "item_tooltip_frame_01",
				background_color = {
					240,
					3,
					3,
					3
				},
				text_pass_data = {},
				text_size = {},
				entry_texture_size = {
					20,
					20
				},
				entry_texture_pass_data = {},
				entry_texture_pass_definition = {
					texture_id = "entry_texture",
					style_id = "entry_texture"
				},
				content = {
					entry_texture = "stats_icon_yes"
				},
				style = {
					text = {
						vertical_alignment = "center",
						font_size = 24,
						horizontal_alignment = "left",
						word_wrap = true,
						font_type = "hell_shark",
						text_color = Colors.get_color_table_with_alpha("font_default", 255)
					},
					entry_texture = {
						offset = {
							0,
							0,
							0
						},
						color = {
							255,
							255,
							255,
							255
						}
					}
				}
			}

			return data
		end,
		draw = function (draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
			local alpha_multiplier = pass_definition.alpha_multiplier
			local alpha = alpha_multiplier*255
			local start_layer = pass_definition.start_layer or DEFAULT_START_LAYER
			local bottom_spacing = 20
			local frame_margin = data.frame_margin or 0
			local backend_id = item.backend_id
			local item_data = item.data
			local slot_type = item_data.slot_type
			local is_weapon = slot_type == "melee" or slot_type == "ranged"

			if not is_weapon then
				return 0
			end

			local item_template = BackendUtils.get_item_template(item_data, backend_id)
			local keywords = item_template.tooltip_keywords
			local style = data.style
			local content = data.content
			local position_x = position[1]
			local position_y = position[2]
			local position_z = position[3]
			local total_height = 0
			local entry_texture_size = data.entry_texture_size
			position[3] = start_layer + 2
			position[2] = position[2] + 100 + bottom_spacing
			position[1] = position[1] + frame_margin + 100 + entry_texture_size[1]
			local loop_func = ipairs
			local text_size = data.text_size
			text_size[1] = size[1] - (frame_margin*2 + 100) - entry_texture_size[1]

			if keywords then
				for index, keyword in loop_func(keywords) do
					local text_id = "keyword_title_" .. index
					local text_style = style.text
					local text_pass_data = data.text_pass_data
					text_pass_data.text_id = text_id
					local text = Localize(keyword)
					local text_size = data.text_size
					text_size[2] = 0
					local text_height = get_text_height(ui_renderer, text_size, text_style, content, text, ui_style_global)
					text_size[2] = text_height
					position[2] = position[2] - text_height
					local old_y_position = position[2]
					content[text_id] = text

					if draw then
						local entry_texture_size = data.entry_texture_size
						local entry_texture_style = data.style.entry_texture
						local entry_texture_pass_data = data.entry_texture_pass_data
						local entry_texture_pass_definition = data.entry_texture_pass_definition
						position[1] = position[1] - entry_texture_size[1]
						position[2] = (position[2] + text_height/2) - entry_texture_size[2]/2
						local color = entry_texture_style.color
						color[1] = alpha

						UIPasses.texture.draw(ui_renderer, entry_texture_pass_data, ui_scenegraph, entry_texture_pass_definition, entry_texture_style, content, position, entry_texture_size, input_service, dt)

						position[1] = position[1] + entry_texture_size[1]
						position[2] = old_y_position
						local text_color = text_style.text_color
						text_color[1] = alpha

						UIPasses.text.draw(ui_renderer, text_pass_data, ui_scenegraph, pass_definition, text_style, content, position, data.text_size, input_service, dt, ui_style_global)
					end

					total_height = total_height + text_height
					position[2] = old_y_position
				end
			end

			position[1] = position_x
			position[2] = position_y
			position[3] = position_z

			return 0
		end
	},
	properties = {
		setup_data = function ()
			local data = {
				frame_name = "item_tooltip_frame_01",
				background_color = {
					240,
					3,
					3,
					3
				},
				title_text_pass_data = {
					text_id = "title"
				},
				text_pass_data = {},
				text_size = {
					0,
					0
				},
				icon_pass_data = {},
				icon_pass_definition = {
					texture_id = "icon",
					style_id = "icon"
				},
				icon_size = {
					13,
					13
				},
				content = {
					icon = "tooltip_marker",
					title = "Properties:"
				},
				style = {
					property_title = {
						vertical_alignment = "center",
						font_size = 18,
						horizontal_alignment = "left",
						word_wrap = true,
						font_type = "hell_shark",
						text_color = Colors.get_color_table_with_alpha("font_default", 255)
					},
					property_text = {
						vertical_alignment = "center",
						horizontal_alignment = "left",
						word_wrap = true,
						font_type = "hell_shark",
						font_size = 16,
						text_color = Colors.get_color_table_with_alpha("corn_flower_blue", 255),
						color_override = {},
						color_override_table = {
							start_index = 0,
							end_index = 0,
							color = Colors.get_color_table_with_alpha("font_default", 255)
						}
					},
					property_advanced_description = {
						vertical_alignment = "top",
						font_size = 16,
						horizontal_alignment = "left",
						word_wrap = true,
						font_type = "hell_shark",
						text_color = Colors.get_color_table_with_alpha("font_default", 255)
					},
					icon = {
						color = {
							255,
							255,
							255,
							255
						},
						offset = {
							0,
							0,
							2
						}
					}
				}
			}

			return data
		end,
		draw = function (draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
			local alpha_multiplier = pass_definition.alpha_multiplier
			local alpha = alpha_multiplier*255
			local start_layer = pass_definition.start_layer or DEFAULT_START_LAYER
			local bottom_spacing = 20
			local frame_margin = data.frame_margin or 0
			local properties = item.properties
			local style = data.style
			local content = data.content
			local position_x = position[1]
			local position_y = position[2]
			local position_z = position[3]
			local total_height = 0
			position[3] = start_layer + 2
			position[2] = position[2]
			local loop_func = pairs
			local show_advanced_description = input_service.get(input_service, "debug_pixeldistance_1")

			if properties then
				position[1] = position[1] + frame_margin
				local text_style = style.property_title
				local title_text_pass_data = data.title_text_pass_data
				local title_text = content.title
				local text_size = data.text_size
				text_size[1] = size[1] - (frame_margin*2 + frame_margin)
				text_size[2] = 0
				local title_text_height = get_text_height(ui_renderer, text_size, text_style, content, title_text, ui_style_global)
				text_size[2] = title_text_height
				position[2] = position[2] - title_text_height
				total_height = total_height + title_text_height

				if draw then
					local text_color = text_style.text_color
					text_color[1] = alpha

					UIPasses.text.draw(ui_renderer, title_text_pass_data, ui_scenegraph, pass_definition, text_style, content, position, text_size, input_service, dt, ui_style_global)
				end

				local index = 1

				for property_key, property_value in loop_func(properties) do
					local property_data = WeaponProperties.properties[property_key]
					local buff_name = property_data.buff_name
					local buff_template = BuffTemplates[buff_name]
					local buff_data = buff_template.buffs[1]
					local has_multiplier = buff_data.variable_multiplier ~= nil
					local text_id = "property_title_" .. index
					local text_style = style.property_text
					local text_pass_data = data.text_pass_data
					text_pass_data.text_id = text_id
					local property_name = property_data.display_name
					local property_advanced_description = property_data.advanced_description
					local text, advanced_description = UIUtils.get_property_description(property_key, property_value)

					if show_advanced_description then
						local additional_text_length = (advanced_description and UTF8Utils.string_length(advanced_description)) or 0
						local default_text_length = (text and UTF8Utils.string_length(text)) or 0
						text = text .. advanced_description
						local color_override_table = text_style.color_override_table
						color_override_table.start_index = default_text_length + 1
						color_override_table.end_index = default_text_length + additional_text_length
						text_style.color_override[1] = color_override_table
					else
						text_style.color_override[1] = nil
					end

					local text_size = data.text_size
					text_size[2] = 0
					local text_height = get_text_height(ui_renderer, text_size, text_style, content, text, ui_style_global)
					text_size[2] = text_height
					position[2] = position[2] - text_height
					local old_y_position = position[2]
					content[text_id] = text

					if draw then
						local icon_pass_definition = data.icon_pass_definition
						local icon_pass_data = data.icon_pass_data
						local icon_style = style.icon
						local icon_size = data.icon_size
						local icon_color = icon_style.color
						icon_color[1] = alpha
						position[2] = (position[2] + text_height/2) - icon_size[2]/2 - 2

						UIPasses.texture.draw(ui_renderer, icon_pass_data, ui_scenegraph, icon_pass_definition, icon_style, content, position, icon_size, input_service, dt)

						position[2] = old_y_position
						position[1] = position[1] + icon_size[1]
						local text_color = text_style.text_color
						text_color[1] = alpha

						UIPasses.text.draw(ui_renderer, text_pass_data, ui_scenegraph, pass_definition, text_style, content, position, data.text_size, input_service, dt, ui_style_global)

						position[1] = position[1] - icon_size[1]
					end

					total_height = total_height + text_height
					position[2] = old_y_position
				end

				index = index + 1
				total_height = total_height + bottom_spacing
			end

			position[1] = position_x
			position[2] = position_y
			position[3] = position_z

			return total_height
		end
	},
	traits = {
		setup_data = function ()
			local frame_name = "item_tooltip_frame_01"
			local frame_settings = UIFrameSettings[frame_name]
			local data = {
				default_icon = "icons_placeholder",
				frame_name = frame_name,
				background_color = {
					240,
					3,
					3,
					3
				},
				text_pass_data = {},
				text_size = {
					0,
					0
				},
				icon_pass_data = {},
				icon_pass_definition = {
					texture_id = "icon",
					style_id = "icon"
				},
				icon_size = {
					30,
					30
				},
				frame_pass_data = {},
				frame_pass_definition = {
					texture_id = "frame",
					style_id = "frame"
				},
				frame_size = {
					0,
					0
				},
				content = {
					frame = frame_settings.texture
				},
				style = {
					trait_title = {
						vertical_alignment = "center",
						font_size = 16,
						horizontal_alignment = "left",
						word_wrap = true,
						font_type = "hell_shark",
						text_color = Colors.get_color_table_with_alpha("font_default", 255),
						line_colors = {
							Colors.get_color_table_with_alpha("font_title", 255),
							Colors.get_color_table_with_alpha("font_default", 255)
						}
					},
					trait_advanced_description = {
						vertical_alignment = "top",
						font_size = 16,
						horizontal_alignment = "left",
						word_wrap = true,
						font_type = "hell_shark",
						text_color = Colors.get_color_table_with_alpha("font_default", 255)
					},
					frame = {
						texture_size = frame_settings.texture_size,
						texture_sizes = frame_settings.texture_sizes,
						color = {
							255,
							255,
							255,
							255
						},
						offset = {
							0,
							0,
							1
						}
					},
					icon = {
						color = {
							255,
							255,
							255,
							255
						},
						offset = {
							0,
							0,
							2
						}
					},
					background = {
						color = {
							255,
							10,
							10,
							10
						},
						offset = {
							0,
							0,
							-1
						}
					}
				}
			}

			return data
		end,
		draw = function (draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
			local alpha_multiplier = pass_definition.alpha_multiplier
			local alpha = alpha_multiplier*255
			local start_layer = pass_definition.start_layer or DEFAULT_START_LAYER
			local bottom_spacing = 20
			local frame_margin = data.frame_margin or 0
			local traits = item.traits
			local total_height = 0

			if traits then
				local style = data.style
				local content = data.content
				local position_x = position[1]
				local position_y = position[2]
				local position_z = position[3]
				local width_reduction = 40
				position[1] = position[1] + frame_margin
				position[2] = position[2]
				position[3] = start_layer + 2
				local trait_spacing = 10
				local loop_func = (draw_downwards and ipairs) or ripairs

				for index, trait_key in loop_func(traits) do
					local trait_total_height = 0
					local trait_data = WeaponTraits.traits[trait_key]
					local text_id = "trait_title_" .. index
					local text_style = style.trait_title
					local text_pass_data = data.text_pass_data
					text_pass_data.text_id = text_id
					local trait_name = trait_data.display_name
					local trait_advanced_description = trait_data.advanced_description
					local title_text = Localize(trait_name)
					local description_text = ""

					if trait_advanced_description then
						description_text = UIUtils.get_trait_description(trait_key)
					end

					local text = title_text .. "\n" .. description_text
					local text_size = data.text_size
					text_size[1] = size[1] - width_reduction - (frame_margin*2 + frame_margin)
					text_size[2] = 0
					local text_height = get_text_height(ui_renderer, text_size, text_style, content, text, ui_style_global)
					text_size[2] = text_height
					position[1] = (position_x + size[1]/2) - text_size[1]/2
					local frame_size = data.frame_size
					local frame_pass_data = data.frame_pass_data
					local frame_pass_definition = data.frame_pass_definition
					local frame_content = data.content
					local frame_style = data.style.frame
					frame_size[1] = text_size[1] + frame_margin*2
					frame_size[2] = text_size[2] + frame_margin
					trait_total_height = trait_total_height + frame_size[2]
					position[2] = position[2] - frame_size[2]
					local old_y_position = position[2]
					position[1] = position[1] - frame_margin

					if draw then
						local frame_color = frame_style.color
						frame_color[1] = alpha

						UIPasses.texture_frame.draw(ui_renderer, frame_pass_data, ui_scenegraph, frame_pass_definition, frame_style, frame_content, position, frame_size, input_service, dt, ui_style_global)

						local background_style = data.style.background
						local background_color = background_style.color
						background_color[1] = alpha
						position[3] = position[3] - 1

						UIRenderer.draw_rect(ui_renderer, position, frame_size, background_color)

						position[3] = position[3] + 1
					end

					local icon_pass_definition = data.icon_pass_definition
					local icon_pass_data = data.icon_pass_data
					local icon_style = data.style.icon
					local icon_size = data.icon_size
					content.icon = data.default_icon
					local icon_height_difference = icon_size[2] + frame_style.texture_sizes.corner[2]
					local icon_width_difference = frame_size[1] - (icon_size[1] + frame_style.texture_sizes.corner[2])
					position[1] = position[1] + icon_width_difference
					position[2] = position[2] + frame_size[2] - icon_height_difference
					position[1] = position[1] - icon_width_difference + frame_margin
					position[2] = old_y_position + frame_margin/2
					content[text_id] = text

					if draw then
						local text_color = text_style.text_color
						local line_colors = text_style.line_colors
						text_color[1] = alpha
						line_colors[1][1] = alpha
						line_colors[2][1] = alpha

						UIPasses.text.draw(ui_renderer, text_pass_data, ui_scenegraph, pass_definition, text_style, content, position, data.text_size, input_service, dt, ui_style_global)
					end

					position[2] = old_y_position
					total_height = total_height + trait_total_height

					if index ~= #traits then
						total_height = total_height + trait_spacing
						position[2] = position[2] - trait_spacing
					end
				end

				position[1] = position_x
				position[2] = position_y
				position[3] = position_z
				total_height = total_height + bottom_spacing
			end

			return total_height
		end
	},
	advanced_input_helper = {
		setup_data = function ()
			local frame_name = "item_tooltip_frame_01"
			local frame_settings = UIFrameSettings[frame_name]
			local data = {
				frame_name = "item_tooltip_frame_01",
				background_color = {
					240,
					3,
					3,
					3
				},
				text_pass_data = {
					text_id = "text"
				},
				text_size = {},
				frame_pass_data = {},
				frame_pass_definition = {
					texture_id = "frame",
					style_id = "frame"
				},
				frame_size = {
					0,
					0
				},
				content = {
					text = Localize("item_advanced_information_tooltip_input"),
					frame = frame_settings.texture
				},
				style = {
					frame = {
						texture_size = frame_settings.texture_size,
						texture_sizes = frame_settings.texture_sizes,
						color = {
							255,
							255,
							255,
							255
						},
						offset = {
							0,
							0,
							1
						}
					},
					text = {
						vertical_alignment = "center",
						font_size = 16,
						horizontal_alignment = "center",
						word_wrap = true,
						font_type = "hell_shark",
						text_color = Colors.get_color_table_with_alpha("font_title", 255)
					},
					background = {
						color = {
							255,
							10,
							10,
							10
						},
						offset = {
							0,
							0,
							-1
						}
					}
				}
			}

			return data
		end,
		draw = function (draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
			local alpha_multiplier = pass_definition.alpha_multiplier
			local alpha = alpha_multiplier*255
			local start_layer = pass_definition.start_layer or DEFAULT_START_LAYER
			local frame_margin = data.frame_margin or 0
			local properties = item.properties
			local style = data.style
			local content = data.content
			local position_x = position[1]
			local position_y = position[2]
			local position_z = position[3]
			local total_height = 0
			position[3] = start_layer - 6
			local show_advanced_description = input_service.get(input_service, "debug_pixeldistance_1")

			if properties and next(properties) and not show_advanced_description then
				local text_style = style.text
				local text_pass_data = data.text_pass_data
				local text = content.text
				local text_size = data.text_size
				text_size[1] = size[1] - frame_margin*2
				text_size[2] = 0
				local text_height = get_text_height(ui_renderer, text_size, text_style, content, text, ui_style_global)
				total_height = total_height + text_height
				text_size[2] = text_height
				local frame_size = data.frame_size
				local frame_pass_data = data.frame_pass_data
				local frame_pass_definition = data.frame_pass_definition
				local frame_content = data.content
				local frame_style = data.style.frame
				frame_size[1] = text_size[1]
				frame_size[2] = text_size[2] + frame_margin/2
				total_height = total_height + frame_size[2]
				position[2] = position[2] - frame_size[2] - frame_margin/2
				position[1] = position[1] + frame_margin
				local old_y_position = position[2]

				if draw then
					local frame_color = frame_style.color
					frame_color[1] = alpha

					UIPasses.texture_frame.draw(ui_renderer, frame_pass_data, ui_scenegraph, frame_pass_definition, frame_style, frame_content, position, frame_size, input_service, dt, ui_style_global)

					local background_style = data.style.background
					local background_color = background_style.color
					background_color[1] = alpha
					position[3] = position[3] - 1

					UIRenderer.draw_rect(ui_renderer, position, frame_size, background_color)

					position[3] = position[3] + 1
				end

				position[2] = old_y_position + frame_margin/4
				text_size[1] = frame_size[1]

				if draw then
					local text_color = text_style.text_color
					text_color[1] = alpha

					UIPasses.text.draw(ui_renderer, text_pass_data, ui_scenegraph, pass_definition, text_style, content, position, text_size, input_service, dt, ui_style_global)
				end
			end

			position[1] = position_x
			position[2] = position_y
			position[3] = position_z

			return 0
		end
	},
	equipped_item_title = {
		setup_data = function ()
			local frame_name = "item_tooltip_frame_01"
			local frame_settings = UIFrameSettings[frame_name]
			local data = {
				frame_name = "item_tooltip_frame_01",
				background_color = {
					240,
					3,
					3,
					3
				},
				text_pass_data = {
					text_id = "text"
				},
				text_size = {},
				frame_pass_data = {},
				frame_pass_definition = {
					texture_id = "frame",
					style_id = "frame"
				},
				frame_size = {
					0,
					0
				},
				content = {
					text = Localize("equipped_item"),
					frame = frame_settings.texture
				},
				style = {
					frame = {
						texture_size = frame_settings.texture_size,
						texture_sizes = frame_settings.texture_sizes,
						color = {
							255,
							255,
							255,
							255
						},
						offset = {
							0,
							0,
							1
						}
					},
					text = {
						vertical_alignment = "center",
						upper_case = true,
						word_wrap = true,
						horizontal_alignment = "center",
						font_size = 20,
						font_type = "hell_shark",
						text_color = Colors.get_color_table_with_alpha("green", 255)
					},
					background = {
						color = {
							255,
							10,
							10,
							10
						},
						offset = {
							0,
							0,
							-1
						}
					}
				}
			}

			return data
		end,
		draw = function (draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
			local backend_id = item.backend_id
			local slot_type = item.slot_type

			if slot_type then
				local slot_names = InventorySettings.slot_names_by_type[slot_type]

				if slot_names then
					local slot_name = slot_names[1]
					local local_player = Managers.player:local_player()

					if local_player then
						local hero_name = local_player.profile_display_name(local_player)
						local career_name = local_player.career_name(local_player)
						local equipped_item = BackendUtils.get_loadout_item(career_name, slot_name)

						if not equipped_item or equipped_item.backend_id ~= backend_id then
							return 0
						end
					else
						return 0
					end
				else
					return 0
				end
			else
				return 0
			end

			local alpha_multiplier = pass_definition.alpha_multiplier
			local alpha = alpha_multiplier*255
			local start_layer = pass_definition.start_layer or DEFAULT_START_LAYER
			local frame_margin = data.frame_margin or 0
			local style = data.style
			local content = data.content
			local position_x = position[1]
			local position_y = position[2]
			local position_z = position[3]
			local total_height = 0
			position[3] = start_layer - 6
			local text_style = style.text
			local text_pass_data = data.text_pass_data
			local text = content.text
			local text_size = data.text_size
			text_size[1] = size[1] - frame_margin*2
			text_size[2] = 0
			local text_height = get_text_height(ui_renderer, text_size, text_style, content, text, ui_style_global)
			text_size[2] = text_height
			local frame_size = data.frame_size
			local frame_pass_data = data.frame_pass_data
			local frame_pass_definition = data.frame_pass_definition
			local frame_content = data.content
			local frame_style = data.style.frame
			frame_size[1] = text_size[1]
			frame_size[2] = text_size[2] + frame_margin/2
			total_height = frame_size[2]
			position[2] = position[2] + frame_margin/2
			position[1] = position[1] + frame_margin
			local old_y_position = position[2]

			if draw then
				local frame_color = frame_style.color
				frame_color[1] = alpha

				UIPasses.texture_frame.draw(ui_renderer, frame_pass_data, ui_scenegraph, frame_pass_definition, frame_style, frame_content, position, frame_size, input_service, dt, ui_style_global)

				local background_style = data.style.background
				local background_color = background_style.color
				background_color[1] = alpha
				position[3] = position[3] - 1

				UIRenderer.draw_rect(ui_renderer, position, frame_size, background_color)

				position[3] = position[3] + 1
			end

			position[2] = old_y_position + frame_margin/3
			text_size[1] = frame_size[1]

			if draw then
				local text_color = text_style.text_color
				text_color[1] = alpha

				UIPasses.text.draw(ui_renderer, text_pass_data, ui_scenegraph, pass_definition, text_style, content, position, text_size, input_service, dt, ui_style_global)
			end

			position[1] = position_x
			position[2] = position_y
			position[3] = position_z

			return 0
		end
	},
	fatigue = {
		setup_data = function ()
			local data = {
				background_color = {
					240,
					3,
					3,
					3
				},
				title_text_pass_data = {
					text_id = "title"
				},
				title_text_size = {
					0,
					0
				},
				text_pass_data = {
					text_id = "text"
				},
				text_size = {
					0,
					0
				},
				icon_pass_data = {},
				icon_pass_definition = {
					texture_id = "icon",
					style_id = "icon"
				},
				block_arc_pass_data = {},
				block_arc_pass_definition = {
					texture_id = "block_arc",
					style_id = "block_arc"
				},
				icon_size = {
					10,
					14
				},
				block_arc_size = {
					30,
					30
				},
				content = {
					text = "",
					icon = "tooltip_block_arch_icon",
					title = Localize("tooltips_stamina"),
					block_arc = {
						block_arc = "block_arch_symbol",
						uvs = {
							{
								1,
								0
							},
							{
								0,
								1
							}
						}
					}
				},
				style = {
					icon = {
						color = {
							255,
							255,
							255,
							255
						},
						offset = {
							0,
							0,
							2
						}
					},
					block_arc = {
						color = {
							255,
							255,
							255,
							255
						},
						background_color = {
							255,
							20,
							20,
							20
						},
						offset = {
							0,
							0,
							2
						}
					},
					title = {
						vertical_alignment = "center",
						font_size = 18,
						horizontal_alignment = "right",
						word_wrap = true,
						font_type = "hell_shark",
						text_color = Colors.get_color_table_with_alpha("font_default", 255)
					},
					text = {
						vertical_alignment = "center",
						font_size = 28,
						horizontal_alignment = "right",
						word_wrap = true,
						font_type = "hell_shark_header",
						text_color = Colors.get_color_table_with_alpha("white", 255)
					}
				}
			}

			return data
		end,
		draw = function (draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
			local alpha_multiplier = pass_definition.alpha_multiplier
			local alpha = alpha_multiplier*255
			local start_layer = pass_definition.start_layer or DEFAULT_START_LAYER
			local frame_margin = data.frame_margin or 0
			local item_data = item.data
			local slot_type = item_data.slot_type

			if slot_type ~= ItemType.MELEE or not draw then
				return 0
			end

			local content = data.content
			local style = data.style
			local position_x = position[1]
			local position_y = position[2]
			local position_z = position[3]
			local backend_id = item.backend_id
			local item_template = BackendUtils.get_item_template(item_data, backend_id)
			local max_fatigue_points = item_template.max_fatigue_points
			content.text = tostring(max_fatigue_points/2)
			position[3] = start_layer + 2
			position[1] = position_x + frame_margin
			local title_text_style = style.title
			local title_text_pass_data = data.title_text_pass_data
			local title_text = content.title
			local title_text_size = data.title_text_size
			title_text_size[1] = size[1] - frame_margin*2
			title_text_size[2] = 0
			local title_text_height = get_text_height(ui_renderer, title_text_size, title_text_style, content, title_text, ui_style_global)
			title_text_size[2] = title_text_height
			position[2] = position[2] - title_text_height
			title_text_style.text_color[1] = alpha

			UIPasses.text.draw(ui_renderer, title_text_pass_data, ui_scenegraph, pass_definition, title_text_style, content, position, title_text_size, input_service, dt, ui_style_global)

			local text_style = style.text
			local text_pass_data = data.text_pass_data
			local text = content.text
			local text_size = data.text_size
			text_size[1] = size[1] - frame_margin*2
			text_size[2] = 0
			local text_height = get_text_height(ui_renderer, text_size, text_style, content, text, ui_style_global)
			local font, size_of_font = UIFontByResolution(text_style)
			local font_material = font[1]
			local font_size = font[2]
			local font_name = font[3]
			local text_width, _, _ = UIRenderer.text_size(ui_renderer, content.text, font_material, font_size, font_name)
			text_size[2] = text_height
			position[2] = position[2] - text_height

			if draw then
				local text_color = text_style.text_color
				text_color[1] = alpha

				UIPasses.text.draw(ui_renderer, text_pass_data, ui_scenegraph, pass_definition, text_style, content, position, text_size, input_service, dt, ui_style_global)
			end

			position[2] = position_y - title_text_height
			local block_angle = item_template.block_angle
			local block_fraction = block_angle/360/2
			local block_arc_pass_definition = data.block_arc_pass_definition
			local block_arc_pass_data = data.block_arc_pass_data
			local block_arc_size = data.block_arc_size
			local block_arc_style = style.block_arc
			local block_arc_color = style.block_arc.color
			local background_color = block_arc_style.background_color
			block_arc_color[1] = block_fraction*255*alpha_multiplier
			position[1] = (position_x + size[1] - block_arc_size[1]) - frame_margin*2 - text_width
			position[2] = position[2] - block_arc_size[2]

			if draw then
				background_color[1] = alpha

				UIRenderer.draw_rounded_rect(ui_renderer, position, block_arc_size, block_arc_size[1]/2, background_color)
			end

			position[3] = position[3] + 1

			UIPasses.texture.draw(ui_renderer, block_arc_pass_data, ui_scenegraph, block_arc_pass_definition, block_arc_style, content.block_arc, position, block_arc_size, input_service, dt)
			UIPasses.texture_uv.draw(ui_renderer, block_arc_pass_data, ui_scenegraph, block_arc_pass_definition, block_arc_style, content.block_arc, position, block_arc_size, input_service, dt)

			position[3] = position[3] + 1
			local icon_style = style.icon
			local icon_size = data.icon_size
			local icon_pass_data = data.icon_pass_data
			local icon_pass_definition = data.icon_pass_definition
			local icon_color = icon_style.color
			icon_color[1] = alpha
			position[1] = (position[1] + block_arc_size[1]/2) - icon_size[1]/2
			position[2] = (position[2] + block_arc_size[2]/2) - icon_size[2]/2

			if draw then
				UIPasses.texture.draw(ui_renderer, icon_pass_data, ui_scenegraph, icon_pass_definition, icon_style, content, position, icon_size, input_service, dt)
			end

			position[1] = position_x
			position[2] = position_y
			position[3] = position_z

			return 0
		end
	},
	ammunition = {
		setup_data = function ()
			local data = {
				background_color = {
					240,
					3,
					3,
					3
				},
				title_text_pass_data = {
					text_id = "title"
				},
				title_text_size = {
					0,
					0
				},
				text_pass_data = {
					text_id = "text"
				},
				text_size = {
					0,
					0
				},
				icon_pass_data = {},
				icon_pass_definition = {
					texture_id = "icon",
					style_id = "icon"
				},
				icon_size = {
					44,
					44
				},
				content = {
					text = "",
					title = "Ammunition",
					icon = "tooltip_icon_overheat"
				},
				style = {
					icon = {
						color = {
							255,
							255,
							255,
							255
						},
						offset = {
							0,
							0,
							2
						}
					},
					title = {
						vertical_alignment = "center",
						font_size = 16,
						horizontal_alignment = "right",
						word_wrap = true,
						font_type = "hell_shark",
						text_color = Colors.get_color_table_with_alpha("font_default", 255)
					},
					text = {
						vertical_alignment = "center",
						font_size = 28,
						horizontal_alignment = "right",
						word_wrap = true,
						font_type = "hell_shark_header",
						text_color = Colors.get_color_table_with_alpha("white", 255)
					}
				}
			}

			return data
		end,
		draw = function (draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
			local alpha_multiplier = pass_definition.alpha_multiplier
			local alpha = alpha_multiplier*255
			local start_layer = pass_definition.start_layer or DEFAULT_START_LAYER
			local frame_margin = data.frame_margin or 0
			local item_data = item.data
			local slot_type = item_data.slot_type

			if slot_type ~= ItemType.RANGED or not draw then
				return 0
			end

			local content = data.content
			local style = data.style
			local position_x = position[1]
			local position_y = position[2]
			local position_z = position[3]
			local backend_id = item.backend_id
			local item_template = BackendUtils.get_item_template(item_data, backend_id)
			local ammo_data = item_template.ammo_data

			if ammo_data then
				local single_clip = ammo_data.single_clip
				local reload_time = ammo_data.reload_time
				local max_ammo = ammo_data.max_ammo
				local ammo_per_clip = ammo_data.ammo_per_clip
				local ammo_text = nil

				if single_clip then
					ammo_text = tostring(max_ammo) .. "/0"
				else
					ammo_text = tostring(ammo_per_clip) .. "/" .. tostring(max_ammo - ammo_per_clip)
				end

				content.text = ammo_text
			else
				content.text = ""
			end

			local content = data.content
			local style = data.style
			position[3] = start_layer + 2
			position[1] = position_x + frame_margin
			local title_text_style = style.title
			local title_text_pass_data = data.title_text_pass_data
			local title_text = content.title
			local title_text_size = data.title_text_size
			title_text_size[1] = size[1] - frame_margin*2
			title_text_size[2] = 0
			local title_text_height = get_text_height(ui_renderer, title_text_size, title_text_style, content, title_text, ui_style_global)
			title_text_size[2] = title_text_height
			position[2] = position[2] - title_text_height
			title_text_style.text_color[1] = alpha

			UIPasses.text.draw(ui_renderer, title_text_pass_data, ui_scenegraph, pass_definition, title_text_style, content, position, title_text_size, input_service, dt, ui_style_global)

			if ammo_data then
				local text_style = style.text
				local text_pass_data = data.text_pass_data
				local text = content.text
				local text_size = data.text_size
				text_size[1] = size[1] - frame_margin*2
				text_size[2] = 0
				local text_height = get_text_height(ui_renderer, text_size, text_style, content, text, ui_style_global)
				text_size[2] = text_height
				position[2] = position[2] - text_height

				if draw then
					text_style.text_color[1] = alpha

					UIPasses.text.draw(ui_renderer, text_pass_data, ui_scenegraph, pass_definition, text_style, content, position, text_size, input_service, dt, ui_style_global)
				end

				position[2] = position_y - title_text_height
			else
				local icon_style = style.icon
				local icon_size = data.icon_size
				local icon_pass_data = data.icon_pass_data
				local icon_pass_definition = data.icon_pass_definition
				position[1] = (position_x + size[1] - icon_size[1]) - frame_margin
				position[2] = position[2] - icon_size[2]
				icon_style.color[1] = alpha

				UIPasses.texture.draw(ui_renderer, icon_pass_data, ui_scenegraph, icon_pass_definition, icon_style, content, position, icon_size, input_service, dt)
			end

			position[1] = position_x
			position[2] = position_y
			position[3] = position_z

			return 0
		end
	},
	item_power_level = {
		setup_data = function ()
			local text_styles = {
				{
					vertical_alignment = "center",
					name = "title",
					localize = false,
					word_wrap = true,
					font_size = 18,
					horizontal_alignment = "left",
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("font_default", 255)
				},
				{
					vertical_alignment = "center",
					name = "power",
					localize = false,
					word_wrap = true,
					font_size = 52,
					horizontal_alignment = "left",
					font_type = "hell_shark_header",
					text_color = Colors.get_color_table_with_alpha("white", 255)
				}
			}
			local data = {
				text_styles = text_styles,
				text_content = {},
				text_pass_data = {},
				text_pass_size = {}
			}

			return data
		end,
		draw = function (draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
			local alpha_multiplier = pass_definition.alpha_multiplier
			local alpha = alpha_multiplier*255
			local start_layer = pass_definition.start_layer or DEFAULT_START_LAYER
			local bottom_spacing = 20
			local frame_margin = data.frame_margin or 0
			local text_styles = data.text_styles
			local text_content = data.text_content

			table.clear(text_content)

			local power_level = item.power_level

			if not power_level then
				return 0
			end

			local item_data = item.data
			local rarity = item.rarity or item_data.rarity
			local rarity_color = Colors.get_table(rarity)
			text_content.title = Localize("tooltips_power")
			text_content.power = tostring(power_level)
			local loop_func = ipairs
			local position_x = position[1]
			local position_y = position[2]
			local position_z = position[3]
			position[1] = position[1] + frame_margin
			position[3] = start_layer + 2
			local text_pass_data = data.text_pass_data
			local text_size = data.text_pass_size
			text_size[1] = size[1] - frame_margin*2
			text_size[2] = 0
			local total_height = 0

			for index, text_style in loop_func(text_styles) do
				local style_name = text_style.name
				local text = text_content[style_name]

				if text == true then
					text = text_style.text
					text_content[style_name] = text
				end

				if text then
					text_pass_data.text_id = style_name
					text_size[2] = 0
					local text_height = get_text_height(ui_renderer, text_size, text_style, text_content, text, ui_style_global)
					position[2] = position[2] - text_height
					total_height = total_height + text_height

					if draw then
						text_size[2] = text_height
						text_style.text_color[1] = alpha

						UIPasses.text.draw(ui_renderer, text_pass_data, ui_scenegraph, pass_definition, text_style, text_content, position, text_size, input_service, dt, ui_style_global)
					end
				end
			end

			position[1] = position_x
			position[2] = position_y
			position[3] = position_z

			return total_height
		end
	},
	item_titles = {
		setup_data = function ()
			local frame_name = "item_tooltip_frame_01"
			local frame_settings = UIFrameSettings[frame_name]
			local data = {
				frame_name = "item_tooltip_frame_01",
				background_color = {
					240,
					3,
					3,
					3
				},
				text_pass_data = {
					text_id = "text"
				},
				text_size = {},
				frame_pass_data = {},
				frame_pass_definition = {
					texture_id = "frame",
					style_id = "frame"
				},
				background_size = {
					0,
					50
				},
				edge_size = {
					0,
					5
				},
				edge_holder_size = {
					9,
					17
				},
				header_glow_size = {
					0,
					50
				},
				content = {
					edge_texture = "menu_frame_12_divider",
					edge_holder_left = "menu_frame_12_divider_left",
					header_glow_texture = "tooltip_power_level_header_glow",
					edge_holder_right = "menu_frame_12_divider_right",
					frame = frame_settings.texture
				},
				style = {
					edge = {
						texture_size = {
							1,
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
							0,
							1
						}
					},
					edge_holder = {
						color = {
							255,
							255,
							255,
							255
						},
						offset = {
							0,
							0,
							1
						}
					},
					frame = {
						texture_size = frame_settings.texture_size,
						texture_sizes = frame_settings.texture_sizes,
						color = {
							255,
							255,
							255,
							255
						},
						offset = {
							0,
							0,
							1
						}
					},
					title_text = {
						vertical_alignment = "center",
						font_size = 28,
						horizontal_alignment = "center",
						word_wrap = true,
						font_type = "hell_shark_header",
						text_color = Colors.get_color_table_with_alpha("font_title", 255)
					},
					text = {
						vertical_alignment = "center",
						font_size = 18,
						horizontal_alignment = "center",
						word_wrap = true,
						font_type = "hell_shark",
						text_color = Colors.get_color_table_with_alpha("font_default", 255)
					},
					background = {
						color = {
							150,
							0,
							0,
							0
						},
						offset = {
							0,
							0,
							-1
						}
					},
					header = {
						color = {
							255,
							255,
							255,
							255
						},
						offset = {
							0,
							0,
							1
						}
					}
				}
			}

			return data
		end,
		draw = function (draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
			local alpha_multiplier = pass_definition.alpha_multiplier
			local alpha = alpha_multiplier*255
			local start_layer = pass_definition.start_layer or DEFAULT_START_LAYER
			local frame_margin = data.frame_margin or 0
			local item_data = item.data
			local rarity = item.rarity or item_data.rarity
			local rarity_color = Colors.get_table(rarity)
			local style = data.style
			local content = data.content
			local position_x = position[1]
			local position_y = position[2]
			local position_z = position[3]
			local total_height = 0
			local item_type = item_data.item_type
			local text = ""
			local title_text = ""
			local type_text = ""
			local _, display_name, _ = UIUtils.get_ui_information_from_item(item)

			if item_type == ItemType.MELEE then
				title_text = Localize(display_name)
				type_text = Localize(item_type)
				text = title_text .. "\n" .. type_text
			else
				title_text = Localize(display_name)
				type_text = Localize(item_type)
				text = title_text .. "\n" .. type_text
			end

			local text_style = style.text
			local title_text_style = style.title_text
			local text_pass_data = data.text_pass_data
			title_text_style.text_color = rarity_color
			local text_size = data.text_size
			text_size[1] = size[1] - frame_margin*2
			text_size[2] = 0
			local title_text_height = get_text_height(ui_renderer, text_size, title_text_style, content, title_text, ui_style_global)
			local type_text_height = get_text_height(ui_renderer, text_size, text_style, content, type_text, ui_style_global)
			local text_height = title_text_height + type_text_height
			text_size[2] = text_height
			local background_size = data.background_size
			local edge_style = data.style.edge
			background_size[1] = size[1]
			background_size[2] = text_height + frame_margin
			total_height = total_height + background_size[2]

			if draw then
				position[2] = position[2] - background_size[2] + frame_margin/2
				position[1] = (position[1] + size[1]/2) - background_size[1]/2
				local old_x_position = position[1]
				local old_y_position = position[2]
				local edge_size = data.edge_size
				edge_size[1] = size[1]
				local edge_color = edge_style.color
				local edge_texture_size = edge_style.texture_size
				edge_texture_size[1] = size[1]
				local edge_texture = content.edge_texture
				position[3] = start_layer + 4
				edge_color[1] = alpha

				UIRenderer.draw_tiled_texture(ui_renderer, edge_texture, position, edge_size, edge_texture_size, edge_color)

				local edge_holder_style = style.edge_holder
				local edge_holder_size = data.edge_holder_size
				local edge_holder_color = edge_holder_style.color
				local edge_holder_left_texture = content.edge_holder_left
				local edge_holder_right_texture = content.edge_holder_right
				edge_holder_color[1] = alpha
				position[1] = position[1] + 3
				position[2] = position[2] - 6
				position[3] = start_layer + 5

				UIRenderer.draw_texture(ui_renderer, edge_holder_left_texture, position, edge_holder_size, edge_holder_color)

				position[1] = (position[1] + edge_size[1]) - (edge_holder_size[1] + 6)

				UIRenderer.draw_texture(ui_renderer, edge_holder_right_texture, position, edge_holder_size, edge_holder_color)

				position[2] = position[2] + 6
				local background_style = style.background
				local background_color = background_style.color
				background_color[1] = alpha
				position[1] = position_x
				position[3] = start_layer + 2

				UIRenderer.draw_rect(ui_renderer, position, background_size, background_color)

				position[3] = start_layer + 3
				local header_glow_size = data.header_glow_size
				local header_glow_texture = content.header_glow_texture
				rarity_color[1] = alpha

				UIRenderer.draw_texture(ui_renderer, header_glow_texture, position, background_size, rarity_color)

				position[1] = old_x_position
				position[2] = position_y - frame_margin - title_text_height
				position[3] = start_layer + 6
				text_size[1] = background_size[1]
				content.text = title_text
				title_text_style.text_color[1] = alpha

				UIPasses.text.draw(ui_renderer, text_pass_data, ui_scenegraph, pass_definition, title_text_style, content, position, text_size, input_service, dt, ui_style_global)

				position[1] = old_x_position
				position[2] = position_y - frame_margin*1.5 - (title_text_height + type_text_height)
				position[3] = start_layer + 6
				text_size[1] = background_size[1]
				content.text = type_text
				text_style.text_color[1] = alpha

				UIPasses.text.draw(ui_renderer, text_pass_data, ui_scenegraph, pass_definition, text_style, content, position, text_size, input_service, dt, ui_style_global)
			end

			position[1] = position_x
			position[2] = position_y
			position[3] = position_z

			return total_height
		end
	},
	item_text = {
		setup_data = function ()
			local text_styles = {
				{
					vertical_alignment = "bottom",
					name = "stat",
					word_wrap = true,
					horizontal_alignment = "left",
					font_size = 20,
					font_type = "hell_shark",
					prefix_text = "Stamina:",
					text_color = Colors.get_color_table_with_alpha("green", 255)
				},
				{
					vertical_alignment = "bottom",
					name = "properties",
					word_wrap = true,
					horizontal_alignment = "left",
					font_size = 16,
					font_type = "hell_shark",
					prefix_text = "Properties:",
					text_color = Colors.get_color_table_with_alpha("green", 255)
				},
				{
					word_wrap = true,
					name = "tooltip_stat_attack_title_1",
					localize = false,
					font_size = 16,
					horizontal_alignment = "left",
					ignore_line_change = true,
					vertical_alignment = "bottom",
					font_type = "hell_shark",
					text = Localize("item_compare_attack_title_light"),
					text_color = Colors.get_color_table_with_alpha("font_title", 255)
				},
				{
					word_wrap = true,
					name = "tooltip_stat_attack_title_2",
					localize = false,
					font_size = 16,
					horizontal_alignment = "right",
					vertical_alignment = "bottom",
					font_type = "hell_shark",
					text = Localize("item_compare_attack_title_heavy"),
					text_color = Colors.get_color_table_with_alpha("font_title", 255)
				}
			}

			for i = 1, 4, 1 do
				text_styles[#text_styles + 1] = {
					vertical_alignment = "bottom",
					localize = false,
					word_wrap = true,
					font_size = 16,
					horizontal_alignment = "left",
					font_type = "hell_shark",
					name = "tooltip_title_" .. i,
					text_color = Colors.get_color_table_with_alpha("font_title", 255)
				}
				text_styles[#text_styles + 1] = {
					vertical_alignment = "bottom",
					localize = false,
					word_wrap = true,
					font_size = 16,
					horizontal_alignment = "left",
					font_type = "hell_shark",
					name = "tooltip_description_" .. i,
					text_color = Colors.get_color_table_with_alpha("font_default", 255)
				}
				text_styles[#text_styles + 1] = {
					vertical_alignment = "bottom",
					localize = false,
					word_wrap = true,
					font_size = 16,
					horizontal_alignment = "left",
					font_type = "hell_shark",
					name = "tooltip_warning_" .. i,
					text_color = Colors.get_color_table_with_alpha("red", 255)
				}
			end

			local data = {
				text_styles = text_styles,
				text_content = {},
				text_pass_data = {},
				text_pass_size = {}
			}

			return data
		end,
		draw = function (draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
			local alpha_multiplier = pass_definition.alpha_multiplier
			local alpha = alpha_multiplier*255
			local start_layer = pass_definition.start_layer or DEFAULT_START_LAYER
			local frame_margin = data.frame_margin or 0
			local text_styles = data.text_styles
			local text_content = data.text_content

			table.clear(text_content)

			local backend_id = item.backend_id
			local item_data = item.data
			local rarity = item.rarity or item_data.rarity
			local rarity_color = Colors.get_table(rarity)
			local slot_type = item_data.slot_type
			local item_template = slot_type ~= ItemType.LOOT_CHEST and BackendUtils.get_item_template(item_data, backend_id)
			local max_fatigue_points = slot_type == ItemType.MELEE and item_template.max_fatigue_points

			if max_fatigue_points then
				text_content.stat = "+" .. max_fatigue_points .. Localize("tooltip_stamina") or "n/a"
			end

			if item_template and item_template.buffs and item_template.buffs[1] then
				local buff_template = BuffTemplates[item_template.buffs[1].name]

				if buff_template then
					local buff = buff_template.buffs[1]
					local buff_value = buff.bonus

					if buff then
						if buff.multiplier then
							buff_value = buff.multiplier
							text_content.stat = "+" .. buff_value*100 .. "% " .. buff.description
						else
							text_content.stat = "+" .. buff_value .. " " .. buff.description
						end
					end
				end
			end

			loop_func = (draw_downwards and ipairs) or ripairs
			local position_x = position[1]
			local position_y = position[2]
			local position_z = position[3]
			position[1] = position[1] + frame_margin
			position[2] = (draw_downwards and position[2] - size[2] - frame_margin) or position[2] + frame_margin
			position[3] = start_layer + 5
			local text_pass_data = data.text_pass_data
			local text_size = data.text_pass_size
			text_size[1] = size[1] - frame_margin*2
			text_size[2] = size[2]
			local text_total_height = 0

			for index, text_style in loop_func(text_styles) do
				local ignore_line_change = text_style.ignore_line_change
				text_style.vertical_alignment = (draw_downwards and "top") or "bottom"
				local style_name = text_style.name
				local text = text_content[style_name]

				if text == true then
					text = text_style.text
					text_content[style_name] = text
				end

				if text then
					text_pass_data.text_id = style_name
					local text_height = get_text_height(ui_renderer, text_size, text_style, text_content, text, ui_style_global)

					if draw then
						text_style.text_color[1] = alpha

						UIPasses.text.draw(ui_renderer, text_pass_data, ui_scenegraph, pass_definition, text_style, text_content, position, text_size, input_service, dt, ui_style_global)
					end

					if not ignore_line_change then
						if draw_downwards then
							position[2] = position[2] - text_height
						else
							position[2] = position[2] + text_height
						end

						text_total_height = text_total_height + text_height
					end
				end
			end

			position[1] = position_x
			position[2] = position_y
			position[3] = position_z

			return text_total_height
		end
	},
	item_description = {
		setup_data = function ()
			local data = {
				text_pass_data = {
					text_id = "text"
				},
				text_size = {},
				edge_size = {
					0,
					5
				},
				edge_holder_size = {
					9,
					17
				},
				content = {
					edge_holder_right = "menu_frame_12_divider_right",
					edge_texture = "menu_frame_12_divider",
					edge_holder_left = "menu_frame_12_divider_left"
				},
				style = {
					edge = {
						texture_size = {
							1,
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
							0,
							1
						}
					},
					edge_holder = {
						color = {
							255,
							255,
							255,
							255
						},
						offset = {
							0,
							0,
							1
						}
					},
					text = {
						vertical_alignment = "center",
						name = "description",
						localize = false,
						word_wrap = true,
						font_size = 14,
						horizontal_alignment = "left",
						font_type = "hell_shark",
						text_color = Colors.get_color_table_with_alpha("font_button_normal", 255)
					}
				}
			}

			return data
		end,
		draw = function (draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
			local alpha_multiplier = pass_definition.alpha_multiplier
			local alpha = alpha_multiplier*255
			local start_layer = pass_definition.start_layer or DEFAULT_START_LAYER
			local frame_margin = data.frame_margin or 0
			local content = data.content
			local style = data.style
			local text = nil
			local item_data = item.data
			local slot_type = item_data.slot_type
			local _, _, description = UIUtils.get_ui_information_from_item(item)

			if description and slot_type ~= "loot_chest" then
				local localized_description = Localize(description)

				if localized_description ~= "" then
					text = Localize(description)
				end
			else
				text = description
			end

			if not text then
				return 0
			end

			content.text = text
			local position_x = position[1]
			local position_y = position[2]
			local position_z = position[3]
			position[3] = start_layer + 5
			local text_style = style.text
			local text_pass_data = data.text_pass_data
			local text_size = data.text_size
			text_size[1] = size[1] - frame_margin*2
			text_size[2] = 0
			local text_height = get_text_height(ui_renderer, text_size, text_style, content, text, ui_style_global)
			text_size[2] = text_height

			if draw then
				local edge_size = data.edge_size
				edge_size[1] = size[1]
				local edge_style = style.edge
				local edge_color = edge_style.color
				local edge_texture_size = edge_style.texture_size
				edge_texture_size[1] = size[1]
				local edge_texture = content.edge_texture
				edge_color[1] = alpha
				position[3] = start_layer + 4

				UIRenderer.draw_tiled_texture(ui_renderer, edge_texture, position, edge_size, edge_texture_size, edge_color)

				local edge_holder_style = style.edge_holder
				local edge_holder_size = data.edge_holder_size
				local edge_holder_color = edge_holder_style.color
				local edge_holder_left_texture = content.edge_holder_left
				local edge_holder_right_texture = content.edge_holder_right
				edge_holder_color[1] = alpha
				position[1] = position[1] + 3
				position[2] = position[2] - 6
				position[3] = start_layer + 5

				UIRenderer.draw_texture(ui_renderer, edge_holder_left_texture, position, edge_holder_size, edge_holder_color)

				position[1] = (position[1] + edge_size[1]) - (edge_holder_size[1] + 6)

				UIRenderer.draw_texture(ui_renderer, edge_holder_right_texture, position, edge_holder_size, edge_holder_color)

				position[2] = position[2] + 6
				position[1] = position_x + frame_margin
				position[2] = position[2] - text_height
				text_style.text_color[1] = alpha

				UIPasses.text.draw(ui_renderer, text_pass_data, ui_scenegraph, pass_definition, text_style, content, position, text_size, input_service, dt, ui_style_global)
			end

			position[1] = position_x
			position[2] = position_y
			position[3] = position_z

			return text_height
		end
	},
	talent_text = {
		setup_data = function ()
			local text_styles = {
				{
					word_wrap = true,
					name = "title",
					localize = true,
					use_shadow = true,
					font_size = 24,
					horizontal_alignment = "left",
					vertical_alignment = "bottom",
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("font_title", 255)
				},
				{
					vertical_alignment = "bottom",
					name = "description",
					localize = false,
					word_wrap = true,
					font_size = 20,
					horizontal_alignment = "left",
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("font_default", 255)
				},
				{
					word_wrap = true,
					name = "requirement",
					localize = false,
					use_shadow = true,
					font_size = 16,
					horizontal_alignment = "left",
					vertical_alignment = "bottom",
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("red", 255)
				},
				{
					word_wrap = true,
					name = "information",
					localize = false,
					use_shadow = true,
					font_size = 16,
					horizontal_alignment = "left",
					vertical_alignment = "bottom",
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("green", 255)
				}
			}
			local data = {
				text_styles = text_styles,
				text_content = {},
				text_pass_data = {},
				text_pass_size = {}
			}

			return data
		end,
		draw = function (draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, talent, data, draw_downwards)
			local alpha_multiplier = pass_definition.alpha_multiplier
			local alpha = alpha_multiplier*255
			local start_layer = pass_definition.start_layer or DEFAULT_START_LAYER
			local frame_margin = data.frame_margin or 0
			local text_styles = data.text_styles
			local text_content = data.text_content

			table.clear(text_content)

			local disabled = ui_content.disabled
			local is_selected = ui_content.is_selected
			text_content.title = talent.name or "n/a"
			local requirement_text, information_text = nil

			if disabled then
				requirement_text = Localize("talent_locked_desc")
			elseif not is_selected then
				information_text = Localize("talent_can_select_desc")
			end

			text_content.requirement = requirement_text
			text_content.information = information_text
			text_content.description = UIUtils.get_talent_description(talent)
			local loop_func = (draw_downwards and ipairs) or ripairs
			local position_x = position[1]
			local position_y = position[2]
			local position_z = position[3]
			position[1] = position[1] + frame_margin
			position[2] = (draw_downwards and position[2] - size[2] - frame_margin) or position[2] + frame_margin
			position[3] = start_layer + 5
			local text_pass_data = data.text_pass_data
			local text_size = data.text_pass_size
			text_size[1] = size[1] - frame_margin*2
			text_size[2] = size[2]
			local text_total_height = frame_margin

			for index, text_style in loop_func(text_styles) do
				local ignore_line_change = text_style.ignore_line_change
				text_style.vertical_alignment = (draw_downwards and "top") or "bottom"
				local style_name = text_style.name
				local text = text_content[style_name]

				if text == true then
					text = text_style.text
					text_content[style_name] = text
				end

				if text then
					text_pass_data.text_id = style_name

					if draw then
						text_style.text_color[1] = alpha

						UIPasses.text.draw(ui_renderer, text_pass_data, ui_scenegraph, pass_definition, text_style, text_content, position, text_size, input_service, dt, ui_style_global)
					end

					local text_height = get_text_height(ui_renderer, text_size, text_style, text_content, text, ui_style_global)

					if not ignore_line_change then
						if draw_downwards then
							position[2] = position[2] - text_height
						else
							position[2] = position[2] + text_height
						end

						text_total_height = text_total_height + text_height
					end
				end
			end

			position[1] = position_x
			position[2] = position_y
			position[3] = position_z

			return text_total_height
		end
	},
	generic_text = {
		setup_data = function ()
			local data = {
				text_pass_data = {},
				text_pass_size = {}
			}

			return data
		end,
		draw = function (draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, data, draw_downwards)
			local alpha_multiplier = pass_definition.alpha_multiplier
			local alpha = alpha_multiplier*255
			local start_layer = pass_definition.start_layer or DEFAULT_START_LAYER
			local frame_margin = data.frame_margin or 0
			local text_styles = ui_style.text_styles
			local text_content = ui_content

			if not text_content or not text_styles then
				return 0
			end

			local loop_func = (draw_downwards and ipairs) or ripairs
			local position_x = position[1]
			local position_y = position[2]
			local position_z = position[3]
			position[1] = position[1] + frame_margin
			position[2] = (draw_downwards and position[2] - size[2] - frame_margin) or position[2] + frame_margin
			position[3] = start_layer + 5
			local text_pass_data = data.text_pass_data
			local text_size = data.text_pass_size
			text_size[1] = size[1] - frame_margin*2
			text_size[2] = size[2]
			local text_total_height = 0

			for index, text_style in loop_func(text_styles) do
				local ignore_line_change = text_style.ignore_line_change
				text_style.vertical_alignment = (draw_downwards and "top") or "bottom"
				local style_name = text_style.name
				local text = text_content[style_name]

				if text == true then
					text = text_style.text
					text_content[style_name] = text
				end

				if text then
					text_pass_data.text_id = style_name

					if draw then
						text_style.text_color[1] = alpha

						UIPasses.text.draw(ui_renderer, text_pass_data, ui_scenegraph, pass_definition, text_style, text_content, position, text_size, input_service, dt, ui_style_global)
					end

					local text_height = get_text_height(ui_renderer, text_size, text_style, text_content, text, ui_style_global)

					if not ignore_line_change then
						if draw_downwards then
							position[2] = position[2] - text_height
						else
							position[2] = position[2] + text_height
						end

						text_total_height = text_total_height + text_height
					end
				end
			end

			position[1] = position_x
			position[2] = position_y
			position[3] = position_z

			return text_total_height
		end
	},
	level_info = {
		setup_data = function ()
			local data = {
				frame_name = "item_tooltip_frame_01",
				background_color = {
					255,
					0,
					0,
					0
				},
				text_pass_data = {},
				text_size = {},
				content = {
					text_content = {}
				},
				style = {
					image_edge_fade = {
						color = {
							255,
							255,
							255,
							255
						},
						size = {
							280,
							15
						}
					},
					text_styles = {
						{
							vertical_alignment = "center",
							name = "title",
							word_wrap = true,
							horizontal_alignment = "center",
							font_size = 28,
							font_type = "hell_shark_header",
							text_color = Colors.get_color_table_with_alpha("font_title", 255)
						},
						{
							vertical_alignment = "center",
							name = "description",
							word_wrap = true,
							horizontal_alignment = "center",
							font_size = 18,
							font_type = "hell_shark",
							text_color = Colors.get_color_table_with_alpha("font_default", 255)
						}
					}
				}
			}

			return data
		end,
		draw = function (draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, level_data, data, draw_downwards)
			local alpha_multiplier = pass_definition.alpha_multiplier
			local alpha = alpha_multiplier*255
			local start_layer = pass_definition.start_layer or DEFAULT_START_LAYER
			local frame_margin = data.frame_margin or 0
			local style = data.style
			local content = data.content
			local text_styles = style.text_styles
			local text_content = content.text_content
			local level_key = level_data.level_id
			local display_name = level_data.display_name
			local total_height = frame_margin*0.5
			local position_x = position[1]
			local position_y = position[2]
			local position_z = position[3]
			local frame_name = data.frame_name
			local frame_settings = UIFrameSettings[frame_name]
			local frame_edge_height = frame_settings.texture_sizes.horizontal[2]
			text_content.title = Localize(display_name)
			text_content.description = level_key or "description"
			position[1] = position[1] + frame_margin
			position[2] = (draw_downwards and position[2] - total_height) or position[2] + frame_edge_height
			position[3] = start_layer + 5
			local text_size = data.text_size
			text_size[1] = size[1] - frame_margin*2
			text_size[2] = 0
			local text_total_height = -frame_edge_height
			local text_pass_data = data.text_pass_data
			local loop_func = (draw_downwards and ipairs) or ripairs

			for index, text_style in loop_func(text_styles) do
				local ignore_line_change = text_style.ignore_line_change
				text_style.vertical_alignment = (draw_downwards and "top") or "top"
				local style_name = text_style.name
				local text = text_content[style_name]

				if text == true then
					text = text_style.text
					text_content[style_name] = text
				end

				if text then
					text_pass_data.text_id = style_name
					local text_height = get_text_height(ui_renderer, text_size, text_style, text_content, text, ui_style_global)

					if not ignore_line_change and not draw_downwards then
						position[2] = position[2] + text_height
					end

					if draw then
						text_style.text_color[1] = alpha

						UIPasses.text.draw(ui_renderer, text_pass_data, ui_scenegraph, pass_definition, text_style, text_content, position, text_size, input_service, dt, ui_style_global)
					end

					if not ignore_line_change then
						if draw_downwards then
							position[2] = position[2] - text_height
						end

						text_total_height = text_total_height + text_height
					end
				end
			end

			total_height = total_height + text_total_height
			position[1] = position_x
			position[2] = position_y
			position[3] = position_z

			return total_height
		end
	}
}

return 

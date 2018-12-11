require("scripts/ui/atlas_settings/gui_hud_atlas")
require("scripts/ui/atlas_settings/gui_game_logos_atlas")
require("scripts/ui/atlas_settings/gui_loading_atlas")
require("scripts/ui/atlas_settings/gui_menu_buttons_atlas")
require("scripts/ui/atlas_settings/gui_popup_atlas")
require("scripts/ui/atlas_settings/gui_splash_atlas")
require("scripts/ui/atlas_settings/gui_items_atlas")
require("scripts/ui/atlas_settings/gui_achievement_icons_atlas")
require("scripts/ui/atlas_settings/gui_icons_atlas")
require("scripts/ui/atlas_settings/gui_chat_atlas")
require("scripts/ui/atlas_settings/gui_voice_chat_atlas")
require("scripts/ui/atlas_settings/gui_startup_settings_atlas")
require("scripts/ui/atlas_settings/gui_settings_atlas")
require("scripts/ui/atlas_settings/gui_start_screen_atlas")
require("scripts/ui/atlas_settings/gui_level_images_atlas")
require("scripts/ui/atlas_settings/gui_map_locations_atlas")
require("scripts/ui/atlas_settings/gui_frames_atlas")
require("scripts/ui/atlas_settings/gui_menus_atlas")

local platform = PLATFORM

if platform == "win32" then
end

UIAtlasHelper = UIAtlasHelper or {}
local none_atlas_textures = {
	hero_power_glow_console = true,
	ability_outer_effect_1 = true,
	crafting_button_fill = true,
	game_mode_selection_glow_02_masked = true,
	unit_frame_portrait_sienna_scholar_masked = true,
	journal_gradient_05 = true,
	tabs_glow_animated = true,
	loot_presentation_circle_glow_promo_large = true,
	console_hp_bar_background = true,
	ubersreik_area_icon_banner = true,
	chest_reward_bar = true,
	loot_presentation_circle_glow_rare = true,
	news_splash_pagecounter_fill = true,
	overcharge_threshold_mask = true,
	level_list_selection_frame = true,
	console_menu_highlight = true,
	charge_bar_flames_mask = true,
	demo_bg_02 = true,
	start_game_detail_glow_masked = true,
	twitch_rat_ogre = true,
	gamepad_difficulty_banner_2_masked = true,
	achievement_small_book_glow = true,
	gradient_item_rarity = true,
	gamepad_difficulty_banner_5_masked = true,
	end_screen_effect_victory_1 = true,
	unit_frame_portrait_victor_zealot_twitch_icon = true,
	news_splash_new_dlc_tag = true,
	teammate_hp_bar_2 = true,
	unit_frame_portrait_sienna_adept = true,
	twitch_frame_glass = true,
	vote_a = true,
	mask_rect_side_edge_fade = true,
	unit_frame_portrait_bardin_slayer_twitch = true,
	achievement_book_glow_03 = true,
	unit_frame_portrait_sienna_unchained_masked = true,
	loot_presentation_circle_glow_unique = true,
	end_screen_banner_victory = true,
	play_button_frame_glow = true,
	twitch_buff_3 = true,
	down_arrow = true,
	gamepad_ability_outline_fill = true,
	mask_rect_edge_fade = true,
	offscreen_clear = true,
	drachenfels_area_icon_glass = true,
	gradient_credits_menu = true,
	unit_frame_portrait_sienna_unchained = true,
	unit_frame_portrait_victor_zealot = true,
	gamepad_difficulty_banner_5 = true,
	journal_gradient_01 = true,
	gradient_main_menu = true,
	console_player_hp_bar = true,
	gamepad_difficulty_banner_4_masked = true,
	gamepad_crafting_bar_mask = true,
	teammate_hp_bar_color_tint_3 = true,
	start_game_detail_glow = true,
	unit_frame_portrait_kruber_knight_twitch = true,
	twitch_damage_boost = true,
	unit_frame_portrait_kerillian_shade_masked = true,
	ability_effect = true,
	unit_frame_portrait_kerillian_waywatcher_twitch_icon = true,
	unit_frame_portrait_kruber_huntsman_masked = true,
	unit_frame_portrait_kerillian_maidenguard_masked = true,
	unit_frame_portrait_sienna_scholar = true,
	end_screen_experience_bar_bubbles = true,
	buff_gradient_mask = true,
	teammate_hp_bar_1 = true,
	unit_frame_portrait_kerillian_waywatcher_masked = true,
	vermintide_logo_title = true,
	unit_frame_portrait_victor_captain_twitch = true,
	end_screen_effect_defeat_2 = true,
	twitch_ammo = true,
	unit_frame_portrait_bardin_ranger_masked = true,
	unit_frame_portrait_sienna_adept_twitch_icon = true,
	unit_frame_portrait_bardin_ranger_twitch = true,
	unit_frame_portrait_sienna_adept_twitch = true,
	glass_indicator = true,
	unit_frame_portrait_kruber_mercenary_twitch_icon = true,
	gamma_settings_image_01 = true,
	unit_frame_portrait_victor_bountyhunter_masked = true,
	unit_frame_portrait_victor_bountyhunter_twitch = true,
	unit_frame_portrait_victor_captain = true,
	game_mode_selection_glow_01 = true,
	loot_presentation_circle_glow_common_large = true,
	unit_frame_portrait_bardin_ranger_twitch_icon = true,
	unit_frame_portrait_sienna_scholar_twitch = true,
	loot_presentation_circle_glow_exotic_large = true,
	hud_difficulty_unlocked_glow = true,
	console_cursor = true,
	unit_frame_portrait_kerillian_shade_twitch_icon = true,
	background_seaweed_anim_03 = true,
	drachenfels_area_icon_banner = true,
	gamepad_difficulty_banner_2 = true,
	gamepad_difficulty_banner_1_masked = true,
	console_charge_bar_fill = true,
	twitch_special_group_3 = true,
	gamepad_difficulty_banner_3_masked = true,
	loot_presentation_circle_glow_plentiful = true,
	unit_frame_portrait_kerillian_maidenguard_twitch_icon = true,
	news_splash_scroll_end = true,
	news_splash_scroll_middle = true,
	unit_frame_portrait_kerillian_maidenguard_twitch = true,
	news_splash_bogenhafan_title = true,
	news_splash_back_to_ubersreik_title = true,
	news_splash_arrow_off = true,
	unit_frame_portrait_sienna_unchained_twitch = true,
	unit_frame_portrait_bardin_slayer_masked = true,
	hero_panel_selection_glow = true,
	console_player_hp_bar_color_tint = true,
	teammate_hp_bar_3 = true,
	unit_frame_portrait_sienna_adept_masked = true,
	controller_hold_bar = true,
	console_hp_bar_frame = true,
	gradient_dice_game_reward = true,
	twitch_speed_boost = true,
	gamepad_ability_outline_mask = true,
	controller_image_xb1 = true,
	gamma_settings_image_02 = true,
	news_splash_pagecounter_bar = true,
	achievement_book_ribbon_01 = true,
	twitch_logo = true,
	teammate_hp_bar_color_tint_2 = true,
	unit_frame_portrait_bardin_ironbreaker_twitch_icon = true,
	storepage_button = true,
	boss_portrait_heal = true,
	radial_chat_wedge = true,
	unit_frame_portrait_kruber_huntsman_twitch_icon = true,
	game_mode_selection_glow_02 = true,
	options_menu_divider_glow_02 = true,
	mask_circular = true,
	unit_frame_portrait_victor_bountyhunter = true,
	journal_gradient_03 = true,
	background_net_anim_02 = true,
	end_screen_effect_defeat_1 = true,
	hud_panel_banner = true,
	news_splash_premium_edition_title = true,
	unit_frame_portrait_kruber_knight_masked = true,
	loot_presentation_circle_glow_common = true,
	gradient_playerlist = true,
	unit_frame_portrait_kerillian_maidenguard = true,
	twitch_special_group_1 = true,
	beta_end_overlay = true,
	esrb_logo = true,
	unit_frame_portrait_victor_bountyhunter_twitch_icon = true,
	loading_screen = true,
	news_splash_bg_premium = true,
	settings_debug_gamma_correction = true,
	unit_frame_portrait_victor_captain_twitch_icon = true,
	unit_frame_portrait_victor_zealot_twitch = true,
	achievement_book_glow_04 = true,
	overcharge_bar_2 = true,
	overchargecircle_fill = true,
	unit_frame_portrait_bardin_ironbreaker_twitch = true,
	block_arch_symbol = true,
	twitch_heal = true,
	unit_frame_portrait_kruber_mercenary_masked = true,
	mask_rect = true,
	loot_presentation_circle_glow_plentiful_large = true,
	loot_presentation_circle_glow_promo = true,
	speech_bubble = true,
	unit_frame_portrait_kruber_mercenary = true,
	unit_frame_portrait_default = true,
	interaction_bar = true,
	level_location_selected = true,
	unit_frame_portrait_bardin_slayer_twitch_icon = true,
	beta_text = true,
	end_screen_experience_bar = true,
	game_option_smoke = true,
	play_button_passive_glow = true,
	simple_rect_texture = true,
	vote_b = true,
	vermintide_2_logo_tutorial = true,
	fade_bg = true,
	charge_bar_flames = true,
	achievement_book_glow_02 = true,
	controller_image_ps4 = true,
	loot_presentation_circle_glow_unique_large = true,
	unit_frame_portrait_victor_zealot_masked = true,
	map_area_banner_difficulty_icon = true,
	gamepad_ability_effect = true,
	ability_outer_effect_mask = true,
	overchargecircle_sidefade = true,
	news_splash_pagecounter_dot_on = true,
	twitch_buff_2 = true,
	unit_frame_portrait_kerillian_shade = true,
	background_seaweed_anim_02 = true,
	unit_frame_portrait_sienna_scholar_twitch_icon = true,
	start_screen_selection_left = true,
	prestige_banner = true,
	unit_frame_portrait_victor_captain_masked = true,
	unit_frame_portrait_kruber_knight_twitch_icon = true,
	loading_screen_default = true,
	demo_water_mark = true,
	gamepad_difficulty_banner_4 = true,
	gradient_map_screen = true,
	unit_frame_portrait_bardin_ironbreaker = true,
	twitch_icon_damage = true,
	loading_title_divider = true,
	fuzzy_circle = true,
	tile_texture_01 = true,
	twitch_frame_01 = true,
	start_screen_selection_right = true,
	demo_bg_01 = true,
	twitch_validate = true,
	journal_gradient_04 = true,
	background_seaweed_anim_04 = true,
	achievement_book_ribbon_02 = true,
	twitch_buff_4 = true,
	achievement_menu_flag = true,
	unit_frame_portrait_kruber_mercenary_twitch = true,
	options_menu_divider_glow_01 = true,
	buff_cooldown_gradient = true,
	unit_frame_portrait_bardin_ranger = true,
	twitch_pow = true,
	twitch_icon_ammo = true,
	rect_masked = true,
	mission_objective_top = true,
	mission_objective_bottom = true,
	unit_frame_portrait_kruber_huntsman_twitch = true,
	default = true,
	buff_duration_gradient = true,
	twitch_buff_1 = true,
	twitch_special_group_4 = true,
	unit_frame_portrait_sienna_unchained_twitch_icon = true,
	twitch_bg = true,
	end_screen_effect_victory_2 = true,
	background_net_anim_01 = true,
	journal_gradient_02 = true,
	fatigue_icon_glow = true,
	vermintide_2_logo_demo = true,
	unit_frame_portrait_kerillian_shade_twitch = true,
	teammate_hp_bar_color_tint_1 = true,
	twitch_disconnected = true,
	twitch_special_group_2 = true,
	twitch_connected = true,
	unit_frame_portrait_kruber_knight = true,
	unit_frame_portrait_kruber_huntsman = true,
	achievement_book_glow_01 = true,
	twitch_icon_heal = true,
	chest_reward_bar_progress = true,
	twitch_small_logo = true,
	hud_ability_bg = true,
	player_hp_bar = true,
	loot_presentation_circle_glow_exotic = true,
	news_splash_pagecounter_dot_off = true,
	gamepad_difficulty_banner_1 = true,
	game_mode_selection_glow_01_masked = true,
	news_splash_bg_back_to_ubersreik = true,
	karak_azgaraz_location_icon_banner = true,
	unit_frame_portrait_kerillian_waywatcher = true,
	gamepad_difficulty_banner_3 = true,
	news_splash_arrow_on = true,
	loot_presentation_circle_glow_rare_large = true,
	teammate_hp_bar_mask = true,
	item_slot_side_effect = true,
	unit_frame_portrait_kerillian_waywatcher_twitch = true,
	overcharge_bar_1 = true,
	news_splash_bg_bogenhafen = true,
	overcharge_bar_3 = true,
	unit_frame_portrait_bardin_ironbreaker_masked = true,
	twitch_healing_draught = true,
	end_screen_banner_defeat = true,
	gradient_friend_list = true,
	gradient_enchantment_craft = true,
	unit_frame_portrait_bardin_slayer = true,
	player_hp_bar_color_tint = true
}
local ui_atlas_setting_tables = {
	gui_achievement_icons_atlas = achievement_icons_atlas,
	gui_startup_settings_atlas = startup_settings_atlas,
	gui_items_atlas = items_atlas,
	gui_icons_atlas = icons_atlas,
	gui_loading_atlas = loading_atlas,
	gui_popup_atlas = popup_atlas,
	gui_hud_atlas = hud_atlas,
	gui_splash_atlas = splash_atlas,
	gui_game_logos_atlas = game_logos_atlas,
	gui_menu_buttons_atlas = menu_buttons_atlas,
	gui_chat_atlas = chat_atlas,
	gui_voice_chat_atlas = voice_chat_atlas,
	gui_settings_atlas = settings_atlas,
	gui_start_screen_atlas = start_screen_atlas,
	gui_map_locations_atlas = map_locations_atlas,
	gui_menus_atlas = menus_atlas,
	gui_frames_atlas = frames_atlas,
	gui_level_images_atlas = level_images_atlas
}
local masked_materials = {
	gui_menu_buttons_atlas = "gui_menu_buttons_atlas_masked",
	gui_settings_atlas = "gui_settings_atlas_masked",
	gui_achievement_icons_atlas = "gui_achievement_icons_atlas_masked",
	gui_hud_atlas = "gui_hud_atlas_masked",
	gui_start_screen_atlas = "gui_start_screen_atlas_masked",
	gui_frames_atlas = "gui_frames_atlas_masked",
	gui_map_locations_atlas = "gui_map_locations_atlas_masked",
	gui_menus_atlas = "gui_menus_atlas_masked",
	gui_icons_atlas = "gui_icons_atlas_masked",
	gui_items_atlas = "gui_items_atlas_masked"
}
local saturated_materials = {
	gui_menus_atlas = "gui_menus_atlas_saturated",
	gui_level_images_atlas = "gui_level_images_atlas_saturated",
	gui_achievement_icons_atlas = "gui_achievement_icons_atlas_saturated",
	gui_icons_atlas = "gui_icons_atlas_saturated",
	gui_items_atlas = "gui_items_atlas_saturated",
	gui_menu_buttons_atlas = "gui_menu_buttons_atlas_saturated"
}
local masked_saturated_materials = {
	gui_achievement_icons_atlas = "gui_achievement_icons_atlas_masked_saturated",
	gui_icons_atlas = "gui_icons_atlas_masked_saturated",
	gui_items_atlas = "gui_items_atlas_masked_saturated"
}

if platform ~= "win32" then
	saturated_materials.gui_map_console_atlas = "gui_map_console_atlas_saturated"
end

local masked_point_sample_materials = {
	gui_achievement_icons_atlas = "gui_achievement_icons_atlas_point_sample_masked",
	gui_settings_atlas = "gui_settings_atlas_point_sample_masked",
	gui_hud_atlas = "gui_hud_atlas_point_sample_masked",
	gui_start_screen_atlas = "gui_start_screen_atlas_point_sample_masked",
	gui_frames_atlas = "gui_frames_atlas_point_sample_masked",
	gui_map_locations_atlas = "gui_map_locations_atlas_point_sample_masked",
	gui_menus_atlas = "gui_menus_atlas_point_sample_masked",
	gui_icons_atlas = "gui_icons_atlas_point_sample_masked",
	gui_items_atlas = "gui_items_atlas_point_sample_masked"
}
local masked_saturated_point_sample_materials = {
	gui_icons_atlas = "gui_icons_atlas_point_sample_masked_saturated"
}
local point_sample_materials = {
	controller_image_xb1 = "controller_image_xb1_point_sample",
	gui_settings_atlas = "gui_settings_atlas_point_sample",
	gui_voice_chat_atlas = "gui_voice_chat_atlas_point_sample",
	overchargecircle_fill = "overchargecircle_fill_point_sample",
	gui_start_screen_atlas = "gui_start_screen_atlas_point_sample",
	gui_map_locations_atlas = "gui_map_locations_atlas_point_sample",
	gui_achievement_icons_atlas = "gui_achievement_icons_atlas_point_sample",
	gui_game_logos_atlas = "gui_game_logos_atlas_point_sample",
	gui_menus_atlas = "gui_menus_atlas_point_sample",
	gui_level_images_atlas = "gui_level_images_atlas_point_sample",
	overchargecircle_sidefade = "overchargecircle_fill_point_sample",
	loading_screen = "loading_screen_point_sample",
	loading_screen_default = "loading_screen_default_point_sample",
	gui_icons_atlas = "gui_icons_atlas_point_sample",
	end_screen_banner_victory = "end_screen_banner_victory_point_sample",
	end_screen_effect_victory_1 = "end_screen_effect_victory_1_point_sample",
	end_screen_effect_victory_2 = "end_screen_effect_victory_2_point_sample",
	end_screen_banner_defeat = "end_screen_banner_defeat_point_sample",
	gui_chat_atlas = "gui_chat_atlas_point_sample",
	gui_hud_atlas = "gui_hud_atlas_point_sample",
	gui_popup_atlas = "gui_popup_atlas_point_sample",
	controller_hold_bar = "controller_hold_bar_point_sample",
	gui_frames_atlas = "gui_frames_atlas_point_sample",
	gui_menu_buttons_atlas = "gui_menu_buttons_atlas_point_sample",
	vermintide_2_logo_tutorial = "vermintide_2_logo_tutorial_point_sample",
	gui_loading_atlas = "gui_loading_atlas_point_sample",
	gui_startup_settings_atlas = "gui_startup_settings_atlas_point_sample",
	controller_image_ps4 = "controller_image_ps4_point_sample",
	gui_items_atlas = "gui_items_atlas_point_sample",
	gui_splash_atlas = "gui_splash_atlas_point_sample"
}
local offscreen_materials = {
	gui_menus_atlas = "gui_menus_atlas_offscreen",
	gui_icons_atlas = "gui_icons_atlas_offscreen",
	gui_items_atlas = "gui_items_atlas_offscreen",
	gui_frames_atlas = "gui_frames_atlas_offscreen"
}
local masked_offscreen_materials = {
	gui_menus_atlas = "gui_menus_atlas_masked_offscreen",
	gui_icons_atlas = "gui_icons_atlas_masked_offscreen",
	gui_items_atlas = "gui_items_atlas_masked_offscreen",
	gui_frames_atlas = "gui_frames_atlas_masked_offscreen"
}
local masked_point_sample_offscreen_materials = {
	gui_menus_atlas = "gui_menus_atlas_point_sample_masked_offscreen",
	gui_icons_atlas = "gui_icons_atlas_point_sample_masked_offscreen",
	gui_items_atlas = "gui_items_atlas_point_sample_masked_offscreen",
	gui_frames_atlas = "gui_frames_atlas_point_sample_masked_offscreen"
}
local point_sample_offscreen_materials = {
	gui_menus_atlas = "gui_menus_atlas_point_sample_offscreen",
	gui_icons_atlas = "gui_icons_atlas_point_sample_offscreen",
	gui_items_atlas = "gui_items_atlas_point_sample_offscreen",
	gui_frames_atlas = "gui_frames_atlas_point_sample_offscreen"
}
local saturated_offscreen_materials = {
	gui_items_atlas = "gui_items_atlas_saturated",
	gui_icons_atlas = "gui_icons_atlas_saturated"
}

if platform ~= "win32" then
end

local ui_atlas_settings = {}

for material, material_settings in pairs(ui_atlas_setting_tables) do
	for texture_name, texture_settings in pairs(material_settings) do
		local settings = table.clone(texture_settings)
		settings.material_name = material
		settings.masked_material_name = masked_materials[material]
		settings.point_sample_material_name = point_sample_materials[material]
		settings.masked_point_sample_material_name = masked_point_sample_materials[material]
		settings.saturated_material_name = saturated_materials[material]
		settings.masked_saturated_material_name = masked_saturated_materials[material]
		settings.masked_saturated_point_sample_material_name = masked_saturated_point_sample_materials[material]
		settings.offscreen_material_name = offscreen_materials[material]
		settings.masked_offscreen_material_name = masked_offscreen_materials[material]
		settings.masked_point_sample_offscreen_material_name = masked_point_sample_offscreen_materials[material]
		settings.point_sample_offscreen_material_name = point_sample_offscreen_materials[material]
		settings.saturated_offscreen_material_name = saturated_offscreen_materials[material]
		local existing_material_name = ui_atlas_settings[texture_name] and ui_atlas_settings[texture_name].material_name

		fassert(ui_atlas_settings[texture_name] == nil, "[UIAtlasHelper] - Texture (%s) in material (%s) already exist in material (%s). Make sure to use unique texture names.", texture_name, material, existing_material_name)

		ui_atlas_settings[texture_name] = settings
	end
end

UIAtlasHelper.has_atlas_settings_by_texture_name = function (texture_name)
	return (ui_atlas_settings[texture_name] and true) or false
end

UIAtlasHelper.get_atlas_settings_by_texture_name = function (texture_name)
	fassert(texture_name, "[UIAtlasHelper] - Trying to access atlas settings for a texture without a name")

	if none_atlas_textures[texture_name] then
		return
	end

	local texture_settings = ui_atlas_settings[texture_name]

	fassert(texture_settings, "[UIAtlasHelper] - Atlas texture settings for (%s) does not exist.", texture_name)

	return texture_settings
end

UIAtlasHelper.has_texture_by_name = function (texture_name)
	if none_atlas_textures[texture_name] or ui_atlas_settings[texture_name] then
		return true
	end

	return false
end

return

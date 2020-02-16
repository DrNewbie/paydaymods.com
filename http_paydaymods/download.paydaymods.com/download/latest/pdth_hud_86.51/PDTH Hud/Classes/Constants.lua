PDTHHudCoreConstants = PDTHHudCoreConstants or class()

function PDTHHudCoreConstants:init(parent)
    local scale = parent.Options:GetValue("HUD/Scale")
    local OGTMHealth = parent.Options:GetValue("HUD/OGTMHealth")

    self.main_health_h = 130 * scale
    self.health_ratio = 32/65
    self.og_health_ratio = 1/4

    self.health_main_colour = Color(0.5, 0.8, 0.4)
    self.health_main_colour_damaged = Color(1, 0, 0)

    self.health_gradient_start_point = 0.6
    self.health_damage_start_point = 0.4

    self.teammates_beside_main_health_count = 3

    self.tm_health_h = 34

    self.tm_condition_demultiplier = 1.1

    self.main_perk_multiplier = 5
    self.main_perk_gap = 5
    self.main_perk_health_gap = 2

    self.main_character_font_size = 15 * scale
    self.main_character_y_offset = 2

    self.main_equipment_size = 36 * scale
    self.main_equipment_font_size = 18 * scale

    self.main_equipment_y_offset_multiplier = 1.75

    self.main_bag_gap = 5 * scale

    self.main_firemode_font_size = 14 * scale
    self.main_ammo_font_size = 18 * scale
    self.main_ammo_image_gap = 5 * scale
    self.main_ammo_size_multiplier = 1.2
    self.main_ammo_empty_threshold_multiplier = 0.25
    self.main_ammo_empty_gradual_threshold_multiplier = 0.4
    self.main_ammo_colour = Color(1,1,1,1)
    self.main_ammo_empty_colour = Color(1, 1, 0, 0)
    self.main_ammo_colour_empty_alpha = 0.3
    self.main_ammo_colour_alpha = 0.9
    self.main_ammo_max = 100
    self.main_ammo_max_dyn = 250
    self.main_firemode_gap = 3 * scale
    self.main_ammo_panel_x_offset = 5

    self.present_h = 38 * scale
    self.present_title_fsize = 12 * scale
    self.present_text_fsize = 20 * scale
    self.present_text_gap = 3 * scale
    self.present_title_y_offset = 1 * scale

    self.interact_scale_w = 15
    self.interact_scale_h = 1

    self.interact_border = 0 * scale
    self.interact_text_x_offset = 4 * scale

    self.interact_bitmap_x_offset = 2 * scale

    self.interact_h_multiplier = 1.8

    self.interact_font_size = 15 * scale
    self.interact_invalid_font_size = 27 * scale

    self.hostages_font_size = 14 * scale

    self.assault_h = 75 * scale
    self.assault_w = 85 * scale
    self.assault_font_size = 22 * scale
    self.assault_y_offset = 5 * scale

    self.no_return_t_font_size = 19 * scale
    self.no_return_timer_font_size = 24 * scale
    self.no_return_timer_font_size_pulse = 32 * scale

    self.casing_size = 80 * scale

    self.equipment_gap = 4

    self.num_on_right_inflation = 2

    self.tm_gap = 3 * scale

    self.tm_condition_font_size = (20 + (OGTMHealth and 5 or 0)) * scale
    self.tm_condition_font_size_flash = (35 + (OGTMHealth and 5 or 0)) * scale

    self.tm_equipment_inflation = 5

    self.tm_equipment_font_size = 16 * scale

    self.tm_name_font_size = 14 * scale

    self.tm_name_gap = 3

    self.tm_health_gap = 4 * scale

    self.tm_gradient_width = 300 * scale
    self.interaction_main_texture_rect = {0, 392, 360, 22}
    self.interaction_bg_texture_rect = {0, 414, 360, 22}
end

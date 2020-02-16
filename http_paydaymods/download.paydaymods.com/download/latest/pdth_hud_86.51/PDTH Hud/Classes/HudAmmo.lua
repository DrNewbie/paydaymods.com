HUDAmmo = HUDAmmo or class()

local ammo_styles = {
    HUDAmmoHandler,
    HUDAmmoHandlerSaw,
    HUDAmmoHandlerFlamethrower
}

function HUDAmmo:init(player_panel, id)
    local const = pdth_hud.constants
    local main_player_right = player_panel:right() - (const.main_equipment_size / 2)
    local height = const.main_equipment_size * (const.main_equipment_y_offset_multiplier - 1)

    self._panel = player_panel:panel({
        id = id .. "_weapon_ammo",
        h = height,
        w = player_panel:w(),
        visible = false,
        layer = 1
    })
    self._panel:set_right((main_player_right) - const.main_ammo_panel_x_offset)
    self._panel:set_bottom(player_panel:bottom())

    local scale = pdth_hud.Options:GetValue("HUD/Scale")

    self._firemode = self._panel:text({
        name = "firemode",
        text = "NONE",
        layer = 1,
        font = tweak_data.menu.small_font,
        font_size = const.main_firemode_font_size
    })
    managers.hud:make_fine_text(self._firemode)
    self._firemode:set_center_y(self._panel:h() / 2)
    self._firemode:set_right(self._panel:w())


    self._ammo = self._panel:text({
        name = "ammo",
        text = "000/000",
        layer = 1,
        font = tweak_data.menu.small_font,
        font_size = const.main_ammo_font_size
    })
    managers.hud:make_fine_text(self._ammo)
    self._ammo:set_center_y(self._panel:h() / 2)
    self._ammo:set_right(self._firemode:left() - const.main_firemode_gap)

    local ammo_offset = self._ammo:left() - const.main_ammo_image_gap
    self._ammo_panel = self._panel:panel({
        name = "ammo_panel",
        layer = 1,
        h = self._panel:h(),
        w = self._panel:w() - (self._panel:w() - ammo_offset)
    })
    self._ammo_panel:set_center_y(self._panel:h() / 2)
    self._ammo_panel:set_right(ammo_offset)

    self._weapon_details = nil
    self._weapon_ammo_details = nil
    self._current_ammo = nil
    self._created_ammo = false
    self._ammo_handler = nil
end

function HUDAmmo:set_visible(visible)
    self._panel:set_visible(visible)
end

function HUDAmmo:set_firemode(firemode)
    if firemode == "single" then
        self._firemode:set_text("SEMI")
    else
        self._firemode:set_text("AUTO")
    end
end

function HUDAmmo:set_weapon_details(details)
    local prev_weapon_details = self._weapon_details
    self._weapon_details = details

    if details ~= prev_weapon_details then
        --update icons
        self:refresh()
        self:create_ammo_handler()
        self._ammo_handler:create_ammo_icons()
    end
end

function HUDAmmo:set_firemode_burst(firemode, burst_fire)
    self._firemode:set_text("BRST")
end

function HUDAmmo:set_firemode_visibility(visible)
    self._firemode:set_visible(visible)
end

function HUDAmmo:refresh()
    self._weapon_ammo_details = {pdth_hud.textures:get_bullet_details(self._weapon_details.id, self._weapon_details.sub_category or self._weapon_details.category)}
    if self._ammo_handler then
        self._ammo_handler:refresh()
    end
end

function HUDAmmo:create_ammo_handler()
    if self._ammo_handler then
        self._ammo_handler:destroy_ammo_icons()
    end

    local icon, details = unpack(self._weapon_ammo_details)
    if not details then
        return
    end
    local ammo_class = ammo_styles[details.style or 1]
    self._ammo_handler = ammo_class:new(self, self._ammo_panel)
end

function HUDAmmo:ammo_to_string(count)
    return (count < 10 and "00" or count < 100 and "0" or "") .. count
end

function HUDAmmo:set_ammo(max_clip, current_clip, current_left, max, force)
    local previous_current_clip = self._current_ammo and self._current_ammo.current_clip or current_clip
    self._current_ammo = {max_clip = max_clip, current_clip = current_clip, current_left = current_left, max = max}

    self._ammo:set_text(self:ammo_to_string(current_clip) .. "/" .. self:ammo_to_string(current_left))
    self._ammo:set_range_color(4, 7, current_left <= 0 and Color.red or Color.white)

    local r, g, b = 1, 1, 1
    if current_clip <= math.round(max_clip / 4) then
        g = current_clip / (max_clip / 2)
        b = current_clip / (max_clip / 2)
    end
    self._ammo:set_range_color(0, 3, Color(1, r, g, b))

    if not self._created_ammo then
        self._ammo_handler:create_ammo_icons()
    end

    if current_clip ~= previous_current_clip then
        self._ammo_handler:update_ammo_icons(previous_current_clip)
    end
end

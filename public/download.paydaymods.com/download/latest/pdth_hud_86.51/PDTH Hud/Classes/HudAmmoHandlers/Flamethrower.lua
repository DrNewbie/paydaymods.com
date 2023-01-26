HUDAmmoHandlerFlamethrower = HUDAmmoHandlerFlamethrower or class(HUDAmmoHandlerSaw)

function HUDAmmoHandlerFlamethrower:update_ammo_icons(previous_current_clip)
    if not self._parent._weapon_details or not self._parent._current_ammo then
        return
    end

    local should_destory = pdth_hud.Options:GetValue("HUD/Bullet") == 1
    if should_destory then
        if self._parent._created_ammo then
            self:destroy_ammo_icons()
        end
        return
    end

    if not self._parent._created_ammo then
        self:create_ammo_icons()
        return
    end

    local const = pdth_hud.constants

    local icon, details = unpack(self._parent._weapon_ammo_details)
    local bullet = self._ammo_panel:child("bullet")
    local bullet_bg = self._ammo_panel:child("bg")
    local diff = self._parent._current_ammo.current_clip / self._parent._current_ammo.max_clip
    local new_w = diff * bullet_bg:w()
    local gradual = pdth_hud.Options:GetValue("HUD/BulletGradualColour")

    local ammo_colour = pdth_hud.constants.main_ammo_colour
    local max_clip_rat = math.round(self._parent._current_ammo.max_clip * (gradual and const.main_ammo_empty_gradual_threshold_multiplier or const.main_ammo_empty_threshold_multiplier))
    if self._parent._current_ammo.current_clip <= max_clip_rat then
        if not gradual then
            local c = self._parent._current_ammo.current_clip / (self._parent._current_ammo.max_clip / 2)
            ammo_colour = Color(ammo_colour.r, c, c)
        else
            local clip_ratio = 1 - (self._parent._current_ammo.current_clip / max_clip_rat)
            local empty_colour = const.main_ammo_empty_colour
            ammo_colour = Color(math.lerp(ammo_colour.r, empty_colour.r, clip_ratio), math.lerp(ammo_colour.g, empty_colour.g, clip_ratio), math.lerp(ammo_colour.b, empty_colour.b, clip_ratio))
        end
    end

    bullet_bg:set_color(ammo_colour)

    bullet:set_texture_rect(details.texture_rect[1] + ((1 - diff) * details.texture_rect[3]), details.texture_rect[2], diff * details.texture_rect[3], details.texture_rect[4])
    bullet:set_w(new_w)
    bullet:set_right(self._ammo_panel:w())
end

function HUDAmmoHandlerFlamethrower:create_ammo_icons()
    self:destroy_ammo_icons()

    if pdth_hud.Options:GetValue("HUD/Bullet") == 1 then
        return
    end

    if not self._parent._weapon_ammo_details or not self._parent._current_ammo then
        return
    end
    self._parent._created_ammo = true
    local const = pdth_hud.constants

    local icon, details = unpack(self._parent._weapon_ammo_details)

    local h = self._ammo_panel:h()
    local w = (h / details.texture_rect[4]) * details.texture_rect[3]

    local bullet_bg = self._ammo_panel:bitmap({
        name = "bg",
        layer = 1,
        blend_mode = "normal",
        w = w,
        h = h,
        alpha = const.main_ammo_colour_empty_alpha
    })
    bullet_bg:set_right(self._ammo_panel:w())
    bullet_bg:set_center_y(self._ammo_panel:h() / 2)
    bullet_bg:set_image(icon, unpack(details.texture_rect))

    local bullet = self._ammo_panel:bitmap({
        name = "bullet",
        layer = 2,
		blend_mode = "normal",
        alpha = const.main_ammo_colour_alpha
    })
    bullet:set_shape(bullet_bg:shape())
    bullet:set_image(icon, unpack(details.texture_rect))
end

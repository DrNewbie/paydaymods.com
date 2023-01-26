HUDAmmoHandlerSaw = HUDAmmoHandlerSaw or class(HUDAmmoHandler)

function HUDAmmoHandlerSaw:update_ammo_icons(previous_current_clip)
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

    local bullet = self._ammo_panel:child("bullet")
    bullet:set_color(Color(1, (self._parent._current_ammo.current_clip / self._parent._current_ammo.max_clip), 1, 1))
    --bullet:set_rotation((1 - bullet:color().r) * 360)
end

function HUDAmmoHandlerSaw:create_ammo_icons()
    self:destroy_ammo_icons()

    if pdth_hud.Options:GetValue("HUD/Bullet") == 1 then
        return
    end

    if not self._parent._weapon_ammo_details or not self._parent._current_ammo then
        return
    end

    self._parent._created_ammo = true

    local icon, details = unpack(self._parent._weapon_ammo_details)

    w = self._ammo_panel:h()
    h = w

    local r, g, b = 1, 1, 1
    if self._parent._current_ammo.current_clip <= math.round(self._parent._current_ammo.max_clip / 4) then
        g = self._parent._current_ammo.current_clip / (self._parent._current_ammo.max_clip / 2)
        b = self._parent._current_ammo.current_clip / (self._parent._current_ammo.max_clip / 2)
    end

    local bullet_bg = self._ammo_panel:bitmap({
        name = "bg",
        layer = 1,
        blend_mode = "normal",
        w = w,
        h = h,
        alpha = 0.5
    })
    bullet_bg:set_right(self._ammo_panel:w())
    bullet_bg:set_center_y(self._ammo_panel:h() / 2)
    bullet_bg:set_image(icon, unpack(details.texture_rect))

    local bullet = self._ammo_panel:bitmap({
        name = "bullet",
        layer = 2,
        render_template = "VertexColorTexturedRadial",
		blend_mode = "add",
    })
    bullet:set_shape(bullet_bg:shape())
    bullet:set_image(icon, unpack(details.texture_rect))
end

function HUDAmmoHandlerSaw:refresh()
    if pdth_hud.Options:GetValue("HUD/Bullet") == 1 then
        self:destroy_ammo_icons()
        return
    else
        self:update_ammo_icons()
    end

    local bullet = self._ammo_panel:child("bullet")
    local bullet_bg = self._ammo_panel:child("bg")
    local icon, details = unpack(self._parent._weapon_ammo_details)

    if bullet then
        bullet:set_image(self._parent._weapon_ammo_details[1], unpack(details.texture_rect))
    end
    if bullet_bg then
        bullet_bg:set_image(self._parent._weapon_ammo_details[1], unpack(details.texture_rect))
    end

    self:update_ammo_icons()
end

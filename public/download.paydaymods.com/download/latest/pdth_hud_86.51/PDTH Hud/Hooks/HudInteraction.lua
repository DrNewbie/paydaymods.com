if pdth_hud.Options:GetValue("HUD/Interaction") then
    local interact_tr = pdth_hud.constants.interaction_main_texture_rect
    local background_tr = pdth_hud.constants.interaction_bg_texture_rect

    local ValidColour = Color(1, 1, 0.7647058824, 0)

    function HUDInteraction:init(hud, child_name)
        self._hud_panel = hud.panel
        local const = pdth_hud.constants
        self._interaction_h = const.main_equipment_size / const.interact_h_multiplier
        self._interaction_w = ((self._interaction_h / const.interact_scale_h) * const.interact_scale_w)

        local panel_name = (child_name or "interact") .. "_panel"

        if self._hud_panel:child(panel_name) then
            self._hud_panel:remove(self._hud_panel:child(panel_name))
        end

        local poco_compat = self._hud_panel:text({
            name = "progress_timer_text",
            visible = false
        })

        self._interact_panel = self._hud_panel:panel({
            name = panel_name,
            layer = 10,
            visible = false,
            w = const.main_equipment_size + self._interaction_w + const.interact_bitmap_x_offset,
            h = const.main_equipment_size * 2
        })
        self._interact_panel:set_center_x(self._hud_panel:center_x())
        self._interact_panel:set_center_y(self._hud_panel:h() / 3)

        local interact_bitmap = self._interact_panel:bitmap({
            name = "interact_bitmap",
            layer = 1,
            visible = true,
            blend_mode = "normal",
            x = 0,
            y = 0,
            w = const.main_equipment_size,
            h = const.main_equipment_size
        })

        local icon, texture_rect = tweak_data.hud_icons:get_icon_data("develop")
        interact_bitmap:set_image(icon, unpack(texture_rect))

        local interact_background = self._interact_panel:bitmap({
            name = "interact_background",
            blend_mode = "normal",
            layer = 1,
            texture = "guis/textures/pdth_hud/hud_icons",
            texture_rect = background_tr,
            w = self._interaction_w,
            h = self._interaction_h
        })
        interact_background:set_center_y(interact_bitmap:center_y())
        interact_background:set_left(interact_bitmap:right() + const.interact_bitmap_x_offset)
        local interact_bar = self._interact_panel:bitmap({
            name = "interact_bar",
            visible = true,
            layer = 2,
            texture = "guis/textures/pdth_hud/hud_icons",
            texture_rect = interact_tr,
            color = ValidColour,
            w = self._interaction_w - (const.interact_border * 2),
            h = self._interaction_h - (const.interact_border * 2)
        })
        interact_bar:set_center(interact_background:center())
        local interact_text = self._interact_panel:text({
            name = "interact_text",
            visible = true,
            text = "",
            blend_mode = "normal",
            layer = 3,
            font = tweak_data.menu.small_font,
            font_size = const.interact_font_size,
        })
        managers.hud:make_fine_text(interact_text)
        interact_text:set_center_y(interact_background:center_y())
        interact_text:set_left(interact_bar:left() + const.interact_text_x_offset)

        local invalid_text = self._interact_panel:text({
            name = "invalid_text",
            visible = false,
            text = "",
            layer = 3,
            color = Color(1, 0.3, 0.3),
            blend_mode = "normal",
            font = tweak_data.menu.small_font,
            font_size = const.interact_invalid_font_size,
        })
        managers.hud:make_fine_text(invalid_text)
        invalid_text:set_center_x(self._interact_panel:w() / 2)
        invalid_text:set_top(interact_background:bottom())

        self._interact_circle = {}
        self._interact_circle._circle = interact_bar
        self.valid = true
    end

    function HUDInteraction:show_interact(data)
        local interact_bar = self._interact_panel:child("interact_bar")
        local interact_text = self._interact_panel:child("interact_text")
        local interact_bitmap = self._interact_panel:child("interact_bitmap")
        local interact_background = self._interact_panel:child("interact_background")
        self:remove_interact()
        local text = string.upper(data.text or "Press 'F' to interact")

        self._interact_panel:set_visible(true)
        interact_bar:set_w(0)
        interact_text:set_text(text)
        managers.hud:make_fine_text(interact_text)
        interact_text:set_center_y(interact_background:center_y())
        interact_text:set_left(interact_bar:left() + pdth_hud.constants.interact_text_x_offset)
        if data.icon then
            local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)
            interact_bitmap:set_image(icon, unpack(texture_rect))
        end
    end

    function HUDInteraction:remove_interact()
        local interact_bar = self._interact_panel:child("interact_bar")
        local interact_text = self._interact_panel:child("interact_text")
        local interact_bitmap = self._interact_panel:child("interact_bitmap")
        local interact_background = self._interact_panel:child("interact_background")
        if not alive(self._interact_panel) then
            return
        end
        self._interact_panel:set_visible(false)
        local icon, texture_rect = tweak_data.hud_icons:get_icon_data("develop")
        interact_bitmap:set_image(icon, unpack(texture_rect))
    end

    function HUDInteraction:show_interaction_bar(current, total)
        local interact_background = self._interact_panel:child("interact_background")
        local interact_bar = self._interact_panel:child("interact_bar")
        local interact_bitmap = self._interact_panel:child("interact_bitmap")
        local interact_text = self._interact_panel:child("interact_text")
        local mul = current / total
        local width = mul * self._interaction_w
        interact_bar:set_w(width)
        self._interact_panel:set_visible(true)
        interact_bar:set_image("guis/textures/pdth_hud/hud_icons", unpack(interact_tr))

        if BetterLightFX then
            BetterLightFX:StartEvent("Interaction")
        end
    end

    function HUDInteraction:set_interaction_bar_width(current, total)
        local interact_background = self._interact_panel:child("interact_background")
        local interact_bar = self._interact_panel:child("interact_bar")
        local interact_bitmap = self._interact_panel:child("interact_bitmap")
        local interact_text = self._interact_panel:child("interact_text")
        local invalid_text = self._interact_panel:child("invalid_text")
        local mul = current / total
        local width = mul * self._interaction_w
        interact_bar:set_w(width)
        self._interact_panel:set_visible(true)
        interact_bar:set_texture_rect(interact_tr[1], interact_tr[2], interact_tr[3] * mul, interact_tr[4])
        if not self.valid then
            interact_bar:set_color(Color.red)
            if BetterLightFX then
                BetterLightFX:StartEvent("Interaction")
                BetterLightFX:UpdateEvent("Interaction", {_custom_color = Color.red, _progress = mul})
            end
        else
            interact_bar:set_color(ValidColour)
            if BetterLightFX then
                BetterLightFX:StartEvent("Interaction")
                BetterLightFX:UpdateEvent("Interaction", {_custom_color = ValidColour, _progress = mul})
            end
        end
    end

    function HUDInteraction:hide_interaction_bar(complete)
        local interact_bar = self._interact_panel:child("interact_bar")
        local interact_background = self._interact_panel:child("interact_background")
        if complete then
            interact_bar:set_image("guis/textures/pdth_hud/hud_icons", unpack(interact_tr))
        end
        interact_bar:set_w(0)
        self._interact_panel:set_visible(false)

        if BetterLightFX then
            BetterLightFX:UpdateEvent("Interaction", {_progress = 0})
            BetterLightFX:EndEvent("Interaction")
        end
    end

    function HUDInteraction:set_bar_valid(valid, text_id)
        local interact_bar = self._interact_panel:child("interact_bar")
        local interact_background = self._interact_panel:child("interact_background")
        self.valid = valid
        interact_bar:set_image("guis/textures/pdth_hud/hud_icons", unpack(interact_tr))
        local invalid_text = self._interact_panel:child("invalid_text")
        if text_id then
            invalid_text:set_text(managers.localization:to_upper_text(text_id))
            managers.hud:make_fine_text(invalid_text)
            invalid_text:set_center_x(self._interact_panel:w() / 2)
            invalid_text:set_top(interact_background:bottom())
        end
        invalid_text:set_visible(not valid)
    end

    function HUDInteraction:destroy()
        if self._interact_panel then
            self._hud_panel:remove(self._interact_panel)
            self._interact_panel = nil
        end
    end

    function HUDInteraction:_animate_interaction_complete(bitmap, circle)
        bitmap:parent():remove(bitmap)
        circle:remove()
    end

end

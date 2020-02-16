if pdth_hud.Options:GetValue("HUD/Objectives") then
    function HUDPresenter:init(hud)
        local const = pdth_hud.constants
        self._hud_panel = managers.hud._fullscreen_workspace:panel():gui(PlayerBase.PLAYER_INFO_HUD_FULLSCREEN_PD2, {})

        if self._hud_panel:child("present_panel") then
            self._hud_panel:remove(self._hud_panel:child("present_panel"))
        end

        local present_panel = self._hud_panel:panel({
            visible = false,
            name = "present_panel",
            layer = 10,
            w = self._hud_panel:w(),
            h = const.present_h,
        })
        present_panel:set_center_y(self._hud_panel:center_y())

        local background = present_panel:bitmap({
            name = "background",
            visible = true,
            layer = 0,
            color = Color(0.5, 0, 0, 0),
            blend_mode = "normal",
            w = present_panel:w(),
            h = present_panel:h()
        })
        local bitmap = present_panel:bitmap({
            name = "bitmap",
            visible = false,
            layer = 1,
            blend_mode = "normal",
            w = const.main_equipment_size,
            h = const.main_equipment_size
        })
        bitmap:set_left(managers.gui_data._saferect_data.x)
        bitmap:set_bottom(present_panel:h())

        local title = present_panel:text({
            name = "title",
            text = "TITLE",
            vertical = "top",
            valign = "top",
            layer = 1,
            color = Color(1, 1, 0.65882355, 0),
            font = tweak_data.menu.small_font_noshadow,
            font_size = const.present_title_fsize
        })


        local text = present_panel:text({
            name = "text",
            text = "TEXT",
            layer = 1,
            color = Color.white,
            font = tweak_data.menu.small_font,
            font_size = const.present_text_fsize
        })
        self:_reposition_text()
    end

    function HUDPresenter:_reposition_text()
        local const = pdth_hud.constants
        local present_panel = self._hud_panel:child("present_panel")
        local title = present_panel:child("title")
        local text = present_panel:child("text")
        local background = present_panel:child("background")
        local bitmap = present_panel:child("bitmap")

        managers.hud:make_fine_text(title)
        title:set_left(bitmap:right() + const.present_text_gap)
        title:set_top(const.present_title_y_offset)

        managers.hud:make_fine_text(text)
        text:set_left(bitmap:right() + const.present_text_gap)
        text:set_top(title:bottom())
    end

    function HUDPresenter:_present_information(params)
        local const = pdth_hud.constants
        local present_panel = self._hud_panel:child("present_panel")
        local title = present_panel:child("title")
        local text = present_panel:child("text")
        local background = present_panel:child("background")
        local bitmap = present_panel:child("bitmap")

        title:set_text(utf8.to_upper(params.title or "ERROR"))
        text:set_text(utf8.to_upper(params.text))
        self:_reposition_text()

        self._presenting = true

        if params.event then
            managers.hud._sound_source:post_event(params.event)
        end

        present_panel:animate(callback(self, self, "_animate_present_information"), {
            done_cb = callback(self, self, "_present_done"),
            seconds = params.time or 4,
            use_icon = params.icon
        })
    end

    function HUDPresenter:_animate_present_information(present_panel, params)
        local title = present_panel:child("title")
        local text = present_panel:child("text")
        local background = present_panel:child("background")
        local bitmap = present_panel:child("bitmap")
        if params.use_icon then
            params.use_icon = params.use_icon == "pd2_c4" and "equipment_c4" or params.use_icon == "pd2_generic_saw" and "equipment_saw" or params.use_icon
            bitmap:set_visible(true)
            local icon, texture_rect = tweak_data.hud_icons:get_icon_data(params.use_icon)
            bitmap:set_image(icon, unpack(texture_rect))
        end

        present_panel:set_visible(true)
        present_panel:set_alpha(1)
        local function open_done()
            present_panel:set_visible(true)
            present_panel:animate(callback(self, self, "_animate_show_text"))
            wait(params.seconds)
            present_panel:animate(callback(self, self, "_animate_hide_text"))
            wait(0.5)
            local function close_done()
                present_panel:set_visible(false)
                bitmap:set_visible(false)
                self:_present_done()
            end

            present_panel:animate(close_done)
        end

        present_panel:stop()
        present_panel:animate(open_done)
    end

    function HUDPresenter:_animate_show_text(o)
        local TOTAL_T = 0
        local t = TOTAL_T
        while t < 1 do
            local dt = coroutine.yield() * 4
            t = t + dt
            local alpha = t
            o:set_alpha(alpha)
        end
        o:set_alpha(1)
    end

    function HUDPresenter:_animate_hide_text(o)
        local TOTAL_T = 1
        local t = TOTAL_T
        while t > 0 do
            local dt = coroutine.yield() * 4
            t = t - dt
            local alpha = t
            o:set_alpha(alpha)
        end
    end

end

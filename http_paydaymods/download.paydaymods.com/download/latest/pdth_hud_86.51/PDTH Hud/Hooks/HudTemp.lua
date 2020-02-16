if pdth_hud.Options:GetValue("HUD/MainHud") and not (Restoration and Restoration.options.restoration_bagpanel_global) then
    function HUDTemp:_animate_show_bag_panel(bag_panel)
        local w, h = self._bag_panel_w, self._bag_panel_h
        local const = pdth_hud.constants

        local scx = self._temp_panel:w() / 2
        local ecx = self._temp_panel:w() - ((w / 2) + (const.main_equipment_size *  1.5) + const.main_bag_gap)

        local scy = self._temp_panel:h() / 2
        local ecy = self._temp_panel:h() - ((h / 2) + (const.main_equipment_size * const.main_equipment_y_offset_multiplier))

        local bottom = bag_panel:bottom()
        local center_y = bag_panel:center_y()
        local bag_text = self._bg_box:child("bag_text")
        local function open_done()
            bag_text:stop()
            bag_text:set_visible(true)
            bag_text:animate(callback(self, self, "_animate_show_text"))
        end
        self._bg_box:stop()
        self._bg_box:animate(callback(nil, _G, "HUDBGBox_animate_open_center"), nil, w, open_done)
        bag_panel:set_size(w, h)
        bag_panel:set_center_x(scx)
        bag_panel:set_center_y(scy)
        wait(1)
        local TOTAL_T = 0.5
        local t = TOTAL_T
        while t > 0 do
            local dt = coroutine.yield()
            t = t - dt
            bag_panel:set_center_x(math.lerp(scx, ecx, 1 - t / TOTAL_T))
            bag_panel:set_center_y(math.lerp(scy, ecy, 1 - t / TOTAL_T))
        end
        bag_panel:set_size(w, h)
        bag_panel:set_center_x(ecx)
        bag_panel:set_center_y(ecy)

        local throw_instruction = self._temp_panel:child("throw_instruction")
        throw_instruction:set_visible(true)
        throw_instruction:set_bottom(bag_panel:top())
        throw_instruction:set_right(bag_panel:right())
    end
end

if pdth_hud.Options:GetValue("HUD/MainHud") then
    function HUDManager:set_mugshot_talk(id, active)
        if not id or not managers.hud._teammate_panels[id] then
            return
        end
        managers.hud._teammate_panels[id]._panel:child("talk"):set_visible(active)
        managers.hud._teammate_panels[id]._panel:child("talk"):set_color(Color.white)
    end

    function HUDManager:set_mugshot_voice(id, active)
        if not id or not managers.hud._teammate_panels[id] then
            return
        end
        managers.hud._teammate_panels[id]._panel:child("talk"):set_visible(active)
        managers.hud._teammate_panels[id]._panel:child("talk"):set_color(Color.yellow)
    end

    Hooks:PostHook(HUDManager, "add_waypoint", "PDTHHudset_mugshot_talk", function(self, id, data)
        self._hud.waypoints[id].arrow:set_color(Color.white)

        local distance = self._hud.waypoints[id].distance
        if distance then
            distance:set_color(Color(1, 1, 0.65882355, 0))
        end
    end)
end

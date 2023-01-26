if pdth_hud.Options:GetValue("HUD/Interaction") and not (Restoration and Restoration.options.restoration_hud_global) then
    local orig_hudhint_init = HUDHint.init
    function HUDHint:init(hud)
        orig_hudhint_init(self, hud)
        self._hud_panel = hud.panel
        local y = self._hud_panel:h() / 3.8
        self._hint_panel:set_center_y(y)
    end
end

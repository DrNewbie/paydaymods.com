CloneClass(HUDManager)
function HUDManager:_create_teammates_panel(hud)
	hud = hud or managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
	self._hud.teammate_panels_data = self._hud.teammate_panels_data or {}
	self._teammate_panels = {}
	if hud.panel:child("teammates_panel") then
		hud.panel:remove(hud.panel:child("teammates_panel"))
	end
	local h = self:teampanels_height()
	local teammates_panel = hud.panel:panel({
		name = "teammates_panel",
		h = h,
		y = hud.panel:h() - h,
		halign = "grow",
		valign = "bottom"
	})

	for i = 1, HUDManager.PLAYER_PANEL do
		local is_player = i == HUDManager.PLAYER_PANEL

		local teammate_w = is_player and 204 or 512
		self._hud.teammate_panels_data[i] = {
			taken = false,
			special_equipments = {}
		}
		local pw = teammate_w + (is_player and 128 or 64)
		local teammate = HUDTeammate:new(i, teammates_panel, is_player, pw)
		if is_player then
			teammate._panel:set_right(hud.panel:right())
		else
			local y = math.floor( 24 * (i - 1) + 14 )
			teammate._panel:set_y(y)			
		end
		table.insert(self._teammate_panels, teammate)
		if is_player then
			teammate:add_panel()
		end
	end
end
function HUDManager:align_panels()       
 	local size = CompactHUD.scale
    local hud = self:script(PlayerBase.PLAYER_INFO_HUD_PD2) 
    local teammates_panel = hud.panel:child("teammates_panel")
    teammates_panel:set_h((22 * size) * HUDManager.PLAYER_PANEL)
    teammates_panel:set_bottom(hud.panel:bottom())
    for i = 1, HUDManager.PLAYER_PANEL do 
        local is_player = i == HUDManager.PLAYER_PANEL
        if not is_player then
            local y = math.floor( (24 * size) * (HUDManager.PLAYER_PANEL - (i + 1)) - 2)
            if self._teammate_panels[i] then
                 self._teammate_panels[i]._panel:set_y(y)    
            end     
        end     
    end
end
function HUDManager:on_downed()
    self._hud_player_downed:on_downed()
    managers.hud._teammate_panels[managers.hud.PLAYER_PANEL]:on_downed()    
end
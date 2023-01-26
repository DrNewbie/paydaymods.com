if pdth_hud.Options:GetValue("HUD/MainHud") then
	local NetworkAccountSTEAMinventory_outfit_refresh = NetworkAccountSTEAM.inventory_outfit_refresh

	function NetworkAccountSTEAM:inventory_outfit_refresh()
		NetworkAccountSTEAMinventory_outfit_refresh(self)
	    if managers.hud and managers.hud._teammate_panels and managers.hud._teammate_panels[HUDManager.PLAYER_PANEL] and managers.hud._teammate_panels[HUDManager.PLAYER_PANEL].get_weapon_info then
	        managers.hud._teammate_panels[HUDManager.PLAYER_PANEL]:get_weapon_info()
	    end
	end
end

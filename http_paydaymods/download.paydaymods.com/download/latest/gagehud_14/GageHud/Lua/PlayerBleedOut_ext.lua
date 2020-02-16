local player_bleed_out_original = PlayerBleedOut._enter
function PlayerBleedOut:_enter(enter_data)
	managers.hud._teammate_panels[HUDManager.PLAYER_PANEL]:increment_downs()
	player_bleed_out_original(self, enter_data)
end
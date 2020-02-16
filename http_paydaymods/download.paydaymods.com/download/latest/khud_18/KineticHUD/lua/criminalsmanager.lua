Hooks:PostHook(CriminalsManager,"on_peer_left","peer_left_khud",function(self, peer_id, ...)
	KineticHUD:DownCounter_SetDowns(0,peer_id)
	KineticHUD.downcounter_nine_lives[peer_id] = 0
end)
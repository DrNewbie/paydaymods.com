Hooks:PostHook(TradeManager,"criminal_respawn","khud_criminal_respawn",function(self,pos,rotation,respawn_criminal)
	local peer_id = respawn_criminal.id
	KineticHUD:DownCounter_SetDowns(0,peer_id)
end)
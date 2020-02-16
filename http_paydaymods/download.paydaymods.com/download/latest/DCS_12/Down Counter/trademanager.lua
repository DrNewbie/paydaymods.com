Hooks:PostHook(TradeManager,"criminal_respawn","dcs_criminal_respawn",function(self,pos,rotation,respawn_criminal)
	local peer_id = respawn_criminal.id
	DownCounterStandalone.counter[peer_id] = 0
end)
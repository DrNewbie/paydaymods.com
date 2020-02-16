Hooks:PostHook(CriminalsManager,"on_peer_left","peer_left_dcs",function(self, peer_id, ...)
	DownCounterStandalone.counter[peer_id] = 0
	DownCounterStandalone.nine_lives[peer_id] = 0
--[[
	if peer_id == _G.DownCounterStandalone.king then
		DownCounterStandalone.king = 5
		LuaNetworking:SendToPeers(DownCounterStandalone.ModID, "I nominate myself as king of robots! Viva Robot Democracy!" )
	end
	--]]
end)
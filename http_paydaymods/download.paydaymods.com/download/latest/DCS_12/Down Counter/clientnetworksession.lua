local DownCounter = DownCounter or _G.DownCounterStandalone

Hooks:PostHook(ClientNetworkSession,"on_peer_synched","dcs_client_peeroptin",function(self, peer_id, ...)
	DownCounter:SendDownsData(peer_id)
end)

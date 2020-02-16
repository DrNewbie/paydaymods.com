Hooks:PostHook(ClientNetworkSession,"on_peer_synched","khud_client_peeroptin",function(self, peer_id, ...)
	KineticHUD:DownCounter_SendDownsData(peer_id)
end)
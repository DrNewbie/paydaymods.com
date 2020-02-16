Hooks:PostHook(HostNetworkSession,"on_peer_sync_complete","khud_host_peeroptin",function(self, peer, peer_id)
	KineticHUD:DownCounter_SendDownsData(peer_id)
end)
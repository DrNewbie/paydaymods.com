Hooks:PostHook(HostNetworkSession,"on_peer_sync_complete","dcs_host_peeroptin",function(self, peer, peer_id)
	DownCounterStandalone:SendDownsData(peer_id)
end)
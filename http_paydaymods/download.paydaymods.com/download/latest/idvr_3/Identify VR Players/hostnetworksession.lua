Hooks:PostHook(HostNetworkSession, "on_peer_sync_complete", "host_informvr" , function(self, peer, peer_id)
	if _G.IS_VR then
		managers.chat:send_message( 1, managers.network:session():local_peer(), "I am using VR!")
	end
end)

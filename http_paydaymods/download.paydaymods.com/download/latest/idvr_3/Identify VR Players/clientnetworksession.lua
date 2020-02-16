Hooks:PostHook(ClientNetworkSession,"on_peer_synched","client_informvr",function(self, peer_id, ...)
	if _G.IS_VR then 
		managers.chat:send_message( 1, managers.network:session():local_peer(), "I am using VR!" )
	end
end)

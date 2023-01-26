_G.mod_announces = _G.mod_announces or {}
table.insert(mod_announces, "Gensec Shotgunners")
table.sort(mod_announces)

Hooks:Add("NetworkManagerOnPeerAdded", "NetworkManagerOnPeerAdded_ModAnnounce", function(peer, peer_id)
	if Global.game_settings and Global.game_settings.permission == "public" and not Global.game_settings.single_player and Network:is_server() then
		DelayedCalls:Add("DelayedModAnnounces" .. tostring(peer_id), 2, function()
			local message = "I'm using these mods:\n- " .. table.concat(mod_announces, ",\n- ") .. "."
			local peer2 = managers.network:session() and managers.network:session():peer(peer_id)
			if peer2 then
				peer2:send("send_chat_message", ChatManager.GAME, message)
			end
		end)
	end
end)


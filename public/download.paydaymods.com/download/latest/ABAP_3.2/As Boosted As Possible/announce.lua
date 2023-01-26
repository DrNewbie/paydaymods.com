_G.mod_announces = _G.mod_announces or {}
table.insert(mod_announces, "A.B.A.P.(lets the player use any possible in-game boosts to any weapon)")
table.sort(mod_announces)
 
Hooks:Add("NetworkManagerOnPeerAdded", "NetworkManagerOnPeerAdded_ModAnnounce", function(peer, peer_id)
    if Network:is_server() then
        DelayedCalls:Add("DelayedModAnnounces" .. tostring(peer_id), 2, function()
            local message = "I am using the following mod:\n- " .. table.concat(mod_announces, ",\n- ") .. "."
            local peer2 = managers.network:session() and managers.network:session():peer(peer_id)
            if peer2 then
                peer2:send("send_chat_message", ChatManager.GAME, message)
            end
        end)
    end
end)
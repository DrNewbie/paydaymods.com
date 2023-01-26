
if InventoryChatAndPlayerStates_BaseNetworkSession_Hooked then
	return
else
	InventoryChatAndPlayerStates_BaseNetworkSession_Hooked = true
end

-- Warning: This potentially gets called before the game level is loaded (and the Lua environment reset) when connecting to a
-- game as a client (called to add the host). This case is handled in the MenuKitRenderer:_entered_menu() hook
local add_peer_actual = BaseNetworkSession.add_peer
function BaseNetworkSession:add_peer(name, rpc, in_lobby, loading, synched, id, ...)
	if InventoryChatAndPlayerStates ~= nil then
		InventoryChatAndPlayerStates.PeerStates[id] = {}
		InventoryChatAndPlayerStates:UpdatePlayerStates(id, nil)
	end

	return add_peer_actual(self, name, rpc, in_lobby, loading, synched, id, ...)
end

-- Apparently BLT's hook doesn't include the self param for whatever reason...
local function BaseNetworkSession__on_peer_removed(peer, peer_id, ...)
	if InventoryChatAndPlayerStates ~= nil then
		-- The player is disconnecting, delete their table
		InventoryChatAndPlayerStates.PeerStates[peer_id] = nil
		InventoryChatAndPlayerStates:UpdatePlayerStates(peer_id, nil)
	end
end
Hooks:Add("BaseNetworkSessionOnPeerRemoved", "InventoryChatAndPlayerStates_BaseNetworkSession__on_peer_removed", BaseNetworkSession__on_peer_removed)


if InventoryChatAndPlayerStates_HUDMissionBriefing_Hooked then
	return
else
	InventoryChatAndPlayerStates_HUDMissionBriefing_Hooked = true
end

-- Called indirectly from ConnectionNetworkHandler:lobby_info() when a remote player has fully connected, or when
-- HUDMissionBriefing opens for the local player (and also gets called for the host, if connecting as a client)
local set_player_slot_actual = HUDMissionBriefing.set_player_slot
function HUDMissionBriefing:set_player_slot(nr, ...)
	set_player_slot_actual(self, nr, ...)

	-- Not exactly sure why this happens since it *never* happens for me - not even once, but apparently it occurs for someone
	-- (probably the result of some other mod messing up and deviating from standard behavior >.> )
	-- http://forums.lastbullet.net/showthread.php?tid=1273&pid=5464#pid5464
	-- UPDATE: Apparently this occurs when this mod's MenuKitRenderer:_set_player_slot() hook doesn't get called, thanks to
	-- dive_bomber for providing the information I needed to track this issue down
	if InventoryChatAndPlayerStates ~= nil then
		-- This line is a failsafe for situations where the MenuKitRenderer:_set_player_slot() hook doesn't get called (usually
		-- if this mod's hook gets clobbered by another mod with a lower priority value)
		InventoryChatAndPlayerStates.PeerStates[nr] = InventoryChatAndPlayerStates.PeerStates[nr] or {}
		InventoryChatAndPlayerStates.PeerStates[nr].state = InventoryChatAndPlayerStates.StateValues.Connected
		InventoryChatAndPlayerStates:UpdatePlayerStates(nr, nil)
	end
end

-- Called from MenuKitRenderer:_entered_menu() and NetworkManager:on_peer_added()
local set_slot_joining_actual = HUDMissionBriefing.set_slot_joining
function HUDMissionBriefing:set_slot_joining(peer, peer_id, ...)
	set_slot_joining_actual(self, peer, peer_id, ...)

	if InventoryChatAndPlayerStates ~= nil then
		InventoryChatAndPlayerStates.PeerStates[peer_id].state = InventoryChatAndPlayerStates.StateValues.InitialJoin
		InventoryChatAndPlayerStates:UpdatePlayerStates(peer_id, nil)
	end
end

local set_slot_ready_actual = HUDMissionBriefing.set_slot_ready
function HUDMissionBriefing:set_slot_ready(peer, peer_id, ...)
	set_slot_ready_actual(self, peer, peer_id, ...)

	if InventoryChatAndPlayerStates ~= nil then
		-- If that player is able to send their ready state to the local player, consider them to be fully connected (will be
		-- stomped if necessary by HUDMissionBriefing:set_dropin_progress() below)
		InventoryChatAndPlayerStates.PeerStates[peer_id].ready = true
		InventoryChatAndPlayerStates.PeerStates[peer_id].state = InventoryChatAndPlayerStates.StateValues.Connected
		InventoryChatAndPlayerStates:UpdatePlayerStates(peer_id, nil)
	end
end

local set_slot_not_ready_actual = HUDMissionBriefing.set_slot_not_ready
function HUDMissionBriefing:set_slot_not_ready(peer, peer_id, ...)
	set_slot_not_ready_actual(self, peer, peer_id, ...)

	if InventoryChatAndPlayerStates ~= nil then
		-- If that player is able to send their ready state to the local player, consider them to be fully connected (will be
		-- stomped if necessary by HUDMissionBriefing:set_dropin_progress() below)
		InventoryChatAndPlayerStates.PeerStates[peer_id].ready = false
		InventoryChatAndPlayerStates.PeerStates[peer_id].state = InventoryChatAndPlayerStates.StateValues.Connected
		InventoryChatAndPlayerStates:UpdatePlayerStates(peer_id, nil)
	end
end

local set_dropin_progress_actual = HUDMissionBriefing.set_dropin_progress
function HUDMissionBriefing:set_dropin_progress(peer_id, progress_percentage, mode, ...)
	set_dropin_progress_actual(self, peer_id, progress_percentage, mode, ...)

	-- Optimization: Local accesses are faster than global lookups, cache the result of the initial global lookup. This still
	-- incurs at least one global lookup per call, but it's still dramatically less than before (six global lookups)
	local icaps = InventoryChatAndPlayerStates
	if icaps ~= nil then
		icaps.PeerStates[peer_id].state = mode == "join" and icaps.StateValues.Joining or icaps.StateValues.Streaming
		icaps.PeerStates[peer_id].progress = progress_percentage
		icaps:UpdatePlayerStates(peer_id, nil)
	end
end

local remove_player_slot_by_peer_id_actual = HUDMissionBriefing.remove_player_slot_by_peer_id
function HUDMissionBriefing:remove_player_slot_by_peer_id(peer, reason, ...)
	remove_player_slot_by_peer_id_actual(self, peer, reason, ...)

	if InventoryChatAndPlayerStates ~= nil then
		InventoryChatAndPlayerStates.PeerStates[peer:id()] = nil
		InventoryChatAndPlayerStates:UpdatePlayerStates(peer:id(), nil)
	end
end

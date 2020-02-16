
if AdaptiveStreamingChunkSize_PlayerManager_Hooked then
	return
else
	AdaptiveStreamingChunkSize_PlayerManager_Hooked = true
end

-- This only gets called for the local player, regardless of whether they are a host or client
local spawned_player_actual = PlayerManager.spawned_player
function PlayerManager:spawned_player(id, ...)
	-- But just in case...
	if id ~= 1 then
		log("[AdaptiveStreamingChunkSize] PlayerManager:spawned_player() | Warning: id is " .. tostring(id) .. " (expected 1), the streaming chunk KB setting will remain unchanged")
		return spawned_player_actual(self, id, ...)
	end

	local minimum = 128
	local AdaptiveStreamingChunkSize = _G.AdaptiveStreamingChunkSize
	if AdaptiveStreamingChunkSize ~= nil then
		minimum = AdaptiveStreamingChunkSize.Prefs.MinimumStreamingChunkSize
	else
		log("[AdaptiveStreamingChunkSize] PlayerManager:spawned_player() | Warning: AdaptiveStreamingChunkSize is nil, falling back to a default value of " .. tostring(minimum))
	end

	local usermanager = managers.user
	if usermanager ~= nil then
		usermanager:set_setting("max_streaming_chunk", minimum)
	else
		log("[AdaptiveStreamingChunkSize] PlayerManager:spawned_player() | Warning: managers.user is nil, the streaming chunk KB setting will remain unchanged")
	end
	return spawned_player_actual(self, id, ...)
end

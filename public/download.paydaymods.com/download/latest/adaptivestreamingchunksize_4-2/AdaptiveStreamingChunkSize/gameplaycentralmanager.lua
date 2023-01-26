
if AdaptiveStreamingChunkSize_GamePlayCentralManager_Hooked then
	return
else
	AdaptiveStreamingChunkSize_GamePlayCentralManager_Hooked = true
end

-- This is called just before the game is restarted for both hosts and clients, but not when the contract is terminated nor when
-- returning to the main menu / lobby
local stop_the_game_actual = GamePlayCentralManager.stop_the_game
function GamePlayCentralManager:stop_the_game(...)
	local maximum = 4096
	local AdaptiveStreamingChunkSize = _G.AdaptiveStreamingChunkSize
	if AdaptiveStreamingChunkSize ~= nil then
		maximum = AdaptiveStreamingChunkSize.Prefs.MaximumStreamingChunkSize
	end

	local usermanager = managers.user
	if usermanager ~= nil then
		usermanager:set_setting("max_streaming_chunk", maximum)
	else
		log("[AdaptiveStreamingChunkSize] GamePlayCentralManager:stop_the_game() | Warning: managers.user is nil, the streaming chunk KB setting will remain unchanged")
	end

	return stop_the_game_actual(self, ...)
end


if AdaptiveStreamingChunkSize_IngameLobbyMenuState_Hooked then
	return
else
	AdaptiveStreamingChunkSize_IngameLobbyMenuState_Hooked = true
end

-- As with MenuMainState:at_enter(), another shot in the dark here
local at_enter_actual = IngameLobbyMenuState.at_enter
function IngameLobbyMenuState:at_enter(...)
	local maximum = 4096
	local AdaptiveStreamingChunkSize = _G.AdaptiveStreamingChunkSize
	if AdaptiveStreamingChunkSize ~= nil then
		maximum = AdaptiveStreamingChunkSize.Prefs.MaximumStreamingChunkSize
	end

	local usermanager = managers.user
	if usermanager ~= nil then
		usermanager:set_setting("max_streaming_chunk", maximum)
	else
		log("[AdaptiveStreamingChunkSize] IngameLobbyMenuState:at_enter() | Warning: managers.user is nil, the streaming chunk KB setting will remain unchanged")
	end

	return at_enter_actual(self, ...)
end

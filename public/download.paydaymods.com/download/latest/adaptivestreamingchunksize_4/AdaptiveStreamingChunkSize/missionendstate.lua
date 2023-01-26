
if AdaptiveStreamingChunkSize_MissionEndState_Hooked then
	return
else
	AdaptiveStreamingChunkSize_MissionEndState_Hooked = true
end

-- This should fix the change not being triggered for Crime Spree hosts
local at_enter_actual = MissionEndState.at_enter
function MissionEndState:at_enter(...)
	local maximum = 4096
	local AdaptiveStreamingChunkSize = _G.AdaptiveStreamingChunkSize
	if AdaptiveStreamingChunkSize ~= nil then
		maximum = AdaptiveStreamingChunkSize.Prefs.MaximumStreamingChunkSize
	end

	local usermanager = managers.user
	if usermanager ~= nil then
		usermanager:set_setting("max_streaming_chunk", maximum)
	else
		log("[AdaptiveStreamingChunkSize] MissionEndState:at_enter() | Warning: managers.user is nil, the streaming chunk KB setting will remain unchanged")
	end

	return at_enter_actual(self, ...)
end

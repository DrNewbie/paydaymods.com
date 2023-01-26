
if AdaptiveStreamingChunkSize_MenuMainState_Hooked then
	return
else
	AdaptiveStreamingChunkSize_MenuMainState_Hooked = true
end

-- Bit of a shot in the dark here, not sure why Setup:init_finalize() doesn't seem to trigger the change for slidedrum... Perhaps
-- it's getting called too late? I'm not sure...  :S
local at_enter_actual = MenuMainState.at_enter
function MenuMainState:at_enter(...)
	local maximum = 4096
	local AdaptiveStreamingChunkSize = _G.AdaptiveStreamingChunkSize
	if AdaptiveStreamingChunkSize ~= nil then
		maximum = AdaptiveStreamingChunkSize.Prefs.MaximumStreamingChunkSize
	end

	local usermanager = managers.user
	if usermanager ~= nil then
		usermanager:set_setting("max_streaming_chunk", maximum)
	else
		log("[AdaptiveStreamingChunkSize] MenuMainState:at_enter() | Warning: managers.user is nil, the streaming chunk KB setting will remain unchanged")
	end

	return at_enter_actual(self, ...)
end

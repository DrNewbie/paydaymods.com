
if AdaptiveStreamingChunkSize_Setup_Hooked then
	return
else
	AdaptiveStreamingChunkSize_Setup_Hooked = true
end

-- This might be getting called far too late for restarts / transitions back to the main menu, so there are other hooks that
-- attempt to work around this limitation
local init_finalize_actual = Setup.init_finalize
function Setup:init_finalize(...)
	local maximum = 4096
	local AdaptiveStreamingChunkSize = _G.AdaptiveStreamingChunkSize
	if AdaptiveStreamingChunkSize ~= nil then
		maximum = AdaptiveStreamingChunkSize.Prefs.MaximumStreamingChunkSize
	end

	local usermanager = managers.user
	if usermanager ~= nil then
		usermanager:set_setting("max_streaming_chunk", maximum)
	else
		log("[AdaptiveStreamingChunkSize] Setup:init_finalize() | Warning: managers.user is nil, the streaming chunk KB setting will remain unchanged")
	end

	return init_finalize_actual(self, ...)
end

-- This is called when a heist is terminated and before the transition back to the main menu or lobby, both for hosts and clients
-- It is not called for restarts, see GamePlayCentralManager:stop_the_game() for those
local load_start_menu_actual = Setup.load_start_menu
function Setup:load_start_menu(...)
	local maximum = 4096
	local AdaptiveStreamingChunkSize = _G.AdaptiveStreamingChunkSize
	if AdaptiveStreamingChunkSize ~= nil then
		maximum = AdaptiveStreamingChunkSize.Prefs.MaximumStreamingChunkSize
	end

	local usermanager = managers.user
	if usermanager ~= nil then
		usermanager:set_setting("max_streaming_chunk", maximum)
	else
		log("[AdaptiveStreamingChunkSize] Setup:load_start_menu() | Warning: managers.user is nil, the streaming chunk KB setting will remain unchanged")
	end

	return load_start_menu_actual(self, ...)
end

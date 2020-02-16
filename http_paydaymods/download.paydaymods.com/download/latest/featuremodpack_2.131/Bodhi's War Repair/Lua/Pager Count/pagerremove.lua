local function _remove()
if KTweak_PagerNumber_C > 0 then
KTweak_PagerNumber_C = KTweak_PagerNumber_C - 1
end
end

if Utils:IsInGameState() and Utils:IsInHeist() then
if managers.groupai:state():whisper_mode() then
local UTILS_PAGERS = function() return BWROptions._data.utils_pagers end
local Net = _G.LuaNetworking
if Net:IsHost() or K_ClientSideCheck then
	if UTILS_PAGERS() then
	managers.chat:_receive_message(1, "REMOVE FAILED", "YOUR CURRENT PAGER COUNT IS SYNCED WITH THE SERVER", tweak_data.screen_color_green)
	end
else
	_remove()
	if UTILS_PAGERS() then
	local remaining = KTweak_PagerNumber_C or 0
	managers.chat:_receive_message(1, "Pagers Answered - CLIENT", tostring(remaining) .. " out of 4 (SUBTRACTED ONE)", tweak_data.screen_colors.stats_negative)
	end
end
end
end
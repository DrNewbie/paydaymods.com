
if LoadingScreenInfo_HostNetworkSession_Hooked then
	return
else
	LoadingScreenInfo_HostNetworkSession_Hooked = true
end

local load_level_actual = HostNetworkSession.load_level
function HostNetworkSession:load_level(...)
	if managers.network ~= nil and managers.network.matchmake ~= nil and managers.network:session() ~= nil then
		-- Counting the number of connected players manually as Steam's lobby data can sometimes incorrectly report the total
		-- number of players as 1, which is incorrect when there are connected players (should be >= 2 players). The bug usually
		-- occurs when the following sequence of events occurs:
		-- 1) Return to the lobby from a heist
		-- 2) Pick a new contract and start it with connected players
		local peers = 0
		for i = 1, managers.criminals and managers.criminals.MAX_NR_CRIMINALS or 4 do
			if managers.network:session():peer(i) ~= nil then
				peers = peers + 1
			end
		end

		local tmp = managers.network.matchmake.lobby_handler
		if alive(tmp) and tmp.get_lobby_data ~= nil then
			tmp = tmp:get_lobby_data()
			LoadingScreenInfo_OverrideData = {
				num_players = math.max(tonumber(tmp.num_players), peers),
				state = tweak_data ~= nil and tweak_data:server_state_to_index("loading") or 2
			}
		end
	end

	return load_level_actual(self, ...)
end

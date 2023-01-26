
if LoadingScreenInfo_ClientNetworkSession_Hooked then
	return
else
	LoadingScreenInfo_ClientNetworkSession_Hooked = true
end

-- Called from ConnectionNetworkHandler:ok_to_load_level() on clients
-- Server-side call stack:
-- 1)
-- HostNetworkSession:send_ok_to_load_level()
-- HostNetworkSession:load_level()
-- MenuCallbackHandler:start_the_game()
-- 2)
-- HostNetworkSession:send_ok_to_load_level()
-- HostStateInGame:on_join_request_received()
-- HostNetworkSession:on_join_request_received()
local ok_to_load_level_actual = ClientNetworkSession.ok_to_load_level
function ClientNetworkSession:ok_to_load_level(load_counter, ...)
	if self._closing or self._received_ok_to_load_level or self._load_counter == load_counter then
		return ok_to_load_level_actual(self, load_counter, ...)
	end

	ok_to_load_level_actual(self, load_counter, ...)

	if managers.network ~= nil and managers.network.matchmake ~= nil and managers.network:session() ~= nil then
		-- Counting the number of connected players manually as Steam's lobby data can sometimes incorrectly report the total
		-- number of players as 1, which is obviously incorrect when connected as a client (should be >= 2 players). The bug
		-- usually occurs when the following sequence of events occurs:
		-- 1) Return to the lobby from a heist
		-- 2) Host picks a new contract and starts it
		local peers = 0
		for i = 1, managers.criminals and managers.criminals.MAX_NR_CRIMINALS or 4 do
			if managers.network:session():peer(i) ~= nil then
				peers = peers + 1
			end
		end

		local tmp = managers.network.matchmake.lobby_handler
		if not alive(tmp) or tmp.get_lobby_data == nil then
			-- No active lobby
			return
		end
		tmp = tmp:get_lobby_data()
		LoadingScreenInfo_OverrideData = {
			num_players = math.max(tonumber(tmp.num_players), peers),
			-- FIXME: This isn't always accurate (e.g. when joining games that are already in progress)
			state = tweak_data ~= nil and tweak_data:server_state_to_index("loading") or 2
		}
	end
end


if TranslucentMissionBriefingGUI_GamePlayCentralManager_Hooked then
	return
else
	TranslucentMissionBriefingGUI_GamePlayCentralManager_Hooked = true
end

-- This is called just before the game is restarted for both hosts and clients, but not when the contract is terminated nor when
-- returning to the main menu / lobby
local stop_the_game_actual = GamePlayCentralManager.stop_the_game
function GamePlayCentralManager:stop_the_game(...)
	-- The game does not call IngameWaitingForPlayersState:at_exit() by default, force it to do so in order to allow for proper
	-- cleanup. This change apparently resolves the untraceable spontaneous crash in native code when returning to the menu, and
	-- hopefully any others like itself *fingers crossed*. This change also appears to be more important than the similar one in
	-- Setup:load_start_menu() as testing shows that even that change alone is not able to prevent a native crash
	local gsm = _G.game_state_machine
	local state = gsm and gsm:current_state() or nil
	if state ~= nil and state:name() == "ingame_waiting_for_players" and type(state.tmbgui_at_exit) == "function" then
		-- Call to the mod-specific variant of IngameWaitingForPlayersState:at_exit() instead to avoid inadvertently causing
		-- other issues or breaking other mods
		state:tmbgui_at_exit()
	end

	return stop_the_game_actual(self, ...)
end

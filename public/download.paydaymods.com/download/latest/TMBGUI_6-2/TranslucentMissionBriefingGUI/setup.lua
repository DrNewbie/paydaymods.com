
if TranslucentMissionBriefingGUI_Setup_Hooked then
	return
else
	TranslucentMissionBriefingGUI_Setup_Hooked = true
end

-- This is called when a heist is terminated and before the transition back to the main menu or lobby, both for hosts and clients
-- It is not called for restarts, see GamePlayCentralManager:stop_the_game() for those
local load_start_menu_actual = Setup.load_start_menu
function Setup:load_start_menu(...)
	-- The game does not call IngameWaitingForPlayersState:at_exit() by default, force it to do so in order to allow for proper
	-- cleanup
	local gsm = _G.game_state_machine
	local state = gsm and gsm:current_state() or nil
	if state ~= nil and state:name() == "ingame_waiting_for_players" and type(state.tmbgui_at_exit) == "function" then
		-- Call to the mod-specific variant of IngameWaitingForPlayersState:at_exit() instead to avoid inadvertently causing
		-- other issues or breaking other mods
		state:tmbgui_at_exit()
	end

	return load_start_menu_actual(self, ...)
end

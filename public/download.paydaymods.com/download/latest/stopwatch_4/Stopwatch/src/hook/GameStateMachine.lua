local Records = _G.StopwatchMod.Records

Hooks:PostHook(GameStateMachine, "change_state", "Stopwatch_GameStateMachine_Post_change_state", function(_, state)
    if state._name == "victoryscreen" and Network:is_server() then
        Records:completeLevel()
	elseif state._name == "gameoverscreen" or state._name == "menu_main" or state._name == "ingame_lobby_menu" then
        Records:clearPending()
    end
end)

if InventoryChatAndPlayerStates_NetworkMatchMakingSTEAM_Hooked then
	return
else
	InventoryChatAndPlayerStates_NetworkMatchMakingSTEAM_Hooked = true
end

-- This gets called on both hosts and clients, albeit with a short (< 1 second) delay for the former
local _on_data_update_actual = NetworkMatchMakingSTEAM._on_data_update
function NetworkMatchMakingSTEAM._on_data_update(lobby_data, ...)
	local InventoryChatAndPlayerStates = _G.InventoryChatAndPlayerStates
	local game_state_machine = _G.game_state_machine
	if InventoryChatAndPlayerStates ~= nil and game_state_machine ~= nil and game_state_machine:current_state_name() == "menu_main" then
		InventoryChatAndPlayerStates:StoreJobData(lobby_data)
	end

	return _on_data_update_actual(lobby_data, ...)
end

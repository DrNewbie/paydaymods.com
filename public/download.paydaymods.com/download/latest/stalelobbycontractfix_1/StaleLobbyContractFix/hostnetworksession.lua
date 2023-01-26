
if _G.StaleLobbyContractFix then
	return
else
	_G.StaleLobbyContractFix = true
end

-- This gets called at various points, including the mission briefing GUI and menu lobby (after completing / terminating a
-- contract)
local chk_server_joinable_state_actual = HostNetworkSession.chk_server_joinable_state
function HostNetworkSession:chk_server_joinable_state(...)
	chk_server_joinable_state_actual(self, ...)

	-- From HostNetworkSession:on_load_complete()
	if Global.load_start_menu_lobby and MenuCallbackHandler ~= nil then
		-- Force a server attributes refresh so that completed / terminated contracts do not continue to be sent to prospective
		-- clients. Verify the change by inspecting the table returned by MenuCallbackHandler:get_matchmake_attributes() before
		-- and after the following calls
		MenuCallbackHandler:update_matchmake_attributes()
		MenuCallbackHandler:_on_host_setting_updated()
	end
end

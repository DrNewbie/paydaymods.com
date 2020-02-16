
--todo use "taser_unit" to determine whether status is "tased" or "electrocuted" (eg. with safe house nightmare Tase Jump effect)
--probably more reliable? idk, this works fine for now though

Hooks:PreHook(PlayerTased,"enter","khud_enter_tased",function(self,state_data,enter_data)
	if state_data.non_lethal_electrocution then
		local recover_time = Application:time() + tweak_data.player.damage.TASED_TIME * managers.player:upgrade_value("player", "electrocution_resistance_multiplier", 1)
		managers.player:add_buff("electrocuted",{end_t = recover_time}) --nonlethal tase uses end time
	else
		local tased_time = tweak_data.player.damage.TASED_TIME
		tased_time = managers.modifiers:modify_value("PlayerTased:TasedTime", tased_time)
		managers.player:add_buff("tased",{duration = tased_time,flash = true,text_color = Color("FF2E2E")}) --but lethal tase uses duration
	end
end)
--[[
function PlayerTased:_on_tased_event(taser_unit, tased_unit)
		managers.player:add_buff("tased") --not gonna use this since it doesn't also show tased time
end--]]

Hooks:PostHook(PlayerTased,"on_tase_ended","khud_on_tase_ended",function(self)
	managers.player:remove_buff("tased")
	managers.player:remove_buff("electrocuted")
	--remove electrocuted? not sure if electrocution uses this callback
--todo check self._fatal_delayed_clbk
end)
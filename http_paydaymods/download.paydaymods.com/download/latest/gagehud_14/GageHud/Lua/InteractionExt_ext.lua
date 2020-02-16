if not mod_collection then
	return
end

local SHOW_TIMERS = mod_collection._data.show_timers

if SHOW_TIMERS then
	local MissionDoorDeviceInteractionExt_check_for_upgrade_original = MissionDoorDeviceInteractionExt.check_for_upgrade

	function MissionDoorDeviceInteractionExt:check_for_upgrade(...)
		local u_base = self._unit:base()
		local timer_gui = self._unit:timer_gui()
		if timer_gui and timer_gui:is_visible() and u_base and timer_gui._upgrade_tweak_data and u_base.get_skill_upgrades then
			local unit_info_table = u_base:get_skill_upgrades()
			local can_upgrade = false
			for i in pairs(self:split_info_id(self:get_player_info_id())) do
				if not unit_info_table[i] then
					can_upgrade = true
					break
				end
			end
			local list_item = managers.hud:hud_list("left_side_list"):item("timers"):item("timer_" .. tostring(self._unit:key()))
			if list_item then
				list_item:set_can_upgrade(can_upgrade)
			end
		end
		
		return MissionDoorDeviceInteractionExt_check_for_upgrade_original(self, ...)
	end
end

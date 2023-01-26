--unused

--[[
Hooks:PostHook(PlayerInventory,"_start_jammer_effect","khud_playerinventory_start_jammer",function(self,end_time,...)
	local unit = self._unit
	local jammer_data = self._jammer_data
	
end)
Hooks:PostHook(PlayerInventory,"_stop_jammer_effect","khud_playerinventory_stop_jammer",function(self,...)
	local unit = self._unit
end)
Hooks:PostHook(PlayerInventory,"_start_feedback_effect","khud_playerinventory_start_feedback",function(self,end_time,interval,range,...)
	local unit = self._unit
	local jammer_data = self._jammer_data
	local example = {
		effect = "feedback",
		t = end_time,
		interval = interval or 1.5,
		range = range or 2500,
		sound = "some_stuff_i_dont_care_about",
		heal = "bool",
		dodge_kills = "table[key] - -> value"
	}
	local is_player = managers.player:player_unit() == self._unit
	
	
end)
Hooks:PostHook(PlayerInventory,"_stop_feedback_effect","khud_playerinventory_stop_feedback",function(self,...)
	local unit = self._unit
end)

Hooks:PostHook(PlayerInventory,"_do_feedback","khud_playerinventory_do_feedback",function(self,...)
	local unit = self._unit
	local example = {
		t = num,
		interval = num
	}
	local position = self._unit:position()
	--range is always 2500 for this one
end)

--]]
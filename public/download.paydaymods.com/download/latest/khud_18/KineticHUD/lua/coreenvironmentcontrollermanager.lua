Hooks:PostHook(CoreEnvironmentControllerManager,"set_flashbang","khud_environmentalcontroller_setflashbang",function(self,flashbang_pos, line_of_sight, travel_dis, linear_dis, duration)
	managers.player:add_buff("flashbang",{duration = self._current_flashbang})
end)
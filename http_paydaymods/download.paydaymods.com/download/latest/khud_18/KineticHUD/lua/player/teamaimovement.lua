Hooks:PostHook(TeamAIMovement,"_upd_location","khud_huskteamai_updlocation",function(self)
	local t = Application:time()
	local check_interval = 1 + math.random(0.5)
	if KineticHUD:UseCartographer() then 
		self._last_checked_map_t = self._last_checked_map_t or 0
		if self._last_checked_map_t + check_interval <= t then

			local panel = managers.criminals:character_data_by_unit(self._unit)
			local leveldata = managers.job:current_level_data()
			local level_name = leveldata and leveldata.name_id

			local cartographer_data = KineticHUD:GetCartographerData()
			local map = cartographer_data and cartographer_data[level_name]

			if panel then
				local panel_id = panel.panel_id
				local result = KineticHUD:get_map_location_from_position(self:m_pos(),map)
				if result then 
					managers.hud:set_subregion(result,panel_id)
				end
				self._last_checked_map_t = t	
				
--				KineticHUD:c_log(self:get_location_id(),"TeamAIMovement:get_location_id()")
			end
		end
	end
--	KineticHUD:c_log("upd_location",nav_seg_id)
--	KineticHUD:c_log("upd_location",self:m_pos())
end)
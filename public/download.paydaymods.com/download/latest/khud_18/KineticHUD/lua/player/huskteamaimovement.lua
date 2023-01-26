Hooks:PostHook(HuskTeamAIMovement,"upd_actions","khud_teamai_updmove",function(self,t)

--[[ it was worth a shot
	local attach_bone = Idstring("Head")
	local bone_hand = unit:get_object(attach_bone)
	local squiggly = bone_hand:position()
	mvector3.add(squiggly,Vector3(math.sin(t),math.cos(t),math.sin(t)))
	bone_hand:set_position(squiggly)
	-]]

	local t = Application:time()
	local check_interval = 1 + math.random(0.25) --just a small delay so it doesn't occur run the loop three times at the same time for all teammates
	if KineticHUD:UseCartographer() then 
		self._last_checked_map_t = self._last_checked_map_t or 0
		if self._last_checked_map_t + check_interval <= t then
		
			local panel = managers.criminals:character_data_by_unit(self._unit)
			local leveldata = managers.job:current_level_data()
			local level_name = leveldata and leveldata.name_id

			local cartographer_data = KineticHUD:GetCartographerData()
			local map = cartographer_data and cartographer_data[level_name] or cartographer_data[level_data.name_id]
					
			if panel then
				local panel_id = panel.panel_id
				local result = KineticHUD:get_map_location_from_position(self:m_pos(),map)
				if result then 
					managers.hud:set_subregion(result,panel_id)
				end
				self._last_checked_map_t = t
				--[[ broken prob because ai don't use the same nav trackers
				if KineticHUD:UseNavSurfaces() and not result then 
					local nav_location = self:get_location_id()
					if nav_location then 
						managers.hud:set_subregion(nav_location,panel_id)
					elseif self._nav_tracker then 
						local _standing_nav_seg_id = self._standing_nav_seg_id or self._nav_tracker():nav_segment()
						local metadata = managers.navigation:get_nav_seg_metadata(_standing_nav_seg_id)
						local location_id = metadata.location_id
						managers.hud:set_subregion(location_id,panel_id)
					end
				end
				--]]
--				KineticHUD:c_log(self:get_location_id(),"TeamAIMovement:get_location_id()")
			end
			
		end
	end
end)

Hooks:PostHook(PlayerMovement,"_change_stamina","khud_change_stamina",function(self,value)
	local max_value = self:_max_stamina()
	local stamina = self._stamina
	managers.hud:set_khud_stamina(stamina,max_value)
end)

--todo feet trails for early supporters?

Hooks:PostHook(PlayerMovement,"update","khud_playermovement_update",function(self,unit,t,dt)

--	local peer_id = managers.network and managers.network:session() and managers.network:session():local_peer():id()
	local check_interval = 0.5 --seconds between location checks
--	local camera = managers.player:local_player():camera() --fpscameraplayerbase
	local rotlook = self:m_head_rot()
	managers.hud:set_debug_look(rotlook)
	local vecpos = self:m_pos()
	local result
	managers.hud:set_debug_coords(vecpos)
	if KineticHUD:UseCartographer() then 
		if KineticHUD:IsDebugEnabled() and #KineticHUD.cartographer_data_temp > 0 then 
--			local temp = KineticHUD.cartographer_data_temp[KineticHUD.temp_cartographer_selected]
			for k,v in pairs(KineticHUD.cartographer_data_temp) do 
				local debug_color = Color.blue
				result = KineticHUD:get_map_location_from_position(vecpos,KineticHUD.cartographer_data_temp)
				if result == v.location then
					debug_color = Color.green
					managers.hud:set_subregion(result)
				elseif (v.x_lower > v.x_upper) or (v.y_lower > v.y_upper) or (v.z_lower > v.z_upper) then
					debug_color = Color.red
				elseif k == KineticHUD.temp_cartographer_selected then 
					debug_color = Color.white
				end
				
				local w = math.abs(v.x_upper - v.x_lower) / 2
				local l = math.abs(v.y_upper - v.y_lower) / 2
				local h = math.abs(v.z_upper - v.z_lower) / 2
				local center = Vector3(v.x_upper - (w / 1),v.y_upper - (l / 1),v.z_upper - (h / 1))
				
				Draw:brush(debug_color:with_alpha(0.2)):box(center,Vector3(w,0,0),Vector3(0,l,0),Vector3(0,0,h))		
			end

--		Draw:brush(Color.blue:with_alpha(0.4)):box(vecpos,Vector3(50,0,0),Vector3(0,50,0),Vector3(0,0,100))
			if not result then 
				managers.hud:set_subregion("[NONE]")
			end
	
			return
		elseif not (KineticHUD:UseNavSurfaces() and managers.hud:get_player_location()) then
			self._last_checked_map_t = self._last_checked_map_t or 0
			if self._last_checked_map_t + check_interval <= t then
				local level_data = managers.job:current_level_data()
				if level_data then 
					local level_name = managers.localization:text(level_data.name_id) --great for when different levels have the same name
						
					local cartographer_data = KineticHUD:GetCartographerData()
					local map = cartographer_data and cartographer_data[level_name] or cartographer_data[level_data.name_id]
					
					result = KineticHUD:get_map_location_from_position(vecpos,map)
				else
					--self._last_checked_map_t = math.huge --disable checking if no level data found
				end

				if result then 
					managers.hud:set_subregion(result)
				end
				self._last_checked_map_t = t
			else
				
			end
		end
	end
end)

Hooks:PostHook(PlayerMovement,"on_morale_boost","khud_on_inspire_basic_event",function(self,benefactor_unit) --inspire basic buff (receive)
--this status buff is added with its own network signal/playermovement function for some reason,
--instead of being with the rest of the buffs in playermanager._properties
	managers.player:add_buff("morale_boost",{end_t = TimerManager:game():time() + tweak_data.upgrades.morale_boost_time})
--this gives move speed AND reload speed apparently so i'm just gonna show that you have the inspire bonus rather than clutter the HUD	
	
--			move_speed_bonus = tweak_data.upgrades.morale_boost_speed_bonus,
--			suppression_resistance = tweak_data.upgrades.morale_boost_suppression_resistance,
--			reload_speed_bonus = tweak_data.upgrades.morale_boost_reload_speed_bonus
end)
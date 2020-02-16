if not InspirePriority then
	InspirePriority = InspirePriority or class()
	InspirePriority._downs = 0
	
	
	function InspirePriority:increaseDowns()
		self._downs = self._downs + 1
	end

	function InspirePriority:resetDowns()
		self._downs = 0
	end

	function InspirePriority:WantUseMedicBag(unit)
		return InspirePriorityMenu._data.toggle_inspirepriority_reenable_medic_value == true and self:IsMedicBag(unit) and self._downs >= (InspirePriorityMenu._data.multi_inspirepriority_reenable_medic_downs_value - 1)
	end

	function InspirePriority:WantReviveManually(revive_unit)
		if InspirePriorityMenu._data.toggle_inspirepriority_reenable_revive_value == true and revive_unit and ((revive_unit.character_damage and revive_unit:character_damage() and revive_unit:character_damage().need_revive and revive_unit:character_damage():need_revive()) or (revive_unit.base and revive_unit:base() and revive_unit:base().is_husk_player and revive_unit:interaction():active() and revive_unit:movement():need_revive() and revive_unit:movement():current_state_name() ~= "arrested")) then
			local timer
			if revive_unit:base().is_local_player then
				timer = revive_unit:character_damage()._downed_timer
			elseif revive_unit:interaction().get_waypoint_time then
				timer = revive_unit:interaction():get_waypoint_time()
			end
			return (timer and timer <= InspirePriorityMenu._data.slider_inspirepriority_reenable_revive_secs_value)
		end
		return false
	end
	
	function InspirePriority:IsMedicBag(unit)
		return (unit and alive(unit) and unit.name and unit:name() == Idstring("units/payday2/equipment/gen_equipment_medicbag/gen_equipment_medicbag"))
	end
	
	function InspirePriority:NotDowned(unit)
		return InspirePriorityMenu._data.toggle_inspirepriority_shout_priority_value == true and unit and ((unit.character_damage and unit:character_damage() and unit:character_damage().need_revive and not unit:character_damage():need_revive()) or (unit.base and unit:base() and unit:base().is_husk_player and not unit:movement():need_revive()))
	end
	
	function InspirePriority:WantInspire()
		if not self:is_steel_sight_pressed() or InspirePriorityMenu._data.toggle_inspirepriority_steel_sight_reenable_value == false then
			if not self._ext_movement:downed() then
				if not managers.groupai:state():whisper_mode() then
					local criminals = managers.groupai:state():all_char_criminals()
					for u_key, u_data in pairs( criminals ) do
						local rally_skill_data = self._ext_movement:rally_skill_data()
						if rally_skill_data and rally_skill_data.long_dis_revive and rally_skill_data.range_sq > mvector3.distance_sq( self._pos, u_data.m_pos ) then
							local needs_revive
							if u_data.unit:base().is_husk_player then
								needs_revive = u_data.unit:interaction():active() and u_data.unit:movement():need_revive() and u_data.unit:movement():current_state_name() ~= "arrested"
							else
								needs_revive = u_data.unit:character_damage():need_revive()
							end
							if needs_revive then
								return true
							end
						end
					end
				end
			end
		end
		return false
	end
	
	function InspirePriority:update(v_ext_movement, v_pos)
		self._ext_movement = v_ext_movement
		self._pos = v_pos
	end
	function InspirePriority:setSteelsightPressed(pressed)
		self._steel_sight_pressed = pressed
	end
	function InspirePriority:is_steel_sight_pressed()
		return self._steel_sight_pressed
	end
	
	
	function InspirePriority:SendChatMessage(name, message, color)
		if message == false then
			message = "false"
		elseif message == true then
			message = "true"
		end
		if not tostring(color):find('Color') then
			color = nil
		end
		message = tostring(message)
		if managers and managers.chat and managers.chat._receivers and managers.chat._receivers[1] then
			for __, rcvr in pairs(managers.chat._receivers[1]) do
				rcvr:receive_message(name or "*", message, color or tweak_data.chat_colors[5]) 
			end  
		end
	end
end
if RequiredScript == "lib/units/beings/player/states/playerstandard" then
	local IP_update_original = PlayerStandard.update
	local IP_get_unit_intimidation_action_original = PlayerStandard._get_unit_intimidation_action
	local IP_start_action_intimidate_original = PlayerStandard._start_action_intimidate
	local IP_check_action_steelsight_original = PlayerStandard._check_action_steelsight
	
	function PlayerStandard:update(t, dt)
		InspirePriority:update(self._ext_movement, self._pos)
		return IP_update_original(self, t, dt)
	end

	function PlayerStandard:_get_unit_intimidation_action( intimidate_enemies, intimidate_civilians, intimidate_teammates, only_special_enemies, intimidate_escorts, intimidation_amount, primary_only, detect_only )
		if InspirePriorityMenu._data.toggle_inspirepriority_shout_priority_value == true then
			if not self._ext_movement:downed() then
				if ( intimidate_enemies or intimidate_civilians ) then
					if ( intimidate_teammates ) then
						local criminals = managers.groupai:state():all_char_criminals()
						for u_key, u_data in pairs( criminals ) do
							local rally_skill_data = self._ext_movement:rally_skill_data()
							if rally_skill_data and rally_skill_data.long_dis_revive and rally_skill_data.range_sq > mvector3.distance_sq( self._pos, u_data.m_pos ) then
								local needs_revive
								if u_data.unit:base().is_husk_player then
									needs_revive = u_data.unit:interaction():active() and u_data.unit:movement():need_revive() and u_data.unit:movement():current_state_name() ~= "arrested"
								else
									needs_revive = u_data.unit:character_damage():need_revive()
								end
								if needs_revive then
										intimidate_enemies = false
										intimidate_civilians = false
								end
							end
						end
					end
				end
			end
		end
		return IP_get_unit_intimidation_action_original( self, intimidate_enemies, intimidate_civilians, intimidate_teammates, only_special_enemies, intimidate_escorts, intimidation_amount, primary_only, detect_only )
	end

	function PlayerStandard:_start_action_intimidate(t)
		if not self._intimidate_t or t - self._intimidate_t > tweak_data.player.movement_state.interaction_delay then
			local skip_alert = managers.groupai:state():whisper_mode()
			local voice_type, plural, prime_target = self:_get_unit_intimidation_action(true, true, true, false, true, nil, nil, nil)
			local interact_type, sound_name
			local sound_suffix = plural and "plu" or "sin"
			if voice_type == "stop" then
				interact_type = "cmd_stop"
				sound_name = "f02x_" .. sound_suffix
			elseif voice_type == "stop_cop" then
				interact_type = "cmd_stop"
				sound_name = "l01x_" .. sound_suffix
			elseif voice_type == "mark_cop" or voice_type == "mark_cop_quiet" then
				interact_type = "cmd_point"
				if voice_type == "mark_cop_quiet" then
					sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].silent_priority_shout .. "_any"
				else
					sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].priority_shout .. "x_any"
				end
				if managers.player:has_category_upgrade("player", "special_enemy_highlight") then
					prime_target.unit:contour():add(managers.player:has_category_upgrade("player", "marked_enemy_extra_damage") and "mark_enemy_damage_bonus" or "mark_enemy", true, managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1))
				end
			elseif voice_type == "down" then
				interact_type = "cmd_down"
				sound_name = "f02x_" .. sound_suffix
				self._shout_down_t = t
			elseif voice_type == "down_cop" then
				interact_type = "cmd_down"
				sound_name = "l02x_" .. sound_suffix
			elseif voice_type == "cuff_cop" then
				interact_type = "cmd_down"
				sound_name = "l03x_" .. sound_suffix
			elseif voice_type == "down_stay" then
				interact_type = "cmd_down"
				if self._shout_down_t and t < self._shout_down_t + 2 then
					sound_name = "f03b_any"
				else
					sound_name = "f03a_" .. sound_suffix
				end
			elseif voice_type == "come" then
				interact_type = "cmd_come"
				local static_data = managers.criminals:character_static_data_by_unit(prime_target.unit)
				if static_data then
					local character_code = static_data.ssuffix
					sound_name = "f21" .. character_code .. "_sin"
				else
					sound_name = "f38_any"
				end
			elseif voice_type == "revive" then
				interact_type = "cmd_get_up"
				local static_data = managers.criminals:character_static_data_by_unit(prime_target.unit)
				if not static_data then
					return
				end
				local character_code = static_data.ssuffix
				sound_name = "f36x_any"
				if math.random() < self._ext_movement:rally_skill_data().revive_chance then
					prime_target.unit:interaction():interact(self._unit)
				elseif InspirePriorityMenu._data.toggle_inspirepriority_fail_message_value == true then
					if InspirePriorityMenu._data.toggle_inspirepriority_fail_message_vulgar_value == false then
						InspirePriority:SendChatMessage("[InspirePriority]", managers.localization:text("inspirepriority_fail_message_regular"), Color(1, 255, 0, 0))
					else
						local rnd_message = math.random()
						if rnd_message < 0.2 then
							InspirePriority:SendChatMessage("[InspirePriority]", managers.localization:text("inspirepriority_fail_message_vulgar0"), Color(1, 255, 0, 0))
						elseif rnd_message < 0.4 then
							InspirePriority:SendChatMessage("[InspirePriority]", managers.localization:text("inspirepriority_fail_message_vulgar1"), Color(1, 255, 0, 0))
						elseif rnd_message < 0.6 then
							InspirePriority:SendChatMessage("[InspirePriority]", managers.localization:text("inspirepriority_fail_message_vulgar2"), Color(1, 255, 0, 0))
						elseif rnd_message < 0.8 then
							InspirePriority:SendChatMessage("[InspirePriority]", managers.localization:text("inspirepriority_fail_message_vulgar3"), Color(1, 255, 0, 0))
						else
							InspirePriority:SendChatMessage("[InspirePriority]", managers.localization:text("inspirepriority_fail_message_vulgar4"), Color(1, 255, 0, 0))
						end
					end
				end
				self._ext_movement:rally_skill_data().morale_boost_delay_t = managers.player:player_timer():time() + (self._ext_movement:rally_skill_data().morale_boost_cooldown_t or 3.5)
			elseif voice_type == "boost" then
				interact_type = "cmd_gogo"
				local static_data = managers.criminals:character_static_data_by_unit(prime_target.unit)
				if not static_data then
					return
				end
				local character_code = static_data.ssuffix
				sound_name = "g18"
				self._ext_movement:rally_skill_data().morale_boost_delay_t = managers.player:player_timer():time() + (self._ext_movement:rally_skill_data().morale_boost_cooldown_t or 3.5)
			elseif voice_type == "escort" then
				interact_type = "cmd_point"
				sound_name = "f41_" .. sound_suffix
			elseif voice_type == "escort_keep" or voice_type == "escort_go" then
				interact_type = "cmd_point"
				sound_name = "f40_any"
			elseif voice_type == "bridge_codeword" then
				sound_name = "bri_14"
				interact_type = "cmd_point"
			elseif voice_type == "bridge_chair" then
				sound_name = "bri_29"
				interact_type = "cmd_point"
			elseif voice_type == "undercover_interrogate" then
				sound_name = "f46x_any"
				interact_type = "cmd_point"
			elseif voice_type == "undercover_escort" then
				sound_name = "f41_any"
				interact_type = "cmd_point"
			elseif voice_type == "mark_camera" then
				sound_name = "f39_any"
				interact_type = "cmd_point"
				prime_target.unit:contour():add("mark_unit", true)
			elseif voice_type == "mark_turret" then
				sound_name = "f44x_any"
				interact_type = "cmd_point"
				prime_target.unit:contour():add(managers.player:has_category_upgrade("player", "marked_enemy_extra_damage") and "mark_unit_dangerous_damage_bonus" or "mark_unit_dangerous", true, managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1))
			end
			self:_do_action_intimidate(t, interact_type, sound_name, skip_alert)
		end
	end
	
	function PlayerStandard:_add_unit_to_char_table(char_table, unit, unit_type, interaction_dist, interaction_through_walls, tight_area, priority, my_head_pos, cam_fwd, ray_ignore_units)
		if unit:unit_data().disable_shout and not unit:brain():interaction_voice() then
			return
		end
		if InspirePriority:WantInspire() and InspirePriority:NotDowned(unit) then
			return
		end
		local u_head_pos = unit_type == 3 and unit:base():get_mark_check_position() or unit:movement():m_head_pos() + math.UP * 30
		local vec = u_head_pos - my_head_pos
		local dis = mvector3.normalize(vec)
		local max_dis = interaction_dist
		if dis < max_dis then
			local max_angle = math.max(8, math.lerp(tight_area and 30 or 90, tight_area and 10 or 30, dis / 1200))
			if InspirePriority:WantInspire() and InspirePriorityMenu._data.toggle_inspirepriority_disable_interaction_value then
				if dis < 100. then
					max_angle = 360.
				elseif dis < 300 and max_angle < 60. then
					max_angle = 60.
				end
			end
			local angle = vec:angle(cam_fwd)
			if max_angle > angle then
				local ing_wgt = dis * dis * (1 - vec:dot(cam_fwd)) / priority
				if interaction_through_walls then
					table.insert(char_table, {
						unit = unit,
						inv_wgt = ing_wgt,
						unit_type = unit_type
					})
				else
					local ray = World:raycast("ray", my_head_pos, u_head_pos, "slot_mask", self._slotmask_AI_visibility, "ray_type", "ai_vision", "ignore_unit", ray_ignore_units or {})
					if not ray or 30 > mvector3.distance(ray.position, u_head_pos) then
						table.insert(char_table, {
							unit = unit,
							inv_wgt = ing_wgt,
							unit_type = unit_type
						})
					end
				end
			end
		end
	end
	
	function PlayerStandard:_check_action_steelsight(t, input)
		if input.btn_steelsight_press then
			InspirePriority:setSteelsightPressed(true)
		elseif input.btn_steelsight_release then
			InspirePriority:setSteelsightPressed(false)
		end
		return IP_check_action_steelsight_original(self, t, input)
	end
elseif RequiredScript == "lib/managers/objectinteractionmanager" then
	local IP_interact_original = ObjectInteractionManager.interact
	function ObjectInteractionManager:interact(player)
		if InspirePriorityMenu._data.toggle_inspirepriority_disable_interaction_value == true and InspirePriority:WantInspire() and not InspirePriority:WantUseMedicBag(self._active_unit) and not InspirePriority:WantReviveManually(self._active_unit) then
			return false
		else
			return IP_interact_original(self, player)
		end
	end
elseif RequiredScript == "lib/units/beings/player/states/playerbleedout" then
	Hooks:PostHook(PlayerBleedOut, '_enter', "InspirePriority_increaseDowns", function()
		InspirePriority:increaseDowns()
	end)
elseif RequiredScript == "lib/units/equipment/doctor_bag/doctorbagbase" then
	Hooks:PostHook(DoctorBagBase, "take", "InspirePriority_resetDowns", function()
		InspirePriority:resetDowns()
	end)
elseif RequiredScript == "lib/managers/trademanager" then
	Hooks:PostHook(TradeManager, 'on_player_criminal_death', "InspirePriority_custodyLocal", function(self, criminal_name, respawn_penalty, hostages_killed, skip_netsend)
		InspirePriority:resetDowns()
	end)
end
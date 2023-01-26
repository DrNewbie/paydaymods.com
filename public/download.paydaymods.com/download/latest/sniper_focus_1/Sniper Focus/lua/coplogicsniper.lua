local tmp_vec1 = Vector3()
CopLogicSniperFocus = CopLogicSniperFocus or class(CopLogicBase)
CopLogicSniperFocus.damage_clbk = CopLogicIdle.damage_clbk
CopLogicSniperFocus.on_detected_enemy_destroyed = CopLogicAttack.on_detected_enemy_destroyed
CopLogicSniperFocus.on_criminal_neutralized = CopLogicAttack.on_criminal_neutralized
CopLogicSniperFocus.is_available_for_assignment = CopLogicAttack.is_available_for_assignment
CopLogicSniperFocus.death_clbk = CopLogicAttack.death_clbk
CopLogicSniperFocus.on_alert = CopLogicIdle.on_alert
CopLogicSniperFocus.on_intimidated = CopLogicIdle.on_intimidated
CopLogicSniperFocus.on_new_objective = CopLogicIdle.on_new_objective
function CopLogicSniperFocus.enter(data, new_logic_name, enter_params)
	CopLogicBase.enter(data, new_logic_name, enter_params)
	local objective = data.objective
	data.unit:brain():cancel_all_pathing_searches()
	local old_internal_data = data.internal_data
	local my_data = {
		unit = data.unit
	}
	my_data.detection = data.char_tweak.detection.recon
	if old_internal_data then
		my_data.turning = old_internal_data.turning
		if old_internal_data.firing then
			data.unit:movement():set_allow_fire(false)
		end
		if old_internal_data.shooting then
			data.unit:brain():action_request({type = "idle", body_part = 3})
		end
		if old_internal_data.nearest_cover then
			my_data.nearest_cover = old_internal_data.nearest_cover
			managers.navigation:reserve_cover(my_data.nearest_cover[1], data.pos_rsrv_id)
		end
		if old_internal_data.best_cover then
			my_data.best_cover = old_internal_data.best_cover
			managers.navigation:reserve_cover(my_data.best_cover[1], data.pos_rsrv_id)
		end
	end
	data.internal_data = my_data
	local key_str = tostring(data.unit:key())
	my_data.detection_task_key = "CopLogicSniperFocus._upd_enemy_detection" .. key_str
	CopLogicBase.queue_task(my_data, my_data.detection_task_key, CopLogicSniperFocus._upd_enemy_detection, data)
	if objective then
		my_data.wanted_stance = objective.stance
		my_data.wanted_pose = objective.pose
		my_data.attitude = objective.attitude or "avoid"
	end
	data.unit:movement():set_cool(false)
	if my_data ~= data.internal_data then
		return
	end
	data.unit:brain():set_attention_settings({cbt = true})
	my_data.weapon_range = data.char_tweak.weapon[data.unit:inventory():equipped_unit():base():weapon_tweak_data().usage].range
	if data.char_tweak.weapon[data.unit:inventory():equipped_unit():base():weapon_tweak_data().usage].use_laser then
		if SniperFocusHandler == nil then
			data.unit:inventory():equipped_unit():base():set_laser_enabled(true)
			my_data.weapon_laser_on = true
			managers.enemy:_destroy_unit_gfx_lod_data(data.key)
			managers.network:session():send_to_peers_synched("sync_unit_event_id_16", data.unit, "brain", HuskCopBrain._NET_EVENTS.weapon_laser_on)
		end
	end
end
function CopLogicSniperFocus.exit(data, new_logic_name, enter_params)
	CopLogicBase.exit(data, new_logic_name, enter_params)
	local my_data = data.internal_data
	data.unit:brain():cancel_all_pathing_searches()
	CopLogicBase.cancel_queued_tasks(my_data)
	if my_data.nearest_cover then
		managers.navigation:release_cover(my_data.nearest_cover[1])
	end
	if my_data.best_cover then
		managers.navigation:release_cover(my_data.best_cover[1])
	end
	if my_data.weapon_laser_on then
		if data.unit:inventory():equipped_unit() then
			data.unit:inventory():equipped_unit():base():set_laser_enabled(false)
		end
		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", data.unit, "brain", HuskCopBrain._NET_EVENTS.weapon_laser_off)
		if new_logic_name ~= "inactive" then
			managers.enemy:_create_unit_gfx_lod_data(data.unit)
		end
	end
end
function CopLogicSniperFocus._upd_enemy_detection(data)
	managers.groupai:state():on_unit_detection_updated(data.unit)
	data.t = TimerManager:game():time()
	local my_data = data.internal_data
	local min_reaction = AIAttentionObject.REACT_AIM
	local delay = CopLogicBase._upd_attention_obj_detection(data, min_reaction, nil)
	local new_attention, new_prio_slot, new_reaction = CopLogicIdle._get_priority_attention(data, data.detected_attention_objects, CopLogicSniperFocus._chk_reaction_to_attention_object)
	local old_att_obj = data.attention_obj
	CopLogicBase._set_attention_obj(data, new_attention, new_reaction)
	if new_reaction and new_reaction >= AIAttentionObject.REACT_SCARED then
		local objective = data.objective
		local wanted_state
		local allow_trans, obj_failed = CopLogicBase.is_obstructed(data, objective, nil, new_attention)
		if allow_trans and obj_failed then
			wanted_state = CopLogicBase._get_logic_state_from_reaction(data)
		end
		if wanted_state and wanted_state ~= data.name then
			if obj_failed then
				data.objective_failed_clbk(data.unit, data.objective)
			end
			if my_data == data.internal_data then
				CopLogicBase._exit(data.unit, wanted_state)
			end
			CopLogicBase._report_detections(data.detected_attention_objects)
			return
		end
	end
	CopLogicSniperFocus._upd_aim(data, my_data)
	--if data.important then
		delay = 0
	--else
	--	delay = 0.5 + delay * 1.5
	--end
	CopLogicBase.queue_task(my_data, my_data.detection_task_key, CopLogicSniperFocus._upd_enemy_detection, data, data.t + delay)
	CopLogicBase._report_detections(data.detected_attention_objects)
end
function CopLogicSniperFocus._chk_stand_visibility(my_pos, target_pos, slotmask)
	mvector3.set(tmp_vec1, my_pos)
	mvector3.set_z(tmp_vec1, my_pos.z + 150)
	local ray = World:raycast("ray", tmp_vec1, target_pos, "slot_mask", slotmask, "ray_type", "ai_vision", "report")
	return ray
end
function CopLogicSniperFocus._chk_crouch_visibility(my_pos, target_pos, slotmask)
	mvector3.set(tmp_vec1, my_pos)
	mvector3.set_z(tmp_vec1, my_pos.z + 50)
	local ray = World:raycast("ray", tmp_vec1, target_pos, "slot_mask", slotmask, "ray_type", "ai_vision", "report")
	return ray
end
function CopLogicSniperFocus.action_complete_clbk(data, action)
	local action_type = action:type()
	local my_data = data.internal_data
	if action_type == "turn" then
		my_data.turning = nil
	elseif action_type == "shoot" then
		my_data.shooting = nil
	elseif action_type == "walk" then
		my_data.advacing = nil
		if action.expired then
			my_data.reposition = nil
		end
	elseif action_type == "hurt" and (action:body_part() == 1 or action:body_part() == 2) and data.objective and data.objective.pos then
		my_data.reposition = true
	end
end
function CopLogicSniperFocus._upd_aim(data, my_data)
	local shoot, aim
	local focus_enemy = data.attention_obj
	if focus_enemy then
		if focus_enemy.verified then
			shoot = true
		elseif my_data.wanted_stance == "cbt" then
			aim = true
		elseif focus_enemy.verified_t and data.t - focus_enemy.verified_t < 20 then
			aim = true
		end
		if aim and not shoot and my_data.shooting and focus_enemy.verified_t and data.t - focus_enemy.verified_t < 2 then
			shoot = true
		end
	end
	if shoot and focus_enemy.reaction < AIAttentionObject.REACT_SHOOT then
		shoot = nil
		aim = true
	end
	local action_taken = my_data.turning or data.unit:movement():chk_action_forbidden("walk")
	if not action_taken then
		local anim_data = data.unit:anim_data()
		if anim_data.reload and not anim_data.crouch and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.crouch) then
			action_taken = CopLogicAttack._chk_request_action_crouch(data)
		end
		if action_taken then
		elseif my_data.attitude == "engage" and not data.is_suppressed then
			if focus_enemy then
				if not CopLogicAttack._chk_request_action_turn_to_enemy(data, my_data, data.m_pos, focus_enemy.verified_pos or focus_enemy.m_head_pos) and not focus_enemy.verified and not anim_data.reload then
					if anim_data.crouch then
						if (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.stand) and not CopLogicSniperFocus._chk_stand_visibility(data.m_pos, focus_enemy.m_head_pos, data.visibility_slotmask) then
							CopLogicAttack._chk_request_action_stand(data)
						end
					elseif (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.crouch) and not CopLogicSniperFocus._chk_crouch_visibility(data.m_pos, focus_enemy.m_head_pos, data.visibility_slotmask) then
						CopLogicAttack._chk_request_action_crouch(data)
					end
				end
			elseif my_data.wanted_pose and not anim_data.reload then
				if my_data.wanted_pose == "crouch" then
					if not anim_data.crouch and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.crouch) then
						action_taken = CopLogicAttack._chk_request_action_crouch(data)
					end
				elseif not anim_data.stand and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.stand) then
					action_taken = CopLogicAttack._chk_request_action_stand(data)
				end
			end
		elseif focus_enemy then
			if not CopLogicAttack._chk_request_action_turn_to_enemy(data, my_data, data.m_pos, focus_enemy.verified_pos or focus_enemy.m_head_pos) and focus_enemy.verified and anim_data.stand and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.crouch) and CopLogicSniperFocus._chk_crouch_visibility(data.m_pos, focus_enemy.m_head_pos, data.visibility_slotmask) then
				CopLogicAttack._chk_request_action_crouch(data)
			end
		elseif my_data.wanted_pose and not anim_data.reload then
			if my_data.wanted_pose == "crouch" then
				if not anim_data.crouch and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.crouch) then
					action_taken = CopLogicAttack._chk_request_action_crouch(data)
				end
			elseif not anim_data.stand and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.stand) then
				action_taken = CopLogicAttack._chk_request_action_stand(data)
			end
		end
	end
	if my_data.reposition and not action_taken and not my_data.advancing then
		local objective = data.objective
		my_data.advance_path = {
			mvector3.copy(data.m_pos),
			mvector3.copy(objective.pos)
		}
		if CopLogicTravel._chk_request_action_walk_to_advance_pos(data, my_data, objective.haste or "walk", objective.rot) then
			action_taken = true
		end
	end
	if aim or shoot then
		if focus_enemy.verified then
			if my_data.attention_unit ~= focus_enemy.unit:key() then
				CopLogicBase._set_attention(data, focus_enemy)
				my_data.attention_unit = focus_enemy.unit:key()
			end
		elseif my_data.attention_unit ~= focus_enemy.verified_pos then
			CopLogicBase._set_attention_on_pos(data, mvector3.copy(focus_enemy.verified_pos))
			my_data.attention_unit = mvector3.copy(focus_enemy.verified_pos)
		end
		if not my_data.shooting and not data.unit:anim_data().reload and not data.unit:movement():chk_action_forbidden("action") then
			local shoot_action = {type = "shoot", body_part = 3}
			my_data.shoot_action = data.unit:brain():action_request(shoot_action)
			
			if my_data.shoot_action then
				my_data.shooting = true
			end
		end
	else
		if my_data.shooting then
			local new_action
			if data.unit:anim_data().reload then
				new_action = {type = "reload", body_part = 3}
			else
				new_action = {type = "idle", body_part = 3}
			end
			data.unit:brain():action_request(new_action)
		end
		if my_data.attention_unit then
			CopLogicBase._reset_attention(data)
			my_data.attention_unit = nil
		end
	end
	
	--
	
	if data.actual_fire then
		CopLogicAttack.aim_allow_fire(true, aim, data, my_data)
		data.actual_fire = false
		
		if data.internal_data.weapon_laser_on then
			data.unit:inventory():equipped_unit():base():set_laser_enabled(false)
			data.internal_data.weapon_laser_on = false
			if not data.unit:character_damage():dead() then
				managers.enemy:_create_unit_gfx_lod_data(data.unit)
			end
			managers.network:session():send_to_peers_synched("sync_unit_event_id_16", data.unit, "brain", HuskCopBrain._NET_EVENTS.weapon_laser_off)
		end
	else
		CopLogicAttack.aim_allow_fire(false, aim, data, my_data)
	end
end
function CopLogicSniperFocus._chk_reaction_to_attention_object(data, attention_data, stationary)
	local record = attention_data.criminal_record
	if not record or not attention_data.is_person then
		return attention_data.settings.reaction
	end
	local att_unit = attention_data.unit
	local assault_mode = managers.groupai:state():get_assault_mode()
	if attention_data.is_deployable or data.t < record.arrest_timeout then
		return math.min(attention_data.settings.reaction, AIAttentionObject.REACT_COMBAT)
	end
	if record.status == "disabled" then
		if record.assault_t and record.assault_t - record.disabled_t > 0.6 then
			return math.min(attention_data.settings.reaction, AIAttentionObject.REACT_COMBAT)
		end
		return AIAttentionObject.REACT_AIM
	elseif record.being_arrested then
		return AIAttentionObject.REACT_AIM
	end
	return math.min(attention_data.settings.reaction, AIAttentionObject.REACT_COMBAT)
end
function CopLogicSniperFocus.should_duck_on_alert(data, alert_data)
	return data.internal_data.attitude == "avoid" and CopLogicBase.should_duck_on_alert(data, alert_data)
end
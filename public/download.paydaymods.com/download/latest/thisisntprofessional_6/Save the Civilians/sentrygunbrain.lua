local mvec3_dir = mvector3.direction
local mvec3_dist_sq = mvector3.distance_sq
local mvec3_dot = mvector3.dot
local mvec3_cross = mvector3.cross
local mvec3_sub = mvector3.subtract
local mvec3_add = mvector3.add
local mvec3_mul = mvector3.multiply
local math_max = math.max
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()

local orig_upd_fire = SentryGunBrain._upd_fire
function SentryGunBrain:_upd_fire(t,...)
	local attention = self._ext_movement:attention()
	if not (attention and managers.enemy:is_civilian(attention.unit)) then
		return orig_upd_fire(self,t,...)
	end 
	
	
	if self._ext_movement:is_activating() or self._ext_movement:is_inactivating() or self._idle then
		if self._firing then
			self:stop_autofire()
		end

		return
	end
	
	if self._unit:weapon():out_of_ammo() then
		if self._unit:weapon():can_auto_reload() then
			if self._firing then
				self:stop_autofire()
			end

			if not self._ext_movement:rearming() then
				self._ext_movement:rearm()
			end
		elseif not self._unit:base():waiting_for_refill() then
			self:switch_off()
		end
	
	elseif self._ext_movement:rearming() then --only for swat turrets
		self._ext_movement:complete_rearming()
	elseif attention and attention.reaction and not self._ext_movement:warming_up(t) and not self:_ignore_shield({self._unit}, self._ext_movement:m_head_pos(), self._attention_obj) then
		local expend_ammo = false
		local damage_player = false
		local my_pos = self._ext_movement:m_head_pos()
		local target_pos = self:get_target_base_pos(attention)
		
		if not target_pos then
			self:stop_autofire()

			return
		end

		if not self:is_target_on_sight(my_pos, target_pos) then
			self:stop_autofire()

			return
		end
		if not self._ap_bullets then 
			self:stop_autofire()
			return
		end
		if self._firing then
			self._unit:weapon():trigger_held(true, expend_ammo, damage_player, attention.unit)
			if attention.unit and alive(attention.unit) and attention.unit.brain then 
				attention.unit:brain():on_intimidated(0.5, self._unit)
			end
		else
			mvec3_dir(tmp_vec1, my_pos, target_pos)

			local max_dot = self._tweak_data.KEEP_FIRE_ANGLE
			max_dot = math.min(0.99, 1 - (1 - max_dot) * (self._shaprness_mul or 1))

			if max_dot < mvec3_dot(tmp_vec1, self._ext_movement:m_head_fwd()) then
				self._unit:weapon():start_autofire()
				self._unit:weapon():trigger_held(true, expend_ammo, damage_player, attention.unit)
				if attention.unit and alive(attention.unit) and attention.unit.brain then 
					attention.unit:brain():on_intimidated(0.5, self._unit)
				end
				self._firing = true
			end
		end
	elseif self._firing then
		self:stop_autofire()
	end
	
end



--local orig_target = SentryGunBrain._select_focus_attention 

--caution: overrides original function, so at increased risk of mod conflict or breaking upon pd2 update
function SentryGunBrain:_select_focus_attention(t,...)
	local current_focus = self._attention_obj
	local current_pos = self._ext_movement:m_head_pos()
	local current_fwd = nil

	if current_focus then
		current_fwd = tmp_vec2

		mvec3_dir(current_fwd, self._ext_movement:m_head_pos(), current_focus.m_head_pos)
	else
		current_fwd = self._ext_movement:m_head_fwd()
	end

	local max_dis = self._tweak_data.DETECTION_RANGE

	local function _get_weight(attention_info)
		if not attention_info.identified then
			return
		end

		local total_weight = 1

		if attention_info.health_ratio and attention_info.unit:character_damage():health_ratio() <= 0 then
			return 0
		elseif attention_info.verified_t and t - attention_info.verified_t < 3 then
			local max_duration = 3
			local elapsed_t = t - attention_info.verified_t
			total_weight = total_weight * math.lerp(1, 0.6, elapsed_t / max_duration)
		else
			return 0
		end

		if attention_info.settings.weight_mul then
			total_weight = total_weight * attention_info.settings.weight_mul
		end

		local dis = mvec3_dir(tmp_vec1, current_pos, attention_info.m_head_pos)
		local dis_weight = math_max(0, (max_dis - dis) / max_dis)
		total_weight = total_weight * dis_weight
		local dot_weight = 1 + mvec3_dot(tmp_vec1, current_fwd)
		dot_weight = dot_weight * dot_weight * dot_weight
		total_weight = total_weight * dot_weight

		if self:_ignore_shield({self._unit}, current_pos, attention_info) then
			total_weight = total_weight * 0.01
		end

		return total_weight
	end

	local best_focus_attention, best_focus_weight = nil
	local best_focus_reaction = 0
--local hai = 1
	for u_key, attention_info in pairs(self._detected_attention_objects) do
		local weight = _get_weight(attention_info)

		if weight and (best_focus_reaction < attention_info.reaction or best_focus_reaction == attention_info.reaction and (not best_focus_weight or best_focus_weight < weight)) then
			local civ_unit = attention_info.unit
			if managers.enemy:is_civilian(civ_unit) then 
--				local brain = civ_unit:brain()
--				local logic_data = brain and brain._logic_data
--				local objective = logic_data and logic_data.objective
--				local objective_type = objective and objective.type
				local anim_data = civ_unit:anim_data()
--				KineticHUD:_debug("Civ:: drop:" .. tostring(anim_data.drop or "nil") .. ",panic:" .. tostring(anim_data.panic or "nil"),hai)
				
				if not anim_data.drop then 					
					best_focus_weight = weight
					best_focus_attention = attention_info
					best_focus_reaction = attention_info.reaction
				end
			else --is cop
--				KineticHUD:_debug("Cop: " .. tostring(attention_info.reaction or "nil"),hai)
				best_focus_weight = weight
				best_focus_attention = attention_info
				best_focus_reaction = attention_info.reaction
			end
--			hai = hai + 1
		end
	end

	if current_focus ~= best_focus_attention then
		if best_focus_attention then
			local attention_data = {
				unit = best_focus_attention.unit,
				u_key = best_focus_attention.u_key,
				handler = best_focus_attention.handler,
				reaction = best_focus_attention.reaction
			}

			self._ext_movement:set_attention(attention_data)
		else
			self._ext_movement:set_attention()
		end

		self._attention_obj = best_focus_attention
	end
end

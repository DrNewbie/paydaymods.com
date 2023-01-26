if not mod_collection then
	return
end

local SHOW_BUFFS = mod_collection._data.show_buffs

if SHOW_BUFFS then
	local PlayerStandard__start_action_charging_weapon_original = PlayerStandard._start_action_charging_weapon
	local PlayerStandard__end_action_charging_weapon_original = PlayerStandard._end_action_charging_weapon
	local PlayerStandard__update_charging_weapon_timers_original = PlayerStandard._update_charging_weapon_timers
	local PlayerStandard__check_action_primary_attack_original = PlayerStandard._check_action_primary_attack
	local PlayerStandard__do_melee_damage_original = PlayerStandard._do_melee_damage
	local PlayerStandard__start_action_melee_original = PlayerStandard._start_action_melee
	local PlayerStandard__update_melee_timers_original = PlayerStandard._update_melee_timers
	local PlayerStandard__do_action_intimidate_original = PlayerStandard._do_action_intimidate
	
	function PlayerStandard:_start_action_charging_weapon(...)
		managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.bow_charge, { set_current = 0 })
		return PlayerStandard__start_action_charging_weapon_original(self, ...)
	end

	function PlayerStandard:_end_action_charging_weapon(...)
		managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.bow_charge, { set_current = 0, deactivate = true })
		return PlayerStandard__end_action_charging_weapon_original(self, ...)
	end

	function PlayerStandard:_update_charging_weapon_timers(...)
		if self._state_data.charging_weapon then
			local weapon = self._equipped_unit:base()
			if not weapon:charge_fail() then
				managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.bow_charge, { set_current = weapon:charge_multiplier() })
			end
		end
		return PlayerStandard__update_charging_weapon_timers_original(self, ...)
	end
	
	function PlayerStandard:_check_action_primary_attack(t, ...)
		local result = PlayerStandard__check_action_primary_attack_original(self, t, ...)
		if result and self._state_data.stacking_dmg_mul then
			local weapon_category = self._equipped_unit:base():weapon_tweak_data().category
			local stack = self._state_data.stacking_dmg_mul[weapon_category]
			if stack then
				managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.trigger_happy, { set_duration = (stack[1] or 0) - t, set_stack_count = stack[2] })
			end
		end
		return result
	end
	
	function PlayerStandard:_do_melee_damage(t, ...)
		managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.melee_charge, { deactivate = true })
		local result = PlayerStandard__do_melee_damage_original(self, t, ...)
		if self._state_data.stacking_dmg_mul then
			local stack = self._state_data.stacking_dmg_mul.melee
			if stack then
				managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.melee_stack_damage, { set_duration = (stack[1] or 0) - t, set_stack_count = stack[2] })
			end
		end
		return result
	end
	
	function PlayerStandard:_start_action_melee(...)
		managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.melee_charge, { set_current = 0 })
		return PlayerStandard__start_action_melee_original(self, ...)
	end

	function PlayerStandard:_update_melee_timers(t, ...)
		if self._state_data.meleeing and self._state_data.melee_start_t and self._state_data.melee_start_t + 0.3 < t then
			managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.melee_charge, { set_current = self:_get_melee_charge_lerp_value(t) })
		end
		return PlayerStandard__update_melee_timers_original(self, t, ...)
	end

	
	function PlayerStandard:_do_action_intimidate(t, interact_type, ...)
		if interact_type == "cmd_gogo" or interact_type == "cmd_get_up" then
			managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.inspire_debuff, { set_duration = self._ext_movement:rally_skill_data().morale_boost_cooldown_t or 3.5 })
		end
		return PlayerStandard__do_action_intimidate_original(self, t, interact_type, ...)
	end
	
	function PlayerStandard:_update_omniscience(t, dt)
		if managers.groupai:state():whisper_mode() then
			local action_forbidden = self._unit:base():stats_screen_visible() or not managers.player:has_category_upgrade("player", "standstill_omniscience") or self:_interacting() or self._ext_movement:has_carry_restriction() or self:is_deploying() or self:_changing_weapon() or self:_is_throwing_grenade() or self:_is_meleeing() or self:_on_zipline() or self._moving or self:running() or self:_is_reloading() or self:in_air() or self:in_steelsight() or self:is_equipping() or self:shooting() or not tweak_data.player.omniscience
			if action_forbidden then
				if self._state_data.omniscience_t then
					managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.sixth_sense, { deactivate = true, set_stack_count = 0 })
					self._state_data.omniscience_t = nil
					self._state_data.omniscience_units_detected = {}
				end
				return
			end
			
			if not self._state_data.omniscience_t then
				managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.sixth_sense, { set_duration = tweak_data.player.omniscience.start_t * 1.05 })
				self._state_data.omniscience_t = t + tweak_data.player.omniscience.start_t
			end
			
			if t >= self._state_data.omniscience_t then
				local sensed_targets = World:find_units_quick("sphere", self._unit:movement():m_pos(), tweak_data.player.omniscience.sense_radius, World:make_slot_mask(12, 21, 33))
				self._state_data.omniscience_units_detected = self._state_data.omniscience_units_detected or {}
				managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.sixth_sense, { set_stack_count = { #sensed_targets, true } })
				for _, unit in ipairs(sensed_targets) do
					if alive(unit) and not tweak_data.character[unit:base()._tweak_table].is_escort and not unit:anim_data().tied then
						if not self._state_data.omniscience_units_detected[unit:key()] or t >= self._state_data.omniscience_units_detected[unit:key()] then
							self._state_data.omniscience_units_detected[unit:key()] = t + tweak_data.player.omniscience.target_resense_t
							managers.game_play_central:auto_highlight_enemy(unit, true)
							managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.sixth_sense, { flash = tweak_data.player.omniscience.interval_t * 0.9 })
							break
						end
					end
				end
				self._state_data.omniscience_t = t + tweak_data.player.omniscience.interval_t
				managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.sixth_sense, { set_duration = tweak_data.player.omniscience.interval_t * 1.05 })
			end
		end
	end
end

local TIMEOUT = 0.25

local _check_action_throw_grenade_original = PlayerStandard._check_action_throw_grenade

function PlayerStandard:_check_action_throw_grenade(t, input, ...)
	if input.btn_throw_grenade_press then
		if managers.groupai:state():whisper_mode() and (t - (self._last_grenade_t or 0) >= TIMEOUT) then
			self._last_grenade_t = t
			return
		end
	end
	
	return _check_action_throw_grenade_original(self, t, input, ...)
end

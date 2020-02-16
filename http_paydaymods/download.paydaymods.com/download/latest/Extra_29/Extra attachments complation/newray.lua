local old_init = WeaponTweakData.init

function NewRaycastWeaponBase:init(tweak_data)
    old_init(self, tweak_data)
	
function NewRaycastWeaponBase:recoil_multiplier()
		local current_state = managers.player:player_unit():movement()._current_state
		return managers.blackmarket:recoil_multiplier(self._name_id, self:weapon_tweak_data().category, self:weapon_tweak_data().sub_category, self._silencer, self._blueprint) * ((current_state and current_state._state_data.in_air and 2) or 1)
		* ((current_state and current_state._state_data.ducking and 0.7) or 1) * ((self:in_burst_mode() and self._burst_fire_recoil_mult) or (self._firemode == Idstring("auto") and not self:in_burst_mode() and self._auto_fire_recoil_mult) or 1)
	end
	
	--[[	fire rate multipler in-game stuff	]]--
	function NewRaycastWeaponBase:fire_rate_multiplier()
		local multiplier = self._rof_mult or 1
		
		if self._fire_mode == Idstring("auto") and not self:in_burst_mode() and self._auto_fire_rate_multiplier then
			multiplier = multiplier * self._auto_fire_rate_multiplier
		end
		
		if self._fire_rate_init_count and (self._fire_rate_init_count > self._shotsfired) and self:fire_mode() ~= "single" then
		--log("DICSK")
			multiplier = multiplier * self._fire_rate_init_mult
		end
		
		if not self:upgrade_blocked(tweak_data.weapon[self._name_id].category, "fire_rate_multiplier") then
			if not self._block_eq_aced and not (self._is_akimbo and self._fire_mode == Idstring("auto") and not self:in_burst_mode()) then
				multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "fire_rate_multiplier", 1)
			end
		end
		if self:weapon_tweak_data().sub_category then
			if not self:upgrade_blocked(tweak_data.weapon[self._name_id].sub_category, "fire_rate_multiplier") then
				if not self._block_eq_aced and not (self._is_akimbo and self._fire_mode == Idstring("auto") and not self:in_burst_mode()) then
					multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "fire_rate_multiplier", 1)
				end
			end
		end
		if not self:upgrade_blocked("weapon", "fire_rate_multiplier") then
			if not self._block_eq_aced and not (self._is_akimbo and self._fire_mode == Idstring("auto") and not self:in_burst_mode()) then
				multiplier = multiplier * managers.player:upgrade_value("weapon", "fire_rate_multiplier", 1)
			end
		end
		if not self:upgrade_blocked(self._name_id, "fire_rate_multiplier") then
			if not self._block_eq_aced and not (self._is_akimbo and self._fire_mode == Idstring("auto") and not self:in_burst_mode()) then
				multiplier = multiplier * managers.player:upgrade_value(self._name_id, "fire_rate_multiplier", 1)
			end
		end
		
		return multiplier * ( (self:in_burst_mode() and self._burst_fire_rate_multiplier) or 1)
	end
	
		
	--[[	Reload stuff	]]--
	function NewRaycastWeaponBase:reload_speed_multiplier()
		local multiplier = 1
		multiplier = multiplier * self._base_reload_speed_mult
		if self._dual_mags then
			if self._alternate_reload == true then
				multiplier = multiplier * self._mod_reload_speed_mult
			end
		else
			multiplier = multiplier * self._mod_reload_speed_mult
		end
		multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "reload_speed_multiplier", 1)
		if self:weapon_tweak_data().sub_category then
			multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "reload_speed_multiplier", 1)
		end
		multiplier = multiplier * managers.player:upgrade_value("weapon", "passive_reload_speed_multiplier", 1)
		multiplier = multiplier * managers.player:upgrade_value(self._name_id, "reload_speed_multiplier", 1)
		if self._setup and alive(self._setup.user_unit) and self._setup.user_unit:movement() then
			local morale_boost_bonus = self._setup.user_unit:movement():morale_boost()
			if morale_boost_bonus then
				multiplier = multiplier * morale_boost_bonus.reload_speed_bonus
			end
		end
		return multiplier
	end
	
	function NewRaycastWeaponBase:exit_run_speed_multiplier()
		local multiplier = managers.player:upgrade_value(self:weapon_tweak_data().category, "exit_run_speed_multiplier", 1)
		if self:weapon_tweak_data().sub_category then
			multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "exit_run_speed_multiplier", 1)
		end
		multiplier = multiplier * managers.player:upgrade_value(self._name_id, "exit_run_speed_multiplier", 1)
		multiplier = multiplier / ( (self:weapon_tweak_data().sprintout_time or 0.300) / 0.45 )
		return multiplier
	end

	function NewRaycastWeaponBase:enter_steelsight_speed_multiplier()
		local multiplier = 1
		local ads_time = self:weapon_tweak_data().ADS_TIMER or 0.200
		
		multiplier = multiplier / ( ads_time / tweak_data.player.TRANSITION_DURATION)
					
		multiplier = multiplier * self._ads_speed_mult
		
		if self:weapon_tweak_data().category == "assault_rifle" and self:weapon_tweak_data().recategorize == "battle_rifle" then
			multiplier = multiplier * managers.player:upgrade_value("snp", "enter_steelsight_speed_multiplier", 1)
		else
			multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "enter_steelsight_speed_multiplier", 1)
		end
		if self:weapon_tweak_data().sub_category then
			multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().sub_category, "enter_steelsight_speed_multiplier", 1)
		end
		multiplier = multiplier * managers.player:temporary_upgrade_value("temporary", "combat_medic_enter_steelsight_speed_multiplier", 1)
		multiplier = multiplier * managers.player:upgrade_value(self._name_id, "enter_steelsight_speed_multiplier", 1)
		
		if self._silencer then
			multiplier = multiplier * managers.player:upgrade_value("weapon", "silencer_enter_steelsight_speed_multiplier", 1)
			multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "silencer_enter_steelsight_speed_multiplier", 1)
		end
		--[[ local state = managers.player:player_unit():movement():current_state()
		if state._shooting then
			multiplier = multiplier * 0.75
		end ]]
		return multiplier
	end
			
--}
end
end
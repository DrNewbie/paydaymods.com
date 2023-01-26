local ammoclipping = NewRaycastWeaponBase.calculate_ammo_max_per_clip
function NewRaycastWeaponBase:calculate_ammo_max_per_clip()
	local ammo = tweak_data.weapon[self._name_id].CLIP_AMMO_MAX
	ammo = ammo * managers.player:upgrade_value(self._name_id, "mag_increase", 1)
	if not self:upgrade_blocked("weapon", "mag_increase") then
		ammo = ammo * managers.player:upgrade_value("weapon", "mag_increase", 1)
	end
	if not self:upgrade_blocked(tweak_data.weapon[self._name_id].category, "mag_increase") then
		ammo = ammo * managers.player:upgrade_value(tweak_data.weapon[self._name_id].category, "mag_increase", 1)
	end
	ammo = math.floor(ammo + (self._extra_ammo or 0))
	return ammo
end

local _old_update_stats = NewRaycastWeaponBase._update_stats_values
function NewRaycastWeaponBase:_update_stats_values()
	_old_update_stats(self)
	self._reload_speed_mult = self:weapon_tweak_data().reload_speed_mult or 1
	if (managers.skilltree:skill_step("t_mid6") >= 1) then
		log ("[HAS] Drop Reload " .. tostring(managers.skilltree:skill_step("t_mid6") == 1 and "BASIC" or "ACE"))
		self._reload_speed_mult = self._reload_speed_mult * managers.player:upgrade_value("weapon", "drop_reload")
	end
end
function NewRaycastWeaponBase:reload_speed_multiplier()
	local multiplier = 1
	
	multiplier = multiplier * self._reload_speed_mult
	multiplier = multiplier * managers.player:team_upgrade_value("weapon", "drop_reload", 1)
	
	multiplier = multiplier + (1 - managers.player:upgrade_value(self:weapon_tweak_data().category, "reload_speed_multiplier", 1))
	multiplier = multiplier + (1 - managers.player:upgrade_value("weapon", "passive_reload_speed_multiplier", 1))
	multiplier = multiplier + (1 - managers.player:upgrade_value(self._name_id, "reload_speed_multiplier", 1))
	
	if self._setup and alive(self._setup.user_unit) and self._setup.user_unit:movement() then
		local morale_boost_bonus = self._setup.user_unit:movement():morale_boost()
		if morale_boost_bonus then
			multiplier = multiplier + (1 - morale_boost_bonus.reload_speed_bonus)
		end
	end
	return self:_convert_add_to_mul(multiplier)
end

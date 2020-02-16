function NewRaycastWeaponBase:set_weapon_safety()
	if self._fire_mode == KineticHUD.firemode_safety then
		managers.hud:set_firemode_safety(true)
		self._fire_mode = self._orig_fire_mode or self._fire_mode
		self._sound_fire:post_event("wp_auto_switch_off")
	else
		managers.hud:set_firemode_safety(false)
		self._orig_fire_mode = self._fire_mode
		self._fire_mode = KineticHUD.firemode_safety		
		self._sound_fire:post_event("wp_auto_switch_on")
	end

end

local orig_fire_mode = NewRaycastWeaponBase.fire_mode
function NewRaycastWeaponBase:fire_mode(...)
	if self._fire_mode == KineticHUD.firemode_safety then 
		return self._fire_mode
	end
	return orig_fire_mode(self,...)
end

--[[
local orig_toggle_firemode = 1
function NewRaycastWeaponBase:toggle_firemode(skip_post_event)
	local can_toggle = not self._locked_fire_mode and self:can_toggle_firemode()

	if can_toggle then
		if self._fire_mode == ids_single then
			self._fire_mode = ids_auto

			if not skip_post_event then
				self._sound_fire:post_event("wp_auto_switch_on")
			end
		else
			self._fire_mode = ids_single

			if not skip_post_event then
				self._sound_fire:post_event("wp_auto_switch_off")
			end
		end

		return true
	end

	return false
end
--]]

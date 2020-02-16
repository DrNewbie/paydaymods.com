local orig_update_fov = PlayerStandard.update_fov_external
function PlayerStandard:update_fov_external(...) --scopes work with this
	local stance_id = self._equipped_unit:base():get_stance_id()
	local stances = tweak_data.player.stances[stance_id] or tweak_data.player.stances.default
	local misc_attribs = self._state_data.in_steelsight and stances.steelsight or (self._state_data.ducking) and stances.crouched or stances.standard
	if not alive(self._equipped_unit) then
		return
	end
	if misc_attribs then 
		return orig_update_fov(self,...)
	end
end

local orig_start_deploy = PlayerStandard.start_deploying_bipod
function PlayerStandard:start_deploying_bipod(bipod_deploy_duration,...)
	bipod_deploy_duration = bipod_deploy_duration or 1
	return orig_start_deploy(self,bipod_deploy_duration,...)
end

--quick fix until I figure out what's really causing the missing tweakdata/misc_attribs issue
local orig_stance_entered = PlayerStandard._stance_entered
function PlayerStandard:_stance_entered(unequipped,...)
	if not self:_is_using_bipod() then 
		return orig_stance_entered(self,unequipped,...)
	end
	
	local stance_standard = tweak_data.player.stances.default[managers.player:current_state()] or tweak_data.player.stances.default.standard
	local head_stance = self._state_data.ducking and tweak_data.player.stances.default.crouched.head or stance_standard.head
	local stance_id = nil
	local stance_mod = {translation = Vector3(0, 0, 0)}

	if not unequipped then
		stance_id = self._equipped_unit:base():get_stance_id()

		if self._state_data.in_steelsight and self._equipped_unit:base().stance_mod then
			stance_mod = self._equipped_unit:base():stance_mod() or stance_mod
		end
	end

	local stances = nil
	stances = (self:_is_meleeing() or self:_is_throwing_projectile()) and tweak_data.player.stances.default or tweak_data.player.stances[stance_id] or tweak_data.player.stances.default
	local misc_attribs = stances.standard
	misc_attribs = self:_is_using_bipod() and not self:_is_throwing_projectile() and stances.bipod or self._state_data.in_steelsight and stances.steelsight or self._state_data.ducking and stances.crouched or stances.standard
	local duration = tweak_data.player.TRANSITION_DURATION + (self._equipped_unit:base():transition_duration() or 0)
	local duration_multiplier = self._state_data.in_steelsight and 1 / self._equipped_unit:base():enter_steelsight_speed_multiplier() or 1
	if misc_attribs then --misc_attribs can be nil with BTW, causing a crash
		local new_fov = self:get_zoom_fov(misc_attribs) + 0
		self._camera_unit:base():clbk_stance_entered(misc_attribs.shoulders, head_stance, misc_attribs.vel_overshot, new_fov, misc_attribs.shakers, stance_mod, duration_multiplier, duration)
	end
	managers.menu:set_mouse_sensitivity(self:in_steelsight())
end

if not SGO or not SGO.settings.use_lmgs then return end
tweak_data.weapon.hk21.bipod_camera_spin_limit = 10800
tweak_data.weapon.hk21.bipod_camera_pitch_limit = 10800
tweak_data.weapon.m249.bipod_camera_spin_limit = 10800
tweak_data.weapon.m249.bipod_camera_pitch_limit = 10800
tweak_data.weapon.rpk.bipod_camera_spin_limit = 10800
tweak_data.weapon.rpk.bipod_camera_pitch_limit = 10800
tweak_data.weapon.mg42.bipod_camera_spin_limit = 10800
tweak_data.weapon.mg42.bipod_camera_pitch_limit = 10800
tweak_data.weapon.par.bipod_camera_spin_limit = 10800
tweak_data.weapon.par.bipod_camera_pitch_limit = 10800
tweak_data.weapon.hk21.timers.deploy_bipod = 0
tweak_data.weapon.m249.timers.deploy_bipod = 0
tweak_data.weapon.rpk.timers.deploy_bipod = 0
tweak_data.weapon.mg42.timers.deploy_bipod = 0
tweak_data.weapon.par.timers.deploy_bipod = 0
WeaponLionGadget1.bipod_length = 9000
function WeaponLionGadget1:_is_deployable()
	if self._is_npc or not self:_get_bipod_obj() then
		return false
	end
	if self:_is_in_blocked_deployable_state() then
		return false
	end
	local bipod_rays = self:_shoot_bipod_rays()
	if not bipod_rays then
		return true
	end
	local bipod_min_length = 5
	if bipod_rays.forward then
		return true
	end
	if bipod_rays.left and bipod_min_length > bipod_rays.left.distance then
		return true
	end
	if bipod_rays.right and bipod_min_length > bipod_rays.right.distance then
		return true
	end
	if (bipod_rays.left or bipod_rays.right) and bipod_rays.center or bipod_rays.center then
		return true
	end
	return false
end
function WeaponLionGadget1:update(unit, t, dt)
	if self._deployed and managers.player:current_state() == "bipod" then
		managers.hud:on_hit_confirmed()
	end
end
dofile(ModPath .. "VRRecoilMain.lua")

local playercam = nil;

local enter_orig = PlayerHandStateWeapon.at_enter
function PlayerHandStateWeapon:at_enter(prev_state)
	local result = enter_orig(self, prev_state)
	
	playercam = managers.player:player_unit():camera() and managers.player:player_unit():camera():camera_unit():base()
	
	return result
end

local updateweapon_orig = PlayerHandStateWeapon.update
function PlayerHandStateWeapon:update(t, dt)
	local result = updateweapon_orig(self, t, dt)
	
	local verticalKick = playercam._recoil_kick.to_reduce or playercam._recoil_kick.accumulated
	local horizontalKick = playercam._recoil_kick.h.to_reduce or playercam._recoil_kick.h.accumulated
	
	if not verticalKick or not horizontalKick then
		return result
	end
	
	-- Reduce recoil if two-handing the weapon
	local is_assisting = self:hsm():other_hand():current_state_name() == "weapon_assist"
	if is_assisting then
		verticalKick = verticalKick * VRRecoil.TwohandedRecoilMultiplier
		horizontalKick = horizontalKick * VRRecoil.TwohandedRecoilMultiplier
	end
	
	local weaponRotation = self._weapon_unit:rotation()
	local weaponPitch = weaponRotation:pitch()
	local weaponYaw = weaponRotation:yaw()
	local weaponRoll = weaponRotation:roll()
	
	mrotation.set_yaw_pitch_roll(weaponRotation, weaponYaw + horizontalKick, weaponPitch + verticalKick, weaponRoll)
	self._weapon_unit:set_rotation(weaponRotation)
	
	return result
end
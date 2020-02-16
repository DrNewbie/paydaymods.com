local playercam = nil
local weaponInitialRotation = nil

local akimboenter_orig = PlayerHandStateAkimbo.at_enter
function PlayerHandStateAkimbo:at_enter(prev_state)
	local result = akimboenter_orig(self, prev_state)
	
	playercam = managers.player:player_unit():camera() and managers.player:player_unit():camera():camera_unit():base()
	weaponInitialRotation = self._weapon_unit:local_rotation()
	
	return result
end

local akimboupdate_orig = PlayerHandStateAkimbo.update
function PlayerHandStateAkimbo:update(t, dt)
	local result = akimboupdate_orig(self, t, dt)
	
	local verticalKick = playercam._recoil_kick.to_reduce or playercam._recoil_kick.accumulated
	local horizontalKick = playercam._recoil_kick.h.to_reduce or playercam._recoil_kick.h.accumulated
	
	if not verticalKick or not horizontalKick or not weaponInitialRotation then
		return result
	end
	
	local weaponRotation = mrotation.copy(weaponInitialRotation)
	local weaponPitch = weaponRotation:pitch()
	local weaponYaw = weaponRotation:yaw()
	local weaponRoll = weaponRotation:roll()
	
	mrotation.set_yaw_pitch_roll(weaponRotation, weaponYaw + horizontalKick, weaponPitch + verticalKick, weaponRoll)
	self._weapon_unit:set_local_rotation(weaponRotation)
	
	return result
end
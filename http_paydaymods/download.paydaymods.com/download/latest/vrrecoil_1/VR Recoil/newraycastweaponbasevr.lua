local __get_spread = NewRaycastWeaponBase._get_spread

-- Remove built-in "spread" recoil
function NewRaycastWeaponBaseVR:_get_spread(user_unit)
	local spread_x, spread_y = __get_spread(self, user_unit)

	return spread_x, spread_y
end
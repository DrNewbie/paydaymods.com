if mod_collection._data.enable_flashlight_extender then
	local angle = mod_collection._data.flashlight_angle --Angle/width of beam, 0-160 (default 60)
	local range = mod_collection._data.flashlight_range --Range of beam, 0+ (default 1000 -> 10m)

	local flash_cbk = WeaponFlashLight.init
	function WeaponFlashLight:init(unit)
		flash_cbk(self, unit)
		self._light:set_spot_angle_end(math.clamp(angle, 0, 160))
		self._light:set_far_range(range)
	end
end

Hooks:PostHook(PlayerMenu, "update", "LasersPlus_VRLaserHandUpdate", function(self, t, dt)
	local color = Color(0.05, 0, 1, 0)
	if LasersPlus:IsOwnLaserInvisible() then
		color = LasersPlus.col_invisible --no idea why you'd do this but okay
	end
	if LasersPlus:IsOwnLaserVanilla() then
		self._brush_laser = Draw:brush(Color(0.05, 0, 1, 0)) --this isn't set in tweak data so...  yeah
		self._brush_laser_dot = Draw:brush(Color(1, 0, 1, 0))
		return
	end
	if LasersPlus:IsOwnLaserCustom() then
		color = LasersPlus:GetOwnLaserColor()
	end
	if LasersPlus:IsMasterLaserStrobeEnabled() and LasersPlus:IsOwnLaserStrobeEnabled() then 
		color = LasersPlus:StrobeStep(LasersPlus:GetOwnLaserStrobe(),0.5)
		self._brush_warp = Draw:brush(color)--Color(0.07, 0, 0.60784, 0.81176))
	end
	self._brush_laser = Draw:brush(color) --set_color()?
	self._brush_laser_dot = Draw:brush(color)	
end)
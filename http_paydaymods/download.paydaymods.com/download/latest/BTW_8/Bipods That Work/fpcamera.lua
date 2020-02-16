function FPCameraPlayerBase:set_limits_btw(spin, pitch)
	self._limits = {}

	if spin then
		self._limits.spin = {
			mid = self._camera_properties.spin,
			offset = spin
		}
	end

	if pitch then
		if math.abs(self._camera_properties.pitch) > pitch then 
			self._limits.pitch = {
				mid = self._camera_properties.pitch,
				offset = math.abs(self._camera_properties.pitch)
			}
		else
			self._limits.pitch = {
				mid = 0,
				offset = 90 --pitch
			}
		end
	end
end
function SmokeScreenGrenade:_setup_server_data(...)
	SmokeScreenGrenade.super._setup_server_data(self, ...)
	self._timer = math.max(0.1,3.5 - TacticalGrenades.cook_t)

end

function SmokeScreenGrenade:update(unit, t, dt)
	if self._timer then
		self._timer = self._timer - dt
--		local vel = mvector3.length(self._unit:body("static_body"):velocity())
		if self._timer <= 0 then --and vel <= 1 then
			self._timer = nil
			self:_detonate()
		end
	end

	ProjectileBase.update(self, unit, t, dt)
end
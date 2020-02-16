if not SGO or not SGO.settings.use_cook then return end
function ElementBlurZone:on_executed(instigator)
	if not self._values.enabled then
		return
	end
	--if self._values.mode == 0 then
	--  managers.environment_controller:set_blurzone(self._values.mode)
	--else
	--  managers.environment_controller:set_blurzone(self._values.mode, self._values.position, self._values.radius, self._values.height)
	--end
	ElementBlurZone.super.on_executed(self, instigator)
end
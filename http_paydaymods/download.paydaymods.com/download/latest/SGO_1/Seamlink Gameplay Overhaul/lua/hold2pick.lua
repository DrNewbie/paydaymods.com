if not SGO or not SGO.settings.use_hold then return end
ObjectInteractionManager.AUTO_PICKUP_DELAY = 0.01 --Delay in seconds between auto-pickup procs (0 -> as fast as possible)

local _update_targeted_original = ObjectInteractionManager._update_targeted

function ObjectInteractionManager:_update_targeted(...)
	_update_targeted_original(self, ...)

	if alive(self._active_unit) then
		local t = Application:time()

		if self._active_unit:base() and self._active_unit:base().small_loot and managers.menu:get_controller():get_input_bool("interact") and (t >= (self._next_auto_pickup_t or 0)) then
			self._next_auto_pickup_t = t + ObjectInteractionManager.AUTO_PICKUP_DELAY
			self:interact(managers.player:player_unit())
		end
	end
end
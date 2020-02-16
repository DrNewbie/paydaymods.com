if mod_collection and mod_collection._data.enable_speed_up and mod_collection._data.stat_screen_skip_enabled then
	local SKIP_STAT_SCREEN_DELAY = mod_collection._data.stat_screen_skip

	local update_original = StageEndScreenGui.update

	function StageEndScreenGui:update(t, ...)
		update_original(self, t, ...)
		if not self._button_not_clickable and SKIP_STAT_SCREEN_DELAY >= 0 then
			self._auto_continue_t = self._auto_continue_t or (t + SKIP_STAT_SCREEN_DELAY)
			if t >= self._auto_continue_t then
				managers.menu_component:post_event("menu_enter")
				game_state_machine:current_state()._continue_cb()
			end
		end
	end
end

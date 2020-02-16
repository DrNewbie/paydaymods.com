if mod_collection and mod_collection._data.enable_speed_up then
	local SKIP_BLACKSCREEN = mod_collection._data.black_screen_skip

	local update_original = IngameWaitingForPlayersState.update
	
	function IngameWaitingForPlayersState:update(...)
		update_original(self, ...)
		
		if self._skip_promt_shown and SKIP_BLACKSCREEN then
			self:_skip()
		end
	end
end
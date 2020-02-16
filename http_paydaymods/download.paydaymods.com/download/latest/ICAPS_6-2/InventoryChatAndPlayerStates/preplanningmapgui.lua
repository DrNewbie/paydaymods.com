
if InventoryChatAndPlayerStates_PrePlanningMapGui_Hooked then
	return
else
	InventoryChatAndPlayerStates_PrePlanningMapGui_Hooked = true
end

local setup_actual = PrePlanningMapGui.setup
function PrePlanningMapGui:setup(...)
	setup_actual(self, ...)

	if MenuCallbackHandler:is_multiplayer() and managers.network:session() then
		-- Reposition the drawing tools panel so it is above the player states row
		self._drawing_panel:set_bottom(self._drawboard_button:top() - 25)
	end
end

local set_drawboard_button_position_actual = PrePlanningMapGui.set_drawboard_button_position
function PrePlanningMapGui:set_drawboard_button_position(...)
	set_drawboard_button_position_actual(self, ...)

	if self._drawboard_button and MenuCallbackHandler:is_multiplayer() and managers.network:session() then
		-- Stomp the drawing tools panel's position so it is once again above the player states row
		self._drawing_panel:set_bottom(self._drawboard_button:top() - 25)
	end
end

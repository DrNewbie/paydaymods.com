
if InventoryChatAndPlayerStates_PlayerInventoryGui_Hooked then
	return
else
	InventoryChatAndPlayerStates_PlayerInventoryGui_Hooked = true
end

local init_actual = PlayerInventoryGui.init
function PlayerInventoryGui:init(...)
	init_actual(self, ...)

	if not MenuCallbackHandler:is_multiplayer() or not managers.network:session() then
		return
	end

	if not alive(self._panel) then
		return
	end
	local info_panel = self._panel:child("info_panel")
	if not alive(info_panel) then
		return
	end
	if self._multi_profile_item == nil then
		return
	end
	local basepanel = self._multi_profile_item._panel
	local boxpanel = self._multi_profile_item._box_panel
	if not alive(basepanel) or not alive(boxpanel) then
		return
	end
	local current_bottom = basepanel:bottom()
	basepanel:set_bottom(info_panel:bottom())
	boxpanel:set_bottom(boxpanel:bottom() - (current_bottom - basepanel:bottom()))
end

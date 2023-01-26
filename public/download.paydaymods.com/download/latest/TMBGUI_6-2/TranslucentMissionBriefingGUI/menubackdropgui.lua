
if TranslucentMissionBriefingGUI_MenuBackdropGUI_Hooked then
	return
else
	TranslucentMissionBriefingGUI_MenuBackdropGUI_Hooked = true
end

-- MenuBackdropGUI:init() hook code moved to HUDMissionBriefing:init(), refer to the latter for details

local close_actual = MenuBackdropGUI.close
function MenuBackdropGUI:close(...)
	local TranslucentMissionBriefingGUI = _G.TranslucentMissionBriefingGUI
	if TranslucentMissionBriefingGUI ~= nil then
		for panel, __ in pairs(TranslucentMissionBriefingGUI.ElementsToHide) do
			TranslucentMissionBriefingGUI.ElementsToHide[panel] = nil
		end
	end

	close_actual(self, ...)
end

-- Retrieve a reference to the black background panel (only visible in non-16:9 aspect ratio resolutions)
local create_black_borders_actual = MenuBackdropGUI.create_black_borders
function MenuBackdropGUI:create_black_borders(...)
	create_black_borders_actual(self, ...)

	local TranslucentMissionBriefingGUI = _G.TranslucentMissionBriefingGUI
	if TranslucentMissionBriefingGUI ~= nil then
		local tmp = self._black_bg_ws
		if not alive(tmp) then
			return
		end
		tmp = self._black_bg_ws:panel()
		if not alive(tmp) then
			return
		end
		TranslucentMissionBriefingGUI.ElementsToHide[tmp] = true
	end
end

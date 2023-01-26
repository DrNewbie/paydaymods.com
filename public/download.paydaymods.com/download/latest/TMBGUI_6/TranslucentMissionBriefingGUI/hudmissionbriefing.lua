
local init_actual = HUDMissionBriefing.init
function HUDMissionBriefing:init(...)
	init_actual(self, ...)

	local TranslucentMissionBriefingGUI = _G.TranslucentMissionBriefingGUI
	if TranslucentMissionBriefingGUI == nil then
		return
	end

	-- Moved here from MenuBackdropGUI:init() to avoid inadvertently hooking all other irrelevant instances of MenuBackdropGUI as
	-- well (which causes missing backgrounds for some in-game GUI screens, such as the offshore account displays in the safe
	-- house vault)
	local backdrop = self._backdrop
	if backdrop ~= nil and alive(backdrop._panel) then
		local elementnames = TranslucentMissionBriefingGUI.ElementNames
		-- This feels rather icky to be placed here, but I guess I don't really have a choice...
		local Holo = _G.Holo
		if Holo ~= nil then
			-- Checking 'Base/Menu' instead of Holo:ShouldModify("Menu", "Menu/Lobby") since the backdrop is always present, even
			-- when lobby modification is disabled
			if Holo.Options ~= nil and type(Holo.Options.GetValue) == "function" and Holo.Options:GetValue("Base/Menu") then
				elementnames.base_layer = nil
				elementnames.pattern_layer = nil
				elementnames.particles_layer = nil
				elementnames.light_layer = nil
				elementnames.background_simple = true
			end
		end

		for __, panel in pairs(backdrop._panel:children() or {}) do
			if alive(panel) and elementnames[panel:name()] then
				TranslucentMissionBriefingGUI.ElementsToHide[panel] = true
			end
		end
	end

	local elements = TranslucentMissionBriefingGUI.ElementsToHide
	-- Hide the contact's animated video loop
	if alive(self._background_layer_two) then
		elements[self._background_layer_two] = true
	end
	if _G.PDTH_Menu == nil then
		-- Hide the large (job) text
		if alive(self._background_layer_three) then
			elements[self._background_layer_three] = true
		end
	else
		-- PD:TH Menu-specific elements
		local tmp = self._upper_frame_gradient
		if alive(tmp) then
			elements[tmp] = true
		end
		tmp = self._lower_frame_gradient
		if alive(tmp) then
			elements[tmp] = true
		end
		tmp = self._pd2_logo
		if alive(tmp) then
			elements[tmp] = true
		end
		tmp = self._info_bg_rect
		if alive(tmp) then
			elements[tmp] = true
		end
		tmp = self._level_image
		if alive(tmp) then
			elements[tmp] = true
		end
	end
end


if BlackmarketPersistentNames_SkillTreeGUI_Hooked then
	return
else
	BlackmarketPersistentNames_SkillTreeGUI_Hooked = true
end

local dimmed = Color(0.4, 0.4, 0.4)

local refresh_actual = SpecializationTierItem.refresh
function SpecializationTierItem:refresh(...)
	if not alive(self._tier_panel) or (self._tier % 2) == 1 then
		return refresh_actual(self, ...)
	end

	local BlackmarketPersistentNames = _G.BlackmarketPersistentNames
	local prefs = BlackmarketPersistentNames.Prefs
	if prefs ~= nil then
		if not prefs.DimCommonPerkCards then
			return refresh_actual(self, ...)
		end
	end

	refresh_actual(self, ...)

	local unlocked_bg = self._tier_panel:child("unlocked_bg")
	if not alive(unlocked_bg) then
		return
	end

	local dlc = tweak_data:get_raw_value("skilltree", "specializations", self._tree, "dlc")
	if dlc == nil or managers.dlc:is_dlc_unlocked(dlc) then
		unlocked_bg:set_color(dimmed)
	end
end

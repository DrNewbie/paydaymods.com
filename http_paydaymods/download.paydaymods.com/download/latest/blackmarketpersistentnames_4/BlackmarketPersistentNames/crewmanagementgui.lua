
if BlackmarketPersistentNames_CrewManagementGui_Hooked then
	return
else
	BlackmarketPersistentNames_CrewManagementGui_Hooked = true
end

local populate_custom_actual = CrewManagementGui.populate_custom
function CrewManagementGui:populate_custom(category, henchman_index, tweak, list, data, ...)
	populate_custom_actual(self, category, henchman_index, tweak, list, data, ...)

	local BlackmarketPersistentNames = _G.BlackmarketPersistentNames
	local prefs = BlackmarketPersistentNames.Prefs
	if prefs ~= nil then
		if not prefs.CrewAbilityBoostNames then
			return
		end
	end

	-- The crew ability and boost selection screens do not display empty slots, so no checks are needed
	local count = #data
	for i = 1, count do
		local tbl = data[i]
		-- Since custom names are always shown, trick the common GUI code into thinking all items have custom names
		tbl.custom_name_text = BlackmarketPersistentNames:SplitString(tbl.custom_name_text or tbl.name_localized)
	end
end

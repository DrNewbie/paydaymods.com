
if BlackmarketPersistentNames_MissionBriefingGui_Hooked then
	return
else
	BlackmarketPersistentNames_MissionBriefingGui_Hooked = true
end

-- The following code affects only the mission briefing GUI loadout blackmarket GUI

-- NewLoadoutTab:populate_primaries() and NewLoadoutTab:populate_secondaries() are not called at all

local whitelisted_categories = {
	primaries = true,
	secondaries = true
}

local populate_category_actual = NewLoadoutTab.populate_category
function NewLoadoutTab:populate_category(data, ...)
	populate_category_actual(self, data, ...)

	if not whitelisted_categories[data.category] then
		return
	end

	local BlackmarketPersistentNames = _G.BlackmarketPersistentNames
	local prefs = BlackmarketPersistentNames.Prefs
	if prefs ~= nil then
		if not prefs.PriSecWeaponNames then
			return
		end
	end

	local count = #data
	for i = 1, count do
		local tbl = data[i]
		if tbl.name ~= "empty_slot" then
			-- Since custom names are always shown, trick the game code into thinking all weapons have custom names
			tbl.custom_name_text = BlackmarketPersistentNames:SplitString(tbl.custom_name_text or tbl.name_localized)
		end
	end
end

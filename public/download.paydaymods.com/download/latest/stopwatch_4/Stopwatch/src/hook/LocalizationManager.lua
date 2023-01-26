local Mod = _G.StopwatchMod.Mod

Hooks:Add("LocalizationManagerPostInit", "Stopwatch_LocalizationManagerPostInit", function(loc)
	for _, filename in pairs(file.GetFiles(Mod.LOCALIZATION_PATH)) do
		local str = filename:match('^(.*).json$')
		if str and Idstring(str) and Idstring(str):key() == SystemInfo:language():key() then
			loc:load_localization_file(Mod.LOCALIZATION_PATH .. "/" .. filename)
			break
		end
	end

	loc:load_localization_file(Mod.LOCALIZATION_PATH .. "english.json", false)
end)
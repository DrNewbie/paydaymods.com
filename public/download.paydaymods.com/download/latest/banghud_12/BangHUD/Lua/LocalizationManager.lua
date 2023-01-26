
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_BangHUD", function(loc)
	local language_filename

	if BLT.Localization._current == 'cht' or BLT.Localization._current == 'zh-cn' then
		language_filename = 'chinese.json'
	end

	if not language_filename then
		local modname_to_language = {
			['ChnMod (Patch)'] = 'chinese.json',
		}
		for _, mod in pairs(BLT and BLT.Mods:Mods() or {}) do
			language_filename = mod:IsEnabled() and modname_to_language[mod:GetName()]
			if language_filename then
				break
			end
		end
	end

	if not language_filename then
		for _, filename in pairs(file.GetFiles(BangHUD._path .. 'Loc/')) do
			local str = filename:match('^(.*).json$')
			if str and Idstring(str) and Idstring(str):key() == SystemInfo:language():key() then
				language_filename = filename
				break
			end
		end
	end

	if language_filename then
		loc:load_localization_file(BangHUD._path .. 'Loc/' .. language_filename)
	end
	loc:load_localization_file(BangHUD._path .. "Loc/english.json", false)
end)

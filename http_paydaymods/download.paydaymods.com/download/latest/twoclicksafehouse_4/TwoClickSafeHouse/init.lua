
_G.TwoClickSafeHouse = _G.TwoClickSafeHouse or {}

-- Paths
if TwoClickSafeHouse.ModPath == nil then
	TwoClickSafeHouse.ModPath = ModPath
end
TwoClickSafeHouse.SaveFile = TwoClickSafeHouse.SaveFile or SavePath .. "twoclicksafehouse.txt"
TwoClickSafeHouse.ModOptions = TwoClickSafeHouse.ModPath .. "menus/modoptions.txt"

-- Preferences
TwoClickSafeHouse.Prefs = {}
TwoClickSafeHouse.DefPrefs = {
	OpenU110SafeHouseGUIInstead = false,
	DefaultSelection = 1,
	NoConfirmation = false
}

-- Based upon TdlQ's Lobby Player Info mod's localizations loading code
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_TwoClickSafeHouse", function(loc)
	local commonpath = TwoClickSafeHouse.ModPath .. "localizations/"
	if _G.PD2KR then
		loc:load_localization_file(commonpath .. "korean.txt")
	else
		local GetFiles = _G.file.GetFiles
		local Idstring = _G.Idstring
		local activelanguagekey = SystemInfo:language():key()
		for __, filename in ipairs(GetFiles(commonpath)) do
			if Idstring(filename:match("^(.*).txt$") or ""):key() == activelanguagekey then
				loc:load_localization_file(commonpath .. filename)
				break
			end
		end
	end

	loc:load_localization_file(commonpath .. "english.txt", false)
end)

function TwoClickSafeHouse:Load()
	local f = io.open(self.SaveFile, "r")
	if f ~= nil then
		for key, value in pairs(json.decode(f:read("*all"))) do
			self.Prefs[key] = value
		end
		f:close()
	end

	-- Fill in the missing preferences with default values
	for key, value in pairs(self.DefPrefs) do
		if self.Prefs[key] == nil then
			self.Prefs[key] = value
		end
	end

	self.Prefs.DefaultSelection = math.clamp(self.Prefs.DefaultSelection, 1, 3)
end

function TwoClickSafeHouse:Save()
	local f = io.open(self.SaveFile, "w+")
	if f ~= nil then
		local output = json.encode(self.Prefs)
		-- JSON4Lua, please...  >.<
		f:write(output ~= "[]" and output or "{}")
		f:close()
	end
end

TwoClickSafeHouse:Load()

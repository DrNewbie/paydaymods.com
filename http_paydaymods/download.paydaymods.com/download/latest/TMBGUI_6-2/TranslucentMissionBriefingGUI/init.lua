
_G.TranslucentMissionBriefingGUI = _G.TranslucentMissionBriefingGUI or {
	ElementNames = {
		base_layer = true,
		pattern_layer = true,
		particles_layer = true,
		light_layer = true,
--		item_background_layer = true	-- Do not hide this layer here as doing so affects the animated video and the risk and
										-- days icons (each has its own instance, but all instances share this same name). See
										-- HUDMissionBriefing:init() instead as they are instantiated there
	},

	-- This table will hold references to the GUI elements to be made transparent
	ElementsToHide = {}
}

-- Is the background currently visible?
TranslucentMissionBriefingGUI.BackgroundVisible = true

-- Paths
if TranslucentMissionBriefingGUI.ModPath == nil then
	TranslucentMissionBriefingGUI.ModPath = ModPath
end
TranslucentMissionBriefingGUI.SaveFile = TranslucentMissionBriefingGUI.SaveFile or SavePath .. "translucentmissionbriefinggui.txt"
TranslucentMissionBriefingGUI.ModOptions = TranslucentMissionBriefingGUI.ModPath .. "menus/modoptions.txt"

-- Preferences
TranslucentMissionBriefingGUI.Prefs = {}
TranslucentMissionBriefingGUI.DefPrefs = {}

-- Determines whether the elements to be hidden are faded in or out instead of being hidden instantaneously
TranslucentMissionBriefingGUI.DefPrefs.FadeElements = true

-- Determines the time taken to fade elements in/out, in seconds. Has no effect if FadeElements is false
TranslucentMissionBriefingGUI.DefPrefs.FadeDuration = 0.5

-- Determines whether the background is automatically hidden as soon as the 'Show Context' button is enabled
TranslucentMissionBriefingGUI.DefPrefs.AutoHideBackground = true

-- Based upon TdlQ's Lobby Player Info mod's localizations loading code
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_TranslucentMissionBriefingGUI", function(loc)
	local commonpath = TranslucentMissionBriefingGUI.ModPath .. "localizations/"
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

function TranslucentMissionBriefingGUI:Load()
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

	if self.Prefs.FadeDuration < 0.1 then
		self.Prefs.FadeDuration = 0.1
	end
end

function TranslucentMissionBriefingGUI:Save()
	local f = io.open(self.SaveFile, "w+")
	if f ~= nil then
		local output = json.encode(self.Prefs)
		-- JSON4Lua, please...  >.<
		f:write(output ~= "[]" and output or "{}")
		f:close()
	end
end

TranslucentMissionBriefingGUI:Load()

-- By Igor Skoric
-- http://lua-users.org/wiki/SimpleRound
function TranslucentMissionBriefingGUI.RoundToDecimalPrecision(num, idp)
    local mult = 10 ^ (idp or 0)
    if num >= 0 then
		return math.floor(num * mult + 0.5) / mult
    else
		return math.ceil(num * mult - 0.5) / mult
	end
end


_G.WaypointTweaks = _G.WaypointTweaks or {}

-- Paths
if WaypointTweaks.ModPath == nil then
	WaypointTweaks.ModPath = ModPath
end
WaypointTweaks.SaveFile = WaypointTweaks.SaveFile or SavePath .. "waypointtweaks.txt"
WaypointTweaks.ModOptions = WaypointTweaks.ModPath .. "menus/modoptions.txt"

-- Preferences
WaypointTweaks.Prefs = {}
WaypointTweaks.DefPrefs = {}

-- Determines the time taken for an off-screen waypoint to settle into orbit around the center of the screen or for it to settle
-- back into its normal on-screen position, in seconds
WaypointTweaks.DefPrefs.Duration = 1.0

-- Determines the radius from the center of the screen around which all off-screen waypoints will orbit
WaypointTweaks.DefPrefs.Radius = 160

-- Standard IEEE rounding to nearest integer (round half away from zero)
do
	local floor = math.floor
	local ceil = math.ceil
	function WaypointTweaks.RoundToNearest(real)
		return real >= 0 and floor(real + 0.5) or ceil(real - 0.5)
	end
end

-- Based upon TdlQ's Lobby Player Info mod's localizations loading code
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_WaypointTweaks", function(loc)
	local commonpath = WaypointTweaks.ModPath .. "localizations/"
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

function WaypointTweaks:Load()
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

	if self.Prefs.Duration < 0 then
		self.Prefs.Duration = 0
	end

	if self.Prefs.Radius < 5 then
		self.Prefs.Radius = 5
	end
end

function WaypointTweaks:Save()
	local f = io.open(self.SaveFile, "w+")
	if f ~= nil then
		f:write(json.encode(self.Prefs))
		f:close()
	end
end

WaypointTweaks:Load()

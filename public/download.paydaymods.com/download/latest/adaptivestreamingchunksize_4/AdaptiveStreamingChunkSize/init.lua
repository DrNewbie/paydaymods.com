
_G.AdaptiveStreamingChunkSize = _G.AdaptiveStreamingChunkSize or {
	ValidSizes = {
		32,
		64,
		128,
		256,
		512,
		1024,
		2048,
		4096
	}
}

-- Paths
if AdaptiveStreamingChunkSize.ModPath == nil then
	AdaptiveStreamingChunkSize.ModPath = ModPath
end
AdaptiveStreamingChunkSize.SaveFile = AdaptiveStreamingChunkSize.SaveFile or SavePath .. "adaptivestreamingchunksize.txt"

-- Preferences
AdaptiveStreamingChunkSize.Prefs = {}
AdaptiveStreamingChunkSize.DefPrefs = {}

-- Determines the minimum streaming chunk size applied by the mod (defaults to 128 since 32 is likely to be too aggressive)
AdaptiveStreamingChunkSize.DefPrefs.MinimumStreamingChunkSize = 128

-- Determines the maximum streaming chunk size applied by the mod
AdaptiveStreamingChunkSize.DefPrefs.MaximumStreamingChunkSize = 4096

-- Based upon TdlQ's Lobby Player Info mod's localizations loading code
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_AdaptiveStreamingChunkSize", function(loc)
	local commonpath = AdaptiveStreamingChunkSize.ModPath .. "localizations/"
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

function AdaptiveStreamingChunkSize:Load()
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

	local sizes = self.ValidSizes
	local count = #sizes
	local validsizesverifier = {}
	for i = 1, count do
		validsizesverifier[sizes[i]] = true
	end

	if not validsizesverifier[self.Prefs.MinimumStreamingChunkSize] then
		self.Prefs.MinimumStreamingChunkSize = validsizesverifier[#validsizesverifier]
	end
	if not validsizesverifier[self.Prefs.MaximumStreamingChunkSize] then
		self.Prefs.MaximumStreamingChunkSize = validsizesverifier[#validsizesverifier]
	end

	if self.Prefs.MaximumStreamingChunkSize < self.Prefs.MinimumStreamingChunkSize then
		self.Prefs.MaximumStreamingChunkSize = self.Prefs.MinimumStreamingChunkSize
	end
end

function AdaptiveStreamingChunkSize:Save()
	local f = io.open(self.SaveFile, "w+")
	if f ~= nil then
		local output = json.encode(self.Prefs)
		f:write(output ~= "[]" and output or "{}")
		f:close()
	end
end

AdaptiveStreamingChunkSize:Load()

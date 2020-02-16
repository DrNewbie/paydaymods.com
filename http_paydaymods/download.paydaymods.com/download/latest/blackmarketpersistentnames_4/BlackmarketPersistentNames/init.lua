
_G.BlackmarketPersistentNames = _G.BlackmarketPersistentNames or {}

-- Preferences
BlackmarketPersistentNames.Prefs = {}
BlackmarketPersistentNames.DefPrefs = {
	PriSecWeaponNames = true,
	MeleeWeaponNames = true,
	BuyWeaponNames = true,
	WeaponModNames = true,
	WeaponSkinNames = true,
	CharacterNames = true,
	MaskNames = true,
	BuyMaskNames = true,
	MaskModNames = true,
	SteamInventoryNames = true,
	ThrowableWeaponNames = true,
	DeployableNames = true,
	ArmorNames = true,
	SkillNames = true,
	DimCommonPerkCards = true,
	CrewAbilityBoostNames = true,
	NeverDimCustomNames = true,
	SuppressCustomNameQuotes = false,
	StringSplitThreshold = 15
}

-- Paths
if BlackmarketPersistentNames.ModPath == nil then
	BlackmarketPersistentNames.ModPath = ModPath
end
BlackmarketPersistentNames.SaveFile = BlackmarketPersistentNames.SaveFile or SavePath .. "blackmarketpersistentnames.txt"
BlackmarketPersistentNames.ModOptions = BlackmarketPersistentNames.ModPath .. "menus/modoptions.txt"

-- Based upon TdlQ's Lobby Player Info mod's localizations loading code
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_BlackmarketPersistentNames", function(loc)
	local commonpath = BlackmarketPersistentNames.ModPath .. "localizations/"
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

-- Standard IEEE rounding to the nearest integer (round half away from zero)
do
	local floor = math.floor
	local ceil = math.ceil
	function BlackmarketPersistentNames.RoundToNearest(real)
		return real >= 0 and floor(real + 0.5) or ceil(real - 0.5)
	end
end

function BlackmarketPersistentNames:Load()
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
end

function BlackmarketPersistentNames:Save()
	local f = io.open(self.SaveFile, "w+")
	if f ~= nil then
		local output = json.encode(self.Prefs)
		-- JSON4Lua, please...  >.<
		f:write(output ~= "[]" and output or "{}")
		f:close()
	end
end

BlackmarketPersistentNames:Load()

local inputbuffer = {}
local outputbuffer = {}
function BlackmarketPersistentNames:SplitString(str)
	local maxlength = self.Prefs.StringSplitThreshold or 15
	if maxlength < 0 then
		return str
	end

	-- The following code isn't really memory-friendly, but I guess there's no memory-friendly way to manipulate strings like
	-- this in Lua anyway - especially not when it's so intent on internalizing strings with its string pool  :/
	local currentlength = 0
	local gmatch = string.gmatch
	local table = _G.table
	local insert = table.insert
	-- 'explode' the entire string into word chunks, delimited by whitespace, and store the pieces in the inputbuffer table
	for word in gmatch(str, "%S+") do
		insert(inputbuffer, word)
	end
	for i = 1, #inputbuffer do
		local word = inputbuffer[i]
		local wordlength = word:len()
		if currentlength > 0 then
			if currentlength + wordlength >= maxlength then
				insert(outputbuffer, "\n")
				currentlength = 0
			else
				insert(outputbuffer, " ")
				currentlength = currentlength + 1
			end
		end
		currentlength = currentlength + wordlength
		insert(outputbuffer, word)
	end

	local result = table.concat(outputbuffer)

	for i = 1, #inputbuffer do
		inputbuffer[i] = nil
	end
	for i = 1, #outputbuffer do
		outputbuffer[i] = nil
	end

	return result
end

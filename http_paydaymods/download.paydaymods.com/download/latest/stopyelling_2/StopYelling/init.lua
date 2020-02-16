
if StopYelling_CoreSystem_Hooked then
	return
else
	StopYelling_CoreSystem_Hooked = true
end

_G.StopYelling = _G.StopYelling or {
	Hook = {
		WaveState = "",
		RawFn = nil
	},
	-- If this is true, the mod is considered to have failed initialization and must hereon function only in passthrough mode
	-- without causing crashes
	FailState = false,
	-- This table holds voices (keys) and their corresponding internal character names (values)
	-- E.g.: rb4 <-> russian	(Dallas)
	VoiceCharacterLookup = {},
	-- The reverse of VoiceCharacterLookup above, used in StopYelling:RecheckCriminals()
	CharacterVoiceLookup = {},
	-- These sounds are whitelisted since they lack control phase versions (and would otherwise become completely silent)
	WhitelistedSounds = {
		["8.8321675366221e-315"] = true
	},
	-- Special unit kill lines are delayed by a seemingly random interval, defer the state change until then to avoid
	-- inadvertently influencing other voices
	-- Post-LuaJIT, Sound IDs are now stored as strings since the 'number' values returned by SoundDevice:string_to_id() are very
	-- odd in that attempting to use them as table indexes causes them to be rounded to 0 (unlike other 'normal' number values),
	-- so the resulting table has exactly one entry in it (which makes it utterly useless). Yeah, I don't like having tons of
	-- unique strings pointlessly hogging up memory either, but what choice do I have?  :/
	DelayedSounds = {
		["1.831920571739e-314"] = 0.9,
		["2.047851857018e-314"] = 0.9,
		["2.1035584043304e-314"] = 0.9,
		["1.5336065875151e-315"] = 0.9,
		["6.9025436830428e-315"] = 0.9,
		["2.0333705592453e-314"] = 0.9
	}
}
-- Do not allow the Hook subtable to prevent garbage collection. More for correctness than function anyway
setmetatable(StopYelling.Hook, {__mode = "v"})

-- Preferences
StopYelling.Prefs = {}

StopYelling.Prefs.AllowWhitelistedSounds = true
StopYelling.Prefs.AffectDelayedSounds = true

-- Paths
if StopYelling.ModPath == nil then
	StopYelling.ModPath = ModPath
end
StopYelling.SaveFile = StopYelling.SaveFile or SavePath .. "stopyelling.txt"

function StopYelling:Load()
	local f = io.open(self.SaveFile, "r")
	if f ~= nil then
		for key, value in pairs(json.decode(f:read("*all"))) do
			self.Prefs[key] = value
		end
		f:close()
	end
end

function StopYelling:Save()
	local f = io.open(self.SaveFile, "w+")
	if f ~= nil then
		local output = json.encode(self.Prefs)
		-- JSON4Lua, please...  >.<
		f:write(output ~= "[]" and output or "{}")
		f:close()
	end
end

function StopYelling:RecheckCriminals()
	local criminalsmanager = managers.criminals
	if criminalsmanager == nil then
		return
	end

	local characters = criminalsmanager:characters()
	if characters == nil then
		return
	end

	for __, data in ipairs(characters) do
		local unit = data.unit
		if data.taken and alive(unit) and unit:id() ~= -1 then
			local name = data.name
			local sound = unit:sound()
			if sound ~= nil then
				-- Could actually use data.static_data.voice instead, but w/e...
				name = self.CharacterVoiceLookup[name]
				if name ~= nil then
					sound:set_voice(name)
				end
			end
		end
	end
end

StopYelling:Load()

if StopYelling.Hook.RawFn ~= nil then
	return
end

local SoundDevice = _G.SoundDevice
if SoundDevice ~= nil and SoundDevice:alive() then
	local SoundDeviceMT = getmetatable(SoundDevice)
	if SoundDeviceMT ~= nil then
		local set_state_actual = SoundDeviceMT.set_state
		StopYelling.Hook.RawFn = set_state_actual
		SoundDeviceMT.set_state = function(self, param1, param2, ...)
			if param1 == "wave_flag" then
				StopYelling.Hook.WaveState = param2
			end
			return set_state_actual(self, param1, param2, ...)
		end
	else
		StopYelling.FailState = true
		log("[StopYelling] init.lua | Error: SoundDeviceMT is nil")
	end
else
	StopYelling.FailState = true
	log("[StopYelling] init.lua | Error: SoundDevice is nil or invalid")
end

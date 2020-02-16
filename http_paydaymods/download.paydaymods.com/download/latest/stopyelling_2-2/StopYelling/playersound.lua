
if StopYelling_PlayerSound_Hooked then
	return
else
	StopYelling_PlayerSound_Hooked = true
end

local set_voice_actual = PlayerSound.set_voice
function PlayerSound:set_voice(voice, ...)
	local StopYelling = _G.StopYelling
	if not StopYelling or StopYelling.FailState or StopYelling.VoiceCharacterLookup == nil or StopYelling.Prefs == nil then
		return set_voice_actual(self, voice, ...)
	end

	local charactername = StopYelling.VoiceCharacterLookup[voice]
	if charactername ~= nil then
		self.StopYelling_ForceNonAssault = StopYelling.Prefs[charactername]
	end

	return set_voice_actual(self, voice, ...)
end

-- Forward function declarations
local DeferredStateChange = nil
local DeferredStateRevert = nil

local _play_actual = PlayerSound._play
function PlayerSound:_play(sound_name, ...)
	if not self.StopYelling_ForceNonAssault then
		return _play_actual(self, sound_name, ...)
	end

	local SoundDevice = _G.SoundDevice
	if not alive(SoundDevice) then
		return _play_actual(self, sound_name, ...)
	end

	local StopYelling = _G.StopYelling
	if not StopYelling or StopYelling.FailState then
		return _play_actual(self, sound_name, ...)
	end

	-- LuaJIT compatibility: Sound IDs are now forced to strings, read the comments at the StopYelling.DelayedSounds table's
	-- definition for details
	local sound = tostring(type(sound_name) == "string" and SoundDevice:string_to_id(sound_name) or sound_name)

	if StopYelling.Prefs.AllowWhitelistedSounds then
		local whitelist = StopYelling.WhitelistedSounds
		if whitelist ~= nil and whitelist[sound] then
			return _play_actual(self, sound_name, ...)
		end
	end

	if StopYelling.Prefs.AffectDelayedSounds then
		local delay = StopYelling.DelayedSounds[sound]
		if delay ~= nil then
			DelayedCallsFix:Add("StopYelling_DeferredStateChange", delay, DeferredStateChange)
			return _play_actual(self, sound_name, ...)
		end
	end

	StopYelling = StopYelling.Hook
	if not StopYelling or StopYelling.RawFn == nil or StopYelling.WaveState == nil or StopYelling.WaveState == "" then
		return _play_actual(self, sound_name, ...)
	end

	local previouswave = StopYelling.WaveState
	StopYelling.RawFn(SoundDevice, "wave_flag", "control")
	local result = _play_actual(self, sound_name, ...)
	StopYelling.RawFn(SoundDevice, "wave_flag", previouswave)
	return result
end

local deferred_previouswave = "assault"

DeferredStateChange = function()
	local SoundDevice = _G.SoundDevice
	if not alive(SoundDevice) then
		return
	end

	local StopYelling = _G.StopYelling
	if not StopYelling or StopYelling.FailState then
		return
	end

	StopYelling = StopYelling.Hook
	if not StopYelling or StopYelling.RawFn == nil or StopYelling.WaveState == nil or StopYelling.WaveState == "" then
		return
	end

	deferred_previouswave = StopYelling.WaveState
	StopYelling.RawFn(SoundDevice, "wave_flag", "control")
	DelayedCallsFix:Add("StopYelling_DeferredStateRevert", 0.25, DeferredStateRevert)
end

DeferredStateRevert = function()
	local SoundDevice = _G.SoundDevice
	if not alive(SoundDevice) then
		return
	end

	local StopYelling = _G.StopYelling
	if not StopYelling or StopYelling.FailState then
		return
	end

	StopYelling = StopYelling.Hook
	if not StopYelling or StopYelling.RawFn == nil or StopYelling.WaveState == nil or StopYelling.WaveState == "" then
		return
	end

	StopYelling.RawFn(SoundDevice, "wave_flag", deferred_previouswave)
end

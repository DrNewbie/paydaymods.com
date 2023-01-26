
if StopYelling_TeamAISound_Hooked then
	return
else
	StopYelling_TeamAISound_Hooked = true
end

local set_voice_actual = TeamAISound.set_voice
function TeamAISound:set_voice(voice, ...)
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

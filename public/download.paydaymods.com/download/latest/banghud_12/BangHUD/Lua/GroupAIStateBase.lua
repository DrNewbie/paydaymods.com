
local set_whisper_mode_original = GroupAIStateBase.set_whisper_mode

function GroupAIStateBase:set_whisper_mode(...)
	set_whisper_mode_original(self, ...)
	if managers.hud and managers.hud._hud_banghud then
		managers.hud._hud_banghud:update_visbility()
	end
end

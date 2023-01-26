if not SGO or not SGO.settings.use_mobj then return end
local _present_mid_text_real = _present_mid_text_real or HUDManager.present_mid_text
function HUDManager:present_mid_text(params)
	if params.event and params.event == "stinger_objectivecomplete" then
		params.event = nil
	end
	_present_mid_text_real(self, params)
end
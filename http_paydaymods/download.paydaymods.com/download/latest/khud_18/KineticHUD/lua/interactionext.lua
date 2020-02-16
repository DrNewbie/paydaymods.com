--todo macro this stuff with localizations 
local orig_selected = BaseInteractionExt.selected
function BaseInteractionExt:selected(player, locator, hand_id,...)
	local tid = self.tweak_data
--	KineticHUD:_debug("selected " .. (tid or "none") .. " " .. Application:time(),2)
	local result = orig_selected(self,player,locator,hand_id,...) --old posthook; if your crashlog points here, it's NOT KineticHUD's fault

	if result and self._unit and alive(self._unit) then 
		managers.hud:set_khud_scanner_info(tid,self._unit)
	end
	
	return result
end
Hooks:PostHook(PlayerStandard,"_end_action_steelsight","playerstandard__end_action_steelsight_tacticallean",function(self,t)
	if TacticalLean.current_lean then
		TacticalLean:update_lean_stance()
	end
end)

Hooks:PostHook(PlayerStandard,"_start_action_steelsight","playerstandard__start_action_steelsight_tacticallean",function(self,t,gadget_state)
	if TacticalLean.current_lean and not TacticalLean.exiting_lean then
		TacticalLean:update_lean_stance()
	end
end)

local orig_check_bipod = PlayerStandard._check_action_deploy_bipod
function PlayerStandard:_check_action_deploy_bipod(t,input)
	if not TacticalLean.current_lean then --or TacticalLean.exiting_lean then
		return orig_check_bipod(self,t,input)
	end
end

Hooks:PostHook(PlayerStandard,"_start_action_running","startrun_tacticallean",function(self,t)
	if TacticalLean.current_lean then
		TacticalLean:stop_lean()
	end
end)

Hooks:PostHook(PlayerStandard,"_start_action_ducking","startduck_tacticallean",function(self,t)
	if TacticalLean.current_lean then
		TacticalLean:update_lean_stance()
	end
end)

Hooks:PostHook(PlayerStandard,"_end_action_ducking","endduck_tacticallean",function(self,t)
	if TacticalLean.current_lean then
		TacticalLean:update_lean_stance()
	end
end)


--todo stopping leaning if starting to zipline?
--todo preventing leaning while ziplining (self:on_zipline)?

--[[
Hooks:PostHook(PlayerStandard,"_start_action_unequip_weapon","unswitchweapon_tacticallean",function(self,t)
--called whenever you swap primary/secondary weapons ingame
	if TacticalLean.current_lean then 
		TacticalLean:stop_lean()
	end
end)
Hooks:PostHook(PlayerStandard,"_start_action_equip","switchweapon_tacticallean",function(self,redirect,extra_time)
--don't bother; this is only called at mission start
	if TacticalLean.current_lean then 
		TacticalLean:update_lean_stance()
	end
end)

--local orig_check_zipline = PlayerStandard._check_action_zipline
--function PlayerStandard:_check_action_zipline(t,input)
--end

--Hooks:PostHook(PlayerStandard,"_check_action_zipline","playerstandard__check_action_zipline_tacticallean",function(self,t,input)
--	TacticalLean:stop_lean()
--end)
function PlayerStandard:_check_action_zipline(t, input)
	if self._state_data.in_air then
		return
	end

	if not self._state_data.on_zipline then
		local zipline_unit = self._unit:movement():zipline_unit()

		if alive(zipline_unit) then
			self:_start_action_zipline(t, input, zipline_unit)
		end
	end
end
--]]

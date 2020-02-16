Hooks:PostHook(GroupAIStateBesiege,"_assign_enemy_groups_to_assault","khud_detect_assaultphase",function(self,phase)
	managers.hud:set_assault_phase(utf8.to_upper(phase))
end)

--[[
assault
anticipation,build,sustain,fade,regroup

recon



--]]

Hooks:PostHook(GroupAIStateBesiege,"_begin_regroup_task","khud_detect_regroupphase",function(self)
	local end_t = self._task_data.regroup.end_t
	local start_t = self._task_data.regroup.start_t
	managers.hud:set_assault_phase(utf8.to_upper("regroup")) --todo localize
	managers.hud:set_phase_timer(end_t)
--	KineticHUD:c_log(end_t - start_t,"Starting regroup: " .. tostring(end_t or "nil"))
end)


--if you're here because you suspect KineticHUD is interfering with your skilltree mods,
--or because "skilltree" showed up in your crashlog, and you're looking for mods that hook to that,
--then FYI, this is not what's causing your crash

Hooks:PostHook(SkillTreeManager,"switch_skills","khud_switchloadouts_syncninelives",function(self,...)
	 KineticHUD:DownCounter_SendDownsDataToAll()
end)

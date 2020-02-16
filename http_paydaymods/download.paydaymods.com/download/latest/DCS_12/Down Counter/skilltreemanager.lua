local DownCounter = DownCounter or _G.DownCounterStandalone

Hooks:PostHook(SkillTreeManager,"switch_skills","dcs_switchloadouts_syncninelives",function(self,...)
	DownCounter:SendDownsDataToAll()
end)

--no, this won't interfere with your other skilltree mods or whatever else
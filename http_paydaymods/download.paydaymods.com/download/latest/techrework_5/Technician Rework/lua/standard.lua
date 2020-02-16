
Hooks:PostHook(PlayerStandard, "_do_melee_damage", "PercussiveMaintenance", function(t, melee_bayonet)
	if not (managers.skilltree:skill_step("t_left6") >= 2) then
		return
	end
	if managers.interaction:active_unit() then
		local i_data = managers.interaction:active_unit():interaction().tweak_data
		if i_data == "drill_jammed" or i_data == "lance_jammed" or i_data == "huge_lance_jammed" then
			managers.hud:on_hit_confirmed()
			if managers.player:upgrade_value("player", "percussive_maintenance") >= math.rand(1) then
				managers.interaction:active_unit():interaction():interact(managers.player:player_unit())
			end
		end
	end
end)
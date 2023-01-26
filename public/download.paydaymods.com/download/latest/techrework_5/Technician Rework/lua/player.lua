Hooks:PostHook(PlayerManager, "on_killshot", "PercusiveMaintenanceBasic", function (self, killed_unit, variant)
	log ("Check: " .. tostring(variant))
	if not (variant == "melee") or (managers.skilltree:skill_step("t_left6") == 0) or (CopDamage.is_civilian(killed_unit:base()._tweak_table)) then
		log ("Failed Check")
		return
	end
	log ("PASS Check")
	if managers.player:upgrade_value("player", "melee_ammo_replenish_chance") >= math.rand(1) then
		local units = managers.player:player_unit():inventory()._available_selections
		for i = 1, 2 do
			local weapon = units[i].unit
			local max_ammo = weapon:base():get_ammo_max()
			local current_ammo = weapon:base():get_ammo_total()
			weapon:base()._ammo_total = weapon:base():digest_value(math.ceil(current_ammo + max_ammo * managers.player:upgrade_value("player", "melee_ammo_replenish")), true)
			--weapon:sound():play("pickup_ammo_health_boost", nil, true)
		end
	end
end)
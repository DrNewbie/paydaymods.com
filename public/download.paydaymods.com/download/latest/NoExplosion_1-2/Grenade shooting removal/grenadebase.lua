	local weapon_id = tweak_data.blackmarket.projectiles[self:projectile_entry()].weapon_id
	if weapon_id then
		managers.statistics:shot_fired({
			--hit = true,
			--name_id = weapon_id,
			--skip_bullet_count = true
		})
	end
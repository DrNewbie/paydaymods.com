if not mod_collection then
	return
end

local SHOW_BUFFS = mod_collection._data.show_buffs

if SHOW_BUFFS then
	local PlayerDamage_set_health_original = PlayerDamage.set_health
	local PlayerDamage_build_suppression_original = PlayerDamage.build_suppression
	local PlayerDamage__damage_screen_original = PlayerDamage._damage_screen
	local PlayerDamage_restore_armor_original = PlayerDamage.restore_armor

	PlayerDamage._ARMOR_REGEN_TABLE = {
		[tweak_data.upgrades.values.player.headshot_regen_armor_bonus[1] ] = "bullseye_debuff",
		[tweak_data.upgrades.values.player.killshot_regen_armor_bonus[1] ] = "tension_debuff",
		[tweak_data.upgrades.values.player.headshot_regen_armor_bonus[2] ] = "bullseye_debuff",
		[tweak_data.upgrades.values.player.killshot_regen_armor_bonus[1] + tweak_data.upgrades.values.player.killshot_close_regen_armor_bonus[1] ] = "tension_debuff",
	}
	
	function PlayerDamage:set_health(...)
		PlayerDamage_set_health_original(self, ...)
		managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.berserker, { set_health = self:health_ratio() })
	end
	
	function PlayerDamage:build_suppression(amount, ...)
		if not self:_chk_suppression_too_soon(amount) then
			PlayerDamage_build_suppression_original(self, amount, ...)
		
			if self._supperssion_data.value == tweak_data.player.suppression.max_value then
				managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.suppression, { set_duration = tweak_data.player.suppression.decay_start_delay })
				if self:get_real_armor() < self:_total_armor() then
					managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.armor_regen, { refresh_duration = true })
				end
			end
		end
	end
	
	function PlayerDamage:_damage_screen(...)
		PlayerDamage__damage_screen_original(self, ...)
		local delay = self._regenerate_timer + (self._supperssion_data.decay_start_t and (self._supperssion_data.decay_start_t - managers.player:player_timer():time()) or 0)
		managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.armor_regen, { set_duration = delay })
	end

	function PlayerDamage:restore_armor(armor_regen, ...)
		PlayerDamage_restore_armor_original(self, armor_regen, ...)

		local buff_name = PlayerDamage._ARMOR_REGEN_TABLE[armor_regen]
		local buff = HUDList.BuffItemBase.BUFFS.special[buff_name]
		if buff then
			local cooldown
		
			if buff_name == "bullseye_debuff" then 
				cooldown = tweak_data.upgrades.on_headshot_dealt_cooldown
			elseif buff_name == "tension_debuff" then
				cooldown = tweak_data.upgrades.on_killshot_cooldown
			end
			
			managers.hud:update_buff_item(buff, { set_duration = cooldown or 0 })
		end
		
		if self:get_real_armor() >= self:_total_armor() then
			managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.armor_regen, { deactivate = true })
		end
	end
end
	
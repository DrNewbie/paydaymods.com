function PlayerDamage:_update_armor_hud(t, dt) --overridden
	local real_armor = self:get_real_armor()
	local is_full = true
	local current_armor = math.lerp(self._current_armor_fill, real_armor, 10 * dt)
	if current_armor > self._current_armor_fill then
		is_full = false
	end
	self._current_armor_fill = current_armor
	if real_armor <= 0 then 
--	the positive and totally intentional side effect of my modification is that it skips the interpolation,
--	and thus the visual animation for armor damage, but only when your armor is fully depleted.
--	Calculated.
		managers.hud:set_player_armor({
			current = 0, 
			total = self:_max_armor()
		})
	elseif not is_full then --fills armor all the way, but only if regaining armor
		managers.hud:set_player_armor({
			current = current_armor,
			total = self:_max_armor()
		})
	elseif math.abs(self._current_armor_fill - real_armor) > 0.01 then
	-->:( ovk why would you pretend there's a little nugget of armor left, that's so annoying
	--there are better ways to help performance, like having a 64 bit game
		managers.hud:set_player_armor({
			current = current_armor,
			total = self:_max_armor()
		})
	else
	end
	if self._hurt_value then
		self._hurt_value = math.min(1, self._hurt_value + dt)
	end
end

Hooks:PostHook(PlayerDamage,"_update_armor_grinding","khud_update_anarchist",function(self,t,dt)
	if not (self._armor_grinding and self._armor_grinding.elapsed and self._armor_grinding.target_tick) then return end
	local next_regen = self._armor_grinding.target_tick - self._armor_grinding.elapsed
	local regen_amount = self._armor_grinding.armor_value
	managers.player:add_buff("anarchist_armor_regen",{duration = next_regen,value = regen_amount})
--	KineticHUD:_debug("Armor Grinding: " .. (self._armor_grinding.elapsed or "none"),3)
end)

Hooks:PostHook(PlayerDamage,"_upd_health_regen","khud_update_hp_regen",function(self,t,dt)
	if self._health_regen_update_timer then
		local health_value = math.floor(managers.player:health_regen() * 100)
		if health_value > 0 then 
			managers.player:add_buff("hp_regen",{value = health_value,duration = self._health_regen_update_timer})
		else
			managers.player:remove_buff("hp_regen")
		end
--		KineticHUD:_debug("hp regen: " .. tostring(self._health_regen_timer or "nil"),1)
	else
		managers.player:remove_buff("hp_regen")
	end
	

	local hot_stacks = self._damage_to_hot_stack
	local next_doh = hot_stacks and hot_stacks[1]
	if next_doh then 
		local ticks_count = 0
		for k,doh in pairs(hot_stacks) do 

			if doh.ticks_left then 
				ticks_count = ticks_count + doh.ticks_left
			end
		end

		managers.player:add_buff("grinder",{value = ticks_count})
	else
		managers.player:remove_buff("grinder")
	end
end)

Hooks:PostHook(PlayerDamage,"_update_regen_on_the_side","khud_update_hitman",function(self,dt)
	local timer = self._regen_on_the_side_timer
--	KineticHUD:_debug(timer,"1")
end)

Hooks:PostHook(PlayerDamage,"_on_enter_swansong_event","khud_enter_swansong",function(self)
	local expire_time = managers.player:get_activate_temporary_expire_time("temporary", "berserker_damage_multiplier")
--	local duration = managers.player:upgrade_value("temporary", "berserker_damage_multiplier")
	managers.player:add_buff("swan_song",{end_t = expire_time}) --todo swansong aced
end)

Hooks:PreHook(PlayerDamage,"_check_bleed_out","khud_check_bleed_out",function(self,can_activate_berserker,ignore_movement_state,...)
	if not self._block_medkit_auto_revive and self._uppers_elapsed + self._UPPERS_COOLDOWN < Application:time() then
		local auto_recovery_kit = FirstAidKitBase.GetFirstAidKit(self._unit:position())

		if auto_recovery_kit then
			managers.player:add_buff("uppers_aced_cooldown",{duration = self._UPPERS_COOLDOWN})			
		end
	end
end)

Hooks:PostHook(PlayerDamage,"set_health","aui_set_health",function(self,health) 
	if managers.player:is_damage_health_ratio_active(self:health_ratio()) then
		managers.player:add_buff("berserker_damage_multiplier")
		--no need to check for remove buff; this is re-evaluated every frame while the buff is applied
	end
end)

Hooks:PostHook(PlayerDamage, "on_downed", "khud_playerdamage_ondowned", function(self, ...)
	local max_downs = self._lives_init + managers.player:upgrade_value("player", "additional_lives", 0) or 4 --global_max_downs not needed since self._revives are locally stored
	local revives = self:get_revives()
	local downs = max_downs - revives
	if downs == max_downs and not KineticHUD:DownCounter_AnnounceCustodies() then
		return --don't announce anything if going into custody, and intentionally don't update downcounter's downs so that we can announce that in on_enter_custody()
	end
	
	local my_name = (managers.network and managers.network.account and managers.network.account:username()) or "ChadHeister McSexHaver"

	local message = "Player " .. my_name
	if downs >= max_downs - 1 then
		message = "Warning! " .. message .. " has been downed " .. tostring(downs) .. (downs == 1 and " time!" or " times!") .. " (Low revives left)"
	elseif not KineticHUD:DownCounter_AnnounceLowDownsOnly() and (KineticHUD:DownCounter_IsAlertModeAll() or KineticHUD:DownCounter_IsAlertModeSelf()) then
		message = message .. " has been downed " .. tostring(downs) .. (downs == 1 and " time." or " times.")
	else
		return --don't announce anything
	end
	
	
	
	KineticHUD:DownCounter_SetDowns(downs)
	
	KineticHUD:DownCounter_Announce(message)
end)
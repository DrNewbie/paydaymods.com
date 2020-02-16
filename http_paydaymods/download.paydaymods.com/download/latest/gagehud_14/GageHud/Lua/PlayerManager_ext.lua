if not mod_collection then
	return
end

local SHOW_BUFFS = mod_collection._data.show_buffs

if SHOW_BUFFS then
	local PlayerManager_count_up_player_minions_original = PlayerManager.count_up_player_minions
	local PlayerManager_count_down_player_minions_original = PlayerManager.count_down_player_minions
	local PlayerManager_update_hostage_skills_original = PlayerManager.update_hostage_skills
	local PlayerManager_activate_temporary_upgrade_original = PlayerManager.activate_temporary_upgrade
	local PlayerManager_activate_temporary_upgrade_by_level_original = PlayerManager.activate_temporary_upgrade_by_level
	local PlayerManager_deactivate_temporary_upgrade_original = PlayerManager.deactivate_temporary_upgrade
	local PlayerManager_add_synced_team_upgrade_original = PlayerManager.add_synced_team_upgrade
	local PlayerManager_peer_dropped_out_original = PlayerManager.peer_dropped_out

	function PlayerManager:count_up_player_minions(...)
		local result = PlayerManager_count_up_player_minions_original(self, ...)
		if self._local_player_minions > 0 and self:has_category_upgrade("player", "minion_master_speed_multiplier") then
			managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.partner_in_crime, { activate = true })
		end
		return result
	end
	
	function PlayerManager:count_down_player_minions(...)
		local result = PlayerManager_count_down_player_minions_original(self, ...)
		if self._local_player_minions <= 0 then
			managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.partner_in_crime, { deactivate = true })
		end
		return result
	end
	
	function PlayerManager:update_hostage_skills(...)
		local stack_count = (managers.groupai and managers.groupai:state():hostage_count() or 0) + (self:num_local_minions() or 0)
		if self:has_team_category_upgrade("health", "hostage_multiplier") or self:has_team_category_upgrade("stamina", "hostage_multiplier") then
			managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.hostage_situation, { set_stack_count = stack_count })
		end
		
		if self:has_category_upgrade("player", "hostage_health_regen_addend") then
			if stack_count > 0 then
				managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.hostage_taker, { activate = true })
			else
				managers.hud:update_buff_item(HUDList.BuffItemBase.BUFFS.special.hostage_taker, { deactivate = true })
			end
		end
		
		return PlayerManager_update_hostage_skills_original(self, ...)
	end
	
	function PlayerManager:activate_temporary_upgrade_by_level(category, upgrade, level, ...)
		local upgrade_level = self:upgrade_level(category, upgrade, 0) or 0
		if level > upgrade_level then
			return
		end
		local upgrade_value = self:upgrade_value_by_level(category, upgrade, level, 0)
		if upgrade_value == 0 then
			return
		end

		local buff = HUDList.BuffItemBase.BUFFS[category] and HUDList.BuffItemBase.BUFFS[category][upgrade]
		if not buff then
			io.write("Attempting to activate unknown buff: " .. tostring(category) .. ", " .. tostring(upgrade) .. "\n")
		else
			managers.hud:update_buff_item(buff, { 
				set_duration = upgrade_value[2], 
				set_aced = buff.has_aced and buff.has_aced(level) or nil
			})
		end
	
		return PlayerManager_activate_temporary_upgrade_by_level_original(self, category, upgrade, level, ...)
	end
	
	function PlayerManager:activate_temporary_upgrade(category, upgrade, ...)
		local upgrade_value = self:upgrade_value(category, upgrade)
		if upgrade_value ~= 0 then 

			local buff = HUDList.BuffItemBase.BUFFS[category] and HUDList.BuffItemBase.BUFFS[category][upgrade]
			if not buff then
				io.write("Attempting to activate unknown buff: " .. tostring(category) .. ", " .. tostring(upgrade) .. "\n")
			else
				managers.hud:update_buff_item(buff, { set_duration = upgrade_value[2] })
			end			
		end
		
		return PlayerManager_activate_temporary_upgrade_original(self, category, upgrade, ...)
	end
	
	function PlayerManager:deactivate_temporary_upgrade(category, upgrade, ...)
		local upgrade_value = self:upgrade_value(category, upgrade)
		if self._temporary_upgrades[category] and upgrade_value ~= 0 then
			local buff = HUDList.BuffItemBase.BUFFS[category] and HUDList.BuffItemBase.BUFFS[category][upgrade]
			if not buff then
				io.write("Attempting to deactivate unknown buff: " .. tostring(category) .. ", " .. tostring(upgrade) .. "\n")
			else
				managers.hud:update_buff_item(buff, { deactivate = true })
			end
		end
		
		return PlayerManager_deactivate_temporary_upgrade_original(self, category, upgrade, ...)
	end

	function PlayerManager:add_synced_team_upgrade(peer_id, category, upgrade, ...)
		PlayerManager_add_synced_team_upgrade_original(self, peer_id, category, upgrade, ...)

		local buff = HUDList.BuffItemBase.BUFFS.team[category] and HUDList.BuffItemBase.BUFFS.team[category][upgrade]
		if not buff then
			io.write("Attempting to activate unknown team buff: " .. tostring(category) .. ", " .. tostring(upgrade) .. "\n")
		else
			managers.hud:update_buff_item(buff, { activate = true, set_level = buff.level })
			if buff.has_aced and buff.has_aced() then
				managers.hud:update_buff_item(buff, { set_aced = true })
			end
		end
	end
	
	function PlayerManager:peer_dropped_out(peer, ...)
		local peer_id = peer:id()
		local peer_upgrades = {}		
		local had_upgrades = false
		for category, data in pairs(managers.player._global.synced_team_upgrades[peer_id] or {}) do
			for upgrade, value in pairs(data or {}) do
				had_upgrades = true
				local buff = HUDList.BuffItemBase.BUFFS.team[category] and HUDList.BuffItemBase.BUFFS.team[category][upgrade]
				if not buff then
					io.write("Attempting to activate reset team buff: " .. tostring(category) .. ", " .. tostring(upgrade) .. "\n")
				else
					managers.hud:update_buff_item(buff, { deactivate = true, set_level = 0, set_aced = false })
				end
			end
		end
		
		PlayerManager_peer_dropped_out_original(self, peer, ...)
		
		if not had_upgrades then return end
		
		for category, upgrade_data in pairs(HUDList.BuffItemBase.BUFFS.team) do
			for upgrade, buff in pairs(upgrade_data) do
				if managers.player:has_team_category_upgrade(category, upgrade) then
					managers.hud:update_buff_item(buff, { activate = true, set_level = buff.level })
					if buff.has_aced and buff.has_aced() then
						managers.hud:update_buff_item(buff, { set_aced = true})
					end
				end
			end
		end
	end
end

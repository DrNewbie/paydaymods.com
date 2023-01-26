
--identical to basegame
local function make_double_hud_string(a, b)
--i don't really like using zeroes for spacing so i don't think i really use this anywhere
	return string.format("%01d|%01d", a, b)
end
--identical to basegame
local function add_hud_item(amount, icon)
	if #amount > 1 then
		managers.hud:add_item_from_string({
			amount_str = make_double_hud_string(amount[1], amount[2]),
			amount = amount,
			icon = icon
		})
	else
		managers.hud:add_item({
			amount = amount[1],
			icon = icon
		})
	end
end
--identical to basegame
local function get_as_digested(amount)
	local list = {}

	for i = 1, #amount, 1 do
		table.insert(list, Application:digest_value(amount[i], false))
	end

	return list
end

Hooks:PostHook(PlayerManager,"init","khud_init_playermanager",function(self)
	self._player_buffs = {}
	self._tracked_ecms = {}
	self._tracked_sentryguns = {}
end)

function PlayerManager:update_khud_equipment()
	local equipments = self._equipment and self._equipment.selections
	if equipments then 
		for index,equipment in pairs(equipments) do 
			local name = equipment.equipment
			local icon = tweak_data.equipments[name].icon
			local amount = equipment.amount
			managers.hud:set_khud_deployable(nil,{index = index,icon = icon,amount = amount})
		end
	end
end

Hooks:PostHook(PlayerManager,"add_sentry_gun","khud_correct_sentry_amount",function(self,num,sentry_type)
--	local equipment, index = self:equipment_data_by_name(sentry_type)
--	managers.hud:set_khud_deployable(nil,equipment,index)
--  ^ this method causes crashes for reasons i'm too tired to investigate
	self:update_khud_equipment()
end)

Hooks:PostHook(PlayerManager,"_internal_load","khud_player_internal_load",function(self)
	local settings = KineticHUD:GetSettings() --used for individual buff settings
	
	managers.hud:set_khud_weapon_icons()
	
	self:update_khud_equipment()
	
	if (self:has_category_upgrade("player", "wild_health_amount") or self:has_category_upgrade("player", "wild_armor_amount")) then
		self:add_buff("wild_kill_counter",{value = tweak_data.upgrades.wild_max_triggers_per_time})
	end
	if self:has_category_upgrade("player", "messiah_revive_from_bleed_out") then
		self:add_buff("messiah_charge",{value = self._messiah_charges or self:upgrade_value("player", "messiah_revive_from_bleed_out", 0)})
	end
	
	if settings.crit_chance_total then
		managers.player:add_buff("crit_chance_total")
	end
	if settings.dmg_resist_total then
		managers.player:add_buff("dmg_resist_total")
	end
	if settings.dodge_chance_total then
		managers.player:add_buff("dodge_chance_total")
	end
	
	if KineticHUD:UseHealthTeamCustomXY() then
		managers.hud:align_khud_health()
	end
	
	managers.hud:set_sentry_tracker_visible(KineticHUD.settings.show_sentry_tracker)
			
--	managers.hud:align_khud_health()
--	managers.hud:layout_khud_health()
	managers.hud:layout_khud_health_team()
	
	managers.hud:layout_khud_compass()
--	managers.hud:toggle_khud_crosshair(settings.show_crosshair) --redundant
	managers.hud:layout_khud_crosshair()
	managers.hud:layout_khud_deployables_team()
	managers.hud:layout_khud_equipment_team()
	managers.hud:layout_khud_region_team()
	managers.hud:layout_khud_ties_team()
	managers.hud:layout_khud_grenades_team()
	managers.hud:layout_khud_weapons_panel()
	managers.hud:layout_khud_name_team()
	managers.hud:layout_khud_buffs()
	managers.hud:set_khud_player_visible(settings.panel_player_enabled)
--	managers.hud:set_khud_team_visible(settings.panel_team_enabled)
--	if use custom chat then
	if settings.panel_chat_use_custom_xy then 
		managers.hud:layout_khud_chat()
	end
	
	local primary_deployable = managers.blackmarket:equipped_deployable(1)
	local secondary_deployable = managers.blackmarket:equipped_deployable(2)
	if primary_deployable or secondary_deployable then
		managers.hud:show_khud_selecteq_bar()
	end
--todo	managers.hud:show_khud_hostages(mission_enabled)
--	managers.hud:show_khud_objectives(toggle)
	managers.hud:show_khud_debug(KineticHUD.settings.show_debug)	
	KineticHUD:ReloadCartographerData()
end)

function PlayerManager:add_buff(id,params) --custom function to register + add buffs
	if not (managers.hud and id) then return end --in case it's called from menu
	if not KineticHUD.settings.show_buffs_master then return end
	params = params or {}
	local current_buffs = self:get_buffs()
	local t = Application:time()
--	local num = #buffs
	local buff_data = self:get_buff_data()[id]
	if not buff_data then 
		if type(id) == "table" then 
			id = "table: {" .. KineticHUD:concat(id) .. "}"
		end
		KineticHUD:c_log("Error: Bad buff data! Upgrade: " .. tostring(id or "nil"))
		return
	end
	if buff_data.disabled then 	--i'm looking at you, underdog
		return	
	elseif KineticHUD.settings.show_buffs_master then
		if not KineticHUD.settings[id] then 
			KineticHUD:c_log("buff " .. id .. " is not enabled")
			return
		else
			if not self:get_buffs()[id] then 
--				KineticHUD:c_log(id,"playermanager:add_buff(): Added new buff")
			end
		end
	end
	
	
--	else
		--renewed buff timer
--	end
	current_buffs[id] = params
	if params.duration then
		current_buffs[id].end_t = (t + params.duration or buff_data.duration or 5)
	end
	managers.hud:add_buff(id)	--create panel
end

function PlayerManager:clear_all_buffs()
	for id,buff in pairs(self:get_buffs()) do
		managers.hud:remove_buff(id)
	end
	self._player_buffs = {}
end

function PlayerManager:remove_buff(id)
	self:get_buffs()[id] = nil
	managers.hud:remove_buff(id)
end

function PlayerManager:get_buff_data()
	return KineticHUD:GetBuffData()
end

function PlayerManager:get_buffs()
	return self._player_buffs
end

function PlayerManager:get_wild_kill_counter()
--custom function; variable itself is vanilla
	return self._wild_kill_triggers or {}
end

--effectively a posthook
local orig_chk_wild_kill_counter = PlayerManager.chk_wild_kill_counter
function PlayerManager:chk_wild_kill_counter(...)
	local procs_before = self:get_wild_kill_counter()
	local result = orig_chk_wild_kill_counter(self,...)
	local procs_after = self:get_wild_kill_counter()
	
	if #procs_before > #procs_after then 
		self:add_buff("wild_kill_counter",{icon_color = Color.red,value = #procs_after})
	end
	return result
end

function PlayerManager:add_tracked_sentrygun(key,params) --todo table.sort tracked_ecms; todo don't remove on finish, just set color
	local tracked_sentryguns = self:get_tracked_sentryguns()
	for k = 0,KineticHUD.max_tracked_sentryguns do	
		if not tracked_sentryguns[k] then
			tracked_sentryguns[k] = params
			break
		end
	end
end

function PlayerManager:remove_tracked_sentrygun(id) --should only be called from/after hudmanagerpd2:update()!
	local tracked_sentryguns = self:get_tracked_sentryguns()
	tracked_sentryguns[id] = nil
end

function PlayerManager:get_tracked_sentryguns()
	return self._tracked_sentryguns
end

function PlayerManager:remove_tracked_ecm(ecm)
	local tracked_ecms = self:get_tracked_ecms()
	tracked_ecms[ecm] = nil
end

function PlayerManager:remove_tracked_ecms(ecms)
	local tracked_ecms = self:get_tracked_ecms()
	for k,ecm in ipairs(ecms) do
		self:remove_tracked_ecm(ecm)
	end
end

function PlayerManager:add_tracked_ecm(key,params) --todo table.sort tracked_ecms
	local tracked_ecms = self:get_tracked_ecms()
	for k,ecm in ipairs(tracked_ecms) do
		if ecm.key == key then
			self:remove_tracked_ecm(k) --less efficient, but i need it to log
--			tracked_ecms[k] = nil
			return
		end
	end
	table.insert(tracked_ecms,params)
--	managers.hud:add_tracked_ecm(key)

--	KineticHUD:c_log("Tracked ecm with key ".. tostring(key))
--	KineticHUD:c_log(#tracked_ecms,"ecm count")
end

function PlayerManager:get_tracked_ecms()
	return self._tracked_ecms
end

function PlayerManager:select_next_item()
	if not self._equipment.selected_index then
		return
	end
	local prev = self._equipment.selected_index
	
	if managers.player._equipment and #managers.player._equipment.selections <= 1 then 
		self._equipment.selected_index = 1
		return
	end
	
	self._equipment.selected_index = (self._equipment.selected_index == 2 and 1) or 2
	if self._equipment.selected_index ~= prev then --don't do the switch-selected hud anim if you're not switching 
		KineticHUD.start_swap_eq_t = Application:time()--addition for hud
	end
--self:has_category_upgrade("player","second_deployable")
end

function PlayerManager:switch_equipment()
	self:select_next_item()
	local equipment = self:selected_equipment() 
	if not (equipment or _G.IS_VR) then
		local td = tweak_data.equipments[managers.blackmarket:equipped_deployable(self._equipment.selected_index)]
		if not td then 
			--KineticHUD:_log(self._equipment.selected_index,"ERROR: No second deployable; likely does not have JoAT.")
			return
		end
		local icon = td.icon
		add_hud_item({0},icon)
		--don't update to peers either
	elseif equipment and not _G.IS_VR then 
		local digested = get_as_digested(equipment.amount)
		add_hud_item(digested,equipment.icon)
		self:update_deployable_selection_to_peers()	
	end
--	return orig_switch_equipment(self)
end

--tracking/event hooks
Hooks:PostHook(PlayerManager,"activate_temporary_upgrade","khud_activate_temporary_upgrade",function(self,category, upgrade)
	local t = self._temporary_upgrades[category] and self._temporary_upgrades[category][upgrade] and self._temporary_upgrades[category][upgrade].expire_time
	
	self:add_buff(upgrade,{end_t = t}) --i'd have to re-calculate stuff or overwrite the function to use duration instead of end_t. i'd rather risk having desynced end times

end)

Hooks:PostHook(PlayerManager,"activate_temporary_upgrade_by_level","khud_activate_temporary_upgrade_by_level",function(self,category, upgrade, level)
	local t = self._temporary_upgrades[category] and self._temporary_upgrades[category][upgrade] and self._temporary_upgrades[category][upgrade].expire_time
	
	self:add_buff(upgrade,{end_t = t}) --i'd have to re-calculate stuff or overwrite the function to use duration instead of end_t. i'd rather risk having desynced end times
end)

Hooks:PostHook(PlayerManager,"add_to_temporary_property","khud_add_temporary_property",function(self,name, time, value)
	self:add_buff(name,{duration = time})
end)

Hooks:PostHook(PlayerManager,"aquire_cooldown_upgrade","khud_aquire_cooldown_upgrade",function(self,upgrade)
--upgrade is a table. whoops.
	local name = upgrade.upgrade
	local upgrade_value = self:upgrade_value(upgrade.category,name)
end)

Hooks:PostHook(PlayerManager,"disable_cooldown_upgrade","khud_disable_cooldown_upgrade",function(self,category,upgrade)
	local upgrade_value = self:upgrade_value(category, upgrade)

	if upgrade_value == 0 then
		return
	end

	local t = upgrade_value[2]

--	local t = self._global.cooldown_upgrades[category] and self._global.cooldown_upgrades[category][upgrade] and self._global.cooldown_upgrades[category][upgrade].cooldown_time
	
	self:add_buff(upgrade,{duration = t})
end)

Hooks:PostHook(PlayerManager,"on_enter_custody","khud_playermanager_onentercustody",function(self, ...)
	if KineticHUD:DownCounter_AnnounceCustodies() and (KineticHUD:DownCounter_IsAlertModeSelf() or KineticHUD:DownCounter_IsAlertModeAll()) then
		local message = (managers.network and managers.network.account and managers.network.account:username()) or "[LOCAL PLAYER]"
		local downs = KineticHUD:DownCounter_GetDowns()
		local rollem = math.random(100)
		if rollem > 99 then 
			message = (message .. " is in a pickle! (Downed " .. tostring(downs) .. " times.)")
		else
			message = (message .. " has gone into custody. (Downed " .. tostring(downs) .. " times.)")
		end
		KineticHUD:DownCounter_Announce(message)
	end
	KineticHUD:DownCounter_SetDowns(0)
	
	--reset buffs
	self:clear_all_buffs()
	
end)

Hooks:PreHook(PlayerManager,"_on_enter_shock_and_awe_event","khud_on_enter_shock_and_awe_event",function(self)
	if not self._coroutine_mgr:is_running("automatic_faster_reload") then
		local equipped_unit = self:get_current_state()._equipped_unit
		local data = self:upgrade_value("player", "automatic_faster_reload", nil)
		local is_grenade_launcher = equipped_unit:base():is_category("grenade_launcher")

		if data and equipped_unit and not is_grenade_launcher and (equipped_unit:base():fire_mode() == "auto" or equipped_unit:base():is_category("bow", "flamethrower")) then
			self:add_buff("lock_n_load")
--			self._coroutine_mgr:add_and_run_coroutine("automatic_faster_reload", PlayerAction.ShockAndAwe, self, data.target_enemies, data.max_reload_increase, data.min_reload_increase, data.penalty, data.min_bullets, equipped_unit)
		end
	else
--		KineticHUD:c_log("Already in shock and awe")
	end
end)

Hooks:PostHook(PlayerManager,"_on_enemy_killed_bloodthirst","khud_on_bloodthirst",function(self,equipped_unit, variant, killed_unit)
	if variant == "melee" then
		local data = self:upgrade_value("player", "melee_kill_increase_reload_speed", 0)

		if data ~= 0 then --if type(data) == "table" ?
			self:add_buff("bloodthirst_reload_speed",{duration = data[2]})
			--todo remove stacks of bloodthirst here
--			self._temporary_properties:activate_property("bloodthirst_reload_speed", data[2], data[1])
		end
	end
end)

Hooks:PreHook(PlayerManager,"use_messiah_charge","khud_use_messiah_charge",function(self)
	if self._messiah_charges > 0 and self._current_state == "bleed_out" then
		self:remove_buff("messiah_charge")
	end	
end)

Hooks:PostHook(PlayerManager,"_on_messiah_event","khud_on_messiah_event",function(self)
	if self._messiah_charges > 0 and self._current_state == "bleed_out" and not self._coroutine_mgr:is_running("get_up_messiah") then
		self:add_buff("messiah_charge",{color = Color.green})
--		self._coroutine_mgr:add_coroutine("get_up_messiah", PlayerAction.MessiahGetUp, self)
	end
end)

Hooks:PostHook(PlayerManager,"_on_messiah_recharge_event","khud_on_messiah_recharge_event",function(self)
	self:add_buff("messiah_charge",{value = self._messiah_charges})
end)

Hooks:PostHook(PlayerManager,"on_headshot_dealt","khud_on_bullseye_event",function(self)
	if not self:player_unit() then return end

	if self:upgrade_value("player", "headshot_regen_armor_bonus", 0) > 0 then 
		if self._on_headshot_dealt_t then 
			self:add_buff("bullseye",{end_t = self._on_headshot_dealt_t})
		else --just in case
			self:add_buff("bullseye",{end_t = Application:time() + tweak_data.upgrades.on_headshot_dealt_cooldown})
		end
	end
end)
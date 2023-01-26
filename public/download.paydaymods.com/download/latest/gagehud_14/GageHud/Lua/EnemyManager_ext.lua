local init_original = EnemyManager.init
local register_enemy_original = EnemyManager.register_enemy
local on_enemy_died_original = EnemyManager.on_enemy_died
local on_enemy_destroyed_original = EnemyManager.on_enemy_destroyed
local register_civilian_original = EnemyManager.register_civilian
local on_civilian_died_original = EnemyManager.on_civilian_died
local on_civilian_destroyed_original = EnemyManager.on_civilian_destroyed

EnemyManager._UNIT_TYPES = {
	cop = "cop",	--All non-special police
	tank = "tank",
	spooc = "spooc",
	taser = "taser",
	shield = "shield",
	sniper = "sniper",
	mobster_boss = "mobster_boss",
	gangster = "thug",
	mobster = "thug",
	biker_escape = "thug",
	security = "security",
	gensec = "security",
	turret = "turret",	--SWAT turrets
	civilian = "civilian",	--All civilians
}

EnemyManager._UNIT_TYPE_IGNORE = {
	drunk_pilot = true,
	escort = true,
	old_hoxton_mission = true,
}

function EnemyManager:init(...)
	init_original(self, ...)
	
	self._minion_units = {}
	self._total_enemy_count = 0
	self._unit_count = {}
	for tweak, utype in pairs(EnemyManager._UNIT_TYPES) do
		self._unit_count[utype] = 0
	end
	
end

function EnemyManager:register_enemy(unit, ...)
	self:_change_enemy_count(unit, 1)
	return register_enemy_original(self, unit, ...)
end

function EnemyManager:on_enemy_died(unit, ...)
	self:_change_enemy_count(unit, -1)
	self:_check_minion(unit, true)
	return on_enemy_died_original(self, unit, ...)
end

function EnemyManager:on_enemy_destroyed(unit, ...)
	if alive(unit) and unit:character_damage() and not unit:character_damage():dead() then
		self:_change_enemy_count(unit, -1)
		self:_check_minion(unit)
	end
	return on_enemy_destroyed_original(self, unit, ...)
end

function EnemyManager:register_civilian(unit, ...)
	self:_change_civilian_count(unit, 1)
	return register_civilian_original(self, unit, ...)
end

function EnemyManager:on_civilian_died(unit, ...)
	self:_change_civilian_count(unit, -1)
	return on_civilian_died_original(self, unit, ...)
end

function EnemyManager:on_civilian_destroyed(unit, ...)
	if alive(unit) and unit:character_damage() and not unit:character_damage():dead() then
		self:_change_civilian_count(unit, -1)
	end
	return on_civilian_destroyed_original(self, unit, ...)
end


function EnemyManager:_check_minion(unit, killed)
	if self._minion_units[unit:key()] then
		self:remove_minion_unit(unit, killed)
	end
end

function EnemyManager:_change_enemy_count(unit, change)
	local tweak = unit:base()._tweak_table
	
	if not EnemyManager._UNIT_TYPE_IGNORE[tweak] then
		local u_type = EnemyManager._UNIT_TYPES[tweak] or "cop"
		self._total_enemy_count = self._total_enemy_count + change
		self._unit_count[u_type] = self._unit_count[u_type] + change
		
		if HUDManager.ListOptions.show_enemies and managers.hud and managers.hud:list_initialized() then
			local item_name = HUDManager.ListOptions.aggregate_enemies and "all" or u_type
			local count = HUDManager.ListOptions.aggregate_enemies and self._total_enemy_count or self._unit_count[u_type]
			managers.hud:hud_list("right_side_list"):item("enemy_count_list"):item(item_name):set_count(count)
		end
	end
end

function EnemyManager:_change_swat_turret_count(change)
	self._unit_count.turret = self._unit_count.turret + change
	
	if HUDManager.ListOptions.show_enemies and managers.hud and managers.hud:list_initialized() then
		managers.hud:hud_list("right_side_list"):item("enemy_count_list"):item("turret"):set_count(self._unit_count.turret)
	end
end

function EnemyManager:_change_civilian_count(unit, change)
	local tweak = unit:base()._tweak_table
	
	if not EnemyManager._UNIT_TYPE_IGNORE[tweak] then
		self._unit_count.civilian = self._unit_count.civilian + change
		
		if HUDManager.ListOptions.show_civilians and managers.hud and managers.hud:list_initialized() then
			managers.hud:hud_list("right_side_list"):item("enemy_count_list"):item("civilian"):set_count(self._unit_count.civilian - (managers.groupai:state():civilian_hostage_count() or 0))
		end
	end
end

function EnemyManager:unit_count(u_type)
	return u_type and (self._unit_count[u_type] or 0) or self._total_enemy_count
end

function EnemyManager:add_minion_unit(unit, owner_id, upgraded)
	if self._minion_units[unit:key()] then
		owner_id = self._minion_units[unit:key()].owner_id or owner_id
		upgraded = self._minion_units[unit:key()].upgraded or upgraded
	end
	self._minion_units[unit:key()] = { unit = unit, health = unit:character_damage()._health, owner_id = owner_id, upgraded = upgraded }
	
	if HUDManager.ListOptions.show_minions and managers.hud and managers.hud:list_initialized() then
		local item = managers.hud:hud_list("left_side_list"):item("minions"):register_item(tostring(unit:key()), HUDList.MinionItem, unit)
		item:activate()
		item:set_owner(owner_id)
		item:set_upgrade(upgraded)
	end
end

function EnemyManager:remove_minion_unit(unit, killed)
	if self._minion_units[unit:key()] then
		self._minion_units[unit:key()] = nil
		
		if HUDManager.ListOptions.show_minions and managers.hud and managers.hud:list_initialized() then
			local item = managers.hud:hud_list("left_side_list"):item("minions"):item(tostring(unit:key()))
			if killed then
				item:die()
			else
				item:delete()
			end
		end
	end
end

function EnemyManager:update_minion_health(unit, health)
	if self._minion_units[unit:key()] then
		self._minion_units[unit:key()].health = health
	
		if HUDManager.ListOptions.show_minions and managers.hud and managers.hud:list_initialized() then
			managers.hud:hud_list("left_side_list"):item("minions"):item(tostring(unit:key())):set_health(health)
		end
	end
end

function EnemyManager:minion_units()
	return self._minion_units
end

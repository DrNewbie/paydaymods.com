AmmoBagBase.SPAWNED_BAGS = {}

local spawn_original = AmmoBagBase.spawn
local init_original = AmmoBagBase.init
local sync_setup_original = AmmoBagBase.sync_setup
local _set_visual_stage_original = AmmoBagBase._set_visual_stage
local destroy_original = AmmoBagBase.destroy
local _set_empty_original = CustomAmmoBagBase._set_empty

function AmmoBagBase.spawn(pos, rot, ammo_upgrade_lvl, peer_id, ...)
	local unit = spawn_original(pos, rot, ammo_upgrade_lvl, peer_id, ...)
	AmmoBagBase.SPAWNED_BAGS[unit:key()] = AmmoBagBase.SPAWNED_BAGS[unit:key()] or { unit = unit }
	AmmoBagBase.SPAWNED_BAGS[unit:key()].owner = peer_id
	unit:base():_create_list_item()
	return unit
end

function AmmoBagBase:init(...)
	init_original(self, ...)
	AmmoBagBase.SPAWNED_BAGS[self._unit:key()] = AmmoBagBase.SPAWNED_BAGS[self._unit:key()] or { unit = self._unit }
	AmmoBagBase.SPAWNED_BAGS[self._unit:key()].max_amount = self._max_ammo_amount * 100
	self:_create_list_item()
end

function AmmoBagBase:sync_setup(ammo_upgrade_lvl, peer_id, ...)
	AmmoBagBase.SPAWNED_BAGS[self._unit:key()].owner = peer_id
	self:_update_list_item()
	return sync_setup_original(self, ammo_upgrade_lvl, peer_id, ...)
end

function AmmoBagBase:_set_visual_stage(...)
	AmmoBagBase.SPAWNED_BAGS[self._unit:key()].amount = self._ammo_amount * 100
	self:_update_list_item()
	return _set_visual_stage_original(self, ...)
end

function AmmoBagBase:destroy(...)
	AmmoBagBase.SPAWNED_BAGS[self._unit:key()] = nil
	self:_destroy_list_item()
	return destroy_original(self, ...)
end

function CustomAmmoBagBase:_set_empty(...)
	AmmoBagBase.SPAWNED_BAGS[self._unit:key()] = nil
	self:_destroy_list_item()
	return _set_empty_original(self, ...)
end


function AmmoBagBase:_create_list_item()
	if HUDManager.ListOptions.show_equipment and managers.hud and managers.hud:list_initialized() then
		local item = managers.hud:hud_list("left_side_list"):item("equipment"):register_item(tostring(self._unit:key()), HUDList.BagEquipmentItem, "ammo_bag", self)
		item:activate()
	end
	self:_update_list_item()
end

function AmmoBagBase:_update_list_item()
	if HUDManager.ListOptions.show_equipment and managers.hud and managers.hud:list_initialized() then
		local item = managers.hud:hud_list("left_side_list"):item("equipment"):item(tostring(self._unit:key()))
		if item then
			local data = AmmoBagBase.SPAWNED_BAGS[self._unit:key()]
			item:set_amount(data.amount)
			item:set_max_amount(data.max_amount)
			item:set_owner(data.owner)
		end
	end
end

function AmmoBagBase:_destroy_list_item()
	if managers.hud and managers.hud:list_initialized() then
		managers.hud:hud_list("left_side_list"):item("equipment"):unregister_item(tostring(self._unit:key()))
	end
end

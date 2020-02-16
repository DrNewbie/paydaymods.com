BodyBagsBagBase.SPAWNED_BAGS = {}

local spawn_original = BodyBagsBagBase.spawn
local init_original = BodyBagsBagBase.init
local sync_setup_original = BodyBagsBagBase.sync_setup
local _set_visual_stage_original = BodyBagsBagBase._set_visual_stage
local destroy_original = BodyBagsBagBase.destroy
local _set_empty_original = CustomBodyBagsBagBase._set_empty

function BodyBagsBagBase.spawn(pos, rot, upgrade_lvl, peer_id, ...)
	local unit = spawn_original(pos, rot, upgrade_lvl, peer_id, ...)
	BodyBagsBagBase.SPAWNED_BAGS[unit:key()] = BodyBagsBagBase.SPAWNED_BAGS[unit:key()] or { unit = unit }
	BodyBagsBagBase.SPAWNED_BAGS[unit:key()].owner = peer_id
	unit:base():_create_list_item()
	return unit
end

function BodyBagsBagBase:init(...)
	init_original(self, ...)
	BodyBagsBagBase.SPAWNED_BAGS[self._unit:key()] = BodyBagsBagBase.SPAWNED_BAGS[self._unit:key()] or { unit = self._unit }
	BodyBagsBagBase.SPAWNED_BAGS[self._unit:key()].max_amount = self._max_bodybag_amount
	self:_create_list_item()
end

function BodyBagsBagBase:sync_setup(ammo_upgrade_lvl, peer_id, ...)
	BodyBagsBagBase.SPAWNED_BAGS[self._unit:key()].owner = peer_id
	self:_update_list_item()
	return sync_setup_original(self, ammo_upgrade_lvl, peer_id, ...)
end

function BodyBagsBagBase:_set_visual_stage(...)
	BodyBagsBagBase.SPAWNED_BAGS[self._unit:key()].amount = self._bodybag_amount
	if self._bodybag_amount <= 0 then
		self:_destroy_list_item()	--Cause body bag case wants to be a special little snowflake and stick around when empty
	else
		self:_update_list_item()
	end
	return _set_visual_stage_original(self, ...)
end

function BodyBagsBagBase:destroy(...)
	BodyBagsBagBase.SPAWNED_BAGS[self._unit:key()] = nil
	self:_destroy_list_item()
	return destroy_original(self, ...)
end

function CustomBodyBagsBagBase:_set_empty(...)
	BodyBagsBagBase.SPAWNED_BAGS[self._unit:key()] = nil
	self:_destroy_list_item()
	return _set_empty_original(self, ...)
end


function BodyBagsBagBase:_create_list_item()
	if HUDManager.ListOptions.show_equipment and managers.hud and managers.hud:list_initialized() then
		local item = managers.hud:hud_list("left_side_list"):item("equipment"):register_item(tostring(self._unit:key()), HUDList.BagEquipmentItem, "body_bag", self)
		item:activate()
	end
	self:_update_list_item()
end

function BodyBagsBagBase:_update_list_item()
	if HUDManager.ListOptions.show_equipment and managers.hud and managers.hud:list_initialized() then
		local item = managers.hud:hud_list("left_side_list"):item("equipment"):item(tostring(self._unit:key()))
		if item then
			local data = BodyBagsBagBase.SPAWNED_BAGS[self._unit:key()]
			item:set_amount(data.amount)
			item:set_max_amount(data.max_amount)
			item:set_owner(data.owner)
		end
	end
end

function BodyBagsBagBase:_destroy_list_item()
	if managers.hud and managers.hud:list_initialized() then
		managers.hud:hud_list("left_side_list"):item("equipment"):unregister_item(tostring(self._unit:key()))
	end
end

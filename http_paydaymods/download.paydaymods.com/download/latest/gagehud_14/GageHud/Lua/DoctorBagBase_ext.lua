local doctor_bag_take_original = DoctorBagBase.take
function DoctorBagBase:take(unit)
	managers.hud._teammate_panels[HUDManager.PLAYER_PANEL]:reset_downs()
	doctor_bag_take_original(self, unit)
end

DoctorBagBase.SPAWNED_BAGS = {}

local spawn_original = DoctorBagBase.spawn
local init_original = DoctorBagBase.init
local sync_setup_original = DoctorBagBase.sync_setup
local _set_visual_stage_original = DoctorBagBase._set_visual_stage
local destroy_original = DoctorBagBase.destroy
local _set_empty_original = CustomDoctorBagBase._set_empty

function DoctorBagBase.spawn(pos, rot, amount_upgrade_lvl, peer_id, ...)
	local unit = spawn_original(pos, rot, amount_upgrade_lvl, peer_id, ...)
	DoctorBagBase.SPAWNED_BAGS[unit:key()] = DoctorBagBase.SPAWNED_BAGS[unit:key()] or { unit = unit }
	DoctorBagBase.SPAWNED_BAGS[unit:key()].owner = peer_id
	unit:base():_create_list_item()
	return unit
end

function DoctorBagBase:init(...)
	init_original(self, ...)
	DoctorBagBase.SPAWNED_BAGS[self._unit:key()] = DoctorBagBase.SPAWNED_BAGS[self._unit:key()] or { unit = self._unit }
	DoctorBagBase.SPAWNED_BAGS[self._unit:key()].max_amount = self._max_amount
	self:_create_list_item()
end

function DoctorBagBase:sync_setup(amount_upgrade_lvl, peer_id, ...)
	DoctorBagBase.SPAWNED_BAGS[self._unit:key()].owner = peer_id
	self:_update_list_item()
	return sync_setup_original(self, amount_upgrade_lvl, peer_id, ...)
end

function DoctorBagBase:_set_visual_stage(...)
	DoctorBagBase.SPAWNED_BAGS[self._unit:key()].amount = self._amount
	self:_update_list_item()
	return _set_visual_stage_original(self, ...)
end

function DoctorBagBase:destroy(...)
	DoctorBagBase.SPAWNED_BAGS[self._unit:key()] = nil
	self:_destroy_list_item()
	return destroy_original(self, ...)
end

function CustomDoctorBagBase:_set_empty(...)
	DoctorBagBase.SPAWNED_BAGS[self._unit:key()] = nil
	self:_destroy_list_item()
	return _set_empty_original(self, ...)
end


function DoctorBagBase:_create_list_item()
	if HUDManager.ListOptions.show_equipment and managers.hud and managers.hud:list_initialized() then
		local item = managers.hud:hud_list("left_side_list"):item("equipment"):register_item(tostring(self._unit:key()), HUDList.BagEquipmentItem, "doc_bag", self)
		item:activate()
	end
	self:_update_list_item()
end

function DoctorBagBase:_update_list_item()
	if HUDManager.ListOptions.show_equipment and managers.hud and managers.hud:list_initialized() then
		local item = managers.hud:hud_list("left_side_list"):item("equipment"):item(tostring(self._unit:key()))
		if item then
			local data = DoctorBagBase.SPAWNED_BAGS[self._unit:key()]
			item:set_amount(data.amount)
			item:set_max_amount(data.max_amount)
			item:set_owner(data.owner)
		end
	end
end

function DoctorBagBase:_destroy_list_item()
	if managers.hud and managers.hud:list_initialized() then
		managers.hud:hud_list("left_side_list"):item("equipment"):unregister_item(tostring(self._unit:key()))
	end
end
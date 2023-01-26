local init_original = ECMJammerBase.init
local destroy_original = ECMJammerBase.destroy
local update_original = ECMJammerBase.update

ECMJammerBase.SPAWNED_ECMS = {}

function ECMJammerBase:init(...)
	init_original(self, ...)
	ECMJammerBase.SPAWNED_ECMS[self._unit:key()] = { unit = self._unit }
	
	if HUDManager.ListOptions.show_ecms and managers.hud and managers.hud:list_initialized() then
		managers.hud:hud_list("left_side_list"):item("ecms"):register_item(tostring(self._unit:key()), HUDList.ECMItem)
	end
end

function ECMJammerBase:destroy(...)
	ECMJammerBase.SPAWNED_ECMS[self._unit:key()] = nil
	
	if HUDManager.ListOptions.show_ecms and managers.hud and managers.hud:list_initialized() then
		managers.hud:hud_list("left_side_list"):item("ecms"):unregister_item(tostring(self._unit:key()))
	end
	
	return destroy_original(self, ...)
end

function ECMJammerBase:update(unit, t, ...)
	update_original(self, unit, t, ...)
	
	if HUDManager.ListOptions.show_ecms and managers.hud and managers.hud:list_initialized() then
		local item = managers.hud:hud_list("left_side_list"):item("ecms"):item(tostring(self._unit:key()))
		if item then
			if self._battery_life > 0 then
				ECMJammerBase.SPAWNED_ECMS[self._unit:key()].active = true
				item:activate()
				item:update_timer(t, self._battery_life)
			else
				ECMJammerBase.SPAWNED_ECMS[self._unit:key()].active = nil
				item:update_timer(t, 0)
				item:deactivate()
			end
		end
	end
end

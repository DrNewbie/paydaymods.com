
--[[
Hooks:PostHook(ECMJammerBase,"_set_feedback_active","aui_set_feedback_active_ecm",function(self)
	managers.player:add_tracked_ecm(self._unit:key(),{
		unit = self._unit,
		key = self._unit:key(),
		owner_id = self._owner_id,
		jam_people = self._feedback_active,
		jam_cameras = jam_cameras,
		jam_pagers = jam_pagers,
		battery_life = battery_life,
		expire_t = self._feedback_expire_t
	})
end)
--]]
Hooks:PostHook(ECMJammerBase,"set_active","khud_activate_ecm",function(self,active)
	if false and self._owner_id == 1 then
		jam_cameras = managers.player:has_category_upgrade("ecm_jammer", "affects_cameras")
		jam_pagers = managers.player:has_category_upgrade("ecm_jammer", "affects_pagers")
	elseif Network:is_server() then
		local jam_cameras = true --self:owner():base():upgrade_value("ecm_jammer", "affects_cameras")
		local jam_pagers = true --self:owner():base():upgrade_value("ecm_jammer", "affects_pagers")
		local battery_life = self._battery_life
		local expire_t = battery_life + Application:time()
		managers.player:add_tracked_ecm(self._unit:key(),{
			unit = self._unit,
			key = self._unit:key(),
			owner_id = self._owner_id,
			jam_people = self._feedback_active,
			jam_cameras = jam_cameras,
			jam_pagers = jam_pagers,
			battery_life = battery_life,
			expire_t = expire_t
		})
--		AhriUI:c_log(self._owner_id,battery_life)
--		AhriUI:c_log(jam_cameras,"Jam cameras")
--		AhriUI:c_log(jam_pagers,"Jam pagers")
--		AhriUI:c_log(battery_life,"battery life")
--		AhriUI:c_log(self._unit:key(),"ECMJammerBase:1 unit key")
	end	
end)

Hooks:PostHook(ECMJammerBase,"setup","khud_setup_ecm",function(self,battery_life_upgrade_lvl, owner)
--	AhriUI:c_log(AhriUI:concat({battery_life_upgrade_lvl or "nil",upgrade_lvl or "nil",owner or "nil"}),"battery_life_upgrade_lvl,upgrade_lvl,owner")
	self._ecm_upgrade_lvl = upgrade_lvl or battery_life_upgrade_lvl or self._ecm_upgrade_lvl
end)
Hooks:PostHook(ECMJammerBase,"sync_setup","khud_sync_setup_ecm",function(self,upgrade_lvl,peer_id)
--	AhriUI:c_log(AhriUI:concat({upgrade_lvl or "nil",peer_id or "nil"}),"upgrade_lvl,peer_id")
	self._owner_id = peer_id
	self._ecm_upgrade_lvl = upgrade_lvl or self._ecm_upgrade_lvl
end)

Hooks:PostHook(ECMJammerBase,"sync_net_event","khud_sync_net_event_ecm",function(self,event_id)
	local ecm_upgrade_lvl = tonumber(self._ecm_upgrade_lvl or 1)
	if not Network:is_server() then
		local jams_cameras = not not ecm_upgrade_lvl --true and not not not false or not not true
		local jams_pagers = ecm_upgrade_lvl >= 3
		local battery_life = self._battery_life
		local expire_t = Application:time() + battery_life
		if event_id == self._NET_EVENTS.jammer_active then 
			managers.player:add_tracked_ecm(self._unit:key(),{
				unit = self._unit,
				key = self._unit:key(),
				owner_id = self._owner_id,
				jam_people = self._feedback_active,
				jam_cameras = jam_cameras,
				jam_pagers = jam_pagers,
				battery_life = battery_life,
				expire_t = expire_t
			})		
--			AhriUI:c_log(self._unit:key(),"ECMJammerBase:2 unit key")
		elseif event_id == self._NET_EVENTS.battery_empty then 
			managers.player:add_tracked_ecm(self._unit:key(),{
				unit = self._unit,
				key = self._unit:key(),
				owner_id = self._owner_id,
				jam_people = self._feedback_active,
				jam_cameras = jam_cameras,
				jam_pagers = jam_pagers,
				battery_life = battery_life,
				expire_t = expire_t
			})
--			AhriUI:c_log(self._unit:key(),"ECMJammerBase:3 unit key")
		end
	end
end)
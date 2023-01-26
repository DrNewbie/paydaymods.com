if not mod_collection then
	return
end

local SHOW_TIMERS = mod_collection._data.show_timers


if SHOW_TIMERS then
	local TimerGui__start_original = TimerGui._start
	local TimerGui__set_done_original = TimerGui._set_done
	local TimerGui__set_jammed_original = TimerGui._set_jammed
	local TimerGui__set_powered = TimerGui._set_powered
	local TimerGui_destroy_original = TimerGui.destroy
	local TimerGui_update_original = TimerGui.update
	
	function TimerGui:_start(...)
		if self:_create_list_item() then
			self._list_item:activate()
		end
			
		return TimerGui__start_original(self, ...)
	end
	
	function TimerGui:_set_done(...)
		self:_delete_list_item()
		
		return TimerGui__set_done_original(self, ...)
	end
	
	function TimerGui:_set_jammed(jammed, ...)
		if self._list_item then
			self._list_item:set_jammed(jammed)
		end
		
		return TimerGui__set_jammed_original(self, jammed, ...)
	end
	
	function TimerGui:_set_powered(powered, ...)
		if self._list_item then
			self._list_item:set_powered(powered)
		end
		
		return TimerGui__set_powered(self, powered, ...)
	end
	
	function TimerGui:destroy(...)
		self:_delete_list_item()
		
		return TimerGui_destroy_original(self, ...)
	end
	
	function TimerGui:update(unit, t, ...)
		if self._list_item then
			self._list_item:update_timer(t, self._time_left)
			if self._time_left < 0.25 and not self._delete_scheduled then
				--Failsafe to remove expired timers since some are not destroyed properly by the game
				self._delete_scheduled = true
				managers.enemy:add_delayed_clbk("delete_timer_" .. tostring(self._unit:key()), callback(self, self, "_delete_list_item"), t + 0.25)
			end
		end
		
		return TimerGui_update_original(self, unit, t, ...)
	end
	
	function TimerGui:_create_list_item()
		if not self._list_item then
			local id = "timer_" .. tostring(self._unit:key())
			local timer_type = self._unit:base().is_drill and HUDList.DrillItem or 
				self._unit:base().is_hacking_device and HUDList.HackItem or
				self._unit:base().is_saw and HUDList.SawItem
				
			self._list_item =	timer_type and managers.hud:hud_list("left_side_list"):item("timers"):register_item(id, timer_type, self._unit) or
				managers.hud:hud_list("left_side_list"):item("timers"):register_item(id, HUDList.TimerItem, self._unit, "?")
		end
		return self._list_item
	end
	
	function TimerGui:_delete_list_item()
		if self._list_item then
			if self._delete_scheduled then
				managers.enemy:remove_delayed_clbk("delete_timer_" .. tostring(self._unit:key()))
			end
			self._list_item:delete()
			self._list_item = nil
		end
	end
end

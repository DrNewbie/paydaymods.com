if not mod_collection then
	return
end

local SHOW_TIMERS = mod_collection._data.show_timers

if SHOW_TIMERS then
	local DigitalGui_init_original = DigitalGui.init
	local DigitalGui_update_original = DigitalGui.update
	local DigitalGui_timer_set_original = DigitalGui.timer_set
	local DigitalGui_timer_start_count_up_original = DigitalGui.timer_start_count_up
	local DigitalGui_timer_start_count_down_original = DigitalGui.timer_start_count_down
	local DigitalGui_timer_pause_original = DigitalGui.timer_pause
	local DigitalGui_timer_resume_original = DigitalGui.timer_resume
	local DigitalGui__timer_stop_original = DigitalGui._timer_stop
	local DigitalGui_destroy_original = DigitalGui.destroy
	
	DigitalGui._DEFAULT_CALLBACKS = {
		on_update = function(timer_object, t, dt)
			timer_object._list_item:update_timer(t, timer_object._timer)
		end,
		on_timer_set = function(timer_object, timer)
			if timer_object._inital_set_done then
				timer_object._list_item:activate()
				timer_object._list_item:update_timer(Application:time(), timer)
			else
				timer_object._inital_set_done = true
			end
		end,
		on_timer_start_count = function(timer_object, up)
			timer_object._list_item:activate()
			timer_object._list_item:set_jammed(false)
		end,
		on_timer_pause = function(timer_object, paused)
			timer_object._list_item:set_jammed(paused)
		end,
		on_timer_stop = function(timer_object)
			timer_object._list_item:deactivate()
		end
	}
	
	--TODO: Add unique names?
	DigitalGui._TIMER_DATA = {
		["132864"] = {	--Meltdown vault temperature
			on_timer_start_count = false,
			on_timer_pause = function(o) 
				o._list_item:deactivate() 
				o._listeners["on_timer_set"] = false
			end,
			class = "TemperatureGaugeItem",
			params = { start = 0, goal = 50 },
		},
		["132675"] = {	--Hoxton Revenge panic room timelock
			on_timer_pause = function(timer_object, paused) 
				if not managers.groupai:state():whisper_mode() then 
					timer_object._list_item:deactivate()
				else
					DigitalGui._DEFAULT_CALLBACKS.on_timer_pause(timer_object, paused)
				end
			end,
			on_timer_set = false,
		},
		["139706"] = { 	--Hoxton Revenge alarm
			on_timer_pause = function(o) 
				o._list_item:deactivate()
			end
		},
		--["130320"] = { },	--The Diamond timelock #1
		--["130395"] = { },	--The Diamond timelock #2
		--["104671"] = { },	--Big Bank timelock door
		["101457"] = { ignore = true },	--Extra Big Bank timer, ignore
	}
	DigitalGui._TIMER_DATA["130022"] = table.map_copy(DigitalGui._TIMER_DATA["132675"])	--Train Heist door 1 (dockyard)
	DigitalGui._TIMER_DATA["130122"] = table.map_copy(DigitalGui._TIMER_DATA["130022"])	--Train Heist door 2
	DigitalGui._TIMER_DATA["130222"] = table.map_copy(DigitalGui._TIMER_DATA["130022"])	--Train Heist door 3
	DigitalGui._TIMER_DATA["130322"] = table.map_copy(DigitalGui._TIMER_DATA["130022"])	--Train Heist door 4
	DigitalGui._TIMER_DATA["130422"] = table.map_copy(DigitalGui._TIMER_DATA["130022"])	--Train Heist door 5
	DigitalGui._TIMER_DATA["130522"] = table.map_copy(DigitalGui._TIMER_DATA["130022"])	--Train Heist door 6 (tunnel)
	DigitalGui._TIMER_DATA["133922"] = table.map_copy(DigitalGui._TIMER_DATA["132675"])	--The Diamond pressure plates timer
	
	DigitalGui.TIMER_CACHE = {}
	
	function DigitalGui:init(...)
		DigitalGui_init_original(self, ...)
		
		if managers.hud and managers.hud:list_initialized() then
			self:create_list_item()
		else
			table.insert(DigitalGui.TIMER_CACHE, self)
		end
	end

	function DigitalGui:update(unit, t, dt, ...)
		DigitalGui_update_original(self, unit, t, dt, ...)
		self:_listener_callback("on_update", t, dt)
	end
	
	function DigitalGui:timer_set(timer, ...)
		self:_listener_callback("on_timer_set", timer)
		return DigitalGui_timer_set_original(self, timer, ...)
	end
	
	function DigitalGui:timer_start_count_up(...)
		self:_listener_callback("on_timer_start_count", true)
		return DigitalGui_timer_start_count_up_original(self, ...)
	end

	function DigitalGui:timer_start_count_down(...)
		self:_listener_callback("on_timer_start_count", false)
		return DigitalGui_timer_start_count_down_original(self, ...)
	end

	function DigitalGui:timer_pause(...)
		self:_listener_callback("on_timer_pause", true)
		return DigitalGui_timer_pause_original(self, ...)
	end
	
	function DigitalGui:timer_resume(...)
		self:_listener_callback("on_timer_pause", false)
		return DigitalGui_timer_resume_original(self, ...)
	end

	function DigitalGui:_timer_stop(...)
		self:_listener_callback("on_timer_stop")
		return DigitalGui__timer_stop_original(self, ...)
	end

	function DigitalGui:destroy(...)
		self:delete_list_item()
		return DigitalGui_destroy_original(self, ...)
	end
	
	function DigitalGui:_listener_callback(event, ...)
		if not self._editor_id and managers.hud and managers.hud:list_initialized() then
			self:create_list_item()
		end
	
		if self._list_item and self._listeners[event] then
			self._listeners[event](self, ...)
		end
	end
	
	function DigitalGui:create_list_item()
		local editor_id = tostring(self._unit:editor_id())
		
		if editor_id ~= "-1" then
			self._editor_id = editor_id
			local timer_data = DigitalGui._TIMER_DATA[editor_id] or {}
			
			if not timer_data.ignore then
				self._list_item = managers.hud:hud_list("left_side_list"):item("timers"):register_item("timer_" .. tostring(self._unit:key()), timer_data.class or "DigitalTimerItem", self._unit, timer_data.params)
				self._listeners = table.map_copy(DigitalGui._DEFAULT_CALLBACKS)
				
				if timer_data.on_update ~= nil then self._listeners.on_update = timer_data.on_update end
				if timer_data.on_timer_set ~= nil then self._listeners.on_timer_set = timer_data.on_timer_set end
				if timer_data.on_timer_start_count ~= nil then self._listeners.on_timer_start_count = timer_data.on_timer_start_count end
				if timer_data.on_timer_pause ~= nil then self._listeners.on_timer_pause = timer_data.on_timer_pause end
				if timer_data.on_timer_stop ~= nil then self._listeners.on_timer_stop = timer_data.on_timer_stop end
				
				if timer_data.on_create then
					timer_data.on_create(self)
				end
			end
		end
	end

	function DigitalGui:delete_list_item()
		if self._list_item then
			self._list_item:delete()
			self._list_item = nil
		end
	end
end

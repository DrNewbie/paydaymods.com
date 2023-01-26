--block standard single-press inputs when quickchat panel is active
--this way, you won't accidentally switch weapons (because quickchat is bound to 1-4 by default) 	

--[[
local orig_get_pressed = ControllerWrapper.get_input_pressed

function ControllerWrapper:get_input_pressed(connection_name)
	local result = orig_get_pressed(self,connection_name)	
	return (not HoldTheKey:Keybind_Held("khud_quickchat_1_keybind")) and result
end
--]]

--[[
function ControllerWrapper:get_input_released(connection_name)
	local cache = self._input_released_cache[connection_name]

	if cache == nil then
		if self._connection_map[connection_name] then
			cache = self._enabled and self._virtual_controller and self:get_connection_enabled(connection_name) and self._virtual_controller:released(Idstring(connection_name)) or false
			cache = not not cache
		else
			self:print_invalid_connection_error(connection_name)

			cache = false
		end

		self._input_released_cache[connection_name] = cache
	end
	if connection_name == "switch_weapon" and cache then 
	end
	return (AhriUI.quickchat_focus and connection_name == "switch_weapon" and false) or cache
end
--]]
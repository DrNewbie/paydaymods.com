if mod_collection and mod_collection._data.enable_minimap then
	local add_original = ContourExt.add
	local _clear_original = ContourExt._clear

	function ContourExt:add(type, ...)
		if managers.hud:minimap_available() and not string.find(type, "flash") then --Custom marking safeguard, ignore
			local key = alive(self._unit) and tostring(self._unit:key())
			local class
			
			if self._unit:in_slot(managers.slot:get_mask("civilians")) then
				class = HUDMiniMapCivilianItem
			elseif self._unit:in_slot(managers.slot:get_mask("enemies")) then
				class = HUDMiniMapEnemyItem
			elseif self._unit:base() and self._unit:base().security_camera then
				class = HUDMiniMapCameraItem
			end
			
			if key and class then
				managers.hud:register_minimap_item(class, key, self._unit)
			end
		end

		return add_original(self, type, ...)
	end

	function ContourExt:_clear(...)
		local key = alive(self._unit) and tostring(self._unit:key())
		if key and managers.hud:minimap_available() then
			local item = managers.hud:minimap_item(key)
			if item then
				item:delete()
			end
		end

		return _clear_original(self, ...)
	end
end
CriminalsManager.MAX_NR_TEAM_AI = 2

if mod_collection and mod_collection._data.enable_minimap then
	local set_unit_original = CriminalsManager.set_unit
	local add_character_original = CriminalsManager.add_character

	function CriminalsManager:set_unit(name, ...)
		set_unit_original(name, ...)
		
		if managers.hud:minimap_available() then
			for id, data in pairs(self._characters) do
				if data.name == name and data.unit ~= managers.player:player_unit() then
					local key = alive(data.unit) and tostring(data.unit:key())
					if key then
						managers.hud:register_minimap_item(HUDMiniMapCriminalItem, key, data.unit)
					end
					return
				end
			end
		end
	end

	function CriminalsManager:add_character(name, ...)
		add_character_original(self, name, ...)

		if managers.hud:minimap_available() then
			for id, data in pairs(self._characters) do
				if data.name == name and data.unit ~= managers.player:player_unit() then
					local key = alive(data.unit) and tostring(data.unit:key())
					if key then
						managers.hud:register_minimap_item(HUDMiniMapCriminalItem, key, data.unit)
					end
					return
				end
			end
		end
	end
end

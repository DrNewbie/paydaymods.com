
-- This file gets executed twice, so all functions get hooked twice as well. This check prevents that from occurring
if BlackmarketRevert_BlackMarketManager_Hooked then
	return
else
	BlackmarketRevert_BlackMarketManager_Hooked = true
end

-- UPDATE 79 BEGIN MOD --
local view_weapon_actual = BlackMarketManager.view_weapon
function BlackMarketManager:view_weapon(category, slot, open_node_cb, spawn_workbench, custom_data, ...)
	view_weapon_actual(self, category, slot, open_node_cb, nil, custom_data, ...)
end

local view_weapon_with_mod_actual = BlackMarketManager.view_weapon_with_mod
function BlackMarketManager:view_weapon_with_mod(category, slot, part_id, open_node_cb, spawn_workbench, custom_data, ...)
	view_weapon_with_mod_actual(self, category, slot, part_id, open_node_cb, nil, custom_data, ...)
end

local view_weapon_without_mod_actual = BlackMarketManager.view_weapon_without_mod
function BlackMarketManager:view_weapon_without_mod(category, slot, part_id, open_node_cb, spawn_workbench, custom_data, ...)
	view_weapon_without_mod_actual(self, category, slot, part_id, open_node_cb, nil, custom_data, ...)
end
-- UPDATE 79 END MOD --


-- UPDATE 79 BEGIN MOD --
-- Can probably ignore the reduction of 0.1 for GRID_H_MUL in U79 as that only affects non-Win32 games

-- Replaced with U78 version
function BlackMarketGui:preview_weapon_with_mod_callback(data)
	managers.blackmarket:view_weapon_with_mod(data.category, data.slot, data.name, callback(self, self, "_open_preview_node"))
end

-- Replaced with U78 version
function BlackMarketGui:preview_weapon_without_mod_callback(data)
	if data.default_mod then
		managers.blackmarket:view_weapon_with_mod(data.category, data.slot, data.default_mod, callback(self, self, "_open_preview_node"))
	else
		managers.blackmarket:view_weapon_without_mod(data.category, data.slot, data.name, callback(self, self, "_open_preview_node"))
	end
end

-- Not reverting BlackMarketGui:choose_weapon_mods_callback() since its changes can be reverted from
-- BlackMarketGui:_start_crafting_weapon() and PlayerInventoryGui:_start_crafting_weapon()

function BlackMarketGui:_start_crafting_weapon(data, new_node_data)
	-- Reverting the UI changes introduced in U79
	for index, __ in ipairs(new_node_data) do
		new_node_data[index].override_slots = nil
	end
	new_node_data.panel_grid_h_mul = nil
	new_node_data.panel_grid_top_padding = nil
	new_node_data.skip_blur = nil
	new_node_data.use_bgs = nil

	-- These two lines were originally from BlackMarketGui:choose_weapon_mods_callback() in U78 code
	local open_node = data.open_node or self._inception_node_name or "blackmarket_node"
	managers.menu:open_node(open_node, {new_node_data})
end

-- Redirect back to BlackMarketGui:preview_weapon_callback() instead (see local BTNS in BlackMarketGui:_setup())
function BlackMarketGui:preview_weapon_mod_callback(...)
	self:preview_weapon_callback(...)
end

-- Not reverting BlackMarketGui:_start_page_data() as doing so causes the Steam Inventory to crash
-- UPDATE 79 END MOD --

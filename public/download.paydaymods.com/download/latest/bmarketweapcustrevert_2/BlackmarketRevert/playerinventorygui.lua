
function PlayerInventoryGui:_start_crafting_weapon(data, new_node_data)
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

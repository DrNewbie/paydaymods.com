
if InventoryChatAndPlayerStates_CoreMenuLogic_Hooked then
	return
else
	InventoryChatAndPlayerStates_CoreMenuLogic_Hooked = true
end

core:module("CoreMenuLogic")

local components_to_modify = {
	blackmarket_preview_node = true,
	blackmarket_preview_mask_node = true
}

local init_actual = Logic.init
function Logic:init(menu_data, ...)
	if menu_data ~= nil and menu_data._nodes ~= nil then
		-- Insert a bogus signal value for this mod's MenuComponentManager:set_active_components() hook, the original function
		-- performs validity checking anyway so it should be silently ignored
		for name, __ in pairs(components_to_modify) do
			if menu_data._nodes[name] ~= nil then
				table.insert(menu_data._nodes[name]._parameters.menu_components, 1, "preview_node")
			end
		end
		-- Apparently the mutators list node doesn't have a sync state, fix it
		do
			local tmp = menu_data._nodes.mutators
			if tmp ~= nil then
				tmp = tmp._parameters
				if tmp ~= nil and tmp.sync_state == nil then
					tmp.sync_state = "crimenet"
				end
			end
		end
	end

	return init_actual(self, menu_data, ...)
end

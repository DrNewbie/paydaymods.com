
if InventoryChatAndPlayerStates_MenuManager_Hooked then
	return
else
	InventoryChatAndPlayerStates_MenuManager_Hooked = true
end

-- Called from ConnectionNetworkHandler:set_menu_sync_state_index() whenever a player's menu state changes (e.g. Ready, In
-- inventory, etc.)
local _set_peer_sync_state_actual = MenuManager._set_peer_sync_state
function MenuManager:_set_peer_sync_state(peer_id, state, ...)
	_set_peer_sync_state_actual(self, peer_id, state, ...)

	InventoryChatAndPlayerStates:UpdatePlayerStates(peer_id, state)
end

-- This list is by no means exhaustive. This list includes the weapon/mask selection tabs since those do not have the 'sync_state'
-- field either (all of these GUIs assume PlayerInventoryGUI as the entry point since it sets sync_state upon entry). This would
-- cause the local player's state to remain stuck at blackmarket_weapon or blackmarket_mask instead of reverting to blackmarket
-- when the player backs out of the customization screens. The values below are prefixed with menu_lobby_menu_state_ to form a
-- translation string_id (see tweak_data.menu_sync_states)
-- TODO: Perhaps make use of BlackMarketGui.identifiers instead? (hook Logic:select_node() to inspect)
local componenttabnames = {
	-- Blackmarket GUI weapon/mask selection tabs (melee weapons, throwables and deployables not included)
	primaries = "blackmarket",
	secondaries = "blackmarket",
	masks = "blackmarket",
	-- Weapon modification tabs
	barrel = "blackmarket_weapon",
	ammo = "blackmarket_weapon",
	stock = "blackmarket_weapon",
	bonus = "blackmarket_weapon",
	grip = "blackmarket_weapon",
	gadget = "blackmarket_weapon",
	magazine = "blackmarket_weapon",
	sight = "blackmarket_weapon",
	barrel_ext = "blackmarket_weapon",
	upper_reciever = "blackmarket_weapon",
	custom = "blackmarket_weapon",
	lower_reciever = "blackmarket_weapon",
	extra = "blackmarket_weapon",
	foregrip = "blackmarket_weapon",
	bipod = "blackmarket_weapon",
	bayonet = "blackmarket_weapon",
	slide = "blackmarket_weapon",
	weapon_cosmetics = "blackmarket_weapon",
	-- Mask customization tabs
	textures = "blackmarket_mask",
	materials = "blackmarket_mask",
	colors = "blackmarket_mask",
}

local menu_component_tabs = nil
local _node_selected_actual = MenuManager._node_selected
function MenuManager:_node_selected(menu_name, node, ...)
	_node_selected_actual(self, menu_name, node, ...)

	-- Ugly workaround for state synching when customizing weapons or masks (why wasn't this implemented, OVK? You do realize
	-- that not implementing this only causes hosts to ignore players who are in the inventory anyway since that state text never
	-- changes to show that they are actually actively doing something)
	menu_component_tabs = node and node:parameters() and node:parameters().menu_component_tabs or nil
	if menu_name == "menu_main" and menu_component_tabs ~= nil then
		for name, __ in pairs(menu_component_tabs) do
			if componenttabnames[name] then
				self:set_and_send_sync_state(componenttabnames[name])
			end
			break
		end
	end
end

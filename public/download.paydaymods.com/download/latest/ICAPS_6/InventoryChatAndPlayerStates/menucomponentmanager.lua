
if InventoryChatAndPlayerStates_MenuComponentManager_Hooked then
	return
else
	InventoryChatAndPlayerStates_MenuComponentManager_Hooked = true
end

-- The following subtables are derived from the defaults in ChatGui.PRESETS (lib/managers/chatmanager.lua)
local components_to_find = {
	-- Affects the perk decks screen
	skilltree = {
		-- This field works as intended for horizontal positioning of the chat GUI
		left = 0,
		-- This field has no influence on chat GUI positioning at all since it gets stomped anyway by taking its vertical
		-- alignment from the chat button panel (which is adjusted by button_panel_vert_offset below) even after it is applied
		-- (see ChatGui:_show_crimenet_chat(), ChatGui:_hide_crimenet_chat()). That said, it must not be removed or set to nil
		-- since ChatGui:set_params() checks for the presence of /both/ the left and bottom fields before calling
		-- ChatGui:set_leftbottom()
		bottom = 0,
		layer = tweak_data.gui.CRIMENET_CHAT_LAYER,
		chat_blur = true,
		chat_bg_alpha = 0.25,
		is_crimenet_chat = true,
		chat_button_align = "left",
		-- Additional data that gets read by this mod's ChatGui:set_params() hook
		additional_data = {
			click_through_output_bg = false,
			button_panel_vert_offset = -10,
			align_to_wallet = true
		}
	},
	crimenet = {
		left = 0,
		bottom = 0,
		layer = tweak_data.gui.CRIMENET_CHAT_LAYER,
		chat_blur = true,
		chat_bg_alpha = 0.25,
		is_crimenet_chat = true,
		-- Additional data that gets read by this mod's ChatGui:set_params() hook
		additional_data = {
			click_through_output_bg = true,
			-- Position override data that will be read by InventoryChatAndPlayerStates:RealignPlayerStates()
			playerstates_position_override = {
				-- The left and bottom coordinates below will take reference from chat_button_panel instead of chat_button
				parent = "chat_button_panel",
				x = "left",
				y = "bottom",
				x_offset = 0,
				y_offset = -30,
				-- Take reference from the top of the chat_bg panel instead when the chat panel is open
				open_y_reference = "chat_bg",
				-- Additional vertical offset to apply
				open_y_offset = -5
			}
		}
	}
}

-- Note: The following lines all reference the exact same table instance (skilltree), use deep_clone() if modifications specific
-- to a given screen are needed to avoid affecting all other screens simultaneously

-- Affects all blackmarket screens (weapons, weapon mods, equipment, throwables, masks, materials, etc.)
components_to_find.blackmarket = components_to_find.skilltree
components_to_find.inventory = components_to_find.skilltree
-- This is actually a bogus identifier that is injected by this mod (see Logic:init()) since the preview nodes do not have any
-- easily identifiable components (they only have "menuscene_info", which is also common to other nodes)
components_to_find.preview_node = components_to_find.skilltree
-- Update 100+ skills screen compatibility. Do not remove or rename 'components_to_find.skilltree' as it is still being used for
-- the perk decks screen
components_to_find.skilltree_new = components_to_find.skilltree
components_to_find.mutators_list = components_to_find.skilltree
components_to_find.crew_management = components_to_find.skilltree

components_to_find.custom_safehouse = deep_clone(components_to_find.skilltree)
components_to_find.custom_safehouse.additional_data.button_panel_vert_offset = -15

local preplanning_map = {
	left = 10,
	bottom = 0,
	layer = tweak_data.gui.CRIMENET_CHAT_LAYER,
	chat_blur = true,
	chat_bg_alpha = 0.25,
	is_crimenet_chat = true,
	chat_button_align = "left",
	-- Additional data that gets read by this mod's ChatGui:set_params() hook
	additional_data = {
		click_through_output_bg = true,
		-- Position override data that will be read by InventoryChatAndPlayerStates:RealignPlayerStates()
		playerstates_position_override = {
			-- The left and bottom coordinates below will take reference from chat_button_panel instead of chat_button
			parent = "chat_button_panel",
			x = "left",
			y = "bottom",
			x_offset = 0,
			y_offset = -35,
			-- Take reference from the top of the chat_bg panel instead when the chat panel is open
			open_y_reference = "chat_bg",
			-- Additional vertical offset to apply
			open_y_offset = -5
		}
	}
}

local game_state_machine = nil

local valid_states = {
	menu_main = true,
	ingame_waiting_for_players = true
}

-- Called from Logic:_select_node() (core/lib/managers/menu/coremenulogic)
local function MenuComponentManager_set_active_components_hook(self, components, ...)
	if table.size(components) < 1 or not MenuCallbackHandler:is_multiplayer() or not managers.network:session() then
		return
	end

	game_state_machine = game_state_machine or _G.game_state_machine
	local state = game_state_machine:current_state_name()
	if state == nil or not valid_states[state] then
		-- This should fix the issue with the ICAPS panels and error strings appearing when using the Crime.net screen in Dallas'
		-- corner in the upgraded safe house
		return
	end

	local data = components_to_find[components[1]]
	if data ~= nil then
		if table.index_of(components, "crimenet_chats") == -1 then
			table.insert(components, "crimenet_chats")
		end

		-- This gets read by MenuComponentManager:_create_crimenet_chats_gui()
		self._saved_game_chat_params = data
	elseif components[1] == "preplanning_map" then
		-- Preplanning-specific configuration
		self._saved_game_chat_params = preplanning_map
	end
end
Hooks:AddHook("MenuComponentManagerPreSetActiveComponents", "InventoryChatAndPlayerStates_MenuComponentManager_set_active_components", MenuComponentManager_set_active_components_hook)

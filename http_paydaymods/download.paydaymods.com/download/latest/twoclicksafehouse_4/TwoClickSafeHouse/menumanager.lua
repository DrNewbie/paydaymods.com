
if TwoClickSafeHouse_MenuManager_Hooked then
	return
else
	TwoClickSafeHouse_MenuManager_Hooked = true
end

if not TwoClickSafeHouse then
	log("[TwoClickSafeHouse] Error: Failed to create Mod Options menu, aborting")
	return
end

if not MenuCallbackHandler then
	log("[TwoClickSafeHouse] Error: MenuCallbackHandler is nil, aborting")
	return
end

Hooks:Add("MenuManagerBuildCustomMenus", "BuildTwoClickSafeHouseMenu", function(menu_manager, nodes)
	if TwoClickSafeHouse == nil then
		return
	end

	local mainmenu = nodes.main
	if mainmenu == nil then
		-- Not actually a critical error since this occurs when hosting / joining a game session
--		log("[TwoClickSafeHouse] Fatal Error: Failed to locate main menu, aborting")
		return
	end
	if mainmenu._items == nil then
		log("[TwoClickSafeHouse] Fatal Error: Main menu node is empty, aborting")
		return
	end

	-- From Menu:AddButton() (mods/base/req/menus.lua)
	local data = {
		type = "CoreMenuItem.Item",
	}
	-- Archiving the translations in case OVK removes the strings in future:
	-- menu_safehouse -> Safe House
	-- menu_safehouse_help -> Go to the Safe House.
	local params = {
		name = "select_safehouse_btn",
		text_id = "menu_safehouse",
		help_id = "menu_safehouse_help",
		callback = "select_safehouse"
	}
	local new_item = mainmenu:create_item(data, params)
--	mainmenu:add_item(new_item)
	-- From MenuNode:add_item() (core/lib/managers/menu/coremenunode)
	new_item.dirty_callback = callback(mainmenu, mainmenu, "item_dirty")
	if mainmenu.callback_handler then
		new_item:set_callback_handler(mainmenu.callback_handler)
	end

	-- Determine where the item should be inserted
	local position = 8
	for index, item in pairs(mainmenu._items) do
		if item:name() == "divider_test2" then
			position = index
			break
		end
	end
	table.insert(mainmenu._items, position, new_item)
--	mainmenu:set_default_item_name("select_safehouse_btn")
end)

local function StartU110SafeHouse()
	Global.game_settings.single_player = true
	local CustomSafehouseGuiPageMap = _G.CustomSafehouseGuiPageMap
	if CustomSafehouseGuiPageMap ~= nil and type(CustomSafehouseGuiPageMap.go_to_safehouse) == "function" then
		CustomSafehouseGuiPageMap:go_to_safehouse({skip_question = true})
	else
		log("[TwoClickSafeHouse] MenuCallbackHandler:select_safehouse() | Error: CustomSafehouseGuiPageMap is nil or CustomSafehouseGuiPageMap.go_to_safehouse is not a function, aborting")
	end
end

local function OpenU110SafeHouseGUI()
	Global.game_settings.single_player = true
	local menumanager = managers.menu
	if menumanager ~= nil then
		menumanager:open_node("custom_safehouse")
	end
end

local function StartOldSafeHouse()
	MenuCallbackHandler:play_safehouse({skip_question = true})
end

local function NoOp()
end

function MenuCallbackHandler:select_safehouse()
	local TwoClickSafeHouse = _G.TwoClickSafeHouse
	if TwoClickSafeHouse == nil or TwoClickSafeHouse.Prefs == nil then
		return
	end

	local callbacks = {
		TwoClickSafeHouse.Prefs.OpenU110SafeHouseGUIInstead and OpenU110SafeHouseGUI or StartU110SafeHouse,
		StartOldSafeHouse,
		NoOp
	}

	local selection = math.clamp(TwoClickSafeHouse.Prefs.DefaultSelection or 1, 1, #callbacks)

	if not TwoClickSafeHouse.Prefs.NoConfirmation then
		local localizationmanager = managers.localization
		managers.system_menu:show({
			focus_button = selection,
			title = localizationmanager:text("dialog_safehouse_title"),
			text = localizationmanager:text("dialog_safehouse_goto_text"),
			button_list = {
				{
					text = localizationmanager:text("menu_custom_safehouse"),
					callback_func = callbacks[1]
				},
				{
					text = localizationmanager:text("twoclicksafehouse_oldsafehouse"),
					callback_func = callbacks[2]
				},
				{
					cancel_button = true,
					text = localizationmanager:text("dialog_no")
				}
			}
		})
	else
		callbacks[selection]()
	end
end

local function AddModOptions(menu_manager)
	if menu_manager == nil then
		return
	end

	MenuCallbackHandler.TwoClickSafeHouse_SaveSettings = function(node)
		TwoClickSafeHouse:Save()
	end

	MenuCallbackHandler.TwoClickSafeHouse_ToggleOpenU110SafeHouseGUIInstead = function(self, item)
		TwoClickSafeHouse.Prefs.OpenU110SafeHouseGUIInstead = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.TwoClickSafeHouse_DefaultSelection = function(self, item)
		TwoClickSafeHouse.Prefs.DefaultSelection = item:value()
	end

	MenuCallbackHandler.TwoClickSafeHouse_ToggleNoConfirmation = function(self, item)
		TwoClickSafeHouse.Prefs.NoConfirmation = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.TwoClickSafeHouse_Reset = function(self, item)
		local TwoClickSafeHouse = _G.TwoClickSafeHouse

		-- Zero everything out
		for name, __ in pairs(TwoClickSafeHouse.Prefs) do
			TwoClickSafeHouse.Prefs[name] = nil
		end
		-- Fill in the missing preferences with default values
		for key, value in pairs(TwoClickSafeHouse.DefPrefs) do
			if TwoClickSafeHouse.Prefs[key] == nil then
				TwoClickSafeHouse.Prefs[key] = value
			end
		end
		-- Force the save file to be overwritten with the default values as well
		TwoClickSafeHouse:Save()
		-- Update all GUI controls to match. Adapted from Menu:ResetItemsToDefaultValue() in mods/base/req/menus.lua
		for __, node in ipairs(item._parameters.gui_node.row_items) do
			for name, value in pairs(TwoClickSafeHouse.Prefs) do
				-- FIXME: This does not account for cases where there is a duplicate segment within a name (e.g. one option
				-- named 'somename' and another named 'somenameextended' causes the latter's default value to get ignored)
				if node.item._parameters.name:find(utf8.to_lower(name)) ~= nil then
					if node.item.set_value then
						if node.item._type == "toggle" then
							node.item:set_value(value and "on" or "off")
						else
							node.item:set_value(value)
						end
						-- Needed for sliders that perform rounding and toggle controls that perform refreshes
						node.item:trigger()
					end
					break
				end
			end
		end
		-- Force any sliders to be redrawn
		managers.viewport:resolution_changed()
	end

	MenuHelper:LoadFromJsonFile(TwoClickSafeHouse.ModOptions, TwoClickSafeHouse, TwoClickSafeHouse.Prefs)
end
Hooks:Add("MenuManagerInitialize", "TwoClickSafeHouse_AddModOptions", AddModOptions)

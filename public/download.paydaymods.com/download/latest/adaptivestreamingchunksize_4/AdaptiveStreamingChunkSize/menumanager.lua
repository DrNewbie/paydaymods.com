
if AdaptiveStreamingChunkSize == nil then
	log("[AdaptiveStreamingChunkSize] menumanager.lua | Error: Failed to create Mod Options menu, aborting")
	return
end

local MenuCallbackHandler = _G.MenuCallbackHandler
if MenuCallbackHandler == nil then
	log("[AdaptiveStreamingChunkSize] menumanager.lua | Error: MenuCallbackHandler is nil, aborting")
	return
end

local prefix = "adaptivestreamingchunksize_"
local menu_id = prefix .. "menu_id"

-- Menu declaration
local function SetupCustomMenu(menu_manager, nodes)
	MenuHelper:NewMenu(menu_id)
end
Hooks:Add("MenuManagerSetupCustomMenus", "AdaptiveStreamingChunkSize_MenuManagerSetupCustomMenus", SetupCustomMenu)

-- Populates the menu with controls
local function PopulateCustomMenu(menu_manager, nodes)
	local AdaptiveStreamingChunkSize = _G.AdaptiveStreamingChunkSize
	if AdaptiveStreamingChunkSize == nil then
		log("[AdaptiveStreamingChunkSize] PopulateCustomMenu() | Error: AdaptiveStreamingChunkSize is nil, aborting")
		return
	end

	local MenuHelper = _G.MenuHelper
	local menu = MenuHelper:GetMenu(menu_id)
	if menu == nil then
		log("[AdaptiveStreamingChunkSize] PopulateCustomMenu() | Error: Failed to create Mod Options menu, aborting")
		return
	end

	local control_config = {menu_id = menu_id}
	-- MenuItemMultiChoice requires at least one item to be present, otherwise expect crashes
	local placeholder = {"placeholder"}

	do
		control_config.localized = true
		local tmp = "mul_" .. prefix .. "setminimumstreamingchunksize"
		control_config.id = tmp
		control_config.title = tmp .. "_title"
		control_config.desc = tmp .. "_desc"
		control_config.callback = "AdaptiveStreamingChunkSize_SetMinimumStreamingChunkSize"
		-- Using a placeholder table here since BLT doesn't provide a way to prevent choice items from being localized
		control_config.items = placeholder
		control_config.priority = 3
		control_config.value = AdaptiveStreamingChunkSize.Prefs.MinimumStreamingChunkSize
	end
	MenuHelper:AddMultipleChoice(control_config)

	for key, __ in pairs(control_config) do
		control_config[key] = nil
	end

	do
		control_config.menu_id = menu_id
		control_config.localized = true
		local tmp = "mul_" .. prefix .. "setmaximumstreamingchunksize"
		control_config.id = tmp
		control_config.title = tmp .. "_title"
		control_config.desc = tmp .. "_desc"
		control_config.callback = "AdaptiveStreamingChunkSize_SetMaximumStreamingChunkSize"
		-- Using a placeholder table here since BLT doesn't provide a way to prevent choice items from being localized
		control_config.items = placeholder
		control_config.priority = 2
		control_config.value = AdaptiveStreamingChunkSize.Prefs.MaximumStreamingChunkSize
	end
	MenuHelper:AddMultipleChoice(control_config)

	for key, __ in pairs(control_config) do
		control_config[key] = nil
	end

	control_config.menu_id = menu_id
	control_config.id = prefix .. "divider1"
	control_config.size = 15
	control_config.priority = 1
	MenuHelper:AddDivider(control_config)

	for key, __ in pairs(control_config) do
		control_config[key] = nil
	end

	do
		control_config.menu_id = menu_id
		control_config.localized = true
		local tmp = "btn_" .. prefix .. "reset"
		control_config.id = tmp
		control_config.title = tmp .. "_title"
		control_config.desc = tmp .. "_desc"
		control_config.callback = "AdaptiveStreamingChunkSize_Reset"
		control_config.next_node = nil
		control_config.priority = 0
	end
	MenuHelper:AddButton(control_config)
end
Hooks:Add("MenuManagerPopulateCustomMenus", "AdaptiveStreamingChunkSize_MenuManagerPopulateCustomMenus", PopulateCustomMenu)

-- Build is a terrible name for this step, it's more of associating (linking) the menu with the hierarchy at the specified node...
local function AssociateCustomMenu(menu_manager, nodes)
	local AdaptiveStreamingChunkSize = _G.AdaptiveStreamingChunkSize
	if AdaptiveStreamingChunkSize == nil then
		log("[AdaptiveStreamingChunkSize] AssociateCustomMenu() | Error: AdaptiveStreamingChunkSize is nil, aborting")
		return
	end

	local validsizes = AdaptiveStreamingChunkSize.ValidSizes
	if type(validsizes) ~= "table" then
		log("[AdaptiveStreamingChunkSize] AssociateCustomMenu() | Error: AdaptiveStreamingChunkSize.ValidSizes is not a table, aborting")
		return
	end

	local menu = MenuHelper:BuildMenu(menu_id, {back_callback = "AdaptiveStreamingChunkSize_SaveSettings"})
	if menu == nil or menu._items_list == nil then
		log("[AdaptiveStreamingChunkSize] AssociateCustomMenu() | Error: Failed to create Mod Options menu, aborting")
		return
	end

	nodes[menu_id] = menu
	MenuHelper:AddMenuItem(nodes.blt_options or nodes.options, menu_id, prefix .. "menu_title", prefix .. "menu_desc")

	local identifiers = {
		["mul_" .. prefix .. "setminimumstreamingchunksize"] = 1,
		["mul_" .. prefix .. "setmaximumstreamingchunksize"] = 2,
	}
	for __, control in ipairs(menu._items_list) do
		local tmp = control._parameters
		if tmp ~= nil then
			tmp = identifiers[tmp.name]
			if tmp then
				control:clear_options()
				local config = {
					_meta = "option",
					localize = false
				}
				local CoreMenuItemOption = _G.CoreMenuItemOption
				for __, value in ipairs(validsizes) do
					config.text_id = tostring(value)
					config.value = value
					local option = CoreMenuItemOption.ItemOption:new(config)
					control:add_option(option)
				end
				control:_show_options(nil)
				control:set_value(AdaptiveStreamingChunkSize.Prefs[tmp == 1 and "MinimumStreamingChunkSize" or "MaximumStreamingChunkSize"])
			end
		end
	end
end
Hooks:Add("MenuManagerBuildCustomMenus", "AdaptiveStreamingChunkSize_MenuManagerBuildCustomMenus", AssociateCustomMenu)

function MenuCallbackHandler.AdaptiveStreamingChunkSize_SaveSettings(node)
	AdaptiveStreamingChunkSize:Save()
end

function MenuCallbackHandler:AdaptiveStreamingChunkSize_SetMinimumStreamingChunkSize(item)
	local AdaptiveStreamingChunkSize = _G.AdaptiveStreamingChunkSize
	local value = item:value()
	AdaptiveStreamingChunkSize.Prefs.MinimumStreamingChunkSize = value

	-- Immediately clobber the current usermanager setting if the local player has already spawned. This check fails when the
	-- heist success / failure screen is shown since the player's unit still exists at that point, but this should not pose any
	-- problems since the only ways out from that state are to return to the main menu / restart the level, respectively
	do
		local managers = _G.managers
		local tmp = managers.player
		if tmp ~= nil then
			tmp = tmp:local_player()
			if alive(tmp) then
				tmp = managers.user
				if tmp ~= nil then
					tmp:set_setting("max_streaming_chunk", value)
				end
			end
		end
	end

	-- If the minimum chunk size exceeds the maximum chunk size, update the latter to match
	if AdaptiveStreamingChunkSize.Prefs.MaximumStreamingChunkSize < value then
		local tmp = "mul_" .. prefix .. "setmaximumstreamingchunksize"
		for __, node in ipairs(item._parameters.gui_node.row_items) do
			if node.item._parameters.name == tmp and type(node.item.set_value) == "function" then
				node.item:set_value(value)
				node.item:trigger()
				break
			end
		end
	end
end

function MenuCallbackHandler:AdaptiveStreamingChunkSize_SetMaximumStreamingChunkSize(item)
	local AdaptiveStreamingChunkSize = _G.AdaptiveStreamingChunkSize
	local value = item:value()
	AdaptiveStreamingChunkSize.Prefs.MaximumStreamingChunkSize = value

	-- Immediately clobber the current usermanager setting if the local player has /not/ already spawned. This check fails when
	-- the heist success / failure screen is shown since the player's unit still exists at that point, but this should not pose
	-- any problems since the only ways out from that state are to return to the main menu / restart the level, respectively
	do
		local managers = _G.managers
		local tmp = managers.player
		if tmp ~= nil then
			tmp = tmp:local_player()
			if not alive(tmp) then
				tmp = managers.user
				if tmp ~= nil then
					tmp:set_setting("max_streaming_chunk", value)
				end
			end
		end
	end

	-- If the maximum chunk size is smaller than the minimum chunk size, update the latter to match
	if value < AdaptiveStreamingChunkSize.Prefs.MinimumStreamingChunkSize then
		local tmp = "mul_" .. prefix .. "setminimumstreamingchunksize"
		for __, node in ipairs(item._parameters.gui_node.row_items) do
			if node.item._parameters.name == tmp and type(node.item.set_value) == "function" then
				node.item:set_value(value)
				node.item:trigger()
				break
			end
		end
	end
end

function MenuCallbackHandler:AdaptiveStreamingChunkSize_Reset(item)
	-- Zero everything out
	for name, __ in pairs(AdaptiveStreamingChunkSize.Prefs) do
		AdaptiveStreamingChunkSize.Prefs[name] = nil
	end
	-- Fill in the missing preferences with default values
	for key, value in pairs(AdaptiveStreamingChunkSize.DefPrefs) do
		if AdaptiveStreamingChunkSize.Prefs[key] == nil then
			AdaptiveStreamingChunkSize.Prefs[key] = value
		end
	end
	-- Force the save file to be overwritten with the default values as well
	AdaptiveStreamingChunkSize:Save()
	-- Update all GUI controls to match. Adapted from Menu:ResetItemsToDefaultValue() in mods/base/req/menus.lua
	for __, node in ipairs(item._parameters.gui_node.row_items) do
		for name, value in pairs(AdaptiveStreamingChunkSize.Prefs) do
			-- FIXME: This does not account for cases where there is a duplicate segment within a name (e.g. one option named
			-- 'somename' and another named 'somenameextended' causes the latter's default value to get ignored)
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

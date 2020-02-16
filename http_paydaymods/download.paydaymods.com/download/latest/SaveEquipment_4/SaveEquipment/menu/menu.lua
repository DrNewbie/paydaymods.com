if not SaveEquipmentMenuMaker then
  SaveEquipmentMenuMaker = SaveEquipmentMenuMaker or class()

  function SaveEquipmentMenuMaker:LoadMenu( file_path, parent_class, data_table )

	  local file = io.open( file_path, "r" )
	  if file then

		  local file_content = file:read("*all")
		  file:close()

		  local content = json.decode( file_content )
		  local menu_id = content.menu_id
		  local parent_menu = content.parent_menu_id
		  local menu_name = content.title
		  local menu_desc = content.description
		  local items = content.items
		  local focus_changed_callback = content.focus_changed_callback
		  local back_callback = content.back_callback
		  local menu_priority = content.priority or nil
		  local area_bg = content.area_bg

		  Hooks:Add("MenuManagerSetupCustomMenus", "Base_SetupSaveEquipmentMenu_Json_" .. menu_id, function( menu_manager, nodes )
			  MenuHelper:NewMenu( menu_id )
		  end)

		  Hooks:Add("MenuManagerBuildCustomMenus", "Base_BuildSaveEquipmentMenu_Json_" .. menu_id, function( menu_manager, nodes )

			  local data = {
				  focus_changed_callback = focus_changed_callback,
				  back_callback = back_callback,
				  area_bg = area_bg,
			  }
			  nodes[menu_id] = MenuHelper:BuildMenu( menu_id, data )

			  if menu_priority ~= nil then
				  for k, v in pairs( nodes[parent_menu]._items ) do
					  if menu_priority > (v._priority or 0) then
						  menu_priority = k
						  break
					  end
				  end
			  end

			  MenuHelper:AddMenuItem( nodes[parent_menu], menu_id, menu_name, menu_desc, menu_priority )

		  end)

		  Hooks:Add("MenuManagerPopulateCustomMenus", "Base_PopulateSaveEquipmentMenu_Json_" .. menu_id, function( menu_manager, nodes )

			  for k, item in pairs( items ) do

				  local type = item.type
				  local id = item.id
				  local title = item.title
				  local desc = item.description
				  local callback = item.callback
				  local priority = item.priority or #items - k
				  local value = item.default_value
				  local localized = item.localized
				  if data_table and data_table[item.value] ~= nil then
					  value = data_table[item.value]
				  end

				  if type == "button" then
					  MenuHelper:AddButton({
						  id = id,
						  title = title,
						  desc = desc,
						  callback = callback,
						  next_node = item.next_menu or nil,
						  menu_id = menu_id,
						  priority = priority,
						  localized = localized,
					  })
				  end

				  if type == "toggle" then
					  SaveEquipmentMenuMaker:AddToggle({
						  id = id,
						  title = title,
						  desc = desc,
						  callback = callback,
						  value = value,
						  menu_id = menu_id,
						  priority = priority,
						  localized = localized,
					  })
				  end
				  
				  if type == "subtoggle" then
					  SaveEquipmentMenuMaker:AddSubToggle({
						  id = id,
						  title = title,
						  desc = desc,
						  callback = callback,
						  value = value,
						  menu_id = menu_id,
						  priority = priority,
						  localized = localized,
						  color = Color( 0.25, 1, 1, 1 ),
					  })
				  end

				  if type == "slider" then
					  MenuHelper:AddSlider({
						  id = id,
						  title = title,
						  desc = desc,
						  callback = callback,
						  value = value,
						  min = item.min or 0,
						  max = item.max or 1,
						  step = item.step or 0.1,
						  show_value = true,
						  menu_id = menu_id,
						  priority = priority,
						  localized = localized,
					  })
				  end

				  if type == "divider" then
					  MenuHelper:AddDivider({
						  id = "divider_" .. menu_id .. "_" .. tostring(priority),
						  size = item.size,
						  menu_id = menu_id,
						  priority = priority,
					  })
				  end

				  if type == "keybind" then

					  local key = ""
					  if item.keybind_id then
						  key = LuaModManager:GetPlayerKeybind( item.keybind_id ) or ""
					  end

					  MenuHelper:AddKeybinding({
						  id = id,
						  title = title,
						  desc = desc,
						  connection_name = item.keybind_id,
						  button = key,
						  binding = key,
						  menu_id = menu_id,
						  priority = priority,
						  localized = localized,
					  })

					  LuaModManager:AddKeybinding( item.keybind_id, parent_class[item.func] )

				  end

				  if type == "multiple_choice" then
					  MenuHelper:AddMultipleChoice({
						  id = id,
						  title = title,
						  desc = desc,
						  callback = callback,
						  items = item.items,
						  value = value,
						  menu_id = menu_id,
						  priority = priority,
						  localized = localized,
					  })
				  end

			  end

		  end)

	  else
		  log("[Error] Could not load file: " .. file_path)
	  end
  end

function SaveEquipmentMenuMaker:AddToggle( toggle_data )

	  local data = {
		  type = "CoreMenuItemToggle.ItemToggle",
		  {
			  _meta = "option",
			  icon = "guis/textures/pd2/pd2_waypoints",
			  value = "on",
			  x = 64,
			  y = 64,
			  w = 32,
			  h = 32,
			  s_icon = "guis/textures/pd2/pd2_waypoints",
			  s_x = 64,
			  s_y = 64,
			  s_w = 32,
			  s_h = 32
		  },
		  {
			  _meta = "option",
			  icon = "guis/textures/pd2/lock_incompatible",
			  value = "off",
			  x = 0,
			  y = 0,
			  w = 32,
			  h = 32,
			  s_icon = "guis/textures/pd2/lock_incompatible",
			  s_x = 0,
			  s_y = 0,
			  s_w = 32,
			  s_h = 32
		  }
	  }

	  local params = {
		  name = toggle_data.id,
		  text_id = toggle_data.title,
		  help_id = toggle_data.desc,
		  callback = toggle_data.callback,
		  disabled_color = toggle_data.disabled_color or Color( 0.25, 1, 1, 1 ),
		  icon_by_text = toggle_data.icon_by_text or false,
		  localize = toggle_data.localized,
	  }

	  local menu = MenuHelper:GetMenu( toggle_data.menu_id )
	  local item = menu:create_item( data, params )
	  item:set_value( toggle_data.value and "on" or "off" )
	  item._priority = toggle_data.priority

	  if toggle_data.disabled then
		  item:set_enabled( not toggle_data.disabled )
	  end

	  menu._items_list = menu._items_list or {}
	  table.insert( menu._items_list, item )

  end

  function SaveEquipmentMenuMaker:AddSubToggle( toggle_data )

	  local data = {
		  type = "CoreMenuItemToggle.ItemToggle",
		  {
			  _meta = "option",
			  icon = "guis/textures/menu_tickbox",
			  value = "on",
			  x = 24,
			  y = 0,
			  w = 24,
			  h = 24,
			  s_icon = "guis/textures/menu_tickbox",
			  s_x = 24,
			  s_y = 24,
			  s_w = 24,
			  s_h = 24
		  },
		  {
			  _meta = "option",
			  icon = "guis/textures/menu_tickbox",
			  value = "off",
			  x = 0,
			  y = 0,
			  w = 24,
			  h = 24,
			  s_icon = "guis/textures/menu_tickbox",
			  s_x = 0,
			  s_y = 24,
			  s_w = 24,
			  s_h = 24
		  }
	  }

	  local params = {
		  name = toggle_data.id,
		  text_id = toggle_data.title,
		  help_id = toggle_data.desc,
		  callback = toggle_data.callback,
		  disabled_color = toggle_data.disabled_color or Color( 0.25, 1, 1, 1 ),
		  icon_by_text = toggle_data.icon_by_text or false,
		  localize = toggle_data.localized,
	  }

	  local menu = MenuHelper:GetMenu( toggle_data.menu_id )
	  local item = menu:create_item( data, params )
	  item:set_value( toggle_data.value and "on" or "off" )
	  item._priority = toggle_data.priority

	  if toggle_data.disabled then
		  item:set_enabled( not toggle_data.disabled )
	  end

	  menu._items_list = menu._items_list or {}
	  table.insert( menu._items_list, item )

  end
end




_G.SaveEquipmentMenu = _G.SaveEquipmentMenu or {}
SaveEquipmentMenu._homepath = ModPath
SaveEquipmentMenu._path = ModPath .. "menu/"
SaveEquipmentMenu._data_path = SavePath .. "saveequipment_saved_data.txt"

SaveEquipmentMenu._data = {}

SaveEquipmentMenu._data.multi_saveequipment_enable_medic_downs_value = SaveEquipmentMenu._data.multi_saveequipment_enable_medic_downs_value or 4


function SaveEquipmentMenu:Save()
    local file = io.open(self._data_path, "w+")
    if file then
        file:write(json.encode(self._data))
        file:close()
    end
	SaveEquipmentMenu:UpdatePreview()
end

function SaveEquipmentMenu:Load()
    local file = io.open(self._data_path, "r")
    if file then
        self._data = json.decode(file:read("*all"))
        file:close()
    end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_SaveEquipmentMenu", function(loc)
    local current_language = nil
    local supported_languages = {
        ["english"] = "en",
        ["german"] = "de",
        ["french"] = "fr",
        ["italian"] = "it",
        ["spanish"] = "es",
        ["russian"] = "ru",
        ["dutch"] = "nl",
        ["swedish"] = "sv"
    }
    for k,v in pairs(supported_languages) do
        if Idstring(k):key() == SystemInfo:language():key() then
            current_language = v
        end
    end

    if current_language then
        local _path = SaveEquipmentMenu._homepath .. "loc/" .. current_language .. ".txt"

        if io.file_is_readable(_path) then
            loc:load_localization_file(SaveEquipmentMenu._homepath .. "loc/" .. current_language .. ".txt")
            loc:load_localization_file(SaveEquipmentMenu._homepath .. "loc/" .. "en.txt", false)
        else
            loc:load_localization_file(SaveEquipmentMenu._homepath .. "loc/" .. "en.txt")
        end
    end
end)

function SaveEquipmentMenu:ShowPreviewMenuItem()
      if not managers.menu_component then
          return
      end
	  
	  local ws = managers.menu_component._ws
      self._panel = ws:panel():panel()

	
	  local _y = 105
	  local _layer = tweak_data.gui.MOUSE_LAYER - 50
	  local _color = Color.white
	  local _blend_mode = "add"
	  local _align = "right"
	  local _halign = "left"
	  
	  
	  self._subtitle_medic_enable = self._panel:text({
        name = "medic_enable",
		text = managers.localization:text("saveequipment_subtitle_medic_enable"),
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.menu.pd2_medium_font_size,
		x = 0,
		y = _y,
		align = _align,
		halign = _halign,
		blend_mode = _blend_mode,
		color = _color,
		layer = _layer,
		wrap = true,
		word_wrap = false
      })
	  
      SaveEquipmentMenu:Save()
end

function SaveEquipmentMenu:EnableNode(node_id, enable)
    local menu = MenuHelper:GetMenu("saveequipment_menu_id")
	if menu then
		local item = menu:item(node_id)
		if item then
			item:set_enabled(enable)
		end
	end
end

function SaveEquipmentMenu:DestroyPreviewMenuItem()
      if alive(self._panel) then

	        self._panel:remove( self._subtitle_medic_enable )
            self._panel:remove( self._panel )

			self._subtitle_medic_enable = nil
            self._panel = nil
			

            SaveEquipmentMenu:Save()
      end
end

function SaveEquipmentMenu:UpdatePreview()
end

Hooks:Add("MenuManagerInitialize", "MenuManagerInitialize_SaveEquipmentMenu", function(menu_manager)

      MenuCallbackHandler.SaveEquipmentMenuChangeFocus = function(node, focus)
            if focus then
                  SaveEquipmentMenu:ShowPreviewMenuItem()
            else
                  SaveEquipmentMenu:DestroyPreviewMenuItem()
            end
      end

	  MenuCallbackHandler.callback_button_saveequipment_help = function(self, item)
		local title = managers.localization:text("saveequipment_help_popup_title")
		local message = managers.localization:text("saveequipment_help_popup_message")
		local menu_options = {}
		menu_options[1] = {
			text = managers.localization:text("saveequipment_help_popup_back"),
			is_cancel_button = true
		}
		local help_menu = QuickMenu:new( title, message, menu_options, true )
      end
	  
	  MenuCallbackHandler.callback_saveequipment_enable_medic_downs = function(self, item)
            SaveEquipmentMenu._data.multi_saveequipment_enable_medic_downs_value = item:value()
			SaveEquipmentMenu:Save()
      end

    SaveEquipmentMenu:Load()

    SaveEquipmentMenuMaker:LoadMenu(SaveEquipmentMenu._path .. "menu_options.txt", SaveEquipmentMenu, SaveEquipmentMenu._data)
end)

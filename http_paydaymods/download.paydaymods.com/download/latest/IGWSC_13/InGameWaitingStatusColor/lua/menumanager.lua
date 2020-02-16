_G.IGWSC = _G.IGWSC or {}
IGWSC._path = ModPath
IGWSC.settings_path = SavePath .. "IGWSC.txt"

function IGWSC:Reset()
	self.settings = {
		dropin_text_value = string.upper(managers.localization:text("debug_loading_level")),
		dropin_color_value = "FFFF99",
		join_text_value = managers.localization:text("menu_waiting_is_joining"),
		join_color_value = "99FFFF",
		ready_text_value = managers.localization:text("menu_waiting_is_ready"),
		ready_color_value = "66FF66",
		unready_text_value = managers.localization:text("menu_waiting_is_not_ready"),
		unready_color_value = "FF3333"
	}
end

function IGWSC:Save()
	local file = io.open( self.settings_path, "w+" )
	if file then
		file:write( json.encode( self.settings ) )
		file:close()
	end
end

function IGWSC:Load()
	local file = io.open( self.settings_path, "r" )
	if file then
		self.settings = json.decode( file:read("*all") )
		file:close()
	else
		IGWSC:Reset()
		IGWSC:Save()
	end
end

function IGWSC:DialogHelp()
	local title = managers.localization:text('igwsc_menu_title')
	local message = managers.localization:text('igwsc_options_info_popup_message_help')
	local menu_options = {}
	menu_options[1] = 
	{
		text = managers.localization:text('igwsc_options_info_popup_close'),
		is_cancel_button = true
	}
	local help_menu = QuickMenu:new(title, message, menu_options, true)
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_IGWSC", function( loc )
	-- Thanks to Lobby Player Info mod and WolfHUD mod for checking the language and load the language
	if file.DirectoryExists(IGWSC._path .. "loc/") then
		local custom_language
		for _, mod in pairs(BLT and BLT.Mods:Mods() or {}) do
			if mod:GetName() == "ChnMod (Patch)" and mod:IsEnabled() then
				custom_language = "chinese"
				break
			elseif mod:GetName() == "PAYDAY 2 THAI LANGUAGE Mod" and mod:IsEnabled() then
				custom_language = "thai"
				break
			end			
		end
		if custom_language then
			loc:load_localization_file(IGWSC._path .. "loc/" .. custom_language ..".json")
		else
			for _, filename in pairs(file.GetFiles(IGWSC._path .. "loc/")) do
				local str = filename:match('^(.*).json$')
				if str and Idstring(str) and Idstring(str):key() == SystemInfo:language():key() then
					loc:load_localization_file(IGWSC._path .. "loc/" .. filename)
					break
				end
			end
		end
	end
	loc:load_localization_file(IGWSC._path .. "loc/english.json", false)
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_IGWSC", function( menu_manager )

	MenuCallbackHandler.IGWSCHelp = function(self, item)
		IGWSC:DialogHelp()
	end

	MenuCallbackHandler.callback_dropin_text_input = function(self, item)
		IGWSC.settings.dropin_text_value = item:value()
		IGWSC:Save()
	end
	MenuCallbackHandler.callback_dropin_color_input = function(self, item)
		IGWSC.settings.dropin_color_value = item:value()
		IGWSC:Save()
	end
	MenuCallbackHandler.callback_join_text_input = function(self, item)
		IGWSC.settings.join_text_value = item:value()
		IGWSC:Save()
	end
	MenuCallbackHandler.callback_join_color_input = function(self, item)
		IGWSC.settings.join_color_value = item:value()
		IGWSC:Save()
	end
	MenuCallbackHandler.callback_ready_text_input = function(self, item)
		IGWSC.settings.ready_text_value = item:value()
		IGWSC:Save()
	end
	MenuCallbackHandler.callback_ready_color_input = function(self, item)
		IGWSC.settings.ready_color_value = item:value()
		IGWSC:Save()
	end
	MenuCallbackHandler.callback_unready_text_input = function(self, item)
		IGWSC.settings.unready_text_value = item:value()
		IGWSC:Save()
	end
	MenuCallbackHandler.callback_unready_color_input = function(self, item)
		IGWSC.settings.unready_color_value = item:value()
		IGWSC:Save()
	end

	MenuCallbackHandler.callback_igwsc_reset = function(self, item)
		IGWSC:Reset()
		MenuHelper:ResetItemsToDefaultValue(item, {["dropin_text_input"] = true}, IGWSC.settings.dropin_text_value)
		MenuHelper:ResetItemsToDefaultValue(item, {["dropin_color_input"] = true}, IGWSC.settings.dropin_color_value)
		MenuHelper:ResetItemsToDefaultValue(item, {["join_text_input"] = true}, IGWSC.settings.join_text_value)
		MenuHelper:ResetItemsToDefaultValue(item, {["join_color_input"] = true}, IGWSC.settings.join_color_value)
		MenuHelper:ResetItemsToDefaultValue(item, {["ready_text_input"] = true}, IGWSC.settings.ready_text_value)
		MenuHelper:ResetItemsToDefaultValue(item, {["ready_color_input"] = true}, IGWSC.settings.ready_color_value)
		MenuHelper:ResetItemsToDefaultValue(item, {["unready_text_input"] = true}, IGWSC.settings.unready_text_value)
		MenuHelper:ResetItemsToDefaultValue(item, {["unready_color_input"] = true}, IGWSC.settings.unready_color_value)
		IGWSC:Save()
	end

	IGWSC:Load()	
	MenuHelper:LoadFromJsonFile( IGWSC._path .. "menu/options.txt", IGWSC, IGWSC.settings )

end )

IGWSC:Load()
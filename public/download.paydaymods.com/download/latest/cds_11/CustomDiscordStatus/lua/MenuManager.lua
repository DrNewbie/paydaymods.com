Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_CustomDiscordStatus", function(lang)
	for _, filename in pairs(file.GetFiles(CustomDiscordStatus._path .. "lang/")) do
		local str = filename:match('^(.*).json$')
		local langid = CustomDiscordStatus:GetOption("lang")
		if str == CustomDiscordStatus._language[langid] then
			lang:load_localization_file(CustomDiscordStatus._path .. "lang/" .. filename)
			log("[CustomDiscordStatus Info] Selected language: " .. str)
			break
		end
    end

	lang:load_localization_file(CustomDiscordStatus._path .. "lang/english.json", false)
    
    if CustomDiscordStatus:GetOption("higher_settings") then
        local loc_path = CustomDiscordStatus._path .. "strings/loc/strings.txt"
        
        lang:load_localization_file(loc_path)
    end
    
end)

Hooks:Add("MenuManagerInitialize", "MenuManagerInitialize_CustomDiscordStatus", function(menu_manager)
    -- Core
    MenuCallbackHandler.callback_lang = function(self, item)
        CustomDiscordStatus._data.lang = item:value()
        CustomDiscordStatus:Save()
    end
    MenuCallbackHandler.callback_custom_strings = function(self, item)
        CustomDiscordStatus._data.custom_strings = (item:value() == "on")
        CustomDiscordStatus:Save()
    end
    MenuCallbackHandler.callback_show_host = function(self, item)
        CustomDiscordStatus._data.show_host = (item:value() == "on")
        CustomDiscordStatus:Save()
    end
    MenuCallbackHandler.callback_show_member = function(self, item)
        CustomDiscordStatus._data.show_member = (item:value() == "on")
        CustomDiscordStatus:Save()
    end
    MenuCallbackHandler.callback_higher_settings = function(self, item)
        CustomDiscordStatus._data.higher_settings = (item:value() == "on")
        CustomDiscordStatus:Save()
    end
    MenuCallbackHandler.callback_show_public_room = function(self, item)
        CustomDiscordStatus._data.show_public_room = (item:value() == "on")
        CustomDiscordStatus:Save()
    end
    MenuCallbackHandler.callback_show_friends_only_room = function(self, item)
        CustomDiscordStatus._data.show_friends_only_room = (item:value() == "on")
        CustomDiscordStatus:Save()
    end
    MenuCallbackHandler.callback_show_private_room = function(self, item)
        CustomDiscordStatus._data.show_private_room = (item:value() == "on")
        CustomDiscordStatus:Save()
    end

    CustomDiscordStatus:Load()
    CustomDiscordStatus:InitAllMenus()
end)
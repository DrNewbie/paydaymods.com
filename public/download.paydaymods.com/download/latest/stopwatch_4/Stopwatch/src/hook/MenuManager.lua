local Settings = _G.StopwatchMod.Settings
local Util = _G.StopwatchMod.Util
local Mod = _G.StopwatchMod.Mod
local Records = _G.StopwatchMod.Records

Hooks:Add("MenuManagerInitialize", "Stopwatch_MenuManagerInitialize", function(_menu_manager)
    MenuCallbackHandler.callback_is_active = function(_self, item)
        Settings:set("is_active", (item:value() == "on" and true or false))
		Settings:store()
	end

    MenuCallbackHandler.callback_disable_chat = function(_self, item)
        Settings:set("disable_chat", (item:value() == "on" and true or false))
		Settings:store()
	end

	MenuCallbackHandler.callback_init_record_color = function(_self, item)
	    Settings:set("init_record_color", item:value())
		Settings:store()
	end

	MenuCallbackHandler.callback_new_record_color = function(_self, item)
		Settings:set("new_record_color", item:value())
		Settings:store()
	end

	MenuCallbackHandler.callback_old_record_color = function(_self, item)
		Settings:set("old_record_color", item:value())
		Settings:store()
	end

	MenuCallbackHandler.callback_equal_record_color = function(_self, item)
		Settings:set("equal_record_color", item:value())
		Settings:store()
	end

	MenuCallbackHandler.callback_btn_reset = function(_self, _item)
		local menu_title = Util.localize("stopwatch_msg_reset_title")
		local menu_message = Util.localize("stopwatch_msg_reset_message")
		local menu_options = {
			[1] = {
				text = Util.localize("stopwatch_msg_reset_btn_ok"),
				callback = MenuCallbackHandler.callback_msg_reset,
			},
			[2] = {
				text = Util.localize("stopwatch_msg_reset_btn_cancel"),
				is_cancel_button = true,
			},
		}
		local menu = QuickMenu:new(menu_title, menu_message, menu_options)
		menu:show()
	end

	MenuCallbackHandler.callback_msg_reset = function(_self, _item)
		Records:reset()
		Records:store()
    end

    MenuHelper:LoadFromJsonFile(Mod.MENU_PATH .. "/main.json", Settings, Settings.data)
end)
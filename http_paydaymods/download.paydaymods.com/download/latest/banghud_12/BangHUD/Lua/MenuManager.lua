
Hooks:Add("MenuManagerInitialize", "MenuManagerInitialize_BangHUD", function(menu_manager)

	function MenuCallbackHandler:banghud_menu_callback(item)
		local optionName = item._parameters.name
		if item._type == "toggle" then
			BangHUD._data[optionName] = (item:value() == "on")
		else
			BangHUD._data[optionName] = item:value()
		end
		BangHUD:OptionChanged()
	end

	BangHUD:Load()
	MenuHelper:LoadFromJsonFile(BangHUD._path .. "Menu/menu.json", BangHUD, BangHUD._data)
end)

_G.CustomLaser = _G.CustomLaser or {}
CustomLaser._path = ModPath
CustomLaser.settings_path = SavePath .. "custom_lasers.txt"

function CustomLaser:Reset()
	self.settings = {
	fab_value = false,
	slider_r_value = 0.2,
	slider_g_value = 1,
	slider_b_value = 0.2,
	slider_a_value = 0.25,
	slider_sniper_r_value = 0.7,
	slider_sniper_g_value = 0,
	slider_sniper_b_value = 0,
	slider_sniper_a_value = 0.5,
}

end

function CustomLaser:Save()
	local file = io.open( self.settings_path, "w+" )
	if file then
		file:write( json.encode( self.settings ) )
		file:close()
	end
end
function CustomLaser:Load()
	local file = io.open( self.settings_path, "r" )
	if file then
		self.settings = json.decode( file:read("*all") )
		file:close()
	else
		CustomLaser:Reset()
		CustomLaser:Save()
	end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_CustomLaser", function( loc )
	loc:load_localization_file( CustomLaser._path .. "en.txt")
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_CustomLaser", function( menu_manager )

	MenuCallbackHandler.callback_fab_toggle = function(self, item)
		CustomLaser.settings.fab_value = (item:value() == "on" and true or false)
		CustomLaser:Save()
	end

	MenuCallbackHandler.callback_laser_r_slider = function(self, item)
		CustomLaser.settings.slider_r_value = item:value()
		CustomLaser:Save()
	end
	MenuCallbackHandler.callback_laser_g_slider = function(self, item)
		CustomLaser.settings.slider_g_value = item:value()
		CustomLaser:Save()
	end
	MenuCallbackHandler.callback_laser_b_slider = function(self, item)
		CustomLaser.settings.slider_b_value = item:value()
		CustomLaser:Save()
	end
	MenuCallbackHandler.callback_laser_a_slider = function(self, item)
		CustomLaser.settings.slider_a_value = item:value()
		CustomLaser:Save()
	end
	MenuCallbackHandler.callback_laser_sniper_r_slider = function(self, item)
		CustomLaser.settings.slider_sniper_r_value = item:value()
		CustomLaser:Save()
	end
	MenuCallbackHandler.callback_laser_sniper_g_slider = function(self, item)
		CustomLaser.settings.slider_sniper_g_value = item:value()
		CustomLaser:Save()
	end
	MenuCallbackHandler.callback_laser_sniper_b_slider = function(self, item)
		CustomLaser.settings.slider_sniper_b_value = item:value()
		CustomLaser:Save()
	end
	MenuCallbackHandler.callback_laser_sniper_a_slider = function(self, item)
		CustomLaser.settings.slider_sniper_a_value = item:value()
		CustomLaser:Save()
	end

	MenuCallbackHandler.CustomLaserReset = function(self, item)
		CustomLaser:Reset()
		MenuHelper:ResetItemsToDefaultValue(item, {["fab_toggle"] = true}, CustomLaser.settings.fab_value)
		MenuHelper:ResetItemsToDefaultValue(item, {["custom_laser_r_menu_slider"] = true}, CustomLaser.settings.slider_r_value)
		MenuHelper:ResetItemsToDefaultValue(item, {["custom_laser_g_menu_slider"] = true}, CustomLaser.settings.slider_g_value)
		MenuHelper:ResetItemsToDefaultValue(item, {["custom_laser_b_menu_slider"] = true}, CustomLaser.settings.slider_b_value)
		MenuHelper:ResetItemsToDefaultValue(item, {["custom_laser_a_menu_slider"] = true}, CustomLaser.settings.slider_a_value)
		MenuHelper:ResetItemsToDefaultValue(item, {["custom_laser_sniper_r_menu_slider"] = true}, CustomLaser.settings.slider_sniper_r_value)
		MenuHelper:ResetItemsToDefaultValue(item, {["custom_laser_sniper_g_menu_slider"] = true}, CustomLaser.settings.slider_sniper_g_value)
		MenuHelper:ResetItemsToDefaultValue(item, {["custom_laser_sniper_b_menu_slider"] = true}, CustomLaser.settings.slider_sniper_b_value)
		MenuHelper:ResetItemsToDefaultValue(item, {["custom_laser_sniper_a_menu_slider"] = true}, CustomLaser.settings.slider_sniper_a_value)
		CustomLaser:Save()
	end

	CustomLaser:Load()	
	MenuHelper:LoadFromJsonFile( CustomLaser._path .. "options.txt", CustomLaser, CustomLaser.settings )

end )
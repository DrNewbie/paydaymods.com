
--[[
	We setup the global table for our mod, along with some path variables, and a data table.
	We cache the ModPath directory, so that when our hooks are called, we aren't using the ModPath from a
		different mod.
]]
_G.BWROptions = _G.BWROptions or {}
BWROptions._path = ModPath
BWROptions._data_path = SavePath .. "bwr_config.txt"
BWROptions._data = {} 

--[[
	A simple save function that json encodes our _data table and saves it to a file.
]]
function BWROptions:Save()
	local file = io.open( self._data_path, "w+" )
	if file then
		file:write( json.encode( self._data ) )
		file:close()
	end
end

--[[
	A simple load function that decodes the saved json _data table if it exists.
]]
function BWROptions:Load()
	local file = io.open( self._data_path, "r" )
	if file then
		self._data = json.decode( file:read("*all") )
		file:close()
	end
end

--[[
	Load our localization keys for our menu, and menu items.
]]
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_BWROptions", function( loc )
	loc:load_localization_file( BWROptions._path .. "Menu/en.txt")
end)

--[[
	Setup our menu callbacks, load our saved data, and build the menu from our json file.
]]
Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_BWROptions", function( menu_manager )

	--[[
		Setup our callbacks as defined in our item callback keys, and perform our logic on the data retrieved.
	]]
	MenuCallbackHandler.callback_wr_autocard_tog = function(self, item)
		BWROptions._data.autocard = (item:value() == "on" and true or false)
		BWROptions:Save()
	end
	MenuCallbackHandler.callback_wr_skipscreen_tog = function(self, item)
		BWROptions._data.skipscreen = (item:value() == "on" and true or false)
		BWROptions:Save()
	end
	MenuCallbackHandler.callback_wr_skipscreen_stats_tog = function(self, item)
		BWROptions._data.skipscreen_stats = (item:value() == "on" and true or false)
		BWROptions:Save()
	end
	MenuCallbackHandler.callback_wr_stats_delay = function(self, item)
		BWROptions._data.stats_delay = item:value()
		BWROptions:Save()
	end
	MenuCallbackHandler.callback_wr_skipscreen_loot_tog = function(self, item)
		BWROptions._data.skipscreen_loot = (item:value() == "on" and true or false)
		BWROptions:Save()
	end
	MenuCallbackHandler.callback_wr_loot_delay = function(self, item)
		BWROptions._data.loot_delay = item:value()
		BWROptions:Save()
	end
	MenuCallbackHandler.callback_bubble = function(self, item)
		BWROptions._data.bubble = item:value()
		BWROptions:Save()
	end
	MenuCallbackHandler.callback_pacified = function(self, item)
		BWROptions._data.pacified = item:value()
		BWROptions:Save()
	end
	MenuCallbackHandler.callback_utils_pagers = function(self, item)
		BWROptions._data.utils_pagers = item:value()
		BWROptions:Save()
	end
	MenuCallbackHandler.callback_utils_enemies = function(self, item)
		BWROptions._data.utils_enemies = item:value()
		BWROptions:Save()
	end
	MenuCallbackHandler.callback_utils_converts = function(self, item)
		BWROptions._data.utils_converts = item:value()
		BWROptions:Save()
	end
	MenuCallbackHandler.callback_utils_packages = function(self, item)
		BWROptions._data.utils_packages = item:value()
		BWROptions:Save()
	end
	
	MenuCallbackHandler.callback_reset_options = function(self, item)
		--[[local items_to_reset_true = {

		}
		local default_value_true = true]]
		
		local items_to_reset_false = {
			["wr_autocard_toggle"] = true,
			["wr_skipscreen_toggle"] = true,
			["wr_skipscreen_stats_toggle"] = true,
			["wr_skipscreen_loot_toggle"] = true,
			["utils_pagers"] = true,
			["utils_enemies"] = true,
			["utils_converts"] = true,
			["utils_packages"] = true,
		}
		local default_value_false = false
		
		local slider_stat = {
			["wr_stats_delay"] = true,
		}
		local slider_stat_value = 3
		
		local slider_loot = {
			["wr_loot_delay"] = true,
		}
		local slider_loot_value = 5
		
		--MenuHelper:ResetItemsToDefaultValue( item, items_to_reset_true, default_value_true )
		MenuHelper:ResetItemsToDefaultValue( item, items_to_reset_false, default_value_false )
		MenuHelper:ResetItemsToDefaultValue( item, slider_stats, slider_stat_value )
		MenuHelper:ResetItemsToDefaultValue( item, slider_loot, slider_loot_value )
		log("Settings reset!")
	end
	
	MenuCallbackHandler.callback_test_multi = function(self, item)
		BWROptions._data.multi_value = item:value()
		BWROptions:Save()
		log("Multiple-choice value: " .. item:value())
	end

	--[[
		Load our previously saved data from our save file.
	]]
	BWROptions:Load()

	--[[
		Load our menu json file and pass it to our MenuHelper so that it can build our in-game menu for us.
		We pass our parent mod table as the second argument so that any keybind functions can be found and called
			as necessary.
		We also pass our data table as the third argument so that our saved values can be loaded from it.
	]]
	MenuHelper:LoadFromJsonFile( BWROptions._path .. "Menu/bodhis_war_repair.txt", BWROptions, BWROptions._data )

end )

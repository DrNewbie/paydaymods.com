
--[[
	We setup the global table for our mod, along with some path variables, and a data table.
	We cache the ModPath directory, so that when our hooks are called, we aren't using the ModPath from a
		different mod.
]]
mod_collection = mod_collection or {}
mod_collection._path = ModPath
mod_collection._data_path = SavePath .. "mod_collection.txt"
mod_collection._data = {} 

--[[
	A simple save function that json encodes our _data table and saves it to a file.
]]
function mod_collection:Save()
	local file = io.open( self._data_path, "w+" )
	if file then
		file:write( json.encode( self._data ) )
		file:close()
	end
end

--[[
	A simple load function that decodes the saved json _data table if it exists.
]]
function mod_collection:Load()
	local file = io.open( self._data_path, "r" )
	if file then
		self._data = json.decode( file:read("*all") )
		file:close()
	else
	log("No previous save found. Creating new using default values")
	local default_file = io.open(self._path .."Menu/default_values.txt")
		if default_file then
			self._data = json.decode( default_file:read("*all") )
			self:Save()
		end
	end
end

if not mod_collection.setup then
	mod_collection:Load()
	mod_collection.setup = true
	log("Mod Collection loaded")
end

--[[
	Load our localization keys for our menu, and menu items.
]]
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_dynamic_hud", function( loc )
	loc:load_localization_file( mod_collection._path .. "Menu/en.txt")
end)

--[[
	Setup our menu callbacks, load our saved data, and build the menu from our json file.
]]
Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_dynamic_hud", function( menu_manager )

	--[[
		Setup our callbacks as defined in our item callback keys, and perform our logic on the data retrieved.
	]]

	MenuCallbackHandler.callback_show_timers = function(self, item)
		mod_collection._data.show_timers = (item:value() =="on")
		mod_collection:Save()
	end

	MenuCallbackHandler.callback_show_equipment = function(self, item)
		mod_collection._data.show_equipment = (item:value() =="on")
		mod_collection:Save()
	end

	MenuCallbackHandler.callback_show_minions = function(self, item)
		mod_collection._data.show_minions = (item:value() =="on")
		mod_collection:Save()
	end	

	MenuCallbackHandler.callback_show_pagers = function(self, item)
		mod_collection._data.show_pagers = (item:value() =="on")
		mod_collection:Save()
	end	

	MenuCallbackHandler.callback_remove_answered_pager_contour = function(self, item)
		mod_collection._data.remove_answered_pager_contour = (item:value() =="on")
		mod_collection:Save()
	end

	MenuCallbackHandler.callback_show_ecms = function(self, item)
		mod_collection._data.show_ecms = (item:value() =="on")
		mod_collection:Save()
	end	

	MenuCallbackHandler.callback_show_enemies = function(self, item)
		mod_collection._data.show_enemies = (item:value() =="on")
		mod_collection:Save()
	end	

	MenuCallbackHandler.callback_aggregate_enemies = function(self, item)
		mod_collection._data.aggregate_enemies = (item:value() =="on")
		mod_collection:Save()
	end	

	MenuCallbackHandler.callback_show_civilians = function(self, item)
		mod_collection._data.show_civilians = (item:value() =="on")
		mod_collection:Save()
	end	

	MenuCallbackHandler.callback_show_hostages = function(self, item)
		mod_collection._data.show_hostages = (item:value() =="on")
		mod_collection:Save()
	end	

	MenuCallbackHandler.callback_show_pager_count = function(self, item)
		mod_collection._data.show_pager_count = (item:value() =="on")
		mod_collection:Save()
	end	

	MenuCallbackHandler.callback_show_loot = function(self, item)
		mod_collection._data.show_loot = (item:value() =="on")
		mod_collection:Save()
	end	

	MenuCallbackHandler.callback_aggregate_loot = function(self, item)
		mod_collection._data.aggregate_loot = (item:value() =="on")
		mod_collection:Save()
	end	

	MenuCallbackHandler.callback_separate_bagged_loot = function(self, item)
		mod_collection._data.separate_bagged_loot = (item:value() =="on")
		mod_collection:Save()
	end	

	MenuCallbackHandler.callback_show_special_pickups = function(self, item)
		mod_collection._data.show_special_pickups = (item:value() =="on")
		mod_collection:Save()
	end	

	MenuCallbackHandler.callback_show_buffs = function(self, item)
		mod_collection._data.show_buffs = (item:value() =="on")
		mod_collection:Save()
	end	

	MenuCallbackHandler.callback_hide_chat_after = function(self, item)
		mod_collection._data.hide_chat_after = item:value()
		mod_collection:Save()
	end

	MenuCallbackHandler.callback_show_special_kills = function(self, item)
		mod_collection._data.show_special_kills = (item:value() =="on")
		mod_collection:Save()
	end	

	MenuCallbackHandler.callback_show_headshot_kills = function(self, item)
		mod_collection._data.show_headshot_kills = (item:value() =="on")
		mod_collection:Save()
	end	

	MenuCallbackHandler.callback_show_ai_kills = function(self, item)
		mod_collection._data.show_ai_kills = (item:value() =="on")
		mod_collection:Save()
	end	

	MenuCallbackHandler.callback_flashlight_range = function(self, item)
		mod_collection._data.flashlight_range = item:value()
		mod_collection:Save()
	end	

	MenuCallbackHandler.callback_flashlight_angle = function(self, item)
		mod_collection._data.flashlight_angle = item:value()
		mod_collection:Save()
	end	

	MenuCallbackHandler.callback_enable_kill_counter = function(self, item)
		mod_collection._data.enable_kill_counter = (item:value() =="on")
		mod_collection:Save()
	end	
	
    MenuCallbackHandler.callback_do_decapitations = function(self, item)
		mod_collection._data.do_decapitations = (item:value() =="on")
		mod_collection:Save()
	end
    
	MenuCallbackHandler.callback_enable_flashlight_extender = function(self, item)
		mod_collection._data.enable_flashlight_extender = (item:value() =="on")
		mod_collection:Save()
	end

	MenuCallbackHandler.callback_enable_minimap = function(self, item)
		mod_collection._data.enable_minimap = (item:value() =="on")
		mod_collection:Save()
	end

	MenuCallbackHandler.callback_enable_pacified = function(self, item)
		mod_collection._data.enable_pacified = (item:value() =="on")
		mod_collection:Save()
	end

	MenuCallbackHandler.callback_enable_speed_up = function(self, item)
		mod_collection._data.enable_speed_up = (item:value() =="on")
		mod_collection:Save()
	end

	MenuCallbackHandler.callback_black_screen_skip = function(self, item)
		mod_collection._data.black_screen_skip = (item:value() =="on")
		mod_collection:Save()
	end

	MenuCallbackHandler.callback_loot_screen_skip_enabled = function(self, item)
		mod_collection._data.loot_screen_skip_enabled = (item:value() =="on")
		mod_collection:Save()
	end
	
	MenuCallbackHandler.callback_loot_screen_skip = function(self, item)
		mod_collection._data.loot_screen_skip = item:value()
		mod_collection:Save()
	end

	MenuCallbackHandler.callback_stat_screen_skip_enabled = function(self, item)
		mod_collection._data.stat_screen_skip_enabled = item:value()
		mod_collection:Save()
	end
	
	MenuCallbackHandler.callback_stat_screen_skip = function(self, item)
		mod_collection._data.stat_screen_skip = item:value()
		mod_collection:Save()
	end

	MenuCallbackHandler.callback_enable_filtersettings = function(self, item)
		mod_collection._data.enable_filtersettings = item:value()
		mod_collection:Save()
	end
	--[[
		Load our previously saved data from our save file.
	]]
	mod_collection:Load()

	--[[
		Load our menu json file and pass it to our MenuHelper so that it can build our in-game menu for us.
		We pass our parent mod table as the second argument so that any keybind functions can be found and called
			as necessary.
		We also pass our data table as the third argument so that our saved values can be loaded from it.
	]]
	MenuHelper:LoadFromJsonFile( mod_collection._path .. "Menu/mod_collection.txt", mod_collection, mod_collection._data )
	MenuHelper:LoadFromJsonFile( mod_collection._path .. "Menu/dynamic_hud.txt", mod_collection, mod_collection._data )
	MenuHelper:LoadFromJsonFile( mod_collection._path .. "Menu/kill_counter.txt", mod_collection, mod_collection._data )
	MenuHelper:LoadFromJsonFile( mod_collection._path .. "Menu/custom_hud.txt", mod_collection, mod_collection._data )
	MenuHelper:LoadFromJsonFile( mod_collection._path .. "Menu/flashlight_extender.txt", mod_collection, mod_collection._data )
	MenuHelper:LoadFromJsonFile( mod_collection._path .. "Menu/pacified_civilians.txt", mod_collection, mod_collection._data )
	MenuHelper:LoadFromJsonFile( mod_collection._path .. "Menu/filtersettings.txt", mod_collection, mod_collection._data )
	MenuHelper:LoadFromJsonFile( mod_collection._path .. "Menu/minimap.txt", mod_collection, mod_collection._data )
	MenuHelper:LoadFromJsonFile( mod_collection._path .. "Menu/speed_up.txt", mod_collection, mod_collection._data )

end )

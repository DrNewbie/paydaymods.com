

_G.MiniMap = _G.MiniMap or {}
MiniMap._path = ModPath
MiniMap._data_path = ModPath .. "saved_vlx_data.txt"
MiniMap._data = {}

function MiniMap:Save()
	local file = io.open( self._data_path, "w+" )
	if file then
		file:write( json.encode( self._data ) )
		file:close()
	end
end

function MiniMap:Load()
	local file = io.open( self._data_path, "r" )
	if file then
		self._data = json.decode( file:read("*all") )
		file:close()
	end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_MiniMap", function( loc )
	loc:load_localization_file( MiniMap._path .. "loc.en.txt")
end)

Hooks:Add("MenuManagerInitialize", "MenuManagerInitialize_MiniMap", function( menu_manager )
	MenuCallbackHandler.callback_mm_toggle = function(self, item)
		MiniMap._data.mm_value = item:value() == "on" and true or false
		MiniMap:Save()
		log("Toggle is: " .. item:value())
	end
	
	MenuCallbackHandler.callback_mm_rotate = function(self, item)
		MiniMap._data.mm_rotate_value = item:value() == "on" and true or false
		MiniMap:Save()
		log("rotate is: " .. item:value())
	end
	
	MenuCallbackHandler.callback_mm_stealth_only = function(self, item)
		MiniMap._data.mm_stealth_only_value = item:value() == "on" and true or false
		MiniMap:Save()
		log("stealth only is: " .. item:value())
	end
	
	MenuCallbackHandler.callback_mm_zoom = function(self, item)
		MiniMap._data.mm_zoom_value = item:value()
		MiniMap:Save()
		log("zoom value: " .. item:value())
	end
	
	MiniMap:Load()
	
	MenuHelper:LoadFromJsonFile( MiniMap._path .. "menu/menu.json", MiniMap, MiniMap._data )
	
end )
--[[ RealNames ]]

if not _G.RealNames then
	_G.RealNames = _G.RealNames or {}
end
RealNames._path = ModPath
RealNames._data_path = SavePath .. "RealNames_opt.txt"
RealNames._data = {}
RealNames.Hooks = {
	["lib/managers/localizationmanager"] = "lua/post/realnames.lua"
}

function RealNames:Save()
	local file = io.open( self._data_path, "w" )
	if file then
		file:write( json.encode( self._data ) )
		file:close()
	end
end
function RealNames:Load()
	local file = io.open( self._data_path, "r" )
	if file then
		self._data = json.decode( file:read("*all") )
		file:close()
	end
end

RealNames:Load()
Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_RealNames", function( menu_manager )
	MenuCallbackHandler.RealNamesStringsNames = function(self, item)
		RealNames._data.reelnames = (item:value() == "on" and true or false)
		RealNames:Save()
	end
	
	MenuCallbackHandler.RealNamesStringsUpotte = function(self, item)
		RealNames._data.upotte = (item:value() == "on" and true or false)
		RealNames:Save()
	end
	MenuCallbackHandler.RealNamesStringsOcelot = function(self, item)
		RealNames._data.ocelot = (item:value() == "on" and true or false)
		RealNames:Save()
	end
	
	RealNames:Load()
	MenuHelper:LoadFromJsonFile( RealNames._path .. "options/strings.txt", RealNames, RealNames._data )
end )

function RealNames:ResetOptions()
	self._data.reelnames = true
	self._data.upotte = false
	self._data.ocelot = false
	
	RealNames:Save()
end


if RealNames._data.reelnames == nil
or RealNames._data.upotte == nil
or RealNames._data.ocelot == nil
then 
	RealNames:ResetOptions() 
end

if RequiredScript then
    local script = RequiredScript:lower()
    if RealNames.Hooks[script] then
        dofile(RealNames._path .. RealNames.Hooks[script])
    end
end

_G.MeleeOverhaul = _G.MeleeOverhaul or {}

MeleeOverhaul.ModPath = ModPath
MeleeOverhaul.SavePath = SavePath .. "MeleeOverhaulOptions.txt"
MeleeOverhaul.Options = MeleeOverhaul.Options or {}
MeleeOverhaul.Menu = "MeleeOverhaulMainMenu"

dofile( MeleeOverhaul.ModPath .. "lua/options.lua" )

local HookFiles = {

	[ "lib/managers/dynamicresourcemanager" ] 				= "lua/dynamicresourcemanager.lua",
	[ "lib/managers/menu/blackmarketgui" ] 					= "lua/blackmarketgui.lua",
	[ "lib/managers/statisticsmanager" ] 					= "lua/statisticsmanager.lua",
	[ "lib/network/matchmaking/networkaccountsteam" ] 		= "lua/networkaccountsteam.lua",
	[ "lib/tweak_data/blackmarket/meleeweaponstweakdata" ] 	= "lua/meleeweaponstweakdata.lua",
	[ "lib/units/beings/player/states/playerstandard" ] 	= "lua/playerstandard.lua",
	[ "lib/units/cameras/fpcameraplayerbase" ] 				= "lua/fpcameraplayerbase.lua",
	[ "lib/units/enemies/cop/copdamage" ] 					= "lua/copdamage.lua",
	[ "lib/units/enemies/cop/copmovement" ] 				= "lua/copmovement.lua"
	
}

function MeleeOverhaul:Save()

	local data = io.open( self.SavePath , "w+" )
	
	if data then
		data:write( json.encode( self.Options ) )
		data:close()
	end
	
end

function MeleeOverhaul:Load()

	local data = io.open( self.SavePath , "r" )
	
	if data then
		self.Options = json.decode( data:read( "*all" ) )
		data:close()
	end
	
end

function MeleeOverhaul:DefaultSettings()

	for k , v in pairs( MeleeOverhaul.MenuOptions.Toggle ) do
		if self:HasSetting( k ) == nil then MeleeOverhaul.Options[ k ] = v[ 4 ] end
	end
	for k , v in pairs( MeleeOverhaul.MenuOptions.Slider ) do
		if self:HasSetting( k ) == nil then MeleeOverhaul.Options[ k ] = v[ 7 ] end
	end
	for k , v in pairs( MeleeOverhaul.MenuOptions.MultipleChoice ) do
		if self:HasSetting( k ) == nil then MeleeOverhaul.Options[ k ] = v[ 5 ] end
	end
	
	self:Save()

end

function MeleeOverhaul:HasSetting( s )

	return MeleeOverhaul.Options[ s ]
	
end

MeleeOverhaul:Load()
MeleeOverhaul:DefaultSettings()

function MeleeOverhaul:MeleeType( m )

	for k , v in ipairs( MeleeOverhaul.BluntWeapons ) do
		if m == v then return "Blunt" end
	end
	for k , v in ipairs( MeleeOverhaul.SmallBladedWeapons ) do
		if m == v then return "SmallBladed" end
	end
	return "LargeBladed"

end

Hooks:Add( "MenuManagerSetupCustomMenus" , "MeleeOverhaulMenuManagerPostSetupCustomMenus" , function( self , nodes )
    
	MenuHelper:NewMenu( MeleeOverhaul.Menu )
	
	for k , v in pairs( MeleeOverhaul.MenuOptions.Menu ) do
		MenuHelper:NewMenu( k )
	end
	
end )

Hooks:Add( "LocalizationManagerPostInit" , "MeleeOverhaulLocalizationManagerPostInit" , function( self )

	self:load_localization_file( MeleeOverhaul.ModPath .. "loc/english.txt" )
	
	for _ , file in pairs( file.GetFiles( MeleeOverhaul.ModPath .. "loc/" ) ) do
		local loc = file:match( '^(.*).txt$' )
		
		if loc and Idstring( loc ) and Idstring( loc ):key() == SystemInfo:language():key() then
			self:load_localization_file( MeleeOverhaul.ModPath .. "loc/" .. file )
		end
	end

end )

Hooks:Add( "MenuManagerInitialize" , "MeleeOverhaulMenuManagerPostInit" , function( self )

	MenuCallbackHandler.MeleeOverhaulMenuMOTDFocus = function( self , focus )
		if focus and MeleeOverhaul:HasSetting( "MessageOfTheDay" ) then
			MeleeOverhaul:ShowMessageOfTheDay()
		else
			MeleeOverhaul:DestroyMessageOfTheDay()
		end
	end
	
	MenuCallbackHandler.MeleeOverhaulMenuStatisticsFocus = function( self , focus )
		if focus then
			MeleeOverhaul:ShowStatistics()
		else
			MeleeOverhaul:DestroyStatistics()
		end
	end
		
end )

Hooks:Add( "MenuManagerBuildCustomMenus" , "MeleeOverhaulMenuManagerPostBuildCustomMenus" , function( self , nodes )
	
	nodes[ MeleeOverhaul.Menu ] = MenuHelper:BuildMenu( MeleeOverhaul.Menu , { focus_changed_callback = "MeleeOverhaulMenuMOTDFocus" } )
    MenuHelper:AddMenuItem( MenuHelper.menus.lua_mod_options_menu , MeleeOverhaul.Menu , "more_options_menu_title" , "more_options_menu_desc" )
	
	for k , v in pairs( MeleeOverhaul.MenuOptions.Menu ) do	
		nodes[ k ] = MenuHelper:BuildMenu( k , v[ 4 ] )
		MenuHelper:AddMenuItem( nodes[ MeleeOverhaul.Menu ] , k , v[ 1 ] , v[ 2 ] , v[ 3 ] )
	end
	
end )

Hooks:Add( "MenuManagerPopulateCustomMenus" , "MeleeOverhaulMenuManagerPostPopulateCustomMenus" , function( self , nodes )

	MenuCallbackHandler.MeleeOverhaulMainMenuButtonCallback = function( self ) end
	
	MenuHelper:AddButton({
		id 			= "MeleeOverhaulMainMenuButton",
		title 		= "",
		desc 		= "",
		callback 	= "MeleeOverhaulMainMenuButtonCallback",
		menu_id 	= "MeleeOverhaulMainMenu",
		localized 	= false
	})
	
	MenuHelper:AddButton({
		id 			= "MeleeOverhaulStatisticsMenuButton",
		title 		= "",
		desc 		= "",
		callback 	= "MeleeOverhaulMainMenuButtonCallback",
		menu_id 	= "MeleeOverhaulMenuStatistics",
		localized 	= false
	})
	
	for k , v in pairs( MeleeOverhaul.MenuOptions.Toggle ) do
	
		MenuCallbackHandler[ k .. "Toggle" ] = function( self , item )
			MeleeOverhaul.Options[ k ] = item:value() == "on" or false
			MeleeOverhaul:Save()
		end
		
		MenuHelper:AddToggle({
			id 			= "ID" .. k .. "Toggle",
			title 		= v[ 2 ],
			desc 		= v[ 3 ],
			callback 	= k .. "Toggle",
			menu_id 	= v[ 1 ],
			value 		= MeleeOverhaul.Options[ k ]
		})
		
	end
	
	for k , v in pairs( MeleeOverhaul.MenuOptions.Slider ) do
	
		MenuCallbackHandler[ k .. "Slider" ] = function( self , item )
			MeleeOverhaul.Options[ k ] = item:value()
			MeleeOverhaul:Save()
		end
		
		MenuHelper:AddSlider({
			id 			= "ID" .. k .. "Slider",
			title 		= v[ 2 ],
			desc 		= v[ 3 ],
			callback 	= k .. "Slider",
			value 		= MeleeOverhaul.Options[ k ],
			min 		= v[ 4 ],
			max 		= v[ 5 ],
			step 		= v[ 6 ],
			show_value 	= true,
			menu_id 	= v[ 1 ]
		})
		
	end
	
	for k , v in pairs( MeleeOverhaul.MenuOptions.MultipleChoice ) do
		
		local function returnTable( e )
			local t = {}
			for a , b in ipairs( e ) do
				table.insert( t , b[ 1 ] )
			end
			return t
		end
		
		MenuCallbackHandler[ k .. "MultipleChoice" ] = function( self , item )
			MeleeOverhaul.Options[ k ] = item:value()
			MeleeOverhaul:Save()
		end
		
		MenuHelper:AddMultipleChoice({
			id 			= "ID" .. k .. "MultipleChoice",
			title 		= v[ 2 ],
			desc 		= v[ 3 ],
			callback 	= k .. "MultipleChoice",
			items 		= returnTable( v[ 4 ] ),
			value 		= MeleeOverhaul.Options[ k ],
			menu_id 	= v[ 1 ]
		})
	
	end

end )

Hooks:Add( "MenuManagerOnOpenMenu" , "MeleeOverhaulMenuManagerPostOnOpenMenu" , function( self , menu , position )

	Steam:http_request( "http://steamcommunity.com/groups/PD2_MORE/discussions/1/360672137533017262/" , function( success , page )
		if success and page:match( '||@||(.-)||@||' ) then
			MeleeOverhaul.MOTD = page:match( '||@||(.-)||@||' ):gsub( "<br>" , "\n" )
		end
	end )

end )

if RequiredScript then

	local requiredScript = RequiredScript:lower()
	
	if HookFiles[ requiredScript ] then
		dofile( MeleeOverhaul.ModPath .. HookFiles[ requiredScript ] )
	end
	
end
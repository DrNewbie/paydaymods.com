_G.YOMC = _G.YOMC or {}
YOMC._path = ModPath
YOMC._version = "1.47.1"
YOMC._game_Version = Application:version()
YOMC._data_path = SavePath.. "YOMCMenuConfig.txt"
YOMC._data = {}
YOMC._Hooks = {
		["lib/managers/mission/elementmissionend"] = "lua/YOMC/YOMCBase.lua",
		["lib/units/weapons/raycastweaponbase"] = "lua/YOMC/YOMCBase.lua",
		["lib/units/weapons/newraycastweaponbase"] = "lua/YOMC/YOMCBase.lua",
		["lib/managers/blackmarketmanager"] = "lua/YOMC/YOMCBase.lua",
		["lib/managers/menu/blackmarketgui"] = "lua/YOMC/YOMCBase.lua",
		["lib/units/beings/player/states/playerstandard"] = "lua/YOMC/YOMCBase.lua",
		["lib/units/weapons/akimboweaponbase"] = "lua/YOMC/YOMCBase.lua",
		["lib/managers/hudmanagerpd2"] = "lua/YOMC/YOMCBase.lua",
		["lib/managers/hud/hudteammate"] = "lua/YOMC/YOMCBase.lua",
		["lib/units/weapons/shotgun/newshotgunbase"] = "lua/YOMC/YOMCBase.lua"
	}
YOMC._Hooks_Classic = {
		["lib/managers/weaponfactorymanager"] = "lua/YOMC/YOMCMods.lua",
		["lib/tweak_data/weapontweakdata"] = "lua/YOMC/YOMCWeapons.lua",
		["lib/tweak_data/upgradestweakdata"] = "lua/YOMC/YOMCSkills.lua",
		["lib/tweak_data/tweakdata"] = "lua/YOMC/YOMCProjectiles.lua"
	}
--[[
YOMC._Hooks_Realism = {
		["lib/tweak_data/weaponfactorytweakdata"] = "lua/YOMCR/YOMCRMods.lua",
		["lib/tweak_data/weapontweakdata"] = "lua/YOMCR/YOMCRWeapons.lua",
		["lib/tweak_data/upgradestweakdata"] = "lua/YOMCR/YOMCRSkills.lua",
		["lib/tweak_data/tweakdata"] = "lua/YOMCR/YOMCRProjectiles.lua"
	}
]]--

-- Removing outdated files
os.remove( "mods/YOMC/menu/YOMCMenuConfig.txt" )
os.remove( "mods/YOMC/lua/DMC/DMCTactReload.lua" )
os.remove( "mods/YOMC/lua/YOMC/YOMCIntro.lua" )
os.remove( "mods/YOMC/lua/YOMC/YOMCFSkins.lua" )
os.remove( "mods/YOMC/lua/LazyOzzy/LOBurstfire.lua" )


Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_YOMC", function(loc)
	loc:load_localization_file(YOMC._path .. "loc/YOMC_en.txt")
	--[[
	if YOMC._data.Balance == 1 then
		loc:load_localization_file(YOMC._path .. "loc/YOMC_en.txt")
	elseif YOMC._data.Balance == 2 then
		loc:load_localization_file(YOMC._path .. "loc/YOMCR_en.txt")
	end
	]]--
end)

function YOMC:LoadMenu()
	local file = io.open( self._data_path, "r" )
	if file then
		self._data = json.decode( file:read("*all") )
		file:close()
	end
end

function YOMC:SaveMenu()
	local file = io.open( self._data_path, "w+" )
	if file then
		file:write( json.encode( self._data ) )
		file:close()
	end
end
	
Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_YOMCMenu", function( menu_manager )
	--[[
	MenuCallbackHandler.callback_toggle_balance = function(self, item)
		YOMC._data.Balance = item:value()
		YOMC:SaveMenu()
	end
	]]--
	MenuCallbackHandler.callback_toggle_ChatAnnounce = function(self, item)
		YOMC._data.ChatAnnounce = (item:value() == "on" and true or false)
		YOMC:SaveMenu()
	end
	
	MenuCallbackHandler.callback_toggle_CompCheck = function(self, item)
		YOMC._data.CompCheck = (item:value() == "on" and true or false)
		YOMC:SaveMenu()
	end
	
	MenuCallbackHandler.callback_toggle_BurstFire = function(self, item)
		YOMC._data.BurstFire = item:value()
		YOMC:SaveMenu()
	end
	
	MenuCallbackHandler.callback_toggle_TactReload = function(self, item)
		YOMC._data.TactReload = (item:value() == "on" and true or false)
		YOMC:SaveMenu()
	end
	
	MenuCallbackHandler.callback_toggle_DmgFalloff = function(self, item)
		YOMC._data.DmgFalloff = (item:value() == "on" and true or false)
		YOMC:SaveMenu()
	end
	
	MenuCallbackHandler.callback_toggle_Pen = function(self, item)
		YOMC._data.Pen = (item:value() == "on" and true or false)
		YOMC:SaveMenu()
	end
	
	MenuCallbackHandler.callback_toggle_BUIS = function(self, item)
		YOMC._data.BUIS = item:value()
		YOMC:SaveMenu()
	end
	YOMC:LoadMenu()
	MenuHelper:LoadFromJsonFile( YOMC._path .. "/menu/YOMCMenu.json", YOMC, YOMC._data )
end )

YOMC:LoadMenu()

-- Cancelled
--[[
if not YOMC._data.Balance then
	YOMC._data.Balance = 1
end
]]--
if not YOMC._data.CompCheck then
	YOMC._data.CompCheck = true
end
if not YOMC._data.BurstFire then
	YOMC._data.BurstFire = 3
end
if not YOMC._data.BUIS then
	YOMC._data.BUIS = 1
end

-- Compatability Check
--[[
for k,v in pairs(LuaModManager._enabled_mods) do
	log(tostring(k))
end
]]--

local Critical_Conflict = false
local Resolvable_Conflict = false
if YOMC._data.CompCheck == true then
	if io.file_is_readable( "mods/sc/mod.txt" ) and LuaModManager._enabled_mods["mods/sc/"] == true then
		Resolvable_Conflict = true
		if SC ~= nil and SC._data.sc_player_weapon_toggle == false then
			Resolvable_Conflict = false
		end
	end
	if io.file_is_readable( "mods/DMCWO/mod.txt" ) and LuaModManager._enabled_mods["mods/DMCWO/"] == true then
		Critical_Conflict = true
	end
	if io.file_is_readable( "mods/Blaze Rebalance/mod.txt" ) and LuaModManager._enabled_mods["mods/Blaze Rebalance/"] == true then
		Critical_Conflict = true
	end
	
	if io.file_is_readable( "mods/Deji Rebalance/mod.txt" ) and LuaModManager._enabled_mods["mods/Deji Rebalance/"] == true then
		Critical_Conflict = true
	end
	if io.file_is_readable( "mods/A_Squared Rebalance/mod.txt" ) and LuaModManager._enabled_mods["mods/A_Squared Rebalance/"] == true then
		Critical_Conflict = true
	end
	if io.file_is_readable("mods/WOLVERINE/mod.txt") and LuaModManager._enabled_mods["mods/Wolverine/"] == true then
		Critical_Conflict = true
	end
end

function YOMC:GroupUrl()
local steam_group = "http://steamcommunity.com/groups/YOMCB"
	Steam:overlay_activate("url", steam_group)
end

Hooks:Add("MenuManagerOnOpenMenu", "MenuManagerOnOpenMenu_Notification", function( menu_manager, menu, position )
	if menu == "menu_main" then
		if YOMC._game_Version ~= YOMC._version then
		
			local id = "YOMC_version_not_tested"
			local title = managers.localization:text("YOMC_version_not_tested_title")
			local message = managers.localization:text("YOMC_version_not_tested_message")
			local priority = 150

			NotificationsManager:AddNotification( id, title, message, priority, YOMC.GroupUrl )
		end
		if Critical_Conflict == true then
			if NotificationsManager:NotificationExists( "YOMC_version_not_tested" ) then
				NotificationsManager:RemoveNotification( "YOMC_version_not_tested" )
			end
			local id = "YOMC_conflict_major"
			local title = managers.localization:text("YOMC_conflict_major_title")
			local message = managers.localization:text("YOMC_conflict_major_message")
			local priority = 151
			
			NotificationsManager:AddNotification( id, title, message, priority, YOMC.GroupUrl )
		end
		if Resolvable_Conflict == true then
			if NotificationsManager:NotificationExists( "YOMC_version_not_tested" ) then
				NotificationsManager:RemoveNotification( "YOMC_version_not_tested" )
			end
			if NotificationsManager:NotificationExists( "YOMC_conflict_major" ) then
				NotificationsManager:RemoveNotification( "YOMC_conflict_major" )
			end
			local id = "YOMC_conflict_major_resolve"
			local title = managers.localization:text("YOMC_conflict_major_resolve_title")
			local message = managers.localization:text("YOMC_conflict_major_resolve_message")
			local priority = 152
			
			NotificationsManager:AddNotification( id, title, message, priority, YOMC.GroupUrl )
		end
	elseif YOMC._game_Version == YOMC._version then
		if NotificationsManager:NotificationExists( "YOMC_version_not_tested" ) then
			NotificationsManager:RemoveNotification( "YOMC_version_not_tested" )
		end
	elseif Critical_Conflict ~= true then
		if NotificationsManager:NotificationExists( "YOMC_conflict_major" ) then
			NotificationsManager:RemoveNotification( "YOMC_conflict_major" )
		end
	elseif Resolvable_Conflict ~= true then
		if NotificationsManager:NotificationExists( "YOMC_conflict_major_resolve" ) then
			NotificationsManager:RemoveNotification( "YOMC_conflict_major_resolve" )
		end
	end
end)

local menu_title = "YOU HAVE A NEW MESSAGE"
local text_message = "Continue"
local path = "mods/YOMC/menu/intro.txt"
local can_intro_mail = [[From: 2Cas [2Cas@///REDACTED///]
To: CRIME.net
Date: 2015-12-13 14:58
Subject: Welcome to YOMC!

Welcome to YOMC Beta. 

A reminder that this mod heavily modifies several base game functions, and thus may break upon major game updates.
Thus it is wise to back up your saves early as well as often, particularly before downloading big game updates.

As we are currently in BETA, issues such as the auto-updater breaking, broken code, errors, crashing etc., especially after major updates, should come as no surprise.
I try my best to avoid such issues but in the process of doing constant updates to the mod as well as somehow always doing late-night updates (a bad idea), this mod will break sometimes.

Please join the steam group to receive the latest developer updates, as well as for bug reports and balance discussion.

Thanks and have fun.
- 2Cas]]

Hooks:Add("MenuManagerOnOpenMenu", "MenuManagerOnOpenMenu_IntroYOMC", function( menu_manager, menu, position )

	if menu == "menu_main" then
		local file = io.open( path, "r" )
		if file then
			file:close()
			local menu_options = {
				[1] = {
					text = "Go to Steam Group",
					callback = YOMC.GroupUrl,
				},
				[2] = {
					text = text_message,
					is_cancel_button = true,
				}
			}
			local menu = QuickMenu:new(menu_title, can_intro_mail, menu_options)
			menu:show()
			managers.menu_component:post_event("stinger_levelup")

			os.remove( path )
			Hooks:Remove( "MenuManagerOnOpenMenu_Intro" )

		end
	end
end)

if RequiredScript then
	local script = RequiredScript:lower()
	if Critical_Conflict ~= true then
		if YOMC._Hooks[script] then
			dofile(YOMC._path .. YOMC._Hooks[script])
		end
		if YOMC._Hooks_Classic[script] then 
			dofile(YOMC._path .. YOMC._Hooks_Classic[script])
		end
	end
end	

--[[
	if YOMC._data.Balance == 1 then
		if YOMC._Hooks_Classic[script] then
			dofile(YOMC._path .. YOMC._Hooks_Classic[script])
		end
	end
	if YOMC._data.Balance == 2 then
		if YOMC._Hooks_Realism[script] then
			dofile(YOMC._path .. YOMC._Hooks_Realism[script])
		end
	end
]]--


--[[
		{
			"type" : "multiple_choice",
			"id" : "toggle_balance",
			"title" : "toggle_balance_title",
			"description" : "toggle_balance_desc",
			"callback" : "callback_toggle_balance",
			"items" : [
				"Balance_toggle_classic",
				"Balance_toggle_realism"
				],
			"value" : "Balance",
			"default_value" : 1
		},
		
]]--
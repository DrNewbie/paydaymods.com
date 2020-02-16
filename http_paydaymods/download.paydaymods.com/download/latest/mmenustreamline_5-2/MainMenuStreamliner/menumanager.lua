
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--  Configure main menu entries to hide in mods/saves/mmstreamline_nodeconfig.lua                                       --
--                                                                                                                      --
--  Can't find the file? Run the game once and it will show up. Configure dumping options in dumpmenunodes.lua          --
--                                                                                                                      --
--  If you need to force a dump, simply rename or delete mods/saves/mmstreamline_nodeconfig.lua and (re)start the game  --
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--


--////////////////////////////////////////////////////////////////////////////--
--  DO NOT MODIFY ANYTHING BELOW THIS LINE UNLESS YOU KNOW WHAT YOU'RE DOING  --
--////////////////////////////////////////////////////////////////////////////--


_G.MainMenuStreamliner = _G.MainMenuStreamliner or {}

ModPath = ModPath or ""
MainMenuStreamliner.ModPath = MainMenuStreamliner.ModPath or ModPath
SavePath = SavePath or ""
MainMenuStreamliner.NodeConfig = MainMenuStreamliner.NodeConfig or SavePath .. "mmstreamline_nodeconfig.lua"
MainMenuStreamliner.HideDLCAds = true
MainMenuStreamliner.DumpMenuNodes = false

-- Does mods/saves/mmstreamline_nodeconfig.lua exist?
local f = io.open(MainMenuStreamliner.NodeConfig, "r")
if f ~= nil then
	f:close()
else
	-- Force the file to be created
	MainMenuStreamliner.DumpMenuNodes = true
end

if MainMenuStreamliner.DumpMenuNodes then
	dofile(MainMenuStreamliner.ModPath .. "dumpmenunodes.lua")
end

-- Load mods/saves/mmstreamline_nodeconfig.lua
f = io.open(MainMenuStreamliner.NodeConfig, "r")
if f ~= nil then
	f:close()
	dofile(MainMenuStreamliner.NodeConfig)
else
	-- No configuration, don't bother hooking
	log("[MainMenuStreamliner] Warning: Failed to load \"" .. MainMenuStreamliner.NodeConfig .. "\", aborting")
	return
end

local function HideEntry(entry)
	entry._parameters.visible_callback = "hidden"
	entry._visible_callback_list = {MenuCallbackHandler.hidden}
	entry._visible_callback_name_list = {"hidden"}
end

-- Scans main menu entries and hides the ones listed in the MainMenuStreamliner.EntriesToHide table
local function FindAndHide(menu_manager)
	if menu_manager == nil or menu_manager._registered_menus == nil or menu_manager._registered_menus.menu_main == nil then
		return
	end

	if MenuCallbackHandler == nil then
		log("[MainMenuStreamliner] FATAL ERROR: MenuCallbackHandler is nil, aborting")
		return
	end

	local mainmenunodes = menu_manager._registered_menus.menu_main.logic._data._nodes

	if MainMenuStreamliner.EntriesToHide == nil then
		log("[MainMenuStreamliner] FATAL ERROR: MainMenuStreamliner.EntriesToHide is nil (please re-generate \"" .. MainMenuStreamliner.NodeConfig .. "\" or verify its contents and syntax), aborting")
		return
	end

	for nodename, subentriestoremove in pairs(MainMenuStreamliner.EntriesToHide) do
		if mainmenunodes[nodename] ~= nil and mainmenunodes[nodename]._items ~= nil then
			for __, data in ipairs(mainmenunodes[nodename]._items) do
				if data ~= nil and data._parameters ~= nil and data._parameters.name ~= nil and subentriestoremove[data._parameters.name] ~= nil then
					HideEntry(data)
				end
			end
		else
			log("[MainMenuStreamliner] Warning: mainmenunodes[\"" .. nodename .. "\"]._items is nil (node does not exist?), skipping")
		end
	end
end
Hooks:Add("MenuManagerPostInitialize", "MainMenuStreamliner_FindAndHide", FindAndHide)

if MainMenuStreamliner.HideDLCAds == true then
	-- Removes /only/ the annoying main menu button to buy the newest DLC, the items themselves will continue to remain locked
	function MenuCallbackHandler:is_dlc_latest_locked(...)
		-- And stop bothering me about buying the newest DLC already
		return false
	end
end

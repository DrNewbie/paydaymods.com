if not ModCore then
	log("[ERROR] Unable to find ModCore from BeardLib! Is BeardLib installed correctly?")
	return
end

PDTHHudCore = PDTHHudCore or class(ModCore)
PDTHHudCore.AddonPath = LuaModManager.Constants.mods_directory .. "PDTH HUD addons/"
PDTHHudCore.LocalAddonPath = nil

function PDTHHudCore:init()
	if not file.DirectoryExists(self.AddonPath) then
        os.execute("mkdir \"" .. self.AddonPath .. "\"")
    end

	self.super.init(self, ModPath .. "main_config.xml", true, false)

	self.utils = PDTHHudCoreUtils:new(self)
	self.definitions = PDTHHudCoreDefinitions:new(self)
	self.textures = PDTHHudCoreTextures:new(self)
	self.callbacks = PDTHHudCoreCallbacks:new(self)

	self:post_init({"Options"})
end

function PDTHHudCore:InitConstants()
	self.constants = PDTHHudCoreConstants:new(self)
end

function PDTHHudCore:LoadAddons()
	self.LocalAddonPath = BeardLib.Utils.Path:Combine(self.asset_updates:GetMainInstallDir(), "addons")

    local portraits = {}
	local dirs = {self.AddonPath, self.LocalAddonPath}
	for _, dir in pairs(dirs) do
	    local addons = file.GetFiles(dir)
		if addons then
		    for _, path in pairs(addons) do
		        if string.ends(path, "json") then
		            local file = io.open(BeardLib.Utils.Path:Combine(dir, path), "r")
		            local file_contents = file:read("*all")
	                file:close()
		            local data = json.decode( file_contents )
		            self.textures:ProcessAddon(data, portraits)
		        end
		    end
		end
	end

    local portrait_tbl = {}

    for i, char in pairs(tweak_data.criminals.characters) do
        portrait_tbl[char.name] = { name = char.name, title_id = "menu_" .. char.name, default_value = 1, values = {}, hidden = true }
	end
    for _, portrait in pairs(portraits) do
        for _, char in pairs(portrait.characters) do
            if portrait_tbl[char] then
                table.insert(portrait_tbl[char].values, portrait.name)
            end
        end
    end

    return portrait_tbl
end

local level_blacklist = {
	"mia2_new",
	"driving_escapes_industry_day",
	"driving_escapes_city_day"
}
function PDTHHudCore:GetLevels()
	local level_tbl = {}
	for _, level in pairs(tweak_data.levels._level_index) do
		if tweak_data.levels[level] ~= nil and not table.contains(level_blacklist, level) then
			local suffix = ""
            if string.ends(level, "_night") then
                suffix = " Night"
            end
            if string.ends(level, "_day") then
                suffix = " Day"
            end

			local is_current_level = not Global.load_start_menu and Global.game_settings and level == Global.game_settings.level_id
			table.insert(level_tbl, {
				name = level,
				title_id = function() return managers.localization:exists(tweak_data.levels[level].name_id) and managers.localization:text(tweak_data.levels[level].name_id) .. suffix or level end,
				default_value = 2,
				merge_data = is_current_level and {
					row_item_color = Color.yellow,
                    hightlight_color = Color.yellow,
				} or nil
			})
		end
	end

	return level_tbl
end

if not _G.pdth_hud then
	local success, err = pcall(function() PDTHHudCore:new() end)
	if not success then
		log("[ERROR] An error occured on the initialization of PD:TH Hud. " .. tostring(err))
	end
end

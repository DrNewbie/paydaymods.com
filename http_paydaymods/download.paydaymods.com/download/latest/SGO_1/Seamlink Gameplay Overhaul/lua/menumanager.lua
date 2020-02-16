_G.SGO = _G.SGO or {}
SGO._path = ModPath
SGO._data_path = SavePath .. "SGO.txt"
SGO.settings = {
	use_limit = 60,
	use_limit2 = 900,
	use_slow = 0.35,
	use_slow2 = 5,
	use_zawarudo = 3,
	use_slidy1 = 0.75,
	use_slidy2 = 1,
	use_screw = 2,
	use_tweako = 2,
	use_melee = true,
	use_perkb = true,
	use_perka = true,
	use_chat = true,
	use_jumpy2 = 3,
	use_sprinty = true,
	use_run = true,
	use_boom = true,
	use_insp = true,
	use_hefty = true,
	use_baws = true,
	use_sounds = true,
	use_anims = false,
	use_hold = true,
	use_kill = true,
	use_invt = true,
	use_stci = true,
	use_ramm = true,
	use_burst = true,
	use_dcot = true,
	use_drive = true,
	use_skip = true,
	use_asset = true,
	use_slot = true,
	use_inva = false,
	use_mobj = true,
	use_skco = true,
	use_nofa = true,
	use_lmgs2 = true,
	use_incap = true,
	use_bolt = true,
	use_cook = true,
	use_indo = true,
	use_decap = true,
	use_prom = 1,
	use_snipa = true
}

function SGO:Load()
	local file = io.open(self._data_path, "r")
	if file then
		for k, v in pairs(json.decode(file:read("*all"))) do
			self.settings[k] = v
		end
		file:close()
	end
end
SGO:Load()

function SGO:Save()
	local file = io.open(self._data_path, "w+")
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end

--This detects and applies the localization for each language
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_sgo", function(loc)
	for _, filename in pairs(file.GetFiles(SGO._path .. "loc/")) do
		local str = filename:match('^(.*).txt$')
		if str and Idstring(str) and Idstring(str):key() == SystemInfo:language():key() then
			loc:load_localization_file(SGO._path .. "loc/" .. filename)
			break
		end
	end

	loc:load_localization_file(SGO._path .. "loc/english.txt", false)
end)

Hooks:Add("MenuManagerInitialize", "MenuManagerInitialize_sgo", function(menu_manager)
	MenuCallbackHandler.SGO_enable_limit = function(self, item) -- Slider
		SGO.settings.use_limit = math.ceil(item:value())
	end
	
	MenuCallbackHandler.SGO_enable_limit2 = function(self, item) -- Slider
		SGO.settings.use_limit2 = math.ceil(item:value())
	end
	
	MenuCallbackHandler.SGO_enable_slow = function(self, item) -- Slider
		SGO.settings.use_slow = item:value()
	end
	
	MenuCallbackHandler.SGO_enable_slow2 = function(self, item) -- Slider
		SGO.settings.use_slow2 = item:value()
	end
	
	MenuCallbackHandler.SGO_enable_zawarudo = function(self, item) -- Slider
		SGO.settings.use_zawarudo = item:value()
	end
	
	MenuCallbackHandler.SGO_enable_slidy1 = function(self, item) -- Slider
		SGO.settings.use_slidy1 = item:value()
	end
	
	MenuCallbackHandler.SGO_enable_slidy2 = function(self, item) -- Slider
		SGO.settings.use_slidy2 = item:value()
	end
	
	MenuCallbackHandler.SGO_enable_screw = function(self, item) -- Multiple Choice
		SGO.settings.use_screw = item:value() or 2
		-- 1 Off
		-- 2 With Outlines
		-- 3 Without Outlines
		-- 4 With Outlines and Color Grading Compatibility
		-- 5 ULTRA LIGHT NO SHADOWS NO OUTLINES
	end
	
	MenuCallbackHandler.SGO_enable_tweako = function(self, item) -- Multiple Choice
		SGO.settings.use_tweako = item:value() or 3 
		-- 5 Albus Nerva
		-- 4 Blaze Rebalance
		-- 3 Full Overhaul (default) scwo.lua
		-- 2 Rebalance Mode scworeb.lua
		-- 1 Vanilla Mode none
	end
	
	MenuCallbackHandler.SGO_enable_melee = function(self, item) -- Toggle
		SGO.settings.use_melee = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_perkb = function(self, item) -- Toggle
		SGO.settings.use_perkb = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_perka = function(self, item) -- Toggle
		SGO.settings.use_perka = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_chat = function(self, item) -- Toggle
		SGO.settings.use_chat = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_jumpy2 = function(self, item) -- Slider
		SGO.settings.use_jumpy2 = math.ceil(item:value())
	end
	
	MenuCallbackHandler.SGO_enable_sprinty = function(self, item) -- Toggle
		SGO.settings.use_sprinty = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_run = function(self, item) -- Toggle
		SGO.settings.use_run = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_boom = function(self, item) -- Toggle
		SGO.settings.use_boom = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_insp = function(self, item) -- Toggle
		SGO.settings.use_insp = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_hefty = function(self, item) -- Toggle
		SGO.settings.use_hefty = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_baws = function(self, item) -- Toggle
		SGO.settings.use_baws = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_sounds = function(self, item) -- Toggle
		SGO.settings.use_sounds = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_anims = function(self, item) -- Toggle
		SGO.settings.use_anims = item:value() == "on"
	end
	--Revision175
	MenuCallbackHandler.SGO_enable_hold = function(self, item)
		SGO.settings.use_hold = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_kill = function(self, item)
		SGO.settings.use_kill = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_invt = function(self, item)
		SGO.settings.use_invt = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_stci = function(self, item)
		SGO.settings.use_stci = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_ramm = function(self, item)
		SGO.settings.use_ramm = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_burst = function(self, item)
		SGO.settings.use_burst = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_dcot = function(self, item)
		SGO.settings.use_dcot = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_drive = function(self, item)
		SGO.settings.use_drive = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_skip = function(self, item)
		SGO.settings.use_skip = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_asset = function(self, item)
		SGO.settings.use_asset = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_slot = function(self, item)
		SGO.settings.use_slot = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_decap = function(self, item)
		SGO.settings.use_decap = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_inva = function(self, item)
		SGO.settings.use_inva = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_mobj = function(self, item)
		SGO.settings.use_mobj = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_skco = function(self, item)
		SGO.settings.use_skco = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_nofa = function(self, item)
		SGO.settings.use_nofa = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_lmgs2 = function(self, item)
		SGO.settings.use_lmgs2 = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_incap = function(self, item)
		SGO.settings.use_incap = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_cook = function(self, item)
		SGO.settings.use_cook = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_bolt = function(self, item)
		SGO.settings.use_bolt = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_indo = function(self, item)
		SGO.settings.use_indo = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_snipa = function(self, item)
		SGO.settings.use_snipa = item:value() == "on"
	end
	
	MenuCallbackHandler.SGO_enable_prom = function(self, item) -- Multiple Choice
		SGO.settings.use_prom = item:value() or 1 
		-- 1 Frenzy only
		-- 2 Always on
	end
	
	--[[
	MenuCallbackHandler.SGO_enable_x = function(self, item)
		SGO.settings.use_x = item:value() == "on"
	end
	--]]

	MenuCallbackHandler.SGO_save = function(this, item)
		SGO:Save()
	end

	SGO:Load()
	MenuHelper:LoadFromJsonFile(SGO._path .. "menu/SGO.txt", sgo, SGO.settings)
end)
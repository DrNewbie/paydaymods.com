_G.WaveSurvivedTweakData = {}

-- Init Localizations
WaveSurvivedTweakData.localization = {}
WaveSurvivedTweakData.localization[1] = ModPath .. "/loc/english.txt"
WaveSurvivedTweakData.localization[2] = ModPath .. "/loc/french.txt"
WaveSurvivedTweakData.localization[3] = ModPath .. "/loc/russian.txt"
WaveSurvivedTweakData.localization[4] = ModPath .. "/loc/italian.txt"
WaveSurvivedTweakData.localization[5] = ModPath .. "/loc/german.txt"
WaveSurvivedTweakData.localization[6] = ModPath .. "/loc/spanish.txt"
WaveSurvivedTweakData.localization[7] = ModPath .. "/loc/hungarian.txt"
WaveSurvivedTweakData.localization[8] = ModPath .. "/loc/korean.txt"

-- Init Supported Huds
WaveSurvivedTweakData.supported_hud = {}
WaveSurvivedTweakData.supported_hud[1] = "default"
WaveSurvivedTweakData.supported_hud[2] = "nepgearsy_hud"
WaveSurvivedTweakData.supported_hud[3] = "holoui"
WaveSurvivedTweakData.supported_hud[4] = "pdth_hud"
WaveSurvivedTweakData.supported_hud[5] = "lddg_hud"
WaveSurvivedTweakData.supported_hud[6] = "restoration"
WaveSurvivedTweakData.supported_hud[7] = "void"

-- Init Durations
WaveSurvivedTweakData.duration = {}
WaveSurvivedTweakData.duration[1] = 8.6
WaveSurvivedTweakData.duration[2] = 15
WaveSurvivedTweakData.duration[3] = 20
WaveSurvivedTweakData.duration[4] = 25

-- Init Pre-made Wave Survived Panel Colors
WaveSurvivedTweakData.ws_panel_color = {}
WaveSurvivedTweakData.ws_panel_color[1] = Color(255, 32, 230, 32) / 255
WaveSurvivedTweakData.ws_panel_color[2] = Color(255, 255, 255, 0) / 255
WaveSurvivedTweakData.ws_panel_color[3] = Color(255, 255, 0, 0) / 255
WaveSurvivedTweakData.ws_panel_color[4] = Color(255, 0, 255, 255) / 255
WaveSurvivedTweakData.ws_panel_color[5] = Color(255, 255, 127, 80) / 255

-- Init Pre-made Endless Wave Panel Colors
WaveSurvivedTweakData.ew_panel_color = {}
WaveSurvivedTweakData.ew_panel_color[1] = Color(255, 255, 0, 0) / 255
WaveSurvivedTweakData.ew_panel_color[2] = Color(255, 255, 255, 0) / 255
WaveSurvivedTweakData.ew_panel_color[3] = Color(255, 32, 230, 32) / 255
WaveSurvivedTweakData.ew_panel_color[4] = Color(255, 0, 255, 255) / 255
WaveSurvivedTweakData.ew_panel_color[5] = Color(255, 255, 127, 80) / 255

_G.WaveSurvived = {}

WaveSurvived.modpath = ModPath
WaveSurvived.logpath = LogsPath
WaveSurvived.savepath = SavePath
WaveSurvived.savefile = SavePath .. "/WaveSurvived_options.txt"

WaveSurvived.options = {}

function WaveSurvived:Load()		
	local file = io.open( self.savefile , "r")
	if file then
		for k, v in pairs(json.decode(file:read("*all")) or {}) do
			if k then
				WaveSurvived.options[k] = v
			end
		end
		file:close()
		log("[WaveSurvived] Loaded Settings")
	end
end

function WaveSurvived:Save()
	if file.DirectoryExists( self.savepath ) then	
		local file = io.open( self.savefile , "w+")
		if file then
			file:write(json.encode(WaveSurvived.options))
			file:close()
			log("[WaveSurvived] Saved settings")
		end
	end
end

	MenuCallbackHandler.WaveSurvived_enable_checks_callback = function(self, item)
		WaveSurvived.options.WaveSurvived_enable_checks_value = (item:value() == "on" and true or false)
		
		if Utils:IsInHeist() then
			local file = io.open( SavePath .. "/WaveSurvived_options.txt" , "w+") -- We do that as a crash fixer in-game
			if file then
				file:write(json.encode(WaveSurvived.options))
				file:close()
				log("[WaveSurvived] (forced) saved settings")
			end
		else
			WaveSurvived:Save()
			log("[WaveSurvived] (normal) saved settings")
		end
	end

	MenuCallbackHandler.WaveSurvived_compatibility_callback = function(self, item)
		WaveSurvived.options.WaveSurvived_compatibility = item:value()
		log("[WaveSurvived] Current HUD : " .. WaveSurvived.options.WaveSurvived_compatibility)

		if Utils:IsInHeist() then
			local file = io.open( SavePath .. "/WaveSurvived_options.txt" , "w+") -- We do that as a crash fixer in-game
			if file then
				file:write(json.encode(WaveSurvived.options))
				file:close()
				log("[WaveSurvived] (forced) saved settings")
			end
		else
			WaveSurvived:Save()
			log("[WaveSurvived] (normal) saved settings")
		end
	end

	MenuCallbackHandler.WaveSurvived_language_callback = function(self, item)
		
		WaveSurvived.options.WaveSurvived_language = item:value()
		log("[WaveSurvived] Current language : " .. WaveSurvived.options.WaveSurvived_language)
		
		if Utils:IsInHeist() then
			local file = io.open( SavePath .. "/WaveSurvived_options.txt" , "w+") -- We do that as a crash fixer in-game
			if file then
				file:write(json.encode(WaveSurvived.options))
				file:close()
				log("[WaveSurvived] (forced) saved settings")
			end
		else
			WaveSurvived:Save()
			log("[WaveSurvived] (normal) saved settings")
		end
	end

	MenuCallbackHandler.WaveSurvived_duration_callback = function(self, item)
		
		WaveSurvived.options.WaveSurvived_duration = item:value()
		log("[WaveSurvived] Duration : " .. WaveSurvived.options.WaveSurvived_duration)
		
		if Utils:IsInHeist() then
			local file = io.open( SavePath .. "/WaveSurvived_options.txt" , "w+") -- We do that as a crash fixer in-game
			if file then
				file:write(json.encode(WaveSurvived.options))
				file:close()
				log("[WaveSurvived] (forced) saved settings")
			end
		else
			WaveSurvived:Save()
			log("[WaveSurvived] (normal) saved settings")
		end
	end

	MenuCallbackHandler.WaveSurvived_customtext_callback = function(self, item)
		
		WaveSurvived.options.WaveSurvived_customtext = item:value()
		log("[WaveSurvived] Custom text : " .. WaveSurvived.options.WaveSurvived_customtext)
		
		if Utils:IsInHeist() then
			local file = io.open( SavePath .. "/WaveSurvived_options.txt" , "w+") -- We do that as a crash fixer in-game
			if file then
				file:write(json.encode(WaveSurvived.options))
				file:close()
				log("[WaveSurvived] (forced) saved settings")
			end
		else
			WaveSurvived:Save()
			log("[WaveSurvived] (normal) saved settings")
		end
	end

	MenuCallbackHandler.WaveSurvived_endless_customtext_callback = function(self, item)
		
		WaveSurvived.options.WaveSurvived_endless_customtext = item:value()
		log("[EndlessWave] Custom text : " .. WaveSurvived.options.WaveSurvived_endless_customtext)
		
		if Utils:IsInHeist() then
			local file = io.open( SavePath .. "/WaveSurvived_options.txt" , "w+") -- We do that as a crash fixer in-game
			if file then
				file:write(json.encode(WaveSurvived.options))
				file:close()
				log("[WaveSurvived] (forced) saved settings")
			end
		else
			WaveSurvived:Save()
			log("[WaveSurvived] (normal) saved settings")
		end
	end

	MenuCallbackHandler.WaveSurvived_custompanelcolor_callback = function(self, item)
		
		WaveSurvived.options.WaveSurvived_custompanelcolor = item:value()
		log("[WaveSurvived] Custom color : " .. WaveSurvived.options.WaveSurvived_custompanelcolor)
		
		if Utils:IsInHeist() then
			local file = io.open( SavePath .. "/WaveSurvived_options.txt" , "w+") -- We do that as a crash fixer in-game
			if file then
				file:write(json.encode(WaveSurvived.options))
				file:close()
				log("[WaveSurvived] (forced) saved settings")
			end
		else
			WaveSurvived:Save()
			log("[WaveSurvived] (normal) saved settings")
		end
	end

	MenuCallbackHandler.WaveSurvived_custompanelcolor_customslider_red_callback = function(self, item)
		
		WaveSurvived.options.WaveSurvived_custompanelcolor_customslider_red = item:value()
		
		if Utils:IsInHeist() then
			local file = io.open( SavePath .. "/WaveSurvived_options.txt" , "w+") -- We do that as a crash fixer in-game
			if file then
				file:write(json.encode(WaveSurvived.options))
				file:close()
			end
		else
			WaveSurvived:Save()
		end
	end

	MenuCallbackHandler.WaveSurvived_custompanelcolor_customslider_green_callback = function(self, item)
		
		WaveSurvived.options.WaveSurvived_custompanelcolor_customslider_green = item:value()
		
		if Utils:IsInHeist() then
			local file = io.open( SavePath .. "/WaveSurvived_options.txt" , "w+") -- We do that as a crash fixer in-game
			if file then
				file:write(json.encode(WaveSurvived.options))
				file:close()
			end
		else
			WaveSurvived:Save()
		end
	end

	MenuCallbackHandler.WaveSurvived_custompanelcolor_customslider_blue_callback = function(self, item)
		
		WaveSurvived.options.WaveSurvived_custompanelcolor_customslider_blue = item:value()
		
		if Utils:IsInHeist() then
			local file = io.open( SavePath .. "/WaveSurvived_options.txt" , "w+") -- We do that as a crash fixer in-game
			if file then
				file:write(json.encode(WaveSurvived.options))
				file:close()
			end
		else
			WaveSurvived:Save()
		end
	end

	MenuCallbackHandler.WaveSurvived_custompanelcolor_endless_callback = function(self, item)
		
		WaveSurvived.options.WaveSurvived_custompanelcolor_endless = item:value()
		log("[EndlessWave] Custom color : " .. WaveSurvived.options.WaveSurvived_custompanelcolor_endless)
		
		if Utils:IsInHeist() then
			local file = io.open( SavePath .. "/WaveSurvived_options.txt" , "w+") -- We do that as a crash fixer in-game
			if file then
				file:write(json.encode(WaveSurvived.options))
				file:close()
			end
		else
			WaveSurvived:Save()
		end
	end

	MenuCallbackHandler.WaveSurvived_custompanelcolor_endless_customslider_red_callback = function(self, item)
		
		WaveSurvived.options.WaveSurvived_custompanelcolor_endless_customslider_red = item:value()
		
		if Utils:IsInHeist() then
			local file = io.open( SavePath .. "/WaveSurvived_options.txt" , "w+") -- We do that as a crash fixer in-game
			if file then
				file:write(json.encode(WaveSurvived.options))
				file:close()
			end
		else
			WaveSurvived:Save()
		end
	end

	MenuCallbackHandler.WaveSurvived_custompanelcolor_endless_customslider_green_callback = function(self, item)
		
		WaveSurvived.options.WaveSurvived_custompanelcolor_endless_customslider_green = item:value()
		
		if Utils:IsInHeist() then
			local file = io.open( SavePath .. "/WaveSurvived_options.txt" , "w+") -- We do that as a crash fixer in-game
			if file then
				file:write(json.encode(WaveSurvived.options))
				file:close()
			end
		else
			WaveSurvived:Save()
		end
	end

	MenuCallbackHandler.WaveSurvived_custompanelcolor_endless_customslider_blue_callback = function(self, item)
		
		WaveSurvived.options.WaveSurvived_custompanelcolor_endless_customslider_blue = item:value()
		
		if Utils:IsInHeist() then
			local file = io.open( SavePath .. "/WaveSurvived_options.txt" , "w+") -- We do that as a crash fixer in-game
			if file then
				file:write(json.encode(WaveSurvived.options))
				file:close()
			end
		else
			WaveSurvived:Save()
		end
	end

	MenuCallbackHandler.WaveSurvived_custompanelcolor_website_callback = function(self, item)
		Steam:overlay_activate("url", "http://www.rapidtables.com/web/color/RGB_Color.htm")
	end

	WaveSurvived:Load()


	if WaveSurvived.options["WaveSurvived_language"] then
		Hooks:Add("LocalizationManagerPostInit", "WaveSurvived_Localization", function(loc)
			loc:load_localization_file( WaveSurvivedTweakData.localization[WaveSurvived.options["WaveSurvived_language"]] )
		end)
		log("[WaveSurvived] Localization loaded")
	else -- if nothing match, loads the default localization
		Hooks:Add("LocalizationManagerPostInit", "WaveSurvived_Localization", function(loc)
			loc:load_localization_file( WaveSurvivedTweakData.localization[1] )
		end)
		log("[WaveSurvived] Localization loaded")
	end

MenuHelper:LoadFromJsonFile(ModPath .. "/options/menu.json", WaveSurvived, WaveSurvived.options)
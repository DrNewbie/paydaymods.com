_G.MethHelperUpdated = MethHelperUpdated or {}

--If you're here because you want to change the mod to silent mode, you are in the wrong place.
--You should use the Mod Options menu to change this mod's settings. 
--If you do not have a Mod Options menu, you must upgrade from BLT to SuperBLT: https://superblt.znix.xyz/
MethHelperUpdated.settings = {
	enabled = true, --master enable
	ingred_chatmode = 2,
	ingred_hintmode = true,
	ingred_repeat = false,
	added_chatmode = 1,
	added_hintmode = false,
	done_chatmode = 1,
	done_hintmode = false,
	fail_chatmode = 3,
	fail_hintmode = true
}

MethHelperUpdated.path = ModPath
MethHelperUpdated.save_path = SavePath .. "methhelperupdated.txt"

MethHelperUpdated._last_ingredient = "Fish-shaped volatile organic compounds and sediment-shaped sediment"

function MethHelperUpdated:IsEnabled()
	return self.settings.enabled
end

function MethHelperUpdated:DebugEnabled() 
	return false
end

function MethHelperUpdated:ShouldRepeatIngredients()
	return self.settings.ingred_repeat
end

function MethHelperUpdated:GetOutputType(dialog_id)
	local s = self.settings
	local chatmode = s[dialog_id .. "_chatmode"] or 3
	local hintmode = s[dialog_id .. "_hintmode"] or false

	return chatmode,hintmode
end

function MethHelperUpdated:Toggle_Enabled(enabled)
	if enabled == nil then 
		self.settings.enabled = not self.settings.enabled
	else
		self.settings.enabled = enabled
	end
	return self.settings.enabled
end

function MethHelperUpdated:LocalizeLine(id)
	return managers.localization:text("methhelperupdated_" .. tostring(id))
end

function MethHelperUpdated:Load()
	local file = io.open(self.save_path, "r")
	if (file) then
		for k, v in pairs(json.decode(file:read("*all"))) do
			self.settings[k] = v
		end
	else
		self:Save()
	end
end

function MethHelperUpdated:Save()
	local file = io.open(self.save_path,"w+")
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end


Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_MethHelperUpdated", function(loc)
	local path = MethHelperUpdated.path .. "loc/" --where localization files are kept

	--adding this as a local function allows us to check for multiple localization files without fear of overriding them 
	--(in case of multiple matches, through different get-language methods)
	local function attempt_load_localization(p)
		if p and SystemFS:exists(Application:nice_path(p,true)) then
			loc:load_localization_file(p)

			if MethHelperUpdated:DebugEnabled() then 
				log("MethHelperUpdated: Loaded localization file: [" .. tostring(p) .. "]")
			end
			return true
		end
		if MethHelperUpdated:DebugEnabled() then 
			log("MethHelperUpdated: Failed to load localization file: [" .. tostring(p) .. "]")
		end
		return false
	end
	
	
	--first, attempt to load language based on installed translation mods (for languages that are not officially supported by BLT)	
		--however, this mod hasn't been translated into korean, thai, or portuguese brazilian, although these translation mods do exist
		--so this particular check will never succeed
		--but hey, i'll be ready for if/when the day comes when this mod is translated to these languages
	local ization_mods = { --get it? local-ization? hahahahaha please clap
		["Payday 2 Korean patch"] = "kr.txt",
		["PAYDAY 2 THAI LANGUAGE Mod"] = "th.txt",
		["PAYDAY 2 Translate in Portuguese Brazilian"] = "pb.txt"
	}
	for _, mod in pairs(BLT and BLT.Mods:Mods() or {}) do
		if mod:IsEnabled() then 
			if attempt_load_localization(path .. tostring(ization_mods[mod:GetName() or ""])) then
				return --successfully loaded localization
			end			
		end
	end	
	
	--then, attempt to load language based on BLT selected language
	if attempt_load_localization(path .. BLT.Localization._current .. ".txt") then 
		return --successfully loaded localization
	end
		
	--if BLT language and BLT translation mod detection both fail, resort to checking system language against current localization files
	local longnames = {
		["en"] = "english",
		["es"] = "spanish",
		["fr"] = "french",
		["ru"] = "russian",
		["zh-cn"] = "chinese"
	}
	for _, filename in pairs(file.GetFiles(path)) do
		local langname = longnames[filename]
		if langname then 
			local str = string.match(langname,"^(.*).txt$")
			if str and Idstring(str) and Idstring(str):key() == SystemInfo:language():key() then
				if attempt_load_localization(path .. tostring(langname)) then 
					return --successfully loaded localization
				end
			end
		end
	end
	
	loc:load_localization_file(path .. "en.txt")
	if MethHelperUpdated:DebugEnabled() then 
		log("MethHelperUpdated: Loaded default localization file en.txt")
	end
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_MethHelperUpdated", function(menu_manager)

	MenuCallbackHandler.callback_methhelperupdated_toggle_enabled = function(self,item)
		local value = item:value() == "on"
		MethHelperUpdated:Toggle_Enabled(value)
		MethHelperUpdated:Save()
	end
	MenuCallbackHandler.callback_methhelperupdated_keybind_toggle = function(self)
		local value = MethHelperUpdated:Toggle_Enabled()
		if managers.hud then 
			managers.hud:show_hint({text = MethHelperUpdated:LocalizeLine("toggled_" .. tostring(value))})
		end
		--don't save from keybind
	end
	
	
	MenuCallbackHandler.callback_methhelperupdated_ingred_chatmode = function(self,item)
		local value = tonumber(item:value())
		MethHelperUpdated.settings.ingred_chatmode = value
		MethHelperUpdated:Save()
	end
	MenuCallbackHandler.callback_methhelperupdated_ingred_hintmode = function(self,item)
		local value = item:value() == "on"
		MethHelperUpdated.settings.ingred_hintmode = value
		MethHelperUpdated:Save()
	end
	MenuCallbackHandler.callback_methhelperupdated_ingred_repeat = function(self,item)
		local value = item:value() == "on"
		MethHelperUpdated.settings.ingred_repeat = value
		MethHelperUpdated:Save()
	end
		
	
	MenuCallbackHandler.callback_methhelperupdated_added_chatmode = function(self,item)
		local value = tonumber(item:value())
		MethHelperUpdated.settings.added_chatmode = value
		MethHelperUpdated:Save()
	end
	MenuCallbackHandler.callback_methhelperupdated_added_hintmode = function(self,item)
		local value = item:value() == "on"
		MethHelperUpdated.settings.added_hintmode = value
		MethHelperUpdated:Save()
	end
		
		
	MenuCallbackHandler.callback_methhelperupdated_done_chatmode = function(self,item)
		local value = tonumber(item:value())
		MethHelperUpdated.settings.done_chatmode = value
		MethHelperUpdated:Save()
	end
	MenuCallbackHandler.callback_methhelperupdated_done_hintmode = function(self,item)
		local value = item:value() == "on"
		MethHelperUpdated.settings.done_hintmode = value
		MethHelperUpdated:Save()
	end
	
	
	MenuCallbackHandler.callback_methhelperupdated_fail_chatmode = function(self,item)
		local value = tonumber(item:value())
		MethHelperUpdated.settings.fail_chatmode = value
		MethHelperUpdated:Save()
	end
	MenuCallbackHandler.callback_methhelperupdated_fail_hintmode = function(self,item)
		local value = item:value() == "on"
		MethHelperUpdated.settings.fail_hintmode = value
		MethHelperUpdated:Save()
	end
	
	
	MenuCallbackHandler.callback_methhelperupdated_close = function(self)
--		MethHelperUpdated:Save() --redundant since the mod saves after any setting change
	end
	MethHelperUpdated:Load()
	MenuHelper:LoadFromJsonFile(MethHelperUpdated.path .. "menu/options.txt", MethHelperUpdated, MethHelperUpdated.settings)

end)
_G.AllTheGadgets = _G.AllTheGadgets or {}
local ATG = _G.AllTheGadgets
ATG._path = ModPath
ATG._data_path = SavePath .. "ActivateMultipleGadgets.txt"

--i rate 2/10, "AllTheGadgets" only lets you activate some of the gadgets >:(

--create entries for all settings
ATG.default_settings = {
	atg_enabled = true,
	disable_cycle = true
}

--duplicate settings so that old saves after an update will still get any new settings entries
ATG.settings = ATG.settings or {}
for k,v in pairs(ATG.default_settings) do 
	ATG.settings[k] = ATG.settings[k] or v
end

function ATG:IsEnabled()
	return ATG.settings.atg_enabled
end

function ATG:SightCycleDisabled()
	return ATG.settings.disable_cycle
end

function ATG:Load()
	local file = io.open(self._data_path, "r")
	if (file) then
		for k, v in pairs(json.decode(file:read("*all"))) do
			self.settings[k] = v
		end
	else
		ATG:Save()
	end
end

function ATG:Save()
	local file = io.open(self._data_path,"w+")
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_atg", function( loc )
	loc:load_localization_file( ATG._path .. "en.txt")
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_atg", function(menu_manager)

	MenuCallbackHandler.callback_atg_enabled = function(self,item)
		ATG.settings.atg_enabled = item:value() == "on"
		ATG:Save()
	end

	MenuCallbackHandler.callback_atg_disable_cycle = function(self,item)
		ATG.settings.disable_cycle = item:value() == "on"
		ATG:Save()
	end
	
	MenuCallbackHandler.atg_toggle_sight_gadget = function(self)
		if Utils:IsInHeist() and Utils:IsInCustody() == false and Utils:IsInGameState() then--doesn't cover all cases, but it at least shouldn't crash
			local state = managers.player:local_player():movement():current_state()
			local wpn = state._equipped_unit:base()	
			
			if not wpn._second_sight_data or not wpn._second_sight_data.unit then
				return false
			end

			local secondsight = wpn._second_sight_data.unit:base()
			
			secondsight:toggle() --toggles the sight gadget
			state:_stance_entered() --refreshes stance
		end
	end
	
	MenuCallbackHandler.callback_atg_close = function(this)
		ATG:Save()
	end
	ATG:Load()
	MenuHelper:LoadFromJsonFile(ATG._path .. "options.txt", ATG, ATG.settings)	
	
end)
MIH = {}
MIH.Savefile = SavePath .. "MIH_Options.txt"

MIH.Localization = {}
MIH.Localization.English = ModPath .. "Loc/English.txt"
MIH.Data = {}

function MIH:Save()
	local file = io.open( self.Savefile , "w+")
	if file then
		file:write(json.encode(MIH.Data))
		file:close()
	end
end

function MIH:Load()
local file = io.open( self.Savefile , "r")
	if file then
		for k, v in pairs(json.decode(file:read("*all")) or {}) do
			if k then
				MIH.Data[k] = v
			end
		end
		file:close()
	end
end

MenuCallbackHandler.MIH_Enable_Cash_Callback = function(self, item)
	MIH.Data.MIH_Enable_Cash_Value = (item:value() == "on" and true or false)
	MIH:Save()
end

MenuCallbackHandler.MIH_Correction_X_Callback = function(self, item)
	MIH.Data.MIH_Correction_X_Value = item:value()
	MIH:Save()
end

MenuCallbackHandler.MIH_Correction_Y_Callback = function(self, item)
	MIH.Data.MIH_Correction_Y_Value = item:value()
	MIH:Save()
end

MenuCallbackHandler.MIH_Correction_Reset_Callback = function(self, item)
	MenuHelper:ResetItemsToDefaultValue( item, {["MIH_Correction_X"] = true}, 0 )
	MenuHelper:ResetItemsToDefaultValue( item, {["MIH_Correction_Y"] = true}, 0 )
end

MIH:Load()

Hooks:Add("LocalizationManagerPostInit", "MIH_Localization", function(loc)
	loc:load_localization_file( MIH.Localization.English )
end)

MenuHelper:LoadFromJsonFile(ModPath .. "/Options/Menu.json", MIH, MIH.Data)

Hooks:PostHook( MoneyManager, "_setup", "MIHInit", function(self)
	self.catch_reduction_to_persist = 0
	self.previous_stored_cash = 0
end)

function MoneyManager:send_to_the_persist(amount)
	self.catch_reduction_to_persist = self.catch_reduction_to_persist + amount
end

function MoneyManager:retrieve_the_persist()
	return self.catch_reduction_to_persist
end

Hooks:PostHook( MoneyManager, "civilian_killed", "DataToMIHPersist", function(self)
	self:send_to_the_persist(self:get_civilian_deduction())
end)


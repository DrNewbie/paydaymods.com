_G.TacticalGrenades = _G.TacticalGrenades or {}
TacticalGrenades.queued_grenade = false
TacticalGrenades.cook_t = 0
TacticalGrenades.throw_grenade = false
TacticalGrenades.allowed_cook = {
--whitelist for grenades that can be cooked and held, otherwise will just be thrown.
--also functions as a list of grenade timers, since OVERKILL DIDN'T PUT THIS IN TWEAK DATA,
--even though all the timers are 2.5 seconds. i'd rather have the ability to add it in later anyway
	["concussion"] = 2.5, --what do you think it is	
	["frag_com"] = 2.5, --HEF grenade
	["dada_com"] = 2.5, --matroyshka grenade
	["fir_com"] = 2.5, --Incendiary m79
	["frag"] = 2.5, -- frag standard
	["smoke_screen_grenade"] = 2.5,
	["frag_cluster"] = 2.5, --dr newbie's cluster bomb
	["frag_fakbomb"] = 2.5, --dr newbie's 
	["frag_taser"] = 2.5,
	["frag_medicbomb"] = 2.5,
--	["molotov"] = 120, -- shouldn't be cookable, probably, unless i can get an animation to hold a grenade without throwing it
	["dynamite"] = 2.5 --dy-no-miiiite
}
--[[
--i actually don't think i need any options for this so... oh well


TacticalGrenades._path = ModPath
TacticalGrenades._data_path = SavePath .. "sliding.txt"

TacticalGrenades.settings = {
	dank = true,
	dankness = 420
}

function TacticalGrenades:Load()
	local file = io.open(self._data_path, "r")
	if (file) then
		for k,v in pairs(json.decode(file:read("*all"))) do 
			self.settings[k] = v
		end
	else
		TacticalGrenades:Save()
	end
end

function TacticalGrenades:Save()
	local file = io.open(self._data_path,"w+")
	if file then 
		file:write(json.encode(self.settings))
		file:close()
	end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_TacNades", function(self)
	self:load_localization_file( TacticalGrenades._path .. "en.txt")
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_TacNades", function(self)
	HoldTheKey:Add_Keybind("keybindid") --don't need HtK since we're just using the game's default nade button
	MenuCallbackHandler.callback_menu_toggle = function(self,item)
		local value = item:value() == 'on'
		TacticalGrenades.settings.setting_1 = value
		TacticalGrenades:Save()
	end	
	MenuCallbackHandler.keybind_func = function(self)
	end
	TacticalGrenades:Load()
	MenuHelper:LoadFromJsonFile(TacticalGrenades._path .. "options.txt", TacticalGrenades, TacticalGrenades.settings)
end)
--]]

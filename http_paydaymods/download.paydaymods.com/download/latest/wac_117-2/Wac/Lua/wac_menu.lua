if WacMenu._data.weaponnames == 2 then
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_WacNamesMenu", function(loc)
	loc:load_localization_file(WacMenu._path .. "Loc/en_realnames.txt")
end)
else
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_WacNamesMenu", function(loc)
	loc:load_localization_file(WacMenu._path .. "Loc/en_pd2names.txt")
end)
end
if WacMenu._data.pd2weaponnames == 2 then
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_WacRealWpnNames", function(loc)
	loc:load_localization_file(WacMenu._path .. "Loc/en_wpn_realnames.txt")
end)
end
Hooks:Add("MenuManagerInitialize", "MenuManagerInitialize_WacMenu", function(menu_manager)
	MenuCallbackHandler.callback_wac_applychanges = function(self, item)
		WacMenu:Load()
		if SystemFS:exists("mods/Wac Custom Mods Addon/mod.txt") then
			dofile( "mods/Wac/Lua/wac_base.lua" )
			dofile( "mods/Wac Custom mods Addon/Lua/wac_custom_base.lua" )
		else
			dofile( "mods/Wac/Lua/wac_base.lua" )
		end
	end
	MenuCallbackHandler.callback_toggle_replace_ak5shortb = function(self, item)
		WacMenu._data.replace_ak5shortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak5cfg = function(self, item)
		WacMenu._data.replace_ak5cfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_fncfg = function(self, item)
		WacMenu._data.replace_fncfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak5bstock = function(self, item)
		WacMenu._data.replace_ak5bstock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak5cstock = function(self, item)
		WacMenu._data.replace_ak5cstock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak12pbs1 = function(self, item)
		WacMenu._data.replace_ak12pbs1 = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak12flashhider = function(self, item)
		WacMenu._data.replace_ak12flashhider = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak12stndgrip = function(self, item)
		WacMenu._data.replace_ak12stndgrip = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak12quad = function(self, item)
		WacMenu._data.replace_ak12quad = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak12uspalm = function(self, item)
		WacMenu._data.replace_ak12uspalm = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak12magpulassist = function(self, item)
		WacMenu._data.replace_ak12magpulassist = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak12stock = function(self, item)
		WacMenu._data.replace_ak12stock = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak74dracob = function(self, item)
		WacMenu._data.replace_ak74dracob = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak74modernb = function(self, item)
		WacMenu._data.replace_ak74modernb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak74zastava = function(self, item)
		WacMenu._data.replace_ak74zastava = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak74pbs1 = function(self, item)
		WacMenu._data.replace_ak74pbs1 = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak74quad = function(self, item)
		WacMenu._data.replace_ak74quad = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak74uspalm = function(self, item)
		WacMenu._data.replace_ak74uspalm = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak74magpulassist = function(self, item)
		WacMenu._data.replace_ak74magpulassist = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak74stock1 = function(self, item)
		WacMenu._data.replace_ak74stock1 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak74stock2 = function(self, item)
		WacMenu._data.replace_ak74stock2 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak74stock3 = function(self, item)
		WacMenu._data.replace_ak74stock3 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak74stock4 = function(self, item)
		WacMenu._data.replace_ak74stock4 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak74upperrec = function(self, item)
		WacMenu._data.replace_ak74upperrec = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ak74single = function(self, item)
		WacMenu._data.replace_ak74single = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmdracob = function(self, item)
		WacMenu._data.replace_akmdracob = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmmodernb = function(self, item)
		WacMenu._data.replace_akmmodernb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmzastava = function(self, item)
		WacMenu._data.replace_akmzastava = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmpbs1 = function(self, item)
		WacMenu._data.replace_akmpbs1 = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmquad = function(self, item)
		WacMenu._data.replace_akmquad = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmuspalm = function(self, item)
		WacMenu._data.replace_akmuspalm = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmmagpulassist = function(self, item)
		WacMenu._data.replace_akmmagpulassist = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmstock1 = function(self, item)
		WacMenu._data.replace_akmstock1 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmstock2 = function(self, item)
		WacMenu._data.replace_akmstock2 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmstock3 = function(self, item)
		WacMenu._data.replace_akmstock3 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmstock4 = function(self, item)
		WacMenu._data.replace_akmstock4 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmupperrec = function(self, item)
		WacMenu._data.replace_akmupperrec = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmsingle = function(self, item)
		WacMenu._data.replace_akmsingle = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmgolddracob = function(self, item)
		WacMenu._data.replace_akmgolddracob = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmgoldmodernb = function(self, item)
		WacMenu._data.replace_akmgoldmodernb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmgoldfg = function(self, item)
		WacMenu._data.replace_akmgoldfg = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmgoldquad = function(self, item)
		WacMenu._data.replace_akmgoldquad = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmgolduspalm = function(self, item)
		WacMenu._data.replace_akmgolduspalm = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmgoldmagpulassist = function(self, item)
		WacMenu._data.replace_akmgoldmagpulassist = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmgoldstock1 = function(self, item)
		WacMenu._data.replace_akmgoldstock1 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmgoldstock2 = function(self, item)
		WacMenu._data.replace_akmgoldstock2 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmgoldstock3 = function(self, item)
		WacMenu._data.replace_akmgoldstock3 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_asvalprotob = function(self, item)
		WacMenu._data.replace_asvalprotob = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_asvalstock = function(self, item)
		WacMenu._data.replace_asvalstock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_asvalsingle = function(self, item)
		WacMenu._data.replace_asvalsingle = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_auglongb = function(self, item)
		WacMenu._data.replace_auglongb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_augextrarail = function(self, item)
		WacMenu._data.replace_augextrarail = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_augf90body = function(self, item)
		WacMenu._data.replace_augf90body = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_augmagpulassist = function(self, item)
		WacMenu._data.replace_augmagpulassist = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ironsightsaug = function(self, item)
		WacMenu._data.replace_ironsightsaug = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sa58fg = function(self, item)
		WacMenu._data.replace_sa58fg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_falsniperfg = function(self, item)
		WacMenu._data.replace_falsniperfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_falwoodfg = function(self, item)
		WacMenu._data.replace_falwoodfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_faltacgrip = function(self, item)
		WacMenu._data.replace_faltacgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_falmag = function(self, item)
		WacMenu._data.replace_falmag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_falextmag = function(self, item)
		WacMenu._data.replace_falextmag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sa58stock = function(self, item)
		WacMenu._data.replace_sa58stock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_falprs2stock = function(self, item)
		WacMenu._data.replace_falprs2stock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_falwoodenstock = function(self, item)
		WacMenu._data.replace_falwoodenstock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_falsingle = function(self, item)
		WacMenu._data.replace_falsingle = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_famaslongb = function(self, item)
		WacMenu._data.replace_famaslongb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_famasshortb = function(self, item)
		WacMenu._data.replace_famasshortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_famassniperb = function(self, item)
		WacMenu._data.replace_famassniperb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_famassuppb = function(self, item)
		WacMenu._data.replace_famassuppb = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_famasg1grip = function(self, item)
		WacMenu._data.replace_famasg1grip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_fnf2000longb = function(self, item)
		WacMenu._data.replace_fnf2000longb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_fnf2000stndb = function(self, item)
		WacMenu._data.replace_fnf2000stndb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_fnf2000flashhider = function(self, item)
		WacMenu._data.replace_fnf2000flashhider = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_fnf2000stndbody = function(self, item)
		WacMenu._data.replace_fnf2000stndbody = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_fnf2000tanbody = function(self, item)
		WacMenu._data.replace_fnf2000tanbody = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g3barrel = function(self, item)
		WacMenu._data.replace_g3barrel = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g3barreldmr = function(self, item)
		WacMenu._data.replace_g3barreldmr = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g3foregripprecision = function(self, item)
		WacMenu._data.replace_g3foregripprecision = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g3foregriptactical = function(self, item)
		WacMenu._data.replace_g3foregriptactical = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g3foregripwooden = function(self, item)
		WacMenu._data.replace_g3foregripwooden = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g3handguardplastic = function(self, item)
		WacMenu._data.replace_g3handguardplastic = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g3psg1grip = function(self, item)
		WacMenu._data.replace_g3psg1grip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g3retrogrip = function(self, item)
		WacMenu._data.replace_g3retrogrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g3sniperstock = function(self, item)
		WacMenu._data.replace_g3sniperstock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g3woodstock = function(self, item)
		WacMenu._data.replace_g3woodstock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g3psgforce = function(self, item)
		WacMenu._data.replace_g3psgforce = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g3single = function(self, item)
		WacMenu._data.replace_g3single = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g36cfg = function(self, item)
		WacMenu._data.replace_g36cfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g36rasfg = function(self, item)
		WacMenu._data.replace_g36rasfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g36fg = function(self, item)
		WacMenu._data.replace_g36fg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g36kvstock = function(self, item)
		WacMenu._data.replace_g36kvstock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g36sl8stock = function(self, item)
		WacMenu._data.replace_g36sl8stock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g36magpulassist = function(self, item)
		WacMenu._data.replace_g36magpulassist = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_galiltacfg = function(self, item)
		WacMenu._data.replace_galiltacfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_galilmicro = function(self, item)
		WacMenu._data.replace_galilmicro = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_galilsarfg = function(self, item)
		WacMenu._data.replace_galilsarfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_galatzfg = function(self, item)
		WacMenu._data.replace_galatzfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_galil_snipergrip = function(self, item)
		WacMenu._data.replace_galil_snipergrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_galiloldmicrost = function(self, item)
		WacMenu._data.replace_galiloldmicrost = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_galilplasticst = function(self, item)
		WacMenu._data.replace_galilplasticst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_galatzst = function(self, item)
		WacMenu._data.replace_galatzst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_galilwoodenst = function(self, item)
		WacMenu._data.replace_galilwoodenst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hk416longb = function(self, item)
		WacMenu._data.replace_hk416longb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hk416jpre = function(self, item)
		WacMenu._data.replace_hk416jpre = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hk416ccomp = function(self, item)
		WacMenu._data.replace_hk416ccomp = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_usehk416cgrip = function(self, item)
		WacMenu._data.replace_usehk416cgrip = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hk416ccmag = function(self, item)
		WacMenu._data.replace_hk416ccmag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hk416stock = function(self, item)
		WacMenu._data.replace_hk416stock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hk416cvertgrip = function(self, item)
		WacMenu._data.replace_hk416cvertgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hk417comp = function(self, item)
		WacMenu._data.replace_hk417comp = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hk417stndst = function(self, item)
		WacMenu._data.replace_hk417stndst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_l85longb = function(self, item)
		WacMenu._data.replace_l85longb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_l85shortb = function(self, item)
		WacMenu._data.replace_l85shortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_l85flashhider = function(self, item)
		WacMenu._data.replace_l85flashhider = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_l85railfg = function(self, item)
		WacMenu._data.replace_l85railfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_l85worngrip = function(self, item)
		WacMenu._data.replace_l85worngrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1a_ebr = function(self, item)
		WacMenu._data.replace_m1a_ebr = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1a_jagerstock = function(self, item)
		WacMenu._data.replace_m1a_jagerstock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1garand_shortb = function(self, item)
		WacMenu._data.replace_m1garand_shortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1garand_ammopouch = function(self, item)
		WacMenu._data.replace_m1garand_ammopouch = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4a1longb = function(self, item)
		WacMenu._data.replace_m4a1longb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4a1shortb = function(self, item)
		WacMenu._data.replace_m4a1shortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4a1dmrb = function(self, item)
		WacMenu._data.replace_m4a1dmrb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4a1suppb = function(self, item)
		WacMenu._data.replace_m4a1suppb = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4afterfg = function(self, item)
		WacMenu._data.replace_m4afterfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4compfg = function(self, item)
		WacMenu._data.replace_m4compfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4smrfg = function(self, item)
		WacMenu._data.replace_m4smrfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4lvoafg = function(self, item)
		WacMenu._data.replace_m4lvoafg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4moefg = function(self, item)
		WacMenu._data.replace_m4moefg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4a1stndgrip = function(self, item)
		WacMenu._data.replace_m4a1stndgrip = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4stanag20 = function(self, item)
		WacMenu._data.replace_m4stanag20 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4pmag = function(self, item)
		WacMenu._data.replace_m4pmag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4mag5 = function(self, item)
		WacMenu._data.replace_m4mag5 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4emag = function(self, item)
		WacMenu._data.replace_m4emag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4l5awm = function(self, item)
		WacMenu._data.replace_m4l5awm = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4stanagmagpul = function(self, item)
		WacMenu._data.replace_m4stanagmagpul = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4foldingst = function(self, item)
		WacMenu._data.replace_m4foldingst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4a1stock = function(self, item)
		WacMenu._data.replace_m4a1stock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4single = function(self, item)
		WacMenu._data.replace_m4single = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m16longb = function(self, item)
		WacMenu._data.replace_m16longb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m16dmrb = function(self, item)
		WacMenu._data.replace_m16dmrb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m16tacfg = function(self, item)
		WacMenu._data.replace_m16tacfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m16a1fg = function(self, item)
		WacMenu._data.replace_m16a1fg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m16ergofg = function(self, item)
		WacMenu._data.replace_m16ergofg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m16stndgrip = function(self, item)
		WacMenu._data.replace_m16stndgrip = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m16stanag30 = function(self, item)
		WacMenu._data.replace_m16stanag30 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m16pmag = function(self, item)
		WacMenu._data.replace_m16pmag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m16mag5 = function(self, item)
		WacMenu._data.replace_m16mag5 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m16emag = function(self, item)
		WacMenu._data.replace_m16emag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m16l5awm = function(self, item)
		WacMenu._data.replace_m16l5awm = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m16stanagmagpul = function(self, item)
		WacMenu._data.replace_m16stanagmagpul = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m16stock1 = function(self, item)
		WacMenu._data.replace_m16stock1 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m16single = function(self, item)
		WacMenu._data.replace_m16single = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m733fg = function(self, item)
		WacMenu._data.replace_m733fg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m733grip = function(self, item)
		WacMenu._data.replace_m733grip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m733stock = function(self, item)
		WacMenu._data.replace_m733stock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m733lower = function(self, item)
		WacMenu._data.replace_m733lower = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m733upper = function(self, item)
		WacMenu._data.replace_m733upper = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m733bolt = function(self, item)
		WacMenu._data.replace_m733bolt = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m733handle = function(self, item)
		WacMenu._data.replace_m733handle = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_scarhlongb = function(self, item)
		WacMenu._data.replace_scarhlongb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_scarhflashhider = function(self, item)
		WacMenu._data.replace_scarhflashhider = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_scarsrxrail = function(self, item)
		WacMenu._data.replace_scarsrxrail = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_scarhsnipstock = function(self, item)
		WacMenu._data.replace_scarhsnipstock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_scarhsingle = function(self, item)
		WacMenu._data.replace_scarhsingle = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sg552longb = function(self, item)
		WacMenu._data.replace_sg552longb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sg552enhfg = function(self, item)
		WacMenu._data.replace_sg552enhfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sg553railedfg = function(self, item)
		WacMenu._data.replace_sg553railedfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sg552grip = function(self, item)
		WacMenu._data.replace_sg552grip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sg552stock = function(self, item)
		WacMenu._data.replace_sg552stock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sg552receiver = function(self, item)
		WacMenu._data.replace_sg552receiver = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sg552blackreceiver = function(self, item)
		WacMenu._data.replace_sg552blackreceiver = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sub2kgen2fg = function(self, item)
		WacMenu._data.replace_sub2kgen2fg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sub2kgen2fgrec = function(self, item)
		WacMenu._data.replace_sub2kgen2fgrec = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sub2krailfg = function(self, item)
		WacMenu._data.replace_sub2krailfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sub2krailfgrec = function(self, item)
		WacMenu._data.replace_sub2krailfgrec = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sub2ksuppfgrec = function(self, item)
		WacMenu._data.replace_sub2ksuppfgrec = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sub2ksupp = function(self, item)
		WacMenu._data.replace_sub2ksupp = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_vhsshortb = function(self, item)
		WacMenu._data.replace_vhsshortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_vhslongb = function(self, item)
		WacMenu._data.replace_vhslongb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_vhsflashhider = function(self, item)
		WacMenu._data.replace_vhsflashhider = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_vhssuppb = function(self, item)
		WacMenu._data.replace_vhssuppb = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_vhsironsights = function(self, item)
		WacMenu._data.replace_vhsironsights = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_aa12b = function(self, item)
		WacMenu._data.replace_aa12b = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_aa12suppb = function(self, item)
		WacMenu._data.replace_aa12suppb = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_aa12single = function(self, item)
		WacMenu._data.replace_aa12single = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_bs09shortb = function(self, item)
		WacMenu._data.replace_bs09shortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_bs09shortst = function(self, item)
		WacMenu._data.replace_bs09shortst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_bs09ammopouch = function(self, item)
		WacMenu._data.replace_bs09ammopouch = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_cyresix12shortb = function(self, item)
		WacMenu._data.replace_cyresix12shortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_cyresix12suppb = function(self, item)
		WacMenu._data.replace_cyresix12suppb = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_doublebarrelstnd = function(self, item)
		WacMenu._data.replace_doublebarrelstnd = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_doublesawedoffb = function(self, item)
		WacMenu._data.replace_doublesawedoffb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_doublebarrelst = function(self, item)
		WacMenu._data.replace_doublebarrelst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_doublesawedoffst = function(self, item)
		WacMenu._data.replace_doublesawedoffst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ithaca37b = function(self, item)
		WacMenu._data.replace_ithaca37b = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ithaca37shortb = function(self, item)
		WacMenu._data.replace_ithaca37shortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ithaca37sawedoffst = function(self, item)
		WacMenu._data.replace_ithaca37sawedoffst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ksgshortb = function(self, item)
		WacMenu._data.replace_ksgshortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ksglongb = function(self, item)
		WacMenu._data.replace_ksglongb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ksgmbus = function(self, item)
		WacMenu._data.replace_ksgmbus = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1014nfab = function(self, item)
		WacMenu._data.replace_m1014nfab = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1014longb = function(self, item)
		WacMenu._data.replace_m1014longb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1014collapsedst = function(self, item)
		WacMenu._data.replace_m1014collapsedst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1014tacticalst = function(self, item)
		WacMenu._data.replace_m1014tacticalst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_r870zhpump = function(self, item)
		WacMenu._data.replace_r870zhpump = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_r870extmag = function(self, item)
		WacMenu._data.replace_r870extmag = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_r870stock1 = function(self, item)
		WacMenu._data.replace_r870stock1 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_r870stock2 = function(self, item)
		WacMenu._data.replace_r870stock2 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_r870stock3 = function(self, item)
		WacMenu._data.replace_r870stock3 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_shellrack = function(self, item)
		WacMenu._data.replace_shellrack = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_short870b = function(self, item)
		WacMenu._data.replace_short870b = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_short870extmag = function(self, item)
		WacMenu._data.replace_short870extmag = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_short870stock1 = function(self, item)
		WacMenu._data.replace_short870stock1 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_short870stock2 = function(self, item)
		WacMenu._data.replace_short870stock2 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_short870stock3 = function(self, item)
		WacMenu._data.replace_short870stock3 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_winchsxsshortb = function(self, item)
		WacMenu._data.replace_winchsxsshortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_winchsxsshortst = function(self, item)
		WacMenu._data.replace_winchsxsshortst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_s12kshortb = function(self, item)
		WacMenu._data.replace_s12kshortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_s12kfg = function(self, item)
		WacMenu._data.replace_s12kfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_s12ktacrail = function(self, item)
		WacMenu._data.replace_s12ktacrail = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_s12fuglystickcobra = function(self, item)
		WacMenu._data.replace_s12fuglystickcobra = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_s12kextmag = function(self, item)
		WacMenu._data.replace_s12kextmag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_s12kstock1 = function(self, item)
		WacMenu._data.replace_s12kstock1 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_s12kstock2 = function(self, item)
		WacMenu._data.replace_s12kstock2 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_s12kstock3 = function(self, item)
		WacMenu._data.replace_s12kstock3 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_s12kupperrec = function(self, item)
		WacMenu._data.replace_s12kupperrec = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_s12ksingle = function(self, item)
		WacMenu._data.replace_s12ksingle = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ironsightssaiga = function(self, item)
		WacMenu._data.replace_ironsightssaiga = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_spasfoldst = function(self, item)
		WacMenu._data.replace_spasfoldst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_spassolidst = function(self, item)
		WacMenu._data.replace_spassolidst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_spikex1saigashortfg = function(self, item)
		WacMenu._data.replace_spikex1saigashortfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_spikex1saigaextmag = function(self, item)
		WacMenu._data.replace_spikex1saigaextmag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_strikerlongb = function(self, item)
		WacMenu._data.replace_strikerlongb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ironsightsstriker = function(self, item)
		WacMenu._data.replace_ironsightsstriker = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_judgegrip = function(self, item)
		WacMenu._data.replace_judgegrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1887longb = function(self, item)
		WacMenu._data.replace_m1887longb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1887shortb = function(self, item)
		WacMenu._data.replace_m1887shortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1887casehardened = function(self, item)
		WacMenu._data.replace_m1887casehardened = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1887longst = function(self, item)
		WacMenu._data.replace_m1887longst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mosinm38barrel = function(self, item)
		WacMenu._data.replace_mosinm38barrel = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mosinm9130barrel = function(self, item)
		WacMenu._data.replace_mosinm9130barrel = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mosinblackstock = function(self, item)
		WacMenu._data.replace_mosinblackstock = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_msrlongb = function(self, item)
		WacMenu._data.replace_msrlongb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_msrbodyst = function(self, item)
		WacMenu._data.replace_msrbodyst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_msr_700body = function(self, item)
		WacMenu._data.replace_msr_700body = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_r93woodbody = function(self, item)
		WacMenu._data.replace_r93woodbody = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_srsshortb = function(self, item)
		WacMenu._data.replace_srsshortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_srslongb = function(self, item)
		WacMenu._data.replace_srslongb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_svdcomp = function(self, item)
		WacMenu._data.replace_svdcomp = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_svdpolymerfg = function(self, item)
		WacMenu._data.replace_svdpolymerfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_svdpolymerst = function(self, item)
		WacMenu._data.replace_svdpolymerst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ttitr1grip = function(self, item)
		WacMenu._data.replace_ttitr1grip = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ttitr1stock = function(self, item)
		WacMenu._data.replace_ttitr1stock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_wa2000longb = function(self, item)
		WacMenu._data.replace_wa2000longb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_wa2000lightgrip = function(self, item)
		WacMenu._data.replace_wa2000lightgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_wa2000stealthgrip = function(self, item)
		WacMenu._data.replace_wa2000stealthgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_wa2000walnutgrip = function(self, item)
		WacMenu._data.replace_wa2000walnutgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_winm1873longb = function(self, item)
		WacMenu._data.replace_winm1873longb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hk21elongb = function(self, item)
		WacMenu._data.replace_hk21elongb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hk21estndfg = function(self, item)
		WacMenu._data.replace_hk21estndfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hk21egrip = function(self, item)
		WacMenu._data.replace_hk21egrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m240shortb = function(self, item)
		WacMenu._data.replace_m240shortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m240plasticst = function(self, item)
		WacMenu._data.replace_m240plasticst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m249longbarrel = function(self, item)
		WacMenu._data.replace_m249longbarrel = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m249fg = function(self, item)
		WacMenu._data.replace_m249fg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m249_mk46fg = function(self, item)
		WacMenu._data.replace_m249_mk46fg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m249stock = function(self, item)
		WacMenu._data.replace_m249stock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m249bipod = function(self, item)
		WacMenu._data.replace_m249bipod = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mg32barrel = function(self, item)
		WacMenu._data.replace_mg32barrel = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mg42_dlt19 = function(self, item)
		WacMenu._data.replace_mg42_dlt19 = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_rpkforegrip = function(self, item)
		WacMenu._data.replace_rpkforegrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_rpkpbs1 = function(self, item)
		WacMenu._data.replace_rpkpbs1 = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_rpkdrum = function(self, item)
		WacMenu._data.replace_rpkdrum = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_rpkstock1 = function(self, item)
		WacMenu._data.replace_rpkstock1 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_rpkstock2 = function(self, item)
		WacMenu._data.replace_rpkstock2 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_rpkbipod = function(self, item)
		WacMenu._data.replace_rpkbipod = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_92fscomp1 = function(self, item)
		WacMenu._data.replace_92fscomp1 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_92fscomp2 = function(self, item)
		WacMenu._data.replace_92fscomp2 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_92fs_ipsccomp = function(self, item)
		WacMenu._data.replace_92fs_ipsccomp = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_92fs_meatgrinder = function(self, item)
		WacMenu._data.replace_92fs_meatgrinder = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_92fs_pisflash = function(self, item)
		WacMenu._data.replace_92fs_pisflash = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_92fsergogrip = function(self, item)
		WacMenu._data.replace_92fsergogrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_92fsengravedgrip = function(self, item)
		WacMenu._data.replace_92fsengravedgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_92fsextmag = function(self, item)
		WacMenu._data.replace_92fsextmag = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_92fselite2 = function(self, item)
		WacMenu._data.replace_92fselite2 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_1911aggressorcomp = function(self, item)
		WacMenu._data.replace_1911aggressorcomp = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_1911_ipsccomp = function(self, item)
		WacMenu._data.replace_1911_ipsccomp = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_1911_meatgrinder = function(self, item)
		WacMenu._data.replace_1911_meatgrinder = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_1911_pisflash = function(self, item)
		WacMenu._data.replace_1911_pisflash = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_1911ergogrip = function(self, item)
		WacMenu._data.replace_1911ergogrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_1911woodgrip = function(self, item)
		WacMenu._data.replace_1911woodgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_1911engravedgrip = function(self, item)
		WacMenu._data.replace_1911engravedgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_1911extmag = function(self, item)
		WacMenu._data.replace_1911extmag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_1911bigmag = function(self, item)
		WacMenu._data.replace_1911bigmag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_1911vent = function(self, item)
		WacMenu._data.replace_1911vent = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_1911ventlong = function(self, item)
		WacMenu._data.replace_1911ventlong = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_c96longb = function(self, item)
		WacMenu._data.replace_c96longb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_c96_dl44 = function(self, item)
		WacMenu._data.replace_c96_dl44 = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_c96extmag = function(self, item)
		WacMenu._data.replace_c96extmag = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_c96holster = function(self, item)
		WacMenu._data.replace_c96holster = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_coltdefblinggrip = function(self, item)
		WacMenu._data.replace_coltdefblinggrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_coltdefergogrip = function(self, item)
		WacMenu._data.replace_coltdefergogrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_coltdefextmag = function(self, item)
		WacMenu._data.replace_coltdefextmag = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_coltdefmilledsl = function(self, item)
		WacMenu._data.replace_coltdefmilledsl = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_coltbuntlineb = function(self, item)
		WacMenu._data.replace_coltbuntlineb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_coltssabling = function(self, item)
		WacMenu._data.replace_coltssabling = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_coltsaastock = function(self, item)
		WacMenu._data.replace_coltsaastock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_deaglestndb = function(self, item)
		WacMenu._data.replace_deaglestndb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_deaglelongb = function(self, item)
		WacMenu._data.replace_deaglelongb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_deaglel6b = function(self, item)
		WacMenu._data.replace_deaglel6b = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_deagleergogrip = function(self, item)
		WacMenu._data.replace_deagleergogrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_deagleblinggrip = function(self, item)
		WacMenu._data.replace_deagleblinggrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_deagleextmag = function(self, item)
		WacMenu._data.replace_deagleextmag = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_fsnitrideb = function(self, item)
		WacMenu._data.replace_fsnitrideb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_fsextmag = function(self, item)
		WacMenu._data.replace_fsextmag = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_glockcomp2 = function(self, item)
		WacMenu._data.replace_glockcomp2 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_glockextmag = function(self, item)
		WacMenu._data.replace_glockextmag = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g18c_glr440 = function(self, item)
		WacMenu._data.replace_g18c_glr440 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g18csingle = function(self, item)
		WacMenu._data.replace_g18csingle = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g22clong = function(self, item)
		WacMenu._data.replace_g22clong = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g26bodytan = function(self, item)
		WacMenu._data.replace_g26bodytan = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g26magtan = function(self, item)
		WacMenu._data.replace_g26magtan = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g26ext = function(self, item)
		WacMenu._data.replace_g26ext = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g26slidetan = function(self, item)
		WacMenu._data.replace_g26slidetan = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hs2kextmag = function(self, item)
		WacMenu._data.replace_hs2kextmag = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hs2kcustom = function(self, item)
		WacMenu._data.replace_hs2kcustom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hs2klong = function(self, item)
		WacMenu._data.replace_hs2klong = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_jericho941comp = function(self, item)
		WacMenu._data.replace_jericho941comp = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_jericho941grip = function(self, item)
		WacMenu._data.replace_jericho941grip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_jericho941body = function(self, item)
		WacMenu._data.replace_jericho941body = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_lugerp08_reinforcedb = function(self, item)
		WacMenu._data.replace_lugerp08_reinforcedb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_lugerp08_shortb = function(self, item)
		WacMenu._data.replace_lugerp08_shortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m2006shortb = function(self, item)
		WacMenu._data.replace_m2006shortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m2006mediumb = function(self, item)
		WacMenu._data.replace_m2006mediumb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m2006longb = function(self, item)
		WacMenu._data.replace_m2006longb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m2006blinggrip = function(self, item)
		WacMenu._data.replace_m2006blinggrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_p7threadb = function(self, item)
		WacMenu._data.replace_p7threadb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_p7gripwood = function(self, item)
		WacMenu._data.replace_p7gripwood = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_p30lwickcomp = function(self, item)
		WacMenu._data.replace_p30lwickcomp = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_p30lwickcompsupp = function(self, item)
		WacMenu._data.replace_p30lwickcompsupp = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_p30lextmag = function(self, item)
		WacMenu._data.replace_p30lextmag = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_p30lfibersights = function(self, item)
		WacMenu._data.replace_p30lfibersights = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_p226rcomp2 = function(self, item)
		WacMenu._data.replace_p226rcomp2 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_p226rergogrip = function(self, item)
		WacMenu._data.replace_p226rergogrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_p226extmag = function(self, item)
		WacMenu._data.replace_p226extmag = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_p226requinox = function(self, item)
		WacMenu._data.replace_p226requinox = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_p226rlong = function(self, item)
		WacMenu._data.replace_p226rlong = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_pl14protob = function(self, item)
		WacMenu._data.replace_pl14protob = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_pl14extmag = function(self, item)
		WacMenu._data.replace_pl14extmag = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ragingstndb = function(self, item)
		WacMenu._data.replace_ragingstndb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ragingcomp1 = function(self, item)
		WacMenu._data.replace_ragingcomp1 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ragingshort = function(self, item)
		WacMenu._data.replace_ragingshort = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ragingcomp2 = function(self, item)
		WacMenu._data.replace_ragingcomp2 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_raginglong = function(self, item)
		WacMenu._data.replace_raginglong = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_rageergogrip = function(self, item)
		WacMenu._data.replace_rageergogrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_rageslim = function(self, item)
		WacMenu._data.replace_rageslim = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_swm29_devilb = function(self, item)
		WacMenu._data.replace_swm29_devilb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_swm29_blackgrip = function(self, item)
		WacMenu._data.replace_swm29_blackgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_swm29_ripgrip = function(self, item)
		WacMenu._data.replace_swm29_ripgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_uspcomp2 = function(self, item)
		WacMenu._data.replace_uspcomp2 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_uspextmag = function(self, item)
		WacMenu._data.replace_uspextmag = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_uspexpert = function(self, item)
		WacMenu._data.replace_uspexpert = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_uspmatch = function(self, item)
		WacMenu._data.replace_uspmatch = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_walterpplasergrip = function(self, item)
		WacMenu._data.replace_walterpplasergrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_walterppslide = function(self, item)
		WacMenu._data.replace_walterppslide = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmsupbs1 = function(self, item)
		WacMenu._data.replace_akmsupbs1 = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmsurail = function(self, item)
		WacMenu._data.replace_akmsurail = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmsuzenit = function(self, item)
		WacMenu._data.replace_akmsuzenit = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmsuquad = function(self, item)
		WacMenu._data.replace_akmsuquad = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmsuuspalm = function(self, item)
		WacMenu._data.replace_akmsuuspalm = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmsumagpulassist = function(self, item)
		WacMenu._data.replace_akmsumagpulassist = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmsustock1 = function(self, item)
		WacMenu._data.replace_akmsustock1 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmsustock2 = function(self, item)
		WacMenu._data.replace_akmsustock2 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmsustock3 = function(self, item)
		WacMenu._data.replace_akmsustock3 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmsuupperrec = function(self, item)
		WacMenu._data.replace_akmsuupperrec = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akmsusingle = function(self, item)
		WacMenu._data.replace_akmsusingle = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_cobraybarrelext = function(self, item)
		WacMenu._data.replace_cobraybarrelext = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_cobraywerbellssup = function(self, item)
		WacMenu._data.replace_cobraywerbellssup = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m119stock = function(self, item)
		WacMenu._data.replace_m119stock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m119receiver = function(self, item)
		WacMenu._data.replace_m119receiver = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m11980s = function(self, item)
		WacMenu._data.replace_m11980s = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_cz805stndb = function(self, item)
		WacMenu._data.replace_cz805stndb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_cz805shortb = function(self, item)
		WacMenu._data.replace_cz805shortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_cz805medb = function(self, item)
		WacMenu._data.replace_cz805medb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_cz805vertgrip = function(self, item)
		WacMenu._data.replace_cz805vertgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_cz805flashhider = function(self, item)
		WacMenu._data.replace_cz805flashhider = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_cz805st = function(self, item)
		WacMenu._data.replace_cz805st = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_cz805single = function(self, item)
		WacMenu._data.replace_cz805single = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_k23medimumb = function(self, item)
		WacMenu._data.replace_k23medimumb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_k23railfg = function(self, item)
		WacMenu._data.replace_k23railfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_k23afterfg = function(self, item)
		WacMenu._data.replace_k23afterfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_k23_m4a1sight = function(self, item)
		WacMenu._data.replace_k23_m4a1sight = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_k23stock1 = function(self, item)
		WacMenu._data.replace_k23stock1 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_k23stock2 = function(self, item)
		WacMenu._data.replace_k23stock2 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_k23x_st = function(self, item)
		WacMenu._data.replace_k23x_st = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_l2a1longb = function(self, item)
		WacMenu._data.replace_l2a1longb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_l2a1shortb = function(self, item)
		WacMenu._data.replace_l2a1shortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_l2a1supp = function(self, item)
		WacMenu._data.replace_l2a1supp = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_l2a1extmag = function(self, item)
		WacMenu._data.replace_l2a1extmag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_l2a1smallmag = function(self, item)
		WacMenu._data.replace_l2a1smallmag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_l2a1solidstock = function(self, item)
		WacMenu._data.replace_l2a1solidstock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_l2a1x_st = function(self, item)
		WacMenu._data.replace_l2a1x_st = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m45ergogrip = function(self, item)
		WacMenu._data.replace_m45ergogrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m45extmag = function(self, item)
		WacMenu._data.replace_m45extmag = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hidem45bparts = function(self, item)
		WacMenu._data.replace_hidem45bparts = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m45stndst = function(self, item)
		WacMenu._data.replace_m45stndst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m45foldst = function(self, item)
		WacMenu._data.replace_m45foldst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m45x_st = function(self, item)
		WacMenu._data.replace_m45x_st = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1928a1longb = function(self, item)
		WacMenu._data.replace_m1928a1longb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1928a1fg = function(self, item)
		WacMenu._data.replace_m1928a1fg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1928a1blackfg = function(self, item)
		WacMenu._data.replace_m1928a1blackfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1928a1grip = function(self, item)
		WacMenu._data.replace_m1928a1grip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1928a1blackgrip = function(self, item)
		WacMenu._data.replace_m1928a1blackgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1928a1st = function(self, item)
		WacMenu._data.replace_m1928a1st = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1928a1blackst = function(self, item)
		WacMenu._data.replace_m1928a1blackst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1928a1slingst = function(self, item)
		WacMenu._data.replace_m1928a1slingst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m1928a1x_st = function(self, item)
		WacMenu._data.replace_m1928a1x_st = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mac10barrelext = function(self, item)
		WacMenu._data.replace_mac10barrelext = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mac10werbellssup = function(self, item)
		WacMenu._data.replace_mac10werbellssup = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mac10riskit = function(self, item)
		WacMenu._data.replace_mac10riskit = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mac10extmag = function(self, item)
		WacMenu._data.replace_mac10extmag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mac10magpulassist = function(self, item)
		WacMenu._data.replace_mac10magpulassist = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mac10skelst = function(self, item)
		WacMenu._data.replace_mac10skelst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mac10_stndst = function(self, item)
		WacMenu._data.replace_mac10_stndst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_muzismallsupp = function(self, item)
		WacMenu._data.replace_muzismallsupp = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_muzilongsupp = function(self, item)
		WacMenu._data.replace_muzilongsupp = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_microuzicomp = function(self, item)
		WacMenu._data.replace_microuzicomp = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_microuzisupp = function(self, item)
		WacMenu._data.replace_microuzisupp = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_microuzifoldedst = function(self, item)
		WacMenu._data.replace_microuzifoldedst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_microuzinost = function(self, item)
		WacMenu._data.replace_microuzinost = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_microuzinunfoldst = function(self, item)
		WacMenu._data.replace_microuzinunfoldst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_microuzix_st = function(self, item)
		WacMenu._data.replace_microuzix_st = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp5sd = function(self, item)
		WacMenu._data.replace_mp5sd = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp5kfg = function(self, item)
		WacMenu._data.replace_mp5kfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp5a5fg = function(self, item)
		WacMenu._data.replace_mp5a5fg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp5surefire628 = function(self, item)
		WacMenu._data.replace_mp5surefire628 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp5mag = function(self, item)
		WacMenu._data.replace_mp5mag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp5_10mag = function(self, item)
		WacMenu._data.replace_mp5_10mag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp5a3st = function(self, item)
		WacMenu._data.replace_mp5a3st = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp5kcap = function(self, item)
		WacMenu._data.replace_mp5kcap = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp5pdwst = function(self, item)
		WacMenu._data.replace_mp5pdwst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_xmp5kcap = function(self, item)
		WacMenu._data.replace_xmp5kcap = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp7qd = function(self, item)
		WacMenu._data.replace_mp7qd = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp7stndmag = function(self, item)
		WacMenu._data.replace_mp7stndmag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp7extmag = function(self, item)
		WacMenu._data.replace_mp7extmag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp7foldst = function(self, item)
		WacMenu._data.replace_mp7foldst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp7vertgrip = function(self, item)
		WacMenu._data.replace_mp7vertgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp9supp = function(self, item)
		WacMenu._data.replace_mp9supp = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp9stndmag = function(self, item)
		WacMenu._data.replace_mp9stndmag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp9extmag = function(self, item)
		WacMenu._data.replace_mp9extmag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp9stndst = function(self, item)
		WacMenu._data.replace_mp9stndst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp9skeletalst = function(self, item)
		WacMenu._data.replace_mp9skeletalst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp40flashhider = function(self, item)
		WacMenu._data.replace_mp40flashhider = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp40_foldedst = function(self, item)
		WacMenu._data.replace_mp40_foldedst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_mp40x_st = function(self, item)
		WacMenu._data.replace_mp40x_st = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_p90longb = function(self, item)
		WacMenu._data.replace_p90longb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_p90civb = function(self, item)
		WacMenu._data.replace_p90civb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_p90ninjab = function(self, item)
		WacMenu._data.replace_p90ninjab = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_p90strap = function(self, item)
		WacMenu._data.replace_p90strap = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ironsightsp90 = function(self, item)
		WacMenu._data.replace_ironsightsp90 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_pp19pbs1 = function(self, item)
		WacMenu._data.replace_pp19pbs1 = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_pp19flashhider = function(self, item)
		WacMenu._data.replace_pp19flashhider = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_pp19stndgrip = function(self, item)
		WacMenu._data.replace_pp19stndgrip = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sigmpxflashhider = function(self, item)
		WacMenu._data.replace_sigmpxflashhider = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sigmpxk_handguard = function(self, item)
		WacMenu._data.replace_sigmpxk_handguard = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sigmpx_stnd_st = function(self, item)
		WacMenu._data.replace_sigmpx_stnd_st = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sigmpx_st_removed = function(self, item)
		WacMenu._data.replace_sigmpx_st_removed = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sigmpxstock = function(self, item)
		WacMenu._data.replace_sigmpxstock = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sigmpx_akimbo_st = function(self, item)
		WacMenu._data.replace_sigmpx_akimbo_st = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sr2msupp = function(self, item)
		WacMenu._data.replace_sr2msupp = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sr2unfoldst = function(self, item)
		WacMenu._data.replace_sr2unfoldst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sr2magpulassist = function(self, item)
		WacMenu._data.replace_sr2magpulassist = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_tec9_ab10 = function(self, item)
		WacMenu._data.replace_tec9_ab10 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_tec9longb = function(self, item)
		WacMenu._data.replace_tec9longb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_tec9extmag = function(self, item)
		WacMenu._data.replace_tec9extmag = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_tec9stock = function(self, item)
		WacMenu._data.replace_tec9stock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_usc45b = function(self, item)
		WacMenu._data.replace_usc45b = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ump45supp = function(self, item)
		WacMenu._data.replace_ump45supp = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ump45extmag = function(self, item)
		WacMenu._data.replace_ump45extmag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ump45shortmag = function(self, item)
		WacMenu._data.replace_ump45shortmag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_usc45st = function(self, item)
		WacMenu._data.replace_usc45st = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ump45foldedst = function(self, item)
		WacMenu._data.replace_ump45foldedst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ump45x_st = function(self, item)
		WacMenu._data.replace_ump45x_st = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ump45m900 = function(self, item)
		WacMenu._data.replace_ump45m900 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ump45single = function(self, item)
		WacMenu._data.replace_ump45single = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_uzisuppb = function(self, item)
		WacMenu._data.replace_uzisuppb = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_uzitacfg = function(self, item)
		WacMenu._data.replace_uzitacfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_uzix_removevg = function(self, item)
		WacMenu._data.replace_uzix_removevg = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_uziergostock = function(self, item)
		WacMenu._data.replace_uziergostock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_uzisolidstock = function(self, item)
		WacMenu._data.replace_uzisolidstock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_uzifoldstock = function(self, item)
		WacMenu._data.replace_uzifoldstock = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_uzix_st = function(self, item)
		WacMenu._data.replace_uzix_st = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_vectorcrb_model = function(self, item)
		WacMenu._data.replace_vectorcrb_model = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_vectorcrb = function(self, item)
		WacMenu._data.replace_vectorcrb = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_vectorhps = function(self, item)
		WacMenu._data.replace_vectorhps = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_vectorstock = function(self, item)
		WacMenu._data.replace_vectorstock = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_vectorvertgrip = function(self, item)
		WacMenu._data.replace_vectorvertgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_vz61suppb = function(self, item)
		WacMenu._data.replace_vz61suppb = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_vz61ergo = function(self, item)
		WacMenu._data.replace_vz61ergo = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_vz61woodgrip = function(self, item)
		WacMenu._data.replace_vz61woodgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_vz61extmag = function(self, item)
		WacMenu._data.replace_vz61extmag = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_vz61nost = function(self, item)
		WacMenu._data.replace_vz61nost = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_vz61unfoldst = function(self, item)
		WacMenu._data.replace_vz61unfoldst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_chinasawoffst = function(self, item)
		WacMenu._data.replace_chinasawoffst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m320_nosight = function(self, item)
		WacMenu._data.replace_m320_nosight = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m320_vertgrip = function(self, item)
		WacMenu._data.replace_m320_vertgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_longbowexplosive = function(self, item)
		WacMenu._data.replace_longbowexplosive = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m79sawoffb = function(self, item)
		WacMenu._data.replace_m79sawoffb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m79sawoffst = function(self, item)
		WacMenu._data.replace_m79sawoffst = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m79disablesight = function(self, item)
		WacMenu._data.replace_m79disablesight = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m134aab = function(self, item)
		WacMenu._data.replace_m134aab = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m134shortb = function(self, item)
		WacMenu._data.replace_m134shortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ove9ksilentmotor = function(self, item)
		WacMenu._data.replace_ove9ksilentmotor = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ove9kbainmotor = function(self, item)
		WacMenu._data.replace_ove9kbainmotor = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ovk9kdurableblade = function(self, item)
		WacMenu._data.replace_ovk9kdurableblade = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ovk9ksharpblade = function(self, item)
		WacMenu._data.replace_ovk9ksharpblade = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_xm25comp = function(self, item)
		WacMenu._data.replace_xm25comp = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_xm25longb = function(self, item)
		WacMenu._data.replace_xm25longb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_xm556stndb = function(self, item)
		WacMenu._data.replace_xm556stndb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_xm556longheatb = function(self, item)
		WacMenu._data.replace_xm556longheatb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_xm556shortheatb = function(self, item)
		WacMenu._data.replace_xm556shortheatb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_xm556shortb = function(self, item)
		WacMenu._data.replace_xm556shortb = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akwoodrail = function(self, item)
		WacMenu._data.replace_akwoodrail = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_aktacfg = function(self, item)
		WacMenu._data.replace_aktacfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_aklightfg = function(self, item)
		WacMenu._data.replace_aklightfg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akkrebs = function(self, item)
		WacMenu._data.replace_akkrebs = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_aktrax = function(self, item)
		WacMenu._data.replace_aktrax = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akhgrip = function(self, item)
		WacMenu._data.replace_akhgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akpgrip = function(self, item)
		WacMenu._data.replace_akpgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akwgrip = function(self, item)
		WacMenu._data.replace_akwgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_akrk3grip = function(self, item)
		WacMenu._data.replace_akrk3grip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15sniper = function(self, item)
		WacMenu._data.replace_ar15sniper = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15hgrip = function(self, item)
		WacMenu._data.replace_ar15hgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15mgrip = function(self, item)
		WacMenu._data.replace_ar15mgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15corelower = function(self, item)
		WacMenu._data.replace_ar15corelower = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15_30rndstanag = function(self, item)
		WacMenu._data.replace_ar15_30rndstanag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15_20rndstanag = function(self, item)
		WacMenu._data.replace_ar15_20rndstanag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15_pmag = function(self, item)
		WacMenu._data.replace_ar15_pmag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15_mag5 = function(self, item)
		WacMenu._data.replace_ar15_mag5 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15_emag = function(self, item)
		WacMenu._data.replace_ar15_emag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15_l5 = function(self, item)
		WacMenu._data.replace_ar15_l5 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15_magpulassiststanag = function(self, item)
		WacMenu._data.replace_ar15_magpulassiststanag = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_keep_frontpost = function(self, item)
		WacMenu._data.replace_keep_frontpost = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4_s_ubr = function(self, item)
		WacMenu._data.replace_m4_s_ubr = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4_s_mk46 = function(self, item)
		WacMenu._data.replace_m4_s_mk46 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m4_s_crane = function(self, item)
		WacMenu._data.replace_m4_s_crane = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15roundupper = function(self, item)
		WacMenu._data.replace_ar15roundupper = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15roundbolt = function(self, item)
		WacMenu._data.replace_ar15roundbolt = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15roundhandle = function(self, item)
		WacMenu._data.replace_ar15roundhandle = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15vltorupper = function(self, item)
		WacMenu._data.replace_ar15vltorupper = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15vltorbolt = function(self, item)
		WacMenu._data.replace_ar15vltorbolt = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15vltorhandle = function(self, item)
		WacMenu._data.replace_ar15vltorhandle = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15baliosupper = function(self, item)
		WacMenu._data.replace_ar15baliosupper = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15baliosbolt = function(self, item)
		WacMenu._data.replace_ar15baliosbolt = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15balioshandle = function(self, item)
		WacMenu._data.replace_ar15balioshandle = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15coreupper = function(self, item)
		WacMenu._data.replace_ar15coreupper = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15corebolt = function(self, item)
		WacMenu._data.replace_ar15corebolt = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ar15corehandle = function(self, item)
		WacMenu._data.replace_ar15corehandle = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_jprifles = function(self, item)
		WacMenu._data.replace_jprifles = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_firepig = function(self, item)
		WacMenu._data.replace_firepig = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_linear = function(self, item)
		WacMenu._data.replace_linear = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_stubby = function(self, item)
		WacMenu._data.replace_stubby = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_surefire = function(self, item)
		WacMenu._data.replace_surefire = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_selectablebarrelext = function(self, item)
		WacMenu._data.replace_selectablebarrelext = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_selectablebarrelext2 = function(self, item)
		WacMenu._data.replace_selectablebarrelext2 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_kingbreach = function(self, item)
		WacMenu._data.replace_kingbreach = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_sharkbrake = function(self, item)
		WacMenu._data.replace_sharkbrake = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_duckbill = function(self, item)
		WacMenu._data.replace_duckbill = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_pisflashhider = function(self, item)
		WacMenu._data.replace_pisflashhider = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_pistenderizer = function(self, item)
		WacMenu._data.replace_pistenderizer = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ipsccomp = function(self, item)
		WacMenu._data.replace_ipsccomp = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hidebarrelextarsmg = function(self, item)
		WacMenu._data.replace_hidebarrelextarsmg = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hidebarrelextsh = function(self, item)
		WacMenu._data.replace_hidebarrelextsh = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hidebarrelextpis = function(self, item)
		WacMenu._data.replace_hidebarrelextpis = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hidebarrelextunique = function(self, item)
		WacMenu._data.replace_hidebarrelextunique = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_compactlaser = function(self, item)
		WacMenu._data.replace_compactlaser = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_peq15 = function(self, item)
		WacMenu._data.replace_peq15 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_utg = function(self, item)
		WacMenu._data.replace_utg = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_x400v = function(self, item)
		WacMenu._data.replace_x400v = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_cmr201 = function(self, item)
		WacMenu._data.replace_cmr201 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_m3x = function(self, item)
		WacMenu._data.replace_m3x = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_glockcrimsonlaser = function(self, item)
		WacMenu._data.replace_glockcrimsonlaser = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_glockgripcytec = function(self, item)
		WacMenu._data.replace_glockgripcytec = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_glockgriphogue = function(self, item)
		WacMenu._data.replace_glockgriphogue = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hidemarksman = function(self, item)
		WacMenu._data.replace_hidemarksman = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_arsupp_bigger = function(self, item)
		WacMenu._data.replace_arsupp_bigger = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_arsupp_medium = function(self, item)
		WacMenu._data.replace_arsupp_medium = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_arsupp_lowprofile = function(self, item)
		WacMenu._data.replace_arsupp_lowprofile = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_salvo12 = function(self, item)
		WacMenu._data.replace_salvo12 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_shotsupp_silent = function(self, item)
		WacMenu._data.replace_shotsupp_silent = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_pis_medium_slim = function(self, item)
		WacMenu._data.replace_pis_medium_slim = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_pis_large_kac = function(self, item)
		WacMenu._data.replace_pis_large_kac = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_snakesupp = function(self, item)
		WacMenu._data.replace_snakesupp = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_pis_medium_gem = function(self, item)
		WacMenu._data.replace_pis_medium_gem = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_pis_small = function(self, item)
		WacMenu._data.replace_pis_small = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_selectablesupp = function(self, item)
		WacMenu._data.replace_selectablesupp = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_selectablesupp2 = function(self, item)
		WacMenu._data.replace_selectablesupp2 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hidesuppressors = function(self, item)
		WacMenu._data.replace_hidesuppressors = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hidesuppbarrels = function(self, item)
		WacMenu._data.replace_hidesuppbarrels = (item:value() == "on" and true or false)
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_hidesuppressorscomp = function(self, item)
		WacMenu._data.replace_hidesuppressorscomp = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_specter_zoom = function(self, item)
		WacMenu._data.replace_specter_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_aimpoint_zoom = function(self, item)
		WacMenu._data.replace_aimpoint_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_docter_zoom = function(self, item)
		WacMenu._data.replace_docter_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_eotech_zoom = function(self, item)
		WacMenu._data.replace_eotech_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_t1micro_zoom = function(self, item)
		WacMenu._data.replace_t1micro_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_cmore_zoom = function(self, item)
		WacMenu._data.replace_cmore_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_acog_zoom = function(self, item)
		WacMenu._data.replace_acog_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_eotech_xps_zoom = function(self, item)
		WacMenu._data.replace_eotech_xps_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_reflex_zoom = function(self, item)
		WacMenu._data.replace_reflex_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_rx01_zoom = function(self, item)
		WacMenu._data.replace_rx01_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_rx30_zoom = function(self, item)
		WacMenu._data.replace_rx30_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_cs_zoom = function(self, item)
		WacMenu._data.replace_cs_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_spot_zoom = function(self, item)
		WacMenu._data.replace_spot_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_g36zf_zoom = function(self, item)
		WacMenu._data.replace_g36zf_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_ta648_zoom = function(self, item)
		WacMenu._data.replace_ta648_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_uh1_zoom = function(self, item)
		WacMenu._data.replace_uh1_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_di_fc1_zoom = function(self, item)
		WacMenu._data.replace_di_fc1_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_rmr_zoom = function(self, item)
		WacMenu._data.replace_rmr_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_shieldrms_zoom = function(self, item)
		WacMenu._data.replace_shieldrms_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_p1_zoom = function(self, item)
		WacMenu._data.replace_p1_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_45delta_zoom = function(self, item)
		WacMenu._data.replace_45delta_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_45t1micro_zoom = function(self, item)
		WacMenu._data.replace_45t1micro_zoom = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_afg2 = function(self, item)
		WacMenu._data.replace_afg2 = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_stubbygrip = function(self, item)
		WacMenu._data.replace_stubbygrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_replace_vertgrip = function(self, item)
		WacMenu._data.replace_vertgrip = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_weaponnames = function(self, item)
		WacMenu._data.weaponnames = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_pd2weaponnames = function(self, item)
		WacMenu._data.pd2weaponnames = item:value()
		WacMenu:Save()
	end
	MenuCallbackHandler.callback_toggle_fixes = function(self, item)
		WacMenu._data.fixes = item:value()
		WacMenu:Save()
	end
	if WacMenu._data.fixes == nil then
		WacMenu._data.fixes = true
		WacMenu:Save()
	end
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/wacmenu.txt", WacMenu, WacMenu._data)
if WacMenu._data.weaponnames == 2 then
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/wacmenu_ar.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/ak5.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/ak12.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/ak74.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/akm.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/akmgold.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/asval.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/aug.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/m733.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/fal.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/famas.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/fnf2000.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/scarh.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/galil.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/hk416c.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/hk417.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/g3.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/g36.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/l85.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/m1a.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/m1garand.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/m4a1.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/m16a4.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/sg552.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/sub2000.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/vhs.txt", WacMenu, WacMenu._data)

	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/wacmenu_sh.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/aa12.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/bs09.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/cyresix12.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/doublebarrel.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/ithaca37.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/ksg.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/m1014.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/870.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/short870.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/winchsxs.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/saiga.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/spas.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/spikex1saiga.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/striker.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/taurus4510.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/m1887.txt", WacMenu, WacMenu._data)

	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/wacmenu_sr.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sr/mosin.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sr/msr.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sr/r93.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sr/ttitr1.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sr/srs.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sr/svd.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sr/wa2000.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sr/winchesterm1873.txt", WacMenu, WacMenu._data)

	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/wacmenu_lmg.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/lmg/m240.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/lmg/m249.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/lmg/hk21e.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/lmg/mg42.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/lmg/rpk.txt", WacMenu, WacMenu._data)

	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/wacmenu_pis.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/1911.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/92fs.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/c96.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/coltdef.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/deagle.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/fs.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/g18c.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/g22c.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/g26.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/p7.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/p30l.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/usp.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/hs2k.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/jericho941.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/lugerp08.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/mateba.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/p226r.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/pl14.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/ragingbull.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/coltssa.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/swm29.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/waltherppk.txt", WacMenu, WacMenu._data)

	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/wacmenu_smg.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/akmsu.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/cobraym11.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/cz805.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/p90.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/mp5.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/mp7.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/ump45.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/k23.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/l2a1.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/m45.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/m1928a1.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/mac10.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/microuzi.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/mp9.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/mp40.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/pp19.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/sigmpx.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/sr2.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/tec9.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/uzi.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/vector.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/vz61.txt", WacMenu, WacMenu._data)

	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/wacmenu_spec.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/spec/chinalake.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/spec/m320.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/spec/englongbow.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/spec/m134.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/spec/m79.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/spec/ove9000.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/spec/xm25.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/spec/xm556.txt", WacMenu, WacMenu._data)
else
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/wacmenu_ar.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/ak5.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/ak12.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/ak74.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/akm.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/akmgold.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/m733.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/m16a4.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/hk416c.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/m4a1.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/sub2000.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/famas.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/sg552.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/scarh.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/fal.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/m1garand.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/galil.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/g3.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/g36.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/vhs.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/hk417.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/m1a.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/l85.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/aug.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/fnf2000.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/ar/asval.txt", WacMenu, WacMenu._data)

	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/wacmenu_sh.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/m1887.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/winchsxs.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/spikex1saiga.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/cyresix12.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/ithaca37.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/saiga.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/bs09.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/short870.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/m1014.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/doublebarrel.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/spas.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/ksg.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/870.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/aa12.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/striker.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sh/taurus4510.txt", WacMenu, WacMenu._data)

	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/wacmenu_sr.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sr/ttitr1.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sr/srs.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sr/svd.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sr/wa2000.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sr/mosin.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sr/r93.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sr/msr.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/sr/winchesterm1873.txt", WacMenu, WacMenu._data)

	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/wacmenu_lmg.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/lmg/hk21e.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/lmg/mg42.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/lmg/m249.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/lmg/m240.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/lmg/rpk.txt", WacMenu, WacMenu._data)

	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/wacmenu_pis.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/fs.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/jericho941.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/92fs.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/ragingbull.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/c96.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/swm29.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/g26.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/g22c.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/p30l.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/1911.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/coltdef.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/deagle.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/waltherppk.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/usp.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/hs2k.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/mateba.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/p7.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/lugerp08.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/coltssa.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/p226r.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/g18c.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/pis/pl14.txt", WacMenu, WacMenu._data)

	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/wacmenu_smg.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/tec9.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/m1928a1.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/mp9.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/vz61.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/mp5.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/cz805.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/sr2.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/ump45.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/cobraym11.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/p90.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/akmsu.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/vector.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/mac10.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/microuzi.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/mp40.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/k23.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/l2a1.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/mp7.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/sigmpx.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/m45.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/pp19.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/smg/uzi.txt", WacMenu, WacMenu._data)

	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/wacmenu_spec.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/spec/xm25.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/spec/chinalake.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/spec/m320.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/spec/englongbow.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/spec/m79.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/spec/ove9000.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/spec/m134.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/spec/xm556.txt", WacMenu, WacMenu._data)
end
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/wacmenu_attch.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/attch/ak.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/attch/ar15.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/attch/barrelext.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/attch/gadget.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/attch/pis.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/attch/sight.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/attch/supp.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/attch/vertgrip.txt", WacMenu, WacMenu._data)
	MenuHelper:LoadFromJsonFile(WacMenu._path .. "Menu/wacmenu_misc.txt", WacMenu, WacMenu._data)
end)
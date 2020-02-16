_G.BasicVoices9 = _G.BasicVoices9 or {}
BasicVoices9._path = ModPath
BasicVoices9._data = {}

function BasicVoices9:Play(soundfile)
	if Utils:IsInHeist() and Utils:IsInCustody() == false and Utils:IsInGameState() then
		managers.player:local_player():sound():say(soundfile,true,true)
	end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_BasicVoices9", function(loc)
	loc:load_localization_file(BasicVoices9._path .. "en.txt")
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_BasicVoices9", function(menu_manager)
----------------------------------------------------- All the sounds
	BasicVoices9.cn1intruder = function(self)
		BasicVoices9:Play("l1n_a08")
	end	
	BasicVoices9.cn1ammo = function(self)
		BasicVoices9:Play("l1n_amm")
	end	
	BasicVoices9.cn1fire = function(self)
		BasicVoices9:Play("l1n_att")
	end	
	BasicVoices9.cn1bak = function(self)
		BasicVoices9:Play("l1n_bak")
	end	
	BasicVoices9.cn1burndeath = function(self)
		BasicVoices9:Play("l1n_burndeath")
	end	
	BasicVoices9.cn1burnhurt = function(self)
		BasicVoices9:Play("l1n_burnhurt")
	end	
	BasicVoices9.cn1contact = function(self)
		BasicVoices9:Play("l1n_c01")
	end	
	BasicVoices9.cn1mines = function(self)
		BasicVoices9:Play("l1n_ch1")
	end	
	BasicVoices9.cn1sentry = function(self)
		BasicVoices9:Play("l1n_ch2")
	end	
	BasicVoices9.cn1ecm = function(self)
		BasicVoices9:Play("l1n_ch3")
	end	
	BasicVoices9.cn1saw = function(self)
		BasicVoices9:Play("l1n_ch4")
	end	
	BasicVoices9.cn1hostages1 = function(self)
		BasicVoices9:Play("l1n_civ")
	end	
	BasicVoices9.cn1hostages2 = function(self)
		BasicVoices9:Play("l1n_p01")
	end	
	BasicVoices9.cn1hostages3 = function(self)
		BasicVoices9:Play("l1n_p02")
	end	
	BasicVoices9.cn1hostages4 = function(self)
		BasicVoices9:Play("l1n_p03")
	end	
	BasicVoices9.cn1clear = function(self)
		BasicVoices9:Play("l1n_clr")
	end	
	BasicVoices9.cn1domination = function(self)
		BasicVoices9:Play("l1n_s01x")
	end	
	BasicVoices9.cn1joker = function(self)
		BasicVoices9:Play("l1n_cn1")
	end	
	BasicVoices9.cn1freehostage1 = function(self)
		BasicVoices9:Play("l1n_cr1")
	end	
	BasicVoices9.cn1freehostage2 = function(self)
		BasicVoices9:Play("l1n_h01")
	end	
	BasicVoices9.cn1smoke = function(self)
		BasicVoices9:Play("l1n_d01")
	end	
	BasicVoices9.cn1flashbang = function(self)
		BasicVoices9:Play("l1n_d02")
	end	
	BasicVoices9.cn1taunt = function(self)
		BasicVoices9:Play("l1n_g90")
	end	
	BasicVoices9.cn1rescuea = function(self)
		BasicVoices9:Play("l1n_gr1a")
	end	
	BasicVoices9.cn1rescueb = function(self)
		BasicVoices9:Play("l1n_gr1b")
	end	
	BasicVoices9.cn1rescuec = function(self)
		BasicVoices9:Play("l1n_gr1c")
	end	
	BasicVoices9.cn1rescued = function(self)
		BasicVoices9:Play("l1n_gr1d")
	end	
	BasicVoices9.cn1assaulta = function(self)
		BasicVoices9:Play("l1n_gr2a")
	end	
	BasicVoices9.cn1assaultb = function(self)
		BasicVoices9:Play("l1n_gr2b")
	end	
	BasicVoices9.cn1assaultc = function(self)
		BasicVoices9:Play("l1n_gr2c")
	end	
	BasicVoices9.cn1assaultd = function(self)
		BasicVoices9:Play("l1n_gr2d")
	end	
	BasicVoices9.cn1help = function(self)
		BasicVoices9:Play("l1n_hlp")
	end	
	BasicVoices9.cn1hold = function(self)
		BasicVoices9:Play("l1n_i01")
	end	
	BasicVoices9.cn1dontmove = function(self)
		BasicVoices9:Play("l1n_i02")
	end	
	BasicVoices9.cn1over = function(self)
		BasicVoices9:Play("l1n_i03")
	end	
	BasicVoices9.cn1bags = function(self)
		BasicVoices9:Play("l1n_l01")
	end	
	BasicVoices9.cn1swear1 = function(self)
		BasicVoices9:Play("l1n_lk3a")
	end	
	BasicVoices9.cn1swear2 = function(self)
		BasicVoices9:Play("l1n_lk3b")
	end	
	BasicVoices9.cn1exit = function(self)
		BasicVoices9:Play("l1n_m01")
	end	
	BasicVoices9.cn1moveout = function(self)
		BasicVoices9:Play("l1n_mov")
	end	
	BasicVoices9.cn1positions1 = function(self)
		BasicVoices9:Play("l1n_pos")
	end	
	BasicVoices9.cn1wait = function(self)
		BasicVoices9:Play("l1n_prm")
	end
	BasicVoices9.cn1rush = function(self)
		BasicVoices9:Play("l1n_pus")
	end
	BasicVoices9.cn1roger = function(self)
		BasicVoices9:Play("l1n_r01")
	end
	BasicVoices9.cn1readyup = function(self)
		BasicVoices9:Play("l1n_rdy")
	end
	BasicVoices9.cn1reloading = function(self)
		BasicVoices9:Play("l1n_rrl")
	end
	BasicVoices9.cn1another = function(self)
		BasicVoices9:Play("l1n_t01")
	end
	BasicVoices9.cn1pain = function(self)
		BasicVoices9:Play("l1n_x01a_any_3p")
	end
	BasicVoices9.cn1death = function(self)
		BasicVoices9:Play("l1n_x02a_any_3p")
	end
	
	
	
	
	BasicVoices9.cn2intruder = function(self)
		BasicVoices9:Play("l2n_a08")
	end	
	BasicVoices9.cn2ammo = function(self)
		BasicVoices9:Play("l2n_amm")
	end	
	BasicVoices9.cn2medic = function(self)
		BasicVoices9:Play("l2n_med")
	end	
	BasicVoices9.cn2fire = function(self)
		BasicVoices9:Play("l2n_att")
	end	
	BasicVoices9.cn2bak = function(self)
		BasicVoices9:Play("l2n_bak")
	end	
	BasicVoices9.cn2burndeath = function(self)
		BasicVoices9:Play("l2n_burndeath")
	end	
	BasicVoices9.cn2burnhurt = function(self)
		BasicVoices9:Play("l2n_burnhurt")
	end	
	BasicVoices9.cn2contact = function(self)
		BasicVoices9:Play("l2n_c01")
	end	
	BasicVoices9.cn2mines = function(self)
		BasicVoices9:Play("l2n_ch1")
	end	
	BasicVoices9.cn2sentry = function(self)
		BasicVoices9:Play("l2n_ch2")
	end	
	BasicVoices9.cn2ecm = function(self)
		BasicVoices9:Play("l2n_ch3")
	end	
	BasicVoices9.cn2saw = function(self)
		BasicVoices9:Play("l2n_ch4")
	end	
	BasicVoices9.cn2hostages1 = function(self)
		BasicVoices9:Play("l2n_civ")
	end	
	BasicVoices9.cn2hostages2 = function(self)
		BasicVoices9:Play("l2n_p01")
	end	
	BasicVoices9.cn2hostages3 = function(self)
		BasicVoices9:Play("l2n_p02")
	end	
	BasicVoices9.cn2hostages4 = function(self)
		BasicVoices9:Play("l2n_p03")
	end	
	BasicVoices9.cn2clear = function(self)
		BasicVoices9:Play("l2n_clr")
	end	
	BasicVoices9.cn2domination = function(self)
		BasicVoices9:Play("l2n_s01x")
	end	
	BasicVoices9.cn2joker = function(self)
		BasicVoices9:Play("l2n_cn1")
	end	
	BasicVoices9.cn2freehostage1 = function(self)
		BasicVoices9:Play("l2n_cr1")
	end	
	BasicVoices9.cn2freehostage2 = function(self)
		BasicVoices9:Play("l2n_h01")
	end	
	BasicVoices9.cn2smoke = function(self)
		BasicVoices9:Play("l2n_d01")
	end	
	BasicVoices9.cn2flashbang = function(self)
		BasicVoices9:Play("l2n_d02")
	end	
	BasicVoices9.cn2taunt = function(self)
		BasicVoices9:Play("l2n_g90")
	end	
	BasicVoices9.cn2rescuea = function(self)
		BasicVoices9:Play("l2n_gr1a")
	end	
	BasicVoices9.cn2rescueb = function(self)
		BasicVoices9:Play("l2n_gr1b")
	end	
	BasicVoices9.cn2rescuec = function(self)
		BasicVoices9:Play("l2n_gr1c")
	end	
	BasicVoices9.cn2rescued = function(self)
		BasicVoices9:Play("l2n_gr1d")
	end	
	BasicVoices9.cn2assaulta = function(self)
		BasicVoices9:Play("l2n_gr2a")
	end	
	BasicVoices9.cn2assaultb = function(self)
		BasicVoices9:Play("l2n_gr2b")
	end	
	BasicVoices9.cn2assaultc = function(self)
		BasicVoices9:Play("l2n_gr2c")
	end	
	BasicVoices9.cn2assaultd = function(self)
		BasicVoices9:Play("l2n_gr2d")
	end	
	BasicVoices9.cn2help = function(self)
		BasicVoices9:Play("l2n_hlp")
	end	
	BasicVoices9.cn2hold = function(self)
		BasicVoices9:Play("l2n_i01")
	end	
	BasicVoices9.cn2dontmove = function(self)
		BasicVoices9:Play("l2n_i02")
	end	
	BasicVoices9.cn2over = function(self)
		BasicVoices9:Play("l2n_i03")
	end	
	BasicVoices9.cn2bags = function(self)
		BasicVoices9:Play("l2n_l01")
	end	
	BasicVoices9.cn2swear1 = function(self)
		BasicVoices9:Play("l2n_lk3a")
	end	
	BasicVoices9.cn2swear2 = function(self)
		BasicVoices9:Play("l2n_lk3b")
	end	
	BasicVoices9.cn2exit = function(self)
		BasicVoices9:Play("l2n_m01")
	end	
	BasicVoices9.cn2moveout = function(self)
		BasicVoices9:Play("l2n_mov")
	end	
	BasicVoices9.cn2positions1 = function(self)
		BasicVoices9:Play("l2n_pos")
	end	
	BasicVoices9.cn2wait = function(self)
		BasicVoices9:Play("l2n_prm")
	end
	BasicVoices9.cn2rush = function(self)
		BasicVoices9:Play("l2n_pus")
	end
	BasicVoices9.cn2roger = function(self)
		BasicVoices9:Play("l2n_r01")
	end
	BasicVoices9.cn2readyup = function(self)
		BasicVoices9:Play("l2n_rdy")
	end
	BasicVoices9.cn2reloading = function(self)
		BasicVoices9:Play("l2n_rrl")
	end
	BasicVoices9.cn2another = function(self)
		BasicVoices9:Play("l2n_t01")
	end
	BasicVoices9.cn2pain = function(self)
		BasicVoices9:Play("l2n_x01a_any_3p")
	end
	BasicVoices9.cn2death = function(self)
		BasicVoices9:Play("l2n_x02a_any_3p")
	end
	
	
	
	
	
	BasicVoices9.cn3intruder = function(self)
		BasicVoices9:Play("l3n_a08")
	end	
	BasicVoices9.cn3ammo = function(self)
		BasicVoices9:Play("l3n_amm")
	end	
	BasicVoices9.cn3medic = function(self)
		BasicVoices9:Play("l3n_med")
	end	
	BasicVoices9.cn3fire = function(self)
		BasicVoices9:Play("l3n_att")
	end	
	BasicVoices9.cn3bak = function(self)
		BasicVoices9:Play("l3n_bak")
	end	
	BasicVoices9.cn3burndeath = function(self)
		BasicVoices9:Play("l3n_burndeath")
	end	
	BasicVoices9.cn3burnhurt = function(self)
		BasicVoices9:Play("l3n_burnhurt")
	end	
	BasicVoices9.cn3contact = function(self)
		BasicVoices9:Play("l3n_c01")
	end	
	BasicVoices9.cn3mines = function(self)
		BasicVoices9:Play("l3n_ch1")
	end	
	BasicVoices9.cn3sentry = function(self)
		BasicVoices9:Play("l3n_ch2")
	end	
	BasicVoices9.cn3ecm = function(self)
		BasicVoices9:Play("l3n_ch3")
	end	
	BasicVoices9.cn3saw = function(self)
		BasicVoices9:Play("l3n_ch4")
	end	
	BasicVoices9.cn3hostages1 = function(self)
		BasicVoices9:Play("l3n_civ")
	end	
	BasicVoices9.cn3hostages2 = function(self)
		BasicVoices9:Play("l3n_p01")
	end	
	BasicVoices9.cn3hostages3 = function(self)
		BasicVoices9:Play("l3n_p02")
	end	
	BasicVoices9.cn3hostages4 = function(self)
		BasicVoices9:Play("l3n_p03")
	end	
	BasicVoices9.cn3clear = function(self)
		BasicVoices9:Play("l3n_clr")
	end	
	BasicVoices9.cn3domination = function(self)
		BasicVoices9:Play("l3n_s01x")
	end	
	BasicVoices9.cn3joker = function(self)
		BasicVoices9:Play("l3n_cn1")
	end	
	BasicVoices9.cn3freehostage1 = function(self)
		BasicVoices9:Play("l3n_cr1")
	end	
	BasicVoices9.cn3freehostage2 = function(self)
		BasicVoices9:Play("l3n_h01")
	end	
	BasicVoices9.cn3smoke = function(self)
		BasicVoices9:Play("l3n_d01")
	end	
	BasicVoices9.cn3flashbang = function(self)
		BasicVoices9:Play("l3n_d02")
	end	
	BasicVoices9.cn3taunt = function(self)
		BasicVoices9:Play("l3n_g90")
	end	
	BasicVoices9.cn3rescuea = function(self)
		BasicVoices9:Play("l3n_gr1a")
	end	
	BasicVoices9.cn3rescueb = function(self)
		BasicVoices9:Play("l3n_gr1b")
	end	
	BasicVoices9.cn3rescuec = function(self)
		BasicVoices9:Play("l3n_gr1c")
	end	
	BasicVoices9.cn3rescued = function(self)
		BasicVoices9:Play("l3n_gr1d")
	end	
	BasicVoices9.cn3assaulta = function(self)
		BasicVoices9:Play("l3n_gr2a")
	end	
	BasicVoices9.cn3assaultb = function(self)
		BasicVoices9:Play("l3n_gr2b")
	end	
	BasicVoices9.cn3assaultc = function(self)
		BasicVoices9:Play("l3n_gr2c")
	end	
	BasicVoices9.cn3assaultd = function(self)
		BasicVoices9:Play("l3n_gr2d")
	end	
	BasicVoices9.cn3help = function(self)
		BasicVoices9:Play("l3n_hlp")
	end	
	BasicVoices9.cn3hold = function(self)
		BasicVoices9:Play("l3n_i01")
	end	
	BasicVoices9.cn3dontmove = function(self)
		BasicVoices9:Play("l3n_i02")
	end	
	BasicVoices9.cn3over = function(self)
		BasicVoices9:Play("l3n_i03")
	end	
	BasicVoices9.cn3bags = function(self)
		BasicVoices9:Play("l3n_l01")
	end	
	BasicVoices9.cn3swear1 = function(self)
		BasicVoices9:Play("l3n_lk3a")
	end	
	BasicVoices9.cn3swear2 = function(self)
		BasicVoices9:Play("l3n_lk3b")
	end	
	BasicVoices9.cn3exit = function(self)
		BasicVoices9:Play("l3n_m01")
	end	
	BasicVoices9.cn3moveout = function(self)
		BasicVoices9:Play("l3n_mov")
	end	
	BasicVoices9.cn3positions1 = function(self)
		BasicVoices9:Play("l3n_pos")
	end	
	BasicVoices9.cn3wait = function(self)
		BasicVoices9:Play("l3n_prm")
	end
	BasicVoices9.cn3rush = function(self)
		BasicVoices9:Play("l3n_pus")
	end
	BasicVoices9.cn3roger = function(self)
		BasicVoices9:Play("l3n_r01")
	end
	BasicVoices9.cn3readyup = function(self)
		BasicVoices9:Play("l3n_rdy")
	end
	BasicVoices9.cn3reloading = function(self)
		BasicVoices9:Play("l3n_rrl")
	end
	BasicVoices9.cn3another = function(self)
		BasicVoices9:Play("l3n_t01")
	end
	BasicVoices9.cn3pain = function(self)
		BasicVoices9:Play("l3n_x01a_any_3p")
	end
	BasicVoices9.cn3death = function(self)
		BasicVoices9:Play("l3n_x02a_any_3p")
	end
	
	
	
	
	BasicVoices9.cn4intruder = function(self)
		BasicVoices9:Play("l4n_a08")
	end	
	BasicVoices9.cn4ammo = function(self)
		BasicVoices9:Play("l4n_amm")
	end	
	BasicVoices9.cn4medic = function(self)
		BasicVoices9:Play("l4n_med")
	end	
	BasicVoices9.cn4fire = function(self)
		BasicVoices9:Play("l4n_att")
	end	
	BasicVoices9.cn4bak = function(self)
		BasicVoices9:Play("l4n_bak")
	end	
	BasicVoices9.cn4burndeath = function(self)
		BasicVoices9:Play("l4n_burndeath")
	end	
	BasicVoices9.cn4burnhurt = function(self)
		BasicVoices9:Play("l4n_burnhurt")
	end	
	BasicVoices9.cn4contact = function(self)
		BasicVoices9:Play("l4n_c01")
	end	
	BasicVoices9.cn4mines = function(self)
		BasicVoices9:Play("l4n_ch1")
	end	
	BasicVoices9.cn4sentry = function(self)
		BasicVoices9:Play("l4n_ch2")
	end	
	BasicVoices9.cn4ecm = function(self)
		BasicVoices9:Play("l4n_ch3")
	end	
	BasicVoices9.cn4saw = function(self)
		BasicVoices9:Play("l4n_ch4")
	end	
	BasicVoices9.cn4hostages1 = function(self)
		BasicVoices9:Play("l4n_civ")
	end	
	BasicVoices9.cn4hostages2 = function(self)
		BasicVoices9:Play("l4n_p01")
	end	
	BasicVoices9.cn4hostages3 = function(self)
		BasicVoices9:Play("l4n_p02")
	end	
	BasicVoices9.cn4hostages4 = function(self)
		BasicVoices9:Play("l4n_p03")
	end	
	BasicVoices9.cn4clear = function(self)
		BasicVoices9:Play("l4n_clr")
	end	
	BasicVoices9.cn4domination = function(self)
		BasicVoices9:Play("l4n_s01x")
	end	
	BasicVoices9.cn4joker = function(self)
		BasicVoices9:Play("l4n_cn1")
	end	
	BasicVoices9.cn4freehostage1 = function(self)
		BasicVoices9:Play("l4n_cr1")
	end	
	BasicVoices9.cn4freehostage2 = function(self)
		BasicVoices9:Play("l4n_h01")
	end	
	BasicVoices9.cn4smoke = function(self)
		BasicVoices9:Play("l4n_d01")
	end	
	BasicVoices9.cn4flashbang = function(self)
		BasicVoices9:Play("l4n_d02")
	end	
	BasicVoices9.cn4taunt = function(self)
		BasicVoices9:Play("l4n_g90")
	end	
	BasicVoices9.cn4rescuea = function(self)
		BasicVoices9:Play("l4n_gr1a")
	end	
	BasicVoices9.cn4rescueb = function(self)
		BasicVoices9:Play("l4n_gr1b")
	end	
	BasicVoices9.cn4rescuec = function(self)
		BasicVoices9:Play("l4n_gr1c")
	end	
	BasicVoices9.cn4rescued = function(self)
		BasicVoices9:Play("l4n_gr1d")
	end	
	BasicVoices9.cn4assaulta = function(self)
		BasicVoices9:Play("l4n_gr2a")
	end	
	BasicVoices9.cn4assaultb = function(self)
		BasicVoices9:Play("l4n_gr2b")
	end	
	BasicVoices9.cn4assaultc = function(self)
		BasicVoices9:Play("l4n_gr2c")
	end	
	BasicVoices9.cn4assaultd = function(self)
		BasicVoices9:Play("l4n_gr2d")
	end	
	BasicVoices9.cn4help = function(self)
		BasicVoices9:Play("l4n_hlp")
	end	
	BasicVoices9.cn4hold = function(self)
		BasicVoices9:Play("l4n_i01")
	end	
	BasicVoices9.cn4dontmove = function(self)
		BasicVoices9:Play("l4n_i02")
	end	
	BasicVoices9.cn4over = function(self)
		BasicVoices9:Play("l4n_i03")
	end	
	BasicVoices9.cn4bags = function(self)
		BasicVoices9:Play("l4n_l01")
	end	
	BasicVoices9.cn4swear1 = function(self)
		BasicVoices9:Play("l4n_lk3a")
	end	
	BasicVoices9.cn4swear2 = function(self)
		BasicVoices9:Play("l4n_lk3b")
	end	
	BasicVoices9.cn4exit = function(self)
		BasicVoices9:Play("l4n_m01")
	end	
	BasicVoices9.cn4moveout = function(self)
		BasicVoices9:Play("l4n_mov")
	end	
	BasicVoices9.cn4positions1 = function(self)
		BasicVoices9:Play("l4n_pos")
	end	
	BasicVoices9.cn4wait = function(self)
		BasicVoices9:Play("l4n_prm")
	end
	BasicVoices9.cn4rush = function(self)
		BasicVoices9:Play("l4n_pus")
	end
	BasicVoices9.cn4roger = function(self)
		BasicVoices9:Play("l4n_r01")
	end
	BasicVoices9.cn4readyup = function(self)
		BasicVoices9:Play("l4n_rdy")
	end
	BasicVoices9.cn4reloading = function(self)
		BasicVoices9:Play("l4n_rrl")
	end
	BasicVoices9.cn4another = function(self)
		BasicVoices9:Play("l4n_t01")
	end
	BasicVoices9.cn4pain = function(self)
		BasicVoices9:Play("l4n_x01a_any_3p")
	end
	BasicVoices9.cn4death = function(self)
		BasicVoices9:Play("l4n_x02a_any_3p")
	end
	
	
	
	
	
	
	BasicVoices9.cn5bak = function(self)
		BasicVoices9:Play("l5n_bak")
	end	
	BasicVoices9.cn5burndeath = function(self)
		BasicVoices9:Play("l5n_burndeath")
	end	
	BasicVoices9.cn5burnhurt = function(self)
		BasicVoices9:Play("l5n_burnhurt")
	end
	
	
-----------------------------------------------------
	MenuHelper:LoadFromJsonFile(BasicVoices9._path .. "menu.txt", BasicVoices9, BasicVoices9._data)
end)

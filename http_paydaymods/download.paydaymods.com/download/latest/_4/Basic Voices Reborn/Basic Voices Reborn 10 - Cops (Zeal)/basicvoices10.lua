_G.BasicVoices10 = _G.BasicVoices10 or {}
BasicVoices10._path = ModPath
BasicVoices10._data = {}

function BasicVoices10:Play(soundfile)
	if Utils:IsInHeist() and Utils:IsInCustody() == false and Utils:IsInGameState() then
		managers.player:local_player():sound():say(soundfile,true,true)
	end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_BasicVoices10", function(loc)
	loc:load_localization_file(BasicVoices10._path .. "en.txt")
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_BasicVoices10", function(menu_manager)
----------------------------------------------------- All the sounds
	BasicVoices10.ch1intruder = function(self)
		BasicVoices10:Play("l1d_a08")
	end	
	BasicVoices10.ch1fire = function(self)
		BasicVoices10:Play("l1d_att")
	end	
	BasicVoices10.ch1bak = function(self)
		BasicVoices10:Play("l1d_bak")
	end	
	BasicVoices10.ch1burndeath = function(self)
		BasicVoices10:Play("l1d_burndeath")
	end	
	BasicVoices10.ch1burnhurt = function(self)
		BasicVoices10:Play("l1d_burnhurt")
	end	
	BasicVoices10.ch1contact = function(self)
		BasicVoices10:Play("l1d_c01")
	end	
	BasicVoices10.ch1mines = function(self)
		BasicVoices10:Play("l1d_ch1")
	end	
	BasicVoices10.ch1sentry = function(self)
		BasicVoices10:Play("l1d_ch2")
	end	
	BasicVoices10.ch1ecm = function(self)
		BasicVoices10:Play("l1d_ch3")
	end	
	BasicVoices10.ch1saw = function(self)
		BasicVoices10:Play("l1d_ch4")
	end	
	BasicVoices10.ch1hostages1 = function(self)
		BasicVoices10:Play("l1d_civ")
	end	
	BasicVoices10.ch1hostages2 = function(self)
		BasicVoices10:Play("l1d_p01")
	end	
	BasicVoices10.ch1hostages3 = function(self)
		BasicVoices10:Play("l1d_p02")
	end	
	BasicVoices10.ch1hostages4 = function(self)
		BasicVoices10:Play("l1d_p03")
	end	
	BasicVoices10.ch1clear = function(self)
		BasicVoices10:Play("l1d_clr")
	end	
	BasicVoices10.ch1domination = function(self)
		BasicVoices10:Play("l1d_s01x")
	end	
	BasicVoices10.ch1joker = function(self)
		BasicVoices10:Play("l1d_cn1")
	end	
	BasicVoices10.ch1freehostage1 = function(self)
		BasicVoices10:Play("l1d_cr1")
	end	
	BasicVoices10.ch1freehostage2 = function(self)
		BasicVoices10:Play("l1d_h01")
	end	
	BasicVoices10.ch1smoke = function(self)
		BasicVoices10:Play("l1d_d01")
	end	
	BasicVoices10.ch1flashbang = function(self)
		BasicVoices10:Play("l1d_d02")
	end	
	BasicVoices10.ch1disable1 = function(self)
		BasicVoices10:Play("l1d_e01")
	end
	BasicVoices10.ch1disable2 = function(self)
		BasicVoices10:Play("l1d_e02")
	end
	BasicVoices10.ch1disable3 = function(self)
		BasicVoices10:Play("l1d_e03")
	end
	BasicVoices10.ch1disable4 = function(self)
		BasicVoices10:Play("l1d_e04")
	end
	BasicVoices10.ch1taunt = function(self)
		BasicVoices10:Play("l1d_g90")
	end	
	BasicVoices10.ch1rescuea = function(self)
		BasicVoices10:Play("l1d_gr1a")
	end	
	BasicVoices10.ch1rescueb = function(self)
		BasicVoices10:Play("l1d_gr1b")
	end	
	BasicVoices10.ch1rescuec = function(self)
		BasicVoices10:Play("l1d_gr1c")
	end	
	BasicVoices10.ch1rescued = function(self)
		BasicVoices10:Play("l1d_gr1d")
	end	
	BasicVoices10.ch1assaulta = function(self)
		BasicVoices10:Play("l1d_gr2a")
	end	
	BasicVoices10.ch1assaultb = function(self)
		BasicVoices10:Play("l1d_gr2b")
	end	
	BasicVoices10.ch1assaultc = function(self)
		BasicVoices10:Play("l1d_gr2c")
	end	
	BasicVoices10.ch1assaultd = function(self)
		BasicVoices10:Play("l1d_gr2d")
	end	
	BasicVoices10.ch1help = function(self)
		BasicVoices10:Play("l1d_hlp")
	end	
	BasicVoices10.ch1hold = function(self)
		BasicVoices10:Play("l1d_i01")
	end	
	BasicVoices10.ch1over = function(self)
		BasicVoices10:Play("l1d_i03")
	end	
	BasicVoices10.ch1bags = function(self)
		BasicVoices10:Play("l1d_l01")
	end	
	BasicVoices10.ch1swear1 = function(self)
		BasicVoices10:Play("l1d_lk3a")
	end	
	BasicVoices10.ch1swear2 = function(self)
		BasicVoices10:Play("l1d_lk3b")
	end	
	BasicVoices10.ch1exit = function(self)
		BasicVoices10:Play("l1d_m01")
	end	
	BasicVoices10.ch1moveout = function(self)
		BasicVoices10:Play("l1d_mov")
	end	
	BasicVoices10.ch1positions1 = function(self)
		BasicVoices10:Play("l1d_pos")
	end	
	BasicVoices10.ch1wait = function(self)
		BasicVoices10:Play("l1d_prm")
	end
	BasicVoices10.ch1rush = function(self)
		BasicVoices10:Play("l1d_pus")
	end
	BasicVoices10.ch1roger = function(self)
		BasicVoices10:Play("l1d_r01")
	end
	BasicVoices10.ch1readyup = function(self)
		BasicVoices10:Play("l1d_rdy")
	end
	BasicVoices10.ch1reloading = function(self)
		BasicVoices10:Play("l1d_rrl")
	end
	BasicVoices10.ch1another = function(self)
		BasicVoices10:Play("l1d_t01")
	end
	BasicVoices10.ch1pain = function(self)
		BasicVoices10:Play("l1d_x01a_any_3p")
	end
	BasicVoices10.ch1death = function(self)
		BasicVoices10:Play("l1d_x02a_any_3p")
	end
	
	
	
	
	
	
	
	
	
	
	
	BasicVoices10.ch2intruder = function(self)
		BasicVoices10:Play("l2d_a08")
	end	
	BasicVoices10.ch2fire = function(self)
		BasicVoices10:Play("l2d_att")
	end	
	BasicVoices10.ch2bak = function(self)
		BasicVoices10:Play("l2d_bak")
	end	
	BasicVoices10.ch2burndeath = function(self)
		BasicVoices10:Play("l2d_burndeath")
	end	
	BasicVoices10.ch2burnhurt = function(self)
		BasicVoices10:Play("l2d_burnhurt")
	end	
	BasicVoices10.ch5contact = function(self)
		BasicVoices10:Play("l2d_c01")
	end	
	BasicVoices10.ch2mines = function(self)
		BasicVoices10:Play("l2d_ch1")
	end	
	BasicVoices10.ch2sentry = function(self)
		BasicVoices10:Play("l2d_ch2")
	end	
	BasicVoices10.ch2ecm = function(self)
		BasicVoices10:Play("l2d_ch3")
	end	
	BasicVoices10.ch2saw = function(self)
		BasicVoices10:Play("l2d_ch4")
	end	
	BasicVoices10.ch2hostages1 = function(self)
		BasicVoices10:Play("l2d_civ")
	end	
	BasicVoices10.ch2hostages2 = function(self)
		BasicVoices10:Play("l2d_p01")
	end	
	BasicVoices10.ch2hostages3 = function(self)
		BasicVoices10:Play("l2d_p02")
	end	
	BasicVoices10.ch2hostages4 = function(self)
		BasicVoices10:Play("l2d_p03")
	end	
	BasicVoices10.ch2clear = function(self)
		BasicVoices10:Play("l2d_clr")
	end	
	BasicVoices10.ch2domination = function(self)
		BasicVoices10:Play("l2d_s01x")
	end	
	BasicVoices10.ch2joker = function(self)
		BasicVoices10:Play("l2d_cn1")
	end	
	BasicVoices10.ch2freehostage1 = function(self)
		BasicVoices10:Play("l2d_cr1")
	end	
	BasicVoices10.ch2freehostage2 = function(self)
		BasicVoices10:Play("l2d_h01")
	end	
	BasicVoices10.ch2smoke = function(self)
		BasicVoices10:Play("l2d_d01")
	end	
	BasicVoices10.ch2flashbang = function(self)
		BasicVoices10:Play("l2d_d02")
	end	
	BasicVoices10.ch2disable1 = function(self)
		BasicVoices10:Play("l2d_e01")
	end
	BasicVoices10.ch2disable2 = function(self)
		BasicVoices10:Play("l2d_e02")
	end
	BasicVoices10.ch2disable3 = function(self)
		BasicVoices10:Play("l2d_e03")
	end
	BasicVoices10.ch2disable4 = function(self)
		BasicVoices10:Play("l2d_e04")
	end
	BasicVoices10.ch2disable5 = function(self)
		BasicVoices10:Play("l2d_e05")
	end
	BasicVoices10.ch2disable6 = function(self)
		BasicVoices10:Play("l2d_e06")
	end
	BasicVoices10.ch2taunt = function(self)
		BasicVoices10:Play("l2d_g90")
	end	
	BasicVoices10.ch2rescuea = function(self)
		BasicVoices10:Play("l2d_gr1a")
	end	
	BasicVoices10.ch2rescueb = function(self)
		BasicVoices10:Play("l2d_gr1b")
	end	
	BasicVoices10.ch2rescuec = function(self)
		BasicVoices10:Play("l2d_gr1c")
	end	
	BasicVoices10.ch2rescued = function(self)
		BasicVoices10:Play("l2d_gr1d")
	end	
	BasicVoices10.ch2assaulta = function(self)
		BasicVoices10:Play("l2d_gr2a")
	end	
	BasicVoices10.ch2assaultb = function(self)
		BasicVoices10:Play("l2d_gr2b")
	end	
	BasicVoices10.ch2assaultc = function(self)
		BasicVoices10:Play("l2d_gr2c")
	end	
	BasicVoices10.ch2assaultd = function(self)
		BasicVoices10:Play("l2d_gr2d")
	end	
	BasicVoices10.ch2help = function(self)
		BasicVoices10:Play("l2d_hlp")
	end	
	BasicVoices10.ch2hold = function(self)
		BasicVoices10:Play("l2d_i01")
	end	
	BasicVoices10.ch2dontmove = function(self)
		BasicVoices10:Play("l2d_i02")
	end	
	BasicVoices10.ch2over = function(self)
		BasicVoices10:Play("l2d_i03")
	end	
	BasicVoices10.ch2bags = function(self)
		BasicVoices10:Play("l2d_l01")
	end	
	BasicVoices10.ch2swear1 = function(self)
		BasicVoices10:Play("l2d_lk3a")
	end	
	BasicVoices10.ch2swear2 = function(self)
		BasicVoices10:Play("l2d_lk3b")
	end	
	BasicVoices10.ch2exit = function(self)
		BasicVoices10:Play("l2d_m01")
	end	
	BasicVoices10.ch2moveout = function(self)
		BasicVoices10:Play("l2d_mov")
	end	
	BasicVoices10.ch2positions1 = function(self)
		BasicVoices10:Play("l2d_pos")
	end	
	BasicVoices10.ch2wait = function(self)
		BasicVoices10:Play("l2d_prm")
	end
	BasicVoices10.ch2rush = function(self)
		BasicVoices10:Play("l2d_pus")
	end
	BasicVoices10.ch2roger = function(self)
		BasicVoices10:Play("l2d_r01")
	end
	BasicVoices10.ch2readyup = function(self)
		BasicVoices10:Play("l2d_rdy")
	end
	BasicVoices10.ch2reloading = function(self)
		BasicVoices10:Play("l2d_rrl")
	end
	BasicVoices10.ch2another = function(self)
		BasicVoices10:Play("l2d_t01")
	end
	BasicVoices10.ch2pain = function(self)
		BasicVoices10:Play("l2d_x01a_any_3p")
	end
	BasicVoices10.ch2death = function(self)
		BasicVoices10:Play("l2d_x02a_any_3p")
	end
	
	
	
	
	
	
	
	
	
	
	
	
	
	BasicVoices10.ch3intruder = function(self)
		BasicVoices10:Play("l3d_a08")
	end	
	BasicVoices10.ch3fire = function(self)
		BasicVoices10:Play("l3d_att")
	end	
	BasicVoices10.ch3bak = function(self)
		BasicVoices10:Play("l3d_bak")
	end	
	BasicVoices10.ch3contact = function(self)
		BasicVoices10:Play("l3d_c01")
	end	
	BasicVoices10.ch3mines = function(self)
		BasicVoices10:Play("l3d_ch1")
	end	
	BasicVoices10.ch3sentry = function(self)
		BasicVoices10:Play("l3d_ch2")
	end	
	BasicVoices10.ch3ecm = function(self)
		BasicVoices10:Play("l3d_ch3")
	end	
	BasicVoices10.ch3saw = function(self)
		BasicVoices10:Play("l3d_ch4")
	end	
	BasicVoices10.ch3hostages1 = function(self)
		BasicVoices10:Play("l3d_civ")
	end	
	BasicVoices10.ch3hostages2 = function(self)
		BasicVoices10:Play("l3d_p01")
	end	
	BasicVoices10.ch3hostages3 = function(self)
		BasicVoices10:Play("l3d_p02")
	end	
	BasicVoices10.ch3hostages4 = function(self)
		BasicVoices10:Play("l3d_p03")
	end	
	BasicVoices10.ch3clear = function(self)
		BasicVoices10:Play("l3d_clr")
	end	
	BasicVoices10.ch3domination = function(self)
		BasicVoices10:Play("l3d_s01x")
	end	
	BasicVoices10.ch3joker = function(self)
		BasicVoices10:Play("l3d_cn1")
	end	
	BasicVoices10.ch3freehostage1 = function(self)
		BasicVoices10:Play("l3d_cr1")
	end	
	BasicVoices10.ch3freehostage2 = function(self)
		BasicVoices10:Play("l3d_h01")
	end	
	BasicVoices10.ch3smoke = function(self)
		BasicVoices10:Play("l3d_d01")
	end	
	BasicVoices10.ch3flashbang = function(self)
		BasicVoices10:Play("l3d_d02")
	end	
	BasicVoices10.ch3disable1 = function(self)
		BasicVoices10:Play("l3d_e01")
	end
	BasicVoices10.ch3disable2 = function(self)
		BasicVoices10:Play("l3d_e02")
	end
	BasicVoices10.ch3disable3 = function(self)
		BasicVoices10:Play("l3d_e03")
	end
	BasicVoices10.ch3disable4 = function(self)
		BasicVoices10:Play("l3d_e04")
	end
	BasicVoices10.ch3disable5 = function(self)
		BasicVoices10:Play("l3d_e05")
	end
	BasicVoices10.ch3disable6 = function(self)
		BasicVoices10:Play("l3d_e06")
	end
	BasicVoices10.ch3taunt = function(self)
		BasicVoices10:Play("l3d_g90")
	end	
	BasicVoices10.ch3rescuea = function(self)
		BasicVoices10:Play("l3d_gr1a")
	end	
	BasicVoices10.ch3rescueb = function(self)
		BasicVoices10:Play("l3d_gr1b")
	end	
	BasicVoices10.ch3rescuec = function(self)
		BasicVoices10:Play("l3d_gr1c")
	end	
	BasicVoices10.ch3rescued = function(self)
		BasicVoices10:Play("l3d_gr1d")
	end	
	BasicVoices10.ch3assaulta = function(self)
		BasicVoices10:Play("l3d_gr2a")
	end	
	BasicVoices10.ch3assaultb = function(self)
		BasicVoices10:Play("l3d_gr2b")
	end	
	BasicVoices10.ch3assaultc = function(self)
		BasicVoices10:Play("l3d_gr2c")
	end	
	BasicVoices10.ch3assaultd = function(self)
		BasicVoices10:Play("l3d_gr2d")
	end	
	BasicVoices10.ch3help = function(self)
		BasicVoices10:Play("l3d_hlp")
	end	
	BasicVoices10.ch3hold = function(self)
		BasicVoices10:Play("l3d_i01")
	end	
	BasicVoices10.ch3dontmove = function(self)
		BasicVoices10:Play("l3d_i02")
	end	
	BasicVoices10.ch3over = function(self)
		BasicVoices10:Play("l3d_i03")
	end	
	BasicVoices10.ch3bags = function(self)
		BasicVoices10:Play("l3d_l01")
	end	
	BasicVoices10.ch3swear1 = function(self)
		BasicVoices10:Play("l3d_lk3a")
	end	
	BasicVoices10.ch3swear2 = function(self)
		BasicVoices10:Play("l3d_lk3b")
	end	
	BasicVoices10.ch3exit = function(self)
		BasicVoices10:Play("l3d_m01")
	end	
	BasicVoices10.ch3moveout = function(self)
		BasicVoices10:Play("l3d_mov")
	end	
	BasicVoices10.ch3positions1 = function(self)
		BasicVoices10:Play("l3d_pos")
	end	
	BasicVoices10.ch3wait = function(self)
		BasicVoices10:Play("l3d_prm")
	end
	BasicVoices10.ch3rush = function(self)
		BasicVoices10:Play("l3d_pus")
	end
	BasicVoices10.ch3roger = function(self)
		BasicVoices10:Play("l3d_r01")
	end
	BasicVoices10.ch3readyup = function(self)
		BasicVoices10:Play("l3d_rdy")
	end
	BasicVoices10.ch3reloading = function(self)
		BasicVoices10:Play("l3d_rrl")
	end
	BasicVoices10.ch3another = function(self)
		BasicVoices10:Play("l3d_t01")
	end
	BasicVoices10.ch3pain = function(self)
		BasicVoices10:Play("l3d_x01a_any_3p")
	end
	BasicVoices10.ch3death = function(self)
		BasicVoices10:Play("l3d_x02a_any_3p")
	end
	
	
	
	
	
	
	
	
	
	
	
	BasicVoices10.ch4intruder = function(self)
		BasicVoices10:Play("l4d_a08")
	end	
	BasicVoices10.ch4fire = function(self)
		BasicVoices10:Play("l4d_att")
	end	
	BasicVoices10.ch4bak = function(self)
		BasicVoices10:Play("l4d_bak")
	end	
	BasicVoices10.ch4burndeath = function(self)
		BasicVoices10:Play("l4d_burndeath")
	end	
	BasicVoices10.ch4burnhurt = function(self)
		BasicVoices10:Play("l4d_burnhurt")
	end	
	BasicVoices10.ch4contact = function(self)
		BasicVoices10:Play("l4d_c01")
	end	
	BasicVoices10.ch4mines = function(self)
		BasicVoices10:Play("l4d_ch1")
	end	
	BasicVoices10.ch4sentry = function(self)
		BasicVoices10:Play("l4d_ch2")
	end	
	BasicVoices10.ch4ecm = function(self)
		BasicVoices10:Play("l4d_ch3")
	end	
	BasicVoices10.ch4saw = function(self)
		BasicVoices10:Play("l4d_ch4")
	end	
	BasicVoices10.ch4hostages1 = function(self)
		BasicVoices10:Play("l4d_civ")
	end	
	BasicVoices10.ch4hostages2 = function(self)
		BasicVoices10:Play("l4d_p01")
	end	
	BasicVoices10.ch4hostages3 = function(self)
		BasicVoices10:Play("l4d_p02")
	end	
	BasicVoices10.ch4hostages4 = function(self)
		BasicVoices10:Play("l4d_p03")
	end	
	BasicVoices10.ch4clear = function(self)
		BasicVoices10:Play("l4d_clr")
	end	
	BasicVoices10.ch4domination = function(self)
		BasicVoices10:Play("l4d_s01x")
	end	
	BasicVoices10.ch4joker = function(self)
		BasicVoices10:Play("l4d_cn1")
	end	
	BasicVoices10.ch4freehostage1 = function(self)
		BasicVoices10:Play("l4d_cr1")
	end	
	BasicVoices10.ch4freehostage2 = function(self)
		BasicVoices10:Play("l4d_h01")
	end	
	BasicVoices10.ch4smoke = function(self)
		BasicVoices10:Play("l4d_d01")
	end	
	BasicVoices10.ch4flashbang = function(self)
		BasicVoices10:Play("l4d_d02")
	end	
	BasicVoices10.ch4disable1 = function(self)
		BasicVoices10:Play("l4d_e01")
	end
	BasicVoices10.ch4disable2 = function(self)
		BasicVoices10:Play("l4d_e02")
	end
	BasicVoices10.ch4disable3 = function(self)
		BasicVoices10:Play("l4d_e03")
	end
	BasicVoices10.ch4disable4 = function(self)
		BasicVoices10:Play("l4d_e04")
	end
	BasicVoices10.ch4disable5 = function(self)
		BasicVoices10:Play("l4d_e05")
	end
	BasicVoices10.ch4disable6 = function(self)
		BasicVoices10:Play("l4D_e06")
	end
	BasicVoices10.ch4taunt = function(self)
		BasicVoices10:Play("l4d_g90")
	end	
	BasicVoices10.ch4rescuea = function(self)
		BasicVoices10:Play("l4d_gr1a")
	end	
	BasicVoices10.ch4rescueb = function(self)
		BasicVoices10:Play("l4d_gr1b")
	end	
	BasicVoices10.ch4rescuec = function(self)
		BasicVoices10:Play("l4d_gr1c")
	end	
	BasicVoices10.ch4rescued = function(self)
		BasicVoices10:Play("l4d_gr1d")
	end	
	BasicVoices10.ch4assaulta = function(self)
		BasicVoices10:Play("l4d_gr2a")
	end	
	BasicVoices10.ch4assaultb = function(self)
		BasicVoices10:Play("l4d_gr2b")
	end	
	BasicVoices10.ch4assaultc = function(self)
		BasicVoices10:Play("l4d_gr2c")
	end	
	BasicVoices10.ch4assaultd = function(self)
		BasicVoices10:Play("l4d_gr2d")
	end	
	BasicVoices10.ch4help = function(self)
		BasicVoices10:Play("l4d_hlp")
	end	
	BasicVoices10.ch4hold = function(self)
		BasicVoices10:Play("l4d_i01")
	end	
	BasicVoices10.ch4dontmove = function(self)
		BasicVoices10:Play("l4d_i02")
	end	
	BasicVoices10.ch4over = function(self)
		BasicVoices10:Play("l4d_i03")
	end	
	BasicVoices10.ch4bags = function(self)
		BasicVoices10:Play("l4d_l01")
	end	
	BasicVoices10.ch4swear1 = function(self)
		BasicVoices10:Play("l4d_lk3a")
	end	
	BasicVoices10.ch4swear2 = function(self)
		BasicVoices10:Play("l4d_lk3b")
	end	
	BasicVoices10.ch4exit = function(self)
		BasicVoices10:Play("l4d_m01")
	end	
	BasicVoices10.ch4moveout = function(self)
		BasicVoices10:Play("l4d_mov")
	end	
	BasicVoices10.ch4positions1 = function(self)
		BasicVoices10:Play("l4d_pos")
	end	
	BasicVoices10.ch4wait = function(self)
		BasicVoices10:Play("l4d_prm")
	end
	BasicVoices10.ch4rush = function(self)
		BasicVoices10:Play("l4d_pus")
	end
	BasicVoices10.ch4roger = function(self)
		BasicVoices10:Play("l4d_r01")
	end
	BasicVoices10.ch4readyup = function(self)
		BasicVoices10:Play("l4d_rdy")
	end
	BasicVoices10.ch4reloading = function(self)
		BasicVoices10:Play("l4d_rrl")
	end
	BasicVoices10.ch4another = function(self)
		BasicVoices10:Play("l4d_t01")
	end
	BasicVoices10.ch4pain = function(self)
		BasicVoices10:Play("l4d_x01a_any_3p")
	end
	BasicVoices10.ch4death = function(self)
		BasicVoices10:Play("l4d_x02a_any_3p")
	end
	
	
	
	
	
	
	
	
	
	
	
	
	BasicVoices10.ch5intruder = function(self)
		BasicVoices10:Play("l5d_a08")
	end	
	BasicVoices10.ch5fire = function(self)
		BasicVoices10:Play("l5d_att")
	end	
	BasicVoices10.ch5bak = function(self)
		BasicVoices10:Play("l5d_bak")
	end	
	BasicVoices10.ch5burndeath = function(self)
		BasicVoices10:Play("l5d_burndeath")
	end	
	BasicVoices10.ch5burnhurt = function(self)
		BasicVoices10:Play("l5d_burnhurt")
	end	
	BasicVoices10.ch5contact = function(self)
		BasicVoices10:Play("l5d_c01")
	end	
	BasicVoices10.ch5mines = function(self)
		BasicVoices10:Play("l5d_ch1")
	end	
	BasicVoices10.ch5sentry = function(self)
		BasicVoices10:Play("l5d_ch2")
	end	
	BasicVoices10.ch5ecm = function(self)
		BasicVoices10:Play("l5d_ch3")
	end	
	BasicVoices10.ch5saw = function(self)
		BasicVoices10:Play("l5d_ch4")
	end	
	BasicVoices10.ch5hostages1 = function(self)
		BasicVoices10:Play("l5d_civ")
	end	
	BasicVoices10.ch5hostages2 = function(self)
		BasicVoices10:Play("l5d_p01")
	end	
	BasicVoices10.ch5hostages3 = function(self)
		BasicVoices10:Play("l5d_p02")
	end	
	BasicVoices10.ch5hostages4 = function(self)
		BasicVoices10:Play("l5d_p03")
	end	
	BasicVoices10.ch5clear = function(self)
		BasicVoices10:Play("l5d_clr")
	end	
	BasicVoices10.ch5domination = function(self)
		BasicVoices10:Play("l5d_s01x")
	end	
	BasicVoices10.ch5joker = function(self)
		BasicVoices10:Play("l5d_cn1")
	end	
	BasicVoices10.ch5freehostage1 = function(self)
		BasicVoices10:Play("l5d_cr1")
	end	
	BasicVoices10.ch5freehostage2 = function(self)
		BasicVoices10:Play("l5d_h10")
	end	
	BasicVoices10.ch5smoke = function(self)
		BasicVoices10:Play("l5d_d01")
	end	
	BasicVoices10.ch5flashbang = function(self)
		BasicVoices10:Play("l5d_d02")
	end	
	BasicVoices10.ch5disable1 = function(self)
		BasicVoices10:Play("l5d_e01")
	end
	BasicVoices10.ch5disable2 = function(self)
		BasicVoices10:Play("l5d_e02")
	end
	BasicVoices10.ch5disable3 = function(self)
		BasicVoices10:Play("l5d_e03")
	end
	BasicVoices10.ch5disable4 = function(self)
		BasicVoices10:Play("l5d_e04")
	end
	BasicVoices10.ch5disable5 = function(self)
		BasicVoices10:Play("l5d_e05")
	end
	BasicVoices10.ch5disable6 = function(self)
		BasicVoices10:Play("l5d_e06")
	end
	BasicVoices10.ch5taunt = function(self)
		BasicVoices10:Play("l5d_g90")
	end	
	BasicVoices10.ch5rescuea = function(self)
		BasicVoices10:Play("l5d_gr1a")
	end	
	BasicVoices10.ch5rescueb = function(self)
		BasicVoices10:Play("l5d_gr1b")
	end	
	BasicVoices10.ch5rescuec = function(self)
		BasicVoices10:Play("l5d_gr1c")
	end	
	BasicVoices10.ch5rescued = function(self)
		BasicVoices10:Play("l5d_gr1d")
	end	
	BasicVoices10.ch5assaulta = function(self)
		BasicVoices10:Play("l5d_gr2a")
	end	
	BasicVoices10.ch5assaultb = function(self)
		BasicVoices10:Play("l5d_gr2b")
	end	
	BasicVoices10.ch5assaultc = function(self)
		BasicVoices10:Play("l5d_gr2c")
	end	
	BasicVoices10.ch5assaultd = function(self)
		BasicVoices10:Play("l5d_gr2d")
	end	
	BasicVoices10.ch5help = function(self)
		BasicVoices10:Play("l5d_hlp")
	end	
	BasicVoices10.ch5hold = function(self)
		BasicVoices10:Play("l5d_i01")
	end	
	BasicVoices10.ch5dontmove = function(self)
		BasicVoices10:Play("l5d_i02")
	end	
	BasicVoices10.ch5over = function(self)
		BasicVoices10:Play("l5d_i03")
	end	
	BasicVoices10.ch5bags = function(self)
		BasicVoices10:Play("l5d_l01")
	end	
	BasicVoices10.ch5swear1 = function(self)
		BasicVoices10:Play("l5d_lk3a")
	end	
	BasicVoices10.ch5swear2 = function(self)
		BasicVoices10:Play("l5d_lk3b")
	end	
	BasicVoices10.ch5exit = function(self)
		BasicVoices10:Play("l5d_m01")
	end	
	BasicVoices10.ch5moveout = function(self)
		BasicVoices10:Play("l5d_mov")
	end	
	BasicVoices10.ch5positions1 = function(self)
		BasicVoices10:Play("l5d_pos")
	end	
	BasicVoices10.ch5wait = function(self)
		BasicVoices10:Play("l5d_prm")
	end
	BasicVoices10.ch5rush = function(self)
		BasicVoices10:Play("l5d_pus")
	end
	BasicVoices10.ch5roger = function(self)
		BasicVoices10:Play("l5d_r01")
	end
	BasicVoices10.ch5readyup = function(self)
		BasicVoices10:Play("l5d_rdy")
	end
	BasicVoices10.ch5reloading = function(self)
		BasicVoices10:Play("l5d_rrl")
	end
	BasicVoices10.ch5another = function(self)
		BasicVoices10:Play("l5d_t01")
	end
	BasicVoices10.ch5pain = function(self)
		BasicVoices10:Play("l5d_x01a_any_3p")
	end
	BasicVoices10.ch5death = function(self)
		BasicVoices10:Play("l5d_x02a_any_3p")
	end
-----------------------------------------------------
	MenuHelper:LoadFromJsonFile(BasicVoices10._path .. "menu.txt", BasicVoices10, BasicVoices10._data)
end)

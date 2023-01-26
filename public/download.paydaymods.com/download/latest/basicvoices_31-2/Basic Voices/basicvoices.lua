_G.BasicVoices = _G.BasicVoices or {}
BasicVoices._path = ModPath
BasicVoices._data = {}

function BasicVoices:Play(soundfile)
	if Utils:IsInHeist() and Utils:IsInCustody() == false and Utils:IsInGameState() then
		managers.player:local_player():sound():say(soundfile,true,true)
	end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_BasicVoices", function(loc)
	loc:load_localization_file(BasicVoices._path .. "en.txt")
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_BasicVoices", function(menu_manager)
----------------------------------------------------- All the sounds
	BasicVoices.dozerkill = function(self)
		BasicVoices:Play("bdz_post_kill_taunt")
	end
	BasicVoices.cptnspawn = function(self)
		BasicVoices:Play("cpa_a02_01")
	end
	BasicVoices.clkcharge = function(self)
		BasicVoices:Play("cloaker_detect_mono")
	end
	BasicVoices.taserskill = function(self)
		BasicVoices:Play("tsr_tasered")
	end
	BasicVoices.thermaldrill = function(self)
		BasicVoices:Play("Play_pln_branchbank_stage1_83")
	end
	BasicVoices.taserburn = function(self)
		BasicVoices:Play("tsr_burndeath")
	end
	BasicVoices.guardfire = function(self)
		BasicVoices:Play("l1n_a18")
	end
	BasicVoices.clkjingle = function(self)
		BasicVoices:Play("cloaker_detect_christmas_mono")
	end
	BasicVoices.clkkill = function(self)
		BasicVoices:Play("cloaker_taunt_after_assault")
	end
	BasicVoices.fwbheat = function(self)
		BasicVoices:Play("v34")
	end
	BasicVoices.keepcoming = function(self)
		BasicVoices:Play("play_pln_gen_count_17")
	end
	BasicVoices.analysisofair = function(self)
		BasicVoices:Play("v53")
	end
	BasicVoices.fwbcash = function(self)
		BasicVoices:Play("v47")
	end
	BasicVoices.fwbnegative = function(self)
		BasicVoices:Play("v48")
	end
	BasicVoices.fwbkeycard = function(self)
		BasicVoices:Play("v12")
	end
	BasicVoices.heisteraffirmitive = function(self)
		BasicVoices:Play("r01x_sin")
	end
	BasicVoices.heisteronmyway = function(self)
		BasicVoices:Play("r02a_sin")
	end
	BasicVoices.heisterlootbag = function(self)
		BasicVoices:Play("p27")
	end
	BasicVoices.heistergage = function(self)
		BasicVoices:Play("g92")
	end
	BasicVoices.heisterthank = function(self)
		BasicVoices:Play("s05x_sin")
	end
	BasicVoices.dozervisor = function(self)
		BasicVoices:Play("bdz_visor_lost")
	end
	BasicVoices.taserenterance = function(self)
		BasicVoices:Play("tsr_entrance")
	end
	BasicVoices.clkwhistle = function(self)
		BasicVoices:Play("cloaker_spawn")
	end
	BasicVoices.sheildknock = function(self)
		BasicVoices:Play("shield_identification")
	end
	BasicVoices.alarmbomb = function(self)
		BasicVoices:Play("alarm_the_bomb_on_slow_fade")
	end
	BasicVoices.bainpolice60 = function(self)
		BasicVoices:Play("Play_pln_polin_04")
	end
	BasicVoices.bainpolice40 = function(self)
		BasicVoices:Play("Play_pln_polin_03")
	end
	BasicVoices.bainpolice30 = function(self)
		BasicVoices:Play("Play_pln_polin_02")
	end
	BasicVoices.bainpolice20 = function(self)
		BasicVoices:Play("Play_pln_polin_01")
	end
	BasicVoices.bainpolice = function(self)
		BasicVoices:Play("Play_pln_pow_01")
	end
	BasicVoices.camerasignal = function(self)
		BasicVoices:Play("camera_alarm_signal")
	end
	BasicVoices.fwbc4 = function(self)
		BasicVoices:Play("v13")
	end
	BasicVoices.gotrobber = function(self)
		BasicVoices:Play("v14")
	end
	BasicVoices.fwbdrill = function(self)
		BasicVoices:Play("v23")
	end
	BasicVoices.heisterhands = function(self)
		BasicVoices:Play("lo1x_sin")
	end
	BasicVoices.heistersknees = function(self)
		BasicVoices:Play("l02x_sin")
	end
	BasicVoices.heistercuffs = function(self)
		BasicVoices:Play("l03x_sin")
	end
	BasicVoices.heistersinspire = function(self)
		BasicVoices:Play("g18")
	end
	BasicVoices.heistersinspireaced = function(self)
		BasicVoices:Play("f36x_any")
	end
	BasicVoices.heisterspotdozer = function(self)
		BasicVoices:Play("f30x_any")
	end
	BasicVoices.heisterohdozer = function(self)
		BasicVoices:Play("f30y_any")
	end
	BasicVoices.heistershield = function(self)
		BasicVoices:Play("f31x_any")
	end
	BasicVoices.heisterohshield = function(self)
		BasicVoices:Play("f31y_any")
	end
	BasicVoices.heistertaser = function(self)
		BasicVoices:Play("f32x_any")
	end
	BasicVoices.heisterohtaser = function(self)
		BasicVoices:Play("f32y_any")
	end
	BasicVoices.heisterclk = function(self)
		BasicVoices:Play("f33x_any")
	end
	BasicVoices.heisterohclk = function(self)
		BasicVoices:Play("f33y_any")
	end
	BasicVoices.fwbdoor = function(self)
		BasicVoices:Play("v16")
	end
	BasicVoices.heistersniper = function(self)
		BasicVoices:Play("f34x_any")
	end
	BasicVoices.heisterohsniper = function(self)
		BasicVoices:Play("f34y_any")
	end
	BasicVoices.stopallsounds = function(self)
		BasicVoices:Play("stop_all_music")
	end
	BasicVoices.cptnconfirm = function(self)
		BasicVoices:Play("cpw_a01")
	end
	BasicVoices.cptnwithdrawl = function(self)
		BasicVoices:Play("cpw_a04")
	end
	BasicVoices.cptntaunt = function(self)
		BasicVoices:Play("cpw_a02")
	end
	BasicVoices.clkwhoosh = function(self)
		BasicVoices:Play("clk_c01x_plu")
	end
	BasicVoices.clktaunt = function(self)
		BasicVoices:Play("cloaker_taunt_after_assault")
	end
	BasicVoices.clktauntassault = function(self)
		BasicVoices:Play("cloaker_taunt_during_assault")
	end
	BasicVoices.clkdeath = function(self)
		BasicVoices:Play("clk_x02a_any_3p")
	end
	BasicVoices.clkburn = function(self)
		BasicVoices:Play("clk_burnhurt")
	end
	BasicVoices.clkburndeath = function(self)
		BasicVoices:Play("clk_burndeath")
	end
	BasicVoices.heistersitdown = function(self)
		BasicVoices:Play("v58")
	end
	BasicVoices.heisterskydivehype = function(self)
		BasicVoices:Play("v55")
	end
	BasicVoices.heistershootdown = function(self)
		BasicVoices:Play("v49")
	end
	BasicVoices.heistergreeting = function(self)
		BasicVoices:Play("v56")
	end
	BasicVoices.heistervehiclestuck = function(self)
		BasicVoices:Play("v52")
	end
	BasicVoices.heisterturretcallout = function(self)
		BasicVoices:Play("v45")
	end
	BasicVoices.heistertaxmaninterrogate = function(self)
		BasicVoices:Play("f46x_any")
	end
	BasicVoices.heisterexcitedline = function(self)
		BasicVoices:Play("v46")
	end
	BasicVoices.heisterdrillbroke = function(self)
		BasicVoices:Play("d02x_sin")
	end	
	BasicVoices.heisterneedmeds = function(self)
		BasicVoices:Play("g80x_plu")
	end	
	BasicVoices.heisterneedammo = function(self)
		BasicVoices:Play("g81x_plu")
	end	
	BasicVoices.heisterplacedmeds = function(self)
		BasicVoices:Play("s01x_plu")
	end	
	BasicVoices.heisterplacedammo = function(self)
		BasicVoices:Play("s02x_plu")
	end
	BasicVoices.heistermaskon = function(self)
		BasicVoices:Play("a01x_any")
	end
	BasicVoices.baintakingbags = function(self)
		BasicVoices:Play("play_pln_gen_bgst_01")
	end
	BasicVoices.bainmovemovemove = function(self)
		BasicVoices:Play("play_pln_gen_urg_01")
	end
	BasicVoices.heistersuccesslines = function(self)
		BasicVoices:Play("g24")
	end
	BasicVoices.santahohoho = function(self)
		BasicVoices:Play("santa_hoho")
	end
	BasicVoices.guardhesarmed = function(self)
		BasicVoices:Play("a01_l1n")
	end	
	BasicVoices.heisterpageranswer = function(self)
		BasicVoices:Play("dsp_radio_checking_1")
	end
	BasicVoices.modstopstatic = function(self)
		BasicVoices:Play("dsp_stop_all")
	end
	BasicVoices.goatheadbutt = function(self)
		BasicVoices:Play("goat_headbutt")
	end
	BasicVoices.heisterwhistle = function(self)
		BasicVoices:Play("whistling_attention")
	end	
-----------------------------------------------------
	MenuHelper:LoadFromJsonFile(BasicVoices._path .. "menu.txt", BasicVoices, BasicVoices._data)
end)

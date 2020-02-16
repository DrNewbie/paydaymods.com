_G.BasicVoices4 = _G.BasicVoices4 or {}
BasicVoices4._path = ModPath
BasicVoices4._data = {}

function BasicVoices4:Play(soundfile)
	if Utils:IsInHeist() and Utils:IsInCustody() == false and Utils:IsInGameState() then
		managers.player:local_player():sound():say(soundfile,true,true)
	end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_BasicVoices4", function(loc)
	loc:load_localization_file(BasicVoices4._path .. "en.txt")
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_BasicVoices4", function(menu_manager)
----------------------------------------------------- All the sounds
	BasicVoices4.santahohoho = function(self)
		BasicVoices4:Play("santa_hoho")
	end
	BasicVoices4.biledeath = function(self)
		BasicVoices4:Play("play_plt_a64")
	end
	BasicVoices4.cscouple1 = function(self)
		BasicVoices4:Play("play_cpl_ch1_01")
	end
	BasicVoices4.cscouple2 = function(self)
		BasicVoices4:Play("play_cpl_ch1_02")
	end
	BasicVoices4.csmanager = function(self)
		BasicVoices4:Play("play_man_ch1_01")
	end
	BasicVoices4.csreceptionist = function(self)
		BasicVoices4:Play("play_rcp_ch1_01")
	end
	BasicVoices4.telleryes = function(self)
		BasicVoices4:Play("teller_customer_dialog_approve")
	end
	BasicVoices4.tellerno = function(self)
		BasicVoices4:Play("teller_customer_dialog_deny")
	end
	BasicVoices4.cm1bh = function(self)
		BasicVoices4:Play("cm1_burnhurt")
	end
	BasicVoices4.cm2bh = function(self)
		BasicVoices4:Play("cm2_burnhurt")
	end
	BasicVoices4.cm3bh = function(self)
		BasicVoices4:Play("cm3_burnhurt")
	end
	BasicVoices4.cm4bh = function(self)
		BasicVoices4:Play("cm4_burnhurt")
	end
	BasicVoices4.cm5bh = function(self)
		BasicVoices4:Play("cm5_burnhurt")
	end
	
	BasicVoices4.cm1bd = function(self)
		BasicVoices4:Play("cm1_burndeath")
	end
	BasicVoices4.cm2bd = function(self)
		BasicVoices4:Play("cm2_burndeath")
	end
	BasicVoices4.cm3bd = function(self)
		BasicVoices4:Play("cm3_burndeath")
	end
	BasicVoices4.cm4bd = function(self)
		BasicVoices4:Play("cm4_burndeath")
	end
	BasicVoices4.cm5bd = function(self)
		BasicVoices4:Play("cm5_burndeath")
	end
	BasicVoices4.cf1bh = function(self)
		BasicVoices4:Play("cf1_burnhurt")
	end
	BasicVoices4.cf2bh = function(self)
		BasicVoices4:Play("cf2_burnhurt")
	end
	BasicVoices4.cf3bh = function(self)
		BasicVoices4:Play("cf3_burnhurt")
	end
	BasicVoices4.cf4bh = function(self)
		BasicVoices4:Play("cf4_burnhurt")
	end
	BasicVoices4.cf5bh = function(self)
		BasicVoices4:Play("cf5_burnhurt")
	end
	
	BasicVoices4.cf1bd = function(self)
		BasicVoices4:Play("cf1_burndeath")
	end
	BasicVoices4.cm1911 = function(self)
		BasicVoices4:Play("cm1_911_call")
	end
	BasicVoices4.cf2bd = function(self)
		BasicVoices4:Play("cf2_burndeath")
	end
	BasicVoices4.cf3bd = function(self)
		BasicVoices4:Play("cf3_burndeath")
	end
	BasicVoices4.cf4bd = function(self)
		BasicVoices4:Play("cf4_burndeath")
	end
	BasicVoices4.cf5bd = function(self)
		BasicVoices4:Play("cf5_burndeath")
	end
	BasicVoices4.cm2911 = function(self)
		BasicVoices4:Play("cm2_911_call")
	end
	BasicVoices4.cm3911 = function(self)
		BasicVoices4:Play("cm3_911_call")
	end
	BasicVoices4.cm4911 = function(self)
		BasicVoices4:Play("cm4_911_call")
	end
	BasicVoices4.cm5911 = function(self)
		BasicVoices4:Play("cm5_911_call")
	end
	
	BasicVoices4.cm1ss = function(self)
		BasicVoices4:Play("cm1_stockholm_syndrome")
	end
	BasicVoices4.cm2ss = function(self)
		BasicVoices4:Play("cm2_stockholm_syndrome")
	end
	BasicVoices4.cm3ss = function(self)
		BasicVoices4:Play("cm3_stockholm_syndrome")
	end
	BasicVoices4.cm4ss = function(self)
		BasicVoices4:Play("cm4_stockholm_syndrome")
	end
	BasicVoices4.cm5ss = function(self)
		BasicVoices4:Play("cm5_stockholm_syndrome")
	end
	
	BasicVoices4.cm1s1 = function(self)
		BasicVoices4:Play("cm1_a01x_any")
	end
	BasicVoices4.cm2s1 = function(self)
		BasicVoices4:Play("cm2_a01x_any")
	end
	BasicVoices4.cm3s1 = function(self)
		BasicVoices4:Play("cm3_a01x_any")
	end
	BasicVoices4.cm4s1 = function(self)
		BasicVoices4:Play("cm4_a01x_any")
	end
	BasicVoices4.cm5s1 = function(self)
		BasicVoices4:Play("cm5_a01x_any")
	end
	
	BasicVoices4.cm1s2 = function(self)
		BasicVoices4:Play("cm1_a02x_any")
	end
	BasicVoices4.cm2s2 = function(self)
		BasicVoices4:Play("cm2_a02x_any")
	end
	BasicVoices4.cm3s2 = function(self)
		BasicVoices4:Play("cm3_a02x_any")
	end
	BasicVoices4.cm4s2 = function(self)
		BasicVoices4:Play("cm4_a02x_any")
	end
	BasicVoices4.cm5s2 = function(self)
		BasicVoices4:Play("cm5_a02x_any")
	end
	
	BasicVoices4.cm1s3 = function(self)
		BasicVoices4:Play("cm1_a03x_any")
	end
	BasicVoices4.cm2s3 = function(self)
		BasicVoices4:Play("cm2_a03x_any")
	end
	BasicVoices4.cm3s3 = function(self)
		BasicVoices4:Play("cm3_a03x_any")
	end
	BasicVoices4.cm4s3 = function(self)
		BasicVoices4:Play("cm4_a03x_any")
	end
	BasicVoices4.cm5s3 = function(self)
		BasicVoices4:Play("cm5_a03x_any")
	end
	BasicVoices4.cm6bh = function(self)
		BasicVoices4:Play("cm6_burnhurt")
	end
	BasicVoices4.cm6bd = function(self)
		BasicVoices4:Play("cm6_burndeath")
	end
	BasicVoices4.cm6911 = function(self)
		BasicVoices4:Play("cm6_911_call")
	end
	BasicVoices4.cm6ss = function(self)
		BasicVoices4:Play("cm6_stockholm_syndrome")
	end
	BasicVoices4.cm6s1 = function(self)
		BasicVoices4:Play("cm6_a01x_any")
	end
	BasicVoices4.cm6s2 = function(self)
		BasicVoices4:Play("cm6_a02x_any")
	end
	BasicVoices4.cm6s3 = function(self)
		BasicVoices4:Play("cm6_a03x_any")
	end
	BasicVoices4.cf1s1 = function(self)
		BasicVoices4:Play("cf1_a01x_any")
	end
	BasicVoices4.cf2s1 = function(self)
		BasicVoices4:Play("cf2_a01x_any")
	end
	BasicVoices4.cf3s1 = function(self)
		BasicVoices4:Play("cf3_a01x_any")
	end
	BasicVoices4.cf4s1 = function(self)
		BasicVoices4:Play("cf4_a01x_any")
	end
	BasicVoices4.cf5s1 = function(self)
		BasicVoices4:Play("cf5_a01x_any")
	end
	BasicVoices4.cf1s2 = function(self)
		BasicVoices4:Play("cf1_a02x_any")
	end
	BasicVoices4.cf2s2 = function(self)
		BasicVoices4:Play("cf2_a02x_any")
	end
	BasicVoices4.cf3s2 = function(self)
		BasicVoices4:Play("cf3_a02x_any")
	end
	BasicVoices4.cf4s2 = function(self)
		BasicVoices4:Play("cf4_a02x_any")
	end
	BasicVoices4.cf5s2 = function(self)
		BasicVoices4:Play("cf5_a02x_any")
	end
	BasicVoices4.cf1s3 = function(self)
		BasicVoices4:Play("cf1_a03x_any")
	end
	BasicVoices4.cf2s3 = function(self)
		BasicVoices4:Play("cf2_a03x_any")
	end
	BasicVoices4.cf3s3 = function(self)
		BasicVoices4:Play("cf3_a03x_any")
	end
	BasicVoices4.cf4s3 = function(self)
		BasicVoices4:Play("cf4_a03x_any")
	end
	BasicVoices4.cf5s3 = function(self)
		BasicVoices4:Play("cf5_a03x_any")
	end
	BasicVoices4.acountdownloop = function(self)
		BasicVoices4:Play("alarm_countdown_loop")
	end
	BasicVoices4.acountdownloopstop = function(self)
		BasicVoices4:Play("alarm_countdown_loop_stop")
	end
	BasicVoices4.acountdown10 = function(self)
		BasicVoices4:Play("alarm_countdown_ticking_down_10sec")
	end
	BasicVoices4.afire = function(self)
		BasicVoices4:Play("alarm_fire")
	end
	BasicVoices4.afirestop = function(self)
		BasicVoices4:Play("alarm_fire_stop")
	end
	BasicVoices4.akosugi = function(self)
		BasicVoices4:Play("alarm_kosugi_on_slow_fade")
	end
	BasicVoices4.akosugioff = function(self)
		BasicVoices4:Play("alarm_kosugi_off")
	end
	BasicVoices4.amuseum = function(self)
		BasicVoices4:Play("alarm_museum_on_slow_fade")
	end
	BasicVoices4.amuseumoff = function(self)
		BasicVoices4:Play("alarm_museum_off")
	end
	BasicVoices4.ajewel = function(self)
		BasicVoices4:Play("jewelry_alarm_on_slow_fade")
	end
	BasicVoices4.ajeweloff = function(self)
		BasicVoices4:Play("jewelry_alarm_off")
	end
	BasicVoices4.ahiteclotec = function(self)
		BasicVoices4:Play("hitec_lotec_alarm_slow_fade")
	end
	BasicVoices4.ahiteclotecoff = function(self)
		BasicVoices4:Play("hitec_lotec_alarm_off")
	end
	BasicVoices4.c4blows = function(self)
		BasicVoices4:Play("swat_explosion")
	end
	BasicVoices4.c4blowwindow = function(self)
		BasicVoices4:Play("swat_blows_window_medium")
	end
	BasicVoices4.c4bip = function(self)
		BasicVoices4:Play("c4_beep_loop")
	end
	BasicVoices4.siren1 = function(self)
		BasicVoices4:Play("bd_police_siren_01")
	end
	BasicVoices4.siren2 = function(self)
		BasicVoices4:Play("bd_police_siren_02")
	end
	BasicVoices4.siren3 = function(self)
		BasicVoices4:Play("bd_police_siren_03")
	end
	BasicVoices4.siren4 = function(self)
		BasicVoices4:Play("bd_police_siren_04")
	end
	BasicVoices4.policeradio = function(self)
		BasicVoices4:Play("police_radio")
	end
	BasicVoices4.fire1 = function(self)
		BasicVoices4:Play("burn_loop_body")
	end
	BasicVoices4.fire2 = function(self)
		BasicVoices4:Play("burn_loop_gen")
	end
	BasicVoices4.fire3 = function(self)
		BasicVoices4:Play("large_fire")
	end
	BasicVoices4.gfanwoosh = function(self)
		BasicVoices4:Play("goat_fan_woosh")
	end
	BasicVoices4.ghscaffold = function(self)
		BasicVoices4:Play("goat_hang_scaffold")
	end
	BasicVoices4.gheadbutt = function(self)
		BasicVoices4:Play("goat_headbutt")
	end
	BasicVoices4.gjump = function(self)
		BasicVoices4:Play("goat_jump")
	end
	BasicVoices4.gkick = function(self)
		BasicVoices4:Play("goat_kick")
	end
	BasicVoices4.glick = function(self)
		BasicVoices4:Play("goat_lick")
	end
	BasicVoices4.gmeh = function(self)
		BasicVoices4:Play("goat_says_meh")
	end
	BasicVoices4.gmehloop = function(self)
		BasicVoices4:Play("goat_says_meh_loop")
	end
	BasicVoices4.gsleep = function(self)
		BasicVoices4:Play("goat_sleep")
	end
	BasicVoices4.gsleepstop = function(self)
		BasicVoices4:Play("goat_sleep_stop")
	end
-----------------------------------------------------
	MenuHelper:LoadFromJsonFile(BasicVoices4._path .. "menu.txt", BasicVoices4, BasicVoices4._data)
end)

_G.BasicVoices8 = _G.BasicVoices8 or {}
BasicVoices8._path = ModPath
BasicVoices8._data = {}

function BasicVoices8:Play(soundfile)
	if Utils:IsInHeist() and Utils:IsInCustody() == false and Utils:IsInGameState() then
		managers.player:local_player():sound():say(soundfile,true,true)
	end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_BasicVoices8", function(loc)
	loc:load_localization_file(BasicVoices8._path .. "en.txt")
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_BasicVoices8", function(menu_manager)
----------------------------------------------------- All the sounds
	BasicVoices8.bdrillgogetit = function(self)
		BasicVoices8:Play("play_pln_branchbank_stage1_83")
	end
	
	BasicVoices8.bdallassolo = function(self)
		BasicVoices8:Play("play_ban_i20la")
	end
	BasicVoices8.bdallasdown = function(self)
		BasicVoices8:Play("play_ban_q01a")
	end
	BasicVoices8.bdallascust = function(self)
		BasicVoices8:Play("play_ban_h11a")
	end
	BasicVoices8.bdallasfree = function(self)
		BasicVoices8:Play("play_ban_q02a")
	end
	BasicVoices8.bchainssolo = function(self)
		BasicVoices8:Play("play_ban_i20b")
	end
	BasicVoices8.bchainsdown = function(self)
		BasicVoices8:Play("play_ban_q01b")
	end
	BasicVoices8.bchainscust = function(self)
		BasicVoices8:Play("play_ban_h11b")
	end
	BasicVoices8.bchainsfree = function(self)
		BasicVoices8:Play("play_ban_q02b")
	end
	BasicVoices8.bwolfsolo = function(self)
		BasicVoices8:Play("play_ban_i20c")
	end
	BasicVoices8.bwolfdown = function(self)
		BasicVoices8:Play("play_ban_q01c")
	end
	BasicVoices8.bwolfcust = function(self)
		BasicVoices8:Play("play_ban_h11c")
	end
	BasicVoices8.bwolffree = function(self)
		BasicVoices8:Play("play_ban_q02c")
	end
	BasicVoices8.bhoxtonsolo = function(self)
		BasicVoices8:Play("play_ban_i20d")
	end
	BasicVoices8.bhoxtondown = function(self)
		BasicVoices8:Play("play_ban_q01d")
	end
	BasicVoices8.bhoxtoncust = function(self)
		BasicVoices8:Play("play_ban_h11d")
	end
	BasicVoices8.bhoxtonfree = function(self)
		BasicVoices8:Play("play_ban_q02d")
	end
	BasicVoices8.bhoustondown = function(self)
		BasicVoices8:Play("play_ban_q01l")
	end
	BasicVoices8.bhoustoncust = function(self)
		BasicVoices8:Play("play_ban_h11l")
	end
	BasicVoices8.bhoustonfree = function(self)
		BasicVoices8:Play("play_ban_q02l")
	end
	BasicVoices8.bwickdown = function(self)
		BasicVoices8:Play("play_ban_q01m")
	end
	BasicVoices8.bwickcust = function(self)
		BasicVoices8:Play("play_ban_h11m")
	end
	BasicVoices8.bwickfree = function(self)
		BasicVoices8:Play("play_ban_q02m")
	end
	BasicVoices8.bcloverdown = function(self)
		BasicVoices8:Play("play_ban_q01n")
	end
	BasicVoices8.bclovercust = function(self)
		BasicVoices8:Play("play_ban_h11n")
	end
	BasicVoices8.bcloverfree = function(self)
		BasicVoices8:Play("play_ban_q02n")
	end
	BasicVoices8.bdragandown = function(self)
		BasicVoices8:Play("play_ban_q01o")
	end
	BasicVoices8.bdragancust = function(self)
		BasicVoices8:Play("play_ban_h11o")
	end
	BasicVoices8.bdraganfree = function(self)
		BasicVoices8:Play("play_ban_q02o")
	end
	BasicVoices8.bjacketdown = function(self)
		BasicVoices8:Play("play_ban_q01p")
	end
	BasicVoices8.bjacketcust = function(self)
		BasicVoices8:Play("play_ban_h11p")
	end
	BasicVoices8.bjacketfree = function(self)
		BasicVoices8:Play("play_ban_q02p")
	end
	BasicVoices8.bbonniedown = function(self)
		BasicVoices8:Play("play_ban_q01q")
	end
	BasicVoices8.bbonniecust = function(self)
		BasicVoices8:Play("play_ban_h11q")
	end
	BasicVoices8.bbonniefree = function(self)
		BasicVoices8:Play("play_ban_q02q")
	end
	BasicVoices8.bsokoldown = function(self)
		BasicVoices8:Play("play_ban_q01r")
	end
	BasicVoices8.bsokolcust = function(self)
		BasicVoices8:Play("play_ban_h11r")
	end
	BasicVoices8.bsokolfree = function(self)
		BasicVoices8:Play("play_ban_q02r")
	end
	BasicVoices8.bjirodown = function(self)
		BasicVoices8:Play("play_ban_q01s")
	end
	BasicVoices8.bjirocust = function(self)
		BasicVoices8:Play("play_ban_h11s")
	end
	BasicVoices8.bjirofree = function(self)
		BasicVoices8:Play("play_ban_q02s")
	end
	BasicVoices8.bbodhidown = function(self)
		BasicVoices8:Play("play_ban_q01t")
	end
	BasicVoices8.bbodhicust = function(self)
		BasicVoices8:Play("play_ban_h11t")
	end
	BasicVoices8.bbodhifree = function(self)
		BasicVoices8:Play("play_ban_q02t")
	end
	BasicVoices8.bjimmydown = function(self)
		BasicVoices8:Play("play_ban_q01u")
	end
	BasicVoices8.bjimmycust = function(self)
		BasicVoices8:Play("play_ban_h11u")
	end
	BasicVoices8.bjimmyfree = function(self)
		BasicVoices8:Play("play_ban_q02u")
	end
	BasicVoices8.bsydneydown = function(self)
		BasicVoices8:Play("play_ban_q01v")
	end
	BasicVoices8.bsydneycust = function(self)
		BasicVoices8:Play("play_ban_h11v")
	end
	BasicVoices8.bsydneyfree = function(self)
		BasicVoices8:Play("play_ban_q02v")
	end
	BasicVoices8.brustdown = function(self)
		BasicVoices8:Play("play_ban_q01w")
	end
	BasicVoices8.brustcust = function(self)
		BasicVoices8:Play("play_ban_h11w")
	end
	BasicVoices8.brustfree = function(self)
		BasicVoices8:Play("play_ban_q02w")
	end
	BasicVoices8.bscarfacedown = function(self)
		BasicVoices8:Play("play_ban_q01x")
	end
	BasicVoices8.bscarfacecust = function(self)
		BasicVoices8:Play("play_ban_h11x")
	end
	BasicVoices8.bscarfacefree = function(self)
		BasicVoices8:Play("play_ban_q02x")
	end
	BasicVoices8.bassaultsoon = function(self)
		BasicVoices8:Play("play_ban_b01a")
	end
	BasicVoices8.bassault30 = function(self)
		BasicVoices8:Play("play_ban_b01b")
	end
	BasicVoices8.bassault20 = function(self)
		BasicVoices8:Play("play_ban_b02a")
	end
	BasicVoices8.bassault10 = function(self)
		BasicVoices8:Play("play_ban_b02b")
	end
	BasicVoices8.bassaultstart = function(self)
		BasicVoices8:Play("play_ban_b02c")
	end
	BasicVoices8.bnextassault30 = function(self)
		BasicVoices8:Play("play_ban_b03x")
	end
	BasicVoices8.bnextassault20 = function(self)
		BasicVoices8:Play("play_ban_b04x")
	end
	BasicVoices8.bnextassault10= function(self)
		BasicVoices8:Play("play_ban_b05x")
	end
	BasicVoices8.bassaultsurvived1 = function(self)
		BasicVoices8:Play("play_ban_b10")
	end
	BasicVoices8.bassaultsurvived2 = function(self)
		BasicVoices8:Play("play_ban_b11")
	end
	BasicVoices8.bassaultsurvived3 = function(self)
		BasicVoices8:Play("play_ban_b12")
	end
	BasicVoices8.b30 = function(self)
		BasicVoices8:Play("play_pln_gen_bfr_02")
	end
	BasicVoices8.b60 = function(self)
		BasicVoices8:Play("play_pln_gen_bfr_03")
	end
	BasicVoices8.b120 = function(self)
		BasicVoices8:Play("play_pln_gen_bfr_04")
	end
	BasicVoices8.b1 = function(self)
		BasicVoices8:Play("play_pln_gen_count_01")
	end
	BasicVoices8.b2 = function(self)
		BasicVoices8:Play("play_pln_gen_count_02")
	end
	BasicVoices8.b3 = function(self)
		BasicVoices8:Play("play_pln_gen_count_03")
	end
	BasicVoices8.b4 = function(self)
		BasicVoices8:Play("play_pln_gen_count_04")
	end
	BasicVoices8.b5 = function(self)
		BasicVoices8:Play("play_pln_gen_count_05")
	end
	BasicVoices8.b6 = function(self)
		BasicVoices8:Play("play_pln_gen_count_06")
	end
	BasicVoices8.b7 = function(self)
		BasicVoices8:Play("play_pln_gen_count_07")
	end
	BasicVoices8.b8 = function(self)
		BasicVoices8:Play("play_pln_gen_count_08")
	end
	BasicVoices8.b9 = function(self)
		BasicVoices8:Play("play_pln_gen_count_09")
	end
	BasicVoices8.b10 = function(self)
		BasicVoices8:Play("play_pln_gen_count_10")
	end
	BasicVoices8.b11 = function(self)
		BasicVoices8:Play("play_pln_gen_count_11")
	end
	BasicVoices8.b12 = function(self)
		BasicVoices8:Play("play_pln_gen_count_12")
	end
	BasicVoices8.b13 = function(self)
		BasicVoices8:Play("play_pln_gen_count_13")
	end
	BasicVoices8.b14 = function(self)
		BasicVoices8:Play("play_pln_gen_count_14")
	end
	BasicVoices8.b15 = function(self)
		BasicVoices8:Play("play_pln_gen_count_15")
	end
	BasicVoices8.b16 = function(self)
		BasicVoices8:Play("play_pln_gen_count_16")
	end
	BasicVoices8.b17 = function(self)
		BasicVoices8:Play("play_pln_gen_count_17")
	end
	BasicVoices8.bd1 = function(self)
		BasicVoices8:Play("play_pln_gen_dir_01")
	end
	BasicVoices8.bd2 = function(self)
		BasicVoices8:Play("play_pln_gen_dir_02")
	end
	BasicVoices8.bd3 = function(self)
		BasicVoices8:Play("play_pln_gen_dir_03")
	end
	BasicVoices8.bd4 = function(self)
		BasicVoices8:Play("play_pln_gen_dir_04")
	end
	BasicVoices8.bd5 = function(self)
		BasicVoices8:Play("play_pln_gen_dir_05")
	end
	BasicVoices8.bd6 = function(self)
		BasicVoices8:Play("play_pln_gen_dir_06")
	end
	BasicVoices8.ba1 = function(self)
		BasicVoices8:Play("play_pln_gen_att_01")
	end
	BasicVoices8.ba2 = function(self)
		BasicVoices8:Play("play_pln_gen_att_02")
	end
	BasicVoices8.ba3 = function(self)
		BasicVoices8:Play("play_pln_gen_att_03")
	end
	BasicVoices8.ba4 = function(self)
		BasicVoices8:Play("play_pln_gen_att_04")
	end
	BasicVoices8.ba5 = function(self)
		BasicVoices8:Play("play_pln_gen_att_05")
	end
	BasicVoices8.ba6 = function(self)
		BasicVoices8:Play("play_pln_gen_att_06")
	end
	BasicVoices8.ba7 = function(self)
		BasicVoices8:Play("play_pln_gen_att_07")
	end
	BasicVoices8.ba8 = function(self)
		BasicVoices8:Play("play_pln_gen_att_08")
	end
	BasicVoices8.ba9 = function(self)
		BasicVoices8:Play("play_pln_gen_att_09")
	end
	BasicVoices8.ba10 = function(self)
		BasicVoices8:Play("play_pln_gen_att_10")
	end
	BasicVoices8.ba11 = function(self)
		BasicVoices8:Play("play_pln_gen_att_11")
	end
	BasicVoices8.ba12 = function(self)
		BasicVoices8:Play("play_pln_gen_att_12")
	end
	BasicVoices8.ba13 = function(self)
		BasicVoices8:Play("play_pln_gen_att_13")
	end
	BasicVoices8.balarm1 = function(self)
		BasicVoices8:Play("play_pln_gen_alm_01")
	end
	BasicVoices8.balarm2 = function(self)
		BasicVoices8:Play("play_pln_gen_alm_02")
	end
	BasicVoices8.bpag1 = function(self)
		BasicVoices8:Play("play_pln_pager_a")
	end
	BasicVoices8.bpag2 = function(self)
		BasicVoices8:Play("play_pln_pager_b")
	end
	BasicVoices8.bpag3 = function(self)
		BasicVoices8:Play("play_pln_pager_d")
	end
	BasicVoices8.bpag4 = function(self)
		BasicVoices8:Play("play_pln_pager_e")
	end
	BasicVoices8.bpag5 = function(self)
		BasicVoices8:Play("play_pln_pager_f")
	end
	BasicVoices8.bpag6 = function(self)
		BasicVoices8:Play("play_pln_pager_g")
	end
	BasicVoices8.bpag7 = function(self)
		BasicVoices8:Play("play_pln_pager_h")
	end
	BasicVoices8.bpat1 = function(self)
		BasicVoices8:Play("play_pln_pat_01")
	end
	BasicVoices8.bpat2 = function(self)
		BasicVoices8:Play("play_pln_pat_02")
	end
	BasicVoices8.bpat3 = function(self)
		BasicVoices8:Play("play_pln_pat_03")
	end
	BasicVoices8.bpat4 = function(self)
		BasicVoices8:Play("play_pln_pat_04")
	end
	BasicVoices8.bpat5 = function(self)
		BasicVoices8:Play("play_pln_pat_05")
	end
	BasicVoices8.bradio1 = function(self)
		BasicVoices8:Play("play_pln_radio_break")
	end
	BasicVoices8.bradio2 = function(self)
		BasicVoices8:Play("play_pln_radio_failed")
	end
	BasicVoices8.bradio3 = function(self)
		BasicVoices8:Play("play_pln_radio_missed")
	end
	BasicVoices8.bradio4 = function(self)
		BasicVoices8:Play("play_pln_radio_success")
	end
	BasicVoices8.bspawn = function(self)
		BasicVoices8:Play("play_pln_spawn_01")
	end
	BasicVoices8.balarmany = function(self)
		BasicVoices8:Play("play_alm_any_any")
	end
	BasicVoices8.bs1a = function(self)
		BasicVoices8:Play("play_ban_s01_a")
	end
	BasicVoices8.bs1b = function(self)
		BasicVoices8:Play("play_ban_s01_b")
	end
	BasicVoices8.bs2a = function(self)
		BasicVoices8:Play("play_ban_s02_a")
	end
	BasicVoices8.bs2b = function(self)
		BasicVoices8:Play("play_ban_s02_b")
	end
	BasicVoices8.bs3a = function(self)
		BasicVoices8:Play("play_ban_s03_a")
	end
	BasicVoices8.bs3b = function(self)
		BasicVoices8:Play("play_ban_s03_b")
	end
	BasicVoices8.bs4 = function(self)
		BasicVoices8:Play("play_ban_s04")
	end
	BasicVoices8.bs5 = function(self)
		BasicVoices8:Play("play_ban_s05")
	end
	BasicVoices8.bfreeh1 = function(self)
		BasicVoices8:Play("play_ban_r01")
	end
	BasicVoices8.bfreeh2 = function(self)
		BasicVoices8:Play("play_ban_r02")
	end
	BasicVoices8.bfreeh3 = function(self)
		BasicVoices8:Play("play_ban_r03")
	end
	BasicVoices8.bfreeh4 = function(self)
		BasicVoices8:Play("play_ban_r04")
	end
	BasicVoices8.bpoliceway = function(self)
		BasicVoices8:Play("play_pln_pow_01")
	end
	BasicVoices8.bpolice20 = function(self)
		BasicVoices8:Play("play_pln_polin_01")
	end
	BasicVoices8.bpolice30 = function(self)
		BasicVoices8:Play("play_pln_polin_02")
	end
	BasicVoices8.bpolice40 = function(self)
		BasicVoices8:Play("play_pln_polin_03")
	end
	BasicVoices8.bpolice60 = function(self)
		BasicVoices8:Play("play_pln_polin_04")
	end
	BasicVoices8.bdepcops1 = function(self)
		BasicVoices8:Play("play_pln_gen_pol_01")
	end
	BasicVoices8.bdepcops2 = function(self)
		BasicVoices8:Play("play_pln_gen_pol_02")
	end
	BasicVoices8.bdepcops3 = function(self)
		BasicVoices8:Play("play_pln_gen_pol_03")
	end
	BasicVoices8.bdepcops4 = function(self)
		BasicVoices8:Play("play_pln_indif_01")
	end
	BasicVoices8.bsnipers1 = function(self)
		BasicVoices8:Play("play_pln_gen_snip_01")
	end
	BasicVoices8.bsnipers2 = function(self)
		BasicVoices8:Play("play_pln_gen_snip_02")
	end
	BasicVoices8.bsnipers3 = function(self)
		BasicVoices8:Play("play_pln_gen_snip_03")
	end
	BasicVoices8.bsnipers4 = function(self)
		BasicVoices8:Play("play_pln_gen_snip_04")
	end
	BasicVoices8.bsnipers5 = function(self)
		BasicVoices8:Play("play_pln_gen_snip_05")
	end
	BasicVoices8.bsnipers6 = function(self)
		BasicVoices8:Play("play_pln_gen_snip_06")
	end
	
	BasicVoices8.bciv1 = function(self)
		BasicVoices8:Play("play_pln_ctci_01")
	end
	BasicVoices8.bciv2 = function(self)
		BasicVoices8:Play("play_ban_c01")
	end
	BasicVoices8.bciv3 = function(self)
		BasicVoices8:Play("play_ban_c02")
	end
	BasicVoices8.bciv4 = function(self)
		BasicVoices8:Play("play_ban_c03")
	end
	BasicVoices8.bhosdal = function(self)
		BasicVoices8:Play("play_ban_h02a")
	end
	BasicVoices8.bhoscha = function(self)
		BasicVoices8:Play("play_ban_h02b")
	end
	BasicVoices8.bhoswolf = function(self)
		BasicVoices8:Play("play_ban_h02c")
	end
	BasicVoices8.bhoshox = function(self)
		BasicVoices8:Play("play_ban_h02d")
	end
	BasicVoices8.bhoshous = function(self)
		BasicVoices8:Play("play_ban_h02l")
	end
	BasicVoices8.bhoswick = function(self)
		BasicVoices8:Play("play_ban_h02m")
	end
	BasicVoices8.bhosclo = function(self)
		BasicVoices8:Play("play_ban_h02n")
	end
	BasicVoices8.bhosdra = function(self)
		BasicVoices8:Play("play_ban_h02o")
	end
	BasicVoices8.bhosjac = function(self)
		BasicVoices8:Play("play_ban_h02p")
	end
	BasicVoices8.bhosbon = function(self)
		BasicVoices8:Play("play_ban_h02q")
	end
	BasicVoices8.bhossok = function(self)
		BasicVoices8:Play("play_ban_h02r")
	end
	BasicVoices8.bhosjiro = function(self)
		BasicVoices8:Play("play_ban_h02s")
	end
	BasicVoices8.bhosbod = function(self)
		BasicVoices8:Play("play_ban_h02t")
	end
	BasicVoices8.bhosjim = function(self)
		BasicVoices8:Play("play_ban_h02u")
	end
	BasicVoices8.bhossyd = function(self)
		BasicVoices8:Play("play_ban_h02v")
	end
	BasicVoices8.bhosrust = function(self)
		BasicVoices8:Play("play_ban_h02w")
	end
	BasicVoices8.bhostony = function(self)
		BasicVoices8:Play("play_ban_h02x")
	end
	BasicVoices8.bbusted1 = function(self)
		BasicVoices8:Play("play_ban_h13x")
	end
	BasicVoices8.bbusted2 = function(self)
		BasicVoices8:Play("play_ban_h14x")
	end
	BasicVoices8.bbusted3 = function(self)
		BasicVoices8:Play("play_ban_h15x")
	end
	BasicVoices8.bbusted4 = function(self)
		BasicVoices8:Play("play_ban_h16x")
	end
	BasicVoices8.bbusted5 = function(self)
		BasicVoices8:Play("play_ban_h17x")
	end
	BasicVoices8.bbusted6 = function(self)
		BasicVoices8:Play("play_ban_h18x")
	end
	BasicVoices8.brelease1 = function(self)
		BasicVoices8:Play("play_ban_h19x")
	end
	BasicVoices8.brelease2 = function(self)
		BasicVoices8:Play("play_ban_h20x")
	end
	BasicVoices8.brelease3 = function(self)
		BasicVoices8:Play("play_ban_h21x")
	end
	BasicVoices8.busted7 = function(self)
		BasicVoices8:Play("play_ban_h22x")
	end
	BasicVoices8.bhostrade1 = function(self)
		BasicVoices8:Play("play_ban_h23x")
	end
	BasicVoices8.bhostrade2 = function(self)
		BasicVoices8:Play("play_ban_h24x")
	end
	BasicVoices8.bbusted8 = function(self)
		BasicVoices8:Play("play_ban_h31x")
	end
	BasicVoices8.bbusted9 = function(self)
		BasicVoices8:Play("play_ban_h32x")
	end
	BasicVoices8.bbusted10 = function(self)
		BasicVoices8:Play("play_ban_h33x")
	end
	BasicVoices8.bbusted11 = function(self)
		BasicVoices8:Play("play_ban_h34x")
	end
	BasicVoices8.bhostrade3 = function(self)
		BasicVoices8:Play("play_ban_h36x")
	end
	BasicVoices8.bhostrade4 = function(self)
		BasicVoices8:Play("play_ban_h38x")
	end
	BasicVoices8.bhostrade5 = function(self)
		BasicVoices8:Play("play_ban_h50x")
	end
	BasicVoices8.bhostradedal1 = function(self)
		BasicVoices8:Play("play_ban_h37a")
	end
	BasicVoices8.bhostradedal2 = function(self)
		BasicVoices8:Play("play_ban_h40a")
	end
	BasicVoices8.bhostradedal3 = function(self)
		BasicVoices8:Play("play_ban_h42a")
	end
	BasicVoices8.bhostradecha1 = function(self)
		BasicVoices8:Play("play_ban_h37b")
	end
	BasicVoices8.bhostradecha2 = function(self)
		BasicVoices8:Play("play_ban_h40b")
	end
	BasicVoices8.bhostradecha3 = function(self)
		BasicVoices8:Play("play_ban_h42b")
	end	
	BasicVoices8.bhostradewolf1 = function(self)
		BasicVoices8:Play("play_ban_h37c")
	end
	BasicVoices8.bhostradewolf2 = function(self)
		BasicVoices8:Play("play_ban_h40c")
	end
	BasicVoices8.bhostradewolf3 = function(self)
		BasicVoices8:Play("play_ban_h42c")
	end	
	BasicVoices8.bhostradehox1 = function(self)
		BasicVoices8:Play("play_ban_h37d")
	end
	BasicVoices8.bhostradehox2 = function(self)
		BasicVoices8:Play("play_ban_h40d")
	end
	BasicVoices8.bhostradehox3 = function(self)
		BasicVoices8:Play("play_ban_h42d")
	end	
	BasicVoices8.bdrill1 = function(self)
		BasicVoices8:Play("play_pln_drl_wrn_snd")
	end
	BasicVoices8.bdrill2 = function(self)
		BasicVoices8:Play("play_pln_drl_alm_snd")
	end
	BasicVoices8.bdrill3 = function(self)
		BasicVoices8:Play("play_pln_dd_01")
	end
	BasicVoices8.bdrill4 = function(self)
		BasicVoices8:Play("play_pln_csod_01")
	end
	BasicVoices8.bnoreturn = function(self)
		BasicVoices8:Play("play_ban_p01")
	end
	BasicVoices8.bbagvan1 = function(self)
		BasicVoices8:Play("play_pln_gen_bagit_01")
	end
	BasicVoices8.bbagvan2 = function(self)
		BasicVoices8:Play("play_pln_gen_bfr_01")
	end
	BasicVoices8.bbagvan3 = function(self)
		BasicVoices8:Play("play_pln_gen_bfr_08")
	end
	BasicVoices8.bbagvan4 = function(self)
		BasicVoices8:Play("play_pln_gen_bfr_05")
	end
	BasicVoices8.bbagvan5 = function(self)
		BasicVoices8:Play("play_pln_vih_01")
	end
	BasicVoices8.bbagvan6 = function(self)
		BasicVoices8:Play("play_pln_vih_02")
	end
	BasicVoices8.bbagvan7 = function(self)
		BasicVoices8:Play("play_pln_gen_bfr_06")
	end
	BasicVoices8.bbagvan8 = function(self)
		BasicVoices8:Play("play_pln_gen_bgst_01")
	end
	BasicVoices8.bchopper1 = function(self)
		BasicVoices8:Play("play_pln_heli_01")
	end
	BasicVoices8.bchopper2 = function(self)
		BasicVoices8:Play("play_pln_heli_02")
	end
	BasicVoices8.bchopper3 = function(self)
		BasicVoices8:Play("play_pln_heli_03")
	end
	BasicVoices8.bfight1 = function(self)
		BasicVoices8:Play("play_pln_gen_bfr_07")
	end
	BasicVoices8.bfight2 = function(self)
		BasicVoices8:Play("Play_pln_ce_01")
	end
	BasicVoices8.bfight3 = function(self)
		BasicVoices8:Play("play_pln_gen_bfr_09")
	end
	BasicVoices8.bfight4 = function(self)
		BasicVoices8:Play("play_pln_gen_bfr_10")
	end
	BasicVoices8.bfight5 = function(self)
		BasicVoices8:Play("play_pln_gen_bfr_11")
	end
	BasicVoices8.bfight6 = function(self)
		BasicVoices8:Play("play_pln_gen_bfr_12")
	end
	BasicVoices8.bfight7 = function(self)
		BasicVoices8:Play("play_pln_gen_bfr_13")
	end
	BasicVoices8.bfight8 = function(self)
		BasicVoices8:Play("play_pln_gen_fbo_01")
	end
	BasicVoices8.bfight9 = function(self)
		BasicVoices8:Play("play_pln_gen_lkgo_01")
	end
	BasicVoices8.bfight10 = function(self)
		BasicVoices8:Play("play_pln_gen_urg_01")
	end
	BasicVoices8.bfight11 = function(self)
		BasicVoices8:Play("play_pln_gen_wsd_01")
	end
	BasicVoices8.bfight12 = function(self)
		BasicVoices8:Play("Play_pln_hur_01")
	end
	BasicVoices8.bfight13 = function(self)
		BasicVoices8:Play("pln_esc_pep")
	end
	BasicVoices8.byes1 = function(self)
		BasicVoices8:Play("play_pln_gen_dir_08")
	end
	BasicVoices8.byes2 = function(self)
		BasicVoices8:Play("Play_pln_pdsg_01")
	end
	BasicVoices8.byes3 = function(self)
		BasicVoices8:Play("Play_ban_g02x")
	end
	BasicVoices8.bno1 = function(self)
		BasicVoices8:Play("play_pln_gen_dir_07")
	end
	BasicVoices8.bno2 = function(self)
		BasicVoices8:Play("Play_pln_sbh_01")
	end
	BasicVoices8.bno3 = function(self)
		BasicVoices8:Play("Play_ban_g01x")
	end
-----------------------------------------------------
	MenuHelper:LoadFromJsonFile(BasicVoices8._path .. "menu.txt", BasicVoices8, BasicVoices8._data)
end)

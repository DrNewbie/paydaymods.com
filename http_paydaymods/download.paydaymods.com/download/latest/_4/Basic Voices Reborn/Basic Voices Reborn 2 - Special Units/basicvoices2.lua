_G.BasicVoices2 = _G.BasicVoices2 or {}
BasicVoices2._path = ModPath
BasicVoices2._data = {}

function BasicVoices2:Play(soundfile)
	if Utils:IsInHeist() and Utils:IsInCustody() == false and Utils:IsInGameState() then
		managers.player:local_player():sound():say(soundfile,true,true)
	end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_BasicVoices2", function(loc)
	loc:load_localization_file(BasicVoices2._path .. "en.txt")
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_BasicVoices2", function(menu_manager)
----------------------------------------------------- All the sounds
	BasicVoices2.shieldknockingsound = function(self)
		BasicVoices2:Play("shield_identification")
	end
	BasicVoices2.bspotplayer = function(self)
		BasicVoices2:Play("bdz_c01")
	end
	BasicVoices2.bentrance = function(self)
		BasicVoices2:Play("bdz_entrance")
	end
	BasicVoices2.beliteentrance = function(self)
		BasicVoices2:Play("bdz_entrance_elite")
	end
	BasicVoices2.btaunt1 = function(self)
		BasicVoices2:Play("bdz_g90")
	end
	BasicVoices2.btaunt2 = function(self)
		BasicVoices2:Play("bdz_post_kill_taunt")
	end
	BasicVoices2.bvisorbroken = function(self)
		BasicVoices2:Play("bdz_visor_lost")
	end
	BasicVoices2.bpain = function(self)
		BasicVoices2:Play("bdz_x01a_any_3p")
	end
	BasicVoices2.bdeath = function(self)
		BasicVoices2:Play("bdz_x02a_any_3p")
	end
	BasicVoices2.tspotplayer = function(self)
		BasicVoices2:Play("tsr_c01")
	end
	BasicVoices2.tentrance = function(self)
		BasicVoices2:Play("tsr_entrance")
	end
	BasicVoices2.teliteentrance = function(self)
		BasicVoices2:Play("tsr_elite")
	end
	BasicVoices2.ttaunt1 = function(self)
		BasicVoices2:Play("tsr_g90")
	end
	BasicVoices2.ttaunt2 = function(self)
		BasicVoices2:Play("tsr_post_tasing_taunt")
	end
	BasicVoices2.tshockproofskill = function(self)
		BasicVoices2:Play("tsr_tasered")
	end
	BasicVoices2.tburnscream = function(self)
		BasicVoices2:Play("tsr_burnhurt")
	end
	BasicVoices2.tburndeath = function(self)
		BasicVoices2:Play("tsr_burndeath")
	end
	BasicVoices2.tpain = function(self)
		BasicVoices2:Play("tsr_x01a_any_3p")
	end
	BasicVoices2.tdeath = function(self)
		BasicVoices2:Play("tsr_x02a_any_3p")
	end
	BasicVoices2.cptspawn = function(self)
		BasicVoices2:Play("cpa_a02_01")
	end
	BasicVoices2.cptconfirmedsighting = function(self)
		BasicVoices2:Play("cpw_a01")
	end
	BasicVoices2.cptkilltaunt = function(self)
		BasicVoices2:Play("cpw_a02")
	end
	BasicVoices2.cptadvance = function(self)
		BasicVoices2:Play("cpw_a05")
	end
	BasicVoices2.cptwithdrawl = function(self)
		BasicVoices2:Play("cpw_a04")
	end
	BasicVoices2.mentrance = function(self)
		BasicVoices2:Play("mdc_entrance")
	end
	BasicVoices2.mtaunt = function(self)
		BasicVoices2:Play("mdc_g90")
	end
	BasicVoices2.mheal = function(self)
		BasicVoices2:Play("mdc_heal")
	end
	BasicVoices2.mburnscream = function(self)
		BasicVoices2:Play("mdc_burnhurt")
	end
	BasicVoices2.mburndeath = function(self)
		BasicVoices2:Play("mdc_burndeath")
	end
	BasicVoices2.mpain = function(self)
		BasicVoices2:Play("mdc_x01a_any_3p")
	end
	BasicVoices2.mdeath = function(self)
		BasicVoices2:Play("mdc_x02a_any_3p")
	end
	BasicVoices2.cspawn = function(self)
		BasicVoices2:Play("cloaker_spawn")
	end
	BasicVoices2.cwhoosh = function(self)
		BasicVoices2:Play("clk_c01x_plu")
	end
	BasicVoices2.ctauntafterassault = function(self)
		BasicVoices2:Play("cloaker_taunt_after_assault")
	end
	BasicVoices2.ctauntduringassault = function(self)
		BasicVoices2:Play("cloaker_taunt_during_assault")
	end
	BasicVoices2.ccharge = function(self)
		BasicVoices2:Play("cloaker_detect_mono")
	end
	BasicVoices2.cchargestop = function(self)
		BasicVoices2:Play("cloaker_detect_stop")
	end
	BasicVoices2.cchristmascharge = function(self)
		BasicVoices2:Play("cloaker_detect_christmas_mono")
	end
	BasicVoices2.cchristmaschargestop = function(self)
		BasicVoices2:Play("cloaker_detect_christmas_stop")
	end
	BasicVoices2.cpresence = function(self)
		BasicVoices2:Play("cloaker_presence_loop")
	end
	BasicVoices2.cpresencestop = function(self)
		BasicVoices2:Play("cloaker_presence_stop")
	end
	BasicVoices2.cburnscream = function(self)
		BasicVoices2:Play("clk_burnhurt")
	end
	BasicVoices2.cburndeath = function(self)
		BasicVoices2:Play("clk_burndeath")
	end
	BasicVoices2.cdeath = function(self)
		BasicVoices2:Play("clk_x02a_any_3p")
	end
	BasicVoices2.cbaton1 = function(self)
		BasicVoices2:Play("clk_baton_enter")
	end
	BasicVoices2.cbaton2 = function(self)
		BasicVoices2:Play("clk_baton_swing")
	end
	BasicVoices2.cbaton3 = function(self)
		BasicVoices2:Play("clk_grab_baton")
	end
	BasicVoices2.ccrawlin = function(self)
		BasicVoices2:Play("clk_crawl_in")
	end
	BasicVoices2.ccrawlout = function(self)
		BasicVoices2:Play("clk_crawl_out")
	end
	BasicVoices2.cjump = function(self)
		BasicVoices2:Play("clk_jump")
	end
	BasicVoices2.cpunch = function(self)
		BasicVoices2:Play("clk_punch_3p")
	end
	BasicVoices2.ckick = function(self)
		BasicVoices2:Play("clk_kick_impact")
	end
	BasicVoices2.cdropkick = function(self)
		BasicVoices2:Play("clk_punch_3rd_person_3p")
	end
	BasicVoices2.croundhouse = function(self)
		BasicVoices2:Play("clk_roundkick")
	end
	BasicVoices2.cturn = function(self)
		BasicVoices2:Play("clk_turn")
	end
	BasicVoices2.tincoming = function(self)
		BasicVoices2:Play("cpa_a03_01")
	end
	BasicVoices2.tarrived = function(self)
		BasicVoices2:Play("cpa_a04_01")
	end
	BasicVoices2.talert = function(self)
		BasicVoices2:Play("swatturret_alert")
	end
	BasicVoices2.tcooldown = function(self)
		BasicVoices2:Play("swatturret_cooldown")
	end
	BasicVoices2.tdestroy = function(self)
		BasicVoices2:Play("swatturret_destroy")
	end
	BasicVoices2.tfire = function(self)
		BasicVoices2:Play("swatturret_fire")
	end
	BasicVoices2.tfireend = function(self)
		BasicVoices2:Play("swatturret_fire_end")
	end
	BasicVoices2.tdisarmedloop = function(self)
		BasicVoices2:Play("swatturret_disarmed_loop")
	end
	BasicVoices2.tdisarmedstop = function(self)
		BasicVoices2:Play("swatturret_disarmed_stop")
	end
	BasicVoices2.tmount = function(self)
		BasicVoices2:Play("swatturret_mount")
	end
	BasicVoices2.tplateoff = function(self)
		BasicVoices2:Play("swatturret_plate_off")
	end
	BasicVoices2.tpressure = function(self)
		BasicVoices2:Play("swatturret_pressure_release")
	end
	BasicVoices2.treload = function(self)
		BasicVoices2:Play("swatturret_reload")
	end
	BasicVoices2.treloadend = function(self)
		BasicVoices2:Play("swatturret_reload_end")
	end
	BasicVoices2.tspinstart = function(self)
		BasicVoices2:Play("swatturret_spin_start")
	end
	BasicVoices2.tspin = function(self)
		BasicVoices2:Play("swatturret_spin_loop")
	end
	BasicVoices2.tspinstop = function(self)
		BasicVoices2:Play("swatturret_spin_stop")
	end
	BasicVoices2.tweak = function(self)
		BasicVoices2:Play("swatturret_weakspot_hit")
	end
-----------------------------------------------------
	MenuHelper:LoadFromJsonFile(BasicVoices2._path .. "menu.txt", BasicVoices2, BasicVoices2._data)
end)

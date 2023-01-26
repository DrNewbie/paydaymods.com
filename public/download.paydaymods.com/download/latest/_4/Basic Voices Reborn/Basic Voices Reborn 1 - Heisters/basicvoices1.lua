_G.BasicVoices1 = _G.BasicVoices1 or {}
BasicVoices1._path = ModPath
BasicVoices1._data = {}

function BasicVoices1:Play(soundfile)
	if Utils:IsInHeist() and Utils:IsInCustody() == false and Utils:IsInGameState() then
		managers.player:local_player():sound():say(soundfile,true,true)
	end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_BasicVoices1", function(loc)
	loc:load_localization_file(BasicVoices1._path .. "en.txt")
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_BasicVoices1", function(menu_manager)
----------------------------------------------------- All the sounds
	
	BasicVoices1.stopallsounds = function(self)
		BasicVoices1:Play("stop_all_music")
	end
	BasicVoices1.stopstatic = function(self)
		BasicVoices1:Play("dsp_stop_all")
	end
	BasicVoices1.downstairs = function(self)
		BasicVoices1:Play("g01")
	end
	BasicVoices1.upstairs = function(self)
		BasicVoices1:Play("g02")
	end
	BasicVoices1.goleft = function(self)
		BasicVoices1:Play("g03")
	end
	BasicVoices1.goright = function(self)
		BasicVoices1:Play("g04")
	end
	BasicVoices1.goup = function(self)
		BasicVoices1:Play("g05")
	end
	BasicVoices1.godown = function(self)
		BasicVoices1:Play("g06")
	end
	BasicVoices1.getout = function(self)
		BasicVoices1:Play("g07")
	end
	BasicVoices1.getinside = function(self)
		BasicVoices1:Play("g08")
	end
	BasicVoices1.hurry = function(self)
		BasicVoices1:Play("g09")
	end
	BasicVoices1.careful = function(self)
		BasicVoices1:Play("g10")
	end
	BasicVoices1.wrongway = function(self)
		BasicVoices1:Play("g11")
	end
	BasicVoices1.rightway = function(self)
		BasicVoices1:Play("g12")
	end
	BasicVoices1.heistergo = function(self)
		BasicVoices1:Play("g13")
	end
	BasicVoices1.place = function(self)
		BasicVoices1:Play("g14")
	end
	BasicVoices1.there = function(self)
		BasicVoices1:Play("g15")
	end
	BasicVoices1.defend = function(self)
		BasicVoices1:Play("g16")
	end
	BasicVoices1.leave = function(self)
		BasicVoices1:Play("g17")
	end
	BasicVoices1.inspire1 = function(self)
		BasicVoices1:Play("g18")
	end
	BasicVoices1.inspire2 = function(self)
		BasicVoices1:Play("f36x_any")
	end
	BasicVoices1.straight = function(self)
		BasicVoices1:Play("g19")
	end
	BasicVoices1.jump1 = function(self)
		BasicVoices1:Play("g20")
	end
	BasicVoices1.drill = function(self)
		BasicVoices1:Play("g61")
	end
	BasicVoices1.drillmounted = function(self)
		BasicVoices1:Play("g21")
	end
	BasicVoices1.drillrepair = function(self)
		BasicVoices1:Play("g22")
	end
	BasicVoices1.heardrilljammed = function(self)
		BasicVoices1:Play("d01x_sin")
	end
	BasicVoices1.drilljammedagain = function(self)
		BasicVoices1:Play("d02x_sin")
	end
	BasicVoices1.hearcomputerjammed = function(self)
		BasicVoices1:Play("d03_plu")
	end
	BasicVoices1.computerjammedagain = function(self)
		BasicVoices1:Play("d04_plu")
	end
	BasicVoices1.hearlancejammed = function(self)
		BasicVoices1:Play("d03_sin")
	end
	BasicVoices1.lancejammedagain = function(self)
		BasicVoices1:Play("d04_sin")
	end
	BasicVoices1.shoot = function(self)
		BasicVoices1:Play("g23")
	end
	BasicVoices1.success = function(self)
		BasicVoices1:Play("g24")
	end
	BasicVoices1.cameras = function(self)
		BasicVoices1:Play("g25")
	end
	BasicVoices1.cableties = function(self)
		BasicVoices1:Play("g26")
	end
	BasicVoices1.civilians = function(self)
		BasicVoices1:Play("g27")
	end
	BasicVoices1.almost = function(self)
		BasicVoices1:Play("g28")
	end
	BasicVoices1.almostsecond = function(self)
		BasicVoices1:Play("p17")
	end
	BasicVoices1.fuck = function(self)
		BasicVoices1:Play("g29")
	end
	BasicVoices1.grenade = function(self)
		BasicVoices1:Play("g43")
	end
	BasicVoices1.shit = function(self)
		BasicVoices1:Play("g60")
	end
	BasicVoices1.second = function(self)
		BasicVoices1:Play("g67")
	end
	BasicVoices1.thirty = function(self)
		BasicVoices1:Play("g62")
	end
	BasicVoices1.minute = function(self)
		BasicVoices1:Play("g63")
	end
	BasicVoices1.minutethirty = function(self)
		BasicVoices1:Play("g64")
	end
	BasicVoices1.twominutes = function(self)
		BasicVoices1:Play("g65")
	end
	BasicVoices1.twominutesthirty = function(self)
		BasicVoices1:Play("g66")
	end
	BasicVoices1.overrun = function(self)
		BasicVoices1:Play("g68")
	end
	BasicVoices1.targets = function(self)
		BasicVoices1:Play("g69")
	end
	BasicVoices1.gagepack = function(self)
		BasicVoices1:Play("g92")
	end
	BasicVoices1.letsdoit = function(self)
		BasicVoices1:Play("p01")
	end
	BasicVoices1.letsdothis = function(self)
		BasicVoices1:Play("p02")
	end
	BasicVoices1.mask = function(self)
		BasicVoices1:Play("p03")
	end
	BasicVoices1.hurrywait = function(self)
		BasicVoices1:Play("p04")
	end
	BasicVoices1.cops = function(self)
		BasicVoices1:Play("p05")
	end
	BasicVoices1.ok = function(self)
		BasicVoices1:Play("p06")
	end
	BasicVoices1.hostagetrade = function(self)
		BasicVoices1:Play("p07")
	end
	BasicVoices1.gogo = function(self)
		BasicVoices1:Play("p12")
	end
	BasicVoices1.moveon = function(self)
		BasicVoices1:Play("p13")
	end
	BasicVoices1.moveit = function(self)
		BasicVoices1:Play("p14")
	end
	BasicVoices1.getmoving = function(self)
		BasicVoices1:Play("p15")
	end
	BasicVoices1.move = function(self)
		BasicVoices1:Play("p16")
	end
	BasicVoices1.comingyou = function(self)
		BasicVoices1:Play("r02a_sin")
	end
	BasicVoices1.follow = function(self)
		BasicVoices1:Play("f38_any")
	end
	BasicVoices1.planb = function(self)
		BasicVoices1:Play("p21")
	end
	BasicVoices1.assaultstart = function(self)
		BasicVoices1:Play("p22")
	end
	BasicVoices1.action = function(self)
		BasicVoices1:Play("p23")
	end
	BasicVoices1.assaultend = function(self)
		BasicVoices1:Play("p24")
	end
	BasicVoices1.excited = function(self)
		BasicVoices1:Play("p47")
	end
	BasicVoices1.hello = function(self)
		BasicVoices1:Play("v56")
	end
	BasicVoices1.affirmative = function(self)
		BasicVoices1:Play("r01x_sin")
	end
	BasicVoices1.loot = function(self)
		BasicVoices1:Play("p27")
	end
	BasicVoices1.alllootbag = function(self)
		BasicVoices1:Play("p28")
	end
	BasicVoices1.thanks = function(self)
		BasicVoices1:Play("s05x_sin")
	end
	BasicVoices1.pager = function(self)
		BasicVoices1:Play("dsp_radio_checking_1")
	end
	BasicVoices1.whistle = function(self)
		BasicVoices1:Play("whistling_attention")
	end
	BasicVoices1.flashbang = function(self)
		BasicVoices1:Play("g41x_any")
	end
	BasicVoices1.smoke = function(self)
		BasicVoices1:Play("g40x_any")
	end
	BasicVoices1.teargas = function(self)
		BasicVoices1:Play("g42x_any")
	end
	BasicVoices1.handsup = function(self)
		BasicVoices1:Play("l01x_sin")
	end
	BasicVoices1.knees = function(self)
		BasicVoices1:Play("l02x_sin")
	end
	BasicVoices1.cuffs = function(self)
		BasicVoices1:Play("l03x_sin")
	end
	BasicVoices1.cuffstrying = function(self)
		BasicVoices1:Play("s20x_sin")
	end
	BasicVoices1.cuffsfree = function(self)
		BasicVoices1:Play("s21x_sin")
	end
	BasicVoices1.downplu= function(self)
		BasicVoices1:Play("f02x_plu")
	end
	BasicVoices1.downsin = function(self)
		BasicVoices1:Play("f02x_sin")
	end
	BasicVoices1.downagain = function(self)
		BasicVoices1:Play("f02b_sin")
	end
	BasicVoices1.staydownplu = function(self)
		BasicVoices1:Play("f03a_plu")
	end
	BasicVoices1.staydownsin = function(self)
		BasicVoices1:Play("f03a_sin")
	end
	BasicVoices1.crowbarfound = function(self)
		BasicVoices1:Play("v57")
	end
	BasicVoices1.keycardfound = function(self)
		BasicVoices1:Play("v10")
	end
	BasicVoices1.openthisfuckingdoor = function(self)
		BasicVoices1:Play("v15")
	end
	BasicVoices1.openthisdoor = function(self)
		BasicVoices1:Play("v16")
	end
	BasicVoices1.killthemall = function(self)
		BasicVoices1:Play("v18")
	end
	BasicVoices1.lastcabletie = function(self)
		BasicVoices1:Play("s32x_sin")
	end
	BasicVoices1.revivingyou = function(self)
		BasicVoices1:Play("s08x_sin")
	end
	BasicVoices1.spotdozer = function(self)
		BasicVoices1:Play("f30x_any")
	end
	BasicVoices1.dozer = function(self)
		BasicVoices1:Play("f30y_any")
	end
	BasicVoices1.dozerkilled = function(self)
		BasicVoices1:Play("g30x_any")
	end
	BasicVoices1.spotshield = function(self)
		BasicVoices1:Play("f31x_any")
	end
	BasicVoices1.shield = function(self)
		BasicVoices1:Play("f31y_any")
	end
	BasicVoices1.shieldkilled = function(self)
		BasicVoices1:Play("g31x_any")
	end
	BasicVoices1.spottaser = function(self)
		BasicVoices1:Play("f32x_any")
	end
	BasicVoices1.taser = function(self)
		BasicVoices1:Play("f32y_any")
	end
	BasicVoices1.taserkilled = function(self)
		BasicVoices1:Play("g32x_any")
	end
	BasicVoices1.spotcloaker = function(self)
		BasicVoices1:Play("f33x_any")
	end
	BasicVoices1.cloaker = function(self)
		BasicVoices1:Play("f33y_any")
	end
	BasicVoices1.cloakerkilled = function(self)
		BasicVoices1:Play("g33x_any")
	end
	BasicVoices1.spotsniper = function(self)
		BasicVoices1:Play("f34x_any")
	end
	BasicVoices1.snipers = function(self)
		BasicVoices1:Play("p43")
	end
	BasicVoices1.sniperkilled = function(self)
		BasicVoices1:Play("g35x_any")
	end
	BasicVoices1.spotmedic = function(self)
		BasicVoices1:Play("f47x_any")
	end
	BasicVoices1.medickilled = function(self)
		BasicVoices1:Play("g36x_any")
	end
	BasicVoices1.swatturret = function(self)
		BasicVoices1:Play("f44x_any")
	end
	BasicVoices1.turret = function(self)
		BasicVoices1:Play("v45")
	end
	BasicVoices1.camerasin = function(self)
		BasicVoices1:Play("f39_any")
	end
	BasicVoices1.guardsin = function(self)
		BasicVoices1:Play("f37_any")
	end	
	BasicVoices1.fewmins = function(self)
		BasicVoices1:Play("t01x_sin")
	end
	BasicVoices1.halfway = function(self)
		BasicVoices1:Play("t02x_sin")
	end
	BasicVoices1.c4plant = function(self)
		BasicVoices1:Play("v13")
	end
	BasicVoices1.c4blow = function(self)
		BasicVoices1:Play("v14")
	end
	BasicVoices1.search = function(self)
		BasicVoices1:Play("v38")
	end
	BasicVoices1.keeplooking = function(self)
		BasicVoices1:Play("v44")
	end
	BasicVoices1.sharp = function(self)
		BasicVoices1:Play("v37")
	end
	BasicVoices1.copsvents = function(self)
		BasicVoices1:Play("v27")
	end
	BasicVoices1.needmeds = function(self)
		BasicVoices1:Play("g80x_plu")
	end
	BasicVoices1.needammo = function(self)
		BasicVoices1:Play("g81x_plu")
	end
	BasicVoices1.pmeds = function(self)
		BasicVoices1:Play("s02x_plu")
	end
	BasicVoices1.pammo = function(self)
		BasicVoices1:Play("s01x_plu")
	end
	BasicVoices1.pfak = function(self)
		BasicVoices1:Play("s12")
	end
	BasicVoices1.pbbags = function(self)
		BasicVoices1:Play("s13")
	end
	BasicVoices1.hbodybag = function(self)
		BasicVoices1:Play("s14")
	end
	BasicVoices1.chhardware = function(self)
		BasicVoices1:Play("p10")
	end
	BasicVoices1.wonit = function(self)
		BasicVoices1:Play("g72")
	end
	BasicVoices1.wwaiting = function(self)
		BasicVoices1:Play("p18")
	end
	BasicVoices1.wchtazed = function(self)
		BasicVoices1:Play("s07x_sin")
	end
	BasicVoices1.bosskydive = function(self)
		BasicVoices1:Play("v55")
	end
	BasicVoices1.fwbheat = function(self)
		BasicVoices1:Play("v34")
	end
	BasicVoices1.fwbmanager = function(self)
		BasicVoices1:Play("v33")
	end
	BasicVoices1.fwbkeycard1 = function(self)
		BasicVoices1:Play("p30")
	end
	BasicVoices1.fwbkeycard2 = function(self)
		BasicVoices1:Play("v12")
	end
	BasicVoices1.fwbpc = function(self)
		BasicVoices1:Play("v24")
	end
	BasicVoices1.fwbdrill = function(self)
		BasicVoices1:Play("v23")
	end
	BasicVoices1.fwbpayday = function(self)
		BasicVoices1:Play("v21")
	end
	BasicVoices1.fwbcash1 = function(self)
		BasicVoices1:Play("v47")
	end
	BasicVoices1.fwbcash2 = function(self)
		BasicVoices1:Play("v48")
	end
	BasicVoices1.fwbc41 = function(self)
		BasicVoices1:Play("v13")
	end
	BasicVoices1.fwbc42 = function(self)
		BasicVoices1:Play("v14")
	end
	BasicVoices1.udcsit = function(self)
		BasicVoices1:Play("v58")
	end
	BasicVoices1.udctaxman = function(self)
		BasicVoices1:Play("f46x_any")
	end
	BasicVoices1.dmndbain = function(self)
		BasicVoices1:Play("v35")
	end
	BasicVoices1.dmndnowwhat = function(self)
		BasicVoices1:Play("v36")
	end
	BasicVoices1.slgthstuck = function(self)
		BasicVoices1:Play("v52")
	end
	BasicVoices1.slgthshootit = function(self)
		BasicVoices1:Play("v49")
	end
	BasicVoices1.slgthmurkies = function(self)
		BasicVoices1:Play("v50")
	end
	BasicVoices1.slgthsmell = function(self)
		BasicVoices1:Play("v53")
	end
	BasicVoices1.slgthloud = function(self)
		BasicVoices1:Play("v54")
	end
	BasicVoices1.slgthloot = function(self)
		BasicVoices1:Play("v51")
	end
	BasicVoices1.Dalhelp = function(self)
		BasicVoices1:Play("f11a_sin")
	end
	BasicVoices1.Chahelp = function(self)
		BasicVoices1:Play("f11b_sin")
	end
	BasicVoices1.Wolhelp = function(self)
		BasicVoices1:Play("f11c_sin")
	end
	BasicVoices1.Hoxhelp = function(self)
		BasicVoices1:Play("f11d_sin")
	end
	BasicVoices1.Houshelp = function(self)
		BasicVoices1:Play("f11l_sin")
	end
	BasicVoices1.Wickhelp = function(self)
		BasicVoices1:Play("f11m_sin")
	end
	BasicVoices1.Clohelp = function(self)
		BasicVoices1:Play("f11n_sin")
	end
	BasicVoices1.Drahelp = function(self)
		BasicVoices1:Play("f11o_sin")
	end
	BasicVoices1.Jachelp = function(self)
		BasicVoices1:Play("f11p_sin")
	end
	BasicVoices1.Bonhelp = function(self)
		BasicVoices1:Play("f11q_sin")
	end
	BasicVoices1.Sokhelp = function(self)
		BasicVoices1:Play("f11r_sin")
	end
	BasicVoices1.Jirohelp = function(self)
		BasicVoices1:Play("f11s_sin")
	end
	BasicVoices1.Bodhelp = function(self)
		BasicVoices1:Play("f11t_sin")
	end
	BasicVoices1.Jimhelp = function(self)
		BasicVoices1:Play("f11u_sin")
	end
	BasicVoices1.Sydhelp = function(self)
		BasicVoices1:Play("f11v_sin")
	end
	BasicVoices1.Rushelp = function(self)
		BasicVoices1:Play("f11w_sin")
	end
	BasicVoices1.Tonyhelp = function(self)
		BasicVoices1:Play("f11x_sin")
	end
	BasicVoices1.Dalfol = function(self)
		BasicVoices1:Play("f21a_sin")
	end
	BasicVoices1.Chafol = function(self)
		BasicVoices1:Play("f21b_sin")
	end
	BasicVoices1.Wolfol = function(self)
		BasicVoices1:Play("f21c_sin")
	end
	BasicVoices1.Hoxfol = function(self)
		BasicVoices1:Play("f21d_sin")
	end
	BasicVoices1.Housfol = function(self)
		BasicVoices1:Play("f21l_sin")
	end
	BasicVoices1.Wickfol = function(self)
		BasicVoices1:Play("f21m_sin")
	end
	BasicVoices1.Clofol = function(self)
		BasicVoices1:Play("f21n_sin")
	end
	BasicVoices1.Drafol = function(self)
		BasicVoices1:Play("f21o_sin")
	end
	BasicVoices1.Jacfol = function(self)
		BasicVoices1:Play("f21p_sin")
	end
	BasicVoices1.Bonfol = function(self)
		BasicVoices1:Play("f21q_sin")
	end
	BasicVoices1.Sokfol = function(self)
		BasicVoices1:Play("f21r_sin")
	end
	BasicVoices1.Jirofol = function(self)
		BasicVoices1:Play("f21s_sin")
	end
	BasicVoices1.Bodfol = function(self)
		BasicVoices1:Play("f21t_sin")
	end
	BasicVoices1.Jimfol = function(self)
		BasicVoices1:Play("f21u_sin")
	end
	BasicVoices1.Sydfol = function(self)
		BasicVoices1:Play("f21v_sin")
	end
	BasicVoices1.Rusfol = function(self)
		BasicVoices1:Play("f21w_sin")
	end
	BasicVoices1.Tonyfol = function(self)
		BasicVoices1:Play("f21x_sin")
	end
	BasicVoices1.copshere = function(self)
		BasicVoices1:Play("g70")
	end
	BasicVoices1.getready = function(self)
		BasicVoices1:Play("g50")
	end
	BasicVoices1.staystill = function(self)
		BasicVoices1:Play("f48x_any")
	end
	BasicVoices1.swakeup1 = function(self)
		BasicVoices1:Play("f41_any")
	end
	BasicVoices1.swakeup2 = function(self)
		BasicVoices1:Play("f43_any")
	end
	BasicVoices1.flanks = function(self)
		BasicVoices1:Play("p26")
	end
	BasicVoices1.pickinglock = function(self)
		BasicVoices1:Play("p29")
	end
	BasicVoices1.copsbags = function(self)
		BasicVoices1:Play("p31")
	end
	BasicVoices1.casebackup = function(self)
		BasicVoices1:Play("p32")
	end
	BasicVoices1.anybodyhelp = function(self)
		BasicVoices1:Play("p45")
	end
	BasicVoices1.jump2 = function(self)
		BasicVoices1:Play("p46")
	end
	BasicVoices1.yesexcited = function(self)
		BasicVoices1:Play("v46")
	end
	BasicVoices1.drillgoing = function(self)
		BasicVoices1:Play("Play_rbr_knk_jwl_b_slh_26")
	end
	BasicVoices1.skylights = function(self)
		BasicVoices1:Play("p33")
	end
	BasicVoices1.roof = function(self)
		BasicVoices1:Play("p34")
	end
	BasicVoices1.walls = function(self)
		BasicVoices1:Play("p35")
	end
	BasicVoices1.wallpanel = function(self)
		BasicVoices1:Play("p36")
	end
	BasicVoices1.floors = function(self)
		BasicVoices1:Play("p37")
	end
	BasicVoices1.outside1 = function(self)
		BasicVoices1:Play("p38")
	end
	BasicVoices1.outside2 = function(self)
		BasicVoices1:Play("p39")
	end
	BasicVoices1.outside3 = function(self)
		BasicVoices1:Play("p40")
	end
	BasicVoices1.woods = function(self)
		BasicVoices1:Play("p44")
	end
	BasicVoices1.swatheli = function(self)
		BasicVoices1:Play("p41")
	end
	BasicVoices1.swatinsertion = function(self)
		BasicVoices1:Play("p42")
	end
	BasicVoices1.keycardgrab = function(self)
		BasicVoices1:Play("v11")
	end
	BasicVoices1.team = function(self)
		BasicVoices1:Play("v17")
	end
	BasicVoices1.onit1 = function(self)
		BasicVoices1:Play("v01")
	end
	BasicVoices1.werein = function(self)
		BasicVoices1:Play("v03")
	end
	BasicVoices1.foundit = function(self)
		BasicVoices1:Play("v04")
	end
	BasicVoices1.foundone = function(self)
		BasicVoices1:Play("v05")
	end
	BasicVoices1.foundanotherone = function(self)
		BasicVoices1:Play("v06")
	end
	BasicVoices1.gotallofit = function(self)
		BasicVoices1:Play("v22")
	end
	BasicVoices1.itsdone = function(self)
		BasicVoices1:Play("v07")
	end
	BasicVoices1.weredone = function(self)
		BasicVoices1:Play("v08")
	end
	BasicVoices1.next = function(self)
		BasicVoices1:Play("v09")
	end
	BasicVoices1.itcomes = function(self)
		BasicVoices1:Play("v19")
	end
	BasicVoices1.ithasarrived = function(self)
		BasicVoices1:Play("v20")
	end
	BasicVoices1.letsmoveon = function(self)
		BasicVoices1:Play("v25")
	end
	BasicVoices1.escape = function(self)
		BasicVoices1:Play("v26")
	end
	BasicVoices1.captain = function(self)
		BasicVoices1:Play("f45x_any")
	end
	BasicVoices1.taunt = function(self)
		BasicVoices1:Play("g90")
	end
	BasicVoices1.getup = function(self)
		BasicVoices1:Play("s08x_sin")
	end
	BasicVoices1.assaultanticipation = function(self)
		BasicVoices1:Play("i01x_any")
	end
	BasicVoices1.lasttripmine = function(self)
		BasicVoices1:Play("s40x_sin")
	end
	BasicVoices1.mark = function(self)
		BasicVoices1:Play("v39")
	end
	BasicVoices1.fmark = function(self)
		BasicVoices1:Play("v28")
	end
	BasicVoices1.her = function(self)
		BasicVoices1:Play("v40")
	end
	BasicVoices1.fher = function(self)
		BasicVoices1:Play("v29")
	end
	BasicVoices1.him = function(self)
		BasicVoices1:Play("v41")
	end
	BasicVoices1.fhim = function(self)
		BasicVoices1:Play("v30")
	end
	BasicVoices1.them = function(self)
		BasicVoices1:Play("v42")
	end
	BasicVoices1.fthem = function(self)
		BasicVoices1:Play("v31")
	end
	BasicVoices1.it = function(self)
		BasicVoices1:Play("v43")
	end
	BasicVoices1.fit = function(self)
		BasicVoices1:Play("v32")
	end
	
-----------------------------------------------------
	MenuHelper:LoadFromJsonFile(BasicVoices1._path .. "menu.txt", BasicVoices1, BasicVoices1._data)
end)

_G.BasicVoices3 = _G.BasicVoices3 or {}
BasicVoices3._path = ModPath
BasicVoices3._data = {}

function BasicVoices3:Play(soundfile)
	if Utils:IsInHeist() and Utils:IsInCustody() == false and Utils:IsInGameState() then
		managers.player:local_player():sound():say(soundfile,true,true)
	end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_BasicVoices3", function(loc)
	loc:load_localization_file(BasicVoices3._path .. "en.txt")
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_BasicVoices3", function(menu_manager)
----------------------------------------------------- All the sounds
	BasicVoices3.nightclub = function(self)
		BasicVoices3:Play("diegetic_club_music")
	end
	BasicVoices3.nightclubstop = function(self)
		BasicVoices3:Play("diegetic_club_music_stop")
	end
	BasicVoices3.rock = function(self)
		BasicVoices3:Play("diegetic_club_rock_music")
	end
	BasicVoices3.rockstop = function(self)
		BasicVoices3:Play("diegetic_club_rock_music_stop")
	end
	BasicVoices3.mall = function(self)
		BasicVoices3:Play("diegetic_lounge_music")
	end
	BasicVoices3.mallstop = function(self)
		BasicVoices3:Play("diegetic_lounge_music_stop")
	end
	BasicVoices3.loudermall = function(self)
		BasicVoices3:Play("lets_go_shopping_menu")
	end
	BasicVoices3.kosugi = function(self)
		BasicVoices3:Play("kosugi_music")
	end
	BasicVoices3.criminals = function(self)
		BasicVoices3:Play("criminals_ambition")
	end
	BasicVoices3.criminalsambtionins = function(self)
		BasicVoices3:Play("criminals_ambition_instrumental")
	end
	BasicVoices3.greed = function(self)
		BasicVoices3:Play("ode_all_avidita")
	end
	BasicVoices3.drifting = function(self)
		BasicVoices3:Play("drifting")
	end
	BasicVoices3.wildone = function(self)
		BasicVoices3:Play("im_a_wild_one")
	end
	BasicVoices3.ourtime = function(self)
		BasicVoices3:Play("this_is_our_time")
	end
	BasicVoices3.flames = function(self)
		BasicVoices3:Play("the_flames_of_love")
	end
	BasicVoices3.giveall = function(self)
		BasicVoices3:Play("pth_i_will_give_you_my_all")
	end
	BasicVoices3.ifchristmas1 = function(self)
		BasicVoices3:Play("xmas13_if_it_has_to_be_christmas_american_version")
	end
	BasicVoices3.ifchristmas2 = function(self)
		BasicVoices3:Play("xmas13_if_it_has_to_be_christmas")
	end
	BasicVoices3.aheistins = function(self)
		BasicVoices3:Play("xmas13_a_heist_not_attempted_before")
	end
	BasicVoices3.merrypayday = function(self)
		BasicVoices3:Play("xmas13_a_merry_payday_christmas")
	end
	BasicVoices3.christmasprison = function(self)
		BasicVoices3:Play("xmas13_christmas_in_prison")
	end
	BasicVoices3.decksafehouse = function(self)
		BasicVoices3:Play("xmas13_deck_the_safe_house")
	end
	BasicVoices3.badboy = function(self)
		BasicVoices3:Play("xmas13_ive_been_a_bad_boy")
	end
	BasicVoices3.ifchristmasins = function(self)
		BasicVoices3:Play("xmas13_if_it_has_to_be_christmas_instrumental")
	end
	BasicVoices3.aheistins = function(self)
		BasicVoices3:Play("xmas13_a_heist_not_attempted_before_instrumental")
	end
	BasicVoices3.merrypaydayins = function(self)
		BasicVoices3:Play("xmas13_a_merry_payday_christmas_instrumental")
	end
	BasicVoices3.christmasprisonins = function(self)
		BasicVoices3:Play("xmas13_christmas_in_prison_instrumental")
	end
	BasicVoices3.decksafehouseins = function(self)
		BasicVoices3:Play("xmas13_deck_the_safe_house_instrumental")
	end
	BasicVoices3.badboyins = function(self)
		BasicVoices3:Play("xmas13_ive_been_a_bad_boy_instrumental")
	end
	BasicVoices3.menu = function(self)
		BasicVoices3:Play("menu_music")
	end
	BasicVoices3.freeze = function(self)
		BasicVoices3:Play("release_trailer_track")
	end
	BasicVoices3.preplanning1 = function(self)
		BasicVoices3:Play("preplanning_music")
	end
	BasicVoices3.preplanning2 = function(self)
		BasicVoices3:Play("preplanning_music_old")
	end
	BasicVoices3.win = function(self)
		BasicVoices3:Play("resultscreen_win")
	end
	BasicVoices3.lose = function(self)
		BasicVoices3:Play("resultscreen_lose")
	end
	BasicVoices3.loot = function(self)
		BasicVoices3:Play("music_loot_drop")
	end
	BasicVoices3.menuth = function(self)
		BasicVoices3:Play("pth_criminal_intent")
	end
	BasicVoices3.bnews = function(self)
		BasicVoices3:Play("pth_breaking_news")
	end
	BasicVoices3.bnewsins = function(self)
		BasicVoices3:Play("pth_breaking_news_instrumental")
	end
	BasicVoices3.preparations = function(self)
		BasicVoices3:Play("pth_preparations")
	end
	BasicVoices3.winth = function(self)
		BasicVoices3:Play("pth_see_you_at_the_safe_house")
	end
	BasicVoices3.loseth = function(self)
		BasicVoices3:Play("pth_busted")
	end
	BasicVoices3.losethins = function(self)
		BasicVoices3:Play("pth_busted_ins")
	end
	BasicVoices3.jukeboxrock = function(self)
		BasicVoices3:Play("jukebox_rock")
	end
	BasicVoices3.jukeboxrockstop = function(self)
		BasicVoices3:Play("jukebox_rock_stop")
	end
	BasicVoices3.jukeboxshuffle = function(self)
		BasicVoices3:Play("jukebox_shuffle")
	end
	BasicVoices3.jukeboxshufflestop = function(self)
		BasicVoices3:Play("jukebox_shuffle_stop")
	end
	BasicVoices3.jukeboxflames = function(self)
		BasicVoices3:Play("jukebox_the_flames_of_love")
	end
	BasicVoices3.alesso1 = function(self)
		BasicVoices3:Play("alesso_music_play")
	end
	BasicVoices3.alesso2 = function(self)
		BasicVoices3:Play("alesso_music_stealth")
	end
	BasicVoices3.alesso3 = function(self)
		BasicVoices3:Play("alesso_music_control")
	end
	BasicVoices3.alesso4 = function(self)
		BasicVoices3:Play("alesso_music_anticipation")
	end
	BasicVoices3.alesso5 = function(self)
		BasicVoices3:Play("alesso_music_assault")
	end
	BasicVoices3.alesso6 = function(self)
		BasicVoices3:Play("alesso_music_drop")
	end
	BasicVoices3.alesso7 = function(self)
		BasicVoices3:Play("alesso_music_cut")
	end
	BasicVoices3.alesso8 = function(self)
		BasicVoices3:Play("alesso_music_fade")
	end
	BasicVoices3.alesso9 = function(self)
		BasicVoices3:Play("alesso_music_hacking_standby")
	end
	BasicVoices3.alesso10 = function(self)
		BasicVoices3:Play("alesso_music_hacking_progress")
	end
-----------------------------------------------------
	MenuHelper:LoadFromJsonFile(BasicVoices3._path .. "menu.txt", BasicVoices3, BasicVoices3._data)
end)

_G.BasicVoices7 = _G.BasicVoices7 or {}
BasicVoices7._path = ModPath
BasicVoices7._data = {}

function BasicVoices7:Play(soundfile)
	if Utils:IsInHeist() and Utils:IsInCustody() == false and Utils:IsInGameState() then
		managers.player:local_player():sound():say(soundfile,true,true)
	end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_BasicVoices7", function(loc)
	loc:load_localization_file(BasicVoices7._path .. "en.txt")
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_BasicVoices7", function(menu_manager)
----------------------------------------------------- All the sounds
	BasicVoices7.mgcop1 = function(self)
		BasicVoices7:Play("mga_s01")
	end
	BasicVoices7.mgcop2 = function(self)
		BasicVoices7:Play("mga_s02")
	end
	BasicVoices7.mgcop3 = function(self)
		BasicVoices7:Play("mga_s03")
	end
	BasicVoices7.mgcop4 = function(self)
		BasicVoices7:Play("mga_s04")
	end
	BasicVoices7.mgcop5 = function(self)
		BasicVoices7:Play("mga_s05")
	end
	BasicVoices7.mgcop6 = function(self)
		BasicVoices7:Play("mga_s06")
	end
	BasicVoices7.mgcop7 = function(self)
		BasicVoices7:Play("mga_s07")
	end
	BasicVoices7.mgcop8 = function(self)
		BasicVoices7:Play("mga_t01a_con_plu")
	end
	BasicVoices7.mega1 = function(self)
		BasicVoices7:Play("mga_intro")
	end
	BasicVoices7.mega2 = function(self)
		BasicVoices7:Play("mga_hostage_assault_delay")
	end
	BasicVoices7.mega3 = function(self)
		BasicVoices7:Play("mga_killed_civ_1st")
	end
	BasicVoices7.mega4 = function(self)
		BasicVoices7:Play("mga_killed_civ_2nd")
	end
	BasicVoices7.mega5 = function(self)
		BasicVoices7:Play("mga_generic_a")
	end
	BasicVoices7.mega6 = function(self)
		BasicVoices7:Play("mga_generic_b")
	end
	BasicVoices7.mega7 = function(self)
		BasicVoices7:Play("mga_generic_c")
	end
	BasicVoices7.mega8 = function(self)
		BasicVoices7:Play("mga_robbers_clever")
	end
	BasicVoices7.mega9 = function(self)
		BasicVoices7:Play("mga_deploy_snipers")
	end
	BasicVoices7.mega10 = function(self)
		BasicVoices7:Play("mga_thermite")
	end
	BasicVoices7.mega11 = function(self)
		BasicVoices7:Play("mga_vault_a")
	end
	BasicVoices7.mega12 = function(self)
		BasicVoices7:Play("mga_vault_b")
	end
	BasicVoices7.mega13 = function(self)
		BasicVoices7:Play("mga_vault_c")
	end
	BasicVoices7.mega14 = function(self)
		BasicVoices7:Play("mga_death_scream")
	end
	BasicVoices7.mega15 = function(self)
		BasicVoices7:Play("mga_leave")
	end
-----------------------------------------------------
	MenuHelper:LoadFromJsonFile(BasicVoices7._path .. "menu.txt", BasicVoices7, BasicVoices7._data)
end)

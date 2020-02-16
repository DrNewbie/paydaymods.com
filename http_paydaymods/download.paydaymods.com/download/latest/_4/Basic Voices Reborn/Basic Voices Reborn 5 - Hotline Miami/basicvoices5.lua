_G.BasicVoices5 = _G.BasicVoices5 or {}
BasicVoices5._path = ModPath
BasicVoices5._data = {}

function BasicVoices5:Play(soundfile)
	if Utils:IsInHeist() and Utils:IsInCustody() == false and Utils:IsInGameState() then
		managers.player:local_player():sound():say(soundfile,true,true)
	end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_BasicVoices5", function(loc)
	loc:load_localization_file(BasicVoices5._path .. "en.txt")
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_BasicVoices5", function(menu_manager)
----------------------------------------------------- All the sounds
	BasicVoices5.com101 = function(self)
		BasicVoices5:Play("play_com_hm1_01")
	end
	BasicVoices5.com102 = function(self)
		BasicVoices5:Play("play_com_hm1_02")
	end
	BasicVoices5.com103 = function(self)
		BasicVoices5:Play("play_com_hm1_03")
	end
	BasicVoices5.com104 = function(self)
		BasicVoices5:Play("play_com_hm1_04")
	end
	BasicVoices5.com201 = function(self)
		BasicVoices5:Play("play_com_hm2_01")
	end
	BasicVoices5.com202 = function(self)
		BasicVoices5:Play("play_com_hm2_02")
	end
	BasicVoices5.com203 = function(self)
		BasicVoices5:Play("play_com_hm2_03")
	end
	BasicVoices5.com204 = function(self)
		BasicVoices5:Play("play_com_hm2_04")
	end
	BasicVoices5.com205 = function(self)
		BasicVoices5:Play("play_com_hm2_05")
	end
	BasicVoices5.com206 = function(self)
		BasicVoices5:Play("play_com_hm2_06")
	end
	BasicVoices5.com207 = function(self)
		BasicVoices5:Play("play_com_hm2_07")
	end
	BasicVoices5.com208 = function(self)
		BasicVoices5:Play("play_com_hm2_08")
	end
	BasicVoices5.com209 = function(self)
		BasicVoices5:Play("play_com_hm2_09")
	end
	BasicVoices5.thugs = function(self)
		BasicVoices5:Play("play_thugs_converse_hm2")
	end
	BasicVoices5.thugsstop = function(self)
		BasicVoices5:Play("stop_thugs_converse_hm2")
	end
	BasicVoices5.b201 = function(self)
		BasicVoices5:Play("play_pln_hm2_01")
	end
	BasicVoices5.b202 = function(self)
		BasicVoices5:Play("play_pln_hm2_02")
	end
	BasicVoices5.b203 = function(self)
		BasicVoices5:Play("play_pln_hm2_03")
	end
	BasicVoices5.b204 = function(self)
		BasicVoices5:Play("play_pln_hm2_04")
	end
	BasicVoices5.b205 = function(self)
		BasicVoices5:Play("play_pln_hm2_05")
	end
	BasicVoices5.b206 = function(self)
		BasicVoices5:Play("play_pln_hm2_06")
	end
	BasicVoices5.b207 = function(self)
		BasicVoices5:Play("play_pln_hm2_07")
	end
	BasicVoices5.b208 = function(self)
		BasicVoices5:Play("play_pln_hm2_08")
	end
	BasicVoices5.b209 = function(self)
		BasicVoices5:Play("play_pln_hm2_09")
	end
	BasicVoices5.b210 = function(self)
		BasicVoices5:Play("play_pln_hm2_10")
	end
	BasicVoices5.b211 = function(self)
		BasicVoices5:Play("play_pln_hm2_11")
	end
	BasicVoices5.b212 = function(self)
		BasicVoices5:Play("play_pln_hm2_12")
	end
	BasicVoices5.b213 = function(self)
		BasicVoices5:Play("play_pln_hm2_13")
	end
	BasicVoices5.b214 = function(self)
		BasicVoices5:Play("play_pln_hm2_14")
	end
	BasicVoices5.b215 = function(self)
		BasicVoices5:Play("play_pln_hm2_15")
	end
	BasicVoices5.b216 = function(self)
		BasicVoices5:Play("play_pln_hm2_16")
	end
	BasicVoices5.b217 = function(self)
		BasicVoices5:Play("play_pln_hm2_17")
	end
	BasicVoices5.b218 = function(self)
		BasicVoices5:Play("play_pln_hm2_18")
	end
	BasicVoices5.b219 = function(self)
		BasicVoices5:Play("play_pln_hm2_19")
	end
	BasicVoices5.b220 = function(self)
		BasicVoices5:Play("play_pln_hm2_20")
	end
	BasicVoices5.b221 = function(self)
		BasicVoices5:Play("play_pln_hm2_21")
	end
	BasicVoices5.b222 = function(self)
		BasicVoices5:Play("play_pln_hm2_22")
	end
	BasicVoices5.b223 = function(self)
		BasicVoices5:Play("play_pln_hm2_23")
	end
	BasicVoices5.b225 = function(self)
		BasicVoices5:Play("play_pln_hm2_25")
	end
	BasicVoices5.b226 = function(self)
		BasicVoices5:Play("play_pln_hm2_26")
	end
	BasicVoices5.b227 = function(self)
		BasicVoices5:Play("play_pln_hm2_27")
	end
	BasicVoices5.b228 = function(self)
		BasicVoices5:Play("play_pln_hm2_28")
	end
	BasicVoices5.b229 = function(self)
		BasicVoices5:Play("play_pln_hm2_29")
	end
	BasicVoices5.b230 = function(self)
		BasicVoices5:Play("play_pln_hm2_30")
	end
	BasicVoices5.b231 = function(self)
		BasicVoices5:Play("play_pln_hm2_31")
	end
	BasicVoices5.b232 = function(self)
		BasicVoices5:Play("play_pln_hm2_32")
	end
	BasicVoices5.b233 = function(self)
		BasicVoices5:Play("play_pln_hm2_33")
	end
	BasicVoices5.b234 = function(self)
		BasicVoices5:Play("play_pln_hm2_34")
	end
-----------------------------------------------------
	MenuHelper:LoadFromJsonFile(BasicVoices5._path .. "menu.txt", BasicVoices5, BasicVoices5._data)
end)

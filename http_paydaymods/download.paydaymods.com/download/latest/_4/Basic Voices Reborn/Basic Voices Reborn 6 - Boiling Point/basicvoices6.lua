_G.BasicVoices6 = _G.BasicVoices6 or {}
BasicVoices6._path = ModPath
BasicVoices6._data = {}

function BasicVoices6:Play(soundfile)
	if Utils:IsInHeist() and Utils:IsInCustody() == false and Utils:IsInGameState() then
		managers.player:local_player():sound():say(soundfile,true,true)
	end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_BasicVoices6", function(loc)
	loc:load_localization_file(BasicVoices6._path .. "en.txt")
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_BasicVoices6", function(menu_manager)
----------------------------------------------------- All the sounds
	BasicVoices6.rb_entrance = function(self)
		BasicVoices6:Play("rbdz_entrance")
	end
	BasicVoices6.rb_eliteentrance = function(self)
		BasicVoices6:Play("rbdz_entrance_elite")
	end
	BasicVoices6.rb_taunt = function(self)
		BasicVoices6:Play("rbdz_g90")
	end
	BasicVoices6.rb_killtaunt = function(self)
		BasicVoices6:Play("rbdz_post_kill_taunt")
	end
	BasicVoices6.rb_visorlost = function(self)
		BasicVoices6:Play("rbdz_visor_lost")
	end
	
	
	BasicVoices6.rt_entrance = function(self)
		BasicVoices6:Play("rtsr_entrance")
	end
	BasicVoices6.rt_eliteentrance = function(self)
		BasicVoices6:Play("rtsr_elite")
	end
	BasicVoices6.rt_c01 = function(self)
		BasicVoices6:Play("rtsr_c01")
	end
	BasicVoices6.rt_taunt = function(self)
		BasicVoices6:Play("rtsr_g90")
	end
	BasicVoices6.rt_killtaunt = function(self)
		BasicVoices6:Play("rtsr_post_tasing_taunt")
	end
	BasicVoices6.rt_tasered = function(self)
		BasicVoices6:Play("rtsr_tasered")
	end
	BasicVoices6.rt_burnhurt = function(self)
		BasicVoices6:Play("rtsr_burnhurt")
	end
	BasicVoices6.rt_burndeath = function(self)
		BasicVoices6:Play("rtsr_burndeath")
	end
	BasicVoices6.rt_x01a = function(self)
		BasicVoices6:Play("rtsr_x01a_any_3p")
	end
	BasicVoices6.rt_x02a = function(self)
		BasicVoices6:Play("rtsr_x02a_any_3p")
	end
	BasicVoices6.rc_tauntda = function(self)
		BasicVoices6:Play("rcloaker_taunt_during_assault")
	end
	BasicVoices6.rc_tauntaa = function(self)
		BasicVoices6:Play("rcloaker_taunt_after_assault")
	end
	BasicVoices6.rc_burnhurt = function(self)
		BasicVoices6:Play("rclk_burnhurt")
	end
	BasicVoices6.rc_burndeath = function(self)
		BasicVoices6:Play("rclk_burndeath")
	end
	BasicVoices6.rc_x02a = function(self)
		BasicVoices6:Play("rclk_x02a_any_3p")
	end
-----------------------------------------------------
	MenuHelper:LoadFromJsonFile(BasicVoices6._path .. "menu.txt", BasicVoices6, BasicVoices6._data)
end)

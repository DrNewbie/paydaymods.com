SlowMotionManager = {}
SlowMotionManager.savefile = SavePath .. "/SlowMotionManager_options.txt"

SlowMotionManager.localization = {
	english = ModPath .. "/loc/english.txt",
	french = ModPath .. "/loc/french.txt"
}

SlowMotionManager.options = {}

function SlowMotionManager:Load()		
	local file = io.open( self.savefile , "r")
	if file then
		self.options = json.decode( file:read("*all") )
		file:close()
	end
end

function SlowMotionManager:Save()
	if file.DirectoryExists( SavePath ) then	
		local file = io.open( self.savefile , "w+")
		if file then
			file:write(json.encode(SlowMotionManager.options))
			file:close()
		end
	end
end

if MenuManager then

	MenuCallbackHandler.SlowMotionManager_speed_maskon_callback = function(self, item)		
		SlowMotionManager.options.SlowMotionManager_speed_maskon = item:value()
		SlowMotionManager:Save()
	end

	MenuCallbackHandler.SlowMotionManager_fadeindelay_maskon_callback = function(self, item)		
		SlowMotionManager.options.SlowMotionManager_fadeindelay_maskon = item:value()
		SlowMotionManager:Save()
	end

	MenuCallbackHandler.SlowMotionManager_fadein_maskon_callback = function(self, item)		
		SlowMotionManager.options.SlowMotionManager_fadein_maskon = item:value()
		SlowMotionManager:Save()
	end

	MenuCallbackHandler.SlowMotionManager_sustain_maskon_callback = function(self, item)		
		SlowMotionManager.options.SlowMotionManager_sustain_maskon = item:value()
		SlowMotionManager:Save()	
	end

	MenuCallbackHandler.SlowMotionManager_fadeout_maskon_callback = function(self, item)		
		SlowMotionManager.options.SlowMotionManager_fadeout_maskon = item:value()
		SlowMotionManager:Save()
	end


	MenuCallbackHandler.SlowMotionManager_speed_downed_callback = function(self, item)		
		SlowMotionManager.options.SlowMotionManager_speed_downed = item:value()
		SlowMotionManager:Save()
	end

	MenuCallbackHandler.SlowMotionManager_fadein_downed_callback = function(self, item)		
		SlowMotionManager.options.SlowMotionManager_fadein_downed= item:value()
		SlowMotionManager:Save()
	end

	MenuCallbackHandler.SlowMotionManager_sustain_downed_callback = function(self, item)		
		SlowMotionManager.options.SlowMotionManager_sustain_downed = item:value()
		SlowMotionManager:Save()	
	end

	MenuCallbackHandler.SlowMotionManager_fadeout_downed_callback = function(self, item)		
		SlowMotionManager.options.SlowMotionManager_fadeout_downed = item:value()
		SlowMotionManager:Save()
	end


	MenuCallbackHandler.SlowMotionManager_speed_scripted_callback = function(self, item)		
		SlowMotionManager.options.SlowMotionManager_speed_scripted = item:value()
		SlowMotionManager:Save()
	end

	MenuCallbackHandler.SlowMotionManager_fadeindelay_scripted_callback = function(self, item)		
		SlowMotionManager.options.SlowMotionManager_fadeindelay_scripted = item:value()
		SlowMotionManager:Save()
	end

	MenuCallbackHandler.SlowMotionManager_fadein_scripted_callback = function(self, item)		
		SlowMotionManager.options.SlowMotionManager_fadein_scripted = item:value()
		SlowMotionManager:Save()
	end

	MenuCallbackHandler.SlowMotionManager_sustain_scripted_callback = function(self, item)		
		SlowMotionManager.options.SlowMotionManager_sustain_scripted = item:value()
		SlowMotionManager:Save()	
	end

	MenuCallbackHandler.SlowMotionManager_fadeout_scripted_callback = function(self, item)		
		SlowMotionManager.options.SlowMotionManager_fadeout_scripted = item:value()
		SlowMotionManager:Save()
	end

	MenuCallbackHandler.SlowMotionManager_reset_callback = function(self, item)

		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_speed_maskon"] = true}, 0.2 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_fadeindelay_maskon"] = true}, 1.35 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_fadein_maskon"] = true}, 0.25 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_sustain_maskon"] = true}, 5 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_fadeout_maskon"] = true}, 0.8 )

		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_speed_downed"] = true}, 0.3 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_fadein_downed"] = true}, 0.25 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_sustain_downed"] = true}, 3 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_fadeout_downed"] = true}, 0.8 )

		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_speed_scripted"] = true}, 0.2 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_fadeindelay_scripted"] = true}, 0.5 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_fadein_scripted"] = true}, 0.3 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_sustain_scripted"] = true}, 5 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_fadeout_scripted"] = true}, 0.8 )

	end

	MenuCallbackHandler.SlowMotionManager_noslowmo_callback = function(self, item)
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_speed_maskon"] = true}, 1 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_fadeindelay_maskon"] = true}, 0 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_fadein_maskon"] = true}, 0 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_sustain_maskon"] = true}, 0 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_fadeout_maskon"] = true}, 0 )

		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_speed_downed"] = true}, 1 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_fadein_downed"] = true}, 0 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_sustain_downed"] = true}, 0 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_fadeout_downed"] = true}, 0 )

		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_speed_scripted"] = true}, 1 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_fadeindelay_scripted"] = true}, 0 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_fadein_scripted"] = true}, 0 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_sustain_scripted"] = true}, 0 )
		MenuHelper:ResetItemsToDefaultValue( item, {["SlowMotionManager_fadeout_scripted"] = true}, 0 )
	end

	MenuCallbackHandler.SlowMotionManager_language_callback = function(self, item)
		SlowMotionManager.options.SlowMotionManager_language = item:value()
		SlowMotionManager:Save()
	end
end

SlowMotionManager:Load()

if SlowMotionManager.options["SlowMotionManager_language"] == 1 then

	Hooks:Add("LocalizationManagerPostInit", "SlowMotionManager_localization", function(loc)
		loc:load_localization_file( SlowMotionManager.localization.english )
	end)

elseif SlowMotionManager.options["SlowMotionManager_language"] == 2 then

	Hooks:Add("LocalizationManagerPostInit", "SlowMotionManager_localization", function(loc)
		loc:load_localization_file( SlowMotionManager.localization.french )
	end)
	
else

	Hooks:Add("LocalizationManagerPostInit", "SlowMotionManager_localization", function(loc)
		loc:load_localization_file( SlowMotionManager.localization.english )
	end)

end

MenuHelper:LoadFromJsonFile(ModPath .. "/options/menu.json", SlowMotionManager, SlowMotionManager.options)


function TimeSpeedEffectTweakData:_init_base_effects()
	self.mask_on = {
		speed = SlowMotionManager.options["SlowMotionManager_speed_maskon"] or 0,
		fade_in_delay = SlowMotionManager.options["SlowMotionManager_fadeindelay_maskon"] or 0,
		fade_in = SlowMotionManager.options["SlowMotionManager_fadein_maskon"] or 0,
		sustain = SlowMotionManager.options["SlowMotionManager_sustain_maskon"] or 0,
		fade_out = SlowMotionManager.options["SlowMotionManager_fadeout_maskon"] or 0,
		timer = "pausable"
	}
	self.mask_on_player = {
		speed = self.mask_on.speed or 0,
		fade_in_delay = self.mask_on.fade_in_delay or 0,
		fade_in = self.mask_on.fade_in or 0,
		sustain = self.mask_on.sustain or 0,
		fade_out = self.mask_on.fade_out or 0,
		timer = self.mask_on.timer,
		affect_timer = "player"
	}
	self.downed = {
		speed = SlowMotionManager.options["SlowMotionManager_speed_downed"] or 0,
		fade_in = SlowMotionManager.options["SlowMotionManager_fadein_downed"] or 0,
		sustain = SlowMotionManager.options["SlowMotionManager_sustain_downed"] or 0,
		fade_out = SlowMotionManager.options["SlowMotionManager_fadeout_downed"] or 0,
		timer = "pausable"
	}
	self.downed_player = {
		speed = self.downed.speed or 0,
		fade_in = self.downed.fade_in or 0,
		sustain = self.downed.sustain or 0,
		fade_out = self.downed.fade_out or 0,
		timer = self.downed.timer,
		affect_timer = "player"
	}
end

function TimeSpeedEffectTweakData:_init_mission_effects()
	self.mission_effects = {}
	self.mission_effects.quickdraw = {
		speed = SlowMotionManager.options["SlowMotionManager_speed_scripted"] or 0,
		fade_in_delay = SlowMotionManager.options["SlowMotionManager_fadeindelay_scripted"] or 0,
		fade_in = SlowMotionManager.options["SlowMotionManager_fadein_scripted"] or 0,
		sustain = SlowMotionManager.options["SlowMotionManager_sustain_scripted"] or 0,
		fade_out = SlowMotionManager.options["SlowMotionManager_fadeout_scripted"] or 0,
		timer = "pausable",
		sync = true
	}
	self.mission_effects.quickdraw_player = {
		speed = self.mission_effects.quickdraw.speed or 0,
		fade_in_delay = self.mission_effects.quickdraw.fade_in_delay or 0,
		fade_in = self.mission_effects.quickdraw.fade_in or 0,
		sustain = self.mission_effects.quickdraw.sustain or 0,
		fade_out = self.mission_effects.quickdraw.fade_out or 0,
		timer = "pausable",
		affect_timer = "player",
		sync = true
	}
end
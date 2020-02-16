if pdth_hud then
	log("[WaveSurvived] Loaded custom script pdth_hud.lua")

	local Net = _G.LuaNetworking
	local data_sender = false

	if Net:IsHost() then
		data_sender = true
	end

	function HUDAssaultCorner:_start_assault()
		local assault_panel = self._hud_panel:child("assault_panel")
		local control_assault_title = assault_panel:child("control_assault_title")
		local icon_assaultbox = assault_panel:child("icon_assaultbox")
		local num_hostages = self._hud_panel:child("num_hostages")
		local casing_panel = self._hud_panel:child("casing_panel")
		self._assault = true
		assault_panel:set_visible(true)
		num_hostages:set_alpha(0.5)
		casing_panel:set_visible(false)
	    self._is_casing_mode = false

	    local color = self._assault_color

	    if self._assault_mode == "phalanx" then
			color = self._vip_assault_color
	        self._fx_color = self._vip_assault_color_fx
		end

	    icon_assaultbox:set_color(color)
	    control_assault_title:set_color(color)
	    
	    if not managers.groupai:state():get_hunt_mode() then
	    	control_assault_title:set_text(managers.localization:text("menu_assault"))
	    else
	    	if data_sender then
				Net:SendToPeers( "WaveSurvived_Net", "endless" )
			end
	    	if WaveSurvived.options["WaveSurvived_custompanelcolor_endless"] and WaveSurvived.options["WaveSurvived_custompanelcolor_endless"] ~= 6 then
		 		icon_assaultbox:set_color(WaveSurvivedTweakData.ew_panel_color[WaveSurvived.options["WaveSurvived_custompanelcolor_endless"]])
	    		control_assault_title:set_color(WaveSurvivedTweakData.ew_panel_color[WaveSurvived.options["WaveSurvived_custompanelcolor_endless"]])
		 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor_endless"] == 6 then
		 		icon_assaultbox:set_color(Color(255, WaveSurvived.options["WaveSurvived_custompanelcolor_endless_customslider_red"], WaveSurvived.options["WaveSurvived_custompanelcolor_endless_customslider_green"], WaveSurvived.options["WaveSurvived_custompanelcolor_endless_customslider_blue"]) / 255)
	    		control_assault_title:set_color(Color(255, WaveSurvived.options["WaveSurvived_custompanelcolor_endless_customslider_red"], WaveSurvived.options["WaveSurvived_custompanelcolor_endless_customslider_green"], WaveSurvived.options["WaveSurvived_custompanelcolor_endless_customslider_blue"]) / 255)
		 	else	
				icon_assaultbox:set_color(Color.black)
	    		control_assault_title:set_color(Color.white)
		 	end

	    	control_assault_title:set_text("ENDLESS")
	    end
	    
	    local const = pdth_hud.constants
		control_assault_title:set_font_size(const.assault_font_size - 0.2)
		assault_panel:animate(callback(self, self, "flash_assault_title"), true)
	end

	function HUDAssaultCorner:_end_assault()
		local assault_panel = self._hud_panel:child("assault_panel")
		local control_assault_title = assault_panel:child("control_assault_title")
		local icon_assaultbox = assault_panel:child("icon_assaultbox")
		local num_hostages = self._hud_panel:child("num_hostages")
		num_hostages:set_alpha(1)
		if not self._assault then
			return
		end
		self._assault = false

		local const = pdth_hud.constants
		control_assault_title:set_font_size(const.assault_font_size - 2)
		control_assault_title:set_text("SURVIVED")

	    if WaveSurvived.options["WaveSurvived_custompanelcolor"] and WaveSurvived.options["WaveSurvived_custompanelcolor"] ~= 6 then
			control_assault_title:set_color(WaveSurvivedTweakData.ws_panel_color[WaveSurvived.options["WaveSurvived_custompanelcolor"]])
	 		icon_assaultbox:set_color(WaveSurvivedTweakData.ws_panel_color[WaveSurvived.options["WaveSurvived_custompanelcolor"]])
	 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor"] == 6 then
	 		control_assault_title:set_color(Color(255, WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_red"], WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_green"], WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_blue"]) / 255)
	 		icon_assaultbox:set_color(Color(255, WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_red"], WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_green"], WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_blue"]) / 255)
	 	else	
	 		control_assault_title:set_color(Color(1, 0.1254902, 0.9019608, 0.1254902))
	 		icon_assaultbox:set_color(Color(1, 0.1254902, 0.9019608, 0.1254902))
	 	end

		assault_panel:animate(callback(self, self, "flash_assault_title"), true)
		assault_panel:animate(callback(self, self, "_animate_wave_completed"), self)

	end

	function HUDAssaultCorner:_animate_wave_completed(panel, assault_hud)
		
		if WaveSurvived.options["WaveSurvived_duration"] and WaveSurvived.options["WaveSurvived_duration"] ~= 5 then
			wait(WaveSurvivedTweakData.duration[WaveSurvived.options["WaveSurvived_duration"]])
			local assault_panel = self._hud_panel:child("assault_panel")
			assault_panel:set_visible(false)
		elseif WaveSurvived.options["WaveSurvived_duration"] == 5 then
			return
		else
			wait(8.6)
			local assault_panel = self._hud_panel:child("assault_panel")
			assault_panel:set_visible(false)
		end

	end

end
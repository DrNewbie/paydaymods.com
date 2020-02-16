function HUDAssaultCorner:show_point_of_no_return_timer()
	local delay_time = self._assault and 1.2 or 0
	self:_close_assault_box()
	local point_of_no_return_panel = self._hud_panel:child("point_of_no_return_panel")
	self:_hide_hostages()
	point_of_no_return_panel:stop()
	point_of_no_return_panel:animate(callback(self, self, "_animate_show_noreturn"), delay_time)
	self:_set_feedback_color(self._noreturn_color)
	self._point_of_no_return = true
end

function HUDAssaultCorner:_start_assault(s)
	text_list = text_list or ""
	local assault_panel = self._hud_panel:child("assault_panel")
	self:set_text("assault", s)
	assault_panel:child("text"):set_color( LDDG:GetColor("AssaultColor") )
	local icon_assaultbox = self._hud_panel:child("assault_panel"):child("icon_assaultbox")
	icon_assaultbox:set_color( LDDG:GetColor("AssaultColor") )
	self:hide_casing()
	self._assault = true
	assault_panel:animate(callback(nil, _G, "set_alpha"), 1)
	self._bg_box:stop()
	assault_panel:animate(callback(self, self, "animate_assault_in_progress"))
	self._bg_box:animate(callback(nil, _G, "hudbox_animate_open_left"), 0.75, 242, nil, Color(), icon_assaultbox)
end

function HUDAssaultCorner:_end_assault()
	if not self._assault then
		self._start_assault_after_hostage_offset = nil
		return
	end
	self:_set_feedback_color(nil)
	self._assault = false
	self._remove_hostage_offset = true
	self._start_assault_after_hostage_offset = nil
	local assault_panel = self._hud_panel:child("assault_panel")
	local icon_assaultbox = self._hud_panel:child("assault_panel"):child("icon_assaultbox")
	
		self._survived = true
		assault_panel:child("text"):set_text("WAVE SURVIVED")

		if WaveSurvived.options["WaveSurvived_custompanelcolor"] and WaveSurvived.options["WaveSurvived_custompanelcolor"] ~= 6 then
	 		assault_panel:child("text"):set_color( WaveSurvivedTweakData.ws_panel_color[WaveSurvived.options["WaveSurvived_custompanelcolor"]] )
	 		icon_assaultbox:set_color( WaveSurvivedTweakData.ws_panel_color[WaveSurvived.options["WaveSurvived_custompanelcolor"]] )
	 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor"] == 6 then
	 		assault_panel:child("text"):set_color( Color(255, WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_red"], WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_green"], WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_blue"]) / 255 )
	 		icon_assaultbox:set_color( Color(255, WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_red"], WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_green"], WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_blue"]) / 255 )
	 	else	
			assault_panel:child("text"):set_color( Color(1, 0.1254902, 0.9019608, 0.1254902) )
			icon_assaultbox:set_color( Color(1, 0.1254902, 0.9019608, 0.1254902) )
	 	end
		assault_panel:animate(callback(self, self, "animate_assault_in_progress"))
		icon_assaultbox:stop()
		icon_assaultbox:animate(callback(self, self, "_show_icon_assaultbox"))

		self._hud_panel:child("assault_panel"):animate(callback(self, self, "_animate_wave_completed"), self)
end

function HUDAssaultCorner:animate_assault_in_progress(o)
	while self._assault do
		set_alpha(o, 0.6)
		set_alpha(o, 1)
	end
	while self._survived do
		set_alpha(o, 0.6)
		set_alpha(o, 1)
	end
	set_alpha(o, 0)
end

function HUDAssaultCorner:_animate_wave_completed(panel, assault_hud)
	
	if WaveSurvived.options["WaveSurvived_duration"] and WaveSurvived.options["WaveSurvived_duration"] ~= 5 then
		wait(WaveSurvivedTweakData.duration[WaveSurvived.options["WaveSurvived_duration"]])
		local function close_done()
			icon_assaultbox:stop()
			icon_assaultbox:animate(callback(self, self, "_hide_icon_assaultbox"))		
			self:sync_set_assault_mode("normal")
		end
		self._survived = false
		self._bg_box:stop()
		self._hud_panel:child("assault_panel"):animate(callback(nil, _G, "set_alpha"), 0)	
		self._bg_box:animate(callback(nil, _G, "HUDBGBox_animate_close_left"), close_done)
	elseif WaveSurvived.options["WaveSurvived_duration"] == 5 then
		return
	else
		wait(8.6)
		local function close_done()
			icon_assaultbox:stop()
			icon_assaultbox:animate(callback(self, self, "_hide_icon_assaultbox"))		
			self:sync_set_assault_mode("normal")
		end
		self._survived = false
		self._bg_box:stop()
		self._hud_panel:child("assault_panel"):animate(callback(nil, _G, "set_alpha"), 0)	
		self._bg_box:animate(callback(nil, _G, "HUDBGBox_animate_close_left"), close_done)
	end
end
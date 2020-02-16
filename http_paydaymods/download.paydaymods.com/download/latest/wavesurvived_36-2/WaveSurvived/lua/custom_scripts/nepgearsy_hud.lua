local Net = _G.LuaNetworking
local data_sender = false

if Net:IsHost() then
	data_sender = true
end

function HUDAssaultCorner:show_point_of_no_return_timer()
	local delay_time = self._assault and 1.2 or 0
	self:_close_assault_box()
	local point_of_no_return_panel = self._hud_panel:child("point_of_no_return_panel")
	--self:_hide_hostages()
	point_of_no_return_panel:stop()
	point_of_no_return_panel:animate(callback(self, self, "_animate_show_noreturn"), delay_time)
	self:_set_feedback_color(self._noreturn_color)
	self._point_of_no_return = true
end

function HUDAssaultCorner:_update_hud_endless_assault()
	if managers.groupai:state():get_hunt_mode() and self._assault_mode ~= "phalanx" then

		local mod_text_send = ""

		if WaveSurvived.options["WaveSurvived_endless_customtext"] then
			mod_text_send = managers.localization:text("WaveSurvived_endless_customtext_" .. WaveSurvived.options["WaveSurvived_endless_customtext"])
		else
			mod_text_send = managers.localization:text("WaveSurvived_endless_customtext_1")
		end

		self:_update_mod_spot(mod_text_send)
		self.endless_color = Color(1, 1, 0, 0)
		local assault_panel = self._hud_panel:child("assault_panel")
		local text_panel = assault_panel:child("text_panel")
		--self:_set_text_list(self._get_endless_assault_strings())
		self._assault = true
		if self._bg_box:child("text_panel") then
			self._bg_box:child("text_panel"):stop()
			self._bg_box:child("text_panel"):clear()
		else
			self._bg_box:panel({name = "text_panel"})
		end
		self._bg_box:child("bg"):stop()
		assault_panel:set_visible(true)
		local icon_assaultbox = assault_panel:child("icon_assaultbox")
		icon_assaultbox:stop()
		icon_assaultbox:animate(callback(self, self, "_show_icon_assaultbox"))
		local config = {
			attention_color = self.endless_color,
			attention_forever = true,
			attention_color_function = callback(self, self, "assault_attention_color_function")
		}
		self._bg_box:stop()
		self._bg_box:animate(callback(nil, _G, "HUDBGBox_animate_open_down"), 0.75, self._assault_bar_thickness, function()
		end, config)
		local box_text_panel = self._bg_box:child("text_panel")
		box_text_panel:stop()
		--box_text_panel:animate(callback(self, self, "_animate_text"), nil, nil, callback(self, self, "assault_attention_color_function"))
		self:_set_feedback_color(nil)

		if WaveSurvived.options["WaveSurvived_custompanelcolor_endless"] and WaveSurvived.options["WaveSurvived_custompanelcolor_endless"] ~= 6 then
			self:_update_assault_hud_color(WaveSurvivedTweakData.ew_panel_color[WaveSurvived.options["WaveSurvived_custompanelcolor_endless"]])
	 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor_endless"] == 6 then
			self:_update_assault_hud_color(Color(255, WaveSurvived.options["WaveSurvived_custompanelcolor_endless_customslider_red"], WaveSurvived.options["WaveSurvived_custompanelcolor_endless_customslider_green"], WaveSurvived.options["WaveSurvived_custompanelcolor_endless_customslider_blue"]) / 255)
	 	else	
			self:_update_assault_hud_color(self.endless_color)
	 	end

		if alive(self._wave_bg_box) then
			self._wave_bg_box:stop()
			self._wave_bg_box:animate(callback(self, self, "_animate_wave_started"), self)
		end
	end
end

function HUDAssaultCorner:_start_assault(text_list)
	self._assault_count = self._assault_count + 1
	if managers.groupai:state():get_hunt_mode() and self._assault_mode ~= "phalanx" then
		self:_update_hud_endless_assault()
		if data_sender then
			Net:SendToPeers( "WaveSurvived_Net", "endless" )
		end
	end
	if not managers.groupai:state():get_hunt_mode() then
		text_list = text_list or {""}
		local assault_panel = self._hud_panel:child("assault_panel")
		local text_panel = assault_panel:child("text_panel")
		self:_set_text_list(text_list)
		self._assault = true
		if self._bg_box:child("text_panel") then
			self._bg_box:child("text_panel"):stop()
			self._bg_box:child("text_panel"):clear()
		else
			self._bg_box:panel({name = "text_panel"})
		end
		self._bg_box:child("bg"):stop()
		assault_panel:set_visible(true)
		local icon_assaultbox = assault_panel:child("icon_assaultbox")
		icon_assaultbox:stop()
		icon_assaultbox:animate(callback(self, self, "_show_icon_assaultbox"))
		local config = {
			attention_color = self._assault_color,
			attention_forever = true,
			attention_color_function = callback(self, self, "assault_attention_color_function")
		}
		self._bg_box:stop()
		self._bg_box:animate(callback(nil, _G, "HUDBGBox_animate_open_down"), 0.75, self._assault_bar_thickness, function()
		end, config)
		local box_text_panel = self._bg_box:child("text_panel")
		box_text_panel:stop()
		--box_text_panel:animate(callback(self, self, "_animate_text"), nil, nil, callback(self, self, "assault_attention_color_function"))
		self:_update_assault_hud_color(Color(1, 1, 1, 0))

		log(tostring(self._wave_number))

		if self._assault_count == 1 then
			self:_update_text_spot(managers.localization:to_upper_text("NepgearsyHUD_AssaultBar_FirstAssault"))
		else
			self:_update_text_spot(managers.localization:to_upper_text("hud_assault_assault"))
		end

		self:_set_feedback_color(self._assault_color)
		if alive(self._wave_bg_box) then
			self._wave_bg_box:stop()
			self._wave_bg_box:animate(callback(self, self, "_animate_wave_started"), self)
		end
	end
end

function HUDAssaultCorner:_end_assault()
	if not self._assault then
		self._start_assault_after_hostage_offset = nil
		return
	end

	self:_set_feedback_color(nil)
	self._assault = false
	local box_text_panel = self._bg_box:child("text_panel")
	box_text_panel:stop()
	box_text_panel:clear()
	self._remove_hostage_offset = true
	self._start_assault_after_hostage_offset = nil
	local icon_assaultbox = self._hud_panel:child("assault_panel"):child("icon_assaultbox")
	icon_assaultbox:stop()
	self:_update_text_spot("ASSAULT SURVIVED")
	if self:is_safehouse_raid() then
		self:_update_assault_hud_color(self._assault_survived_color)
		self:_set_text_list(self:_get_survived_assault_strings())
		self:_update_text_spot("WAVE SURVIVED")	
		box_text_panel:animate(callback(self, self, "_animate_text"), nil, nil, callback(self, self, "assault_attention_color_function"))
		icon_assaultbox:stop()
		icon_assaultbox:animate(callback(self, self, "_show_icon_assaultbox"))
		self._wave_bg_box:stop()
		self._wave_bg_box:animate(callback(self, self, "_animate_wave_completed"), self)
	end
end
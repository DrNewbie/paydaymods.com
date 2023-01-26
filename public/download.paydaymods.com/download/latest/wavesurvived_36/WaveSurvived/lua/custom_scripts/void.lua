function HUDAssaultCorner:_get_endless_assault_strings()
	if WaveSurvived.options["WaveSurvived_endless_customtext"] then
		if managers.job:current_difficulty_stars() > 0 then
			local ids_risk = Idstring("risk")
			return {
				"WaveSurvived_endless_customtext_" .. WaveSurvived.options["WaveSurvived_endless_customtext"],
				"hud_assault_end_line",
				ids_risk,
				"hud_assault_end_line",
				"WaveSurvived_endless_customtext_" .. WaveSurvived.options["WaveSurvived_endless_customtext"],
				"hud_assault_end_line",
				ids_risk,
				"hud_assault_end_line"
			}
		else
			return {
				"WaveSurvived_endless_customtext_" .. WaveSurvived.options["WaveSurvived_endless_customtext"],
				"hud_assault_end_line",
				"WaveSurvived_endless_customtext_" .. WaveSurvived.options["WaveSurvived_endless_customtext"],
				"hud_assault_end_line",
				"WaveSurvived_endless_customtext_" .. WaveSurvived.options["WaveSurvived_endless_customtext"],
				"hud_assault_end_line"
			}
		end
	else
		if managers.job:current_difficulty_stars() > 0 then
			local ids_risk = Idstring("risk")
			return {
				"WaveSurvived_endless_customtext_1",
				"hud_assault_end_line",
				ids_risk,
				"hud_assault_end_line",
				"WaveSurvived_endless_customtext_1",
				"hud_assault_end_line",
				ids_risk,
				"hud_assault_end_line"
			}
		else
			return {
				"WaveSurvived_endless_customtext_1",
				"hud_assault_end_line",
				"WaveSurvived_endless_customtext_1",
				"hud_assault_end_line",
				"WaveSurvived_endless_customtext_1",
				"hud_assault_end_line"
			}
		end
	end
end

function HUDAssaultCorner:_get_survived_assault_strings()
	if WaveSurvived.options["WaveSurvived_customtext"] then
		if managers.job:current_difficulty_stars() > 0 then
			local ids_risk = Idstring("risk")
			return {
				"WaveSurvived_customtext_" .. WaveSurvived.options["WaveSurvived_customtext"],
				"hud_assault_end_line",
				ids_risk,
				"hud_assault_end_line",
				"WaveSurvived_customtext_" .. WaveSurvived.options["WaveSurvived_customtext"],
				"hud_assault_end_line",
				ids_risk,
				"hud_assault_end_line"
			}
		else
			return {
				"WaveSurvived_customtext_" .. WaveSurvived.options["WaveSurvived_customtext"],
				"hud_assault_end_line",
				"WaveSurvived_customtext_" .. WaveSurvived.options["WaveSurvived_customtext"],
				"hud_assault_end_line",
				"WaveSurvived_customtext_" .. WaveSurvived.options["WaveSurvived_customtext"],
				"hud_assault_end_line"
			}
		end
	else
		if managers.job:current_difficulty_stars() > 0 then
			local ids_risk = Idstring("risk")
			return {
				"hud_assault_survived",
				"hud_assault_end_line",
				ids_risk,
				"hud_assault_end_line",
				"hud_assault_survived",
				"hud_assault_end_line",
				ids_risk,
				"hud_assault_end_line"
			}
		else
			return {
				"hud_assault_survived",
				"hud_assault_end_line",
				"hud_assault_survived",
				"hud_assault_end_line",
				"hud_assault_survived",
				"hud_assault_end_line"
			}
		end
	end
end

function HUDAssaultCorner:_start_assault(text_list)
	text_list = text_list or {""}
	local assault_panel = self._custom_hud_panel:child("assault_panel")
	local assaultbox_panel = assault_panel:child("assaultbox_panel")
	local icon_assaultbox = assault_panel:child("icon_assaultbox")
	local assaultbox_skulls = assault_panel:child("assaultbox_skulls")
	
	self:_set_hostage_offseted(true, true)

	if managers.crime_spree:is_active() then
		assaultbox_skulls:set_font_size(15)
		assaultbox_skulls:set_text(managers.crime_spree:server_spree_level())
		local w = select(3, assaultbox_skulls:text_rect())
		if w > assaultbox_skulls:w() then
			assaultbox_skulls:set_font_size(15 * (15 / w))
		end
	end
	
	self:_set_text_list(text_list)

	if self._assault == true then 
		self:sync_set_assault_mode("normal")
	else
		self._assault = true
	end
	
	if Network:is_server() and managers.groupai:state():get_hunt_mode() then self:sync_set_assault_mode("endless") self:_update_hud_endless_assault() end
	
	if self._assault_phase == 1 then 
		--self:sync_set_assault_mode("phalanx")
		self._assault_phase = 2
	end
	if assaultbox_panel:child("text_panel") then
		assaultbox_panel:child("text_panel"):stop()
		assaultbox_panel:child("text_panel"):clear()
		assaultbox_panel:child("text_panel"):set_w(VoidUI.options.show_badge and assaultbox_panel:w() or assaultbox_panel:w() - 26 * self._scale)
	else
		assaultbox_panel:panel({name = "text_panel", w = VoidUI.options.show_badge and assaultbox_panel:w() or assaultbox_panel:w() - 30 * self._scale})
	end
	local text_panel = assaultbox_panel:child("text_panel")
	
	assault_panel:set_visible(true)
	icon_assaultbox:set_visible(VoidUI.options.show_badge)
	if assaultbox_skulls then assaultbox_skulls:set_visible(VoidUI.options.show_badge) end
	icon_assaultbox:stop()
	icon_assaultbox:animate(callback(self, self, "_show_icon_assaultbox"), true)
	assaultbox_panel:stop()
	assaultbox_panel:animate(callback(self, self, "_show_assaultbox"), 0.5, true)
	
	local config = {
		attention_color = self._assault_color,
		attention_forever = true,
		attention_color_function = callback(self, self, "assault_attention_color_function")
	}
	text_panel:stop()
	text_panel:animate(callback(self, self, "_animate_text"), nil, nil, callback(self, self, "assault_attention_color_function"))
	self:_set_feedback_color(self._assault_color)
end

function HUDAssaultCorner:_end_assault()
	if not self._assault then
		self._start_assault_after_hostage_offset = nil
		return
	end
	
	local assault_panel = self._custom_hud_panel:child("assault_panel")
	local assaultbox_panel = assault_panel:child("assaultbox_panel")
	local text_panel = assaultbox_panel:child("text_panel")
	local icon_assaultbox = assault_panel:child("icon_assaultbox")
	self:_set_feedback_color(nil)
	self._assault = false
	
	--self._remove_hostage_offset = true
	self._start_assault_after_hostage_offset = nil
	local icon_assaultbox = self._custom_hud_panel:child("assault_panel"):child("icon_assaultbox")
	icon_assaultbox:stop()

	if WaveSurvived.options["WaveSurvived_custompanelcolor"] and WaveSurvived.options["WaveSurvived_custompanelcolor"] ~= 6 then
		self:_update_assault_hud_color(WaveSurvivedTweakData.ws_panel_color[WaveSurvived.options["WaveSurvived_custompanelcolor"]])
 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor"] == 6 then
		self:_update_assault_hud_color(Color(255, WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_red"], WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_green"], WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_blue"]) / 255)
 	else	
		self:_update_assault_hud_color(self._assault_survived_color)
 	end

	text_panel:animate(callback(self, self, "_animate_wave_completed"), self)

end

function HUDAssaultCorner:_animate_wave_completed(panel, assault_hud)
	if not self:is_safehouse_raid() then
		if WaveSurvived.options["WaveSurvived_duration"] and WaveSurvived.options["WaveSurvived_duration"] ~= 5 then
			wait(WaveSurvivedTweakData.duration[WaveSurvived.options["WaveSurvived_duration"]])
			self:_close_assault_box()
		elseif WaveSurvived.options["WaveSurvived_duration"] == 5 then
			return
		else
			wait(8.6)
			self:_close_assault_box()
		end
	else
		local wave_text = panel:child("num_waves")
		local bg = panel:child("bg")
		wait(1.4)
		wave_text:set_text(self:get_completed_waves_string())
		bg:stop()
		bg:animate(callback(nil, _G, "HUDBGBox_animate_bg_attention"), {})
		wait(7.2)
		assault_hud:_close_assault_box()
	end
end
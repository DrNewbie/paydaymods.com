local Net = _G.LuaNetworking
local data_sender = false

if Net:IsHost() then
	data_sender = true
end

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

function HUDAssaultCorner:sync_start_assault(data)
	self.endless_color = Color(1, 1, 0, 0)
	if self._point_of_no_return or self._casing then
		return
	end
	local color = self._assault_color
	if self._assault_mode == "phalanx" then
		color = self._vip_assault_color
	end
	if managers.groupai:state():get_hunt_mode() then
		if WaveSurvived.options["WaveSurvived_custompanelcolor_endless"] and WaveSurvived.options["WaveSurvived_custompanelcolor_endless"] ~= 6 then
			self:_update_assault_hud_color(WaveSurvivedTweakData.ew_panel_color[WaveSurvived.options["WaveSurvived_custompanelcolor_endless"]])
	 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor_endless"] == 6 then
			self:_update_assault_hud_color(Color(255, WaveSurvived.options["WaveSurvived_custompanelcolor_endless_customslider_red"], WaveSurvived.options["WaveSurvived_custompanelcolor_endless_customslider_green"], WaveSurvived.options["WaveSurvived_custompanelcolor_endless_customslider_blue"]) / 255)
	 	else	
			self:_update_assault_hud_color(self.endless_color)
	 	end
	else
		self:_update_assault_hud_color(color)
	end
	self._start_assault_after_hostage_offset = true
	self:_set_hostage_offseted(true)
end

function HUDAssaultCorner:_update_hud_endless_assault()
	if managers.groupai:state():get_hunt_mode() and self._assault_mode ~= "phalanx" then
		self.endless_color = Color(1, 1, 0, 0)
		
		if self._assault then
		return end

		text_list = text_list or {""}
		local assault_panel = self._hud_panel:child("assault_panel")
		local text_panel = assault_panel:child("text_panel")
		self:_set_text_list(text_list)
		self._assault = true
		self._hud_panel:child("assault_panel"):child("text_panel"):stop()
		self._hud_panel:child("assault_panel"):child("text_panel"):clear()
		assault_panel:set_visible(true)
		text_panel:stop()
		assault_panel:stop()
		assault_panel:animate(callback(self, self, "_animate_assault"))
		text_panel:animate(callback(self, self, "_animate_text"), nil, nil, nil)
		self:_set_feedback_color(self.endless_color)
		
		if WaveSurvived.options["WaveSurvived_custompanelcolor_endless"] and WaveSurvived.options["WaveSurvived_custompanelcolor_endless"] ~= 6 then
			self:_update_assault_hud_color(WaveSurvivedTweakData.ew_panel_color[WaveSurvived.options["WaveSurvived_custompanelcolor_endless"]])
	 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor_endless"] == 6 then
			self:_update_assault_hud_color(Color(255, WaveSurvived.options["WaveSurvived_custompanelcolor_endless_customslider_red"], WaveSurvived.options["WaveSurvived_custompanelcolor_endless_customslider_green"], WaveSurvived.options["WaveSurvived_custompanelcolor_endless_customslider_blue"]) / 255)
	 	else	
			self:_update_assault_hud_color(self.endless_color)
	 	end
		
		self:_set_text_list(self._get_endless_assault_strings())
	end
end

function HUDAssaultCorner:_start_assault(text_list)
	if managers.groupai:state():get_hunt_mode() and self._assault_mode ~= "phalanx" then
		self:_update_hud_endless_assault()
		if data_sender then
			Net:SendToPeers( "WaveSurvived_Net", "endless" )
		end
	end
	if not managers.groupai:state():get_hunt_mode() then
		if self._assault then
		return end
		text_list = text_list or {""}
		local assault_panel = self._hud_panel:child("assault_panel")
		local text_panel = assault_panel:child("text_panel")
		self:_set_text_list(text_list)
		self._assault = true
		self._hud_panel:child("assault_panel"):child("text_panel"):stop()
		self._hud_panel:child("assault_panel"):child("text_panel"):clear()
		assault_panel:set_visible(true)
		text_panel:stop()
		assault_panel:stop()
		assault_panel:animate(callback(self, self, "_animate_assault"))
		text_panel:animate(callback(self, self, "_animate_text"), nil, nil, nil)
		self:_set_feedback_color(self._assault_color)
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

function HUDAssaultCorner:_check_snh20_assault_corner_difficulty_names()
	if SystemFS:exists("mods/AssaultCornerDifficultyNames/mod.txt") then
		return true
	end

	return false
end

function HUDAssaultCorner:_get_survived_assault_strings_snh()
	-- Code by Snh20
	local minskulls = 0
	local ids_risk = Idstring("risk")
	local _get_survived_assault_strings_actual = HUDAssaultCorner._get_survived_assault_strings

	local strings = _get_survived_assault_strings_actual(self)

	if strings == nil or #strings < 1 or managers.job:current_difficulty_stars() < minskulls then
		return strings
	end

	local difficulty_name_id = tweak_data ~= nil and tweak_data.difficulty_name_id or nil
	if not difficulty_name_id then
		return strings
	end

	for index, data in ipairs(strings) do
		if type(data) == "userdata" and data == ids_risk then
			strings[index] = difficulty_name_id
		end
	end

	return strings
end

function HUDAssaultCorner:_end_assault()
	if not self._assault then
		self._start_assault_after_hostage_offset = nil
		return
	end
	self._remove_hostage_offset = true
	self._start_assault_after_hostage_offset = nil
	self:_set_feedback_color(nil)
	local assault_panel = self._hud_panel:child("assault_panel")
	local text_panel = assault_panel:child("text_panel")
	self._hud_panel:child("assault_panel"):child("text_panel"):stop()
	self._hud_panel:child("assault_panel"):child("text_panel"):clear()
	if self:is_safehouse_raid() then
		self._raid_finised = false
		wave_panel = self._hud_panel:child("wave_panel")
		self:_update_assault_hud_color(Color(255, 32, 230, 32) / 255)
		if not self:_check_snh20_assault_corner_difficulty_names() then
			self:_set_text_list(self:_get_survived_assault_strings())
		else
			self:_set_text_list(self:_get_survived_assault_strings_snh())
		end
		text_panel:animate(callback(self, self, "_animate_text"), nil, nil, nil)
		self._completed_waves = self._completed_waves + 1
		wave_panel:animate(callback(self, self, "_animate_wave_completed"), self)
	else
			if WaveSurvived.options["WaveSurvived_custompanelcolor"] and WaveSurvived.options["WaveSurvived_custompanelcolor"] ~= 6 then
				self:_update_assault_hud_color(WaveSurvivedTweakData.ws_panel_color[WaveSurvived.options["WaveSurvived_custompanelcolor"]])
		 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor"] == 6 then
				self:_update_assault_hud_color(Color(255, WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_red"], WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_green"], WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_blue"]) / 255)
		 	else	
				self:_update_assault_hud_color(self._assault_survived_color)
		 	end

			if not self:_check_snh20_assault_corner_difficulty_names() then
				self:_set_text_list(self:_get_survived_assault_strings())
			else
				self:_set_text_list(self:_get_survived_assault_strings_snh())
			end
			
			text_panel:animate(callback(self, self, "_animate_text"), nil, nil, nil)
			self._hud_panel:child("assault_panel"):animate(callback(self, self, "_animate_wave_completed"), self)
	end
end

function HUDAssaultCorner:_animate_wave_completed(panel, assault_hud)
	if not self.is_safehouse_raid() then
		wait(15)
		self:_close_assault_box()
	else
		local wave_text = panel:child("num_waves")
		wait(1.4)
		wave_text:set_text(tostring(self._completed_waves))
		wait(7.2)
		self:_close_assault_box()
	end
end
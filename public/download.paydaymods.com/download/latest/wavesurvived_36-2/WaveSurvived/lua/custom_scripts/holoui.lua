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
 	self:_set_feedback_color(nil)
 	self._assault = false
 	local box_text_panel = self._bg_box:child("text_panel")
 	box_text_panel:stop()
 	box_text_panel:clear()
 	self._remove_hostage_offset = true
 	self._start_assault_after_hostage_offset = nil
 	local icon_assaultbox = self._hud_panel:child("assault_panel"):child("icon_assaultbox")
 	icon_assaultbox:stop()

		self:_update_assault_hud_color(Color(255, 32, 230, 32) / 255)
		
		if not self:_check_snh20_assault_corner_difficulty_names() then
			self:_set_text_list(self:_get_survived_assault_strings())
		else
			self:_set_text_list(self:_get_survived_assault_strings_snh())
		end
		
		box_text_panel:animate(callback(self, self, "_animate_text"), nil, nil, callback(self, self, "assault_attention_color_function"))
		icon_assaultbox:stop()
		icon_assaultbox:animate(callback(self, self, "_show_icon_assaultbox"))
		box_text_panel:animate(callback(self, self, "_animate_wave_completed"), self)
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
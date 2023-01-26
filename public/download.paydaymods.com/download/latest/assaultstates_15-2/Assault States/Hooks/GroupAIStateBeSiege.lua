Hooks:Add("NetworkReceivedData", "NetworkAssaultStates", function(sender, id, data)
	local Net = _G.LuaNetworking
	local mod_key = "AssaultStates_Net"
    if id == mod_key then

        local function get_assault_state_options(option)
	 		if assaultstates and assaultstates.Options then
	 			return assaultstates.Options:GetValue(option)
	 		else
	 			log("[AssaultStates] Something went wrong.. Couldn't load data")
	 		end
	 	end

	 	local function get_control_lines()
			if managers.job:current_difficulty_stars() > 0 then
				local ids_risk = Idstring("risk")
				return {
					"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
					"hud_assault_end_line",
					ids_risk,
					"hud_assault_end_line",
					"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
					"hud_assault_end_line",
					ids_risk,
					"hud_assault_end_line"
				}
			else
				return {
					"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
					"hud_assault_end_line",
					"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
					"hud_assault_end_line",
					"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
					"hud_assault_end_line",
					"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
					"hud_assault_end_line"
				}
			end
	 	end

	 	WaveSurvived = {}
		WaveSurvived.options = {}

		local function Load()
			local file = io.open( SavePath .. "/WaveSurvived_options.txt" , "r")
			if file then
				for k, v in pairs(json.decode(file:read("*all")) or {}) do
					if k then
						WaveSurvived.options[k] = v
					end
				end
				file:close()
			end
		end

		Load()

		local function get_ws_control_lines()
			if WaveSurvived.options["WaveSurvived_customtext"] then
				if managers.job:current_difficulty_stars() > 0 then
					local ids_risk = Idstring("risk")
					return {
						"WaveSurvived_customtext_" .. WaveSurvived.options["WaveSurvived_customtext"],
						"hud_assault_end_line",
						"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
						"hud_assault_end_line",
						ids_risk,
						"hud_assault_end_line",
						"WaveSurvived_customtext_" .. WaveSurvived.options["WaveSurvived_customtext"],
						"hud_assault_end_line",
						"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
						"hud_assault_end_line",
						ids_risk,
						"hud_assault_end_line"
					}
				else
					return {
						"WaveSurvived_customtext_" .. WaveSurvived.options["WaveSurvived_customtext"],
						"hud_assault_end_line",
						"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
						"hud_assault_end_line",
						"WaveSurvived_customtext_" .. WaveSurvived.options["WaveSurvived_customtext"],
						"hud_assault_end_line",
						"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
						"hud_assault_end_line"
					}
				end
			else
				if managers.job:current_difficulty_stars() > 0 then
					local ids_risk = Idstring("risk")
					return {
						"hud_assault_survived",
						"hud_assault_end_line",
						"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
						"hud_assault_end_line",
						ids_risk,
						"hud_assault_end_line",
						"hud_assault_survived",
						"hud_assault_end_line",
						"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
						"hud_assault_end_line",
						ids_risk,
						"hud_assault_end_line"
					}
				else
					return {
						"hud_assault_survived",
						"hud_assault_end_line",
						"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
						"hud_assault_end_line",
						"hud_assault_survived",
						"hud_assault_end_line",
						"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
						"hud_assault_end_line"
					}
				end
			end
	 	end

	 	local function get_anticipation_lines()
			if managers.job:current_difficulty_stars() > 0 then
				local ids_risk = Idstring("risk")
				return {
					"AnticipationTask_textlist_" .. get_assault_state_options("Textlist/textlist_anticipation_task"),
					"hud_assault_end_line",
					ids_risk,
					"hud_assault_end_line",
					"AnticipationTask_textlist_" .. get_assault_state_options("Textlist/textlist_anticipation_task"),
					"hud_assault_end_line",
					ids_risk,
					"hud_assault_end_line"
				}
			else
				return {
					"AnticipationTask_textlist_" .. get_assault_state_options("Textlist/textlist_anticipation_task"),
					"hud_assault_end_line",
					"AnticipationTask_textlist_" .. get_assault_state_options("Textlist/textlist_anticipation_task"),
					"hud_assault_end_line",
					"AnticipationTask_textlist_" .. get_assault_state_options("Textlist/textlist_anticipation_task"),
					"hud_assault_end_line"
				}
			end
	 	end

	 	local function get_build_lines()
	 		if managers.hud._hud_assault_corner._assault_mode == "normal" then
				if managers.job:current_difficulty_stars() > 0 then
					local ids_risk = Idstring("risk")
					return {
						"hud_assault_assault",
						"hud_assault_end_line",
						"BuildTask_textlist_" .. get_assault_state_options("Textlist/textlist_build_task"),
						"hud_assault_end_line",
						ids_risk,
						"hud_assault_end_line",
						"hud_assault_assault",
						"hud_assault_end_line",
						"BuildTask_textlist_" .. get_assault_state_options("Textlist/textlist_build_task"),
						"hud_assault_end_line",
						ids_risk,
						"hud_assault_end_line"
					}
				else
					return {
						"hud_assault_assault",
						"hud_assault_end_line",
						"BuildTask_textlist_" .. get_assault_state_options("Textlist/textlist_build_task"),
						"hud_assault_end_line",
						"hud_assault_assault",
						"hud_assault_end_line",
						"BuildTask_textlist_" .. get_assault_state_options("Textlist/textlist_build_task"),
						"hud_assault_end_line"
					}
				end
			end
	 	end

	 	local function get_sustain_lines()
	 		if managers.hud._hud_assault_corner._assault_mode == "normal" then
				if managers.job:current_difficulty_stars() > 0 then
					local ids_risk = Idstring("risk")
					return {
						"hud_assault_assault",
						"hud_assault_end_line",
						"SustainTask_textlist_" .. get_assault_state_options("Textlist/textlist_sustain_task"),
						"hud_assault_end_line",
						ids_risk,
						"hud_assault_end_line",
						"hud_assault_assault",
						"hud_assault_end_line",
						"SustainTask_textlist_" .. get_assault_state_options("Textlist/textlist_sustain_task"),
						"hud_assault_end_line",
						ids_risk,
						"hud_assault_end_line"
					}
				else
					return {
						"hud_assault_assault",
						"hud_assault_end_line",
						"SustainTask_textlist_" .. get_assault_state_options("Textlist/textlist_sustain_task"),
						"hud_assault_end_line",
						"hud_assault_assault",
						"hud_assault_end_line",
						"SustainTask_textlist_" .. get_assault_state_options("Textlist/textlist_sustain_task"),
						"hud_assault_end_line"
					}
				end
			end
	 	end

	 	local function get_fade_lines()
	 		if managers.hud._hud_assault_corner._assault_mode == "normal" then
				if managers.job:current_difficulty_stars() > 0 then
					local ids_risk = Idstring("risk")
					return {
						"hud_assault_assault",
						"hud_assault_end_line",
						"FadeTask_textlist_" .. get_assault_state_options("Textlist/textlist_fade_task"),
						"hud_assault_end_line",
						ids_risk,
						"hud_assault_end_line",
						"hud_assault_assault",
						"hud_assault_end_line",
						"FadeTask_textlist_" .. get_assault_state_options("Textlist/textlist_fade_task"),
						"hud_assault_end_line",
						ids_risk,
						"hud_assault_end_line"
					}
				else
					return {
						"hud_assault_assault",
						"hud_assault_end_line",
						"FadeTask_textlist_" .. get_assault_state_options("Textlist/textlist_fade_task"),
						"hud_assault_end_line",
						"hud_assault_assault",
						"hud_assault_end_line",
						"FadeTask_textlist_" .. get_assault_state_options("Textlist/textlist_fade_task"),
						"hud_assault_end_line"
					}
				end
			end
	 	end

        if pdth_hud and pdth_hud.Options then
        	if pdth_hud.Options:GetValue("HUD/Assault") then

        		local assault_panel = managers.hud._hud_assault_corner._hud_panel:child("assault_panel")
				local control_assault_title = assault_panel:child("control_assault_title")
				local icon_assaultbox = assault_panel:child("icon_assaultbox")

	        	if data == "build" and get_assault_state_options("Enabled/enable_build_task") then
	        		icon_assaultbox:set_color(get_assault_state_options("Color/color_buildtask"))
		    		control_assault_title:set_color(get_assault_state_options("Color/color_buildtask"))
		    		local const = pdth_hud.constants
					control_assault_title:set_font_size(const.assault_font_size - 3.5)
		    		control_assault_title:set_text("BUILDING")
	        	end

	        	if data == "sustain" and get_assault_state_options("Enabled/enable_sustain_task") then
	        		icon_assaultbox:set_color(get_assault_state_options("Color/color_sustaintask"))
		    		control_assault_title:set_color(get_assault_state_options("Color/color_sustaintask"))
		    		local const = pdth_hud.constants
					control_assault_title:set_font_size(const.assault_font_size - 0.3)
		    		control_assault_title:set_text("SUSTAIN")
	        	end

	        	if data == "fade" and get_assault_state_options("Enabled/enable_fade_task") then
	        		icon_assaultbox:set_color(get_assault_state_options("Color/color_fadetask"))
		    		control_assault_title:set_color(get_assault_state_options("Color/color_fadetask"))
		    		local const = pdth_hud.constants
					control_assault_title:set_font_size(const.assault_font_size)
		    		control_assault_title:set_text("FADING")
	        	end
	        else
	        	if data == "control" and get_assault_state_options("Enabled/enable_control_task") then
	        		if not wavesurvived then
	        			if managers.hud._hud_assault_corner._assault_mode ~= "phalanx" then
						    managers.hud._hud_assault_corner:_start_assault(get_control_lines())
							managers.hud._hud_assault_corner:_set_hostage_offseted(true)
							managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_controltask"))
						end
	        		else
	        			if managers.hud._hud_assault_corner._assault_mode ~= "phalanx" and not managers.groupai:state():get_hunt_mode() then
		        			if managers.groupai:state():get_assault_number() > 0 then
					 			if WaveSurvived.options["WaveSurvived_custompanelcolor"] == 1 then
									managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, 32, 230, 32) / 255)
							 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor"] == 2 then
									managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, 255, 255, 0) / 255)
							 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor"] == 3 then
									managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, 255, 0, 0) / 255)
							 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor"] == 4 then
									managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, 0, 255, 255) / 255)
							 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor"] == 5 then
									managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, 255, 127, 80) / 255)
							 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor"] == 6 then
									managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_red"], WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_green"], WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_blue"]) / 255)
							 	else	
									managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, 32, 230, 32) / 255)
							 	end
							else
								managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_controltask"))
							end
						end

		        		if managers.groupai:state():get_assault_number() == 0 then
					 		if not managers.hud._hud_assault_corner._assault and not managers.hud._hud_assault_corner._point_of_no_return then
					        	managers.hud._hud_assault_corner:_start_assault(get_control_lines())
								managers.hud._hud_assault_corner:_set_hostage_offseted(true)
					        end
						else
							if not managers.hud._hud_assault_corner._assault and not managers.hud._hud_assault_corner._point_of_no_return then
								managers.hud._hud_assault_corner:_start_assault(get_ws_control_lines())
								managers.hud._hud_assault_corner:_set_hostage_offseted(true)
							end
						end
					end
	        	end

	        	if data == "anticipation" and get_assault_state_options("Enabled/enable_anticipation_task") then
	        		if managers.hud._hud_assault_corner._assault_mode ~= "phalanx" and not managers.groupai:state():get_hunt_mode() then
		        		managers.hud._hud_assault_corner:_set_text_list(get_anticipation_lines())
						managers.hud._hud_assault_corner:_set_hostage_offseted(true)
				 		managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_anticipationtask"))
				 	end
	        	end
	        	if data == "build" and get_assault_state_options("Enabled/enable_build_task") then
		        	managers.hud._hud_assault_corner:_set_text_list(get_build_lines())
			 		managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_buildtask"))
		        end

		        if data == "sustain" and get_assault_state_options("Enabled/enable_sustain_task") then
		        	managers.hud._hud_assault_corner:_set_text_list(get_sustain_lines())
			 		managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_sustaintask"))
		        end

		        if data == "fade" and get_assault_state_options("Enabled/enable_fade_task") then
		        	managers.hud._hud_assault_corner:_set_text_list(get_fade_lines())
			 		managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_fadetask"))
		        end
	        end
        else
        	if data == "control" and get_assault_state_options("Enabled/enable_control_task") then
        		if not wavesurvived then
        			if not managers.hud._hud_assault_corner._point_of_no_return then
					    managers.hud._hud_assault_corner:_start_assault(get_control_lines())
						managers.hud._hud_assault_corner:_set_hostage_offseted(true)
						managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_controltask"))
					end
        		else
        			if managers.groupai:state():get_assault_number() > 0 and not managers.hud._hud_assault_corner._point_of_no_return and managers.hud._hud_assault_corner._assault_mode ~= "phalanx" then
			 			if WaveSurvived.options["WaveSurvived_custompanelcolor"] == 1 then
							managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, 32, 230, 32) / 255)
					 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor"] == 2 then
							managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, 255, 255, 0) / 255)
					 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor"] == 3 then
							managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, 255, 0, 0) / 255)
					 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor"] == 4 then
							managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, 0, 255, 255) / 255)
					 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor"] == 5 then
							managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, 255, 127, 80) / 255)
					 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor"] == 6 then
							managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_red"], WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_green"], WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_blue"]) / 255)
					 	else	
							managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, 32, 230, 32) / 255)
					 	end
					else
						managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_controltask"))
					end

	        		if managers.groupai:state():get_assault_number() == 0 then
				 		if not managers.hud._hud_assault_corner._assault and not managers.hud._hud_assault_corner._point_of_no_return then
				        	managers.hud._hud_assault_corner:_start_assault(get_control_lines())
							managers.hud._hud_assault_corner:_set_hostage_offseted(true)
				        end
					else
						if not managers.hud._hud_assault_corner._assault and not managers.hud._hud_assault_corner._point_of_no_return then
							managers.hud._hud_assault_corner:_start_assault(get_ws_control_lines())
							managers.hud._hud_assault_corner:_set_hostage_offseted(true)
						end
					end
				end

        	end

        	if data == "anticipation" and get_assault_state_options("Enabled/enable_anticipation_task") then
        		managers.hud._hud_assault_corner:_set_text_list(get_anticipation_lines())
				managers.hud._hud_assault_corner:_set_hostage_offseted(true)
		 		managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_anticipationtask"))
        	end

	        if data == "build" and get_assault_state_options("Enabled/enable_build_task") then
	        	managers.hud._hud_assault_corner:_set_text_list(get_build_lines())
		 		managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_buildtask"))
	        end

	        if data == "sustain" and get_assault_state_options("Enabled/enable_sustain_task") then
	        	managers.hud._hud_assault_corner:_set_text_list(get_sustain_lines())
		 		managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_sustaintask"))
	        end

	        if data == "fade" and get_assault_state_options("Enabled/enable_fade_task") then
	        	managers.hud._hud_assault_corner:_set_text_list(get_fade_lines())
		 		managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_fadetask"))
	        end
	    end

    end

end)

Hooks:PostHook( GroupAIStateBesiege, "_upd_recon_tasks", "assaultstates_recon_function", function(self)
	local Net = _G.LuaNetworking
 	local data_sender = false

 	if Net:IsHost() then
    	data_sender = true
	end

	local function get_assault_state_options(option)
 		if assaultstates and assaultstates.Options then
 			return assaultstates.Options:GetValue(option)
 		else
 			log("[AssaultStates] Something went wrong.. Couldn't load data")
 		end
 	end
 	
	local function get_control_lines()
		if managers.job:current_difficulty_stars() > 0 then
			local ids_risk = Idstring("risk")
			return {
				"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
				"hud_assault_end_line",
				ids_risk,
				"hud_assault_end_line",
				"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
				"hud_assault_end_line",
				ids_risk,
				"hud_assault_end_line"
			}
		else
			return {
				"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
				"hud_assault_end_line",
				"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
				"hud_assault_end_line",
				"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
				"hud_assault_end_line"
			}
		end
 	end

 	if not wavesurvived then
	 	if not managers.hud._hud_assault_corner._assault and get_assault_state_options("Enabled/enable_control_task") then
	 		if managers.hud._hud_assault_corner._assault_mode ~= "phalanx" and not self:get_hunt_mode() then
				managers.hud._hud_assault_corner:_start_assault(get_control_lines())
				managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_controltask"))
				managers.hud._hud_assault_corner:_set_hostage_offseted(true)

				if data_sender then
					Net:SendToPeers( "AssaultStates_Net", "control" )
				end
			end
		end

	else
		WaveSurvived = {}
		WaveSurvived.options = {}

		local function Load()
			local file = io.open( SavePath .. "/WaveSurvived_options.txt" , "r")
			if file then
				for k, v in pairs(json.decode(file:read("*all")) or {}) do
					if k then
						WaveSurvived.options[k] = v
					end
				end
				file:close()
			end
		end

		Load()

		local function get_ws_control_lines()
			if WaveSurvived.options["WaveSurvived_customtext"] then
				if managers.job:current_difficulty_stars() > 0 then
					local ids_risk = Idstring("risk")
					return {
						"WaveSurvived_customtext_" .. WaveSurvived.options["WaveSurvived_customtext"],
						"hud_assault_end_line",
						"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
						"hud_assault_end_line",
						ids_risk,
						"hud_assault_end_line",
						"WaveSurvived_customtext_" .. WaveSurvived.options["WaveSurvived_customtext"],
						"hud_assault_end_line",
						"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
						"hud_assault_end_line",
						ids_risk,
						"hud_assault_end_line"
					}
				else
					return {
						"WaveSurvived_customtext_" .. WaveSurvived.options["WaveSurvived_customtext"],
						"hud_assault_end_line",
						"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
						"hud_assault_end_line",
						"WaveSurvived_customtext_" .. WaveSurvived.options["WaveSurvived_customtext"],
						"hud_assault_end_line",
						"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
						"hud_assault_end_line"
					}
				end
			else
				if managers.job:current_difficulty_stars() > 0 then
					local ids_risk = Idstring("risk")
					return {
						"hud_assault_survived",
						"hud_assault_end_line",
						"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
						"hud_assault_end_line",
						ids_risk,
						"hud_assault_end_line",
						"hud_assault_survived",
						"hud_assault_end_line",
						"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
						"hud_assault_end_line",
						ids_risk,
						"hud_assault_end_line"
					}
				else
					return {
						"hud_assault_survived",
						"hud_assault_end_line",
						"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
						"hud_assault_end_line",
						"hud_assault_survived",
						"hud_assault_end_line",
						"ControlTask_textlist_" .. get_assault_state_options("Textlist/textlist_control_task"),
						"hud_assault_end_line"
					}
				end
			end
	 	end

	 	if get_assault_state_options("Enabled/enable_control_task") then
			if managers.hud._hud_assault_corner._assault_mode ~= "phalanx" and not self:get_hunt_mode() then
			 	if self:get_assault_number() > 0 then
		 			if WaveSurvived.options["WaveSurvived_custompanelcolor"] == 1 then
						managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, 32, 230, 32) / 255)
				 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor"] == 2 then
						managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, 255, 255, 0) / 255)
				 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor"] == 3 then
						managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, 255, 0, 0) / 255)
				 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor"] == 4 then
						managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, 0, 255, 255) / 255)
				 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor"] == 5 then
						managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, 255, 127, 80) / 255)
				 	elseif WaveSurvived.options["WaveSurvived_custompanelcolor"] == 6 then
						managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_red"], WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_green"], WaveSurvived.options["WaveSurvived_custompanelcolor_customslider_blue"]) / 255)
				 	else	
						managers.hud._hud_assault_corner:_update_assault_hud_color(Color(255, 32, 230, 32) / 255)
				 	end
				else
					managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_controltask"))
				end
			end

		 	if self:get_assault_number() == 0 then
		 		if not managers.hud._hud_assault_corner._assault and get_assault_state_options("Enabled/enable_control_task") and not managers.groupai:state():get_hunt_mode() and not managers.hud._hud_assault_corner._point_of_no_return then
		        	managers.hud._hud_assault_corner:_start_assault(get_control_lines())
					managers.hud._hud_assault_corner:_set_hostage_offseted(true)
					if data_sender then
						Net:SendToPeers( "AssaultStates_Net", "control" )
					end
		        end
			else
				if not managers.hud._hud_assault_corner._assault and not managers.hud._hud_assault_corner._point_of_no_return then
					managers.hud._hud_assault_corner:_start_assault(get_ws_control_lines())
					managers.hud._hud_assault_corner:_set_hostage_offseted(true)

					if data_sender then
						Net:SendToPeers( "AssaultStates_Net", "control" )
					end
				end
			end
		end
	end
end)

Hooks:PostHook( GroupAIStateBesiege, "_upd_assault_task", "assaultstates_function", function(self)
 	
 	local Net = _G.LuaNetworking
 	local data_sender = false

 	if Net:IsHost() then
    	data_sender = true
	end

 	local function get_assault_state_options(option)
 		if assaultstates and assaultstates.Options then
 			return assaultstates.Options:GetValue(option)
 		else
 			log("[AssaultStates] Something went wrong.. Couldn't load data")
 		end
 	end

 	local function get_anticipation_lines()
		if managers.job:current_difficulty_stars() > 0 then
			local ids_risk = Idstring("risk")
			return {
				"AnticipationTask_textlist_" .. get_assault_state_options("Textlist/textlist_anticipation_task"),
				"hud_assault_end_line",
				ids_risk,
				"hud_assault_end_line",
				"AnticipationTask_textlist_" .. get_assault_state_options("Textlist/textlist_anticipation_task"),
				"hud_assault_end_line",
				ids_risk,
				"hud_assault_end_line"
			}
		else
			return {
				"AnticipationTask_textlist_" .. get_assault_state_options("Textlist/textlist_anticipation_task"),
				"hud_assault_end_line",
				"AnticipationTask_textlist_" .. get_assault_state_options("Textlist/textlist_anticipation_task"),
				"hud_assault_end_line",
				"AnticipationTask_textlist_" .. get_assault_state_options("Textlist/textlist_anticipation_task"),
				"hud_assault_end_line"
			}
		end
 	end

 	local function get_build_lines()
 		if managers.hud._hud_assault_corner._assault_mode == "normal" then
			if managers.job:current_difficulty_stars() > 0 then
				local ids_risk = Idstring("risk")
				return {
					"hud_assault_assault",
					"hud_assault_end_line",
					"BuildTask_textlist_" .. get_assault_state_options("Textlist/textlist_build_task"),
					"hud_assault_end_line",
					ids_risk,
					"hud_assault_end_line",
					"hud_assault_assault",
					"hud_assault_end_line",
					"BuildTask_textlist_" .. get_assault_state_options("Textlist/textlist_build_task"),
					"hud_assault_end_line",
					ids_risk,
					"hud_assault_end_line"
				}
			else
				return {
					"hud_assault_assault",
					"hud_assault_end_line",
					"BuildTask_textlist_" .. get_assault_state_options("Textlist/textlist_build_task"),
					"hud_assault_end_line",
					"hud_assault_assault",
					"hud_assault_end_line",
					"BuildTask_textlist_" .. get_assault_state_options("Textlist/textlist_build_task"),
					"hud_assault_end_line"
				}
			end
		end
 	end

 	local function get_sustain_lines()
 		if managers.hud._hud_assault_corner._assault_mode == "normal" then
			if managers.job:current_difficulty_stars() > 0 then
				local ids_risk = Idstring("risk")
				return {
					"hud_assault_assault",
					"hud_assault_end_line",
					"SustainTask_textlist_" .. get_assault_state_options("Textlist/textlist_sustain_task"),
					"hud_assault_end_line",
					ids_risk,
					"hud_assault_end_line",
					"hud_assault_assault",
					"hud_assault_end_line",
					"SustainTask_textlist_" .. get_assault_state_options("Textlist/textlist_sustain_task"),
					"hud_assault_end_line",
					ids_risk,
					"hud_assault_end_line"
				}
			else
				return {
					"hud_assault_assault",
					"hud_assault_end_line",
					"SustainTask_textlist_" .. get_assault_state_options("Textlist/textlist_sustain_task"),
					"hud_assault_end_line",
					"hud_assault_assault",
					"hud_assault_end_line",
					"SustainTask_textlist_" .. get_assault_state_options("Textlist/textlist_sustain_task"),
					"hud_assault_end_line"
				}
			end
		end
 	end

 	local function get_fade_lines()
 		if managers.hud._hud_assault_corner._assault_mode == "normal" then
			if managers.job:current_difficulty_stars() > 0 then
				local ids_risk = Idstring("risk")
				return {
					"hud_assault_assault",
					"hud_assault_end_line",
					"FadeTask_textlist_" .. get_assault_state_options("Textlist/textlist_fade_task"),
					"hud_assault_end_line",
					ids_risk,
					"hud_assault_end_line",
					"hud_assault_assault",
					"hud_assault_end_line",
					"FadeTask_textlist_" .. get_assault_state_options("Textlist/textlist_fade_task"),
					"hud_assault_end_line",
					ids_risk,
					"hud_assault_end_line"
				}
			else
				return {
					"hud_assault_assault",
					"hud_assault_end_line",
					"FadeTask_textlist_" .. get_assault_state_options("Textlist/textlist_fade_task"),
					"hud_assault_end_line",
					"hud_assault_assault",
					"hud_assault_end_line",
					"FadeTask_textlist_" .. get_assault_state_options("Textlist/textlist_fade_task"),
					"hud_assault_end_line"
				}
			end
		end
 	end

 	local task_data = self._task_data.assault

	if pdth_hud and pdth_hud.Options then
		if pdth_hud.Options:GetValue("HUD/Assault") then

			local assault_panel = managers.hud._hud_assault_corner._hud_panel:child("assault_panel")
			local control_assault_title = assault_panel:child("control_assault_title")
			local icon_assaultbox = assault_panel:child("icon_assaultbox")
			
			if task_data.phase == "build" and get_assault_state_options("Enabled/enable_build_task") and not managers.groupai:state():get_hunt_mode() then
		 		if managers.hud._hud_assault_corner._assault_mode ~= "phalanx" then
			 		icon_assaultbox:set_color(get_assault_state_options("Color/color_buildtask"))
		    		control_assault_title:set_color(get_assault_state_options("Color/color_buildtask"))
		    		local const = pdth_hud.constants
					control_assault_title:set_font_size(const.assault_font_size - 1)
		    		control_assault_title:set_text("BUILDING")

		    		if data_sender then
		 				Net:SendToPeers( "AssaultStates_Net", "build" )
		 			end
		 		else
		 			icon_assaultbox:set_color(Color(1, 1, 1, 0))
		    		control_assault_title:set_color(Color(1, 1, 1, 0))
		 			control_assault_title:set_text("CAPTAIN")
		 		end
	 		end

	 		if task_data.phase == "sustain" and get_assault_state_options("Enabled/enable_sustain_task") and not managers.groupai:state():get_hunt_mode() then
		 		if managers.hud._hud_assault_corner._assault_mode ~= "phalanx" then
		 			icon_assaultbox:set_color(get_assault_state_options("Color/color_sustaintask"))
		    		control_assault_title:set_color(get_assault_state_options("Color/color_sustaintask"))
		    		local const = pdth_hud.constants
					control_assault_title:set_font_size(const.assault_font_size + 1)
		    		control_assault_title:set_text("SUSTAIN")

		    		if data_sender then
		 				Net:SendToPeers( "AssaultStates_Net", "sustain" )
		 			end
		 		else
		 			icon_assaultbox:set_color(Color(1, 1, 1, 0))
		    		control_assault_title:set_color(Color(1, 1, 1, 0))
		 			control_assault_title:set_text("CAPTAIN")
		 		end
	 		end

	 		if task_data.phase == "fade" and get_assault_state_options("Enabled/enable_fade_task") and not managers.groupai:state():get_hunt_mode() then
		 		if managers.hud._hud_assault_corner._assault_mode ~= "phalanx" then
		 			icon_assaultbox:set_color(get_assault_state_options("Color/color_fadetask"))
		    		control_assault_title:set_color(get_assault_state_options("Color/color_fadetask"))
		    		local const = pdth_hud.constants
					control_assault_title:set_font_size(const.assault_font_size + 4)
		    		control_assault_title:set_text("FADING")

		    		if data_sender then
		 				Net:SendToPeers( "AssaultStates_Net", "fade" )
		 			end
		 		else
		 			icon_assaultbox:set_color(Color(1, 1, 1, 0))
		    		control_assault_title:set_color(Color(1, 1, 1, 0))
		 			control_assault_title:set_text("CAPTAIN")
		 		end
	 		end
		else
			if task_data.phase == "anticipation" and get_assault_state_options("Enabled/enable_anticipation_task") and not managers.groupai:state():get_hunt_mode() then
			 	if managers.hud._hud_assault_corner._assault_mode ~= "phalanx" then
			 		if not managers.hud._hud_assault_corner._assault then
			 			managers.hud._hud_assault_corner:_start_assault(get_anticipation_lines())
						managers.hud._hud_assault_corner:_set_hostage_offseted(true)
			 		end

			 		managers.hud._hud_assault_corner:_set_text_list(get_anticipation_lines())
			 		managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_anticipationtask"))
			 	
			 		if data_sender then
		 				Net:SendToPeers( "AssaultStates_Net", "anticipation" )
		 			end
		 		end
		 	end

			if task_data.phase == "build" and get_assault_state_options("Enabled/enable_build_task") and not managers.groupai:state():get_hunt_mode() then
			 	if managers.hud._hud_assault_corner._assault_mode ~= "phalanx" then
			 		managers.hud._hud_assault_corner:_set_text_list(get_build_lines())
			 		managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_buildtask"))
			 	
			 		if data_sender then
		 				Net:SendToPeers( "AssaultStates_Net", "build" )
		 			end
		 		end
		 	end

		 	if task_data.phase == "sustain" and get_assault_state_options("Enabled/enable_sustain_task") and not managers.groupai:state():get_hunt_mode() then
			 	if managers.hud._hud_assault_corner._assault_mode ~= "phalanx" then
			 		managers.hud._hud_assault_corner:_set_text_list(get_sustain_lines())
			 		managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_sustaintask"))
			 	
			 		if data_sender then
		 				Net:SendToPeers( "AssaultStates_Net", "sustain" )
		 			end
		 		end
		 	end

		 	if task_data.phase == "fade" and get_assault_state_options("Enabled/enable_fade_task") and not managers.groupai:state():get_hunt_mode() then
			 	if managers.hud._hud_assault_corner._assault_mode ~= "phalanx" then
			 		managers.hud._hud_assault_corner:_set_text_list(get_fade_lines())
			 		managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_fadetask"))
			 	
			 		if data_sender then
		 				Net:SendToPeers( "AssaultStates_Net", "fade" )
		 			end
		 		end
		 	end
		end
	else
		if task_data.phase == "anticipation" and get_assault_state_options("Enabled/enable_anticipation_task") and not managers.groupai:state():get_hunt_mode() then
		 	if managers.hud._hud_assault_corner._assault_mode ~= "phalanx" then
		 		if not managers.hud._hud_assault_corner._assault then
		 			managers.hud._hud_assault_corner:_start_assault(get_anticipation_lines())
					managers.hud._hud_assault_corner:_set_hostage_offseted(true)
		 		end
			 	
			 	managers.hud._hud_assault_corner:_set_text_list(get_anticipation_lines())
		 		managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_anticipationtask"))
		 	
		 		if data_sender then
	 				Net:SendToPeers( "AssaultStates_Net", "anticipation" )
	 			end
	 		end
	 	end

		if task_data.phase == "build" and get_assault_state_options("Enabled/enable_build_task") and not managers.groupai:state():get_hunt_mode() then
	 		managers.hud._hud_assault_corner:_set_text_list(get_build_lines())
	 		managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_buildtask"))

	 		if data_sender then
	 			Net:SendToPeers( "AssaultStates_Net", "build" )
	 		end
	 	end

	 	if task_data.phase == "sustain" and get_assault_state_options("Enabled/enable_sustain_task") and not managers.groupai:state():get_hunt_mode() then
	 		managers.hud._hud_assault_corner:_set_text_list(get_sustain_lines())
	 		managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_sustaintask"))

	 		if data_sender then
	 			Net:SendToPeers( "AssaultStates_Net", "sustain" )
	 		end
	 	end

	 	if task_data.phase == "fade" and get_assault_state_options("Enabled/enable_fade_task") and not managers.groupai:state():get_hunt_mode() then
	 		managers.hud._hud_assault_corner:_set_text_list(get_fade_lines())
	 		managers.hud._hud_assault_corner:_update_assault_hud_color(get_assault_state_options("Color/color_fadetask"))

	 		if data_sender then
	 			Net:SendToPeers( "AssaultStates_Net", "fade" )
	 		end
	 	end
	end
end )
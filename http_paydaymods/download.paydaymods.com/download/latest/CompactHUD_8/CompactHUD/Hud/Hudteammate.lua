CloneClass(HUDTeammate)
function HUDTeammate:init(...) 
	self.orig.init(self, ...)
	local radial_health_panel = self._panel:child("player"):child("radial_health_panel")
	local weapons_panel = self._player_panel:child("weapons_panel")
	local primary_weapon_panel = weapons_panel:child("primary_weapon_panel")
	local secondary_weapon_panel = weapons_panel:child("secondary_weapon_panel")
	local ammo_clip = primary_weapon_panel:child("ammo_clip")
	local ammo_total = primary_weapon_panel:child("ammo_total")
	local primary_bg = primary_weapon_panel:child("bg")
	local ammo_clip_sec = secondary_weapon_panel:child("ammo_clip")
	local ammo_total_sec = secondary_weapon_panel:child("ammo_total")
	local secondary_bg = secondary_weapon_panel:child("bg")
	local grenades_panel = self._player_panel:child("grenades_panel")
	local cable_ties_panel = self._player_panel:child("cable_ties_panel")
	local deployable_equipment_panel = self._player_panel:child("deployable_equipment_panel")
	local name = self._panel:child("name")
	local name_bg = self._panel:child("name_bg")
	local grenades = grenades_panel:child("grenades")
	local cable_ties = cable_ties_panel:child("cable_ties")
	local equipment = deployable_equipment_panel:child("equipment")
	self._downs = managers.player:has_category_upgrade("player", "additional_lives") and 4 or 3
	if self._main_player then
		local bg = self._player_panel:rect({
		    name = "bg",
		    layer = 0
		})  
		local hp_text = self._player_panel:text({
		    name = "hp_text",
		    layer = 3,
		    font_size = text_size,
		    font = "fonts/font_large_mf"
		})      
		local ap_text = self._player_panel:text({
		    name = "ap_text",
		    layer = 3,
		    font_size = text_size,
		    font = "fonts/font_large_mf"
		})   
		local armor_line = self._player_panel:rect({
		    name = "armor_line",
		    align = "center",
		    layer = 1
		})		
		local rip_line = self._player_panel:rect({
		    name = "rip_line",
		    align = "center",
		    visible = false,		    
		    layer = 1,
		    w = 2,
		    h = 48,
		})		
		local info_line = self._player_panel:rect({
		    name = "info_line",
		    align = "center",
		    layer = 1,
		    visible = false,
		    w = 2,
		    h = 48,
		})
		for i=1,2 do
			local is_secondary = i==1
			local wep_panel = self._player_panel:panel({
				name = (is_secondary and "secondary" or "primary") .."_panel",
				layer = 3,
			})			
		    local current_clip = wep_panel:text({
		        name = "current_clip",
		        layer = 3,
		        align = "right",
		        font_size = ammo_text_size,
		        font = "fonts/font_large_mf"
		    })     
		    local split_ammo = wep_panel:text({
		        name = "split_ammo",
		        text = "/",
		        align = "center",
		        layer = 3,
		        font = "fonts/font_large_mf"
		    }) 
		    local total_ammo = wep_panel:text({
		        name = "total_ammo",
		        text = "999 ",
		        layer = 3,
		        font_size = ammo_text_size,
		        font = "fonts/font_large_mf"
		    })
		end
	    weapons_panel:hide()  
		radial_health_panel:set_alpha(0)
		radial_health_panel:hide()  
		name:hide()  
		name_bg:hide()  
		self._panel:child("callsign"):hide()  
		self._panel:child("callsign_bg"):hide()  
		grenades_panel:child("bg"):set_alpha(0)
		cable_ties_panel:child("bg"):set_alpha(0)
		deployable_equipment_panel:child("bg"):set_alpha(0)
		if self._kill_counter then --Fixes killcounter for hoxhud.
			self._panel:child("kill_icon"):set_x(radial_health_panel:right() - 6)
			self._panel:child("kill_icon"):set_layer(1)
			self._kill_counter:set_left(self._panel:child("kill_icon"):right())
			self._kill_counter_bg:set_image("units/white_df")
			self._kill_counter_bg:set_color(CompactHUD.bg_color:with_alpha(CompactHUD.bg_alpha))
			local _,_,w,_ = self._kill_counter:text_rect()
			self._kill_counter_bg:set_w(self._panel:child("kill_icon"):w() + w + 5)
			self._kill_counter_bg:set_x(radial_health_panel:right() - 6)
			self._kill_counter_bg:set_y(self._panel:child("kill_icon"):y())
			self._armor_regen:set_x(self._panel:child("kill_icon"):x())
			self._armor_regen:move(0, 2)
			self._armor_regen:set_font_size(12) 
			for _, textbg in ipairs(self._armor_regen_bg) do
				textbg:set_alpha(0)
			end
		end
		if self._player_panel:child("stamina_panel") and self._kill_counter_bg then
			self._stamina_line = self._player_panel:bitmap({
				name = "stamina_line",
				blend_mode = "normal",
				alpha = 0.8,
				w = self._kill_counter_bg:w(),
				h = 2,
				color = CompactHUD.line_color,
				x = radial_health_panel:right() - 6,
				y = self._kill_counter_bg:bottom(),
				vertical = "bottom",
				align = "center",
				layer = 1
			})
			self._player_panel:child("stamina_panel"):set_visible(false)
		end
		if self._kills_panel then -- Kill Counter Standalone
			self._kill_icon:set_blend_mode("normal")
			self.kill_counter_bg = self._kills_panel:rect({
				color = CompactHUD.bg_color:with_alpha(CompactHUD.bg_alpha),
				blend_mode = "normal",
				layer = -1
			})
			local _,_,w,_ = self._kills_text:text_rect()
			self.kill_counter_bg:set_w(self._kill_icon:w() + w + 5)
			self.kill_counter_bg:set_position(self._kill_icon:x(),self._kill_icon:y())
		end
	else
		local hp_text = self._player_panel:text({
			name = "hp_text",
			text = "| 100HP ",
			layer = 3,
			vertical = "bottom",
			align = "left",
			font_size = tweak_data.hud_players.name_size,
			font = tweak_data.hud_players.name_font
		})
		local line = self._panel:rect({
			name = "line",
			layer = 1,
			color = self._panel:child("callsign"):color(),
			w = 2,
		})		
		if self._kill_counter then 
			self._kill_counter_bg:set_alpha(0)
			self._kill_counter:set_alpha(0)
			self._panel:child("kill_icon"):set_alpha(0)
			self._interact_info_panel:set_alpha(0)
		end
		if self._kills_panel then
			self._kills_panel:set_alpha(0)
		end
		deployable_equipment_panel:set_alpha(0)
		name_bg:set_image("units/white_df")
		name_bg:set_color(CompactHUD.bg_color:with_alpha(CompactHUD.bg_alpha))
		cable_ties_panel:set_alpha(0)
		grenades_panel:set_alpha(0)

		self._panel:child("callsign"):hide()
		self._panel:child("callsign_bg"):hide()
		radial_health_panel:hide()
		weapons_panel:hide()	
		weapons_panel:set_alpha(0)
	end
	self:UpdateSettings()		
	self:recreate_weapon_firemode()	
	self._player_panel:child("carry_panel"):set_alpha(0)
end
function HUDTeammate:_create_primary_weapon_firemode()
	if alive(self._player_panel:child("primary_panel")) then
		local primary_weapon_panel = self._player_panel:child("primary_panel")
		local ammo_total = primary_weapon_panel:child("ammo_total")

		local old_line1 = primary_weapon_panel:child("line1")
		local old_line2 = primary_weapon_panel:child("line2")
		if alive(old_line1) then
			primary_weapon_panel:remove(old_line1)
		end
		if alive(old_line2) then
			primary_weapon_panel:remove(old_line2)
		end	
		if self._main_player then
			local equipped_primary = managers.blackmarket:equipped_primary()
			local weapon_tweak_data = tweak_data.weapon[equipped_primary.weapon_id]
			local fire_mode = weapon_tweak_data.FIRE_MODE
			local can_toggle_firemode = weapon_tweak_data.CAN_TOGGLE_FIREMODE
			local locked_to_auto = managers.weapon_factory:has_perk("fire_mode_auto", equipped_primary.factory_id, equipped_primary.blueprint)
			local locked_to_single = managers.weapon_factory:has_perk("fire_mode_single", equipped_primary.factory_id, equipped_primary.blueprint)
			local line1 = primary_weapon_panel:bitmap({
				name = "line1",
				color = CompactHUD.text_color,				
				w = 6 * CompactHUD.scale,
				h = 1.2 * CompactHUD.scale,
				x = 0,
				layer = 1
			})
			line1:set_lefttop(primary_weapon_panel:child("total_ammo"):left() + (6 * CompactHUD.scale), primary_weapon_panel:child("total_ammo"):bottom() - (2 * CompactHUD.scale))
			local line2 = primary_weapon_panel:bitmap({
				name = "line2",
				color = CompactHUD.text_color,				
				w = 12 * CompactHUD.scale,
				h = 1.2 * CompactHUD.scale,
				x = 6,
				layer = 1
			})
			line2:set_lefttop(primary_weapon_panel:child("total_ammo"):left() + (12 * CompactHUD.scale), primary_weapon_panel:child("total_ammo"):bottom() - (2 * CompactHUD.scale)) 
			line2:set_alpha(0.5)
			if locked_to_single or not locked_to_auto and fire_mode == "single" then
			else
				line2:set_alpha(1)
			end
		end
	end
end
function HUDTeammate:_create_secondary_weapon_firemode()
	if alive(self._player_panel:child("secondary_panel")) then
		local secondary_weapon_panel = self._player_panel:child("secondary_panel")
		local ammo_total = secondary_weapon_panel:child("total_ammo")
		local old_line1 = secondary_weapon_panel:child("line1")
		local old_line2 = secondary_weapon_panel:child("line2")

		if alive(old_line1) then
			secondary_weapon_panel:remove(old_line1)
		end
		if alive(old_line2) then
			secondary_weapon_panel:remove(old_line2)
		end	
		if self._main_player then
			local equipped_secondary = managers.blackmarket:equipped_secondary()
			local weapon_tweak_data = tweak_data.weapon[equipped_secondary.weapon_id]
			local fire_mode = weapon_tweak_data.FIRE_MODE
			local can_toggle_firemode = weapon_tweak_data.CAN_TOGGLE_FIREMODE
			local locked_to_auto = managers.weapon_factory:has_perk("fire_mode_auto", equipped_secondary.factory_id, equipped_secondary.blueprint)
			local locked_to_single = managers.weapon_factory:has_perk("fire_mode_single", equipped_secondary.factory_id, equipped_secondary.blueprint)
			local line1 = secondary_weapon_panel:bitmap({
				name = "line1",
				color = CompactHUD.text_color,
				w = 6 * CompactHUD.scale,
				h = 1.2 * CompactHUD.scale,
				x = 0,
				layer = 1
			})
			line1:set_lefttop(secondary_weapon_panel:child("total_ammo"):left() + (6 * CompactHUD.scale), secondary_weapon_panel:child("total_ammo"):bottom() - (2 * CompactHUD.scale))
			local line2 = secondary_weapon_panel:bitmap({
				name = "line2",
				color = CompactHUD.text_color,				
				w = 12 * CompactHUD.scale,
				h = 1.2 * CompactHUD.scale,
				x = 6,
				layer = 1
			})
			line2:set_lefttop(secondary_weapon_panel:child("total_ammo"):left() + (12 * CompactHUD.scale), secondary_weapon_panel:child("total_ammo"):bottom() - (2 * CompactHUD.scale))
			line2:set_alpha(0.5)
			if locked_to_single or not locked_to_auto and fire_mode == "single" then
			else
				line2:set_alpha(1)
			end
		end
	end
end
function HUDTeammate:set_weapon_firemode(id, firemode)
	local is_secondary = id == 1
	local panel = is_secondary and self._player_panel:child("secondary_panel") or self._player_panel:child("primary_panel")
	if alive(panel) then
		local line2 = panel:child("line2")	
	if alive(line2) then
			if firemode == "single" then
				line2:set_alpha(0.5)
			else
				line2:set_alpha(1)
			end
		end
	end
end 
function HUDTeammate:UpdateSettings()
 	local name = self._panel:child("name")
 	local name_bg = self._panel:child("name_bg")
 	local line = self._panel:child("line")
 	local bg = self._player_panel:child("bg")
 	local hp_text = self._player_panel:child("hp_text")
 	local ap_text = self._player_panel:child("ap_text")
 	local armor_line = self._player_panel:child("armor_line")
 	local rip_line = self._player_panel:child("rip_line")
 	local info_line = self._player_panel:child("info_line")
	local grenades_panel = self._player_panel:child("grenades_panel")
	local cable_ties_panel = self._player_panel:child("cable_ties_panel")
	local deployable_equipment_panel = self._player_panel:child("deployable_equipment_panel")
	local grenades = grenades_panel:child("grenades")
	local cable_ties = cable_ties_panel:child("cable_ties")
	local equipment = deployable_equipment_panel:child("equipment")
 
	local size = CompactHUD.scale
	local width = 148 * size
	local text_size = 16 * size
	local ammo_text_size = 28 * size	

 	name_bg:set_alpha(CompactHUD.bg_alpha)
	if self._main_player then	
		local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2) 

		self._panel:set_h( 120 * size )
		self._player_panel:set_h( 120 * size )
		self._panel:set_world_bottom(hud.panel:bottom())

		self._player_panel:child("armor_line"):set_color(CompactHUD.line_color)
		bg:configure({
		    w = width,
		    h = 64 * size,
		    color = CompactHUD.bg_color,
		    alpha = CompactHUD.bg_alpha,
		})  
		bg:set_rightbottom(self._player_panel:right(), self._player_panel:bottom())		
		local _,_,_,h = hp_text:text_rect()
		hp_text:configure({
		    h = h,
		    x = (8 * size) + bg:left(),
		    color = CompactHUD.text_color,	    
		    font_size = text_size,
		})      
		ap_text:configure({
		    h = h,
		    x = (8 * size) + bg:left(),
		    color = CompactHUD.text_color,	    
		    font_size = text_size,
		})   
		armor_line:configure({
		    w = width,
		    h = 3 * size,
		    x = bg:x(),
		    color = CompactHUD.line_color,
		})		
		rip_line:configure({
		    w = 2 * size,
		    h = 48 * size,
		    x = bg:x(),
		    color = CompactHUD.line_color,
		})		
		info_line:configure({
		    w = 2 * size,
		    h = 48 * size,
		    x = bg:x(),
		    color = CompactHUD.line_color,
		})
		armor_line:set_bottom(bg:bottom())  
		rip_line:set_top(bg:top())  
		info_line:set_top(bg:top())   
		hp_text:set_bottom(armor_line:top())
		ap_text:set_bottom(hp_text:top())
		
		for i=1,2 do
			local is_secondary = i==1
			local wep_panel = self._player_panel:child((is_secondary and "secondary" or "primary") .."_panel")
			local current_clip = wep_panel:child("current_clip")
			local split_ammo = wep_panel:child("split_ammo")
			local total_ammo = wep_panel:child("total_ammo")
			wep_panel:configure({
				h = ammo_text_size,
			})	
			local old_text = current_clip:text()		
		    current_clip:configure({
		    	color = CompactHUD.text_color,
		        font_size = ammo_text_size,
		        text = "999 ",
		    })     
		    managers.hud:make_fine_text(current_clip)
		    current_clip:set_text(old_text)
		    split_ammo:configure({
				color = CompactHUD.text_color,
		        font_size = ammo_text_size,
		    }) 
		    managers.hud:make_fine_text(split_ammo)
		    split_ammo:set_left(current_clip:right() + 4) 

		    local old_text = total_ammo:text()		
		    total_ammo:configure({
		    	color = CompactHUD.text_color,	    	
		        font_size = 24 * CompactHUD.scale,
		        text = "999 ",	        
		    })
		    managers.hud:make_fine_text(total_ammo)
		    total_ammo:set_left(split_ammo:right() + 4) 
		    total_ammo:set_text(old_text)

		    wep_panel:set_w(total_ammo:w() + split_ammo:w() + current_clip:w() + 8)
		    wep_panel:set_rightbottom(bg:right() -4, armor_line:top())
		end
		self:recreate_weapon_firemode()

		local eq_h = 64 / (PlayerBase.USE_GRENADES and 3 or 2)
		local eq_w = 48
	    local padding = 6 * size

	    grenades_panel:set_size(eq_w * size, eq_h * size)
	    grenades:set_size(eq_h * size, eq_h * size)
	    grenades:set_center_y(grenades_panel:h() / 2.2)
	    grenades:set_color(CompactHUD.text_color)
	    grenades:set_x((10 * size))
	    local amount = grenades_panel:child("amount") 
	    amount:set_font_size(22 * size)
	    amount:set_h(22 * size)	    
	    amount:set_center_y(grenades:center_y())
	    amount:set_right(grenades_panel:w())
	    amount:set_color(CompactHUD.text_color)
	    grenades_panel:set_righttop(bg:right() - (10 * size), bg:top() + padding)

	    cable_ties_panel:set_size(eq_w * size, eq_h * size)
	    cable_ties:set_size(eq_h * size, eq_h * size)
	    cable_ties:set_x((10 * size))
	    cable_ties:set_color(CompactHUD.text_color)
	    cable_ties:set_center_y(cable_ties_panel:h() / 2.2)
	    local amount = cable_ties_panel:child("amount")
	    amount:set_font_size(22 * size)
	    amount:set_h(22 * size)	    
	    amount:set_center_y(cable_ties:center_y())
	    amount:set_color(CompactHUD.text_color)
	    amount:set_right(cable_ties_panel:w())
	    cable_ties_panel:set_righttop(grenades_panel:left(), bg:top() + padding)

	    deployable_equipment_panel:set_size(eq_w * size, eq_h * size)
	    equipment:set_size(eq_h * size, eq_h * size)
	    equipment:set_x((10 * size))
	    equipment:set_color(CompactHUD.text_color)
	    equipment:set_center_y(deployable_equipment_panel:h() / 2.2)
	    local amount = deployable_equipment_panel:child("amount")
	    amount:set_font_size(22 * size)
	    amount:set_h(22 * size)
	    amount:set_color(CompactHUD.text_color)
	    amount:set_center_y(equipment:center_y())
	    amount:set_right(deployable_equipment_panel:w())
	    deployable_equipment_panel:set_righttop(cable_ties_panel:left(), bg:top() + padding)

	 	if self._kill_counter then
	 		self._kill_counter_bg:set_color(CompactHUD.bg_color:with_alpha(CompactHUD.bg_alpha))
	 	end
	 	if self.kill_counter_bg then
	 		self.kill_counter_bg:set_color(CompactHUD.bg_color:with_alpha(CompactHUD.bg_alpha))
	 	end
	else 	
		local name_size = 20 * size		
		self._panel:set_h( name_size )
		self._player_panel:set_h( name_size )	
		local old_text = hp_text:text()			
		hp_text:configure({
			text = old_text:len() > 9 and "| Downed 99s " or "| 100HP  ",
			color = CompactHUD.text_color,
		    font_size = name_size,
		})  
		managers.hud:make_fine_text(hp_text)
		hp_text:set_text(old_text)		
		name:configure({
			y = 0,
			color = CompactHUD.text_color,
		    font_size = name_size,
		}) 			
		name_bg:configure({
			color = CompactHUD.bg_color,
		    alpha = CompactHUD.bg_alpha,
		}) 	
		managers.hud:make_fine_text(name)

		name_bg:set_size(2 + name:w() + (self._player_panel:visible() and hp_text:w() + 5 or 0), name:h())
		line:set_h(name:h())	
		name:set_left(self._panel:left())

		name_bg:set_position(name:position())
		name_bg:set_color(CompactHUD.bg_color)
		line:set_w(2 * size)
		line:set_position(name:position())
		hp_text:set_leftbottom(name:right() + 5, name:bottom())
		managers.hud:align_panels()
	end
	self:layout_special_equipments()	
end
function HUDTeammate:set_stamina_value(current)
	if self._stamina then
		Value = current / self._max_stamina
		self._stamina_line:set_color(Color(0, 0.4, 1) * (math.round(Value * 100) / 100) + Color.red * (1 - math.round(Value * 100) / 100))
		self._stamina_line:set_w(Value * self._kill_counter_bg:w())
	end
end
function HUDTeammate:_update_kill_count_text() -- Kill Counter Standalone
	self.orig._update_kill_count_text(self)
	if self.kill_counter_bg then
		local _,_,w,_ = self._kills_text:text_rect()
		self.kill_counter_bg:set_w(self._kill_icon:w() + w + 5)
		self.kill_counter_bg:set_position(self._kill_icon:x(),self._kill_icon:y()) 	
	end
end
function HUDTeammate:check_and_truncate_name(_ARG_1_, ...)
	self.orig.check_and_truncate_name(self, _ARG_1_, ...)
	_,_,w,_ = self._kill_counter:text_rect()
	self._kill_counter_bg:set_w(self._panel:child("kill_icon"):w() + w + 5)
	self._kill_counter_bg:set_x(self._panel:child("player"):child("radial_health_panel"):right() - 6)	
end

function HUDTeammate:set_deployable_equipment(data)
	local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)
	local deployable_equipment_panel = self._player_panel:child("deployable_equipment_panel")
	local equipment = deployable_equipment_panel:child("equipment")
	equipment:set_visible(true)
	if not self._main_player then
		self:add_special_equipment({
			id = "deployable_equipment",
			amount = tonumber(deployable_equipment_panel:child("amount"):text()), 
			icon = data.icon,
		})
	end
	equipment:set_image(icon, unpack(texture_rect))
	self:set_deployable_equipment_amount(1, data)
end
function HUDTeammate:set_cable_tie(data)
	local teammate_panel = self._panel:child("player")
	local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)
	local cable_ties_panel = self._player_panel:child("cable_ties_panel")
	local cable_ties2 = cable_ties_panel:child("cable_ties")
	if not self._main_player and CompactHUD.tm_cableties then
		if not self._panel:child("cable_ties") then
			self:add_special_equipment({
				id = "cable_ties",
				amount = tonumber(cable_ties_panel:child("amount"):text()), 
				icon = data.icon,
			})
		end
	end
	cable_ties2:set_image(icon, unpack(texture_rect))
	cable_ties2:set_visible(true)
	self:set_cable_ties_amount(data.amount)
	return nil
end
function HUDTeammate:set_grenades(data)
	if not PlayerBase.USE_GRENADES then
		return
	end
	local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)
	local grenades_panel = self._player_panel:child("grenades_panel")
	local grenades = grenades_panel:child("grenades")
	if not self._main_player and CompactHUD.tm_nades then
		self:add_special_equipment({
			id = "grenades",
			amount = tonumber(grenades_panel:child("amount"):text()), 
			icon = data.icon,
		})
	end
	grenades:set_visible(true)
	grenades:set_image(icon, unpack(texture_rect))
	self:set_grenades_amount(data)
end

function HUDTeammate:set_name(teammate_name)
	self._panel:child("name"):set_text(" " .. teammate_name)
	self:UpdateSettings()
end
function HUDTeammate:set_callsign(id)
	if not self._main_player then
		local teammate_panel = self._panel
		local callsign = teammate_panel:child("line")
	 	callsign:set_color(tweak_data.chat_colors[id]:with_alpha(1))
	 end
end

function HUDTeammate:set_deployable_equipment_amount(index, data)
	local teammate_panel = self._panel:child("player")
	local deployable_equipment_panel = self._player_panel:child("deployable_equipment_panel")
	local amount = deployable_equipment_panel:child("amount")
	deployable_equipment_panel:child("equipment"):set_visible(true)
	self:_set_amount_string(amount, data.amount)

	amount:set_visible(true)
	if not self._main_player then
		self:set_special_equipment_amount("deployable_equipment", data.amount)
		if data.amount == 0 then
			self:remove_special_equipment("deployable_equipment")
		end
	end
end
function HUDTeammate:set_cable_ties_amount(amount)
	local cable_ties_panel = self._player_panel:child("cable_ties_panel")
	local cable_ties_amount = cable_ties_panel:child("amount")
	cable_ties_amount:set_visible(true)
	if amount == -1 then
		cable_ties_amount:set_text("--")
	else
		self:_set_amount_string(cable_ties_amount, amount)
	end
	if not self._main_player and CompactHUD.tm_cableties then
		self:set_special_equipment_amount("cable_ties", amount)
		if amount == 0 then
			self:remove_special_equipment("cable_ties")
		end
	end
	local cable_ties = cable_ties_panel:child("cable_ties")
	cable_ties:set_visible(true)
end
function HUDTeammate:set_grenades_amount(data)
	if not PlayerBase.USE_GRENADES then
		return
	end
	local teammate_panel = self._panel:child("player")
	local grenades_panel = self._player_panel:child("grenades_panel")
	local amount = grenades_panel:child("amount")
	if not self._main_player and CompactHUD.tm_nades then
		self:set_special_equipment_amount("grenades", data.amount)
		if data.amount == 0 then
			self:remove_special_equipment("grenades")
		end
	end
	grenades_panel:child("grenades"):set_visible(true)
	self:_set_amount_string(amount, data.amount)
	amount:set_visible(true)
end
function HUDTeammate:teammate_progress(enabled, tweak_data_id, timer, success)
	self._player_panel:child("interact_panel"):set_visible(false)
	self._player_panel:child("interact_panel"):set_alpha(0)
end

function HUDTeammate:set_state(state)
	self._player_panel:set_visible(state == "player")	
	self:UpdateSettings()
end

function HUDTeammate:add_special_equipment(data)
	local teammate_panel = self._panel
	local name_bg = self._panel:child("name_bg")
	local special_equipment = self._special_equipment
	local id = data.id
	local equipment_panel = teammate_panel:panel({
		name = id,
		layer = 0,
		y = 0
	})
	local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)
	equipment_panel:set_size(name_bg:h(), name_bg:h())
	local bitmap = equipment_panel:bitmap({
		name = "bitmap",
		texture = icon,
		layer = 1,
		texture_rect = texture_rect,
		w = name_bg:h() - 2,
		h = name_bg:h() - 2,
	})
	local amount, amount
	if data.amount then
		amount = equipment_panel:child("amount") or equipment_panel:text({
			name = "amount",
			text = tostring(data.amount),
			font = "fonts/font_small_mf",
			font_size = 14,
			color = Color.black,
			align = "center",
			vertical = "center",
			layer = 4,
		})
		amount_bg = equipment_panel:child("amount_bg") or equipment_panel:bitmap({
			name = "amount_bg",
			color = Color.white, 
			alpha = 0.4,
			layer = 3
		})
		amount:set_visible(1 < data.amount)
		amount_bg:set_visible(1 < data.amount)
	end

	local flash_icon = equipment_panel:bitmap({
		name = "flash_bitmap",
		texture = icon,
		color = tweak_data.hud.prime_color,
		layer = 2,
		texture_rect = texture_rect,
		w = equipment_panel:w() + 2,
		h = equipment_panel:w() + 2
	})
	table.insert(special_equipment, equipment_panel)
	local w = teammate_panel:w()
	equipment_panel:set_x(w - (equipment_panel:w() + 0) * #special_equipment)
	if amount then
		amount_bg:set_center(bitmap:center())
		amount_bg:move(7, 7)
		amount:set_center(bitmap:center())
		amount:move(3, 4)
	end
	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
	flash_icon:set_center(bitmap:center())
	flash_icon:animate(hud.flash_icon, nil, equipment_panel)
	self:layout_special_equipments()
end

function HUDTeammate:layout_special_equipments()
	local teammate_panel = self._panel
	local special_equipment = self._special_equipment
	local hp_text = self._player_panel:child("hp_text")
	local name = teammate_panel:child("name")
	local name_bg = teammate_panel:child("name_bg")
	local w = teammate_panel:w()

	for i, panel in ipairs(special_equipment) do	
		local bitmap = panel:child("bitmap")
		local flash_bitmap = panel:child("flash_bitmap")
		local amount = panel:child("amount")
		local amount_bg = panel:child("amount_bg")
		if self._main_player then
			local size = (26 * CompactHUD.scale)
			panel:set_size(size, size)
			panel:set_x(w - panel:w() * i)
			panel:set_bottom(self._player_panel:child("bg"):top() - 4)
		else
			panel:set_size(name_bg:h(),  name_bg:h())
			panel:set_center(name:center())
			panel:set_left(name_bg:right() + 4 + ((name_bg:h()) * (i - 1)))
			panel:move(0, -1)
		end			
		bitmap:set_size(panel:w() - (2 * CompactHUD.scale), panel:w() - (2 *  CompactHUD.scale))
		bitmap:set_y(0)
		if amount then
			amount:set_font_size(14 * CompactHUD.scale)
			amount:set_size(panel:size())
			amount_bg:set_size(panel:size())
			amount_bg:set_center(bitmap:center())
			amount_bg:move(7, 7)
			amount:set_center(bitmap:center())
			amount:move(3, 4)			
		end		
		if flash_bitmap then	
			flash_bitmap:set_size(panel:w() + 2, panel:w() + 2)
			flash_bitmap:set_center(bitmap:center())
		end
	end
end
function HUDTeammate:set_ammo_amount_by_type(type, max_clip, current_clip, current_left, max)
	if self._main_player then
		local weapon_panel = self._player_panel:child(type .. "_panel")	
		local ammo_clip = weapon_panel:child("current_clip")
		local ammo_total = weapon_panel:child("total_ammo")
		ammo_clip:set_text(tostring(current_clip))
		if CompactHUD.options.true_ammototal then
			ammo_total:set_text(tostring(current_left) - tostring(current_clip))
		else
			ammo_total:set_text(tostring(current_left))
		end
	end
end
function HUDTeammate:set_condition(icon_data, text)
	if self._player_panel:child("hp_text") then
		local condition_icon = self._panel:child("condition_icon")
		local condition_timer = self._panel:child("condition_timer")
		local hp_text = self._player_panel:child("hp_text")
		local name_bg = self._panel:child("name_bg")
		local name = self._panel:child("name")

		condition_icon:set_alpha(0)
		condition_timer:set_alpha(0)
		if icon_data == "mugshot_normal" then
			condition_icon:set_visible(false)
			if not self._main_player then			
				self:layout_special_equipments()			
				self._panel:set_alpha(1)
			end
		end
		if icon_data == "mugshot_downed" then
			if not self._main_player then
				hp_text:set_text("| Downed")
				self:layout_special_equipments()
				self._panel:set_alpha(1)
			end
		end
		if icon_data == "mugshot_in_custody" then
			if not self._main_player then
				hp_text:set_text("| Custody")
				self:layout_special_equipments()	
			else
				hp_text:set_text("HP: 0%")
			end
		end
		self:UpdateSettings()
	end
end
function HUDTeammate:_animate_timer()
	local name_bg = self._panel:child("name_bg")
	local hp_text = self._player_panel:child("hp_text")	
	local name = self._panel:child("name")	
	local rounded_timer = math.round(self._timer)
	hp_text:set_text("| Downed 00s")
	self:UpdateSettings()
	while self._timer >= 0 do
		local dt = coroutine.yield()
		if self._timer_paused == 0 then
			self._timer = self._timer - dt
			local text = self._timer < 0 and "0" or math.round(self._timer)
			hp_text:set_text("| Downed "..text.."s")
			if rounded_timer > math.round(self._timer) then
				rounded_timer = math.round(self._timer)
				if rounded_timer < 11 then
					self._panel:child("condition_timer"):animate(callback(self, self, "_animate_timer_flash"))
				end
			end
		end
	end	
end

function HUDTeammate:_set_amount_string(text, amount)
	if not PlayerBase.USE_GRENADES then
		text:set_text(tostring(amount))
		return
	end
	text:set_text(amount)
end
function HUDTeammate:_set_weapon_selected(id, hud_icon)
local is_secondary = id == 1
local secondary_weapon_panel = self._player_panel:child("secondary_panel")
local primary_weapon_panel = self._player_panel:child("primary_panel")
	if self._main_player then
		primary_weapon_panel:set_alpha(is_secondary and 0 or 1)
		secondary_weapon_panel:set_alpha(is_secondary and 1 or 0)
    end
end
function HUDTeammate:on_downed()
	local hp_text = self._player_panel:child("hp_text")
	if self._main_player and hp_text:text() ~= "0" then
		hp_text:set_text("HP: 0%")
	end
end

function HUDTeammate:set_health(data, ... )
	self.orig.set_health(self, data, ...)
	local name_bg = self._panel:child("name_bg")
	local name = self._panel:child("name")
	local hp_text = self._player_panel:child("hp_text")
	local Value = data.current / data.total * 100
	if math.floor(Value) > 0 then 
		if self._main_player then
			hp_text:set_text("HP: " .. math.floor(Value) .. "%")
		else
			hp_text:set_text("| "..math.floor(Value).."HP")	
		end
		if hp_text:color() ~= CompactHUD.text_color then
			hp_text:set_color(CompactHUD.text_color)
		end
		if (self._lastvalue and self._lastvalue < Value) and (Value - self._lastvalue) > 9  then
			hp_text:animate(callback(self, self, "health_full"), self._lastvalue, Value)
		end
		if self._lastvalue and Value < self._lastvalue then
			hp_text:animate(callback(self, self, "health_hurt"))
		end
	end
	self._lastvalue = Value
end
function HUDTeammate:health_full(hp_text, lastvalue, value)
	local t = 0
	local Health_size = (self._main_player and 22 or 20) * CompactHUD.scale
	while t < 1 do
		t = t + coroutine.yield()
		local n = 1 - math.sin((t / 2) * 180)
		hp = math.clamp(lastvalue + (t * 100), 0, value)
		if self._main_player then	
			hp_text:set_text("HP: " ..math.floor(hp) .. "%")
		else
			hp_text:set_text("| "..math.floor(hp).."HP")	
		end
	end
	hp_text:set_font_size(Health_size)
	if self._main_player then 
		hp_text:set_text("HP: " .. math.floor(self._lastvalue) .. "%")
	else
		hp_text:set_text("| "..math.floor(self._lastvalue).."HP")	
	end
end

function HUDTeammate:health_hurt(hp_text)
	local t = 0
	while t < 0.8 do
		t = t + coroutine.yield()
		local n = math.sin( t * 200 ) 
		hp_text:set_color(Color(math.lerp(255, CompactHUD.text_color.r, n), math.lerp(CompactHUD.text_color.g, 0, n), math.lerp(CompactHUD.text_color.b, 0, n)))
	end
	hp_text:set_color(CompactHUD.text_color)
end

function HUDTeammate:set_custom_radial(data)
	self.orig.set_custom_radial(self, data)		
	local hp_text = self._player_panel:child("hp_text")
	local red = data.current / data.total
	local Value = red * 100
	if self._main_player then
		if red > 0 then
			hp_text:set_color(Color.red)		
			hp_text:set_text(math.floor(Value))
		else
			if hp_text:color() ~= CompactHUD.text_color then
				hp_text:set_color(CompactHUD.text_color)
			end
		end
	end
end

function HUDTeammate:set_armor(data, ... )
	self.orig.set_armor(self, data, ...)
  	if self._main_player then
    	local armor_line = self._player_panel:child("armor_line")
		local ap_text = self._player_panel:child("ap_text")
    	Value = data.current / data.total
    	armor = Value * self._player_panel:child("bg"):w()
    	armor_line:set_color(CompactHUD.line_color * (math.round(Value * 100) / 100) + Color.red * (1 - math.round(Value * 100) / 100))
    	armor_line:set_w(armor)
    	ap_text:set_text("AP: " .. (math.floor(Value * 100) ) .. "%")
   	end
end

function HUDTeammate:set_stored_health_max(stored_health_ratio)
	local rip_line = self._player_panel:child("rip_line")
	if alive(rip_line) then
		local red = math.min(stored_health_ratio, 1)
		local value = red * (48 * CompactHUD.scale)
		rip_line:set_visible(red > 0)
		rip_line:set_h(value)
	end
end
function HUDTeammate:set_stored_health(stored_health_ratio)		
	local rip_line = self._player_panel:child("rip_line")
	if alive(rip_line) then
		local red = math.min(stored_health_ratio, 1)
		local value = red * (48 * CompactHUD.scale)
		rip_line:set_visible(red > 0)
		rip_line:stop()
		rip_line:animate(function(o)
			local s = rip_line:h()
			local e = value
			local t = 0
			while t < 0.5 do
				t = t + coroutine.yield()
				local n = 1 - math.sin(t / 2)
				rip_line:set_h(math.lerp(s, e, n)) -- pai 
			end				 
		end)
	end
end
 
function HUDTeammate:set_info_meter(data)
	if self._main_player then
		local rip_line = self._player_panel:child("rip_line")
		local teammate_panel = self._panel:child("player")
		local radial_health_panel = teammate_panel:child("radial_health_panel")
		local info_line = self._player_panel:child("info_line")
		local radial_info_meter_bg = radial_health_panel:child("radial_info_meter_bg")
		local red = math.clamp(data.current / data.max, 0, 1)
		local value = red * (48 * CompactHUD.scale)
	 	info_line:set_visible(red > 0)
	 	info_line:stop()
		info_line:animate(function(o)
			local s = info_line:h()
			local e = value
			local t = 0
			while t < 0.5 do
				t = t + coroutine.yield()
				local n = 1 - math.sin(t / 2)
				info_line:set_h(math.lerp(s, e, n)) 
			end				 
		end)
	end
end
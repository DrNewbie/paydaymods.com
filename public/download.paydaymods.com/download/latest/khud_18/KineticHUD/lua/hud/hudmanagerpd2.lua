local pad_large = 20
local pad_medium = 10
local pad_small = 5

local function interp_col(col_1,col_2,interp) --interp is (0-1]
	local r1 = col_1.r
	local r2 = col_2.r

	local g1 = col_1.g
	local g2 = col_2.g

	local b1 = col_1.b
	local b2 = col_2.b

	local a1 = col_1.a
	local a2 = col_2.a
	
	local r3 = (r2 - r1) / interp
	local g3 = (g2 - g1) / interp
	local b3 = (b2 - b1) / interp
	local a3 = (a2 - a1) / interp
	return Color(r1 + r3,g1 + g3,b1 + b3):with_alpha(a1 + a3)
end

local function format_seconds(raw)
--	local format_template = show_ms and "%i:%02d.%.2f" or "%i:%02d"
	return string.format("%i:%02d",math.floor(raw / 60),math.floor(raw % 60))
end

--init KineticHUD's main player panel (you)
Hooks:PreHook(HUDManager,"_create_teammates_panel","khud_hudmanager_create_teammates_panel",function(self,hud)
	hud = hud or managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)

	if self._khud_panels then 
		for k,old in pairs(self._khud_panels) do --if KineticHUD panels exist, remove and recreate
			if old and old:alive() then --or alive(old) 
				--todo remove old panel
			end
		end
	end
	
	self._khud_panels = {}
	
	local khud_base = hud.panel:panel({
		name = "kinetichud_base_panel",
		halign = "grow",
		valign = "bottom",
		w = hud.panel:w(),
		h = hud.panel:h(),
		y = 0
	})
	self._khud_base = khud_base
	
	for i = 1,4,1 do
		local is_player = i == HUDManager.PLAYER_PANEL

		local teammate = khud_base:panel({ --create khud teammates panel
			name = "" .. tostring(i),
			visible = false
		})		
		
		table.insert(self._khud_panels,teammate)
	end
	
	--just a separate parent panel so that it can display independently of hidden vanilla hud or hidden kinetichud;
	--while the buffs panel is still created in hudteammate, it references this panel as its parent
	self._khud_buffs_master = hud.panel:panel({
		name = "khud_buffs_master",
		halign = "grow",
		valign = "bottom",
		w = hud.panel:w(),
		h = hud.panel:h()
	})
	
end)

Hooks:PostHook(HUDManager,"update","khud_hudmanager_update",function(self,t,dt)
--if armor_max == 0 then return end
	local hud_panel = self._teammate_panels[HUDManager.PLAYER_PANEL]
	local _t = Application:time()
	local player_unit = managers.player and managers.player:local_player()
	if not (player_unit and KineticHUD) then 
		managers.player._player_buffs = {}
		return
	end
	
	local settings = KineticHUD.settings
	
	self:set_phase_timer()
		
	if KineticHUD:IsCrosshairScannerEnabled() and KineticHUD:IsCrosshairEnabled() then
		local fwd_ray = player_unit:movement():current_state()._fwd_ray
		if fwd_ray and fwd_ray.unit and alive(fwd_ray.unit) then
--			KineticHUD:_debug(fwd_ray.unit,1)
			if managers.enemy:is_enemy(fwd_ray.unit) then 
				if fwd_ray.unit:movement() and fwd_ray.unit:movement():team() then 
					local team = fwd_ray.unit:movement():team().id
					if team == "converted_enemy" or team == "criminal1" then 
						self:layout_khud_crosshair({color = tweak_data.chat_colors[#tweak_data.chat_colors],skip_alpha = true})
					else
						local brain = fwd_ray.unit:brain()
						if brain and brain.is_current_logic and brain:is_current_logic("intimidated") then 
							self:layout_khud_crosshair({color = Color.green,skip_alpha = true})
						else
							self:layout_khud_crosshair({color = Color.red,skip_alpha = true})
						end
					end
				else
					self:layout_khud_crosshair({color = Color.red,skip_alpha = true})
				end
			elseif managers.enemy:is_civilian(fwd_ray.unit) then --doesn't work since civ is filtered out of slotmask
				self:layout_khud_crosshair({color = Color.green,skip_alpha = true})
			elseif managers.criminals:character_name_by_unit(fwd_ray.unit) then 
				self:layout_khud_crosshair({color = tweak_data.chat_colors[#tweak_data.chat_colors],skip_alpha = true})
			else
				if KineticHUD.last_ray_unit and KineticHUD.last_ray_unit ~= fwd_ray.unit then 
--					KineticHUD:t_log(fwd_ray.unit)
				end
				KineticHUD.last_ray_unit = fwd_ray.unit
--				self:layout_khud_crosshair({color = KineticHUD.quality_colors.unusual,skip_alpha = true})
				self:layout_khud_crosshair({color = Color.white,skip_alpha = true})
			end
		else
			self:layout_khud_crosshair({color = Color.white,skip_alpha = true})
		end
	end
		
	--deployable equipment swapping animation
	if KineticHUD.start_swap_eq_t and managers.player and managers.player._equipment and managers.player._equipment.selected_index then 
		local start_t = KineticHUD.start_swap_eq_t
		local index = managers.player._equipment.selected_index
		local deployables_panel = hud_panel._khud_deployables_panel
		local dep_panel = deployables_panel:child(index == 1 and "primary_deployable" or "secondary_deployable")
		local selected_bar = deployables_panel:child("selected_bar")
		local current_x = selected_bar:x()
		local dep_x = dep_panel:x() * (index - 1)
		local duration = 0.25
		local elapsed_t = Application:time() - start_t
		local progress_smooth = 0
		if duration < elapsed_t then 
			KineticHUD.start_swap_eq_t = nil
		else
			local progress = elapsed_t / duration 
			progress_smooth = math.bezier({0,0,1,1},progress)
			
			if index == 2 then --destination secondary (left)
				local result = deployables_panel:child("primary_deployable"):x() * (1 - progress_smooth)
				selected_bar:set_x(result)
			else --destination primary (right)
				local result = dep_panel:x() * progress_smooth
				selected_bar:set_x(result)
			end
		end
		
	end
		
	if KineticHUD:HUD_Enabled_Player() then 
		local special_equipment = hud_panel._special_equipment
		if special_equipment then --slide-in & fade-in animation for mission equipment
			local equip_panel = hud_panel._khud_equipment_panel
			local p_w = 0
			local p_x = 0
			local dest_x = 0
			local diff_x = 1
			local eq_alpha = 0
			local sign = 1
			local result = 0
			for i,panel in ipairs(special_equipment) do
				p_w = panel:w()
				p_x = panel:x()
				dest_x = equip_panel:w() - ((pad_small + p_w) * i)
				diff_x = (dest_x - p_x)
				if math.abs(diff_x) > 0 then 
					sign = math.sign(diff_x)
					eq_alpha = 1 - (diff_x / dest_x)
					diff_x = math.abs(diff_x)
					result = (sign * math.min(diff_x,math.max(1,diff_x / 10))) + p_x
					panel:set_alpha(eq_alpha)
					panel:set_x(result)			
				end
			end
		end
	end
	
--[[test code for panel border function
--this does the shwoopy-loopy very well, in my professional opinion
	panel_border(hud_panel._khud_health_panel,{
--			thickness = math.sin(_t) * 30,
		margin = math.sin(_t + 5) * 30,
		color = Color(math.sin(135 * t + 0) / 2 + 0.5,math.sin(140 * t + 60) / 2 + 0.5,math.sin(145 * t + 120) / 2 + 0.5)
	})
--]]

	local panel_weapon_name = hud_panel._khud_weapon_name
	if KineticHUD.selected_wpn then --weapon selection bar
		local start_t = KineticHUD.start_swap_wpn_t
		local selected_bar = hud_panel._khud_weapons_panel:child("selected_bar") --bar hud panel object
		local selected_div = hud_panel._khud_weapons_panel:child("selected_div")
		local wpn_h = hud_panel._khud_weapons_panel:child("secondary_weapon_panel"):h()
		local wpn_y = (KineticHUD.selected_wpn - 1) * wpn_h --new resting pos for bar
		local rem_y = wpn_y - selected_bar:y() --distance from bar to new pos
		local elapsed_t = Application:time() - start_t
		if math.abs(rem_y) > 0 then 
			
			local duration = 0.25
			
			
			local progress_smooth = 0
			
			if duration < elapsed_t then --todo nil out KineticHUD.selected_wpn instead?
			else
				local progress = elapsed_t / duration
				progress_smooth = math.bezier({0,0,1,1},progress)
			
				if KineticHUD.selected_wpn == 1 then 
					local result = wpn_h - (wpn_h * progress_smooth)
					selected_bar:set_y(result)
					selected_div:set_y(result)
				else
					local result = wpn_y * progress_smooth
					selected_bar:set_y(result)
					selected_div:set_y(result)
				end
			end
		end
		
		if settings.wpn_name_duration < elapsed_t then
			if panel_weapon_name:alpha() > 0.01 then 
				panel_weapon_name:set_alpha(panel_weapon_name:alpha() * 0.9) --or do alpha decay
			elseif panel_weapon_name:alpha() > 0 then 
				panel_weapon_name:set_alpha(0)
			end
		end
	end

	if KineticHUD.scanner_left_timer then 
		if KineticHUD.scanner_left_timer + 1 > Application:time() then 
			self:set_khud_scanner_info()
		else
			KineticHUD.scanner_left_timer = nil
			KineticHUD.scanner_left_focus_unit = nil
			KineticHUD.scanner_left_focus_name = nil
		end
	else
		local scanner_label = hud_panel._khud_scanner_left:child("scanner_left_label")
		local scanner_alpha = scanner_label:alpha()
		if scanner_alpha < 0.005 then 
			scanner_alpha = 0
		else
			scanner_alpha = scanner_alpha * 0.8
		end
		local scanner_icon = hud_panel._khud_scanner_left:child("scanner_left_icon")
		scanner_label:set_alpha(scanner_alpha)
		scanner_icon:set_alpha(scanner_alpha)
	end
	
	local buffs = managers.player:get_buffs()

	local buffs_parent_panel = hud_panel._khud_buffs_panel
--	local buffs_parent_panel = self._khud_buffs_panel
	local buff_panel
	local buff_label
	local buff_icon
	local buff_value
	local text = ""
	local label_alpha = 1
	local flash_threshold = 3
	local buff_data = managers.player:get_buff_data()
	local time_left = 0
	--sort after other buffs expire
	local buff_num = 1
	local queued_remove_buffs = {} --todo global this
	
	
--	KineticHUD:_debug("zipline unit: " .. tostring(player_unit:movement():zipline_unit()),1)
--	KineticHUD:_debug("is ziplining: " .. tostring(player_unit:movement():on_zipline()),2)
--	local is_zipline = player_unit:movement():on_zipline()
--	KineticHUD:_debug("zipline dodge: " .. tostring(managers.player:upgrade_value("player", "on_zipline_dodge_chance", 0)),1)
--	KineticHUD:_debug("is ziplining: " .. tostring(is_zipline),2)
--	local armor_type = managers.blackmarket:equipped_armor_slot()
	local dodge_chance_total = managers.player:skill_dodge_chance(player_unit:movement():running(),player_unit:movement():crouching(),is_zipline) + managers.player:body_armor_value("dodge")
	if settings["dodge_chance_total"] and dodge_chance_total > 0 then 
		if not buffs["dodge_chance_total"] then 
			managers.player:add_buff("dodge_chance_total")
		end
	elseif buffs["dodge_chance_total"] then
		managers.player:remove_buff("dodge_chance_total")
	end
	
	local crit_chance_total = managers.player:critical_hit_chance()
	if settings["crit_chance_total"] and crit_chance_total > 0 then
		if not buffs["crit_chance_total"] then
			managers.player:add_buff("crit_chance_total")
		end
	elseif buffs["crit_chance_total"] then
		managers.player:remove_buff("crit_chance_total")
	end
	
	local dmg_resist_total = 1 - managers.player:damage_reduction_skill_multiplier("bullet")
	if settings["dmg_resist_total"] and dmg_resist_total > 0 then 
		if not buffs["dmg_resist_total"] then 
			managers.player:add_buff("dmg_resist_total")
		end
	elseif buffs["dmg_resist_total"] then 
		managers.player:remove_buff("dmg_resist_total")
	end
	
	for id,buff in pairs(buffs) do
		if not settings.show_buffs_master then 
			table.insert(queued_remove_buffs,id)
		end
		buff_panel = buffs_parent_panel:child(id)
		buff_label = buff_panel:child("label")
		buff_icon = buff_panel:child("icon")
--		buff_value = buff_panel:child("value")
		
		if buff_data[id].value_type == "timer" then
			if not buff.end_t then 
				KineticHUD:c_log("ERROR! No end_t for buff [" .. tostring(id) .. "]! Removing")
				table.insert(queued_remove_buffs,id)
				break --go directly to jail, do not pass go, do not collect $200
			end
			time_left = buff.end_t - _t
			text = format_seconds(1 + math.floor(time_left))
			if buff.end_t < _t and not buff_data[id].persistent_timer then 
--				KineticHUD:c_log(tostring(_t),"Removing expired buff with end_t " .. tostring(buff.end_t))
				table.insert(queued_remove_buffs,id)
			else
				if id == "armor_break_invulnerable" then -- special treatment since the game won't show actual armor break invuln time
					local invuln_timer = player_unit:character_damage()._can_take_dmg_timer
					if invuln_timer and invuln_timer > 0 then 
						buff_label:set_text(buff_data[id].label .. " " .. format_seconds(math.ceil(invuln_timer)))
						buff_label:set_color(Color("2B8EFF"))
						buff_label:set_alpha(1 + (math.sin(_t * 800) * 0.5))
					else
						buff_label:set_text(buff_data[id].label .. " Cooldown " .. text)
						buff_label:set_color(buff_data[id].text_color)
						buff_label:set_alpha(1)
					end
				elseif id == "hp_regen" then 
					local hp_regained = (buffs[id].value) and (" +" .. tostring(buffs[id].value) .. "%   ") or ""
					buff_label:set_text(buff_data[id].label .. hp_regained .. text)
				elseif id == "anarchist_armor_regen" then 
					local armor_regen_amount = (buffs[id].value) and (" +" .. tostring(buffs[id].value) .. "%   ") or ""
					buff_label:set_text(buff_data[id].label .. armor_regen_amount .. text)
				else
					buff_label:set_text(buff_data[id].label .. "  " .. text)
					if buff.flash or buff_data.flash or (time_left <= flash_threshold) then 
						buff_label:set_alpha(1 + (math.sin((buff.end_t + _t) * 800) * 0.5))
					else
						buff_label:set_alpha(1)
					end
				end
--				buff_value:set_alpha(1.4 + (math.sin((buff.end_t + _t) * 600) * 0.6))
--i had this set up so that value/timer was a different panel,
--so that you could set it to a different color and stuff
-- "Dom (2)", creator of the "Better Assault Indicator" mod very kindly showed me how to solve my problem
--so now i just need to re-implement buff_value
--

			end
		elseif buff_data[id].value_type == "value" then 
			if id == "berserker_damage_multiplier" then 
				text = managers.player:get_damage_health_ratio(player_unit:character_damage():health_ratio(),"damage")
--				KineticHUD:c_log(text,"berserker status")
				buff_icon:set_color(Color(1,1 - text,1 - text))
				if buff_data[id].flash then
					if text > 0.7 then 
						buff_icon:set_alpha(1 + (math.sin(_t * 800) * 0.5)) --todo increasing flash severity
					elseif text <= 0 then 
						table.insert(queued_remove_buffs,id)
					else
						buff_icon:set_alpha(buff_data[id].alpha or 1) --probably don't need alpha as a manual option
					end
				end
				buff_label:set_text(buff_data[id].label .. "  " .. string.format("%i",tostring(text * 100)) .. "%")
			elseif id == "dmg_resist_total" then
				text = dmg_resist_total --don't bother showing melee resist lol
				buff_label:set_text(buff_data[id].label .. "  " .. string.format("%i",tostring(text * 100)) .. "%")				
			elseif id == "dodge_chance_total" then
				text = dodge_chance_total
				buff_label:set_text(buff_data[id].label .. "  " .. string.format("%i",tostring(text * 100)) .. "%")				
			elseif id == "crit_chance_total" then
				text = crit_chance_total
				buff_label:set_text(buff_data[id].label .. "  " .. string.format("%i",tostring(text * 100)) .. "%")				
			elseif id == "messiah_charge" then
				buff_label:set_text(buff_data[id].label .. "  x" .. (buffs[id].value or 1))
			elseif id == "grinder" then 
				buff_label:set_text(buff_data[id].label .. " x" .. (buffs[id].value or 0))
				if buffs[id].value <= 0 then 
					table.insert(queued_remove_buffs,id)
				end
			elseif id == "lock_n_load" then 
--				local mag_rem = player_unit:inventory():equipped_unit():base():get_ammo_remaining_in_clip()
--todo figure out how to choose the right weapon for that ^
				--math.max(100 - (1 * math.max(0,mag_rem - 20)),40)
				buff_label:set_text(buff_data[id].label)--.. "  x" .. (buffs[id].value or 1))
			elseif id == "hysteria" then 
				buff_label:set_text(buff_data[id].label .. "  x" .. (buffs[id].value or 1))
				local max_stacks = tweak_data.upgrades.max_total_cocaine_stacks
				
				if buff_data[id].flash and buffs[id].value >= max_stacks then 
					local min_alpha = 0.5 --desired minimum alpha; trough
					local b = 1 - (2 / min_alpha) --denominator
					local frequency = 10 --wavelength; lower is more often
					label_alpha = (0.5 - (1 / b)) + ((math.cos(100 * frequency * _t) / math.pi) / b)
					buff_label:set_alpha(label_alpha) --todo increasing flash severity
				elseif buff_icon:alpha() < 1 then 
					buff_label:set_alpha(1)
				end
			elseif id == "wild_kill_counter" then
				local wild_kill_counter = managers.player:get_wild_kill_counter()
				local wild_kills_left = tweak_data.upgrades.wild_max_triggers_per_time - #wild_kill_counter
				if wild_kill_counter[1] and wild_kill_counter[1] <= _t then 
					table.remove(wild_kill_counter,1)
					--turns out ovk doesn't update the biker kill counter until you get a kill. efficient, but bad for info huds.
					--so... guess i'll be putting some biker stuff in here
				end
				if wild_kill_counter[1] then 
--					buff_icon:set_h(((_t / wild_kill_counter[1]) - 1) / max_h)
					local latest_wild_t = wild_kill_counter[#wild_kill_counter]
					local max_wild_t = tweak_data.upgrades.wild_trigger_time
					local ratio = 1 - ((latest_wild_t - _t) / max_wild_t)
					buff_icon:set_color(Color(1,ratio,ratio))
				else
					buff_icon:set_color(buff_data[id].icon_color)
				end
				buff_label:set_text(buff_data[id].label .. " x" .. tostring(wild_kills_left))
				if buff_data[id].flash then 
				
					if wild_kills_left <= 0 then 
						buff_label:set_alpha(1 + math.sin(_t * 800) * 0.4)				
					else
--						buff_icon:set_color(interp_col(buff_icon:color(),buff_data[id].icon_color,10))
						buff_label:set_alpha(1)
					end
				end
			else
--				KineticHUD:c_log("Unknown status for buff " .. id)
			end
		elseif buff_data[id].value_type == "status" then 
		else
--			KineticHUD:c_log("Unknown value type " .. buff_data[id].value_type .. " for buff " .. id)
		end
		
		--update positions for buffs when one expires
		
		local max_per_column = 6
		
		buff_panel:set_x(buff_panel:w() * math.floor(buff_num / max_per_column))
		buff_panel:set_y(buffs_parent_panel:h() - ((buff_num % max_per_column) * (buff_panel:h() + pad_medium))) --todo make pad small with more buffs

		buff_num = buff_num + 1 ---this feels wrong
	end
	
	for n,buffid in ipairs(queued_remove_buffs) do
		managers.player:remove_buff(buffid) --doing this cause it's probably a bad idea to modify the table you're iterating through otherwise
	end

	for panelid,teammate in pairs(self._teammate_panels) do
		local indic_alpha = teammate._khud_voice_indicator:alpha() --:child("voice_indicator"):alpha()
		if indic_alpha > 0 and indic_alpha < 1 then 
			indic_alpha = indic_alpha * 0.8
			if indic_alpha < 0.01 then
				indic_alpha = 0
			end
		end
--		indic_alpha = math.bezier({0,0,1,1},indic_alpha)
		teammate._khud_voice_indicator:set_alpha(indic_alpha) --:child("voice_indicator"):set_alpha(indic_alpha)
	end
	
	--sentry/ecm rightscanner
	if managers.groupai:state():whisper_mode() then
		hud_panel:update_tracked_ecms()	
	else
		hud_panel:update_tracked_sentryguns()
	end
	
--quickchat panel	
	if self._hud_chat and self._hud_chat._panel and self._hud_chat._panel:child("quickchat_panel") then
		local qchat = self._hud_chat._panel:child("quickchat_panel")
		
		if qchat:visible() and not KineticHUD.quickchat_fadeout and KineticHUD.quickchat_start_t and (KineticHUD.quickchat_start_t < (Application:time() - KineticHUD.quickchat_lifetime)) then
			KineticHUD.quickchat_fadeout = true
		else
--			KineticHUD:c_log(tostring(Application:time() - KineticHUD.quickchat_lifetime),tostring(KineticHUD.quickchat_start_t))
		end
		if KineticHUD.quickchat_fadeout and qchat:visible() then 
			local fade_duration = KineticHUD.quickchat_fade_duration / 10
			local ratio = ((Application:time() - KineticHUD.quickchat_lifetime) - KineticHUD.quickchat_start_t)
--			local ratio = (KineticHUD.quickchat_lifetime - (Application:time() - KineticHUD.quickchat_start_t)) / KineticHUD.quickchat_lifetime
			local qchat_a = (100 - math.pow(ratio/fade_duration,2)) / 100
			if qchat_a <= 0 then
				KineticHUD.quickchat_fadeout = nil
				KineticHUD.quickchat_start_t = nil
				KineticHUD:set_quickchat_focus()
				qchat:hide()
			else
--				KineticHUD.quickchat_fadeout = false
				qchat:set_alpha(qchat_a)
			end
		end
	end
	
	
	if self._fading_panels then  --unused
		local to_alpha
		local fade_panel
		local to_duration
		local to_start_t
		local to_alpha_2
		for k,entry in ipairs(self._fading_panels) do 
			to_alpha = entry.to_alpha
			fade_panel = entry.panel
			to_duration = entry.duration
			to_start_t = entry.start_t
			to_alpha_2 = ((Application:time() - to_start_t) / to_duration) * (to_alpha - fade_panel:alpha()) --from 0 to 1

			fade_panel:set_alpha(fade_panel:alpha() + to_alpha_2)
		end
	end
	
end)

function HUDManager:refresh_quickchat_menu(entry)
	self._hud_chat:refresh_quickchat_menu(entry)
end

function HUDManager:quickchat_visible()
	return self._hud_chat._panel:child("quickchat_panel"):visible()
end

function HUDManager:animate_panel_to_alpha(panel,alpha,duration) --unused; todo add callback
	self._fading_panels = self._fading_panels or {}
	if panel then 
		table.insert(self._fading_panels,{panel = panel, to_alpha = alpha or 0, duration = duration or 2, start_t = Application:time()}) --todo more options for this
	end
end

--trackers
function HUDManager:add_buff(id)
--[[
	local buffs_panel = self._khud_buffs_panel
	local buff_data = managers.player:get_buff_data()[id]
	local current_buffs = managers.player:get_buffs()
	local buff = current_buffs[id]
	local num = 0
	for id,buffy_the_vampire_slayer in pairs(current_buffs) do
		num = num + 1
	end
	local max_per_column = 6
	local w = 175
	local h = 32
	local icon_scale = 1
	
	local icon = buff.icon or buff_data.icon --should always use buff_data
	local source = buff.source or buff_data.source --should always use buff_data
	local icon_tier = buff.icon_tier or buff_data.icon_tier or 1 --only used for perk decks
	
	local text_color = buff.text_color or buff_data.text_color
	local icon_color = buff.icon_color or buff_data.icon_color
	local label = buff.label or buff_data.label
	
	if buffs_panel:child(id) then --todo overhaul this refresh thingy
		if icon_color then 
			buffs_panel:child(id):child("icon"):set_color(icon_color)
		
		end
		if text_color then 
			buffs_panel:child(id):child("label"):set_color(text_color)
		end
	else

		local font_size = 16
		local rect = {0,0,64,64}
		local texture = skill_atlas
		if source == "skill" then 
			texture = skill_atlas_2
			local x,y = unpack(tweak_data.skilltree.skills[icon].icon_xy)
			rect = {x * 80,y * 80,80,80}
		elseif source == "perk" then
			texture,rect = tweak_data.skilltree:get_specialization_icon_data_with_tier_because_overkill_wouldnt_do_it(tonumber(icon),nil,icon_tier)
		elseif source == "icon" then
			texture,rect = tweak_data.hud_icons:get_icon_data(icon or "mugshot_normal")
		else --"manual" source i guess
		--todo throw an error or something idk
			texture,rect = tweak_data.hud_icons:get_icon_data("frag_grenade")
		end
		if not rect then 
			KineticHUD:c_log("Bad rect!")
		end
		local buff_x = w * math.floor(num / max_per_column)
		local buff_panel = buffs_panel:panel({
			name = tostring(id),
			x = buff_x,
			y = buffs_panel:h() - (num * (h + pad_medium)),--(num * h + pad_medium),
			w = w,
			h = h,
			layer = 4
		})
		local buff_icon = buff_panel:bitmap({
			name = "icon",
			visible = true,
			w = h * icon_scale,
			h = h * icon_scale,
			texture = texture,
			texture_rect = rect,
			blend_mode = "add"
		})
		if icon_color then buff_icon:set_color(icon_color) end
		local buff_label = buff_panel:text({
			name = "label",
			layer = 3,
			font_size = font_size,
			font = ammo_font,
			text = label,
			x = (h * icon_scale) + pad_small,
			y = (h * icon_scale / 3), --not quite bottom
			color = text_color or Color.white
		})
		
		--[
		local buff_value = buff_panel:text({
			name = "value",
			visible = false,
			layer = 3,
			font_size = font_size,
--			vertical = "bottom",
--			align = "left",
			font = ammo_font,--"fonts/font_medium_mf",
			text = "4:20",
			x = (string.len(buff_data.label) * (font_size / 1.5)) + pad_small, --buff_label:right(),--
			y = (h * icon_scale / 2), --bottom
			color = color or Color.white
		})
		--]
		local debug_buffs = buff_panel:rect({
			name = "debug_buffs",
			visible = debug_panels_visible,
			layer = 0,
			color = Color.purple:with_alpha(0.3)
		})		
	end
--]]
	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
	hud:_add_buff(id)
end

function HUDManager:remove_buff(id)
--[[
	local buffs_panel = self._khud_buffs_panel
	if buffs_panel:child(id) then
		buffs_panel:remove(buffs_panel:child(id))
	end
	--]]
	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
	hud:_remove_buff(id)
end

function HUDManager:set_khud_scanner_info(name,unit) --interpret input
	local refresh = (unit and name)
	unit = unit or KineticHUD.scanner_left_focus_unit
	name = name or KineticHUD.scanner_left_focus_name
	if not alive(unit) then return end
	local base = unit:base()
	if not base then return end
	local result
	if name == "ammo_bag" then 
		local ammo_amount = base._ammo_amount
		if ammo_amount then 
			result = tostring(ammo_amount * 100) .. "% ammo left"
		end
	elseif name == "doctor_bag" then
		local docbag_amount = base._amount
		if docbag_amount then 
			result = tostring(base._amount) .. " uses left"
		end
	elseif name == "first_aid_kit" then
		local has_uppers_aced = base._min_distance and base._min_distance and tonumber(base._min_distance) > 0
		result = (has_uppers_aced and "[Uppers Aced Enabled]" or "First Aid Kit")
	elseif name == "sentry_gun" or name == "sentry_gun_fire_mode" then 
		local sentry_owner = unit:get_owner_id()
		local sentry_damage = unit:character_damage()
		if sentry_damage then 
			if sentry_owner and sentry_owner ~= LuaNetworking:LocalPeerID() then 
				local sentry_weapon = unit:weapon()
				local sentry_ammo = sentry_weapon:ammo_ratio()
				sentry_owner = LuaNetworking:GetNameFromPeerID(sentry_owner)
				if sentry_damage:dead() then 
					result = sentry_owner .. "'s Sentry Gun (Dead)"
				else
					result = sentry_owner .. "'s Sentry Gun (" .. ((sentry_ammo or 0) * 100) .. "% ammo)"
				end
			else
				if not sentry_damage:dead() then
					result = "My Sentry Gun (" .. (sentry_damage:health_ratio() or 0) * 100 .. "% health)"
				else
					local criminal = managers.criminals:local_character_name() or "Dallas"
					result = "*cough* oh, I'm dying... " .. criminal .. ", tell my wife I love her! *blergh*"
				end
			end
		end
	elseif name == "bodybags_bag" then
		local bodybags_left = base._bodybag_amount
		if bodybags_left then 
			result = tostring(bodybags_left or 3) .. " bodybags left"
		end
	elseif name == "ecm_jammer" then 
		local battery_life = base._battery_life
		if battery_life then
			result = format_seconds(battery_life) .. "s left" 
		end
--			KineticHUD:_debug(tostring(time_left) .. " time left",2)
	elseif name == "trip_mine" then  --todo get upgrade value or something?
		return
	elseif name == "grenade_briefcase" then --this crashes and i don't know why
--			local grenades_left = unit._grenade_amount
		return
	else
		return
	end
	
	if result then 
		result = result .. "  "
		self:set_khud_scanner_left(result,name)
		if refresh then 
			KineticHUD.scanner_left_timer = Application:time()
			KineticHUD.scanner_left_focus_unit = unit
			KineticHUD.scanner_left_focus_name = name
		end
	end
end


function HUDManager:set_sentry_tracker_visible(visible)
	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
	
	local scanner = hud._khud_scanner_right
	if visible == nil then 
		visible = KineticHUD:IsSentryTrackerEnabled()
	end
	if scanner then 
		scanner:set_visible(visible)
	end
	
end

function HUDManager:set_khud_scanner_left(str,name) --outputs; leave str nil to reset
	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
	local scanner_left = hud._khud_scanner_left
	local label = scanner_left:child("scanner_left_label")
	local icon = scanner_left:child("scanner_left_icon")
	
	label:set_text(str)
	label:set_alpha(1)
	icon:set_alpha(1)
	
	local icon_name,icon_rect = tweak_data.hud_icons:get_icon_data(tweak_data.equipments[name or "armor_kit"].icon)
	local _,_,name_w,_ = label:text_rect()
	icon:set_image(icon_name, unpack(icon_rect))
	icon:set_x(scanner_left:w() + - icon:w() + - name_w + - 12)
	
end

function HUDManager:add_tracked_sentrygun(key) --unused
	local sentrygun_texture = tweak_data.hud_icons.equipment_sentry.texture
	local sentrygun_rect = tweak_data.hud_icons.equipment_sentry.texture_rect
	local tracked_sentryguns = managers.player:get_tracked_sentryguns()
	for k,sentrygun in ipairs(tracked_sentryguns) do
		if sentrygun.key == key then
			self._teammate_panels[HUDManager.PLAYER_PANEL]._khud_scanner_right:child("scanner_right_icon_" .. k):set_image(sentrygun_texture,unpack(sentrygun_rect))
			return
		end
	end
end

function HUDManager:add_tracked_ecm(key) --unused
	local ecm_texture = tweak_data.hud_icons.equipment_ecm_jammer.texture
	local ecm_rect = tweak_data.hud_icons.equipment_ecm_jammer.texture_rect
	local tracked_ecms = managers.player:get_tracked_ecms()
	for k,ecm in ipairs(tracked_ecms) do
		if ecm.key == key then
			self._teammate_panels[HUDManager.PLAYER_PANEL]._khud_scanner_right:child("scanner_right_icon_" .. k):set_image(ecm_texture,unpack(ecm_rect))
			return
		end
	end
end

--debug location/cartographer
function HUDManager:set_debug_look(rotlook)
	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
		
	hud:_set_debug_look(rotlook)
end

function HUDManager:set_debug_value(value,slot)
	self._teammate_panels[HUDManager.PLAYER_PANEL]:_set_debug_value(value,slot)
end

function HUDManager:set_debug_coords(vecpos)
	
	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
	hud:_set_debug_coords(vecpos)
end

function HUDManager:show_khud_debug(state)
	state = state and true or false
	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
	hud._khud_debug_info:set_visible(state)
end

function HUDManager:set_subregion(str,panel_id) --todo move out of teammate panel
--	if not str then return end
	local hud = self._teammate_panels[panel_id or HUDManager.PLAYER_PANEL]
	hud:_set_subregion(str)
end

function HUDManager:get_player_location() --local player only
	return self._player_location
end

Hooks:PostHook(HUDManager,"set_player_location","khud_setplayerlocation",function(self,location_id)
--This function is empty, but is still appropriately called complete with location_id argument for the main player, and can be applied to teammates, so I'm gonna use this.
	if KineticHUD:UseCartographer() and KineticHUD:UseNavSurfaces() and utf8.to_lower(location_id) ~= "location_unknown" then
		self._player_location = location_id
		self:set_subregion(KineticHUD:IsDebugEnabled() and location_id or managers.localization:text(location_id))
--		KineticHUD:_log("OwO a named nav surface??? set_player_location(" .. tostring(location_id) .. ")")
	else --if invalid location, remove player location and enable cartographer checking again
		--self._player_location = nil
	end
end)

--crosshair
function HUDManager:toggle_khud_crosshair(enabled)
	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
	hud._khud_crosshair_panel:set_visible(enabled)
end

function HUDManager:layout_khud_crosshair(params)
	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
	hud:_layout_khud_crosshair(params)
end

function HUDManager:animate_fade_crosshair(visible)
	local crosshair = self._teammate_panels[HUDManager.PLAYER_PANEL]._khud_crosshair_panel
	crosshair:stop()	
	crosshair:animate(callback(self,self,"_animate_fade_crosshair"),visible)
end

function HUDManager:_animate_fade_crosshair(crosshair,visible)
--function HUDHitConfirm:_animate_show(hint_confirm, done_cb, seconds)
	crosshair = crosshair or self._teammate_panels[HUDManager.PLAYER_PANEL]._khud_crosshair_panel
	
	local seconds = 1 --duration for fadeout
	
--	crosshair:set_visible(not visible)
	local alpha = KineticHUD.settings.crosshair_master_opacity
--	crosshair:set_alpha(KineticHUD.settings.crosshair_master_opacity)

	local t = seconds

	while t > 0 do
		local dt = coroutine.yield()
		local a 
		t = t - dt
		if visible then 
			a = alpha * (seconds - t)
		else
			a = alpha * t
		end
		crosshair:set_alpha(a)
	end
--	crosshair:set_visible(visible)
--	done_cb()
end

--assault
Hooks:PostHook(HUDManager,"sync_set_assault_mode","khud_hudmanager_sync_assaultmode",function(self,mode) --only for winters? base game function; todo remove or post
	self._hud_assault_corner:sync_set_assault_mode(mode)
end)

function HUDManager:set_phase_timer(end_t)
	local time_rem = ""
	local t = Application:time()
	end_t = end_t or managers.groupai:state():assault_phase_end_time()
--	local is_assault = managers.groupai:state():get_assault_mode()
	if end_t then
		time_rem = format_seconds(math.max(0,end_t - t))
	--	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
	end
	self._hud_assault_corner:_set_phase_timer(time_rem)
end

function HUDManager:set_assault_phase_visible(toggle)
	self._hud_assault_corner:_set_phase_visible(toggle)
end

function HUDManager:set_assault_phase(phase)
	self._hud_assault_corner:_set_assault_phase(phase)
	if Network:is_server() then 
		if KineticHUD.assault_phase_name ~= phase then 
			KineticHUD.assault_phase_name = phase
			KineticHUD:sync_set_assault_phase(phase)
		end
	end
--	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
end

--weapon
function HUDManager:set_firemode_safety(safety)
	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
	local index = managers.player:get_current_state()._equipped_unit:base():selection_index()
	hud:_set_weapon_safety(index,safety)
end

function HUDManager:layout_khud_weapons_panel(params)
--todo move to hudteammate
--todo scale y pos of selected_bar and selected_div
--todo scale size of firemode icons
	params = params or {}
	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
	local panel = hud._khud_weapons_panel
	local wpn_name = hud._khud_weapon_name
	local use_custom = KineticHUD:UseWeaponCustomXY()
	local settings = KineticHUD:GetSettings()
	local panel_w = 256 --default parent panel w
	local panel_h = 100 --default parent panel h
--	local panel_x = 128 + pad_medium --parent x
--	local panel_y = hud._player_panel:h() - panel_h --parent y
	local wpn_h = 50 --primary/secondary subpanel height
	local firemode_w = 32 --also self explanatory
	local firemode_h = 32 --self explanatory
	local x = panel:x()
	local y = panel:y()
	local scale = 0.75
	local icon_scale = 0.75

	local w = panel_w * scale
	local h = panel_h * scale
	
	local fontsize_mag = 32 * scale
	local fontsize_reserve = 16 * scale
	local fontsize_killcounter = 16 * scale
	

	panel:set_size(w,h)
	
	if use_custom then 
		x = params.x or settings.panel_weapon_x or x
		y = params.y or settings.panel_weapon_y or y
		scale = params.scale or settings.panel_weapon_scale or scale
	else
		x = hud._khud_grenades_panel:right() + pad_medium --128 + pad_medium --hud._player_panel:w() - panel:w()
		y = hud._khud_grenades_panel:y() -- hud._khud_health_panel:y() + h -- - panel_h
	end
	
	panel:set_x(x)
	panel:set_y(y)

--	panel:child("selected_bar"):set_w(6 * scale)
	panel:child("selected_bar"):set_h(wpn_h * scale)
	panel:child("selected_div"):set_x(panel:w() * 0.75)
	panel:child("selected_div"):set_w(1.5 * scale)
	panel:child("selected_div"):set_h(wpn_h * scale)
	
	local pri_wpn_panel = panel:child("primary_weapon_panel")
	local sec_wpn_panel = panel:child("secondary_weapon_panel")
	
	pri_wpn_panel:set_size(scale * (panel_w - pad_medium),scale * wpn_h)
	pri_wpn_panel:child("primary_icon"):set_size(2 * wpn_h * scale * icon_scale,wpn_h * scale * icon_scale)
	pri_wpn_panel:child("primary_weapon_bg"):set_size(scale * (panel_w - pad_medium),scale * wpn_h)
	panel_border(pri_wpn_panel,{
		thickness = 1,
		alpha = 0.3,
		layer = 3
	})
	pri_wpn_panel:child("mag_text"):set_font_size(fontsize_mag)
	pri_wpn_panel:child("mag_text"):set_x(pri_wpn_panel:w() * 0.5)
	pri_wpn_panel:child("mag_text"):set_y((pri_wpn_panel:h() - fontsize_mag) * 0.5)
	pri_wpn_panel:child("ammo_text"):set_font_size(fontsize_reserve)
	pri_wpn_panel:child("ammo_text"):set_x(pri_wpn_panel:w() * 0.8)
	pri_wpn_panel:child("ammo_text"):set_y((pri_wpn_panel:h() - fontsize_reserve) * 0.5)
	pri_wpn_panel:child("safety_text"):set_font_size(scale * 32)
	
	local primary_firemode_panel = pri_wpn_panel:child("primary_firemode_panel")
--	primary_firemode_panel:set_w(firemode_w * scale)
	primary_firemode_panel:set_h(firemode_h * scale)
	primary_firemode_panel:set_x(pad_small * scale)
	primary_firemode_panel:set_y(pri_wpn_panel:bottom() - primary_firemode_panel:h())
--	primary_firemode_panel:child("firemode_primary"):set_y(primary_firemode_panel:bottom() - (32 * scale))

	pri_wpn_panel:child("primary_kill_counter"):set_font_size(fontsize_killcounter)
	pri_wpn_panel:child("primary_kills_icon"):set_size(12 * scale) --icon isn't used; skull icon is set in text string
	
	sec_wpn_panel:set_size(scale * (panel_w - pad_medium),scale * wpn_h)
	sec_wpn_panel:set_y(wpn_h * scale)
	sec_wpn_panel:child("secondary_icon"):set_size(2 * wpn_h * scale * icon_scale,wpn_h * scale * icon_scale)
	sec_wpn_panel:child("secondary_weapon_bg"):set_size(scale * (panel_w - pad_medium),scale * wpn_h)
	panel_border(sec_wpn_panel,{
		thickness = 1,
		alpha = 0.3,
		layer = 3
	})
	
--	panel:child("div_h"):set_x(pad_medium * scale) --it's fine where it is
	panel:child("div_h"):set_y((wpn_h - 1) * scale)
	panel:child("div_h"):set_w((panel_w - pad_medium) * scale)
	panel:child("div_h"):set_h(2 * scale)
	
	sec_wpn_panel:child("mag_text"):set_font_size(fontsize_mag)
	sec_wpn_panel:child("mag_text"):set_x(0.5 * sec_wpn_panel:w())
	sec_wpn_panel:child("mag_text"):set_y((sec_wpn_panel:h() - fontsize_mag) * 0.5)
	sec_wpn_panel:child("ammo_text"):set_font_size(fontsize_reserve)
	sec_wpn_panel:child("ammo_text"):set_x(sec_wpn_panel:w() * 0.8)	
	sec_wpn_panel:child("ammo_text"):set_y((sec_wpn_panel:h() - fontsize_reserve) * 0.5)
	sec_wpn_panel:child("safety_text"):set_font_size(scale * 32)
	
	local secondary_firemode_panel = sec_wpn_panel:child("secondary_firemode_panel")
	secondary_firemode_panel:set_x(pad_small * scale)
	secondary_firemode_panel:set_y(sec_wpn_panel:y() - secondary_firemode_panel:h())
--	secondary_firemode_panel:set_y((3 + pad_small + wpn_h - firemode_h)  * scale)	
--	secondary_firemode_panel:set_w(firemode_w * scale)
	secondary_firemode_panel:set_h(firemode_h * scale)
	secondary_firemode_panel:child("firemode_secondary"):set_y(secondary_firemode_panel:bottom() - secondary_firemode_panel:h())
--	secondary_firemode_panel:child("firemode_secondary"):set_size(4 * scale, 17 * scale)
--	secondary_firemode_panel:child("firemode_secondary"):set_w(32 * scale)--
--	secondary_firemode_panel:child("firemode_secondary"):set_h(32 * scale)--
	sec_wpn_panel:child("secondary_kill_counter"):set_font_size(fontsize_killcounter)
	sec_wpn_panel:child("secondary_kills_icon"):set_size(12 * scale)

	wpn_name:set_x((self._khud_base:w() / 2) + 8)
	wpn_name:set_y((self._khud_base:h() / 2) + 8)
end

function HUDManager:set_khud_weapon_icons(slot)
	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
	hud:_set_khud_weapon_icons(slot)
end

function HUDManager:set_khud_weapon_killcount(slot,count) --local player only
	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
	hud:_set_khud_weapon_killcount(slot,count)
end

--misc
function HUDManager:set_khud_deployable(i,data,index)
	i = i or HUDManager.PLAYER_PANEL
	index = index or (data and data.index)
	local hud = self._teammate_panels[i]
	local amount = {}
	if #data.amount > 1 then 
		for amount_index,value in pairs(data.amount) do 
			table.insert(amount,Application:digest_value(value,false))
		end
		data.amount = amount
		hud:set_khud_deployable_equipment_amount_secondary(index,data)
	else
		amount = Application:digest_value(data.amount[1],false)
		data.amount = amount
		hud:set_khud_deployable_equipment_amount(index,data)
	end
	hud:set_khud_deployable_equipment(data) --to show relevant equipment on hud
	
end

function HUDManager:set_secondary_deployable(i,data) --todo phase this out
	KineticHUD:c_log("Set_secondary_deployable called from hudmanagerpd2- phase this out")
	local hud = self._teammate_panels[i] --todo just put that in data instead of making a new function
--	hud:_set_secondary_deployable(data)
end

function HUDManager:set_hostage_count(num)
	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
	hud._khud_hostages_panel:child("num_hostages"):set_text(tostring(num))
end	

function HUDManager:set_khud_stamina(value,max_value)
	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
	hud:_set_khud_stamina(value,max_value)
end

function HUDManager:show_khud_selecteq_bar()
	local hud_panel = self._teammate_panels[HUDManager.PLAYER_PANEL]
	local deployables_panel = hud_panel._khud_deployables_panel
	local selected_bar = deployables_panel:child("selected_bar")
	selected_bar:show()
end

function HUDManager:hide_khud_selecteq_bar() --unused
	local hud_panel = self._teammate_panels[HUDManager.PLAYER_PANEL]
	local deployables_panel = hud_panel._khud_deployables_panel
	local selected_bar = deployables_panel:child("selected_bar")
	selected_bar:hide()
end

local orig_show_gear = HUDManager.show_player_gear
function HUDManager:show_player_gear(panel_id,...)
	local hud = self._teammate_panels[panel_id]
	if true or panel_id == HUDManager.PLAYER_PANEL then --local player
		hud._khud_weapons_panel:show()
		hud._khud_deployables_panel:show()
		hud._khud_ties_panel:show()
		hud._khud_grenades_panel:show()
	else
		return orig_show_gear(self,panel_id,...)
	end
end

local orig_hide_gear = HUDManager.hide_player_gear
function HUDManager:hide_player_gear(panel_id,...)
	local hud = self._teammate_panels[panel_id]
	if true or panel_id == HUDManager.PLAYER_PANEL then 
		hud._khud_weapons_panel:hide()
		hud._khud_deployables_panel:hide()
		hud._khud_ties_panel:hide()
		hud._khud_grenades_panel:hide()
	else
		return orig_hide_gear(self,panel_id,...)
	end
end


--if voice indicator setting
function HUDManager:set_mugshot_voice(id, active)
	local panel_id
	for _, data in pairs(managers.criminals:characters()) do
		if data.data.mugshot_id == id then
			panel_id = data.data.panel_id
			break
		end
	end
	if panel_id and panel_id ~= HUDManager.PLAYER_PANEL then
		self._teammate_panels[panel_id]:set_voice_com(active)
	end
end

function HUDManager:get_criminal_hud_panel_by_panel_id(id) --not really needed or used
	if KineticHUD:HUD_Enabled_Master() then
		if (id == HUDManager.PLAYER_PANEL) and KineticHUD:HUD_Enabled_Player() or KineticHUD:HUD_Enabled_Team() then
			return self._khud_panels[id]
		end
	end
	return self._teammate_panels[id]
end

function HUDManager:set_khud_player_visible()
	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
	hud:_set_khud_player_visible()
--	hud._khud_player:set_visible(false)
--	hud._panel:set_visible(false)
end

function HUDManager:set_khud_team_visible()
	for id,panel in pairs(self._teammate_panels) do
		if id ~= HUDManager.PLAYER_PANEL then
			panel:_set_khud_team_visible()
--			panel._khud_player:set_visible(false)
--			panel._panel:set_visible(false)
		end
	end
--	self._teammate_panels[HUDManager.PLAYER_PANEL]._khud_player:set_visible(visible)
end

function HUDManager:get_criminal_hud_panel_by_peer_id(peer_id)
	if not (peer_id) then return end
	local data = managers.criminals:character_data_by_peer_id(peer_id)
	local panel_id = data and data.panel_id
	if panel_id and self._teammate_panels[panel_id] then
		return self._teammate_panels[panel_id]
	end
	KineticHUD:_log("ERROR: get_criminal_hud_panel_by_peer_id("..tostring(peer_id)..") No HUD panel found!")
	return nil
end

function HUDManager:init_khud_downs_team()
	for id,panel in pairs(self._teammate_panels) do
		local peer_id = panel._peer_id or 5
		local max_downs = KineticHUD:DownCounter_GetGlobalMaxDowns() + KineticHUD:DownCounter_GetPeerExtraLives(peer_id)
		local downs = max_downs - KineticHUD:DownCounter_GetDowns(peer_id)
		if id ~= HUDManager.PLAYER_PANEL then 
			panel:_set_khud_downs(peer_id,downs)
		end
	end
end

function HUDManager:set_khud_downs(peer_id,downs)
	if not downs then return end
	
	local panel = self:get_criminal_hud_panel_by_peer_id(peer_id)
	if panel then 
		panel:_set_khud_downs(KineticHUD:DownCounter_GetGlobalMaxDowns() - downs)
	end
end

function HUDManager:layout_khud_buffs(params)
	self._teammate_panels[HUDManager.PLAYER_PANEL]:_layout_khud_buffs(params)
end

function HUDManager:layout_khud_deployables_team()
	for id,panel in pairs(self._teammate_panels) do
		if id ~= HUDManager.PLAYER_PANEL then
			local settings = KineticHUD:GetSettings()
		else
		end
		panel:_layout_khud_deployables()
--		self:layout_khud_health(params,id) --either of these will work. but i have no reason to pick one over the other. guess i'll die
	end
end

function HUDManager:layout_khud_grenades_team()
	for id,panel in pairs(self._teammate_panels) do
		if id ~= HUDManager.PLAYER_PANEL then
			local settings = KineticHUD:GetSettings()
		else
		end
		panel:_layout_khud_grenades()
--		self:layout_khud_health(params,id) --either of these will work. but i have no reason to pick one over the other. guess i'll die
	end
end
function HUDManager:layout_khud_equipment_team()
	for id,panel in pairs(self._teammate_panels) do
		if id ~= HUDManager.PLAYER_PANEL then
			local settings = KineticHUD:GetSettings()
		else
		end
		panel:_layout_khud_equipment()
		panel:layout_special_equipments()
		--layout equipments existing
--		self:layout_khud_health(params,id) --either of these will work. but i have no reason to pick one over the other. guess i'll die
	end
end

function HUDManager:layout_khud_ties_team()
	for id,panel in pairs(self._teammate_panels) do
		if id ~= HUDManager.PLAYER_PANEL then
			local settings = KineticHUD:GetSettings()
			local align = settings.panel_team_health_align
			local margin = settings.panel_team_health_margin
--			local health_panel = panel._khud_health_panel
			if align == 1 then -- 1 = vertical, 2 = horizontal
				panel:_layout_khud_ties({
					y = settings.panel_team_health_y + ((id - 1) * margin)
				})
			else
				panel:_layout_khud_ties({
					x = settings.panel_team_health_x + ((id - 1) * margin)
				})
			end
		else
			panel:_layout_khud_ties(params)
		end
--		self:layout_khud_health(params,id) --either of these will work. but i have no reason to pick one over the other. guess i'll die
	end
end

function HUDManager:layout_khud_region_team()
	for id,panel in pairs(self._teammate_panels) do
--			local settings = KineticHUD:GetSettings()
		if id == HUDManager.PLAYER_PANEL then
		else
			panel:_layout_khud_region(params)
		end
--		self:layout_khud_health(params,id) --either of these will work. but i have no reason to pick one over the other. guess i'll die
	end
end

function HUDManager:layout_khud_name(params)
	self._teammate_panels[HUDManager.PLAYER_PANEL]:_layout_khud_name(params)
end

function HUDManager:layout_khud_name_team()
	for id,panel in pairs(self._teammate_panels) do
		if id ~= HUDManager.PLAYER_PANEL then
			local settings = KineticHUD:GetSettings()
			local align = settings.panel_team_health_align
			local margin = settings.panel_team_health_margin
--			local health_panel = panel._khud_health_panel
			if align == 1 then -- 1 = vertical, 2 = horizontal
				panel:_layout_khud_name({
--					y = settings.panel_team_name_y + ((id - 1) * margin)
				})
			else
				panel:_layout_khud_name({
--					x = settings.panel_team_name_x + ((id - 1) * margin)
				})
			end
		else
			panel:_layout_khud_name(params)
		end
--		self:layout_khud_health(params,id) --either of these will work. but i have no reason to pick one over the other. guess i'll die
	end
	--local health_panel = self._khud_panels[id]._khud_health_panel
--	self:layout_khud_region_team()
end

function HUDManager:layout_khud_health_team() --layout all teammates' health panels, including main player; good for init
	for id,panel in pairs(self._teammate_panels) do
		if id ~= HUDManager.PLAYER_PANEL then
			local settings = KineticHUD:GetSettings()
			local align = settings.panel_team_health_align or 1
			local margin = settings.panel_team_health_margin
--			local health_panel = panel._khud_health_panel
			if not KineticHUD:UseHealthTeamCustomXY() or align == 1 then -- 1 = vertical, 2 = horizontal
				panel:_layout_khud_health({
					y = settings.panel_team_health_y + ((id - 1) * margin)
				})
			else
				panel:_layout_khud_health({
					x = settings.panel_team_health_x + ((id - 1) * margin)
				})
			end
		else
			panel:_layout_khud_health(params)
		end
		panel:_layout_khud_speaking()
--		self:layout_khud_health(params,id) --either of these will work. but i have no reason to pick one over the other. guess i'll die
	end
	--local health_panel = self._khud_panels[id]._khud_health_panel
	self:layout_khud_name_team()
	self:layout_khud_equipment_team()
	self:layout_khud_deployables_team()
	self:layout_khud_grenades_team()
	self:layout_khud_ties_team()
	self:layout_khud_region_team()
end

function HUDManager:layout_khud_health(params,id) --layout specific teammate's health panel
	id = id or HUDManager.PLAYER_PANEL
	self._teammate_panels[id]:_layout_khud_health(params)
	--local health_panel = self._khud_panels[id]._khud_health_panel
	self:layout_khud_name_team()
	self:layout_khud_equipment_team()
	self:layout_khud_deployables_team()
	self:layout_khud_grenades_team()
	self:layout_khud_ties_team()
	self:layout_khud_region_team()
	self:layout_khud_weapons_panel()
end

function HUDManager:align_khud_health(params) --for teammates only; deprecated
--	self._teammate_panels[HUDManager.PLAYER_PANEL] 
--function HUDTeammate:_align_khud_health(params)
	local settings = KineticHUD:GetSettings()
	params = params or {}
	local x = params.x or settings.panel_team_health_x
	local y = params.y or settings.panel_team_health_y
	local margin = params.margin or settings.panel_team_health_margin
	local align = params.align or settings.panel_team_health_align
	local diamond_scale = params.diamond_scale or settings.panel_team_health_diamond_scale or 1
	local diamond_margin = params.diamond_margin or 3
	local diamond_size = (48 * diamond_scale)
	
	local show_debug = params.show_debug or false
	--this is just for moving teammates' health panels, not your own
	for i,panel in pairs(self._teammate_panels) do 
		if i ~= HUDManager.PLAYER_PANEL then 		
			local health_panel = panel._khud_health_panel
			if align == 1 then -- 1 = vertical, 2 = horizontal
				health_panel:set_x(x)
				health_panel:set_y(y + ((i - 1) * margin))
			else
				health_panel:set_x(x + ((i - 1) * margin))
				health_panel:set_y(y)
			end
			health_panel:child("debug_health_panel"):set_visible(show_debug)
			local condition_panel = health_panel:child("condition_panel")
				
			condition_panel:set_y((health_panel:h() - condition_panel:h()) / 2)
			condition_panel:child("condition_diamond_bg"):set_size(diamond_size + diamond_margin,diamond_size + diamond_margin)
			condition_panel:child("condition_diamond"):set_size(diamond_size,diamond_size)
			condition_panel:child("condition_icon"):set_size(diamond_size,diamond_size)

			condition_panel:child("condition_icon"):set_x(condition_panel:child("condition_diamond"):x())
			condition_panel:child("condition_icon"):set_y(condition_panel:child("condition_diamond"):y())
		end
	end
end

function HUDManager:layout_khud_chat(params)
	params = params or {}
	local settings = KineticHUD:GetSettings()
	local chat = self._hud_chat
	local show_debug = params.show_debug or false
	chat._panel:child("debug_chat"):set_visible(show_debug)
	local x = params.x or settings.panel_chat_x or 0
	local y = params.y or settings.panel_chat_y or 0
	chat._panel:set_x(x)
	chat._panel:set_y(y)
	if params.scale then 
		chat:set_khud_chat_scale(params.scale)
	end
end

function HUDManager:set_khud_compass(params)
	KineticHUD:c_log("Using deprecated function name set_khud_compass")
	self:layout_khud_compass(params)
end
function HUDManager:layout_khud_compass(params)
	params = params or {}
	local settings = KineticHUD:GetSettings()
	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
	local compass = hud._khud_compass
	local strip = compass:child("compass_strip")

	local alpha = params.alpha or settings.panel_compass_alpha or 1
	local w = params.w or settings.panel_compass_w or 1000
--	local h = params.h or settings.panel_compass_h or 16
	local x = params.x or settings.panel_compass_x or 0
	local y = params.y or settings.panel_compass_y or 64
	
	compass:set_alpha(alpha)
	compass:set_visible(KineticHUD:UseCompass())
	
	compass:set_x(x)
	compass:set_y(y)
	compass:set_w(w)
--	strip:set_h(h)
end

function HUDManager:toggle_khud_compass(state)
	local hud = self._teammate_panels[HUDManager.PLAYER_PANEL]
	hud._khud_compass:set_visible(state)

end

function HUDManager:show_khud_objectives(toggle)
	local hud = self._hud_objectives._hud_panel:child("objectives_panel")
	hud:child("banner_main"):set_visible(toggle)
	hud:child("banner_sec"):set_visible(toggle)
	hud:child("flash_panel"):set_visible(toggle)
	hud:child("checkbox_panel"):set_visible(toggle)
	hud:child("checkbox_check"):set_visible(toggle)
	hud:child("checkbox_container"):set_visible(toggle)
	hud:child("container_underline"):set_visible(toggle)
	hud:child("heist_name"):set_visible(toggle)
	hud:child("new_objective_text"):set_visible(toggle)
	hud:child("objective_text"):set_visible(toggle)
	hud:child("new_amount_text"):set_visible(toggle)
	self._hud_objectives._bg_box:set_visible(not toggle)
	hud:child("icon_objectivebox"):set_visible(not toggle)
	if toggle then 
		hud:child("objective_text"):set_text(hud:child("new_objective_text"):text())
	else
		hud:child("new_objective_text"):set_text(hud:child("objective_text"):text())
	end
end

--unused/broken right now
function HUDManager:animate_khud_crosshair_kick(kick)
end

function HUDManager:layout_khud_speaking() --not used; only applies to main player
	self._teammate_panels[HUDManager.PLAYER_PANEL]:_layout_khud_speaking()
end


--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
if not MUIMenu or not Figure then return; end
local m_data = MUIMenu:Load();
local num_pl = HUDManager.PLAYER_PANEL;
local tunnel = ArmStatic.tunnel;

local function pdoclass(class, path)
	if not MUIMenu:ClassEnabled(class) then
		return false;
	end
	return ArmStatic.pdoclass(class, path);
end
local function void(f_arr)
	ArmStatic.void(HUDManager, f_arr);
end
local function set_workspace(self)
	local full = MUIMenu._data.mui_workspace == 2;
	local sHud = PlayerBase.PLAYER_INFO_HUD_PD2;
	local fHull = PlayerBase.PLAYER_INFO_HUD_FULLSCREEN_PD2;
	
	self._mui_hud = self:script(full and fHull or sHud);
	self._mui_ws = full and self._workspace or self._saferect;
end

HUDManager._mui_base = {};
HUDManager._mui_path = ModPath;
 
Hooks:Register("HUDManagerSetupPlayerInfoHudPD2");
HUDManager._mui_base._setup_player_info_hud_pd2 = HUDManager._setup_player_info_hud_pd2;
function HUDManager:_setup_player_info_hud_pd2()
	set_workspace(self);
	self._mui_base._setup_player_info_hud_pd2(self);
	Hooks:Call("HUDManagerSetupPlayerInfoHudPD2", self);
end

--------------------- MUI_TEAM ------------------------
if pdoclass("MUITeammate", "lua/mui_team.lua") and
	pdoclass("MUILegend", "lua/mui_legend.lua") and
	pdoclass("AnimatedList", "lua/animated_list.lua") then

	function HUDManager:set_teammate_state(i, state)
		self:set_ai_stopped(i, false)
		self._teammate_panels[i]:set_state(state)
	end
	
	-- 'm fed up with the downed icon bein' a pixel off, AIN'T HAVIN' IT
	local rect = tunnel(tweak_data, "hud_icons", "mugshot_downed", "texture_rect");
	if rect and rect[1] == 240 and rect[2] == 464 then rect[1] = 241; rect[2] = 465; end
	--
	function HUDManager:_create_teammates_panel()
		local hud = self._mui_hud;
		self._hud.teammate_panels_data = self._hud.teammate_panels_data or {};
		self._teammate_panels = {};
		if self._mui_team then
			self._mui_team:destroy();
			self._mui_team = nil;
		end

		local team = AnimatedList:new(hud.panel, { name = "teammates_panel" });
		self._mui_team = team;
		
		for i = 1, num_pl do
			self._hud.teammate_panels_data[i] = {
				taken = false,
				special_equipments = {}
			};
			self._teammate_panels[i] = MUITeammate:new(i, team);
		end
		
		local function align_clbk()
			if not alive(tunnel(self._teammate_panels, self.PLAYER_PANEL, "_panel")) then
				return false;
			end
			if PocoHud3 then team:set_callback(callback(MUITeammate, MUITeammate, "ph_align")); end
			MUITeammate.align_panels();
			return true;
		end
		ArmStatic.retrying_clbk("MUIManagerAlignTeammatesPanel", align_clbk);
	end

	function HUDManager:_create_waiting_legend()
		local hud = self._mui_hud;
		if Network:is_server() then
			self._waiting_legend = MUILegend:new(hud);
		end
	end

	function HUDManager:set_absorb_active(i, absorb_amount)
		self._teammate_panels[i or num_pl]:set_absorb_active(absorb_amount);
	end

	-- 'nother thing'm fed up with is this function bein' called every frame to animate
	-- Just hand me the actual darn value n' let me take care of the animating
	function HUDManager:set_player_armor(data)
		if not self._pl_dmg then
			self._pl_dmg = tunnel(managers, "player", "local_player", "character_damage");
			if self._pl_dmg and not self._pl_dmg._invulnerable then
				setup:add_end_frame_clbk(callback(self, self, "set_player_armor", data));
			end
		else
			local real_armor = self._pl_dmg:get_real_armor();
			if real_armor ~= self._pl_arm then
				self._pl_arm = real_armor;
				data.current = real_armor;
				self:set_teammate_armor(num_pl, data);
			end
			if self._pl_dmg._invulnerable then
				self._pl_dmg = nil;
			end
		end
	end
	--
	
	function HUDManager:set_teammate_revives(i, revives)
		self._teammate_panels[i]:set_revives(revives);
	end

	function HUDManager:hide_player_gear(panel_id)
		local teammate_panel = self._teammate_panels[panel_id];
		if teammate_panel then
			teammate_panel:set_gear_visible(false);
		end
	end
	function HUDManager:show_player_gear(panel_id)
		local teammate_panel = self._teammate_panels[panel_id];
		if teammate_panel then
			teammate_panel:set_gear_visible(true);
		end
	end
	
	function HUDManager:set_ammo_amount(selection_index, max_clip, current_clip, current_left, max_left)
		managers.player:update_synced_ammo_info_to_peers(selection_index, max_clip, current_clip, current_left, max_left)
		self:set_teammate_ammo_amount(HUDManager.PLAYER_PANEL, selection_index, max_clip, current_clip, current_left, max_left)
	end

	function HUDManager:set_teammate_ammo_amount(id, selection_index, max_clip, current_clip, current_left, max_left)
		self._teammate_panels[id]:set_ammo_amount_by_type(selection_index, max_clip, current_clip, current_left, max_left);
	end

	function HUDManager:set_mugshot_voice(id, active)
		if not id or id > #self._teammate_panels then return; end
		self._teammate_panels[id]:set_talking(active);
	end
	HUDManager._mui_base.set_stamina_value = HUDManager.set_stamina_value;
	function HUDManager:set_stamina_value(val)
		self._teammate_panels[num_pl]:set_stamina(val);
	end
	HUDManager._mui_base.set_max_stamina = HUDManager.set_max_stamina;
	function HUDManager:set_max_stamina(val)
		self._teammate_panels[num_pl]:set_max_stamina(val);
	end
end
--------------------- MUI_VOICE ------------------------
if 	pdoclass("MUIVoice", "lua/mui_voice.lua") and
	pdoclass("MUIVoiceItem", "lua/mui_voice_item.lua") then
	Hooks:Add("HUDManagerSetupPlayerInfoHudPD2", "MUIVoice_setup", function(self)
		self:_create_voice_ui();
	end);
	
	function HUDManager:_create_voice_ui()
		if not self._mui_voice then
			local file = io.open( HUDManager._mui_path .. "menus/mui_voice_data.json", "r" );
			if file then
				local file_content = file:read("*all");
				file:close();
				local v_content = json.decode(file_content);
				self._mui_voice = MUIVoice:new(v_content);
			end
		end
	end
end
--------------------- MUI_LABEL ------------------------
if pdoclass("MUILabel", "lua/mui_label.lua") then
	void({"update_name_label_by_peer", "update_vehicle_label_by_id","set_ai_stopped"});
	
	function HUDManager:_add_name_label(data)
		local last_label =  self._hud.name_labels[#self._hud.name_labels];
		local id = (last_label and last_label.id or 0) +1;
		local label = MUILabel:new(id, data);
		table.insert(self._hud.name_labels, label);
		return id;
	end
	function HUDManager:add_vehicle_name_label(data)
		return self:_add_name_label(data);
	end
	function HUDManager:teammate_progress(peer_id, type_index, enabled, tweak_data_id, timer, success)
		local name_label = self:_name_label_by_peer_id(peer_id);
		if name_label then
			name_label:set_action_progress(type_index, enabled, tweak_data_id, timer, success);
		end
		local character_data = managers.criminals:character_data_by_peer_id(peer_id);
		if character_data then
			self._teammate_panels[character_data.panel_id]:teammate_progress(enabled, tweak_data_id, timer, success);
		end
	end
	function HUDManager:align_teammate_name_label(panel)
		local labels = self._hud.name_labels;

		for i=1, #labels do
			local label = labels[i];
			if label.panel == panel then
				return label:resize();
			end
		end
	end
	function HUDManager:set_ai_stopped(panel_id, stop)
		local labels = self._hud.name_labels;
		if not MUILabel._muiLblStop then return; end

		for i=1, #labels do
			local label = labels[i];
			if ArmStatic.tunnel(label, "criminal", "data", "panel_id") == panel_id then
				return label:set_stop(stop);
			end
		end
	end
end
--------------------- MUI_WAYPOINT ------------------------
if pdoclass("MUIWaypoint", "lua/mui_waypoint.lua") then
	
	function HUDManager:add_waypoint(id, data)
		if self._hud.waypoints[id] then
			self:remove_waypoint(id);
		end
		local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2);
		if not hud then self._hud.stored_waypoints[id] = data; return; end
		
		self._hud.waypoints[id] = MUIWaypoint:new(id, hud, data);
	end
	function HUDManager:change_waypoint_icon(id, icon)
		local waypoint = self._hud.waypoints[id];
		if not waypoint then return; end
		waypoint:set_icon(icon);
	end
	function HUDManager:change_waypoint_arrow_color(id, color)
		local waypoint = self._hud.waypoints[id];
		if not waypoint then return; end
		
		waypoint:set_color(color);
	end
	function HUDManager:remove_waypoint(id)
		self._hud.stored_waypoints[id] = nil;
		local waypoint = self._hud.waypoints[id];
		if not waypoint then return; end
		waypoint:remove();
		
		self._hud.waypoints[id] = nil;
	end
	function HUDManager:set_waypoint_timer_pause(id, pause)
		local waypoint = self._hud.waypoints[id];
		if not waypoint then return; end
		waypoint.pause_timer = waypoint.pause_timer + (pause and 1 or -1);
	end

	-- USING
	local clamp, lerp, max, floor, format = math.clamp, math.lerp, math.max, math.floor, string.format;
	local mv3, fade_c = mvector3, ArmStatic.fade_c_animate;
	local vx, vy, vset, vsets, vsub, vnorm, vdot = mv3.x, mv3.y, mv3.set, mv3.set_static, mv3.subtract, mv3.normalize, mv3.dot;
	local wp_pos, wp_dir, wp_dir_normalized = Vector3(), Vector3(), Vector3();
	local wp_cam_forward = Vector3();
	local wp_onscreen_target_pos = Vector3();
	--

	function HUDManager:_update_waypoints(t, dt)
		local waypoints = self._hud.waypoints;
		local _, first_wp = next(waypoints);
		
		local muiAction = MUIWaypoint._muiDistAct;
		local muiRange = MUIWaypoint._muiDistRng;
		local a = muiAction == 2 and 0 or 1;
		local end_a = 1 - a;
		
		local cam = managers.viewport:get_current_camera();
		if not cam or not first_wp then return; end
		local hud_panel = first_wp.parent;
		local ws = self._saferect;
		
		local cam_pos = managers.viewport:get_current_camera_position();
		local cam_rot = managers.viewport:get_current_camera_rotation();
		mrotation.y(cam_rot, wp_cam_forward);
		for id, data in pairs(waypoints) do
			local panel = data.panel;
			local btmp = data.bitmap;
			local arrw = data.arrow;
			local tmrg = data.timer_gui;
			local dist = data.distance;
		
			if data.state <= 2 then
				data.current_position = Vector3(hud_panel:center_x(), hud_panel:center_y());
				panel:set_center_x(data.current_position.x);
				panel:set_center_y(data.current_position.y);
				data.present_timer = data.present_timer - dt;
				if 0 >= data.present_timer then
					data.state = 3;
					data.in_timer = 0;
					if dist then dist:set_visible(true); end
				end
			else
				data.position = data.unit and data.unit:position() or data.position;
				
				vset(wp_pos, ws:world_to_screen(cam, data.position));
				vset(wp_dir, data.position);
				vsub(wp_dir, cam_pos);
				vset(wp_dir_normalized, wp_dir);
				vnorm(wp_dir_normalized);
				local dot = vdot(wp_cam_forward, wp_dir_normalized);
				local dirlen = wp_dir:length();
				if muiAction > 1 then panel:set_alpha( lerp( a, end_a, clamp( (dirlen - muiRange * 10) / (muiRange * 90), 0, 1 ) ) ); end
				if dot < 0 or hud_panel:outside(vx(wp_pos), vy(wp_pos)) then
					if data.state ~= 4 then
						data.state = 4;
						data.off_timer = 0 - (1 - data.in_timer);
						if arrw then arrw:set_visible(true); end
						if dist then dist:set_visible(false); end
						if tmrg then tmrg:set_visible(false); end
					end
					local direction = Vector3();
					local panel_center_x, panel_center_y = hud_panel:center();
					vsets(direction, wp_pos.x - panel_center_x, wp_pos.y - panel_center_y, 0);
					vnorm(direction);
					local distance = data.radius * tweak_data.scale.hud_crosshair_offset_multiplier;
					local target_pos = wp_onscreen_target_pos;
					vsets(target_pos, panel_center_x + vx(direction) * distance, panel_center_y + vy(direction) * distance, 0);
					data.off_timer = clamp(data.off_timer + dt, 0, 1);
					if data.off_timer ~= 1 then
						vset(data.current_position, math.bezier({
							data.current_position,
							data.current_position,
							target_pos,
							target_pos
						}, data.off_timer));
					else
						vset(data.current_position, target_pos);
					end
					local margin = max(btmp:size());
					panel:set_center(vx(data.current_position), vy(data.current_position));
					arrw:set_center(btmp:center_x() + direction.x * margin, btmp:center_y() + direction.y * margin);
					local angle = math.X:angle(direction) * math.sign(direction.y);
					arrw:set_rotation(angle);
				else
					if data.state == 4 then
						data.state = 5;
						arrw:set_visible(false);
						data.in_timer = 0 - (1 - data.off_timer);
						if dist then dist:set_visible(true); end
						if tmrg then tmrg:set_visible(true) end
					end
					if data.in_timer ~= 1 then
						data.in_timer = clamp(data.in_timer + dt, 0, 1);
						vset(data.current_position, math.bezier({
							data.current_position,
							data.current_position,
							wp_pos,
							wp_pos
						}, data.in_timer));
					else
						vset(data.current_position, wp_pos);
					end
					panel:set_center(vx(data.current_position), vy(data.current_position));
					if dist then dist:set_text(format("%.0f", dirlen / 100) .. "m"); end
				end
			end
			
			if tmrg and data.pause_timer == 0 then
				local timer = data.timer -dt;
				data.timer = timer;
				if timer > 0 and timer < data.new_t then
					data.new_t = floor(timer);
					tmrg:set_text(format("%02d", data.new_t));
					if data.new_t <= 10 then
						tmrg:set_color(Color.red);
						fade_c(tmrg, Color.white, 0.5);
					end
				end
			end
		end
	end
end

--------------------- MUI_SUBTITLE ------------------------
if 	pdoclass("MUISubtitle", "lua/mui_subtitle.lua") and
	pdoclass("MUISubtitleItem", "lua/mui_subtitle_item.lua") then
	
	Hooks:Add("HUDManagerSetupPlayerInfoHudPD2", "MUISubtitle_setup", function(self)
		if managers.subtitle then
			managers.subtitle:destroy();
		end
		managers.subtitle = MUISubtitle:new();
	end);

end

--------------------- MUI_SUSPICION ------------------------
if 	pdoclass("MUISuspicion", "lua/mui_suspicion.lua") then
	
	function HUDManager:_create_suspicion()
		local hud = self._mui_hud;
		self._hud_suspicion = MUISuspicion:new(hud, self._sound_source);
	end

end

--------------------- MUI_PRESENT ------------------------
if 	pdoclass("MUIPresent", "lua/mui_present.lua") and
	pdoclass("MUIPresentItem", "lua/mui_present_item.lua") then
	
	function HUDManager:_create_present_panel()
		local hud = self._mui_hud;
		self._hud_presenter = MUIPresent:new(hud);
	end
end
--------------------- MUI_HINT ------------------------
if 	pdoclass("MUIHint", "lua/mui_hint.lua") and
	pdoclass("MUIPresentItem", "lua/mui_present_item.lua")  then
	void({"stop_hint"});
	
	function HUDManager:_create_hint()
		local hud = self._mui_hud;
		self._hud_hint = MUIHint:new(hud);
	end
	function HUDManager:show_hint(attr)
		self._hud_hint:show(attr);
	end
end

--------------------- MUI_CHAT ------------------------
if pdoclass("MUIChat", "lua/mui_chat.lua") then
	
	function HUDManager:_create_hud_chat()
		local hud = self._mui_hud;
		local ws = self._mui_ws;
		if self._hud_chat_ingame then self._hud_chat_ingame:remove(); end
		self._hud_chat_ingame = MUIChat:new(ws, hud);
		self._hud_chat = self._hud_chat_ingame;
		self:_create_hud_chat_access();
	end
	
	function HUDManager:_create_hud_chat_access()
		local full = MUIMenu._data.mui_workspace == 2;
		local hud = self:script(full and IngameAccessCamera.GUI_FULLSCREEN or 
				IngameAccessCamera.GUI_SAFERECT);
		local ws = self._mui_ws;
		if self._hud_chat_access then self._hud_chat_access:remove(); end
		self._hud_chat_access = MUIChat:new(ws, hud);
	end
end
--------------------- MUI_INTERACT ------------------------
if pdoclass("MUIInteract", "lua/mui_interact.lua") then
	void({"_create_progress_timer"});
		
	function HUDManager:_create_interaction()
		local hud = self._mui_hud;
		self._hud_interaction = MUIInteract:new(hud);
	end

	function HUDManager:show_progress_timer(data)
		self._hud_interaction:show_interact(data);
	end
	function HUDManager:remove_progress_timer()
		self._hud_interaction:remove_interact();
	end
	function HUDManager:show_progress_timer_bar(current, total)
		self._hud_interaction:show_interaction_bar(current, total);
	end
	function HUDManager:set_progress_timer_bar_width(current, total)
		self._hud_interaction:set_interaction_bar_width(current, total);
	end
	function HUDManager:set_progress_timer_bar_valid(valid, text_id)
		self._hud_interaction:set_bar_valid(valid, text_id);
	end
	function HUDManager:hide_progress_timer_bar(complete)
		self._hud_interaction:hide_interaction_bar(complete);
	end

	function HUDManager.pd_start_progress(self, current, total, msg, icon_id)
		self._hud_interaction:animate(managers.localization:text(msg), current, total);
	end

	function HUDManager:pd_stop_progress()
		local intrct = self._hud_interaction;
		intrct:hide_interaction_bar(intrct._circle:color().red >= 1);
		intrct:remove_interact();
	end
end
--------------------- MUI_BAG ------------------------
if pdoclass("MUIBag", "lua/mui_bag.lua") then
	if MUITeammate then
		void({"_create_temp_hud"});
	end
	Hooks:Add("HUDManagerSetupPlayerInfoHudPD2", "MUIBag_setup", function(self)
		local hud = self._mui_hud;
		self._mui_bag = MUIBag:new(hud);
	end);
	
	function HUDManager:temp_show_carry_bag(carry_id, value)
		self._mui_bag:show(carry_id, value);
	end

	function HUDManager:temp_hide_carry_bag()
		self._mui_bag:hide();
	end
end
--------------------- MUI_CUSTODY ---------------------
if	pdoclass("MUICustody", "lua/mui_custody.lua") and
	pdoclass("AnimatedList", "lua/animated_list.lua") then
	
	function HUDManager:_create_custody_hud()
		local hud = self._mui_hud;
		self._hud_player_custody = MUICustody:new(hud);
	end

	function HUDManager:set_custody_respawn_time(time)
		self._hud_player_custody:set_respawn_time(time);
	end
	function HUDManager:set_custody_timer_visibility(visible)
		if not visible then
			self._hud_player_custody:set_respawn_time(0);
		end
	end
	function HUDManager:set_custody_civilians_killed(amount)
		self._hud_player_custody:set_civilians_killed(amount);
	end
	function HUDManager:set_custody_trade_delay(time)
		self._hud_player_custody:set_trade_delay(time);
	end

	function HUDManager:set_custody_trade_delay_visible(visible)
		if not visible then
			self._hud_player_custody:set_trade_delay(0);
		end
	end

	function HUDManager:set_custody_negotiating_visible(visible)
		if visible then self._hud_player_custody:set_trade_state(false); end
	end
	function HUDManager:set_custody_can_be_trade_visible(visible)
		if visible then self._hud_player_custody:set_trade_state(true); end
	end
end
--------------------- MUI_STATS ----------------------
if pdoclass("MUIStats", "lua/mui_stats.lua") then
	void({ "show_casing","hide_casing","complete_sub_objective","remind_objective","complete_objective",
			"_setup_stats_screen","_create_objectives","_create_assault_corner","_create_heist_timer" });
		
	Hooks:Add("HUDManagerSetupPlayerInfoHudPD2", "MUIStats_setup", function(self)
		self._hud_statsscreen = MUIStats:new();
		self._hud_assault_corner = self._hud_statsscreen;
		self._hud_heist_timer = self._hud_statsscreen;
	end);
	
	function HUDManager:show_stats_screen()
		local safe = self.STATS_SCREEN_SAFERECT;
		local full = self.STATS_SCREEN_FULLSCREEN;
		if not self:exists(safe) then
			self:load_hud(full, false, true, false, {});
			self:load_hud(safe, false, true, true, {});
		end
		self._hud_statsscreen:show();
		self._showing_stats_screen = true;
	end

	function HUDManager:feed_heist_time(time)
		if self._hud_statsscreen:no_return() then return; end
		self._hud_statsscreen:set_time(time);
	end
	function HUDManager:modify_heist_time(time)
		self._hud_statsscreen:modify_time(time)
	end
	function HUDManager:loot_value_updated()
		self._hud_statsscreen:loot_value_updated();
	end

	function HUDManager:activate_objective(data)
		self._hud_statsscreen:set_objective(data);
	end

	function HUDManager:update_amount_objective(data)
		self._hud_statsscreen:set_objective_amount(data);
	end
	function HUDManager:feed_point_of_no_return_timer(time, is_inside)
		self._hud_statsscreen:set_time(time);
	end
	function HUDManager:show_point_of_no_return_timer()
		self._hud_statsscreen:set_no_return(true);
	end
	function HUDManager:hide_point_of_no_return_timer()
		self._hud_statsscreen:set_no_return(false);
	end
	function HUDManager:flash_point_of_no_return_timer(beep)
		if beep then
			self._sound_source:post_event("last_10_seconds_beep");
		end
	end
elseif m_data.mui_begin_hidden == true then
	Hooks:Add("HUDManagerSetupPlayerInfoHudPD2", "MUIToggleInfo", function(self)
		ArmStatic.toggle_info(true);
	end);
end
--------------------- MASK_OFF_STATE ---------------------
if m_data.mui_mask_instruct ~= true then
	Hooks:Add("HUDManagerSetupPlayerInfoHudPD2", "MUIMaskInstruct", function(self)
		local hook_function = function(self)
			managers.hud:hide(self._MASK_OFF_HUD)
		end
		Hooks:PostHook(IngameMaskOffState, "at_enter", "MUIMaskInstruct_at_enter", hook_function);
	end);
end
----------------------------------------------------------

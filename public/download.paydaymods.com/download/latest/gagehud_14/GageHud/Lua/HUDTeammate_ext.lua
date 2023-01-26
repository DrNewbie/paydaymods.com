if not mod_collection then
	return
end

HUDTeammate._PLAYER_PANEL_SCALE = 0.85
HUDTeammate._TEAMMATE_PANEL_SCALE = 0.80
HUDTeammate._NAME_ANIMATE_SPEED = 90

HUDTeammate._INTERACTION_TEXTS = {
	big_computer_server = "USING COMPUTER",
--[[
	ammo_bag = "Using ammo bag",
	c4_bag = "Taking C4",
	c4_mission_door = "Planting C4 (equipment)",
	c4_x1_bag = "Taking C4",
	connect_hose = "Connecting hose",
	crate_loot = "Opening crate",
	crate_loot_close = "Closing crate",
	crate_loot_crowbar = "Opening crate",
	cut_fence = "Cutting fence",
	doctor_bag = "Using doctor bag",
	drill = "Placing drill",
	drill_jammed = "Repairing drill",
	drill_upgrade = "Upgrading drill",
	ecm_jammer = "Placing ECM jammer",
	first_aid_kit = "Using first aid kit",
	free = "Uncuffing",
	grenade_briefcase = "Taking grenade",
	grenade_crate = "Opening grenade case",
	hack_suburbia_jammed = "Resuming hack",
	hold_approve_req = "Approving request",
	hold_close = "Closing door",
	hold_close_keycard = "Closing door (keycard)",
	hold_download_keys = "Starting hack",
	hold_hack_comp = "Starting hack",
	hold_open = "Opening door",
	hold_open_bomb_case = "Opening bomb case",
	hold_pku_disassemble_cro_loot = "Disassembling bomb",
	hold_remove_armor_plating = "Removing plating",
	hold_remove_ladder = "Taking ladder",
	hold_take_server_axis = "Taking server",
	hostage_convert = "Converting enemy",
	hostage_move = "Moving hostage",
	hostage_stay = "Moving hostage",
	hostage_trade = "Trading hostage",
	intimidate = "Cable tying civilian",
	open_train_cargo_door = "Opening door",
	pick_lock_easy_no_skill = "Picking lock",
	requires_cable_ties = "Cable tying civilian",
	revive = "Reviving",
	sentry_gun_refill = "Refilling sentry gun",
	shaped_charge_single = "Planting C4 (deployable)",
	shaped_sharge = "Planting C4 (deployable)",
	shape_charge_plantable = "Planting C4 (equipment)",
	shape_charge_plantable_c4_1 = "Planting C4 (equipment)",
	shape_charge_plantable_c4_x1 = "Planting C4 (equipment)",
	trip_mine = "Placing trip mine",
	uload_database_jammed = "Resuming hack",
	use_ticket = "Using ticket",
	votingmachine2 = "Starting hack",
	votingmachine2_jammed = "Resuming hack",
	methlab_caustic_cooler = "Cooking meth (caustic soda)",
	methlab_gas_to_salt = "Cooking meth (hydrogen chloride)",
	methlab_bubbling = "Cooking meth (muriatic acid)",
	money_briefcase = "Opening briefcase",
	pku_barcode_downtown = "Taking barcode (downtown)",
	pku_barcode_edgewater = "Taking barcode (?)",	--TODO: Location
	gage_assignment = "Taking courier package",
	stash_planks = "Boarding window",
	stash_planks_pickup = "Taking planks",
	taking_meth = "Bagging loot",
	hlm_connect_equip = "Connecting cable",
]]
}

local function debug_check_tweak_data(tweak_data_id)
	if (rawget(_G, "DEBUG_MODE") ~= nil) and tweak_data_id and tweak_data.interaction[tweak_data_id] and tweak_data.interaction[tweak_data_id].timer and tweak_data.interaction[tweak_data_id].timer > 1 then
		if not (tweak_data.interaction[tweak_data_id].action_text_id or HUDTeammate._INTERACTION_TEXTS[tweak_data_id]) then
			debug_log("interactions.log", "%s - %s - %s\n", tweak_data_id, managers.job:current_level_id(), tweak_data.interaction[tweak_data_id].timer)
		end
	end
end

function HUDTeammate:init(i, parent, is_player)
	HUDTeammate._TEAMMATEPANELS = HUDTeammate._TEAMMATEPANELS or 0
	self._parent = parent
	self._id = i
	self._main_player = is_player and true or false
	self._timer = 0
	self._special_equipment = {}
	self._deployable_amount = 0
	self._cable_ties_amount = 0
	self._grenades_amount = 0
	
	if self._main_player then
		self:_create_player_panel()
	else
		self:_create_teammate_panel()
		HUDTeammate._TEAMMATEPANELS = HUDTeammate._TEAMMATEPANELS + 1
	end

	self:nullify_downs()
	self:reset_kill_count()
end

function HUDTeammate:update_dr()
	local dr = 3
	if self._id == HUDManager.PLAYER_PANEL and managers.groupai:state():whisper_mode() then
		--log("Player")
		--log(tostring(self._id) .. tostring(HUDManager.PLAYER_PANEL .. tostring(managers.groupai:state():whisper_mode())))
		self._health_panel:child("detection_risk_indicator"):set_alpha(1)
		self._health_panel:child("detection_risk_indicator"):set_font_size(16)
		dr = tonumber(string.format("%.0f", managers.blackmarket:get_suspicion_offset_of_local(75)))
	elseif self:peer_id() == nil or not managers.groupai:state():whisper_mode() and self._id ~= HUDManager.PLAYER_PANEL then
		--log("Bot")
		self._health_panel:child("detection_risk_indicator"):set_alpha(0)
	else
		--log("Peer")
		self._health_panel:child("detection_risk_indicator"):set_alpha(1)
		dr = tonumber(string.format("%.0f", managers.blackmarket:get_suspicion_offset_of_peer(managers.network:session():peer(self:peer_id()), 75)))
	end
	self._health_panel:child("detection_risk_indicator"):set_text("" .. tostring(dr))
	local r = (dr-3)/72
	local g = 0.8-((dr-3)/72)
	local b = 1-((dr-3)/72)
	self._health_panel:child("detection_risk_indicator"):set_color(Color(1, r, g, b))
end

function HUDTeammate:_create_player_panel()
	local scale = HUDTeammate._PLAYER_PANEL_SCALE
	self:_create_main_panel(575 + 4 * 5 * scale, 80, scale)
	self:_create_health_panel(60, 60, scale)
	self:_create_stamina_panel(15, 60, scale)
	self:_create_weapons_panel(360, 60, scale)
	self:_create_equipment_panel(60, 80, scale)
	self:_create_special_equipment_panel(80, 80, scale)
	self:_create_carry_panel(330, 20, scale)
	self:_create_kills_panel(160, 20, scale)
	self:_create_downs_panel(25, 20, scale)
	self:_create_interact_panel_new()	--Overlays weapon panel
	
	self._health_panel:set_left(0)
	self._health_panel:set_bottom(self._panel:h())
	self._stamina_panel:set_left(self._health_panel:right() + 5 * scale)
	self._stamina_panel:set_bottom(self._panel:h())
	self._weapons_panel:set_left(self._stamina_panel:right() + 5 * scale)
	self._weapons_panel:set_bottom(self._panel:h())
	self._equipment_panel:set_left(self._weapons_panel:right() + 5 * scale)
	self._equipment_panel:set_bottom(self._panel:h())
	self._special_equipment_panel:set_left(self._equipment_panel:right() + 5 * scale)
	self._special_equipment_panel:set_bottom(self._panel:h())
	self._kills_panel:set_right(self._weapons_panel:right())
	self._kills_panel:set_bottom(self._weapons_panel:top())
	self._downs_panel:set_right(self._weapons_panel:right() - self._kills_panel:w() - 5)
	self._downs_panel:set_bottom(self._weapons_panel:top())
	self._carry_panel:set_left(0)
	self._carry_panel:set_bottom(self._weapons_panel:top())
	self._interact_panel:set_left(self._weapons_panel:left())
	self._interact_panel:set_top(self._weapons_panel:top())
	self:update_dr(16)
	self._panel:set_center(self._parent:w() / 2, 0)
	self._panel:set_bottom(self._parent:h())
end

function HUDTeammate:_create_teammate_panel()
	local scale = HUDTeammate._TEAMMATE_PANEL_SCALE
	local label_height = 20 * scale
	
	self:_create_main_panel(388 + 2 * 5 * scale, 85, scale)
	self:_create_health_panel(45, 45, scale)
	self:_create_weapons_panel(243, 45, scale)
	self:_create_special_equipment_panel(100, 85, scale)
	local w_h_width = self._health_panel:w() + self._weapons_panel:w()
	self:_create_equipment_panel(w_h_width * 0.375, label_height, 1)
	self:_create_carry_panel(w_h_width * 0.45-25, label_height, 1)
	self:_create_kills_panel(w_h_width * 0.3, label_height, 1)
	self:_create_name_panel(w_h_width * 0.625, label_height, 1)
	self:_create_latency_panel(w_h_width * 0.25, label_height, 1)
	--self:_create_interact_panel()
	self:_create_interact_panel_new()	--Overlays weapon panel
	
	self._kills_panel:set_left(0)
	self._kills_panel:set_bottom(self._panel:h())

	if PocoHud3 ~= nil then
		--log("PocoHud3 enabled")
		self:_create_downs_panel(25, 20, scale)
		self._downs_panel:set_left(self._kills_panel:right())
		self._downs_panel:set_bottom(self._panel:h())
		self._latency_panel:set_left(self._downs_panel:right())
	else
		self._latency_panel:set_left(self._kills_panel:right())
	end

	self._latency_panel:set_bottom(self._panel:h())
	self._carry_panel:set_left(self._latency_panel:right())
	self._carry_panel:set_bottom(self._panel:h())
	self._health_panel:set_left(0)
	self._health_panel:set_bottom(self._kills_panel:top())
	self._weapons_panel:set_left(self._health_panel:right() + 5 * scale)
	self._weapons_panel:set_bottom(self._kills_panel:top())
	self._equipment_panel:set_left(self._health_panel:w() + self._weapons_panel:w() - self._equipment_panel:w())
	self._equipment_panel:set_bottom(self._weapons_panel:top())
	self._special_equipment_panel:set_left(self._weapons_panel:right() + 5 * scale)
	self._special_equipment_panel:set_bottom(self._panel:h())
	self._name_panel:set_left(0)
	self._name_panel:set_bottom(self._weapons_panel:top())
	--self._interact_panel:set_left(self._health_panel:left())
	--self._interact_panel:set_top(self._health_panel:top())
	self._interact_panel:set_left(self._weapons_panel:left())
	self._interact_panel:set_top(self._weapons_panel:top())
	
	local total_height = self._name_panel:h() + self._health_panel:h() + self._kills_panel:h() + 10
	self._panel:set_left(0)
	self._panel:set_bottom(self._parent:h() - HUDTeammate._TEAMMATEPANELS * total_height)
end

function HUDTeammate:_create_main_panel(width, height, scale)
	scale = scale or 1
	width = width * scale
	height = height * scale

	self._panel = self._parent:panel({
		name = "teammate_panel_" .. self._id,
		visible = false,
		w = width,
		h = height,
	})
	--[[
	self._panel:rect({	--TEMPORARY
		blend_mode = "normal",
		color = tweak_data.chat_colors[self._id] or Color.white,
		alpha = 0.10,
		h = self._panel:h(),
		w = self._panel:w(),
		layer = -10,
	})]]
end

function HUDTeammate:_create_health_panel(width, height, scale)
	scale = scale or 1
	width = width * scale
	height = height * scale

	self._health_panel = self._panel:panel({
		name = "radial_health_panel",
		h = height,
		w = width,
	})

	local health_panel_bg = self._health_panel:bitmap({
		name = "radial_bg",
		texture = "guis/textures/pd2/hud_radialbg",
		w = self._health_panel:w(),
		h = self._health_panel:h(),
		layer = 0,
	})
	
	local radial_health = self._health_panel:bitmap({
		name = "radial_health",
		texture = "guis/textures/pd2/hud_health",
		texture_rect = { 64, 0, -64, 64 },
		render_template = "VertexColorTexturedRadial",
		blend_mode = "add",
		color = Color(1, 1, 0, 0),
		w = self._health_panel:w(),
		h = self._health_panel:h(),
		layer = 2,
	})
	
	local radial_shield = self._health_panel:bitmap({
		name = "radial_shield",
		texture = "guis/textures/pd2/hud_shield",
		texture_rect = { 64, 0, -64, 64 },
		render_template = "VertexColorTexturedRadial",
		blend_mode = "add",
		color = Color(1, 1, 0, 0),
		w = self._health_panel:w(),
		h = self._health_panel:h(),
		layer = 1
	})
	
	local detection_risk_indicator = self._health_panel:text({
		name = "detection_risk_indicator",
		text = "75",
		color = Color(1, 1, 0, 0),
		blend_mode = "normal",
		layer = 1,
		w = self._health_panel:w(),
		h = self._health_panel:h(),
		vertical = "center",
		align = "center",
		font_size = 11,
		font = tweak_data.menu.pd2_medium_font
	})
	
	local damage_indicator = self._health_panel:bitmap({
		name = "damage_indicator",
		texture = "guis/textures/pd2/hud_radial_rim",
		blend_mode = "add",
		color = Color(1, 1, 1, 1),
		alpha = 0,
		w = self._health_panel:w(),
		h = self._health_panel:h(),
		layer = 1
	})
	local radial_custom = self._health_panel:bitmap({
		name = "radial_custom",
		texture = "guis/textures/pd2/hud_swansong",
		texture_rect = { 0, 0, 64, 64 },
		render_template = "VertexColorTexturedRadial",
		blend_mode = "add",
		color = Color(1, 0, 0, 0),
		visible = false,
		w = self._health_panel:w(),
		h = self._health_panel:h(),
		layer = 2
	})
	
	self._condition_icon = self._health_panel:bitmap({
		name = "condition_icon",
		layer = 4,
		visible = false,
		color = Color.white,
		w = self._health_panel:w(),
		h = self._health_panel:h(),
	})
	self._condition_timer = self._health_panel:text({
		name = "condition_timer",
		visible = false,
		layer = 5,
		color = Color.white,
		w = self._health_panel:w(),
		h = self._health_panel:h(),
		align = "center",
		vertical = "center",
		font_size = self._health_panel:h() * 0.5,
		font = tweak_data.hud_players.timer_font
	})
	--[[
	if self._main_player then
		self._stamina_bar = self._health_panel:bitmap({
			name = "radial_stamina",
			texture = "guis/textures/pd2/hud_shield",
			texture_rect = { 64, 0, -64, 64 },
			render_template = "VertexColorTexturedRadial",
			blend_mode = "add",
			color = Color(1, 1, 0, 0),
			w = self._health_panel:w() * 0.5,
			h = self._health_panel:h() * 0.5,
			layer = 5
		})
		self._stamina_bar:set_center(self._health_panel:w() / 2, self._health_panel:h() / 2)
		
		self._stamina_line = self._health_panel:rect({
			color = Color.red,
			w = self._health_panel:w() * 0.10,
			h = 1,
			layer = 10,
		})
		self._stamina_line:set_center(self._health_panel:w() / 2, self._health_panel:h() / 2)
	end
	]]
end

function HUDTeammate:set_health(data)
	local radial_health = self._health_panel:child("radial_health")
	local red = data.current / data.total
	if red < radial_health:color().red then
		self:_damage_taken()
	end
	radial_health:set_color(Color(1, red, 1, 1))
end

function HUDTeammate:set_armor(data)
	local radial_shield = self._health_panel:child("radial_shield")
	local red = data.current / data.total
	if red < radial_shield:color().red then
		self:_damage_taken()
	end
	radial_shield:set_color(Color(1, red, 1, 1))
end

function HUDTeammate:_damage_taken()
	local damage_indicator = self._health_panel:child("damage_indicator")
	damage_indicator:stop()
	damage_indicator:animate(callback(self, self, "_animate_damage_taken"))
end

function HUDTeammate:set_condition(icon_data, text)
	if icon_data == "mugshot_normal" then
		self._condition_icon:set_visible(false)
	else
		self._condition_icon:set_visible(true)
		local icon, texture_rect = tweak_data.hud_icons:get_icon_data(icon_data)
		self._condition_icon:set_image(icon, texture_rect[1], texture_rect[2], texture_rect[3], texture_rect[4])
	end
end

function HUDTeammate:set_custom_radial(data)
	local radial_custom = self._health_panel:child("radial_custom")
	local red = data.current / data.total
	radial_custom:set_color(Color(1, red, 1, 1))
	radial_custom:set_visible(red > 0)
end

function HUDTeammate:start_timer(time)
	self._timer_paused = 0
	self._timer = time
	self._condition_timer:set_font_size(self._health_panel:h() * 0.5)
	self._condition_timer:set_color(Color.white)
	self._condition_timer:stop()
	self._condition_timer:set_visible(true)
	self._condition_timer:animate(callback(self, self, "_animate_timer"))
end

function HUDTeammate:stop_timer()
	if alive(self._panel) then
		self._condition_timer:set_visible(false)
		self._condition_timer:stop()
	end
end

function HUDTeammate:set_pause_timer(pause)
	if not alive(self._panel) then
		return
	end
	--self._condition_timer:set_visible(false)
	self._condition_timer:stop()
end

function HUDTeammate:is_timer_running()
	return self._condition_timer:visible()
end

function HUDTeammate:_create_stamina_panel(width, height, scale)
	scale = scale or 1
	width = width * scale
	height = height * scale

	self._stamina_panel = self._panel:panel({
		name = "stamina_panel",
		h = height,
		w = width,
	})
	
	local stamina_bar_outline = self._stamina_panel:bitmap({
		name = "stamina_bar_outline",
		texture = "guis/textures/hud_icons",
		texture_rect = { 252, 240, 12, 48 },
		color = Color.white,
		w = width,
		h = height,
		layer = 10,
	})
	self._stamina_bar_max_h = stamina_bar_outline:h() * 0.96
	self._default_stamina_color = Color(0.7, 0.8, 1.0)
	
	local stamina_bar = self._stamina_panel:rect({
		name = "stamina_bar",
		blend_mode = "normal",
		color = self._default_stamina_color,
		alpha = 0.75,
		h = self._stamina_bar_max_h,
		w = stamina_bar_outline:w() * 0.9,
		layer = 5,
	})
	stamina_bar:set_center(stamina_bar_outline:center())
	
	local bar_bg = self._stamina_panel:gradient({
		layer = 1,
		gradient_points = { 0, Color.white:with_alpha(0.10), 1, Color.white:with_alpha(0.40) },
		h = stamina_bar:h(),
		w = stamina_bar:w(),
		blend_mode = "sub",
		orientation = "vertical",
		layer = 10,
	})
	bar_bg:set_center(stamina_bar:center())
	
	local stamina_threshold = self._stamina_panel:rect({
		name = "stamina_threshold",
		color = Color.red,
		w = stamina_bar:w(),
		h = 2,
		layer = 8,
	})
	stamina_threshold:set_center(stamina_bar:center())
end

function HUDTeammate:set_max_stamina(value)
	if value ~= self._max_stamina then
		self._max_stamina = value
		local stamina_bar = self._stamina_panel:child("stamina_bar")
		
		local offset = stamina_bar:h() * (tweak_data.player.movement_state.stamina.MIN_STAMINA_THRESHOLD / self._max_stamina)
		self._stamina_panel:child("stamina_threshold"):set_bottom(stamina_bar:bottom() - offset + 1)
	end
end

function HUDTeammate:set_current_stamina(value)
	local stamina_bar = self._stamina_panel:child("stamina_bar")
	local stamina_bar_outline = self._stamina_panel:child("stamina_bar_outline")
	
	stamina_bar:set_h(self._stamina_bar_max_h * (value / self._max_stamina))
	stamina_bar:set_bottom(0.5 * (stamina_bar_outline:h() + self._stamina_bar_max_h))
	if value <= tweak_data.player.movement_state.stamina.MIN_STAMINA_THRESHOLD and not self._animating_low_stamina then
		self._animating_low_stamina = true
		stamina_bar:animate(callback(self, self, "_animate_low_stamina"), stamina_bar_outline)
	elseif value > tweak_data.player.movement_state.stamina.MIN_STAMINA_THRESHOLD and self._animating_low_stamina then
		self._animating_low_stamina = nil
	end
end

function HUDTeammate:set_storted_health_max(stored_health_ratio)
    --Don't care!
end
function HUDTeammate:set_stored_health(stored_health_ratio)
    --Don't care!
end

function HUDTeammate:_create_weapons_panel(width, height, scale)
	local function populate_weapon_panel(panel)
		if self._main_player then
			local bg_box = HUDBGBox_create(panel, {
					w = panel:w(),
					h = panel:h(),
				}, {})
		end
		
		local icon = panel:bitmap({
			name = "icon",
			blend_mode = "normal",
			visible = false,
			w = panel:h() * 2,
			h = panel:h(),
			layer = 10,
		})
		
		local size = panel:h() * 0.25
		local silencer_icon = panel:bitmap({
			name = "silencer_icon",
			texture = "guis/textures/pd2/blackmarket/inv_mod_silencer",
			blend_mode = "normal",
			visible = false,
			w = size,
			h = size,
			layer = 11,
		})
		silencer_icon:set_bottom(icon:bottom())
		silencer_icon:set_right(icon:right())
		
		local ammo_text_width = (panel:w() - icon:w()) * (self._main_player and 0.65 or 1)
		
		local ammo_clip = panel:text({
			name = "ammo_clip",
			text = "000",
			color = Color.white,
			blend_mode = "normal",
			layer = 1,
			w = ammo_text_width,
			h = height * 0.55,
			vertical = "center",
			align = "right",
			font_size = height * 0.55,
			font = tweak_data.hud_players.ammo_font
		})
		ammo_clip:set_top(icon:top())
		ammo_clip:set_left(icon:right())
		
		local ammo_total = panel:text({
			name = "ammo_total",
			text = "000",
			color = Color.white,
			blend_mode = "normal",
			layer = 1,
			w = ammo_text_width,
			h = height * 0.45,
			vertical = "center",
			align = "right",
			font_size = height * 0.45,
			font = tweak_data.hud_players.ammo_font
		})
		ammo_total:set_bottom(icon:bottom())
		ammo_total:set_left(icon:right())
		
		if self._main_player then
			local weapon_selection_panel = panel:panel({
				name = "weapon_selection",
				layer = 1,
				w = panel:w() - ammo_clip:w() - icon:w(),
				h = height,
			})
			weapon_selection_panel:set_bottom(panel:h())
			weapon_selection_panel:set_left(ammo_total:right())
			
			local fire_modes = {
				{ name = "auto_fire", abbrev = "A" },
				{ name = "single_fire", abbrev = "S" },
			}
			if HUDManager._USE_BURST_MODE then
				table.insert(fire_modes, 2, { name = "burst_fire", abbrev = "B" })
			end
			
			local weapon_selection_bg = weapon_selection_panel:rect({
				blend_mode = "normal",
				color = Color.white,
				h = weapon_selection_panel:h() * math.clamp(#fire_modes * 0.25, 0.25, 1),
				w = weapon_selection_panel:w() * 0.65,
				layer = 1,
			})
			weapon_selection_bg:set_center(weapon_selection_panel:w() / 2, weapon_selection_panel:h() / 2)

			for i, data in ipairs(fire_modes) do
				local text = weapon_selection_panel:text({
					name = data.name,
					text = data.abbrev,
					color = Color.black,
					blend_mode = "normal",
					layer = 10,
					alpha = 0.75,
					w = weapon_selection_bg:w(),
					h = weapon_selection_bg:h() / #fire_modes,
					vertical = "center",
					align = "center",
					font_size = weapon_selection_bg:h() / #fire_modes,
					font = tweak_data.hud_players.ammo_font
				})
				text:set_center(weapon_selection_bg:center())
				text:set_bottom(weapon_selection_bg:bottom() - text:h() * (i-1))
			end
		end
	end
	

	scale = scale or 1
	width = width * scale
	height = height * scale
	
	self._weapons_panel = self._panel:panel({
		name = "weapons_panel",
		h = height,
		w = width,
	})
	
	self._weapons_panel:rect({
		name = "bg",
		blend_mode = "normal",
		color = Color.black,
		alpha = 0.25,
		h = self._weapons_panel:h(),
		w = self._weapons_panel:w(),
		layer = -1,
	})
	
	local primary_weapon_panel = self._weapons_panel:panel({
		name = "primary_weapon_panel",
		h = self._weapons_panel:h(),
		w = self._weapons_panel:w() * 0.5,
		alpha = 0.25,
	})
	
	local secondary_weapon_panel = self._weapons_panel:panel({
		name = "secondary_weapon_panel",
		h = self._weapons_panel:h(),
		w = self._weapons_panel:w() * 0.5,
		alpha = 0.25,
	})
	
	populate_weapon_panel(primary_weapon_panel)
	populate_weapon_panel(secondary_weapon_panel)
	secondary_weapon_panel:set_right(self._weapons_panel:w())
	self:recreate_weapon_firemode()
end

function HUDTeammate:recreate_weapon_firemode()
	if self._main_player then
		local weapon = managers.blackmarket:equipped_primary()
		local panel = self._weapons_panel:child("primary_weapon_panel")
		self:_create_weapon_firemode(weapon, panel, 2)
		
		weapon = managers.blackmarket:equipped_secondary()
		panel = self._weapons_panel:child("secondary_weapon_panel")
		self:_create_weapon_firemode(weapon, panel, 1)
	end
end

function HUDTeammate:_create_weapon_firemode(weapon, panel, id)		
	local weapon_tweak_data = tweak_data.weapon[weapon.weapon_id]
	local fire_mode = weapon_tweak_data.FIRE_MODE
	local can_toggle_firemode = weapon_tweak_data.CAN_TOGGLE_FIREMODE
	local locked_to_auto = managers.weapon_factory:has_perk("fire_mode_auto", weapon.factory_id, weapon.blueprint)
	local locked_to_single = managers.weapon_factory:has_perk("fire_mode_single", weapon.factory_id, weapon.blueprint)

	local has_single = (fire_mode == "single" or can_toggle_firemode) and not locked_to_auto and true or false
	local has_auto = (fire_mode == "auto" or can_toggle_firemode) and not locked_to_single and true or false
	local has_burst = (weapon_tweak_data.HAS_BURST_FIRE or can_toggle_firemode) and not (locked_to_single or locked_to_auto) and not weapon_tweak_data.FORBIDS_BURST_MODE

	local selection_panel = panel:child("weapon_selection")
	local single_fire = selection_panel:child("single_fire")
	local auto_fire = selection_panel:child("auto_fire")
	local burst_fire = selection_panel:child("burst_fire")
	
	single_fire:set_color(has_single and Color.black or Color(0.6, 0.1, 0.1))
	auto_fire:set_color(has_auto and Color.black or Color(0.6, 0.1, 0.1))
	if burst_fire then
		burst_fire:set_color(has_burst and Color.black or Color(0.6, 0.1, 0.1))
	end
	
	local default = locked_to_auto and "auto" or locked_to_single and "single" or fire_mode
	self:set_weapon_firemode(id, default)
end

function HUDTeammate:set_weapon_selected(id, hud_icon)
	self._weapons_panel:child("primary_weapon_panel"):set_alpha(id == 1 and 0.5 or 1)
	self._weapons_panel:child("secondary_weapon_panel"):set_alpha(id == 1 and 1 or 0.5)
end

function HUDTeammate:set_weapon_firemode(id, firemode)
	local panel = self._weapons_panel:child(id == 1 and "secondary_weapon_panel" or "primary_weapon_panel")
	local selection_panel = panel:child("weapon_selection")
	local single_fire = selection_panel:child("single_fire")
	local auto_fire = selection_panel:child("auto_fire")
	local burst_fire = selection_panel:child("burst_fire")
	
	local active_alpha = 1
	local inactive_alpha = 0.65
	
	if firemode == "single" then
		single_fire:set_alpha(active_alpha)
		single_fire:set_text("[S]")
		auto_fire:set_alpha(inactive_alpha)
		auto_fire:set_text("A")
		if burst_fire then
			burst_fire:set_text("B")
			burst_fire:set_alpha(inactive_alpha)
		end
	elseif firemode == "auto" then
		auto_fire:set_alpha(active_alpha)
		auto_fire:set_text("[A]")
		single_fire:set_alpha(inactive_alpha)
		single_fire:set_text("S")
		if burst_fire then
			burst_fire:set_text("B")
			burst_fire:set_alpha(inactive_alpha)
		end
	elseif firemode == "burst" then
		burst_fire:set_alpha(active_alpha)
		burst_fire:set_text("[B]")
		auto_fire:set_alpha(inactive_alpha)
		auto_fire:set_text("A")
		single_fire:set_alpha(inactive_alpha)
		single_fire:set_text("S")
	end
end

function HUDTeammate:set_weapon_firemode_burst(id)
	self:set_weapon_firemode(id, "burst")
end

function HUDTeammate:set_weapon_id(slot, id, silencer)
	local bundle_folder = tweak_data.weapon[id] and tweak_data.weapon[id].texture_bundle_folder
	local guis_catalog = "guis/"
	if bundle_folder then
		guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
	end
	local texture_name = tweak_data.weapon[id] and tweak_data.weapon[id].texture_name or tostring(id)
	local bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/weapons/" .. texture_name

	local panel = self._weapons_panel:child(slot == 1 and "secondary_weapon_panel" or "primary_weapon_panel")
	local icon = panel:child("icon")
	local silencer_icon = panel:child("silencer_icon")
	icon:set_visible(true)
	icon:set_image(bitmap_texture)
	silencer_icon:set_visible(silencer)
	
	if self._main_player and HUDManager._USE_BURST_MODE and alive(managers.player:player_unit()) then
		local unit = managers.player:player_unit():inventory():unit_by_selection(slot)
		if alive(unit) then
			local has_burst = unit:base().can_use_burst_burst and unit:base():can_use_burst_burst() or false
			panel:child("weapon_selection"):child("burst_fire"):set_color(has_burst and Color.black or Color(0.6, 0.1, 0.1))
		end
	end
end

function HUDTeammate:set_ammo_amount_by_type(type, max_clip, current_clip, current_left, max)
	local panel = self._weapons_panel:child(type .. "_weapon_panel")
	local low_ammo = current_left <= math.round(max_clip / 2)
	local low_ammo_clip = current_clip <= math.round(max_clip / 4)
	local out_of_ammo_clip = current_clip <= 0
	local out_of_ammo = current_left <= 0
	local color_total = out_of_ammo and Color(1, 0.9, 0.3, 0.3)
	color_total = color_total or low_ammo and Color(1, 0.9, 0.9, 0.3)
	color_total = color_total or Color.white
	local color_clip = out_of_ammo_clip and Color(1, 0.9, 0.3, 0.3)
	color_clip = color_clip or low_ammo_clip and Color(1, 0.9, 0.9, 0.3)
	color_clip = color_clip or Color.white
	
	local ammo_clip = panel:child("ammo_clip")
	local zero = current_clip < 10 and "00" or current_clip < 100 and "0" or ""
	ammo_clip:set_text(zero .. tostring(current_clip))
	ammo_clip:set_color(color_clip)
	ammo_clip:set_range_color(0, string.len(zero), color_clip:with_alpha(0.5))
	
	local ammo_total = panel:child("ammo_total")
	local zero = current_left < 10 and "00" or current_left < 100 and "0" or ""
	ammo_total:set_text(zero .. tostring(current_left))
	ammo_total:set_color(color_total)
	ammo_total:set_range_color(0, string.len(zero), color_total:with_alpha(0.5))
	self:_update_kill_count_text()
end

function HUDTeammate:_create_equipment_panel(width, height, scale)
	scale = scale or 1
	width = width * scale
	height = height * scale
	
	self._equipment_panel = self._panel:panel({
		name = "equipment_panel",
		h = height,
		w = width,
	})
	
	local item_panel_height = self._main_player and (height / 3) or height
	local item_panel_width = self._main_player and width or (width / 3)
	
	for i, name in ipairs({ "deployable_equipment_panel", "cable_ties_panel", "grenades_panel" }) do
		local panel = self._equipment_panel:panel({
			name = name,
			h = item_panel_height,
			w = item_panel_width,
			visible = false,
		})
		
		local icon = panel:bitmap({
			name = "icon",
			layer = 1,
			color = Color.white,
			w = panel:h(),
			h = panel:h(),
			layer = 2,
		})
		
		local amount = panel:text({
			name = "amount",
			text = "00",
			font = "fonts/font_medium_mf",
			font_size = panel:h(),
			color = Color.white,
			align = "right",
			vertical = "center",
			layer = 2,
			w = panel:w(),
			h = panel:h()
		})
		
		local bg = panel:rect({
			name = "bg",
			blend_mode = "normal",
			color = Color.black,
			alpha = 0.5,
			h = panel:h(),
			w = panel:w(),
			layer = -1,
		})
		
		if self._main_player then
			panel:set_top((i-1) * panel:h())
		else
			panel:set_left((i-1) * panel:w())
		end
	end
end

function HUDTeammate:_set_amount_string(text, amount)
	local zero = self._main_player and amount < 10 and "0" or ""
	text:set_text(zero .. amount)
	text:set_range_color(0, string.len(zero), Color.white:with_alpha(0.5))
end

function HUDTeammate:set_deployable_equipment(data)
	local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)
	local deployable_equipment_panel = self._equipment_panel:child("deployable_equipment_panel")
	local deployable_icon = deployable_equipment_panel:child("icon")
	deployable_icon:set_image(icon, unpack(texture_rect))
	self:set_deployable_equipment_amount(1, data)
end

function HUDTeammate:set_deployable_equipment_amount(index, data)
	local deployable_equipment_panel = self._equipment_panel:child("deployable_equipment_panel")
	local deployable_amount = deployable_equipment_panel:child("amount")
	self:_set_amount_string(deployable_amount, data.amount)	
	deployable_equipment_panel:set_visible(data.amount ~= 0)
	self._deployable_amount = data.amount
end

function HUDTeammate:set_cable_tie(data)
	local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)
	local cable_ties_panel = self._equipment_panel:child("cable_ties_panel")
	local tie_icon = cable_ties_panel:child("icon")
	tie_icon:set_image(icon, unpack(texture_rect))
	self:set_cable_ties_amount(data.amount)
end

function HUDTeammate:set_cable_ties_amount(amount)
	local cable_ties_panel = self._equipment_panel:child("cable_ties_panel")
	self:_set_amount_string(cable_ties_panel:child("amount"), amount)
	cable_ties_panel:set_visible(amount ~= 0)
	self._cable_ties_amount = amount
end

function HUDTeammate:set_grenades(data)
	local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)
	local grenades_panel = self._equipment_panel:child("grenades_panel")
	local grenade_icon = grenades_panel:child("icon")
	grenade_icon:set_image(icon, unpack(texture_rect))
	self:set_grenades_amount(data)
end

function HUDTeammate:set_grenades_amount(data)
	local grenades_panel = self._equipment_panel:child("grenades_panel")
	local amount = grenades_panel:child("amount")
	self:_set_amount_string(amount, data.amount)
	grenades_panel:set_visible(data.amount ~= 0)
	self._grenades_amount = data.amount
end

function HUDTeammate:_create_special_equipment_panel(width, height, scale)
	scale = scale or 1
	width = width * scale
	height = height * scale

	self._special_equipment_panel = self._panel:panel({
		name = "special_equipment_panel",
		h = height,
		w = width,
	})
end

function HUDTeammate:add_special_equipment(data)
	local size = self._special_equipment_panel:h() / 3--(self._main_player and 3 or 4)
	
	local equipment_panel = self._special_equipment_panel:panel({
		name = data.id,
		h = size,
		w = size,
	})
	table.insert(self._special_equipment, equipment_panel)
	
	local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)
	local bitmap = equipment_panel:bitmap({
		name = "bitmap",
		texture = icon,
		color = Color.white,
		layer = 1,
		texture_rect = texture_rect,
		w = equipment_panel:w(),
		h = equipment_panel:h()
	})
	
	local amount, amount_bg
	if data.amount then
		amount = equipment_panel:child("amount") or equipment_panel:text({
			name = "amount",
			text = tostring(data.amount),
			font = "fonts/font_small_noshadow_mf",
			font_size = 12 * equipment_panel:h() / 32,
			color = Color.black,
			align = "center",
			vertical = "center",
			layer = 4,
			w = equipment_panel:w(),
			h = equipment_panel:h()
		})
		amount:set_visible(1 < data.amount)
		amount_bg = equipment_panel:child("amount_bg") or equipment_panel:bitmap({
			name = "amount_bg",
			texture = "guis/textures/pd2/equip_count",
			color = Color.white,
			layer = 3,
		})
		amount_bg:set_size(amount_bg:w() * equipment_panel:w() / 32, amount_bg:h() * equipment_panel:h() / 32)
		amount_bg:set_center(bitmap:center())
		amount_bg:move(amount:w() * 0.2, amount:h() * 0.2)
		amount_bg:set_visible(1 < data.amount)
		amount:set_center(amount_bg:center())
	end
	
	local flash_icon = equipment_panel:bitmap({
		name = "bitmap",
		texture = icon,
		color = tweak_data.hud.prime_color,
		layer = 2,
		texture_rect = texture_rect,
		w = equipment_panel:w() + 2,
		h = equipment_panel:w() + 2
	})
	
	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
	flash_icon:set_center(bitmap:center())
	flash_icon:animate(hud.flash_icon, nil, equipment_panel)
	self:layout_special_equipments()
end

function HUDTeammate:remove_special_equipment(equipment)
	for i, panel in ipairs(self._special_equipment) do
		if panel:name() == equipment then
			local data = table.remove(self._special_equipment, i)
			self._special_equipment_panel:remove(panel)
			self:layout_special_equipments()
			return
		end
	end
end

function HUDTeammate:set_special_equipment_amount(equipment_id, amount)
	for i, panel in ipairs(self._special_equipment) do
		if panel:name() == equipment_id then
			panel:child("amount"):set_text(tostring(amount))
			panel:child("amount"):set_visible(amount > 1)
			panel:child("amount_bg"):set_visible(amount > 1)
			return
		end
	end
end

function HUDTeammate:clear_special_equipment()
	self:remove_panel()
	self:add_panel()
end

function HUDTeammate:layout_special_equipments()
	if #self._special_equipment > 0 then
		local h = self._special_equipment[1]:h()
		local w = self._special_equipment[1]:w()
		local items_per_column = math.floor(self._special_equipment_panel:h() / h)
		
		for i, panel in ipairs(self._special_equipment) do
			local column = math.floor((i-1) / items_per_column)
			panel:set_left(0 + column * w)
			panel:set_top(0 + (i - 1 - column * items_per_column) * h)
		end
	end
end

function HUDTeammate:set_gear_visible(visible)
	self._weapons_panel:set_visible(visible)
	self._equipment_panel:child("deployable_equipment_panel"):set_visible(visible and self._deployable_amount > 0)
	self._equipment_panel:child("cable_ties_panel"):set_visible(visible and self._cable_ties_amount > 0)
	self._equipment_panel:child("grenades_panel"):set_visible(visible and self._grenades_amount > 0)
end

function HUDTeammate:_create_carry_panel(width, height, scale)
	scale = scale or 1
	width = width * scale
	height = height * scale
	
	self._carry_panel = self._panel:panel({
		name = "carry_panel",
		visible = false,
		h = height,
		w = width,
	})
	
	local text = self._carry_panel:text({
		name = "text",
		layer = 1,
		color = Color.white,
		w = self._carry_panel:w(),
		h = self._carry_panel:h(),
		vertical = "center",
		align = "center",
		font_size = self._carry_panel:h(),
		font = tweak_data.hud.medium_font_noshadow,
	})
	
	local icon = self._carry_panel:bitmap({
		name = "icon",
		visible = false,	--Shows otherwise for some reason...
		texture = "guis/textures/pd2/hud_tabs",
		texture_rect = { 32, 33, 32, 31 },
		w = self._carry_panel:h(),
		h = self._carry_panel:h(),
		layer = 1,
		color = Color.white,
	})
	
	self:remove_carry_info()
end

function HUDTeammate:set_carry_info(carry_id, value)
	local name_id = carry_id and tweak_data.carry[carry_id] and tweak_data.carry[carry_id].name_id
	local carry_text = utf8.to_upper(name_id and managers.localization:text(name_id) or "UNKNOWN")
	local text = self._carry_panel:child("text")
	local icon = self._carry_panel:child("icon")
	
	text:set_text(carry_text)
	local _, _, w, _ = text:text_rect()
	text:set_w(w)
	text:set_right(self._carry_panel:w() / 2 + text:w() / 2 + icon:h() / 4)
	icon:set_right(text:left() - icon:h() / 4)
	icon:set_visible(true)
	
	self._carry_panel:set_visible(true)
	self._carry_panel:animate(callback(self, self, "_animate_carry_pickup"))
end

function HUDTeammate:remove_carry_info()
	self._carry_panel:stop()
	self._carry_panel:set_visible(false)
	self._carry_panel:child("icon"):set_visible(false)
	self._carry_panel:child("text"):set_text("")
end

function HUDTeammate:get_carry_panel_info()
	return self._carry_panel:w(), self._carry_panel:h(), self._panel:x() + self._carry_panel:x(), self._panel:y() + self._carry_panel:y()
end

function HUDTeammate:_create_kills_panel(width, height, scale)
	scale = scale or 1
	width = width * scale
	height = height * scale
	
	self._kills_panel = self._panel:panel({
		name = "kills_panel",
		visible = HUDManager._USE_KILL_COUNTER,
		h = height,
		w = width,
	})

	local acc_icon = self._kills_panel:bitmap({
		name = "acc_icon",
		texture = "guis/textures/hud_icons",
		w = self._kills_panel:h(),
		h = self._kills_panel:h(),
		texture_rect = { 2, 514, 128, 128 },
		alpha = 1,
		visible = HUDManager._USE_KILL_COUNTER,
		blend_mode = "add",
		color = Color.yellow
	})

	local icon = self._kills_panel:bitmap({
		name = "icon",
		texture = "guis/textures/hud_icons",
		w = self._kills_panel:h(),
		h = self._kills_panel:h()/111*106,
		texture_rect = { 340, 1276, 111, 106 },
		alpha = 1,
		visible = HUDManager._USE_KILL_COUNTER,
		blend_mode = "add",
		color = Color.yellow
	})

	local acc_text = self._kills_panel:text({
		name = "acc_text",
		text = "000%",
		layer = 1,
		visible = HUDManager._USE_KILL_COUNTER,
		color = Color.yellow,
		w = 30,
		h = self._kills_panel:h(),
		vertical = "center",
		align = "left",
		font_size = self._kills_panel:h(),
		font = tweak_data.hud_players.name_font
	})

	local text = self._kills_panel:text({
		name = "text",
		text = "0 / 0",
		layer = 1,
		visible = HUDManager._USE_KILL_COUNTER,
		color = Color.yellow,
		h = self._kills_panel:h(),
		vertical = "center",
		align = "left",
		font_size = self._kills_panel:h(),
		font = tweak_data.hud_players.name_font
	})
	if self._main_player then
		text:set_w(self._kills_panel:w() - icon:w() - acc_icon:w() - acc_text:w() - 1)
	else
		text:set_w(self._kills_panel:w() - icon:w()-1)
	end

	acc_icon:set_left(text:right())
	text:set_left(icon:right())
	acc_text:set_left(acc_icon:right())
end

function HUDTeammate:_create_downs_panel(width, height, scale)
	scale = scale or 1
	width = width * scale
	height = height * scale
	
	self._downs_panel = self._panel:panel({
		name = "downs_panel",
		visible = HUDManager._USE_KILL_COUNTER,
		h = height,
		w = width,
	})
	
	local icon = self._downs_panel:bitmap({
		name = "icon",
		texture = "guis/textures/hud_icons",
		w = self._downs_panel:h()/128*102,
		h = self._downs_panel:h(),
		texture_rect = { 262, 1033, 102, 128 },
		alpha = 1,
		visible = HUDManager._USE_KILL_COUNTER,
		blend_mode = "add",
		color = Color.white
	})
	
	local downs = self._downs_panel:text({
		name = "downs",
		text = "0",
		layer = 1,
		visible = HUDManager._USE_KILL_COUNTER,
		color = Color.white,
		w = self._downs_panel:w() - icon:w() - 1,
		h = self._downs_panel:h(),
		vertical = "center",
		align = "right",
		font_size = self._downs_panel:h(),
		font = tweak_data.hud_players.name_font
	})
	downs:set_right(self._downs_panel:w())
end

function HUDTeammate:nullify_downs()
	self._downs = 0
end

function HUDTeammate:reset_downs()
	self._downs = 0
	local ghost_field = self._downs_panel:child("icon")
	local field = self._downs_panel:child("downs")
	ghost_field:set_color(Color.white)
	field:set_color(Color.white)
	field:set_text("0")
end

function HUDTeammate:update_downs(downs)
	local ghost_field = self._downs_panel:child("icon")
	local field = self._downs_panel:child("downs")
	ghost_field:set_alpha(1)
	field:set_alpha(1)
	if downs > 2 then
		ghost_field:set_color(Color.red)
		field:set_color(Color.red)
	elseif downs == -1 then
		ghost_field:set_alpha(0)
		field:set_alpha(0)
	else
		ghost_field:set_color(Color.white)
		field:set_color(Color.white)
	end
	field:set_text(downs)
end

function HUDTeammate:increment_downs()
	self._downs = self._downs + 1
	local ghost_field = self._downs_panel:child("icon")
	local field = self._downs_panel:child("downs")
	if self._downs > 2 then
		ghost_field:set_color(Color.red)
		field:set_color(Color.red)
	end
	field:set_text(self._downs)
end

function HUDTeammate:increment_kill_count(is_special, headshot)
	self._kill_count = self._kill_count + 1
	self._kill_count_special = self._kill_count_special + (is_special and 1 or 0)
	self._headshot_kills = self._headshot_kills + (headshot and 1 or 0)
	self:_update_kill_count_text()
end

function HUDTeammate:_update_kill_count_text()
	local text = tostring(self._kill_count)
	if HUDTeammate.SHOW_SPECIAL_KILLS then
		text = text .. "/" .. tostring(self._kill_count_special)
	end
	if HUDTeammate.SHOW_HEADSHOT_KILLS then
		text = text .. " (" .. tostring(self._headshot_kills) .. ")"
	end
	if self._main_player then
		self._kills_panel:child("acc_text"):set_text(managers.statistics:session_hit_accuracy() .. "%")
	else
		self._kills_panel:child("acc_text"):hide()
		self._kills_panel:child("acc_icon"):hide()
	end
	local field = self._kills_panel:child("text")
	field:set_text(text)
end

function HUDTeammate:reset_kill_count()
	self._kill_count = 0
	self._kill_count_special = 0
	self._headshot_kills = 0
	self:_update_kill_count_text()
end

function HUDTeammate:_create_name_panel(width, height, scale)
	scale = scale or 1
	width = width * scale
	height = height * scale
	
	self._name_panel = self._panel:panel({
		name = "name_panel",
		h = height,
		w = width,
	})
	
	local callsign = self._name_panel:bitmap({
		name = "callsign",
		texture = "guis/textures/pd2/hud_tabs",
		texture_rect = { 84, 34, 19, 19 },
		layer = 1,
		color = Color.white,
		blend_mode = "normal",
		w = self._name_panel:h(),
		h = self._name_panel:h()
	})
	
	local name_sub_panel = self._name_panel:panel({
		name = "name_sub_panel",
		h = self._name_panel:h(),
		w = self._name_panel:w() - callsign:w(),
	})
	name_sub_panel:set_right(self._name_panel:w())
	
	local text = name_sub_panel:text({
		name = "name",
		text = tostring(self._id),
		layer = 1,
		color = Color.white,
		--align = "left",
		align = "center",
		vertical = "center",
		w = name_sub_panel:w(),
		h = name_sub_panel:h(),
		font_size = name_sub_panel:h(),
		font = tweak_data.hud_players.name_font
	})
	--text:set_left(callsign:right())
end

function HUDTeammate:set_cheater(state)
	if not self._main_player then
		self._name_panel:child("name_sub_panel"):child("name"):set_color(state and tweak_data.screen_colors.pro_color or Color.white)
	end
end

function HUDTeammate:set_name(teammate_name)
	if not self._main_player and self._name ~= teammate_name then
		self._name = teammate_name
		self:reset_kill_count()
		self._name_panel:stop()
		
		local sub_panel = self._name_panel:child("name_sub_panel")
		local text = sub_panel:child("name")
		text:set_left(0)
		if self:peer_id() then
			local peer = managers.network:session():peer(self:peer_id())
			local experience = " (" .. (peer:rank() > 0 and managers.experience:rank_string(peer:rank()) .. "-" or "") .. peer:level() .. ")"
			text:set_text(teammate_name .. experience)
		else
			text:set_text(teammate_name)
		end
		local _, _, w, _ = text:text_rect()
		w = w + 5
		text:set_w(w)
		if w > sub_panel:w() then
			self._name_panel:animate(callback(self, self, "_animate_name_label"), w - sub_panel:w())
		end
	end
end

function HUDTeammate:set_callsign(id)
	if not self._main_player then
		self._name_panel:child("name_sub_panel"):child("name"):set_color((tweak_data.chat_colors[id] or Color.white):with_alpha(1))
		self._name_panel:child("callsign"):set_color((tweak_data.chat_colors[id] or Color.white):with_alpha(1))
		self:set_voice_com(false)
	end
end

function HUDTeammate:set_voice_com(status)
	local texture = status and "guis/textures/pd2/jukebox_playing" or "guis/textures/pd2/hud_tabs"
	local texture_rect = status and { 0, 0, 16, 16 } or { 84, 34, 19, 19 }
	local callsign = self._name_panel:child("callsign")
	
	callsign:set_image(texture, unpack(texture_rect))
	if status then
		callsign:animate(callback(self, self, "_animate_voice_com"), self._name_panel:h(), callsign:center())
	else
		callsign:stop()
		callsign:set_size(self._name_panel:h(), self._name_panel:h())
		callsign:set_position(0, 0)
	end
end

function HUDTeammate:_create_latency_panel(width, height, scale)
	scale = scale or 1
	width = width * scale
	height = height * scale
	
	self._latency_panel = self._panel:panel({
		name = "latency_panel",
		h = height,
		w = width,
	})
	
	local text = self._latency_panel:text({
		name = "text",
		text = "0 ms",
		layer = 1,
		color = Color.yellow,
		w = self._latency_panel:w(),
		h = self._latency_panel:h(),
		vertical = "center",
		align = "center",
		font_size = self._latency_panel:h(),
		font = tweak_data.hud_players.name_font
	})
end

function HUDTeammate:update_latency(value)
	if not (self._ai or self._main_player) then
		local text = self._latency_panel:child("text")
		text:set_text(string.format("%d ms", value))
		text:set_color(value < 75 and Color.green or value < 150 and Color.yellow or Color.red)
	end
end

function HUDTeammate:_create_interact_panel_new()
	self._interact_panel = self._panel:panel({
		name = "interact_panel",
		layer = 0,
		visible = false,
		alpha = 0,
		w = self._weapons_panel:w(),
		h = self._weapons_panel:h(),
	})
	
	self._interact_panel:rect({
		name = "bg",
		blend_mode = "normal",
		color = Color.black,
		alpha = 0.25,
		h = self._interact_panel:h(),
		w = self._interact_panel:w(),
		layer = -1,
	})

	local interact_text = self._interact_panel:text({
		name = "interact_text",
		layer = 10,
		color = Color.white,
		w = self._interact_panel:w(),
		h = self._interact_panel:h() * 0.5,
		vertical = "center",
		align = "center",
		blend_mode = "normal",
		font_size = self._interact_panel:h() * 0.4,
		font = tweak_data.hud_players.name_font
	})
	interact_text:set_top(0)
	
	local interact_bar_outline = self._interact_panel:bitmap({
		name = "outline",
		texture = "guis/textures/hud_icons",
		texture_rect = { 252, 240, 12, 48 },
		w = self._interact_panel:h() * 0.5,
		h = self._interact_panel:w() * 0.75,
		layer = 10,
		rotation = 90
	})
	interact_bar_outline:set_center(self._interact_panel:w() / 2, 0)
	interact_bar_outline:set_bottom(self._interact_panel:h() + interact_bar_outline:h() / 2 - interact_bar_outline:w() / 2)
	
	self._interact_bar_max_width = interact_bar_outline:h() * 0.97

	local interact_bar = self._interact_panel:gradient({
		name = "interact_bar",
		blend_mode = "normal",
		alpha = 0.75,
		layer = 5,
		h = interact_bar_outline:w() * 0.8,
		w = self._interact_bar_max_width,
	})
	interact_bar:set_center(interact_bar_outline:center())
	
	local interact_bar_bg = self._interact_panel:rect({
		name = "interact_bar_bg",
		blend_mode = "normal",
		color = Color.black,
		alpha = 1.0,
		h = interact_bar_outline:w(),
		w = interact_bar_outline:h(),
		layer = 0,
	})
	interact_bar_bg:set_center(interact_bar:center())
	
	local interact_timer = self._interact_panel:text({
		name = "interact_timer",
		layer = 10,
		color = Color.white,
		w = interact_bar:w(),
		h = interact_bar:h(),
		vertical = "center",
		align = "center",
		blend_mode = "normal",
		font_size = interact_bar:h(),
		font = tweak_data.hud_players.name_font
	})
	interact_timer:set_center(interact_bar:center())
end

function HUDTeammate:teammate_progress(enabled, tweak_data_id, timer, success)
	debug_check_tweak_data(tweak_data_id)
	
	--if not self._main_player then
		self._interact_panel:stop()
		
		if not enabled and self._interact_panel:visible() then
			self._interact_panel:animate(callback(self, self, "_animate_interact_timer_complete"), success)
			--self._interact_panel:set_visible(false)
			--self._weapons_panel:set_visible(true)
		end
		
		if enabled and timer > 1 then
			local text = ""
			if tweak_data_id then
				local action_text_id = tweak_data.interaction[tweak_data_id] and tweak_data.interaction[tweak_data_id].action_text_id or "hud_action_generic"
				text = HUDTeammate._INTERACTION_TEXTS[tweak_data_id] or action_text_id and managers.localization:text(action_text_id)
			end
			
			self._interact_panel:child("interact_text"):set_text(string.format("%s (%.1fs)", utf8.to_upper(text), timer))
			self._interact_panel:animate(callback(self, self, "_animate_interact_timer_new"), timer)
		end
	--end
end

function HUDTeammate:panel()
	return self._panel
end

function HUDTeammate:peer_id()
	return self._peer_id
end

function HUDTeammate:add_panel()
	self._panel:set_visible(true)
end

function HUDTeammate:remove_panel()
	while self._special_equipment[1] do
		self._special_equipment_panel:remove(table.remove(self._special_equipment, 1))
	end
	
	--self._weapons_panel:child("secondary_weapon_panel"):child("icon"):set_visible(false)
	--self._weapons_panel:child("primary_weapon_panel"):child("icon"):set_visible(false)
	self._panel:set_visible(false)
	self:set_condition("mugshot_normal")
	self:set_cheater(false)
	self:stop_timer()
	self:set_peer_id(nil)
	self:set_ai(nil)
	self:teammate_progress(false)
	self:remove_carry_info()
	if self._main_player then
		self._stamina_panel:child("stamina_bar"):stop()
	end
end

function HUDTeammate:set_peer_id(peer_id)
	self._peer_id = peer_id

	local peer = peer_id and managers.network:session():peer(peer_id)
	if peer then
		local outfit = peer:blackmarket_outfit()
		
		for selection, data in ipairs({ outfit.secondary, outfit.primary }) do
			local weapon_id = managers.weapon_factory:get_weapon_id_by_factory_id(data.factory_id)
			local silencer = managers.weapon_factory:has_perk("silencer", data.factory_id, data.blueprint)
			self:set_weapon_id(selection, weapon_id, silencer)
		end
	end
end

function HUDTeammate:set_ai(ai)
	self._ai = ai
	
	self._weapons_panel:set_visible(not ai and true or false)
	self._equipment_panel:set_visible(not ai and true or false)
	self._special_equipment_panel:set_visible(not ai and true or false)
	self._equipment_panel:set_visible(not ai and true or false)
	if (PocoHud3 ~= nil) then
		self._downs_panel:set_visible(not ai and true or false)
	end
	--self._carry_panel:set_visible(not ai and true or false)
	if not HUDTeammate.SHOW_AI_KILLS then
		self._kills_panel:set_visible(not ai and true or false)
	end
	
	if not self._main_player then
		self._latency_panel:set_visible(not ai and true or false)
		if ai then
			self._interact_panel:set_visible(false)
		end
		self._name_panel:child("name_sub_panel"):child("name"):set_color((not ai and tweak_data.chat_colors[self._id] or Color.white):with_alpha(1))
	end
end

function HUDTeammate:set_state(state)
	--log_print("out.log", string.format("HUDTeammate:set_state(%s)\n", tostring(state)))
end

function HUDTeammate:_animate_damage_taken(damage_indicator)
	damage_indicator:set_alpha(1)
	local st = 3
	local t = st
	local st_red_t = 0.5
	local red_t = st_red_t
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		red_t = math.clamp(red_t - dt, 0, 1)
		damage_indicator:set_color(Color(1, red_t / st_red_t, red_t / st_red_t))
		damage_indicator:set_alpha(t / st)
	end
	damage_indicator:set_alpha(0)
end

function HUDTeammate:_animate_timer()
	local rounded_timer = math.round(self._timer)
	while self._timer >= 0 do
		local dt = coroutine.yield()
		if self._timer_paused == 0 then
			self._timer = self._timer - dt
			local text = self._timer < 0 and "00" or (math.round(self._timer) < 10 and "0" or "") .. math.round(self._timer)
			self._condition_timer:set_text(text)
			if rounded_timer > math.round(self._timer) then
				rounded_timer = math.round(self._timer)
				if rounded_timer < 11 then
					self._condition_timer:animate(callback(self, self, "_animate_timer_flash"))
				end
			end
		end
	end
end

function HUDTeammate:_animate_timer_flash()
	local t = 0
	while t < 0.5 do
		t = t + coroutine.yield()
		local n = 1 - math.sin(t * 180)
		local r = math.lerp(1 or self._point_of_no_return_color.r, 1, n)
		local g = math.lerp(0 or self._point_of_no_return_color.g, 0.8, n)
		local b = math.lerp(0 or self._point_of_no_return_color.b, 0.2, n)
		self._condition_timer:set_color(Color(r, g, b))
		self._condition_timer:set_font_size(math.lerp(self._health_panel:h() * 0.5, self._health_panel:h() * 0.8, n))
	end
	self._condition_timer:set_font_size(self._health_panel:h() * 0.5)
end

function HUDTeammate:_animate_voice_com(callsign, original_size, cx, cy)
	local t = 0
	
	while true do
		local dt = coroutine.yield()
		t = t + dt
		
		local size = (math.sin(t * 360) * 0.15 + 1) * original_size
		callsign:set_size(size, size)
		callsign:set_center(cx, cy)
	end
end

function HUDTeammate:_animate_carry_pickup(carry_panel)
	local DURATION = 2
	local text = self._carry_panel:child("text")
	local icon = self._carry_panel:child("icon")
	
	local t = DURATION
	while t > 0 do
		local dt = coroutine.yield()
		t = math.max(t-dt, 0)
		
		local r = math.sin(720 * t) * 0.5 + 0.5
		text:set_color(Color(1, 1, 1, r))
		icon:set_color(Color(1, 1, 1, r))
	end
	
	text:set_color(Color(1, 1, 1, 1))
	icon:set_color(Color(1, 1, 1, 1))
end

function HUDTeammate:_animate_interact_timer_new(panel, timer)
	local bar = panel:child("interact_bar")
	local text = panel:child("interact_timer")
	local outline = panel:child("outline")
	text:set_size(self._interact_bar_max_width, bar:h())
	text:set_font_size(text:h())
	text:set_color(Color.white)
	text:set_alpha(1)
	text:set_center(outline:center())
	
	self._interact_panel:set_visible(true)
	self._weapons_panel:set_visible(true)
	self._interact_panel:set_alpha(0)
	self._weapons_panel:set_alpha(1)

	local b = 0
	local g_max = 0.9
	local g_min = 0.1
	local r_max = 0.9
	local r_min = 0.1		
	
	local T = 0.5
	local t = 0
	while timer > t do
		if t < T then
			self._weapons_panel:set_alpha(1-t/T)
			self._interact_panel:set_alpha(t/T)
		end
	
		local time_left = timer - t
		local r = t / timer
		bar:set_w(self._interact_bar_max_width * r)
		if r < 0.5 then
			local green = math.clamp(r * 2, 0, 1) * (g_max - g_min) + g_min
			bar:set_gradient_points({ 0, Color(r_max, g_min, b), 1, Color(r_max, green, b) })
		else
			local red = math.clamp(1 - (r - 0.5) * 2, 0, 1) * (r_max - r_min) + r_min
			bar:set_gradient_points({ 0, Color(r_max, g_min, b), 0.5/r, Color(r_max, g_max, b), 1, Color(red, g_max, b) })
		end
		--bar:set_gradient_points({0, Color(0.9, 0.1, 0.1), 1, Color((1-r) * 0.8 + 0.1, r * 0.8 + 0.1, 0.1)})
		text:set_text(string.format("%.1fs", time_left))
		t = t + coroutine.yield()
	end
	
	self._weapons_panel:set_visible(false)
	bar:set_w(self._interact_bar_max_width)
	bar:set_gradient_points({ 0, Color(r_max, g_min, b), 0.5, Color(r_max, g_max, b), 1, Color(r_min, g_max, b) })
	--bar:set_gradient_points({ 0, Color(0.9, 0.1, 0.1), 1, Color(0.1, 0.9, 0.1) })
end

function HUDTeammate:_animate_interact_timer_complete(panel, success)
	local text = panel:child("interact_timer")
	local h = text:h()
	local w = text:w()
	local x = text:center_x()
	local y = text:center_y()
	text:set_color(success and Color.green or Color.red)
	self._weapons_panel:set_visible(true)
	self._weapons_panel:set_alpha(0)
	self._interact_panel:set_alpha(1)
	if success then 
		text:set_text("DONE") 
	end
	
	local T = 1
	local t = 0
	while t < T do
		local r = math.sin(t/T*90)
		text:set_size(w * (1 + r * 2), h * (1 + r * 2))
		text:set_font_size(text:h())
		text:set_center(x, y)
		self._weapons_panel:set_alpha(t/T)
		self._interact_panel:set_alpha(1-t/T)
		t = t + coroutine.yield()
	end
	
	self._interact_panel:set_visible(false)
	coroutine.yield()	--Prevents text flashing
	text:set_text("")
	text:set_color(Color.white)
	text:set_size(self._interact_bar_max_width, h)
	text:set_font_size(text:h())
	text:set_center(x, y)
end

function HUDTeammate:_animate_low_stamina(stamina_bar, stamina_bar_outline)
	local target = Color(1.0, 0.1, 0.1)
	local bar = self._default_stamina_color
	local border = Color.white

	while self._animating_low_stamina do
		local t = 0
		while t <= 0.5 do
			t = t + coroutine.yield()
			local ratio = 0.5 + 0.5 * math.sin(t * 720)
			stamina_bar:set_color(Color(
				bar.r + (target.r - bar.r) * ratio, 
				bar.g + (target.g - bar.g) * ratio, 
				bar.b + (target.b - bar.b) * ratio))
			stamina_bar_outline:set_color(Color(
				border.r + (target.r - border.r) * ratio, 
				border.g + (target.g - border.g) * ratio, 
				border.b + (target.b - border.b) * ratio))
		end
	end
	
	stamina_bar:set_color(bar)
	stamina_bar_outline:set_color(border)
end

function HUDTeammate:_animate_name_label(panel, width)
	local t = 0
	local text = self._name_panel:child("name_sub_panel"):child("name")
	
	while true do
		t = t + coroutine.yield()
		text:set_left(width * (math.sin(90 + t * HUDTeammate._NAME_ANIMATE_SPEED) * 0.5 - 0.5))
	end
end

if mod_collection and mod_collection._data.enable_kill_counter then
	HUDTeammate.SHOW_SPECIAL_KILLS = mod_collection._data.show_special_kills
	HUDTeammate.SHOW_HEADSHOT_KILLS = mod_collection._data.show_headshot_kills
	HUDTeammate.SHOW_AI_KILLS = mod_collection._data.show_ai_kills

	if not HUDTeammate.increment_kill_count and not HUDManager.CUSTOM_TEAMMATE_PANEL then	--Custom HUD compatibility
		local init_original = HUDTeammate.init
		local set_name_original = HUDTeammate.set_name
		local set_state_original = HUDTeammate.set_state

		function HUDTeammate:init(...)
			init_original(self, ...)
			if not HUDManager.CUSTOM_TEAMMATE_PANEL then
				self:_init_killcount()
			end
		end
		
		function HUDTeammate:_init_killcount()
			self._kills_panel = self._panel:panel({
				name = "kills_panel",
				visible = true,
				w = 100,
				h = 20,
				x = 0,
				halign = "right"
			})
			
			local player_panel = self._panel:child("player")
			local name_label = self._panel:child("name")
			self._kills_panel:set_rightbottom(player_panel:right(), (self._id == HUDManager.PLAYER_PANEL) and name_label:bottom() or name_label:top())
			
			self._kill_icon = self._kills_panel:bitmap({
				texture = "guis/textures/pd2/cn_miniskull",
				w = self._kills_panel:h() * 0.75,
				h = self._kills_panel:h(),
				texture_rect = { 0, 0, 12, 16 },
				alpha = 1,
				blend_mode = "add",
				layer = 0,
				color = Color.yellow
			})
			
			self._kills_text = self._kills_panel:text({
				name = "kills_text",
				text = "-",
				layer = 1,
				color = Color.yellow,
				w = self._kills_panel:w() - self._kill_icon:w(),
				h = self._kills_panel:h(),
				vertical = "center",
				align = "right",
				font_size = self._kills_panel:h(),
				font = tweak_data.hud_players.name_font
			})
			self._kills_text:set_right(self._kills_panel:w())
			
			self:reset_kill_count()
		end

		function HUDTeammate:increment_kill_count(is_special, headshot)
			self._kill_count = self._kill_count + 1
			self._kill_count_special = self._kill_count_special + (is_special and 1 or 0)
			self._headshot_kills = self._headshot_kills + (headshot and 1 or 0)
			self:_update_kill_count_text()
		end

	function HUDTeammate:_update_kill_count_text()
		local text = tostring(self._kill_count)
		if HUDTeammate.SHOW_SPECIAL_KILLS then
			text = text .. "/" .. tostring(self._kill_count_special)
		end
		if HUDTeammate.SHOW_HEADSHOT_KILLS then
			text = text .. " (" .. tostring(self._headshot_kills) .. ")"
		end
		local field = self._kills_panel:child("kills_text")
		field:set_text(text)
	end

		function HUDTeammate:reset_kill_count()
			self._kill_count = 0
			self._kill_count_special = 0
			self._headshot_kills = 0
			self:_update_kill_count_text()
		end

		function HUDTeammate:set_name(teammate_name, ...)
			if teammate_name ~= self._name then
				self._name = teammate_name
				self:reset_kill_count()
			end
			
			return set_name_original(self, teammate_name, ...)
		end
	
		function HUDTeammate:set_state(...)
			set_state_original(self, ...)
		
			if not HUDTeammate.SHOW_AI_KILLS then
				self._kills_panel:set_visible(not self._ai and true or false)
			end
			
			if self._ai then
				self._kills_panel:set_bottom(self._panel:child("player"):bottom())
			else
				local name_label = self._panel:child("name")
				self._kills_panel:set_bottom((self._id == HUDManager.PLAYER_PANEL) and name_label:bottom() or name_label:top())
			end
		end
	end
end

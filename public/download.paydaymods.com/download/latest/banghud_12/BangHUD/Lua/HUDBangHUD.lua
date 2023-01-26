BangHUD:DoLuaFile("OutlineText")

local function round(val, dec)
	dec = math.pow(10, dec or 0)
	val = val * dec
	val = val >= 0 and math.floor(val + 0.5) or math.ceil(val - 0.5)
	return val / dec
end

HUDBangHUD = HUDBangHUD or class()

function HUDBangHUD:init(hud)
	self._hud_panel = hud.panel

	if self._hud_panel:child("banghud_panel") then
		self._hud_panel:remove(self._hud_panel:child("banghud_panel"))
	end

	self._banghud_panel = self._hud_panel:panel({
		name = "banghud_panel",
		alpha = 0,
		layer = 1
	})
	self._banghud_panel:set_size(self._banghud_panel:parent():w(), self._banghud_panel:parent():h())
	self._banghud_panel:set_center(self._banghud_panel:parent():w() / 2, self._banghud_panel:parent():h() / 2)

	self._texture_sidelen = 512
	local armor_texture = "guis/textures/trial_diamondheist"
	local health_texture = "guis/textures/trial_slaughterhouse"
	local border_texture = "guis/textures/trial_street"

	self._armor_arc = self._banghud_panel:bitmap({
		name = "armor_arc",
		texture = armor_texture,
		color = Color.white,
		w = self._texture_sidelen,
		h = self._texture_sidelen,
		blend_mode = "add",
		render_template = "VertexColorTexturedRadial",
		layer = 1
	})
	self._health_arc = self._banghud_panel:bitmap({
		name = "health_arc",
		texture = health_texture,
		color = Color.white,
		w = self._texture_sidelen,
		h = self._texture_sidelen,
		blend_mode = "add",
		render_template = "VertexColorTexturedRadial",
		layer = 1
	})

	self._armor_arc_bg = self._banghud_panel:bitmap({
		name = "armor_arc_bg",
		texture = border_texture,
		color = Color.white,
		w = self._texture_sidelen,
		h = self._texture_sidelen,
		blend_mode = "normal"
	})
	self._health_arc_bg = self._banghud_panel:bitmap({
		name = "health_arc_bg",
		texture = border_texture,
		color = Color.white,
		w = self._texture_sidelen,
		h = self._texture_sidelen,
		blend_mode = "normal"
	})

	self._armor_timer = OutlineText:new(self._banghud_panel, {
		text = "0.0s",
		color = Color.white,
		visible = false,
		align = "left",
		vertical = "bottom",
		font = tweak_data.hud_players.name_font,
		font_size = 22,
		layer = 2
	})
	self._invincibility_timer = OutlineText:new(self._banghud_panel, {
		text = "0.0s",
		color = Color(1, 0.7, 0),
		visible = false,
		align = "right",
		vertical = "bottom",
		font = tweak_data.hud_players.name_font,
		font_size = 22,
		layer = 2
	})

	self._max_downs = managers.modifiers:modify_value("PlayerDamage:GetMaximumLives", (Global.game_settings.difficulty == "sm_wish" and 2 or tweak_data.player.damage.LIVES_INIT) + managers.player:upgrade_value("player", "additional_lives", 0)) - 1
	self._downs = self._max_downs
	self._downs_counter = OutlineText:new(self._banghud_panel, {
		text = (BangHUD:GetOption("show_downs_counter_skull") and utf8.char(57364) or "") .. self._downs,
		color = Color.white,
		align = "right",
		vertical = "top",
		font = tweak_data.hud_players.name_font,
		font_size = 22,
		layer = 2
	})

	self:update()
end

function HUDBangHUD:update()
	local swap = BangHUD:GetOption("swap_bars")
	local scale = BangHUD:GetOption("bars_scale") / 3
	local margin = BangHUD:GetOption("center_margin")
	local alpha = BangHUD:GetOption("bars_alpha")
	local bg_alpha = BangHUD:GetOption("background_alpha")
	local x_offset = BangHUD:GetOption("x_offset")
	local y_offset = BangHUD:GetOption("y_offset")

	self._armor_arc:set_size(self._texture_sidelen * scale, self._texture_sidelen * scale)
	self._health_arc:set_size(self._texture_sidelen * scale, self._texture_sidelen * scale)
	self._armor_arc_bg:set_size(self._texture_sidelen * scale, self._texture_sidelen * scale)
	self._health_arc_bg:set_size(self._texture_sidelen * scale, self._texture_sidelen * scale)

	if swap then
		self._health_arc:set_center_x(self._banghud_panel:w() / 2 - margin / 2 + x_offset)
		self._armor_arc:set_center_x(self._banghud_panel:w() / 2 + margin / 2 + x_offset)
		self._armor_arc:set_texture_rect(self._texture_sidelen, 0, -self._texture_sidelen, self._texture_sidelen)
		self._health_arc:set_texture_rect(0, 0, self._texture_sidelen, self._texture_sidelen)
		self._armor_arc_bg:set_texture_rect(self._texture_sidelen, 0, -self._texture_sidelen, self._texture_sidelen)
		self._health_arc_bg:set_texture_rect(0, 0, self._texture_sidelen, self._texture_sidelen)
	else
		self._armor_arc:set_center_x(self._banghud_panel:w() / 2 - margin / 2 + x_offset)
		self._health_arc:set_center_x(self._banghud_panel:w() / 2 + margin / 2 + x_offset)
		self._health_arc:set_texture_rect(self._texture_sidelen, 0, -self._texture_sidelen, self._texture_sidelen)
		self._armor_arc:set_texture_rect(0, 0, self._texture_sidelen, self._texture_sidelen)
		self._health_arc_bg:set_texture_rect(self._texture_sidelen, 0, -self._texture_sidelen, self._texture_sidelen)
		self._armor_arc_bg:set_texture_rect(0, 0, self._texture_sidelen, self._texture_sidelen)
	end
	self._armor_arc:set_center_y(self._banghud_panel:h() / 2 + y_offset)
	self._health_arc:set_center_y(self._banghud_panel:h() / 2 + y_offset)
	self._armor_arc_bg:set_center(self._armor_arc:center())
	self._health_arc_bg:set_center(self._health_arc:center())

	self._armor_timer:set_bottom(self._armor_arc:bottom())
	if swap then
		self._armor_timer:set_right(self._armor_arc:right())
		self._armor_timer:set_align("right")
	else
		self._armor_timer:set_left(self._armor_arc:left())
		self._armor_timer:set_align("left")
	end

	self._invincibility_timer:set_bottom(self._health_arc:bottom())
	if swap then
		self._invincibility_timer:set_left(self._health_arc:left())
		self._invincibility_timer:set_align("left")
	else
		self._invincibility_timer:set_right(self._health_arc:right())
		self._invincibility_timer:set_align("right")
	end

	self._armor_arc:set_alpha(alpha)
	self._health_arc:set_alpha(alpha)
	self._armor_arc_bg:set_alpha(bg_alpha)
	self._health_arc_bg:set_alpha(bg_alpha)

	self:_update_health()
	self:_update_armor()

	self:update_armor_timer(0)
	self:update_invincibility_timer(0)

	self:update_downs_counter()
	self._downs_counter:set_top(self._health_arc:top())
	if swap then
		self._downs_counter:set_left(self._health_arc:left())
		self._downs_counter:set_align("left")
	else
		self._downs_counter:set_right(self._health_arc:right())
		self._downs_counter:set_align("right")
	end
end

function HUDBangHUD:_health_percentage()
	local value = 1
	if self._health_data then
		value = self._health_data.current / self._health_data.total
		if BangHUD:GetOption("frenzy_handling") == 2 then
			value = self._health_data.current / (self._health_data.total * self:_max_health_reduction())
		end
	end
	return math.clamp(value, 0, 1)
end

function HUDBangHUD:_update_health()
	self._health_arc:set_color(Color(1, 0.5 + self:_health_percentage() * 0.5, 1, 1))
	self:update_visbility()
end

function HUDBangHUD:_armor_percentage()
	local value = 1
	if self._armor_data then
		value = self._armor_data.current / self._armor_data.total
	end
	return math.clamp(value, 0, 1)
end

function HUDBangHUD:_update_armor()
	self._armor_arc:set_color(Color(1, 0.5 + self:_armor_percentage() * 0.5, 1, 1))
	self:update_visbility()
end

function HUDBangHUD:update_armor_timer(t)
	if t and t > 0 then
		t = string.format("%.1f", round(t, 1)) .. "s"
		self._armor_timer:set_text(t)
		self._armor_timer:set_visible(true)
	elseif self._armor_timer:visible() then
		self._armor_timer:set_visible(false)
	end
end

function HUDBangHUD:update_invincibility_timer(t)
	if t and t > 0 then
		t = string.format("%.1f", round(t, 1)) .. "s"
		self._invincibility_timer:set_text(t)
		self._invincibility_timer:set_visible(true)
	elseif self._invincibility_timer:visible() then
		self._invincibility_timer:set_visible(false)
	end
end

function HUDBangHUD:update_downs_counter()
	self._downs_counter:set_text((BangHUD:GetOption("show_downs_counter_skull") and utf8.char(57364) or "") .. self._downs)
	self._downs_counter:set_color(math.lerp(Color(1, 1, 0.2, 0), Color.white, math.clamp(self._downs / self._max_downs, 0, 1)))
	self._downs_counter:set_visible(BangHUD:GetOption("show_downs_counter"))
	self._downs_counter:set_alpha(BangHUD:GetOption("downs_counter_alpha"))
end

function HUDBangHUD:update_visbility()
	local stealth = managers.groupai and managers.groupai:state() and managers.groupai:state():whisper_mode()
	local behaviour = stealth and BangHUD:GetOption("stealth_behaviour") or BangHUD:GetOption("loud_behaviour")
	local hide = true
	if behaviour == 1 then
		hide = false
	elseif behaviour < 4 then
		hide = self:_armor_percentage() >= 0.99 and (behaviour == 3 or (self:_health_percentage() >= (BangHUD:GetOption("frenzy_handling") == 3 and (self:_max_health_reduction() - 0.01) or 0.99)))
	end
	if not hide then
		self._banghud_panel:stop()
		self._banghud_panel:set_alpha(1)
	elseif self._banghud_panel:alpha() == 1 then
		self._banghud_panel:stop()
		self._banghud_panel:animate(callback(self, self, "_fade_out_animation"))
	end
end

function HUDBangHUD:_fade_out_animation(panel)
	local duration = BangHUD:GetOption("fade_out_time")
	local t = duration
	panel:set_alpha(1)
	while t > 0 do
		t = t - coroutine.yield()
		panel:set_alpha(math.clamp(t / duration, 0, 1))
	end
	panel:set_alpha(0)
end

function HUDBangHUD:set_health(data)
	self._health_data = data
	self:_update_health()
	if data.current > 0 and self:_check_player_state() then
		self._banghud_panel:set_visible(true)
	end
	if data.revives then
		self._downs = data.revives - 1
		self:update_downs_counter()
	end
end

function HUDBangHUD:set_armor(data)
	self._armor_data = data
	self:_update_armor()
	if data.current > 0 and self:_check_player_state() then
		self._banghud_panel:set_visible(true)
	end
end

function HUDBangHUD:update_status()
	self._banghud_panel:set_visible(self:_check_player_state())
end

function HUDBangHUD:_check_player_state()
	if not managers.player or not managers.player:player_unit() or not managers.player:player_unit():character_damage() or managers.player:player_unit():character_damage().swansong then
		return false
	end
	local state = managers.player:current_state() or "empty"
	return state ~= "bleed_out" and state ~= "fatal" and state ~= "arrested" and state ~= "incapacitated"
	-- other possible states are:
	-- standard, mask_off, tased, clean, civilian, carry, bipod, driving, jerry2, jerry1
end

function HUDBangHUD:_max_health_reduction()
	return managers.player and managers.player:upgrade_value("player", "max_health_reduction", 1) or 1
end
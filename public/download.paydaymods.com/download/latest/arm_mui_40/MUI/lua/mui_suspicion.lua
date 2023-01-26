--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.MUISuspicion = _G.MUISuspicion or class(HUDSuspicion);

local lerp, abs, sin, clamp = math.lerp, math.abs, math.sin, math.clamp;
local fade, flip_tex_h = ArmStatic.fade_animate, ArmStatic.flip_texture_h;
local visibility = ArmStatic.visibility;

function MUISuspicion:init(hud, sound_source)
	self.load_options();
	local local_id = ArmStatic.tunnel(managers, "network", "session", "local_peer", "id") or 1;
	local crim_color = tweak_data.chat_colors[local_id];
	self._prime_color = crim_color;
	local muiFont = ArmStatic.font_index(self._muiFont);
	self._mui_cor = ArmStatic.correction_index(self._muiFont);

	self._visible = false;
	self._freeze = false;
	self._value = 0;
	self._sound_source = sound_source;
	self._fade_thread = nil;
	hud = hud or managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2);
	local panel = hud.panel:panel({
		name = "suspicion_panel",
		visible = false
	});
	self._panel = panel;
	
	local bars = panel:panel({
		name = "suspicion_bars"
	});
	self._susp_bars = bars;

	local susp_right = bars:bitmap({
		texture = "guis/textures/pd2/hud_stealthmeter",
		name = "suspicion_right",
		blend_mode = "add",
		render_template = "VertexColorTexturedRadial",
		color = Color(0, 1, 1),
		layer = 2
	});
	self._susp_right = susp_right;
	flip_tex_h(susp_right);

	--[[if self._muiColor then
		susp_right:set_blend_mode("sub");
		susp_right:set_image("guis/textures/pd2/hud_stealthmeter_bg");
		self._susp_right_fill = bars:bitmap({
			name = "suspicion_right_fill",
			color = crim_color,
			texture = "guis/textures/pd2/hud_stealthmeter",
			blend_mode = "add",
			alpha = 1,
			layer = 1
		});
		flip_tex_h(self._susp_right_fill);
	else
		flip_tex_h(susp_right);
	end]]
	
	local susp_left = bars:bitmap({
		texture = "guis/textures/pd2/hud_stealthmeter",
		name = "suspicion_left",
		blend_mode = "add",
		render_template = "VertexColorTexturedRadial",
		color = Color(0, 1, 1),
		layer = 2
	});
	self._susp_left = susp_left;

	--[[if self._muiColor then
		susp_left:set_blend_mode("sub");
		susp_left:set_image("guis/textures/pd2/hud_stealthmeter_bg");
		self._susp_left_fill = bars:bitmap({
			name = "suspicion_left_fill",
			color = crim_color,
			texture = "guis/textures/pd2/hud_stealthmeter",
			blend_mode = "add",
			alpha = 1,
			layer = 1
		});
		flip_tex_h(susp_left);
	end]]
	
	local icon_panel = panel:panel({ name = "icon_panel" });
	self._icon_panel = icon_panel;

	self._susp_detect = icon_panel:text({
		name = "suspicion_detected",
		alpha = 0,
		text = managers.localization:to_upper_text("hud_suspicion_detected"),
		font = muiFont
	});
	self._eye = icon_panel:bitmap({
		texture = "guis/textures/pd2/hud_stealth_eye",
		name = "hud_stealth_eye",
		alpha = 0,
		blend_mode = "add"
	});
	self._exclaim = icon_panel:bitmap({
		texture = "guis/textures/pd2/hud_stealth_exclam",
		name = "hud_stealth_exclam",
		alpha = 0,
		blend_mode = "add",
	});
	self:resize();
end

function MUISuspicion:test_animate()
	local a = 0;
	while true do
		a = a + 1;
		local t = 0;
		while t < 2 do
			t = t + coroutine.yield();
		end
		if a % 3 == 0 then self:discovered(); end
		self:feed_value(math.random());
	end
end

function MUISuspicion:_animate(o, instant)
	local spl = self._susp_left;
	local spr = self._susp_right;
	--local splf = self._susp_left_fill;
	--local sprf = self._susp_right_fill;
	local eye = self._eye;
	local xlm = self._exclaim;

	local s, f, z, l = 0, 0, 0, 0;
	local end_t = self._muiASPD;
	local stop_t = self._muiATO;
	--local muiColor = self._muiColor;
	--local r, g, b = rgb(self._prime_color);
	--local end_r, end_g, end_b = rgb(Color(1, 0.2, 0));
	local thread = nil;

	--------
	-- Set all display data based on interpolated value.
	local function frame(val)
		local br = 0.5 + val * 0.5;
		--[[if muiColor then
			br = 0.5 - val * 0.5;
			local f = Color(lerp(r, end_r, val),lerp(g, end_g, val),lerp(b, end_b, val));
			splf:set_color(f);
			sprf:set_color(f);
			xlm:set_color(f);
			eye:set_color(f);
		end]]

		local c = Color(br, 1, 1);
		local xlma = clamp((val - 0.5) * 2, 0, 1);
		local eyea = clamp(val * 2, 0, 1);
		spl:set_color(c);
		spr:set_color(c);
		xlm:set_alpha(xlma);
		eye:set_alpha(eyea);
	end

	--------
	-- Animation with above frame.
	-- If stopped mid-execution the value of l will be reused on next execute for the linear interpolation.
	-- I.e. continues where it left off but towards a new target.
	local function action()
		local t, v, x = 0, self._value, l;
		while t < end_t do
			t = t + coroutine.yield();
			l = lerp(x, v, t / end_t);
			frame(l);
		end
		frame(v);
	end

	if instant then return frame(1); end
	if self._muiSound then self._sound_source:post_event("hud_suspicion_start"); end

	while true do
		local dt = coroutine.yield();

		if f == self._value then
			-- Tick down timeout if we stay frozen at the same value for longer than the timeout.
			z = z + dt;
			if stop_t < z then self:hide(); end
		elseif abs(s - self._value) > 0.02 then
			-- Thread off our animation so we can stop it mid-animation and continue from where it left off.
			eye:stop(thread);
			thread = eye:animate(action);
			z = 0;
			s = self._value;
		end
		f = self._value;
	end
end

function MUISuspicion:show(instant)
	if not instant and self._visible then return; end
	self._visible = true;

	local sp = self._panel;
	local spd = self._susp_detect;
	visibility(true, self._muiAlpha, sp);
	visibility(false, 0, spd);

	sp:stop();
	sp:animate(callback(self, self, "_animate", instant));
end


function MUISuspicion:hide(instant)
	if not instant and not self._visible then return; end
	self._visible = false;
	self._freeze = false;
	self:stop();
	fade(self._panel, 0, instant and 0 or self._muiASPD);
end

function MUISuspicion:stop()
	self._panel:stop();
	self._susp_detect:stop();
end


function MUISuspicion:feed_value(value)
	if self._freeze then return; end
	if value >= 0.01 then
		self:show();
	end

	self._value = math.min(value, 1);
end

function HUDSuspicion:back_to_stealth()
	self:feed_value(0);
end

function MUISuspicion:discovered()
	if self._freeze then return; end
	self:feed_value(1);
	self._freeze = true;

	if self._muiSound then self._sound_source:post_event("hud_suspicion_discovered"); end

	if not self._muiDetect then return; end
	local panel = self._susp_detect;
	panel:stop();
	panel:animate(self.discovered_pulse);
end

function MUISuspicion.discovered_pulse(o)
	o:set_alpha(0);
	o:set_color(Color(1, 1, 1));
	o:set_visible(true);
	local t, l = 0, 0;
	local end_t = 0.25;
	while t < end_t do
		t = t + coroutine.yield();
		l = lerp(0, 0.4, t / end_t);
		o:set_alpha(l);
		o:set_color(Color(1, 1 - l, 1 - l));
	end
	t = 0;
	while true do
		t = t + coroutine.yield();
		l = abs((sin(t * 360))) * 0.6;
		o:set_alpha(0.4 + l);
		o:set_color(Color(1, 0.6 - l,  0.6 - l));
	end
end


function MUISuspicion.load_options(force_load)
	if MUISuspicion._options and not force_load then return; end
	
	local data = MUIMenu._data;
	MUISuspicion._muiSize = data.mui_suspicion_size or 120;
	MUISuspicion._muiAlpha = (data.mui_suspicion_alpha or 100)*0.01;
	MUISuspicion._muiASPD = (data.mui_suspicion_aspd or 350)*0.001;
	MUISuspicion._muiATO = (data.mui_suspicion_ato or 5000)*0.001;
	MUISuspicion._muiBars = data.mui_suspicion_bars or 2;
	MUISuspicion._muiDetect = data.mui_suspicion_detect ~= false;
	MUISuspicion._muiEye = data.mui_suspicion_eye ~= false;
	MUISuspicion._muiExclaim = data.mui_suspicion_exclaim ~= false;
	MUISuspicion._muiSound = data.mui_suspicion_sound ~= false;
	MUISuspicion._muiHMargin = data.mui_suspicion_h_marg or 60;
	MUISuspicion._muiVMargin = data.mui_suspicion_v_marg or 60;
	MUISuspicion._muiHPos = data.mui_suspicion_h_pos or 2;
	MUISuspicion._muiVPos = data.mui_suspicion_v_pos or 2;
	MUISuspicion._muiRot = data.mui_suspicion_rot or 0;
	MUISuspicion._muiFont = data.mui_font_pref or 4;
	--MUISuspicion._muiColor = false;
	MUISuspicion._options = true;
end

function MUISuspicion:resize()
	local size = self._muiSize;
	local alpha = self._muiAlpha;
	local s12 = size*0.12;
	local hMargin = self._muiHMargin;
	local vMargin = self._muiVMargin;
	local hPos = self._muiHPos;
	local vPos = self._muiVPos;
	local mBars = self._muiBars;
	local vEye = self._muiEye;
	local vExclaim = self._muiExclaim;
	local assets = MUIMenu:Assets();
	
	local sp = self._panel;
		local spb = self._susp_bars;
			local spl = self._susp_left;
			local spr = self._susp_right;
			--local splf = self._susp_left_fill;
			--local sprf = self._susp_right_fill;
		local ip = self._icon_panel;
			local spd = self._susp_detect;
			local eye = self._eye;
			local xlm = self._exclaim;
			local sXlm = (assets and xlm:texture_width() >= 128 and 2.3) or 1;


	Figure(sp):view(alpha):shape(size):align(hPos, vPos, hMargin, vMargin):spank();
	
	Figure(spb):shape(size):spank();
	Figure(spl):view(mBars <= 2);
	Figure(spr):view(mBars == 2 or mBars == 3);
	
	Figure(spd):rect(s12):align(2);
	Figure(eye):view(vEye):shape(s12):align(2, 3);
	Figure(xlm):view(vExclaim):shape(s12 * sXlm):align(2, 1);

end

function MUISuspicion.resize_all()
	local mui_suspicion = managers.hud._hud_suspicion;
	if not mui_suspicion then return; end
	
	MUISuspicion.load_options(true);
	mui_suspicion:resize();
	ArmStatic.align_corners(mui_suspicion._panel);
end

function MUISuspicion.toggle_layer(force_state)
	local mui_suspicion = managers.hud._hud_suspicion;
	if not mui_suspicion then return; end
	
	local panel = mui_suspicion._panel;
	if force_state == false or panel:layer() > 1 then
		mui_suspicion:hide(true);
		ArmStatic.remove_corners(panel);
		panel:set_layer(1);
	else
		mui_suspicion:show(true);
		ArmStatic.create_corners(panel);
		panel:set_layer(1200);
	end
end

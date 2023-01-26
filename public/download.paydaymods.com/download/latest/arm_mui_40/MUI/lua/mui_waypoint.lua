--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.MUIWaypoint = _G.MUIWaypoint or class();
local remc, crtc, alnc = ArmStatic.remove_corners, ArmStatic.create_corners, ArmStatic.align_corners;
local get_icon =  function(str, rect) return tweak_data.hud_icons:get_icon_data(str, rect); end
local state_id = {sneak_present = 1, present = 2, present_ended = 3, offscreen = 4, onscreen = 5};

function MUIWaypoint:init(id, hud, wp_data)
	self.load_options();
	local wpfont = ArmStatic.font_index(self._muiFont);
	hud = hud or managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2);
	
	local panel = hud.panel:panel({ name = "waypoint_"..id });
	local blend_mode = wp_data.blend_mode or "normal";
	local color = (wp_data.color or Color.white):with_alpha(1);
	
	self.parent = hud.panel;
	self.panel = panel;
	self.init_data = wp_data;
	self.state = state_id[wp_data.state or "present"];
	self.present_timer = wp_data.present_timer or 0;
	self.radius = wp_data.radius or 160;
	self.no_sync = wp_data.no_sync;
	self.unit = wp_data.unit;
	self.position = wp_data.position or (self.unit and self.unit:position());
	self.pause_timer = 0;
	
	local icon_id = wp_data.icon or "wp_standard";
	local icon, icon_rect = get_icon(icon_id, { 0, 0, 32, 32 });
	self.bitmap_rect = icon_rect;
	self.bitmap_icon = icon_id;
	self.bitmap = panel:bitmap({
		name = "bitmap" .. id,
		texture = icon,
		texture_rect = icon_rect,
		layer = 0,
		blend_mode = blend_mode,
		rotation = 360
	});
	
	local arr_icon, arr_rect = get_icon("wp_arrow");
	self.arrow_rect = arr_rect;
	self.arrow = panel:bitmap({
		name = "arrow" .. id,
		texture = arr_icon,
		texture_rect = arr_rect,
		color = color,
		visible = false,
		layer = 0,
		blend_mode = blend_mode,
		rotation = 360
	});

	self.timer = wp_data.timer;
	self.new_t = self.timer;
	self.timer_gui = wp_data.timer and panel:text({
		name = "timer" .. id,
		text = string.format("%02d", math.round(wp_data.timer));
		font = wpfont,
		align = "center",
		vertical = "center",
		color = color,
		layer = 0,
		blend_mode = blend_mode,
		rotation = 360
	});
	
	self.distance = wp_data.distance and panel:text({
		name = "distance" .. id,
		color = color,
		font = wpfont,
		align = "center",
		vertical = "center",
		visible = false,
		layer = 0,
		blend_mode = blend_mode,
		rotation = 360
	});
	
	self:resize();
end

function MUIWaypoint:set_icon(icon_id)
	icon_id = icon_id or "wp_standard";
	if self.bitmap_icon == icon_id then return; end
	
	local icon, icon_rect = get_icon(icon_id, { 0, 0, 32, 32 });
	self.bitmap_rect = icon_rect;
	self.bitmap_icon = icon_id;
	
	self.bitmap:set_image(icon, icon_rect[1], icon_rect[2], icon_rect[3], icon_rect[4]);
	self:resize();
end

function MUIWaypoint:set_color(color)
	self.arrow:set_color(color);
	if self.timer_gui then self.timer_gui:set_color(color); end
	if self.distance then self.distance:set_color(color); end
end

function MUIWaypoint:remove()
	self.parent:remove(self.panel);
end

function MUIWaypoint.load_options(force_load)
	if MUIWaypoint._options and not force_load then return; end
	
	local data = MUIMenu._data;
	MUIWaypoint._muiSize = data.mui_wp_size or 20;
	MUIWaypoint._muiArrow = data.mui_wp_arrow ~= false;
	MUIWaypoint._muiDistance = data.mui_wp_distance ~= false;
	MUIWaypoint._muiAlpha = (data.mui_wp_alpha or 75)*0.01;
	MUIWaypoint._muiDistAct = data.mui_wp_distant_act or 1;
	MUIWaypoint._muiDistRng = data.mui_wp_distant_rng or 50;
	MUIWaypoint._muiFont = data.mui_font_pref or 4;
	MUIWaypoint._options = true;
end

function MUIWaypoint:resize()
	local panel = self.panel;
	local bitmap = self.bitmap;
	local bRect = self.bitmap_rect;
	local arrow = self.arrow;
	local aRect = self.arrow_rect;
	local timer = self.timer_gui;
	local distance = self.distance;
	
	local size = self._muiSize;
	local alpha = self._muiAlpha;
	local aShow = self._muiArrow and 1 or 0;
	local dShow = self._muiDistance and 1 or 0;
	local s300 = size*3;
	local s75 = size*0.75;
	
	
	Figure(panel):view(alpha):shape(s300);
	Figure(arrow):view(aShow):shape(s75, aRect[4] / aRect[3] * s75);
	Figure(bitmap):shape(size):aspect(bRect[3], bRect[4]):align(2);
	if timer then Figure(timer):shape(size, s75):align(2, 1); end
	if distance then Figure(distance):view(dShow):shape(size, s75):align(2,3); end
end

function MUIWaypoint.toggle_layer(force_state)
	local waypoints = managers.hud._hud.waypoints;
	local _, first_wp = next(waypoints);
	if not waypoints or not first_wp then
		return;
	end
	
	local state = first_wp.panel:layer() > 0 or force_state == false;
	for _, wp in pairs(waypoints) do
		if wp.resize then
			if state then
				wp.panel:set_layer(0);
				remc(wp.panel);
			else
				wp.panel:set_layer(1200);
				crtc(wp.panel);
			end
		end
	end
end

function MUIWaypoint.resize_all()
	MUIWaypoint.load_options(true);
	for _, wp in pairs(managers.hud._hud.waypoints) do
		if wp.resize then
			wp:resize();
			alnc(wp.panel);
		end
	end
end

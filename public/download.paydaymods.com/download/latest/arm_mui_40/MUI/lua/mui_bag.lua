--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.MUIBag = _G.MUIBag or class();
local fade = ArmStatic.fade_animate;
local visibility = function (o, v, a) o:set_visible(v); if a then o:set_alpha(a); end end

function MUIBag:init(hud)
	self.load_options();
	hud = hud or managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2);
	local muiFont = ArmStatic.font_index(self._muiFont);
	local local_id = ArmStatic.tunnel(managers, "network", "session", "local_peer", "id") or 1;
	self._color = tweak_data.chat_colors[local_id];
	local panel = hud.panel:panel({
		name = "bag_panel",
		alpha = 0,
		visible = false
	});
	self._visible = false;
	self._panel = panel;
	self._bag = panel:bitmap({
		name = "bag_icon",
		texture = "guis/textures/pd2/hud_bag",
		layer = 0
	});
	self._nothing_str = managers.localization:text("menu_loadout_empty");
	self._text_str = self._nothing_str;
	self._text = panel:text({
		name = "bag_text",
		font = muiFont,
		align = "center",
		text = "",
		layer = 0
	});
	
	self:resize();
end

function MUIBag:team_carry(carry_id, value)
	local player_panel = managers.hud._teammate_panels[HUDManager.PLAYER_PANEL];
	if player_panel and carry_id and value then
		return player_panel:set_carry_info(carry_id, value);
	else
		return player_panel:remove_carry_info();
	end
end

function MUIBag:show(carry_id, value)
	self._carry_id = carry_id;
	self._value = value;
	if not self._muiVisible then
		return self:team_carry(carry_id, value);
	end
	self:_show(carry_id);
end
function MUIBag:_show(carry_id)
	local carry_data = tweak_data.carry[carry_id];
	local type_text = carry_data.name_id and managers.localization:text(carry_data.name_id);
	local panel = self._panel;
	self._text_str = type_text;
	self:redisplay_text();
	self:resize();
	fade(panel, self._muiAlpha, self._muiASPD);
	
	self._visible = true;
end
function MUIBag:redisplay_text()
	local text = self._text_str;
	if self._muiUpper then text = utf8.to_upper(text); end
	self._text:set_text(text);
end

function MUIBag:hide()
	self._carry_id = nil;
	self._value = nil;
	if not self._muiVisible then
		return self:team_carry();
	end
	self:_hide();
end

function MUIBag:_hide()
	local panel = self._panel;
	self:resize();
	fade(panel, 0, self._muiASPD);
	
	self._visible = false;
end

function MUIBag:OnStateChange()
	if not self._carry_id then return; end
	if not self._muiVisible and self._visible then
		self:team_carry(self._carry_id, self._value);
		self:_hide();
	elseif self._muiVisible and not self._visible then
		self:team_carry();
		self:_show(self._carry_id, self._value);
	end
end

function MUIBag.load_options(force_load)
	if MUIBag._options and not force_load then return; end
	
	local data = MUIMenu._data;
	MUIBag._muiVisible =  data.mui_bag_visible ~= false;
	MUIBag._muiSize = data.mui_bag_size or 14;
	MUIBag._muiAlpha = (data.mui_bag_alpha or 100)*0.01;
	MUIBag._muiUpper = data.mui_bag_upper ~= false;
	MUIBag._muiDir =  data.mui_bag_direction or 1;
	MUIBag._muiCol =  data.mui_bag_colored ~= false;
	MUIBag._muiASPD = (data.mui_bag_aspd or 300)*0.001;
	MUIBag._muiHMargin = data.mui_bag_h_marg or 0;
	MUIBag._muiVMargin = data.mui_bag_v_marg or 70;
	MUIBag._muiHPos = data.mui_bag_h_pos or 3;
	MUIBag._muiVPos = data.mui_bag_v_pos or 3;
	MUIBag._muiFont = data.mui_font_pref or 4;
	MUIBag._options = true;
end


function MUIBag:resize()
	-- TODO: Implement considerations for rotated elements in Figure.
	local panel = self._panel;
	local bag = self._bag;
	local text = self._text;
	
	local size = self._muiSize;
	local alpha = self._muiAlpha;
	local vert = self._muiDir == 2;
	local hMargin = self._muiHMargin;
	local vMargin = self._muiVMargin;
	local hPos = self._muiHPos;
	local vPos = self._muiVPos;
	local color = self._muiCol and self._color or Color.white;
	
	if self._muiUpper ~= self._muiUpperOld then
		self:redisplay_text();
		self._muiUpperOld = self._muiUpper;
	end


	Figure(bag):shape(size):stain(color);
	Figure(text):rect(size):stain(color):attach(bag, vert and 3 or 2):
		cycle(vert and 90 or 0):
		shift(vert and (-size / 2), vert and (size /2));
		
	local apogee = bag:width() + text:width();
	local w, h = vert and size or apogee, vert and apogee or size;
	Figure(panel):view(alpha):shape(w, h):align(hPos, vPos, hMargin, vMargin);
end

function MUIBag.resize_all()
	local muibag = managers.hud._mui_bag;
	if not muibag then
		return;
	end
	MUIBag.load_options(true);
	muibag:resize();
	ArmStatic.align_corners(muibag._panel);
end

function MUIBag.toggle_layer(force_state)
	local muibag = managers.hud._mui_bag;
	if not muibag then
		return;
	end
	local panel = muibag._panel;
	
	if force_state == false or panel:layer() > 0 then
		if not muibag._visible then visibility(panel, false, 0); end
		ArmStatic.remove_corners(panel);
		panel:set_layer(0);
		muibag:OnStateChange();
	else
		if not muibag._visible then
			muibag._text_str = muibag._nothing_str;
			muibag:redisplay_text();
			muibag:resize();
		end
		visibility(panel, true, muibag._muiAlpha);
		ArmStatic.create_corners(panel);
		panel:set_layer(1200);
	end
end

--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.MUIHint = _G.MUIHint or class();

function MUIHint:init(hud)
	self.load_options();
	hud = hud or managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2);
	local muiFont = ArmStatic.font_index(self._muiFont);
	local panel = hud.panel:panel({ name = "hint_panel" });
	local hint = MUIPresentItem:new({ parent=panel, name="hint_present_item", font=muiFont ,aspd=self._muiASPD });
	self._hint = hint;
	self._panel = panel;
	self._hud_panel = hud.panel;
	
	self:resize();
end

function MUIHint:show(attr, instant)
	if not instant and not self._muiVisible or not attr then return; end
	local hint = self._hint;
	hint:set_data(self.text_format(attr.text), self._muiSound and attr.event);
	
	self:resize();
	if instant then hint:show(); else hint:present(); end
end

function MUIHint:hide()
	self._hint:hide();
end

function MUIHint.text_format(text)
	local str_len = utf8.len(text);
	local result = text;
	if str_len > 20 then
		local s = text:find("[.?!]%s", math.floor(str_len/2), false);
		if s and str_len > s + 5 then
			result = string.format("%s\n%s", text:sub(1,s), text:sub(s+2));
		end
	end
	return utf8.to_upper(result);
end

function MUIHint.load_options(force_load)
	if MUIHint._options and not force_load then return; end
	
	local data = MUIMenu._data;
	MUIHint._muiVisible = data.mui_hint_visible ~= false;
	MUIHint._muiSize = data.mui_hint_size or 20;
	MUIHint._muiAlpha = (data.mui_hint_alpha or 100)*0.01;
	MUIHint._muiASPD = (data.mui_hint_aspd or 2000)*0.001;
	MUIHint._muiSimple = data.mui_hint_simple == true;
	MUIHint._muiSound = data.mui_hint_sound == true;
	MUIHint._muiHMargin = data.mui_hint_h_marg or 60;
	MUIHint._muiVMargin = data.mui_hint_v_marg or 60;
	MUIHint._muiHPos = data.mui_hint_h_pos or 2;
	MUIHint._muiVPos = data.mui_hint_v_pos or 1;
	MUIHint._muiFont = data.mui_font_pref or 4;
	MUIHint._options = true;
end

function MUIHint:resize()
	local panel = self._panel;
	local hint = self._hint;
	local subpnl = hint._panel;
		local text = hint._text;
		local top = hint._border_top;
		local bot = hint._border_bot;
	
	local size = self._muiSize;
	local alpha = self._muiAlpha;
	local hMargin = self._muiHMargin;
	local vMargin = self._muiVMargin;
	local hPos = self._muiHPos;
	local vPos = self._muiVPos;
	
	local s5 = size/20;
	
	hint._aspd = self._muiASPD;
	hint._simple = self._muiSimple;
	
	Figure(text):rect(size):lead();
	local width = text:w();

	Figure(subpnl):shape(width, size);
	Figure(top):shape(width * 0.7, s5);
	Figure(bot):shape(width * 0.7, s5):move(nil, subpnl:h() - s5);
	
	Figure(panel):view(alpha):adapt():align(hPos, vPos, hMargin, vMargin);
end

function MUIHint.resize_all()
	local mui_hint = managers.hud._hud_hint;
	if not mui_hint then
		return;
	end
	MUIHint.load_options(true);
	mui_hint:resize();
	ArmStatic.align_corners(mui_hint._panel);
end

function MUIHint.toggle_layer(force_state)
	local mui_hint = managers.hud._hud_hint;
	if not mui_hint then
		return;
	end
	local panel = mui_hint._panel;
	
	if force_state == false or panel:layer() > 0 then
		mui_hint:hide();
		ArmStatic.remove_corners(panel);
		panel:set_layer(0);
	else
		mui_hint:show({text="Hint message. Hint message? Hint message!"}, true);
		ArmStatic.create_corners(panel);
		panel:set_layer(1200);
	end
end

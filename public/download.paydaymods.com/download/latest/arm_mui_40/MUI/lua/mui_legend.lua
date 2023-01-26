--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.MUILegend = MUILegend or class(HUDWaitingLegend);

function MUILegend:init(hud)
	self:load_options();
	local panel = hud.panel:panel({
		name ="waiting_legend",
		visible = false
	});
	self._block_input_until = 0;
	self._enabled = false;
	self._current_peer = nil;
	self._current_mate = nil;
	self._panel = panel;
	self._all_buttons = {
		{ text = "hud_waiting_accept", binding = "drop_in_accept", callback = callback(self, self, "spawn") },
		{ text = "hud_waiting_return", binding = "drop_in_return", callback = callback(self, self, "return_back") },
		{ text = "hud_waiting_kick", binding = "drop_in_kick", callback = callback(self, self, "kick") }
	};
	self._icon = panel:bitmap({
		name = "icon",
		texture = "guis/textures/pd2/specialization/icons_atlas",
		texture_rect = {327,7,50,50}
	});
	self._font = ArmStatic.font_index(self._muiFont);
	self._cor = ArmStatic.correction_index(self._muiFont);
	self._text = panel:text({
		name = "buttons",
		font = self._font
	});
	self:gen_text();
	self:resize();
end

function MUILegend:show_on(teammate, peer)
	self._block_input_until = Application:time() + 0.5;
	if peer then
		self._current_peer = peer;
		self:set_color(tweak_data.chat_colors[peer:id()]:with_alpha(1));
	end
	self._current_mate = teammate;
	self._enabled = true;
	self:animate_open(0.5);
end

local lerp, abs, sin = math.lerp, math.abs, math.sin;
function MUILegend:animate(opt)
	local end_t, teammate = opt[1] or 0, opt[2];
	local panel = self._panel;
	local teammate_panel = teammate._panel;

	local targ_x, targ_y = teammate_panel:world_left() + teammate_panel:w() / 2  - panel:w() / 2, teammate_panel:world_top() - panel:h();
	local orig_x, orig_y = targ_x - panel:w(), targ_y;

	panel:set_alpha(0);
	panel:set_position(orig_x, orig_y);
	panel:set_visible(true);
	local t = 0;
	while t < end_t do
		t = t + coroutine.yield();
		panel:set_position(lerp(orig_x, targ_x, t / end_t), lerp(orig_y, targ_y, t / end_t));
		panel:set_alpha(lerp(0, 1, t / end_t));
	end
	panel:set_position(targ_x, targ_y);
	panel:set_alpha(1);
	while true do
		t = t + coroutine.yield();
		panel:set_alpha(0.8 + abs((sin(t * 180 * 0.50))) / 5);
	end
end

function MUILegend:animate_open(end_t)
	self._panel:stop();
	if not self._current_mate then return; end
	self._panel:animate(callback(self, self, "animate", {end_t, self._current_mate}));
end

function MUILegend:gen_text()
	local str = "";
	local btns_data = self._all_buttons;
	for i=1, #btns_data do
		local btn = btns_data[i];
		local text = managers.localization:btn_macro(btn.binding, true, true);
		if text then
			if str:len() > 0 then str = str .. " "; end
			str = str .. managers.localization:text(btn.text, {MY_BTN = text});
		end
	end
	self._text:set_text(str);
end

function MUILegend:resize()
	local panel = self._panel;
	local icon = self._icon;
	local text = self._text;

	local size = MUILegend._muiSize;
	local s33 = size/3;
	local cor = self._cor;

	Figure(icon):shape(s33);
	Figure(text):rect(s33):attach(icon, 2, size * .1):shift(nil, s33 * cor);
	Figure(panel):adapt();
end

function MUILegend:reposition()
	self:animate_open();
end

function MUILegend:set_color(c)
	self._text:set_color(c or Color.white);
	self._icon:set_color(c or Color.white);
end

function MUILegend:turn_off()
	self._current_peer = nil;
	self._enabled = false;
	self._panel:stop();
	self._panel:set_visible(false);
end

function MUILegend.load_options(force_load)
	if MUILegend._options and not force_load then return; end
	
	local data = MUIMenu._data;
	MUILegend._muiSize = data.mui_team_size or 30;
	MUILegend._muiFont = data.mui_font_pref or 4;
	MUILegend._options = true;
end

function MUILegend.resize_all()
	local legend = managers.hud._waiting_legend;
	if not legend or not legend._enabled then
		return;
	end

	MUILegend.load_options(true);
	legend:resize();
	legend:reposition();
end

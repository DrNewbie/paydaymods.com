--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.MUIChat = _G.MUIChat or class(HUDChat);
ArmStatic.void(MUIChat, {
	"_create_input_panel","_layout_input_panel",
	"_layout_output_panel"
});

local insert, remove = table.insert, table.remove;

function MUIChat:init(ws, hud)
	self.load_options();
	self._ws = ws;
	self._hud_panel = hud.panel;
	self:set_channel_id(ChatManager.GAME);
	self._lines = {};
	self._font = ArmStatic.font_index(self._muiFont);
	self._freeze = false;
	self._esc_callback = callback(self, self, "esc_key_callback");
	self._enter_callback = callback(self, self, "enter_key_callback");
	self._typing_callback = 0;
	self._skip_first = false;
	self._panel = self._hud_panel:panel({
		name = "chat_panel"
	});
	self._output_panel = self._panel:panel({
		name = "output_panel",
		layer = 1
	});
	self._output_panel:panel({
		name = "output_bg"
	});
	self._input_panel = self._panel:panel({
		alpha = 0,
		name = "input_panel",
		layer = 1
	});
	self._input_panel:rect({
		name = "focus_indicator",
		visible = false,
		color = Color.white:with_alpha(0.2),
		layer = 0
	});
	self._input_panel:text({
		name = "say",
		text = utf8.to_upper(managers.localization:text("debug_chat_say")) .. " ",
		font = self._font,
		align = "left",
		halign = "left",
		vertical = "center",
		hvertical = "center",
		blend_mode = "normal",
		color = Color.white,
		layer = 1
	});
	self._input_panel:text({
		name = "input_text",
		text = "",
		font = self._font,
		align = "left",
		halign = "left",
		vertical = "center",
		hvertical = "center",
		blend_mode = "normal",
		color = Color.white,
		layer = 1,
		wrap = true,
		word_wrap = false
	});
	self._input_panel:rect({
		name = "caret",
		layer = 2,
		color = Color(0.05, 1, 1, 1)
	});
	self._input_panel:panel({
		name = "input_bg"
	});
	self:resize();
end

function MUIChat:update_caret()
	local text = self._input_panel:child("input_text");
	local caret = self._input_panel:child("caret");
	local s, e = text:selection();
	local x, y, w, h = text:selection_rect();
	if s == 0 and e == 0 then
		if text:align() == "center" then
			x = text:world_x() + text:w() / 2;
		else
			x = text:world_x();
		end
		y = text:world_y();
	end
	h = text:h();
	if not self._focus then
		w = 0;
		h = 0;
	end
	caret:set_world_shape(x, y, w, h);
	self:set_blinking(s == e and self._focus);
end

function MUIChat.load_options(force_load)
	if MUIChat._options and not force_load then return; end
	
	local data = MUIMenu._data;
	MUIChat._muiSize = data.mui_chat_size or 200;
	MUIChat._muiLSpacing = math.floor(MUIChat._muiSize *0.008);
	MUIChat._muiAlpha = (data.mui_chat_alpha or 100)*0.01;
	MUIChat._muiHMargin = data.mui_chat_h_marg or 60;
	MUIChat._muiVMargin = data.mui_chat_v_marg or 60;
	MUIChat._muiHPos = data.mui_chat_h_pos or 1;
	MUIChat._muiVPos = data.mui_chat_v_pos or 3;
	MUIChat._muiRows = data.mui_chat_rows or 7;
	MUIChat._muiFont = data.mui_font_pref or 4;
	MUIChat._options = true;
end


function MUIChat:resize()
	local size = self._muiSize;
	local alpha = self._muiAlpha;
	local s200 = size * 2;
	local s10 = size/10;
	local space = self._muiLSpacing;
	local box = s10 + space;
	local rows = self._muiRows;
	local hPos = self._muiHPos;
	local vPos = self._muiVPos;
	local hMargin = self._muiHMargin;
	local vMargin = self._muiVMargin;
	
	local panel = self._panel;
		local output = self._output_panel;
		local input = self._input_panel;
			local say = input:child("say");
			local text = input:child("input_text");
			local caret = input:child("caret");
			local bg = input:child("input_bg");
	
	Figure(output):shape(s200, box * rows);
	Figure(input):shape(s200, box):attach(output, 3);
	Figure(say):rect(s10);
	Figure({text,bg}):shape(s200 - say:w(), box, s10):attach(say, 2);
	Figure(caret):attach(say, 2);
	
	Figure(panel):view(alpha):adapt():align(hPos, vPos, hMargin, vMargin);
	self:resize_lines();
end

function MUIChat:show()
	for _, ch in ipairs(self._panel:children()) do
		if ch.set_alpha then
			ch:set_alpha(1);
			ch:stop();
		end
	end
	self._freeze = true;
end

function MUIChat:hide()
	for _, ch in ipairs(self._panel:children()) do
		if ch.set_alpha then
			ch:set_alpha(0);
			ch:stop();
		end
	end
	self._freeze = false;
end

function MUIChat.resize_all()
	MUIChat.load_options(true);
	local chating = managers.hud._hud_chat_ingame;
	chating:resize();
	ArmStatic.align_corners(chating._panel);
	
	managers.hud._hud_chat_access:resize();
end

function MUIChat:resize_lines()
	local s10 = self._muiSize / 10;
	local rows = self._muiRows;
	local space = self._muiLSpacing;
	
	local lines = self._lines;
	local len = #lines;
	local out = self._output_panel;
	local width = out:w();
	
	local overflow = len - rows;
	local sibling = self._input_panel;
	for i = len, 1, -1 do
		local line = lines[i];
		if i < overflow then
			out:remove(line);
			remove(lines, i);
		else
			Figure(line):rect(s10, width):attach(sibling, 1, space);
			sibling = line;
		end
	end
end

function MUIChat:receive_message(name, message, color, icon)
	local output_panel = self._panel:child("output_panel");
	local line = output_panel:text({
		text = name .. ": " .. message,
		font = self._font,
		wrap = true,
		word_wrap = true,
		layer = 0
	});
	local len = utf8.len(name) + 1;
	local total_len = utf8.len(line:text());
	line:set_range_color(0, len, color);
	line:set_range_color(len, total_len, Color.white);
	insert(self._lines, line);
	self:resize_lines();
	if not self._focus then
		output_panel:stop();
		output_panel:animate(callback(self, self, "_animate_show_component"), output_panel:alpha());
		output_panel:animate(callback(self, self, "_animate_fade_output"));
	end
end


function MUIChat.toggle_layer(force_state)
	local chating = managers.hud._hud_chat_ingame;
	if not chating then
		return;
	end
	
	if force_state == false or chating._panel:layer() > 1 then
		chating:hide();
		ArmStatic.remove_corners(chating._panel);
		chating:set_layer(1);
	else
		chating:show();
		ArmStatic.create_corners(chating._panel);
		chating:set_layer(1200);
	end
end

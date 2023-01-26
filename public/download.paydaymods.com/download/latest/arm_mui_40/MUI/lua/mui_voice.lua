--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.MUIVoice = _G.MUIVoice or class();

function MUIVoice:init(voice_data)
	MUIVoice.load_options();
	 -- MousePointerManager uses fullscreen workspace, we don't have a choice here
	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_FULLSCREEN_PD2);
	local vuifont = ArmStatic.font_index(self._muiFont);
	self._hud_panel = hud.panel;
	self._enabled = false;
	self._skip = false;
	self._ws = managers.hud._workspace;
	self._items = {};
	local max_item_len = -1;
	local voice_command = self._hud_panel:child("voice_command");
	if alive(voice_command) then
		self._hud_panel:remove(voice_command);
	end
	self._panel = self._hud_panel:panel({
		name = "voice_command",
		visible = false
	});
	self._header = self._panel:text({
		name = "header",
		text = "VOICE COMMANDS",
		layer = 1,
		align = "center",
		color = Color.white,
		font = vuifont
	});
	for i=1, #voice_data do
		self._items[i] = MUIVoiceItem:new(self, voice_data[i], vuifont);
		local len = voice_data[i].key:len() + voice_data[i].name:len() + 2;
		if len > max_item_len then
			max_item_len = len;
			self._items_max_i = i;
		end
	end
	self:resize();
end


function MUIVoice.load_options(force_load)
	if MUIVoice._options and not force_load then return; end
	
	local data = MUIMenu._data;
	MUIVoice._muiSize = data.mui_voice_size or 14;
	MUIVoice._muiMargin = data.mui_voice_marg or 4;
	MUIVoice._muiAlpha = (data.mui_voice_alpha or 100)*0.01;
	MUIVoice._muiMouse = data.mui_voice_mouse == true;
	MUIVoice._muiHMargin = data.mui_voice_h_marg or 140;
	MUIVoice._muiVMargin = data.mui_voice_v_marg or 70;
	MUIVoice._muiHPos = data.mui_voice_h_pos or 1;
	MUIVoice._muiVPos = data.mui_voice_v_pos or 1;
	MUIVoice._muiFont = data.mui_font_pref or 4;
	MUIVoice._options = true;
end


function MUIVoice:resize()
	local panel = self._panel;
	local header = self._header;
	local sibling = header;
	local items = self._items;
	local widest = items[self._items_max_i]._panel;
	
	local size = MUIVoice._muiSize;
	local alpha = MUIVoice._muiAlpha;
	local margin = MUIVoice._muiMargin;
	local hMargin = MUIVoice._muiHMargin;
	local vMargin = MUIVoice._muiVMargin;
	local hPos = MUIVoice._muiHPos;
	local vPos = MUIVoice._muiVPos;
	
	Figure(widest):rect(size);
	local wTxt = widest:w() * 2;

	Figure(header):shape(wTxt, size * 1.2);
	for i=1, #items do
		local item = items[i]._panel;
		Figure(item):rect(size):attach(sibling, 3, margin);
		sibling = item;
	end

	Figure(panel):view(alpha):adapt():align(hPos, vPos, hMargin, vMargin);
end

-- Hide panel, enable player controls and stop listening to keyboard/mouse events.
function MUIVoice:hide()
	self._panel:hide();
	self._ws:disconnect_keyboard();
	self._panel:key_release(nil);
	if self._muiMouse then
		managers.mouse_pointer:remove_mouse("voice_command_pointer");
		game_state_machine:_set_controller_enabled(true);
	end
	self._enabled = false;
end

-- Show panel, disable player controls and listen to keyboard/mouse events.
function MUIVoice:show()
	self._panel:show();
	local data = {
		mouse_move = callback(self, self, "mouse_moved"),
		mouse_click = callback(self, self, "mouse_clicked"),
		id = "voice_command_pointer"
	};
	if self._muiMouse then
		game_state_machine:_set_controller_enabled(false);
		managers.mouse_pointer:use_mouse(data);
	end
	self._ws:connect_keyboard(Input:keyboard());
	self._panel:key_release(callback(self, self, "key_released"));
	self._enabled = true;
end

-- Close and/or play sound bound to key.
function MUIVoice:key_released(o, k)
	if not self._enabled then
		return; -- Return if panel isn't visible yet, in case it catches the key_press this script is bound to.
	end
	
	if k == Idstring("esc") or k == Idstring("enter") then
		self:hide();
		return;
	end
	
	for _, item in pairs(self._items) do
		if k == Idstring(item._key:lower()) then
			item:on_click();
			self:hide();
			return;
		end
	end
end

-- Change colour of list-items on hover.
function MUIVoice:mouse_moved(o, x, y)
	if not self._panel:inside(x, y) then
		return;
	end
	
	for _, item in pairs(self._items) do
		if item:inside(x, y) then
			item:set_color(tweak_data.hud.prime_color);
		else
			item:set_color(Color.white);
		end
	end
end


-- Close and/or play sound bound to clicked list-item.
function MUIVoice:mouse_clicked(o, button, x, y)
	if button ~= Idstring("0") or not self._panel:inside(x, y) then
		return;
	end
	
	for _, item in pairs(self._items) do
		if item:inside(x, y) then
			item:on_click();
			self:hide();
		end
	end
end

function MUIVoice.toggle()
	local mui_voice = managers.hud._mui_voice;
	if not mui_voice then
		return;
	end
	if mui_voice._enabled then
		mui_voice:hide();
	else
		mui_voice:show();
	end
end


function MUIVoice.resize_all()
	local mui_voice = managers.hud._mui_voice;
	if not mui_voice then
		return;
	end
	MUIVoice.load_options(true);
	mui_voice:resize();
	ArmStatic.align_corners(mui_voice._panel);
end

function MUIVoice.toggle_layer(force_state)
	local mui_voice = managers.hud._mui_voice;
	if not mui_voice then
		return;
	end
	local panel = mui_voice._panel;
	
	if force_state == false or panel:layer() > 0 then
		if not mui_voice._enabled then panel:hide(); end
		ArmStatic.remove_corners(panel);
		panel:set_layer(0);
	else
		panel:show();
		ArmStatic.create_corners(panel);
		panel:set_layer(1200);
	end
end

--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.MUISubtitle = _G.MUISubtitle or class();
ArmStatic.void(MUISubtitle, {
	"presenter","set_presenter", "set_enabled",
	"load_sequences", "reload_sequences", "set_visible",
	"update", "show_subtitle_localized", "run_subtitle_sequence",
	"subtitle_sequence_ids", "has_subtitle_sequence",
	"_update_presenter_visibility"
});
local lerp = math.lerp;

function MUISubtitle:init()
	self.load_options();
	local ws = self._muiWorkspace == 2 and managers.gui_data:create_fullscreen_workspace() or
			managers.gui_data:create_saferect_workspace();
	local parent = ws:panel();
	local panel = parent:panel({
		name = "subtitle_panel",
		layer = 150
	});
	self._workspace = ws;
	self._parent = parent;
	self._panel = panel;
	self._enabled = true;
	self._items = {};
	self.len = 0;
	self._font = ArmStatic.font_index(self._muiFont);
	self._muiCor = ArmStatic.correction_index(self._muiFont);
	self._last_time = 0;

	self:resize();
end

function MUISubtitle:inc() self.len = self.len + 1; return self.len; end
function MUISubtitle:dec() self.len = self.len - 1; return self.len; end

function MUISubtitle:new_item(opt)
	local items = self._items;
	local i = self:inc();
	local limit = self._muiLimit;
	local item = MUISubtitleItem:new({
		parent = opt.parent or self._panel;
		name = opt.name or "subtitle_item";
		text = opt.text or "",
		font = opt.font or self._font,
		aspd = opt.aspd or self._muiASPD,
		time = opt.time or 3,
		state = opt.state or 1,
		w = self._muiSize * self._muiWMul,
		h = self._muiSize / 10,
		callback_opt = self._enabled and { self, "phase" }
	});
	items[i] = item;
	if not self._enabled then
	elseif i > limit then
		self:phase();
	else
		self:on_state_changed();
	end
	return item;
end

function MUISubtitle:resize()
	local panel = self._panel;
	local items = self._items;

	local size = self._muiSize;
	local alpha = self._muiAlpha;
	local s10 = size / 10;
	local rows = self._muiRows;
	local width = self._muiWMul;
	local hMargin = self._muiHMargin;
	local vMargin = self._muiVMargin;
	local hPos = self._muiHPos;
	local vPos = self._muiVPos;

	for i=1, self.len do
		items[i]:set_size(size * width, s10);
	end
	
	Figure(panel):view(alpha):shape(size * width, s10 * rows):align(hPos, vPos, hMargin, vMargin);
	self:reposition();
end


function MUISubtitle:get_data()
	local panel = self._panel;
	local items = self._items;
	local top = self._muiOrigin == 1;
	local gap = self._muiGap;
	local y = 0;
	local result = {};

	for i = self.len, 1, -1 do
		local item = items[i]
		if item and item.panel then
			local ip = item.panel;
			local visible = ip:visible();
			result[i] = {
				panel = ip,
				new_pos = top and y or (panel:h() - y - ip:h()),
				old_pos = visible and ip:y() or (top and -ip:h() or panel:h()),
				alpha = visible and ip:alpha() or 0;
				state = item.state
			};
			y = y + ip:h() + gap;
		end
	end
	return result;
end

function MUISubtitle:animate_reposition(opt)
	opt = opt or {};
	local t, end_t, clbk = 0, opt[1] or 0, opt[2];
	local children = self:get_data();
	while t < end_t do
		t = t + coroutine.yield();
		for i=1, #children do
			local child = children[i];
			local old_pos, new_pos, panel, visible = child.old_pos, child.new_pos, child.panel, child.state == 1;
			panel:set_alpha(math.lerp(child.alpha, visible and 1 or 0, t / end_t));
			panel:set_visible(true);
			panel:set_y(lerp(old_pos, new_pos, t / end_t));
		end
	end
	for i=self.len, 1, -1 do
		local child = children[i];
		local pos, panel, visible = child.new_pos, child.panel, child.state == 1;
		panel:set_alpha(visible and 1 or 0);
		panel:set_visible(visible);
		panel:set_y(pos);
		if not visible then self:_remove(i); end
	end
	if clbk then setup:add_end_frame_clbk(clbk); end
end

function MUISubtitle:on_state_changed()
	if not self._enabled then return; end
	local panel = self._panel;
	panel:stop();
	panel:animate(callback(self, self, "animate_reposition", { self._muiASPD }));
end

function MUISubtitle:reposition()
	self._panel:stop();
	self:animate_reposition();
end

function MUISubtitle:phase(caller)
	-- If'n a more recent subtitle finishes first, phase out anything older as well.
	local items, c = self._items, caller and self.len or 1;

	for i=1, c do
		local item = items[i];
		if item then
			item.panel:stop();
			item.state = 0;
			if item == caller then break; end
		end
	end
	self:on_state_changed();
end

function MUISubtitle:_remove(i)
	local item = table.remove(self._items, i);
	self._panel:remove(item.panel);
	self:dec();
end

function MUISubtitle:show_subtitle(id, time, macros)
	if not self._enabled or self:is_showing_subtitle(id) then return; end
	local text = managers.localization:text(id, macros);
	self:new_item({ text = text, time = time });
	
	self._last_id = id;
	self._last_time = Application:time() + 5 + self._muiASPD;
end


function MUISubtitle:clear_subtitle()
	local items = self._items;
	for i=1, self.len do
		local item = items[i];
		items[i] = nil;
		self._panel:remove(item.panel);
	end
	self.len = 0;
end

function MUISubtitle:enabled()
	return self._enabled;
end

function MUISubtitle:visible()
	return self._panel:visible();
end

function MUISubtitle:is_showing_subtitle(id)
	return self._last_id == id and Application:time() < self._last_time;
end

function MUISubtitle:is_showing_subtitles()
	return self:enabled() and self:visible();
end

function MUISubtitle:destroy()
	if alive(self._panel) then
		self:clear_subtitle();
		self._panel:stop();
		self._panel:clear();
	end
	if alive(self._workspace) then
		managers.gui_data:destroy_workspace(self._workspace);
	end
	self._panel = nil;
	self._workspace = nil;
	self:set_enabled(false);
end

function MUISubtitle.load_options(force_load)
	if MUISubtitle._options and not force_load then return; end
	
	local data = MUIMenu._data;
	MUISubtitle._muiSize = data.mui_subtitle_size or 200;
	MUISubtitle._muiAlpha = (data.mui_subtitle_alpha or 100)*0.01;
	MUISubtitle._muiWMul = data.mui_subtitle_wmul or 4;
	MUISubtitle._muiRows = data.mui_subtitle_rows or 6;
	MUISubtitle._muiGap = data.mui_subtitle_gap or 0;
	MUISubtitle._muiLimit = (data.mui_subtitle_limit or 3);
	MUISubtitle._muiOrigin = data.mui_subtitle_origin or 2;
	MUISubtitle._muiASPD = (data.mui_subtitle_aspd or 500)*0.001;
	MUISubtitle._muiHMargin = data.mui_subtitle_h_marg or 80;
	MUISubtitle._muiVMargin = data.mui_subtitle_v_marg or 80;
	MUISubtitle._muiHPos = data.mui_subtitle_h_pos or 2;
	MUISubtitle._muiVPos = data.mui_subtitle_v_pos or 3;
	MUISubtitle._muiFont = data.mui_font_pref or 4;
	MUISubtitle._muiWorkspace = data.mui_workspace or 1;
	MUISubtitle._options = true;
end

function MUISubtitle.resize_all()
	local subtitle = managers.subtitle;
	if not subtitle or not subtitle.resize then
		return;
	end

	MUISubtitle.load_options(true);
	subtitle:resize();
	ArmStatic.align_corners(subtitle._panel);
end

function MUISubtitle:demo()
	self:new_item({ text = managers.localization:text("pln_ca1_intro_01_02") });
	self:new_item({ text = managers.localization:text("pln_man_00a_01") });
	self:new_item({ text = managers.localization:text("pln_branchbank_depositbox_stage1_intro_a_02") });
	self:new_item({ text = managers.localization:text("pln_branchbank_depositbox_stage1_intro_a_02b") });
	self:reposition();
end

function MUISubtitle.toggle_layer(force_state)
	local subtitle = managers.subtitle;
	if not subtitle or not subtitle.resize then
		return;
	end
	
	if force_state == false or subtitle._panel:layer() > 150 then
		subtitle._enabled = true;
		ArmStatic.remove_corners(subtitle._panel);
		subtitle:clear_subtitle();
		subtitle._panel:set_layer(150);
	else
		subtitle._enabled = false;
		ArmStatic.create_corners(subtitle._panel);
		subtitle:clear_subtitle();
		subtitle:demo();
		subtitle._panel:set_layer(1200);
	end
end

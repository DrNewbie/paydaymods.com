--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.MUIPresent = _G.MUIPresent or class();
local assign = ArmStatic.assign;
local max, upper = math.max, utf8.to_upper;

function MUIPresent:init(hud)
	self.load_options();
	hud = hud or managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2);
	local panel = hud.panel:panel({ name = "present_panel" });
	self._font = ArmStatic.font_index(self._muiFont);
	self._enabled = true;
	
	self._panel = panel;
	self._hud_panel = hud.panel;
	self._attr =  { parent=panel, name="present_item_", font=self._font };
	self._items = { self:new_item({callback=callback(self, self, "dispose", 1)}) };
	self._queue = {};
	
	self:resize();
end

function MUIPresent:new_item(attr)
	local items = self._items;
	attr.name = attr.name or self._attr.name .. (items and #items or 0)+1;
	attr.aspd = attr.aspd or self._muiASPD;
	attr.simple = attr.simple or self._muiSimple;
	return MUIPresentItem:new( assign({}, self._attr, attr) );
end

function MUIPresent:present(data)
	local item = self._items[1];
	if item._presenting then return self:present_new(data); end
	item:set_data(self:prepare(data));
	self:resize();
	item:present();
end

function MUIPresent:present_new(data)
	local items = self._items;
	local i = #items+1;
	if not self._enabled or i > self._muiLimit then return self:queue(data); end
	
	local text, event = self:prepare(data);
	local new_item = self:new_item({ text=text, event=event, callback=callback(self, self, "dispose", i) });
	items[#items+1] = new_item;
	self:resize();
	new_item:present();
end

function MUIPresent:dispose(index)
	local items = self._items;
	local item = items[index];
	
	item._panel:stop();
	local data = self:queue_shift();
	if data then
		item:set_data(self:prepare(data));
		item:present();
		self:resize();
	elseif index == 1 then
		item:hide();
	else
		items[index] = nil;
		self._panel:remove(item._panel);
	end
end

function MUIPresent:prepare(data)
	local text = string.format("%s\n%s", upper(data.title), upper(data.text));
	return text, self._muiSound and data.event;
end

function MUIPresent:queue(data)
	local queue = self._queue;
	queue[#queue+1] = data;
end

function MUIPresent:queue_shift()
	return table.remove(self._queue, 1);
end

function MUIPresent:demo()
	local items = self._items;
	for i, _ in ipairs(items) do self:dispose(i); end
	for i=1,3 do
		local item = items[i];
		local text = self:prepare({title="PANEL #"..i, text="Vivamus fermentum semper porta."});
		if item then
			item:set_text(text);
		else
			items[#items+1] = self:new_item({ text=text,callback=callback(self, self, "dispose", i) });
		end
	end
	self:resize();
end


function MUIPresent.load_options(force_load)
	if MUIPresent._options and not force_load then return; end
	
	local data = MUIMenu._data;
	MUIPresent._muiSize = data.mui_pst_size or 20;
	MUIPresent._muiAlpha = (data.mui_pst_alpha or 100)*0.01;
	MUIPresent._muiOrder = data.mui_pst_order or 1;
	MUIPresent._muiLimit = data.mui_pst_limit or 4;
	MUIPresent._muiGap = data.mui_pst_gap or 10;
	MUIPresent._muiDir = data.mui_pst_dir or 2;
	MUIPresent._muiSimple = data.mui_pst_simple == true;
	MUIPresent._muiSound = data.mui_pst_sound == true;
	MUIPresent._muiASPD = (data.mui_pst_aspd or 3000)*0.001;
	MUIPresent._muiHMargin = data.mui_pst_h_marg or 60;
	MUIPresent._muiVMargin = data.mui_pst_v_marg or 60;
	MUIPresent._muiHPos = data.mui_pst_h_pos or 3;
	MUIPresent._muiVPos = data.mui_pst_v_pos or 1;
	MUIPresent._muiFont = data.mui_font_pref or 4;
	MUIPresent._options = true;
end

function MUIPresent:resize()
	local panel = self._panel;
	local items = self._items;
	
	local size = self._muiSize;
	local s4 = size * 0.04;
	local alpha = self._muiAlpha;
	local aspd = self._muiASPD;
	local limit = max(self._muiLimit, #items);
	local simple = self._muiSimple;
	local hMargin = self._muiHMargin;
	local vMargin = self._muiVMargin;
	local hPos = self._muiHPos;
	local vPos = self._muiVPos;
	local gap = self._muiGap;
	local order = self._muiOrder == 1;
	local dir = self._muiDir + 1;

	local sibling = nil;
	for i = limit, 1, -1 do
		local item = items[order and (limit + 1 - i) or i];
		if item then 
			item._aspd = aspd;
			item._simple = simple;
			local pnl = item._panel;
			local text = item._text;
			local top = item._border_top;
			local bot = item._border_bot;

			Figure(text):rect(size):lead();
			local width, height = text:w(), text:h();

			Figure(top):shape(width * 0.7, s4);
			Figure(bot):shape(top:w(), s4):move(nil, text:h() - s4);
			Figure(pnl):shape(width, height):attach(sibling, dir, gap);

			sibling = pnl;
		end
	end

	Figure(panel):view(alpha):adapt():align(hPos, vPos, hMargin, vMargin);
end

function MUIPresent.resize_all()
	local muipst = managers.hud._hud_presenter;
	if not muipst then
		return;
	end
	local items = muipst._items;
	local alc = ArmStatic.align_corners;
	MUIPresent.load_options(true);
	muipst:resize();
	for _, item in ipairs(items) do
		alc(item._panel);
	end
end

function MUIPresent.toggle_layer(force_state)
	local muipst = managers.hud._hud_presenter;
	if not muipst then
		return;
	end
	local panel = muipst._panel;
	local items = muipst._items;
	local rmc = ArmStatic.remove_corners;
	local cac = ArmStatic.create_corners;
	
	if force_state == false or panel:layer() > 0 then
		muipst._enabled = true;
		for i, item in ipairs(items) do
			rmc(item._panel);
			muipst:dispose(i);
		end
		panel:set_layer(0);
	else
		muipst._enabled = false;
		muipst:demo();
		for _, item in ipairs(items) do
			cac(item._panel);
			item:show();
		end
		panel:set_layer(1200);
	end
end

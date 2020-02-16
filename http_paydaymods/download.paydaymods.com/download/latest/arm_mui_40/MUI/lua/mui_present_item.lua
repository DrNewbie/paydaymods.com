--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.MUIPresentItem = _G.MUIPresentItem or class();
local visibility = ArmStatic.visibility;


function MUIPresentItem:init(attr)
	local parent = attr.parent;
	self._parent = parent;
	self._presenting = false;
	self._callback = attr.callback;
	self._event = attr.event;
	self._simple = attr.simple;
	self._aspd = attr.aspd or 3;
	
	local panel = parent:panel({
		name = attr.name or "present_item",
		visible = false
	});
	self._panel = panel;
	self._text = panel:text({
		font = attr.font,
		align = "left",
		text = attr.text or "",
		layer = 0
	});
	self._border_top = panel:rect({
		name = "border_top",
		color = Color.white,
		layer = 1
	});
	self._border_bot = panel:rect({
		name = "border_bot",
		color = Color.white,
		layer = 1
	});
end
function MUIPresentItem:visible()
	return self._text:visible();
end
function MUIPresentItem:set_data(text, event)
	self:set_text(text);
	self:set_event(event);
end
function MUIPresentItem:set_text(text)
	self._text:set_text(text);
end
function MUIPresentItem:set_event(event)
	self._event = event;
end
function MUIPresentItem:animate(attr)
	local p, pt, bt, bb = self._panel, self._text, self._border_top, self._border_bot;
	visibility(true, 0, pt);
	visibility(true, 1, bt, bb, p);
	
	local t = 0;
	local bw = bt:w();
	local bt_s1 = pt:right();
	local bt_s2 = bt_s1-bw;
	local bb_s1 = pt:x()-bw;
	local bb_s2 = pt:x();
	
	attr = attr or {};
	local fade_t = attr[1] or 0.5;
	local end_t = attr[2] or 3;
	local clbk = attr[3];
	
	local lip = math.lerp;
	local min = math.min;
	while t < fade_t do
		t = t + coroutine.yield();
		local prog = min(t / fade_t,1);
		pt:set_alpha(lip(0, 1, prog));
		bt:set_x(lip(bt_s1, bt_s2, prog));
		bb:set_x(lip(bb_s1, bb_s2, prog));
	end
	t = 0;
	while t < end_t do
		t = t + coroutine.yield();
		local prog = min(t / end_t,1);
		bt:set_x(lip(bt_s2, bb_s2, prog));
		bb:set_x(lip(bb_s2, bt_s2, prog));
	end
	t = 0;
	while t < fade_t do
		t = t + coroutine.yield();
		local prog = min(t / fade_t, 1);
		pt:set_alpha(lip(1, 0, prog));
		bt:set_x(lip(bb_s2, bb_s1, prog));
		bb:set_x(lip(bt_s2, bt_s1, prog));
	end
	pt:set_alpha(0);
	pt:set_visible(false);
	if clbk then setup:add_end_frame_clbk(clbk); end
end
function MUIPresentItem:animate_simple(attr)
	local p, pt = self._panel, self._text;
	visibility(true, 0, pt);
	visibility(true, 1, p);
	visibility(false, 0, self._border_bot, self._border_top);
	
	local t = 0;
	
	attr = attr or {};
	local fade_t = attr[1] or 0.5;
	local end_t = attr[2] or 3;
	local clbk = attr[3];
	
	local lip = math.lerp;
	while t < fade_t do
		t = t + coroutine.yield();
		pt:set_alpha(lip(0, 1, t / fade_t));
	end
	t = 0;
	while t < end_t do
		t = t + coroutine.yield();
	end
	t = 0;
	while t < fade_t do
		t = t + coroutine.yield();
		pt:set_alpha(lip(1, 0, t / fade_t));
	end
	pt:set_alpha(0);
	pt:set_visible(false);
	if clbk then setup:add_end_frame_clbk(clbk); end
end
function MUIPresentItem:show()
	self._presenting = true;
	local p, pt, bt, bb = self._panel, self._text, self._border_top, self._border_bot;
	p:stop();
	
	visibility(true, 1, p, pt);
	visibility(false, 1, bt, bb);
end
function MUIPresentItem:hide()
	local panel = self._panel;
	panel:stop();
	panel:hide();
	self._presenting = false;
end
function MUIPresentItem:stop()
	self._panel:stop();
end
function MUIPresentItem:present()
	self._presenting = true;
	if self._event then managers.hud._sound_source:post_event(self._event); end
	self._panel:stop();
	self._panel:animate(callback(self, self, self._simple and "animate_simple" or "animate", {self._aspd/6, self._aspd, self._callback}));
end
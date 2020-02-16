--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.MUISubtitleItem = _G.MUISubtitleItem or class();

function MUISubtitleItem:init(opt)
	local parent = opt.parent;
	self._parent = parent;
	self.text = opt.text;
	self.panel = parent:text({
		name = opt.name or "subtitle_item",
		text = opt.text,
		font = opt.font,
		visible = false,
		align = "center",
		vertical = "bottom",
		wrap = true,
		word_wrap = true
	});
	self._time = opt.time;
	self.state = opt.state;
	if opt.w and opt.h then
		self:set_size(opt.w, opt.h);
	end
	if opt.callback_opt then
		self:start_delayed_clbk(opt.callback_opt);
	end
end

function MUISubtitleItem:delayed_clbk(opt)
	local t = 0;
	
	opt = opt or {};
	local end_t = opt[1] or 0.5;
	local clbk = opt[2];
	if not clbk then return; end

	while t < end_t do
		t = t + coroutine.yield();
	end

	setup:add_end_frame_clbk(clbk);
end

function MUISubtitleItem:set_size(width, height)
	local panel = self.panel;
	panel:set_size(width, height);
	panel:set_font_size(height);
	local _,_,_,h_rect = panel:text_rect();
	panel:set_h(h_rect);
end

function MUISubtitleItem:start_delayed_clbk(opt)
	local panel, target, func = self.panel, opt[1], opt[2];
	if target and func then
		panel:stop();
		panel:animate(callback(self, self, "delayed_clbk", {self._time, callback(target, target, func, self)}));
	end
end

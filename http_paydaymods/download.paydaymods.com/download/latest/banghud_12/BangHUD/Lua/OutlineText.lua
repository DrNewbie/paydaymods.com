
OutlineText = OutlineText or class()

function OutlineText:init(panel, data)

	-- unset forbidden params
	data.w = nil
	data.h = nil
	data.name = nil
	data.shadow = nil

	-- shift font size
	data.font_size = data.font_size - 2 -- take outline size in account

	-- create main panel
	self._panel = panel:panel(data)

	-- create text
	data.x = 1 -- take outline size in account
	data.y = 1 -- take outline size in account
	data.layer = 1 -- layer on top of outline
	data.visible = true -- controlled by _panel
	data.align = "left" -- controlled by _panel
	data.vertical = "top" -- controlled by _panel
	self._text = self._panel:text(data)

	-- create outline
	data.layer = 0
	data.color = Color.black:with_alpha(0.5)
	self._bgs = {}
	for i = 1, 4 do
		table.insert(self._bgs, self._panel:text(data))
	end

	-- position outline
	self._bgs[1]:set_position(0, 0)
	self._bgs[2]:set_position(2, 0)
	self._bgs[3]:set_position(0, 2)
	self._bgs[4]:set_position(2, 2)

	-- resize panel
	self:_update_size()
end

function OutlineText:_update_size()
	local _, _, w, h = self:text_rect()
	self._panel:set_size(w, h)
end

function OutlineText:text_rect(...)
	local _, _, w, h = self._text:text_rect(...)
	return 0, 0, w + 2, h + 2 -- take outline size account
end

function OutlineText:alive(...)
	return self._panel and self._panel:alive(...)
end

-------------------------------------------------
-- TEXT -----------------------------------------
-------------------------------------------------

function OutlineText:text(...)
	return self._text:text(...)
end

function OutlineText:set_text(...)
	self._text:set_text(...)
	for i = 1, 4 do
		self._bgs[i]:set_text(...)
	end
	self:_update_size()
end

function OutlineText:font(...)
	return self._text:font(...)
end

function OutlineText:set_font(...)
	self._text:set_font(...)
	for i = 1, 4 do
		self._bgs[i]:set_font(...)
	end
	self:_update_size()
end

function OutlineText:font_size(...)
	return self._text:font_size(...) + 2 -- take outline size in account
end

function OutlineText:set_font_size(size, ...)
	self._text:set_font_size(size - 2, ...) -- take outline size in account
	for i = 1, 4 do
		self._bgs[i]:set_font_size(size - 2, ...)
	end
	self:_update_size()
end

function OutlineText:color(...)
	return self._text:color(...)
end

function OutlineText:set_color(...)
	self._text:set_color(...)
end

function OutlineText:font_color(...)
	return self:color(...)
end

function OutlineText:set_font_color(...)
	self:set_color(...)
end

-------------------------------------------------
-- POSITION -------------------------------------
-------------------------------------------------

function OutlineText:bottom(...)
	return self._panel:bottom(...)
end

function OutlineText:set_bottom(...)
	self._panel:set_bottom(...)
end

function OutlineText:center(...)
	return self._panel:center(...)
end

function OutlineText:set_center(...)
	self._panel:set_center(...)
end

function OutlineText:center_x(...)
	return self._panel:center_x(...)
end

function OutlineText:set_center_x(...)
	self._panel:set_center_x(...)
end

function OutlineText:center_y(...)
	return self._panel:center_y(...)
end

function OutlineText:set_center_y(...)
	self._panel:set_center_y(...)
end

function OutlineText:left(...)
	return self._panel:left(...)
end

function OutlineText:set_left(...)
	self._panel:set_left(...)
end

function OutlineText:leftbottom(...)
	return self._panel:leftbottom(...)
end

function OutlineText:set_leftbottom(...)
	self._panel:set_leftbottom(...)
end

function OutlineText:lefttop(...)
	return self._panel:lefttop(...)
end

function OutlineText:set_lefttop(...)
	self._panel:set_lefttop(...)
end

function OutlineText:position(...)
	return self._panel:position(...)
end

function OutlineText:set_position(...)
	self._panel:set_position(...)
end

function OutlineText:right(...)
	return self._panel:right(...)
end

function OutlineText:set_right(...)
	self._panel:set_right(...)
end

function OutlineText:rightbottom(...)
	return self._panel:rightbottom(...)
end

function OutlineText:set_rightbottom(...)
	self._panel:set_rightbottom(...)
end

function OutlineText:righttop(...)
	return self._panel:righttop(...)
end

function OutlineText:set_righttop(...)
	self._panel:set_righttop(...)
end

function OutlineText:top(...)
	return self._panel:top(...)
end

function OutlineText:set_top(...)
	self._panel:set_top(...)
end

function OutlineText:x(...)
	return self._panel:x(...)
end

function OutlineText:set_x(...)
	self._panel:set_x(...)
end

function OutlineText:y(...)
	return self._panel:y(...)
end

function OutlineText:set_y(...)
	self._panel:set_y(...)
end

function OutlineText:align(...)
	return self._panel:align(...)
end

function OutlineText:set_align(...)
	self._panel:set_align(...)
end

function OutlineText:vertical(...)
	return self._panel:vertical(...)
end

function OutlineText:set_vertical(...)
	self._panel:set_vertical(...)
end

function OutlineText:layer(...)
	return self._panel:layer(...)
end

function OutlineText:set_layer(...)
	self._panel:set_layer(...)
end

-------------------------------------------------
-- VISIBILITY -----------------------------------
-------------------------------------------------

function OutlineText:alpha()
	return self._panel:alpha()
end

function OutlineText:set_alpha(...)
	self._panel:set_alpha(...)
end

function OutlineText:visible(...)
	return self._panel:visible(...)
end

function OutlineText:set_visible(...)
	self._panel:set_visible(...)
end
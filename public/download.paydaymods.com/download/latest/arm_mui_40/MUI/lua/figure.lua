--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------

--------
-- A functional resize builder designed for comprehensible brevity by way of assumptions, flags and side-effects.
-- Reading source code is recommended, call order is significant.
--
-- A figure call by design cannot intersect with another, rethink your structure if staggered calls is a tool you are reaching for.
-- @module Figure
-- @author Armithaig
-- @license GPLv3
-- @usage Figure(target):view(true):shape(4, 8):align(2, 1): ...
--------
local Figure, Figures = {}, {};
local object, host, objects = false, false, false;
local relative, recursion = false, 0;

local align = {
	function(od, pd, m) return 0 + m; end, -- 1: Top/Left
	function(od, pd, m) return (pd - od) / 2; end, -- 2: Center
	function(od, pd, m) return pd - od - m; end -- 3: Bottom/Right
};

--------
-- Initiate a Figure call.
-- @param obj The target object or array of objects.
function _G.Figure(obj)
	Figure:reset();
	if obj[1] then
		objects = obj;
		return Figures;
	end
	Figure:object(obj);
	return Figure;
end

--------
-- Align object within container.
-- @tparam number xp The X position.
-- @tparam number yp The Y position, defaults to X position.
-- @tparam number xm The X margin.
-- @tparam number ym The Y margin, defaults to X margin.
function Figure:align(xp, yp, xm, ym)
	yp = yp or xp;
	ym = ym or xm;
	
	local parent = host or object:parent();
	
	local x = align[xp](object:w(), parent:w(), xm or 0);
	local y = align[yp](object:h(), parent:h(), ym or 0);
	
	return self:move(x, y);
end

local attach = {
	function(o, a, m, j) return
		a:x() + align[j](o:w(), a:w(), 0),
		a:y() - o:h() - m;
	end,
	function(o, a, m, j) return
		a:right() + m,
		a:y() + align[j](o:h(), a:h(), 0);
	end,
	function(o, a, m, j) return
		a:x() + align[j](o:w(), a:w(), 0),
		a:bottom() + m;
	end,
	function(o, a, m, j) return
		a:x() - o:w() - m,
		a:y() + align[j](o:h(), a:h(), 0);
	end
};

--------
-- Align object relative to sibling anchor.
-- @param anchor The mounting point for repositioning.
-- @tparam number p The position around the anchor, clockwise from top, defaults to 1.
-- @tparam number m The margin between object and anchor, defaults to 0.
-- @tparam number j The justification along the secondary axis, defaults to 1.
function Figure:attach(anchor, p, m, j)
	if not anchor then return self:move(0, 0); end
	p = p or 1;
	m = m or 0;
	j = j or 1;
	
	local x, y = attach[p](object, anchor, m, j);
	
	return self:move(x, y);
end

--------
-- Adapt object to fit children or specific child.
-- @param apogee The child at the furthest distance from origin requiring adaptation, optional.
function Figure:adapt(apogee)
	local w, h = -1, -1;
	if apogee then
		w = apogee:right();
		h = apogee:bottom();
	else
		local children = object:children();
		
		for i=1, #children do
			local ch = children[i];
			if ch:layer() ~= 51 then
				local r, b = ch:right(), ch:bottom();
				w = w > r and w or r;
				h = h > b and h or b;
			end
		end
	end
	
	return self:shape(w, h);
end

--------
-- Place object as a faux-child of anchor or child of anchor and make all positioning relative to new position.
-- Useful in cases where you either cannot alter the child structure or within an anchor that is not actually capable of children.
-- @param anchor The anchor object, should be a sibling to figure object.
-- @param ... Child names under anchor.
function Figure:leech(anchor, ...)
	local names = {...};
	self:move(anchor:x(), anchor:y());
	
	for i=1, #names do
		anchor = anchor:child(names[i]);
		self:shift(anchor:x(), anchor:y());
	end
	
	host = anchor;
	relative = true;
	
	return self;
end

--------
-- Toggle whether positioning is relative to current position.
-- @tparam boolean b Defaults to true.
function Figure:relate(b)
	relative = b ~= false;
	return self;
end

--------
-- Set the recursion depth of loops.
-- @tparam boolean|number r The recursion depth, defaults to 250.
function Figure:recur(r)
	recursion = r or 250;
	return self;
end

--------
-- Run user-defined function on all children.
-- @tparam function func The function executed on all children, taking Figure, Parent and Sibling as parameters.
-- @param ... Additional parameters for the child function.
function Figure:progeny(func, ...)
	local parent = object;
	local sibling = nil;
	local children = parent:children();
	
	for i=1, #children do
		object = children[i];
		
		if object:layer() ~= 51 then
			func(self, parent, sibling, ...);
			sibling = object;
			if recursion > 0 and object.children then
				recursion = recursion - 1;
				self:progeny(func, ...);
				recursion = recursion + 1;
			end
		end
	end
	
	object = parent;
	return self;
end

--------
-- Shape all children.
-- @tparam number w The width, or recursion if boolean, defaults to parent width.
-- @tparam number h The height, defaults to width or parent height.
-- @tparam number f The font size, defaults to height.
function Figure:spank(w, h, f)
	h = h or w or object:h();
	w = w or object:w();
	local function smack(fgr, p) fgr:shape(w, h, f); end
	return self:progeny(smack);
end

--------
-- Move object to specific coordinates.
-- @tparam number x X-axis, optional.
-- @tparam number y Y-axis, optional.
function Figure:move(x, y)
	if relative then return self:shift(x, y); end
	if x then object:set_x(x); end
	if y then object:set_y(y); end
	
	return self;
end	

--------
-- Shift object from its current position by specified amount.
-- Precede with absolute positioning.
-- @tparam number x Amount shifted on X-axis, optional.
-- @tparam number y Amount shifted on Y-axis, optional.
function Figure:shift(x, y)
	if x then object:set_x(object:x() + x); end
	if y then object:set_y(object:y() + y); end
	
	return self;
end

--------
-- Set the abscissa.
-- @tparam number x X-axis.
function Figure:abs(x)
	object:set_x(x);
	return self;
end

--------
-- Set the ordinate.
-- @tparam number y Y-axis.
function Figure:ord(y)
	object:set_y(y);
	return self;
end


--------
-- Set the basic shape of the object.
-- @tparam number w The width.
-- @tparam number h The height, defaults to width.
-- @tparam number f The font size, defaults to height.
function Figure:shape(w, h, f)
	h = h or w;
	if w then object:set_w(w); end
	if h then object:set_h(h); end
	
	if object.set_font_size then
		object:set_font_size(f or h or object:h());
	end
	
	return self;
end

--------
-- Rectangulate size of the text object based on font size.
-- @tparam number f The font size.
-- @tparam number w The width override, defaults to text rectangle.
-- @tparam number h The height override, defaults to text rectangle.
function Figure:rect(f, w, h)
	if f then object:set_font_size(f); end
	if w then object:set_w(w); end
	if h then object:set_h(h); end

	
	local _, _, w_rect, h_rect = object:text_rect();
	object:set_size(w or w_rect, h or h_rect);
	
	return self;
end

--------
-- Fill rest of space in axis of parent.
-- Typically used for text elements of variable length.  
-- @tparam number axis The axis to fill (1:x, 2:y).
-- @see [MUIStats.resize](https://gitlab.com/Armithaig/pd2-mui/blob/master/MUI/lua/mui_stats.lua)
function Figure:fill(axis)
	axis = axis or 1;

	local parent = host or object:parent();

	if axis == 1 then
		object:set_w(parent:world_x() + parent:w() - object:world_x());
	elseif axis == 2 then
		object:set_h(parent:world_y() + parent:h() - object:world_y());
	end
end

--------
-- Restrict the object to an upper size limit.
-- @tparam number w The max width the object may occupy.
-- @tparam number h The max height the object may occupy.
function Figure:cusp(w, h)
	if w and object:w() > w then object:set_w(w); end
	if h and object:h() > h then object:set_h(h); end

	return self;
end

--------
-- Restrict the object to a lower size limit.
-- @tparam number w The min width the object may occupy.
-- @tparam number h The min height the object may occupy.
function Figure:base(w, h)
	if w and object:w() < w then object:set_w(w); end
	if h and object:h() < h then object:set_h(h); end

	return self;
end


--------
-- Shrink away to make space for the target if necessary.
-- @param sibling The target panel to elude.
-- @todo
function Figure:elude(target)
	local x, y = object:world_x(), object:world_y();
	local sx, sy = sibling:world_x(), sibling:world_y();
	local w, h, sw, sh = object:size(), sibling:size();
end

--------
-- Correct bitmap aspect ratio based on texture dimensions.
-- @tparam number tw The texture width.
-- @tparam number th The texture height.
-- @tparam boolean force Force adjustment along a certain dimension.
function Figure:aspect(tw, th, force)
	tw = tw or object:texture_width();
	th = th or object:texture_height();
	if force == 1 or tw > th then
		object:set_h(th / tw * object:w());
	elseif force == 2 or th > tw then
		object:set_w(tw / th * object:h());
	end
	
	return self;
end

--------
-- Set the object colour.
-- @param c The colour.
function Figure:stain(c)
	object:set_color(c);
	return self;
end

--------
-- Set the object rotation.
-- @tparam number r The rotation.
function Figure:cycle(r)
	object:set_rotation(r);
	return self;
end

local font_jump = {
	[Idstring("fonts/font_small_mf"):key()] = 0.01,
	[Idstring("fonts/font_medium_mf"):key()] = 0.05,
	[Idstring("fonts/font_medium_shadow_mf"):key()] = -0.04,
	[Idstring("fonts/font_large_mf"):key()] = 0.06
};

--------
-- Lead the text object so it aligns with other block elements based on font.
-- Do not adjust other elements based on the ordinate of a leaded text.
function Figure:lead()
	if object.font then
		local font = object:font():key();
		local correct = font_jump[font];
		if correct then
			object:set_y(object:font_size() * correct);
		end
	end
	return self;
end

--------
-- Set the visibility and/or alpha value of the object.
-- @tparam boolean|number v The visibility, or alpha value if a number.
-- @tparam number a The alpha value.
function Figure:view(v, a)
	if type(v) == "number" then a = v;
	else object:set_visible(v); end
		
	if a then object:set_alpha(a); end
	return self;
end

--------
-- Set and/or get the target object.
-- You shouldn't need to use this except in very rare situations.
-- @param obj The target object, optional.
function Figure:object(obj)
	if obj then
		object = obj;
	end
	return object;
end

--------
-- Restore chunk variables to their defaults.
function Figure:reset()
	host = false;
	relative = false;
	recursion = 0;
	return self;
end

function Figure:get(p)
	return object[p];
end

-- Handle arrays of objects with identical adjustments.
for k in pairs(Figure) do
	Figures[k] = function(self, ...)
		for i=1, #objects do
			Figure:object(objects[i]);
			Figure[k](Figure, ...);
		end
		return self;
	end
end


--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.AnimatedList = _G.AnimatedList or class();
local lerp = math.lerp;

function AnimatedList:init(parent, data)
	data = data or {};
	local name = data.name or "animated_list";
	self._name = name;
	
	self:load_data(data);
	-- If list is acting as faux panel no container panel will be created, all child panels will be created under the parent.
	-- Visually there's no difference but it helps if you need to maintain a certain panel structure for compatibility.
	local faux = data.faux == true;
	self._faux = faux;
	self._parent = parent;
	self._panel = faux and parent or parent:panel({ name = name });
	-- x,y,w,h of faux panel
	self._shape = {0,0,0,0};
	
	-- Will not update positions/enable until first reposition has been called manually.
	-- This to allow creation/scaling/manipulation of children before any animation starts.
	self._enabled = false;
	self._debug = data.debug;
	self._children = {};
	self._panels = {};
	self.len = 0;
end

function AnimatedList:inc() self.len = self.len + 1; return self.len; end
function AnimatedList:dec() self.len = self.len - 1; return self.len; end

function AnimatedList:create_child(type, data)
	local panel = self._panel;
	if data.layer == 51 then return panel[type](panel, data); end

	local state = (data.visible ~= false and 2) or 1;
	data.visible = false;
	panel:stop();
	local len, child = self:inc(), panel[type](panel, data);
	-- STATES: 0 Remove, 1 Hide, 2 Show, 3 Persist
	self._children[len] = { panel = child, state = state, max_alpha = data.alpha or 1 };
	self._panels[len] = child;
	if self._enabled and state >= 2 then
		setup:add_end_frame_clbk(callback(self, self, "dirty"));
	end
	return child;
end

function AnimatedList:name()
	return self._name;
end

function AnimatedList:parent()
	local panel = self._panel;
	return self._faux and panel or panel:parent();
end

function AnimatedList:layer()
	return not self._faux and self._panel:layer() or 0;
end

function AnimatedList:bitmap(data)
	return self:create_child("bitmap", data);
end

function AnimatedList:panel(data)
	return self:create_child("panel", data);
end

function AnimatedList:text(data)
	return self:create_child("text", data);
end

function AnimatedList:child(id)
	return self._panel:child(id);
end

function AnimatedList:children()
	return self._panels;
end

function AnimatedList:x()
	return self._faux and self._shape[1] or self._panel:x();
end
function AnimatedList:y()
	return self._faux and self._shape[2] or self._panel:y();
end
function AnimatedList:w()
	return self._shape[3];
end
function AnimatedList:h()
	return self._shape[4];
end


function AnimatedList:top()
	return self:y();
end

function AnimatedList:right()
	return self:x() + self:w();
end

function AnimatedList:bottom()
	return self:y() + self:h();
end

function AnimatedList:left()
	return self:x();
end

function AnimatedList:set_x(x)
	if self._faux then self._shape[1] = x; return; end
	self._panel:set_x(x);
end
function AnimatedList:set_y(y)
	if self._faux then self._shape[2] = y; return; end
	self._panel:set_y(y);
end
function AnimatedList:set_w(w)
	self._shape[3] = w;
	if not self._faux then self._panel:set_w(w); end
end
function AnimatedList:set_h(h)
	self._shape[4] = h;
	if not self._faux then self._panel:set_h(h); end
end

function AnimatedList:set_size(w, h)
	self:set_w(w); self:set_h(h);
end

function AnimatedList:set_position(x, y)
	self:set_x(x); self:set_y(y);
end

function AnimatedList:set_alpha(a)
	-- TODO: Implement max alpha of all children in faux panel.
	if not self._faux then self._panel:set_alpha(a); end
end

function AnimatedList:set_layer(l)
	-- TODO: Implement initial layer of all children in faux panel.
	if not self._faux then self._panel:set_layer(l); end
end

function AnimatedList:set_callback(clbk)
	self._clbk = clbk;
end


function AnimatedList:load_data(data)
	self:set_direction(data.direction);
	self:set_margin(data.margin);
	self:set_align(data.align);
	self:set_justify(data.justify);
	self:set_flip(data.flip);
	self:set_order(data.order);
	self:set_aspd(data.aspd);
	self:set_callback(data.clbk);
	
	if data.x then self:set_x(data.x); end
	if data.y then self:set_y(data.y); end
	if data.w then self:set_w(data.w); end
	if data.h then self:set_h(data.h); end
end

function AnimatedList:set_direction(dir)
	self._direction = dir == 1 and 1 or 2;
end

function AnimatedList:set_margin(mrg)
	self._margin = mrg or self._margin or 0;
end

function AnimatedList:set_align(align)
	self._align = align or self._align or 2;
end

function AnimatedList:set_justify(justify)
	self._justify = justify or self._justify or 1;
end

function AnimatedList:set_flip(flip)
	self._flip = flip or self._flip or 1;
end
function AnimatedList:set_order(order)
	self._order = order or self._order or 1;
end

function AnimatedList:set_aspd(aspd)
	self._aspd = aspd or self._aspd or 1;
end

function AnimatedList:set_visible_panel(o, visible)
	return self:set_state_panel(o, visible and 2 or 1);
end

function AnimatedList:set_visible_id(id, visible)
	return self:set_state_id(id, visible and 2 or 1);
end

function AnimatedList:set_alpha_panel(o, alpha)
	local children = self._children;
	for i=1, self.len do
		local child = children[i];
		if child.panel == o then
			child.max_alpha = alpha;
		end
	end
end

function AnimatedList:set_persistent_panel(o, persistent)
	return self:set_state_panel(o, persistent and 3 or 2, true);
end

function AnimatedList:set_state_id(id, state, force)
	local panel = self:child(id);
	if not panel then return; end
	return self:set_state_panel(panel, state, force);
end

function AnimatedList:set_state_panel(o, state, force)
	local panels = self._panels;
	for i=1, self.len do
		if panels[i] == o then
			return self:set_state_index(i, state, force);
		end
	end
end

function AnimatedList:set_state_index(i, state, force)
	local child = self._children[i];
	if child.state ~= state and (child.state < 3 or force) then
		child.state = state;
		self:dirty();
	end
end

function AnimatedList:get_data()
	local children = self._children;
	local c = self.len;
	local parent = self._panel;
	local shape = self._shape;
	local hrzt = self._direction == 1;
	local rev = self._order == 2;
	local flip = self._flip == 2;
	local debug = self._debug;
	local margin = self._margin;
	local row_data = { { 0, 0, 0 } };
	local ri = 1;
	local children_data = {};

	local w, h = parent.w, parent.h;
	local fdir = hrzt and w or h;
	local foff = hrzt and h or w;
	
	for i=1, c do
		local child = children[i];
		child.row_i = 0;
		
		if child.state >= 2 then
			local r_fdir, r_foff = fdir(child.panel), foff(child.panel);
			local r_cur = row_data[ri];
			if r_cur[1] + r_fdir > shape[hrzt and 3 or 4] * 1.05 then
				ri = ri +1;
				row_data[ri] = {r_fdir, r_cur[2] + r_cur[3] + margin, r_foff};
			else
				if r_cur[1] > 0 then r_cur[1] = r_cur[1] + margin; end
				r_cur[1] = r_cur[1] + r_fdir;
				if r_foff > r_cur[3] then r_cur[3] = r_foff; end
			end
			child.row_i = ri;
		end
	end

	for i=1, ri do
		local r_cur = row_data[i];
		local xy = shape[hrzt and 3 or 4] - r_cur[1];
		local align_jump = {0, xy/2, xy};
		r_cur[1] = shape[hrzt and 1 or 2] + align_jump[self._align];
		if flip then
			r_cur[2] = shape[hrzt and 2 or 1] + (shape[hrzt and 4 or 3] - r_cur[2] - r_cur[3]);
		else
			r_cur[2] = shape[hrzt and 2 or 1] + r_cur[2];
		end
	end
	
	for i = 1, c do
		local child = children[rev and c + 1 - i or i];
		local panel, r = child.panel, child.row_i;
		local row = row_data[r] or {0, 0, 0};
		
		local alpha = panel:alpha();
		local off = foff(panel);
		local visible = child.state >= 2;
		local p_visible = panel:visible();
		local justify_jump = {0, (row[3] - off)/2, row[3] - off};
		local pax = row[1];
		local sax = row[2] + justify_jump[self._justify];
		local pos1 = hrzt and { pax, sax } or { sax, pax };
		local pos2 = { panel:x(), panel:y() };
		
		children_data[i] = {
			panel = panel,
			new_pos = pos1,
			old_pos = p_visible and pos2 or pos1,
			state = child.state,
			p_visible = p_visible,
			alpha = alpha,
			max_alpha = child.max_alpha
		};
		
		panel:set_layer((visible and p_visible and alpha == 1) and 1 or 0);
		if visible then row[1] = row[1] + fdir(panel) + margin; end
	end
	return children_data;
end

function AnimatedList:dirty()
	if not self._enabled then return; end
	local panel = self._panel;
	panel:stop();
	panel:animate(callback(self, self, "animate_reposition", {self._aspd}));
end

function AnimatedList:animate_reposition(attr)
	attr = attr or {};
	local t, end_t, clbk = 0, attr[1] or 0, attr[2];

	-- Yield early to allow interrupt before calculating data.
	if t < end_t then t = t + coroutine.yield(); end
	local children = self:get_data();
	while t < end_t do
		for i=1, self.len do
			local child = children[i];
			local old_pos, new_pos, panel = child.old_pos, child.new_pos, child.panel;
			local visible, p_visible = child.state >= 2, child.p_visible;
			if p_visible or visible then
				panel:set_alpha(lerp(p_visible and child.alpha or 0, visible and child.max_alpha or 0, t / end_t));
				panel:set_visible(true);
			end
			if visible then panel:set_position(lerp(old_pos[1], new_pos[1], t / end_t), lerp(old_pos[2], new_pos[2], t / end_t)); end
		end
		t = t + coroutine.yield();
	end
	for i=self.len, 1, -1 do
		local child = children[i];
		local visible = child.state >= 2;
		local pos, panel = child.new_pos, child.panel;
		panel:set_position(pos[1], pos[2]);
		panel:set_alpha(visible and child.max_alpha or 0);
		panel:set_visible(visible);
		if child.state == 0 then self:_remove(i); end
	end
	if clbk then setup:add_end_frame_clbk(clbk); end
	if self._clbk then setup:add_end_frame_clbk(self._clbk); end
end

function AnimatedList:reposition(clbk)
	self._enabled = true;
	self._panel:stop();
	self:animate_reposition({0, clbk});
end

function AnimatedList:_remove(i)
	table.remove(self._children, i);
	local panel = table.remove(self._panels, i);
	self._panel:remove(panel);
	self:dec();
end

function AnimatedList:clear()
	local panel = self._panel;
	local panels = self._panels;
	panel:stop();
	for i=self.len, 1, -1 do
		panel:remove(panels[i]);
	end
	self.len = 0;
	self._children = {};
	self._panels = {};
	self._enabled = false;
end

function AnimatedList:destroy()
	if self._faux then return self:clear(); end
	self._parent:remove(self._panel);
end

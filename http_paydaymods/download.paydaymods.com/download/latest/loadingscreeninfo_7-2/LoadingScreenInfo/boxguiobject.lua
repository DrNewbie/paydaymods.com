
-- From lib/managers/menu/boxguiobject (current as at U140)

_G.LoadingScreenInfo_BoxGuiObject = _G.LoadingScreenInfo_BoxGuiObject or {}

-- Only perform the following global lookups exactly once
local Vector3 = _G.Vector3
local math = _G.math
local random = math.random
local min = math.min
local round = math.round
local set_static = _G.mvector3.set_static

local mvector_tl = Vector3()
local mvector_tr = Vector3()
local mvector_bl = Vector3()
local mvector_br = Vector3()

-- From BoxGuiObject:create_sides(). side_type is either 1 or 2 (corners only or entire side, respectively)
function LoadingScreenInfo_BoxGuiObject:create_sides(panel, side_type)
	self:_create_side(panel, "left", side_type)
	self:_create_side(panel, "right", side_type)
	self:_create_side(panel, "top", side_type)
	self:_create_side(panel, "bottom", side_type)
end

-- From BoxGuiObject:_create_side(). Changed slightly to work around the lack of Idstring support in the LoadingEnvironment
-- thread
function LoadingScreenInfo_BoxGuiObject:_create_side(panel, side, side_type)
	if panel == nil or not panel:alive() or type(side) ~= "string" then
		return nil
	end

	local ids_side = side
	local ids_left = "left"
	local ids_right = "right"
	local ids_top = "top"
	local ids_bottom = "bottom"
	local left_or_right = false
	local w, h
	if ids_side == ids_left or ids_side == ids_right then
		left_or_right = true
		w = 2
		h = panel:h()
	else
		w = panel:w()
		h = 2
	end
	local side_panel = panel:panel({
		name = side,
		w = w,
		h = h,
		halign = "grow",
		valign = "grow"
	})
	if side_type == 0 then
		return
	elseif side_type == 1 or side_type == 3 or side_type == 4 then
		local one = side_panel:bitmap({
			texture = "guis/textures/pd2/shared_lines",
			halign = "grow",
			valign = "grow",
			wrap_mode = "wrap"
		})
		local two = side_panel:bitmap({
			texture = "guis/textures/pd2/shared_lines",
			halign = "grow",
			valign = "grow",
			wrap_mode = "wrap"
		})
		local x = random(1, 255)
		local y = random(0, one:texture_height() / 2 - 1) * 2
		local tw = min(10, w)
		local th = min(10, h)
		if left_or_right then
			set_static(mvector_tl, x, y + tw, 0)
			set_static(mvector_tr, x, y, 0)
			set_static(mvector_bl, x + th, y + tw, 0)
			set_static(mvector_br, x + th, y, 0)
			one:set_texture_coordinates(mvector_tl, mvector_tr, mvector_bl, mvector_br)
			x = random(1, 255)
			y = random(0, round(one:texture_height() / 2 - 1)) * 2
			set_static(mvector_tl, x, y + tw, 0)
			set_static(mvector_tr, x, y, 0)
			set_static(mvector_bl, x + th, y + tw, 0)
			set_static(mvector_br, x + th, y, 0)
			two:set_texture_coordinates(mvector_tl, mvector_tr, mvector_bl, mvector_br)
			one:set_size(2, th)
			two:set_size(2, th)
			two:set_bottom(h)
		else
			set_static(mvector_tl, x, y, 0)
			set_static(mvector_tr, x + tw, y, 0)
			set_static(mvector_bl, x, y + th, 0)
			set_static(mvector_br, x + tw, y + th, 0)
			one:set_texture_coordinates(mvector_tl, mvector_tr, mvector_bl, mvector_br)
			x = random(1, 255)
			y = random(0, round(one:texture_height() / 2 - 1)) * 2
			set_static(mvector_tl, x, y, 0)
			set_static(mvector_tr, x + tw, y, 0)
			set_static(mvector_bl, x, y + th, 0)
			set_static(mvector_br, x + tw, y + th, 0)
			two:set_texture_coordinates(mvector_tl, mvector_tr, mvector_bl, mvector_br)
			one:set_size(tw, 2)
			two:set_size(tw, 2)
			two:set_right(w)
		end
		one:set_visible(side_type == 1 or side_type == 3)
		two:set_visible(side_type == 1 or side_type == 4)
	elseif side_type == 2 then
		local full = side_panel:bitmap({
			texture = "guis/textures/pd2/shared_lines",
			halign = "grow",
			valign = "grow",
			wrap_mode = "wrap",
			w = side_panel:w(),
			h = side_panel:h()
		})
		local x = random(1, 255)
		local y = random(0, round(full:texture_height() / 2 - 1)) * 2
		if left_or_right then
			set_static(mvector_tl, x, y + w, 0)
			set_static(mvector_tr, x, y, 0)
			set_static(mvector_bl, x + h, y + w, 0)
			set_static(mvector_br, x + h, y, 0)
			full:set_texture_coordinates(mvector_tl, mvector_tr, mvector_bl, mvector_br)
		else
			set_static(mvector_tl, x, y, 0)
			set_static(mvector_tr, x + w, y, 0)
			set_static(mvector_bl, x, y + h, 0)
			set_static(mvector_br, x + w, y + h, 0)
			full:set_texture_coordinates(mvector_tl, mvector_tr, mvector_bl, mvector_br)
		end
	else
		log("[LoadingScreenInfo] LoadingScreenInfo_BoxGuiObject:_create_side() | Warning: Type \"" .. tostring(side_type) .. "\" is not supported")
		return nil
	end
	side_panel:set_position(0, 0)
	if ids_side == ids_right then
		side_panel:set_right(panel:w())
	elseif ids_side == ids_bottom then
		side_panel:set_bottom(panel:h())
	end
	return side_panel
end

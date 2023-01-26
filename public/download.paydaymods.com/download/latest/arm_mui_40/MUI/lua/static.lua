--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.ArmStatic = _G.ArmStatic or {};
ArmStatic._path = ModPath;
local format, modf, min, max, abs, sin, floor, format, lerp = string.format, math.modf, math.min, math.max, math.abs, math.sin, math.floor, string.format, math.lerp;

function ArmStatic.log_details(obj, depth, indent)
	indent = indent or 0;
	depth = depth or 0;
	local result = "";
	for i=1, indent do
		result = result .. "-";
		if i == indent then result = result .. "> "; end
	end
	local visibility = "";
	if obj.visible and obj.alpha then
		local v = obj:visible();
		local a = obj:alpha();
		local f = modf(a);
		if v and f >= 0.1 and f <= 0.9 then
			visibility = format("[%.1f]", a);
		else
			visibility = format("[%s]", (v and a > 0) and "V" or "H");
		end
	end
	result = result .. format("%s%s: %d, %d, %d, %d.", obj:name(), visibility, obj:x(), obj:y(), obj:w(), obj:h());
	log(result);

	if obj.children and depth > 0 then
		local children = obj:children();
		for i=1, #children do
			local child = children[i];
			ArmStatic.log_details(child, depth -1, indent +1);
		end
	end
end

function ArmStatic.set_shape(object, x, y, w, h, f, c)
	if not object then return; end
	
	if x then object:set_x(x); end
	if y then object:set_y(y); end
	if w then object:set_w(w); end
	if h then object:set_h(h); end
	
	if object.set_font_size then
		object:set_font_size(f or h or object:h());
	end
	
	if c then object:set_color(c); end
end

function ArmStatic.set_shapes(objects, x, y, w, h, f, c)
	if not objects then return; end
	local set_sp = ArmStatic.set_shape;

	for i=1, #objects do
		set_sp(objects[i], x, y, w, h, f, c);
	end
end

function ArmStatic.align(object, o_x, o_y, p_x, p_y)
	local parent = object:parent();
	local jump_x = { 0 + o_x, (parent:w() - object:w())/2, parent:w()- object:w() - o_x };
	local jump_y = { 0 + o_y, (parent:h() - object:h())/2, parent:h()- object:h() - o_y };
	object:set_position(jump_x[p_x], jump_y[p_y]);
	return object:position();
end

--- Set shape and align object in parent container.
function ArmStatic.set_shape_align(object, o_x, o_y, w, h, p_x, p_y, f, c)
	ArmStatic.set_shape(object, nil, nil, w, h, f, c);
	ArmStatic.align(object, o_x, o_y, p_x, p_y);
end

--- Set shape of parent and children.
-- Children will fill containing parent.
function ArmStatic.set_shape_pnc(object, x, y, w, h, f, c)
	ArmStatic.set_shape(object, x, y, w, h, f, c);
	ArmStatic.set_shape_children(object, 0, 0, w, h, f, c);
end

--- Set shape of parent and descendants (recursive).
-- Descendants will fill containing parent.
function ArmStatic.set_shape_pnd(object, x, y, w, h, f, c)
	ArmStatic.set_shape(object, x, y, w, h, f, c);
	ArmStatic.set_shape_descendants(object, 0, 0, w, h, f, c);
end

function ArmStatic.set_shape_bitmap(bitmap, x, y, size, rect)
	if not bitmap then return; end
	
	local tw, th = rect[3] or bitmap:texture_width(), rect[4] or bitmap:texture_height();
	local tm = tw > th and tw or th;
	local bw = tm / th * size;
	
	ArmStatic.set_shape(bitmap, x and (x / (tm /th)), y, bw, size);
end

function ArmStatic.log_args(...)
	local out = "";
	for i,v in ipairs({...}) do
		if out ~= "" then out = out .. ", "; end
		out = out .. format("%d: %s", i, tostring(v));
	end
	log(out);
end

function ArmStatic.set_shape_text(object, x, y, f)
	if not object then return; end
	
	if x and y then object:set_position(x, y); end
	if f then object:set_font_size(f); end
	
	local _,_,w_rect,h_rect = object:text_rect();
	object:set_size(w_rect, h_rect);
end

ArmStatic.attach = {
	function(o, l, m) return l:x(), l:y() - o:h() - m end,
	function(o, l, m) return l:right() + m, l:y() end,
	function(o, l, m) return l:x(), l:bottom() + m end,
	function(o, l, m) return l:x() - o:w() - m, l:y() end
};

function ArmStatic.adapt_cont(object)
	local max_w = -1;
	local max_h = -1;
	local children = object:children();
	for i=1, #children do
		local ch = children[i];
		if ch:layer() ~= 51 then
			local ch_r, ch_b = ch:right(), ch:bottom();
			max_w = max_w > ch_r and max_w or ch_r;
			max_h = max_h > ch_b and max_h or ch_b;
		end
	end
	object:set_size(max_w,max_h);
end

function ArmStatic.flip_texture_h(bitmap)
	bitmap:set_texture_rect(bitmap:texture_width(), 0, -bitmap:texture_width(), bitmap:texture_height());
end

--- Scale bitmap texture rectangle.
-- E.g. make texture look smaller despite bitmap element occupying same space.
function ArmStatic.scale_texture_rect(bitmap, scale, x, y)
	local w, h = bitmap:texture_width(), bitmap:texture_height();
	local sw, sh = w * scale, h * scale;
	x = x or 0;
	y = y or 0;
	bitmap:set_texture_rect(x + (w - sw) / 2, y + (h - sh) / 2, sw, sh);
end

function ArmStatic.set_icon_data(bitmap, icon, rect)
	if rect then return bitmap:set_image(icon, unpack(rect)); end

	local twk_texture, twk_rect = tweak_data.hud_icons:get_icon_data(icon or "none_icon");
	bitmap:set_image(twk_texture, unpack(twk_rect));
end

function ArmStatic.set_padded_amount(text, amount, alt)
	alt = alt or 0;
	text:set_text(alt > 0 and format("%d|%d", min(amount, 9), min(alt, 9)) or format("%02d", amount));
	if alt > 0 then text:set_range_color(1,3, text:color():with_alpha(0.5))
	elseif amount <= 9 then text:set_range_color(0, 1, text:color():with_alpha(0.5)) end
end

function ArmStatic.set_shape_children(object, x, y, w, h, f, c)
	local children = object:children();
	for i=1, #children do
		local ch = children[i];
		ArmStatic.set_shape(ch, x, y, w, h, f, c);
	end
end

--- Set shape of descendants.
-- Recursively burrow through all sub-elements of the object.
function ArmStatic.set_shape_descendants(object, x, y, w, h, f, c)
	if not object or not object.children then return; end
	local children = object:children();
	for i=1, #children do
		local ch = children[i];
		ArmStatic.set_shape(ch, x, y, w, h, f, c);
		ArmStatic.set_shape_descendants(ch, x, y, w, h, f, c);
	end
end

function ArmStatic.set_alpha_children(object, alpha)
	if not object or not object.children then return; end
	for _, ch in ipairs(object:children()) do
		if ch.set_alpha then
			ch:set_alpha(alpha);
		end
	end
end

--- Set shape of deployable (grenades/cable ties/ammo bag).
-- Splits container in half, all bitmaps left, all text right.
function ArmStatic.set_shape_deployable(object, x, y, w, h, f, cor)
	ArmStatic.set_shape(object, x, y, w, h, f);
	for _, ch in ipairs(object:children()) do
		local chx = ch.text_rect and w/2 or 0;
		ArmStatic.set_shape(ch, chx, ch.font and cor or 0, w/2, h, f);
	end
end

function ArmStatic.remove_corners(panel)
	local fchild = panel:child("mui_c_1");
	if not fchild then return; end
	panel:remove(fchild);
	for i=2, 4 do
		panel:remove(panel:child("mui_c_" .. i));
	end
end

function ArmStatic.create_corners(panel, color)
	if panel:child("mui_c_1") then return; end
	color = color or Color.red;
	local texture = "guis/textures/pd2/hud_corner";
	for i=1, 4 do
		panel:bitmap({
			name = "mui_c_" .. i,
			h = 4,
			w = 4,
			layer = 51,
			rotation = 90 * (i - 1),
			color = color,
			texture = texture
		});
	end
	ArmStatic.align_corners(panel);
	return array;
end

function ArmStatic.align_corners(panel)
	local c2 = panel:child("mui_c_2");
	if not c2 then return; end

	local w, h = panel:w()-4, panel:h()-4;
	c2:set_position(w, 0);
	panel:child("mui_c_3"):set_position(w, h);
	panel:child("mui_c_4"):set_position(0, h);
end

function ArmStatic.tunnel_child(object, ...)
	local objChild = object;
	for _,v in ipairs({...}) do
		if objChild then
			objChild = objChild:child(v);
		end
	end
	return objChild;
end

function ArmStatic.tunnel(object, ...)
	local objChild = object;
	for _,v in ipairs({...}) do
		if objChild then
			if (type(objChild[v]) == "function") then
				objChild = objChild[v](objChild);
			else
				objChild = objChild[v];
			end
		end
	end
	return objChild;
end

function ArmStatic.table_set(tbl, val, keys)
	for i=1, #keys do
		tbl[keys[i]] = val;
	end
end


function ArmStatic.toggle_info(force_hide)
	local player_hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2);
	if not player_hud then return; end
	
	local player_panel = player_hud.panel;
	if not player_panel then return; end
	
	local assault_panel = player_panel:child("assault_panel");
	local hostages_panel = player_panel:child("hostages_panel");
	local objectives_panel = player_panel:child("objectives_panel");
	local heist_timer_panel = player_panel:child("heist_timer_panel");
	local casing_panel = player_panel:child("casing_panel");
	local buffs_panel = player_panel:child("buffs_panel");
	
	local f_alpha = function(obj, a) if obj then obj:set_alpha(a); end end
	if heist_timer_panel and heist_timer_panel:alpha() > 0 then
		f_alpha(assault_panel, 0);
		f_alpha(hostages_panel, 0);
		f_alpha(heist_timer_panel, 0);
		f_alpha(casing_panel, 0);
		f_alpha(buffs_panel, 0);
		if objectives_panel then objectives_panel:set_y(-500); end
	elseif not force_hide then
		f_alpha(assault_panel, 1);
		f_alpha(hostages_panel, 1);
		f_alpha(heist_timer_panel, 1);
		f_alpha(casing_panel, 1);
		f_alpha(buffs_panel, 1);
		if objectives_panel then objectives_panel:set_y(0); end
	end
end

function ArmStatic.retrying_clbk(id, clbk, t, c)
	local enemy = managers.enemy;
	local game = TimerManager.game and TimerManager:game();
	t = t or 2;
	c = c or 5;
	if not enemy or not game then return; end

	local function delayed_clbk()
		if not clbk() then
			if c > 0 then
				log(format("%s: Retrying in %d (Attempts left: %d).", id, t, c));
				enemy:add_delayed_clbk(id, delayed_clbk, game:time() + t);
				c = c - 1;
			else
				log(id .. ": Failed.")
			end
		end
	end
	enemy:add_delayed_clbk(id, delayed_clbk, game:time() + 0.2);
end

function ArmStatic.pdoclass(class, path)
	if _G[class] then return true; end
	local s, e = pcall( dofile, ModPath .. path );
	if not s then log( class .. ": " .. tostring(e) ); end
	return _G[class] ~= nil;
end

function ArmStatic.void(class, f_arr)
	local void_f = function () end;
	for _, str in  ipairs(f_arr) do
		class[str] = void_f;
	end
end

function ArmStatic.font_index(i)
	local jump_table = {
		tweak_data.menu.pd2_small_font,
		tweak_data.menu.pd2_medium_font,
		tweak_data.menu.medium_font,
		tweak_data.menu.pd2_large_font
	}
	return jump_table[i];
end
-- correction percentage of font size to center characters
-- for positioning text elements in line with block elements
function ArmStatic.correction_index(i)
	local jump_table = {
		0.01,
		0.05,
		-0.04,
		0.06
	};
	return jump_table[i];
end

function ArmStatic.equals(obj, ...)
	for _,v in ipairs({...}) do
		if obj == v then
			return true;
		end
	end
	return false;
end

function ArmStatic.vertical_string(str)
	local result = str:sub(1,1);
	for i = 2, str:len() do
		local chr = str:sub(i,i);
		result = result .. "\n" .. chr;
	end
	return result;
end

function ArmStatic.trim_plus(s)
	local b = s:match("^%s*()");
	local r = b > #s and "" or s:match(".*%S", b);
	return r:gsub("%s%s+"," ");
end

function ArmStatic.clean_name(name, plain)
	local new_name = "";
	local parse_index = -1;
	local jump_table = {
		["["] = "(%])",
		["("] = "(%))",
		["{"] = "(%})",
		["<"] = "(%>)",
		["#"] = "([^%w])"
	};
	for i = 1, name:len() do
		if parse_index < i or plain then
			local chr = name:sub(i,i);
			local is_alpha = chr:find("[%w%s]") ~= nil;
			local val = jump_table[chr];
			if val then
				parse_index = name:find(val, i+1) or -1;
			elseif not is_alpha then
				parse_index = name:find(chr, i+1, true) or -1;
			else
				new_name = new_name .. chr;
			end
		end
	end
	if new_name:len() < 1 and not plain then new_name = ArmStatic.clean_name(name, true); end
	return ArmStatic.trim_plus(new_name);
end

function ArmStatic.format_time(time)
	time = abs(time);
	local hours = floor(time / 3600);
	local minutes = floor((time - hours * 3600) / 60);
	local seconds = floor(time - hours * 3600 - minutes * 60);
	if hours > 0 then
		seconds = minutes;
		minutes = hours;
	end
	return format("%02d:%02d", minutes, seconds);
end

function ArmStatic.rgb(c)
	return c.red, c.green, c.blue;
end

function ArmStatic.invert(c)
	return Color(1-c.red,1-c.green,1-c.blue);
end

function ArmStatic.ToHSV(rgb)
	local r,g,b = rgb.R, rgb.G, rgb.B;
	local mn, mx = min(r,g,b), max(r,g,b);
	local d, h = 0, 0;
	
	if mn == mx then return {H = 0, S = 0, V = mn}; end
	
	if r == mn then d = g - b; h = 3;
	elseif g == mn then d = b - r; h = 5;
	else d = r - g; h = 1; end
	return {
		H = 60*(h - d/(mx - mn));
		S = (mx-mn)/mx,
		V = mx
	};
end

function ArmStatic.ToRGB(hsv)
	local h,s,v = hsv.H, hsv.S, hsv.V;
	local rgb = {};
	local c, i = v*s, h/60;
	local x = c * (1 - abs(i%2 -1));
	local m, r6 = v-c, floor(i%6);
	
	if r6 == 0 then
		rgb = {c,x,0};
	elseif r6 == 1 then
		rgb = {x,c,0};
	elseif r6 == 2 then
		rgb = {0,c,x};
	elseif r6 == 3 then
		rgb = {0,x,c};
	elseif r6 == 4 then
		rgb = {x,0,c};
	elseif r6 == 5 then
		rgb = {c,0,x};
	end
	
	return {
		R = rgb[1]+m,
		G = rgb[2]+m,
		B = rgb[3]+m
	};
end

function ArmStatic.complement(c)
	local hsv = ArmStatic.ToHSV({R = c.red, G = c.green, B = c.blue});
	local h = hsv.H;
	hsv.H = h > 180 and h - 180 or h + 180;
	local rgb = ArmStatic.ToRGB(hsv);
	return Color(rgb.R, rgb.G, rgb.B);
end

function ArmStatic.visibility(v, a, ...)
	for _,o in ipairs({...}) do
		if a then o:set_alpha(a); end
		o:set_visible(v);
	end
end

function ArmStatic.assign(target, ...)
	local sources = {...};
	for i=1, #sources do
		local source = sources[i];
		for k, v in pairs(source) do target[k] = v; end
	end
	return target;
end

function ArmStatic.animate_progress(o, end_t)
	local t = 0;
	while t < end_t do
		t = t + coroutine.yield();
		o:set_color(Color(1, t / end_t, 1, 1));
	end
end

function ArmStatic.rotate(o, attr)
	local t, r = 0, o:rotation();
	
	local end_r = attr[1] or 0;
	local end_t = (not o:visible() and 0) or attr[2] or 5;
	
	local lip = lerp;
	while t < end_t do
		t = t + coroutine.yield();
		o:set_rotation(lip(r, end_r, t / end_t));
	end
	o:set_rotation(end_r);
end
function ArmStatic.rotate_animate(o, r, t)
	return o:animate(callback(o, ArmStatic, "rotate", {r, t or 0.7}));
end
function ArmStatic.fade(o, attr)
	o:set_visible(true);
	local t, a = 0, o:alpha();
	
	local end_a = attr[1] or 0;
	local end_t = attr[2] or 5;
	
	local lip = lerp;
	while t < end_t do
		t = t + coroutine.yield();
		o:set_alpha(lip(a, end_a, t / end_t));
	end
	o:set_alpha(end_a);
	o:set_visible(end_a ~= 0);
end
function ArmStatic.fade_animate(o, a, t)
	return o:animate(callback(o, ArmStatic, "fade", {a, t or 0.7}));
end
function ArmStatic.flash(o, attr)
	o:set_visible(true);
	local t, a, s = 0, o:alpha(), 0;
	local end_a = attr[1] or 0.8;
	if a == end_a then return; end

	local end_t, aspd, plat = attr[2] or 4, attr[3] or 2, attr[4] or 0.5;
	local rest = 1 - plat;

	local lip = function(x,y) return lerp(x, y, s); end
	while t < end_t or end_t == -1 do
		t = t + coroutine.yield();
		s = plat + rest * abs(sin(t * aspd * 90));
		o:set_alpha(lip(a, end_a));
	end
	ArmStatic.fade(o, {a, rest});
end
function ArmStatic.flash_animate(o, a, t, aspd, plat)
	return o:animate(callback(o, ArmStatic, "flash", {a, t, aspd, plat}));
end
function ArmStatic.fade_c(o, attr)
	local t, c, l = 0, o:color(), 0;
	local end_c = attr[1] or Color.black;
	if c == end_c then return; end
	
	local r, g, b = ArmStatic.rgb(c);
	local end_r, end_g, end_b = ArmStatic.rgb(end_c);
	local end_t = (not o:visible() and 0) or attr[2] or 5;
	
	local lip = function(x,y) return lerp(x, y, l); end
	while t < end_t do
		t = t + coroutine.yield();
		l = t / end_t;
		o:set_color(Color(lip(r, end_r), lip(g, end_g), lip(b, end_b)));
	end
	o:set_color(Color(end_r, end_g, end_b));
end
function ArmStatic.fade_c_animate(o, c, t)
	return o:animate(callback(o, ArmStatic, "fade_c", {c, t or 0.7}));
end
function ArmStatic.flash_c(o, attr)
	local t, c, s = 0, o:color(), 0;
	local end_c = attr[1] or Color.black;
	if c == end_c then return; end
	
	local r, g, b = ArmStatic.rgb(c);
	local end_r, end_g, end_b = ArmStatic.rgb(end_c);
	local end_t, aspd, plat = attr[2] or 4, attr[3] or 2, attr[4] or 0.5;
	local rest = 1 - plat;
	
	local lip = function(x,y) return lerp(x, y, s); end
	while t < end_t or end_t == -1 do
		t = t + coroutine.yield();
		s = plat + rest * abs(sin(t * aspd * 90));
		o:set_color(Color(lip(r, end_r), lip(g, end_g), lip(b, end_b)));
	end
	ArmStatic.fade_c(o, {c, rest});
end
function ArmStatic.flash_c_animate(o, c, t, aspd, plat)
	return o:animate(callback(o, ArmStatic, "flash_c", {c, t, aspd, plat}));
end


-- From core/lib/utils/coretable (current as at U140)
local function deep_clone(o)
	if type(o) == "userdata" then
		return o
	end
	local res = {}
	setmetatable(res, getmetatable(o))
	for k, v in pairs(o) do
		if type(v) == "table" then
			res[k] = deep_clone(v)
		else
			res[k] = v
		end
	end
	return res
end

-- From lib/managers/menu/circleguiobject (current as at U140)
LoadingScreenInfo_CircleBitmapGuiObject = LoadingScreenInfo_CircleBitmapGuiObject or class()
function LoadingScreenInfo_CircleBitmapGuiObject:init(panel, config)
	if _G.circle_render_template == nil then
		log("[LoadingScreenInfo] LoadingScreenInfo_CircleBitmapGuiObject:init() | Error: _G.circle_render_template is nil, aborting")
		self.failed = true
		return
	end

	self._panel = panel
	self._radius = config.radius or 20
	self._sides = config.sides or 64
	self._total = config.total or 1
	self._size = 128
	config.texture_rect = nil
	config.texture = config.image or "guis/textures/pd2/hud_progress_active"
	config.w = self._radius * 2
	config.h = self._radius * 2
	self._circle = self._panel:bitmap(config)
	-- BEGIN MOD --
--	self._circle:set_render_template(Idstring("VertexColorTexturedRadial"))
	self._circle:set_render_template(_G.circle_render_template)
	-- END MOD --
	self._alpha = self._circle:color().alpha
	self._circle:set_color(self._circle:color():with_red(0))
	if config.use_bg then
		local bg_config = deep_clone(config)
		-- BEGIN MOD --
--		bg_config.texture = "guis/textures/pd2/hud_progress_bg"
		bg_config.texture = config.image or "guis/textures/pd2/hud_progress_bg"
		bg_config.color = bg_config.bg_color
		-- END MOD --
		bg_config.layer = bg_config.layer - 1
		bg_config.blend_mode = "normal"
		self._bg_circle = self._panel:bitmap(bg_config)
	end
end
function LoadingScreenInfo_CircleBitmapGuiObject:radius()
	return self._radius
end
function LoadingScreenInfo_CircleBitmapGuiObject:set_current(current)
	local j = math.mod(math.floor(current), 8)
	local i = math.floor(current / 8)
	self._circle:set_color(Color(self._alpha, current, self._circle:color().blue, self._circle:color().green))
end
function LoadingScreenInfo_CircleBitmapGuiObject:position()
	return self._circle:position()
end
function LoadingScreenInfo_CircleBitmapGuiObject:set_position(x, y)
	self._circle:set_position(x, y)
	if self._bg_circle then
		self._bg_circle:set_position(x, y)
	end
end
function LoadingScreenInfo_CircleBitmapGuiObject:set_visible(visible)
	self._circle:set_visible(visible)
	if self._bg_circle then
		self._bg_circle:set_visible(visible)
	end
end
function LoadingScreenInfo_CircleBitmapGuiObject:visible()
	return self._circle:visible()
end
function LoadingScreenInfo_CircleBitmapGuiObject:set_alpha(alpha)
	self._circle:set_alpha(alpha)
end
function LoadingScreenInfo_CircleBitmapGuiObject:alpha()
	self._circle:alpha()
end
function LoadingScreenInfo_CircleBitmapGuiObject:set_color(color)
	self._circle:set_color(color)
end
function LoadingScreenInfo_CircleBitmapGuiObject:color()
	return self._circle:color()
end
function LoadingScreenInfo_CircleBitmapGuiObject:size()
	return self._circle:size()
end
function LoadingScreenInfo_CircleBitmapGuiObject:set_image(texture)
	self._circle:set_image(texture)
end
function LoadingScreenInfo_CircleBitmapGuiObject:set_layer(layer)
	self._circle:set_layer(layer)
	if self._bg_circle then
		self._bg_circle:set_layer(layer - 1)
	end
end
function LoadingScreenInfo_CircleBitmapGuiObject:layer()
	return self._circle:layer()
end
function LoadingScreenInfo_CircleBitmapGuiObject:remove()
	self._panel:remove(self._circle)
	if self._bg_circle then
		self._panel:remove(self._bg_circle)
	end
	self._panel = nil
end

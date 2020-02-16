--[[
local massive_font = tweak_data.menu.pd2_massive_font
local large_font = tweak_data.menu.pd2_large_font
local medium_font = tweak_data.menu.pd2_medium_font
local small_font = tweak_data.menu.pd2_small_font
local tiny_font = tweak_data.menu.pd2_tiny_font
local massive_font_size = tweak_data.menu.pd2_massive_font_size
local large_font_size = tweak_data.menu.pd2_large_font_size
local medium_font_size = tweak_data.menu.pd2_medium_font_size
local small_font_size = tweak_data.menu.pd2_small_font_size
local tiny_font_size = tweak_data.menu.pd2_tiny_font_size
function HUDStatsScreen:init()
	HUDStatsScreen.super.init(self, managers.hud:script(managers.hud.STATS_SCREEN_FULLSCREEN).panel, {use_given = true})
	self:clear()

	local padding = 10
	self._leftpos = {
		padding,
		padding
	}
	self._rightpos = {
		self:w() - padding,
		padding
	}
	self._left = ExtendedPanel:new(self, {
		w = self:w() / 3 - padding * 2,
		h = self:h() - padding * 2
	})
	self._right = ExtendedPanel:new(self, {
		w = self._left:w(),
		h = self._left:h()
	})
	self._bottom = self:panel()

	self._left:set_righttop(self:left(), self._leftpos[2])
	self._right:set_lefttop(self:right(), self._rightpos[2])
	self:recreate_left()
	self:recreate_right()
	
end
function HUDStatsScreen:_animate_show_stats_left_panel(left_panel, right_panel, bottom_panel, teammates_panel, objectives_panel, chat_panel)
	local start_x = left_panel:x()
	local start_a = 1 - start_x / -left_panel:w()
	local TOTAL_T = 0.33 * start_x / -left_panel:w()
	local t = 0

	while t < TOTAL_T do
		local dt = coroutine.yield() * 1 / TimerManager:game():multiplier()
		t = t + dt
		local a = math.lerp(start_a, 1, t / TOTAL_T)

		left_panel:set_alpha(a)
		left_panel:set_x(math.lerp(start_x, self._leftpos[1], t / TOTAL_T))
		right_panel:set_alpha(a)
		right_panel:set_x(right_panel:parent():w() - (left_panel:x() + right_panel:w()))
		bottom_panel:set_alpha(a)
		bottom_panel:set_y(bottom_panel:parent():h() - (left_panel:x() + bottom_panel:h()))

		local a_half = 0.5 + (1 - a) * 0.5
		teammates_panel:set_alpha(math.max(0,a_half - 0.5))
		objectives_panel:set_alpha(1 - a)
		chat_panel:set_alpha(a_half)
	end

	left_panel:set_lefttop(unpack(self._leftpos))
	left_panel:set_alpha(1)
	teammates_panel:set_alpha(0) --0.5
	objectives_panel:set_alpha(0)
	chat_panel:set_alpha(0.5) --also 0?
	right_panel:set_alpha(1)
	right_panel:set_righttop(unpack(self._rightpos))
	bottom_panel:set_alpha(1)
	bottom_panel:set_y(bottom_panel:parent():h() - bottom_panel:h())
	self:_rec_round_object(left_panel)
	self:_rec_round_object(right_panel)
	self:_rec_round_object(bottom_panel)
end
--]]
--[[
Hooks:PostHook(HUDStatsScreen,"init","aui_init_hudstats",function(self)
	local tabstats = self._full_hud_panel:panel({
		name = "aui_tabstats_left",
		valign = "scale",
		x = 0,
		y = 0,
		w = 1920,
		h = 1080
--		w = self._full_hud_panel:w() / 3 
	})
	
	local bag_texture, bag_rect = tweak_data.hud_icons:get_icon_data("bag_icon")
	local tabstats_bg = tabstats:bitmap({
		visible = true,
		texture = bag_texture,--"guis/texture/test_blur_df",
		texture_rect = bag_rect,
		name = "tabstats_bg",
		layer = -1,
		alpha = 1,
--		render_template = "VertexColorTexturedBlur3D",
		valign = "scale",
		x = 0,
		y = 0
	})

end)
--]]
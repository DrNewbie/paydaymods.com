if pdth_hud.Options:GetValue("HUD/Assault") and not (Restoration and Restoration.options.restoration_assault_global) then
function HUDAssaultCorner:init(hud, full_hud, tweak_hud)
    local const = pdth_hud.constants

	self._hud_panel = hud.panel
	self._full_hud_panel = full_hud.panel
    self._assault_color = Color.red / 1.5
	self._vip_assault_color = Color(1, 1, 1, 0)
    --LightFX
    self._assault_color_fx = Color.red
    self._vip_assault_color_fx = Color(1, 1, 1, 0)
    self._fx_color =Color.red

    self._is_casing_mode = false

    local num_hostages = self._hud_panel:text({
		name = "num_hostages",
		text = managers.localization:text("pdth_hud_hostages") .. " 0",
		blend_mode = "normal",
		layer = 2,
		font_size = const.hostages_font_size,
		font = tweak_data.menu.small_font_noshadow
	})
    self:reposition_hostages()
    if tweak_hud.no_hostages then
		num_hostages:hide()
	end
	local assault_panel = self._hud_panel:panel({
		visible = false,
		name = "assault_panel",
		w = const.assault_w,
		h = const.assault_h,
		layer = 4
	})
	assault_panel:set_bottom(num_hostages:top())
	assault_panel:set_center_x(self._hud_panel:center_x())

	local icon_assaultbox = assault_panel:bitmap({
		name = "icon_assaultbox",
		blend_mode = "normal",
		visible = true,
		layer = 0,
		texture = "guis/textures/pdth_hud/hud_icons",
		texture_rect = { 276, 192, 108, 96 },
		w = assault_panel:w(),
		h = assault_panel:h()
	})

	local control_assault_title = assault_panel:text({
		name = "control_assault_title",
		text = managers.localization:text("menu_assault"),
		blend_mode = "normal",
		layer = 1,
		color = Color.red,
		font_size = const.assault_font_size,
		font = tweak_data.menu.small_font,
		visible = true
	})
    managers.hud:make_fine_text(control_assault_title)
    control_assault_title:set_center_x(icon_assaultbox:center_x())
    control_assault_title:set_top(icon_assaultbox:center_y() - const.assault_y_offset)

	if self._hud_panel:child("point_of_no_return_panel") then
		self._hud_panel:remove(self._hud_panel:child("point_of_no_return_panel"))
	end

	local point_of_no_return_panel = self._hud_panel:panel({
		visible = false,
		name = "point_of_no_return_panel",
	})

	self._noreturn_color = Color(1, 1, 0, 0)

	local point_of_no_return_text = point_of_no_return_panel:text({
		name = "point_of_no_return_text",
		text = "",
		blend_mode = "normal",
		layer = 1,
		color = self._noreturn_color,
		font_size = const.no_return_t_font_size,
		font = tweak_data.menu.small_font
	})
	point_of_no_return_text:set_text(managers.localization:text("time_escape"))
    managers.hud:make_fine_text(point_of_no_return_text)
    point_of_no_return_text:set_right(point_of_no_return_panel:w())
    point_of_no_return_text:set_top(0)

	local point_of_no_return_timer = point_of_no_return_panel:text({
		name = "point_of_no_return_timer",
		text = "",
		blend_mode = "normal",
		layer = 1,
		color = self._noreturn_color,
		font_size = const.no_return_timer_font_size,
		font = tweak_data.menu.small_font
	})
    managers.hud:make_fine_text(point_of_no_return_timer)
	point_of_no_return_timer:set_right(point_of_no_return_text:right())
	point_of_no_return_timer:set_top(point_of_no_return_text:bottom())

	if self._hud_panel:child("casing_panel") then
		self._hud_panel:remove(self._hud_panel:child("casing_panel"))
	end

	local casing_panel = self._hud_panel:panel({
		visible = false,
		name = "casing_panel",
        w = const.casing_size,
        h = const.casing_size
	})
    casing_panel:set_bottom(num_hostages:bottom())
	casing_panel:set_center_x(self._hud_panel:center_x())

	local icon_casingbox = casing_panel:bitmap({
		name = "icon_casingbox",
		blend_mode = "add",
		visible = true,
		texture = "guis/textures/pd2/icon_detection",
		w = casing_panel:w(),
		h = casing_panel:h()
	})



end

function HUDAssaultCorner:set_buff_enabled(buff_name, enabled)

end

function HUDAssaultCorner:_start_assault(text_list)
	local assault_panel = self._hud_panel:child("assault_panel")
	local control_assault_title = assault_panel:child("control_assault_title")
	local icon_assaultbox = assault_panel:child("icon_assaultbox")
	local num_hostages = self._hud_panel:child("num_hostages")
	local casing_panel = self._hud_panel:child("casing_panel")
	self._assault = true
	assault_panel:set_visible(true)
	num_hostages:set_alpha(0.5)
	casing_panel:set_visible(false)
    self._is_casing_mode = false

    local color = self._assault_color

    if self._assault_mode == "phalanx" then
		color = self._vip_assault_color
        self._fx_color = self._vip_assault_color_fx
	end

    icon_assaultbox:set_color(color)
    control_assault_title:set_color(color)

	assault_panel:animate(callback(self, self, "flash_assault_title"), true)
end

function HUDAssaultCorner:sync_set_assault_mode(mode)
	if self._assault_mode == mode then
		return
	end
	self._assault_mode = mode
	local color = self._assault_color
    self._fx_color = self._assault_color_fx
	if mode == "phalanx" then
		color = self._vip_assault_color
        self._fx_color = self._vip_assault_color_fx
	end
	self._current_assault_color = color

end

function HUDAssaultCorner:sync_set_assault_mode(mode)
	if self._assault_mode == mode then
		return
	end
	self._assault_mode = mode
	local color = self._assault_color
    self._fx_color = self._assault_color_fx
	if mode == "phalanx" then
		color = self._vip_assault_color
        self._fx_color = self._vip_assault_color_fx
	end
	self:_update_assault_hud_color(color)
end
function HUDAssaultCorner:_update_assault_hud_color(color)
    local assault_panel = self._hud_panel:child("assault_panel")
	local control_assault_title = assault_panel:child("control_assault_title")
	local icon_assaultbox = assault_panel:child("icon_assaultbox")
	icon_assaultbox:set_color(color)
	control_assault_title:set_color(color)
end

function HUDAssaultCorner:_end_assault()
	local assault_panel = self._hud_panel:child("assault_panel")
	local control_assault_title = assault_panel:child("control_assault_title")
	local icon_assaultbox = assault_panel:child("icon_assaultbox")
	local num_hostages = self._hud_panel:child("num_hostages")
	num_hostages:set_alpha(1)
	if not self._assault then
		return
	end
	self._assault = false

    if BetterLightFX then
        BetterLightFX:EndEvent("AssaultIndicator")
    end

	assault_panel:set_visible(false)
	assault_panel:stop()
end
function HUDAssaultCorner:set_control_info(data)
	local hostages_panel = self._hud_panel:child("hostages_panel")
	local num_hostages = self._hud_panel:child("num_hostages")
	num_hostages:set_text(managers.localization:text("pdth_hud_hostages") .. " " .. data.nr_hostages)
    self:reposition_hostages()
end

function HUDAssaultCorner:reposition_hostages()
    local num_hostages = self._hud_panel:child("num_hostages")
    managers.hud:make_fine_text(num_hostages)
    num_hostages:set_bottom(self._hud_panel:h())
    num_hostages:set_center_x(self._hud_panel:w() / 2)
end

function HUDAssaultCorner:_hide_hostages()

end

function HUDAssaultCorner:show_casing()
	self:_end_assault()
	local casing_panel = self._hud_panel:child("casing_panel")
    casing_panel:set_visible(true)
	casing_panel:stop()
	casing_panel:animate(callback(self, self, "flash_assault_title"))
	self._casing = true
end

function HUDAssaultCorner:hide_casing()
	local casing_panel = self._hud_panel:child("casing_panel")
    casing_panel:set_visible(false)
	casing_panel:stop()
	self._casing = false
end

function HUDAssaultCorner:_animate_show_casing(casing_panel, delay_time)

end

function HUDAssaultCorner:_animate_text(text_panel, bg_box, color, color_function)

end

function HUDAssaultCorner:_show_icon_assaultbox(icon_assaultbox)

end

function HUDAssaultCorner:_hide_icon_assaultbox(icon_assaultbox)

end

function HUDAssaultCorner:_set_hostage_offseted(is_offseted)
    self:_start_assault()
end

function HUDAssaultCorner:show_point_of_no_return_timer()
	local delay_time = self._assault and 1.2 or 0
	local point_of_no_return_panel = self._hud_panel:child("point_of_no_return_panel")
	point_of_no_return_panel:stop()
	point_of_no_return_panel:animate(callback(self, self, "_animate_show_noreturn"), delay_time)
	self._point_of_no_return = true
end

function HUDAssaultCorner:hide_point_of_no_return_timer()
	self._hud_panel:child("point_of_no_return_panel"):set_visible(false)
	self._point_of_no_return = false
	self:_set_feedback_color(nil)
end

function HUDAssaultCorner:_animate_show_noreturn(point_of_no_return_panel, delay_time)
	local point_of_no_return_panel = self._hud_panel:child("point_of_no_return_panel")
	local icon_noreturnbox = point_of_no_return_panel:child("icon_noreturnbox")
	local point_of_no_return_text = point_of_no_return_panel:child("point_of_no_return_text")
	local point_of_no_return_timer = point_of_no_return_panel:child("point_of_no_return_timer")

	point_of_no_return_panel:set_visible(false)
	wait(delay_time)
	point_of_no_return_panel:set_visible(true)

    self._PoNR_flashing = true
end

function HUDAssaultCorner:feed_point_of_no_return_timer(time, is_inside)
	local point_of_no_return_panel = self._hud_panel:child("point_of_no_return_panel")
    local point_of_no_return_timer = point_of_no_return_panel:child("point_of_no_return_timer")
    local point_of_no_return_text = point_of_no_return_panel:child("point_of_no_return_text")

	time = math.floor(time)
	local minutes = math.floor(time / 60)
	local seconds = math.round(time - minutes * 60)
	local text = (minutes < 10 and "0" .. minutes or minutes) .. ":" .. (seconds < 10 and "0" .. seconds or seconds)

	point_of_no_return_timer:set_text(text)
    managers.hud:make_fine_text(point_of_no_return_timer)
	point_of_no_return_timer:set_right(point_of_no_return_text:right())
	point_of_no_return_timer:set_top(point_of_no_return_text:bottom())
end

function HUDAssaultCorner:flash_point_of_no_return_timer(beep)
    self._PoNR_flashing = true
    local const = pdth_hud.constants
	local point_of_no_return_panel = self._hud_panel:child("point_of_no_return_panel")
	local function flash_timer(o)
		local t = 0
		while t < 0.5 do
			t = t + coroutine.yield()
			local n = 1 - math.sin(t * 180)
			local r = math.lerp(1 or self._point_of_no_return_color.r, 1, n)
			local g = math.lerp(0 or self._point_of_no_return_color.g, 0.8, n)
			local b = math.lerp(0 or self._point_of_no_return_color.b, 0.2, n)
			o:set_color(Color(r, g, b))

            if BetterLightFX then
                BetterLightFX:StartEvent("PointOfNoReturn")
                BetterLightFX:SetColor(r, g, b, 1, "PointOfNoReturn")
            end

			o:set_font_size(math.lerp(const.no_return_timer_font_size , const.no_return_timer_font_size_pulse, n))
		end
        if BetterLightFX then
            BetterLightFX:EndEvent("PointOfNoReturn")
        end
	end

	local point_of_no_return_timer = point_of_no_return_panel:child("point_of_no_return_timer")
	point_of_no_return_timer:animate(flash_timer)
end


function HUDAssaultCorner:flash_assault_title(o, assault)
	while true do
        local alpha_d = 0.5 + (math.sin( Application:time()*750 )+1)/4
		o:set_alpha(alpha_d)

        if BetterLightFX and self._assault and assault then
            BetterLightFX:StartEvent("AssaultIndicator")
            BetterLightFX:UpdateEvent("AssaultIndicator", {color = Color(alpha_d, self._fx_color.red, self._fx_color.green, self._fx_color.blue)})
        end

		coroutine.yield()
	end
end

end

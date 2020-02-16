PortraitPreviewGUI = PortraitPreviewGUI or class(TextBoxGui)

PortraitPreviewGUI.portrait_ratio = 65/32
PortraitPreviewGUI.portrait_w = 64
PortraitPreviewGUI.portrait_x_gap = 20
PortraitPreviewGUI.portrait_y_gap = 20
PortraitPreviewGUI.portrait_highlight_w = 10
PortraitPreviewGUI.focused_portrait_w = 64 * 2
PortraitPreviewGUI.character_text_font_size = 15
PortraitPreviewGUI.focus_time = 0.4
PortraitPreviewGUI.main_y_offset = 58
PortraitPreviewGUI.scroll_speed = 4

function PortraitPreviewGUI:init(ws)
    self._ws = ws
    self:_create_gui()
end

function PortraitPreviewGUI:make_fine_text(text)
	local x, y, w, h = text:text_rect()
	text:set_size(w, h)
	text:set_position(math.round(text:x()), math.round(text:y()))
end

function PortraitPreviewGUI:_create_gui()
    local size = managers.gui_data:scaled_size()
    local portrait_h = self.portrait_w * self.portrait_ratio
    local columns = math.floor(((size.width) + self.portrait_x_gap) / (self.portrait_w + self.portrait_x_gap))
    local rows = math.ceil(#tweak_data.criminals.characters / columns)
    local remaining_chars = #tweak_data.criminals.characters % columns
    local main_width = (columns * self.portrait_w) + ((columns - 1) * self.portrait_x_gap)
    self._main_panel = self._ws:panel():panel({layer = 200})

	self._panel = self._main_panel:panel({
		name = "main",
		h = (rows * portrait_h) + ((rows - 1) * self.portrait_y_gap),
        layer = 1
	})
    self._panel:set_bottom(self._main_panel:h() - self.portrait_highlight_w - self.main_y_offset)
    --self._panel:set_center_y(self._ws:panel():center_y())
    self._portrait_highlight = self._main_panel:gradient({
        name = "portrait_highlight",
        visible = false,
        w = self.portrait_w + (self.portrait_highlight_w * 2),
        h = portrait_h,
        layer = 0,
        gradient_points = {
            0,
            Color(0, 0, 0, 0),
            0.5,
            Color.yellow,
            1,
            Color(0, 0, 0, 0)
        }
    })
    self._blur = self._main_panel:bitmap({
        layer = 5,
        visible = false,
		texture = "guis/textures/test_blur_df",
		render_template = "VertexColorTexturedBlur3D",
		valign = "grow",
		halign = "grow"
    })
    self._blur:set_shape(self._main_panel:shape())
    local final_width = remaining_chars == 0 and self._panel:w() or ((remaining_chars * self.portrait_w) + ((remaining_chars - 1) * self.portrait_x_gap))
    self._portraits = {}
    local cur_char = 1
    for j = 0, rows - 1 do
        local row_panel = self._panel:panel({
            name = "row"..j,
            layer = 0,
            y = (((rows-1) - j) * portrait_h) + (((rows-1) - j) * self.portrait_y_gap),
            w = j == (rows - 1) and final_width or main_width,
            h = portrait_h
        })
        row_panel:set_center_x(self._panel:center_x())

        for i = 0, columns - 1 do
            if cur_char > #tweak_data.criminals.characters then
                break
            end
            local char_tbl = tweak_data.criminals.characters[cur_char]
            local portrait_panel = row_panel:panel({
                name = char_tbl.name,
                layer = 0,
                x = (i * self.portrait_w) + (i * self.portrait_x_gap),
                w = self.portrait_w,
                h = portrait_h
            })

            self:create_portrait(portrait_panel, char_tbl)

            self._portraits[cur_char] = portrait_panel
            cur_char = cur_char + 1
        end
    end

    self:refresh()
end

function PortraitPreviewGUI:create_portrait(o, char_tbl)
    o:bitmap({
        name = "bg",
        texture = "",
        blend_mode = "normal",
        layer = 0
   })

    o:bitmap({
        name = "health",
        texture = "",
        color = pdth_hud.constants.health_main_colour,
        blend_mode = "normal",
        layer = 1
    })

    o:bitmap({
        name = "shield",
        texture = "",
        blend_mode = "normal",
        layer = 2
    })

    local character_text = o:text({
        name = "character_text",
        text = "",
        color = Color.white,
        blend_mode = "normal",
        align = "center",
        font_size = self.character_text_font_size * (o:w() / self.portrait_w),
        font = tweak_data.menu.small_font,
        layer = 3
    })

    character_text:set_text(string.upper(managers.localization:text("menu_" .. char_tbl.name)))
    self:refresh_portrait_size(o)

    self:display_portrait(o, char_tbl)
end

function PortraitPreviewGUI:refresh_portrait_size(o)
    local bg = o:child("bg")
    local health = o:child("health")
    local shield = o:child("shield")
    local text = o:child("character_text")

    bg:set_size(o:size())
    health:set_size(o:size())
    shield:set_size(o:size())
    text:set_font_size(self.character_text_font_size * (o:w() / self.portrait_w))
    text:set_w(o:w())
    local _,_,_,h = text:text_rect()
    text:set_h(h)
    text:set_bottom(o:h() - pdth_hud.constants.main_character_y_offset)
end

function PortraitPreviewGUI:display_portrait(o, char_tbl, use_slider_offsets)
    local bg = o:child("bg")
    local health = o:child("health")
    local shield = o:child("shield")

    local texture, rect = pdth_hud.textures:get_portrait_texture(char_tbl.name, "health", true)
    local y_offset, h_offset = 0, 0

    if use_slider_offsets and self._health_slider and self._focused_portrait_panel then
        local value = (self._health_slider:world_center_y() - self._focused_portrait_panel:world_top()) / self._focused_portrait_panel:h()
        health:set_color(pdth_hud.utils:GetPortraitColour(1 - value))

        y_offset = rect[4] * value
        h_offset = bg:h() * value
    else
        health:set_color(pdth_hud.utils:GetPortraitColour())
    end

    health:set_image(texture, rect[1], rect[2] + y_offset, rect[3], rect[4] - y_offset)
    health:set_h(bg:h() - h_offset)
    health:set_bottom(bg:bottom())

    texture, rect = pdth_hud.textures:get_portrait_texture(char_tbl.name, "armor", true)

    if use_slider_offsets and self._armour_slider and self._focused_portrait_panel then
        local value = (self._armour_slider:world_center_y() - self._focused_portrait_panel:world_top()) / self._focused_portrait_panel:h()
        y_offset = rect[4] * value
        h_offset = bg:h() * value
    end
    shield:set_image(texture, rect[1], rect[2] + y_offset, rect[3], rect[4] - y_offset)
    shield:set_h(bg:h() - h_offset)

    --Fixes magic white lines on White's? set
    --shield:set_image(texture, rect[1] + 1, rect[2] + 1, rect[3] - 1, rect[4] - 1)
    shield:set_bottom(bg:bottom())

    texture, rect = pdth_hud.textures:get_portrait_texture(char_tbl.name, "bg", true)
    bg:set_image(texture, unpack(rect))
end

function PortraitPreviewGUI:refresh()
    for i, portrait_panel in pairs(self._portraits) do
        self:display_portrait(portrait_panel, tweak_data.criminals.characters[i])
    end
    if self._focused_portrait_panel then
        self:display_portrait(self._focused_portrait_panel, tweak_data.criminals.characters[self._focused_portrait_i], true)
    end
end

function PortraitPreviewGUI:update(t, dt)
    self._dt = dt
end

PortraitPreviewGUI.portrait_options_gap = 8
PortraitPreviewGUI.portrait_scroll_gap = 4
PortraitPreviewGUI.portrait_options_font_size = 24

function PortraitPreviewGUI:create_portrait_options()
    if not self._portrait_options_panel then
        local h = self.focused_portrait_w * self.portrait_ratio

        local slider_size = 24
        self._health_slider = self._main_panel:bitmap({
            texture = "guis/textures/pd2/hud_arrow",
            w = slider_size,
            h = slider_size,
            color = Color.green,
            rotation = 180,
            layer = 6
        })
        local slider_offset = 4
        self._health_slider:set_right(self._focused_portrait_panel:left() + slider_offset)

        self._armour_slider = self._main_panel:bitmap({
            texture = "guis/textures/pd2/hud_arrow",
            w = slider_size,
            h = slider_size,
            color = Color.blue,
            layer = 6
        })
        self._armour_slider:set_left(self._focused_portrait_panel:right() - slider_offset)

        self._portrait_options_panel = self._main_panel:panel({
            layer = 6,
            h = h,
            w = h,
            x = self._focused_portrait_panel:right()
        })
        self._portrait_options_panel:set_center_y(self._main_panel:h() / 2)

        self._portrait_panel = self._portrait_options_panel:panel()

        local back_text = managers.localization:text("menu_back")
        self._portrait_back = self._portrait_options_panel:text({
            text = string.sub(back_text, 0, string.len(back_text) - 6),
            font_size = 24,
            font = tweak_data.menu.pd2_small_font,
            color = Color.white:with_alpha(0.75),
            align = "right"
        })
        local _, _, _, h = self._portrait_back:text_rect()
        self._portrait_back:set_h(h)
        --self:make_fine_text(self._portrait_back)
        self._portrait_back:set_world_rightbottom(self._portrait_options_panel:world_rightbottom())

        self._portrait_panel:set_h(self._portrait_options_panel:h() - h)

        self._portrait_scroll = self._portrait_panel:rect({
            name = "scroll",
            color = Color.white,
            visible = false,
            w=5
        })
        self._portrait_scroll:set_right(self._portrait_panel:w())

        self._portrait_back:set_right(self._portrait_panel:w() - (self._portrait_scroll:w() + self.portrait_scroll_gap))
    end
    if self._portrait_panel:child("panel_options") then
        self._portrait_panel:remove(self._portrait_panel:child("panel_options"))
    end

    local panel_options = self._portrait_panel:panel({
        name="panel_options",
        y = 0
    })
    self._portrait_options = {}

    local portrait_opt = pdth_hud.Options:GetOption("HUD/portraits/" .. tweak_data.criminals.characters[self._focused_portrait_i].name)

    for i, value in pairs(portrait_opt.values) do
        local panel = panel_options:panel()
        self._portrait_options[i] = panel

        local portrait_text = panel:text({
            name = "text",
            text = managers.localization:text(value),
            font_size = self.portrait_options_font_size,
            font = tweak_data.menu.pd2_small_font,
            color = (i == portrait_opt.value and Color.yellow or Color.white):with_alpha(0.75),
            align = "right"
        })
        local _, _, _, h = portrait_text:text_rect()
        portrait_text:set_h(h)
        panel:set_h(h)
        panel:set_y((i - 1) * h + ((i - 1) * self.portrait_options_gap))
        panel:set_right(panel_options:w() - (self._portrait_scroll:w() + self.portrait_scroll_gap))
    end

    panel_options:set_h(self._portrait_options[#self._portrait_options]:bottom())

    self._portrait_scroll:set_visible(panel_options:h() > self._portrait_panel:h())
    self._portrait_scroll:set_h((self._portrait_panel:h() / panel_options:h()) * self._portrait_panel:h())
    self._portrait_scroll:set_y(0)
    self._health_slider:set_world_center_y(self._focused_portrait_panel:world_y())
    self._armour_slider:set_world_center_y(self._focused_portrait_panel:world_y())
end

function PortraitPreviewGUI:show_portrait_options()
    self:create_portrait_options()
    self._portrait_options_panel:show()
    self._health_slider:show()
    self._armour_slider:show()
end

function PortraitPreviewGUI:hide_portrait_options()
    self._portrait_options_panel:hide()
    self._health_slider:hide()
    self._armour_slider:hide()
    --[[if self._portrait_options_panel then
        self._main_panel:remove(self._portrait_options_panel)
        self._portrait_options_panel = nil
        self._portrait_back = nil
        self._portrait_options = nil
        self._main_panel:remove(self._health_slider)
        self._main_panel:remove(self._armour_slider)
        self._health_slider = nil
        self._armour_slider = nil
    end]]--
end

function PortraitPreviewGUI:portrait_move(o, to_start)
    local final_w = to_start and self._focused_portrait_og:w() or self.focused_portrait_w
    local final_h = to_start and self._focused_portrait_og:h() or self.focused_portrait_w * self.portrait_ratio
    local final_x = to_start and self._focused_portrait_og:world_center_x() or self.focused_portrait_w * 1.5
    local final_y = to_start and self._focused_portrait_og:world_center_y() or self._main_panel:h() / 2

    local start_x, start_y = o:world_center()
    local start_w, start_h = o:size()
    local x_diff = final_x - start_x
    local y_diff = final_y - start_y
    local start = Vector3(start_x, start_y, 0)
    local end_pos = Vector3(final_x, final_y, 0)
    local speed = mvector3.distance(start, end_pos) / self.focus_time
    local t = 0
    while t < self.focus_time do
        local dt = coroutine.yield()
        --To fix an issue where yield returns 0 every call when in-game
        dt = dt == 0 and self._dt or dt
        t = math.min(t + dt, self.focus_time)
        local t_ratio = t / self.focus_time
        local vec = Vector3()
        mvector3.step(vec, start, end_pos, speed*t)
        o:set_world_center(vec.x, vec.y)
        o:set_size(math.lerp(start_w, final_w, t_ratio), math.lerp(start_h, final_h, t_ratio))
        self._blur:set_alpha(to_start and 1 - t_ratio or t_ratio)
        self:refresh_portrait_size(o)
    end
end

function PortraitPreviewGUI:unfocus_portrait()
    self:hide_portrait_options()
    self:display_portrait(self._focused_portrait_panel, tweak_data.criminals.characters[self._focused_portrait_i], false)
    self._focused_portrait_panel:animate(function(o)
        self:portrait_move(o, true)
        self._main_panel:remove(self._focused_portrait_panel)
        self._blur:hide()
        self._focused_portrait_og:show()

        self._focused_portrait_panel = nil
        self._focused_portrait_i = nil
    end)
end
function PortraitPreviewGUI:focus_portrait(i, portrait_panel)
    --self._panel:set_visible(false)
    self._portrait_highlight:hide()

    portrait_panel:hide()
    self._blur:show()
    self._focused_portrait_og = portrait_panel
    self._focused_portrait_i = i
    self._focused_portrait_panel = self._main_panel:panel({layer = 5})
    self._focused_portrait_panel:set_world_shape(portrait_panel:world_shape())
    self:create_portrait(self._focused_portrait_panel, tweak_data.criminals.characters[i])
    self._focused_portrait_panel:animate(function(o)
        self:portrait_move(o, false)
        self:show_portrait_options()
    end)
end

function PortraitPreviewGUI:update_scroll(y)
    local h = self._portrait_scroll:h()
    local panel_options = self._portrait_panel:child("panel_options")
    self._portrait_scroll:set_world_center_y(math.clamp(self._portrait_scroll:world_center_y() + y, self._portrait_panel:world_top() + (h/2), self._portrait_panel:world_bottom() - (h/2)))
    local scroll_dif = self._portrait_panel:h() - h
    panel_options:set_y(-((self._portrait_scroll:y() / scroll_dif) * (panel_options:h() - self._portrait_panel:h())))
end

function PortraitPreviewGUI:mouse_moved(x, y)
    local inside = false
    if not self._focused_portrait_panel then
    	for _, portrait_panel in pairs(self._portraits) do
            if portrait_panel:inside(x, y) then
                inside = true
                self._portrait_highlight:set_world_center(portrait_panel:world_center())
                break
            end
        end
        self._portrait_highlight:set_visible(inside)
    end
    if not inside and self._portrait_options_panel and self._portrait_options_panel:visible() then
        if not inside then
            if self._dragging then
                if self._dragging:name() == "scroll" then
                    self:update_scroll(y-self._dragging_point[2])
                    self._dragging_point = {x,y}
                else
                    self._dragging:set_world_center_y(math.clamp(y, self._focused_portrait_panel:world_top(), self._focused_portrait_panel:world_bottom()))
                    self:display_portrait(self._focused_portrait_panel, tweak_data.criminals.characters[self._focused_portrait_i], true)
                end
                return true, "grab"
            else
                for _, slider in pairs({self._health_slider, self._armour_slider, self._portrait_scroll}) do
                    if slider:visible() and slider:inside(x, y) then
                        return true, "hand"
                    end
                end
            end
        end

        if self._portrait_back:inside(x, y) then
            inside = true
            self._portrait_back:set_color(Color.white:with_alpha(1))
        else
            self._portrait_back:set_color(Color.white:with_alpha(0.75))
        end

        if not inside and self._portrait_options then
            local portrait_opt = pdth_hud.Options:GetOption("HUD/portraits/" .. tweak_data.criminals.characters[self._focused_portrait_i].name)

            for i, opt in pairs(self._portrait_options) do
                local opt_text = opt:child("text")
                local inside_opt = opt:inside(x, y)
                if inside_opt then
                    inside = true
                end
                opt_text:set_color(opt_text:color():with_alpha(inside_opt and 1 or 0.75))
            end
        end
    end

	return inside, inside and "link" or "arrow"
end

function PortraitPreviewGUI:mouse_pressed(button, x, y)
    if (button == Idstring("mouse wheel down") and self:scroll_down(x,y)) or (button == Idstring("mouse wheel up") and self:scroll_up(x,y)) then
        return true
    end

    if self._portrait_options_panel and self._portrait_options_panel:visible() and button == Idstring("0") then
        if not self._dragging then
            for _, slider in pairs({self._health_slider, self._armour_slider, self._portrait_scroll}) do
                if slider:visible() and slider:inside(x, y) and button == Idstring("0") then
                    self._dragging = slider
                    self._dragging_point = {x, y}
                    return true
                end
            end
        end

        if self._portrait_back:inside(x, y) then
            self:unfocus_portrait()
            return true
        end

        if self._portrait_options then
            local opt_path = "HUD/portraits/" .. tweak_data.criminals.characters[self._focused_portrait_i].name
            local portrait_opt = pdth_hud.Options:GetOption(opt_path)

            for i, opt in pairs(self._portrait_options) do
                local opt_text = opt:child("text")
                if opt:inside(x, y) then
                    self._portrait_options[portrait_opt.value]:child("text"):set_color(Color.white:with_alpha(0.75))
                    opt_text:set_color(Color.yellow:with_alpha(1))
                    pdth_hud.Options:SetValue(opt_path, i)
                    self:display_portrait(self._focused_portrait_panel, tweak_data.criminals.characters[self._focused_portrait_i], true)
                    self:display_portrait(self._focused_portrait_og, tweak_data.criminals.characters[self._focused_portrait_i])
                    return true
                end
            end
        end
    end

    if not self._focused_portrait_panel and button == Idstring("0") then
    	for i, portrait_panel in pairs(self._portraits) do
            if portrait_panel:inside(x, y) then
                inside = true
                self:focus_portrait(i, portrait_panel)
                return true
            end
        end
    end

    return false
end

function PortraitPreviewGUI:mouse_released(button, x, y)
    if button == Idstring("0") then
        self._dragging = nil
    end

    return false
end

function PortraitPreviewGUI:scroll_up(x,y)
    if self._portrait_options_panel and self._portrait_panel:inside(x,y) and self._portrait_scroll:visible() then
        self:update_scroll(-self.scroll_speed)
        return true
    end
    return false
end

function PortraitPreviewGUI:scroll_down(x,y)
    if self._portrait_options_panel and self._portrait_panel:inside(x,y) and self._portrait_scroll:visible() then
        self:update_scroll(self.scroll_speed)
        return true
    end

    return false
end

function PortraitPreviewGUI:close()
	if alive(self._main_panel) then
		self._ws:panel():remove(self._main_panel)
	end
end

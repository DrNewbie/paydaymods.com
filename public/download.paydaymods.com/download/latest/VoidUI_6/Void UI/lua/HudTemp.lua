if VoidUI.options.teammate_panels then 
	local init = HUDTemp.init
	function HUDTemp:init(hud)
		self._hud_panel = hud.panel
		if self._hud_panel:child("custom_temp_panel") then
			self._hud_panel:remove(self._hud_panel:child("custom_temp_panel"))
		end
		self._scale = VoidUI.options.hud_main_scale
		self._custom_temp_panel = self._hud_panel:panel({
			visible = true,
			name = "custom_temp_panel",
			y = 0,
			valign = "scale",
			layer = 0
		})
		local bag_panel = self._custom_temp_panel:panel({
			visible = false,
			name = "bag_panel",
			halign = "right",
			valign = "bottom",
			layer = 10,
			w = 200,
			h = 56
		})
		
		local bag_icon = bag_panel:bitmap({
			name = "bag_icon",
			texture = "guis/textures/pd2/hud_tabs",
			w = 25,
			h = 25,
			texture_rect = {32, 33, 32, 31},
			visible = true,
			layer = 2,
			rotation = 360,
			color = Color.white,
		})
		local bag_text_panel = bag_panel:panel({
			name = "bag_text_panel",
			halign = "center",
			valign = "center",
			layer = 1,
		})
		
		local bag_text = bag_text_panel:text({
			name = "bag_text",
			text = "Jewlery",
			vertical = "center",
			align = "right",
			layer = 1,
			font = "fonts/font_medium_mf",
			font_size = 25
		})
		local bag_text_bg = bag_text_panel:text({
			name = "bag_text_bg",
			text = "Jewlery",
			vertical = "center",
			align = "right",
			layer = 0,
			x = 1,
			y = 1,
			color = Color.black,
			font = "fonts/font_medium_mf",
			font_size = 25
		})
		self._bag_panel_w = bag_panel:w()
		self._bag_panel_h = bag_panel:h()
		bag_panel:set_right(self._custom_temp_panel:w())
		bag_panel:set_bottom(self:_bag_panel_bottom())
		
		init(self, hud)
	end
	function HUDTemp:_bag_panel_bottom()
		return self._custom_temp_panel:h() - managers.hud._teammate_panels[HUDManager.PLAYER_PANEL]._bg_h - (25 * math.clamp(self._scale, 0.65 , 1))
	end
	function HUDTemp:show_carry_bag(carry_id, value)
		local bag_panel = self._custom_temp_panel:child("bag_panel")
		local carry_data = tweak_data.carry[carry_id]
		local type_text = carry_data.name_id and managers.localization:text(carry_data.name_id)
		local bag_text_panel = bag_panel:child("bag_text_panel")
		local bag_text = bag_text_panel:child("bag_text")
		local bag_text_bg = bag_text_panel:child("bag_text_bg")
		local bag_icon = bag_panel:child("bag_icon")
		bag_text:set_font_size(25)
		bag_text_bg:set_font_size(25)
		bag_text:set_text(type_text)
		bag_text_bg:set_text(type_text)
		local x,_,w,h = bag_text:text_rect()
		bag_text_panel:set_size(w, h * 2)
		bag_text:set_size(w, h * 2)
		bag_text_bg:set_size(w, h * 2)
		bag_text_panel:set_x(bag_panel:w() / 2 - w / 2)
		bag_icon:set_center(bag_text_panel:center())
		
		bag_panel:set_visible(true)
		bag_panel:stop()
		bag_panel:animate(callback(self, self, "_animate_show_bag_panel"))
	end
	function HUDTemp:hide_carry_bag()
		local bag_panel = self._custom_temp_panel:child("bag_panel")
		bag_panel:stop()
		bag_panel:animate(callback(self, self, "_animate_hide_bag_panel"))
	end
	function HUDTemp:_animate_hide_bag_panel(bag_panel)
		local bag_text_panel = bag_panel:child("bag_text_panel")
		local bag_text = bag_text_panel:child("bag_text")
		local bag_text_bg = bag_text_panel:child("bag_text_bg")
		local bag_icon = bag_panel:child("bag_icon")
		bag_text_panel:stop()
		bag_text_panel:animate(callback(self, self, "_animate_hide_text"), bag_text, bag_text_bg, bag_icon)
		wait(1)
		bag_panel:set_visible(false)
	end
	function HUDTemp:_animate_show_bag_panel(bag_panel)
		local w, h = self._bag_panel_w, self._bag_panel_h
		local scx = self._custom_temp_panel:w() / 2
		local ecx = self._custom_temp_panel:w() - w / 2
		local scy = self._custom_temp_panel:h() / 1.8
		local ecy = self:_bag_panel_bottom() - (bag_panel:h() / 2)
		local bottom = bag_panel:bottom()
		local center_y = bag_panel:center_y()
		local bag_text_panel = bag_panel:child("bag_text_panel")
		local bag_text = bag_text_panel:child("bag_text")
		local bag_text_bg = bag_text_panel:child("bag_text_bg")
		local bag_icon = bag_panel:child("bag_icon")
		bag_text_panel:stop()
		bag_text_panel:set_visible(true)
		bag_text_panel:animate(callback(self, self, "_animate_show_text"), bag_text, bag_text_bg, bag_icon)
		
		bag_panel:set_size(w, h + 2)
		bag_panel:set_center_x(scx)
		bag_panel:set_center_y(scy)
		wait(1.5)
		local TOTAL_T = 0.5
		local t = 0
		local x = bag_icon:x()
		local y = bag_icon:y()
		while t < TOTAL_T do
			local dt = coroutine.yield()
			t = t + dt
			bag_panel:set_center_x(math.lerp(scx, ecx, t / TOTAL_T))
			bag_panel:set_center_y(math.lerp(scy, ecy, t / TOTAL_T))
			bag_icon:set_x(math.lerp(x, bag_panel:w() - bag_icon:w(), t / TOTAL_T))
			bag_icon:set_y(math.lerp(y, bag_panel:h() - bag_icon:h(), t / TOTAL_T))
			bag_text:set_font_size(math.lerp(25, 20, t / TOTAL_T))
			bag_text_bg:set_font_size(math.lerp(25, 20, t / TOTAL_T))
			bag_text_panel:set_right(bag_icon:left())
			bag_text_panel:set_center_y(bag_icon:center_y())
		end
		bag_panel:set_size(w, h)
		bag_panel:set_center_x(ecx)
		bag_panel:set_center_y(ecy)
	end
	function HUDTemp:_animate_show_text(panel, text, bg, icon)

		text:set_left(panel:right())
		bg:set_left(panel:right() + 1)
		local text_x = text:x()
		icon:set_alpha(1)
		
		local TOTAL_T = 0.2
		local t = 0
		while TOTAL_T > t do
			local dt = coroutine.yield()
			t = t + dt
			icon:set_size(math.lerp(0, 40, t / TOTAL_T), math.lerp(0, 40, t / TOTAL_T))
			icon:set_center(panel:center())
		end
		
		local x = icon:x()
		local right = panel:right()
		local center_y = panel:center_y()
		panel:set_w(panel:w() * 2)
		text:set_w(text:w() * 2)
		bg:set_w(text:w())
		TOTAL_T = 0.5
		t = 0
		while TOTAL_T > t do
			local dt = coroutine.yield()
			t = t + dt
			icon:set_x(math.lerp(x, right, t / TOTAL_T))
			icon:set_center_y(center_y)
			icon:set_size(math.lerp(40, 25, t / TOTAL_T), math.lerp(40, 25, t / TOTAL_T))
			panel:set_right(icon:left())
			text:set_x(math.lerp(text_x, 1, t / TOTAL_T))
			bg:set_x(math.lerp(text_x + 1, 2, t / TOTAL_T))
		end
		text:set_x(0)
		bg:set_x(1)
		text:set_alpha(1)
		bg:set_alpha(1)
	end
	function HUDTemp:_animate_hide_text(panel, text, bg, icon)
		local TOTAL_T = 0.5
		local t = 0
		while TOTAL_T > t do
			local dt = coroutine.yield()
			t = t + dt
			text:set_x(math.lerp(0, panel:w(), t / TOTAL_T))
			bg:set_x(math.lerp(1, panel:w() + 1, t / TOTAL_T))
		end
		
		TOTAL_T = 0.3
		t = 0
		local w = icon:w()
		local center_x = icon:center_x()
		local center_y = icon:center_y()
		local icon_a = icon:alpha()
		TOTAL_T = 0.2
		while TOTAL_T > t do
			local dt = coroutine.yield()
			t = t + dt
			icon:set_alpha(math.lerp(icon_a, 0, t / TOTAL_T))
			icon:set_size(math.lerp(w, 0, t / TOTAL_T), math.lerp(w, 0, t / TOTAL_T))
			icon:set_center_x(center_x)
			icon:set_center_y(center_y)
		end
		text:set_alpha(1)
		text:set_font_size(25)
		bg:set_alpha(1)
		bg:set_font_size(25)
	end
end
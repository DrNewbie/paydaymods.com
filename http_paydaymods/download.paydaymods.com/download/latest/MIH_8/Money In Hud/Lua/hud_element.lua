Hooks:PostHook( HUDAssaultCorner, "init", "MoneyInHud", function(self, hud, full_hud, tweak_hud)
    self._money_panel_color = Color(255, 5, 165, 0) / 255

    self.money_panel = self._hud_panel:panel({
		visible = true,
		name = "money_panel",
		w = 400,
		h = 100,
		color = self._money_panel_color
	})

	self.total_money_panel = self._hud_panel:panel({
		visible = true,
		name = "total_money_panel",
		w = 400,
		h = 100,
		color = self._money_panel_color
	})

    self._money_panel_box = HUDBGBox_create(self.money_panel, {
		w = 242,
		h = 38,
		x = 0,
		y = 0
	}, {
		visible = true,
		blend_mode = "add"
	})

	self.money_count = self._money_panel_box:text({
		name = "money_count",
		text = "TAKE",
		valign = "center",
		align = "left",
		vertical = "center",
		w = self._money_panel_box:w(),
		h = self._money_panel_box:h(),
		layer = 1,
		x = 10,
		y = 0,
		color = Color.white,
		font = tweak_data.hud_corner.assault_font,
		font_size = tweak_data.hud_corner.numhostages_size
	})

	self.money_count_number = self._money_panel_box:text({
		name = "money_count_number",
		text = "$ 0",
		valign = "center",
		align = "right",
		vertical = "center",
		w = self._money_panel_box:w(),
		h = self._money_panel_box:h(),
		layer = 1,
		x = -10,
		y = 0,
		color = Color.white,
		font = tweak_data.hud_corner.assault_font,
		font_size = tweak_data.hud_corner.numhostages_size
	})

	self.total_money_count = self.total_money_panel:text({
		name = "total_money_count",
		text = "TOTAL   $ 0",
		valign = "center",
		align = "left",
		vertical = "center",
		w = self._money_panel_box:w(),
		h = self._money_panel_box:h(),
		layer = 1,
		x = 10,
		y = 0,
		color = Color.white,
		font = tweak_data.hud_corner.assault_font,
		font_size = 12
	})

    self.money_panel:set_top(self._hostages_bg_box:bottom() + 30)
    self.money_panel:set_left(self._hostages_bg_box:left() + 21)

    self.total_money_panel:set_top(self.money_panel:bottom() - 60)
    self.total_money_panel:set_left(self.money_panel:left() - 8)
end )
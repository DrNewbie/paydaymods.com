Hooks:PostHook(HUDAssaultCorner,"init","khud_init_assaultcorner",function(self, hud, full_hud, tweak_hud)
--	self._hud_panel = hud.panel
	local assault_panel = hud.panel:child("assault_panel")
--	local assault_panel = self._hud_panel:child("assault_panel")

--	assault_panel:set_x(0)
--	assault_panel:set_y(self._hud_panel:h() - (assault_panel:h()))

	local assault_clone = self._hud_panel:panel({
		name = "assault_clone",
		w = 200,-- - 72,
		h = 50,-- / 1.8,
		x = assault_panel:x() + 200,
		y = assault_panel:y() + 50--+assault_panel:h()
	})
	local phase_name = assault_clone:text({
		name = "phase_name",
		layer = 1,
		color = Color.yellow,
		align = "left",
		vertical = "top",
		font = tweak_data.hud_players.ammo_font,
		font_size = 18,
		text = ""
	})
	
	local phase_timer = assault_clone:text({
		name = "phase_timer",
		layer = 3,
		Color = Color.yellow,
		align = "center",
		vertical = "top",
		font = tweak_data.hud_players.ammo_font,
		font_size = 18,
		visible = Network:is_server(),--is_host
		text = ""
	})
	local debug_text = assault_clone:text({
		name = "debug_text",
		layer = 1,
		color = Color.yellow,
		align = "center",
		vertical = "center",
		font = tweak_data.hud_players.ammo_font,
		font_size = 18,
		visible = false,
		text = "debug: assault panel here"
	})
	
	local debug_assault = assault_clone:rect({
		color = Color.yellow:with_alpha(0.3),
		layer = 1,
		visible = false
	})
	local enabled = KineticHUD:IsMissionEnabled()
	self._hostages_bg_box:set_visible(not enabled)
	self._hud_panel:child("hostages_panel"):child("hostages_icon"):set_visible(not enabled)
--	self._hud_panel:child("hostages_panel"):child("hostages_icon"):set_alpha(enabled and 0 or 1)
end)

Hooks:PostHook(HUDAssaultCorner,"set_control_info","khud_set_control_info",function(self,data)
	managers.hud:set_hostage_count(data.nr_hostages) --custom func
end)

function HUDAssaultCorner:_set_phase_timer(t)
	local assault_clone = self._hud_panel:child("assault_clone")
	assault_clone:child("phase_timer"):set_text(t)
end

function HUDAssaultCorner:_set_phase_visible(toggle)
	local assault_clone = self._hud_panel:child("assault_clone"):child("phase_name"):set_visible(toggle)
end

function HUDAssaultCorner:_set_assault_phase(phase)
	local assault_clone = self._hud_panel:child("assault_clone")
	assault_clone:child("phase_name"):set_text(tostring(phase))
end
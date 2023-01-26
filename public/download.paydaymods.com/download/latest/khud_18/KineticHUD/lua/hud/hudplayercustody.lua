--
Hooks:PostHook(HUDPlayerCustody,"init","khud_init_hudplayercustody",function(self,hud)
	local custody_panel = hud.panel:child("custody_panel")
	local _debug_ = custody_panel:rect({
		name = "debug_custody",
		visible = false,
		color = Color.red:with_alpha(0.3),
		layer = 0
	})
	custody_panel:child("timer_msg"):set_y(100)
	custody_panel:child("timer"):set_y(144)
	custody_panel:child("trade_delay"):set_y(200)
	custody_panel:child("civilians_killed"):set_y(244)
--	custody_panel:set_y(hud.panel:h() - custody_panel:h())
end)
--]]
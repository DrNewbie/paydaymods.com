
--[[
Hooks:PostHook(HUDTemp,"init","khud_init_carryhud",function(self,hud)
	local new_bag_panel = hud:panel({
		name = "new_bag_panel"
		layer = 0,
		x = 0,
		y = 0,
		w = 128,
		h = 36
	})
end)

function HUDTemp:show_carry_bag(carry_id, value) --overridden
	local bag_panel = self._temp_panel:child("bag_panel")
	local carry_data = tweak_data.carry[carry_id]
	local type_text = carry_data.name_id and managers.localization:text(carry_data.name_id)
	local bag_text = bag_panel:child("bag_text")

	bag_text:set_text(utf8.to_upper(type_text .. " [" .. managers.experience:cash_string(value) .. "]"))
	bag_text:set_y(0)
	bag_panel:set_x(self._temp_panel:parent():w() / 2)
	bag_panel:set_visible(true)
	self._bg_box:child("bag_text"):set_visible(false)
	self._bg_box:set_h(28)
	local carrying_text = managers.localization:text("hud_carrying")

	self._bg_box:child("bag_text"):set_text(utf8.to_upper(type_text))
	self._bg_box:set_w(self._bag_panel_w, self._bag_panel_h)
	self._bg_box:set_position(0, 0)
	bag_panel:stop()
	bag_panel:animate(callback(self, self, "_animate_show_bag_panel"))
end
--]]

function HUDTemp:_animate_show_bag_panel(bag_panel)
	local w = self._bag_panel_w
	local h = self._bag_panel_h
	local scx = self._temp_panel:w() / 2
	local ecx = 0 + 300 -- self._temp_panel:w() - w / 2
	local scy = self._temp_panel:h() / 2
	local ecy = self._hud_panel:h() - (h + 144) --self:_bag_panel_bottom() - ((self._bag_panel_h / 2) + 30) --todo get top of teammate eq panel
	local bottom = bag_panel:bottom()
	local center_y = bag_panel:center_y()
	local bag_text = self._bg_box:child("bag_text")

	-- Lines: 132 to 136
	local function open_done()
		bag_text:stop()
		bag_text:set_visible(true)
		bag_text:animate(callback(self, self, "_animate_show_text"))
	end

	self._bg_box:stop()
	self._bg_box:animate(callback(nil, _G, "HUDBGBox_animate_open_center"), nil, w, open_done)
	bag_panel:set_size(w, h)
	bag_panel:set_center_x(scx)
	bag_panel:set_center_y(scy)
	wait(1)

	local TOTAL_T = 0.5
	local t = TOTAL_T

	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt

		bag_panel:set_center_x(math.lerp(scx, ecx, 1 - t / TOTAL_T))
		bag_panel:set_center_y(math.lerp(scy, ecy, 1 - t / TOTAL_T))
	end

	self._temp_panel:child("throw_instruction"):set_visible(false)--true
	self._temp_panel:child("throw_instruction"):set_text("")--
	self._temp_panel:child("throw_instruction"):set_alpha(0)--
	bag_panel:set_size(w, h)
	bag_panel:set_center_x(ecx)
	bag_panel:set_center_y(ecy)
end
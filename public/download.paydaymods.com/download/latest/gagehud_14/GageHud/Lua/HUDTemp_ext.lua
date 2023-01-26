if not mod_collection then
	return
end

HUDTemp._MARGIN = 8

function HUDTemp:init(hud)
	self._hud_panel = hud.panel
	if self._hud_panel:child("bag_panel") then
		self._hud_panel:remove(self._hud_panel:child("bag_panel"))
	end
	
	self._destination_size_ratio = 0.5
	
	self._panel = self._hud_panel:panel({
		visible = false,
		name = "bag_panel",
	})
	
	self._bg_box = HUDBGBox_create(self._panel, { }, {})
	
	self._bag_icon = self._panel:bitmap({
		name = "bag_icon",
		texture = "guis/textures/pd2/hud_tabs",
		texture_rect = { 32, 33, 32, 31 },
		visible = true,
		layer = 0,
		color = Color.white,
	})
	
	self._carry_text = self._panel:text({
		name = "carry_text",
		visible = true,
		layer = 2,
		color = Color.white,
		font = tweak_data.hud.medium_font_noshadow,
		align = "left",
		vertical = "center",
	})
end

function HUDTemp:show_carry_bag(carry_id, value)
	self._carry_id = carry_id
	self._value = value
	local carry_data = tweak_data.carry[carry_id]
	local type_text = carry_data.name_id and managers.localization:text(carry_data.name_id)
	
	self._carry_text:set_text(utf8.to_upper(type_text))
	local width = self:_get_text_width(self._carry_text) + HUDTemp._MARGIN * 2 + self._bag_icon:w()
	self._bg_box:set_w(width)
	self._bag_icon:set_left(self._bg_box:left() + HUDTemp._MARGIN)
	self._carry_text:set_left(self._bag_icon:right())
	
	self._panel:stop()
	local w, h, x, y = managers.hud:get_teammate_carry_panel_info(HUDManager.PLAYER_PANEL)
	self._panel:animate(callback(self, self, "_animate_pickup"), w, h, x, y, h)
end

function HUDTemp:hide_carry_bag()
	self._carry_id = nil
	self._value = nil
	self._panel:stop()
	self._panel:animate(callback(self, self, "_animate_drop"))
end

function HUDTemp:_get_text_width(obj)
	local _, _, w, _ = obj:text_rect()
	return w
end

function HUDTemp:_animate_pickup(o, ew, eh, ex, ey)
	local function update_size(w, h)
		self._panel:set_size(w * 1.1, h * 2)
		self._carry_text:set_font_size(h)
		local text_w = self:_get_text_width(self._carry_text)
		self._bag_icon:set_size(h, h)
		self._carry_text:set_size(text_w, h)
		
		self._bg_box:set_size(1.3 * (self._carry_text:w() + self._bag_icon:w() * 1.3), h * 1.75)
		self._bg_box:set_center(self._panel:w() / 2 - self._bg_box:w() * 0.05, self._panel:h() / 2)
		self._carry_text:set_center(0, self._panel:h() / 2)
		self._carry_text:set_right(self._panel:w() / 2 + self._carry_text:w() / 2 + self._bag_icon:w() / 4)
		self._bag_icon:set_center(0, self._panel:h() / 2)
		self._bag_icon:set_right(self._carry_text:left() - self._bag_icon:w() / 4)
	end
	
	local FLASH_T = 1
	local MOVE_T = 0.2
	
	self._panel:set_visible(true)
	local sw = ew / self._destination_size_ratio
	local sh = eh / self._destination_size_ratio
	update_size(sw, sh)
	self._panel:set_center(self._hud_panel:center())
	self._panel:set_y(self._hud_panel:h() * 0.6)
	local sx = self._panel:x()
	local sy = self._panel:y()
	
	local t = FLASH_T
	while t > 0 do
		local dt = coroutine.yield()
		t = math.max(t - dt, 0)
		local val = math.sin(4 * 360 * t^2)
		self._panel:set_visible(val > 0)
	end
	self._panel:set_visible(true)
	
	t = MOVE_T
	while t > 0 do
		local dt = coroutine.yield()
		t = math.max(t - dt, 0)
		local ratio = (MOVE_T-t)/MOVE_T
		local x = math.lerp(sx, ex, ratio)
		local y = math.lerp(sy, ey, ratio)
		self._panel:set_position(x, y)
		
		local w = math.lerp(sw, ew, ratio)
		local h = math.lerp(sh, eh, ratio)
		update_size(w, h)
	end
	
	self._panel:set_visible(false)
	managers.hud:set_teammate_carry_info(HUDManager.PLAYER_PANEL, self._carry_id, self._value, true)
end

function HUDTemp:_animate_drop(object)
	object:set_visible(false)
end

function HUDTemp:set_throw_bag_text() end
function HUDTemp:set_stamina_value(value) end
function HUDTemp:set_max_stamina(value) end
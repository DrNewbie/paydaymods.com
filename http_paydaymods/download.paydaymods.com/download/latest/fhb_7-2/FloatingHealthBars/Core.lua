
local RAIDWW2 = Idstring(Application:full_game_name()) == Idstring("RAID: World War II")

local function round(num, dec)
	local res = string.format('%.' .. (dec or 0) .. 'g', num)
	return res:find('e') and tostring(math.floor(num)) or res
end

local function now()
	return managers.player:player_timer():time()
end

local options = {
	size = 16,
	margin = 2,
	opacity = 90,
	color_start = Color("FFA500"):with_alpha(1),
	color_end = Color("FF0000"):with_alpha(1),
	color_friendly = Color("00FF00"):with_alpha(1)
}

-- FloatingHealthBarManager
-----------
FloatingHealthBarManager = FloatingHealthBarManager or {}

function FloatingHealthBarManager:init()
	if not setup.update_original then
		setup.update_original = setup.update
	end
	setup.update = function(setup_self, t, dt)
		setup_self:update_original(t, dt)
		self:_update(t, dt)
	end
	self._ws = managers.gui_data:create_fullscreen_workspace()
	self.pnl = self._ws:panel():panel({name = 'dmg_sheet', layer = 4})
	self.floats = {}
	self.smokes = {}
end

function FloatingHealthBarManager:_update(t, dt)
	self.cam = managers.viewport:get_current_camera()
	if not self.cam then return end
	self.rot = self.cam:rotation()
	self.camPos = self.cam:position()
	self.nl_cam_forward = self.rot:y()
	self.ww = self.pnl:w()
	self.hh = self.pnl:h()

	if CopDamage ~= nil then
		self:_updateItems(t, dt)
	end
end

function FloatingHealthBarManager:Float(unit)
	local key = unit.key and unit:key()
	if not key then return end
	local float = self.floats[key]
	if float then
		float:renew()
	else
		self.floats[key] = FloatingHealthBar:new(self, {key=key, unit=unit})
	end
end

function FloatingHealthBarManager:_tryGetState()
	local unit = managers.player:player_unit()
	if unit then
		local movement = unit:movement()
		if movement then
			return movement:current_state()
		end
	end
	return nil
end

function FloatingHealthBarManager:_updateItems(t, dt)
	self.state = self.state or self:_tryGetState()
	self.ADS = self.state and self.state._state_data.in_steelsight
	self:_scanSmoke(t)

	local r = nil
	local from = alive(managers.player:player_unit()) and managers.player:player_unit():movement():m_head_pos()
	if from then
		local mask = World:make_slot_mask(1, 8, 11, 12, 14, 16, 18, 21, 22, 24, 25, 26, 33, 34, 35)
		local to = from + managers.player:player_unit():movement():m_head_rot():y() * 30000
		local masks = type(mask) == 'string' and managers.slot:get_mask(mask) or mask or managers.slot:get_mask('bullet_impact_targets')
		r = World:raycast("ray", from, to, "slot_mask", masks)
	end
	if r and r.unit then
		local unit = r.unit
		if unit and unit:in_slot(8) and alive(unit:parent()) then
			unit = unit:parent()
		end
		unit = unit and (unit:movement() or unit:carry_data()) and unit
		local isBag = unit and unit:carry_data()
		if unit then
			local cHealth = unit:character_damage() and unit:character_damage()._health or false
			if not isBag and cHealth and cHealth > 0 then
				self:Float(unit)
			end
		end
	end

	for key,float in pairs(self.floats) do
		float:draw(t)
	end
end

function FloatingHealthBarManager:_scanSmoke(t)
	local smokeDecay = 3
	local units = World:find_units_quick('all', World:make_slot_mask(14))
	for i,smoke in pairs(units or {}) do
		if smoke:name():key() == '465d8f5aafa10ce5' then
			self.smokes[tostring(smoke:position())] = {smoke:position(), t}
		end
	end
	for id,smoke in pairs(clone(self.smokes)) do
		if t - smoke[2] > smokeDecay then
			self.smokes[id] = nil
		end
	end
end

function FloatingHealthBarManager:_pos(something, head)
	local t, unit = type(something)
	if t == 'number' then
		unit = managers.network:session():peer(something):unit()
	else
		unit = something
	end
	if not (unit and alive(unit)) then return Vector3() end
	local pos = Vector3()
	mvector3.set(pos, unit:position())
	if head and unit.movement and unit:movement() and unit:movement():m_head_pos() then
		mvector3.set_z(pos,unit:movement():m_head_pos().z + (type(head) == 'number' and head or 0))
	end
	return pos
end

function FloatingHealthBarManager:_visibility(uPos)
	local result = 1 - math.min(0.9, managers.environment_controller._current_flashbang or 1)
	if not uPos then
		return result
	end
	local minDis = 9999
	local sRad = 300
	for i, obj in pairs(self.smokes) do
		local sPos = obj[1]
		local cPos = self.camPos
		local disR, dotR = 1, 1
		local sDir = sPos - cPos
		local uDir = uPos - cPos
		local xDir = sPos - uPos
		minDis = math.min(sDir:length(), xDir:length())
		if minDis <= sRad then
			disR = math.pow(minDis / sRad, 3)
		elseif sDir:length() < uDir:length() then
			mvector3.normalize(sDir)
			mvector3.normalize(uDir)
			local dot = mvector3.dot(sDir, uDir)
			dotR = 1 - math.pow(dot, 3)
		end
		result = math.min(result, math.min(disR, dotR))
	end

	return result
end

function FloatingHealthBarManager:_v2p(pos)
	return alive(self._ws) and pos and self._ws:world_to_screen(self.cam, pos)
end

function FloatingHealthBarManager:_lbl(lbl, txts)
	local result = ''
	if not alive(lbl) then
		if type(txts) == 'table' then
			for _, t in pairs(txts) do
				result = result .. tostring(t[1])
			end
		else
			result = txts
		end
	else
		if type(txts) == 'table' then
			local pos = 0
			local posEnd = 0
			local ranges = {}
			for _, txtObj in ipairs(txts or {}) do
				txtObj[1] = tostring(txtObj[1])
				result = result .. txtObj[1]
				local _, count = txtObj[1]:gsub('[^\128-\193]', '')
				posEnd = pos + count
				table.insert(ranges, {pos, posEnd, txtObj[2] or Color.white})
				pos = posEnd
			end
			lbl:set_text(result)
			for _, range in ipairs(ranges) do
				lbl:set_range_color(range[1], range[2], range[3] or Color.green)
			end
		elseif type(txts) == 'string' then
			result = txts
			lbl:set_text(txts)
		end
	end
	return result
end

-- FloatingHealthBar
-----------
FloatingHealthBar = FloatingHealthBar or class()

function FloatingHealthBar:init(owner, data)
	self.owner = owner
	self.unit = data.unit
	self.key = data.key
	self.ppnl = owner.pnl
	self.lastT = now()
	self:_make()
end

function FloatingHealthBar:__shadow(x)
	if x then
		self.lblShadow1:set_x(x + 1)
		self.lblShadow2:set_x(x - 1)
	else
		self.lblShadow1:set_text(self._txts)
		self.lblShadow2:set_text(self._txts)
	end
end

function FloatingHealthBar:_make()
	local size = options.size
	local m = options.margin
	local pnl = self.ppnl:panel({
		x = 0,
		y = -size,
		w = 300,
		h = 100
	})
	local texture = RAIDWW2 and 'ui/hud/parts/meters_warccry_fill_hud' or 'guis/textures/pd2/hud_health'
	local font = RAIDWW2 and 'ui/fonts/lato_regular_20' or 'fonts/font_medium_mf'
	self.pnl = pnl
	if RAIDWW2 then
		self.bg = pnl:rect({
			name = "blur",
			layer = -1,
			x = 0,
			y = 0,
			color = tweak_data.gui.colors.raid_list_background,
			halign = "scale",
			valign = "scale",
			alpha = 0.7
		})
	else
		self.bg = pnl:bitmap({
			name = 'blur',
			texture = 'guis/textures/test_blur_df',
			render_template = 'VertexColorTexturedBlur3D',
			layer = -1,
			x = 0,
			y = 0
		})
	end
	self.pie = CircleBitmapGuiObject:new(pnl, {
		use_bg = false,
		x = m,
		y = m,
		image = texture,
		radius = size / 2,
		sides = 64,
		current = 20,
		total = 64,
		blend_mode = 'normal',
		layer = 4
	})
	self.pie._circle:set_texture_rect(128, 0, -128, 128)
	self.pieBg = pnl:bitmap({
		name = 'pieBg',
		texture = RAIDWW2 and 'ui/hud/parts/meters_stamina_fill_hud' or 'guis/textures/pd2/hud_progress_active',
		w = size,
		h = size,
		layer = 3,
		x = m,
		y = m,
		color = Color.black:with_alpha(0.5)
	})
	self.lbl = pnl:text{
		text = 'text',
		font = font,
		font_size = size,
		color = Color.white,
		x = size + m * 2,
		y = m,
		layer = 3,
		blend_mode = 'normal'
	}
	self.lblShadow1 = pnl:text{
		text = 'shadow',
		font = font,
		font_size = size,
		color = Color.black:with_alpha(0.3),
		x = 1 + size + m * 2,
		y = 1 + m,
		layer = 2,
		blend_mode = 'normal'
	}
	self.lblShadow2 = pnl:text{
		text = 'shadow',
		font = font,
		font_size = size,
		color = Color.black:with_alpha(0.3),
		x = size + m * 2 - 1,
		y = 1 + m,
		layer = 2,
		blend_mode = 'normal'
	}
end

function FloatingHealthBar:draw(t)
	if not alive(self.unit) or (t - self.lastT > 0.5) and not self.dead then
		self.dead = true
	end
	if self.dead and not self.dying then
		self:destroy()
	end
	if not alive(self.pnl) then
		return
	end
	local size = options.size
	local m = options.margin
	local isADS = self.owner.ADS
	local camPos = self.owner.camPos
	local prog, txts = 0, {}
	local unit = self.unit
	if not alive(unit) then return end
	local dx, dy, d, pDist, ww, hh = 0, 0, 1, 0, self.owner.ww, self.owner.hh
	if not ww then return end
	local pos = self.owner:_pos(unit, true)
	local nl_dir = pos - camPos
	local dir = pos - camPos
	mvector3.normalize(nl_dir)
	local dot = mvector3.dot(self.owner.nl_cam_forward, nl_dir)
	local pPos = self.owner:_v2p(pos)
	dx = pPos.x - ww / 2
	dy = pPos.y - hh / 2
	pDist = dx * dx + dy * dy
	self.pnl:set_visible(dot > 0)
	if dot > 0 then
		local cHealth = unit:character_damage() and unit:character_damage()._health and unit:character_damage()._health * 10 or 0
		local fHealth = cHealth > 0 and unit:character_damage() and (unit:character_damage()._HEALTH_INIT and unit:character_damage()._HEALTH_INIT * 10 or unit:character_damage()._health_max and unit:character_damage()._health_max * 10) or 1
		prog = cHealth / fHealth
		local isEnemy = managers.enemy:is_enemy(unit)
		local isConverted = unit:brain() and unit:brain()._logic_data and unit:brain()._logic_data.is_converted
		local isTurret = unit:base() and unit:base().get_type and unit:base():get_type() == "swat_turret"
		local color = ((isEnemy and not isConverted) or isTurret) and math.lerp(options.color_end, options.color_start, prog) or options.color_friendly
		if pDist <= 100000 and cHealth > 0 then
			table.insert(txts, {round(cHealth, 2) .. '/' .. round(fHealth, 2), color})
		end
		pPos = pPos:with_y(pPos.y - size * 2)
		if prog > 0 then
			self.pie:set_current(prog)
			self.pieBg:set_visible(true)
			self.lbl:set_x(2 * m + size)
			self:__shadow(2 * m + size)
		else
			self.pie:set_visible(false)
			self.pieBg:set_visible(false)
			self.lbl:set_x(m)
			self:__shadow(m)
		end
		if self._txts ~= self.owner:_lbl(nil, txts) then
			self._txts = self.owner:_lbl(self.lbl, txts)
			self:__shadow()
		end
		local _, _, w, h = self.lbl:text_rect()
		h = math.max(h, size)
		self.pnl:set_size(m * 2 + (w > 0 and w + m + 1 or 0) + (prog > 0 and size or 0), h + 2 * m)
		self.bg:set_size(self.pnl:size())
		self.pnl:set_center(pPos.x, pPos.y)
		if isADS then
			d = math.clamp((pDist - 1000) / 2000, 0.4, 1)
		else
			d = 1
		end
		d = math.min(d, options.opacity / 100)
		if not (unit and unit:contour() and #(unit:contour()._contour_list or {}) > 0) then
			d = math.min(d, self.owner:_visibility(pos))
		end
		if not self.dying then
			self.pnl:set_alpha(d)
			self.lastD = d -- d is for starting alpha
		end
	end
end

function FloatingHealthBar:renew()
	self.lastT = math.max(self.lastT, now())
	self.dead = false
end

function FloatingHealthBar:destroy(skipAnim)
	local pnl = self.pnl
	if alive(self.ppnl) and alive(pnl) then
		if not skipAnim then
			if not self.dying then
				self.dying = true
				pnl:stop()
				pnl:animate(callback(self, FloatingHealthBar, '_fade'), callback(self, self, 'destroy', true), 0.2)
			end
		else
			self.ppnl:remove(self.pnl)
			self.owner.floats[self.key] = nil
		end
	end
end

function FloatingHealthBar:_fade(pnl, done_cb, seconds)
	local pnl = self.pnl
	if not pnl then return end
	pnl:set_visible(true)
	pnl:set_alpha(1)
	local t = seconds
	while alive(pnl) and t > 0 do
		if not self.dead then
			self.dying = false
			break
		end
		local dt = coroutine.yield()
		t = t - dt
		pnl:set_alpha((self.lastD or 1) * t / seconds)
	end
	if self.dying then
		pnl:set_visible(false)
		if done_cb then done_cb(pnl) end
	end
end

--- Class end ---
FloatingHealthBarManager:init()
FloatingHealthBars_initialized = true

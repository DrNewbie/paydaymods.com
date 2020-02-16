	local HUDManager_setup_player_info_hud_pd2_original = HUDManager._setup_player_info_hud_pd2
    local HUDManager_update_original = HUDManager.update
     
    function HUDManager:_setup_player_info_hud_pd2(...)
    	HUDManager_setup_player_info_hud_pd2_original(self, ...)
    	self:_setup_minimap()
    end
     
    function HUDManager:update(t, dt, ...)
    	self._hud_minimap:update(t, dt)
    	return HUDManager_update_original(self, t, dt, ...)
    end
     
    function HUDManager:_setup_minimap()
    	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
    	self._hud_minimap = HUDMiniMap:new(hud.panel)
    end
     
    function HUDManager:set_minimap_enabled(status)
		self._hud_minimap:set_enabled(status and true or false)
    end
     
    function HUDManager:set_minimap_zoom(zoom)
    	self._hud_minimap:set_zoom(zoom)
    end
     
    function HUDManager:rotate_minimap(status)
    	self._hud_minimap:set_rotate_with_player(status and true or false)
    end
     
     
    HUDMiniMap = HUDMiniMap or class()
     
    HUDMiniMap.WIDTH = 250
    HUDMiniMap.HEIGHT = 250
     
    HUDMiniMap._INDEX = {
    	--SHADOW RAID
    	kosugi = {
    		--[[{
    			index = 2,	--Roof
    			size = { w = 2048, h = 2048 },
    			scale = 0.25,
    			bounds = {
    				x = { min = -3745, max = 595 },
    				y = { min = -5595, max = -1255 },
    				z = { min = 1600 },
    			},
    		},]]
    		{
    			index = 3,	--Upper floor
    			size = { w = 2048, h = 2048 },
    			scale = 0.25,
    			bounds = {
    				x = { min = -3745, max = 595 },
    				y = { min = -5595, max = -1255 },
    				z = { max = 1600, min = 1150 },
    			},
    		},
    		{
    			index = 4,	--Ground floor
    			size = { w = 2048, h = 2048 },
    			scale = 0.25,
    			bounds = {
    				x = { min = -3745, max = 595 },
    				y = { min = -5595, max = -1255 },
    				z = { max = 1150, --[[min = 780]] },
    			},
    		},
    		{
    			index = 1,	--Exterior
    			size = { w = 2048, h = 2048 },
    			scale = 0.30,
    		},
    	},
    	--FRAMING FRAME DAY 1 (+ ART GALLERY)
    	framing_frame_1 = {
    		{
    			index = 1,	--Interior
    			size = { w = 1024, h = 1024 },
    			scale = 0.5,
    			bounds = {
    				x = { min = -2395, max = 2364 },
    				y = { min = -2420, max = 2371 },
    				z = { max = 450 },
    			},
    		},
    		{
    			index = 2,	--Exterior
    			size = { w = 1024, h = 1024 },
    			scale = 0.5,
    		},
    	},
    	--FRAMING FRAME DAY 3
    	framing_frame_3 = {
    		{
    			index = 1,	--Lower floor
    			size = { w = 1024, h = 1024 },
    			scale = 0.35,
    			bounds = {
    				z = { max = 3200 },
    			},
    			
    		},
    		{
    			index = 2,	--Upper floor
    			size = { w = 1024, h = 1024 },
    			scale = 0.35,
    			bounds = {
    				z = { max = 3650, min = 3200 },
    			},
    			
    		},
    		{
    			index = 3,	--Roof
    			size = { w = 1024, h = 1024 },
    			scale = 0.35,
    		},
    	},
    	--BRANCH BANK (+ FIRESTARTER DAY 3)
    	branchbank = {
    		data_override = tweak_data.preplanning.locations.branchbank,
    		{
    			index = 1,	--Interior
    			size = { w = 2048, h = 2048 },
    			scale = 0.2,
    			bounds = {
    				x = { min = -3200, max = 0 },
    				y = { min = 0, max = 3500 },
    			},
    		},
    		{
    			index = 2,	--Exterior
    			size = { w = 2048, h = 2048 },
    			scale = 0.2,
    		},
    	},
    	--THE BOMB: DOCKS
    	crojob2 = {
    		{
    			index = 1,
    			size = { w = 2048, h = 2048 },
    			scale = 0.4,
    		},
    	},
    	--THE BOMB: FOREST (
    	crojob3 = {
    		{
    			index = 1,	--Road / south end (very inaccurate)
    			size = { w = 1024, h = 1024 },
    			scale = 0.4,
    			use_map_bounds = true,
    		},
    		{
    			index = 2,	--Trains / north end
    			size = { w = 1024, h = 1024 },
    			scale = 0.4,
    		},
    	},
    	--BIG BANK
    	big = {
    		{
    			index = 5,	--Vault area lower floor
    			size = { w = 2048, h = 2048 },
    			scale = 0.25,
    			use_map_bounds = true,
    			bounds = {
    				x = { max = 50 },
    				z = { max = -750 },
    			},
    		},
    		{
    			index = 4,	--Vault area upper floor
    			size = { w = 2048, h = 2048 },
    			scale = 0.25,
    			use_map_bounds = true,
    			bounds = {
    				x = { max = 400 },
    				z = { min = -750, max = -100 },
    			},
    		},
    		{
    			index = 1,	--Entrance ground floor
    			size = { w = 2048, h = 2048 },
    			scale = 0.25,
    			bounds = {
    				z = { max = -750 },
    			},
    		},
    		{
    			index = 2,	--Entrance upper floor
    			size = { w = 2048, h = 2048 },
    			scale = 0.25,
    			bounds = {
    				z = { min = -750, max = -100 },
    			},
    		},
    		{
    			index = 3,	--Roof
    			size = { w = 2048, h = 2048 },
    			scale = 0.2,
    		},
    	},
    	--THE DIAMOND
    	mus = {
    		{
    			index = 3,	--Basement
    			size = { w = 2048, h = 1024 },
    			scale = 0.7,
    			bounds = {
    				x = { min = -3600, max = -1100 },
    				z = { max = -900 },
    			},
    		},
    		{
    			index = 2,	--Ground floor
    			size = { w = 2048, h = 1024 },
    			scale = 0.7,
    			bounds = {
    				x = { min = -3200 },
    				y = { max = -600 },
    				z = { min = -1100, max = -500 },
    			},
    		},
    		{
    			index = 1,	--Main floor / Exterior
    			size = { w = 2048, h = 1024 },
    			scale = 0.7,
    		},
    	},
    	--HOTLINE MIAMI DAY 1
    	mia_1 = {
    		{
    			index = 3,	--Motel upper floor
    			size = { w = 1024, h = 512 },
    			scale = 0.5,
    			use_map_bounds = true,
    			bounds = {
    				x = { min = -650, max = 5600 },
    				y = { min = -4450, max = -1400 },
    				z = { min = 150 },
    			},
    		},
    		{
    			index = 2,	--Motel groud floor
    			size = { w = 1024, h = 512 },
    			scale = 0.5,
    			use_map_bounds = true,
    			bounds = {
    				x = { min = -650, max = 5600 },
    				y = { min = -4450, max = -1400 },
    				z = { max = 150 },
    			},
    		},
    		{
    			index = 1,	--Overview
    			size = { w = 2048, h = 1024 },
    			scale = 0.35,
    		},
    	},
    	--HOTLINE MIAMI DAY 2
    	mia_2 = {
    		{
    			index = 1,	--Ground floor
    			size = { w = 1024, h = 1024 },
    			scale = 0.6,
    			use_map_bounds = true,
    			bounds = {
    				z = { max = 200 },
    			},
    		},
    		{
    			index = 2,	--2nd floor
    			size = { w = 1024, h = 1024 },
    			scale = 0.6,
    			bounds = {
    				z = { max = 600 },
    			},
    		},
    		{
    			index = 3,	--3rd floor
    			size = { w = 1024, h = 1024 },
    			scale = 0.6,
    			bounds = {
    				z = { max = 1000 },
    			},
    		},
    		{
    			index = 4,	--4th floor
    			size = { w = 1024, h = 1024 },
    			scale = 0.6,
    			bounds = {
    				z = { max = 1400 },
    			},
    		},
    		{
    			index = 5,	--Penthouse
    			size = { w = 1024, h = 1024 },
    			scale = 0.6,
    		},
    	},
		--THE GOLDEN GRIN CASINO
		kenaz = {
			{
				index = 2,	--Inside
				size = { w = 672, h = 1792 },
				scale = 0.6,
				use_map_bounds = true,
			},
		},
		--Beneath the Mountain
		pbr = {
    		{
    			index = 1,	--underground
    			size = { w = 2048, h = 2048 },
    			scale = 0.4,
    			use_map_bounds = true,
				bounds = {
    				z = { max = 5000 },
    			}
    		},
    		{
    			index = 2,	--escape area
    			size = { w = 2048, h = 2048 },
    			scale = 0.4,
    		},
    	} 
    }
     
    HUDMiniMap._INDEX.gallery = deep_clone(HUDMiniMap._INDEX.framing_frame_1)	--ART GALLERY
    HUDMiniMap._INDEX.firestarter_3 = deep_clone(HUDMiniMap._INDEX.branchbank)	--FIRESTARTER DAY 3
    HUDMiniMap._INDEX.crojob3_night = deep_clone(HUDMiniMap._INDEX.crojob3)	--THE BOMB: FOREST (NIGHT)
     
     
    function HUDMiniMap:init(parent)
    	self._parent = parent
    	self._current_index = 0
    	self._zoom = 1
    	self._level = managers.job:current_level_id()
    	self._level_data = self._level and (self._INDEX[self._level] and self._INDEX[self._level].data_override or tweak_data.preplanning.locations[self._level])
    	self._enabled = self._level_data and true or false
    	self._rotate_with_player = false
    	
    	self._panel = self._parent:panel({
    		name = "map_panel",
    		visible = self._enabled,
    		w = self.WIDTH,
    		h = self.HEIGHT,
    	})
    	self._panel:set_center(self._parent:w() / 2, self._parent:h() / 2)	
    	self._panel:set_left(0)
    			
    	self._map_bg = self._panel:rect({
    		blend_mode = "normal",
    		color = Color.black,
    		alpha = 0.5,
    		h = self._panel:h(),
    		w = self._panel:w(),
    	})
    	
    	self._player_avatar = self._panel:text({
    		align = "center",
    		vertical = "center",
    		text = "V",
    		font = tweak_data.menu.pd2_small_font,
    		font_size = 15,
    		color = Color.green,
    		blend_mode = "normal",
    		layer = 1,
    	})
    	
    	self._enemy_avatars = {}
    	self._criminal_avatars = {}
    end
     
    function HUDMiniMap:set_enabled(status)
    	if self._level_data then
    		self._enabled = status
    		self._panel:set_visible(status)
    	end
    end
     
    function HUDMiniMap:set_zoom(zoom)
    	self._zoom = math.max(zoom, 0)
    end
     
    function HUDMiniMap:set_rotate_with_player(status)
    	self._rotate_with_player = status
    end
     
    function HUDMiniMap:update(t, dt)
    	if not (self._enabled and self._level_data and managers.player:player_unit() and alive(managers.player:player_unit())) then
    		return
    	end
    	
    	local player_pos = managers.player:player_unit():position()
    	if self:_check_bounds(player_pos) then
    		self._player_rotation = managers.player:player_unit():camera():rotation():yaw()
    		self._current_rotation = (self._current_map_tweak.rotation or 0) - (self._rotate_with_player and (self._current_map_tweak.rotation - self._player_rotation) or 0)
    		local x, y, z = self:_world_to_map_coordinates(player_pos.x, player_pos.y, player_pos.z)
    		self:_update_map(x, y, z)
    		self:_update_player_avatar(x, y, z)
    		self:_update_enemy_positions()
    		self:_update_criminal_positions()
    	end
    end
     
    function HUDMiniMap:_check_bounds(pos)
    	for i, map_data in ipairs(self._INDEX[self._level] or {}) do
    		local bx = map_data.bounds and map_data.bounds.x or map_data.use_map_bounds and  { min = self._level_data[map_data.index].x1, max = self._level_data[map_data.index].x2 }
    		local by = map_data.bounds and map_data.bounds.y or map_data.use_map_bounds and  { min = self._level_data[map_data.index].y1, max = self._level_data[map_data.index].y2 }
    		local bz = map_data.bounds and map_data.bounds.z
    			
    		if	(not bx or ((not bx.min or bx.min <= pos.x) and (not bx.max or bx.max >= pos.x))) and
    			(not by or ((not by.min or by.min <= pos.y) and (not by.max or by.max >= pos.y))) and
    			(not bz or ((not bz.min or bz.min <= pos.z) and (not bz.max or bz.max >= pos.z))) then
    				if self._current_index ~= i then
    					self._current_index = i
    					self._current_map = self._INDEX[self._level][self._current_index]
    					self._current_map_tweak = self._level_data[self._current_map.index]
    					self._map_scale = self._zoom * (self._current_map.scale or 1)
    				end
    				return true
    		end
    	end
    	
    	self._current_index = 0
    	self._current_map = nil
    	self._current_map_tweak = nil
    	return false
    end
     
    function HUDMiniMap:_world_to_map_coordinates(world_x, world_y, world_z)
    	local map_x = self._current_map.size.w * (world_x - self._current_map_tweak.x1) / (self._current_map_tweak.x2 - self._current_map_tweak.x1)
    	local map_y = self._current_map.size.h * (world_y - self._current_map_tweak.y2) / (self._current_map_tweak.y1 - self._current_map_tweak.y2)
    	local map_z = world_z
    	
    	return map_x, map_y, map_z
    end
     
    function HUDMiniMap:_get_relative_map_coordinates(x, y, z)
    	local relative_x = (x - self._left_bound) * self._map_scale
    	local relative_y = (y - self._top_bound) * self._map_scale
    	local relative_z = z
     
    	return relative_x, relative_y, relative_z
    end
     
    function HUDMiniMap:_rotate_coordinates(x, y, z, invert)
    	local rot_x = x
    	local rot_y = y
    	local rot_z = z
    	
    	if self._current_rotation ~= 0 then
    		local tmp_x = rot_x - self.WIDTH / 2
    		local tmp_y = rot_y - self.HEIGHT / 2
    		local radius = math.sqrt((tmp_x)^2 + (tmp_y)^2)
    		local angle = math.atan2((tmp_y), (tmp_x)) + self._current_rotation * (invert and -1 or 1)
    		
    		rot_x = radius * math.cos(angle) + self.WIDTH / 2
    		rot_y = radius * math.sin(angle) + self.HEIGHT / 2
    	end
    	
    	return rot_x, rot_y, rot_z
    end
     
    function HUDMiniMap:_world_coordinate_on_map(world_x, world_y, world_z, map)
    	local map_tweak = map and self._level_data[map.index] or self._current_map_tweak
    	return world_x >= map_tweak.x1 and world_x < map_tweak.x2 and world_y >= map_tweak.y1 and world_y < map_tweak.y2
    end
     
    function HUDMiniMap:_relative_coordinate_on_current_map(x, y, z)
    	local xt, yt = self:_rotate_coordinates(x, y, z, true)
    	return xt >= 0 and xt <= self.WIDTH and yt >= 0 and yt <= self.HEIGHT
    end
     
    function HUDMiniMap:_update_map(x, y, z)
    	self._left_bound = math.clamp(x - self.WIDTH / (2 * self._map_scale), 0, self._current_map.size.w - self.WIDTH / self._map_scale)
    	self._top_bound = math.clamp(y - self.HEIGHT / (2 * self._map_scale), 0, self._current_map.size.h - self.HEIGHT / self._map_scale)
    	
    	if self._map then
    		self._panel:remove(self._map)
    	end
    	
    	self._map = self._panel:bitmap({
    		name = "map",
    		texture_rect = { 
    			self._left_bound, 
    			self._top_bound, 
    			self.WIDTH / self._map_scale, 
    			self.HEIGHT / self._map_scale
    		},
    		texture = self._current_map_tweak.texture,
    		blend_mode = "add",
    		w = self.WIDTH,
    		h = self.HEIGHT,
    		alpha = 0.5,
    		layer = 1,
    		rotation = self._current_rotation,
    	})
    	self._map_bg:set_rotation(self._current_rotation)
    end
     
    function HUDMiniMap:_update_player_avatar(absolute_x, absolute_y, absolute_z)
    	local player_rotation = self._rotate_with_player and 0 or ((self._current_map_tweak.rotation or 0) - self._player_rotation)	
    	self._player_avatar:set_rotation(180 + player_rotation)
    	local x, y, z = self:_get_relative_map_coordinates(absolute_x, absolute_y, absolute_z)
    	x = math.clamp(x, -3, self.WIDTH + 3)
    	y = math.clamp(y, -3, self.HEIGHT + 3)
    	x, y, z = self:_rotate_coordinates(x, y, z)
    	self._player_avatar:set_center(x, y)
    end
     
    function HUDMiniMap:_update_enemy_positions()
    	for u_key, u_data in pairs(managers.enemy:all_enemies()) do
    		if not self._enemy_avatars[u_key] and not u_data.unit:anim_data().surrender then
    			local avatar = self._panel:text({
    				align = "center",
    				vertical = "center",
    				visible = false,
    				font = tweak_data.menu.pd2_small_font,
    				font_size = 12,
    				color = Color.red,
    				blend_mode = "normal",
    				layer = 1,
    			})
    			self._enemy_avatars[u_key] = { avatar = avatar, unit = u_data.unit }
    		end
    	end
    	
    	local player_pos = managers.player:player_unit():position()
    	local delete_me = {}
    	
    	for key, data in pairs(self._enemy_avatars) do
    		if alive(data.unit) and not data.unit:character_damage():dead() and not data.unit:anim_data().surrender then
    			local visible = false
    			local pos = data.unit:position()
    			
    			if data.unit:contour() and data.unit:contour()._contour_list then
    				if self:_world_coordinate_on_map(pos.x, pos.y, pos.z) then
    					local x, y, z = self:_rotate_coordinates(self:_get_relative_map_coordinates(self:_world_to_map_coordinates(pos.x, pos.y, pos.z)))
    					if self:_relative_coordinate_on_current_map(x, y, z) then
    						local rotate = true
    						local symbol = "V"
    						if z > player_pos.z + 250 then
    							rotate = false
    							symbol = "+"
    						elseif z < player_pos.z - 250 then
    							rotate = false
    							symbol = "-"
    						end
    						
    						data.avatar:set_center(x, y)
    						data.avatar:set_text(symbol)
    						data.avatar:set_rotation(rotate and (-data.unit:movement():m_head_rot():yaw() + self._current_rotation) or 0)
    						visible = true
    					end
    				end
    			end
    			
    			data.avatar:set_visible(visible)
    		else
    			table.insert(delete_me, key)
    		end
    	end
     
    	for _, key in ipairs(delete_me) do
    		self._panel:remove(self._enemy_avatars[key].avatar)
    		self._enemy_avatars[key] = nil
    	end
    end
     
    function HUDMiniMap:_update_criminal_positions()
    	for id, data in pairs(managers.criminals:characters()) do
    		if not self._criminal_avatars[id] and data.taken and alive(data.unit) and data.unit:id() ~= -1 and data.unit ~= managers.player:player_unit() then
    			local avatar = self._panel:text({
    				align = "center",
    				vertical = "center",
    				visible = false,
    				font = tweak_data.menu.pd2_small_font,
    				font_size = 12,
    				color = tweak_data.chat_colors[data.data.panel_id]:with_alpha(1),
    				blend_mode = "normal",
    				layer = 1,
    			})
    			self._criminal_avatars[id] = { avatar = avatar, unit = data.unit, is_ai = data.data.ai }
    		end
    	end
    	
    	local player_pos = managers.player:player_unit():position()
    	local delete_me = {}
    	
    	for key, data in pairs(self._criminal_avatars) do
    		if alive(data.unit) then
    			local visible = false
    			local pos = data.unit:position()
    			
    			if self:_world_coordinate_on_map(pos.x, pos.y, pos.z) then
    				local x, y, z = self:_get_relative_map_coordinates(self:_world_to_map_coordinates(pos.x, pos.y, pos.z))
    				x, y, z = self:_rotate_coordinates(x, y, z)
    				if self:_relative_coordinate_on_current_map(x, y, z) then
    					local rotate = true
    					local symbol = "V"
    					if z > player_pos.z + 250 then
    						rotate = false
    						symbol = "+"
    					elseif z < player_pos.z - 250 then
    						rotate = false
    						symbol = "-"
    					end
    					
    					data.avatar:set_center(x, y)
    					data.avatar:set_text(symbol)
    					data.avatar:set_rotation(rotate and ((data.is_ai and 0 or 180) - data.unit:movement():m_head_rot():yaw() + self._current_rotation) or 0)
    					visible = true
    				end
    			end
    			
    			data.avatar:set_visible(visible)
    		else
    			table.insert(delete_me, key)
    		end
    	end
     
    	for _, key in ipairs(delete_me) do
    		self._panel:remove(self._criminal_avatars[key].avatar)
    		self._criminal_avatars[key] = nil
    	end
    end
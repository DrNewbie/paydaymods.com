CloneClass(MenuSceneManager)
local ids_unit = Idstring("unit")
local sky_orientation_data_key = Idstring("sky_orientation/rotation"):key()


function MenuSceneManager:_setup_bg()
	local yaw = 180
	self._bg_unit = World:spawn_unit(Idstring("units/menu/menu_scene/menu_cylinder"), Vector3(0, 0, 0), Rotation(yaw, 0, 0))
	self._menu_cylinder_pattern = World:spawn_unit(Idstring("units/menu/menu_scene/menu_cylinder_pattern"), Vector3(0, 0, 0), Rotation(yaw, 0, 0))
	self._menu_cylinder1 = World:spawn_unit(Idstring("units/menu/menu_scene/menu_smokecylinder1"), Vector3(0, 0, 0), Rotation(yaw, 0, 0))
	self._menu_cylinder2 = World:spawn_unit(Idstring("units/menu/menu_scene/menu_smokecylinder2"), Vector3(0, 0, 0), Rotation(yaw, 0, 0))
	self._menu_cylinder3 = World:spawn_unit(Idstring("units/menu/menu_scene/menu_smokecylinder3"), Vector3(0, 0, 0), Rotation(yaw, 0, 0))
	self._menu_logo = World:spawn_unit(Idstring("units/menu/menu_scene/menu_logo"), Vector3(0, 0, 0), Rotation(yaw, 0, 0))
    
    self._menu_cylinder1:set_enabled(Poser.loaded_options.Menu.Smoke)
	self._menu_cylinder2:set_enabled(Poser.loaded_options.Menu.Smoke)
	self._menu_cylinder3:set_enabled(Poser.loaded_options.Menu.Smoke)	
    
    self._menu_logo:set_enabled(Poser.loaded_options.Menu.Logo)
    
    self._menu_cylinder_pattern:set_enabled(Poser.loaded_options.Menu.Pattern) 
       
	for character_id, data in pairs(tweak_data.blackmarket.characters) do
		if Global.blackmarket_manager.characters[character_id].equipped then
			self:set_character(character_id)
		end
	end
    
	--[[if managers.dlc:is_dlc_unlocked("complete_overkill_pack") then
		local a = self._bg_unit:get_object(Idstring("a_reference"))
		local rot = Rotation(60, 0, 0)
		local pos = Vector3(-180, 160, -120)
		self._complete_overkill_pack_safe = World:spawn_unit(Idstring("units/payday2/equipment/gen_interactable_sec_safe_overkill/gen_interactable_sec_safe_overkill"), pos, rot)
        self._complete_overkill_pack_safe:set_enabled(Poser.loaded_options.Menu.COPSafe)
	end]]--
    
    --[[local a = self._bg_unit:get_object(Idstring("a_reference"))
	self._snow_effect = World:effect_manager():spawn({
		effect = Idstring("effects/payday2/menu/menu_snow_xmas_5x5"),
		position = Vector3(0, 0, 0),
		rotation = Rotation()
	})
	self._xmas_tree = World:spawn_unit(Idstring("units/pd2_dlc2/props/com_props_christmas_tree/com_prop_christmas_tree"), a:position() + Vector3(-150, 250, -50), Rotation(-45 + (math.random(2) - 1) * 180, 0, 0))
	self._snow_pile = World:spawn_unit(Idstring("units/pd2_dlc_cane/props/cne_prop_snow_pile_01/cne_prop_snow_pile_01"), a:position() + Vector3(-35, 275, -75), Rotation(305, 0, 0))
    
    World:effect_manager():set_hidden(self._snow_effect, not Poser.loaded_options.Menu.ChristmasEffect)
    self._xmas_tree:set_enabled(Poser.loaded_options.Menu.ChristmasEffect)
    self._snow_pile:set_enabled(Poser.loaded_options.Menu.ChristmasEffect)]]--
    
	local e_money = self._bg_unit:effect_spawner(Idstring("e_money"))
	if e_money then
		e_money:set_enabled(Poser.loaded_options.Menu.Particles)
	end
    
	self:_setup_lobby_characters()
end

function MenuSceneManager:set_scene_template(template, data, custom_name, skip_transition)
	if not skip_transition and (self._current_scene_template == template or self._current_scene_template == custom_name) then
		return
	end
	local template_data
	if not skip_transition then
		managers.menu_component:play_transition()
		self._fov_mod = 0
		self._camera_object:set_fov(self._current_fov + (self._fov_mod or 0))
		template_data = data or self._scene_templates[template]
		self._current_scene_template = custom_name or template
		self._character_values = self._character_values or {}
        
        if self._character_unit then
            self._character_values.pos_target = Poser.loaded_options.Menu.Position_save and Vector3(Poser.loaded_options.Menu.Position_x, Poser.loaded_options.Menu.Position_y, Poser.loaded_options.Menu.Position_z) or self._character_unit:position()
        end
        
		if self._character_values.pos_target then
			self._character_values.pos_current = self._character_values.pos_current or Vector3()
			mvector3.set(self._character_values.pos_current, self._character_values.pos_target)
        elseif template_data.character_pos then
			self._character_values.pos_current = self._character_values.pos_current or Vector3()
			mvector3.set(self._character_values.pos_current, template_data.character_pos)
		end
        
		local set_character_position = false
		if self._character_values.pos_current then
			self._character_values.pos_target = self._character_values.pos_target or Vector3()
			mvector3.set(self._character_values.pos_target, self._character_values.pos_current)
			set_character_position = true
        elseif template_data.character_pos then
			self._character_values.pos_target = self._character_values.pos_target or Vector3()
			mvector3.set(self._character_values.pos_target, template_data.character_pos)
			set_character_position = true
		end
        
		if set_character_position and self._character_values.pos_target then
			self._character_unit:set_position(self._character_values.pos_target)
		end
        
        if template_data.character_rot then
            self._character_unit:set_rotation(Rotation(template_data.character_rot, self._character_pitch))
            self._character_yaw = template_data.character_rot
        end
        
		self:_chk_character_visibility(self._character_unit)
		--self:_chk_complete_overkill_pack_safe_visibility()
        self:reset_character_deployables()
		if self._lobby_characters then
			for _, unit in pairs(self._lobby_characters) do
				self:_chk_character_visibility(unit)
			end
		end
        self:_use_environment(template_data.environment or "standard")
 		self:post_ambience_event(template_data.ambience_event or "menu_main_ambience")
		self._camera_values.camera_pos_current = self._camera_values.camera_pos_target
		self._camera_values.target_pos_current = self._camera_values.target_pos_target
		self._camera_values.fov_current = self._camera_values.fov_target
		if self._transition_time then
			self:dispatch_transition_done()
		end
		self._transition_time = 1
		self._camera_values.camera_pos_target = template_data.camera_pos or self._camera_values.camera_pos_current
		self._camera_values.target_pos_target = template_data.target_pos or self._camera_values.target_pos_current
		self._camera_values.fov_target = template_data.fov or self._standard_fov
		self:_release_item_grab()
		self:_release_character_grab()
		self._use_item_grab = template_data.use_item_grab
		self._use_character_grab = template_data.use_character_grab
		self._use_character_grab2 = template_data.use_character_grab2
		self._use_character_pan = template_data.use_character_pan
		self._disable_rotate = template_data.disable_rotate or false
        self._disable_item_updates = template_data.disable_item_updates or false
		self._can_change_fov = template_data.can_change_fov or false
        self._can_move_item = template_data.can_move_item or false
		self._change_fov_sensitivity = template_data.change_fov_sensitivity or 1
		self._characters_deployable_visible = template_data.characters_deployable_visible or false
		self:set_character_deployable(Global.player_manager.kit.equipment_slots[1], false, 0)
		if template_data.remove_infamy_card and self._card_units and self._card_units[self._character_unit:key()] then
			local secondary = managers.blackmarket:equipped_secondary()
			if secondary then
				self:set_character_equipped_weapon(nil, secondary.factory_id, secondary.blueprint, "secondary", secondary.cosmetic)
			end
		end
        if template_data._set_character_pose then
            self:_select_character_pose()
        end
		if alive(self._menu_logo) then
			self._menu_logo:set_visible(not template_data.hide_menu_logo)
		end
	end
	if template_data and template_data.upgrade_object then
		self._temp_upgrade_object = template_data.upgrade_object
		self:_set_item_offset(template_data.upgrade_object:oobb())
	elseif self._use_item_grab and self._item_unit then
		if self._item_unit.unit then
			managers.menu_scene:_set_weapon_upgrades(self._current_weapon_id)
			self:_set_item_offset(self._current_item_oobb_object:oobb())
		else
			self._item_unit.scene_template = {
				template = template,
				data = data,
				custom_name = custom_name
			}
		end
	end
	if not skip_transition then
		local fade_lights = {}
		for _, light in ipairs(self._fade_down_lights) do
			if light:multiplier() ~= 0 and template_data.lights and not table.contains(template_data.lights, light) then
				table.insert(fade_lights, light)
			end
		end
		for _, light in ipairs(self._active_lights) do
			table.insert(fade_lights, light)
		end
		self._fade_down_lights = fade_lights
		self._active_lights = {}
		if template_data.lights then
			for _, light in ipairs(template_data.lights) do
				light:set_enable(true)
				table.insert(self._active_lights, light)
			end
		end
	end
	managers.network.account:inventory_load()
end

function MenuSceneManager:get_deployables(var)
    local new_table = {}
    for _, deployable in pairs(tweak_data.equipments) do
        if deployable[var] then
            table.insert(new_table, deployable[var])
        end
    end
    
    return new_table
end
function MenuSceneManager.set_lobby_character_out_fit(self, i, outfit_string, rank)
    self:reset_character_deployables(self._lobby_characters[i])
    self.orig.set_lobby_character_out_fit(self, i, outfit_string, rank)
end

--[[function MenuSceneManager:set_lobby_character_visible(i, visible, no_state)
	local unit = self._lobby_characters[i]
	self._character_visibilities[unit:key()] = visible
	self:_chk_character_visibility(unit)
	if self._current_profile_slot == i then
		managers.menu_component:close_lobby_profile_gui()
		self._current_profile_slot = 0
	end
end]]--

function MenuSceneManager:set_character_deployable(deployable_id, unit, peer_id)
	unit = unit or self._character_unit
	if self._deployable_equipped[peer_id] then
		local tweak_data = tweak_data.equipments[self._deployable_equipped[peer_id]]
		local object_name = tweak_data.visual_object
		unit:get_object(Idstring(object_name)):set_visibility(false)
	end
    
    self:reset_character_deployables(unit)
    
	if deployable_id and deployable_id ~= "nil" then
		local tweak_data = tweak_data.equipments[deployable_id]
		local object_name = tweak_data.visual_object
		unit:get_object(Idstring(object_name)):set_visibility(self._characters_deployable_visible)
        self._deployable_equipped[peer_id] = deployable_id
	end
end

local deployables = MenuSceneManager:get_deployables("visual_object")
function MenuSceneManager:reset_character_deployables(unit)
    unit = unit or self._character_unit
    
    for _, deployable in pairs(deployables) do
        unit:get_object(Idstring(deployable)):set_visibility(false)
    end
end

function MenuSceneManager._select_character_pose(self, unit)
	unit = unit or self._character_unit
    
    if Poser.loaded_options.Menu.Pose_save then
        local SavedPose = Poser.poses[Poser.loaded_options.Menu.SavedPose]
        MenuCallbackHandler:poser_pose(nil, self, {Poser.loaded_options.Menu.SavedPose, SavedPose.weaptype}, unit, true)
        return
    end
    
    self.orig._select_character_pose(self, unit)
end

function MenuSceneManager:set_character_equipped_card(unit, card, IsPoser)
	unit = unit or self._character_unit
	local card_unit = World:spawn_unit(Idstring("units/menu/menu_scene/infamy_card"), Vector3(0, 0, 0), Rotation(0, 0, 0))
	card_unit:damage():run_sequence_simple("enable_card_" .. (card < 10 and "0" or "") .. tostring(math.min(card, 24)))
	unit:link(Idstring("a_weapon_left_front"), card_unit, card_unit:orientation_object():name())
	self:_delete_character_weapon(unit, "secondary")
	self._card_units = self._card_units or {}
	self._card_units[unit:key()] = card_unit
    if not IsPoser then
        self:_select_character_pose()
    end
end

function MenuSceneManager:_set_character_unit_pose(pose, unit, IsPoser)
    local new_pose = pose
    if Poser.loaded_options.Menu.Pose_save and IsPoser ~= true then
        new_pose = Poser.poses[tonumber(Poser.loaded_options.Menu.SavedPose)].name
    end
    
    local state = unit:play_redirect(Idstring("idle_menu"))
    unit:anim_state_machine():set_parameter(state, new_pose, 1)
    if self._character_unit == unit then
        self:add_one_frame_delayed_clbk(callback(self, self, "_character_unit_pose_updated"))
    end
    Poser.current_pose = new_pose
end

function MenuSceneManager._setup_gui(self)
    self.orig._setup_gui(self)
    
    self._character_grab:set_w(750)
    self._character_grab2:set_w(self._main_panel:w() * 0.8)
end

function MenuSceneManager._set_up_templates(self)
    self.orig._set_up_templates(self)

	local ref = self._bg_unit:get_object(Idstring("a_camera_reference"))
	local c_ref = self._bg_unit:get_object(Idstring("a_reference"))
	local target_pos = Vector3(0, 0, ref:position().z)
	local offset = Vector3(ref:position().x, ref:position().y, 0)
	self._scene_templates = self._scene_templates or {}
	self._scene_templates.standard = self._scene_templates.standard or {}
	self._scene_templates.standard.use_character_grab2 = true
	self._scene_templates.standard.use_character_grab = true
	self._scene_templates.standard.use_character_pan = true
	self._scene_templates.standard.character_visible = true
	self._scene_templates.standard.characters_deployable_visible = Poser.loaded_options.Menu.menu_deploy
	self._scene_templates.standard.complete_overkill_pack_safe_visible = true
	self._scene_templates.standard.camera_pos = ref:position()
	self._scene_templates.standard.target_pos = target_pos
	self._scene_templates.standard.character_rot = Poser.loaded_options.Menu.Save_yaw and Poser.loaded_options.Menu.SavedYaw or nil
	self._scene_templates.standard.character_pos = Poser.loaded_options.Menu.Position_save and Vector3(Poser.loaded_options.Menu.Position_x, Poser.loaded_options.Menu.Position_y, Poser.loaded_options.Menu.Position_z) or c_ref:position()
	
    local l_pos = self._scene_templates.standard.camera_pos
	local rot = Rotation(self._scene_templates.standard.target_pos - l_pos, math.UP)
	local l1_pos = l_pos + rot:x() * -200 + rot:y() * 200
	self._scene_templates.standard.lights = {
		self:_create_light({
			far_range = 400,
			color = Vector3(0.86, 0.37, 0.21) * 4,
			position = Vector3(80, 33, 20)
		}),
		self:_create_light({
			far_range = 180,
			color = Vector3(0.3, 0.5, 0.8) * 6,
			position = Vector3(-120, -6, 32),
			specular_multiplier = 8
		}),
		self:_create_light({
			far_range = 800,
			color = Vector3(1, 1, 1) * 0.35,
			position = Vector3(160, -250, -40),
			specular_multiplier = 0
		})
	}
    
	--[[self._scene_templates.blackmarket = {}
	self._scene_templates.blackmarket.fov = 20
	self._scene_templates.blackmarket.use_item_grab = true
	self._scene_templates.blackmarket.camera_pos = offset:rotate_with(Rotation(90))
	self._scene_templates.blackmarket.target_pos = Vector3(-100, -100, 0) + self._camera_start_rot:x() * 100 + self._camera_start_rot:y() * 6 + self._camera_start_rot:z() * 0
	self._scene_templates.blackmarket.lights = {}
    
	self._scene_templates.blackmarket_item = {}
	self._scene_templates.blackmarket_item.fov = 40
	self._scene_templates.blackmarket_item.can_change_fov = true
	self._scene_templates.blackmarket_item.use_item_grab = true
	self._scene_templates.blackmarket_item.camera_pos = offset:rotate_with(Rotation(45)) + Vector3(0, 0, 200)
	self._scene_templates.blackmarket_item.target_pos = target_pos + Vector3(0, 0, 200)
	self._scene_templates.blackmarket_item.character_pos = c_ref:position() + Vector3(0, 500, 0)
	local l_pos = self._scene_templates.blackmarket_item.camera_pos
	local rot = Rotation(self._scene_templates.blackmarket_item.target_pos - l_pos, math.UP)
	local l1_pos = l_pos + rot:x() * 50 + rot:y() * 50
	local l2_pos = l_pos + rot:x() * -50 + rot:y() * 100
	self._scene_templates.blackmarket_item.lights = {
		self:_create_light({
			far_range = 270,
			color = Vector3(0.86, 0.67, 0.31) * 3,
			position = Vector3(160, -130, 220),
			specular_multiplier = 155
		}),
		self:_create_light({
			far_range = 270,
			color = Vector3(0.86, 0.67, 0.41) * 2,
			position = Vector3(50, -150, 220),
			specular_multiplier = 155
		}),
		self:_create_light({
			far_range = 270,
			color = Vector3(0.86, 0.67, 0.41) * 2,
			position = Vector3(160, 0, 220),
			specular_multiplier = 155
		}),
		self:_create_light({
			far_range = 250,
			color = Vector3(0.5, 1.5, 2) * 2,
			position = Vector3(50, -100, 280),
			specular_multiplier = 55
		}),
		self:_create_light({
			far_range = 370,
			color = Vector3(1, 0.4, 0.04) * 1.5,
			position = Vector3(200, 60, 180),
			specular_multiplier = 55
		})
	}
	self._scene_templates.blackmarket_mask = {}
	self._scene_templates.blackmarket_mask.fov = 40
	self._scene_templates.blackmarket_mask.can_change_fov = true
	self._scene_templates.blackmarket_mask.use_item_grab = true
	self._scene_templates.blackmarket_mask.camera_pos = offset:rotate_with(Rotation(45)) + Vector3(0, 0, 200)
	self._scene_templates.blackmarket_mask.target_pos = target_pos + Vector3(0, 0, 200)
	self._scene_templates.blackmarket_mask.character_pos = c_ref:position() + Vector3(0, 500, 0)
    
	local l_pos = self._scene_templates.blackmarket_mask.camera_pos
	local rot = Rotation(self._scene_templates.blackmarket_mask.target_pos - l_pos, math.UP)
	local l1_pos = l_pos + rot:x() * 50 + rot:y() * 50
	local l2_pos = l_pos + rot:x() * -50 + rot:y() * 100
	self._scene_templates.blackmarket_mask.lights = {
		self:_create_light({
			far_range = 250,
			color = Vector3(0.2, 0.5, 1) * 4.3,
			position = Vector3(0, -200, 280),
			specular_multiplier = 55
		}),
		self:_create_light({
			far_range = 370,
			color = Vector3(1, 0.7, 0.5) * 2.3,
			position = Vector3(200, 60, 280),
			specular_multiplier = 55
		}),
		self:_create_light({
			far_range = 270,
			color = Vector3(1, 1, 1) * 0.8,
			position = Vector3(160, -130, 220),
			specular_multiplier = 0
		})
	}
    
	self._scene_templates.character_customization = {}
	self._scene_templates.character_customization.use_character_grab = true
	self._scene_templates.character_customization.camera_pos = Vector3(-73.1618, -168.021, -35.0786)
	self._scene_templates.character_customization.target_pos = Vector3(-73.1618, -168.021, -35.0786) + Vector3(0.31113, 0.944697, -0.103666) * 100
	self._scene_templates.character_customization.lights = {}
    
	self._scene_templates.play_online = {}
	self._scene_templates.play_online.camera_pos = offset:rotate_with(Rotation(90))
	self._scene_templates.play_online.target_pos = Vector3(-206.4, 56.0677, -135.539) + Vector3(-0.418134, 0.889918, 0.182234) * 100
	self._scene_templates.play_online.lights = {}
    
	self._scene_templates.options = {}
	self._scene_templates.options.use_character_grab = true
	self._scene_templates.options.camera_pos = Vector3(0, 60, -60)
	self._scene_templates.options.target_pos = self._camera_start_rot:y() * 100 + self._camera_start_rot:x() * -6 + self._camera_start_rot:z() * -60
	self._scene_templates.options.lights = {}]]--
    
	self._scene_templates.lobby = {}
	self._scene_templates.lobby.use_character_grab = false
	self._scene_templates.lobby.characters_deployable_visible = Poser.loaded_options.Menu.Deployables
	self._scene_templates.lobby.camera_pos = offset:rotate_with(Rotation(90))
	self._scene_templates.lobby.target_pos = target_pos
	self._scene_templates.lobby.character_pos = c_ref:position() + Vector3(0, 500, 0)
	self._scene_templates.lobby.lobby_characters_visible = true
	self._scene_templates.lobby.fov = 40
	self._scene_templates.lobby.lights = {
		self:_create_light({
			far_range = 300,
			color = Vector3(0.86, 0.57, 0.31) * 3,
			position = Vector3(56, 100, -10)
		}),
		self:_create_light({
			far_range = 3000,
			color = Vector3(1, 2.5, 4.5) * 3,
			position = Vector3(-1000, -300, 800),
			specular_multiplier = 6
		}),
		self:_create_light({
			far_range = 800,
			color = Vector3(1, 1, 1) * 0.35,
			position = Vector3(300, 100, 0),
			specular_multiplier = 0
		})
	}
    
	--[[self._scene_templates.lobby1 = {}
	self._scene_templates.lobby1.use_character_grab = false
	self._scene_templates.lobby1.lobby_characters_visible = true
	self._scene_templates.lobby1.camera_pos = Vector3(-90.5634, -157.226, -28.6729)
	self._scene_templates.lobby1.target_pos = Vector3(-90.5634, -157.226, -28.6729) + Vector3(-0.58315, 0.781811, 0.220697) * 100
	self._scene_templates.lobby1.fov = 30
	self._scene_templates.lobby1.lights = clone(self._scene_templates.lobby.lights)
    
	self._scene_templates.lobby2 = {}
	self._scene_templates.lobby2.use_character_grab = false
	self._scene_templates.lobby2.lobby_characters_visible = true
	self._scene_templates.lobby2.camera_pos = Vector3(-21.2779, -264.36, -56.7304)
	self._scene_templates.lobby2.target_pos = Vector3(-21.2779, -264.36, -56.7304) + Vector3(-0.633319, 0.758269, 0.154709) * 100
	self._scene_templates.lobby2.fov = 30
	self._scene_templates.lobby2.lights = clone(self._scene_templates.lobby.lights)
    
	self._scene_templates.lobby3 = {}
	self._scene_templates.lobby3.use_character_grab = false
	self._scene_templates.lobby3.lobby_characters_visible = true
	self._scene_templates.lobby3.camera_pos = Vector3(149.695, -363.069, -110.613)
	self._scene_templates.lobby3.target_pos = Vector3(149.695, -363.069, -110.613) + Vector3(-0.648856, 0.748553, 0.136579) * 100
	self._scene_templates.lobby3.fov = 30
	self._scene_templates.lobby3.lights = clone(self._scene_templates.lobby.lights)
    
	self._scene_templates.lobby4 = {}
	self._scene_templates.lobby4.use_character_grab = false
	self._scene_templates.lobby4.lobby_characters_visible = true
	self._scene_templates.lobby4.camera_pos = Vector3(210.949, -449.61, -126.709)
	self._scene_templates.lobby4.target_pos = Vector3(210.949, -449.61, -126.709) + Vector3(-0.668524, 0.734205, 0.118403) * 100
	self._scene_templates.lobby4.fov = 30
	self._scene_templates.lobby4.lights = clone(self._scene_templates.lobby.lights)]]--
    
	self._scene_templates.inventory = {}
	self._scene_templates.inventory.fov = 50
	self._scene_templates.inventory.can_change_fov = true
	self._scene_templates.inventory.change_fov_sensitivity = 3
	self._scene_templates.inventory.use_character_grab2 = true
	self._scene_templates.inventory.use_character_pan = true
	self._scene_templates.inventory.character_visible = true
	self._scene_templates.inventory.lobby_characters_visible = false
	self._scene_templates.inventory.hide_menu_logo = true
	self._scene_templates.inventory.characters_deployable_visible = Poser.loaded_options.Menu.menu_deploy
	self._scene_templates.inventory.camera_pos = ref:position()
	self._scene_templates.inventory.character_rot = Poser.loaded_options.Menu.Save_yaw and Poser.loaded_options.Menu.SavedYaw or nil
	self._scene_templates.inventory.target_pos = target_pos - self._camera_start_rot:x() * 40 - self._camera_start_rot:z() * 5
	--self._scene_templates.inventory.character_pos = c_ref:position()
	--self._scene_templates.inventory.remove_infamy_card = true
	if not managers.menu:is_pc_controller() then
	end
	local l_pos = self._scene_templates.inventory.camera_pos
	local rot = Rotation(self._scene_templates.inventory.target_pos - l_pos, math.UP)
	local l1_pos = l_pos + rot:x() * -200 + rot:y() * 200
	self._scene_templates.inventory.lights = {
		self:_create_light({
			far_range = 400,
			color = Vector3(0.86, 0.37, 0.21) * 4,
			position = Vector3(80, 33, 20)
		}),
		self:_create_light({
			far_range = 180,
			color = Vector3(0.3, 0.5, 0.8) * 6,
			position = Vector3(-120, -6, 32),
			specular_multiplier = 8
		}),
		self:_create_light({
			far_range = 800,
			color = Vector3(1, 1, 1) * 0.35,
			position = Vector3(160, -250, -40),
			specular_multiplier = 0
		})
	}
end

function MenuSceneManager.mouse_pressed(self, o, button, x, y)
    if button == Idstring("1") then
		local pos = self._workspace:screen_to_world(self._camera_object, Vector3(x, y, 0))
		local to = self._workspace:screen_to_world(self._camera_object, Vector3(x, y, 1000))
		local data = World:raycast("ray", pos, to, "slot_mask", 16)
		if data and data.unit then
			local slot
			for i, unit in ipairs(self._lobby_characters) do
				if unit == data.unit and unit:visible() then
					slot = i
				end
			end
			if slot then
				if self._current_profile_slot == slot then
					managers.menu_component:close_lobby_profile_gui()
					self._current_profile_slot = 0
				else
					local pos = data.unit:get_object(Idstring("Spine")):position()
					pos = self._workspace:world_to_screen(self._camera_object, pos)
					self._current_profile_slot = slot
				end
			end
		end
        if self._use_character_grab and self._character_grab:inside(x, y) then
			self._character_grabbed_x = true
			self._character_grabbed_current_x = x
			self._character_grabbed_current_y = y
			return true
		end
		if self._use_character_grab2 and self._character_grab2:inside(x, y) then
			self._character_grabbed_x = true
			self._character_grabbed_current_x = x
			self._character_grabbed_current_y = y
			return true
		end
	end
    
    return self.orig.mouse_pressed(self, o, button, x, y)
end

function MenuSceneManager.mouse_released(self, o, button, x, y)
	self.orig.mouse_released(self, o, button, x, y)
    if button == Idstring("1") then
		self._character_grabbed_x = false
	end
end

function MenuSceneManager:mouse_moved(o, x, y)
	if managers.menu_component:input_focus() == true or managers.menu_component:input_focus() == 1 then
		return false, "arrow"
	end
	if self._character_grabbed then
		self._character_yaw = self._character_yaw + (x - self._character_grabbed_current_x) / 4
		if self._use_character_pan and self._character_values and self._scene_templates and self._scene_templates[self._current_scene_template] then
			local new_z = mvector3.z(self._character_values.pos_target) - (y - self._character_grabbed_current_y) / 12
			local default_z = mvector3.z(self._scene_templates and self._scene_templates[self._current_scene_template].character_pos or self._character_values.pos_current)
			--new_z = math.clamp(new_z, default_z - 20, default_z + 10)
			mvector3.set_z(self._character_values.pos_target, new_z)
		end
        if Poser.loaded_options.Menu.Position_save then
            Poser.loaded_options.Menu.Position_x = self._character_values.pos_target.x
            Poser.loaded_options.Menu.Position_y = self._character_values.pos_target.y
            Poser.loaded_options.Menu.Position_z = self._character_values.pos_target.z
            Poser:Save()
        end
        
		self._character_unit:set_rotation(Rotation(self._character_yaw, self._character_pitch))
        if Poser.loaded_options.Menu.Save_yaw then
            Poser.loaded_options.Menu.SavedYaw = self._character_yaw
            self._scene_templates.inventory.character_rot = self._character_yaw
            self._scene_templates.standard.character_rot = self._character_yaw
            Poser:Save()
        end
		self._character_grabbed_current_x = x
		self._character_grabbed_current_y = y
		return true, "grab"
	elseif self._character_grabbed_x then
		if self._use_character_grab2 and self._character_values and self._scene_templates and self._scene_templates[self._current_scene_template] then
			local new_x = mvector3.x(self._character_values.pos_target) + (x - self._character_grabbed_current_x) / 12
			local default_x = mvector3.x(self._scene_templates and self._scene_templates[self._current_scene_template].character_pos or self._character_values.pos_current)
			--new_x = math.clamp(new_x, default_x - 20, default_x + 10)
			mvector3.set_x(self._character_values.pos_target, new_x)
            
            local new_y = mvector3.y(self._character_values.pos_target) - (y - self._character_grabbed_current_y) / 12
			local default_y = mvector3.y(self._scene_templates and self._scene_templates[self._current_scene_template].character_pos or self._character_values.pos_current)
			--new_y = math.clamp(new_y, default_y - 20, default_y + 10)
			mvector3.set_y(self._character_values.pos_target, new_y)
		end
        if Poser.loaded_options.Menu.Position_save then
            Poser.loaded_options.Menu.Position_x = self._character_values.pos_target.x
            Poser.loaded_options.Menu.Position_y = self._character_values.pos_target.y
            Poser.loaded_options.Menu.Position_z = self._character_values.pos_target.z
            Poser:Save()
        end
        
		self._character_grabbed_current_x = x
		self._character_grabbed_current_y = y
		return true, "grab"
    end
    
	if self._item_grabbed then
		if self._item_unit and alive(self._item_unit.unit) then
			local diff = (y - self._item_grabbed_current_y) / 4
			self._item_yaw = (self._item_yaw + (x - self._item_grabbed_current_x) / 4) % 360
			local yaw_sin = math.sin(self._item_yaw)
			local yaw_cos = math.cos(self._item_yaw)
			local treshhold = math.sin(45)
			if yaw_cos > -treshhold and yaw_cos < treshhold then
			else
				self._item_pitch = math.clamp(self._item_pitch + diff * yaw_cos, -30, 30)
			end
			if yaw_sin > -treshhold and yaw_sin < treshhold then
			else
				self._item_roll = math.clamp(self._item_roll - diff * yaw_sin, -30, 30)
			end
			mrotation.set_yaw_pitch_roll(self._item_rot_temp, self._item_yaw, self._item_pitch, self._item_roll)
			mrotation.set_zero(self._item_rot)
			mrotation.multiply(self._item_rot, self._camera_object:rotation())
			mrotation.multiply(self._item_rot, self._item_rot_temp)
			mrotation.multiply(self._item_rot, self._item_rot_mod)
			self._item_unit.unit:set_rotation(self._item_rot)
			local new_pos = self._item_rot_pos + self._item_offset:rotate_with(self._item_rot)
			self._item_unit.unit:set_position(new_pos)
			self._item_unit.unit:set_moving(2)
		end
		self._item_grabbed_current_x = x
		self._item_grabbed_current_y = y
		return true, "grab"
    elseif self._item_move_grabbed and self._item_unit and alive(self._item_unit.unit) then
		local diff_x = (x - self._item_move_grabbed_current_x) / 4
		local diff_y = (y - self._item_move_grabbed_current_y) / 4
		local move_v = Vector3(diff_x, 0, -diff_y):rotate_with(self._camera_object:rotation())
        mvector3.add(self._item_rot_pos, move_v)
		local new_pos = self._item_rot_pos + self._item_offset:rotate_with(self._item_rot)
		self._item_unit.unit:set_position(new_pos)
		self._item_unit.unit:set_moving(2)
		self._item_move_grabbed_current_x = x
		self._item_move_grabbed_current_y = y
		return true, "grab"
	end
	if self._use_item_grab and self._item_grab:inside(x, y) then
		return true, "hand"
	end
	if self._use_character_grab and self._character_grab:inside(x, y) then
		return true, "hand"
	end
	if self._use_character_grab2 and self._character_grab2:inside(x, y) then
		return true, "hand"
	end
end

function MenuSceneManager._set_up_environments(self)
    self.orig._set_up_environments(self)
	self._environments.standard.environment = "environments/pd2_cash/env_cash_02"
end

function MenuSceneManager:set_character_equipped_weapon(unit, factory_id, blueprint, type, cosmetics, poser, lobby)
    if not Poser:ShouldUpdateWeap(type) and not poser and not lobby then
        return
    end
    
	unit = unit or self._character_unit
	self:_delete_character_weapon(unit, type)
	if factory_id then
		local factory_weapon = tweak_data.weapon.factory[factory_id]
		local ids_unit_name = Idstring(factory_weapon.unit)
		self._weapon_units[unit:key()] = self._weapon_units[unit:key()] or {}
		self._weapon_units[unit:key()][type] = {
			unit = false,
			name = ids_unit_name,
			assembly_complete = false
		}
		local clbk = callback(self, self, "clbk_weapon_base_unit_loaded", {
			owner = unit,
			factory_id = factory_id,
			blueprint = blueprint,
            cosmetics = cosmetics,
			type = type,
            poser = poser
		})
		managers.dyn_resource:load(ids_unit, ids_unit_name, DynamicResourceManager.DYN_RESOURCES_PACKAGE, clbk)
	end
	self:_chk_character_visibility(unit)
end

local null_vector = Vector3()
local null_rotation = Rotation()
function MenuSceneManager:clbk_weapon_base_unit_loaded(params, status, asset_type, asset_name)
	local owner = params.owner
	if not alive(owner) then
		return
	end
	local owner_weapon_data = self._weapon_units[owner:key()]
	if not owner_weapon_data or not owner_weapon_data[params.type] or owner_weapon_data[params.type].unit or owner_weapon_data[params.type].name ~= asset_name then
		return
	end
	owner_weapon_data = owner_weapon_data[params.type]
	local weapon_unit = World:spawn_unit(asset_name, null_vector, self.null_rotation)
	owner_weapon_data.unit = weapon_unit
	weapon_unit:base():set_npc(true)
	weapon_unit:base():set_factory_data(params.factory_id)
    weapon_unit:base():set_cosmetics_data(params.cosmetics)
	if params.blueprint then
		weapon_unit:base():assemble_from_blueprint(params.factory_id, params.blueprint, nil, callback(self, self, "clbk_weapon_assembly_complete", params))
	else
		weapon_unit:base():assemble(params.factory_id)
	end
	local align_name = params.type == "primary" and Idstring("a_weapon_right_front") or Idstring("a_weapon_left_front")
	owner:link(align_name, weapon_unit, weapon_unit:orientation_object():name())
    
    if not params.poser and Poser.loaded_options.Menu.Weapon_update and not Poser.loaded_options.Menu.Pose_save and owner == self._character_unit then
        self:_select_character_pose()
    end
    
	self:_chk_character_visibility(owner)
end
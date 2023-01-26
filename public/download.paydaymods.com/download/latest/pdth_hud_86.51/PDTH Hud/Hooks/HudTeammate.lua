if pdth_hud.Options:GetValue("HUD/MainHud") then
    function HUDTeammate:init(i, teammates_panel, is_player, height)
        self._id = i
        local main_player = is_player
        self._main_player = main_player

        local const = pdth_hud.constants
        local scale = pdth_hud.Options:GetValue("HUD/Scale")

        local teammate_panel = teammates_panel:panel({
            visible = false,
            name = "" .. i,
            h = height
        })
        self._player_panel = teammate_panel:panel({name = "player"})
        self._panel = teammate_panel

        self.health_h = is_player and const.main_health_h or (teammate_panel:h() - (const.tm_health_gap * 2))
        self.health_w = self.health_h * ((not is_player and pdth_hud.Options:GetValue("HUD/OGTMHealth")) and const.og_health_ratio or const.health_ratio)

        local gradient
        if not main_player then
            gradient = teammate_panel:gradient({
                name = "gradient",
                w = const.tm_gradient_width,
                h = teammates_panel:h(),
                layer = 0,
                gradient_points = {
                    0,
                    Color(0.4, 0, 0, 0),
                    1,
                    Color(0, 0, 0, 0)
                }
            })
            gradient:set_bottom(teammate_panel:bottom())
        end

        local radial_health_panel = self._player_panel:panel({
            name = "radial_health_panel",
            layer = 11,
            w = self.health_w,
            h = self.health_h
        })
        radial_health_panel:set_bottom(self._player_panel:h())
        radial_health_panel:set_left(0)

        local character_icon
        if not main_player then
            radial_health_panel:set_center_y(self._player_panel:h() / 2)
            radial_health_panel:set_left(const.tm_health_gap)

            character_icon = self._player_panel:bitmap({
                name = "character_icon",
                texture = "guis/textures/pdth_hud/hud_icons",
                w = self.health_h,
                h = self.health_h,
                visible = pdth_hud.Options:GetValue("HUD/OGTMHealth"),
                layer = 1
            })
            character_icon:set_center_y(self._player_panel:center_y())
            character_icon:set_left(radial_health_panel:right() + const.tm_health_gap)
        end

        local radial_bg = radial_health_panel:bitmap({
            name = "radial_bg",
            texture = "guis/textures/pd2/masks",
            align = "bottom",
            blend_mode = "normal",
            w = radial_health_panel:w(),
            h = radial_health_panel:h(),
            layer = 0
        })

        local radial_health = radial_health_panel:bitmap({
            name = "radial_health",
            texture = "guis/textures/pd2/masks",
            blend_mode = "add",
            w = radial_health_panel:w(),
            h = radial_health_panel:h(),
            layer = 1
        })
        local radial_shield = radial_health_panel:bitmap({
            name = "radial_shield",
            texture = "guis/textures/pd2/masks",
            blend_mode = "add",
            w = radial_health_panel:w(),
            h = radial_health_panel:h(),
            layer = 3
        })
        local radial_absorb_shield_active = radial_health_panel:bitmap({
			name = "radial_absorb_shield_active",
			texture = "guis/textures/pd2/masks",
			blend_mode = "normal",
			alpha = 1,
			w = radial_health_panel:w(),
			h = radial_health_panel:h(),
			layer = 5
		})
		radial_absorb_shield_active:set_color(Color(1, 0, 0, 1))
		radial_absorb_shield_active:hide()

        local radial_absorb_health_active = radial_health_panel:bitmap({
			name = "radial_absorb_health_active",
			texture = "guis/textures/pd2/masks",
			blend_mode = "normal",
			alpha = 1,
			w = radial_health_panel:w(),
			h = radial_health_panel:h(),
			layer = 5
		})
		radial_absorb_health_active:set_color(Color(1, 0, 0, 1))
		radial_absorb_health_active:hide()
        radial_absorb_health_active:animate(callback(self, self, "animate_update_absorb_active"))

        local pnlPerk = self._player_panel:panel({
            name = "pnlPerk",
            visible = true,
            layer = 11
        })

        pnlPerk:set_w(radial_health_panel:w())
        pnlPerk:set_h(pnlPerk:w() / const.main_perk_multiplier)

        pnlPerk:set_bottom(radial_health_panel:top() - const.main_perk_health_gap)
        pnlPerk:set_left(radial_health_panel:left())

        local bmpPerkBackground = pnlPerk:bitmap({
            name = "bmpPerkBackground",
            visible = false,
            blend_mode = "normal",
            layer = 1,
            texture = "guis/textures/pdth_hud/hud_icons",
            texture_rect = {
                0,
                414,
                360,
                20
            },
            x = 0,
            y = 0,
            w = pnlPerk:w(),
            h = pnlPerk:h()
        })

        local bmpPerkBar = pnlPerk:bitmap({
            name = "bmpPerkBar",
            layer = 2,
            visible = false,
            blend_mode = "normal",
            color = Color.green,
            texture = "guis/textures/pdth_hud/hud_icons",
            texture_rect = {
                0,
                392,
                360,
                22
            }
        })

        bmpPerkBar:set_w(bmpPerkBackground:w() - const.main_perk_gap)
        bmpPerkBar:set_left(bmpPerkBackground:left() + const.main_perk_gap / 2)

        bmpPerkBar:set_h(bmpPerkBackground:h() - const.main_perk_gap)
        bmpPerkBar:set_top(bmpPerkBackground:top() + const.main_perk_gap / 2)

        if pdth_hud.Options:GetValue("HUD/portraits/Coloured") then
            radial_health:set_color(Color(0.5, 0.8, 0.4))
        end

        local talk_icon, talk_texture_rect = tweak_data.hud_icons:get_icon_data("mugshot_talk")
        local talk = teammate_panel:bitmap({
            name = "talk",
            texture = talk_icon,
            visible = false,
            layer = 14,
            texture_rect = talk_texture_rect,
            w = talk_texture_rect[3] * scale,
            h = talk_texture_rect[4] * scale
        })
        if main_player or not pdth_hud.Options:GetValue("HUD/OGTMHealth") then
            talk:set_righttop(radial_health_panel:right() + (5), radial_health_panel:top() - (5))
        else
            talk:set_righttop(character_icon:right(), character_icon:top())
        end

        local name = teammate_panel:text({
            name = "name",
            text = "R",
            layer = 1,
            color = Color.white,
            y = 0,
            vertical = "bottom",
            font_size = tweak_data.hud_players.name_size * scale,
            font = tweak_data.menu.small_font
        })
        local name_bg = teammate_panel:bitmap({name = "name_bg", visible = false, w = 0, h = 0})
        local callsign = teammate_panel:bitmap({name = "callsign", visible = false, w = 0, h = 0})

        if main_player then
            name:set_visible(false)
        else
            name:set_font_size(const.tm_name_font_size)
            managers.hud:make_fine_text(name)
            name:set_left((pdth_hud.Options:GetValue("HUD/OGTMHealth") and character_icon:right() or radial_health_panel:right() ) + const.tm_name_gap)
            name:set_top(character_icon:top())
        end

        local radial_custom = radial_health_panel:bitmap({
            name = "radial_custom",
            texture = "guis/textures/pdth_hud/hud_swansong",
            visible = false,
            blend_mode = "add",
            w = radial_health_panel:w(),
            h = radial_health_panel:h(),
            layer = 3
        })

        local radial_ability = radial_health_panel:bitmap({
            name = "radial_ability",
            texture = "guis/textures/pdth_hud/hud_fearless",
            visible = false,
            blend_mode = "add",
            w = radial_health_panel:w(),
            h = radial_health_panel:h(),
            layer = 4
        })

        local character_text
        if main_player then
            character_text = radial_health_panel:text({
                name = "character_text",
                visible = true,
                text = "",
                layer = 5,
                color = Color.white,
                blend_mode = "normal",
                font_size = const.main_character_font_size,
                font = tweak_data.menu.small_font
            })
        end

        local condition_icon = teammate_panel:bitmap({
            name = "condition_icon",
            layer = 12,
            visible = false,
            color = Color.white,
            blend_mode = "normal"
        })
        if main_player or not pdth_hud.Options:GetValue("HUD/OGTMHealth") then
            condition_icon:set_w(radial_health_panel:w())
            condition_icon:set_h(radial_health_panel:h() / 2)
        else
            condition_icon:set_w(character_icon:w() / const.tm_condition_demultiplier)
            condition_icon:set_h(character_icon:h() / const.tm_condition_demultiplier)
        end

        condition_icon:set_center_x((main_player or not pdth_hud.Options:GetValue("HUD/OGTMHealth")) and radial_health_panel:center_x() or character_icon:center_x())
        condition_icon:set_center_y((main_player or not pdth_hud.Options:GetValue("HUD/OGTMHealth")) and radial_health_panel:center_y() or character_icon:center_y())

        local condition_timer = teammate_panel:text({
            name = "condition_timer",
            visible = false,
            text = "000",
            layer = 13,
            color = Color.white,
            blend_mode = "normal",
            font_size = const.tm_condition_font_size,
            font = tweak_data.hud_players.timer_font
        })
        managers.hud:make_fine_text(condition_timer)
        condition_timer:set_center(condition_icon:center())

        local weapons_panel = self._player_panel:panel({
            name = "weapons_panel",
            layer = 11,
        })
        self:add_special_equipment({
            id = "secondary_weapon",
            icon = "",
            amount = 400,
            no_flash = true,
            weapon = true
        })

        self:add_special_equipment({
            id = "primary_weapon",
            icon = "",
            amount = 400,
            no_flash = true,
            weapon = true
        })

        self:add_special_equipment({
            id = "melee_weapon",
            icon = "",
            amount = 1,
            no_flash = true,
            weapon = true
        })

        if self._main_player then
            self._primary_weapon_ammo = HUDAmmo:new(self._player_panel, "primary")
            self._secondary_weapon_ammo = HUDAmmo:new(self._player_panel, "secondary")
            self:recreate_weapon_firemode()
        end

        local tabs_texture = "guis/textures/pd2/hud_tabs"

        local bag_rect = {32, 33, 32, 31}

        local carry_panel = self._player_panel:panel({
            name = "carry_panel",
            visible = false,
            layer = 1,
            w = name:h(),
            h = name:h(),
        })

        local carry_bitmap = carry_panel:bitmap({
            name = "bag",
            texture = tabs_texture,
            w = carry_panel:w(),
            h = carry_panel:h(),
            texture_rect = bag_rect,
            visible = true,
            layer = 0,
            color = Color.white,
        })

        local interact_panel = self._player_panel:panel({
            name = "interact_panel",
            visible = false,
            layer = 14,
            w = (main_player or not pdth_hud.Options:GetValue("HUD/OGTMHealth")) and radial_health_panel:h() or character_icon:h(),
            h = (main_player or not pdth_hud.Options:GetValue("HUD/OGTMHealth")) and radial_health_panel:h() or character_icon:h()
        })

        interact_panel:set_center_x((main_player or not pdth_hud.Options:GetValue("HUD/OGTMHealth")) and radial_health_panel:center_x() or character_icon:center_x())
        interact_panel:set_center_y((main_player or not pdth_hud.Options:GetValue("HUD/OGTMHealth")) and radial_health_panel:center_y() or character_icon:center_y())

        self._interact = CircleBitmapGuiObject:new(interact_panel, {
            use_bg = true,
            rotation = 360,
            radius = interact_panel:h() / 2,
            blend_mode = "add",
            color = Color.white,
            layer = 0
        })

        self.health_amount = 1
        self.armor_amount = 1
        self._current_primary = nil
        self._current_secondary = nil
        self._current_melee = nil
        self:RefreshPortraits()
        self:set_info_meter({
            current = 0,
            total = 0,
            max = 1
        })
    end

    function HUDTeammate:_create_weapon_firemode(weap_details, i)
        local weapon_tweak_data = tweak_data.weapon[weap_details.weapon_id]
        local fire_mode = weapon_tweak_data.FIRE_MODE
        local can_toggle_firemode = weapon_tweak_data.CAN_TOGGLE_FIREMODE
        local locked_to_auto = managers.weapon_factory:has_perk("fire_mode_auto", weap_details.factory_id, weap_details.blueprint)
        local locked_to_single = managers.weapon_factory:has_perk("fire_mode_single", weap_details.factory_id, weap_details.blueprint)
        if locked_to_single or not locked_to_auto and fire_mode == "single" then
            self:set_weapon_firemode(i, "single")
        else
            self:set_weapon_firemode(i, "auto")
        end
    end

    function HUDTeammate:_create_primary_weapon_firemode()
        if self._main_player then
            if not self._current_primary or not self._current_secondary or not self._current_melee then
                self:get_weapon_info()
            end

            local equipped_primary = managers.blackmarket:equipped_primary()
            self:_create_weapon_firemode(equipped_primary, 2)
        end
    end

    function HUDTeammate:_create_secondary_weapon_firemode()
        if self._main_player then
            if not self._current_primary or not self._current_secondary or not self._current_melee then
                self:get_weapon_info()
            end

            local equipped_secondary = managers.blackmarket:equipped_secondary()
            self:_create_weapon_firemode(equipped_secondary, 1)
        end
    end

    function HUDTeammate:set_weapon_firemode_burst(id, firemode, burst_fire)
        local weap_panel = id == 1 and self._secondary_weapon_ammo or self._primary_weapon_ammo
        if weap_panel then
            weap_panel:set_firemode_burst(firemode, burst_fire)
        end
    end

    function HUDTeammate:_set_weapon_selected(id, hud_icon)
        self._selected_weapon = id

        local is_secondary = id == 1
        local primary_weapon_panel = self._player_panel:child("primary_weapon")
        local secondary_weapon_panel = self._player_panel:child("secondary_weapon")
        primary_weapon_panel:child("bitmap"):set_alpha(is_secondary and 0.5 or 1)
        secondary_weapon_panel:child("bitmap"):set_alpha(is_secondary and 1 or 0.5)

        if self._main_player then
            primary_weapon_panel:child("amount"):set_visible(is_secondary)
            secondary_weapon_panel:child("amount"):set_visible(not is_secondary)
            self._primary_weapon_ammo:set_visible(not is_secondary)
            self._secondary_weapon_ammo:set_visible(is_secondary)
        end

        if not self._current_primary or not self._current_secondary or not self._current_melee then
            self:get_weapon_info()
        end
    end

    function HUDTeammate:set_weapon_firemode(id, firemode)
        local weap_panel = id == 1 and self._secondary_weapon_ammo or self._primary_weapon_ammo
        if weap_panel then
            weap_panel:set_firemode(firemode)
        end
    end

    function HUDTeammate:set_ammo_amount_by_type(type, max_clip, current_clip, current_left, max, force)
        local const = pdth_hud.constants
        local scale = pdth_hud.Options:GetValue("HUD/Scale")
        local ammoAmount = self._main_player and pdth_hud.Options:GetValue("HUD/spooky_ammo") and current_left + current_clip or current_left

        self:set_special_equipment_amount(type .. "_weapon", ammoAmount)

        if self._main_player then
            local weapon_panel = type == "primary" and self._primary_weapon_ammo or self._secondary_weapon_ammo

            weapon_panel:set_ammo(max_clip, current_clip, current_left, max, force)
        end
    end

    function HUDTeammate:refresh_ammo_icons()
        for _, weapon_panel in pairs({self._primary_weapon_ammo, self._secondary_weapon_ammo}) do
            weapon_panel:refresh()
        end
    end

    function HUDTeammate:set_health(data)
        self._health_data = data

        local amount = data.current / data.total
        if amount < self.health_amount then
            self:_damage_taken()
        end

        --local color = amount < 0.33 and pdth_hud.constants.health_main_colour_damaged or pdth_hud.constants.health_main_colour
        self.health_amount = amount

        self:RefreshPortraits()
    end

    function HUDTeammate:set_armor(data)
        self._armor_data = data

        local amount = data.current / data.total
        if amount < self.armor_amount then
            self:_damage_taken()
        end

        self.armor_amount = amount

        self:RefreshPortraits()
    end

    function HUDTeammate:set_custom_radial(data)
        local teammate_panel = self._panel:child("player")
        local radial_health_panel = teammate_panel:child("radial_health_panel")
        local radial_custom = radial_health_panel:child("radial_custom")
        local radial_bg = radial_health_panel:child("radial_bg")

        local amount = data.current / data.total
        local y_offset = 130 * (1 - amount)
        local h_offset = self.health_h * (1 - amount)
        radial_custom:set_texture_rect(0, y_offset, 64, 130 - y_offset)
        radial_custom:set_h(self.health_h - h_offset)
        radial_custom:set_bottom(radial_bg:bottom())
        radial_custom:show()
        if amount <= 0 then
            radial_custom:hide()
        end
    end

    function HUDTeammate:_damage_taken()
        local teammate_panel = self._panel:child("player")
        local radial_health_panel = teammate_panel:child("radial_health_panel")
        local damage_indicator = radial_health_panel:child("damage_indicator")
        local player = managers.player:player_unit()
        if not self._main_player and not managers.trade:is_peer_in_custody(self._peer_id) and not self._ai then
            local gradient = self._panel:child("gradient")
            gradient:animate(callback(self, self, "mugshot_damage_taken"))
        end
    end

    function HUDTeammate:mugshot_damage_taken(gradient)
        local a1 = 0.4
        local a2 = 0.0
        gradient:set_gradient_points({
            0,
            Color(a1, 1, 0 ,0),
            1,
            Color(a2, 1, 0 ,0)
        })
        local i = 1.0
        local t = i
        while t > 0 do
            local dt = coroutine.yield()
            t = t - dt
            gradient:set_gradient_points({
                0,
                Color(a1, (t / i), 0 ,0),
                1,
                Color(a2, (t / i), 0 ,0)
            })
        end
        gradient:set_gradient_points({
            0,
            Color(a1, 0, 0 ,0),
            1,
            Color(a2, 0, 0 ,0)
        })
    end

    function HUDTeammate:_animate_damage_taken(damage_indicator)
        damage_indicator:set_alpha(1)
        local st = 3
        local t = st
        local st_red_t = 0.5
        local red_t = st_red_t
        while t > 0 do
            local dt = coroutine.yield()
            t = t - dt
            red_t = math.clamp(red_t - dt, 0, 1)
            damage_indicator:set_color(Color(1, red_t / st_red_t, red_t / st_red_t))
            damage_indicator:set_alpha(t / st)
        end
        damage_indicator:set_alpha(0)
    end

    function HUDTeammate:check_cable_ties(data)
        if not data then
            return false
        end

        if not self._player_panel:child("cable_ties_panel") then
            if data.amount > 0 then
                self:add_special_equipment({
                    id = "cable_ties_panel",
                    icon = tweak_data.equipments.specials.cable_tie.icon,
                    amount = data.amount,
                    no_flash = true
                })
            else
                return false
            end
        end

        return true
    end

    function HUDTeammate:set_cable_tie(data)
        if not self:check_cable_ties(data) then
            return
        end

        --self:set_special_equipment_image("cable_ties_panel", "equipment_cable_ties")
        self:set_cable_ties_amount(data.amount)
    end

    function HUDTeammate:set_cable_ties_amount(amount)
        if not self:check_cable_ties({amount = amount}) then
            return
        end
        self:set_special_equipment_amount("cable_ties_panel", amount)
    end

    function HUDTeammate:_set_amount_string(text, amount)
        if not PlayerBase.USE_GRENADES then
            text:set_text(tostring(amount))
            return
        end
        local zero = self._main_player and amount < 10 and "0" or ""
        text:set_text(zero .. amount)
        text:set_range_color(0, string.len(zero), Color.white:with_alpha(0.5))
    end

    function HUDTeammate:add_panel()
        local teammate_panel = self._panel
        teammate_panel:set_visible(true)
        self:set_condition("mugshot_normal")

        if not self._main_player then
            self:clear_special_equipment()
        end

        for i, special in pairs(self._special_equipment) do
            if special.weapon then
                special.panel:set_visible(true)
            end
        end

        self:teammate_progress(false, false, false, false)
        self:_set_weapon_selected(self._selected_weapon or 1)
        self:RefreshPortraits()
    end

    function HUDTeammate:remove_panel()
        local teammate_panel = self._panel
        teammate_panel:set_visible(false)

        if not self._main_player then
            self:clear_special_equipment()
        end

        for i, special in pairs(self._special_equipment) do
            if special.weapon then
                special.panel:set_visible(false)
            end
        end
        self:set_condition("mugshot_normal")
        self._player_panel:child("carry_panel"):set_visible(false)
        self:set_cheater(false)
        self:stop_timer()
        self:teammate_progress(false, false, false, false)
        self._peer_id = nil
        self._ai = nil
        self._character = nil
        self._current_primary = nil
        self._current_secondary = nil
        self._current_melee = nil
    end

    function HUDTeammate:set_name(teammate_name)
        local const = pdth_hud.constants
        local teammate_panel = self._panel
        local name = teammate_panel:child("name")
        local radial_health_panel = self._player_panel:child("radial_health_panel")
        local carry_panel = self._player_panel:child("carry_panel")
        local character_icon = self._player_panel:child("character_icon")
        self._teammate_name = teammate_name
        name:set_text(utf8.to_upper(teammate_name))
        managers.hud:make_fine_text(name)
        if not self._main_player then
            name:set_left((pdth_hud.Options:GetValue("HUD/OGTMHealth") and character_icon:right() or radial_health_panel:right() ) + const.tm_name_gap)
            name:set_top(character_icon:top())
            self._character = nil
        end
        carry_panel:set_left(name:right())
        carry_panel:set_top(name:top())

        if not self._ai then
            self:get_weapon_info()
        end
        self:RefreshPortraits()
    end

    function HUDTeammate:get_weapon_info()
        local peer, blackmarket_outfit
        if managers.network:session() then
            peer = managers.network:session():peer(self._peer_id)

            if peer and peer._profile["outfit_string"] then
                blackmarket_outfit = peer:blackmarket_outfit()
            elseif not self._main_player then
                return
            end
        elseif not self._main_player then
            return
        end

        local prim_weapon_id = self._main_player and managers.blackmarket:equipped_primary().weapon_id or managers.weapon_factory:get_weapon_id_by_factory_id(blackmarket_outfit.primary.factory_id)
        local prim_category = tweak_data.weapon[prim_weapon_id].category
        local prim_sub_category = tweak_data.weapon[prim_weapon_id].sub_category

        local sec_weapon_id = self._main_player and managers.blackmarket:equipped_secondary().weapon_id or managers.weapon_factory:get_weapon_id_by_factory_id(blackmarket_outfit.secondary.factory_id)
        local sec_category = tweak_data.weapon[sec_weapon_id].category
        local sec_sub_category = tweak_data.weapon[sec_weapon_id].sub_category

        local melee_id = self._main_player and managers.blackmarket:equipped_melee_weapon() or blackmarket_outfit.melee_weapon

        local update_icons = false
        if not self._current_primary or self._current_primary.id ~= prim_weapon_id or not self._current_secondary or self._current_secondary.id ~= sec_weapon_id or not self._current_melee or self._current_melee.id ~= melee_id then
            update_icons = true
        end

        self._current_primary = {id = prim_weapon_id, category = prim_category, sub_category = prim_sub_category}
        self._current_secondary = {id = sec_weapon_id, category = sec_category, sub_category = sec_sub_category}
        self._current_melee = {id = melee_id, category = "melee"}

        if self._main_player then
            self._primary_weapon_ammo:set_weapon_details(self._current_primary)
            self._secondary_weapon_ammo:set_weapon_details(self._current_secondary)
        end

        if update_icons then
            self:update_weapon_icons()
        end
    end

    function HUDTeammate:update_weapon_icons()
        if not self._current_primary or not self._current_secondary or not self._current_melee then
            self:get_weapon_info()
            return
        end

        self:set_special_equipment_image("primary_weapon", self._current_primary.id, self._current_primary.category, self._current_primary.sub_category)
        self:set_special_equipment_image("secondary_weapon", self._current_secondary.id, self._current_secondary.category, self._current_secondary.sub_category)
        self:set_special_equipment_image("melee_weapon", self._current_melee.id, self._current_melee.category, "melee")
    end

    function HUDTeammate:refresh_ammo()
        self._current_primary:refresh()
        self._current_secondary:refresh()
    end

    function HUDTeammate:set_callsign(id) end

    function HUDTeammate:set_state(state)
        local const = pdth_hud.constants
        local teammate_panel = self._panel
        local is_player = state == "player"
        local radial_health_panel = self._panel:child("player"):child("radial_health_panel")
        local name = teammate_panel:child("name")
        local carry_panel = self._player_panel:child("carry_panel")
        local character_icon = self._player_panel:child("character_icon")
        if not self._main_player then
            local gradient = self._panel:child("gradient")
            managers.hud:make_fine_text(name)
            name:set_left((pdth_hud.Options:GetValue("HUD/OGTMHealth") and character_icon:right() or radial_health_panel:right() ) + const.tm_name_gap)
            name:set_top(character_icon:top())
            carry_panel:set_left(name:right())
            carry_panel:set_top(name:top())
            if is_player then
                for i, special in pairs(self._special_equipment) do
                    special.panel:set_visible(true)
                end
                radial_health_panel:set_visible(true)
            else
                for i, special in pairs(self._special_equipment) do
                    if special.weapon then
                        special.panel:set_visible(false)
                    else
                        self:remove_special_equipment(special.panel:name())
                    end
                end
                radial_health_panel:set_visible(not pdth_hud.Options:GetValue("HUD/OGTMHealth"))

                self.health_amount = 1
                self.armour_amount = 1
            end
            self._character = nil
            self:RefreshPortraits()
        end
    end

    function HUDTeammate:check_deployable_equipment(data)
        if not data then
            return false
        end

        if not self._player_panel:child("deployable_equipment_panel") then
            if data.amount > 0 then
                self:add_special_equipment({
                    id = "deployable_equipment_panel",
                    icon = self._deployable_icon or "equipment_doctor_bag",
                    amount = data.amount,
                    no_flash = true,
                    show_single_amount = true
                })
            else
                return false
            end
        end

        return true
    end

    function HUDTeammate:set_deployable_equipment(data)
        if not self:check_deployable_equipment(data) then
            return
        end
        self._deployable_icon = data.icon
        self:set_special_equipment_image("deployable_equipment_panel", data.icon)
        self:set_deployable_equipment_amount(1, data)
    end

    function HUDTeammate:is_deployable_equipment_visible(data)
        local visible = false
        for i, amount in pairs(data.amount) do
            if amount > 0 then
                visible = true
            end
        end

        if not self._player_panel:child("deployable_equipment_panel") and visible then
            self:add_special_equipment({
                id = "deployable_equipment_panel",
                icon = "equipment_doctor_bag",
                amount = data.amount_str,
                no_flash = true,
                show_single_amount = true
            })
        end

        return visible
    end

    function HUDTeammate:set_deployable_equipment_from_string(data)
        if not self:is_deployable_equipment_visible(data) then
            self:set_special_equipment_amount("deployable_equipment_panel", data.amount_str)
            return
        end

        self._deployable_icon = data.icon
        self:set_special_equipment_image("deployable_equipment_panel", data.icon)
        self:set_deployable_equipment_amount_from_string(1, data)
    end

    function HUDTeammate:set_deployable_equipment_amount_from_string(index, data)
        if not self:is_deployable_equipment_visible(data) then
            self:remove_special_equipment("deployable_equipment_panel")
            return
        end

        self:set_special_equipment_amount("deployable_equipment_panel", data.amount_str)
    end

    function HUDTeammate:set_deployable_equipment_amount(index, data)
        if self:check_deployable_equipment(data) then
            self:set_special_equipment_amount("deployable_equipment_panel", data.amount)
        end
    end

    function HUDTeammate:check_grenade(data)
        if not data then
            return false
        end

        if not self._player_panel:child("grenades_panel") then
            if data.amount > 0 then
                self:add_special_equipment({
                    id = "grenades_panel",
                    icon = self._grenade_icon or "",
                    amount = data.amount,
                    no_flash = true,
                    show_single_amount = true
                })
            else
                return false
            end
        end
        return true
    end

    function HUDTeammate:set_grenades(data)
        if not self:check_grenade(data) then
            return
        end

        self:set_grenades_amount(data)
        self._grenade_icon = data.icon
        self:set_special_equipment_image("grenades_panel", data.icon)
    end

    function HUDTeammate:set_grenades_amount(data, ignore_checks)
        if not self:check_grenade(data) then
            return
        end

        self:set_special_equipment_amount("grenades_panel", data.amount, ignore_checks)
    end

    function HUDTeammate:set_ability_cooldown(data)
    	if not PlayerBase.USE_GRENADES then
    		return
    	end
    	data.cooldown = data.cooldown and math.ceil(data.cooldown) or 0
        self:set_grenades_amount({amount = data.cooldown}, true)
    end

    local icon_conversion = {
        pd2_c4 = "equipment_c4",
        pd2_generic_saw = "equipment_saw"
    }

    function HUDTeammate:add_special_equipment(data)
        -- id, icon, amount, no_flash
        local const = pdth_hud.constants
        local teammate_panel = self._player_panel
        self._special_equipment = self._special_equipment or {}
        self._weapons = self._weapons or {}
        local special_equipment = self._special_equipment
        local id = data.id

        local teammate_height = 16
        local name = self._panel:child("name")
        if not self._main_player then
            teammate_height = self._player_panel:child("radial_health_panel"):h() - name:h() + (const.tm_equipment_inflation * pdth_hud.Options:GetValue("HUD/Scale"))
        end

        local w = (self._main_player and const.main_equipment_size or teammate_height)
        local h = (self._main_player and const.main_equipment_size or teammate_height)

        local equipment_panel = teammate_panel:panel({
            name = id,
            layer = 0,
            w = w,
            h = h
        })

        if icon_conversion[data.icon] then
            data.icon = icon_conversion[data.icon]
        end

        local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)

        local bitmap = equipment_panel:bitmap({
            name = "bitmap",
            texture = icon,
            layer = 1,
            texture_rect = texture_rect,
            w = w,
            h = h
        })

        if data.amount then
            local amount = equipment_panel:text({
                name = "amount",
                text = tostring(data.amount),
                font = tweak_data.menu.small_font,
                font_size = (self._main_player and const.main_equipment_font_size or const.tm_equipment_font_size),
                color = Color.white,
                layer = 4,
            })
            managers.hud:make_fine_text(amount)
            if type(data.amount) == "number" then
                amount:set_visible(data.amount > 1)
            end

            local amx, amy, amw, amh = amount:text_rect()
            equipment_panel:set_w(w + (data.num_on_right and amw + const.num_on_right_inflation or 0))

            amount:set_right(equipment_panel:w())

            if data.num_on_right then
                amount:set_center_y(equipment_panel:center_y())
            else
                amount:set_bottom(equipment_panel:bottom())
            end
        end

        local panelData = {panel = equipment_panel, weapon = data.weapon, num_on_right = data.num_on_right, icon_data = {data.icon}}

        if self._main_player and data.weapon then
            table.insert(self._weapons, panelData)
        else
            table.insert(special_equipment, panelData)
        end

        if not data.no_flash then
            bitmap:animate(callback(self, self, "equipment_flash_icon"))
        end

        self:layout_special_equipments()
    end

    function HUDTeammate:clear_special_equipment()
        local teammate_panel = self._player_panel
        for i, special in ipairs(self._special_equipment) do
            local panel = special.panel
            if not special.weapon then
                teammate_panel:remove(panel)
                table.remove(self._special_equipment, i)
            end
        end
        self:layout_special_equipments()
    end

    function HUDTeammate:remove_special_equipment(equipment)
        local teammate_panel = self._player_panel
        for i, special in ipairs(self._special_equipment) do
            local panel = special.panel
            if panel:name() == equipment then
                teammate_panel:remove(panel)
                table.remove(self._special_equipment, i)
                self:layout_special_equipments()
                return
            end
        end

        --[[for i, weap in ipairs(self._weapons) do
            local panel = weap.panel
            if panel:name() == equipment then
                teammate_panel:remove(panel)
                table.remove(self._weapons, i)
                self:layout_special_equipments()
                return
            end
        end]]--
    end

    function HUDTeammate:equipment_flash_icon(o)
        local t = 4
        while t > 0 do
            local dt = coroutine.yield()
            t = t - dt
            o:set_color( tweak_data.hud.prime_color:with_alpha( 0.5 + (math.sin( Application:time() * 750) + 1) / 4 ))
        end

        o:set_color(Color.white)
    end

    function HUDTeammate:set_special_equipment_amount(equipment_id, amount, ignore_checks)
        if not amount then return end

        local const = pdth_hud.constants
        local teammate_panel = self._player_panel
        local special_equipment = self._special_equipment

        local function apply_setting(i, special)
            local panel = special.panel
            local txtAmount = panel:child("amount")
            txtAmount:set_text(tostring(amount))
            managers.hud:make_fine_text(txtAmount)
            local _, _, amw, _ = txtAmount:text_rect()
            --panel:set_w(panel:child("bitmap"):w() + (special.num_on_right and amw + const.num_on_right_inflation or 0))
            txtAmount:set_right(panel:w())
            if not special.weapon and type(amount) == "number" then
                if not special.show_single_amount then
                    txtAmount:set_visible(amount > 1)
                end
                if amount < 1 and not ignore_checks then
                    self:remove_special_equipment(equipment_id)
                end
            else
                txtAmount:set_visible(true)
            end
        end

        for i, special in ipairs(special_equipment) do
            if special.panel and special.panel:name() == equipment_id then
                apply_setting(i, special)
                return
            end
        end

        for i, weap in ipairs(self._weapons) do
            if weap.panel and weap.panel:name() == equipment_id then
                apply_setting(i, weap)
                return
            end
        end

        self:layout_special_equipments()
    end

    function HUDTeammate:set_special_equipment_image(equipment_id, ...)
        --pcall to try and actually get some error logs for errors
        local success, err = pcall(function(...)
            for i, special in ipairs(self._special_equipment) do
            local panel = special.panel
            if panel and panel:name() == equipment_id then
                special.icon_data = {...}
                local image, texture_rect
                if special.weapon then
                    image, texture_rect = pdth_hud.textures:get_weapon_texture(...)
                else
                    image, texture_rect = tweak_data.hud_icons:get_icon_data(...)
                end
                panel:child("bitmap"):set_image(image, unpack(texture_rect))
                return
            end
        end

        for i, special in ipairs(self._weapons) do
            local panel = special.panel
            if panel and panel:name() == equipment_id then
                special.icon_data = {...}
                local image, texture_rect = pdth_hud.textures:get_weapon_texture(...)
                panel:child("bitmap"):set_image(image, unpack(texture_rect))
                return
            end
        end
        end, ...)
        if not success then
            log(tostring(err))
        end
    end

    function HUDTeammate:layout_special_equipments()
        local const = pdth_hud.constants
        local teammate_panel = self._player_panel
        local special_equipment = self._special_equipment
        local name = self._panel:child("name")
        local radial_health_panel = self._player_panel:child("radial_health_panel")
        local character_icon = self._player_panel:child("character_icon")

        local main_player_right = teammate_panel:right() - (const.main_equipment_size / 2)

        local main_player_bottom = teammate_panel:bottom() - (const.main_equipment_size * const.main_equipment_y_offset_multiplier)

        local gap = const.equipment_gap
        for i, special in ipairs(special_equipment) do
            local panel = special.panel
            if self._main_player and panel then
                panel:set_right(main_player_right)
                panel:set_bottom(self._special_equipment[i - 1] and self._special_equipment[i - 1].panel:top() or main_player_bottom)
            elseif panel then
                panel:set_left(special_equipment[i - 1] and special_equipment[i - 1].panel and (special_equipment[i - 1].panel:right() + gap) or (pdth_hud.Options:GetValue("HUD/OGTMHealth") and character_icon:right() or radial_health_panel:right()) + gap)
                panel:set_bottom(character_icon:bottom() + 2)
            end
        end

        if self._main_player then
            for i, weap in ipairs(self._weapons) do
                local panel = weap.panel
                panel:set_right((main_player_right - const.main_equipment_size) - (panel:w() * (#self._weapons - i)))
                panel:set_top(main_player_bottom)
            end
        end
    end

    function HUDTeammate:refresh_special_equipment()
        for i, special in ipairs(self._special_equipment) do
            local panel = special.panel
            local image, texture_rect = tweak_data.hud_icons:get_icon_data(unpack(special.icon_data))
            panel:child("bitmap"):set_image(image, unpack(texture_rect))
        end

        for i, special in ipairs(self._weapons) do
            local panel = special.panel
            local image, texture_rect = pdth_hud.textures:get_weapon_texture(unpack(special.icon_data))
            panel:child("bitmap"):set_image(image, unpack(texture_rect))
        end
    end

    function HUDTeammate:set_condition(icon_data, text)
        local condition_icon = self._panel:child("condition_icon")
        local name = self._panel:child("name")
        if icon_data == "mugshot_normal" then
            condition_icon:set_visible(false)
        else
            condition_icon:set_visible(true)
            local icon, texture_rect = tweak_data.hud_icons:get_icon_data(icon_data)
            condition_icon:set_image(icon, texture_rect[1], texture_rect[2], texture_rect[3], texture_rect[4])
        end
    end

    function HUDTeammate:teammate_progress(enabled, tweak_data_id, timer, success)
        local character_icon = self._player_panel:child("character_icon")
        if character_icon and pdth_hud.Options:GetValue("HUD/OGTMHealth") then
            character_icon:set_alpha(enabled and 0.5 or 1)
        else
            self._player_panel:child("radial_health_panel"):set_alpha(enabled and 0.5 or 1)
        end
        self._player_panel:child("interact_panel"):stop()
        self._player_panel:child("interact_panel"):set_visible(enabled)
        if enabled then
            self._player_panel:child("interact_panel"):animate(callback(HUDManager, HUDManager, "_animate_label_interact"), self._interact, timer)
        elseif success then
            local panel = self._player_panel
            local bitmap = panel:bitmap({
                rotation = 360,
                texture = "guis/textures/pd2/hud_progress_active",
                blend_mode = "add",
                align = "center",
                valign = "center",
                layer = 2,
                visible = false
            })
            bitmap:set_size(self._interact:size())
            bitmap:set_position(self._player_panel:child("interact_panel"):x(), self._player_panel:child("interact_panel"):y())
            local radius = self._interact:radius()
            local circle = CircleBitmapGuiObject:new(panel, {
                rotation = 360,
                radius = radius * pdth_hud.Options:GetValue("HUD/Scale"),
                color = Color.white:with_alpha(1),
                blend_mode = "normal",
                layer = 3
            })
            circle:set_position(bitmap:position())
            bitmap:animate(callback(HUDInteraction, HUDInteraction, "_animate_interaction_complete"), circle)
        end
    end

    function HUDTeammate:start_timer(time)
        local const = pdth_hud.constants
        self._timer_paused = 0
        self._timer = time
        self._panel:child("condition_timer"):set_color(Color.white)
        self._panel:child("condition_timer"):stop()
        self._panel:child("condition_timer"):set_visible(true)
        self._panel:child("condition_timer"):set_font_size(const.tm_condition_font_size)
        self._panel:child("condition_timer"):animate(callback(self, self, "_animate_timer"))
    end

    function HUDTeammate:_animate_timer()
        local rounded_timer = math.round(self._timer)
        while self._timer >= 0 do
            local dt = coroutine.yield()
            if self._timer_paused == 0 then
                self._timer = self._timer - dt
                local text = self._timer < 0 and "00" or (math.round(self._timer) < 10 and "0" or "") .. math.round(self._timer)
                self._panel:child("condition_timer"):set_text(text)
                managers.hud:make_fine_text(self._panel:child("condition_timer"))
                if pdth_hud.Options:GetValue("HUD/OGTMHealth") then
                    self._panel:child("condition_timer"):set_center(self._player_panel:child("character_icon"):center())
                else
                    self._panel:child("condition_timer"):set_center(self._player_panel:child("radial_health_panel"):center())
                end
                if rounded_timer > math.round(self._timer) then
                    rounded_timer = math.round(self._timer)
                    if rounded_timer < 11 then
                        self._panel:child("condition_timer"):animate(callback(self, self, "_animate_timer_flash"))
                    end
                end
            end
        end
    end

    function HUDTeammate:_animate_timer_flash()
        local const = pdth_hud.constants
        local t = 0
        local condition_timer = self._panel:child("condition_timer")
        while t < 0.5 do
            t = t + coroutine.yield()
            local n = 1 - math.sin(t * 180)
            local r = math.lerp(1 or self._point_of_no_return_color.r, 1, n)
            local g = math.lerp(0 or self._point_of_no_return_color.g, 0.8, n)
            local b = math.lerp(0 or self._point_of_no_return_color.b, 0.2, n)
            condition_timer:set_color(Color(r, g, b))
            condition_timer:set_font_size(math.lerp(const.tm_condition_font_size, const.tm_condition_font_size_flash, n))
            if pdth_hud.Options:GetValue("HUD/OGTMHealth") then
                condition_timer:set_center(self._player_panel:child("character_icon"):center())
            else
                condition_timer:set_center(self._player_panel:child("radial_health_panel"):center())
            end
        end
        condition_timer:set_font_size(const.tm_condition_font_size)
    end

    function HUDTeammate:set_carry_info(carry_id, value)
        local carry_panel = self._player_panel:child("carry_panel")
        carry_panel:set_visible(true)
        log(tostring(value))
        local value_text = carry_panel:child("value")
    end

    function HUDTeammate:get_character_name()
        if self._main_player then
            self._character = managers.network:session():local_peer():character()
        elseif self._ai then
            self._character = managers.criminals:character_name_by_panel_id(self._id)
        else
            self._character = managers.criminals:character_name_by_peer_id(self._peer_id)
        end
    end

    function HUDTeammate:RefreshPortraits()
        local const = pdth_hud.constants
        local radial_health_panel = self._player_panel:child("radial_health_panel")
        local radial_health = radial_health_panel:child("radial_health")
        local radial_bg = radial_health_panel:child("radial_bg")
        local radial_shield = radial_health_panel:child("radial_shield")
        local character_text = radial_health_panel:child("character_text")
        local character_icon = self._player_panel:child("character_icon")

        local prev_char = self._character
        if not self._character then
            self:get_character_name()
        end

        if not self._character then
            return
        end

        if prev_char ~= self._character then
            if self._main_player then
                local character_name = string.upper(managers.localization:text("menu_" .. self._character))
                character_text:set_text(character_name)
                managers.hud:make_fine_text(character_text)
                character_text:set_center_x(radial_health_panel:center_x())
                character_text:set_bottom(radial_health_panel:h() - const.main_character_y_offset)
            end
        end

        local height = self.health_h
        if not self._ai or not pdth_hud.Options:GetValue("HUD/OGTMHealth") then
            local texture, rect = pdth_hud.textures:get_portrait_texture(self._character, "health", self._main_player)
            if texture then
                local y_offset = rect[4] * (1 - self.health_amount)
                local h_offset = self.health_h * (1 - self.health_amount)

                radial_health:set_color(self._ai and Color.white or pdth_hud.utils:GetPortraitColour(self.health_amount))

                radial_health:set_image(texture, rect[1], rect[2] + y_offset, rect[3], rect[4] - y_offset)
                radial_health:set_h(height - h_offset)
                radial_health:set_bottom(radial_bg:bottom())
            end

            texture, rect = pdth_hud.textures:get_portrait_texture(self._character, "armor", self._main_player)
            if texture then
                local y_offset = rect[4] * (1 - self.armor_amount)
                local h_offset = self.health_h * (1 - self.armor_amount)
                radial_shield:set_image(texture, rect[1], rect[2] + y_offset, rect[3], rect[4] - y_offset)
                radial_shield:set_h(height - h_offset)
                radial_shield:set_bottom(radial_bg:bottom())
            end
        end

        texture, rect = pdth_hud.textures:get_portrait_texture(self._character, "bg", self._main_player)
        if texture then
            radial_bg:set_image(texture, unpack(rect))
        end

        if pdth_hud.Options:GetValue("HUD/OGTMHealth") and not self._main_player then
            local texture, rect = pdth_hud.textures:get_portrait_texture(self._character, "tm")
            if texture then
                character_icon:set_image(texture, unpack(rect))
            end
        end

        radial_health_panel:set_visible(not self._ai or not pdth_hud.Options:GetValue("HUD/OGTMHealth"))
        radial_bg:set_visible(not self._ai)
        radial_shield:set_visible(not self._ai)
        radial_health:set_blend_mode(self._ai and "normal" or "add")
    end

    function HUDTeammate:set_stored_health_max(stored_health_ratio)
        local pnlPerk = self._player_panel:child("pnlPerk")
        local bmpPerkBackground = pnlPerk:child("bmpPerkBackground")
        local bmpPerkBar = pnlPerk:child("bmpPerkBar")

        if alive(bmpPerkBackground) then
            local red = math.min(stored_health_ratio, 1)
            bmpPerkBackground:set_visible(red > 0)
            bmpPerkBackground:set_color(Color(1, red, 1, 1))
        end
    end

    function HUDTeammate:_animate_update_absorb(o, radial_absorb_shield_name, radial_absorb_health_name, var_name, blink)
        repeat
            coroutine.yield()
        until alive(self._panel) and self[var_name] and self._armor_data and self._health_data

        self:get_character_name()

        local texture, rect = pdth_hud.textures:get_portrait_texture(self._character, "health", self._main_player)

        local textureA, rectA = pdth_hud.textures:get_portrait_texture(self._character, "armor", self._main_player)

        local teammate_panel = self._panel:child("player")
        local radial_health_panel = teammate_panel:child("radial_health_panel")
        local radial_shield = radial_health_panel:child("radial_shield")
        local radial_health = radial_health_panel:child("radial_health")
        local radial_bg = radial_health_panel:child("radial_bg")
        local radial_absorb_shield = radial_health_panel:child(radial_absorb_shield_name)
        local radial_absorb_health = radial_health_panel:child(radial_absorb_health_name)
        local radial_shield_rot = radial_shield:color().r
        local radial_health_rot = radial_health:color().r

        local height = self.health_h

        local current_absorb = 0
        local current_shield, current_health
        local step_speed = 1
        local lerp_speed = 1
        local dt, update_absorb
        local t = 0
        while alive(teammate_panel) do
            dt = coroutine.yield()
            if self[var_name] and self._armor_data and self._health_data then
                update_absorb = false

                current_shield = self._armor_data.current
                current_health = self._health_data.current

                if self.armor_amount ~= radial_shield_rot or self.health_amount ~= radial_health_rot then
                    radial_shield_rot = self.armor_amount
                    radial_health_rot = self.health_amount
                    update_absorb = true
                end

                if current_absorb ~= self[var_name] then
                    current_absorb = math.lerp(current_absorb, self[var_name], lerp_speed * dt)
                    current_absorb = math.step(current_absorb, self[var_name], step_speed * dt)
                    update_absorb = true
                end

                if blink then
                    t = (t + dt * 0.5) % 1
                    radial_absorb_shield:set_alpha(math.abs(math.sin(t * 180)) * 0.25 + 0.75)
                    radial_absorb_health:set_alpha(math.abs(math.sin(t * 180)) * 0.25 + 0.75)
                end

                if update_absorb and current_absorb > 0 then
                    local shield_ratio = current_shield == 0 and 0 or math.min(current_absorb / current_shield, 1)
                    local health_ratio = current_health == 0 and 0 or math.min((current_absorb - shield_ratio * current_shield) / current_health, 1)
                    local shield = math.clamp(shield_ratio * radial_shield_rot, 0, 1)
                    local health = math.clamp(health_ratio * radial_health_rot, 0, 1)

                    if shield ~= 0 then
                        local y_offsetA = (1 - shield) * rectA[4]
                        local h_offsetA = (1 - shield) * height
                        --log("A: " .. h_offsetA)
                        radial_absorb_shield:set_image(textureA, rectA[1], rectA[2] + y_offsetA, rectA[3], rectA[4] - y_offsetA)
                        radial_absorb_shield:set_h(height - h_offsetA)
                        radial_absorb_shield:set_bottom(radial_bg:bottom())
                    end

                    if health ~= 0 then
                        local y_offsetH = (1 - health) * rect[4]
                        local h_offsetH = (1 - health) * height
                        --log("H:" .. h_offsetH)
                        radial_absorb_health:set_image(texture, rect[1], rect[2] + y_offsetH, rect[3], rect[4] - y_offsetH)
                        radial_absorb_health:set_h(height - h_offsetH)
                        radial_absorb_health:set_bottom(radial_bg:bottom())
                    end

                    radial_absorb_shield:set_visible(shield > 0)
                    radial_absorb_health:set_visible(health > 0)
                end
            end
        end
    end

    function HUDTeammate:set_stored_health(stored_health_ratio)
        local const = pdth_hud.constants
        local pnlPerk = self._player_panel:child("pnlPerk")
        local bmpPerkBackground = pnlPerk:child("bmpPerkBackground")
        local bmpPerkBar = pnlPerk:child("bmpPerkBar")

        if alive(bmpPerkBar) then
            local red = math.min(stored_health_ratio, 1)
            bmpPerkBar:set_visible(red > 0)
            bmpPerkBar:set_w((pnlPerk:w() - const.main_perk_gap) * red)
            --bmpPerkBackground:set_w(pnlPerk:w() * red)
        end
    end

    function HUDTeammate:set_info_meter(data)
        local const = pdth_hud.constants

        local pnlPerk = self._player_panel:child("pnlPerk")
        local bmpPerkBackground = pnlPerk:child("bmpPerkBackground")
        local bmpPerkBar = pnlPerk:child("bmpPerkBar")

        local red = math.clamp(data.total / data.max, 0, 1)
        bmpPerkBackground:set_color(Color(1, red, 1, 1))
        bmpPerkBackground:set_visible(red > 0)

        local red = math.clamp(data.current / data.max, 0, 1)
        bmpPerkBar:set_w((pnlPerk:w() - const.main_perk_gap) * red)
        bmpPerkBar:stop()
        bmpPerkBar:animate(function(o)
            local s = bmpPerkBar:color().r
            local e = red
            over(0.2, function(p)
                local c = math.lerp(s, e, p)
                bmpPerkBar:set_color(Color(1, c, 1, 1))
                bmpPerkBar:set_visible(c > 0)
            end)
        end)
    end

    function HUDTeammate:set_custom_radial(data)
        local teammate_panel = self._panel:child("player")
        local radial_health_panel = teammate_panel:child("radial_health_panel")
        local radial_custom = radial_health_panel:child("radial_custom")
        local radial_bg = radial_health_panel:child("radial_bg")

        local amount = data.current / data.total
        local y_offset = 130 * (1 - amount)
        local h_offset = self.health_h * (1 - amount)
        radial_custom:set_texture_rect(0, y_offset, 64, 130 - y_offset)
        radial_custom:set_h(self.health_h - h_offset)
        radial_custom:set_bottom(radial_bg:bottom())
        radial_custom:show()
        if amount <= 0 then
            radial_custom:hide()
        end
    end

    function HUDTeammate:set_ability_radial(data)
        local teammate_panel = self._panel:child("player")
        local radial_health_panel = teammate_panel:child("radial_health_panel")
        local radial_ability = radial_health_panel:child("radial_ability")
        local radial_bg = radial_health_panel:child("radial_bg")

        local amount = data.current / data.total
        local y_offset = 130 * (1 - amount)
        local h_offset = self.health_h * (1 - amount)
        radial_ability:set_texture_rect(0, y_offset, 64, 130 - y_offset)
        radial_ability:set_h(self.health_h - h_offset)
        radial_ability:set_bottom(radial_bg:bottom())
        radial_ability:set_visible(amount > 0)
    end

    function HUDTeammate:activate_ability_radial(time)
    	local teammate_panel = self._panel:child("player")
    	local radial_health_panel = teammate_panel:child("radial_health_panel")
    	local radial_ability = radial_health_panel:child("radial_ability")
        local radial_bg = radial_health_panel:child("radial_bg")
    	local function anim(o)
    		radial_ability:set_visible(true)
    		over(time, function(p)
    			local amount = math.lerp(1, 0, p)
                local y_offset = 130 * (1 - amount)
                local h_offset = self.health_h * (1 - amount)
                radial_ability:set_texture_rect(0, y_offset, 64, 130 - y_offset)
                radial_ability:set_h(self.health_h - h_offset)
                radial_ability:set_bottom(radial_bg:bottom())
    		end)
    		radial_ability:set_visible(false)
    	end
    	radial_ability:animate(anim)
    end
end

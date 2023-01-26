if pdth_hud.Options:GetValue("HUD/MainHud") then
    function HUDManager:set_player_gear_visibility(panel_id, visible)
        if self._teammate_panels[panel_id] and self._teammate_panels[panel_id]:panel() and self._teammate_panels[panel_id]:panel():child("player") then
            local tm = self._teammate_panels[panel_id]
            local player_panel = tm:panel():child("player")
            if player_panel:child("primary_weapon") then
                player_panel:child("primary_weapon"):set_visible(visible)
            end

            if player_panel:child("secondary_weapon") then
                player_panel:child("secondary_weapon"):set_visible(visible)
            end

            if player_panel:child("deployable_equipment_panel") then
                player_panel:child("deployable_equipment_panel"):set_visible(visible)
            end

            if player_panel:child("cable_ties_panel") then
                player_panel:child("cable_ties_panel"):set_visible(visible)
            end

            if player_panel:child("grenades_panel") then
                player_panel:child("grenades_panel"):set_visible(visible)
            end
            if tm._primary_weapon_ammo then
                tm._primary_weapon_ammo._panel:set_visible(visible)
            end

            if tm._secondary_weapon_ammo then
                tm._secondary_weapon_ammo._panel:set_visible(visible)
            end
        end
    end

    function HUDManager:hide_player_gear(panel_id)
        self:set_player_gear_visibility(panel_id, false)
    end
    function HUDManager:show_player_gear(panel_id)
        self:set_player_gear_visibility(panel_id, true)
    end

    function HUDManager:_create_teammates_panel(hud)
        local const = pdth_hud.constants

        hud = hud or managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
        self._hud.teammate_panels_data = self._hud.teammate_panels_data or {}
        self._teammate_panels = {}

        if hud.panel:child("teammates_panel") then
            hud.panel:remove(hud.panel:child("teammates_panel"))
        end

        local teammates_panel = hud.panel:panel({
            name = "teammates_panel"
        })

        local teammate_h = (const.main_health_h - (const.tm_gap * 2)) / const.teammates_beside_main_health_count
        for i = 1, HUDManager.PLAYER_PANEL do
            local is_player = i == HUDManager.PLAYER_PANEL
            --[[self._hud.teammate_panels_data[i] = {
                taken = true,
                special_equipments = {}
            }]]--
            self._hud.teammate_panels_data[i] = { taken = false, special_equipments = {} }

            local teammate = HUDTeammate:new(i, teammates_panel, is_player, is_player and hud.panel:h() or teammate_h)

            if is_player then
                teammate._panel:set_x(0)
                teammate._panel:set_bottom(hud.panel:bottom())
            else
                teammate._panel:set_x((const.main_health_h * const.health_ratio) + const.tm_gap)
                teammate._panel:set_bottom(hud.panel:bottom() - (i - 1) * (teammate._panel:h() + const.tm_gap))
            end

            self._teammate_panels[i] = teammate

            if is_player then
                teammate:add_panel()
            end
        end
    end
end

function HUDManager:GetCategoryFromWeaponCategory(cat)
    local weapon, category, factoryid, weaponid
    if cat == "primary" then
		weapon = managers.blackmarket:equipped_primary()
		factoryid = weapon.factory_id
		weaponid = weapon.weapon_id or managers.weapon_factory:get_weapon_id_by_factory_id(factoryid)
		category = tweak_data.weapon[weaponid].category
	else
		weapon = managers.blackmarket:equipped_secondary()
		factoryid = weapon.factory_id
		weaponid = weapon.weapon_id or managers.weapon_factory:get_weapon_id_by_factory_id(factoryid)
		category = tweak_data.weapon[weaponid].category
	end

    return category
end

function HUDManager:set_teammate_ammo_amount(id, selection_index, max_clip, current_clip, current_left, max, force)
	local typ = selection_index == 1 and "secondary" or "primary"
	local send_real = false

	if id == HUDManager.PLAYER_PANEL and pdth_hud.Options:GetValue("HUD/spooky_ammo") then
		if self:GetCategoryFromWeaponCategory(typ) ~= "saw" then
			send_real = true
		end
	end
	local left_ammo_value = (current_left - max_clip) + (max_clip - current_clip)
	self._teammate_panels[id]:set_ammo_amount_by_type(typ, max_clip, current_clip, send_real and left_ammo_value or current_left, max, force)
end

local HUDManagerset_teammate_custom_radial = HUDManager.set_teammate_custom_radial

function HUDManager:set_teammate_custom_radial(i, data)
	local hud = managers.hud:script( PlayerBase.PLAYER_INFO_HUD_FULLSCREEN_PD2)
	if pdth_hud.Options:GetValue("HUD/Swansong") and i == HUDManager.PLAYER_PANEL then
        local swan_song_left = hud.panel:child("swan_song_left")
		if not swan_song_left then
			swan_song_left = hud.panel:bitmap({
				name = "swan_song_left",
				visible = false,
				texture = "guis/textures/pdth_hud/swansong_effect",
				layer = 0,
				color = Color(0, 0.7, 1),
				blend_mode = "add",
				w = hud.panel:w(),
				h = hud.panel:h(),
			})
		end
		if data.current < data.total and data.current > 0 and swan_song_left then
			swan_song_left:set_visible(true)
			local hudinfo = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
			swan_song_left:animate(hudinfo.flash_icon, 4000000000)
		else
			swan_song_left:stop()
			swan_song_left:set_visible(false)
		end
		if swan_song_left and data.current == 0 then
			swan_song_left:set_visible(false)
		end
	else
        local swan_song_left = hud.panel:child("swan_song_left")
		if swan_song_left then
			swan_song_left:stop()
			swan_song_left:set_visible(false)
		end
	end

    HUDManagerset_teammate_custom_radial(self, i, data)
end

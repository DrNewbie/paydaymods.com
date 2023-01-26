PDTHHudCoreCallbacks = PDTHHudCoreCallbacks or class()

function PDTHHudCoreCallbacks:init(parent)
    self._parent = parent
end

function PDTHHudCoreCallbacks:ScaleConverter(option, value)
    return value * self._parent.Options:GetValue("HUD/Scale")
end

function PDTHHudCoreCallbacks:ColourGradingChanged(key, value)
    if not managers.job:current_level_id() or pdth_hud.Options:GetValue("Gradings/" .. managers.job:current_level_id()) == 1 then
        local colour_grading = pdth_hud.Options:GetValue("Grading", true)
        if not table.contains(pdth_hud.definitions.colour_gradings, colour_grading) then
            pdth_hud:log("[ERROR] Colour grading for heist, %s is invalid! (%s). Defaulting to PAYDAY+", managers.job:current_level_id(), colour_grading)
            colour_grading = pdth_hud.definitions.colour_gradings[1]
        end
        managers.environment_controller:set_default_color_grading(colour_grading)
        managers.environment_controller:refresh_render_settings()
    end
end

function PDTHHudCoreCallbacks:HeistColourGradingChanged(key, value)
    if managers.job:current_level_id() == table.remove(string.split(key, "/")) then
        local colour_grading = value == 1 and pdth_hud.Options:GetValue("Grading", true) or pdth_hud.Options:GetValue(key, true)
        if not table.contains(pdth_hud.definitions.colour_gradings, colour_grading) then
            pdth_hud:log("[ERROR] Colour grading for heist, %s is invalid! (%s). Defaulting to PAYDAY+", managers.job:current_level_id(), colour_grading)
            colour_grading = pdth_hud.definitions.colour_gradings[1]
        end
        managers.environment_controller:set_default_color_grading(colour_grading)
        managers.environment_controller:refresh_render_settings()
    end
end

function PDTHHudCoreCallbacks:PortraitStyleChanged(key, value)
    self:PortraitSelectionChanged(key, value)
    if managers.menu_component._portrait_gui then
        managers.menu_component._portrait_gui:refresh()
    end
end

function PDTHHudCoreCallbacks:BulletStyleChanged(key, value)
    if managers.player and managers.hud and pdth_hud.Options:GetValue("HUD/MainHud") then
        local player = managers.player:local_player()
        if player then
            local inventory = player:inventory()
            if inventory then
                managers.hud._teammate_panels[HUDManager.PLAYER_PANEL]:refresh_ammo_icons()
            end
        end
    end
end

function PDTHHudCoreCallbacks:WeaponIconStyleChanged(key, value)
    pdth_hud.textures:apply_tweak_data_icons()
    if managers.hud and pdth_hud.Options:GetValue("HUD/MainHud") then
        for i = 1, HUDManager.PLAYER_PANEL do
            local tm = managers.hud._teammate_panels[i]
            if not tm._ai then
                tm:refresh_special_equipment()
            end
        end
    end
end

function PDTHHudCoreCallbacks:PortraitSelectionChanged(key, value)
    if managers.hud and pdth_hud.Options:GetValue("HUD/MainHud") then
        for i = 1, HUDManager.PLAYER_PANEL do
            local tm = managers.hud._teammate_panels[i]
            tm:RefreshPortraits()
        end
    end
end

function PDTHHudCoreCallbacks:HeistGradingChanged(key, value)
    if managers.job:current_level_id() == key then
        managers.environment_controller:set_default_color_grading(pdth_hud.Options:GetValue(key, true))
        managers.environment_controller:refresh_render_settings()
    end
end

function PDTHHudCoreCallbacks:UseEquipment()
    if LuaNetworking:IsHost() and Network:multiplayer() and not Global.game_settings.single_player then
        return false
    end

	return pdth_hud.Options:GetValue("Equipment")
end

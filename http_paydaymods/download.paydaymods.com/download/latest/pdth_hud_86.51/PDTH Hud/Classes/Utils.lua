PDTHHudCoreUtils = PDTHHudCoreUtils or class()

function PDTHHudCoreUtils:GetPortraitColour(health_amount)
    health_amount = health_amount or 1
    local colour = pdth_hud.constants.health_main_colour

    if pdth_hud.Options:GetValue("HUD/portraits/Coloured") then
        if pdth_hud.Options:GetValue("HUD/portraits/GradualColour") then
            if health_amount < pdth_hud.constants.health_gradient_start_point then
                local dmg = pdth_hud.constants.health_main_colour_damaged
                local ratio = 1 - (health_amount / pdth_hud.constants.health_gradient_start_point)
                colour = Color(math.lerp(colour.r, dmg.r, ratio), math.lerp(colour.g, dmg.g, ratio), math.lerp(colour.b, dmg.b, ratio))
            end
        else
            if health_amount <= pdth_hud.constants.health_damage_start_point then
                colour = pdth_hud.constants.health_main_colour_damaged
            end
        end
    else
        colour = Color.white
    end

    return colour
end

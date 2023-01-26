--[[Hooks:Add("BeardLibCreateScriptDataMods", "PDTHHudCallBeardLibSequenceFuncs", function()
    if BeardLib.ScriptData then
        for name, mod_data in pairs(pdth_hud.PDTHEquipment) do
            BeardLib.ScriptData.Sequence:CreateMod(mod_data)
        end
    end
end)

Hooks:Add("LocalizationManagerPostInit", "PDTH_Localization", function(loc)
    local portrait_localization_tbl = {}
    for i = 1, #pdth_hud.portrait_options do
        portrait_localization_tbl["portrait_value_" .. i] = i
    end
    LocalizationManager:add_localized_strings(portrait_localization_tbl)
end)

Hooks:Add("StatisticsManagerKilledByAnyone", "PDTHHudStatisticsManagerKilledByAnyone", function( self, data )
    local by_explosion = data.variant == "explosion"
    local name_id = data.weapon_unit and data.weapon_unit:base() and data.weapon_unit:base():get_name_id()
    if by_explosion and data.name == "patrol" and name_id ~= "m79" then
        self._patrol_bombed = self._patrol_bombed and self._patrol_bombed + 1 or 1
        if self._patrol_bombed >= 12 and Global.level_data.level_id == "diamond_heist" then
            managers.challenges:set_flag( "bomb_man" )
        end
    end
end)]]--

Hooks:Add("BetterLightFXCreateEvents", "PDTHHudCreateBLFXEvents", function(blfx)
    if blfx then
        blfx:RegisterEvent("AssaultIndicator", {
            priority = 20,
            loop = true,
            color = Color(1, 1, 0, 0),
            options = {
                {parameter = "enabled", typ = "bool", localization = "Enabled"},
            },
            run = function(self, ...)
                 BetterLightFX:SetColor(self.color.red, self.color.green, self.color.blue, self.color.alpha, self.name)
                 coroutine.yield()
                 self._ran_once = true
            end
        }, true)

        blfx:RegisterEvent("Interaction", {
            priority = 35,
            loop = true,
            blend = true,
            _color = Color(1, 1, 0.65882355, 0),
            _use_custom_color = false,
            _custom_color = Color(1, 1, 0.65882355, 0),
            _progress = 0,
            options = {
                {parameter = "enabled", typ = "bool", localization = "Enabled"},
                {parameter = "_use_custom_color", typ = "bool", localization = "Use Custom Color"},
                {parameter = "_custom_color", typ = "color", localization = "Custom Color"},
            },
            run = function(self, ...)
                if self._use_custom_color then
                    BetterLightFX:SetColor(self._custom_color.red, self._custom_color.green, self._custom_color.blue, self._progress, self.name)
                else
                    BetterLightFX:SetColor(self._color.red, self._color.green, self._color.blue, self._progress, self.name)
                end

                 self._ran_once = true
            end
        }, true)
    end
end)

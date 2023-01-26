if Setup then
    Hooks:PostHook(Setup, "init_managers", "pdth_hud_define_challenges", function(ply)
        tweak_data.challenges = ChallengesTweakData:new()
        managers.challenges = ChallengesManager:new()
    end)
end
if HUDAssaultCorner then
    Hooks:PostHook(HUDAssaultCorner, "_start_assault", "pdth_hud_hide_suspicion", function(ply)
        if managers.hud and alive(managers.hud._hud_suspicion._suspicion_panel) then
            managers.hud._hud_suspicion._suspicion_panel:set_visible(false)
        end
    end)
end
if MenuSetup then
    Hooks:PostHook(MenuSetup, "init_managers", "pdth_hud_define_challenges_menu", function(ply)
        tweak_data.challenges = ChallengesTweakData:new()
        managers.challenges = ChallengesManager:new()
    end)
end
if CriminalsManager then
    Hooks:PostHook(CriminalsManager, "add_character", "pdth_hud_ai_portrait", function(ply)
        if pdth_hud.Options:GetValue("HUD/MainHud") and managers.hud then
            for i = 1, HUDManager.PLAYER_PANEL do
                managers.hud._teammate_panels[i]:RefreshPortraits()
            end
        end
    end)
end
if MenuManager then
    Hooks:PostHook(MenuManager, "do_clear_progress", "pdth_hud_reset_challenges", function(ply)
        managers.challenges:reset_challenges()
    end)
end
local override_environments = {
    "standard"
}

if MenuSceneManager then
    Hooks:PostHook(MenuSceneManager, "_set_up_environments", "PDTHHudApplyMenuCGrade", function(self)
        for i, data in pairs(override_environments) do
            self._environments[data].color_grading = pdth_hud.Options:GetValue("Grading", true)
        end
    end)
end
if IngameAccessCamera then
    Hooks:PostHook(IngameAccessCamera, "at_enter", "PDTHHudApplyCameraGrade", function(self)
        if not pdth_hud.Options:GetValue("HUD/CameraGrading") then
            managers.environment_controller:set_default_color_grading(self._saved_default_color_grading)
            managers.environment_controller:refresh_render_settings()
        end
    end)
end

if HUDChat then
    Hooks:PostHook(HUDChat, "_layout_output_panel", "PDTHHudReposChat", function(self)
        if pdth_hud.Options:GetValue("HUD/MainHud") and self._hud_panel then
            if BigLobbyGlobals then
                local const = pdth_hud.constants
                self._panel:set_right(self._hud_panel:right())
                self._panel:set_top(self._hud_panel:top() - self._panel:child("output_panel"):top())
            else
                self._panel:set_bottom(self._hud_panel:h() - pdth_hud.constants.main_health_h)
            end
        end
    end)
end

if BlackMarketManager then
    Hooks:PostHook(BlackMarketManager, "save", "PDTHHudSaveChallenges", function(self, data)
        managers.challenges:save(data)
    end)
    Hooks:PostHook(BlackMarketManager, "load", "PDTHHudLoadChallenges", function(self, data)
        managers.challenges:load(data)
    end)
end

if SecurityCamera then
    Hooks:PostHook(SecurityCamera, "generate_cooldown", "PDTHHudDestroyedCamera", function(self, amount)
        if pdth_hud.Options:GetValue("HUD/Cameras") then
            if managers.job:current_level_id() ~= "safehouse" then
                managers.hint:show_hint("destroyed_security_camera")
            end
        end
    end)
end

--[[if ExperienceManager then
    Hooks:PostHook(ExperienceManager, "_level_up", "PDTHHudCheckChallenges", function(self)
        managers.challenges:check_active_challenges()
    end)
end]]--

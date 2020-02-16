if not SGO or not SGO.settings.use_dcot then return end
if SystemFS:exists("mods/WolfHUD/mod.txt") or SystemFS:exists("mods/WolfHUD-master/mod.txt") or SystemFS:exists("mods/PocoHud3/mod.txt") or SystemFS:exists("mods/SydneyHUD/mod.txt") or SystemFS:exists("mods/PDTH Hud/mod.txt") or SystemFS:exists("mods/MUI/mod.txt") then return end
if RequiredScript == "lib/managers/hudmanagerpd2" then
   
    local init_original = HUDManager.init
    local teammate_progress_original = HUDManager.teammate_progress
    local set_slot_outfit_original = HUDManager.set_slot_outfit
    local add_teammate_panel_original = HUDManager.add_teammate_panel
    local set_mugshot_downed_original = HUDManager.set_mugshot_downed
    local set_mugshot_custody_original = HUDManager.set_mugshot_custody
    local set_mugshot_normal_original = HUDManager.set_mugshot_normal
    local set_player_condition_original = HUDManager.set_player_condition
   
   
    function HUDManager:init(...)
        init_original(self, ...)
        self._deferred_detections = {}
    end
   
    function HUDManager:teammate_panel_from_peer_id(id)
        for panel_id, panel in pairs(self._teammate_panels or {}) do
            if panel._peer_id == id then
                return panel_id
            end
        end
    end
   
    function HUDManager:add_teammate_panel(character_name, player_name, ai, peer_id, ...)
        local result = add_teammate_panel_original(self, character_name, player_name, ai, peer_id, ...)
        for pid, risk in pairs(self._deferred_detections) do
            for panel_id, _ in ipairs(self._hud.teammate_panels_data) do
                if self._teammate_panels[panel_id]:peer_id() == pid then
                    self._teammate_panels[panel_id]:set_detection_risk(risk)
                    self._deferred_detections[pid] = nil
                end
            end
        end
        return result
    end
 
    function HUDManager:set_slot_detection(peer_id, outfit, unpacked)
        if not unpacked or not outfit then
            outfit = managers.blackmarket:unpack_outfit_from_string(outfit)
        end
        local risk = managers.blackmarket:get_suspicion_offset_of_outfit_string(outfit, tweak_data.player.SUSPICION_OFFSET_LERP or 0.75)
        for panel_id, _ in ipairs(self._hud.teammate_panels_data) do
            if self._teammate_panels[panel_id].set_detection_risk and peer_id == managers.network:session():local_peer():id() and self._teammate_panels[panel_id]._main_player or self._teammate_panels[panel_id]:peer_id() == peer_id then
                self._teammate_panels[panel_id]:set_detection_risk(risk)
                return
            end
        end
        self._deferred_detections[peer_id] = risk
    end
   
    function HUDManager:set_mugshot_downed(id)
        local panel_id = self:_mugshot_id_to_panel_id(id)
        local unit = self:_mugshot_id_to_unit(id)
        if panel_id and unit and unit:movement().current_state_name and unit:movement():current_state_name() == "bleed_out" then
            self._teammate_panels[panel_id]:increment_revives()
        end
        return set_mugshot_downed_original(self, id)
    end
   
    function HUDManager:set_mugshot_custody(id)
        local panel_id = self:_mugshot_id_to_panel_id(id)
        if panel_id then
            self._teammate_panels[panel_id]:reset_revives()
            self._teammate_panels[panel_id]:set_player_in_custody(true)
        end
        return set_mugshot_custody_original(self, id)
    end
 
    function HUDManager:set_mugshot_normal(id)
        local panel_id = self:_mugshot_id_to_panel_id(id)
        if panel_id then
            self._teammate_panels[panel_id]:set_player_in_custody(false)
        end
        return set_mugshot_normal_original(self, id)
    end
 
    function HUDManager:reset_teammate_revives(panel_id)
        if self._teammate_panels[panel_id] then
            self._teammate_panels[panel_id]:reset_revives()
        end
    end
   
    function HUDManager:set_hud_mode(mode)
        for _, panel in pairs(self._teammate_panels or {}) do
            panel:set_hud_mode(mode)
        end
    end
 
    function HUDManager:teammate_panel_from_peer_id(id)
        for panel_id, panel in pairs(self._teammate_panels or {}) do
            if panel._peer_id == id then
                return panel_id
            end
        end
    end
   
    function HUDManager:_mugshot_id_to_panel_id(id)
        for _, data in pairs(managers.criminals:characters()) do
            if data.data.mugshot_id == id then
                return data.data.panel_id
            end
        end
    end
 
    function HUDManager:_mugshot_id_to_unit(id)
        for _, data in pairs(managers.criminals:characters()) do
            if data.data.mugshot_id == id then
                return data.unit
            end
        end
    end
   
    function HUDManager:set_player_condition(icon_data, text)
        set_player_condition_original(self, icon_data, text)
        if icon_data == "mugshot_in_custody" then
            self._teammate_panels[self.PLAYER_PANEL]:set_player_in_custody(true)
        elseif icon_data == "mugshot_normal" then
            self._teammate_panels[self.PLAYER_PANEL]:set_player_in_custody(false)
        end
    end
   
   
   
elseif RequiredScript == "lib/managers/hud/hudteammate" then
   
    local init_original = HUDTeammate.init
    local set_state_original = HUDTeammate.set_state
    local set_health_original = HUDTeammate.set_health
 
    function HUDTeammate:init(i, ...)
        init_original(self, i, ...)
 
        self:_init_revivecount()
    end
 
    function HUDTeammate:_init_revivecount()
        self._detection_counter = self._player_panel:child("radial_health_panel"):text({
            name = "detection_risk",
            visible = managers.groupai:state():whisper_mode(),
            layer = 1,
            Color = Color.white,
            w = self._player_panel:child("radial_health_panel"):w(),
            x = 0,
            y = 0,
            h = self._player_panel:child("radial_health_panel"):h(),
            vertical = "center",
            align = "center",
            font_size = 16,
            font = tweak_data.hud_players.ammo_font
        })
        self._revives_counter = self._player_panel:child("radial_health_panel"):text({
            name = "revives_counter",
            visible = not managers.groupai:state():whisper_mode(),
            text = "0",
            layer = 1,
            color = Color.white,
            w = self._player_panel:child("radial_health_panel"):w(),
            x = 0,
            y = 0,
            h = self._player_panel:child("radial_health_panel"):h(),
            vertical = "center",
            align = "center",
            font_size = 16,
            font = tweak_data.hud_players.ammo_font
        })
        self._revives_count = 0
        if self._main_player then
            self:set_detection_risk((managers.blackmarket:get_suspicion_offset_of_outfit_string(managers.blackmarket:unpack_outfit_from_string(managers.blackmarket:outfit_string()), tweak_data.player.SUSPICION_OFFSET_LERP or 0.75)))
        end
    end
   
    function HUDTeammate:increment_revives()
        if self._revives_counter then
            self._revives_count = self._revives_count + 1
            self._revives_counter:set_text(tostring(self._revives_count))
        end
    end
 
    function HUDTeammate:reset_revives()
        if self._revives_counter then
            self._revives_count = 0
            if not self._main_player then
                self._revives_counter:set_text(tostring(self._revives_count))
          else
                self._revives_counter:set_text(tostring(3 + managers.player:upgrade_value("player", "additional_lives", 0))
                        .. (managers.player:has_category_upgrade("player", "pistol_revive_from_bleed_out")
                        and ("/" .. managers.player:upgrade_value("player", "pistol_revive_from_bleed_out", 0)) or ""))
            end
        end
    end
   
    function HUDTeammate:set_revive_visibility(visible)
        if self._revives_counter then
            self._revives_counter:set_visible(not managers.groupai:state():whisper_mode() and visible and not self._is_in_custody)
        end
    end
 
    function HUDTeammate:set_detection_visibility(visible)
        if self._detection_counter then
            self._detection_counter:set_visible(managers.groupai:state():whisper_mode() and visible and not self._is_in_custody)
        end
    end
   
    function HUDTeammate:set_health(data)
        if data.revives then
            local revive_colors = { Color("FF8000"), Color("FFFF00"), Color("80FF00"), Color("00FF00") }
            self._revives_counter:set_color(revive_colors[data.revives - 1] or Color.red)
           
            self._revives_counter:set_text(tostring(data.revives - 1))
           
            self:set_player_in_custody(data.revives - 1 < 0)
        end
        return set_health_original(self, data)
    end
 
    function HUDTeammate:set_hud_mode(mode)
        self:set_revive_visibility(not (mode == "stealth"))
        self:set_detection_visibility(mode == "stealth")
    end
 
    function HUDTeammate:set_detection_risk(risk)
        self._detection_counter:set_text(string.format("%.0f", risk * 100))
        self._detection_counter:set_color(Color(1, 0.99, 0.08, 0) * (risk / 0.75) + Color(1, 0, 0.71, 1) * (1 - risk / 0.75))
    end
 
    function HUDTeammate:set_player_in_custody(incustody)
        self._is_in_custody = incustody
        self:set_revive_visibility(not incustody)
        self:set_detection_visibility(not incustody)
    end
   
elseif RequiredScript == "lib/network/base/handlers/connectionnetworkhandler" then
   
    local sync_outfit_original = ConnectionNetworkHandler.sync_outfit
 
    function ConnectionNetworkHandler:sync_outfit(outfit_string, outfit_version, outfit_signature, sender, ...)
        local peer = self._verify_sender(sender)
        if peer and managers.hud then
            managers.hud:set_slot_detection(peer:id(), outfit_string, false)
        end
        return sync_outfit_original(self, outfit_string, outfit_version, outfit_signature, sender, ...)
    end
   
elseif RequiredScript == "lib/network/handlers/unitnetworkhandler" then
   
    local sync_teammate_progress_original = UnitNetworkHandler.sync_teammate_progress
   
    function UnitNetworkHandler:sync_teammate_progress(type_index, enabled, tweak_data_id, timer, success, sender, ...)
        local sender_peer = self._verify_sender(sender)
        if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not sender_peer then
            return
        end
        if type_index and tweak_data_id and success and type_index == 1 and (tweak_data_id == "doctor_bag" or tweak_data_id == "firstaid_box") then
            managers.hud:reset_teammate_revives(managers.hud:teammate_panel_from_peer_id(sender_peer:id()))
        end
        return sync_teammate_progress_original(self, type_index, enabled, tweak_data_id, timer, success, sender, ...)
    end
   
elseif RequiredScript == "lib/managers/group_ai_states/groupaistatebase" then
 
        local set_whisper_mode_original = GroupAIStateBase.set_whisper_mode
 
        function GroupAIStateBase:set_whisper_mode(enabled, ...)
       
            set_whisper_mode_original(self, enabled, ...)
           
                if (enabled) then
                    managers.hud:set_hud_mode("stealth")
                else
                    managers.hud:set_hud_mode("loud")
                end
        end
 
    end
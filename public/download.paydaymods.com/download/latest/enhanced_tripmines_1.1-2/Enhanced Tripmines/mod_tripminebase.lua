-- Set to false if you only want the host to see the civ outlines
local show_mark_to_clients = true 


----------------------------------------------------------------------------------
-- 
-- Default our tripmines to sensor mode when they are placed in stealth
-- 
----------------------------------------------------------------------------------
local master_TripMineBase_set_active = TripMineBase.set_active

function TripMineBase:set_active(active, owner)
  master_TripMineBase_set_active(self, active, owner)
  if active and managers.groupai:state():whisper_mode() then
    self:set_armed(false)
  end
end


----------------------------------------------------------------------------------
-- 
-- Make our tripmines invincible when they are set to sensor mode
-- 
----------------------------------------------------------------------------------
local master_TripMineBase__explode = TripMineBase._explode

function TripMineBase:_explode(col_ray)
  if not self:armed() then
    return
  end  
  master_TripMineBase__explode(self, col_ray)
end 


----------------------------------------------------------------------------------
-- 
-- Changes how our sensor-mode tripmines highlight enemies and civs
-- 
----------------------------------------------------------------------------------
function TripMineBase:_sensor(t)
  local ray = self:_raycast()
  ---- Original code
  -- if ray and ray.unit and not tweak_data.character[ray.unit:base()._tweak_table].is_escort then
  if ray and ray.unit then
    self._sensor_units_detected = self._sensor_units_detected or {}
    if not self._sensor_units_detected[ray.unit:key()] then
      self._sensor_units_detected[ray.unit:key()] = true
      ---- Original code
      -- if managers.player:has_category_upgrade("trip_mine", "sensor_highlight") and (managers.groupai:state():whisper_mode() and tweak_data.character[ray.unit:base()._tweak_table].silent_priority_shout or tweak_data.character[ray.unit:base()._tweak_table].priority_shout) then
      if managers.player:has_category_upgrade("trip_mine", "sensor_highlight") then
        local can_be_marked = tweak_data.character[ray.unit:base()._tweak_table].silent_priority_shout or tweak_data.character[ray.unit:base()._tweak_table].priority_shout
        if can_be_marked then
          -- This code will mark enemies but not civs. 
          managers.game_play_central:auto_highlight_enemy(ray.unit, false, true)
        else
          -- This code will mark civs.
          civ_time_multiplier = 1
          if managers.groupai:state():whisper_mode() then
            -- Enemies are marked 3x as long in stealth (13.5 seconds vs 4.5 seconds), that logic is already present
            -- in auto_highlight_enemy() but we need to mimic it here for civs.
            civ_time_multiplier = 3
          end
          ray.unit:contour():add("mark_enemy", show_mark_to_clients, civ_time_multiplier)
        end
        self:_emit_sensor_sound_and_effect()
        if managers.network:session() then
          managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", TripMineBase.EVENT_IDS.sensor_beep)
        end
      end
      self._sensor_last_unit_time = t + 5
    end
  end
end


local mark_minion_original = UnitNetworkHandler.mark_minion
function UnitNetworkHandler:mark_minion(unit, minion_owner_peer_id, convert_enemies_health_multiplier_level, passive_convert_enemies_health_multiplier_level, sender, ...)
  if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not self._verify_character_and_sender(unit, sender) then
    return
  end
  
  mark_minion_original(self, unit, minion_owner_peer_id, convert_enemies_health_multiplier_level, passive_convert_enemies_health_multiplier_level, sender, ...)

  -- replace low def with high def on minion convert
  if NWC.settings.jokers_hq then
    local equipped_unit = unit:inventory():equipped_unit()
    local old_name = equipped_unit and equipped_unit:base()._old_unit_name
    if old_name then
      unit:inventory():add_unit_by_name(old_name, true)
    end
  end

end
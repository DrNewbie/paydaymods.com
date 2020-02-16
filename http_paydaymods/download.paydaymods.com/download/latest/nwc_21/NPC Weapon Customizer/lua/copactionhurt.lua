function CopActionHurt:clbk_shooting_hurt()
  self._delayed_shooting_hurt_clbk_id = nil
  if not alive(self._weapon_unit) then
    return
  end
  -- the "fire" object seems to not exist sometimes, in that case use the weapon unit itself
  local fire_obj = self._weapon_unit:get_object(Idstring("fire")) or self._weapon_unit
  self._weapon_unit:base():singleshot(fire_obj:position(), fire_obj:rotation(), 1, false, nil, nil, nil, nil)
end
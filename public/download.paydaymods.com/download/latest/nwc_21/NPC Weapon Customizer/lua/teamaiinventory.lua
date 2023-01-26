local init_original = TeamAIInventory.init
function TeamAIInventory:init(...)
  init_original(self, ...)
  self._is_cop_inventory = nil
end

-- need to do some ugly function overriding here unfortunately
-- at least it's kept to a minimum ¯\_(ツ)_/¯
function TeamAIInventory:add_unit_by_name(new_unit_name, equip)
  local new_unit = World:spawn_unit(new_unit_name, Vector3(), Rotation())
  local setup_data = {
    user_unit = self._unit,
    ignore_units = {
      self._unit,
      new_unit
    },
    expend_ammo = false,
    hit_slotmask = managers.slot:get_mask("bullet_impact_targets"),
    user_sound_variant = tweak_data.character[self._unit:base()._tweak_table].weapon_voice,
    alert_AI = true,
    alert_filter = self._unit:brain():SO_access()
  }

  new_unit:base():setup(setup_data)
  self:add_unit(new_unit, equip)
end
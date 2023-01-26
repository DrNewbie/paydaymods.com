local init_original = CopInventory.init
function CopInventory:init(...)
  init_original(self, ...)
  self._is_cop_inventory = true
end

local add_unit_original = CopInventory.add_unit
function CopInventory:add_unit(new_unit, ...)
  add_unit_original(self, new_unit, ...)
  -- when a weapon is added to inventory, check for a replacement
  local replacement_data = self._is_cop_inventory and NWC:get_weapon(NWC.weapon_unit_mappings[new_unit:name():key()])
  if replacement_data then
    local old_unit = new_unit
    local old_base = old_unit:base()

    -- load and spawn replacement weapon
    local factory_weapon = tweak_data.weapon.factory[replacement_data.factory_id]
    local ids_unit_name = Idstring(factory_weapon.unit)

    managers.dyn_resource:load(Idstring("unit"), ids_unit_name, managers.dyn_resource.DYN_RESOURCES_PACKAGE)

    new_unit = World:spawn_unit(Idstring(factory_weapon.unit), Vector3(), Rotation())
    
    local new_base = new_unit:base()
    local original_id = new_base._name_id

    -- save original name and set new name
    new_base._old_unit_name = old_unit:name()
    new_base._name_id = new_base._name_id .. (self._shield_unit and "_shield_nwc" or "_nwc")

    -- setup new tweak data
    if not tweak_data.weapon[new_base._name_id] then
      tweak_data.weapon[new_base._name_id] = deep_clone(tweak_data.weapon[old_base._name_id])
      if not NWC.settings.keep_sounds and not (NWC.keep_sniper_sounds and tweak_data.weapon[new_base._name_id].sounds.prefix:find("sniper_npc")) then
        tweak_data.weapon[new_base._name_id].sounds = tweak_data.weapon[original_id].sounds
      end
      if not NWC.settings.keep_types and not self._shield_unit then
        tweak_data.weapon[new_base._name_id].hold = tweak_data.weapon[original_id].hold
        tweak_data.weapon[new_base._name_id].reload = tweak_data.weapon[original_id].reload
        tweak_data.weapon[new_base._name_id].pull_magazine_during_reload = tweak_data.weapon[original_id].pull_magazine_during_reload
      end
    end

    -- fix init data
    new_base:_create_use_setups()
    new_base:set_ammo_max(tweak_data.weapon[new_base._name_id].AMMO_MAX)
    new_base:set_ammo_total(new_base:get_ammo_max())
    new_base:set_ammo_max_per_clip(tweak_data.weapon[new_base._name_id].CLIP_AMMO_MAX)
    new_base:set_ammo_remaining_in_clip(new_base:get_ammo_max_per_clip())
    new_base._damage = old_base._damage

    -- disable thq if needed
    if not (NWC:is_joker(self._unit) and NWC.settings.jokers_hq) and not (NWC:is_special(self._unit) and NWC.settings.specials_hq) and not NWC.settings.force_hq then
      new_base.use_thq = function () return false end
    end

    -- plug old raycast function
    new_base._fire_raycast = old_base._fire_raycast

    new_base:set_factory_data(replacement_data.factory_id)
    new_base:set_cosmetics_data(replacement_data.cosmetics)
    new_base:assemble_from_blueprint(replacement_data.factory_id, replacement_data.blueprint)
    new_base:check_npc()

    local setup_data = old_base._setup
    setup_data.ignore_units = {
      self._unit,
      new_unit,
      self._shield_unit
    }
    new_base:setup(setup_data)

    if new_base.AKIMBO then
      new_base:create_second_gun()
    end

    add_unit_original(self, new_unit, ...)
  end
end

local save_original = CopInventory.save
function CopInventory:save(data, ...)
  save_original(self, data, ...)
  -- change the sync index to the original weapon's index and remove unneeded data
  local old_name = alive(self:equipped_unit()) and self:equipped_unit():base()._old_unit_name
  if old_name then
    data.equipped_weapon_index = self._get_weapon_sync_index(old_name) or 4
    data.blueprint_string = nil
    data.cosmetics_string = "nil-1-0"
    data.gadget_on = nil
    data.gadget_color = nil
  end
end

local _send_equipped_weapon_original = CopInventory._send_equipped_weapon
function CopInventory:_send_equipped_weapon(...)
  -- Don't send equipped unit if it's a replaced one (as the original has been sent before anyways)
  if self:equipped_unit():base()._old_unit_name then
    return
  end
  _send_equipped_weapon_original(self, ...)
end

local temp_vec1 = Vector3()
local drop_weapon_original = CopInventory.drop_weapon
function CopInventory:drop_weapon(...)
  local selection = self._available_selections[self._equipped_selection]
  local unit = selection and selection.unit

  if unit and unit:damage() then
    return drop_weapon_original(self, ...)
  end

  local create_physics_body = function (unit)
    local dropped_col = World:spawn_unit(Idstring("units/payday2/weapons/box_collision/box_collision_medium_ar"), unit:position(), unit:rotation())
    dropped_col:link(Idstring("rp_box_collision_medium"), unit)
    mvector3.set(temp_vec1, unit:rotation():y())
    mvector3.multiply(temp_vec1, math.random(75, 200))
    dropped_col:push(10, temp_vec1)
    unit:base()._collider_unit = dropped_col
  end

  if unit and unit:base() then
    unit:unlink()
    create_physics_body(unit)
    self:_call_listeners("unequip")
    managers.game_play_central:weapon_dropped(unit)

    local second_gun = unit:base()._second_gun
    if second_gun then
      second_gun:unlink()
      create_physics_body(unit)
      managers.game_play_central:weapon_dropped(second_gun)
    end
  end
end
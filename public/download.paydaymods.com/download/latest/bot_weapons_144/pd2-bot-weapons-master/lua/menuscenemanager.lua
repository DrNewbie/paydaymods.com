function MenuSceneManager:set_henchmen_loadout(index, character, loadout)

  self._picked_character_position = self._picked_character_position or {}
  character = character or managers.blackmarket:preferred_henchmen(index)
  
  if not character then
    local preferred = managers.blackmarket:preferred_henchmen()
    local characters = CriminalsManager.character_names()
    local player_character = managers.blackmarket:get_preferred_characters_list()[1]
    local available = {}
    for i, name in ipairs(characters) do
      if player_character ~= name then
        local found_current = table.get_key(self._picked_character_position, name) or 999
        if not table.contains(preferred, name) and index <= found_current then
          local new_name = CriminalsManager.convert_old_to_new_character_workname(name)
          local char_tweak = tweak_data.blackmarket.characters.locked[new_name] or tweak_data.blackmarket.characters[new_name]
          if not char_tweak.dlc or managers.dlc:is_dlc_unlocked(char_tweak.dlc) then
            table.insert(available, name)
          end
        end
      end
    end
    if #available < 1 then
      available = CriminalsManager.character_names()
    end
    character = available[math.random(#available)] or "russian"
  end
  
  -- get char loadout
  loadout = BotWeapons:get_loadout(character, loadout or managers.blackmarket:henchman_loadout(index), true)
  
  -- character
  self._picked_character_position[index] = character
  local character_id = managers.blackmarket:get_character_id_by_character_name(character)
  local unit = self._henchmen_characters[index]
  self:_delete_character_weapon(unit, "all")
  local unit_name = tweak_data.blackmarket.characters[character_id].menu_unit
  if not alive(unit) or Idstring(unit_name) ~= unit:name() then
    local pos = unit:position()
    local rot = unit:rotation()
    if alive(unit) then
      self:_delete_character_mask(unit)
      World:delete_unit(unit)
    end
    unit = World:spawn_unit(Idstring(unit_name), pos, rot)
    self:_init_character(unit, index)
    self._henchmen_characters[index] = unit
  end

  unit:base():set_character_name(character)

  self:set_character_player_style(loadout.player_style, loadout.suit_variation, unit)

  -- mask
  local mask = loadout.mask
  local mask_blueprint = loadout.mask_blueprint or managers.blackmarket:get_mask_default_blueprint(mask)
  local crafted_mask = managers.blackmarket:get_crafted_category_slot("masks", loadout.mask_slot)
  if crafted_mask then
    mask = crafted_mask.mask_id
    mask_blueprint = crafted_mask.blueprint
  end
  self:set_character_mask_by_id(mask, mask_blueprint, unit, nil, character)
  local mask_data = self._mask_units[unit:key()]
  if mask_data then
    self:update_mask_offset(mask_data)
  end
  
  -- weapon
  local weapon_id
  local crafted_primary = managers.blackmarket:get_crafted_category_slot(loadout.primary_category or "primaries", loadout.primary_slot)
  if crafted_primary then
    local primary = crafted_primary.factory_id
    local primary_id = crafted_primary.weapon_id
    local primary_blueprint = crafted_primary.blueprint
    local primary_cosmetics = crafted_primary.cosmetics
    self:set_character_equipped_weapon(unit, primary, primary_blueprint, "primary", primary_cosmetics)
    weapon_id = primary_id
  else
    local primary = loadout.primary or tweak_data.character[character].weapon.weapons_of_choice.primary
    primary = string.gsub(primary, "_npc", "")
    local blueprint = loadout.primary and loadout.primary_blueprint or managers.weapon_factory:get_default_blueprint_by_factory_id(primary)
    local cosmetics = loadout.primary and loadout.primary_cosmetics
    self:set_character_equipped_weapon(unit, primary, blueprint, "primary", cosmetics)
    weapon_id = managers.weapon_factory:get_weapon_id_by_factory_id(primary)
  end
  
  -- armor
  BotWeapons:set_armor(unit, loadout.armor)
  self:set_character_armor_skin(loadout.armor_skin, unit)
  
  -- equipment
  BotWeapons:set_equipment(unit, loadout.deployable)
  
  -- pose
  self:_select_henchmen_pose(unit, weapon_id, index)
  local pos, rot = self:get_henchmen_positioning(index)
  unit:set_position(pos)
  unit:set_rotation(rot)
  self:set_henchmen_visible(true, index)
end
local _reserve_loadout_for_original = CriminalsManager._reserve_loadout_for
function CriminalsManager:_reserve_loadout_for(char_name, ...)
  return BotWeapons:get_loadout(char_name, _reserve_loadout_for_original(self, char_name, ...))
end

local get_loadout_for_original = CriminalsManager.get_loadout_for
function CriminalsManager:get_loadout_for(char_name, ...)
  return BotWeapons:get_loadout(char_name, get_loadout_for_original(self, char_name, ...))
end

local update_character_visual_state_original = CriminalsManager.update_character_visual_state
function CriminalsManager:update_character_visual_state(character_name, visual_state, ...)
  local character = self:character_by_name(character_name)
  if character and character.taken and character.data.ai and alive(character.unit) then
    local loadout = self:get_loadout_for(character_name)

    visual_state = visual_state or {}
    if BotWeapons:should_use_armor() then
      visual_state.armor_id = loadout.armor
      visual_state.armor_skin = loadout.armor_skin
      BotWeapons:set_armor(character.unit, loadout.armor, loadout.armor_skin)
    end
    BotWeapons:set_equipment(character.unit, loadout.deployable)

    local player_style_u_name = tweak_data.blackmarket:get_player_style_value(loadout.player_style, character_name, "third_unit")
    if player_style_u_name then
      managers.dyn_resource:load(Idstring("unit"), Idstring(player_style_u_name), DynamicResourceManager.DYN_RESOURCES_PACKAGE)
      visual_state.player_style = loadout.player_style
      visual_state.suit_variation = loadout.suit_variation
      local spawn_manager = character.unit:spawn_manager()
      if spawn_manager then
        spawn_manager.save = function () end -- ugly hack, unmodded clients will see floating heads, need to find a better way to do this
      end
    end

    if Network:is_server() then
      BotWeapons:sync_to_all_peers(character.unit, loadout, 2)
    end
  end
  return update_character_visual_state_original(self, character_name, visual_state, ...)
end
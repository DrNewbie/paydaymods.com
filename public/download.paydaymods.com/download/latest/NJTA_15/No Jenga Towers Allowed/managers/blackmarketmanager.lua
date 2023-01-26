function BlackMarketManager:is_weapon_category_allowed_for_crew(weapon_category)
  local allowed = {
    assault_rifle = true,
    shotgun = true,
    snp = true,
    lmg = true,
    smg = true,
    akimbo = true,
    pistol = true
  }
  return allowed[weapon_category]
end
if SystemFS:exists("mods/Look My Gun/lua/mod.txt") then return end
function MenuSceneManager:_get_lobby_character_prio_item(rank, outfit)
	local infamous = rank and rank > 0
	local primary_rarity, secondary_rarity
	if outfit.primary.cosmetics and outfit.primary.cosmetics.id and outfit.primary.cosmetics.id ~= "nil" then
		local rarity = tweak_data.blackmarket.weapon_skins[outfit.primary.cosmetics.id] and tweak_data.blackmarket.weapon_skins[outfit.primary.cosmetics.id].rarity
		primary_rarity = tweak_data.economy.rarities[rarity].index
	end
	if outfit.secondary.cosmetics and outfit.secondary.cosmetics.id and outfit.secondary.cosmetics.id ~= "nil" then
		local rarity = tweak_data.blackmarket.weapon_skins[outfit.secondary.cosmetics.id] and tweak_data.blackmarket.weapon_skins[outfit.secondary.cosmetics.id].rarity
		secondary_rarity = tweak_data.economy.rarities[rarity].index
	end
	if primary_rarity and secondary_rarity then
		return primary_rarity >= secondary_rarity and "primary" or "secondary"
	elseif primary_rarity then
		return "primary"
	elseif secondary_rarity then
		return "secondary"
	end
	if not primary_rarity and not secondary_rarity then
		return "primary"
	end
	return infamous and "rank" or "primary"
end
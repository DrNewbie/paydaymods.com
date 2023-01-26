Hooks:PostHook( BlackMarketTweakData, "_init_weapon_skins", "DSIMModInit", function(self)
	for _, weap in pairs(self.weapon_skins) do
		if weap.rarity ~= "legendary" and weap.default_blueprint then
			weap.default_blueprint = nil
		end
	end
end )
function StatisticsManager:session_favourite_weapon()
	local weapon_id
	local variant
	local count = 0
	
	for id, data in pairs( self._global.session.killed_by_weapon ) do
		if count < data.count then
			count = data.count
			weapon_id = id
			variant = "weapon"
		end
	end
	
	for id, data in pairs( self._global.session.killed_by_melee ) do
		if count < data then
			count = data
			weapon_id = managers.blackmarket:equipped_melee_weapon()
			variant = "melee"
		end
	end
	
	if not weapon_id then
		return ( managers.localization:text( "debug_undecided" ) )
	end
	
	return ( ( variant == "weapon" and managers.localization:text( tweak_data.weapon[ weapon_id ].name_id ) or variant == "melee" and managers.localization:text( tweak_data.blackmarket.melee_weapons[ weapon_id ].name_id ) ) .. " (" .. count .. ")" )
end
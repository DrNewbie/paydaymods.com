Hooks:PostHook( BlackMarketTweakData , "_init_melee_weapons" , "MeleeOverhaulBlackMarketTweakDataPostInitMeleeWeapons" , function( self , tweak_data )

	for k , v in pairs( self.melee_weapons ) do
		if not v.melee_type then
			v.melee_type = MeleeOverhaul:MeleeType( k )
		end
		if not v.info_id then
			v.info_id = v.name_id .. "_info"
		end
	end

end )
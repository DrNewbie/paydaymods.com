Hooks:PostHook( NetworkAccountSTEAM , "init" , "MeleeOverhaulNetworkAccountSTEAMPostInit" , function( self )

	MeleeOverhaul.Stats = MeleeOverhaul.Stats or {
		killed = {
			type = nil,
			gui = "guis/textures/pd2/blackmarket/icons/melee_weapons/weapon",
			value = 0
		},
		used = {
			type = nil,
			gui = "guis/textures/pd2/blackmarket/icons/melee_weapons/weapon",
			value = 0
		}
	}
	
	for k , v in pairs( tweak_data.blackmarket.melee_weapons ) do
		local kstat = self:get_stat( "melee_kills_" .. k )
		local ustat = self:get_stat( "melee_used_" .. k )
		
		if MeleeOverhaul.Stats.killed.value < kstat then
			MeleeOverhaul.Stats.killed.type = k
			MeleeOverhaul.Stats.killed.value = kstat
		end
		
		if MeleeOverhaul.Stats.used.value < ustat then
			MeleeOverhaul.Stats.used.type = k
			MeleeOverhaul.Stats.used.value = ustat
		end
	end
	
	if MeleeOverhaul.Stats.killed.type then
		if MeleeOverhaul.Stats.killed.type == "weapon" then
			local primary = managers.blackmarket:equipped_primary()
			local primary_id = primary.weapon_id
			
			guis_catalog = "guis/"
			
			local bundle_folder = tweak_data.weapon[ primary_id ] and tweak_data.weapon[ primary_id ].texture_bundle_folder
			
			if bundle_folder then
				guis_catalog = guis_catalog .. "dlcs/" .. tostring( bundle_folder ) .. "/"
			end
			
			MeleeOverhaul.Stats.killed.gui = guis_catalog .. "textures/pd2/blackmarket/icons/weapons/" .. tostring( primary_id )
		else
			local guis_catalog = "guis/"
			local bundle = tweak_data.blackmarket.melee_weapons[ MeleeOverhaul.Stats.killed.type ].texture_bundle_folder
			
			if bundle then
				guis_catalog = guis_catalog .. "dlcs/" .. tostring( bundle ) .. "/"
			end
			
			MeleeOverhaul.Stats.killed.gui = guis_catalog .. "textures/pd2/blackmarket/icons/melee_weapons/" .. MeleeOverhaul.Stats.killed.type
		end
	end
	
	if MeleeOverhaul.Stats.used.type then
		if MeleeOverhaul.Stats.used.type == "weapon" then
			local primary = managers.blackmarket:equipped_primary()
			local primary_id = primary.weapon_id
			
			guis_catalog = "guis/"
			
			local bundle_folder = tweak_data.weapon[ primary_id ] and tweak_data.weapon[ primary_id ].texture_bundle_folder
			
			if bundle_folder then
				guis_catalog = guis_catalog .. "dlcs/" .. tostring( bundle_folder ) .. "/"
			end
			
			MeleeOverhaul.Stats.used.gui = guis_catalog .. "textures/pd2/blackmarket/icons/weapons/" .. tostring( primary_id )
		else
			local guis_catalog = "guis/"
			local bundle = tweak_data.blackmarket.melee_weapons[ MeleeOverhaul.Stats.used.type ].texture_bundle_folder
			
			if bundle then
				guis_catalog = guis_catalog .. "dlcs/" .. tostring( bundle ) .. "/"
			end
			
			MeleeOverhaul.Stats.used.gui = guis_catalog .. "textures/pd2/blackmarket/icons/melee_weapons/" .. MeleeOverhaul.Stats.used.type
		end
	end

end )
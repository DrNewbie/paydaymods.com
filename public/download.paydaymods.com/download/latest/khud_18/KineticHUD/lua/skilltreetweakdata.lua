--i had to write this because get_specialization_icon_data() always picks the top tier. booooo

function SkillTreeTweakData:get_specialization_icon_data_with_tier_because_overkill_wouldnt_do_it(spec, no_fallback, tier, tier_floors)
	spec = spec or managers.skilltree:get_specialization_value("current_specialization")

	local data = tweak_data.skilltree.specializations[spec]
	local max_tier = managers.skilltree:get_specialization_value(spec, "tiers", "max_tier")
	
	if tier_floors and type(tier_floors) == "table" then
	--this code-nugget takes optional input "tier_floors" (table) which is a whitelist for icon tiers to use.
	--it takes the highest possible unlocked tier from this whitelist, and uses that. 
	--this is helpful for if you want to get the highest tier icon but do not want to use the "generic" perks (eg 2,4,6,8), for instance. 
		tier = max_tier
		local result
		for _,max_eligible in pairs(tier_floors) do 
			if max_eligible <= tier then 
				result = max_eligible
			end
		end
		tier = result
	end
	
	local tier_data = data and data[tier or max_tier] --this, the arg tier, and the tier_floors option are the only things i changed. :|

	if not tier_data then
		if no_fallback then
			return
		else
			return tweak_data.hud_icons:get_icon_data("fallback")
		end
	end

	local guis_catalog = "guis/" .. (tier_data.texture_bundle_folder and "dlcs/" .. tostring(tier_data.texture_bundle_folder) .. "/" or "")
	local x = tier_data.icon_xy and tier_data.icon_xy[1] or 0
	local y = tier_data.icon_xy and tier_data.icon_xy[2] or 0

	return guis_catalog .. "textures/pd2/specialization/icons_atlas", {
		x * 64,
		y * 64,
		64,
		64
	}
end
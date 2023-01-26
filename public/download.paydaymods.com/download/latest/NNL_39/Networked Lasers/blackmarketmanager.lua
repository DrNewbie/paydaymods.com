_G.LasersPlus = _G.LasersPlus or {}
local Lasers = Lasers or _G.LasersPlus


	function BlackMarketManager:get_part_custom_colors(category, slot, part_id, require_existing)
		if require_existing == nil then
			require_existing = false
		end
		local crafted_category = self._global.crafted_items[category]	
		local crafted_item = crafted_category and crafted_category[slot]
		local custom_colors = crafted_item and crafted_item.custom_colors

		if custom_colors and custom_colors[part_id] then
			return self:get_custom_colors_from_string(custom_colors and custom_colors[part_id])
		elseif not require_existing then

--if no color data saved, then

			local new_laser, new_flash
			if Lasers.settings.enabled_blackmarket_qol then
--	use the mod's user-set default instead of hideous green/white
				new_laser = Lasers:GetOwnLaserColor()
				new_flash = Lasers:GetOwnFlashlightColor()
				local data_string = ""
				local i = 1
				for key, color in pairs({laser = new_laser,flashlight = new_flash}) do
					local str = string.format("%s %f %f %f", key, color.r, color.g, color.b)
					data_string = data_string .. (i > 1 and "; " or "") .. str
					i = i + 1
				end
				crafted_item.custom_colors = crafted_item.custom_colors or {}
				crafted_item.custom_colors[part_id] = data_string
				
				return {
					laser = new_laser,
					flashlight = new_flash
				} --return the colors we just set to local variables offhand instead of digging into the weapon to find them again
			
			else
				--but if not color data saved, then don't bother saving new color data to the weapon,
				--and just return the boring, dumb, ugly, stupid, tweak_data default colors
				return {
					laser = tweak_data.custom_colors.defaults.laser,
					flashlight = tweak_data.custom_colors.defaults.flashlight
				}
			--then save the colordata to the weapon in string form
			end
		end
	end

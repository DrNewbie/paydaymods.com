--I'm not posthooking this, if something did interfere with this it'd be a mod conflict anyway
function BlackMarketManager:get_part_custom_colors(category, slot, part_id, require_existing)
	if require_existing == nil then
		require_existing = false
	end
	local crafted_category = self._global.crafted_items[category]
	local crafted_item = crafted_category and crafted_category[slot]
	local custom_colors = crafted_item and crafted_item.custom_colors

	if custom_colors and custom_colors[part_id] then
--		log("custom_colors for part id " .. tostring(part_id) .. " are " .. custom_colors[part_id])
		return self:get_custom_colors_from_string(custom_colors and custom_colors[part_id])
	elseif not require_existing then

	--if no color data saved, use the mod's user-set default instead of hideous green/white
	local new_laser = DGC:GetLaserColor()
	local new_flash = DGC:GetFlashlightColor()
	
	--then save the colordata to the weapon in string form
	local data_string = ""
	local i = 1
	for key, color in pairs({laser = new_laser,flashlight = new_flash}) do
		local str = string.format("%s %f %f %f", key, color.r, color.g, color.b)
		data_string = data_string .. (i > 1 and "; " or "") .. str
		i = i + 1
	end
	crafted_item.custom_colors = crafted_item.custom_colors or {}
	crafted_item.custom_colors[part_id] = data_string
--	log("data_string is " .. data_string)
		return {
			laser = new_laser,
			flashlight = new_flash
		} --return the colors we just set to local variables offhand instead of digging into the weapon to find them again
	end
end

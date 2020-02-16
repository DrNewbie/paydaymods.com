_G.LasersPlus = _G.LasersPlus or {}
local Lasers = Lasers or _G.LasersPlus

--custom scope reticule + color
function BlackMarketGui:_buy_mod_callback(data)
	self._item_bought = true

	managers.menu_component:post_event("item_buy")
	managers.blackmarket:buy_and_modify_weapon(data.category, data.slot, data.global_value, data.name, false, data.free_of_charge)

	local factory = tweak_data.weapon.factory.parts[data.name]

	if factory then
		local texture_switch = factory.texture_switch

		if texture_switch then
			local default
			if Lasers:IsQOLEnabled() then
				default = tostring(Lasers:GetSightColor()) .. " " .. tostring(Lasers:GetSightType())
			else
				default = tweak_data.gui.part_texture_switches[data.name] or tweak_data.gui.default_part_texture_switch
			end
			managers.blackmarket:set_part_texture_switch(data.category, data.slot, data.name, default)
		end
	end

	self:reload()
end

--I LIED, I PREHOOKED IT INSTEAD MUAHAHAHA
Hooks:PreHook(BlackMarketGui, "populate_mods", "populate_mods_lasersplus", function(self,data)
	local crafted = managers.blackmarket:get_crafted_category(data.prev_node_data.category)[data.prev_node_data.slot]
	local cosmetics_blueprint = crafted.cosmetics and crafted.cosmetics.id and tweak_data.blackmarket.weapon_skins[crafted.cosmetics.id] and tweak_data.blackmarket.weapon_skins[crafted.cosmetics.id].default_blueprint or {}
	--offy wuz hear vv

	for i, c_mod in ipairs(cosmetics_blueprint) do
		if Lasers:IsQOLEnabled() then
		--this block is executed on loading weapon skins that come with free weapon attachments
		--
			local mod_td = tweak_data.weapon.factory.parts[c_mod]
			local mod_type = mod_td.type
			local sub_type = mod_td.sub_type

			if mod_type == "sight" then
			--do default reticule and color
				crafted.texture_switches = crafted.texture_switches or {}
				crafted.texture_switches[c_mod] = crafted.texture_switches[c_mod] or tostring(Lasers:GetSightColor()) .. " " .. tostring(Lasers:GetSightType())
			elseif sub_type and sub_type == "laser" then
			--do default laser and flashlight color
				new_laser = Lasers:GetOwnLaserColor()
				new_flash = Lasers:GetOwnFlashlightColor()
				local data_string = ""
				for key, color in pairs({laser = new_laser,flashlight = new_flash}) do
					local str = string.format("%s %f %f %f", key, color.r, color.g, color.b)
					data_string = data_string .. (i > 1 and "; " or "") .. str
					i = i + 1
				end
				crafted.custom_colors = crafted.custom_colors or {}
				crafted.custom_colors[c_mod] = crafted.custom_colors[c_mod] or data_string
			end
		end
	end	
		-----offy wuz hear ^^
end)

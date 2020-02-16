--todo setting to show total refund value in dialogue before confirm
--todo fix that bug where the calculated refund value is different from the actual value, hence the above ^

_G.SellStuff = {}
SellStuff._path = ModPath 
SellStuff.settings = { --placeholder
	category = "none", --doesn't save, isn't used
	show_total = false --doesn't do anything right now
}
local clear_categories = {
	[1] = "none",
	[2] = "primaries",
	[3] = "secondaries",
	[4] = "masks",
	[5] = "all"
--			"armors",
--			"grenades",
--			"melee_weapons"
}

--[[ 
todo
SellStuff._data_path = SavePath .. "SellStuff.txt" 

function SellStuff:Load()
	local file = io.open(self._data_path, "r")
	if (file) then
		for k, v in pairs(json.decode(file:read("*all"))) do
			self.settings[k] = v
		end
	else
		SellStuff:Save()
	end
end

function SellStuff:Save()
	local file = io.open(self._data_path,"w+")
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end

--]]
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_SellStuff", function( loc )
	loc:load_localization_file( SellStuff._path .. "en.txt")
end)


function SellStuff:CreateConfirmDialog(params)
	local category = clear_categories[SellStuff.selected_category]
	local title = managers.localization:text("dialog_bm_crafted_sell_title")
	local desc = "You are about to sell all non-equipped items in category \"" .. tostring(category) .. "\"." 
	local options = {
		{
			text = "Sell it!",
			callback = params.callback
		},
		{
			text = managers.localization:text("dialog_cancel"),
			is_cancel_button = true
		}
	}
	--todo special case string for "all"
	QuickMenu:new(title,desc,options,true)
	--todo calculate and print refund value here ^
end

function SellStuff:SellAll()
	for _,cat in pairs({"primaries","secondaries","masks"}) do
		SellStuff:SellCategory(cat)
	end
end

function SellStuff:SellCategory(category)
	
	local total_refund = 0
	local bm = managers.blackmarket

	for k,v in pairs(bm._global.crafted_items[category]) do
	
		if category == "masks" then 
			local mask = bm:get_crafted_category_slot("masks",k)
--			local mask_localized = bm:get_mask_name_by_category_slot("masks",k)
			local mask_id = mask.mask_id
			if (k ~= bm:equipped_mask_slot()) and (mask_id ~= "character_locked") then
				total_refund = total_refund + managers.money:get_mask_slot_sell_value(k)
				bm:on_sell_mask(k,true)
			end
		else
			
			total_refund = total_refund + managers.money:get_weapon_slot_sell_value(category,k)
			local weapon = bm:get_crafted_category_slot(category,k)
			if weapon then
				if bm:equipped_weapon_slot(category) ~= k then 
					bm:on_sell_weapon(category,k,true)
				end
			--[[ old safety for not causing no-weapon-in-inventory crashes
				local harambe
				
				local data = bm:get_weapon_data(weapon.weapon_id)
				if harambe and data and data.level then
				--we don't want to kill harambe so we save the lowest level item to save (read: not sell), to prevent crashing
					if data.level < harambe.level then
						bm:on_sell_weapon(category,harambe.slot,true)
						harambe = {
							slot = k,
							level = data.level
						}
					else
						bm:on_sell_weapon(category,k,true)
					end
				else
					harambe = {
						slot = k,
						level = data.level
					}
				end
				--]]
			else
				log("[SellAllItems]: [ERROR!] No item matching " .. ((weapon and (" id [" .. weapon.weapon_id)) or (" value [" .. tostring(k))) .. "]")
			end
			
		end
	end
	
--		log("[SellAllItems]: [TOTAL " .. utf8.to_upper(category) .. " REFUND:] " .. tostring(total_refund))
end

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_SellStuff", function(menu_manager)
		
	MenuCallbackHandler.callback_sellstuff_selectcategory = function(self,item)
		SellStuff.selected_category = tonumber(item:value())
	end
	MenuCallbackHandler.callback_sellstuff_sellselected = function(self,item)
		if SellStuff.selected_category and not Utils:IsInHeist() then
			local category = clear_categories[SellStuff.selected_category]
			if category == "all" then 
				SellStuff:CreateConfirmDialog({callback = callback(SellStuff,SellStuff,"SellAll")})
			elseif category ~= "none" then
				SellStuff:CreateConfirmDialog({callback = callback(SellStuff,SellStuff,"SellCategory",category)})
			end
		end
	end

	MenuCallbackHandler.callback_sellstuff_close = function(this)
--		SellStuff:Save()
	end
--	SellStuff:Load()
	MenuHelper:LoadFromJsonFile(SellStuff._path .. "options.txt", SellStuff, SellStuff.settings)
end)

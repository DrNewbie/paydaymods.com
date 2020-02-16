
if BlackmarketPersistentNames == nil then
	log("[BlackmarketPersistentNames] menumanager.lua | Error: Failed to create Mod Options menu, aborting")
	return
end

if MenuCallbackHandler == nil then
	log("[BlackmarketPersistentNames] menumanager.lua | Error: MenuCallbackHandler is nil, aborting")
	return
end

local function AddModOptions(menu_manager)
	if menu_manager == nil then
		return
	end

	MenuCallbackHandler.BlackmarketPersistentNames_SaveSettings = function(node)
		BlackmarketPersistentNames:Save()
	end

	MenuCallbackHandler.BlackmarketPersistentNames_PriSecWeaponNames = function(self, item)
		BlackmarketPersistentNames.Prefs.PriSecWeaponNames = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.BlackmarketPersistentNames_BuyWeaponNames = function(self, item)
		BlackmarketPersistentNames.Prefs.BuyWeaponNames = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.BlackmarketPersistentNames_WeaponModNames = function(self, item)
		BlackmarketPersistentNames.Prefs.WeaponModNames = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.BlackmarketPersistentNames_WeaponSkinNames = function(self, item)
		BlackmarketPersistentNames.Prefs.WeaponSkinNames = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.BlackmarketPersistentNames_MeleeWeaponNames = function(self, item)
		BlackmarketPersistentNames.Prefs.MeleeWeaponNames = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.BlackmarketPersistentNames_ThrowableWeaponNames = function(self, item)
		BlackmarketPersistentNames.Prefs.ThrowableWeaponNames = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.BlackmarketPersistentNames_DeployableNames = function(self, item)
		BlackmarketPersistentNames.Prefs.DeployableNames = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.BlackmarketPersistentNames_ArmorNames = function(self, item)
		BlackmarketPersistentNames.Prefs.ArmorNames = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.BlackmarketPersistentNames_SkillNames = function(self, item)
		BlackmarketPersistentNames.Prefs.SkillNames = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.BlackmarketPersistentNames_CharacterNames = function(self, item)
		BlackmarketPersistentNames.Prefs.CharacterNames = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.BlackmarketPersistentNames_MaskNames = function(self, item)
		BlackmarketPersistentNames.Prefs.MaskNames = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.BlackmarketPersistentNames_BuyMaskNames = function(self, item)
		BlackmarketPersistentNames.Prefs.BuyMaskNames = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.BlackmarketPersistentNames_MaskModNames = function(self, item)
		BlackmarketPersistentNames.Prefs.MaskModNames = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.BlackmarketPersistentNames_SteamInventoryNames = function(self, item)
		BlackmarketPersistentNames.Prefs.SteamInventoryNames = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.BlackmarketPersistentNames_CrewAbilityBoostNames = function(self, item)
		BlackmarketPersistentNames.Prefs.CrewAbilityBoostNames = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.BlackmarketPersistentNames_DimCommonPerkCards = function(self, item)
		BlackmarketPersistentNames.Prefs.DimCommonPerkCards = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.BlackmarketPersistentNames_NeverDimCustomNames = function(self, item)
		BlackmarketPersistentNames.Prefs.NeverDimCustomNames = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.BlackmarketPersistentNames_SuppressCustomNameQuotes = function(self, item)
		BlackmarketPersistentNames.Prefs.SuppressCustomNameQuotes = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.BlackmarketPersistentNames_SetStringSplitThreshold = function(self, item)
		local BlackmarketPersistentNames = _G.BlackmarketPersistentNames

		local value = BlackmarketPersistentNames.RoundToNearest(item:value())
		BlackmarketPersistentNames.Prefs.StringSplitThreshold = value
		-- Force the slider's numeric display to always show the actual, rounded value being used
		item:set_value(value)
	end

	MenuCallbackHandler.BlackmarketPersistentNames_Reset = function(self, item)
		-- Zero everything out
		for name, __ in pairs(BlackmarketPersistentNames.Prefs) do
			BlackmarketPersistentNames.Prefs[name] = nil
		end
		-- Fill in the missing preferences with default values
		for key, value in pairs(BlackmarketPersistentNames.DefPrefs) do
			if BlackmarketPersistentNames.Prefs[key] == nil then
				BlackmarketPersistentNames.Prefs[key] = value
			end
		end
		-- Force the save file to be overwritten with the default values as well
		BlackmarketPersistentNames:Save()
		-- Update all GUI controls to match. Adapted from Menu:ResetItemsToDefaultValue() in mods/base/req/menus.lua
		for __, node in ipairs(item._parameters.gui_node.row_items) do
			for name, value in pairs(BlackmarketPersistentNames.Prefs) do
				-- FIXME: This does not account for cases where there is a duplicate segment within a name (e.g. one option
				-- named 'somename' and another named 'somenameextended' causes the latter's default value to get ignored)
				if node.item._parameters.name:find(utf8.to_lower(name)) ~= nil then
					if node.item.set_value then
						if node.item._type == "toggle" then
							node.item:set_value(value and "on" or "off")
						else
							node.item:set_value(value)
						end
						-- Needed for sliders that perform rounding and toggle controls that perform refreshes
						node.item:trigger()
					end
					break
				end
			end
		end
		-- Force any sliders to be redrawn
		managers.viewport:resolution_changed()
	end

	MenuHelper:LoadFromJsonFile(BlackmarketPersistentNames.ModOptions, BlackmarketPersistentNames, BlackmarketPersistentNames.Prefs)
end
Hooks:Add("MenuManagerInitialize", "BlackmarketPersistentNames_AddModOptions", AddModOptions)

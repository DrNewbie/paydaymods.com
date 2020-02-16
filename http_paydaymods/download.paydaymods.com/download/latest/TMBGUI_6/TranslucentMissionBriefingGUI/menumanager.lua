
if not TranslucentMissionBriefingGUI then
	log("[TranslucentMissionBriefingGUI] Error: Failed to create Mod Options menu, aborting")
	return
end

if not MenuCallbackHandler then
	log("[TranslucentMissionBriefingGUI] Error: MenuCallbackHandler is nil, aborting")
	return
end

local function AddModOptions(menu_manager)
	if menu_manager == nil then
		return
	end

	MenuCallbackHandler.TranslucentMissionBriefingGUI_SaveSettings = function(node)
		TranslucentMissionBriefingGUI:Save()
	end

	MenuCallbackHandler.TranslucentMissionBriefingGUI_ToggleFadeElements = function(self, item)
		TranslucentMissionBriefingGUI.Prefs.FadeElements = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.TranslucentMissionBriefingGUI_SetFadeDuration = function(self, item)
		local TranslucentMissionBriefingGUI = _G.TranslucentMissionBriefingGUI

		local value = TranslucentMissionBriefingGUI.RoundToDecimalPrecision(item:value(), 1)
		TranslucentMissionBriefingGUI.Prefs.FadeDuration = value
		-- Force the slider's numeric display to always show the actual, rounded value being used
		item:set_value(value)
	end

	MenuCallbackHandler.TranslucentMissionBriefingGUI_ToggleAutoHideBackground = function(self, item)
		TranslucentMissionBriefingGUI.Prefs.AutoHideBackground = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.TranslucentMissionBriefingGUI_Reset = function(self, item)
		local TranslucentMissionBriefingGUI = _G.TranslucentMissionBriefingGUI

		-- Zero everything out
		for name, __ in pairs(TranslucentMissionBriefingGUI.Prefs) do
			TranslucentMissionBriefingGUI.Prefs[name] = nil
		end
		-- Fill in the missing preferences with default values
		for key, value in pairs(TranslucentMissionBriefingGUI.DefPrefs) do
			if TranslucentMissionBriefingGUI.Prefs[key] == nil then
				TranslucentMissionBriefingGUI.Prefs[key] = value
			end
		end
		-- Force the save file to be overwritten with the default values as well
		TranslucentMissionBriefingGUI:Save()
		-- Update all GUI controls to match. Adapted from Menu:ResetItemsToDefaultValue() in mods/base/req/menus.lua
		for __, node in ipairs(item._parameters.gui_node.row_items) do
			for name, value in pairs(TranslucentMissionBriefingGUI.Prefs) do
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

	MenuHelper:LoadFromJsonFile(TranslucentMissionBriefingGUI.ModOptions, TranslucentMissionBriefingGUI, TranslucentMissionBriefingGUI.Prefs)
end
Hooks:Add("MenuManagerInitialize", "TranslucentMissionBriefingGUI_AddModOptions", AddModOptions)

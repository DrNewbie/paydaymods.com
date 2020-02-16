
if not WaypointTweaks then
	log("[WaypointTweaks] menumanager.lua | Error: Failed to create Mod Options menu, aborting")
	return
end

if not MenuCallbackHandler then
	log("[WaypointTweaks] menumanager.lua | Error: MenuCallbackHandler is nil, aborting")
	return
end

-- Removes all Escape menu text on the left side, taken from Armithaig's versatile Simple Voice Commands mod
Hooks:Add("MenuComponentManagerPreSetActiveComponents", "WaypointTweaks_RemoveActiveComponents", function(component_manager, components, node)
	if WaypointTweaks.InFocus then
		for i = table.size(components), 1, -1 do
			table.remove(components, i);
		end
	end
end)

local places = {
	"waypoints",
	"stored_waypoints"
}

local function AddModOptions(menu_manager)
	if menu_manager == nil then
		return
	end

	MenuCallbackHandler.WaypointTweaks_SaveSettings = function(node)
		WaypointTweaks:Save()
	end

	-- Taken from Armithaig's versatile Simple Voice Commands mod
	MenuCallbackHandler.WaypointTweaks_Focus = function(node, focus)
		WaypointTweaks.InFocus = focus
	end

	MenuCallbackHandler.WaypointTweaks_SetDuration = function(self, item)
		local WaypointTweaks = _G.WaypointTweaks

		local value = item:value()
		WaypointTweaks.Prefs.Duration = value
		-- Retroactively apply the change to all existing waypoints
		local hud = WaypointTweaks.Hud
		if hud ~= nil then
			local count = #places
			for i = 1, count do
				local waypoints = hud[places[i]]
				if waypoints ~= nil then
					for __, instance in pairs(waypoints) do
						instance.move_speed = value
					end
				end
			end
		end
	end

	MenuCallbackHandler.WaypointTweaks_SetRadius = function(self, item)
		local WaypointTweaks = _G.WaypointTweaks
		local Application = _G.Application

		local value = WaypointTweaks.RoundToNearest(item:value())
		WaypointTweaks.Prefs.Radius = value
		-- Force the slider's numeric display to always show the actual, rounded value being used
		item:set_value(value)

		-- Retroactively apply the change to all existing waypoints
		local hud = WaypointTweaks.Hud
		if hud ~= nil then
			local count = #places
			for i = 1, count do
				local waypoints = hud[places[i]]
				if waypoints ~= nil then
					for __, instance in pairs(waypoints) do
						instance.radius = value
					end
				end
			end
		end
		if WaypointTweaks.HUDManager ~= nil and Application:paused() then
			-- 0.016 assumes 60 frames per second (1 sec / 60 frames = time taken per frame). Not that it matters much here, anyway...
			WaypointTweaks.HUDManager:_update_waypoints(Application:time(), 0.016)
		end
	end

	MenuCallbackHandler.WaypointTweaks_Reset = function(self, item)
		local WaypointTweaks = _G.WaypointTweaks
		-- Zero everything out
		for name, __ in pairs(WaypointTweaks.Prefs) do
			WaypointTweaks.Prefs[name] = nil
		end
		-- Fill in the missing preferences with default values
		for key, value in pairs(WaypointTweaks.DefPrefs) do
			if WaypointTweaks.Prefs[key] == nil then
				WaypointTweaks.Prefs[key] = value
			end
		end
		-- Force the save file to be overwritten with the default values as well
		WaypointTweaks:Save()
		-- Update all GUI controls to match. Adapted from Menu:ResetItemsToDefaultValue() in mods/base/req/menus.lua
		for __, node in ipairs(item._parameters.gui_node.row_items) do
			for name, value in pairs(WaypointTweaks.Prefs) do
				-- FIXME: This does not account for cases where there is a duplicate segment within a name (e.g. one option named
				-- 'somename' and another named 'somenameextended' causes the latter's default value to get ignored)
				if node.item._parameters.name:find(utf8.to_lower(name)) ~= nil then
					if node.item.set_value then
						if node.item._type == "toggle" then
							node.item:set_value(value and "on" or "off")
						else
							node.item:set_value(value)
						end
					end
					-- Needed for sliders that perform rounding and toggle controls that perform refreshes
					node.item:trigger()
					break
				end
			end
		end
		-- Force the sliders to be redrawn
		managers.viewport:resolution_changed()

		-- Apply the change to all existing waypoints
		local hud = WaypointTweaks.Hud
		if hud ~= nil then
			local duration = WaypointTweaks.Prefs.Duration
			local radius = WaypointTweaks.Prefs.Radius
			local count = #places
			for i = 1, count do
				local waypoints = hud[places[i]]
				if waypoints ~= nil then
					for __, instance in pairs(waypoints) do
						instance.move_speed = duration
						instance.radius = radius
					end
				end
			end
		end
		-- Update all waypoint positions
		if WaypointTweaks.HUDManager ~= nil and Application:paused() then
			WaypointTweaks.HUDManager:_update_waypoints(Application:time(), 0.016)
		end
	end

	MenuHelper:LoadFromJsonFile(WaypointTweaks.ModOptions, WaypointTweaks, WaypointTweaks.Prefs)
end
Hooks:Add("MenuManagerInitialize", "WaypointTweaks_AddModOptions", AddModOptions)

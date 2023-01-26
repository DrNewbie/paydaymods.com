
if WaypointTweaks_HUDManager_Hooked then
	return
else
	WaypointTweaks_HUDManager_Hooked = true
end

local _init_player_hud_values_actual = HUDManager._init_player_hud_values
function HUDManager:_init_player_hud_values(...)
	_init_player_hud_values_actual(self, ...)

	local WaypointTweaks = _G.WaypointTweaks
	if WaypointTweaks ~= nil then
		WaypointTweaks.HUDManager = self
		WaypointTweaks.Hud = self._hud
	end
end

local add_waypoint_actual = HUDManager.add_waypoint
function HUDManager:add_waypoint(id, ...)
	add_waypoint_actual(self, id, ...)

	local WaypointTweaks = _G.WaypointTweaks
	if WaypointTweaks ~= nil then
		local Prefs = WaypointTweaks.Prefs
		local hud = self._hud
		local instance = hud.waypoints[id]
		if instance ~= nil then
			instance.move_speed = Prefs.Duration
			instance.radius = Prefs.Radius
		else
			instance = hud.stored_waypoints[id]
			if instance ~= nil then
				instance.move_speed = Prefs.Duration
				instance.radius = Prefs.Radius
			end
		end
	end
end

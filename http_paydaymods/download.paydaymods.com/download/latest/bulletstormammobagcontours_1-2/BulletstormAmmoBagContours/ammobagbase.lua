
if BulletstormAmmoBagContours_AmmoBagBase_Hooked then
	return
else
	BulletstormAmmoBagContours_AmmoBagBase_Hooked = true
end

local setup_actual = AmmoBagBase.setup
function AmmoBagBase:setup(ammo_upgrade_lvl, bullet_storm_level, ...)
	setup_actual(self, ammo_upgrade_lvl, bullet_storm_level, ...)

	if not bullet_storm_level or bullet_storm_level < 1 then
		return
	end

	local contourtype = "bulletstorm_ammobag" .. tostring(bullet_storm_level)

	local tweak_data = _G.tweak_data
	if tweak_data == nil or tweak_data.contour == nil then
		log("[BulletstormAmmoBagContours] AmmoBagBase:setup() | Error: tweak_data or tweak_data.contour is nil, aborting")
		return
	end

	if tweak_data.contour[contourtype] == nil then
		log(string.format("[BulletstormAmmoBagContours] AmmoBagBase:setup() | Error: tweak_data.contour.%s is nil, aborting", contourtype))
		return
	end

	if not alive(self._unit) then
		log("[BulletstormAmmoBagContours] AmmoBagBase:setup() | Error: self._unit is nil or invalid, aborting")
		return
	end

	local interactionext = self._unit:interaction()
	if interactionext == nil then
		log("[BulletstormAmmoBagContours] AmmoBagBase:setup() | Error: self._unit:interaction() is nil, aborting")
		return
	end

	local interactionexttweakdata = interactionext._tweak_data
	if interactionexttweakdata == nil then
		log("[BulletstormAmmoBagContours] AmmoBagBase:setup() | Error: self._unit:interaction()._tweak_data is nil, aborting")
		return
	end

	-- Do not pollute the global tweak_data.interaction table with the changes (doing so would eventually affect /all/ ammo
	-- bags, not just Bulletstorm-enabled ones)
	interactionext._tweak_data = clone(interactionexttweakdata)
	interactionext._tweak_data.contour = contourtype
	interactionext._tweak_data.contour_preset = nil
	interactionext._tweak_data.contour_preset_selected = nil
	-- Force an immediate contour refresh
	interactionext:set_contour("standard_color")
end

local tweak_data = _G.tweak_data
if tweak_data ~= nil and tweak_data.contour ~= nil then
	if tweak_data.contour.bulletstorm_ammobag1 ~= nil then
		log("[BulletstormAmmoBagContours] tweak_data | Warning: tweak_data.contour.bulletstorm_ammobag1 already exists, replacing existing contents with a new table")
	end
	tweak_data.contour.bulletstorm_ammobag1 = {}
	tweak_data.contour.bulletstorm_ammobag1.standard_color = Vector3(0.25, 0.5, 1)
	tweak_data.contour.bulletstorm_ammobag1.selected_color = Vector3(1, 1, 1)
	if tweak_data.contour.bulletstorm_ammobag2 ~= nil then
		log("[BulletstormAmmoBagContours] tweak_data | Warning: tweak_data.contour.bulletstorm_ammobag2 already exists, replacing existing contents with a new table")
	end
	tweak_data.contour.bulletstorm_ammobag2 = {}
	tweak_data.contour.bulletstorm_ammobag2.standard_color = Vector3(1, 0, 1)
	tweak_data.contour.bulletstorm_ammobag2.selected_color = Vector3(1, 1, 1)
end


if UppersFAKContours_FirstAidKitBase_Hooked then
	return
else
	UppersFAKContours_FirstAidKitBase_Hooked = true
end

local Add_actual = FirstAidKitBase.Add
function FirstAidKitBase.Add(obj, ...)
	Add_actual(obj, ...)

	local tweak_data = _G.tweak_data
	if tweak_data == nil or tweak_data.contour == nil then
		log("[UppersFAKContours] FirstAidKitBase.Add() | Error: tweak_data or tweak_data.contour is nil, aborting")
		return
	end

	if tweak_data.contour.uppers_fak == nil then
		log("[UppersFAKContours] FirstAidKitBase.Add() | Error: tweak_data.contour.uppers_fak is nil, aborting")
		return
	end

	if obj == nil or obj._unit == nil then
		log("[UppersFAKContours] FirstAidKitBase.Add() | Error: obj or obj._unit is nil, aborting")
		return
	end

	local interactionext = obj._unit:interaction()
	if interactionext == nil then
		log("[UppersFAKContours] FirstAidKitBase.Add() | Error: obj._unit:interaction() is nil, aborting")
		return
	end

	local interactionexttweakdata = interactionext._tweak_data
	if interactionexttweakdata == nil then
		log("[UppersFAKContours] FirstAidKitBase.Add() | Error: obj._unit:interaction()._tweak_data is nil, aborting")
		return
	end

	-- Do not pollute the global tweak_data.interaction table with the changes (doing so would eventually affect /all/ FAKs, not
	-- just Uppers-enabled ones)
	interactionext._tweak_data = clone(interactionexttweakdata)
	interactionext._tweak_data.contour = "uppers_fak"
	interactionext._tweak_data.contour_preset = nil
	interactionext._tweak_data.contour_preset_selected = nil
	-- Force an immediate contour refresh
	interactionext:set_contour("standard_color")
end

local tweak_data = _G.tweak_data
if tweak_data ~= nil and tweak_data.contour ~= nil then
	tweak_data.contour.uppers_fak = {}
	tweak_data.contour.uppers_fak.standard_color = Vector3(0.25, 0.5, 1)
	tweak_data.contour.uppers_fak.selected_color = Vector3(1, 1, 1)
end

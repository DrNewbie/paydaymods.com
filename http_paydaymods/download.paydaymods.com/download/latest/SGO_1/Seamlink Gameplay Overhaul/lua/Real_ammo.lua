if not SGO or not SGO.settings.use_ramm then return end
if SystemFS:exists("mods/WolfHUD/mod.txt") or SystemFS:exists("mods/WolfHUD-master/mod.txt") or SystemFS:exists("mods/SydneyHUD/mod.txt") then return end
function HUDTeammate:set_ammo_amount_by_type(type, max_clip, current_clip, current_left, max)
	local weapon_panel = self._player_panel:child("weapons_panel"):child(type .. "_weapon_panel")
	weapon_panel:set_visible(true)
	local total_left = current_left - current_clip
	local col
	if total_left < 0 then
		total_left = current_left
	end
	local ammo_clip = weapon_panel:child("ammo_clip")
	local zero = current_clip < 10 and "00" or current_clip < 100 and "0" or ""
	ammo_clip:set_text(zero .. tostring(current_clip))
	if current_clip <= math.round(max_clip / 4) and current_clip ~= 0 then
		col = Color(1, 0.9, 0.9, 0.3)
	elseif current_clip <= 0 then
		col = Color(1, 0.9, 0.3, 0.3)
	else
		col = Color.white
	end
	ammo_clip:set_color(col)
	ammo_clip:set_range_color(0, string.len(zero), col:with_alpha(0.5))
	local ammo_total = weapon_panel:child("ammo_total")
	local zerro = total_left < 10 and "00" or total_left < 100 and "0" or ""
	if total_left <= math.round(max_clip / 2) and total_left ~= 0 then
		col = Color(1, 0.9, 0.9, 0.3)
	elseif total_left <= 0 then
		col = Color(1, 0.9, 0.3, 0.3)
	else
		col = Color.white
	end
	ammo_total:set_text(zerro .. tostring(total_left))
	ammo_total:set_color(col)
	ammo_total:set_range_color(0, string.len(zerro), col:with_alpha(0.5))
end
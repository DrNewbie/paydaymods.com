function UnitNetworkHandler:set_weapon_gadget_color(unit, red, green, blue, sender)
	if not self._verify_character_and_sender(unit, sender) then
		return
	end

	if red and green and blue then 
		local threshold = 0.66 --can be changed at will
--		log("No Red Lasers: Filtered a red player laser! Attempted values " .. tostring(red) .. "|g:" .. tostring(green) .. "|b:" .. tostring(blue) .. " from sender" .. tostring(sender))
		if red * threshold > green + blue then --i'm only sanity checking my own stuff. if the other stuff crashes that's ovk's fault
			red = 1
			green = 51
			blue = 1
			--take that you red-laser-using SCUM
		end
	end
	
	unit:inventory():sync_weapon_gadget_color(Color(red / 255, green / 255, blue / 255))
end
local Lasers = Lasers or _G.LasersPlus

Hooks:PostHook(UnitNetworkHandler, "set_weapon_gadget_color", "UnitNetworkHandler_setweapongadgetcolor_lasersplus", function(self,unit,red,green,blue,sender)
	if not self._verify_character_and_sender(unit, sender) then
		return
	end
	local col = Color(red/255,green/255,blue/255):with_alpha(math.max(red,green,blue)/255)
	--since all weapon laser displays are calculated in lasers.lua,
	--this should only be used to get vanilla laser colors, not block them
	local peer = self._verify_sender(sender)
	Lasers:SaveGadgetVanillaColor(unit,col)
end)

--[[
Hooks:PostHook(UnitNetworkHandler,"set_weapon_gadget_state","UnitNetworkHandler_set_weapon_gadget_state_lasersplus",function(self,unit,gadget_state,sender)
	OffyLib:c_log("Hewwo? unitnetworkhandler set_weapon_gadget_state")
end)
--]]
Hooks:PostHook(PlayerStandard,"_toggle_gadget","lp_playerstandard_toggle_gadget",function(self,weap_base)
--	Lasers:SaveGadgetVanillaColor(laser._unit,Lasers:ConvertToBLTColor(laser:color()))
	
	local own_strobe = LasersPlus:GetSavedPlayerStrobe()
	
	if LasersPlus:IsNetworkingEnabled() then
		LuaNetworking:SendToPeers( LasersPlus.LuaNetID, LuaNetworking:ColourToString(LasersPlus:GetOwnLaserColor()))
		if own_strobe then
			LuaNetworking:SendToPeers( LasersPlus.LuaNetID, own_strobe)
		end
	end
	
end)
--[[
function PlayerStandard:_toggle_gadget(weap_base)
	local gadget_index = 0

	if weap_base.toggle_gadget and weap_base:has_gadget() and weap_base:toggle_gadget(self) then
		gadget_index = weap_base:current_gadget_index()

		self._unit:network():send("set_weapon_gadget_state", weap_base._gadget_on)

		local gadget = weap_base:get_active_gadget()

		if gadget and gadget.color then
			local col = gadget:color()

			self._unit:network():send("set_weapon_gadget_color", col.r * 255, col.g * 255, col.b * 255)
		end

		if alive(self._equipped_unit) then
			managers.hud:set_ammo_amount(weap_base:selection_index(), weap_base:ammo_info())
		end
	end
end
--]]
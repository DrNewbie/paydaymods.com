
--todo sanity check some stuff

local equipped_unit = managers.player:get_current_state()._equipped_unit
if equipped_unit and equipped_unit:base() then 
--	managers.hud:set_firemode_safety()
	equipped_unit:base():set_weapon_safety()
end

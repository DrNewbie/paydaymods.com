local orig_equip_selection = PlayerInventory.equip_selection
function PlayerInventory:equip_selection(...)
	local result = orig_equip_selection(self,...)
	if TacticalLean.current_lean and result then --and managers.player and alive(managers.player:local_player()) and result and Utils:IsInHeist() then 
		TacticalLean:update_lean_stance()
	end
	return result
end
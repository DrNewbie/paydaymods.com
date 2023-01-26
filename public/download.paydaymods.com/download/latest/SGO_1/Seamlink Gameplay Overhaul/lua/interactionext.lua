if not SGO or not SGO.settings.use_hefty then return end
function can_pickup(player, item)
	return Network:is_server() and item
		and managers.player:player_unit()==player
		and managers.player:can_pickup_equipment(item)
	end

function UseInteractionExt:can_select(player)
	return BaseInteractionExt.can_select(self, player)
		or can_pickup(player, self._tweak_data.special_equipment_block)
	end

function UseInteractionExt:can_interact(player)
	return BaseInteractionExt.can_interact(self, player)
		or can_pickup(player, self._tweak_data.special_equipment_block)
	end
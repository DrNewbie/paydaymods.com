local orig_heal = MedicDamage.heal_unit
function MedicDamage:heal_unit(unit, override_cooldown,...)
	if unit and managers.enemy:is_civilian(unit) then 
		
		--i initially forgot to add the medic heal cooldown upon healing civs,
		--and also did disable healing civs if medic is on heal cooldown,
		--but now I realise it's actually better if
		--medics don't have a cooldown for healing civs, since it actually makes combat easier,
		--not harder, because medics are animlocked while helping civs
		--maybe this'll make up for all the times medics chose to ignore the dead and dying civs		
		local civ_dmg = unit:character_damage()
		civ_dmg._health = civ_dmg._HEALTH_INIT
		
		if not self._unit:character_damage():dead() then
			local action_data = {
				body_part = 3,
				type = "heal",
				client_interrupt = Network:is_client() and true or false
			}

			self._unit:movement():action_request(action_data)
		end
		
		managers.modifiers:run_func("OnEnemyHealed", self._unit, unit)
		managers.network:session():send_to_peers("sync_medic_heal", self._unit) --todo make sure this uh... doesn't crash others
		--if it does, i'll have to write a custom sync event via lua networking
		--and only send it to people who have the mod
		return true
	else
		return orig_heal(self,unit,override_cooldown,...)
	end
end
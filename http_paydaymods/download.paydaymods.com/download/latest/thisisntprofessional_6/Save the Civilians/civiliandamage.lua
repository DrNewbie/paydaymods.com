function CivilianDamage:get_nearby_medic(unit) --normally in enemymanager
	if not unit then
		return nil --same as just return but ok
	end

	local enemies = World:find_units_quick(unit, "sphere", unit:position(), tweak_data.medic.radius, managers.slot:get_mask("enemies"))

	for _, enemy in ipairs(enemies) do
		if enemy:base():has_tag("medic") then
			return enemy
		end
	end

	return nil
end

function CivilianDamage:check_medic_heal()
	local _unit = self._unit
	if not _unit then
		return false
	end
	local medic = self:get_nearby_medic(_unit)
	if medic and _unit:contour() then
		_unit:contour():add("medic_heal", true)
		_unit:contour():flash("medic_heal", 0.2)
	end
	return medic and medic:character_damage():heal_unit(self._unit)
end
 
local orig_oncivdamaged = CivilianDamage._on_damage_received 
function CivilianDamage:_on_damage_received(damage_info,...)
	local result 
	if self._unit then
		result = self:check_medic_heal()
		--YEAH SO TURNS OUT I WAS CALLING THE CLASS NAME INSTEAD OF SELF. 
		--WHICH IS WHY IT WASN'T RETURNING A CONFIRMATION OF WHETHER IT WAS WORKING
	end
--[[ no longer needed
	local attacker_unit = damage_info and damage_info.attacker_unit
	if attacker_unit:base().sentry_gun then
		attacker_unit = attacker_unit:base():get_owner() 
		return --todo make sure sentries cannot kill civs
	end
--]]
	if not result then 
		return orig_oncivdamaged(self,damage_info,...)
	end
end

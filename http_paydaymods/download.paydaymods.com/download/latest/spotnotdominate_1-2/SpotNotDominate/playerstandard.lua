
local actual_get_interaction_target = PlayerStandard._get_interaction_target
function PlayerStandard:_get_interaction_target(char_table, ...)
	-- From PlayerStandard:_get_intimidation_action()
	local unit_type_enemy = 0

	-- Search the table for special units. This is done here instead of PlayerStandard:_add_unit_to_char_table() as that gets
	-- called for every enemy unit in the level per interaction, whereas this gets called once for every interaction (and
	-- char_table only contains units the player is able to interact with, which is typically a handful of units). 
	for index, char in pairs(char_table) do
		-- char.unit:base():char_tweak() is CopBase:char_tweak()
		if char.unit_type == unit_type_enemy and char.unit:base():char_tweak().priority_shout then
			-- This is a special unit, ensure it has among the highest priorities (the 'winning' unit will still be selected
			-- based on distance, but it will be only competing among special units instead of being trumped by domination
			-- attempts, which have a priority divisor of 5000 as opposed to marking having a priority divisor of 0.01). Note
			-- that the smaller the value of inv_wgt, the higher the priority (see PlayerStandard:_add_unit_to_char_table(),
			-- where the priority parameter is used as the divisor and inv_wgt is the resulting quotient). Do not set this to a
			-- static value (e.g. 0 or -1) as doing so breaks prioritization among specials when multiple specials are present in
			-- the same immediate area. So, how did this magic 0.0000001 number appear? It is derived from reversing the initial
			-- 0.01 priority divisor for marking specials, then applying an additional 100000 divisor to boost its priority to
			-- match that of shouting at escort targets. The result is inv_wgt * 0.01 / 100000 = inv_wgt * 0.01 * 0.00001
			-- = inv_wgt * 0.0000001
			char_table[index].inv_wgt = char_table[index].inv_wgt * 0.0000001
		end
	end

	return actual_get_interaction_target(self, char_table, ...)
end

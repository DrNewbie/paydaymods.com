function BaseInteractionExt:_get_timer()
	local modified_timer = self:_get_modified_timer()
	if modified_timer then
		return modified_timer
	end
	local multiplier = 1
	if self._tweak_data.upgrade_timer_multiplier then
		multiplier = multiplier * managers.player:upgrade_value(self._tweak_data.upgrade_timer_multiplier.category, self._tweak_data.upgrade_timer_multiplier.upgrade, 1)
	end
	if self._tweak_data.upgrade_timer_multipliers then
		for _, upgrade_timer_multiplier in pairs(self._tweak_data.upgrade_timer_multipliers) do
			multiplier = multiplier * managers.player:upgrade_value(upgrade_timer_multiplier.category, upgrade_timer_multiplier.upgrade, 1)
		end
	end
	if managers.player:has_category_upgrade("player", "level_interaction_timer_multiplier") then
		local data = managers.player:upgrade_value("player", "level_interaction_timer_multiplier", 1)
		multiplier = multiplier * data
	end
	return self:_timer_value() * multiplier
end
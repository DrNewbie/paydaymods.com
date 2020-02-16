if not SGO or not SGO.settings.use_run then return end
function PlayerMovement:is_stamina_drained()
	return false
end
function PlayerMovement:is_above_stamina_threshold()
	return self._stamina >= 0
end 
MultiProfileManager = MultiProfileManager or class()
function MultiProfileManager:_check_amount()
	local wanted_amount = 30 --Changes Amount of profile sets.(Default: 5)
	if not self:current_profile() then
		self:save_current()
	end
	if wanted_amount < self:profile_count() then
		table.crop(self._global._profiles, wanted_amount)
		self._global._current_profile = math.min(self._global._current_profile, wanted_amount)
	elseif wanted_amount > self:profile_count() then
		local prev_current = self._global._current_profile
		self._global._current_profile = self:profile_count()
		while wanted_amount > self._global._current_profile do
			self._global._current_profile = self._global._current_profile + 1
			self:save_current()
		end
		self._global._current_profile = prev_current
	end
end

Hooks:PostHook( PlayerTweakData, "_init_new_stances", "DisabledBreathingEffect", function(self)
	for _, weap in pairs(self.stances) do
		if weap.steelsight.shoulders.translation then
			weap.steelsight.shakers.breathing.amplitude = 0
		end
	end
end )
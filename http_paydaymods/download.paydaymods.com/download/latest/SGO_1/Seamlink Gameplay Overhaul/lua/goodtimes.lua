if not SGO or not SGO.settings.use_insp then return end
local old_init = UpgradesTweakData.init
Hooks:PostHook(UpgradesTweakData, "init", "SGO_goodtimes", function(self, tweak_data)
	self.morale_boost_base_cooldown = 0.1
	self.values.cooldown.long_dis_revive = {
		{1, 0.1}
	}
end)
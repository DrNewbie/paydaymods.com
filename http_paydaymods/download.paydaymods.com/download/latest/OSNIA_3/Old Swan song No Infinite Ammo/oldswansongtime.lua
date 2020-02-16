if RequiredScript == "lib/tweak_data/upgradestweakdata" then
	local original_upgradetweakdata_init = UpgradesTweakData.init
	function UpgradesTweakData:init(tweak_data)
		original_upgradetweakdata_init(self, tweak_data)
		self.values.temporary.berserker_damage_multiplier = 
		{
			{
				1,
				3
			},
			{
				1,
				9
			}
		}
	end
end
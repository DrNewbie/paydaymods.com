if RequiredScript == "lib/tweak_data/skilltreetweakdata" then
	local original_skilltree_init = SkillTreeTweakData.init
	function SkillTreeTweakData:init(tweak_data)
		original_skilltree_init(self, tweak_data)
		self.skills.perseverance = 
		{
			["name_id"] = "menu_perseverance_beta",
			["desc_id"] = "menu_perseverance_beta_desc",
			["icon_xy"] = {5, 12},
			[1] = 
			{
				upgrades = 
				{
					"temporary_berserker_damage_multiplier_1"
				},
				cost = self.costs.hightier
			},
			[2] = 
			{
				upgrades = 
				{
					"temporary_berserker_damage_multiplier_2"
				},
				cost = self.costs.hightierpro
			}	
		}
	end
end
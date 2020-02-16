if not SGO or not SGO.settings.use_inva then return end
if RequiredScript == "lib/tweak_data/blackmarkettweakdata" then
	function BlackMarketTweakData:_init_armors()
		self.armors = {}
		self.armors.level_1 = {}
		self.armors.level_1.name_id = "bm_armor_level_1"
		self.armors.level_1.sequence = "var_model_01"
		self.armors.level_1.upgrade_level = 1
		self.armors.level_2 = {}
		self.armors.level_2.name_id = "bm_armor_level_2"
		self.armors.level_2.sequence = "var_model_01"
		self.armors.level_2.upgrade_level = 2
		self.armors.level_3 = {}
		self.armors.level_3.name_id = "bm_armor_level_3"
		self.armors.level_3.sequence = "var_model_01"
		self.armors.level_3.upgrade_level = 3
		self.armors.level_4 = {}
		self.armors.level_4.name_id = "bm_armor_level_4"
		self.armors.level_4.sequence = "var_model_01"
		self.armors.level_4.upgrade_level = 4
		self.armors.level_5 = {}
		self.armors.level_5.name_id = "bm_armor_level_5"
		self.armors.level_5.sequence = "var_model_01"
		self.armors.level_5.upgrade_level = 5
		self.armors.level_6 = {}
		self.armors.level_6.name_id = "bm_armor_level_6"
		self.armors.level_6.sequence = "var_model_01"
		self.armors.level_6.upgrade_level = 6
		self.armors.level_7 = {}
		self.armors.level_7.name_id = "bm_armor_level_7"
		self.armors.level_7.sequence = "var_model_01"
		self.armors.level_7.upgrade_level = 7
		self:_add_desc_from_name_macro(self.armors)
	end
end
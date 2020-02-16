local Old_UTD = UpgradesTweakData._init_pd2_values
function UpgradesTweakData:_init_pd2_values(tweak_data)
		Old_UTD(self,tweak_data)
		self:YOMC_ModdedSkills()
end

function UpgradesTweakData:YOMC_ModdedSkills()
		self.values.team.weapon.recoil_index_addend = {1}
		self.skill_descs.leadership.multibasic = "4"
		self.skill_descs.leadership.multipro = "4"
		self.skill_descs.sharpshooter.multibasic = "4"
		self.skill_descs.sharpshooter.multipro = "4"
		self.values.akimbo.damage_addend = {1.5}
end


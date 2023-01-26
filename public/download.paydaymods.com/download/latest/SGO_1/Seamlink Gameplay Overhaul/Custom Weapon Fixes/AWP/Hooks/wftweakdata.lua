Hooks:PostHook( WeaponTweakData, "init", "AwpModInit", function(self)
if not SystemFS:exists("mods/DMCWO/mod.txt") and not SystemFS:exists("mods/Seamlink Gameplay Overhaul/mod.txt") then
	if self.awpgear then 
		self.awpgear.stats_modifiers = {damage = 8}
		self.awpgear.AMMO_PICKUP = {5, 10}
		self.awpgear.CLIP_AMMO_MAX = 5
		self.awpgear.NR_CLIPS_MAX = 4
	end

end)
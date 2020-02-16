local old_init = TweakData.init
function TweakData:init(tweak_data)
    old_init(self, tweak_data)
	
self.weapon.stats.extra_ammo = {}
	for i = -10, 1000, 2 do
		table.insert(self.weapon.stats.extra_ammo, i)
end
self.weapon.stats.total_ammo_mod = {}
	for i = -100, 2000, 5 do
		table.insert(self.weapon.stats.total_ammo_mod, i / 100)
end
self.weapon.stats.value = {}
	for i = 0, 10, 7200 do
		table.insert(self.weapon.stats.value, i / 100)
end
end
-- accuracy stats are multiplied by about 3.6

local old_init = WeaponTweakData.init

function WeaponTweakData:init(tweak_data)
    old_init(self, tweak_data)

-- Pistols --

self.b92fs.stats.damage = 37
self.b92fs.fire_mode_data.fire_rate = 0.130

self.glock_17.stats.damage = 36
self.glock_17.fire_mode_data.fire_rate = 0.142

self.glock_18c.stats.damage = 35

self.ppk.stats.damage = 35
self.ppk.fire_mode_data.fire_rate = 0.150

self.g22c.stats.damage = 41
self.g22c.fire_mode_data.fire_rate = 0.157

self.p226.stats.damage = 45
self.p226.fire_mode_data.fire_rate = 0.137

self.hs2000.stats.damage = 42
self.hs2000.stats.recoil = 7
self.hs2000.fire_mode_data.fire_rate = 0.166

self.colt_1911.stats.damage = 50
self.colt_1911.stats.recoil = 5
self.colt_1911.fire_mode_data.fire_rate = 0.166
self.colt_1911.can_shoot_through_wall = true

self.usp.stats.damage = 47
self.usp.fire_mode_data.fire_rate = 0.163
self.usp.can_shoot_through_wall = true

self.deagle.CLIP_AMMO_MAX = 10
self.deagle.AMMO_MAX = 40
self.deagle.stats.damage = 57
self.deagle.stats.spread = 20
self.deagle.stats.recoil = 0
self.deagle.fire_mode_data.fire_rate = 0.2
self.deagle.can_shoot_through_wall = true

self.sparrow.CLIP_AMMO_MAX = 14
self.sparrow.AMMO_MAX = 112
self.sparrow.stats.damage = 46
self.sparrow.stats.spread = 15
self.sparrow.stats.recoil = 18
self.sparrow.fire_mode_data.fire_rate = 0.160
self.sparrow.can_shoot_through_wall = true

self.g26.stats.damage = 40
self.g26.CLIP_AMMO_MAX = 12
self.g26.fire_mode_data.fire_rate = 0.144

self.c96.stats.damage = 42
self.c96.fire_mode_data.fire_rate = 0.142

self.pl14.CLIP_AMMO_MAX = 15
self.pl14.AMMO_MAX = 112
self.pl14.stats.damage = 43
self.pl14.stats.spread = 12
self.pl14.stats.recoil = 19
self.pl14.fire_mode_data.fire_rate = 0.149

self.peacemaker.CLIP_AMMO_MAX = 6
self.peacemaker.AMMO_MAX = 30
self.peacemaker.stats.damage = 240
self.peacemaker.stats.spread = 22
self.peacemaker.stats.recoil = 0
self.peacemaker.stats.suppression = 7
self.peacemaker.fire_mode_data.fire_rate = 0.23
self.peacemaker.can_shoot_through_shield = true
self.peacemaker.can_shoot_through_wall = true

end
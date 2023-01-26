-- accuracy stats are multiplied by about 3.6

local old_init = WeaponTweakData.init

function WeaponTweakData:init(tweak_data)
    old_init(self, tweak_data)

-- Automatic Guns --

self.x_mp5.stats.extra_ammo = 6
self.x_mp5.stats.concealment = 24
self.x_mp5.stats.zoom = 3
self.x_mp5.stats.recoil = 16
self.x_mp5.stats.spread = 13
self.x_mp5.stats.damage = 35
self.x_mp5.AMMO_MAX = 180

end
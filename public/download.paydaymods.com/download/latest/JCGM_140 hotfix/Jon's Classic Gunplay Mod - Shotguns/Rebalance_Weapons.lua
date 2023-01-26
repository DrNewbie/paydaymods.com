-- accuracy stats are multiplied by about 3.6

local old_init = WeaponTweakData.init

function WeaponTweakData:init(tweak_data)
    old_init(self, tweak_data)

-- Shotguns --

self.b682.CLIP_AMMO_MAX = 2
self.b682.AMMO_MAX = 30
self.b682.stats.damage = 140
self.b682.stats.spread = 23
self.b682.stats.recoil = 8
self.b682.stats.suppression = 5
self.b682.fire_mode_data.fire_rate = 0.05
self.b682.can_shoot_through_shield = false
self.b682.AMMO_PICKUP = {1.75, 2}

self.ksg.fire_mode_data.fire_rate = 0.42

-- Automatic Shotguns --

self.benelli.CLIP_AMMO_MAX = 6
self.benelli.AMMO_MAX = 64
self.benelli.stats.damage = 54
self.benelli.stats.spread = 8
self.benelli.stats.recoil = 10
self.benelli.stats.suppression = 6
self.benelli.fire_mode_data.fire_rate = 0.15
self.benelli.can_shoot_through_shield = false
self.benelli.AMMO_PICKUP = {1, 2}

self.spas12.CLIP_AMMO_MAX = 6
self.spas12.AMMO_MAX = 60
self.spas12.stats.damage = 60
self.spas12.stats.spread = 9
self.spas12.stats.recoil = 9
self.spas12.stats.suppression = 4
self.spas12.fire_mode_data.fire_rate = 0.25
self.spas12.can_shoot_through_shield = false
self.spas12.AMMO_PICKUP = {1.25, 2}

self.saiga.CLIP_AMMO_MAX = 7
self.saiga.AMMO_MAX = 60
self.saiga.stats.damage = 90
self.saiga.stats.spread = 9
self.saiga.stats.recoil = 14
self.saiga.stats.suppression = 5
self.saiga.fire_mode_data.fire_rate = 0.1
self.saiga.can_shoot_through_shield = false
self.saiga.AMMO_PICKUP = {1, 3}

self.aa12.CLIP_AMMO_MAX = 8
self.aa12.AMMO_MAX = 60
self.aa12.stats.damage = 45
self.aa12.stats.spread = 9
self.aa12.stats.recoil = 10
self.aa12.stats.suppression = 4
self.aa12.fire_mode_data.fire_rate = 0.2
self.aa12.can_shoot_through_shield = false
self.aa12.AMMO_PICKUP = {1, 2}

self.striker.CLIP_AMMO_MAX = 12
self.striker.AMMO_MAX = 48
self.striker.stats.damage = 52
self.striker.stats.spread = 8
self.striker.stats.recoil = 15
self.striker.stats.suppression = 3
self.striker.fire_mode_data.fire_rate = 0.15
self.striker.can_shoot_through_shield = false
self.striker.AMMO_PICKUP = {1, 2}


end
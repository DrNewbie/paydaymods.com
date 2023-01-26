-- accuracy stats are multiplied by about 3.6

local old_init = WeaponTweakData.init

function WeaponTweakData:init(tweak_data)
    old_init(self, tweak_data)

-- LMGs --

self.hk21.CLIP_AMMO_MAX = 100
self.hk21.AMMO_MAX = 300
self.hk21.stats.damage = 72
self.hk21.stats.spread = 12
self.hk21.stats.recoil = 14
self.hk21.stats.suppression = 6
self.hk21.fire_mode_data.fire_rate = 0.125
self.hk21.can_shoot_through_shield = true
self.hk21.can_shoot_through_wall = true
self.hk21.AMMO_PICKUP = {1, 9}

self.mg42.CLIP_AMMO_MAX = 150
self.mg42.AMMO_MAX = 450
self.mg42.stats.damage = 65
self.mg42.stats.spread = 9
self.mg42.stats.recoil = 10
self.mg42.stats.suppression = 5
self.mg42.fire_mode_data.fire_rate = 0.054
self.mg42.can_shoot_through_shield = true
self.mg42.can_shoot_through_wall = true
self.mg42.AMMO_PICKUP = {1, 9}

self.rpk.CLIP_AMMO_MAX = 75
self.rpk.AMMO_MAX = 450
self.rpk.stats.damage = 58
self.rpk.stats.spread = 17
self.rpk.stats.recoil = 19
self.rpk.stats.suppression = 5
self.rpk.fire_mode_data.fire_rate = 0.1
self.rpk.can_shoot_through_shield = false
self.rpk.AMMO_PICKUP = {1, 10}

self.m249.CLIP_AMMO_MAX = 200
self.m249.AMMO_MAX = 400
self.m249.stats.damage = 50
self.m249.stats.spread = 7
self.m249.stats.recoil = 15
self.m249.stats.suppression = 6
self.m249.fire_mode_data.fire_rate = 0.075
self.m249.can_shoot_through_shield = false
self.m249.AMMO_PICKUP = {1, 12}

self.par.CLIP_AMMO_MAX = 100
self.par.AMMO_MAX = 300
self.par.stats.damage = 80
self.par.stats.spread = 19
self.par.stats.recoil = 1
self.par.stats.suppression = 6
self.par.fire_mode_data.fire_rate = 0.1
self.par.can_shoot_through_shield = true
self.par.can_shoot_through_wall = true
self.par.AMMO_PICKUP = {1, 9}


end
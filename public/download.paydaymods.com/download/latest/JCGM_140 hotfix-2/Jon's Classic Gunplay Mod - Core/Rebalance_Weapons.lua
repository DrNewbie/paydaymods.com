-- accuracy stats are multiplied by about 3.6

local old_init = WeaponTweakData.init

function WeaponTweakData:init(tweak_data)
    old_init(self, tweak_data)

-- SMGs --

self.m1928.CLIP_AMMO_MAX = 50
self.m1928.AMMO_MAX = 150
self.m1928.stats.damage = 46
self.m1928.stats.spread = 12
self.m1928.stats.recoil = 18
self.m1928.stats.suppression = 12
self.m1928.fire_mode_data.fire_rate = 0.075
self.m1928.can_shoot_through_shield = false
self.m1928.AMMO_PICKUP = {1, 5}

self.new_mp5.CLIP_AMMO_MAX = 30
self.new_mp5.AMMO_MAX = 160
self.new_mp5.stats.damage = 37
self.new_mp5.stats.spread = 13
self.new_mp5.stats.recoil = 20
self.new_mp5.stats.suppression = 18
self.new_mp5.fire_mode_data.fire_rate = 0.0857
self.new_mp5.can_shoot_through_shield = false
self.new_mp5.AMMO_PICKUP = {1, 6}

self.uzi.CLIP_AMMO_MAX = 32
self.uzi.AMMO_MAX = 128

self.olympic.CLIP_AMMO_MAX = 20

self.hajk.AMMO_MAX = 150
self.hajk.stats.damage = 40
self.hajk.AMMO_PICKUP = {1, 5}

self.akmsu.AMMO_MAX = 120
self.akmsu.stats.damage = 53
self.akmsu.AMMO_PICKUP = {1, 4}
self.akmsu.can_shoot_through_wall = true

-- AR15s --

self.amcar.CLIP_AMMO_MAX = 20
self.amcar.AMMO_MAX = 240
self.amcar.stats.damage = 32
self.amcar.stats.spread = 11
self.amcar.stats.recoil = 22
self.amcar.stats.suppression = 15
self.amcar.fire_mode_data.fire_rate = 0.1
self.amcar.can_shoot_through_shield = false
self.amcar.AMMO_PICKUP = {1, 6}

self.new_m4.CLIP_AMMO_MAX = 30
self.new_m4.AMMO_MAX = 150
self.new_m4.stats.damage = 35
self.new_m4.stats.spread = 12
self.new_m4.stats.recoil = 19
self.new_m4.stats.suppression = 14
self.new_m4.fire_mode_data.fire_rate = 0.0857
self.new_m4.can_shoot_through_shield = false
self.new_m4.AMMO_PICKUP = {1, 5}

self.m16.CLIP_AMMO_MAX = 18
self.m16.AMMO_MAX = 150
self.m16.stats.damage = 50
self.m16.stats.spread = 17
self.m16.stats.recoil = 20
self.m16.stats.suppression = 12
self.m16.fire_mode_data.fire_rate = 0.09
self.m16.can_shoot_through_shield = false
self.m16.AMMO_PICKUP = {1, 4}

-- Assault Rifles --

self.galil.CLIP_AMMO_MAX = 25
self.galil.AMMO_MAX = 150
self.galil.stats.damage = 60
self.galil.stats.spread = 16
self.galil.stats.recoil = 16
self.galil.stats.suppression = 14
self.galil.fire_mode_data.fire_rate = 0.09
self.galil.can_shoot_through_shield = false
self.galil.can_shoot_through_wall = true
self.galil.AMMO_PICKUP = {1, 4}

self.s552.CLIP_AMMO_MAX = 30
self.s552.AMMO_MAX = 180
self.s552.stats.damage = 37
self.s552.stats.spread = 16
self.s552.stats.recoil = 19
self.s552.stats.suppression = 16
self.s552.fire_mode_data.fire_rate = 0.083333333
self.s552.can_shoot_through_shield = false
self.s552.AMMO_PICKUP = {1, 5}

self.g36.CLIP_AMMO_MAX = 30
self.g36.AMMO_MAX = 180
self.g36.stats.damage = 37
self.g36.stats.spread = 18
self.g36.stats.recoil = 25
self.g36.stats.suppression = 15
self.g36.fire_mode_data.fire_rate = 0.0857
self.g36.can_shoot_through_shield = false
self.g36.AMMO_PICKUP = {1, 5}

self.ak5.CLIP_AMMO_MAX = 30
self.ak5.AMMO_MAX = 180
self.ak5.stats.damage = 36
self.ak5.stats.spread = 16
self.ak5.stats.recoil = 19
self.ak5.stats.suppression = 15
self.ak5.fire_mode_data.fire_rate = 0.0857
self.ak5.can_shoot_through_shield = false
self.ak5.AMMO_PICKUP = {1, 5}

-- Bullpup Rifles --

self.aug.CLIP_AMMO_MAX = 30
self.aug.AMMO_MAX = 180
self.aug.stats.damage = 35
self.aug.stats.spread = 15
self.aug.stats.recoil = 20
self.aug.stats.suppression = 12
self.aug.fire_mode_data.fire_rate = 0.09
self.aug.can_shoot_through_shield = false
self.aug.AMMO_PICKUP = {1, 5}

self.famas.CLIP_AMMO_MAX = 30
self.famas.AMMO_MAX = 180
self.famas.stats.damage = 38
self.famas.stats.spread = 15
self.famas.stats.recoil = 25
self.famas.stats.suppression = 16
self.famas.fire_mode_data.fire_rate = 0.0545454
self.famas.can_shoot_through_shield = false
self.famas.AMMO_PICKUP = {1, 5}

self.l85a2.CLIP_AMMO_MAX = 30
self.l85a2.AMMO_MAX = 180
self.l85a2.stats.damage = 38
self.l85a2.stats.spread = 16
self.l85a2.stats.recoil = 24
self.l85a2.stats.suppression = 17
self.l85a2.fire_mode_data.fire_rate = 0.075
self.l85a2.can_shoot_through_shield = false
self.l85a2.AMMO_PICKUP = {1, 5}

self.vhs.CLIP_AMMO_MAX = 30
self.vhs.AMMO_MAX = 180
self.vhs.stats.damage = 38
self.vhs.stats.spread = 16
self.vhs.stats.recoil = 19
self.vhs.stats.suppression = 14
self.vhs.fire_mode_data.fire_rate = 0.06666
self.vhs.can_shoot_through_shield = false
self.vhs.AMMO_PICKUP = {1, 5}

-- AKs --

self.akm.CLIP_AMMO_MAX = 30
self.akm.AMMO_MAX = 120
self.akm.stats.damage = 61
self.akm.stats.spread = 15
self.akm.stats.recoil = 11
self.akm.stats.suppression = 10
self.akm.fire_mode_data.fire_rate = 0.1
self.akm.can_shoot_through_shield = false
self.akm.can_shoot_through_wall = true
self.akm.AMMO_PICKUP = {1, 4}

self.akm_gold.CLIP_AMMO_MAX = 30
self.akm_gold.AMMO_MAX = 120
self.akm_gold.stats.damage = 63
self.akm_gold.stats.spread = 15
self.akm_gold.stats.recoil = 13
self.akm_gold.stats.suppression = 11
self.akm_gold.fire_mode_data.fire_rate = 0.11
self.akm_gold.can_shoot_through_shield = false
self.akm_gold.can_shoot_through_wall = true
self.akm_gold.AMMO_PICKUP = {1, 4}

self.ak74.CLIP_AMMO_MAX = 30
self.ak74.AMMO_MAX = 150
self.ak74.stats.damage = 40
self.ak74.stats.spread = 13
self.ak74.stats.recoil = 18
self.ak74.stats.suppression = 12
self.ak74.fire_mode_data.fire_rate = 0.09
self.ak74.can_shoot_through_shield = false
self.ak74.AMMO_PICKUP = {1, 5}

self.asval.CLIP_AMMO_MAX = 30
self.asval.AMMO_MAX = 150
self.asval.stats.damage = 42
self.asval.stats.spread = 17
self.asval.stats.recoil = 17
self.asval.stats.suppression = 50
self.asval.fire_mode_data.fire_rate = 0.0666
self.asval.can_shoot_through_shield = false
self.asval.can_shoot_through_wall = true
self.asval.AMMO_PICKUP = {1, 5}

-- Battle Rifles --

self.scar.CLIP_AMMO_MAX = 20
self.scar.AMMO_MAX = 100
self.scar.stats.damage = 75
self.scar.stats.spread = 19
self.scar.stats.recoil = 12
self.scar.stats.suppression = 7
self.scar.fire_mode_data.fire_rate = 0.1
self.scar.can_shoot_through_shield = false
self.scar.can_shoot_through_wall = true
self.scar.AMMO_PICKUP = {1, 4}

self.fal.CLIP_AMMO_MAX = 20
self.fal.AMMO_MAX = 100
self.fal.stats.damage = 71
self.fal.stats.spread = 19
self.fal.stats.recoil = 13
self.fal.stats.suppression = 6
self.fal.fire_mode_data.fire_rate = 0.09
self.fal.can_shoot_through_shield = false
self.fal.can_shoot_through_wall = true
self.fal.AMMO_PICKUP = {1, 4}

self.g3.CLIP_AMMO_MAX = 20
self.g3.AMMO_MAX = 100
self.g3.stats.damage = 77
self.g3.stats.spread = 20
self.g3.stats.recoil = 15
self.g3.stats.suppression = 7
self.g3.fire_mode_data.fire_rate = 0.125
self.g3.can_shoot_through_shield = false
self.g3.can_shoot_through_wall = true
self.g3.AMMO_PICKUP = {1, 4}

self.new_m14.CLIP_AMMO_MAX = 20
self.new_m14.AMMO_MAX = 100
self.new_m14.stats.damage = 85
self.new_m14.stats.spread = 19
self.new_m14.stats.recoil = 11
self.new_m14.stats.suppression = 6
self.new_m14.fire_mode_data.fire_rate = 0.15
self.new_m14.can_shoot_through_shield = false
self.new_m14.can_shoot_through_wall = true
self.new_m14.AMMO_PICKUP = {1, 4}

-- Sniper Rifles --

self.msr.CLIP_AMMO_MAX = 8
self.msr.AMMO_MAX = 40
self.msr.stats.damage = 200
self.msr.stats.spread = 25
self.msr.stats.recoil = 14
self.msr.stats.suppression = 8
self.msr.fire_mode_data.fire_rate = 0.75
self.msr.can_shoot_through_shield = true
self.msr.AMMO_PICKUP = {1, 5}

self.r93.CLIP_AMMO_MAX = 5
self.r93.AMMO_MAX = 30
self.r93.stats.damage = 120
self.r93.stats_modifiers = {damage = 3}
self.r93.stats.spread = 27
self.r93.stats.recoil = 11
self.r93.stats.suppression = 5
self.r93.fire_mode_data.fire_rate = 1.2
self.r93.can_shoot_through_shield = true
self.r93.AMMO_PICKUP = {1, 5}

self.wa2000.CLIP_AMMO_MAX = 10
self.wa2000.AMMO_MAX = 40
self.wa2000.stats.damage = 160
self.wa2000.stats.spread = 24
self.wa2000.stats.recoil = 14
self.wa2000.stats.suppression = 6
self.wa2000.fire_mode_data.fire_rate = 0.5
self.wa2000.can_shoot_through_shield = true
self.wa2000.AMMO_PICKUP = {1, 3}



end
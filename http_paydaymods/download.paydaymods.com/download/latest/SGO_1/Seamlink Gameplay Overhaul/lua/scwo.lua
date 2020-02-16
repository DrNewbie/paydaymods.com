--[[FULL OVERHAUL OPTION 3
if not SGO or SGO.settings.use_tweako ~= 3 then return end
--Subject for a complete change
local old_init = WeaponTweakData.init
function WeaponTweakData:init(tweak_data)
	old_init(self, tweak_data)

--Assault Rifles-- self..stats.reload = 30

self.amcar.stats_modifiers = {damage = 2}
--self.amcar.stats.concealment = 0
--self.amcar.CLIP_AMMO_MAX = 25
self.amcar.AMMO_MAX = 120
self.amcar.stats.damage = 105
self.amcar.stats.spread = 24
self.amcar.stats.recoil = 28
self.amcar.AMMO_PICKUP = {20,30}
self.amcar.armor_piercing_chance = 1
self.amcar.can_shoot_through_enemy = true
self.amcar.can_shoot_through_shield = false
self.amcar.stats.reload = 30

self.tecci.stats_modifiers = {damage = 2}
--self.tecci.CLIP_AMMO_MAX = 30
--self.tecci.stats.concealment = 0
self.tecci.AMMO_MAX = 200
self.tecci.stats.damage = 105
self.tecci.stats.spread = 20
self.tecci.stats.recoil = 32
self.tecci.AMMO_PICKUP = {20,30}
self.tecci.armor_piercing_chance = 1
self.tecci.can_shoot_through_enemy = true
self.tecci.can_shoot_through_shield = false
self.tecci.stats.reload = 30

self.new_m4.stats_modifiers = {damage = 3} -- trouble here
--self.new_m4.stats.concealment = 0
--self.new_m4.CLIP_AMMO_MAX = 26
self.new_m4.AMMO_MAX = 120
self.new_m4.stats.damage = 70
self.new_m4.stats.spread = 32
self.new_m4.stats.recoil = 32
self.new_m4.AMMO_PICKUP = {20,30}
self.new_m4.armor_piercing_chance = 1
self.new_m4.can_shoot_through_shield = false
self.new_m4.can_shoot_through_enemy = true
self.new_m4.can_shoot_through_wall = true
self.new_m4.stats.reload = 30

self.m16.stats_modifiers = {damage = 2}
--self.m16.stats.concealment = 0
--self.m16.CLIP_AMMO_MAX = 26
self.m16.AMMO_MAX = 120
self.m16.stats.damage = 105
self.m16.stats.spread = 32
self.m16.stats.recoil = 32
self.m16.can_shoot_through_shield = false
self.m16.armor_piercing_chance = 1
self.m16.can_shoot_through_enemy = true
self.m16.AMMO_PICKUP = {20,30}
self.m16.fire_mode_data.fire_rate = 0.1
self.m16.stats.reload = 30

self.new_m14.stats_modifiers = {damage = 2}
--self.new_m14.stats.concealment = 0
--self.new_m14.CLIP_AMMO_MAX = 10
self.new_m14.AMMO_MAX = 60
self.new_m14.stats.damage = 190
self.new_m14.stats.spread = 32
self.new_m14.can_shoot_through_shield = true
self.new_m14.armor_piercing_chance = 1
self.new_m14.can_shoot_through_enemy = true
self.new_m14.AMMO_PICKUP = {20,30}
self.new_m14.stats.reload = 30

self.galil.stats_modifiers = {damage = 2}
--self.galil.stats.concealment = 0
--self.galil.CLIP_AMMO_MAX = 30
self.galil.AMMO_MAX = 90
self.galil.stats.spread = 32
self.galil.stats.recoil = 32
self.galil.stats.damage = 125
self.galil.can_shoot_through_enemy = true
self.galil.can_shoot_through_shield = true
self.galil.armor_piercing_chance = 1
self.galil.AMMO_PICKUP = {20,30}
self.galil.stats.reload = 30

self.s552.stats_modifiers = {damage = 2}
--self.s552.stats.concealment = 0
self.s552.CLIP_AMMO_MAX = 30
self.s552.AMMO_MAX = 120
self.s552.stats.damage = 105
self.s552.stats.spread = 32
self.s552.stats.recoil = 32
self.s552.armor_piercing_chance = 1
self.s552.can_shoot_through_enemy = true
self.s552.can_shoot_through_shield = false
self.s552.AMMO_PICKUP = {20,30}
self.s552.stats.reload = 30

self.g36.stats_modifiers = {damage = 2}
--self.g36.stats.concealment = 0
self.g36.AMMO_MAX = 120
self.g36.stats.spread = 32
self.g36.stats.recoil = 32
self.g36.stats.damage = 105
self.g36.armor_piercing_chance = 1
self.g36.can_shoot_through_enemy = true
self.g36.can_shoot_through_shield = false
self.g36.AMMO_PICKUP = {20,30}
self.g36.stats.reload = 30

self.ak5.stats_modifiers = {damage = 2}
--self.ak5.stats.concealment = 0
--self.ak5.CLIP_AMMO_MAX = 26
self.ak5.AMMO_MAX = 125
self.ak5.stats.damage = 105
self.ak5.stats.spread = 32
self.ak5.stats.recoil = 32
self.ak5.armor_piercing_chance = 1
self.ak5.can_shoot_through_enemy = true
self.ak5.can_shoot_through_shield = false
self.ak5.AMMO_PICKUP = {20,30}
self.ak5.stats.reload = 30

self.sub2000.stats_modifiers = {damage = 3}
--self.sub2000.stats.concealment = 0
self.sub2000.AMMO_MAX = 132
self.sub2000.stats.damage = 55
self.sub2000.stats.spread = 32
self.sub2000.stats.recoil = 32
self.sub2000.armor_piercing_chance = 1
self.sub2000.can_shoot_through_enemy = true
self.sub2000.can_shoot_through_shield = false
self.sub2000.AMMO_PICKUP = {20,30}
self.sub2000.stats.reload = 30
self.sub2000.fire_mode_data.fire_rate = 0.03

self.aug.stats_modifiers = {damage = 2}
--self.aug.stats.concealment = 0
self.aug.CLIP_AMMO_MAX = 30
self.aug.AMMO_MAX = 120
self.aug.stats.damage = 105
self.aug.stats.spread = 32
self.aug.stats.recoil = 32
self.aug.armor_piercing_chance = 1
self.aug.can_shoot_through_enemy = true
self.aug.can_shoot_through_shield = false
self.aug.AMMO_PICKUP = {20,30}
self.aug.stats.reload = 30

self.famas.stats_modifiers = {damage = 2}
--self.famas.stats.concealment = 0
self.famas.CLIP_AMMO_MAX = 30
self.famas.AMMO_MAX = 120
self.famas.stats.damage = 105
self.famas.stats.spread = 32
self.famas.stats.recoil = 32
self.famas.armor_piercing_chance = 1
self.famas.can_shoot_through_enemy = true
self.famas.can_shoot_through_shield = false
self.famas.AMMO_PICKUP = {20,30}
self.famas.stats.reload = 30

self.l85a2.stats_modifiers = {damage = 2}
--self.l85a2.stats.concealment = 0
self.l85a2.AMMO_MAX = 120
self.l85a2.stats.damage = 105
self.l85a2.stats.spread = 32
self.l85a2.stats.recoil = 32
self.l85a2.armor_piercing_chance = 1
self.l85a2.can_shoot_through_enemy = true
self.l85a2.can_shoot_through_shield = false
self.l85a2.AMMO_PICKUP = {20,30}
self.l85a2.stats.reload = 30

self.vhs.stats_modifiers = {damage = 2}
--self.vhs.stats.concealment = 0
self.vhs.CLIP_AMMO_MAX = 30
self.vhs.AMMO_MAX = 120
self.vhs.stats.damage = 105
self.vhs.stats.spread = 32
self.vhs.stats.recoil = 32
self.vhs.armor_piercing_chance = 1
self.vhs.can_shoot_through_enemy = true
self.vhs.can_shoot_through_shield = false
self.vhs.AMMO_PICKUP = {20,30}
self.vhs.stats.reload = 30

self.akm.stats_modifiers = {damage = 3}
--self.akm.stats.concealment = 0
--self.akm.CLIP_AMMO_MAX = 30
self.akm.AMMO_MAX = 90
self.akm.stats.damage = 83
self.akm.stats.spread = 32
self.akm.stats.recoil = 32
self.akm.armor_piercing_chance = 1
self.akm.can_shoot_through_shield = true
self.akm.can_shoot_through_enemy = true
self.akm.AMMO_PICKUP = {20,30}
self.akm.stats.reload = 30

self.akm_gold.stats_modifiers = {damage = 3}
--self.akm_gold.stats.concealment = 0
--self.akm_gold.CLIP_AMMO_MAX = 30
self.akm_gold.AMMO_MAX = 90
self.akm_gold.stats.damage = 83
self.akm_gold.stats.spread = 32
self.akm_gold.stats.recoil = 32
self.akm_gold.can_shoot_through_shield = true
self.akm_gold.can_shoot_through_enemy = true
self.akm_gold.armor_piercing_chance = 1
self.akm_gold.AMMO_PICKUP = {20,30}
self.akm.stats.reload = 30

self.ak74.stats_modifiers = {damage = 3} -- trouble here
--self.ak74.stats.concealment = 0
--self.ak74.CLIP_AMMO_MAX = 26
self.ak74.AMMO_MAX = 90
self.ak74.stats.damage = 83
self.ak74.stats.spread = 32
self.ak74.stats.recoil = 32
self.ak74.armor_piercing_chance = 1
self.ak74.can_shoot_through_shield = true
self.ak74.can_shoot_through_enemy = true
self.ak74.AMMO_PICKUP = {20,30}
self.ak74.stats.reload = 30

self.asval.stats_modifiers = {damage = 2}
--self.asval.stats.concealment = 0
--self.asval.CLIP_AMMO_MAX = 30
self.asval.AMMO_MAX = 90
self.asval.stats.damage = 125
self.asval.stats.spread = 22
self.asval.stats.recoil = 28
self.asval.armor_piercing_chance = 1
self.asval.can_shoot_through_enemy = true
self.asval.can_shoot_through_shield = true
self.asval.AMMO_PICKUP = {20,30}
self.asval.stats.reload = 30

self.flint.stats_modifiers = {damage = 2}
--self.flint.stats.concealment = 0
self.flint.CLIP_AMMO_MAX = 30
self.flint.AMMO_MAX = 90
self.flint.stats.damage = 125
self.flint.stats.spread = 22
self.flint.stats.recoil = 28
self.flint.armor_piercing_chance = 1
self.flint.can_shoot_through_enemy = true
self.flint.can_shoot_through_shield = true
self.flint.AMMO_PICKUP = {20,30}
self.flint.stats.reload = 30

self.contraband.stats_modifiers = {damage = 3}
self.contraband.AMMO_MAX = 60
self.contraband.stats.damage = 83
self.contraband.stats.recoil = 20
self.contraband.stats.spread = 30
self.contraband.can_shoot_through_shield = true
self.contraband.armor_piercing_chance = 1
self.contraband.can_shoot_through_enemy = true
self.contraband.AMMO_PICKUP = {20,30}
self.contraband.stats.reload = 35

--Battle Rifles-- self..stats.reload = 30

self.scar.stats_modifiers = {damage = 2}
--self.scar.stats.concealment = 0
--self.scar.CLIP_AMMO_MAX = 20
self.scar.AMMO_MAX = 60
self.scar.stats.damage = 210
self.scar.stats.recoil = 20
self.scar.stats.spread = 30
self.scar.can_shoot_through_shield = true
self.scar.armor_piercing_chance = 1
self.scar.can_shoot_through_enemy = true
self.scar.AMMO_PICKUP = {20,30}
self.scar.stats.reload = 35

self.fal.stats_modifiers = {damage = 2}
--self.fal.stats.concealment = 0
--self.fal.CLIP_AMMO_MAX = 10
self.fal.AMMO_MAX = 60
self.fal.stats.damage = 210
self.fal.stats.spread = 30
self.fal.armor_piercing_chance = 1
self.fal.can_shoot_through_shield = true
self.fal.can_shoot_through_enemy = true
self.fal.AMMO_PICKUP = {20,30}
self.fal.stats.reload = 20

self.g3.stats_modifiers = {damage = 3}
--self.g3.stats.concealment = 0
--self.g3.CLIP_AMMO_MAX = 20
self.g3.AMMO_MAX = 60
self.g3.stats.damage = 120
self.g3.stats.spread = 32
self.g3.can_shoot_through_shield = true
self.g3.can_shoot_through_enemy = true
self.g3.armor_piercing_chance = 1
self.g3.AMMO_PICKUP = {20,30}
self.g3.stats.reload = 19

-- Shotguns -- self..stats.reload = 14

self.boot.stats_modifiers = {damage = 5}
--self.boot.stats.concealment = 0
self.boot.CLIP_AMMO_MAX = 6
self.boot.AMMO_MAX = 24
self.boot.stats.damage = 220
self.boot.stats.spread = 0
--self.boot.armor_piercing_chance = 1
--self.boot.can_shoot_through_enemy = true
self.boot.AMMO_PICKUP = {10,12}
self.boot.rays = 8
--self.boot.fire_mode_data.fire_rate = 1.2
self.boot.damage_near = 100
self.boot.damage_far = 1500

self.m37.stats_modifiers = {damage = 5}
--self.m37.stats.concealment = 0
self.m37.CLIP_AMMO_MAX = 4
self.m37.AMMO_MAX = 24
self.m37.stats.damage = 220
self.m37.stats.spread = 0
--self.m37.armor_piercing_chance = 1
--self.m37.can_shoot_through_enemy = true
self.m37.AMMO_PICKUP = {10,12}
self.m37.rays = 8
self.m37.stats.reload = 12
self.m37.damage_near = 10
self.m37.damage_far = 1500

self.serbu.stats_modifiers = {damage = 4}
--self.serbu.stats.concealment = 0
self.serbu.CLIP_AMMO_MAX = 6
self.serbu.AMMO_MAX = 24
self.serbu.stats.damage = 180
self.serbu.stats.spread = 0
self.serbu.fire_mode_data.fire_rate = 0.4
self.serbu.AMMO_PICKUP = {10,12}
--self.serbu.armor_piercing_chance = 1
--self.serbu.can_shoot_through_enemy = true
self.serbu.rays = 8
self.serbu.stats.reload = 14
self.serbu.damage_near = 100
self.serbu.damage_far = 1500

self.r870.stats_modifiers = {damage = 4}
--self.r870.stats.concealment = 0
self.r870.CLIP_AMMO_MAX = 6
self.r870.AMMO_MAX = 24
self.r870.stats.damage = 180
self.r870.stats.spread = 0
self.r870.fire_mode_data.fire_rate = 0.4
self.r870.AMMO_PICKUP = {10,12}
--self.r870.armor_piercing_chance = 1
--self.r870.can_shoot_through_enemy = true
self.r870.rays = 8
self.r870.stats.reload = 14
self.r870.damage_near = 100
self.r870.damage_far = 1500

self.ksg.stats_modifiers = {damage = 4}
--self.ksg.stats.concealment = 0
self.ksg.CLIP_AMMO_MAX = 8
self.ksg.AMMO_MAX = 24
self.ksg.stats.damage = 170
self.ksg.stats.spread = 0
self.ksg.fire_mode_data.fire_rate = 0.4
--self.ksg.can_shoot_through_enemy = true
--self.ksg.armor_piercing_chance = 1
self.ksg.AMMO_PICKUP = {10,12}
self.ksg.rays = 8
self.ksg.stats.reload = 15
self.ksg.damage_near = 100
self.ksg.damage_far = 1500

self.rota.stats_modifiers = {damage = 2}
--self.rota.stats.concealment = 0
self.rota.CLIP_AMMO_MAX = 6
self.rota.AMMO_MAX = 24
self.rota.stats.damage = 160
self.rota.stats.spread = 0
--self.rota.armor_piercing_chance = 1
--self.rota.can_shoot_through_enemy = true
self.rota.AMMO_PICKUP = {10,12}
self.rota.rays = 8
self.rota.fire_mode_data.fire_rate = 0.1
self.rota.stats.reload = 30
self.rota.damage_near = 100
self.rota.damage_far = 1500

self.spas12.stats_modifiers = {damage = 2}
--self.spas12.stats.concealment = 0
self.spas12.CLIP_AMMO_MAX = 6
self.spas12.AMMO_MAX = 24
self.spas12.stats.damage = 200
self.spas12.stats.spread = 0
--self.spas12.armor_piercing_chance = 1
--self.spas12.can_shoot_through_enemy = true
self.spas12.AMMO_PICKUP = {10,12}
self.spas12.rays = 8
self.spas12.fire_mode_data.fire_rate = 0.13
self.spas12.stats.reload = 14
self.spas12.damage_near = 100
self.spas12.damage_far = 1500

self.huntsman.stats_modifiers = {damage = 12}
--self.huntsman.stats.concealment = 0
self.huntsman.CLIP_AMMO_MAX = 2
self.huntsman.AMMO_MAX = 16
--self.huntsman.armor_piercing_chance = 1
--self.huntsman.can_shoot_through_enemy = true
self.huntsman.stats.damage = 210
self.huntsman.stats.spread = 10
self.huntsman.AMMO_PICKUP = {10,12}
self.huntsman.rays = 8
self.huntsman.stats.reload = 14
self.huntsman.damage_near = 100
self.huntsman.damage_far = 3000
self.huntsman.fire_mode_data.fire_rate = 0.40

--self.b682.stats.concealment = 0
self.b682.stats_modifiers = {damage = 12}
self.b682.CLIP_AMMO_MAX = 2
self.b682.AMMO_MAX = 16
self.b682.stats.damage = 210
self.b682.stats.spread = 10
--self.b682.armor_piercing_chance = 1
--self.b682.can_shoot_through_enemy = true
self.b682.AMMO_PICKUP = {10,12}
self.b682.rays = 8
self.b682.stats.reload = 14
self.b682.damage_near = 100
self.b682.damage_far = 3000
self.b682.fire_mode_data.fire_rate = 0.40

-- Auto Shotties --

self.judge.stats_modifiers = {damage = 2}
--self.judge.stats.concealment = 0
self.judge.CLIP_AMMO_MAX = 5
self.judge.AMMO_MAX = 20
self.judge.stats.damage = 210
self.judge.stats.spread = 0
self.judge.stats.recoil = 22
--self.judge.armor_piercing_chance = 1
--self.judge.can_shoot_through_enemy = true
self.judge.AMMO_PICKUP = {10,12}
self.judge.rays = 8
self.judge.stats.reload = 14
self.judge.damage_near = 100
self.judge.damage_far = 1500

self.benelli.stats_modifiers = {damage = 2}
--self.benelli.stats.concealment = 0
self.benelli.CLIP_AMMO_MAX = 6
self.benelli.AMMO_MAX = 24
self.benelli.stats.damage = 200
self.benelli.stats.spread = 0
--self.benelli.can_shoot_through_enemy = true
--self.benelli.armor_piercing_chance = 1
self.benelli.AMMO_PICKUP = {10,12}
self.benelli.rays = 8
self.benelli.stats.reload = 14
self.benelli.damage_near = 100
self.benelli.damage_far = 1500

self.saiga.stats_modifiers = {damage = 2}
--self.saiga.stats.concealment = 0
self.saiga.CLIP_AMMO_MAX = 8
self.saiga.AMMO_MAX = 24
self.saiga.stats.damage = 180
self.saiga.stats.spread = 0
--self.saiga.armor_piercing_chance = 1
--self.saiga.can_shoot_through_enemy = true
self.saiga.AMMO_PICKUP = {10,12}
self.saiga.rays = 8
self.saiga.stats.reload = 14
self.saiga.damage_near = 100
self.saiga.damage_far = 1500

self.aa12.stats_modifiers = {damage = 2}
--self.aa12.stats.concealment = 0
--self.aa12.CLIP_AMMO_MAX = 8
self.aa12.AMMO_MAX = 40
self.aa12.stats.damage = 180
self.aa12.stats.spread = 0
self.aa12.stats.recoil = 32
--self.aa12.armor_piercing_chance = 1
--self.aa12.can_shoot_through_enemy = true
self.aa12.AMMO_PICKUP = {10,12}
self.aa12.rays = 8
self.aa12.stats.reload = 14
self.aa12.damage_near = 100
self.aa12.damage_far = 1500

self.striker.stats_modifiers = {damage = 2}
--self.striker.stats.concealment = 0
self.striker.CLIP_AMMO_MAX = 12
self.striker.AMMO_MAX = 24
self.striker.stats.damage = 180
self.striker.stats.spread = 0
--self.striker.armor_piercing_chance = 1
--self.striker.can_shoot_through_enemy = true
self.striker.AMMO_PICKUP = {10,12}
self.striker.rays = 8
self.striker.stats.reload = 14
self.striker.damage_near = 100
self.striker.damage_far = 1500

-- Revolvers and Magnums -- DAMN

--self.peacemaker.stats.concealment = 0
self.peacemaker.stats_modifiers = {damage = 6, reload = 2}
self.peacemaker.stats.damage = 200
--self.peacemaker.stats_modifiers = {reload = 2}
self.peacemaker.stats.reload = 20
self.peacemaker.CLIP_AMMO_MAX = 6
self.peacemaker.AMMO_MAX = 24
self.peacemaker.stats.spread = 32
self.peacemaker.stats.recoil = 32
self.peacemaker.can_shoot_through_shield = true
self.peacemaker.can_shoot_through_enemy = true
self.peacemaker.can_shoot_through_wall = true
self.peacemaker.armor_piercing_chance = 1
self.peacemaker.AMMO_PICKUP = {10,12}
self.peacemaker.fire_mode_data.fire_rate = 0.1

--self.mateba.stats.concealment = 0
self.mateba.stats_modifiers = {damage = 4}
self.mateba.CLIP_AMMO_MAX = 6
self.mateba.AMMO_MAX = 24
self.mateba.stats.damage = 210
self.mateba.stats.spread = 32
self.mateba.stats.recoil = 32
self.mateba.can_shoot_through_shield = true
self.mateba.can_shoot_through_enemy = true
self.mateba.can_shoot_through_wall = true
self.mateba.armor_piercing_chance = 1
self.mateba.AMMO_PICKUP = {10,12}
self.mateba.fire_mode_data.fire_rate = 0.1
self.mateba.stats.reload = 23

--self.chinchilla.stats.concealment = 0
self.chinchilla.stats_modifiers = {damage = 4}
self.chinchilla.CLIP_AMMO_MAX = 6
self.chinchilla.AMMO_MAX = 24
self.chinchilla.stats.damage = 210
self.chinchilla.stats.spread = 32
self.chinchilla.stats.recoil = 32
self.chinchilla.can_shoot_through_shield = true
self.chinchilla.can_shoot_through_enemy = true
self.chinchilla.can_shoot_through_wall = true
self.chinchilla.armor_piercing_chance = 1
self.chinchilla.AMMO_PICKUP = {10,12}
self.chinchilla.fire_mode_data.fire_rate = 0.1
self.chinchilla.stats.reload = 23

self.x_chinchilla.stats_modifiers = {damage = 4}
self.x_chinchilla.CLIP_AMMO_MAX = 12
self.x_chinchilla.AMMO_MAX = 36
self.x_chinchilla.stats.damage = 210
self.x_chinchilla.stats.spread = 32
self.x_chinchilla.stats.recoil = 32
self.x_chinchilla.can_shoot_through_enemy = true
self.x_chinchilla.can_shoot_through_shield = true
self.x_chinchilla.armor_piercing_chance = 1
self.x_chinchilla.AMMO_PICKUP = {10, 15}
self.x_chinchilla.stats.reload = 50

self.new_raging_bull.stats_modifiers = {damage = 4}
--self.new_raging_bull.stats.concealment = 0
self.new_raging_bull.CLIP_AMMO_MAX = 6
self.new_raging_bull.AMMO_MAX = 24
self.new_raging_bull.stats.damage = 210
self.new_raging_bull.stats.spread = 32
self.new_raging_bull.stats.recoil = 32
self.new_raging_bull.can_shoot_through_shield = true
self.new_raging_bull.can_shoot_through_enemy = true
self.new_raging_bull.can_shoot_through_wall = true
self.new_raging_bull.armor_piercing_chance = 1
self.new_raging_bull.AMMO_PICKUP = {10,12}
self.new_raging_bull.fire_mode_data.fire_rate = 0.1
self.new_raging_bull.stats.reload = 15

self.deagle.stats_modifiers = {damage = 4}
--self.deagle.stats.concealment = 0
self.deagle.CLIP_AMMO_MAX = 7
self.deagle.AMMO_MAX = 28
self.deagle.stats.damage = 180
self.deagle.stats.spread = 32
self.deagle.stats.recoil = 32
self.deagle.can_shoot_through_shield = true
self.deagle.can_shoot_through_enemy = true
self.deagle.can_shoot_through_wall = true
self.deagle.armor_piercing_chance = 1
self.deagle.AMMO_PICKUP = {10,12}
self.deagle.fire_mode_data.fire_rate = 0.13
self.deagle.stats.reload = 17

--Armor Piercing Pistol

--self..stats.concealment = 0
self.lemming.AMMO_MAX = 60
self.lemming.stats.damage = 160
self.lemming.stats.recoil = 32
self.lemming.stats.spread = 32
self.lemming.can_shoot_through_enemy = true
self.lemming.armor_piercing_chance = 1
self.lemming.AMMO_PICKUP = {15, 20}
self.lemming.fire_mode_data.fire_rate = 0.1
self.lemming.can_shoot_through_shield = true
self.lemming.stats.reload = 16

-- Regular Pistols -- self..stats.reload = 20

--self.packrat.stats.concealment = 0
self.packrat.AMMO_MAX = 90
self.packrat.stats.damage = 160
self.packrat.stats.recoil = 32
self.packrat.stats.spread = 32
self.packrat.can_shoot_through_enemy = true
self.packrat.armor_piercing_chance = 1
self.packrat.AMMO_PICKUP = {15, 20}
self.packrat.fire_mode_data.fire_rate = 0.1
self.packrat.can_shoot_through_shield = false
self.packrat.stats.reload = 20

--self.sparrow.stats.concealment = 0
self.sparrow.AMMO_MAX = 90
self.sparrow.stats.damage = 160
self.sparrow.stats.recoil = 32
self.sparrow.stats.spread = 32
self.sparrow.can_shoot_through_enemy = true
self.sparrow.armor_piercing_chance = 1
self.sparrow.AMMO_PICKUP = {15, 20}
self.sparrow.fire_mode_data.fire_rate = 0.1
self.sparrow.can_shoot_through_shield = false
self.sparrow.stats.reload = 20

--self.pl14.stats.concealment = 0
self.pl14.AMMO_MAX = 90
self.pl14.stats.damage = 160
self.pl14.stats.recoil = 32
self.pl14.stats.spread = 32
self.pl14.can_shoot_through_enemy = true
self.pl14.armor_piercing_chance = 1
self.pl14.AMMO_PICKUP = {15, 20}
self.pl14.fire_mode_data.fire_rate = 0.1
self.pl14.can_shoot_through_shield = false
self.pl14.stats.reload = 20

--self.b92fs.stats.concealment = 0
self.b92fs.AMMO_MAX = 150
self.b92fs.stats.damage = 120
self.b92fs.stats.recoil = 32
self.b92fs.stats.spread = 32
self.b92fs.can_shoot_through_enemy = true
self.b92fs.can_shoot_through_shield = false
self.b92fs.armor_piercing_chance = 1
self.b92fs.AMMO_PICKUP = {15, 20}
self.b92fs.fire_mode_data.fire_rate = 0.1
self.b92fs.stats.reload = 20

--self.usp.stats.concealment = 0
self.usp.AMMO_MAX = 90
self.usp.stats.damage = 160
self.usp.stats.recoil = 32
self.usp.stats.spread = 32
self.usp.can_shoot_through_enemy = true
self.usp.AMMO_PICKUP = {15, 20}
self.usp.fire_mode_data.fire_rate = 0.1
self.usp.can_shoot_through_shield = false
self.usp.stats.reload = 20

--self.glock_17.stats.concealment = 0
self.glock_17.AMMO_MAX = 150
self.glock_17.stats.damage = 120
self.glock_17.stats.recoil = 32
self.glock_17.stats.spread = 32
self.glock_17.can_shoot_through_enemy = true
self.glock_17.can_shoot_through_shield = false
self.glock_17.AMMO_PICKUP = {15, 20}
self.glock_17.fire_mode_data.fire_rate = 0.1
self.glock_17.stats.reload = 20

--self.glock_18c.stats.concealment = 0
self.glock_18c.AMMO_MAX = 200
self.glock_18c.stats.damage = 110
self.glock_18c.stats.recoil = 32
--self.glock_18c.stats.spread = 21
self.glock_18c.can_shoot_through_enemy = true
self.glock_18c.AMMO_PICKUP = {15, 20}
self.glock_18c.can_shoot_through_shield = false
self.glock_18c.stats.reload = 20
self.glock_18c.kick = self.glock_18c.kick or {}
self.glock_18c.kick.standing = {
	0,
	0,
	0,
	0
}
self.glock_18c.kick.crouching = self.glock_18c.kick.standing
self.glock_18c.kick.steelsight = self.glock_18c.kick.standing

--self.g26.stats.concealment = 0
self.g26.AMMO_MAX = 150
self.g26.stats.damage = 120
self.g26.stats.recoil = 32
self.g26.stats.spread = 32
self.g26.can_shoot_through_enemy = true
self.g26.AMMO_PICKUP = {15, 20}
self.g26.fire_mode_data.fire_rate = 0.1
self.g26.can_shoot_through_shield = false
self.g26.stats.reload = 20

--self.ppk.stats.concealment = 0
self.ppk.AMMO_MAX = 150
self.ppk.stats.damage = 120
self.ppk.stats.recoil = 32
self.ppk.stats.spread = 32
self.ppk.can_shoot_through_enemy = true
self.ppk.can_shoot_through_shield = false
self.ppk.AMMO_PICKUP = {15, 20}
self.ppk.fire_mode_data.fire_rate = 0.1
self.ppk.stats.reload = 20

--self.jowi.stats.concealment = 0
self.jowi.AMMO_MAX = 240
self.jowi.stats.damage = 120
self.jowi.stats.recoil = 32
self.jowi.stats.spread = 32
self.jowi.can_shoot_through_enemy = true
self.jowi.can_shoot_through_shield = false
self.jowi.AMMO_PICKUP = {15, 20}
self.jowi.fire_mode_data.fire_rate = 0.1
self.jowi.stats.reload = 20

--self.g22c.stats.concealment = 0
self.g22c.AMMO_MAX = 150
self.g22c.stats.damage = 120
self.g22c.stats.recoil = 32
self.g22c.stats.spread = 32
self.g22c.can_shoot_through_enemy = true
self.g22c.can_shoot_through_shield = false
self.g22c.AMMO_PICKUP = {15, 20}
self.g22c.fire_mode_data.fire_rate = 0.1
self.g22c.stats.reload = 20

--self.p226.stats.concealment = 0
self.p226.AMMO_MAX = 90
self.p226.stats.damage = 150
self.p226.stats.recoil = 32
self.p226.stats.spread = 32
self.p226.can_shoot_through_enemy = true
self.p226.can_shoot_through_shield = false
self.p226.armor_piercing_chance = 1
self.p226.AMMO_PICKUP = {15, 20}
self.p226.fire_mode_data.fire_rate = 0.1
self.p226.stats.reload = 20

--self.hs2000.stats.concealment = 0
self.hs2000.AMMO_MAX = 120
self.hs2000.stats.damage = 150
self.hs2000.stats.recoil = 32
self.hs2000.stats.spread = 32
self.hs2000.can_shoot_through_enemy = true
self.hs2000.can_shoot_through_shield = false
self.hs2000.armor_piercing_chance = 1
self.hs2000.AMMO_PICKUP = {15, 20}
self.hs2000.fire_mode_data.fire_rate = 0.1
self.hs2000.stats.reload = 20

--self.colt_1911.stats.concealment = 0
self.colt_1911.AMMO_MAX = 90
self.colt_1911.stats.damage = 160
self.colt_1911.stats.recoil = 32
self.colt_1911.stats.spread = 32
self.colt_1911.can_shoot_through_enemy = true
self.colt_1911.can_shoot_through_shield = false
self.colt_1911.armor_piercing_chance = 1
self.colt_1911.AMMO_PICKUP = {15, 20}
self.colt_1911.fire_mode_data.fire_rate = 0.1
self.colt_1911.stats.reload = 20

--self.c96.stats.concealment = 0
self.c96.AMMO_MAX = 80
self.c96.stats.damage = 120
self.c96.stats.recoil = 32
self.c96.stats.spread = 32
self.c96.can_shoot_through_enemy = true
self.c96.can_shoot_through_shield = false
self.c96.armor_piercing_chance = 1
self.c96.AMMO_PICKUP = {15, 20}
self.c96.fire_mode_data.fire_rate = 0.1
self.c96.stats.reload = 20

--LMGs-- self..stats.reload = 50

self.rpk.stats.concealment = 0
self.rpk.CLIP_AMMO_MAX = 150
self.rpk.AMMO_MAX = 300
self.rpk.stats.damage = 190
self.rpk.stats.recoil = 32
self.rpk.stats.spread = 16
self.rpk.can_shoot_through_enemy = true
self.rpk.can_shoot_through_shield = true
self.rpk.armor_piercing_chance = 1
self.rpk.AMMO_PICKUP = {40, 50}
self.rpk.stats.reload = 50

self.hk21.stats.concealment = 0
self.hk21.CLIP_AMMO_MAX = 150
self.hk21.AMMO_MAX = 300
self.hk21.stats.damage = 190
self.hk21.stats.spread = 16
self.hk21.stats.recoil = 32
self.hk21.can_shoot_through_enemy = true
self.hk21.can_shoot_through_shield = true
self.hk21.armor_piercing_chance = 1
self.hk21.AMMO_PICKUP = {40, 50}
self.hk21.stats.reload = 50

self.mg42.stats.concealment = 0
self.mg42.CLIP_AMMO_MAX = 140
self.mg42.AMMO_MAX = 280
self.mg42.stats.damage = 190
self.mg42.stats.spread = 16
self.mg42.stats.recoil = 32
self.mg42.can_shoot_through_enemy = true
self.mg42.can_shoot_through_shield = true
self.mg42.armor_piercing_chance = 1
self.mg42.AMMO_PICKUP = {40, 50}
self.mg42.stats.reload = 50

self.m249.stats.concealment = 0
self.m249.CLIP_AMMO_MAX = 200
self.m249.AMMO_MAX = 400
self.m249.stats.damage = 150
self.m249.stats.spread = 20
self.m249.stats.recoil = 32
self.m249.can_shoot_through_enemy = true
self.m249.can_shoot_through_shield = false
self.m249.armor_piercing_chance = 1
self.m249.AMMO_PICKUP = {40, 50}
self.m249.stats.reload = 50

self.par.stats.concealment = 0
self.par.CLIP_AMMO_MAX = 150
self.par.AMMO_MAX = 300
self.par.stats.damage = 180
self.par.stats.spread = 16
self.par.stats.recoil = 32
self.par.can_shoot_through_enemy = true
self.par.can_shoot_through_shield = true
self.par.armor_piercing_chance = 1
self.par.AMMO_PICKUP = {40, 50}
self.par.stats.reload = 50

--Specials-- self..stats.reload = 50

self.flamethrower_mk2.CLIP_AMMO_MAX = 450
self.flamethrower_mk2.AMMO_MAX = 900
self.flamethrower_mk2.stats.damage = 100
self.flamethrower_mk2.can_shoot_through_shield = true
self.flamethrower_mk2.AMMO_PICKUP = {15, 20}
self.flamethrower_mk2.stats.reload = 50

self.rpg7.CLIP_AMMO_MAX = 1
self.rpg7.stats.damage = 20000
self.rpg7.AMMO_MAX = 4
self.rpg7.AMMO_PICKUP = {0.5, 0.6 }
self.rpg7.stats.reload = 40

self.ray.CLIP_AMMO_MAX = 4
self.ray.stats.damage = 20000
self.ray.AMMO_MAX = 8
self.ray.AMMO_PICKUP = {0.5, 0.6 }
self.ray.fire_mode_data.fire_rate = 0.2
self.ray.stats.reload = 50

--self.contraband_m203.stats_modifiers = {reload = 2}
self.contraband_m203.CLIP_AMMO_MAX = 1
self.contraband_m203.AMMO_MAX = 4
self.contraband_m203.AMMO_PICKUP = {0.4, 0.5}
self.contraband_m203.stats.reload = 50

self.china.CLIP_AMMO_MAX = 4
self.china.AMMO_MAX = 8
self.china.stats.damage = 440
self.china.AMMO_PICKUP = {0.4, 0.5}
self.china.stats.reload = 50

self.arbiter.CLIP_AMMO_MAX = 5
self.arbiter.AMMO_MAX = 10
self.arbiter.stats_modifiers = {damage = 10}
self.arbiter.stats.damage = 440
self.arbiter.fire_mode_data.fire_rate = 0.2
self.arbiter.AMMO_PICKUP = {0.4, 0.5}
self.arbiter.stats.reload = 50

self.gre_m79.CLIP_AMMO_MAX = 1
self.gre_m79.AMMO_MAX = 8
--self.gre_m79.stats.concealment = 0
self.gre_m79.stats.damage = 440
self.gre_m79.AMMO_PICKUP = {0.4, 0.5}
self.gre_m79.stats.reload = 50

self.m32.stats_modifiers = {damage = 10}
self.m32.CLIP_AMMO_MAX = 6
self.m32.AMMO_MAX = 12
self.m32.stats_modifiers = {reload = 2}
--self.m32.stats.concealment = 0
self.m32.stats.damage = 440
self.m32.fire_mode_data.fire_rate = 0.5
self.m32.AMMO_PICKUP = {0.3, 0.4}
self.m32.stats.reload = 25

self.m134.CLIP_AMMO_MAX = 999
self.m134.AMMO_MAX = 999
self.m134.stats.damage = 140
self.m134.stats.spread = 5
self.m134.stats.recoil = 35
self.m134.armor_piercing_chance = 1
self.m134.can_shoot_through_enemy = true
self.m134.can_shoot_through_shield = true
self.m134.AMMO_PICKUP = {40, 60}
self.m134.stats.reload = 50

--Sniper Rifles--

--Automatic Tier

--self.wa2000.stats.concealment = 0
self.wa2000.stats_modifiers = {damage = 100}
self.wa2000.CLIP_AMMO_MAX = 6
self.wa2000.AMMO_MAX = 42
self.wa2000.stats.damage = 20
self.wa2000.stats.recoil = 32
self.wa2000.fire_mode_data.fire_rate = 0.55
self.wa2000.AMMO_PICKUP = {5, 9}
self.wa2000.stats.reload = 50

--self.tti.stats.concealment = 0
self.tti.stats_modifiers = {damage = 100}
self.tti.CLIP_AMMO_MAX = 20
self.tti.AMMO_MAX = 40
self.tti.stats.damage = 17 --18 is perfect for OD
self.tti.stats.recoil = 32
self.tti.stats.spread = 32
self.tti.fire_mode_data.fire_rate = 0.40
self.tti.AMMO_PICKUP = {5, 9}
self.tti.stats.reload = 16

--self.siltstone.stats.concealment = 0
self.siltstone.stats_modifiers = {damage = 100}
self.siltstone.CLIP_AMMO_MAX = 10
self.siltstone.AMMO_MAX = 30
self.siltstone.stats.damage = 25
self.siltstone.stats.spread = 32
self.siltstone.stats.recoil = 32
self.siltstone.AMMO_PICKUP = {5, 9}
self.siltstone.stats.reload = 16
self.siltstone.fire_mode_data.fire_rate = 0.40

--Medium Tier

--self.desertfox.stats.concealment = 0
self.desertfox.stats_modifiers = {damage = 100}
self.desertfox.CLIP_AMMO_MAX = 6
self.desertfox.AMMO_MAX = 40
self.desertfox.stats.damage = 35
self.desertfox.stats.spread = 32
self.desertfox.stats.recoil = 32
self.desertfox.AMMO_PICKUP = {5, 9}
self.desertfox.stats.reload = 50
self.desertfox.fire_mode_data.fire_rate = 1.5


--self.model70.stats.concealment = 0
self.model70.stats_modifiers = {damage = 100}
self.model70.CLIP_AMMO_MAX = 5
self.model70.AMMO_MAX = 40
self.model70.stats.damage = 35
self.model70.stats.recoil = 32
self.model70.AMMO_PICKUP = {5, 9}
self.model70.stats.reload = 50
self.model70.fire_mode_data.fire_rate = 1.5

--self.msr.stats.concealment = 0
self.msr.stats_modifiers = {damage = 100}
self.msr.CLIP_AMMO_MAX = 10
self.msr.AMMO_MAX = 40
self.msr.stats.damage = 28
self.msr.stats.recoil = 32
self.msr.AMMO_PICKUP = {5, 9}
self.msr.stats.reload = 50
self.msr.fire_mode_data.fire_rate = 1.3

--self.r93.stats.concealment = 0
self.r93.stats_modifiers = {damage = 100}
self.r93.CLIP_AMMO_MAX = 5
self.r93.AMMO_MAX = 40
self.r93.stats.damage = 35
self.r93.stats.recoil = 38
self.r93.stats.spread = 25
self.r93.AMMO_PICKUP = {5, 9}
self.r93.stats.reload = 50

--self.mosin.stats.concealment = 0
self.mosin.stats_modifiers = {damage = 100}
self.mosin.CLIP_AMMO_MAX = 5
self.mosin.AMMO_MAX = 40
self.mosin.stats.damage = 35
self.mosin.stats.recoil = 32
self.mosin.AMMO_PICKUP = {5, 9}
self.mosin.stats.reload = 50
self.mosin.fire_mode_data.fire_rate = 1.3

--self.m95.stats.concealment = 0
self.m95.stats_modifiers = {damage = 100}
self.m95.CLIP_AMMO_MAX = 5
self.m95.AMMO_MAX = 20
self.m95.stats.damage = 125
self.m95.stats.spread = 32
self.m95.stats.recoil = 32
self.m95.AMMO_PICKUP = {5, 9}
self.m95.stats.reload = 50
self.m95.fire_mode_data.fire_rate = 1.5

--self.winchester1874.stats.concealment = 0
self.winchester1874.stats_modifiers = {damage = 100}
self.winchester1874.CLIP_AMMO_MAX = 20
self.winchester1874.AMMO_MAX = 40
self.winchester1874.stats.damage = 17
self.winchester1874.stats.recoil = 32
self.winchester1874.AMMO_PICKUP = {5, 9}
--self.winchester1874.fire_mode_data.fire_rate = 2
self.winchester1874.stats.reload = 50
self.winchester1874.fire_mode_data.fire_rate = 1.4

-- SMGs -- self..stats.reload = 50

--self.coal.stats.concealment = 0
self.coal.AMMO_MAX = 128
self.coal.stats.damage = 135
self.coal.stats.recoil = 32
--self.coal.CLIP_AMMO_MAX = 20
self.coal.stats.spread = 20
--self.coal.can_shoot_through_enemy = true
self.coal.can_shoot_through_shield = false
self.coal.armor_piercing_chance = 1
self.coal.AMMO_PICKUP = {30, 35}
self.coal.stats.reload = 50
self.coal.kick = self.coal.kick or {}
self.coal.kick.standing = {
	0,
	0,
	0,
	0
}
self.coal.kick.crouching = self.coal.kick.standing
self.coal.kick.steelsight = self.coal.kick.standing

--self.schakal.stats.concealment = 0
self.schakal.AMMO_MAX = 120
self.schakal.stats.damage = 170
self.schakal.stats.recoil = 32
--self.shackal.CLIP_AMMO_MAX = 20
self.schakal.stats.spread = 20
--self.schakal.can_shoot_through_enemy = true
self.schakal.can_shoot_through_shield = false
self.schakal.armor_piercing_chance = 1
self.schakal.AMMO_PICKUP = {30, 35}
self.schakal.stats.reload = 50
self.schakal.kick = self.schakal.kick or {}
self.schakal.kick.standing = {
	0,
	0,
	0,
	0
}
self.schakal.kick.crouching = self.schakal.kick.standing
self.schakal.kick.steelsight = self.schakal.kick.standing

--self.tec9.stats.concealment = 0
self.tec9.AMMO_MAX = 180
self.tec9.CLIP_AMMO_MAX = 33
self.tec9.stats.damage = 135
self.tec9.stats.recoil = 32
self.tec9.stats.spread = 20
--self.tec9.can_shoot_through_enemy = true
self.tec9.can_shoot_through_shield = false
self.tec9.armor_piercing_chance = 1
self.tec9.AMMO_PICKUP = {30, 35}
self.tec9.stats.reload = 50
self.tec9.kick = self.tec9.kick or {}
self.tec9.kick.standing = {
	0,
	0,
	0,
	0
}
self.tec9.kick.crouching = self.tec9.kick.standing
self.tec9.kick.steelsight = self.tec9.kick.standing

self.akmsu.stats_modifiers = {damage = 2}
--self.akmsu.stats.concealment = 0
self.akmsu.AMMO_MAX = 120
self.akmsu.stats.damage = 105
self.akmsu.stats.recoil = 32
self.akmsu.stats.spread = 32
self.akmsu.armor_piercing_chance = 1
self.akmsu.can_shoot_through_enemy = true
self.akmsu.can_shoot_through_shield = true
self.akmsu.AMMO_PICKUP = {30, 35}
self.akmsu.stats.reload = 50

--self.hajk.stats.concealment = 0
self.hajk.AMMO_MAX = 120
self.hajk.stats.damage = 210
self.hajk.stats.spread = 32
self.hajk.stats.recoil = 32
self.hajk.armor_piercing_chance = 1
self.hajk.can_shoot_through_enemy = true
self.hajk.can_shoot_through_shield = false
self.hajk.AMMO_PICKUP = {30, 35}
self.hajk.stats.reload = 50

--self.polymer.stats.concealment = 0
self.polymer.AMMO_MAX = 120
self.polymer.stats.damage = 170
self.polymer.stats.recoil = 32
self.polymer.stats.spread = 20
self.polymer.CLIP_AMMO_MAX = 45
self.polymer.AMMO_PICKUP = {30, 35}
self.polymer.armor_piercing_chance = 1
--self.polymer.can_shoot_through_enemy = true
self.polymer.can_shoot_through_shield = false
self.polymer.stats.reload = 50
self.polymer.kick = self.polymer.kick or {}
self.polymer.kick.standing = {
	0,
	0,
	0,
	0
}
self.polymer.kick.crouching = self.polymer.kick.standing
self.polymer.kick.steelsight = self.polymer.kick.standing

--self.m1928.stats.concealment = 0
self.m1928.AMMO_MAX = 150
self.m1928.stats.damage = 140
self.m1928.stats.recoil = 32
self.m1928.stats.spread = 20
self.m1928.AMMO_PICKUP = {30, 35}
self.m1928.armor_piercing_chance = 1
self.m1928.can_shoot_through_shield = false
--self.m1928.can_shoot_through_enemy = true
self.m1928.stats.reload = 50
self.m1928.kick = self.m1928.kick or {}
self.m1928.kick.standing = {
	0,
	0,
	0,
	0
}
self.m1928.kick.crouching = self.m1928.kick.standing
self.m1928.kick.steelsight = self.m1928.kick.standing

--self.new_mp5.stats.concealment = 0
self.new_mp5.AMMO_MAX = 180
self.new_mp5.CLIP_AMMO_MAX = 45
self.new_mp5.stats.damage = 135
self.new_mp5.stats.recoil = 32
self.new_mp5.stats.spread = 20
self.new_mp5.AMMO_PICKUP = {30, 35}
self.new_mp5.armor_piercing_chance = 1
--self.new_mp5.can_shoot_through_enemy = true
self.new_mp5.can_shoot_through_shield = false
self.new_mp5.stats.reload = 50
self.new_mp5.kick = self.new_mp5.kick or {}
self.new_mp5.kick.standing = {
	0,
	0,
	0,
	0
}
self.new_mp5.kick.crouching = self.new_mp5.kick.standing
self.new_mp5.kick.steelsight = self.new_mp5.kick.standing

--self.sr2.stats.concealment = 0
self.sr2.AMMO_MAX = 180
self.sr2.CLIP_AMMO_MAX = 45
self.sr2.stats.damage = 135
self.sr2.stats.recoil = 32
self.sr2.stats.spread = 20
self.sr2.AMMO_PICKUP = {30, 35}
self.sr2.armor_piercing_chance = 1
--self.sr2.can_shoot_through_enemy = true
self.sr2.can_shoot_through_shield = false
self.sr2.stats.reload = 50
self.sr2.kick = self.sr2.kick or {}
self.sr2.kick.standing = {
	0,
	0,
	0,
	0
}
self.sr2.kick.crouching = self.sr2.kick.standing
self.sr2.kick.steelsight = self.sr2.kick.standing

--self.sterling.stats.concealment = 0
self.sterling.AMMO_MAX = 180
self.sterling.CLIP_AMMO_MAX = 35
self.sterling.stats.damage = 135
self.sterling.stats.recoil = 32
self.sterling.stats.spread = 20
self.sterling.AMMO_PICKUP = {30, 35}
self.sterling.armor_piercing_chance = 1
--self.sterling.can_shoot_through_enemy = true
self.sterling.can_shoot_through_shield = false
self.sterling.stats.reload = 50
self.sterling.kick = self.sterling.kick or {}
self.sterling.kick.standing = {
	0,
	0,
	0,
	0
}
self.sterling.kick.crouching = self.sterling.kick.standing
self.sterling.kick.steelsight = self.sterling.kick.standing

--self.m45.stats.concealment = 0
self.m45.AMMO_MAX = 180
self.m45.CLIP_AMMO_MAX = 48
self.m45.stats.damage = 135
self.m45.stats.recoil = 32
self.m45.stats.spread = 20
self.m45.AMMO_PICKUP = {30, 35}
self.m45.armor_piercing_chance = 1
self.m45.can_shoot_through_shield = false
--self.m45.can_shoot_through_enemy = true
self.m45.stats.reload = 50
self.m45.kick = self.m45.kick or {}
self.m45.kick.standing = {
	0,
	0,
	0,
	0
}
self.m45.kick.crouching = self.m45.kick.standing
self.m45.kick.steelsight = self.m45.kick.standing

--self.uzi.stats.concealment = 0
self.uzi.AMMO_MAX = 180
self.uzi.CLIP_AMMO_MAX = 45
self.uzi.stats.damage = 135
self.uzi.stats.spread = 20
self.uzi.stats.recoil = 32
self.uzi.AMMO_PICKUP = {30, 35}
self.uzi.armor_piercing_chance = 1
--self.uzi.can_shoot_through_enemy = true
self.uzi.can_shoot_through_shield = false
self.uzi.stats.reload = 50
self.uzi.kick = self.uzi.kick or {}
self.uzi.kick.standing = {
	0,
	0,
	0,
	0
}
self.uzi.kick.crouching = self.uzi.kick.standing
self.uzi.kick.steelsight = self.uzi.kick.standing

--self.baka.stats.concealment = 0
self.baka.AMMO_MAX = 180
self.baka.CLIP_AMMO_MAX = 45
self.baka.stats.damage = 135
self.baka.stats.recoil = 32
self.baka.stats.spread = 20
self.baka.AMMO_PICKUP = {30, 35}
self.baka.armor_piercing_chance = 1
--self.baka.can_shoot_through_enemy = true
self.baka.can_shoot_through_shield = false
self.baka.stats.reload = 50
self.baka.kick = self.baka.kick or {}
self.baka.kick.standing = {
	0,
	0,
	0,
	0
}
self.baka.kick.crouching = self.baka.kick.standing
self.baka.kick.steelsight = self.baka.kick.standing

--self.scorpion.stats.concealment = 0
self.scorpion.AMMO_MAX = 180
self.scorpion.CLIP_AMMO_MAX = 30
self.scorpion.stats.damage = 135
self.scorpion.stats.recoil = 32
self.scorpion.stats.spread = 20
self.scorpion.AMMO_PICKUP = {30, 35}
self.scorpion.armor_piercing_chance = 1
--self.scorpion.can_shoot_through_enemy = true
self.scorpion.can_shoot_through_shield = false
self.scorpion.stats.reload = 50
self.scorpion.kick = self.scorpion.kick or {}
self.scorpion.kick.standing = {
	0,
	0,
	0,
	0
}
self.scorpion.kick.crouching = self.scorpion.kick.standing
self.scorpion.kick.steelsight = self.scorpion.kick.standing

--self.mp9.stats.concealment = 0
self.mp9.AMMO_MAX = 180
self.mp9.CLIP_AMMO_MAX = 38
self.mp9.stats.damage = 135
self.mp9.stats.recoil = 32
self.mp9.stats.spread = 20
self.mp9.AMMO_PICKUP = {30, 35}
self.mp9.armor_piercing_chance = 1
--self.mp9.can_shoot_through_enemy = true
self.mp9.can_shoot_through_shield = false
self.mp9.stats.reload = 50
self.mp9.kick = self.mp9.kick or {}
self.mp9.kick.standing = {
	0,
	0,
	0,
	0
}
self.mp9.kick.crouching = self.mp9.kick.standing
self.mp9.kick.steelsight = self.mp9.kick.standing

--self.mac10.stats.concealment = 0
self.mac10.AMMO_MAX = 180
self.mac10.CLIP_AMMO_MAX = 52
self.mac10.stats.damage = 135
self.mac10.stats.recoil = 32
self.mac10.stats.spread = 20
self.mac10.AMMO_PICKUP = {30, 35}
self.mac10.armor_piercing_chance = 1
--self.mac10.can_shoot_through_enemy = true
self.mac10.can_shoot_through_shield = false
self.mac10.stats.reload = 50
self.mac10.kick = self.mac10.kick or {}
self.mac10.kick.standing = {
	0,
	0,
	0,
	0
}
self.mac10.kick.crouching = self.mac10.kick.standing
self.mac10.kick.steelsight = self.mac10.kick.standing

--self.cobray.stats.concealment = 0
self.cobray.stats_modifiers = {reload = 2}
self.cobray.AMMO_MAX = 180
self.cobray.CLIP_AMMO_MAX = 60
self.cobray.stats.damage = 135
self.cobray.stats.recoil = 32
self.cobray.stats.spread = 20
self.cobray.AMMO_PICKUP = {30, 35}
self.cobray.armor_piercing_chance = 1
--self.cobray.can_shoot_through_enemy = true
self.cobray.can_shoot_through_shield = false
self.cobray.stats.reload = 70
self.cobray.kick = self.cobray.kick or {}
self.cobray.kick.standing = {
	0,
	0,
	0,
	0
}
self.cobray.kick.crouching = self.cobray.kick.standing
self.cobray.kick.steelsight = self.cobray.kick.standing

--self.mp7.stats.concealment = 0
self.mp7.AMMO_MAX = 180
self.mp7.CLIP_AMMO_MAX = 48
self.mp7.stats.damage = 150
self.mp7.stats.recoil = 32
self.mp7.stats.spread = 20
self.mp7.AMMO_PICKUP = {30, 35}
self.mp7.armor_piercing_chance = 1
--self.mp7.can_shoot_through_enemy = true
self.mp7.can_shoot_through_shield = false
self.mp7.stats.reload = 50
self.mp7.kick = self.mp7.kick or {}
self.mp7.kick.standing = {
	0,
	0,
	0,
	0
}
self.mp7.kick.crouching = self.mp7.kick.standing
self.mp7.kick.steelsight = self.mp7.kick.standing

--self.p90.stats.concealment = 0
self.p90.AMMO_MAX = 100
self.p90.stats.damage = 210
self.p90.stats.recoil = 32
self.p90.stats.spread = 32
self.p90.AMMO_PICKUP = {30, 35}
self.p90.armor_piercing_chance = 1
self.p90.can_shoot_through_enemy = true
self.p90.can_shoot_through_shield = false
self.p90.stats.reload = 50

--self.olympic.stats.concealment = 0
self.olympic.AMMO_MAX = 100
self.olympic.CLIP_AMMO_MAX = 30
self.olympic.stats.damage = 210
self.olympic.stats.recoil = 25
self.olympic.stats.spread = 20
self.olympic.armor_piercing_chance = 1
self.olympic.can_shoot_through_shield = false
--self.olympic.can_shoot_through_enemy = true
self.olympic.AMMO_PICKUP = {30, 35}
self.olympic.stats.reload = 50
self.olympic.kick = self.olympic.kick or {}
self.olympic.kick.standing = {
	0,
	0,
	0,
	0
}
self.olympic.kick.crouching = self.olympic.kick.standing
self.olympic.kick.steelsight = self.olympic.kick.standing

-- Akimbo Pistols --

self.x_deagle.stats_modifiers = {damage = 4}
--self.x_deagle.stats.concealment = 0
self.x_deagle.CLIP_AMMO_MAX = 14
self.x_deagle.AMMO_MAX = 56
self.x_deagle.stats.damage = 190
self.x_deagle.stats.recoil = 32
self.x_deagle.stats.spread = 32
self.x_deagle.can_shoot_through_shield = true
self.x_deagle.can_shoot_through_enemy = true
self.x_deagle.can_shoot_through_wall = true
self.x_deagle.armor_piercing_chance = 1
self.x_deagle.fire_mode_data.fire_rate = 0.1
self.x_deagle.AMMO_PICKUP = {20, 25}
self.x_deagle.stats.reload = 50

--self.x_1911.stats.concealment = 0
self.x_1911.stats.damage = 160
self.x_1911.stats.recoil = 32
self.x_1911.stats.spread = 32
self.x_1911.AMMO_MAX = 100
self.x_1911.AMMO_PICKUP = {20, 25}
self.x_1911.armor_piercing_chance = 1
self.x_1911.can_shoot_through_enemy = true
self.x_1911.fire_mode_data.fire_rate = 0.1
self.x_1911.can_shoot_through_shield = true
self.x_1911.stats.reload = 50

--self.x_packrat.stats.concealment = 0
self.x_packrat.stats.damage = 160
self.x_packrat.stats.recoil = 34
self.x_packrat.stats.spread = 32
self.x_packrat.AMMO_MAX = 100
self.x_packrat.AMMO_PICKUP = {20, 25}
self.x_packrat.fire_mode_data.fire_rate = 0.1
self.x_packrat.armor_piercing_chance = 1
self.x_packrat.can_shoot_through_enemy = true
self.x_packrat.can_shoot_through_shield = false
self.x_packrat.stats.reload = 50

--self.x_g17.stats.concealment = 0
self.x_g17.stats.damage = 100
self.x_g17.AMMO_MAX = 140
self.x_g17.stats.recoil = 28
self.x_g17.stats.spread = 32
self.x_g17.AMMO_PICKUP = {20, 25}
self.x_g17.armor_piercing_chance = 1
self.x_g17.can_shoot_through_enemy = true
self.x_g17.fire_mode_data.fire_rate = 0.1
self.x_g17.can_shoot_through_shield = false
self.x_g17.stats.reload = 50

--self.x_usp.stats.concealment = 0
self.x_usp.stats.damage = 140
self.x_usp.stats.recoil = 28
self.x_usp.AMMO_MAX = 120
self.x_usp.AMMO_PICKUP = {20, 25}
self.x_usp.fire_mode_data.fire_rate = 0.1
self.x_usp.armor_piercing_chance = 1
self.x_usp.can_shoot_through_enemy = true
self.x_usp.can_shoot_through_shield = false
self.x_usp.stats.reload = 50

--self.x_akmsu.stats.concealment = 0
self.x_akmsu.stats.damage = 200
self.x_akmsu.AMMO_MAX = 180
self.x_akmsu.stats.recoil = 35
self.x_akmsu.stats.spread = 1
self.x_akmsu.AMMO_PICKUP = {20, 25}
self.x_akmsu.armor_piercing_chance = 1
--self.x_akmsu.can_shoot_through_enemy = true
self.x_akmsu.can_shoot_through_shield = true
self.x_akmsu.stats.reload = 50
self.x_akmsu.kick = self.x_akmsu.kick or {}
self.x_akmsu.kick.standing = {
	0,
	0,
	0,
	0
}
self.x_akmsu.kick.crouching = self.x_akmsu.kick.standing
self.x_akmsu.kick.steelsight = self.x_akmsu.kick.standing

--self.x_mp5.stats.concealment = 0
self.x_mp5.stats.damage = 140
self.x_mp5.AMMO_MAX = 240
self.x_mp5.stats.recoil = 35
self.x_mp5.AMMO_PICKUP = {20, 25}
self.x_mp5.armor_piercing_chance = 1
--self.x_mp5.can_shoot_through_enemy = true
self.x_mp5.can_shoot_through_shield = false
self.x_mp5.stats.reload = 50
self.x_mp5.kick = self.x_mp5.kick or {}
self.x_mp5.kick.standing = {
	0,
	0,
	0,
	0
}
self.x_mp5.kick.crouching = self.x_mp5.kick.standing
self.x_mp5.kick.steelsight = self.x_mp5.kick.standing

--self.x_sr2.stats.concealment = 0
self.x_sr2.stats.damage = 140
self.x_sr2.AMMO_MAX = 240
self.x_sr2.stats.recoil = 35
self.x_sr2.AMMO_PICKUP = {20, 25}
self.x_sr2.armor_piercing_chance = 1
--self.x_sr2.can_shoot_through_enemy = true
self.x_sr2.can_shoot_through_shield = false
self.x_sr2.stats.reload = 50
self.x_sr2.kick = self.x_sr2.kick or {}
self.x_sr2.kick.standing = {
	0,
	0,
	0,
	0
}
self.x_sr2.kick.crouching = self.x_sr2.kick.standing
self.x_sr2.kick.steelsight = self.x_sr2.kick.standing

--self.x_b92fs.stats.concealment = 0
self.x_b92fs.stats.damage = 135
self.x_b92fs.stats.spread = 32
self.x_b92fs.stats.recoil = 32
self.x_b92fs.AMMO_MAX = 120
self.x_b92fs.fire_mode_data.fire_rate = 0.05
self.x_b92fs.AMMO_PICKUP = {20, 25}
self.x_b92fs.armor_piercing_chance = 1
self.x_b92fs.can_shoot_through_enemy = true
self.x_b92fs.can_shoot_through_shield = false
self.x_b92fs.stats.reload = 50

--self.x_g22c.stats.concealment = 0
self.x_g22c.stats.damage = 100
self.x_g22c.stats.recoil = 28
self.x_g22c.AMMO_MAX = 120
self.x_g22c.fire_mode_data.fire_rate = 0.05
self.x_g22c.AMMO_PICKUP = {20, 25}
self.x_g22c.armor_piercing_chance = 1
self.x_g22c.can_shoot_through_enemy = true
self.x_g22c.can_shoot_through_shield = false
self.x_g22c.stats.reload = 50

--Saw--

--self.saw.stats.concealment = 0
self.saw.CLIP_AMMO_MAX = 800
self.saw.AMMO_MAX = 1600
self.saw.stats.damage = 500
self.saw.stats.recoil = 30
self.saw.AMMO_PICKUP = {40, 45}
self.saw.armor_piercing_chance = 1
self.saw.can_shoot_through_enemy = true
self.saw.stats.reload = 50

--self.saw_secondary.stats.concealment = 0
self.saw_secondary.CLIP_AMMO_MAX = 800
self.saw_secondary.AMMO_MAX = 1600
self.saw_secondary.stats.damage = 500
self.saw_secondary.stats.recoil = 30
self.saw_secondary.AMMO_PICKUP = {40, 45}
self.saw_secondary.armor_piercing_chance = 1
self.saw_secondary.can_shoot_through_enemy = true
self.saw_secondary.stats.reload = 50

--Bows --
--Light Crossbow
--self.frankish.stats.concealment = 0
self.frankish.CLIP_AMMO_MAX = 1
self.frankish.AMMO_MAX = 60
self.frankish.stats.damage = 4400
self.frankish.stats.spread = 30
self.frankish.stats.recoil = 24
self.frankish.fire_mode_data.fire_rate = 0.5
self.frankish.can_shoot_through_enemy = true
self.frankish.armor_piercing_chance = 1
self.frankish.AMMO_PICKUP = {1, 1}
self.frankish.stats.reload = 30

--Heavy Crossbow
--self.arblast.stats.concealment = 0
self.arblast.CLIP_AMMO_MAX = 1
self.arblast.AMMO_MAX = 40
self.arblast.stats.damage = 4400
self.arblast.stats.spread = 32
self.arblast.stats.recoil = 24
self.arblast.fire_mode_data.fire_rate = 0.5
self.arblast.can_shoot_through_enemy = true
self.arblast.armor_piercing_chance = 1
self.arblast.AMMO_PICKUP = {1, 1}
self.arblast.stats.reload = 70

--self.plainsrider.stats.concealment = 0
self.plainsrider.CLIP_AMMO_MAX = 1
self.plainsrider.AMMO_MAX = 80
self.plainsrider.stats.spread = 32
self.plainsrider.stats.recoil = 24
self.plainsrider.fire_mode_data.fire_rate = 0.07
self.plainsrider.can_shoot_through_enemy = true
self.plainsrider.armor_piercing_chance = 1
self.plainsrider.AMMO_PICKUP = {1, 1}
self.plainsrider.stats.reload = 70

--self.hunter.stats.concealment = 0
self.hunter.CLIP_AMMO_MAX = 1
self.hunter.AMMO_MAX = 60
self.hunter.stats.spread = 32
self.hunter.stats.recoil = 24
self.hunter.fire_mode_data.fire_rate = 0.07
self.hunter.can_shoot_through_enemy = true
self.hunter.armor_piercing_chance = 1
self.hunter.AMMO_PICKUP = {1, 1}
self.hunter.stats.reload = 70

--self.long.stats.concealment = 0
self.long.CLIP_AMMO_MAX = 1
self.long.AMMO_MAX = 60
self.long.stats.spread = 32
self.long.stats.recoil = 24
self.long.fire_mode_data.fire_rate = 0.07
self.long.can_shoot_through_enemy = true
self.long.armor_piercing_chance = 1
self.long.AMMO_PICKUP = {1, 1}
self.long.stats.reload = 70

if not SystemFS:exists("mods/Beardlib/mod.txt") then return end

-- ====CUSTOM WEAPONS BUOY=======
--[[ Safecheck for weird weapons
if not SystemFS:exists("mods/DMCWO/mod.txt") and not SystemFS:exists("mods/Seamlink Gameplay Overhaul/mod.txt") then
--]]
	--Assault Rifles
	if SystemFS:exists("assets/mod_overrides/STG 44/main.xml")
	then
	self.stg44.stats_modifiers = {damage = 2}
	--self.scar_m203.stats.concealment = 0
	self.stg44.CLIP_AMMO_MAX = 30
	self.stg44.AMMO_MAX = 120
	self.stg44.stats.damage = 105
	self.stg44.stats.spread = 32
	self.stg44.stats.recoil = 32
	self.stg44.armor_piercing_chance = 1
	self.stg44.can_shoot_through_enemy = true
	self.stg44.can_shoot_through_shield = false
	self.stg44.AMMO_PICKUP = {20,30}
	self.stg44.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/Korean Arms Pack - K2 AR/main.xml")
	then
	self.k2.stats_modifiers = {damage = 2}
	--self.scar_m203.stats.concealment = 0
	self.k2.CLIP_AMMO_MAX = 30
	self.k2.AMMO_MAX = 120
	self.k2.stats.damage = 105
	self.k2.stats.spread = 32
	self.k2.stats.recoil = 32
	self.k2.armor_piercing_chance = 1
	self.k2.can_shoot_through_enemy = true
	self.k2.can_shoot_through_shield = false
	self.k2.AMMO_PICKUP = {20,30}
	self.k2.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/IWI Tavor X95/main.xml")
	then
	self.x95.stats_modifiers = {damage = 2}
	--self.scar_m203.stats.concealment = 0
	self.x95.CLIP_AMMO_MAX = 30
	self.x95.AMMO_MAX = 120
	self.x95.stats.damage = 105
	self.x95.stats.spread = 32
	self.x95.stats.recoil = 32
	self.x95.armor_piercing_chance = 1
	self.x95.can_shoot_through_enemy = true
	self.x95.can_shoot_through_shield = false
	self.x95.AMMO_PICKUP = {20,30}
	self.x95.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/AN-92/main.xml")
	then
	self.tilt.stats_modifiers = {damage = 2}
	self.tilt.AMMO_MAX = 90
	self.tilt.stats.damage = 125
	self.tilt.stats.spread = 32
	self.tilt.stats.recoil = 32
	self.tilt.AMMO_PICKUP = {20, 25}
	self.tilt.armor_piercing_chance = 1
	self.tilt.can_shoot_through_shield = true
	self.tilt.can_shoot_through_enemy = true
	self.tilt.can_shoot_through_wall = true
	self.tilt.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/M27/main.xml")
	then
	self.m27gear.stats_modifiers = {damage = 3} -- trouble here
	--self.m27gear.stats.concealment = 0
	--self.m27gear.CLIP_AMMO_MAX = 26
	self.m27gear.AMMO_MAX = 120
	self.m27gear.stats.damage = 70
	self.m27gear.stats.spread = 32
	self.m27gear.stats.recoil = 32
	self.m27gear.AMMO_PICKUP = {20,30}
	self.m27gear.armor_piercing_chance = 1
	self.m27gear.can_shoot_through_shield = false
	self.m27gear.can_shoot_through_enemy = true
	self.m27gear.can_shoot_through_wall = true
	self.m27gear.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/Remington R5/main.xml")
	then
	self.r5.stats_modifiers = {damage = 2}
	--self.r5.stats.concealment = 0
	self.r5.CLIP_AMMO_MAX = 30
	self.r5.AMMO_MAX = 120
	self.r5.stats.damage = 105
	self.r5.stats.spread = 32
	self.r5.stats.recoil = 32
	self.r5.armor_piercing_chance = 1
	self.r5.can_shoot_through_enemy = true
	self.r5.can_shoot_through_shield = false
	self.r5.AMMO_PICKUP = {20,30}
	self.r5.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/L1A1 Rifle/main.xml")
	then
	self.l1a1.stats_modifiers = {damage = 2}
	--self.l1a1.stats.concealment = 0
	--self.l1a1.CLIP_AMMO_MAX = 10
	self.l1a1.AMMO_MAX = 60
	self.l1a1.stats.damage = 210
	self.l1a1.stats.spread = 30
	self.l1a1.armor_piercing_chance = 1
	self.l1a1.can_shoot_through_shield = true
	self.l1a1.can_shoot_through_enemy = true
	self.l1a1.AMMO_PICKUP = {20,30}
	self.l1a1.stats.reload = 20
	else
	end
	if SystemFS:exists("assets/mod_overrides/STK Ultimax 100 Mark 5/main.xml")
	then
	self.ultimax.stats_modifiers = {damage = 2}
	--self.ultimax.CLIP_AMMO_MAX = 30
	--self.ultimax.stats.concealment = 0
	self.ultimax.AMMO_MAX = 200
	self.ultimax.stats.damage = 60
	self.ultimax.stats.spread = 20
	self.ultimax.stats.recoil = 32
	self.ultimax.AMMO_PICKUP = {20,30}
	self.ultimax.armor_piercing_chance = 1
	self.ultimax.can_shoot_through_enemy = true
	self.ultimax.can_shoot_through_shield = false
	self.ultimax.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/FN SCAR-L M203/main.xml")
	then
	self.scar_m203.stats_modifiers = {damage = 2}
	--self.scar_m203.stats.concealment = 0
	self.scar_m203.CLIP_AMMO_MAX = 30
	self.scar_m203.AMMO_MAX = 120
	self.scar_m203.stats.damage = 105
	self.scar_m203.stats.spread = 32
	self.scar_m203.stats.recoil = 32
	self.scar_m203.armor_piercing_chance = 1
	self.scar_m203.can_shoot_through_enemy = true
	self.scar_m203.can_shoot_through_shield = false
	self.scar_m203.AMMO_PICKUP = {20,30}
	self.scar_m203.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/FN SCAR-L/main.xml")
	then
	self.scarl.stats_modifiers = {damage = 2}
	--self.scarl.stats.concealment = 0
	self.scarl.CLIP_AMMO_MAX = 30
	self.scarl.AMMO_MAX = 120
	self.scarl.stats.damage = 105
	self.scarl.stats.spread = 32
	self.scarl.stats.recoil = 32
	self.scarl.armor_piercing_chance = 1
	self.scarl.can_shoot_through_enemy = true
	self.scarl.can_shoot_through_shield = false
	self.scarl.AMMO_PICKUP = {20,30}
	self.scarl.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/QBZ-95/main.xml")
	then
	self.qbz95.stats_modifiers = {damage = 2}
	--self.qbz95.stats.concealment = 0
	self.qbz95.CLIP_AMMO_MAX = 30
	self.qbz95.AMMO_MAX = 120
	self.qbz95.stats.damage = 105
	self.qbz95.stats.spread = 32
	self.qbz95.stats.recoil = 32
	self.qbz95.armor_piercing_chance = 1
	self.qbz95.can_shoot_through_enemy = true
	self.qbz95.can_shoot_through_shield = false
	self.qbz95.AMMO_PICKUP = {20,30}
	self.qbz95.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/Montana 5.56/main.xml")
	then
	self.yayo.stats_modifiers = {damage = 2}
	--self.yayo.stats.concealment = 0
	self.yayo.CLIP_AMMO_MAX = 30
	self.yayo.AMMO_MAX = 120
	self.yayo.stats.damage = 105
	self.yayo.stats.spread = 32
	self.yayo.stats.recoil = 32
	self.yayo.armor_piercing_chance = 1
	self.yayo.can_shoot_through_enemy = true
	self.yayo.can_shoot_through_shield = false
	self.yayo.AMMO_PICKUP = {20,30}
	self.yayo.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/SR-3M Vikhr/main.xml")
	then
	self.sr3m.stats_modifiers = {damage = 2}
	self.sr3m.AMMO_MAX = 90
	self.sr3m.stats.damage = 125
	self.sr3m.stats.spread = 32
	self.sr3m.stats.recoil = 32
	self.sr3m.AMMO_PICKUP = {20, 25}
	self.sr3m.armor_piercing_chance = 1
	self.sr3m.can_shoot_through_shield = true
	self.sr3m.can_shoot_through_enemy = true
	self.sr3m.can_shoot_through_wall = true
	self.sr3m.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/AEK-971/main.xml")
	then
	self.aek971.stats_modifiers = {damage = 2}
	self.aek971.AMMO_MAX = 90
	self.aek971.stats.damage = 125
	self.aek971.stats.spread = 32
	self.aek971.stats.recoil = 32
	self.aek971.AMMO_PICKUP = {20, 25}
	self.aek971.armor_piercing_chance = 1
	self.aek971.can_shoot_through_shield = true
	self.aek971.can_shoot_through_enemy = true
	self.aek971.can_shoot_through_wall = true
	self.aek971.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/SR47 Hybrid/main.xml")
	then
	self.sr47.stats_modifiers = {damage = 2}
	self.sr47.AMMO_MAX = 90
	self.sr47.stats.damage = 125
	self.sr47.stats.spread = 32
	self.sr47.stats.recoil = 32
	self.sr47.AMMO_PICKUP = {20, 25}
	self.sr47.armor_piercing_chance = 1
	self.sr47.can_shoot_through_shield = true
	self.sr47.can_shoot_through_enemy = true
	self.sr47.can_shoot_through_wall = true
	self.sr47.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/LaRue OBR 7.62/main.xml")
	then
	self.obr7.stats_modifiers = {damage = 2}
	self.obr7.AMMO_MAX = 90
	self.obr7.stats.damage = 125
	self.obr7.stats.spread = 32
	self.obr7.stats.recoil = 32
	self.obr7.AMMO_PICKUP = {20, 25}
	self.obr7.armor_piercing_chance = 1
	self.obr7.can_shoot_through_shield = true
	self.obr7.can_shoot_through_enemy = true
	self.obr7.can_shoot_through_wall = true
	self.obr7.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/ZiD A-545/main.xml")
	then
	self.a545.stats_modifiers = {damage = 2}
	self.a545.AMMO_MAX = 90
	self.a545.stats.damage = 125
	self.a545.stats.spread = 32
	self.a545.stats.recoil = 32
	self.a545.AMMO_PICKUP = {20, 25}
	self.a545.armor_piercing_chance = 1
	self.a545.can_shoot_through_shield = true
	self.a545.can_shoot_through_enemy = true
	self.a545.can_shoot_through_wall = true
	self.a545.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/Galil ACE 23/main.xml")
	then
	self.galilace.stats_modifiers = {damage = 2}
	self.galilace.AMMO_MAX = 90
	self.galilace.stats.damage = 125
	self.galilace.stats.spread = 32
	self.galilace.stats.recoil = 32
	self.galilace.AMMO_PICKUP = {20, 25}
	self.galilace.armor_piercing_chance = 1
	self.galilace.can_shoot_through_shield = true
	self.galilace.can_shoot_through_enemy = true
	self.galilace.can_shoot_through_wall = true
	self.galilace.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/SKS/main.xml")
	then
	self.sks.stats_modifiers = {damage = 2}
	self.sks.AMMO_MAX = 60
	self.sks.stats.damage = 210
	self.sks.stats.spread = 32
	--self.sks.stats.recoil = 32
	self.sks.AMMO_PICKUP = {20, 25}
	self.sks.armor_piercing_chance = 1
	self.sks.can_shoot_through_shield = true
	self.sks.can_shoot_through_enemy = true
	self.sks.can_shoot_through_wall = true
	self.sks.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/M1A1 Carbine/main.xml")
	then
	self.m1c.stats_modifiers = {damage = 2}
	self.m1c.AMMO_MAX = 60
	self.m1c.stats.damage = 210
	self.m1c.stats.spread = 32
	--self.m1c.stats.recoil = 32
	self.m1c.AMMO_PICKUP = {20, 25}
	self.m1c.armor_piercing_chance = 1
	self.m1c.can_shoot_through_shield = true
	self.m1c.can_shoot_through_enemy = true
	self.m1c.can_shoot_through_wall = true
	self.m1c.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/F2000 Tactical/main.xml")
	then
	self.f2000.stats_modifiers = {damage = 2}
	self.f2000.AMMO_MAX = 120
	self.f2000.stats.damage = 105
	self.f2000.stats.spread = 32
	self.f2000.stats.recoil = 32
	self.f2000.AMMO_PICKUP = {20, 25}
	self.f2000.armor_piercing_chance = 1
	self.f2000.can_shoot_through_shield = false
	self.f2000.can_shoot_through_enemy = true
	self.f2000.can_shoot_through_wall = true
	self.f2000.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/HK416/main.xml")
	then
	self.hk416.stats_modifiers = {damage = 2}
	self.hk416.AMMO_MAX = 120
	self.hk416.stats.damage = 105
	self.hk416.stats.spread = 32
	self.hk416.stats.recoil = 32
	self.hk416.AMMO_PICKUP = {20, 25}
	self.hk416.armor_piercing_chance = 1
	self.hk416.can_shoot_through_shield = false
	self.hk416.can_shoot_through_enemy = true
	self.hk416.can_shoot_through_wall = true
	self.hk416.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/HK XM8/main.xml")
	then
	self.xm8.stats_modifiers = {damage = 2}
	self.xm8.AMMO_MAX = 120
	self.xm8.stats.damage = 105
	self.xm8.stats.spread = 32
	self.xm8.stats.recoil = 32
	self.xm8.AMMO_PICKUP = {20, 25}
	self.xm8.armor_piercing_chance = 1
	self.xm8.can_shoot_through_shield = false
	self.xm8.can_shoot_through_enemy = true
	self.xm8.can_shoot_through_wall = true
	self.xm8.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/ARX-160/main.xml")
	then
	self.ar160.stats_modifiers = {damage = 2}
	self.ar160.AMMO_MAX = 120
	self.ar160.stats.damage = 105
	self.ar160.stats.spread = 32
	self.ar160.stats.recoil = 32
	self.ar160.AMMO_PICKUP = {20, 25}
	self.ar160.armor_piercing_chance = 1
	self.ar160.can_shoot_through_shield = false
	self.ar160.can_shoot_through_enemy = true
	self.ar160.can_shoot_through_wall = true
	self.ar160.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/AKU-94/main.xml")
	then
	self.aku94.stats_modifiers = {damage = 2}
	self.aku94.AMMO_MAX = 90
	self.aku94.stats.damage = 125
	self.aku94.stats.spread = 32
	self.aku94.stats.recoil = 32
	self.aku94.AMMO_PICKUP = {20, 25}
	self.aku94.armor_piercing_chance = 1
	self.aku94.can_shoot_through_shield = true
	self.aku94.can_shoot_through_enemy = true
	self.aku94.can_shoot_through_wall = true
	self.aku94.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/AK PDTH/main.xml")
	then
	self.akgear.stats_modifiers = {damage = 2}
	self.akgear.AMMO_MAX = 90
	self.akgear.CLIP_AMMO_MAX = 30
	self.akgear.stats.damage = 125
	self.akgear.stats.spread = 32
	self.akgear.stats.recoil = 32
	self.akgear.AMMO_PICKUP = {20, 25}
	self.akgear.armor_piercing_chance = 1
	self.akgear.can_shoot_through_shield = true
	self.akgear.can_shoot_through_enemy = true
	self.akgear.can_shoot_through_wall = true
	self.akgear.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/ACR/main.xml")
	then
	self.acw.stats_modifiers = {damage = 2}
	self.acw.AMMO_MAX = 120
	self.acw.stats.damage = 105
	self.acw.stats.spread = 32
	self.acw.stats.recoil = 32
	self.acw.AMMO_PICKUP = {20, 25}
	self.acw.armor_piercing_chance = 1
	self.acw.can_shoot_through_shield = false
	self.acw.can_shoot_through_enemy = true
	self.acw.can_shoot_through_wall = true
	self.acw.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/ACR M203/main.xml")
	then
	self.acwr.stats_modifiers = {damage = 2}
	self.acwr.AMMO_MAX = 120
	self.acwr.stats.damage = 105
	self.acwr.stats.spread = 32
	self.acwr.stats.recoil = 32
	self.acwr.AMMO_PICKUP = {20, 25}
	self.acwr.armor_piercing_chance = 1
	self.acwr.can_shoot_through_shield = false
	self.acwr.can_shoot_through_enemy = true
	self.acwr.can_shoot_through_wall = true
	self.acwr.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/AK12/main.xml")
	then
	self.ak12.stats_modifiers = {damage = 3}
	self.ak12.AMMO_MAX = 90
	self.ak12.stats.damage = 83
	self.ak12.stats.spread = 32
	self.ak12.stats.recoil = 32
	self.ak12.AMMO_PICKUP = {20, 25}
	self.ak12.armor_piercing_chance = 1
	self.ak12.can_shoot_through_shield = true
	self.ak12.can_shoot_through_enemy = true
	self.ak12.can_shoot_through_wall = true
	self.ak12.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/OTs-14-4A Groza/main.xml")
	then
	self.ots_14_4a.stats_modifiers = {damage = 3}
	self.ots_14_4a.AMMO_MAX = 90
	self.ots_14_4a.stats.damage = 70
	self.ots_14_4a.stats.spread = 32
	self.ots_14_4a.stats.recoil = 32
	self.ots_14_4a.AMMO_PICKUP = {20, 25}
	self.ots_14_4a.armor_piercing_chance = 1
	self.ots_14_4a.can_shoot_through_shield = true
	self.ots_14_4a.can_shoot_through_enemy = true
	self.ots_14_4a.can_shoot_through_wall = true
	self.ots_14_4a.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/HK G36K/main.xml")
	then
	self.g36k.stats_modifiers = {damage = 2}
	self.g36k.AMMO_MAX = 120
	self.g36k.stats.damage = 105
	self.g36k.stats.spread = 32
	self.g36k.stats.recoil = 32
	self.g36k.AMMO_PICKUP = {20, 25}
	self.g36k.armor_piercing_chance = 1
	self.g36k.can_shoot_through_shield = false
	self.g36k.can_shoot_through_enemy = true
	self.g36k.can_shoot_through_wall = true
	self.g36k.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/DDM4/main.xml")
	then
	self.gcar.stats_modifiers = {damage = 2}
	self.gcar.AMMO_MAX = 120
	self.gcar.stats.damage = 105
	self.gcar.stats.spread = 32
	self.gcar.stats.recoil = 32
	self.gcar.AMMO_PICKUP = {20, 25}
	self.gcar.armor_piercing_chance = 1
	self.gcar.can_shoot_through_shield = false
	self.gcar.can_shoot_through_enemy = true
	self.gcar.can_shoot_through_wall = true
	self.gcar.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/Magpul PDR/main.xml")
	then
	self.pdr.stats_modifiers = {damage = 2}
	self.pdr.AMMO_MAX = 120
	self.pdr.stats.damage = 105
	self.pdr.stats.spread = 32
	self.pdr.stats.recoil = 32
	self.pdr.AMMO_PICKUP = {20, 25}
	self.pdr.armor_piercing_chance = 1
	self.pdr.can_shoot_through_shield = false
	self.pdr.can_shoot_through_enemy = true
	self.pdr.can_shoot_through_wall = true
	self.pdr.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/Howa Type 89-64/main.xml")
	then
	self.howa.stats_modifiers = {damage = 2}
	self.howa.AMMO_MAX = 120
	self.howa.stats.damage = 105
	self.howa.stats.spread = 32
	self.howa.stats.recoil = 32
	self.howa.AMMO_PICKUP = {20, 25}
	self.howa.armor_piercing_chance = 1
	self.howa.can_shoot_through_shield = false
	self.howa.can_shoot_through_enemy = true
	self.howa.can_shoot_through_wall = true
	self.howa.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/Colt R0991/main.xml")
	then
	self.r0991.AMMO_MAX = 180 --uh TECHNICALLY, its 9mm so... SMG stats
	self.r0991.stats.damage = 135
	--self.r0991.stats.spread = 32
	self.r0991.stats.recoil = 32
	self.r0991.AMMO_PICKUP = {20, 25}
	self.r0991.armor_piercing_chance = 1
	self.r0991.can_shoot_through_shield = false
	self.r0991.can_shoot_through_enemy = true
	self.r0991.can_shoot_through_wall = true
	self.r0991.stats.reload = 50
	else
	end
	if SystemFS:exists("assets/mod_overrides/PP-19-01 Vityaz/main.xml")
	then
	--self.vityaz.stats.concealment = 0
	self.vityaz.AMMO_MAX = 128
	self.vityaz.stats.damage = 135
	self.vityaz.stats.recoil = 32
	--self.vityaz.CLIP_AMMO_MAX = 20
	self.vityaz.stats.spread = 20
	--self.vityaz.can_shoot_through_enemy = true
	self.vityaz.can_shoot_through_shield = false
	self.vityaz.armor_piercing_chance = 1
	self.vityaz.AMMO_PICKUP = {30, 35}
	self.vityaz.stats.reload = 50
	self.vityaz.kick = self.vityaz.kick or {}
	self.vityaz.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.vityaz.kick.crouching = self.vityaz.kick.standing
	self.vityaz.kick.steelsight = self.vityaz.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/Valmet Rk.62/main.xml")
	then
	self.rk62.stats_modifiers = {damage = 2}
	self.rk62.AMMO_MAX = 120
	self.rk62.stats.damage = 125
	self.rk62.stats.spread = 32
	self.rk62.stats.recoil = 32
	self.rk62.AMMO_PICKUP = {20,30}
	self.rk62.armor_piercing_chance = 1
	self.rk62.can_shoot_through_shield = true
	self.rk62.can_shoot_through_enemy = true
	self.rk62.can_shoot_through_wall = true
	self.rk62.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/SA vz. 58P/main.xml")
	then
	self.vz58.stats_modifiers = {damage = 2}
	self.vz58.AMMO_MAX = 120
	self.vz58.stats.damage = 125
	self.vz58.stats.spread = 32
	self.vz58.stats.recoil = 32
	self.vz58.AMMO_PICKUP = {20,30}
	self.vz58.armor_piercing_chance = 1
	self.vz58.can_shoot_through_shield = true
	self.vz58.can_shoot_through_enemy = true
	self.vz58.can_shoot_through_wall = true
	self.vz58.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/9A-91/main.xml")
	then
	self.stealthy.stats_modifiers = {damage = 2}
	self.stealthy.AMMO_MAX = 120
	self.stealthy.stats.damage = 125
	self.stealthy.stats.spread = 32
	self.stealthy.stats.recoil = 32
	self.stealthy.AMMO_PICKUP = {20,30}
	self.stealthy.armor_piercing_chance = 1
	self.stealthy.can_shoot_through_shield = true
	self.stealthy.can_shoot_through_enemy = true
	self.stealthy.can_shoot_through_wall = true
	self.stealthy.stats.reload = 30
	else
	end
	--Shotguns
	if SystemFS:exists("assets/mod_overrides/AK12-76/main.xml")
	then
	self.ak12_76.stats_modifiers = {damage = 2}
	self.ak12_76.AMMO_MAX = 20
	self.ak12_76.stats.damage = 200
	self.ak12_76.stats.spread = 1
	self.ak12_76.AMMO_PICKUP = {10,15}
	--self.ak12_76.can_shoot_through_enemy = true
	self.ak12_76.stats.reload = 15
	self.ak12_76.damage_near = 100
	self.ak12_76.damage_far = 1500
	else
	end
	if SystemFS:exists("assets/mod_overrides/Nova Shotgun/main.xml")
	then
	self.novas.stats_modifiers = {damage = 5}
	self.novas.AMMO_MAX = 20
	self.novas.stats.damage = 210
	self.novas.stats.spread = 1
	self.novas.AMMO_PICKUP = {10,15}
	--self.novas.can_shoot_through_enemy = true
	self.novas.stats.reload = 15
	self.novas.damage_near = 100
	self.novas.damage_far = 1500
	else
	end
	if SystemFS:exists("assets/mod_overrides/Browning Automatic Shotgun/main.xml")
	then
	self.auto5.stats_modifiers = {damage = 5}
	self.auto5.AMMO_MAX = 20
	self.auto5.stats.damage = 210
	self.auto5.stats.spread = 1
	self.auto5.AMMO_PICKUP = {10,15}
	--self.auto5.can_shoot_through_enemy = true
	self.auto5.stats.reload = 15
	self.auto5.damage_near = 100
	self.auto5.damage_far = 1500
	else
	end
	if SystemFS:exists("assets/mod_overrides/Mossberg 590/main.xml")
	then
	self.m590.stats_modifiers = {damage = 5}
	self.m590.AMMO_MAX = 20
	self.m590.stats.damage = 210
	self.m590.stats.spread = 1
	self.m590.AMMO_PICKUP = {10,15}
	--self.novas.can_shoot_through_enemy = true
	self.m590.stats.reload = 15
	self.m590.damage_near = 100
	self.m590.damage_far = 1500
	else
	end
	if SystemFS:exists("assets/mod_overrides/Trench Gun/main.xml")
	then
	self.trench.stats_modifiers = {damage = 5}
	self.trench.AMMO_MAX = 20
	self.trench.stats.damage = 210
	self.trench.stats.spread = 1
	self.trench.AMMO_PICKUP = {10,15}
	--self.trench.can_shoot_through_enemy = true
	self.trench.stats.reload = 15
	self.trench.damage_near = 100
	self.trench.damage_far = 1500
	else
	end
	if SystemFS:exists("assets/mod_overrides/USAS12 Standalone/main.xml")
	then
	self.usas12.stats_modifiers = {damage = 2}
	self.usas12.AMMO_MAX = 40
	self.usas12.stats.damage = 160
	self.usas12.stats.spread = 1
	self.usas12.AMMO_PICKUP = {10,15}
	--self.novas.can_shoot_through_enemy = true
	self.usas12.stats.reload = 15
	self.usas12.damage_near = 100
	self.usas12.damage_far = 1500
	else
	end
	if SystemFS:exists("assets/mod_overrides/TOZ-66/main.xml")
	then
	self.toz66.stats_modifiers = {damage = 12}
	self.toz66.AMMO_MAX = 16
	self.toz66.stats.damage = 220
	self.toz66.stats.recoil = 32
	self.toz66.AMMO_PICKUP = {10,15}
	--self.toz66.armor_piercing_chance = 1
	--self.toz66.can_shoot_through_enemy = true
	self.toz66.stats.reload = 15
	self.toz66.damage_near = 100
	self.toz66.damage_far = 1500
	else
	end
	if SystemFS:exists("assets/mod_overrides/Baikal MP-153/main.xml")
	then
	self.mp153.stats_modifiers = {damage = 5}
	self.mp153.AMMO_MAX = 16
	self.mp153.stats.damage = 220
	self.mp153.AMMO_PICKUP = {10,15}
	--self.mp153.armor_piercing_chance = 1
	--self.mp153.can_shoot_through_enemy = true
	self.mp153.stats.reload = 15
	self.mp153.damage_near = 100
	self.mp153.damage_far = 1500
	else
	end
	if SystemFS:exists("assets/mod_overrides/TOZ-34/main.xml")
	then
	self.toz34.stats_modifiers = {damage = 12}
	self.toz34.AMMO_MAX = 16
	self.toz34.stats.damage = 220
	self.toz34.AMMO_PICKUP = {10,15}
	--self.toz34.armor_piercing_chance = 1
	--self.toz34.can_shoot_through_enemy = true
	self.toz34.stats.reload = 15
	self.toz34.damage_near = 100
	self.toz34.damage_far = 1500
	else
	end
	if SystemFS:exists("assets/mod_overrides/TOZ-194/main.xml")
	then
	self.toz194.stats_modifiers = {damage = 5}
	self.toz194.AMMO_MAX = 24
	self.toz194.stats.damage = 180
	self.toz194.stats.spread = 0
	self.toz194.AMMO_PICKUP = {10,15}
	--self.toz194.armor_piercing_chance = 1
	--self.toz194.can_shoot_through_enemy = true
	self.toz194.fire_mode_data.fire_rate = 0.2
	self.toz194.stats.reload = 15
	self.toz194.damage_near = 100
	self.toz194.damage_far = 1500
	else
	end
--Battle Rifles
	if SystemFS:exists("assets/mod_overrides/Ohio Ordnance HCAR/main.xml")
	then
	self.hcar.stats_modifiers = {damage = 2}
	--self.hcar.stats.concealment = 0
	--self.hcar.CLIP_AMMO_MAX = 20
	self.hcar.AMMO_MAX = 60
	self.hcar.stats.damage = 210
	self.hcar.stats.recoil = 20
	self.hcar.stats.spread = 30
	self.hcar.can_shoot_through_shield = true
	self.hcar.armor_piercing_chance = 1
	self.hcar.can_shoot_through_enemy = true
	self.hcar.AMMO_PICKUP = {20,30}
	self.hcar.stats.reload = 35
	else
	end
--Sniper Rifles
	if SystemFS:exists("assets/mod_overrides/Winchester Model 1894/main.xml")
	then
	--self.winchester1894.stats.concealment = 0
	self.winchester1894.stats_modifiers = {damage = 100}
	self.winchester1894.CLIP_AMMO_MAX = 20
	self.winchester1894.AMMO_MAX = 40
	self.winchester1894.stats.damage = 17
	self.winchester1894.stats.recoil = 32
	self.winchester1894.AMMO_PICKUP = {5, 9}
	--self.winchester1894.fire_mode_data.fire_rate = 2
	self.winchester1894.stats.reload = 50
	self.winchester1894.fire_mode_data.fire_rate = 1.4
	else
	end
	if SystemFS:exists("assets/mod_overrides/Arisaka Type 38/main.xml")
	then
	--self.type38.stats.concealment = 0
	self.type38.stats_modifiers = {damage = 100}
	self.type38.CLIP_AMMO_MAX = 5
	self.type38.AMMO_MAX = 40
	self.type38.stats.damage = 35
	self.type38.stats.recoil = 32
	self.type38.AMMO_PICKUP = {5, 9}
	self.type38.stats.reload = 50
	self.type38.fire_mode_data.fire_rate = 1.3
	else
	end
	if SystemFS:exists("assets/mod_overrides/Ruger-14/main.xml")
	then
	self.mini14.stats_modifiers = {damage = 2}
	--self.mini14.stats.concealment = 0
	--self.mini14.CLIP_AMMO_MAX = 10
	self.mini14.AMMO_MAX = 60
	self.mini14.stats.damage = 190
	self.mini14.stats.spread = 32
	self.mini14.can_shoot_through_shield = true
	self.mini14.armor_piercing_chance = 1
	self.mini14.can_shoot_through_enemy = true
	self.mini14.AMMO_PICKUP = {20,30}
	self.mini14.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/XM21/main.xml")
	then
	self.xm21.stats_modifiers = {damage = 2}
	--self.xm21.stats.concealment = 0
	--self.xm21.CLIP_AMMO_MAX = 10
	self.xm21.AMMO_MAX = 60
	self.xm21.stats.damage = 190
	self.xm21.stats.spread = 32
	self.xm21.can_shoot_through_shield = true
	self.xm21.armor_piercing_chance = 1
	self.xm21.can_shoot_through_enemy = true
	self.xm21.AMMO_PICKUP = {20,30}
	self.xm21.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/700 Nitro/main.xml")
	then
	self.Nitro.armor_piercing_chance = 1
    self.Nitro.AMMO_MAX = 30
    self.Nitro.CLIP_AMMO_MAX = 2
	self.Nitro.stats_modifiers = {damage = 80}	
    self.Nitro.AMMO_PICKUP = {5, 6}
    self.Nitro.panic_suppression_chance = 0.2
    self.Nitro.stats.spread = 32
    self.Nitro.stats.recoil = 32
    self.Nitro.stats.spread_moving = 32
    self.Nitro.stats.zoom = 3
    self.Nitro.stats.suppression = 2
    self.Nitro.stats.alert_size = 7
    self.Nitro.stats.reload = 12
    self.Nitro.stats.value = 5
	self.Nitro.can_shoot_through_shield = true
	self.Nitro.can_shoot_through_enemy = true
	self.Nitro.can_shoot_through_wall = true
	self.Nitro.fire_mode_data.fire_rate = 0.5
	self.Nitro.kick.standing = {
		3,
		5.0,
		-0.5,
		0.5
	}
	else
	end	
	if SystemFS:exists("assets/mod_overrides/M40A5/main.xml")
	then
	self.m40a5.stats_modifiers = {damage = 100}
	self.m40a5.CLIP_AMMO_MAX = 5
	self.m40a5.AMMO_MAX = 40
	self.m40a5.stats.damage = 35
	self.m40a5.stats.spread = 32
	self.m40a5.stats.recoil = 32
	self.m40a5.AMMO_PICKUP = {5, 9}
	self.m40a5.armor_piercing_chance = 1
	self.m40a5.can_shoot_through_shield = true
	self.m40a5.can_shoot_through_enemy = true
	self.m40a5.can_shoot_through_wall = true
	self.m40a5.stats.reload = 50
	self.m40a5.fire_mode_data.fire_rate = 1.5
	else
	end
	if SystemFS:exists("assets/mod_overrides/Marlin Model 1894 Custom/main.xml")
	then
	self.m1894.stats_modifiers = {damage = 100}
	self.m1894.CLIP_AMMO_MAX = 15
	self.m1894.AMMO_MAX = 40
	self.m1894.stats.damage = 17
	self.m1894.stats.spread = 32
	self.m1894.stats.recoil = 32
	self.m1894.AMMO_PICKUP = {5, 9}
	self.m1894.armor_piercing_chance = 1
	self.m1894.can_shoot_through_shield = true
	self.m1894.can_shoot_through_enemy = true
	self.m1894.can_shoot_through_wall = true
	self.m1894.stats.reload = 50
	else
	end
	if SystemFS:exists("assets/mod_overrides/SV-98/main.xml")
	then
	self.sv98.stats_modifiers = {damage = 100}
	self.sv98.CLIP_AMMO_MAX = 5
	self.sv98.AMMO_MAX = 40
	self.sv98.stats.damage = 35
	self.sv98.stats.spread = 32
	self.sv98.stats.recoil = 32
	self.sv98.AMMO_PICKUP = {5, 9}
	self.sv98.armor_piercing_chance = 1
	self.sv98.can_shoot_through_shield = true
	self.sv98.can_shoot_through_enemy = true
	self.sv98.can_shoot_through_wall = true
	self.sv98.stats.reload = 50
	self.sv98.fire_mode_data.fire_rate = 1.3
	else
	end
	if SystemFS:exists("assets/mod_overrides/FD338/main.xml")
	then
	self.fd338.stats_modifiers = {damage = 100}
	self.fd338.CLIP_AMMO_MAX = 7
	self.fd338.AMMO_MAX = 40
	self.fd338.stats.damage = 17
	self.fd338.stats.spread = 32
	self.fd338.stats.recoil = 32
	self.fd338.AMMO_PICKUP = {5, 9}
	self.fd338.armor_piercing_chance = 1
	self.fd338.can_shoot_through_shield = true
	self.fd338.can_shoot_through_enemy = true
	self.fd338.can_shoot_through_wall = true
	self.fd338.fire_mode_data.fire_rate = 0.6
	self.fd338.stats.reload = 50
	else
	end
	if SystemFS:exists("assets/mod_overrides/L115/main.xml")
	then
	self.l115.stats_modifiers = {damage = 100}
	self.l115.CLIP_AMMO_MAX = 5
	self.l115.AMMO_MAX = 40
	self.l115.stats.damage = 35
	self.l115.stats.spread = 32
	self.l115.stats.recoil = 32
	self.l115.AMMO_PICKUP = {5, 9}
	self.l115.armor_piercing_chance = 1
	self.l115.can_shoot_through_shield = true
	self.l115.can_shoot_through_enemy = true
	self.l115.can_shoot_through_wall = true
	self.l115.stats.reload = 50
	else
	end
	if SystemFS:exists("assets/mod_overrides/AWP/main.xml")
	then
	self.awpgear.stats_modifiers = {damage = 100}
	self.awpgear.CLIP_AMMO_MAX = 6
	self.awpgear.AMMO_MAX = 60 -- wtf did you do Nepgearsy?
	self.awpgear.stats.damage = 35
	self.awpgear.stats.spread = 32
	self.awpgear.stats.recoil = 32
	self.awpgear.AMMO_PICKUP = {5, 9}
	self.awpgear.armor_piercing_chance = 1
	self.awpgear.can_shoot_through_shield = true
	self.awpgear.can_shoot_through_enemy = true
	self.awpgear.can_shoot_through_wall = true
	self.awpgear.stats.reload = 50
	else
	end
	if SystemFS:exists("assets/mod_overrides/FY-JS Sniper Rifle/main.xml")
	then
	self.fyjs.stats_modifiers = {damage = 100}
	self.fyjs.CLIP_AMMO_MAX = 5
	self.fyjs.AMMO_MAX = 40
	self.fyjs.stats.damage = 35
	self.fyjs.stats.spread = 32
	self.fyjs.stats.recoil = 32
	self.fyjs.AMMO_PICKUP = {5, 9}
	self.fyjs.armor_piercing_chance = 1
	self.fyjs.can_shoot_through_shield = true
	self.fyjs.can_shoot_through_enemy = true
	self.fyjs.can_shoot_through_wall = true
	self.fyjs.stats.reload = 50
	self.fyjs.fire_mode_data.fire_rate = 1.3
	else
	end
	if SystemFS:exists("assets/mod_overrides/McMillan TAC-50/main.xml")
	then
	self.tac50.stats_modifiers = {damage = 100}
	self.tac50.CLIP_AMMO_MAX = 5
	self.tac50.AMMO_MAX = 30
	self.tac50.stats.damage = 125
	self.tac50.stats.spread = 32
	self.tac50.stats.recoil = 32
	self.tac50.AMMO_PICKUP = {5, 9}
	self.tac50.armor_piercing_chance = 1
	self.tac50.can_shoot_through_shield = true
	self.tac50.can_shoot_through_enemy = true
	self.tac50.can_shoot_through_wall = true
	self.tac50.stats.reload = 50
	else
	end
	if SystemFS:exists("assets/mod_overrides/Hecate AMP/main.xml")
	then
	self.hecate.stats_modifiers = {damage = 100}
	self.hecate.CLIP_AMMO_MAX = 5
	self.hecate.AMMO_MAX = 30
	self.hecate.stats.damage = 125
	self.hecate.stats.spread = 32
	self.hecate.stats.recoil = 32
	self.hecate.AMMO_PICKUP = {5, 9}
	self.hecate.armor_piercing_chance = 1
	self.hecate.can_shoot_through_shield = true
	self.hecate.can_shoot_through_enemy = true
	self.hecate.can_shoot_through_wall = true
	self.hecate.stats.reload = 50
	else
	end
	if SystemFS:exists("assets/mod_overrides/QBU-88/main.xml")
	then
	self.qbu88.stats_modifiers = {damage = 100}
	self.qbu88.CLIP_AMMO_MAX = 20
	self.qbu88.AMMO_MAX = 40
	self.qbu88.stats.damage = 17
	self.qbu88.stats.spread = 32
	self.qbu88.stats.recoil = 32
	self.qbu88.AMMO_PICKUP = {5, 9}
	self.qbu88.armor_piercing_chance = 1
	self.qbu88.can_shoot_through_shield = true
	self.qbu88.can_shoot_through_enemy = true
	self.qbu88.can_shoot_through_wall = true
	self.qbu88.CAN_TOGGLE_FIREMODE = false
	self.qbu88.fire_mode_data.fire_rate = 0.4
	self.qbu88.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/KAC SR-25 E2 ACC/main.xml")
	then
	self.sr25.stats_modifiers = {damage = 100}
	self.sr25.CLIP_AMMO_MAX = 20
	self.sr25.AMMO_MAX = 40
	self.sr25.stats.damage = 17
	self.sr25.stats.spread = 32
	self.sr25.stats.recoil = 32
	self.sr25.AMMO_PICKUP = {5, 9}
	self.sr25.armor_piercing_chance = 1
	self.sr25.can_shoot_through_shield = true
	self.sr25.can_shoot_through_enemy = true
	self.sr25.can_shoot_through_wall = true
	self.sr25.CAN_TOGGLE_FIREMODE = false
	self.sr25.fire_mode_data.fire_rate = 0.4
	self.sr25.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/VSS/main.xml")
	then
	self.vss.stats_modifiers = {damage = 100}
	--self.vss.CLIP_AMMO_MAX = 10
	self.vss.AMMO_MAX = 40
	self.vss.stats.damage = 17
	self.vss.stats.spread = 32
	self.vss.stats.recoil = 32
	self.vss.AMMO_PICKUP = {5, 9}
	self.vss.armor_piercing_chance = 1
	self.vss.fire_mode_data.fire_rate = 0.4
	self.vss.CAN_TOGGLE_FIREMODE = false
	self.vss.can_shoot_through_shield = true
	self.vss.can_shoot_through_enemy = true
	self.vss.can_shoot_through_wall = true
	self.vss.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/SCAR20/main.xml")
	then
	self.scargear.stats_modifiers = {damage = 100}
	--self.scargear.CLIP_AMMO_MAX = 10
	--self.scargear.AMMO_MAX = 40
	self.scargear.stats.damage = 17
	self.scargear.stats.spread = 32
	self.scargear.stats.recoil = 32
	self.scargear.AMMO_PICKUP = {5, 9}
	self.scargear.armor_piercing_chance = 1
	self.scargear.fire_mode_data.fire_rate = 0.4
	self.scargear.CAN_TOGGLE_FIREMODE = false
	self.scargear.can_shoot_through_shield = true
	self.scargear.can_shoot_through_enemy = true
	self.scargear.can_shoot_through_wall = true
	self.scargear.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/SVD DRAGUNOV/main.xml") or SystemFS:exists("assets/mod_overrides/SVD/main.xml")
	then
	self.svd.stats_modifiers = {damage = 100}
	self.svd.CLIP_AMMO_MAX = 10
	self.svd.AMMO_MAX = 30
	self.svd.FIRE_MODE = "single"
	self.svd.stats.damage = 25
	self.svd.stats.spread = 32
	self.svd.stats.recoil = 32
	self.svd.can_shoot_through_enemy = true
	self.svd.can_shoot_through_shield = true
	self.svd.armor_piercing_chance = 1
	self.svd.AMMO_PICKUP = {5, 9}
	self.svd.stats.reload = 18
	else
	end
	if SystemFS:exists("assets/mod_overrides/JNG90/main.xml")
	then
	self.jng.stats_modifiers = {damage = 100}
	self.jng.CLIP_AMMO_MAX = 6
	self.jng.AMMO_MAX = 40
	self.jng.stats.damage = 35
	self.jng.stats.spread = 32
	self.jng.stats.recoil = 32
	self.jng.AMMO_PICKUP = {5, 9}
	self.jng.armor_piercing_chance = 1
	self.jng.can_shoot_through_shield = true
	self.jng.can_shoot_through_enemy = true
	self.jng.can_shoot_through_wall = true
	self.jng.stats.reload = 50
	else
	end
	if SystemFS:exists("assets/mod_overrides/FRF2/main.xml")
	then
	self.frf2.stats_modifiers = {damage = 100}
	self.frf2.CLIP_AMMO_MAX = 6
	self.frf2.AMMO_MAX = 40
	self.frf2.stats.damage = 35
	self.frf2.stats.spread = 32
	self.frf2.stats.recoil = 32
	self.frf2.AMMO_PICKUP = {5, 9}
	self.frf2.armor_piercing_chance = 1
	self.frf2.can_shoot_through_shield = true
	self.frf2.can_shoot_through_enemy = true
	self.frf2.can_shoot_through_wall = true
	self.frf2.stats.reload = 50
	else
	end
	if SystemFS:exists("assets/mod_overrides/M200/main.xml") or SystemFS:exists("assets/mod_overrides/CheyTac M200/main.xml")
	then
	self.m200.stats_modifiers = {damage = 100}
	self.m200.CLIP_AMMO_MAX = 7
	self.m200.AMMO_MAX = 40
	self.m200.stats.damage = 35
	self.m200.stats.spread = 32
	self.m200.stats.recoil = 32
	self.m200.AMMO_PICKUP = {5, 9}
	self.m200.armor_piercing_chance = 1
	self.m200.can_shoot_through_shield = true
	self.m200.can_shoot_through_enemy = true
	self.m200.can_shoot_through_wall = true
	self.m200.stats.reload = 50
	else 
	end
	if SystemFS:exists("assets/mod_overrides/unis_rifle/main.xml")
	then
	self.unirifle.stats_modifiers = {damage = 2}
	self.unirifle.CLIP_AMMO_MAX = 60
	self.unirifle.AMMO_MAX = 180
	self.unirifle.stats.damage = 100
	self.unirifle.stats.spread = 32
	self.unirifle.stats.recoil = 32
	self.unirifle.AMMO_PICKUP = {5, 9}
	self.unirifle.armor_piercing_chance = 1
	self.unirifle.can_shoot_through_shield = true
	self.unirifle.can_shoot_through_enemy = true
	self.unirifle.can_shoot_through_wall = true
	self.unirifle.stats.reload = 50
	else 
	end
	if SystemFS:exists("assets/mod_overrides/dragunov_svu/main.xml")
	then
	self.svudragunov.stats_modifiers = {damage = 100}
	self.svudragunov.CLIP_AMMO_MAX = 6
	self.svudragunov.AMMO_MAX = 40
	self.svudragunov.stats.damage = 35
	self.svudragunov.stats.spread = 32
	self.svudragunov.stats.recoil = 32
	self.svudragunov.AMMO_PICKUP = {5, 9}
	self.svudragunov.armor_piercing_chance = 1
	self.svudragunov.can_shoot_through_shield = true
	self.svudragunov.can_shoot_through_enemy = true
	self.svudragunov.can_shoot_through_wall = true
	self.svudragunov.stats.reload = 50
	self.svudragunov.fire_mode_data.fire_rate = 1.4
	else
	end
	if SystemFS:exists("assets/mod_overrides/UniSniper/main.xml")
	then
	self.unibarrett.stats_modifiers = {damage = 100}
	self.unibarrett.CLIP_AMMO_MAX = 5
	self.unibarrett.AMMO_MAX = 20
	self.unibarrett.stats.damage = 125
	self.unibarrett.stats.spread = 32
	self.unibarrett.stats.recoil = 32
	self.unibarrett.AMMO_PICKUP = {5, 9}
	self.unibarrett.armor_piercing_chance = 1
	self.unibarrett.can_shoot_through_shield = true
	self.unibarrett.can_shoot_through_enemy = true
	self.unibarrett.can_shoot_through_wall = true
	self.unibarrett.stats.reload = 30
	else
	end
--Pistols
	if SystemFS:exists("assets/mod_overrides/water_pistol/main.xml")
	then
	self.watergun.CLIP_AMMO_MAX = 20
	self.watergun.AMMO_MAX = 60
	self.watergun.stats.damage = 140
	self.watergun.stats.spread = 20
	self.watergun.stats.recoil = 32
	self.watergun.can_shoot_through_enemy = true
	self.watergun.can_shoot_through_shield = false
	self.watergun.armor_piercing_chance = 1
	self.watergun.AMMO_PICKUP = {30,40}
	self.watergun.stats.reload = 50
	self.watergun.fire_mode_data.fire_rate = 0.1
	else
	end
	if SystemFS:exists("assets/mod_overrides/TT-33/main.xml")
	then
	self.tt.AMMO_MAX = 60
	self.tt.stats.damage = 150
	self.tt.stats.recoil = 32
	self.tt.stats.spread = 32
	self.tt.can_shoot_through_enemy = true
	self.tt.armor_piercing_chance = 1
	self.tt.AMMO_PICKUP = {20,30}
	self.tt.fire_mode_data.fire_rate = 0.1
	self.tt.can_shoot_through_shield = false
	self.tt.stats.reload = 20
	else
	end
	if SystemFS:exists("assets/mod_overrides/Walther P38/main.xml")
	then
	self.p38.AMMO_MAX = 60
	self.p38.stats.damage = 150
	self.p38.stats.recoil = 32
	self.p38.stats.spread = 32
	self.p38.can_shoot_through_enemy = true
	self.p38.armor_piercing_chance = 1
	self.p38.AMMO_PICKUP = {20,30}
	self.p38.fire_mode_data.fire_rate = 0.1
	self.p38.can_shoot_through_shield = false
	self.p38.stats.reload = 20
	else
	end
	if SystemFS:exists("assets/mod_overrides/Blizzard 443 Pistol/main.xml")
	then
	self.grach.AMMO_MAX = 60
	self.grach.stats.damage = 150
	self.grach.stats.recoil = 32
	self.grach.stats.spread = 32
	self.grach.can_shoot_through_enemy = true
	self.grach.armor_piercing_chance = 1
	self.grach.AMMO_PICKUP = {20,30}
	self.grach.fire_mode_data.fire_rate = 0.1
	self.grach.can_shoot_through_shield = false
	self.grach.stats.reload = 50
	else
	end
	if SystemFS:exists("assets/mod_overrides/Korean Arms Pack - K5 Pistol/main.xml")
	then
	--self.k5.stats.concealment = 0
	self.k5.AMMO_MAX = 150
	self.k5.stats.damage = 80
	self.k5.stats.recoil = 32
	self.k5.stats.spread = 32
	self.k5.can_shoot_through_enemy = true
	self.k5.can_shoot_through_shield = false
	self.k5.armor_piercing_chance = 1
	self.k5.AMMO_PICKUP = {15, 20}
	self.k5.fire_mode_data.fire_rate = 0.1
	self.k5.stats.reload = 20
	else
	end
	if SystemFS:exists("assets/mod_overrides/AP Pistol/main.xml")
	then
	self.appistol.AMMO_MAX = 90
	self.appistol.stats.damage = 85
	self.appistol.stats.recoil = 32
	--self.appistol.stats.spread = 32
	self.appistol.can_shoot_through_enemy = true
	self.appistol.armor_piercing_chance = 1
	self.appistol.AMMO_PICKUP = {20,30}
	--self.appistol.fire_mode_data.fire_rate = 0.05
	self.appistol.can_shoot_through_shield = false
	self.appistol.stats.reload = 20
	self.appistol.kick = self.appistol.kick or {}
	self.appistol.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.appistol.kick.crouching = self.appistol.kick.standing
	self.appistol.kick.steelsight = self.appistol.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/Makarov/main.xml")
	then
	--self.b92fs.stats.concealment = 0
	self.pm.AMMO_MAX = 150
	self.pm.stats.damage = 120
	self.pm.stats.recoil = 32
	self.pm.stats.spread = 32
	self.pm.can_shoot_through_enemy = true
	self.pm.can_shoot_through_shield = false
	self.pm.armor_piercing_chance = 1
	self.pm.AMMO_PICKUP = {15, 20}
	self.pm.fire_mode_data.fire_rate = 0.1
	self.pm.stats.reload = 20
	else
	end
	if SystemFS:exists("assets/mod_overrides/APS/main.xml")
	then
	self.aps.AMMO_MAX = 90
	self.aps.stats.damage = 120
	self.aps.stats.recoil = 32
	--self.aps.stats.spread = 32
	self.aps.can_shoot_through_enemy = true
	self.aps.armor_piercing_chance = 1
	self.aps.AMMO_PICKUP = {20,30}
	--self.aps.fire_mode_data.fire_rate = 0.05
	self.aps.can_shoot_through_shield = false
	self.aps.stats.reload = 20
	self.aps.kick = self.aps.kick or {}
	self.aps.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.aps.kick.crouching = self.aps.kick.standing
	self.aps.kick.steelsight = self.aps.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/KRISS KARD/main.xml")
	then
	self.kard.AMMO_MAX = 90
	self.kard.stats.damage = 120
	self.kard.stats.recoil = 32
	--self.kard.stats.spread = 32
	self.kard.can_shoot_through_enemy = true
	self.kard.armor_piercing_chance = 1
	self.kard.AMMO_PICKUP = {20,30}
	--self.kard.fire_mode_data.fire_rate = 0.05
	self.kard.can_shoot_through_shield = false
	self.kard.stats.reload = 20
	self.kard.kick = self.kard.kick or {}
	self.kard.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.kard.kick.crouching = self.kard.kick.standing
	self.kard.kick.steelsight = self.kard.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/OTs-33/main.xml")
	then
	self.ots_33.AMMO_MAX = 90
	self.ots_33.stats.damage = 120
	self.ots_33.stats.recoil = 32
	--self.ots_33.stats.spread = 32
	self.ots_33.can_shoot_through_enemy = true
	self.ots_33.armor_piercing_chance = 1
	self.ots_33.AMMO_PICKUP = {20,30}
	--self.ots_33.fire_mode_data.fire_rate = 0.05
	self.ots_33.can_shoot_through_shield = false
	self.ots_33.stats.reload = 20
	self.ots_33.kick = self.ots_33.kick or {}
	self.ots_33.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.ots_33.kick.crouching = self.ots_33.kick.standing
	self.ots_33.kick.steelsight = self.ots_33.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/QSZ-92 Pistol/main.xml")
	then
	self.qs.AMMO_MAX = 60
	self.qs.stats.damage = 150
	self.qs.stats.recoil = 32
	self.qs.stats.spread = 32
	self.qs.can_shoot_through_enemy = true
	self.qs.armor_piercing_chance = 1
	self.qs.AMMO_PICKUP = {20,30}
	self.qs.fire_mode_data.fire_rate = 0.1
	self.qs.can_shoot_through_shield = false
	self.qs.stats.reload = 20
	else
	end
	if SystemFS:exists("assets/mod_overrides/Five-Seven Pistol/main.xml")
	then
	self.fs.AMMO_MAX = 60
	self.fs.stats.damage = 150
	self.fs.stats.recoil = 32
	self.fs.stats.spread = 32
	self.fs.can_shoot_through_enemy = true
	self.fs.armor_piercing_chance = 1
	self.fs.AMMO_PICKUP = {20,30}
	self.fs.fire_mode_data.fire_rate = 0.1
	self.fs.can_shoot_through_shield = false
	self.fs.stats.reload = 50
	else
	end
	if SystemFS:exists("assets/mod_overrides/SW MP 40 Pro/main.xml")
	then
	self.sw40pro.AMMO_MAX = 100
	self.sw40pro.stats.damage = 150
	self.sw40pro.stats.recoil = 32
	self.sw40pro.stats.spread = 32
	self.sw40pro.can_shoot_through_enemy = true
	self.sw40pro.armor_piercing_chance = 1
	self.sw40pro.AMMO_PICKUP = {20,30}
	self.sw40pro.fire_mode_data.fire_rate = 0.1
	self.sw40pro.can_shoot_through_shield = false
	self.sw40pro.stats.reload = 20
	else
	end
	if SystemFS:exists("assets/mod_overrides/SW Model 642/main.xml")
	then
	self.sw642.stats_modifiers = {damage = 4}
	--self.sw642.stats.concealment = 0
	self.sw642.CLIP_AMMO_MAX = 5
	self.sw642.AMMO_MAX = 20
	self.sw642.stats.damage = 190
	self.sw642.stats.spread = 32
	self.sw642.can_shoot_through_shield = true
	self.sw642.can_shoot_through_enemy = true
	self.sw642.can_shoot_through_wall = true
	self.sw642.armor_piercing_chance = 1
	self.sw642.AMMO_PICKUP = {10,15}
	self.sw642.fire_mode_data.fire_rate = 0.1
	self.sw642.stats.reload = 20
	else
	end
--SMGs
	if SystemFS:exists("assets/mod_overrides/Minebea PM-9/main.xml")
	then
	--self.minebea.stats.concealment = 0
	self.minebea.AMMO_MAX = 180
	self.minebea.stats.damage = 75
	self.minebea.stats.recoil = 32
	self.minebea.stats.spread = 20
	self.minebea.AMMO_PICKUP = {30, 35}
	self.minebea.armor_piercing_chance = 1
	--self.minebea.can_shoot_through_enemy = true
	self.minebea.can_shoot_through_shield = false
	self.minebea.stats.reload = 50
	self.minebea.kick = self.minebea.kick or {}
	self.minebea.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.minebea.kick.crouching = self.minebea.kick.standing
	self.minebea.kick.steelsight = self.minebea.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/Korean Arms Pack - K1A7 SMG/main.xml")
	then
	self.k1a7.stats_modifiers = {damage = 2}
	--self.scar_m203.stats.concealment = 0
	self.k1a7.CLIP_AMMO_MAX = 30
	self.k1a7.AMMO_MAX = 120
	self.k1a7.stats.damage = 105
	self.k1a7.stats.spread = 32
	self.k1a7.stats.recoil = 32
	self.k1a7.armor_piercing_chance = 1
	self.k1a7.can_shoot_through_enemy = true
	self.k1a7.can_shoot_through_shield = false
	self.k1a7.AMMO_PICKUP = {20,30}
	self.k1a7.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/Mx4 Storm/main.xml")
	then
	--self.storm.stats.concealment = 0
	self.storm.AMMO_MAX = 120
	self.storm.stats.damage = 170
	self.storm.stats.recoil = 32
	self.storm.stats.spread = 20
	self.storm.CLIP_AMMO_MAX = 45
	self.storm.AMMO_PICKUP = {30, 35}
	self.storm.armor_piercing_chance = 1
	--self.storm.can_shoot_through_enemy = true
	self.storm.can_shoot_through_shield = false
	self.storm.stats.reload = 50
	self.storm.kick = self.storm.kick or {}
	self.storm.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.storm.kick.crouching = self.storm.kick.standing
	self.storm.kick.steelsight = self.storm.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/Spectre M4/main.xml")
	then
	--self.spectre_m4.stats.concealment = 0
	self.spectre_m4.AMMO_MAX = 180
	self.spectre_m4.stats.damage = 135
	self.spectre_m4.stats.spread = 20
	self.spectre_m4.stats.recoil = 32
	self.spectre_m4.armor_piercing_chance = 1
	self.spectre_m4.can_shoot_through_enemy = true
	self.spectre_m4.can_shoot_through_shield = false
	self.spectre_m4.AMMO_PICKUP = {30, 35}
	self.spectre_m4.stats.reload = 50
	else
	end
	if SystemFS:exists("assets/mod_overrides/MSMC/main.xml")
	then
	--self.msmc.stats.concealment = 0
	self.msmc.AMMO_MAX = 180
	self.msmc.stats.damage = 135
	self.msmc.stats.spread = 32
	self.msmc.stats.recoil = 32
	self.msmc.armor_piercing_chance = 1
	self.msmc.can_shoot_through_enemy = true
	self.msmc.can_shoot_through_shield = false
	self.msmc.AMMO_PICKUP = {30, 35}
	self.msmc.stats.reload = 50
	else
	end
	if SystemFS:exists("assets/mod_overrides/Scorpion Evo/main.xml")
	then
	self.evo.AMMO_MAX = 180
	self.evo.stats.damage = 135
	self.evo.CLIP_AMMO_MAX = 41
	self.evo.stats.spread = 20
	--self.evo.stats.spread = 32
	self.evo.stats.recoil = 32
	self.evo.AMMO_PICKUP = {20, 25}
	self.evo.armor_piercing_chance = 1
	self.evo.can_shoot_through_shield = false
	self.evo.can_shoot_through_enemy = true
	self.evo.can_shoot_through_wall = true
	self.evo.stats.reload = 50
	self.evo.kick = self.evo.kick or {}
	self.evo.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.evo.kick.crouching = self.evo.kick.standing
	self.evo.kick.steelsight = self.evo.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/PP-91 Kedr/main.xml")
	then
	self.kedr.AMMO_MAX = 180
	self.kedr.CLIP_AMMO_MAX = 35
	self.kedr.stats.spread = 20
	self.kedr.stats.damage = 135
	--self.mpx.stats.spread = 28
	self.kedr.stats.recoil = 32
	self.kedr.AMMO_PICKUP = {20,30}
	self.kedr.armor_piercing_chance = 1
	self.kedr.can_shoot_through_shield = false
	self.kedr.can_shoot_through_enemy = true
	self.kedr.can_shoot_through_wall = true
	self.kedr.stats.reload = 50
	self.kedr.kick = self.kedr.kick or {}
	self.kedr.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.kedr.kick.crouching = self.kedr.kick.standing
	self.kedr.kick.steelsight = self.kedr.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/Magpul FMG-9/main.xml")
	then
	self.fmg9.AMMO_MAX = 180
	self.fmg9.stats.damage = 135
	self.fmg9.CLIP_AMMO_MAX = 45
	self.fmg9.stats.spread = 20
	--self.mpx.stats.spread = 28
	self.fmg9.stats.recoil = 32
	self.fmg9.AMMO_PICKUP = {30,40}
	self.fmg9.armor_piercing_chance = 1
	self.fmg9.can_shoot_through_shield = false
	self.fmg9.can_shoot_through_enemy = true
	self.fmg9.can_shoot_through_wall = true
	self.fmg9.stats.reload = 50
	self.fmg9.kick = self.fmg9.kick or {}
	self.fmg9.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.fmg9.kick.crouching = self.fmg9.kick.standing
	self.fmg9.kick.steelsight = self.fmg9.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/PPSh-41/main.xml")
	then
	self.ppsh.AMMO_MAX = 180
	self.ppsh.stats.damage = 135
	self.ppsh.CLIP_AMMO_MAX = 45
	self.ppsh.stats.spread = 20
	--self.ppsh.stats.spread = 28
	self.ppsh.stats.recoil = 32
	self.ppsh.AMMO_PICKUP = {25,40}
	self.ppsh.armor_piercing_chance = 1
	self.ppsh.can_shoot_through_shield = false
	self.ppsh.can_shoot_through_enemy = true
	self.ppsh.can_shoot_through_wall = true
	--self.ppsh.CAN_TOGGLE_FIREMODE = true
	self.ppsh.stats.reload = 50
	self.ppsh.kick = self.ppsh.kick or {}
	self.ppsh.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.ppsh.kick.crouching = self.ppsh.kick.standing
	self.ppsh.kick.steelsight = self.ppsh.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/PP2000/main.xml")
	then
	self.pp.AMMO_MAX = 180
	self.pp.stats.damage = 135
	self.pp.CLIP_AMMO_MAX = 60
	self.pp.stats.spread = 20
	--self.pp.stats.spread = 28
	self.pp.stats.recoil = 32
	self.pp.AMMO_PICKUP = {25,40}
	self.pp.armor_piercing_chance = 1
	self.pp.can_shoot_through_shield = false
	self.pp.can_shoot_through_enemy = true
	self.pp.can_shoot_through_wall = true
	self.pp.stats.reload = 50
	self.pp.kick = self.pp.kick or {}
	self.pp.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.pp.kick.crouching = self.pp.kick.standing
	self.pp.kick.steelsight = self.pp.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/MPX/main.xml")
	then
	self.mpx.AMMO_MAX = 180
	self.mpx.stats.damage = 135
	self.mpx.CLIP_AMMO_MAX = 45
	self.mpx.stats.spread = 20
	--self.mpx.stats.spread = 28
	self.mpx.stats.recoil = 32
	self.mpx.AMMO_PICKUP = {25,40}
	self.mpx.armor_piercing_chance = 1
	self.mpx.can_shoot_through_shield = false
	self.mpx.can_shoot_through_enemy = true
	self.mpx.can_shoot_through_wall = true
	self.mpx.stats.reload = 50
	self.mpx.kick = self.mpx.kick or {}
	self.mpx.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.mpx.kick.crouching = self.mpx.kick.standing
	self.mpx.kick.steelsight = self.mpx.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/UMP/main.xml")
	then
	self.ump.AMMO_MAX = 180
	self.ump.stats.damage = 135
	self.ump.CLIP_AMMO_MAX = 39
	self.ump.stats.spread = 20
	--self.ump.stats.spread = 28
	self.ump.stats.recoil = 32
	self.ump.AMMO_PICKUP = {25,40}
	self.ump.armor_piercing_chance = 1
	self.ump.can_shoot_through_shield = false
	self.ump.can_shoot_through_enemy = true
	self.ump.can_shoot_through_wall = true
	self.ump.stats.reload = 50
	self.ump.kick = self.ump.kick or {}
	self.ump.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.ump.kick.crouching = self.ump.kick.standing
	self.ump.kick.steelsight = self.ump.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/CBJ-MS/main.xml")
	then
	self.cbjms.AMMO_MAX = 180
	--self.cbjms.CLIP_AMMO_MAX = 45
	self.cbjms.stats.spread = 20
	self.cbjms.stats.damage = 135
	--self.cbjms.stats.spread = 28
	self.cbjms.stats.recoil = 32
	self.cbjms.AMMO_PICKUP = {30,40}
	self.cbjms.armor_piercing_chance = 1
	self.cbjms.can_shoot_through_shield = false
	self.cbjms.can_shoot_through_enemy = true
	self.cbjms.can_shoot_through_wall = true
	self.cbjms.stats.reload = 50
	self.cbjms.kick = self.cbjms.kick or {}
	self.cbjms.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.cbjms.kick.crouching = self.cbjms.kick.standing
	self.cbjms.kick.steelsight = self.cbjms.kick.standing
	else
	end
--LMGs
	if SystemFS:exists("assets/mod_overrides/M60/main.xml")
	then
	self.m60.AMMO_MAX = 300
	self.m60.stats.damage = 180
	self.m60.stats.recoil = 32
	self.m60.stats.spread = 16
	self.m60.AMMO_PICKUP = {30,40}
	self.m60.armor_piercing_chance = 1
	self.m60.can_shoot_through_shield = true
	self.m60.can_shoot_through_enemy = true
	self.m60.can_shoot_through_wall = true
	self.m60.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/RPD/main.xml")
	then
	self.rpd.AMMO_MAX = 300
	self.rpd.stats.damage = 180
	self.rpd.stats.recoil = 32
	self.rpd.stats.spread = 16
	self.rpd.AMMO_PICKUP = {30,40}
	self.rpd.armor_piercing_chance = 1
	self.rpd.can_shoot_through_shield = true
	self.rpd.can_shoot_through_enemy = true
	self.rpd.can_shoot_through_wall = true
	self.rpd.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/Negev NG-5/main.xml")
	then
	self.negev.AMMO_MAX = 300
	self.negev.stats.damage = 180
	self.negev.stats.recoil = 32
	self.negev.stats.spread = 16
	self.negev.AMMO_PICKUP = {30,40}
	self.negev.armor_piercing_chance = 1
	self.negev.can_shoot_through_shield = true
	self.negev.can_shoot_through_enemy = true
	self.negev.can_shoot_through_wall = true
	self.negev.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/PKP Pecheneg/main.xml")
	then
	self.pecheneg.AMMO_MAX = 400
	self.pecheneg.CLIP_AMMO_MAX = 200
	self.pecheneg.stats.damage = 170
	self.pecheneg.stats.recoil = 32
	self.pecheneg.stats.spread = 16
	self.pecheneg.AMMO_PICKUP = {30,40}
	self.pecheneg.armor_piercing_chance = 1
	self.pecheneg.can_shoot_through_shield = true
	self.pecheneg.can_shoot_through_enemy = true
	self.pecheneg.can_shoot_through_wall = true
	self.pecheneg.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/Korean Arms Pack - K3 LMG/main.xml")
	then
	self.k3.AMMO_MAX = 400
	self.k3.CLIP_AMMO_MAX = 200
	self.k3.stats.damage = 140
	self.k3.stats.recoil = 32
	self.k3.stats.spread = 19
	self.k3.AMMO_PICKUP = {30,40}
	self.k3.armor_piercing_chance = 1
	self.k3.can_shoot_through_shield = true
	self.k3.can_shoot_through_enemy = true
	self.k3.can_shoot_through_wall = true
	self.k3.stats.reload = 30
	else
	end
	if SystemFS:exists("assets/mod_overrides/Browning Automatic Rifle/main.xml")
	then
	self.bar.stats_modifiers = {damage = 2}
	self.bar.CLIP_AMMO_MAX = 20
	self.bar.AMMO_MAX = 120
	self.bar.stats.damage = 125
	self.bar.stats.recoil = 32
	self.bar.stats.spread = 16
	self.bar.AMMO_PICKUP = {30,40}
	self.bar.armor_piercing_chance = 1
	self.bar.can_shoot_through_shield = true
	self.bar.can_shoot_through_enemy = true
	self.bar.can_shoot_through_wall = true
	self.bar.stats.reload = 30
	else
	end
--Magnums
	if SystemFS:exists("assets/mod_overrides/Browning HP/main.xml")
	then
	self.hpb.stats_modifiers = {damage = 3}
	--self.hpb.stats.concealment = 0
	self.hpb.CLIP_AMMO_MAX = 10
	self.hpb.AMMO_MAX = 40
	self.hpb.stats.damage = 200
	self.hpb.stats.spread = 32
	self.hpb.stats.recoil = 32
	self.hpb.can_shoot_through_shield = true
	self.hpb.can_shoot_through_enemy = true
	self.hpb.can_shoot_through_wall = true
	self.hpb.armor_piercing_chance = 1
	self.hpb.AMMO_PICKUP = {10, 15}
	self.hpb.fire_mode_data.fire_rate = 0.1
	self.hpb.stats.reload = 20
	else
	end
	if SystemFS:exists("assets/mod_overrides/The Triad/main.xml")
	then
	self.triad.stats_modifiers = {damage = 5}
	--self.triad.stats.concealment = 0
	self.triad.CLIP_AMMO_MAX = 6
	self.triad.AMMO_MAX = 24
	self.triad.stats.damage = 200
	self.triad.stats.spread = 32
	self.triad.stats.recoil = 32
	self.triad.can_shoot_through_shield = true
	self.triad.can_shoot_through_enemy = true
	self.triad.can_shoot_through_wall = true
	self.triad.armor_piercing_chance = 1
	self.triad.AMMO_PICKUP = {10, 15}
	self.triad.fire_mode_data.fire_rate = 0.1
	self.triad.stats.reload = 20
	else
	end
	if SystemFS:exists("assets/mod_overrides/Mateba Model 6 Unica/main.xml")
	then
	self.unica6.stats_modifiers = {damage = 5}
	self.unica6.AMMO_MAX = 24
	self.unica6.stats.damage = 220
	self.unica6.stats.spread = 32
	self.unica6.stats.recoil = 32
	self.unica6.AMMO_PICKUP = {10, 15}
	self.unica6.armor_piercing_chance = 1
	self.unica6.can_shoot_through_shield = true
	self.unica6.can_shoot_through_enemy = true
	self.unica6.can_shoot_through_wall = true
	self.unica6.fire_mode_data.fire_rate = 0.1
	self.unica6.stats.reload = 23
	else
	end
	if SystemFS:exists("assets/mod_overrides/OVW McCree Peacekeeper/main.xml")
	then
	self.peacekeeper.stats_modifiers = {damage = 5}
	self.peacekeeper.AMMO_MAX = 24
	self.peacekeeper.stats.damage = 220
	self.peacekeeper.stats.spread = 32
	self.peacekeeper.stats.recoil = 32
	self.peacekeeper.AMMO_PICKUP = {10, 15}
	self.peacekeeper.armor_piercing_chance = 1
	self.peacekeeper.can_shoot_through_shield = true
	self.peacekeeper.can_shoot_through_enemy = true
	self.peacekeeper.can_shoot_through_wall = true
	self.peacekeeper.fire_mode_data.fire_rate = 0.1
	self.peacekeeper.stats.reload = 23
	else
	end
	if SystemFS:exists("assets/mod_overrides/Nagant M1895/main.xml")
	then
	self.m1895.stats_modifiers = {damage = 4, reload = 2}
	self.m1895.AMMO_MAX = 28
	self.m1895.stats.damage = 220
	self.m1895.stats.spread = 32
	self.m1895.stats.recoil = 32
	self.m1895.AMMO_PICKUP = {10, 15}
	self.m1895.armor_piercing_chance = 1
	self.m1895.can_shoot_through_shield = true
	self.m1895.can_shoot_through_enemy = true
	self.m1895.can_shoot_through_wall = true
	self.m1895.fire_mode_data.fire_rate = 0.1
	self.m1895.stats.reload = 20
	else
	end
	if SystemFS:exists("assets/mod_overrides/S&W M29 Revolver/main.xml")
	then
	self.m29.stats_modifiers = {damage = 5}
	self.m29.AMMO_MAX = 24
	self.m29.stats.damage = 220
	self.m29.stats.spread = 32
	self.m29.stats.recoil = 32
	self.m29.AMMO_PICKUP = {10, 15}
	self.m29.armor_piercing_chance = 1
	self.m29.can_shoot_through_shield = true
	self.m29.can_shoot_through_enemy = true
	self.m29.can_shoot_through_wall = true
	self.m29.fire_mode_data.fire_rate = 0.1
	self.m29.stats.reload = 23
	else
	end
	if SystemFS:exists("assets/mod_overrides/M29 Revolver/main.xml")
	then
	self.m29.stats_modifiers = {damage = 5}
	self.m29.AMMO_MAX = 24
	self.m29.stats.damage = 220
	self.m29.stats.spread = 32
	self.m29.stats.recoil = 32
	self.m29.AMMO_PICKUP = {10, 15}
	self.m29.armor_piercing_chance = 1
	self.m29.can_shoot_through_shield = true
	self.m29.can_shoot_through_enemy = true
	self.m29.can_shoot_through_wall = true
	self.m29.fire_mode_data.fire_rate = 0.1
	self.m29.stats.reload = 23
	else
	end
	if SystemFS:exists("assets/mod_overrides/shatters_fury_revolver/main.xml")
	then
	self.shatters_fury.stats_modifiers = {damage = 5}
	self.shatters_fury.AMMO_MAX = 24
	self.shatters_fury.stats.damage = 220
	self.shatters_fury.stats.spread = 32
	self.shatters_fury.stats.recoil = 32
	self.shatters_fury.AMMO_PICKUP = {10, 15}
	self.shatters_fury.armor_piercing_chance = 1
	self.shatters_fury.can_shoot_through_shield = true
	self.shatters_fury.can_shoot_through_enemy = true
	self.shatters_fury.can_shoot_through_wall = true
	self.shatters_fury.fire_mode_data.fire_rate = 0.1
	self.shatters_fury.stats.reload = 15
	else
	end
--Akimbo Pistols
	if SystemFS:exists("assets/mod_overrides/More Akimbo Pistols")
	then 
	self.x_beagle.AMMO_MAX = 120
	self.x_beagle.stats.damage = 160
	self.x_beagle.stats.spread = 32
	self.x_beagle.stats.recoil = 32
	self.x_beagle.can_shoot_through_enemy = true
	self.x_beagle.can_shoot_through_shield = true
	self.x_beagle.armor_piercing_chance = 1
	self.x_beagle.AMMO_PICKUP = {20, 30}
	self.x_beagle.stats.reload = 50
	self.x_beagle.fire_mode_data.fire_rate = 0.1
	self.x_beagle.animations.has_steelsight_stance = true
	else
	end
	if SystemFS:exists("assets/mod_overrides/More Akimbo Pistols")
	then 
	self.x_pl14.AMMO_MAX = 120
	self.x_pl14.stats.damage = 160
	self.x_pl14.stats.spread = 32
	self.x_pl14.stats.recoil = 32
	self.x_pl14.can_shoot_through_enemy = true
	self.x_pl14.can_shoot_through_shield = false
	self.x_pl14.armor_piercing_chance = 1
	self.x_pl14.AMMO_PICKUP = {20, 30}
	self.x_pl14.stats.reload = 50
	self.x_pl14.fire_mode_data.fire_rate = 0.1
	self.x_pl14.animations.has_steelsight_stance = true
	else
	end
	if SystemFS:exists("assets/mod_overrides/More Akimbo Pistols")
	then 
	self.x_p226.AMMO_MAX = 120
	self.x_p226.stats.damage = 160
	self.x_p226.stats.spread = 32
	self.x_p226.stats.recoil = 32
	self.x_p226.can_shoot_through_enemy = true
	self.x_p226.can_shoot_through_shield = false
	self.x_p226.armor_piercing_chance = 1
	self.x_p226.AMMO_PICKUP = {20, 30}
	self.x_p226.stats.reload = 50
	self.x_p226.fire_mode_data.fire_rate = 0.1
	self.x_p226.animations.has_steelsight_stance = true
	else
	end
	if SystemFS:exists("assets/mod_overrides/More Akimbo Pistols")
	then 
	self.x_hs2000.AMMO_MAX = 200
	self.x_hs2000.stats.damage = 120
	self.x_hs2000.stats.spread = 32
	self.x_hs2000.stats.recoil = 32
	self.x_hs2000.can_shoot_through_enemy = true
	self.x_hs2000.can_shoot_through_shield = false
	self.x_hs2000.armor_piercing_chance = 1
	self.x_hs2000.AMMO_PICKUP = {20, 30}
	self.x_hs2000.stats.reload = 50
	self.x_hs2000.fire_mode_data.fire_rate = 0.1
	self.x_hs2000.animations.has_steelsight_stance = true
	else
	end
	if SystemFS:exists("assets/mod_overrides/SW Model 642/main.xml")
	then
	self.x_sw642.stats_modifiers = {damage = 4}
	--self.sw642.stats.concealment = 0
	self.x_sw642.CLIP_AMMO_MAX = 10
	self.x_sw642.AMMO_MAX = 20
	self.x_sw642.stats.damage = 200
	self.x_sw642.stats.spread = 32
	self.x_sw642.stats.recoil = 32
	self.x_sw642.can_shoot_through_shield = true
	self.x_sw642.can_shoot_through_enemy = true
	self.x_sw642.can_shoot_through_wall = true
	self.x_sw642.armor_piercing_chance = 1
	self.x_sw642.AMMO_PICKUP = {10, 15}
	self.x_sw642.fire_mode_data.fire_rate = 0.1
	self.x_sw642.stats.reload = 20
	self.x_sw642.CAN_TOGGLE_FIREMODE = false
	else
	end
	if SystemFS:exists("assets/mod_overrides/APS/main.xml")
	then
	self.x_aps.AMMO_MAX = 240
	self.x_aps.stats.damage = 135
	self.x_aps.stats.recoil = 32
	--self.x_aps.can_shoot_through_enemy = true
	self.x_aps.can_shoot_through_shield = false
	self.x_aps.armor_piercing_chance = 1
	self.x_aps.AMMO_PICKUP = {30,40}
	self.x_aps.stats.reload = 50
	self.x_aps.stats.spread= 15
	self.x_aps.stats.suppression = 12
	self.x_aps.stats.alert_size = 9
	self.x_aps.kick = self.x_aps.kick or {}
	self.x_aps.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.x_aps.kick.crouching = self.x_aps.kick.standing
	self.x_aps.kick.steelsight = self.x_aps.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/Akimbo G18s/main.xml")
	then
	self.x_g18.stats.damage = 120
	self.x_g18.can_shoot_through_enemy = true
	self.x_g18.can_shoot_through_shield = false
	self.x_g18.armor_piercing_chance = 1
	self.x_g18.AMMO_PICKUP = {20, 30}
	else
	end
	if SystemFS:exists("assets/mod_overrides/More Akimbo Pistols")
	then 
	self.x_ppk.AMMO_MAX = 200
	self.x_ppk.stats.damage = 120
	self.x_ppk.stats.spread = 32
	self.x_ppk.stats.recoil = 32
	self.x_ppk.can_shoot_through_enemy = true
	self.x_ppk.can_shoot_through_shield = false
	self.x_ppk.armor_piercing_chance = 1
	self.x_ppk.AMMO_PICKUP = {20, 30}
	self.x_ppk.stats.reload = 50
	self.x_ppk.fire_mode_data.fire_rate = 0.1
	self.x_ppk.animations.has_steelsight_stance = true
	else
	end
--Akimbo SMGs
	if SystemFS:exists("assets/mod_overrides/Spectre M4/main.xml")
	then
	--self.x_spectre_m4.stats.concealment = 0
	self.x_spectre_m4.AMMO_MAX = 180
	self.x_spectre_m4.stats.damage = 135
	self.x_spectre_m4.stats.spread = 20
	self.x_spectre_m4.stats.recoil = 32
	self.x_spectre_m4.armor_piercing_chance = 1
	self.x_spectre_m4.can_shoot_through_enemy = true
	self.x_spectre_m4.can_shoot_through_shield = false
	self.x_spectre_m4.AMMO_PICKUP = {30, 35}
	self.x_spectre_m4.stats.reload = 50
	else
	end
	if SystemFS:exists("assets/mod_overrides/Akimbo MPX/main.xml")
	then
	self.x_mpx.AMMO_MAX = 240
	self.x_mpx.stats.damage = 140
	self.x_mpx.CLIP_AMMO_MAX = 80
	--self.x_mpx.stats.spread = 32
	self.x_mpx.stats.recoil = 35
	self.x_mpx.AMMO_PICKUP = {30,40}
	self.x_mpx.armor_piercing_chance = 1
	self.x_mpx.can_shoot_through_shield = false
	self.x_mpx.can_shoot_through_enemy = true
	self.x_mpx.can_shoot_through_wall = true
	self.x_mpx.stats.reload = 50
	self.x_mpx.kick = self.x_mpx.kick or {}
	self.x_mpx.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.x_mpx.kick.crouching = self.x_mpx.kick.standing
	self.x_mpx.kick.steelsight = self.x_mpx.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/Magpul FMG-9/main.xml")
	then
	self.x_fmg9.AMMO_MAX = 240
	self.x_fmg9.CLIP_AMMO_MAX = 80
	self.x_fmg9.stats.damage = 135
	--self.x_fmg9.stats.spread = 32
	self.x_fmg9.stats.recoil = 35
	self.x_fmg9.AMMO_PICKUP = {30,40}
	self.x_fmg9.armor_piercing_chance = 1
	self.x_fmg9.can_shoot_through_shield = false
	self.x_fmg9.can_shoot_through_enemy = true
	self.x_fmg9.can_shoot_through_wall = true
	self.x_fmg9.stats.reload = 50
	self.x_fmg9.kick = self.x_fmg9.kick or {}
	self.x_fmg9.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.x_fmg9.kick.crouching = self.x_fmg9.kick.standing
	self.x_fmg9.kick.steelsight = self.x_fmg9.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/Akimbo MAC-10/main.xml")
	then
	self.x_mac10.AMMO_MAX = 240
	--elf.x_mac10.CLIP_AMMO_MAX = 120
	self.x_mac10.stats.damage = 135
	--self.mpx.stats.spread = 28
	self.x_mac10.stats.recoil = 35
	self.x_mac10.AMMO_PICKUP = {30,40}
	self.x_mac10.armor_piercing_chance = 1
	self.x_mac10.can_shoot_through_shield = false
	self.x_mac10.can_shoot_through_enemy = true
	self.x_mac10.can_shoot_through_wall = true
	self.x_mac10.stats.reload = 50
	self.x_mac10.kick = self.x_mac10.kick or {}
	self.x_mac10.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.x_mac10.kick.crouching = self.x_mac10.kick.standing
	self.x_mac10.kick.steelsight = self.x_mac10.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/Akimbo Sidekick/main.xml")
	then
	self.x_sidekick.AMMO_MAX = 240
	--self.x_sidekick.CLIP_AMMO_MAX = 68
	self.x_sidekick.stats.damage = 135
	--self.x_sidekick.stats.spread = 28
	self.x_sidekick.stats.recoil = 35
	self.x_sidekick.AMMO_PICKUP = {30,40}
	self.x_sidekick.armor_piercing_chance = 1
	self.x_sidekick.can_shoot_through_shield = false
	self.x_sidekick.can_shoot_through_enemy = true
	self.x_sidekick.can_shoot_through_wall = true
	self.x_sidekick.stats.reload = 50
	self.x_sidekick.kick = self.x_sidekick.kick or {}
	self.x_sidekick.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.x_sidekick.kick.crouching = self.x_sidekick.kick.standing
	self.x_sidekick.kick.steelsight = self.x_sidekick.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/Akimbo UMPs/main.xml")
	then
	self.x_ump.AMMO_MAX = 180
	self.x_ump.stats.damage = 135
	self.x_ump.CLIP_AMMO_MAX = 60
	self.x_ump.stats.recoil = 32
	--self.x_ump.can_shoot_through_enemy = true
	self.x_ump.can_shoot_through_shield = false
	self.x_ump.armor_piercing_chance = 1
	self.x_ump.AMMO_PICKUP = {30,40}
	self.x_ump.stats.reload = 50
	self.x_ump.stats.spread= 15
	self.x_ump.stats.suppression = 12
	self.x_ump.stats.alert_size = 9
	self.x_ump.kick = self.x_ump.kick or {}
	self.x_ump.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.x_ump.kick.crouching = self.x_ump.kick.standing
	self.x_ump.kick.steelsight = self.x_ump.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/Goldeneye Akimbo Pack/main.xml")
	then
	self.x_p90.AMMO_MAX = 100
	self.x_p90.stats.damage = 200
	self.x_p90.stats.recoil = 32
	self.x_p90.CLIP_AMMO_MAX = 100
	--self.x_p90.can_shoot_through_enemy = true
	self.x_p90.can_shoot_through_shield = false
	self.x_p90.armor_piercing_chance = 1
	self.x_p90.AMMO_PICKUP = {30,40}
	self.x_p90.stats.reload = 50
	self.x_p90.stats.spread= 15
	self.x_p90.stats.suppression = 12
	self.x_p90.stats.alert_size = 9
	self.x_p90.kick = self.x_p90.kick or {}
	self.x_p90.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.x_p90.kick.crouching = self.x_p90.kick.standing
	self.x_p90.kick.steelsight = self.x_p90.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/Goldeneye Akimbo Pack/main.xml")
	then
	self.x_skorpion.AMMO_MAX = 240
	self.x_skorpion.stats.damage = 135
	self.x_skorpion.stats.recoil = 32
	--self.x_skorpion.can_shoot_through_enemy = true
	self.x_skorpion.can_shoot_through_shield = false
	self.x_skorpion.armor_piercing_chance = 1
	self.x_skorpion.AMMO_PICKUP = {30,40}
	self.x_skorpion.stats.reload = 50
	self.x_skorpion.stats.spread= 15
	self.x_skorpion.stats.suppression = 12
	self.x_skorpion.stats.alert_size = 9
	self.x_skorpion.kick = self.x_skorpion.kick or {}
	self.x_skorpion.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.x_skorpion.kick.crouching = self.x_skorpion.kick.standing
	self.x_skorpion.kick.steelsight = self.x_skorpion.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/Akimbo Jacket's Pieces/main.xml")
	then
	self.x_cobray.AMMO_MAX = 240
	self.x_cobray.stats.damage = 135
	self.x_cobray.CLIP_AMMO_MAX = 120
	self.x_cobray.stats.recoil = 32
	--self.x_cobray.can_shoot_through_enemy = true
	self.x_cobray.can_shoot_through_shield = false
	self.x_cobray.armor_piercing_chance = 1
	self.x_cobray.AMMO_PICKUP = {30,40}
	self.x_cobray.stats.reload = 50
	self.x_cobray.stats.spread= 15
	self.x_cobray.stats.suppression = 12
	self.x_cobray.stats.alert_size = 9
	self.x_cobray.kick = self.x_cobray.kick or {}
	self.x_cobray.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.x_cobray.kick.crouching = self.x_cobray.kick.standing
	self.x_cobray.kick.steelsight = self.x_cobray.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/Goldeneye Akimbo Pack/main.xml")
	then
	self.x_miniuzi.AMMO_MAX = 240
	self.x_miniuzi.stats.damage = 135
	self.x_miniuzi.stats.recoil = 32
	self.x_miniuzi.CLIP_AMMO_MAX = 120
	--self.x_miniuzi.can_shoot_through_enemy = true
	self.x_miniuzi.can_shoot_through_shield = false
	self.x_miniuzi.armor_piercing_chance = 1
	self.x_miniuzi.AMMO_PICKUP = {30,40}
	self.x_miniuzi.stats.reload = 50
	self.x_miniuzi.stats.spread= 15
	self.x_miniuzi.stats.suppression = 12
	self.x_miniuzi.stats.alert_size = 9
	self.x_miniuzi.kick = self.x_miniuzi.kick or {}
	self.x_miniuzi.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.x_miniuzi.kick.crouching = self.x_miniuzi.kick.standing
	self.x_miniuzi.kick.steelsight = self.x_miniuzi.kick.standing
	else
	end
--Akimbo Magnums
	if SystemFS:exists("assets/mod_overrides/S&W M29 Revolver/main.xml")
	then
	self.x_m29.stats_modifiers = {damage = 5}
	self.x_m29.CLIP_AMMO_MAX = 12
	self.x_m29.AMMO_MAX = 36
	self.x_m29.stats.damage = 200
	self.x_m29.stats.spread = 32
	self.x_m29.stats.recoil = 32
	self.x_m29.can_shoot_through_enemy = true
	self.x_m29.can_shoot_through_shield = true
	self.x_m29.armor_piercing_chance = 1
	self.x_m29.AMMO_PICKUP = {10, 15}
	self.x_m29.stats.reload = 50
	self.x_m29.category = "akimbo"
	self.x_m29.FIRE_MODE = "single"
	self.x_m29.sub_category = "revolver"
	self.x_m29.CAN_TOGGLE_FIREMODE = false
	self.x_m29.fire_mode_data.fire_rate = 0.1
	self.x_m29.animations.has_steelsight_stance = true
	else
	end
	if SystemFS:exists("assets/mod_overrides/M29 Revolver/main.xml")
	then
	self.x_m29.stats_modifiers = {damage = 5}
	self.x_m29.CLIP_AMMO_MAX = 12
	self.x_m29.AMMO_MAX = 36
	self.x_m29.stats.damage = 200
	self.x_m29.stats.spread = 32
	self.x_m29.stats.recoil = 32
	self.x_m29.can_shoot_through_enemy = true
	self.x_m29.can_shoot_through_shield = true
	self.x_m29.armor_piercing_chance = 1
	self.x_m29.AMMO_PICKUP = {10, 15}
	self.x_m29.stats.reload = 50
	self.x_m29.category = "akimbo"
	self.x_m29.FIRE_MODE = "single"
	self.x_m29.sub_category = "revolver"
	self.x_m29.CAN_TOGGLE_FIREMODE = false
	self.x_m29.fire_mode_data.fire_rate = 0.1
	self.x_m29.animations.has_steelsight_stance = true
	else
	end
	if SystemFS:exists("assets/mod_overrides/Akimbo Revolvers/main.xml")
	then
	self.x_mateba.stats_modifiers = {damage = 5}
	self.x_mateba.CLIP_AMMO_MAX = 12
	self.x_mateba.AMMO_MAX = 36
	self.x_mateba.stats.damage = 200
	self.x_mateba.stats.spread = 32
	self.x_mateba.stats.recoil = 32
	self.x_mateba.can_shoot_through_enemy = true
	self.x_mateba.can_shoot_through_shield = true
	self.x_mateba.armor_piercing_chance = 1
	self.x_mateba.AMMO_PICKUP = {10, 15}
	self.x_mateba.stats.reload = 50
	self.x_mateba.FIRE_MODE = "single"
	self.x_mateba.sub_category = "revolver"
	self.x_mateba.CAN_TOGGLE_FIREMODE = false
	self.x_mateba.fire_mode_data.fire_rate = 0.1
	self.x_mateba.animations.has_steelsight_stance = true
	else
	end
	if SystemFS:exists("assets/mod_overrides/Akimbo Revolvers/main.xml")
	then
	self.x_raging.stats_modifiers = {damage = 4}
	self.x_raging.CLIP_AMMO_MAX = 12
	self.x_raging.AMMO_MAX = 36
	self.x_raging.stats.damage = 200
	self.x_raging.stats.spread = 32
	self.x_raging.stats.recoil = 32
	self.x_raging.can_shoot_through_enemy = true
	self.x_raging.can_shoot_through_shield = true
	self.x_raging.armor_piercing_chance = 1
	self.x_raging.AMMO_PICKUP = {10, 15}
	self.x_raging.stats.reload = 50
	self.x_raging.FIRE_MODE = "single"
	self.x_raging.sub_category = "revolver"
	self.x_raging.CAN_TOGGLE_FIREMODE = false
	self.x_raging.fire_mode_data.fire_rate = 0.1
	self.x_raging.animations.has_steelsight_stance = true
	else
	end
	if SystemFS:exists("assets/mod_overrides/Akimbo Revolvers/main.xml")
	then
	self.x_peace.stats_modifiers = {damage = 4}
	self.x_peace.CLIP_AMMO_MAX = 12
	self.x_peace.AMMO_MAX = 36
	self.x_peace.stats.damage = 200
	self.x_peace.stats.spread = 32
	self.x_peace.stats.spread = 32
	self.x_peace.can_shoot_through_enemy = true
	self.x_peace.can_shoot_through_shield = true
	self.x_peace.armor_piercing_chance = 1
	self.x_peace.AMMO_PICKUP = {10, 15}
	self.x_peace.stats.reload = 80
	self.x_peace.FIRE_MODE = "single"
	self.x_peace.sub_category = "revolver"
	self.x_peace.CAN_TOGGLE_FIREMODE = false
	self.x_peace.fire_mode_data.fire_rate = 0.1
	self.x_peace.animations.has_steelsight_stance = true
	else
	end
	if SystemFS:exists("assets\mod_overrides\The Triad\main.xml")
	then
	self.x_triad.stats_modifiers = {damage = 5}
	--self.triad.stats.concealment = 0
	self.x_triad.CLIP_AMMO_MAX = 12
	self.x_triad.AMMO_MAX = 24
	self.x_triad.stats.damage = 200
	self.x_triad.stats.spread = 32
	self.x_triad.stats.recoil = 32
	self.x_triad.can_shoot_through_shield = true
	self.x_triad.can_shoot_through_enemy = true
	self.x_triad.can_shoot_through_wall = true
	self.x_triad.armor_piercing_chance = 1
	self.x_triad.AMMO_PICKUP = {10, 15}
	self.x_triad.fire_mode_data.fire_rate = 0.1
	self.x_triad.stats.reload = 20
	self.x_triad.animations.has_steelsight_stance = true
	else
	end
--Akimbo Shotguns
	if SystemFS:exists("assets/mod_overrides/Akimbo AA-12/main.xml")
	then
	self.x_aa12.stats_modifiers = {damage = 2}
	self.x_aa12.stats.damage = 170
	self.x_aa12.AMMO_PICKUP = {10, 15}
	self.x_aa12.stats.reload = 50
	self.x_aa12.stats.recoil = 32
	self.x_aa12.CAN_TOGGLE_FIREMODE = false
	else
	end
	if SystemFS:exists("assets/mod_overrides/Akimbo Judge/main.xml")
	then
	self.x_judge.stats_modifiers = {damage = 3}
	self.x_judge.stats.damage = 200
	self.x_judge.AMMO_PICKUP = {10, 15}
	self.x_judge.stats.reload = 50
	else
	end
	if SystemFS:exists("assets/mod_overrides/Akimbo Reaper Shotguns/main.xml")
	then
	self.x_die.stats_modifiers = {damage = 3}
	self.x_die.stats.damage = 200
	self.x_die.AMMO_PICKUP = {10, 15}
	self.x_die.fire_mode_data.fire_rate = 0.05
	else
	end
	if SystemFS:exists("assets/mod_overrides/AKimbo Weapons Pack/main.xml")
	then
	self.x_s12.stats_modifiers = {damage = 3}
	self.x_s12.stats.damage = 250
	self.x_s12.AMMO_PICKUP = {9, 15}
	self.x_s12.CAN_TOGGLE_FIREMODE = false
	else
	end
	if SystemFS:exists("assets/mod_overrides/Akimbo Mosconis/main.xml")
	then
	self.x_huntsman.stats_modifiers = {damage = 5}
	self.x_huntsman.AMMO_MAX = 20
	self.x_huntsman.stats.damage = 220
	self.x_huntsman.stats.spread = 1
	self.x_huntsman.AMMO_PICKUP = {10,15}
	self.x_huntsman.stats.reload = 15
	else
	end
--Akimbo ARs 
	if SystemFS:exists("assets/mod_overrides/AKimbo Weapons Pack/main.xml")
	then
	self.x_akm.stats.concealment = 0
	self.x_akm.CLIP_AMMO_MAX = 60
	self.x_akm.AMMO_MAX = 180
	self.x_akm.stats.damage = 200
	self.x_akm.stats.spread = 3
	self.x_akm.stats.recoil = 32
	self.x_akm.can_shoot_through_enemy = true
	self.x_akm.can_shoot_through_shield = true
	self.x_akm.armor_piercing_chance = 1
	self.x_akm.AMMO_PICKUP = {30, 40}
	self.x_akm.stats.reload = 50
	self.x_akm.sub_category = "assault_rifle"
	self.x_akm.kick = self.x_akm.kick or {}
	self.x_akm.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.x_akm.kick.crouching = self.x_akm.kick.standing
	self.x_akm.kick.steelsight = self.x_akm.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/AKimbo Weapons Pack/main.xml")
	then
	self.x_akm_gold.CLIP_AMMO_MAX = 60
	self.x_akm_gold.AMMO_MAX = 180
	self.x_akm_gold.stats.damage = 200
	self.x_akm_gold.stats.spread = 3
	self.x_akm_gold.stats.recoil = 32
	self.x_akm_gold.can_shoot_through_enemy = true
	self.x_akm_gold.can_shoot_through_shield = true
	self.x_akm_gold.armor_piercing_chance = 1
	self.x_akm_gold.AMMO_PICKUP = {30, 40}
	self.x_akm_gold.stats.reload = 50
	self.x_akm_gold.sub_category = "assault_rifle"
	self.x_akm_gold.kick = self.x_akm_gold.kick or {}
	self.x_akm_gold.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.x_akm_gold.kick.crouching = self.x_akm_gold.kick.standing
	self.x_akm_gold.kick.steelsight = self.x_akm_gold.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/AKimbo Weapons Pack/main.xml")
	then
	self.x_ak74.CLIP_AMMO_MAX = 60
	self.x_ak74.AMMO_MAX = 180
	self.x_ak74.stats.damage = 200
	self.x_ak74.stats.spread = 3
	self.x_ak74.stats.recoil = 32
	self.x_ak74.can_shoot_through_enemy = true
	self.x_ak74.can_shoot_through_shield = true
	self.x_ak74.armor_piercing_chance = 1
	self.x_ak74.AMMO_PICKUP = {30, 40}
	self.x_ak74.stats.reload = 50
	self.x_ak74.sub_category = "assault_rifle"
	self.x_ak74.kick = self.x_ak74.kick or {}
	self.x_ak74.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.x_ak74.kick.crouching = self.x_ak74.kick.standing
	self.x_ak74.kick.steelsight = self.x_ak74.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/Goldeneye Akimbo Pack/main.xml")
	then
	self.x_m16.AMMO_MAX = 240
	self.x_m16.stats.damage = 200
	self.x_m16.stats.recoil = 32
	--self.x_m16.can_shoot_through_enemy = true
	self.x_m16.can_shoot_through_shield = false
	self.x_m16.armor_piercing_chance = 1
	self.x_m16.AMMO_PICKUP = {20, 30}
	self.x_m16.stats.reload = 50
	self.x_m16.stats.spread= 10
	self.x_m16.stats.suppression = 12
	self.x_m16.stats.alert_size = 9
	self.x_m16.kick = self.x_m16.kick or {}
	self.x_m16.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.x_m16.kick.crouching = self.x_m16.kick.standing
	self.x_m16.kick.steelsight = self.x_m16.kick.standing
	else
	end
--Akimbo LMG
	if SystemFS:exists("assets/mod_overrides/Akimbo M249s/main.xml")
	then
	self.x_m249.stats.concealment = 0
	self.x_m249.CLIP_AMMO_MAX = 400
	self.x_m249.AMMO_MAX = 400
	self.x_m249.stats.damage = 150
	self.x_m249.stats.spread = 5
	self.x_m249.sub_category = "lmg"
	self.x_m249.name_id = "bm_w_nom249"
	self.x_m249.stats.recoil = 32
	self.x_m249.can_shoot_through_enemy = true
	self.x_m249.can_shoot_through_shield = false
	self.x_m249.armor_piercing_chance = 1
	self.x_m249.AMMO_PICKUP = {30, 40}
	self.x_m249.stats.reload = 50
	self.x_m249.kick = self.x_m249.kick or {}
	self.x_m249.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.x_m249.kick.crouching = self.x_m249.kick.standing
	self.x_m249.kick.steelsight = self.x_m249.kick.standing
	else
	end
	if SystemFS:exists("assets/mod_overrides/AKimbo Weapons Pack/main.xml")
	then
	self.x_rpk.stats.concealment = 0
	self.x_rpk.CLIP_AMMO_MAX = 300
	self.x_rpk.AMMO_MAX = 300
	self.x_rpk.stats.damage = 190
	self.x_rpk.stats.spread = 8
	self.x_rpk.stats.recoil = 32
	self.x_rpk.can_shoot_through_enemy = true
	self.x_rpk.can_shoot_through_shield = true
	self.x_rpk.armor_piercing_chance = 1
	self.x_rpk.AMMO_PICKUP = {30, 40}
	self.x_rpk.stats.reload = 50
	self.x_rpk.sub_category = "lmg"
	self.x_rpk.kick = self.x_rpk.kick or {}
	self.x_rpk.kick.standing = {
		0,
		0,
		0,
		0
	}
	self.x_rpk.kick.crouching = self.x_rpk.kick.standing
	self.x_rpk.kick.steelsight = self.x_rpk.kick.standing
	else
	end
--Akimbo.. Snipers.. Blame Iron Predator, not me, still, cool weird thing
	if SystemFS:exists("assets/mod_overrides/Goldeneye Akimbo Pack/main.xml")
	then
	self.x_m70.sub_category = "snp"
	self.x_m70.upgrade_blocks = {
			weapon = {
				"clip_ammo_increase"
			}
		}
	self.x_m70.CAN_TOGGLE_FIREMODE = false
	self.x_m70.stats_modifiers = {damage = 100}
	self.x_m70.AMMO_MAX = 40
	self.x_m70.stats.damage = 75
	self.x_m70.stats.recoil = 32
	self.x_m70.can_shoot_through_enemy = true
	self.x_m70.can_shoot_through_shield = true
	self.x_m70.armor_piercing_chance = 1
	self.x_m70.AMMO_PICKUP = {9, 11}
	self.x_m70.stats.reload = 50
	self.x_m70.stats.spread= 32
	self.x_m70.stats.suppression = 12
	self.x_m70.stats.alert_size = 9
	else
	end
end
--[[
if SystemFS:exists("assets/mod_overrides/")
	then
	self..CLIP_AMMO_MAX = 
	self..AMMO_MAX = 
	self..stats.damage = 
	self..stats.spread = 
	self..stats.recoil = 
	self..can_shoot_through_enemy = true
	self..can_shoot_through_shield = true
	self..armor_piercing_chance = 1
	self..AMMO_PICKUP = {10, 20}
	self..stats.reload = 50
	else
	end
--]]
if not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/assaulttweaks.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/coplogicattack.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/coplogicidle.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/coplogictravel.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/enemymanager.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/groupaistatebase.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/spooclogicattack.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/tankcoplogicattack.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/shieldlogicattack.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/rebalanceissues.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/sync.lua")
then
log("You have messed with SGO, reinstall it.")
	os.exit()
end
-]]
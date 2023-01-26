-- accuracy stats are multiplied by about 3.6

local old_init = WeaponTweakData.init

function WeaponTweakData:init(tweak_data)
    old_init(self, tweak_data)

-- Special, namely: The M134 Minigun --

self.m134.CLIP_AMMO_MAX = 200
self.m134.AMMO_MAX = 600
self.m134.stats.damage = 80
self.m134.stats.spread = 7
self.m134.spread.standing = 3.5
self.m134.spread.crouching = 1.4
self.m134.spread.steelsight = 1.2
self.m134.spread.moving_standing = 10
self.m134.spread.moving_crouching = 6
self.m134.spread.moving_steelsight = 5
self.m134.stats.recoil = 5
self.m134.stats.suppression = 3
self.m134.fire_mode_data.fire_rate = 0.125
self.m134.can_shoot_through_shield = true
self.m134.can_shoot_through_wall = true

end
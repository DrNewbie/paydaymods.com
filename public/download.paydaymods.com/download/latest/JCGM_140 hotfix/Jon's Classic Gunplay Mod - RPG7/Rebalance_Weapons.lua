-- accuracy stats are multiplied by about 3.6

local old_init = WeaponTweakData.init

function WeaponTweakData:init(tweak_data)
    old_init(self, tweak_data)

-- Special, namely: The RPG7 launcher --

self.rpg7.AMMO_MAX = 2

end
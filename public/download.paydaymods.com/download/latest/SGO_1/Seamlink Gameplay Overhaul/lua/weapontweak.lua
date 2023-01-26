if not SGO or not SGO.settings.use_lmgs2 then return end
if SystemFS:exists("mods/Steelsights/mod.txt") then return end
local old_init = WeaponTweakData.init

function WeaponTweakData:init(tweak_data)
    old_init(self, tweak_data)

-- Brenner --
self.hk21.CAN_TOGGLE_FIREMODE = true

-- KSP -- 
self.m249.CAN_TOGGLE_FIREMODE = true

-- RPK -- 
self.rpk.CAN_TOGGLE_FIREMODE = true

-- Buzzsaw --
self.mg42.CAN_TOGGLE_FIREMODE = true
self.mg42.sounds.fire_single = "mg42_fire"
self.mg42.sounds.fire_auto = "mg42_fire"

-- KSP58 -- 
self.par.CAN_TOGGLE_FIREMODE = true
self.par.sounds.fire_single = "svinet_fire"
self.par.sounds.fire_auto = "svinet_fire"
end
if not SGO or not SGO.settings.use_sounds then return end
local old_init = WeaponTweakData.init

function WeaponTweakData:init(tweak_data)
old_init(self, tweak_data)

self.fal.sounds.fire = "scar_fire_single"
self.fal.sounds.fire_single = "scar_fire_single"
self.fal.sounds.fire_auto = "scar_fire"
self.fal.sounds.stop_fire = "scar_stop"
self.fal.sounds.dryfire = "primary_dryfire"
--[[self.new_m4.sounds.fire = "l85a2_fire_single"
self.new_m4.sounds.fire_single = "l85a2_fire_single"
self.new_m4.sounds.fire_auto = "l85a2_fire"
self.new_m4.sounds.stop_fire = "l85a2_stop"
self.new_m4.sounds.dryfire = "l85a2_dryfire"--]]
self.mateba.sounds.fire = "rbull_fire"

if not SystemFS:exists("mods/Beardlib/mod.txt") then return end

	if SystemFS:exists("assets/mod_overrides/KAC SR-25 E2 ACC")
	then
	self.sr25.sounds.fire = "akm_fire_single"
	self.sr25.sounds.fire_single = "akm_fire_single"
	self.sr25.sounds.fire_auto = "akm_fire"
	self.sr25.sounds.stop_fire = "akm_stop"
	self.sr25.sounds.dryfire = "primary_dryfire"
	else
	end
	if SystemFS:exists("assets/mod_overrides/FD338")
	then
	self.fd338.sounds.fire = "akm_fire_single"
	self.fd338.sounds.fire_single = "akm_fire_single"
	self.fd338.sounds.fire_auto = "akm_fire"
	self.fd338.sounds.stop_fire = "akm_stop"
	self.fd338.sounds.dryfire = "primary_dryfire"
	else
	end
	if SystemFS:exists("assets/mod_overrides/AK12")
	then
	self.ak12.sounds.fire = "akm_fire_single"
	self.ak12.sounds.fire_single = "akm_fire_single"
	self.ak12.sounds.fire_auto = "akm_fire"
	self.ak12.sounds.stop_fire = "akm_stop"
	self.ak12.sounds.dryfire = "primary_dryfire"
	else
	end
	if SystemFS:exists("assets/mod_overrides/FN SCAR-L M203")
	then
	self.scar_m203.sounds.fire = "scar_fire_single"
	self.scar_m203.sounds.fire_single = "scar_fire_single"
	self.scar_m203.sounds.fire_auto = "scar_fire"
	self.scar_m203.sounds.stop_fire = "scar_stop"
	self.scar_m203.sounds.dryfire = "primary_dryfire"
	else
	end
end
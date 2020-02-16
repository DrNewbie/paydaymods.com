local PICKUP = {
	SNIPER_HIGH_DAMAGE = 6,
	SHOTGUN_HIGH_CAPACITY = 4,
	AR_HIGH_CAPACITY = 2,
	OTHER = 1,
	SNIPER_LOW_DAMAGE = 5,
	AR_MED_CAPACITY = 3
}
local SELECTION = {
	SECONDARY = 1,
	PRIMARY = 2,
	UNDERBARREL = 3
}
function WeaponTweakData:_set_normal()
	self.npc_melee.baton.damage = 5
	self.npc_melee.knife_1.damage = 7.5
	self.npc_melee.fists.damage = 2.5
	self.m4_npc.DAMAGE = 1
	self.ak47_ass_npc.DAMAGE = 1
	self.ak47_npc.DAMAGE = 1
	self.scar_npc.DAMAGE = 1
	self.g36_npc.DAMAGE = 1
	self.s552_npc.DAMAGE = 1
	self.contraband_npc.DAMAGE = 2
	self.m14_npc.DAMAGE = 2
	self.mp5_npc.DAMAGE = 1
	self.mp5_tactical_npc.DAMAGE = 1
	self.akmsu_smg_npc.DAMAGE = 1
	self.asval_smg_npc.DAMAGE = 1
	self.ump_npc.DAMAGE = 1
	self.mac11_npc.DAMAGE = 1
	self.mp9_npc.DAMAGE = 0.5
	self.sr2_smg_npc.DAMAGE = 0.5
	self.c45_npc.DAMAGE = 1
	self.colt_1911_primary_npc.DAMAGE = 2
	self.x_c45_npc.DAMAGE = 1
	self.glock_18_npc.DAMAGE = 1
	self.beretta92_npc.DAMAGE = 1
	self.raging_bull_npc.DAMAGE = 4
	self.r870_npc.DAMAGE = 4.5
	self.benelli_npc.DAMAGE = 4.5
	self.mossberg_npc.DAMAGE = 4.5
	self.saiga_npc.DAMAGE = 2.25
	self.hk21_npc.DAMAGE = 2
	self.m249_npc.DAMAGE = 2
	self.rpk_lmg_npc.DAMAGE = 2
	self.mini_npc.DAMAGE = 2
	self.swat_van_turret_module.HEALTH_INIT = 500
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 20
	self.swat_van_turret_module.DAMAGE = 0.2
	self.ceiling_turret_module.HEALTH_INIT = 250
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 10
	self.ceiling_turret_module.DAMAGE = 0.2
	self.ceiling_turret_module_no_idle.HEALTH_INIT = 165
	self.ceiling_turret_module_no_idle.SHIELD_HEALTH_INIT = 6
	self.ceiling_turret_module_no_idle.DAMAGE = 0.2
end
function WeaponTweakData:_set_hard()
	self.npc_melee.baton.damage = 5
	self.npc_melee.knife_1.damage = 7.5
	self.npc_melee.fists.damage = 2.5
	self.m4_npc.DAMAGE = 2
	self.ak47_ass_npc.DAMAGE = 2
	self.ak47_npc.DAMAGE = 2
	self.scar_npc.DAMAGE = 2
	self.g36_npc.DAMAGE = 2
	self.s552_npc.DAMAGE = 2
	self.contraband_npc.DAMAGE = 4
	self.m14_npc.DAMAGE = 3
	self.mp5_npc.DAMAGE = 2
	self.mp5_tactical_npc.DAMAGE = 2
	self.akmsu_smg_npc.DAMAGE = 2
	self.asval_smg_npc.DAMAGE = 2
	self.ump_npc.DAMAGE = 2
	self.mac11_npc.DAMAGE = 2
	self.mp9_npc.DAMAGE = 1
	self.sr2_smg_npc.DAMAGE = 1
	self.c45_npc.DAMAGE = 2
	self.colt_1911_primary_npc.DAMAGE = 3
	self.x_c45_npc.DAMAGE = 2
	self.glock_18_npc.DAMAGE = 2
	self.beretta92_npc.DAMAGE = 2
	self.raging_bull_npc.DAMAGE = 8
	self.r870_npc.DAMAGE = 9
	self.benelli_npc.DAMAGE = 9
	self.mossberg_npc.DAMAGE = 9
	self.saiga_npc.DAMAGE = 4.5
	self.hk21_npc.DAMAGE = 3
	self.m249_npc.DAMAGE = 3
	self.rpk_lmg_npc.DAMAGE = 3
	self.mini_npc.DAMAGE = 3
	self.swat_van_turret_module.HEALTH_INIT = 1500
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 60
	self.swat_van_turret_module.DAMAGE = 0.5
	self.ceiling_turret_module.HEALTH_INIT = 750
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 30
	self.ceiling_turret_module.DAMAGE = 0.5
	self.ceiling_turret_module_no_idle.HEALTH_INIT = 500
	self.ceiling_turret_module_no_idle.SHIELD_HEALTH_INIT = 20
	self.ceiling_turret_module_no_idle.DAMAGE = 0.5
end
function WeaponTweakData:_set_overkill()
	self.npc_melee.baton.damage = 5
	self.npc_melee.knife_1.damage = 7.5
	self.npc_melee.fists.damage = 2.5
	self.m4_npc.DAMAGE = 3
	self.ak47_ass_npc.DAMAGE = 3
	self.ak47_npc.DAMAGE = 3
	self.scar_npc.DAMAGE = 3
	self.g36_npc.DAMAGE = 3
	self.s552_npc.DAMAGE = 3
	self.contraband_npc.DAMAGE = 6
	self.m14_npc.DAMAGE = 4
	self.mp5_npc.DAMAGE = 3
	self.mp5_tactical_npc.DAMAGE = 3
	self.akmsu_smg_npc.DAMAGE = 3
	self.asval_smg_npc.DAMAGE = 3
	self.ump_npc.DAMAGE = 3
	self.mac11_npc.DAMAGE = 3
	self.mp9_npc.DAMAGE = 1.5
	self.sr2_smg_npc.DAMAGE = 1.5
	self.c45_npc.DAMAGE = 3
	self.colt_1911_primary_npc.DAMAGE = 4
	self.x_c45_npc.DAMAGE = 3
	self.glock_18_npc.DAMAGE = 3
	self.beretta92_npc.DAMAGE = 3
	self.raging_bull_npc.DAMAGE = 12
	self.r870_npc.DAMAGE = 13.5
	self.benelli_npc.DAMAGE = 13.5
	self.mossberg_npc.DAMAGE = 13.5
	self.saiga_npc.DAMAGE = 6.75
	self.hk21_npc.DAMAGE = 5
	self.m249_npc.DAMAGE = 5
	self.rpk_lmg_npc.DAMAGE = 5
	self.mini_npc.DAMAGE = 5
	self.swat_van_turret_module.HEALTH_INIT = 12500
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 300
	self.swat_van_turret_module.DAMAGE = 1.3
	self.ceiling_turret_module.HEALTH_INIT = 6250
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 150
	self.ceiling_turret_module.DAMAGE = 1.3
	self.ceiling_turret_module_no_idle.HEALTH_INIT = 4165
	self.ceiling_turret_module_no_idle.SHIELD_HEALTH_INIT = 100
	self.ceiling_turret_module_no_idle.DAMAGE = 1.3
end
function WeaponTweakData:_set_overkill_145()
	self.m4_npc.DAMAGE = 5
	self.ak47_ass_npc.DAMAGE = 5
	self.ak47_npc.DAMAGE = 5
	self.scar_npc.DAMAGE = 5
	self.g36_npc.DAMAGE = 5
	self.s552_npc.DAMAGE = 5
	self.contraband_npc.DAMAGE = 10
	self.m14_npc.DAMAGE = 6
	self.mp5_npc.DAMAGE = 5
	self.mp5_tactical_npc.DAMAGE = 5
	self.akmsu_smg_npc.DAMAGE = 5
	self.asval_smg_npc.DAMAGE = 5
	self.ump_npc.DAMAGE = 5
	self.mac11_npc.DAMAGE = 5
	self.mp9_npc.DAMAGE = 2.5
	self.sr2_smg_npc.DAMAGE = 2.5
	self.c45_npc.DAMAGE = 5
	self.colt_1911_primary_npc.DAMAGE = 6
	self.x_c45_npc.DAMAGE = 5
	self.glock_18_npc.DAMAGE = 5
	self.beretta92_npc.DAMAGE = 5
	self.raging_bull_npc.DAMAGE = 20
	self.r870_npc.DAMAGE = 22.5
	self.benelli_npc.DAMAGE = 22.5
	self.mossberg_npc.DAMAGE = 22.5
	self.saiga_npc.DAMAGE = 11.25
	self.hk21_npc.DAMAGE = 7.5
	self.m249_npc.DAMAGE = 7.5
	self.rpk_lmg_npc.DAMAGE = 7.5
	self.mini_npc.DAMAGE = 7.5
	self.swat_van_turret_module.HEALTH_INIT = 25000
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 500
	self.swat_van_turret_module.DAMAGE = 2
	self.ceiling_turret_module.HEALTH_INIT = 12500
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 250
	self.ceiling_turret_module.DAMAGE = 2
	self.ceiling_turret_module_no_idle.HEALTH_INIT = 8330
	self.ceiling_turret_module_no_idle.SHIELD_HEALTH_INIT = 165
	self.ceiling_turret_module_no_idle.DAMAGE = 2
end
function WeaponTweakData:_set_easy_wish()
	self.m4_npc.DAMAGE = 5
	self.ak47_ass_npc.DAMAGE = 5
	self.ak47_npc.DAMAGE = 5
	self.scar_npc.DAMAGE = 5
	self.g36_npc.DAMAGE = 5
	self.s552_npc.DAMAGE = 5
	self.contraband_npc.DAMAGE = 10
	self.m14_npc.DAMAGE = 6
	self.mp5_npc.DAMAGE = 5
	self.mp5_tactical_npc.DAMAGE = 5
	self.akmsu_smg_npc.DAMAGE = 5
	self.asval_smg_npc.DAMAGE = 5
	self.ump_npc.DAMAGE = 5
	self.mac11_npc.DAMAGE = 5
	self.mp9_npc.DAMAGE = 2.5
	self.sr2_smg_npc.DAMAGE = 2.5
	self.c45_npc.DAMAGE = 5
	self.colt_1911_primary_npc.DAMAGE = 6
	self.x_c45_npc.DAMAGE = 5
	self.glock_18_npc.DAMAGE = 5
	self.beretta92_npc.DAMAGE = 5
	self.raging_bull_npc.DAMAGE = 20
	self.r870_npc.DAMAGE = 22.5
	self.benelli_npc.DAMAGE = 22.5
	self.mossberg_npc.DAMAGE = 22.5
	self.saiga_npc.DAMAGE = 11.25
	self.hk21_npc.DAMAGE = 7.5
	self.m249_npc.DAMAGE = 7.5
	self.rpk_lmg_npc.DAMAGE = 7.5
	self.mini_npc.DAMAGE = 7.5
	self.swat_van_turret_module.HEALTH_INIT = 40000
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 700
	self.swat_van_turret_module.DAMAGE = 2
	self.swat_van_turret_module.CLIP_SIZE = 800
	self.ceiling_turret_module.HEALTH_INIT = 20000
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 350
	self.ceiling_turret_module.DAMAGE = 2
	self.ceiling_turret_module.CLIP_SIZE = 800
	self.ceiling_turret_module_no_idle.HEALTH_INIT = 13330
	self.ceiling_turret_module_no_idle.SHIELD_HEALTH_INIT = 230
	self.ceiling_turret_module_no_idle.DAMAGE = 2
	self.ceiling_turret_module_no_idle.CLIP_SIZE = 800
end
function WeaponTweakData:_set_overkill_290()
	self.npc_melee.baton.damage = 20
	self.npc_melee.knife_1.damage = 22.5
	self.npc_melee.fists.damage = 17.5
	self.m4_npc.DAMAGE = 7.5
	self.ak47_ass_npc.DAMAGE = 7.5
	self.ak47_npc.DAMAGE = 7.5
	self.scar_npc.DAMAGE = 7.5
	self.g36_npc.DAMAGE = 7.5
	self.s552_npc.DAMAGE = 7.5
	self.contraband_npc.DAMAGE = 10
	self.m14_npc.DAMAGE = 8.5
	self.mp5_npc.DAMAGE = 7.5
	self.mp5_tactical_npc.DAMAGE = 7.5
	self.akmsu_smg_npc.DAMAGE = 7.5
	self.asval_smg_npc.DAMAGE = 7.5
	self.ump_npc.DAMAGE = 7.5
	self.mac11_npc.DAMAGE = 7.5
	self.mp9_npc.DAMAGE = 3.75
	self.sr2_smg_npc.DAMAGE = 3.75
	self.c45_npc.DAMAGE = 7.5
	self.colt_1911_primary_npc.DAMAGE = 8.5
	self.x_c45_npc.DAMAGE = 7.5
	self.glock_18_npc.DAMAGE = 7.5
	self.beretta92_npc.DAMAGE = 7.5
	self.raging_bull_npc.DAMAGE = 30
	self.r870_npc.DAMAGE = 22.5
	self.benelli_npc.DAMAGE = 22.5
	self.mossberg_npc.DAMAGE = 22.5
	self.saiga_npc.DAMAGE = 16.875
	self.hk21_npc.DAMAGE = 10
	self.m249_npc.DAMAGE = 10
	self.rpk_lmg_npc.DAMAGE = 10
	self.mini_npc.DAMAGE = 10
	self.swat_van_turret_module.HEALTH_INIT = 40000
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 700
	self.swat_van_turret_module.DAMAGE = 3.5
	self.swat_van_turret_module.CLIP_SIZE = 800
	self.ceiling_turret_module.HEALTH_INIT = 20000
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 350
	self.ceiling_turret_module.DAMAGE = 3.5
	self.ceiling_turret_module.CLIP_SIZE = 800
	self.ceiling_turret_module_no_idle.HEALTH_INIT = 13330
	self.ceiling_turret_module_no_idle.SHIELD_HEALTH_INIT = 230
	self.ceiling_turret_module_no_idle.DAMAGE = 3.5
	self.ceiling_turret_module_no_idle.CLIP_SIZE = 800
end
function WeaponTweakData:_set_sm_wish()
	self.npc_melee.baton.damage = 20
	self.npc_melee.knife_1.damage = 22.5
	self.npc_melee.fists.damage = 17.5
	self.m4_npc.DAMAGE = 7.5
	self.ak47_ass_npc.DAMAGE = 7.5
	self.ak47_npc.DAMAGE = 7.5
	self.scar_npc.DAMAGE = 7.5
	self.g36_npc.DAMAGE = 7.5
	self.s552_npc.DAMAGE = 7.5
	self.contraband_npc.DAMAGE = 10
	self.m14_npc.DAMAGE = 8.5
	self.mp5_npc.DAMAGE = 7.5
	self.mp5_tactical_npc.DAMAGE = 7.5
	self.akmsu_smg_npc.DAMAGE = 7.5
	self.asval_smg_npc.DAMAGE = 7.5
	self.ump_npc.DAMAGE = 7.5
	self.mac11_npc.DAMAGE = 7.5
	self.mp9_npc.DAMAGE = 3.75
	self.sr2_smg_npc.DAMAGE = 3.75
	self.c45_npc.DAMAGE = 7.5
	self.colt_1911_primary_npc.DAMAGE = 8.5
	self.x_c45_npc.DAMAGE = 7.5
	self.glock_18_npc.DAMAGE = 7.5
	self.beretta92_npc.DAMAGE = 7.5
	self.raging_bull_npc.DAMAGE = 30
	self.r870_npc.DAMAGE = 22.5
	self.benelli_npc.DAMAGE = 22.5
	self.mossberg_npc.DAMAGE = 22.5
	self.saiga_npc.DAMAGE = 16.875
	self.hk21_npc.DAMAGE = 10
	self.m249_npc.DAMAGE = 10
	self.rpk_lmg_npc.DAMAGE = 10
	self.mini_npc.DAMAGE = 10
	self.swat_van_turret_module.HEALTH_INIT = 40000
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 700
	self.swat_van_turret_module.DAMAGE = 3.5
	self.swat_van_turret_module.CLIP_SIZE = 800
	self.ceiling_turret_module.HEALTH_INIT = 20000
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 350
	self.ceiling_turret_module.DAMAGE = 3.5
	self.ceiling_turret_module.CLIP_SIZE = 800
	self.ceiling_turret_module_no_idle.HEALTH_INIT = 13330
	self.ceiling_turret_module_no_idle.SHIELD_HEALTH_INIT = 230
	self.ceiling_turret_module_no_idle.DAMAGE = 3.5
	self.ceiling_turret_module_no_idle.CLIP_SIZE = 800
end
function WeaponTweakData:_init_data_npc_melee()
	self.npc_melee = {}
	self.npc_melee.baton = {}
	self.npc_melee.baton.unit_name = Idstring("units/payday2/characters/ene_acc_baton/ene_acc_baton")
	self.npc_melee.baton.damage = 15
	self.npc_melee.baton.animation_param = "melee_baton"
	self.npc_melee.baton.player_blood_effect = true
	self.npc_melee.knife_1 = {}
	self.npc_melee.knife_1.unit_name = Idstring("units/payday2/characters/ene_acc_knife_1/ene_acc_knife_1")
	self.npc_melee.knife_1.damage = 17.5
	self.npc_melee.knife_1.animation_param = "melee_knife"
	self.npc_melee.knife_1.player_blood_effect = true
	self.npc_melee.fists = {}
	self.npc_melee.fists.unit_name = nil
	self.npc_melee.fists.damage = 12.5
	self.npc_melee.fists.animation_param = "melee_fist"
	self.npc_melee.fists.player_blood_effect = true
	self.npc_melee.helloween = {}
	self.npc_melee.helloween.unit_name = Idstring("units/pd2_halloween/weapons/wpn_mel_titan_hammer/wpn_mel_titan_hammer")
	self.npc_melee.helloween.damage = 40
	self.npc_melee.helloween.animation_param = "melee_fireaxe"
	self.npc_melee.helloween.player_blood_effect = true
end
function WeaponTweakData:_set_npc_weapon_damage_multiplier(mul)
	for name, data in pairs(self.npc_melee) do
		data.damage = data.damage * mul
	end
end
function WeaponTweakData:_init_data_c45_npc()
	self.c45_npc.sounds.prefix = "c45_npc"
	self.c45_npc.use_data.selection_index = SELECTION.SECONDARY
	self.c45_npc.DAMAGE = 1
	self.c45_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.c45_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.c45_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.c45_npc.CLIP_AMMO_MAX = 10
	self.c45_npc.NR_CLIPS_MAX = 9
	self.c45_npc.hold = "pistol"
	self.c45_npc.alert_size = 2500
	self.c45_npc.suppression = 1
	self.colt_1911_primary_npc = deep_clone(self.c45_npc)
	self.colt_1911_primary_npc.CLIP_AMMO_MAX = 10
	self.colt_1911_primary_npc.NR_CLIPS_MAX = 9
	self.colt_1911_primary_npc.use_data.selection_index = SELECTION.PRIMARY
end
function WeaponTweakData:_init_data_x_c45_npc()
	self.x_c45_npc.sounds.prefix = "c45_npc"
	self.x_c45_npc.use_data.selection_index = SELECTION.PRIMARY
	self.x_c45_npc.DAMAGE = 1
	self.x_c45_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.x_c45_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.x_c45_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.x_c45_npc.CLIP_AMMO_MAX = 20
	self.x_c45_npc.NR_CLIPS_MAX = 5
	self.x_c45_npc.hold = "akimbo_pistol"
	self.x_c45_npc.alert_size = 2500
	self.x_c45_npc.suppression = 1
end
function WeaponTweakData:_init_data_beretta92_npc()
	self.beretta92_npc.sounds.prefix = "beretta_npc"
	self.beretta92_npc.use_data.selection_index = SELECTION.SECONDARY
	self.beretta92_npc.DAMAGE = 1
	self.beretta92_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.beretta92_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.beretta92_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.beretta92_npc.CLIP_AMMO_MAX = 14
	self.beretta92_npc.NR_CLIPS_MAX = 11
	self.beretta92_npc.hold = "pistol"
	self.beretta92_npc.alert_size = 300
	self.beretta92_npc.suppression = 0.3
end
function WeaponTweakData:_init_data_glock_18_npc()
	self.glock_18_npc.sounds.prefix = "g18c_npc"
	self.glock_18_npc.use_data.selection_index = SELECTION.SECONDARY
	self.glock_18_npc.DAMAGE = 1
	self.glock_18_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.glock_18_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.glock_18_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.glock_18_npc.CLIP_AMMO_MAX = 20
	self.glock_18_npc.NR_CLIPS_MAX = 8
	self.glock_18_npc.hold = "pistol"
	self.glock_18_npc.auto = {}
	self.glock_18_npc.auto.fire_rate = 0.092
	self.glock_18_npc.alert_size = 2500
	self.glock_18_npc.suppression = 0.45
end
function WeaponTweakData:_init_data_raging_bull_npc()
	self.raging_bull_npc.sounds.prefix = "rbull_npc"
	self.raging_bull_npc.use_data.selection_index = SELECTION.SECONDARY
	self.raging_bull_npc.DAMAGE = 1
	self.raging_bull_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.raging_bull_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.raging_bull_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.raging_bull_npc.CLIP_AMMO_MAX = 6
	self.raging_bull_npc.NR_CLIPS_MAX = 8
	self.raging_bull_npc.hold = "pistol"
	self.raging_bull_npc.alert_size = 5000
	self.raging_bull_npc.suppression = 1.8
end
function WeaponTweakData:_init_data_m4_npc()
	self.m4_npc.sounds.prefix = "m4_npc"
	self.m4_npc.use_data.selection_index = SELECTION.PRIMARY
	self.m4_npc.DAMAGE = 1
	self.m4_npc.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.m4_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.m4_npc.CLIP_AMMO_MAX = 30
	self.m4_npc.NR_CLIPS_MAX = 5
	self.m4_npc.auto.fire_rate = 0.175
	self.m4_npc.hold = "rifle"
	self.m4_npc.alert_size = 5000
	self.m4_npc.suppression = 1
	self.ak47_ass_npc = deep_clone(self.m4_npc)
	self.ak47_ass_npc.sounds.prefix = "akm_npc"
end
function WeaponTweakData:_init_data_ak47_npc()
	self.ak47_npc.sounds.prefix = "akm_npc"
	self.ak47_npc.use_data.selection_index = SELECTION.PRIMARY
	self.ak47_npc.DAMAGE = 1
	self.ak47_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.ak47_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.ak47_npc.CLIP_AMMO_MAX = 30
	self.ak47_npc.NR_CLIPS_MAX = 5
	self.ak47_npc.auto.fire_rate = 0.2
	self.ak47_npc.hold = "rifle"
	self.ak47_npc.alert_size = 5000
	self.ak47_npc.suppression = 1
end
function WeaponTweakData:_init_data_m14_npc()
	self.m14_npc.sounds.prefix = "m14_npc"
	self.m14_npc.use_data.selection_index = SELECTION.PRIMARY
	self.m14_npc.DAMAGE = 1
	self.m14_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.m14_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.m14_npc.CLIP_AMMO_MAX = 10
	self.m14_npc.NR_CLIPS_MAX = 8
	self.m14_npc.auto.fire_rate = 0.2
	self.m14_npc.hold = "rifle"
	self.m14_npc.alert_size = 5000
	self.m14_npc.suppression = 1
end
function WeaponTweakData:_init_data_m14_sniper_npc()
	self.m14_sniper_npc.sounds.prefix = "sniper_npc"
	self.m14_sniper_npc.use_data.selection_index = SELECTION.PRIMARY
	self.m14_sniper_npc.DAMAGE = 2
	self.m14_sniper_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.m14_sniper_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.m14_sniper_npc.CLIP_AMMO_MAX = 6
	self.m14_sniper_npc.NR_CLIPS_MAX = 8
	self.m14_sniper_npc.hold = "rifle"
	self.m14_sniper_npc.alert_size = 5000
	self.m14_sniper_npc.suppression = 1
	self.m14_sniper_npc.armor_piercing = true
	self.svd_snp_npc = deep_clone(self.m14_sniper_npc)
	self.svdsil_snp_npc = deep_clone(self.m14_sniper_npc)
	self.svdsil_snp_npc.has_suppressor = "suppressed_a"
	self.heavy_snp_npc = deep_clone(self.m14_sniper_npc)
	self.heavy_snp_npc.sounds.prefix = "zsniper_npc"
	self.heavy_snp_npc.DAMAGE = 0.8
end
function WeaponTweakData:_init_data_r870_npc()
	self.r870_npc.sounds.prefix = "remington_npc"
	self.r870_npc.use_data.selection_index = SELECTION.PRIMARY
	self.r870_npc.DAMAGE = 1
	self.r870_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.r870_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
	self.r870_npc.CLIP_AMMO_MAX = 6
	self.r870_npc.NR_CLIPS_MAX = 4
	self.r870_npc.hold = "rifle"
	self.r870_npc.alert_size = 4500
	self.r870_npc.suppression = 1.8
	self.r870_npc.is_shotgun = true
	self.r870_npc.rays = 12
	self.r870_npc.spread = 3
	self.benelli_npc = deep_clone(self.r870_npc)
end
function WeaponTweakData:_init_data_mossberg_npc()
	self.mossberg_npc.sounds.prefix = "mossberg_npc"
	self.mossberg_npc.use_data.selection_index = SELECTION.PRIMARY
	self.mossberg_npc.DAMAGE = 1
	self.mossberg_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.mossberg_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
	self.mossberg_npc.CLIP_AMMO_MAX = 6
	self.mossberg_npc.NR_CLIPS_MAX = 4
	self.mossberg_npc.hold = "rifle"
	self.mossberg_npc.alert_size = 3000
	self.mossberg_npc.suppression = 2
	self.mossberg_npc.is_shotgun = true
	self.mossberg_npc.rays = 12
	self.mossberg_npc.spread = 3
end
function WeaponTweakData:_init_data_mp5_npc()
	self.mp5_npc.sounds.prefix = "mp5_npc"
	self.mp5_npc.use_data.selection_index = SELECTION.SECONDARY
	self.mp5_npc.DAMAGE = 1
	self.mp5_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.mp5_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.mp5_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mp5_npc.CLIP_AMMO_MAX = 30
	self.mp5_npc.NR_CLIPS_MAX = 5
	self.mp5_npc.auto.fire_rate = 0.12
	self.mp5_npc.hold = "rifle"
	self.mp5_npc.alert_size = 2500
	self.mp5_npc.suppression = 1
	self.mp5_tactical_npc = deep_clone(self.mp5_npc)
	self.mp5_tactical_npc.has_suppressor = "suppressed_a"
	self.mp5_tactical_npc.sounds.prefix = "val_npc"
	self.ump_npc = deep_clone(self.mp5_npc)
	self.ump_npc.sounds.prefix = "schakal_npc"
	self.akmsu_smg_npc = deep_clone(self.mp5_npc)
	self.akmsu_smg_npc.sounds.prefix = "akmsu_npc"
	self.asval_smg_npc = deep_clone(self.mp5_npc)	
	self.asval_smg_npc.sounds.prefix = "val_npc"
	self.asval_smg_npc.has_suppressor = "suppressed_a"
end
function WeaponTweakData:_init_data_mac11_npc()
	self.mac11_npc.sounds.prefix = "mac10_npc"
	self.mac11_npc.use_data.selection_index = SELECTION.SECONDARY
	self.mac11_npc.DAMAGE = 1
	self.mac11_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.mac11_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.mac11_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mac11_npc.CLIP_AMMO_MAX = 40
	self.mac11_npc.NR_CLIPS_MAX = 5
	self.mac11_npc.auto.fire_rate = 0.11
	self.mac11_npc.hold = {"uzi", "pistol"}
	self.mac11_npc.alert_size = 2500
	self.mac11_npc.suppression = 1
end
function WeaponTweakData:_init_data_g36_npc()
	self.g36_npc.sounds.prefix = "g36_npc"
	self.g36_npc.use_data.selection_index = SELECTION.PRIMARY
	self.g36_npc.DAMAGE = 1
	self.g36_npc.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.g36_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.g36_npc.CLIP_AMMO_MAX = 30
	self.g36_npc.NR_CLIPS_MAX = 5
	self.g36_npc.auto.fire_rate = 0.175
	self.g36_npc.hold = "rifle"
	self.g36_npc.alert_size = 5000
	self.g36_npc.suppression = 1
end
function WeaponTweakData:_init_data_mp9_npc()
	self.mp9_npc.sounds.prefix = "mp9_npc"
	self.mp9_npc.use_data.selection_index = SELECTION.SECONDARY
	self.mp9_npc.DAMAGE = 1
	self.mp9_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.mp9_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.mp9_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mp9_npc.CLIP_AMMO_MAX = 30
	self.mp9_npc.NR_CLIPS_MAX = 5
	self.mp9_npc.auto.fire_rate = 0.125
	self.mp9_npc.hold = "pistol"
	self.mp9_npc.alert_size = 1000
	self.mp9_npc.suppression = 1
	self.sr2_smg_npc = deep_clone(self.mp9_npc)
	self.sr2_smg_npc.sounds.prefix = "sr2_npc"
end
function WeaponTweakData:_init_data_saiga_npc()
	self.saiga_npc.sounds.prefix = "saiga_npc"
	self.saiga_npc.use_data.selection_index = SELECTION.PRIMARY
	self.saiga_npc.DAMAGE = 1
	self.saiga_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.saiga_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.saiga_npc.CLIP_AMMO_MAX = 7
	self.saiga_npc.NR_CLIPS_MAX = 10
	self.saiga_npc.hold = "rifle"
	self.saiga_npc.alert_size = 4500
	self.saiga_npc.suppression = 1.8
	self.saiga_npc.is_shotgun = true
	self.saiga_npc.rays = 12
	self.saiga_npc.spread = 3
end
function WeaponTweakData:_init_data_swat_van_turret_module_npc()
	self.swat_van_turret_module.name_id = "debug_sentry_gun"
	self.swat_van_turret_module.DAMAGE = 3
	self.swat_van_turret_module.DAMAGE_MUL_RANGE = {
		{800, 4},
		{1000, 1.1},
		{1500, 1}
	}
	self.swat_van_turret_module.SUPPRESSION = 1
	self.swat_van_turret_module.SPREAD = 0.5
	self.swat_van_turret_module.FIRE_RANGE = 10000
	self.swat_van_turret_module.CLIP_SIZE = 400
	self.swat_van_turret_module.AUTO_RELOAD = true
	self.swat_van_turret_module.AUTO_RELOAD_DURATION = 8
	self.swat_van_turret_module.CAN_GO_IDLE = true
	self.swat_van_turret_module.IDLE_WAIT_TIME = 5
	self.swat_van_turret_module.AUTO_REPAIR = true
	self.swat_van_turret_module.AUTO_REPAIR_MAX_COUNT = 2
	self.swat_van_turret_module.AUTO_REPAIR_DURATION = 30
	self.swat_van_turret_module.ECM_HACKABLE = true
	self.swat_van_turret_module.FLASH_GRENADE = {
		range = 300,
		effect_duration = 6,
		chance = 1,
		check_interval = {1, 1},
		quiet_time = {10, 13}
	}
	self.swat_van_turret_module.HACKABLE_WITH_ECM = true
	self.swat_van_turret_module.VELOCITY_COMPENSATION = {SNAPSHOT_INTERVAL = 0.3, OVERCOMPENSATION = 50}
	self.swat_van_turret_module.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.swat_van_turret_module.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.swat_van_turret_module.auto.fire_rate = 0.06
	self.swat_van_turret_module.alert_size = 2500
	self.swat_van_turret_module.headshot_dmg_mul = 4
	self.swat_van_turret_module.EXPLOSION_DMG_MUL = 1.5
	self.swat_van_turret_module.FIRE_DMG_MUL = 0.1
	self.swat_van_turret_module.BAG_DMG_MUL = 100
	self.swat_van_turret_module.SHIELD_DMG_MUL = 1
	self.swat_van_turret_module.HEALTH_INIT = 5000
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 1000
	self.swat_van_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.swat_van_turret_module.BODY_DAMAGE_CLAMP = 4200
	self.swat_van_turret_module.DEATH_VERIFICATION = {0.4, 0.75}
	self.swat_van_turret_module.DETECTION_RANGE = 8000
	self.swat_van_turret_module.DETECTION_DELAY = {
		{900, 0.3},
		{3500, 1.5}
	}
	self.swat_van_turret_module.KEEP_FIRE_ANGLE = 0.9
	self.swat_van_turret_module.MAX_VEL_SPIN = 72
	self.swat_van_turret_module.MIN_VEL_SPIN = self.swat_van_turret_module.MAX_VEL_SPIN * 0.05
	self.swat_van_turret_module.SLOWDOWN_ANGLE_SPIN = 30
	self.swat_van_turret_module.ACC_SPIN = self.swat_van_turret_module.MAX_VEL_SPIN * 5
	self.swat_van_turret_module.MAX_VEL_PITCH = 60
	self.swat_van_turret_module.MIN_VEL_PITCH = self.swat_van_turret_module.MAX_VEL_PITCH * 0.05
	self.swat_van_turret_module.SLOWDOWN_ANGLE_PITCH = 20
	self.swat_van_turret_module.ACC_PITCH = self.swat_van_turret_module.MAX_VEL_PITCH * 5
	self.swat_van_turret_module.recoil = {}
	self.swat_van_turret_module.recoil.horizontal = {
		1,
		1.5,
		1,
		1
	}
	self.swat_van_turret_module.recoil.vertical = {
		1,
		1.5,
		1,
		1
	}
	self.swat_van_turret_module.challenges = {}
	self.swat_van_turret_module.challenges.group = "sentry_gun"
	self.swat_van_turret_module.challenges.weapon = "sentry_gun"
	self.swat_van_turret_module.suppression = 0.8
end
function WeaponTweakData:_init_data_ceiling_turret_module_npc()
	self.ceiling_turret_module.name_id = "debug_sentry_gun"
	self.ceiling_turret_module.DAMAGE = 3
	self.ceiling_turret_module.DAMAGE_MUL_RANGE = {
		{800, 4},
		{1000, 1.1},
		{1500, 1}
	}
	self.ceiling_turret_module.SUPPRESSION = 1
	self.ceiling_turret_module.SPREAD = 0.5
	self.ceiling_turret_module.FIRE_RANGE = 10000
	self.ceiling_turret_module.CLIP_SIZE = 400
	self.ceiling_turret_module.AUTO_RELOAD = true
	self.ceiling_turret_module.AUTO_RELOAD_DURATION = 8
	self.ceiling_turret_module.CAN_GO_IDLE = false
	self.ceiling_turret_module.IDLE_WAIT_TIME = 5
	self.ceiling_turret_module.AUTO_REPAIR = false
	self.ceiling_turret_module.AUTO_REPAIR_MAX_COUNT = nil
	self.ceiling_turret_module.AUTO_REPAIR_DURATION = nil
	self.ceiling_turret_module.ECM_HACKABLE = true
	self.ceiling_turret_module.FLASH_GRENADE = {
		range = 300,
		effect_duration = 6,
		chance = 1,
		check_interval = {1, 1},
		quiet_time = {10, 13}
	}
	self.ceiling_turret_module.HACKABLE_WITH_ECM = true
	self.ceiling_turret_module.VELOCITY_COMPENSATION = {SNAPSHOT_INTERVAL = 0.3, OVERCOMPENSATION = 50}
	self.ceiling_turret_module.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.ceiling_turret_module.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.ceiling_turret_module.auto.fire_rate = 0.06
	self.ceiling_turret_module.alert_size = 2500
	self.ceiling_turret_module.headshot_dmg_mul = 4
	self.ceiling_turret_module.EXPLOSION_DMG_MUL = 1.5
	self.ceiling_turret_module.FIRE_DMG_MUL = 0.1
	self.ceiling_turret_module.BAG_DMG_MUL = 100
	self.ceiling_turret_module.SHIELD_DMG_MUL = 1
	self.ceiling_turret_module.HEALTH_INIT = 2500
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 500
	self.ceiling_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.ceiling_turret_module.BODY_DAMAGE_CLAMP = 4200
	self.ceiling_turret_module.DEATH_VERIFICATION = {0.4, 0.75}
	self.ceiling_turret_module.DETECTION_RANGE = self.ceiling_turret_module.FIRE_RANGE
	self.ceiling_turret_module.DETECTION_DELAY = {
		{900, 0.3},
		{3500, 1.5}
	}
	self.ceiling_turret_module.KEEP_FIRE_ANGLE = 0.9
	self.ceiling_turret_module.MAX_VEL_SPIN = 72
	self.ceiling_turret_module.MIN_VEL_SPIN = self.ceiling_turret_module.MAX_VEL_SPIN * 0.05
	self.ceiling_turret_module.SLOWDOWN_ANGLE_SPIN = 30
	self.ceiling_turret_module.ACC_SPIN = self.ceiling_turret_module.MAX_VEL_SPIN * 5
	self.ceiling_turret_module.MAX_VEL_PITCH = 60
	self.ceiling_turret_module.MIN_VEL_PITCH = self.ceiling_turret_module.MAX_VEL_PITCH * 0.05
	self.ceiling_turret_module.SLOWDOWN_ANGLE_PITCH = 20
	self.ceiling_turret_module.ACC_PITCH = self.ceiling_turret_module.MAX_VEL_PITCH * 5
	self.ceiling_turret_module.recoil = {}
	self.ceiling_turret_module.recoil.horizontal = {
		1,
		1.5,
		1,
		1
	}
	self.ceiling_turret_module.recoil.vertical = {
		1,
		1.5,
		1,
		1
	}
	self.ceiling_turret_module.challenges = {}
	self.ceiling_turret_module.challenges.group = "sentry_gun"
	self.ceiling_turret_module.challenges.weapon = "sentry_gun"
	self.ceiling_turret_module.suppression = 0.8
	self.ceiling_turret_module_no_idle = deep_clone(self.ceiling_turret_module)
	self.ceiling_turret_module_no_idle.CAN_GO_IDLE = false
end
function WeaponTweakData:_init_data_s552_npc()
	self.s552_npc.sounds.prefix = "sig552_npc"
	self.s552_npc.use_data.selection_index = SELECTION.PRIMARY
	self.s552_npc.DAMAGE = 1
	self.s552_npc.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.s552_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.s552_npc.CLIP_AMMO_MAX = 30
	self.s552_npc.NR_CLIPS_MAX = 5
	self.s552_npc.auto.fire_rate = 0.15
	self.s552_npc.hold = "rifle"
	self.s552_npc.alert_size = 5000
	self.s552_npc.suppression = 1
end
function WeaponTweakData:_init_data_scar_npc()
	self.scar_npc.sounds.prefix = "scar_npc"
	self.scar_npc.use_data.selection_index = SELECTION.PRIMARY
	self.scar_npc.DAMAGE = 1
	self.scar_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.scar_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.scar_npc.CLIP_AMMO_MAX = 20
	self.scar_npc.NR_CLIPS_MAX = 5
	self.scar_npc.auto.fire_rate = 0.15
	self.scar_npc.hold = "rifle"
	self.scar_npc.alert_size = 5000
	self.scar_npc.suppression = 1
end
function WeaponTweakData:_init_data_hk21_npc()
	self.hk21_npc.sounds.prefix = "hk23e_npc"
	self.hk21_npc.use_data.selection_index = SELECTION.PRIMARY
	self.hk21_npc.DAMAGE = 1
	self.hk21_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.hk21_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.hk21_npc.CLIP_AMMO_MAX = 150
	self.hk21_npc.NR_CLIPS_MAX = 5
	self.hk21_npc.auto.fire_rate = 0.15
	self.hk21_npc.hold = "rifle"
	self.hk21_npc.alert_size = 5000
	self.hk21_npc.suppression = 1
end
function WeaponTweakData:_init_data_m249_npc()
	self.m249_npc.sounds.prefix = "m249_npc"
	self.m249_npc.use_data.selection_index = SELECTION.PRIMARY
	self.m249_npc.DAMAGE = 1
	self.m249_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.m249_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.m249_npc.CLIP_AMMO_MAX = 200
	self.m249_npc.NR_CLIPS_MAX = 2
	self.m249_npc.auto.fire_rate = 0.08
	self.m249_npc.hold = "rifle"
	self.m249_npc.alert_size = 5000
	self.m249_npc.suppression = 1
	self.rpk_lmg_npc = deep_clone(self.m249_npc)
end
function WeaponTweakData:_init_data_mini_npc()
	self.mini_npc.sounds.prefix = "minigun_npc"
	self.mini_npc.use_data.selection_index = SELECTION.PRIMARY
	self.mini_npc.DAMAGE = 1
	self.mini_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.mini_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.mini_npc.CLIP_AMMO_MAX = 750
	self.mini_npc.NR_CLIPS_MAX = 2
	self.mini_npc.auto.fire_rate = 0.02
	self.mini_npc.hold = "rifle"
	self.mini_npc.alert_size = 5000
	self.mini_npc.suppression = 1
end
function WeaponTweakData:_init_data_contraband_npc()
	self.contraband_npc.sounds.prefix = "contraband_npc"
	self.contraband_npc.use_data.selection_index = SELECTION.PRIMARY
	self.contraband_npc.DAMAGE = 1
	self.contraband_npc.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.contraband_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.contraband_npc.CLIP_AMMO_MAX = 20
	self.contraband_npc.NR_CLIPS_MAX = 5
	self.contraband_npc.auto.fire_rate = 0.15
	self.contraband_npc.hold = "rifle"
	self.contraband_npc.alert_size = 5000
	self.contraband_npc.suppression = 1
	self.contraband_m203_npc.sounds.prefix = "contrabandm203_npc"
	self.contraband_m203_npc.use_data.selection_index = SELECTION.PRIMARY
	self.contraband_m203_npc.DAMAGE = 1
	self.contraband_m203_npc.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.contraband_m203_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.contraband_m203_npc.no_trail = true
	self.contraband_m203_npc.CLIP_AMMO_MAX = 1
	self.contraband_m203_npc.NR_CLIPS_MAX = 4
	self.contraband_m203_npc.looped_reload_speed = 0.16666667
	self.contraband_m203_npc.auto.fire_rate = 0.1
	self.contraband_m203_npc.hold = "rifle"
	self.contraband_m203_npc.alert_size = 2800
	self.contraband_m203_npc.suppression = 1
end
function WeaponTweakData:_init_data_c45_crew()
	self.c45_crew.sounds.prefix = "c45_npc"
	self.c45_crew.use_data.selection_index = SELECTION.SECONDARY
	self.c45_crew.DAMAGE = 6.43
	self.c45_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.c45_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.c45_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.c45_crew.CLIP_AMMO_MAX = 10
	self.c45_crew.NR_CLIPS_MAX = 9
	self.c45_crew.pull_magazine_during_reload = "pistol"
	self.c45_crew.hold = "pistol"
	self.c45_crew.alert_size = 2500
	self.c45_crew.suppression = 1
	self.colt_1911_primary_crew = deep_clone(self.c45_crew)
	self.colt_1911_primary_crew.use_data.selection_index = SELECTION.PRIMARY
end
function WeaponTweakData:_init_data_x_c45_crew()
	self.x_c45_crew.sounds.prefix = "c45_npc"
	self.x_c45_crew.use_data.selection_index = SELECTION.PRIMARY
	self.x_c45_crew.DAMAGE = 3.26
	self.x_c45_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.x_c45_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.x_c45_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.x_c45_crew.CLIP_AMMO_MAX = 20
	self.x_c45_crew.NR_CLIPS_MAX = 5
	self.x_c45_crew.pull_magazine_during_reload = "pistol"
	self.x_c45_crew.hold = "akimbo_pistol"
	self.x_c45_crew.alert_size = 2500
	self.x_c45_crew.suppression = 1
end
function WeaponTweakData:_init_data_beretta92_crew()
	self.beretta92_crew.sounds.prefix = "beretta_npc"
	self.beretta92_crew.use_data.selection_index = SELECTION.SECONDARY
	self.beretta92_crew.DAMAGE = 3.94
	self.beretta92_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.beretta92_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.beretta92_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.beretta92_crew.CLIP_AMMO_MAX = 14
	self.beretta92_crew.NR_CLIPS_MAX = 11
	self.beretta92_crew.pull_magazine_during_reload = "pistol"
	self.beretta92_crew.hold = "pistol"
	self.beretta92_crew.alert_size = 300
	self.beretta92_crew.suppression = 0.3
	self.beretta92_primary_crew = deep_clone(self.beretta92_crew)
	self.beretta92_primary_crew.use_data.selection_index = SELECTION.PRIMARY
end
function WeaponTweakData:_init_data_glock_18_crew()
	self.glock_18_crew.sounds.prefix = "g18c_npc"
	self.glock_18_crew.use_data.selection_index = SELECTION.SECONDARY
	self.glock_18_crew.DAMAGE = 1.31
	self.glock_18_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.glock_18_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.glock_18_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.glock_18_crew.CLIP_AMMO_MAX = 20
	self.glock_18_crew.NR_CLIPS_MAX = 8
	self.glock_18_crew.pull_magazine_during_reload = "pistol"
	self.glock_18_crew.hold = "pistol"
	self.glock_18_crew.auto = {}
	self.glock_18_crew.auto.fire_rate = 0.066
	self.glock_18_crew.alert_size = 2500
	self.glock_18_crew.suppression = 0.45
	self.glock_18c_primary_crew = deep_clone(self.glock_18_crew)
	self.glock_18c_primary_crew.use_data.selection_index = SELECTION.PRIMARY
end
function WeaponTweakData:_init_data_raging_bull_crew()
	self.raging_bull_crew.sounds.prefix = "rbull_npc"
	self.raging_bull_crew.use_data.selection_index = SELECTION.SECONDARY
	self.raging_bull_crew.DAMAGE = 14.76
	self.raging_bull_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.raging_bull_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.raging_bull_crew.CLIP_AMMO_MAX = 6
	self.raging_bull_crew.NR_CLIPS_MAX = 8
	self.raging_bull_crew.hold = "pistol"
	self.raging_bull_crew.reload = "revolver"
	self.raging_bull_crew.alert_size = 5000
	self.raging_bull_crew.suppression = 1.8
	self.raging_bull_primary_crew = deep_clone(self.raging_bull_crew)
	self.raging_bull_primary_crew.use_data.selection_index = SELECTION.PRIMARY
end
function WeaponTweakData:_init_data_m4_crew()
	self.m4_crew.sounds.prefix = "m4_npc"
	self.m4_crew.use_data.selection_index = SELECTION.PRIMARY
	self.m4_crew.DAMAGE = 1.5
	self.m4_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.m4_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.m4_crew.CLIP_AMMO_MAX = 30
	self.m4_crew.NR_CLIPS_MAX = 5
	self.m4_crew.pull_magazine_during_reload = "rifle"
	self.m4_crew.auto.fire_rate = 0.1
	self.m4_crew.hold = "rifle"
	self.m4_crew.alert_size = 5000
	self.m4_crew.suppression = 1
	self.m4_secondary_crew = deep_clone(self.m4_crew)
	self.m4_secondary_crew.use_data.selection_index = SELECTION.SECONDARY
	self.ak47_ass_crew = deep_clone(self.m4_crew)
end
function WeaponTweakData:_init_data_ak47_crew()
	self.ak47_crew.sounds.prefix = "akm_npc"
	self.ak47_crew.use_data.selection_index = SELECTION.PRIMARY
	self.ak47_crew.DAMAGE = 1.81
	self.ak47_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.ak47_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.ak47_crew.CLIP_AMMO_MAX = 30
	self.ak47_crew.NR_CLIPS_MAX = 5
	self.ak47_crew.auto.fire_rate = 0.107
	self.ak47_crew.hold = "rifle"
	self.ak47_crew.alert_size = 5000
	self.ak47_crew.suppression = 1
end
function WeaponTweakData:_init_data_m14_crew()
	self.m14_crew.sounds.prefix = "m14_npc"
	self.m14_crew.use_data.selection_index = SELECTION.PRIMARY
	self.m14_crew.DAMAGE = 7.5
	self.m14_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.m14_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.m14_crew.CLIP_AMMO_MAX = 10
	self.m14_crew.NR_CLIPS_MAX = 7
	self.m14_crew.pull_magazine_during_reload = "rifle"
	self.m14_crew.hold = "rifle"
	self.m14_crew.alert_size = 5000
	self.m14_crew.suppression = 1
end
function WeaponTweakData:_init_data_r870_crew()
	self.r870_crew.sounds.prefix = "remington_npc"
	self.r870_crew.use_data.selection_index = SELECTION.PRIMARY
	self.r870_crew.DAMAGE = 15
	self.r870_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.r870_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
	self.r870_crew.CLIP_AMMO_MAX = 6
	self.r870_crew.NR_CLIPS_MAX = 4
	self.r870_crew.hold = "rifle"
	self.r870_crew.alert_size = 4500
	self.r870_crew.suppression = 1.8
	self.r870_crew.is_shotgun = true
	self.benelli_crew = deep_clone(self.r870_crew)
end
function WeaponTweakData:_init_data_mossberg_crew()
	self.mossberg_crew.sounds.prefix = "mossberg_npc"
	self.mossberg_crew.use_data.selection_index = SELECTION.PRIMARY
	self.mossberg_crew.DAMAGE = 15
	self.mossberg_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.mossberg_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
	self.mossberg_crew.CLIP_AMMO_MAX = 6
	self.mossberg_crew.NR_CLIPS_MAX = 4
	self.mossberg_crew.hold = "rifle"
	self.mossberg_crew.alert_size = 3000
	self.mossberg_crew.suppression = 2
	self.mossberg_crew.is_shotgun = true
end
function WeaponTweakData:_init_data_mp5_crew()
	self.mp5_crew.sounds.prefix = "mp5_npc"
	self.mp5_crew.use_data.selection_index = SELECTION.SECONDARY
	self.mp5_crew.DAMAGE = 1.2
	self.mp5_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.mp5_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.mp5_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mp5_crew.CLIP_AMMO_MAX = 30
	self.mp5_crew.NR_CLIPS_MAX = 5
	self.mp5_crew.pull_magazine_during_reload = "smg"
	self.mp5_crew.auto.fire_rate = 0.08
	self.mp5_crew.hold = "rifle"
	self.mp5_crew.alert_size = 2500
	self.mp5_crew.suppression = 1
end
function WeaponTweakData:_init_data_g36_crew()
	self.g36_crew.sounds.prefix = "g36_npc"
	self.g36_crew.use_data.selection_index = SELECTION.PRIMARY
	self.g36_crew.DAMAGE = 1.24
	self.g36_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.g36_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.g36_crew.CLIP_AMMO_MAX = 30
	self.g36_crew.NR_CLIPS_MAX = 5
	self.g36_crew.pull_magazine_during_reload = "rifle"
	self.g36_crew.auto.fire_rate = 0.085
	self.g36_crew.hold = "rifle"
	self.g36_crew.alert_size = 5000
	self.g36_crew.suppression = 1
end
function WeaponTweakData:_init_data_g17_crew()
	self.g17_crew.sounds.prefix = "g17_npc"
	self.g17_crew.use_data.selection_index = SELECTION.SECONDARY
	self.g17_crew.DAMAGE = 3.75
	self.g17_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.g17_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.g17_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.g17_crew.CLIP_AMMO_MAX = 17
	self.g17_crew.NR_CLIPS_MAX = 5
	self.g17_crew.pull_magazine_during_reload = "pistol"
	self.g17_crew.hold = "pistol"
	self.g17_crew.alert_size = 2500
	self.g17_crew.suppression = 1
end
function WeaponTweakData:_init_data_mp9_crew()
	self.mp9_crew.sounds.prefix = "mp9_npc"
	self.mp9_crew.use_data.selection_index = SELECTION.SECONDARY
	self.mp9_crew.DAMAGE = 1.08
	self.mp9_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.mp9_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.mp9_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mp9_crew.CLIP_AMMO_MAX = 30
	self.mp9_crew.NR_CLIPS_MAX = 5
	self.mp9_crew.pull_magazine_during_reload = "smg"
	self.mp9_crew.auto.fire_rate = 0.063
	self.mp9_crew.hold = {
		"uzi",
		"bullpup",
		"rifle"
	}
	self.mp9_crew.alert_size = 1000
	self.mp9_crew.suppression = 1
end
function WeaponTweakData:_init_data_olympic_crew()
	self.olympic_crew.sounds.prefix = "m4_olympic_npc"
	self.olympic_crew.use_data.selection_index = SELECTION.SECONDARY
	self.olympic_crew.DAMAGE = 1.43
	self.olympic_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.olympic_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.olympic_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.olympic_crew.CLIP_AMMO_MAX = 25
	self.olympic_crew.NR_CLIPS_MAX = 5
	self.olympic_crew.pull_magazine_during_reload = "rifle"
	self.olympic_crew.auto.fire_rate = 0.088
	self.olympic_crew.hold = "rifle"
	self.olympic_crew.alert_size = 1000
	self.olympic_crew.suppression = 1
	self.olympic_primary_crew = deep_clone(self.olympic_crew)
	self.olympic_primary_crew.use_data.selection_index = SELECTION.PRIMARY
end
function WeaponTweakData:_init_data_m16_crew()
	self.m16_crew.sounds.prefix = "m16_npc"
	self.m16_crew.use_data.selection_index = SELECTION.PRIMARY
	self.m16_crew.DAMAGE = 1.58
	self.m16_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.m16_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.m16_crew.CLIP_AMMO_MAX = 30
	self.m16_crew.NR_CLIPS_MAX = 8
	self.m16_crew.pull_magazine_during_reload = "rifle"
	self.m16_crew.auto.fire_rate = 0.07
	self.m16_crew.hold = "rifle"
	self.m16_crew.alert_size = 5000
	self.m16_crew.suppression = 1
end
function WeaponTweakData:_init_data_aug_crew()
	self.aug_crew.sounds.prefix = "aug_npc"
	self.aug_crew.use_data.selection_index = SELECTION.PRIMARY
	self.aug_crew.DAMAGE = 1.37
	self.aug_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.aug_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.aug_crew.CLIP_AMMO_MAX = 30
	self.aug_crew.NR_CLIPS_MAX = 5
	self.aug_crew.pull_magazine_during_reload = "rifle"
	self.aug_crew.auto.fire_rate = 0.08
	self.aug_crew.hold = {"bullpup", "rifle"}
	self.aug_crew.alert_size = 5000
	self.aug_crew.suppression = 1
	self.aug_secondary_crew = deep_clone(self.aug_crew)
	self.aug_secondary_crew.use_data.selection_index = SELECTION.SECONDARY
end
function WeaponTweakData:_init_data_ak74_crew()
	self.ak74_crew.sounds.prefix = "ak74_npc"
	self.ak74_crew.use_data.selection_index = SELECTION.PRIMARY
	self.ak74_crew.DAMAGE = 1.45
	self.ak74_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.ak74_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.ak74_crew.CLIP_AMMO_MAX = 30
	self.ak74_crew.NR_CLIPS_MAX = 5
	self.ak74_crew.pull_magazine_during_reload = "rifle"
	self.ak74_crew.auto.fire_rate = 0.092
	self.ak74_crew.hold = "rifle"
	self.ak74_crew.alert_size = 5000
	self.ak74_crew.suppression = 1
	self.ak74_secondary_crew = deep_clone(self.ak74_crew)
	self.ak74_secondary_crew.use_data.selection_index = SELECTION.SECONDARY
end
function WeaponTweakData:_init_data_ak5_crew()
	self.ak5_crew.sounds.prefix = "ak5_npc"
	self.ak5_crew.use_data.selection_index = SELECTION.PRIMARY
	self.ak5_crew.DAMAGE = 1.4
	self.ak5_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.ak5_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.ak5_crew.CLIP_AMMO_MAX = 30
	self.ak5_crew.NR_CLIPS_MAX = 5
	self.ak5_crew.pull_magazine_during_reload = "rifle"
	self.ak5_crew.auto.fire_rate = 0.085
	self.ak5_crew.hold = "rifle"
	self.ak5_crew.alert_size = 5000
	self.ak5_crew.suppression = 1
end
function WeaponTweakData:_init_data_p90_crew()
	self.p90_crew.sounds.prefix = "p90_npc"
	self.p90_crew.use_data.selection_index = SELECTION.SECONDARY
	self.p90_crew.DAMAGE = 0.99
	self.p90_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.p90_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.p90_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.p90_crew.CLIP_AMMO_MAX = 50
	self.p90_crew.NR_CLIPS_MAX = 4
	self.p90_crew.reload = "looped"
	self.p90_crew.looped_reload_speed = 0.14285715
	self.p90_crew.auto.fire_rate = 0.066
	self.p90_crew.hold = {"bullpup", "rifle"}
	self.p90_crew.alert_size = 1000
	self.p90_crew.suppression = 1
end
function WeaponTweakData:_init_data_amcar_crew()
	self.amcar_crew.sounds.prefix = "amcar_npc"
	self.amcar_crew.use_data.selection_index = SELECTION.PRIMARY
	self.amcar_crew.DAMAGE = 1.68
	self.amcar_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.amcar_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.amcar_crew.CLIP_AMMO_MAX = 20
	self.amcar_crew.NR_CLIPS_MAX = 5
	self.amcar_crew.pull_magazine_during_reload = "rifle"
	self.amcar_crew.auto.fire_rate = 0.11
	self.amcar_crew.hold = "rifle"
	self.amcar_crew.alert_size = 5000
	self.amcar_crew.suppression = 1
end
function WeaponTweakData:_init_data_mac10_crew()
	self.mac10_crew.sounds.prefix = "mac10_npc"
	self.mac10_crew.use_data.selection_index = SELECTION.SECONDARY
	self.mac10_crew.DAMAGE = 1.03
	self.mac10_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.mac10_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.mac10_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mac10_crew.CLIP_AMMO_MAX = 40
	self.mac10_crew.NR_CLIPS_MAX = 5
	self.mac10_crew.pull_magazine_during_reload = "smg"
	self.mac10_crew.auto.fire_rate = 0.06
	self.mac10_crew.hold = "pistol"
	self.mac10_crew.alert_size = 1000
	self.mac10_crew.suppression = 1
end
function WeaponTweakData:_init_data_akmsu_crew()
	self.akmsu_crew.sounds.prefix = "akmsu_npc"
	self.akmsu_crew.use_data.selection_index = SELECTION.SECONDARY
	self.akmsu_crew.DAMAGE = 1.59
	self.akmsu_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.akmsu_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.akmsu_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.akmsu_crew.CLIP_AMMO_MAX = 30
	self.akmsu_crew.NR_CLIPS_MAX = 5
	self.akmsu_crew.pull_magazine_during_reload = "rifle"
	self.akmsu_crew.auto.fire_rate = 0.073
	self.akmsu_crew.hold = "rifle"
	self.akmsu_crew.alert_size = 1000
	self.akmsu_crew.suppression = 1
	self.akmsu_primary_crew = deep_clone(self.akmsu_crew)
	self.akmsu_primary_crew.use_data.selection_index = SELECTION.PRIMARY
end
function WeaponTweakData:_init_data_akm_crew()
	self.akm_crew.sounds.prefix = "akm_npc"
	self.akm_crew.use_data.selection_index = SELECTION.PRIMARY
	self.akm_crew.DAMAGE = 1.82
	self.akm_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.akm_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.akm_crew.CLIP_AMMO_MAX = 30
	self.akm_crew.NR_CLIPS_MAX = 5
	self.akm_crew.pull_magazine_during_reload = "rifle"
	self.akm_crew.auto.fire_rate = 0.107
	self.akm_crew.hold = "rifle"
	self.akm_crew.alert_size = 5000
	self.akm_crew.suppression = 1
end
function WeaponTweakData:_init_data_akm_gold_crew()
	self.akm_gold_crew.sounds.prefix = "akm_npc"
	self.akm_gold_crew.use_data.selection_index = SELECTION.PRIMARY
	self.akm_gold_crew.DAMAGE = 1.82
	self.akm_gold_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.akm_gold_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.akm_gold_crew.CLIP_AMMO_MAX = 30
	self.akm_gold_crew.NR_CLIPS_MAX = 5
	self.akm_gold_crew.pull_magazine_during_reload = "rifle"
	self.akm_gold_crew.auto.fire_rate = 0.107
	self.akm_gold_crew.hold = "rifle"
	self.akm_gold_crew.alert_size = 5000
	self.akm_gold_crew.suppression = 1
end
function WeaponTweakData:_init_data_deagle_crew()
	self.deagle_crew.sounds.prefix = "deagle_npc"
	self.deagle_crew.use_data.selection_index = SELECTION.SECONDARY
	self.deagle_crew.DAMAGE = 8.51
	self.deagle_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.deagle_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.deagle_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.deagle_crew.CLIP_AMMO_MAX = 10
	self.deagle_crew.NR_CLIPS_MAX = 5
	self.deagle_crew.pull_magazine_during_reload = "pistol"
	self.deagle_crew.hold = "pistol"
	self.deagle_crew.alert_size = 2500
	self.deagle_crew.suppression = 1
	self.deagle_primary_crew = deep_clone(self.deagle_crew)
	self.deagle_primary_crew.use_data.selection_index = SELECTION.PRIMARY
end
function WeaponTweakData:_init_data_serbu_crew()
	self.serbu_crew.sounds.prefix = "serbu_npc"
	self.serbu_crew.use_data.selection_index = SELECTION.SECONDARY
	self.serbu_crew.DAMAGE = 15
	self.serbu_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.serbu_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
	self.serbu_crew.CLIP_AMMO_MAX = 6
	self.serbu_crew.NR_CLIPS_MAX = 4
	self.serbu_crew.hold = "rifle"
	self.serbu_crew.alert_size = 4500
	self.serbu_crew.suppression = 1.8
	self.serbu_crew.is_shotgun = true
end
function WeaponTweakData:_init_data_saiga_crew()
	self.saiga_crew.sounds.prefix = "saiga_npc"
	self.saiga_crew.use_data.selection_index = SELECTION.PRIMARY
	self.saiga_crew.DAMAGE = 6.37
	self.saiga_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.saiga_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.saiga_crew.CLIP_AMMO_MAX = 7
	self.saiga_crew.NR_CLIPS_MAX = 10
	self.saiga_crew.pull_magazine_during_reload = "rifle"
	self.saiga_crew.hold = "rifle"
	self.saiga_crew.alert_size = 4500
	self.saiga_crew.suppression = 1.8
	self.saiga_crew.is_shotgun = true
end
function WeaponTweakData:_init_data_huntsman_crew()
	self.huntsman_crew.sounds.prefix = "huntsman_npc"
	self.huntsman_crew.use_data.selection_index = SELECTION.PRIMARY
	self.huntsman_crew.DAMAGE = 21.83
	self.huntsman_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.huntsman_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.huntsman_crew.CLIP_AMMO_MAX = 2
	self.huntsman_crew.NR_CLIPS_MAX = 4
	self.huntsman_crew.looped_reload_speed = 0.2
	self.huntsman_crew.hold = "rifle"
	self.huntsman_crew.alert_size = 4500
	self.huntsman_crew.suppression = 1.8
	self.huntsman_crew.is_shotgun = true
end
function WeaponTweakData:_init_data_saw_crew()
	self.saw_crew.sounds.prefix = "saw_npc"
	self.saw_crew.sounds.fire = "Play_npc_saw_handheld_start"
	self.saw_crew.sounds.stop_fire = "Play_npc_saw_handheld_end"
	self.saw_crew.use_data.selection_index = SELECTION.PRIMARY
	self.saw_crew.DAMAGE = 1
	self.saw_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.saw_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.saw_crew.CLIP_AMMO_MAX = 2
	self.saw_crew.NR_CLIPS_MAX = 4
	self.saw_crew.hold = "bullpup"
	self.saw_crew.alert_size = 4500
	self.saw_crew.suppression = 1.8
	self.saw_secondary_crew = deep_clone(self.saw_crew)
	self.saw_secondary_crew.use_data.selection_index = SELECTION.SECONDARY
end
function WeaponTweakData:_init_data_usp_crew()
	self.usp_crew.sounds.prefix = "usp45_npc"
	self.usp_crew.use_data.selection_index = SELECTION.SECONDARY
	self.usp_crew.DAMAGE = 6.15
	self.usp_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.usp_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.usp_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.usp_crew.CLIP_AMMO_MAX = 13
	self.usp_crew.NR_CLIPS_MAX = 6
	self.usp_crew.pull_magazine_during_reload = "pistol"
	self.usp_crew.hold = "pistol"
	self.usp_crew.alert_size = 1800
	self.usp_crew.suppression = 2
end
function WeaponTweakData:_init_data_g22c_crew()
	self.g22c_crew.sounds.prefix = "g22_npc"
	self.g22c_crew.use_data.selection_index = SELECTION.SECONDARY
	self.g22c_crew.DAMAGE = 5.97
	self.g22c_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.g22c_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.g22c_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.g22c_crew.CLIP_AMMO_MAX = 16
	self.g22c_crew.NR_CLIPS_MAX = 6
	self.g22c_crew.pull_magazine_during_reload = "pistol"
	self.g22c_crew.hold = "pistol"
	self.g22c_crew.alert_size = 1800
	self.g22c_crew.suppression = 2
end
function WeaponTweakData:_init_data_judge_crew()
	self.judge_crew.sounds.prefix = "judge_npc"
	self.judge_crew.use_data.selection_index = SELECTION.SECONDARY
	self.judge_crew.DAMAGE = 15.47
	self.judge_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.judge_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.judge_crew.CLIP_AMMO_MAX = 5
	self.judge_crew.NR_CLIPS_MAX = 5
	self.judge_crew.hold = "pistol"
	self.judge_crew.reload = "revolver"
	self.judge_crew.alert_size = 5000
	self.judge_crew.suppression = 1.8
end
function WeaponTweakData:_init_data_m45_crew()
	self.m45_crew.sounds.prefix = "m45_npc"
	self.m45_crew.use_data.selection_index = SELECTION.SECONDARY
	self.m45_crew.DAMAGE = 1.66
	self.m45_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.m45_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.m45_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.m45_crew.CLIP_AMMO_MAX = 40
	self.m45_crew.NR_CLIPS_MAX = 5
	self.m45_crew.auto.fire_rate = 0.1
	self.m45_crew.hold = "rifle"
	self.m45_crew.alert_size = 2800
	self.m45_crew.suppression = 1
end
function WeaponTweakData:_init_data_s552_crew()
	self.s552_crew.sounds.prefix = "sig552_npc"
	self.s552_crew.use_data.selection_index = SELECTION.PRIMARY
	self.s552_crew.DAMAGE = 1.24
	self.s552_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.s552_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.s552_crew.CLIP_AMMO_MAX = 30
	self.s552_crew.NR_CLIPS_MAX = 5
	self.s552_crew.pull_magazine_during_reload = "rifle"
	self.s552_crew.auto.fire_rate = 0.084
	self.s552_crew.hold = "rifle"
	self.s552_crew.alert_size = 5000
	self.s552_crew.suppression = 1
	self.s552_secondary_crew = deep_clone(self.s552_crew)
	self.s552_secondary_crew.use_data.selection_index = SELECTION.SECONDARY
end
function WeaponTweakData:_init_data_ppk_crew()
	self.ppk_crew.sounds.prefix = "w_ppk_npc"
	self.ppk_crew.use_data.selection_index = SELECTION.SECONDARY
	self.ppk_crew.DAMAGE = 3.94
	self.ppk_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.ppk_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.ppk_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.ppk_crew.CLIP_AMMO_MAX = 14
	self.ppk_crew.NR_CLIPS_MAX = 5
	self.ppk_crew.pull_magazine_during_reload = "pistol"
	self.ppk_crew.hold = "pistol"
	self.ppk_crew.alert_size = 2500
	self.ppk_crew.suppression = 1
end
function WeaponTweakData:_init_data_mp7_crew()
	self.mp7_crew.sounds.prefix = "mp7_npc"
	self.mp7_crew.use_data.selection_index = SELECTION.SECONDARY
	self.mp7_crew.DAMAGE = 1.4
	self.mp7_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.mp7_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.mp7_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.mp7_crew.CLIP_AMMO_MAX = 20
	self.mp7_crew.NR_CLIPS_MAX = 5
	self.mp7_crew.pull_magazine_during_reload = "smg"
	self.mp7_crew.auto.fire_rate = 0.063
	self.mp7_crew.hold = {
		"uzi",
		"bullpup",
		"rifle"
	}
	self.mp7_crew.alert_size = 2800
	self.mp7_crew.suppression = 1
end
function WeaponTweakData:_init_data_scar_crew()
	self.scar_crew.sounds.prefix = "scar_npc"
	self.scar_crew.use_data.selection_index = SELECTION.PRIMARY
	self.scar_crew.DAMAGE = 1.97
	self.scar_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.scar_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.scar_crew.CLIP_AMMO_MAX = 20
	self.scar_crew.NR_CLIPS_MAX = 5
	self.scar_crew.pull_magazine_during_reload = "rifle"
	self.scar_crew.auto.fire_rate = 0.098
	self.scar_crew.hold = "rifle"
	self.scar_crew.alert_size = 5000
	self.scar_crew.suppression = 1
end
function WeaponTweakData:_init_data_p226_crew()
	self.p226_crew.sounds.prefix = "p226r_npc"
	self.p226_crew.use_data.selection_index = SELECTION.SECONDARY
	self.p226_crew.DAMAGE = 6.23
	self.p226_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.p226_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.p226_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.p226_crew.CLIP_AMMO_MAX = 12
	self.p226_crew.NR_CLIPS_MAX = 5
	self.p226_crew.pull_magazine_during_reload = "pistol"
	self.p226_crew.hold = "pistol"
	self.p226_crew.alert_size = 2500
	self.p226_crew.suppression = 1
end
function WeaponTweakData:_init_data_hk21_crew()
	self.hk21_crew.sounds.prefix = "hk23e_npc"
	self.hk21_crew.use_data.selection_index = SELECTION.PRIMARY
	self.hk21_crew.DAMAGE = 1.22
	self.hk21_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.hk21_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.hk21_crew.CLIP_AMMO_MAX = 150
	self.hk21_crew.NR_CLIPS_MAX = 5
	self.hk21_crew.pull_magazine_during_reload = "large_plastic"
	self.hk21_crew.auto.fire_rate = 0.083
	self.hk21_crew.hold = "rifle"
	self.hk21_crew.alert_size = 5000
	self.hk21_crew.suppression = 1
end
function WeaponTweakData:_init_data_m249_crew()
	self.m249_crew.sounds.prefix = "m249_npc"
	self.m249_crew.use_data.selection_index = SELECTION.PRIMARY
	self.m249_crew.DAMAGE = 0.99
	self.m249_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.m249_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.m249_crew.CLIP_AMMO_MAX = 200
	self.m249_crew.NR_CLIPS_MAX = 2
	self.m249_crew.pull_magazine_during_reload = "large_plastic"
	self.m249_crew.auto.fire_rate = 0.066
	self.m249_crew.hold = "rifle"
	self.m249_crew.alert_size = 5000
	self.m249_crew.suppression = 1
end
function WeaponTweakData:_init_data_rpk_crew()
	self.rpk_crew.sounds.prefix = "rpk_npc"
	self.rpk_crew.use_data.selection_index = SELECTION.PRIMARY
	self.rpk_crew.DAMAGE = 1.35
	self.rpk_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.rpk_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.rpk_crew.CLIP_AMMO_MAX = 100
	self.rpk_crew.NR_CLIPS_MAX = 5
	self.rpk_crew.pull_magazine_during_reload = "large_metal"
	self.rpk_crew.auto.fire_rate = 0.08
	self.rpk_crew.hold = "rifle"
	self.rpk_crew.alert_size = 5000
	self.rpk_crew.suppression = 1
end
function WeaponTweakData:_init_data_m95_crew()
	self.m95_crew.sounds.prefix = "barrett_npc"
	self.m95_crew.use_data.selection_index = SELECTION.PRIMARY
	self.m95_crew.DAMAGE = 19.43
	self.m95_crew.muzzleflash = "effects/payday2/particles/weapons/50cal_auto"
	self.m95_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper_m95"
	self.m95_crew.CLIP_AMMO_MAX = 5
	self.m95_crew.NR_CLIPS_MAX = 5
	self.m95_crew.pull_magazine_during_reload = "rifle"
	self.m95_crew.hold = "rifle"
	self.m95_crew.reload = "bullpup"
	self.m95_crew.alert_size = 5000
	self.m95_crew.suppression = 1
end
function WeaponTweakData:_init_data_msr_crew()
	self.msr_crew.sounds.prefix = "msr_npc"
	self.msr_crew.use_data.selection_index = SELECTION.PRIMARY
	self.msr_crew.DAMAGE = 13.04
	self.msr_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.msr_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
	self.msr_crew.CLIP_AMMO_MAX = 10
	self.msr_crew.NR_CLIPS_MAX = 5
	self.msr_crew.pull_magazine_during_reload = "rifle"
	self.msr_crew.hold = "rifle"
	self.msr_crew.alert_size = 5000
	self.msr_crew.suppression = 1
end
function WeaponTweakData:_init_data_r93_crew()
	self.r93_crew.sounds.prefix = "blazer_npc"
	self.r93_crew.use_data.selection_index = SELECTION.PRIMARY
	self.r93_crew.DAMAGE = 16.19
	self.r93_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.r93_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
	self.r93_crew.CLIP_AMMO_MAX = 6
	self.r93_crew.NR_CLIPS_MAX = 5
	self.r93_crew.pull_magazine_during_reload = "rifle"
	self.r93_crew.hold = "rifle"
	self.r93_crew.alert_size = 5000
	self.r93_crew.suppression = 1
end
function WeaponTweakData:_init_data_fal_crew()
	self.fal_crew.sounds.prefix = "fn_fal_npc"
	self.fal_crew.use_data.selection_index = SELECTION.PRIMARY
	self.fal_crew.DAMAGE = 1.85
	self.fal_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.fal_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.fal_crew.CLIP_AMMO_MAX = 20
	self.fal_crew.NR_CLIPS_MAX = 5
	self.fal_crew.pull_magazine_during_reload = "rifle"
	self.fal_crew.auto.fire_rate = 0.08
	self.fal_crew.hold = "rifle"
	self.fal_crew.alert_size = 5000
	self.fal_crew.suppression = 1
end
function WeaponTweakData:_init_data_ben_crew()
	self.ben_crew.sounds.prefix = "benelli_m4_npc"
	self.ben_crew.use_data.selection_index = SELECTION.PRIMARY
	self.ben_crew.DAMAGE = 8.06
	self.ben_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.ben_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.ben_crew.CLIP_AMMO_MAX = 8
	self.ben_crew.NR_CLIPS_MAX = 4
	self.ben_crew.hold = "rifle"
	self.ben_crew.reload = "looped"
	self.ben_crew.looped_reload_speed = 0.8
	self.ben_crew.alert_size = 4500
	self.ben_crew.suppression = 1.8
	self.ben_crew.is_shotgun = true
end
function WeaponTweakData:_init_data_striker_crew()
	self.striker_crew.sounds.prefix = "striker_npc"
	self.striker_crew.use_data.selection_index = SELECTION.SECONDARY
	self.striker_crew.DAMAGE = 6.92
	self.striker_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.striker_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.striker_crew.CLIP_AMMO_MAX = 12
	self.striker_crew.NR_CLIPS_MAX = 4
	self.striker_crew.looped_reload_speed = 0.6666667
	self.striker_crew.hold = {"bullpup", "rifle"}
	self.striker_crew.alert_size = 4500
	self.striker_crew.suppression = 1.8
	self.striker_crew.is_shotgun = true
end
function WeaponTweakData:_init_data_ksg_crew()
	self.ksg_crew.sounds.prefix = "keltec_npc"
	self.ksg_crew.use_data.selection_index = SELECTION.PRIMARY
	self.ksg_crew.DAMAGE = 13.05
	self.ksg_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.ksg_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.ksg_crew.CLIP_AMMO_MAX = 14
	self.ksg_crew.NR_CLIPS_MAX = 4
	self.ksg_crew.hold = "rifle"
	self.ksg_crew.alert_size = 4500
	self.ksg_crew.suppression = 1.8
	self.ksg_crew.is_shotgun = true
end
function WeaponTweakData:_init_data_gre_m79_crew()
	self.gre_m79_crew.sounds.prefix = "gl40_npc"
	self.gre_m79_crew.use_data.selection_index = SELECTION.PRIMARY
	self.gre_m79_crew.DAMAGE = 2
	self.gre_m79_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.gre_m79_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.gre_m79_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.gre_m79_crew.no_trail = true
	self.gre_m79_crew.CLIP_AMMO_MAX = 1
	self.gre_m79_crew.NR_CLIPS_MAX = 4
	self.gre_m79_crew.looped_reload_speed = 0.16666667
	self.gre_m79_crew.auto.fire_rate = 0.1
	self.gre_m79_crew.hold = "rifle"
	self.gre_m79_crew.alert_size = 2800
	self.gre_m79_crew.suppression = 1
end
function WeaponTweakData:_init_data_g3_crew()
	self.g3_crew.sounds.prefix = "g3_npc"
	self.g3_crew.use_data.selection_index = SELECTION.PRIMARY
	self.g3_crew.DAMAGE = 1.93
	self.g3_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.g3_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.g3_crew.CLIP_AMMO_MAX = 20
	self.g3_crew.NR_CLIPS_MAX = 5
	self.g3_crew.pull_magazine_during_reload = "rifle"
	self.g3_crew.auto.fire_rate = 0.092
	self.g3_crew.hold = "rifle"
	self.g3_crew.alert_size = 5000
	self.g3_crew.suppression = 1
end
function WeaponTweakData:_init_data_galil_crew()
	self.galil_crew.sounds.prefix = "galil_npc"
	self.galil_crew.use_data.selection_index = SELECTION.PRIMARY
	self.galil_crew.DAMAGE = 1.31
	self.galil_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.galil_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.galil_crew.CLIP_AMMO_MAX = 30
	self.galil_crew.NR_CLIPS_MAX = 5
	self.galil_crew.pull_magazine_during_reload = "rifle"
	self.galil_crew.auto.fire_rate = 0.071
	self.galil_crew.hold = "rifle"
	self.galil_crew.alert_size = 5000
	self.galil_crew.suppression = 1
end
function WeaponTweakData:_init_data_famas_crew()
	self.famas_crew.sounds.prefix = "famas_npc"
	self.famas_crew.use_data.selection_index = SELECTION.PRIMARY
	self.famas_crew.DAMAGE = 1.07
	self.famas_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.famas_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.famas_crew.CLIP_AMMO_MAX = 30
	self.famas_crew.NR_CLIPS_MAX = 5
	self.famas_crew.pull_magazine_during_reload = "rifle"
	self.famas_crew.auto.fire_rate = 0.06
	self.famas_crew.hold = {"bullpup", "rifle"}
	self.famas_crew.alert_size = 5000
	self.famas_crew.suppression = 1
end
function WeaponTweakData:_init_data_scorpion_crew()
	self.scorpion_crew.sounds.prefix = "skorpion_npc"
	self.scorpion_crew.use_data.selection_index = SELECTION.SECONDARY
	self.scorpion_crew.DAMAGE = 1.33
	self.scorpion_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.scorpion_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.scorpion_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.scorpion_crew.CLIP_AMMO_MAX = 20
	self.scorpion_crew.NR_CLIPS_MAX = 5
	self.scorpion_crew.pull_magazine_during_reload = "smg"
	self.scorpion_crew.auto.fire_rate = 0.06
	self.scorpion_crew.hold = "pistol"
	self.scorpion_crew.alert_size = 2800
	self.scorpion_crew.suppression = 1
end
function WeaponTweakData:_init_data_tec9_crew()
	self.tec9_crew.sounds.prefix = "tec9_npc"
	self.tec9_crew.use_data.selection_index = SELECTION.SECONDARY
	self.tec9_crew.DAMAGE = 1.38
	self.tec9_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.tec9_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.tec9_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.tec9_crew.CLIP_AMMO_MAX = 20
	self.tec9_crew.NR_CLIPS_MAX = 5
	self.tec9_crew.pull_magazine_during_reload = "smg"
	self.tec9_crew.auto.fire_rate = 0.067
	self.tec9_crew.hold = "pistol"
	self.tec9_crew.alert_size = 2800
	self.tec9_crew.suppression = 1
end
function WeaponTweakData:_init_data_uzi_crew()
	self.uzi_crew.sounds.prefix = "uzi_npc"
	self.uzi_crew.use_data.selection_index = SELECTION.SECONDARY
	self.uzi_crew.DAMAGE = 1.2
	self.uzi_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.uzi_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.uzi_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.uzi_crew.CLIP_AMMO_MAX = 40
	self.uzi_crew.NR_CLIPS_MAX = 4
	self.uzi_crew.pull_magazine_during_reload = "smg"
	self.uzi_crew.auto.fire_rate = 0.086
	self.uzi_crew.hold = {
		"uzi",
		"bullpup",
		"rifle"
	}
	self.uzi_crew.alert_size = 2800
	self.uzi_crew.suppression = 1
end
function WeaponTweakData:_init_data_jowi_crew()
	self.jowi_crew.sounds.prefix = "g17_npc"
	self.jowi_crew.use_data.selection_index = SELECTION.PRIMARY
	self.jowi_crew.DAMAGE = 2.37
	self.jowi_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.jowi_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.jowi_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.jowi_crew.CLIP_AMMO_MAX = 20
	self.jowi_crew.NR_CLIPS_MAX = 5
	self.jowi_crew.pull_magazine_during_reload = "pistol"
	self.jowi_crew.hold = "akimbo_pistol"
	self.jowi_crew.alert_size = 2500
	self.jowi_crew.suppression = 1
end
function WeaponTweakData:_init_data_x_1911_crew()
	self.x_1911_crew.sounds.prefix = "c45_npc"
	self.x_1911_crew.use_data.selection_index = SELECTION.PRIMARY
	self.x_1911_crew.DAMAGE = 3.26
	self.x_1911_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.x_1911_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.x_1911_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.x_1911_crew.CLIP_AMMO_MAX = 20
	self.x_1911_crew.NR_CLIPS_MAX = 5
	self.x_1911_crew.pull_magazine_during_reload = "pistol"
	self.x_1911_crew.hold = "akimbo_pistol"
	self.x_1911_crew.alert_size = 2500
	self.x_1911_crew.suppression = 1
end
function WeaponTweakData:_init_data_x_b92fs_crew()
	self.x_b92fs_crew.sounds.prefix = "beretta_npc"
	self.x_b92fs_crew.use_data.selection_index = SELECTION.PRIMARY
	self.x_b92fs_crew.DAMAGE = 2.03
	self.x_b92fs_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.x_b92fs_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.x_b92fs_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.x_b92fs_crew.CLIP_AMMO_MAX = 28
	self.x_b92fs_crew.NR_CLIPS_MAX = 5
	self.x_b92fs_crew.pull_magazine_during_reload = "pistol"
	self.x_b92fs_crew.hold = "akimbo_pistol"
	self.x_b92fs_crew.alert_size = 2500
	self.x_b92fs_crew.suppression = 1
end
function WeaponTweakData:_init_data_x_deagle_crew()
	self.x_deagle_crew.sounds.prefix = "deagle_npc"
	self.x_deagle_crew.use_data.selection_index = SELECTION.PRIMARY
	self.x_deagle_crew.DAMAGE = 4.14
	self.x_deagle_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.x_deagle_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.x_deagle_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.x_deagle_crew.CLIP_AMMO_MAX = 20
	self.x_deagle_crew.NR_CLIPS_MAX = 5
	self.x_deagle_crew.pull_magazine_during_reload = "pistol"
	self.x_deagle_crew.hold = "akimbo_pistol"
	self.x_deagle_crew.alert_size = 2500
	self.x_deagle_crew.suppression = 1
end
function WeaponTweakData:_init_data_g26_crew()
	self.g26_crew.sounds.prefix = "g17_npc"
	self.g26_crew.use_data.selection_index = SELECTION.SECONDARY
	self.g26_crew.DAMAGE = 4.36
	self.g26_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.g26_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.g26_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.g26_crew.CLIP_AMMO_MAX = 10
	self.g26_crew.NR_CLIPS_MAX = 5
	self.g26_crew.pull_magazine_during_reload = "pistol"
	self.g26_crew.hold = "pistol"
	self.g26_crew.alert_size = 2500
	self.g26_crew.suppression = 1
end
function WeaponTweakData:_init_data_spas12_crew()
	self.spas12_crew.sounds.prefix = "spas_npc"
	self.spas12_crew.use_data.selection_index = SELECTION.PRIMARY
	self.spas12_crew.DAMAGE = 9.21
	self.spas12_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.spas12_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.spas12_crew.CLIP_AMMO_MAX = 6
	self.spas12_crew.NR_CLIPS_MAX = 4
	self.spas12_crew.hold = "rifle"
	self.spas12_crew.alert_size = 4500
	self.spas12_crew.suppression = 1.8
	self.spas12_crew.is_shotgun = true
end
function WeaponTweakData:_init_data_mg42_crew()
	self.mg42_crew.sounds.prefix = "mg42_npc"
	self.mg42_crew.use_data.selection_index = SELECTION.PRIMARY
	self.mg42_crew.DAMAGE = 0.92
	self.mg42_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.mg42_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.mg42_crew.CLIP_AMMO_MAX = 150
	self.mg42_crew.NR_CLIPS_MAX = 3
	self.mg42_crew.auto.fire_rate = 0.05
	self.mg42_crew.hold = "rifle"
	self.mg42_crew.alert_size = 5000
	self.mg42_crew.suppression = 1
	self.mg42_secondary_crew = deep_clone(self.mg42_crew)
	self.mg42_secondary_crew.use_data.selection_index = SELECTION.SECONDARY
	self.mg42_secondary_crew.armor_piercing = true
end
function WeaponTweakData:_init_data_c96_crew()
	self.c96_crew.sounds.prefix = "c96_npc"
	self.c96_crew.use_data.selection_index = SELECTION.SECONDARY
	self.c96_crew.DAMAGE = 7.76
	self.c96_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.c96_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.c96_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.c96_crew.CLIP_AMMO_MAX = 10
	self.c96_crew.NR_CLIPS_MAX = 5
	self.c96_crew.reload = "revolver"
	self.c96_crew.hold = "pistol"
	self.c96_crew.alert_size = 2500
	self.c96_crew.suppression = 1
end
function WeaponTweakData:_init_data_sterling_crew()
	self.sterling_crew.sounds.prefix = "sterling_npc"
	self.sterling_crew.use_data.selection_index = SELECTION.SECONDARY
	self.sterling_crew.DAMAGE = 1.67
	self.sterling_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.sterling_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.sterling_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.sterling_crew.CLIP_AMMO_MAX = 20
	self.sterling_crew.NR_CLIPS_MAX = 5
	self.sterling_crew.auto.fire_rate = 0.11
	self.sterling_crew.hold = "pistol"
	self.sterling_crew.alert_size = 2800
	self.sterling_crew.suppression = 1
end
function WeaponTweakData:_init_data_mosin_crew()
	self.mosin_crew.sounds.prefix = "nagant_npc"
	self.mosin_crew.use_data.selection_index = SELECTION.PRIMARY
	self.mosin_crew.DAMAGE = 14.8
	self.mosin_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.mosin_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
	self.mosin_crew.CLIP_AMMO_MAX = 5
	self.mosin_crew.NR_CLIPS_MAX = 8
	self.mosin_crew.reload = "revolver"
	self.mosin_crew.hold = "rifle"
	self.mosin_crew.alert_size = 5000
	self.mosin_crew.suppression = 1
	self.mosin_secondary_crew = deep_clone(self.mosin_crew)
	self.mosin_secondary_crew.use_data.selection_index = SELECTION.SECONDARY
end
function WeaponTweakData:_init_data_m1928_crew()
	self.m1928_crew.sounds.prefix = "m1928_npc"
	self.m1928_crew.use_data.selection_index = SELECTION.PRIMARY
	self.m1928_crew.DAMAGE = 1.11
	self.m1928_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.m1928_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.m1928_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.m1928_crew.CLIP_AMMO_MAX = 50
	self.m1928_crew.NR_CLIPS_MAX = 3
	self.m1928_crew.pull_magazine_during_reload = "large_metal"
	self.m1928_crew.auto.fire_rate = 0.083
	self.m1928_crew.hold = "rifle"
	self.m1928_crew.alert_size = 5000
	self.m1928_crew.suppression = 1
end
function WeaponTweakData:_init_data_l85a2_crew()
	self.l85a2_crew.sounds.prefix = "l85_npc"
	self.l85a2_crew.use_data.selection_index = SELECTION.PRIMARY
	self.l85a2_crew.DAMAGE = 1.39
	self.l85a2_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.l85a2_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.l85a2_crew.CLIP_AMMO_MAX = 30
	self.l85a2_crew.NR_CLIPS_MAX = 5
	self.l85a2_crew.pull_magazine_during_reload = "rifle"
	self.l85a2_crew.auto.fire_rate = 0.083
	self.l85a2_crew.hold = "rifle"
	self.l85a2_crew.reload = "bullpup"
	self.l85a2_crew.alert_size = 5000
	self.l85a2_crew.suppression = 1
end
function WeaponTweakData:_init_data_vhs_crew()
	self.vhs_crew.sounds.prefix = "vhs_npc"
	self.vhs_crew.use_data.selection_index = SELECTION.PRIMARY
	self.vhs_crew.DAMAGE = 1.3
	self.vhs_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.vhs_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.vhs_crew.CLIP_AMMO_MAX = 30
	self.vhs_crew.NR_CLIPS_MAX = 5
	self.vhs_crew.pull_magazine_during_reload = "rifle"
	self.vhs_crew.auto.fire_rate = 0.07
	self.vhs_crew.hold = {"bullpup", "rifle"}
	self.vhs_crew.alert_size = 5000
	self.vhs_crew.suppression = 1
end
function WeaponTweakData:_init_data_m134_crew()
	self.m134_crew.sounds.prefix = "minigun_npc"
	self.m134_crew.use_data.selection_index = SELECTION.PRIMARY
	self.m134_crew.DAMAGE = 0.4
	self.m134_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.m134_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.m134_crew.CLIP_AMMO_MAX = 750
	self.m134_crew.NR_CLIPS_MAX = 1
	self.m134_crew.auto.fire_rate = 0.02
	self.m134_crew.hold = "rifle"
	self.m134_crew.alert_size = 5000
	self.m134_crew.suppression = 1
	self.m134_crew.has_fire_animation = true
	self.m134_crew.animations = {}
	self.m134_crew.animations.thq_align_anim = "thq"
end
function WeaponTweakData:_init_data_rpg7_crew()
	self.rpg7_crew.sounds.prefix = "rpg_npc"
	self.rpg7_crew.use_data.selection_index = SELECTION.PRIMARY
	self.rpg7_crew.DAMAGE = 2
	self.rpg7_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.rpg7_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.rpg7_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.rpg7_crew.no_trail = true
	self.rpg7_crew.CLIP_AMMO_MAX = 1
	self.rpg7_crew.NR_CLIPS_MAX = 4
	self.rpg7_crew.auto.fire_rate = 0.1
	self.rpg7_crew.hold = "rifle"
	self.rpg7_crew.alert_size = 2800
	self.rpg7_crew.suppression = 1
end
function WeaponTweakData:_init_data_hs2000_crew()
	self.hs2000_crew.sounds.prefix = "p226r_npc"
	self.hs2000_crew.use_data.selection_index = SELECTION.SECONDARY
	self.hs2000_crew.DAMAGE = 5.84
	self.hs2000_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.hs2000_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.hs2000_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.hs2000_crew.CLIP_AMMO_MAX = 19
	self.hs2000_crew.NR_CLIPS_MAX = 5
	self.hs2000_crew.pull_magazine_during_reload = "pistol"
	self.hs2000_crew.hold = "pistol"
	self.hs2000_crew.alert_size = 2500
	self.hs2000_crew.suppression = 1
end
function WeaponTweakData:_init_data_cobray_crew()
	self.cobray_crew.sounds.prefix = "cobray_npc"
	self.cobray_crew.use_data.selection_index = SELECTION.SECONDARY
	self.cobray_crew.DAMAGE = 1.05
	self.cobray_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.cobray_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.cobray_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.cobray_crew.CLIP_AMMO_MAX = 32
	self.cobray_crew.NR_CLIPS_MAX = 5
	self.cobray_crew.pull_magazine_during_reload = "smg"
	self.cobray_crew.auto.fire_rate = 0.05
	self.cobray_crew.hold = {
		"uzi",
		"bullpup",
		"rifle"
	}
	self.cobray_crew.alert_size = 5000
	self.cobray_crew.suppression = 1
end
function WeaponTweakData:_init_data_b682_crew()
	self.b682_crew.sounds.prefix = "b682_npc"
	self.b682_crew.use_data.selection_index = SELECTION.PRIMARY
	self.b682_crew.DAMAGE = 21.83
	self.b682_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.b682_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.b682_crew.CLIP_AMMO_MAX = 2
	self.b682_crew.NR_CLIPS_MAX = 4
	self.b682_crew.looped_reload_speed = 0.2
	self.b682_crew.hold = "rifle"
	self.b682_crew.alert_size = 4500
	self.b682_crew.suppression = 1.8
	self.b682_crew.is_shotgun = true
end
function WeaponTweakData:_init_data_x_g22c_crew()
	self.x_g22c_crew.sounds.prefix = "g22_npc"
	self.x_g22c_crew.use_data.selection_index = SELECTION.PRIMARY
	self.x_g22c_crew.DAMAGE = 2.82
	self.x_g22c_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.x_g22c_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.x_g22c_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.x_g22c_crew.CLIP_AMMO_MAX = 32
	self.x_g22c_crew.NR_CLIPS_MAX = 5
	self.x_g22c_crew.pull_magazine_during_reload = "pistol"
	self.x_g22c_crew.hold = "akimbo_pistol"
	self.x_g22c_crew.alert_size = 1800
	self.x_g22c_crew.suppression = 2
end
function WeaponTweakData:_init_data_x_g17_crew()
	self.x_g17_crew.sounds.prefix = "g22_npc"
	self.x_g17_crew.use_data.selection_index = SELECTION.PRIMARY
	self.x_g17_crew.DAMAGE = 1.88
	self.x_g17_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.x_g17_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.x_g17_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.x_g17_crew.CLIP_AMMO_MAX = 34
	self.x_g17_crew.NR_CLIPS_MAX = 5
	self.x_g17_crew.pull_magazine_during_reload = "pistol"
	self.x_g17_crew.hold = "akimbo_pistol"
	self.x_g17_crew.alert_size = 1800
	self.x_g17_crew.suppression = 2
end
function WeaponTweakData:_init_data_x_usp_crew()
	self.x_usp_crew.sounds.prefix = "g22_npc"
	self.x_usp_crew.use_data.selection_index = SELECTION.PRIMARY
	self.x_usp_crew.DAMAGE = 2.99
	self.x_usp_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.x_usp_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.x_usp_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.x_usp_crew.CLIP_AMMO_MAX = 26
	self.x_usp_crew.NR_CLIPS_MAX = 5
	self.x_usp_crew.pull_magazine_during_reload = "pistol"
	self.x_usp_crew.hold = "akimbo_pistol"
	self.x_usp_crew.alert_size = 1800
	self.x_usp_crew.suppression = 2
end
function WeaponTweakData:_init_data_flamethrower_mk2_crew()
	self.flamethrower_mk2_crew.sounds.prefix = "flamethrower_npc"
	self.flamethrower_mk2_crew.sounds.fire = "flamethrower_npc_fire"
	self.flamethrower_mk2_crew.sounds.stop_fire = "flamethrower_npc_fire_stop"
	self.flamethrower_mk2_crew.use_data.selection_index = SELECTION.PRIMARY
	self.flamethrower_mk2_crew.DAMAGE = 1
	self.flamethrower_mk2_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.flamethrower_mk2_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.flamethrower_mk2_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.flamethrower_mk2_crew.CLIP_AMMO_MAX = 300
	self.flamethrower_mk2_crew.NR_CLIPS_MAX = 4
	self.flamethrower_mk2_crew.pull_magazine_during_reload = "large_metal"
	self.flamethrower_mk2_crew.hold = {"bullpup", "rifle"}
	self.flamethrower_mk2_crew.auto.fire_rate = 0.05
	self.flamethrower_mk2_crew.hud_icon = "rifle"
	self.flamethrower_mk2_crew.alert_size = 2500
	self.flamethrower_mk2_crew.suppression = 0.45
end
function WeaponTweakData:_init_data_m32_crew()
	self.m32_crew.sounds.prefix = "mgl_npc"
	self.m32_crew.use_data.selection_index = SELECTION.PRIMARY
	self.m32_crew.DAMAGE = 2
	self.m32_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.m32_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.m32_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.m32_crew.no_trail = true
	self.m32_crew.CLIP_AMMO_MAX = 6
	self.m32_crew.NR_CLIPS_MAX = 4
	self.m32_crew.looped_reload_speed = 0.2
	self.m32_crew.auto.fire_rate = 0.1
	self.m32_crew.hold = "rifle"
	self.m32_crew.alert_size = 2800
	self.m32_crew.suppression = 1
end
function WeaponTweakData:_init_data_aa12_crew()
	self.aa12_crew.sounds.prefix = "aa12_npc"
	self.aa12_crew.use_data.selection_index = SELECTION.PRIMARY
	self.aa12_crew.DAMAGE = 6.04
	self.aa12_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.aa12_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.aa12_crew.CLIP_AMMO_MAX = 8
	self.aa12_crew.NR_CLIPS_MAX = 4
	self.aa12_crew.pull_magazine_during_reload = "large_plastic"
	self.aa12_crew.hold = "rifle"
	self.aa12_crew.alert_size = 4500
	self.aa12_crew.suppression = 1.8
	self.aa12_crew.is_shotgun = true
end
function WeaponTweakData:_init_data_peacemaker_crew()
	self.peacemaker_crew.sounds.prefix = "pmkr45_npc"
	self.peacemaker_crew.use_data.selection_index = SELECTION.SECONDARY
	self.peacemaker_crew.DAMAGE = 14.76
	self.peacemaker_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.peacemaker_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.peacemaker_crew.CLIP_AMMO_MAX = 6
	self.peacemaker_crew.NR_CLIPS_MAX = 8
	self.peacemaker_crew.reload = "revolver"
	self.peacemaker_crew.hold = "pistol"
	self.peacemaker_crew.alert_size = 5000
	self.peacemaker_crew.suppression = 1.8
end
function WeaponTweakData:_init_data_winchester1874_crew()
	self.winchester1874_crew.sounds.prefix = "m1873_npc"
	self.winchester1874_crew.use_data.selection_index = SELECTION.PRIMARY
	self.winchester1874_crew.DAMAGE = 9.28
	self.winchester1874_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.winchester1874_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper_9mm"
	self.winchester1874_crew.CLIP_AMMO_MAX = 15
	self.winchester1874_crew.NR_CLIPS_MAX = 8
	self.winchester1874_crew.reload = "looped"
	self.winchester1874_crew.looped_reload_speed = 0.7407407
	self.winchester1874_crew.hold = "rifle"
	self.winchester1874_crew.alert_size = 5000
	self.winchester1874_crew.suppression = 1
	self.winchester1874_secondary_crew = deep_clone(self.winchester1874_crew)
	self.winchester1874_secondary_crew.use_data.selection_index = SELECTION.SECONDARY
end
function WeaponTweakData:_init_data_plainsrider_crew()
	self.plainsrider_crew.sounds.prefix = "bow_npc"
	self.plainsrider_crew.use_data.selection_index = SELECTION.PRIMARY
	self.plainsrider_crew.use_data.align_place = "left_hand"
	self.plainsrider_crew.DAMAGE = 2
	self.plainsrider_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.plainsrider_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.plainsrider_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.plainsrider_crew.no_trail = true
	self.plainsrider_crew.CLIP_AMMO_MAX = 1
	self.plainsrider_crew.NR_CLIPS_MAX = 4
	self.plainsrider_crew.auto.fire_rate = 0.1
	self.plainsrider_crew.hold = "bow"
	self.plainsrider_crew.has_fire_animation = true
	self.plainsrider_crew.alert_size = 2800
	self.plainsrider_crew.suppression = 1
end
function WeaponTweakData:_init_data_mateba_crew()
	self.mateba_crew.sounds.prefix = "mateba_npc"
	self.mateba_crew.use_data.selection_index = SELECTION.SECONDARY
	self.mateba_crew.DAMAGE = 14.76
	self.mateba_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.mateba_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.mateba_crew.CLIP_AMMO_MAX = 6
	self.mateba_crew.NR_CLIPS_MAX = 8
	self.mateba_crew.hold = "pistol"
	self.mateba_crew.reload = "revolver"
	self.mateba_crew.alert_size = 5000
	self.mateba_crew.suppression = 1.8
end
function WeaponTweakData:_init_data_asval_crew()
	self.asval_crew.sounds.prefix = "val_npc"
	self.asval_crew.use_data.selection_index = SELECTION.PRIMARY
	self.asval_crew.DAMAGE = 1.39
	self.asval_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.asval_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.asval_crew.CLIP_AMMO_MAX = 20
	self.asval_crew.NR_CLIPS_MAX = 5
	self.asval_crew.pull_magazine_during_reload = "rifle"
	self.asval_crew.auto.fire_rate = 0.067
	self.asval_crew.hold = "rifle"
	self.asval_crew.alert_size = 5000
	self.asval_crew.suppression = 1
end
function WeaponTweakData:_init_data_sub2000_crew()
	self.sub2000_crew.sounds.prefix = "sub2k_npc"
	self.sub2000_crew.use_data.selection_index = SELECTION.PRIMARY
	self.sub2000_crew.DAMAGE = 5.87
	self.sub2000_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.sub2000_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.sub2000_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.sub2000_crew.CLIP_AMMO_MAX = 33
	self.sub2000_crew.NR_CLIPS_MAX = 2
	self.sub2000_crew.pull_magazine_during_reload = "smg"
	self.sub2000_crew.hold = {"uzi", "rifle"}
	self.sub2000_crew.alert_size = 5000
	self.sub2000_crew.suppression = 1
end
function WeaponTweakData:_init_data_wa2000_crew()
	self.wa2000_crew.sounds.prefix = "lakner_npc"
	self.wa2000_crew.use_data.selection_index = SELECTION.PRIMARY
	self.wa2000_crew.DAMAGE = 8.05
	self.wa2000_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.wa2000_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.wa2000_crew.CLIP_AMMO_MAX = 10
	self.wa2000_crew.NR_CLIPS_MAX = 5
	self.wa2000_crew.pull_magazine_during_reload = "rifle"
	self.wa2000_crew.hold = {"bullpup", "rifle"}
	self.wa2000_crew.alert_size = 5000
	self.wa2000_crew.suppression = 1
end
function WeaponTweakData:_init_data_polymer_crew()
	self.polymer_crew.sounds.prefix = "polymer_npc"
	self.polymer_crew.use_data.selection_index = SELECTION.SECONDARY
	self.polymer_crew.DAMAGE = 1.08
	self.polymer_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.polymer_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.polymer_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.polymer_crew.CLIP_AMMO_MAX = 30
	self.polymer_crew.NR_CLIPS_MAX = 5
	self.polymer_crew.reload = "rifle"
	self.polymer_crew.pull_magazine_during_reload = "smg"
	self.polymer_crew.auto.fire_rate = 0.05
	self.polymer_crew.hold = {"bullpup", "rifle"}
	self.polymer_crew.alert_size = 5000
	self.polymer_crew.suppression = 1
end
function WeaponTweakData:_init_data_hunter_crew()
	self.hunter_crew.sounds.prefix = "hunter_npc"
	self.hunter_crew.use_data.selection_index = SELECTION.SECONDARY
	self.hunter_crew.DAMAGE = 2
	self.hunter_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.hunter_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.hunter_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.hunter_crew.CLIP_AMMO_MAX = 1
	self.hunter_crew.NR_CLIPS_MAX = 5
	self.hunter_crew.looped_reload_speed = 0.5
	self.hunter_crew.reload = "looped"
	self.hunter_crew.auto.fire_rate = 20
	self.hunter_crew.hold = "pistol"
	self.hunter_crew.alert_size = 5000
	self.hunter_crew.suppression = 1
end
function WeaponTweakData:_init_data_baka_crew()
	self.baka_crew.sounds.prefix = "baka_npc"
	self.baka_crew.use_data.selection_index = SELECTION.SECONDARY
	self.baka_crew.DAMAGE = 0.96
	self.baka_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.baka_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.baka_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.baka_crew.CLIP_AMMO_MAX = 32
	self.baka_crew.NR_CLIPS_MAX = 5
	self.baka_crew.pull_magazine_during_reload = "smg"
	self.baka_crew.auto.fire_rate = 0.05
	self.baka_crew.hold = "pistol"
	self.baka_crew.alert_size = 5000
	self.baka_crew.suppression = 1
end
function WeaponTweakData:_init_data_arblast_crew()
	self.arblast_crew.sounds.prefix = "arblast_npc"
	self.arblast_crew.use_data.selection_index = SELECTION.PRIMARY
	self.arblast_crew.DAMAGE = 2
	self.arblast_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.arblast_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.arblast_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.arblast_crew.CLIP_AMMO_MAX = 1
	self.arblast_crew.NR_CLIPS_MAX = 5
	self.arblast_crew.reload = "looped"
	self.arblast_crew.looped_reload_speed = 0.2
	self.arblast_crew.auto.fire_rate = 20
	self.arblast_crew.hold = "rifle"
	self.arblast_crew.alert_size = 5000
	self.arblast_crew.suppression = 1
end
function WeaponTweakData:_init_data_frankish_crew()
	self.frankish_crew.sounds.prefix = "frankish_npc"
	self.frankish_crew.use_data.selection_index = SELECTION.PRIMARY
	self.frankish_crew.DAMAGE = 2
	self.frankish_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.frankish_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.frankish_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.frankish_crew.CLIP_AMMO_MAX = 1
	self.frankish_crew.NR_CLIPS_MAX = 5
	self.frankish_crew.reload = "looped"
	self.frankish_crew.looped_reload_speed = 0.5
	self.frankish_crew.auto.fire_rate = 20
	self.frankish_crew.hold = "rifle"
	self.frankish_crew.alert_size = 5000
	self.frankish_crew.suppression = 1
end
function WeaponTweakData:_init_data_long_crew()
	self.long_crew.sounds.prefix = "bow_npc"
	self.long_crew.use_data.selection_index = SELECTION.PRIMARY
	self.long_crew.use_data.align_place = "left_hand"
	self.long_crew.DAMAGE = 2
	self.long_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.long_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.long_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.long_crew.no_trail = true
	self.long_crew.CLIP_AMMO_MAX = 1
	self.long_crew.NR_CLIPS_MAX = 4
	self.long_crew.auto.fire_rate = 0.1
	self.long_crew.hold = "bow"
	self.long_crew.has_fire_animation = true
	self.long_crew.alert_size = 2800
	self.long_crew.suppression = 1
end
function WeaponTweakData:_init_data_par_crew()
	self.par_crew.sounds.prefix = "svinet_npc"
	self.par_crew.use_data.selection_index = SELECTION.PRIMARY
	self.par_crew.DAMAGE = 0.99
	self.par_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.par_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.par_crew.CLIP_AMMO_MAX = 200
	self.par_crew.NR_CLIPS_MAX = 2
	self.par_crew.pull_magazine_during_reload = "large_plastic"
	self.par_crew.auto.fire_rate = 0.066
	self.par_crew.hold = "rifle"
	self.par_crew.alert_size = 5000
	self.par_crew.suppression = 1
	self.par_secondary_crew = deep_clone(self.par_crew)
	self.par_secondary_crew.use_data.selection_index = SELECTION.SECONDARY
	self.par_secondary_crew.armor_piercing = true
end
function WeaponTweakData:_init_data_sparrow_crew()
	self.sparrow_crew.sounds.prefix = "sparrow_npc"
	self.sparrow_crew.use_data.selection_index = SELECTION.SECONDARY
	self.sparrow_crew.DAMAGE = 8.34
	self.sparrow_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.sparrow_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.sparrow_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.sparrow_crew.CLIP_AMMO_MAX = 12
	self.sparrow_crew.NR_CLIPS_MAX = 5
	self.sparrow_crew.pull_magazine_during_reload = "pistol"
	self.sparrow_crew.hold = "pistol"
	self.sparrow_crew.alert_size = 2500
	self.sparrow_crew.suppression = 1
end
function WeaponTweakData:_init_data_model70_crew()
	self.model70_crew.sounds.prefix = "model70_npc"
	self.model70_crew.use_data.selection_index = SELECTION.PRIMARY
	self.model70_crew.DAMAGE = 15
	self.model70_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.model70_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
	self.model70_crew.CLIP_AMMO_MAX = 5
	self.model70_crew.NR_CLIPS_MAX = 8
	self.model70_crew.pull_magazine_during_reload = "rifle"
	self.model70_crew.hold = "rifle"
	self.model70_crew.alert_size = 5000
	self.model70_crew.suppression = 1
	self.model70_secondary_crew = deep_clone(self.model70_crew)
	self.model70_secondary_crew.use_data.selection_index = SELECTION.SECONDARY
end
function WeaponTweakData:_init_data_m37_crew()
	self.m37_crew.sounds.prefix = "m37_npc"
	self.m37_crew.use_data.selection_index = SELECTION.SECONDARY
	self.m37_crew.DAMAGE = 14.51
	self.m37_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.m37_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.m37_crew.CLIP_AMMO_MAX = 7
	self.m37_crew.NR_CLIPS_MAX = 6
	self.m37_crew.looped_reload_speed = 0.7
	self.m37_crew.hold = "rifle"
	self.m37_crew.alert_size = 4500
	self.m37_crew.suppression = 1.8
	self.m37_crew.is_shotgun = true
end
function WeaponTweakData:_init_data_china_crew()
	self.china_crew.sounds.prefix = "china_npc"
	self.china_crew.use_data.selection_index = SELECTION.SECONDARY
	self.china_crew.DAMAGE = 2
	self.china_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.china_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.china_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.china_crew.no_trail = true
	self.china_crew.CLIP_AMMO_MAX = 3
	self.china_crew.NR_CLIPS_MAX = 2
	self.china_crew.looped_reload_speed = 0.33333334
	self.china_crew.auto.fire_rate = 0.1
	self.china_crew.hold = "rifle"
	self.china_crew.alert_size = 2800
	self.china_crew.suppression = 1
end
function WeaponTweakData:_init_data_sr2_crew()
	self.sr2_crew.sounds.prefix = "sr2_npc"
	self.sr2_crew.use_data.selection_index = SELECTION.SECONDARY
	self.sr2_crew.DAMAGE = 1.25
	self.sr2_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.sr2_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.sr2_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.sr2_crew.CLIP_AMMO_MAX = 32
	self.sr2_crew.NR_CLIPS_MAX = 5
	self.sr2_crew.pull_magazine_during_reload = "smg"
	self.sr2_crew.auto.fire_rate = 0.08
	self.sr2_crew.hold = {
		"uzi",
		"bullpup",
		"rifle"
	}
	self.sr2_crew.alert_size = 5000
	self.sr2_crew.suppression = 1
end
function WeaponTweakData:_init_data_x_sr2_crew()
	self.x_sr2_crew.sounds.prefix = "sr2_x_npc"
	self.x_sr2_crew.use_data.selection_index = SELECTION.PRIMARY
	self.x_sr2_crew.DAMAGE = 0.58
	self.x_sr2_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.x_sr2_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.x_sr2_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.x_sr2_crew.CLIP_AMMO_MAX = 64
	self.x_sr2_crew.NR_CLIPS_MAX = 5
	self.x_sr2_crew.pull_magazine_during_reload = "smg"
	self.x_sr2_crew.hold = "akimbo_pistol"
	self.x_sr2_crew.alert_size = 1800
	self.x_sr2_crew.suppression = 2
end
function WeaponTweakData:_init_data_pl14_crew()
	self.pl14_crew.sounds.prefix = "pl14_npc"
	self.pl14_crew.use_data.selection_index = SELECTION.SECONDARY
	self.pl14_crew.DAMAGE = 8.34
	self.pl14_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.pl14_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.pl14_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.pl14_crew.CLIP_AMMO_MAX = 12
	self.pl14_crew.NR_CLIPS_MAX = 5
	self.pl14_crew.pull_magazine_during_reload = "pistol"
	self.pl14_crew.hold = "pistol"
	self.pl14_crew.alert_size = 2500
	self.pl14_crew.suppression = 1
end
function WeaponTweakData:_init_data_x_mp5_crew()
	self.x_mp5_crew.sounds.prefix = "mp5_x_npc"
	self.x_mp5_crew.use_data.selection_index = SELECTION.PRIMARY
	self.x_mp5_crew.DAMAGE = 0.6
	self.x_mp5_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.x_mp5_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.x_mp5_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.x_mp5_crew.CLIP_AMMO_MAX = 60
	self.x_mp5_crew.NR_CLIPS_MAX = 5
	self.x_mp5_crew.pull_magazine_during_reload = "smg"
	self.x_mp5_crew.hold = "akimbo_pistol"
	self.x_mp5_crew.alert_size = 1800
	self.x_mp5_crew.suppression = 2
end
function WeaponTweakData:_init_data_x_akmsu_crew()
	self.x_akmsu_crew.sounds.prefix = "akmsu_x_npc"
	self.x_akmsu_crew.use_data.selection_index = SELECTION.PRIMARY
	self.x_akmsu_crew.DAMAGE = 0.58
	self.x_akmsu_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.x_akmsu_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.x_akmsu_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.x_akmsu_crew.CLIP_AMMO_MAX = 60
	self.x_akmsu_crew.NR_CLIPS_MAX = 5
	self.x_akmsu_crew.pull_magazine_during_reload = "rifle"
	self.x_akmsu_crew.hold = "akimbo_pistol"
	self.x_akmsu_crew.alert_size = 1800
	self.x_akmsu_crew.suppression = 2
end
function WeaponTweakData:_init_data_tecci_crew()
	self.tecci_crew.sounds.prefix = "tecci_npc"
	self.tecci_crew.use_data.selection_index = SELECTION.PRIMARY
	self.tecci_crew.DAMAGE = 0.9
	self.tecci_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.tecci_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.tecci_crew.CLIP_AMMO_MAX = 100
	self.tecci_crew.NR_CLIPS_MAX = 5
	self.tecci_crew.pull_magazine_during_reload = "large_plastic"
	self.tecci_crew.auto.fire_rate = 0.09
	self.tecci_crew.hold = "rifle"
	self.tecci_crew.alert_size = 5000
	self.tecci_crew.suppression = 1
end
function WeaponTweakData:_init_data_hajk_crew()
	self.hajk_crew.sounds.prefix = "hajk_npc"
	self.hajk_crew.use_data.selection_index = SELECTION.SECONDARY
	self.hajk_crew.DAMAGE = 1.63
	self.hajk_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.hajk_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.hajk_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.hajk_crew.CLIP_AMMO_MAX = 30
	self.hajk_crew.NR_CLIPS_MAX = 5
	self.hajk_crew.pull_magazine_during_reload = "rifle"
	self.hajk_crew.auto.fire_rate = 0.08
	self.hajk_crew.hold = "rifle"
	self.hajk_crew.alert_size = 1000
	self.hajk_crew.suppression = 1
end
function WeaponTweakData:_init_data_boot_crew()
	self.boot_crew.sounds.prefix = "boot_npc"
	self.boot_crew.use_data.selection_index = SELECTION.PRIMARY
	self.boot_crew.DAMAGE = 14.51
	self.boot_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.boot_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
	self.boot_crew.CLIP_AMMO_MAX = 7
	self.boot_crew.NR_CLIPS_MAX = 5
	self.boot_crew.hold = "rifle"
	self.boot_crew.alert_size = 1000
	self.boot_crew.suppression = 1
end
function WeaponTweakData:_init_data_packrat_crew()
	self.packrat_crew.sounds.prefix = "packrat_npc"
	self.packrat_crew.use_data.selection_index = SELECTION.SECONDARY
	self.packrat_crew.DAMAGE = 6.02
	self.packrat_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.packrat_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.packrat_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.packrat_crew.CLIP_AMMO_MAX = 15
	self.packrat_crew.NR_CLIPS_MAX = 5
	self.packrat_crew.pull_magazine_during_reload = "pistol"
	self.packrat_crew.hold = "pistol"
	self.packrat_crew.alert_size = 2500
	self.packrat_crew.suppression = 1
end
function WeaponTweakData:_init_data_schakal_crew()
	self.schakal_crew.sounds.prefix = "schakal_npc"
	self.schakal_crew.use_data.selection_index = SELECTION.SECONDARY
	self.schakal_crew.DAMAGE = 1.71
	self.schakal_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.schakal_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.schakal_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.schakal_crew.CLIP_AMMO_MAX = 30
	self.schakal_crew.NR_CLIPS_MAX = 5
	self.schakal_crew.pull_magazine_during_reload = "pistol"
	self.schakal_crew.auto.fire_rate = 0.092
	self.schakal_crew.hold = {"bullpup", "rifle"}
	self.schakal_crew.hold = "rifle"
	self.schakal_crew.alert_size = 5000
	self.schakal_crew.suppression = 1
end
function WeaponTweakData:_init_data_desertfox_crew()
	self.desertfox_crew.sounds.prefix = "desertfox_npc"
	self.desertfox_crew.use_data.selection_index = SELECTION.PRIMARY
	self.desertfox_crew.DAMAGE = 15
	self.desertfox_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.desertfox_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
	self.desertfox_crew.CLIP_AMMO_MAX = 5
	self.desertfox_crew.NR_CLIPS_MAX = 8
	self.desertfox_crew.pull_magazine_during_reload = "rifle"
	self.desertfox_crew.hold = "rifle"
	self.desertfox_crew.reload = "bullpup"
	self.desertfox_crew.alert_size = 5000
	self.desertfox_crew.suppression = 1
	self.desertfox_secondary_crew = deep_clone(self.desertfox_crew)
	self.desertfox_secondary_crew.use_data.selection_index = SELECTION.SECONDARY
end
function WeaponTweakData:_init_data_x_packrat_crew()
	self.x_packrat_crew.sounds.prefix = "packrat_npc"
	self.x_packrat_crew.use_data.selection_index = SELECTION.PRIMARY
	self.x_packrat_crew.DAMAGE = 2.87
	self.x_packrat_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.x_packrat_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.x_packrat_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.x_packrat_crew.CLIP_AMMO_MAX = 30
	self.x_packrat_crew.NR_CLIPS_MAX = 5
	self.x_packrat_crew.pull_magazine_during_reload = "pistol"
	self.x_packrat_crew.hold = "akimbo_pistol"
	self.x_packrat_crew.alert_size = 2500
	self.x_packrat_crew.suppression = 1
end
function WeaponTweakData:_init_data_rota_crew()
	self.rota_crew.sounds.prefix = "rota_npc"
	self.rota_crew.use_data.selection_index = SELECTION.SECONDARY
	self.rota_crew.DAMAGE = 7.08
	self.rota_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.rota_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.rota_crew.CLIP_AMMO_MAX = 6
	self.rota_crew.NR_CLIPS_MAX = 6
	self.rota_crew.hold = {"bullpup", "rifle"}
	self.rota_crew.pull_magazine_during_reload = "large_plastic"
	self.rota_crew.alert_size = 4500
	self.rota_crew.suppression = 1.8
	self.rota_crew.is_shotgun = true
end
function WeaponTweakData:_init_data_arbiter_crew()
	self.arbiter_crew.sounds.prefix = "mgl_npc"
	self.arbiter_crew.use_data.selection_index = SELECTION.SECONDARY
	self.arbiter_crew.DAMAGE = 2
	self.arbiter_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.arbiter_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.arbiter_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.arbiter_crew.no_trail = true
	self.arbiter_crew.CLIP_AMMO_MAX = 5
	self.arbiter_crew.NR_CLIPS_MAX = 4
	self.arbiter_crew.pull_magazine_during_reload = "rifle"
	self.arbiter_crew.auto.fire_rate = 0.1
	self.arbiter_crew.hold = "rifle"
	self.arbiter_crew.reload = "bullpup"
	self.arbiter_crew.alert_size = 2800
	self.arbiter_crew.suppression = 1
end
function WeaponTweakData:_init_data_contraband_crew()
	self.contraband_crew.sounds.prefix = "contraband_npc"
	self.contraband_crew.use_data.selection_index = SELECTION.PRIMARY
	self.contraband_crew.DAMAGE = 6.33
	self.contraband_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.contraband_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.contraband_crew.CLIP_AMMO_MAX = 20
	self.contraband_crew.NR_CLIPS_MAX = 5
	self.contraband_crew.pull_magazine_during_reload = "rifle"
	self.contraband_crew.hold = {"bullpup", "rifle"}
	self.contraband_crew.reload = "rifle"
	self.contraband_crew.alert_size = 5000
	self.contraband_crew.suppression = 1
	self.contraband_m203_crew.sounds.prefix = "contrabandm203_npc"
	self.contraband_m203_crew.use_data.selection_index = SELECTION.PRIMARY
	self.contraband_m203_crew.DAMAGE = 2
	self.contraband_m203_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.contraband_m203_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.contraband_m203_crew.no_trail = true
	self.contraband_m203_crew.CLIP_AMMO_MAX = 1
	self.contraband_m203_crew.NR_CLIPS_MAX = 4
	self.contraband_m203_crew.auto.fire_rate = 0.1
	self.contraband_m203_crew.hold = {"bullpup", "rifle"}
	self.contraband_m203_crew.alert_size = 2800
	self.contraband_m203_crew.suppression = 1
end
function WeaponTweakData:_init_data_ray_crew()
	self.ray_crew.sounds.prefix = "ray_npc"
	self.ray_crew.use_data.selection_index = SELECTION.SECONDARY
	self.ray_crew.DAMAGE = 2
	self.ray_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.ray_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.ray_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.ray_crew.no_trail = true
	self.ray_crew.CLIP_AMMO_MAX = 4
	self.ray_crew.NR_CLIPS_MAX = 1
	self.ray_crew.auto.fire_rate = 0.1
	self.ray_crew.hold = "rifle"
	self.ray_crew.animations = {}
	self.ray_crew.animations.thq_align_anim = "thq"
	self.ray_crew.alert_size = 2800
	self.ray_crew.suppression = 1
end
function WeaponTweakData:_init_data_tti_crew()
	self.tti_crew.sounds.prefix = "tti_npc"
	self.tti_crew.use_data.selection_index = SELECTION.PRIMARY
	self.tti_crew.DAMAGE = 5.74
	self.tti_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.tti_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.tti_crew.CLIP_AMMO_MAX = 20
	self.tti_crew.NR_CLIPS_MAX = 5
	self.tti_crew.pull_magazine_during_reload = "rifle"
	self.tti_crew.hold = "rifle"
	self.tti_crew.alert_size = 5000
	self.tti_crew.suppression = 1
end
function WeaponTweakData:_init_data_siltstone_crew()
	self.siltstone_crew.sounds.prefix = "siltstone_npc"
	self.siltstone_crew.use_data.selection_index = SELECTION.PRIMARY
	self.siltstone_crew.DAMAGE = 13.04
	self.siltstone_crew.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.siltstone_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.siltstone_crew.CLIP_AMMO_MAX = 10
	self.siltstone_crew.NR_CLIPS_MAX = 4
	self.siltstone_crew.pull_magazine_during_reload = "rifle"
	self.siltstone_crew.hold = "rifle"
	self.siltstone_crew.alert_size = 5000
	self.siltstone_crew.suppression = 1
end
function WeaponTweakData:_init_data_flint_crew()
	self.flint_crew.sounds.prefix = "flint_npc"
	self.flint_crew.use_data.selection_index = SELECTION.PRIMARY
	self.flint_crew.DAMAGE = 1.66
	self.flint_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.flint_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.flint_crew.CLIP_AMMO_MAX = 35
	self.flint_crew.NR_CLIPS_MAX = 5
	self.flint_crew.pull_magazine_during_reload = "rifle"
	self.flint_crew.auto.fire_rate = 0.092
	self.flint_crew.hold = "rifle"
	self.flint_crew.alert_size = 5000
	self.flint_crew.suppression = 1
end
function WeaponTweakData:_init_data_coal_crew()
	self.coal_crew.sounds.prefix = "coal_npc"
	self.coal_crew.use_data.selection_index = SELECTION.SECONDARY
	self.coal_crew.DAMAGE = 1.49
	self.coal_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.coal_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.coal_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.coal_crew.CLIP_AMMO_MAX = 64
	self.coal_crew.NR_CLIPS_MAX = 2
	self.coal_crew.pull_magazine_during_reload = "large_plastic"
	self.coal_crew.auto.fire_rate = 0.092
	self.coal_crew.reload = "rifle"
	self.coal_crew.hold = {"bullpup", "rifle"}
	self.coal_crew.alert_size = 5000
	self.coal_crew.suppression = 1
end
function WeaponTweakData:_init_data_lemming_crew()
	self.lemming_crew.sounds.prefix = "lemming_npc"
	self.lemming_crew.use_data.selection_index = SELECTION.SECONDARY
	self.lemming_crew.DAMAGE = 8.17
	self.lemming_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.lemming_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.lemming_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.lemming_crew.CLIP_AMMO_MAX = 15
	self.lemming_crew.NR_CLIPS_MAX = 3
	self.lemming_crew.pull_magazine_during_reload = "pistol"
	self.lemming_crew.hold = "pistol"
	self.lemming_crew.alert_size = 2500
	self.lemming_crew.suppression = 1
end
function WeaponTweakData:_init_data_chinchilla_crew()
	self.chinchilla_crew.sounds.prefix = "chinchilla_npc"
	self.chinchilla_crew.use_data.selection_index = SELECTION.SECONDARY
	self.chinchilla_crew.DAMAGE = 14.76
	self.chinchilla_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.chinchilla_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.chinchilla_crew.CLIP_AMMO_MAX = 6
	self.chinchilla_crew.NR_CLIPS_MAX = 5
	self.chinchilla_crew.hold = "pistol"
	self.chinchilla_crew.reload = "revolver"
	self.chinchilla_crew.alert_size = 2500
	self.chinchilla_crew.suppression = 1
end
function WeaponTweakData:_init_data_x_chinchilla_crew()
	self.x_chinchilla_crew.sounds.prefix = "chinchilla_npc"
	self.x_chinchilla_crew.use_data.selection_index = SELECTION.PRIMARY
	self.x_chinchilla_crew.DAMAGE = 6.38
	self.x_chinchilla_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.x_chinchilla_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.x_chinchilla_crew.CLIP_AMMO_MAX = 12
	self.x_chinchilla_crew.NR_CLIPS_MAX = 5
	self.x_chinchilla_crew.hold = "akimbo_pistol"
	self.x_chinchilla_crew.alert_size = 2500
	self.x_chinchilla_crew.suppression = 1
end
function WeaponTweakData:_init_data_breech_crew()
	self.breech_crew.sounds.prefix = "breech_npc"
	self.breech_crew.use_data.selection_index = SELECTION.SECONDARY
	self.breech_crew.DAMAGE = 8.76
	self.breech_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.breech_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.breech_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.breech_crew.CLIP_AMMO_MAX = 8
	self.breech_crew.NR_CLIPS_MAX = 5
	self.breech_crew.pull_magazine_during_reload = "pistol"
	self.breech_crew.alert_size = 2500
	self.breech_crew.suppression = 1
end
function WeaponTweakData:_init_data_ching_crew()
	self.ching_crew.sounds.prefix = "ching_npc"
	self.ching_crew.use_data.selection_index = SELECTION.PRIMARY
	self.ching_crew.DAMAGE = 7.97
	self.ching_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.ching_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.ching_crew.CLIP_AMMO_MAX = 8
	self.ching_crew.NR_CLIPS_MAX = 9
	self.ching_crew.hold = "rifle"
	self.ching_crew.reload = "revolver"
	self.ching_crew.alert_size = 5000
	self.ching_crew.suppression = 1
end
function WeaponTweakData:_init_data_erma_crew()
	self.erma_crew.sounds.prefix = "erma_npc"
	self.erma_crew.use_data.selection_index = SELECTION.SECONDARY
	self.erma_crew.DAMAGE = 1.66
	self.erma_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.erma_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.erma_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.erma_crew.CLIP_AMMO_MAX = 40
	self.erma_crew.NR_CLIPS_MAX = 2
	self.erma_crew.pull_magazine_during_reload = "smg"
	self.erma_crew.auto.fire_rate = 0.1
	self.erma_crew.hold = {"bullpup", "rifle"}
	self.erma_crew.reload = "rifle" 
	self.erma_crew.alert_size = 2800
	self.erma_crew.suppression = 1
end
function WeaponTweakData:_init_data_ecp_crew()
	self.ecp_crew.sounds.prefix = "ecp_npc"
	self.ecp_crew.use_data.selection_index = SELECTION.PRIMARY
	self.ecp_crew.DAMAGE = 2
	self.ecp_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.ecp_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.ecp_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.ecp_crew.CLIP_AMMO_MAX = 6
	self.ecp_crew.NR_CLIPS_MAX = 5
	self.ecp_crew.reload = "looped"
	self.ecp_crew.pull_magazine_during_reload = "smg"
	self.ecp_crew.auto.fire_rate = 20
	self.ecp_crew.hold = "bullpup"
	self.ecp_crew.alert_size = 5000
	self.ecp_crew.suppression = 1
end
function WeaponTweakData:_init_data_shrew_crew()
	self.shrew_crew.sounds.prefix = "shrew_npc"
	self.shrew_crew.use_data.selection_index = SELECTION.SECONDARY
	self.shrew_crew.DAMAGE = 3.75
	self.shrew_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.shrew_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.shrew_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.shrew_crew.CLIP_AMMO_MAX = 17
	self.shrew_crew.NR_CLIPS_MAX = 5
	self.shrew_crew.pull_magazine_during_reload = "pistol"
	self.shrew_crew.hold = "pistol"
	self.shrew_crew.alert_size = 2500
	self.shrew_crew.suppression = 1
end
function WeaponTweakData:_init_data_x_shrew_crew()
	self.x_shrew_crew.sounds.prefix = "shrew_npc"
	self.x_shrew_crew.use_data.selection_index = SELECTION.PRIMARY
	self.x_shrew_crew.DAMAGE = 1.88
	self.x_shrew_crew.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.x_shrew_crew.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.x_shrew_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.x_shrew_crew.CLIP_AMMO_MAX = 34
	self.x_shrew_crew.NR_CLIPS_MAX = 5
	self.x_shrew_crew.hold = "akimbo_pistol"
	self.x_shrew_crew.alert_size = 2500
	self.x_shrew_crew.suppression = 2
end
function WeaponTweakData:_init_data_basset_crew()
	self.basset_crew.sounds.prefix = "basset_npc"
	self.basset_crew.use_data.selection_index = SELECTION.SECONDARY
	self.basset_crew.DAMAGE = 6.04
	self.basset_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.basset_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.basset_crew.rays = 12
	self.basset_crew.CLIP_AMMO_MAX = 8
	self.basset_crew.NR_CLIPS_MAX = 4
	self.basset_crew.pull_magazine_during_reload = "rifle"
	self.basset_crew.hold = "bullpup"
	self.basset_crew.alert_size = 4500
	self.basset_crew.suppression = 1.8
	self.basset_crew.is_shotgun = true
end
function WeaponTweakData:_init_data_x_basset_crew()
	self.x_basset_crew.sounds.prefix = "basset_x_npc"
	self.x_basset_crew.use_data.selection_index = SELECTION.PRIMARY
	self.x_basset_crew.DAMAGE = 3.06
	self.x_basset_crew.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.x_basset_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.x_basset_crew.rays = 12
	self.x_basset_crew.CLIP_AMMO_MAX = 16
	self.x_basset_crew.NR_CLIPS_MAX = 5
	self.x_basset_crew.hold = "akimbo_pistol"
	self.x_basset_crew.alert_size = 4500
	self.x_basset_crew.suppression = 2
end
function WeaponTweakData:_init_data_corgi_crew()
	self.corgi_crew.sounds.prefix = "corgi_npc"
	self.corgi_crew.use_data.selection_index = 2
	self.corgi_crew.DAMAGE = 1.3
	self.corgi_crew.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	self.corgi_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.corgi_crew.CLIP_AMMO_MAX = 30
	self.corgi_crew.NR_CLIPS_MAX = 5
	self.corgi_crew.pull_magazine_during_reload = "rifle"
	self.corgi_crew.auto.fire_rate = 0.07
	self.corgi_crew.hold = {"bullpup", "rifle"}
	self.corgi_crew.alert_size = 5000
	self.corgi_crew.suppression = 1
end

local _create_table_structure_original = WeaponTweakData._create_table_structure
function WeaponTweakData:_create_table_structure()
_create_table_structure_original(self)
	self.c45_npc = {
		usage = "is_pistol",
		sounds = {},
		use_data = {}
	}
	self.x_c45_npc = {
		usage = "akimbo_pistol",
		sounds = {},
		use_data = {}
	}
	self.beretta92_npc = {
		usage = "is_pistol",
		sounds = {},
		use_data = {}
	}
	self.raging_bull_npc = {
		usage = "is_revolver",
		sounds = {},
		use_data = {}
	}
	self.m4_npc = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m14_npc = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m14_sniper_npc = {
		usage = "is_rifle",
		sounds = {},
		use_data = {}
	}
	self.r870_npc = {
		usage = "is_shotgun_pump",
		sounds = {},
		use_data = {}
	}
	self.benelli_npc = {
		usage = "is_shotgun_pump",
		sounds = {},
		use_data = {}
	}
	self.mossberg_npc = {
		usage = "is_shotgun_pump",
		sounds = {},
		use_data = {}
	}
	self.mp5_npc = {
		usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.mac11_npc = {
		usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m79_npc = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.glock_18_npc = {
		usage = "is_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.ak47_npc = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.g36_npc = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.mp9_npc = {
		usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.saiga_npc = {
		usage = "is_shotgun_mag",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.sentry_gun = {
		sounds = {},
		auto = {}
	}
	self.swat_van_turret_module = {
		sounds = {},
		auto = {}
	}
	self.ceiling_turret_module = {
		sounds = {},
		auto = {}
	}
	self.s552_npc = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.scar_npc = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.hk21_npc = {
		usage = "is_lmg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m249_npc = {
		usage = "is_lmg",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.contraband_npc = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.contraband_m203_npc = {
		usage = "is_shotgun_pump",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.mini_npc = {
		usage = "mini",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.c45_crew = {
		usage = "is_pistol",
		sounds = {},
		use_data = {}
	}
	self.x_c45_crew = {
		usage = "akimbo_pistol",
		sounds = {},
		use_data = {}
	}
	self.colt_1911_primary_crew = deep_clone(self.c45_crew)
	self.beretta92_crew = {
		usage = "is_pistol_light",
		anim_usage = "is_pistol",
		sounds = {},
		use_data = {}
	}
	self.beretta92_primary_crew = deep_clone(self.beretta92_crew)
	self.raging_bull_crew = {
		usage = "is_revolver",
		sounds = {},
		use_data = {}
	}
	self.raging_bull_primary_crew = deep_clone(self.raging_bull_crew)
	self.m4_crew = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m4_secondary_crew = deep_clone(self.m4_crew)
	self.m14_crew = {
		usage = "is_rifle_dmr",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.r870_crew = {
		usage = "is_shotgun_pump",
		sounds = {},
		use_data = {}
	}
	self.benelli_crew = {
		usage = "is_shotgun_semi",
		anim_usage = "is_shotgun_pump",
		sounds = {},
		use_data = {}
	}
	self.mossberg_crew = {
		usage = "is_shotgun_pump",
		sounds = {},
		use_data = {}
	}
	self.mp5_crew = {
		usage = "is_smg_light",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.glock_18_crew = {
		usage = "is_smg_heavy",
		anim_usage = "is_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.glock_18c_primary_crew = deep_clone(self.glock_18_crew)
	self.ak47_crew = {
		usage = "is_rifle_heavy",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.g36_crew = {
		usage = "is_rifle_light",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.g17_crew = {
		usage = "is_pistol_light",
		anim_usage = "is_pistol",
		sounds = {},
		use_data = {}
	}
	self.mp9_crew = {
		usage = "is_smg_light",
		anim_usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.olympic_crew = {
		usage = "is_smg",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.olympic_primary_crew = deep_clone(self.olympic_crew)
	self.m16_crew = {
		usage = "is_rifle_heavy",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.aug_crew = {
		usage = "is_bullpup",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.aug_secondary_crew = deep_clone(self.aug_crew)
	self.ak74_crew = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.ak74_secondary_crew = deep_clone(self.ak74_crew)
	self.ak5_crew = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.p90_crew = {
		usage = "is_smg",
		anim_usage = "is_bullpup",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.amcar_crew = {
		usage = "is_rifle_light",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.mac10_crew = {
		usage = "is_smg",
		anim_usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.akmsu_crew = {
		usage = "is_smg_heavy",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.akmsu_primary_crew = deep_clone(self.akmsu_crew)
	self.akm_crew = {
		usage = "is_rifle_heavy",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.akm_gold_crew = {
		usage = "is_rifle_heavy",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.deagle_crew = {
		usage = "is_pistol_heavy",
		anim_usage = "is_pistol",
		sounds = {},
		use_data = {}
	}
	self.deagle_primary_crew = deep_clone(self.deagle_crew)
	self.serbu_crew = {
		usage = "is_shotgun_pump",
		sounds = {},
		use_data = {}
	}
	self.saiga_crew = {
		usage = "is_shotgun_mag",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.huntsman_crew = {
		usage = "is_shotgun_pump",
		sounds = {},
		use_data = {}
	}
	self.saw_crew = {
		usage = "is_smg",
		sounds = {},
		use_data = {}
	}
	self.saw_secondary_crew = deep_clone(self.saw_crew)
	self.sentry_gun = {
		sounds = {},
		auto = {}
	}
	self.usp_crew = {
		usage = "is_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.g22c_crew = {
		usage = "is_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.judge_crew = {
		usage = "is_shotgun_pump",
		anim_usage = "is_revolver",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m45_crew = {
		usage = "is_smg_heavy",
		anim_usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.s552_crew = {
		usage = "is_rifle_light",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.s552_secondary_crew = deep_clone(self.s552_crew)
	self.ppk_crew = {
		usage = "is_pistol_light",
		anim_usage = "is_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.mp7_crew = {
		usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.scar_crew = {
		usage = "is_rifle_heavy",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.p226_crew = {
		usage = "is_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.hk21_crew = {
		usage = "is_lmg",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m249_crew = {
		usage = "is_lmg",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.rpk_crew = {
		usage = "is_lmg",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m95_crew = {
		usage = "is_sniper_50cal",
		anim_usage = "is_bullpup",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.msr_crew = {
		usage = "is_sniper",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.r93_crew = {
		usage = "is_sniper_slow",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.fal_crew = {
		usage = "is_rifle_heavy",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.ben_crew = {
		usage = "is_shotgun_semi",
		anim_usage = "is_shotgun_pump",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.striker_crew = {
		usage = "is_shotgun_semi",
		anim_usage = "is_shotgun_pump",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.ksg_crew = {
		usage = "is_shotgun_pump",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.gre_m79_crew = {
		usage = "is_shotgun_pump",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.g3_crew = {
		usage = "is_rifle_heavy",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.galil_crew = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.famas_crew = {
		usage = "is_rifle_light",
		anim_usage = "is_bullpup",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.scorpion_crew = {
		usage = "is_smg_light",
		anim_usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.tec9_crew = {
		usage = "is_smg_light",
		anim_usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.uzi_crew = {
		usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.jowi_crew = {
		usage = "akimbo_pistol_light",
		anim_usage = "akimbo_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.x_1911_crew = {
		usage = "akimbo_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.x_b92fs_crew = {
		usage = "akimbo_pistol_light",
		anim_usage = "akimbo_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.x_deagle_crew = {
		usage = "akimbo_pistol_heavy",
		anim_usage = "akimbo_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.g26_crew = {
		usage = "is_pistol_light",
		anim_usage = "is_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.spas12_crew = {
		usage = "is_shotgun_semi",
		anim_usage = "is_shotgun_pump",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.mg42_crew = {
		usage = "is_lmg",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.c96_crew = {
		usage = "is_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.sterling_crew = {
		usage = "is_smg_light",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.mosin_crew = {
		usage = "is_sniper",
		anim_usage = "is_revolver",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m1928_crew = {
		usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.l85a2_crew = {
		usage = "is_bullpup",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.hs2000_crew = {
		usage = "is_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.vhs_crew = {
		usage = "is_bullpup",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m134_crew = {
		usage = "is_lmg",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.rpg7_crew = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.cobray_crew = {
		usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.b682_crew = {
		usage = "is_shotgun_pump",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.x_g22c_crew = {
		usage = "akimbo_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.x_g17_crew = {
		usage = "akimbo_pistol_light",
		anim_usage = "akimbo_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.x_usp_crew = {
		usage = "akimbo_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.flamethrower_mk2_crew = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m32_crew = {
		usage = "is_shotgun_pump",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.aa12_crew = {
		usage = "is_shotgun_mag_aa12",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.peacemaker_crew = {
		usage = "is_revolver",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.winchester1874_crew = {
		usage = "is_sniper_winchester",
		anim_usage = "is_shotgun_pump",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.plainsrider_crew = {
		usage = "bow",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.mateba_crew = {
		usage = "is_revolver",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.asval_crew = {
		usage = "is_rifle_light",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.sub2000_crew = {
		usage = "is_rifle_dmr",
		anim_usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.wa2000_crew = {
		usage = "is_sniper_semi",
		anim_usage = "is_bullpup",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.polymer_crew = {
		usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.hunter_crew = {
		usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.baka_crew = {
		usage = "is_smg_light",
		anim_usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.arblast_crew = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.frankish_crew = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.long_crew = {
		usage = "bow",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.par_crew = {
		usage = "is_lmg",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.sparrow_crew = {
		usage = "is_pistol_heavy",
		anim_usage = "is_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.model70_crew = {
		usage = "is_sniper",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.m37_crew = {
		usage = "is_shotgun_pump",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.china_crew = {
		usage = "is_shotgun_pump",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.sr2_crew = {
		usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.x_sr2_crew = {
		usage = "akimbo_smg",
		anim_usage = "akimbo_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.pl14_crew = {
		usage = "is_pistol_heavy",
		anim_usage = "is_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.x_mp5_crew = {
		usage = "akimbo_smg_light",
		anim_usage = "akimbo_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.x_akmsu_crew = {
		usage = "akimbo_smg_heavy",
		anim_usage = "akimbo_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.tecci_crew = {
		usage = "is_rifle_light",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.hajk_crew = {
		usage = "is_smg_heavy",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.boot_crew = {
		usage = "is_shotgun_pump",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.packrat_crew = {
		usage = "is_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.schakal_crew = {
		usage = "is_smg_heavy",
		anim_usage = "is_smg",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.desertfox_crew = {
		usage = "is_sniper",
		anim_usage = "is_bullpup",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.x_packrat_crew = {
		usage = "akimbo_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.rota_crew = {
		usage = "is_shotgun_mag_semi",
		anim_usage = "is_bullpup",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.arbiter_crew = {
		usage = "is_bullpup",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.contraband_crew = {
		usage = "is_rifle_dmr",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.contraband_m203_crew = {
		usage = "is_shotgun_pump",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.ray_crew = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.tti_crew = {
		usage = "is_sniper_semi_fast",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.siltstone_crew = {
		usage = "is_sniper",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.flint_crew = {
		usage = "is_rifle_heavy",
		anim_usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.coal_crew = {
		usage = "is_smg_heavy",
		anim_usage = "is_bullpup",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.lemming_crew = {
		usage = "is_pistol_heavy",
		anim_usage = "is_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.chinchilla_crew = {
		usage = "is_revolver",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.x_chinchilla_crew = {
		usage = "akimbo_revolver",
		anim_usage = "akimbo_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.breech_crew = {
		usage = "is_pistol_heavy",
		anim_usage = "is_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.ching_crew = {
		usage = "is_rifle_dmr",
		anim_usage = "is_revolver",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.erma_crew = {
		usage = "is_smg_heavy",
		anim_usage = "is_bullpup",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.ecp_crew = {
		usage = "is_rifle",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.shrew_crew = {
		usage = "is_pistol_light",
		anim_usage = "is_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.x_shrew_crew = {
		usage = "akimbo_pistol_light",
		anim_usage = "akimbo_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.basset_crew = {
		usage = "is_shotgun_mag_aa12",
		anim_usage = "is_bullpup",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.x_basset_crew = {
		usage = "akimbo_shotgun_mag",
		anim_usage = "akimbo_pistol",
		sounds = {},
		use_data = {},
		auto = {}
	}
	self.corgi_crew = {
		usage = "is_bullpup",
		sounds = {},
		use_data = {},
		auto = {}
	}
end
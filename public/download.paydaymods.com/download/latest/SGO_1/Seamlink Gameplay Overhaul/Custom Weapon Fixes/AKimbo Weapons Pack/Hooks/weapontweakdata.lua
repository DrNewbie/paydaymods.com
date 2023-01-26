Hooks:PostHook( WeaponTweakData, "init", "AKimboInit", function(self)
	local dlc_data = Global.dlc_manager.all_dlc_data["gage_pack_lmg"]
	if not dlc_data.verified then
		self.x_rpk.CLIP_AMMO_MAX = 0
		self.x_rpk.AMMO_MAX = 0
		self.x_rpk.name_id = "bm_w_norpk"
	end
self.x_akm.sub_category = "assault_rifle"
self.x_akm.stats.reload = 30
self.x_akm.AMMO_MAX = 180
self.x_akm_gold.sub_category = "assault_rifle"
self.x_akm_gold.stats.reload = 30
self.x_akm_gold.AMMO_MAX = 180
self.x_ak74.sub_category = "assault_rifle"
self.x_ak74.stats.reload = 30
self.x_ak74.fire_mode_data.fire_rate = 0.092
self.x_ak74.AMMO_MAX = 180
self.x_rpk.sub_category = "lmg"
self.x_rpk.stats.recoil= 32
self.x_rpk.AMMO_MAX = 300
self.x_rpk.CLIP_AMMO_MAX = 200
self.x_rpk.stats_modifiers = {
	reload = 1,
	value = 8
} 

self.x_s12.sub_category = "shotgun"
self.x_s12.spread = {}
self.x_s12.spread.standing = self.r870.spread.standing
self.x_s12.spread.crouching = self.r870.spread.crouching
self.x_s12.spread.steelsight = self.r870.spread.steelsight
self.x_s12.spread.moving_standing = self.r870.spread.moving_standing
self.x_s12.spread.moving_crouching = self.r870.spread.moving_crouching
self.x_s12.spread.moving_steelsight = self.r870.spread.moving_steelsight
self.x_s12.kick = {}
self.x_s12.kick.standing = self.r870.kick.standing
self.x_s12.kick.crouching = self.saiga.kick.standing
self.x_s12.kick.steelsight = self.r870.kick.steelsight
self.x_s12.crosshair = {}
self.x_s12.crosshair.standing = {}
self.x_s12.crosshair.crouching = {}
self.x_s12.crosshair.steelsight = {}
self.x_s12.crosshair.standing.offset = 0.7
self.x_s12.crosshair.standing.moving_offset = 0.7
self.x_s12.crosshair.standing.kick_offset = 0.8
self.x_s12.crosshair.crouching.offset = 0.65
self.x_s12.crosshair.crouching.moving_offset = 0.65
self.x_s12.crosshair.crouching.kick_offset = 0.75
self.x_s12.crosshair.steelsight.hidden = true
self.x_s12.crosshair.steelsight.offset = 0
self.x_s12.crosshair.steelsight.moving_offset = 0
self.x_s12.crosshair.steelsight.kick_offset = 0
self.x_s12.shake = {}
self.x_s12.shake.fire_multiplier = 2
self.x_s12.shake.fire_steelsight_multiplier = 1.25
self.x_s12.stats.reload = 30
self.x_s12.stats.recoil= 32
self.x_s12.stats.spread = 8
self.x_s12.AMMO_MAX = 56
self.x_s12.CLIP_AMMO_MAX = 14
self.x_s12.damage_near = 2000
self.x_s12.damage_far = 3000
self.x_s12.rays = 12
self.x_s12.FIRE_MODE = "auto"
self.x_s12.CAN_TOGGLE_FIREMODE = false
self.x_s12.has_magazine = true
self.x_s12.use_shotgun_reload = false
self.x_s12.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
self.x_s12.sounds.fire = "saiga_play"
self.x_s12.sounds.dryfire = "shotgun_dryfire"
self.x_s12.sounds.stop_fire = "saiga_stop"
self.x_s12.sounds.fire_single = "saiga_play"
self.x_s12.stats_modifiers = {
	reload = 1,
	value = 5
} 

end)

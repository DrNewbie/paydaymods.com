Hooks:PostHook(WeaponTweakData, "init", "xaa12_WeaponTweakData_Init", function(self)
local dlc_data = Global.dlc_manager.all_dlc_data["bbq"]
	if not dlc_data.verified then
		self.x_aa12.CLIP_AMMO_MAX = 0
		self.x_aa12.AMMO_MAX = 0
		self.x_aa12.fire_rate = 10000
		self.x_aa12.stats.damage = 0
		self.x_aa12.name_id = "bm_w_nobbq"
	end
self.x_aa12.sub_category = "shotgun"
self.x_aa12.AMMO_PICKUP = {10, 15}
self.x_aa12.timers.unequip = 0.8
self.x_aa12.timers.equip = 0.8
self.x_aa12.spread = {}
self.x_aa12.spread.standing = self.r870.spread.standing
self.x_aa12.spread.crouching = self.r870.spread.crouching
self.x_aa12.spread.steelsight = self.r870.spread.steelsight
self.x_aa12.spread.moving_standing = self.r870.spread.moving_standing
self.x_aa12.spread.moving_crouching = self.r870.spread.moving_crouching
self.x_aa12.spread.moving_steelsight = self.r870.spread.moving_steelsight
self.x_aa12.kick = {}
self.x_aa12.kick.standing = self.r870.kick.standing
self.x_aa12.kick.crouching = self.aa12.kick.standing
self.x_aa12.kick.steelsight = self.r870.kick.steelsight
self.x_aa12.crosshair = {}
self.x_aa12.crosshair.standing = {}
self.x_aa12.crosshair.crouching = {}
self.x_aa12.crosshair.steelsight = {}
self.x_aa12.crosshair.standing.offset = 0.7
self.x_aa12.crosshair.standing.moving_offset = 0.7
self.x_aa12.crosshair.standing.kick_offset = 0.8
self.x_aa12.crosshair.crouching.offset = 0.65
self.x_aa12.crosshair.crouching.moving_offset = 0.65
self.x_aa12.crosshair.crouching.kick_offset = 0.75
self.x_aa12.crosshair.steelsight.hidden = true
self.x_aa12.crosshair.steelsight.offset = 0
self.x_aa12.crosshair.steelsight.moving_offset = 0
self.x_aa12.crosshair.steelsight.kick_offset = 0
self.x_aa12.shake = {}
self.x_aa12.shake.fire_multiplier = 2
self.x_aa12.shake.fire_steelsight_multiplier = 1.25
self.x_aa12.stats.reload = 30
self.x_aa12.stats.recoil= 32
self.x_aa12.stats.spread = 7
self.x_aa12.AMMO_MAX = 80
self.x_aa12.damage_near = 2000
self.x_aa12.damage_far = 3000
self.x_aa12.rays = 12
self.x_aa12.FIRE_MODE = "auto"
self.x_aa12.CAN_TOGGLE_FIREMODE = false
self.x_aa12.has_magazine = true
self.x_aa12.use_shotgun_reload = false
self.x_aa12.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
self.x_aa12.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
self.x_aa12.sounds = {}
self.x_aa12.sounds.fire = "aa12_fire"
self.x_aa12.sounds.fire_single = "aa12_fire_single"
self.x_aa12.sounds.fire_auto = "aa12_fire"
self.x_aa12.sounds.dryfire = "shotgun_dryfire"
self.x_aa12.sounds.stop_fire = "aa12_stop"
self.x_aa12.sounds.enter_steelsight = "primary_steel_sight_enter"
self.x_aa12.sounds.leave_steelsight = "primary_steel_sight_exit"
self.x_aa12.stats_modifiers = {
	reload = 1,
	value = 5
} 

end)


Hooks:PostHook( WeaponTweakData, "init", "Akimbog18Init", function(self)
self.x_g18.spread = {}
self.x_g18.spread.standing = self.new_m4.spread.standing
self.x_g18.spread.crouching = self.new_m4.spread.crouching
self.x_g18.spread.steelsight = self.new_m4.spread.steelsight
self.x_g18.spread.moving_standing = self.new_m4.spread.moving_standing
self.x_g18.spread.moving_crouching = self.new_m4.spread.moving_crouching
self.x_g18.spread.moving_steelsight = self.new_m4.spread.moving_steelsight
self.x_g18.kick = {}
	self.x_g18.kick.standing = {
		0,
		0,
		0,
		0
	}
--self.x_g18.kick.crouching = self.glock_18c.kick.standing
--self.x_g18.kick.steelsight = self.glock_18c.kick.standing
self.x_g18.crosshair = {}
self.x_g18.crosshair.standing = {}
self.x_g18.crosshair.crouching = {}
self.x_g18.crosshair.steelsight = {}
--self.x_g18.crosshair.standing.offset = 0.3
self.x_g18.crosshair.standing.moving_offset = 0.5
--self.x_g18.crosshair.standing.kick_offset = 0.6
self.x_g18.crosshair.crouching.offset = 0.2
self.x_g18.crosshair.crouching.moving_offset = 0.5
--self.x_g18.crosshair.crouching.kick_offset = 0.3
self.x_g18.crosshair.steelsight.hidden = true
self.x_g18.crosshair.steelsight.offset = 0.2
self.x_g18.crosshair.steelsight.moving_offset = 0.2
self.x_g18.crosshair.steelsight.kick_offset = 0.3
self.x_g18.shake = {}
self.x_g18.shake.fire_multiplier = 1
self.x_g18.shake.fire_steelsight_multiplier = 1
self.x_g18.sub_category = "pistol"
self.x_g18.sounds = {}
self.x_g18.sounds.fire = "g18c_fire_single"
self.x_g18.sounds.fire_single = "g18c_fire_single"
self.x_g18.sounds.fire_auto = "g18c_fire"
self.x_g18.sounds.stop_fire = "g18c_stop"
self.x_g18.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_fps"
self.x_g18.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
self.x_g18.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
self.x_g18.FIRE_MODE = "auto"
self.x_g18.CAN_TOGGLE_FIREMODE = true
self.x_g18.stats.reload = 50
self.x_g18.AMMO_MAX = 192
self.x_g18.CLIP_AMMO_MAX = 40
self.x_g18.stats.recoil= 32
self.x_g18.stats.spread_moving = 12
self.x_g18.stats.spread= 12
self.x_g18.stats.suppression = 16
self.x_g18.stats.alert_size = 20
--self.x_g18.AMMO_PICKUP = self:_pickup_chance(self.glock_18c.AMMO_MAX, 1)
end )
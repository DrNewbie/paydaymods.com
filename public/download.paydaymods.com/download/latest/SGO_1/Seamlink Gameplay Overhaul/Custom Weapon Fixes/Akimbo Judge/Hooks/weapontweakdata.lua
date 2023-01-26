Hooks:PostHook(WeaponTweakData, "init", "xJudge_WeaponTweakData_Init", function(self)
	self.x_judge.damage_near = 2000
	self.x_judge.damage_far = 3000
	self.x_judge.rays = 8
	self.x_judge.use_shotgun_reload = false
	
	--self.x_judge = {}
	self.x_judge.category = "akimbo"
	self.x_judge.sub_category = "shotgun"
	self.x_judge.damage_melee = damage_melee_default
	self.x_judge.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.x_judge.sounds = {}
	self.x_judge.sounds.fire = "judge_fire"
	self.x_judge.sounds.fire_single = "judge_fire"
	self.x_judge.sounds.enter_steelsight = "pistol_steel_sight_enter"
	self.x_judge.sounds.leave_steelsight = "pistol_steel_sight_exit"
	self.x_judge.sounds.dryfire = "secondary_dryfire"
	self.x_judge.timers = {}
	self.x_judge.timers.reload_not_empty = 2
	self.x_judge.timers.reload_empty = 2.5
	self.x_judge.timers.unequip = 0.5
	self.x_judge.timers.equip = 0.5
	self.x_judge.name_id = "bm_w_x_judge"
	self.x_judge.desc_id = "bm_w_x_judge_desc"
	self.x_judge.description_id = "des_x_judge"
	self.x_judge.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
	self.x_judge.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
	self.x_judge.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.x_judge.use_data = {}
	self.x_judge.use_data.selection_index = 2
	self.x_judge.DAMAGE = 1
	self.x_judge.CLIP_AMMO_MAX = 10
	self.x_judge.NR_CLIPS_MAX = 2
	self.x_judge.AMMO_MAX = self.x_judge.CLIP_AMMO_MAX * self.x_judge.NR_CLIPS_MAX
	--self.x_judge.AMMO_PICKUP = self:_pickup_chance(self.x_judge.AMMO_MAX, 1)
	self.x_judge.FIRE_MODE = "single"
	self.x_judge.fire_mode_data = {}
	self.x_judge.fire_mode_data.fire_rate = 0.12
	self.x_judge.single = {}
	self.x_judge.single.fire_rate = 0.12
	self.x_judge.spread = {}
	self.x_judge.spread.standing = self.judge.spread.standing
	self.x_judge.spread.crouching = self.judge.spread.crouching
	self.x_judge.spread.steelsight = self.judge.spread.steelsight
	self.x_judge.spread.moving_standing = self.judge.spread.moving_standing
	self.x_judge.spread.moving_crouching = self.judge.spread.moving_crouching
	self.x_judge.spread.moving_steelsight = self.judge.spread.moving_steelsight
	self.x_judge.kick = {}
	self.x_judge.kick.standing = {
		1,
		0.9,
		-0.3,
		0.3
	}
	self.x_judge.kick.crouching = self.x_judge.kick.standing
	self.x_judge.kick.steelsight = self.x_judge.kick.standing
	self.x_judge.crosshair = {}
	self.x_judge.crosshair.standing = {}
	self.x_judge.crosshair.crouching = {}
	self.x_judge.crosshair.steelsight = {}
	self.x_judge.crosshair.standing.offset = 0.2
	self.x_judge.crosshair.standing.moving_offset = 0.6
	self.x_judge.crosshair.standing.kick_offset = 0.4
	self.x_judge.crosshair.crouching.offset = 0.1
	self.x_judge.crosshair.crouching.moving_offset = 0.6
	self.x_judge.crosshair.crouching.kick_offset = 0.2
	self.x_judge.crosshair.steelsight.hidden = true
	self.x_judge.crosshair.steelsight.offset = 0.1
	self.x_judge.crosshair.steelsight.moving_offset = 0.1
	self.x_judge.crosshair.steelsight.kick_offset = 0.2
	self.x_judge.shake = {}
	self.x_judge.shake.fire_multiplier = 2
	self.x_judge.shake.fire_steelsight_multiplier = -2
	self.x_judge.animations = {}
	self.x_judge.animations.has_steelsight_stance = true
	self.x_judge.animations.reload_name_id = "x_sr2"
	self.x_judge.animations.equip_id = "equip_x_deagle"
	self.x_judge.animations.recoil_steelsight = true
	self.x_judge.animations.second_gun_versions = {
		reload = "reload",
		reload_not_empty = "reload"
	}
	self.x_judge.panic_suppression_chance = 0.2
	self.x_judge.stats = {
		damage = 155,
		spread = 0,
		recoil = 0,
		spread_moving = 4,
		zoom = 3,
		concealment = 5,
		suppression = 7,
		alert_size = 7,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 1,
		reload = 6
	}
end)

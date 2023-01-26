Hooks:PostHook(WeaponTweakData, "init", "xMech_WeaponTweakData_Init", function(self)
	self.x_mech.upgrade_blocks = {
		weapon = {
			"clip_ammo_increase"
		}
	}
	self.x_mech.category = "akimbo"
	self.x_mech.sub_category = "minigun"
	self.x_mech.has_description = true
	self.x_mech.damage_melee = damage_melee_default
	self.x_mech.damage_melee_effect_mul = damage_melee_effect_multiplier_default
	self.x_mech.sounds = {}
	self.x_mech.sounds.fire = "minigun_fire"
	self.x_mech.sounds.fire_auto = "minigun_fire"
	self.x_mech.sounds.stop_fire = "minigun_stop"
	self.x_mech.sounds.dryfire = "primary_dryfire"
	self.x_mech.sounds.enter_steelsight = "lmg_steelsight_enter"
	self.x_mech.sounds.leave_steelsight = "lmg_steelsight_exit"
	self.x_mech.timers = {}
	self.x_mech.timers.reload_not_empty = 3.5
	self.x_mech.timers.reload_empty = 3.5
	self.x_mech.timers.unequip = 1.5
	self.x_mech.timers.equip = 1.5
	self.x_mech.name_id = "bm_w_x_mech"
	self.x_mech.desc_id = "bm_w_x_mech_desc"
	self.x_mech.description_id = "des_x_mech"
	self.x_mech.muzzleflash = "effects/payday2/particles/weapons/50cal_auto_fps"
	self.x_mech.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper_m95"
	self.x_mech.use_data = {}
	self.x_mech.use_data.selection_index = 2
	self.x_mech.DAMAGE = 1
	self.x_mech.CLIP_AMMO_MAX = 2000
	self.x_mech.NR_CLIPS_MAX = 1
	self.x_mech.AMMO_MAX = self.x_mech.CLIP_AMMO_MAX * self.x_mech.NR_CLIPS_MAX
	self.x_mech.AMMO_PICKUP = {0, 0}
	self.x_mech.FIRE_MODE = "auto"
	self.x_mech.fire_mode_data = {}
	self.x_mech.fire_mode_data.fire_rate = 0.02
	self.x_mech.CAN_TOGGLE_FIREMODE = false
	self.x_mech.auto = {}
	self.x_mech.auto.fire_rate = 0.02
	self.x_mech.spread = {}
	self.x_mech.spread.standing = self.r870.spread.standing
	self.x_mech.spread.crouching = self.r870.spread.crouching
	self.x_mech.spread.steelsight = self.r870.spread.steelsight
	self.x_mech.spread.moving_standing = self.r870.spread.moving_standing
	self.x_mech.spread.moving_crouching = self.r870.spread.moving_crouching
	self.x_mech.spread.moving_steelsight = self.r870.spread.moving_steelsight
	self.x_mech.kick = {}
	self.x_mech.kick.standing = {
		-0.5,
		0.5,
		-0.5,
		0.5
	}
	self.x_mech.kick.crouching = self.x_mech.kick.standing
	self.x_mech.kick.steelsight = self.x_mech.kick.standing
	self.x_mech.crosshair = {}
	self.x_mech.crosshair.standing = {}
	self.x_mech.crosshair.crouching = {}
	self.x_mech.crosshair.steelsight = {}
	self.x_mech.crosshair.standing.offset = 0.16
	self.x_mech.crosshair.standing.moving_offset = 1
	self.x_mech.crosshair.standing.kick_offset = 0.8
	self.x_mech.crosshair.crouching.offset = 0.1
	self.x_mech.crosshair.crouching.moving_offset = 0.6
	self.x_mech.crosshair.crouching.kick_offset = 0.4
	self.x_mech.crosshair.steelsight.hidden = true
	self.x_mech.crosshair.steelsight.offset = 0
	self.x_mech.crosshair.steelsight.moving_offset = 0
	self.x_mech.crosshair.steelsight.kick_offset = 0.14
	self.x_mech.shake = {}
	self.x_mech.shake.fire_multiplier = 0.5
	self.x_mech.shake.fire_steelsight_multiplier = -0.5
	self.x_mech.weapon_hold = "x_akmsu"
	self.x_mech.animations = {}
	self.x_mech.animations.reload_name_id = "x_akmsu"
	self.x_mech.animations.reload_empty = "reload_empty"
	self.x_mech.animations.reload_not_empty = "reload_empty"
	self.x_mech.animations.second_gun_versions = {
		reload = "reload_empty",
		reload_not_empty = "reload_empty"
	}
	self.x_mech.animations.equip_id = "china"
	self.x_mech.animations.recoil_steelsight = true
	--self.x_mech.animations.thq_align_anim = "thq"
	self.x_mech.global_value = "xMech"
	self.x_mech.texture_bundle_folder = "mods"
	self.x_mech.panic_suppression_chance = 9999
	self.x_mech.armor_piercing_add = 1
	self.x_mech.stats = {
		damage = 120,
		spread = 0,
		recoil = 32,
		spread_moving = 0,
		zoom = 1,
		concealment = 0,
		suppression = 0,
		alert_size = 0,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 10,
		reload = 30
	}
	self.x_mech.stats_modifiers = {
		suppression = 10,
		reload = 1,
		value = 10
	}
	--self.stances.x_mech.standard.shoulders.translation = Vector3(-5, 2.057, 1.249)
	--self.stances.x_mech.steelsight.shoulders.translation = Vector3(0.124, 14.669, 1.659)
	--self.stances.x_mech.steelsight.shoulders.rotation = Rotation(0, 0, -0)
	--self.stances.x_mech.crouched.shoulders.translation = Vector3(-1.289, 2.943, -1.251)
	local dlc_data = Global.dlc_manager.all_dlc_data["overkill_pack"]
	if not dlc_data.verified then
		self.x_mech.name_id = "bm_w_x_mech_nodlc"
		self.x_mech.CLIP_AMMO_MAX = 0
		self.x_mech.AMMO_MAX = 0
		self.x_mech.stats_modifiers = {
			damage = 0,
			spread = 999,
			recoil = 999,
			spread_moving = 0,
			zoom = 1,
			concealment = 0,
			suppression = 0,
			alert_size = 0,
			extra_ammo = 0,
			total_ammo_mod = 0,
			value = 0,
			reload = 0
		}
	end
end)

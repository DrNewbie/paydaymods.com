Hooks:PostHook(WeaponTweakData, "init", "AkimboMosconiInit", function(self)
 
    --self.x_huntsman = {}
    self.x_huntsman.damage_melee = damage_melee_default
    self.x_huntsman.damage_melee_effect_mul = damage_melee_effect_multiplier_default
    self.x_huntsman.sounds = {}
    self.x_huntsman.sounds.fire = "huntsman_fire"
    self.x_huntsman.sounds.fire_single = "huntsman_fire"
    self.x_huntsman.sounds.enter_steelsight = "pistol_steel_sight_enter"
    self.x_huntsman.sounds.leave_steelsight = "pistol_steel_sight_exit"
    self.x_huntsman.sounds.dryfire = "secondary_dryfire"
    self.x_huntsman.timers = {}
    self.x_huntsman.timers.reload_not_empty = 2
    self.x_huntsman.timers.reload_empty = 2.5
    self.x_huntsman.timers.unequip = 0.5
    self.x_huntsman.timers.equip = 0.5
    self.x_huntsman.name_id = "bm_w_x_huntsman"
    self.x_huntsman.desc_id = "bm_w_x_huntsman_desc"
    self.x_huntsman.description_id = "des_x_huntsman"
    self.x_huntsman.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
    self.x_huntsman.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
    self.x_huntsman.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
    self.x_huntsman.use_data = {}
    self.x_huntsman.use_data.selection_index = 2
    self.x_huntsman.DAMAGE = 1
    self.x_huntsman.fire_mode_data = {}
    self.x_huntsman.fire_mode_data.fire_rate = 0.12
    self.x_huntsman.single = {}
    self.x_huntsman.single.fire_rate = 0.12
    self.x_huntsman.spread = {}
    self.x_huntsman.spread.standing = self.judge.spread.standing
    self.x_huntsman.spread.crouching = self.judge.spread.crouching
    self.x_huntsman.spread.steelsight = self.judge.spread.steelsight
    self.x_huntsman.spread.moving_standing = self.judge.spread.moving_standing
    self.x_huntsman.spread.moving_crouching = self.judge.spread.moving_crouching
    self.x_huntsman.spread.moving_steelsight = self.judge.spread.moving_steelsight
    self.x_huntsman.kick = {}
    self.x_huntsman.kick.standing = {
        1,
        0.9,
        -0.3,
        0.3
    }
    self.x_huntsman.kick.crouching = self.x_huntsman.kick.standing
    self.x_huntsman.kick.steelsight = self.x_huntsman.kick.standing
    self.x_huntsman.crosshair = {}
    self.x_huntsman.crosshair.standing = {}
    self.x_huntsman.crosshair.crouching = {}
    self.x_huntsman.crosshair.steelsight = {}
    self.x_huntsman.crosshair.standing.offset = 0.2
    self.x_huntsman.crosshair.standing.moving_offset = 0.6
    self.x_huntsman.crosshair.standing.kick_offset = 0.4
    self.x_huntsman.crosshair.crouching.offset = 0.1
    self.x_huntsman.crosshair.crouching.moving_offset = 0.6
    self.x_huntsman.crosshair.crouching.kick_offset = 0.2
    self.x_huntsman.crosshair.steelsight.hidden = true
    self.x_huntsman.crosshair.steelsight.offset = 0.1
    self.x_huntsman.crosshair.steelsight.moving_offset = 0.1
    self.x_huntsman.crosshair.steelsight.kick_offset = 0.2
    self.x_huntsman.shake = {}
    self.x_huntsman.shake.fire_multiplier = 2
    self.x_huntsman.shake.fire_steelsight_multiplier = -2
    self.x_huntsman.animations = {}
    self.x_huntsman.animations.has_steelsight_stance = true
    self.x_huntsman.animations.reload_name_id = "x_mp5"
    self.x_huntsman.animations.equip_id = "equip_x_akmsu"
    self.x_huntsman.animations.recoil_steelsight = true
    self.x_huntsman.animations.second_gun_versions = {
        reload = "reload",
        reload_not_empty = "reload"
    }  
    self.x_huntsman.damage_near = 2000
    self.x_huntsman.damage_far = 3000
    self.x_huntsman.rays = 12
    self.x_huntsman.AMMO_MAX = 24
    self.x_huntsman.CLIP_AMMO_MAX = 4
    self.x_huntsman.AMMO_PICKUP = {10,15}
    self.x_huntsman.FIRE_MODE = "single"
    self.x_huntsman.CAN_TOGGLE_FIREMODE = false
    self.x_huntsman.use_shotgun_reload = false 
    self.x_huntsman.weapon_hold = "x_akmsu"
    self.x_huntsman.category = "akimbo"
    self.x_huntsman.sub_category = "shotgun"
    self.x_huntsman.panic_suppression_chance = 0.2
    self.x_huntsman.stats.spread = 6
    self.x_huntsman.stats.recoil = 10
    self.x_huntsman.stats.spread_moving = 4
    self.x_huntsman.stats.zoom = 3
    self.x_huntsman.stats.suppression = 2
    self.x_huntsman.stats.alert_size = 7
    self.x_huntsman.stats.reload = 30
    self.x_huntsman.stats.value = 4
end)
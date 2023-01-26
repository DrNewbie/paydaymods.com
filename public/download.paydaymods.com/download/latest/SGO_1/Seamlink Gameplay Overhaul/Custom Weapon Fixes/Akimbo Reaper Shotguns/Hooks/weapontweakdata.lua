Hooks:PostHook(WeaponTweakData, "init", "AkimboReaper", function(self)
 
    --self.x_die = {}
    self.x_die.damage_melee = damage_melee_default
    self.x_die.damage_melee_effect_mul = damage_melee_effect_multiplier_default
    self.x_die.sounds = {}
    self.x_die.sounds.fire = "judge_fire"
    self.x_die.sounds.fire_single = "judge_fire"	
    self.x_die.sounds.enter_steelsight = "pistol_steel_sight_enter"
    self.x_die.sounds.leave_steelsight = "pistol_steel_sight_exit"
    self.x_die.sounds.dryfire = "secondary_dryfire"
    self.x_die.timers = {}
    self.x_die.timers.reload_not_empty = 2
    self.x_die.timers.reload_empty = 2.5
    self.x_die.timers.unequip = 0.5
    self.x_die.timers.equip = 0.5
    self.x_die.name_id = "bm_w_x_die"
    self.x_die.desc_id = "bm_w_x_die_desc"
    self.x_die.description_id = "des_x_die"
    self.x_die.muzzleflash = "effects/payday2/particles/weapons/762_auto_fps"
    self.x_die.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
    self.x_die.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
    self.x_die.use_data = {}
    self.x_die.use_data.selection_index = 2
    self.x_die.DAMAGE = 1
    self.x_die.spread = {}
    self.x_die.spread.standing = self.judge.spread.standing
    self.x_die.spread.crouching = self.judge.spread.crouching
    self.x_die.spread.steelsight = self.judge.spread.steelsight
    self.x_die.spread.moving_standing = self.judge.spread.moving_standing
    self.x_die.spread.moving_crouching = self.judge.spread.moving_crouching
    self.x_die.spread.moving_steelsight = self.judge.spread.moving_steelsight
    self.x_die.kick = {}
    self.x_die.kick.standing = {
        1,
        0.9,
        -0.3,
        0.3
    }
    self.x_die.kick.crouching = self.x_die.kick.standing
    self.x_die.kick.steelsight = self.x_die.kick.standing
    self.x_die.crosshair = {}
    self.x_die.crosshair.standing = {}
    self.x_die.crosshair.crouching = {}
    self.x_die.crosshair.steelsight = {}
    self.x_die.crosshair.standing.offset = 0.2
    self.x_die.crosshair.standing.moving_offset = 0.6
    self.x_die.crosshair.standing.kick_offset = 0.4
    self.x_die.crosshair.crouching.offset = 0.1
    self.x_die.crosshair.crouching.moving_offset = 0.6
    self.x_die.crosshair.crouching.kick_offset = 0.2
    self.x_die.crosshair.steelsight.hidden = true
    self.x_die.crosshair.steelsight.offset = 0.1
    self.x_die.crosshair.steelsight.moving_offset = 0.1
    self.x_die.crosshair.steelsight.kick_offset = 0.2
    self.x_die.shake = {}
    self.x_die.shake.fire_multiplier = 2
    self.x_die.shake.fire_steelsight_multiplier = -2
    self.x_die.animations = {}
    self.x_die.animations.has_steelsight_stance = true
    self.x_die.animations.reload_name_id = "x_mp5"
    self.x_die.animations.equip_id = "equip_x_akmsu"
    self.x_die.animations.recoil_steelsight = true
    self.x_die.animations.second_gun_versions = {
        reload = "reload",
        reload_not_empty = "reload"
    }  
    self.x_die.damage_near = 2000
    self.x_die.damage_far = 3000
    self.x_die.rays = 8
    self.x_die.AMMO_MAX = 24
    self.x_die.CLIP_AMMO_MAX = 8
    self.x_die.AMMO_PICKUP =  {10, 15}
    self.x_die.FIRE_MODE = "single"
    self.x_die.CAN_TOGGLE_FIREMODE = false
    self.x_die.use_shotgun_reload = false 
    self.x_die.weapon_hold = "x_akmsu"
    self.x_die.category = "akimbo"
    self.x_die.sub_category = "shotgun"
    self.x_die.panic_suppression_chance = 0.2
    self.x_die.stats.spread = 6
    self.x_die.stats.recoil = 10
    self.x_die.stats.spread_moving = 4
    self.x_die.stats.zoom = 3
    self.x_die.stats.suppression = 2
    self.x_die.stats.alert_size = 7
    self.x_die.stats.reload = 50
    self.x_die.stats.value = 4
end)
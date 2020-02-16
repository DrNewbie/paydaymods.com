function UpgradesTweakData:_init_pd2_values()
	self:_init_value_tables()

	self.values.rep_upgrades = {
		classes = {"rep_upgrade"},
		values = {2}
	}
	self.values.player.body_armor = {
		armor = {
			0,
			3,
			4,
			5,
			7,
			9,
			15
		},
		movement = {
			1.05,
			1.025,
			1,
			0.95,
			0.75,
			0.65,
			0.575
		},
		concealment = {
			30,
			26,
			23,
			21,
			18,
			12,
			1
		},
		dodge = {
			0.05,
			-0.05,
			-0.1,
			-0.15,
			-0.2,
			-0.25,
			-0.55
		},
		damage_shake = {
			1,
			0.96,
			0.92,
			0.85,
			0.8,
			0.7,
			0.5
		},
		stamina = {
			1.025,
			1,
			0.95,
			0.9,
			0.85,
			0.8,
			0.7
		},
		skill_ammo_mul = {
			1,
			1.02,
			1.04,
			1.06,
			1.8,
			1.1,
			1.12
		}
	}
	self.values.player.ballistic_vest_concealment = {4}
	self.values.player.body_armor.skill_max_health_store = {
		14,
		13.5,
		12.5,
		12,
		10.5,
		9.5,
		4
	}
	self.values.player.body_armor.skill_kill_change_regenerate_speed = {
		14,
		13.5,
		12.5,
		12,
		10.5,
		9.5,
		4
	}
	self.values.player.special_enemy_highlight = {true}
	self.values.player.hostage_trade = {true}
	self.values.player.sec_camera_highlight = {true}
	self.values.player.sec_camera_highlight_mask_off = {true}
	self.values.player.special_enemy_highlight_mask_off = {true}
	self.values.player.super_syndrome = {1}
	self.values.player.stability_increase_bonus_1 = {2}
	self.values.player.stability_increase_bonus_2 = {4}
	self.values.player.not_moving_accuracy_increase = {4}
	self.values.player.hip_fire_accuracy_inc = {3}
	self.values.player.melee_damage_stacking = {{
		max_multiplier = 16,
		melee_multiplier = 1
	}}
	self.ammo_bag_base = 4
	self.ecm_jammer_base_battery_life = 20
	self.ecm_jammer_base_low_battery_life = 8
	self.ecm_jammer_base_range = 2500
	self.ecm_feedback_min_duration = 15
	self.ecm_feedback_max_duration = 20
	self.ecm_feedback_interval = 1.5
	self.sentry_gun_base_ammo = 100
	self.sentry_gun_base_armor = 10
	self.doctor_bag_base = 2
	self.first_aid_kit = {revived_damage_reduction = {
		{
			0.7,
			5
		},
		{
			0.2,
			5
		}
	}}
	self.grenade_crate_base = 3
	self.max_grenade_amount = 3
	self.bodybag_crate_base = 3
	self.cop_hurt_alert_radius_whisper = 600
	self.cop_hurt_alert_radius = 400
	self.drill_alert_radius = 2500
	self.taser_malfunction_min = 5
	self.taser_malfunction_max = 30
	self.counter_taser_damage = 0.5
	self.morale_boost_speed_bonus = 1.2
	self.morale_boost_suppression_resistance = 1
	self.morale_boost_time = 10
	self.morale_boost_reload_speed_bonus = 1.2
	self.morale_boost_base_cooldown = 3.5
	self.max_weapon_dmg_mul_stacks = 4
	self.max_melee_weapon_dmg_mul_stacks = 1
	self.hostage_near_player_radius = 1000
	self.hostage_near_player_check_t = 0.5
	self.hostage_near_player_multiplier = 1.25
	self.hostage_max_num = {
		damage_dampener = 1,
		health_regen = 1,
		stamina = 4,
		health = 4
	}
	self.on_headshot_dealt_cooldown = 2
	self.on_killshot_cooldown = 1
	self.on_damage_dealt_cooldown = 2
	self.close_combat_distance = 1800
	self.killshot_close_panic_range = 900
	self.berserker_movement_speed_multiplier = 0.4
	self.weapon_cost_multiplier = {akimbo = 1.4}
	self.weapon_movement_penalty = {
		lmg = 1,
		minigun = 1
	}
	self.explosive_bullet = {
		curve_pow = 0.5,
		player_dmg_mul = 0.1,
		range = 200
	}
	self.explosive_bullet.feedback_range = self.explosive_bullet.range
	self.explosive_bullet.camera_shake_max_mul = 2
	self.values.player.crime_net_deal = {
		0.9,
		0.8
	}
	self.values.player.corpse_alarm_pager_bluff = {true}
	self.values.player.marked_enemy_extra_damage = {true}
	self.values.player.marked_enemy_damage_mul = 1.15
	self.values.player.marked_distance_mul = {20}
	self.values.cable_tie.interact_speed_multiplier = {0.25}
	self.values.cable_tie.quantity_1 = {4}
	self.values.cable_tie.can_cable_tie_doors = {true}
	self.values.temporary.combat_medic_damage_multiplier = {
		{
			1.25,
			10
		},
		{
			1.25,
			15
		}
	}
	self.values.player.revive_health_boost = {1}
	self.revive_health_multiplier = {1.3}
	self.values.temporary.revived_damage_resist = {{
		0.7,
		10
	}}
	self.values.temporary.increased_movement_speed = {{
		1.3,
		10
	}}
	self.values.temporary.swap_weapon_faster = {{
		2,
		10
	}}
	self.values.temporary.reload_weapon_faster = {{
		2,
		10
	}}
	self.values.player.melee_kill_increase_reload_speed = {{
		1.5,
		10
	}}
	self.values.player.civ_harmless_bullets = {true}
	self.values.player.civ_harmless_melee = {true}
	self.values.player.civ_calming_alerts = {true}
	self.values.player.civ_intimidation_mul = {1.5}
	self.values.team.pistol.recoil_multiplier = {0.75}
	self.values.team.akimbo.recoil_multiplier = self.values.team.pistol.recoil_multiplier
	self.values.team.weapon.recoil_multiplier = {0.5}
	self.values.team.pistol.suppression_recoil_multiplier = self.values.team.pistol.recoil_multiplier
	self.values.team.akimbo.suppression_recoil_multiplier = self.values.team.akimbo.recoil_multiplier
	self.values.team.weapon.suppression_recoil_multiplier = self.values.team.weapon.recoil_multiplier
	self.values.weapon.enter_steelsight_speed_multiplier = {2}
	self.values.player.assets_cost_multiplier = {0.5}
	self.values.player.additional_assets = {true}
	self.values.player.stamina_multiplier = {2}
	self.values.team.stamina.multiplier = {1.5}
	self.values.team.damage = {
		hostage_absorption = {0.05},
		hostage_absorption_limit = 8
	}
	self.values.player.intimidate_enemies = {true}
	self.values.player.intimidate_range_mul = {1.5}
	self.values.player.intimidate_aura = {1000}
	self.values.player.civilian_reviver = {true}
	self.values.player.civilian_gives_ammo = {true}
	self.values.player.buy_cost_multiplier = {
		0.9,
		0.7
	}
	self.values.player.sell_cost_multiplier = {1.25}
	self.values.player.armor_carry_bonus = {1.01}
	self.values.doctor_bag.quantity = {1}
	self.values.doctor_bag.amount_increase = {2}
	self.values.player.convert_enemies = {true}
	self.values.player.convert_enemies_max_minions = {
		1,
		2
	}
	self.values.player.convert_enemies_health_multiplier = {0.45}
	self.values.player.convert_enemies_damage_multiplier = {1.35}
	self.values.player.xp_multiplier = {1.15}
	self.values.team.xp.multiplier = {1.3}
	self.values.pistol.reload_speed_multiplier = {1.5}
	self.values.akimbo.reload_speed_multiplier = self.values.pistol.reload_speed_multiplier
	self.values.pistol.damage_addend = {
		0.5,
		1.5
	}
	self.values.pistol.damage_multiplier = {1.5}
	self.values.pistol.magazine_capacity_inc = {5}
	self.values.pistol.stacked_accuracy_bonus = {{
		max_stacks = 4,
		accuracy_bonus = 0.9,
		max_time = 10
	}}
	self.values.pistol.stacking_hit_damage_multiplier = {
		{
			max_stacks = 4,
			max_time = 2,
			damage_bonus = 1.2
		},
		{
			max_stacks = 4,
			max_time = 10,
			damage_bonus = 1.2
		}
	}
	self.values.assault_rifle.reload_speed_multiplier = {1.15}
	self.values.assault_rifle.move_spread_multiplier = {0.5}
	self.values.player.messiah_revive_from_bleed_out = {1}
	self.values.player.recharge_messiah = {1}
	self.values.pistol.spread_multiplier = {0.9}
	self.values.akimbo.spread_multiplier = self.values.pistol.spread_multiplier
	self.values.pistol.swap_speed_multiplier = {1.5}
	self.values.pistol.fire_rate_multiplier = {1.5}
	self.values.player.revive_interaction_speed_multiplier = {0.5}
	self.values.cooldown.long_dis_revive = {{
		1,
		20
	}}
	self.values.doctor_bag.interaction_speed_multiplier = {0.8}
	self.values.team.stamina.passive_multiplier = {
		1.5,
		1.3
	}
	self.values.player.passive_intimidate_range_mul = {1.25}
	self.values.team.health.passive_multiplier = {1.1}
	self.values.player.passive_convert_enemies_damage_multiplier = {1.15}
	self.values.player.convert_enemies_interaction_speed_multiplier = {0.35}
	self.values.player.empowered_intimidation_mul = {3}
	self.values.player.passive_assets_cost_multiplier = {0.5}
	self.values.player.escape_taser = {2}
	self.values.player.suppression_multiplier = {1.75}
	self.values.carry.movement_speed_multiplier = {1.5}
	self.values.carry.throw_distance_multiplier = {1.5}
	self.values.player.no_ammo_cost = {
		true,
		true
	}
	self.values.player.non_special_melee_multiplier = {2}
	self.values.player.melee_damage_multiplier = {2}
	self.values.player.primary_weapon_when_downed = {true}
	self.values.player.armor_regen_timer_multiplier = {0.85}
	self.values.temporary.dmg_multiplier_outnumbered = {{
		1.15,
		7
	}}
	self.values.temporary.dmg_dampener_outnumbered = {{
		0.9,
		7
	}}
	self.values.player.extra_ammo_multiplier = {1.25}
	self.values.player.pick_up_ammo_multiplier = {
		1.35,
		1.75
	}
	self.values.player.regain_throwable_from_ammo = {{
		chance = 0.05,
		chance_inc = 0.01
	}}
	self.values.player.damage_shake_multiplier = {0.5}
	self.values.player.bleed_out_health_multiplier = {1.5}
	self.values.shotgun.recoil_multiplier = {0.75}
	self.values.shotgun.damage_multiplier = {
		1.05,
		1.15
	}
	self.values.ammo_bag.quantity = {1}
	self.values.ammo_bag.ammo_increase = {2}
	self.values.shotgun.reload_speed_multiplier = {
		1.15,
		1.5
	}
	self.values.shotgun.enter_steelsight_speed_multiplier = {2.25}
	self.values.saw.extra_ammo_multiplier = {1.5}
	self.values.player.flashbang_multiplier = {
		0.25,
		0.25
	}
	self.values.shotgun.hip_fire_spread_multiplier = {0.8}
	self.values.pistol.hip_fire_spread_multiplier = {0.8}
	self.values.assault_rifle.hip_fire_spread_multiplier = {0.8}
	self.values.smg.hip_fire_spread_multiplier = {0.8}
	self.values.smg.zoom_increase = {2}
	self.values.saw.hip_fire_spread_multiplier = {0.8}
	self.values.player.saw_speed_multiplier = {
		0.95,
		0.65
	}
	self.values.saw.lock_damage_multiplier = {
		1.2,
		1.4
	}
	self.values.saw.enemy_slicer = {7}
	self.values.player.melee_damage_health_ratio_multiplier = {2.5}
	self.values.player.damage_health_ratio_multiplier = {1}
	self.player_damage_health_ratio_threshold = 0.5
	self.values.player.shield_knock = {true}
	self.values.temporary.overkill_damage_multiplier = {{
		1.75,
		20
	}}
	self.values.player.overkill_all_weapons = {true}
	self.values.temporary.unseen_strike = {
		{
			1.35,
			6
		},
		{
			1.35,
			18
		}
	}
	self.values.player.passive_suppression_multiplier = {
		1.1,
		1.2
	}
	self.values.player.passive_health_multiplier = {
		1.1,
		1.2,
		1.4,
		1.8
	}
	self.values.weapon.passive_damage_multiplier = {1.05}
	self.values.weapon.knock_down = {
		0.05,
		0.2
	}
	self.values.weapon.automatic_head_shot_add = {
		0.3,
		0.9
	}
	self.values.assault_rifle.enter_steelsight_speed_multiplier = {2}
	self.values.assault_rifle.zoom_increase = {2}
	self.values.player.crafting_weapon_multiplier = {0.9}
	self.values.player.crafting_mask_multiplier = {0.9}
	self.values.trip_mine.can_switch_on_off = {true}
	self.values.player.drill_speed_multiplier = {
		0.85,
		0.7
	}
	self.values.player.drill_melee_hit_restart_chance = {true}
	self.values.player.drill_restart_chance = {true}
	self.values.player.trip_mine_deploy_time_multiplier = {
		0.8,
		0.6
	}
	self.values.trip_mine.sensor_toggle = {true}
	self.values.trip_mine.fire_trap = {
		{
			0,
			1
		},
		{
			10,
			1.5
		}
	}
	self.values.player.drill_fix_interaction_speed_multiplier = {0.75}
	self.values.player.drill_autorepair_1 = {0.1}
	self.values.player.drill_autorepair_2 = {0.2}
	self.values.player.sentry_gun_deploy_time_multiplier = {0.5}
	self.values.sentry_gun.armor_multiplier = {2.5}
	self.values.weapon.single_spread_multiplier = {0.8}
	self.values.assault_rifle.recoil_multiplier = {0.75}
	self.sharpshooter_categories = {
		"assault_rifle",
		"smg",
		"snp"
	}
	self.values.player.taser_malfunction = {{
		interval = 1,
		chance_to_trigger = 0.3
	}}
	self.values.player.taser_self_shock = {true}
	self.values.sentry_gun.spread_multiplier = {2}
	self.values.sentry_gun.rot_speed_multiplier = {2}
	self.values.player.interacting_damage_multiplier = {0.5}
	self.values.player.steelsight_when_downed = {true}
	self.values.player.drill_alert_rad = {900}
	self.values.player.silent_drill = {true}
	self.values.sentry_gun.extra_ammo_multiplier = {2}
	self.values.sentry_gun.shield = {true}
	self.values.trip_mine.explosion_size_multiplier_1 = {1.3}
	self.values.trip_mine.explosion_size_multiplier_2 = {1.7}
	self.values.player.trip_mine_shaped_charge = {true}
	self.values.sentry_gun.quantity = {
		1,
		3
	}
	self.values.sentry_gun.damage_multiplier = {2.5}
	self.values.weapon.clip_ammo_increase = {
		5,
		15
	}
	self.values.player.armor_multiplier = {1.3}
	self.values.team.armor.regen_time_multiplier = {0.75}
	self.values.player.passive_crafting_weapon_multiplier = {
		0.99,
		0.96,
		0.91
	}
	self.values.player.passive_crafting_mask_multiplier = {
		0.99,
		0.96,
		0.91
	}
	self.values.weapon.passive_recoil_multiplier = {
		0.95,
		0.9
	}
	self.values.weapon.passive_headshot_damage_multiplier = {1.25}
	self.values.player.passive_armor_multiplier = {
		1.1,
		1.25
	}
	self.values.team.armor.passive_regen_time_multiplier = {0.9}
	self.values.player.small_loot_multiplier = {1.3}
	self.values.player.stamina_regen_timer_multiplier = {0.75}
	self.values.player.stamina_regen_multiplier = {1.25}
	self.values.player.run_dodge_chance = {0.1}
	self.values.player.run_speed_multiplier = {1.25}
	self.values.player.fall_damage_multiplier = {0.25}
	self.values.player.fall_health_damage_multiplier = {0}
	self.values.player.respawn_time_multiplier = {0.5}
	self.values.weapon.special_damage_taken_multiplier = {1.05}
	self.values.player.buy_bodybags_asset = {true}
	self.values.player.corpse_dispose = {true}
	self.values.player.corpse_dispose_amount = {
		1,
		2
	}
	self.values.carry.interact_speed_multiplier = {
		0.75,
		0.25
	}
	self.values.player.suspicion_multiplier = {0.75}
	self.values.player.camouflage_bonus = {
		0.85,
		0.65
	}
	self.values.temporary.damage_speed_multiplier = {{
		1.3,
		5
	}}
	self.values.player.team_damage_speed_multiplier_send = {true}
	self.values.temporary.team_damage_speed_multiplier_received = {{
		1.3,
		5
	}}
	self.values.player.walk_speed_multiplier = {1.25}
	self.values.player.crouch_speed_multiplier = {
		1.1,
		1.2
	}
	self.values.player.silent_kill = {25}
	self.values.player.melee_knockdown_mul = {1.5}
	self.values.player.damage_dampener = {0.95}
	self.values.player.melee_damage_dampener = {0.5}
	self.values.smg.reload_speed_multiplier = {1.15}
	self.values.smg.fire_rate_multiplier = {1.2}
	self.values.player.additional_lives = {
		1,
		3
	}
	self.values.player.cheat_death_chance = {
		0.15,
		0.45
	}
	self.values.ecm_jammer.can_activate_feedback = {true}
	self.values.ecm_jammer.feedback_duration_boost = {1.25}
	self.values.ecm_jammer.interaction_speed_multiplier = {0}
	self.values.weapon.silencer_damage_multiplier = {
		1.15,
		1.3
	}
	self.values.weapon.armor_piercing_chance_silencer = {
		0.2,
		0.4
	}
	self.values.ecm_jammer.duration_multiplier = {true}
	self.values.ecm_jammer.duration_multiplier_2 = {true}
	self.values.ecm_jammer.can_open_sec_doors = {true}
	self.values.player.pick_lock_easy = {true}
	self.values.player.pick_lock_easy_speed_multiplier = {0.5}
	self.values.player.pick_lock_hard = {true}
	self.values.weapon.silencer_recoil_multiplier = {0.5}
	self.values.weapon.silencer_spread_multiplier = {0.5}
	self.values.weapon.silencer_enter_steelsight_speed_multiplier = {2}
	self.values.player.loot_drop_multiplier = {
		1.5,
		3
	}
	self.values.ecm_jammer.quantity = {
		1,
		3
	}
	self.values.ecm_jammer.feedback_duration_boost_2 = {1.25}
	self.values.ecm_jammer.affects_pagers = {true}
	self.values.player.can_strafe_run = {true}
	self.values.player.can_free_run = {true}
	self.values.ecm_jammer.affects_cameras = {true}
	self.values.player.passive_dodge_chance = {
		0.15,
		0.3,
		0.45
	}
	self.values.weapon.passive_swap_speed_multiplier = {
		1.8,
		2
	}
	self.values.player.passive_concealment_modifier = {1}
	self.values.player.passive_armor_movement_penalty_multiplier = {0.75}
	self.values.player.passive_loot_drop_multiplier = {1.1}
	self.values.player.automatic_mag_increase = {15}
	self.values.weapon.armor_piercing_chance = {0.25}
	self.values.lmg.recoil_multiplier = {0.75}
	self.values.lmg.enter_steelsight_speed_multiplier = {2}
	self.values.lmg.reload_speed_multiplier = {1.25}
	self.values.lmg.move_spread_multiplier = {0.5}
	self.values.lmg.hip_fire_spread_multiplier = {0.8}
	self.values.lmg.hip_fire_damage_multiplier = {1.2}
	self.values.lmg.zoom_increase = {2}
	self.values.snp.recoil_multiplier = {0.75}
	self.values.snp.enter_steelsight_speed_multiplier = {2}
	self.values.snp.reload_speed_multiplier = {1.15}
	self.values.snp.move_spread_multiplier = {0.5}
	self.values.snp.hip_fire_spread_multiplier = {0.8}
	self.values.snp.hip_fire_damage_multiplier = {1.2}
	self.values.snp.zoom_increase = {2}
	self.values.player.silencer_concealment_increase = {1}
	self.values.player.silencer_concealment_penalty_decrease = {2}
	self.values.player.run_and_shoot = {true}
	self.values.player.run_and_reload = {true}
	self.values.player.morale_boost = {true}
	self.values.player.electrocution_resistance_multiplier = {0.25}
	self.values.player.single_shot_accuracy_inc = {0.8}
	self.values.player.deploy_interact_faster = {0.5}
	self.values.player.second_deployable = {true}
	self.values.player.armor_depleted_stagger_shot = {
		0,
		6
	}
	self.values.player.revived_health_regain = {1.4}
	self.values.player.head_shot_ammo_return = {
		{
			headshots = 3,
			ammo = 1,
			time = 6
		},
		{
			headshots = 2,
			ammo = 1,
			time = 6
		}
	}
	self.values.player.concealment_modifier = {
		5,
		10,
		15
	}
	self.values.sentry_gun.armor_multiplier2 = {1.25}
	self.values.sentry_gun.cost_reduction = {
		2,
		3
	}
	self.values.sentry_gun.less_noisy = {true}
	self.values.sentry_gun.ap_bullets = {true}
	self.values.sentry_gun.fire_rate_reduction = {4}
	self.values.saw.armor_piercing_chance = {1}
	self.values.saw.swap_speed_multiplier = {1.8}
	self.values.saw.reload_speed_multiplier = {1.5}
	self.values.saw.ignore_shields = {true}
	self.values.saw.panic_when_kill = {{
		chance = 0.5,
		area = 1000,
		amount = 200
	}}
	self.values.team.health.hostage_multiplier = {1.06}
	self.values.team.stamina.hostage_multiplier = {1.12}
	self.values.player.minion_master_speed_multiplier = {1.1}
	self.values.player.minion_master_health_multiplier = {1.3}
	self.values.player.mark_enemy_time_multiplier = {2}
	self.values.player.critical_hit_chance = {
		0.25,
		0.5
	}
	self.values.player.melee_kill_snatch_pager_chance = {0.25}
	self.values.player.detection_risk_add_crit_chance = {
		{
			0.03,
			3,
			"below",
			35,
			0.3
		},
		{
			0.03,
			1,
			"below",
			35,
			0.3
		}
	}
	self.values.player.detection_risk_add_dodge_chance = {
		{
			0.01,
			3,
			"below",
			35,
			0.1
		},
		{
			0.01,
			1,
			"below",
			35,
			0.1
		}
	}
	self.values.player.detection_risk_damage_multiplier = {{
		0.05,
		7,
		"above",
		40
	}}
	self.values.player.unseen_increased_crit_chance = {
		{
			min_time = 4,
			max_duration = 6,
			crit_chance = 1.35
		},
		{
			min_time = 4,
			max_duration = 18,
			crit_chance = 1.35
		}
	}
	self.values.shotgun.steelsight_accuracy_inc = {0.6}
	self.values.shotgun.steelsight_range_inc = {1.5}
	self.values.shotgun.hip_run_and_shoot = {true}
	self.values.shotgun.hip_rate_of_fire = {1.35}
	self.values.shotgun.magazine_capacity_inc = {15}
	self.values.player.overkill_health_to_damage_multiplier = {0.66}
	self.values.player.tased_recover_multiplier = {0.5}
	self.values.player.secured_bags_speed_multiplier = {1.02}
	self.values.temporary.no_ammo_cost_buff = {{
		true,
		60
	}}
	self.values.player.secured_bags_money_multiplier = {1.02}
	self.values.pistol.stacking_hit_expire_t = {
		6,
		20
	}
	self.values.pistol.zoom_increase = {2}
	self.values.carry.movement_penalty_nullifier = {true}
	self.values.temporary.berserker_damage_multiplier = {
		{
			1,
			3
		},
		{
			1,
			9
		}
	}
	self.values.player.berserker_no_ammo_cost = {true}
	self.values.player.hostage_health_regen_addend = {
		0.015,
		0.045
	}
	self.values.player.carry_sentry_and_trip = {true}
	self.values.player.tier_armor_multiplier = {
		1.05,
		1.1,
		1.2,
		1.3,
		1.15,
		1.35
	}
	self.values.player.double_drop = {6}
	self.values.player.increased_pickup_area = {1.5}
	self.values.player.weapon_accuracy_increase = {2}
	self.values.player.weapon_movement_stability = {0.8}
	self.values.shotgun.hip_fire_damage_multiplier = {1.2}
	self.values.pistol.hip_fire_damage_multiplier = {1.2}
	self.values.assault_rifle.hip_fire_damage_multiplier = {1.2}
	self.values.smg.hip_fire_damage_multiplier = {1.2}
	self.values.saw.hip_fire_damage_multiplier = {1.2}
	self.values.shotgun.consume_no_ammo_chance = {
		0.01,
		0.03
	}
	self.values.player.add_armor_stat_skill_ammo_mul = {true}
	self.values.saw.melee_knockdown_mul = {1.75}
	self.values.shotgun.melee_knockdown_mul = {1.75}
	self.values.player.assets_cost_multiplier_b = {0.5}
	self.values.player.premium_contract_cost_multiplier = {0.5}
	self.values.player.morale_boost_cooldown_multiplier = {0.5}
	self.values.player.level_interaction_timer_multiplier = {{
		0.01,
		10
	}}
	self.values.team.player.clients_buy_assets = {true}
	self.values.player.steelsight_normal_movement_speed = {true}
	self.values.team.weapon.move_spread_multiplier = {1.1}
	self.values.team.player.civ_intimidation_mul = {1.15}
	self.values.sentry_gun.can_revive = {true}
	self.values.sentry_gun.can_reload = {true}
	self.sentry_gun_reload_ratio = 1
	self.values.weapon.modded_damage_multiplier = {1.1}
	self.values.weapon.modded_spread_multiplier = {0.9}
	self.values.weapon.modded_recoil_multiplier = {0.9}
	self.values.sentry_gun.armor_piercing_chance = {0.15}
	self.values.sentry_gun.armor_piercing_chance_2 = {0.05}
	self.values.weapon.armor_piercing_chance_2 = {0.05}
	self.values.player.resist_firing_tased = {true}
	self.values.player.crouch_dodge_chance = {
		0.05,
		0.15
	}
	self.values.player.climb_speed_multiplier = {
		1.2,
		1.75
	}
	self.values.player.ap_bullets = {true}
	self.values.team.xp.stealth_multiplier = {1.5}
	self.values.team.cash.stealth_money_multiplier = {1.5}
	self.values.team.cash.stealth_bags_multiplier = {1.5}
	self.values.player.tape_loop_duration = {
		10,
		20
	}
	self.values.player.tape_loop_interact_distance_mul = {1.4}
	self.values.player.buy_spotter_asset = {true}
	self.values.player.close_to_hostage_boost = {true}
	self.values.trip_mine.sensor_highlight = {true}
	self.values.player.on_zipline_dodge_chance = {0.15}
	self.values.player.movement_speed_multiplier = {1.1}
	self.values.player.level_2_armor_addend = {2}
	self.values.player.level_3_armor_addend = {2}
	self.values.player.level_4_armor_addend = {2}
	self.values.player.level_2_dodge_addend = {
		0.05,
		0.15,
		0.25
	}
	self.values.player.level_3_dodge_addend = {
		0.05,
		0.15,
		0.25
	}
	self.values.player.level_4_dodge_addend = {
		0.05,
		0.15,
		0.25
	}
	self.values.player.damage_shake_addend = {1}
	self.values.player.melee_concealment_modifier = {2}
	self.values.player.melee_sharp_damage_multiplier = {3}
	self.values.team.armor.multiplier = {1.05}
	self.values.player.armor_regen_timer_multiplier_passive = {0.9}
	self.values.player.armor_regen_timer_multiplier_tier = {0.9}
	self.values.player.armor_regen_time_mul = {0.85}
	self.values.player.camouflage_multiplier = {0.85}
	self.values.player.uncover_multiplier = {1.15}
	self.values.player.passive_xp_multiplier = {1.45}
	self.values.player.pick_up_ammo_multiplier_2 = {1.3}
	self.values.team.damage_dampener.team_damage_reduction = {0.92}
	self.values.team.damage_dampener.hostage_multiplier = {0.92}
	self.values.player.level_2_armor_multiplier = {
		1.2,
		1.4,
		1.65
	}
	self.values.player.level_3_armor_multiplier = {
		1.2,
		1.4,
		1.65
	}
	self.values.player.level_4_armor_multiplier = {
		1.2,
		1.4,
		1.65
	}
	self.values.player.passive_health_regen = {0.03}
	self.values.player.healing_reduction = {
		0.25,
		1
	}
	self.values.player.health_damage_reduction = {
		0.9,
		0.75
	}
	self.values.player.max_health_reduction = {0.3}
	self.values.cable_tie.quantity_2 = {4}
	self.ecm_feedback_retrigger_interval = 240
	self.ecm_feedback_retrigger_chance = 1
	self.values.player.revive_damage_reduction_level = {
		1,
		2
	}
	self.values.ecm_jammer.can_retrigger = {true}
	self.values.player.panic_suppression = {true}
	self.values.akimbo.extra_ammo_multiplier = {
		1.25,
		1.5,
		2,
		2.5
	}
	self.values.akimbo.damage_multiplier = {
		1.5,
		3
	}
	self.values.akimbo.recoil_multiplier = {
		2.5,
		2,
		1.5
	}
	self.values.akimbo.passive_recoil_multiplier = {
		2.5,
		2
	}
	self.values.akimbo.clip_ammo_increase = self.values.weapon.clip_ammo_increase
	self.values.player.perk_armor_regen_timer_multiplier = {
		0.95,
		0.85,
		0.75,
		0.65,
		0.55
	}
	self.values.player.perk_armor_loss_multiplier = {
		0.95,
		0.9,
		0.85,
		0.8
	}
	self.values.player.headshot_regen_armor_bonus = {
		0.5,
		2.5
	}
	self.values.bodybags_bag.quantity = {1}
	self.values.first_aid_kit.quantity = {
		7,
		10
	}
	self.values.first_aid_kit.deploy_time_multiplier = {0.5}
	self.values.first_aid_kit.damage_reduction_upgrade = {true}
	self.values.first_aid_kit.downs_restore_chance = {0.1}
	self.values.first_aid_kit.first_aid_kit_auto_recovery = {500}
	self.values.temporary.first_aid_damage_reduction = {{
		0.9,
		120
	}}
	self.values.player.extra_corpse_dispose_amount = {1}
	self.values.player.standstill_omniscience = {true}
	self.values.player.mask_off_pickup = {true}
	self.values.player.cleaner_cost_multiplier = {0.25}
	self.values.player.counter_strike_melee = {true}
	self.values.player.counter_strike_spooc = {true}
	self.values.temporary.passive_revive_damage_reduction = {
		{
			0.7,
			5
		},
		{
			0.2,
			5
		}
	}
	self.values.temporary.revive_damage_reduction = {{
		0.7,
		5
	}}
	self.values.player.revive_damage_reduction = {0.7}
	self.values.player.passive_convert_enemies_health_multiplier = {
		0.55,
		0.01
	}
	self.values.player.automatic_faster_reload = {{
		min_reload_increase = 1.4,
		penalty = 0.98,
		target_enemies = 2,
		min_bullets = 20,
		max_reload_increase = 2
	}}
	self.values.player.run_and_shoot = {true}
	self.values.player.armor_regen_timer_stand_still_multiplier = {0.8}
	self.values.player.tier_dodge_chance = {
		0.2,
		0.25,
		0.3
	}
	self.values.player.stand_still_crouch_camouflage_bonus = {
		0.9,
		0.85,
		0.8
	}
	self.values.player.corpse_dispose_speed_multiplier = {0.8}
	self.values.player.pick_lock_speed_multiplier = {0.8}
	self.values.player.alarm_pager_speed_multiplier = {0.9}
	self.values.temporary.melee_life_leech = {{
		0.2,
		10
	}}
	self.values.temporary.dmg_dampener_outnumbered_strong = {{
		0.88,
		7
	}}
	self.values.temporary.dmg_dampener_close_contact = {
		{
			0.92,
			7
		},
		{
			0.84,
			7
		},
		{
			0.76,
			7
		}
	}
	self.values.melee.stacking_hit_damage_multiplier = {
		10,
		10
	}
	self.values.melee.stacking_hit_expire_t = {7}
	self.values.player.melee_kill_life_leech = {0.1}
	self.values.player.killshot_regen_armor_bonus = {3}
	self.values.player.killshot_close_regen_armor_bonus = {3}
	self.values.player.killshot_close_panic_chance = {0.75}
	self.loose_ammo_restore_health_values = {
		{
			0,
			4
		},
		{
			4,
			8
		},
		{
			8,
			12
		},
		multiplier = 0.2,
		cd = 3,
		base = 8
	}
	self.values.player.marked_inc_dmg_distance = {{
		1000,
		1.5
	}}
	self.loose_ammo_give_team_ratio = 0.5
	self.loose_ammo_give_team_health_ratio = 0.5
	self.values.temporary.loose_ammo_restore_health = {}

	for i, data in ipairs(self.loose_ammo_restore_health_values) do
		local base = self.loose_ammo_restore_health_values.base

		table.insert(self.values.temporary.loose_ammo_restore_health, {
			{
				base + data[1],
				base + data[2]
			},
			self.loose_ammo_restore_health_values.cd
		})
	end

	self.values.temporary.loose_ammo_give_team = {{
		true,
		5
	}}
	self.values.player.loose_ammo_restore_health_give_team = {true}
	self.values.temporary.single_shot_fast_reload = {{
		2,
		4
	}}
	self.values.player.gain_life_per_players = {0.2}
	self.damage_to_hot_data = {
		tick_time = 0.3,
		works_with_armor_kit = true,
		stacking_cooldown = 1.5,
		total_ticks = 10,
		max_stacks = false,
		armors_allowed = {
			"level_1",
			"level_2"
		},
		add_stack_sources = {
			projectile = true,
			fire = true,
			bullet = true,
			melee = true,
			explosion = true,
			civilian = false,
			poison = true,
			taser_tased = true,
			swat_van = true
		}
	}
	self.values.player.damage_to_hot = {
		0.1,
		0.2,
		0.3,
		0.4
	}
	self.values.player.damage_to_hot_extra_ticks = {4}
	self.values.player.armor_piercing_chance = {
		0.1,
		0.3
	}
	self.values.player.armor_regen_damage_health_ratio_multiplier = {
		0.2,
		0.4,
		0.6
	}
	self.values.player.movement_speed_damage_health_ratio_multiplier = {0.2}
	self.values.player.armor_regen_damage_health_ratio_threshold_multiplier = {2}
	self.values.player.movement_speed_damage_health_ratio_threshold_multiplier = {2}
	self.values.player.armor_grinding = {{
		{
			1,
			2
		},
		{
			1.5,
			3
		},
		{
			2,
			4
		},
		{
			2.5,
			5
		},
		{
			3.5,
			6
		},
		{
			4.5,
			7
		},
		{
			8.5,
			10
		}
	}}
	self.values.player.health_decrease = {0.5}
	self.values.player.armor_increase = {
		1,
		1.1,
		1.2
	}
	self.values.player.damage_to_armor = {{
		{
			3,
			1.5
		},
		{
			3,
			1.5
		},
		{
			3,
			1.5
		},
		{
			3,
			1.5
		},
		{
			3,
			1.5
		},
		{
			3,
			1.5
		},
		{
			3,
			1.5
		}
	}}
	self.values.assault_rifle.move_spread_index_addend = {2}
	self.values.snp.move_spread_index_addend = {2}
	self.values.smg.move_spread_index_addend = {2}
	self.values.pistol.spread_index_addend = {2}
	self.values.shotgun.hip_fire_spread_index_addend = {1}
	self.values.weapon.hip_fire_spread_index_addend = {1}
	self.values.weapon.single_spread_index_addend = {2}
	self.values.weapon.silencer_spread_index_addend = {3}
	self.values.team.pistol.recoil_index_addend = {1}
	self.values.team.weapon.recoil_index_addend = {2}
	self.values.team.pistol.suppression_recoil_index_addend = self.values.team.pistol.recoil_index_addend
	self.values.team.weapon.suppression_recoil_index_addend = self.values.team.weapon.recoil_index_addend
	self.values.shotgun.recoil_index_addend = {2}
	self.values.assault_rifle.recoil_index_addend = {2}
	self.values.weapon.silencer_recoil_index_addend = {2}
	self.values.lmg.recoil_index_addend = {1}
	self.values.snp.recoil_index_addend = {2}
	self.values.akimbo.recoil_index_addend = {
		-6,
		-4,
		-2,
		0,
		2
	}
	self.values.weapon.steelsight_highlight_specials = {true}
	self.armor_health_store_kill_amount = 1
	self.kill_change_regenerate_speed_percentage = false
	self.values.player.armor_health_store_amount = {
		0.4,
		0.8,
		1.2
	}
	self.values.player.armor_max_health_store_multiplier = {1.5}
	self.values.player.kill_change_regenerate_speed = {1.4}
	self.values.temporary.armor_break_invulnerable = {{
		2,
		15
	}}
	self.values.player.passive_always_regen_armor = {1.5}
	self.values.player.passive_damage_reduction = {0.5}
	self.cocaine_stacks_convert_levels = {
		30,
		25
	}
	self.cocaine_stacks_dmg_absorption_value = 0.1
	self.cocaine_stacks_tick_t = 4
	self.max_cocaine_stacks_per_tick = 240
	self.max_total_cocaine_stacks = 600
	self.cocaine_stacks_decay_t = 8
	self.cocaine_stacks_decay_amount_per_tick = 80
	self.cocaine_stacks_decay_percentage_per_tick = 0.6
	self.values.player.cocaine_stacking = {1}
	self.values.player.sync_cocaine_stacks = {true}
	self.values.player.cocaine_stacks_decay_multiplier = {0.5}
	self.values.player.sync_cocaine_upgrade_level = {2}
	self.values.player.cocaine_stack_absorption_multiplier = {2}
	self.wild_trigger_time = 4
	self.wild_max_triggers_per_time = 4
	self.values.player.wild_health_amount = {0.5}
	self.values.player.wild_armor_amount = {0.5}
	self.values.player.less_health_wild_armor = {{
		0.1,
		0.1
	}}
	self.values.player.less_health_wild_cooldown = {{
		0.1,
		0.1
	}}
	self.values.player.less_armor_wild_health = {{
		0.1,
		0.1
	}}
	self.values.player.less_armor_wild_cooldown = {{
		0.1,
		0.1
	}}
	self.values.temporary.chico_injector = {{
		0.75,
		6
	}}
	self.values.player.chico_armor_multiplier = {
		1.15,
		1.2,
		1.25
	}
	self.values.player.chico_preferred_target = {true}
	self.values.player.chico_injector_low_health_multiplier = {{
		0.5,
		0.25
	}}
	self.values.player.chico_injector_health_to_speed = {{
		5,
		1
	}}
	self.values.player.dodge_shot_gain = {{
		0.2,
		4
	}}
	self.values.player.dodge_replenish_armor = {true}
	self.values.player.smoke_screen_ally_dodge_bonus = {0.1}
	self.values.player.sicario_multiplier = {2}
	self.values.player.tag_team_base = {{
		kill_health_gain = 1.5,
		radius = 0.6,
		distance = 18,
		kill_extension = 1.3,
		duration = 12,
		tagged_health_gain_ratio = 0.5
	}}
	self.values.player.tag_team_cooldown_drain = {
		{
			tagged = 0,
			owner = 2
		},
		{
			tagged = 2,
			owner = 2
		}
	}
	self.values.player.tag_team_damage_absorption = {{
		kill_gain = 0.2,
		max = 2
	}}
	self.values.player.armor_to_health_conversion = {100}
	self.values.player.damage_control_passive = {{
		75,
		9
	}}
	self.values.player.damage_control_auto_shrug = {4}
	self.values.player.damage_control_cooldown_drain = {
		{
			0,
			1
		},
		{
			35,
			2
		}
	}
	self.values.player.damage_control_healing = {50}
	self.values.team.crew_add_health = {6}
	self.values.team.crew_add_armor = {3}
	self.values.team.crew_add_dodge = {0.05}
	self.values.team.crew_add_concealment = {3}
	self.values.team.crew_add_stamina = {50}
	self.values.team.crew_reduce_speed_penalty = {0.5}
	self.values.team.crew_faster_reload = {1.5}
	self.values.team.crew_faster_swap = {1.5}
	self.values.team.crew_throwable_regen = {35}
	self.values.team.crew_health_regen = {0.5}
	self.values.team.crew_active = {
		1,
		2,
		3
	}
	self.values.team.crew_inspire = {{
		360,
		240,
		120
	}}
	self.values.team.crew_scavenge = {{
		0.2,
		0.4,
		0.6
	}}
	self.values.team.crew_interact = {{
		0.75,
		0.5,
		0.25
	}}
	self.values.team.crew_ai_ap_ammo = {true}
	local editable_crew_descrition = {
		crew_healthy = {"60"},
		crew_sturdy = {"30"},
		crew_evasive = {"5"},
		crew_quiet = {"3"},
		crew_motivated = {
			"50",
			"50%"
		},
		crew_eager = {
			"50%",
			"50%"
		},
		crew_generous = {"35"},
		crew_regen = {
			"5",
			"5"
		},
		crew_inspire = {
			"6",
			"2"
		},
		crew_scavenge = {
			"20%",
			"+20%"
		},
		crew_interact = {
			"25%",
			"+25%"
		}
	}
	self.crew_descs = {}

	for id, desc in pairs(editable_crew_descrition) do
		self.crew_descs[id] = {}

		for i, value in ipairs(desc) do
			self.crew_descs[id]["value" .. i] = value
		end
	end

	local editable_skill_descs = {
		ammo_2x = {
			{"2"},
			{"50%"}
		},
		ammo_reservoir = {
			{"5"},
			{
				"10",
				"15"
			}
		},
		assassin = {
			{
				"25%",
				"10%"
			},
			{"95%"}
		},
		bandoliers = {
			{"25%"},
			{
				"175%",
				"75%",
				"5%",
				"1%"
			}
		},
		black_marketeer = {
			{
				"1.5%",
				"5"
			},
			{
				"4.5%",
				"5"
			}
		},
		blast_radius = {
			{"70%"},
			{}
		},
		cable_guy = {
			{
				"75%",
				"50%"
			},
			{
				"4",
				"2"
			}
		},
		carbon_blade = {
			{
				"20%",
				"50%"
			},
			{
				"50%",
				"20%",
				"10"
			}
		},
		cat_burglar = {
			{"75%"},
			{"50%"}
		},
		chameleon = {
			{
				"25%",
				"10",
				"3.5"
			},
			{
				"15%",
				"75%"
			}
		},
		cleaner = {
			{
				"5%",
				"3",
				"1",
				"1",
				"2"
			},
			{
				"1",
				"2"
			}
		},
		combat_medic = {
			{
				"30%",
				"5"
			},
			{"30%"}
		},
		control_freak = {
			{
				"10%",
				"40%",
				"45%"
			},
			{
				"20%",
				"40%",
				"30%",
				"54%"
			}
		},
		discipline = {
			{"50%"},
			{}
		},
		dominator = {
			{},
			{"50%"}
		},
		drill_expert = {
			{"15%"},
			{"15%"}
		},
		ecm_2x = {
			{"2"},
			{
				"25%",
				"25%"
			}
		},
		ecm_booster = {
			{"25%"},
			{}
		},
		ecm_feedback = {
			{
				"50%-100%",
				"25",
				"1.5",
				"15-20"
			},
			{
				"25%",
				"100%",
				"4"
			}
		},
		enforcer = {
			{"400%"},
			{}
		},
		equilibrium = {
			{
				"4",
				"50%",
				"33%"
			},
			{
				"100%",
				"8"
			}
		},
		fast_learner = {
			{
				"10%",
				"5",
				"30%"
			},
			{
				"20%",
				"50%"
			}
		},
		from_the_hip = {
			{"4"},
			{"4"}
		},
		ghost = {
			{
				"1",
				"20"
			},
			{}
		},
		good_luck_charm = {
			{
				"10",
				"1"
			},
			{"10"}
		},
		gun_fighter = {
			{
				"50%",
				"5"
			},
			{
				"15",
				"10"
			}
		},
		hardware_expert = {
			{
				"25%",
				"20%"
			},
			{
				"30%",
				"50%",
				"10%"
			}
		},
		hitman = {
			{
				"15%",
				"15%"
			},
			{
				"15%",
				"20%",
				"15%"
			}
		},
		inside_man = {
			{"50%"},
			{}
		},
		inspire = {
			{
				"100%",
				"20%",
				"10"
			},
			{
				"100%",
				"20",
				"9"
			}
		},
		insulation = {
			{"30%"},
			{
				"50%",
				"2"
			}
		},
		iron_man = {
			{
				"50%",
				"25%"
			},
			{
				"25%",
				"100%"
			}
		},
		joker = {
			{},
			{
				"55%",
				"35%",
				"65%"
			}
		},
		juggernaut = {
			{"30%"},
			{}
		},
		kilmer = {
			{"25%"},
			{"8"}
		},
		leadership = {
			{"4"},
			{"8"}
		},
		mag_plus = {
			{"5"},
			{"10"}
		},
		magic_touch = {
			{"25%"},
			{"25%"}
		},
		martial_arts = {
			{"50%"},
			{"50%"}
		},
		master_craftsman = {
			{"30%"},
			{"15%"}
		},
		mastermind = {
			{"2"},
			{}
		},
		medic_2x = {
			{"2"},
			{"2"}
		},
		nine_lives = {
			{
				"1",
				"50%"
			},
			{
				"35%",
				"1"
			}
		},
		oppressor = {
			{
				"25%",
				"15%"
			},
			{
				"50%",
				"75%"
			}
		},
		overkill = {
			{
				"75%",
				"20"
			},
			{"80%"}
		},
		pack_mule = {
			{"50%"},
			{
				"50%",
				"10",
				"1%"
			}
		},
		messiah = {
			{"1"},
			{"2"}
		},
		portable_saw = {
			{},
			{
				"1",
				"40%"
			}
		},
		rifleman = {
			{"100%"},
			{
				"25%",
				"16"
			}
		},
		scavenger = {
			{
				"30%",
				"5"
			},
			{
				"20%",
				"30%"
			}
		},
		sentry_2_0 = {
			{},
			{}
		},
		sentry_gun = {
			{},
			{"150%"}
		},
		sentry_gun_2x = {
			{"2"},
			{"300%"}
		},
		sentry_targeting_package = {
			{"100%"},
			{
				"150%",
				"50%"
			}
		},
		shades = {
			{"25%"},
			{"50%"}
		},
		shaped_charge = {
			{"3"},
			{}
		},
		sharpshooter = {
			{
				"4",
				"8"
			},
			{
				"8",
				"20%"
			}
		},
		shotgun_cqb = {
			{
				"50%",
				"15%"
			},
			{
				"35%",
				"125%",
				"12"
			}
		},
		shotgun_impact = {
			{
				"8",
				"5%"
			},
			{
				"15%",
				"10%"
			}
		},
		show_of_force = {
			{"50%"},
			{
				"15%",
				"20"
			}
		},
		silence = {
			{},
			{}
		},
		silence_expert = {
			{
				"8",
				"100%"
			},
			{
				"8",
				"20%",
				"12"
			}
		},
		silent_drilling = {
			{"65%"},
			{}
		},
		smg_master = {
			{"35%"},
			{"20%"}
		},
		smg_training = {
			{},
			{}
		},
		sprinter = {
			{
				"25%",
				"25%"
			},
			{
				"10%",
				"10%",
				"15%"
			}
		},
		steroids = {
			{"100%"},
			{"100%"}
		},
		stockholm_syndrome = {
			{"50%"},
			{"1"}
		},
		tactician = {
			{"15%"},
			{}
		},
		target_mark = {
			{},
			{}
		},
		technician = {
			{"2"},
			{}
		},
		tough_guy = {
			{"50%"},
			{"25%"}
		},
		transporter = {
			{"25%"},
			{"50%"}
		},
		triathlete = {
			{
				"100%",
				"4",
				"75%"
			},
			{
				"0.5",
				"8"
			}
		},
		trip_mine_expert = {
			{"30%"},
			{"50%"}
		},
		trip_miner = {
			{"1"},
			{"20%"}
		},
		underdog = {
			{
				"18",
				"15%",
				"7"
			},
			{
				"18",
				"10%",
				"7"
			}
		},
		wolverine = {
			{
				"25%",
				"250%",
				"50%"
			},
			{
				"25%",
				"100%",
				"50%"
			}
		},
		stable_shot = {
			{"8"},
			{"16"}
		},
		spotter_teamwork = {
			{"15%"},
			{
				"50%",
				"10",
				"100%"
			}
		},
		speedy_reload = {
			{"15%"},
			{
				"100%",
				"4"
			}
		},
		single_shot_ammo_return = {
			{
				"3",
				"6",
				"1"
			},
			{
				"2",
				"1"
			}
		},
		far_away = {
			{"40%"},
			{"50%"}
		},
		close_by = {
			{},
			{
				"35%",
				"15"
			}
		},
		scavenging = {
			{"50%"},
			{"6"}
		},
		dire_need = {
			{},
			{"6"}
		},
		unseen_strike = {
			{
				"4",
				"35%",
				"6"
			},
			{"18"}
		},
		dance_instructor = {
			{"5"},
			{"50%"}
		},
		akimbo_skill = {
			{"8"},
			{
				"8",
				"50%"
			}
		},
		running_from_death = {
			{
				"100%",
				"10"
			},
			{
				"30%",
				"10"
			}
		},
		up_you_go = {
			{
				"30%",
				"10"
			},
			{"40%"}
		},
		feign_death = {
			{"15%"},
			{"30%"}
		},
		bloodthirst = {
			{
				"100%",
				"1600%"
			},
			{
				"50%",
				"10"
			}
		},
		frenzy = {
			{
				"30%",
				"10%",
				"75%"
			},
			{
				"25%",
				"0%"
			}
		},
		defense_up = {
			{"5%"},
			{}
		},
		eco_sentry = {
			{"5%"},
			{"150%"}
		},
		engineering = {
			{},
			{
				"75%",
				"250%"
			}
		},
		jack_of_all_trades = {
			{"100%"},
			{"50%"}
		},
		tower_defense = {
			{"1"},
			{"2"}
		},
		steady_grip = {
			{"8"},
			{"16"}
		},
		heavy_impact = {
			{"5%"},
			{"20%"}
		},
		fire_control = {
			{"12"},
			{"20%"}
		},
		shock_and_awe = {
			{},
			{
				"2",
				"100%",
				"1%",
				"20",
				"40%"
			}
		},
		fast_fire = {
			{"15"},
			{}
		},
		body_expertise = {
			{"30%"},
			{"90%"}
		},
		kick_starter = {
			{"20%"},
			{
				"1",
				"50%"
			}
		},
		expert_handling = {
			{
				"10%",
				"10",
				"4"
			},
			{
				"1",
				"50%"
			}
		},
		optic_illusions = {
			{"35%"},
			{
				"1",
				"2"
			}
		},
		more_fire_power = {
			{
				"1",
				"4"
			},
			{
				"2",
				"7"
			}
		},
		fire_trap = {
			{
				"10",
				"4"
			},
			{
				"10",
				"50%"
			}
		},
		combat_engineering = {
			{"30%"},
			{"50%"}
		},
		hoxton = {
			{"4"},
			{}
		},
		freedom_call = {
			{"20%"},
			{"15%"}
		},
		hidden_blade = {
			{"2"},
			{"95%"}
		},
		tea_time = {
			{"50%"},
			{
				"10%",
				"120"
			}
		},
		awareness = {
			{
				"10%",
				"20%"
			},
			{"75%"}
		},
		alpha_dog = {
			{"5%"},
			{"10%"}
		},
		tea_cookies = {
			{
				"3",
				"7"
			},
			{
				"7",
				"5",
				"3",
				"20"
			}
		},
		cell_mates = {
			{"10%"},
			{"25%"}
		},
		thug_life = {
			{"1"},
			{"75%"}
		},
		thick_skin = {
			{
				"10",
				"2"
			},
			{
				"20",
				"4"
			}
		},
		backstab = {
			{
				"3%",
				"3",
				"35",
				"30%"
			},
			{
				"3%",
				"1",
				"35",
				"30%"
			}
		},
		drop_soap = {
			{},
			{}
		},
		second_chances = {
			{
				"1",
				"25"
			},
			{
				"2",
				"100%"
			}
		},
		trigger_happy = {
			{
				"10%",
				"2",
				"4",
				"20%"
			},
			{
				"8",
				"10"
			}
		},
		perseverance = {
			{
				"0",
				"3",
				"60%"
			},
			{"6"}
		},
		jail_workout = {
			{
				"3.5",
				"10",
				"25%"
			},
			{"30%"}
		},
		akimbo = {
			{
				"-16",
				"8"
			},
			{
				"-8",
				"150%",
				"8",
				"50%"
			}
		},
		jail_diet = {
			{
				"1%",
				"3",
				"35",
				"10%"
			},
			{
				"1%",
				"1",
				"35",
				"10%"
			}
		},
		prison_wife = {
			{
				"15",
				"2",
				"5"
			},
			{
				"30",
				"2",
				"20"
			}
		},
		mastermind_tier1 = {{"20%"}},
		mastermind_tier2 = {{"15%"}},
		mastermind_tier3 = {{"25%"}},
		mastermind_tier4 = {{"10%"}},
		mastermind_tier5 = {{"65%"}},
		mastermind_tier6 = {{
			"200%",
			"50%"
		}},
		enforcer_tier1 = {{"10%"}},
		enforcer_tier2 = {{"10%"}},
		enforcer_tier3 = {{"10%"}},
		enforcer_tier4 = {{"10%"}},
		enforcer_tier5 = {{"5%"}},
		enforcer_tier6 = {{"30%"}},
		technician_tier1 = {{"1%"}},
		technician_tier2 = {{"5%"}},
		technician_tier3 = {{"3%"}},
		technician_tier4 = {{"25%"}},
		technician_tier5 = {{"5%"}},
		technician_tier6 = {{
			"5%",
			"10%",
			"10%"
		}},
		ghost_tier1 = {{"5%"}},
		ghost_tier2 = {{"20%"}},
		ghost_tier3 = {{"10%"}},
		ghost_tier4 = {{
			"+5",
			"25%"
		}},
		ghost_tier5 = {{"80%"}},
		ghost_tier6 = {{
			"10%",
			"15%"
		}},
		hoxton_tier1 = {{}},
		hoxton_tier2 = {{}},
		hoxton_tier3 = {{}},
		hoxton_tier4 = {{}},
		hoxton_tier5 = {{}},
		hoxton_tier6 = {{}}
	}
	self.skill_descs = {}

	for skill_id, skill_desc in pairs(editable_skill_descs) do
		self.skill_descs[skill_id] = {}

		for index, skill_version in ipairs(skill_desc) do
			local version = index == 1 and "multibasic" or "multipro"
			self.skill_descs[skill_id][index] = #skill_version

			for i, desc in ipairs(skill_version) do
				self.skill_descs[skill_id][version .. (i == 1 and "" or tostring(i))] = desc
			end
		end
	end

	local editable_skill_btns = {jack_of_all_trades = {BTN_CHANGE_EQ = function ()
		return managers.localization:btn_macro("change_equipment")
	end}}
	self.skill_btns = {}

	for skill_id, skill_btns in pairs(editable_skill_btns) do
		self.skill_btns[skill_id] = {}

		for i, desc in pairs(skill_btns) do
			self.skill_btns[skill_id][tostring(i)] = desc
		end
	end

	local editable_specialization_descs = {
		{
			{
				"10%",
				"8%",
				"50%"
			},
			{"25%"},
			{
				"50%",
				"25%",
				"6%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"10%",
				"20%"
			},
			{"135%"},
			{
				"10%",
				"5%"
			},
			{
				"5%",
				"20%"
			},
			{
				"6%",
				"12%",
				"4",
				"8%",
				"10%"
			}
		},
		{
			{"10%"},
			{"25%"},
			{
				"15%",
				"10%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{"20%"},
			{"135%"},
			{},
			{
				"5%",
				"20%"
			},
			{
				"40%",
				"3%",
				"5",
				"10%"
			}
		},
		{
			{"10%"},
			{"25%"},
			{"10%"},
			{
				"+1",
				"15%",
				"45%"
			},
			{"10%"},
			{"135%"},
			{
				"10%",
				"2",
				"15"
			},
			{
				"5%",
				"20%"
			},
			{
				"5%",
				"10%",
				"10%"
			}
		},
		{
			{"15%"},
			{"25%"},
			{
				"15%",
				"45%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"15%",
				"135%"
			},
			{"135%"},
			{"15%"},
			{
				"5%",
				"20%"
			},
			{
				"25%",
				"80%",
				"10%"
			}
		},
		{
			{"5%"},
			{"25%"},
			{
				"10%",
				"5%",
				"-24",
				"50%",
				"-16"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"10%",
				"5%"
			},
			{"135%"},
			{
				"10%",
				"5%"
			},
			{
				"5%",
				"20%"
			},
			{
				"10%",
				"5%",
				"-16",
				"125%",
				"10%",
				"1.5"
			}
		},
		{
			{"15%"},
			{"25%"},
			{
				"5%",
				"20%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"10%",
				"20%"
			},
			{"135%"},
			{
				"10%",
				"25%"
			},
			{
				"5%",
				"20%"
			},
			{
				"10%",
				"10%"
			}
		},
		{
			{"20%"},
			{"25%"},
			{
				"10%",
				"20%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"5%",
				"5%",
				"20%"
			},
			{"135%"},
			{
				"5%",
				"5%",
				"10%"
			},
			{
				"5%",
				"20%"
			},
			{
				"20%",
				"10%"
			}
		},
		{
			{
				"12%",
				"1",
				"10"
			},
			{"25%"},
			{"8%"},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"8%",
				"10%",
				"7",
				"4"
			},
			{"135%"},
			{"8%"},
			{
				"5%",
				"20%"
			},
			{
				"20%",
				"10",
				"10%"
			}
		},
		{
			{
				"12%",
				"1",
				"10"
			},
			{"25%"},
			{
				"30",
				"1",
				"10%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"10%",
				"1",
				"8%"
			},
			{"135%"},
			{
				"30",
				"1",
				"10%"
			},
			{
				"5%",
				"20%"
			},
			{
				"75%",
				"1",
				"10%"
			}
		},
		{
			{
				"16",
				"24",
				"3",
				"20%"
			},
			{"25%"},
			{
				"50%",
				"5",
				"20%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"50%",
				"20%"
			},
			{"135%"},
			{"8"},
			{
				"5%",
				"20%"
			},
			{
				"8",
				"10%"
			}
		},
		{
			{
				"1",
				"0.3",
				"3",
				"1.5"
			},
			{"25%"},
			{
				"2",
				"0.3",
				"3",
				"20%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"3",
				"0.3",
				"3",
				"10%"
			},
			{"135%"},
			{
				"4",
				"0.3",
				"3",
				"20%"
			},
			{
				"5%",
				"20%"
			},
			{
				"4",
				"0.3",
				"4.2",
				"20%",
				"10%"
			}
		},
		{
			{
				"25%",
				"20%"
			},
			{"25%"},
			{
				"25%",
				"20%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"25%",
				"20%"
			},
			{"135%"},
			{
				"25%",
				"20%"
			},
			{
				"5%",
				"20%"
			},
			{
				"50%",
				"25%",
				"10%"
			}
		},
		{
			{
				"4",
				"1"
			},
			{"25%"},
			{
				"4",
				"10%",
				"10%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"50%",
				"10%",
				"10%"
			},
			{"135%"},
			{
				"4",
				"20%",
				"10%"
			},
			{
				"5%",
				"20%"
			},
			{
				"20%",
				"10%"
			}
		},
		{
			{
				"100%",
				"240",
				"4",
				"600",
				"1",
				"30",
				"60% + 80",
				"8"
			},
			{"25%"},
			{},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"60% + 40",
				"8"
			},
			{"135%"},
			{
				"1",
				"25"
			},
			{
				"5%",
				"20%"
			},
			{
				"100%",
				"10%"
			}
		},
		{
			{
				"2",
				"15"
			},
			{"25%"},
			{
				"50%",
				"100%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"50%",
				"110%"
			},
			{"135%"},
			{
				"50%",
				"120%"
			},
			{
				"5%",
				"20%"
			},
			{
				"10",
				"1.5",
				"10%"
			}
		},
		{
			{
				"5",
				"5",
				"4",
				"4"
			},
			{"25%"},
			{
				"10%",
				"1"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"10%",
				"4",
				"0.1"
			},
			{"135%"},
			{
				"10%",
				"1"
			},
			{
				"5%",
				"20%"
			},
			{
				"10%",
				"4",
				"0.1",
				"10%"
			}
		},
		{
			{
				"75%",
				"6",
				"30"
			},
			{"25%"},
			{"10%"},
			{
				"+1",
				"15%",
				"45%"
			},
			{"10%"},
			{"135%"},
			{
				"20%",
				"50%",
				"25%"
			},
			{
				"5%",
				"20%"
			},
			{
				"40%",
				"100%",
				"5",
				"1",
				"10%"
			}
		},
		{
			{
				"10",
				"50%",
				"60",
				"50%",
				"1"
			},
			{"25%"},
			{
				"20%",
				"4"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{"15%"},
			{"135%"},
			{},
			{
				"5%",
				"20%"
			},
			{
				"100%",
				"10%",
				"10%"
			}
		}
	}
	local delayed_percentage = self.values.player.damage_control_passive[1][1]
	local tick_percentage = self.values.player.damage_control_passive[1][2] * 0.01 * delayed_percentage
	local damage_duration = math.ceil(delayed_percentage / tick_percentage)
	local auto_shrug_time = self.values.player.damage_control_auto_shrug[1]
	local health_threshold = self.values.player.damage_control_cooldown_drain[2][1]
	local cooldown_drain_1 = self.values.player.damage_control_cooldown_drain[1][2]
	local cooldown_drain_2 = self.values.player.damage_control_cooldown_drain[2][2]
	local heal_percentage = self.values.player.damage_control_healing[1]

	table.insert(editable_specialization_descs, {
		{
			tostring(delayed_percentage) .. "%",
			damage_duration,
			"10"
		},
		{"25%"},
		{},
		{
			"+1",
			"15%",
			"45%"
		},
		{auto_shrug_time},
		{"135%"},
		{
			tostring(health_threshold) .. "%",
			cooldown_drain_2,
			cooldown_drain_1
		},
		{
			"5%",
			"20%"
		},
		{
			tostring(heal_percentage) .. "%",
			"10%"
		}
	})

	local distance = self.values.player.tag_team_base[1].distance
	local heal_amount = self.values.player.tag_team_base[1].kill_health_gain * 10
	local heal_amount_tagged = heal_amount * self.values.player.tag_team_base[1].tagged_health_gain_ratio
	local kill_extension = self.values.player.tag_team_base[1].kill_extension
	local duration = self.values.player.tag_team_base[1].duration
	local cooldown = 60
	local cooldown_drain_owner = self.values.player.tag_team_cooldown_drain[1].owner
	local cooldown_drain_tagged = self.values.player.tag_team_cooldown_drain[2].tagged
	local health_bonus_1 = (self.values.player.passive_health_multiplier[2] - 1) * 100
	local health_bonus_2 = (self.values.player.passive_health_multiplier[3] - 1) * 100 - health_bonus_1
	local kill_absorption = self.values.player.tag_team_damage_absorption[1].kill_gain * 10
	local kill_absorption_max = self.values.player.tag_team_damage_absorption[1].max * 10

	table.insert(editable_specialization_descs, {
		{
			distance,
			heal_amount,
			heal_amount_tagged,
			kill_extension,
			cooldown_drain_owner,
			duration,
			cooldown
		},
		{"25%"},
		{health_bonus_1 .. "%"},
		{
			"+1",
			"15%",
			"45%"
		},
		{
			kill_absorption,
			kill_absorption_max
		},
		{"135%"},
		{health_bonus_2 .. "%"},
		{
			"5%",
			"20%"
		},
		{
			cooldown_drain_tagged,
			"10%"
		}
	})
	
	self.specialization_descs = {}

	for tree, data in pairs(editable_specialization_descs) do
		self.specialization_descs[tree] = {}

		for tier, tier_data in ipairs(data) do
			self.specialization_descs[tree][tier] = {}

			for i, desc in ipairs(tier_data) do
				self.specialization_descs[tree][tier]["multiperk" .. (i == 1 and "" or tostring(i))] = desc
			end
		end
	end
end
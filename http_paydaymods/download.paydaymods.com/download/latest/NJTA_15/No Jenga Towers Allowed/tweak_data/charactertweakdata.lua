function CharacterTweakData:init(tweak_data)
	self:_create_table_structure()
	
	self._enemy_list = {}
	self._speech_prefix_p2 = "n"
	
	if Global and Global.game_settings and Global.game_settings.difficulty then
		self._speech_prefix_p2 = Global.game_settings.difficulty ~= "easy" and "d" or "n"
	end
	
	local func = "_init_region_" .. tostring(tweak_data.levels:get_ai_group_type())

	self[func](self)

	self._prefix_data_p1 = {
		cop = function ()
			return self._unit_prefixes.cop
		end,
		swat = function ()
			return self._unit_prefixes.swat
		end,
		heavy_swat = function ()
			return self._unit_prefixes.heavy_swat
		end,
		taser = function ()
			return self._unit_prefixes.taser
		end,
		cloaker = function ()
			return self._unit_prefixes.cloaker
		end,
		bulldozer = function ()
			return self._unit_prefixes.bulldozer
		end,
		medic = function ()
			return self._unit_prefixes.medic
		end
	}
	self.flashbang_multiplier = 1
	self.concussion_multiplier = 1
	local presets = self:_presets(tweak_data)
	self.presets = presets
	self.tweak_data = tweak_data
	
	
	self:_init_security(presets)
	self:_init_gensec(presets)
	self:_init_cop(presets)
	self:_init_inside_man(presets)
	self:_init_fbi(presets)
	self:_init_swat(presets)
	self:_init_heavy_swat(presets)
	self:_init_fbi_swat(presets)
	self:_init_fbi_heavy_swat(presets)
	self:_init_city_swat(presets)
	self:_init_sniper(presets)
	self:_init_gangster(presets)
	self:_init_biker(presets)
	self:_init_biker_escape(presets)
	self:_init_mobster(presets)
	self:_init_mobster_boss(presets)
	self:_init_hector_boss(presets)
	self:_init_hector_boss_no_armor(presets)
	self:_init_tank(presets)
	self:_init_medic(presets)
	self:_init_spooc(presets)
	self:_init_shield(presets)
	self:_init_phalanx_minion(presets)
	self:_init_phalanx_vip(presets)
	self:_init_taser(presets)
	self:_init_civilian(presets)
	self:_init_melee_box(presets)
	self:_init_bank_manager(presets)
	self:_init_drunk_pilot(presets)
	self:_init_boris(presets)
	self:_init_escort(presets)
	self:_init_escort_undercover(presets)
	self:_init_russian(presets)
	self:_init_german(presets)
	self:_init_spanish(presets)
	self:_init_american(presets)
	self:_init_jowi(presets)
	self:_init_old_hoxton(presets)
	self:_init_clover(presets)
	self:_init_dragan(presets)
	self:_init_jacket(presets)
	self:_init_bonnie(presets)
	self:_init_sokol(presets)
	self:_init_dragon(presets)
	self:_init_bodhi(presets)
	self:_init_jimmy(presets)
	self:_init_sydney(presets)
	self:_init_wild(presets)
	self:_init_biker_boss(presets)
	self:_init_chavez_boss(presets)
	self:_init_chico(presets)
	self:_init_max(presets)
	self:_init_myh(presets)
	self:_init_ecp(presets)
	self:_init_bolivians(presets)
	self:_init_drug_lord_boss(presets)
	self:_init_drug_lord_boss_stealth(presets)
	self:_init_old_hoxton_mission(presets)
	self:_init_spa_vip(presets)
	self:_init_spa_vip_hurt(presets)
	self:_init_captain(presets)
	self._prefix_data = nil
	self._prefix_data_p1 = nil
	self._speech_prefix_p2 = nil
	self:_process_weapon_usage_table()
end
function CharacterTweakData:_init_region_america()
	self._default_chatter = "dispatch_generic_message"
	self._unit_prefixes = {
		cop = "l",
		swat = "l",
		heavy_swat = "l",
		taser = "tsr",
		cloaker = "clk",
		bulldozer = "bdz",
		medic = "mdc"
	}
	self.die_sound_event = {
		medic = "mdc_x02a_any_3p",
		swat = "shd_x02a_any_3p_01",
		heavy_swat = "shd_x02a_any_3p_01",
		heavy_swat_sniper = "shd_x02a_any_3p_01",
		fbi_swat = "shd_x02a_any_3p_01",
		fbi_heavy_swat = "shd_x02a_any_3p_01",
		city_swat = "shd_x02a_any_3p_01",
		tank = "bdz_x02a_any_3p",
		shield = "shd_x02a_any_3p_01",
		phalanx_minion = "shd_x02a_any_3p_01",
		taser = "tsr_x02a_any_3p"
	}
end
function CharacterTweakData:_init_region_russia()
	self._default_chatter = "dsp_radio_russian"
	self._unit_prefixes = {
		cop = "r",
		swat = "r",
		heavy_swat = "r",
		taser = "rtsr",
		cloaker = "rclk",
		bulldozer = "rbdz",
		medic = "rmdc"
	}
	self.die_sound_event = {
		medic = "mdc_x02a_any_3p",
		tank = "bdz_x02a_any_3p",
		taser = "tsr_x02a_any_3p"
	}
	self._speech_prefix_p2 = "n"
end
function CharacterTweakData:_init_region_zombie()
	self._default_chatter = "dsp_radio_russian"
	self._unit_prefixes = {
		cop = "z",
		swat = "z",
		heavy_swat = "z",
		taser = "z",
		cloaker = "z",
		bulldozer = "z",
		medic = "z"
	}
	self._speech_prefix_p2 = "n"
end
function CharacterTweakData:_init_gensec(presets)
	self.gensec = deep_clone(presets.base)
	self.gensec.experience = {}
	self.gensec.weapon = presets.weapon.normal
	self.gensec.detection = presets.detection.guard
	self.gensec.HEALTH_INIT = 4
	self.gensec.headshot_dmg_mul = 2
	self.gensec.move_speed = presets.move_speed.normal
	self.gensec.crouch_move = nil
	self.gensec.surrender_break_time = {20, 30}
	self.gensec.suppression = presets.suppression.hard_def
	self.gensec.surrender = presets.surrender.easy
	self.gensec.ecm_vulnerability = 1
	self.gensec.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.gensec.weapon_voice = "3"
	self.gensec.experience.cable_tie = "tie_swat"
	self.gensec.speech_prefix_p1 = "l"
	self.gensec.speech_prefix_p2 = "n"
	self.gensec.speech_prefix_count = 4
	self.gensec.access = "security"
	self.gensec.rescue_hostages = false
	self.gensec.use_radio = nil
	self.gensec.silent_priority_shout = "f37"
	self.gensec.dodge = presets.dodge.athletic
	self.gensec.deathguard = false
	self.gensec.chatter = presets.enemy_chatter.cop
	self.gensec.has_alarm_pager = true
	self.gensec.melee_weapon = "baton"
	self.gensec.steal_loot = nil
	table.insert(self._enemy_list, "gensec")
end
function CharacterTweakData:_init_cop(presets)
	self.cop = deep_clone(presets.base)
	self.cop.experience = {}
	self.cop.weapon = presets.weapon.normal
	self.cop.detection = presets.detection.normal
	self.cop.HEALTH_INIT = 4
	self.cop.headshot_dmg_mul = 2
	self.cop.move_speed = presets.move_speed.normal
	self.cop.surrender_break_time = {10, 15}
	self.cop.suppression = presets.suppression.easy
	self.cop.surrender = presets.surrender.easy
	self.cop.ecm_vulnerability = 1
	self.cop.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.cop.weapon_voice = "1"
	self.cop.experience.cable_tie = "tie_swat"
	self.cop.speech_prefix_p1 = self._prefix_data_p1.swat()
	self.cop.speech_prefix_p2 = "n"
	self.cop.speech_prefix_count = 4
	self.cop.access = "cop"
	self.cop.silent_priority_shout = "f37"
	self.cop.dodge = presets.dodge.average
	self.cop.deathguard = true
	self.cop.chatter = presets.enemy_chatter.police
	self.cop.melee_weapon = "baton"
	self.cop.steal_loot = true
	table.insert(self._enemy_list, "cop")
	self.cop_scared = deep_clone(self.cop)
	self.cop_scared.surrender = presets.surrender.always
	self.cop_scared.surrender_break_time = nil
	table.insert(self._enemy_list, "cop_scared")
	self.cop_female = deep_clone(self.cop)
	self.cop_female.HEALTH_INIT = 8
	self.cop_female.move_speed = presets.move_speed.very_fast
	self.cop_female.surrender_break_time = {7, 12}
	self.cop_female.suppression = presets.suppression.hard_def
	self.cop_female.surrender = presets.surrender.normal
	self.cop_female.ecm_vulnerability = 1
	self.cop_female.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.cop_female.speech_prefix_p1 = "fl"
	self.cop_female.speech_prefix_p2 = "n"
	self.cop_female.speech_prefix_count = 1
	self.cop_female.access = "fbi"
	self.cop_female.dodge = presets.dodge.athletic
	self.cop_female.deathguard = true
	self.cop_female.no_arrest = true
	self.cop_female.steal_loot = true
	table.insert(self._enemy_list, "cop_female")
end
function CharacterTweakData:_init_fbi(presets)
	self.fbi = deep_clone(presets.base)
	self.fbi.experience = {}
	self.fbi.weapon = presets.weapon.normal
	self.fbi.detection = presets.detection.normal
	self.fbi.HEALTH_INIT = 8
	self.fbi.headshot_dmg_mul = 2
	self.fbi.move_speed = presets.move_speed.very_fast
	self.fbi.surrender_break_time = {7, 12}
	self.fbi.suppression = presets.suppression.hard_def
	self.fbi.surrender = presets.surrender.normal
	self.fbi.ecm_vulnerability = 1
	self.fbi.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.fbi.weapon_voice = "2"
	self.fbi.experience.cable_tie = "tie_swat"
	self.fbi.speech_prefix_p1 = "l"
	self.fbi.speech_prefix_p2 = "n"
	self.fbi.speech_prefix_count = 4
	self.fbi.silent_priority_shout = "f37"
	self.fbi.access = "fbi"
	self.fbi.dodge = presets.dodge.athletic
	self.fbi.deathguard = true
	self.fbi.no_arrest = true
	self.fbi.chatter = presets.enemy_chatter.police
	self.fbi.steal_loot = true
	table.insert(self._enemy_list, "fbi")
end
function CharacterTweakData:_init_medic(presets)
	self.medic = deep_clone(presets.base)
	self.medic.tags = {"medic", "special"}
	self.medic.experience = {}
	self.medic.weapon = {}
	self.medic.weapon.is_rifle = {}
	self.medic.weapon.is_rifle.aim_delay = {0.1, 0.1}
	self.medic.weapon.is_rifle.focus_delay = 3
	self.medic.weapon.is_rifle.focus_dis = 200
	self.medic.weapon.is_rifle.spread = 20
	self.medic.weapon.is_rifle.miss_dis = 40
	self.medic.weapon.is_rifle.RELOAD_SPEED = 1.2
	self.medic.weapon.is_rifle.melee_speed = 1
	self.medic.weapon.is_rifle.melee_dmg = 15
	self.medic.weapon.is_rifle.melee_retry_delay = {1, 2}
	self.medic.weapon.is_rifle.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	self.medic.weapon.is_rifle.autofire_rounds = {6, 11}
	self.medic.weapon.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 0.66,
			recoil = {0.4, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 0.44,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.8},
			dmg_mul = 0.33,
			recoil = {0.35, 0.75},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 0.28,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.22,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.medic.weapon.is_shotgun_pump = {}
	self.medic.weapon.is_shotgun_pump.aim_delay = {0.1, 0.1}
	self.medic.weapon.is_shotgun_pump.focus_delay = 5
	self.medic.weapon.is_shotgun_pump.focus_dis = 200
	self.medic.weapon.is_shotgun_pump.spread = 15
	self.medic.weapon.is_shotgun_pump.miss_dis = 20
	self.medic.weapon.is_shotgun_pump.RELOAD_SPEED = 1.2
	self.medic.weapon.is_shotgun_pump.melee_speed = 1
	self.medic.weapon.is_shotgun_pump.melee_dmg = 15
	self.medic.weapon.is_shotgun_pump.melee_retry_delay = {1, 2}
	self.medic.weapon.is_shotgun_pump.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	self.medic.weapon.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 0.66,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.95},
			dmg_mul = 0.44,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.75},
			dmg_mul = 0.44,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.01, 0.25},
			dmg_mul = 0.33,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.05, 0.35},
			dmg_mul = 0.22,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.medic.detection = presets.detection.normal
	self.medic.HEALTH_INIT = 30
	self.medic.headshot_dmg_mul = 2
	self.medic.damage.hurt_severity = presets.hurt_severities.no_hurts_no_tase
	self.medic.suppression = nil
	self.medic.surrender = presets.surrender.special
	self.medic.move_speed = presets.move_speed.very_fast
	self.medic.surrender_break_time = {7, 12}
	self.medic.ecm_vulnerability = 1
	self.medic.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.medic.weapon_voice = "2"
	self.medic.experience.cable_tie = "tie_swat"
	self.medic.speech_prefix_p1 = self._prefix_data_p1.medic()
	self.medic.speech_prefix_count = nil
	self.medic.spawn_sound_event = self._prefix_data_p1.medic() .. "_entrance"
	self.medic.silent_priority_shout = "f37"
	self.medic.access = "swat"
	self.medic.dodge = presets.dodge.athletic
	self.medic.deathguard = true
	self.medic.no_arrest = true
	self.medic.chatter = {aggressive = true, contact = true}
	self.medic.steal_loot = false
	self.medic.priority_shout = "f47"
	self.medic.priority_shout_max_dis = 700
	self.medic.can_be_tased = false
	self.medic.immune_to_knock_down = true
	table.insert(self._enemy_list, "medic")
end
function CharacterTweakData:_init_swat(presets)
	self.swat = deep_clone(presets.base)
	self.swat.experience = {}
	self.swat.weapon = presets.weapon.normal
	self.swat.detection = presets.detection.normal
	self.swat.HEALTH_INIT = 8
	self.swat.headshot_dmg_mul = 2
	self.swat.move_speed = presets.move_speed.very_fast
	self.swat.surrender_break_time = {6, 10}
	self.swat.suppression = presets.suppression.hard_agg
	self.swat.surrender = presets.surrender.normal
	self.swat.ecm_vulnerability = 1
	self.swat.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.swat.weapon_voice = "2"
	self.swat.experience.cable_tie = "tie_swat"
	self.swat.speech_prefix_p1 = self._prefix_data_p1.swat()
	self.swat.speech_prefix_p2 = self._speech_prefix_p2
	self.swat.speech_prefix_count = 4
	self.swat.access = "swat"
	self.swat.dodge = presets.dodge.athletic
	self.swat.no_arrest = true
	self.swat.chatter = presets.enemy_chatter.swat
	self.swat.melee_weapon = "knife_1"
	self.swat.melee_weapon_dmg_multiplier = 1
	self.swat.steal_loot = true
	table.insert(self._enemy_list, "swat")
end
function CharacterTweakData:_init_heavy_swat(presets)
	self.heavy_swat = deep_clone(presets.base)
	self.heavy_swat.experience = {}
	self.heavy_swat.weapon = presets.weapon.normal
	self.heavy_swat.detection = presets.detection.normal
	self.heavy_swat.HEALTH_INIT = 16
	self.heavy_swat.headshot_dmg_mul = 2
	self.heavy_swat.move_speed = presets.move_speed.fast
	self.heavy_swat.surrender_break_time = {6, 8}
	self.heavy_swat.suppression = presets.suppression.hard_agg
	self.heavy_swat.surrender = presets.surrender.hard
	self.heavy_swat.ecm_vulnerability = 1
	self.heavy_swat.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.heavy_swat.weapon_voice = "2"
	self.heavy_swat.experience.cable_tie = "tie_swat"
	self.heavy_swat.speech_prefix_p1 = self._prefix_data_p1.heavy_swat()
	self.heavy_swat.speech_prefix_p2 = self._speech_prefix_p2
	self.heavy_swat.speech_prefix_count = 4
	self.heavy_swat.access = "swat"
	self.heavy_swat.dodge = presets.dodge.heavy
	self.heavy_swat.no_arrest = true
	self.heavy_swat.chatter = presets.enemy_chatter.swat
	self.heavy_swat.steal_loot = true
	self.heavy_swat_sniper = deep_clone(self.heavy_swat)
	self.heavy_swat_sniper.weapon = {}
	self.heavy_swat_sniper.weapon.is_rifle = {}
	self.heavy_swat_sniper.weapon.is_rifle.aim_delay = {0, 0.1}
	self.heavy_swat_sniper.weapon.is_rifle.focus_delay = 3
	self.heavy_swat_sniper.weapon.is_rifle.focus_dis = 200
	self.heavy_swat_sniper.weapon.is_rifle.spread = 5
	self.heavy_swat_sniper.weapon.is_rifle.miss_dis = 250
	self.heavy_swat_sniper.weapon.is_rifle.RELOAD_SPEED = 1.2
	self.heavy_swat_sniper.weapon.is_rifle.melee_speed = 1
	self.heavy_swat_sniper.weapon.is_rifle.melee_dmg = 15
	self.heavy_swat_sniper.weapon.is_rifle.melee_retry_delay = {1, 2}
	self.heavy_swat_sniper.weapon.is_rifle.range = {
		close = 1500,
		optimal = 15000,
		far = 15000
	}
	self.heavy_swat_sniper.weapon.is_rifle.use_laser = false
	self.heavy_swat_sniper.weapon.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {1, 1},
			dmg_mul = 10,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.7, 1},
			dmg_mul = 10,
			recoil = {0.5, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 1},
			dmg_mul = 10,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 1},
			dmg_mul = 10,
			recoil = {1.5, 1.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.7, 1},
			dmg_mul = 10,
			recoil = {1.75, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.95},
			dmg_mul = 10,
			recoil = {2, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.2, 0.5},
			dmg_mul = 6,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.heavy_swat_sniper.suppression = presets.suppression.zeal
	self.heavy_swat_sniper.surrender = presets.surrender.zeal
	self.heavy_swat_sniper.chatter = presets.enemy_chatter.zeal
	table.insert(self._enemy_list, "heavy_swat")
	table.insert(self._enemy_list, "heavy_swat_sniper")
end
function CharacterTweakData:_init_fbi_swat(presets)
	self.fbi_swat = deep_clone(presets.base)
	self.fbi_swat.experience = {}
	self.fbi_swat.weapon = presets.weapon.good
	self.fbi_swat.detection = presets.detection.normal
	self.fbi_swat.HEALTH_INIT = 8
	self.fbi_swat.headshot_dmg_mul = self.fbi_swat.HEALTH_INIT / 4
	self.fbi_swat.move_speed = presets.move_speed.very_fast
	self.fbi_swat.surrender_break_time = {6, 10}
	self.fbi_swat.suppression = presets.suppression.hard_def
	self.fbi_swat.surrender = presets.surrender.normal
	self.fbi_swat.ecm_vulnerability = 1
	self.fbi_swat.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.fbi_swat.weapon_voice = "2"
	self.fbi_swat.experience.cable_tie = "tie_swat"
	self.fbi_swat.speech_prefix_p1 = self._prefix_data_p1.heavy_swat()
	self.fbi_swat.speech_prefix_p2 = self._speech_prefix_p2
	self.fbi_swat.speech_prefix_count = 4
	self.fbi_swat.access = "swat"
	self.fbi_swat.dodge = presets.dodge.athletic
	self.fbi_swat.no_arrest = true
	self.fbi_swat.chatter = presets.enemy_chatter.swat
	self.fbi_swat.melee_weapon = "knife_1"
	self.fbi_swat.steal_loot = true
	table.insert(self._enemy_list, "fbi_swat")
end
function CharacterTweakData:_init_fbi_heavy_swat(presets)
	self.fbi_heavy_swat = deep_clone(presets.base)
	self.fbi_heavy_swat.experience = {}
	self.fbi_heavy_swat.weapon = presets.weapon.good
	self.fbi_heavy_swat.detection = presets.detection.normal
	self.fbi_heavy_swat.HEALTH_INIT = 16
	self.fbi_heavy_swat.headshot_dmg_mul = 2
	self.fbi_heavy_swat.move_speed = presets.move_speed.fast
	self.fbi_heavy_swat.surrender_break_time = {6, 8}
	self.fbi_heavy_swat.suppression = presets.suppression.hard_agg
	self.fbi_heavy_swat.surrender = presets.surrender.hard
	self.fbi_heavy_swat.ecm_vulnerability = 1
	self.fbi_heavy_swat.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.fbi_heavy_swat.weapon_voice = "2"
	self.fbi_heavy_swat.experience.cable_tie = "tie_swat"
	self.fbi_heavy_swat.speech_prefix_p1 = self._prefix_data_p1.heavy_swat()
	self.fbi_heavy_swat.speech_prefix_p2 = self._speech_prefix_p2
	self.fbi_heavy_swat.speech_prefix_count = 4
	self.fbi_heavy_swat.access = "swat"
	self.fbi_heavy_swat.dodge = presets.dodge.heavy
	self.fbi_heavy_swat.no_arrest = true
	self.fbi_heavy_swat.chatter = presets.enemy_chatter.swat
	self.fbi_heavy_swat.steal_loot = true
	table.insert(self._enemy_list, "fbi_heavy_swat")
end
function CharacterTweakData:_init_city_swat(presets)
	self.city_swat = deep_clone(presets.base)
	self.city_swat.experience = {}
	self.city_swat.weapon = presets.weapon.good
	self.city_swat.detection = presets.detection.normal
	self.city_swat.HEALTH_INIT = 8
	self.city_swat.headshot_dmg_mul = 2
	self.city_swat.move_speed = presets.move_speed.very_fast
	self.city_swat.surrender_break_time = {6, 10}
	self.city_swat.suppression = presets.suppression.hard_def
	self.city_swat.surrender = presets.surrender.normal
	self.city_swat.ecm_vulnerability = 1
	self.city_swat.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.city_swat.weapon_voice = "2"
	self.city_swat.experience.cable_tie = "tie_swat"
	self.city_swat.silent_priority_shout = "f37"
	self.city_swat.speech_prefix_p1 = self._prefix_data_p1.heavy_swat()
	self.city_swat.speech_prefix_p2 = self._speech_prefix_p2
	self.city_swat.speech_prefix_count = 4
	self.city_swat.access = "swat"
	self.city_swat.dodge = presets.dodge.athletic
	self.city_swat.chatter = presets.enemy_chatter.swat
	self.city_swat.melee_weapon = "knife_1"
	self.city_swat.no_arrest = true
	self.city_swat.steal_loot = true
	self.city_swat.has_alarm_pager = true
	table.insert(self._enemy_list, "city_swat")
end
function CharacterTweakData:_init_sniper(presets)
	self.sniper = deep_clone(presets.base)
	self.sniper.tags = {"sniper", "special"}
	self.sniper.experience = {}
	self.sniper.weapon = {}
	self.sniper.weapon.is_rifle = {}
	self.sniper.weapon.is_rifle.aim_delay = {0, 0.1}
	self.sniper.weapon.is_rifle.focus_delay = 7
	self.sniper.weapon.is_rifle.focus_dis = 200
	self.sniper.weapon.is_rifle.spread = 5
	self.sniper.weapon.is_rifle.miss_dis = 250
	self.sniper.weapon.is_rifle.RELOAD_SPEED = 1.2
	self.sniper.weapon.is_rifle.melee_speed = 1
	self.sniper.weapon.is_rifle.melee_dmg = 15
	self.sniper.weapon.is_rifle.melee_retry_delay = {1, 2}
	self.sniper.weapon.is_rifle.range = {
		close = 15000,
		optimal = 15000,
		far = 15000
	}
	self.sniper.weapon.is_rifle.use_laser = true
	self.sniper.weapon.is_rifle.FALLOFF = {
		{
			r = 700,
			acc = {0.7, 1},
			dmg_mul = 10,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.95},
			dmg_mul = 10,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.2, 0.5},
			dmg_mul = 6,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.sniper.detection = presets.detection.sniper
	self.sniper.HEALTH_INIT = 4
	self.sniper.headshot_dmg_mul = 2
	self.sniper.move_speed = presets.move_speed.normal
	self.sniper.shooting_death = false
	self.sniper.no_move_and_shoot = true
	self.sniper.move_and_shoot_cooldown = 1
	self.sniper.suppression = presets.suppression.easy
	self.sniper.ecm_vulnerability = 1
	self.sniper.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.sniper.weapon_voice = "1"
	self.sniper.experience.cable_tie = "tie_swat"
	self.sniper.speech_prefix_p1 = "l"
	self.sniper.speech_prefix_p2 = "n"
	self.sniper.speech_prefix_count = 4
	self.sniper.priority_shout = "f34"
	self.sniper.access = "sniper"
	self.sniper.no_retreat = true
	self.sniper.no_arrest = true
	self.sniper.chatter = presets.enemy_chatter.no_chatter
	self.sniper.steal_loot = nil
	self.sniper.rescue_hostages = false
	table.insert(self._enemy_list, "sniper")
end
function CharacterTweakData:_init_mobster_boss(presets)
	self.mobster_boss = deep_clone(presets.base)
	self.mobster_boss.experience = {}
	self.mobster_boss.weapon = presets.weapon.good
	self.mobster_boss.detection = presets.detection.normal
	self.mobster_boss.HEALTH_INIT = 300
	self.mobster_boss.headshot_dmg_mul = 2
	self.mobster_boss.damage.explosion_damage_mul = 1
	self.mobster_boss.damage.hurt_severity = presets.hurt_severities.no_hurts_no_tase
	self.mobster_boss.move_speed = presets.move_speed.very_slow
	self.mobster_boss.allowed_poses = {stand = true}
	self.mobster_boss.no_retreat = true
	self.mobster_boss.no_arrest = true
	self.mobster_boss.surrender = nil
	self.mobster_boss.ecm_vulnerability = 0
	self.mobster_boss.ecm_hurts = {
		ears = {min_duration = 0, max_duration = 0}
	}
	self.mobster_boss.weapon_voice = "3"
	self.mobster_boss.experience.cable_tie = "tie_swat"
	self.mobster_boss.access = "gangster"
	self.mobster_boss.speech_prefix_p1 = "l"
	self.mobster_boss.speech_prefix_p2 = "n"
	self.mobster_boss.speech_prefix_count = 4
	self.mobster_boss.rescue_hostages = false
	self.mobster_boss.silent_priority_shout = "f37"
	self.mobster_boss.melee_weapon = "fists"
	self.mobster_boss.melee_weapon_dmg_multiplier = 2
	self.mobster_boss.steal_loot = nil
	self.mobster_boss.calls_in = nil
	self.mobster_boss.chatter = presets.enemy_chatter.no_chatter
	self.mobster_boss.use_radio = nil
	self.mobster_boss.DAMAGE_CLAMP_BULLET = 80
	self.mobster_boss.DAMAGE_CLAMP_EXPLOSION = 80
	self.mobster_boss.use_animation_on_fire_damage = false
	self.mobster_boss.flammable = true
	self.mobster_boss.can_be_tased = false
	self.mobster_boss.immune_to_knock_down = true
	self.mobster_boss.immune_to_concussion = true
	table.insert(self._enemy_list, "mobster_boss")
end
function CharacterTweakData:_init_biker_boss(presets)
	self.biker_boss = deep_clone(presets.base)
	self.biker_boss.experience = {}
	self.biker_boss.weapon = presets.weapon.good
	self.biker_boss.detection = presets.detection.normal
	self.biker_boss.HEALTH_INIT = 300
	self.biker_boss.headshot_dmg_mul = 2
	self.biker_boss.damage.explosion_damage_mul = 1
	self.biker_boss.damage.hurt_severity = presets.hurt_severities.no_hurts_no_tase
	self.biker_boss.move_speed = presets.move_speed.very_slow
	self.biker_boss.allowed_poses = {stand = true}
	self.biker_boss.no_retreat = true
	self.biker_boss.no_arrest = true
	self.biker_boss.surrender = nil
	self.biker_boss.ecm_vulnerability = 0
	self.biker_boss.ecm_hurts = {
		ears = {min_duration = 0, max_duration = 0}
	}
	self.biker_boss.weapon_voice = "3"
	self.biker_boss.experience.cable_tie = "tie_swat"
	self.biker_boss.access = "gangster"
	self.biker_boss.speech_prefix_p1 = "bb"
	self.biker_boss.speech_prefix_p2 = "n"
	self.biker_boss.speech_prefix_count = 1
	self.biker_boss.rescue_hostages = false
	self.biker_boss.silent_priority_shout = "f37"
	self.biker_boss.melee_weapon = "fists"
	self.biker_boss.melee_weapon_dmg_multiplier = 2
	self.biker_boss.steal_loot = nil
	self.biker_boss.calls_in = nil
	self.biker_boss.chatter = presets.enemy_chatter.no_chatter
	self.biker_boss.use_radio = nil
	self.biker_boss.DAMAGE_CLAMP_BULLET = 80
	self.biker_boss.DAMAGE_CLAMP_EXPLOSION = 80
	self.biker_boss.use_animation_on_fire_damage = false
	self.biker_boss.flammable = true
	self.biker_boss.can_be_tased = false
	self.biker_boss.immune_to_knock_down = true
	self.biker_boss.immune_to_concussion = true
	table.insert(self._enemy_list, "biker_boss")
end
function CharacterTweakData:_init_chavez_boss(presets)
	self.chavez_boss = deep_clone(presets.base)
	self.chavez_boss.experience = {}
	self.chavez_boss.weapon = presets.weapon.good
	self.chavez_boss.detection = presets.detection.normal
	self.chavez_boss.HEALTH_INIT = 300
	self.chavez_boss.headshot_dmg_mul = 2
	self.chavez_boss.damage.explosion_damage_mul = 1
	self.chavez_boss.damage.hurt_severity = presets.hurt_severities.no_hurts_no_tase
	self.chavez_boss.move_speed = presets.move_speed.normal
	self.chavez_boss.crouch_move = false
	self.chavez_boss.allowed_poses = {stand = true}
	self.chavez_boss.no_retreat = true
	self.chavez_boss.no_arrest = true
	self.chavez_boss.surrender = nil
	self.chavez_boss.ecm_vulnerability = 0
	self.chavez_boss.ecm_hurts = {
		ears = {min_duration = 0, max_duration = 0}
	}
	self.chavez_boss.weapon_voice = "1"
	self.chavez_boss.experience.cable_tie = "tie_swat"
	self.chavez_boss.access = "gangster"
	self.chavez_boss.speech_prefix_p1 = "bb"
	self.chavez_boss.speech_prefix_p2 = "n"
	self.chavez_boss.speech_prefix_count = 1
	self.chavez_boss.rescue_hostages = false
	self.chavez_boss.silent_priority_shout = "f37"
	self.chavez_boss.melee_weapon = "fists"
	self.chavez_boss.melee_weapon_dmg_multiplier = 2
	self.chavez_boss.steal_loot = nil
	self.chavez_boss.calls_in = nil
	self.chavez_boss.chatter = presets.enemy_chatter.no_chatter
	self.chavez_boss.use_radio = nil
	self.chavez_boss.can_be_tased = false
	self.chavez_boss.DAMAGE_CLAMP_BULLET = 80
	self.chavez_boss.DAMAGE_CLAMP_EXPLOSION = 80
	self.chavez_boss.use_animation_on_fire_damage = false
	self.chavez_boss.flammable = true
	self.chavez_boss.can_be_tased = false
	self.chavez_boss.immune_to_knock_down = true
	self.chavez_boss.immune_to_concussion = true
	table.insert(self._enemy_list, "chavez_boss")
end
function CharacterTweakData:_init_hector_boss(presets)
	self.hector_boss = deep_clone(self.mobster_boss)
	table.insert(self._enemy_list, "hector_boss")
end
function CharacterTweakData:_init_hector_boss_no_armor(presets)
	self.hector_boss_no_armor = deep_clone(presets.base)
	self.hector_boss_no_armor.experience = {}
	self.hector_boss_no_armor.weapon = presets.weapon.good
	self.hector_boss_no_armor.detection = presets.detection.normal
	self.hector_boss_no_armor.HEALTH_INIT = 8
	self.hector_boss_no_armor.headshot_dmg_mul = 2
	self.hector_boss_no_armor.damage.hurt_severity = presets.hurt_severities.no_hurts_no_tase
	self.hector_boss_no_armor.move_speed = presets.move_speed.very_fast
	self.hector_boss_no_armor.no_retreat = true
	self.hector_boss_no_armor.no_arrest = true
	self.hector_boss_no_armor.surrender = nil
	self.hector_boss_no_armor.ecm_vulnerability = 0
	self.hector_boss_no_armor.ecm_hurts = {
		ears = {min_duration = 0, max_duration = 0}
	}
	self.hector_boss_no_armor.weapon_voice = "2"
	self.hector_boss_no_armor.experience.cable_tie = "tie_swat"
	self.hector_boss_no_armor.speech_prefix_p1 = "l"
	self.hector_boss_no_armor.speech_prefix_p2 = "n"
	self.hector_boss_no_armor.speech_prefix_count = 4
	self.hector_boss_no_armor.silent_priority_shout = "f37"
	self.hector_boss_no_armor.access = "gangster"
	self.hector_boss_no_armor.rescue_hostages = false
	self.hector_boss_no_armor.dodge = presets.dodge.athletic
	self.hector_boss_no_armor.deathguard = false
	self.hector_boss_no_armor.melee_weapon = "fists"
	self.hector_boss_no_armor.melee_weapon_dmg_multiplier = 2
	self.hector_boss_no_armor.steal_loot = nil
	self.hector_boss_no_armor.calls_in = nil
	self.hector_boss_no_armor.chatter = presets.enemy_chatter.no_chatter
	self.hector_boss_no_armor.use_radio = nil
	self.hector_boss_no_armor.can_be_tased = false
	self.hector_boss_no_armor.use_animation_on_fire_damage = false
	self.hector_boss_no_armor.flammable = true
	self.hector_boss_no_armor.immune_to_knock_down = true
	self.hector_boss_no_armor.immune_to_concussion = true
	table.insert(self._enemy_list, "hector_boss_no_armor")
end
function CharacterTweakData:_init_bolivians(presets)
	self.bolivian = deep_clone(self.gangster)
	self.bolivian.detection = presets.detection.guard
	self.bolivian.access = "security"
	self.bolivian.radio_prefix = "fri_"
	self.bolivian.suspicious = true
	self.bolivian.crouch_move = nil
	self.bolivian.no_arrest = true
	table.insert(self._enemy_list, "bolivian")
	self.bolivian_indoors = deep_clone(self.bolivian)
	self.bolivian_indoors.has_alarm_pager = true
	table.insert(self._enemy_list, "bolivian_indoors")
end
function CharacterTweakData:_init_drug_lord_boss(presets)
	self.drug_lord_boss = deep_clone(presets.base)
	self.drug_lord_boss.experience = {}
	self.drug_lord_boss.weapon = presets.weapon.good
	self.drug_lord_boss.detection = presets.detection.normal
	self.drug_lord_boss.HEALTH_INIT = 300
	self.drug_lord_boss.headshot_dmg_mul = 2
	self.drug_lord_boss.damage.explosion_damage_mul = 1
	self.drug_lord_boss.damage.hurt_severity = presets.hurt_severities.no_hurts_no_tase
	self.drug_lord_boss.move_speed = presets.move_speed.very_slow
	self.drug_lord_boss.allowed_poses = {stand = true}
	self.drug_lord_boss.crouch_move = false
	self.drug_lord_boss.no_retreat = true
	self.drug_lord_boss.no_arrest = true
	self.drug_lord_boss.surrender = nil
	self.drug_lord_boss.ecm_vulnerability = 0
	self.drug_lord_boss.ecm_hurts = {
		ears = {min_duration = 0, max_duration = 0}
	}
	self.drug_lord_boss.weapon_voice = "3"
	self.drug_lord_boss.experience.cable_tie = "tie_swat"
	self.drug_lord_boss.access = "gangster"
	self.drug_lord_boss.speech_prefix_p1 = "bb"
	self.drug_lord_boss.speech_prefix_p2 = "n"
	self.drug_lord_boss.speech_prefix_count = 1
	self.drug_lord_boss.rescue_hostages = false
	self.drug_lord_boss.silent_priority_shout = "f37"
	self.drug_lord_boss.melee_weapon = "fists"
	self.drug_lord_boss.melee_weapon_dmg_multiplier = 2
	self.drug_lord_boss.steal_loot = nil
	self.drug_lord_boss.calls_in = nil
	self.drug_lord_boss.chatter = presets.enemy_chatter.no_chatter
	self.drug_lord_boss.use_radio = nil
	self.drug_lord_boss.can_be_tased = false
	self.drug_lord_boss.DAMAGE_CLAMP_BULLET = 80
	self.drug_lord_boss.DAMAGE_CLAMP_EXPLOSION = 80
	self.drug_lord_boss.use_animation_on_fire_damage = false
	self.drug_lord_boss.flammable = true
	self.drug_lord_boss.immune_to_knock_down = true
	self.drug_lord_boss.immune_to_concussion = true
	table.insert(self._enemy_list, "drug_lord_boss")
end
function CharacterTweakData:_init_drug_lord_boss_stealth(presets)
	self.drug_lord_boss_stealth = deep_clone(self.hector_boss_no_armor)
	self.drug_lord_boss_stealth.weapon_voice = "3"
	self.drug_lord_boss_stealth.speech_prefix_p1 = "bb"
	self.drug_lord_boss_stealth.speech_prefix_p2 = "n"
	self.drug_lord_boss_stealth.speech_prefix_count = 1
	table.insert(self._enemy_list, "drug_lord_boss_stealth")
end
function CharacterTweakData:_init_tank(presets)
	self.tank = deep_clone(presets.base)
	self.tank.tags = {"tank", "special"}
	self.tank.experience = {}
	self.tank.damage.tased_response = {
		light = {tased_time = 1, down_time = 0},
		heavy = {tased_time = 2, down_time = 0}
	}
	self.tank.weapon = presets.weapon.good
	self.tank.detection = presets.detection.normal
	self.tank.HEALTH_INIT = 200
	self.tank.headshot_dmg_mul = 5
	self.tank.damage.explosion_damage_mul = 1.1
	self.tank.move_speed = presets.move_speed.slow
	self.tank.allowed_stances = {cbt = true}
	self.tank.allowed_poses = {stand = true}
	self.tank.crouch_move = false
	self.tank.no_run_start = true
	self.tank.no_run_stop = true
	self.tank.no_retreat = true
	self.tank.no_arrest = true
	self.tank.surrender = nil
	self.tank.ecm_vulnerability = 0.85
	self.tank.ecm_hurts = {
		ears = {min_duration = 1, max_duration = 3}
	}
	self.tank.weapon_voice = "3"
	self.tank.experience.cable_tie = "tie_swat"
	self.tank.access = "tank"
	self.tank.speech_prefix_p1 = self._prefix_data_p1.bulldozer()
	self.tank.speech_prefix_p2 = nil
	self.tank.speech_prefix_count = nil
	self.tank.spawn_sound_event = self._prefix_data_p1.bulldozer() .. "_entrance"
	self.tank.priority_shout = "f30"
	self.tank.rescue_hostages = false
	self.tank.deathguard = true
	self.tank.melee_weapon = "fists"
	self.tank.melee_weapon_dmg_multiplier = 2
	self.tank.critical_hits = {
		damage_mul = 1
	}
	self.tank.damage.hurt_severity = presets.hurt_severities.no_hurts_no_tase
	self.tank.chatter = {
		aggressive = true,
		retreat = true,
		go_go = true,
		contact = true,
		entrance = true
	}
	self.tank.announce_incomming = "incomming_tank"
	self.tank.steal_loot = nil
	self.tank.calls_in = nil
	self.tank.use_animation_on_fire_damage = false
	self.tank.flammable = true
	self.tank.can_be_tased = false
	self.tank.immune_to_knock_down = true
	self.tank.immune_to_concussion = true
	self.tank_hw = deep_clone(self.tank)
	self.tank_hw.move_speed = {
		stand = {
			walk = {
				ntl = {
					fwd = 72,
					strafe = 60,
					bwd = 56
				},
				hos = {
					fwd = 72,
					strafe = 60,
					bwd = 56
				},
				cbt = {
					fwd = 72,
					strafe = 60,
					bwd = 56
				}
			},
			run = {
				hos = {
					fwd = 72,
					strafe = 70,
					bwd = 56
				},
				cbt = {
					fwd = 72,
					strafe = 50,
					bwd = 60
				}
			}
		},
		crouch = {
			walk = {
				hos = {
					fwd = 72,
					strafe = 60,
					bwd = 56
				},
				cbt = {
					fwd = 72,
					strafe = 60,
					bwd = 56
				}
			},
			run = {
				hos = {
					fwd = 72,
					strafe = 65,
					bwd = 56
				},
				cbt = {
					fwd = 72,
					strafe = 50,
					bwd = 60
				}
			}
		}
	}
	self.tank_hw.HEALTH_INIT = 300
	self.tank_hw.headshot_dmg_mul = 1
	self.tank_hw.ignore_headshot = true
	self.tank_hw.damage.explosion_damage_mul = 0.5
	self.tank_hw.melee_weapon = "helloween"
	self.tank_hw.critical_hits = {
		damage_mul = 1
	}
	self.tank_hw.use_animation_on_fire_damage = false
	self.tank_hw.flammable = true
	self.tank_hw.can_be_tased = false
	self.tank_medic = deep_clone(self.tank)
	table.insert(self.tank_medic.tags, "medic")
	self.tank_mini = deep_clone(self.tank)
	self.tank_mini.move_speed = {
		stand = {
			walk = {
				ntl = {
					fwd = 72,
					strafe = 60,
					bwd = 56
				},
				hos = {
					fwd = 72,
					strafe = 60,
					bwd = 56
				},
				cbt = {
					fwd = 72,
					strafe = 60,
					bwd = 56
				}
			},
			run = {
				hos = {
					fwd = 72,
					strafe = 70,
					bwd = 56
				},
				cbt = {
					fwd = 72,
					strafe = 50,
					bwd = 60
				}
			}
		},
		crouch = {
			walk = {
				hos = {
					fwd = 72,
					strafe = 60,
					bwd = 56
				},
				cbt = {
					fwd = 72,
					strafe = 60,
					bwd = 56
				}
			},
			run = {
				hos = {
					fwd = 72,
					strafe = 65,
					bwd = 56
				},
				cbt = {
					fwd = 72,
					strafe = 50,
					bwd = 60
				}
			}
		}
	}
	self.tank_mini.HEALTH_INIT = 300
	table.insert(self._enemy_list, "tank")
	table.insert(self._enemy_list, "tank_hw")
	table.insert(self._enemy_list, "tank_medic")
	table.insert(self._enemy_list, "tank_mini")
end
function CharacterTweakData:_init_spooc(presets)
	self.spooc = deep_clone(presets.base)
	self.spooc.tags = {"spooc", "special"}
	self.spooc.experience = {}
	self.spooc.weapon = presets.weapon.good
	self.spooc.detection = presets.detection.normal
	self.spooc.HEALTH_INIT = 60
	self.spooc.headshot_dmg_mul = 6
	self.spooc.move_speed = presets.move_speed.lightning
	self.spooc.no_retreat = true
	self.spooc.no_arrest = true
	self.spooc.damage.hurt_severity = presets.hurt_severities.no_hurts_no_tase
	self.spooc.surrender_break_time = {4, 6}
	self.spooc.suppression = nil
	self.spooc.surrender = presets.surrender.special
	self.spooc.priority_shout = "f33"
	self.spooc.priority_shout_max_dis = 700
	self.spooc.rescue_hostages = false
	self.spooc.spooc_attack_timeout = {10, 10}
	self.spooc.spooc_attack_beating_time = {3, 3}
	self.spooc.spooc_attack_use_smoke_chance = 1
	self.spooc.weapon_voice = "3"
	self.spooc.experience.cable_tie = "tie_swat"
	self.spooc.speech_prefix_p1 = self._prefix_data_p1.cloaker()
	self.spooc.speech_prefix_count = nil
	self.spooc.access = "spooc"
	self.spooc.use_animation_on_fire_damage = false
	self.spooc.flammable = true
	self.spooc.can_be_tased = false
	self.spooc.dodge = presets.dodge.ninja
	self.spooc.dodge_with_grenade = {
		smoke = {
			duration = {10, 20}
		}
	}
	function self.spooc.dodge_with_grenade.check(t, nr_grenades_used)
		local delay_till_next_use = math.lerp(17, 45, math.min(1, (nr_grenades_used or 0) / 4))
		local chance = math.lerp(1, 0.5, math.min(1, (nr_grenades_used or 0) / 10))
		if chance > math.random() then
			return true, t + delay_till_next_use
		end
		return false, t + delay_till_next_use
	end
	self.spooc.chatter = presets.enemy_chatter.no_chatter
	self.spooc.steal_loot = nil
	self.spooc.spawn_sound_event = "cloaker_presence_loop"
	self.spooc.die_sound_event = "cloaker_presence_stop"
	table.insert(self._enemy_list, "spooc")
end
function CharacterTweakData:_init_shield(presets)
	self.shield = deep_clone(presets.base)
	self.shield.tags = {"shield", "special"}
	self.shield.experience = {}
	self.shield.weapon = {}
	self.shield.weapon.is_smg = {}
	self.shield.weapon.is_smg.aim_delay = {0, 0.1}
	self.shield.weapon.is_smg.focus_delay = 1
	self.shield.weapon.is_smg.focus_dis = 250
	self.shield.weapon.is_smg.spread = 20
	self.shield.weapon.is_smg.miss_dis = 15
	self.shield.weapon.is_smg.RELOAD_SPEED = 1.2
	self.shield.weapon.is_smg.melee_speed = nil
	self.shield.weapon.is_smg.melee_dmg = nil
	self.shield.weapon.is_smg.melee_retry_delay = nil
	self.shield.weapon.is_smg.range = {
		close = 500,
		optimal = 1200,
		far = 3000
	}
	self.shield.weapon.is_smg.autofire_rounds = {8, 16}
	self.shield.weapon.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.95},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 500,
			acc = {0.5, 0.75},
			dmg_mul = 0.875,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.45, 0.65},
			dmg_mul = 0.75,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 0.75,
			recoil = {0.35, 1.2},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 0.5,
			recoil = {0.35, 1.5},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.shield.weapon.is_pistol = {}
	self.shield.weapon.is_pistol.aim_delay = {0, 0.1}
	self.shield.weapon.is_pistol.focus_delay = 1
	self.shield.weapon.is_pistol.focus_dis = 250
	self.shield.weapon.is_pistol.spread = 20
	self.shield.weapon.is_pistol.miss_dis = 15
	self.shield.weapon.is_pistol.RELOAD_SPEED = 1.2
	self.shield.weapon.is_pistol.melee_speed = nil
	self.shield.weapon.is_pistol.melee_dmg = nil
	self.shield.weapon.is_pistol.melee_retry_delay = nil
	self.shield.weapon.is_pistol.range = {
		close = 500,
		optimal = 1200,
		far = 3000
	}
	self.shield.weapon.is_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.5, 0.9},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.8},
			dmg_mul = 0.75,
			recoil = {0.35, 0.55},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.6},
			dmg_mul = 0.625,
			recoil = {0.35, 0.55},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.15, 0.5},
			dmg_mul = 0.5,
			recoil = {0.35, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0, 0.25},
			dmg_mul = 0.5,
			recoil = {0.35, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.shield.detection = presets.detection.normal
	self.shield.HEALTH_INIT = 8
	self.shield.headshot_dmg_mul = 2
	self.shield.allowed_stances = {cbt = true}
	self.shield.allowed_poses = {crouch = true}
	self.shield.always_face_enemy = true
	self.shield.move_speed = presets.move_speed.very_fast
	self.shield.no_run_start = true
	self.shield.no_run_stop = true
	self.shield.no_retreat = true
	self.shield.no_arrest = true
	self.shield.surrender = nil
	self.shield.ecm_vulnerability = 0.9
	self.shield.ecm_hurts = {
		ears = {min_duration = 7, max_duration = 9}
	}
	self.shield.priority_shout = "f31"
	self.shield.rescue_hostages = false
	self.shield.deathguard = false
	self.shield.no_equip_anim = true
	self.shield.wall_fwd_offset = 100
	self.shield.damage.explosion_damage_mul = 0.8
	self.shield.calls_in = nil
	self.shield.ignore_medic_revive_animation = true
	self.shield.damage.hurt_severity = presets.hurt_severities.no_hurts
	self.shield.damage.shield_knocked = true
	self.shield.immune_to_knock_down = true
	self.shield.use_animation_on_fire_damage = false
	self.shield.flammable = true
	self.shield.weapon_voice = "3"
	self.shield.experience.cable_tie = "tie_swat"
	self.shield.speech_prefix_p1 = "l"
	self.shield.speech_prefix_p2 = self._speech_prefix_p2
	self.shield.speech_prefix_count = 4
	self.shield.access = "shield"
	self.shield.chatter = presets.enemy_chatter.shield
	self.shield.announce_incomming = "incomming_shield"
	self.shield.steal_loot = nil
	table.insert(self._enemy_list, "shield")
end
function CharacterTweakData:_init_phalanx_minion(presets)
	self.phalanx_minion = deep_clone(self.shield)
	self.phalanx_minion.experience = {}
	self.phalanx_minion.weapon = {}
	self.phalanx_minion.weapon.is_smg = {}
	self.phalanx_minion.weapon.is_smg.aim_delay = {0, 0.1}
	self.phalanx_minion.weapon.is_smg.focus_delay = 1
	self.phalanx_minion.weapon.is_smg.focus_dis = 250
	self.phalanx_minion.weapon.is_smg.spread = 20
	self.phalanx_minion.weapon.is_smg.miss_dis = 15
	self.phalanx_minion.weapon.is_smg.RELOAD_SPEED = 1.2
	self.phalanx_minion.weapon.is_smg.melee_speed = nil
	self.phalanx_minion.weapon.is_smg.melee_dmg = nil
	self.phalanx_minion.weapon.is_smg.melee_retry_delay = nil
	self.phalanx_minion.weapon.is_smg.range = {
		close = 500,
		optimal = 1200,
		far = 3000
	}
	self.phalanx_minion.weapon.is_smg.autofire_rounds = {8, 16}
	self.phalanx_minion.weapon.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.95},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 500,
			acc = {0.5, 0.75},
			dmg_mul = 0.875,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.45, 0.65},
			dmg_mul = 0.75,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 0.75,
			recoil = {0.35, 1.2},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 0.5,
			recoil = {0.35, 1.5},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.phalanx_minion.detection = presets.detection.normal
	self.phalanx_minion.headshot_dmg_mul = 5
	self.phalanx_minion.HEALTH_INIT = 150
	self.phalanx_minion.DAMAGE_CLAMP_BULLET = 70
	self.phalanx_minion.DAMAGE_CLAMP_EXPLOSION = 30
	self.phalanx_minion.damage.explosion_damage_mul = 0.1
	self.phalanx_minion.damage.fire_damage_mul = 0.1
	self.phalanx_minion.damage.hurt_severity = presets.hurt_severities.no_hurts_no_tase
	self.phalanx_minion.damage.shield_knocked = false
	self.phalanx_minion.damage.immune_to_knockback = true
	self.phalanx_minion.immune_to_knock_down = true
	self.phalanx_minion.immune_to_concussion = true
	self.phalanx_minion.ignore_medic_revive_animation = true
	self.phalanx_minion.ecm_vulnerability = 1
	self.phalanx_minion.ecm_hurts = {
		ears = {min_duration = 2, max_duration = 3}
	}
	self.phalanx_minion.priority_shout = "f31"
	table.insert(self._enemy_list, "phalanx_minion")
end
function CharacterTweakData:_init_phalanx_vip(presets)
	self.phalanx_vip = deep_clone(self.phalanx_minion)
	self.phalanx_vip.experience = {}
	self.phalanx_vip.weapon = {}
	self.phalanx_vip.weapon.is_smg = {}
	self.phalanx_vip.weapon.is_smg.aim_delay = {0, 0.1}
	self.phalanx_vip.weapon.is_smg.focus_delay = 1
	self.phalanx_vip.weapon.is_smg.focus_dis = 250
	self.phalanx_vip.weapon.is_smg.spread = 20
	self.phalanx_vip.weapon.is_smg.miss_dis = 15
	self.phalanx_vip.weapon.is_smg.RELOAD_SPEED = 1.2
	self.phalanx_vip.weapon.is_smg.melee_speed = nil
	self.phalanx_vip.weapon.is_smg.melee_dmg = nil
	self.phalanx_vip.weapon.is_smg.melee_retry_delay = nil
	self.phalanx_vip.weapon.is_smg.range = {
		close = 500,
		optimal = 1200,
		far = 3000
	}
	self.phalanx_vip.weapon.is_smg.autofire_rounds = {8, 16}
	self.phalanx_vip.weapon.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.95},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 500,
			acc = {0.5, 0.75},
			dmg_mul = 0.875,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.45, 0.65},
			dmg_mul = 0.75,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 0.75,
			recoil = {0.35, 1.2},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 0.5,
			recoil = {0.35, 1.5},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.phalanx_vip.LOWER_HEALTH_PERCENTAGE_LIMIT = 1
	self.phalanx_vip.FINAL_LOWER_HEALTH_PERCENTAGE_LIMIT = 0.2
	self.phalanx_vip.HEALTH_INIT = 300
	self.phalanx_vip.DAMAGE_CLAMP_BULLET = 50
	self.phalanx_vip.DAMAGE_CLAMP_EXPLOSION = 30
	self.phalanx_vip.can_be_tased = false
	self.phalanx_vip.immune_to_knock_down = true
	self.phalanx_vip.immune_to_concussion = true
	self.phalanx_vip.ecm_vulnerability = 0
	self.phalanx_vip.ecm_hurts = {
		ears = {min_duration = 0, max_duration = 0}
	}
	self.phalanx_vip.priority_shout = "f45"
	table.insert(self._enemy_list, "phalanx_vip")
end
function CharacterTweakData:_init_taser(presets)
	self.taser = deep_clone(presets.base)
	self.taser.tags = {"taser", "special"}
	self.taser.experience = {}
	self.taser.weapon = {}
	self.taser.weapon.is_rifle = {
		aim_delay = {0.1, 0.1},
		focus_delay = 3,
		focus_dis = 200,
		spread = 20,
		miss_dis = 40,
		RELOAD_SPEED = 1.2,
		melee_speed = 1,
		melee_dmg = 15,
		melee_retry_delay = {1, 2},
		tase_distance = 1500,
		tase_sphere_cast_radius = 30,
		aim_delay_tase = {0, 0},
		range = {
			close = 1000,
			optimal = 2000,
			far = 5000
		},
		autofire_rounds = presets.weapon.normal.is_rifle.autofire_rounds,
		FALLOFF = {
			{
				r = 100,
				acc = {0.6, 0.9},
				dmg_mul = 0.66,
				recoil = {0.4, 0.8},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				r = 500,
				acc = {0.4, 0.9},
				dmg_mul = 0.44,
				recoil = {0.45, 0.8},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				r = 1000,
				acc = {0.2, 0.8},
				dmg_mul = 0.33,
				recoil = {0.35, 0.75},
				mode = {
					1,
					2,
					2,
					0
				}
			},
			{
				r = 2000,
				acc = {0.2, 0.5},
				dmg_mul = 0.28,
				recoil = {0.4, 1.2},
				mode = {
					3,
					2,
					2,
					0
				}
			},
			{
				r = 3000,
				acc = {0.01, 0.35},
				dmg_mul = 0.22,
				recoil = {1.5, 3},
				mode = {
					3,
					1,
					1,
					0
				}
			}
		}
	}
	self.taser.detection = presets.detection.normal
	self.taser.HEALTH_INIT = 30
	self.taser.headshot_dmg_mul = 2
	self.taser.move_speed = presets.move_speed.fast
	self.taser.no_retreat = true
	self.taser.no_arrest = true
	self.taser.surrender = presets.surrender.special
	self.taser.ecm_vulnerability = 0.9
	self.taser.ecm_hurts = {
		ears = {min_duration = 6, max_duration = 8}
	}
	self.taser.surrender_break_time = {4, 6}
	self.taser.suppression = nil
	self.taser.weapon_voice = "3"
	self.taser.experience.cable_tie = "tie_swat"
	self.taser.speech_prefix_p1 = self._prefix_data_p1.taser()
	self.taser.speech_prefix_p2 = nil
	self.taser.speech_prefix_count = nil
	self.taser.spawn_sound_event = self._prefix_data_p1.taser() .. "_entrance"
	self.taser.access = "taser"
	self.taser.dodge = presets.dodge.athletic
	self.taser.priority_shout = "f32"
	self.taser.rescue_hostages = false
	self.taser.deathguard = true
	self.taser.chatter = {
		aggressive = true,
		retreat = true,
		go_go = true,
		contact = true,
		entrance = true
	}
	self.taser.announce_incomming = "incomming_taser"
	self.taser.steal_loot = nil
	self.taser.special_deaths = {}
	self.taser.special_deaths.bullet = {
		[("head"):id():key()] = {
			character_name = "bodhi",
			weapon_id = "model70",
			sequence = "kill_tazer_headshot",
			special_comment = "x01"
		}
	}
	table.insert(self._enemy_list, "taser")
end
function CharacterTweakData:_init_old_hoxton_mission(presets)
	self.old_hoxton_mission = deep_clone(presets.base)
	self.old_hoxton_mission.experience = {}
	self.old_hoxton_mission.weapon = presets.weapon.gang_member
	self.old_hoxton_mission.detection = presets.detection.normal
	self.old_hoxton_mission.HEALTH_INIT = 8
	self.old_hoxton_mission.headshot_dmg_mul = 2
	self.old_hoxton_mission.move_speed = presets.move_speed.fast
	self.old_hoxton_mission.surrender_break_time = {
		6,
		10
	}
	self.old_hoxton_mission.suppression = presets.suppression.hard_def
	self.old_hoxton_mission.suppression.panic_chance_mul = 0
	self.old_hoxton_mission.surrender = false
	self.old_hoxton_mission.weapon_voice = "1"
	self.old_hoxton_mission.experience.cable_tie = "tie_swat"
	self.old_hoxton_mission.speech_prefix_p1 = "rb2"
	self.old_hoxton_mission.access = "teamAI4"
	self.old_hoxton_mission.dodge = presets.dodge.athletic
	self.old_hoxton_mission.no_arrest = true
	self.old_hoxton_mission.chatter = presets.enemy_chatter.no_chatter
	self.old_hoxton_mission.melee_weapon = "fists"
	self.old_hoxton_mission.melee_weapon_dmg_multiplier = 3
	self.old_hoxton_mission.steal_loot = false
	self.old_hoxton_mission.rescue_hostages = false
end
function CharacterTweakData:_init_russian(presets)
	self.russian = {}
	self.russian.damage = presets.gang_member_damage
	self.russian.weapon = presets.weapon.gang_member
	self.russian.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.russian.detection = presets.detection.gang_member
	self.russian.move_speed = presets.move_speed.very_fast_bot
	self.russian.crouch_move = false
	self.russian.allowed_poses = {stand = true}
	self.russian.speech_prefix = "rb2"
	self.russian.weapon_voice = "1"
	self.russian.access = "teamAI1"
	self.russian.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_german(presets)
	self.german = {}
	self.german.damage = presets.gang_member_damage
	self.german.weapon = presets.weapon.gang_member
	self.german.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.german.detection = presets.detection.gang_member
	self.german.move_speed = presets.move_speed.very_fast_bot
	self.german.crouch_move = false
	self.german.allowed_poses = {stand = true}
	self.german.speech_prefix = "rb2"
	self.german.weapon_voice = "2"
	self.german.access = "teamAI1"
	self.german.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_spanish(presets)
	self.spanish = {}
	self.spanish.damage = presets.gang_member_damage
	self.spanish.weapon = presets.weapon.gang_member
	self.spanish.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.spanish.detection = presets.detection.gang_member
	self.spanish.move_speed = presets.move_speed.very_fast_bot
	self.spanish.crouch_move = false
	self.spanish.allowed_poses = {stand = true}
	self.spanish.speech_prefix = "rb2"
	self.spanish.weapon_voice = "3"
	self.spanish.access = "teamAI1"
	self.spanish.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_american(presets)
	self.american = {}
	self.american.damage = presets.gang_member_damage
	self.american.weapon = presets.weapon.gang_member
	self.american.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.american.detection = presets.detection.gang_member
	self.american.move_speed = presets.move_speed.very_fast_bot
	self.american.crouch_move = false
	self.american.allowed_poses = {stand = true}
	self.american.speech_prefix = "rb2"
	self.american.weapon_voice = "3"
	self.american.access = "teamAI1"
	self.american.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_jowi(presets)
	self.jowi = {}
	self.jowi.damage = presets.gang_member_damage
	self.jowi.weapon = presets.weapon.gang_member
	self.jowi.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.jowi.detection = presets.detection.gang_member
	self.jowi.move_speed = presets.move_speed.very_fast_bot
	self.jowi.crouch_move = false
	self.jowi.allowed_poses = {stand = true}
	self.jowi.speech_prefix = "rb2"
	self.jowi.weapon_voice = "3"
	self.jowi.access = "teamAI1"
	self.jowi.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_old_hoxton(presets)
	self.old_hoxton = {}
	self.old_hoxton.damage = presets.gang_member_damage
	self.old_hoxton.weapon = presets.weapon.gang_member
	self.old_hoxton.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.old_hoxton.detection = presets.detection.gang_member
	self.old_hoxton.move_speed = presets.move_speed.very_fast_bot
	self.old_hoxton.crouch_move = false
	self.old_hoxton.allowed_poses = {stand = true}
	self.old_hoxton.speech_prefix = "rb2"
	self.old_hoxton.weapon_voice = "3"
	self.old_hoxton.access = "teamAI1"
	self.old_hoxton.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_clover(presets)
	self.female_1 = {}
	self.female_1.damage = presets.gang_member_damage
	self.female_1.weapon = presets.weapon.gang_member
	self.female_1.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.female_1.detection = presets.detection.gang_member
	self.female_1.move_speed = presets.move_speed.very_fast_bot
	self.female_1.crouch_move = false
	self.female_1.allowed_poses = {stand = true}
	self.female_1.speech_prefix = "rb7"
	self.female_1.weapon_voice = "3"
	self.female_1.access = "teamAI1"
	self.female_1.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_dragan(presets)
	self.dragan = {}
	self.dragan.damage = presets.gang_member_damage
	self.dragan.weapon = presets.weapon.gang_member
	self.dragan.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.dragan.detection = presets.detection.gang_member
	self.dragan.move_speed = presets.move_speed.very_fast_bot
	self.dragan.crouch_move = false
	self.dragan.allowed_poses = {stand = true}
	self.dragan.speech_prefix = "rb8"
	self.dragan.weapon_voice = "3"
	self.dragan.access = "teamAI1"
	self.dragan.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_jacket(presets)
	self.jacket = {}
	self.jacket.damage = presets.gang_member_damage
	self.jacket.weapon = presets.weapon.gang_member
	self.jacket.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.jacket.detection = presets.detection.gang_member
	self.jacket.move_speed = presets.move_speed.very_fast_bot
	self.jacket.crouch_move = false
	self.jacket.allowed_poses = {stand = true}
	self.jacket.speech_prefix = "rb9"
	self.jacket.weapon_voice = "3"
	self.jacket.access = "teamAI1"
	self.jacket.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_bonnie(presets)
	self.bonnie = {}
	self.bonnie.damage = presets.gang_member_damage
	self.bonnie.weapon = presets.weapon.gang_member
	self.bonnie.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.bonnie.detection = presets.detection.gang_member
	self.bonnie.move_speed = presets.move_speed.very_fast_bot
	self.bonnie.crouch_move = false
	self.bonnie.allowed_poses = {stand = true}
	self.bonnie.speech_prefix = "rb10"
	self.bonnie.weapon_voice = "3"
	self.bonnie.access = "teamAI1"
	self.bonnie.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_sokol(presets)
	self.sokol = {}
	self.sokol.damage = presets.gang_member_damage
	self.sokol.weapon = presets.weapon.gang_member
	self.sokol.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.sokol.detection = presets.detection.gang_member
	self.sokol.move_speed = presets.move_speed.very_fast_bot
	self.sokol.crouch_move = false
	self.sokol.allowed_poses = {stand = true}
	self.sokol.speech_prefix = "rb11"
	self.sokol.weapon_voice = "3"
	self.sokol.access = "teamAI1"
	self.sokol.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_dragon(presets)
	self.dragon = {}
	self.dragon.damage = presets.gang_member_damage
	self.dragon.weapon = presets.weapon.gang_member
	self.dragon.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.dragon.detection = presets.detection.gang_member
	self.dragon.move_speed = presets.move_speed.very_fast_bot
	self.dragon.crouch_move = false
	self.dragon.allowed_poses = {stand = true}
	self.dragon.speech_prefix = "rb12"
	self.dragon.weapon_voice = "3"
	self.dragon.access = "teamAI1"
	self.dragon.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_bodhi(presets)
	self.bodhi = {}
	self.bodhi.damage = presets.gang_member_damage
	self.bodhi.weapon = presets.weapon.gang_member
	self.bodhi.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.bodhi.detection = presets.detection.gang_member
	self.bodhi.move_speed = presets.move_speed.very_fast_bot
	self.bodhi.crouch_move = false
	self.bodhi.allowed_poses = {stand = true}
	self.bodhi.speech_prefix = "rb13"
	self.bodhi.weapon_voice = "3"
	self.bodhi.access = "teamAI1"
	self.bodhi.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_jimmy(presets)
	self.jimmy = {}
	self.jimmy.damage = presets.gang_member_damage
	self.jimmy.weapon = presets.weapon.gang_member
	self.jimmy.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.jimmy.detection = presets.detection.gang_member
	self.jimmy.move_speed = presets.move_speed.very_fast_bot
	self.jimmy.crouch_move = false
	self.jimmy.allowed_poses = {stand = true}
	self.jimmy.speech_prefix = "rb14"
	self.jimmy.weapon_voice = "3"
	self.jimmy.access = "teamAI1"
	self.jimmy.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_sydney(presets)
	self.sydney = {}
	self.sydney.damage = presets.gang_member_damage
	self.sydney.weapon = presets.weapon.gang_member
	self.sydney.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.sydney.detection = presets.detection.gang_member
	self.sydney.move_speed = presets.move_speed.very_fast_bot
	self.sydney.crouch_move = false
	self.sydney.allowed_poses = {stand = true}
	self.sydney.speech_prefix = "rb15"
	self.sydney.weapon_voice = "3"
	self.sydney.access = "teamAI1"
	self.sydney.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_wild(presets)
	self.wild = {}
	self.wild.damage = presets.gang_member_damage
	self.wild.weapon = presets.weapon.gang_member
	self.wild.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.wild.detection = presets.detection.gang_member
	self.wild.move_speed = presets.move_speed.very_fast_bot
	self.wild.crouch_move = false
	self.wild.allowed_poses = {stand = true}
	self.wild.speech_prefix = "rb16"
	self.wild.weapon_voice = "3"
	self.wild.access = "teamAI1"
	self.wild.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_chico(presets)
	self.chico = {}
	self.chico.damage = presets.gang_member_damage
	self.chico.weapon = presets.weapon.gang_member
	self.chico.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.chico.detection = presets.detection.gang_member
	self.chico.move_speed = presets.move_speed.very_fast_bot
	self.chico.crouch_move = false
	self.chico.allowed_poses = {stand = true}
	self.chico.speech_prefix = "rb17"
	self.chico.weapon_voice = "3"
	self.chico.access = "teamAI1"
	self.chico.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_max(presets)
	self.max = {}
	self.max.damage = presets.gang_member_damage
	self.max.weapon = presets.weapon.gang_member
	self.max.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.max.detection = presets.detection.gang_member
	self.max.move_speed = presets.move_speed.very_fast_bot
	self.max.crouch_move = false
	self.max.allowed_poses = {stand = true}
	self.max.speech_prefix = "rb18"
	self.max.weapon_voice = "3"
	self.max.access = "teamAI1"
	self.max.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_myh(presets)
	self.myh = {}
	self.myh.damage = presets.gang_member_damage
	self.myh.weapon = presets.weapon.gang_member
	self.myh.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.myh.detection = presets.detection.gang_member
	self.myh.move_speed = presets.move_speed.very_fast_bot
	self.myh.crouch_move = false
	self.myh.allowed_poses = {stand = true}
	self.myh.speech_prefix = "rb22"
	self.myh.weapon_voice = "3"
	self.myh.access = "teamAI1"
	self.myh.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_ecp(presets)
	self.ecp_female = {}
	self.ecp_female.damage = presets.gang_member_damage
	self.ecp_female.weapon = presets.weapon.gang_member
	self.ecp_female.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.ecp_female.detection = presets.detection.gang_member
	self.ecp_female.move_speed = presets.move_speed.very_fast_bot
	self.ecp_female.crouch_move = false
	self.ecp_female.allowed_poses = {stand = true}
	self.ecp_female.speech_prefix = "rb21"
	self.ecp_female.weapon_voice = "3"
	self.ecp_female.access = "teamAI1"
	self.ecp_female.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
	self.ecp_male = {}
	self.ecp_male.damage = presets.gang_member_damage
	self.ecp_male.weapon = presets.weapon.gang_member
	self.ecp_male.weapon.weapons_of_choice = {
		primary = "wpn_fps_ass_m4_npc",
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.ecp_male.detection = presets.detection.gang_member
	self.ecp_male.move_speed = presets.move_speed.very_fast_bot
	self.ecp_male.crouch_move = false
	self.ecp_male.allowed_poses = {stand = true}
	self.ecp_male.speech_prefix = "rb20"
	self.ecp_male.weapon_voice = "3"
	self.ecp_male.access = "teamAI1"
	self.ecp_male.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_presets(tweak_data)
	local presets = {}
	presets.hurt_severities = {}
	presets.hurt_severities.no_hurts = {
		bullet = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		explosion = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		melee = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		fire = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		poison = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		tase = true
	}
	presets.hurt_severities.no_hurts_no_tase = deep_clone(presets.hurt_severities.no_hurts)
	presets.hurt_severities.no_hurts_no_tase.tase = false
	presets.hurt_severities.only_light_hurt = {
		bullet = {
			health_reference = 1,
			zones = {
				{light = 1}
			}
		},
		explosion = {
			health_reference = "current",
			zones = {
				{
					health_limit = 0.2,
					none = 0.6,
					heavy = 0.4
				},
				{
					health_limit = 0.5,
					heavy = 0.6,
					explode = 0.4
				},
				{heavy = 0.2, explode = 0.8}
			}
		},
		melee = {
			health_reference = "current",
			zones = {
				{
					health_limit = 0.1,
					none = 0.3,
					light = 0.7,
					moderate = 0,
					heavy = 0
				},
				{
					health_limit = 0.3,
					light = 0.6,
					moderate = 0,
					heavy = 0.4
				},
				{
					health_limit = 0.5,
					light = 0.2,
					moderate = 0,
					heavy = 0.8
				},
				{
					light = 0,
					moderate = 0,
					heavy = 1
				}
			}
		},
		fire = {
			health_reference = 1,
			zones = {
				{light = 1}
			}
		},
		poison = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		tase = true
	}
	presets.hurt_severities.only_light_hurt_and_fire = {
		bullet = {
			health_reference = 1,
			zones = {
				{light = 1}
			}
		},
		explosion = {
			health_reference = "current",
			zones = {
				{
					health_limit = 0.2,
					none = 0.6,
					heavy = 0.4
				},
				{
					health_limit = 0.5,
					heavy = 0.6,
					explode = 0.4
				},
				{heavy = 0.2, explode = 0.8}
			}
		},
		melee = {
			health_reference = "current",
			zones = {
				{
					health_limit = 0.1,
					none = 0.3,
					light = 0.7,
					moderate = 0,
					heavy = 0
				},
				{
					health_limit = 0.3,
					light = 0.6,
					moderate = 0,
					heavy = 0.4
				},
				{
					health_limit = 0.5,
					light = 0.2,
					moderate = 0,
					heavy = 0.8
				},
				{
					light = 0,
					moderate = 0,
					heavy = 1
				}
			}
		},
		fire = {
			health_reference = 1,
			zones = {
				{fire = 1}
			}
		},
		poison = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		tase = true
	}
	presets.hurt_severities.light_hurt_fire_poison = deep_clone(presets.hurt_severities.only_light_hurt_and_fire)
	presets.hurt_severities.light_hurt_fire_poison.poison = {
		health_reference = 1,
		zones = {
			{poison = 1}
		}
	}
	presets.hurt_severities.only_explosion_hurts = {
		bullet = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		explosion = {
			health_reference = 1,
			zones = {
				{explode = 1}
			}
		},
		melee = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		fire = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		poison = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		tase = true
	}
	presets.hurt_severities.only_fire_and_poison_hurts = {
		bullet = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		explosion = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		melee = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		fire = {
			health_reference = 1,
			zones = {
				{fire = 1}
			}
		},
		poison = {
			health_reference = 1,
			zones = {
				{poison = 1}
			}
		},
		tase = true
	}
	presets.hurt_severities.base = {
		bullet = {
			health_reference = "current",
			zones = {
				{
					health_limit = 0.3,
					none = 0.2,
					light = 0.7,
					moderate = 0.05,
					heavy = 0.05
				},
				{
					health_limit = 0.6,
					light = 0.4,
					moderate = 0.4,
					heavy = 0.2
				},
				{
					health_limit = 0.9,
					light = 0.2,
					moderate = 0.2,
					heavy = 0.6
				},
				{
					light = 0,
					moderate = 0,
					heavy = 1
				}
			}
		},
		explosion = {
			health_reference = "current",
			zones = {
				{
					health_limit = 0.2,
					none = 0.6,
					heavy = 0.4
				},
				{
					health_limit = 0.5,
					heavy = 0.6,
					explode = 0.4
				},
				{heavy = 0.2, explode = 0.8}
			}
		},
		melee = {
			health_reference = "current",
			zones = {
				{
					health_limit = 0.1,
					none = 0.3,
					light = 0.7,
					moderate = 0,
					heavy = 0
				},
				{
					health_limit = 0.3,
					light = 0.6,
					moderate = 0,
					heavy = 0.4
				},
				{
					health_limit = 0.5,
					light = 0.2,
					moderate = 0,
					heavy = 0.8
				},
				{
					light = 0,
					moderate = 0,
					heavy = 1
				}
			}
		},
		fire = {
			health_reference = "current",
			zones = {
				{fire = 1}
			}
		},
		poison = {
			health_reference = "current",
			zones = {
				{none = 0, poison = 1}
			}
		}
	}
	presets.hurt_severities.base_no_poison = deep_clone(presets.hurt_severities.base)
	presets.hurt_severities.base_no_poison.poison = {
		health_reference = 1,
		zones = {
			{none = 1}
		}
	}
	presets.base = {}
	presets.base.HEALTH_INIT = 2.5
	presets.base.headshot_dmg_mul = 2
	presets.base.SPEED_WALK = {
		ntl = 120,
		hos = 180,
		cbt = 160,
		pnc = 160
	}
	presets.base.SPEED_RUN = 370
	presets.base.crouch_move = true
	presets.base.shooting_death = true
	presets.base.suspicious = true
	presets.base.surrender_break_time = {20, 30}
	presets.base.submission_max = {45, 60}
	presets.base.submission_intimidate = 15
	presets.base.speech_prefix = "po"
	presets.base.speech_prefix_count = 1
	presets.base.rescue_hostages = true
	presets.base.use_radio = self._default_chatter
	presets.base.dodge = nil
	presets.base.challenges = {type = "law"}
	presets.base.calls_in = true
	presets.base.ignore_medic_revive_animation = false
	presets.base.spotlight_important = false
	presets.base.experience = {}
	presets.base.experience.cable_tie = "tie_swat"
	presets.base.damage = {}
	presets.base.damage.hurt_severity = presets.hurt_severities.base
	presets.base.damage.death_severity = 0.5
	presets.base.damage.explosion_damage_mul = 1
	presets.base.damage.tased_response = {
		light = {tased_time = 5, down_time = 5},
		heavy = {tased_time = 5, down_time = 10}
	}
	presets.gang_member_damage = {}
	presets.gang_member_damage.HEALTH_INIT = 75
	presets.gang_member_damage.REGENERATE_TIME = 2
	presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.2
	presets.gang_member_damage.DOWNED_TIME = tweak_data.player.damage.DOWNED_TIME
	presets.gang_member_damage.TASED_TIME = tweak_data.player.damage.TASED_TIME
	presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 18.75
	presets.gang_member_damage.ARRESTED_TIME = tweak_data.player.damage.ARRESTED_TIME
	presets.gang_member_damage.INCAPACITATED_TIME = tweak_data.player.damage.INCAPACITATED_TIME
	presets.gang_member_damage.hurt_severity = deep_clone(presets.hurt_severities.base)
	presets.gang_member_damage.hurt_severity.bullet = {
		health_reference = "current",
		zones = {
			{
				health_limit = 0.4,
				none = 1,
				light = 0,
				moderate = 0
			},
			{
				health_limit = 0.7,
				none = 1,
				light = 0,
				moderate = 0
			},
			{
				none = 1,
				light = 0,
				moderate = 0,
				heavy = 0
			}
		}
	}
	presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.45
	presets.gang_member_damage.respawn_time_penalty = 0
	presets.gang_member_damage.base_respawn_time_penalty = 5
	presets.weapon = {}
	presets.weapon.normal = {}
	presets.weapon.normal.is_pistol = {}
	presets.weapon.normal.is_pistol.aim_delay = {0.1, 0.1}
	presets.weapon.normal.is_pistol.focus_delay = 10
	presets.weapon.normal.is_pistol.focus_dis = 200
	presets.weapon.normal.is_pistol.spread = 20
	presets.weapon.normal.is_pistol.miss_dis = 30
	presets.weapon.normal.is_pistol.RELOAD_SPEED = 0.9
	presets.weapon.normal.is_pistol.melee_speed = 1
	presets.weapon.normal.is_pistol.melee_dmg = 8
	presets.weapon.normal.is_pistol.melee_retry_delay = {1, 2}
	presets.weapon.normal.is_pistol.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.is_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.1, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.85},
			dmg_mul = 0.5,
			recoil = {0.1, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 0.33,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.45},
			dmg_mul = 0.33,
			recoil = {0.3, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.33,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.normal.akimbo_pistol = {}
	presets.weapon.normal.akimbo_pistol.aim_delay = {0.1, 0.1}
	presets.weapon.normal.akimbo_pistol.focus_delay = 10
	presets.weapon.normal.akimbo_pistol.focus_dis = 200
	presets.weapon.normal.akimbo_pistol.spread = 20
	presets.weapon.normal.akimbo_pistol.miss_dis = 50
	presets.weapon.normal.akimbo_pistol.RELOAD_SPEED = 0.9
	presets.weapon.normal.akimbo_pistol.melee_speed = 1
	presets.weapon.normal.akimbo_pistol.melee_dmg = 8
	presets.weapon.normal.akimbo_pistol.melee_retry_delay = {1, 2}
	presets.weapon.normal.akimbo_pistol.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.akimbo_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.15, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.85},
			dmg_mul = 0.5,
			recoil = {0.15, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 0.33,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.45},
			dmg_mul = 0.33,
			recoil = {0.3, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.33,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.normal.is_rifle = {}
	presets.weapon.normal.is_rifle.aim_delay = {0.1, 0.1}
	presets.weapon.normal.is_rifle.focus_delay = 10
	presets.weapon.normal.is_rifle.focus_dis = 200
	presets.weapon.normal.is_rifle.spread = 20
	presets.weapon.normal.is_rifle.miss_dis = 40
	presets.weapon.normal.is_rifle.RELOAD_SPEED = 0.9
	presets.weapon.normal.is_rifle.melee_speed = 1
	presets.weapon.normal.is_rifle.melee_dmg = 8
	presets.weapon.normal.is_rifle.melee_retry_delay = {1, 2}
	presets.weapon.normal.is_rifle.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.is_rifle.autofire_rounds = {6, 12}
	presets.weapon.normal.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 0.66,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.8},
			dmg_mul = 0.33,
			recoil = {0.35, 0.75},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 0.33,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.33,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	presets.weapon.normal.is_bullpup = presets.weapon.normal.is_rifle
	presets.weapon.normal.is_shotgun_pump = {}
	presets.weapon.normal.is_shotgun_pump.aim_delay = {0.1, 0.1}
	presets.weapon.normal.is_shotgun_pump.focus_delay = 10
	presets.weapon.normal.is_shotgun_pump.focus_dis = 200
	presets.weapon.normal.is_shotgun_pump.spread = 15
	presets.weapon.normal.is_shotgun_pump.miss_dis = 20
	presets.weapon.normal.is_shotgun_pump.RELOAD_SPEED = 0.9
	presets.weapon.normal.is_shotgun_pump.melee_speed = 1
	presets.weapon.normal.is_shotgun_pump.melee_dmg = 8
	presets.weapon.normal.is_shotgun_pump.melee_retry_delay = {1, 2}
	presets.weapon.normal.is_shotgun_pump.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 0.66,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.75},
			dmg_mul = 0.66,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.01, 0.25},
			dmg_mul = 0.166,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.05, 0.35},
			dmg_mul = 0.166,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.normal.is_shotgun_mag = {}
	presets.weapon.normal.is_shotgun_mag.aim_delay = {0.1, 0.1}
	presets.weapon.normal.is_shotgun_mag.focus_delay = 10
	presets.weapon.normal.is_shotgun_mag.focus_dis = 200
	presets.weapon.normal.is_shotgun_mag.spread = 20
	presets.weapon.normal.is_shotgun_mag.miss_dis = 40
	presets.weapon.normal.is_shotgun_mag.RELOAD_SPEED = 0.9
	presets.weapon.normal.is_shotgun_mag.melee_speed = 1
	presets.weapon.normal.is_shotgun_mag.melee_dmg = 8
	presets.weapon.normal.is_shotgun_mag.melee_retry_delay = {1, 2}
	presets.weapon.normal.is_shotgun_mag.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.is_shotgun_mag.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.6, 0.9},
			dmg_mul = 0.85,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.8},
			dmg_mul = 0.55,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.55},
			dmg_mul = 0.15,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 0.15,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.normal.is_smg = {}
	presets.weapon.normal.is_smg.aim_delay = {0.1, 0.1}
	presets.weapon.normal.is_smg.focus_delay = 10
	presets.weapon.normal.is_smg.focus_dis = 200
	presets.weapon.normal.is_smg.spread = 20
	presets.weapon.normal.is_smg.miss_dis = 20
	presets.weapon.normal.is_smg.RELOAD_SPEED = 0.9
	presets.weapon.normal.is_smg.melee_speed = 1
	presets.weapon.normal.is_smg.melee_dmg = 8
	presets.weapon.normal.is_smg.melee_retry_delay = {1, 2}
	presets.weapon.normal.is_smg.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.is_smg.autofire_rounds = {8, 16}
	presets.weapon.normal.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.1, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 0.66,
			recoil = {0.1, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.8},
			dmg_mul = 0.33,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.45},
			dmg_mul = 0.33,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 0.33,
			recoil = {0.5, 0.6},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.normal.is_revolver = {}
	presets.weapon.normal.is_revolver.aim_delay = {0.1, 0.1}
	presets.weapon.normal.is_revolver.focus_delay = 10
	presets.weapon.normal.is_revolver.focus_dis = 200
	presets.weapon.normal.is_revolver.spread = 20
	presets.weapon.normal.is_revolver.miss_dis = 50
	presets.weapon.normal.is_revolver.RELOAD_SPEED = 0.9
	presets.weapon.normal.is_revolver.melee_speed = 1
	presets.weapon.normal.is_revolver.melee_dmg = 8
	presets.weapon.normal.is_revolver.melee_retry_delay = {1, 2}
	presets.weapon.normal.is_revolver.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.is_revolver.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.85},
			dmg_mul = 0.5,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 0.33,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.45},
			dmg_mul = 0.25,
			recoil = {1, 1.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.166,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.normal.mini = {}
	presets.weapon.normal.mini.aim_delay = {0.1, 0.1}
	presets.weapon.normal.mini.focus_delay = 10
	presets.weapon.normal.mini.focus_dis = 800
	presets.weapon.normal.mini.spread = 28
	presets.weapon.normal.mini.miss_dis = 40
	presets.weapon.normal.mini.RELOAD_SPEED = 0.5
	presets.weapon.normal.mini.melee_speed = nil
	presets.weapon.normal.mini.melee_dmg = nil
	presets.weapon.normal.mini.melee_retry_delay = nil
	presets.weapon.normal.mini.range = {
		close = 3000,
		optimal = 7500,
		far = 15000
	}
	presets.weapon.normal.mini.autofire_rounds = {500, 700}
	presets.weapon.normal.mini.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {500, 700}
		},
		{
			r = 500,
			acc = {0.5, 0.7},
			dmg_mul = 0.8,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {500, 500}
		},
		{
			r = 1000,
			acc = {0.4, 0.6},
			dmg_mul = 0.7,
			recoil = {0.45, 0.8},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {300, 500}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 0.6,
			recoil = {0.45, 0.8},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {100, 300}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 0.6,
			recoil = {1, 1.2},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {40, 100}
		}
	}
	presets.weapon.normal.is_lmg = {}
	presets.weapon.normal.is_lmg.aim_delay = {0.1, 0.1}
	presets.weapon.normal.is_lmg.focus_delay = 10
	presets.weapon.normal.is_lmg.focus_dis = 200
	presets.weapon.normal.is_lmg.spread = 24
	presets.weapon.normal.is_lmg.miss_dis = 40
	presets.weapon.normal.is_lmg.RELOAD_SPEED = 0.5
	presets.weapon.normal.is_lmg.melee_speed = 1
	presets.weapon.normal.is_lmg.melee_dmg = 8
	presets.weapon.normal.is_lmg.melee_retry_delay = {1, 2}
	presets.weapon.normal.is_lmg.range = {
		close = 800,
		optimal = 1800,
		far = 5000
	}
	presets.weapon.normal.is_lmg.autofire_rounds = {20, 40}
	presets.weapon.normal.is_lmg.FALLOFF = {
		{
			r = 100,
			acc = {0.55, 0.85},
			dmg_mul = 1,
			recoil = {0.45, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 500,
			acc = {0.5, 0.8},
			dmg_mul = 0.8,
			recoil = {0.45, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.7},
			dmg_mul = 0.4,
			recoil = {0.35, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.175, 0.5},
			dmg_mul = 0.4,
			recoil = {0.4, 1.2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.4,
			recoil = {1.5, 3},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	presets.weapon.good = {}
	presets.weapon.good.is_pistol = {}
	presets.weapon.good.is_pistol.aim_delay = {0.1, 0.1}
	presets.weapon.good.is_pistol.focus_delay = 2
	presets.weapon.good.is_pistol.focus_dis = 200
	presets.weapon.good.is_pistol.spread = 25
	presets.weapon.good.is_pistol.miss_dis = 30
	presets.weapon.good.is_pistol.RELOAD_SPEED = 1
	presets.weapon.good.is_pistol.melee_speed = presets.weapon.normal.is_pistol.melee_speed
	presets.weapon.good.is_pistol.melee_dmg = presets.weapon.normal.is_pistol.melee_dmg
	presets.weapon.good.is_pistol.melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay
	presets.weapon.good.is_pistol.range = presets.weapon.normal.is_pistol.range
	presets.weapon.good.is_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.1, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.9},
			dmg_mul = 0.66,
			recoil = {0.1, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 0.33,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.15, 0.45},
			dmg_mul = 0.33,
			recoil = {0.3, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 0.33,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.good.akimbo_pistol = {}
	presets.weapon.good.akimbo_pistol.aim_delay = {0.1, 0.1}
	presets.weapon.good.akimbo_pistol.focus_delay = 2
	presets.weapon.good.akimbo_pistol.focus_dis = 200
	presets.weapon.good.akimbo_pistol.spread = 20
	presets.weapon.good.akimbo_pistol.miss_dis = 50
	presets.weapon.good.akimbo_pistol.RELOAD_SPEED = 1
	presets.weapon.good.akimbo_pistol.melee_speed = presets.weapon.normal.is_pistol.melee_speed
	presets.weapon.good.akimbo_pistol.melee_dmg = presets.weapon.normal.is_pistol.melee_dmg
	presets.weapon.good.akimbo_pistol.melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay
	presets.weapon.good.akimbo_pistol.range = presets.weapon.normal.is_pistol.range
	presets.weapon.good.akimbo_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.15, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.85},
			dmg_mul = 0.66,
			recoil = {0.15, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 0.33,
			recoil = {0.15, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.45},
			dmg_mul = 0.33,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.33,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.good.is_rifle = {}
	presets.weapon.good.is_rifle.aim_delay = {0.1, 0.1}
	presets.weapon.good.is_rifle.focus_delay = 3
	presets.weapon.good.is_rifle.focus_dis = 200
	presets.weapon.good.is_rifle.spread = 20
	presets.weapon.good.is_rifle.miss_dis = 40
	presets.weapon.good.is_rifle.RELOAD_SPEED = 1
	presets.weapon.good.is_rifle.melee_speed = presets.weapon.normal.is_rifle.melee_speed
	presets.weapon.good.is_rifle.melee_dmg = presets.weapon.normal.is_rifle.melee_dmg
	presets.weapon.good.is_rifle.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.good.is_rifle.range = presets.weapon.normal.is_rifle.range
	presets.weapon.good.is_rifle.autofire_rounds = presets.weapon.normal.is_rifle.autofire_rounds
	presets.weapon.good.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.4, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 0.66,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.8},
			dmg_mul = 0.5,
			recoil = {0.35, 0.75},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 0.416,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.33,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	presets.weapon.good.is_bullpup = presets.weapon.good.is_rifle
	presets.weapon.good.is_shotgun_pump = {}
	presets.weapon.good.is_shotgun_pump.aim_delay = {0.1, 0.1}
	presets.weapon.good.is_shotgun_pump.focus_delay = 5
	presets.weapon.good.is_shotgun_pump.focus_dis = 200
	presets.weapon.good.is_shotgun_pump.spread = 15
	presets.weapon.good.is_shotgun_pump.miss_dis = 20
	presets.weapon.good.is_shotgun_pump.RELOAD_SPEED = 1
	presets.weapon.good.is_shotgun_pump.melee_speed = presets.weapon.normal.is_shotgun_pump.melee_speed
	presets.weapon.good.is_shotgun_pump.melee_dmg = presets.weapon.normal.is_shotgun_pump.melee_dmg
	presets.weapon.good.is_shotgun_pump.melee_retry_delay = presets.weapon.normal.is_shotgun_pump.melee_retry_delay
	presets.weapon.good.is_shotgun_pump.range = presets.weapon.normal.is_shotgun_pump.range
	presets.weapon.good.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.95},
			dmg_mul = 0.66,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.75},
			dmg_mul = 0.66,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.01, 0.25},
			dmg_mul = 0.5,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.05, 0.35},
			dmg_mul = 0.33,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.good.is_shotgun_mag = {}
	presets.weapon.good.is_shotgun_mag.aim_delay = {0.1, 0.1}
	presets.weapon.good.is_shotgun_mag.focus_delay = 4
	presets.weapon.good.is_shotgun_mag.focus_dis = 200
	presets.weapon.good.is_shotgun_mag.spread = 20
	presets.weapon.good.is_shotgun_mag.miss_dis = 40
	presets.weapon.good.is_shotgun_mag.RELOAD_SPEED = 1
	presets.weapon.good.is_shotgun_mag.melee_speed = presets.weapon.normal.is_shotgun_mag.melee_speed
	presets.weapon.good.is_shotgun_mag.melee_dmg = presets.weapon.normal.is_shotgun_mag.melee_dmg
	presets.weapon.good.is_shotgun_mag.melee_retry_delay = presets.weapon.normal.is_shotgun_mag.melee_retry_delay
	presets.weapon.good.is_shotgun_mag.range = presets.weapon.normal.is_shotgun_mag.range
	presets.weapon.good.is_shotgun_mag.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.6, 0.9},
			dmg_mul = 0.875,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.8},
			dmg_mul = 0.5,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.55},
			dmg_mul = 0.375,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 0.2,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.good.is_smg = {}
	presets.weapon.good.is_smg.aim_delay = {0, 0.2}
	presets.weapon.good.is_smg.focus_delay = 3
	presets.weapon.good.is_smg.focus_dis = 200
	presets.weapon.good.is_smg.spread = 15
	presets.weapon.good.is_smg.miss_dis = 10
	presets.weapon.good.is_smg.RELOAD_SPEED = 1
	presets.weapon.good.is_smg.melee_speed = presets.weapon.normal.is_smg.melee_speed
	presets.weapon.good.is_smg.melee_dmg = presets.weapon.normal.is_smg.melee_dmg
	presets.weapon.good.is_smg.melee_retry_delay = presets.weapon.normal.is_smg.melee_retry_delay
	presets.weapon.good.is_smg.range = presets.weapon.normal.is_smg.range
	presets.weapon.good.is_smg.autofire_rounds = presets.weapon.normal.is_smg.autofire_rounds
	presets.weapon.good.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.1, 0.25},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.95},
			dmg_mul = 0.66,
			recoil = {0.1, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.75},
			dmg_mul = 0.583,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.45},
			dmg_mul = 0.416,
			recoil = {0.35, 0.6},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 0.33,
			recoil = {0.5, 0.6},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.good.is_revolver = {}
	presets.weapon.good.is_revolver.aim_delay = {0.1, 0.1}
	presets.weapon.good.is_revolver.focus_delay = 10
	presets.weapon.good.is_revolver.focus_dis = 200
	presets.weapon.good.is_revolver.spread = 20
	presets.weapon.good.is_revolver.miss_dis = 50
	presets.weapon.good.is_revolver.RELOAD_SPEED = 1
	presets.weapon.good.is_revolver.melee_speed = presets.weapon.normal.is_revolver.melee_speed
	presets.weapon.good.is_revolver.melee_dmg = presets.weapon.normal.is_revolver.melee_dmg
	presets.weapon.good.is_revolver.melee_retry_delay = presets.weapon.normal.is_revolver.melee_retry_delay
	presets.weapon.good.is_revolver.range = presets.weapon.normal.is_revolver.range
	presets.weapon.good.is_revolver.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.85},
			dmg_mul = 0.5,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 0.375,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.45},
			dmg_mul = 0.25,
			recoil = {1, 1.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.125,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.good.mini = {}
	presets.weapon.good.mini.aim_delay = {0.1, 0.2}
	presets.weapon.good.mini.focus_delay = 4
	presets.weapon.good.mini.focus_dis = 800
	presets.weapon.good.mini.spread = 30
	presets.weapon.good.mini.miss_dis = 40
	presets.weapon.good.mini.RELOAD_SPEED = 0.5
	presets.weapon.good.mini.melee_speed = nil
	presets.weapon.good.mini.melee_dmg = nil
	presets.weapon.good.mini.melee_retry_delay = nil
	presets.weapon.good.mini.range = presets.weapon.normal.mini.range
	presets.weapon.good.mini.autofire_rounds = {500, 700}
	presets.weapon.good.mini.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {500, 700}
		},
		{
			r = 500,
			acc = {0.5, 0.7},
			dmg_mul = 0.8,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {500, 500}
		},
		{
			r = 1000,
			acc = {0.4, 0.6},
			dmg_mul = 0.7,
			recoil = {0.45, 0.8},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {300, 500}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 0.6,
			recoil = {0.45, 0.8},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {100, 300}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 0.6,
			recoil = {1, 1.2},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {40, 100}
		}
	}
	presets.weapon.good.is_lmg = {}
	presets.weapon.good.is_lmg.aim_delay = {0.1, 0.1}
	presets.weapon.good.is_lmg.focus_delay = 3
	presets.weapon.good.is_lmg.focus_dis = 200
	presets.weapon.good.is_lmg.spread = 24
	presets.weapon.good.is_lmg.miss_dis = 40
	presets.weapon.good.is_lmg.RELOAD_SPEED = 0.5
	presets.weapon.good.is_lmg.melee_speed = presets.weapon.normal.is_lmg.melee_speed
	presets.weapon.good.is_lmg.melee_dmg = presets.weapon.normal.is_lmg.melee_dmg
	presets.weapon.good.is_lmg.melee_retry_delay = presets.weapon.normal.is_lmg.melee_retry_delay
	presets.weapon.good.is_lmg.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.good.is_lmg.autofire_rounds = presets.weapon.normal.is_lmg.autofire_rounds
	presets.weapon.good.is_lmg.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.4, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 0.66,
			recoil = {0.45, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.8},
			dmg_mul = 0.5,
			recoil = {0.35, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 0.416,
			recoil = {0.4, 1.2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.33,
			recoil = {1.5, 3},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	presets.weapon.expert = {}
	presets.weapon.expert.is_pistol = {}
	presets.weapon.expert.is_pistol.aim_delay = {0.1, 0.1}
	presets.weapon.expert.is_pistol.focus_delay = 1
	presets.weapon.expert.is_pistol.focus_dis = 300
	presets.weapon.expert.is_pistol.spread = 20
	presets.weapon.expert.is_pistol.miss_dis = 50
	presets.weapon.expert.is_pistol.RELOAD_SPEED = 1.2
	presets.weapon.expert.is_pistol.melee_speed = presets.weapon.normal.is_pistol.melee_speed
	presets.weapon.expert.is_pistol.melee_dmg = 15
	presets.weapon.expert.is_pistol.melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay
	presets.weapon.expert.is_pistol.range = presets.weapon.normal.is_pistol.range
	presets.weapon.expert.is_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.15, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.9},
			dmg_mul = 0.8,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.65},
			dmg_mul = 0.7,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 0.6,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 0.5,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.expert.akimbo_pistol = {}
	presets.weapon.expert.akimbo_pistol.aim_delay = {0.1, 0.1}
	presets.weapon.expert.akimbo_pistol.focus_delay = 1
	presets.weapon.expert.akimbo_pistol.focus_dis = 300
	presets.weapon.expert.akimbo_pistol.spread = 20
	presets.weapon.expert.akimbo_pistol.miss_dis = 50
	presets.weapon.expert.akimbo_pistol.RELOAD_SPEED = 1.2
	presets.weapon.expert.akimbo_pistol.melee_speed = presets.weapon.normal.is_pistol.melee_speed
	presets.weapon.expert.akimbo_pistol.melee_dmg = 15
	presets.weapon.expert.akimbo_pistol.melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay
	presets.weapon.expert.akimbo_pistol.range = presets.weapon.normal.is_pistol.range
	presets.weapon.expert.akimbo_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.15, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.9},
			dmg_mul = 0.8,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.65},
			dmg_mul = 0.7,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 0.6,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 0.5,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.expert.is_shotgun_pump = {}
	presets.weapon.expert.is_shotgun_pump.aim_delay = {0.1, 0.1}
	presets.weapon.expert.is_shotgun_pump.focus_delay = 5
	presets.weapon.expert.is_shotgun_pump.focus_dis = 200
	presets.weapon.expert.is_shotgun_pump.spread = 15
	presets.weapon.expert.is_shotgun_pump.miss_dis = 20
	presets.weapon.expert.is_shotgun_pump.RELOAD_SPEED = 1.2
	presets.weapon.expert.is_shotgun_pump.melee_speed = presets.weapon.normal.is_shotgun_pump.melee_speed
	presets.weapon.expert.is_shotgun_pump.melee_dmg = 15
	presets.weapon.expert.is_shotgun_pump.melee_retry_delay = presets.weapon.normal.is_shotgun_pump.melee_retry_delay
	presets.weapon.expert.is_shotgun_pump.range = presets.weapon.normal.is_shotgun_pump.range
	presets.weapon.expert.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.95},
			dmg_mul = 0.66,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.75},
			dmg_mul = 0.66,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.01, 0.25},
			dmg_mul = 0.5,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.05, 0.35},
			dmg_mul = 0.33,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.expert.is_shotgun_mag = {}
	presets.weapon.expert.is_shotgun_mag.aim_delay = {0.1, 0.1}
	presets.weapon.expert.is_shotgun_mag.focus_delay = 4
	presets.weapon.expert.is_shotgun_mag.focus_dis = 200
	presets.weapon.expert.is_shotgun_mag.spread = 20
	presets.weapon.expert.is_shotgun_mag.miss_dis = 40
	presets.weapon.expert.is_shotgun_mag.RELOAD_SPEED = 1.2
	presets.weapon.expert.is_shotgun_mag.melee_speed = presets.weapon.normal.is_shotgun_mag.melee_speed
	presets.weapon.expert.is_shotgun_mag.melee_dmg = 15
	presets.weapon.expert.is_shotgun_mag.melee_retry_delay = presets.weapon.normal.is_shotgun_mag.melee_retry_delay
	presets.weapon.expert.is_shotgun_mag.range = presets.weapon.normal.is_shotgun_mag.range
	presets.weapon.expert.is_shotgun_mag.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.6, 0.9},
			dmg_mul = 0.875,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.8},
			dmg_mul = 0.5,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.55},
			dmg_mul = 0.375,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 0.2,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.expert.is_rifle = {}
	presets.weapon.expert.is_rifle.aim_delay = {0.1, 0.1}
	presets.weapon.expert.is_rifle.focus_delay = 3
	presets.weapon.expert.is_rifle.focus_dis = 200
	presets.weapon.expert.is_rifle.spread = 20
	presets.weapon.expert.is_rifle.miss_dis = 40
	presets.weapon.expert.is_rifle.RELOAD_SPEED = 1.2
	presets.weapon.expert.is_rifle.melee_speed = presets.weapon.normal.is_rifle.melee_speed
	presets.weapon.expert.is_rifle.melee_dmg = 15
	presets.weapon.expert.is_rifle.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.expert.is_rifle.range = presets.weapon.normal.is_rifle.range
	presets.weapon.expert.is_rifle.autofire_rounds = presets.weapon.normal.is_rifle.autofire_rounds
	presets.weapon.expert.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.4, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 0.66,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.8},
			dmg_mul = 0.5,
			recoil = {0.35, 0.75},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 0.416,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.33,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	presets.weapon.expert.is_bullpup = presets.weapon.expert.is_rifle
	presets.weapon.expert.is_smg = {}
	presets.weapon.expert.is_smg.aim_delay = {0, 0.1}
	presets.weapon.expert.is_smg.focus_delay = 1
	presets.weapon.expert.is_smg.focus_dis = 200
	presets.weapon.expert.is_smg.spread = 15
	presets.weapon.expert.is_smg.miss_dis = 10
	presets.weapon.expert.is_smg.RELOAD_SPEED = 1.2
	presets.weapon.expert.is_smg.melee_speed = presets.weapon.normal.is_smg.melee_speed
	presets.weapon.expert.is_smg.melee_dmg = 15
	presets.weapon.expert.is_smg.melee_retry_delay = presets.weapon.normal.is_smg.melee_retry_delay
	presets.weapon.expert.is_smg.range = presets.weapon.normal.is_smg.range
	presets.weapon.expert.is_smg.autofire_rounds = presets.weapon.normal.is_smg.autofire_rounds
	presets.weapon.expert.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.95},
			dmg_mul = 1,
			recoil = {0.1, 0.25},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.6, 0.9},
			dmg_mul = 0.9,
			recoil = {0.1, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.65},
			dmg_mul = 0.8,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.6},
			dmg_mul = 0.6,
			recoil = {0.35, 0.7},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.2, 0.35},
			dmg_mul = 0.4,
			recoil = {0.5, 1.5},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.expert.is_revolver = {}
	presets.weapon.expert.is_revolver.aim_delay = {0.1, 0.1}
	presets.weapon.expert.is_revolver.focus_delay = 10
	presets.weapon.expert.is_revolver.focus_dis = 200
	presets.weapon.expert.is_revolver.spread = 20
	presets.weapon.expert.is_revolver.miss_dis = 50
	presets.weapon.expert.is_revolver.RELOAD_SPEED = 1.2
	presets.weapon.expert.is_revolver.melee_speed = presets.weapon.normal.is_revolver.melee_speed
	presets.weapon.expert.is_revolver.melee_dmg = 15
	presets.weapon.expert.is_revolver.melee_retry_delay = presets.weapon.normal.is_revolver.melee_retry_delay
	presets.weapon.expert.is_revolver.range = presets.weapon.normal.is_revolver.range
	presets.weapon.expert.is_revolver.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.85},
			dmg_mul = 0.8,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 0.5,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.45},
			dmg_mul = 0.4,
			recoil = {1, 1.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.3,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.expert.mini = {}
	presets.weapon.expert.mini.aim_delay = {0.1, 0.2}
	presets.weapon.expert.mini.focus_delay = 4
	presets.weapon.expert.mini.focus_dis = 800
	presets.weapon.expert.mini.spread = 20
	presets.weapon.expert.mini.miss_dis = 40
	presets.weapon.expert.mini.RELOAD_SPEED = 0.6
	presets.weapon.expert.mini.melee_speed = nil
	presets.weapon.expert.mini.melee_dmg = nil
	presets.weapon.expert.mini.melee_retry_delay = nil
	presets.weapon.expert.mini.range = presets.weapon.normal.mini.range
	presets.weapon.expert.mini.autofire_rounds = {500, 700}
	presets.weapon.expert.mini.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {500, 700}
		},
		{
			r = 500,
			acc = {0.5, 0.7},
			dmg_mul = 0.8,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {500, 500}
		},
		{
			r = 1000,
			acc = {0.4, 0.6},
			dmg_mul = 0.7,
			recoil = {0.45, 0.8},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {300, 500}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 0.6,
			recoil = {0.45, 0.8},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {100, 300}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 0.6,
			recoil = {1, 1.2},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {40, 100}
		}
	}
	presets.weapon.expert.is_lmg = {}
	presets.weapon.expert.is_lmg.aim_delay = {0.1, 0.1}
	presets.weapon.expert.is_lmg.focus_delay = 3
	presets.weapon.expert.is_lmg.focus_dis = 200
	presets.weapon.expert.is_lmg.spread = 24
	presets.weapon.expert.is_lmg.miss_dis = 40
	presets.weapon.expert.is_lmg.RELOAD_SPEED = 0.6
	presets.weapon.expert.is_lmg.melee_speed = presets.weapon.normal.is_lmg.melee_speed
	presets.weapon.expert.is_lmg.melee_dmg = 15
	presets.weapon.expert.is_lmg.melee_retry_delay = presets.weapon.normal.is_lmg.melee_retry_delay
	presets.weapon.expert.is_lmg.range = presets.weapon.good.is_lmg.range
	presets.weapon.expert.is_lmg.autofire_rounds = presets.weapon.normal.is_lmg.autofire_rounds
	presets.weapon.expert.is_lmg.FALLOFF = {
		{
			r = 100,
			acc = {0.65, 0.85},
			dmg_mul = 1,
			recoil = {0.4, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.8},
			dmg_mul = 0.66,
			recoil = {0.45, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.7},
			dmg_mul = 0.5,
			recoil = {0.35, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 0.416,
			recoil = {0.4, 1.2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.33,
			recoil = {1.5, 3},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	presets.weapon.deathwish = {}
	presets.weapon.deathwish.is_revolver = {}
	presets.weapon.deathwish.is_revolver.aim_delay = {0, 0}
	presets.weapon.deathwish.is_revolver.focus_delay = 0
	presets.weapon.deathwish.is_revolver.focus_dis = 200
	presets.weapon.deathwish.is_revolver.spread = 20
	presets.weapon.deathwish.is_revolver.miss_dis = 50
	presets.weapon.deathwish.is_revolver.RELOAD_SPEED = 1.4
	presets.weapon.deathwish.is_revolver.melee_speed = presets.weapon.normal.is_revolver.melee_speed
	presets.weapon.deathwish.is_revolver.melee_dmg = 20
	presets.weapon.deathwish.is_revolver.melee_retry_delay = presets.weapon.normal.is_revolver.melee_retry_delay
	presets.weapon.deathwish.is_revolver.range = presets.weapon.normal.is_revolver.range
	presets.weapon.deathwish.is_revolver.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
			dmg_mul = 1,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.6, 0.85},
			dmg_mul = 0.8,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.5, 0.75},
			dmg_mul = 0.7,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.65},
			dmg_mul = 0.6,
			recoil = {1, 1.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 0.5,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.deathwish.is_pistol = {}
	presets.weapon.deathwish.is_pistol.aim_delay = {0, 0}
	presets.weapon.deathwish.is_pistol.focus_delay = 0
	presets.weapon.deathwish.is_pistol.focus_dis = 200
	presets.weapon.deathwish.is_pistol.spread = 20
	presets.weapon.deathwish.is_pistol.miss_dis = 50
	presets.weapon.deathwish.is_pistol.RELOAD_SPEED = 1.4
	presets.weapon.deathwish.is_pistol.melee_speed = presets.weapon.normal.is_pistol.melee_speed
	presets.weapon.deathwish.is_pistol.melee_dmg = 20
	presets.weapon.deathwish.is_pistol.melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay
	presets.weapon.deathwish.is_pistol.range = {
		close = 2000,
		optimal = 3200,
		far = 5000
	}
	presets.weapon.deathwish.is_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.95},
			dmg_mul = 1,
			recoil = {0.15, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.9, 0.95},
			dmg_mul = 1,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.8},
			dmg_mul = 0.8,
			recoil = {0.25, 0.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.7},
			dmg_mul = 0.8,
			recoil = {0.4, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 0.8,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.2, 0.65},
			dmg_mul = 0.6,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.deathwish.akimbo_pistol = {}
	presets.weapon.deathwish.akimbo_pistol.aim_delay = {0, 0}
	presets.weapon.deathwish.akimbo_pistol.focus_delay = 0
	presets.weapon.deathwish.akimbo_pistol.focus_dis = 200
	presets.weapon.deathwish.akimbo_pistol.spread = 20
	presets.weapon.deathwish.akimbo_pistol.miss_dis = 50
	presets.weapon.deathwish.akimbo_pistol.RELOAD_SPEED = 1.4
	presets.weapon.deathwish.akimbo_pistol.melee_speed = presets.weapon.normal.akimbo_pistol.melee_speed
	presets.weapon.deathwish.akimbo_pistol.melee_dmg = 20
	presets.weapon.deathwish.akimbo_pistol.melee_retry_delay = presets.weapon.normal.akimbo_pistol.melee_retry_delay
	presets.weapon.deathwish.akimbo_pistol.range = {
		close = 2000,
		optimal = 3200,
		far = 5000
	}
	presets.weapon.deathwish.akimbo_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.95},
			dmg_mul = 1,
			recoil = {0.15, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.9, 0.95},
			dmg_mul = 1,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.8},
			dmg_mul = 0.8,
			recoil = {0.25, 0.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.7},
			dmg_mul = 0.8,
			recoil = {0.4, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 0.8,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.2, 0.65},
			dmg_mul = 0.6,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.deathwish.is_rifle = {}
	presets.weapon.deathwish.is_rifle.aim_delay = {0, 0}
	presets.weapon.deathwish.is_rifle.focus_delay = 0
	presets.weapon.deathwish.is_rifle.focus_dis = 200
	presets.weapon.deathwish.is_rifle.spread = 20
	presets.weapon.deathwish.is_rifle.miss_dis = 40
	presets.weapon.deathwish.is_rifle.RELOAD_SPEED = 1.4
	presets.weapon.deathwish.is_rifle.melee_speed = presets.weapon.normal.is_rifle.melee_speed
	presets.weapon.deathwish.is_rifle.melee_dmg = 20
	presets.weapon.deathwish.is_rifle.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.deathwish.is_rifle.range = {
		close = 2000,
		optimal = 3500,
		far = 6000
	}
	presets.weapon.deathwish.is_rifle.autofire_rounds = {4, 9}
	presets.weapon.deathwish.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.975},
			dmg_mul = 1,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.875, 0.95},
			dmg_mul = 1,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				8,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.9},
			dmg_mul = 0.8,
			recoil = {0.35, 0.55},
			mode = {
				0,
				2,
				5,
				1
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.85},
			dmg_mul = 0.8,
			recoil = {0.4, 0.7},
			mode = {
				3,
				2,
				5,
				1
			}
		},
		{
			r = 3000,
			acc = {0.65, 0.75},
			dmg_mul = 0.8,
			recoil = {0.7, 1.1},
			mode = {
				3,
				1,
				5,
				0.5
			}
		},
		{
			r = 6000,
			acc = {0.25, 0.7},
			dmg_mul = 0.6,
			recoil = {1, 2},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	presets.weapon.deathwish.is_bullpup = presets.weapon.deathwish.is_rifle
	presets.weapon.deathwish.is_shotgun_pump = {}
	presets.weapon.deathwish.is_shotgun_pump.aim_delay = {0, 0}
	presets.weapon.deathwish.is_shotgun_pump.focus_delay = 0
	presets.weapon.deathwish.is_shotgun_pump.focus_dis = 200
	presets.weapon.deathwish.is_shotgun_pump.spread = 15
	presets.weapon.deathwish.is_shotgun_pump.miss_dis = 20
	presets.weapon.deathwish.is_shotgun_pump.RELOAD_SPEED = 1.4
	presets.weapon.deathwish.is_shotgun_pump.melee_speed = presets.weapon.normal.is_shotgun_pump.melee_speed
	presets.weapon.deathwish.is_shotgun_pump.melee_dmg = 20
	presets.weapon.deathwish.is_shotgun_pump.melee_retry_delay = presets.weapon.normal.is_shotgun_pump.melee_retry_delay
	presets.weapon.deathwish.is_shotgun_pump.range = {
		close = 2000,
		optimal = 3000,
		far = 5000
	}
	presets.weapon.deathwish.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.95, 0.95},
			dmg_mul = 1,
			recoil = {1, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.7, 0.95},
			dmg_mul = 0.9375,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.5, 0.8},
			dmg_mul = 0.875,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.45, 0.65},
			dmg_mul = 0.625,
			recoil = {1.25, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.3, 0.5},
			dmg_mul = 0.375,
			recoil = {1.5, 1.75},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.deathwish.is_shotgun_mag = {}
	presets.weapon.deathwish.is_shotgun_mag.aim_delay = {0, 0}
	presets.weapon.deathwish.is_shotgun_mag.focus_delay = 0
	presets.weapon.deathwish.is_shotgun_mag.focus_dis = 200
	presets.weapon.deathwish.is_shotgun_mag.spread = 20
	presets.weapon.deathwish.is_shotgun_mag.miss_dis = 40
	presets.weapon.deathwish.is_shotgun_mag.RELOAD_SPEED = 1.4
	presets.weapon.deathwish.is_shotgun_mag.melee_speed = presets.weapon.normal.is_shotgun_mag.melee_speed
	presets.weapon.deathwish.is_shotgun_mag.melee_dmg = 20
	presets.weapon.deathwish.is_shotgun_mag.melee_retry_delay = presets.weapon.normal.is_shotgun_mag.melee_retry_delay
	presets.weapon.deathwish.is_shotgun_mag.range = presets.weapon.normal.is_shotgun_mag.range
	presets.weapon.deathwish.is_shotgun_mag.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
			dmg_mul = 1,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.7, 0.9},
			dmg_mul = 0.9,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.7},
			dmg_mul = 0.8,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.6},
			dmg_mul = 0.6,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.2, 0.4},
			dmg_mul = 0.3,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.deathwish.is_smg = {}
	presets.weapon.deathwish.is_smg.aim_delay = {0, 0}
	presets.weapon.deathwish.is_smg.focus_delay = 0
	presets.weapon.deathwish.is_smg.focus_dis = 200
	presets.weapon.deathwish.is_smg.spread = 15
	presets.weapon.deathwish.is_smg.miss_dis = 10
	presets.weapon.deathwish.is_smg.RELOAD_SPEED = 1.4
	presets.weapon.deathwish.is_smg.melee_speed = presets.weapon.normal.is_smg.melee_speed
	presets.weapon.deathwish.is_smg.melee_dmg = 20
	presets.weapon.deathwish.is_smg.melee_retry_delay = presets.weapon.normal.is_smg.melee_retry_delay
	presets.weapon.deathwish.is_smg.range = {
		close = 2000,
		optimal = 3200,
		far = 6000
	}
	presets.weapon.deathwish.is_smg.autofire_rounds = {8, 16}
	presets.weapon.deathwish.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.95, 0.95},
			dmg_mul = 1,
			recoil = {0.1, 0.25},
			mode = {
				0,
				3,
				3,
				4
			}
		},
		{
			r = 500,
			acc = {0.75, 0.75},
			dmg_mul = 1,
			recoil = {0.1, 0.3},
			mode = {
				0,
				3,
				3,
				4
			}
		},
		{
			r = 1000,
			acc = {0.65, 0.65},
			dmg_mul = 0.8,
			recoil = {0.35, 0.5},
			mode = {
				0,
				6,
				3,
				3
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.7},
			dmg_mul = 0.8,
			recoil = {0.35, 0.5},
			mode = {
				0,
				6,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.55, 0.6},
			dmg_mul = 0.8,
			recoil = {0.5, 1.5},
			mode = {
				1,
				6,
				2,
				0
			}
		},
		{
			r = 4500,
			acc = {0.3, 0.6},
			dmg_mul = 0.6,
			recoil = {1, 1.5},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.deathwish.mini = {}
	presets.weapon.deathwish.mini.aim_delay = {0.1, 0.2}
	presets.weapon.deathwish.mini.focus_delay = 4
	presets.weapon.deathwish.mini.focus_dis = 800
	presets.weapon.deathwish.mini.spread = 20
	presets.weapon.deathwish.mini.miss_dis = 40
	presets.weapon.deathwish.mini.RELOAD_SPEED = 0.6
	presets.weapon.deathwish.mini.melee_speed = nil
	presets.weapon.deathwish.mini.melee_dmg = nil
	presets.weapon.deathwish.mini.melee_retry_delay = nil
	presets.weapon.deathwish.mini.range = presets.weapon.normal.mini.range
	presets.weapon.deathwish.mini.autofire_rounds = {500, 700}
	presets.weapon.deathwish.mini.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {500, 700}
		},
		{
			r = 500,
			acc = {0.5, 0.7},
			dmg_mul = 0.8,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {500, 500}
		},
		{
			r = 1000,
			acc = {0.4, 0.6},
			dmg_mul = 0.7,
			recoil = {0.45, 0.8},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {300, 500}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 0.6,
			recoil = {0.45, 0.8},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {100, 300}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 0.6,
			recoil = {1, 1.2},
			mode = {
				0,
				0,
				0,
				1
			},
			autofire_rounds = {40, 100}
		}
	}
	presets.weapon.deathwish.is_lmg = {}
	presets.weapon.deathwish.is_lmg.aim_delay = {0, 0}
	presets.weapon.deathwish.is_lmg.focus_delay = 0
	presets.weapon.deathwish.is_lmg.focus_dis = 200
	presets.weapon.deathwish.is_lmg.spread = 24
	presets.weapon.deathwish.is_lmg.miss_dis = 40
	presets.weapon.deathwish.is_lmg.RELOAD_SPEED = 0.6
	presets.weapon.deathwish.is_lmg.melee_speed = presets.weapon.normal.is_lmg.melee_speed
	presets.weapon.deathwish.is_lmg.melee_dmg = 20
	presets.weapon.deathwish.is_lmg.melee_retry_delay = presets.weapon.normal.is_lmg.melee_retry_delay
	presets.weapon.deathwish.is_lmg.range = {
		close = 2000,
		optimal = 3500,
		far = 6000
	}
	presets.weapon.deathwish.is_lmg.autofire_rounds = {25, 50}
	presets.weapon.deathwish.is_lmg.FALLOFF = {
		{
			r = 100,
			acc = {0.8, 0.9},
			dmg_mul = 1,
			recoil = {0.25, 0.3},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 500,
			acc = {0.75, 0.9},
			dmg_mul = 1,
			recoil = {0.25, 0.3},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.5, 0.8},
			dmg_mul = 0.66,
			recoil = {0.35, 0.55},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.65},
			dmg_mul = 0.5,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.2, 0.35},
			dmg_mul = 0.25,
			recoil = {0.7, 1.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 6000,
			acc = {0.1, 0.2},
			dmg_mul = 0.25,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	presets.weapon.gang_member = {}
	presets.weapon.gang_member.is_pistol = {}
	presets.weapon.gang_member.is_pistol.aim_delay = {0, 0.5}
	presets.weapon.gang_member.is_pistol.focus_delay = 1
	presets.weapon.gang_member.is_pistol.focus_dis = 2000
	presets.weapon.gang_member.is_pistol.spread = 20
	presets.weapon.gang_member.is_pistol.miss_dis = 20
	presets.weapon.gang_member.is_pistol.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_pistol.melee_speed = 3
	presets.weapon.gang_member.is_pistol.melee_dmg = 3
	presets.weapon.gang_member.is_pistol.melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay
	presets.weapon.gang_member.is_pistol.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.is_pistol.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 1.8,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 1.8,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 1.8,
			recoil = {0.45, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 1.8,
			recoil = {0.65, 0.85},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 1.8,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.is_pistol_light = {}
	presets.weapon.gang_member.is_pistol_light.aim_delay = {0, 0.5}
	presets.weapon.gang_member.is_pistol_light.focus_delay = 1
	presets.weapon.gang_member.is_pistol_light.focus_dis = 2000
	presets.weapon.gang_member.is_pistol_light.spread = 21
	presets.weapon.gang_member.is_pistol_light.miss_dis = 20
	presets.weapon.gang_member.is_pistol_light.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_pistol_light.melee_speed = 3
	presets.weapon.gang_member.is_pistol_light.melee_dmg = 3
	presets.weapon.gang_member.is_pistol_light.melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay
	presets.weapon.gang_member.is_pistol_light.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.is_pistol_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 1.8,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 1.8,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 1.8,
			recoil = {0.25, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 1.8,
			recoil = {0.45, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.is_pistol_heavy = {}
	presets.weapon.gang_member.is_pistol_heavy.aim_delay = {0, 0.5}
	presets.weapon.gang_member.is_pistol_heavy.focus_delay = 1
	presets.weapon.gang_member.is_pistol_heavy.focus_dis = 2000
	presets.weapon.gang_member.is_pistol_heavy.spread = 20
	presets.weapon.gang_member.is_pistol_heavy.miss_dis = 20
	presets.weapon.gang_member.is_pistol_heavy.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_pistol_heavy.melee_speed = 3
	presets.weapon.gang_member.is_pistol_heavy.melee_dmg = 3
	presets.weapon.gang_member.is_pistol_heavy.melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay
	presets.weapon.gang_member.is_pistol_heavy.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.is_pistol_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 1.8,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 1.8,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 1.8,
			recoil = {0.65, 0.85},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 1.8,
			recoil = {0.85, 1.05},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 1.8,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.is_revolver = {}
	presets.weapon.gang_member.is_revolver.aim_delay = {0, 0.5}
	presets.weapon.gang_member.is_revolver.focus_delay = 1
	presets.weapon.gang_member.is_revolver.focus_dis = 2000
	presets.weapon.gang_member.is_revolver.spread = 20
	presets.weapon.gang_member.is_revolver.miss_dis = 20
	presets.weapon.gang_member.is_revolver.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_revolver.melee_speed = 3
	presets.weapon.gang_member.is_revolver.melee_dmg = 3
	presets.weapon.gang_member.is_revolver.melee_retry_delay = presets.weapon.normal.is_revolver.melee_retry_delay
	presets.weapon.gang_member.is_revolver.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.is_revolver.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 1.8,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 1.8,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.is_rifle = {}
	presets.weapon.gang_member.is_rifle.aim_delay = {0, 0.5}
	presets.weapon.gang_member.is_rifle.focus_delay = 1
	presets.weapon.gang_member.is_rifle.focus_dis = 3000
	presets.weapon.gang_member.is_rifle.spread = 20
	presets.weapon.gang_member.is_rifle.miss_dis = 10
	presets.weapon.gang_member.is_rifle.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_rifle.melee_speed = 2
	presets.weapon.gang_member.is_rifle.melee_dmg = 3
	presets.weapon.gang_member.is_rifle.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.gang_member.is_rifle.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.is_rifle.autofire_rounds = {15, 15}
	presets.weapon.gang_member.is_rifle.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 1.8,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 1.8,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 1.8,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 1.8,
			recoil = {0.75, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 1.8,
			recoil = {1.5, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	presets.weapon.gang_member.is_rifle_light = {}
	presets.weapon.gang_member.is_rifle_light.aim_delay = {0, 0.5}
	presets.weapon.gang_member.is_rifle_light.focus_delay = 1
	presets.weapon.gang_member.is_rifle_light.focus_dis = 3000
	presets.weapon.gang_member.is_rifle_light.spread = 21
	presets.weapon.gang_member.is_rifle_light.miss_dis = 10
	presets.weapon.gang_member.is_rifle_light.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_rifle_light.melee_speed = 2
	presets.weapon.gang_member.is_rifle_light.melee_dmg = 3
	presets.weapon.gang_member.is_rifle_light.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.gang_member.is_rifle_light.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.is_rifle_light.autofire_rounds = {30, 30}
	presets.weapon.gang_member.is_rifle_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.75, 0.8},
			dmg_mul = 1.8,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.75},
			dmg_mul = 1.8,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.65, 0.7},
			dmg_mul = 1.8,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.65},
			dmg_mul = 1.8,
			recoil = {0.5, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.45, 0.55},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	presets.weapon.gang_member.is_rifle_heavy = {}
	presets.weapon.gang_member.is_rifle_heavy.aim_delay = {0, 0.5}
	presets.weapon.gang_member.is_rifle_heavy.focus_delay = 1
	presets.weapon.gang_member.is_rifle_heavy.focus_dis = 3000
	presets.weapon.gang_member.is_rifle_heavy.spread = 20
	presets.weapon.gang_member.is_rifle_heavy.miss_dis = 10
	presets.weapon.gang_member.is_rifle_heavy.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_rifle_heavy.melee_speed = 2
	presets.weapon.gang_member.is_rifle_heavy.melee_dmg = 3
	presets.weapon.gang_member.is_rifle_heavy.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.gang_member.is_rifle_heavy.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.is_rifle_heavy.autofire_rounds = {10, 10}
	presets.weapon.gang_member.is_rifle_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 1.8,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 1.8,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	presets.weapon.gang_member.is_rifle_dmr = {}
	presets.weapon.gang_member.is_rifle_dmr.aim_delay = {0, 0.5}
	presets.weapon.gang_member.is_rifle_dmr.focus_delay = 1
	presets.weapon.gang_member.is_rifle_dmr.focus_dis = 3000
	presets.weapon.gang_member.is_rifle_dmr.spread = 20
	presets.weapon.gang_member.is_rifle_dmr.miss_dis = 10
	presets.weapon.gang_member.is_rifle_dmr.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_rifle_dmr.melee_speed = 2
	presets.weapon.gang_member.is_rifle_dmr.melee_dmg = 3
	presets.weapon.gang_member.is_rifle_dmr.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.gang_member.is_rifle_dmr.range = {
		close = 2000,
		optimal = 4000,
		far = 6000
	}
	presets.weapon.gang_member.is_rifle_dmr.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.7, 0.8},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.is_sniper = {}
	presets.weapon.gang_member.is_sniper.aim_delay = {0.25, 1}
	presets.weapon.gang_member.is_sniper.focus_delay = 1
	presets.weapon.gang_member.is_sniper.focus_dis = 3000
	presets.weapon.gang_member.is_sniper.spread = 15
	presets.weapon.gang_member.is_sniper.miss_dis = 10
	presets.weapon.gang_member.is_sniper.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_sniper.melee_speed = 2
	presets.weapon.gang_member.is_sniper.melee_dmg = 3
	presets.weapon.gang_member.is_sniper.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.gang_member.is_sniper.range = {
		close = 2000,
		optimal = 4000,
		far = 6000
	}
	presets.weapon.gang_member.is_sniper.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 1.8,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 1.8,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.is_sniper_winchester = {}
	presets.weapon.gang_member.is_sniper_winchester.aim_delay = {0.25, 1}
	presets.weapon.gang_member.is_sniper_winchester.focus_delay = 1
	presets.weapon.gang_member.is_sniper_winchester.focus_dis = 3000
	presets.weapon.gang_member.is_sniper_winchester.spread = 20
	presets.weapon.gang_member.is_sniper_winchester.miss_dis = 10
	presets.weapon.gang_member.is_sniper_winchester.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_sniper_winchester.melee_speed = 2
	presets.weapon.gang_member.is_sniper_winchester.melee_dmg = 3
	presets.weapon.gang_member.is_sniper_winchester.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.gang_member.is_sniper_winchester.range = {
		close = 2000,
		optimal = 4000,
		far = 6000
	}
	presets.weapon.gang_member.is_sniper_winchester.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 1.8,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 1.8,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.is_sniper_semi = {}
	presets.weapon.gang_member.is_sniper_semi.aim_delay = {0.25, 1}
	presets.weapon.gang_member.is_sniper_semi.focus_delay = 1
	presets.weapon.gang_member.is_sniper_semi.focus_dis = 3000
	presets.weapon.gang_member.is_sniper_semi.spread = 20
	presets.weapon.gang_member.is_sniper_semi.miss_dis = 10
	presets.weapon.gang_member.is_sniper_semi.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_sniper_semi.melee_speed = 2
	presets.weapon.gang_member.is_sniper_semi.melee_dmg = 3
	presets.weapon.gang_member.is_sniper_semi.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.gang_member.is_sniper_semi.range = {
		close = 2000,
		optimal = 4000,
		far = 6000
	}
	presets.weapon.gang_member.is_sniper_semi.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.is_sniper_semi_fast = {}
	presets.weapon.gang_member.is_sniper_semi_fast.aim_delay = {0.25, 1}
	presets.weapon.gang_member.is_sniper_semi_fast.focus_delay = 1
	presets.weapon.gang_member.is_sniper_semi_fast.focus_dis = 3000
	presets.weapon.gang_member.is_sniper_semi_fast.spread = 20
	presets.weapon.gang_member.is_sniper_semi_fast.miss_dis = 10
	presets.weapon.gang_member.is_sniper_semi_fast.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_sniper_semi_fast.melee_speed = 2
	presets.weapon.gang_member.is_sniper_semi_fast.melee_dmg = 3
	presets.weapon.gang_member.is_sniper_semi_fast.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.gang_member.is_sniper_semi_fast.range = {
		close = 2000,
		optimal = 4000,
		far = 6000
	}
	presets.weapon.gang_member.is_sniper_semi_fast.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 1.8,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 1.8,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.is_sniper_slow = {}
	presets.weapon.gang_member.is_sniper_slow.aim_delay = {0.25, 1}
	presets.weapon.gang_member.is_sniper_slow.focus_delay = 1
	presets.weapon.gang_member.is_sniper_slow.focus_dis = 3000
	presets.weapon.gang_member.is_sniper_slow.spread = 15
	presets.weapon.gang_member.is_sniper_slow.miss_dis = 10
	presets.weapon.gang_member.is_sniper_slow.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_sniper_slow.melee_speed = 2
	presets.weapon.gang_member.is_sniper_slow.melee_dmg = 3
	presets.weapon.gang_member.is_sniper_slow.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.gang_member.is_sniper_slow.range = {
		close = 2000,
		optimal = 4000,
		far = 6000
	}
	presets.weapon.gang_member.is_sniper_slow.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 1.8,
			recoil = {2.4, 2.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 1.8,
			recoil = {2.4, 2.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.is_sniper_50cal = {}
	presets.weapon.gang_member.is_sniper_50cal.aim_delay = {0.25, 1}
	presets.weapon.gang_member.is_sniper_50cal.focus_delay = 1
	presets.weapon.gang_member.is_sniper_50cal.focus_dis = 3000
	presets.weapon.gang_member.is_sniper_50cal.spread = 15
	presets.weapon.gang_member.is_sniper_50cal.miss_dis = 10
	presets.weapon.gang_member.is_sniper_50cal.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_sniper_50cal.melee_speed = 2
	presets.weapon.gang_member.is_sniper_50cal.melee_dmg = 3
	presets.weapon.gang_member.is_sniper_50cal.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.gang_member.is_sniper_50cal.range = {
		close = 2000,
		optimal = 4000,
		far = 6000
	}
	presets.weapon.gang_member.is_sniper_50cal.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 1.8,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 1.8,
			recoil = {3, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 1.8,
			recoil = {3, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.is_lmg = {}
	presets.weapon.gang_member.is_lmg.aim_delay = {0, 0.5}
	presets.weapon.gang_member.is_lmg.focus_delay = 1
	presets.weapon.gang_member.is_lmg.focus_dis = 3000
	presets.weapon.gang_member.is_lmg.spread = 30
	presets.weapon.gang_member.is_lmg.miss_dis = 10
	presets.weapon.gang_member.is_lmg.RELOAD_SPEED = 0.5
	presets.weapon.gang_member.is_lmg.melee_speed = 2
	presets.weapon.gang_member.is_lmg.melee_dmg = 3
	presets.weapon.gang_member.is_lmg.melee_retry_delay = presets.weapon.normal.is_lmg.melee_retry_delay
	presets.weapon.gang_member.is_lmg.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.is_lmg.autofire_rounds = {50, 50}
	presets.weapon.gang_member.is_lmg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.85, 0.9},
			dmg_mul = 1.8,
			recoil = {0.8, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.8},
			dmg_mul = 1.2,
			recoil = {0.8, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.7},
			dmg_mul = 0.6,
			recoil = {0.8, 1.25},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.02, 0.25},
			dmg_mul = 0.24,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.01, 0.1},
			dmg_mul = 0.12,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	presets.weapon.gang_member.is_shotgun_pump = {}
	presets.weapon.gang_member.is_shotgun_pump.aim_delay = {0, 0.25}
	presets.weapon.gang_member.is_shotgun_pump.focus_delay = 1
	presets.weapon.gang_member.is_shotgun_pump.focus_dis = 2000
	presets.weapon.gang_member.is_shotgun_pump.spread = 18
	presets.weapon.gang_member.is_shotgun_pump.miss_dis = 10
	presets.weapon.gang_member.is_shotgun_pump.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_shotgun_pump.melee_speed = 2
	presets.weapon.gang_member.is_shotgun_pump.melee_dmg = 3
	presets.weapon.gang_member.is_shotgun_pump.melee_retry_delay = presets.weapon.normal.is_shotgun_pump.melee_retry_delay
	presets.weapon.gang_member.is_shotgun_pump.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.is_shotgun_pump.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 1.92,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.2,
			recoil = {1.2, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.1,
			recoil = {1.2, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.05,
			recoil = {1.6, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.025,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.is_shotgun_mag = {}
	presets.weapon.gang_member.is_shotgun_mag.aim_delay = {0, 0.25}
	presets.weapon.gang_member.is_shotgun_mag.focus_delay = 1
	presets.weapon.gang_member.is_shotgun_mag.focus_dis = 2000
	presets.weapon.gang_member.is_shotgun_mag.spread = 19
	presets.weapon.gang_member.is_shotgun_mag.miss_dis = 10
	presets.weapon.gang_member.is_shotgun_mag.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_shotgun_mag.melee_speed = 2
	presets.weapon.gang_member.is_shotgun_mag.melee_dmg = 3
	presets.weapon.gang_member.is_shotgun_mag.melee_retry_delay = presets.weapon.normal.is_shotgun_mag.melee_retry_delay
	presets.weapon.gang_member.is_shotgun_mag.range = {
		close = 1000,
		optimal = 2000,
		far = 6000
	}
	presets.weapon.gang_member.is_shotgun_mag.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 1.92,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 1.8,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.2,
			recoil = {0.38, 0.58},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.1,
			recoil = {0.58, 0.78},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.05,
			recoil = {0.78, 0.98},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.025,
			recoil = {0.98, 1.98},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.is_shotgun_mag_semi = {}
	presets.weapon.gang_member.is_shotgun_mag_semi.aim_delay = {0, 0.25}
	presets.weapon.gang_member.is_shotgun_mag_semi.focus_delay = 1
	presets.weapon.gang_member.is_shotgun_mag_semi.focus_dis = 2000
	presets.weapon.gang_member.is_shotgun_mag_semi.spread = 19
	presets.weapon.gang_member.is_shotgun_mag_semi.miss_dis = 10
	presets.weapon.gang_member.is_shotgun_mag_semi.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_shotgun_mag_semi.melee_speed = 2
	presets.weapon.gang_member.is_shotgun_mag_semi.melee_dmg = 3
	presets.weapon.gang_member.is_shotgun_mag_semi.melee_retry_delay = presets.weapon.normal.is_shotgun_mag.melee_retry_delay
	presets.weapon.gang_member.is_shotgun_mag_semi.range = {
		close = 1000,
		optimal = 2000,
		far = 6000
	}
	presets.weapon.gang_member.is_shotgun_mag_semi.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 1.92,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 1.8,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.2,
			recoil = {0.38, 0.58},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.1,
			recoil = {0.58, 0.78},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.05,
			recoil = {0.78, 0.98},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.025,
			recoil = {0.98, 1.98},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.is_shotgun_mag_aa12 = {}
	presets.weapon.gang_member.is_shotgun_mag_aa12.aim_delay = {0, 0.25}
	presets.weapon.gang_member.is_shotgun_mag_aa12.focus_delay = 1
	presets.weapon.gang_member.is_shotgun_mag_aa12.focus_dis = 2000
	presets.weapon.gang_member.is_shotgun_mag_aa12.spread = 19
	presets.weapon.gang_member.is_shotgun_mag_aa12.miss_dis = 10
	presets.weapon.gang_member.is_shotgun_mag_aa12.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_shotgun_mag_aa12.melee_speed = 2
	presets.weapon.gang_member.is_shotgun_mag_aa12.melee_dmg = 3
	presets.weapon.gang_member.is_shotgun_mag_aa12.melee_retry_delay = presets.weapon.normal.is_shotgun_mag.melee_retry_delay
	presets.weapon.gang_member.is_shotgun_mag_aa12.range = {
		close = 1000,
		optimal = 2000,
		far = 6000
	}
	presets.weapon.gang_member.is_shotgun_mag_aa12.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 1.92,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 1.8,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.2,
			recoil = {0.4, 0.6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.1,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.05,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.025,
			recoil = {1, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.is_shotgun_semi = {}
	presets.weapon.gang_member.is_shotgun_semi.aim_delay = {0, 0.25}
	presets.weapon.gang_member.is_shotgun_semi.focus_delay = 1
	presets.weapon.gang_member.is_shotgun_semi.focus_dis = 2000
	presets.weapon.gang_member.is_shotgun_semi.spread = 19
	presets.weapon.gang_member.is_shotgun_semi.miss_dis = 10
	presets.weapon.gang_member.is_shotgun_semi.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_shotgun_semi.melee_speed = 2
	presets.weapon.gang_member.is_shotgun_semi.melee_dmg = 3
	presets.weapon.gang_member.is_shotgun_semi.melee_retry_delay = presets.weapon.normal.is_shotgun_mag.melee_retry_delay
	presets.weapon.gang_member.is_shotgun_semi.range = {
		close = 1000,
		optimal = 2000,
		far = 6000
	}
	presets.weapon.gang_member.is_shotgun_semi.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 1.92,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 1.8,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.2,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.1,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.05,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.025,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.is_smg = {}
	presets.weapon.gang_member.is_smg.aim_delay = {0, 0.5}
	presets.weapon.gang_member.is_smg.focus_delay = 1
	presets.weapon.gang_member.is_smg.focus_dis = 3000
	presets.weapon.gang_member.is_smg.spread = 20
	presets.weapon.gang_member.is_smg.miss_dis = 10
	presets.weapon.gang_member.is_smg.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_smg.melee_speed = 2
	presets.weapon.gang_member.is_smg.melee_dmg = 3
	presets.weapon.gang_member.is_smg.melee_retry_delay = presets.weapon.normal.is_smg.melee_retry_delay
	presets.weapon.gang_member.is_smg.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.is_smg.autofire_rounds = {20, 20}
	presets.weapon.gang_member.is_smg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 1.8,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 1.8,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 1.8,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 1.8,
			recoil = {0.75, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 1.8,
			recoil = {1.5, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	presets.weapon.gang_member.is_smg_light = {}
	presets.weapon.gang_member.is_smg_light.aim_delay = {0, 0.5}
	presets.weapon.gang_member.is_smg_light.focus_delay = 1
	presets.weapon.gang_member.is_smg_light.focus_dis = 3000
	presets.weapon.gang_member.is_smg_light.spread = 21
	presets.weapon.gang_member.is_smg_light.miss_dis = 10
	presets.weapon.gang_member.is_smg_light.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_smg_light.melee_speed = 2
	presets.weapon.gang_member.is_smg_light.melee_dmg = 3
	presets.weapon.gang_member.is_smg_light.melee_retry_delay = presets.weapon.normal.is_smg.melee_retry_delay
	presets.weapon.gang_member.is_smg_light.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.is_smg_light.autofire_rounds = {30, 30}
	presets.weapon.gang_member.is_smg_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.65, 0.7},
			dmg_mul = 1.8,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.65},
			dmg_mul = 1.8,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.55, 0.6},
			dmg_mul = 1.8,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.55},
			dmg_mul = 1.8,
			recoil = {0.5, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.35, 0.45},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	presets.weapon.gang_member.is_smg_heavy = {}
	presets.weapon.gang_member.is_smg_heavy.aim_delay = {0, 0.5}
	presets.weapon.gang_member.is_smg_heavy.focus_delay = 1
	presets.weapon.gang_member.is_smg_heavy.focus_dis = 3000
	presets.weapon.gang_member.is_smg_heavy.spread = 20
	presets.weapon.gang_member.is_smg_heavy.miss_dis = 10
	presets.weapon.gang_member.is_smg_heavy.RELOAD_SPEED = 1
	presets.weapon.gang_member.is_smg_heavy.melee_speed = 2
	presets.weapon.gang_member.is_smg_heavy.melee_dmg = 3
	presets.weapon.gang_member.is_smg_heavy.melee_retry_delay = presets.weapon.normal.is_smg.melee_retry_delay
	presets.weapon.gang_member.is_smg_heavy.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.is_smg_heavy.autofire_rounds = {10, 10}
	presets.weapon.gang_member.is_smg_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.85},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 1.8,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 1.8,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	presets.weapon.gang_member.akimbo_pistol = {}
	presets.weapon.gang_member.akimbo_pistol.aim_delay = {0, 0.5}
	presets.weapon.gang_member.akimbo_pistol.focus_delay = 1
	presets.weapon.gang_member.akimbo_pistol.focus_dis = 2000
	presets.weapon.gang_member.akimbo_pistol.spread = 20
	presets.weapon.gang_member.akimbo_pistol.miss_dis = 20
	presets.weapon.gang_member.akimbo_pistol.RELOAD_SPEED = 0.5
	presets.weapon.gang_member.akimbo_pistol.melee_speed = 3
	presets.weapon.gang_member.akimbo_pistol.melee_dmg = 3
	presets.weapon.gang_member.akimbo_pistol.melee_retry_delay = presets.weapon.normal.akimbo_pistol.melee_retry_delay
	presets.weapon.gang_member.akimbo_pistol.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.akimbo_pistol.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 1.8,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 1.8,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 1.8,
			recoil = {0.225, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 1.8,
			recoil = {0.325, 0.425},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 1.8,
			recoil = {0.6, 0.6},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.akimbo_pistol_light = {}
	presets.weapon.gang_member.akimbo_pistol_light.aim_delay = {0, 0.5}
	presets.weapon.gang_member.akimbo_pistol_light.focus_delay = 1
	presets.weapon.gang_member.akimbo_pistol_light.focus_dis = 2000
	presets.weapon.gang_member.akimbo_pistol_light.spread = 21
	presets.weapon.gang_member.akimbo_pistol_light.miss_dis = 20
	presets.weapon.gang_member.akimbo_pistol_light.RELOAD_SPEED = 0.5
	presets.weapon.gang_member.akimbo_pistol_light.melee_speed = 3
	presets.weapon.gang_member.akimbo_pistol_light.melee_dmg = 3
	presets.weapon.gang_member.akimbo_pistol_light.melee_retry_delay = presets.weapon.normal.akimbo_pistol.melee_retry_delay
	presets.weapon.gang_member.akimbo_pistol_light.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.akimbo_pistol_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 1.8,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.55, 0.6},
			dmg_mul = 1.8,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.55},
			dmg_mul = 1.8,
			recoil = {0.125, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.5},
			dmg_mul = 1.8,
			recoil = {0.225, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.3, 0.4},
			dmg_mul = 1.8,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.akimbo_pistol_heavy = {}
	presets.weapon.gang_member.akimbo_pistol_heavy.aim_delay = {0, 0.5}
	presets.weapon.gang_member.akimbo_pistol_heavy.focus_delay = 1
	presets.weapon.gang_member.akimbo_pistol_heavy.focus_dis = 2000
	presets.weapon.gang_member.akimbo_pistol_heavy.spread = 20
	presets.weapon.gang_member.akimbo_pistol_heavy.miss_dis = 20
	presets.weapon.gang_member.akimbo_pistol_heavy.RELOAD_SPEED = 0.5
	presets.weapon.gang_member.akimbo_pistol_heavy.melee_speed = 3
	presets.weapon.gang_member.akimbo_pistol_heavy.melee_dmg = 3
	presets.weapon.gang_member.akimbo_pistol_heavy.melee_retry_delay = presets.weapon.normal.akimbo_pistol.melee_retry_delay
	presets.weapon.gang_member.akimbo_pistol_heavy.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.akimbo_pistol_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 1.8,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 1.8,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 1.8,
			recoil = {0.325, 0.425},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 1.8,
			recoil = {0.425, 0.525},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 1.8,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.akimbo_revolver = {}
	presets.weapon.gang_member.akimbo_revolver.aim_delay = {0, 0.5}
	presets.weapon.gang_member.akimbo_revolver.focus_delay = 1
	presets.weapon.gang_member.akimbo_revolver.focus_dis = 2000
	presets.weapon.gang_member.akimbo_revolver.spread = 20
	presets.weapon.gang_member.akimbo_revolver.miss_dis = 20
	presets.weapon.gang_member.akimbo_revolver.RELOAD_SPEED = 0.5
	presets.weapon.gang_member.akimbo_revolver.melee_speed = 3
	presets.weapon.gang_member.akimbo_revolver.melee_dmg = 3
	presets.weapon.gang_member.akimbo_revolver.melee_retry_delay = presets.weapon.normal.akimbo_pistol.melee_retry_delay
	presets.weapon.gang_member.akimbo_revolver.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.akimbo_revolver.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 1.8,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 1.8,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 1.8,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 1.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.akimbo_smg = {}
	presets.weapon.gang_member.akimbo_smg.aim_delay = {0, 0.5}
	presets.weapon.gang_member.akimbo_smg.focus_delay = 1
	presets.weapon.gang_member.akimbo_smg.focus_dis = 3000
	presets.weapon.gang_member.akimbo_smg.spread = 21
	presets.weapon.gang_member.akimbo_smg.miss_dis = 10
	presets.weapon.gang_member.akimbo_smg.RELOAD_SPEED = 0.5
	presets.weapon.gang_member.akimbo_smg.melee_speed = 2
	presets.weapon.gang_member.akimbo_smg.melee_dmg = 3
	presets.weapon.gang_member.akimbo_smg.melee_retry_delay = presets.weapon.normal.akimbo_pistol.melee_retry_delay
	presets.weapon.gang_member.akimbo_smg.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.akimbo_smg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 1.8,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.55, 0.6},
			dmg_mul = 1.8,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.55},
			dmg_mul = 1.8,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.5},
			dmg_mul = 1.8,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.3, 0.4},
			dmg_mul = 1.8,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.akimbo_smg_light = {}
	presets.weapon.gang_member.akimbo_smg_light.aim_delay = {0, 0.5}
	presets.weapon.gang_member.akimbo_smg_light.focus_delay = 1
	presets.weapon.gang_member.akimbo_smg_light.focus_dis = 3000
	presets.weapon.gang_member.akimbo_smg_light.spread = 21
	presets.weapon.gang_member.akimbo_smg_light.miss_dis = 10
	presets.weapon.gang_member.akimbo_smg_light.RELOAD_SPEED = 0.5
	presets.weapon.gang_member.akimbo_smg_light.melee_speed = 2
	presets.weapon.gang_member.akimbo_smg_light.melee_dmg = 3
	presets.weapon.gang_member.akimbo_smg_light.melee_retry_delay = presets.weapon.normal.akimbo_pistol.melee_retry_delay
	presets.weapon.gang_member.akimbo_smg_light.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.akimbo_smg_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.5, 0.55},
			dmg_mul = 1.8,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.45, 0.5},
			dmg_mul = 1.8,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.4, 0.45},
			dmg_mul = 1.8,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.35, 0.4},
			dmg_mul = 1.8,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.2, 0.3},
			dmg_mul = 1.8,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.akimbo_smg_heavy = {}
	presets.weapon.gang_member.akimbo_smg_heavy.aim_delay = {0, 0.5}
	presets.weapon.gang_member.akimbo_smg_heavy.focus_delay = 1
	presets.weapon.gang_member.akimbo_smg_heavy.focus_dis = 3000
	presets.weapon.gang_member.akimbo_smg_heavy.spread = 21
	presets.weapon.gang_member.akimbo_smg_heavy.miss_dis = 10
	presets.weapon.gang_member.akimbo_smg_heavy.RELOAD_SPEED = 0.5
	presets.weapon.gang_member.akimbo_smg_heavy.melee_speed = 2
	presets.weapon.gang_member.akimbo_smg_heavy.melee_dmg = 3
	presets.weapon.gang_member.akimbo_smg_heavy.melee_retry_delay = presets.weapon.normal.akimbo_pistol.melee_retry_delay
	presets.weapon.gang_member.akimbo_smg_heavy.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.akimbo_smg_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 1.8,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 1.8,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 1.8,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 1.8,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 1.8,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.akimbo_shotgun_mag = {}
	presets.weapon.gang_member.akimbo_shotgun_mag.aim_delay = {0, 0.25}
	presets.weapon.gang_member.akimbo_shotgun_mag.focus_delay = 1
	presets.weapon.gang_member.akimbo_shotgun_mag.focus_dis = 2000
	presets.weapon.gang_member.akimbo_shotgun_mag.spread = 22
	presets.weapon.gang_member.akimbo_shotgun_mag.miss_dis = 10
	presets.weapon.gang_member.akimbo_shotgun_mag.RELOAD_SPEED = 0.5
	presets.weapon.gang_member.akimbo_shotgun_mag.melee_speed = 2
	presets.weapon.gang_member.akimbo_shotgun_mag.melee_dmg = 3
	presets.weapon.gang_member.akimbo_shotgun_mag.melee_retry_delay = presets.weapon.normal.is_shotgun_mag.melee_retry_delay
	presets.weapon.gang_member.akimbo_shotgun_mag.range = {
		close = 1000,
		optimal = 2000,
		far = 6000
	}
	presets.weapon.gang_member.akimbo_shotgun_mag.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 2.4,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 1.92,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 1.8,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.2,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.1,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.05,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.025,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.is_bullpup = presets.weapon.gang_member.is_rifle
	presets.weapon.gang_member.mac11 = presets.weapon.gang_member.is_smg
	presets.weapon.gang_member.rifle = deep_clone(presets.weapon.gang_member.is_rifle)
	presets.weapon.gang_member.rifle.autofire_rounds = nil
	presets.detection = {}
	presets.detection.normal = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}
	presets.detection.normal.idle.dis_max = 10000
	presets.detection.normal.idle.angle_max = 120
	presets.detection.normal.idle.delay = {0, 0}
	presets.detection.normal.idle.use_uncover_range = true
	presets.detection.normal.combat.dis_max = 10000
	presets.detection.normal.combat.angle_max = 120
	presets.detection.normal.combat.delay = {0, 0}
	presets.detection.normal.combat.use_uncover_range = true
	presets.detection.normal.recon.dis_max = 10000
	presets.detection.normal.recon.angle_max = 120
	presets.detection.normal.recon.delay = {0, 0}
	presets.detection.normal.recon.use_uncover_range = true
	presets.detection.normal.guard.dis_max = 10000
	presets.detection.normal.guard.angle_max = 120
	presets.detection.normal.guard.delay = {0, 0}
	presets.detection.normal.ntl.dis_max = 4000
	presets.detection.normal.ntl.angle_max = 60
	presets.detection.normal.ntl.delay = {0.2, 2}
	presets.detection.guard = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}
	presets.detection.guard.idle.dis_max = 10000
	presets.detection.guard.idle.angle_max = 120
	presets.detection.guard.idle.delay = {0, 0}
	presets.detection.guard.idle.use_uncover_range = true
	presets.detection.guard.combat.dis_max = 10000
	presets.detection.guard.combat.angle_max = 120
	presets.detection.guard.combat.delay = {0, 0}
	presets.detection.guard.combat.use_uncover_range = true
	presets.detection.guard.recon.dis_max = 10000
	presets.detection.guard.recon.angle_max = 120
	presets.detection.guard.recon.delay = {0, 0}
	presets.detection.guard.recon.use_uncover_range = true
	presets.detection.guard.guard.dis_max = 10000
	presets.detection.guard.guard.angle_max = 120
	presets.detection.guard.guard.delay = {0, 0}
	presets.detection.guard.ntl = presets.detection.normal.ntl
	presets.detection.sniper = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}
	presets.detection.sniper.idle.dis_max = 10000
	presets.detection.sniper.idle.angle_max = 180
	presets.detection.sniper.idle.delay = {0.5, 1}
	presets.detection.sniper.idle.use_uncover_range = true
	presets.detection.sniper.combat.dis_max = 10000
	presets.detection.sniper.combat.angle_max = 120
	presets.detection.sniper.combat.delay = {0.5, 1}
	presets.detection.sniper.combat.use_uncover_range = true
	presets.detection.sniper.recon.dis_max = 10000
	presets.detection.sniper.recon.angle_max = 120
	presets.detection.sniper.recon.delay = {0.5, 1}
	presets.detection.sniper.recon.use_uncover_range = true
	presets.detection.sniper.guard.dis_max = 10000
	presets.detection.sniper.guard.angle_max = 150
	presets.detection.sniper.guard.delay = {0.3, 1}
	presets.detection.sniper.ntl = presets.detection.normal.ntl
	presets.detection.gang_member = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}
	presets.detection.gang_member.idle.dis_max = 10000
	presets.detection.gang_member.idle.angle_max = 120
	presets.detection.gang_member.idle.delay = {0, 0}
	presets.detection.gang_member.idle.use_uncover_range = true
	presets.detection.gang_member.combat.dis_max = 10000
	presets.detection.gang_member.combat.angle_max = 120
	presets.detection.gang_member.combat.delay = {0, 0}
	presets.detection.gang_member.combat.use_uncover_range = true
	presets.detection.gang_member.recon.dis_max = 10000
	presets.detection.gang_member.recon.angle_max = 120
	presets.detection.gang_member.recon.delay = {0, 0}
	presets.detection.gang_member.recon.use_uncover_range = true
	presets.detection.gang_member.guard.dis_max = 10000
	presets.detection.gang_member.guard.angle_max = 120
	presets.detection.gang_member.guard.delay = {0, 0}
	presets.detection.gang_member.ntl = presets.detection.normal.ntl
	presets.detection.civilian = {
		cbt = {},
		ntl = {}
	}
	presets.detection.civilian.cbt.dis_max = 700
	presets.detection.civilian.cbt.angle_max = 120
	presets.detection.civilian.cbt.delay = {0, 0}
	presets.detection.civilian.cbt.use_uncover_range = true
	presets.detection.civilian.ntl.dis_max = 2000
	presets.detection.civilian.ntl.angle_max = 60
	presets.detection.civilian.ntl.delay = {0.2, 3}
	presets.detection.blind = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}
	presets.detection.blind.idle.dis_max = 1
	presets.detection.blind.idle.angle_max = 0
	presets.detection.blind.idle.delay = {0, 0}
	presets.detection.blind.idle.use_uncover_range = false
	presets.detection.blind.combat.dis_max = 1
	presets.detection.blind.combat.angle_max = 0
	presets.detection.blind.combat.delay = {0, 0}
	presets.detection.blind.combat.use_uncover_range = false
	presets.detection.blind.recon.dis_max = 1
	presets.detection.blind.recon.angle_max = 0
	presets.detection.blind.recon.delay = {0, 0}
	presets.detection.blind.recon.use_uncover_range = false
	presets.detection.blind.guard.dis_max = 1
	presets.detection.blind.guard.angle_max = 0
	presets.detection.blind.guard.delay = {0, 0}
	presets.detection.blind.guard.use_uncover_range = false
	presets.detection.blind.ntl.dis_max = 1
	presets.detection.blind.ntl.angle_max = 0
	presets.detection.blind.ntl.delay = {0, 0}
	presets.detection.blind.ntl.use_uncover_range = false
	presets.dodge = {
		poor = {
			speed = 0.9,
			occasions = {
				hit = {
					chance = 0.9,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 1,
							timeout = {2, 3}
						}
					}
				},
				scared = {
					chance = 0.5,
					check_timeout = {1, 2},
					variations = {
						side_step = {
							chance = 1,
							timeout = {2, 3}
						}
					}
				}
			}
		},
		average = {
			speed = 1,
			occasions = {
				hit = {
					chance = 0.35,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 1,
							timeout = {2, 3}
						}
					}
				},
				scared = {
					chance = 0.4,
					check_timeout = {4, 7},
					variations = {
						dive = {
							chance = 1,
							timeout = {5, 8}
						}
					}
				}
			}
		},
		heavy = {
			speed = 1,
			occasions = {
				hit = {
					chance = 0.75,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 9,
							timeout = {0, 7},
							shoot_chance = 0.8,
							shoot_accuracy = 0.5
						},
						roll = {
							chance = 1,
							timeout = {8, 10}
						}
					}
				},
				preemptive = {
					chance = 0.1,
					check_timeout = {1, 7},
					variations = {
						side_step = {
							chance = 1,
							timeout = {1, 7},
							shoot_chance = 1,
							shoot_accuracy = 0.7
						}
					}
				},
				scared = {
					chance = 0.8,
					check_timeout = {1, 2},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 2},
							shoot_chance = 0.5,
							shoot_accuracy = 0.4
						},
						roll = {
							chance = 1,
							timeout = {8, 10}
						},
						dive = {
							chance = 2,
							timeout = {8, 10}
						}
					}
				}
			}
		},
		athletic = {
			speed = 1.3,
			occasions = {
				hit = {
					chance = 0.9,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 3},
							shoot_chance = 0.8,
							shoot_accuracy = 0.5
						},
						roll = {
							chance = 1,
							timeout = {3, 4}
						}
					}
				},
				preemptive = {
					chance = 0.35,
					check_timeout = {2, 3},
					variations = {
						side_step = {
							chance = 3,
							timeout = {1, 2},
							shoot_chance = 1,
							shoot_accuracy = 0.7
						},
						roll = {
							chance = 1,
							timeout = {3, 4}
						}
					}
				},
				scared = {
					chance = 0.4,
					check_timeout = {1, 2},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 2},
							shoot_chance = 0.5,
							shoot_accuracy = 0.4
						},
						roll = {
							chance = 3,
							timeout = {3, 5}
						},
						dive = {
							chance = 1,
							timeout = {3, 5}
						}
					}
				}
			}
		},
		ninja = {
			speed = 1.6,
			occasions = {
				hit = {
					chance = 0.9,
					check_timeout = {0, 3},
					variations = {
						side_step = {
							chance = 3,
							timeout = {1, 2},
							shoot_chance = 1,
							shoot_accuracy = 0.7
						},
						roll = {
							chance = 1,
							timeout = {1.2, 2}
						},
						wheel = {
							chance = 2,
							timeout = {1.2, 2}
						}
					}
				},
				preemptive = {
					chance = 0.6,
					check_timeout = {0, 3},
					variations = {
						side_step = {
							chance = 3,
							timeout = {1, 2},
							shoot_chance = 1,
							shoot_accuracy = 0.8
						},
						roll = {
							chance = 1,
							timeout = {1.2, 2}
						},
						wheel = {
							chance = 2,
							timeout = {1.2, 2}
						}
					}
				},
				scared = {
					chance = 0.9,
					check_timeout = {0, 3},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 2},
							shoot_chance = 0.8,
							shoot_accuracy = 0.6
						},
						roll = {
							chance = 3,
							timeout = {1.2, 2}
						},
						wheel = {
							chance = 3,
							timeout = {1.2, 2}
						},
						dive = {
							chance = 1,
							timeout = {1.2, 2}
						}
					}
				}
			}
		}
	}
	for preset_name, preset_data in pairs(presets.dodge) do
		for reason_name, reason_data in pairs(preset_data.occasions) do
			local total_w = 0
			for variation_name, variation_data in pairs(reason_data.variations) do
				total_w = total_w + variation_data.chance
			end
			if total_w > 0 then
				for variation_name, variation_data in pairs(reason_data.variations) do
					variation_data.chance = variation_data.chance / total_w
				end
			end
		end
	end
	presets.move_speed = {
		civ_fast = {
			stand = {
				walk = {
					ntl = {
						fwd = 150,
						strafe = 120,
						bwd = 100
					},
					hos = {
						fwd = 210,
						strafe = 190,
						bwd = 160
					},
					cbt = {
						fwd = 210,
						strafe = 175,
						bwd = 160
					}
				},
				run = {
					hos = {
						fwd = 500,
						strafe = 192,
						bwd = 230
					},
					cbt = {
						fwd = 500,
						strafe = 250,
						bwd = 230
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 174,
						strafe = 160,
						bwd = 163
					},
					cbt = {
						fwd = 174,
						strafe = 160,
						bwd = 163
					}
				},
				run = {
					hos = {
						fwd = 312,
						strafe = 245,
						bwd = 260
					},
					cbt = {
						fwd = 312,
						strafe = 245,
						bwd = 260
					}
				}
			}
		},
		lightning = {
			stand = {
				walk = {
					ntl = {
						fwd = 150,
						strafe = 120,
						bwd = 110
					},
					hos = {
						fwd = 285,
						strafe = 225,
						bwd = 215
					},
					cbt = {
						fwd = 285,
						strafe = 225,
						bwd = 215
					}
				},
				run = {
					hos = {
						fwd = 800,
						strafe = 400,
						bwd = 350
					},
					cbt = {
						fwd = 750,
						strafe = 380,
						bwd = 320
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 245,
						strafe = 210,
						bwd = 190
					},
					cbt = {
						fwd = 255,
						strafe = 190,
						bwd = 190
					}
				},
				run = {
					hos = {
						fwd = 420,
						strafe = 300,
						bwd = 250
					},
					cbt = {
						fwd = 412,
						strafe = 300,
						bwd = 280
					}
				}
			}
		},
		very_slow = {
			stand = {
				walk = {
					ntl = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					},
					hos = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					},
					cbt = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					}
				},
				run = {
					hos = {
						fwd = 144,
						strafe = 140,
						bwd = 113
					},
					cbt = {
						fwd = 144,
						strafe = 100,
						bwd = 125
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					},
					cbt = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					}
				},
				run = {
					hos = {
						fwd = 144,
						strafe = 130,
						bwd = 113
					},
					cbt = {
						fwd = 144,
						strafe = 100,
						bwd = 125
					}
				}
			}
		},
		slow = {
			stand = {
				walk = {
					ntl = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					},
					hos = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					},
					cbt = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					}
				},
				run = {
					hos = {
						fwd = 360,
						strafe = 150,
						bwd = 135
					},
					cbt = {
						fwd = 360,
						strafe = 150,
						bwd = 155
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					},
					cbt = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					}
				},
				run = {
					hos = {
						fwd = 360,
						strafe = 140,
						bwd = 150
					},
					cbt = {
						fwd = 360,
						strafe = 140,
						bwd = 155
					}
				}
			}
		},
		normal = {
			stand = {
				walk = {
					ntl = {
						fwd = 150,
						strafe = 120,
						bwd = 100
					},
					hos = {
						fwd = 220,
						strafe = 190,
						bwd = 170
					},
					cbt = {
						fwd = 220,
						strafe = 190,
						bwd = 170
					}
				},
				run = {
					hos = {
						fwd = 450,
						strafe = 290,
						bwd = 255
					},
					cbt = {
						fwd = 400,
						strafe = 250,
						bwd = 255
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 210,
						strafe = 170,
						bwd = 160
					},
					cbt = {
						fwd = 210,
						strafe = 170,
						bwd = 160
					}
				},
				run = {
					hos = {
						fwd = 310,
						strafe = 260,
						bwd = 235
					},
					cbt = {
						fwd = 350,
						strafe = 260,
						bwd = 235
					}
				}
			}
		},
		fast = {
			stand = {
				walk = {
					ntl = {
						fwd = 150,
						strafe = 120,
						bwd = 110
					},
					hos = {
						fwd = 270,
						strafe = 215,
						bwd = 185
					},
					cbt = {
						fwd = 270,
						strafe = 215,
						bwd = 185
					}
				},
				run = {
					hos = {
						fwd = 625,
						strafe = 315,
						bwd = 280
					},
					cbt = {
						fwd = 450,
						strafe = 285,
						bwd = 280
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 235,
						strafe = 180,
						bwd = 170
					},
					cbt = {
						fwd = 235,
						strafe = 180,
						bwd = 170
					}
				},
				run = {
					hos = {
						fwd = 330,
						strafe = 280,
						bwd = 255
					},
					cbt = {
						fwd = 312,
						strafe = 270,
						bwd = 255
					}
				}
			}
		},
		very_fast = {
			stand = {
				walk = {
					ntl = {
						fwd = 150,
						strafe = 120,
						bwd = 110
					},
					hos = {
						fwd = 285,
						strafe = 225,
						bwd = 215
					},
					cbt = {
						fwd = 285,
						strafe = 225,
						bwd = 215
					}
				},
				run = {
					hos = {
						fwd = 670,
						strafe = 340,
						bwd = 325
					},
					cbt = {
						fwd = 475,
						strafe = 325,
						bwd = 300
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 245,
						strafe = 210,
						bwd = 190
					},
					cbt = {
						fwd = 255,
						strafe = 190,
						bwd = 190
					}
				},
				run = {
					hos = {
						fwd = 350,
						strafe = 282,
						bwd = 268
					},
					cbt = {
						fwd = 312,
						strafe = 282,
						bwd = 268
					}
				}
			}
		},
		very_fast_bot = {
			stand = {
				walk = {
					ntl = {
						fwd = 150,
						strafe = 150,
						bwd = 150
					},
					hos = {
						fwd = 285,
						strafe = 285,
						bwd = 285
					},
					cbt = {
						fwd = 285,
						strafe = 285,
						bwd = 285
					}
				},
				run = {
					hos = {
						fwd = 670,
						strafe = 670,
						bwd = 670
					},
					cbt = {
						fwd = 475,
						strafe = 475,
						bwd = 475
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 245,
						strafe = 245,
						bwd = 245
					},
					cbt = {
						fwd = 255,
						strafe = 255,
						bwd = 255
					}
				},
				run = {
					hos = {
						fwd = 350,
						strafe = 350,
						bwd = 350
					},
					cbt = {
						fwd = 312,
						strafe = 312,
						bwd = 312
					}
				}
			}
		}
	}
	for speed_preset_name, poses in pairs(presets.move_speed) do
		for pose, hastes in pairs(poses) do
			hastes.run.ntl = hastes.run.hos
		end
		poses.crouch.walk.ntl = poses.crouch.walk.hos
		poses.crouch.run.ntl = poses.crouch.run.hos
		poses.stand.run.ntl = poses.stand.run.hos
		poses.panic = poses.stand
	end
	presets.surrender = {}
	presets.surrender.always = {base_chance = 1}
	presets.surrender.never = {base_chance = 0}
	presets.surrender.easy = {
		base_chance = 0.35,
		significant_chance = 0.35,
		reasons = {
			health = {
				[1] = 0,
				[0.999] = 0.1,
				[0.5] = 0.3,
				[0.2] = 0.5
			},
			weapon_down = 0.5,
			pants_down = 1
		},
		factors = {
			isolated = 0.16,
			flanked = 0.1,
			unaware_of_aggressor = 0.15,
			enemy_weap_cold = 0.15,
			aggressor_dis = {
				[1000] = 0,
				[300] = 0.3
			}
		}
	}
	presets.surrender.normal = {
		base_chance = 0.2,
		significant_chance = 0.2,
		reasons = {
			health = {
				[1] = 0,
				[0.8] = 0.1,
				[0.5] = 0.2,
				[0.2] = 0.3
			},
			weapon_down = 0.2,
			pants_down = 1
		},
		factors = {
			isolated = 0.08,
			flanked = 0.05,
			unaware_of_aggressor = 0.1,
			enemy_weap_cold = 0.1,
			aggressor_dis = {
				[1000] = 0,
				[300] = 0.2
			}
		}
	}
	presets.surrender.hard = {
		base_chance = 0.1,
		significant_chance = 0.1,
		reasons = {
			health = {
				[1] = 0,
				[0.5] = 0.1,
				[0.2] = 0.3
			}
		},
		factors = {
			pants_down = 0.5,
			weapon_down = 0.1,
			isolated = 0.04,
			flanked = 0.025,
			unaware_of_aggressor = 0.05,
			enemy_weap_cold = 0.05,
			aggressor_dis = {
				[1000] = 0,
				[300] = 0.1
			}
		}
	}
	presets.surrender.zeal = {
		base_chance = 0.1,
		significant_chance = 0.1,
		reasons = {
			health = {
				[1] = 0,
				[0.5] = 0.1,
				[0.2] = 0.3
			}
		},
		factors = {
			pants_down = 0.5,
			weapon_down = 0.1,
			isolated = 0.04,
			flanked = 0.025,
			unaware_of_aggressor = 0.05,
			enemy_weap_cold = 0.05,
			aggressor_dis = {
				[1000] = 0,
				[300] = 0.1
			}
		}
	}
	presets.surrender.special = {base_chance = 0}
	presets.suppression = {
		easy = {
			duration = {10, 15},
			react_point = {0, 2},
			brown_point = {3, 5},
			panic_chance_mul = 1
		},
		hard_def = {
			duration = {5, 10},
			react_point = {0, 2},
			brown_point = {5, 6},
			panic_chance_mul = 0.7
		},
		hard_agg = {
			duration = {5, 8},
			react_point = {2, 5},
			brown_point = {5, 6},
			panic_chance_mul = 0.7
		},
		zeal = {
			duration = {2, 5},
			react_point = {4, 7},
			brown_point = {7, 9},
			panic_chance_mul = 0.5
		},
		no_supress = {
			duration = {0, 0},
			react_point = {100, 200},
			brown_point = {400, 500},
			panic_chance_mul = 0
		}
	}
	presets.enemy_chatter = {
		no_chatter = {},
		cop = {
			retreat = true,
			suppress = true
		},
		police = {
			aggressive = true,
			retreat = true,
			contact = true,
			go_go = true,
			suppress = true
		},
		swat = {
			aggressive = true,
			retreat = true,
			follow_me = true,
			clear = true,
			go_go = true,
			ready = true,
			smoke = true,
			contact = true,
			suppress = true
		},
		zeal = {
			retreat = true,
			follow_me = true,
			clear = true,
			go_go = true,
			ready = true,
			smoke = true,
			contact = true
		},
		shield = {follow_me = true}
	}
	return presets
end
function CharacterTweakData:_set_easy()
	self:_multiply_all_hp(1, 1)
	self:_multiply_all_speeds(2.05, 2.1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self.presets.gang_member_damage.REGENERATE_TIME = 1.8
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.2
	self:_set_characters_weapon_preset("normal")
	self.flashbang_multiplier = 1
end
function CharacterTweakData:_set_normal()
	self:_multiply_all_hp(1, 1)
	self:_multiply_all_speeds(1.05, 1.1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self.hector_boss.HEALTH_INIT = 100
	self.mobster_boss.HEALTH_INIT = 100
	self.biker_boss.HEALTH_INIT = 100
	self.chavez_boss.HEALTH_INIT = 100
	self.drug_lord_boss.HEALTH_INIT = 100
	self.presets.gang_member_damage.REGENERATE_TIME = 2
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 2
	self.presets.gang_member_damage.HEALTH_INIT = 50
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 7
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.45
	self.presets.weapon.gang_member.is_pistol.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 0.75,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 0.75,
			recoil = {0.45, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 0.75,
			recoil = {0.65, 0.85},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 0.75,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_pistol_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 0.75,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 0.75,
			recoil = {0.25, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 0.75,
			recoil = {0.45, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_pistol_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 0.75,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 0.75,
			recoil = {0.65, 0.85},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 0.75,
			recoil = {0.85, 1.05},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 0.75,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_revolver.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 0.75,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 0.75,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 0.75,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 0.75,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 0.75,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 0.75,
			recoil = {0.75, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 0.75,
			recoil = {1.5, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.75, 0.8},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.75},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.65, 0.7},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.65},
			dmg_mul = 0.75,
			recoil = {0.5, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.45, 0.55},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 0.75,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 0.75,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle_dmr.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_winchester.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_semi.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_semi_fast.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_slow.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {2.4, 2.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {2.4, 2.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_50cal.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {3, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {3, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_lmg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.85, 0.9},
			dmg_mul = 0.75,
			recoil = {0.8, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.8},
			dmg_mul = 0.5,
			recoil = {0.8, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.7},
			dmg_mul = 0.25,
			recoil = {0.8, 1.25},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.02, 0.25},
			dmg_mul = 0.1,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.01, 0.1},
			dmg_mul = 0.05,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_pump.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 0.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.08,
			recoil = {1.2, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.04,
			recoil = {1.2, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.02,
			recoil = {1.6, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.01,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_mag.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 0.8,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.08,
			recoil = {0.38, 0.58},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.04,
			recoil = {0.58, 0.78},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.02,
			recoil = {0.78, 0.98},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.01,
			recoil = {0.98, 1.98},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_mag_aa12.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 0.8,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.08,
			recoil = {0.4, 0.6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.04,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.02,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.01,
			recoil = {1, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_semi.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 0.8,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.08,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.04,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.02,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.01,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_smg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 0.75,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 0.75,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 0.75,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 0.75,
			recoil = {0.75, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 0.75,
			recoil = {1.5, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_smg_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.65, 0.7},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.65},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.55, 0.6},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.55},
			dmg_mul = 0.75,
			recoil = {0.5, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.35, 0.45},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_smg_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.85},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 0.75,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 0.75,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_pistol.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 0.75,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 0.75,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 0.75,
			recoil = {0.225, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 0.75,
			recoil = {0.325, 0.425},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 0.75,
			recoil = {0.6, 0.6},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_pistol_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 0.75,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.55, 0.6},
			dmg_mul = 0.75,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.55},
			dmg_mul = 0.75,
			recoil = {0.125, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.5},
			dmg_mul = 0.75,
			recoil = {0.225, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.3, 0.4},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_pistol_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 0.75,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 0.75,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 0.75,
			recoil = {0.325, 0.425},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 0.75,
			recoil = {0.425, 0.525},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 0.75,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_revolver.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_smg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.55, 0.6},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.55},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.5},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.3, 0.4},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_smg_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.5, 0.55},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.45, 0.5},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.4, 0.45},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.35, 0.4},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.2, 0.3},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_smg_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 0.75,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 0.75,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 0.75,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 0.75,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 0.75,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_shotgun_mag.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 0.8,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.08,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.04,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.02,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.01,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_bullpup = self.presets.weapon.gang_member.is_rifle
	self.presets.weapon.gang_member.mac11 = self.presets.weapon.gang_member.is_smg
	self:_set_characters_weapon_preset("normal")
	self.medic.weapon.is_rifle.focus_delay = 10
	self.medic.weapon.is_rifle.RELOAD_SPEED = 0.9
	self.medic.weapon.is_rifle.melee_dmg = 8
	self.medic.weapon.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 0.66,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 0.44,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.8},
			dmg_mul = 0.22,
			recoil = {0.35, 0.75},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 0.22,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.22,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.medic.weapon.is_shotgun_pump.focus_delay = 10
	self.medic.weapon.is_shotgun_pump.RELOAD_SPEED = 0.9
	self.medic.weapon.is_shotgun_pump.melee_dmg = 8
	self.medic.weapon.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 0.66,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 0.44,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.75},
			dmg_mul = 0.44,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.01, 0.25},
			dmg_mul = 0.11,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.05, 0.35},
			dmg_mul = 0.11,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.shield.weapon.is_smg.focus_delay = 10
	self.shield.weapon.is_smg.RELOAD_SPEED = 0.9
	self.shield.weapon.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.95},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 500,
			acc = {0.5, 0.75},
			dmg_mul = 0.875,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.45, 0.65},
			dmg_mul = 0.75,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 0.75,
			recoil = {0.35, 1.2},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 0.5,
			recoil = {0.35, 1.5},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.shield.weapon.is_pistol.focus_delay = 10
	self.shield.weapon.is_pistol.RELOAD_SPEED = 0.9
	self.shield.weapon.is_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.5, 0.9},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.8},
			dmg_mul = 0.75,
			recoil = {0.35, 0.55},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.6},
			dmg_mul = 0.625,
			recoil = {0.35, 0.55},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.15, 0.5},
			dmg_mul = 0.5,
			recoil = {0.35, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0, 0.25},
			dmg_mul = 0.5,
			recoil = {0.35, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.phalanx_minion.weapon.is_smg.focus_delay = 10
	self.phalanx_minion.weapon.is_smg.RELOAD_SPEED = 0.9
	self.phalanx_minion.weapon.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.95},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 500,
			acc = {0.5, 0.75},
			dmg_mul = 0.875,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.45, 0.65},
			dmg_mul = 0.75,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 0.75,
			recoil = {0.35, 1.2},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 0.5,
			recoil = {0.35, 1.5},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.phalanx_vip.weapon.is_smg.focus_delay = 10
	self.phalanx_vip.weapon.is_smg.RELOAD_SPEED = 0.9
	self.phalanx_vip.weapon.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.95},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 500,
			acc = {0.5, 0.75},
			dmg_mul = 0.875,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.45, 0.65},
			dmg_mul = 0.75,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 0.75,
			recoil = {0.35, 1.2},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 0.5,
			recoil = {0.35, 1.5},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.taser.weapon.is_rifle.focus_delay = 10
	self.taser.weapon.is_rifle.RELOAD_SPEED = 0.9
	self.taser.weapon.is_rifle.melee_dmg = 8
	self.taser.weapon.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 0.66,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 0.44,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.8},
			dmg_mul = 0.22,
			recoil = {0.35, 0.75},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 0.22,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.22,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.sniper.weapon.is_rifle.RELOAD_SPEED = 0.9
	self.sniper.weapon.is_rifle.melee_dmg = 8
	self.sniper.weapon.is_rifle.FALLOFF = {
		{
			r = 700,
			acc = {0.6, 1},
			dmg_mul = 7,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.9},
			dmg_mul = 6,
			recoil = {4, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0, 0.3},
			dmg_mul = 3,
			recoil = {4, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.heavy_swat_sniper.weapon.is_rifle.RELOAD_SPEED = 0.9
	self.heavy_swat_sniper.weapon.is_rifle.melee_dmg = 8
	self.heavy_swat_sniper.weapon.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {1, 1},
			dmg_mul = 7,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.6, 1},
			dmg_mul = 7,
			recoil = {0.5, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 1},
			dmg_mul = 7,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.6, 1},
			dmg_mul = 7,
			recoil = {1.5, 1.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 1},
			dmg_mul = 7,
			recoil = {1.75, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.9},
			dmg_mul = 6,
			recoil = {2, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0, 0.3},
			dmg_mul = 3,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.shield.HEALTH_INIT = 16
	self.flashbang_multiplier = 1
	self.concussion_multiplier = 1
end
function CharacterTweakData:_set_hard()
	self:_multiply_all_hp(1, 1)
	self:_multiply_all_speeds(1.05, 1.1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self.hector_boss.HEALTH_INIT = 100
	self.mobster_boss.HEALTH_INIT = 100
	self.biker_boss.HEALTH_INIT = 100
	self.chavez_boss.HEALTH_INIT = 100
	self.drug_lord_boss.HEALTH_INIT = 100
	self.presets.gang_member_damage.REGENERATE_TIME = 2
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 2
	self.presets.gang_member_damage.HEALTH_INIT = 100
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 30
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.45
	self.presets.weapon.gang_member.is_pistol.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 0.75,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 0.75,
			recoil = {0.45, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 0.75,
			recoil = {0.65, 0.85},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 0.75,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_pistol_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 0.75,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 0.75,
			recoil = {0.25, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 0.75,
			recoil = {0.45, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_pistol_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 0.75,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 0.75,
			recoil = {0.65, 0.85},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 0.75,
			recoil = {0.85, 1.05},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 0.75,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_revolver.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 0.75,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 0.75,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 0.75,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 0.75,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 0.75,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 0.75,
			recoil = {0.75, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 0.75,
			recoil = {1.5, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.75, 0.8},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.75},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.65, 0.7},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.65},
			dmg_mul = 0.75,
			recoil = {0.5, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.45, 0.55},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 0.75,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 0.75,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle_dmr.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_winchester.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_semi.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_semi_fast.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_slow.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {2.4, 2.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {2.4, 2.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_50cal.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 0.75,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 0.75,
			recoil = {3, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {3, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_lmg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.85, 0.9},
			dmg_mul = 0.75,
			recoil = {0.8, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.8},
			dmg_mul = 0.5,
			recoil = {0.8, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.7},
			dmg_mul = 0.25,
			recoil = {0.8, 1.25},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.02, 0.25},
			dmg_mul = 0.1,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.01, 0.1},
			dmg_mul = 0.05,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_pump.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 0.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.08,
			recoil = {1.2, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.04,
			recoil = {1.2, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.02,
			recoil = {1.6, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.01,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_mag.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 0.8,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.08,
			recoil = {0.38, 0.58},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.04,
			recoil = {0.58, 0.78},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.02,
			recoil = {0.78, 0.98},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.01,
			recoil = {0.98, 1.98},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_mag_aa12.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 0.8,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.08,
			recoil = {0.4, 0.6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.04,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.02,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.01,
			recoil = {1, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_semi.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 0.8,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.08,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.04,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.02,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.01,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_smg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 0.75,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 0.75,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 0.75,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 0.75,
			recoil = {0.75, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 0.75,
			recoil = {1.5, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_smg_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.65, 0.7},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.65},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.55, 0.6},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.55},
			dmg_mul = 0.75,
			recoil = {0.5, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.35, 0.45},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_smg_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.85},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 0.75,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 0.75,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_pistol.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 0.75,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 0.75,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 0.75,
			recoil = {0.225, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 0.75,
			recoil = {0.325, 0.425},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 0.75,
			recoil = {0.6, 0.6},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_pistol_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 0.75,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.55, 0.6},
			dmg_mul = 0.75,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.55},
			dmg_mul = 0.75,
			recoil = {0.125, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.5},
			dmg_mul = 0.75,
			recoil = {0.225, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.3, 0.4},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_pistol_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 0.75,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 0.75,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 0.75,
			recoil = {0.325, 0.425},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 0.75,
			recoil = {0.425, 0.525},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 0.75,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_revolver.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 0.75,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 0.75,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_smg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.55, 0.6},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.55},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.5},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.3, 0.4},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_smg_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.5, 0.55},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.45, 0.5},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.4, 0.45},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.35, 0.4},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.2, 0.3},
			dmg_mul = 0.75,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_smg_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 0.75,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 0.75,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 0.75,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 0.75,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 0.75,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_shotgun_mag.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 0.8,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 0.75,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.08,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.04,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.02,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.01,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_bullpup = self.presets.weapon.gang_member.is_rifle
	self.presets.weapon.gang_member.mac11 = self.presets.weapon.gang_member.is_smg
	self:_set_characters_weapon_preset("normal")
	self.medic.weapon.is_rifle.focus_delay = 10
	self.medic.weapon.is_rifle.RELOAD_SPEED = 0.9
	self.medic.weapon.is_rifle.melee_dmg = 8
	self.medic.weapon.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 0.66,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 0.44,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.8},
			dmg_mul = 0.22,
			recoil = {0.35, 0.75},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 0.22,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.22,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.medic.weapon.is_shotgun_pump.focus_delay = 10
	self.medic.weapon.is_shotgun_pump.RELOAD_SPEED = 0.9
	self.medic.weapon.is_shotgun_pump.melee_dmg = 8
	self.medic.weapon.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 0.66,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 0.44,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.75},
			dmg_mul = 0.44,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.01, 0.25},
			dmg_mul = 0.11,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.05, 0.35},
			dmg_mul = 0.11,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.shield.weapon.is_smg.focus_delay = 10
	self.shield.weapon.is_smg.RELOAD_SPEED = 0.9
	self.shield.weapon.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.95},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 500,
			acc = {0.5, 0.75},
			dmg_mul = 0.875,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.45, 0.65},
			dmg_mul = 0.75,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 0.75,
			recoil = {0.35, 1.2},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 0.5,
			recoil = {0.35, 1.5},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.shield.weapon.is_pistol.focus_delay = 10
	self.shield.weapon.is_pistol.RELOAD_SPEED = 0.9
	self.shield.weapon.is_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.5, 0.9},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.8},
			dmg_mul = 0.75,
			recoil = {0.35, 0.55},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.6},
			dmg_mul = 0.625,
			recoil = {0.35, 0.55},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.15, 0.5},
			dmg_mul = 0.5,
			recoil = {0.35, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0, 0.25},
			dmg_mul = 0.5,
			recoil = {0.35, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.phalanx_minion.weapon.is_smg.focus_delay = 10
	self.phalanx_minion.weapon.is_smg.RELOAD_SPEED = 0.9
	self.phalanx_minion.weapon.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.95},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 500,
			acc = {0.5, 0.75},
			dmg_mul = 0.875,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.45, 0.65},
			dmg_mul = 0.75,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 0.75,
			recoil = {0.35, 1.2},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 0.5,
			recoil = {0.35, 1.5},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.phalanx_vip.weapon.is_smg.focus_delay = 10
	self.phalanx_vip.weapon.is_smg.RELOAD_SPEED = 0.9
	self.phalanx_vip.weapon.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.95},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 500,
			acc = {0.5, 0.75},
			dmg_mul = 0.875,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.45, 0.65},
			dmg_mul = 0.75,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 0.75,
			recoil = {0.35, 1.2},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 0.5,
			recoil = {0.35, 1.5},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.taser.weapon.is_rifle.focus_delay = 10
	self.taser.weapon.is_rifle.RELOAD_SPEED = 0.9
	self.taser.weapon.is_rifle.melee_dmg = 8
	self.taser.weapon.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 0.66,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 0.44,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.8},
			dmg_mul = 0.22,
			recoil = {0.35, 0.75},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 0.22,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.22,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.sniper.weapon.is_rifle.RELOAD_SPEED = 0.9
	self.sniper.weapon.is_rifle.melee_dmg = 8
	self.sniper.weapon.is_rifle.FALLOFF = {
		{
			r = 700,
			acc = {0.6, 1},
			dmg_mul = 7,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.9},
			dmg_mul = 6,
			recoil = {4, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0, 0.3},
			dmg_mul = 3,
			recoil = {4, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.heavy_swat_sniper.weapon.is_rifle.RELOAD_SPEED = 0.9
	self.heavy_swat_sniper.weapon.is_rifle.melee_dmg = 8
	self.heavy_swat_sniper.weapon.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {1, 1},
			dmg_mul = 7,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.6, 1},
			dmg_mul = 7,
			recoil = {0.5, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 1},
			dmg_mul = 7,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.6, 1},
			dmg_mul = 7,
			recoil = {1.5, 1.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 1},
			dmg_mul = 7,
			recoil = {1.75, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.9},
			dmg_mul = 6,
			recoil = {2, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0, 0.3},
			dmg_mul = 3,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.shield.HEALTH_INIT = 16
	self.flashbang_multiplier = 1.25
	self.concussion_multiplier = 1
end
function CharacterTweakData:_set_overkill()
	self:_multiply_all_hp(2, 2)
	self:_multiply_all_speeds(2.05, 2.1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self.hector_boss.HEALTH_INIT = 200
	self.mobster_boss.HEALTH_INIT = 200
	self.biker_boss.HEALTH_INIT = 200
	self.chavez_boss.HEALTH_INIT = 200
	self.drug_lord_boss.HEALTH_INIT = 200
	self.phalanx_minion.HEALTH_INIT = 150
	self.phalanx_minion.DAMAGE_CLAMP_BULLET = 70
	self.phalanx_minion.DAMAGE_CLAMP_EXPLOSION = 30
	self.phalanx_vip.HEALTH_INIT = 300
	self.phalanx_vip.DAMAGE_CLAMP_BULLET = 50
	self.phalanx_vip.DAMAGE_CLAMP_EXPLOSION = 30
	self.presets.gang_member_damage.REGENERATE_TIME = 2
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 2
	self.presets.gang_member_damage.HEALTH_INIT = 300
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 50
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.45
	self.presets.weapon.gang_member.is_pistol.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 1.2,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 1.2,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 1.2,
			recoil = {0.45, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 1.2,
			recoil = {0.65, 0.85},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 1.2,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_pistol_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 1.2,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 1.2,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 1.2,
			recoil = {0.25, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 1.2,
			recoil = {0.45, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_pistol_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 1.2,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 1.2,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 1.2,
			recoil = {0.65, 0.85},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 1.2,
			recoil = {0.85, 1.05},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 1.2,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_revolver.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 1.2,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 1.2,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 1.2,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 1.2,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 1.2,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 1.2,
			recoil = {0.75, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 1.2,
			recoil = {1.5, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.75, 0.8},
			dmg_mul = 1.2,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.75},
			dmg_mul = 1.2,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.65, 0.7},
			dmg_mul = 1.2,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.65},
			dmg_mul = 1.2,
			recoil = {0.5, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.45, 0.55},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 1.2,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 1.2,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle_dmr.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.7, 0.8},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 1.2,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 1.2,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_winchester.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 1.2,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 1.2,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_semi.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_semi_fast.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 1.2,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 1.2,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_slow.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 1.2,
			recoil = {2.4, 2.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 1.2,
			recoil = {2.4, 2.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_50cal.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 1.2,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 1.2,
			recoil = {3, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 1.2,
			recoil = {3, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_lmg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.85, 0.9},
			dmg_mul = 1.2,
			recoil = {0.8, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.8},
			dmg_mul = 0.8,
			recoil = {0.8, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.7},
			dmg_mul = 0.4,
			recoil = {0.8, 1.25},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.02, 0.25},
			dmg_mul = 0.16,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.01, 0.1},
			dmg_mul = 0.08,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_pump.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 1.28,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.13,
			recoil = {1.2, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.07,
			recoil = {1.2, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.03,
			recoil = {1.6, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.017,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_mag.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 1.28,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 1.2,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.13,
			recoil = {0.38, 0.58},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.07,
			recoil = {0.58, 0.78},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.03,
			recoil = {0.78, 0.98},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.017,
			recoil = {0.98, 1.98},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_mag_aa12.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 1.28,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 1.2,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.013,
			recoil = {0.4, 0.6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.07,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.03,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.017,
			recoil = {1, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_semi.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 1.28,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 1.2,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.013,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.07,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.03,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.017,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_smg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 1.2,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 1.2,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 1.2,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 1.2,
			recoil = {0.75, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 1.2,
			recoil = {1.5, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_smg_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.65, 0.7},
			dmg_mul = 1.2,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.65},
			dmg_mul = 1.2,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.55, 0.6},
			dmg_mul = 1.2,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.55},
			dmg_mul = 1.2,
			recoil = {0.5, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.35, 0.45},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_smg_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.85},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 1.2,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 1.2,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_pistol.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 1.2,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 1.2,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 1.2,
			recoil = {0.225, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 1.2,
			recoil = {0.325, 0.425},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 1.2,
			recoil = {0.6, 0.6},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_pistol_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 1.2,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.55, 0.6},
			dmg_mul = 1.2,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.55},
			dmg_mul = 1.2,
			recoil = {0.125, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.5},
			dmg_mul = 1.2,
			recoil = {0.225, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.3, 0.4},
			dmg_mul = 1.2,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_pistol_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 1.2,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 1.2,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 1.2,
			recoil = {0.325, 0.425},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 1.2,
			recoil = {0.425, 0.525},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 1.2,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_revolver.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 1.2,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 1.2,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 1.2,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 1.2,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_smg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 1.2,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.55, 0.6},
			dmg_mul = 1.2,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.55},
			dmg_mul = 1.2,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.5},
			dmg_mul = 1.2,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.3, 0.4},
			dmg_mul = 1.2,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_smg_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.5, 0.55},
			dmg_mul = 1.2,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.45, 0.5},
			dmg_mul = 1.2,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.4, 0.45},
			dmg_mul = 1.2,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.35, 0.4},
			dmg_mul = 1.2,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.2, 0.3},
			dmg_mul = 1.2,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_smg_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 1.2,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 1.2,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 1.2,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 1.2,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 1.2,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_shotgun_mag.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 1.6,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 1.28,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 1.2,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.013,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.07,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.03,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.017,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_bullpup = self.presets.weapon.gang_member.is_rifle
	self.presets.weapon.gang_member.mac11 = self.presets.weapon.gang_member.is_smg
	self:_set_characters_weapon_preset("good")
	self.medic.weapon.is_rifle.focus_delay = 3
	self.medic.weapon.is_rifle.RELOAD_SPEED = 1
	self.medic.weapon.is_rifle.melee_dmg = 8
	self.medic.weapon.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 0.66,
			recoil = {0.4, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 0.44,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.8},
			dmg_mul = 0.33,
			recoil = {0.35, 0.75},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 0.28,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.22,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.medic.weapon.is_shotgun_pump.focus_delay = 5
	self.medic.weapon.is_shotgun_pump.RELOAD_SPEED = 1
	self.medic.weapon.is_shotgun_pump.melee_dmg = 8
	self.medic.weapon.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 0.66,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.95},
			dmg_mul = 0.44,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.75},
			dmg_mul = 0.44,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.01, 0.25},
			dmg_mul = 0.33,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.05, 0.35},
			dmg_mul = 0.22,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.shield.weapon.is_smg.focus_delay = 3
	self.shield.weapon.is_smg.RELOAD_SPEED = 1
	self.shield.weapon.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.95},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 500,
			acc = {0.5, 0.75},
			dmg_mul = 0.875,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.45, 0.65},
			dmg_mul = 0.75,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 0.75,
			recoil = {0.35, 1.2},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 0.5,
			recoil = {0.35, 1.5},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.shield.weapon.is_pistol.focus_delay = 3
	self.shield.weapon.is_pistol.RELOAD_SPEED = 1
	self.shield.weapon.is_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.5, 0.9},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.8},
			dmg_mul = 0.75,
			recoil = {0.35, 0.55},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.6},
			dmg_mul = 0.625,
			recoil = {0.35, 0.55},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.15, 0.5},
			dmg_mul = 0.5,
			recoil = {0.35, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0, 0.25},
			dmg_mul = 0.5,
			recoil = {0.35, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.phalanx_minion.weapon.is_smg.focus_delay = 3
	self.phalanx_minion.weapon.is_smg.RELOAD_SPEED = 1
	self.phalanx_minion.weapon.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.95},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 500,
			acc = {0.5, 0.75},
			dmg_mul = 0.875,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.45, 0.65},
			dmg_mul = 0.75,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 0.75,
			recoil = {0.35, 1.2},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 0.5,
			recoil = {0.35, 1.5},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.phalanx_vip.weapon.is_smg.focus_delay = 3
	self.phalanx_vip.weapon.is_smg.RELOAD_SPEED = 1
	self.phalanx_vip.weapon.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.95},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 500,
			acc = {0.5, 0.75},
			dmg_mul = 0.875,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.45, 0.65},
			dmg_mul = 0.75,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 0.75,
			recoil = {0.35, 1.2},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 0.5,
			recoil = {0.35, 1.5},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.taser.weapon.is_rifle.focus_delay = 3
	self.taser.weapon.is_rifle.RELOAD_SPEED = 1
	self.taser.weapon.is_rifle.melee_dmg = 8
	self.taser.weapon.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 0.66,
			recoil = {0.4, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 0.44,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.8},
			dmg_mul = 0.33,
			recoil = {0.35, 0.75},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 0.28,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.22,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.sniper.weapon.is_rifle.RELOAD_SPEED = 1
	self.sniper.weapon.is_rifle.melee_dmg = 8
	self.sniper.weapon.is_rifle.FALLOFF = {
		{
			r = 700,
			acc = {0.7, 1},
			dmg_mul = 8,
			recoil = {3, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.95},
			dmg_mul = 6,
			recoil = {4, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0, 0.3},
			dmg_mul = 3.5,
			recoil = {4, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.heavy_swat_sniper.weapon.is_rifle.RELOAD_SPEED = 1
	self.heavy_swat_sniper.weapon.is_rifle.melee_dmg = 8
	self.heavy_swat_sniper.weapon.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {1, 1},
			dmg_mul = 8,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.7, 1},
			dmg_mul = 8,
			recoil = {0.5, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 1},
			dmg_mul = 8,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 1},
			dmg_mul = 8,
			recoil = {1.5, 1.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.7, 1},
			dmg_mul = 8,
			recoil = {1.75, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.95},
			dmg_mul = 6,
			recoil = {2, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0, 0.3},
			dmg_mul = 3.5,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.spooc.spooc_attack_timeout = {6, 8}
	self.flashbang_multiplier = 1.5
	self.concussion_multiplier = 1
end
function CharacterTweakData:_set_overkill_145()
	if SystemInfo:platform() == Idstring("PS3") then
		self:_multiply_all_hp(3, 3)
	else
		self:_multiply_all_hp(3, 3)
	end
	self:_multiply_all_speeds(2.05, 2.1)
	self.hector_boss.HEALTH_INIT = 300
	self.mobster_boss.HEALTH_INIT = 300
	self.biker_boss.HEALTH_INIT = 300
	self.chavez_boss.HEALTH_INIT = 300
	self.drug_lord_boss.HEALTH_INIT = 300
	self.phalanx_minion.HEALTH_INIT = 300
	self.phalanx_minion.DAMAGE_CLAMP_BULLET = 140
	self.phalanx_minion.DAMAGE_CLAMP_EXPLOSION = 60
	self.phalanx_vip.HEALTH_INIT = 600
	self.phalanx_vip.DAMAGE_CLAMP_BULLET = 100
	self.phalanx_vip.DAMAGE_CLAMP_EXPLOSION = 60
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self.presets.gang_member_damage.REGENERATE_TIME = 2
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 2
	self.presets.gang_member_damage.HEALTH_INIT = 400
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 60
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.45
	self:_set_characters_weapon_preset("expert")
	self.spooc.spooc_attack_timeout = {3.5, 5}
	self.flashbang_multiplier = 1.75
	self.concussion_multiplier = 1
end
function CharacterTweakData:_set_easy_wish()
	if SystemInfo:platform() == Idstring("PS3") then
		self:_multiply_all_hp(6, 1.5)
	else
		self:_multiply_all_hp(6, 1.5)
	end
	self.hector_boss.HEALTH_INIT = 600
	self.mobster_boss.HEALTH_INIT = 600
	self.biker_boss.HEALTH_INIT = 600
	self.chavez_boss.HEALTH_INIT = 600
	self.drug_lord_boss.HEALTH_INIT = 600
	self:_multiply_all_speeds(2.55, 2.6)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self.presets.gang_member_damage.REGENERATE_TIME = 2
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 2
	self.presets.gang_member_damage.HEALTH_INIT = 400
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 60
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.45
	self.presets.weapon.gang_member.is_pistol.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 3.6,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 3.6,
			recoil = {0.45, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 3.6,
			recoil = {0.65, 0.85},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 3.6,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_pistol_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 3.6,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 3.6,
			recoil = {0.25, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 3.6,
			recoil = {0.45, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_pistol_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 3.6,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 3.6,
			recoil = {0.65, 0.85},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 3.6,
			recoil = {0.85, 1.05},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 3.6,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_revolver.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 3.6,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 3.6,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 3.6,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 3.6,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 3.6,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 3.6,
			recoil = {0.75, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 3.6,
			recoil = {1.5, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.75, 0.8},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.75},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.65, 0.7},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.65},
			dmg_mul = 3.6,
			recoil = {0.5, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.45, 0.55},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 3.6,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 3.6,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle_dmr.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_winchester.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_semi.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_semi_fast.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_slow.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {2.4, 2.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {2.4, 2.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_50cal.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {3, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {3, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_lmg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.85, 0.9},
			dmg_mul = 4.5,
			recoil = {0.8, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.8},
			dmg_mul = 3,
			recoil = {0.8, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.7},
			dmg_mul = 1.5,
			recoil = {0.8, 1.25},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.02, 0.25},
			dmg_mul = 0.6,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.01, 0.1},
			dmg_mul = 0.3,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_pump.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 3.84,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.4,
			recoil = {1.2, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.2,
			recoil = {1.2, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.1,
			recoil = {1.6, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.05,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_mag.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 3.84,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.4,
			recoil = {0.38, 0.58},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.2,
			recoil = {0.58, 0.78},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.1,
			recoil = {0.78, 0.98},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.05,
			recoil = {0.98, 1.98},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_mag_aa12.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 3.84,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.4,
			recoil = {0.4, 0.6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.2,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.1,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.05,
			recoil = {1, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_semi.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 3.84,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.4,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.2,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.1,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.05,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_smg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 3.6,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 3.6,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 3.6,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 3.6,
			recoil = {0.75, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 3.6,
			recoil = {1.5, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_smg_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.65, 0.7},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.65},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.55, 0.6},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.55},
			dmg_mul = 3.6,
			recoil = {0.5, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.35, 0.45},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_smg_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.85},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 3.6,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 3.6,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_pistol.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 3.6,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 3.6,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 3.6,
			recoil = {0.225, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 3.6,
			recoil = {0.325, 0.425},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 3.6,
			recoil = {0.6, 0.6},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_pistol_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 3.6,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.55, 0.6},
			dmg_mul = 3.6,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.55},
			dmg_mul = 3.6,
			recoil = {0.125, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.5},
			dmg_mul = 3.6,
			recoil = {0.225, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.3, 0.4},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_pistol_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 3.6,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 3.6,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 3.6,
			recoil = {0.325, 0.425},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 3.6,
			recoil = {0.425, 0.525},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 3.6,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_revolver.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_smg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.55, 0.6},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.55},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.5},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.3, 0.4},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_smg_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.5, 0.55},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.45, 0.5},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.4, 0.45},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.35, 0.4},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.2, 0.3},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_smg_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 3.6,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 3.6,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 3.6,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 3.6,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 3.6,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_shotgun_mag.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 3.84,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.4,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.2,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.1,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.05,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_bullpup = self.presets.weapon.gang_member.is_rifle
	self.presets.weapon.gang_member.mac11 = self.presets.weapon.gang_member.is_smg
	self:_set_characters_weapon_preset("expert")
	self.spooc.spooc_attack_timeout = {3, 4}
	self.phalanx_minion.HEALTH_INIT = 400
	self.phalanx_minion.DAMAGE_CLAMP_BULLET = 185
	self.phalanx_minion.DAMAGE_CLAMP_EXPLOSION = 80
	self.phalanx_vip.HEALTH_INIT = 800
	self.phalanx_vip.DAMAGE_CLAMP_BULLET = 135
	self.phalanx_vip.DAMAGE_CLAMP_EXPLOSION = 80
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 1
end
function CharacterTweakData:_set_overkill_290()
	if SystemInfo:platform() == Idstring("PS3") then
		self:_multiply_all_hp(6, 1.5)
	else
		self:_multiply_all_hp(6, 1.5)
	end
	self.hector_boss.HEALTH_INIT = 600
	self.mobster_boss.HEALTH_INIT = 600
	self.biker_boss.HEALTH_INIT = 600
	self.chavez_boss.HEALTH_INIT = 600
	self.drug_lord_boss.HEALTH_INIT = 600
	self:_multiply_all_speeds(2.55, 2.6)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self.presets.gang_member_damage.REGENERATE_TIME = 2
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 2
	self.presets.gang_member_damage.HEALTH_INIT = 600
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 80
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.35
	self.presets.weapon.gang_member.is_pistol.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 3.6,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 3.6,
			recoil = {0.45, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 3.6,
			recoil = {0.65, 0.85},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 3.6,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_pistol_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 3.6,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 3.6,
			recoil = {0.25, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 3.6,
			recoil = {0.45, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_pistol_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 3.6,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 3.6,
			recoil = {0.65, 0.85},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 3.6,
			recoil = {0.85, 1.05},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 3.6,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_revolver.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 3.6,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 3.6,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 3.6,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 3.6,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 3.6,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 3.6,
			recoil = {0.75, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 3.6,
			recoil = {1.5, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.75, 0.8},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.75},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.65, 0.7},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.65},
			dmg_mul = 3.6,
			recoil = {0.5, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.45, 0.55},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 3.6,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 3.6,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle_dmr.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_winchester.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_semi.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_semi_fast.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_slow.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {2.4, 2.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {2.4, 2.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_50cal.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 3.6,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 3.6,
			recoil = {3, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {3, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_lmg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.85, 0.9},
			dmg_mul = 4.5,
			recoil = {0.8, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.8},
			dmg_mul = 3,
			recoil = {0.8, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.7},
			dmg_mul = 1.5,
			recoil = {0.8, 1.25},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.02, 0.25},
			dmg_mul = 0.6,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.01, 0.1},
			dmg_mul = 0.3,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_pump.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 3.84,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.4,
			recoil = {1.2, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.2,
			recoil = {1.2, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.1,
			recoil = {1.6, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.05,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_mag.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 3.84,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.4,
			recoil = {0.38, 0.58},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.2,
			recoil = {0.58, 0.78},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.1,
			recoil = {0.78, 0.98},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.05,
			recoil = {0.98, 1.98},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_mag_aa12.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 3.84,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.4,
			recoil = {0.4, 0.6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.2,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.1,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.05,
			recoil = {1, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_semi.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 3.84,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.4,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.2,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.1,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.05,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_smg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 3.6,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 3.6,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 3.6,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 3.6,
			recoil = {0.75, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 3.6,
			recoil = {1.5, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_smg_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.65, 0.7},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.65},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.55, 0.6},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.55},
			dmg_mul = 3.6,
			recoil = {0.5, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.35, 0.45},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_smg_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.85},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 3.6,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 3.6,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_pistol.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 3.6,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 3.6,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 3.6,
			recoil = {0.225, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 3.6,
			recoil = {0.325, 0.425},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 3.6,
			recoil = {0.6, 0.6},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_pistol_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 3.6,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.55, 0.6},
			dmg_mul = 3.6,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.55},
			dmg_mul = 3.6,
			recoil = {0.125, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.5},
			dmg_mul = 3.6,
			recoil = {0.225, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.3, 0.4},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_pistol_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 3.6,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 3.6,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 3.6,
			recoil = {0.325, 0.425},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 3.6,
			recoil = {0.425, 0.525},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 3.6,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_revolver.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 3.6,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 3.6,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_smg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.55, 0.6},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.55},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.5},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.3, 0.4},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_smg_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.5, 0.55},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.45, 0.5},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.4, 0.45},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.35, 0.4},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.2, 0.3},
			dmg_mul = 3.6,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_smg_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 3.6,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 3.6,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 3.6,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 3.6,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 3.6,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_shotgun_mag.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 4.8,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 3.84,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 3.6,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.4,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.2,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.1,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.05,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_bullpup = self.presets.weapon.gang_member.is_rifle
	self.presets.weapon.gang_member.mac11 = self.presets.weapon.gang_member.is_smg
	self:_set_characters_weapon_preset("deathwish")
	self.medic.weapon.is_rifle.aim_delay = {0, 0}
	self.medic.weapon.is_rifle.focus_delay = 0
	self.medic.weapon.is_rifle.RELOAD_SPEED = 1.4
	self.medic.weapon.is_rifle.melee_dmg = 20
	self.medic.weapon.is_rifle.range = {
		close = 2000,
		optimal = 3500,
		far = 6000
	}
	self.medic.weapon.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.975},
			dmg_mul = 0.66,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.875, 0.95},
			dmg_mul = 0.66,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				8,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.9},
			dmg_mul = 0.66,
			recoil = {0.35, 0.55},
			mode = {
				0,
				2,
				5,
				1
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.85},
			dmg_mul = 0.66,
			recoil = {0.4, 0.7},
			mode = {
				3,
				2,
				5,
				1
			}
		},
		{
			r = 3000,
			acc = {0.65, 0.75},
			dmg_mul = 0.66,
			recoil = {0.7, 1.1},
			mode = {
				3,
				1,
				5,
				0.5
			}
		},
		{
			r = 6000,
			acc = {0.25, 0.7},
			dmg_mul = 0.66,
			recoil = {1, 2},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.medic.weapon.is_shotgun_pump.aim_delay = {0, 0}
	self.medic.weapon.is_shotgun_pump.focus_delay = 0
	self.medic.weapon.is_shotgun_pump.RELOAD_SPEED = 1.4
	self.medic.weapon.is_shotgun_pump.melee_dmg = 20
	self.medic.weapon.is_shotgun_pump.range = {
		close = 2000,
		optimal = 3000,
		far = 5000
	}
	self.medic.weapon.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.95, 0.95},
			dmg_mul = 0.66,
			recoil = {1, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.7, 0.95},
			dmg_mul = 0.62,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.5, 0.8},
			dmg_mul = 0.58,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.45, 0.65},
			dmg_mul = 0.41,
			recoil = {1.25, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.3, 0.5},
			dmg_mul = 0.25,
			recoil = {1.5, 1.75},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.shield.weapon.is_smg.aim_delay = {0, 0}
	self.shield.weapon.is_smg.focus_delay = 0
	self.shield.weapon.is_smg.focus_dis = 200
	self.shield.weapon.is_smg.RELOAD_SPEED = 1.4
	self.shield.weapon.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.95},
			dmg_mul = 1,
			recoil = {0.35, 0.35},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 500,
			acc = {0.8, 0.8},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 0.8,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.7},
			dmg_mul = 0.8,
			recoil = {0.35, 1},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.5},
			dmg_mul = 0.6,
			recoil = {0.5, 1.2},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.shield.weapon.is_pistol.aim_delay = {0, 0}
	self.shield.weapon.is_pistol.focus_delay = 0
	self.shield.weapon.is_pistol.focus_dis = 200
	self.shield.weapon.is_pistol.RELOAD_SPEED = 1.4
	self.shield.weapon.is_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.35, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.6, 0.8},
			dmg_mul = 1,
			recoil = {0.35, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.75},
			dmg_mul = 0.8,
			recoil = {0.35, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.75},
			dmg_mul = 0.8,
			recoil = {0.35, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.6},
			dmg_mul = 0.6,
			recoil = {0.35, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.phalanx_minion.weapon.is_smg.aim_delay = {0, 0}
	self.phalanx_minion.weapon.is_smg.focus_delay = 0
	self.phalanx_minion.weapon.is_smg.focus_dis = 200
	self.phalanx_minion.weapon.is_smg.RELOAD_SPEED = 1.4
	self.phalanx_minion.weapon.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.95},
			dmg_mul = 1,
			recoil = {0.35, 0.35},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 500,
			acc = {0.8, 0.8},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 0.8,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.7},
			dmg_mul = 0.8,
			recoil = {0.35, 1},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.5},
			dmg_mul = 0.6,
			recoil = {0.5, 1.2},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.phalanx_vip.weapon.is_smg.aim_delay = {0, 0}
	self.phalanx_vip.weapon.is_smg.focus_delay = 0
	self.phalanx_vip.weapon.is_smg.focus_dis = 200
	self.phalanx_vip.weapon.is_smg.RELOAD_SPEED = 1.4
	self.phalanx_vip.weapon.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.95},
			dmg_mul = 1,
			recoil = {0.35, 0.35},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 500,
			acc = {0.8, 0.8},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 0.8,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.7},
			dmg_mul = 0.8,
			recoil = {0.35, 1},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.5},
			dmg_mul = 0.6,
			recoil = {0.5, 1.2},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.taser.weapon.is_rifle.aim_delay = {0, 0}
	self.taser.weapon.is_rifle.focus_delay = 0
	self.taser.weapon.is_rifle.RELOAD_SPEED = 1.4
	self.taser.weapon.is_rifle.melee_dmg = 20
	self.taser.weapon.is_rifle.range = {
		close = 2000,
		optimal = 3500,
		far = 6000
	}
	self.taser.weapon.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.975},
			dmg_mul = 0.66,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.875, 0.95},
			dmg_mul = 0.66,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				8,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.9},
			dmg_mul = 0.53,
			recoil = {0.35, 0.55},
			mode = {
				0,
				2,
				5,
				1
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.85},
			dmg_mul = 0.53,
			recoil = {0.4, 0.7},
			mode = {
				3,
				2,
				5,
				1
			}
		},
		{
			r = 3000,
			acc = {0.65, 0.75},
			dmg_mul = 0.53,
			recoil = {0.7, 1.1},
			mode = {
				3,
				1,
				5,
				0.5
			}
		},
		{
			r = 6000,
			acc = {0.25, 0.7},
			dmg_mul = 0.4,
			recoil = {1, 2},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.sniper.weapon.is_rifle.RELOAD_SPEED = 1.4
	self.sniper.weapon.is_rifle.melee_dmg = 20
	self.sniper.weapon.is_rifle.FALLOFF = {
		{
			r = 700,
			acc = {0.7, 1},
			dmg_mul = 12,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.95},
			dmg_mul = 12,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.2, 0.8},
			dmg_mul = 12,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.heavy_swat_sniper.weapon.is_rifle.RELOAD_SPEED = 1.4
	self.heavy_swat_sniper.weapon.is_rifle.melee_dmg = 20
	self.heavy_swat_sniper.weapon.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {1, 1},
			dmg_mul = 12,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.7, 1},
			dmg_mul = 12,
			recoil = {0.5, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 1},
			dmg_mul = 12,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 1},
			dmg_mul = 12,
			recoil = {1.5, 1.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.7, 1},
			dmg_mul = 12,
			recoil = {1.75, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.95},
			dmg_mul = 12,
			recoil = {2, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.2, 0.8},
			dmg_mul = 12,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.spooc.spooc_attack_timeout = {3, 4}
	self.taser.spawn_sound_event = nil
	self.tank.spawn_sound_event = nil
	self.tank_hw.spawn_sound_event = nil
	self.tank_medic.spawn_sound_event = nil
	self.tank_mini.spawn_sound_event = nil
	self.phalanx_minion.HEALTH_INIT = 400
	self.phalanx_minion.DAMAGE_CLAMP_BULLET = 185
	self.phalanx_minion.DAMAGE_CLAMP_EXPLOSION = 80
	self.phalanx_vip.HEALTH_INIT = 800
	self.phalanx_vip.DAMAGE_CLAMP_BULLET = 135
	self.phalanx_vip.DAMAGE_CLAMP_EXPLOSION = 80
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 1
end
function CharacterTweakData:_set_sm_wish()
	if SystemInfo:platform() == Idstring("PS3") then
		self:_multiply_all_hp(9, 1.5)
	else
		self:_multiply_all_hp(9, 1.5)
	end
	self.hector_boss.HEALTH_INIT = 900
	self.mobster_boss.HEALTH_INIT = 900
	self.biker_boss.HEALTH_INIT = 900
	self.chavez_boss.HEALTH_INIT = 900
	self.drug_lord_boss.HEALTH_INIT = 900
	self:_multiply_all_speeds(3.05, 3.1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self.presets.gang_member_damage.REGENERATE_TIME = 2
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 2
	self.presets.gang_member_damage.HEALTH_INIT = 600
	self.presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = 80
	self.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.2
	self.presets.weapon.gang_member.is_pistol.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 5.4,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 5.4,
			recoil = {0.45, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 5.4,
			recoil = {0.45, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 5.4,
			recoil = {0.65, 0.85},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 5.4,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_pistol_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 5.4,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 5.4,
			recoil = {0.25, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 5.4,
			recoil = {0.25, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 5.4,
			recoil = {0.45, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_pistol_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 5.4,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 5.4,
			recoil = {0.65, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 5.4,
			recoil = {0.65, 0.85},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 5.4,
			recoil = {0.85, 1.05},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 5.4,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_revolver.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 5.4,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 5.4,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 5.4,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 5.4,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 5.4,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 5.4,
			recoil = {0.75, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 5.4,
			recoil = {1.5, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.75, 0.8},
			dmg_mul = 5.4,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.75},
			dmg_mul = 5.4,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.65, 0.7},
			dmg_mul = 5.4,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.65},
			dmg_mul = 5.4,
			recoil = {0.5, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.45, 0.55},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.9, 0.95},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.85, 0.9},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.8, 0.85},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.75, 0.8},
			dmg_mul = 5.4,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.6, 0.7},
			dmg_mul = 5.4,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_rifle_dmr.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.7, 0.8},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 5.4,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 5.4,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_winchester.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 5.4,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 5.4,
			recoil = {1.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_semi.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_semi_fast.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 5.4,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 5.4,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_slow.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 5.4,
			recoil = {2.4, 2.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 5.4,
			recoil = {2.4, 2.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_sniper_50cal.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {1, 1},
			dmg_mul = 5.4,
			recoil = {1.5, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.9, 0.95},
			dmg_mul = 5.4,
			recoil = {3, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 100000,
			acc = {0.7, 0.8},
			dmg_mul = 5.4,
			recoil = {3, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_lmg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.85, 0.9},
			dmg_mul = 5.4,
			recoil = {0.8, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.8},
			dmg_mul = 3.6,
			recoil = {0.8, 0.8},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.7},
			dmg_mul = 1.8,
			recoil = {0.8, 1.25},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.02, 0.25},
			dmg_mul = 0.72,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.01, 0.1},
			dmg_mul = 0.36,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_pump.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.8, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 5.76,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.6,
			recoil = {1.2, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.3,
			recoil = {1.2, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.15,
			recoil = {1.6, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.075,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_mag.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 5.76,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 5.4,
			recoil = {0.18, 0.18},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.6,
			recoil = {0.38, 0.58},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.3,
			recoil = {0.58, 0.78},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.15,
			recoil = {0.78, 0.98},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.075,
			recoil = {0.98, 1.98},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_mag_aa12.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 5.76,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 5.4,
			recoil = {0.2, 0.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.6,
			recoil = {0.4, 0.6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.3,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.15,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.075,
			recoil = {1, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_shotgun_semi.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 5.76,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 5.4,
			recoil = {0.4, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.6,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.3,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.15,
			recoil = {1, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.075,
			recoil = {1.2, 1.2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_smg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 5.4,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 5.4,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 5.4,
			recoil = {0.75, 0.75},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 5.4,
			recoil = {0.75, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 5.4,
			recoil = {1.5, 1.5},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_smg_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.65, 0.7},
			dmg_mul = 5.4,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.65},
			dmg_mul = 5.4,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.55, 0.6},
			dmg_mul = 5.4,
			recoil = {0.5, 0.5},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.55},
			dmg_mul = 5.4,
			recoil = {0.5, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.35, 0.45},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.is_smg_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.1, 0.1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.85},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 5.4,
			recoil = {1, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 5.4,
			recoil = {2, 2},
			mode = {
				0,
				0,
				0,
				1
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_pistol.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 5.4,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 5.4,
			recoil = {0.225, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 5.4,
			recoil = {0.225, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 5.4,
			recoil = {0.325, 0.425},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 5.4,
			recoil = {0.6, 0.6},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_pistol_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 5.4,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.55, 0.6},
			dmg_mul = 5.4,
			recoil = {0.125, 0.125},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.55},
			dmg_mul = 5.4,
			recoil = {0.125, 0.225},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.5},
			dmg_mul = 5.4,
			recoil = {0.225, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.3, 0.4},
			dmg_mul = 5.4,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_pistol_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 5.4,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 5.4,
			recoil = {0.325, 0.325},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 5.4,
			recoil = {0.325, 0.425},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 5.4,
			recoil = {0.425, 0.525},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 5.4,
			recoil = {0.7, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_revolver.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.85},
			dmg_mul = 5.4,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.75, 0.8},
			dmg_mul = 5.4,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.7, 0.75},
			dmg_mul = 5.4,
			recoil = {0.5, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.65, 0.7},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.5, 0.6},
			dmg_mul = 5.4,
			recoil = {1, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_smg.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 5.4,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.55, 0.6},
			dmg_mul = 5.4,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.55},
			dmg_mul = 5.4,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.45, 0.5},
			dmg_mul = 5.4,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.3, 0.4},
			dmg_mul = 5.4,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_smg_light.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.5, 0.55},
			dmg_mul = 5.4,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.45, 0.5},
			dmg_mul = 5.4,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.4, 0.45},
			dmg_mul = 5.4,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.35, 0.4},
			dmg_mul = 5.4,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.2, 0.3},
			dmg_mul = 5.4,
			recoil = {0.04, 0.04},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_smg_heavy.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.75},
			dmg_mul = 5.4,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.7},
			dmg_mul = 5.4,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 5.4,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.55, 0.6},
			dmg_mul = 5.4,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.4, 0.5},
			dmg_mul = 5.4,
			recoil = {0.037, 0.037},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.akimbo_shotgun_mag.FALLOFF = {
		{
			r = 300,
			acc = {1, 1},
			dmg_mul = 7.2,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.9},
			dmg_mul = 5.76,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.8},
			dmg_mul = 5.4,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.7},
			dmg_mul = 0.6,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.6},
			dmg_mul = 0.3,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.4, 0.5},
			dmg_mul = 0.15,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.1, 0.2},
			dmg_mul = 0.075,
			recoil = {0.1, 0.1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.presets.weapon.gang_member.is_bullpup = self.presets.weapon.gang_member.is_rifle
	self.presets.weapon.gang_member.mac11 = self.presets.weapon.gang_member.is_smg
	self:_set_characters_weapon_preset("deathwish")
	self.medic.weapon.is_rifle.aim_delay = {0, 0}
	self.medic.weapon.is_rifle.focus_delay = 0
	self.medic.weapon.is_rifle.RELOAD_SPEED = 1.4
	self.medic.weapon.is_rifle.melee_dmg = 20
	self.medic.weapon.is_rifle.range = {
		close = 2000,
		optimal = 3500,
		far = 6000
	}
	self.medic.weapon.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.975},
			dmg_mul = 0.66,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.875, 0.95},
			dmg_mul = 0.66,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				8,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.9},
			dmg_mul = 0.66,
			recoil = {0.35, 0.55},
			mode = {
				0,
				2,
				5,
				1
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.85},
			dmg_mul = 0.66,
			recoil = {0.4, 0.7},
			mode = {
				3,
				2,
				5,
				1
			}
		},
		{
			r = 3000,
			acc = {0.65, 0.75},
			dmg_mul = 0.66,
			recoil = {0.7, 1.1},
			mode = {
				3,
				1,
				5,
				0.5
			}
		},
		{
			r = 6000,
			acc = {0.25, 0.7},
			dmg_mul = 0.66,
			recoil = {1, 2},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.medic.weapon.is_shotgun_pump.aim_delay = {0, 0}
	self.medic.weapon.is_shotgun_pump.focus_delay = 0
	self.medic.weapon.is_shotgun_pump.RELOAD_SPEED = 1.4
	self.medic.weapon.is_shotgun_pump.melee_dmg = 20
	self.medic.weapon.is_shotgun_pump.range = {
		close = 2000,
		optimal = 3000,
		far = 5000
	}
	self.medic.weapon.is_shotgun_pump.FALLOFF = {
		{
			r = 100,
			acc = {0.95, 0.95},
			dmg_mul = 0.66,
			recoil = {1, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.7, 0.95},
			dmg_mul = 0.62,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.5, 0.8},
			dmg_mul = 0.58,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.45, 0.65},
			dmg_mul = 0.41,
			recoil = {1.25, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.3, 0.5},
			dmg_mul = 0.25,
			recoil = {1.5, 1.75},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.shield.weapon.is_smg.aim_delay = {0, 0}
	self.shield.weapon.is_smg.focus_delay = 0
	self.shield.weapon.is_smg.focus_dis = 200
	self.shield.weapon.is_smg.RELOAD_SPEED = 1.4
	self.shield.weapon.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.95},
			dmg_mul = 1,
			recoil = {0.35, 0.35},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 500,
			acc = {0.8, 0.8},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 0.8,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.7},
			dmg_mul = 0.8,
			recoil = {0.35, 1},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.5},
			dmg_mul = 0.6,
			recoil = {0.5, 1.2},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.shield.weapon.is_pistol.aim_delay = {0, 0}
	self.shield.weapon.is_pistol.focus_delay = 0
	self.shield.weapon.is_pistol.focus_dis = 200
	self.shield.weapon.is_pistol.RELOAD_SPEED = 1.4
	self.shield.weapon.is_pistol.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 1,
			recoil = {0.35, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.6, 0.8},
			dmg_mul = 1,
			recoil = {0.35, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.75},
			dmg_mul = 0.8,
			recoil = {0.35, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.75},
			dmg_mul = 0.8,
			recoil = {0.35, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.6},
			dmg_mul = 0.6,
			recoil = {0.35, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.phalanx_minion.weapon.is_smg.aim_delay = {0, 0}
	self.phalanx_minion.weapon.is_smg.focus_delay = 0
	self.phalanx_minion.weapon.is_smg.focus_dis = 200
	self.phalanx_minion.weapon.is_smg.RELOAD_SPEED = 1.4
	self.phalanx_minion.weapon.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.95},
			dmg_mul = 1,
			recoil = {0.35, 0.35},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 500,
			acc = {0.8, 0.8},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 0.8,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.7},
			dmg_mul = 0.8,
			recoil = {0.35, 1},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.5},
			dmg_mul = 0.6,
			recoil = {0.5, 1.2},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.phalanx_vip.weapon.is_smg.aim_delay = {0, 0}
	self.phalanx_vip.weapon.is_smg.focus_delay = 0
	self.phalanx_vip.weapon.is_smg.focus_dis = 200
	self.phalanx_vip.weapon.is_smg.RELOAD_SPEED = 1.4
	self.phalanx_vip.weapon.is_smg.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.95},
			dmg_mul = 1,
			recoil = {0.35, 0.35},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 500,
			acc = {0.8, 0.8},
			dmg_mul = 1,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 0.8,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.7},
			dmg_mul = 0.8,
			recoil = {0.35, 1},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.5},
			dmg_mul = 0.6,
			recoil = {0.5, 1.2},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.taser.weapon.is_rifle.aim_delay = {0, 0}
	self.taser.weapon.is_rifle.focus_delay = 0
	self.taser.weapon.is_rifle.RELOAD_SPEED = 1.4
	self.taser.weapon.is_rifle.melee_dmg = 20
	self.taser.weapon.is_rifle.range = {
		close = 2000,
		optimal = 3500,
		far = 6000
	}
	self.taser.weapon.is_rifle.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.975},
			dmg_mul = 0.66,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.875, 0.95},
			dmg_mul = 0.66,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				8,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.9},
			dmg_mul = 0.53,
			recoil = {0.35, 0.55},
			mode = {
				0,
				2,
				5,
				1
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.85},
			dmg_mul = 0.53,
			recoil = {0.4, 0.7},
			mode = {
				3,
				2,
				5,
				1
			}
		},
		{
			r = 3000,
			acc = {0.65, 0.75},
			dmg_mul = 0.53,
			recoil = {0.7, 1.1},
			mode = {
				3,
				1,
				5,
				0.5
			}
		},
		{
			r = 6000,
			acc = {0.25, 0.7},
			dmg_mul = 0.4,
			recoil = {1, 2},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.sniper.weapon.is_rifle.RELOAD_SPEED = 1.4
	self.sniper.weapon.is_rifle.melee_dmg = 20
	self.sniper.weapon.is_rifle.FALLOFF = {
		{
			r = 700,
			acc = {0.7, 1},
			dmg_mul = 12,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.95},
			dmg_mul = 12,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.2, 0.8},
			dmg_mul = 12,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.heavy_swat_sniper.weapon.is_rifle.RELOAD_SPEED = 1.4
	self.heavy_swat_sniper.weapon.is_rifle.melee_dmg = 20
	self.heavy_swat_sniper.weapon.is_rifle.FALLOFF = {
		{
			r = 700,
			acc = {0.7, 1},
			dmg_mul = 12,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.95},
			dmg_mul = 12,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.2, 0.8},
			dmg_mul = 12,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.spooc.spooc_attack_timeout = {3, 4}
	self.swat.suppression = self.presets.suppression.zeal
	self.swat.surrender = self.presets.surrender.zeal
	self.swat.chatter = self.presets.enemy_chatter.zeal
	self.heavy_swat.suppression = self.presets.suppression.zeal
	self.heavy_swat.surrender = self.presets.surrender.zeal
	self.heavy_swat.chatter = self.presets.enemy_chatter.zeal
	self.taser.spawn_sound_event = nil
	self.tank.spawn_sound_event = nil
	self.tank_hw.spawn_sound_event = nil
	self.tank_medic.spawn_sound_event = nil
	self.tank_mini.spawn_sound_event = nil
	self.phalanx_minion.HEALTH_INIT = 400
	self.phalanx_minion.DAMAGE_CLAMP_BULLET = 185
	self.phalanx_minion.DAMAGE_CLAMP_EXPLOSION = 80
	self.phalanx_vip.HEALTH_INIT = 800
	self.phalanx_vip.DAMAGE_CLAMP_BULLET = 135
	self.phalanx_vip.DAMAGE_CLAMP_EXPLOSION = 80
	self.flashbang_multiplier = 2
	self.concussion_multiplier = 1
end
function CharacterTweakData:_multiply_weapon_delay(weap_usage_table, mul)
	for _, weap_id in ipairs(self.weap_ids) do
		local usage_data = weap_usage_table[weap_id]
		if usage_data then
			usage_data.focus_delay = usage_data.focus_delay * mul
		end
	end
end
function CharacterTweakData:_multiply_all_hp(hp_mul, hs_mul)
	self.cop_female.HEALTH_INIT = self.cop_female.HEALTH_INIT * hp_mul
	self.fbi.HEALTH_INIT = self.fbi.HEALTH_INIT * hp_mul
	self.swat.HEALTH_INIT = self.swat.HEALTH_INIT * hp_mul
	self.heavy_swat.HEALTH_INIT = self.heavy_swat.HEALTH_INIT * hp_mul
	self.heavy_swat_sniper.HEALTH_INIT = self.heavy_swat_sniper.HEALTH_INIT * hp_mul
	self.fbi_heavy_swat.HEALTH_INIT = self.fbi_heavy_swat.HEALTH_INIT * hp_mul
	self.sniper.HEALTH_INIT = self.sniper.HEALTH_INIT * hp_mul
	self.gangster.HEALTH_INIT = self.gangster.HEALTH_INIT * hp_mul
	self.biker.HEALTH_INIT = self.biker.HEALTH_INIT * hp_mul
	self.mobster.HEALTH_INIT = self.mobster.HEALTH_INIT * hp_mul
	self.tank.HEALTH_INIT = self.tank.HEALTH_INIT * hp_mul
	self.tank_medic.HEALTH_INIT = self.tank_medic.HEALTH_INIT * hp_mul
	self.tank_mini.HEALTH_INIT = self.tank_mini.HEALTH_INIT * hp_mul
	self.spooc.HEALTH_INIT = self.spooc.HEALTH_INIT * hp_mul
	self.shield.HEALTH_INIT = self.shield.HEALTH_INIT * hp_mul
	self.taser.HEALTH_INIT = self.taser.HEALTH_INIT * hp_mul
	self.city_swat.HEALTH_INIT = self.city_swat.HEALTH_INIT * hp_mul
	self.biker_escape.HEALTH_INIT = self.biker_escape.HEALTH_INIT * hp_mul
	self.fbi_swat.HEALTH_INIT = self.fbi_swat.HEALTH_INIT * hp_mul
	self.tank_hw.HEALTH_INIT = self.tank_hw.HEALTH_INIT * hp_mul
	self.medic.HEALTH_INIT = self.medic.HEALTH_INIT * hp_mul
	self.bolivian.HEALTH_INIT = self.bolivian.HEALTH_INIT * hp_mul
	self.bolivian_indoors.HEALTH_INIT = self.bolivian_indoors.HEALTH_INIT * hp_mul
	if self.security.headshot_dmg_mul then
		self.security.headshot_dmg_mul = self.security.headshot_dmg_mul * hs_mul
	end
	if self.cop.headshot_dmg_mul then
		self.cop.headshot_dmg_mul = self.cop.headshot_dmg_mul * hs_mul
	end
	if self.cop_female.headshot_dmg_mul then
		self.cop_female.headshot_dmg_mul = self.cop_female.headshot_dmg_mul * hs_mul
	end
	if self.fbi.headshot_dmg_mul then
		self.fbi.headshot_dmg_mul = self.fbi.headshot_dmg_mul * hs_mul
	end
	if self.swat.headshot_dmg_mul then
		self.swat.headshot_dmg_mul = self.swat.headshot_dmg_mul * hs_mul
	end
	if self.heavy_swat.headshot_dmg_mul then
		self.heavy_swat.headshot_dmg_mul = self.heavy_swat.headshot_dmg_mul * hs_mul
	end
	if self.heavy_swat_sniper.headshot_dmg_mul then
		self.heavy_swat_sniper.headshot_dmg_mul = self.heavy_swat_sniper.headshot_dmg_mul * hs_mul
	end
	if self.fbi_heavy_swat.headshot_dmg_mul then
		self.fbi_heavy_swat.headshot_dmg_mul = self.fbi_heavy_swat.headshot_dmg_mul * hs_mul
	end
	if self.sniper.headshot_dmg_mul then
		self.sniper.headshot_dmg_mul = self.sniper.headshot_dmg_mul * hs_mul
	end
	if self.gangster.headshot_dmg_mul then
		self.gangster.headshot_dmg_mul = self.gangster.headshot_dmg_mul * hs_mul
	end
	if self.biker.headshot_dmg_mul then
		self.biker.headshot_dmg_mul = self.biker.headshot_dmg_mul * hs_mul
	end
	if self.mobster.headshot_dmg_mul then
		self.mobster.headshot_dmg_mul = self.mobster.headshot_dmg_mul * hs_mul
	end
	if self.tank.headshot_dmg_mul then
		self.tank.headshot_dmg_mul = self.tank.headshot_dmg_mul * hs_mul
	end
	if self.tank_medic.headshot_dmg_mul then
		self.tank_medic.headshot_dmg_mul = self.tank_medic.headshot_dmg_mul * hs_mul
	end
	if self.tank_mini.headshot_dmg_mul then
		self.tank_mini.headshot_dmg_mul = self.tank_mini.headshot_dmg_mul * hs_mul
	end
	if self.spooc.headshot_dmg_mul then
		self.spooc.headshot_dmg_mul = self.spooc.headshot_dmg_mul * hs_mul
	end
	if self.shield.headshot_dmg_mul then
		self.shield.headshot_dmg_mul = self.shield.headshot_dmg_mul * hs_mul
	end
	if self.phalanx_minion.headshot_dmg_mul then
		self.phalanx_minion.headshot_dmg_mul = self.phalanx_minion.headshot_dmg_mul * hs_mul
	end
	if self.taser.headshot_dmg_mul then
		self.taser.headshot_dmg_mul = self.taser.headshot_dmg_mul * hs_mul
	end
	if self.biker_escape.headshot_dmg_mul then
		self.biker_escape.headshot_dmg_mul = self.biker_escape.headshot_dmg_mul * hs_mul
	end
	if self.city_swat.headshot_dmg_mul then
		self.city_swat.headshot_dmg_mul = self.city_swat.headshot_dmg_mul * hs_mul
	end
	if self.fbi_swat.headshot_dmg_mul then
		self.fbi_swat.headshot_dmg_mul = self.fbi_swat.headshot_dmg_mul * hs_mul
	end
	if self.medic.headshot_dmg_mul then
		self.medic.headshot_dmg_mul = self.medic.headshot_dmg_mul * hs_mul
	end
	if self.bolivian.headshot_dmg_mul then
		self.bolivian.headshot_dmg_mul = self.bolivian.headshot_dmg_mul * hs_mul
	end
	if self.bolivian_indoors.headshot_dmg_mul then
		self.bolivian_indoors.headshot_dmg_mul = self.bolivian_indoors.headshot_dmg_mul * hs_mul
	end
end
function CharacterTweakData:_multiply_all_speeds(walk_mul, run_mul)
	local all_units = {
		"security",
		"cop",
		"cop_female",
		"gensec",
		"fbi",
		"swat",
		"heavy_swat",
		"heavy_swat_sniper",
		"sniper",
		"gangster",
		"biker",
		"biker_escape",
		"mobster",
		"bolivian",
		"bolivian_indoors",
		"tank",
		"tank_medic",
		"tank_mini",
		"tank_hw",
		"spooc",
		"shield",
		"phalanx_minion",
		"phalanx_vip",
		"taser",
		"medic",
		"city_swat",
		"fbi_swat",
		"fbi_heavy_swat"
	}
	table.insert(all_units, "bolivian")
	table.insert(all_units, "bolivian_indoors")
	for _, name in ipairs(all_units) do
		local speed_table = self[name].SPEED_WALK
		speed_table.hos = speed_table.hos * walk_mul
		speed_table.cbt = speed_table.cbt * walk_mul
	end
	self.security.SPEED_RUN = self.security.SPEED_RUN * run_mul
	self.cop.SPEED_RUN = self.cop.SPEED_RUN * run_mul
	self.cop_female.SPEED_RUN = self.cop_female.SPEED_RUN * run_mul
	self.fbi.SPEED_RUN = self.fbi.SPEED_RUN * run_mul
	self.gensec.SPEED_RUN = self.gensec.SPEED_RUN * run_mul
	self.swat.SPEED_RUN = self.swat.SPEED_RUN * run_mul
	self.heavy_swat.SPEED_RUN = self.heavy_swat.SPEED_RUN * run_mul
	self.heavy_swat_sniper.SPEED_RUN = self.heavy_swat_sniper.SPEED_RUN * run_mul
	self.fbi_heavy_swat.SPEED_RUN = self.fbi_heavy_swat.SPEED_RUN * run_mul
	self.sniper.SPEED_RUN = self.sniper.SPEED_RUN * run_mul
	self.gangster.SPEED_RUN = self.gangster.SPEED_RUN * run_mul
	self.biker.SPEED_RUN = self.biker.SPEED_RUN * run_mul
	self.mobster.SPEED_RUN = self.mobster.SPEED_RUN * run_mul
	self.bolivian.SPEED_RUN = self.bolivian.SPEED_RUN * run_mul
	self.bolivian_indoors.SPEED_RUN = self.bolivian_indoors.SPEED_RUN * run_mul
	self.tank.SPEED_RUN = self.tank.SPEED_RUN * run_mul
	self.tank_medic.SPEED_RUN = self.tank_medic.SPEED_RUN * run_mul
	self.tank_mini.SPEED_RUN = self.tank_mini.SPEED_RUN * run_mul
	self.tank_hw.SPEED_RUN = self.tank_hw.SPEED_RUN * run_mul
	self.spooc.SPEED_RUN = self.spooc.SPEED_RUN * run_mul
	self.shield.SPEED_RUN = self.shield.SPEED_RUN * run_mul
	self.phalanx_minion.SPEED_RUN = self.phalanx_minion.SPEED_RUN * run_mul
	self.phalanx_vip.SPEED_RUN = self.phalanx_vip.SPEED_RUN * run_mul
	self.taser.SPEED_RUN = self.taser.SPEED_RUN * run_mul
	self.medic.SPEED_RUN = self.medic.SPEED_RUN * run_mul
	self.city_swat.SPEED_RUN = self.city_swat.SPEED_RUN * run_mul
	self.biker_escape.SPEED_RUN = self.biker_escape.SPEED_RUN * run_mul
	self.fbi_swat.SPEED_RUN = self.fbi_swat.SPEED_RUN * run_mul
end
function CharacterTweakData:_set_characters_weapon_preset(preset)
	local all_units = {
		"security",
		"cop",
		"cop_female",
		"gensec",
		"fbi",
		"swat",
		"heavy_swat",
		"gangster",
		"biker",
		"biker_escape",
		"mobster",
		"bolivian",
		"bolivian_indoors",
		"tank",
		"tank_hw",
		"tank_medic",
		"tank_mini",
		"spooc",
		"city_swat",
		"fbi_swat",
		"fbi_heavy_swat"
		
	}
	for _, name in ipairs(all_units) do
		self[name].weapon = self.presets.weapon[preset]
	end
end
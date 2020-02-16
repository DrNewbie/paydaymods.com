local data = SkillTreeTweakData.init
function SkillTreeTweakData:init(tweak_data)
	data(self, tweak_data)
	
	self.skills.technician.name_id = "menu_technician"
	self.skills.t_unlock = {
		["name_id"] = "t_unlock",
		["desc_id"] = "t_unlock_desc",
		["icon_xy"] = {7, 4},
		[1] = {
			upgrades = {
				"trip_mine",
				"trip_mine_can_switch_on_off"
			},
			cost = self.costs.unlock_tree,
			desc_id = "t_tier1"
		},
		[2] = { upgrades = {}, desc_id = "t_tier2" },
		[3] = { upgrades = {}, desc_id = "t_tier3" },
		[4] = { upgrades = {}, desc_id = "t_tier4" },
		[5] = { upgrades = {}, desc_id = "t_tier5" },
		[6] = { upgrades = {}, desc_id = "t_tier6" }
	}
	
	-- TIER 1	 [ RIFLEMAN ]	LEFT --
	self.skills.t_left1 = {
		["name_id"] = "t_left1",
		["desc_id"] = "t_left1_desc",
		["icon_xy"] = {0, 5},
		[1] = {
			upgrades = {
				"assault_rifle_enter_steelsight_speed_multiplier"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"ar_acc_increase_1"
			},
			cost = self.costs.pro
		}
	}
	-- TIER 1	 [ Combat Engineer ]	MIDDLE --
	self.skills.t_mid1 = {
		["name_id"] = "t_mid1",
		["desc_id"] = "t_mid1_desc",
		["icon_xy"] = {4, 6},
		[1] = {
			upgrades = {
				"trip_mine_sensor_toggle",
				"trip_mine_sensor_highlight"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"trip_mine_marked_enemy_extra_damage"
			},
			cost = self.costs.pro
		}
	}
	-- TIER 1	 [ NERVES OF STEEL ]	RIGHT --
	self.skills.t_right1 = {
		["name_id"] = "t_right1",
		["desc_id"] = "t_right1_desc",
		["icon_xy"] = {6, 6},
		[1] = {
			upgrades = {
				"player_interacting_damage_multiplier"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_steelsight_when_downed"
			},
			cost = self.costs.pro
		}
	}
	-- TIER 2	 [ SHARPSHOOTER ]	LEFT --
	self.skills.t_left2 = {
		["name_id"] = "t_left2",
		["desc_id"] = "t_left2_desc",
		["icon_xy"] = {6, 5},
		[1] = {
			upgrades = {
				"assault_rifle_recoil_index_addend"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"ar_acc_increase_2"
			},
			cost = self.costs.pro
		}
	}
	-- TIER 2	 [ BLAST RADIUS ]	MIDDLE --
	self.skills.t_mid2 = {
		["name_id"] = "t_mid2",
		["desc_id"] = "t_mid2_desc",
		["icon_xy"] = {1, 5},
		[1] = {
			upgrades = {
				"trip_mine_explosion_size_multiplier_1"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"trip_mine_explosion_size_multiplier_2"
			},
			cost = self.costs.pro
		}
	}
	-- TIER 2	 [ HARDWARE EXPERT ]	RIGHT --
	self.skills.t_right2 = {
		["name_id"] = "t_right2",
		["desc_id"] = "t_right2_desc",
		["icon_xy"] = {5, 5},
		[1] = {
			upgrades = {
				"player_drill_fix_interaction_speed_multiplier",
				"player_trip_mine_deploy_time_multiplier",
				"player_trip_mine_deploy_time_multiplier_2"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_drill_autorepair",
				"player_sentry_gun_deploy_time_multiplier"
			},
			cost = self.costs.pro
		}
	}
	-- TIER 3	 [ SENTRY GUN ]	LEFT --
	self.skills.t_left3 = {
		["name_id"] = "t_left3",
		["desc_id"] = "t_left3_desc",
		["icon_xy"] = {7, 5},
		[1] = {
			upgrades = {
				"sentry_gun",
				"sentry_gun_armor_multiplier",
				"sentry_gun_shield"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"sentry_gun_spread_multiplier",
				"sentry_gun_rot_speed_multiplier"
			},
			cost = self.costs.pro
		}
	}
	-- TIER 3	 [ JACK OF ALL TRADES ]	MIDDLE --
	self.skills.t_mid3 = {
		["name_id"] = "t_mid3",
		["desc_id"] = "t_mid3_desc",
		["icon_xy"] = {7, 6},
		[1] = {
			upgrades = {
				"player_interaction_speed"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_carry_sentry_and_trip"
			},
			cost = self.costs.pro
		}
	}
	-- TIER 3	 [ DRILL SAWGENT ]	RIGHT --
	self.skills.t_right3 = {
		["name_id"] = "t_right3",
		["desc_id"] = "t_right3_desc",
		["icon_xy"] = {3, 6},
		[1] = {
			upgrades = {
				"player_drill_speed_multiplier1"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_drill_speed_multiplier2"
			},
			cost = self.costs.pro
		}
	}
	-- TIER 4	 [ SENTRY MUNITIONS UPGRADE ]	LEFT --
	self.skills.t_left4 = {
		["name_id"] = "t_left4",
		["desc_id"] = "t_left4_desc",
		["icon_xy"] = {5, 6},
		["prerequisites"] = {"t_left3"},
		[1] = {
			upgrades = {
				"sentry_gun_extra_ammo_multiplier_1"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"sentry_gun_can_reload"
			},
			cost = self.costs.hightierpro
		}
	}
	-- TIER 4	 [ SHAPED CHARGE ]	MIDDLE --
	self.skills.t_mid4 = {
		["name_id"] = "t_mid4",
		["desc_id"] = "t_mid4_desc",
		["icon_xy"] = {0, 7},
		[1] = {
			upgrades = {
				"player_trip_mine_shaped_charge"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"trip_mine_quantity_increase_1",
				"trip_mine_quantity_increase_3"
			},
			cost = self.costs.hightierpro
		}
	}
	-- TIER 4	 [ SILENT DRILLING ]	RIGHT --
	self.skills.t_right4 = {
		["name_id"] = "t_right4",
		["desc_id"] = "t_right4_desc",
		["icon_xy"] = {2, 6},
		[1] = {
			upgrades = {
				"player_drill_alert"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_silent_drill"
			},
			cost = self.costs.hightierpro
		}
	}
	-- TIER 5	 [ SENTRY TOWER DEFENSE ]	RIGHT --
	self.skills.t_left5 = {
		["name_id"] = "t_left5",
		["desc_id"] = "t_left5_desc",
		["icon_xy"] = {7, 6},
		["prerequisites"] = {"t_left3"},
		[1] = {
			upgrades = {
				"sentry_gun_quantity_increase",
				"sentry_gun_can_revive"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"sentry_gun_damage_multiplier"
			},
			cost = self.costs.hightierpro
		}
	}
	-- TIER 5	 [ MAG PLUS ]	MIDDLE --
	self.skills.t_mid5 = {
		["name_id"] = "t_mid5",
		["desc_id"] = "t_mid5_desc",
		["icon_xy"] = {2, 0},
		[1] = {
			upgrades = {
				"weapon_mag_increase_1"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"weapon_mag_increase_2"
			},
			cost = self.costs.hightierpro
		}
	}
	-- TIER 5	 [ SHOCKPROOF ]	RIGHT --
	self.skills.t_right5 = {
		["name_id"] = "t_right5",
		["desc_id"] = "t_right5_desc",
		["icon_xy"] = {3, 5},
		[1] = {
			upgrades = {
				"player_taser_malfunction"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_taser_self_shock"
			--	"player_taser_feedback"
			},
			cost = self.costs.hightierpro
		}
	}
	-- TIER 6	 [ PERCUSSIVE MAINTENANCE ]	LEFT --
	self.skills.t_left6 = {
		["name_id"] = "t_left6",
		["desc_id"] = "t_left6_desc",
		["icon_xy"] = {1, 7},
		[1] = {
			upgrades = {
				"player_melee_ammo_replenish_chance",
				"player_melee_ammo_replenish"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_percussive_maintenance"
			},
			cost = self.costs.hightierpro
		}
	}
	-- TIER 6	 [ DROP RELOAD ]	MIDDLE --
	self.skills.t_mid6 = {
		["name_id"] = "t_mid6",
		["desc_id"] = "t_mid6_desc",
		["icon_xy"] = {0, 5},
		[1] = {
			upgrades = {
				"weapon_drop_reload_1"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"team_drop_reload"
			},
			cost = self.costs.hightierpro
		}
	}
	-- TIER 6	 [ BULLETPROOF ]	RIGHT --
	self.skills.t_right6 = {
		["name_id"] = "t_right6",
		["desc_id"] = "t_right6_desc",
		["icon_xy"] = {6, 4},
		[1] = {
			upgrades = {
				"player_armor_multiplier"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"team_armor_regen_time_multiplier"
			},
			cost = self.costs.hightierpro
		}
	}
	
	self.trees[3] = {
		name_id = "st_menu_technician",
		skill = "t_unlock",
		background_texture = "guis/textures/pd2/skilltree/bg_technician",
		tiers = {}
	}
	self.trees[3].tiers[1] = {
		"t_left1",
		"t_mid1",
		"t_right1"
	}
	self.trees[3].tiers[2] = {
		"t_left2",
		"t_mid2",
		"t_right2"
	}
	self.trees[3].tiers[3] = {
		"t_left3",
		"t_mid3",
		"t_right3"
	}
	self.trees[3].tiers[4] = {
		"t_left4",
		"t_mid4",
		"t_right4"
	}
	self.trees[3].tiers[5] = {
		"t_left5",
		"t_mid5",
		"t_right5"
	}
	self.trees[3].tiers[6] = {
		"t_left6",
		"t_mid6",
		"t_right6"
	}
end
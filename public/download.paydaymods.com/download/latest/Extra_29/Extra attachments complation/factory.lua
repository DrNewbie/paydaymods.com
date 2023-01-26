local old_init = WeaponFactoryTweakData.init
local vector_offset_combat = Vector3(0, 0, -3.3)
local vector_offset_milspec = Vector3(0, 0, -3.1)
function WeaponFactoryTweakData:init(tweak_data)
    old_init(self, tweak_data)
		self.parts.wpn_fps_ass_m14_body_dmr = {
		type = "stock",
		name_id = "bm_wp_m14_body_dmr",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_m14_pts/wpn_fps_ass_m14_body_dmr",
		stats = {value = 1}
	}
	self.parts.wpn_fps_ass_m14_body_ebr = {
		pcs = {30, 40},
		type = "stock",
		name_id = "bm_wp_m14_body_ebr",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_m14_pts/wpn_fps_ass_m14_body_ebr",
		stats = {
			value = 6,
			spread_moving = 3,
			recoil = 2,
			concealment = 2
		},
		forbids = {
			"wpn_fps_addon_ris"
		}
	}	
	self.parts.wpn_fps_upg_m4_m_quad = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_upg_m4_m_quad",
		a_obj = "a_m",
		texture_bundle_folder = "gage_pack_jobs",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_m_quad/wpn_fps_upg_m4_m_quad",
		stats = {
			value = 3,
			spread_moving = -2,
			concealment = -3,
			extra_ammo = 15,
			recoil = 1,
			spread = -1
		},
		dlc = "gage_pack_jobs",	
		override = {
		wpn_fps_ass_g36_m_standard = {
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_m_quad/wpn_fps_upg_m4_m_quad"
			},
		wpn_fps_ass_tecci_m_drum = {
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_m_quad/wpn_fps_upg_m4_m_quad"
			}			
		}
	}
	self.parts.wpn_fps_ass_g3_b_short = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_g3_b_short",
		a_obj = "a_b",
		parent = "foregrip",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_b_short",
		stats = {
			value = 2,
			recoil = 5,
			spread = -4,
			concealment = 4,
			damage = -40,
			extra_ammo = 5,
			total_ammo_mod = 15
		},
		custom_stats = {
			ammo_pickup_min_mul = 1.55,
			ammo_pickup_max_mul = 2.1
		},		
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true,
		forbids = {
			"wpn_fps_ammo_type",
			"wpn_fps_upg_a_default"
		},
		override = {
			wpn_fps_upg_ass_ns_jprifles = {a_obj = "a_ns_s"},
			wpn_fps_upg_ass_ns_surefire = {a_obj = "a_ns_s"},
			wpn_fps_upg_ass_ns_battle = {a_obj = "a_ns_s"},
			wpn_fps_ass_g3_m_mag = {
				unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_m_30mag"
			}			
		}
	}
	self.parts.wpn_fps_ass_scar_a_l = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_scar_a_l",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		adds = {"wpn_fps_ass_scar_b_medium"},
		stats = {
			value = 2,
			recoil = 3,
			spread = -3,
			concealment = 5,
			damage = -40,
			extra_ammo = 5,
			total_ammo_mod = 12
		},
		custom_stats = {
			ammo_pickup_min_mul = 1.65,
			ammo_pickup_max_mul = 2.4
		},		
		is_a_unlockable = true,
		override = {
			wpn_fps_ass_scar_b_medium = {
			unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_b_short"
			}			
		}
	}	
	self.parts.wpn_fps_upg_m4_m_pmag = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_m4_m_pmag",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 28},
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_pmag",
		stats = {
			value = 3,
			spread_moving = 1,
			concealment = 0,
			extra_ammo = 2
		},	
		override = {
		wpn_fps_ass_g36_m_standard = { 
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_pmag"
			},
		wpn_fps_ass_tecci_m_drum = { 
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_pmag"
			}			
		}
	}	
	self.parts.wpn_fps_m4_uupg_m_std = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_m4_uupg_m_std",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 2},
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_m_std",
		stats = {
			value = 1,
			extra_ammo = 4,
			concealment = -1
		},	
		override = {
		wpn_fps_ass_g36_m_standard = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_m_std"
			},
		wpn_fps_ass_tecci_m_drum = { 
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_m_std"
			}			
		}
	}
	self.parts.wpn_fps_upg_m4_m_l5 = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_upg_m4_m_l5",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 2},
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_m_l5/wpn_fps_upg_m4_m_l5",
		stats = {
			value = 1,
			extra_ammo = 2,
			recoil = 1
		},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true,	
		override = {
		wpn_fps_ass_g36_m_standard = { 
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_m_l5/wpn_fps_upg_m4_m_l5"
			},
		wpn_fps_ass_tecci_m_drum = { 
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_m_l5/wpn_fps_upg_m4_m_l5"
			},
		wpn_fps_aug_m_pmag = { 
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_m_l5/wpn_fps_upg_m4_m_l5"
			}			
		}
	}
	self.parts.wpn_fps_ass_l85a2_m_emag = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_l85a2_m_emag",
		bullet_objects = {prefix = "g_bullet_", amount = 28},
		a_obj = "a_m",
		unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_m_emag",
		stats = {
			value = 1,
			recoil = 1,
			extra_ammo = 2
		},
		texture_bundle_folder = "character_pack_clover",
		dlc = "character_pack_clover",	
		override = {
		wpn_fps_ass_g36_m_standard = { 
		unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_m_emag"
			},
		wpn_fps_ass_tecci_m_drum = { 
		unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_m_emag"
			},
		wpn_fps_aug_m_pmag = { 
		unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_m_emag"
			}			
		}
	}	
	self.parts.wpn_fps_ass_m14_body_jae = {
		pcs = {30, 40},
		type = "stock",
		name_id = "bm_wp_m14_body_jae",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_m14_pts/wpn_fps_ass_m14_body_jae",
		stats = {
			value = 10,
			spread_moving = -2,
			recoil = 3,
			concealment = -2,
			spread = 1
		},
		forbids = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_upg_a_slugs = {
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_slugs",
		desc_id = "bm_wp_upg_a_slugs_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		is_a_unlockable = true,
		has_description = true,
		internal_part = true,
		sub_type = "ammo_slug",
		stats = {
			value = 8,
			spread = 4,
			moving_spread = 2,
			recoil = -2
		},
		custom_stats = {
			damage_near_mul = 1,
			damage_far_mul = 99999,
			rays = 1,
			armor_piercing_add = 1,
		}
	}
	self.parts.wpn_fps_upg_a_blank = {
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_blank",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		is_a_unlockable = true,
		internal_part = true,
		sub_type = "ammo_slug",
		stats = {
			value = 0,
			damage = -500,
			total_ammo_mod = 17
		},
		custom_stats = {
			rays = 0
		}
	}
	self.parts.wpn_fps_snp_model70_s_legends = {
		pcs = {30, 40},
		type = "stock",
		name_id = "bm_wp_model70_s_legends",
		a_obj = "a_s",
		unit = "units/payday2_cash/safes/bah/weapons/wpn_fps_snp_model70_legendary_pts/wpn_fps_snp_model70_s_legend",
		third_unit =		"units/payday2_cash/safes/bah/weapons/wpn_fps_snp_model70_legendary_pts/wpn_third_snp_model70_s_legend",		
		stats = {
			value = 6,
			concealment = 3,
			recoil = -1
		},
		is_a_unlockable = true
	}
	self.parts.wpn_fps_snp_model70_b_legends = {
		pcs = {30, 40},	
		type = "barrel_ext",
		name_id = "bm_wp_model70_b_legends",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",		
		a_obj = "a_b",	
		override = {
		wpn_fps_snp_model70_b_standard = {
		unit = 	"units/pd2_dlc_berry/weapons/wpn_fps_snp_model70_pts/wpn_fps_snp_model70_b_short"	
			}
		},
		stats = {value = 7, spread = -1, concealment = 3},
		is_a_unlockable = true
	}
	self.parts.wpn_fps_sho_boot_fg_legend = {
		pcs = {30, 40},
		type = "lower_reciever",
		name_id = "bm_wp_boot_fg_legend",
		is_a_unlockable = true,
		a_obj = "a_fg",		
		adds = {
		"wpn_fps_sho_boot_body_standard"
		},
		unit = "units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_fg_legendary",
		override = {
		wpn_fps_sho_boot_fg_standard = {
		unit = "units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_fg_legendary"},
		wpn_fps_sho_boot_b_long = {
		unit = 	"units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_b_legendary"
			},
		wpn_fps_sho_boot_b_short = {
		unit = 
		"units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_b_legendary"	
			},
		wpn_fps_sho_boot_b_standard = {		
		unit = 
		"units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_b_legendary"	
			}			
		},		
		stats = {
			value = 6,
			damage = 1,
			spread = -1,		
			recoil = 1,
			concealment = -2
		}	
	}
	self.parts.wpn_fps_shot_boot_ns_bayonet = {
		pcs = {},
		type = "bayonet",
		name_id = "bm_wp_mosin_ns_bayonet",
		a_obj = "a_ns",
		parent = "barrel",
		perks = {"bayonet"},
		unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_snp_mosin_pts/wpn_fps_snp_mosin_ns_bayonet",
		stats = {
			value = 1,
			concealment = -2,
			min_damage = 4,
			max_damage = 4,
			min_damage_effect = 1.75,
			max_damage_effect = 1.75
		}
	}	
	self.parts.wpn_fps_sho_boot_o_iron = {
		pcs = {30, 40},
		type = "sight",
		is_a_unlockable = true,
		name_id = "bm_wp_boot_o_iron",
		a_obj = "a_o",
		unit = "units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_o_legendary",
		stats = {value = 3, zoom = 1, recoil = 1, concealment = -1},
		perks = {"scope"},
		stance_mod = {
		wpn_fps_sho_boot = {
			translation = Vector3(0, -5, -1.5)
			},
		wpn_fps_shot_r870 = {
			translation = Vector3(0.01, -13, -0.96)
			},
		wpn_fps_shot_serbu = {
			translation = Vector3(0, -13, -0.96)
			},
		wpn_fps_shot_m37 = {
			translation = Vector3(0, 0, -1.2)
			},
		wpn_fps_snp_winchester = {
			translation = Vector3( 0,-5.25, 0.0 ), rotation = Rotation( 0,-0.2875,0)
			},
		wpn_fps_snp_wa2000 = {
			translation = Vector3 (0, -7, 3.2)
			},	
		wpn_fps_snp_msr = {
			translation = Vector3(0, -5, -0.60)
			}
		}
	}	
	self.parts.wpn_fps_sho_boot_o_adapter = {
		pcs = {30, 40},		
		type = "grip",
		name_id = "bm_wp_boot_o_extra",
		a_obj = "a_o",
		unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot_pts/wpn_fps_sho_boot_o_adapter",
		stats = {value = 2}
	}
	self.parts.wpn_fps_shot_r870_body_legends = {
		pcs = {30, 40},	
		type = "lower_reciever",
		name_id = "bm_wp_r870_b_legend",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_body_standard",third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_body_standard",		
		stats = {
			value = 7,
			spread = 1,
			concealment = -2
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special",
			"wpn_fps_upg_o_specter",
			"wpn_fps_upg_o_aimpoint",
			"wpn_fps_upg_o_docter",
			"wpn_fps_upg_o_eotech",
			"wpn_fps_upg_o_t1micro",
			"wpn_fps_upg_o_rx30",
			"wpn_fps_upg_o_rx01",
			"wpn_fps_upg_o_reflex",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_o_cmore",
			"wpn_fps_upg_o_aimpoint_2",
			"wpn_fps_upg_o_acog",
			"wpn_fps_upg_o_cs"
		},		
		override = {
		wpn_fps_shot_r870_b_long = {
			unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_b_legend/wpn_fps_shot_r870_b_legendary"
			},
		wpn_fps_shot_r870_b_short = {
			unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_b_legend/wpn_fps_shot_r870_b_legendary"
			},
		wpn_fps_shot_r870_m_extended = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
		wpn_fps_shot_r870_fg_big = {
			unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_fg_legendary"
			},			
		wpn_fps_shot_r870_fg_small = {
			unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_fg_legendary"
			},
		wpn_fps_shot_r870_fg_railed = {
			unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_fg_legendary"
			},
		wpn_fps_shot_r870_fg_wood = {
			unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_fg_legendary"
			},				
		wpn_fps_upg_ns_shot_thick = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
		wpn_fps_upg_ns_shot_shark = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},	
		wpn_fps_upg_shot_ns_king = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},		
		wpn_fps_upg_ns_sho_salvo_large = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
		wpn_fps_shot_r870_s_folding = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},	
		wpn_fps_shot_r870_s_m4 = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},	
		wpn_fps_shot_r870_s_solid = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
		wpn_fps_shot_r870_s_nostock_big = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},	
		wpn_fps_shot_r870_s_nostock_single = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},	
		wpn_fps_shot_r870_s_nostock = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},	
		wpn_fps_shot_r870_s_solid_big = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},	
		wpn_fps_shot_r870_s_solid_single = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
		wpn_fps_shot_shorty_s_nostock_short = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
		wpn_fps_shot_shorty_s_solid_short = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
		wpn_fps_shot_r870_s_nostock_vanilla = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},			
		wpn_fps_upg_m4_s_crane = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
		wpn_fps_shot_r870_s_solid_vanilla = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
		wpn_fps_upg_m4_s_standard = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
		wpn_fps_upg_m4_s_pts = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},			
		wpn_fps_upg_m4_s_mk46 = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
		wpn_fps_upg_m4_s_ubr = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			}		
		},
		is_a_unlockable = true,
		stance_mod = {
			wpn_fps_shot_r870 = {
				translation = Vector3(0, -5, 0.8)
			},
			wpn_fps_shot_serbu = {
				translation = Vector3 (0, 0, 0.90)
			}
		}
	}	
	self.parts.wpn_fps_ak_g_vlad = {
		pcs = {
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_upg_ass_74_g_legend",
		a_obj = "a_g",
		is_a_unlockable = true,
		forbids = {
			"wpn_upg_ak_g_standard",
			"wpn_upg_ak_s_psl"
		},		
		unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_g_legend",
		third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_g_legend",
		stats = {
		value = 7,
		spread = 1,
		concealment = -1,
		recoil = 1
		}
	}
	self.parts.wpn_upg_ak_s_psl = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_ak_s_psl",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_psl",
		stats = {
			value = 6,
			spread = 3,
			spread_moving = -3,
			recoil = 0,
			concealment = -3
		},	
		forbids = {
			"wpn_upg_ak_g_standard",
			"wpn_fps_upg_ak_g_hgrip",
			"wpn_fps_upg_ak_g_wgrip",
			"wpn_fps_upg_ak_g_pgrip",
			"wpn_fps_ak_g_vlad",
			"wpn_fps_upg_ak_g_rk3"
		}
}	
	self.parts.wpn_upg_ak_fl_vlad = {
		type = "gadget",
		sub_type = "laser",
		name_id = "bm_wp_upg_ass_74_fl_legend",
		a_obj = "a_body",
		unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fl_legend",
		stats = {value = 1},
		perks = {"gadget"}
	}	
	self.parts.wpn_upg_ak_s_vlad = {
		pcs = {
			20,
			30,
			40
		},	
		type = "stock",
		name_id = "bm_wp_upg_ass_74_s_legend",
		a_obj = "a_s",
		adds = {"wpn_upg_ak_g_standard"},		
		unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_s_legend",
		third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_s_legend",
		stats = {value = 6, spread = -1, recoil = 3, concealment = -2},
		is_a_unlockable = true,
	}	
	self.parts.wpn_fps_ak_fg_vlad = {
		pcs = {
			20,
			30,
			40
		},
		type = "foregrip",
		is_a_unlockable = true,
		adds = {"wpn_upg_ak_fl_vlad"},
		name_id = "bm_wp_upg_ass_74_fg_legend",
		forbids = {
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_bp_lmg_lionbipod",
		"wpn_fps_upg_fl_ass_smg_sho_surefire"
		},
		a_obj = "a_fg",
		unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fg_legend",
		third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_fg_legend",	
		override = {
			wpn_fps_lmg_rpk_b_standard = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_fps_ass_74_b_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_ass_74_b_legend"
			},
			wpn_fps_ass_akm_b_standard = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_fps_ass_74_b_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_ass_74_b_legend"
			},	
			wpn_fps_upg_ns_ass_smg_large = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_upg_ns_ass_smg_medium = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_upg_ns_ass_smg_small = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_upg_ns_ass_smg_firepig = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_upg_ns_ass_smg_stubby = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_upg_ns_ass_smg_tank = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_upg_ass_ns_battle = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_smg_polymer_ns_silencer = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_ass_tecci_ns_special = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_smg_cobray_ns_barrelextension = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_smg_cobray_ns_silencer = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_ass_tecci_ns_special = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_smg_mp7_b_suppressed = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},	
			wpn_fps_smg_mp9_b_suppressed = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_upg_ass_ns_jprifles = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},	
			wpn_fps_upg_ass_ns_linear = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},	
			wpn_fps_upg_ass_ns_surefire = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_smg_polymer_barrel_precision = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},	
			wpn_fps_upg_ns_ass_pbs1 = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_upg_ak_ns_ak105 = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_ass_74_b_standard = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_fps_ass_74_b_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_ass_74_b_legend"
			},
			wpn_fps_upg_ak_b_draco = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_fps_ass_74_b_legend",	
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_ass_74_b_legend"
			},
			wpn_fps_upg_ass_ak_b_zastava = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_fps_ass_74_b_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_ass_74_b_legend"
			},			
			wpn_fps_upg_ak_b_ak105 = {
			override = {			
			wpn_fps_upg_ns_ass_smg_large = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_upg_ns_ass_smg_medium = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_upg_ns_ass_smg_small = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_upg_ns_ass_smg_firepig = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_upg_ns_ass_smg_stubby = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_upg_ns_ass_smg_tank = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_upg_ass_ns_battle = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_smg_polymer_ns_silencer = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_ass_tecci_ns_special = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_smg_cobray_ns_barrelextension = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_smg_cobray_ns_silencer = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_ass_tecci_ns_special = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_smg_mp7_b_suppressed = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},	
			wpn_fps_smg_mp9_b_suppressed = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_upg_ass_ns_jprifles = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},	
			wpn_fps_upg_ass_ns_linear = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},	
			wpn_fps_upg_ass_ns_surefire = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},
			wpn_fps_smg_polymer_barrel_precision = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			},	
			wpn_fps_upg_ns_ass_pbs1 = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			}},
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_fps_ass_74_b_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_ass_74_b_legend"
			}			
		},
		stats = {
		value = 5,
		spread = 3,
		concealment = -2,
		recoil = -1
		}
	}
	self.parts.wpn_fps_lmg_m134_body_upper_spikei = {
		pcs = {
			20,
			30,
			40
		},	
		type = "extra",
		name_id = "bm_wp_m134_body_upper_spikey",
		a_obj = "a_body",
		is_a_unlockable = true,		
		unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_fps_lmg_m134_body_upper_spikey",
		stats = {value = 8, concealment = -3, spread = 3, recoil = 4, damage = -4}
	}
	self.parts.wpn_fps_lmg_m134_barrel_legends = {
		pcs = {30, 40},	
		type = "barrel",
		name_id = "bm_wp_m134_barrel_legendary",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		a_obj = "a_b",
		adds = {"wpn_fps_lmg_m134_barrel"},
		override = {
		wpn_fps_lmg_m134_barrel = {
		unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_fps_lmg_m134_barrel_legendary",
		third_unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_third_lmg_m134_barrel_legendary"
			}
		},
		stats = {value = 9, concealment = -5, spread = 2, recoil = 2},
		is_a_unlockable = true,
		animations = {fire = "recoil", fire_steelsight = "recoil"}
	}		
	self.parts.wpn_fps_pis_judge_g_legends = {
		pcs = {30, 40},		
		type = "grip",
		name_id = "bm_wp_judge_g_legend",
		a_obj = "a_g",
		unit = "units/payday2_cash/safes/burn/weapons/wpn_fps_pis_judge_g_legend/wpn_fps_pis_judge_g_legend",
		stats = {value = 5, spread = 1},
		is_a_unlockable = true
	}
	self.parts.wpn_fps_pis_judge_b_legends = {
		pcs = {30, 40},	
		type = "extra",
		name_id = "bm_wp_judge_b_legend",
		a_obj = "a_b",
		unit = 	"units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		stats = {
			value = 8,
			spread = 3,
			damage = 2,
			suppression = -4,
			concealment = -4
		},
		is_a_unlockable = true,
		forbids = {
		"wpn_fps_upg_ns_sho_salvo_large",
		"wpn_fps_upg_ns_shot_thick",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_shot_ns_king"
		},
		override = {
		wpn_fps_pis_judge_b_standard = {
		unit = "units/payday2_cash/safes/burn/weapons/wpn_fps_pis_judge_b_legend/wpn_fps_pis_judge_b_legend",
		third_unit = "units/payday2_cash/safes/burn/weapons/wpn_fps_pis_judge_b_legend/wpn_third_pis_judge_b_legend"
			}
		}
	}
	self.parts.wpn_fps_pis_deagle_b_legends = {
		pcs = {30, 40},		
		type = "slide",
		name_id = "bm_wp_deagle_b_legend",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		stats = {
			value = 9,
			spread = 2,
			recoil = -3,
			damage = 4,
			suppression = -7,
			concealment = -10
		},
		adds = {"wpn_fps_pis_deagle_b_long"},
		is_a_unlockable = true,
		forbids = {
			"wpn_fps_pis_deagle_co_long",
			"wpn_fps_pis_deagle_co_short",
			"wpn_fps_upg_ns_pis_meatgrinder",
			"wpn_fps_upg_fl_pis_m3x",
			"wpn_fps_upg_ns_ass_filter",
			"wpn_fps_upg_ns_pis_jungle",
			"wpn_fps_upg_ns_pis_small",
			"wpn_fps_upg_ns_pis_medium",
			"wpn_fps_upg_ns_pis_large",
			"wpn_fps_upg_ns_pis_large_kac",
			"wpn_fps_upg_ns_pis_medium_gem",
			"wpn_fps_upg_pis_ns_flash",
			"wpn_fps_upg_ns_pis_medium_slim",
			"wpn_fps_upg_ns_pis_ipsccomp"
		},
		override = {
		wpn_fps_pis_deagle_o_standard_front_long = {
		a_obj = "a_os",
		unit ="units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_o_standard_front"},
		wpn_fps_pis_deagle_b_long = {
		unit = 
		"units/payday2_cash/safes/cf15/weapons/wpn_fps_pis_deagle_bling_pts/wpn_fps_pis_deagle_b_legend",
		third_unit = "units/payday2_cash/safes/cf15/weapons/wpn_fps_pis_deagle_bling_pts/wpn_third_pis_deagle_b_legend"}
		}
	}	
	self.parts.wpn_fps_lmg_svinet_s_legends = {
		pcs = {30, 40},	
		type = "stock",
		name_id = "bm_wp_svinet_s_legend",
		a_obj = "a_s",
		unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_s_legendary/wpn_fps_lmg_svinet_s_legend",
		third_unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_s_legendary/wpn_third_lmg_svinet_s_legend",
		stats = {value = 5, spread = 2, recoil = -1, concealment =-3},
		is_a_unlockable = true
	}
	self.parts.wpn_fps_lmg_svinet_b_legendas = {
		pcs = {30, 40},	
		type = "slide",
		name_id = "bm_wp_svinet_b_standard",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		override = {
		wpn_fps_lmg_par_b_standard = {
		unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_b_legendary/wpn_fps_lmg_svinet_b_standard",
		third_unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_b_legendary/wpn_third_lmg_svinet_b_legend"}
		},
		stats = {
			value = 7,
			spread = 2,
			damage = 2,
			recoil = -1,
			total_ammo_mod = -3,
			concealment = -3
		},
		is_a_unlockable = true
	}
	self.parts.wpn_fps_smg_p90_b_legends = {
		pcs = {30, 40},	
		type = "slide",
		name_id = "bm_wp_p90_b_legend",
		forbids = {"wpn_fps_smg_p90_b_ninja"},
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",		
		override = {
		wpn_fps_smg_p90_b_short = {
			unit = "units/payday2_cash/safes/dallas/weapons/wpn_fps_smg_p90_b_legendary/wpn_fps_smg_p90_b_legend",
			third_unit = "units/payday2_cash/safes/dallas/weapons/wpn_third_smg_p90_b_legendary/wpn_third_smg_p90_b_legend"
			},
		wpn_fps_smg_p90_b_long = {
			unit = "units/payday2_cash/safes/dallas/weapons/wpn_fps_smg_p90_b_legendary/wpn_fps_smg_p90_b_legend",
			third_unit = "units/payday2_cash/safes/dallas/weapons/wpn_third_smg_p90_b_legendary/wpn_third_smg_p90_b_legend"
			},			
		wpn_fps_smg_p90_b_civilian = {
			unit = "units/payday2_cash/safes/dallas/weapons/wpn_fps_smg_p90_b_legendary/wpn_fps_smg_p90_b_legend",
			third_unit = "units/payday2_cash/safes/dallas/weapons/wpn_third_smg_p90_b_legendary/wpn_third_smg_p90_b_legend"
			}			
		},
		stats = {value = 5, total_ammo_mod = -4, damage = 3, concealment = -2},
		is_a_unlockable = true
	}	
	self.parts.wpn_fps_rpg7_m_legends = {
		pcs = {30, 40},	
		type = "extra",
		name_id = "bm_wp_rpg7_m_rocket",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",		
		adds = {"wpn_fps_rpg7_m_rocket"},
		override = {
		wpn_fps_rpg7_m_rocket = {
		unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_rpg7_m_grinclown/wpn_fps_rpg7_m_grinclown"}
		},		
		stats = {value = 9},
		is_a_unlockable = true,
		animations = {reload = "reload"}
	}
	self.parts.wpn_fps_ass_tecci_s_short = {
		pcs = {30, 40},	
		is_a_unlockable = true,		
		type = "stock",
		name_id = "bm_wp_tecci_s_short",
		a_obj = "a_s",
		unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_s_standard",
		third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_s_standard",
		stats = {value = 4, concealment = 3, spread = -1}
	}	
	self.parts.wpn_fps_ass_m16_fg_legends = {
		pcs = {30, 40},	
		type = "foregrip",
		name_id = "bm_wp_m16_fg_legend",
		a_obj = "a_fg",
		unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_fg_legend",
		third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_fg_legend",
		stats = {value = 9, recoil = 2, spread = 2, concealment = -7},
		is_a_unlockable = true,
		adds = {"wpn_fps_ass_m16_o_handle_sight"},
		override = {
			wpn_fps_upg_ns_ass_smg_large = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_medium = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_small = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_firepig = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_stubby = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_tank = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ass_ns_battle = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_smg_polymer_ns_silencer = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_ass_tecci_ns_special = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_smg_cobray_ns_barrelextension = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_smg_cobray_ns_silencer = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_ass_tecci_ns_special = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_smg_mp7_b_suppressed = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},	
			wpn_fps_smg_mp9_b_suppressed = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ass_ns_jprifles = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},	
			wpn_fps_upg_ass_ns_linear = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},	
			wpn_fps_upg_ass_ns_surefire = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},				
			wpn_fps_upg_o_specter = {
				forbids = {
				"wpn_fps_ass_m16_o_handle_sight"
					}
			},
			wpn_fps_upg_o_aimpoint = {
				forbids = {
				"wpn_fps_ass_m16_o_handle_sight"
					}
			},
			wpn_fps_upg_o_aimpoint_2 = {
				forbids = {
				"wpn_fps_ass_m16_o_handle_sight"
					}
			},
			wpn_fps_upg_o_docter = {
				forbids = {
				"wpn_fps_ass_m16_o_handle_sight"
					}
			},
			wpn_fps_upg_o_eotech = {
				forbids = {
				"wpn_fps_ass_m16_o_handle_sight"
					}
			},
			wpn_fps_upg_o_t1micro = {
				forbids = {
				"wpn_fps_ass_m16_o_handle_sight"
					}
				},
			wpn_fps_upg_o_cmore = {
				forbids = {
				"wpn_fps_ass_m16_o_handle_sight"
					}
			},
			wpn_fps_upg_o_cs = {
				forbids = {
				"wpn_fps_ass_m16_o_handle_sight"
					}
			},
			wpn_fps_upg_o_eotech_xps = {
				forbids = {
				"wpn_fps_ass_m16_o_handle_sight"
					}
			},
			wpn_fps_upg_o_reflex = {
				forbids = {
				"wpn_fps_ass_m16_o_handle_sight"
					}
			},
			wpn_fps_upg_o_rx01 = {
				forbids = {
				"wpn_fps_ass_m16_o_handle_sight"
					}
			},
			wpn_fps_upg_o_rx30 = {
				forbids = {
				"wpn_fps_ass_m16_o_handle_sight"
					}
			},
			wpn_fps_upg_o_acog = {
				forbids = {
				"wpn_fps_ass_m16_o_handle_sight"
					}
			},
		wpn_fps_m4_uupg_b_short = {
		unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_b_legend"},	wpn_fps_m4_uupg_b_sd = {
		unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_b_legend"},
		wpn_fps_m4_uupg_b_long = {
		unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_b_legend"},	
		wpn_fps_m4_uupg_b_medium_vanilla = {
		unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_b_legend"},
		wpn_fps_upg_ass_m4_b_beowulf = {
		unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_b_legend"}
		},		
		forbids = {
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_ass_m16_os_frontsight",
		"wpn_fps_m4_uupg_o_flipup",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_vg_ass_smg_stubby",
		"wpn_fps_upg_vg_ass_smg_verticalgrip",
		"wpn_fps_upg_vg_ass_smg_afg",
		"wpn_fps_upg_fl_ass_smg_sho_surefire"
		},		
		stance_mod = {
			wpn_fps_ass_m16 = {
				translation = Vector3(0, 10, -0.12)
			},
			wpn_fps_ass_m4 = {
				translation = Vector3(0, 10, 0)
			}			
		},
		perks = {"gadget"}
	}
	self.parts.wpn_fps_ass_m16_s_legends = {
		pcs = {30, 40},	
		type = "stock",
		name_id = "bm_wp_m16_s_legend",
		a_obj = "a_s",
		adds = {"wpn_fps_upg_m4_g_standard_vanilla"},
		forbids = {
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_upg_m4_g_sniper"
		},
		unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_s_legend",
		third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_s_legend",
		stats = {
			value = 8,
			spread = 2,
			recoil = 1,
			concealment = -4
		},
		override = {
		wpn_fps_upg_m4_g_standard_vanilla = {
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_upg_m4_g_mgrip/wpn_fps_upg_m4_g_mgrip"	
			}
		},
		is_a_unlockable = true,
		stance_mod = {
			wpn_fps_ass_m16 = {
				translation = Vector3(0, 0, 0)
			}
		}
	}
	self.parts.wpn_fps_pis_1911_g_legends = {
		pcs = {30, 40},	
		type = "grip",
		name_id = "bm_wp_1911_g_legendary",
		a_obj = "a_g",
		unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_g_legendary/wpn_fps_pis_1911_g_legendary",
		third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_g_legendary/wpn_third_pis_1911_g_legendary",
		stats = {value = 5, spread = 1, recoil = 1, concealment = -3},
		is_a_unlockable = true
	}
	self.parts.wpn_fps_pis_1911_fl_legends = {
		pcs = {30, 40},	
		type = "gadget",
		sub_type = "laser",
		name_id = "bm_wp_1911_fl_legendary",
		a_obj = "a_fl",
		unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_fps_pis_1911_fl_legendary",
		third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_third_pis_1911_fl_legendary",
		override = {
		wpn_fps_pis_1911_o_long = {
		stance_mod = {
			wpn_fps_pis_1911 = {
			translation = Vector3(7, -5, -1),
					}
				}
			}
		},	
		stats = {
			value = 7,
			spread = 1,
			concealment = -4,
			recoil = 1
		},
		forbids = {
		"wpn_fps_upg_o_rmr",
		"wpn_upg_o_marksmansight_rear"
		},		
		is_a_unlockable = true,		
		perks = {"gadget"}
	}	
		self.parts.wpn_fps_shot_r870_fg_railed = {
		pcs = {30, 40},
		type = "foregrip",
		name_id = "bm_wp_r870_fg_railed",
		is_a_unlockable = true,
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_fg_railed",
		stats = {value = 1, spread = 1},
		animations = {
			reload_exit = "reload_exit",
			fire = "recoil",
			fire_steelsight = "recoil_zoom"
		}
	}
	
	self.parts.wpn_fps_upg_a_customx4 = {
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_customx4",
		desc_id = "bm_wp_upg_a_customx4_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		is_a_unlockable = true,
		has_description = true,
		internal_part = true,
		sub_type = "ammo_custom",
		stats = {
			value = 7,
			total_ammo_mod = -4,
			damage = 25
		},
		custom_stats = {
			ammo_pickup_min_mul = 0.6,
			ammo_pickup_max_mul = 1,
			rays = 4
		}
	}
	self.parts.wpn_fps_upg_s_none = {
		pcs = {30, 40},
		type = "stock",
		name_id = "bm_wp_upg_s_none",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		is_a_unlockable = true,
		stats = {
			value = 2,
			spread = -2,
			recoil = -3,
			concealment = 3
		},
		adds = {
			"wpn_upg_ak_g_standard"
		}
	}
		self.parts.wpn_fps_upg_a_minishell = {
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_minishell",
		desc_id = "bm_wp_upg_a_minishell_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		is_a_unlockable = true,
		has_description = true,
		internal_part = true,
		sub_type = "ammo_custom",
		stats = {
			value = 4,
			spread = -2,
			extra_ammo = 5
		},
		custom_stats = {
			rays = 4
		}
	}
		self.parts.wpn_fps_upg_a_minishellslug = {
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_minishellslug",
		desc_id = "bm_wp_upg_a_minishell_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		is_a_unlockable = true,
		has_description = true,
		internal_part = true,
		sub_type = "ammo_slug",
		stats = {
			value = 5,
			spread = 1,
			damage = -15,
			extra_ammo = 5
		},
		custom_stats = {
			rays = 1,
			damage_near_mul = 1,
			damage_far_mul = 9999,
			armor_piercing_add = 1,
			ammo_pickup_min_mul = 1,
			ammo_pickup_max_mul = 1.4
		}
	}	
	self.parts.wpn_fps_upg_o_akimbo = {
		pcs = {},
		type = "gadget",
		name_id = "bm_wpn_fps_upg_o_akimbo",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_fps_gre_m79_sight_up_dummy",
		a_obj = "a_o",
		sub_type = "second_sight",
		stats = {value = 1, gadget_zoom = 1},
		perks = {"gadget"},
		internal_part = true,
		is_a_unlockable = true,
		forbids = {"wpn_fps_upg_o_milspeciron",
				   "wpn_fps_upg_o_combatiron"},
		stance_mod = {
			wpn_fps_x_1911 = {
				translation = Vector3 (-11.1, 6, 2.85), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			},
			wpn_fps_x_b92fs = {
				translation = Vector3 (-10.3, 5, 3.10), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			},
			wpn_fps_smg_x_sr2 = {
				translation = Vector3 (-11.1, 6, 3), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			},
		    wpn_fps_smg_x_akmsu = {
				translation = Vector3 (-10.9, 6, 2.4), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
			},
	        wpn_fps_smg_x_mp5 = {
				translation = Vector3 (-10.9, 6, 2), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
			},
			wpn_fps_pis_x_g22c = {
				translation = Vector3 (-11.1, 6, 5.45), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			},
			wpn_fps_pis_x_g17 = {
				translation = Vector3 (-11.1, 6, 5.45), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			},
			wpn_fps_jowi = {
				translation = Vector3 (-11.2, 6, 3.05), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			},			
			wpn_fps_pis_x_usp = {
				translation = Vector3 (-11.1, 6, 3.35), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			},
			wpn_fps_x_deagle = {
				translation = Vector3 (-11.1, 10, 2.5), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			}
		}
}
self.parts.wpn_fps_upg_o_milspeciron = {
		pcs = {},
		type = "gadget",
		name_id = "bm_wpn_fps_upg_o_milspeciron",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_fps_gre_m79_sight_up_dummy",
		a_obj = "a_o",
		sub_type = "second_sight",
		stats = {value = 1, gadget_zoom = 1},
		perks = {"gadget"},
		internal_part = true,
		is_a_unlockable = false,
		stance_mod = {
			wpn_fps_ass_m4 = {
				translation = Vector3(0, 0, -0.58) + vector_offset_milspec
			},
			wpn_fps_ass_amcar = {
				translation = Vector3(0, 0, -0.1) + vector_offset_milspec
			},
			wpn_fps_ass_m16 = {
				translation = Vector3(0, 0, -0.12) + vector_offset_milspec
			},
			wpn_fps_smg_olympic = {
				translation = Vector3(0, 0, -0.12) + vector_offset_milspec
			},
			 wpn_fps_ass_74 = {
				 translation = Vector3(0, 0, -3.1) + vector_offset_milspec
			 },
			 wpn_fps_ass_akm = {
				 translation = Vector3(0, 0, -3.6) + vector_offset_milspec
			 },
			 wpn_fps_ass_akm_gold = {
				 translation = Vector3(0, 0, -3.6) + vector_offset_milspec
			 },
			 wpn_fps_shot_saiga = {
				 translation = Vector3(0, -10, -3) + vector_offset_milspec
			 },
			wpn_fps_shot_r870 = {
				translation = Vector3(0.01, 0, -3.3) + vector_offset_milspec
			},
			wpn_fps_shot_serbu = {
				translation = Vector3(0, 0, -3.3) + vector_offset_milspec
			},
			 wpn_fps_smg_akmsu = {
				 translation = Vector3(-0.028, -7, -3.1) + vector_offset_milspec
			 },
			wpn_fps_ass_ak5 = {
				translation = Vector3(0.025, 0, -3.725) + vector_offset_milspec
			},
			wpn_fps_ass_aug = {
				translation = Vector3(0, 0, -2.8) + vector_offset_milspec
			},
			wpn_fps_ass_g36 = {
				translation = Vector3(0, 0, -3) + vector_offset_milspec
			},
			wpn_fps_smg_p90 = {
				translation = Vector3(0, 0, -2.97) + vector_offset_milspec
			},
			 wpn_fps_ass_m14 = {
				 translation = Vector3(-0.04, 0, -3.87) + vector_offset_milspec
			 },
			wpn_fps_smg_mp9 = {
				translation = Vector3(0, 0, -3.47) + vector_offset_milspec
			},
			wpn_fps_smg_mp5 = {
				translation = Vector3(0, 0, -3) + vector_offset_milspec
			},
			wpn_fps_smg_mac10 = {
				translation = Vector3(0, -10, -3) + vector_offset_milspec
			},
			wpn_fps_ass_s552 = {
				translation = Vector3(-0.08, 0, -2.1) + vector_offset_milspec
			},
			wpn_fps_smg_m45 = {
				translation = Vector3(0, 0, -3.9) + vector_offset_milspec
			},
			wpn_fps_smg_mp7 = {
				translation = Vector3(0, 0, -2.8) + vector_offset_milspec
			},
			wpn_fps_ass_scar = {
				translation = Vector3(0, 0, -0.25) + vector_offset_milspec
			},
			wpn_fps_pis_rage = {
				translation = Vector3(-0.05, -10, -4.65) + vector_offset_milspec
			},
			wpn_fps_pis_deagle = {
				translation = Vector3(0, -15, -4.25) + vector_offset_milspec,
				rotation = Rotation(0, -0.5, 0)
			},
			wpn_fps_snp_m95 = {
				translation = Vector3(0, 4, -3.8) + vector_offset_milspec
			},
			wpn_fps_snp_msr = {
				translation = Vector3(0, -7, -3.55) + vector_offset_milspec
			},
			wpn_fps_snp_r93 = {
				translation = Vector3(-0.022, -7, -3.782) + vector_offset_milspec
			},
			wpn_fps_ass_fal = {
				translation = Vector3(0, 4, -3.5) + vector_offset_milspec
			},
			wpn_fps_sho_ben = {
				translation = Vector3(0, 0, -3.2) + vector_offset_milspec
			},
			wpn_fps_sho_striker = {
				translation = Vector3(0, 0, -2.8) + vector_offset_milspec
			},
			wpn_fps_sho_ksg = {
				translation = Vector3(0, 0, -1.3) + vector_offset_milspec
			},
			wpn_fps_smg_scorpion = {
				translation = Vector3(0, -10, -5.2) + vector_offset_milspec
			},
			wpn_fps_smg_tec9 = {
				translation = Vector3(0, -8, -5) + vector_offset_milspec,
				rotation = Rotation(0, 0, 0)
			},
			wpn_fps_smg_uzi = {
				translation = Vector3(0, -8, -5.1) + vector_offset_milspec
			},
			wpn_fps_pis_judge = {
				translation = Vector3(-0.02, -10, -5.406) + vector_offset_milspec
			},
			wpn_fps_ass_g3 = {
				translation = Vector3(0.025, -8, -3.42) + vector_offset_milspec
			},
			wpn_fps_ass_galil = {
				translation = Vector3(-0.01, -5, -3.25) + vector_offset_milspec
			},
			wpn_fps_ass_famas = {
				translation = Vector3(0, 7, -6.2) + vector_offset_milspec
			},
			wpn_fps_sho_spas12 = {
				translation = Vector3(-0.2, 0, -3.9) + vector_offset_milspec
			},
			wpn_fps_smg_sterling = {
				translation = Vector3(0, -14, -3.61) + vector_offset_milspec
			},
			wpn_fps_snp_mosin = {
				translation = Vector3(0, -28, -4.3) + vector_offset_milspec
			},
			wpn_fps_smg_thompson = {
				translation = Vector3(0, -24, -4.2) + vector_offset_milspec
			},
			wpn_fps_ass_l85a2 = {
				translation = Vector3(0, 2, 1.85) + vector_offset_milspec
			},
			wpn_fps_ass_vhs = {
				translation = Vector3(-0.01, -3, -1.205) + vector_offset_milspec
			},
			-- wpn_fps_rpg7 = {
				-- translation = Vector3(0, 5, 0.04) + vector_offset_milspec,
				-- rotation = Rotation(0, 0, 0)
			-- },
			wpn_fps_sho_aa12 = {
				translation = Vector3(-0.01, 0, 0.07) + vector_offset_milspec,
				rotation = Rotation(0, 0, 0)
			},
			wpn_fps_gre_m32 = {
				translation = Vector3(0, 5, -4) + vector_offset_milspec,
				rotation = Rotation(0, -5, 0)
			},
			wpn_fps_smg_polymer = {
				translation = Vector3(0, 2, -0.65) + vector_offset_milspec,
				rotation = Rotation(0, 0, 0)
			},
			wpn_fps_snp_wa2000 = {
				translation = Vector3(0, -10, 0.75) + vector_offset_milspec,
				rotation = Rotation(0, 0, 0)
			},
			wpn_fps_snp_model70 = {
				translation = Vector3(0, -10, -4.05) + vector_offset_milspec,
				rotation = Rotation(0, 0, 0)
			},
			wpn_fps_shot_m37 = {
				translation = Vector3(0, -10, -4.05) + vector_offset_milspec,
				rotation = Rotation(0, 0, 0)
			},
			wpn_fps_smg_sr2 = {
				translation = Vector3(0, 5, -4.6) + vector_offset_milspec,
				rotation = Rotation(0, 0, 0)
			},
			wpn_fps_ass_tecci = {
				translation = Vector3(-0.01, 5, -1.7) + vector_offset_milspec,
				rotation = Rotation(0, 0, 0)
			}
		}
	}	
self.parts.wpn_fps_upg_o_specter.adds = {"wpn_fps_upg_o_milspeciron"}
	self.parts.wpn_fps_upg_o_combatiron = {
		pcs = {},
		type = "gadget",
		name_id = "bm_wpn_fps_upg_o_combatiron",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_fps_gre_m79_sight_up_dummy",
		a_obj = "a_o",
		sub_type = "second_sight",
		stats = {value = 1, gadget_zoom = 1},
		perks = {"gadget"},
		internal_part = true,
		is_a_unlockable = false,
		stance_mod = {
			wpn_fps_ass_m4 = {
				translation = Vector3(0, 0, -0.58) + vector_offset_combat
			},
			wpn_fps_ass_amcar = {
				translation = Vector3(0, 0, -0.1) + vector_offset_combat
			},
			wpn_fps_ass_m16 = {
				translation = Vector3(0, 0, -0.12) + vector_offset_combat
			},
			wpn_fps_smg_olympic = {
				translation = Vector3(0, 0, -0.12) + vector_offset_combat
			},
			 wpn_fps_ass_74 = {
				translation = Vector3(0, 0, -3.1) + vector_offset_combat
			},
			 wpn_fps_ass_akm = {
				 translation = Vector3(0, 0, -3.2) + vector_offset_combat
			 },
			 wpn_fps_ass_akm_gold = {
				 translation = Vector3(0, 0, -3.2) + vector_offset_combat
			 },
			 wpn_fps_shot_saiga = {
				 translation = Vector3(0, 0, -3) + vector_offset_combat
			 },
			wpn_fps_shot_r870 = {
				translation = Vector3(0.01, 0, -3.3) + vector_offset_combat
			},
			wpn_fps_shot_serbu = {
				translation = Vector3(0, 0, -3.3) + vector_offset_combat
			},
			 wpn_fps_smg_akmsu = {
				 translation = Vector3(-0.028, 0, -3.35) + vector_offset_combat
			 },
			wpn_fps_ass_ak5 = {
				translation = Vector3(0.025, 0, -3.725) + vector_offset_combat
			},
			wpn_fps_ass_aug = {
				translation = Vector3(0, 0, -2.8) + vector_offset_combat
			},
			wpn_fps_ass_g36 = {
				translation = Vector3(0, 0, -3) + vector_offset_combat
			},
			wpn_fps_smg_p90 = {
				translation = Vector3(0, 0, -2.97) + vector_offset_combat
			},
			 wpn_fps_ass_m14 = {
				 translation = Vector3(-0.04, 0, -3.87) + vector_offset_combat
			 },
			wpn_fps_smg_mp9 = {
				translation = Vector3(0, 0, -3.47) + vector_offset_combat
			},
			wpn_fps_smg_mp5 = {
				translation = Vector3(0, 0, -3) + vector_offset_combat
			},
			wpn_fps_smg_mac10 = {
				translation = Vector3(0, -10, -3) + vector_offset_combat
			},
			wpn_fps_ass_s552 = {
				translation = Vector3(-0.08, 0, -2.1) + vector_offset_combat
			},
			wpn_fps_smg_m45 = {
				translation = Vector3(0, 0, -3.9) + vector_offset_combat
			},
			wpn_fps_smg_mp7 = {
				translation = Vector3(0, 0, -2.8) + vector_offset_combat
			},
			wpn_fps_ass_scar = {
				translation = Vector3(0, 0, -0.25) + vector_offset_combat
			},
			wpn_fps_pis_rage = {
				translation = Vector3(-0.05, -10, -4.65) + vector_offset_combat
			},
			wpn_fps_pis_deagle = {
				translation = Vector3(0, -15, -4.25) + vector_offset_combat,
				rotation = Rotation(0, -0.5, 0)
			},
			wpn_fps_snp_m95 = {
				translation = Vector3(0, 4, -3.8) + vector_offset_combat
			},
			wpn_fps_snp_msr = {
				translation = Vector3(0, -7, -3.55) + vector_offset_combat
			},
			wpn_fps_snp_r93 = {
				translation = Vector3(-0.022, -7, -3.782) + vector_offset_combat
			},
			wpn_fps_ass_fal = {
				translation = Vector3(0, 4, -3.5) + vector_offset_combat
			},
			wpn_fps_sho_ben = {
				translation = Vector3(0, 0, -3.2) + vector_offset_combat
			},
			wpn_fps_sho_striker = {
				translation = Vector3(0, 0, -2.8) + vector_offset_combat
			},
			wpn_fps_sho_ksg = {
				translation = Vector3(0, 0, -1.3) + vector_offset_combat
			},
			wpn_fps_smg_scorpion = {
				translation = Vector3(0, -10, -5.2) + vector_offset_combat
			},
			wpn_fps_smg_tec9 = {
				translation = Vector3(0, -8, -5) + vector_offset_combat,
				rotation = Rotation(0, 0, 0)
			},
			wpn_fps_smg_uzi = {
				translation = Vector3(0, -8, -5.1) + vector_offset_combat
			},
			wpn_fps_pis_judge = {
				translation = Vector3(-0.02, -10, -5.406) + vector_offset_combat
			},
			wpn_fps_ass_g3 = {
				translation = Vector3(0.025, -8, -3.42) + vector_offset_combat
			},
			wpn_fps_ass_galil = {
				translation = Vector3(-0.01, -5, -3.25) + vector_offset_combat
			},
			wpn_fps_ass_famas = {
				translation = Vector3(0, 7, -6.2) + vector_offset_combat
			},
			wpn_fps_sho_spas12 = {
				translation = Vector3(-0.2, 0, -3.9) + vector_offset_combat
			},
			wpn_fps_smg_sterling = {
				translation = Vector3(0, -14, -3.61) + vector_offset_combat
			},
			wpn_fps_snp_mosin = {
				translation = Vector3(0, -28, -4.3) + vector_offset_combat
			},
			wpn_fps_smg_thompson = {
				translation = Vector3(0, -24, -4.2) + vector_offset_combat
			},
			wpn_fps_ass_l85a2 = {
				translation = Vector3(0, 2, 1.85) + vector_offset_combat
			},
			wpn_fps_ass_vhs = {
				translation = Vector3(-0.01, -3, -1.205) + vector_offset_combat
			},
			-- wpn_fps_rpg7 = {
				-- translation = Vector3(0, 5, 0.04) + vector_offset_combat,
				-- rotation = Rotation(0, 0, 0)
			-- },
			wpn_fps_sho_aa12 = {
				translation = Vector3(-0.01, 0, 0.07) + vector_offset_combat,
				rotation = Rotation(0, 0, 0)
			},
			wpn_fps_gre_m32 = {
				translation = Vector3(0, 5, -4) + vector_offset_combat,
				rotation = Rotation(0, -5, 0)
			},
			wpn_fps_smg_polymer = {
				translation = Vector3(0, 2, -0.65) + vector_offset_combat,
				rotation = Rotation(0, 0, 0)
			},
			wpn_fps_snp_wa2000 = {
				translation = Vector3(0, -10, 0.75) + vector_offset_combat,
				rotation = Rotation(0, 0, 0)
			},
			wpn_fps_snp_model70 = {
				translation = Vector3(0, -10, -4.05) + vector_offset_combat,
				rotation = Rotation(0, 0, 0)
			},
			wpn_fps_shot_m37 = {
				translation = Vector3(0, -10, -4.05) + vector_offset_combat,
				rotation = Rotation(0, 0, 0)
			},
			wpn_fps_smg_sr2 = {
				translation = Vector3(0, 5, -4.6) + vector_offset_combat,
				rotation = Rotation(0, 0, 0)
			},
			wpn_fps_ass_tecci = {
				translation = Vector3(-0.01, 5, -1.7) + vector_offset_combat,
				rotation = Rotation(0, 0, 0)
			}
		}
	}	
	self.parts.wpn_fps_upg_o_cs.adds = {"wpn_fps_upg_o_combatiron"}	
	self.parts.wpn_fps_upg_a_snipers = {
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_sniper",
		desc_id = "bm_wp_upg_a_sniper_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		is_a_unlockable = true,
		has_description = true,
		internal_part = true,
		sub_type = "ammo_slug",
		perks = {"fire_mode_single"},
		stats = {
			value = 5,
			total_ammo_mod = -10,
			damage = 40,
			recoil = -9
		},
		custom_stats = {
			armor_piercing_add = 1,
			can_shoot_through_enemy = true,
			can_shoot_through_shield = true,
			can_shoot_through_wall = true,
			ammo_pickup_min_mul = 0.3, 
			ammo_pickup_max_mul = 0.7
		},
		forbids = {
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_ass_g3_b_short",
			"wpn_fps_ass_g3_b_long",			
			"wpn_fps_upg_ass_ns_battle"
		}
	}
	self.parts.wpn_fps_ass_g3_b_long = {
		type = "barrel",
		name_id = "bm_wp_g3_b_long",
		a_obj = "a_b",
		parent = "foregrip",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_b_long",
		stats = {value = 2},
		forbids = {
			"wpn_fps_ammo_type",
			"wpn_fps_upg_a_default"
		},
		override = {
			wpn_fps_upg_ass_ns_jprifles = {a_obj = "a_ns_s"},
			wpn_fps_upg_ass_ns_surefire = {a_obj = "a_ns_s"},
			wpn_fps_upg_ass_ns_battle = {a_obj = "a_ns_s"}
		}
	}	
	self.parts.wpn_fps_upg_a_default = {
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_default",
		desc_id = "bm_wp_upg_a_default_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		is_a_unlockable = true,
		has_description = true,
		internal_part = true,
		sub_type = "ammo_slug",
		stats = {
			value = 0,
			total_ammo_mod = 7,
			spread = -1,
			recoil = 8,
			damage = 20
		},
		depends_on = "barrel",
		forbids = {
		"wpn_fps_upg_a_snipers",
		"wpn_fps_ass_g3_b_short",
		"wpn_fps_ass_g3_b_long"
		},
		custom_stats = {
			ammo_pickup_min_mul = 0.5, 
			ammo_pickup_max_mul = 0.5
		}
	}
	self.parts.wpn_fps_upg_ass_m4_b_beowulf = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_upg_ass_m4_b_beowulf",
		a_obj = "a_b",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_b_beowulf/wpn_fps_upg_ass_m4_b_beowulf",
		stats = {
			value = 1,
			spread = 4,
			recoil = -15,
			extra_ammo = -5,
			total_ammo_mod = -14,
			damage = 76,
			concealment = -4
		},
		adds = {
		"wpn_fps_upg_a_snipers"
		},
		sound_switch = {suppressed = "regular_b"},
		is_a_unlockable = true,
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack"
	}	
	self.parts.wpn_fps_ass_g3_b_sniper = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_g3_b_sniper",
		a_obj = "a_b",
		parent = "foregrip",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_b_sniper",
		stats = {
			value = 7,
			spread = 3,
			concealment = -2,
			total_ammo_mod = -13,
			damage = 60,
			recoil = -9,
			extra_ammo = -5
		},
		override = {
			wpn_fps_ass_g3_m_mag = {
				unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_m_mag_psg",
				third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_m_mag_psg"
			}
		},
		texture_bundle_folder = "gage_pack_assault",
		dlc = "gage_pack_assault",
		is_a_unlockable = true,
		adds = {
			"wpn_fps_upg_a_snipers"
		},
		perks = {
			"fire_mode_single"
		}
	}
self.wpn_fps_ass_g36.override = {
	wpn_fps_upg_tecci_m_cmag = {
		adds = {"wpn_fps_ass_g36_m_standard"},
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	},
	wpn_fps_upg_m4_m_quad = {
		adds = {"wpn_fps_ass_g36_m_standard"},
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	},
	wpn_fps_upg_m4_m_pmag = {
		adds = {"wpn_fps_ass_g36_m_standard"},
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	},
	wpn_fps_m4_uupg_m_std = {
		adds = {"wpn_fps_ass_g36_m_standard"},
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	},
	wpn_fps_ass_l85a2_m_emag = {
		adds = {"wpn_fps_ass_g36_m_standard"},
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	},
	wpn_fps_upg_m4_m_l5 = {
		adds = {"wpn_fps_ass_g36_m_standard"},
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	},	
	wpn_fps_upg_a_snipers = {
		stats = {
			value = 5,
			total_ammo_mod = -15,
			damage = 60,
			extra_ammo = -5,
			spread = 10,
			concealment = -10,
			recoil = -15
		},
		custom_stats = {
			armor_piercing_add = 1,
			can_shoot_through_enemy = true,
			can_shoot_through_shield = true,
			can_shoot_through_wall = true,
			ammo_pickup_min_mul = 0.3, 
			ammo_pickup_max_mul = 0.8
		},
		forbids = {
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_m4_m_pmag",
			"wpn_fps_upg_m4_m_straight",
			"wpn_fps_upg_m4_m_quad",
			"wpn_fps_upg_m4_m_l5",
			"wpn_fps_ass_l85a2_m_emag",
			"wpn_fps_upg_tecci_m_cmag",
			"wpn_fps_m4_uupg_m_std",
			"wpn_fps_upg_ass_ns_battle"
		}
},
wpn_fps_upg_o_leupold = {
	stance_mod = {
		wpn_fps_ass_g36 = {
		translation = Vector3(0.0, -24, -3.76)
			}
		}
	}
}	
self.wpn_fps_ass_m4.override = {
	wpn_fps_ass_m16_o_handle_sight = {
		stance_mod = {
		wpn_fps_ass_m4 = { 
			translation = Vector3(0 , 0, -0.6)
			}
		}
	},
	wpn_fps_m4_uupg_b_medium_vanilla = {
	forbids = {"wpn_fps_upg_a_default"}
},
	wpn_fps_m4_uupg_b_short = {
	forbids = {"wpn_fps_upg_a_default"}
},
	wpn_fps_m4_uupg_b_sd = {
	forbids = {"wpn_fps_upg_a_default"}
},
	wpn_fps_m4_uupg_b_long = {
	forbids = {"wpn_fps_upg_a_default"}
},
	wpn_fps_upg_a_default = {
		depends_on = "barrel",
		stats = {
			value = 0,
			extra_ammo = 5,
			total_ammo_mod = 2,
			recoil = 5,
			damage = 44
		},
		forbids = {
		"wpn_fps_upg_a_snipers"
		},
		custom_stats = {
			ammo_pickup_min_mul = 0.5, 
			ammo_pickup_max_mul = 0.5
		}
	},
	wpn_fps_upg_a_snipers = {
		custom_stats = {
			armor_piercing_add = 1,
			can_shoot_through_enemy = true,
			can_shoot_through_shield = true,
			can_shoot_through_wall = true,
			ammo_pickup_min_mul = 0.3, 
			ammo_pickup_max_mul = 0.8
		},
		forbids = {
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_m4_m_pmag",
			"wpn_fps_upg_m4_m_straight",
			"wpn_fps_upg_m4_m_quad",
			"wpn_fps_upg_m4_m_l5",
			"wpn_fps_ass_l85a2_m_emag",
			"wpn_fps_upg_ass_ns_battle"
		}
}
}		
self.wpn_fps_ass_g3.override = {
		wpn_fps_smg_mp5_s_adjust = {
		stats = {
			value = 3,
			spread = -1,
			recoil = -2,
			concealment = 2
			}
		},
		wpn_fps_upg_o_leupold = { 
		stance_mod = {
			wpn_fps_ass_g3 = { 
				translation = Vector3( 0.0275,-31.1,-4.31 )
				}
			}
		},
		wpn_fps_upg_o_45iron = { 
		stance_mod = {
			wpn_fps_ass_g3 = { 
				translation = Vector3( -0.7,8,-12.4 ),rotation = Rotation(0.75 ,-0.7, -45)
				}
			}
		},
		wpn_fps_upg_a_snipers = {
		custom_stats = {
			armor_piercing_add = 1,
			can_shoot_through_enemy = true,
			can_shoot_through_shield = true,
			can_shoot_through_wall = true,
			ammo_pickup_min_mul = 0.3, 
			ammo_pickup_max_mul = 0.8
		},
		forbids = {
			"wpn_fps_ass_g3_b_short",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_ass_ns_battle"
		}
	}
}	
self.wpn_fps_ass_m14.override = {
		wpn_fps_upg_o_leupold = { 
		stance_mod = {
			wpn_fps_ass_m14 = { 
				translation = Vector3(0.01, -36.3, -4.745)
				}
			},
		override = {
		wpn_fps_upg_o_milspeciron = {
		stance_mod = {
			wpn_fps_ass_m14 = {
				translation = Vector3(0, 7, 0)
				}
			}
		}
	}			
		},
		wpn_fps_upg_o_45iron = { 
		stance_mod = {
			wpn_fps_ass_m14 = { 
				translation = Vector3(-2.05, 0, -13.85),rotation = Rotation(0.3 ,-0.3, -45)
				}
			}
		}		
}			
	self.parts.wpn_fps_upg_o_m14_scopemount = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "extra",
		name_id = "bm_wp_upg_o_m14_scopemount",
		depends_on = "sight",
		a_obj = "a_body",
		forbids = {
		"wpn_fps_upg_o_leupold",
		"wpn_fps_upg_o_milspeciron",
		"wpn_fps_upg_o_45iron"
		},
		adds = {"wpn_fps_upg_o_m14iron"},
		unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_o_m14_scopemount/wpn_fps_upg_o_m14_scopemount",
		stats = {
			value = 1,
			spread = 1,
			concealment = -1
		},
		texture_bundle_folder = "butcher_pack_mods",
		dlc = "butch_pack_free",
		override = {		
			wpn_fps_upg_o_specter = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(-0.03, 0, -5.21)
					}
				}
			},
			wpn_fps_upg_o_aimpoint = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(-0.03, 0, -5.21)
					}
				}
			},
			wpn_fps_upg_o_aimpoint_2 = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(-0.03, 0, -5.21)
					}
				}
			},
			wpn_fps_upg_o_docter = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(-0.03, 0, -5.21)
					}
				}
			},
			wpn_fps_upg_o_eotech = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(-0.03, 0, -5.21)
					}
				}
			},
			wpn_fps_upg_o_t1micro = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(-0.03, 0, -5.21)
					}
				}
			},
			wpn_fps_upg_o_cmore = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(-0.03, 0, -5.21)
					}
				}
			},
			wpn_fps_upg_o_cs = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(-0.03, 0, -5.21)
					}
				}
			},
			wpn_fps_upg_o_eotech_xps = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(-0.03, 0, -5.21)
					}
				}
			},
			wpn_fps_upg_o_reflex = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(-0.03, 0, -5.21)
					}
				}
			},
			wpn_fps_upg_o_rx01 = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(-0.03, 0, -5.21)
					}
				}
			},
			wpn_fps_upg_o_rx30 = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(-0.03, 0, -5.21)
					}
				}
			},
			wpn_fps_upg_o_acog = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(-0.03, 6, -5.21)
					}
				}
			}
		}
	}	
	self.parts.wpn_fps_upg_o_m14iron = {
		pcs = {},
		type = "gadget",
		name_id = "bm_wpn_fps_upg_o_combatiron",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_fps_gre_m79_sight_up_dummy",
		a_obj = "a_o",
		sub_type = "second_sight",
		stats = {value = 1, gadget_zoom = 1},
		perks = {"gadget"},
		internal_part = true,
		is_a_unlockable = false,
		stance_mod = {
			wpn_fps_upg_o_specter = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(0, -5, 0)
					},
					wpn_fps_ass_asval = {
						translation = Vector3(0, -5, 0)
					},
					wpn_fps_smg_uzi = {
						translation = Vector3(0, -5, 0)
					}	
				}
			},
			wpn_fps_upg_o_aimpoint = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(0, -5, 0)
					},
					wpn_fps_ass_asval = {
						translation = Vector3(0, -5, 0)
					},					
					wpn_fps_smg_uzi = {
						translation = Vector3(0, -5, 0)
					}	
				}
			},
			wpn_fps_upg_o_aimpoint_2 = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(0, -5, 0)
					},
					wpn_fps_ass_asval = {
						translation = Vector3(0, -5, 0)
					},					
					wpn_fps_smg_uzi = {
						translation = Vector3(0, -5, 0)
					}	
				}
			},
			wpn_fps_upg_o_docter = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(0, -5, 0)
					},
					wpn_fps_ass_asval = {
						translation = Vector3(0, -5, 0)
					},					
					wpn_fps_smg_uzi = {
						translation = Vector3(0, -5, 0)
					}	
				}
			},
			wpn_fps_upg_o_eotech = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(0, -5, 0)
					},
					wpn_fps_ass_asval = {
						translation = Vector3(0, -5, 0)
					},					
					wpn_fps_smg_uzi = {
						translation = Vector3(0, -5, 0)
					}	
				}
			},
			wpn_fps_upg_o_t1micro = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(0, -5, 0)
					},
					wpn_fps_ass_asval = {
						translation = Vector3(0, -5, 0)
					},					
					wpn_fps_smg_uzi = {
						translation = Vector3(0, -5, 0)
					}	
				}
			},
			wpn_fps_upg_o_cmore = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(0, -5, 0)
					},
					wpn_fps_ass_asval = {
						translation = Vector3(0, -5, 0)
					},					
					wpn_fps_smg_uzi = {
						translation = Vector3(0, -5, 0)
					}	
				}
			},
			wpn_fps_upg_o_cs = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(0, -5, 0)
					},
					wpn_fps_ass_asval = {
						translation = Vector3(0, -5, 0)
					},				
					wpn_fps_smg_uzi = {
						translation = Vector3(0, -5, 0)
					}	
				}
			},
			wpn_fps_upg_o_eotech_xps = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(0, -5, 0)
					},
					wpn_fps_ass_asval = {
						translation = Vector3(0, -5, 0)
					},					
					wpn_fps_smg_uzi = {
						translation = Vector3(0, -5, 0)
					}	
				}
			},
			wpn_fps_upg_o_reflex = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(0, -5, 0)
					},
					wpn_fps_ass_asval = {
						translation = Vector3(0, -5, 0)
					},					
					wpn_fps_smg_uzi = {
						translation = Vector3(0, -5, 0)
					}	
				}
			},
			wpn_fps_upg_o_rx01 = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(0, -5, 0)
					},
					wpn_fps_ass_asval = {
						translation = Vector3(0, -5, 0)
					},					
					wpn_fps_smg_uzi = {
						translation = Vector3(0, -5, 0)
					}	
				}
			},
			wpn_fps_upg_o_rx30 = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(0, -5, 0)
					},
					wpn_fps_ass_asval = {
						translation = Vector3(0, -5, 0)
					},					
					wpn_fps_smg_uzi = {
						translation = Vector3(0, -5, 0)
					}						
				}
			},
			wpn_fps_upg_o_acog = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_m14 = {
						translation = Vector3(0, -5, 0)
					},
					wpn_fps_ass_asval = {
						translation = Vector3(0, -5, 0)
					},				
					wpn_fps_smg_uzi = {
						translation = Vector3(0, -5, 0)
					}					
				}
			}
		}
}	
	self.parts.wpn_fps_lmg_mg42_b_vg38 = {
		pcs = {},
		type = "barrel",
		sub_type = "silencer",
		name_id = "bm_wp_mg42_b_vg38",
		a_obj = "a_b",
		unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_b_vg38",
		dlc = "gage_pack_historical",
		texture_bundle_folder = "gage_pack_historical",
		is_a_unlockable = true,
		stats = {
			value = 4,
			spread = 1,
			suppression = 12,
			alert_size = 12,
			damage = 0,
			recoil = 1,
			spread = -1,
			spread_moving = 0,
			concealment = 0
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_d"
		},
		stance_mod = {
			wpn_fps_lmg_mg42 = { 
				translation = Vector3( 0.2, 3, 2.3)
				}
		},
		override = {
		wpn_fps_upg_o_specter = {
			stance_mod = {
				wpn_fps_lmg_mg42 = {
					translation = Vector3( 0.02,4.9,-4.95 ) + Vector3(0, 4, 0)
					}
				}
			},
		wpn_fps_upg_o_aimpoint_2 = {
			stance_mod = {
				wpn_fps_lmg_mg42 = {
					translation = Vector3( 0.02,4.9,-4.95 ) + Vector3(0, 2, 0)
					}
				}	
			},
			wpn_fps_upg_o_eotech_xps = {
				stance_mod = {
					wpn_fps_lmg_mg42 = {
						translation = Vector3( 0.02,4.9,-4.95 )
					}
				}
			},
			wpn_fps_upg_o_acog = {
				stance_mod = {
					wpn_fps_lmg_mg42 = {
						translation = Vector3( 0,4.9,-4.95 ) + Vector3(0, 6, 0)
					}
				}
			},
			wpn_fps_upg_o_eotech = { 
			stance_mod = {
				wpn_fps_lmg_mg42 = {
					translation = Vector3( 0.02,4.9,-4.95 ) + Vector3(0, 2, 0)
					}	
					}
			},
			wpn_fps_upg_o_aimpoint = { 
			stance_mod = {
				wpn_fps_lmg_mg42 = {
					translation = Vector3( 0.02,4.9,-4.95 ) + Vector3(0, 2, 0)
					}	
					}
			},
			wpn_fps_upg_o_cs = {
			forbids = {"wpn_fps_upg_o_combatiron"},			
			stance_mod = {
				wpn_fps_lmg_mg42 = {
					translation = Vector3( 0.02,4.9,-4.95 ) + Vector3(0, 2, 0)
					}	
					}
			},	
			wpn_fps_upg_o_rx01 = { 
			stance_mod = {
				wpn_fps_lmg_mg42 = {
					translation = Vector3( 0.02,4.9,-4.95 ) + Vector3(0, 2, 0)
					}	
					}
			},	
			wpn_fps_upg_o_docter = { 
			stance_mod = {
				wpn_fps_lmg_mg42 = {
						translation = Vector3( 0.02,4.9,-4.95 )
					}	
					}
			},	
			wpn_fps_upg_o_t1micro = { 
			stance_mod = {
				wpn_fps_lmg_mg42 = {
						translation = Vector3( 0.02,4.9,-4.95 )
					}	
					}
			},
			wpn_fps_upg_o_cmore = { 
			stance_mod = {
				wpn_fps_lmg_mg42 = {
						translation = Vector3( 0.02,4.9,-4.95 )
					}	
					}
			},
			wpn_fps_upg_o_rx30 = { 
			stance_mod = {
				wpn_fps_lmg_mg42 = {
					translation = Vector3( 0.02,4.9,-4.95 ) + Vector3(0, 2, 0)
					}		
					}
			},
			wpn_fps_upg_o_reflex = { 
			stance_mod = {
				wpn_fps_lmg_mg42 = {
						translation = Vector3( 0.02,4.9,-4.95 )
					}	
					}
			}		
		},
		forbids = {
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_ass_ns_battle"
		}
}
self.parts.wpn_fps_sho_boot_s_short = {
		type = "stock",
		name_id = "bm_wp_boot_s_standard",
		a_obj = "a_s",
		unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot_pts/wpn_fps_sho_boot_s_short",
		stats = {value = 1},
		forbids = {
			"wpn_fps_shot_r870_body_rack",
		}	
	}
	self.parts.wpn_fps_lmg_rpk_fg_wood = {
		type = "foregrip",
		name_id = "bm_wp_rpk_fg_wood",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_standard",
		stats = {value = 1},
		texture_bundle_folder = "gage_pack_lmg",
		forbids = {
			"wpn_fps_addon_ris",
			"wpn_fps_upg_vg_ass_smg_stubby",
			"wpn_fps_upg_vg_ass_smg_verticalgrip",
			"wpn_fps_upg_vg_ass_smg_afg"
		}
	}	
	self.parts.wpn_fps_lmg_rpk_fg_standard = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "foregrip",
		name_id = "bm_wp_rpk_fg_standard",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_fg_standard",
		stats = {
			value = 5,
			spread = -1,
			recoil = -1,
			damage = 1,
			spread_moving = 2,
			concealment = 1
		},
		dlc = "gage_pack_lmg",
		texture_bundle_folder = "gage_pack_lmg",
		adds = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_ass_tecci_m_drum = {
		type = "magazine",
		name_id = "bm_wp_m4_lower_reciever",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 2},
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_m_std",
		stats = {value = 1},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_upg_tecci_m_cmag = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_tecci_m_cmag",
		is_a_unlockable = true,
		a_obj = "a_m",
		override = {
		wpn_fps_ass_g36_m_standard = {
		unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_m_drum"
			},
		wpn_fps_ass_tecci_m_drum = {
		unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_m_drum"
			}			
		},
		bullet_objects = {prefix = "g_bullet_", amount = 100},
		unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_m_drum",
		stats = {
			value = 7,
			extra_ammo = 35,
			spread = -4,
			concealment = -5
		}
	}
	self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip = {
		pcs = {10, 20, 30, 40},
		type = "vertical_grip",
		name_id = "bm_wp_upg_vg_tac",
		a_obj = "a_vg",
		is_a_unlockable = true,
		unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_verticalgrip/wpn_fps_upg_vg_ass_smg_verticalgrip",
		stats = {
			value = 3,
			recoil = 2,
			concealment = -1
		}
	}
	self.parts.wpn_fps_upg_vg_ass_smg_stubby = {
		pcs = {10, 20, 30, 40},
		type = "vertical_grip",
		name_id = "bm_wp_upg_vg_stubby",
		a_obj = "a_vg",
		is_a_unlockable = true,
		unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_stubby/wpn_fps_upg_vg_ass_smg_stubby",
		stats = {
			value = 3,
			spread = 2,
			concealment = -1
		}
	}
	self.parts.wpn_fps_upg_vg_ass_smg_afg = {
		pcs = {10, 20, 30, 40},
		type = "vertical_grip",
		name_id = "bm_wp_upg_vg_afg",
		a_obj = "a_vg",
		is_a_unlockable = true,
		unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_afg/wpn_fps_upg_vg_ass_smg_afg",
		stats = {
			value = 5,
			spread = 1,
			recoil = 1,
			concealment = -1
		}
	}
	self.parts.wpn_fps_smg_mp5_m_drum = {
		pcs = {
			20,
			30,
			40
		},
		type = "magazine",
		is_a_unlockable = true,
		name_id = "bm_wp_mp5_m_drum",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_m_drum",
		stats = {value = 5, extra_ammo = 20, recoil = 1, spread = -1, concealment = -4},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.parts.wpn_fps_lmg_rpk_m_banana = {
		pcs = {
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_rpk_ban_mag",
		is_a_unlockable = true,
		a_obj = "a_m",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_m_standard",
		stats = {
		value = 4, 
		extra_ammo = 10,
		spread = -1,
		recoil = 2,
		concealment = -2
		}
	}
	 self.parts.wpn_fps_lmg_rpk_m_banana.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_m_uspalm/wpn_third_upg_ak_m_uspalm"
	self.parts.wpn_fps_smg_mp5_s_sold = {
		pcs = {
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_mp5_s_sold",
		is_a_unlockable = true,
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_s_solid",
		stats = {
			value = 4,
			recoil = 2, 
			spread = 1,
			concealment = -2
		}
	}
	self.parts.wpn_upg_ak_m_drum = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_ak_m_drum",
		is_a_unlockable = true,
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_m_drum",
		stats = {
			value = 7,
			concealment = -6,
			spread = -4,
			extra_ammo = 35
		}
	}
	self.parts.wpn_upg_saiga_m_20rnd = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_saiga_m_20rnd",
		is_a_unlockable = true,
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_shot_saiga_pts/wpn_upg_saiga_m_20rnd",
		stats = {value = 6, extra_ammo = 6, concealment = -5},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		}
	}
	self.wpn_fps_ass_aug.override = {
		wpn_fps_upg_m4_m_l5 = {
		adds = {"wpn_fps_aug_m_pmag"},
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	},
	wpn_fps_ass_l85a2_m_emag = {
		adds = {"wpn_fps_aug_m_pmag"},
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	}	
}	
	self.wpn_fps_ass_tecci.override = {
		wpn_fps_upg_tecci_m_cmag = {
		adds = {"wpn_fps_ass_tecci_m_drum"},
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	},
	wpn_fps_upg_m4_m_quad = {
		adds = {"wpn_fps_ass_tecci_m_drum"},
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	},
	wpn_fps_upg_m4_m_pmag = {
		adds = {"wpn_fps_ass_tecci_m_drum"},
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	},
	wpn_fps_m4_uupg_m_std = {
		adds = {"wpn_fps_ass_tecci_m_drum"},
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	},
	wpn_fps_ass_l85a2_m_emag = {
		adds = {"wpn_fps_ass_tecci_m_drum"},
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	},
	wpn_fps_upg_m4_m_l5 = {
		adds = {"wpn_fps_ass_tecci_m_drum"},
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	}
}	
	self.wpn_fps_smg_x_sr2.override = {
	wpn_fps_upg_o_akimbo = {
	forbids = {			
	"wpn_fps_smg_sr2_s_folded"
		}
	},
	wpn_fps_upg_o_specter = {
		stats = {
				value = 8,
				recoil = 2,
				spread_moving = -3,
				concealment = -6
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_sr2 = {
				translation = Vector3 (-11.39, 6, -1.776), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			}
			}
		}
	}
},	
	wpn_fps_upg_o_aimpoint = {
		stats = {
			value = 8,
			recoil = 2,
			spread_moving = -3,
			concealment = -6
		},
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_sr2 = {
				translation = Vector3 (-11.39, 6, -1.776), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_aimpoint_2 = {
		stats = {
			value = 1,
			recoil = 2,
			spread_moving = -3,
			concealment = -6
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_sr2 = {
				translation = Vector3 (-11.39, 6, -1.776), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			}
			}
		}
	}
},
	wpn_fps_upg_o_docter = {
		stats = {
			value = 5,
			recoil = 2,
			spread_moving = -1,
			concealment = -2
		},
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_sr2 = {
				translation = Vector3 (-11.39, 6, -1.776), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			}
			}
		}
	}
},
	wpn_fps_upg_o_eotech = {
		stats = {
			value = 3,
			recoil = 2,
			spread_moving = -2,
			concealment = -4
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_sr2 = {
				translation = Vector3 (-11.39, 6, -1.776), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			}
			}
		}
	}
},
	wpn_fps_upg_o_t1micro = {
		stats = {
			value = 3,
			recoil = 2,
			spread_moving = -1,
			concealment = -2
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_sr2 = {
				translation = Vector3 (-11.39, 6, -1.776), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			}
			}
		}
	}
},
	wpn_fps_upg_o_cmore = {
		stats = {
			value = 5,
			recoil = 1,
			spread_moving = -1,
			concealment = -2
		},
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_sr2 = {
				translation = Vector3 (-11.39, 6, -1.776), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			}
			}
		}
	}
},
	wpn_fps_upg_o_acog = {
	stats = {
			value = 6,
			recoil = 2,
			spread_moving = -1,
			concealment = -6
	},
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_sr2 = {
				translation = Vector3 (-11.39, 6, -1.776), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			}
			}
		}
	}
},	
	wpn_fps_upg_o_cs = {
		stats = {
			value = 3,
			recoil = 2,
			spread_moving = -1,
			concealment = -2
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_sr2 = {
				translation = Vector3 (-11.39, 6, -1.776), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			}
			}
		}
	}
},
	wpn_fps_upg_o_eotech_xps = {
		stats = {
			value = 5,
			recoil = 2,
			spread_moving = -1,
			concealment = -3
		},	
		override = {
		wpn_fps_smg_x_mp5 = {
		stance_mod = {
			wpn_fps_smg_x_sr2 = {
				translation = Vector3 (-11.39, 6, -1.776), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			}
			}
		}
	}
},
	wpn_fps_upg_o_reflex = {
		stats = {
			value = 5,
			recoil = 1,
			spread_moving = -1,
			concealment = -2
		},	
		override = {	
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_sr2 = {
				translation = Vector3 (-11.39, 6, -1.776), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			}
			}
		}
	}
},
	wpn_fps_upg_o_rx01 = {
		stats = {
			value = 5,
			recoil = 1,
			spread_moving = -1,
			concealment = -2
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_sr2 = {
				translation = Vector3 (-11.39, 6, -1.776), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			}
			}
		}
	}
},
	wpn_fps_upg_o_rx30 = {
		stats = {
			value = 5,
			recoil = 2,
			spread_moving = -1,
			concealment = -4
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_sr2 = {
				translation = Vector3 (-11.39, 6, -1.776), 
				rotation = Rotation (-0.347954, 0.253161, 0.281029)
			}
			}
		}
	}
}		
}	
	self.wpn_fps_smg_x_mp5.override = {
	wpn_fps_upg_o_specter = {
		stats = {
				value = 8,
				recoil = 2,
				spread_moving = -3,
				concealment = -6
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_mp5 = {
				translation = Vector3 (-10.87, 7, -0.755), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},	
	wpn_fps_upg_o_aimpoint = {
		stats = {
			value = 8,
			recoil = 2,
			spread_moving = -3,
			concealment = -6
		},
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_mp5 = {
				translation = Vector3 (-10.87, 7, -0.755), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_aimpoint_2 = {
		stats = {
			value = 1,
			recoil = 2,
			spread_moving = -3,
			concealment = -6
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_mp5 = {
				translation = Vector3 (-10.87, 6, -0.755), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_docter = {
		stats = {
			value = 5,
			recoil = 2,
			spread_moving = -1,
			concealment = -2
		},
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_mp5 = {
				translation = Vector3 (-10.87, 6, -0.755), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_eotech = {
		stats = {
			value = 3,
			recoil = 2,
			spread_moving = -2,
			concealment = -4
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_mp5 = {
				translation = Vector3 (-10.87, 6, -0.755), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_t1micro = {
		stats = {
			value = 3,
			recoil = 2,
			spread_moving = -1,
			concealment = -2
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_mp5 = {
				translation = Vector3 (-10.87, 6, -0.755), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_cmore = {
		stats = {
			value = 5,
			recoil = 1,
			spread_moving = -1,
			concealment = -2
		},
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_mp5 = {
				translation = Vector3 (-10.87, 6, -0.755), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_acog = {
	stats = {
			value = 6,
			recoil = 2,
			spread_moving = -1,
			concealment = -6
	},
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_mp5 = {
				translation = Vector3 (-10.87, 9, -0.755), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},	
	wpn_fps_upg_o_cs = {
		stats = {
			value = 3,
			recoil = 2,
			spread_moving = -1,
			concealment = -2
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_mp5 = {
				translation = Vector3 (-10.87, 6, -0.755), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_eotech_xps = {
		stats = {
			value = 5,
			recoil = 2,
			spread_moving = -1,
			concealment = -3
		},	
		override = {
		wpn_fps_smg_x_mp5 = {
		stance_mod = {
			wpn_fps_smg_x_mp5 = {
				translation = Vector3 (-10.87, 6, -0.755), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_reflex = {
		stats = {
			value = 5,
			recoil = 1,
			spread_moving = -1,
			concealment = -2
		},	
		override = {	
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_mp5 = {
				translation = Vector3 (-10.87, 6, -0.755), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_rx01 = {
		stats = {
			value = 5,
			recoil = 1,
			spread_moving = -1,
			concealment = -2
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_mp5 = {
				translation = Vector3 (-10.87, 6, -0.755), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_rx30 = {
		stats = {
			value = 5,
			recoil = 2,
			spread_moving = -1,
			concealment = -4
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_mp5 = {
				translation = Vector3 (-10.87, 6, -0.755), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},	
	wpn_fps_smg_mp5_s_adjust = {
		pcs = {
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_mp5_s_adjust",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_s_adjust",
		stats = {
			value = 4,
			spread_moving = 1,
			recoil = 1,
			spread = 2,
			concealment = -2
		}
	}
}
	self.wpn_fps_smg_mp5.override = {
	wpn_fps_smg_mp5_m_drum = {
	stats = {value = 5, 
			extra_ammo = 10, 
			recoil = 1, 
			spread = -1, 
			concealment = -4
			}
		}
}
	self.wpn_fps_smg_x_akmsu.override = {
	wpn_fps_upg_o_specter = {
		stats = {
				value = 8,
				recoil = 2,
				spread_moving = -3,
				concealment = -6
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_akmsu = {
				translation = Vector3 (-10.84, 8, -0.58), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},	
	wpn_fps_upg_o_aimpoint = {
		stats = {
			value = 8,
			recoil = 2,
			spread_moving = -3,
			concealment = -6
		},
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_akmsu = {
				translation = Vector3 (-10.84, 8, -0.58), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_aimpoint_2 = {
		stats = {
			value = 1,
			recoil = 2,
			spread_moving = -3,
			concealment = -6
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_akmsu = {
				translation = Vector3 (-10.84, 8, -0.58), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_docter = {
		stats = {
			value = 5,
			recoil = 2,
			spread_moving = -1,
			concealment = -2
		},
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_akmsu = {
				translation = Vector3 (-10.84, 6, -0.58), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_eotech = {
		stats = {
			value = 3,
			recoil = 2,
			spread_moving = -2,
			concealment = -4
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_akmsu = {
				translation = Vector3 (-10.84, 6, -0.58), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_t1micro = {
		stats = {
			value = 3,
			recoil = 2,
			spread_moving = -1,
			concealment = -2
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_akmsu = {
				translation = Vector3 (-10.84, 6, -0.58), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_cmore = {
		stats = {
			value = 5,
			recoil = 1,
			spread_moving = -1,
			concealment = -2
		},
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_akmsu = {
				translation = Vector3 (-10.84, 6, -0.58), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_acog = {
	stats = {
			value = 6,
			recoil = 2,
			spread_moving = -1,
			concealment = -6
	},
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_akmsu = {
				translation = Vector3 (-10.84, 9, -0.525), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},	
	wpn_fps_upg_o_cs = {
		stats = {
			value = 3,
			recoil = 2,
			spread_moving = -1,
			concealment = -2
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_akmsu = {
				translation = Vector3 (-10.84, 6, -0.58), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_eotech_xps = {
		stats = {
			value = 5,
			recoil = 2,
			spread_moving = -1,
			concealment = -3
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_akmsu = {
				translation = Vector3 (-10.84, 6, -0.58), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_reflex = {
		stats = {
			value = 5,
			recoil = 1,
			spread_moving = -1,
			concealment = -2
		},	
		override = {	
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_akmsu = {
				translation = Vector3 (-10.84, 6, -0.58), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_rx01 = {
		stats = {
			value = 5,
			recoil = 1,
			spread_moving = -1,
			concealment = -2
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_akmsu = {
				translation = Vector3 (-10.84, 6, -0.58), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},
	wpn_fps_upg_o_rx30 = {
		stats = {
			value = 5,
			recoil = 2,
			spread_moving = -1,
			concealment = -4
		},	
		override = {
		wpn_fps_upg_o_akimbo = {
		stance_mod = {
			wpn_fps_smg_x_akmsu = {
				translation = Vector3 (-10.84, 6, -0.58), 
				rotation = Rotation (-0.147954, 0.453161, -1.281029)
				}
			}
		}
	}
},	
	wpn_upg_ak_m_drum = {
		stats = {
			value = 7,
			concealment = -6,
			recoil = 2,
			spread = -3,
			extra_ammo = 46
		}
	},
	wpn_upg_ak_s_skfoldable = {
		stats = {
			value = 3,
			spread_moving = 2,
			spread = 1,
			recoil = 1,
			concealment = -2
		}
	},
	wpn_fps_upg_ak_m_quad = {
		stats = {
			value = 3,
			spread_moving = -2,
			concealment = -3,
			extra_ammo = 30,
			recoil = 1,
			spread = -1
		}
	},
	wpn_upg_ak_m_drum = {
	stats = {
			value = 7,
			concealment = -6,
			spread = -4,
			extra_ammo = 70
		}
	}
}	
	self.wpn_fps_ass_amcar.override = {
		wpn_fps_upg_tecci_m_cmag = {
			stats = {
			value = 7,
			extra_ammo = 40,
			spread = -4,
			concealment = -5
			}
		},
		wpn_fps_upg_m4_m_quad = {
			stats = {
				value = 3,
				spread_moving = -2,
				extra_ammo = 20,
				recoil = 1,
				concealment = -4,
				spread = -1
			}
		},
		wpn_fps_upg_fg_smr = {
		depends_on = "barrel"
		},
		wpn_fps_m4_uupg_fg_rail = {
		depends_on = "barrel"
		},
		wpn_fps_m4_uupg_fg_lr300 = {
		depends_on = "barrel"
		},
		wpn_fps_upg_fg_jp = {
		depends_on = "barrel"
		},
		wpn_fps_upg_ass_m4_fg_moe = {
		depends_on = "barrel"
		},
		wpn_fps_upg_ass_m4_fg_lvoa = {
		depends_on = "barrel"
		},			
		wpn_fps_upg_m4_m_pmag = {
			stats = {
				value = 3,
				spread_moving = 1,
				concealment = -2,
				extra_ammo = 7
			}
		},
		wpn_fps_upg_m4_m_drum = {
			stats = {
				value = 9,
				extra_ammo = 25,
				concealment = -5
			}
		},
		wpn_fps_m4_uupg_m_std = {
			stats = {
				value = 1,
				extra_ammo = 9,
				concealment = -3
			}
		},
		wpn_fps_ass_l85a2_m_emag = {
			stats = {
				value = 1,
				recoil = 1,
				concealment = -2,
				extra_ammo = 7
			}
		},
		wpn_fps_upg_m4_m_l5 = {
			stats = {
				value = 1,
				extra_ammo = 7,
				concealment = -2,
				recoil = 1
			}
		}
	}
	self.wpn_fps_smg_olympic.override = {
	wpn_fps_upg_tecci_m_cmag = {
			stats = {
			value = 7,
			extra_ammo = 40,
			spread = -4,
			concealment = -5
			}
		},
		wpn_fps_upg_m4_m_quad = {
			stats = {
				value = 3,
				spread_moving = -2,
				extra_ammo = 20,
				recoil = 1,
				concealment = -4,
				spread = -1
			}
		},	
		wpn_fps_upg_m4_m_pmag = {
			stats = {
				value = 3,
				spread_moving = 1,
				concealment = -2,
				extra_ammo = 7
			}
		},
		wpn_fps_m4_uupg_m_std = {
			stats = {
				value = 1,
				extra_ammo = 9,
				concealment = -3
			}
		},
		wpn_fps_ass_l85a2_m_emag = {
			stats = {
				value = 1,
				recoil = 1,
				concealment = -2,
				extra_ammo = 7
			}
		},
		wpn_fps_upg_m4_m_l5 = {
			stats = {
				value = 1,
				extra_ammo = 7,
				concealment = -2,
				recoil = 1
			}
		}
	}
self.wpn_fps_lmg_rpk.override = {
		wpn_fps_upg_ak_fg_krebs = {
		pcs = {},
		type = "foregrip",
		name_id = "bm_wp_upg_ak_fg_krebs",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_fg_krebs/wpn_fps_upg_ak_fg_krebs",
		stats = {
			value = 1,
			spread = 2,
			concealment = 3
		},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true,
		forbids = {
			"wpn_fps_ak_extra_ris",
			"wpn_fps_addon_ris",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_o_reflex",
			"wpn_fps_upg_o_rx01",
			"wpn_fps_upg_o_rx30",
			"wpn_fps_upg_o_cs",
			"wpn_fps_upg_o_acog",
			"wpn_fps_upg_o_aimpoint_2",
			"wpn_fps_upg_o_cmore",
			"wpn_fps_upg_o_t1micro",
			"wpn_fps_upg_o_eotech",
			"wpn_fps_upg_o_specter",
			"wpn_fps_upg_o_docter",
			"wpn_fps_upg_o_aimpoint"
		}
	},
	wpn_fps_upg_ak_fg_trax = {
		pcs = {},
		type = "foregrip",
		name_id = "bm_wp_upg_ak_fg_trax",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_fg_trax/wpn_fps_upg_ak_fg_trax",
		stats = {
			value = 1,
			spread = 2,
			recoil = 2,
			concealment = -2
		},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true,
		forbids = {
			"wpn_fps_ak_extra_ris",
			"wpn_fps_addon_ris",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_o_reflex",
			"wpn_fps_upg_o_rx01",
			"wpn_fps_upg_o_rx30",
			"wpn_fps_upg_o_cs",
			"wpn_fps_upg_o_acog",
			"wpn_fps_upg_o_aimpoint_2",
			"wpn_fps_upg_o_cmore",
			"wpn_fps_upg_o_t1micro",
			"wpn_fps_upg_o_eotech",
			"wpn_fps_upg_o_specter",
			"wpn_fps_upg_o_docter",
			"wpn_fps_upg_o_aimpoint"
		}
},		
		wpn_fps_extra_zoom = { 
		stance_mod = {
			wpn_fps_lmg_rpk = { 
				translation = Vector3( 0.025,-14,-3.35 )
				}
			}
		},	
		wpn_fps_upg_o_specter = {
			forbids = {"wpn_fps_upg_o_milspeciron"},		
			stance_mod = {
				wpn_fps_lmg_rpk = {
					translation = Vector3( 0.025,-14,-3.35 ) + Vector3(0, 4, 0)
					}
				}
			},
		wpn_fps_upg_o_aimpoint_2 = {
			stance_mod = {
				wpn_fps_lmg_rpk = {
					translation = Vector3( 0.025,-14,-3.35 ) + Vector3(0, 2, 0)
					}
				}	
			},
			wpn_fps_upg_o_eotech_xps = {
				stance_mod = {
					wpn_fps_lmg_rpk = {
						translation = Vector3( 0.025,-14,-3.35)
					}
				}
			},
			wpn_fps_upg_o_acog = {
				stance_mod = {
					wpn_fps_lmg_rpk = {
						translation = Vector3( 0.025,-14,-3.35 ) + Vector3(0, 6, 0)
					}
				}
			},
			wpn_fps_upg_o_eotech = { 
			stance_mod = {
				wpn_fps_lmg_rpk = {
					translation = Vector3( 0.025,-14,-3.35 ) + Vector3(0, 2, 0)
					}
					}
			},
			wpn_fps_upg_o_aimpoint = { 
			stance_mod = {
				wpn_fps_lmg_rpk = {
					translation = Vector3( 0.025,-14,-3.35 ) + Vector3(0, 2, 0)
					}	
					}
			},
			wpn_fps_upg_o_cs = {
			forbids = {"wpn_fps_upg_o_combatiron"},			
			stance_mod = {
				wpn_fps_lmg_rpk = {
					translation = Vector3( 0.025,-14,-3.35 ) + Vector3(0, 2, 0)
					}	
					}
			},	
			wpn_fps_upg_o_rx01 = { 
			stance_mod = {
				wpn_fps_lmg_rpk = {
					translation = Vector3( 0.025,-14,-3.35 ) + Vector3(0, 2, 0)
					}
					}
			},	
			wpn_fps_upg_o_docter = { 
			stance_mod = {
				wpn_fps_lmg_rpk = {
						translation = Vector3( 0.025,-14,-3.35)	
					}
				}	
			},	
			wpn_fps_upg_o_t1micro = { 
			stance_mod = {
				wpn_fps_lmg_rpk = {
					translation = Vector3( 0.025,-14,-3.35 ) + Vector3(0, 2, 0)	
					}
				}	
			},
			wpn_fps_upg_o_cmore = { 
			stance_mod = {
				wpn_fps_lmg_rpk = {
						translation = Vector3( 0.025,-14,-3.35)
					}
				}		
			},
			wpn_fps_upg_o_rx30 = { 
			stance_mod = {
				wpn_fps_lmg_rpk = {
					translation = Vector3( 0.025,-14,-3.35 ) + Vector3(0, 2, 0)
					}	
					}
			},
			wpn_fps_upg_o_reflex = { 
			stance_mod = {
				wpn_fps_lmg_rpk = {
						translation = Vector3( 0.025,-14,-3.35)
					}
			}
		}	
}
self.wpn_fps_lmg_hk21.override = {
		forbids = {"wpn_fps_upg_o_milspeciron"},
		wpn_fps_extra_zoom = { 
		stance_mod = {
			wpn_fps_lmg_hk21 = { 
				translation = Vector3( 0.045,-20.36,-3 ) 
				}
			}
		},	
		wpn_fps_upg_o_specter = {
			forbids = {"wpn_fps_upg_o_milspeciron"},			
			stance_mod = {
				wpn_fps_lmg_hk21 = {
					translation = Vector3( 0.045,-26.3,-3 ) + Vector3(0, 4, 0)
					}
				}
			},
		wpn_fps_upg_o_aimpoint_2 = {
			stance_mod = {
				wpn_fps_lmg_hk21 = {
					translation = Vector3( 0.045,-26.3,-3 ) + Vector3(0, 2, 0) + Vector3(0, 18, 0)
					}
				}	
			},
			wpn_fps_upg_o_eotech_xps = {
				stance_mod = {
					wpn_fps_lmg_hk21 = {
						translation = Vector3( 0.045,-26.3,-3 ) + Vector3(0, 18, 0)
					}
				}
			},
			wpn_fps_upg_o_acog = {
				stance_mod = {
					wpn_fps_lmg_hk21 = {
						translation = Vector3( 0.045,-26.3,-3 ) + Vector3(0, 6, 0)
					}
				}
			},
			wpn_fps_upg_o_eotech = { 
			stance_mod = {
				wpn_fps_lmg_hk21 = {
					translation = Vector3( 0.045,-26.3,-3 ) + Vector3(0, 2, 0) + Vector3(0, 18, 0)
					}
				}	
			},
			wpn_fps_upg_o_aimpoint = { 
			stance_mod = {
				wpn_fps_lmg_hk21 = {
					translation = Vector3( 0.045,-26.3,-3 ) + Vector3(0, 2, 0) + Vector3(0, 18, 0)	
					}
				}	
			},
			wpn_fps_upg_o_cs = {
			forbids = {"wpn_fps_upg_o_combatiron"},			
			stance_mod = {
				wpn_fps_lmg_hk21 = {
					translation = Vector3( 0.045,-26.3,-3 ) + Vector3(0, 2, 0) + Vector3(0, 18, 0)	
					}
				}	
			},	
			wpn_fps_upg_o_rx01 = { 
			stance_mod = {
				wpn_fps_lmg_hk21 = {
					translation = Vector3( 0.045,-26.3,-3 ) + Vector3(0, 2, 0) + Vector3(0, 18, 0)	
					}
				}	
			},	
			wpn_fps_upg_o_docter = { 
			stance_mod = {
				wpn_fps_lmg_hk21 = {
					translation = Vector3( 0.045,-26.3,-3 ) + Vector3(0, 2, 0) + Vector3(0, 18, 0)	
					}
			}
			},	
			wpn_fps_upg_o_t1micro = { 
			stance_mod = {
				wpn_fps_lmg_hk21 = {
					translation = Vector3( 0.045,-26.3,-3 ) + Vector3(0, 2, 0) + Vector3(0, 18, 0)
					}
			}
				},
			wpn_fps_upg_o_cmore = { 
			stance_mod = {
				wpn_fps_lmg_hk21 = {
					translation = Vector3( 0.045,-26.3,-3 ) + Vector3(0, 2, 0) + Vector3(0, 18, 0)	
					}
			}
				},		
			wpn_fps_upg_o_rx30 = { 
			stance_mod = {
				wpn_fps_lmg_hk21 = {
					translation = Vector3( 0.045,-26.3,-3 ) + Vector3(0, 2, 0) + Vector3(0, 18, 0)	
					}
				}
			},
			wpn_fps_upg_o_reflex = { 
			stance_mod = {
				wpn_fps_lmg_hk21 = {
					translation = Vector3( 0.045,-26.3,-3 ) + Vector3(0, 2, 0) + Vector3(0, 18, 0)	
					}
			}
}
}
self.wpn_fps_shot_m37.override = {
		wpn_fps_upg_o_specter = {
			forbids = {"wpn_fps_upg_o_milspeciron"},		
			stance_mod = {
				wpn_fps_shot_m37 = {
					translation = Vector3(0, 0, -4.05)
					}
				}
			},
		wpn_fps_upg_o_aimpoint_2 = {
			stance_mod = {
				wpn_fps_shot_m37 = {
					translation = Vector3(0, 0, -4.05)
					}
				}	
			},
			wpn_fps_upg_o_eotech_xps = {
				stance_mod = {
					wpn_fps_shot_m37 = {
						translation = Vector3(0, 0, -4.05)
					}
				}
			},
			wpn_fps_upg_o_acog = {
				stance_mod = {
					wpn_fps_shot_m37 = {
						translation = Vector3(0, 0, -4.05)
					}
				}
			},
			wpn_fps_upg_o_eotech = { 
			stance_mod = {
				wpn_fps_shot_m37 = {
					translation = Vector3(0, 0, -4.05)
					}
				}	
			},
			wpn_fps_upg_o_aimpoint = { 
			stance_mod = {
				wpn_fps_shot_m37 = {
					translation = Vector3(0, 0, -4.05)
					}
				}	
			},
			wpn_fps_upg_o_cs = {
			forbids = {"wpn_fps_upg_o_combatiron"},			
			stance_mod = {
				wpn_fps_shot_m37 = {
					translation = Vector3(0, 0, -4.05)
					}
				}	
			},	
			wpn_fps_upg_o_rx01 = { 
			stance_mod = {
				wpn_fps_shot_m37 = {
					translation = Vector3(0, 0, -4.05)	
					}
				}	
			},	
			wpn_fps_upg_o_docter = { 
			stance_mod = {
				wpn_fps_shot_m37 = {
					translation = Vector3(0, 0, -4.05)	
					}
			}
			},	
			wpn_fps_upg_o_t1micro = { 
			stance_mod = {
				wpn_fps_shot_m37 = {
					translation = Vector3(0, 0, -4.05)
					}
			}
				},
			wpn_fps_upg_o_cmore = { 
			stance_mod = {
				wpn_fps_shot_m37 = {
					translation = Vector3(0, 0, -4.05)	
					}
			}
				},		
			wpn_fps_upg_o_rx30 = { 
			stance_mod = {
				wpn_fps_shot_m37 = {
					translation = Vector3(0, 0, -4.05)	
					}
				}
			},
			wpn_fps_upg_o_reflex = { 
			stance_mod = {
				wpn_fps_shot_m37 = {
					translation = Vector3(0, 0, -4.05)	
					}
			}
		},
		wpn_fps_upg_a_minishell = {
		stats = {
			value = 4,
			spread = -2,
			extra_ammo = 3
		}
	},
	wpn_fps_upg_a_minishellslug = {
		stats = {
			value = 5,
			spread = 1,
			damage = -10,
			extra_ammo = 3
		}	
	}		
}
self.wpn_fps_lmg_m249.override = {
		wpn_fps_extra_zoom = { 
		stance_mod = {
			wpn_fps_lmg_m249 = { 
				translation = Vector3( 0.02,-3.7,-3.575 )
				}
			}
		},	
		wpn_fps_upg_o_specter = {
			forbids = {"wpn_fps_upg_o_milspeciron"},		
			stance_mod = {
				wpn_fps_lmg_m249 = {
					translation = Vector3( 0.02,-3.7,-3.575 ) + Vector3(0, 4, 0)
					}
				}
			},
		wpn_fps_upg_o_aimpoint_2 = {
			stance_mod = {
				wpn_fps_lmg_m249 = {
					translation = Vector3( 0.02,-3.7,-3.575 ) + Vector3(0, 2, 0)
					}
				}	
			},
			wpn_fps_upg_o_eotech_xps = {
				stance_mod = {
					wpn_fps_lmg_m249 = {
						translation = Vector3( 0.02,-3.7,-3.575 )
					}
				}
			},
			wpn_fps_upg_o_acog = {
				stance_mod = {
					wpn_fps_lmg_m249 = {
						translation = Vector3( 0.02,-3.7,-3.575 ) + Vector3(0, 6, 0)
					}
				}
			},
			wpn_fps_upg_o_eotech = { 
			stance_mod = {
				wpn_fps_lmg_m249 = {
						translation = Vector3( 0.02,-3.7,-3.575 )
					}	
					}
			},
			wpn_fps_upg_o_aimpoint = { 
			stance_mod = {
				wpn_fps_lmg_m249 = {
						translation = Vector3( 0.02,-3.7,-3.575 )
					}
					}
			},
			wpn_fps_upg_o_cs = {
			forbids = {"wpn_fps_upg_o_combatiron"},			
			stance_mod = {
				wpn_fps_lmg_m249 = {
						translation = Vector3( 0.02,-3.7,-3.575 )
					}	
					}
			},	
			wpn_fps_upg_o_rx01 = { 
			stance_mod = {
				wpn_fps_lmg_m249 = {
					translation = Vector3( 0.02,-3.7,-3.575 ) + Vector3(0, 2, 0)
					}
					}
			},	
			wpn_fps_upg_o_docter = { 
			stance_mod = {
				wpn_fps_lmg_m249 = {
						translation = Vector3( 0.02,-3.7,-3.575 )
					}
					}
			},	
			wpn_fps_upg_o_t1micro = { 
			stance_mod = {
				wpn_fps_lmg_m249 = {
						translation = Vector3( 0.02,-3.7,-3.575 )
					}
					}
			},
			wpn_fps_upg_o_cmore = { 
			stance_mod = {
				wpn_fps_lmg_m249 = {
						translation = Vector3( 0.02,-3.7,-3.575 )
					}	
					}
			},
			wpn_fps_upg_o_rx30 = { 
			stance_mod = {
				wpn_fps_lmg_m249 = {
					translation = Vector3( 0.02,-3.7,-3.575 ) + Vector3(0, 2, 0)
					}
					}
			},
			wpn_fps_upg_o_reflex = { 
			stance_mod = {
				wpn_fps_lmg_m249 = {
						translation = Vector3( 0.02,-3.7,-3.575 )
					}
					}
			}
}
self.wpn_fps_lmg_par.override = {
		wpn_fps_extra_zoom = { 
		stance_mod = {
			wpn_fps_lmg_par = { 
				translation = Vector3( 0.02,4.9,-2.85 )
				}
			}
		},	
		wpn_fps_upg_o_specter = {
			forbids = {"wpn_fps_upg_o_milspeciron"},
			stance_mod = {
				wpn_fps_lmg_par = {
					translation = Vector3( 0.055,-7.75,-3.215 ) + Vector3(0, 4, 0)
					}
				}
			},
		wpn_fps_upg_o_aimpoint_2 = {
			stance_mod = {
				wpn_fps_lmg_par = {
					translation = Vector3( 0.055,-7.75,-3.215 ) + Vector3(0, 2, 0)
					}
				}	
			},
			wpn_fps_upg_o_eotech_xps = {
				stance_mod = {
					wpn_fps_lmg_par = {
						translation = Vector3( 0.02,4.9,-2.85 ) 
					}
				}
			},
			wpn_fps_upg_o_acog = {
				stance_mod = {
					wpn_fps_lmg_par = {
						translation = Vector3( 0.055,-7.75,-3.215 ) + Vector3(0, 6, 0)
					}
				}
			},
			wpn_fps_upg_o_eotech = { 
			stance_mod = {
				wpn_fps_lmg_par = {
					translation = Vector3( 0.055,-7.75,-3.215 ) + Vector3(0, 2, 0)
					}
					}
			},
			wpn_fps_upg_o_aimpoint = { 
			stance_mod = {
				wpn_fps_lmg_par = {
					translation = Vector3( 0.055,-7.75,-3.215 ) + Vector3(0, 2, 0)
					}	
					}
			},
			wpn_fps_upg_o_cs = {
			forbids = {"wpn_fps_upg_o_combatiron"},			
			stance_mod = {
				wpn_fps_lmg_par = {
					translation = Vector3( 0.055,-7.75,-3.215 ) + Vector3(0, 2, 0)
					}	
					}
			},	
			wpn_fps_upg_o_rx01 = { 
			stance_mod = {
				wpn_fps_lmg_par = {
					translation = Vector3( 0.055,-7.75,-3.215 ) + Vector3(0, 2, 0)
					}
					}
			},	
			wpn_fps_upg_o_docter = { 
			stance_mod = {
				wpn_fps_lmg_par = {
						translation = Vector3( 0.02,4.9,-2.85 ) 
					}	
					}
			},	
			wpn_fps_upg_o_t1micro = { 
			stance_mod = {
				wpn_fps_lmg_par = {
						translation = Vector3( 0.02,4.9,-2.85 ) 
					}	
					}
			},
			wpn_fps_upg_o_cmore = { 
			stance_mod = {
				wpn_fps_lmg_par = {
						translation = Vector3( 0.02,4.9,-2.85 ) 
					}	
					}
			},
			wpn_fps_upg_o_rx30 = { 
			stance_mod = {
				wpn_fps_lmg_par = {
					translation = Vector3( 0.055,-7.75,-3.215 ) + Vector3(0, 2, 0)
					}	
					}
			},
			wpn_fps_upg_o_reflex = { 
			stance_mod = {
				wpn_fps_lmg_par = {
						translation = Vector3( 0.02,4.9,-2.85 ) 
					}	
					}
			}
}
self.wpn_fps_lmg_mg42.override = {
		wpn_fps_extra_zoom = { 
		stance_mod = {
			wpn_fps_lmg_mg42 = { 
				translation = Vector3( 0.02,4.9,-2.85 )
				}
			}
		},
		wpn_fps_upg_o_specter = {
			forbids = {"wpn_fps_upg_o_milspeciron"},		
			stance_mod = {
				wpn_fps_lmg_mg42 = {
					translation = Vector3( 0.02,4.9,-2.85 ) + Vector3(0, 4, 0)
					}
				}
			},
		wpn_fps_upg_o_aimpoint_2 = {
			stance_mod = {
				wpn_fps_lmg_mg42 = {
					translation = Vector3( 0.02,4.9,-2.85 ) + Vector3(0, 2, 0)
					}
				}	
			},
			wpn_fps_upg_o_eotech_xps = {
				stance_mod = {
					wpn_fps_lmg_mg42 = {
						translation = Vector3( 0.02,4.9,-2.85 )
					}
				}
			},
			wpn_fps_upg_o_acog = {
				stance_mod = {
					wpn_fps_lmg_mg42 = {
						translation = Vector3( 0.02,4.9,-2.85 ) + Vector3(0, 6, 0)
					}
				}
			},
			wpn_fps_upg_o_eotech = { 
			stance_mod = {
				wpn_fps_lmg_mg42 = {
					translation = Vector3( 0.02,4.9,-2.85 ) + Vector3(0, 2, 0)
					}	
					}
			},
			wpn_fps_upg_o_aimpoint = { 
			stance_mod = {
				wpn_fps_lmg_mg42 = {
					translation = Vector3( 0.02,4.9,-2.85 ) + Vector3(0, 2, 0)
					}	
					}
			},
			wpn_fps_upg_o_cs = {
			forbids = {"wpn_fps_upg_o_combatiron"},			
			stance_mod = {
				wpn_fps_lmg_mg42 = {
					translation = Vector3( 0.02,4.9,-2.85 ) + Vector3(0, 2, 0)
					}	
					}
			},	
			wpn_fps_upg_o_rx01 = { 
			stance_mod = {
				wpn_fps_lmg_mg42 = {
					translation = Vector3( 0.02,4.9,-2.85 ) + Vector3(0, 2, 0)
					}	
					}
			},	
			wpn_fps_upg_o_docter = { 
			stance_mod = {
				wpn_fps_lmg_mg42 = {
						translation = Vector3( 0.02,4.9,-2.85 )
					}	
					}
			},	
			wpn_fps_upg_o_t1micro = { 
			stance_mod = {
				wpn_fps_lmg_mg42 = {
						translation = Vector3( 0.02,4.9,-2.85 )
					}	
					}
			},
			wpn_fps_upg_o_cmore = { 
			stance_mod = {
				wpn_fps_lmg_mg42 = {
						translation = Vector3( 0.02,4.9,-2.85 )
					}	
					}
			},
			wpn_fps_upg_o_rx30 = { 
			stance_mod = {
				wpn_fps_lmg_mg42 = {
					translation = Vector3( 0.02,4.9,-2.85 ) + Vector3(0, 2, 0)
					}		
					}
			},
			wpn_fps_upg_o_reflex = { 
			stance_mod = {
				wpn_fps_lmg_mg42 = {
						translation = Vector3( 0.02,4.9,-2.85 )
					}	
					}
			}
}
self.wpn_fps_snp_winchester.override = {
		wpn_fps_sho_boot_o_iron = {
		forbids = {
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_fl_ass_smg_sho_surefire"
			}
		},
		wpn_fps_extra_zoom = { 
		stance_mod = {
			wpn_fps_snp_winchester = { 
				translation = Vector3( 0, 0, -2.875 ), rotation = Rotation( 0,-0.2875,0)
				}
			}
		},
		wpn_fps_upg_o_specter = {
			forbids = {"wpn_fps_upg_o_milspeciron"},		
			stance_mod = {
				wpn_fps_snp_winchester = {
					translation = Vector3( 0, 0, -2.875 ) + Vector3(0, 4, 0), rotation = Rotation( 0,-0.2875,0)
					}
				}
			},
		wpn_fps_upg_o_aimpoint_2 = {
			stance_mod = {
				wpn_fps_snp_winchester = {
					translation = Vector3( 0.02,4.9, -2.85 ) + Vector3(0, 2, 0)
					}
				}	
			},
			wpn_fps_upg_o_eotech_xps = {
				stance_mod = {
					wpn_fps_snp_winchester = {
						translation = Vector3( 0, 0, -2.875 ), rotation = Rotation( 0,-0.2875,0)
					}
				}
			},
			wpn_fps_upg_o_acog = {
				stance_mod = {
					wpn_fps_snp_winchester = {
						translation = Vector3( 0, 0, -2.875 ) + Vector3(0, 6, 0), rotation = Rotation( 0,-0.2875,0)
					}
				}
			},
			wpn_fps_upg_o_eotech = { 
			stance_mod = {
				wpn_fps_snp_winchester = {
					translation = Vector3( 0.02,4.9, -2.85 ) + Vector3(0, 2, 0)
					}	
					}
			},
			wpn_fps_upg_o_aimpoint = { 
			stance_mod = {
				wpn_fps_snp_winchester = {
					translation = Vector3( 0, 0, -2.875 ) + Vector3(0, 2, 0), rotation = Rotation( 0,-0.2875,0)
					}	
					}
			},
			wpn_fps_upg_o_cs = {
			forbids = {"wpn_fps_upg_o_combatiron"},			
			stance_mod = {
				wpn_fps_snp_winchester = {
					translation = Vector3( 0, 0, -2.875 ) + Vector3(0, 2, 0), rotation = Rotation( 0,-0.2875,0)
					}	
					}
			},	
			wpn_fps_upg_o_rx01 = { 
			stance_mod = {
				wpn_fps_snp_winchester = {
					translation = Vector3( 0, 0, -2.875 ) + Vector3(0, 2, 0), rotation = Rotation( 0,-0.2875,0)
					}	
					}
			},	
			wpn_fps_upg_o_docter = { 
			stance_mod = {
				wpn_fps_snp_winchester = {
						translation = Vector3( 0, 0, -2.875 ), rotation = Rotation( 0,-0.2875,0)
					}	
					}
			},	
			wpn_fps_upg_o_t1micro = { 
			stance_mod = {
				wpn_fps_snp_winchester = {
						translation = Vector3( 0, 0, -2.875 ), rotation = Rotation( 0,-0.2875,0)
					}	
					}
			},
			wpn_fps_upg_o_cmore = { 
			stance_mod = {
				wpn_fps_snp_winchester = {
						translation = Vector3( 0, 0, -2.875 ), rotation = Rotation( 0,-0.2875,0)
					}	
					}
			},
			wpn_fps_upg_o_rx30 = { 
			stance_mod = {
				wpn_fps_snp_winchester = {
					translation = Vector3( 0, 0, -2.875 ) + Vector3(0, 2, 0), rotation = Rotation( 0,-0.2875,0)
					}		
					}
			},
			wpn_fps_upg_o_reflex = { 
			stance_mod = {
				wpn_fps_snp_winchester = {
						translation = Vector3( 0, 0,-2.875 ), rotation = Rotation( 0,-0.2875,0)
					}	
					}
			},
			wpn_fps_upg_o_45iron = { 
			stance_mod = {
				wpn_fps_snp_winchester = {
						translation = Vector3( -5.5,0,-14.1 ), rotation = Rotation( 0.6,-0.6,-45)
					}	
					}
			},
			wpn_fps_upg_o_leupold = { 
			stance_mod = {
				wpn_fps_snp_winchester = {
						translation = Vector3(-0.0025, -44, -4.05)
					}	
					}
			}
}

self.wpn_fps_shot_r870.override = {
	wpn_fps_upg_a_minishell = {
		stats = {
			value = 4,
			spread = -2,
			extra_ammo = 2
		}
	},
	wpn_fps_upg_a_minishellslug = {
		stats = {
			value = 5,
			spread = 1,
			damage = -10,
			extra_ammo = 2
		}	
	} 	
}
self.wpn_fps_shot_serbu.override = {
	wpn_fps_upg_a_minishell = {
		stats = {
			value = 4,
			spread = -2,
			extra_ammo = 2
		}
	},
	wpn_fps_upg_a_minishellslug = {
		stats = {
			value = 5,
			spread = 1,
			damage = -10,
			extra_ammo = 2
		}	
	}
}
self.wpn_fps_sho_spas12.override = {
	wpn_fps_upg_a_minishell = {
		stats = {
			value = 4,
			spread = -2,
			extra_ammo = 2
		}
	},	
	wpn_fps_upg_a_minishellslug = {
		stats = {
			value = 5,
			spread = 1,
			damage = -5,
			extra_ammo = 2
		}	
	}
}
self.wpn_fps_sho_ben.override = {
	wpn_fps_upg_a_minishell = {
		stats = {
			value = 4,
			spread = -2,
			extra_ammo = 2
		}
	},	
	wpn_fps_upg_a_minishellslug = {
		stats = {
			value = 5,
			spread = 1,
			damage = -5,
			extra_ammo = 2
		}	
	}
}
self.wpn_fps_sho_ksg.override = {
	wpn_fps_upg_a_minishell = {
		stats = {
			value = 4,
			spread = -2,
			extra_ammo = 5
		}
	},	
	wpn_fps_upg_a_minishellslug = {
		stats = {
			value = 5,
			spread = 1,
			damage = -10,
			extra_ammo = 5
		}	
	}
}
self.wpn_fps_smg_mac10.override = {
		wpn_fps_upg_s_none = {
		forbids = {
			"wpn_upg_ak_g_standard"
		}
	}
}		
self.wpn_fps_sho_boot.override = {
		wpn_fps_shot_r870_body_rack = {
		depends_on = "stock",
			stats = {
				value = 5,
				spread_moving = -1,
				concealment = -3,
				total_ammo_mod = 5
			}
		},
	wpn_fps_upg_a_minishell = {
		stats = {
			value = 4,
			spread = -2,
			extra_ammo = 3
		}
	},	
	wpn_fps_upg_a_minishellslug = {
		stats = {
			value = 5,
			spread = 1,
			damage = -10,
			extra_ammo = 3
		}	
	},	
		wpn_fps_extra_zoom = { 
		stance_mod = {
			wpn_fps_sho_boot = { 
				translation = Vector3(0.20, 9, -4.35)
				}
			}
		},
		wpn_fps_upg_o_specter = {
			forbids = {"wpn_fps_upg_o_milspeciron"},			
			stance_mod = {
				wpn_fps_sho_boot = {
					translation = Vector3(0.20, 9, -4.35)
					}
				}
			},
		wpn_fps_upg_o_aimpoint_2 = {
			stance_mod = {
				wpn_fps_sho_boot = {
					translation = Vector3(0.20, 9, -4.35) + Vector3(0, 2, 0)
					}
				}	
			},
			wpn_fps_upg_o_eotech_xps = {
				stance_mod = {
					wpn_fps_sho_boot = {
						translation = Vector3(0.20, 9, -4.35)
					}
				}
			},
			wpn_fps_upg_o_acog = {
				stance_mod = {
					wpn_fps_sho_boot = {
						translation = Vector3(0.20, 9, -4.35)
					}
				}
			},
			wpn_fps_upg_o_eotech = { 
			stance_mod = {
				wpn_fps_sho_boot = {
					translation = Vector3(0.20, 9, -4.35) + Vector3(0, 2, 0)
					}	
				}
			},
			wpn_fps_upg_o_aimpoint = { 
			stance_mod = {
				wpn_fps_sho_boot = {
					translation = Vector3(0.20, 9, -4.35)
					}	
				}
			},
			wpn_fps_upg_o_cs = { 
			forbids = {"wpn_fps_upg_o_combatiron"},			
			stance_mod = {
				wpn_fps_sho_boot = {
					translation = Vector3(0.20, 9, -4.35)
					}	
				}
			},	
			wpn_fps_upg_o_rx01 = { 
			stance_mod = {
				wpn_fps_sho_boot = {
					translation = Vector3(0.20, 9, -4.35)
					}	
				}
			},	
			wpn_fps_upg_o_docter = { 
			stance_mod = {
				wpn_fps_sho_boot = {
						translation = Vector3(0.20, 9, -4.35)
					}	
				}
			},
			wpn_fps_upg_o_t1micro = { 
			stance_mod = {
				wpn_fps_sho_boot = {
						translation = Vector3(0.20, 9, -4.35)
					}	
				}
			},
			wpn_fps_upg_o_cmore = { 
			stance_mod = {
				wpn_fps_sho_boot = {
						translation = Vector3(0.20, 9, -4.35)
					}	
				}
			},
			wpn_fps_upg_o_rx30 = { 
			stance_mod = {
				wpn_fps_sho_boot = {
					translation = Vector3(0.20, 9, -4.35)
					}		
				}
			},
			wpn_fps_upg_o_reflex = { 
			stance_mod = {
				wpn_fps_sho_boot = {
						translation = Vector3(0.20, 9, -4.35)
					}	
				}
			}
}
self.wpn_fps_bow_frankish.override = {
		wpn_fps_upg_o_specter = {
			stance_mod = {
				wpn_fps_bow_frankish = {
					translation = Vector3(0.20, 9, -4.35)
					}
				}
			},
		wpn_fps_upg_o_aimpoint_2 = {
			stance_mod = {
				wpn_fps_bow_frankish = {
					translation = Vector3(0.20, 9, -4.35) + Vector3(0, 2, 0)
					}
				}	
			},
			wpn_fps_upg_o_eotech_xps = {
				stance_mod = {
					wpn_fps_bow_frankish = {
						translation = Vector3(0.20, 9, -4.35)
					}
				}
			},
			wpn_fps_upg_o_acog = {
				stance_mod = {
					wpn_fps_bow_frankish = {
						translation = Vector3(0.20, 9, -4.35)
					}
				}
			},
			wpn_fps_upg_o_eotech = { 
			stance_mod = {
				wpn_fps_bow_frankish = {
					translation = Vector3(0.20, 9, -4.35) + Vector3(0, 2, 0)
					}	
				}
			},
			wpn_fps_upg_o_aimpoint = { 
			stance_mod = {
				wpn_fps_bow_frankish = {
					translation = Vector3(0.20, 9, -4.35)
					}	
				}
			},
			wpn_fps_upg_o_cs = { 
			stance_mod = {
				wpn_fps_bow_frankish = {
					translation = Vector3(0.20, 9, -4.35)
					}	
				}
			},	
			wpn_fps_upg_o_rx01 = { 
			stance_mod = {
				wpn_fps_bow_frankish = {
					translation = Vector3(0.20, 9, -2.35)
					}	
				}
			},	
			wpn_fps_upg_o_docter = { 
			stance_mod = {
				wpn_fps_bow_frankish = {
						translation = Vector3(0.20, 9, -2.35)
					}	
				}
			},
			wpn_fps_upg_o_t1micro = { 
			stance_mod = {
				wpn_fps_bow_frankish = {
						translation = Vector3(0.20, 9, -2.35)
					}	
				}
			},
			wpn_fps_upg_o_cmore = { 
			stance_mod = {
				wpn_fps_bow_frankish = {
						translation = Vector3(0.20, 9, -2.35)
					}	
				}
			},
			wpn_fps_upg_o_rx30 = { 
			stance_mod = {
				wpn_fps_bow_frankish = {
					translation = Vector3(0.20, 9, -2.35)
					}		
				}
			},
			wpn_fps_upg_o_reflex = { 
			stance_mod = {
				wpn_fps_bow_frankish = {
						translation = Vector3(0.20, 9, 0), rotation = Rotation( 0, -6, 0)
					}	
				}
			}
}
self.wpn_fps_pis_rage.override = {
	wpn_fps_upg_ns_ass_filter = { 
		stats = {
			value = 0,
			suppression = 15,
			alert_size = 12,
			damage = -33,
			spread = -1,
			spread_moving = -2,
			concealment = -3
		},
		sound_switch = {
			suppressed = "suppressed_c"
		}	
	},
	wpn_fps_upg_ns_pis_jungle = { 
		stats = {
			value = 5,
			suppression = 15,
			alert_size = 12,
			damage = -30,
			spread = 1,
			recoil = 2,
			concealment = -5
		},
		sound_switch = {
			suppressed = "suppressed_c"
		}
	},
	wpn_fps_upg_ns_pis_medium_gem = { 
		stats = {
			value = 4,
			suppression = 15,
			alert_size = 12,
			recoil = 1,
			spread = 0,
			concealment = -1,
			damage = -33
		},
		sound_switch = {
			suppressed = "suppressed_c"
		}
	},
	wpn_fps_upg_ns_pis_large_kac = { 
		stats = {
			value = 6,
			suppression = 15,
			alert_size = 12,
			recoil = -2,
			spread = 1,
			concealment = -2,
			damage = -31
		},
		sound_switch = {
			suppressed = "suppressed_c"
		}
	},
	wpn_fps_upg_ns_pis_small = { 
		stats = {
			value = 3,
			suppression = 15,
			alert_size = 12,
			damage = -34,
			recoil = 0,
			spread_moving = -1,
			concealment = 0
		},
		sound_switch = {
			suppressed = "suppressed_c"
		}
	},
	wpn_fps_upg_ns_pis_medium = { 
		stats = {
			value = 1,
			suppression = 15,
			alert_size = 12,
			damage = -32,
			recoil = 1,
			spread_moving = -2,
			concealment = -2
		},
		sound_switch = {
			suppressed = "suppressed_c"
		}
	},
	wpn_fps_upg_ns_pis_large = { 
		stats = {
			value = 5,
			suppression = 15,
			alert_size = 12,
			damage = -31,
			recoil = 2,
			spread_moving = -2,
			concealment = -3
		},
		sound_switch = {
			suppressed = "suppressed_c"
		}
	},	
	wpn_fps_upg_ns_pis_medium_slim = { 
		stats = {
			value = 1,
			suppression = 15,
			alert_size = 12,
			spread = -2,
			recoil = -1,
			spread_moving = 2,
			damage = -30,
			concealment = -2
		},
		sound_switch = {
			suppressed = "suppressed_c"
		}
	}
}
self.wpn_fps_ass_asval.override = {
	wpn_fps_upg_s_none = {
			stats = {
			value = 2,
			spread = -2,
			recoil = -3,
			concealment = 2
		},
			adds = {
			"wpn_fps_ass_asval_g_standard"
		}
	},
	wpn_fps_upg_ak_s_solidstock = { 
		stats = {
			value = 1,
			recoil = 3,
			concealment = -4,
			spread = 1
		},
		adds = {
			"wpn_fps_ass_asval_g_standard"
		}
	},	
	wpn_upg_ak_s_psl = { 
		stats = {
			value = 6,
			spread = 3,
			spread_moving = -3,
			recoil = 0,
			concealment = -4
		},
		forbids = {
			"wpn_fps_ass_asval_g_standard"
		}
	},
	wpn_fps_ass_asval_s_solid = { 
		stats = {
			value = 1,
			recoil = 5,
			concealment = -3
		},
		forbids = {
			"wpn_fps_ass_asval_g_standard"
		}
	},
	wpn_upg_ak_s_skfoldable = { 
		stats = {
			value = 3,
			spread_moving = 2,
			recoil = -2,
			spread = -1,
			concealment = 1
		},
		adds = {
			"wpn_fps_ass_asval_g_standard"
		}
	},
		wpn_fps_upg_o_specter = {
			forbids = {"wpn_fps_upg_o_milspeciron"},			
			stance_mod = {
			wpn_fps_ass_asval = {
				translation = Vector3(0, 0, -6.48),
				rotation = Rotation(0, 0, 0)
			}
				}
			},
		wpn_fps_upg_o_aimpoint_2 = {
			stance_mod = {
			wpn_fps_ass_asval = {
				translation = Vector3(0, 0, -6.48),
				rotation = Rotation(0, 0, 0)
					}
				}	
			},
			wpn_fps_upg_o_eotech_xps = {
				stance_mod = {
			wpn_fps_ass_asval = {
				translation = Vector3(0, 0, -6.48),
				rotation = Rotation(0, 0, 0)
					}
				}
			},
			wpn_fps_upg_o_acog = {
				stance_mod = {
			wpn_fps_ass_asval = {
				translation = Vector3(0, 0, -6.48),
				rotation = Rotation(0, 0, 0)
					}
				}
			},
			wpn_fps_upg_o_eotech = { 
			stance_mod = {
			wpn_fps_ass_asval = {
				translation = Vector3(0, 0, -6.48),
				rotation = Rotation(0, 0, 0)
					}
				}
			},
			wpn_fps_upg_o_aimpoint = { 
			stance_mod = {
			wpn_fps_ass_asval = {
				translation = Vector3(0, 0, -6.48),
				rotation = Rotation(0, 0, 0)
					}	
				}
			},
			wpn_fps_upg_o_cs = { 
			stance_mod = {
				wpn_fps_sho_boot = {
					translation = Vector3(0.20, 9, -4.35)
					}	
				}
			},	
			wpn_fps_upg_o_rx01 = { 
			stance_mod = {
			wpn_fps_ass_asval = {
				translation = Vector3(0, 0, -6.48),
				rotation = Rotation(0, 0, 0)
					}	
				}
			},	
			wpn_fps_upg_o_docter = { 
			stance_mod = {
			wpn_fps_ass_asval = {
				translation = Vector3(0, 0, -6.48),
				rotation = Rotation(0, 0, 0)
					}	
				}
			},
			wpn_fps_upg_o_t1micro = { 
			stance_mod = {
			wpn_fps_ass_asval = {
				translation = Vector3(0, 0, -6.48),
				rotation = Rotation(0, 0, 0)
					}	
				}
			},
			wpn_fps_upg_o_cmore = { 
			stance_mod = {
			wpn_fps_ass_asval = {
				translation = Vector3(0, 0, -6.48),
				rotation = Rotation(0, 0, 0)
					}	
				}
			},
			wpn_fps_upg_o_rx30 = { 
			stance_mod = {
			wpn_fps_ass_asval = {
				translation = Vector3(0, 0, -6.48),
				rotation = Rotation(0, 0, 0)
					}		
				}
			},
			wpn_fps_upg_o_reflex = { 
			stance_mod = {
			wpn_fps_ass_asval = {
				translation = Vector3(0, 0, -6.48),
				rotation = Rotation(0, 0, 0)
					}	
				}
			}
}	
self.wpn_fps_x_1911.override = {
		wpn_upg_o_marksmansight_rear = {		
			a_obj = "a_o",
			forbids = {
				"wpn_fps_pis_1911_o_long",
				"wpn_fps_pis_1911_o_standard"
			}
		},
		wpn_upg_o_marksmansight_front = {a_obj = "a_os"},
		wpn_fps_pis_1911_b_long = {
		wpn_upg_o_marksmansight_front = {a_obj = "a_ol"}
		}
}
self.wpn_fps_x_b92fs.override = {
	wpn_upg_o_marksmansight_front = {a_obj = "a_os"},
	wpn_upg_o_marksmansight_rear = {			
			a_obj = "a_o",
		}
}
self.wpn_fps_x_deagle.override = {
	wpn_fps_upg_o_rmr = {
	parent = "lower_reciever",
	forbids = {			
	"wpn_fps_pis_deagle_o_standard_front",
	"wpn_fps_pis_deagle_o_standard_front_long",
	"wpn_fps_pis_deagle_o_standard_rear"
	},
	override = {
	wpn_fps_upg_o_akimbo = {
	stance_mod = {
		wpn_fps_x_deagle = {
			translation = Vector3 (-11.1, 10, 2.5), 
			rotation = Rotation (-0.347954, 0.253161, 0.281029)
				}
			}
		}
	}
},
	wpn_upg_o_marksmansight_rear = {
		a_obj = "a_o",
		depends_on = "gadget",		
			forbids = {			
				"wpn_fps_pis_deagle_o_standard_front",
				"wpn_fps_pis_deagle_o_standard_front_long",
				"wpn_fps_pis_deagle_o_standard_rear"
			}
		},
	wpn_upg_o_marksmansight_front = {a_obj = "a_os"},
	wpn_fps_pis_deagle_b_long = {
	wpn_upg_o_marksmansight_front = {a_obj = "a_ol"}
	}
}
self.wpn_fps_pis_x_g17.override = {
	wpn_fps_upg_o_rmr = {
	parent = "slide",
	override = {
	wpn_fps_upg_o_akimbo = {
	stance_mod = {
		wpn_fps_pis_x_g17 = {
			translation = Vector3 (-11.1, 10, 4.8), 
			rotation = Rotation (-0.347954, 0.253161, 0.281029)
				}
			}
		}
	}
},
	wpn_upg_o_marksmansight_front = {a_obj = "a_ol"},
}
	self.parts.wpn_fps_ass_asval_scopemount = {
		type = "extra",
		name_id = "bm_wp_asval_scopemount",
		a_obj = "a_body",
		unit = "units/pd2_dlc_character_sokol/weapons/wpn_fps_ass_asval_pts/wpn_fps_ass_asval_scopemount",
		stats = {value = 1},
		adds = {"wpn_fps_upg_o_m14iron"}
	}
	self.parts.wpn_fps_upg_o_ak_scopemount = {
		pcs = {},
		type = "extra",
		name_id = "bm_wp_upg_o_ak_scopemount",
		depends_on = "sight",
		a_obj = "a_g",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_o_ak_scopemount/wpn_fps_upg_o_ak_scopemount",
		stats = {
			value = 1,
			recoil = 1,
			concealment = -1
		},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true,
		forbids = {
			"wpn_fps_ak_extra_ris"
		},
		override = {
			wpn_fps_upg_ak_fg_zenit = {
				override = {}
			},
			wpn_fps_upg_ak_fg_trax = {
				override = {}
			},
			wpn_fps_upg_ak_fg_krebs = {
				override = {}
			},
			wpn_fps_smg_akmsu_fg_standard = {
				override = {}
			},
			wpn_upg_ak_fg_standard_gold = {
				override = {}
			},
			wpn_upg_ak_fg_standard = {
				override = {}
			},
			wpn_upg_saiga_fg_standard = {
				override = {}
			},
			wpn_fps_upg_o_milspeciron = {
			stance_mod = {
				wpn_fps_ass_akm = {
					translation = Vector3(0, 0, -4.5) + vector_offset_milspec
					},
				wpn_fps_ass_akm_gold = {
					translation = Vector3(0, 0, -4.5) + vector_offset_milspec
					},
				wpn_fps_ass_74 = {
					translation = Vector3(0, 0, -4.5) + vector_offset_milspec
					},
				wpn_fps_shot_saiga = {
					translation = Vector3(0.063, 0, -4.55) + vector_offset_milspec
					},
				wpn_fps_smg_akmsu = {
					translation = Vector3(-0.028, 0, -4.35) + vector_offset_milspec
					}					
				}
			},
			wpn_fps_upg_o_specter = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_shot_saiga = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_smg_akmsu = {
						translation = Vector3(-0.028, 0, -4.36)
					}
				},
				override = {
					wpn_fps_upg_o_akimbo = {	
					stance_mod = {
						wpn_fps_smg_x_akmsu = {
							translation = Vector3 (-10.9, 8, -1.9), 
							rotation = Rotation (-0.147954, 0.453161, -1.281029)
							}
						}
					}
				}
			},
			wpn_fps_upg_o_aimpoint = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_shot_saiga = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_smg_akmsu = {
						translation = Vector3(-0.028, 0, -4.36)
					}
				},
				override = {
					wpn_fps_upg_o_akimbo = {
					stance_mod = {
						wpn_fps_smg_x_akmsu = {
							translation = Vector3 (-10.9, 8, -1.9), 
							rotation = Rotation (-0.147954, 0.453161, -1.281029)
							}
						}
					}
				}
			},
			wpn_fps_upg_o_aimpoint_2 = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_shot_saiga = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_smg_akmsu = {
						translation = Vector3(-0.028, 0, -4.36)
					}
				},
				override = {
					wpn_fps_upg_o_akimbo = {
					stance_mod = {
						wpn_fps_smg_x_akmsu = {
							translation = Vector3 (-10.9, 8, -1.9), 
							rotation = Rotation (-0.147954, 0.453161, -1.281029)
							}
						}
					}
				}
			},
			wpn_fps_upg_o_docter = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_shot_saiga = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_smg_akmsu = {
						translation = Vector3(-0.028, 0, -4.36)
					}
				},
				override = {
					wpn_fps_upg_o_akimbo = {
					stance_mod = {
						wpn_fps_smg_x_akmsu = {
							translation = Vector3 (-10.9, 8, -1.9), 
							rotation = Rotation (-0.147954, 0.453161, -1.281029)
							}
						}
					}
				}
			},
			wpn_fps_upg_o_eotech = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_shot_saiga = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_smg_akmsu = {
						translation = Vector3(-0.028, 0, -4.36)
					}
				},
				override = {
					wpn_fps_upg_o_akimbo = {
					stance_mod = {
						wpn_fps_smg_x_akmsu = {
							translation = Vector3 (-10.9, 8, -1.9), 
							rotation = Rotation (-0.147954, 0.453161, -1.281029)
							}
						}
					}
				}
			},
			wpn_fps_upg_o_t1micro = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_shot_saiga = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_smg_akmsu = {
						translation = Vector3(-0.028, 0, -4.36)
					}
				},
				override = {
					wpn_fps_upg_o_akimbo = {
					stance_mod = {
						wpn_fps_smg_x_akmsu = {
							translation = Vector3 (-10.9, 8, -1.9), 
							rotation = Rotation (-0.147954, 0.453161, -1.281029)
							}
						}
					}
				}
			},
			wpn_fps_upg_o_cmore = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_shot_saiga = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_smg_akmsu = {
						translation = Vector3(-0.028, 0, -4.36)
					}
				},
				override = {
					wpn_fps_upg_o_akimbo = {
					stance_mod = {
						wpn_fps_smg_x_akmsu = {
							translation = Vector3 (-10.9, 8, -1.9), 
							rotation = Rotation (-0.147954, 0.453161, -1.281029)
							}
						}
					}
				}
			},
			wpn_fps_upg_o_cs = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_shot_saiga = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_smg_akmsu = {
						translation = Vector3(-0.028, 0, -4.36)
					}
				},
				override = {
					wpn_fps_upg_o_akimbo = {
					stance_mod = {
						wpn_fps_smg_x_akmsu = {
							translation = Vector3 (-10.9, 8, -1.9), 
							rotation = Rotation (-0.147954, 0.453161, -1.281029)
							}
						}
					}
				}
			},
			wpn_fps_upg_o_eotech_xps = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_shot_saiga = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_smg_akmsu = {
						translation = Vector3(-0.028, 0, -4.36)
					}
				},
				override = {
					wpn_fps_upg_o_akimbo = {
					stance_mod = {
						wpn_fps_smg_x_akmsu = {
							translation = Vector3 (-10.9, 8, -1.9), 
							rotation = Rotation (-0.147954, 0.453161, -1.281029)
							}
						}
					}
				}				
			},
			wpn_fps_upg_o_reflex = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_shot_saiga = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_smg_akmsu = {
						translation = Vector3(-0.028, 0, -4.36)
					}
				},
				override = {
					wpn_fps_upg_o_akimbo = {
					stance_mod = {
						wpn_fps_smg_x_akmsu = {
							translation = Vector3 (-10.9, 8, -1.9), 
							rotation = Rotation (-0.147954, 0.453161, -1.281029)
							}
						}
					}
				}				
			},
			wpn_fps_upg_o_rx01 = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_shot_saiga = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_smg_akmsu = {
						translation = Vector3(-0.028, 0, -4.36)
					}
				},
				override = {
					wpn_fps_upg_o_akimbo = {
					stance_mod = {
						wpn_fps_smg_x_akmsu = {
							translation = Vector3 (-10.9, 8, -1.9), 
							rotation = Rotation (-0.147954, 0.453161, -1.281029)
							}
						}
					}
				}
			},
			wpn_fps_upg_o_rx30 = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_shot_saiga = {
						translation = Vector3(0, 0, -4.6)
					},
					wpn_fps_smg_akmsu = {
						translation = Vector3(-0.028, 0, -4.36)
					}
				},
				override = {
					wpn_fps_upg_o_akimbo = {
					stance_mod = {
						wpn_fps_smg_x_akmsu = {
							translation = Vector3 (-10.9, 8, -1.9), 
							rotation = Rotation (-0.147954, 0.453161, -1.281029)
							}
						}
					}
				}
			},
			wpn_fps_upg_o_acog = {
				a_obj = "a_o_sm",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 6, -4.6)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 6, -4.6)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 6, -4.6)
					},
					wpn_fps_shot_saiga = {
						translation = Vector3(0, 6, -4.6)
					},
					wpn_fps_smg_akmsu = {
						translation = Vector3(-0.028, 6, -4.35)
					}
				},
				override = {
					wpn_fps_upg_o_akimbo = {
					stance_mod = {
						wpn_fps_smg_x_akmsu = {
							translation = Vector3 (-10.9, 8, -1.9), 
							rotation = Rotation (-0.147954, 0.453161, -1.281029)
							}
						}
					}
				}
			}
		}
	}
self.wpn_fps_smg_uzi.override = {
	wpn_fps_shot_r870_ris_special = {
		type = "extra",
		name_id = "bm_wp_r870_s_solid_single",
		a_obj = "a_o",
		adds = {"wpn_fps_upg_o_m14iron"},
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_ris_special"
	}
}	
self.wpn_fps_ass_g3.adds = { 
		wpn_fps_upg_o_leupold = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_45iron = { "wpn_fps_ass_g3_body_rail" },	
}
self.wpn_fps_smg_x_sr2.adds = { 
		wpn_fps_upg_o_specter = { "wpn_fps_smg_sr2_o_rail" },
		wpn_fps_upg_o_aimpoint = { "wpn_fps_smg_sr2_o_rail" },
		wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_smg_sr2_o_rail" },
		wpn_fps_upg_o_docter = { "wpn_fps_smg_sr2_o_rail" },
		wpn_fps_upg_o_eotech = { "wpn_fps_smg_sr2_o_rail" },
		wpn_fps_upg_o_t1micro = { "wpn_fps_smg_sr2_o_rail" },
		wpn_fps_upg_o_cmore = { "wpn_fps_smg_sr2_o_rail" },
		wpn_fps_upg_o_acog = { "wpn_fps_smg_sr2_o_rail" },
		wpn_fps_upg_o_cs = { "wpn_fps_smg_sr2_o_rail" },
		wpn_fps_upg_o_eotech_xps = { "wpn_fps_smg_sr2_o_rail" },
		wpn_fps_upg_o_reflex = { "wpn_fps_smg_sr2_o_rail" },
		wpn_fps_upg_o_rx01 = { "wpn_fps_smg_sr2_o_rail" },
		wpn_fps_upg_o_rx30 = { "wpn_fps_smg_sr2_o_rail" }
}					
self.wpn_fps_snp_winchester.adds = { 
		wpn_fps_upg_o_specter = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_aimpoint = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_docter = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_eotech = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_t1micro = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_cmore = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_acog = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_cs = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_eotech_xps = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_reflex = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_rx01 = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_rx30 = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_45iron = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_leupold = { "wpn_fps_smg_thompson_o_adapter" },
	}
self.wpn_fps_shot_m37.adds = { 
		wpn_fps_upg_o_specter = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_aimpoint = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_docter = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_eotech = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_t1micro = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_cmore = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_acog = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_cs = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_eotech_xps = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_reflex = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_rx01 = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_rx30 = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
}	
self.wpn_fps_sho_boot.adds = { 
		wpn_fps_upg_o_specter = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_aimpoint = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_docter = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_eotech = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_t1micro = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_cmore = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_acog = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_cs = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_eotech_xps = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_reflex = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_rx01 = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
		wpn_fps_upg_o_rx30 = { "wpn_fps_sho_boot_o_adapter", "wpn_fps_rpg7_sight_adapter" },
}	
self.wpn_fps_lmg_rpk.adds = { 
		wpn_fps_upg_o_specter = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_aimpoint = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_docter = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_eotech = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_t1micro = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_cmore = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_acog = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_cs = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_eotech_xps = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_reflex = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_rx01 = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_rx30 = { "wpn_fps_ak_extra_ris" },
}
self.wpn_fps_ass_tecci.adds = { 
		wpn_fps_m4_uupg_draghandle_ballos = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_m4_upper_reciever_edge = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_ass_m4_upper_reciever_core = { "wpn_fps_ass_g3_body_rail" },	
		wpn_fps_upg_ass_m4_upper_reciever_ballos = { "wpn_fps_ass_g3_body_rail" },	
}		
self.wpn_fps_lmg_hk21.adds = { 
		wpn_fps_upg_o_specter = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_aimpoint = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_docter = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_eotech = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_t1micro = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_cmore = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_acog = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_cs = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_eotech_xps = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_reflex = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_rx01 = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_rx30 = { "wpn_fps_ass_g3_body_rail" },
}
self.wpn_fps_lmg_mg42.adds = { 
		wpn_fps_upg_o_specter = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_aimpoint = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_docter = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_eotech = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_t1micro = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_cmore = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_acog = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_cs = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_eotech_xps = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_reflex = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_rx01 = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_rx30 = { "wpn_fps_snp_mosin_rail" },
}		
--Flamethrower
table.insert(self.wpn_fps_fla_mk2.uses_parts, "wpn_fps_upg_fl_ass_laser")
table.insert(self.wpn_fps_fla_mk2.uses_parts, "wpn_fps_upg_fl_ass_smg_sho_peqbox")
table.insert(self.wpn_fps_fla_mk2.uses_parts, "wpn_fps_upg_fl_ass_peq15")
table.insert(self.wpn_fps_fla_mk2.uses_parts, "wpn_fps_upg_fl_ass_utg")
table.insert(self.wpn_fps_fla_mk2.uses_parts, "wpn_fps_upg_fl_ass_smg_sho_surefire")
--deagle
table.insert(self.wpn_fps_pis_deagle.uses_parts, "wpn_fps_pis_deagle_b_legends")
--m1911
table.insert(self.wpn_fps_pis_1911.uses_parts, "wpn_fps_pis_1911_fl_legends")
table.insert(self.wpn_fps_pis_1911.uses_parts, "wpn_fps_pis_1911_g_legends")
--Akimbo Pistols
table.insert(self.wpn_fps_x_1911.uses_parts, "wpn_upg_o_marksmansight_rear")
table.insert(self.wpn_fps_x_1911.uses_parts, "wpn_fps_pis_1911_g_legends")
table.insert(self.wpn_fps_x_1911.uses_parts, "wpn_fps_pis_1911_fl_legends")
table.insert(self.wpn_fps_x_b92fs.uses_parts, "wpn_upg_o_marksmansight_rear")
table.insert(self.wpn_fps_x_b92fs.uses_parts, "wpn_fps_pis_1911_fl_legends")
table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_upg_o_marksmansight_rear")
table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_pis_1911_fl_legends")
table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_akimbo")
table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_upg_o_rmr")
table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_pis_deagle_b_legends")
table.insert(self.wpn_fps_x_b92fs.uses_parts, "wpn_fps_upg_o_akimbo")
table.insert(self.wpn_fps_x_1911.uses_parts, "wpn_fps_upg_o_akimbo")
table.insert(self.wpn_fps_pis_x_g22c.uses_parts, "wpn_fps_upg_o_akimbo")
table.insert(self.wpn_fps_pis_x_g22c.uses_parts, "wpn_fps_pis_1911_fl_legends")
table.insert(self.wpn_fps_pis_x_g17.uses_parts, "wpn_fps_upg_o_akimbo")
table.insert(self.wpn_fps_pis_x_g17.uses_parts, "wpn_fps_upg_o_rmr")
table.insert(self.wpn_fps_pis_x_g17.uses_parts, "wpn_fps_pis_1911_fl_legends")
table.insert(self.wpn_fps_pis_x_usp.uses_parts, "wpn_fps_upg_o_akimbo")
table.insert(self.wpn_fps_pis_x_usp.uses_parts, "wpn_fps_pis_1911_fl_legends")
table.insert(self.wpn_fps_jowi.uses_parts, "wpn_fps_upg_o_akimbo")
table.insert(self.wpn_fps_jowi.uses_parts, "wpn_fps_pis_1911_fl_legends")
table.insert(self.wpn_fps_snp_model70.uses_parts, "wpn_fps_snp_model70_b_legends")
--Akimbo SMGs
table.insert(self.wpn_fps_smg_x_sr2.uses_parts, "wpn_fps_upg_o_akimbo")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_fps_upg_o_akimbo")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_fps_upg_o_ak_scopemount")
table.insert(self.wpn_fps_smg_x_mp5.uses_parts, "wpn_fps_upg_o_akimbo")
table.insert(self.wpn_fps_smg_x_sr2.uses_parts, "wpn_fps_upg_o_specter")
table.insert(self.wpn_fps_smg_x_sr2.uses_parts, "wpn_fps_upg_o_aimpoint")
table.insert(self.wpn_fps_smg_x_sr2.uses_parts, "wpn_fps_upg_o_aimpoint_2")
table.insert(self.wpn_fps_smg_x_sr2.uses_parts, "wpn_fps_upg_o_docter")
table.insert(self.wpn_fps_smg_x_sr2.uses_parts, "wpn_fps_upg_o_eotech")
table.insert(self.wpn_fps_smg_x_sr2.uses_parts, "wpn_fps_upg_o_t1micro")
table.insert(self.wpn_fps_smg_x_sr2.uses_parts, "wpn_fps_upg_o_cmore")
table.insert(self.wpn_fps_smg_x_sr2.uses_parts, "wpn_fps_upg_o_acog")
table.insert(self.wpn_fps_smg_x_sr2.uses_parts, "wpn_fps_upg_o_cs")
table.insert(self.wpn_fps_smg_x_sr2.uses_parts, "wpn_fps_upg_o_eotech_xps")
table.insert(self.wpn_fps_smg_x_sr2.uses_parts, "wpn_fps_upg_o_reflex")
table.insert(self.wpn_fps_smg_x_sr2.uses_parts, "wpn_fps_upg_o_rx01")
table.insert(self.wpn_fps_smg_x_sr2.uses_parts, "wpn_fps_upg_o_rx30")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_fps_upg_o_specter")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_fps_upg_o_aimpoint")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_fps_upg_o_aimpoint_2")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_fps_upg_o_docter")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_fps_upg_o_eotech")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_fps_upg_o_t1micro")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_fps_upg_o_cmore")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_fps_upg_o_acog")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_fps_upg_o_cs")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_fps_upg_o_eotech_xps")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_fps_upg_o_reflex")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_fps_upg_o_rx01")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_fps_upg_o_rx30")
table.insert(self.wpn_fps_smg_x_mp5.uses_parts, "wpn_fps_upg_o_specter")
table.insert(self.wpn_fps_smg_x_mp5.uses_parts, "wpn_fps_upg_o_aimpoint")
table.insert(self.wpn_fps_smg_x_mp5.uses_parts, "wpn_fps_upg_o_aimpoint_2")
table.insert(self.wpn_fps_smg_x_mp5.uses_parts, "wpn_fps_upg_o_docter")
table.insert(self.wpn_fps_smg_x_mp5.uses_parts, "wpn_fps_upg_o_eotech")
table.insert(self.wpn_fps_smg_x_mp5.uses_parts, "wpn_fps_upg_o_t1micro")
table.insert(self.wpn_fps_smg_x_mp5.uses_parts, "wpn_fps_upg_o_cmore")
table.insert(self.wpn_fps_smg_x_mp5.uses_parts, "wpn_fps_upg_o_acog")
table.insert(self.wpn_fps_smg_x_mp5.uses_parts, "wpn_fps_upg_o_cs")
table.insert(self.wpn_fps_smg_x_mp5.uses_parts, "wpn_fps_upg_o_eotech_xps")
table.insert(self.wpn_fps_smg_x_mp5.uses_parts, "wpn_fps_upg_o_reflex")
table.insert(self.wpn_fps_smg_x_mp5.uses_parts, "wpn_fps_upg_o_rx01")
table.insert(self.wpn_fps_smg_x_mp5.uses_parts, "wpn_fps_upg_o_rx30")
--P90
table.insert(self.wpn_fps_smg_p90.uses_parts, "wpn_fps_smg_p90_b_legends")
--scar
table.insert(self.wpn_fps_ass_scar.uses_parts, "wpn_fps_ass_scar_a_l")
--S12
table.insert(self.wpn_fps_shot_saiga.uses_parts, "wpn_upg_saiga_m_20rnd")
table.insert(self.wpn_fps_shot_saiga.uses_parts, "wpn_upg_ak_fg_combo2")
table.insert(self.wpn_fps_shot_saiga.uses_parts, "wpn_upg_ak_fg_combo3")
table.insert(self.wpn_fps_shot_saiga.uses_parts, "wpn_fps_upg_ak_fg_tapco")
table.insert(self.wpn_fps_shot_saiga.uses_parts, "wpn_fps_upg_ak_fg_krebs")
table.insert(self.wpn_fps_shot_saiga.uses_parts, "wpn_fps_upg_ak_fg_trax")
table.insert(self.wpn_fps_shot_saiga.uses_parts, "wpn_fps_upg_s_none")
table.insert(self.wpn_fps_shot_saiga.uses_parts, "wpn_fps_ak_g_vlad")	
--R870/serbu(WIP)
table.insert(self.wpn_fps_shot_r870.uses_parts, "wpn_fps_shot_r870_body_legends")
table.insert(self.wpn_fps_shot_serbu.uses_parts, "wpn_fps_shot_r870_body_legends")
--Snipers
table.insert(self.wpn_fps_snp_msr.uses_parts, "wpn_fps_sho_boot_o_iron")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_sho_boot_o_iron")
--M37
table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_sho_boot_o_iron")
table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_specter")
table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_aimpoint")
table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_aimpoint_2")
table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_docter")
table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_eotech")
table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_t1micro")
table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_cmore")
table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_acog")
table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_cs")
table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_eotech_xps")
table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_reflex")
table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_rx01")
table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_rx30")
--Judge
table.insert(self.wpn_fps_pis_judge.uses_parts, "wpn_fps_pis_rage_g_ergo")
table.insert(self.wpn_fps_pis_judge.uses_parts, "wpn_fps_pis_judge_g_legends")
table.insert(self.wpn_fps_pis_judge.uses_parts, "wpn_fps_pis_judge_b_legends")
--MP5
table.insert(self.wpn_fps_smg_mp5.uses_parts, "wpn_fps_smg_mp5_m_drum")
table.insert(self.wpn_fps_smg_x_mp5.uses_parts, "wpn_fps_smg_mp5_m_drum")
table.insert(self.wpn_fps_smg_x_mp5.uses_parts, "wpn_fps_smg_mp5_s_adjust")
table.insert(self.wpn_fps_smg_x_mp5.uses_parts, "wpn_fps_smg_mp5_s_sold")
--AK Family
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_fps_upg_ak_s_solidstock")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_upg_ak_s_psl")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_upg_ak_s_skfoldable")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_upg_ak_s_folding_vanilla")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_upg_ak_m_drum")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_fps_ak_g_vlad")
table.insert(self.wpn_fps_ass_akm.uses_parts, "wpn_upg_ak_m_drum")
table.insert(self.wpn_fps_ass_akm.uses_parts, "wpn_fps_ak_g_vlad")
table.insert(self.wpn_fps_ass_akm_gold.uses_parts, "wpn_upg_ak_m_drum")
table.insert(self.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_ak_g_vlad")
table.insert(self.wpn_fps_smg_akmsu.uses_parts, "wpn_upg_ak_m_drum")
table.insert(self.wpn_fps_smg_akmsu.uses_parts, "wpn_fps_ak_g_vlad")	
table.insert(self.wpn_fps_ass_74.uses_parts, "wpn_fps_lmg_rpk_m_banana")
table.insert(self.wpn_fps_ass_akm.uses_parts, "wpn_fps_lmg_rpk_m_banana")
table.insert(self.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_lmg_rpk_m_banana")
table.insert(self.wpn_fps_smg_akmsu.uses_parts, "wpn_fps_lmg_rpk_m_banana")
table.insert(self.wpn_fps_ass_akm.uses_parts, "wpn_fps_upg_s_none")
table.insert(self.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_upg_s_none")
table.insert(self.wpn_fps_smg_akmsu.uses_parts, "wpn_fps_upg_s_none")	
table.insert(self.wpn_fps_ass_74.uses_parts, "wpn_fps_upg_s_none")				
table.insert(self.wpn_fps_ass_74.uses_parts, "wpn_fps_ak_g_vlad")				
table.insert(self.wpn_fps_ass_74.uses_parts, "wpn_fps_ak_fg_vlad")
table.insert(self.wpn_fps_ass_74.uses_parts, "wpn_fps_upg_o_45iron")			
table.insert(self.wpn_fps_ass_74.uses_parts, "wpn_upg_ak_s_vlad")			
--MAC-10s
table.insert(self.wpn_fps_smg_mac10.uses_parts, "wpn_fps_upg_s_none")	
table.insert(self.wpn_fps_smg_cobray.uses_parts, "wpn_upg_ak_s_vlad")
--Minigun
table.insert(self.wpn_fps_lmg_m134.uses_parts, "wpn_fps_lmg_m134_body_upper_spikei")
table.insert(self.wpn_fps_lmg_m134.uses_parts, "wpn_fps_lmg_m134_barrel_legends")
--G36
table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_upg_a_snipers")	
table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_upg_tecci_m_cmag")	
table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_upg_m4_m_quad")	
table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_upg_m4_m_pmag")
table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_m4_uupg_m_std")
table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_ass_l85a2_m_emag")
table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_upg_m4_m_l5")
table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_upg_o_leupold")
--AS-VAL
table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ak_s_solidstock")
table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_upg_ak_s_psl")
table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_upg_ak_s_skfoldable")
table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_upg_ak_s_folding_vanilla")
table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_s_none")	
--AUG
table.insert(self.wpn_fps_ass_aug.uses_parts, "wpn_fps_ass_l85a2_m_emag")
table.insert(self.wpn_fps_ass_aug.uses_parts, "wpn_fps_upg_m4_m_l5")
table.insert(self.wpn_fps_ass_ak5.uses_parts, "wpn_fps_upg_tecci_m_cmag")	
--Bren
table.insert(self.wpn_fps_smg_hajk.uses_parts, "wpn_fps_upg_tecci_m_cmag")
table.insert(self.wpn_fps_smg_hajk.uses_parts, "wpn_fps_m4_uupg_s_fold")
table.insert(self.wpn_fps_smg_hajk.uses_parts, "wpn_fps_ass_scar_s_sniper")
table.insert(self.wpn_fps_smg_hajk.uses_parts, "wpn_fps_upg_vg_ass_smg_afg")
table.insert(self.wpn_fps_smg_hajk.uses_parts, "wpn_fps_upg_vg_ass_smg_verticalgrip")
--CAR Family
table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_upg_a_default")
table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_ass_tecci_s_short")
table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_upg_m4_s_standard")
table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_ass_m16_s_legends")
table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_ass_m16_fg_legends")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_s_standard")	
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_ass_tecci_s_short")	
table.insert(self.wpn_fps_smg_olympic.uses_parts, "wpn_fps_upg_m4_s_standard")	
table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_upg_m4_s_standard")	
table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_ass_tecci_s_short")	
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_upg_m4_s_standard")	
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_tecci_m_cmag")		
table.insert(self.wpn_fps_smg_olympic.uses_parts, "wpn_fps_upg_tecci_m_cmag")	
table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_upg_tecci_m_cmag")	
table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_ass_m16_s_legends")	
table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_ass_m16_fg_legends")	
table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_upg_tecci_m_cmag")
table.insert(self.wpn_fps_ass_l85a2.uses_parts, "wpn_fps_upg_tecci_m_cmag")	
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_m4_uupg_fg_rail")
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_m4_uupg_fg_lr300")
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_upg_fg_jp")
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_upg_fg_smr")
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_upg_ass_m4_fg_moe")
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_upg_ass_m4_fg_lvoa")		
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_upg_tecci_m_cmag")	
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_upg_m4_m_quad")	
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_upg_m4_m_pmag")
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_m4_uupg_m_std")
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_ass_l85a2_m_emag")
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_upg_m4_m_l5")
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_upg_ass_m4_upper_reciever_ballos")
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_upg_ass_m4_upper_reciever_core")
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_upg_ass_m4_lower_reciever_core")
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_m4_upper_reciever_edge")
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_m4_uupg_draghandle_ballos")
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_m4_uupg_draghandle_core")
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_upg_vg_ass_smg_verticalgrip")
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_upg_vg_ass_smg_stubby")
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_upg_vg_ass_smg_afg")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_ass_m4_upper_reciever_ballos")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_ass_m4_upper_reciever_core")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_ass_m4_lower_reciever_core")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_m4_upper_reciever_edge")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_m4_uupg_draghandle_ballos")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_m4_uupg_draghandle_core")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_m4_uupg_fg_rail")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_m4_uupg_fg_lr300")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_fg_jp")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_fg_smr")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_ass_m4_fg_moe")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_ass_m4_fg_lvoa")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_hgrip")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_mgrip")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_ergo")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_g_sniper")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_m_pmag")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_ass_l85a2_m_emag")
--M308
table.insert(self.wpn_fps_ass_m14.uses_parts, "wpn_fps_upg_a_snipers")
table.insert(self.wpn_fps_ass_m14.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(self.wpn_fps_ass_m14.uses_parts, "wpn_fps_upg_o_45iron")
--Gewerh 3
table.insert(self.wpn_fps_ass_g3.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(self.wpn_fps_ass_g3.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(self.wpn_fps_ass_g3.uses_parts, "wpn_fps_smg_mp5_s_adjust")
table.insert(self.wpn_fps_ass_g3.uses_parts, "wpn_fps_upg_a_default")
--Bronco
table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_meatgrinder")
table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_ipsccomp")
table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_ass_filter")
table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_jungle")
table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_medium_gem")
table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_large_kac")
table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_small")
table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_medium")
table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_large")
table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_medium_slim")
--winchester
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_specter")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_aimpoint")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_aimpoint_2")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_docter")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_eotech")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_t1micro")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_cmore")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_acog")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_cs")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_eotech_xps")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_reflex")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_rx01")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_rx30")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_leupold")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_45iron")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_fl_ass_laser")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_fl_ass_smg_sho_peqbox")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_fl_ass_peq15")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_fl_ass_utg")
table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_fl_ass_smg_sho_surefire")
--Model 70
table.insert(self.wpn_fps_snp_model70.uses_parts, "wpn_fps_snp_model70_s_legends")
--Model 1887
table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_upg_o_specter")
table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_upg_o_aimpoint")
table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_upg_o_aimpoint_2")
table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_upg_o_docter")
table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_upg_o_eotech")
table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_upg_o_t1micro")
table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_upg_o_cmore")
table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_upg_o_acog")
table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_upg_o_cs")
table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_upg_o_eotech_xps")
table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_upg_o_reflex")
table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_upg_o_rx01")
table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_upg_o_rx30")
table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_shot_r870_body_rack")
table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_sho_boot_o_iron")
table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_sho_boot_fg_legend")
--RPK
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_s_none")	
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_upg_ak_fg_combo2")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_upg_ak_fg_combo3")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_ak_fg_tapco")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_ak_fg_krebs")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_ak_fg_trax")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_vg_ass_smg_stubby")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_specter")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_aimpoint")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_aimpoint_2")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_docter")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_eotech")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_t1micro")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_cmore")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_acog")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_cs")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_eotech_xps")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_reflex")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_rx01")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_rx30")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_ak_g_vlad")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_ak_fg_vlad")
table.insert(self.wpn_fps_ass_akm.uses_parts, "wpn_fps_ak_fg_vlad")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_upg_ak_s_vlad")
--RPG
table.insert(self.wpn_fps_rpg7.uses_parts, "wpn_fps_rpg7_m_legends")
--KSP
table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_specter")
table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_aimpoint")
table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_aimpoint_2")
table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_docter")
table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_eotech")
table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_t1micro")
table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_cmore")
table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_acog")
table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_cs")
table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_eotech_xps")
table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_reflex")
table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_rx01")
table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_rx30")
--Buzzsaw
table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_specter")
table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_aimpoint")
table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_aimpoint_2")
table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_docter")
table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_eotech")
table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_t1micro")
table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_cmore")
table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_acog")
table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_cs")
table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_eotech_xps")
table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_reflex")
table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_rx01")
table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_rx30")
--SCAR
--Brenner
table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_ass_g3_g_sniper")
table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_ass_g3_g_retro")
table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_specter")
table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_aimpoint")
table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_aimpoint_2")
table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_docter")
table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_eotech")
table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_t1micro")
table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_cmore")
table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_acog")
table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_cs")
table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_eotech_xps")
table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_reflex")
table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_rx01")
table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_rx30")
--KSP58
table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_specter")
table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_aimpoint")
table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_aimpoint_2")
table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_docter")
table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_eotech")
table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_t1micro")
table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_cmore")
table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_acog")
table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_cs")
table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_eotech_xps")
table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_reflex")
table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_rx01")
table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_rx30")
table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_lmg_svinet_s_legends")
table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_lmg_svinet_b_legendas")
--Singles
table.insert(self.wpn_fps_smg_baka.uses_parts, "wpn_fps_smg_uzi_b_suppressed")
table.insert(self.wpn_fps_smg_polymer.uses_parts, "wpn_fps_smg_uzi_b_suppressed")
table.insert(self.wpn_fps_smg_x_sr2.uses_parts, "wpn_fps_smg_uzi_b_suppressed")
table.insert(self.wpn_fps_smg_sr2.uses_parts, "wpn_fps_smg_uzi_b_suppressed")
table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_smg_olympic.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_smg_sr2.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_ass_ak5.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_ass_m14.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_ass_scar.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_ass_aug.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_ass_galil.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_smg_x_mp5.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_smg_mp5.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_ass_galil.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_smg_x_akmsu.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_smg_akmsu.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_smg_cobray.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_smg_mac10.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_ass_s552.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_smg_thompson.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_ass_g3.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_ass_fal.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_smg_p90.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_smg_mp9.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_smg_tec9.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_smg_mp7.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_smg_mp7.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
table.insert(self.wpn_fps_smg_sterling.uses_parts, "wpn_fps_smg_polymer_ns_silencer")
--Batch adder

	local shotguns = {
		"wpn_fps_shot_saiga",
		"wpn_fps_shot_r870",
		"wpn_fps_shot_huntsman",
		"wpn_fps_shot_serbu",
		"wpn_fps_sho_ben",
		"wpn_fps_sho_striker",
		"wpn_fps_sho_ksg",
		"wpn_fps_pis_judge",
		"wpn_fps_sho_spas12",
		"wpn_fps_shot_b682",
		"wpn_fps_sho_aa12",
		"wpn_fps_sho_boot",
		"wpn_fps_shot_m37"
	}
	for i, factory_id in ipairs(shotguns) do
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_a_slugs")
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_a_customx4")
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_a_blank")
	end	
		local minishell = {
		"wpn_fps_shot_r870",
		"wpn_fps_shot_serbu",
		"wpn_fps_sho_ben",
		"wpn_fps_sho_ksg",
		"wpn_fps_sho_spas12",
		"wpn_fps_sho_boot",
		"wpn_fps_shot_m37"
	}
	for i, factory_id in ipairs(minishell) do
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_a_minishell")
		table.insert(self[factory_id].uses_parts, "wpn_fps_upg_a_minishellslug")
	end
		local bootstrap = {
		"wpn_fps_ass_m4",
		"wpn_fps_ass_amcar",
		"wpn_fps_ass_m16",
		"wpn_fps_smg_olympic",
		"wpn_fps_lmg_hk21",
		"wpn_fps_lmg_m249",
		"wpn_fps_lmg_rpk",
		"wpn_fps_lmg_par",
		"wpn_fps_lmg_mg42",
		"wpn_fps_ass_74",
		"wpn_fps_ass_akm",
		"wpn_fps_ass_akm_gold",
		"wpn_fps_smg_akmsu",
		"wpn_fps_smg_baka",
		"wpn_fps_ass_ak5",
		"wpn_fps_ass_aug",
		"wpn_fps_ass_g36",
		"wpn_fps_smg_cobray",
		"wpn_fps_smg_p90",
		"wpn_fps_ass_m14",
		"wpn_fps_smg_mp9",
		"wpn_fps_smg_mp5",
		"wpn_fps_smg_mac10",
		"wpn_fps_ass_s552",
		"wpn_fps_smg_m45",
		"wpn_fps_ass_sub2000",
		"wpn_fps_smg_mp7",
		"wpn_fps_ass_scar",
		"wpn_fps_ass_fal",
		"wpn_fps_smg_scorpion",
		"wpn_fps_smg_tec9",
		"wpn_fps_smg_uzi",
		"wpn_fps_ass_g3",
		"wpn_fps_ass_galil",
		"wpn_fps_ass_famas",
		"wpn_fps_smg_sterling",
		"wpn_fps_smg_thompson",
		"wpn_fps_ass_l85a2",
		"wpn_fps_ass_vhs",
		"wpn_fps_smg_polymer",
		"wpn_fps_smg_sr2",
		"wpn_fps_smg_x_sr2",
		"wpn_fps_smg_x_mp5",
		"wpn_fps_smg_x_akmsu",		
		"wpn_fps_smg_hajk"
	}
	for i, factory_id in ipairs(bootstrap) do
		table.insert(self[factory_id].uses_parts, "wpn_fps_ass_tecci_ns_special")
	end
		local HM2_ext = {
		"wpn_fps_ass_m4",
		"wpn_fps_ass_amcar",
		"wpn_fps_ass_m16",
		"wpn_fps_smg_olympic",
		"wpn_fps_lmg_hk21",
		"wpn_fps_lmg_m249",
		"wpn_fps_lmg_rpk",
		"wpn_fps_lmg_par",
		"wpn_fps_lmg_mg42",
		"wpn_fps_ass_74",
		"wpn_fps_ass_akm",
		"wpn_fps_ass_akm_gold",
		"wpn_fps_smg_akmsu",
		"wpn_fps_ass_ak5",
		"wpn_fps_ass_aug",
		"wpn_fps_ass_g36",
		"wpn_fps_smg_p90",
		"wpn_fps_ass_m14",
		"wpn_fps_smg_mp9",
		"wpn_fps_smg_mp5",
		"wpn_fps_smg_baka",
		"wpn_fps_ass_s552",
		"wpn_fps_ass_sub2000",
		"wpn_fps_smg_m45",
		"wpn_fps_smg_mp7",
		"wpn_fps_ass_scar",
		"wpn_fps_ass_fal",
		"wpn_fps_smg_scorpion",
		"wpn_fps_smg_tec9",
		"wpn_fps_smg_uzi",
		"wpn_fps_ass_g3",
		"wpn_fps_ass_galil",
		"wpn_fps_ass_famas",
		"wpn_fps_smg_sterling",
		"wpn_fps_smg_thompson",
		"wpn_fps_ass_l85a2",
		"wpn_fps_ass_vhs",
		"wpn_fps_smg_polymer",
		"wpn_fps_smg_sr2",
		"wpn_fps_smg_x_sr2",
		"wpn_fps_smg_x_mp5",
		"wpn_fps_smg_x_akmsu",
		"wpn_fps_ass_tecci",
		"wpn_fps_smg_hajk"
	}
	for i, factory_id in ipairs(HM2_ext) do
		table.insert(self[factory_id].uses_parts, "wpn_fps_smg_cobray_ns_barrelextension")
		table.insert(self[factory_id].uses_parts, "wpn_fps_smg_cobray_ns_silencer")
	end	
		local HM_ext = {
		"wpn_fps_lmg_m249",
		"wpn_fps_ass_aug",
		"wpn_fps_ass_g36",
		"wpn_fps_smg_p90",
		"wpn_fps_ass_m14",
		"wpn_fps_smg_mp9",
		"wpn_fps_ass_s552",
		"wpn_fps_smg_m45",
		"wpn_fps_smg_mp7",
		"wpn_fps_smg_cobray",
		"wpn_fps_smg_mac10",
		"wpn_fps_ass_scar",
		"wpn_fps_ass_g3",
		"wpn_fps_ass_galil",
		"wpn_fps_ass_famas",
		"wpn_fps_ass_l85a2",
		"wpn_fps_ass_vhs",
		"wpn_fps_ass_tecci",
		"wpn_fps_smg_hajk"
	}
	for i, factory_id in ipairs(HM_ext) do
		table.insert(self[factory_id].uses_parts, "wpn_fps_smg_scorpion_b_suppressed")
		table.insert(self[factory_id].uses_parts, "wpn_fps_smg_uzi_b_suppressed")
	end	
		local mp7 = {
		"wpn_fps_ass_m4",
		"wpn_fps_ass_amcar",
		"wpn_fps_ass_m16",
		"wpn_fps_smg_olympic",
		"wpn_fps_lmg_hk21",
		"wpn_fps_lmg_m249",
		"wpn_fps_lmg_rpk",
		"wpn_fps_lmg_par",
		"wpn_fps_lmg_mg42",
		"wpn_fps_ass_74",
		"wpn_fps_ass_akm",
		"wpn_fps_ass_akm_gold",
		"wpn_fps_smg_akmsu",
		"wpn_fps_smg_baka",
		"wpn_fps_ass_ak5",
		"wpn_fps_ass_aug",
		"wpn_fps_ass_g36",
		"wpn_fps_smg_cobray",
		"wpn_fps_smg_p90",
		"wpn_fps_ass_m14",
		"wpn_fps_smg_mp9",
		"wpn_fps_smg_mp5",
		"wpn_fps_smg_mac10",
		"wpn_fps_ass_s552",
		"wpn_fps_smg_m45",
		"wpn_fps_ass_sub2000",
		"wpn_fps_smg_mp7",
		"wpn_fps_ass_scar",
		"wpn_fps_ass_fal",
		"wpn_fps_smg_scorpion",
		"wpn_fps_smg_tec9",
		"wpn_fps_smg_uzi",
		"wpn_fps_ass_g3",
		"wpn_fps_ass_galil",
		"wpn_fps_ass_famas",
		"wpn_fps_smg_sterling",
		"wpn_fps_smg_thompson",
		"wpn_fps_ass_l85a2",
		"wpn_fps_ass_vhs",
		"wpn_fps_smg_polymer",
		"wpn_fps_smg_sr2",
		"wpn_fps_smg_x_sr2",
		"wpn_fps_smg_x_mp5",
		"wpn_fps_smg_x_akmsu",
		"wpn_fps_ass_tecci",
		"wpn_fps_smg_hajk"
	}
	for i, factory_id in ipairs(mp7) do
		table.insert(self[factory_id].uses_parts, "wpn_fps_smg_mp7_b_suppressed")
	end
		local mp9 = {
		"wpn_fps_ass_m4",
		"wpn_fps_ass_amcar",
		"wpn_fps_ass_m16",
		"wpn_fps_smg_olympic",
		"wpn_fps_lmg_hk21",
		"wpn_fps_lmg_m249",
		"wpn_fps_lmg_rpk",
		"wpn_fps_lmg_par",
		"wpn_fps_lmg_mg42",
		"wpn_fps_ass_74",
		"wpn_fps_ass_akm",
		"wpn_fps_ass_akm_gold",
		"wpn_fps_smg_akmsu",
		"wpn_fps_smg_baka",
		"wpn_fps_ass_ak5",
		"wpn_fps_ass_aug",
		"wpn_fps_ass_g36",
		"wpn_fps_smg_cobray",
		"wpn_fps_smg_p90",
		"wpn_fps_ass_m14",
		"wpn_fps_smg_mp7",
		"wpn_fps_smg_mp5",
		"wpn_fps_smg_mac10",
		"wpn_fps_ass_s552",
		"wpn_fps_smg_m45",
		"wpn_fps_ass_sub2000",
		"wpn_fps_smg_mp7",
		"wpn_fps_ass_scar",
		"wpn_fps_ass_fal",
		"wpn_fps_smg_scorpion",
		"wpn_fps_smg_tec9",
		"wpn_fps_smg_uzi",
		"wpn_fps_ass_g3",
		"wpn_fps_ass_galil",
		"wpn_fps_ass_famas",
		"wpn_fps_smg_sterling",
		"wpn_fps_smg_thompson",
		"wpn_fps_ass_l85a2",
		"wpn_fps_ass_vhs",
		"wpn_fps_smg_polymer",
		"wpn_fps_smg_sr2",
		"wpn_fps_smg_x_sr2",
		"wpn_fps_smg_x_mp5",
		"wpn_fps_smg_x_akmsu",
		"wpn_fps_ass_tecci",
		"wpn_fps_smg_hajk"
	}
	for i, factory_id in ipairs(mp9) do
		table.insert(self[factory_id].uses_parts, "wpn_fps_smg_mp9_b_suppressed")
	end		
		local Uzi = {
		"wpn_fps_smg_cobray",
		"wpn_fps_smg_p90",
		"wpn_fps_smg_mp9",
		"wpn_fps_smg_mac10",
		"wpn_fps_smg_m45",
		"wpn_fps_smg_mp7",
		"wpn_fps_smg_scorpion",
		"wpn_fps_smg_tec9",
		"wpn_fps_smg_uzi",
		"wpn_fps_smg_sterling",
		"wpn_fps_smg_polymer",
	}
	for i, factory_id in ipairs(Uzi) do
		table.insert(self[factory_id].uses_parts, "wpn_fps_smg_baka_b_midsupp")
		table.insert(self[factory_id].uses_parts, "wpn_fps_smg_baka_b_smallsupp")
		table.insert(self[factory_id].uses_parts, "wpn_fps_smg_baka_b_longsupp")
	end
		local vector = {
		"wpn_fps_lmg_m249",
		"wpn_fps_lmg_mg42",
		"wpn_fps_ass_74",
		"wpn_fps_ass_akm",
		"wpn_fps_ass_akm_gold",
		"wpn_fps_smg_baka",
		"wpn_fps_smg_m45",
		"wpn_fps_ass_sub2000",
		"wpn_fps_smg_scorpion",
		"wpn_fps_smg_uzi",
		"wpn_fps_ass_famas",
		"wpn_fps_ass_l85a2",
		"wpn_fps_ass_vhs",
		"wpn_fps_smg_sr2",
		"wpn_fps_smg_x_sr2",
		"wpn_fps_smg_hajk"
	}
	for i, factory_id in ipairs(vector) do
		table.insert(self[factory_id].uses_parts, "wpn_fps_smg_polymer_barrel_precision")
		table.insert(self[factory_id].uses_parts, "wpn_fps_smg_polymer_ns_silencer")
	end	
if string.lower(RequiredScript) == "lib/tweak_data/tweakdata" then
if not tweak_data then return end
tweak_data.weapon.stats.extra_ammo = {}
    for i = -10, 1000, 2 do
        table.insert(tweak_data.weapon.stats.extra_ammo, i)
end
tweak_data.weapon.stats.total_ammo_mod = {}
    for i = -100, 2000, 5 do
        table.insert(tweak_data.weapon.stats.total_ammo_mod, i / 100)
tweak_data.weapon.stats.value = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10,
		11,
		12,
		13,
		14,
		15,
		16,
		17,
		18,
		19,
		20,
		21,
		22,
		23,
		24,
		25,
		26,
		27,
		28,
		29,
		30
	}		
end
end	
end	
--Boosts tweak
function WeaponFactoryTweakData:create_bonuses(tweak_data, weapon_skins)
    self.parts.wpn_fps_upg_bonus_concealment_p1 = {
        pcs = {
            10,
            20,
            30,
            40
        },
        type = "bonus",
        name_id = "bm_menu_bonus_concealment",
        a_obj = "a_body",
        unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        stats = {value = 1, concealment = 1},
        internal_part = true,
        perks = {"bonus"},
        texture_bundle_folder = "boost_in_lootdrop",
        sub_type = "bonus_stats",
        exclude_from_challenge = true
    }
    self.parts.wpn_fps_upg_bonus_concealment_p2 = {
        pcs = {
            10,
            20,
            30,
            40
        },
        type = "bonus",
        name_id = "bm_menu_bonus_concealment",
        a_obj = "a_body",
        unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        stats = {value = 1, concealment = 2},
        internal_part = true,
        perks = {"bonus"},
        texture_bundle_folder = "boost_in_lootdrop",
        sub_type = "bonus_stats",
        exclude_from_challenge = true
    }
    self.parts.wpn_fps_upg_bonus_concealment_p3 = {
        pcs = {
            10,
            20,
            30,
            40
        },
        type = "bonus",
        name_id = "bm_menu_bonus_concealment",
        a_obj = "a_body",
        unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        stats = {value = 1, concealment = 3},
        internal_part = true,
        perks = {"bonus"},
        texture_bundle_folder = "boost_in_lootdrop",
        sub_type = "bonus_stats",
        exclude_from_challenge = true
    }
    self.parts.wpn_fps_upg_bonus_spread_p1 = {
        pcs = {
            10,
            20,
            30,
            40
        },
        type = "bonus",
        name_id = "bm_menu_bonus_spread",
        a_obj = "a_body",
        unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        stats = {value = 1, spread = 1},
        internal_part = true,
        perks = {"bonus"},
        texture_bundle_folder = "boost_in_lootdrop",
        sub_type = "bonus_stats",
        exclude_from_challenge = true
    }
    self.parts.wpn_fps_upg_bonus_spread_n1 = {
        pcs = {
            10,
            20,
            30,
            40
        },
        type = "bonus",
        name_id = "bm_menu_bonus_spread",
        a_obj = "a_body",
        unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        stats = {value = 1, spread = -1},
        internal_part = true,
        perks = {"bonus"},
        texture_bundle_folder = "boost_in_lootdrop",
        sub_type = "bonus_stats",
        exclude_from_challenge = true
    }
    self.parts.wpn_fps_upg_bonus_recoil_p1 = {
        pcs = {
            10,
            20,
            30,
            40
        },
        type = "bonus",
        name_id = "bm_menu_bonus_recoil",
        a_obj = "a_body",
        unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        stats = {value = 1, recoil = 1},
        internal_part = true,
        perks = {"bonus"},
        texture_bundle_folder = "boost_in_lootdrop",
        sub_type = "bonus_stats",
        exclude_from_challenge = true
    }
    self.parts.wpn_fps_upg_bonus_damage_p1 = {
        pcs = {
            10,
            20,
            30,
            40
        },
        type = "bonus",
        name_id = "bm_menu_bonus_damage",
        a_obj = "a_body",
        unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        stats = {value = 1, damage = 1},
        internal_part = true,
        perks = {"bonus"},
        texture_bundle_folder = "boost_in_lootdrop",
        sub_type = "bonus_stats",
        exclude_from_challenge = true
    }
    self.parts.wpn_fps_upg_bonus_damage_p2 = {
        pcs = {
            10,
            20,
            30,
            40
        },
        type = "bonus",
        name_id = "bm_menu_bonus_damage",
        a_obj = "a_body",
        unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        stats = {value = 1, damage = 2},
        internal_part = true,
        perks = {"bonus"},
        texture_bundle_folder = "boost_in_lootdrop",
        sub_type = "bonus_stats",
        exclude_from_challenge = true
    }
    self.parts.wpn_fps_upg_bonus_total_ammo_p1 = {
        pcs = {
            10,
            20,
            30,
            40
        },
        type = "bonus",
        name_id = "bm_menu_bonus_total_ammo",
        a_obj = "a_body",
        unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        stats = {value = 1, total_ammo_mod = 1},
        internal_part = true,
        perks = {"bonus"},
        texture_bundle_folder = "boost_in_lootdrop",
        sub_type = "bonus_stats",
        exclude_from_challenge = true
    }
    self.parts.wpn_fps_upg_bonus_total_ammo_p3 = {
        pcs = {
            10,
            20,
            30,
            40
        },
        type = "bonus",
        name_id = "bm_menu_bonus_total_ammo",
        a_obj = "a_body",
        unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        stats = {value = 1, total_ammo_mod = 3},
        internal_part = true,
        perks = {"bonus"},
        texture_bundle_folder = "boost_in_lootdrop",
        sub_type = "bonus_stats",
        exclude_from_challenge = true
    }
    self.parts.wpn_fps_upg_bonus_team_exp_money_p3 = {
        pcs = {
            10,
            20,
            30,
            40
        },
        type = "bonus",
        name_id = "bm_wp_upg_bonus_team_exp_money_p3",
        desc_id = "bm_wp_upg_bonus_team_exp_money_p3_desc",
        a_obj = "a_body",
        unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
        stats = {value = 1},
        custom_stats = {exp_multiplier = 1.03, money_multiplier = 1.03},
        internal_part = true,
        perks = {"bonus"},
        has_description = true,
        texture_bundle_folder = "boost_in_lootdrop",
        sub_type = "bonus_team",
        exclude_from_challenge = true
    }
    if weapon_skins then
        local uses_parts = {
            wpn_fps_upg_bonus_team_exp_money_p3 = {},
            wpn_fps_upg_bonus_concealment_p1 = {},
            wpn_fps_upg_bonus_recoil_p1 = {},
            wpn_fps_upg_bonus_spread_p1 = {},
            wpn_fps_upg_bonus_spread_n1 = {},
            wpn_fps_upg_bonus_damage_p1 = {},
            wpn_fps_upg_bonus_total_ammo_p1 = {},
            wpn_fps_upg_bonus_concealment_p2 = {},
            wpn_fps_upg_bonus_concealment_p3 = {},
            wpn_fps_upg_bonus_damage_p2 = {},
            wpn_fps_upg_bonus_total_ammo_p3 = {},
        }
        local all_pass, weapon_pass, exclude_weapon_pass, category_pass, exclude_category_pass
        for id, data in pairs(tweak_data.upgrades.definitions) do
            if data.weapon_id and tweak_data.weapon[data.weapon_id] and data.factory_id and self[data.factory_id] then
                for part_id, params in pairs(uses_parts) do
                    weapon_pass = not params.weapon or table.contains(params.weapon, data.weapon_id)
                    exclude_weapon_pass = not params.exclude_weapon or not table.contains(params.exclude_weapon, data.weapon_id)
                    category_pass = not params.category or table.contains(params.category, tweak_data.weapon[data.weapon_id].category)
                    exclude_category_pass = not params.exclude_category or not table.contains(params.exclude_category, tweak_data.weapon[data.weapon_id].category)
                    all_pass = weapon_pass and exclude_weapon_pass and category_pass and exclude_category_pass
                    if all_pass then
                        table.insert(self[data.factory_id].uses_parts, part_id)
                        table.insert(self[data.factory_id .. "_npc"].uses_parts, part_id)
                    end
                end
            end
        end
    end	
end
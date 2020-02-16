function WeaponFactoryTweakData:_init_par()
	self.parts.wpn_fps_lmg_par_b_short = {
		texture_bundle_folder = "par",
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_par_b_short",
		unit = "units/pd2_dlc_par/weapons/wpn_fps_lmg_par_pts/wpn_fps_lmg_par_b_short",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			value = 0,
			concealment = 2
		}
	}
	self.parts.wpn_fps_lmg_par_b_standard = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_par_b_standard",
		unit = "units/pd2_dlc_par/weapons/wpn_fps_lmg_par_pts/wpn_fps_lmg_par_b_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_lmg_par_body_standard = {
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "bm_wp_par_body_standard",
		unit = "units/pd2_dlc_par/weapons/wpn_fps_lmg_par_pts/wpn_fps_lmg_par_body_standard",
		stats = {value = 1},
		animations = {
			reload_not_empty = "reload_not_empty",
			reload = "reload"
		}
	}
	self.parts.wpn_fps_lmg_par_m_standard = {
		a_obj = "a_m",
		type = "magazine",
		name_id = "bm_wp_par_m_standard",
		unit = "units/pd2_dlc_par/weapons/wpn_fps_lmg_par_pts/wpn_fps_lmg_par_m_standard",
		bullet_objects = {
			amount = 15,
			prefix = "g_bullet_"
		},
		stats = {value = 1},
		animations = {
			reload_not_empty = "reload_not_empty",
			reload = "reload",
			fire_steelsight = "recoil",
			fire = "recoil"
		}
	}
	self.parts.wpn_fps_lmg_par_s_plastic = {
		texture_bundle_folder = "par",
		a_obj = "a_s",
		type = "stock",
		name_id = "bm_wp_par_s_plastic",
		unit = "units/pd2_dlc_par/weapons/wpn_fps_lmg_par_pts/wpn_fps_lmg_par_s_plastic",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			value = 0,
			recoil = 1,
			concealment = -2
		}
	}
	self.parts.wpn_fps_lmg_par_s_standard = {
		a_obj = "a_s",
		type = "stock",
		name_id = "bm_wp_par_s_standard",
		unit = "units/pd2_dlc_par/weapons/wpn_fps_lmg_par_pts/wpn_fps_lmg_par_s_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_lmg_par_upper_reciever = {
		a_obj = "a_upper",
		type = "upper_reciever",
		name_id = "bm_wp_par_body_upper",
		unit = "units/pd2_dlc_par/weapons/wpn_fps_lmg_par_pts/wpn_fps_lmg_par_upper_reciever",
		stats = {value = 1},
		animations = {
			reload_not_empty = "reload_not_empty",
			reload = "reload"
		}
	}
	self.parts.wpn_fps_lmg_par_b_short.third_unit = "units/pd2_dlc_par/weapons/wpn_third_lmg_par_pts/wpn_third_lmg_par_b_short"
	self.parts.wpn_fps_lmg_par_b_standard.third_unit = "units/pd2_dlc_par/weapons/wpn_third_lmg_par_pts/wpn_third_lmg_par_b_standard"
	self.parts.wpn_fps_lmg_par_body_standard.third_unit = "units/pd2_dlc_par/weapons/wpn_third_lmg_par_pts/wpn_third_lmg_par_body_standard"
	self.parts.wpn_fps_lmg_par_m_standard.third_unit = "units/pd2_dlc_par/weapons/wpn_third_lmg_par_pts/wpn_third_lmg_par_m_standard"
	self.parts.wpn_fps_lmg_par_s_plastic.third_unit = "units/pd2_dlc_par/weapons/wpn_third_lmg_par_pts/wpn_third_lmg_par_s_plastic"
	self.parts.wpn_fps_lmg_par_s_standard.third_unit = "units/pd2_dlc_par/weapons/wpn_third_lmg_par_pts/wpn_third_lmg_par_s_standard"
	self.parts.wpn_fps_lmg_par_upper_reciever.third_unit = "units/pd2_dlc_par/weapons/wpn_third_lmg_par_pts/wpn_third_lmg_par_upper_reciever"
	self.wpn_fps_lmg_par = {
		unit = "units/pd2_dlc_par/weapons/wpn_fps_lmg_par/wpn_fps_lmg_par",
		optional_types = {
			"barrel_ext",
			"gadget",
			"sight",
			"vertical_grip"
		},
		default_blueprint = {
			"wpn_fps_lmg_par_b_standard",
			"wpn_fps_lmg_par_body_standard",
			"wpn_fps_lmg_par_m_standard",
			"wpn_fps_lmg_par_s_standard",
			"wpn_fps_lmg_par_upper_reciever"
		},
		uses_parts = {
			"wpn_fps_lmg_par_b_short",
			"wpn_fps_lmg_par_b_standard",
			"wpn_fps_lmg_par_body_standard",
			"wpn_fps_lmg_par_m_standard",
			"wpn_fps_lmg_par_s_standard",
			"wpn_fps_lmg_par_s_plastic",
			"wpn_fps_lmg_par_upper_reciever",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_lmg_svinet_b_standard",
			"wpn_fps_lmg_svinet_s_legend"
		}
	}
	self.wpn_fps_lmg_par_npc = deep_clone(self.wpn_fps_lmg_par)
	self.wpn_fps_lmg_par_npc.unit = "units/pd2_dlc_par/weapons/wpn_fps_lmg_par/wpn_fps_lmg_par_npc"
end

function WeaponFactoryTweakData:_init_tng()
	self.parts.wpn_fps_sho_saiga_b_short = {
		is_a_unlockable = true,
		texture_bundle_folder = "tng",
		a_obj = "a_b",
		type = "barrel",
		dlc = "tango",
		name_id = "bm_wp_saiga_b_short",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_sho_saiga_b_short/wpn_fps_sho_saiga_b_short",
		pcs = {},
		stats = {
			spread = -1,
			recoil = -1,
			concealment = 4,
			value = 1
		},
		forbids = {"wpn_fps_ak_extra_ris"},
		override = {wpn_upg_saiga_fg_lowerrail = {unit = "units/payday2/weapons/wpn_fps_shot_saiga_pts/wpn_upg_saiga_fg_lowerrail_short"}}
	}
	self.parts.wpn_fps_sho_saiga_fg_holy = {
		is_a_unlockable = true,
		texture_bundle_folder = "tng",
		type = "foregrip",
		a_obj = "a_fg",
		dlc = "tango",
		name_id = "bm_wp_saiga_fg_holy",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_sho_saiga_fg_holy/wpn_fps_sho_saiga_fg_holy",
		pcs = {},
		stats = {
			value = 1,
			concealment = 4
		}
	}
	self.parts.wpn_fps_upg_o_45rds = {
		is_a_unlockable = true,
		texture_bundle_folder = "tng",
		a_obj = "a_o",
		depends_on = "sight",
		dlc = "tango",
		sub_type = "second_sight",
		type = "gadget",
		name_id = "bm_wpn_fps_upg_o_45rds",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_upg_o_45rds/wpn_fps_upg_o_45rds",
		pcs = {},
		stats = {
			value = 1,
			gadget_zoom = 1,
			recoil = 1
		},
		perks = {"gadget"},
		texture_switch = {
			material = "gfx_reddot1",
			channel = "diffuse_texture"
		},
		stance_mod = {
			wpn_fps_ass_m4 = {
				translation = Vector3(-2.75, 0, -11.15),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_amcar = {
				translation = Vector3(-2.75, 0, -10.7),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_m16 = {
				translation = Vector3(-2.75, 0, -10.7),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_74 = {
				translation = Vector3(-3.2, -20, -13.75),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_akm = {
				translation = Vector3(-3.2, -20, -13.75),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_akm_gold = {
				translation = Vector3(-3.2, -20, -13.75),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_ak5 = {
				translation = Vector3(-1.3, 0, -13.6),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_aug = {
				translation = Vector3(-3.52, 0, -12.15),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_g36 = {
				translation = Vector3(-0.65, 0, -12.47),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_m14 = {
				translation = Vector3(-1.94, -10, -14.35),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_s552 = {
				translation = Vector3(-3.15, 0, -12.9),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_scar = {
				translation = Vector3(-1.6, 0, -10.4),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_scar = {
				translation = Vector3(-1.6, 0, -10.4),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_fal = {
				translation = Vector3(-2.37, 0, -13.98),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_g3 = {
				translation = Vector3(-0.7, -10, -13.14),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_galil = {
				translation = Vector3(-2.2, 0, -13.56),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_famas = {
				translation = Vector3(2.7, 0, -16.9),
				rotation = Rotation(0, 1.5, -45)
			},
			wpn_fps_ass_l85a2 = {
				translation = Vector3(-4.3, 10, -8.35),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_asval = {
				translation = Vector3(-1.7, 0, -10.15),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_vhs = {
				translation = Vector3(-2.65, 0, -10.7),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_sub2000 = {
				translation = Vector3(-5.15, 0, -10.1),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_tecci = {
				translation = Vector3(-3, 0, -12.85),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_contraband = {
				translation = Vector3(-2.35, 0, -12),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_snp_m95 = {
				translation = Vector3(-0.4, 5.8, -15.075),
				rotation = Rotation(-0.4, 0, -45)
			},
			wpn_fps_snp_msr = {
				translation = Vector3(-2.2, 8, -12.29),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_snp_r93 = {
				translation = Vector3(-2.3, 7.8, -14.1),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_snp_mosin = {
				translation = Vector3(-2.2, -5, -13),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_snp_wa2000 = {
				translation = Vector3(-2.25, 0, -9.5),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_snp_model70 = {
				translation = Vector3(-2.55, -4, -12.3),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_snp_desertfox = {
				translation = Vector3(-3.21, -4, -12.05),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_snp_tti = {
				translation = Vector3(-2.83, 0, -9.65),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_snp_siltstone = {
				translation = Vector3(-1.67, 0, -13.15),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_flint = {
				translation = Vector3(-3.2, 0, -13.1),
				rotation = Rotation(0, 0, -45)
			},
			wpn_fps_ass_ching = {
				translation = Vector3(-1.8, 0, -13.1),
				rotation = Rotation(0, 0, -45)
			}
		}
	}
	self.parts.wpn_fps_upg_o_spot = {
		is_a_unlockable = true,
		texture_bundle_folder = "tng",
		dlc = "tango",
		a_obj = "a_o",
		type = "sight",
		name_id = "bm_wp_upg_o_spot",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_upg_o_spot/wpn_fps_upg_o_spot",
		pcs = {},
		stats = {
			zoom = 4,
			recoil = 1,
			concealment = -3,
			value = 8,
			spread_moving = -3
		},
		perks = {"scope"},
		stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod),
		forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up",
			"wpn_fps_upg_o_xpsg33_magnifier"
		},
		texture_switch = {
			material = "gfx_reddot1",
			channel = "diffuse_texture"
		}
	}
	self.parts.wpn_fps_upg_o_box = {
		is_a_unlockable = true,
		texture_bundle_folder = "tng",
		dlc = "tango",
		a_obj = "a_o",
		type = "sight",
		reticle_obj = "g_reticle",
		name_id = "bm_wp_upg_o_box",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_upg_o_box/wpn_fps_upg_o_box",
		pcs = {},
		stats = {
			zoom = 10,
			recoil = 1,
			concealment = -3,
			value = 8,
			spread_moving = -3
		},
		perks = {
			"scope",
			"highlight"
		},
		stance_mod = {
			wpn_fps_snp_m95 = {translation = Vector3(0, -18, -4.68)},
			wpn_fps_snp_msr = {translation = Vector3(0, -31, -4.3951)},
			wpn_fps_snp_r93 = {translation = Vector3(-0.002, -27, -4.622)},
			wpn_fps_snp_mosin = {translation = Vector3(-0.005, -47, -5.14)},
			wpn_fps_snp_wa2000 = {translation = Vector3(0, -27, -0.1)},
			wpn_fps_snp_model70 = {translation = Vector3(0, -27, -4.89)},
			wpn_fps_snp_desertfox = {translation = Vector3(0, -35, -4.8)},
			wpn_fps_snp_tti = {translation = Vector3(0, -19, -0.955)},
			wpn_fps_snp_siltstone = {translation = Vector3(0, -14, -4.872)}
		},
		forbids = {"wpn_fps_upg_o_xpsg33_magnifier"},
		texture_switch = {
			material = "gfx_reddot1",
			channel = "diffuse_texture"
		}
	}
	self.parts.wpn_fps_ass_g36_o_vintage = {
		is_a_unlockable = true,
		texture_bundle_folder = "tng",
		dlc = "tango",
		a_obj = "a_body",
		type = "sight",
		name_id = "bm_wp_g36_o_vintage",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_ass_g36_body_optics/wpn_fps_ass_g36_o_vintage",
		pcs = {},
		stats = {
			zoom = 5,
			recoil = 1,
			value = 1
		},
		perks = {"scope"},
		override = {
			wpn_fps_ass_g36_body_standard = {
				third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_ass_g36_body_optics/wpn_third_ass_g36_body_optics",
				unit = "units/pd2_dlc_tng/weapons/wpn_fps_ass_g36_body_optics/wpn_fps_ass_g36_body_optics"
			},
			wpn_fps_ass_g36_body_sl8 = {
				third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_ass_g36_body_optics/wpn_third_ass_g36_body_optics_sl8",
				unit = "units/pd2_dlc_tng/weapons/wpn_fps_ass_g36_body_optics/wpn_fps_ass_g36_body_optics_sl8"
			}
		},
		stance_mod = {wpn_fps_ass_g36 = {translation = Vector3(-0.02, 0, -2.35)}},
		texture_switch = {
			material = "gfx_reddot1",
			channel = "diffuse_texture"
		},
		forbids = {"wpn_fps_upg_o_xpsg33_magnifier"}
	}
	self.parts.wpn_fps_upg_g36_fg_long = {
		is_a_unlockable = true,
		texture_bundle_folder = "tng",
		type = "foregrip",
		a_obj = "a_fg",
		dlc = "tango",
		name_id = "bm_wp_g36_fg_long",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_ass_g36_fg_long/wpn_fps_upg_g36_fg_long",
		pcs = {},
		stats = {
			spread = 2,
			recoil = 1,
			value = 1,
			concealment = -3
		},
		forbids = {
			"wpn_fps_ass_g36_b_short",
			"wpn_fps_ass_g36_b_long"
		},
		adds = {"wpn_fps_upg_g36_b_ultra"}
	}
	self.parts.wpn_fps_upg_g36_b_ultra = {
		a_obj = "a_fg",
		type = "barrel",
		name_id = "bm_wp_g36_b_ultra",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_ass_g36_fg_long/wpn_fps_upg_g36_b_ultra",
		stats = {value = 1}
	}
	self.parts.wpn_fps_smg_mp5_fg_flash = {
		is_a_unlockable = true,
		texture_bundle_folder = "tng",
		dlc = "tango",
		a_obj = "a_fg",
		type = "foregrip",
		name_id = "bm_wp_mp5_fg_flash",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_mp5_fg_flash/wpn_fps_smg_mp5_fg_flash",
		pcs = {},
		stats = {
			spread = 1,
			recoil = 1,
			concealment = -2,
			value = 1
		},
		perks = {"gadget"},
		adds = {"wpn_fps_smg_mp5_b_mp5a5"},
		animations = {reload = "reload"},
		override = {
			wpn_fps_upg_fl_ass_smg_sho_peqbox = {parent = "foregrip"},
			wpn_fps_upg_fl_ass_smg_sho_surefire = {parent = "foregrip"},
			wpn_fps_upg_fl_ass_peq15 = {parent = "foregrip"},
			wpn_fps_upg_fl_ass_laser = {parent = "foregrip"},
			wpn_fps_upg_fl_ass_utg = {parent = "foregrip"},
			wpn_fps_addon_ris = {parent = "foregrip"}
		}
	}
	self.parts.wpn_fps_smg_mp5_s_folding = {
		is_a_unlockable = true,
		texture_bundle_folder = "tng",
		type = "stock",
		a_obj = "a_s",
		dlc = "tango",
		name_id = "bm_wp_mp5_s_folding",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_mp5_s_folding/wpn_fps_smg_mp5_s_folding",
		pcs = {},
		stats = {
			value = 1,
			recoil = 1
		}
	}
	self.parts.wpn_fps_upg_ns_duck = {
		is_a_unlockable = true,
		texture_bundle_folder = "tng",
		type = "barrel_ext",
		a_obj = "a_ns",
		parent = "barrel",
		dlc = "tango",
		name_id = "bm_wp_ns_duck",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_upg_ns_duck/wpn_fps_upg_ns_duck",
		pcs = {},
		stats = {
			value = 1,
			recoil = 2,
			damage = 2,
			concealment = -2,
			spread_multi = {
				2.25,
				0.5
			}
		}
	}
	self.parts.wpn_fps_pis_usp_m_big = {
		texture_bundle_folder = "tng",
		a_obj = "a_m",
		type = "magazine",
		is_a_unlockable = true,
		dlc = "tango",
		name_id = "bm_wp_usp_m_big",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_pis_usp_m_big/wpn_fps_pis_usp_m_big",
		pcs = {},
		stats = {
			extra_ammo = 6,
			value = 2,
			recoil = 2,
			concealment = -2,
			spread_moving = -1
		},
		animations = {
			reload_not_empty = "reload_not_empty",
			reload = "reload"
		}
	}
	self.parts.wpn_fps_pis_1911_m_big = {
		texture_bundle_folder = "tng",
		a_obj = "a_m",
		type = "magazine",
		is_a_unlockable = true,
		dlc = "tango",
		name_id = "bm_wp_1911_m_big",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_pis_1911_m_big/wpn_fps_pis_1911_m_big",
		pcs = {},
		stats = {
			extra_ammo = 6,
			value = 2,
			recoil = 2,
			concealment = -2,
			spread_moving = -1
		},
		animations = {
			reload_not_empty = "reload_not_empty",
			reload = "reload"
		}
	}
	self.parts.wpn_fps_smg_p90_m_strap = {
		texture_bundle_folder = "tng",
		a_obj = "a_m",
		type = "magazine",
		is_a_unlockable = true,
		dlc = "tango",
		name_id = "bm_wp_p90_m_strap",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_p90_m_strap/wpn_fps_smg_p90_m_strap",
		pcs = {},
		bullet_objects = {
			amount = 50,
			prefix = "g_bullet_"
		},
		stats = {
			value = 2,
			reload = 2,
			concealment = -1
		},
		animations = {
			reload_not_empty = "reload_not_empty",
			reload = "reload"
		}
	}
	self.parts.wpn_fps_ass_aug_m_quick = {
		is_a_unlockable = true,
		texture_bundle_folder = "tng",
		a_obj = "a_m",
		type = "magazine",
		dlc = "tango",
		name_id = "bm_wp_aug_m_quick",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_ass_aug_m_quick/wpn_fps_ass_aug_m_quick",
		pcs = {},
		bullet_objects = {
			amount = 21,
			prefix = "g_bullet_"
		},
		stats = {
			value = 2,
			reload = 2,
			concealment = -1
		}
	}
	self.parts.wpn_fps_m4_upg_m_quick = {
		is_a_unlockable = true,
		texture_bundle_folder = "tng",
		type = "magazine",
		a_obj = "a_m",
		dlc = "tango",
		name_id = "bm_wp_m4_m_quick",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_olympic_m_quick/wpn_fps_m4_upg_m_quick",
		pcs = {},
		stats = {
			value = 2,
			reload = 2,
			concealment = -1
		}
	}
	self.parts.wpn_fps_upg_ak_m_quick = {
		is_a_unlockable = true,
		texture_bundle_folder = "tng",
		type = "magazine",
		a_obj = "a_m",
		dlc = "tango",
		name_id = "bm_wp_ak_m_quick",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_ass_ak_m_quick/wpn_fps_upg_ak_m_quick",
		pcs = {},
		stats = {
			value = 2,
			reload = 2,
			concealment = -1
		}
	}
	self.parts.wpn_fps_ass_g36_m_quick = {
		texture_bundle_folder = "tng",
		a_obj = "a_m",
		type = "magazine",
		is_a_unlockable = true,
		dlc = "tango",
		name_id = "bm_wp_g36_m_quick",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_ass_g36_m_quick/wpn_fps_ass_g36_m_quick",
		pcs = {},
		bullet_objects = {
			amount = 28,
			prefix = "g_bullet_"
		},
		stats = {
			value = 2,
			reload = 2,
			concealment = -1
		},
		animations = {
			reload_not_empty = "reload_not_empty",
			reload = "reload"
		}
	}
	self.parts.wpn_fps_smg_mac10_m_quick = {
		texture_bundle_folder = "tng",
		a_obj = "a_m",
		type = "magazine",
		is_a_unlockable = true,
		dlc = "tango",
		name_id = "bm_wp_mac10_m_quick",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_mac10_m_quick/wpn_fps_smg_mac10_m_quick",
		pcs = {},
		stats = {
			value = 2,
			reload = 2,
			concealment = -1,
			extra_ammo = 4
		},
		animations = {
			reload_not_empty = "reload_not_empty",
			reload = "reload"
		}
	}
	self.parts.wpn_fps_smg_sr2_m_quick = {
		texture_bundle_folder = "tng",
		a_obj = "a_m",
		type = "magazine",
		is_a_unlockable = true,
		dlc = "tango",
		name_id = "bm_wp_sr2_m_quick",
		unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_sr2_m_quick/wpn_fps_smg_sr2_m_quick",
		pcs = {},
		stats = {
			value = 2,
			reload = 2,
			concealment = -1
		},
		animations = {
			reload_not_empty = "reload_not_empty",
			reload = "reload"
		}
	}
	self.parts.wpn_fps_sho_saiga_b_short.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_sho_saiga_b_short/wpn_third_sho_saiga_b_short"
	self.parts.wpn_fps_sho_saiga_fg_holy.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_sho_saiga_fg_holy/wpn_third_sho_saiga_fg_holy"
	self.parts.wpn_fps_upg_o_45rds.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_upg_o_45rds/wpn_third_upg_o_45rds"
	self.parts.wpn_fps_upg_o_spot.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_upg_o_spot/wpn_third_upg_o_spot"
	self.parts.wpn_fps_upg_o_box.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_upg_o_box/wpn_third_upg_o_box"
	self.parts.wpn_fps_upg_g36_fg_long.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_ass_g36_fg_long/wpn_third_upg_g36_fg_long"
	self.parts.wpn_fps_smg_mp5_fg_flash.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_mp5_fg_flash/wpn_third_smg_mp5_fg_flash"
	self.parts.wpn_fps_smg_mp5_s_folding.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_mp5_s_folding/wpn_third_smg_mp5_s_folding"
	self.parts.wpn_fps_upg_ns_duck.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_upg_ns_duck/wpn_third_upg_ns_duck"
	self.parts.wpn_fps_pis_usp_m_big.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_pis_usp_m_big/wpn_third_pis_usp_m_big"
	self.parts.wpn_fps_pis_1911_m_big.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_pis_1911_m_big/wpn_third_pis_1911_m_big"
	self.parts.wpn_fps_smg_p90_m_strap.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_p90_m_strap/wpn_third_smg_p90_m_strap"
	self.parts.wpn_fps_ass_aug_m_quick.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_ass_aug_m_quick/wpn_third_ass_aug_m_quick"
	self.parts.wpn_fps_m4_upg_m_quick.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_olympic_m_quick/wpn_third_m4_upg_m_quick"
	self.parts.wpn_fps_upg_ak_m_quick.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_ass_ak_m_quick/wpn_third_upg_ak_m_quick"
	self.parts.wpn_fps_ass_g36_m_quick.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_ass_g36_m_quick/wpn_third_ass_g36_m_quick"
	self.parts.wpn_fps_smg_mac10_m_quick.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_mac10_m_quick/wpn_third_smg_mac10_m_quick"
	self.parts.wpn_fps_smg_sr2_m_quick.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_sr2_m_quick/wpn_third_smg_sr2_m_quick"
end
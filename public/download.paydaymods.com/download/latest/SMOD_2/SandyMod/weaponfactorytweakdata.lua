

--Vanilla silencers
function WeaponFactoryTweakData:_init_silencers()
	self.parts.wpn_fps_upg_ns_ass_smg_large = {
		type = "barrel_ext",
		sub_type = "silencer",
		a_obj = "a_ns",
		parent = "barrel",
		name_id = "bm_wp_upg_ns_ass_smg_large",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_large/wpn_fps_upg_ns_ass_smg_large",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			alert_size = 12,
			spread_moving = 2,
			damage = -1,
			suppression = 12,
			value = 5,
			recoil = 1,
			spread = 2,
			concealment = -3
		},
		perks = {
			"silencer"
		},
		sound_switch = {
			suppressed = "suppressed_c"
		}
	}
	self.parts.wpn_fps_upg_ns_ass_smg_medium = {
		type = "barrel_ext",
		sub_type = "silencer",
		a_obj = "a_ns",
		parent = "barrel",
		name_id = "bm_wp_upg_ns_ass_smg_medium",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_medium/wpn_fps_upg_ns_ass_smg_medium",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			alert_size = 12,
			spread_moving = -2,
			damage = -3,
			suppression = 12,
			value = 2,
			recoil = 1,
			concealment = -2
		},
		perks = {
			"silencer"
		},
		sound_switch = {
			suppressed = "suppressed_b"
		}
	}
	self.parts.wpn_fps_upg_ns_ass_smg_small = {
		type = "barrel_ext",
		sub_type = "silencer",
		a_obj = "a_ns",
		parent = "barrel",
		name_id = "bm_wp_upg_ns_ass_smg_small",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_small/wpn_fps_upg_ns_ass_smg_small",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			alert_size = 12,
			spread_moving = -1,
			damage = -5,
			suppression = 12,
			value = 3,
			recoil = 0,
			concealment = 0
		},
		perks = {
			"silencer"
		},
		sound_switch = {
			suppressed = "suppressed_a"
		}
	}
	self.parts.wpn_fps_upg_ns_pis_large = {
		type = "barrel_ext",
		sub_type = "silencer",
		a_obj = "a_ns",
		parent = "slide",
		name_id = "bm_wp_upg_ns_pis_large",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_large/wpn_fps_upg_ns_pis_large",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			alert_size = 12,
			spread_moving = -2,
			damage = -1,
			suppression = 12,
			value = 5,
			recoil = 2,
			concealment = -3
		},
		perks = {
			"silencer"
		},
		sound_switch = {
			suppressed = "suppressed_c"
		}
	}
	self.parts.wpn_fps_upg_ns_pis_medium = {
		type = "barrel_ext",
		sub_type = "silencer",
		a_obj = "a_ns",
		parent = "slide",
		name_id = "bm_wp_upg_ns_pis_medium",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_medium/wpn_fps_upg_ns_pis_medium",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			alert_size = 12,
			spread_moving = -2,
			damage = -2,
			suppression = 12,
			value = 1,
			recoil = 1,
			concealment = -2
		},
		perks = {
			"silencer"
		},
		sound_switch = {
			suppressed = "suppressed_b"
		}
	}
	self.parts.wpn_fps_upg_ns_pis_small = {
		type = "barrel_ext",
		sub_type = "silencer",
		a_obj = "a_ns",
		parent = "slide",
		name_id = "bm_wp_upg_ns_pis_small",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_small/wpn_fps_upg_ns_pis_small",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			alert_size = 12,
			spread_moving = -1,
			damage = -4,
			suppression = 12,
			value = 3,
			recoil = 0,
			concealment = 0
		},
		perks = {
			"silencer"
		},
		sound_switch = {
			suppressed = "suppressed_a"
		}
	}
	self.parts.wpn_fps_upg_ns_shot_thick = {
		type = "barrel_ext",
		sub_type = "silencer",
		a_obj = "a_ns",
		parent = "barrel",
		name_id = "bm_wp_upg_ns_shot_thick",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_shot_thick/wpn_fps_upg_ns_shot_thick",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			alert_size = 12,
			spread_moving = -2,
			damage = -4,
			suppression = 12,
			value = 7,
			recoil = 1,
			concealment = -2
		},
		perks = {
			"silencer"
		},
		sound_switch = {
			suppressed = "suppressed_a"
		}
	}
	self.parts.wpn_fps_upg_ns_ass_smg_large.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_large/wpn_third_upg_ns_ass_smg_large"
	self.parts.wpn_fps_upg_ns_ass_smg_medium.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_medium/wpn_third_upg_ns_ass_smg_medium"
	self.parts.wpn_fps_upg_ns_ass_smg_small.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_small/wpn_third_upg_ns_ass_smg_small"
	self.parts.wpn_fps_upg_ns_pis_large.third_unit = "units/payday2/weapons/wpn_third_upg_ns_pis_large/wpn_third_upg_ns_pis_large"
	self.parts.wpn_fps_upg_ns_pis_medium.third_unit = "units/payday2/weapons/wpn_third_upg_ns_pis_medium/wpn_third_upg_ns_pis_medium"
	self.parts.wpn_fps_upg_ns_pis_small.third_unit = "units/payday2/weapons/wpn_third_upg_ns_pis_small/wpn_third_upg_ns_pis_small"
	self.parts.wpn_fps_upg_ns_shot_thick.third_unit = "units/payday2/weapons/wpn_third_upg_ns_shot_thick/wpn_third_upg_ns_shot_thick"
end

--Vanilla Nozzles
function WeaponFactoryTweakData:_init_nozzles()
--Firebreather
	self.parts.wpn_fps_upg_ns_ass_smg_firepig = {
		parent = "barrel",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_firepig/wpn_fps_upg_ns_ass_smg_firepig",
		type = "barrel_ext",
		name_id = "bm_wp_upg_ns_ass_smg_firepig",
		a_obj = "a_ns",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			concealment = -2,
			damage = 4, --was 3
			suppression = -5,
			value = 5,
			recoil = 1
		}
	}
	--Stubby Comp
	self.parts.wpn_fps_upg_ns_ass_smg_stubby = {
		parent = "barrel",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_stubby/wpn_fps_upg_ns_ass_smg_stubby",
		type = "barrel_ext",
		name_id = "bm_wp_upg_ns_ass_smg_stubby",
		a_obj = "a_ns",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			value = 3,
			recoil = 3,
			damage = 1,
			suppression = -1,
			spread = 1 --added
		}
	}
	--Tank Comp
	self.parts.wpn_fps_upg_ns_ass_smg_tank = {
		parent = "barrel",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_tank/wpn_fps_upg_ns_ass_smg_tank",
		type = "barrel_ext",
		name_id = "bm_wp_upg_ns_ass_smg_tank",
		a_obj = "a_ns",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			concealment = -1,
			damage = 3, --was 2
			suppression = -2,
			value = 4,
			recoil = 2
		}
	}
	--Shark Teeth nozzle
	self.parts.wpn_fps_upg_ns_shot_shark = {
		parent = "barrel",
		unit = "units/payday2/weapons/wpn_fps_upg_ns_shot_shark/wpn_fps_upg_ns_shot_shark",
		type = "barrel_ext",
		name_id = "bm_wp_upg_ns_shot_shark",
		a_obj = "a_ns",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			spread = -2,
			concealment = -2,
			damage = 2,
			suppression = -2,
			value = 5,
			recoil = 2
		}
	}
	self.parts.wpn_fps_upg_ns_ass_smg_firepig.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_firepig/wpn_third_upg_ns_ass_smg_firepig"
	self.parts.wpn_fps_upg_ns_ass_smg_stubby.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_stubby/wpn_third_upg_ns_ass_smg_stubby"
	self.parts.wpn_fps_upg_ns_ass_smg_tank.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_tank/wpn_third_upg_ns_ass_smg_tank"
	self.parts.wpn_fps_upg_ns_shot_shark.third_unit = "units/payday2/weapons/wpn_third_upg_ns_shot_shark/wpn_third_upg_ns_shot_shark"
end

--Vanilla Gadgets
function WeaponFactoryTweakData:_init_gadgets()
	self.parts.wpn_fps_addon_ris = {
		a_obj = "a_fl",
		type = "extra",
		name_id = "bm_wp_upg_fl_pis_tlr1",
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_addon_ris",
		stats = {
			value = 1
		},
		third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_addon_ris"
	}

	self.parts.wpn_fps_upg_fl_ass_smg_sho_surefire = {
		sub_type = "flashlight",
		unit = "units/payday2/weapons/wpn_fps_upg_fl_ass_smg_sho_surefire/wpn_fps_upg_fl_ass_smg_sho_surefire",
		type = "gadget",
		name_id = "bm_wp_upg_fl_ass_smg_sho_surefire",
		a_obj = "a_fl",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			value = 3,
			spread_moving = -1,
			recoil = 3, --added
			suppression = -2, --added
			concealment = -2 -- -1
		},
		adds = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_upg_fl_ass_smg_sho_peqbox = {
		sub_type = "laser",
		unit = "units/payday2/weapons/wpn_fps_upg_fl_ass_smg_sho_peqbox/wpn_fps_upg_fl_ass_smg_sho_peqbox",
		type = "gadget",
		name_id = "bm_wp_upg_fl_ass_smg_sho_peqbox",
		a_obj = "a_fl",
		pcs = {
			20,
			30,
			40
		},
		stats = {
			value = 5,
			spread = 1, --added
			spread_moving = 1, -- -1,
			concealment = -1
		},
		adds = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_upg_fl_pis_laser = {
		sub_type = "laser",
		unit = "units/payday2/weapons/wpn_fps_upg_fl_pis_laser/wpn_fps_upg_fl_pis_laser",
		type = "gadget",
		name_id = "bm_wp_upg_fl_pis_laser",
		a_obj = "a_fl",
		pcs = {
			20,
			30,
			40
		},
		stats = {
			value = 5,
			spread_moving = -1,
			concealment = -1
		}
	}
	self.parts.wpn_fps_upg_fl_pis_tlr1 = {
		sub_type = "flashlight",
		unit = "units/payday2/weapons/wpn_fps_upg_fl_pis_tlr1/wpn_fps_upg_fl_pis_tlr1",
		type = "gadget",
		name_id = "bm_wp_upg_fl_pis_tlr1",
		a_obj = "a_fl",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			value = 2,
			spread_moving = -1,
			concealment = -1
		}
	}
	self.parts.wpn_fps_upg_fl_ass_smg_sho_surefire.third_unit = "units/payday2/weapons/wpn_third_upg_fl_ass_smg_sho_surefire/wpn_third_upg_fl_ass_smg_sho_surefire"
	self.parts.wpn_fps_upg_fl_ass_smg_sho_peqbox.third_unit = "units/payday2/weapons/wpn_third_upg_fl_ass_smg_sho_peqbox/wpn_third_upg_fl_ass_smg_sho_peqbox"
	self.parts.wpn_fps_upg_fl_pis_laser.third_unit = "units/payday2/weapons/wpn_third_upg_fl_pis_laser/wpn_third_upg_fl_pis_laser"
	self.parts.wpn_fps_upg_fl_pis_tlr1.third_unit = "units/payday2/weapons/wpn_third_upg_fl_pis_tlr1/wpn_third_upg_fl_pis_tlr1"
end

--Gage Weapon Pack #1
function WeaponFactoryTweakData:_init_content_dlc2()
	self.parts.wpn_fps_upg_i_singlefire = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "custom",
		sub_type = "singlefire",
		name_id = "bm_wp_upg_i_singlefire",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		stats = {
			value = 5,
			spread = 1,
			recoil = -2
		},
		perks = {
			"fire_mode_single"
		},
		internal_part = true,
		dlc = "gage_pack"
	}
	self.parts.wpn_fps_upg_i_autofire = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "custom",
		sub_type = "autofire",
		name_id = "bm_wp_upg_i_autofire",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		stats = {
			value = 8,
			damage = 1,
			spread = -1,
			recoil = 2,
			spread_moving = 2
		},
		perks = {
			"fire_mode_auto"
		},
		internal_part = true,
		dlc = "gage_pack"
	}
	self.parts.wpn_fps_upg_m4_g_hgrip = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_upg_m4_g_hgrip",
		a_obj = "a_g",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_upg_m4_g_hgrip/wpn_fps_upg_m4_g_hgrip",
		stats = {
			value = 2,
			spread_moving = 2,
			--removed recoil = 1,
			spread = 1
		},
		dlc = "gage_pack",
		texture_bundle_folder = "gage_pack"
	}
	self.parts.wpn_fps_upg_m4_g_hgrip.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_upg_m4_g_hgrip/wpn_third_upg_m4_g_hgrip"
	self.parts.wpn_fps_upg_m4_g_mgrip = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_upg_m4_g_mgrip",
		a_obj = "a_g",
		unit = "units/pd2_dlc_dec5/weapons/wpn_fps_upg_m4_g_mgrip/wpn_fps_upg_m4_g_mgrip",
		stats = {
			value = 2,
			spread_moving = 2,
			concealment = 2
		},
		dlc = "gage_pack",
		texture_bundle_folder = "gage_pack"
	}
	self.parts.wpn_fps_upg_m4_g_mgrip.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_upg_m4_g_mgrip/wpn_third_upg_m4_g_mgrip"
	self.parts.wpn_fps_upg_m4_g_hgrip_vanilla = deep_clone(self.parts.wpn_fps_upg_m4_g_hgrip)
	self.parts.wpn_fps_upg_m4_g_hgrip_vanilla.stats = nil
	self.parts.wpn_fps_upg_m4_g_hgrip_vanilla.pcs = nil
end

--Gage mod curior pack
function WeaponFactoryTweakData:_init_content_jobs()
	self.parts.wpn_fps_pis_rage_o_adapter = {
		a_obj = "a_o",
		texture_bundle_folder = "gage_pack_jobs",
		type = "extra",
		name_id = "bm_wp_pis_rage_o_adapter",
		unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_o_adapter"
	}
	self.parts.wpn_fps_pis_rage_extra = {
		name_id = "bm_wp_pis_rage_extra",
		texture_bundle_folder = "gage_pack_jobs",
		type = "extra",
		a_obj = "a_o",
		dlc = "gage_pack_jobs",
		internal_part = true,
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_pis_rage_extra/wpn_fps_pis_rage_extra",
		pcs = {},
		stats = {
			value = 2
		},
		override = {
			wpn_fps_pis_rage_body_smooth = {
				adds = {}
			},
			wpn_fps_pis_rage_body_standard = {
				adds = {}
			}
		}
	}
	self.parts.wpn_fps_pis_rage_lock = {
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_o",
		type = "extra",
		name_id = "bm_wp_pis_rage_extra",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_pis_rage_extra/wpn_fps_pis_rage_extra",
		stats = {
			value = 1
		},
		forbids = {
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
			"wpn_fps_upg_o_cs",
			"wpn_fps_upg_o_spot",
			"wpn_fps_upg_o_xpsg33_magnifier"
		}
	}
	self.parts.wpn_fps_pis_deagle_extra = {
		name_id = "bm_wp_pis_deagle_extra",
		texture_bundle_folder = "gage_pack_jobs",
		type = "extra",
		a_obj = "a_quite",
		dlc = "gage_pack_jobs",
		internal_part = true,
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_pis_deagle_extra/wpn_fps_pis_deagle_extra",
		pcs = {},
		stats = {
			value = 2
		},
		override = {
			wpn_fps_pis_deagle_body_standard = {
				adds = {}
			},
			wpn_fps_pis_rage_o_adapter = {
				a_obj = "a_quite"
			}
		}
	}
	self.parts.wpn_fps_pis_deagle_lock = {
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_quite",
		type = "extra",
		name_id = "bm_wp_pis_rage_extra",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_pis_rage_extra/wpn_fps_pis_rage_extra",
		stats = {
			value = 1
		},
		forbids = {
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
			"wpn_fps_upg_o_cs",
			"wpn_fps_upg_o_spot",
			"wpn_fps_upg_o_xpsg33_magnifier"
		}
	}
	self.parts.wpn_fps_pis_rage_o_adapter.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_o_adapter"
	self.parts.wpn_fps_m4_upg_b_sd_smr = {
		texture_bundle_folder = "gage_pack_jobs",
		parent = "barrel",
		type = "barrel",
		name_id = "bm_wp_m4_upg_b_sd_smr",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_smr/wpn_fps_m4_upg_b_sd_smr",
		a_obj = "a_b",
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_upg_fg_jp = {
		texture_bundle_folder = "gage_pack_jobs",
		dlc = "gage_pack_jobs",
		type = "foregrip",
		name_id = "bm_wp_upg_fg_jp",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_jp/wpn_fps_upg_fg_jp",
		pcs = {},
		stats = {
			concealment = 2,
			value = 5,
			damage = 1,
			recoil = -3,
			spread = 2,
			spread_moving = 2
		}
	}
	self.parts.wpn_fps_upg_fg_smr = {
		type = "foregrip",
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_fg",
		dlc = "gage_pack_jobs",
		name_id = "bm_wp_upg_fg_smr",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_smr/wpn_fps_upg_fg_smr",
		pcs = {},
		stats = {
			concealment = -2,
			value = 5,
			damage = 2,
			recoil = 1,
			spread = -1,
			spread_moving = -2
		},
		override = {
			wpn_fps_m4_uupg_b_sd = {
				third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_smr/wpn_third_m4_upg_b_sd_smr",
				unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_smr/wpn_fps_m4_upg_b_sd_smr"
			}
		}
	}
--Quadstack mag M4
	self.parts.wpn_fps_upg_m4_m_quad = {
		type = "magazine",
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_m",
		dlc = "gage_pack_jobs",
		name_id = "bm_wp_upg_m4_m_quad",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_m_quad/wpn_fps_upg_m4_m_quad",
		pcs = {},
		bullet_objects = {
			amount = 1,
			prefix = "g_bullet_"
		},
		stats = {
			extra_ammo = 15,
			value = 3,
			spread = -1,
			concealment = -3,
			spread_moving = -2
		}
	}
	self.parts.wpn_fps_m4_upg_b_sd_smr.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_smr/wpn_third_m4_upg_b_sd_smr"
	self.parts.wpn_fps_upg_fg_jp.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_jp/wpn_third_upg_fg_jp"
	self.parts.wpn_fps_upg_fg_smr.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_smr/wpn_third_upg_fg_smr"
	self.parts.wpn_fps_upg_m4_m_quad.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_m4_m_quad/wpn_third_upg_m4_m_quad"
	self.parts.wpn_fps_upg_ak_fg_tapco = {
		texture_bundle_folder = "gage_pack_jobs",
		dlc = "gage_pack_jobs",
		type = "foregrip",
		name_id = "bm_wp_upg_ak_fg_tapco",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_fg_tapco/wpn_fps_upg_ak_fg_tapco",
		pcs = {},
		stats = {
			value = 5,
			spread_moving = 1,
			concealment = 3,
			spread = 1
		}
	}
	self.parts.wpn_fps_upg_fg_midwest = {
		type = "foregrip",
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_fg",
		dlc = "gage_pack_jobs",
		name_id = "bm_wp_upg_fg_midwest",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_midwest/wpn_fps_upg_fg_midwest",
		pcs = {},
		stats = {
			spread_moving = -1,
			value = 5,
			spread = 1,
			concealment = -2,
			recoil = 3
		},
		forbids = {
			"wpn_fps_addon_ris"
		}
	}
	--AK Slavik Dragon Barrel
	self.parts.wpn_fps_upg_ak_b_draco = {
		type = "barrel",
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_b",
		dlc = "gage_pack_jobs",
		name_id = "bm_wp_upg_ak_b_draco",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_b_draco/wpn_fps_upg_ak_b_draco",
		pcs = {},
		stats = {
			value = 2,
			spread = -2,
			damage = 4, --2
			concealment = 2,
			recoil = 3, --added
			spread_moving = 2
		},
		override = {
			wpn_upg_ak_fg_combo3 = {
				unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_combo3_slavic"
			}
		}
	}
--quadstack AK
	self.parts.wpn_fps_upg_ak_m_quad = {
		type = "magazine",
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_m",
		dlc = "gage_pack_jobs",
		name_id = "bm_wp_upg_ak_m_quad",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_m_quad/wpn_fps_upg_ak_m_quad",
		pcs = {},
		bullet_objects = {
			amount = 1,
			prefix = "g_bullet_"
		},
		stats = {
			extra_ammo = 15,
			value = 3,
			spread = -1,
			concealment = -3,
			spread_moving = -2
		}
	}
	self.parts.wpn_fps_upg_ak_g_hgrip = {
		type = "grip",
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_g",
		dlc = "gage_pack_jobs",
		name_id = "bm_wp_upg_ak_g_hgrip",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_g_hgrip/wpn_fps_upg_ak_g_hgrip",
		pcs = {},
		stats = {
			value = 2,
			spread_moving = 2,
			recoil = 2,
			concealment = 2
		},
		forbids = {
			"wpn_upg_ak_g_standard"
		}
	}
	self.parts.wpn_fps_upg_ak_g_pgrip = {
		type = "grip",
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_g",
		dlc = "gage_pack_jobs",
		name_id = "bm_wp_upg_ak_g_pgrip",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_g_pgrip/wpn_fps_upg_ak_g_pgrip",
		pcs = {},
		stats = {
			value = 2,
			spread_moving = -2,
			recoil = -2,
			spread = 2
		},
		forbids = {
			"wpn_upg_ak_g_standard"
		}
	}
	self.parts.wpn_fps_upg_ak_g_wgrip = {
		type = "grip",
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_g",
		dlc = "gage_pack_jobs",
		name_id = "bm_wp_upg_ak_g_wgrip",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_g_wgrip/wpn_fps_upg_ak_g_wgrip",
		pcs = {},
		stats = {
			value = 2,
			spread_moving = 1,
			recoil = 3,
			concealment = -1
		},
		forbids = {
			"wpn_upg_ak_g_standard"
		}
	}
	self.parts.wpn_fps_upg_ak_fg_tapco.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_fg_tapco/wpn_third_upg_ak_fg_tapco"
	self.parts.wpn_fps_upg_fg_midwest.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_midwest/wpn_third_upg_fg_midwest"
	self.parts.wpn_fps_upg_ak_b_draco.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_b_draco/wpn_third_upg_ak_b_draco"
	self.parts.wpn_fps_upg_ak_m_quad.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_m_quad/wpn_third_upg_ak_m_quad"
	self.parts.wpn_fps_upg_ak_g_pgrip.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_g_pgrip/wpn_third_upg_ak_g_pgrip"
	self.parts.wpn_fps_upg_ak_g_wgrip.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_g_wgrip/wpn_third_upg_ak_g_wgrip"
	self.parts.wpn_fps_upg_ak_g_hgrip.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_g_hgrip/wpn_third_upg_ak_g_hgrip"
	self.parts.wpn_fps_upg_ass_ns_jprifles = {
		type = "barrel_ext",
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_ns",
		parent = "barrel",
		dlc = "gage_pack_jobs",
		name_id = "bm_wp_upg_ass_ns_jprifles",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_jprifles",
		pcs = {},
		stats = {
			spread = 1,
			concealment = -2,
			damage = 2,
			suppression = -1,
			value = 5,
			recoil = 3
		}
	}
	--Funnel of fun
	self.parts.wpn_fps_upg_ass_ns_linear = {
		type = "barrel_ext",
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_ns",
		parent = "barrel",
		dlc = "gage_pack_jobs",
		name_id = "bm_wp_upg_ass_ns_linear",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_linear",
		pcs = {},
		stats = {
			value = 5,
			concealment = -2,
			damage = 10,
			suppression = -5,
			spread = -3
		}
	}
	self.parts.wpn_fps_upg_ass_ns_surefire = {
		type = "barrel_ext",
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_ns",
		parent = "barrel",
		dlc = "gage_pack_jobs",
		name_id = "bm_wp_upg_ass_ns_surefire",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_surefire",
		pcs = {},
		stats = {
			spread = 3,
			concealment = -2,
			damage = 1,
			suppression = 0,
			value = 5,
			recoil = -1
		}
	}
	self.parts.wpn_fps_upg_pis_ns_flash = {
		type = "barrel_ext",
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_co",
		parent = "slide",
		dlc = "gage_pack_jobs",
		name_id = "bm_wp_upg_pis_ns_flash",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_pis_ns_flash",
		pcs = {},
		stats = {
			spread = -1,
			concealment = 0,
			damage = 2,
			suppression = 0,
			value = 4,
			recoil = 3
		}
	}
	self.parts.wpn_fps_upg_shot_ns_king = {
		type = "barrel_ext",
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_ns",
		parent = "barrel",
		dlc = "gage_pack_jobs",
		name_id = "bm_wp_upg_shot_ns_king",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_shot_ns_king",
		pcs = {},
		stats = {
			value = 5,
			concealment = -2,
			damage = 1,
			suppression = -5,
			spread = 3
		}
	}
	self.parts.wpn_fps_upg_ass_ns_jprifles.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_jprifles"
	self.parts.wpn_fps_upg_ass_ns_linear.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_linear"
	self.parts.wpn_fps_upg_ass_ns_surefire.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_surefire"
	self.parts.wpn_fps_upg_pis_ns_flash.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_pis_ns_flash"
	self.parts.wpn_fps_upg_shot_ns_king.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_shot_ns_king"
	self.parts.wpn_fps_upg_ns_pis_medium_slim = {
		sub_type = "silencer",
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_ns",
		type = "barrel_ext",
		dlc = "gage_pack_jobs",
		parent = "slide",
		name_id = "bm_wp_upg_ns_pis_medium_slim",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ns_pis_medium_slim/wpn_fps_upg_ns_pis_medium_slim",
		pcs = {},
		stats = {
			alert_size = 12,
			value = 1,
			spread_moving = 2,
			suppression = 12,
			spread = -2,
			recoil = -1,
			concealment = -2
		},
		perks = {
			"silencer"
		},
		sound_switch = {
			suppressed = "suppressed_b"
		},
		third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ns_pis_medium_slim/wpn_third_upg_ns_pis_medium_slim"
	}
	self.parts.wpn_fps_upg_fl_ass_peq15 = {
		type = "gadget",
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_fl",
		sub_type = "laser",
		dlc = "gage_pack_jobs",
		name_id = "bm_wp_upg_fl_ass_peq15",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fl_ass_peq15/wpn_fps_upg_fl_ass_peq15",
		pcs = {},
		stats = {
			value = 5,
			spread_moving = -1,
			concealment = -2,
			recoil = 1
		},
		perks = {
			"gadget"
		},
		adds = {
			"wpn_fps_addon_ris",
			"wpn_fps_upg_fl_ass_peq15_flashlight"
		}
	}
	self.parts.wpn_fps_upg_fl_ass_peq15_flashlight = {
		parent = "gadget",
		type = "extra",
		sub_type = "flashlight",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fl_ass_peq15/wpn_fps_upg_fl_ass_peq15_flashlight",
		a_obj = "a_fl",
		stats = {
			value = 1
		},
		perks = {
			"gadget"
		}
	}
	self.parts.wpn_fps_upg_fl_ass_laser = {
		type = "gadget",
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_fl",
		sub_type = "laser",
		dlc = "gage_pack_jobs",
		name_id = "bm_wp_upg_fl_ass_laser",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fl_ass_laser/wpn_fps_upg_fl_ass_laser",
		pcs = {},
		stats = {
			value = 2,
			spread_moving = 1,
			concealment = 0
		},
		perks = {
			"gadget"
		},
		adds = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_upg_fl_ass_peq15.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fl_ass_peq15/wpn_third_upg_fl_ass_peq15"
	self.parts.wpn_fps_upg_fl_ass_laser.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fl_ass_laser/wpn_third_upg_fl_ass_laser"
	self.parts.wpn_fps_upg_m4_s_crane = {
		type = "stock",
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_s",
		dlc = "gage_pack_jobs",
		name_id = "bm_wp_upg_m4_s_crane",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_fps_upg_m4_s_crane",
		pcs = {},
		stats = {
			value = 2,
			recoil = 1,
			concealment = 1,
			spread_moving = 1
		},
		adds_type = {
			"stock_adapter"
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special"
		}
	}
	self.parts.wpn_fps_upg_m4_s_mk46 = {
		type = "stock",
		texture_bundle_folder = "gage_pack_jobs",
		a_obj = "a_s",
		dlc = "gage_pack_jobs",
		name_id = "bm_wp_upg_m4_s_mk46",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_mk46/wpn_fps_upg_m4_s_mk46",
		pcs = {},
		stats = {
			recoil = -1,
			value = 6,
			spread = 2,
			concealment = -3,
			spread_moving = -3
		},
		adds_type = {
			"stock_adapter"
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special"
		}
	}
	self.parts.wpn_fps_upg_m4_s_crane.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_third_upg_m4_s_crane"
	self.parts.wpn_fps_upg_m4_s_mk46.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_mk46/wpn_third_upg_m4_s_mk46"
	self.parts.wpn_fps_upg_o_rmr = {
		type = "sight",
		texture_bundle_folder = "gage_pack_jobs",
		dlc = "gage_pack_jobs",
		a_obj = "a_rds",
		parent = "body",
		name_id = "bm_wp_upg_o_rmr",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_o_rmr/wpn_fps_upg_o_rmr",
		pcs = {},
		stats = {
			zoom = 3,
			spread = 1,
			concealment = -1,
			value = 6,
			spread_moving = -1
		},
		perks = {
			"scope"
		},
		stance_mod = {
			wpn_fps_pis_1911 = {
				translation = Vector3(0, 0, -0.45)
			},
			wpn_fps_pis_beretta = {
				translation = Vector3(0, 0, -0.4),
				rotation = Rotation(0, -0.5, 0)
			},
			wpn_fps_pis_deagle = {
				translation = Vector3(0, 0, -0.48),
				rotation = Rotation(0, -0.5, 0)
			},
			wpn_fps_pis_g17 = {
				translation = Vector3(0, 0, -0.85)
			},
			wpn_fps_pis_g18c = {
				translation = Vector3(0, 0, -0.45)
			},
			wpn_fps_pis_usp = {
				translation = Vector3(-0.015, 0, -0.34)
			},
			wpn_fps_pis_ppk = {
				translation = Vector3(0, 0, -1)
			},
			wpn_fps_pis_p226 = {
				translation = Vector3(0, 0, -0.6)
			},
			wpn_fps_pis_g22c = {
				translation = Vector3(0, 0, -0.45),
				rotation = Rotation(0, -0.3, 0)
			},
			wpn_fps_pis_g26 = {
				translation = Vector3(-0.01, 0, -0.35)
			},
			wpn_fps_pis_c96 = {
				translation = Vector3(0, 0, -1.2)
			},
			wpn_fps_pis_hs2000 = {
				translation = Vector3(0, 0, -0.75)
			},
			wpn_fps_bow_hunter = {
				translation = Vector3(0, 8, 0.8)
			},
			wpn_fps_pis_sparrow = {
				translation = Vector3(0, 0, -0.93)
			},
			wpn_fps_pis_pl14 = {
				translation = Vector3(0, 0, -0.85)
			},
			wpn_fps_pis_packrat = {
				translation = Vector3(0, 0, -1.15)
			},
			wpn_fps_pis_lemming = {
				translation = Vector3(0, 5, -0.75)
			},
			wpn_fps_pis_chinchilla = {
				translation = Vector3(0, 5, -0.75)
			},
			wpn_fps_pis_breech = {
				translation = Vector3(0, 5, -0.65)
			},
			wpn_fps_pis_shrew = {
				translation = Vector3(0, 5, -0.48)
			},
			wpn_fps_pis_legacy = {
				translation = Vector3(0, 5, -0.68)
			}
		},
		texture_switch = {
			material = "gfx_reddot",
			channel = "diffuse_texture"
		},
		material_parameters = deep_clone(self.parts.wpn_fps_upg_o_specter.material_parameters)
	}
	self.parts.wpn_fps_upg_o_eotech_xps = {
		type = "sight",
		texture_bundle_folder = "gage_pack_jobs",
		dlc = "gage_pack_jobs",
		a_obj = "a_o",
		name_id = "bm_wp_upg_o_eotech_xps",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_o_eotech_xps/wpn_fps_upg_o_eotech_xps",
		pcs = {},
		stats = {
			zoom = 3,
			recoil = 1,
			concealment = -2,
			value = 5,
			spread_moving = -1
		},
		perks = {
			"scope"
		},
		stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod),
		forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up"
		},
		texture_switch = {
			material = "gfx_reddot",
			channel = "diffuse_texture"
		},
		material_parameters = deep_clone(self.parts.wpn_fps_upg_o_specter.material_parameters)
	}
	self.parts.wpn_fps_upg_o_reflex = {
		type = "sight",
		texture_bundle_folder = "gage_pack_jobs",
		dlc = "gage_pack_jobs",
		a_obj = "a_o",
		name_id = "bm_wp_upg_o_reflex",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_o_reflex/wpn_fps_upg_o_reflex",
		pcs = {},
		stats = {
			zoom = 3,
			recoil = 1,
			concealment = -1,
			value = 5,
			spread_moving = -1
		},
		perks = {
			"scope"
		},
		stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod),
		forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up"
		},
		texture_switch = {
			material = "gfx_reddot",
			channel = "diffuse_texture"
		},
		material_parameters = deep_clone(self.parts.wpn_fps_upg_o_specter.material_parameters)
	}
	self.parts.wpn_fps_upg_o_rx01 = {
		type = "sight",
		texture_bundle_folder = "gage_pack_jobs",
		dlc = "gage_pack_jobs",
		a_obj = "a_o",
		name_id = "bm_wp_upg_o_rx01",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_o_rx01/wpn_fps_upg_o_rx01",
		pcs = {},
		stats = {
			zoom = 4,
			recoil = 1,
			concealment = -1,
			value = 5,
			spread_moving = -1
		},
		perks = {
			"scope"
		},
		stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod),
		forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up"
		},
		texture_switch = {
			material = "gfx_reddot",
			channel = "diffuse_texture"
		},
		material_parameters = deep_clone(self.parts.wpn_fps_upg_o_specter.material_parameters)
	}
	self.parts.wpn_fps_upg_o_rx30 = {
		type = "sight",
		texture_bundle_folder = "gage_pack_jobs",
		dlc = "gage_pack_jobs",
		a_obj = "a_o",
		name_id = "bm_wp_upg_o_rx30",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_o_rx30/wpn_fps_upg_o_rx30",
		pcs = {},
		stats = {
			zoom = 4,
			recoil = 1,
			concealment = -2,
			value = 5,
			spread_moving = -1
		},
		perks = {
			"scope"
		},
		stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod),
		forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up"
		},
		texture_switch = {
			material = "gfx_reddot",
			channel = "diffuse_texture"
		},
		material_parameters = deep_clone(self.parts.wpn_fps_upg_o_specter.material_parameters)
	}
	self.parts.wpn_fps_upg_o_cs = {
		type = "sight",
		texture_bundle_folder = "gage_pack_jobs",
		dlc = "gage_pack_jobs",
		a_obj = "a_o",
		reticle_obj = "g_reddot",
		name_id = "bm_wp_upg_o_cs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_o_cs/wpn_fps_upg_o_cs",
		pcs = {},
		stats = {
			zoom = 3,
			recoil = 1,
			concealment = -1,
			value = 3,
			spread_moving = -1
		},
		perks = {
			"scope"
		},
		stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod),
		forbids = {
			"wpn_fps_amcar_uupg_body_upperreciever",
			"wpn_fps_ass_m16_os_frontsight",
			"wpn_fps_ass_scar_o_flipups_up",
			"wpn_fps_upg_o_xpsg33_magnifier"
		},
		texture_switch = {
			channel = "diffuse_texture",
			material = {
				"gfx_reddot",
				"screen"
			}
		},
		visibility = {
			{
				condition = function (self, part, npc)
					return _G.IS_VR and not npc
				end,
				objects = {
					g_vr_lens = true,
					g_screen = true,
					g_vr_gfx_lens = true,
					g_reddot = false
				}
			}
		},
		camera = {
			a_camera = "a_camera",
			material = "screen",
			fov = 13,
			a_screen = "g_screen",
			channel = "macrodetail_diffuse_texture"
		}
	}
	self.parts.wpn_fps_upg_o_rmr.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_o_rmr/wpn_third_upg_o_rmr"
	self.parts.wpn_fps_upg_o_eotech_xps.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_o_eotech_xps/wpn_third_upg_o_eotech_xps"
	self.parts.wpn_fps_upg_o_reflex.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_o_reflex/wpn_third_upg_o_reflex"
	self.parts.wpn_fps_upg_o_rx01.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_o_rx01/wpn_third_upg_o_rx01"
	self.parts.wpn_fps_upg_o_rx30.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_o_rx30/wpn_third_upg_o_rx30"
	self.parts.wpn_fps_upg_o_cs.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_o_cs/wpn_third_upg_o_cs"
end

--AK/Car PACK
function WeaponFactoryTweakData:_init_modpack_m4_ak()
	self.parts.wpn_fps_upg_ass_ak_b_zastava = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_upg_ass_ak_b_zastava",
		a_obj = "a_b",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_ak_b_zastava/wpn_fps_upg_ass_ak_b_zastava",
		stats = {
			value = 1,
			spread = 2,
			recoil = -3,
			total_ammo_mod = -6,
			damage = 80,
			concealment = -4
		},
		custom_stats = {ammo_pickup_min_mul = 0.5, ammo_pickup_max_mul = 0.5},
		sound_switch = {suppressed = "regular_b"},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_upg_ak_b_ak105 = {
		pcs = {},
		type = "barrel",
		name_id = "bm_wp_upg_ak_b_ak105",
		a_obj = "a_b",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_b_ak105/wpn_fps_upg_ak_b_ak105",
		stats = {
			value = 1,
			damage = 2,
			concealment = 1
		},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true,
		adds = {
			"wpn_fps_upg_ak_ns_ak105"
		},
		override = {
			wpn_fps_upg_ns_ass_smg_large = {
				forbids = {
					"wpn_fps_upg_ak_ns_ak105"
				}
			},
			wpn_fps_upg_ns_ass_smg_medium = {
				forbids = {
					"wpn_fps_upg_ak_ns_ak105"
				}
			},
			wpn_fps_upg_ns_ass_smg_small = {
				forbids = {
					"wpn_fps_upg_ak_ns_ak105"
				}
			},
			wpn_fps_upg_ns_ass_smg_firepig = {
				forbids = {
					"wpn_fps_upg_ak_ns_ak105"
				}
			},
			wpn_fps_upg_ns_ass_smg_stubby = {
				forbids = {
					"wpn_fps_upg_ak_ns_ak105"
				}
			},
			wpn_fps_upg_ns_ass_smg_tank = {
				forbids = {
					"wpn_fps_upg_ak_ns_ak105"
				}
			},
			wpn_fps_upg_ass_ns_jprifles = {
				forbids = {
					"wpn_fps_upg_ak_ns_ak105"
				}
			},
			wpn_fps_upg_ass_ns_linear = {
				forbids = {
					"wpn_fps_upg_ak_ns_ak105"
				}
			},
			wpn_fps_upg_ass_ns_surefire = {
				forbids = {
					"wpn_fps_upg_ak_ns_ak105"
				}
			},
			wpn_fps_upg_ass_ns_battle = {
				forbids = {
					"wpn_fps_upg_ak_ns_ak105"
				}
			},
			wpn_fps_upg_ns_ass_pbs1 = {
				forbids = {
					"wpn_fps_upg_ak_ns_ak105"
				}
			}
		}
	}
	self.parts.wpn_fps_upg_ak_ns_ak105 = {
		type = "barrel_ext",
		name_id = "bm_wp_upg_ak_ns_ak105",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_b_ak105/wpn_fps_upg_ak_ns_ak105",
		stats = {value = 1},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack"
	}
	--Crabs Rail
	self.parts.wpn_fps_upg_ak_fg_krebs = {
		pcs = {},
		type = "foregrip",
		name_id = "bm_wp_upg_ak_fg_krebs",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_fg_krebs/wpn_fps_upg_ak_fg_krebs",
		stats = {
			value = 1,
			spread = -2, --2,
			recoil = 3,
			concealment = -1
		},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true,
		forbids = {
			"wpn_fps_ak_extra_ris",
			"wpn_fps_addon_ris"
		},
		override = {
			wpn_fps_upg_o_specter = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_aimpoint = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_aimpoint_2 = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_docter = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_eotech = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_t1micro = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_cmore = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_acog = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 6, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 6, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 6, -3.8)
					}
				}
			},
			wpn_fps_upg_o_cs = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_eotech_xps = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_reflex = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_rx01 = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_rx30 = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			}
		}
	}
	--Keymod Rail
	self.parts.wpn_fps_upg_ak_fg_trax = {
		pcs = {},
		type = "foregrip",
		name_id = "bm_wp_upg_ak_fg_trax",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_fg_trax/wpn_fps_upg_ak_fg_trax",
		stats = {
			value = 1,
			spread = 2,
			recoil = -3, --2,
			concealment = -2
		},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true,
		forbids = {
			"wpn_fps_ak_extra_ris",
			"wpn_fps_addon_ris"
		},
		override = {
			wpn_fps_upg_o_specter = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_aimpoint = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_aimpoint_2 = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_docter = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_eotech = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_t1micro = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_cmore = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_acog = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 6, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 6, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 6, -3.8)
					}
				}
			},
			wpn_fps_upg_o_cs = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_eotech_xps = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_reflex = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_rx01 = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			},
			wpn_fps_upg_o_rx30 = {
				a_obj = "a_o_krebs",
				stance_mod = {
					wpn_fps_ass_74 = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm = {
						translation = Vector3(0, 0, -3.8)
					},
					wpn_fps_ass_akm_gold = {
						translation = Vector3(0, 0, -3.8)
					}
				}
			}
		}
	}
	self.parts.wpn_fps_upg_ak_fg_zenit = {
		pcs = {},
		type = "foregrip",
		name_id = "bm_wp_upg_ak_fg_zenit",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_fg_zenit/wpn_fps_upg_ak_fg_zenit",
		stats = {value = 1, recoil = 1},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true,
		forbids = {
			"wpn_fps_ak_extra_ris",
			"wpn_fps_addon_ris"
		},
		override = {
			wpn_fps_upg_o_specter = {
				a_obj = "a_o_zenit",
				stance_mod = {
					wpn_fps_smg_akmsu = {
						translation = Vector3(0, 0, -3.3)
					}
				}
			},
			wpn_fps_upg_o_aimpoint = {
				a_obj = "a_o_zenit",
				stance_mod = {
					wpn_fps_smg_akmsu = {
						translation = Vector3(0, 0, -3.3)
					}
				}
			},
			wpn_fps_upg_o_aimpoint_2 = {
				a_obj = "a_o_zenit",
				stance_mod = {
					wpn_fps_smg_akmsu = {
						translation = Vector3(0, 0, -3.3)
					}
				}
			},
			wpn_fps_upg_o_docter = {
				a_obj = "a_o_zenit",
				stance_mod = {
					wpn_fps_smg_akmsu = {
						translation = Vector3(0, 0, -3.3)
					}
				}
			},
			wpn_fps_upg_o_eotech = {
				a_obj = "a_o_zenit",
				stance_mod = {
					wpn_fps_smg_akmsu = {
						translation = Vector3(0, 0, -3.3)
					}
				}
			},
			wpn_fps_upg_o_t1micro = {
				a_obj = "a_o_zenit",
				stance_mod = {
					wpn_fps_smg_akmsu = {
						translation = Vector3(0, 0, -3.3)
					}
				}
			},
			wpn_fps_upg_o_cmore = {
				a_obj = "a_o_zenit",
				stance_mod = {
					wpn_fps_smg_akmsu = {
						translation = Vector3(0, 0, -3.3)
					}
				}
			},
			wpn_fps_upg_o_acog = {
				a_obj = "a_o_zenit",
				stance_mod = {
					wpn_fps_smg_akmsu = {
						translation = Vector3(0, 6, -3.3)
					}
				}
			},
			wpn_fps_upg_o_cs = {
				a_obj = "a_o_zenit",
				stance_mod = {
					wpn_fps_smg_akmsu = {
						translation = Vector3(0, 0, -3.3)
					}
				}
			},
			wpn_fps_upg_o_eotech_xps = {
				a_obj = "a_o_zenit",
				stance_mod = {
					wpn_fps_smg_akmsu = {
						translation = Vector3(0, 0, -3.3)
					}
				}
			},
			wpn_fps_upg_o_reflex = {
				a_obj = "a_o_zenit",
				stance_mod = {
					wpn_fps_smg_akmsu = {
						translation = Vector3(0, 0, -3.3)
					}
				}
			},
			wpn_fps_upg_o_rx01 = {
				a_obj = "a_o_zenit",
				stance_mod = {
					wpn_fps_smg_akmsu = {
						translation = Vector3(0, 0, -3.3)
					}
				}
			},
			wpn_fps_upg_o_rx30 = {
				a_obj = "a_o_zenit",
				stance_mod = {
					wpn_fps_smg_akmsu = {
						translation = Vector3(0, 0, -3.3)
					}
				}
			}
		}
	}
	self.parts.wpn_fps_upg_ak_g_rk3 = {
		pcs = {},
		type = "grip",
		name_id = "bm_wp_upg_ak_g_rk3",
		a_obj = "a_g",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_g_rk3/wpn_fps_upg_ak_g_rk3",
		stats = {
			value = 1,
			spread = 1,
			concealment = 1
		},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		forbids = {
			"wpn_upg_ak_g_standard"
		},
		is_a_unlockable = true
	}
	self.parts.wpn_fps_upg_ak_m_uspalm = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_upg_ak_m_uspalm",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_m_uspalm/wpn_fps_upg_ak_m_uspalm",
		stats = {
			value = 1,
			recoil = 1,
			concealment = 1,
			extra_ammo = 2
		},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_upg_ak_s_solidstock = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_upg_ak_s_solidstock",
		a_obj = "a_s",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_s_solidstock/wpn_fps_upg_ak_s_solidstock",
		stats = {
			value = 1,
			recoil = 3,
			concealment = -4,
			spread = 1
		},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true,
		adds = {
			"wpn_upg_ak_g_standard"
		}
	}
	self.parts.wpn_fps_upg_ns_ass_pbs1 = {
		pcs = {},
		type = "barrel_ext",
		sub_type = "silencer",
		name_id = "bm_wp_upg_ns_ass_pbs1",
		a_obj = "a_ns",
		parent = "barrel",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ns_ass_pbs1/wpn_fps_upg_ns_ass_pbs1",
		stats = {
			value = 1,
			suppression = 12,
			alert_size = 12,
			recoil = 1,
			spread = 0,
			concealment = -5,
			damage = 0
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_b"
		},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true
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
				}
			}
		}
	}
	--OVAL Foregrip
	self.parts.wpn_fps_upg_ass_m4_fg_lvoa = {
		pcs = {},
		type = "foregrip",
		name_id = "bm_wp_upg_ass_m4_fg_lvoa",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_lvoa/wpn_fps_upg_ass_m4_fg_lvoa",
		stats = {
			value = 1,
			spread = -2,
			recoil = 3,
			damage = 2
		},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true
	}
	--E.M.O. Foregrip
	self.parts.wpn_fps_upg_ass_m4_fg_moe = {
		pcs = {},
		type = "foregrip",
		name_id = "bm_wp_upg_ass_m4_fg_moe",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_moe/wpn_fps_upg_ass_m4_fg_moe",
		stats = {
			value = 1,
			spread = 1,
			recoil = 2,
			concealment = -1, --2,
			damage = 1
		},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true,
		override = {
			wpn_fps_m4_uupg_o_flipup = {
				unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_o_flipup_emo",
				third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_o_flipup_emo"
			}
		}
	}
	self.parts.wpn_fps_upg_ass_m16_fg_stag = {
		pcs = {},
		type = "foregrip",
		name_id = "bm_wp_upg_ass_m16_fg_stag",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m16_fg_stag/wpn_fps_upg_ass_m16_fg_stag",
		stats = {
			value = 1,
			recoil = 2,
			concealment = -3
		},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true,
		override = {
			wpn_fps_ass_m16_os_frontsight = {a_obj = "a_os_stag"}
		}
	}
	self.parts.wpn_fps_upg_smg_olympic_fg_lr300 = {
		pcs = {},
		type = "foregrip",
		name_id = "bm_wp_upg_smg_olympic_fg_lr300",
		a_obj = "a_fg",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_smg_olympic_fg_lr300/wpn_fps_upg_smg_olympic_fg_lr300",
		stats = {value = 1, recoil = 2},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos = {
		pcs = {},
		type = "upper_reciever",
		name_id = "bm_wp_upg_ass_m4_upper_reciever_ballos",
		a_obj = "a_body",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_upper_reciever_ballos/wpn_fps_upg_ass_m4_upper_reciever_ballos",
		stats = {
			value = 1,
			spread = 1,
			recoil = 2
		},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true,
		override = {
			wpn_fps_m4_uupg_draghandle = {
				unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_m4_uupg_draghandle_ballos/wpn_fps_m4_uupg_draghandle_ballos"
			}
		}
	}
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_core = {
		pcs = {},
		type = "upper_reciever",
		name_id = "bm_wp_upg_ass_m4_upper_reciever_core",
		a_obj = "a_body",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_upper_reciever_core/wpn_fps_upg_ass_m4_upper_reciever_core",
		stats = {
			value = 1,
			spread = -2,
			damage = 2
		},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true,
		override = {
			wpn_fps_m4_uupg_draghandle = {
				unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_m4_uupg_draghandle_core/wpn_fps_m4_uupg_draghandle_core"
			}
		}
	}
	self.parts.wpn_fps_m4_uupg_draghandle_ballos = {
		type = "drag_handle",
		name_id = "bm_wp_m4_uupg_draghandle",
		a_obj = "a_dh",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_m4_uupg_draghandle_ballos/wpn_fps_m4_uupg_draghandle_ballos",
		stats = {value = 1}
	}
	self.parts.wpn_fps_m4_uupg_draghandle_core = {
		type = "drag_handle",
		name_id = "bm_wp_m4_uupg_draghandle",
		a_obj = "a_dh",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_m4_uupg_draghandle_core/wpn_fps_m4_uupg_draghandle_core",
		stats = {value = 1}
	}
	--THRUST Lower Reciever
	self.parts.wpn_fps_upg_ass_m4_lower_reciever_core = {
		pcs = {},
		type = "lower_reciever",
		name_id = "bm_wp_upg_ass_m4_lower_reciever_core",
		a_obj = "a_body",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_lower_reciever_core/wpn_fps_upg_ass_m4_lower_reciever_core",
		stats = {
			value = 1, 
			damage = 2,
			spread = -1,
			recoil = -1
			},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true
	}
	--L5 Magazine
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
			spread = 1 --was recoil
		},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true
	}
	self.parts.wpn_fps_upg_m4_s_ubr = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_upg_m4_s_ubr",
		a_obj = "a_s",
		unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_s_ubr/wpn_fps_upg_m4_s_ubr",
		stats = {
			value = 1,
			spread = 1,
			recoil = 1,
			concealment = -2
		},
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack",
		is_a_unlockable = true,
		adds_type = {
			"stock_adapter"
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special"
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
			recoil = -10,
			total_ammo_mod = -12,
			damage = 120,
			concealment = -4
		},
		custom_stats = {ammo_pickup_min_mul = 0.5, ammo_pickup_max_mul = 0.5},
		sound_switch = {suppressed = "regular_b"},
		is_a_unlockable = true,
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack"
	}
	self.parts.wpn_fps_upg_ass_ak_b_zastava.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_ak_b_zastava/wpn_third_upg_ass_ak_b_zastava"
	self.parts.wpn_fps_upg_ak_b_ak105.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_b_ak105/wpn_third_upg_ak_b_ak105"
	self.parts.wpn_fps_upg_ak_ns_ak105.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_b_ak105/wpn_third_upg_ak_ns_ak105"
	self.parts.wpn_fps_upg_ak_fg_krebs.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_fg_krebs/wpn_third_upg_ak_fg_krebs"
	self.parts.wpn_fps_upg_ak_fg_trax.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_fg_trax/wpn_third_upg_ak_fg_trax"
	self.parts.wpn_fps_upg_ak_fg_zenit.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_fg_zenit/wpn_third_upg_ak_fg_zenit"
	self.parts.wpn_fps_upg_ak_g_rk3.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_g_rk3/wpn_third_upg_ak_g_rk3"
	self.parts.wpn_fps_upg_ak_m_uspalm.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_m_uspalm/wpn_third_upg_ak_m_uspalm"
	self.parts.wpn_fps_upg_ak_s_solidstock.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_s_solidstock/wpn_third_upg_ak_s_solidstock"
	self.parts.wpn_fps_upg_ns_ass_pbs1.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ns_ass_pbs1/wpn_third_upg_ns_ass_pbs1"
	self.parts.wpn_fps_upg_o_ak_scopemount.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_o_ak_scopemount/wpn_third_upg_o_ak_scopemount"
	self.parts.wpn_fps_upg_ass_m4_fg_lvoa.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_lvoa/wpn_third_upg_ass_m4_fg_lvoa"
	self.parts.wpn_fps_upg_ass_m4_fg_moe.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_moe/wpn_third_upg_ass_m4_fg_moe"
	self.parts.wpn_fps_upg_ass_m16_fg_stag.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m16_fg_stag/wpn_third_upg_ass_m16_fg_stag"
	self.parts.wpn_fps_upg_smg_olympic_fg_lr300.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_smg_olympic_fg_lr300/wpn_third_upg_smg_olympic_fg_lr300"
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_upper_reciever_ballos/wpn_third_upg_ass_m4_upper_reciever_ballos"
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_upper_reciever_core/wpn_third_upg_ass_m4_upper_reciever_core"
	self.parts.wpn_fps_m4_uupg_draghandle_ballos.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_m4_uupg_draghandle_ballos/wpn_third_m4_uupg_draghandle_ballos"
	self.parts.wpn_fps_m4_uupg_draghandle_core.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_m4_uupg_draghandle_core/wpn_third_m4_uupg_draghandle_core"
	self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_lower_reciever_core/wpn_third_upg_ass_m4_lower_reciever_core"
	self.parts.wpn_fps_upg_m4_m_l5.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_m_l5/wpn_third_upg_m4_m_l5"
	self.parts.wpn_fps_upg_m4_s_ubr.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_s_ubr/wpn_third_upg_m4_s_ubr"
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_b_beowulf/wpn_third_upg_ass_m4_b_beowulf"
end

--Vanilla M4 
function WeaponFactoryTweakData:_init_m4()
	self.parts.wpn_fps_m4_lower_reciever = {
		type = "lower_reciever",
		name_id = "bm_wp_m4_lower_reciever",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_lower_reciever",
		stats = {value = 1}
	}
	self.parts.wpn_fps_m4_upper_reciever_edge = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "upper_reciever",
		name_id = "bm_wp_m4_upper_reciever_edge",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_edge",
		stats = {
			value = 3,
			damage = 1,
			recoil = 1
		},
		animations = {reload = "reload"}
	}
	self.parts.wpn_fps_m4_upper_reciever_round = {
		type = "upper_reciever",
		name_id = "bm_wp_m4_upper_reciever_round",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round",
		stats = {value = 1},
		animations = {reload = "reload"}
	}
	--Long Barrel
	self.parts.wpn_fps_m4_uupg_b_long = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_m4_uupg_b_long",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_long",
		stats = {
			value = 4,
			damage = 2,
			spread = 1,
			recoil = -2, --added
			spread_moving = -3,
			concealment = -2
		}
	}
	--Short Barrel
	self.parts.wpn_fps_m4_uupg_b_short = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_m4_uupg_b_short",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_short",
		stats = {
			value = 5,
			spread = -1,
			spread_moving = 2,
			recoil = 1, --added
			damage = 4, --added
			concealment = 2
		}
	}
	self.parts.wpn_fps_m4_uupg_b_medium = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "barrel",
		name_id = "bm_wp_m4_uupg_b_medium",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_medium",
		stats = {
			value = 1,
			spread = 1,
			concealment = -1
		}
	}
	self.parts.wpn_fps_m4_uupg_b_sd = {
		pcs = {
			20,
			30,
			40
		},
		type = "barrel",
		sub_type = "silencer",
		name_id = "bm_wp_m4_uupg_b_sd",
		a_obj = "a_b",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_sd",
		stats = {
			value = 6,
			suppression = 12,
			alert_size = 12,
			spread = -1,
			damage = -2,
			recoil = 1,
			spread_moving = 1,
			concealment = 1
		},
		perks = {"silencer"},
		sound_switch = {
			suppressed = "suppressed_c"
		},
		forbids = {
			"wpn_fps_m4_uupg_fg_rail_ext",
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
	--Aftermarket Special Handguard
	self.parts.wpn_fps_m4_uupg_fg_lr300 = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "foregrip",
		name_id = "bm_wp_m4_uupg_fg_lr300",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_lr300",
		stats = {
			value = 5,
			spread_moving = 1,
			concealment = -2,
			damage = 1, --added
			spread = 2, --added
			recoil = 1
		}
	}
	self.parts.wpn_fps_m4_uupg_fg_rail = {
		type = "foregrip",
		name_id = "bm_wp_m4_uupg_fg_rail",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail",
		stats = {value = 1},
		adds = {
			"wpn_fps_m4_uupg_fg_rail_ext"
		},
		forbids = {
			"wpn_fps_addon_ris"
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
		}
	}
	self.parts.wpn_fps_m4_uupg_s_fold = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_m4_uupg_s_fold",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_s_fold",
		stats = {
			value = 5,
			recoil = -1,
			concealment = 3,
			spread_moving = 2
		}
	}
	self.parts.wpn_fps_m4_uupg_o_flipup = {
		type = "sight",
		name_id = "bm_wp_m4_uupg_o_flipup",
		a_obj = "a_o",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_o_flipup",
		stats = {value = 1}
	}
	self.parts.wpn_fps_m4_uupg_draghandle = {
		type = "drag_handle",
		name_id = "bm_wp_m4_uupg_draghandle",
		a_obj = "a_dh",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_draghandle",
		stats = {value = 1}
	}
	self.parts.wpn_fps_m4_uupg_fg_rail_ext = {
		type = "foregrip_ext",
		name_id = "bm_wp_m4_uupg_fg_rail_ext",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail_ext",
		stats = {value = 1}
	}
	self.parts.wpn_fps_upg_m4_g_standard = {
		type = "grip",
		name_id = "bm_wp_m4_g_standard",
		a_obj = "a_g",
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_standard",
		stats = {value = 1}
	}
	self.parts.wpn_fps_upg_m4_g_ergo = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_m4_g_ergo",
		a_obj = "a_g",
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_ergo",
		stats = {
			value = 2,
			spread_moving = 2,
			recoil = 1
		}
	}
	self.parts.wpn_fps_upg_m4_g_sniper = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "grip",
		name_id = "bm_wp_m4_g_sniper",
		a_obj = "a_g",
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_sniper",
		stats = {
			value = 6,
			spread = 1,
			recoil = 1,
			spread_moving = -2,
			concealment = -1
		}
	}
	self.parts.wpn_fps_upg_m4_m_drum = {
		type = "magazine",
		name_id = "bm_wp_m4_m_drum",
		a_obj = "a_m",
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_drum",
		stats = {
			value = 9,
			extra_ammo = 20,
			concealment = -5
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
		}
	}
	self.parts.wpn_fps_upg_m4_m_straight = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "magazine",
		name_id = "bm_wp_m4_m_straight",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 2},
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_straight",
		stats = {
			value = 2,
			spread_moving = 2,
			concealment = 1,
			extra_ammo = -4
		}
	}
	self.parts.wpn_fps_upg_m4_s_standard = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_m4_s_standard",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard",
		stats = {
			value = 1,
			spread_moving = -1,
			concealment = -1,
			spread = -1, --added
			recoil = 2
		},
		adds_type = {
			"stock_adapter"
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special"
		}
	}
	--Tactical Stock
	self.parts.wpn_fps_upg_m4_s_pts = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "stock",
		name_id = "bm_wp_m4_s_pts",
		a_obj = "a_s",
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_pts",
		stats = {
			value = 3,
			spread_moving = 1,
			recoil = 0, --1,
			spread = 1, --added
			concealment = 1
		},
		adds_type = {
			"stock_adapter"
		},
		forbids = {
			"wpn_fps_shot_r870_ris_special"
		}
	}
self.parts.wpn_fps_upg_m4_s_adapter = {
		a_obj = "a_s",
		type = "stock_adapter",
		name_id = "bm_wp_m4_s_adapter",
		unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_adapter",
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_m4_lower_reciever.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_lower_reciever"
	self.parts.wpn_fps_m4_upper_reciever_edge.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_edge"
	self.parts.wpn_fps_m4_upper_reciever_round.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_round"
	self.parts.wpn_fps_m4_uupg_b_long.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_long"
	self.parts.wpn_fps_m4_uupg_b_short.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_short"
	self.parts.wpn_fps_m4_uupg_b_medium.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_medium"
	self.parts.wpn_fps_m4_uupg_b_sd.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_sd"
	self.parts.wpn_fps_m4_uupg_draghandle.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_draghandle"
	self.parts.wpn_fps_m4_uupg_fg_lr300.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_lr300"
	self.parts.wpn_fps_m4_uupg_fg_rail.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail"
	self.parts.wpn_fps_m4_uupg_fg_rail_ext.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail_ext"
	self.parts.wpn_fps_m4_uupg_m_std.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_m_std"
	self.parts.wpn_fps_m4_uupg_o_flipup.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_o_flipup"
	self.parts.wpn_fps_m4_uupg_s_fold.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_s_fold"
	self.parts.wpn_fps_upg_m4_g_ergo.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_ergo"
	self.parts.wpn_fps_upg_m4_g_sniper.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_sniper"
	self.parts.wpn_fps_upg_m4_g_standard.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_standard"
	self.parts.wpn_fps_upg_m4_m_drum.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_drum"
	self.parts.wpn_fps_upg_m4_m_pmag.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_pmag"
	self.parts.wpn_fps_upg_m4_m_straight.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_straight"
	self.parts.wpn_fps_upg_m4_s_adapter.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_adapter"
	self.parts.wpn_fps_upg_m4_s_pts.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_pts"
	self.parts.wpn_fps_upg_m4_s_standard.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard"
	self.parts.wpn_fps_m4_upper_reciever_round_vanilla = deep_clone(self.parts.wpn_fps_m4_upper_reciever_round)
	self.parts.wpn_fps_m4_upper_reciever_round_vanilla.stats = nil
	self.parts.wpn_fps_m4_upper_reciever_round_vanilla.pcs = nil
	self.parts.wpn_fps_m4_uupg_draghandle_vanilla = deep_clone(self.parts.wpn_fps_m4_uupg_draghandle)
	self.parts.wpn_fps_m4_uupg_draghandle_vanilla.stats = nil
	self.parts.wpn_fps_m4_uupg_draghandle_vanilla.pcs = nil
	self.parts.wpn_fps_m4_uupg_m_std_vanilla = deep_clone(self.parts.wpn_fps_m4_uupg_m_std)
	self.parts.wpn_fps_m4_uupg_m_std_vanilla.stats = nil
	self.parts.wpn_fps_m4_uupg_m_std_vanilla.pcs = nil
	self.parts.wpn_fps_upg_m4_m_straight_vanilla = deep_clone(self.parts.wpn_fps_upg_m4_m_straight)
	self.parts.wpn_fps_upg_m4_m_straight_vanilla.stats = nil
	self.parts.wpn_fps_upg_m4_m_straight_vanilla.pcs = nil
	self.parts.wpn_fps_upg_m4_s_standard_vanilla = deep_clone(self.parts.wpn_fps_upg_m4_s_standard)
	self.parts.wpn_fps_upg_m4_s_standard_vanilla.stats = nil
	self.parts.wpn_fps_upg_m4_s_standard_vanilla.pcs = nil
	self.parts.wpn_fps_upg_m4_g_standard_vanilla = deep_clone(self.parts.wpn_fps_upg_m4_g_standard)
	self.parts.wpn_fps_upg_m4_g_standard_vanilla.stats = nil
	self.parts.wpn_fps_upg_m4_g_standard_vanilla.pc = nil
	self.parts.wpn_fps_m4_uupg_b_medium_vanilla = deep_clone(self.parts.wpn_fps_m4_uupg_b_medium)
	self.parts.wpn_fps_m4_uupg_b_medium_vanilla.stats = nil
	self.parts.wpn_fps_m4_uupg_b_medium_vanilla.pcs = nil
	self.parts.wpn_fps_m4_uupg_b_short_vanilla = deep_clone(self.parts.wpn_fps_m4_uupg_b_short)
	self.parts.wpn_fps_m4_uupg_b_short_vanilla.stats = nil
	self.parts.wpn_fps_m4_uupg_b_short_vanilla.pcs = nil
	self.wpn_fps_ass_m4 = {
		optional_types = {
			"barrel_ext",
			"gadget",
			"vertical_grip"
		},
		unit = "units/payday2/weapons/wpn_fps_ass_m4/wpn_fps_ass_m4",
		stock_adapter = "wpn_fps_upg_m4_s_adapter",
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload_not_empty = "reload_not_empty",
			magazine_empty = "last_recoil"
		},
		default_blueprint = {
			"wpn_fps_upg_m4_g_standard_vanilla",
			"wpn_fps_m4_lower_reciever",
			"wpn_fps_m4_upper_reciever_round",
			"wpn_fps_m4_uupg_b_medium_vanilla",
			"wpn_fps_m4_uupg_fg_rail",
			"wpn_fps_m4_uupg_m_std_vanilla",
			"wpn_fps_upg_m4_s_standard_vanilla",
			"wpn_fps_m4_uupg_draghandle",
			"wpn_fps_m4_uupg_o_flipup",
			"wpn_fps_amcar_bolt_standard"
		},
		override = {
			wpn_fps_upg_ass_m4_b_beowulf = {
				a_obj = "a_b_beowulf"
			}
		},
		uses_parts = {
			"wpn_fps_m4_lower_reciever",
			"wpn_fps_m4_upper_reciever_edge",
			"wpn_fps_m4_upper_reciever_round",
			"wpn_fps_m4_uupg_b_long",
			"wpn_fps_m4_uupg_b_medium_vanilla",
			"wpn_fps_m4_uupg_b_short",
			"wpn_fps_m4_uupg_b_sd",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_m4_uupg_fg_rail",
			"wpn_fps_m4_uupg_fg_lr300",
			"wpn_fps_m4_uupg_m_std_vanilla",
			"wpn_fps_upg_m4_m_drum",
			"wpn_fps_upg_m4_m_pmag",
			"wpn_fps_upg_m4_m_straight",
			"wpn_fps_m4_uupg_s_fold",
			"wpn_fps_upg_m4_s_standard_vanilla",
			"wpn_fps_upg_m4_s_pts",
			"wpn_fps_m4_uupg_draghandle",
			"wpn_fps_m4_uupg_o_flipup",
			"wpn_fps_upg_o_specter",
			"wpn_fps_upg_o_aimpoint",
			"wpn_fps_upg_o_docter",
			"wpn_fps_upg_o_eotech",
			"wpn_fps_upg_o_t1micro",
			"wpn_fps_upg_o_cmore",
			"wpn_fps_upg_o_aimpoint_2",
			"wpn_fps_upg_o_acog",
			"wpn_fps_upg_vg_ass_smg_verticalgrip",
			"wpn_fps_upg_vg_ass_smg_stubby",
			"wpn_fps_upg_vg_ass_smg_afg",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_m4_g_standard_vanilla",
			"wpn_fps_upg_m4_g_ergo",
			"wpn_fps_upg_m4_g_sniper",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_m4_g_hgrip",
			"wpn_fps_upg_m4_g_mgrip",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_fg_jp",
			"wpn_fps_upg_fg_smr",
			"wpn_fps_upg_m4_m_quad",
			"wpn_fps_ass_l85a2_m_emag",
			"wpn_fps_upg_m4_s_crane",
			"wpn_fps_upg_m4_s_mk46",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_o_cs",
			"wpn_fps_upg_o_rx30",
			"wpn_fps_upg_o_rx01",
			"wpn_fps_upg_o_reflex",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_m4_s_ubr",
			"wpn_fps_upg_m4_m_l5",
			"wpn_fps_upg_ass_m4_upper_reciever_ballos",
			"wpn_fps_upg_ass_m4_upper_reciever_core",
			"wpn_fps_upg_ass_m4_lower_reciever_core",
			"wpn_fps_m4_uupg_draghandle_ballos",
			"wpn_fps_m4_uupg_draghandle_core",
			"wpn_fps_upg_ass_m4_b_beowulf",
			"wpn_fps_upg_ass_m4_fg_moe",
			"wpn_fps_upg_ass_m4_fg_lvoa",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_amcar_bolt_standard",
			"wpn_fps_upg_o_45rds",
			"wpn_fps_upg_o_spot",
			"wpn_fps_m4_upg_m_quick",
			"wpn_fps_snp_tti_s_vltor",
			"wpn_fps_snp_tti_g_grippy",
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_o_45rds_v2"
		}
	}
	self.wpn_fps_ass_m4_npc = deep_clone(self.wpn_fps_ass_m4)
	self.wpn_fps_ass_m4_npc.unit = "units/payday2/weapons/wpn_fps_ass_m4/wpn_fps_ass_m4_npc"
	self.wpn_fps_ass_m4_secondary = deep_clone(self.wpn_fps_ass_m4)
	self.wpn_fps_ass_m4_secondary.unit = "units/payday2/weapons/wpn_fps_ass_m4/wpn_fps_ass_m4_secondary"
	self.wpn_fps_ass_m4_secondary_npc = deep_clone(self.wpn_fps_ass_m4_npc)
	self.wpn_fps_ass_m4_secondary_npc.unit = "units/payday2/weapons/wpn_fps_ass_m4/wpn_fps_ass_m4_secondary_npc"
end

--Vanilla AK
function WeaponFactoryTweakData:_init_ak_parts()
	self.parts.wpn_upg_ak_fg_combo1 = {
		a_obj = "a_fg",
		type = "foregrip",
		name_id = "bm_wp_ak_fg_combo1",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_combo1",
		stats = {
			value = 1
		}
	}
	--Railed Wooden Grip
	self.parts.wpn_upg_ak_fg_combo2 = {
		pcs = {
			10,
			20,
			30,
			40
		},
		type = "foregrip",
		name_id = "bm_wp_ak_fg_combo2",
		a_obj = "a_fg",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_combo2",
		stats = {
			value = 3,
			spread_moving = -1,
			--removed spread = -1, --1,
			concealment = 2, --1,
			recoil = 1
		},
		forbids = {
			"wpn_fps_ak_extra_ris"
		}
	}
	--The Tactical Russian Handguard
	self.parts.wpn_upg_ak_fg_combo3 = {
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_combo3",
		a_obj = "a_fg",
		type = "foregrip",
		name_id = "bm_wp_ak_fg_combo3",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			spread_moving = -2,
			value = 5,
			concealment = -1,
			spread = 1,
			recoil = 2
		},
		forbids = {
			"wpn_fps_addon_ris",
			"wpn_fps_ak_extra_ris"
		}
	}
	self.parts.wpn_upg_ak_fg_combo4 = {
		a_obj = "a_fg",
		type = "foregrip",
		name_id = "bm_wp_ak_fg_combo4",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_combo4",
		stats = {
			value = 1
		}
	}
	self.parts.wpn_upg_ak_fg_standard = {
		a_obj = "a_fg",
		type = "foregrip",
		name_id = "bm_wp_ak_fg_standard",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_standard",
		stats = {
			value = 1
		},
		override = {
			wpn_fps_upg_o_specter = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_aimpoint = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_aimpoint_2 = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_docter = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_eotech = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_t1micro = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_cmore = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_acog = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_cs = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_eotech_xps = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_reflex = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_rx01 = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_rx30 = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_spot = {
				a_obj = "a_of"
			}
		}
	}
	self.parts.wpn_upg_ak_fg_standard_gold = {
		a_obj = "a_fg",
		type = "foregrip",
		name_id = "bm_wp_ak_fg_standard_gold",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_standard_gold",
		stats = {
			value = 1
		},
		override = {
			wpn_fps_upg_o_specter = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_aimpoint = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_aimpoint_2 = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_docter = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_eotech = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_t1micro = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_cmore = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_acog = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_cs = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_eotech_xps = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_reflex = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_rx01 = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_rx30 = {
				a_obj = "a_of"
			},
			wpn_fps_upg_o_spot = {
				a_obj = "a_of"
			}
		}
	}
	self.parts.wpn_upg_ak_g_standard = {
		a_obj = "a_g",
		type = "grip",
		name_id = "bm_wp_ak_g_standard",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_g_standard",
		stats = {
			value = 1
		}
	}
	self.parts.wpn_upg_ak_m_akm = {
		a_obj = "a_m",
		type = "magazine",
		name_id = "bm_wp_ak_m_akm",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_m_akm",
		bullet_objects = {
			amount = 1,
			prefix = "g_bullet_"
		},
		stats = {
			value = 1
		}
	}
	self.parts.wpn_upg_ak_m_akm_gold = {
		a_obj = "a_m",
		type = "magazine",
		name_id = "bm_wp_ak_m_akm_gold",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_m_akm_gold",
		bullet_objects = {
			amount = 1,
			prefix = "g_bullet_"
		},
		stats = {
			value = 1
		}
	}
	self.parts.wpn_upg_ak_m_drum = {
		a_obj = "a_m",
		type = "magazine",
		name_id = "bm_wp_ak_m_drum",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_m_drum",
		bullet_objects = {
			amount = 1,
			prefix = "g_bullet_"
		},
		stats = {
			value = 5,
			concealment = -4
		}
	}
	self.parts.wpn_upg_ak_s_adapter = {
		a_obj = "a_s",
		type = "stock_adapter",
		name_id = "bm_wp_ak_s_adapter",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_adapter",
		stats = {
			value = 1
		},
		adds = {
			"wpn_upg_ak_g_standard"
		}
	}
	self.parts.wpn_upg_ak_s_folding = {
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding",
		a_obj = "a_s",
		type = "stock",
		name_id = "bm_wp_ak_s_folding",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			value = 3,
			spread_moving = 2,
			recoil = -1,
			concealment = 2
		},
		adds = {
			"wpn_upg_ak_g_standard"
		}
	}
	self.parts.wpn_upg_ak_s_folding_vanilla_gold = {
		a_obj = "a_s",
		type = "stock",
		name_id = "bm_wp_ak_s_folding",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding_gold",
		stats = {
			value = 1
		},
		adds = {
			"wpn_upg_ak_g_standard"
		}
	}
	self.parts.wpn_upg_ak_s_psl = {
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_psl",
		a_obj = "a_s",
		type = "stock",
		name_id = "bm_wp_ak_s_psl",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			spread_moving = -3,
			spread = 3,
			concealment = -3,
			value = 6,
			recoil = 0
		},
		forbids = {
			"wpn_upg_ak_g_standard",
			"wpn_fps_upg_ak_g_hgrip",
			"wpn_fps_upg_ak_g_wgrip",
			"wpn_fps_upg_ak_g_pgrip",
			"wpn_fps_upg_ak_g_rk3"
		}
	}
	self.parts.wpn_upg_ak_s_skfoldable = {
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_skfoldable",
		a_obj = "a_s",
		type = "stock",
		name_id = "bm_wp_ak_s_skfoldable",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			value = 3,
			spread_moving = 2,
			recoil = -1,
			concealment = 2
		},
		adds = {
			"wpn_upg_ak_g_standard"
		}
	}
	self.parts.wpn_fps_ak_extra_ris = {
		name_id = "bm_wp_ak_s_skfoldable",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_fps_ak_extra_ris",
		a_obj = "a_of",
		type = "extra"
	}
	self.parts.wpn_fps_ak_bolt = {
		name_id = "bm_wp_ak_s_skfoldable",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_fps_ak_bolt",
		a_obj = "a_bolt",
		type = "drag_handle"
	}
	self.parts.wpn_upg_ak_fg_combo1.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_combo1"
	self.parts.wpn_upg_ak_fg_combo2.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_combo2"
	self.parts.wpn_upg_ak_fg_combo3.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_combo3"
	self.parts.wpn_upg_ak_fg_combo4.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_combo4"
	self.parts.wpn_upg_ak_fg_standard.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_standard"
	self.parts.wpn_upg_ak_fg_standard_gold.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_standard_gold"
	self.parts.wpn_upg_ak_g_standard.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_g_standard"
	self.parts.wpn_upg_ak_m_akm.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_m_akm"
	self.parts.wpn_upg_ak_m_akm_gold.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_m_akm_gold"
	self.parts.wpn_upg_ak_m_drum.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_m_drum"
	self.parts.wpn_upg_ak_s_adapter.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_s_adapter"
	self.parts.wpn_upg_ak_s_folding.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_s_folding"
	self.parts.wpn_upg_ak_s_folding_vanilla_gold.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_s_folding_gold"
	self.parts.wpn_upg_ak_s_psl.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_s_psl"
	self.parts.wpn_upg_ak_s_skfoldable.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_s_skfoldable"
	self.parts.wpn_fps_ak_extra_ris.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_ak_extra_ris"
	self.parts.wpn_fps_ak_bolt.third_unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_third_ak_bolt"
	self.parts.wpn_upg_ak_s_folding_vanilla = deep_clone(self.parts.wpn_upg_ak_s_folding)
	self.parts.wpn_upg_ak_s_folding_vanilla.stats = nil
	self.parts.wpn_upg_ak_s_folding_vanilla.pcs = nil
	self.parts.wpn_upg_ak_s_skfoldable_vanilla = deep_clone(self.parts.wpn_upg_ak_s_skfoldable)
	self.parts.wpn_upg_ak_s_skfoldable_vanilla.stats = nil
	self.parts.wpn_upg_ak_s_skfoldable_vanilla.pcs = nil
	self.parts.wpn_fps_ass_akm_body_upperreceiver = {
		a_obj = "a_body",
		type = "upper_reciever",
		name_id = "bm_wp_akm_body_upperreceiver",
		unit = "units/payday2/weapons/wpn_fps_ass_akm_pts/wpn_fps_ass_akm_body_upperreceiver",
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_ass_akm_body_upperreceiver_gold = {
		a_obj = "a_body",
		type = "upper_reciever",
		name_id = "bm_wp_akm_body_upperreceiver_gold",
		unit = "units/payday2/weapons/wpn_fps_ass_akm_gold_pts/wpn_fps_ass_akm_body_upperreceiver_gold",
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_ass_ak_body_lowerreceiver = {
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "bm_wp_ak_body_lowerreceiver",
		unit = "units/payday2/weapons/wpn_fps_ass_akm_pts/wpn_fps_ass_ak_body_lowerreceiver",
		stats = {
			value = 1
		},
		adds = {
			"wpn_fps_ak_bolt"
		}
	}
	self.parts.wpn_fps_ass_ak_body_lowerreceiver_gold = {
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "bm_wp_ak_body_lowerreceiver_gold",
		unit = "units/payday2/weapons/wpn_fps_ass_akm_gold_pts/wpn_fps_ass_ak_body_lowerreceiver_gold",
		stats = {
			value = 1
		},
		adds = {
			"wpn_fps_ak_bolt"
		}
	}
	self.parts.wpn_fps_ass_akm_b_standard = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_akm_b_standard",
		unit = "units/payday2/weapons/wpn_fps_ass_akm_pts/wpn_fps_ass_akm_b_standard",
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_ass_akm_b_standard_gold = {
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_akm_b_standard_gold",
		unit = "units/payday2/weapons/wpn_fps_ass_akm_gold_pts/wpn_fps_ass_akm_b_standard_gold",
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_ass_akm_body_upperreceiver.third_unit = "units/payday2/weapons/wpn_third_ass_akm_pts/wpn_third_ass_akm_body_upperreceiver"
	self.parts.wpn_fps_ass_akm_body_upperreceiver_gold.third_unit = "units/payday2/weapons/wpn_third_ass_akm_pts/wpn_third_ass_akm_body_upperreceiver_gold"
	self.parts.wpn_fps_ass_akm_b_standard.third_unit = "units/payday2/weapons/wpn_third_ass_akm_pts/wpn_third_ass_akm_b_standard"
	self.parts.wpn_fps_ass_akm_b_standard_gold.third_unit = "units/payday2/weapons/wpn_third_ass_akm_pts/wpn_third_ass_akm_b_standard_gold"
	self.parts.wpn_fps_ass_ak_body_lowerreceiver.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_ass_ak_body_lowerreceiver"
	self.parts.wpn_fps_ass_ak_body_lowerreceiver_gold.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_ass_ak_body_lowerreceiver_gold"
	self.parts.wpn_fps_ass_akm_body_upperreceiver_vanilla = deep_clone(self.parts.wpn_fps_ass_akm_body_upperreceiver)
	self.parts.wpn_fps_ass_akm_body_upperreceiver_vanilla.stats = nil
	self.parts.wpn_fps_ass_akm_body_upperreceiver_vanilla.pc = nil
end

--Commando 553
function WeaponFactoryTweakData:_init_s552()
	self.parts.wpn_fps_ass_s552_o_flipup = {
		texture_bundle_folder = "dlc1",
		a_obj = "a_of",
		type = "sight",
		name_id = "bm_wp_shorty_m_extended_short",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_o_flipup",
		stats = {
			value = 1
		},
		forbids = {
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_o_45rds",
			"wpn_fps_upg_o_45rds_v2"
		}
	}
	self.parts.wpn_fps_ass_s552_m_standard = {
		texture_bundle_folder = "dlc1",
		type = "magazine",
		name_id = "bm_wp_shorty_m_extended_short",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_m_standard",
		a_obj = "a_m",
		bullet_objects = {
			amount = 28,
			prefix = "g_bullet_"
		},
		stats = {
			value = 1
		},
		animations = {
			reload_not_empty = "reload_not_empty",
			reload = "reload"
		}
	}
	self.parts.wpn_fps_ass_s552_b_standard = {
		texture_bundle_folder = "dlc1",
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_serbu_b_short",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_b_standard",
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_ass_s552_b_long = {
		texture_bundle_folder = "dlc1",
		dlc = "armored_transport",
		type = "barrel",
		name_id = "bm_wp_ass_s552_b_long",
		a_obj = "a_b",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_b_long",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			spread = 1,
			recoil = -3, --added
			concealment = -4,
			damage = 1,
			value = 6,
			spread_moving = -1
		}
	}
	self.parts.wpn_fps_ass_s552_body_standard = {
		texture_bundle_folder = "dlc1",
		a_obj = "a_body",
		type = "upper_reciever",
		name_id = "bm_wp_serbu_s_nostock_short",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_body_standard",
		stats = {
			value = 1
		},
		animations = {
			fire = "recoil",
			reload = "reload",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_ass_s552_body_standard_black = {
		texture_bundle_folder = "dlc1",
		type = "upper_reciever",
		a_obj = "a_body",
		dlc = "armored_transport",
		name_id = "bm_wp_ass_s552_body_standard_black",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_body_standard_black",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			spread = -1,
			value = 7,
			damage = 1,
			concealment = 4
		},
		animations = {
			fire = "recoil",
			reload = "reload",
			fire_steelsight = "recoil"
		}
	}
	self.parts.wpn_fps_ass_s552_fg_standard = {
		texture_bundle_folder = "dlc1",
		a_obj = "a_fg",
		type = "foregrip",
		name_id = "bm_wp_serbu_s_nostock_short",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_standard",
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_ass_s552_fg_standard_green = {
		texture_bundle_folder = "dlc1",
		dlc = "armored_transport",
		type = "foregrip",
		name_id = "bm_wp_ass_s552_fg_standard_green",
		a_obj = "a_fg",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_standard_green",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			spread = 1,
			value = 1,
			concealment = -4
		}
	}
	self.parts.wpn_fps_ass_s552_fg_railed = {
		type = "foregrip",
		texture_bundle_folder = "dlc1",
		a_obj = "a_fg",
		dlc = "armored_transport",
		name_id = "bm_wp_ass_s552_fg_railed",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_railed",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			value = 7,
			recoil = 5,
			concealment = -2
		},
		forbids = {
			"wpn_fps_addon_ris"
		}
	}
	self.parts.wpn_fps_ass_s552_g_standard = {
		texture_bundle_folder = "dlc1",
		a_obj = "a_g",
		type = "grip",
		name_id = "bm_wp_serbu_s_solid_short",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_g_standard",
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_ass_s552_g_standard_green = {
		texture_bundle_folder = "dlc1",
		dlc = "armored_transport",
		type = "grip",
		name_id = "bm_wp_ass_s552_g_standard_green",
		a_obj = "a_g",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_g_standard_green",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			value = 4,
			recoil = 2,
			concealment = -2
		}
	}
	self.parts.wpn_fps_ass_s552_s_m4 = {
		texture_bundle_folder = "dlc1",
		a_obj = "a_s",
		type = "stock",
		name_id = "bm_wp_serbu_s_solid_short",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_s_m4",
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_ass_s552_s_standard = {
		texture_bundle_folder = "dlc1",
		a_obj = "a_s",
		type = "stock",
		name_id = "bm_wp_serbu_s_solid_short",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_s_standard",
		stats = {
			value = 1
		}
	}
	self.parts.wpn_fps_ass_s552_s_standard_green = {
		texture_bundle_folder = "dlc1",
		dlc = "armored_transport",
		type = "stock",
		name_id = "bm_wp_ass_s552_s_standard_green",
		a_obj = "a_s",
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_s_standard_green",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			value = 4,
			recoil = 2,
			spread = 3, --added
			concealment = -2
		}
	}
	self.parts.wpn_fps_ass_s552_o_flipup.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_o_flipup"
	self.parts.wpn_fps_ass_s552_m_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_m_standard"
	self.parts.wpn_fps_ass_s552_b_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_b_standard"
	self.parts.wpn_fps_ass_s552_body_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_body_standard"
	self.parts.wpn_fps_ass_s552_fg_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_standard"
	self.parts.wpn_fps_ass_s552_fg_railed.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_railed"
	self.parts.wpn_fps_ass_s552_g_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_g_standard"
	self.parts.wpn_fps_ass_s552_s_m4.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_s_m4"
	self.parts.wpn_fps_ass_s552_s_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_s_standard"
	self.parts.wpn_fps_ass_s552_b_long.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_b_long"
	self.parts.wpn_fps_ass_s552_body_standard_black.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_body_standard_black"
	self.parts.wpn_fps_ass_s552_fg_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_standard_green"
	self.parts.wpn_fps_ass_s552_g_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_g_standard_green"
	self.parts.wpn_fps_ass_s552_s_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_s_standard_green"
	self.wpn_fps_ass_s552 = {
		unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552/wpn_fps_ass_s552",
		optional_types = {
			"barrel_ext",
			"gadget"
		},
		stock_adapter = "wpn_fps_ass_s552_s_m4",
		adds = {
			wpn_fps_upg_fl_ass_smg_sho_surefire = {
				"wpn_fps_addon_ris"
			},
			wpn_fps_upg_fl_ass_smg_sho_peqbox = {
				"wpn_fps_addon_ris"
			},
			wpn_fps_upg_fl_ass_peq15 = {
				"wpn_fps_addon_ris"
			},
			wpn_fps_upg_fl_ass_laser = {
				"wpn_fps_addon_ris"
			},
			wpn_fps_upg_fl_ass_utg = {
				"wpn_fps_addon_ris"
			}
		},
		default_blueprint = {
			"wpn_fps_ass_s552_o_flipup",
			"wpn_fps_ass_s552_m_standard",
			"wpn_fps_ass_s552_b_standard",
			"wpn_fps_ass_s552_body_standard",
			"wpn_fps_ass_s552_fg_standard",
			"wpn_fps_ass_s552_s_standard",
			"wpn_fps_ass_s552_g_standard"
		},
		uses_parts = {
			"wpn_fps_ass_s552_o_flipup",
			"wpn_fps_ass_s552_m_standard",
			"wpn_fps_ass_s552_b_standard",
			"wpn_fps_ass_s552_b_long",
			"wpn_fps_ass_s552_body_standard",
			"wpn_fps_ass_s552_body_standard_black",
			"wpn_fps_ass_s552_fg_standard",
			"wpn_fps_ass_s552_fg_railed",
			"wpn_fps_ass_s552_fg_standard_green",
			"wpn_fps_ass_s552_s_standard",
			"wpn_fps_ass_s552_s_m4",
			"wpn_fps_ass_s552_s_standard_green",
			"wpn_fps_ass_s552_g_standard",
			"wpn_fps_ass_s552_g_standard_green",
			"wpn_fps_upg_m4_s_standard_vanilla",
			"wpn_fps_upg_m4_s_pts",
			"wpn_fps_upg_o_specter",
			"wpn_fps_upg_o_aimpoint",
			"wpn_fps_upg_o_docter",
			"wpn_fps_upg_o_eotech",
			"wpn_fps_upg_o_t1micro",
			"wpn_fps_upg_o_cmore",
			"wpn_fps_upg_o_aimpoint_2",
			"wpn_fps_upg_o_acog",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_o_reflex",
			"wpn_fps_upg_o_rx01",
			"wpn_fps_upg_o_rx30",
			"wpn_fps_upg_o_cs",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_m4_s_crane",
			"wpn_fps_upg_m4_s_mk46",
			"wpn_fps_upg_m4_s_ubr",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_o_45rds",
			"wpn_fps_upg_o_spot",
			"wpn_fps_snp_tti_s_vltor",
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_o_45rds_v2"
		}
	}
	self.wpn_fps_ass_s552_npc = deep_clone(self.wpn_fps_ass_s552)
	self.wpn_fps_ass_s552_npc.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552/wpn_fps_ass_s552_npc"
	self.wpn_fps_ass_s552_secondary = deep_clone(self.wpn_fps_ass_s552)
	self.wpn_fps_ass_s552_secondary.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552/wpn_fps_ass_s552_secondary"
	self.wpn_fps_ass_s552_secondary_npc = deep_clone(self.wpn_fps_ass_s552_npc)
	self.wpn_fps_ass_s552_secondary_npc.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552/wpn_fps_ass_s552_secondary_npc"
end

--Gewehr 3
function WeaponFactoryTweakData:_init_g3()
	self.parts.wpn_fps_ass_g3_body_lower = {
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "bm_wp_g3_body_lower",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_body_lower",
		stats = {
			value = 2
		}
	}
	self.parts.wpn_fps_ass_g3_body_upper = {
		a_obj = "a_body",
		type = "upper_reciever",
		name_id = "bm_wp_g3_body_upper",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_body_upper",
		stats = {
			value = 2
		},
		animations = {
			fire_steelsight = "recoil",
			fire = "recoil"
		}
	}
	self.parts.wpn_fps_ass_g3_b_sniper = {
		is_a_unlockable = true,
		texture_bundle_folder = "gage_pack_assault",
		a_obj = "a_b",
		type = "barrel",
		parent = "foregrip",
		dlc = "gage_pack_assault",
		name_id = "bm_wp_g3_b_sniper",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_b_sniper",
		pcs = {},
		stats = {
			extra_ammo = -5,
			total_ammo_mod = -6,
			damage = 61,
			value = 2,
			concealment = -2,
			recoil = -1,
			spread = 2
		},
		override = {
			wpn_fps_ass_g3_m_mag = {
				third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_m_mag_psg",
				unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_m_mag_psg"
			}
		},
		adds = {
			"wpn_fps_ammo_type"
		}
	}
	self.parts.wpn_fps_ammo_type = {
		a_obj = "a_m",
		type = "ammo",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ammo_type",
		stats = {
			value = 1
		},
		custom_stats = {
			ammo_pickup_max_mul = 1, --0.5,
			ammo_pickup_min_mul = 1 --0.5
		}
	}
	self.parts.wpn_fps_ass_g3_b_short = {
		is_a_unlockable = true,
		texture_bundle_folder = "gage_pack_assault",
		type = "barrel",
		a_obj = "a_b",
		parent = "foregrip",
		dlc = "gage_pack_assault",
		name_id = "bm_wp_g3_b_short",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_b_short",
		pcs = {},
		stats = {
			spread = -4,
			total_ammo_mod = 15,
			damage = -40,
			value = 2,
			concealment = 4,
			recoil = 5
		},
		custom_stats = { --THis was added
			ammo_pickup_max_mul = 1.75,
			ammo_pickup_min_mul = 1.75
		},
		forbids = {
			"wpn_fps_ammo_type"
		},
		override = {
			wpn_fps_upg_ass_ns_jprifles = {
				a_obj = "a_ns_s"
			},
			wpn_fps_upg_ass_ns_surefire = {
				a_obj = "a_ns_s"
			},
			wpn_fps_upg_ass_ns_battle = {
				a_obj = "a_ns_s"
			}
		},
	}
	self.parts.wpn_fps_ass_g3_b_long = {
		parent = "foregrip",
		a_obj = "a_b",
		type = "barrel",
		name_id = "bm_wp_g3_b_long",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_b_long",
		stats = {
			value = 2
		},
		forbids = {
			"wpn_fps_ammo_type"
		},
		override = {
			wpn_fps_upg_ass_ns_jprifles = {
				a_obj = "a_ns_s"
			},
			wpn_fps_upg_ass_ns_surefire = {
				a_obj = "a_ns_s"
			},
			wpn_fps_upg_ass_ns_battle = {
				a_obj = "a_ns_s"
			}
		}
	}
	self.parts.wpn_fps_ass_g3_body_rail = {
		a_obj = "a_body",
		type = "upper_reciever",
		name_id = "bm_wp_g3_b_long",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_body_rail",
		stats = {
			value = 2
		}
	}
	self.parts.wpn_fps_ass_g3_fg_bipod = {
		a_obj = "a_fg",
		type = "foregrip",
		name_id = "bm_wp_g3_fg_standard",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_bipod",
		stats = {
			value = 2
		},
		animations = {
			reload = "reload"
		}
	}
	self.parts.wpn_fps_ass_g3_fg_psg = {
		is_a_unlockable = true,
		texture_bundle_folder = "gage_pack_assault",
		type = "foregrip",
		a_obj = "a_fg",
		dlc = "gage_pack_assault",
		name_id = "bm_wp_g3_fg_psg",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_psg",
		pcs = {},
		stats = {
			value = 2,
			recoil = -1,
			spread = 1,
			concealment = -1
		},
		animations = {
			reload = "reload"
		}
	}
	self.parts.wpn_fps_ass_g3_fg_railed = {
		is_a_unlockable = true,
		texture_bundle_folder = "gage_pack_assault",
		type = "foregrip",
		a_obj = "a_fg",
		dlc = "gage_pack_assault",
		name_id = "bm_wp_g3_fg_railed",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_railed",
		pcs = {},
		stats = {
			value = 2,
			recoil = 2,
			spread = 0,
			concealment = -2
		},
		animations = {
			reload = "reload"
		}
	}
	self.parts.wpn_fps_ass_g3_fg_retro = {
		is_a_unlockable = true,
		texture_bundle_folder = "gage_pack_assault",
		type = "foregrip",
		a_obj = "a_fg",
		dlc = "gage_pack_assault",
		name_id = "bm_wp_g3_fg_retro",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_retro",
		pcs = {},
		stats = {
			value = 2,
			recoil = 3,
			spread = -1,
			concealment = 2
		},
		animations = {
			reload = "reload"
		}
	}
	self.parts.wpn_fps_ass_g3_fg_retro_plastic = {
		is_a_unlockable = true,
		texture_bundle_folder = "gage_pack_assault",
		type = "foregrip",
		a_obj = "a_fg",
		dlc = "gage_pack_assault",
		name_id = "bm_wp_g3_fg_retro_plastic",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_retro_plastic",
		pcs = {},
		stats = {
			value = 2,
			recoil = 0,
			spread = -1,
			concealment = 4
		},
		animations = {
			reload = "reload"
		}
	}
	self.parts.wpn_fps_ass_g3_g_retro = {
		is_a_unlockable = true,
		texture_bundle_folder = "gage_pack_assault",
		type = "grip",
		a_obj = "a_g",
		dlc = "gage_pack_assault",
		name_id = "bm_wp_g3_g_retro",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_g_retro",
		pcs = {},
		stats = {
			value = 2,
			recoil = 2,
			spread = 0,
			concealment = 0
		}
	}
	self.parts.wpn_fps_ass_g3_g_sniper = {
		is_a_unlockable = true,
		texture_bundle_folder = "gage_pack_assault",
		type = "grip",
		a_obj = "a_g",
		dlc = "gage_pack_assault",
		name_id = "bm_wp_g3_g_sniper",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_g_sniper",
		pcs = {},
		stats = {
			value = 2,
			recoil = -1,
			spread = 2,
			concealment = -1
		}
	}
	self.parts.wpn_fps_ass_g3_m_mag = {
		a_obj = "a_m",
		type = "magazine",
		name_id = "bm_wp_g3_m_standard",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_m_mag",
		bullet_objects = {
			amount = 2,
			prefix = "g_bullet_"
		},
		stats = {
			value = 2
		},
		animations = {
			reload_not_empty = "reload_not_empty",
			reload = "reload"
		}
	}
	self.parts.wpn_fps_ass_g3_s_sniper = {
		is_a_unlockable = true,
		texture_bundle_folder = "gage_pack_assault",
		type = "stock",
		a_obj = "a_s",
		dlc = "gage_pack_assault",
		name_id = "bm_wp_g3_s_sniper",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_s_sniper",
		pcs = {},
		stats = {
			value = 2,
			recoil = -1,
			spread = 2,
			concealment = -1
		}
	}
	self.parts.wpn_fps_ass_g3_s_wood = {
		is_a_unlockable = true,
		texture_bundle_folder = "gage_pack_assault",
		type = "stock",
		a_obj = "a_s",
		dlc = "gage_pack_assault",
		name_id = "bm_wp_g3_s_wood",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_s_wood",
		pcs = {},
		stats = {
			value = 2,
			recoil = 3,
			spread = 0,
			concealment = -1
		}
	}
	self.parts.wpn_fps_ass_g3_body_lower.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_body_lower"
	self.parts.wpn_fps_ass_g3_body_upper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_body_upper"
	self.parts.wpn_fps_ass_g3_b_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_b_sniper"
	self.parts.wpn_fps_ass_g3_b_short.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_b_short"
	self.parts.wpn_fps_ass_g3_b_long.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_b_long"
	self.parts.wpn_fps_ass_g3_body_rail.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_body_rail"
	self.parts.wpn_fps_ass_g3_fg_bipod.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_bipod"
	self.parts.wpn_fps_ass_g3_fg_psg.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_psg"
	self.parts.wpn_fps_ass_g3_fg_railed.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_railed"
	self.parts.wpn_fps_ass_g3_fg_retro.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_retro"
	self.parts.wpn_fps_ass_g3_fg_retro_plastic.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_retro_plastic"
	self.parts.wpn_fps_ass_g3_g_retro.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_g_retro"
	self.parts.wpn_fps_ass_g3_g_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_g_sniper"
	self.parts.wpn_fps_ass_g3_m_mag.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_m_mag"
	self.parts.wpn_fps_ass_g3_s_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_s_sniper"
	self.parts.wpn_fps_ass_g3_s_wood.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_s_standard"
	self.wpn_fps_ass_g3 = {
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3/wpn_fps_ass_g3",
		optional_types = {
			"barrel_ext",
			"gadget"
		},
		override = {},
		adds = {
			wpn_fps_upg_o_specter = {
				"wpn_fps_ass_g3_body_rail"
			},
			wpn_fps_upg_o_aimpoint = {
				"wpn_fps_ass_g3_body_rail"
			},
			wpn_fps_upg_o_aimpoint_2 = {
				"wpn_fps_ass_g3_body_rail"
			},
			wpn_fps_upg_o_docter = {
				"wpn_fps_ass_g3_body_rail"
			},
			wpn_fps_upg_o_eotech = {
				"wpn_fps_ass_g3_body_rail"
			},
			wpn_fps_upg_o_t1micro = {
				"wpn_fps_ass_g3_body_rail"
			},
			wpn_fps_upg_o_cmore = {
				"wpn_fps_ass_g3_body_rail"
			},
			wpn_fps_upg_o_acog = {
				"wpn_fps_ass_g3_body_rail"
			},
			wpn_fps_upg_o_cs = {
				"wpn_fps_ass_g3_body_rail"
			},
			wpn_fps_upg_o_eotech_xps = {
				"wpn_fps_ass_g3_body_rail"
			},
			wpn_fps_upg_o_reflex = {
				"wpn_fps_ass_g3_body_rail"
			},
			wpn_fps_upg_o_rx01 = {
				"wpn_fps_ass_g3_body_rail"
			},
			wpn_fps_upg_o_rx30 = {
				"wpn_fps_ass_g3_body_rail"
			},
			wpn_fps_upg_o_spot = {
				"wpn_fps_ass_g3_body_rail"
			}
		},
		default_blueprint = {
			"wpn_fps_ass_g3_b_long",
			"wpn_fps_ass_g3_body_lower",
			"wpn_fps_ass_g3_body_upper",
			"wpn_fps_ass_g3_fg_bipod",
			"wpn_fps_lmg_hk21_g_standard",
			"wpn_fps_ass_g3_m_mag",
			"wpn_fps_lmg_hk21_s_standard"
		},
		uses_parts = {
			"wpn_fps_ass_g3_body_lower",
			"wpn_fps_ass_g3_body_upper",
			"wpn_fps_ass_g3_fg_bipod",
			"wpn_fps_ass_g3_m_mag",
			"wpn_fps_ass_g3_b_short",
			"wpn_fps_ass_g3_b_long",
			"wpn_fps_ass_g3_b_sniper",
			"wpn_fps_ass_g3_fg_psg",
			"wpn_fps_ass_g3_fg_railed",
			"wpn_fps_ass_g3_fg_retro",
			"wpn_fps_ass_g3_fg_retro_plastic",
			"wpn_fps_ass_g3_g_retro",
			"wpn_fps_ass_g3_g_sniper",
			"wpn_fps_ass_g3_s_sniper",
			"wpn_fps_ass_g3_s_wood",
			"wpn_fps_lmg_hk21_g_standard",
			"wpn_fps_lmg_hk21_s_standard",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire",
			"wpn_fps_upg_o_specter",
			"wpn_fps_upg_o_aimpoint",
			"wpn_fps_upg_o_docter",
			"wpn_fps_upg_o_eotech",
			"wpn_fps_upg_o_t1micro",
			"wpn_fps_upg_o_cmore",
			"wpn_fps_upg_o_aimpoint_2",
			"wpn_fps_upg_o_acog",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_upg_fl_ass_smg_sho_surefire",
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_o_reflex",
			"wpn_fps_upg_o_rx01",
			"wpn_fps_upg_o_rx30",
			"wpn_fps_upg_o_cs",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_fl_ass_peq15",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_ass_ns_battle",
			"wpn_fps_upg_fl_ass_utg",
			"wpn_fps_upg_o_45rds",
			"wpn_fps_upg_o_spot",
			"wpn_fps_upg_o_xpsg33_magnifier",
			"wpn_fps_upg_o_45rds_v2"
		}
	}
	self.wpn_fps_ass_g3_npc = deep_clone(self.wpn_fps_ass_g3)
	self.wpn_fps_ass_g3_npc.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3/wpn_fps_ass_g3_npc"
end


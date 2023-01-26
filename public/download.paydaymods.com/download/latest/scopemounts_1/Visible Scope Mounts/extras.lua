local old_init = WeaponFactoryTweakData.init

function WeaponFactoryTweakData:init(tweak_data)
    old_init(self, tweak_data)

	self.parts.wpn_fps_pis_rage_extra = {
		type = "extra",
		name_id = "bm_wp_pis_rage_extra",
		pcs = {},
		a_obj = "a_b",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_pis_rage_extra/wpn_fps_pis_rage_extra",
		stats = {value = 2},
		internal_part = false,
		dlc = "gage_pack_jobs",
		stance_mod = {
			wpn_fps_pis_rage = {
				translation = Vector3(0, 0, -1.47)
			}
		},
		override = {
			wpn_fps_pis_rage_body_smooth = {
				adds = { "wpn_fps_pis_rage_o_adapter" }
			},
			wpn_fps_pis_rage_body_standard = {
				adds = { "wpn_fps_pis_rage_o_adapter" }
			},
			wpn_fps_upg_o_eotech = {
				stance_mod = {
					wpn_fps_pis_rage = {
						translation = Vector3(-0.05, -10, -3.18)
					}
				}
			},
			wpn_fps_upg_o_aimpoint = {
				stance_mod = {
					wpn_fps_pis_rage = {
						translation = Vector3(-0.05, -10, -3.18)
					}
				}
			},
			wpn_fps_upg_o_aimpoint_2 = {
				stance_mod = {
					wpn_fps_pis_rage = {
						translation = Vector3(-0.05, -10, -3.18)
					}
				}
			},
			wpn_fps_upg_o_specter = {
				stance_mod = {
					wpn_fps_pis_rage = {
						translation = Vector3(-0.05, -10, -3.18)
					}
				}
			},
			wpn_fps_upg_o_docter = {
				stance_mod = {
					wpn_fps_pis_rage = {
						translation = Vector3(-0.05, -10, -3.18)
					}
				}
			},
			wpn_fps_upg_o_t1micro = {
				stance_mod = {
					wpn_fps_pis_rage = {
						translation = Vector3(-0.05, -10, -3.18)
					}
				}
			},
			wpn_fps_upg_o_cmore = {
				stance_mod = {
					wpn_fps_pis_rage = {
						translation = Vector3(-0.05, -10, -3.18)
					}
				}
			},
			wpn_fps_upg_o_acog = {
				stance_mod = {
					wpn_fps_pis_rage = {
						translation = Vector3(-0.05, -15, -3.18)
					}
				}
			},
			wpn_fps_upg_o_eotech_xps = {
				stance_mod = {
					wpn_fps_pis_rage = {
						translation = Vector3(-0.05, -10, -3.18)
					}
				}
			},
			wpn_fps_upg_o_reflex = {
				stance_mod = {
					wpn_fps_pis_rage = {
						translation = Vector3(-0.05, -10, -3.18)
					}
				}
			},
			wpn_fps_upg_o_rx01 = {
				stance_mod = {
					wpn_fps_pis_rage = {
						translation = Vector3(-0.05, -10, -3.18)
					}
				}
			},
			wpn_fps_upg_o_rx30 = {
				stance_mod = {
					wpn_fps_pis_rage = {
						translation = Vector3(-0.05, -10, -3.18)
					}
				}
			},
			wpn_fps_upg_o_cs = {
				stance_mod = {
					wpn_fps_pis_rage = {
						translation = Vector3(-0.05, -10, -3.18)
					}
				}
			}
		}
	}

	self.parts.wpn_fps_pis_deagle_extra = {
		type = "extra",
		name_id = "bm_wp_pis_deagle_extra",
		pcs = {},
		a_obj = "a_b",
		texture_bundle_folder = "gage_pack_jobs",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_pis_deagle_extra/wpn_fps_pis_deagle_extra",
		stats = {value = 2},
		internal_part = false,
		dlc = "gage_pack_jobs",
		stance_mod = {
			wpn_fps_pis_deagle = {
				translation = Vector3(0, 0, -1.47)
			}
		},
		override = {
			wpn_fps_pis_deagle_body_standard = {
				adds = { "wpn_fps_pis_rage_o_adapter" }
			},
			wpn_fps_pis_rage_o_adapter = {
				a_obj = "a_quite"
			},
			wpn_fps_upg_o_eotech = {
				stance_mod = {
					wpn_fps_pis_deagle = {
						translation = Vector3(0, -15, -2.78),
						rotation = Rotation(0, -0.5, 0)
					}
				}
			},
			wpn_fps_upg_o_aimpoint = {
				stance_mod = {
					wpn_fps_pis_deagle = {
						translation = Vector3(0, -15, -2.78),
						rotation = Rotation(0, -0.5, 0)
					}
				}
			},
			wpn_fps_upg_o_aimpoint_2 = {
				stance_mod = {
					wpn_fps_pis_deagle = {
						translation = Vector3(0, -15, -2.78),
						rotation = Rotation(0, -0.5, 0)
					}
				}
			},
			wpn_fps_upg_o_specter = {
				stance_mod = {
					wpn_fps_pis_deagle = {
						translation = Vector3(0, -15, -2.78),
						rotation = Rotation(0, -0.5, 0)
					}
				}
			},
			wpn_fps_upg_o_docter = {
				stance_mod = {
					wpn_fps_pis_deagle = {
						translation = Vector3(0, -15, -2.78),
						rotation = Rotation(0, -0.5, 0)
					}
				}
			},
			wpn_fps_upg_o_t1micro = {
				stance_mod = {
					wpn_fps_pis_deagle = {
						translation = Vector3(0, -15, -2.78),
						rotation = Rotation(0, -0.5, 0)
					}
				}
			},
			wpn_fps_upg_o_cmore = {
				stance_mod = {
					wpn_fps_pis_deagle = {
						translation = Vector3(0, -15, -2.78),
						rotation = Rotation(0, -0.5, 0)
					}
				}
			},
			wpn_fps_upg_o_acog = {
				stance_mod = {
					wpn_fps_pis_deagle = {
						translation = Vector3(0, -18, -2.73),
						rotation = Rotation(0, -0.5, 0)
					}
				}
			},
			wpn_fps_upg_o_eotech_xps = {
				stance_mod = {
					wpn_fps_pis_deagle = {
						translation = Vector3(0, -15, -2.78),
						rotation = Rotation(0, -0.5, 0)
					}
				}
			},
			wpn_fps_upg_o_reflex = {
				stance_mod = {
					wpn_fps_pis_deagle = {
						translation = Vector3(0, -15, -2.78),
						rotation = Rotation(0, -0.5, 0)
					}
				}
			},
			wpn_fps_upg_o_rx01 = {
				stance_mod = {
					wpn_fps_pis_deagle = {
						translation = Vector3(0, -15, -2.78),
						rotation = Rotation(0, -0.5, 0)
					}
				}
			},
			wpn_fps_upg_o_rx30 = {
				stance_mod = {
					wpn_fps_pis_deagle = {
						translation = Vector3(0, -15, -2.78),
						rotation = Rotation(0, -0.5, 0)
					}
				}
			},
			wpn_fps_upg_o_cs = {
				stance_mod = {
					wpn_fps_pis_deagle = {
						translation = Vector3(0, -15, -2.78),
						rotation = Rotation(0, -0.5, 0)
					}
				}
			}
		},
		forbids = {
	--		"wpn_upg_o_marksmansight_rear",
			"wpn_fps_upg_o_rmr"
		}
	}
end
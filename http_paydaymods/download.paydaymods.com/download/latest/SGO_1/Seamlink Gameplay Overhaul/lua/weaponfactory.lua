if not SGO or not SGO.settings.use_lmgs2 then return end
if SystemFS:exists("mods/Steelsights/mod.txt") then return end
local old_init = WeaponFactoryTweakData.init

function WeaponFactoryTweakData:init(tweak_data)
    old_init(self, tweak_data)
	self.parts.wpn_fps_lmg_mg42_b_vg38.forbids = {
			"wpn_fps_upg_ns_ass_smg_large",
			"wpn_fps_upg_ns_ass_smg_medium",
			"wpn_fps_upg_ns_ass_smg_small",
			"wpn_fps_upg_ns_ass_smg_firepig",
			"wpn_fps_upg_ns_ass_smg_stubby",
			"wpn_fps_upg_ns_ass_smg_tank",
			"wpn_fps_upg_ass_ns_jprifles",
			"wpn_fps_upg_ass_ns_linear",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_ass_ns_battle",
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
			"wpn_fps_upg_o_aimpoint",
			"wpn_fps_upg_o_spot"
		}
self.wpn_fps_lmg_rpk.override = {
		wpn_fps_extra_zoom = { 
		stance_mod = {
			wpn_fps_lmg_rpk = { 
				translation = Vector3( 0.025,-13,-3.35 )
				}
			}
		},	
		wpn_fps_upg_o_specter = {
			stance_mod = {
				wpn_fps_lmg_rpk = {
					translation = Vector3( 0.025,-13,-3.35 ) + Vector3(0, 4, 0)
					}
				}
			},
		wpn_fps_upg_o_aimpoint_2 = {
			stance_mod = {
				wpn_fps_lmg_rpk = {
					translation = Vector3( 0.025,-13,-3.35 ) + Vector3(0, 2, 0)
					}
				}	
			},
			wpn_fps_upg_o_eotech_xps = {
				stance_mod = {
					wpn_fps_lmg_rpk = {
						translation = Vector3( 0.025,-13,-3.35)
					}
				}
			},
			wpn_fps_upg_o_acog = {
				stance_mod = {
					wpn_fps_lmg_rpk = {
						translation = Vector3( 0.025,-13,-3.35 ) + Vector3(0, 6, 0)
					}
				}
			},
			wpn_fps_upg_o_eotech = { 
			stance_mod = {
				wpn_fps_lmg_rpk = {
					translation = Vector3( 0.025,-13,-3.35 ) + Vector3(0, 2, 0)
					}
					}
			},
			wpn_fps_upg_o_aimpoint = { 
			stance_mod = {
				wpn_fps_lmg_rpk = {
					translation = Vector3( 0.025,-13,-3.35 ) + Vector3(0, 2, 0)
					}	
					}
			},
			wpn_fps_upg_o_cs = { 
			stance_mod = {
				wpn_fps_lmg_rpk = {
					translation = Vector3( 0.025,-13,-3.35 ) + Vector3(0, 2, 0)
					}	
					}
			},	
			wpn_fps_upg_o_rx01 = { 
			stance_mod = {
				wpn_fps_lmg_rpk = {
					translation = Vector3( 0.025,-13,-3.35 ) + Vector3(0, 2, 0)
					}
					}
			},	
			wpn_fps_upg_o_docter = { 
			stance_mod = {
				wpn_fps_lmg_rpk = {
						translation = Vector3( 0.025,-13,-3.35)	
					}
				}	
			},	
			wpn_fps_upg_o_t1micro = { 
			stance_mod = {
				wpn_fps_lmg_rpk = {
					translation = Vector3( 0.025,-13,-3.35 ) + Vector3(0, 2, 0)	
					}
				}	
			},
			wpn_fps_upg_o_cmore = { 
			stance_mod = {
				wpn_fps_lmg_rpk = {
						translation = Vector3( 0.025,-13,-3.35)
					}
				}		
			},
			wpn_fps_upg_o_rx30 = { 
			stance_mod = {
				wpn_fps_lmg_rpk = {
					translation = Vector3( 0.025,-13,-3.35 ) + Vector3(0, 2, 0)
					}	
					}
			},
			wpn_fps_upg_o_spot = { 
			stance_mod = {
				wpn_fps_lmg_rpk = {
					translation = Vector3( 0.025,-13,-3.35 ) + Vector3(0, 2, 0)
					}	
					}
			},			
			wpn_fps_upg_o_reflex = { 
			stance_mod = {
				wpn_fps_lmg_rpk = {
						translation = Vector3( 0.025,-13,-3.35)
					}
			}
		}	
}
self.wpn_fps_lmg_hk21.override = {
		wpn_fps_extra_zoom = { 
		stance_mod = {
			wpn_fps_lmg_hk21 = { 
				translation = Vector3( 0.045,-20.36,-3 ) 
				}
			}
		},	
		wpn_fps_upg_o_specter = {
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
			wpn_fps_upg_o_spot = { 
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
self.wpn_fps_lmg_m249.override = {
		wpn_fps_extra_zoom = { 
		stance_mod = {
			wpn_fps_lmg_m249 = { 
				translation = Vector3( 0.02,-3.7,-3.575 )
				}
			}
		},	
		wpn_fps_upg_o_specter = {
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
			wpn_fps_upg_o_spot = { 
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
			wpn_fps_upg_o_spot = { 
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
		wpn_fps_lmg_mg42_b_vg38 = { 
		stance_mod = {
			wpn_fps_lmg_mg42 = { 
				translation = Vector3( 0, 3, 2.1)
				}
			}
		},
		wpn_fps_upg_o_specter = {
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
			wpn_fps_upg_o_spot = { 
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
		wpn_fps_upg_o_spot = { "wpn_fps_ak_extra_ris" }
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
		wpn_fps_upg_o_spot = { "wpn_fps_ass_g3_body_rail" }
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
		wpn_fps_upg_o_spot = { "wpn_fps_snp_mosin_rail" }
}
--RPK
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
table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_spot")
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
table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_spot")
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
table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_spot")
--Brenner
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
table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_spot")
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
table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_spot")
end	
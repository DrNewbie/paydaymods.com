local text_original = LocalizationManager.text
local testAllStrings = false --Set to true to show all string ID's, false to return to normal.
function LocalizationManager:text(string_id, ...)

--Sights and Scopes
return string_id == "bm_wp_upg_o_eotech"					and "EOTech Model 553"
or string_id == "bm_wp_upg_o_t1micro"						and "Aimpoint Weaver-Mounted Micro T-1"
or string_id == "bm_wp_upg_o_docter"						and "DOCTER Sight II Plus"
or string_id == "bm_wp_upg_o_acog"							and "Trijicon ACOG"
or string_id == "bm_wp_upg_o_aimpoint"						and "Aimpoint PRO Rifle Optic 12841"
or string_id == "bm_wp_upg_o_specter"						and "ELCAN Specter DR 1x/4x"
or string_id == "bm_wp_upg_o_cmore"							and "C-MORE Railway ARW"
or string_id == "bm_wp_upg_o_cs"							and "Aimpoint CS"
or string_id == "bm_wp_upg_o_eotech_xps"					and "EOTech Model EXPS3"
or string_id == "bm_wp_upg_o_reflex"						and "Generic Open Reflex Sight"
or string_id == "bm_wp_upg_o_rx01"							and "Trijicon RX01 Polarized Reflex Sight"
or string_id == "bm_wp_upg_o_rx30"							and "Trijicon RX30 Reflex Sight"
or string_id == "bm_wp_upg_o_ak_scopemount"					and "K-VAR KV-045 Optic Mount"
or string_id == "bm_wp_fps_upg_o_45iron"					and "XTI Angle Mount Sight"
or string_id == "bm_wp_upg_o_leupold"						and "Leupold Mk 4 ER/T + BORS"
or string_id == "bm_wpn_fps_o_45rds"						and "Leupold DeltaPoint Pro"
or string_id == "bm_wp_upg_o_box"							and "Pulsar Digisight LRF N960 N970 Night Vision Scope with Rangefinder"
or string_id == "bm_wpg_o_mbus_rear"						and "MBUS Front and Rear Sights"
or string_id == "bm_wpn_fps_upg_o_45iron"					and "XTI Angle Mount Sight"
or string_id == "bm_wp_upg_o_rmr"							and "Trijicon RM06 RMR Sight"

--Melee Weapons
or string_id == "bm_melee_model24"							and "Model 24 Stielhandgranate"
or string_id == "bm_melee_pugio"							and "Extrema Ratio EX314BL Pugio"
or string_id == "bm_melee_gerber"							and "Gerber DMF Auto Modified Clip Point"
or string_id == "bm_melee_gator"							and "Gerber Gator Machete Pro"
or string_id == "bm_melee_kampfmesser"						and "Eickhorn-Solingen KM2000"
or string_id == "bm_melee_kabar"							and "KA-BAR USMC"
or string_id == "bm_melee_becker"							and "KA-BAR Becker TacTool"
or string_id == "bm_melee_bullseye"							and "S&W Bullseye Hatchet"
or string_id == "bm_melee_fairbair"							and "Fairbairn-Sykes Fighting Knife"
or string_id == "bm_melee_taser"							and "ZAP 1M-Volt Stun Baton"
or string_id == "bm_melee_tiger"							and "Tekko-Kagi"
or string_id == "bm_melee_brick"							and "Motorola DynaTAC 8000X"
or string_id == "bm_melee_nin"								and "PALSODE IM360CI 90MM Cordless Gas Framing Nailer"
or string_id == "bm_melee_kabar_tanto"						and "KA-BAR Tanto Blade"
or string_id == "bm_melee_ballistic"						and "USA-Style Ballistic Knives"
or string_id == "bm_melee_tomahawk"							and "Gerber Downrange Tomahawk"
or string_id == "bm_melee_bayonet"							and "'60s 2nd Generation AKM Bayonet"
or string_id == "bm_melee_dingdong"							and "Gerber Ding Dong Breaching Tool"
or string_id == "bm_melee_oldbaton"							and "Monadnock PR-24 Baton"
or string_id == "bm_melee_cqc"								and "Kunai"
or string_id == "bm_melee_buck"								and "'Metal Fist' Buckler"
or string_id == "bm_melee_beardy"							and "Nordic Long-Bearded Axe"
or string_id == "bm_melee_great"							and "Zweihander"
or string_id == "bm_melee_topaz"							and "Black Diamond Cobra Ice Tool"
or string_id == "bm_melee_wing"								and "Balisong"
or string_id == "bm_melee_cs"								and "Homelite Super 2 Chainsaw"

--Throwable Weapons
or string_id == "bm_grenade_frag"							and "M67 Frag Grenade"
or string_id == "bm_concussion"								and "M84 Stun Grenade"
or string_id == "bm_grenade_frag_com"						and "M67 HE Frag Grenade"
or string_id == "bm_wpn_prj_target"							and "Blazing Arrow Ninja Throwing Knife"
or string_id == "bm_wpn_prj_hur"							and "Kit Rae AirCobra Throwing Axe KR0055"

--Magazines
or string_id == "bm_wp_m4_m_straight"						and "STANAG 22rnd Mag"
or string_id == "bm_wp_m4_uupg_m_std"						and "STANAG 38rnd Mag"
or string_id == "bm_wp_m4_m_pmag"							and "Magpul PMAG"
or string_id == "bm_wp_upg_m4_m_quad"						and "STANAG 60rnd Mag"
or string_id == "bm_wp_l85a2_m_emag"						and "Magpul EMAG"
or string_id == "bm_wp_upg_m4_m_l5"							and "L5AWM"
or string_id == "bm_wp_m4_m_quick"							and "Original Magpul 5.56 NATO"
or string_id == "bm_wp_sr2_m_quick"							and "Original Magpul 9mm Veresk Retrofit"

--Suppressors
or string_id == "bm_wp_upg_o_sho_salvo_large"				and "SilencerCo Salvo 12 Suppressor"
or string_id == "bm_wp_upg_ns_sho_salvo_large"				and "SilencerCo Salvo 12 Suppressor"
or string_id == "bm_wp_upg_ns_shot_thick"					and "Chigurh Suppressor"
or string_id == "bm_wp_upg_ns_ass_smg_medium"				and "SAI M80 Supressor Custom"
or string_id == "bm_wp_upg_ns_ass_smg_small"				and "GEMTECH HALO Suppressor"
or string_id == "bm_wp_upg_ns_ass_smg_firepig"				and "Noveske KX3 Flash Suppressor"
or string_id == "bm_wp_upg_ns_ass_smg_stubby"				and "VFC Stinger Flash Hider"
or string_id == "bm_wp_upg_ns_ass_pbs1"						and "PBS-1 Sound Suppressor"
or string_id == "bm_wp_upg_ns_medium_gem"					and "GEMTECH BLACKSIDE-45 Suppressor"
or string_id == "bm_wp_upg_ns_large_kac"					and "Knight's Armament Mk23 Suppressor Custom"
or string_id == "bm_wp_upg_ns_pis_small"					and "Thompson Machine Poseidon Suppressor Custom"
or string_id == "bm_wp_upg_ns_pis_large"					and "SilencerCo Osprey .45 Suppressor"
or string_id == "bm_wp_upg_ns_ass_filter"					and "Oil Filter Suppressor"
or string_id == "bm_wp_mosin_b_sniper"						and "Bramit Suppressor"

--Compensators, Chokes, and Muzzle Brakes
or string_id == "bm_wp_upg_ass_ns_jprifles"					and "JP Standard-Profile Compensator"
or string_id == "bm_wp_upg_ass_ns_linear"					and "KIES Blast Master Linear Compensator"
or string_id == "bm_wp_upg_ass_ns_surefire"					and "SureFire MB556K Muzzle Brake"
or string_id == "bm_wp_ns_battle"							and "BattleComp 2.0 Melonite"
or string_id == "bm_wp_upg_ns_shot_shark"					and "Tromix Shark Brake Door Breacher"
or string_id == "bm_wp_upg_shot_ns_king"					and "King Armory 12ga Breacher"
or string_id == "bm_wp_upg_ns_meatgrinder"					and "WE Tech Tenderizer Compensator"
or string_id == "bm_wp_ns_duck"								and "Duckbill Choke"

--Stocks
or string_id == "bm_wp_m4_s_standard"						and "Bushmaster LE Stock"
or string_id == "bm_wp_m4_s_pts"							and "Magpul PTS Stock"
or string_id == "bm_wp_m4_uupg_s_fold"						and "LR300 Folding Stock"
or string_id == "bm_wp_upg_m4_s_crane"						and "NSWC Crane Stock"
or string_id == "bm_wp_upg_m4_s_mk46"						and "NSWC Crane Stock Custom"
or string_id == "bm_wp_ak_s_folding"						and "Folding AK Stock"
or string_id == "bm_wp_ak_s_skfoldable"						and "Folding AK Stock"
or string_id == "bm_wp_upg_m4_s_ubr"						and "Magpul UBR Collapsible Buttstock Custom"
or string_id == "bm_wp_m37_s_short"							and "Sawed-Off Stock"

--Grips
or string_id == "bm_wp_m4_g_ergo"							and "Command Arms UPG16 Grip"
or string_id == "bm_wp_m4_g_sniper"							and "Generic Weight-Balanced Synthetic Grip"
or string_id == "bm_wp_upg_m4_g_hgrip"						and "Hogue OverMolded Rubber Grip"
or string_id == "bm_wp_upg_m4_g_mgrip"						and "Magpul MOE-K Grip"

--Gadgets
or string_id == "bm_wp_upg_fl_ass_smg_sho_surefire"			and "Surefire Scout Light"
or string_id == "bm_wp_upg_fl_ass_smg_sho_peqbox"			and "Insight Technology AN/PEQ-5"
or string_id == "bm_wp_upg_fl_ass_laser"					and "Offset Laser Mount & Sight"
or string_id == "bm_wp_upg_fl_ass_peq15"					and "Insight Technology AN/PEQ-15"
or string_id == "bm_wp_upg_fl_ass_utg"						and "LT-ELP38 Laser/Light Combo"
or string_id == "bm_wp_upg_fl_pis_tlr1"						and "Streamlight TLR-1"
or string_id == "bm_wp_upg_fl_pis_laser"					and "Generic Universal Laser Sight"
or string_id == "bm_wp_upg_fl_crimson"						and "CN-201 Rail Master Universal Laser Sight"
or string_id == "bm_wp_upg_fl_x400v"						and "SureFire X400V IRc LED Light and Laser Sight"
or string_id == "bm_wp_upg_fl_pis_m3x"						and "Insight Technologies M3X Tactical Illuminator"

--Fire Locking
or string_id == "bm_wp_upg_i_singlefire"					and "Single-Fire Lock" --Singlefire
or string_id == "bm_wp_upg_i_autofire"						and "Full-Auto Lock" --Autofire

--MG42
or string_id == "bm_wp_mg42_b_vg38"							and "DLT-19 Heavy Blaster Rifle Barrel"

--SG552 Commando
or string_id == "bm_wp_ass_s552_fg_standard_green"			and "OD Green Handguard"
or string_id == "bm_wp_ass_s552_fg_railed"					and "SIG SG 553 Railed Handguard"
or string_id == "bm_wp_ass_s552_b_long"						and "SIG SG 552 LB Kit"

--AUG A2
or string_id == "bm_wp_aug_fg_a3"							and "AUG A3 Foregrip"
or string_id == "bm_wp_aug_body_f90"						and "Thales EF88/F90 Receiver"
--L85A2
or string_id == "bm_wp_l85a2_fg_short"						and "GPS-SAW"
--FAMAS F1
or string_id == "bm_wp_famas_b_suppressed"					and "Integrally Suppressed Barrel"
or string_id == "bm_wp_famas_b_long"						and "G2 Civilian Barrel"
or string_id == "bm_wp_famas_b_short"						and "G2 Commando Barrel"
or string_id == "bm_wp_famas_b_sniper"						and "G2 Sniper Barrel"
or string_id == "bm_wp_famas_g_retro"						and "G2 Grip"
--Ak5
or string_id == "bm_wp_ak5_fg_ak5c"							and "Bofors Ak 5C Foregrip"
or string_id == "bm_wp_ak5_fg_fnc"							and "FN FNC Foregrip"
or string_id == "bm_wp_ak5_s_ak5b"							and "FFV Ak 5B Stock"
or string_id == "bm_wp_ak5_s_ak5c"							and "Bofors Ak 5C Stock"
--Sub-2000
or string_id == "bm_wp_sub2000_fg_gen2"						and "Gen 2 Kit"
--FN SCAR-H STD
or string_id == "bm_wp_scar_s_sniper"						and "FN SSR Stock"
or string_id == "bm_wp_scar_b_short"						and "Mk17 CQC Kit"
or string_id == "bm_wp_scar_b_long"							and "Mk17 LB Kit"
or string_id == "bm_wp_scar_scar_fg_railext"				and "PWS SRX Rail Extension"
--M11A SOCOM 16
or string_id == "bm_wp_m14_body_ebr"						and "M1A SOPMOD Chassis"
or string_id == "bm_wp_m14_body_jae"						and "JAE-100 G3 Chassis Custom"
or string_id == "bm_wp_upg_o_m14_scopemount"				and "Mk14 Chassis"

--VHS-D2
or string_id == "bm_wp_vhs_b_short"							and "VHS-K2 Barrel"

--AR Mods
--AR Receivers
or string_id == "bm_wp_upg_ass_m4_lower_reciever_core"		and "CORE15 Lower Receiver"
or string_id == "bm_wp_m4_upper_reciever_edge"				and "VLTOR MUR-1A Upper Receiver"
or string_id == "bm_wp_upg_ass_m4_upper_reciever_ballos"	and "2A-Arms BALIOS-Lite Upper Receiver"
or string_id == "bm_wp_upg_ass_m4_upper_reciever_core"		and "CORE15 Upper Receiver"
--M16A4
or string_id == "bm_wp_m16_fg_railed"						and "Daniel Defense AR15 Lite Rail III Custom"
or string_id == "bm_wp_m16_fg_vietnam"						and "M16A1 Foregrip"
or string_id == "bm_wp_upg_ass_m16_fg_stag"					and "Diamondhead VRS-T Custom"
or string_id == "bm_wp_m4_uupg_b_long"						and ".50 Beowulf Conversion Kit"
--M4A1
or string_id == "bm_wp_m4_uupg_fg_lr300"					and "Z-M LR 300ML Foregrip"
or string_id == "bm_wp_upg_fg_jp"							and "JPHG3-1M Carbon Fibre Custom Foregrip"
or string_id == "bm_wp_upg_fg_smr"							and "Geissele SMR MKIII Foregrip"
or string_id == "bm_wp_upg_ass_m4_fg_lvoa"					and "War Sport LVOA Foregrip Custom"
or string_id == "bm_wp_upg_ass_m4_fg_moe"					and "Magpul MOE SL Hand Guard"
or string_id == "bm_wp_m4_uupg_b_sd"						and "AAC Honey Badger Barrel"

--AK Mods
--AK Barrels
or string_id == "bm_wp_upg_ak_b_draco"						and "Draco Pistol Barrel"
or string_id == "bm_wp_upg_ak_b_ak105"						and "AK-105 Barrel"
or string_id == "bm_wp_upg_ass_ak_b_zastava"				and "Zastava M76 Barrel"
--AK Scope Mount
or string_id == "bm_wp_upg_o_ak_scopemount"					and "K-VAR KV-04S Optic Mount"
--AK Foregrips
or string_id == "bm_wp_ak_fg_combo2"						and "Ultimak AK Optic Mount"
or string_id == "bm_wp_ak_fg_combo3"						and "Ultimak AK Modular Rail Forend System"
or string_id == "bm_wp_upg_ak_fg_tapco"						and "Tapco Intrafuse Handguard"
or string_id == "bm_wp_upg_fg_midwest"						and "Midwest Industries Quad Rail"
or string_id == "bm_wp_upg_ak_fg_krebs"						and "Krebs UFM Keymod System Handguard"
or string_id == "bm_wp_upg_ak_fg_trax"						and "Strike Industries TRAX Handguard"
or string_id == "bm_wp_saiga_fg_lowerrail"					and "Ultimak AK-47 Multi-Rail Forend Custom Retrofit"
or string_id == "bm_wp_saiga_fg_holy"						and "Fuglystick Rail System, 'Cobra' Pattern"
--AK Grips
or string_id == "bm_wp_upg_ak_g_hgrip"						and "Hogue OverMolded AK Pistol Grip"
or string_id == "bm_wp_upg_ak_g_pgrip"						and "US PALM Enhanced Pistol Grip"
or string_id == "bm_wp_upg_ak_g_wgrip"						and "Wooden Grip"
or string_id == "bm_wp_upg_ak_g_rk3"						and "ZenitCo PK-3 Pistol Grip"
--AK Mags
or string_id == "bm_wp_upg_ak_m_quad"						and "Concern Kalashnikov 60rnd Mag"
or string_id == "bm_wp_upg_ak_m_uspalm"						and "US PALM AK30 30rnd Mag"
or string_id == "bm_wp_ak_m_quick"							and "Original Magpul AK Retrofit"
--AK Stocks
or string_id == "bm_wp_upg_ak_s_solidstock"					and "AK-74 Stock"
or string_id == "bm_wp_ak_s_psl"							and "PSL Stock"
--AS VAL Mods
or string_id == "bm_wp_asval_b_proto"						and "SR-3M Barrel"
or string_id == "bm_wp_asval_s_solid"						and "VSS Vintorez Stock"

--SMG Mods
--Kriss Vector
or string_id == "bm_wp_polymer_barrel_precision"			and "CRB Barrel Shroud"
or string_id == "bm_wp_polymer_ns_silencer"					and "Defiance HPS 4GSK"
--IMI Uzi
or string_id == "bm_wp_uzi_b_suppressed"					and "SIONICS 'Whispering Death' Retrofit Custom"
or string_id == "bm_wp_uzi_fg_rail"							and "K-Grip"
--Mac 10/11
or string_id == "bm_wp_cobray_ns_silencer"					and "SIONICS 'Whispering Death'"
or string_id == "bm_wp_mac10_body_ris"						and "G&P CQB Tactical Rail Kit Retrofit"
--Sterling L2A1
or string_id == "bm_wp_sterling_b_e11"						and "E-11 Blaster Rifle Barrel"
or string_id == "bm_wp_sterling_b_suppressed"				and "Sterling L34A1 Barrel"
or string_id == "bm_wp_sterling_b_short"					and "Sterling Mk 7 'Para-Pistol' Barrel"
or string_id == "bm_wp_sterling_m_short"					and "E-11 Blaster Rifle Barrel"
or string_id == "bm_wp_sterling_s_folded"					and "E-11 Blaster Rifle Stock"
--MP5
or string_id == "bm_wp_mp5_fg_mp5sd"						and "MP5SD5 Barrel"
or string_id == "bm_wp_mp5_fg_m5k"							and "MP5K-N Barrel"
or string_id == "bm_wp_mp5_s_ring"							and "MP5K Stock"
or string_id == "bm_wp_mp5_s_adjust"						and "MP5A3 Stock"
or string_id == "bm_wp_mp5_m_straight"						and "10mm Rounds"
--MP7A1
or string_id == "bm_wp_mp7_b_suppressed"					and "H&K MP7 QD Suppressor"
--MP9-NA3
or string_id == "bm_wp_mp9_b_suppressed"					and "MP9 QD Suppressor"
or string_id == "bm_wp_mp9_s_skel"							and "Steyr TMP Stock Retrofit"
--P90
or string_id == "bm_wp_p90_b_long"							and "PS90 Civilian Issue Barrel"
or string_id == "bm_wp_p90_b_civilian"						and "Moerse Lekker Sales Barrel Shroud"
--Bren
or string_id == "bm_wp_hajk_b_short"						and "CZ 805 BREN A2 Barrel"
--Kobra
or string_id == "bm_wp_scorpion_m_extended"					and "Quick-Swap Magazine"

--Pistol Mods
--Glocks
or string_id == "bm_wp_pis_g_laser"							and "Crimson Trace Glock Laser Grip"
or string_id == "bm_wp_pis_g_beavertail"					and "Cytec Beavertail Grip"
--Glock 18c
or string_id == "bm_wp_g18c_g_ergo"							and "Hogue Handall Half-Size Universal Grip Sleeve"
or string_id == "bm_wp_pis_s_stock"							and "FAB Defense GLR-440"
--Beretta 92FS
or string_id == "bm_wp_beretta_co_co1"						and "LA.RI.A AL-GI-MEC Compensator"
or string_id == "bm_wp_beretta_sl_brigadier"				and "92G Elitee II Parkerized Slide"
--Walther PPK
or string_id == "bm_wp_pis_ppk_b_long"						and "Walther PP Slide"

--Sniper Mods
--Blaser R93
or string_id == "bm_wp_r93_body_wood"						and "Blaser R93 Semi-weight Sporting Variant"
--Remington MSR
--or string_id == "bm_wp_model70_ns_suppressor"				and "AAC TITAN-QD Fast-Attach Suppressor"
--Barrett M95
or string_id == "bm_wp_m95_b_barrel_suppressed"				and "QDL Suppressor + Camo Shroud"

or testAllStrings == true and string_id
or text_original(self, string_id, ...)
end
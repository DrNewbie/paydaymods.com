--[[
Real Weapon Names
-old string hijack code thanks to hejoro
-newer string hijack code thanks to Wobin Ralker and Melting Terminal
-imfdb (Most Weapons)
-Payday Wikia (Leupold/Theia Scope)
-/k/anon and Steam friends (Other unidentified attachments and weapons I haven't found or were not ID'd by the two above sources)
	-Comrade Sniper for the MOE SL Handguard
]]
Hooks:Add("LocalizationManagerPostInit", "localization_realnames", function(loc)

	loc:add_localized_strings( {		
		["realnames_string_title"] = "Real Weapon & Mod Names",
		["realnames_string_desc"] = "Options for real weapon & mod names.",
		--
		["realnames_string_reelnames_title"] = "Real Weapon & Mod Names",
		["realnames_string_reelnames_desc"] = "Renames weapons & mods to their IRL counter parts.\nOn by default.",
		--
		["realnames_string_sillynames_title"] = "Silly Name Toggles",
		["realnames_string_sillynames_desc"] = "The below options will take priority over \"Real Weapon & Mod Names\".",
		["realnames_string_upotte_title"] = "\"Upotte!!\" Names",
		["realnames_string_upotte_desc"] = "Renames weapons to reference \"Upotte!!\".\nOff by default.",
		["realnames_string_ocelot_title"] = "Revolver Ocelot",
		["realnames_string_ocelot_desc"] = "Revolver Ocelot (Revolver Ocelot).\nOff by default."
			
	} )

end)


local text_original = LocalizationManager.text
local testAllStrings = false  --Set to true to show all string ID's, false to return to normal.
function LocalizationManager:text(string_id, ...)
		--[[ WE UPOTTE NAO ]]--{
		--[ Faculty ]
		return RealNames._data.upotte == true and string_id == "bm_w_m1928" and "Thompson-sensei"
		--[ Elementary Schoolers ]
		--MP5
		or RealNames._data.upotte == true and string_id == "bm_w_mp5" and "Empi"
		--M10
		or RealNames._data.upotte == true and string_id == "bm_w_mac10" and "Emten"
		--[ Middleschoolers ]
		--AUG
		or RealNames._data.upotte == true and string_id == "bm_w_aug" and "AUG"
		--M16
		or RealNames._data.upotte == true and string_id == "bm_w_m16" and "Ichiroku"
		--L85
		or RealNames._data.upotte == true and string_id == "bm_w_l85a2" and "Eru"
		--M4A1
		or RealNames._data.upotte == true and string_id == "bm_w_m4" and "Em-Four"
		--AK74
		or RealNames._data.upotte == true and string_id == "bm_w_ak74" and "AK74"
		--AKM
		or RealNames._data.upotte == true and string_id == "bm_w_akm" and "AKM"
		--RPK
		or RealNames._data.upotte == true and string_id == "bm_w_rpk" and "RPK"
		--[ Highschoolers ]
		--G3
		or RealNames._data.upotte == true and string_id == "bm_w_g3" and "Jiisuri"
		--M14
		or RealNames._data.upotte == true and string_id == "bm_w_m14" and "Ichiyon"
		--FAL
		or RealNames._data.upotte == true and string_id == "bm_w_fal" and "Faaru"
		--}
	
		--[[ REVOLVER OCELOT ]]--{
		--[[REVOLVER OCELOT]]
		or RealNames._data.ocelot == true and string_id == "bm_w_peacemaker" and "Revolver Ocelot"
		--Long
		or RealNames._data.ocelot == true and string_id == "bm_wp_peacemaker_barrel_long" and "12\" Revolver Ocelot"
		--Short
		or RealNames._data.ocelot == true and string_id == "bm_wp_peacemaker_barrel_short" and "5.5\" Revolver Ocelot"
		--Grip
		or RealNames._data.ocelot == true and string_id == "bm_wp_peacemaker_handle_bling" and "Engraved Revolver Ocelot Grips"
		--Stock
		or RealNames._data.ocelot == true and string_id == "bm_wp_peacemaker_rifle_stock" and "Revolver Ocelot Stock"
		--}
	
		--[[BRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRT]]
		or RealNames._data.reelnames == true and string_id == "bm_w_m134" and "General Electric M134"
		or RealNames._data.reelnames == true and string_id == "bm_wp_m134_barrel_extreme" and "Anti-Air Barrel"
		or RealNames._data.reelnames == true and string_id == "bm_wp_m134_barrel_short" and "Compact Barrel"
		
		--[[WE TERRORIST NAO]]
		or RealNames._data.reelnames == true and string_id == "bm_w_rpg7" and "Bazalt RPG-7"
		
		--[[GOLD SLAVSHIT]]
		or RealNames._data.reelnames == true and string_id == "bm_w_akm_gold" and "Gold Plated AKMS"
		
		--[[JAM733]]
		or RealNames._data.reelnames == true and string_id == "bm_w_amcar" and "Colt M733 Commando"
		
		--[[STEEL BALLS]]
		or RealNames._data.reelnames == true and string_id == "bm_w_ak74" and "Concern Kalashnikov AKS-74"
		
		--[[JAM-4]]
		or RealNames._data.reelnames == true and string_id == "bm_w_m4" and "Colt M4A1" --"Safety Pins"
		--Suppressed Barrel
		or RealNames._data.reelnames == true and string_id == "bm_wp_m4_uupg_b_sd" and "Suppressed Barrel" 
		--Aftermarket
		or RealNames._data.reelnames == true and string_id == "bm_wp_m4_uupg_fg_lr300" and "LR300 Handguard"
		--Competition
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_fg_jp" and "JPE Modular Handguard"
		--Gazelle
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_fg_smr" and "Geissele Super Modular Rail"
		
		--[[AUGLY]]
		or RealNames._data.reelnames == true and string_id == "bm_w_aug" and "Steyr AUG A2"
		--A3 Tact. Foregrip
		or RealNames._data.reelnames == true and string_id == "bm_wp_aug_fg_a3" and "A3 Rail"
		
		--[[WHITE FLAG]] -- :^)
		or RealNames._data.reelnames == true and string_id == "bm_w_famas" and "Nexter FAMAS F1" --"IS THAT A DEAGLE?"
		or RealNames._data.reelnames == true and string_id == "bm_wp_famas_b_sniper" and "G2 Sniper Barrel"
		or RealNames._data.reelnames == true and string_id == "bm_wp_famas_b_short" and "G2 Commando Barrel"
		--Retro Grip
		or RealNames._data.reelnames == true and string_id == "bm_wp_famas_g_retro" and "G1 Kit"
		
		--[[JAM]]
		or RealNames._data.reelnames == true and string_id == "bm_w_l85a2" and "BAE L85A2" --"Eru"
		or RealNames._data.reelnames == true and string_id == "bm_wp_l85a2_b_long" and "Long Barrel"		
		or RealNames._data.reelnames == true and string_id == "bm_wp_l85a2_b_short" and "Short Barrel"		
		or RealNames._data.reelnames == true and string_id == "bm_wp_l85a2_g_worn" and "Taped Pistol Grip"
		or RealNames._data.reelnames == true and string_id == "bm_wp_l85a2_fg_short" and "Daniel Defense L85 Quad Rail"
		
		--[[CROATGAT]]
		or RealNames._data.reelnames == true and string_id == "bm_w_vhs" and "HS Produkt VHS-2"
		or RealNames._data.reelnames == true and string_id == "bm_wp_vhs_b_short" and "Short Barrel"
		or RealNames._data.reelnames == true and string_id == "bm_wp_vhs_b_sniper" and "Sniper Barrel"
		or RealNames._data.reelnames == true and string_id == "bm_wp_vhs_b_silenced" and "Suppressed Barrel"
		
		--[[SLAVSHIT]]
		or RealNames._data.reelnames == true and string_id == "bm_w_akm" and "Concern Kalashnikov AKMS"
		
		--[[MELTGUN]]
		or RealNames._data.reelnames == true and string_id == "bm_w_g36" and "Heckler & Koch G36KV"
		--Compact
		or RealNames._data.reelnames == true and string_id == "bm_wp_g36_fg_c" and "G36c Kit"
		--Polizei
		or RealNames._data.reelnames == true and string_id == "bm_wp_g36_fg_ksk" and "Knights Armament Co. RAS Handguard"  
		--Solid Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_g36_s_kv" and "G36KV Stock"
		--Sniper Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_g36_s_sl8" and "SL8 Stock"
		
		--[[PUNS]]
		or RealNames._data.reelnames == true and string_id == "bm_w_m14" and "Springfield M14 DMR"
		--Abraham
		or RealNames._data.reelnames == true and string_id == "bm_wp_m14_body_ebr" and "MK.14 Kit"
		--Seid ihr das Essen? Nein, wir sind der Jaeger! (watch better anime)
		or RealNames._data.reelnames == true and string_id == "bm_wp_m14_body_jae" and "M14 JAE Kit"
		
		--[[SWED]]
		or RealNames._data.reelnames == true and string_id == "bm_w_ak5" and "Bofors Ak 5" --"FNC's sexy swedish cousin"
		--Karbin Ceres
		or RealNames._data.reelnames == true and string_id == "bm_wp_ak5_fg_ak5c" and "Ak 5c Kit"
		--Belgian Heat
		or RealNames._data.reelnames == true and string_id == "bm_wp_ak5_fg_fnc" and "FN FNC Kit"
		--Bertil
		or RealNames._data.reelnames == true and string_id == "bm_wp_ak5_s_ak5b" and "Ak 5b Stock"
		--Caesar
		or RealNames._data.reelnames == true and string_id == "bm_wp_ak5_s_ak5c" and "Ak 5c Stock"
		
		--[[JAM16]]
		or RealNames._data.reelnames == true and string_id == "bm_w_m16" and "Colt M16A4" --"Orange Slices", "IS THAT A FAMAS?"
		--Railed
		or RealNames._data.reelnames == true and string_id == "bm_wp_m16_fg_railed" and "Daniel Defense Lite Rail" --not a carbon copy, just based off of, if only for the delta ring dongle thing
		--Blast to the Past
		or RealNames._data.reelnames == true and string_id == "bm_wp_m16_fg_vietnam" and "M16A1 Handguard"
		or RealNames._data.reelnames == true and string_id == "bm_wp_m16_s_solid" and "M16 Stock"
		or RealNames._data.reelnames == true and string_id == "bm_wp_m16_s_solid" and "Solid Stock"
		
		--[[553 NO PANTSU]]
		or RealNames._data.reelnames == true and string_id == "bm_w_s552" and "SIG SG 552-2" --"SG550's Little Sister"
		--Enhanced Foregrip
		or RealNames._data.reelnames == true and string_id == "bm_wp_ass_s552_fg_standard_green" and "OD Green Handguard"
		--Enhanced Grip
		or RealNames._data.reelnames == true and string_id == "bm_wp_ass_s552_g_standard_green" and "OD Green Pistol Grip"
		--Enhanced Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_ass_s552_s_standard_green" and "OD Green Stock"	
		--Enhanced Foregrip
		or RealNames._data.reelnames == true and string_id == "bm_wp_ass_s552_fg_black" and "Black Handguard"
		--Enhanced Grip
		or RealNames._data.reelnames == true and string_id == "bm_wp_ass_s552_g_black" and "Black Pistol Grip"
		--Enhanced Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_ass_s552_s_black" and "Black Stock"
		--Railed Foregrip
		or RealNames._data.reelnames == true and string_id == "bm_wp_ass_s552_fg_railed" and "SIG Railed Handguard" --pretty sure Sig manufactures their own rails for the 552/3. Can't be bothered to look :/
		--Heat Treated
		or RealNames._data.reelnames == true and string_id == "bm_wp_ass_s552_body_standard_black" and "Black Receiver" --GJ, Overkill. Heat treating metal, while it does make it harder, also makes it more brittle. Pretty sure you don't want that in a gun
		
		--[[EAG-H]]
		or RealNames._data.reelnames == true and string_id == "bm_w_scar" and "FN MK.17"
		--Sniper Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_scar_s_sniper" and "MK.20 Stock"
		--Rail Extension
		or RealNames._data.reelnames == true and string_id == "bm_wp_scar_fg_railext" and "PWS SCAR Rail Extension"
		
		--[[RIGHT ARM]]
		or RealNames._data.reelnames == true and string_id == "bm_w_fal" and "FN FAL"
		--CQB
		or RealNames._data.reelnames == true and string_id == "bm_wp_fal_body_standard" and "DSA SA58 Handguard w/Short Barrel" --this might conflict with something since this is also the name_id of the receiver		
		or RealNames._data.reelnames == true and string_id == "bm_wp_fal_fg_03" and "IMI Romat Handguard"
		--Marksman
		or RealNames._data.reelnames == true and string_id == "bm_wp_fal_fg_04" and "DSA Freefloat Handguard"
		--Wood
		or RealNames._data.reelnames == true and string_id == "bm_wp_fal_fg_wood" and "Wooden Handguard"
		--Tactical Grip
		or RealNames._data.reelnames == true and string_id == "bm_wp_fal_g_01" and "Tapco FAL/SAW Pistol Grip"
		--Extended Mag
		or RealNames._data.reelnames == true and string_id == "bm_wp_fal_m_01" and "30rnd FAL Magazine"
		--Folding
		or RealNames._data.reelnames == true and string_id == "bm_wp_fal_s_01" and "Sidefolding Stock"
		--Marksman
		or RealNames._data.reelnames == true and string_id == "bm_wp_fal_s_03" and "Magpul FAL PRS Stock"
		
		--[[BOTTLE OPENER]]
		or RealNames._data.reelnames == true and string_id == "bm_w_galil" and "IMI Galil ARM"
		--Sniper
		or RealNames._data.reelnames == true and string_id == "bm_wp_galil_fg_sniper" and "IMI Galatz Handguard & Sniper Barrel"
		--Light
		or RealNames._data.reelnames == true and string_id == "bm_wp_galil_fg_sar" and "IMI Galil SAR Handguard & 13\" Barrel"
		--CQB
		or RealNames._data.reelnames == true and string_id == "bm_wp_galil_fg_mar" and "IMI Galil MAR Handguard & 7\" Barrel"
		--FAB
		or RealNames._data.reelnames == true and string_id == "bm_wp_galil_fg_fab" and "FAB Defense VFR GA Handguard"
		--Sniper Grip
		or RealNames._data.reelnames == true and string_id == "bm_wp_galil_g_sniper" and "IMI Galatz Pistol Grip"
		--Sniper Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_galil_s_sniper" and "IMI Galatz Wooden Stock"
		--Skeletal Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_galil_s_skeletal" and "IMI Galil MAR Stock"
		--Light Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_galil_s_light" and "IMI Galatz Skeleton Stock"
		--FAB Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_galil_s_fab" and "FAB Defense MG-CP Cheek Pad"
		
		--[[MAI RAIFU (SHE'S MINE I TELL YOU)]]
		or RealNames._data.reelnames == true and string_id == "bm_w_g3" and "Heckler & Koch G3"
		--Assault Kit
		or RealNames._data.reelnames == true and string_id == "bm_wp_g3_b_short" and "Short Barrel"
		--DMR Kit
		or RealNames._data.reelnames == true and string_id == "bm_wp_g3_b_sniper" and "PSG-1 Barrel"
		--PSG Foregrip
		or RealNames._data.reelnames == true and string_id == "bm_wp_g3_fg_psg" and "PSG-1 Handguard"
		--Railed Foregrip
		or RealNames._data.reelnames == true and string_id == "bm_wp_g3_fg_railed" and "FAB Defense G3-RS Handguard"
		--Retro Foregrip
		or RealNames._data.reelnames == true and string_id == "bm_wp_g3_fg_retro" and "Wooden Slimline Handguard"
		--Plastic Retro Foregrip
		or RealNames._data.reelnames == true and string_id == "bm_wp_g3_fg_retro_plastic" and "Slimline Handguard"
		--Retro Grip
		or RealNames._data.reelnames == true and string_id == "bm_wp_g3_g_retro" and "G3 Ergo Grip"
		--Sniper Grip
		or RealNames._data.reelnames == true and string_id == "bm_wp_g3_g_sniper" and "PSG-1 Wooden Pistol Grip"
		--Sniper Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_g3_s_sniper" and "PSG-1 Stock"
	
		
		--[[Rattlesnake]]
		or RealNames._data.reelnames == true and string_id == "bm_w_msr" and "Remington MSR"
		--Suppressor
		or RealNames._data.reelnames == true and string_id == "bm_wp_snp_msr_ns_suppressor" and "AAC TiTAN-QD Suppressor"
		--Aluminum Body
		or RealNames._data.reelnames == true and string_id == "bm_wp_msr_body_msr" and "MSR Aluminum Stock & Receiver"
		
		--[[R93]]
		or RealNames._data.reelnames == true and string_id == "bm_w_r93" and  "Blaser R93 Tactical 2"
		or RealNames._data.reelnames == true and string_id == "bm_wp_r93_b_suppressed" and  "Harvester Big Bore 338 Suppressor"
		--Wooden Body
		or RealNames._data.reelnames == true and string_id == "bm_wp_r93_body_wood" and "Long Range Sporter 2 Stock"
		
		--[[FIDDY CAL]]
		or RealNames._data.reelnames == true and string_id == "bm_w_m95" and "Barrett M95"
		--Tank Buster
		or RealNames._data.reelnames == true and string_id == "bm_wp_m95_b_barrel_long" and "Long Barrel w/AW50F Muzzle Brake"
		
		--[[MOIST NUGGET]]
		or RealNames._data.reelnames == true and string_id == "bm_w_mosin" and "Mosin Nagant M91/30"
		or RealNames._data.reelnames == true and string_id == "bm_wp_mosin_b_sniper" and "Nagant Suppressor"--"\"Bramit\" Device"
		--Black Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_mosin_body_conceal" and "Black Synthetic Stock"
		
		
		--[[ELMER FUDD]]
		or RealNames._data.reelnames == true and string_id == "bm_w_huntsman" and "Mosconi Coach Gun"		
		or RealNames._data.reelnames == true and string_id == "bm_wp_huntsman_b_short" and "Sawn-Off Short Barrel"
		or RealNames._data.reelnames == true and string_id == "bm_wp_huntsman_s_short" and "Sawn-Off Stock"
		
		--[[BARDODA SHOTGAT]]
		or RealNames._data.reelnames == true and string_id == "bm_w_b682" and "Beretta 682"
		or RealNames._data.reelnames == true and string_id == "bm_wp_b682_b_short" and "Sawn-Off Short Barrel"
		or RealNames._data.reelnames == true and string_id == "bm_wp_b682_s_short" and "Sawn-Off Stock"
		or RealNames._data.reelnames == true and string_id == "bm_wp_b682_s_ammopouch" and "Ammo Pouch"
		
		--[[870]]
		or RealNames._data.reelnames == true and string_id == "bm_w_r870" and "Remington Model 870" --"Remafdng"
		--Extended Mag
		or RealNames._data.reelnames == true and string_id == "bm_wp_r870_m_extended" and "R870 Lighter Magazine Spring"
		--Zombie Hunter
		or RealNames._data.reelnames == true and string_id == "bm_wp_r870_fg_wood" and "Wooden Pump"
		--Short Enough **don't know
		or RealNames._data.reelnames == true and string_id == "bm_wp_r870_s_nostock" and "No Stock"
		--Short Enough Tact. **don't know
		or RealNames._data.reelnames == true and string_id == "bm_wp_r870_s_nostock_big" and "No Stock w/Full Length Rail"
		--Govt. Stock **don't know
		or RealNames._data.reelnames == true and string_id == "bm_wp_r870_s_solid_big" and "Fixed Stock w/Full Length Rail"
		
		--[[CATS]]
		or RealNames._data.reelnames == true and string_id == "bm_w_saiga" and "Concern Kalashnikov Saiga-12K"
		--Tact. Russian
		or RealNames._data.reelnames == true and string_id == "bm_wp_saiga_fg_lowerrail" and "Ultimak AK Modular Rail Forend System"
		--Saiga 20 rounder
		or RealNames._data.reelnames == true and string_id == "bm_wp_saiga_m_20rnd" and "20rnd MD Arms Saiga Drum"
		
		--[[AA12]]
		or RealNames._data.reelnames == true and string_id == "bm_w_aa12" and "MPS Auto Assault-12 CQB"
		or RealNames._data.reelnames == true and string_id == "bm_wp_aa12_mag_drum" and "20rnd AA-12 Drum"
		or RealNames._data.reelnames == true and string_id == "bm_wp_aa12_barrel_long" and "Standard Barrel"
		
		--[[M1014]]
		or RealNames._data.reelnames == true and string_id == "bm_w_benelli" and "Benelli M4"
		--Long Barrel
		or RealNames._data.reelnames == true and string_id == "bm_wp_ben_b_long" and "Long Barrel w/7-Shot Tube"
		--Short Barrel
		or RealNames._data.reelnames == true and string_id == "bm_wp_ben_b_short" and "NFA Barrel w/4-Shot Tube"
		--Collapsed Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_ben_s_collapsed" and "M1014 Collapsed Stock"
		--Solid Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_ben_fg_standard" and "M1014 Solid Stock" --same deal with the FAL, possible conflict
		
		--[[KELTEC]]
		or RealNames._data.reelnames == true and string_id == "bm_w_ksg" and "Kel-Tec KSG"
		--Long Barrel
		or RealNames._data.reelnames == true and string_id == "bm_wp_ksg_b_long" and "Long Barrel w/2x 8-Shot Tubes"
		--Short Barrel
		or RealNames._data.reelnames == true and string_id == "bm_wp_ksg_b_short" and "Patrol Barrel w/2x 6-Shot Tubes"
		
		--[[WHY DON'T YOU TAKE A SEAT OVER THERE?]]
		or RealNames._data.reelnames == true and string_id == "bm_w_spas12" and "Franchi SPAS-12"
		or RealNames._data.reelnames == true and string_id == "bm_wp_spas12_b_long" and "SPAS-12 8-Shot Tube Magazine"
		
		--[[STREET SWEEPER]]
		or RealNames._data.reelnames == true and string_id == "bm_w_striker" and "Armsel Striker"
		
		--[[BABBY 870]]
		or RealNames._data.reelnames == true and string_id == "bm_w_serbu" and "Short Remington Model 870"
		--Extended Mag
		or RealNames._data.reelnames == true and string_id == "bm_wp_shorty_m_extended_short" and "R870 Light Magazine Spring"
		--Standard
		or RealNames._data.reelnames == true and string_id == "bm_wp_r870_s_solid" and "Fixed Stock"
		--Police Shorty
		or RealNames._data.reelnames == true and string_id == "bm_wp_serbu_s_solid_short" and "Fixed Stock w/Rail"
		--Tactical Shorty
		or RealNames._data.reelnames == true and string_id == "bm_wp_serbu_s_nostock_short" and "No Stock w/Rail"
		
		--[[LONGCAT]]
		or RealNames._data.reelnames == true and string_id == "bm_w_rpk" and "Concern Kalashnikov RPK"
		--Tactical Forgrip
		or RealNames._data.reelnames == true and string_id == "bm_wp_rpk_fg_standard" and "Polymer Handguard"
		--Plastic Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_rpk_s_standard" and "Polymer Stock"
		
		--[[KSP]]
		or RealNames._data.reelnames == true and string_id == "bm_w_m249" and "FN Paratrooper M249"
		--Railed Foregrip
		or RealNames._data.reelnames == true and string_id == "bm_wp_m249_fg_mk46" and "MK.46 Handguard"
		--Solid Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_m249_s_solid" and "M249 Solid Stock"
		
		--[[RELATED TO RAIFU]]
		or RealNames._data.reelnames == true and string_id == "bm_w_hk21" and "Heckler & Koch HK21E" --"Related to mai raifu"
		--Short Foregrip
		or RealNames._data.reelnames == true and string_id == "bm_wp_hk21_fg_short" and "HK21 Short Handguard"
		or RealNames._data.reelnames == true and string_id == "bm_wp_hk21_g_ergo" and "HK21 Ergo Grip"
		
		--[[KERBEROS]]
		or RealNames._data.reelnames == true and string_id == "bm_w_mg42" and "Mauser Maschinengewehr 42"
		--Light Barrel
		or RealNames._data.reelnames == true and string_id == "bm_wp_mg42_b_mg34" and "Maschinengewehr 34 Barrel"
		--Heat Sink (Star Wars)
		or RealNames._data.reelnames == true and string_id == "bm_wp_mg42_b_vg38" and "BlasTech DLT-19 Barrel"
		
		--[[M240]]
		--See: actually a KSP58 trying to look like an M240
		or RealNames._data.reelnames == true and string_id == "bm_w_par" and "FN M240B"
		--Plastic Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_par_s_plastic" and "M240B Stock"
		
		--[[GORDON]]
		or RealNames._data.reelnames == true and string_id == "bm_w_usp" and "Heckler & Koch USP Tactical"
		or RealNames._data.reelnames == true and string_id == "bm_w_x_usp" and "Akimbo H&K USP Tacticals"
		--Ventilated .45 **don't know
		--or RealNames._data.reelnames == true and string_id == "bm_wp_usp_co_comp_1" and "Ventilated .45 Compensator" --I question the existence of this compensator
		--Velocity .45
		or RealNames._data.reelnames == true and string_id == "bm_wp_usp_co_comp_2" and "SJC Compensator .45" --Technically only for the G17 but "Overkill logic" so yeah
		--Extended Mag
		or RealNames._data.reelnames == true and string_id == "bm_wp_pis_usp_m_extended" and "20rnd USP Magazine"
		--Expert
		or RealNames._data.reelnames == true and string_id == "bm_wp_pis_usp_b_expert" and "USP Expert Slide"
		--Match
		or RealNames._data.reelnames == true and string_id == "bm_wp_pis_usp_b_match" and "USP Match Slide"
		
		--[[GRENADE 22]]
		or RealNames._data.reelnames == true and string_id == "bm_w_g22c" and "Glock 22C"
		or RealNames._data.reelnames == true and string_id == "bm_w_x_g22c" and "Akimbo Glock 22Cs"
		--Long Slide
		or RealNames._data.reelnames == true and string_id == "bm_wp_g22c_b_long" and "Glock 35 Compensated Slide"
		
		--[[GRENADE 17]]
		or RealNames._data.reelnames == true and string_id == "bm_w_glock_17" and "Glock 17"
		or RealNames._data.reelnames == true and string_id == "bm_w_x_g17" and "Akimbo Glock 17s"
		
		--[[GRENADE 26]]
		or RealNames._data.reelnames == true and string_id == "bm_wp_pis_g26" and  "Glock 26"
		or RealNames._data.reelnames == true and string_id == "bm_w_jowi" and  "Akimbo Glock 26s"
		
		or RealNames._data.reelnames == true and string_id == "bm_wp_g26_body_salient" and  "Stipled Tan Frame"
		or RealNames._data.reelnames == true and string_id == "bm_wp_g26_b_custom" and  "Brushed Metal Frame"
		or RealNames._data.reelnames == true and string_id == "bm_wp_g26_m_custom" and  "G26 Stipled Tan Magazine"
		
		--[[FAWHTY FAHVE]]
		or RealNames._data.reelnames == true and string_id == "bm_w_colt_1911" and "Springfield Operator 1911" 
		or RealNames._data.reelnames == true and string_id == "bm_w_x_1911" and "Akimbo Springfield Operator 1911s"
		--Aggressor
		or RealNames._data.reelnames == true and string_id == "bm_wp_1911_co_2" and "TCII Compensator" --Not 100% but seems to be based off of it
		--Punisher
		or RealNames._data.reelnames == true and string_id == "bm_wp_1911_co_1" and "Clark Heavy Pinmaster" --Not 100% but seems to be based off of it
		--Ergo Grip
		or RealNames._data.reelnames == true and string_id == "bm_wp_1911_g_ergo" and "Pachmayr 1911 Grip" 
		--Wood Grip
		or RealNames._data.reelnames == true and string_id == "bm_wp_1911_g_bling" and "Walnut Grips." 
		--Engraved Grip
		or RealNames._data.reelnames == true and string_id == "bm_wp_1911_g_engraved" and "Custom Engraved 1911 Grips" 
		--Long
		or RealNames._data.reelnames == true and string_id == "bm_wp_1911_b_long" and "Compensated Long Barrel & Slide" 
		--Vented
		or RealNames._data.reelnames == true and string_id == "bm_wp_1911_b_vented" and "Compensated Two-Tone Slide"
		or RealNames._data.reelnames == true and string_id == "bm_wp_1911_m_extended" and "10rnd 1911 Magazine"
		
		--[[BARDODA]]
		or RealNames._data.reelnames == true and string_id == "bm_w_b92fs" and "Beretta 92FS"
		or RealNames._data.reelnames == true and string_id == "bm_w_x_b92fs" and "Akimbo Beretta 92FSs"
		--Professional
		or RealNames._data.reelnames == true and string_id == "bm_wp_beretta_co_co1" and "SGS Compensator" --Original name was a reference to the movie "The Professional"
		--Competitor
		or RealNames._data.reelnames == true and string_id == "bm_wp_beretta_co_co2" and "Competition Compensator" --Seems to actually be based off of the Shorty USA Beretta 92 Spring Gun, unsurprising considering some of the guns models were based off of airsoft counterparts
		--Extended Mag
		or RealNames._data.reelnames == true and string_id == "bm_wp_beretta_m_extended" and "30rnd 92FS Magazine"
		--Elite Slide
		or RealNames._data.reelnames == true and string_id == "bm_wp_beretta_sl_brigadier" and "Brigadier Elite Slide"
		--Ergo
		or RealNames._data.reelnames == true and string_id == "bm_wp_beretta_g_ergo" and "Walnut Ergo Grips"
		--Engraved
		or RealNames._data.reelnames == true and string_id == "bm_wp_beretta_g_engraved" and "Custom Engraved 92FS Grips"
			
		--[[HUEHUEHUEHUE]]
		or RealNames._data.reelnames == true and string_id == "bm_w_raging_bull" and "Taurus Raging Bull"
		--Mount
		or RealNames._data.reelnames == true and string_id == "bm_wp_pis_rage_extra" and "Raging Bull Scope Mount"
		--Aggressor
		or RealNames._data.reelnames == true and string_id == "bm_wp_rage_b_comp1" and "S&W V-Compensator"
		--Pocket
		or RealNames._data.reelnames == true and string_id == "bm_wp_rage_b_short" and "Snub Nose Barrel"
		--Ventilated
		or RealNames._data.reelnames == true and string_id == "bm_wp_rage_b_comp2" and "S&W Muzzle Compensator"
		--Overcompensating
		or RealNames._data.reelnames == true and string_id == "bm_wp_rage_b_long" and "Long Barrel"
		
		--[[HUEHUEHUEHUE BUT IT'S A SHOTGUN]]
		or RealNames._data.reelnames == true and string_id == "bm_w_judge" and "Taurus 4510PLYFS"
		
		--[[GRENADE 18]]
		or RealNames._data.reelnames == true and string_id == "bm_w_glock_18c" and "Glock 18C"
		--Ventilated **don't know
		--or RealNames._data.reelnames == true and string_id == "bm_wp_g18c_co_1" and "Ventilated Compensator" --I question the existence of this compensator
		--Velocity
		or RealNames._data.reelnames == true and string_id == "bm_wp_g18c_co_comp_2" and "SJC Compensator 9mm"
		
		--[[DEAGLE]]
		or RealNames._data.reelnames == true and string_id == "bm_w_deagle" and "IMI Desert Eagle Mark XIX" --"IS THAT A M16?"
		or RealNames._data.reelnames == true and string_id == "bm_w_x_deagle" and "Akimbo IMI Desert Eagles"
		--Mount
		or RealNames._data.reelnames == true and string_id == "bm_wp_pis_deagle_extra" and "Desert Eagle Scope Mount"
		--La Femme
		or RealNames._data.reelnames == true and string_id == "bm_wp_deagle_co_short" and "Desert Eagle Muzzle Brake" --Original name was a reference to a 1990s film only for the gun's appearance in it, otherwise this is based on a real attachment
		--Overkill
		or RealNames._data.reelnames == true and string_id == "bm_wp_deagle_co_long" and "Custom Barrel Weight" --Attachment is a reference to the Boondock Saints
		--Ergo
		or RealNames._data.reelnames == true and string_id == "bm_wp_deagle_g_ergo" and "Pachmayr Desert Eagle Grip" --These don't exist but it's the same model from the 1911 but enlarged so w/e
		--Bling
		or RealNames._data.reelnames == true and string_id == "bm_wp_deagle_g_bling" and "Desert Eagle Pearl Grips"
		--Extended Mag
		or RealNames._data.reelnames == true and string_id == "bm_wp_deagle_m_extended" and "10rnd Desert Eagle Magazine" --Given the length of the mag and considering the .50 AE variant is single stack only, this is the only choice. Not that it matters that there's more ammo than what's stated *cough* 1911 12rnd Mag *cough*
		--Long Barrel
		or RealNames._data.reelnames == true and string_id == "bm_wp_deagle_b_long" and "10\" Long Barrel"
		
		
		--[[JAMES BOND]]
		or RealNames._data.reelnames == true and string_id == "bm_w_ppk" and "Walther PPK"
		--Laser Grip
		or RealNames._data.reelnames == true and string_id == "bm_wp_pis_ppk_g_laser" and "Crimson Trace Laser Grip"
		--Long Side
		or RealNames._data.reelnames == true and string_id == "bm_wp_pis_ppk_b_long" and "PPKS Slide"
		
		--[[40 SW IS A SHIT ROUND]]
		or RealNames._data.reelnames == true and string_id == "bm_w_p226" and "Sig Sauer P226R"
		--Ventilated .40 **don't know
		--or RealNames._data.reelnames == true and string_id == "bm_wp_p226_co_comp_1" and "Ventilated .40 Compensator" --I question the existence of this compensator
		--Velocity .40
		or RealNames._data.reelnames == true and string_id == "bm_wp_p226_co_comp_2" and "SJC Compensator .40" --Technically only for the G17 but "Overkill logic" so yeah
		--Extended Mag
		or RealNames._data.reelnames == true and string_id == "bm_wp_p226_m_extended" and "22rnd P226 Magazine" --Not too sure if this exists, just basing it off of the fact the "22" is plastered all over the damn thing
		--Two-Tone
		or RealNames._data.reelnames == true and string_id == "bm_wp_p226_b_equinox" and "Equinox Duo-Tone Slide"
		--Long Slide
		or RealNames._data.reelnames == true and string_id == "bm_wp_p226_b_long" and "Brushed Long Slide"
		
		--[[LEO]]
		or RealNames._data.reelnames == true and string_id == "bm_w_hs2000" and "Springfield Armory XD(M)-40" --Fuck the texture labels, it's a XD(M)
		--Extended Mag
		or RealNames._data.reelnames == true and string_id == "bm_wp_hs2000_m_extended" and "22rnd XD(M)-40 Magazine"
		--Custom Slide
		or RealNames._data.reelnames == true and string_id == "bm_wp_hs2000_sl_custom" and "Compensated Slide"
		--Long Slide
		or RealNames._data.reelnames == true and string_id == "bm_wp_hs2000_sl_long" and "Custom Slide"
		
		--[[RED 9]]
		or RealNames._data.reelnames == true and string_id == "bm_w_c96" and "Mauser C96"
		--Long Barrel
		or RealNames._data.reelnames == true and string_id == "bm_wp_c96_b_long" and "Carbine Barrel"
		--Han Solo
		or RealNames._data.reelnames == true and string_id == "bm_wp_c96_nozzle" and "DL-44 Muzzle"
		--Scope
		or RealNames._data.reelnames == true and string_id == "bm_wp_c96_sight" and "Schmidt & Bender 1-8x24 PM Short Dot"
		--20rnd Mag
		or RealNames._data.reelnames == true and string_id == "bm_wp_c96_m_extended" and "20rnd C96 Magazine"
	
		--[[EVENFASTERRUNONSENTENCES]]
		or RealNames._data.reelnames == true and string_id == "bm_w_cobray" and "Cobray M11/9"
		
		or RealNames._data.reelnames == true and string_id == "bm_wp_cobray_ns_barrelext" and "MAC Barrel Extension"
		or RealNames._data.reelnames == true and string_id == "bm_wp_cobray_ns_silencer" and "SIONICS Suppressor"	
		
		--[[RUNONSENTENCES]]
		or RealNames._data.reelnames == true and string_id == "bm_w_mac10" and "Ingram M10"
		--Extended Mag
		or RealNames._data.reelnames == true and string_id == "bm_wp_mac10_m_extended" and "30rnd M10 Magazine"
		--Railed Handguard
		or RealNames._data.reelnames == true and string_id == "bm_wp_mac10_body_ris" and "MAC Rail System" --I'm getting nothing but airsoft results so generic name
		--Skeletal Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_mac10_s_skel" and "Low Mount Skeleton Stock"	
		
		--[[THOMPSON SENSEI]]
		or RealNames._data.reelnames == true and string_id == "bm_w_m1928" and "Auto-Ordnance M1928"
		--Short Barrel
		or RealNames._data.reelnames == true and string_id == "bm_wp_m1928_b_short" and "Short Barrel"
		--Dis. Foregrip
		or RealNames._data.reelnames == true and string_id == "bm_wp_m1928_fg_discrete" and "Synthetic Foregrip"	--for once it's actually a foregrip
		--Dis. Pistol Grip
		or RealNames._data.reelnames == true and string_id == "bm_wp_m1928_g_discrete" and "Synthetic Pistol Grip"	
		--Dis. Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_m1928_s_discrete" and "Synthetic Stock"
		
		
		--[[MAI RAIFU'S LITTLE SISTER AND STUDENT COUNCIL PRESIDENT OF THE ELEMETARY SCHOOL]]
		or RealNames._data.reelnames == true and string_id == "bm_w_mp5" and "Heckler & Koch MP5A4" --"Empi"
		or RealNames._data.reelnames == true and string_id == "bm_w_x_mp5" and "Akimbo MP5A4s" --"Empi"
		--Sehr Kurze
		or RealNames._data.reelnames == true and string_id == "bm_wp_mp5_fg_m5k" and "MP5k Tri-Rail Kit"
		--Polizei Tactical
		or RealNames._data.reelnames == true and string_id == "bm_wp_mp5_fg_mp5a5" and "MP5 Railed Handguard"
		--Ninja
		or RealNames._data.reelnames == true and string_id == "bm_wp_mp5_fg_mp5sd" and "MP5SD Kit"
		--Adjustable
		or RealNames._data.reelnames == true and string_id == "bm_wp_mp5_s_adjust" and "Retractable Stock"
		--Bare Essentials
		or RealNames._data.reelnames == true and string_id == "bm_wp_mp5_s_ring" and "No Stock" --"No Pantsu"
		--MP5 Drum
		or RealNames._data.reelnames == true and string_id == "bm_wp_mp5_m_drum" and "110rnd GSG-5 .22lr Drum"
	
		--[[SLING STOCKS ARE 2LEWD]]
		or RealNames._data.reelnames == true and string_id == "bm_w_mp9" and "Brugger & Thomet TP9SF"
		--Extended Mag
		or RealNames._data.reelnames == true and string_id == "bm_wp_mp9_m_extended" and "30rnd MP9 Magazine"
		--Skeletal Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_mp9_s_skel" and "Steyr TMP Fixed Stock"
		
		--[[IT STINGS]]
		or RealNames._data.reelnames == true and string_id == "bm_w_scorpion" and "CZ Skorpion vz. 61"
		or RealNames._data.reelnames == true and string_id == "bm_wp_scorpion_m_extended" and "Dual Magazines"
		or RealNames._data.reelnames == true and string_id == "bm_wp_scorpion_b_suppressed" and "Skorpion Suppressor"
		
		--[[NOT THE STUDENT COUNCIL PRESIDENT (get FUCKED)]]
		or RealNames._data.reelnames == true and string_id == "bm_w_uzi" and "IMI Uzi"
		or RealNames._data.reelnames == true and string_id == "bm_wp_uzi_s_solid" and "Wooden Stock"
		or RealNames._data.reelnames == true and string_id == "bm_wp_uzi_fg_rail" and "FAB Defense Uzi Tri-Rail System"
		or RealNames._data.reelnames == true and string_id == "bm_wp_uzi_b_suppressed" and "IMI Two-Stage Suppressor" --It's IMI made but it was never imported. No idea what the model name is.
		
		--[[B-BAKA]]
		or RealNames._data.reelnames == true and string_id == "bm_w_baka" and "IMI Micro Uzi"
		
		--[[S-COOL SHOOTINGS]]
		or RealNames._data.reelnames == true and string_id == "bm_w_tec9" and "Intratec TEC-9"
		or RealNames._data.reelnames == true and string_id == "bm_wp_tec9_b_standard" and "AB-10 Barrel"
		or RealNames._data.reelnames == true and string_id == "bm_wp_tec9_ns_ext" and "TEC-9 Pseudo Barrel Extension"
		or RealNames._data.reelnames == true and string_id == "bm_wp_tec9_s_unfolded" and "Interdynamic MP-9 Wire Stock"
		or RealNames._data.reelnames == true and string_id == "bm_wp_tec9_m_extended" and "50rnd TEC-9 Magazine"
		
		--[[I PLAE SAINTS ROW]]
		or RealNames._data.reelnames == true and string_id == "bm_w_sr2" and "TsNIITochMash SR-2M \"Veresk\""
		or RealNames._data.reelnames == true and string_id == "bm_w_x_sr2" and "Akimbo SR-2Ms"
		
		--[[NOT A STEN]]
		or RealNames._data.reelnames == true and string_id == "bm_w_sterling" and "Sterling L2A1"
		--Supp. Barrel
		or RealNames._data.reelnames == true and string_id == "bm_wp_sterling_b_suppressed" and "L34A1 Barrel"
		--Heat Sink Barrel
		or RealNames._data.reelnames == true and string_id == "bm_wp_sterling_b_e11" and "BlasTech E-11 Barrel"
		--10rnd Mag
		or RealNames._data.reelnames == true and string_id == "bm_wp_sterling_m_short" and "10rnd L2A1 Magazine"
		--34rnd Mag
		or RealNames._data.reelnames == true and string_id == "bm_wp_sterling_m_long" and "34rnd L2A1 Magazine"
	
		--[[BABBY AR]]
		or RealNames._data.reelnames == true and string_id == "bm_w_olympic" and "Olympic Arms K23B Tactical"
		
		--Railed Handguard
		or RealNames._data.reelnames == true and string_id == "bm_wp_olympic_fg_railed" and "KAC Free Float Handguard" --a super short version at that, shares the delta ring so I'm assuming this is what it's based off of
		--Shorter Than Short
		or RealNames._data.reelnames == true and string_id == "bm_wp_olympic_s_short" and "Buffer Tube Stock" 
		
		--[[BABBY SLAVSHIT]]
		or RealNames._data.reelnames == true and string_id == "bm_w_akmsu" and "Soviet Union AKMSU"
		or RealNames._data.reelnames == true and string_id == "bm_w_x_akmsu" and "Akimbo AKMSUs"
		--Moscow Special
		or RealNames._data.reelnames == true and string_id == "bm_wp_akmsu_fg_rail" and "Samson K-Rail" --Seems to be loosely based off of the Samson K-Rail, it's the only thing that looked remotely like this
		
		--[[OVERPRICED 22LR]]
		or RealNames._data.reelnames == true and string_id == "bm_w_p90" and "FN P90 TR"
		--Long Barrel
		or RealNames._data.reelnames == true and string_id == "bm_wp_p90_b_long" and "PS90 Barrel"
		
		--[[LOL SWEDS]]
		or RealNames._data.reelnames == true and string_id == "bm_w_m45" and "Carl Gustaf Kpist M/45"
		--Extended Mag
		or RealNames._data.reelnames == true and string_id == "bm_wp_smg_m45_m_extended" and "50rnd M/45 Magazine"
		
		--[[YOU SUCK AND WE HATE YOU]]
		or RealNames._data.reelnames == true and string_id == "bm_w_mp7" and "Heckler & Koch MP7A2"
		--B&T Suppressor
		or RealNames._data.reelnames == true and string_id == "bm_wp_mp7_b_suppressed" and "B&T MP7 Rotex-II Suppressor"	
		--Extended Mag
		or RealNames._data.reelnames == true and string_id == "bm_wp_mp7_m_extended" and "MP7 40rnd Magazine"
		--Extended Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_mp7_s_long" and "Extended Stock"
		
		--[[DEMOMAN]]
		or RealNames._data.reelnames == true and string_id == "bm_w_gre_m79" and "Springfield Armory M79 Grenade Launcher"
		
		--[[NADE SPAM]]
		or RealNames._data.reelnames == true and string_id == "bm_w_m32" and "Milkor Grenade Launcher"
		
		--[[HONG MEI LING]]
		or RealNames._data.reelnames == true and string_id == "bm_w_china" and "\"China Lake\" Grenade Launcher"
		
		--[[REVOLVER OCELOT]]
		or RealNames._data.reelnames == true and string_id == "bm_w_peacemaker" and "Colt Single Action Army" --"Revolver Ocelot"
		--Long
		or RealNames._data.reelnames == true and string_id == "bm_wp_peacemaker_barrel_long" and "12\" Barrel"
		--Short
		or RealNames._data.reelnames == true and string_id == "bm_wp_peacemaker_barrel_short" and "5.5\" Barrel"
		--Grip
		or RealNames._data.reelnames == true and string_id == "bm_wp_peacemaker_handle_bling" and "Engraved SAA Grips"
		--Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_peacemaker_rifle_stock" and "Skeletal Stock"
			
		--[[Winchester]]--
		or RealNames._data.reelnames == true and string_id == "bm_w_winchester1874" and "Winchester Model 1873"
		--Long
		or RealNames._data.reelnames == true and string_id == "bm_wp_winchester_b_long" and "Long Barrel"
		--Supp
		or RealNames._data.reelnames == true and string_id == "bm_wp_winchester_b_suppressed" and "Suppressor"
		
		--[[TOASTY]]
		or RealNames._data.reelnames == true and string_id == "bm_wp_fla_mk2_mag_rare" and "Propane"
		or RealNames._data.reelnames == true and string_id == "bm_wp_fla_mk2_mag_welldone" and "Napalm"
		
		--[[TOGUSA]] --GiTS references abound!
		or RealNames._data.reelnames == true and string_id == "bm_w_mateba" and "Mateba 2006M"
		--Long
		or RealNames._data.reelnames == true and string_id == "bm_wp_2006m_b_long" and "8\" Barrel"
		--Med
		or RealNames._data.reelnames == true and string_id == "bm_wp_2006m_b_medium" and "5\" Barrel"
		--Short
		or RealNames._data.reelnames == true and string_id == "bm_wp_2006m_b_short" and "2\" Barrel"
		
		--[[AS Val]]
		or RealNames._data.reelnames == true and string_id == "bm_w_asval" and "Tula Arms AS \"Val\""
		--Short
		or RealNames._data.reelnames == true and string_id == "bm_wp_asval_b_proto" and "Prototype Barrel"
		--VSS
		or RealNames._data.reelnames == true and string_id == "bm_wp_asval_s_solid" and "VSS Kit"
			
		--[[SUB 2000]]
		or RealNames._data.reelnames == true and string_id == "bm_w_sub2000" and "Kel-Tec SUB-2000"
		--Handguards
		or RealNames._data.reelnames == true and string_id == "bm_wp_sub2000_fg_gen2" and "Gen2 Handguard"
		or RealNames._data.reelnames == true and string_id == "bm_wp_sub2000_fg_railed" and "Red Lion R6 Handguard"
		or RealNames._data.reelnames == true and string_id == "bm_wp_sub2000_fg_suppressed" and "Quad Rail Handguard w/Suppressor"
		
		--XXX Boner
		or RealNames._data.reelnames == true and string_id == "bm_w_hunter" and "Avalanche CB1-50 Pistol Grip Crossbow"
		or RealNames._data.reelnames == true and string_id == "bm_w_frankish" and "Basic Crossbow"
		or RealNames._data.reelnames == true and string_id == "bm_w_arblast" and "Arbalest Crossbow"
		
		--[[2000 crying babies]]
		or RealNames._data.reelnames == true and string_id == "bm_w_wa2000" and "Walther WA2000"
		--Long
		or RealNames._data.reelnames == true and string_id == "bm_wp_wa2000_b_long" and "Long Barrel"
		--Supp.
		or RealNames._data.reelnames == true and string_id == "bm_wp_wa2000_b_suppressed" and "Suppressor"
		--Light
		or RealNames._data.reelnames == true and string_id == "bm_wp_wa2000_g_light" and "Lightweight Furniture"
		--Black
		or RealNames._data.reelnames == true and string_id == "bm_wp_wa2000_g_stealth" and "Black Furniture"
		--Walnut
		or RealNames._data.reelnames == true and string_id == "bm_wp_wa2000_g_walnut" and "Walnut Furniture"
		
		--[[Vector]]
		or RealNames._data.reelnames == true and string_id == "bm_w_polymer" and "KRISS Vector SMG"
		--CRB
		or RealNames._data.reelnames == true and string_id == "bm_wp_polymer_barrel_precision" and "CRB Barrel w/Shroud"
		--Supp
		or RealNames._data.reelnames == true and string_id == "bm_wp_polymer_ns_silencer" and "Defiance HPS 4GSK Suppressor"
		
		--[[JERRY CAN]]
		or RealNames._data.reelnames == true and string_id == "bm_w_sparrow" and "IMI Jericho 941 RPL"
		or RealNames._data.reelnames == true and string_id == "bm_wp_sparrow_body_941" and "IMI Jericho 941 F Kit"
		or RealNames._data.reelnames == true and string_id == "bm_wp_sparrow_g_cowboy" and "Weighted Grip"
		
		--[[Model 70]]
		or RealNames._data.reelnames == true and string_id == "bm_w_model70" and "Winchester Model 70"
		
		--[[Model 37]]
		or RealNames._data.reelnames == true and string_id == "bm_w_m37" and "Ithaca Model 37 Homeland Security"
		
		--[[PL-14]]
		or RealNames._data.reelnames == true and string_id == "bm_w_pl14" and "Concern Kalashnikov PL-14 \"Lebedev\""
		--Barrel Ext.
		or RealNames._data.reelnames == true and string_id == "bm_wp_pl14_m_extended" and "PL-14 Magazine Extension"
		--Barrel Ext.
		or RealNames._data.reelnames == true and string_id == "bm_wp_pl14_b_comp" and "Ported Compensator"
		
		--[[LOL DRUMS]]
		or RealNames._data.reelnames == true and string_id == "bm_w_tecci" and "Heckler & Koch HK416-C"
		or RealNames._data.reelnames == true and string_id == "bm_wp_tecci_b_long" and "Long Barrel"
		or RealNames._data.reelnames == true and string_id == "bm_wp_tecci_ns_special" and "JPE Recoil Eliminator Muzzle Brake"
		
		--[[Muh Range]]
		or RealNames._data.reelnames == true and string_id == "bm_w_boot" and "Winchester Model 1887"
		--Body
		or RealNames._data.reelnames == true and string_id == "bm_wp_boot_body_exotic" and "Case Hardened Reciever"
		
		--[[Not the same Bren]]
		or RealNames._data.reelnames == true and string_id == "bm_w_hajk" and "CZ 805 BREN"
		--Short Barrel
		or RealNames._data.reelnames == true and string_id == "bm_wp_hajk_b_short" and "A2 Barrel"
		
		--[[WEAPON MODS]]
		--Ported
		or RealNames._data.reelnames == true and string_id == "bm_wp_ns_battle" and "Battlecomp 2.0 Compensator"
		--MP5 10mm Magazine
		or RealNames._data.reelnames == true and string_id == "bm_wp_mp5_m_straight" and "30rnd MP5/10 10mm Magazine"
		--AK5 CQB
		or RealNames._data.reelnames == true and string_id == "bm_wp_ak5_b_short" and "Short Barrel" 
		--AUG Raptor
		or RealNames._data.reelnames == true and string_id == "bm_wp_aug_body_f90" and "Thales F90 Body Kit"
		--SALVO
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ns_sho_salvo_large" and "SilencerCo Salvo 12 Suppressor"
		--MP9 Suppressor
		or RealNames._data.reelnames == true and string_id == "bm_wp_mp9_b_suppressed" and "B&T MP9 QD Suppressor"
		--BIG BOSS
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ns_pis_jungle" and "Big Boss Suppressor"
		--Filter
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ns_ass_filter" and "Filter Suppressor"
		--M14 Scope Mount
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_o_m14_scopemount" and "Sun Optics USA M14/M1A Scope Mount"
		--LED Combo
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_fl_ass_utg" and "UTG P38 LED Laser Combo"
		--M3X
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_fl_pis_m3x" and "Insight Technology M3X"
		--P90 Civ
		or RealNames._data.reelnames == true and string_id == "bm_wp_p90_b_civilian" and "Moerse Lekker Barrel Shroud"
		
		
		--AK Crab Rail
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ak_fg_krebs" and "Krebs UFM Keymod System Handguard"
		--AK Keymod Rail
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ak_fg_trax" and "Strike Industries TRAX Handguard"
		--AK Aluminum Grip
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ak_g_rk3" and "ZenitCo PK-3 Pistol Grip"
		--AK Aluminum Foregrip
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ak_fg_zenit" and "ZenitCo Handguard"
		--Scope Mount
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_o_ak_scopemount" and "K-VAR KV-04S Optic Mount"
		--Low Drag Magazine
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ak_m_uspalm" and "30rnd US PALM AK30 Magazine"
		--PBS Suppressor
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ns_ass_pbs1" and "PBS-1 Suppressor"
		--DMR Kit
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ass_ak_b_zastava" and "Zastava M76 Barrel"
		--Modern Barrel
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ak_b_ak105" and "AK-105 Barrel"
		
		--Exotique Receiver
		or RealNames._data.reelnames == true and string_id == "bm_wp_m4_upper_reciever_edge" and "VLTOR Upper Receiver"
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ass_m4_upper_reciever_ballos" and "2A-Arm BALIOS Upper Receiver" --????
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ass_m4_upper_reciever_core" and "CORE15 Upper Receiver"
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ass_m4_lower_reciever_core" and "CORE15 Lower Receiver"
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_m4_s_ubr" and "Magpul UBR Stock"
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_m4_m_l5" and "30rnd Lancer Systems L5 AW Magazine"
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_smg_olympic_fg_lr300" and "Short LR300 Handguard"
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ass_m16_fg_stag" and "Stag Arms Model 8T Handguard"
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ass_m4_fg_moe" and "Magpul MOE SL Handguard"		
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ass_m4_fg_lvoa" and "War Sport LVOA Handguard"
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ass_m4_b_beowulf" and "Beowulf Barrel"
		
		--Bipod
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_lmg_lionbipod" and "Bipod"
		
		--Single Fire
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_i_singlefire" and "Single Fire Mod"
		--Auto Fire
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_i_autofire" and "Auto Fire Mod"
		
		--Pistol Light
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_fl_pis_tlr1" and "Streamlight TLR1"
		--Pistol Laser
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_fl_pis_laser" and "Aim Sports LH002 Laser Sight" 
		--Pistol Laser
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_fl_x400v" and "SureFire X400V-IRC"
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_fl_crimson" and "Crimson Trace CMR-201"
		
		or RealNames._data.reelnames == true and string_id == "bm_wp_pis_g_laser" and "Crimson Trace Glock Laser Grip"
		or RealNames._data.reelnames == true and string_id == "bm_wp_pis_g_beavertail" and "Beavertail Grip Extension"
		
		--Assault Light
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_fl_ass_smg_sho_surefire" and "Surefire Scout Light" 
		--Compact Laser
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_fl_ass_laser" and "Offset Laser Mount & Sight"
		--Tactical Laser
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_fl_ass_smg_sho_peqbox" and "Insight Technology AN/PEQ-5"
		--Military Laser 
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_fl_ass_peq15" and "Insight Technology AN/PEQ-15"
	
		--Shark Teeth
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ns_shot_shark" and "Tromix Shark Breaching Brake"
		--King's Crown
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_shot_ns_king" and "King Armory KA-1212 Breaching Brake"
		
		--Pistol Flash Hider
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_pis_ns_flash" and "CCF Titanium Flash Suppressor"
	
		--Low Profile Suppressor
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ns_ass_smg_small" and "GemTech HALO Suppressor" --not 100% but I can't find any other suppressor that is similar to this one's two-piece construction and the ability to wrap around an A2 style muzzle brake
		--Medium Suppressor
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ns_ass_smg_medium" and "Small Arms Industries M80 Suppressor" --Thanks Overkill for being vauge as fuck, I'm surprised I even found this
		--Bigger the Better **Don't know
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ns_ass_smg_large" and "Large Suppressor"
		
		--Size Doesn't Matter 
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ns_pis_small" and "Thompson Machine Poseidon Suppressor"	
		--Standard Issue
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ns_pis_medium" and "GemTech SFN Suppressor" --Close enough... it's sectioned similarly enough for me to just name it this
		--Monolith 
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ns_pis_large" and "SilencerCo Osprey Suppressor"		
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ns_medium_gem" and "GemTech Blackside Suppressor"		
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ns_large_kac" and "KAC MK.23 Suppressor"
		
		--Shotgun Suppressor
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ns_shot_thick" and "Shotgun Suppressor"
		
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ns_meatgrinder" and "Standoff Muzzle Device"
		
		--Stubby
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ns_ass_smg_stubby" and "Stinger Flash Hider" --Based on the VFC Stinger's pseudo flash-hider
		--Tank **Don't know, could quite literally be based off of a tank compensator
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ns_ass_smg_tank" and "Tank Compensator"
		--Firebreather
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ns_ass_smg_firepig" and "Noveske KX3 Compensator"
		
		--Competitors
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ass_ns_jprifles" and "JPE Bennie Cooley Muzzle Brake"
		--Funnel of Fun
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ass_ns_linear" and "KIES Blast Master Linear Compensator"
		--Tactical
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ass_ns_surefire" and "Surefire MBK Muzzle Brake"
		
		--Muldon
		or RealNames._data.reelnames == true and string_id == "bm_wp_r870_s_folding" and "R870 Top Folding Stock"
		
		--Standard
		or RealNames._data.reelnames == true and string_id == "bm_wp_m4_s_standard" and "Bushmaster LE Stock"
		--Tactical
		or RealNames._data.reelnames == true and string_id == "bm_wp_m4_s_pts" and "Magpul PTS Stock"
		--Folding
		or RealNames._data.reelnames == true and string_id == "bm_wp_m4_uupg_s_fold" and "LR300 Folding Stock"
		--Wide
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_m4_s_crane" and "NSWC Crane Stock"
		--War-Torn
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_m4_s_mk46" and "NSWC Crane Stock w/Cheek Pad"
		
		--Folding Stock (underfolder)
		or RealNames._data.reelnames == true and string_id == "bm_wp_ak_s_folding" and "Underfolding AK Stock"
		--Folding Stock (sidefolder)
		or RealNames._data.reelnames == true and string_id == "bm_wp_ak_s_skfoldable" and "Sidefolding AK Stock"
		--Wooden Sniper Stock
		or RealNames._data.reelnames == true and string_id == "bm_wp_ak_s_psl" and "PSL Thumbhole Stock"
		
		--Ergo (Glocks)
		or RealNames._data.reelnames == true and string_id == "bm_wp_g18c_g_ergo" and "Hogue Handall Grip Sleeve"
		--Ergo
		or RealNames._data.reelnames == true and string_id == "bm_wp_m4_g_ergo" and "Command Arms UPG16 Pistol Grip"
		--Pro
		or RealNames._data.reelnames == true and string_id == "bm_wp_m4_g_sniper" and "PSG Style Pistol Grip" --there are a bunch of grips styled after the PSG-1's grip but the one in PD2 doesn't seem to take from any specific real-life model
		--Rubber
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_m4_g_hgrip" and "Hogue OverMolded AR Pistol Grip"
		--Straight
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_m4_g_mgrip" and "Magpul MOE-K Pistol Grip"
		
		--Rubber
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ak_g_hgrip" and "Hogue OverMolded AK Pistol Grip"
		--Plastic
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ak_g_pgrip" and "US PALM Enhanced Pistol Grip"
		
		--Wood Rail
		or RealNames._data.reelnames == true and string_id == "bm_wp_ak_fg_combo2" and "Ultimak AK Optic Mount"
		--Tact. Russian
		or RealNames._data.reelnames == true and string_id == "bm_wp_ak_fg_combo3" and "Ultimak AK Modular Rail Forend System"
		--Battleproven
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ak_fg_tapco" and "Tapco Intrafuse Handguard" --This is actually for the Saiga. lolOverkill
		--Lightweight
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_fg_midwest" and "Midwest Industries Quad Rail"
		
		--Slav. Dragon
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ak_b_draco" and "Draco Pistol Barrel"
		--Extended Mag (Glocks)
		or RealNames._data.reelnames == true and string_id == "bm_wp_g18c_m_mag_33rnd" and "33/22rnd Glock Magazine (9mm/.40S&W)"	
		--Vintage Mag
		or RealNames._data.reelnames == true and string_id == "bm_wp_m4_m_straight" and "20rnd STANAG Magazine" --Hesitant to call them this since they're so off-model and resemble the M4A1 mags used in MW3
		or RealNames._data.reelnames == true and string_id == "bm_wp_m4_m_straight_vanilla" and "20rnd STANAG Magazine"
		--Milspec Mag
		or RealNames._data.reelnames == true and string_id == "bm_wp_m4_uupg_m_std" and "30rnd STANAG Magazine"
		--Tactical Mag
		or RealNames._data.reelnames == true and string_id == "bm_wp_m4_m_pmag" and "30rnd Magpul PMAG Magazine"
		--Expert Mag
		or RealNames._data.reelnames == true and string_id == "bm_wp_l85a2_m_emag" and "30rnd Magpul EMAG Magazine"
		--CAR Quad
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_m4_m_quad" and "60rnd Surefire Magazine"
		--AK Quad
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_ak_m_quad" and "60rnd Concern Kalashnikov Magazine"
		--Beta-C
		or RealNames._data.reelnames == true and string_id == "bm_wp_m4_m_drum" and "100rnd Beta-C Dual Drum"
		--AK Drum
		or RealNames._data.reelnames == true and string_id == "bm_wp_ak_m_drum" and "75rnd AK Drum"
		
		--Pistol Red Dot
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_o_rmr" and "Trijicon RMR Red Dot"
		--Marksman Irons
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_o_marksmansight_rear_desc" and "Meprolight Tru-Dot Adjustable Sight Set"
		
		--Military Red Dot
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_o_aimpoint" and "Aimpoint PRO Red Dot"
		--Holographic
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_o_eotech" and "EOTech 553 Holographic Sight"
		--Professional
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_o_t1micro" and "Aimpoint Micro T-1 Red Dot"
		--Surgeon
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_o_docter" and "IRONDOT w/Docter Sight II Plus Red Dot"
		--ACOUGH
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_o_acog" and "Trijicon ACOG Scope"
		--Milspec
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_o_specter" and "ELCAN Specter DR 1-4x Scope"
		--See More
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_o_cmore" and "C-More Railway Red Dot"
		--Combat
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_o_cs" and "Aimpoint CS Red Dot"
		--Compact Holo
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_o_eotech_xps" and "EOTech EXPS3 Holographic Sight"
		--Speculator
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_o_reflex" and "Sightmark Sureshot Red Dot" --super generic so I just went with what COD4 based it off of
		--Trigonom
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_o_rx01" and "Trijicon RX01 Red Dot"
		--Solar
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_o_rx30" and "Trijicon RX30 Red Dot"	
		--Theia
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_o_leupold" and "Leupold Mark 4 LR/T M1 Illum. Ret. w/BORS"
		--45 irons
		or RealNames._data.reelnames == true and string_id == "bm_wpn_fps_upg_o_45iron" and "XS Sights Angled Sights"
		--Flip-Up (KSG sights)
		or RealNames._data.reelnames == true and string_id == "bm_wp_upg_o_mbus_rear" and "Magpul MBUS Back-up Sights"
		or RealNames._data.reelnames == true and string_id == "dd_rear" and "Daniel Defense Fixed Sight Combo"
		
		or RealNames._data.reelnames == true and string_id == "bm_wp_mosin_iron_sight" and "Iron Sights"
	
	
	--[[FOREGRIPS]]
	--VFG
	or RealNames._data.reelnames == true and string_id == "bm_wp_upg_vg_ass_smg_verticalgrip" and "Knights Armament Co. VFG"
	--STUBBY
	or RealNames._data.reelnames == true and string_id == "bm_wp_upg_vg_ass_smg_stubby" and "Tango Down QD Stubby VFG"
	--AFG
	or RealNames._data.reelnames == true and string_id == "bm_wp_upg_vg_ass_smg_afg" and "Magpul AFG 2"
	
	
	--Dragons Breath
	or RealNames._data.reelnames == true and string_id == "bm_wp_upg_a_dragons_breath" and "Dragon's Breath Rounds"
	--AP Slug
	or RealNames._data.reelnames == true and string_id == "bm_wp_upg_a_slug" and "Armor Piercing Slugs"
	--000 Buck
	or RealNames._data.reelnames == true and string_id == "bm_wp_upg_a_custom" and "000 Buck"
	--Flechette
	or RealNames._data.reelnames == true and string_id == "bm_wp_upg_a_piercing" and "Flechette Rounds"
	--HE
	or RealNames._data.reelnames == true and string_id == "bm_wp_upg_a_explosive" and "Fragmentation Rounds"
	
	
	--URSA
	or RealNames._data.reelnames == true and string_id == "bm_melee_kabar" and "USMC KA-BAR"
	--Krieger
	or RealNames._data.reelnames == true and string_id == "bm_melee_kampfmesser" and "KM 2000"
	--Berger
	or RealNames._data.reelnames == true and string_id == "bm_melee_gerber" and "Gerber DMF Folder"
	
	--Tomahawk
	or RealNames._data.reelnames == true and string_id == "bm_melee_tomahawk" and "Gerber Downrange Tomahawk"
	--Machete
	or RealNames._data.reelnames == true and string_id == "bm_melee_becker" and "KA-BAR Becker Tac Tool"
	--Baton
	or RealNames._data.reelnames == true and string_id == "bm_melee_baton" and "ASP Friction Loc Baton"
	--Shovel
	or RealNames._data.reelnames == true and string_id == "bm_melee_shovel" and "KLAS Shovel"
	
	--TWD Bat
	or RealNames._data.reelnames == true and string_id == "bm_melee_baseballbat" and "\"Lucille\""
	
	--Bayonet
	or RealNames._data.reelnames == true and string_id == "bm_melee_bayonet" and "AKM Type II Bayonet"
	--Bullseye
	or RealNames._data.reelnames == true and string_id == "bm_melee_bullseye" and "Smith & Wesson Bullseye Hatchet"
	--X46
	or RealNames._data.reelnames == true and string_id == "bm_melee_x46" and "Robson Knives X46 Utility Survival Knife"
	--Gunther
	or RealNames._data.reelnames == true and string_id == "bm_melee_dingdong" and "Gerber Ding Dong Breaching Tool"
	
	--Cleaver
	or RealNames._data.reelnames == true and string_id == "bm_melee_cleaver" and "Cleaver"
	--Machete
	or RealNames._data.reelnames == true and string_id == "bm_melee_machete" and "Machete"
	
	--Tanto
	or RealNames._data.reelnames == true and string_id == "bm_melee_kabar_tanto" and "KA-BAR Tanto"
	
	--Chef
	or RealNames._data.reelnames == true and string_id == "bm_melee_chef" and "Chef Knife"
	
	--Trench Knife
	or RealNames._data.reelnames == true and string_id == "bm_melee_fairbair" and "Fairbairn-Sykes Fighting Knife"
	--Erica Hartmann
	or RealNames._data.reelnames == true and string_id == "bm_melee_model24" and "Model 24 Stielhandgranate"
	
	--Hammer time
	or RealNames._data.reelnames == true and string_id == "bm_melee_hammer" and "Jacket's Hammer"
	
	--Another Cleaver
	or RealNames._data.reelnames == true and string_id == "bm_melee_meat_cleaver" and "Dragan's Cleaver"
	
	--Tender lovin'
	or RealNames._data.reelnames == true and string_id == "bm_melee_poker" and "Firewood Poker"
	--Tender lovin'
	or RealNames._data.reelnames == true and string_id == "bm_melee_tenderizer" and "Meat Tenderizer"
	--Fork her
	or RealNames._data.reelnames == true and string_id == "bm_melee_fork" and "BBQ Fork"
	
	--Autism
	or RealNames._data.reelnames == true and string_id == "bm_melee_mining_pick" and "Pickaxe"
	
	--NAOW THIS IS A KNOIFE
	or RealNames._data.reelnames == true and string_id == "bm_melee_bowie" and "Bowie Knife"
	--MY BRAND
	or RealNames._data.reelnames == true and string_id == "bm_melee_branding_iron" and "Branding Iron"
	
	--WOLOLOLO
	or RealNames._data.reelnames == true and string_id == "bm_melee_oldbaton" and "Nightstick"
	--WHOOP WHOOP PULL OVAH THAT BRASS TOO FAT
	or RealNames._data.reelnames == true and string_id == "bm_melee_detector" and "Garrett Handheld Metal Detector"

	--ZAP ZAP MOTHERFUCKER
	or RealNames._data.reelnames == true and string_id == "bm_melee_taser" and "ZAP Stun Baton"
	
	--Kunai
	or RealNames._data.reelnames == true and string_id == "bm_melee_cqc" and "Kunai"
	--MMM Whatcha Sai~
	or RealNames._data.reelnames == true and string_id == "bm_melee_twins" and "Sais"
	--Tekko-Kagi
	or RealNames._data.reelnames == true and string_id == "bm_melee_tiger" and "Tekko-Kagi"
	
	--Dive
	or RealNames._data.reelnames == true and string_id == "bm_melee_pugio" and "Extrema Ratio Pugio SE"
	--Gatorade
	or RealNames._data.reelnames == true and string_id == "bm_melee_gator" and "Gerber Gator Machete Pro"
	
	--BONK
	or RealNames._data.reelnames == true and string_id == "bm_melee_scoutknife" and "Morakniv Classic Scout 39"
	--Shears
	or RealNames._data.reelnames == true and string_id == "bm_melee_shawn" and "Antique Sheep Shears"
	--WREX
	or RealNames._data.reelnames == true and string_id == "bm_melee_stick" and "Shepherd's Crook"
	
	--NINE INCHES
	or RealNames._data.reelnames == true and string_id == "bm_melee_nin" and "Paslode IM90i Nailgun"
	
	--BUALS
	or RealNames._data.reelnames == true and string_id == "bm_melee_ballistic" and "Ballistic Knives"
	
	--flippity floop
	or RealNames._data.reelnames == true and string_id == "bm_melee_wing" and "Benchmade Model 42 Balisong"
	
	--Nade out
	or RealNames._data.reelnames == true and string_id == "bm_grenade_frag" and "M67 Fragmentation Grenade"
	or RealNames._data.reelnames == true and string_id == "bm_grenade_frag_com" and "M67 Fragmentation Grenade"
	--Throwing Axe
	or RealNames._data.reelnames == true and string_id == "bm_wpn_prj_hur" and "Kit Rae Aircobra Throwing Axe"
	
	--[[CUSTOM WEAPONS]]
	
	--CompM4
	or DMCWO._data.reelnames == true and string_id == "bm_wp_wpn_fps_upg_o_compm4s" and "Aimpoint CompM4s Red Dot Sight"
	
	--PK-AS
	or DMCWO._data.reelnames == true and string_id == "bm_wp_wpn_fps_upg_o_pkas" and "BelOMO PK-AS Red Dot Sight"
	
	--Kobra
	or DMCWO._data.reelnames == true and string_id == "bm_wp_wpn_fps_upg_o_kobra" and "Axion EKP-8-18 Red Dot Sight"
	
	--[[CHINASLAVSHIT]]
	or RealNames._data.reelnames == true and string_id == "bm_w_sks" and "Norinco SKS Model D"
		
	--[[AH NU]]
	or RealNames._data.reelnames == true and string_id == "bm_w_toz34" and "Tula Arms TOZ-34"
	
	--[[CHINESE FIVE SEVEN]]
	or RealNames._data.reelnames == true and string_id == "bm_w_qs" and "Norinco QSZ-92"
	
	--[[Victor]]
	or RealNames._data.reelnames == true and string_id == "bm_w_sr3m" and "Tula Arms SR-3M \"Vikhr\""
	
	--[[SHATTER'S FURY]]
	or RealNames._data.reelnames == true and string_id == "bm_w_shatters_fury" and "Smith & Wesson Model 500"
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_pis_shatters_fury_g_ergo" and "Wood Ergo Grip"
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_pis_shatters_fury_b_comp1" and "6.5\" Model 629 Performance Center Barrel"
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_pis_shatters_fury_b_comp2" and "8.38\" Compensated Barrel"
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_pis_shatters_fury_b_long" and "10.5\" Performance Center Barrel"
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_pis_shatters_fury_b_short" and "4\" Compensated Barrel"
	
	--[[SR338]]
	or RealNames._data.reelnames == true and string_id == "bm_w_fd338" and  "F&D Defense FD338"
	
	--[[GOASTS]]
	or RealNames._data.reelnames == true and string_id == "bm_w_ak12" and "Concern Kalashnikov AK-12"
	--AK-12 Quad Mag
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_ass_ak12_mag_quad" and "60rnd Concern Kalashnikov Magazine"
	
	--[[MW2]]
	or RealNames._data.reelnames == true and string_id == "bm_w_pp" and "KBP PP-2000" 
	
	--[[THE COD4 DAYS]]
	or RealNames._data.reelnames == true and string_id == "bm_w_m40a5" and "USMC M40A5"
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_snp_m40a5_o_bf4flipup" and "Troy Industries Flip-up Battle Sights"
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_snp_m40a5_o_scorpionevo" and "Skorpion EVO III Iron Sights"
	
	--[[GROUCH]]
	or RealNames._data.reelnames == true and string_id == "bm_w_grach" and  "Izmekh MP-443 \"Grach\""
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_pis_grach_comp" and "Bushing Compensator"
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_pis_grach_sil" and "SureFire MINI-MONSTER Suppressor"
	
	--[[MELTGUN]]
	or RealNames._data.reelnames == true and string_id == "bm_w_g36k" and "Heckler & Koch G36K"
	--Compact
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_ass_g36k_fg_g36c" and "G36c Kit"
	--Full
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_ass_g36k_fg_g36" and "18.9\" Barrel"
	--C-Mag
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_ass_g36k_mag_cmag" and "100rnd Beta-C Dual Drum"
	
	--[[ACR]]
	or RealNames._data.reelnames == true and string_id == "bm_w_acw" and "Remington ACR"
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_ass_acw_b_short" and "14.5\" Barrel"
	
	--[[CHINESE FIVE SEVEN]]
	or RealNames._data.reelnames == true and string_id == "bm_w_qs" and "Norinco QSZ-92"
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_pis_qs_las" and "SureFire X400V"
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_pis_qs_comp" and "Bushing Compensator"
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_pis_qs_sil" and "SureFire MINI-MONSTER Suppressor"
	
	--[[MY BAZOOKA]]
	or RealNames._data.reelnames == true and string_id == "bm_w_l115" and  "Accuracy International L115"
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_upg_l115_body_green" and "Olive Drab Stock"
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_upg_l115_irons" and "Troy Industries Flip-up Battle Sights"
	or string_id == "bm_wp_wpn_fps_upg_l115_supp" and "Custom Suppressor"
	
	--[[SUPERNOVA]]
	or RealNames._data.reelnames == true and string_id == "bm_w_novas" and  "Benelli Nova"
	
	--[[MW3 FLASHBACKS]]
	or RealNames._data.reelnames == true and string_id == "bm_w_x_fmg9" and  "Akimbo Magpul FMG-9s"
	
	--[[KF5]]
	or RealNames._data.reelnames == true and string_id == "bm_w_mpx" and "SIG Sauer MPX" 
	or RealNames._data.reelnames == true and string_id == "bm_w_x_mpx" and "Akimbo SIG Sauer MPXs"
	--MPX-K
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_smg_x_mpx_fg_mpx_k" and "MPX-K Kit"
	--MPX-SD
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_smg_mpx_fg_mpx_sd" and "MPX-SD Kit"
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_smg_x_mpx_fg_mpx_sd" and "MPX-SD Kit"
	--Mag
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_smg_x_mpx_mag_40" and ".40 S&W Conversion Kit"
	or RealNames._data.reelnames == true and string_id == "bm_wp_wpn_fps_smg_mpx_mag_40" and ".40 S&W Conversion Kit"
	
	--attachments
	or string_id == "bm_menu_custom" and "Internal Mod"
	or string_id == "bm_menu_extra" and "Rail"
	or string_id == "bm_menu_upper_reciever" and "Upper Body Mod"
	or string_id == "bm_menu_lower_reciever" and "Lower Body Mod"
	or string_id == "bm_menu_slide" and "Barrel/Slide"
	or string_id == "bm_menu_grip" and "Pistol Grip"
	or string_id == "bm_menu_barrel_ext" and "Barrel Extension"
	or string_id == "bm_menu_foregrip" and "Handguard"
	or string_id == "bm_menu_sight" and "Optic"
	
	--weapon categories
	or string_id == "menu_pistol" and "Pistols"
	or string_id == "menu_lmg" and "Light Machine Guns"
	or string_id == "menu_shotgun" and "Shotguns"
	or string_id == "menu_assault_rifle" and "Assault Rifles"
	or string_id == "menu_snp" and "Rifles"
	or string_id == "menu_smg" and "Sub-Machine Guns"
	
	or testAllStrings == true and string_id
	or text_original(self, string_id, ...)
end
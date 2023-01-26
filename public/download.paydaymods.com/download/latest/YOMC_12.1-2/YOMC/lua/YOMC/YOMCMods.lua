local BUIS_Toggle = function() return YOMC._data.BUIS end
-- 														TEMPLATE

--[[
tweak_data.weapon.factory.parts.YourPartIDHere.stats = {
							value = ,
							suppression = ,
							alert_size = ,
							damage = ,
							spread = ,
							recoil = ,
							concealment = 
						}
]]--

--													UNIVERSAL CHANGES

--													FIRE MODE SELECTORS

tweak_data.weapon.factory.parts.wpn_fps_upg_i_autofire.stats = { value = 8, recoil = 1 }			--Autofire Mod

-- 													BARREL EXTENSIONS														

tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.stats = {	value = 5, suppression = -5, damage = -2, spread = 1, recoil = -2, concealment = -2 } 	--Fire Breather
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_tank.stats = { value = 4, suppression = -2, damage = -2, recoil = 2, concealment = -2 } --Tank Compensator
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.stats = { value = 3, suppression = -1, recoil = 1 }	--Stubby
tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.stats = { value = 5, suppression = -1, spread_moving = -1, recoil = 2, concealment = -2} --Competitor's Compensator
tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.stats = { value = 5, suppression = -5, damage = 4, spread = -1, spread_moving = 4, concealment = -3 } --Funnel of Fun
tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.stats = { value = 5, spread = 1, spread_moving = -1, recoil = -2, concealment = -2 } --Tactical Compensator
tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_battle.stats = { value = 1, damage = -2, spread = 1, spread_moving = -1, recoil = -3, concealment = -1} --Ported Compensator
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_small.stats = { value = 3, suppression = 12, alert_size = 12, damage = -10, spread_moving = -3, concealment = 0 } --Low Profile Suppressor
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_medium.stats = { value = 2, suppression = 12, alert_size = 12, damage = -7, spread_moving = -2, concealment = -2 } --Medium Suppressor
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_large.stats = { value = 2, suppression = 12, alert_size = 12, damage = -5, stability = 1, spread_moving = -1, concealment = -3 } --The Bigger the Better Suppressor							

tweak_data.weapon.factory.parts.wpn_fps_upg_shot_ns_king.stats = { value = 5, suppression = -5, spread = 5, concealment = -2 } -- King's Crown Compensator
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_shot_shark.stats = { value = 5, suppression = -2, recoil = 3, spread = -4, concealment = -2 }				-- Sharks Teeth Compensator						
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_shot_thick.stats = { value = 7, suppression = 12, alert_size = 12, damage = -7, spread = -4, recoil = 1, spread_moving = -5, concealment = -2 }	-- Silent Killer Suppressor
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_sho_salvo_large.stats = { value = 7, suppression = 12, alert_size = 12, damage = -4, spread = 1, recoil = 1, spread_moving = -5, concealment = -2 }	-- Ssh! Suppressor
							
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_ipsccomp.stats = { value = 4, spread = 1, spread_moving = 2, recoil = -1, concealment = -1, damage = 0 } -- IPSC Compensator
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_ipsccomp.custom_stats = { damage_near_mul = 0.9, damage_far_mul = 1.1 }		 
tweak_data.weapon.factory.parts.wpn_fps_pis_usp_co_comp_1.stats = { spread = 1, spread_moving = 4, recoil = -2, concealment = -1 } -- Ventilated .45 (Interceptor)
	tweak_data.weapon.factory.parts.wpn_fps_pis_usp_co_comp_1.custom_stats = { damage_near_mul = 0.8, damage_far_mul = 1.2 }
tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_co_1.stats  = {	value = 4, spread = 1, spread_moving = 4, recoil = -2, concealment = -1 }	-- Ventilated .45 (Chimanos)									
	tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_co_1.custom_stats = { damage_near_mul = 0.8, damage_far_mul = 1.2 }
tweak_data.weapon.factory.parts.wpn_fps_pis_p226_co_comp_1.stats  = { value = 4, spread = 1, spread_moving = 4, recoil = -2, concealment = -1 }	-- Ventilated .45 (Sig 40)								
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_co_comp_1.custom_stats = { damage_near_mul = 0.8, damage_far_mul = 1.2 }
tweak_data.weapon.factory.parts.wpn_fps_pis_usp_co_comp_2.stats = { value = 4, spread = 1, spread_moving = -4, recoil = 2, concealment = -1 }			-- Velocity .45 (Interceptor)
	tweak_data.weapon.factory.parts.wpn_fps_pis_usp_co_comp_2.custom_stats = { damage_near_mul = 1.2, damage_far_mul = 0.7 }
tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_co_comp_2.stats = {	value = 4, spread = 1, spread_moving = -4, recoil = 2, concealment = -1 }		-- Velocity .45 (Chimano)
	tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_co_comp_2.custom_stats = { damage_near_mul = 1.2, damage_far_mul = 0.7 }
tweak_data.weapon.factory.parts.wpn_fps_pis_p226_co_comp_2.stats = {	value = 4, spread = 1, spread_moving = -4, recoil = 2, concealment = -1 }		-- Velocity .45 (Sig .40)
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_co_comp_2.custom_stats = { damage_near_mul = 1.2, damage_far_mul = 0.7 }
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_meatgrinder.stats = { value = 7, spread = 1, spread_moving = -4, recoil = 1, concealment = -1, }		-- Facepunch Compensator									
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_meatgrinder.custom_stats = { damage_near_mul = 1.1, damage_far_mul = 0.85 }
tweak_data.weapon.factory.parts.wpn_fps_upg_pis_ns_flash.stats = { value = 7, recoil = 2 }	-- Flash Hider
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_jungle.stats = { value = 5, suppression = 12, alert_size = 12, damage = -2, spread_moving = -5, recoil = 1, concealment = -5 }		-- Jungle Suppressor
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large.stats = { value = 5, suppression = 12, alert_size = 12, damage = -2, spread = -1, spread_moving = -3, concealment = -3 }								-- Monolith Suppressor		
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.stats = { value = 6, suppression = 12, alert_size = 12, spread_moving = -3, recoil = -2, concealment = -2, damage = -4 }							-- Champion's Silencer
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.stats =  { value = 1, suppression = 12, alert_size = 12, damage = -3, spread = -1, recoil = -1, spread_moving = -3, concealment = -2 }						-- Asepsis Suppressor
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium.stats = { value = 4, suppression = 12, alert_size = 12, damage = -5, spread_moving = -2, recoil = 1, concealment = -2 }			-- Standard Issue Suppressor		
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.stats = { value = 4, suppression = 12, alert_size = 12, damage = -5, spred_moving = -2, concealment = -1 }						-- Roctec Silencer
tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.stats = { value = 3, suppression = 12, alert_size = 12, damage = -7, spread = -2, spread_moving = -1, concealment = 0 }				-- Size Doesn't Matter Suppressor				

-- 															AMMO

tweak_data.weapon.factory.parts.wpn_fps_upg_a_custom.stats = { value = 5, total_ammo_mod = -5, damage = 15 }													-- 000 Buck/ 000 Buck Free 
	tweak_data.weapon.factory.parts.wpn_fps_upg_a_custom.custom_stats = { rays = 7, damage_near_mul = 7/8, damage_far_mul = 0.9, ammo_pickup_min_mul = 0.9, ammo_pickup_max_mul = 0.9, enable_skill_pickups = true }
		tweak_data.weapon.factory.wpn_fps_sho_striker.override.wpn_fps_upg_a_custom.custom_stats = { damage_near_set = 7*100, damage_far_set = 15*100, ammo_pickup_min_mul = 0.7, ammo_pickup_max_mul = 0.7, enable_skill_pickups = true }
		tweak_data.weapon.factory.wpn_fps_shot_serbu.override.wpn_fps_upg_a_custom.custom_stats = { damage_near_set = 7*100, damage_far_set = 15*100, ammo_pickup_min_mul = 0.7, ammo_pickup_max_mul = 0.7, enable_skill_pickups = true }
tweak_data.weapon.factory.parts.wpn_fps_upg_a_custom_free.stats = { value = 5, total_ammo_mod = -5, damage = 15, recoil = -5 }
	tweak_data.weapon.factory.parts.wpn_fps_upg_a_custom_free.custom_stats = { rays = 7, damage_near_mul = 0.75, damage_far_mul = 0.9, ammo_pickup_min_mul = 0.9, ammo_pickup_max_mul = 0.9, enable_skill_pickups = true }
		tweak_data.weapon.factory.wpn_fps_sho_striker.override.wpn_fps_upg_a_custom_free.custom_stats = { damage_near_set = 7*100, damage_far_set = 13*100, ammo_pickup_min_mul = 0.7, ammo_pickup_max_mul = 0.7, enable_skill_pickups = true }
		tweak_data.weapon.factory.wpn_fps_shot_serbu.override.wpn_fps_upg_a_custom_free.custom_stats = { damage_near_set = 7*100, damage_far_set = 13*100, ammo_pickup_min_mul = 0.7, ammo_pickup_max_mul = 0.7, enable_skill_pickups = true }
		
tweak_data.weapon.factory.parts.wpn_fps_upg_a_slug.stats = { value = 5, total_ammo_mod = -2, damage = 10, spread = 5, recoil = -5, moving_spread = 2 }
	tweak_data.weapon.factory.parts.wpn_fps_upg_a_slug.custom_stats = { damage_min_set = 0.5, damage_near_mul = 2, damage_far_mul = 1.15, rays = 1, armor_piercing_add = 1, can_shoot_through_enemy = true, enemy_pen_set = 1, can_shoot_through_shield = true, shield_pen_set = 0.3, can_shoot_through_wall = true, wall_pen_set = 1, ammo_pickup_min_mul = 0.8, ammo_pickup_max_mul = 0.8, enable_skill_pickups = true } -- AP Slugs
		tweak_data.weapon.factory.wpn_fps_sho_striker.override.wpn_fps_upg_a_slug.custom_stats = { damage_min_set = 0.1, damage_near_mul = 2, damage_far_mul = 1.15, rays = 1, armor_piercing_add = 1, can_shoot_through_enemy = true, enemy_pen_set = 1, can_shoot_through_shield = true, shield_pen_set = 0.3, can_shoot_through_wall = true, wall_pen_set = 1, ammo_pickup_min_mul = 0.6, ammo_pickup_max_mul = 0.6, enable_skill_pickups = true }
		tweak_data.weapon.factory.wpn_fps_shot_serbu.override.wpn_fps_upg_a_slug.custom_stats = { damage_min_set = 0.1, damage_near_mul = 2, damage_far_mul = 1.15, rays = 1, armor_piercing_add = 1, can_shoot_through_enemy = true, enemy_pen_set = 1, can_shoot_through_shield = true, shield_pen_set = 0.3, can_shoot_through_wall = true, wall_pen_set = 1, ammo_pickup_min_mul = 0.6, ammo_pickup_max_mul = 0.6, enable_skill_pickups = true }

tweak_data.weapon.factory.parts.wpn_fps_upg_a_dragons_breath.stats = { value = 5, total_ammo_mod = -3, damage = -4, spread = -1, moving_spread = 3 } -- Dragons Breath
tweak_data.weapon.factory.parts.wpn_fps_upg_a_dragons_breath.custom_stats = { ignore_statistic = true, rays = 5, damage_near_mul = 2, damage_far_mul = 1.15, armor_piercing_add = 1, can_shoot_through_shield = true, shield_pen_set = 0.25, ammo_pickup_min_mul = 1, ammo_pickup_max_mul = 1, bullet_class = "FlameBulletBase", muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath", fire_dot_data = { dot_damage = "1", dot_trigger_max_distance = "3000", dot_trigger_chance = "75", dot_length = "3.1", dot_tick_period = "0.5" } }

tweak_data.weapon.factory.parts.wpn_fps_upg_a_piercing.stats = { value = 5, total_ammo_mod = - 1, damage = -3, spread = 2, recoil = 2 }
	tweak_data.weapon.factory.parts.wpn_fps_upg_a_piercing.custom_stats = { damage_near_mul = 1.7, damage_far_mul = 1.5, armor_piercing_add = 1, can_shoot_through_enemy = true, enemy_pen_set = 0.5, ammo_pickup_min_mul = 1, ammo_pickup_max_mul = 1 }
		tweak_data.weapon.factory.wpn_fps_pis_judge.override.wpn_fps_upg_a_piercing.custom_stats = { damage_near_mul = 1.7, damage_far_mul = 1.5, armor_piercing_add = 1, can_shoot_through_enemy = true, enemy_pen_set = 0.5, can_shoot_through_wall = true, wall_pen_set = 0.4, ammo_pickup_min_mul = 1, ammo_pickup_max_mul = 1 }
--														GADGETS

tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_peq15.stats = { value = 5, recoil = 2, concealment = -2 }	-- Military Laser

-- 														PISTOL GRIPS (ARs/SMGs)

tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_sniper.stats = { value = 6, spread = 1, spread_moving = -2,	concealment = -1 }	--Pro Grip (Non-AK Rifles)
tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_hgrip.stats = { value = 2, spread = 1, spread_moving = -2 }						--Rubber Grip (Non-AK Rifles)
tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_mgrip.stats = { value = 2, spread_moving = -1, spread = -1, concealment = 2 }	--Straight Grip
											  
-- 														PISTOL GRIPS (Pistols)

tweak_data.weapon.factory.parts.wpn_fps_pis_g26_g_laser.stats = { value = 4, recoil = 1, concealment = -1 }		-- Laser Grip 

--														OPTICS

tweak_data.weapon.factory.parts.wpn_fps_upg_o_rmr.stats = { value = 6, zoom = 3, concealment = -1 }				-- Pistol RDS 
tweak_data.weapon.factory.parts.wpn_upg_o_marksmansight_rear.stats =  { value = 5, zoom = 1, recoil = 1 }		-- Marksman Sight

--														 AK/AK7.62 Family 

tweak_data.weapon.factory.parts.wpn_fps_upg_ak_b_ak105.stats = { value = 1, spread_moving = -2, damage = 2 }	-- Ak Modern Barrel
												
tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ak_b_zastava.stats = { value = 1, spread = 1, spread_moving = -2, recoil = -9, total_ammo_mod = -7, damage = 35, concealment = -4 }			-- AK 7.62/7.62 Gold DMR Kit
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats = { damage_min_mul = 1, damage_near_set = 100*100, damage_far_set = 100*100, ammo_pickup_min_mul = (2/3), ammo_pickup_max_mul = (2/3), can_shoot_through_enemy = true, enemy_pen_set = 0.75, can_shoot_through_wall = true, wall_pen_set = 0.65, enable_skill_pickups = true }		
tweak_data.weapon.factory.wpn_fps_ass_74.override.wpn_fps_upg_ass_ak_b_zastava.stats = { value = 1, spread = 1, spread_moving = -5, recoil = -9, total_ammo_mod = -12, damage = 72, concealment = -4 }	-- AK Rifle DMR Kit
	tweak_data.weapon.factory.wpn_fps_ass_74.override.wpn_fps_upg_ass_ak_b_zastava.custom_stats = { damage_min_mul = 1, damage_near_set = 100*100, damage_far_set = 100*100, ammo_pickup_min_mul = 0.4, ammo_pickup_max_mul = 0.4, can_shoot_through_wall = true, wall_pen_set = 0.65, enable_skill_pickups = true }					-- AK Rifle DMR Kit		
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ak_b_zastava.forbids = {
	"wpn_fps_upg_ass_ns_jprifles",
	"wpn_fps_upg_ass_ns_battle",
	"wpn_fps_upg_ns_ass_smg_firepig",
	"wpn_fps_upg_ns_ass_smg_stubby",
	"wpn_fps_upg_ns_ass_smg_tank",
	"wpn_fps_upg_ass_ns_surefire",
	"wpn_fps_upg_ass_ns_linear",
}

tweak_data.weapon.factory.parts.wpn_fps_upg_o_ak_scopemount.stats = { value = 1,  concealment = -1 }			--AK Optical Rail
tweak_data.weapon.factory.parts.wpn_fps_upg_ak_m_uspalm.stats = { value = 1, recoil = 1, spread_moving = 1 }	-- Low Drag Magazine
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_m_quad.custom_stats = { reload_speed_mul = 0.9 }	-- AK Quad Stack Magazine
tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_hgrip.stats = { value = 2, recoil = 1, concealment = 2 }	--AK Rubber Grip									
tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_pgrip.stats = { value = 2, spread = 1, recoil = -1 }	--AK Plastic Grip
tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_rk3.stats =  { value = 1, concealment = 1 }			-- AK Alunimium Grip					

--													AR-15 Family 

tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_b_short.stats = { value = 5, spread_moving = 3, recoil = -1, concealment = 2 }	-- Short Barrel (CAR-4)
tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_b_beowulf.stats = { value = 1, damage = 74, spread = 2, spread_moving = -2, recoil = -10, total_ammo_mod = -12, extra_ammo = -5, concealment = -4 }		-- CAR-4 DMR Kit				
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_b_beowulf.custom_stats = { damage_min_mul = 1, damage_near_set = 100*100, damage_far_set = 100*100, ammo_pickup_min_mul = 0.4, ammo_pickup_max_mul = 0.4, can_shoot_through_enemy = true, enemy_pen_set = 0.75, can_shoot_through_wall = true, wall_pen_set = 0.65, enable_skill_pickups = true }	
tweak_data.weapon.factory.wpn_fps_ass_m16.override.wpn_fps_upg_ass_m4_b_beowulf.stats = { value = 1, damage = 60, spread = 3, spread_moving = -2, recoil = -4, total_ammo_mod = -10, extra_ammo = -5, concealment = -4 } -- AMR-16 DMR Kit
	tweak_data.weapon.factory.wpn_fps_ass_m16.override.wpn_fps_upg_ass_m4_b_beowulf.custom_stats = { damage_min_mul = 1, damage_near_set = 100*100, damage_far_set = 100*100, ammo_pickup_min_mul = 0.5, ammo_pickup_max_mul = 0.5, can_shoot_through_enemy = true, enemy_pen_set = 0.75, can_shoot_through_wall = true, wall_pen_set = 0.65, enable_skill_pickups = true }	-- AMR-16 DMR Kit


tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_b_beowulf.forbids = { 
	"wpn_fps_upg_ass_m4_upper_reciever_core",
	"wpn_fps_m4_uupg_s_fold",
	"wpn_fps_upg_ass_ns_jprifles",
	"wpn_fps_upg_ass_ns_battle",
	"wpn_fps_upg_ns_ass_smg_firepig",
	"wpn_fps_upg_ns_ass_smg_stubby",
	"wpn_fps_upg_ns_ass_smg_tank",					
	"wpn_fps_upg_ass_ns_surefire",
	"wpn_fps_upg_ass_ns_linear"								
}

tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight_vanilla.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_m_std"

tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_m_std.stats = { value = 1, recoil = 1, spread_moving = 1 } -- Milspec Mag
tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_pmag.stats = { value = 3, spread_moving = 1, recoil = 1 } -- Tactical Magazine
tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_m_emag.stats = { value = 1, spread_moving = 1, recoil = 1 }	-- Expert Mag
tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_l5.stats = { value = 1, spread_moving = 1, recoil = 1 } -- L5 Magazine

tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight.stats = { value = 2, spread_moving = 2, concealment = 1, extra_ammo = -5 } -- Straight Mag
	
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_quad.custom_stats = { reload_speed_mul = 0.9 } 								-- Quad-stack Mag

tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.stats = { value = 1, spread = -2, spread_moving = 4, recoil = 4, concealment = -2}		-- OVAL Foregrip (CAR-4)
tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.stats = { value = 5, spread_moving = -2, spread = 2, recoil = -4, concealment = -2 } --Competitor's Foregrip (CAR-4)
tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.stats = { value = 1, spread = 1, recoil = 1, concealment = -2}							--EMO Foregrip (CAR-4)
tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.stats = { value = 5, recoil = 2, spread_moving = 1, concealment = -2}			-- Gazelle (CAR-4)

tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.stats = { value = 7, spread_moving = -2, recoil = 1, concealment = -2 }	--Railed Handguard (AMR16)
tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.stats = {  value = 10, spread_moving = 1, concealment = 2 }				--Vintage Handguard (AMR16)
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.custom_stats = { has_burst_fire = false }
tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.stats = { value = 1,recoil = 1, concealment = -3}					--Long Ergo Foregrip (AMR16)

tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_core.stats = { value = 1, extra_ammo = -2, damage = 16, spread = 0, spread_moving = -5, recoil = -2, total_ammo_mod = -4, concealment = -1} -- THRUST Upper Receiver
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_core.custom_stats = { ammo_pickup_min_mul = 0.8, ammo_pickup_max_mul = 0.8, enable_skill_pickups = true, damage_near_mul = (4/3)}	
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_core.forbids = { "wpn_fps_upg_ass_m4_b_beowulf" }
tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_edge.stats = { value = 3, damage = 2 } 								-- Exotique 
tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.stats = { value = 1, recoil = 1}														
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.custom_stats = { rof_mul = 0.9 }					-- LW Upper 
tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_lower_reciever_core.stats = { value = 1, spread_moving = -2, recoil = 1, concealment = -1}		-- THRUST Lower										   
tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_s_fold.stats = {value = 5, recoil = -3, concealment = 2, spread_moving = 2 }		--M4 Folding						  

--													Ak5 

tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_b_short.stats = { value = 1, damage = 2, spread = 1, spread_moving = 2, concealment = 1 }		 -- Short Barrel		
tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_fg_fnc.stats = { value = 5, recoil = 2, spread_moving = -3, concealment = -2 }	-- Belgian Heat (AK5)
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_fg_fnc.custom_stats = { has_burst_fire = true }
tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_fg_ak5c.stats = { value = 7, recoil = 1, spread = -1, concealment = 1 } -- Karbin Ceres (AK5)
tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_s_ak5c.stats = { value = 7, spread_moving = 3, recoil = -2, concealment = 2 } -- Caesar Stock (AK5)
tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_s_ak5b.stats =   { value = 10, spread_moving = -3, recoil = 1, concealment = -1 } -- Bertil Stock

-- 													JP36 

tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_c.stats = { value = 4, spread = 1, spread_moving = 3, recoil = -1, concealment = 2} -- Compact Foregrip
tweak_data.weapon.factory.parts.wpn_fps_ass_g36_s_sl8.stats = { value = 9, recoil = 2, spread_moving = -3, concealment = -3}--G36 SL8 Stock (Sniper Stock)
		
--													Clairon 

tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_short.stats = { value = 2, spread_moving = 3, concealment = 2 } -- Short Barrel

	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_g_retro.custom_stats = { rof_mul = 1.1 } -- G2 Grip

--													UAR 

tweak_data.weapon.factory.parts.wpn_fps_aug_b_short.stats = { value = 5, spread_moving = 2, recoil = 2, concealment = 2	} -- Short Barrel
tweak_data.weapon.factory.parts.wpn_fps_aug_body_f90.stats = { value = 1, spread = 1, recoil = 3, concealment = -2 }	--F90 Body Kit (Polymer Body)

--													FAL

tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_03.stats = { value = 2, recoil = 2, spread_moving = 4, concealment = -1 }	-- Retro Foregrip
tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_04.stats = { value = 2, spread = 2, recoil = -1, spread_moving = -4, concelment = -2} -- Marksman Foregrip
tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_wood.stats = { value = 2, spread = 1, recoil = 1, spread_moving = 2, concealment = -2 } -- Wooden Foregrip
tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_01.stats = { value = 2, damage = -4, spread = -1, spread_moving = 4, concealment = 6 } -- CQB Foregrip

--													Gecko 7.62 -> 5.56

tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.stats = { value = 2, recoil = 3, concealment = -1 } -- Fabulous Foregrip
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sniper.stats = { value = 2, recoil = -2, spread_moving = -2, spread = 2, concealment = -2 }	-- Sniper Foregrip
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.stats = { value = 2, spread_moving = 4, damage = -3, concealment = 4 } -- CQB Foregrip
tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sar.stats = { value = 2, spread_moving = 2, recoil = 1, concealment = 1 } -- Light Foregrip

--													Gewehr 3


tweak_data.weapon.factory.parts.wpn_fps_ass_g3_g_sniper.stats = { value = 2, recoil = -1, spread = 1, concealment = -1 } -- G3 PSG-1 Handle (Sniper Grip)
tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_retro_plastic.stats = { value = 2, recoil = -1, spread_moving = 3, spread = -2, concealment = 6}	 	-- G3 Slimline Grip (Plastic Foregrip)									
tweak_data.weapon.factory.parts.wpn_fps_ass_g3_b_sniper.stats = { value = 2, damage = 35, spread = 2, recoil = -13, total_ammo_mod = -6, extra_ammo = -5, concealment = -6 }
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_b_sniper.custom_stats = { rof_mul = 0.8, damage_min_mul = 1, damage_near_set = 100*100, damage_far_set = 100*100, ammo_pickup_min_mul = 0.7, ammo_pickup_max_mul = 0.7, can_shoot_through_enemy = true, enemy_pen_set = 0.75, can_shoot_through_wall = true, wall_pen_set = 0.65, enable_skill_pickups = true }
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_b_sniper.forbids = {"wpn_fps_upg_i_singlefire", "wpn_fps_upg_i_autofire"} 			-- G3 Sniper Barrel (DMR Kit)
		tweak_data.weapon.factory.parts.wpn_fps_ass_g3_b_sniper.adds = {}
		tweak_data.weapon.factory.parts.wpn_fps_ass_g3_b_sniper.perks = {"fire_mode_single"}
		tweak_data.weapon.factory.parts.wpn_fps_upg_i_singlefire.forbids = { "wpn_fps_ass_g3_b_sniper" }
tweak_data.weapon.factory.parts.wpn_fps_ass_g3_b_short.stats = { value = 2, spread = -3, spread_moving = 5, recoil = -2, total_ammo_mod = 4, concealment = 6 } --G3 Short Barrel (Assault Kit)								  
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_b_short.custom_stats = { has_burst_fire = true }

--														Valkyrie

tweak_data.weapon.factory.parts.wpn_fps_ass_asval_s_solid.stats = { value = 1, recoil = 5, total_ammo_mod = 3, concealment = -3 } -- VSS Stock (Solid Stock)
	tweak_data.weapon.factory.parts.wpn_fps_ass_asval_s_solid.custom_stats = { ammo_pickup_min_mul = (8/7), ammo_pickup_max_mul = (8/7), can_shoot_through_wall = true, wall_pen_set = 0.8, can_shoot_through_enemy = true, enemy_pen_set = 0.2, enable_skill_pickups = true }

--														Eagle

tweak_data.weapon.factory.parts.wpn_fps_ass_scar_b_short.stats = { value = 3, suppression = -2, spread_moving = 3, concealment = 3 }	-- Short Barrel
tweak_data.weapon.factory.parts.wpn_fps_ass_scar_b_long.stats = { value = 4, spread = 1, spread_moving = -3, concealment = -3 }	-- Long Barrel

--														M308

tweak_data.weapon.factory.parts.wpn_fps_ass_m14_body_ebr.stats = { value = 10, extra_ammo = 5, total_ammo_mod = -3, spread_moving = -5, recoil = 3, concealment = 2 } 	-- Abraham Body
	tweak_data.weapon.factory.parts.wpn_fps_ass_m14_body_ebr.custom_stats = { ammo_pickup_min_mul = (6 / 7) , ammo_pickup_max_mul = (6 / 7), enable_skill_pickups = true }
tweak_data.weapon.factory.parts.wpn_fps_ass_m14_body_jae.stats =  { value = 6, spread_moving = 2, spread = 1, recoil = 3, concealment = -2 }											-- Jaeger Body

--														KSP

tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_b_long.stats = { value = 4, spread = 1, spread_moving = -2, recoil = 1, concealment = -2 } -- Long Barrel
tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_fg_mk46.stats = { value = 6, spread = 2, recoil = 2, spread_moving = 5, concealment = -1 }
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_fg_mk46.forbids = { "wpn_fps_upg_bp_lmg_lionbipod" } -- Railed Foregrip

--														RPK

tweak_data.weapon.factory.parts.wpn_fps_lmg_rpk_fg_standard.stats = { value = 5, spread = 2, spread_moving = 5, recoil = 2, concealment = 3 }
	tweak_data.weapon.factory.parts.wpn_fps_lmg_rpk_fg_standard.forbids = { "wpn_fps_upg_bp_lmg_lionbipod" } 	-- Tactical Foregrip

--														Brenner-21

tweak_data.weapon.factory.parts.wpn_fps_lmg_hk21_b_long.stats = { value = 4, spread = 1, spread_moving = -2, recoil = 1, concealment = -2 }	-- Long Barrel
tweak_data.weapon.factory.parts.wpn_fps_lmg_hk21_fg_short.stats = { value = 5, recoil = 2, spread_moving = 5, concealment = 3 } 	-- Short Foregrip

--														Buzzsaw 42

tweak_data.weapon.factory.parts.wpn_fps_lmg_mg42_b_mg34.stats = { value = 1, spread = 2, spread_moving = -2, recoil = 2 }
	tweak_data.weapon.factory.parts.wpn_fps_lmg_mg42_b_mg34.custom_stats = { rof_mul = 0.75 } -- Light Barrel

--														Rattlesnake

tweak_data.weapon.factory.parts.wpn_fps_snp_msr_body_msr.stats = { value = 8, total_ammo_mod = -8, extra_ammo = -2, damage = 52, concealment = 5, recoil = -8 }
	tweak_data.weapon.factory.parts.wpn_fps_snp_msr_body_msr.custom_stats = { ammo_pickup_min_mul = (7 / 15) , ammo_pickup_max_mul = 0.5, shield_pen_set = 0.35, enable_skill_pickups = true, reload_speed_mul = 0.9, rof_mul = (5/6) }
	
--														Jacket's Piece

tweak_data.weapon.factory.parts.wpn_fps_smg_cobray_ns_barrelextension.stats = { value = 1, spread = 1, recoil = -2, concealment = -2}	-- Slotted Barrel Extension										
tweak_data.weapon.factory.parts.wpn_fps_smg_cobray_ns_silencer.stats = { value = 1, suppression = 100, alert_size = 12, damage = -5, recoil = 1, spread_moving = -2, concealment = -1 } -- Werbell's Suppressor
tweak_data.weapon.factory.parts.wpn_fps_smg_cobray_body_upper_jacket.stats =  { value = 1, recoil = 5, concealment = -3 } -- 80's Calling

--														Cobra

tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_m_extended.stats = { value = 1, concealment = -3, recoil = 2 }
	tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_m_extended.custom_stats = { is_dual_mag = true, dual_reload_speed_mul = 1.4 } -- Dual-Mag

--														Vertex 

tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_barrel_precision.stats = { value = 1, spread = 2, spread_moving = -2, recoil = -3, concealment = -4 } -- Precision Barrel
tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_ns_silencer.stats = { value = 1, suppression = 100, alert_size = 12, damage = -1, spread_moving = -3, recoil = 1, concealment = -1 } -- HPS Suppressor

--														Compact-5 

tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_m_straight.stats = { value = 1, damage = 6, recoil = -11 }
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_m_straight.custom_stats = { rof_mul = 0.8, reload_speed_mul = 0.9 }						 -- Straight Mag					
										
--														CMP 

tweak_data.weapon.factory.parts.wpn_fps_smg_mp9_b_suppressed.stats = { value = 1, suppression = 100, alert_size = 12, damage = -5, spread_moving = -2, recoil = 3, concealment = -4 } -- Tactical Suppressor

--														Patchett L2A1 

tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_b_long.stats = { value = 1, damage = 0, spread = 1, recoil = -1, concealment = -2 } -- Long Barrel
tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_b_short.stats = { value = 1, damage = 0, spread = 0, spread_moving = 3, recoil = 1, concealment = 1 } -- Short Barrel		
--														Spec Ops 

tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_b_suppressed.stats =  { value = 4, spread = 1, suppression = 12, alert_size = 12, damage = -2, recoil = -2, spread_moving = -2, concealment = -2 } -- Suppressed Barrel	

--														Kobus 90 


tweak_data.weapon.factory.parts.wpn_fps_smg_p90_b_long.stats = { value = 8, spread = 0, spread_moving = -5, recoil = 2, concealment = -2 } -- Long Barrel

tweak_data.weapon.factory.parts.wpn_fps_smg_p90_b_civilian.stats = { value = 1, spread = 1, spread_moving = -5, recoil = -2, concealment = -4 } 	-- Civilian Market Barrel
tweak_data.weapon.factory.parts.wpn_fps_smg_p90_b_ninja.stats = { value = 2, suppression = 12, alert_size = 12, damage = -4, spread_moving = -3, recoil = 3 }	-- Mall Ninja Barrel									

--														Locomotive 12G / Reinfield 880											
tweak_data.weapon.factory.parts.wpn_fps_shot_r870_body_rack.stats = { value = 3, spread_moving = -1, concealment = -2, total_ammo_mod = 3 }
	tweak_data.weapon.factory.parts.wpn_fps_shot_r870_body_rack.custom_stats = { ammo_pickup_min_mul = (8 / 7) , ammo_pickup_max_mul = (8 / 7), enable_skill_pickups = true }

--														Mosconi 12G 

tweak_data.weapon.factory.parts.wpn_fps_shot_huntsman_b_short.stats = { value = 10, recoil = -4, spread = -6, spread_moving = 3, concealment = 10 }	-- Road Warrior Barrel			
tweak_data.weapon.factory.parts.wpn_fps_shot_huntsman_s_short.stats = { value = 10, recoil = -4, spread = -6, spread_moving = 3, concealment = 10}	-- Gangsta Stock																	
											
--														Steakout 12G 

tweak_data.weapon.factory.parts.wpn_fps_sho_aa12_barrel_long.stats = { value = 1, recoil = 3, concealment = -2 } -- Standard Barrel							
tweak_data.weapon.factory.parts.wpn_fps_sho_aa12_barrel_silenced.stats = { value = 4, spread = 1, suppression = 12, alert_size = 12, damage = -2, recoil = -2, spread_moving = -2, concealment = -2 } -- Suppressed Barrel

--														Interceptor 45 
													
tweak_data.weapon.factory.parts.wpn_fps_pis_usp_b_expert.stats = { value = 2, recoil = 2, concealment = -1 }	-- Expert Slide								
tweak_data.weapon.factory.parts.wpn_fps_pis_usp_b_match.stats = { value = 2, recoil = 2, spread = 1, concealment = -2 } 	-- Match Slide

--														Chimano Custom 

tweak_data.weapon.factory.parts.wpn_fps_pis_g22c_b_long.stats = { value = 5, suppression = -2, spread = 1, spread_moving = -1, concealment = -2, recoil = 1 }	 -- Long Slide							

--														Chimano Compact 

tweak_data.weapon.factory.parts.wpn_fps_pis_g26_b_custom.stats = { value = 4, recoil = -2, spread = 1, concealment = -1 } 	-- Striking Slide
tweak_data.weapon.factory.parts.wpn_fps_pis_g26_body_custom.stats = { value = 7, recoil = 1, spread = 0, concealment = -1 } 	-- Striking Body Kit	

--														Crosskill 

tweak_data.weapon.factory.parts.wpn_fps_pis_1911_co_1.stats = { value = 5, suppression = -5, spread = 1, spread_moving = -4, recoil = -2, concealment = -1 }
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_co_1.custom_stats = { damage_near_mul = 0.8, damage_far_mul = 1.2 } 	-- Aggressor Compensator
tweak_data.weapon.factory.parts.wpn_fps_pis_1911_co_2.stats = { value = 2, suppression = -1, spread = 1, spread_moving = 4, recoil = 2, concealment = -1 }	
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_co_2.custom_stats = { damage_near_mul = 1.2, damage_far_mul = 0.7 } -- Punisher Compensator
tweak_data.weapon.factory.parts.wpn_fps_pis_1911_g_bling.stats = { value = 10, spread_moving = 2, recoil = 1 }	-- Bling Grip							 								
tweak_data.weapon.factory.parts.wpn_fps_pis_1911_g_ergo.stats = { value = 2, spread = 1, spread_moving = -3 } -- Ergo Grip
tweak_data.weapon.factory.parts.wpn_fps_pis_1911_b_long.stats = { value = 2, damage = 1, spread_moving = -3, spread = 1, recoil = 2, concealment = -2 } -- Long Slide
tweak_data.weapon.factory.parts.wpn_fps_pis_1911_b_vented.stats = { value = 1, damage = 1, recoil = 2, spread_moving = 4, suppression = -2 }		-- Vented Slide		

--														Bernetti

tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co2.stats = { value = 3, spread = 1, recoil = 2, spread_moving = 4, suppression = -5, concealment = -2 }
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co2.custom_stats = { damage_near_mul = 1.2, damage_far_mul = 0.7 } -- Professional Compensator
tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co1.stats = { value = 4, spread = 1, recoil = -2, spread_moving = -4, suppression = -5, concealment = -2 }
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co1.custom_stats = { damage_near_mul = 0.8, damage_far_mul = 1.2 } -- Competitor's Compensator

--														Signature .40 	

tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_long.stats =	{ value = 6, damage = 1, spread = 1, spread_moving = -5, recoil = 1, concealment = -3 } -- Long Slide
tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_equinox.stats = { value = 4, suppression = -2, spread_moving = 3, damage = 2, recoil = 2  } -- Two-Tone Slide

--														Broomstick 	

tweak_data.weapon.factory.parts.wpn_fps_pis_c96_b_long.stats = { value = 1, damage = 1, spread = 1, recoil = 1, concealment = -3 } -- Precision Barrel
tweak_data.weapon.factory.parts.wpn_fps_pis_c96_nozzle.stats = { value = 1, recoil = 2, concealment = -1 }		-- Damper L. 44 Nozzle					

--														LEO

tweak_data.weapon.factory.parts.wpn_fps_pis_hs2000_sl_custom.stats = { value = 4, suppression = -2, recoil = 1, damage = 2, spread_moving = 4 } -- Custom Slide
tweak_data.weapon.factory.parts.wpn_fps_pis_hs2000_sl_long.stats = { value = 6, damage = 1, spread = 2, recoil = 1, concealment = -3, spread_moving = -4 } -- Long Slide						

--														Bronco .44

tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp1.stats =	{ value = 3, spread = 1, spread_moving = 4, recoil = 2, concealment = -3 }
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp1.custom_stats = { damage_near_mul = 1.2, damage_far_mul = 0.7 }	-- Aggressor Barrel

tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp2.stats = { value = 4, spread = 1, spread_moving = -4, suppression = -4, recoil = -2, concealment = -3 }
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp2.custom_stats = { damage_near_mul = 0.8, damage_far_mul = 1.2 } -- 	Ventilated Barrel			
	
--														Deagle

tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_b_long.stats = { value = 7, spread_moving = -5, spread = 1, recoil = 3, concealment = -3 } -- Long Barrel
tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_co_long.stats = { value = 8, spread = 1, spread_moving = -4, recoil = -2, concealment = -2 }
		tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_co_long.custom_stats = { damage_near_mul = 0.8, damage_far_mul = 1.2 } -- OVERKILL Compensator
tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_co_short.stats = { value = 6, spread = 1, spread_moving = 4, recoil = 2, concealment = -1, suppression = -5 }
		tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_co_short.custom_stats = { damage_near_mul = 1.2, damage_far_mul = 0.7 }		-- La Femme Compensator
tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_m_extended.stats = { value = 7, concealment = -2, spread_moving = -2, extra_ammo = 1 } -- Extended Magazine

--														GL40

tweak_data.weapon.factory.parts.wpn_fps_gre_m79_barrel_short.stats = { value = 1, recoil = -1, spread = -8, concealment = 4 } -- Pirate Barrel
tweak_data.weapon.factory.parts.wpn_fps_gre_m79_stock_short.stats = { value = 1, recoil = -2, spread = -7, concealment = 4 } -- Sawn-off Stock

--														SAW

tweak_data.weapon.factory.parts.wpn_fps_saw_body_speed.stats = { value = 1, damage = 8 } -- Fast Motor
tweak_data.weapon.factory.parts.wpn_fps_saw_m_blade_sharp.stats = { value = 1, damage = 7 } -- Sharp Blade

--														BUG FIXES

tweak_data.weapon.factory.parts.wpn_fps_ass_vhs_m.stats = {}
tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.stats = {}
tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_stubby.stats = {}
tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_s_adjust.stats = {}
tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_rail.stats = {}
tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_afg.stats = {}

-- Credit to DMC for the original idea for BUIS
tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up = {
			type = "gadget",
			sub_type = "second_sight",
			name_id = "bm_wp_m79_sight_up",
			a_obj = "a_os",
			parent = "barrel",
			unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_fps_gre_m79_sight_up",
			stats = { value = 1, gadget_zoom = 1},
			perks = {"gadget"}
		}

if BUIS_Toggle() == 1 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_cs.adds = {}
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_cs.custom_stats = nil
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.adds = {}
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.custom_stats = nil
elseif BUIS_Toggle() == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_cs.adds = { "wpn_fps_gre_m79_sight_up" }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_cs.custom_stats = {}
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.adds = {}
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.custom_stats = nil
elseif BUIS_Toggle() == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.adds = { "wpn_fps_gre_m79_sight_up" }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.custom_stats = {}
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_cs.adds = {}
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_cs.custom_stats = nil
elseif BUIS_Toggle() == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_cs.adds = { "wpn_fps_gre_m79_sight_up" }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_cs.custom_stats = {}
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.adds = { "wpn_fps_gre_m79_sight_up" }
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.custom_stats = {}
end
-- Forbids 45 degree iron sight, pistol rail attachment and use on judge 
if BUIS_Toggle() ~= 1 then

	local BUIS_Forbids = { "wpn_fps_upg_o_45iron", "wpn_fps_pis_rage_extra", "wpn_fps_pis_deagle_extra" }
	for i, factory in pairs(BUIS_Forbids) do
		tweak_data.weapon.factory.parts[factory].forbids = { "wpn_fps_upg_o_cs", "wpn_fps_upg_o_specter" }
	end
	tweak_data.weapon.factory.parts.wpn_fps_pis_judge_body_standard.forbids = { "wpn_fps_addon_ris", "wpn_fps_upg_o_cs","wpn_fps_upg_o_specter" } -- I am testing alternative fixes.
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod = {}
	
	
	
	-- ASSAULT RIFLES
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_ass_amcar = { translation = Vector3( 0,-7.2,-3.5 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_ass_m4 = { translation = Vector3( 0,-3.7,-3.8 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_ass_m16 = { translation = Vector3( 0,-7.3,-3.45 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_ass_m14 = { translation = Vector3( -0.05,-8,-8.4 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_ass_akm = { translation = Vector3( 0, -2,-7.9 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_ass_akm_gold = { translation = Vector3( 0, -2, -7.9 ) } 
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_ass_74 = { translation = Vector3( 0, -2, -7.9 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3( -0.025,-3,-6.85 ),rotation = Rotation( 0,-0.2,0) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_ass_aug = { translation = Vector3( 0,-7.5,-6.1 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_ass_g36 = { translation = Vector3( 0,-5.4,-6.3 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_ass_s552 = { translation = Vector3( -0.1,-7,-5.8 ), rotation = Rotation( 0,0.5,0) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_ass_scar = { translation = Vector3( 0,-5.8,-3.65 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_ass_fal = { translation = Vector3( 0,-0.5,-6.9 ) }		
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( 0,-10,-6.63 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_ass_galil = { translation = Vector3( 0,-8,-6.56 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_ass_famas = { translation = Vector3( 0,-10.4,-9.6 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_ass_l85a2 = { translation = Vector3(0, 2 , -1.45 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_ass_vhs = { translation = Vector3(0, -7, -4.5) }
				
	-- SNIPER RIFLES
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_snp_msr = { translation = Vector3(0, -7, -7), rotation = Rotation(0, 0.1, 0) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_snp_mosin = { translation = Vector3(0, -36.4, -7.6) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_snp_r93 = { translation = Vector3(0, -7, -6.9), rotation = Rotation(0, -0.3, 0) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_snp_m95 = { translation = Vector3(0, -7, -7.1) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_snp_wa2000 = { translation = Vector3(0, -7, -2.6) }
					
	-- SPECIAL WEAPONS
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_gre_m79 = { translation = Vector3(0, -8, -2), rotation =Rotation(0, -5, 0) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_rpg7 = { translation = Vector3( 0, 2, -5.6 ) }

	-- SUB MACHINE GUN
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_smg_mac10 = { translation = Vector3( 0,-22.85,-6.4 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_smg_mp5 = { translation = Vector3( 0,-6.95,-6.1 ),rotation = Rotation( 0,-0.35,0) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_smg_mp9 = { translation = Vector3( 0,-6,-6.75 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_smg_olympic = { translation = Vector3( 0,-7.4,-3.5 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3( -0.025,-0.25,-6.4 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_smg_p90 = { translation = Vector3( 0,-10,-6.3 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_smg_m45 = { translation = Vector3( 0,-7,-7.15 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_smg_mp7 = { translation = Vector3( 0,-8.75,-6.17 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_smg_scorpion = { translation = Vector3( 0,-17.25,-8.55 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_smg_tec9 = { translation = Vector3( 0,-12.25,-8.4 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_smg_uzi = { translation = Vector3( 0,-11.7,-8.45 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_smg_sterling = { translation = Vector3( 0,-22.8,-6.99 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_smg_thompson = { translation = Vector3( 0,-28.7,-7.55 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_smg_cobray = { translation = Vector3( 0,-3, -3.35 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_smg_polymer = { translation = Vector3( 0,-3, -4.05 ) }
				
	-- SHOTGUNS
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_shot_r870 = { translation = Vector3( 0,-11.15,-6.45 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_shot_saiga = { translation = Vector3( 0,-3,-6.15 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_sho_ben = { translation = Vector3(0, -5.95, -6.45) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_sho_ksg = { translation = Vector3(0, -11.1, -4.45) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_sho_spas12 = { translation = Vector3(-0.15, -5, -7.05) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_sho_aa12 = { translation = Vector3(0, -5, -3.15) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_shot_serbu = { translation = Vector3( 0,-11.25,-6.45 ) }
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod.wpn_fps_sho_striker = { translation = Vector3(0, -10.25, -5.85) }
end

-- 	Not removing front-posts for weapon sights
local sight_id = { "wpn_fps_upg_o_specter", "wpn_fps_upg_o_aimpoint", "wpn_fps_upg_o_aimpoint_2", "wpn_fps_upg_o_docter", "wpn_fps_upg_o_eotech", "wpn_fps_upg_o_t1micro", "wpn_fps_upg_o_cmore", "wpn_fps_upg_o_acog", "wpn_fps_upg_o_eotech_xps", "wpn_fps_upg_o_rx01", "wpn_fps_upg_o_rx30", "wpn_fps_upg_o_cs", "wpn_fps_upg_o_reflex" }

tweak_data.weapon.factory.wpn_fps_smg_olympic.adds = {}
tweak_data.weapon.factory.wpn_fps_ass_m16.adds = {}

for i, factory in pairs(sight_id) do
	tweak_data.weapon.factory.parts[factory].forbids = { "wpn_fps_amcar_uupg_body_upperreciever",  "wpn_fps_ass_scar_o_flipups_up" }
	tweak_data.weapon.factory.wpn_fps_smg_olympic.adds[factory] = { "wpn_fps_ass_m16_os_frontsight" }
	tweak_data.weapon.factory.wpn_fps_ass_m16.adds[factory] = { "wpn_fps_ass_m16_os_frontsight" }
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds[factory]  = { "wpn_fps_m4_upper_reciever_round_vanilla", "wpn_fps_m4_uupg_draghandle_vanilla", "wpn_fps_ass_m16_os_frontsight" }
end
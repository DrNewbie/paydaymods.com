log("=========================================================\nYour Opinion, My Choice.\nCrafted with love and care by 2Cas with credit to DMC, B1313, LazyOzzy et. al\n...the data shows that my wallet is loving it ;)\n=========================================================\n")
local Old_TWD = WeaponTweakData.init
local Pen_Toggle = function() return YOMC._data.Pen end
local Burst_Toggle = function() return YOMC._data.BurstFire end
function WeaponTweakData:init(tweak_data)
	Old_TWD(self, tweak_data)
	self:YOMC_ModdedWeapons()
	self:YOMC_ToggleData()
	self:LO_BurstFire()
	self:DMC_TactReload()
end

function WeaponTweakData:_init_stats()
	self.stats = {}
	self.stats.alert_size = { 30000, 20000, 15000, 10000, 7500, 6000, 4500, 4000, 3500, 1800, 1500, 1200, 1000, 850, 700, 500, 350, 200, 100, 0 }
	self.stats.suppression = { 4.5, 3.9, 3.6, 3.3, 3, 2.8, 2.6, 2.4, 2.2, 1.6, 1.5, 1.4, 1.3, 1.2, 1.1, 1, 0.8, 0.6, 0.4, 0.2 }
	self.stats.damage = { 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1, 
						1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2, 
						2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9, 3, 
						3.1, 3.2, 3.3, 3.4, 3.5, 3.6, 3.7, 3.8, 3.9, 4, 
						4.1, 4.2, 4.3, 4.4, 4.5, 4.6, 4.7, 4.8, 4.9, 5, 
						5.1, 5.2, 5.3, 5.4, 5.5, 5.6, 5.7, 5.8, 5.9, 6, 
						6.1, 6.2, 6.3, 6.4, 6.5, 6.6, 6.7, 6.8, 6.9, 7, 
						7.1, 7.2, 7.3, 7.4, 7.5, 7.6, 7.7, 7.8, 7.9, 8, 
						8.1, 8.2, 8.3, 8.4, 8.5, 8.6, 8.7, 8.8, 8.9, 9, 
						9.1, 9.2, 9.3, 9.4, 9.5, 9.6, 9.7, 9.8, 9.9, 10, 
						10.1, 10.2, 10.3, 10.4, 10.5, 10.6, 10.7, 10.8, 10.9, 11, 
						11.1, 11.2, 11.3, 11.4, 11.5, 11.6, 11.7, 11.8, 11.9, 12, 
						12.1, 12.2, 12.3, 12.4, 12.5, 12.6, 12.7, 12.8, 12.9, 13, 
						13.1, 13.2, 13.3, 13.4, 13.5, 13.6, 13.7, 13.8, 13.9, 14, 
						14.1, 14.2, 14.3, 14.4, 14.5, 14.6, 14.7, 14.8, 14.9, 15, 
						15.1, 15.2, 15.3, 15.4, 15.5, 15.6, 15.7, 15.8, 15.9, 16, 
						16.1, 16.2, 16.3, 16.4, 16.5, 16.6, 16.7, 16.8, 16.9, 17, 
						17.1, 17.2, 17.3, 17.4, 17.5, 17.6, 17.7, 17.8, 17.9, 18, 
						18.1, 18.2, 18.3, 18.4, 18.5, 18.6, 18.7, 18.8, 18.9, 19, 
						19.1, 19.2, 19.3, 19.4, 19.5, 19.6, 19.7, 19.8, 19.9, 20, 
						20.1, 20.2, 20.3, 20.4, 20.5, 20.6, 20.7, 20.8, 20.9, 21 }
	self.stats.zoom = { 63, 60, 55, 50, 45, 40, 35, 30, 25, 20 }
	self.stats.spread = { 2, 1.92, 1.84, 1.76, 1.68, 1.6, 1.52, 1.44, 1.36, 1.28, 1.2, 1.12, 1.04, 0.96, 0.88, 0.8, 0.72, 0.64, 0.56, 0.48, 0.4, 0.32, 0.24, 0.16, 0.08, 0 }
	self.stats.spread_moving = { 2.5, 2.42, 2.34, 2.26, 2.18, 2.1, 2.02, 1.94, 1.86, 1.78, 1.7, 1.62, 1.54, 1.46, 1.38, 1.3, 1.22, 1.14, 1.06, 0.98, 0.9, 0.82, 0.74, 0.66, 0.58, 0.5 }
	self.stats.recoil = { 3, 2.9, 2.8, 2.7, 2.6, 2.5, 2.4, 2.3, 2.2, 2.1, 2, 1.9, 1.8, 1.7, 1.6, 1.5, 1.4, 1.3, 1.2, 1.1, 1, 0.9, 0.8, 0.7, 0.6, 0.5 }
	self.stats.value = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
	self.stats.concealment = { 0.3, 0.4, 0.5, 0.6, 0.65, 0.7, 0.75, 0.8, 0.825, 0.85, 1, 1.05, 1.1, 1.15, 1.2, 1.225, 1.25, 1.275, 1.3, 1.325, 1.35, 1.375, 1.4, 1.425, 1.45, 1.475, 1.5, 1.525, 1.55, 1.6 }
	self.stats.extra_ammo = {}
	
	for i = -10, 50, 2 do
		table.insert(self.stats.extra_ammo, i)
	end
	
	self.stats.total_ammo_mod = {}
	for i = -100, 100, 5 do
		table.insert(self.stats.total_ammo_mod, i / 100)
	end
end

function WeaponTweakData:_pickup_chance(max_ammo, selection_index)
	local low, high
	if selection_index == 2 then
		low = 0.03
		high = 0.04
	else
		low = 0.03
		high = 0.04
	end
	return {
		max_ammo * low,
		max_ammo * high
	}
end

function WeaponTweakData:YOMC_ModdedWeapons()
	--TEMPLATE
	--[[
	--												Y

	self.Y.CLIP_AMMO_MAX =
	self.Y.AMMO_MAX = 
	self.Y.AMMO_PICKUP = self:_pickup_chance(self.Y.AMMO_MAX, 1)
	self.Y.stats.concealment = 
	self.Y.stats.damage = 
	self.Y.stats.spread = 
	self.Y.stats.spread_moving = 
	self.Y.stats.recoil = 

	self.Y.spread.standing = 
	self.Y.spread.crouching = 
	self.Y.spread.steelsight = 
	self.Y.spread.moving_standing = 
	self.Y.spread.moving_crouching = 
	self.Y.spread.moving_steelsight = 
	self.Y.kick.standing = {
			0.6,
			0.8,
			-1,
			1
		} 

	self.Y.kick.steelsight = self.Y.kick.standing
	self.Y.kick.crouching = self.Y.kick.standing

	--]]
	-------------------------------------------------------------------------------------------------------------------------------------
	--														ASSAULT RIFLES
	-------------------------------------------------------------------------------------------------------------------------------------
	-- amcar			-- AMCAR
	-- new_m4			-- CAR-4
	-- m16				-- AMR-16
	-- new_m14			-- M308
	-- akm				-- AK.762
	-- akm_gold			-- Golden AK.762
	-- ak74				-- AK
	-- ak5				-- AK5
	-- aug 				-- UAR
	-- g36				-- JP36
	-- s552				-- Commando 553
	-- scar				-- Eagle Heavy
	-- fal				-- Falcon
	-- g3				-- Gewehr 3
	-- galil			-- Gecko 7.62
	-- famas			-- Clarion
	-- l85a2			-- Queen's Wrath
	-- vhs				-- Lion's Roar
	-- sub2000			-- Cavity 9mm
	-- asval			-- Valkyrie
	
	-- STILL TO DO: 
	-- Priority Low - Useless Weapon Mods 

	local AR_S_ADS = 1
	local AR_S_ADS_M = 1.8
	local AR_S_Crouching = 2.2
	local AR_S_Crouching_M = 3
	local AR_S_Standing = 3
	local AR_S_Standing_M = 3.5

	local LCarb_S_ADS = 1
	local LCarb_S_ADS_M = 1.8
	local LCarb_S_Crouching = 2
	local LCarb_S_Crouching_M = 3
	local LCarb_S_Standing = 3
	local LCarb_S_Standing_M = 3.25

	local Bullpup_S_ADS = 1
	local Bullpup_S_ADS_M = 1.5
	local Bullpup_S_Crouching = 2.2
	local Bullpup_S_Crouching_M = 2.5
	local Bullpup_S_Standing = 2.2
	local Bullpup_S_Standing_M = 2.5

	local BR_S_ADS = 1
	local BR_S_ADS_M = 1.8
	local BR_S_Crouching = 2.2
	local BR_S_Crouching_M = 3
	local BR_S_Standing = 3.5
	local BR_S_Standing_M = 4
	
	local LCarb_556nato_Dmg_Min = 0.75
	local LCarb_556nato_Dmg_Near = 15 * 100
	local LCarb_556nato_Dmg_Far = 15 * 100

	local Carb_556nato_Dmg_Min = 0.75
	local Carb_556nato_Dmg_Near = 20 * 100
	local Carb_556nato_Dmg_Far = 20 * 100
	
	local AR_556nato_Dmg_Min = 0.75
	local AR_556nato_Dmg_Near = 25 * 100
	local AR_556nato_Dmg_Far = 25 * 100

	local HR_762x39_Dmg_Min = 0.75
	local HR_762x39_Dmg_Near = 30 * 100
	local HR_762x39_Dmg_Far = 30 * 100

	local BR_762nato_Dmg_Min = 0.75
	local BR_762nato_Dmg_Near = 40 * 100
	local BR_762nato_Dmg_Far = 30 * 100

	local DMR_S_ADS = 1
	local DMR_S_ADS_M = 1.8
	local DMR_S_Crouching = 2.5
	local DMR_S_Crouching_M = 3
	local DMR_S_Standing = 5
	local DMR_S_Standing_M = 5.25

	local DMR_308_Dmg_Min = 1
	local DMR_308_Dmg_Near = 100 * 100
	local DMR_308_Dmg_Far = 100 * 100

	--														MEDIUM ARs
	--														AK Rifle
		
	self.ak74.CLIP_AMMO_MAX = 30
	self.ak74.AMMO_MAX = 150
	self.ak74.AMMO_PICKUP = self:_pickup_chance(self.ak74.AMMO_MAX, 1)
	self.ak74.stats.concealment = 16
	self.ak74.stats.damage = 43
	self.ak74.stats.spread = 17
	self.ak74.stats.spread_moving = 16
	self.ak74.stats.recoil = 16
	self.ak74.panic_suppression_chance = nil
	
	self.ak74.spread.steelsight = AR_S_ADS
	self.ak74.spread.crouching = AR_S_Crouching
	self.ak74.spread.standing = AR_S_Standing
	self.ak74.spread.moving_steelsight = AR_S_ADS_M
	self.ak74.spread.moving_crouching = AR_S_Crouching_M
	self.ak74.spread.moving_standing = AR_S_Standing_M

	self.ak74.kick.standing = {
			0.5,
			0.9,
			-1,
			1
		}

	self.ak74.kick.steelsight = self.ak74.kick.standing
	self.ak74.kick.crouching = self.ak74.kick.standing

	self.ak74.damage_min = Carb_556nato_Dmg_Min	-- 5.45×39mm ;)													
	self.ak74.damage_near = Carb_556nato_Dmg_Near
	self.ak74.damage_far = Carb_556nato_Dmg_Far

	--														CAR - 4
		
	self.new_m4.CLIP_AMMO_MAX = 30
	self.new_m4.AMMO_MAX = 150
	self.new_m4.AMMO_PICKUP = self:_pickup_chance(self.new_m4.AMMO_MAX, 1)
	self.new_m4.stats.concealment = 20
	self.new_m4.stats.damage = 39
	self.new_m4.stats.spread = 17
	self.new_m4.stats.spread_moving = 18
	self.new_m4.stats.recoil = 17
	self.new_m4.panic_suppression_chance = nil

	self.new_m4.spread.steelsight = AR_S_ADS
	self.new_m4.spread.crouching = AR_S_Crouching
	self.new_m4.spread.standing = AR_S_Standing
	self.new_m4.spread.moving_steelsight = AR_S_ADS_M
	self.new_m4.spread.moving_crouching = AR_S_Crouching_M
	self.new_m4.spread.moving_standing = AR_S_Standing_M

	self.new_m4.damage_min = Carb_556nato_Dmg_Min
	self.new_m4.damage_near = Carb_556nato_Dmg_Near
	self.new_m4.damage_far = Carb_556nato_Dmg_Far
	
	--														Ak5

	self.ak5.CLIP_AMMO_MAX = 30
	self.ak5.AMMO_MAX = 150
	self.ak5.AMMO_PICKUP = self:_pickup_chance(self.ak5.AMMO_MAX, 1)
	self.ak5.stats.concealment = 21
	self.ak5.stats.damage = 41
	self.ak5.stats.spread = 19
	self.ak5.stats.spread_moving = 18
	self.ak5.stats.recoil = 19
	self.ak5.panic_suppression_chance = nil

	self.ak5.spread.steelsight = LCarb_S_ADS
	self.ak5.spread.crouching = LCarb_S_Crouching
	self.ak5.spread.standing = LCarb_S_Standing
	self.ak5.spread.moving_steelsight = LCarb_S_ADS_M 
	self.ak5.spread.moving_crouching = LCarb_S_Crouching_M
	self.ak5.spread.moving_standing = LCarb_S_Standing_M

	self.ak5.kick.standing = {
			0.7,
			0.7,
			-1,
			1
		}
	self.ak5.kick.steelsight = self.ak5.kick.standing
	self.ak5.kick.crouching = self.ak5.kick.standing

	self.ak5.damage_min = Carb_556nato_Dmg_Min
	self.ak5.damage_near = Carb_556nato_Dmg_Near
	self.ak5.damage_far = Carb_556nato_Dmg_Far

	--														LIGHT ARs

	--														AMCAR
	self.amcar.CLIP_AMMO_MAX = 30
	self.amcar.AMMO_MAX = 210
	self.amcar.AMMO_PICKUP = self:_pickup_chance(self.amcar.AMMO_MAX, 1)
	self.amcar.stats.concealment = 21
	self.amcar.stats.damage = 36
	self.amcar.stats.spread = 15
	self.amcar.stats.spread_moving = 16
	self.amcar.stats.recoil = 21
	self.amcar.panic_suppression_chance = nil

	self.amcar.spread.steelsight = LCarb_S_ADS
	self.amcar.spread.crouching = LCarb_S_Crouching
	self.amcar.spread.standing = LCarb_S_Standing
	self.amcar.spread.moving_steelsight = LCarb_S_ADS_M
	self.amcar.spread.moving_crouching = LCarb_S_Crouching_M
	self.amcar.spread.moving_standing = LCarb_S_Standing_M

	self.amcar.damage_min = LCarb_556nato_Dmg_Min
	self.amcar.damage_near = LCarb_556nato_Dmg_Near
	self.amcar.damage_far = LCarb_556nato_Dmg_Far

	--														Commando 553

	self.s552.CLIP_AMMO_MAX = 30
	self.s552.AMMO_MAX = 210
	self.s552.AMMO_PICKUP = self:_pickup_chance(self.s552.AMMO_MAX, 1)
	self.s552.stats.concealment = 22
	self.s552.stats.damage = 36
	self.s552.stats.spread = 16
	self.s552.stats.spread_moving = 18
	self.s552.stats.recoil = 15
	self.s552.panic_suppression_chance = nil

	self.s552.spread.steelsight = LCarb_S_ADS
	self.s552.spread.crouching = LCarb_S_Crouching
	self.s552.spread.standing = LCarb_S_Standing
	self.s552.spread.moving_steelsight = LCarb_S_ADS_M
	self.s552.spread.moving_crouching = LCarb_S_Crouching_M
	self.s552.spread.moving_standing = LCarb_S_Standing_M

	self.s552.kick.standing = {
			0.7,
			0.7,
			-1,
			1
		}
		
	self.s552.damage_min = LCarb_556nato_Dmg_Min
	self.s552.damage_near = LCarb_556nato_Dmg_Near
	self.s552.damage_far = LCarb_556nato_Dmg_Far
		
	--														JP36

	self.g36.CLIP_AMMO_MAX = 30
	self.g36.AMMO_MAX = 180
	self.g36.AMMO_PICKUP = self:_pickup_chance(self.g36.AMMO_MAX, 1)
	self.g36.stats.concealment = 22
	self.g36.stats.damage = 40
	self.g36.stats.spread = 18
	self.g36.stats.spread_moving = 18
	self.g36.stats.recoil = 21
	self.g36.panic_suppression_chance = nil


	self.g36.spread.steelsight = LCarb_S_ADS
	self.g36.spread.crouching = LCarb_S_Crouching
	self.g36.spread.standing = LCarb_S_Standing
	self.g36.spread.moving_steelsight = LCarb_S_ADS_M
	self.g36.spread.moving_crouching = LCarb_S_Crouching_M
	self.g36.spread.moving_standing = LCarb_S_Standing_M

	self.g36.kick.standing = {
			0.7,
			0.7,
			-1,
			1
		}
	
	self.g36.kick.steelsight = self.g36.kick.standing
	self.g36.kick.crouching = self.g36.kick.standing

	self.g36.damage_min = LCarb_556nato_Dmg_Min
	self.g36.damage_near = LCarb_556nato_Dmg_Near
	self.g36.damage_far = LCarb_556nato_Dmg_Far

	--														Valkyrie
	self.asval.CLIP_AMMO_MAX = 20
	self.asval.AMMO_MAX = 140
	self.asval.AMMO_PICKUP = self:_pickup_chance(self.asval.AMMO_MAX, 1)
	self.asval.stats.concealment = 26
	self.asval.stats.damage = 40
	self.asval.stats.spread = 19
	self.asval.stats.spread_moving = 18
	self.asval.stats.recoil = 20
	self.asval.panic_suppression_chance = nil

	self.asval.spread.steelsight = LCarb_S_ADS
	self.asval.spread.crouching = LCarb_S_Crouching
	self.asval.spread.standing = LCarb_S_Standing
	self.asval.spread.moving_steelsight = LCarb_S_ADS_M
	self.asval.spread.moving_crouching = LCarb_S_Crouching_M
	self.asval.spread.moving_standing = LCarb_S_Standing_M

	self.asval.kick.standing = {
			0.5,
			0.9,
			-1,
			1
		}
	self.asval.kick.steelsight = self.asval.kick.standing
	self.asval.kick.crouching = self.asval.kick.standing

	self.asval.damage_min = Carb_556nato_Dmg_Min					-- 9x39mm ;)
	self.asval.damage_near = Carb_556nato_Dmg_Near
	self.asval.damage_far = Carb_556nato_Dmg_Far

	--														BULLPUPS
	--														Clairon

	self.famas.CLIP_AMMO_MAX = 30
	self.famas.AMMO_MAX = 210
	self.famas.AMMO_PICKUP = self:_pickup_chance(self.famas.AMMO_MAX, 1)
	self.famas.stats.concealment = 24
	self.famas.stats.damage = 36
	self.famas.stats.spread = 15
	self.famas.stats.spread_moving = 25
	self.famas.stats.recoil = 21
	self.famas.panic_suppression_chance = nil

	self.famas.spread.steelsight = Bullpup_S_ADS
	self.famas.spread.crouching = Bullpup_S_Crouching
	self.famas.spread.standing = Bullpup_S_Standing
	self.famas.spread.moving_steelsight = Bullpup_S_ADS_M
	self.famas.spread.moving_crouching = Bullpup_S_Crouching_M
	self.famas.spread.moving_standing = Bullpup_S_Standing_M

	self.famas.damage_min = LCarb_556nato_Dmg_Min
	self.famas.damage_near = LCarb_556nato_Dmg_Near
	self.famas.damage_far = LCarb_556nato_Dmg_Far

	--														Lion's Roar

	self.vhs.CLIP_AMMO_MAX = 30
	self.vhs.AMMO_MAX = 180
	self.vhs.AMMO_PICKUP = self:_pickup_chance(self.vhs.AMMO_MAX, 1)
	self.vhs.stats.concealment = 17
	self.vhs.stats.damage = 40
	self.vhs.stats.spread = 16
	self.vhs.stats.spread_moving = 24
	self.vhs.stats.recoil = 20
	self.vhs.panic_suppression_chance = nil

	self.vhs.spread.steelsight = Bullpup_S_ADS
	self.vhs.spread.crouching = Bullpup_S_Crouching
	self.vhs.spread.standing = Bullpup_S_Standing
	self.vhs.spread.moving_steelsight = Bullpup_S_ADS_M
	self.vhs.spread.moving_crouching = Bullpup_S_Crouching_M
	self.vhs.spread.moving_standing = Bullpup_S_Standing_M

	self.vhs.damage_min = LCarb_556nato_Dmg_Min
	self.vhs.damage_near = LCarb_556nato_Dmg_Near
	self.vhs.damage_far = LCarb_556nato_Dmg_Far

	--														UAR

	self.aug.CLIP_AMMO_MAX = 30
	self.aug.AMMO_MAX = 150
	self.aug.AMMO_PICKUP = self:_pickup_chance(self.aug.AMMO_MAX, 1)
	self.aug.stats.concealment = 20
	self.aug.stats.damage = 41
	self.aug.stats.spread = 18
	self.aug.stats.spread_moving = 22
	self.aug.stats.recoil = 16
	self.aug.panic_suppression_chance = nil

	self.aug.spread.steelsight = Bullpup_S_ADS
	self.aug.spread.crouching = Bullpup_S_Crouching
	self.aug.spread.standing = Bullpup_S_Standing
	self.aug.spread.moving_steelsight = Bullpup_S_ADS_M
	self.aug.spread.moving_crouching = Bullpup_S_Crouching_M
	self.aug.spread.moving_standing = Bullpup_S_Standing_M

	self.aug.damage_min = Carb_556nato_Dmg_Min
	self.aug.damage_near = Carb_556nato_Dmg_Near
	self.aug.damage_far = Carb_556nato_Dmg_Far

	--														Queen's Wrath


	self.l85a2.CLIP_AMMO_MAX = 30
	self.l85a2.AMMO_MAX = 150
	self.l85a2.AMMO_PICKUP = self:_pickup_chance(self.l85a2.AMMO_MAX, 1)
	self.l85a2.stats.concealment = 16
	self.l85a2.stats.damage = 41
	self.l85a2.stats.spread = 20
	self.l85a2.stats.spread_moving = 20
	self.l85a2.stats.recoil = 16
	self.l85a2.panic_suppression_chance = nil

	self.l85a2.spread.steelsight = Bullpup_S_ADS
	self.l85a2.spread.crouching = Bullpup_S_Crouching
	self.l85a2.spread.standing = Bullpup_S_Standing + 0.5
	self.l85a2.spread.moving_steelsight = Bullpup_S_ADS_M + 0.15
	self.l85a2.spread.moving_crouching = Bullpup_S_Crouching_M + 0.7
	self.l85a2.spread.moving_standing = Bullpup_S_Standing_M + 1

	self.l85a2.damage_min = Carb_556nato_Dmg_Min
	self.l85a2.damage_near = Carb_556nato_Dmg_Near
	self.l85a2.damage_far = Carb_556nato_Dmg_Far


	--														INT RIFLES


	--														Gecko 7.62

	self.galil.CLIP_AMMO_MAX = 30
	self.galil.AMMO_MAX = 120
	self.galil.AMMO_PICKUP = self:_pickup_chance(self.galil.AMMO_MAX, 1)
	self.galil.stats.concealment = 15
	self.galil.stats.damage = 58
	self.galil.stats.spread = 19
	self.galil.stats.spread_moving = 15
	self.galil.stats.recoil = 18
	self.galil.panic_suppression_chance = nil

	self.galil.spread.steelsight = AR_S_ADS
	self.galil.spread.crouching = AR_S_Crouching
	self.galil.spread.standing = AR_S_Standing
	self.galil.spread.moving_steelsight = AR_S_ADS_M
	self.galil.spread.moving_crouching = AR_S_Crouching_M
	self.galil.spread.moving_standing = AR_S_Standing_M
	
	self.galil.timers.reload_not_empty = 3.4
	self.galil.kick.standing = {
			0.5,
			0.9,
			-1,
			1
		}
		
	self.galil.kick.steelsight = self.galil.kick.standing
	self.galil.kick.crouching = self.galil.kick.standing

	self.galil.damage_min = AR_556nato_Dmg_Min
	self.galil.damage_near = AR_556nato_Dmg_Near
	self.galil.damage_far = AR_556nato_Dmg_Far

	--														AMR-16

	self.m16.CLIP_AMMO_MAX = 30
	self.m16.AMMO_MAX = 120
	self.m16.AMMO_PICKUP = self:_pickup_chance(self.m16.AMMO_MAX, 1)
	self.m16.stats.concealment = 17
	self.m16.stats.damage = 53
	self.m16.stats.spread = 18
	self.m16.stats.spread_moving = 14
	self.m16.stats.recoil = 19
	self.m16.panic_suppression_chance = nil

	self.m16.spread.steelsight = AR_S_ADS
	self.m16.spread.crouching = AR_S_Crouching
	self.m16.spread.standing = AR_S_Standing
	self.m16.spread.moving_steelsight = AR_S_ADS_M
	self.m16.spread.moving_crouching = AR_S_Crouching_M
	self.m16.spread.moving_standing = AR_S_Standing_M

	self.m16.damage_min = AR_556nato_Dmg_Min
	self.m16.damage_near = AR_556nato_Dmg_Near
	self.m16.damage_far = AR_556nato_Dmg_Far

	--														HEAVY & BATTLE RIFLES
	--														AK 7.62

	self.akm.CLIP_AMMO_MAX = 30
	self.akm.AMMO_MAX = 90
	self.akm.AMMO_PICKUP = self:_pickup_chance(self.akm.AMMO_MAX, 1)
	self.akm.stats.damage = 80
	self.akm.stats.concealment = 13
	self.akm.stats.spread = 17
	self.akm.stats.spread_moving = 14
	self.akm.stats.recoil = 17
	self.akm.panic_suppression_chance = nil

	self.akm.spread.steelsight = BR_S_ADS
	self.akm.spread.crouching = BR_S_Crouching
	self.akm.spread.standing = BR_S_Standing
	self.akm.spread.moving_steelsight = BR_S_ADS_M
	self.akm.spread.moving_crouching = BR_S_Crouching_M
	self.akm.spread.moving_standing = BR_S_Standing_M

	self.akm.kick.standing = {
			0.5,
			0.9,
			-1,
			1
		}
	self.akm.kick.steelsight = self.akm.kick.standing
	self.akm.kick.crouching = self.akm.kick.standing

	self.akm.damage_min = HR_762x39_Dmg_Min
	self.akm.damage_near = HR_762x39_Dmg_Near
	self.akm.damage_far = HR_762x39_Dmg_Far

	--														AK 7.62 Gold

	self.akm_gold.CLIP_AMMO_MAX = 30
	self.akm_gold.AMMO_MAX = 90
	self.akm_gold.AMMO_PICKUP = self:_pickup_chance(self.akm_gold.AMMO_MAX, 1)
	self.akm_gold.stats.damage = 80
	self.akm_gold.stats.concealment = 13
	self.akm_gold.stats.spread = 17
	self.akm_gold.stats.spread_moving = 13
	self.akm_gold.stats.recoil = 17
	self.akm_gold.panic_suppression_chance = nil
	
	self.akm_gold.spread.steelsight = BR_S_ADS
	self.akm_gold.spread.crouching = BR_S_Crouching
	self.akm_gold.spread.standing = BR_S_Standing
	self.akm_gold.spread.moving_steelsight = BR_S_ADS_M
	self.akm_gold.spread.moving_crouching = BR_S_Crouching_M
	self.akm_gold.spread.moving_standing = BR_S_Standing_M

	self.akm_gold.kick.standing = {
			0.5,
			0.9,
			-1,
			1
		}
	self.akm_gold.kick.steelsight = self.akm_gold.kick.standing
	self.akm_gold.kick.crouching = self.akm_gold.kick.standing

	self.akm_gold.damage_min = HR_762x39_Dmg_Min
	self.akm_gold.damage_near = HR_762x39_Dmg_Near
	self.akm_gold.damage_far = HR_762x39_Dmg_Far

	--														Eagle Heavy

	self.scar.CLIP_AMMO_MAX = 20
	self.scar.AMMO_MAX = 100
	self.scar.AMMO_PICKUP = self:_pickup_chance(self.scar.AMMO_MAX, 1)
	self.scar.stats.concealment = 8
	self.scar.stats.damage = 81
	self.scar.stats.spread = 21
	self.scar.stats.spread_moving = 11
	self.scar.stats.recoil = 15
	self.scar.panic_suppression_chance = nil

	self.scar.spread.steelsight = BR_S_ADS
	self.scar.spread.crouching = BR_S_Crouching
	self.scar.spread.standing = BR_S_Standing
	self.scar.spread.moving_steelsight = BR_S_ADS_M
	self.scar.spread.moving_crouching = BR_S_Crouching_M
	self.scar.spread.moving_standing = BR_S_Standing_M

	self.scar.kick.steelsight = self.scar.kick.standing
	self.scar.kick.crouching = self.scar.kick.standing

	self.scar.damage_min = BR_762nato_Dmg_Min
	self.scar.damage_near = BR_762nato_Dmg_Near
	self.scar.damage_far = BR_762nato_Dmg_Far
	
	--														Falcon
	
	self.fal.CLIP_AMMO_MAX = 20
	self.fal.AMMO_MAX = 100
	self.fal.AMMO_PICKUP = self:_pickup_chance(self.fal.AMMO_MAX, 1)
	self.fal.stats.concealment = 10
	self.fal.stats.damage = 80
	self.fal.stats.spread = 20
	self.fal.stats.spread_moving = 15
	self.fal.stats.recoil = 16
	self.fal.panic_suppression_chance = nil

	self.fal.spread.steelsight = BR_S_ADS
	self.fal.spread.crouching = BR_S_Crouching
	self.fal.spread.standing = BR_S_Standing
	self.fal.spread.moving_steelsight = BR_S_ADS_M
	self.fal.spread.moving_crouching = BR_S_Crouching_M
	self.fal.spread.moving_standing = BR_S_Standing_M

	self.fal.damage_min = BR_762nato_Dmg_Min
	self.fal.damage_near = BR_762nato_Dmg_Near
	self.fal.damage_far = BR_762nato_Dmg_Far

	--														Gewher 3
	self.g3.CLIP_AMMO_MAX = 20
	self.g3.AMMO_MAX = 100
	self.g3.AMMO_PICKUP = self:_pickup_chance(self.g3.AMMO_MAX, 1)
	self.g3.stats.concealment = 12
	self.g3.stats.damage = 80
	self.g3.stats.spread = 20
	self.g3.stats.spread_moving = 16
	self.g3.stats.recoil = 20
	self.g3.panic_suppression_chance = nil


	self.g3.spread.steelsight = BR_S_ADS
	self.g3.spread.crouching = BR_S_Crouching
	self.g3.spread.standing = BR_S_Standing
	self.g3.spread.moving_steelsight = BR_S_ADS_M
	self.g3.spread.moving_crouching = BR_S_Crouching_M
	self.g3.spread.moving_standing = BR_S_Standing_M
	self.g3.spread.moving_standing = BR_S_Standing_M

	self.g3.damage_min = BR_762nato_Dmg_Min
	self.g3.damage_near = BR_762nato_Dmg_Near
	self.g3.damage_far = BR_762nato_Dmg_Far

	--														M308

	self.new_m14.CLIP_AMMO_MAX = 10
	self.new_m14.AMMO_MAX = 70
	self.new_m14.AMMO_PICKUP = self:_pickup_chance(self.new_m14.AMMO_MAX, 1)
	self.new_m14.stats.concealment = 8
	self.new_m14.stats.damage = 115
	self.new_m14.stats.spread = 20
	self.new_m14.stats.spread_moving = 10
	self.new_m14.stats.recoil = 8
	self.new_m14.panic_suppression_chance = nil

	
	self.new_m14.spread.steelsight = DMR_S_ADS
	self.new_m14.spread.crouching = DMR_S_Crouching
	self.new_m14.spread.standing = DMR_S_Standing
	self.new_m14.spread.moving_steelsight = DMR_S_ADS_M
	self.new_m14.spread.moving_crouching = DMR_S_Crouching_M
	self.new_m14.spread.moving_standing = DMR_S_Standing_M
	
	self.new_m14.damage_min = DMR_308_Dmg_Min
	self.new_m14.damage_near = DMR_308_Dmg_Near
	self.new_m14.damage_far = DMR_308_Dmg_Far

	--														Cavity 9mm
	
	self.sub2000.CLIP_AMMO_MAX = 33
	self.sub2000.AMMO_MAX = 99
	self.sub2000.AMMO_PICKUP = self:_pickup_chance(self.sub2000.AMMO_MAX, 1)
	self.sub2000.stats.concealment = 25
	self.sub2000.stats.damage = 80
	self.sub2000.stats.spread = 20
	self.sub2000.stats.spread_moving = 20
	self.sub2000.stats.recoil = 9

	self.sub2000.spread.steelsight = LCarb_S_ADS
	self.sub2000.spread.crouching = LCarb_S_Crouching
	self.sub2000.spread.standing = LCarb_S_Standing
	self.sub2000.spread.moving_steelsight = LCarb_S_ADS_M
	self.sub2000.spread.moving_crouching = LCarb_S_Crouching_M
	self.sub2000.spread.moving_standing = LCarb_S_Standing_M

	self.sub2000.damage_min = 0.5
	self.sub2000.damage_near = Carb_556nato_Dmg_Near					-- 9mm XP +P/HP ammunition - Really a stretch
	self.sub2000.damage_far = Carb_556nato_Dmg_Far

	-------------------------------------------------------------------------------------------------------------------------------------
	--														PRIMARY SHOTGUN
	-------------------------------------------------------------------------------------------------------------------------------------
	-- r870				-- Reinfield 880
	-- saiga			-- IHZMA 12G
	-- huntsman			-- Mosconi 12G
	-- benelli			-- M1014
	-- ksg				-- Raven
	-- spas12			-- Predator 12G
	-- b682				-- Joceline O/U 12G
	-- aa12				-- Steakout 12G
	
	-- STILL TO DO: 
	-- Priority LOW - Useless Weapon Mods

	local Shotgun_S_ADS = 2
	local Shotgun_S_ADS_M = 2.4
	local Shotgun_S_Standing = 4.5
	local Shotgun_S_Standing_M = 4.9
	local Shotgun_S_Crouching = 4.5
	local Shotgun_S_Crouching_M = 4.9
	
	local HighRangeShot_Dmg_Min = 0
	local HighRangeShot_Dmg_Near = 13 * 100
	local HighRangeShot_Dmg_Far = 22 * 100
	
	local MedRangeShot_Dmg_Min = 0
	local MedRangeShot_Dmg_Near = 11 * 100
	local MedRangeShot_Dmg_Far = 19 * 100

	local ShortRangeShot_Dmg_Min = 0
	local ShortRangeShot_Dmg_Near = 8 * 100
	local ShortRangeShot_Dmg_Far = 17 * 100


	--														Reinfield 880

	self.r870.CLIP_AMMO_MAX = 7
	self.r870.AMMO_MAX = 54
	self.r870.AMMO_PICKUP = self:_pickup_chance(self.r870.AMMO_MAX, 1)
	self.r870.stats.concealment = 11
	self.r870.stats.damage = 72
	self.r870.stats.spread = 13
	self.r870.stats.spread_moving = 13
	self.r870.stats.recoil = 10
	self.r870.panic_suppression_chance = nil

	self.r870.spread.steelsight = Shotgun_S_ADS
	self.r870.spread.crouching = Shotgun_S_Crouching
	self.r870.spread.standing = Shotgun_S_Standing
	self.r870.spread.moving_steelsight = Shotgun_S_ADS_M
	self.r870.spread.moving_crouching = Shotgun_S_Crouching_M
	self.r870.spread.moving_standing = Shotgun_S_Standing_M

	self.r870.damage_min = MedRangeShot_Dmg_Min
	self.r870.damage_near = MedRangeShot_Dmg_Near
	self.r870.damage_far = MedRangeShot_Dmg_Far

	self.r870.rays = 10

	--														Raven

	self.ksg.CLIP_AMMO_MAX = 14
	self.ksg.AMMO_MAX = 50
	self.ksg.AMMO_PICKUP = self:_pickup_chance(self.ksg.AMMO_MAX, 1)
	self.ksg.stats.concealment = 22
	self.ksg.stats.damage = 64
	self.ksg.stats.spread = 11
	self.ksg.stats.spread_moving = 11
	self.ksg.stats.recoil = 11
	self.ksg.panic_suppression_chance = nil

	self.ksg.spread.steelsight = Shotgun_S_ADS
	self.ksg.spread.crouching = Shotgun_S_Crouching
	self.ksg.spread.standing = Shotgun_S_Standing
	self.ksg.spread.moving_steelsight = Shotgun_S_ADS_M
	self.ksg.spread.moving_crouching = Shotgun_S_Crouching_M
	self.ksg.spread.moving_standing = Shotgun_S_Standing_M

	self.ksg.damage_min = ShortRangeShot_Dmg_Min
	self.ksg.damage_near = ShortRangeShot_Dmg_Near
	self.ksg.damage_far = ShortRangeShot_Dmg_Far

	self.ksg.rays = 10

	--														Izhma 12G

	self.saiga.CLIP_AMMO_MAX = 10
	self.saiga.AMMO_MAX = 70
	self.saiga.AMMO_PICKUP = self:_pickup_chance(self.saiga.AMMO_MAX, 1)
	self.saiga.stats.damage = 38
	self.saiga.stats.spread = 9
	self.saiga.stats.spread_moving = 9
	self.saiga.stats.recoil = 14
	self.saiga.panic_suppression_chance = nil

	self.saiga.spread.steelsight = Shotgun_S_ADS
	self.saiga.spread.crouching = Shotgun_S_Crouching
	self.saiga.spread.standing = Shotgun_S_Standing
	self.saiga.spread.moving_steelsight = Shotgun_S_ADS_M
	self.saiga.spread.moving_crouching = Shotgun_S_Crouching_M
	self.saiga.spread.moving_standing = Shotgun_S_Standing_M

	self.saiga.damage_min = ShortRangeShot_Dmg_Min
	self.saiga.damage_near = ShortRangeShot_Dmg_Near
	self.saiga.damage_far = ShortRangeShot_Dmg_Far

	self.saiga.rays = 7

	--														Mosconi 12G

	self.huntsman.CLIP_AMMO_MAX = 2
	self.huntsman.AMMO_MAX = 32
	self.huntsman.AMMO_PICKUP = self:_pickup_chance(self.huntsman.AMMO_MAX, 1)
	self.huntsman.stats.damage = 145
	self.huntsman.stats.spread = 16
	self.huntsman.stats.spread_moving = 16
	self.huntsman.stats.recoil = 7
	self.huntsman.panic_suppression_chance = nil

	self.huntsman.spread.steelsight = Shotgun_S_ADS
	self.huntsman.spread.standing = Shotgun_S_Standing
	self.huntsman.spread.crouching = Shotgun_S_Crouching
	self.huntsman.spread.moving_steelsight = Shotgun_S_ADS_M
	self.huntsman.spread.moving_standing = Shotgun_S_Standing_M
	self.huntsman.spread.moving_crouching = Shotgun_S_Crouching_M

	self.huntsman.damage_min = HighRangeShot_Dmg_Min
	self.huntsman.damage_near = HighRangeShot_Dmg_Near
	self.huntsman.damage_far = HighRangeShot_Dmg_Far

	self.huntsman.rays = 12

	--														M1014
	self.benelli.CLIP_AMMO_MAX = 7
	self.benelli.AMMO_MAX = 72
	self.benelli.AMMO_PICKUP = self:_pickup_chance(self.benelli.AMMO_MAX, 1)
	self.benelli.stats.damage = 44
	self.benelli.stats.spread = 10
	self.benelli.stats.spread_moving = 10
	self.benelli.stats.recoil = 11
	self.benelli.panic_suppression_chance = nil

	self.benelli.spread.steelsight = Shotgun_S_ADS
	self.benelli.spread.crouching = Shotgun_S_Crouching
	self.benelli.spread.standing = Shotgun_S_Standing
	self.benelli.spread.moving_steelsight = Shotgun_S_ADS_M
	self.benelli.spread.moving_crouching = Shotgun_S_Crouching_M
	self.benelli.spread.moving_standing = Shotgun_S_Standing_M

	self.benelli.damage_min = MedRangeShot_Dmg_Min
	self.benelli.damage_near = MedRangeShot_Dmg_Near
	self.benelli.damage_far = MedRangeShot_Dmg_Far

	self.benelli.rays = 8

	--														Predator 12G
	self.spas12.CLIP_AMMO_MAX = 7
	self.spas12.AMMO_MAX = 75
	self.spas12.AMMO_PICKUP = self:_pickup_chance(self.spas12.AMMO_MAX, 1)
	self.spas12.stats.damage = 44
	self.spas12.stats.spread = 10
	self.spas12.stats.spread_moving = 10
	self.spas12.stats.recoil = 16
	self.spas12.panic_suppression_chance = nil
	
	self.spas12.spread.steelsight = Shotgun_S_ADS
	self.spas12.spread.crouching = Shotgun_S_Crouching
	self.spas12.spread.standing = Shotgun_S_Standing
	self.spas12.spread.moving_steelsight = Shotgun_S_ADS_M
	self.spas12.spread.moving_crouching = Shotgun_S_Crouching_M
	self.spas12.spread.moving_standing = Shotgun_S_Standing_M


	self.spas12.damage_min = MedRangeShot_Dmg_Min
	self.spas12.damage_near = MedRangeShot_Dmg_Near
	self.spas12.damage_far = MedRangeShot_Dmg_Far

	self.spas12.rays = 8

	--														Jouceline O/U 12G

	self.b682.CLIP_AMMO_MAX = 2
	self.b682.AMMO_MAX = 28
	self.b682.AMMO_PICKUP = self:_pickup_chance(self.b682.AMMO_MAX, 1)
	self.b682.stats.damage = 145
	self.b682.stats.spread = 16
	self.b682.stats.spread_moving = 16
	self.b682.stats.recoil = 8
	self.b682.panic_suppression_chance = nil

	self.b682.spread.steelsight = Shotgun_S_ADS
	self.b682.spread.crouching = Shotgun_S_Crouching
	self.b682.spread.standing = Shotgun_S_Standing
	self.b682.spread.moving_steelsight = Shotgun_S_ADS_M
	self.b682.spread.moving_crouching = Shotgun_S_Crouching_M
	self.b682.spread.moving_standing = Shotgun_S_Standing_M


	self.b682.damage_min = HighRangeShot_Dmg_Min
	self.b682.damage_near = HighRangeShot_Dmg_Near
	self.b682.damage_far = HighRangeShot_Dmg_Far


	--														Steakout 12G

	self.aa12.CLIP_AMMO_MAX = 8
	self.aa12.AMMO_MAX = 64
	self.aa12.AMMO_PICKUP = self:_pickup_chance(self.aa12.AMMO_MAX, 1)
	self.aa12.stats.damage = 37
	self.aa12.stats.spread = 8
	self.aa12.stats.spread_moving = 8
	self.aa12.stats.recoil = 16
	self.aa12.panic_suppression_chance = nil

	self.aa12.spread.steelsight = Shotgun_S_ADS
	self.aa12.spread.crouching = Shotgun_S_Crouching
	self.aa12.spread.standing = Shotgun_S_Standing
	self.aa12.spread.moving_steelsight = Shotgun_S_ADS_M
	self.aa12.spread.moving_crouching = Shotgun_S_Crouching_M
	self.aa12.spread.moving_standing = Shotgun_S_Standing_M

	self.aa12.damage_min = ShortRangeShot_Dmg_Min
	self.aa12.damage_near = ShortRangeShot_Dmg_Near
	self.aa12.damage_far = ShortRangeShot_Dmg_Far

	self.aa12.rays = 7
	self.aa12.timers.reload_not_empty = 4.1

	---------------------------------------------------------------------------------------------------------------------------
	-- 														LIGHT MACHINE GUNS
	---------------------------------------------------------------------------------------------------------------------------
	-- hk21				-- Brenner-21
	-- rpk				-- RPK
	-- m249				-- KSP
	-- mg42				-- Buzzsaw 42
	-- par 				-- Ksp 58

	local LMG_S_ADS = 1
	local LMG_S_ADS_M = 1.8
	local LMG_S_Crouching = 2.2
	local LMG_S_Crouching_M = 2.5
	local LMG_S_Standing = 4
	local LMG_S_Standing_M = 4
	 
	local LMG_Dmg_Min = 0.75
	local LMG_Dmg_Near = 30 * 100
	local LMG_Dmg_Far = 30 * 100
	 
	--														Brenner-21

	self.hk21.CLIP_AMMO_MAX = 150
	self.hk21.AMMO_MAX = 300
	self.hk21.AMMO_PICKUP = self:_pickup_chance(180, 1)
	self.hk21.stats.damage = 53
	self.hk21.stats.spread = 14
	self.hk21.stats.spread_moving = 10
	self.hk21.stats.recoil = 13
	self.hk21.panic_suppression_chance = 0.1

	self.hk21.spread.steelsight = LMG_S_ADS
	self.hk21.spread.crouching = LMG_S_Crouching
	self.hk21.spread.standing = LMG_S_Standing
	self.hk21.spread.moving_steelsight = LMG_S_ADS_M
	self.hk21.spread.moving_crouching = LMG_S_Crouching_M
	self.hk21.spread.moving_standing = LMG_S_Standing_M
	
	self.hk21.damage_min = LMG_Dmg_Min																-- 7.62 NATO
	self.hk21.damage_near = LMG_Dmg_Near
	self.hk21.damage_far = LMG_Dmg_Far
	
	self.hk21.timers.deploy_bipod = 1.35
	self.hk21.bipod_camera_spin_limit = 50
	self.hk21.bipod_camera_pitch_limit = 30

	--														RPK

	self.rpk.CLIP_AMMO_MAX = 100
	self.rpk.AMMO_MAX = 300
	self.rpk.AMMO_PICKUP = self:_pickup_chance(210, 1)
	self.rpk.stats.damage = 45
	self.rpk.stats.spread = 12
	self.rpk.stats.spread_moving = 12
	self.rpk.stats.recoil = 13
	self.rpk.panic_suppression_chance = 0.1
	
	self.rpk.spread.steelsight = LMG_S_ADS
	self.rpk.spread.crouching = LMG_S_Crouching
	self.rpk.spread.standing = LMG_S_Standing
	self.rpk.spread.moving_steelsight = LMG_S_ADS_M
	self.rpk.spread.moving_crouching = LMG_S_Crouching_M
	self.rpk.spread.moving_standing = LMG_S_Standing_M
	
	self.rpk.timers.deploy_bipod = 1.35
	self.rpk.bipod_camera_spin_limit = 50
	self.rpk.bipod_camera_pitch_limit = 30
	
	self.rpk.damage_min = Carb_556nato_Dmg_Min																		-- 5.45mm
	self.rpk.damage_near = Carb_556nato_Dmg_Near
	self.rpk.damage_far = Carb_556nato_Dmg_Far		
	
	--														KSP

	self.m249.CLIP_AMMO_MAX = 200
	self.m249.AMMO_MAX = 400
	self.m249.AMMO_PICKUP = self:_pickup_chance(210, 1)
	self.m249.stats.damage = 39
	self.m249.stats.spread = 12
	self.m249.stats.spread_moving = 8
	self.m249.stats.recoil = 10
	self.m249.panic_suppression_chance = 0.1

	self.m249.spread.steelsight = LMG_S_ADS
	self.m249.spread.crouching = LMG_S_Crouching
	self.m249.spread.standing = LMG_S_Standing
	self.m249.spread.moving_steelsight = LMG_S_ADS_M
	self.m249.spread.moving_crouching = LMG_S_Crouching_M
	self.m249.spread.moving_standing = LMG_S_Standing_M
	
	
	self.m249.timers.deploy_bipod = 1.35
	self.m249.bipod_camera_spin_limit = 50
	self.m249.bipod_camera_pitch_limit = 30
	
	self.m249.damage_min = Carb_556nato_Dmg_Min							-- 5.56 NATO
	self.m249.damage_near = Carb_556nato_Dmg_Near
	self.m249.damage_far = Carb_556nato_Dmg_Far		
	

	
	--														Buzzsaw 42

	self.mg42.CLIP_AMMO_MAX = 150
	self.mg42.AMMO_MAX = 450
	self.mg42.AMMO_PICKUP = self:_pickup_chance(180, 1)
	self.mg42.stats.damage = 36
	self.mg42.stats.spread = 11
	self.mg42.stats.spread_moving = 5
	self.mg42.stats.recoil = 12
	self.mg42.panic_suppression_chance = 0.1

	self.mg42.spread.steelsight = LMG_S_ADS
	self.mg42.spread.crouching = LMG_S_Crouching
	self.mg42.spread.standing = LMG_S_Standing
	self.mg42.spread.moving_steelsight = LMG_S_ADS_M
	self.mg42.spread.moving_crouching = LMG_S_Crouching_M
	self.mg42.spread.moving_standing = LMG_S_Standing_M
	
	self.mg42.damage_min = LMG_Dmg_Min																	-- 7.92x57mm
	self.mg42.damage_near = LMG_Dmg_Near
	self.mg42.damage_far = LMG_Dmg_Far
	
	self.mg42.timers.deploy_bipod = 1.35
	self.mg42.bipod_camera_spin_limit = 50
	self.mg42.bipod_camera_pitch_limit = 30
	
	--														Par

	self.par.CLIP_AMMO_MAX = 200
	self.par.AMMO_MAX = 400
	self.par.AMMO_PICKUP = self:_pickup_chance(210, 1)
	self.par.stats.damage = 39
	self.par.stats.spread = 11
	self.par.stats.spread_moving = 8
	self.par.stats.recoil = 14
	self.par.panic_suppression_chance = 0.1

	self.par.spread.steelsight = LMG_S_ADS
	self.par.spread.crouching = LMG_S_Crouching
	self.par.spread.standing = LMG_S_Standing
	self.par.spread.moving_steelsight = LMG_S_ADS_M
	self.par.spread.moving_crouching = LMG_S_Crouching_M
	self.par.spread.moving_standing = LMG_S_Standing_M
	
	self.par.damage_min = Carb_556nato_Dmg_Min
	self.par.damage_near = Carb_556nato_Dmg_Near
	self.par.damage_far = Carb_556nato_Dmg_Far								-- 5.56 NATO
	
	self.par.timers.deploy_bipod = 1.35
	self.par.bipod_camera_spin_limit = 50
	self.par.bipod_camera_pitch_limit = 30
	
	---------------------------------------------------------------------------------------------------------------------------
	--														SNIPER RIFLES
	---------------------------------------------------------------------------------------------------------------------------
	-- msr				-- Rattlesnake
	-- r93				-- R93
	-- m95				-- Thantos .50 Cal
	-- mosin			-- Nagant
	-- winchester1874	-- Repeater 1874
	-- wa2000			-- Lebensauger .308
	-- model70			-- Platypus 70
	
	local Sniper_S_ADS = 1
	local Sniper_S_ADS_M = 1.5
	local Sniper_S_Crouching = 6
	local Sniper_S_Crouching_M = 6
	local Sniper_S_Standing = 10
	local Sniper_S_Standing_M = 10
	
	--														Rattlesnake
	
	self.msr.CLIP_AMMO_MAX = 10
	self.msr.AMMO_MAX = 50
	self.msr.AMMO_PICKUP = self:_pickup_chance(self.msr.AMMO_MAX, 1)
	self.msr.stats.damage = 88
	self.msr.stats_modifiers = {damage = 2}
	self.msr.stats.spread = 24
	self.msr.stats.spread_moving = 2
	self.msr.stats.recoil = 17
	self.msr.panic_suppression_chance = 0.1

	self.msr.timers.reload_not_empty = 2.6
	
	self.msr.spread.steelsight = Sniper_S_ADS
	self.msr.spread.crouching = Sniper_S_Crouching
	self.msr.spread.standing = Sniper_S_Standing
	self.msr.spread.moving_steelsight = Sniper_S_ADS_M
	self.msr.spread.moving_crouching = Sniper_S_Crouching_M
	self.msr.spread.moving_standing = Sniper_S_Standing_M
	
	self.msr.damage_min = 1
	
	--														Lebensauger .308
	
	self.wa2000.CLIP_AMMO_MAX = 10
	self.wa2000.AMMO_MAX = 50
	self.wa2000.AMMO_PICKUP = self:_pickup_chance(self.wa2000.AMMO_MAX, 1)
	self.wa2000.stats.damage = 160
	self.wa2000.stats.spread = 23
	self.wa2000.stats.spread_moving = 10
	self.wa2000.stats.recoil = 6
	self.wa2000.panic_suppression_chance = 0.1
	
	self.wa2000.spread.steelsight = Sniper_S_ADS
	self.wa2000.spread.crouching = Sniper_S_Crouching
	self.wa2000.spread.standing = Sniper_S_Standing
	self.wa2000.spread.moving_steelsight = Sniper_S_ADS_M
	self.wa2000.spread.moving_crouching = Sniper_S_Crouching_M
	self.wa2000.spread.moving_standing = Sniper_S_Standing_M
	
	self.wa2000.damage_min = 1
	
	--														Repeater 1874
	
	self.winchester1874.CLIP_AMMO_MAX = 15
	self.winchester1874.AMMO_MAX = 50
	self.winchester1874.AMMO_PICKUP = self:_pickup_chance(self.winchester1874.AMMO_MAX, 1)
	self.winchester1874.stats.damage = 160
	self.winchester1874.stats.spread = 23
	self.winchester1874.stats.spread_moving = 7
	self.winchester1874.stats.recoil = 6
	self.winchester1874.panic_suppression_chance = 0.1
	
	self.winchester1874.spread.steelsight = Sniper_S_ADS
	self.winchester1874.spread.crouching = Sniper_S_Crouching
	self.winchester1874.spread.standing = Sniper_S_Standing
	self.winchester1874.spread.moving_steelsight = Sniper_S_ADS_M
	self.winchester1874.spread.moving_crouching = Sniper_S_Crouching_M
	self.winchester1874.spread.moving_standing = Sniper_S_Standing_M
	
	self.winchester1874.damage_min = 1
	
	--														R93
	
	self.r93.CLIP_AMMO_MAX = 6
	self.r93.AMMO_MAX = 30
	self.r93.AMMO_PICKUP = {0.7,1}
	self.r93.stats.damage = 140
	self.r93.stats_modifiers = {damage = 2}
	self.r93.stats.spread = 25
	self.r93.stats.spread_moving = 2
	self.r93.stats.recoil = 10
	self.r93.panic_suppression_chance = 0.1
	
	self.r93.spread.steelsight = Sniper_S_ADS
	self.r93.spread.crouching = Sniper_S_Crouching
	self.r93.spread.standing = Sniper_S_Standing
	self.r93.spread.moving_steelsight = Sniper_S_ADS_M
	self.r93.spread.moving_crouching = Sniper_S_Crouching_M
	self.r93.spread.moving_standing = Sniper_S_Standing_M
	
	self.r93.damage_min = 1
	
	--														Nagant
	
	self.mosin.CLIP_AMMO_MAX = 5
	self.mosin.AMMO_MAX = 25
	self.mosin.AMMO_PICKUP = {0.7,1}
	self.mosin.stats.damage = 140
	self.mosin.stats_modifiers = {damage = 2}
	self.mosin.stats.spread = 25
	self.mosin.stats.spread_moving = 4
	self.mosin.stats.recoil = 10
	self.mosin.panic_suppression_chance = 0.1
	
	self.mosin.spread.steelsight = Sniper_S_ADS
	self.mosin.spread.crouching = Sniper_S_Crouching
	self.mosin.spread.standing = Sniper_S_Standing
	self.mosin.spread.moving_steelsight = Sniper_S_ADS_M
	self.mosin.spread.moving_crouching = Sniper_S_Crouching_M
	self.mosin.spread.moving_standing = Sniper_S_Standing_M
	
	self.mosin.timers.reload_not_empty = 3.2
	self.mosin.timers.reload_empty = 3.2
	
	self.mosin.damage_min = 1
	
	--														Platypus 70
	
	self.model70.CLIP_AMMO_MAX = 5
	self.model70.AMMO_MAX = 35
	self.model70.AMMO_PICKUP = {0.7,1}
	self.model70.stats.damage = 140
	self.model70.stats_modifiers = {damage = 2}
	self.model70.stats.spread = 25
	self.model70.stats.spread_moving = 6
	self.model70.stats.recoil = 10
	self.model70.panic_suppression_chance = 0.1
	
	self.model70.spread.steelsight = Sniper_S_ADS
	self.model70.spread.crouching = Sniper_S_Crouching
	self.model70.spread.standing = Sniper_S_Standing
	self.model70.spread.moving_steelsight = Sniper_S_ADS_M
	self.model70.spread.moving_crouching = Sniper_S_Crouching_M
	self.model70.spread.moving_standing = Sniper_S_Standing_M
	
	self.model70.damage_min = 1
	
	--														Thanatos .50 Cal
	
	self.m95.CLIP_AMMO_MAX = 5
	self.m95.AMMO_MAX = 15
	self.m95.AMMO_PICKUP = {0.05, 0.65}
	self.m95.stats.damage = 145
	self.m95.stats_modifiers = {damage = 20}
	self.m95.stats.spread = 24
	self.m95.stats.spread_moving = 1
	self.m95.stats.recoil = 2
	self.m95.panic_suppression_chance = 0.1
	
	self.m95.spread.steelsight = Sniper_S_ADS
	self.m95.spread.crouching = Sniper_S_Crouching
	self.m95.spread.standing = Sniper_S_Standing
	self.m95.spread.moving_steelsight = Sniper_S_ADS_M
	self.m95.spread.moving_crouching = Sniper_S_Crouching_M
	self.m95.spread.moving_standing = Sniper_S_Standing_M
	
	self.m95.damage_min = 1
	
	---------------------------------------------------------------------------------------------------------------------------
	--														SPECIAL WEAPONS
	---------------------------------------------------------------------------------------------------------------------------
	-- saw				-- Saw
	-- gre_m79			-- GL40 Grenade Launcher
	-- m32				-- M32 Grenade Launcher
	-- flamethrower_mk2	-- Flamethrower
	-- m134				-- Vulcan Minigun
	-- plainsrider		-- Plainsrider Bow
	-- frankish			-- Light Crossbow
	-- arblast			-- Heavy Crossbow
	-- long				-- English Longbow
	
	-- Priority High - Balance poison/normal arrows vs HE by capacity
	-- Priority Medium - Give special weapons their own unique spread values
	
	-- OVE9000 Saw
	self.saw.CLIP_AMMO_MAX = 150
	self.saw.AMMO_MAX = 300
	self.saw.AMMO_PICKUP = {0, 0}
	self.saw.stats.concealment = 16
	self.saw.stats.damage = 23
	self.saw.stats.spread = 6
	self.saw.stats.spread_moving = 8
	self.saw.stats.recoil = 7
	self.saw.panic_suppression_chance = 0.2
	
	-- GL40 Grenade Launcher
	
	self.gre_m79.CLIP_AMMO_MAX = 1
	self.gre_m79.AMMO_MAX = 6
	self.gre_m79.AMMO_PICKUP = {0.05, 0.65}
	self.gre_m79.stats.concealment = 18
	self.gre_m79.stats.damage = 170
	self.gre_m79.stats_modifiers = {damage = 2}
	self.gre_m79.stats.spread = 18
	self.gre_m79.stats.spread_moving = 6
	self.gre_m79.stats.recoil = 7
	self.gre_m79.panic_suppression_chance = 0.2
	
	self.gre_m79.spread.steelsight = Shotgun_S_ADS
	self.gre_m79.spread.crouching = Shotgun_S_Crouching
	self.gre_m79.spread.standing = Shotgun_S_Standing
	self.gre_m79.spread.moving_steelsight = Shotgun_S_ADS_M
	self.gre_m79.spread.moving_crouching = Shotgun_S_Crouching_M
	self.gre_m79.spread.moving_standing = Shotgun_S_Standing_M
	
	-- M32 Grenade Launcher
	
	self.m32.CLIP_AMMO_MAX = 6
	self.m32.AMMO_MAX = 12
	self.m32.AMMO_PICKUP = {0.05, 0.65}
	self.m32.stats.concealment = 10
	self.m32.stats.damage = 170
	self.m32.stats_modifiers = {damage = 2}
	self.m32.stats.spread = 19
	self.m32.stats.spread_moving = 14
	self.m32.stats.recoil = 21
	self.m32.panic_suppression_chance = 0.2
	
	self.m32.spread.steelsight = Shotgun_S_ADS
	self.m32.spread.crouching = Shotgun_S_Crouching
	self.m32.spread.standing = Shotgun_S_Standing
	self.m32.spread.moving_steelsight = Shotgun_S_ADS_M
	self.m32.spread.moving_crouching = Shotgun_S_Crouching_M
	self.m32.spread.moving_standing = Shotgun_S_Standing_M
	
	-- M32 Grenade Launcher
	
	self.flamethrower_mk2.CLIP_AMMO_MAX = 200
	self.flamethrower_mk2.AMMO_MAX = 600
	self.flamethrower_mk2.AMMO_PICKUP = self:_pickup_chance(90, 1)
	self.flamethrower_mk2.stats.concealment = 7
	self.flamethrower_mk2.stats.damage = 14
	self.flamethrower_mk2.stats.spread = 1
	self.flamethrower_mk2.stats.spread_moving = 6
	self.flamethrower_mk2.stats.recoil = 0
	self.flamethrower_mk2.panic_suppression_chance = nil
	
	self.flamethrower_mk2.spread.steelsight = Shotgun_S_ADS
	self.flamethrower_mk2.spread.crouching = Shotgun_S_Crouching
	self.flamethrower_mk2.spread.standing = Shotgun_S_Standing
	self.flamethrower_mk2.spread.moving_steelsight = Shotgun_S_ADS_M
	self.flamethrower_mk2.spread.moving_crouching = Shotgun_S_Crouching_M
	self.flamethrower_mk2.spread.moving_standing = Shotgun_S_Standing_M
	
	-- Vulcan Minigun
	
	self.m134.CLIP_AMMO_MAX = 750
	self.m134.AMMO_MAX = 750
	self.m134.AMMO_PICKUP = self:_pickup_chance(90, 1)
	self.m134.stats.concealment = 5
	self.m134.stats.damage = 35
	self.m134.stats.spread = 5
	self.m134.stats.spread_moving = 1
	self.m134.stats.recoil = 2
	self.m134.panic_suppression_chance = 0.1
	
	self.m134.spread.steelsight = LMG_S_ADS
	self.m134.spread.crouching = LMG_S_Crouching
	self.m134.spread.standing = LMG_S_Standing
	self.m134.spread.moving_steelsight = LMG_S_ADS_M
	self.m134.spread.moving_crouching = LMG_S_Crouching_M
	self.m134.spread.moving_standing = LMG_S_Standing_M
	
	self.m134.damage_min = LMG_Dmg_Min																	-- 7.62 NATO FMJ
	self.m134.damage_near = LMG_Dmg_Near
	self.m134.damage_far = LMG_Dmg_Far
	
	-- Plainsrider
	
	self.plainsrider.CLIP_AMMO_MAX = 1
	self.plainsrider.AMMO_MAX = 50
	--self.plainsrider.AMMO_PICKUP = self:_pickup_chance(0, self.plainsrider.use_data.selection_index)
	self.plainsrider.stats.concealment = 30
	self.plainsrider.stats.damage = 97
	self.plainsrider.stats_modifiers = {damage = 2}
	self.plainsrider.stats.spread = 24
	self.plainsrider.stats.spread_moving = 12
	self.plainsrider.stats.recoil = 25
	self.plainsrider.panic_suppression_chance = 0.3
	
	self.plainsrider.spread.steelsight = Shotgun_S_ADS
	self.plainsrider.spread.crouching = Shotgun_S_Crouching
	self.plainsrider.spread.standing = Shotgun_S_Standing
	self.plainsrider.spread.moving_steelsight = Shotgun_S_ADS_M
	self.plainsrider.spread.moving_crouching = Shotgun_S_Crouching_M
	self.plainsrider.spread.moving_standing = Shotgun_S_Standing_M
	
	-- English Longbow
	
	self.long.CLIP_AMMO_MAX = 1
	self.long.AMMO_MAX = 35
	--self.long.AMMO_PICKUP = self:_pickup_chance(0, self.long.use_data.selection_index)
	self.long.stats.concealment = 29
	self.long.stats.damage = 65
	self.long.stats_modifiers = {damage = 10}
	self.long.stats.spread = 24
	self.long.stats.spread_moving = 10
	self.long.stats.recoil = 25
	self.long.panic_suppression_chance = 0.3
	
	self.long.spread.steelsight = Shotgun_S_ADS
	self.long.spread.crouching = Shotgun_S_Crouching
	self.long.spread.standing = Shotgun_S_Standing
	self.long.spread.moving_steelsight = Shotgun_S_ADS_M
	self.long.spread.moving_crouching = Shotgun_S_Crouching_M
	self.long.spread.moving_standing = Shotgun_S_Standing_M
	
	-- Light Crossbow
	
	self.frankish.CLIP_AMMO_MAX = 1
	self.frankish.AMMO_MAX = 50
	self.frankish.AMMO_PICKUP = self:_pickup_chance(0, 1)
	self.frankish.stats.concealment = 29
	self.frankish.stats.damage = 120
	self.frankish.stats_modifiers = {damage = 2}
	self.frankish.stats.spread = 23
	self.frankish.stats.spread_moving = 23
	self.frankish.stats.recoil = 19
	self.frankish.panic_suppression_chance = 0.3
	
	self.frankish.spread.steelsight = Shotgun_S_ADS
	self.frankish.spread.crouching = Shotgun_S_Crouching
	self.frankish.spread.standing = Shotgun_S_Standing
	self.frankish.spread.moving_steelsight = Shotgun_S_ADS_M
	self.frankish.spread.moving_crouching = Shotgun_S_Crouching_M
	self.frankish.spread.moving_standing = Shotgun_S_Standing_M
	
	-- Heavy Crossbow
	
	self.arblast.CLIP_AMMO_MAX = 1
	self.arblast.AMMO_MAX = 35
	self.arblast.AMMO_PICKUP = self:_pickup_chance(0, 1)
	self.arblast.stats.concealment = 28
	self.arblast.stats.damage = 53
	self.arblast.stats_modifiers = {damage = 10}
	self.arblast.stats.spread = 23
	self.arblast.stats.spread_moving = 23
	self.arblast.stats.recoil = 19
	self.arblast.panic_suppression_chance = 0.3
	
	self.arblast.spread.steelsight = Shotgun_S_ADS
	self.arblast.spread.crouching = Shotgun_S_Crouching
	self.arblast.spread.standing = Shotgun_S_Standing
	self.arblast.spread.moving_steelsight = Shotgun_S_ADS_M
	self.arblast.spread.moving_crouching = Shotgun_S_Crouching_M
	self.arblast.spread.moving_standing = Shotgun_S_Standing_M
	
	---------------------------------------------------------------------------------------------------------------------------
	--														AKIMBOS
	---------------------------------------------------------------------------------------------------------------------------
	-- jowi				-- Chimano Compact
	-- x_1911			-- Crosskill
	-- x_b92fs			-- Bernetti 9
	-- x_deagle			-- Deagle
	-- x_g22c			-- Chimano Custom
	-- x_g17			-- Chimano 88
	-- x_usp			-- Interceptor 45
	
	-- STILL TO DO: 
	-- Priotity Medium - Test out total ammo changes
	-- Priority Low - Useless Weapon Mods
	
	local Pistol9mm_S_ADS = 1
	local Pistol9mm_S_ADS_M = 1.5
	local Pistol9mm_S_Crouching = 2.2
	local Pistol9mm_S_Crouching_M = 2.5
	local Pistol9mm_S_Standing = 2.2
	local Pistol9mm_S_Standing_M = 2.5

	local Pistol45_S_ADS = 1
	local Pistol45_S_ADS_M = 1.3
	local Pistol45_S_Crouching = 2
	local Pistol45_S_Crouching_M = 2
	local Pistol45_S_Standing = 2
	local Pistol45_S_Standing_M = 2
	
	local PistolH_S_ADS = 1 
	local PistolH_S_ADS_M = 1.8
	local PistolH_S_Crouching = 2.2
	local PistolH_S_Crouching_M = 3
	local PistolH_S_Standing = 3.5
	local PistolH_S_Standing_M = 4

	local Pistol_9mm_Dmg_Min = 0.2
	local Pistol_9mm_Dmg_Near = 15 * 100
	local Pistol_9mm_Dmg_Far = 25 * 100

	local Pistol_45acp_Dmg_Min = 0.25
	local Pistol_45acp_Dmg_Near = 15 * 100
	local Pistol_45acp_Dmg_Far = 25 * 100

	local Pistol_44magnum_Dmg_Min = 0.5
	local Pistol_44magnum_Dmg_Near = 20 * 100
	local Pistol_44magnum_Dmg_Far = 30 * 100

	local Revolver_44magnum_Dmg_Min = 0.5
	local Revolver_44magnum_Dmg_Near = 25 * 100
	local Revolver_44magnum_Dmg_Far = 30 * 100
	
	--														Akimbo Chimano Compact

	self.jowi.CLIP_AMMO_MAX = 20
	self.jowi.AMMO_MAX = 160
	self.jowi.AMMO_PICKUP = self:_pickup_chance(self.jowi.AMMO_MAX, 1)
	self.jowi.stats.concealment = 30
	self.jowi.stats.damage = 38
	self.jowi.stats.spread = 18
	self.jowi.stats.spread_moving = 21
	self.jowi.stats.recoil = 16
	self.jowi.panic_suppression_chance = nil
	
	self.jowi.spread.steelsight = Pistol9mm_S_ADS
	self.jowi.spread.crouching = Pistol9mm_S_Crouching
	self.jowi.spread.standing = Pistol9mm_S_Standing
	self.jowi.spread.moving_steelsight = Pistol9mm_S_ADS_M
	self.jowi.spread.moving_crouching = Pistol9mm_S_Crouching_M
	self.jowi.spread.moving_standing = Pistol9mm_S_Standing_M

	self.jowi.damage_min = Pistol_9mm_Dmg_Min							-- 9mm
	self.jowi.damage_near = Pistol_9mm_Dmg_Near
	self.jowi.damage_far = Pistol_9mm_Dmg_Far
	
	
	--														Akimbo Bernetti
	
	self.x_b92fs.CLIP_AMMO_MAX = 28
	self.x_b92fs.AMMO_MAX = 196
	self.x_b92fs.AMMO_PICKUP = self:_pickup_chance(self.x_b92fs.AMMO_MAX, 1)
	self.x_b92fs.stats.concealment = 30
	self.x_b92fs.stats.damage = 38
	self.x_b92fs.stats.spread = 18
	self.x_b92fs.stats.spread_moving = 22
	self.x_b92fs.stats.recoil = 17
	self.x_b92fs.panic_suppression_chance = nil

	self.x_b92fs.spread.steelsight = Pistol9mm_S_ADS
	self.x_b92fs.spread.crouching = Pistol9mm_S_Crouching
	self.x_b92fs.spread.standing = Pistol9mm_S_Standing
	self.x_b92fs.spread.moving_steelsight = Pistol9mm_S_ADS_M
	self.x_b92fs.spread.moving_crouching = Pistol9mm_S_Crouching_M
	self.x_b92fs.spread.moving_standing = Pistol9mm_S_Standing_M

	self.x_b92fs.damage_min = Pistol_9mm_Dmg_Min					-- 9mm
	self.x_b92fs.damage_near = Pistol_9mm_Dmg_Near
	self.x_b92fs.damage_far = Pistol_9mm_Dmg_Far
	
	--														Akimbo Chimano 88
	self.x_g17.CLIP_AMMO_MAX = 34
	self.x_g17.AMMO_MAX = 187
	self.x_g17.AMMO_PICKUP = self:_pickup_chance(self.x_g17.AMMO_MAX, 1)
	self.x_g17.stats.concealment = 30
	self.x_g17.stats.damage = 37
	self.x_g17.stats.spread = 16
	self.x_g17.stats.spread_moving = 16
	self.x_g17.stats.recoil = 16
	self.x_g17.panic_suppression_chance = nil
	
	self.x_g17.spread.steelsight = Pistol9mm_S_ADS
	self.x_g17.spread.crouching = Pistol9mm_S_Crouching
	self.x_g17.spread.standing = Pistol9mm_S_Standing
	self.x_g17.spread.moving_steelsight = Pistol9mm_S_ADS_M
	self.x_g17.spread.moving_crouching = Pistol9mm_S_Crouching_M
	self.x_g17.spread.moving_standing = Pistol9mm_S_Standing_M

	self.x_g17.damage_min = Pistol_9mm_Dmg_Min						-- 9mm
	self.x_g17.damage_near = Pistol_9mm_Dmg_Near
	self.x_g17.damage_far = Pistol_9mm_Dmg_Far

	--														MEDIUM CALIBRE
	--														Akimbo Crosskill
	self.x_1911.CLIP_AMMO_MAX = 20
	self.x_1911.AMMO_MAX = 130
	self.x_1911.AMMO_PICKUP = self:_pickup_chance(self.x_1911.AMMO_MAX, 1)
	self.x_1911.stats.concealment = 27
	self.x_1911.stats.damage = 50
	self.x_1911.stats.spread = 18
	self.x_1911.stats.spread_moving = 10
	self.x_1911.stats.recoil = 15
	self.x_1911.panic_suppression_chance = nil

	self.x_1911.spread.steelsight = Pistol45_S_ADS
	self.x_1911.spread.crouching = Pistol45_S_Crouching
	self.x_1911.spread.standing = Pistol45_S_Standing
	self.x_1911.spread.moving_steelsight = Pistol45_S_ADS_M
	self.x_1911.spread.moving_crouching = Pistol45_S_Crouching_M
	self.x_1911.spread.moving_standing = Pistol45_S_Standing_M

	self.x_1911.damage_min = Pistol_45acp_Dmg_Min						-- .45
	self.x_1911.damage_near = Pistol_45acp_Dmg_Near
	self.x_1911.damage_far = Pistol_45acp_Dmg_Far
	
	--														Akimbo Chimano Custom

	self.x_g22c.CLIP_AMMO_MAX = 32
	self.x_g22c.AMMO_MAX = 144
	self.x_g22c.AMMO_PICKUP = self:_pickup_chance(self.x_g22c.AMMO_MAX, 1)
	self.x_g22c.stats.concealment = 29
	self.x_g22c.stats.damage = 44
	self.x_g22c.stats.spread = 20
	self.x_g22c.stats.spread_moving = 10
	self.x_g22c.stats.recoil = 14
	self.x_g22c.panic_suppression_chance = nil

	
	self.x_g22c.spread.steelsight = Pistol45_S_ADS
	self.x_g22c.spread.crouching = Pistol45_S_Crouching
	self.x_g22c.spread.standing = Pistol45_S_Standing
	self.x_g22c.spread.moving_steelsight = Pistol45_S_ADS_M
	self.x_g22c.spread.moving_crouching = Pistol45_S_Crouching_M
	self.x_g22c.spread.moving_standing = Pistol45_S_Standing_M
	
	self.x_g22c.damage_min = Pistol_45acp_Dmg_Min						-- .40 S&W
	self.x_g22c.damage_near = Pistol_45acp_Dmg_Near
	self.x_g22c.damage_far = Pistol_45acp_Dmg_Far
	

	
	--														Akimbo Interceptor .45

	self.x_usp.CLIP_AMMO_MAX = 26
	self.x_usp.AMMO_MAX = 130
	self.x_usp.AMMO_PICKUP = self:_pickup_chance(self.x_usp.AMMO_MAX, 1)
	self.x_usp.stats.concealment = 29
	self.x_usp.stats.damage = 49
	self.x_usp.stats.spread = 18
	self.x_usp.stats.spread_moving = 10
	self.x_usp.stats.recoil = 14
	self.x_usp.panic_suppression_chance = nil
	
	self.x_usp.spread.steelsight = Pistol45_S_ADS
	self.x_usp.spread.crouching = Pistol45_S_Crouching
	self.x_usp.spread.standing = Pistol45_S_Standing
	self.x_usp.spread.moving_steelsight = Pistol45_S_ADS_M
	self.x_usp.spread.moving_crouching = Pistol45_S_Crouching_M
	self.x_usp.spread.moving_standing = Pistol45_S_Standing_M
	
	self.x_usp.damage_min = Pistol_45acp_Dmg_Min						-- .45
	self.x_usp.damage_near = Pistol_45acp_Dmg_Near
	self.x_usp.damage_far = Pistol_45acp_Dmg_Far
	
	
	--														LARGE CALIBRE
	
	--														Akimbo Deagle

	self.x_deagle.CLIP_AMMO_MAX = 16
	self.x_deagle.AMMO_MAX = 56
	self.x_deagle.AMMO_PICKUP = self:_pickup_chance(self.x_deagle.AMMO_MAX, 1)
	self.x_deagle.stats.concealment = 26
	self.x_deagle.stats.damage = 113
	self.x_deagle.stats.spread = 18
	self.x_deagle.stats.spread_moving = 10
	self.x_deagle.stats.recoil = 3
	self.x_deagle.panic_suppression_chance = nil
	
	self.x_deagle.spread.steelsight = Pistol45_S_ADS
	self.x_deagle.spread.crouching = Pistol45_S_Crouching
	self.x_deagle.spread.standing = Pistol45_S_Standing
	self.x_deagle.spread.moving_steelsight = Pistol45_S_ADS_M
	self.x_deagle.spread.moving_crouching = Pistol45_S_Crouching_M
	self.x_deagle.spread.moving_standing = Pistol45_S_Standing_M
	
	self.x_deagle.damage_min = Pistol_44magnum_Dmg_Min						-- .44 Magnum
	self.x_deagle.damage_near = Pistol_44magnum_Dmg_Near
	self.x_deagle.damage_far = Pistol_44magnum_Dmg_Far
	
	---------------------------------------------------------------------------------------------------------------------------
	--														SECONDARY SHOTGUNS
	---------------------------------------------------------------------------------------------------------------------------
	-- serbu 			-- Locomotive 12G
	-- striker			-- Street Sweeper
	-- judge			-- The Judge
	-- m37				-- GSPS 12G

	--														Locomotive 12G

	self.serbu.CLIP_AMMO_MAX = 6
	self.serbu.AMMO_MAX = 42
	self.serbu.AMMO_PICKUP = self:_pickup_chance(self.serbu.AMMO_MAX, 1)
	self.serbu.stats.damage = 62
	self.serbu.stats.spread = 13
	self.serbu.stats.spread_moving = 10
	self.serbu.stats.recoil = 10
	self.serbu.panic_suppression_chance = nil

	self.serbu.spread.steelsight = Shotgun_S_ADS
	self.serbu.spread.crouching = Shotgun_S_Crouching
	self.serbu.spread.standing = Shotgun_S_Standing
	self.serbu.spread.moving_steelsight = Shotgun_S_ADS_M
	self.serbu.spread.moving_crouching = Shotgun_S_Crouching_M
	self.serbu.spread.moving_standing = Shotgun_S_Standing_M

	self.serbu.damage_min = ShortRangeShot_Dmg_Min
	self.serbu.damage_near = ShortRangeShot_Dmg_Near
	self.serbu.damage_far = ShortRangeShot_Dmg_Far

	self.serbu.rays = 9

	--														Striker

	self.striker.CLIP_AMMO_MAX = 12
	self.striker.AMMO_MAX = 72
	self.striker.AMMO_PICKUP = self:_pickup_chance(self.striker.AMMO_MAX, 1)
	self.striker.stats.concealment = 21
	self.striker.stats.damage = 36
	self.striker.stats.spread = 8
	self.striker.stats.spread_moving = 8
	self.striker.stats.recoil = 12
	self.striker.panic_suppression_chance = nil

	self.striker.spread.steelsight = Shotgun_S_ADS
	self.striker.spread.crouching = Shotgun_S_Crouching
	self.striker.spread.standing = Shotgun_S_Standing
	self.striker.spread.moving_steelsight = Shotgun_S_ADS_M
	self.striker.spread.moving_crouching = Shotgun_S_Crouching_M
	self.striker.spread.moving_standing = Shotgun_S_Standing_M

	self.striker.damage_min = ShortRangeShot_Dmg_Min
	self.striker.damage_near = ShortRangeShot_Dmg_Near
	self.striker.damage_far = ShortRangeShot_Dmg_Far
	
	self.striker.rays = 8
	
	--														Judge
	
	self.judge.CLIP_AMMO_MAX = 5
	self.judge.AMMO_MAX = 25
	self.judge.AMMO_PICKUP = self:_pickup_chance(self.judge.AMMO_MAX, 1)
	self.judge.stats.concealment = 29
	self.judge.stats.damage = 95
	self.judge.stats.spread = 14
	self.judge.stats.spread_moving = 14
	self.judge.stats.recoil = 5
	self.judge.panic_suppression_chance = nil

	self.judge.spread.steelsight = Shotgun_S_ADS
	self.judge.spread.crouching = Shotgun_S_Crouching
	self.judge.spread.standing = Shotgun_S_Standing
	self.judge.spread.moving_steelsight = Shotgun_S_ADS_M
	self.judge.spread.moving_crouching = Shotgun_S_Crouching_M
	self.judge.spread.moving_standing = Shotgun_S_Standing_M

	self.judge.damage_min = ShortRangeShot_Dmg_Min
	self.judge.damage_near = ShortRangeShot_Dmg_Near
	self.judge.damage_far = ShortRangeShot_Dmg_Far

	self.judge.rays = 7
	
	--													GSPS 12G
	
	self.m37.CLIP_AMMO_MAX = 7
	self.m37.AMMO_MAX = 35
	self.m37.AMMO_PICKUP = self:_pickup_chance(self.m37.AMMO_MAX, 1)
	self.m37.stats.concealment = 22
	self.m37.stats.damage = 72
	self.m37.stats.spread = 12
	self.m37.stats.spread_moving = 12
	self.m37.stats.recoil = 11
	self.m37.panic_suppression_chance = nil

	self.m37.spread.steelsight = Shotgun_S_ADS
	self.m37.spread.crouching = Shotgun_S_Crouching
	self.m37.spread.standing = Shotgun_S_Standing
	self.m37.spread.moving_steelsight = Shotgun_S_ADS_M
	self.m37.spread.moving_crouching = Shotgun_S_Crouching_M
	self.m37.spread.moving_standing = Shotgun_S_Standing_M

	self.m37.damage_min = MedRangeShot_Dmg_Min
	self.m37.damage_near = MedRangeShot_Dmg_Near
	self.m37.damage_far = MedRangeShot_Dmg_Far
	
	self.m37.rays = 8
	
	---------------------------------------------------------------------------------------------------------------------------
	--														SUB MACHINE GUNS
	---------------------------------------------------------------------------------------------------------------------------
	-- mac10			-- Mark 10
	-- new_mp5			-- Compact-5
	-- mp9				-- CMP
	-- olympic			-- Para
	-- akmsu			-- Krinkov
	-- p90				-- Kobus 90
	-- m45				-- Swedish K
	-- mp7				-- SpecOps
	-- scorpion			-- Cobra
	-- tec9				-- Blaster 9mm
	-- uzi				-- Uzi
	-- sterling 		-- Patchett L2A1
	-- m1928			-- Thompson
	-- cobray			-- Jacket's Piece
	-- polymer			-- Vector
	-- baka 			-- Micro Uzi
	
	-- STILL TO DO:
	-- Priority High - Evaluate damage falloff of SMGs
	-- Priority Low - Useless weapon mods

	local SMG_S_ADS = 1
	local SMG_S_ADS_M = 1.5
	local SMG_S_Crouching = 2.2
	local SMG_S_Crouching_M = 2.5
	local SMG_S_Standing = 2.2
	local SMG_S_Standing_M = 2.5

	local MachineP_9mm_Dmg_Min = 0.2
	local MachineP_9mm_Dmg_Near = 15 * 100
	local MachineP_9mm_Dmg_Far = 25 * 100

	local SMG_9mm_Dmg_Min = 0.25
	local SMG_9mm_Dmg_Near = 15 * 100
	local SMG_9mm_Dmg_Far = 25 * 100

	local SMG_45acp_Dmg_Min = 0.3
	local SMG_45acp_Dmg_Near = 15 * 100
	local SMG_45acp_Dmg_Far = 25 * 100

	local PDW_Dmg_Min = 0.5
	local PDW_Dmg_Near = 15 * 100
	local PDW_Dmg_Far = 30 * 100

	--														MACHINE PISTOLS
	--														Jacket's Piece

	self.cobray.CLIP_AMMO_MAX = 32
	self.cobray.AMMO_MAX = 196
	self.cobray.AMMO_PICKUP = self:_pickup_chance(self.cobray.AMMO_MAX, 1)
	self.cobray.stats.concealment = 25
	self.cobray.stats.damage = 34
	self.cobray.stats.spread = 12
	self.cobray.stats.spread_moving = 20
	self.cobray.stats.recoil = 14
	self.cobray.panic_suppression_chance = 0.05

	self.cobray.spread.steelsight = SMG_S_ADS
	self.cobray.spread.crouching = SMG_S_Crouching
	self.cobray.spread.standing = SMG_S_Standing
	self.cobray.spread.moving_steelsight = SMG_S_ADS_M
	self.cobray.spread.moving_crouching = SMG_S_Crouching_M
	self.cobray.spread.moving_standing = SMG_S_Standing_M

	self.cobray.damage_min = MachineP_9mm_Dmg_Min
	self.cobray.damage_near = MachineP_9mm_Dmg_Near
	self.cobray.damage_far = MachineP_9mm_Dmg_Far
	
	self.cobray.kick.standing = {
			1,
			1.2,
			-1,
			1
	}
		
	self.cobray.kick.steelsight = self.cobray.kick.standing
	self.cobray.kick.crouching = self.cobray.kick.standing


	--														CMP
	self.mp9.CLIP_AMMO_MAX = 30
	self.mp9.AMMO_MAX = 180
	self.mp9.AMMO_PICKUP = self:_pickup_chance(self.mp9.AMMO_MAX, 1)
	self.mp9.stats.concealment = 26
	self.mp9.stats.damage = 37
	self.mp9.stats.spread = 10
	self.mp9.stats.spread_moving = 20
	self.mp9.stats.recoil = 20
	self.mp9.panic_suppression_chance = 0.05

	self.mp9.spread.steelsight = SMG_S_ADS
	self.mp9.spread.crouching = SMG_S_Crouching
	self.mp9.spread.standing = SMG_S_Standing
	self.mp9.spread.moving_steelsight = SMG_S_ADS_M
	self.mp9.spread.moving_crouching = SMG_S_Crouching_M
	self.mp9.spread.moving_standing = SMG_S_Standing_M

	self.mp9.damage_min = MachineP_9mm_Dmg_Min
	self.mp9.damage_near = MachineP_9mm_Dmg_Near
	self.mp9.damage_far = MachineP_9mm_Dmg_Far
	
	self.mp9.kick.standing = {
			0.6,
			0.8,
			-1,
			1
	}
		
	self.mp9.kick.steelsight = self.mp9.kick.standing
	self.mp9.kick.crouching = self.mp9.kick.standing
	--														Micro Uzi

	self.baka.CLIP_AMMO_MAX = 30
	self.baka.AMMO_MAX = 240
	self.baka.AMMO_PICKUP = self:_pickup_chance(self.baka.AMMO_MAX, 1)
	self.baka.stats.concealment = 29
	self.baka.stats.damage = 32
	self.baka.stats.spread = 10
	self.baka.stats.spread_moving = 20
	self.baka.stats.recoil = 20
	self.baka.panic_suppression_chance = 0.05

	self.baka.spread.steelsight = SMG_S_ADS
	self.baka.spread.crouching = SMG_S_Crouching
	self.baka.spread.standing = SMG_S_Standing
	self.baka.spread.moving_steelsight = SMG_S_ADS_M
	self.baka.spread.moving_crouching = SMG_S_Crouching_M
	self.baka.spread.moving_standing = SMG_S_Standing_M

	self.baka.damage_min = MachineP_9mm_Dmg_Min
	self.baka.damage_near = MachineP_9mm_Dmg_Near
	self.baka.damage_far = MachineP_9mm_Dmg_Far
	
	self.baka.kick.standing = {
			1,
			1.2,
			-1,
			1
	}
		
	self.baka.kick.steelsight = self.baka.kick.standing
	self.baka.kick.crouching = self.baka.kick.standing
	
	--														Blaster 9mm

	self.tec9.CLIP_AMMO_MAX = 20
	self.tec9.AMMO_MAX = 220
	self.tec9.AMMO_PICKUP = self:_pickup_chance(self.tec9.AMMO_MAX, 1)
	self.tec9.stats.concealment = 27
	self.tec9.stats.damage = 32
	self.tec9.stats.spread = 12
	self.tec9.stats.spread_moving = 20
	self.tec9.stats.recoil = 14
	self.tec9.panic_suppression_chance = 0.05

	self.tec9.spread.steelsight = SMG_S_ADS
	self.tec9.spread.crouching = SMG_S_Crouching
	self.tec9.spread.standing = SMG_S_Standing
	self.tec9.spread.moving_steelsight = SMG_S_ADS_M
	self.tec9.spread.moving_crouching = SMG_S_Crouching_M
	self.tec9.spread.moving_standing = SMG_S_Standing_M


	self.tec9.damage_min = MachineP_9mm_Dmg_Min
	self.tec9.damage_near = MachineP_9mm_Dmg_Near
	self.tec9.damage_far = MachineP_9mm_Dmg_Far

	--														Cobra
	self.scorpion.CLIP_AMMO_MAX = 20
	self.scorpion.AMMO_MAX = 220
	self.scorpion.AMMO_PICKUP = self:_pickup_chance(self.scorpion.AMMO_MAX, 1)
	self.scorpion.stats.concealment = 28
	self.scorpion.stats.damage = 32
	self.scorpion.stats.spread = 12
	self.scorpion.stats.spread_moving = 20
	self.scorpion.stats.recoil = 19
	self.scorpion.panic_suppression_chance = 0.05

	self.scorpion.spread.steelsight = SMG_S_ADS
	self.scorpion.spread.crouching = SMG_S_Crouching
	self.scorpion.spread.standing = SMG_S_Standing
	self.scorpion.spread.moving_steelsight = SMG_S_ADS_M
	self.scorpion.spread.moving_crouching = SMG_S_Crouching_M
	self.scorpion.spread.moving_standing = SMG_S_Standing_M

	self.scorpion.damage_min = MachineP_9mm_Dmg_Min
	self.scorpion.damage_near = MachineP_9mm_Dmg_Near
	self.scorpion.damage_far = MachineP_9mm_Dmg_Far

	--														Mark 10

	self.mac10.CLIP_AMMO_MAX = 40
	self.mac10.AMMO_MAX = 200
	self.mac10.AMMO_PICKUP = self:_pickup_chance(self.mac10.AMMO_MAX, 1)
	self.mac10.stats.concealment = 27
	self.mac10.stats.damage = 35
	self.mac10.stats.spread = 13
	self.mac10.stats.spread_moving = 20
	self.mac10.stats.recoil = 17
	self.mac10.panic_suppression_chance = 0.05

	self.mac10.spread.steelsight = SMG_S_ADS
	self.mac10.spread.crouching = SMG_S_Crouching
	self.mac10.spread.standing = SMG_S_Standing
	self.mac10.spread.moving_steelsight = SMG_S_ADS_M
	self.mac10.spread.moving_crouching = SMG_S_Crouching_M
	self.mac10.spread.moving_standing = SMG_S_Standing_M

	self.mac10.damage_min = MachineP_9mm_Dmg_Min
	self.mac10.damage_near = MachineP_9mm_Dmg_Near
	self.mac10.damage_far = MachineP_9mm_Dmg_Far
	
	self.mac10.kick.standing = {
			1,
			1.2,
			-1,
			1
	}
		
	self.mac10.kick.steelsight = self.mac10.kick.standing
	self.mac10.kick.crouching = self.mac10.kick.standing
	
	

	--														SUB MACHINE GUNS
	--														Compact-5

	self.new_mp5.CLIP_AMMO_MAX = 30
	self.new_mp5.AMMO_MAX = 180
	self.new_mp5.AMMO_PICKUP = self:_pickup_chance(self.new_mp5.AMMO_MAX, 1)
	self.new_mp5.stats.concealment = 22
	self.new_mp5.stats.damage = 35
	self.new_mp5.stats.spread = 21
	self.new_mp5.stats.spread_moving = 21
	self.new_mp5.stats.recoil = 20
	self.new_mp5.panic_suppression_chance = 0.05

	self.new_mp5.spread.steelsight = SMG_S_ADS
	self.new_mp5.spread.crouching = SMG_S_Crouching
	self.new_mp5.spread.standing = SMG_S_Standing
	self.new_mp5.spread.moving_steelsight = SMG_S_ADS_M
	self.new_mp5.spread.moving_crouching = SMG_S_Crouching_M
	self.new_mp5.spread.moving_standing = SMG_S_Standing_M

	self.new_mp5.damage_min = SMG_9mm_Dmg_Min
	self.new_mp5.damage_near = SMG_9mm_Dmg_Near
	self.new_mp5.damage_far = SMG_9mm_Dmg_Far
	
	self.new_mp5.kick.standing = {
			0.7,
			0.7,
			-1,
			1
	}
		
	self.new_mp5.kick.steelsight = self.new_mp5.kick.standing
	self.new_mp5.kick.crouching = self.new_mp5.kick.standing
	
	--														Patchett L2A1

	self.sterling.CLIP_AMMO_MAX = 20
	self.sterling.AMMO_MAX = 180
	self.sterling.AMMO_PICKUP = self:_pickup_chance(self.sterling.AMMO_MAX, 1)
	self.sterling.stats.concealment = 20
	self.sterling.stats.damage = 37
	self.sterling.stats.spread = 18
	self.sterling.stats.spread_moving = 24
	self.sterling.stats.recoil = 21
	self.sterling.panic_suppression_chance = 0.05

	self.sterling.spread.steelsight = SMG_S_ADS
	self.sterling.spread.crouching = SMG_S_Crouching
	self.sterling.spread.standing = SMG_S_Standing
	self.sterling.spread.moving_steelsight = SMG_S_ADS_M
	self.sterling.spread.moving_crouching = SMG_S_Crouching_M
	self.sterling.spread.moving_standing = SMG_S_Standing_M

	self.sterling.damage_min = SMG_9mm_Dmg_Min
	self.sterling.damage_near = SMG_9mm_Dmg_Near
	self.sterling.damage_far = SMG_9mm_Dmg_Far
	
	self.sterling.kick.standing = {
			0.7,
			1.0,
			-0.9,
			0.9
		}
		
	self.sterling.kick.steelsight = self.sterling.kick.standing
	self.sterling.kick.crouching = self.sterling.kick.standing

	--														MEDIUM CALIBRE SMGS
	--														Chicago Typewriter

	self.m1928.CLIP_AMMO_MAX = 50
	self.m1928.AMMO_MAX = 150
	self.m1928.AMMO_PICKUP = self:_pickup_chance(self.m1928.AMMO_MAX, 1)
	self.m1928.stats.concealment = 18
	self.m1928.stats.damage = 47
	self.m1928.stats.spread = 16
	self.m1928.stats.spread_moving = 15
	self.m1928.stats.recoil = 16
	self.m1928.panic_suppression_chance = 0.05

	self.m1928.spread.steelsight = SMG_S_ADS
	self.m1928.spread.crouching = SMG_S_Crouching
	self.m1928.spread.standing = SMG_S_Standing
	self.m1928.spread.moving_steelsight = SMG_S_ADS_M
	self.m1928.spread.moving_crouching = SMG_S_Crouching_M
	self.m1928.spread.moving_standing = SMG_S_Standing_M

	self.m1928.damage_min = SMG_45acp_Dmg_Min
	self.m1928.damage_near = SMG_45acp_Dmg_Near
	self.m1928.damage_far = SMG_45acp_Dmg_Far

	--														Uzi

	self.uzi.CLIP_AMMO_MAX = 30
	self.uzi.AMMO_MAX = 150
	self.uzi.AMMO_PICKUP = self:_pickup_chance(self.uzi.AMMO_MAX, 1)
	self.uzi.stats.concealment = 18
	self.uzi.stats.damage = 45
	self.uzi.stats.spread = 15
	self.uzi.stats.spread_moving = 13
	self.uzi.stats.recoil = 16
	self.uzi.panic_suppression_chance = 0.05

	self.uzi.spread.steelsight = SMG_S_ADS
	self.uzi.spread.crouching = SMG_S_Crouching
	self.uzi.spread.standing = SMG_S_Standing
	self.uzi.spread.moving_steelsight = SMG_S_ADS_M
	self.uzi.spread.moving_crouching = SMG_S_Crouching_M
	self.uzi.spread.moving_standing = SMG_S_Standing_M

	self.uzi.damage_min = SMG_45acp_Dmg_Min
	self.uzi.damage_near = SMG_45acp_Dmg_Near
	self.uzi.damage_far = SMG_45acp_Dmg_Far
	
	self.uzi.kick.standing = {
			0.7,
			1.0,
			-0.9,
			0.9
		}
		
	self.uzi.kick.steelsight = self.uzi.kick.standing
	self.uzi.kick.crouching = self.uzi.kick.standing


	--														Vertex

	self.polymer.CLIP_AMMO_MAX = 30
	self.polymer.AMMO_MAX = 150
	self.polymer.AMMO_PICKUP = self:_pickup_chance(self.polymer.AMMO_MAX, 1)
	self.polymer.stats.concealment = 20
	self.polymer.stats.damage = 42
	self.polymer.stats.spread = 16
	self.polymer.stats.spread_moving = 15
	self.polymer.stats.recoil = 19
	self.polymer.panic_suppression_chance = 0.05

	self.polymer.spread.steelsight = SMG_S_ADS
	self.polymer.spread.crouching = SMG_S_Crouching
	self.polymer.spread.standing = SMG_S_Standing
	self.polymer.spread.moving_steelsight = SMG_S_ADS_M
	self.polymer.spread.moving_crouching = SMG_S_Crouching_M
	self.polymer.spread.moving_standing = SMG_S_Standing_M

	self.polymer.damage_min = SMG_45acp_Dmg_Min
	self.polymer.damage_near = SMG_45acp_Dmg_Near
	self.polymer.damage_far = SMG_45acp_Dmg_Far

	self.polymer.kick.standing = {
			-0.4,
			0.4,
			-1,
			1
		}
		
	self.polymer.kick.steelsight = self.polymer.kick.standing
	self.polymer.kick.crouching = self.polymer.kick.standing

	--														PERSONAL DEFENCE WEAPONS
	--														Kobus 90

	self.p90.CLIP_AMMO_MAX = 50
	self.p90.AMMO_MAX = 150
	self.p90.AMMO_PICKUP = self:_pickup_chance(self.p90.AMMO_MAX, 1)
	self.p90.stats.concealment = 25
	self.p90.stats.damage = 43
	self.p90.stats.spread = 20
	self.p90.stats.spread_moving = 20
	self.p90.stats.recoil = 11
	self.p90.panic_suppression_chance = 0.05

	self.p90.spread.steelsight = SMG_S_ADS
	self.p90.spread.crouching = SMG_S_Crouching
	self.p90.spread.standing = SMG_S_Standing
	self.p90.spread.moving_steelsight = SMG_S_ADS_M
	self.p90.spread.moving_crouching = SMG_S_Crouching_M
	self.p90.spread.moving_standing = SMG_S_Standing_M

	self.p90.damage_min = PDW_Dmg_Min
	self.p90.damage_near = PDW_Dmg_Near
	self.p90.damage_far = PDW_Dmg_Far

	--														SpecOps
	self.mp7.CLIP_AMMO_MAX = 20
	self.mp7.AMMO_MAX = 140
	self.mp7.AMMO_PICKUP = self:_pickup_chance(self.mp7.AMMO_MAX, 1)
	self.mp7.stats.concealment = 23
	self.mp7.stats.damage = 43
	self.mp7.stats.spread = 19
	self.mp7.stats.spread_moving = 22
	self.mp7.stats.recoil = 16
	self.mp7.panic_suppression_chance = 0.05
	
	self.mp7.spread.steelsight = SMG_S_ADS
	self.mp7.spread.crouching = SMG_S_Crouching
	self.mp7.spread.standing = SMG_S_Standing
	self.mp7.spread.moving_steelsight = SMG_S_ADS_M
	self.mp7.spread.moving_crouching = SMG_S_Crouching_M
	self.mp7.spread.moving_standing = SMG_S_Standing_M

	self.mp7.damage_min = PDW_Dmg_Min
	self.mp7.damage_near = PDW_Dmg_Near
	self.mp7.damage_far = PDW_Dmg_Far


	
	--														MINI-ARs
	-- 													 	Krinkov

	self.akmsu.CLIP_AMMO_MAX = 30
	self.akmsu.AMMO_MAX = 90
	self.akmsu.AMMO_PICKUP = self:_pickup_chance(self.akmsu.AMMO_MAX, 1)
	self.akmsu.stats.concealment = 21
	self.akmsu.stats.damage = 80
	self.akmsu.stats.spread = 20
	self.akmsu.stats.spread_moving = 5
	self.akmsu.stats.recoil = 8
	self.akmsu.panic_suppression_chance = 0.05

	self.akmsu.spread.steelsight = LCarb_S_ADS
	self.akmsu.spread.crouching = LCarb_S_Crouching
	self.akmsu.spread.standing = LCarb_S_Standing
	self.akmsu.spread.moving_steelsight = LCarb_S_ADS_M
	self.akmsu.spread.moving_crouching = LCarb_S_Crouching_M
	self.akmsu.spread.moving_standing = LCarb_S_Standing_M

	self.akmsu.damage_min = 0.75
	self.akmsu.damage_near = 20*100
	self.akmsu.damage_far = 40*100
	
	self.akmsu.kick.standing = {
			0.8,
			1.1,
			-1.2,
			1.2
	}
		
	self.akmsu.kick.steelsight = self.akmsu.kick.standing
	self.akmsu.kick.crouching = self.akmsu.kick.standing
	
	-- 														Para

	self.olympic.CLIP_AMMO_MAX = 30
	self.olympic.AMMO_MAX = 150
	self.olympic.AMMO_PICKUP = self:_pickup_chance(self.olympic.AMMO_MAX, 1)
	self.olympic.stats.concealment = 21
	self.olympic.stats.damage = 40
	self.olympic.stats.spread = 16
	self.olympic.stats.spread_moving = 5
	self.olympic.stats.recoil = 12
	self.olympic.panic_suppression_chance = 0.05

	self.olympic.spread.steelsight = LCarb_S_ADS
	self.olympic.spread.crouching = LCarb_S_Crouching
	self.olympic.spread.standing = LCarb_S_Standing
	self.olympic.spread.moving_steelsight = LCarb_S_ADS_M
	self.olympic.spread.moving_crouching = LCarb_S_Crouching_M
	self.olympic.spread.moving_standing = LCarb_S_Standing_M

	self.olympic.damage_min = LCarb_556nato_Dmg_Min
	self.olympic.damage_near = LCarb_556nato_Dmg_Near
	self.olympic.damage_far = LCarb_556nato_Dmg_Far
	
	self.olympic.kick.standing = {
			0.8,
			1.1,
			-1.2,
			1.2
	}
	
	self.olympic.kick.steelsight = self.olympic.kick.standing
	self.olympic.kick.crouching = self.olympic.kick.standing

	--														HEAVY SUBMACHINE GUN
	--														Swedish K

	self.m45.CLIP_AMMO_MAX = 40
	self.m45.AMMO_MAX = 80
	self.m45.AMMO_PICKUP = self:_pickup_chance(self.m45.AMMO_MAX, 1)
	self.m45.stats.concealment = 24
	self.m45.stats.damage = 85
	self.m45.stats.spread = 20
	self.m45.stats.spread_moving = 13
	self.m45.stats.recoil = 18
	self.m45.panic_suppression_chance = 0.05

	self.m45.spread.steelsight = SMG_S_ADS
	self.m45.spread.crouching = SMG_S_Crouching
	self.m45.spread.standing = SMG_S_Standing
	self.m45.spread.moving_steelsight = SMG_S_ADS_M
	self.m45.spread.moving_crouching = SMG_S_Crouching_M
	self.m45.spread.moving_standing = SMG_S_Standing_M

	self.m45.damage_min = SMG_45acp_Dmg_Min
	self.m45.damage_near = SMG_45acp_Dmg_Near
	self.m45.damage_far = SMG_45acp_Dmg_Far
	
	self.m45.kick.standing = {
			0.7,
			1.0,
			-0.9,
			0.9
		}
		
	self.m45.kick.steelsight = self.m45.kick.standing
	self.m45.kick.crouching = self.m45.kick.standing

	---------------------------------------------------------------------------------------------------------------------------
	--														PISTOLS
	---------------------------------------------------------------------------------------------------------------------------
	-- usp				-- Interceptor 45
	-- g22c				-- Chimano Custom
	-- glock_17			-- Chimano 88
	-- g26				-- Chimano Compact
	-- colt_1911		-- Crosskill
	-- b92fs			-- Bernetti 9
	-- new_raging_bull	-- Bronco .44
	-- glock_18c		-- STRYK 18c
	-- sparrow			-- Baby Deagle
	-- deagle			-- Deagle
	-- ppk				-- Gruber Kurz
	-- p226				-- Signature .40
	-- c96				-- Broomstick
	-- hs2000			-- LEO
	-- peacemaker		-- Peacemaker .45
	-- mateba			-- Matever .357
	
	-- STILL TO DO:

	--														LOW CALIBRE
	-- 														Chimano 88

	self.glock_17.CLIP_AMMO_MAX = 17
	self.glock_17.AMMO_MAX = 170
	self.glock_17.AMMO_PICKUP = self:_pickup_chance(self.glock_17.AMMO_MAX, 1)
	self.glock_17.stats.concealment = 30
	self.glock_17.stats.damage = 37
	self.glock_17.stats.spread = 16
	self.glock_17.stats.spread_moving = 20
	self.glock_17.stats.recoil = 16
	self.glock_17.panic_suppression_chance = nil

	self.glock_17.spread.steelsight = Pistol9mm_S_ADS
	self.glock_17.spread.crouching = Pistol9mm_S_Crouching
	self.glock_17.spread.standing = Pistol9mm_S_Standing
	self.glock_17.spread.moving_steelsight = Pistol9mm_S_ADS_M
	self.glock_17.spread.moving_crouching = Pistol9mm_S_Crouching_M
	self.glock_17.spread.moving_standing = Pistol9mm_S_Standing_M
	
	self.glock_17.timers.unequip = 0.3
	self.glock_17.timers.equip = 0.3

	self.glock_17.damage_min = Pistol_9mm_Dmg_Min								--9mm
	self.glock_17.damage_near = Pistol_9mm_Dmg_Near
	self.glock_17.damage_far = Pistol_9mm_Dmg_Far

	--														Chimano Compact

	self.g26.CLIP_AMMO_MAX = 10
	self.g26.AMMO_MAX = 170
	self.g26.AMMO_PICKUP = self:_pickup_chance(self.g26.AMMO_MAX, 1)
	self.g26.stats.concealment = 30
	self.g26.stats.damage = 38
	self.g26.stats.spread = 18
	self.g26.stats.spread_moving = 21
	self.g26.stats.recoil = 16
	self.g26.panic_suppression_chance = nil

	self.g26.spread.steelsight = Pistol9mm_S_ADS
	self.g26.spread.crouching = Pistol9mm_S_Crouching
	self.g26.spread.standing = Pistol9mm_S_Standing
	self.g26.spread.moving_steelsight = Pistol9mm_S_ADS_M
	self.g26.spread.moving_crouching = Pistol9mm_S_Crouching_M
	self.g26.spread.moving_standing = Pistol9mm_S_Standing_M
	
	self.g26.timers.unequip = 0.3
	self.g26.timers.equip = 0.3

	self.g26.damage_min = Pistol_9mm_Dmg_Min									-- 9mm
	self.g26.damage_near = Pistol_9mm_Dmg_Near
	self.g26.damage_far = Pistol_9mm_Dmg_Far

	--														Bernetti 9

	self.b92fs.CLIP_AMMO_MAX = 14
	self.b92fs.AMMO_MAX = 168
	self.b92fs.AMMO_PICKUP = self:_pickup_chance(self.b92fs.AMMO_MAX, 1)
	self.b92fs.stats.concealment = 30
	self.b92fs.stats.damage = 38
	self.b92fs.stats.spread = 18
	self.b92fs.stats.spread_moving = 22
	self.b92fs.stats.recoil = 16
	self.b92fs.panic_suppression_chance = nil

	self.b92fs.spread.steelsight = Pistol9mm_S_ADS
	self.b92fs.spread.crouching = Pistol9mm_S_Crouching
	self.b92fs.spread.standing = Pistol9mm_S_Standing
	self.b92fs.spread.moving_steelsight = Pistol9mm_S_ADS_M
	self.b92fs.spread.moving_crouching = Pistol9mm_S_Crouching_M
	self.b92fs.spread.moving_standing = Pistol9mm_S_Standing_M
	
	self.b92fs.timers.unequip = 0.3
	self.b92fs.timers.equip = 0.3

	self.b92fs.damage_min = Pistol_9mm_Dmg_Min									-- 9mm
	self.b92fs.damage_near = Pistol_9mm_Dmg_Near
	self.b92fs.damage_far = Pistol_9mm_Dmg_Far

	--														STRYK 18c

	self.glock_18c.CLIP_AMMO_MAX = 20
	self.glock_18c.AMMO_MAX = 160
	self.glock_18c.AMMO_PICKUP = self:_pickup_chance(self.glock_18c.AMMO_MAX, 1)
	self.glock_18c.stats.concealment = 29
	self.glock_18c.stats.damage = 35
	self.glock_18c.stats.spread = 18
	self.glock_18c.stats.spread_moving = 20
	self.glock_18c.stats.recoil = 17
	self.glock_18c.panic_suppression_chance = nil

	self.glock_18c.spread.steelsight = Pistol9mm_S_ADS
	self.glock_18c.spread.crouching = Pistol9mm_S_Crouching
	self.glock_18c.spread.standing = Pistol9mm_S_Standing
	self.glock_18c.spread.moving_steelsight = Pistol9mm_S_ADS_M
	self.glock_18c.spread.moving_crouching = Pistol9mm_S_Crouching_M
	self.glock_18c.spread.moving_standing = Pistol9mm_S_Standing_M
	
	self.glock_18c.timers.unequip = 0.5
	self.glock_18c.timers.equip = 0.5

	self.glock_18c.damage_min = Pistol_9mm_Dmg_Min									-- 9mm
	self.glock_18c.damage_near = Pistol_9mm_Dmg_Near
	self.glock_18c.damage_far = Pistol_9mm_Dmg_Far

	--														Gruber Kurz

	self.ppk.CLIP_AMMO_MAX = 14
	self.ppk.AMMO_MAX = 168
	self.ppk.AMMO_PICKUP = self:_pickup_chance(self.ppk.AMMO_MAX, 1)
	self.ppk.stats.concealment = 30
	self.ppk.stats.damage = 37
	self.ppk.stats.spread = 17
	self.ppk.stats.spread_moving = 21
	self.ppk.stats.recoil = 15
	self.ppk.panic_suppression_chance = nil

	self.ppk.spread.steelsight = Pistol9mm_S_ADS
	self.ppk.spread.crouching = Pistol9mm_S_Crouching
	self.ppk.spread.standing = Pistol9mm_S_Standing
	self.ppk.spread.moving_steelsight = Pistol9mm_S_ADS_M
	self.ppk.spread.moving_crouching = Pistol9mm_S_Crouching_M
	self.ppk.spread.moving_standing = Pistol9mm_S_Standing_M
	
	self.ppk.timers.unequip = 0.3
	self.ppk.timers.equip = 0.2

	self.ppk.damage_min = Pistol_9mm_Dmg_Min									-- 9mm
	self.ppk.damage_near = Pistol_9mm_Dmg_Near
	self.ppk.damage_far = Pistol_9mm_Dmg_Far

	--														Broomstick
	self.c96.CLIP_AMMO_MAX = 20
	self.c96.AMMO_MAX = 180
	self.c96.AMMO_PICKUP = self:_pickup_chance(self.c96.AMMO_MAX, 1)
	self.c96.stats.concealment = 28
	self.c96.stats.damage = 39
	self.c96.stats.spread = 14
	self.c96.stats.spread_moving = 20
	self.c96.stats.recoil = 16
	self.c96.panic_suppression_chance = nil


	self.c96.spread.steelsight = Pistol9mm_S_ADS
	self.c96.spread.crouching = Pistol9mm_S_Crouching
	self.c96.spread.standing = Pistol9mm_S_Standing
	self.c96.spread.moving_steelsight = Pistol9mm_S_ADS_M
	self.c96.spread.moving_crouching = Pistol9mm_S_Crouching_M
	self.c96.spread.moving_standing = Pistol9mm_S_Standing_M
	
	self.c96.timers.unequip = 0.4
	self.c96.timers.equip = 0.4

	self.c96.damage_min = Pistol_9mm_Dmg_Min									-- 9mm
	self.c96.damage_near = Pistol_9mm_Dmg_Near
	self.c96.damage_far = Pistol_9mm_Dmg_Far

	--														MED CALIBRE

	--														Interceptor .45

	self.usp.CLIP_AMMO_MAX = 13
	self.usp.AMMO_MAX = 104
	self.usp.AMMO_PICKUP = self:_pickup_chance(self.usp.AMMO_MAX, 1)
	self.usp.stats.concealment = 29
	self.usp.stats.damage = 49
	self.usp.stats.spread = 18
	self.usp.stats.spread_moving = 10
	self.usp.stats.recoil = 14
	self.usp.panic_suppression_chance = nil

	self.usp.spread.steelsight = Pistol45_S_ADS
	self.usp.spread.crouching = Pistol45_S_Crouching
	self.usp.spread.standing = Pistol45_S_Standing
	self.usp.spread.moving_steelsight = Pistol45_S_ADS_M
	self.usp.spread.moving_crouching = Pistol45_S_Crouching_M
	self.usp.spread.moving_standing = Pistol45_S_Standing_M
	
	self.usp.timers.unequip = 0.4
	self.usp.timers.equip = 0.4

	self.usp.damage_min = Pistol_45acp_Dmg_Min								--.45
	self.usp.damage_near = Pistol_45acp_Dmg_Near
	self.usp.damage_far = Pistol_45acp_Dmg_Far

	-- 														Chimano Custom

	self.g22c.CLIP_AMMO_MAX = 16
	self.g22c.AMMO_MAX = 112
	self.g22c.AMMO_PICKUP = self:_pickup_chance(self.g22c.AMMO_MAX, 1)
	self.g22c.stats.concealment = 29
	self.g22c.stats.damage = 44
	self.g22c.stats.spread = 20
	self.g22c.stats.spread_moving = 8
	self.g22c.stats.recoil = 14
	self.g22c.panic_suppression_chance = nil

	self.g22c.spread.steelsight = Pistol45_S_ADS
	self.g22c.spread.crouching = Pistol45_S_Crouching
	self.g22c.spread.standing = Pistol45_S_Standing
	self.g22c.spread.moving_steelsight = Pistol45_S_ADS_M
	self.g22c.spread.moving_crouching = Pistol45_S_Crouching_M
	self.g22c.spread.moving_standing = Pistol45_S_Standing_M
	
	self.g22c.timers.unequip = 0.4
	self.g22c.timers.equip = 0.4

	self.g22c.damage_min = Pistol_45acp_Dmg_Min							-- .40 S&W
	self.g22c.damage_near = Pistol_45acp_Dmg_Near
	self.g22c.damage_far = Pistol_45acp_Dmg_Far

	--														Crosskill

	self.colt_1911.CLIP_AMMO_MAX = 10
	self.colt_1911.AMMO_MAX = 100
	self.colt_1911.AMMO_PICKUP = self:_pickup_chance(self.colt_1911.AMMO_MAX, 1)
	self.colt_1911.stats.concealment = 29
	self.colt_1911.stats.damage = 50
	self.colt_1911.stats.spread = 18
	self.colt_1911.stats.spread_moving = 10
	self.colt_1911.stats.recoil = 15
	self.colt_1911.panic_suppression_chance = nil

	self.colt_1911.spread.steelsight = Pistol45_S_ADS
	self.colt_1911.spread.crouching = Pistol45_S_Crouching
	self.colt_1911.spread.standing = Pistol45_S_Standing
	self.colt_1911.spread.moving_steelsight = Pistol45_S_ADS_M
	self.colt_1911.spread.moving_crouching = Pistol45_S_Crouching_M
	self.colt_1911.spread.moving_standing = Pistol45_S_Standing_M
	
	self.colt_1911.timers.unequip = 0.4
	self.colt_1911.timers.equip = 0.4
	
	self.colt_1911.damage_min = Pistol_45acp_Dmg_Min						-- .45
	self.colt_1911.damage_near = Pistol_45acp_Dmg_Near
	self.colt_1911.damage_far = Pistol_45acp_Dmg_Far

	--														Signature .40

	self.p226.CLIP_AMMO_MAX = 12
	self.p226.AMMO_MAX = 96
	self.p226.AMMO_PICKUP = self:_pickup_chance(self.p226.AMMO_MAX, 1)
	self.p226.stats.concealment = 29
	self.p226.stats.damage = 43
	self.p226.stats.spread = 19
	self.p226.stats.spread_moving = 12
	self.p226.stats.recoil = 14
	self.p226.panic_suppression_chance = nil

	self.p226.spread.steelsight = Pistol45_S_ADS
	self.p226.spread.crouching = Pistol45_S_Crouching - 0.5
	self.p226.spread.standing = Pistol45_S_Standing - 0.5
	self.p226.spread.moving_steelsight = Pistol45_S_ADS_M
	self.p226.spread.moving_crouching = Pistol45_S_Crouching_M - 0.5
	self.p226.spread.moving_standing = Pistol45_S_Standing_M - 0.5
	
	self.p226.timers.unequip = 0.4
	self.p226.timers.equip = 0.3

	self.p226.damage_min = Pistol_45acp_Dmg_Min							-- .40 S&W
	self.p226.damage_near = Pistol_45acp_Dmg_Near
	self.p226.damage_far = Pistol_45acp_Dmg_Far

	-- 														LEO
	self.hs2000.CLIP_AMMO_MAX = 19
	self.hs2000.AMMO_MAX = 114
	self.hs2000.AMMO_PICKUP = self:_pickup_chance(self.hs2000.AMMO_MAX, 1)
	self.hs2000.stats.concealment = 29
	self.hs2000.stats.damage = 45
	self.hs2000.stats.spread = 18
	self.hs2000.stats.spread_moving = 10
	self.hs2000.stats.recoil = 14
	self.hs2000.panic_suppression_chance = nil

	self.hs2000.spread.steelsight = Pistol45_S_ADS
	self.hs2000.spread.crouching = Pistol45_S_Crouching
	self.hs2000.spread.standing = Pistol45_S_Standing
	self.hs2000.spread.moving_steelsight = Pistol45_S_ADS_M
	self.hs2000.spread.moving_crouching = Pistol45_S_Crouching_M
	self.hs2000.spread.moving_standing = Pistol45_S_Standing_M
	
	self.hs2000.timers.unequip = 0.3
	self.hs2000.timers.equip = 0.4

	self.hs2000.damage_min = Pistol_45acp_Dmg_Min							-- .40 S&W
	self.hs2000.damage_near = Pistol_45acp_Dmg_Near
	self.hs2000.damage_far = Pistol_45acp_Dmg_Far

	--														Revolvers & Handcannons

	--														Bronco .44

	self.new_raging_bull.CLIP_AMMO_MAX = 6
	self.new_raging_bull.AMMO_MAX = 48
	self.new_raging_bull.AMMO_PICKUP = self:_pickup_chance(self.new_raging_bull.AMMO_MAX, 1)
	self.new_raging_bull.stats.concealment = 26
	self.new_raging_bull.stats.damage = 125
	self.new_raging_bull.stats.spread = 20
	self.new_raging_bull.stats.spread_moving = 8
	self.new_raging_bull.stats.recoil = 2
	self.new_raging_bull.panic_suppression_chance = nil

	self.new_raging_bull.spread.steelsight = PistolH_S_ADS
	self.new_raging_bull.spread.crouching = PistolH_S_Crouching
	self.new_raging_bull.spread.standing = PistolH_S_Standing
	self.new_raging_bull.spread.moving_steelsight = PistolH_S_ADS_M
	self.new_raging_bull.spread.moving_crouching = PistolH_S_Crouching_M
	self.new_raging_bull.spread.moving_standing = PistolH_S_Standing_M

	self.new_raging_bull.damage_min = Revolver_44magnum_Dmg_Min
	self.new_raging_bull.damage_near = Revolver_44magnum_Dmg_Near
	self.new_raging_bull.damage_far = Revolver_44magnum_Dmg_Far
	
	self.new_raging_bull.timers.unequip = 0.6
	self.new_raging_bull.timers.equip = 0.5

	--														Deagle

	self.deagle.CLIP_AMMO_MAX = 8
	self.deagle.AMMO_MAX = 40
	self.deagle.AMMO_PICKUP = self:_pickup_chance(self.deagle.AMMO_MAX, 1)
	self.deagle.stats.concealment = 28
	self.deagle.stats.damage = 113
	self.deagle.stats.spread = 18
	self.deagle.stats.spread_moving = 10
	self.deagle.stats.recoil = 3
	self.deagle.panic_suppression_chance = nil

	self.deagle.spread.steelsight = PistolH_S_ADS
	self.deagle.spread.crouching = PistolH_S_Crouching
	self.deagle.spread.standing = PistolH_S_Standing
	self.deagle.spread.moving_steelsight = PistolH_S_ADS_M
	self.deagle.spread.moving_crouching = PistolH_S_Crouching_M
	self.deagle.spread.moving_standing = PistolH_S_Standing_M

	self.deagle.damage_min = Pistol_44magnum_Dmg_Min
	self.deagle.damage_near = Pistol_44magnum_Dmg_Near
	self.deagle.damage_far = Pistol_44magnum_Dmg_Far
	
	self.deagle.timers.unequip = 0.5
	self.deagle.timers.equip = 0.5
	
	-- 														Baby Deagle
	
	self.sparrow.CLIP_AMMO_MAX = 10
	self.sparrow.AMMO_MAX = 50
	self.sparrow.AMMO_PICKUP = self:_pickup_chance(self.sparrow.AMMO_MAX, 1)
	self.sparrow.stats.damage = 105
	self.sparrow.stats.spread = 17
	self.sparrow.stats.spread_moving = 5
	self.sparrow.stats.recoil = 9
	self.sparrow.panic_suppression_chance = nil
	
	self.sparrow.spread.steelsight = Pistol45_S_ADS
	self.sparrow.spread.crouching = Pistol45_S_Crouching
	self.sparrow.spread.standing = Pistol45_S_Standing
	self.sparrow.spread.moving_steelsight = Pistol45_S_ADS_M
	self.sparrow.spread.moving_crouching = Pistol45_S_Crouching_M
	self.sparrow.spread.moving_standing = Pistol45_S_Standing_M

	self.sparrow.damage_min = Pistol_44magnum_Dmg_Min
	self.sparrow.damage_near = Pistol_44magnum_Dmg_Near
	self.sparrow.damage_far = Pistol_44magnum_Dmg_Far
	
	self.sparrow.timers.unequip = 0.4
	self.sparrow.timers.equip = 0.4
	--														Peacemaker

	self.peacemaker.CLIP_AMMO_MAX = 6
	self.peacemaker.AMMO_MAX = 54
	self.peacemaker.AMMO_PICKUP = self:_pickup_chance(self.peacemaker.AMMO_MAX, 1)
	self.peacemaker.stats.concealment = 26
	self.peacemaker.stats.damage = 140
	self.peacemaker.stats.spread = 21
	self.peacemaker.stats.spread_moving = 6
	self.peacemaker.stats.recoil = 4
	self.peacemaker.panic_suppression_chance = nil

	self.peacemaker.spread.steelsight = PistolH_S_ADS
	self.peacemaker.spread.crouching = PistolH_S_Crouching
	self.peacemaker.spread.standing = PistolH_S_Standing
	self.peacemaker.spread.moving_steelsight = PistolH_S_ADS_M
	self.peacemaker.spread.moving_crouching = PistolH_S_Crouching_M 
	self.peacemaker.spread.moving_standing = PistolH_S_Standing_M

	self.peacemaker.damage_min = Revolver_44magnum_Dmg_Min
	self.peacemaker.damage_near = Revolver_44magnum_Dmg_Near
	self.peacemaker.damage_far = Revolver_44magnum_Dmg_Far

	--														Matever

	self.mateba.CLIP_AMMO_MAX = 6
	self.mateba.AMMO_MAX = 48
	self.mateba.AMMO_PICKUP = self:_pickup_chance(self.mateba.AMMO_MAX, 1)
	self.mateba.stats.concealment = 20
	self.mateba.stats.damage = 120
	self.mateba.stats.spread = 21
	self.mateba.stats.spread_moving = 15
	self.mateba.stats.recoil = 2
	self.mateba.panic_suppression_chance = nil

	self.mateba.spread.steelsight = PistolH_S_ADS
	self.mateba.spread.crouching = PistolH_S_Crouching
	self.mateba.spread.standing = PistolH_S_Standing
	self.mateba.spread.moving_steelsight = PistolH_S_ADS_M
	self.mateba.spread.moving_crouching = PistolH_S_Crouching_M
	self.mateba.spread.moving_standing = PistolH_S_Standing_M

	self.mateba.damage_min = Revolver_44magnum_Dmg_Min
	self.mateba.damage_near = Pistol_44magnum_Dmg_Near
	self.mateba.damage_far = Pistol_44magnum_Dmg_Far
	
	self.mateba.timers.unequip = 0.5
	self.mateba.timers.equip = 0.4

	---------------------------------------------------------------------------------------------------------------------------
	--														SECONDARY SPECIAL WEAPONS
	---------------------------------------------------------------------------------------------------------------------------
	-- saw_secondary		-- Saw
	-- rpg7				-- HRL-7 Rocket Launcher
	-- hunter			-- Pistol Crossbow
	
	-- STILL TO DO:
	-- Priority Low - Redefine the BSVs for special weapons (they can stay the same as in vanilla)
	
	-- Secondary OVE9000 Saw
	self.saw_secondary.CLIP_AMMO_MAX = 150
	self.saw_secondary.AMMO_MAX = 300
	self.saw_secondary.AMMO_PICKUP = {0,0}
	self.saw_secondary.stats.concealment = 16
	self.saw_secondary.stats.damage = 23
	self.saw_secondary.stats.spread = 6
	self.saw_secondary.stats.spread_moving = 8
	self.saw_secondary.stats.recoil = 7
	self.saw_secondary.panic_suppression_chance = 0.2

	--														HRL-7

	self.rpg7.stats.spread = 18
	self.rpg7.stats.spread_moving = 1
	self.rpg7.stats.recoil = 27
	self.rpg7.panic_suppression_chance = 0.2

	self.rpg7.timers.reload_not_empty = 6.5
	self.rpg7.timers.reload_empty = 6.5
	
	self.benelli.can_shoot_through_shield = nil
	
end

function WeaponTweakData:YOMC_ToggleData()
	if Pen_Toggle() ~= false then
		self.new_m4.can_shoot_through_enemy = false
		self.new_m4.can_shoot_through_wall = false
		
		self.ak74.can_shoot_through_enemy = false
		self.ak74.can_shoot_through_wall = false
	
		self.asval.can_shoot_through_enemy = false
		self.asval.enemy_pen = 0.2
		self.asval.can_shoot_through_wall = false
		self.asval.wall_pen = 0.8
		self.asval.armor_piercing_chance = 0.5

		self.akm.can_shoot_through_enemy = true
		self.akm.enemy_pen = 0.75
		self.akm.can_shoot_through_wall = true
		self.akm.wall_pen = 0.3
		self.akm.armor_piercing_chance = 0.75
		
		self.akm_gold.can_shoot_through_enemy = true
		self.akm_gold.enemy_pen = 0.75
		self.akm_gold.can_shoot_through_wall = true
		self.akm_gold.wall_pen = 0.3
		self.akm_gold.armor_piercing_chance = 0.75
		
		self.scar.can_shoot_through_enemy = true
		self.scar.enemy_pen = 0.75
		self.scar.can_shoot_through_wall = true
		self.scar.wall_pen = 0.3
		self.scar.armor_piercing_chance = 0.75
		
		self.fal.can_shoot_through_enemy = true
		self.fal.enemy_pen = 0.75
		self.fal.can_shoot_through_wall = true
		self.fal.wall_pen = 0.3
		self.fal.armor_piercing_chance = 0.75
		
		self.g3.can_shoot_through_enemy = true
		self.g3.enemy_pen = 0.75
		self.g3.can_shoot_through_wall = true
		self.g3.wall_pen = 0.3
		self.g3.armor_piercing_chance = 0.75
		
		self.new_m14.can_shoot_through_enemy = true
		self.new_m14.enemy_pen = 0.75
		self.new_m14.can_shoot_through_wall = true
		self.new_m14.wall_pen = 0.65
		self.new_m14.armor_piercing_chance = 1
		
		self.hk21.can_shoot_through_enemy = true
		self.hk21.enemy_pen = 0.6
		self.hk21.can_shoot_through_wall = true
		self.hk21.wall_pen = 0.2
		self.hk21.armor_piercing_chance = 0.5
		
		self.msr.enemy_pen = 1
		self.msr.wall_pen = 1
		self.msr.shield_pen = 0.25
		self.msr.armor_piercing_chance = 1
		
		self.wa2000.enemy_pen = 0.9
		self.wa2000.wall_pen = 0.9
		self.wa2000.shield_pen = 0.25
		self.wa2000.armor_piercing_chance = 1
		
		self.winchester1874.enemy_pen = 0.9
		self.winchester1874.wall_pen = 0.9
		self.winchester1874.shield_pen = 0.25
		self.winchester1874.armor_piercing_chance = 1
		
		self.r93.enemy_pen = 1
		self.r93.wall_pen = 1
		self.r93.shield_pen = 0.35
		self.r93.armor_piercing_chance = 1
		
		self.mosin.enemy_pen = 1.1
		self.mosin.wall_pen = 1
		self.mosin.shield_pen = 0.4
		self.mosin.armor_piercing_chance = 1
		
		self.model70.enemy_pen = 1
		self.model70.wall_pen = 1
		self.model70.shield_pen = 0.4
		self.model70.armor_piercing_chance = 1
		
		self.m95.enemy_pen = 1
		self.m95.wall_pen = 1
		self.m95.shield_pen = 0.5
		self.m95.armor_piercing_chance = 1
		
		self.p90.can_shoot_through_enemy = true
		self.p90.enemy_pen = 0.2
		self.p90.armor_piercing_chance = 0.5
		
		self.mp7.can_shoot_through_enemy = true
		self.mp7.enemy_pen = 0.2
		self.mp7.armor_piercing_chance = 0.5
		
		self.akmsu.can_shoot_through_enemy = true
		self.akmsu.armor_piercing_chance = 0.75
		self.akmsu.enemy_pen = 0.5
	end
	
	if Burst_Toggle() ~= 1 then
	
		self.jowi.BURST_FIRE = true
		self.jowi.BURST_FIRE_RATE_MULTIPLIER = 1.25
		
		self.x_b92fs.BURST_FIRE = true
		self.x_b92fs.BURST_FIRE_RATE_MULTIPLIER = 1.25
		
		self.x_g17.BURST_FIRE = true
		self.x_g17.BURST_FIRE_RATE_MULTIPLIER = 1.25
		
		self.x_1911.BURST_FIRE = true
		self.x_1911.BURST_FIRE_RATE_MULTIPLIER = 1.25
		
		self.x_g22c.BURST_FIRE = true
		self.x_g22c.BURST_FIRE_RATE_MULTIPLIER = 1.25
		
		self.x_usp.BURST_FIRE = true
		self.x_usp.BURST_FIRE_RATE_MULTIPLIER = 1.25
		
		self.x_deagle.BURST_FIRE = true
		self.x_deagle.BURST_FIRE_RATE_MULTIPLIER = 1.25
	
	else
		self.jowi.BURST_FIRE = false
		self.x_b92fs.BURST_FIRE = false
		self.x_g17.BURST_FIRE = false
		self.x_1911.BURST_FIRE = false
		self.x_g22c.BURST_FIRE = false
		self.x_usp.BURST_FIRE = false
		self.x_deagle.BURST_FIRE = false
	end
end

-- Burst Fire Scripts -- Full credit to LazyOzzy

function WeaponTweakData:LO_BurstFire()

	local No_Burst = {
	"amcar", "l85a2", "new_m4", "new_m14", "asval", "vhs",  "ak74" ,"akm", "akm_gold", "ak5", "aug", "scar", "fal", "g3", "galil", "sub2000", "glock_18c", "mac10", "mp9", "olympic", "akmsu", "p90", "m45", "scorpion", "tec9", "uzi", "sterling", "cobray", "baka", "m1928", "saiga", "aa12", "flamethrower_mk2", "m32"
	}

	for i, weapon_id in ipairs(No_Burst) do
		self[weapon_id].BURST_FIRE = false
	end
	
	self.polymer.BURST_FIRE = 2
	self.g36.BURST_FIRE = 2
	
	local No_Adapt = {
	"famas", "ak5", "g36", "mp7", "new_mp5", "g3", "polymer", "s552"
	}
	
	for i, weapon_id in ipairs(No_Adapt) do
		self[weapon_id].ADAPTIVE_BURST_SIZE = false
	end

	self.m16.BURST_FIRE_RATE_MULTIPLIER = 1.2
	self.famas.BURST_FIRE_RATE_MULTIPLIER = 1.2
	self.g36.BURST_FIRE_RATE_MULTIPLIER = 2
	self.new_mp5.BURST_FIRE_RATE_MULTIPLIER = 1.3
	self.g3.BURST_FIRE_RATE_MULTIPLIER = 1.5
	self.s552.BURST_FIRE_RATE_MULTIPLIER = 1.3
end

-- Tactical Reload Scripts by B1313 and DMC

function WeaponTweakData:DMC_TactReload()
	--self.*weapon_id*.tactical_reload = *either 1 or 2*
	--(1 = normal, 2 = akimbo)
	
	local Tact_Reload = {'deagle','colt_1911','usp','p226','g22c','glock_17','glock_18c','b92fs','ppk','mp9','new_mp5','mp7','p90','olympic','m16','amcar','new_m4','ak5','s552','g36','aug','new_m14','scar','fal','famas','g3','l85a2','vhs','hs2000','sub2000','polymer'}
	for i, weapon_id in ipairs(Tact_Reload) do
		self[weapon_id].tactical_reload = 1
	end
	--[[
	local Tact_Akimbo = {'x_deagle','x_1911','x_b92fs','jowi','x_usp','x_g17','x_g22c'}
	for i, weapon_id in ipairs(Tact_Akimbo) do
		self[weapon_id].tactical_reload = 2
	end
	]]--
	--[[
	self.b682.keep_ammo = true
	self.mosin.keep_ammo = true
	self.c96.keep_ammo = true
		
	self.c96.uses_clip = true
	self.mosin.uses_clip = true
	self.c96.clip_capacity = 10
	self.mosin.clip_capacity = 5
	]]--
end
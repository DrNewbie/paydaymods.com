local old_init = WeaponTweakData.init
function WeaponTweakData:init(tweak_data)
		old_init(self, tweak_data)

	--Plainsrider Bow
	self.plainsrider.ignore_damage_upgrades = false
	self.plainsrider.armor_piercing_chance = 1
	
	--Crossbow
	self.hunter.armor_piercing_chance = 1
	self.hunter.ignore_damage_upgrades = false
	
	--Longbow
	self.long.ignore_damage_upgrades = false
	self.long.armor_piercing_chance = 1
	
	--Heavy Crossbow 
	self.frankish.ignore_damage_upgrades = false
	self.frankish.armor_piercing_chance = 1
	
	--Crossbow
	self.arblast.ignore_damage_upgrades = false
	self.arblast.armor_piercing_chance = 1
	
	--Saw 
	self.saw.CLIP_AMMO_MAX =1000
	self.saw.AMMO_MAX = self.saw.CLIP_AMMO_MAX * self.saw.NR_CLIPS_MAX * 1.5	
	self.saw.AMMO_PICKUP = self:_pickup_chance(self.saw.AMMO_MAX, 1)
	self.saw_secondary.CLIP_AMMO_MAX = self.saw.CLIP_AMMO_MAX
	self.saw_secondary.AMMO_MAX = self.saw.AMMO_MAX
	

	--Rifles
	--Car 4
	self.new_m4.fire_mode_data.fire_rate = 0.075 --0.1
	
	--AK
	self.ak74.fire_mode_data.fire_rate = 0.0685714 --0.092
	
	
	--sniper ammo

	
	--Minigun
	self.m134.stats = {
		damage = 38,
		spread = 16,
		recoil = 16,
		spread_moving = 9,
		zoom = 1,
		concealment = 5,
		suppression = 4,
		alert_size = 8,
		extra_ammo = 6,
		total_ammo_mod = 21,
		value = 9,
		reload = 11
	}	
	--SMGs
	
	--Jackal
	self.schakal.AMMO_MAX = self.schakal.CLIP_AMMO_MAX * self.schakal.NR_CLIPS_MAX * 3
	self.schakal.stats_modifiers = {damage = 0.5} 
	
	--Para
	self.olympic.fire_mode_data.fire_rate = 0.065
		
	--Sniper Rifles
	
	--Thanatos
	self.m95.stats_modifiers = {damage = 40} --20}
	self.m95.AMMO_MAX = self.m95.CLIP_AMMO_MAX * self.m95.NR_CLIPS_MAX * 0.75 --1.5
	
	--Rattlesnake
	self.msr.stats_modifiers = {damage = 1.3} --1}
	self.msr.AMMO_MAX = self.msr.CLIP_AMMO_MAX * self.msr.NR_CLIPS_MAX * 1.5
	
	--R93
	self.r93.stats_modifiers = {damage = 5} --2}
	self.r93.AMMO_MAX = self.r93.CLIP_AMMO_MAX * self.r93.NR_CLIPS_MAX * 0.75 --1.5
	
	--Nagant
	self.mosin.stats_modifiers = {damage = 4} --2}
	--self.mosin.AMMO_MAX = self.mosin.CLIP_AMMO_MAX * self.mosin.NR_CLIPS_MAX * 1.15 --1.5
	
	--Repeater
	self.winchester1874.stats_modifiers = {damage = 3} --1}
	self.winchester1874.AMMO_MAX = self.winchester1874.CLIP_AMMO_MAX * self.winchester1874.NR_CLIPS_MAX * 0.75 --1.5
	
	--Long sausage
	self.wa2000.stats_modifiers = {damage = 3} --1}
	self.wa2000.AMMO_MAX = self.wa2000.CLIP_AMMO_MAX * self.wa2000.NR_CLIPS_MAX * 0.75 --1.5
	
	--Platypus
	self.model70.stats_modifiers = {damage = 5} --1}
	self.model70.AMMO_MAX = self.model70.CLIP_AMMO_MAX * self.model70.NR_CLIPS_MAX * 0.75 --1.5	
	
	--Desert Fox
	self.desertfox.stats_modifiers = {damage = 3.5} --2
	
	--Contractor
	self.tti.stats_modifiers = {damage = 3} --2
	
end
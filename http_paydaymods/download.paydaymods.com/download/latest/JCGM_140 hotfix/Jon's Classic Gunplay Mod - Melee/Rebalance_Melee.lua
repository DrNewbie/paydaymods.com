local _init_melee_weapons_actual = BlackMarketTweakData._init_melee_weapons
function BlackMarketTweakData:_init_melee_weapons(...)
    _init_melee_weapons_actual(self, ...)

	
	-- Classic Tools --
	
  ---Survival Tomahawk
	self.melee_weapons.tomahawk.stats.min_damage = 6.5
    self.melee_weapons.tomahawk.stats.max_damage = 12
    self.melee_weapons.tomahawk.stats.min_damage_effect = 2.1
    self.melee_weapons.tomahawk.stats.max_damage_effect = 3.5
	self.melee_weapons.tomahawk.stats.range = 275
    self.melee_weapons.tomahawk.stats.charge_time = 2.2

  ---Ballistic Knifes (ranged)
    self.melee_weapons.ballistic.stats.min_damage = 5
    self.melee_weapons.ballistic.stats.max_damage = 8
    self.melee_weapons.ballistic.stats.min_damage_effect = 1.3
    self.melee_weapons.ballistic.stats.max_damage_effect = 1.5
	self.melee_weapons.ballistic.stats.range = 700
    self.melee_weapons.ballistic.stats.charge_time = 1.5

  ---Classic (HLM) Baseball Bat
	self.melee_weapons.baseballbat.stats.min_damage = 4
    self.melee_weapons.baseballbat.stats.max_damage = 7
    self.melee_weapons.baseballbat.stats.min_damage_effect = 2
    self.melee_weapons.baseballbat.stats.max_damage_effect = 3
	self.melee_weapons.baseballbat.stats.range = 275
    self.melee_weapons.baseballbat.stats.charge_time = 1.8

  ---Barbed Wire Bat (TWD Lucille)
	self.melee_weapons.barbedwire.stats.min_damage = 5
    self.melee_weapons.barbedwire.stats.max_damage = 8
    self.melee_weapons.barbedwire.stats.min_damage_effect = 2.5
    self.melee_weapons.barbedwire.stats.max_damage_effect = 5.1
	self.melee_weapons.barbedwire.stats.range = 280
    self.melee_weapons.barbedwire.stats.charge_time = 1.9

  ---Ding-Dong Breaching Tool
	self.melee_weapons.dingdong.stats.min_damage = 8
    self.melee_weapons.dingdong.stats.max_damage = 15
    self.melee_weapons.dingdong.stats.min_damage_effect = 2.3
    self.melee_weapons.dingdong.stats.max_damage_effect = 4
	self.melee_weapons.dingdong.stats.range = 215
    self.melee_weapons.dingdong.stats.charge_time = 3
	
  ---The Great Sword
	self.melee_weapons.great.stats.min_damage = 10
    self.melee_weapons.great.stats.max_damage = 45
	self.melee_weapons.great.stats.range = 300
    self.melee_weapons.great.stats.charge_time = 3
	
	-- Wacky Non-Realistic Bullshit --
	
  ---All ranged, bcz variety, bitcheeees!
  
  ---NailGun
    self.melee_weapons.nin.stats.min_damage = 8
    self.melee_weapons.nin.stats.max_damage = 16
    self.melee_weapons.nin.stats.min_damage_effect = 1
    self.melee_weapons.nin.stats.max_damage_effect = 1
	self.melee_weapons.nin.stats.range = 1000
    self.melee_weapons.nin.stats.charge_time = 2
	
  ---Alienware Mauler
	self.melee_weapons.alien_maul.stats.min_damage = 6
    self.melee_weapons.alien_maul.stats.max_damage = 14
    self.melee_weapons.alien_maul.stats.min_damage_effect = 1.3
    self.melee_weapons.alien_maul.stats.max_damage_effect = 3
	self.melee_weapons.alien_maul.stats.range = 800
    self.melee_weapons.alien_maul.stats.charge_time = 4
	
  ---Shillelagh Kinetic Staff
	self.melee_weapons.shillelagh.stats.min_damage = 5
    self.melee_weapons.shillelagh.stats.max_damage = 9
    self.melee_weapons.shillelagh.stats.min_damage_effect = 0.5
    self.melee_weapons.shillelagh.stats.max_damage_effect = 0.8
	self.melee_weapons.shillelagh.stats.range = 1000
    self.melee_weapons.shillelagh.stats.charge_time = 3
	
  ---Magic Wand
	self.melee_weapons.selfie.stats.min_damage = 6
    self.melee_weapons.selfie.stats.max_damage = 8
    self.melee_weapons.selfie.stats.min_damage_effect = 1.4
    self.melee_weapons.selfie.stats.max_damage_effect = 2.5
	self.melee_weapons.selfie.stats.range = 600
    self.melee_weapons.selfie.stats.charge_time = 3
	
	
	-- Knifes --

  ---Switchblade Knife
	self.melee_weapons.switchblade.stats.min_damage = 3.5
	self.melee_weapons.switchblade.stats.max_damage = 6
	self.melee_weapons.switchblade.stats.min_damage_effect = 1.5
	self.melee_weapons.switchblade.stats.max_damage_effect = 2.5
	self.melee_weapons.switchblade.stats.range = 210
	self.melee_weapons.switchblade.stats.concealment = 30

  ---Butterfly Knife
	self.melee_weapons.wing.stats.min_damage = 4.5
	self.melee_weapons.wing.stats.max_damage = 6.5
	self.melee_weapons.wing.stats.min_damage_effect = 1.2
	self.melee_weapons.wing.stats.max_damage_effect = 2
	self.melee_weapons.wing.stats.charge_time = 1.2
	self.melee_weapons.wing.stats.range = 235
	self.melee_weapons.wing.repeat_expire_t = 0.6
	
 
end	
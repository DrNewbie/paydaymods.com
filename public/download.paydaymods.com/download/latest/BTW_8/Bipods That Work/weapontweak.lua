
local old_init = WeaponTweakData.init
function WeaponTweakData:init(tweak_data,...)
    old_init(self, tweak_data,...)

--most of this is dummy information so that the game doesn't throw an error
--since there aren't actual bipod animations associated with these guns,
--the game will simply not play any animation when switching to/from bipod states


--pitch is normally 15; spin is normally 40
--however, i think this is too restrictive, so i set them all to 45 and 45 degrees of freedom
--as of 1.3 this is obsolete since i set spin/pitch to 60/60 universally


--Galil AKA Gecko 7.62 | Assault Rifle

	self.galil.animations.bipod_enter = "bipod_enter"
	self.galil.animations.bipod_exit = "bipod_exit"
	self.galil.animations.bipod_recoil = "bipod_recoil"
	self.galil.animations.bipod_recoil_enter = "bipod_recoil"
	self.galil.animations.bipod_recoil_loop = "bipod_recoil_loop"
	self.galil.animations.bipod_recoil_exit = "bipod_recoil_exit"

	self.galil.animations.use_stance = "ak74"	
	
	self.galil.spread.bipod = default_bipod_spread
	
	self.galil.bipod_camera_spin_limit = 45
	self.galil.bipod_camera_pitch_limit = 45 --15
--	self.galil.bipod_weapon_translation = Vector3(-8.5,1,-2.5)
	self.galil.bipod_weapon_translation = Vector3(-8.5,20,-7.5)
	self.galil.bipod_deploy_multiplier = 1
	
	self.galil.timers.deploy_bipod = 1


--Barrett M95 AKA Thanatos | Sniper Rifle

	self.m95.animations.bipod_enter = "bipod_enter"
	self.m95.animations.bipod_exit = "bipod_exit"
	self.m95.animations.bipod_recoil = "bipod_recoil"
	self.m95.animations.bipod_recoil_enter = "bipod_recoil"
	self.m95.animations.bipod_recoil_loop = "bipod_recoil_loop"
	self.m95.animations.bipod_recoil_exit = "bipod_recoil_exit"

	self.m95.animations.use_stance = "ak74"	
	
	self.m95.spread.bipod = default_bipod_spread
	
	self.m95.bipod_camera_spin_limit = 45
	self.m95.bipod_camera_pitch_limit = 45
	self.m95.bipod_weapon_translation = Vector3(-8.5,20,-7.5)
	self.m95.bipod_deploy_multiplier = 1

	self.m95.timers.deploy_bipod = 1
	
	
--Walther WA 2000 AKA Lebensauger .308 | Sniper Rifle

	self.wa2000.animations.bipod_enter = "bipod_enter"
	self.wa2000.animations.bipod_exit = "bipod_exit"
	self.wa2000.animations.bipod_recoil = "bipod_recoil"
	self.wa2000.animations.bipod_recoil_enter = "bipod_recoil"
	self.wa2000.animations.bipod_recoil_loop = "bipod_recoil_loop"
	self.wa2000.animations.bipod_recoil_exit = "bipod_recoil_exit"

	self.wa2000.animations.use_stance = "ak74"
	
	self.wa2000.spread.bipod = default_bipod_spread
	
	self.wa2000.bipod_camera_spin_limit = 45
	self.wa2000.bipod_camera_pitch_limit = 45
	self.wa2000.bipod_weapon_translation = Vector3(-8.5,20,-7.5)
	self.wa2000.bipod_deploy_multiplier = 1

	self.wa2000.timers.deploy_bipod = 1

	
--G36 aka JP36

	self.g36.animations.bipod_enter = "bipod_enter"
	self.g36.animations.bipod_exit = "bipod_exit"
	self.g36.animations.bipod_recoil = "bipod_recoil"
	self.g36.animations.bipod_recoil_enter = "bipod_recoil"
	self.g36.animations.bipod_recoil_loop = "bipod_recoil_loop"
	self.g36.animations.bipod_recoil_exit = "bipod_recoil_exit"

	self.g36.animations.use_stance = "ak74"
	
	self.g36.spread.bipod = default_bipod_spread
	
	self.g36.bipod_camera_spin_limit = 45
	self.g36.bipod_camera_pitch_limit = 45
	self.g36.bipod_weapon_translation = Vector3(-8.5,12,-5)
	self.g36.bipod_deploy_multiplier = 1

	self.g36.timers.deploy_bipod = 1
	
--Galil aka G3

	self.g3.animations.bipod_enter = "bipod_enter"
	self.g3.animations.bipod_exit = "bipod_exit"
	self.g3.animations.bipod_recoil = "bipod_recoil"
	self.g3.animations.bipod_recoil_enter = "bipod_recoil"
	self.g3.animations.bipod_recoil_loop = "bipod_recoil_loop"
	self.g3.animations.bipod_recoil_exit = "bipod_recoil_exit"

	self.g3.animations.use_stance = "ak74"
	
	self.g3.spread.bipod = default_bipod_spread
	
	self.g3.bipod_camera_spin_limit = 45
	self.g3.bipod_camera_pitch_limit = 45
	self.g3.bipod_weapon_translation = Vector3(-8.5,12,-5)
	self.g3.bipod_deploy_multiplier = 1

	self.g3.timers.deploy_bipod = 1

	
end

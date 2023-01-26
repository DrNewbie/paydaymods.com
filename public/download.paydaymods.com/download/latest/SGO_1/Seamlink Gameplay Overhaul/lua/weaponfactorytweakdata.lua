if RequiredScript == "lib/tweak_data/weaponfactorytweakdata" then

	local old_wftd_init = WeaponFactoryTweakData.init
	function WeaponFactoryTweakData:init()
		old_wftd_init(self)
		self:stuff_general()
	end
		
	function WeaponFactoryTweakData:stuff_general()

	self.parts.wpn_fps_upg_a_slug.stats = { value = 5, total_ammo_mod = 0, damage = 5, spread = 17, moving_spread = -4, recoil = -5 }
	self.parts.wpn_fps_upg_a_explosive.stats = { value = 5, total_ammo_mod = 0, damage = 50, spread = -3, moving_spread = 1, recoil = -8 }
	self.parts.wpn_fps_upg_a_piercing.stats = { value = 5, total_ammo_mod = 0, damage = -10, spread = 10, moving_spread = 2, recoil = 2 }
	--self.parts.wpn_fps_upg_a_dragons_breath.stats = { value = 5, total_ammo_mod = 0, damage = -1, spread = -2, moving_spread = 0, recoil = -1 }
	--self.parts.wpn_fps_upg_a_custom.stats = { value = 5, total_ammo_mod = 0, damage = 15, spread = -2, moving_spread = 0, recoil = -1 }
	--self.parts.wpn_fps_upg_a_custom_free.stats = { value = 5, total_ammo_mod = 0, damage = 10, spread = -1, moving_spread = 0, recoil = -1 }
	end
end
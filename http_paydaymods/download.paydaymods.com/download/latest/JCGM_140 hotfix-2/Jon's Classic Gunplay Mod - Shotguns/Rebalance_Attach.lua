local tweak_factory = tweak_data.weapon.factory

--HE rounds nerf
tweak_factory.parts.wpn_fps_upg_a_explosive.stats = { value = 5, extra_ammo = -1.5, total_ammo_mod = -9, spread = -3, recoil = -3}

--AP slugs buff
tweak_factory.parts.wpn_fps_upg_a_slug.stats = { value = 2, damage = 30, extra_ammo = 0, total_ammo_mod = -5, spread = 3, recoil = 1}

--DB rounds buff
tweak_factory.parts.wpn_fps_upg_a_dragons_breath.stats = { value = 2, damage = 18, extra_ammo = -1, total_ammo_mod = -3, spread = -2, recoil = 3}


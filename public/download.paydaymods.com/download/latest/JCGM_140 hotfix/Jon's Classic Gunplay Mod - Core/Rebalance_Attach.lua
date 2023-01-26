local tweak_factory = tweak_data.weapon.factory

--20 round STANAG (CAR4, AK5)
tweak_factory.parts.wpn_fps_upg_m4_m_straight.stats = { value = 2, concealment = 1, extra_ammo = -5, total_ammo_mod = 0 }

--30 round STANAG (AMCAR, AMR16, Para Carbine)
tweak_factory.parts.wpn_fps_m4_uupg_m_std.stats = { value = 1, concealment = -1, extra_ammo = 5, total_ammo_mod = 0}

-- 30 round US Palm (low drag)
tweak_factory.parts.wpn_fps_upg_ak_m_uspalm.stats = { value = 3, extra_ammo = 0, total_ammo_mod = 0, recoil = 1}

--PMAG
tweak_factory.parts.wpn_fps_upg_m4_m_pmag.stats = { value = 3, extra_ammo = 0, total_ammo_mod = 0 , recoil = 0 }

--EMAG
tweak_factory.parts.wpn_fps_ass_l85a2_m_emag.stats = { value = 3, extra_ammo = 0, recoil = 1, total_ammo_mod = 0}

--L5
tweak_factory.parts.wpn_fps_upg_m4_m_l5.stats = { value = 1, extra_ammo = 0, recoil = 1, total_ammo_mod = 0, spread = 0}


--para
tweak_factory.wpn_fps_smg_olympic.override = {}
tweak_factory.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_m_pmag = {stats = { value = 3, extra_ammo = 5, recoil = 0}}
tweak_factory.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_m_quad = {stats = { value = 1, concealment = -2, extra_ammo = 20, total_ammo_mod = 0, spread = -1, recoil = 1}}
tweak_factory.wpn_fps_smg_olympic.override.wpn_fps_ass_l85a2_m_emag = {stats = { value = 1, spread = 0, extra_ammo = 5, recoil = 1, total_ammo_mod = 0}}
tweak_factory.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_m_l5 = {stats = { value = 1, extra_ammo = 5, recoil = 1, total_ammo_mod = 0, spread = 0}}

--amcar
tweak_factory.wpn_fps_ass_amcar.override = {}
tweak_factory.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_pmag = {stats = { value = 3, extra_ammo = 5, recoil = 0 }}
tweak_factory.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_quad = {stats = { value = 1, concealment = -2, extra_ammo = 20, total_ammo_mod = 0, spread = -1, recoil = 1}}
tweak_factory.wpn_fps_ass_amcar.override.wpn_fps_ass_l85a2_m_emag = {stats = { value = 1, spread = 0, extra_ammo = 5, recoil = 1, total_ammo_mod = 0}}
tweak_factory.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_l5 = {stats = { value = 1, extra_ammo = 5, recoil = 1, total_ammo_mod = 0, spread = 0}}

--m4
tweak_factory.wpn_fps_ass_m4.override.wpn_fps_upg_ass_m4_b_beowulf = {stats = { value = 1, spread = 4, recoil = -4, total_ammo_mod = -8, damage = 60, concealment = -4, extra_ammo = 0}}
tweak_factory.wpn_fps_ass_m4.override.wpn_fps_upg_m4_m_l5 = {stats = { value = 1, extra_ammo = 2, recoil = 2, total_ammo_mod = 0, spread = 0}}

--m16
tweak_factory.wpn_fps_ass_m16.override = {}
tweak_factory.wpn_fps_ass_m16.override.wpn_fps_m4_uupg_m_std = {stats = { value = 1, concealment = -1, extra_ammo = 6, total_ammo_mod = -0}}
tweak_factory.wpn_fps_ass_m16.override.wpn_fps_upg_m4_m_pmag = {stats = { value = 3, extra_ammo = 6, total_ammo_mod = 0, recoil = 0}}
tweak_factory.wpn_fps_ass_m16.override.wpn_fps_upg_m4_m_quad = {stats = { value = 1, concealment = -2, extra_ammo = 16, total_ammo_mod = 0, spread = -1, recoil = 1}}
tweak_factory.wpn_fps_ass_m16.override.wpn_fps_ass_l85a2_m_emag = {stats = { value = 1, spread = 0, extra_ammo = 6, recoil = 1, total_ammo_mod = 0}}
tweak_factory.wpn_fps_ass_m16.override.wpn_fps_upg_m4_m_l5 = {stats = { value = 1, extra_ammo = 7, recoil = 2, total_ammo_mod = 0, spread = 0}}
tweak_factory.wpn_fps_ass_m16.override.wpn_fps_upg_ass_m4_b_beowulf = {stats = { value = 1, spread = 4, recoil = -4, total_ammo_mod = -10, damage = 65, concealment = -4, extra_ammo = -5}}

--G3 PSG9 Barrel
tweak_factory.parts.wpn_fps_ass_g3_b_sniper.stats = { value = 2, recoil = -1, spread = 2,concealment = -2,damage = 90, total_ammo_mod = -8, extra_ammo = -5}

--AK Zastava Barrel
tweak_factory.wpn_fps_ass_74.override.wpn_fps_upg_ass_ak_b_zastava = {stats = {value = 2, damage = 60, extra_ammo = -1, total_ammo_mod = -8, spread = 2, recoil = -3, concealment = -4}}
tweak_factory.wpn_fps_ass_akm.override.wpn_fps_upg_ass_ak_b_zastava = {stats = {value = 2, damage = 84, extra_ammo = -5, total_ammo_mod = -8, spread = 2, recoil = -3, concealment = -4}}
tweak_factory.wpn_fps_ass_akm_gold.override.wpn_fps_upg_ass_ak_b_zastava = {stats = {value = 2, damage = 82, extra_ammo = -5, total_ammo_mod = -8, spread = 2, recoil = -3, concealment = -4}}

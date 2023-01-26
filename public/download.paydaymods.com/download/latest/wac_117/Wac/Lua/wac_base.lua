_G.WacMenu = _G.WacMenu or {}
WacMenu._path = ModPath
WacMenu._data_path = SavePath .. "wpnattach_data.txt"
WacMenu._data = {}
function WacMenu:Save()
	local file = io.open( self._data_path, "w+" )
	if file then
		file:write( json.encode( self._data ) )
		file:close()
	end
end
function WacMenu:Load()
	local file = io.open( self._data_path, "r" )
	if file then
		self._data = json.decode( file:read("*all") )
		file:close()
	end
end
WacMenu:Load()
-- "Use Non-Silenced Sound" mod check
if SystemFS:exists("mods/Use Non-Silenced Sound/mod.txt") then
	wac_nosuppressedsnds = true
end
-- Assault Rifles
if WacMenu._data.replace_ak5shortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_b_short.third_unit = "units/payday2/weapons/wpn_third_ass_ak5_pts/wpn_third_ass_ak5_b_std"
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_b_short.unit = "units/payday2/weapons/wpn_fps_ass_ak5_pts/wpn_fps_ass_ak5_b_std"
end
if WacMenu._data.replace_ak5cfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_fg_ak5c.third_unit = "units/payday2/weapons/wpn_third_ass_ak5_pts/wpn_third_ass_ak5_fg_fnc"
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_fg_ak5c.unit = "units/payday2/weapons/wpn_fps_ass_ak5_pts/wpn_fps_ass_ak5_fg_fnc"
elseif WacMenu._data.replace_ak5cfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_fg_ak5c.third_unit = "units/payday2/weapons/wpn_third_ass_ak5_pts/wpn_third_ass_ak5_fg_ak5a"
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_fg_ak5c.unit = "units/payday2/weapons/wpn_fps_ass_ak5_pts/wpn_fps_ass_ak5_fg_ak5a"
end
if WacMenu._data.replace_fncfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_fg_fnc.third_unit = "units/payday2/weapons/wpn_third_ass_ak5_pts/wpn_third_ass_ak5_fg_ak5c"
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_fg_fnc.unit = "units/payday2/weapons/wpn_fps_ass_ak5_pts/wpn_fps_ass_ak5_fg_ak5c"
elseif WacMenu._data.replace_fncfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_fg_fnc.third_unit = "units/payday2/weapons/wpn_third_ass_ak5_pts/wpn_third_ass_ak5_fg_ak5a"
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_fg_fnc.unit = "units/payday2/weapons/wpn_fps_ass_ak5_pts/wpn_fps_ass_ak5_fg_ak5a"
end
if WacMenu._data.replace_ak5bstock == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_s_ak5b.forbids = {"wpn_fps_ass_ak5_s_ak5a"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_s_ak5b.third_unit = "units/payday2/weapons/wpn_third_ass_ak5_pts/wpn_third_ass_ak5_s_ak5c"
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_s_ak5b.unit = "units/payday2/weapons/wpn_fps_ass_ak5_pts/wpn_fps_ass_ak5_s_ak5c"
elseif WacMenu._data.replace_ak5bstock == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_s_ak5b.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_s_ak5b.third_unit = "units/payday2/weapons/wpn_third_ass_ak5_pts/wpn_third_ass_ak5_s_ak5a"
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_s_ak5b.unit = "units/payday2/weapons/wpn_fps_ass_ak5_pts/wpn_fps_ass_ak5_s_ak5a"
end
if WacMenu._data.replace_ak5cstock == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_s_ak5c.adds = {"wpn_fps_ass_ak5_s_ak5a"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_s_ak5c.third_unit = "units/payday2/weapons/wpn_third_ass_ak5_pts/wpn_third_ass_ak5_s_ak5b"
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_s_ak5c.unit = "units/payday2/weapons/wpn_fps_ass_ak5_pts/wpn_fps_ass_ak5_s_ak5b"
elseif WacMenu._data.replace_ak5cstock == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_s_ak5c.adds = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_s_ak5c.third_unit = "units/payday2/weapons/wpn_third_ass_ak5_pts/wpn_third_ass_ak5_s_ak5a"
	tweak_data.weapon.factory.parts.wpn_fps_ass_ak5_s_ak5c.unit = "units/payday2/weapons/wpn_fps_ass_ak5_pts/wpn_fps_ass_ak5_s_ak5a"
end
if WacMenu._data.replace_asvalprotob == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_asval_b_proto.third_unit = "units/pd2_dlc_character_sokol/weapons/wpn_third_ass_asval_pts/wpn_third_ass_asval_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_asval_b_proto.unit = "units/pd2_dlc_character_sokol/weapons/wpn_fps_ass_asval_pts/wpn_fps_ass_asval_b_standard"
end
if WacMenu._data.replace_asvalstock == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_asval_s_solid.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_asval_s_solid.adds = {"wpn_fps_ass_asval_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_asval_s_solid.third_unit = "units/pd2_dlc_character_sokol/weapons/wpn_third_ass_asval_pts/wpn_third_ass_asval_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_asval_s_solid.unit = "units/pd2_dlc_character_sokol/weapons/wpn_fps_ass_asval_pts/wpn_fps_ass_asval_s_standard"
elseif WacMenu._data.replace_asvalstock == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_asval_s_standard.adds = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_asval_s_standard.forbids = {"wpn_fps_ass_asval_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_asval_s_standard.third_unit = "units/pd2_dlc_character_sokol/weapons/wpn_third_ass_asval_pts/wpn_third_ass_asval_s_solid"
	tweak_data.weapon.factory.parts.wpn_fps_ass_asval_s_standard.unit = "units/pd2_dlc_character_sokol/weapons/wpn_fps_ass_asval_pts/wpn_fps_ass_asval_s_solid"
elseif WacMenu._data.replace_asvalstock == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_asval_s_standard.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_ass_asval_s_standard.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_ass_asval_s_solid.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_asval_s_solid.adds = {"wpn_fps_ass_asval_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_asval_s_solid.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_ass_asval_s_solid.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_auglongb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_aug_b_long.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_ass_aug_b_medium"
	tweak_data.weapon.factory.parts.wpn_fps_aug_b_long.unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_b_medium"
elseif WacMenu._data.replace_auglongb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_aug_b_long.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_ass_aug_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_aug_b_long.unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_b_short"
end
if WacMenu._data.replace_augextrarail == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_aug_fg_a3.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_aug_fg_a3.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_augf90body == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_aug_body_f90.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_ass_aug_body_aug"
	tweak_data.weapon.factory.parts.wpn_fps_aug_body_f90.unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_body_aug"
end
if WacMenu._data.replace_augmagpulassist == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_aug_m_quick.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_aug_m_pmag"
	tweak_data.weapon.factory.parts.wpn_fps_ass_aug_m_quick.unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_m_pmag"
end
if WacMenu._data.replace_sa58fg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_01.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_fg_03"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_01.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_fg_03"
elseif WacMenu._data.replace_sa58fg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_01.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_fg_04"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_01.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_fg_04"
elseif WacMenu._data.replace_sa58fg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_01.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_fg_wood"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_01.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_fg_wood"
elseif WacMenu._data.replace_sa58fg == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_01.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_01.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_fg_standard"
end
if WacMenu._data.replace_falsniperfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_04.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_fg_01"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_04.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_fg_01"
elseif WacMenu._data.replace_falsniperfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_04.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_fg_03"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_04.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_fg_03"
elseif WacMenu._data.replace_falsniperfg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_04.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_fg_wood"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_04.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_fg_wood"
elseif WacMenu._data.replace_falsniperfg == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_04.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_04.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_fg_standard"
end
if WacMenu._data.replace_falwoodfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_wood.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_fg_01"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_wood.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_fg_01"
elseif WacMenu._data.replace_falwoodfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_wood.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_fg_03"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_wood.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_fg_03"
elseif WacMenu._data.replace_falwoodfg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_wood.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_fg_04"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_wood.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_fg_04"
elseif WacMenu._data.replace_falwoodfg == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_wood.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_fg_wood.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_fg_standard"
end
if WacMenu._data.replace_faltacgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_g_01.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_g_01.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_g_standard"
end
if WacMenu._data.replace_falmag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_m_standard.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_m_01"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_m_standard.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_m_01"
end
if WacMenu._data.replace_falextmag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_m_01.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_m_01.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_m_standard"
end
if WacMenu._data.replace_sa58stock == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_s_03"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_s_03"
elseif WacMenu._data.replace_sa58stock == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_s_wood"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_s_wood"
elseif WacMenu._data.replace_sa58stock == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_s_standard"
elseif WacMenu._data.replace_sa58stock == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
elseif WacMenu._data.replace_sa58stock == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard"
elseif WacMenu._data.replace_sa58stock == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_third_upg_m4_s_crane"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_fps_upg_m4_s_crane"
elseif WacMenu._data.replace_sa58stock == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_s_ubr/wpn_third_upg_m4_s_ubr"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_s_ubr/wpn_fps_upg_m4_s_ubr"
elseif WacMenu._data.replace_sa58stock == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_s_vltor"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_01.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_s_vltor"
end
if WacMenu._data.replace_falprs2stock == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_s_01"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_s_01"
elseif WacMenu._data.replace_falprs2stock == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_s_wood"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_s_wood"
elseif WacMenu._data.replace_falprs2stock == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_s_standard"
elseif WacMenu._data.replace_falprs2stock == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
elseif WacMenu._data.replace_falprs2stock == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard"
elseif WacMenu._data.replace_falprs2stock == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_third_upg_m4_s_crane"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_fps_upg_m4_s_crane"
elseif WacMenu._data.replace_falprs2stock == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_s_ubr/wpn_third_upg_m4_s_ubr"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_s_ubr/wpn_fps_upg_m4_s_ubr"
elseif WacMenu._data.replace_falprs2stock == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_s_vltor"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_03.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_s_vltor"
end
if WacMenu._data.replace_falwoodenstock == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_s_01"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_s_01"
elseif WacMenu._data.replace_falwoodenstock == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_s_03"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_s_03"
elseif WacMenu._data.replace_falwoodenstock == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_s_standard"
elseif WacMenu._data.replace_falwoodenstock == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
elseif WacMenu._data.replace_falwoodenstock == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard"
elseif WacMenu._data.replace_falwoodenstock == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_third_upg_m4_s_crane"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_fps_upg_m4_s_crane"
elseif WacMenu._data.replace_falwoodenstock == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_s_ubr/wpn_third_upg_m4_s_ubr"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_s_ubr/wpn_fps_upg_m4_s_ubr"
elseif WacMenu._data.replace_falwoodenstock == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_s_vltor"
	tweak_data.weapon.factory.parts.wpn_fps_ass_fal_s_wood.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_s_vltor"
end
if WacMenu._data.replace_famaslongb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_long.override = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_long.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_long.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_b_standard"
elseif WacMenu._data.replace_famaslongb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_long.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_long.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_b_short"
elseif WacMenu._data.replace_famaslongb == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_long.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_b_sniper"
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_long.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_b_sniper"
end
if WacMenu._data.replace_famasshortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_short.override = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_short.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_short.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_b_standard"
elseif WacMenu._data.replace_famasshortb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_short.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_short.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_b_long"
elseif WacMenu._data.replace_famasshortb == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_short.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_b_sniper"
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_short.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_b_sniper"
end
if WacMenu._data.replace_famassniperb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_sniper.override = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_sniper.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_b_standard"
elseif WacMenu._data.replace_famassniperb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_sniper.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_b_short"
elseif WacMenu._data.replace_famassniperb == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_b_sniper.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_b_long"
end
if WacMenu._data.replace_famasg1grip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_g_retro.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_famas_g_retro.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_g_standard"
end
if WacMenu._data.replace_fnf2000longb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_corgi_b_long.third_unit = "units/pd2_dlc_rvd/weapons/wpn_third_ass_corgi_pts/wpn_third_ass_corgi_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_ass_corgi_b_long.unit = "units/pd2_dlc_rvd/weapons/wpn_fps_ass_corgi_pts/wpn_fps_ass_corgi_b_short"
end
if WacMenu._data.replace_fnf2000stndb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_corgi_b_short.third_unit = "units/pd2_dlc_rvd/weapons/wpn_third_ass_corgi_pts/wpn_third_ass_corgi_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_ass_corgi_b_short.unit = "units/pd2_dlc_rvd/weapons/wpn_fps_ass_corgi_pts/wpn_fps_ass_corgi_b_long"
end
if WacMenu._data.replace_fnf2000stndbody == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_corgi_body_lower_standard.third_unit = "units/pd2_dlc_rvd/weapons/wpn_third_ass_corgi_pts/wpn_third_ass_corgi_body_lower_strap"
	tweak_data.weapon.factory.parts.wpn_fps_ass_corgi_body_lower_standard.unit = "units/pd2_dlc_rvd/weapons/wpn_fps_ass_corgi_pts/wpn_fps_ass_corgi_body_lower_strap"
end
if WacMenu._data.replace_fnf2000tanbody == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_corgi_body_lower_strap.third_unit = "units/pd2_dlc_rvd/weapons/wpn_third_ass_corgi_pts/wpn_third_ass_corgi_body_lower_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_corgi_body_lower_strap.unit = "units/pd2_dlc_rvd/weapons/wpn_fps_ass_corgi_pts/wpn_fps_ass_corgi_body_lower_standard"
end
if WacMenu._data.replace_g3barrel == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_b_long.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_b_long.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_b_short"
end
if WacMenu._data.replace_g3barreldmr == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_b_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_b_sniper.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_b_long"
elseif WacMenu._data.replace_g3barreldmr == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_b_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_b_sniper.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_b_short"
end
if WacMenu._data.replace_g3psgforce == true then
local g3parts = {}
g3parts.g3snipbovr = "tweak_data.weapon.factory.parts.wpn_fps_ass_g3_b_sniper.override."
g3parts.fg = " = { unit = \"units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_psg\", third_unit = \"units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_psg\" }"
g3parts.grip = " = { unit = \"units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_g_sniper\", third_unit = \"units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_g_sniper\" }"
g3parts.stock = " = { unit = \"units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_s_sniper\", third_unit = \"units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_s_sniper\" }"
assert(loadstring(g3parts.g3snipbovr .. "wpn_fps_ass_g3_fg_psg" .. g3parts.fg))()
assert(loadstring(g3parts.g3snipbovr .. "wpn_fps_ass_g3_fg_railed" .. g3parts.fg))()
assert(loadstring(g3parts.g3snipbovr .. "wpn_fps_ass_g3_fg_retro" .. g3parts.fg))()
assert(loadstring(g3parts.g3snipbovr .. "wpn_fps_ass_g3_fg_retro_plastic" .. g3parts.fg))()
assert(loadstring(g3parts.g3snipbovr .. "wpn_fps_ass_g3_fg_bipod" .. g3parts.fg))()
assert(loadstring(g3parts.g3snipbovr .. "wpn_fps_ass_g3_g_sniper" .. g3parts.grip))()
assert(loadstring(g3parts.g3snipbovr .. "wpn_fps_lmg_hk21_g_standard" .. g3parts.grip))()
assert(loadstring(g3parts.g3snipbovr .. "wpn_fps_lmg_hk21_s_standard" .. g3parts.stock))()
assert(loadstring(g3parts.g3snipbovr .. "wpn_fps_ass_g3_s_wood" .. g3parts.stock))()
end
if WacMenu._data.replace_g3foregripprecision == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_psg.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_railed"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_psg.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_railed"
elseif WacMenu._data.replace_g3foregripprecision == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_psg.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_retro"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_psg.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_retro"
elseif WacMenu._data.replace_g3foregripprecision == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_psg.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_retro_plastic"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_psg.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_retro_plastic"
elseif WacMenu._data.replace_g3foregripprecision == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_psg.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_bipod"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_psg.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_bipod"
end
if WacMenu._data.replace_g3foregriptactical == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_railed.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_psg"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_railed.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_psg"
elseif WacMenu._data.replace_g3foregriptactical == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_railed.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_retro"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_railed.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_retro"
elseif WacMenu._data.replace_g3foregriptactical == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_railed.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_retro_plastic"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_railed.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_retro_plastic"
elseif WacMenu._data.replace_g3foregriptactical == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_railed.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_bipod"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_railed.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_bipod"
end
if WacMenu._data.replace_g3foregripwooden == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_retro.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_psg"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_retro.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_psg"
elseif WacMenu._data.replace_g3foregripwooden == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_retro.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_railed"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_retro.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_railed"
elseif WacMenu._data.replace_g3foregripwooden == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_retro.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_retro_plastic"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_retro.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_retro_plastic"
elseif WacMenu._data.replace_g3foregripwooden == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_retro.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_bipod"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_retro.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_bipod"
end
if WacMenu._data.replace_g3handguardplastic == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_retro_plastic.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_psg"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_retro_plastic.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_psg"
elseif WacMenu._data.replace_g3handguardplastic == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_retro_plastic.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_railed"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_retro_plastic.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_railed"
elseif WacMenu._data.replace_g3handguardplastic == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_retro_plastic.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_retro"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_retro_plastic.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_retro"
elseif WacMenu._data.replace_g3handguardplastic == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_retro_plastic.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_fg_bipod"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_fg_retro_plastic.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_fg_bipod"
end
if WacMenu._data.replace_g3retrogrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_g_retro.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_g_sniper"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_g_retro.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_g_sniper"
elseif WacMenu._data.replace_g3retrogrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_g_retro.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_g_retro.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_fps_lmg_hk21_g_standard"
end
if WacMenu._data.replace_g3psg1grip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_g_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_g_retro"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_g_sniper.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_g_retro"
elseif WacMenu._data.replace_g3psg1grip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_g_sniper.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_g_sniper.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_fps_lmg_hk21_g_standard"
end
if WacMenu._data.replace_g3sniperstock == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_s_sniper.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_s_sniper.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_s_wood"
elseif WacMenu._data.replace_g3sniperstock == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_s_sniper.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_s_sniper.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_fps_lmg_hk21_s_standard"
end
if WacMenu._data.replace_g3woodstock == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_s_wood.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_s_sniper"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_s_wood.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_s_sniper"
elseif WacMenu._data.replace_g3woodstock == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_s_wood.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g3_s_wood.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_fps_lmg_hk21_s_standard"
end
if WacMenu._data.replace_g36cfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_c.forbids = {"wpn_fps_ass_g36_b_short","wpn_fps_upg_g36_b_ultra"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_c.adds = {"wpn_fps_ass_g36_b_long"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_c.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_upg_g36_fg_ksk"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_c.unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_fg_ksk"
elseif WacMenu._data.replace_g36cfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_c.forbids = {"wpn_fps_ass_g36_b_short","wpn_fps_upg_g36_b_ultra"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_c.adds = {"wpn_fps_ass_g36_b_long"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_c.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_upg_g36_fg_k"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_c.unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_fg_k"
elseif WacMenu._data.replace_g36cfg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_c.forbids = {"wpn_fps_ass_g36_b_short","wpn_fps_ass_g36_b_long"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_c.adds = {"wpn_fps_upg_g36_b_ultra"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_c.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_ass_g36_fg_long/wpn_third_upg_g36_fg_long"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_c.unit = "units/pd2_dlc_tng/weapons/wpn_fps_ass_g36_fg_long/wpn_fps_upg_g36_fg_long"
end
if WacMenu._data.replace_g36rasfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_ksk.forbids = {"wpn_fps_ass_g36_b_long","wpn_fps_upg_g36_b_ultra"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_ksk.adds = {"wpn_fps_ass_g36_b_short"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_ksk.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_upg_g36_fg_c"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_ksk.unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_fg_c"
elseif WacMenu._data.replace_g36rasfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_ksk.forbids = {"wpn_fps_ass_g36_b_short","wpn_fps_upg_g36_b_ultra"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_ksk.adds = {"wpn_fps_ass_g36_b_long"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_ksk.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_upg_g36_fg_k"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_ksk.unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_fg_k"
elseif WacMenu._data.replace_g36rasfg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_ksk.forbids = {"wpn_fps_ass_g36_b_short","wpn_fps_ass_g36_b_long"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_ksk.adds = {"wpn_fps_upg_g36_b_ultra"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_ksk.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_ass_g36_fg_long/wpn_third_upg_g36_fg_long"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_fg_ksk.unit = "units/pd2_dlc_tng/weapons/wpn_fps_ass_g36_fg_long/wpn_fps_upg_g36_fg_long"
end
if WacMenu._data.replace_g36fg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_g36_fg_long.forbids = {"wpn_fps_ass_g36_b_long","wpn_fps_upg_g36_b_ultra"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_g36_fg_long.adds = {"wpn_fps_ass_g36_b_short"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_g36_fg_long.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_upg_g36_fg_c"
	tweak_data.weapon.factory.parts.wpn_fps_upg_g36_fg_long.unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_fg_c"
elseif WacMenu._data.replace_g36fg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_g36_fg_long.forbids = {"wpn_fps_ass_g36_b_short","wpn_fps_upg_g36_b_ultra"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_g36_fg_long.adds = {"wpn_fps_ass_g36_b_long"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_g36_fg_long.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_upg_g36_fg_k"
	tweak_data.weapon.factory.parts.wpn_fps_upg_g36_fg_long.unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_fg_k"
elseif WacMenu._data.replace_g36fg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_g36_fg_long.forbids = {"wpn_fps_ass_g36_b_short","wpn_fps_upg_g36_b_ultra"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_g36_fg_long.adds = {"wpn_fps_ass_g36_b_long"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_g36_fg_long.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_upg_g36_fg_ksk"
	tweak_data.weapon.factory.parts.wpn_fps_upg_g36_fg_long.unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_fg_ksk"
end
if WacMenu._data.replace_g36kvstock == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_s_kv.adds = {"wpn_fps_ass_g36_body_sl8"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_s_kv.forbids = {"wpn_fps_ass_g36_body_standard","wpn_fps_ass_g36_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_s_kv.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_upg_g36_s_sl8"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_s_kv.unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_s_sl8"
elseif WacMenu._data.replace_g36kvstock == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_s_kv.adds = {"wpn_fps_ass_g36_body_standard","wpn_fps_ass_g36_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_s_kv.forbids = {"wpn_fps_ass_g36_body_sl8"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_s_kv.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_upg_g36_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_s_kv.unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_s_standard"
end
if WacMenu._data.replace_g36magpulassist == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_m_quick.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_ass_g36_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_m_quick.unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_m_standard"
end
if WacMenu._data.replace_g36sl8stock == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_s_sl8.adds = {"wpn_fps_ass_g36_body_standard","wpn_fps_ass_g36_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_s_sl8.forbids = {"wpn_fps_ass_g36_body_sl8"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_s_sl8.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_upg_g36_s_kv"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_s_sl8.unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_s_kv"
elseif WacMenu._data.replace_g36sl8stock == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_s_sl8.adds = {"wpn_fps_ass_g36_body_standard","wpn_fps_ass_g36_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_s_sl8.forbids = {"wpn_fps_ass_g36_body_sl8"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_s_sl8.third_unit = "units/payday2/weapons/wpn_third_ass_g36_pts/wpn_third_upg_g36_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_s_sl8.unit = "units/payday2/weapons/wpn_fps_ass_g36_pts/wpn_fps_ass_g36_s_standard"
end
local galil_fg_ovr = {}
if not wac_galilfg_override_saved then
galil_fg_ovr.mar = deep_clone(tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.override)
galil_fg_ovr.stnd = deep_clone(tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_standard.override)
galil_fg_ovr.sniper = deep_clone(tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sniper.override)
galil_fg_ovr.fab = deep_clone(tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.override)
	wac_galilfg_override_saved = true
end
if WacMenu._data.replace_galiltacfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.forbids = {"wpn_fps_shot_r870_ris_special"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_mar"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_mar"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.override = galil_fg_ovr.mar
elseif WacMenu._data.replace_galiltacfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_sar"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_sar"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.override = galil_fg_ovr.stnd
elseif WacMenu._data.replace_galiltacfg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_sniper"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_sniper"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.override = galil_fg_ovr.sniper
elseif WacMenu._data.replace_galiltacfg == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_fab.override = galil_fg_ovr.stnd
end
if WacMenu._data.replace_galilmicro == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_fab"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_fab"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.override = galil_fg_ovr.fab
elseif WacMenu._data.replace_galilmicro == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_sar"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_sar"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.override = galil_fg_ovr.stnd
elseif WacMenu._data.replace_galilmicro == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_sniper"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_sniper"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.override = galil_fg_ovr.sniper
elseif WacMenu._data.replace_galilmicro == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_mar.override = galil_fg_ovr.stnd
end
if WacMenu._data.replace_galilsarfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sar.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_fab"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sar.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_fab"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sar.override = galil_fg_ovr.fab
elseif WacMenu._data.replace_galilsarfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sar.forbids = {"wpn_fps_shot_r870_ris_special"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sar.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_mar"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sar.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_mar"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sar.override = galil_fg_ovr.mar
elseif WacMenu._data.replace_galilsarfg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sar.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_sniper"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sar.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_sniper"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sar.override = galil_fg_ovr.sniper
elseif WacMenu._data.replace_galilsarfg == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sar.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sar.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_standard"
end
if WacMenu._data.replace_galatzfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sniper.forbids = {"wpn_fps_shot_r870_ris_special"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_mar"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sniper.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_mar"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sniper.override = galil_fg_ovr.mar
elseif WacMenu._data.replace_galatzfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sniper.forbids = {"wpn_fps_shot_r870_ris_special"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_fab"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sniper.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_fab"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sniper.override = galil_fg_ovr.fab
elseif WacMenu._data.replace_galatzfg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_sar"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sniper.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_sar"
elseif WacMenu._data.replace_galatzfg == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_fg_sniper.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_fg_standard"
end
if WacMenu._data.replace_galil_snipergrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_g_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_g_sniper.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_g_standard"
end
if WacMenu._data.replace_galiloldmicrost == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_light"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_light"
elseif WacMenu._data.replace_galiloldmicrost == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_plastic"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_plastic"
elseif WacMenu._data.replace_galiloldmicrost == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_skeletal"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_skeletal"
elseif WacMenu._data.replace_galiloldmicrost == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_sniper"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_sniper"
elseif WacMenu._data.replace_galiloldmicrost == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_wood"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_wood"
elseif WacMenu._data.replace_galiloldmicrost == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_standard"
elseif WacMenu._data.replace_galiloldmicrost == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
elseif WacMenu._data.replace_galiloldmicrost == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
elseif WacMenu._data.replace_galiloldmicrost == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.adds = {"wpn_fps_smg_polymer_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard"
elseif WacMenu._data.replace_galiloldmicrost == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.adds = {"wpn_fps_smg_polymer_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_third_upg_m4_s_crane"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_fps_upg_m4_s_crane"
elseif WacMenu._data.replace_galiloldmicrost == 11 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.adds = {"wpn_fps_smg_polymer_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_s_ubr/wpn_third_upg_m4_s_ubr"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_s_ubr/wpn_fps_upg_m4_s_ubr"
elseif WacMenu._data.replace_galiloldmicrost == 12 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.adds = {"wpn_fps_smg_polymer_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_s_vltor"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_fab.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_s_vltor"
end
if WacMenu._data.replace_galilplasticst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_light"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_light"
elseif WacMenu._data.replace_galilplasticst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_fab"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_fab"
elseif WacMenu._data.replace_galilplasticst == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_skeletal"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_skeletal"
elseif WacMenu._data.replace_galilplasticst == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_sniper"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_sniper"
elseif WacMenu._data.replace_galilplasticst == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_wood"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_wood"
elseif WacMenu._data.replace_galilplasticst == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_standard"
elseif WacMenu._data.replace_galilplasticst == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
elseif WacMenu._data.replace_galilplasticst == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.adds = {"wpn_fps_smg_polymer_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard"
elseif WacMenu._data.replace_galilplasticst == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.adds = {"wpn_fps_smg_polymer_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_third_upg_m4_s_crane"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_fps_upg_m4_s_crane"
elseif WacMenu._data.replace_galilplasticst == 11 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.adds = {"wpn_fps_smg_polymer_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_s_ubr/wpn_third_upg_m4_s_ubr"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_s_ubr/wpn_fps_upg_m4_s_ubr"
elseif WacMenu._data.replace_galilplasticst == 12 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.adds = {"wpn_fps_smg_polymer_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_s_vltor"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_plastic.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_s_vltor"
end
if WacMenu._data.replace_galatzst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_light"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_light"
elseif WacMenu._data.replace_galatzst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_fab"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_fab"
elseif WacMenu._data.replace_galatzst == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_plastic"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_plastic"
elseif WacMenu._data.replace_galatzst == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_skeletal"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_skeletal"
elseif WacMenu._data.replace_galatzst == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_wood"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_wood"
elseif WacMenu._data.replace_galatzst == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_standard"
elseif WacMenu._data.replace_galatzst == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
elseif WacMenu._data.replace_galatzst == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.adds = {"wpn_fps_smg_polymer_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard"
elseif WacMenu._data.replace_galatzst == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.adds = {"wpn_fps_smg_polymer_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_third_upg_m4_s_crane"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_fps_upg_m4_s_crane"
elseif WacMenu._data.replace_galatzst == 11 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.adds = {"wpn_fps_smg_polymer_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_s_ubr/wpn_third_upg_m4_s_ubr"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_s_ubr/wpn_fps_upg_m4_s_ubr"
elseif WacMenu._data.replace_galatzst == 12 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.adds = {"wpn_fps_smg_polymer_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_s_vltor"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_sniper.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_s_vltor"
end
if WacMenu._data.replace_galilwoodenst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_light"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_light"
elseif WacMenu._data.replace_galilwoodenst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_fab"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_fab"
elseif WacMenu._data.replace_galilwoodenst == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_plastic"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_plastic"
elseif WacMenu._data.replace_galilwoodenst == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_skeletal"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_skeletal"
elseif WacMenu._data.replace_galilwoodenst == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_sniper"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_sniper"
elseif WacMenu._data.replace_galilwoodenst == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_standard"
elseif WacMenu._data.replace_galilwoodenst == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
elseif WacMenu._data.replace_galilwoodenst == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.adds = {"wpn_fps_smg_polymer_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard"
elseif WacMenu._data.replace_galilwoodenst == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.adds = {"wpn_fps_smg_polymer_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_third_upg_m4_s_crane"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_fps_upg_m4_s_crane"
elseif WacMenu._data.replace_galilwoodenst == 11 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.adds = {"wpn_fps_smg_polymer_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_s_ubr/wpn_third_upg_m4_s_ubr"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_s_ubr/wpn_fps_upg_m4_s_ubr"
elseif WacMenu._data.replace_galilwoodenst == 12 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.adds = {"wpn_fps_smg_polymer_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_s_vltor"
	tweak_data.weapon.factory.parts.wpn_fps_ass_galil_s_wood.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_s_vltor"
end
if WacMenu._data.replace_hk416longb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_b_long.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_b_long.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_b_standard"
end
if WacMenu._data.replace_hk416jpre == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_ns_special.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_firepig/wpn_third_upg_ns_ass_smg_firepig"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_ns_special.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_firepig/wpn_fps_upg_ns_ass_smg_firepig"
elseif WacMenu._data.replace_hk416jpre == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_ns_special.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_tank/wpn_third_upg_ns_ass_smg_tank"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_ns_special.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_tank/wpn_fps_upg_ns_ass_smg_tank"
elseif WacMenu._data.replace_hk416jpre == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_ns_special.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_stubby/wpn_third_upg_ns_ass_smg_stubby"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_ns_special.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_stubby/wpn_fps_upg_ns_ass_smg_stubby"
elseif WacMenu._data.replace_hk416jpre == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_ns_special.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_surefire"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_ns_special.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_surefire"
elseif WacMenu._data.replace_hk416jpre == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_ns_special.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_linear"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_ns_special.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_linear"
elseif WacMenu._data.replace_firepig == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_ns_special.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_jprifles"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_ns_special.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_jprifles"
elseif WacMenu._data.replace_hk416jpre == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_ns_special.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ass_ns_battle/wpn_third_upg_ass_ns_battle"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_ns_special.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ass_ns_battle/wpn_fps_upg_ass_ns_battle"
elseif WacMenu._data.replace_hk416jpre == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_ns_special.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_ns_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_ns_special.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_ns_standard"
end
if WacMenu._data.replace_hk416ccmag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.bullet_objects = {prefix = "g_bullet_", amount = 1}
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_m4_m_quad/wpn_third_upg_m4_m_quad"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_m_quad/wpn_fps_upg_m4_m_quad"
elseif WacMenu._data.replace_hk416ccmag == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.bullet_objects = {prefix = "g_bullet_", amount = 1}
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_drum"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_drum"
elseif WacMenu._data.replace_hk416ccmag == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.bullet_objects = {prefix = "g_bullet_", amount = 1}
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_straight"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_straight"
elseif WacMenu._data.replace_hk416ccmag == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.bullet_objects = {prefix = "g_bullet_", amount = 2}
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_m_std"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_m_std"
elseif WacMenu._data.replace_hk416ccmag == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.bullet_objects = {prefix = "g_bullet_", amount = 28}
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_pmag"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_pmag"
elseif WacMenu._data.replace_hk416ccmag == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.bullet_objects = {prefix = "g_bullet_", amount = 2}
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_m_l5/wpn_third_upg_m4_m_l5"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_m_l5/wpn_fps_upg_m4_m_l5"
elseif WacMenu._data.replace_hk416ccmag == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.bullet_objects = {prefix = "g_bullet_", amount = 28}
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.third_unit = "units/pd2_dlc_clover/weapons/wpn_third_ass_l85a2_pts/wpn_third_ass_l85a2_m_emag"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_m_emag"
elseif WacMenu._data.replace_hk416ccmag == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.bullet_objects = {prefix = "g_bullet_", amount = 21}
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_aug_m_pmag"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_m_drum.unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_m_pmag"
end
if WacMenu._data.replace_hk416cvertgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_vg_standard.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_stubby/wpn_third_upg_vg_ass_smg_stubby"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_vg_standard.unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_stubby/wpn_fps_upg_vg_ass_smg_stubby"
elseif WacMenu._data.replace_hk416cvertgrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_vg_standard.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_verticalgrip/wpn_third_upg_vg_ass_smg_verticalgrip"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_vg_standard.unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_verticalgrip/wpn_fps_upg_vg_ass_smg_verticalgrip"
elseif WacMenu._data.replace_hk416cvertgrip == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_vg_standard.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_afg/wpn_third_upg_vg_ass_smg_afg"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_vg_standard.unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_afg/wpn_fps_upg_vg_ass_smg_afg"
elseif WacMenu._data.replace_hk416cvertgrip == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_vg_standard.third_unit = "units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_third_smg_polymer_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_vg_standard.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_fps_smg_polymer_fg_standard"
elseif WacMenu._data.replace_hk416cvertgrip == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_vg_standard.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_vg_surefire"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_vg_standard.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_vg_surefire"
elseif WacMenu._data.replace_hk416cvertgrip == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_vg_standard.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_ass_tecci_vg_standard.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_hk417stndst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_contraband_s_standard.adds = {"wpn_fps_upg_m4_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_contraband_s_standard.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_contraband_s_standard.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard"
elseif WacMenu._data.replace_hk417stndst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_contraband_s_standard.adds = {"wpn_fps_upg_m4_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_contraband_s_standard.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_pts"
	tweak_data.weapon.factory.parts.wpn_fps_ass_contraband_s_standard.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_pts"
elseif WacMenu._data.replace_hk417stndst == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_contraband_s_standard.adds = {"wpn_fps_upg_m4_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_contraband_s_standard.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_third_upg_m4_s_crane"
	tweak_data.weapon.factory.parts.wpn_fps_ass_contraband_s_standard.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_fps_upg_m4_s_crane"
elseif WacMenu._data.replace_hk417stndst == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_contraband_s_standard.adds = {"wpn_fps_upg_m4_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_contraband_s_standard.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_s_ubr/wpn_third_upg_m4_s_ubr"
	tweak_data.weapon.factory.parts.wpn_fps_ass_contraband_s_standard.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_s_ubr/wpn_fps_upg_m4_s_ubr"
elseif WacMenu._data.replace_hk417stndst == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_contraband_s_standard.adds = {"wpn_fps_upg_m4_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_contraband_s_standard.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_s_vltor"
	tweak_data.weapon.factory.parts.wpn_fps_ass_contraband_s_standard.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_s_vltor"
elseif WacMenu._data.replace_hk417stndst == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_contraband_s_standard.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_contraband_s_standard.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_s_standard"
end
if WacMenu._data.replace_l85longb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_b_long.third_unit = "units/pd2_dlc_clover/weapons/wpn_third_ass_l85a2_pts/wpn_third_ass_l85a2_b_medium"
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_b_long.unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_b_medium"
elseif WacMenu._data.replace_l85longb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_b_long.third_unit = "units/pd2_dlc_clover/weapons/wpn_third_ass_l85a2_pts/wpn_third_ass_l85a2_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_b_long.unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_b_short"
end
if WacMenu._data.replace_l85shortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_b_short.third_unit = "units/pd2_dlc_clover/weapons/wpn_third_ass_l85a2_pts/wpn_third_ass_l85a2_b_medium"
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_b_short.unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_b_medium"
elseif WacMenu._data.replace_l85shortb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_b_short.third_unit = "units/pd2_dlc_clover/weapons/wpn_third_ass_l85a2_pts/wpn_third_ass_l85a2_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_b_short.unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_b_long"
end
if WacMenu._data.replace_l85railfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_fg_short.third_unit = "units/pd2_dlc_clover/weapons/wpn_third_ass_l85a2_pts/wpn_third_ass_l85a2_fg_medium"
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_fg_short.unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_fg_medium"
end
if WacMenu._data.replace_l85worngrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_g_worn.third_unit = "units/pd2_dlc_clover/weapons/wpn_third_ass_l85a2_pts/wpn_third_ass_l85a2_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_g_worn.unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_g_standard"
end
if WacMenu._data.replace_m1a_ebr == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_m14_body_ebr.third_unit = "units/payday2/weapons/wpn_third_ass_m14_pts/wpn_third_ass_m14_body_jae"
	tweak_data.weapon.factory.parts.wpn_fps_ass_m14_body_ebr.unit = "units/payday2/weapons/wpn_fps_ass_m14_pts/wpn_fps_ass_m14_body_jae"
elseif WacMenu._data.replace_m1a_ebr == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_m14_body_ebr.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_m14_body_ebr.third_unit = "units/payday2/weapons/wpn_third_ass_m14_pts/wpn_third_ass_m14_body_dmr"
	tweak_data.weapon.factory.parts.wpn_fps_ass_m14_body_ebr.unit = "units/payday2/weapons/wpn_fps_ass_m14_pts/wpn_fps_ass_m14_body_dmr"
end
if WacMenu._data.replace_m1a_jagerstock == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_m14_body_jae.third_unit = "units/payday2/weapons/wpn_third_ass_m14_pts/wpn_third_ass_m14_body_ebr"
	tweak_data.weapon.factory.parts.wpn_fps_ass_m14_body_jae.unit = "units/payday2/weapons/wpn_fps_ass_m14_pts/wpn_fps_ass_m14_body_ebr"
elseif WacMenu._data.replace_m1a_jagerstock == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_m14_body_jae.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_m14_body_jae.third_unit = "units/payday2/weapons/wpn_third_ass_m14_pts/wpn_third_ass_m14_body_dmr"
	tweak_data.weapon.factory.parts.wpn_fps_ass_m14_body_jae.unit = "units/payday2/weapons/wpn_fps_ass_m14_pts/wpn_fps_ass_m14_body_dmr"
end
if WacMenu._data.replace_m1garand_shortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_ching_b_short.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_third_ass_ching_b_standar"
	tweak_data.weapon.factory.parts.wpn_fps_ass_ching_b_short.unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_fps_ass_ching_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_ching_b_short.override = nil
end
if WacMenu._data.replace_m1garand_ammopouch == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_ching_s_pouch.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_third_ass_ching_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_ching_s_pouch.unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching_pts/wpn_fps_ass_ching_s_standard"
end
if not tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.override then
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.override = {}
end
if not tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.override then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.override = {}
end
if not tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.override then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.override = {}
end
if not tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.override then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.override = {}
end
if not tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.override then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.override = {}
end
local m4_fg_ovr = {}
if not wac_m4fg_override_saved then
m4_fg_ovr.smr = deep_clone(tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.override)
m4_fg_ovr.moe = deep_clone(tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.override)
m4_fg_ovr.handlesight = {unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_o_handle_sight",third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_ass_m16_o_handle_sight",stance_mod = {wpn_fps_ass_m4 = { translation = Vector3(0, 0, -0.5)}}}
	wac_m4fg_override_saved = true
end
if WacMenu._data.replace_m4afterfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_jp/wpn_third_upg_fg_jp"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_jp/wpn_fps_upg_fg_jp"
elseif WacMenu._data.replace_m4afterfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_smr/wpn_third_upg_fg_smr"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_smr/wpn_fps_upg_fg_smr"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.override.wpn_fps_m4_uupg_b_sd = m4_fg_ovr.smr
elseif WacMenu._data.replace_m4afterfg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_lvoa/wpn_third_upg_ass_m4_fg_lvoa"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_lvoa/wpn_fps_upg_ass_m4_fg_lvoa"
elseif WacMenu._data.replace_m4afterfg == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_moe/wpn_third_upg_ass_m4_fg_moe"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_moe/wpn_fps_upg_ass_m4_fg_moe"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.override.wpn_fps_m4_uupg_o_flipup = m4_fg_ovr.moe
elseif WacMenu._data.replace_m4afterfg == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_fg_railed"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_fg_railed"
elseif WacMenu._data.replace_m4afterfg == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m16_fg_stag/wpn_third_upg_ass_m16_fg_stag"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m16_fg_stag/wpn_fps_upg_ass_m16_fg_stag"
elseif WacMenu._data.replace_m4afterfg == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.adds = {"wpn_fps_m4_uupg_fg_rail_ext"}
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail"
elseif WacMenu._data.replace_m4afterfg == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.third_unit = "units/payday2/weapons/wpn_third_smg_olympic_pts/wpn_third_smg_olympic_fg_olympic"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.unit = "units/payday2/weapons/wpn_fps_smg_olympic_pts/wpn_fps_smg_olympic_fg_olympic"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.override.wpn_fps_m4_uupg_o_flipup = m4_fg_ovr.handlesight
elseif WacMenu._data.replace_m4afterfg == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.third_unit = "units/payday2/weapons/wpn_third_ass_amcar_pts/wpn_third_amcar_uupg_fg_amcar"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_fg_amcar"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_fg_lr300.override.wpn_fps_m4_uupg_o_flipup = m4_fg_ovr.handlesight
end
if WacMenu._data.replace_m4compfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_lr300"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_lr300"
elseif WacMenu._data.replace_m4compfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_smr/wpn_third_upg_fg_smr"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_smr/wpn_fps_upg_fg_smr"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.override.wpn_fps_m4_uupg_b_sd = m4_fg_ovr.smr
elseif WacMenu._data.replace_m4compfg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_lvoa/wpn_third_upg_ass_m4_fg_lvoa"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_lvoa/wpn_fps_upg_ass_m4_fg_lvoa"
elseif WacMenu._data.replace_m4compfg == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_moe/wpn_third_upg_ass_m4_fg_moe"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_moe/wpn_fps_upg_ass_m4_fg_moe"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.override.wpn_fps_m4_uupg_o_flipup = m4_fg_ovr.moe
elseif WacMenu._data.replace_m4compfg == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.adds = {"wpn_fps_m4_uupg_fg_rail_ext"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail"
elseif WacMenu._data.replace_m4compfg == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_fg_railed"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_fg_railed"
elseif WacMenu._data.replace_m4compfg == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m16_fg_stag/wpn_third_upg_ass_m16_fg_stag"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m16_fg_stag/wpn_fps_upg_ass_m16_fg_stag"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.override.wpn_fps_m4_uupg_b_sd = m4_fg_ovr.smr
elseif WacMenu._data.replace_m4compfg == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.third_unit = "units/payday2/weapons/wpn_third_smg_olympic_pts/wpn_third_smg_olympic_fg_olympic"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.unit = "units/payday2/weapons/wpn_fps_smg_olympic_pts/wpn_fps_smg_olympic_fg_olympic"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.override.wpn_fps_m4_uupg_o_flipup = m4_fg_ovr.handlesight
elseif WacMenu._data.replace_m4compfg == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.third_unit = "units/payday2/weapons/wpn_third_ass_amcar_pts/wpn_third_amcar_uupg_fg_amcar"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_fg_amcar"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_jp.override.wpn_fps_m4_uupg_o_flipup = m4_fg_ovr.handlesight
end
if WacMenu._data.replace_m4smrfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_jp/wpn_third_upg_fg_jp"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_jp/wpn_fps_upg_fg_jp"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.override = nil
elseif WacMenu._data.replace_m4smrfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_lr300"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_lr300"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.override = nil
elseif WacMenu._data.replace_m4smrfg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_lvoa/wpn_third_upg_ass_m4_fg_lvoa"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_lvoa/wpn_fps_upg_ass_m4_fg_lvoa"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.override = nil
elseif WacMenu._data.replace_m4smrfg == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_moe/wpn_third_upg_ass_m4_fg_moe"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_moe/wpn_fps_upg_ass_m4_fg_moe"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.override.wpn_fps_m4_uupg_o_flipup = m4_fg_ovr.moe
elseif WacMenu._data.replace_m4smrfg == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.adds = {"wpn_fps_m4_uupg_fg_rail_ext"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.override = nil
elseif WacMenu._data.replace_m4smrfg == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_fg_railed"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_fg_railed"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.override = nil
elseif WacMenu._data.replace_m4smrfg == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m16_fg_stag/wpn_third_upg_ass_m16_fg_stag"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m16_fg_stag/wpn_fps_upg_ass_m16_fg_stag"
elseif WacMenu._data.replace_m4smrfg == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.third_unit = "units/payday2/weapons/wpn_third_smg_olympic_pts/wpn_third_smg_olympic_fg_olympic"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.unit = "units/payday2/weapons/wpn_fps_smg_olympic_pts/wpn_fps_smg_olympic_fg_olympic"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.override.wpn_fps_m4_uupg_o_flipup = m4_fg_ovr.handlesight
elseif WacMenu._data.replace_m4smrfg == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.third_unit = "units/payday2/weapons/wpn_third_ass_amcar_pts/wpn_third_amcar_uupg_fg_amcar"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_fg_amcar"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_smr.override.wpn_fps_m4_uupg_o_flipup = m4_fg_ovr.handlesight
end
if WacMenu._data.replace_m4lvoafg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_jp/wpn_third_upg_fg_jp"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_jp/wpn_fps_upg_fg_jp"
elseif WacMenu._data.replace_m4lvoafg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_lr300"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_lr300"
elseif WacMenu._data.replace_m4lvoafg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_smr/wpn_third_upg_fg_smr"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_smr/wpn_fps_upg_fg_smr"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.override.wpn_fps_m4_uupg_b_sd = m4_fg_ovr.smr
elseif WacMenu._data.replace_m4lvoafg == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_moe/wpn_third_upg_ass_m4_fg_moe"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_moe/wpn_fps_upg_ass_m4_fg_moe"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.override.wpn_fps_m4_uupg_o_flipup = m4_fg_ovr.moe
elseif WacMenu._data.replace_m4lvoafg == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.adds = {"wpn_fps_m4_uupg_fg_rail_ext"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail"
elseif WacMenu._data.replace_m4lvoafg == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_fg_railed"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_fg_railed"
elseif WacMenu._data.replace_m4lvoafg == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m16_fg_stag/wpn_third_upg_ass_m16_fg_stag"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m16_fg_stag/wpn_fps_upg_ass_m16_fg_stag"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.override.wpn_fps_m4_uupg_b_sd = m4_fg_ovr.smr
elseif WacMenu._data.replace_m4lvoafg == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.third_unit = "units/payday2/weapons/wpn_third_smg_olympic_pts/wpn_third_smg_olympic_fg_olympic"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.unit = "units/payday2/weapons/wpn_fps_smg_olympic_pts/wpn_fps_smg_olympic_fg_olympic"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.override.wpn_fps_m4_uupg_o_flipup = m4_fg_ovr.handlesight
elseif WacMenu._data.replace_m4lvoafg == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.third_unit = "units/payday2/weapons/wpn_third_ass_amcar_pts/wpn_third_amcar_uupg_fg_amcar"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_fg_amcar"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_lvoa.override.wpn_fps_m4_uupg_o_flipup = m4_fg_ovr.handlesight
end
if WacMenu._data.replace_m4moefg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_jp/wpn_third_upg_fg_jp"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_jp/wpn_fps_upg_fg_jp"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.override = nil
elseif WacMenu._data.replace_m4moefg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_lr300"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_lr300"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.override = nil
elseif WacMenu._data.replace_m4moefg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_smr/wpn_third_upg_fg_smr"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_smr/wpn_fps_upg_fg_smr"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.override.wpn_fps_m4_uupg_b_sd = m4_fg_ovr.smr
elseif WacMenu._data.replace_m4moefg == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_lvoa/wpn_third_upg_ass_m4_fg_lvoa"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_lvoa/wpn_fps_upg_ass_m4_fg_lvoa"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.override = nil
elseif WacMenu._data.replace_m4moefg == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.adds = {"wpn_fps_m4_uupg_fg_rail_ext"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.override = nil
elseif WacMenu._data.replace_m4moefg == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_fg_railed"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_fg_railed"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.override = nil
elseif WacMenu._data.replace_m4moefg == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m16_fg_stag/wpn_third_upg_ass_m16_fg_stag"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m16_fg_stag/wpn_fps_upg_ass_m16_fg_stag"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.override.wpn_fps_m4_uupg_b_sd = m4_fg_ovr.smr
elseif WacMenu._data.replace_m4moefg == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.third_unit = "units/payday2/weapons/wpn_third_smg_olympic_pts/wpn_third_smg_olympic_fg_olympic"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.unit = "units/payday2/weapons/wpn_fps_smg_olympic_pts/wpn_fps_smg_olympic_fg_olympic"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.override.wpn_fps_m4_uupg_o_flipup = m4_fg_ovr.handlesight
elseif WacMenu._data.replace_m4moefg == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.third_unit = "units/payday2/weapons/wpn_third_ass_amcar_pts/wpn_third_amcar_uupg_fg_amcar"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_fg_amcar"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_fg_moe.override.wpn_fps_m4_uupg_o_flipup = m4_fg_ovr.handlesight
end
if not tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.override then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.override = {}
end
if not tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.override then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.override = {}
end
if not tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.override then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.override = {}
end
local m16_fg_ovr = {}
if not wac_m16fg_override_saved then
m16_fg_ovr.stag = {a_obj = "a_os_stag"}
	wac_m16fg_override_saved = true
end
if WacMenu._data.replace_m16tacfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m16_fg_stag/wpn_third_upg_ass_m16_fg_stag"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m16_fg_stag/wpn_fps_upg_ass_m16_fg_stag"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.override.wpn_fps_ass_m16_os_frontsight = m16_fg_ovr.stag
elseif WacMenu._data.replace_m16tacfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_fg_vietnam"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_fg_vietnam"
elseif WacMenu._data.replace_m16tacfg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_fg_standard"
elseif WacMenu._data.replace_m16tacfg == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_smr/wpn_third_upg_fg_smr"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_smr/wpn_fps_upg_fg_smr"
elseif WacMenu._data.replace_m16tacfg == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_lr300"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_lr300"
elseif WacMenu._data.replace_m16tacfg == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_jp/wpn_third_upg_fg_jp"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_jp/wpn_fps_upg_fg_jp"
elseif WacMenu._data.replace_m16tacfg == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_lvoa/wpn_third_upg_ass_m4_fg_lvoa"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_lvoa/wpn_fps_upg_ass_m4_fg_lvoa"
elseif WacMenu._data.replace_m16tacfg == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_moe/wpn_third_upg_ass_m4_fg_moe"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_moe/wpn_fps_upg_ass_m4_fg_moe"
elseif WacMenu._data.replace_m16tacfg == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.adds = {"wpn_fps_m4_uupg_fg_rail_ext"}
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail"
elseif WacMenu._data.replace_m16tacfg == 11 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.third_unit = "units/payday2/weapons/wpn_third_ass_amcar_pts/wpn_third_amcar_uupg_fg_amcar"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_railed.unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_fg_amcar"
end
if WacMenu._data.replace_m16a1fg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_fg_railed"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_fg_railed"
elseif WacMenu._data.replace_m16a1fg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m16_fg_stag/wpn_third_upg_ass_m16_fg_stag"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m16_fg_stag/wpn_fps_upg_ass_m16_fg_stag"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.override.wpn_fps_ass_m16_os_frontsight = m16_fg_ovr.stag
elseif WacMenu._data.replace_m16a1fg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_fg_standard"
elseif WacMenu._data.replace_m16a1fg == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_smr/wpn_third_upg_fg_smr"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_smr/wpn_fps_upg_fg_smr"
elseif WacMenu._data.replace_m16a1fg == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_lr300"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_lr300"
elseif WacMenu._data.replace_m16a1fg == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_jp/wpn_third_upg_fg_jp"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_jp/wpn_fps_upg_fg_jp"
elseif WacMenu._data.replace_m16a1fg == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_lvoa/wpn_third_upg_ass_m4_fg_lvoa"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_lvoa/wpn_fps_upg_ass_m4_fg_lvoa"
elseif WacMenu._data.replace_m16a1fg == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_moe/wpn_third_upg_ass_m4_fg_moe"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_moe/wpn_fps_upg_ass_m4_fg_moe"
elseif WacMenu._data.replace_m16a1fg == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.adds = {"wpn_fps_m4_uupg_fg_rail_ext"}
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail"
elseif WacMenu._data.replace_m16a1fg == 11 then
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.third_unit = "units/payday2/weapons/wpn_third_ass_amcar_pts/wpn_third_amcar_uupg_fg_amcar"
	tweak_data.weapon.factory.parts.wpn_fps_m16_fg_vietnam.unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_fg_amcar"
end
if WacMenu._data.replace_m16ergofg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_fg_vietnam"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_fg_vietnam"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.override = nil
elseif WacMenu._data.replace_m16ergofg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_fg_railed"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_fg_railed"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.override = nil
elseif WacMenu._data.replace_m16ergofg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.override = nil
elseif WacMenu._data.replace_m16ergofg == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_smr/wpn_third_upg_fg_smr"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_smr/wpn_fps_upg_fg_smr"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.override = nil
elseif WacMenu._data.replace_m16ergofg == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_lr300"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_lr300"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.override = nil
elseif WacMenu._data.replace_m16ergofg == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_jp/wpn_third_upg_fg_jp"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_jp/wpn_fps_upg_fg_jp"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.override = nil
elseif WacMenu._data.replace_m16ergofg == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_lvoa/wpn_third_upg_ass_m4_fg_lvoa"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_lvoa/wpn_fps_upg_ass_m4_fg_lvoa"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.override = nil
elseif WacMenu._data.replace_m16ergofg == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_moe/wpn_third_upg_ass_m4_fg_moe"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_moe/wpn_fps_upg_ass_m4_fg_moe"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.override = nil
elseif WacMenu._data.replace_m16ergofg == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.adds = {"wpn_fps_m4_uupg_fg_rail_ext"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.override = nil
elseif WacMenu._data.replace_m16ergofg == 11 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.third_unit = "units/payday2/weapons/wpn_third_ass_amcar_pts/wpn_third_amcar_uupg_fg_amcar"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_fg_amcar"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m16_fg_stag.override = nil
end
if WacMenu._data.replace_m733fg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_amcar_uupg_fg_amcar.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail"
	tweak_data.weapon.factory.parts.wpn_fps_amcar_uupg_fg_amcar.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail"
end
if WacMenu._data.replace_scarhlongb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_b_long.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_b_medium"
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_b_long.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_b_medium"
elseif WacMenu._data.replace_scarhlongb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_b_long.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_b_long.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_b_short"
end
if WacMenu._data.replace_scarsrxrail == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_fg_railext.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_fg_railext.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_scarhsnipstock == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_s_sniper.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_s_sniper.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_s_standard"
elseif WacMenu._data.replace_scarhsnipstock == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_s_sniper.adds = {"wpn_fps_ass_s552_s_m4"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_s_sniper.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_s_sniper.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard"
elseif WacMenu._data.replace_scarhsnipstock == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_s_sniper.adds = {"wpn_fps_ass_s552_s_m4"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_s_sniper.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_third_upg_m4_s_crane"
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_s_sniper.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_fps_upg_m4_s_crane"
elseif WacMenu._data.replace_scarhsnipstock == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_s_sniper.adds = {"wpn_fps_ass_s552_s_m4"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_s_sniper.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_s_ubr/wpn_third_upg_m4_s_ubr"
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_s_sniper.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_s_ubr/wpn_fps_upg_m4_s_ubr"
elseif WacMenu._data.replace_scarhsnipstock == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_s_sniper.adds = {"wpn_fps_ass_s552_s_m4"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_s_sniper.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_s_vltor"
	tweak_data.weapon.factory.parts.wpn_fps_ass_scar_s_sniper.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_s_vltor"
end
if WacMenu._data.replace_sg552longb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_b_long.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_b_long.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_b_standard"
end
if WacMenu._data.replace_sg552enhfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_fg_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_railed"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_fg_standard_green.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_railed"
elseif WacMenu._data.replace_sg552enhfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_fg_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_fg_standard_green.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_standard"
end
if WacMenu._data.replace_sg553railedfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_fg_railed.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_standard_green"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_fg_railed.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_standard_green"
elseif WacMenu._data.replace_sg553railedfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_fg_railed.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_fg_railed.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_fg_standard"
end
if WacMenu._data.replace_sg552grip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_g_standard_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_g_standard_green.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_g_standard"
end
if WacMenu._data.replace_sg552receiver == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_body_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_body_standard_black"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_body_standard.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_body_standard_black"
end
if WacMenu._data.replace_sg552blackreceiver == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_body_standard_black.third_unit = "units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_body_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_s552_body_standard_black.unit = "units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_body_standard"
end
if WacMenu._data.replace_sub2kgen2fg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_sub2000_fg_gen2.forbids = {"wpn_fps_ass_sub2000_o_front"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_sub2000_fg_gen2.third_unit = "units/pd2_dlc_casino/weapons/wpn_third_ass_sub2000_pts/wpn_third_ass_sub2000_fg_railed"
	tweak_data.weapon.factory.parts.wpn_fps_ass_sub2000_fg_gen2.unit = "units/pd2_dlc_casino/weapons/wpn_fps_ass_sub2000_pts/wpn_fps_ass_sub2000_fg_railed"
elseif WacMenu._data.replace_sub2kgen2fg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_sub2000_fg_gen2.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_sub2000_fg_gen2.third_unit = "units/pd2_dlc_casino/weapons/wpn_third_ass_sub2000_pts/wpn_third_ass_sub2000_fg_gen1"
	tweak_data.weapon.factory.parts.wpn_fps_ass_sub2000_fg_gen2.unit = "units/pd2_dlc_casino/weapons/wpn_fps_ass_sub2000_pts/wpn_fps_ass_sub2000_fg_gen1"
end
if WacMenu._data.replace_sub2kgen2fgrec == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_sub2000_fg_gen2.override = nil
end
if WacMenu._data.replace_sub2krailfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_sub2000_fg_railed.adds = {"wpn_fps_ass_sub2000_o_front"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_sub2000_fg_railed.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_sub2000_fg_railed.third_unit = "units/pd2_dlc_casino/weapons/wpn_third_ass_sub2000_pts/wpn_third_ass_sub2000_fg_gen2"
	tweak_data.weapon.factory.parts.wpn_fps_ass_sub2000_fg_railed.unit = "units/pd2_dlc_casino/weapons/wpn_fps_ass_sub2000_pts/wpn_fps_ass_sub2000_fg_gen2"
elseif WacMenu._data.replace_sub2krailfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_sub2000_fg_railed.adds = {"wpn_fps_ass_sub2000_o_front"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_sub2000_fg_railed.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_sub2000_fg_railed.third_unit = "units/pd2_dlc_casino/weapons/wpn_third_ass_sub2000_pts/wpn_third_ass_sub2000_fg_gen1"
	tweak_data.weapon.factory.parts.wpn_fps_ass_sub2000_fg_railed.unit = "units/pd2_dlc_casino/weapons/wpn_fps_ass_sub2000_pts/wpn_fps_ass_sub2000_fg_gen1"
end
if WacMenu._data.replace_sub2krailfgrec == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_sub2000_fg_railed.override = {wpn_fps_ass_sub2000_body_gen1 = {unit = "units/pd2_dlc_casino/weapons/wpn_fps_ass_sub2000_pts/wpn_fps_ass_sub2000_body_gen2",third_unit = "units/pd2_dlc_casino/weapons/wpn_third_ass_sub2000_pts/wpn_third_ass_sub2000_body_gen2"}}
end
if WacMenu._data.replace_sub2ksuppfgrec == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_sub2000_fg_suppressed.override = nil
end
if WacMenu._data.replace_vhsshortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_vhs_b_short.override = deep_clone(tweak_data.weapon.factory.parts.wpn_fps_ass_vhs_b_standard.override)
	tweak_data.weapon.factory.parts.wpn_fps_ass_vhs_b_short.third_unit = "units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_third_ass_vhs_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_vhs_b_short.unit = "units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_fps_ass_vhs_b_standard"
elseif WacMenu._data.replace_vhsshortb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_vhs_b_short.override = {wpn_fps_ass_vhs_ns_vhs = {unit = "units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_fps_ass_vhs_ns_vhs_no",third_unit = "units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_fps_ass_vhs_ns_vhs_no"}}
	tweak_data.weapon.factory.parts.wpn_fps_ass_vhs_b_short.third_unit = "units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_third_ass_vhs_b_sniper"
	tweak_data.weapon.factory.parts.wpn_fps_ass_vhs_b_short.unit = "units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_fps_ass_vhs_b_sniper"
end
if WacMenu._data.replace_vhslongb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_vhs_b_sniper.third_unit = "units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_third_ass_vhs_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_ass_vhs_b_sniper.unit = "units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_fps_ass_vhs_b_standard"
elseif WacMenu._data.replace_vhslongb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_vhs_b_sniper.override = nil
	tweak_data.weapon.factory.parts.wpn_fps_ass_vhs_b_sniper.third_unit = "units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_third_ass_vhs_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_ass_vhs_b_sniper.unit = "units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_fps_ass_vhs_b_short"
end
if WacMenu._data.replace_vhsironsights == true then
	tweak_data.weapon.factory.parts.wpn_fps_ass_vhs_body.adds = {"wpn_fps_ass_vhs_o_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_ass_vhs_o_standard.forbids = {"wpn_fps_upg_o_acog"}
end
-- Shotguns
if WacMenu._data.replace_aa12b == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_aa12_barrel_long.third_unit = "units/pd2_dlc_bbq/weapons/wpn_fps_sho_aa12_pts/wpn_third_sho_aa12_barrel"
	tweak_data.weapon.factory.parts.wpn_fps_sho_aa12_barrel_long.unit = "units/pd2_dlc_bbq/weapons/wpn_fps_sho_aa12_pts/wpn_fps_sho_aa12_barrel"
end
if WacMenu._data.replace_bs09shortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_shot_b682_b_short.third_unit = "units/pd2_dlc_bonnie/weapons/wpn_fps_shot_b682_pts/wpn_third_shot_b682_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_shot_b682_b_short.unit = "units/pd2_dlc_bonnie/weapons/wpn_fps_shot_b682_pts/wpn_fps_shot_b682_b_long"
end
if WacMenu._data.replace_bs09shortst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_shot_b682_s_short.third_unit = "units/pd2_dlc_bonnie/weapons/wpn_fps_shot_b682_pts/wpn_third_shot_b682_s_long"
	tweak_data.weapon.factory.parts.wpn_fps_shot_b682_s_short.unit = "units/pd2_dlc_bonnie/weapons/wpn_fps_shot_b682_pts/wpn_fps_shot_b682_s_long"
elseif WacMenu._data.replace_bs09shortst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_shot_b682_s_short.third_unit = "units/pd2_dlc_bonnie/weapons/wpn_fps_shot_b682_pts/wpn_third_shot_b682_s_ammopouch"
	tweak_data.weapon.factory.parts.wpn_fps_shot_b682_s_short.unit = "units/pd2_dlc_bonnie/weapons/wpn_fps_shot_b682_pts/wpn_fps_shot_b682_s_ammopouch"
end
if WacMenu._data.replace_bs09ammopouch == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_shot_b682_s_ammopouch.third_unit = "units/pd2_dlc_bonnie/weapons/wpn_fps_shot_b682_pts/wpn_third_shot_b682_s_long"
	tweak_data.weapon.factory.parts.wpn_fps_shot_b682_s_ammopouch.unit = "units/pd2_dlc_bonnie/weapons/wpn_fps_shot_b682_pts/wpn_fps_shot_b682_s_long"
elseif WacMenu._data.replace_bs09ammopouch == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_shot_b682_s_ammopouch.third_unit = "units/pd2_dlc_bonnie/weapons/wpn_fps_shot_b682_pts/wpn_third_shot_b682_s_short"
	tweak_data.weapon.factory.parts.wpn_fps_shot_b682_s_ammopouch.unit = "units/pd2_dlc_bonnie/weapons/wpn_fps_shot_b682_pts/wpn_fps_shot_b682_s_short"
end
if WacMenu._data.replace_cyresix12shortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_rota_b_short.third_unit = "units/pd2_dlc_rota/weapons/wpn_fps_sho_rota_pts/wpn_third_sho_rota_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_sho_rota_b_short.unit = "units/pd2_dlc_rota/weapons/wpn_fps_sho_rota_pts/wpn_fps_sho_rota_b_long"
end
if WacMenu._data.replace_doublebarrelstnd == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_shot_huntsman_b_long.third_unit = "units/payday2/weapons/wpn_third_shot_huntsman_pts/wpn_third_shot_huntsman_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_shot_huntsman_b_long.unit = "units/payday2/weapons/wpn_fps_shot_huntsman_pts/wpn_fps_shot_huntsman_b_short"
end
if WacMenu._data.replace_doublesawedoffb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_shot_huntsman_b_short.third_unit = "units/payday2/weapons/wpn_third_shot_huntsman_pts/wpn_third_shot_huntsman_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_shot_huntsman_b_short.unit = "units/payday2/weapons/wpn_fps_shot_huntsman_pts/wpn_fps_shot_huntsman_b_long"
end
if WacMenu._data.replace_doublebarrelst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_shot_huntsman_s_long.third_unit = "units/payday2/weapons/wpn_third_shot_huntsman_pts/wpn_third_shot_huntsman_s_short"
	tweak_data.weapon.factory.parts.wpn_fps_shot_huntsman_s_long.unit = "units/payday2/weapons/wpn_fps_shot_huntsman_pts/wpn_fps_shot_huntsman_s_short"
end
if WacMenu._data.replace_doublesawedoffst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_shot_huntsman_s_short.third_unit = "units/payday2/weapons/wpn_third_shot_huntsman_pts/wpn_third_shot_huntsman_s_long"
	tweak_data.weapon.factory.parts.wpn_fps_shot_huntsman_s_short.unit = "units/payday2/weapons/wpn_fps_shot_huntsman_pts/wpn_fps_shot_huntsman_s_long"
end
if WacMenu._data.replace_ithaca37b == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_shot_m37_b_standard.third_unit = "units/pd2_dlc_peta/weapons/wpn_third_shot_m37_pts/wpn_third_shot_m37_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_shot_m37_b_standard.unit = "units/pd2_dlc_peta/weapons/wpn_fps_shot_m37_pts/wpn_fps_shot_m37_b_short"
end
if WacMenu._data.replace_ithaca37shortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_shot_m37_b_short.third_unit = "units/pd2_dlc_peta/weapons/wpn_third_shot_m37_pts/wpn_third_shot_m37_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_shot_m37_b_short.unit = "units/pd2_dlc_peta/weapons/wpn_fps_shot_m37_pts/wpn_fps_shot_m37_b_standard"
end
if WacMenu._data.replace_ithaca37sawedoffst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_shot_m37_s_short.third_unit = "units/pd2_dlc_peta/weapons/wpn_third_shot_m37_pts/wpn_third_shot_m37_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_shot_m37_s_short.unit = "units/pd2_dlc_peta/weapons/wpn_fps_shot_m37_pts/wpn_fps_shot_m37_s_standard"
end
if WacMenu._data.replace_ksgshortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_short.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ksg_pts/wpn_third_sho_ksg_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_short.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ksg_pts/wpn_fps_sho_ksg_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_short.adds = {"wpn_fps_sho_ksg_fg_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_short.forbids = {"wpn_fps_sho_ksg_fg_short"}
	tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_short.override = deep_clone(tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_standard.override)
elseif WacMenu._data.replace_ksgshortb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_short.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ksg_pts/wpn_third_sho_ksg_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_short.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ksg_pts/wpn_fps_sho_ksg_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_short.adds = {"wpn_fps_sho_ksg_fg_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_short.forbids = {"wpn_fps_sho_ksg_fg_short"}
	tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_short.override = {wpn_fps_upg_o_dd_front = {a_obj = "a_o_f_2"}}
end
if WacMenu._data.replace_ksglongb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_long.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ksg_pts/wpn_third_sho_ksg_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_long.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ksg_pts/wpn_fps_sho_ksg_b_standard"
elseif WacMenu._data.replace_ksglongb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_short.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ksg_pts/wpn_third_sho_ksg_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_long.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ksg_pts/wpn_fps_sho_ksg_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_long.adds = {"wpn_fps_sho_ksg_fg_short"}
	tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_long.forbids = {"wpn_fps_sho_ksg_fg_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_sho_ksg_b_long.override = nil
end
if WacMenu._data.replace_ksgmbus == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_mbus_front.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_upg_o_dd/wpn_third_upg_o_dd_front"
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_mbus_front.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_dd/wpn_fps_upg_o_dd_front"
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_mbus_rear.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_upg_o_dd/wpn_third_upg_o_dd_rear"
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_mbus_rear.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_dd/wpn_fps_upg_o_dd_rear"
end
if WacMenu._data.replace_m1014nfab == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_ben_b_short.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ben_pts/wpn_third_sho_ben_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_sho_ben_b_short.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ben_pts/wpn_fps_sho_ben_b_standard"
elseif WacMenu._data.replace_m1014nfab == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_ben_b_short.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ben_pts/wpn_third_sho_ben_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_sho_ben_b_short.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ben_pts/wpn_fps_sho_ben_b_long"
end
if WacMenu._data.replace_m1014longb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_ben_b_long.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ben_pts/wpn_fps_sho_ben_b_standard"
elseif WacMenu._data.replace_m1014longb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_ben_b_long.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ben_pts/wpn_third_sho_ben_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_sho_ben_b_long.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ben_pts/wpn_fps_sho_ben_b_short"
end
if WacMenu._data.replace_m1014collapsedst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_ben_s_collapsed.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ben_pts/wpn_third_sho_ben_s_solid"
	tweak_data.weapon.factory.parts.wpn_fps_sho_ben_s_collapsed.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ben_pts/wpn_fps_sho_ben_s_solid"
elseif WacMenu._data.replace_m1014collapsedst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_ben_s_collapsed.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ben_pts/wpn_third_sho_ben_s_collapsable"
	tweak_data.weapon.factory.parts.wpn_fps_sho_ben_s_collapsed.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ben_pts/wpn_fps_sho_ben_s_collapsable"
end
if WacMenu._data.replace_m1014tacticalst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_ben_s_solid.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ben_pts/wpn_third_sho_ben_s_collapsed"
	tweak_data.weapon.factory.parts.wpn_fps_sho_ben_s_solid.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ben_pts/wpn_fps_sho_ben_s_collapsed"
elseif WacMenu._data.replace_m1014tacticalst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_ben_s_solid.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_ben_pts/wpn_third_sho_ben_s_collapsable"
	tweak_data.weapon.factory.parts.wpn_fps_sho_ben_s_solid.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ben_pts/wpn_fps_sho_ben_s_collapsable"
end
if WacMenu._data.replace_r870zhpump == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_shot_r870_fg_wood.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_fg_big"
	tweak_data.weapon.factory.parts.wpn_fps_shot_r870_fg_wood.unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_fg_big"
elseif WacMenu._data.replace_r870zhpump == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_shot_r870_fg_wood.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_fg_railed"
	tweak_data.weapon.factory.parts.wpn_fps_shot_r870_fg_wood.unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_fg_railed"
elseif WacMenu._data.replace_r870zhpump == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_shot_r870_fg_wood.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_fg_small"
	tweak_data.weapon.factory.parts.wpn_fps_shot_r870_fg_wood.unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_fg_small"
end
if WacMenu._data.replace_r870extmag == true then
	tweak_data.weapon.factory.parts.wpn_fps_shot_r870_m_extended.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_shot_r870_m_extended.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_shellrack == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_shot_r870_body_rack.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_shot_r870_body_rack.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_short870b == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_shot_r870_b_short.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_shot_r870_b_short.unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_shot_r870_fg_small.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_fg_big"
	tweak_data.weapon.factory.parts.wpn_fps_shot_r870_fg_small.unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_fg_big"
	tweak_data.weapon.factory.parts.wpn_fps_shot_shorty_m_extended_short.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_shot_shorty_m_extended_short.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_short870extmag == true then
	tweak_data.weapon.factory.parts.wpn_fps_shot_shorty_m_extended_short.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_shot_shorty_m_extended_short.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_winchsxsshortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_coach_b_short.third_unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_third_sho_coach_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_sho_coach_b_short.unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_fps_sho_coach_b_standard"
end
if WacMenu._data.replace_winchsxsshortst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_coach_s_short.third_unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_third_sho_coach_s_long"
	tweak_data.weapon.factory.parts.wpn_fps_sho_coach_s_short.unit = "units/pd2_dlc_sdb/weapons/wpn_fps_sho_coach_pts/wpn_fps_sho_coach_s_long"
end
if WacMenu._data.replace_s12kshortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_saiga_b_short.third_unit = "units/payday2/weapons/wpn_third_shot_saiga_pts/wpn_third_shot_saiga_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_sho_saiga_b_short.unit = "units/payday2/weapons/wpn_fps_shot_saiga_pts/wpn_fps_shot_saiga_b_standard"
end
if WacMenu._data.replace_s12kfg == 2 then
	tweak_data.weapon.factory.parts.wpn_upg_saiga_fg_standard.forbids = {"wpn_fps_addon_ris","wpn_fps_smg_mac10_body_ris_special"}
	tweak_data.weapon.factory.parts.wpn_upg_saiga_fg_standard.third_unit = "units/payday2/weapons/wpn_third_shot_saiga_pts/wpn_third_upg_saiga_fg_lowerrail"
	tweak_data.weapon.factory.parts.wpn_upg_saiga_fg_standard.unit = "units/payday2/weapons/wpn_fps_shot_saiga_pts/wpn_upg_saiga_fg_lowerrail"
	tweak_data.weapon.factory.parts.wpn_fps_sho_saiga_b_short.override.wpn_upg_saiga_fg_standard = {unit = "units/payday2/weapons/wpn_fps_shot_saiga_pts/wpn_upg_saiga_fg_lowerrail_short"}
elseif WacMenu._data.replace_s12kfg == 3 then
	tweak_data.weapon.factory.parts.wpn_upg_saiga_fg_standard.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_fg_tapco/wpn_third_upg_ak_fg_tapco"
	tweak_data.weapon.factory.parts.wpn_upg_saiga_fg_standard.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_fg_tapco/wpn_fps_upg_ak_fg_tapco"
end
if WacMenu._data.replace_s12ktacrail == 2 then
	tweak_data.weapon.factory.parts.wpn_upg_saiga_fg_lowerrail.forbids = nil
	tweak_data.weapon.factory.parts.wpn_upg_saiga_fg_lowerrail.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_fg_tapco/wpn_third_upg_ak_fg_tapco"
	tweak_data.weapon.factory.parts.wpn_upg_saiga_fg_lowerrail.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_fg_tapco/wpn_fps_upg_ak_fg_tapco"
	tweak_data.weapon.factory.parts.wpn_fps_sho_saiga_b_short.override.wpn_upg_saiga_fg_lowerrail = {}
elseif WacMenu._data.replace_s12ktacrail == 3 then
	tweak_data.weapon.factory.parts.wpn_upg_saiga_fg_lowerrail.forbids = nil
	tweak_data.weapon.factory.parts.wpn_upg_saiga_fg_lowerrail.third_unit = "units/payday2/weapons/wpn_third_shot_saiga_pts/wpn_third_upg_saiga_fg_standard"
	tweak_data.weapon.factory.parts.wpn_upg_saiga_fg_lowerrail.unit = "units/payday2/weapons/wpn_fps_shot_saiga_pts/wpn_upg_saiga_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_sho_saiga_b_short.override.wpn_upg_saiga_fg_lowerrail = {}
end
if WacMenu._data.replace_s12fuglystickcobra == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_saiga_fg_holy.forbids = {"wpn_fps_addon_ris","wpn_fps_smg_mac10_body_ris_special"}
	tweak_data.weapon.factory.parts.wpn_fps_sho_saiga_fg_holy.third_unit = "units/payday2/weapons/wpn_third_shot_saiga_pts/wpn_third_upg_saiga_fg_lowerrail"
	tweak_data.weapon.factory.parts.wpn_fps_sho_saiga_fg_holy.unit = "units/payday2/weapons/wpn_fps_shot_saiga_pts/wpn_upg_saiga_fg_lowerrail"
	tweak_data.weapon.factory.parts.wpn_fps_sho_saiga_b_short.override.wpn_fps_sho_saiga_fg_holy = {unit = "units/payday2/weapons/wpn_fps_shot_saiga_pts/wpn_upg_saiga_fg_lowerrail_short"}
elseif WacMenu._data.replace_s12fuglystickcobra == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_saiga_fg_holy.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_fg_tapco/wpn_third_upg_ak_fg_tapco"
	tweak_data.weapon.factory.parts.wpn_fps_sho_saiga_fg_holy.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_fg_tapco/wpn_fps_upg_ak_fg_tapco"
elseif WacMenu._data.replace_s12fuglystickcobra == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_saiga_fg_holy.third_unit = "units/payday2/weapons/wpn_third_shot_saiga_pts/wpn_third_upg_saiga_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_sho_saiga_fg_holy.unit = "units/payday2/weapons/wpn_fps_shot_saiga_pts/wpn_upg_saiga_fg_standard"
end

if WacMenu._data.replace_spasfoldst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_s_spas12_folded.third_unit = "units/pd2_crimefest_2014/oct26/weapons/wpn_third_sho_spas12_pts/wpn_third_sho_s_spas12_unfolded"
	tweak_data.weapon.factory.parts.wpn_fps_sho_s_spas12_folded.unit = "units/pd2_crimefest_2014/oct26/weapons/wpn_fps_sho_spas12_pts/wpn_fps_sho_s_spas12_unfolded"
elseif WacMenu._data.replace_spasfoldst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_s_spas12_folded.third_unit = "units/pd2_crimefest_2014/oct26/weapons/wpn_third_sho_spas12_pts/wpn_third_sho_s_spas12_solid"
	tweak_data.weapon.factory.parts.wpn_fps_sho_s_spas12_folded.unit = "units/pd2_crimefest_2014/oct26/weapons/wpn_fps_sho_spas12_pts/wpn_fps_sho_s_spas12_solid"
elseif WacMenu._data.replace_spasfoldst == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_s_spas12_folded.third_unit = "units/pd2_crimefest_2014/oct26/weapons/wpn_third_sho_spas12_pts/wpn_third_sho_s_spas12_nostock"
	tweak_data.weapon.factory.parts.wpn_fps_sho_s_spas12_folded.unit = "units/pd2_crimefest_2014/oct26/weapons/wpn_fps_sho_spas12_pts/wpn_fps_sho_s_spas12_nostock"
end
local spas_st_ovr = {}
if not wac_spas12st_override_saved then
spas_st_ovr.folded = deep_clone(tweak_data.weapon.factory.parts.wpn_fps_sho_s_spas12_folded.forbids)
	wac_spas12st_override_saved = true
end
if WacMenu._data.replace_spassolidst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_s_spas12_solid.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_sho_s_spas12_solid.third_unit = "units/pd2_crimefest_2014/oct26/weapons/wpn_third_sho_spas12_pts/wpn_third_sho_s_spas12_unfolded"
	tweak_data.weapon.factory.parts.wpn_fps_sho_s_spas12_solid.unit = "units/pd2_crimefest_2014/oct26/weapons/wpn_fps_sho_spas12_pts/wpn_fps_sho_s_spas12_unfolded"
elseif WacMenu._data.replace_spassolidst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_s_spas12_solid.forbids = spas_st_ovr.folded
	tweak_data.weapon.factory.parts.wpn_fps_sho_s_spas12_solid.third_unit = "units/pd2_crimefest_2014/oct26/weapons/wpn_third_sho_spas12_pts/wpn_third_sho_s_spas12_folded"
	tweak_data.weapon.factory.parts.wpn_fps_sho_s_spas12_solid.unit = "units/pd2_crimefest_2014/oct26/weapons/wpn_fps_sho_spas12_pts/wpn_fps_sho_s_spas12_folded"
elseif WacMenu._data.replace_spassolidst == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_s_spas12_solid.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_sho_s_spas12_solid.third_unit = "units/pd2_crimefest_2014/oct26/weapons/wpn_third_sho_spas12_pts/wpn_third_sho_s_spas12_nostock"
	tweak_data.weapon.factory.parts.wpn_fps_sho_s_spas12_solid.unit = "units/pd2_crimefest_2014/oct26/weapons/wpn_fps_sho_spas12_pts/wpn_fps_sho_s_spas12_nostock"
end
if WacMenu._data.replace_spikex1saigashortfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_basset_fg_short.third_unit = "units/pd2_dlc_dsg/weapons/wpn_third_sho_basset_pts/wpn_third_sho_basset_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_sho_basset_fg_short.unit = "units/pd2_dlc_dsg/weapons/wpn_fps_sho_basset_pts/wpn_fps_sho_basset_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_sho_basset_fg_short.override.wpn_fps_sho_basset_b_standard = {}
	tweak_data.weapon.factory.parts.wpn_fps_sho_basset_fg_short.override.wpn_fps_sho_basset_o_standard = {}
end
if WacMenu._data.replace_strikerlongb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_striker_b_long.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_sho_striker_pts/wpn_third_sho_striker_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_sho_striker_b_long.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_striker_pts/wpn_fps_sho_striker_b_standard"
end
if WacMenu._data.replace_judgegrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_judge_g_standard.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_judge_g_standard.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_g_standard"
elseif WacMenu._data.replace_judgegrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_judge_g_standard.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_g_ergo"
	tweak_data.weapon.factory.parts.wpn_fps_pis_judge_g_standard.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_g_ergo"
end
if WacMenu._data.replace_m1887longb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_boot_b_long.third_unit = "units/pd2_dlc_wild/weapons/wpn_third_sho_boot_pts/wpn_third_sho_boot_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_sho_boot_b_long.unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot_pts/wpn_fps_sho_boot_b_short"
elseif WacMenu._data.replace_m1887longb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_boot_b_long.third_unit = "units/pd2_dlc_wild/weapons/wpn_third_sho_boot_pts/wpn_third_sho_boot_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_sho_boot_b_long.unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot_pts/wpn_fps_sho_boot_b_standard"
end
if WacMenu._data.replace_m1887shortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_boot_b_short.third_unit = "units/pd2_dlc_wild/weapons/wpn_third_sho_boot_pts/wpn_third_sho_boot_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_sho_boot_b_short.unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot_pts/wpn_fps_sho_boot_b_long"
elseif WacMenu._data.replace_m1887shortb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_boot_b_short.third_unit = "units/pd2_dlc_wild/weapons/wpn_third_sho_boot_pts/wpn_third_sho_boot_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_sho_boot_b_short.unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot_pts/wpn_fps_sho_boot_b_standard"
end
if WacMenu._data.replace_m1887casehardened == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_boot_body_exotic.third_unit = "units/pd2_dlc_wild/weapons/wpn_third_sho_boot_pts/wpn_third_sho_boot_body_standard"
	tweak_data.weapon.factory.parts.wpn_fps_sho_boot_body_exotic.unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot_pts/wpn_fps_sho_boot_body_standard"
end
if WacMenu._data.replace_m1887longst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_sho_boot_s_long.third_unit = "units/pd2_dlc_wild/weapons/wpn_third_sho_boot_pts/wpn_third_sho_boot_s_short"
	tweak_data.weapon.factory.parts.wpn_fps_sho_boot_s_long.unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot_pts/wpn_fps_sho_boot_s_short"
end
-- Sniper Rifles
if WacMenu._data.replace_mosinm38barrel == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_mosin_b_short.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_snp_mosin_pts/wpn_third_snp_mosin_b_medium"
	tweak_data.weapon.factory.parts.wpn_fps_snp_mosin_b_short.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_snp_mosin_pts/wpn_fps_snp_mosin_b_medium"
elseif WacMenu._data.replace_mosinm38barrel == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_mosin_b_short.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_snp_mosin_pts/wpn_third_snp_mosin_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_snp_mosin_b_short.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_snp_mosin_pts/wpn_fps_snp_mosin_b_standard"
end
if WacMenu._data.replace_mosinm9130barrel == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_mosin_b_standard.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_snp_mosin_pts/wpn_third_snp_mosin_b_medium"
	tweak_data.weapon.factory.parts.wpn_fps_snp_mosin_b_standard.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_snp_mosin_pts/wpn_fps_snp_mosin_b_medium"
elseif WacMenu._data.replace_mosinm9130barrel == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_mosin_b_standard.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_snp_mosin_pts/wpn_third_snp_mosin_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_snp_mosin_b_standard.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_snp_mosin_pts/wpn_fps_snp_mosin_b_short"
end
if WacMenu._data.replace_mosinblackstock == true then
	tweak_data.weapon.factory.parts.wpn_fps_snp_mosin_body_black.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_snp_mosin_pts/wpn_third_snp_mosin_body_standard"
	tweak_data.weapon.factory.parts.wpn_fps_snp_mosin_body_black.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_snp_mosin_pts/wpn_fps_snp_mosin_body_standard"
	tweak_data.weapon.factory.parts.wpn_fps_snp_mosin_body_black.override = nil
end
if WacMenu._data.replace_msrlongb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_msr_b_long.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_third_snp_msr_pts/wpn_third_snp_msr_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_snp_msr_b_long.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_msr_pts/wpn_fps_snp_msr_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_snp_msr_b_long.override = nil
end
if WacMenu._data.replace_msrbodyst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_msr_body_wood.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_third_snp_msr_pts/wpn_third_snp_msr_body_msr"
	tweak_data.weapon.factory.parts.wpn_fps_snp_msr_body_wood.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_msr_pts/wpn_fps_snp_msr_body_msr"
end
if WacMenu._data.replace_r93woodbody == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_r93_body_wood.third_unit = "units/pd2_dlc_gage_snp/weapons/wpn_third_snp_r93_pts/wpn_third_snp_r93_body_standard"
	tweak_data.weapon.factory.parts.wpn_fps_snp_r93_body_wood.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_r93_pts/wpn_fps_snp_r93_body_standard"
end
if WacMenu._data.replace_srsshortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_desertfox_b_short.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_snp_desertfox_pts/wpn_third_snp_desertfox_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_snp_desertfox_b_short.unit = "units/pd2_dlc_pim/weapons/wpn_fps_snp_desertfox_pts/wpn_fps_snp_desertfox_b_long"
end
if WacMenu._data.replace_srslongb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_desertfox_b_long.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_snp_desertfox_pts/wpn_third_snp_desertfox_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_snp_desertfox_b_long.unit = "units/pd2_dlc_pim/weapons/wpn_fps_snp_desertfox_pts/wpn_fps_snp_desertfox_b_short"
end
if WacMenu._data.replace_svdcomp == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_siltstone_ns_variation_b.third_unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_third_snp_siltstone_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_snp_siltstone_ns_variation_b.unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_fps_snp_siltstone_b_standard"
end
if WacMenu._data.replace_svdpolymerfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_siltstone_fg_polymer.third_unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_third_snp_siltstone_fg_wood"
	tweak_data.weapon.factory.parts.wpn_fps_snp_siltstone_fg_polymer.unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_fps_snp_siltstone_fg_wood"
end
if WacMenu._data.replace_svdpolymerst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_siltstone_s_polymer.third_unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_third_snp_siltstone_s_wood"
	tweak_data.weapon.factory.parts.wpn_fps_snp_siltstone_s_polymer.unit = "units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_fps_snp_siltstone_s_wood"
end
if WacMenu._data.replace_wa2000longb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_b_long.third_unit = "units/pd2_dlc_turtles/weapons/wpn_third_snp_wa2000_pts/wpn_third_snp_wa2000_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_b_long.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_snp_wa2000_pts/wpn_fps_snp_wa2000_b_standard"
end
if WacMenu._data.replace_wa2000lightgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_light.third_unit = "units/pd2_dlc_turtles/weapons/wpn_third_snp_wa2000_pts/wpn_third_snp_wa2000_g_stealth"
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_light.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_snp_wa2000_pts/wpn_fps_snp_wa2000_g_stealth"
elseif WacMenu._data.replace_wa2000lightgrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_light.third_unit = "units/pd2_dlc_turtles/weapons/wpn_third_snp_wa2000_pts/wpn_third_snp_wa2000_g_walnut"
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_light.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_snp_wa2000_pts/wpn_fps_snp_wa2000_g_walnut"
elseif WacMenu._data.replace_wa2000lightgrip == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_light.third_unit = "units/pd2_dlc_turtles/weapons/wpn_third_snp_wa2000_pts/wpn_third_snp_wa2000_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_light.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_snp_wa2000_pts/wpn_fps_snp_wa2000_g_standard"
end
if WacMenu._data.replace_wa2000stealthgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_stealth.third_unit = "units/pd2_dlc_turtles/weapons/wpn_third_snp_wa2000_pts/wpn_third_snp_wa2000_g_light"
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_stealth.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_snp_wa2000_pts/wpn_fps_snp_wa2000_g_light"
elseif WacMenu._data.replace_wa2000stealthgrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_stealth.third_unit = "units/pd2_dlc_turtles/weapons/wpn_third_snp_wa2000_pts/wpn_third_snp_wa2000_g_walnut"
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_stealth.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_snp_wa2000_pts/wpn_fps_snp_wa2000_g_walnut"
elseif WacMenu._data.replace_wa2000stealthgrip == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_stealth.third_unit = "units/pd2_dlc_turtles/weapons/wpn_third_snp_wa2000_pts/wpn_third_snp_wa2000_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_stealth.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_snp_wa2000_pts/wpn_fps_snp_wa2000_g_standard"
end
if WacMenu._data.replace_wa2000walnutgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_walnut.third_unit = "units/pd2_dlc_turtles/weapons/wpn_third_snp_wa2000_pts/wpn_third_snp_wa2000_g_light"
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_walnut.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_snp_wa2000_pts/wpn_fps_snp_wa2000_g_light"
elseif WacMenu._data.replace_wa2000walnutgrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_walnut.third_unit = "units/pd2_dlc_turtles/weapons/wpn_third_snp_wa2000_pts/wpn_third_snp_wa2000_g_stealth"
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_walnut.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_snp_wa2000_pts/wpn_fps_snp_wa2000_g_stealth"
elseif WacMenu._data.replace_wa2000walnutgrip == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_walnut.third_unit = "units/pd2_dlc_turtles/weapons/wpn_third_snp_wa2000_pts/wpn_third_snp_wa2000_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_snp_wa2000_g_walnut.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_snp_wa2000_pts/wpn_fps_snp_wa2000_g_standard"
end
if WacMenu._data.replace_winm1873longb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_snp_winchester_b_long.third_unit = "units/pd2_dlc_west/weapons/wpn_third_snp_winchester/wpn_third_snp_winchester_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_snp_winchester_b_long.unit = "units/pd2_dlc_west/weapons/wpn_fps_snp_winchester_pts/wpn_fps_snp_winchester_b_standard"
end
if WacMenu._data.replace_hk21elongb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_hk21_b_long.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_hk21_b_long.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_fps_lmg_hk21_b_short"
end
if WacMenu._data.replace_hk21estndfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_hk21_fg_long.forbids = {"wpn_fps_upg_bp_lmg_lionbipod"}
	tweak_data.weapon.factory.parts.wpn_fps_lmg_hk21_fg_long.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_fg_short"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_hk21_fg_long.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_fps_lmg_hk21_fg_short"
end
if WacMenu._data.replace_hk21egrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_hk21_g_ergo.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_g_sniper"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_hk21_g_ergo.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_g_sniper"
elseif WacMenu._data.replace_hk21egrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_hk21_g_ergo.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_g_retro"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_hk21_g_ergo.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_g_retro"
elseif WacMenu._data.replace_hk21egrip == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_hk21_g_ergo.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_hk21_g_ergo.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_fps_lmg_hk21_g_standard"
end
if WacMenu._data.replace_m240shortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_par_b_short.third_unit = "units/pd2_dlc_par/weapons/wpn_third_lmg_par_pts/wpn_third_lmg_par_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_par_b_short.unit = "units/pd2_dlc_par/weapons/wpn_fps_lmg_par_pts/wpn_fps_lmg_par_b_standard"
end
if WacMenu._data.replace_m240plasticst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_par_s_plastic.third_unit = "units/pd2_dlc_par/weapons/wpn_third_lmg_par_pts/wpn_third_lmg_par_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_par_s_plastic.unit = "units/pd2_dlc_par/weapons/wpn_fps_lmg_par_pts/wpn_fps_lmg_par_s_standard"
end
if WacMenu._data.replace_m249longbarrel == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_b_long.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_m249_pts/wpn_third_lmg_m249_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_b_long.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249_pts/wpn_fps_lmg_m249_b_short"
end
if WacMenu._data.replace_m249fg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_fg_standard.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_m249_pts/wpn_third_lmg_m249_fg_mk46"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_fg_standard.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249_pts/wpn_fps_lmg_m249_fg_mk46"
end
if WacMenu._data.replace_m249_mk46fg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_fg_mk46.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_m249_pts/wpn_third_lmg_m249_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_fg_mk46.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249_pts/wpn_fps_lmg_m249_fg_standard"
end
if WacMenu._data.replace_mg32barrel == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_mg42_b_mg34.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_b_mg42"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_mg42_b_mg34.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_b_mg42"
end
if WacMenu._data.replace_rpkforegrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_rpk_fg_wood.adds = {"wpn_fps_upg_vg_ass_smg_verticalgrip","wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_lmg_rpk_fg_wood.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_rpk_fg_wood.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_fg_standard"
end
if WacMenu._data.replace_rpkdrum == 2 then
	tweak_data.weapon.factory.parts.wpn_lmg_rpk_m_drum.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_m_quad/wpn_third_upg_ak_m_quad"
	tweak_data.weapon.factory.parts.wpn_lmg_rpk_m_drum.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_m_quad/wpn_fps_upg_ak_m_quad"
elseif WacMenu._data.replace_rpkdrum == 3 then
	tweak_data.weapon.factory.parts.wpn_lmg_rpk_m_drum.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_m_standard"
	tweak_data.weapon.factory.parts.wpn_lmg_rpk_m_drum.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_m_standard"
elseif WacMenu._data.replace_rpkdrum == 4 then
	tweak_data.weapon.factory.parts.wpn_lmg_rpk_m_drum.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_m_akm"
	tweak_data.weapon.factory.parts.wpn_lmg_rpk_m_drum.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_m_akm"
elseif WacMenu._data.replace_rpkdrum == 5 then
	tweak_data.weapon.factory.parts.wpn_lmg_rpk_m_drum.third_unit = "units/payday2/weapons/wpn_third_ass_74_pts/wpn_third_ass_74_m_standard"
	tweak_data.weapon.factory.parts.wpn_lmg_rpk_m_drum.unit = "units/payday2/weapons/wpn_fps_ass_74_pts/wpn_fps_ass_74_m_standard"
elseif WacMenu._data.replace_rpkdrum == 6 then
	tweak_data.weapon.factory.parts.wpn_lmg_rpk_m_drum.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_m_akm_gold"
	tweak_data.weapon.factory.parts.wpn_lmg_rpk_m_drum.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_m_akm_gold"
end
-- Pistols
if WacMenu._data.replace_1911aggressorcomp == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_co_2.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_co_1"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_co_2.unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_co_1"
elseif WacMenu._data.replace_1911aggressorcomp == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_co_2.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_pis_ns_flash"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_co_2.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_pis_ns_flash"
elseif WacMenu._data.replace_1911aggressorcomp == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_co_2.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_third_upg_ns_pis_meatgrinder/wpn_third_upg_ns_pis_meatgrinder"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_co_2.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_meatgrinder/wpn_fps_upg_ns_pis_meatgrinder"
elseif WacMenu._data.replace_1911aggressorcomp == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_co_2.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_co_2.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_1911ergogrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_g_ergo.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_g_bling"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_g_ergo.unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_g_bling"
elseif WacMenu._data.replace_1911ergogrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_g_ergo.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_pis_1911_g_engraved/wpn_third_pis_1911_g_engraved"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_g_ergo.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_pis_1911_g_engraved/wpn_fps_pis_1911_g_engraved"
elseif WacMenu._data.replace_1911ergogrip == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_g_ergo.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_g_ergo.unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_g_standard"
end
if WacMenu._data.replace_1911woodgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_g_bling.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_pis_1911_g_engraved/wpn_third_pis_1911_g_engraved"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_g_bling.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_pis_1911_g_engraved/wpn_fps_pis_1911_g_engraved"
elseif WacMenu._data.replace_1911woodgrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_g_bling.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_g_bling.unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_g_standard"
end
if WacMenu._data.replace_1911engravedgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_g_engraved.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_g_bling"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_g_engraved.unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_g_bling"
elseif WacMenu._data.replace_1911engravedgrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_g_engraved.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_g_engraved.unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_g_standard"
end
if WacMenu._data.replace_1911extmag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_m_extended.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_m_extended.unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_m_standard"
elseif WacMenu._data.replace_1911extmag == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_m_extended.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_pis_1911_m_big/wpn_third_pis_1911_m_big"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_m_extended.unit = "units/pd2_dlc_tng/weapons/wpn_fps_pis_1911_m_big/wpn_fps_pis_1911_m_big"
end
if WacMenu._data.replace_1911bigmag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_m_big.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_m_big.unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_m_standard"
elseif WacMenu._data.replace_1911bigmag == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_m_big.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_m_extended"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_m_big.unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_m_extended"
end
if WacMenu._data.replace_1911vent == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_b_vented.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_b_vented.unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_b_standard"
end
if WacMenu._data.replace_1911ventlong == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_b_long.adds = {"wpn_fps_pis_1911_o_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_b_long.forbids = {"wpn_fps_pis_1911_o_long"}
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_b_long.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_b_vented"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_b_long.unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_b_vented"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_b_long.override = nil
elseif WacMenu._data.replace_1911ventlong == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_b_long.adds = {"wpn_fps_pis_1911_o_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_b_long.forbids = {"wpn_fps_pis_1911_o_long"}
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_b_long.third_unit = "units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_b_long.unit = "units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_1911_b_long.override = nil
end
if WacMenu._data.replace_92fscomp1 == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co1.third_unit = "units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_co_2"
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co1.unit = "units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_co_co2"
elseif WacMenu._data.replace_92fscomp1 == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co1.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_pis_ns_flash"
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co1.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_pis_ns_flash"
elseif WacMenu._data.replace_92fscomp1 == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co1.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_third_upg_ns_pis_meatgrinder/wpn_third_upg_ns_pis_meatgrinder"
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co1.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_meatgrinder/wpn_fps_upg_ns_pis_meatgrinder"
elseif WacMenu._data.replace_92fscomp1 == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co1.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_third_upg_ns_pis_ipsccomp/wpn_third_upg_ns_pis_ipsccomp"
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co1.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_ipsccomp/wpn_fps_upg_ns_pis_ipsccomp"
elseif WacMenu._data.replace_92fscomp1 == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co1.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co1.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_92fscomp2 == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co2.third_unit = "units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_co_1"
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co2.unit = "units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_co_co1"
elseif WacMenu._data.replace_92fscomp2 == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co2.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_pis_ns_flash"
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co2.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_pis_ns_flash"
elseif WacMenu._data.replace_92fscomp2 == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co2.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_third_upg_ns_pis_meatgrinder/wpn_third_upg_ns_pis_meatgrinder"
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co2.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_meatgrinder/wpn_fps_upg_ns_pis_meatgrinder"
elseif WacMenu._data.replace_92fscomp2 == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co2.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_third_upg_ns_pis_ipsccomp/wpn_third_upg_ns_pis_ipsccomp"
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co2.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_ipsccomp/wpn_fps_upg_ns_pis_ipsccomp"
elseif WacMenu._data.replace_92fscomp2 == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co2.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_co_co2.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_92fsergogrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_g_ergo.third_unit = "units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_g_std"
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_g_ergo.unit = "units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_g_std"
end
if WacMenu._data.replace_92fsengravedgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_g_engraved.third_unit = "units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_g_std"
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_g_engraved.unit = "units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_g_std"
end
if WacMenu._data.replace_92fsextmag == true then
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_m_extended.third_unit = "units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_m_std"
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_m_extended.unit = "units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_m_std"
end
if WacMenu._data.replace_92fselite2 == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_sl_brigadier.third_unit = "units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_sl_std"
	tweak_data.weapon.factory.parts.wpn_fps_pis_beretta_sl_brigadier.unit = "units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_sl_std"
end
if WacMenu._data.replace_c96longb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_c96_b_long.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_pis_c96_pts/wpn_third_pis_c96_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_c96_b_long.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_pis_c96_pts/wpn_fps_pis_c96_b_standard"
end
if WacMenu._data.replace_c96extmag == true then
	tweak_data.weapon.factory.parts.wpn_fps_pis_c96_m_extended.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_pis_c96_pts/wpn_third_pis_c96_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_c96_m_extended.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_pis_c96_pts/wpn_fps_pis_c96_m_standard"
end
if WacMenu._data.replace_c96holster == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_c96_s_solid.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_pis_c96_s_solid.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_coltdefblinggrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_shrew_g_bling.third_unit = "units/pd2_dlc_myh/weapons/wpn_third_pis_shrew_pts/wpn_third_pis_shrew_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_shrew_g_bling.unit = "units/pd2_dlc_myh/weapons/wpn_fps_pis_shrew_pts/wpn_fps_pis_shrew_g_standard"
end
if WacMenu._data.replace_coltdefergogrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_shrew_g_ergo.third_unit = "units/pd2_dlc_myh/weapons/wpn_third_pis_shrew_pts/wpn_third_pis_shrew_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_shrew_g_ergo.unit = "units/pd2_dlc_myh/weapons/wpn_fps_pis_shrew_pts/wpn_fps_pis_shrew_g_standard"
end
if WacMenu._data.replace_coltdefextmag == true then
	tweak_data.weapon.factory.parts.wpn_fps_pis_shrew_m_extended.third_unit = "units/pd2_dlc_myh/weapons/wpn_third_pis_shrew_pts/wpn_third_pis_shrew_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_shrew_m_extended.unit = "units/pd2_dlc_myh/weapons/wpn_fps_pis_shrew_pts/wpn_fps_pis_shrew_m_standard"
end
if WacMenu._data.replace_coltdefmilledsl == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_shrew_sl_milled.third_unit = "units/pd2_dlc_myh/weapons/wpn_third_pis_shrew_pts/wpn_third_pis_shrew_sl_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_shrew_sl_milled.unit = "units/pd2_dlc_myh/weapons/wpn_fps_pis_shrew_pts/wpn_fps_pis_shrew_sl_standard"
end
if WacMenu._data.replace_coltbuntlineb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_peacemaker_b_long.third_unit = "units/pd2_dlc_west/weapons/wpn_third_pis_peacemaker_pts/wpn_third_pis_peacemaker_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_pis_peacemaker_b_long.unit = "units/pd2_dlc_west/weapons/wpn_fps_pis_peacemaker_pts/wpn_fps_pis_peacemaker_b_short"
elseif WacMenu._data.replace_coltbuntlineb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_peacemaker_b_long.third_unit = "units/pd2_dlc_west/weapons/wpn_third_pis_peacemaker_pts/wpn_third_pis_peacemaker_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_peacemaker_b_long.unit = "units/pd2_dlc_west/weapons/wpn_fps_pis_peacemaker_pts/wpn_fps_pis_peacemaker_b_standard"
end
if WacMenu._data.replace_coltssabling == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_peacemaker_g_bling.third_unit = "units/pd2_dlc_west/weapons/wpn_third_pis_peacemaker_pts/wpn_third_pis_peacemaker_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_peacemaker_g_bling.unit = "units/pd2_dlc_west/weapons/wpn_fps_pis_peacemaker_pts/wpn_fps_pis_peacemaker_g_standard"
end
if WacMenu._data.replace_coltsaastock == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_peacemaker_s_skeletal.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_pis_peacemaker_s_skeletal.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_deaglestndb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_b_standard.third_unit = "units/pd2_dlc_icc/weapons/wpn_fps_pis_deagle_b_modern/wpn_third_pis_deagle_b_modern"
	tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_b_standard.unit = "units/pd2_dlc_icc/weapons/wpn_fps_pis_deagle_b_modern/wpn_fps_pis_deagle_b_modern"
end
if WacMenu._data.replace_deaglelongb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_b_long.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_b_long.unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_b_long.override.wpn_upg_o_marksmansight_front = {}
	tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_b_long.override.wpn_fps_pis_deagle_o_standard_front_long = {a_obj = "a_os"}
end
if WacMenu._data.replace_deaglel6b == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_b_modern.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_b_modern.unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_b_standard"
end
if WacMenu._data.replace_deagleergogrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_g_ergo.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_g_bling"
	tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_g_ergo.unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_g_bling"
elseif WacMenu._data.replace_deagleergogrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_g_ergo.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_g_ergo.unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_g_standard"
end
if WacMenu._data.replace_deagleblinggrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_g_bling.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_g_ergo"
	tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_g_bling.unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_g_ergo"
elseif WacMenu._data.replace_deagleblinggrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_g_bling.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_g_bling.unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_g_standard"
end
if WacMenu._data.replace_deagleextmag == true then
	tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_m_extended.third_unit = "units/payday2/weapons/wpn_third_pis_deagle_pts/wpn_third_pis_deagle_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_deagle_m_extended.unit = "units/payday2/weapons/wpn_fps_pis_deagle_pts/wpn_fps_pis_deagle_m_standard"
end
if WacMenu._data.replace_fsnitrideb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_lemming_b_nitride.third_unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming_pts/wpn_third_pis_lemming_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_lemming_b_nitride.unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming_pts/wpn_fps_pis_lemming_b_standard"
end
if WacMenu._data.replace_fsextmag == true then
	tweak_data.weapon.factory.parts.wpn_fps_pis_lemming_m_ext.third_unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming_pts/wpn_third_pis_lemming_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_lemming_m_ext.unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming_pts/wpn_fps_pis_lemming_m_standard"
end
if WacMenu._data.replace_glockcomp2 == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_co_comp_2.third_unit = "units/payday2/weapons/wpn_third_pis_g18c_pts/wpn_third_pis_g18c_co_1"
	tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_co_comp_2.unit = "units/payday2/weapons/wpn_fps_pis_g18c_pts/wpn_fps_pis_g18c_co_1"
elseif WacMenu._data.replace_glockcomp2 == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_co_comp_2.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_pis_ns_flash"
	tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_co_comp_2.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_pis_ns_flash"
elseif WacMenu._data.replace_glockcomp2 == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_co_comp_2.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_third_upg_ns_pis_meatgrinder/wpn_third_upg_ns_pis_meatgrinder"
	tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_co_comp_2.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_meatgrinder/wpn_fps_upg_ns_pis_meatgrinder"
end
if WacMenu._data.replace_glockextmag == true then
	tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_m_mag_33rnd.third_unit = "units/payday2/weapons/wpn_third_pis_g18c_pts/wpn_third_pis_g18c_m_mag_17rnd"
	tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_m_mag_33rnd.unit = "units/payday2/weapons/wpn_fps_pis_g18c_pts/wpn_fps_pis_g18c_m_mag_17rnd"
end
if WacMenu._data.replace_g18c_glr440 == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_s_stock.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_s_stock.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_g22clong == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_g22c_b_long.third_unit = "units/payday2/weapons/wpn_third_pis_g22c_pts/wpn_third_pis_g22c_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_g22c_b_long.unit = "units/payday2/weapons/wpn_fps_pis_g22c_pts/wpn_fps_pis_g22c_b_standard"
end
if WacMenu._data.replace_g26bodytan == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_g26_body_custom.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_third_pis_g26_pts/wpn_third_pis_g26_body_stardard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_g26_body_custom.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_pis_g26_pts/wpn_fps_pis_g26_body_stardard"
end
if WacMenu._data.replace_g26magtan == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_g26_m_contour.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_third_pis_g26_pts/wpn_third_pis_g26_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_g26_m_contour.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_pis_g26_pts/wpn_fps_pis_g26_m_standard"
elseif WacMenu._data.replace_g26magtan == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_g26_m_contour.third_unit = "units/payday2/weapons/wpn_third_pis_g18c_pts/wpn_third_pis_g18c_m_mag_17rnd"
	tweak_data.weapon.factory.parts.wpn_fps_pis_g26_m_contour.unit = "units/payday2/weapons/wpn_fps_pis_g18c_pts/wpn_fps_pis_g18c_m_mag_17rnd"
end
if WacMenu._data.replace_g26slidetan == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_g26_b_custom.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_third_pis_g26_pts/wpn_third_pis_g26_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_g26_b_custom.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_pis_g26_pts/wpn_fps_pis_g26_b_standard"
end
if WacMenu._data.replace_hs2kextmag == true then
	tweak_data.weapon.factory.parts.wpn_fps_pis_hs2000_m_extended.third_unit = "units/pd2_dlc_the_bomb/weapons/wpn_fps_pis_hs2000_pts/wpn_third_pis_hs2000_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_hs2000_m_extended.unit = "units/pd2_dlc_the_bomb/weapons/wpn_fps_pis_hs2000_pts/wpn_fps_pis_hs2000_m_standard"
end
if WacMenu._data.replace_hs2kcustom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_hs2000_sl_custom.third_unit = "units/pd2_dlc_the_bomb/weapons/wpn_fps_pis_hs2000_pts/wpn_third_pis_hs2000_sl_long"
	tweak_data.weapon.factory.parts.wpn_fps_pis_hs2000_sl_custom.unit = "units/pd2_dlc_the_bomb/weapons/wpn_fps_pis_hs2000_pts/wpn_fps_pis_hs2000_sl_long"
elseif WacMenu._data.replace_hs2kcustom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_hs2000_sl_custom.third_unit = "units/pd2_dlc_the_bomb/weapons/wpn_fps_pis_hs2000_pts/wpn_third_pis_hs2000_sl_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_hs2000_sl_custom.unit = "units/pd2_dlc_the_bomb/weapons/wpn_fps_pis_hs2000_pts/wpn_fps_pis_hs2000_sl_standard"
end
if WacMenu._data.replace_hs2klong == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_hs2000_sl_long.third_unit = "units/pd2_dlc_the_bomb/weapons/wpn_fps_pis_hs2000_pts/wpn_third_pis_hs2000_sl_custom"
	tweak_data.weapon.factory.parts.wpn_fps_pis_hs2000_sl_long.unit = "units/pd2_dlc_the_bomb/weapons/wpn_fps_pis_hs2000_pts/wpn_fps_pis_hs2000_sl_custom"
elseif WacMenu._data.replace_hs2klong == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_hs2000_sl_long.third_unit = "units/pd2_dlc_the_bomb/weapons/wpn_fps_pis_hs2000_pts/wpn_third_pis_hs2000_sl_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_hs2000_sl_long.unit = "units/pd2_dlc_the_bomb/weapons/wpn_fps_pis_hs2000_pts/wpn_fps_pis_hs2000_sl_standard"
end
if WacMenu._data.replace_jericho941grip == 2 and WacMenu._data.replace_jericho941body == 1 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_sparrow_g_cowboy.third_unit = "units/pd2_dlc_rip/weapons/wpn_third_pis_sparrow_pts/wpn_third_pis_sparrow_g_941"
	tweak_data.weapon.factory.parts.wpn_fps_pis_sparrow_g_cowboy.unit = "units/pd2_dlc_rip/weapons/wpn_fps_pis_sparrow_pts/wpn_fps_pis_sparrow_g_941"
elseif WacMenu._data.replace_jericho941grip == 2 and WacMenu._data.replace_jericho941body == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_sparrow_g_cowboy.third_unit = "units/pd2_dlc_rip/weapons/wpn_fps_pis_sparrow_pts/wpn_fps_pis_sparrow_g_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_pis_sparrow_g_cowboy.unit = "units/pd2_dlc_rip/weapons/wpn_fps_pis_sparrow_pts/wpn_fps_pis_sparrow_g_dummy"
end
if WacMenu._data.replace_jericho941body == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_sparrow_body_941.third_unit = "units/pd2_dlc_rip/weapons/wpn_third_pis_sparrow_pts/wpn_third_pis_sparrow_body_rpl"
	tweak_data.weapon.factory.parts.wpn_fps_pis_sparrow_body_941.unit = "units/pd2_dlc_rip/weapons/wpn_fps_pis_sparrow_pts/wpn_fps_pis_sparrow_body_rpl"
	tweak_data.weapon.factory.parts.wpn_fps_pis_sparrow_body_941.override = deep_clone(tweak_data.weapon.factory.parts.wpn_fps_pis_sparrow_body_rpl.override)
end
if WacMenu._data.replace_lugerp08_reinforcedb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_breech_b_reinforced.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_third_pis_breech_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_breech_b_reinforced.unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_fps_pis_breech_b_standard"
end
if WacMenu._data.replace_lugerp08_shortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_breech_b_short.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_third_pis_breech_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_breech_b_short.unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech_pts/wpn_fps_pis_breech_b_standard"
end
if WacMenu._data.replace_m2006shortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_2006m_b_short.third_unit = "units/pd2_dlc_arena/weapons/wpn_third_pis_2006m_pts/wpn_third_pis_2006m_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_2006m_b_short.unit = "units/pd2_dlc_arena/weapons/wpn_fps_pis_2006m_pts/wpn_fps_pis_2006m_b_standard"
elseif WacMenu._data.replace_m2006shortb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_2006m_b_short.third_unit = "units/pd2_dlc_arena/weapons/wpn_third_pis_2006m_pts/wpn_third_pis_2006m_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_pis_2006m_b_short.unit = "units/pd2_dlc_arena/weapons/wpn_fps_pis_2006m_pts/wpn_fps_pis_2006m_b_long"
end
if WacMenu._data.replace_m2006mediumb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_2006m_b_medium.third_unit = "units/pd2_dlc_arena/weapons/wpn_third_pis_2006m_pts/wpn_third_pis_2006m_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_2006m_b_medium.unit = "units/pd2_dlc_arena/weapons/wpn_fps_pis_2006m_pts/wpn_fps_pis_2006m_b_standard"
elseif WacMenu._data.replace_m2006mediumb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_2006m_b_medium.third_unit = "units/pd2_dlc_arena/weapons/wpn_third_pis_2006m_pts/wpn_third_pis_2006m_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_pis_2006m_b_medium.unit = "units/pd2_dlc_arena/weapons/wpn_fps_pis_2006m_pts/wpn_fps_pis_2006m_b_long"
end
if WacMenu._data.replace_m2006longb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_2006m_b_long.third_unit = "units/pd2_dlc_arena/weapons/wpn_third_pis_2006m_pts/wpn_third_pis_2006m_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_2006m_b_long.unit = "units/pd2_dlc_arena/weapons/wpn_fps_pis_2006m_pts/wpn_fps_pis_2006m_b_standard"
end
if WacMenu._data.replace_m2006blinggrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_2006m_g_bling.third_unit = "units/pd2_dlc_arena/weapons/wpn_third_pis_2006m_pts/wpn_third_pis_2006m_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_2006m_g_bling.unit = "units/pd2_dlc_arena/weapons/wpn_fps_pis_2006m_pts/wpn_fps_pis_2006m_g_standard"
end
if WacMenu._data.replace_p7threadb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_legacy_b_threaded.third_unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_third_pis_legacy_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_legacy_b_threaded.unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_fps_pis_legacy_b_standard"
end
if WacMenu._data.replace_p7gripwood == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_legacy_g_wood.third_unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_third_pis_legacy_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_legacy_g_wood.unit = "units/pd2_dlc_khp/weapons/wpn_fps_pis_legacy_pts/wpn_fps_pis_legacy_g_standard"
end
if WacMenu._data.replace_p30lextmag == true then
	tweak_data.weapon.factory.parts.wpn_fps_pis_packrat_m_extended.third_unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_third_pis_packrat_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_packrat_m_extended.unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_fps_pis_packrat_m_standard"
end
if WacMenu._data.replace_p30lfibersights == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_packrat_o_expert.third_unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_third_pis_packrat_o_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_packrat_o_expert.unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_fps_pis_packrat_o_standard"
end
if WacMenu._data.replace_p226rcomp2 == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_co_comp_2.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_pis_ns_flash"
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_co_comp_2.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_pis_ns_flash"
elseif WacMenu._data.replace_p226rcomp2 == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_co_comp_2.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_third_upg_ns_pis_meatgrinder/wpn_third_upg_ns_pis_meatgrinder"
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_co_comp_2.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_meatgrinder/wpn_fps_upg_ns_pis_meatgrinder"
end
if WacMenu._data.replace_p226rergogrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_g_ergo.third_unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_third_pis_p226_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_g_ergo.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_fps_pis_p226_g_standard"
end
if WacMenu._data.replace_p226extmag == true then
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_m_extended.third_unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_third_pis_p226_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_m_extended.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_fps_pis_p226_m_standard"
end
if WacMenu._data.replace_p226requinox == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_equinox.adds = {"wpn_fps_pis_p226_b_barrel_long","wpn_fps_pis_p226_o_long"}
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_equinox.forbids = {"wpn_fps_pis_p226_o_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_equinox.third_unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_third_pis_p226_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_equinox.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_fps_pis_p226_b_long"
elseif WacMenu._data.replace_p226requinox == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_equinox.adds = {"wpn_fps_pis_p226_b_barrel_standard","wpn_fps_pis_p226_o_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_equinox.forbids = {"wpn_fps_pis_p226_o_long"}
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_equinox.third_unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_third_pis_p226_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_equinox.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_fps_pis_p226_b_standard"
end
if WacMenu._data.replace_p226rlong == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_long.adds = {"wpn_fps_pis_p226_b_barrel_equinox","wpn_fps_pis_p226_o_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_long.forbids = {"wpn_fps_pis_p226_o_long"}
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_long.third_unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_third_pis_p226_b_equinox"
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_long.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_fps_pis_p226_b_equinox"
elseif WacMenu._data.replace_p226rlong == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_long.adds = {"wpn_fps_pis_p226_b_barrel_standard","wpn_fps_pis_p226_o_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_long.forbids = {"wpn_fps_pis_p226_o_long"}
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_long.third_unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_third_pis_p226_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_p226_b_long.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_pis_p226_pts/wpn_fps_pis_p226_b_standard"
end
if WacMenu._data.replace_pl14protob == 2 and not WacMenu._data.replace_hidebarrelextpis then
	tweak_data.weapon.factory.parts.wpn_fps_pis_pl14_b_comp.override = {
		wpn_fps_upg_pis_ns_flash = {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"},
		wpn_fps_upg_ns_pis_ipsccomp = {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"},
		wpn_fps_upg_ns_pis_meatgrinder = {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}
	}
end
if WacMenu._data.replace_pl14protob == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_pl14_b_comp.third_unit = "units/pd2_dlc_mad/weapons/wpn_third_pis_pl14_pts/wpn_third_pis_pl14_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_pl14_b_comp.unit = "units/pd2_dlc_mad/weapons/wpn_fps_pis_pl14_pts/wpn_fps_pis_pl14_b_standard"
end
if WacMenu._data.replace_pl14extmag == true then
	tweak_data.weapon.factory.parts.wpn_fps_pis_pl14_m_extended.third_unit = "units/pd2_dlc_mad/weapons/wpn_third_pis_pl14_pts/wpn_third_pis_pl14_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_pl14_m_extended.unit = "units/pd2_dlc_mad/weapons/wpn_fps_pis_pl14_pts/wpn_fps_pis_pl14_m_standard"
end
if WacMenu._data.replace_ragingstndb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_standard.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_standard.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_short"
elseif WacMenu._data.replace_ragingcomp2 == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_standard.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_comp1"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_standard.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_comp1"
elseif WacMenu._data.replace_ragingcomp2 == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_standard.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_standard.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_long"
elseif WacMenu._data.replace_ragingcomp2 == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_standard.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_comp2"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_standard.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_comp2"
end
if WacMenu._data.replace_ragingcomp1 == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp1.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp1.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_short"
elseif WacMenu._data.replace_ragingcomp1 == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp1.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_comp2"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp1.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_comp2"
elseif WacMenu._data.replace_ragingcomp1 == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp1.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp1.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_long"
elseif WacMenu._data.replace_ragingcomp1 == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp1.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp1.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_standard"
end
if WacMenu._data.replace_ragingshort == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_short.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_comp1"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_short.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_comp1"
elseif WacMenu._data.replace_ragingshort == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_short.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_comp2"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_short.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_comp2"
elseif WacMenu._data.replace_ragingshort == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_short.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_short.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_long"
elseif WacMenu._data.replace_ragingshort == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_short.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_short.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_standard"
end
if WacMenu._data.replace_ragingcomp2 == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp2.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp2.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_short"
elseif WacMenu._data.replace_ragingcomp2 == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp2.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_comp1"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp2.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_comp1"
elseif WacMenu._data.replace_ragingcomp2 == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp2.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp2.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_long"
elseif WacMenu._data.replace_ragingcomp2 == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp2.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_comp2.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_standard"
end
if WacMenu._data.replace_raginglong == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_long.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_long.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_short"
elseif WacMenu._data.replace_raginglong == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_long.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_comp2"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_long.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_comp2"
elseif WacMenu._data.replace_raginglong == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_long.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_comp1"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_long.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_comp1"
elseif WacMenu._data.replace_raginglong == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_long.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_b_long.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_b_standard"
end
if WacMenu._data.replace_rageergogrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_g_ergo.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_g_ergo.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_g_standard"
end
if WacMenu._data.replace_rageslim == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_body_smooth.third_unit = "units/payday2/weapons/wpn_third_pis_rage_pts/wpn_third_pis_rage_body_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_rage_body_smooth.unit = "units/payday2/weapons/wpn_fps_pis_rage_pts/wpn_fps_pis_rage_body_standard"
end
if WacMenu._data.replace_swm29_devilb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_chinchilla_b_satan.third_unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_third_pis_chinchilla_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_chinchilla_b_satan.unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_fps_pis_chinchilla_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_chinchilla_b_satan.stance_mod = nil
end
if WacMenu._data.replace_swm29_blackgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_chinchilla_g_black.third_unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_third_pis_chinchilla_g_death"
	tweak_data.weapon.factory.parts.wpn_fps_pis_chinchilla_g_black.unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_fps_pis_chinchilla_g_death"
elseif WacMenu._data.replace_swm29_blackgrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_chinchilla_g_black.third_unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_third_pis_chinchilla_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_chinchilla_g_black.unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_fps_pis_chinchilla_g_standard"
end
if WacMenu._data.replace_swm29_ripgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_chinchilla_g_death.third_unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_third_pis_chinchilla_g_black"
	tweak_data.weapon.factory.parts.wpn_fps_pis_chinchilla_g_death.unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_fps_pis_chinchilla_g_black"
elseif WacMenu._data.replace_swm29_ripgrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_chinchilla_g_death.third_unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_third_pis_chinchilla_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_chinchilla_g_death.unit = "units/pd2_dlc_max/weapons/wpn_fps_pis_chinchilla_pts/wpn_fps_pis_chinchilla_g_standard"
end
if WacMenu._data.replace_uspcomp2 == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_usp_co_comp_2.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_pis_ns_flash"
	tweak_data.weapon.factory.parts.wpn_fps_pis_usp_co_comp_2.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_pis_ns_flash"
elseif WacMenu._data.replace_uspcomp2 == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_usp_co_comp_2.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_third_upg_ns_pis_meatgrinder/wpn_third_upg_ns_pis_meatgrinder"
	tweak_data.weapon.factory.parts.wpn_fps_pis_usp_co_comp_2.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_meatgrinder/wpn_fps_upg_ns_pis_meatgrinder"
end
if WacMenu._data.replace_uspextmag == true then
	tweak_data.weapon.factory.parts.wpn_fps_pis_usp_m_extended.third_unit = "units/payday2/weapons/wpn_third_pis_usp_pts/wpn_third_pis_usp_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_usp_m_extended.unit = "units/payday2/weapons/wpn_fps_pis_usp_pts/wpn_fps_pis_usp_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_usp_m_big.third_unit = "units/payday2/weapons/wpn_third_pis_usp_pts/wpn_third_pis_usp_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_usp_m_big.unit = "units/payday2/weapons/wpn_fps_pis_usp_pts/wpn_fps_pis_usp_m_standard"
end
if WacMenu._data.replace_uspexpert == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_usp_b_expert.third_unit = "units/payday2/weapons/wpn_third_pis_usp_pts/wpn_third_pis_usp_b_match"
	tweak_data.weapon.factory.parts.wpn_fps_pis_usp_b_expert.unit = "units/payday2/weapons/wpn_fps_pis_usp_pts/wpn_fps_pis_usp_b_match"
elseif WacMenu._data.replace_uspexpert == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_usp_b_expert.third_unit = "units/payday2/weapons/wpn_third_pis_usp_pts/wpn_third_pis_usp_b_tactical"
	tweak_data.weapon.factory.parts.wpn_fps_pis_usp_b_expert.unit = "units/payday2/weapons/wpn_fps_pis_usp_pts/wpn_fps_pis_usp_b_tactical"
end
if WacMenu._data.replace_uspmatch == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_usp_b_match.third_unit = "units/payday2/weapons/wpn_third_pis_usp_pts/wpn_third_pis_usp_b_expert"
	tweak_data.weapon.factory.parts.wpn_fps_pis_usp_b_match.unit = "units/payday2/weapons/wpn_fps_pis_usp_pts/wpn_fps_pis_usp_b_expert"
elseif WacMenu._data.replace_uspmatch == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_usp_b_match.third_unit = "units/payday2/weapons/wpn_third_pis_usp_pts/wpn_third_pis_usp_b_tactical"
	tweak_data.weapon.factory.parts.wpn_fps_pis_usp_b_match.unit = "units/payday2/weapons/wpn_fps_pis_usp_pts/wpn_fps_pis_usp_b_tactical"
end
if WacMenu._data.replace_walterpplasergrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_ppk_g_laser.unit = "units/pd2_dlc1/weapons/wpn_fps_pis_ppk_pts/wpn_fps_pis_ppk_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_ppk_g_laser.perks = nil
end
if WacMenu._data.replace_walterppslide == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_ppk_b_long.adds = {"wpn_fps_pis_ppk_b_barrel_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_pis_ppk_b_long.third_unit = "units/pd2_dlc1/weapons/wpn_third_pis_ppk_pts/wpn_third_pis_ppk_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_pis_ppk_b_long.unit = "units/pd2_dlc1/weapons/wpn_fps_pis_ppk_pts/wpn_fps_pis_ppk_b_standard"
end
-- Submachine Guns
if WacMenu._data.replace_akmsurail == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_akmsu_fg_rail.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_fg_zenit/wpn_third_upg_ak_fg_zenit"
	tweak_data.weapon.factory.parts.wpn_fps_smg_akmsu_fg_rail.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_fg_zenit/wpn_fps_upg_ak_fg_zenit"
elseif WacMenu._data.replace_akmsurail == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_akmsu_fg_rail.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_akmsu_fg_rail.third_unit = "units/payday2/weapons/wpn_third_smg_akmsu_pts/wpn_third_smg_akmsu_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_akmsu_fg_rail.unit = "units/payday2/weapons/wpn_fps_smg_akmsu_pts/wpn_fps_smg_akmsu_fg_standard"
end
if WacMenu._data.replace_akmsuzenit == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_zenit.third_unit = "units/payday2/weapons/wpn_third_smg_akmsu_pts/wpn_third_smg_akmsu_fg_rail"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_zenit.unit = "units/payday2/weapons/wpn_fps_smg_akmsu_pts/wpn_fps_smg_akmsu_fg_rail"
elseif WacMenu._data.replace_akmsuzenit == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_zenit.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_zenit.third_unit = "units/payday2/weapons/wpn_third_smg_akmsu_pts/wpn_third_smg_akmsu_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_zenit.unit = "units/payday2/weapons/wpn_fps_smg_akmsu_pts/wpn_fps_smg_akmsu_fg_standard"
end
if WacMenu._data.replace_m119receiver == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_cobray_body_lower.third_unit = "units/pd2_dlc_hotline2/weapons/wpn_fps_smg_cobray_pts/wpn_third_smg_cobray_body_lower_jacket"
	tweak_data.weapon.factory.parts.wpn_fps_smg_cobray_body_lower.unit = "units/pd2_dlc_hotline2/weapons/wpn_fps_smg_cobray_pts/wpn_fps_smg_cobray_body_lower_jacket"
	tweak_data.weapon.factory.parts.wpn_fps_smg_cobray_body_upper.third_unit = "units/pd2_dlc_hotline2/weapons/wpn_fps_smg_cobray_pts/wpn_third_smg_cobray_body_upper_jacket"
	tweak_data.weapon.factory.parts.wpn_fps_smg_cobray_body_upper.unit = "units/pd2_dlc_hotline2/weapons/wpn_fps_smg_cobray_pts/wpn_fps_smg_cobray_body_upper_jacket"
end
if WacMenu._data.replace_m11980s == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_cobray_body_upper_jacket.third_unit = "units/pd2_dlc_hotline2/weapons/wpn_fps_smg_cobray_pts/wpn_third_smg_cobray_body_upper"
	tweak_data.weapon.factory.parts.wpn_fps_smg_cobray_body_upper_jacket.unit = "units/pd2_dlc_hotline2/weapons/wpn_fps_smg_cobray_pts/wpn_fps_smg_cobray_body_upper"
	tweak_data.weapon.factory.parts.wpn_fps_smg_cobray_body_upper_jacket.override.wpn_fps_smg_cobray_body_lower = {unit = "units/pd2_dlc_hotline2/weapons/wpn_fps_smg_cobray_pts/wpn_fps_smg_cobray_body_lower",third_unit = "units/pd2_dlc_hotline2/weapons/wpn_fps_smg_cobray_pts/wpn_third_smg_cobray_body_lower_jacket"}
end
if WacMenu._data.replace_cz805stndb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_b_standard.third_unit = "units/pd2_dlc_born/weapons/wpn_third_smg_hajk_pts/wpn_third_smg_hajk_b_medium"
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_b_standard.unit = "units/pd2_dlc_born/weapons/wpn_fps_smg_hajk_pts/wpn_fps_smg_hajk_b_medium"
elseif WacMenu._data.replace_cz805stndb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_b_standard.third_unit = "units/pd2_dlc_born/weapons/wpn_third_smg_hajk_pts/wpn_third_smg_hajk_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_b_standard.unit = "units/pd2_dlc_born/weapons/wpn_fps_smg_hajk_pts/wpn_fps_smg_hajk_b_short"
end
if WacMenu._data.replace_cz805shortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_b_short.third_unit = "units/pd2_dlc_born/weapons/wpn_third_smg_hajk_pts/wpn_third_smg_hajk_b_medium"
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_b_short.unit = "units/pd2_dlc_born/weapons/wpn_fps_smg_hajk_pts/wpn_fps_smg_hajk_b_medium"
elseif WacMenu._data.replace_cz805shortb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_b_short.third_unit = "units/pd2_dlc_born/weapons/wpn_third_smg_hajk_pts/wpn_third_smg_hajk_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_b_short.unit = "units/pd2_dlc_born/weapons/wpn_fps_smg_hajk_pts/wpn_fps_smg_hajk_b_standard"
end
if WacMenu._data.replace_cz805medb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_b_medium.third_unit = "units/pd2_dlc_born/weapons/wpn_third_smg_hajk_pts/wpn_third_smg_hajk_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_b_medium.unit = "units/pd2_dlc_born/weapons/wpn_fps_smg_hajk_pts/wpn_fps_smg_hajk_b_short"
elseif WacMenu._data.replace_cz805medb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_b_medium.third_unit = "units/pd2_dlc_born/weapons/wpn_third_smg_hajk_pts/wpn_third_smg_hajk_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_b_medium.unit = "units/pd2_dlc_born/weapons/wpn_fps_smg_hajk_pts/wpn_fps_smg_hajk_b_standard"
end
if WacMenu._data.replace_cz805vertgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_vg_moe.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_stubby/wpn_third_upg_vg_ass_smg_stubby"
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_vg_moe.unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_stubby/wpn_fps_upg_vg_ass_smg_stubby"
elseif WacMenu._data.replace_cz805vertgrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_vg_moe.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_verticalgrip/wpn_third_upg_vg_ass_smg_verticalgrip"
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_vg_moe.unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_verticalgrip/wpn_fps_upg_vg_ass_smg_verticalgrip"
elseif WacMenu._data.replace_cz805vertgrip == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_vg_moe.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_afg/wpn_third_upg_vg_ass_smg_afg"
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_vg_moe.unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_afg/wpn_fps_upg_vg_ass_smg_afg"
elseif WacMenu._data.replace_cz805vertgrip == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_vg_moe.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_vg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_vg_moe.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_vg_standard"
elseif WacMenu._data.replace_cz805vertgrip == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_vg_moe.third_unit = "units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_third_smg_polymer_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_vg_moe.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_fps_smg_polymer_fg_standard"
elseif WacMenu._data.replace_cz805vertgrip == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_vg_moe.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_vg_surefire"
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_vg_moe.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_vg_surefire"
elseif WacMenu._data.replace_cz805vertgrip == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_vg_moe.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_vg_moe.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_cz805st == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_s_standard.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_s_standard.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
elseif WacMenu._data.replace_cz805st == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_s_standard.adds = {"wpn_fps_ass_s552_s_m4"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_s_standard.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_s_standard.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard"
elseif WacMenu._data.replace_cz805st == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_s_standard.adds = {"wpn_fps_ass_s552_s_m4"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_s_standard.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_third_upg_m4_s_crane"
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_s_standard.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_fps_upg_m4_s_crane"
elseif WacMenu._data.replace_cz805st == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_s_standard.adds = {"wpn_fps_ass_s552_s_m4"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_s_standard.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_s_ubr/wpn_third_upg_m4_s_ubr"
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_s_standard.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_s_ubr/wpn_fps_upg_m4_s_ubr"
elseif WacMenu._data.replace_cz805st == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_s_standard.adds = {"wpn_fps_ass_s552_s_m4"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_s_standard.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_s_vltor"
	tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_s_standard.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_s_vltor"
end
local k23bparts = {}
k23bparts.railedovr = "tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.override = {"
k23bparts.lr300ovr = "tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.override = {"
k23bparts.mediumb = " = {unit = \"units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_medium\",third_unit = \"units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_medium\"},"
k23bparts.longb = " = {unit = \"units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_long\",third_unit = \"units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_long\"},"
if WacMenu._data.replace_k23_m4a1sight == true then
k23bparts.m4a1sight = "wpn_fps_ass_m16_o_handle_sight = {unit = \"units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_o_flipup\",third_unit = \"units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_o_flipup\",stance_mod = {wpn_fps_smg_olympic = {translation = Vector3(0, -4, 0.475)}}} }"
k23bparts.m4a1sight_emo = "wpn_fps_ass_m16_o_handle_sight = {unit = \"units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_o_flipup_emo\",third_unit = \"units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_o_flipup_emo\",stance_mod = {wpn_fps_smg_olympic = {translation = Vector3(0, -4, 0.475)}}} }"
else
k23bparts.m4a1sight = "}"
k23bparts.m4a1sight_emo = "}"
end
k23bparts.string1 = "wpn_fps_m4_uupg_b_short_vanilla" .. k23bparts.mediumb .. "wpn_fps_m4_uupg_b_medium" .. k23bparts.mediumb
k23bparts.string2 = "wpn_fps_m4_uupg_b_short_vanilla" .. k23bparts.longb .. "wpn_fps_m4_uupg_b_medium" .. k23bparts.longb
if WacMenu._data.replace_k23railfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_smg_olympic_fg_lr300/wpn_third_upg_smg_olympic_fg_lr300"
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_smg_olympic_fg_lr300/wpn_fps_upg_smg_olympic_fg_lr300"
elseif WacMenu._data.replace_k23railfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.forbids = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.third_unit = "units/payday2/weapons/wpn_third_ass_amcar_pts/wpn_third_amcar_uupg_fg_amcar"
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_fg_amcar"
assert(loadstring(k23bparts.railedovr .. k23bparts.string1 .. "}"))()
elseif WacMenu._data.replace_k23railfg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.forbids = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_lr300"
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_lr300"
assert(loadstring(k23bparts.railedovr .. k23bparts.string1 .. k23bparts.m4a1sight))()
elseif WacMenu._data.replace_k23railfg == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.forbids = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_jp/wpn_third_upg_fg_jp"
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_jp/wpn_fps_upg_fg_jp"
assert(loadstring(k23bparts.railedovr .. k23bparts.string2 .. k23bparts.m4a1sight))()
elseif WacMenu._data.replace_k23railfg == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.forbids = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_smr/wpn_third_upg_fg_smr"
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_smr/wpn_fps_upg_fg_smr"
assert(loadstring(k23bparts.railedovr .. k23bparts.string2 .. k23bparts.m4a1sight))()
elseif WacMenu._data.replace_k23railfg == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.forbids = {"wpn_fps_ass_m16_os_frontsight", "wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_lvoa/wpn_third_upg_ass_m4_fg_lvoa"
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_lvoa/wpn_fps_upg_ass_m4_fg_lvoa"
assert(loadstring(k23bparts.railedovr .. k23bparts.string2 .. k23bparts.m4a1sight))()
elseif WacMenu._data.replace_k23railfg == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.forbids = {"wpn_fps_ass_m16_os_frontsight", "wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_moe/wpn_third_upg_ass_m4_fg_moe"
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_moe/wpn_fps_upg_ass_m4_fg_moe"
assert(loadstring(k23bparts.railedovr .. k23bparts.string1 .. k23bparts.m4a1sight_emo))()
elseif WacMenu._data.replace_k23railfg == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.forbids = {"wpn_fps_ass_m16_os_frontsight", "wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.adds = {"wpn_fps_m4_uupg_fg_rail_ext"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail"
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail"
assert(loadstring(k23bparts.railedovr .. k23bparts.string1 .. k23bparts.m4a1sight))()
elseif WacMenu._data.replace_k23railfg == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.forbids = {"wpn_fps_ass_m16_os_frontsight", "wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_fg_railed"
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_fg_railed"
assert(loadstring(k23bparts.railedovr .. k23bparts.string2 .. k23bparts.m4a1sight))()
elseif WacMenu._data.replace_k23railfg == 11 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.forbids = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m16_fg_stag/wpn_third_upg_ass_m16_fg_stag"
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m16_fg_stag/wpn_fps_upg_ass_m16_fg_stag"
assert(loadstring(k23bparts.railedovr .. k23bparts.string2 .. k23bparts.m4a1sight))()
elseif WacMenu._data.replace_k23railfg == 12 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.adds = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.third_unit = "units/payday2/weapons/wpn_third_smg_olympic_pts/wpn_third_smg_olympic_fg_olympic"
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_fg_railed.unit = "units/payday2/weapons/wpn_fps_smg_olympic_pts/wpn_fps_smg_olympic_fg_olympic"
end
if WacMenu._data.replace_k23afterfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.third_unit = "units/payday2/weapons/wpn_third_smg_olympic_pts/wpn_third_smg_olympic_fg_railed"
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.unit = "units/payday2/weapons/wpn_fps_smg_olympic_pts/wpn_fps_smg_olympic_fg_railed"
elseif WacMenu._data.replace_k23afterfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.forbids = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.third_unit = "units/payday2/weapons/wpn_third_ass_amcar_pts/wpn_third_amcar_uupg_fg_amcar"
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_fg_amcar"
assert(loadstring(k23bparts.lr300ovr .. k23bparts.string1 .. "}"))()
elseif WacMenu._data.replace_k23afterfg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.forbids = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_lr300"
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_lr300"
assert(loadstring(k23bparts.lr300ovr .. k23bparts.string1 .. k23bparts.m4a1sight))()
elseif WacMenu._data.replace_k23afterfg == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.forbids = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_jp/wpn_third_upg_fg_jp"
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_jp/wpn_fps_upg_fg_jp"
assert(loadstring(k23bparts.lr300ovr .. k23bparts.string2 .. k23bparts.m4a1sight))()
elseif WacMenu._data.replace_k23afterfg == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.forbids = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_smr/wpn_third_upg_fg_smr"
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_smr/wpn_fps_upg_fg_smr"
assert(loadstring(k23bparts.lr300ovr .. k23bparts.string2 .. k23bparts.m4a1sight))()
elseif WacMenu._data.replace_k23afterfg == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.forbids = {"wpn_fps_ass_m16_os_frontsight", "wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_lvoa/wpn_third_upg_ass_m4_fg_lvoa"
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_lvoa/wpn_fps_upg_ass_m4_fg_lvoa"
assert(loadstring(k23bparts.lr300ovr .. k23bparts.string2 .. k23bparts.m4a1sight))()
elseif WacMenu._data.replace_k23afterfg == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.forbids = {"wpn_fps_ass_m16_os_frontsight", "wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_fg_moe/wpn_third_upg_ass_m4_fg_moe"
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_fg_moe/wpn_fps_upg_ass_m4_fg_moe"
assert(loadstring(k23bparts.lr300ovr .. k23bparts.string1 .. k23bparts.m4a1sight_emo))()
elseif WacMenu._data.replace_k23afterfg == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.forbids = {"wpn_fps_ass_m16_os_frontsight", "wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.adds = {"wpn_fps_m4_uupg_fg_rail_ext"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail"
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail"
assert(loadstring(k23bparts.lr300ovr .. k23bparts.string1 .. k23bparts.m4a1sight))()
elseif WacMenu._data.replace_k23afterfg == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.forbids = {"wpn_fps_ass_m16_os_frontsight", "wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_fg_railed"
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_fg_railed"
assert(loadstring(k23bparts.lr300ovr .. k23bparts.string2 .. k23bparts.m4a1sight))()
elseif WacMenu._data.replace_k23afterfg == 11 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.forbids = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m16_fg_stag/wpn_third_upg_ass_m16_fg_stag"
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m16_fg_stag/wpn_fps_upg_ass_m16_fg_stag"
assert(loadstring(k23bparts.lr300ovr .. k23bparts.string2 .. k23bparts.m4a1sight))()
elseif WacMenu._data.replace_k23afterfg == 12 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.adds = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.third_unit = "units/payday2/weapons/wpn_third_smg_olympic_pts/wpn_third_smg_olympic_fg_olympic"
	tweak_data.weapon.factory.parts.wpn_fps_upg_smg_olympic_fg_lr300.unit = "units/payday2/weapons/wpn_fps_smg_olympic_pts/wpn_fps_smg_olympic_fg_olympic"
end
if WacMenu._data.replace_k23x_st == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_s_short_vanilla.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_s_short_vanilla.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
elseif WacMenu._data.replace_k23x_st == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_s_short_vanilla.third_unit = "units/payday2/weapons/wpn_third_smg_olympic_pts/wpn_third_smg_olympic_s_short"
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_s_short_vanilla.unit = "units/payday2/weapons/wpn_fps_smg_olympic_pts/wpn_fps_smg_olympic_s_adjust"
elseif WacMenu._data.replace_k23x_st == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_s_short_vanilla.adds = {"wpn_fps_upg_m4_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_s_short_vanilla.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_s_short_vanilla.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard"
elseif WacMenu._data.replace_k23x_st == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_s_short_vanilla.third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_s_solid"
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_s_short_vanilla.unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_s_solid"
elseif WacMenu._data.replace_k23x_st == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_s_short_vanilla.adds = {"wpn_fps_upg_m4_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_s_short_vanilla.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_s_ubr/wpn_third_upg_m4_s_ubr"
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_s_short_vanilla.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_s_ubr/wpn_fps_upg_m4_s_ubr"
elseif WacMenu._data.replace_k23x_st == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_s_short_vanilla.adds = {"wpn_fps_upg_m4_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_s_short_vanilla.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_s_vltor"
	tweak_data.weapon.factory.parts.wpn_fps_smg_olympic_s_short_vanilla.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_s_vltor"
end
if WacMenu._data.replace_l2a1longb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_b_long.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_smg_sterling_pts/wpn_third_smg_sterling_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_b_long.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_smg_sterling_pts/wpn_fps_smg_sterling_b_standard"
elseif WacMenu._data.replace_l2a1longb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_b_long.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_smg_sterling_pts/wpn_third_smg_sterling_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_b_long.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_smg_sterling_pts/wpn_fps_smg_sterling_b_short"
end
if WacMenu._data.replace_l2a1shortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_b_short.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_smg_sterling_pts/wpn_third_smg_sterling_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_b_short.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_smg_sterling_pts/wpn_fps_smg_sterling_b_standard"
elseif WacMenu._data.replace_l2a1shortb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_b_short.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_smg_sterling_pts/wpn_third_smg_sterling_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_b_short.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_smg_sterling_pts/wpn_fps_smg_sterling_b_long"
end
if WacMenu._data.replace_l2a1extmag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_m_long.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_smg_sterling_pts/wpn_third_smg_sterling_m_medium"
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_m_long.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_smg_sterling_pts/wpn_fps_smg_sterling_m_medium"
end
if WacMenu._data.replace_l2a1smallmag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_m_short.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_smg_sterling_pts/wpn_third_smg_sterling_m_medium"
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_m_short.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_smg_sterling_pts/wpn_fps_smg_sterling_m_medium"
end
if WacMenu._data.replace_l2a1solidstock == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_s_solid.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_smg_sterling_pts/wpn_third_smg_sterling_s_folded"
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_s_solid.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_smg_sterling_pts/wpn_fps_smg_sterling_s_folded"
elseif WacMenu._data.replace_l2a1solidstock == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_s_solid.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_smg_sterling_pts/wpn_third_smg_sterling_s_nostock"
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_s_solid.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_smg_sterling_pts/wpn_fps_smg_sterling_s_nostock"
elseif WacMenu._data.replace_l2a1solidstock == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_s_solid.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_smg_sterling_pts/wpn_third_smg_sterling_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_s_solid.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_smg_sterling_pts/wpn_fps_smg_sterling_s_standard"
end
if WacMenu._data.replace_l2a1x_st == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_s_folded_vanilla.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_smg_sterling_pts/wpn_third_smg_sterling_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_s_folded_vanilla.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_smg_sterling_pts/wpn_fps_smg_sterling_s_standard"
elseif WacMenu._data.replace_l2a1x_st == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_s_folded_vanilla.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_smg_sterling_pts/wpn_third_smg_sterling_s_nostock"
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_s_folded_vanilla.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_smg_sterling_pts/wpn_fps_smg_sterling_s_nostock"
elseif WacMenu._data.replace_l2a1x_st == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_s_folded_vanilla.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_smg_sterling_pts/wpn_third_smg_sterling_s_solid"
	tweak_data.weapon.factory.parts.wpn_fps_smg_sterling_s_folded_vanilla.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_smg_sterling_pts/wpn_fps_smg_sterling_s_solid"
end
if WacMenu._data.replace_m45ergogrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_g_ergo.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_g_bling"
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_g_ergo.unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_g_bling"
elseif WacMenu._data.replace_m45ergogrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_g_ergo.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_g_ergo.unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_g_standard"
end
if WacMenu._data.replace_m45extmag == true then
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_m_extended.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_m_mag"
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_m_extended.unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_m_mag"
end
if WacMenu._data.replace_m45stndst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_s_standard.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_s_folded"
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_s_standard.unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_s_folded"
elseif WacMenu._data.replace_m45stndst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_s_standard.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_s_standard.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_m45foldst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_s_folded.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_s_folded.unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_s_standard"
elseif WacMenu._data.replace_m45foldst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_s_folded.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_s_folded.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_m45x_st == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_s_folded_vanilla.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_s_folded_vanilla.unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_s_standard"
elseif WacMenu._data.replace_m45stndst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_s_folded_vanilla.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_s_folded_vanilla.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_hidem45bparts == true then
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_b_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_b_green.unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_body_green.third_unit = "units/pd2_dlc1/weapons/wpn_third_smg_m45_pts/wpn_third_smg_m45_body_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_m45_body_green.unit = "units/pd2_dlc1/weapons/wpn_fps_smg_m45_pts/wpn_fps_smg_m45_body_standard"
end
if WacMenu._data.replace_m1928a1longb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_barrel_long.third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_barrel"
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_barrel_long.unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_barrel"
elseif WacMenu._data.replace_m1928a1longb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_barrel_long.override = deep_clone(tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_barrel_short.override)
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_barrel_long.third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_barrel_short"
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_barrel_long.unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_barrel_short"
end
if WacMenu._data.replace_m1928a1fg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_foregrip.third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_foregrip_discrete"
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_foregrip.unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_foregrip_discrete"
end
if WacMenu._data.replace_m1928a1blackfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_foregrip_discrete.third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_foregrip"
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_foregrip_discrete.unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_foregrip"
end
if WacMenu._data.replace_m1928a1grip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_grip.third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_grip_discrete"
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_grip.unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_grip_discrete"
end
if WacMenu._data.replace_m1928a1blackgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_grip_discrete.third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_grip"
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_grip_discrete.unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_grip"
end
if WacMenu._data.replace_m1928a1st == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_stock.third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_stock_nostock"
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_stock.unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_stock_nostock"
elseif WacMenu._data.replace_m1928a1st == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_stock.third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_stock_discrete"
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_stock.unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_stock_discrete"
end
if WacMenu._data.replace_m1928a1blackst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_stock_discrete.third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_stock"
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_stock_discrete.unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_stock"
end
if WacMenu._data.replace_m1928a1slingst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_stock_nostock.third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_stock"
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_stock_nostock.unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_stock"
end
if WacMenu._data.replace_m1928a1x_st == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_stock_nostock_vanilla.third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_stock"
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_stock_nostock_vanilla.unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_stock"
elseif WacMenu._data.replace_m1928a1x_st == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_stock_nostock_vanilla.third_unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_stock_discrete"
	tweak_data.weapon.factory.parts.wpn_fps_smg_thompson_stock_nostock_vanilla.unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_stock_discrete"
end
if WacMenu._data.replace_mac10riskit == true then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_body_ris.third_unit = "units/payday2/weapons/wpn_third_smg_mac10_pts/wpn_third_smg_mac10_body_mac10"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_body_ris.unit = "units/payday2/weapons/wpn_fps_smg_mac10_pts/wpn_fps_smg_mac10_body_mac10"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_body_ris.adds = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_body_ris.stance_mod = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_body_ris.forbids = nil
end
if WacMenu._data.replace_mac10extmag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_m_extended.third_unit = "units/payday2/weapons/wpn_third_smg_mac10_pts/wpn_third_smg_mac10_m_short"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_m_extended.unit = "units/payday2/weapons/wpn_fps_smg_mac10_pts/wpn_fps_smg_mac10_m_short"
end
if WacMenu._data.replace_mac10magpulassist == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_m_quick.third_unit = "units/payday2/weapons/wpn_third_smg_mac10_pts/wpn_third_smg_mac10_m_extended"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_m_quick.unit = "units/payday2/weapons/wpn_fps_smg_mac10_pts/wpn_fps_smg_mac10_m_extended"
elseif WacMenu._data.replace_mac10magpulassist == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_m_quick.third_unit = "units/payday2/weapons/wpn_third_smg_mac10_pts/wpn_third_smg_mac10_m_short"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_m_quick.unit = "units/payday2/weapons/wpn_fps_smg_mac10_pts/wpn_fps_smg_mac10_m_short"
end
if WacMenu._data.replace_mac10_stndst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
elseif WacMenu._data.replace_mac10_stndst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard"
elseif WacMenu._data.replace_mac10_stndst == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_third_upg_m4_s_crane"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_fps_upg_m4_s_crane"
elseif WacMenu._data.replace_mac10_stndst == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_s_ubr/wpn_third_upg_m4_s_ubr"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_s_ubr/wpn_fps_upg_m4_s_ubr"
elseif WacMenu._data.replace_mac10_stndst == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_s_vltor"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_fold.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_s_vltor"
end
if WacMenu._data.replace_mac10skelst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.third_unit = "units/payday2/weapons/wpn_third_smg_mac10_pts/wpn_third_smg_mac10_s_fold"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.unit = "units/payday2/weapons/wpn_fps_smg_mac10_pts/wpn_fps_smg_mac10_s_fold"
elseif WacMenu._data.replace_mac10skelst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
elseif WacMenu._data.replace_mac10skelst == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard"
elseif WacMenu._data.replace_mac10skelst == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_third_upg_m4_s_crane"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_fps_upg_m4_s_crane"
elseif WacMenu._data.replace_mac10skelst == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_s_ubr/wpn_third_upg_m4_s_ubr"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_s_ubr/wpn_fps_upg_m4_s_ubr"
elseif WacMenu._data.replace_mac10skelst == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.adds = {"wpn_upg_ak_s_adapter"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.forbids = {"wpn_upg_ak_g_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_s_vltor"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mac10_s_skel.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_s_vltor"
end
if WacMenu._data.replace_microuzicomp == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_b_comp.third_unit = "units/pd2_dlc_dragon/weapons/wpn_third_smg_baka_pts/wpn_third_smg_baka_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_b_comp.unit = "units/pd2_dlc_dragon/weapons/wpn_fps_smg_baka_pts/wpn_fps_smg_baka_b_standard"
end
if WacMenu._data.replace_muzismallsupp == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_b_smallsupp.third_unit = "units/pd2_dlc_dragon/weapons/wpn_third_smg_baka_pts/wpn_third_smg_baka_b_midsupp"
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_b_smallsupp.unit = "units/pd2_dlc_dragon/weapons/wpn_fps_smg_baka_pts/wpn_fps_smg_baka_b_midsupp"
elseif WacMenu._data.replace_muzismallsupp == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_b_smallsupp.third_unit = "units/pd2_dlc_dragon/weapons/wpn_third_smg_baka_pts/wpn_third_smg_baka_b_longsupp"
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_b_smallsupp.unit = "units/pd2_dlc_dragon/weapons/wpn_fps_smg_baka_pts/wpn_fps_smg_baka_b_longsupp"
end
if WacMenu._data.replace_muzilongsupp == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_b_longsupp.third_unit = "units/pd2_dlc_dragon/weapons/wpn_third_smg_baka_pts/wpn_third_smg_baka_b_midsupp"
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_b_longsupp.unit = "units/pd2_dlc_dragon/weapons/wpn_fps_smg_baka_pts/wpn_fps_smg_baka_b_midsupp"
elseif WacMenu._data.replace_muzilongsupp == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_b_longsupp.third_unit = "units/pd2_dlc_dragon/weapons/wpn_third_smg_baka_pts/wpn_third_smg_baka_b_smallsupp"
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_b_longsupp.unit = "units/pd2_dlc_dragon/weapons/wpn_fps_smg_baka_pts/wpn_fps_smg_baka_b_smallsupp"
end
if WacMenu._data.replace_microuzifoldedst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_s_folded.third_unit = "units/pd2_dlc_dragon/weapons/wpn_third_smg_baka_pts/wpn_third_smg_baka_s_unfolded"
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_s_folded.unit = "units/pd2_dlc_dragon/weapons/wpn_fps_smg_baka_pts/wpn_fps_smg_baka_s_unfolded"
elseif WacMenu._data.replace_microuzifoldedst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_s_folded.third_unit = "units/pd2_dlc_dragon/weapons/wpn_third_smg_baka_pts/wpn_third_smg_baka_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_s_folded.unit = "units/pd2_dlc_dragon/weapons/wpn_fps_smg_baka_pts/wpn_fps_smg_baka_s_standard"
end
if WacMenu._data.replace_microuzinost == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_s_standard.third_unit = "units/pd2_dlc_dragon/weapons/wpn_third_smg_baka_pts/wpn_third_smg_baka_s_unfolded"
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_s_standard.unit = "units/pd2_dlc_dragon/weapons/wpn_fps_smg_baka_pts/wpn_fps_smg_baka_s_unfolded"
elseif WacMenu._data.replace_microuzinost == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_s_standard.third_unit = "units/pd2_dlc_dragon/weapons/wpn_third_smg_baka_pts/wpn_third_smg_baka_s_folded"
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_s_standard.unit = "units/pd2_dlc_dragon/weapons/wpn_fps_smg_baka_pts/wpn_fps_smg_baka_s_folded"
end
if WacMenu._data.replace_microuzinunfoldst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_s_unfolded.third_unit = "units/pd2_dlc_dragon/weapons/wpn_third_smg_baka_pts/wpn_third_smg_baka_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_s_unfolded.unit = "units/pd2_dlc_dragon/weapons/wpn_fps_smg_baka_pts/wpn_fps_smg_baka_s_standard"
elseif WacMenu._data.replace_microuzinunfoldst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_s_unfolded.third_unit = "units/pd2_dlc_dragon/weapons/wpn_third_smg_baka_pts/wpn_third_smg_baka_s_folded"
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_s_unfolded.unit = "units/pd2_dlc_dragon/weapons/wpn_fps_smg_baka_pts/wpn_fps_smg_baka_s_folded"
end
if WacMenu._data.replace_microuzix_st == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_s_folded_vanilla.third_unit = "units/pd2_dlc_dragon/weapons/wpn_third_smg_baka_pts/wpn_third_smg_baka_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_s_folded_vanilla.unit = "units/pd2_dlc_dragon/weapons/wpn_fps_smg_baka_pts/wpn_fps_smg_baka_s_standard"
elseif WacMenu._data.replace_microuzix_st == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_s_folded_vanilla.third_unit = "units/pd2_dlc_dragon/weapons/wpn_third_smg_baka_pts/wpn_third_smg_baka_s_unfolded"
	tweak_data.weapon.factory.parts.wpn_fps_smg_baka_s_folded_vanilla.unit = "units/pd2_dlc_dragon/weapons/wpn_fps_smg_baka_pts/wpn_fps_smg_baka_s_unfolded"
end
if WacMenu._data.replace_mp5kfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_m5k.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_m5k.adds = {"wpn_fps_smg_mp5_b_mp5a5"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_m5k.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_fg_mp5a5"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_m5k.unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_fg_mp5a5"
elseif WacMenu._data.replace_mp5kfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_m5k.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_m5k.adds = {"wpn_fps_smg_mp5_b_mp5a5"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_m5k.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_fg_mp5a4"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_m5k.unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_fg_mp5a4"
elseif WacMenu._data.replace_mp5kfg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_m5k.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_m5k.adds = {"wpn_fps_smg_mp5_b_mp5a5"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_m5k.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_mp5_fg_flash/wpn_third_smg_mp5_fg_flash"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_m5k.unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_mp5_fg_flash/wpn_fps_smg_mp5_fg_flash"
end
if WacMenu._data.replace_mp5a5fg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_mp5a5.forbids = {"wpn_fps_smg_mp5_b_mp5a5"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_mp5a5.adds = {"wpn_fps_smg_mp5_b_m5k"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_mp5a5.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_fg_mp5k"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_mp5a5.unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_fg_m5k"
elseif WacMenu._data.replace_mp5a5fg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_mp5a5.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_mp5a5.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_fg_mp5a4"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_mp5a5.unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_fg_mp5a4"
elseif WacMenu._data.replace_mp5a5fg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_mp5a5.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_mp5a5.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_mp5_fg_flash/wpn_third_smg_mp5_fg_flash"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_mp5a5.unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_mp5_fg_flash/wpn_fps_smg_mp5_fg_flash"
end
if WacMenu._data.replace_mp5surefire628 == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_flash.perks = nil
elseif WacMenu._data.replace_mp5surefire628 == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_flash.perks = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_flash.override = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_flash.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_flash.adds = {"wpn_fps_smg_mp5_b_mp5a5"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_flash.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_fg_mp5a5"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_flash.unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_fg_mp5a5"
elseif WacMenu._data.replace_mp5surefire628 == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_flash.perks = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_flash.override = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_flash.forbids = {"wpn_fps_smg_mp5_b_mp5a5"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_flash.adds = {"wpn_fps_smg_mp5_b_m5k"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_flash.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_fg_mp5k"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_flash.unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_fg_m5k"
elseif WacMenu._data.replace_mp5surefire628 == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_flash.perks = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_flash.override = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_flash.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_flash.adds = {"wpn_fps_smg_mp5_b_mp5a5"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_flash.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_fg_mp5a4"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_fg_flash.unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_fg_mp5a4"
end
if WacMenu._data.replace_mp5mag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_m_std.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_smg_mp5_m_straight/wpn_third_smg_mp5_m_straight"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_m_std.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_smg_mp5_m_straight/wpn_fps_smg_mp5_m_straight"
elseif WacMenu._data.replace_mp5mag == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_m_std.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_m_drum"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_m_std.unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_m_drum"
end
if WacMenu._data.replace_mp5_10mag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_m_straight.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_m_std"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_m_straight.unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_m_std"
elseif WacMenu._data.replace_mp5_10mag == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_m_straight.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_m_drum"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_m_straight.unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_m_drum"
end
if WacMenu._data.replace_mp5a3st == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_adjust.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_s_ring"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_adjust.unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_s_ring"
elseif WacMenu._data.replace_mp5a3st == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_adjust.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_s_solid"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_adjust.unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_s_solid"
elseif WacMenu._data.replace_mp5a3st == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_adjust.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_mp5_s_folding/wpn_third_smg_mp5_s_folding"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_adjust.unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_mp5_s_folding/wpn_fps_smg_mp5_s_folding"
end
if WacMenu._data.replace_mp5kcap == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_ring.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_s_adjust"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_ring.unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_s_adjust"
elseif WacMenu._data.replace_mp5kcap == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_ring.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_s_solid"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_ring.unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_s_solid"
elseif WacMenu._data.replace_mp5kcap == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_ring.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_mp5_s_folding/wpn_third_smg_mp5_s_folding"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_ring.unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_mp5_s_folding/wpn_fps_smg_mp5_s_folding"
end
if WacMenu._data.replace_mp5pdwst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_folding.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_s_ring"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_folding.unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_s_ring"
elseif WacMenu._data.replace_mp5pdwst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_folding.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_s_adjust"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_folding.unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_s_adjust"
elseif WacMenu._data.replace_mp5pdwst == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_folding.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_s_solid"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_folding.unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_s_solid"
end
if WacMenu._data.replace_xmp5kcap == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_ring_vanilla.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_s_adjust"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_ring_vanilla.unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_s_adjust"
elseif WacMenu._data.replace_xmp5kcap == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_ring_vanilla.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_s_solid"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_ring_vanilla.unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_s_solid"
elseif WacMenu._data.replace_xmp5kcap == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_ring_vanilla.third_unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_mp5_s_folding/wpn_third_smg_mp5_s_folding"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp5_s_ring_vanilla.unit = "units/pd2_dlc_tng/weapons/wpn_fps_smg_mp5_s_folding/wpn_fps_smg_mp5_s_folding"
end
if WacMenu._data.replace_mp7stndmag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_m_short.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_smg_mp7_pts/wpn_third_smg_mp7_m_extended"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_m_short.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_smg_mp7_pts/wpn_fps_smg_mp7_m_extended"
end
if WacMenu._data.replace_mp7extmag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_m_extended.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_smg_mp7_pts/wpn_third_smg_mp7_m_short"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_m_extended.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_smg_mp7_pts/wpn_fps_smg_mp7_m_short"
end
if WacMenu._data.replace_mp7foldst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_s_long.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_smg_mp7_pts/wpn_third_smg_mp7_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_s_long.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_smg_mp7_pts/wpn_fps_smg_mp7_s_standard"
end
if WacMenu._data.replace_mp7vertgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_body_standard.adds = {"wpn_fps_upg_vg_ass_smg_verticalgrip"}
elseif WacMenu._data.replace_mp7vertgrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_body_standard.adds = {"wpn_fps_ass_tecci_vg_standard"}
elseif WacMenu._data.replace_mp7vertgrip == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_body_standard.adds = {"wpn_fps_smg_hajk_vg_moe"}
elseif WacMenu._data.replace_mp7vertgrip == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_body_standard.adds = {"wpn_fps_gre_slap_vg_standard"}
elseif WacMenu._data.replace_mp7vertgrip == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_body_standard.adds = nil
end
if WacMenu._data.replace_mp9stndmag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp9_m_short.third_unit = "units/payday2/weapons/wpn_third_smg_mp9_pts/wpn_third_smg_mp9_m_extended"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp9_m_short.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_m_extended"
end
if WacMenu._data.replace_mp9extmag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp9_m_extended.third_unit = "units/payday2/weapons/wpn_third_smg_mp9_pts/wpn_third_smg_mp9_m_short"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp9_m_extended.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_m_short"
end
if WacMenu._data.replace_mp9stndst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp9_s_fold.third_unit = "units/payday2/weapons/wpn_third_smg_mp9_pts/wpn_third_smg_mp9_s_skel"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp9_s_fold.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_s_skel"
elseif WacMenu._data.replace_mp9stndst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp9_s_fold.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp9_s_fold.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_mp9skeletalst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp9_s_skel.third_unit = "units/payday2/weapons/wpn_third_smg_mp9_pts/wpn_third_smg_mp9_s_fold"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp9_s_skel.unit = "units/payday2/weapons/wpn_fps_smg_mp9_pts/wpn_fps_smg_mp9_s_fold"
elseif WacMenu._data.replace_mp9skeletalst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp9_s_skel.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_mp9_s_skel.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_mp40_foldedst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_erma_s_folded.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_third_smg_erma_s_unfolded"
	tweak_data.weapon.factory.parts.wpn_fps_smg_erma_s_folded.unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_fps_smg_erma_s_unfolded"
end
if WacMenu._data.replace_mp40x_st == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_erma_s_folded_vanilla.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_third_smg_erma_s_unfolded"
	tweak_data.weapon.factory.parts.wpn_fps_smg_erma_s_folded_vanilla.unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_fps_smg_erma_s_unfolded"
end
if WacMenu._data.replace_p90longb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_p90_b_long.third_unit = "units/payday2/weapons/wpn_third_smg_p90_pts/wpn_third_smg_p90_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_smg_p90_b_long.unit = "units/payday2/weapons/wpn_fps_smg_p90_pts/wpn_fps_smg_p90_b_short"
end
if WacMenu._data.replace_p90civb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_p90_b_civilian.third_unit = "units/payday2/weapons/wpn_third_smg_p90_pts/wpn_third_smg_p90_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_smg_p90_b_civilian.unit = "units/payday2/weapons/wpn_fps_smg_p90_pts/wpn_fps_smg_p90_b_short"
elseif WacMenu._data.replace_p90civb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_p90_b_civilian.third_unit = "units/payday2/weapons/wpn_third_smg_p90_pts/wpn_third_smg_p90_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_smg_p90_b_civilian.unit = "units/payday2/weapons/wpn_fps_smg_p90_pts/wpn_fps_smg_p90_b_long"
end
if WacMenu._data.replace_p90strap == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_p90_m_strap.third_unit = "units/payday2/weapons/wpn_third_smg_p90_pts/wpn_third_smg_p90_m_std"
	tweak_data.weapon.factory.parts.wpn_fps_smg_p90_m_strap.unit = "units/payday2/weapons/wpn_fps_smg_p90_pts/wpn_fps_smg_p90_m_std"
end
if WacMenu._data.replace_sigmpxk_handguard == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_shepheard_body_short.override.wpn_fps_smg_shepheard_b_standard = {unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_b_standard",third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_b_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_shepheard_body_short.override.wpn_fps_smg_shepheard_o_standard = {unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_o_standard",third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_o_standard"}
	tweak_data.weapon.factory.parts.wpn_fps_smg_shepheard_body_short.third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_body"
	tweak_data.weapon.factory.parts.wpn_fps_smg_shepheard_body_short.unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_body"
end
if WacMenu._data.replace_sigmpx_stnd_st == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_shepheard_s_standard.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_shepheard_s_standard.unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_s_no"
end
if WacMenu._data.replace_sigmpx_st_removed == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_shepheard_s_no.third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_shepheard_s_no.unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_s_standard"
end
if WacMenu._data.replace_sigmpx_akimbo_st == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_shepheard_s_no_vanilla.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_shepheard_s_no_vanilla.unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_s_standard"
end
if WacMenu._data.replace_sr2magpulassist == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_sr2_m_quick.third_unit = "units/pd2_dlc_coco/weapons/wpn_fps_smg_sr2_parts/wpn_third_smg_sr2_m_mag"
	tweak_data.weapon.factory.parts.wpn_fps_smg_sr2_m_quick.unit = "units/pd2_dlc_coco/weapons/wpn_fps_smg_sr2_parts/wpn_fps_smg_sr2_m_mag"
end
if WacMenu._data.replace_sr2unfoldst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_sr2_s_unfolded.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_sr2_s_unfolded.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
elseif WacMenu._data.replace_sr2unfoldst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_sr2_s_unfolded.third_unit = "units/pd2_dlc_coco/weapons/wpn_fps_smg_sr2_parts/wpn_third_smg_sr2_s_folded"
	tweak_data.weapon.factory.parts.wpn_fps_smg_sr2_s_unfolded.unit = "units/pd2_dlc_coco/weapons/wpn_fps_smg_sr2_parts/wpn_fps_smg_sr2_s_folded"
end
if WacMenu._data.replace_tec9_ab10 == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_tec9_b_standard.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_tec9_pts/wpn_third_smg_tec9_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_smg_tec9_b_standard.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_tec9_pts/wpn_fps_smg_tec9_b_long"
elseif WacMenu._data.replace_tec9_ab10 == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_tec9_b_standard.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_tec9_pts/wpn_third_smg_tec9_ns_ext"
	tweak_data.weapon.factory.parts.wpn_fps_smg_tec9_b_standard.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_tec9_pts/wpn_fps_smg_tec9_ns_ext"
end
if WacMenu._data.replace_tec9longb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_tec9_ns_ext.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_tec9_pts/wpn_third_smg_tec9_b_long"
	tweak_data.weapon.factory.parts.wpn_fps_smg_tec9_ns_ext.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_tec9_pts/wpn_fps_smg_tec9_b_long"
elseif WacMenu._data.replace_tec9longb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_tec9_ns_ext.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_tec9_pts/wpn_third_smg_tec9_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_tec9_ns_ext.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_tec9_pts/wpn_fps_smg_tec9_b_standard"
end
if WacMenu._data.replace_tec9extmag == true then
	tweak_data.weapon.factory.parts.wpn_fps_smg_tec9_m_extended.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_tec9_pts/wpn_third_smg_tec9_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_tec9_m_extended.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_tec9_pts/wpn_fps_smg_tec9_m_standard"
end
if WacMenu._data.replace_tec9stock == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_tec9_s_unfolded.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_tec9_s_unfolded.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_usc45b == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_b_civil.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_b_civil.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_b_standard"
end
if WacMenu._data.replace_ump45extmag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_m_long.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_m_long.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_m_long.bullet_objects = {prefix = "g_bullet_", amount = 28}
elseif WacMenu._data.replace_ump45extmag == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_m_long.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_m_short"
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_m_long.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_m_short"
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_m_long.bullet_objects = {prefix = "g_bullet_", amount = 16}
end
if WacMenu._data.replace_ump45shortmag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_m_short.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_m_short.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_m_short.bullet_objects = {prefix = "g_bullet_", amount = 28}
end
if WacMenu._data.replace_usc45st == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_s_civil.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_s_civil.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_s_standard"
elseif WacMenu._data.replace_usc45st == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_s_civil.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_s_folded"
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_s_civil.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_s_folded"
elseif WacMenu._data.replace_usc45st == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_s_civil.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_s_civil.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_ump45foldedst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_s_folded.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_s_folded.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_s_standard"
elseif WacMenu._data.replace_ump45foldedst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_s_folded.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_s_folded.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_ump45x_st == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_s_folded_vanilla.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_s_folded_vanilla.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_s_standard"
elseif WacMenu._data.replace_ump45x_st == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_s_folded_vanilla.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_s_civil"
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_s_folded_vanilla.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_s_civil"
elseif WacMenu._data.replace_ump45x_st == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_s_folded_vanilla.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_s_folded_vanilla.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_ump45m900 == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_vg_surefire.adds = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_vg_surefire.perks = nil
elseif WacMenu._data.replace_ump45m900 == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_vg_surefire.adds = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_vg_surefire.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_vg_surefire.perks = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_vg_surefire.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_verticalgrip/wpn_third_upg_vg_ass_smg_verticalgrip"
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_vg_surefire.unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_verticalgrip/wpn_fps_upg_vg_ass_smg_verticalgrip"
elseif WacMenu._data.replace_ump45m900 == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_vg_surefire.adds = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_vg_surefire.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_vg_surefire.perks = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_vg_surefire.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_stubby/wpn_third_upg_vg_ass_smg_stubby"
	tweak_data.weapon.factory.parts.wpn_fps_smg_schakal_vg_surefire.unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_stubby/wpn_fps_upg_vg_ass_smg_stubby"
end
if WacMenu._data.replace_uzitacfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_fg_rail.adds = nil
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_fg_rail.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_fg_rail.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_fg_standard"
end
if WacMenu._data.replace_uziergostock == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_leather.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_s_solid"
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_leather.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_s_solid"
elseif WacMenu._data.replace_uziergostock == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_leather.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_leather.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_s_standard"
elseif WacMenu._data.replace_uziergostock == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_leather.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_s_unfolded"
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_leather.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_s_unfolded"
elseif WacMenu._data.replace_uziergostock == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_leather.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_leather.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_uzisolidstock == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_solid.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_s_leather"
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_solid.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_s_leather"
elseif WacMenu._data.replace_uzisolidstock == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_solid.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_solid.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_s_standard"
elseif WacMenu._data.replace_uzisolidstock == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_solid.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_s_unfolded"
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_solid.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_s_unfolded"
elseif WacMenu._data.replace_uzisolidstock == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_solid.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_solid.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_uzifoldstock == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_standard.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_s_leather"
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_standard.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_s_leather"
elseif WacMenu._data.replace_uzifoldstock == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_standard.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_s_solid"
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_standard.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_s_solid"
elseif WacMenu._data.replace_uzifoldstock == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_standard.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_s_unfolded"
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_standard.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_s_unfolded"
elseif WacMenu._data.replace_uzifoldstock == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_standard.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_standard.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_uzix_st == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_standard_vanilla.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_standard_vanilla.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
elseif WacMenu._data.replace_uzix_st == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_standard_vanilla.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_s_unfolded"
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_standard_vanilla.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_s_unfolded"
elseif WacMenu._data.replace_uzix_st == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_standard_vanilla.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_s_leather"
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_standard_vanilla.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_s_leather"
elseif WacMenu._data.replace_uzix_st == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_standard_vanilla.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_s_solid"
	tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_s_standard_vanilla.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_s_solid"
end
if WacMenu._data.replace_vectorcrb_model == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_barrel_precision.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_jprifles"
	tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_barrel_precision.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_jprifles"
elseif WacMenu._data.replace_vectorcrb_model == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_barrel_precision.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_firepig/wpn_third_upg_ns_ass_smg_firepig"
	tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_barrel_precision.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_firepig/wpn_fps_upg_ns_ass_smg_firepig"
elseif WacMenu._data.replace_vectorcrb_model == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_barrel_precision.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_tank/wpn_third_upg_ns_ass_smg_tank"
	tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_barrel_precision.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_tank/wpn_fps_upg_ns_ass_smg_tank"
elseif WacMenu._data.replace_vectorcrb_model == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_barrel_precision.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_surefire"
	tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_barrel_precision.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_surefire"
elseif WacMenu._data.replace_vectorcrb_model == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_barrel_precision.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_linear"
	tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_barrel_precision.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_linear"
elseif WacMenu._data.replace_vectorcrb_model == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_barrel_precision.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ass_ns_battle/wpn_third_upg_ass_ns_battle"
	tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_barrel_precision.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ass_ns_battle/wpn_fps_upg_ass_ns_battle"
elseif WacMenu._data.replace_vectorcrb_model == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_barrel_precision.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_barrel_precision.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_vz61ergo == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_g_ergo.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_g_wood"
	tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_g_ergo.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_g_wood"
elseif WacMenu._data.replace_vz61ergo == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_g_ergo.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_g_ergo.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_g_standard"
end
if WacMenu._data.replace_vz61woodgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_g_wood.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_g_ergo"
	tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_g_wood.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_g_ergo"
elseif WacMenu._data.replace_vz61woodgrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_g_wood.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_g_wood.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_g_standard"
end
if WacMenu._data.replace_vz61extmag == true then
	tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_m_extended.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_m_extended.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_m_standard"
end
if WacMenu._data.replace_vz61nost == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_s_nostock.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_s_unfolded"
	tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_s_nostock.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_s_unfolded"
elseif WacMenu._data.replace_vz61nost == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_s_nostock.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_s_nostock.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_s_standard"
end
if WacMenu._data.replace_vz61unfoldst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_s_unfolded.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_s_nostock"
	tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_s_unfolded.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_s_nostock"
elseif WacMenu._data.replace_vz61unfoldst == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_s_unfolded.third_unit = "units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_scorpion_s_unfolded.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_s_standard"
end
-- Specials
if WacMenu._data.replace_chinasawoffst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_gre_china_s_short.third_unit = "units/pd2_dlc_lupus/weapons/wpn_third_gre_china_pts/wpn_third_gre_china_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_gre_china_s_short.unit = "units/pd2_dlc_lupus/weapons/wpn_fps_gre_china_pts/wpn_fps_gre_china_s_standard"
end
if WacMenu._data.replace_m320_nosight == true then
	tweak_data.weapon.factory.parts.wpn_fps_gre_slap_o_iron.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_gre_slap_o_iron.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_gre_slap_o_iron.stance_mod = {
		wpn_fps_gre_slap = {
			translation = Vector3(9, 12, 0),
			rotation = Rotation(0, 0, -4)
		}
	}
end
if WacMenu._data.replace_m320_vertgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_gre_slap_vg_standard.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_stubby/wpn_third_upg_vg_ass_smg_stubby"
	tweak_data.weapon.factory.parts.wpn_fps_gre_slap_vg_standard.unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_stubby/wpn_fps_upg_vg_ass_smg_stubby"
elseif WacMenu._data.replace_m320_vertgrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_gre_slap_vg_standard.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_verticalgrip/wpn_third_upg_vg_ass_smg_verticalgrip"
	tweak_data.weapon.factory.parts.wpn_fps_gre_slap_vg_standard.unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_verticalgrip/wpn_fps_upg_vg_ass_smg_verticalgrip"
elseif WacMenu._data.replace_m320_vertgrip == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_gre_slap_vg_standard.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_afg/wpn_third_upg_vg_ass_smg_afg"
	tweak_data.weapon.factory.parts.wpn_fps_gre_slap_vg_standard.unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_afg/wpn_fps_upg_vg_ass_smg_afg"
elseif WacMenu._data.replace_m320_vertgrip == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_gre_slap_vg_standard.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_vg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_gre_slap_vg_standard.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_vg_standard"
elseif WacMenu._data.replace_m320_vertgrip == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_gre_slap_vg_standard.third_unit = "units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_third_smg_polymer_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_gre_slap_vg_standard.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_fps_smg_polymer_fg_standard"
elseif WacMenu._data.replace_m320_vertgrip == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_gre_slap_vg_standard.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_gre_slap_vg_standard.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
elseif WacMenu._data.replace_m320_vertgrip == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_gre_slap_vg_standard.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_vg_surefire"
	tweak_data.weapon.factory.parts.wpn_fps_gre_slap_vg_standard.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_vg_surefire"
elseif WacMenu._data.replace_m320_vertgrip == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_gre_slap_vg_standard.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_vg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_gre_slap_vg_standard.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_vg_standard"
end
if WacMenu._data.replace_longbowexplosive == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_bow_long_m_explosive.third_unit = "units/pd2_dlc_steel/weapons/wpn_fps_bow_long_pts/wpn_third_bow_long_m_standard"
	tweak_data.weapon.factory.parts.wpn_fps_bow_long_m_explosive.unit = "units/pd2_dlc_steel/weapons/wpn_fps_bow_long_pts/wpn_fps_bow_long_m_standard"
end
if WacMenu._data.replace_m134aab == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m134_barrel_extreme.third_unit = "units/pd2_dlc_overkill_pack/weapons/wpn_fps_lmg_m134_pts/wpn_third_lmg_m134_barrel"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m134_barrel_extreme.unit = "units/pd2_dlc_overkill_pack/weapons/wpn_fps_lmg_m134_pts/wpn_fps_lmg_m134_barrel"
end
if WacMenu._data.replace_m134shortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m134_barrel_short.third_unit = "units/pd2_dlc_overkill_pack/weapons/wpn_fps_lmg_m134_pts/wpn_third_lmg_m134_barrel"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m134_barrel_short.unit = "units/pd2_dlc_overkill_pack/weapons/wpn_fps_lmg_m134_pts/wpn_fps_lmg_m134_barrel"
elseif WacMenu._data.replace_m134shortb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m134_barrel_short.third_unit = "units/pd2_dlc_overkill_pack/weapons/wpn_fps_lmg_m134_pts/wpn_third_lmg_m134_barrel_extreme"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_m134_barrel_short.unit = "units/pd2_dlc_overkill_pack/weapons/wpn_fps_lmg_m134_pts/wpn_fps_lmg_m134_barrel_extreme"
end
if WacMenu._data.replace_m79sawoffb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_barrel_short.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_third_gre_m79_barrel"
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_barrel_short.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_fps_gre_m79_barrel"
end
if WacMenu._data.replace_m79sawoffst == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_stock_short.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_third_gre_m79_stock"
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_stock_short.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_gre_m79_pts/wpn_fps_gre_m79_stock"
end
if WacMenu._data.replace_m79disablesight == true then
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.type = "notagadget"
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.stance_mod = nil
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.sub_type = nil
	tweak_data.weapon.factory.parts.wpn_fps_gre_m79_sight_up.perks = nil
end
if WacMenu._data.replace_ove9ksilentmotor == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_saw_body_silent.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_saw_body_speed/wpn_third_saw_body_speed"
	tweak_data.weapon.factory.parts.wpn_fps_saw_body_silent.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_saw_body_speed/wpn_fps_saw_body_speed"
elseif WacMenu._data.replace_ove9ksilentmotor == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_saw_body_silent.third_unit = "units/payday2/weapons/wpn_third_saw_pts/wpn_third_saw_body_standard"
	tweak_data.weapon.factory.parts.wpn_fps_saw_body_silent.unit = "units/payday2/weapons/wpn_fps_saw_pts/wpn_fps_saw_body_standard"
end
if WacMenu._data.replace_ove9kbainmotor == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_saw_body_speed.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_saw_body_silent/wpn_third_saw_body_silent"
	tweak_data.weapon.factory.parts.wpn_fps_saw_body_speed.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_saw_body_silent/wpn_fps_saw_body_silent"
elseif WacMenu._data.replace_ove9kbainmotor == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_saw_body_speed.third_unit = "units/payday2/weapons/wpn_third_saw_pts/wpn_third_saw_body_standard"
	tweak_data.weapon.factory.parts.wpn_fps_saw_body_speed.unit = "units/payday2/weapons/wpn_fps_saw_pts/wpn_fps_saw_body_standard"
end
if WacMenu._data.replace_ovk9kdurableblade == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_saw_m_blade_durable.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_saw_m_blade_sharp/wpn_third_saw_m_blade_sharp"
	tweak_data.weapon.factory.parts.wpn_fps_saw_m_blade_durable.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_saw_m_blade_sharp/wpn_fps_saw_m_blade_sharp"
elseif WacMenu._data.replace_ovk9kdurableblade == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_saw_m_blade_durable.third_unit = "units/payday2/weapons/wpn_third_saw_pts/wpn_third_saw_m_blade"
	tweak_data.weapon.factory.parts.wpn_fps_saw_m_blade_durable.unit = "units/payday2/weapons/wpn_fps_saw_pts/wpn_fps_saw_m_blade"
end
if WacMenu._data.replace_ovk9ksharpblade == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_saw_m_blade_sharp.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_saw_m_blade_durable/wpn_third_saw_m_blade_durable"
	tweak_data.weapon.factory.parts.wpn_fps_saw_m_blade_sharp.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_saw_m_blade_durable/wpn_fps_saw_m_blade_durable"
elseif WacMenu._data.replace_ovk9ksharpblade == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_saw_m_blade_sharp.third_unit = "units/payday2/weapons/wpn_third_saw_pts/wpn_third_saw_m_blade"
	tweak_data.weapon.factory.parts.wpn_fps_saw_m_blade_sharp.unit = "units/payday2/weapons/wpn_fps_saw_pts/wpn_fps_saw_m_blade"
end
if WacMenu._data.replace_xm25comp == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_gre_arbiter_b_comp.third_unit = "units/pd2_dlc_tng/weapons/wpn_third_gre_arbiter_pts/wpn_third_gre_arbiter_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_gre_arbiter_b_comp.unit = "units/pd2_dlc_tng/weapons/wpn_fps_gre_arbiter_pts/wpn_fps_gre_arbiter_b_standard"
end
if WacMenu._data.replace_xm25longb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_gre_arbiter_b_long.third_unit = "units/pd2_dlc_tng/weapons/wpn_third_gre_arbiter_pts/wpn_third_gre_arbiter_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_gre_arbiter_b_long.unit = "units/pd2_dlc_tng/weapons/wpn_fps_gre_arbiter_pts/wpn_fps_gre_arbiter_b_standard"
end
if WacMenu._data.replace_xm556stndb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_standard.third_unit = "units/pd2_dlc_dmg/weapons/wpn_third_lmg_shuno_pts/wpn_third_lmg_shuno_b_heat_long"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_standard.unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_heat_long"
elseif WacMenu._data.replace_xm556stndb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_standard.override = {wpn_fps_lmg_shuno_b_dummy_long = {unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_dummy_short"}}
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_standard.third_unit = "units/pd2_dlc_dmg/weapons/wpn_third_lmg_shuno_pts/wpn_third_lmg_shuno_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_standard.unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_short"
elseif WacMenu._data.replace_xm556stndb == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_standard.override = {wpn_fps_lmg_shuno_b_dummy_long = {unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_dummy_short"}}
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_standard.third_unit = "units/pd2_dlc_dmg/weapons/wpn_third_lmg_shuno_pts/wpn_third_lmg_shuno_b_heat_short"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_standard.unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_heat_short"
end
if WacMenu._data.replace_xm556longheatb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_heat_long.override = {wpn_fps_lmg_shuno_b_dummy_long = {unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_dummy_short"}}
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_heat_long.third_unit = "units/pd2_dlc_dmg/weapons/wpn_third_lmg_shuno_pts/wpn_third_lmg_shuno_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_heat_long.unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_short"
elseif WacMenu._data.replace_xm556longheatb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_heat_long.override = {wpn_fps_lmg_shuno_b_dummy_long = {unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_dummy_short"}}
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_heat_long.third_unit = "units/pd2_dlc_dmg/weapons/wpn_third_lmg_shuno_pts/wpn_third_lmg_shuno_b_heat_short"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_heat_long.unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_heat_short"
elseif WacMenu._data.replace_xm556longheatb == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_heat_long.third_unit = "units/pd2_dlc_dmg/weapons/wpn_third_lmg_shuno_pts/wpn_third_lmg_shuno_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_heat_long.unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_standard"
end
if WacMenu._data.replace_xm556shortheatb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_heat_short.third_unit = "units/pd2_dlc_dmg/weapons/wpn_third_lmg_shuno_pts/wpn_third_lmg_shuno_b_short"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_heat_short.unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_short"
elseif WacMenu._data.replace_xm556shortheatb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_heat_short.override = nil
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_heat_short.third_unit = "units/pd2_dlc_dmg/weapons/wpn_third_lmg_shuno_pts/wpn_third_lmg_shuno_b_heat_long"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_heat_short.unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_heat_long"
elseif WacMenu._data.replace_xm556shortheatb == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_heat_short.override = nil
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_heat_short.third_unit = "units/pd2_dlc_dmg/weapons/wpn_third_lmg_shuno_pts/wpn_third_lmg_shuno_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_heat_short.unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_standard"
end
if WacMenu._data.replace_xm556shortb == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_short.third_unit = "units/pd2_dlc_dmg/weapons/wpn_third_lmg_shuno_pts/wpn_third_lmg_shuno_b_heat_short"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_short.unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_heat_short"
elseif WacMenu._data.replace_xm556shortb == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_short.override = nil
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_short.third_unit = "units/pd2_dlc_dmg/weapons/wpn_third_lmg_shuno_pts/wpn_third_lmg_shuno_b_heat_long"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_short.unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_heat_long"
elseif WacMenu._data.replace_xm556shortb == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_short.override = nil
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_short.third_unit = "units/pd2_dlc_dmg/weapons/wpn_third_lmg_shuno_pts/wpn_third_lmg_shuno_b_standard"
	tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_b_short.unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno_pts/wpn_fps_lmg_shuno_b_standard"
end
-- Attachments
local ak_fg_ovr = {}
if not wac_akfg_override_saved then
ak_fg_ovr.krebs = deep_clone(tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.override)
ak_fg_ovr.trax = deep_clone(tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.override)
ak_fg_ovr.stnd = deep_clone(tweak_data.weapon.factory.parts.wpn_upg_ak_fg_standard.override)
	wac_akfg_override_saved = true
end
if WacMenu._data.replace_akwoodrail == 2 then
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_combo3"
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_combo3"
elseif WacMenu._data.replace_akwoodrail == 3 then
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_fg_tapco/wpn_third_upg_ak_fg_tapco"
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_fg_tapco/wpn_fps_upg_ak_fg_tapco"
elseif WacMenu._data.replace_akwoodrail == 4 then
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.adds = {"wpn_fps_ak_extra_ris"}
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_midwest/wpn_third_upg_fg_midwest"
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_midwest/wpn_fps_upg_fg_midwest"
elseif WacMenu._data.replace_akwoodrail == 5 then
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_fg_krebs/wpn_third_upg_ak_fg_krebs"
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_fg_krebs/wpn_fps_upg_ak_fg_krebs"
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.override = ak_fg_ovr.krebs
elseif WacMenu._data.replace_akwoodrail == 6 then
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_fg_trax/wpn_third_upg_ak_fg_trax"
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_fg_trax/wpn_fps_upg_ak_fg_trax"
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.override = ak_fg_ovr.trax
elseif WacMenu._data.replace_akwoodrail == 7 then
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.forbids = nil
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_standard"
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_standard"
elseif WacMenu._data.replace_akwoodrail == 8 then
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.forbids = nil
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_fg_standard"
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo2.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_fg_standard"
end
if WacMenu._data.replace_aktacfg == 2 then
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.forbids = nil
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_combo2"
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_combo2"
elseif WacMenu._data.replace_aktacfg == 3 then
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.forbids = nil
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_fg_tapco/wpn_third_upg_ak_fg_tapco"
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_fg_tapco/wpn_fps_upg_ak_fg_tapco"
elseif WacMenu._data.replace_aktacfg == 4 then
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.adds = {"wpn_fps_ak_extra_ris"}
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_midwest/wpn_third_upg_fg_midwest"
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_midwest/wpn_fps_upg_fg_midwest"
elseif WacMenu._data.replace_aktacfg == 5 then
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_fg_krebs/wpn_third_upg_ak_fg_krebs"
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_fg_krebs/wpn_fps_upg_ak_fg_krebs"
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.override = ak_fg_ovr.krebs
elseif WacMenu._data.replace_aktacfg == 6 then
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_fg_trax/wpn_third_upg_ak_fg_trax"
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_fg_trax/wpn_fps_upg_ak_fg_trax"
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.override = ak_fg_ovr.trax
elseif WacMenu._data.replace_aktacfg == 7 then
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.forbids = nil
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_standard"
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_standard"
elseif WacMenu._data.replace_aktacfg == 8 then
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.forbids = nil
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_fg_standard"
	tweak_data.weapon.factory.parts.wpn_upg_ak_fg_combo3.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_fg_standard"
end
if WacMenu._data.replace_aklightfg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_combo3"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_combo3"
elseif WacMenu._data.replace_aklightfg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_combo2"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_combo2"
elseif WacMenu._data.replace_aklightfg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_fg_tapco/wpn_third_upg_ak_fg_tapco"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_fg_tapco/wpn_fps_upg_ak_fg_tapco"
elseif WacMenu._data.replace_aklightfg == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.forbids = {"wpn_fps_ak_extra_ris","wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_fg_krebs/wpn_third_upg_ak_fg_krebs"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_fg_krebs/wpn_fps_upg_ak_fg_krebs"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.override = ak_fg_ovr.krebs
elseif WacMenu._data.replace_aklightfg == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.forbids = {"wpn_fps_ak_extra_ris","wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_fg_trax/wpn_third_upg_ak_fg_trax"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_fg_trax/wpn_fps_upg_ak_fg_trax"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.override = ak_fg_ovr.trax
elseif WacMenu._data.replace_aklightfg == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_standard"
elseif WacMenu._data.replace_aklightfg == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fg_midwest.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_fg_standard"
end
if WacMenu._data.replace_akkrebs == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_combo3"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_combo3"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.override = ak_fg_ovr.stnd
elseif WacMenu._data.replace_akkrebs == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_combo2"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_combo2"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.override = ak_fg_ovr.stnd
elseif WacMenu._data.replace_akkrebs == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_fg_tapco/wpn_third_upg_ak_fg_tapco"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_fg_tapco/wpn_fps_upg_ak_fg_tapco"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.override = ak_fg_ovr.stnd
elseif WacMenu._data.replace_akkrebs == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.adds = {"wpn_fps_ak_extra_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_midwest/wpn_third_upg_fg_midwest"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_midwest/wpn_fps_upg_fg_midwest"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.override = ak_fg_ovr.stnd
elseif WacMenu._data.replace_akkrebs == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_fg_trax/wpn_third_upg_ak_fg_trax"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_fg_trax/wpn_fps_upg_ak_fg_trax"
elseif WacMenu._data.replace_akkrebs == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.override = ak_fg_ovr.stnd
elseif WacMenu._data.replace_akkrebs == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_krebs.override = ak_fg_ovr.stnd
end
if WacMenu._data.replace_aktrax == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_combo3"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_combo3"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.override = ak_fg_ovr.stnd
elseif WacMenu._data.replace_aktrax == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_combo2"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_combo2"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.override = ak_fg_ovr.stnd
elseif WacMenu._data.replace_aktrax == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_fg_tapco/wpn_third_upg_ak_fg_tapco"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_fg_tapco/wpn_fps_upg_ak_fg_tapco"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.override = ak_fg_ovr.stnd
elseif WacMenu._data.replace_aktrax == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.adds = {"wpn_fps_ak_extra_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.forbids = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_midwest/wpn_third_upg_fg_midwest"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_midwest/wpn_fps_upg_fg_midwest"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.override = ak_fg_ovr.stnd
elseif WacMenu._data.replace_aktrax == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_fg_krebs/wpn_third_upg_ak_fg_krebs"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_fg_krebs/wpn_fps_upg_ak_fg_krebs"
elseif WacMenu._data.replace_aktrax == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.override = ak_fg_ovr.stnd
elseif WacMenu._data.replace_aktrax == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.forbids = nil
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_fg_trax.override = ak_fg_ovr.stnd
end
if WacMenu._data.replace_akhgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_hgrip.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_g_pgrip/wpn_third_upg_ak_g_pgrip"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_hgrip.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_g_pgrip/wpn_fps_upg_ak_g_pgrip"
elseif WacMenu._data.replace_akhgrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_hgrip.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_g_wgrip/wpn_third_upg_ak_g_wgrip"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_hgrip.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_g_wgrip/wpn_fps_upg_ak_g_wgrip"
elseif WacMenu._data.replace_akhgrip == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_hgrip.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_g_rk3/wpn_third_upg_ak_g_rk3"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_hgrip.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_g_rk3/wpn_fps_upg_ak_g_rk3"
elseif WacMenu._data.replace_akhgrip == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_hgrip.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_hgrip.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_g_standard"
elseif WacMenu._data.replace_akhgrip == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_hgrip.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_smg_coal_pts/wpn_third_smg_coal_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_hgrip.unit = "units/pd2_dlc_grv/weapons/wpn_fps_smg_coal_pts/wpn_fps_smg_coal_g_standard"
end
if WacMenu._data.replace_akpgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_pgrip.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_g_hgrip/wpn_third_upg_ak_g_hgrip"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_pgrip.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_g_hgrip/wpn_fps_upg_ak_g_hgrip"
elseif WacMenu._data.replace_akpgrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_pgrip.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_g_wgrip/wpn_third_upg_ak_g_wgrip"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_pgrip.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_g_wgrip/wpn_fps_upg_ak_g_wgrip"
elseif WacMenu._data.replace_akpgrip == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_pgrip.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_g_rk3/wpn_third_upg_ak_g_rk3"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_pgrip.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_g_rk3/wpn_fps_upg_ak_g_rk3"
elseif WacMenu._data.replace_akpgrip == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_pgrip.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_pgrip.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_g_standard"
elseif WacMenu._data.replace_akpgrip == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_pgrip.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_smg_coal_pts/wpn_third_smg_coal_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_pgrip.unit = "units/pd2_dlc_grv/weapons/wpn_fps_smg_coal_pts/wpn_fps_smg_coal_g_standard"
end
if WacMenu._data.replace_akwgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_wgrip.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_g_hgrip/wpn_third_upg_ak_g_hgrip"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_wgrip.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_g_hgrip/wpn_fps_upg_ak_g_hgrip"
elseif WacMenu._data.replace_akwgrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_wgrip.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_g_pgrip/wpn_third_upg_ak_g_pgrip"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_wgrip.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_g_pgrip/wpn_fps_upg_ak_g_pgrip"
elseif WacMenu._data.replace_akwgrip == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_wgrip.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_g_rk3/wpn_third_upg_ak_g_rk3"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_wgrip.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_g_rk3/wpn_fps_upg_ak_g_rk3"
elseif WacMenu._data.replace_akwgrip == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_wgrip.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_wgrip.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_g_standard"
elseif WacMenu._data.replace_akwgrip == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_wgrip.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_smg_coal_pts/wpn_third_smg_coal_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_wgrip.unit = "units/pd2_dlc_grv/weapons/wpn_fps_smg_coal_pts/wpn_fps_smg_coal_g_standard"
end
if WacMenu._data.replace_akrk3grip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_rk3.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_g_hgrip/wpn_third_upg_ak_g_hgrip"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_rk3.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_g_hgrip/wpn_fps_upg_ak_g_hgrip"
elseif WacMenu._data.replace_akrk3grip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_rk3.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_g_pgrip/wpn_third_upg_ak_g_pgrip"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_rk3.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_g_pgrip/wpn_fps_upg_ak_g_pgrip"
elseif WacMenu._data.replace_akrk3grip == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_rk3.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_g_wgrip/wpn_third_upg_ak_g_wgrip"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_rk3.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_g_wgrip/wpn_fps_upg_ak_g_wgrip"
elseif WacMenu._data.replace_akrk3grip == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_rk3.third_unit = "units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_rk3.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_g_standard"
elseif WacMenu._data.replace_akrk3grip == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_rk3.third_unit = "units/pd2_dlc_grv/weapons/wpn_third_smg_coal_pts/wpn_third_smg_coal_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ak_g_rk3.unit = "units/pd2_dlc_grv/weapons/wpn_fps_smg_coal_pts/wpn_fps_smg_coal_g_standard"
end
if WacMenu._data.replace_ar15sniper == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_sniper.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_ergo"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_sniper.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_ergo"
elseif WacMenu._data.replace_ar15sniper == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_sniper.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_upg_m4_g_hgrip/wpn_third_upg_m4_g_hgrip"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_sniper.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_upg_m4_g_hgrip/wpn_fps_upg_m4_g_hgrip"
elseif WacMenu._data.replace_ar15sniper == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_sniper.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_upg_m4_g_mgrip/wpn_third_upg_m4_g_mgrip"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_sniper.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_upg_m4_g_mgrip/wpn_fps_upg_m4_g_mgrip"
elseif WacMenu._data.replace_ar15sniper == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_sniper.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_sniper.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_g_standard"
elseif WacMenu._data.replace_ar15sniper == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_sniper.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_sniper.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_standard"
elseif WacMenu._data.replace_ar15sniper == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_sniper.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_g_grippy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_sniper.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_g_grippy"
end
if WacMenu._data.replace_ar15hgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_hgrip.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_ergo"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_hgrip.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_ergo"
elseif WacMenu._data.replace_ar15hgrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_hgrip.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_sniper"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_hgrip.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_sniper"
elseif WacMenu._data.replace_ar15hgrip == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_hgrip.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_upg_m4_g_mgrip/wpn_third_upg_m4_g_mgrip"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_hgrip.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_upg_m4_g_mgrip/wpn_fps_upg_m4_g_mgrip"
elseif WacMenu._data.replace_ar15hgrip == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_hgrip.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_hgrip.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_g_standard"
elseif WacMenu._data.replace_ar15hgrip == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_hgrip.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_hgrip.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_standard"
elseif WacMenu._data.replace_ar15hgrip == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_hgrip.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_g_grippy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_hgrip.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_g_grippy"
end
if WacMenu._data.replace_ar15mgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_mgrip.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_ergo"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_mgrip.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_ergo"
elseif WacMenu._data.replace_ar15mgrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_mgrip.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_sniper"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_mgrip.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_sniper"
elseif WacMenu._data.replace_ar15mgrip == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_mgrip.third_unit = "units/pd2_dlc_dec5/weapons/wpn_third_upg_m4_g_hgrip/wpn_third_upg_m4_g_hgrip"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_mgrip.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_upg_m4_g_hgrip/wpn_fps_upg_m4_g_hgrip"
elseif WacMenu._data.replace_ar15mgrip == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_mgrip.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_mgrip.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_g_standard"
elseif WacMenu._data.replace_ar15mgrip == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_mgrip.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_mgrip.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_standard"
elseif WacMenu._data.replace_ar15mgrip == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_mgrip.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_g_grippy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_g_mgrip.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_g_grippy"
end
if WacMenu._data.replace_ar15_30rndstanag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_m_std.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_straight"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_m_std.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_straight"
elseif WacMenu._data.replace_ar15_30rndstanag == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_m_std.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_pmag"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_m_std.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_pmag"
elseif WacMenu._data.replace_ar15_30rndstanag == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_m_std.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_m4_m_quad/wpn_third_upg_m4_m_quad"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_m_std.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_m_quad/wpn_fps_upg_m4_m_quad"
elseif WacMenu._data.replace_ar15_30rndstanag == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_m_std.third_unit = "units/pd2_dlc_clover/weapons/wpn_third_ass_l85a2_pts/wpn_third_ass_l85a2_m_emag"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_m_std.unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_m_emag"
elseif WacMenu._data.replace_ar15_30rndstanag == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_m_std.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_m_l5/wpn_third_upg_m4_m_l5"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_m_std.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_m_l5/wpn_fps_upg_m4_m_l5"
elseif WacMenu._data.replace_ar15_30rndstanag == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_m_std.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_drum"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_m_std.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_drum"
elseif WacMenu._data.replace_ar15_30rndstanag == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_m_std.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_aug_m_pmag"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_m_std.unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_m_pmag"
elseif WacMenu._data.replace_ar15_30rndstanag == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_m_std.bullet_objects = {prefix = "g_bullet_", amount = 100}
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_m_std.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_m_drum"
	tweak_data.weapon.factory.parts.wpn_fps_m4_uupg_m_std.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_m_drum"
end
if WacMenu._data.replace_ar15_20rndstanag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_m_std"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_m_std"
elseif WacMenu._data.replace_ar15_20rndstanag == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_pmag"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_pmag"
elseif WacMenu._data.replace_ar15_20rndstanag == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_m4_m_quad/wpn_third_upg_m4_m_quad"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_m_quad/wpn_fps_upg_m4_m_quad"
elseif WacMenu._data.replace_ar15_20rndstanag == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight.third_unit = "units/pd2_dlc_clover/weapons/wpn_third_ass_l85a2_pts/wpn_third_ass_l85a2_m_emag"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight.unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_m_emag"
elseif WacMenu._data.replace_ar15_20rndstanag == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_m_l5/wpn_third_upg_m4_m_l5"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_m_l5/wpn_fps_upg_m4_m_l5"
elseif WacMenu._data.replace_ar15_20rndstanag == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_drum"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_drum"
elseif WacMenu._data.replace_ar15_20rndstanag == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_aug_m_pmag"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight.unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_m_pmag"
elseif WacMenu._data.replace_ar15_20rndstanag == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight.bullet_objects = {prefix = "g_bullet_", amount = 100}
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_m_drum"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_straight.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_m_drum"
end
if WacMenu._data.replace_ar15_pmag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_pmag.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_straight"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_pmag.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_straight"
elseif WacMenu._data.replace_ar15_pmag == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_pmag.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_m_std"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_pmag.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_m_std"
elseif WacMenu._data.replace_ar15_pmag == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_pmag.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_m4_m_quad/wpn_third_upg_m4_m_quad"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_pmag.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_m_quad/wpn_fps_upg_m4_m_quad"
elseif WacMenu._data.replace_ar15_pmag == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_pmag.third_unit = "units/pd2_dlc_clover/weapons/wpn_third_ass_l85a2_pts/wpn_third_ass_l85a2_m_emag"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_pmag.unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_m_emag"
elseif WacMenu._data.replace_ar15_pmag == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_pmag.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_m_l5/wpn_third_upg_m4_m_l5"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_pmag.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_m_l5/wpn_fps_upg_m4_m_l5"
elseif WacMenu._data.replace_ar15_pmag == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_pmag.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_drum"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_pmag.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_drum"
elseif WacMenu._data.replace_ar15_pmag == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_pmag.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_aug_m_pmag"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_pmag.unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_m_pmag"
elseif WacMenu._data.replace_ar15_pmag == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_pmag.bullet_objects = {prefix = "g_bullet_", amount = 100}
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_pmag.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_m_drum"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_pmag.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_m_drum"
end
if WacMenu._data.replace_ar15_mag5 == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_quad.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_straight"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_quad.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_straight"
elseif WacMenu._data.replace_ar15_mag5 == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_quad.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_m_std"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_quad.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_m_std"
elseif WacMenu._data.replace_ar15_mag5 == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_quad.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_pmag"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_quad.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_pmag"
elseif WacMenu._data.replace_ar15_mag5 == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_quad.third_unit = "units/pd2_dlc_clover/weapons/wpn_third_ass_l85a2_pts/wpn_third_ass_l85a2_m_emag"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_quad.unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_m_emag"
elseif WacMenu._data.replace_ar15_mag5 == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_quad.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_m_l5/wpn_third_upg_m4_m_l5"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_quad.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_m_l5/wpn_fps_upg_m4_m_l5"
elseif WacMenu._data.replace_ar15_mag5 == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_quad.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_drum"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_quad.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_drum"
elseif WacMenu._data.replace_ar15_mag5 == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_quad.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_aug_m_pmag"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_quad.unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_m_pmag"
elseif WacMenu._data.replace_ar15_mag5 == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_quad.bullet_objects = {prefix = "g_bullet_", amount = 100}
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_quad.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_m_drum"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_quad.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_m_drum"
end
if WacMenu._data.replace_ar15_emag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_m_emag.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_straight"
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_m_emag.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_straight"
elseif WacMenu._data.replace_ar15_emag == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_m_emag.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_m_std"
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_m_emag.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_m_std"
elseif WacMenu._data.replace_ar15_emag == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_m_emag.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_pmag"
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_m_emag.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_pmag"
elseif WacMenu._data.replace_ar15_emag == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_m_emag.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_m4_m_quad/wpn_third_upg_m4_m_quad"
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_m_emag.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_m_quad/wpn_fps_upg_m4_m_quad"
elseif WacMenu._data.replace_ar15_emag == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_m_emag.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_m_l5/wpn_third_upg_m4_m_l5"
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_m_emag.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_m_l5/wpn_fps_upg_m4_m_l5"
elseif WacMenu._data.replace_ar15_emag == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_m_emag.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_drum"
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_m_emag.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_drum"
elseif WacMenu._data.replace_ar15_emag == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_m_emag.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_aug_m_pmag"
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_m_emag.unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_m_pmag"
elseif WacMenu._data.replace_ar15_emag == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_m_emag.bullet_objects = {prefix = "g_bullet_", amount = 100}
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_m_emag.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_m_drum"
	tweak_data.weapon.factory.parts.wpn_fps_ass_l85a2_m_emag.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_m_drum"
end
if WacMenu._data.replace_ar15_l5 == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_l5.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_straight"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_l5.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_straight"
elseif WacMenu._data.replace_ar15_l5 == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_l5.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_m_std"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_l5.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_m_std"
elseif WacMenu._data.replace_ar15_l5 == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_l5.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_pmag"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_l5.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_pmag"
elseif WacMenu._data.replace_ar15_l5 == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_l5.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_m4_m_quad/wpn_third_upg_m4_m_quad"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_l5.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_m_quad/wpn_fps_upg_m4_m_quad"
elseif WacMenu._data.replace_ar15_l5 == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_l5.third_unit = "units/pd2_dlc_clover/weapons/wpn_third_ass_l85a2_pts/wpn_third_ass_l85a2_m_emag"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_l5.unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_m_emag"
elseif WacMenu._data.replace_ar15_l5 == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_l5.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_drum"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_l5.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_drum"
elseif WacMenu._data.replace_ar15_l5 == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_l5.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_aug_m_pmag"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_l5.unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_m_pmag"
elseif WacMenu._data.replace_ar15_l5 == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_l5.bullet_objects = {prefix = "g_bullet_", amount = 100}
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_l5.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_m_drum"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_m_l5.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_m_drum"
end
if WacMenu._data.replace_ar15_magpulassiststanag == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upg_m_quick.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_straight"
	tweak_data.weapon.factory.parts.wpn_fps_m4_upg_m_quick.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_straight"
elseif WacMenu._data.replace_ar15_magpulassiststanag == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upg_m_quick.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_m_std"
	tweak_data.weapon.factory.parts.wpn_fps_m4_upg_m_quick.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_m_std"
elseif WacMenu._data.replace_ar15_magpulassiststanag == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upg_m_quick.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_pmag"
	tweak_data.weapon.factory.parts.wpn_fps_m4_upg_m_quick.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_pmag"
elseif WacMenu._data.replace_ar15_magpulassiststanag == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upg_m_quick.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_m4_m_quad/wpn_third_upg_m4_m_quad"
	tweak_data.weapon.factory.parts.wpn_fps_m4_upg_m_quick.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_m_quad/wpn_fps_upg_m4_m_quad"
elseif WacMenu._data.replace_ar15_magpulassiststanag == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upg_m_quick.third_unit = "units/pd2_dlc_clover/weapons/wpn_third_ass_l85a2_pts/wpn_third_ass_l85a2_m_emag"
	tweak_data.weapon.factory.parts.wpn_fps_m4_upg_m_quick.unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_m_emag"
elseif WacMenu._data.replace_ar15_magpulassiststanag == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upg_m_quick.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_m_l5/wpn_third_upg_m4_m_l5"
	tweak_data.weapon.factory.parts.wpn_fps_m4_upg_m_quick.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_m_l5/wpn_fps_upg_m4_m_l5"
elseif WacMenu._data.replace_ar15_magpulassiststanag == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upg_m_quick.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_drum"
	tweak_data.weapon.factory.parts.wpn_fps_m4_upg_m_quick.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_drum"
elseif WacMenu._data.replace_ar15_magpulassiststanag == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upg_m_quick.third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_aug_m_pmag"
	tweak_data.weapon.factory.parts.wpn_fps_m4_upg_m_quick.unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_m_pmag"
elseif WacMenu._data.replace_ar15_magpulassiststanag == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upg_m_quick.bullet_objects = {prefix = "g_bullet_", amount = 100}
	tweak_data.weapon.factory.parts.wpn_fps_m4_upg_m_quick.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_m_drum"
	tweak_data.weapon.factory.parts.wpn_fps_m4_upg_m_quick.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_m_drum"
end
if WacMenu._data.replace_keep_frontpost == true then
local unforbids = {"wpn_fps_ass_m16_os_frontsight"}
for id, data in pairs(tweak_data.weapon.factory.parts) do
	if data.forbids then
		for i = #data.forbids, 1, -1 do
			if table.contains(unforbids, data.forbids[i]) then
				table.remove(data.forbids, i)
			end
		end
	end
end
if not tweak_data.weapon.factory.wpn_fps_ass_amcar.adds then
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds = {}
end
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds.wpn_fps_upg_o_specter = {"wpn_fps_m4_upper_reciever_round_vanilla","wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext","wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds.wpn_fps_upg_o_aimpoint = {"wpn_fps_m4_upper_reciever_round_vanilla","wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext","wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds.wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_m4_upper_reciever_round_vanilla","wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext","wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds.wpn_fps_upg_o_docter = {"wpn_fps_m4_upper_reciever_round_vanilla","wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext","wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds.wpn_fps_upg_o_eotech = {"wpn_fps_m4_upper_reciever_round_vanilla","wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext","wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds.wpn_fps_upg_o_t1micro = {"wpn_fps_m4_upper_reciever_round_vanilla","wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext","wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds.wpn_fps_upg_o_cmore = {"wpn_fps_m4_upper_reciever_round_vanilla","wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext","wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds.wpn_fps_upg_o_acog = {"wpn_fps_m4_upper_reciever_round_vanilla","wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext","wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds.wpn_fps_upg_o_eotech_xps = {"wpn_fps_m4_upper_reciever_round_vanilla","wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext","wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds.wpn_fps_upg_o_rx01 = {"wpn_fps_m4_upper_reciever_round_vanilla","wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext","wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds.wpn_fps_upg_o_rx30 = {"wpn_fps_m4_upper_reciever_round_vanilla","wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext","wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds.wpn_fps_upg_o_cs = {"wpn_fps_m4_upper_reciever_round_vanilla","wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext","wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds.wpn_fps_upg_o_reflex = {"wpn_fps_m4_upper_reciever_round_vanilla","wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext","wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_amcar.adds.wpn_fps_upg_o_spot = {"wpn_fps_m4_upper_reciever_round_vanilla","wpn_fps_m4_uupg_draghandle_vanilla","wpn_fps_m4_uupg_fg_rail_ext","wpn_fps_ass_m16_os_frontsight"}
if not tweak_data.weapon.factory.wpn_fps_ass_m16.adds then
	tweak_data.weapon.factory.wpn_fps_ass_m16.adds = {}
end
	tweak_data.weapon.factory.wpn_fps_ass_m16.adds.wpn_fps_upg_o_specter = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_m16.adds.wpn_fps_upg_o_aimpoint = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_m16.adds.wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_m16.adds.wpn_fps_upg_o_docter = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_m16.adds.wpn_fps_upg_o_eotech = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_m16.adds.wpn_fps_upg_o_t1micro = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_m16.adds.wpn_fps_upg_o_cmore = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_m16.adds.wpn_fps_upg_o_acog = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_m16.adds.wpn_fps_upg_o_eotech_xps = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_m16.adds.wpn_fps_upg_o_rx01 = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_m16.adds.wpn_fps_upg_o_rx30 = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_m16.adds.wpn_fps_upg_o_cs = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_m16.adds.wpn_fps_upg_o_reflex = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_ass_m16.adds.wpn_fps_upg_o_spot = {"wpn_fps_ass_m16_os_frontsight"}
if not tweak_data.weapon.factory.wpn_fps_smg_olympic.adds then
	tweak_data.weapon.factory.wpn_fps_smg_olympic.adds = {}
end
	tweak_data.weapon.factory.wpn_fps_smg_olympic.adds.wpn_fps_upg_o_specter = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_smg_olympic.adds.wpn_fps_upg_o_aimpoint = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_smg_olympic.adds.wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_smg_olympic.adds.wpn_fps_upg_o_docter = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_smg_olympic.adds.wpn_fps_upg_o_eotech = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_smg_olympic.adds.wpn_fps_upg_o_t1micro = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_smg_olympic.adds.wpn_fps_upg_o_cmore = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_smg_olympic.adds.wpn_fps_upg_o_acog = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_smg_olympic.adds.wpn_fps_upg_o_eotech_xps = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_smg_olympic.adds.wpn_fps_upg_o_rx01 = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_smg_olympic.adds.wpn_fps_upg_o_rx30 = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_smg_olympic.adds.wpn_fps_upg_o_cs = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_smg_olympic.adds.wpn_fps_upg_o_reflex = {"wpn_fps_ass_m16_os_frontsight"}
	tweak_data.weapon.factory.wpn_fps_smg_olympic.adds.wpn_fps_upg_o_spot = {"wpn_fps_ass_m16_os_frontsight"}
end
if WacMenu._data.replace_m4_s_ubr == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_ubr.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_third_upg_m4_s_crane"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_ubr.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_fps_upg_m4_s_crane"
elseif WacMenu._data.replace_m4_s_ubr == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_ubr.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_ubr.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard"
elseif WacMenu._data.replace_m4_s_ubr == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_ubr.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_pts"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_ubr.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_pts"
elseif WacMenu._data.replace_m4_s_ubr == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_ubr.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_s_vltor"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_ubr.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_s_vltor"
end
if WacMenu._data.replace_m4_s_mk46 == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_mk46.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_third_upg_m4_s_crane"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_mk46.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_fps_upg_m4_s_crane"
elseif WacMenu._data.replace_m4_s_mk46 == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_mk46.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_s_ubr/wpn_third_upg_m4_s_ubr"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_mk46.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_s_ubr/wpn_fps_upg_m4_s_ubr"
elseif WacMenu._data.replace_m4_s_mk46 == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_mk46.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_mk46.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard"
elseif WacMenu._data.replace_m4_s_mk46 == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_mk46.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_pts"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_mk46.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_pts"
elseif WacMenu._data.replace_m4_s_mk46 == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_mk46.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_s_vltor"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_mk46.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_s_vltor"
end
if WacMenu._data.replace_m4_s_crane == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_crane.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_s_ubr/wpn_third_upg_m4_s_ubr"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_crane.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_s_ubr/wpn_fps_upg_m4_s_ubr"
elseif WacMenu._data.replace_m4_s_crane == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_crane.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_crane.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard"
elseif WacMenu._data.replace_m4_s_crane == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_crane.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_pts"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_crane.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_pts"
elseif WacMenu._data.replace_m4_s_crane == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_crane.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_s_vltor"
	tweak_data.weapon.factory.parts.wpn_fps_upg_m4_s_crane.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_s_vltor"
end
if WacMenu._data.replace_ar15roundupper == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_round.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_edge"
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_round.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_edge"
elseif WacMenu._data.replace_ar15roundupper == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_round.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_upper_reciever_ballos/wpn_third_upg_ass_m4_upper_reciever_ballos"
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_round.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_upper_reciever_ballos/wpn_fps_upg_ass_m4_upper_reciever_ballos"
elseif WacMenu._data.replace_ar15roundupper == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_round.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_upper_reciever_core/wpn_third_upg_ass_m4_upper_reciever_core"
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_round.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_upper_reciever_core/wpn_fps_upg_ass_m4_upper_reciever_core"
end
if WacMenu._data.replace_ar15roundbolt == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_round.override.wpn_fps_amcar_bolt_standard = {unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_bolt_edge"}
elseif WacMenu._data.replace_ar15roundbolt == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_round.override.wpn_fps_amcar_bolt_standard = {unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_bolt_ballos/wpn_fps_upg_ass_m4_bolt_ballos"}
elseif WacMenu._data.replace_ar15roundbolt == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_round.override.wpn_fps_amcar_bolt_standard = {unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_bolt_core/wpn_fps_upg_ass_m4_bolt_core"}
end
if WacMenu._data.replace_ar15roundhandle == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_round.override.wpn_fps_m4_uupg_draghandle = {unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_m4_uupg_draghandle_ballos/wpn_fps_m4_uupg_draghandle_ballos"}
elseif WacMenu._data.replace_ar15roundhandle == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_round.override.wpn_fps_m4_uupg_draghandle = {unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_m4_uupg_draghandle_core/wpn_fps_m4_uupg_draghandle_core"}
end
if WacMenu._data.replace_ar15vltorupper == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_edge.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_round"
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_edge.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round"
elseif WacMenu._data.replace_ar15vltorupper == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_edge.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_upper_reciever_ballos/wpn_third_upg_ass_m4_upper_reciever_ballos"
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_edge.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_upper_reciever_ballos/wpn_fps_upg_ass_m4_upper_reciever_ballos"
elseif WacMenu._data.replace_ar15vltorupper == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_edge.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_upper_reciever_core/wpn_third_upg_ass_m4_upper_reciever_core"
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_edge.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_upper_reciever_core/wpn_fps_upg_ass_m4_upper_reciever_core"
end
if WacMenu._data.replace_ar15vltorbolt == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_edge.override.wpn_fps_amcar_bolt_standard = {unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_bolt_round"}
elseif WacMenu._data.replace_ar15vltorbolt == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_edge.override.wpn_fps_amcar_bolt_standard = {unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_bolt_ballos/wpn_fps_upg_ass_m4_bolt_ballos"}
elseif WacMenu._data.replace_ar15vltorbolt == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_edge.override.wpn_fps_amcar_bolt_standard = {unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_bolt_core/wpn_fps_upg_ass_m4_bolt_core"}
end
if WacMenu._data.replace_ar15vltorhandle == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_edge.override.wpn_fps_m4_uupg_draghandle = {unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_m4_uupg_draghandle_ballos/wpn_fps_m4_uupg_draghandle_ballos"}
elseif WacMenu._data.replace_ar15vltorhandle == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_m4_upper_reciever_edge.override.wpn_fps_m4_uupg_draghandle = {unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_m4_uupg_draghandle_core/wpn_fps_m4_uupg_draghandle_core"}
end
if WacMenu._data.replace_ar15baliosupper == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_round"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round"
elseif WacMenu._data.replace_ar15baliosupper == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_edge"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_edge"
elseif WacMenu._data.replace_ar15baliosupper == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_upper_reciever_core/wpn_third_upg_ass_m4_upper_reciever_core"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_upper_reciever_core/wpn_fps_upg_ass_m4_upper_reciever_core"
end
if WacMenu._data.replace_ar15baliosbolt == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.override.wpn_fps_amcar_bolt_standard = {unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_bolt_round"}
elseif WacMenu._data.replace_ar15baliosbolt == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.override.wpn_fps_amcar_bolt_standard = {unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_bolt_edge"}
elseif WacMenu._data.replace_ar15baliosbolt == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.override.wpn_fps_amcar_bolt_standard = {unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_bolt_core/wpn_fps_upg_ass_m4_bolt_core"}
end
if WacMenu._data.replace_ar15balioshandle == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.override.wpn_fps_m4_uupg_draghandle = {}
elseif WacMenu._data.replace_ar15balioshandle == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.override.wpn_fps_m4_uupg_draghandle = {unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_m4_uupg_draghandle_core/wpn_fps_m4_uupg_draghandle_core"}
end
if WacMenu._data.replace_ar15coreupper == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_core.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_round"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_core.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_round"
elseif WacMenu._data.replace_ar15coreupper == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_core.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_edge"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_core.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_edge"
elseif WacMenu._data.replace_ar15coreupper == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_core.third_unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_upper_reciever_ballos/wpn_third_upg_ass_m4_upper_reciever_ballos"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_core.unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_upper_reciever_ballos/wpn_fps_upg_ass_m4_upper_reciever_ballos"
end
if WacMenu._data.replace_ar15corelower == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_lower_reciever_core.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_lower_reciever"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_lower_reciever_core.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_lower_reciever"
end
if WacMenu._data.replace_ar15corebolt == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_core.override.wpn_fps_amcar_bolt_standard = {unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_bolt_round"}
elseif WacMenu._data.replace_ar15corebolt == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_core.override.wpn_fps_amcar_bolt_standard = {unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_bolt_edge"}
elseif WacMenu._data.replace_ar15corebolt == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_core.override.wpn_fps_amcar_bolt_standard = {unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_bolt_ballos/wpn_fps_upg_ass_m4_bolt_ballos"}
end
if WacMenu._data.replace_ar15corehandle == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_core.override.wpn_fps_m4_uupg_draghandle = {}
elseif WacMenu._data.replace_ar15corehandle == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_m4_upper_reciever_core.override.wpn_fps_m4_uupg_draghandle = {unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_m4_uupg_draghandle_ballos/wpn_fps_m4_uupg_draghandle_ballos"}
end
local usebarrelext = {}
usebarrelext.tweak = "tweak_data.weapon.factory.parts."
usebarrelext.dummy = " = \"units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy\""
if WacMenu._data.replace_selectablebarrelext == 2 then
usebarrelext.model = " = \"units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_ns_standard\""
usebarrelext.thirdmodel = " = \"units/pd2_dlc_clover/weapons/wpn_third_ass_l85a2_pts/wpn_third_ass_l85a2_ns_standard\""
elseif WacMenu._data.replace_selectablebarrelext == 3 then
usebarrelext.model = " = \"units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_fps_ass_vhs_ns_vhs\""
usebarrelext.thirdmodel = " = \"units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_third_ass_vhs_ns_vhs\""
elseif WacMenu._data.replace_selectablebarrelext == 4 then
usebarrelext.model = " = \"units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_ns_standard\""
usebarrelext.thirdmodel = " = \"nits/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_ns_standard\""
elseif WacMenu._data.replace_selectablebarrelext == 5 then
usebarrelext.model = " = \"units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_ns_special\""
usebarrelext.thirdmodel = " = \"units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_ns_special\""
elseif WacMenu._data.replace_selectablebarrelext == 6 then
usebarrelext.model = " = \"units/pd2_dlc_born/weapons/wpn_fps_smg_hajk_pts/wpn_fps_smg_hajk_ns_standard\""
usebarrelext.thirdmodel = " = \"units/pd2_dlc_born/weapons/wpn_third_smg_hajk_pts/wpn_third_smg_hajk_ns_standard\""
else
usebarrelext.model = " = \"units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_ns_standard\""
usebarrelext.thirdmodel = " = \"units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_ns_standard\""
end
if WacMenu._data.replace_selectablebarrelext2 == 2 then
usebarrelext.model2 = " = \"units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_ns_standard\""
usebarrelext.thirdmodel2 = " = \"units/pd2_dlc_clover/weapons/wpn_third_ass_l85a2_pts/wpn_third_ass_l85a2_ns_standard\""
elseif WacMenu._data.replace_selectablebarrelext2 == 3 then
usebarrelext.model2 = " = \"units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_fps_ass_vhs_ns_vhs\""
usebarrelext.thirdmodel2 = " = \"units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_third_ass_vhs_ns_vhs\""
elseif WacMenu._data.replace_selectablebarrelext2 == 4 then
usebarrelext.model2 = " = \"units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_ns_standard\""
usebarrelext.thirdmodel2 = " = \"nits/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_ns_standard\""
elseif WacMenu._data.replace_selectablebarrelext2 == 5 then
usebarrelext.model2 = " = \"units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_ns_special\""
usebarrelext.thirdmodel2 = " = \"units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_ns_special\""
elseif WacMenu._data.replace_selectablebarrelext2 == 6 then
usebarrelext.model2 = " = \"units/pd2_dlc_born/weapons/wpn_fps_smg_hajk_pts/wpn_fps_smg_hajk_ns_standard\""
usebarrelext.thirdmodel2 = " = \"units/pd2_dlc_born/weapons/wpn_third_smg_hajk_pts/wpn_third_smg_hajk_ns_standard\""
else
usebarrelext.model2 = " = \"units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_ns_standard\""
usebarrelext.thirdmodel2 = " = \"units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_ns_standard\""
end
if WacMenu._data.replace_jprifles == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_firepig/wpn_third_upg_ns_ass_smg_firepig"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_firepig/wpn_fps_upg_ns_ass_smg_firepig"
elseif WacMenu._data.replace_jprifles == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_tank/wpn_third_upg_ns_ass_smg_tank"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_tank/wpn_fps_upg_ns_ass_smg_tank"
elseif WacMenu._data.replace_jprifles == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_stubby/wpn_third_upg_ns_ass_smg_stubby"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_stubby/wpn_fps_upg_ns_ass_smg_stubby"
elseif WacMenu._data.replace_jprifles == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_surefire"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_surefire"
elseif WacMenu._data.replace_jprifles == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_linear"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_linear"
elseif WacMenu._data.replace_jprifles == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ass_ns_battle/wpn_third_upg_ass_ns_battle"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ass_ns_battle/wpn_fps_upg_ass_ns_battle"
elseif WacMenu._data.replace_jprifles == 8 then
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_jprifles.third_unit" .. usebarrelext.thirdmodel))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_jprifles.unit" .. usebarrelext.model))()
elseif WacMenu._data.replace_jprifles == 9 then
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_jprifles.third_unit" .. usebarrelext.thirdmodel2))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_jprifles.unit" .. usebarrelext.model2))()
elseif WacMenu._data.replace_jprifles == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_jprifles.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_firepig == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_jprifles"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_jprifles"
elseif WacMenu._data.replace_firepig == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_tank/wpn_third_upg_ns_ass_smg_tank"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_tank/wpn_fps_upg_ns_ass_smg_tank"
elseif WacMenu._data.replace_firepig == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_stubby/wpn_third_upg_ns_ass_smg_stubby"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_stubby/wpn_fps_upg_ns_ass_smg_stubby"
elseif WacMenu._data.replace_firepig == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_surefire"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_surefire"
elseif WacMenu._data.replace_firepig == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_linear"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_linear"
elseif WacMenu._data.replace_firepig == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ass_ns_battle/wpn_third_upg_ass_ns_battle"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ass_ns_battle/wpn_fps_upg_ass_ns_battle"
elseif WacMenu._data.replace_firepig == 8 then
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_ass_smg_firepig.third_unit" .. usebarrelext.thirdmodel))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_ass_smg_firepig.unit" .. usebarrelext.model))()
elseif WacMenu._data.replace_firepig == 9 then
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_ass_smg_firepig.third_unit" .. usebarrelext.thirdmodel2))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_ass_smg_firepig.unit" .. usebarrelext.model2))()
elseif WacMenu._data.replace_firepig == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_firepig.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_linear == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_jprifles"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_jprifles"
elseif WacMenu._data.replace_linear == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_firepig/wpn_third_upg_ns_ass_smg_firepig"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_firepig/wpn_fps_upg_ns_ass_smg_firepig"
elseif WacMenu._data.replace_linear == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_tank/wpn_third_upg_ns_ass_smg_tank"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_tank/wpn_fps_upg_ns_ass_smg_tank"
elseif WacMenu._data.replace_linear == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_stubby/wpn_third_upg_ns_ass_smg_stubby"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_stubby/wpn_fps_upg_ns_ass_smg_stubby"
elseif WacMenu._data.replace_linear == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_surefire"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_surefire"
elseif WacMenu._data.replace_linear == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ass_ns_battle/wpn_third_upg_ass_ns_battle"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ass_ns_battle/wpn_fps_upg_ass_ns_battle"
elseif WacMenu._data.replace_linear == 8 then
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_linear.third_unit" .. usebarrelext.thirdmodel))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_linear.unit" .. usebarrelext.model))()
elseif WacMenu._data.replace_linear == 9 then
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_linear.third_unit" .. usebarrelext.thirdmodel2))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_linear.unit" .. usebarrelext.model2))()
elseif WacMenu._data.replace_linear == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_linear.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_stubby == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_jprifles"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_jprifles"
elseif WacMenu._data.replace_stubby == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_firepig/wpn_third_upg_ns_ass_smg_firepig"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_firepig/wpn_fps_upg_ns_ass_smg_firepig"
elseif WacMenu._data.replace_stubby == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_tank/wpn_third_upg_ns_ass_smg_tank"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_tank/wpn_fps_upg_ns_ass_smg_tank"
elseif WacMenu._data.replace_stubby == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_surefire"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_surefire"
elseif WacMenu._data.replace_stubby == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_linear"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_linear"
elseif WacMenu._data.replace_stubby == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ass_ns_battle/wpn_third_upg_ass_ns_battle"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ass_ns_battle/wpn_fps_upg_ass_ns_battle"
elseif WacMenu._data.replace_stubby == 8 then
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_ass_smg_stubby.third_unit" .. usebarrelext.thirdmodel))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_ass_smg_stubby.unit" .. usebarrelext.model))()
elseif WacMenu._data.replace_stubby == 9 then
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_ass_smg_stubby.third_unit" .. usebarrelext.thirdmodel2))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_ass_smg_stubby.unit" .. usebarrelext.model2))()
elseif WacMenu._data.replace_stubby == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_stubby.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_surefire == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_jprifles"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_jprifles"
elseif WacMenu._data.replace_surefire == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_firepig/wpn_third_upg_ns_ass_smg_firepig"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_firepig/wpn_fps_upg_ns_ass_smg_firepig"
elseif WacMenu._data.replace_surefire == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_tank/wpn_third_upg_ns_ass_smg_tank"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_tank/wpn_fps_upg_ns_ass_smg_tank"
elseif WacMenu._data.replace_surefire == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_stubby/wpn_third_upg_ns_ass_smg_stubby"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_stubby/wpn_fps_upg_ns_ass_smg_stubby"
elseif WacMenu._data.replace_surefire == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_ass_ns_linear"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_linear"
elseif WacMenu._data.replace_surefire == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ass_ns_battle/wpn_third_upg_ass_ns_battle"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ass_ns_battle/wpn_fps_upg_ass_ns_battle"
elseif WacMenu._data.replace_surefire == 8 then
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_surefire.third_unit" .. usebarrelext.thirdmodel))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_surefire.unit" .. usebarrelext.model))()
elseif WacMenu._data.replace_surefire == 9 then
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_surefire.third_unit" .. usebarrelext.thirdmodel2))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_surefire.unit" .. usebarrelext.model2))()
elseif WacMenu._data.replace_surefire == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ass_ns_surefire.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_kingbreach == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_shot_ns_king.third_unit = "units/payday2/weapons/wpn_third_upg_ns_shot_shark/wpn_third_upg_ns_shot_shark"
	tweak_data.weapon.factory.parts.wpn_fps_upg_shot_ns_king.unit = "units/payday2/weapons/wpn_fps_upg_ns_shot_shark/wpn_fps_upg_ns_shot_shark"
elseif WacMenu._data.replace_kingbreach == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_shot_ns_king.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_firepig/wpn_third_upg_ns_ass_smg_firepig"
	tweak_data.weapon.factory.parts.wpn_fps_upg_shot_ns_king.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_firepig/wpn_fps_upg_ns_ass_smg_firepig"
elseif WacMenu._data.replace_kingbreach == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_shot_ns_king.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_stubby/wpn_third_upg_ns_ass_smg_stubby"
	tweak_data.weapon.factory.parts.wpn_fps_upg_shot_ns_king.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_stubby/wpn_fps_upg_ns_ass_smg_stubby"
elseif WacMenu._data.replace_kingbreach == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_shot_ns_king.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_shot_ns_king.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_sharkbrake == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_shot_shark.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_shot_ns_king"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_shot_shark.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_shot_ns_king"
elseif WacMenu._data.replace_sharkbrake == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_shot_shark.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_firepig/wpn_third_upg_ns_ass_smg_firepig"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_shot_shark.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_firepig/wpn_fps_upg_ns_ass_smg_firepig"
elseif WacMenu._data.replace_kingbreach == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_shot_ns_king.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_stubby/wpn_third_upg_ns_ass_smg_stubby"
	tweak_data.weapon.factory.parts.wpn_fps_upg_shot_ns_king.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_stubby/wpn_fps_upg_ns_ass_smg_stubby"
elseif WacMenu._data.replace_sharkbrake == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_shot_shark.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_shot_shark.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_duckbill == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_duck.third_unit = "units/payday2/weapons/wpn_third_upg_ns_shot_shark/wpn_third_upg_ns_shot_shark"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_duck.unit = "units/payday2/weapons/wpn_fps_upg_ns_shot_shark/wpn_fps_upg_ns_shot_shark"
elseif WacMenu._data.replace_duckbill == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_duck.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_shot_ns_king"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_duck.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_shot_ns_king"
elseif WacMenu._data.replace_duckbill == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_duck.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_firepig/wpn_third_upg_ns_ass_smg_firepig"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_duck.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_firepig/wpn_fps_upg_ns_ass_smg_firepig"
elseif WacMenu._data.replace_duckbill == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_duck.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_stubby/wpn_third_upg_ns_ass_smg_stubby"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_duck.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_stubby/wpn_fps_upg_ns_ass_smg_stubby"
elseif WacMenu._data.replace_duckbill == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_duck.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_duck.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_pisflashhider == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_pis_ns_flash.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_third_upg_ns_pis_meatgrinder/wpn_third_upg_ns_pis_meatgrinder"
	tweak_data.weapon.factory.parts.wpn_fps_upg_pis_ns_flash.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_meatgrinder/wpn_fps_upg_ns_pis_meatgrinder"
elseif WacMenu._data.replace_pisflashhider == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_pis_ns_flash.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_pis_ns_flash.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_pistenderizer == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_meatgrinder.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_pis_ns_flash"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_meatgrinder.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_pis_ns_flash"
elseif WacMenu._data.replace_pistenderizer == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_meatgrinder.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_meatgrinder.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_ipsccomp == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_ipsccomp.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_pis_ns_flash"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_ipsccomp.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_pis_ns_flash"
elseif WacMenu._data.replace_ipsccomp == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_ipsccomp.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_third_upg_ns_pis_meatgrinder/wpn_third_upg_ns_pis_meatgrinder"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_ipsccomp.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_meatgrinder/wpn_fps_upg_ns_pis_meatgrinder"
elseif WacMenu._data.replace_ipsccomp == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_ipsccomp.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_ipsccomp.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_hidebarrelextarsmg == true then
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_ass_smg_firepig.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_ass_smg_firepig.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_ass_smg_stubby.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_ass_smg_stubby.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_ass_smg_tank.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_ass_smg_tank.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_jprifles.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_jprifles.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_linear.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_linear.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_surefire.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_surefire.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_battle.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ass_ns_battle.unit" .. usebarrelext.dummy))()
end
if WacMenu._data.replace_hidebarrelextsh == true then
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_shot_shark.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_shot_shark.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_shot_ns_king.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_shot_ns_king.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_duck.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_duck.unit" .. usebarrelext.dummy))()
end
if WacMenu._data.replace_hidebarrelextpis == true then
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_pis_ns_flash.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_pis_ns_flash.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_pis_meatgrinder.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_pis_meatgrinder.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_pis_ipsccomp.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_upg_ns_pis_ipsccomp.unit" .. usebarrelext.dummy))()
end
if WacMenu._data.replace_hidebarrelextunique == true then
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_g18c_co_1.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_g18c_co_1.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_g18c_co_comp_2.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_g18c_co_comp_2.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_deagle_co_long.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_deagle_co_long.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_deagle_co_short.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_deagle_co_short.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_1911_co_1.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_1911_co_1.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_1911_co_2.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_1911_co_2.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_beretta_co_co1.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_beretta_co_co1.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_beretta_co_co2.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_beretta_co_co2.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_usp_co_comp_1.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_usp_co_comp_1.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_usp_co_comp_2.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_usp_co_comp_2.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_p226_co_comp_1.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_p226_co_comp_1.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_p226_co_comp_2.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_p226_co_comp_2.unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_c96_nozzle.third_unit" .. usebarrelext.dummy))()
assert(loadstring(usebarrelext.tweak .. "wpn_fps_pis_c96_nozzle.unit" .. usebarrelext.dummy))()
end
if WacMenu._data.replace_compactlaser == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_laser.third_unit = "units/payday2/weapons/wpn_third_upg_fl_ass_smg_sho_peqbox/wpn_third_upg_fl_ass_smg_sho_peqbox"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_laser.unit = "units/payday2/weapons/wpn_fps_upg_fl_ass_smg_sho_peqbox/wpn_fps_upg_fl_ass_smg_sho_peqbox"
elseif WacMenu._data.replace_compactlaser == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_laser.third_unit = "units/payday2/weapons/wpn_third_upg_fl_ass_smg_sho_surefire/wpn_third_upg_fl_ass_smg_sho_surefire"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_laser.unit = "units/payday2/weapons/wpn_fps_upg_fl_ass_smg_sho_surefire/wpn_fps_upg_fl_ass_smg_sho_surefire"
end
if WacMenu._data.replace_peq15 == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_peq15.adds = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_peq15.third_unit = "units/payday2/weapons/wpn_third_upg_fl_ass_smg_sho_peqbox/wpn_third_upg_fl_ass_smg_sho_peqbox"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_peq15.unit = "units/payday2/weapons/wpn_fps_upg_fl_ass_smg_sho_peqbox/wpn_fps_upg_fl_ass_smg_sho_peqbox"
elseif WacMenu._data.replace_peq15 == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_peq15.adds = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_peq15.third_unit = "units/payday2/weapons/wpn_third_upg_fl_ass_smg_sho_surefire/wpn_third_upg_fl_ass_smg_sho_surefire"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_peq15.unit = "units/payday2/weapons/wpn_fps_upg_fl_ass_smg_sho_surefire/wpn_fps_upg_fl_ass_smg_sho_surefire"
end
if WacMenu._data.replace_utg == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_utg.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fl_ass_peq15/wpn_third_upg_fl_ass_peq15"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_utg.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fl_ass_peq15/wpn_fps_upg_fl_ass_peq15"
elseif WacMenu._data.replace_utg == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_utg.adds = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_utg.third_unit = "units/payday2/weapons/wpn_third_upg_fl_ass_smg_sho_peqbox/wpn_third_upg_fl_ass_smg_sho_peqbox"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_utg.unit = "units/payday2/weapons/wpn_fps_upg_fl_ass_smg_sho_peqbox/wpn_fps_upg_fl_ass_smg_sho_peqbox"
elseif WacMenu._data.replace_utg == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_utg.adds = {"wpn_fps_addon_ris"}
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_utg.third_unit = "units/payday2/weapons/wpn_third_upg_fl_ass_smg_sho_surefire/wpn_third_upg_fl_ass_smg_sho_surefire"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_ass_utg.unit = "units/payday2/weapons/wpn_fps_upg_fl_ass_smg_sho_surefire/wpn_fps_upg_fl_ass_smg_sho_surefire"
end
if WacMenu._data.replace_x400v == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_pis_x400v.adds = {}
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_pis_x400v.third_unit = "units/payday2/weapons/wpn_third_upg_fl_pis_laser/wpn_third_upg_fl_pis_laser"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_pis_x400v.unit = "units/payday2/weapons/wpn_fps_upg_fl_pis_laser/wpn_fps_upg_fl_pis_laser"
elseif WacMenu._data.replace_x400v == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_pis_x400v.adds = {}
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_pis_x400v.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_third_upg_fl_pis_crimson/wpn_third_upg_fl_pis_crimson"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_pis_x400v.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_fl_pis_crimson/wpn_fps_upg_fl_pis_crimson"
end
if WacMenu._data.replace_cmr201 == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_pis_crimson.third_unit = "units/payday2/weapons/wpn_third_upg_fl_pis_laser/wpn_third_upg_fl_pis_laser"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_pis_crimson.unit = "units/payday2/weapons/wpn_fps_upg_fl_pis_laser/wpn_fps_upg_fl_pis_laser"
end
if WacMenu._data.replace_m3x == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_pis_m3x.third_unit = "units/payday2/weapons/wpn_third_upg_fl_pis_tlr1/wpn_third_upg_fl_pis_tlr1"
	tweak_data.weapon.factory.parts.wpn_fps_upg_fl_pis_m3x.unit = "units/payday2/weapons/wpn_fps_upg_fl_pis_tlr1/wpn_fps_upg_fl_pis_tlr1"
end
if WacMenu._data.replace_glockcrimsonlaser == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_g26_g_laser.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_pis_g26_g_laser.unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fl_legend"
end
if WacMenu._data.replace_glockgripcytec == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_g26_g_gripforce.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_pis_g26_g_gripforce.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_glockgriphogue == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_g_ergo.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_pis_g18c_g_ergo.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
local usesupp = {}
usesupp.tweak = "tweak_data.weapon.factory.parts."
usesupp.dummy = " = \"units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy\""
usesupp.mp7third = " = \"units/pd2_dlc_dec5/weapons/wpn_third_smg_mp7_pts/wpn_third_smg_mp7_b_suppressed\""
usesupp.mp7 = " = \"units/pd2_dlc_dec5/weapons/wpn_fps_smg_mp7_pts/wpn_fps_smg_mp7_b_suppressed\""
usesupp.vectorthird = " = \"units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_third_smg_polymer_ns_silencer\""
usesupp.vector = " = \"units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_fps_smg_polymer_ns_silencer\""
usesupp.cobraythird = " = \"units/pd2_dlc_hotline2/weapons/wpn_fps_smg_cobray_pts/wpn_third_smg_cobray_ns_silencer\""
usesupp.cobray = " = \"units/pd2_dlc_hotline2/weapons/wpn_fps_smg_cobray_pts/wpn_fps_smg_cobray_ns_silencer\""
usesupp.sr2third = " = \"units/pd2_dlc_coco/weapons/wpn_fps_smg_sr2_parts/wpn_third_smg_sr2_ns_silencer\""
usesupp.sr2 = " = \"units/pd2_dlc_coco/weapons/wpn_fps_smg_sr2_parts/wpn_fps_smg_sr2_ns_silencer\""
usesupp.mp9third = " = \"units/pd2_dlc_butcher_mods/weapons/wpn_third_smg_mp9_b_suppressed/wpn_third_smg_mp9_b_suppressed\""
usesupp.mp9 = " = \"units/pd2_dlc_butcher_mods/weapons/wpn_fps_smg_mp9_b_suppressed/wpn_fps_smg_mp9_b_suppressed\""
usesupp.gm45third = " = \"units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_ns_silencer\""
usesupp.gm45 = " = \"units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_ns_silencer\""
if WacMenu._data.replace_selectablesupp == 2 then
usesupp.thirdmodel = usesupp.vectorthird
usesupp.model = usesupp.vector
elseif WacMenu._data.replace_selectablesupp == 3 then
usesupp.thirdmodel = usesupp.cobraythird
usesupp.model = usesupp.cobray
elseif WacMenu._data.replace_selectablesupp == 4 then
usesupp.thirdmodel = usesupp.mp9third
usesupp.model = usesupp.mp9
elseif WacMenu._data.replace_selectablesupp == 5 then
usesupp.thirdmodel = usesupp.sr2third
usesupp.model = usesupp.sr2
elseif WacMenu._data.replace_selectablesupp == 6 then
usesupp.thirdmodel = usesupp.gm45third
usesupp.model = usesupp.gm45
else
usesupp.thirdmodel = usesupp.mp7third
usesupp.model = usesupp.mp7
end
if WacMenu._data.replace_selectablesupp2 == 2 then
usesupp.thirdmodel2 = usesupp.vectorthird
usesupp.model2 = usesupp.vector
elseif WacMenu._data.replace_selectablesupp2 == 3 then
usesupp.thirdmodel2 = usesupp.cobraythird
usesupp.model2 = usesupp.cobray
elseif WacMenu._data.replace_selectablesupp2 == 4 then
usesupp.thirdmodel2 = usesupp.mp9third
usesupp.model2 = usesupp.mp9
elseif WacMenu._data.replace_selectablesupp2 == 5 then
usesupp.thirdmodel2 = usesupp.sr2third
usesupp.model2 = usesupp.sr2
elseif WacMenu._data.replace_selectablesupp2 == 6 then
usesupp.thirdmodel2 = usesupp.gm45third
usesupp.model2 = usesupp.gm45
else
usesupp.thirdmodel2 = usesupp.mp7third
usesupp.model2 = usesupp.mp7
end
if WacMenu._data.replace_arsupp_bigger == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_large.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_small/wpn_third_upg_ns_ass_smg_small"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_large.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_small/wpn_fps_upg_ns_ass_smg_small"
elseif WacMenu._data.replace_arsupp_bigger == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_large.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_medium/wpn_third_upg_ns_ass_smg_medium"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_large.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_medium/wpn_fps_upg_ns_ass_smg_medium"
elseif WacMenu._data.replace_arsupp_bigger == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_large.third_unit = "units/payday2/weapons/wpn_third_upg_ns_shot_thick/wpn_third_upg_ns_shot_thick"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_large.unit = "units/payday2/weapons/wpn_fps_upg_ns_shot_thick/wpn_fps_upg_ns_shot_thick"
elseif WacMenu._data.replace_arsupp_bigger == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_large.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ns_sho_salvo/wpn_third_upg_ns_sho_salvo_large"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_large.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ns_sho_salvo/wpn_fps_upg_ns_sho_salvo_large"
elseif WacMenu._data.replace_arsupp_bigger == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_large.third_unit = "units/payday2/weapons/wpn_third_upg_ns_pis_large/wpn_third_upg_ns_pis_large"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_large.unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_large/wpn_fps_upg_ns_pis_large"
elseif WacMenu._data.replace_arsupp_bigger == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_large.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ns_pis_medium_slim/wpn_third_upg_ns_pis_medium_slim"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_large.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ns_pis_medium_slim/wpn_fps_upg_ns_pis_medium_slim"
elseif WacMenu._data.replace_arsupp_bigger == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_large.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ns_ass_filter/wpn_third_upg_ns_ass_filter"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_large.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ns_ass_filter/wpn_fps_upg_ns_ass_filter"
elseif WacMenu._data.replace_arsupp_bigger == 9 then
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_smg_large.third_unit" .. usesupp.thirdmodel))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_smg_large.unit" .. usesupp.model))()
elseif WacMenu._data.replace_arsupp_bigger == 10 then
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_smg_large.third_unit" .. usesupp.thirdmodel2))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_smg_large.unit" .. usesupp.model2))()
end
if WacMenu._data.replace_arsupp_medium == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_medium.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_small/wpn_third_upg_ns_ass_smg_small"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_medium.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_small/wpn_fps_upg_ns_ass_smg_small"
elseif WacMenu._data.replace_arsupp_medium == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_medium.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_large/wpn_third_upg_ns_ass_smg_large"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_medium.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_large/wpn_fps_upg_ns_ass_smg_large"
elseif WacMenu._data.replace_arsupp_medium == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_medium.third_unit = "units/payday2/weapons/wpn_third_upg_ns_shot_thick/wpn_third_upg_ns_shot_thick"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_medium.unit = "units/payday2/weapons/wpn_fps_upg_ns_shot_thick/wpn_fps_upg_ns_shot_thick"
elseif WacMenu._data.replace_arsupp_medium == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_medium.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ns_sho_salvo/wpn_third_upg_ns_sho_salvo_large"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_medium.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ns_sho_salvo/wpn_fps_upg_ns_sho_salvo_large"
elseif WacMenu._data.replace_arsupp_medium == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_medium.third_unit = "units/payday2/weapons/wpn_third_upg_ns_pis_large/wpn_third_upg_ns_pis_large"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_medium.unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_large/wpn_fps_upg_ns_pis_large"
elseif WacMenu._data.replace_arsupp_medium == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_medium.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ns_pis_medium_slim/wpn_third_upg_ns_pis_medium_slim"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_medium.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ns_pis_medium_slim/wpn_fps_upg_ns_pis_medium_slim"
elseif WacMenu._data.replace_arsupp_medium == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_medium.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ns_ass_filter/wpn_third_upg_ns_ass_filter"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_medium.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ns_ass_filter/wpn_fps_upg_ns_ass_filter"
elseif WacMenu._data.replace_arsupp_medium == 9 then
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_smg_medium.third_unit" .. usesupp.thirdmodel))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_smg_medium.unit" .. usesupp.model))()
elseif WacMenu._data.replace_arsupp_medium == 10 then
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_smg_medium.third_unit" .. usesupp.thirdmodel2))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_smg_medium.unit" .. usesupp.model2))()
end
if WacMenu._data.replace_arsupp_lowprofile == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_small.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_large/wpn_third_upg_ns_ass_smg_large"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_small.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_large/wpn_fps_upg_ns_ass_smg_large"
elseif WacMenu._data.replace_arsupp_lowprofile == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_small.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_medium/wpn_third_upg_ns_ass_smg_medium"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_small.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_medium/wpn_fps_upg_ns_ass_smg_medium"
elseif WacMenu._data.replace_arsupp_lowprofile == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_small.third_unit = "units/payday2/weapons/wpn_third_upg_ns_shot_thick/wpn_third_upg_ns_shot_thick"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_small.unit = "units/payday2/weapons/wpn_fps_upg_ns_shot_thick/wpn_fps_upg_ns_shot_thick"
elseif WacMenu._data.replace_arsupp_lowprofile == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_small.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ns_sho_salvo/wpn_third_upg_ns_sho_salvo_large"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_small.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ns_sho_salvo/wpn_fps_upg_ns_sho_salvo_large"
elseif WacMenu._data.replace_arsupp_lowprofile == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_small.third_unit = "units/payday2/weapons/wpn_third_upg_ns_pis_large/wpn_third_upg_ns_pis_large"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_small.unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_large/wpn_fps_upg_ns_pis_large"
elseif WacMenu._data.replace_arsupp_lowprofile == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_small.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ns_pis_medium_slim/wpn_third_upg_ns_pis_medium_slim"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_small.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ns_pis_medium_slim/wpn_fps_upg_ns_pis_medium_slim"
elseif WacMenu._data.replace_arsupp_lowprofile == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_small.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ns_ass_filter/wpn_third_upg_ns_ass_filter"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_ass_smg_small.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ns_ass_filter/wpn_fps_upg_ns_ass_filter"
elseif WacMenu._data.replace_arsupp_lowprofile == 9 then
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_smg_small.third_unit" .. usesupp.thirdmodel))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_smg_small.unit" .. usesupp.model))()
elseif WacMenu._data.replace_arsupp_lowprofile == 10 then
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_smg_small.third_unit" .. usesupp.thirdmodel2))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_smg_small.unit" .. usesupp.model2))()
end
if WacMenu._data.replace_salvo12 == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_sho_salvo_large.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_large/wpn_third_upg_ns_ass_smg_large"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_sho_salvo_large.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_large/wpn_fps_upg_ns_ass_smg_large"
elseif WacMenu._data.replace_salvo12 == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_sho_salvo_large.third_unit = "units/payday2/weapons/wpn_third_upg_ns_shot_thick/wpn_third_upg_ns_shot_thick"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_sho_salvo_large.unit = "units/payday2/weapons/wpn_fps_upg_ns_shot_thick/wpn_fps_upg_ns_shot_thick"
end
if WacMenu._data.replace_shotsupp_silent == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_shot_thick.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_large/wpn_third_upg_ns_ass_smg_large"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_shot_thick.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_large/wpn_fps_upg_ns_ass_smg_large"
elseif WacMenu._data.replace_shotsupp_silent == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_shot_thick.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ns_sho_salvo/wpn_third_upg_ns_sho_salvo_large"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_shot_thick.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ns_sho_salvo/wpn_fps_upg_ns_sho_salvo_large"
end
if WacMenu._data.replace_pis_medium_slim == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.third_unit = "units/payday2/weapons/wpn_third_upg_ns_pis_medium/wpn_third_upg_ns_pis_medium"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_medium/wpn_fps_upg_ns_pis_medium"
elseif WacMenu._data.replace_pis_medium_slim == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.third_unit = "units/payday2/weapons/wpn_third_upg_ns_pis_large/wpn_third_upg_ns_pis_large"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_large/wpn_fps_upg_ns_pis_large"
elseif WacMenu._data.replace_pis_medium_slim == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_medium_gem/wpn_third_upg_ns_pis_medium_gem"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_medium_gem/wpn_fps_upg_ns_pis_medium_gem"
elseif WacMenu._data.replace_pis_medium_slim == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_large_kac/wpn_third_upg_ns_pis_large_kac"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_large_kac/wpn_fps_upg_ns_pis_large_kac"
elseif WacMenu._data.replace_pis_medium_slim == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ns_pis_jungle/wpn_third_upg_ns_pis_jungle"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ns_pis_jungle/wpn_fps_upg_ns_pis_jungle"
elseif WacMenu._data.replace_pis_medium_slim == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ns_ass_filter/wpn_third_upg_ns_ass_filter"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ns_ass_filter/wpn_fps_upg_ns_ass_filter"
elseif WacMenu._data.replace_pis_medium_slim == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_small/wpn_third_upg_ns_ass_smg_small"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_small/wpn_fps_upg_ns_ass_smg_small"
elseif WacMenu._data.replace_pis_medium_slim == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_medium/wpn_third_upg_ns_ass_smg_medium"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_medium/wpn_fps_upg_ns_ass_smg_medium"
elseif WacMenu._data.replace_pis_medium_slim == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.third_unit = "units/payday2/weapons/wpn_third_upg_ns_shot_thick/wpn_third_upg_ns_shot_thick"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_slim.unit = "units/payday2/weapons/wpn_fps_upg_ns_shot_thick/wpn_fps_upg_ns_shot_thick"
end
if WacMenu._data.replace_pis_large_kac == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.third_unit = "units/payday2/weapons/wpn_third_upg_ns_pis_medium/wpn_third_upg_ns_pis_medium"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_medium/wpn_fps_upg_ns_pis_medium"
elseif WacMenu._data.replace_pis_large_kac == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.third_unit = "units/payday2/weapons/wpn_third_upg_ns_pis_large/wpn_third_upg_ns_pis_large"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_large/wpn_fps_upg_ns_pis_large"
elseif WacMenu._data.replace_pis_large_kac == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ns_pis_medium_slim/wpn_third_upg_ns_pis_medium_slim"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ns_pis_medium_slim/wpn_fps_upg_ns_pis_medium_slim"
elseif WacMenu._data.replace_pis_large_kac == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_medium_gem/wpn_third_upg_ns_pis_medium_gem"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_medium_gem/wpn_fps_upg_ns_pis_medium_gem"
elseif WacMenu._data.replace_pis_large_kac == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ns_pis_jungle/wpn_third_upg_ns_pis_jungle"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ns_pis_jungle/wpn_fps_upg_ns_pis_jungle"
elseif WacMenu._data.replace_pis_large_kac == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ns_ass_filter/wpn_third_upg_ns_ass_filter"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ns_ass_filter/wpn_fps_upg_ns_ass_filter"
elseif WacMenu._data.replace_pis_large_kac == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_small/wpn_third_upg_ns_ass_smg_small"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_small/wpn_fps_upg_ns_ass_smg_small"
elseif WacMenu._data.replace_pis_large_kac == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_medium/wpn_third_upg_ns_ass_smg_medium"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_medium/wpn_fps_upg_ns_ass_smg_medium"
elseif WacMenu._data.replace_pis_large_kac == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.third_unit = "units/payday2/weapons/wpn_third_upg_ns_shot_thick/wpn_third_upg_ns_shot_thick"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_large_kac.unit = "units/payday2/weapons/wpn_fps_upg_ns_shot_thick/wpn_fps_upg_ns_shot_thick"
end
if WacMenu._data.replace_snakesupp == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_jungle.third_unit = "units/payday2/weapons/wpn_third_upg_ns_pis_medium/wpn_third_upg_ns_pis_medium"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_jungle.unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_medium/wpn_fps_upg_ns_pis_medium"
elseif WacMenu._data.replace_snakesupp == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_jungle.third_unit = "units/payday2/weapons/wpn_third_upg_ns_pis_large/wpn_third_upg_ns_pis_large"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_jungle.unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_large/wpn_fps_upg_ns_pis_large"
elseif WacMenu._data.replace_snakesupp == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_jungle.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ns_pis_medium_slim/wpn_third_upg_ns_pis_medium_slim"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_jungle.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ns_pis_medium_slim/wpn_fps_upg_ns_pis_medium_slim"
elseif WacMenu._data.replace_snakesupp == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_jungle.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_medium_gem/wpn_third_upg_ns_pis_medium_gem"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_jungle.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_medium_gem/wpn_fps_upg_ns_pis_medium_gem"
elseif WacMenu._data.replace_snakesupp == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_jungle.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_large_kac/wpn_third_upg_ns_pis_large_kac"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_jungle.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_large_kac/wpn_fps_upg_ns_pis_large_kac"
elseif WacMenu._data.replace_snakesupp == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_jungle.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ns_ass_filter/wpn_third_upg_ns_ass_filter"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_jungle.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ns_ass_filter/wpn_fps_upg_ns_ass_filter"
elseif WacMenu._data.replace_snakesupp == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_jungle.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_small/wpn_third_upg_ns_ass_smg_small"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_jungle.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_small/wpn_fps_upg_ns_ass_smg_small"
elseif WacMenu._data.replace_snakesupp == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_jungle.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_medium/wpn_third_upg_ns_ass_smg_medium"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_jungle.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_medium/wpn_fps_upg_ns_ass_smg_medium"
elseif WacMenu._data.replace_snakesupp == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_jungle.third_unit = "units/payday2/weapons/wpn_third_upg_ns_shot_thick/wpn_third_upg_ns_shot_thick"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_jungle.unit = "units/payday2/weapons/wpn_fps_upg_ns_shot_thick/wpn_fps_upg_ns_shot_thick"
end
if WacMenu._data.replace_pis_medium_gem == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.third_unit = "units/payday2/weapons/wpn_third_upg_ns_pis_medium/wpn_third_upg_ns_pis_medium"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_medium/wpn_fps_upg_ns_pis_medium"
elseif WacMenu._data.replace_pis_medium_gem == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.third_unit = "units/payday2/weapons/wpn_third_upg_ns_pis_large/wpn_third_upg_ns_pis_large"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_large/wpn_fps_upg_ns_pis_large"
elseif WacMenu._data.replace_pis_medium_gem == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ns_pis_medium_slim/wpn_third_upg_ns_pis_medium_slim"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ns_pis_medium_slim/wpn_fps_upg_ns_pis_medium_slim"
elseif WacMenu._data.replace_pis_medium_gem == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_large_kac/wpn_third_upg_ns_pis_large_kac"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_large_kac/wpn_fps_upg_ns_pis_large_kac"
elseif WacMenu._data.replace_pis_medium_gem == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ns_pis_jungle/wpn_third_upg_ns_pis_jungle"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ns_pis_jungle/wpn_fps_upg_ns_pis_jungle"
elseif WacMenu._data.replace_pis_medium_gem == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ns_ass_filter/wpn_third_upg_ns_ass_filter"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ns_ass_filter/wpn_fps_upg_ns_ass_filter"
elseif WacMenu._data.replace_pis_medium_gem == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_small/wpn_third_upg_ns_ass_smg_small"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_small/wpn_fps_upg_ns_ass_smg_small"
elseif WacMenu._data.replace_pis_medium_gem == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_medium/wpn_third_upg_ns_ass_smg_medium"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_medium/wpn_fps_upg_ns_ass_smg_medium"
elseif WacMenu._data.replace_pis_medium_gem == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.third_unit = "units/payday2/weapons/wpn_third_upg_ns_shot_thick/wpn_third_upg_ns_shot_thick"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_medium_gem.unit = "units/payday2/weapons/wpn_fps_upg_ns_shot_thick/wpn_fps_upg_ns_shot_thick"
end
if WacMenu._data.replace_pis_small == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.third_unit = "units/payday2/weapons/wpn_third_upg_ns_pis_medium/wpn_third_upg_ns_pis_medium"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_medium/wpn_fps_upg_ns_pis_medium"
elseif WacMenu._data.replace_pis_small == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.third_unit = "units/payday2/weapons/wpn_third_upg_ns_pis_large/wpn_third_upg_ns_pis_large"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.unit = "units/payday2/weapons/wpn_fps_upg_ns_pis_large/wpn_fps_upg_ns_pis_large"
elseif WacMenu._data.replace_pis_small == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ns_pis_medium_slim/wpn_third_upg_ns_pis_medium_slim"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ns_pis_medium_slim/wpn_fps_upg_ns_pis_medium_slim"
elseif WacMenu._data.replace_pis_small == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_medium_gem/wpn_third_upg_ns_pis_medium_gem"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_medium_gem/wpn_fps_upg_ns_pis_medium_gem"
elseif WacMenu._data.replace_pis_small == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_large_kac/wpn_third_upg_ns_pis_large_kac"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_large_kac/wpn_fps_upg_ns_pis_large_kac"
elseif WacMenu._data.replace_pis_small == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ns_pis_jungle/wpn_third_upg_ns_pis_jungle"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ns_pis_jungle/wpn_fps_upg_ns_pis_jungle"
elseif WacMenu._data.replace_pis_small == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.third_unit = "units/pd2_dlc_butcher_mods/weapons/wpn_third_upg_ns_ass_filter/wpn_third_upg_ns_ass_filter"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.unit = "units/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ns_ass_filter/wpn_fps_upg_ns_ass_filter"
elseif WacMenu._data.replace_pis_small == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_small/wpn_third_upg_ns_ass_smg_small"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_small/wpn_fps_upg_ns_ass_smg_small"
elseif WacMenu._data.replace_pis_small == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.third_unit = "units/payday2/weapons/wpn_third_upg_ns_ass_smg_medium/wpn_third_upg_ns_ass_smg_medium"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.unit = "units/payday2/weapons/wpn_fps_upg_ns_ass_smg_medium/wpn_fps_upg_ns_ass_smg_medium"
elseif WacMenu._data.replace_pis_small == 10 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.third_unit = "units/payday2/weapons/wpn_third_upg_ns_shot_thick/wpn_third_upg_ns_shot_thick"
	tweak_data.weapon.factory.parts.wpn_fps_upg_ns_pis_small.unit = "units/payday2/weapons/wpn_fps_upg_ns_shot_thick/wpn_fps_upg_ns_shot_thick"
end
if WacMenu._data.replace_hidesuppressorscomp == 2 then
usesupp.replacedmodel = " = \"units/payday2/weapons/wpn_fps_upg_ns_ass_smg_firepig/wpn_fps_upg_ns_ass_smg_firepig\""
elseif WacMenu._data.replace_hidesuppressorscomp == 3 then
usesupp.replacedmodel = " = \"units/payday2/weapons/wpn_fps_upg_ns_ass_smg_tank/wpn_fps_upg_ns_ass_smg_tank\""
elseif WacMenu._data.replace_hidesuppressorscomp == 4 then
usesupp.replacedmodel = " = \"units/payday2/weapons/wpn_fps_upg_ns_ass_smg_stubby/wpn_fps_upg_ns_ass_smg_stubby\""
elseif WacMenu._data.replace_hidesuppressorscomp == 5 then
usesupp.replacedmodel = " = \"units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_jprifles\""
elseif WacMenu._data.replace_hidesuppressorscomp == 6 then
usesupp.replacedmodel = " = \"units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_surefire\""
elseif WacMenu._data.replace_hidesuppressorscomp == 7 then
usesupp.replacedmodel = " = \"units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_ass_ns_linear\""
elseif WacMenu._data.replace_hidesuppressorscomp == 8 then
usesupp.replacedmodel = " = \"uunits/pd2_dlc_butcher_mods/weapons/wpn_fps_upg_ass_ns_battle/wpn_fps_upg_ass_ns_battle\""
else
usesupp.replacedmodel = " = \"units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy\""
end
if WacMenu._data.replace_hidesuppressors == true and wac_nosuppressedsnds == true then
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_smg_large.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_smg_large.unit" .. usesupp.replacedmodel))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_smg_medium.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_smg_medium.unit" .. usesupp.replacedmodel))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_smg_small.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_smg_small.unit" .. usesupp.replacedmodel))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_pbs1.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_pbs1.unit" .. usesupp.replacedmodel))()

assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_pis_large.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_pis_large.unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_pis_medium.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_pis_medium.unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_pis_small.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_pis_small.unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_pis_medium_slim.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_pis_medium_slim.unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_pis_large_kac.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_pis_large_kac.unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_pis_medium_gem.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_pis_medium_gem.unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_filter.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_ass_filter.unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_pis_jungle.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_pis_jungle.unit" .. usesupp.dummy))()

assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_shot_thick.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_shot_thick.unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_sho_salvo_large.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_upg_ns_sho_salvo_large.unit" .. usesupp.dummy))()

assert(loadstring(usesupp.tweak .. "wpn_fps_snp_msr_ns_suppressor.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_snp_msr_ns_suppressor.unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_scorpion_b_suppressed.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_scorpion_b_suppressed.unit" .. usesupp.replacedmodel))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_uzi_b_suppressed.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_uzi_b_suppressed.unit" .. usesupp.replacedmodel))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_cobray_ns_silencer.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_cobray_ns_silencer.unit" .. usesupp.replacedmodel))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_mp9_b_suppressed.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_mp9_b_suppressed.unit" .. usesupp.replacedmodel))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_polymer_ns_silencer.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_polymer_ns_silencer.unit" .. usesupp.replacedmodel))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_baka_b_midsupp.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_baka_b_midsupp.unit" .. usesupp.replacedmodel))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_baka_b_smallsupp.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_baka_b_smallsupp.unit" .. usesupp.replacedmodel))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_baka_b_longsupp.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_baka_b_longsupp.unit" .. usesupp.replacedmodel))()
assert(loadstring(usesupp.tweak .. "wpn_fps_snp_model70_ns_suppressor.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_snp_model70_ns_suppressor.unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_sr2_ns_silencer.third_unit" .. usesupp.dummy))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_sr2_ns_silencer.unit" .. usesupp.replacedmodel))()
end
if WacMenu._data.replace_hidesuppbarrels == true and wac_nosuppressedsnds == true then
assert(loadstring(usesupp.tweak .. "wpn_fps_m4_uupg_b_sd.unit" ..	" = \"units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_medium\""))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_mp5_fg_mp5sd.unit" ..	" = \"units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_fg_mp5a4\""))()
assert(loadstring(usesupp.tweak .. "wpn_fps_snp_m95_barrel_suppressed.unit" ..	 " = \"units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95_pts/wpn_fps_snp_m95_barrel_standard\""))()
assert(loadstring(usesupp.tweak .. "wpn_fps_snp_r93_b_suppressed.unit" ..	" = \"units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_r93_pts/wpn_fps_snp_r93_b_standard\""))()
assert(loadstring(usesupp.tweak .. "wpn_fps_sho_striker_b_suppressed.unit" ..	" = \"units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_striker_pts/wpn_fps_sho_striker_b_standard\""))()
assert(loadstring(usesupp.tweak .. "wpn_fps_ass_famas_b_suppressed.unit" ..  " = \"units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_b_standard\""))()
assert(loadstring(usesupp.tweak .. "wpn_fps_lmg_mg42_b_vg38.unit" ..  " = \"units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_b_mg42\""))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_sterling_b_suppressed.unit" ..	 " = \"units/pd2_dlc_gage_historical/weapons/wpn_fps_smg_sterling_pts/wpn_fps_smg_sterling_b_standard\""))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_sterling_b_e11.unit" ..  " = \"units/pd2_dlc_gage_historical/weapons/wpn_fps_smg_sterling_pts/wpn_fps_smg_sterling_b_standard\""))()
assert(loadstring(usesupp.tweak .. "wpn_fps_snp_mosin_b_sniper.unit" ..  " = \"units/pd2_dlc_gage_historical/weapons/wpn_fps_snp_mosin_pts/wpn_fps_snp_mosin_b_standard\""))()
assert(loadstring(usesupp.tweak .. "wpn_fps_ass_vhs_b_silenced.unit" ..  " = \"units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_fps_ass_vhs_b_standard\""))()
assert(loadstring(usesupp.tweak .. "wpn_fps_smg_p90_b_ninja.unit" ..  " = \"units/payday2/weapons/wpn_fps_smg_p90_pts/wpn_fps_smg_p90_b_short\""))()
assert(loadstring(usesupp.tweak .. "wpn_fps_sho_aa12_barrel_silenced.unit" ..	" = \"units/pd2_dlc_bbq/weapons/wpn_fps_sho_aa12_pts/wpn_fps_sho_aa12_barrel\""))()
assert(loadstring(usesupp.tweak .. "wpn_fps_snp_winchester_b_suppressed.unit" ..  " = \"units/pd2_dlc_west/weapons/wpn_fps_snp_winchester_pts/wpn_fps_snp_winchester_b_standard\""))()
assert(loadstring(usesupp.tweak .. "wpn_fps_snp_wa2000_b_suppressed.unit" ..  " = \"units/pd2_dlc_turtles/weapons/wpn_fps_snp_wa2000_pts/wpn_fps_snp_wa2000_b_standard\""))()
assert(loadstring(usesupp.tweak .. "wpn_fps_snp_siltstone_b_silenced.unit" ..	" = \"units/pd2_dlc_grv/weapons/wpn_fps_snp_siltstone_pts/wpn_fps_snp_siltstone_b_standard\""))()
assert(loadstring(usesupp.tweak .. "wpn_fps_snp_tti_ns_hex.unit" ..  " = \"units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_ns_standard\""))()
end
if WacMenu._data.replace_specter_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stats.zoom = 1
elseif WacMenu._data.replace_specter_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stats.zoom = 2
elseif WacMenu._data.replace_specter_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stats.zoom = 3
elseif WacMenu._data.replace_specter_zoom == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stats.zoom = 5
elseif WacMenu._data.replace_specter_zoom == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_specter.stats.zoom = 0
end
if WacMenu._data.replace_aimpoint_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stats.zoom = 1
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint_2.stats.zoom = 1
elseif WacMenu._data.replace_aimpoint_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stats.zoom = 2
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint_2.stats.zoom = 2
elseif WacMenu._data.replace_aimpoint_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stats.zoom = 3
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint_2.stats.zoom = 3
elseif WacMenu._data.replace_aimpoint_zoom == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stats.zoom = 5
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint_2.stats.zoom = 5
elseif WacMenu._data.replace_aimpoint_zoom == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint.stats.zoom = 0
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_aimpoint_2.stats.zoom = 0
end
if WacMenu._data.replace_docter_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_docter.stats.zoom = 1
elseif WacMenu._data.replace_docter_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_docter.stats.zoom = 3
elseif WacMenu._data.replace_docter_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_docter.stats.zoom = 4
elseif WacMenu._data.replace_docter_zoom == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_docter.stats.zoom = 5
elseif WacMenu._data.replace_docter_zoom == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_docter.stats.zoom = 0
end
if WacMenu._data.replace_eotech_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech.stats.zoom = 1
elseif WacMenu._data.replace_eotech_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech.stats.zoom = 2
elseif WacMenu._data.replace_eotech_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech.stats.zoom = 4
elseif WacMenu._data.replace_eotech_zoom == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech.stats.zoom = 5
elseif WacMenu._data.replace_eotech_zoom == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech.stats.zoom = 0
end
if WacMenu._data.replace_t1micro_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_t1micro.stats.zoom = 1
elseif WacMenu._data.replace_t1micro_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_t1micro.stats.zoom = 2
elseif WacMenu._data.replace_t1micro_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_t1micro.stats.zoom = 4
elseif WacMenu._data.replace_t1micro_zoom == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_t1micro.stats.zoom = 5
elseif WacMenu._data.replace_t1micro_zoom == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_t1micro.stats.zoom = 0
end
if WacMenu._data.replace_cmore_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_cmore.stats.zoom = 1
elseif WacMenu._data.replace_cmore_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_cmore.stats.zoom = 2
elseif WacMenu._data.replace_cmore_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_cmore.stats.zoom = 4
elseif WacMenu._data.replace_cmore_zoom == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_cmore.stats.zoom = 5
elseif WacMenu._data.replace_cmore_zoom == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_cmore.stats.zoom = 0
end
if WacMenu._data.replace_acog_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stats.zoom = 1
elseif WacMenu._data.replace_acog_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stats.zoom = 2
elseif WacMenu._data.replace_acog_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stats.zoom = 3
elseif WacMenu._data.replace_acog_zoom == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stats.zoom = 4
elseif WacMenu._data.replace_acog_zoom == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_acog.stats.zoom = 0
end
if WacMenu._data.replace_rmr_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_rmr.stats.zoom = 1
elseif WacMenu._data.replace_rmr_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_rmr.stats.zoom = 2
elseif WacMenu._data.replace_rmr_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_rmr.stats.zoom = 0
end
if WacMenu._data.replace_eotech_xps_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stats.zoom = 1
elseif WacMenu._data.replace_eotech_xps_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stats.zoom = 2
elseif WacMenu._data.replace_eotech_xps_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stats.zoom = 4
elseif WacMenu._data.replace_eotech_xps_zoom == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stats.zoom = 5
elseif WacMenu._data.replace_eotech_xps_zoom == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_eotech_xps.stats.zoom = 0
end
if WacMenu._data.replace_reflex_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_reflex.stats.zoom = 1
elseif WacMenu._data.replace_reflex_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_reflex.stats.zoom = 2
elseif WacMenu._data.replace_reflex_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_reflex.stats.zoom = 4
elseif WacMenu._data.replace_reflex_zoom == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_reflex.stats.zoom = 5
elseif WacMenu._data.replace_reflex_zoom == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_reflex.stats.zoom = 0
end
if WacMenu._data.replace_rx01_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_rx01.stats.zoom = 1
elseif WacMenu._data.replace_rx01_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_rx01.stats.zoom = 2
elseif WacMenu._data.replace_rx01_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_rx01.stats.zoom = 3
elseif WacMenu._data.replace_rx01_zoom == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_rx01.stats.zoom = 5
elseif WacMenu._data.replace_rx01_zoom == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_rx01.stats.zoom = 0
end
if WacMenu._data.replace_rx30_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_rx30.stats.zoom = 1
elseif WacMenu._data.replace_rx30_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_rx30.stats.zoom = 2
elseif WacMenu._data.replace_rx30_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_rx30.stats.zoom = 3
elseif WacMenu._data.replace_rx30_zoom == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_rx30.stats.zoom = 5
elseif WacMenu._data.replace_rx30_zoom == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_rx30.stats.zoom = 0
end
if WacMenu._data.replace_cs_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_cs.stats.zoom = 1
elseif WacMenu._data.replace_cs_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_cs.stats.zoom = 2
elseif WacMenu._data.replace_cs_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_cs.stats.zoom = 4
elseif WacMenu._data.replace_cs_zoom == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_cs.stats.zoom = 5
elseif WacMenu._data.replace_cs_zoom == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_cs.stats.zoom = 0
end
if WacMenu._data.replace_spot_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_spot.stats.zoom = 1
elseif WacMenu._data.replace_spot_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_spot.stats.zoom = 2
elseif WacMenu._data.replace_spot_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_spot.stats.zoom = 3
elseif WacMenu._data.replace_spot_zoom == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_spot.stats.zoom = 5
elseif WacMenu._data.replace_spot_zoom == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_spot.stats.zoom = 0
end
if WacMenu._data.replace_g36zf_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_o_vintage.stats.zoom = 1
elseif WacMenu._data.replace_g36zf_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_o_vintage.stats.zoom = 2
elseif WacMenu._data.replace_g36zf_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_o_vintage.stats.zoom = 3
elseif WacMenu._data.replace_g36zf_zoom == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_o_vintage.stats.zoom = 4
elseif WacMenu._data.replace_g36zf_zoom == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_o_vintage.stats.zoom = 0
end
if WacMenu._data.replace_45delta_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_45rds.stats.gadget_zoom = 2
elseif WacMenu._data.replace_45delta_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_45rds.stats.gadget_zoom = 3
elseif WacMenu._data.replace_45delta_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_45rds.stats.gadget_zoom = 4
end
if WacMenu._data.replace_45t1micro_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_45rds_v2.stats.gadget_zoom = 2
elseif WacMenu._data.replace_45t1micro_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_45rds_v2.stats.gadget_zoom = 3
elseif WacMenu._data.replace_45t1micro_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_45rds_v2.stats.gadget_zoom = 4
end
if WacMenu._data.replace_ta648_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_bmg.stats.zoom = 1
elseif WacMenu._data.replace_ta648_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_bmg.stats.zoom = 2
elseif WacMenu._data.replace_ta648_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_bmg.stats.zoom = 3
elseif WacMenu._data.replace_ta648_zoom == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_bmg.stats.zoom = 4
elseif WacMenu._data.replace_ta648_zoom == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_bmg.stats.zoom = 0
end
if WacMenu._data.replace_shieldrms_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_rms.stats.zoom = 1
elseif WacMenu._data.replace_shieldrms_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_rms.stats.zoom = 2
elseif WacMenu._data.replace_shieldrms_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_rms.stats.zoom = 0
end
if WacMenu._data.replace_p1_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_rikt.stats.zoom = 1
elseif WacMenu._data.replace_p1_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_rikt.stats.zoom = 2
elseif WacMenu._data.replace_p1_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_rikt.stats.zoom = 0
end
if WacMenu._data.replace_uh1_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_uh.stats.zoom = 1
elseif WacMenu._data.replace_uh1_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_uh.stats.zoom = 2
elseif WacMenu._data.replace_uh1_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_uh.stats.zoom = 4
elseif WacMenu._data.replace_uh1_zoom == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_uh.stats.zoom = 5
elseif WacMenu._data.replace_uh1_zoom == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_uh.stats.zoom = 0
end
if WacMenu._data.replace_di_fc1_zoom == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_fc1.stats.zoom = 1
elseif WacMenu._data.replace_di_fc1_zoom == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_fc1.stats.zoom = 2
elseif WacMenu._data.replace_di_fc1_zoom == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_fc1.stats.zoom = 4
elseif WacMenu._data.replace_di_fc1_zoom == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_fc1.stats.zoom = 5
elseif WacMenu._data.replace_di_fc1_zoom == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_o_fc1.stats.zoom = 0
end
if WacMenu._data.replace_afg2 == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_afg.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_stubby/wpn_third_upg_vg_ass_smg_stubby"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_afg.unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_stubby/wpn_fps_upg_vg_ass_smg_stubby"
elseif WacMenu._data.replace_afg2 == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_afg.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_verticalgrip/wpn_third_upg_vg_ass_smg_verticalgrip"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_afg.unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_verticalgrip/wpn_fps_upg_vg_ass_smg_verticalgrip"
elseif WacMenu._data.replace_afg2 == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_afg.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_vg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_afg.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_vg_standard"
elseif WacMenu._data.replace_afg2 == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_afg.third_unit = "units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_third_smg_polymer_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_afg.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_fps_smg_polymer_fg_standard"
elseif WacMenu._data.replace_afg2 == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_afg.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_afg.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
elseif WacMenu._data.replace_afg2 == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_afg.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_vg_surefire"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_afg.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_vg_surefire"
elseif WacMenu._data.replace_afg2 == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_afg.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_vg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_afg.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_vg_standard"
elseif WacMenu._data.replace_afg2 == 9 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_afg.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_afg.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_stubbygrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_stubby.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_verticalgrip/wpn_third_upg_vg_ass_smg_verticalgrip"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_stubby.unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_verticalgrip/wpn_fps_upg_vg_ass_smg_verticalgrip"
elseif WacMenu._data.replace_stubbygrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_stubby.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_afg/wpn_third_upg_vg_ass_smg_afg"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_stubby.unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_afg/wpn_fps_upg_vg_ass_smg_afg"
elseif WacMenu._data.replace_stubbygrip == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_stubby.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_vg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_stubby.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_vg_standard"
elseif WacMenu._data.replace_stubbygrip == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_stubby.third_unit = "units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_third_smg_polymer_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_stubby.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_fps_smg_polymer_fg_standard"
elseif WacMenu._data.replace_stubbygrip == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_stubby.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_vg_surefire"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_stubby.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_vg_surefire"
elseif WacMenu._data.replace_stubbygrip == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_stubby.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_vg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_stubby.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_vg_standard"
elseif WacMenu._data.replace_stubbygrip == 8 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_stubby.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_stubby.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_vertgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_stubby/wpn_third_upg_vg_ass_smg_stubby"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_stubby/wpn_fps_upg_vg_ass_smg_stubby"
elseif WacMenu._data.replace_vertgrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_vg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_vg_standard"
elseif WacMenu._data.replace_vertgrip == 4 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.third_unit = "units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_third_smg_polymer_fg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_fps_smg_polymer_fg_standard"
elseif WacMenu._data.replace_vertgrip == 5 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.third_unit = "units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_vg_surefire"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_vg_surefire"
elseif WacMenu._data.replace_vertgrip == 6 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.third_unit = "units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_vg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_vg_standard"
elseif WacMenu._data.replace_vertgrip == 7 then
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
if WacMenu._data.replace_vectorvertgrip == 2 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_fg_standard.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_vg_standard"
	tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_fg_standard.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_vg_standard"
elseif WacMenu._data.replace_vectorvertgrip == 3 then
	tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_fg_standard.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	tweak_data.weapon.factory.parts.wpn_fps_smg_polymer_fg_standard.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
end
-- Rest
if WacMenu._data.replace_ak74single == true then
	tweak_data.weapon.ak74.FIRE_MODE = "single"
end
if WacMenu._data.replace_akmsingle == true then
	tweak_data.weapon.akm.FIRE_MODE = "single"
	tweak_data.weapon.akm_gold.FIRE_MODE = "single"
end
if WacMenu._data.replace_asvalsingle == true then
	tweak_data.weapon.asval.FIRE_MODE = "single"
end
if WacMenu._data.replace_falsingle == true then
	tweak_data.weapon.fal.FIRE_MODE = "single"
end
if WacMenu._data.replace_g3single == true then
	tweak_data.weapon.g3.FIRE_MODE = "single"
end
if WacMenu._data.replace_g18csingle == true then
	tweak_data.weapon.glock_18c.FIRE_MODE = "single"
end
if WacMenu._data.replace_m4single == true then
	tweak_data.weapon.new_m4.FIRE_MODE = "single"
end
if WacMenu._data.replace_m16single == true then
	tweak_data.weapon.m16.FIRE_MODE = "single"
end
if WacMenu._data.replace_scarhsingle == true then
	tweak_data.weapon.scar.FIRE_MODE = "single"
end
if WacMenu._data.replace_s12ksingle == true then
	tweak_data.weapon.saiga.FIRE_MODE = "single"
end
if WacMenu._data.replace_aa12single == true then
	tweak_data.weapon.aa12.FIRE_MODE = "single"
end
if WacMenu._data.replace_akmsusingle == true then
	tweak_data.weapon.akmsu.FIRE_MODE = "single"
end
if WacMenu._data.replace_cz805single == true then
	tweak_data.weapon.hajk.FIRE_MODE = "single"
end
if WacMenu._data.replace_ump45single == true then
	tweak_data.weapon.schakal.FIRE_MODE = "single"
end
if WacMenu._data.fixes == true then
	table.map_append(tweak_data.weapon.factory.parts.wpn_fps_shot_r870_body_standard, {forbids = {"wpn_fps_addon_ris"}})
	table.map_append(tweak_data.weapon.factory.parts.wpn_fps_ass_g36_body_standard, {forbids = {"wpn_fps_addon_ris"}})
	table.map_append(tweak_data.weapon.factory.parts.wpn_fps_ass_g36_body_sl8, {forbids = {"wpn_fps_addon_ris"}})
	table.map_append(tweak_data.weapon.factory.parts.wpn_fps_lmg_m249_fg_mk46, {forbids = {"wpn_fps_addon_ris"}})
	table.map_append(tweak_data.weapon.factory.parts.wpn_fps_smg_mp7_body_standard, {forbids = {"wpn_fps_addon_ris"}})
	table.map_append(tweak_data.weapon.factory.parts.wpn_fps_smg_mp9_body_mp9, {forbids = {"wpn_fps_addon_ris"}})
	table.map_append(tweak_data.weapon.factory.parts.wpn_fps_smg_p90_body_p90, {forbids = {"wpn_fps_addon_ris"}})
	table.map_append(tweak_data.weapon.factory.parts.wpn_fps_ass_scar_body_standard, {forbids = {"wpn_fps_addon_ris"}})
	table.map_append(tweak_data.weapon.factory.parts.wpn_fps_sho_striker_body_standard, {forbids = {"wpn_fps_addon_ris"}})
	table.map_append(tweak_data.weapon.factory.parts.wpn_fps_smg_uzi_fg_rail, {forbids = {"wpn_fps_addon_ris","wpn_fps_shot_r870_gadget_rail"}})
	table.map_append(tweak_data.weapon.factory.parts.wpn_fps_snp_model70_body_standard, {forbids = {"wpn_fps_addon_ris"}})
	table.map_append(tweak_data.weapon.factory.parts.wpn_fps_smg_hajk_body_standard, {forbids = {"wpn_fps_addon_ris"}})
	tweak_data.weapon.factory.parts.wpn_fps_ass_g36_m_quick.bullet_objects = {prefix = "g_bullet_", amount = 28}
	tweak_data.weapon.factory.parts.wpn_fps_lmg_par_m_standard.bullet_objects = {prefix = "g_bullet_", amount = 5}
	table.map_append(tweak_data.weapon.factory.parts.wpn_fps_lmg_shuno_body_standard, {forbids = {"wpn_fps_addon_ris"}})
	table.map_append(tweak_data.weapon.factory.parts.wpn_fps_ass_asval_b_proto, {forbids = {"wpn_fps_addon_ris"}})
	table.map_append(tweak_data.weapon.factory.parts.wpn_fps_ass_asval_b_standard, {forbids = {"wpn_fps_addon_ris"}})
end
-- Parts IDs
local unit_list = {}
unit_list.akdracob = "wpn_fps_upg_ak_b_draco"
unit_list.ak105b = "wpn_fps_upg_ak_b_ak105"
unit_list.akzastava = "wpn_fps_upg_ass_ak_b_zastava"
unit_list.ar15long = "wpn_fps_m4_uupg_b_long"
unit_list.ar15medium = "wpn_fps_m4_uupg_b_medium"
unit_list.ar15short = "wpn_fps_m4_uupg_b_short"
unit_list.ar15beowulf = "wpn_fps_upg_ass_m4_b_beowulf"
unit_list.akmsub = "wpn_fps_smg_akmsu_b_standard"

unit_list.firepig = "wpn_fps_upg_ns_ass_smg_firepig"
unit_list.stubby = "wpn_fps_upg_ns_ass_smg_stubby"
unit_list.tank = "wpn_fps_upg_ns_ass_smg_tank"
unit_list.jprifles = "wpn_fps_upg_ass_ns_jprifles"
unit_list.linear = "wpn_fps_upg_ass_ns_linear"
unit_list.surefire = "wpn_fps_upg_ass_ns_surefire"
unit_list.battle = "wpn_fps_upg_ass_ns_battle"
unit_list.suppsmall = "wpn_fps_upg_ns_ass_smg_small"
unit_list.suppmedium = "wpn_fps_upg_ns_ass_smg_medium"
unit_list.supplarge = "wpn_fps_upg_ns_ass_smg_large"
unit_list.pisflash = "wpn_fps_upg_pis_ns_flash"
unit_list.ipsccomp = "wpn_fps_upg_ns_pis_ipsccomp"
unit_list.meatgrinder = "wpn_fps_upg_ns_pis_meatgrinder"
unit_list.shsupp = "wpn_fps_upg_ns_shot_thick"
unit_list.salvo12 = "wpn_fps_upg_ns_sho_salvo_large"
unit_list.pbs1 = "wpn_fps_upg_ns_ass_pbs1"
unit_list.pissupplarge = "wpn_fps_upg_ns_pis_large"
unit_list.pissuppmedium = "wpn_fps_upg_ns_pis_medium"
unit_list.pissuppsmall = "wpn_fps_upg_ns_pis_small"
unit_list.pissuppkac = "wpn_fps_upg_ns_pis_large_kac"
unit_list.pissuppgem = "wpn_fps_upg_ns_pis_medium_gem"
unit_list.pissuppslim = "wpn_fps_upg_ns_pis_medium_slim"
unit_list.pissuppfilter = "wpn_fps_upg_ns_ass_filter"
unit_list.pissuppsnake = "wpn_fps_upg_ns_pis_jungle"

unit_list.akstndfg = "wpn_upg_ak_fg_standard"
unit_list.akwoodrail = "wpn_upg_ak_fg_combo2"
unit_list.aktacfg = "wpn_upg_ak_fg_combo3"
unit_list.akbattlefg = "wpn_fps_upg_ak_fg_tapco"
unit_list.aklightfg = "wpn_fps_upg_fg_midwest"
unit_list.akkrebs = "wpn_fps_upg_ak_fg_krebs"
unit_list.aktrax = "wpn_fps_upg_ak_fg_trax"
unit_list.akmsurail = "wpn_fps_smg_akmsu_fg_rail"
unit_list.akmsuzenit = "wpn_fps_upg_ak_fg_zenit"
unit_list.m16stag = "wpn_fps_upg_ass_m16_fg_stag"

unit_list.peqbox = "wpn_fps_upg_fl_ass_smg_sho_peqbox"
unit_list.surefirelight = "wpn_fps_upg_fl_ass_smg_sho_surefire"
unit_list.peq15 = "wpn_fps_upg_fl_ass_peq15"
unit_list.laser = "wpn_fps_upg_fl_ass_laser"
unit_list.utg = "wpn_fps_upg_fl_ass_utg"

unit_list.akstndg = "wpn_upg_ak_g_standard"
unit_list.akhgrip = "wpn_fps_upg_ak_g_hgrip"
unit_list.akwgrip = "wpn_fps_upg_ak_g_wgrip"
unit_list.akpgrip = "wpn_fps_upg_ak_g_pgrip"
unit_list.akrk3g = "wpn_fps_upg_ak_g_rk3"
unit_list.ar15stndgrip = "wpn_fps_upg_m4_g_standard_vanilla"
unit_list.ar15ergogrip = "wpn_fps_upg_m4_g_ergo"
unit_list.ar15snpgrip = "wpn_fps_upg_m4_g_sniper"
unit_list.ar15hgrip = "wpn_fps_upg_m4_g_hgrip"
unit_list.ar15mgrip = "wpn_fps_upg_m4_g_mgrip"

unit_list.ar15lowerstnd = "wpn_fps_m4_lower_reciever"

unit_list.akquad = "wpn_fps_upg_ak_m_quad"
unit_list.akuspalm = "wpn_fps_upg_ak_m_uspalm"
unit_list.akmagpul = "wpn_fps_upg_ak_m_quick"
unit_list.stanag30 = "wpn_fps_m4_uupg_m_std"
unit_list.stanag20 = "wpn_fps_upg_m4_m_straight"
unit_list.pmag = "wpn_fps_upg_m4_m_pmag"
unit_list.mag5 = "wpn_fps_upg_m4_m_quad"
unit_list.emag = "wpn_fps_ass_l85a2_m_emag"
unit_list.l5awm = "wpn_fps_upg_m4_m_l5"
unit_list.stanagmagpul = "wpn_fps_m4_upg_m_quick"
unit_list.sgmtactmag = "wpn_fps_sho_basset_m_extended"

unit_list.mrksf = "wpn_upg_o_marksmansight_front"
unit_list.mrksr = "wpn_upg_o_marksmansight_rear_vanilla"
unit_list.mrksr2 = "wpn_upg_o_marksmansight_rear"
unit_list.ar15handlesight = "wpn_fps_ass_m16_o_handle_sight"

unit_list.m4standard = "wpn_fps_upg_m4_s_standard"
unit_list.m4pts = "wpn_fps_upg_m4_s_pts"
unit_list.m4fold = "wpn_fps_m4_uupg_s_fold"
unit_list.akfold = "wpn_upg_ak_s_folding"
unit_list.m4crane = "wpn_fps_upg_m4_s_crane"
unit_list.m4mk46 = "wpn_fps_upg_m4_s_mk46"
unit_list.m4ubr = "wpn_fps_upg_m4_s_ubr"
unit_list.akwood = "wpn_fps_upg_ak_s_solidstock"
unit_list.akskfoldable = "wpn_upg_ak_s_skfoldable"
unit_list.r870nostock = "wpn_fps_shot_r870_s_nostock"
unit_list.r870nostockrail = "wpn_fps_shot_r870_s_nostock_big"
unit_list.r870solidstockrail = "wpn_fps_shot_r870_s_solid_big"
unit_list.s870nostockrail = "wpn_fps_shot_shorty_s_nostock_short"
unit_list.s870solidstock = "wpn_fps_shot_r870_s_solid"
unit_list.s870solidstockrail = "wpn_fps_shot_shorty_s_solid_short"
unit_list.k23short = "wpn_fps_smg_olympic_s_short"
unit_list.m4vltor = "wpn_fps_snp_tti_s_vltor"

unit_list.ar15upperround = "wpn_fps_m4_upper_reciever_round_vanilla"
unit_list.ak74upper = "wpn_fps_ass_74_body_upperreceiver"
unit_list.akmupper = "wpn_fps_ass_akm_body_upperreceiver_vanilla"
unit_list.ar15bolt = "wpn_fps_amcar_bolt_standard"
unit_list.ar15handle = "wpn_fps_m4_uupg_draghandle_vanilla"

unit_list.lionbipod = "wpn_fps_upg_bp_lmg_lionbipod"

-- Parts Units
local parts_list = {}
parts_list.dummy_unit = " = {unit = \"units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy\",third_unit = \"units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy\"}"
parts_list.dummy_unit2 = " = {unit = \"units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy\",third_unit = \"units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy\"},"
parts_list.dummy_unit_open = " = { unit = \"units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy\",third_unit = \"units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy\""

parts_list.ak74b = " = {unit = \"units/payday2/weapons/wpn_fps_ass_74_pts/wpn_fps_ass_74_b_standard\",third_unit = \"units/payday2/weapons/wpn_third_ass_74_pts/wpn_third_ass_74_b_standard\""
parts_list.akmb = " = {unit = \"units/payday2/weapons/wpn_fps_ass_akm_pts/wpn_fps_ass_akm_b_standard\",third_unit = \"units/payday2/weapons/wpn_third_ass_akm_pts/wpn_third_ass_akm_b_standard\""
parts_list.akmgoldb = " = {unit = \"units/payday2/weapons/wpn_fps_ass_akm_gold_pts/wpn_fps_ass_akm_b_standard_gold\",third_unit = \"units/payday2/weapons/wpn_third_ass_akm_pts/wpn_third_ass_akm_b_standard_gold\""
parts_list.draco = " = {unit = \"units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_b_draco/wpn_fps_upg_ak_b_draco\",third_unit = \"units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_b_draco/wpn_third_upg_ak_b_draco\""
parts_list.rpkb = " = {unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_b_standard\",third_unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_b_standard\""
parts_list.akdracob = " = {unit = \"units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_b_draco/wpn_fps_upg_ak_b_draco\",third_unit = \"units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_b_draco/wpn_third_upg_ak_b_draco\""
parts_list.ak105b = " = {unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_b_ak105/wpn_fps_upg_ak_b_ak105\",third_unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_b_ak105/wpn_third_upg_ak_b_ak105\""
parts_list.ar15shortb = " = {unit = \"units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_short\",third_unit = \"units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_short\""
parts_list.ar15mediumb = " = {unit = \"units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_medium\",third_unit = \"units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_medium\"}"
parts_list.ar15longb = " = {unit = \"units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_long\",third_unit = \"units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_long\"}"
parts_list.famassuppb = " = { unit = \"units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_famas_pts/wpn_fps_ass_famas_b_suppressed\", third_unit = \"units/pd2_dlc_gage_assault/weapons/wpn_third_ass_famas_pts/wpn_third_ass_famas_b_suppressed\" },"
parts_list.m4a1suppb = " = {unit = \"units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_sd\",third_unit = \"units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_sd\",a_obj=\"a_b\"},"
parts_list.sub2ksuppb = " = { unit = \"units/pd2_dlc_casino/weapons/wpn_fps_ass_sub2000_pts/wpn_fps_ass_sub2000_fg_suppressed\",third_unit = \"units/pd2_dlc_casino/weapons/wpn_third_ass_sub2000_pts/wpn_third_ass_sub2000_fg_suppressed\",forbids = {\"wpn_fps_ass_sub2000_o_front\"} },"
unit_list.vhssuppb = " = {unit = \"units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_fps_ass_vhs_b_silenced\",third_unit = \"units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_third_ass_vhs_b_silenced\"},"
unit_list.mg42swb = " = { unit = \"units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_b_vg38\", third_unit = \"units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_b_vg38\" },"
parts_list.aa12suppb = " = {unit = \"units/pd2_dlc_bbq/weapons/wpn_fps_sho_aa12_pts/wpn_fps_sho_aa12_barrel_silenced\",third_unit = \"units/pd2_dlc_bbq/weapons/wpn_fps_sho_aa12_pts/wpn_third_sho_aa12_barrel_silenced\"},"
unit_list.l2a3suppb = " = {unit = \"units/pd2_dlc_gage_historical/weapons/wpn_fps_smg_sterling_pts/wpn_fps_smg_sterling_b_suppressed\",third_unit = \"units/pd2_dlc_gage_historical/weapons/wpn_third_smg_sterling_pts/wpn_third_smg_sterling_b_suppressed\" },"
unit_list.l2a3e11 = " = {unit = \"units/pd2_dlc_gage_historical/weapons/wpn_fps_smg_sterling_pts/wpn_fps_smg_sterling_b_e11\",third_unit = \"units/pd2_dlc_gage_historical/weapons/wpn_third_smg_sterling_pts/wpn_third_smg_sterling_b_e11\"},"
parts_list.p90ninja = " = {unit = \"units/pd2_dlc_butcher_mods/weapons/wpn_fps_smg_p90_b_ninja/wpn_fps_smg_p90_b_ninja\",third_unit = \"units/pd2_dlc_butcher_mods/weapons/wpn_third_smg_p90_b_ninja/wpn_third_smg_p90_b_ninja\" },"
parts_list.six12suppb = " = {unit = \"units/pd2_dlc_rota/weapons/wpn_fps_sho_rota_pts/wpn_fps_sho_rota_b_silencer\",third_unit = \"units/pd2_dlc_rota/weapons/wpn_fps_sho_rota_pts/wpn_third_sho_rota_b_silencer\" },"
parts_list.mp5sd = " = {unit = \"units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_fg_mp5sd\",third_unit = \"units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_fg_mp5sd\"},"
parts_list.ar15shortbpostforbid = ",forbids = {\"wpn_fps_ass_m16_os_frontsight\"} }"

parts_list.b92fs_co1 = " = {unit = \"units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_co_co1\",third_unit = \"units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_co_1\""
parts_list.jericho941comp = " = {unit = \"units/pd2_dlc_rip/weapons/wpn_fps_pis_sparrow_pts/wpn_fps_pis_sparrow_b_comp\",third_unit = \"units/pd2_dlc_rip/weapons/wpn_third_pis_sparrow_pts/wpn_third_pis_sparrow_b_comp\"},"
parts_list.p30lwickcomp = " = {unit = \"units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_fps_pis_packrat_ns_wick\",third_unit = \"units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat_pts/wpn_third_pis_packrat_ns_wick\",parent = \"barrel\",a_obj = \"a_ns\"}"
parts_list.pbs1 = " = {unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ns_ass_pbs1/wpn_fps_upg_ns_ass_pbs1\",third_unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ns_ass_pbs1/wpn_third_upg_ns_ass_pbs1\"}"
parts_list.suppsmall = " = {unit = \"units/payday2/weapons/wpn_fps_upg_ns_ass_smg_small/wpn_fps_upg_ns_ass_smg_small\",third_unit = \"units/payday2/weapons/wpn_third_upg_ns_ass_smg_small/wpn_third_upg_ns_ass_smg_small\"}"
parts_list.suppmedium = " = {unit = \"units/payday2/weapons/wpn_fps_upg_ns_ass_smg_medium/wpn_fps_upg_ns_ass_smg_medium\",third_unit = \"units/payday2/weapons/wpn_third_upg_ns_ass_smg_medium/wpn_third_upg_ns_ass_smg_medium\"}"
parts_list.m119barrelext = " = {unit = \"units/pd2_dlc_hotline2/weapons/wpn_fps_smg_cobray_pts/wpn_fps_smg_cobray_ns_barrelextension\",third_unit = \"units/pd2_dlc_hotline2/weapons/wpn_fps_smg_cobray_pts/wpn_third_smg_cobray_ns_barrelextension\"}"
parts_list.werbellssupp = " = {unit = \"units/pd2_dlc_hotline2/weapons/wpn_fps_smg_cobray_pts/wpn_fps_smg_cobray_ns_silencer\",third_unit = \"units/pd2_dlc_hotline2/weapons/wpn_fps_smg_cobray_pts/wpn_third_smg_cobray_ns_silencer\"}"
parts_list.microuzilongsupp = " = {unit = \"units/pd2_dlc_dragon/weapons/wpn_fps_smg_baka_pts/wpn_fps_smg_baka_b_longsupp\", third_unit = \"units/pd2_dlc_dragon/weapons/wpn_third_smg_baka_pts/wpn_third_smg_baka_b_longsupp\",a_obj = \"a_b\"}"
parts_list.microuzimidsupp = " = {unit = \"units/pd2_dlc_dragon/weapons/wpn_fps_smg_baka_pts/wpn_fps_smg_baka_b_midsupp\", third_unit = \"units/pd2_dlc_dragon/weapons/wpn_third_smg_baka_pts/wpn_third_smg_baka_b_midsupp\",a_obj = \"a_b\"}"
parts_list.microuzismallsupp = " = {unit = \"units/pd2_dlc_dragon/weapons/wpn_fps_smg_baka_pts/wpn_fps_smg_baka_b_smallsupp\", third_unit = \"units/pd2_dlc_dragon/weapons/wpn_third_smg_baka_pts/wpn_third_smg_baka_b_smallsupp\",a_obj = \"a_b\"}"
parts_list.mp7qd = " = {unit = \"units/pd2_dlc_dec5/weapons/wpn_fps_smg_mp7_pts/wpn_fps_smg_mp7_b_suppressed\",third_unit = \"units/pd2_dlc_dec5/weapons/wpn_third_smg_mp7_pts/wpn_third_smg_mp7_b_suppressed\"}"
parts_list.mp9supp = " = {unit = \"units/pd2_dlc_butcher_mods/weapons/wpn_fps_smg_mp9_b_suppressed/wpn_fps_smg_mp9_b_suppressed\",third_unit = \"units/pd2_dlc_butcher_mods/weapons/wpn_third_smg_mp9_b_suppressed/wpn_third_smg_mp9_b_suppressed\"}"
parts_list.sr2supp = " = {unit = \"units/pd2_dlc_coco/weapons/wpn_fps_smg_sr2_parts/wpn_fps_smg_sr2_ns_silencer\",third_unit = \"units/pd2_dlc_coco/weapons/wpn_fps_smg_sr2_parts/wpn_third_smg_sr2_ns_silencer\"}"
parts_list.umpgemtech = " = {unit = \"units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal_pts/wpn_fps_smg_schakal_ns_silencer\",third_unit = \"units/pd2_dlc_pim/weapons/wpn_third_smg_schakal_pts/wpn_third_smg_schakal_ns_silencer\"}"
parts_list.uzisupp = " = {unit = \"units/pd2_dlc_miami/weapons/wpn_fps_smg_uzi_pts/wpn_fps_smg_uzi_b_suppressed\",third_unit = \"units/pd2_dlc_miami/weapons/wpn_third_smg_uzi_pts/wpn_third_smg_uzi_b_suppressed\",a_obj = \"a_b\"}"
parts_list.vectorcrb = " = {unit = \"units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_fps_smg_polymer_barrel_precision\",third_unit = \"units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_third_smg_polymer_barrel_precision\"}"
parts_list.vectorhps = " = {unit = \"units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_fps_smg_polymer_ns_silencer\",third_unit = \"units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_third_smg_polymer_ns_silencer\"}"
parts_list.vz61supp = " = {unit = \"units/pd2_dlc_miami/weapons/wpn_fps_smg_scorpion_pts/wpn_fps_smg_scorpion_b_suppressed\",third_unit = \"units/pd2_dlc_miami/weapons/wpn_third_smg_scorpion/wpn_third_smg_scorpion_b_suppressed\",a_obj = \"a_b\"}"
parts_list.flashhider_l85 = " = {unit = \"units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_ns_standard\",third_unit = \"units/pd2_dlc_clover/weapons/wpn_third_ass_l85a2_pts/wpn_third_ass_l85a2_ns_standard\"}"
parts_list.flashhider_scarh = " = {unit = \"units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar_pts/wpn_fps_ass_scar_ns_standard\",third_unit = \"units/pd2_dlc_dec5/weapons/wpn_third_ass_scar_pts/wpn_third_ass_scar_ns_standard\"}"
parts_list.flashhider_vhs = " = {unit = \"units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_fps_ass_vhs_ns_vhs\",third_unit = \"units/pd2_dlc_dragan/weapons/wpn_fps_ass_vhs_pts/wpn_third_ass_vhs_ns_vhs\"}"
parts_list.flashhider_hk416c = " = {unit = \"units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_ns_standard\",third_unit = \"units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_ns_standard\"}"
parts_list.flashhider_hk416jpre = " = {unit = \"units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_ns_special\",third_unit = \"units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_ns_special\"}"
parts_list.flashhider_cz805 = " = {unit = \"units/pd2_dlc_born/weapons/wpn_fps_smg_hajk_pts/wpn_fps_smg_hajk_ns_standard\",third_unit = \"units/pd2_dlc_born/weapons/wpn_third_smg_hajk_pts/wpn_third_smg_hajk_ns_standard\"}"
parts_list.dl44ns = " = {unit = \"units/pd2_dlc_gage_historical/weapons/wpn_fps_pis_c96_pts/wpn_fps_pis_c96_nozzle\",third_unit = \"units/pd2_dlc_gage_historical/weapons/wpn_third_pis_c96_pts/wpn_third_pis_c96_nozzle\"}"
parts_list.flashhider_hk417 = " = {unit = \"units/pd2_dlc_chico/weapons/wpn_fps_ass_contraband_pts/wpn_fps_ass_contraband_ns_standard\",third_unit = \"units/pd2_dlc_chico/weapons/wpn_third_ass_contraband_pts/wpn_third_ass_contraband_ns_standard\"}"
parts_list.flashhider_mg42 = " = {unit = \"units/pd2_dlc_gage_historical/weapons/wpn_fps_lmg_mg42_pts/wpn_fps_lmg_mg42_n42\",third_unit = \"units/pd2_dlc_gage_historical/weapons/wpn_third_lmg_mg42_pts/wpn_third_lmg_mg42_nozzle_42\"}"
parts_list.flashhider_m1928 = " = {unit = \"units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_ns_standard\",third_unit = \"units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_third_smg_thompson_ns_standard\"}"
parts_list.flashhider_ak12 = " = {unit = \"units/pd2_dlc_grv/weapons/wpn_fps_ass_flint_pts/wpn_fps_ass_flint_ns_standard\",third_unit = \"units/pd2_dlc_grv/weapons/wpn_third_ass_flint_pts/wpn_third_ass_flint_ns_standard\"}"
parts_list.flashhider_pp19 = " = {unit = \"units/pd2_dlc_grv/weapons/wpn_fps_smg_coal_pts/wpn_fps_smg_coal_ns_standard\",third_unit = \"units/pd2_dlc_grv/weapons/wpn_third_smg_coal_pts/wpn_third_smg_coal_ns_standard\"}"
parts_list.ak105ns_forbid = ",forbids = {\"wpn_fps_upg_ak_ns_ak105\"} }"
parts_list.b92fs_co2 = " = {unit = \"units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_co_co2\",third_unit = \"units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_co_2\""
parts_list.pis_flashhider = " = {unit = \"units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_barrel_extentions/wpn_fps_upg_pis_ns_flash\",third_unit = \"units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_barrel_extentions/wpn_third_upg_pis_ns_flash\""
parts_list.pis_meatgrinder = " = {unit = \"units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_meatgrinder/wpn_fps_upg_ns_pis_meatgrinder\",third_unit = \"units/pd2_crimefest_2014/oct22/weapons/wpn_third_upg_ns_pis_meatgrinder/wpn_third_upg_ns_pis_meatgrinder\""
parts_list.pis_ipsccomp = " = {unit = \"units/pd2_crimefest_2014/oct22/weapons/wpn_fps_upg_ns_pis_ipsccomp/wpn_fps_upg_ns_pis_ipsccomp\",third_unit = \"units/pd2_crimefest_2014/oct22/weapons/wpn_third_upg_ns_pis_ipsccomp/wpn_third_upg_ns_pis_ipsccomp\""
parts_list.m1911_co1 = " = {unit = \"units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_co_1\",third_unit = \"units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_co_1\""
parts_list.m1911_co2 = " = {unit = \"units/payday2/weapons/wpn_fps_pis_1911_pts/wpn_fps_pis_1911_co_2\",third_unit = \"units/payday2/weapons/wpn_third_pis_1911_pts/wpn_third_pis_1911_co_2\""
parts_list.flashhider_mp40 = " = {unit = \"units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_fps_smg_erma_ns_standard\",third_unit = \"units/pd2_dlc_old/weapons/wpn_fps_smg_erma_pts/wpn_third_smg_erma_ns_standard\"}"
parts_list.flashhider_fnf2000 = " = {unit = \"units/pd2_dlc_rvd/weapons/wpn_fps_ass_corgi_pts/wpn_fps_ass_corgi_ns_standard\",third_unit = \"units/pd2_dlc_rvd/weapons/wpn_third_ass_corgi_pts/wpn_third_ass_corgi_ns_standard\"}"
parts_list.flashhider_mpx = " = {unit = \"units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_ns_standard\",third_unit = \"units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_ns_standard\"}"

parts_list.akgoldfg = " = {unit = \"units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_standard_gold\",third_unit = \"units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_standard_gold\",forbids = {},override = {} }"
parts_list.akstndfg = " = {unit = \"units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_standard\",third_unit = \"units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_fg_standard\",forbids = {} }"
parts_list.akkrebs = " = {unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_fg_krebs/wpn_fps_upg_ak_fg_krebs\",third_unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_fg_krebs/wpn_third_upg_ak_fg_krebs\"}"
parts_list.aktraxx = " = {unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_fg_trax/wpn_fps_upg_ak_fg_trax\",third_unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_fg_trax/wpn_third_upg_ak_fg_trax\"}"

parts_list.akhgrip = " = {unit = \"units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_g_hgrip/wpn_fps_upg_ak_g_hgrip\",third_unit = \"units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_g_hgrip/wpn_third_upg_ak_g_hgrip\"}"
parts_list.akpgrip = " = {unit = \"units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_g_pgrip/wpn_fps_upg_ak_g_pgrip\",third_unit = \"units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_g_pgrip/wpn_third_upg_ak_g_pgrip\"}"
parts_list.akwgrip = " = {unit = \"units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_ak_g_wgrip/wpn_fps_upg_ak_g_wgrip\",third_unit = \"units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_ak_g_wgrip/wpn_third_upg_ak_g_wgrip\"}"
parts_list.akstndgrip = " = {unit = \"units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_g_standard\",third_unit = \"units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_g_standard\"}"
parts_list.ar15gripstnd = " = {unit = \"units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_standard\",third_unit = \"units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_standard\"}"
parts_list.ar15gripergo = " = {unit = \"units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_g_ergo\",third_unit = \"units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_g_ergo\"}"
parts_list.ar15griphgrip = " = {unit = \"units/pd2_dlc_dec5/weapons/wpn_fps_upg_m4_g_hgrip/wpn_fps_upg_m4_g_hgrip\",third_unit = \"units/pd2_dlc_dec5/weapons/wpn_third_upg_m4_g_hgrip/wpn_third_upg_m4_g_hgrip\"}"
parts_list.ar15gripmgrip = " = {unit = \"units/pd2_dlc_dec5/weapons/wpn_fps_upg_m4_g_mgrip/wpn_fps_upg_m4_g_mgrip\",third_unit = \"units/pd2_dlc_dec5/weapons/wpn_third_upg_m4_g_mgrip/wpn_third_upg_m4_g_mgrip\"}"
parts_list.hk416cgrip = " = {unit = \"units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_g_standard\",third_unit = \"units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_g_standard\"}"
parts_list.ttitr1grip = " = {unit = \"units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_g_grippy\",third_unit = \"units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_g_grippy\"}"
parts_list.ak12grip = " = {unit = \"units/pd2_dlc_grv/weapons/wpn_fps_ass_flint_pts/wpn_fps_ass_flint_g_standard\",third_unit = \"units/pd2_dlc_grv/weapons/wpn_third_ass_flint_pts/wpn_third_ass_flint_g_standard\"}"
parts_list.pp19grip = " = {unit = \"units/pd2_dlc_grv/weapons/wpn_fps_smg_coal_pts/wpn_fps_smg_coal_g_standard\",third_unit = \"units/pd2_dlc_grv/weapons/wpn_third_smg_coal_pts/wpn_third_smg_coal_g_standard\"}"

parts_list.ar15lowercore = " = {unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_lower_reciever_core/wpn_fps_upg_ass_m4_lower_reciever_core\",third_unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_lower_reciever_core/wpn_third_upg_ass_m4_lower_reciever_core\"}"
parts_list.akmlower = " = {unit = \"units/payday2/weapons/wpn_fps_ass_akm_pts/wpn_fps_ass_ak_body_lowerreceiver\",third_unit = \"units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_ass_ak_body_lowerreceiver\"}"

parts_list.ak74mag = " = {unit = \"units/payday2/weapons/wpn_fps_ass_74_pts/wpn_fps_ass_74_m_standard\",third_unit = \"units/payday2/weapons/wpn_third_ass_74_pts/wpn_third_ass_74_m_standard\"}"
parts_list.akmmag = " = {unit = \"units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_m_akm\",third_unit = \"units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_m_akm\"}"
parts_list.akmgoldmag = " = {unit = \"units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_m_akm_gold\",third_unit = \"units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_m_akm_gold\"}"
parts_list.rpkmag = " = {unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_m_standard\",third_unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_m_standard\"}"
parts_list.rpkdrum = " = {unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_lmg_rpk_m_drum\",third_unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_m_drum\"}"
parts_list.ak12mag = " = {unit = \"units/pd2_dlc_grv/weapons/wpn_fps_ass_flint_pts/wpn_fps_ass_flint_m_standard\",third_unit = \"units/pd2_dlc_grv/weapons/wpn_third_ass_flint_pts/wpn_third_ass_flint_m_standard\"}"
parts_list.uspalm_ak30 = " = {unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_m_uspalm/wpn_fps_upg_ak_m_uspalm\",third_unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_m_uspalm/wpn_third_upg_ak_m_uspalm\"}"
parts_list.stanag30 = " = {unit = \"units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_m_std\",third_unit = \"units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_m_std\"}"
parts_list.stanag20 = " = {unit = \"units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_straight\",third_unit = \"units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_straight\"}"
parts_list.pmag = " = {unit = \"units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_m_pmag\",third_unit = \"units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_m_pmag\"}"
parts_list.mag5 = " = {unit = \"units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_m_quad/wpn_fps_upg_m4_m_quad\",third_unit = \"units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_m4_m_quad/wpn_third_upg_m4_m_quad\"}"
parts_list.emag = " = {unit = \"units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_m_emag\",third_unit = \"units/pd2_dlc_clover/weapons/wpn_third_ass_l85a2_pts/wpn_third_ass_l85a2_m_emag\"}"
parts_list.l5awm = " = {unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_m_l5/wpn_fps_upg_m4_m_l5\",third_unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_m4_m_l5/wpn_third_upg_m4_m_l5\"}"
parts_list.saiga5rnd = " = {unit = \"units/payday2/weapons/wpn_fps_shot_saiga_pts/wpn_fps_shot_saiga_m_5rnd\",third_unit = \"units/payday2/weapons/wpn_third_shot_saiga_pts/wpn_third_shot_saiga_m_5rnd\"}"
parts_list.saigadrum = " = {unit = \"units/payday2/weapons/wpn_fps_shot_saiga_pts/wpn_upg_saiga_m_20rnd\",third_unit = \"units/payday2/weapons/wpn_third_shot_saiga_pts/wpn_third_saiga_m_20rnd\"}"

parts_list.b92fs_rearsight = " = {unit = \"units/payday2/weapons/wpn_fps_pis_b92fs_pts/wpn_fps_pis_beretta_o_std\",third_unit = \"units/payday2/weapons/wpn_third_pis_b92fs_pts/wpn_third_pis_beretta_o_std\",stance_mod = {} }"
parts_list.sights_ddf = " = {unit = \"units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_dd/wpn_fps_upg_o_dd_front\",third_unit = \"units/pd2_dlc_gage_shot/weapons/wpn_third_upg_o_dd/wpn_third_upg_o_dd_front\""
parts_list.sights_ddr = " = {unit = \"units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_dd/wpn_fps_upg_o_dd_rear\",third_unit = \"units/pd2_dlc_gage_shot/weapons/wpn_third_upg_o_dd/wpn_third_upg_o_dd_rear\""
parts_list.sights_mbusf = " = {unit = \"units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_mbus/wpn_fps_upg_o_mbus_front\",third_unit = \"units/pd2_dlc_gage_shot/weapons/wpn_third_upg_o_mbus/wpn_third_upg_o_mbus_front\""
parts_list.sights_mbusr = " = {unit = \"units/pd2_dlc_gage_shot/weapons/wpn_fps_upg_o_mbus/wpn_fps_upg_o_mbus_rear\",third_unit = \"units/pd2_dlc_gage_shot/weapons/wpn_third_upg_o_mbus/wpn_third_upg_o_mbus_rear\""
parts_list.sights_a_of = ",a_obj = \"a_of\"}"
parts_list.sights_a_or = ",a_obj = \"a_or\","

parts_list.sights_augoffset = "stance_mod = {wpn_fps_ass_aug = {translation = Vector3(0, -3, -2.7),rotation = Rotation(0, -0.1, -0)}} }"
parts_list.sights_saigaoffset = "stance_mod = {wpn_fps_shot_saiga = {translation = Vector3(0.07, -10, -2.9)}} }"
parts_list.sights_strikeroffset = "stance_mod = {wpn_fps_sho_striker = {translation = Vector3(0, -3, -2.7)}} }"
parts_list.sights_p90offset = "stance_mod = {wpn_fps_smg_p90 = {translation = Vector3(0, 0, -2.97)}} }"

parts_list.pslst = " = {unit = \"units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_psl\",third_unit = \"units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_s_psl\",adds_type = {},override = {" .. unit_list.akstndg .. parts_list.dummy_unit2 .. unit_list.akhgrip .. parts_list.dummy_unit2 .. unit_list.akwgrip .. parts_list.dummy_unit2 .. unit_list.akpgrip .. parts_list.dummy_unit2 .. unit_list.akrk3g .. parts_list.dummy_unit2 .. "} }"
parts_list.akwoodst = " = {unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_s_solidstock/wpn_fps_upg_ak_s_solidstock\",third_unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_s_solidstock/wpn_third_upg_ak_s_solidstock\""
parts_list.akskfoldable = " = {unit = \"units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_skfoldable\",third_unit = \"units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_s_skfoldable\""
parts_list.akfolding = " = {unit = \"units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding\",third_unit = \"units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_s_folding\""
parts_list.akfoldgold = " = {unit = \"units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding_gold\",third_unit = \"units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_s_folding_gold\""
parts_list.galilstndst = " = {unit = \"units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_galil_pts/wpn_fps_ass_galil_s_standard\",third_unit = \"units/pd2_dlc_gage_assault/weapons/wpn_third_ass_galil_pts/wpn_third_ass_galil_s_standard\""
parts_list.rpkst = " = {unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_s_standard\",third_unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_s_standard\""
parts_list.rpkwoodst = " = {unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_s_wood\",third_unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_s_wood\""
parts_list.ak_grip_noadp = ",adds = { \"wpn_upg_ak_g_standard\" },adds_type = {} }"
parts_list.ak_grip_adp = ",adds = { \"wpn_upg_ak_g_standard\" },adds_type = {\"stock_adapter\"} }"
parts_list.k23shortstandardst = " = {unit = \"units/payday2/weapons/wpn_fps_smg_olympic_pts/wpn_fps_smg_olympic_s_adjust\",third_unit = \"units/payday2/weapons/wpn_third_smg_olympic_pts/wpn_third_smg_olympic_s_adjust\",adds_type = {} }"
parts_list.k23shortestst = " = {unit = \"units/payday2/weapons/wpn_fps_smg_olympic_pts/wpn_fps_smg_olympic_s_short\",third_unit = \"units/payday2/weapons/wpn_third_smg_olympic_pts/wpn_third_smg_olympic_s_short\",adds_type = {} }"
parts_list.m4a1foldingst = " = {unit = \"units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_s_fold\",third_unit = \"units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_s_fold\""
parts_list.ar15stndst = " = {unit = \"units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard\",third_unit = \"units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard\""
parts_list.ar15crane = " = {unit = \"units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_fps_upg_m4_s_crane\",third_unit = \"units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_m4_s_crane/wpn_third_upg_m4_s_crane\""
parts_list.ar15pts = " = {unit = \"units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_pts\",third_unit = \"units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_pts\""
parts_list.m16a4solid = " = {unit = \"units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_s_solid\",third_unit = \"units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_s_solid\",adds_type = {} }"
parts_list.hk416cst = " = {unit = \"units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_s_standard\",third_unit = \"units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_s_standard\",adds_type = {} }"
parts_list.sg552st = " = { unit = \"units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_s_standard\", third_unit = \"units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_s_standard\",adds_type = {} }"
parts_list.sg552stgreen = " = { unit = \"units/pd2_dlc1/weapons/wpn_fps_ass_s552_pts/wpn_fps_ass_s552_s_standard_green\", third_unit = \"units/pd2_dlc1/weapons/wpn_third_ass_s552_pts/wpn_third_ass_s552_s_standard_green\",adds_type = {} }"
parts_list.m249para = " = {unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249_pts/wpn_fps_lmg_m249_s_para\",third_unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_m249_pts/wpn_third_lmg_m249_s_para\",adds_type = {} }"
parts_list.m249solid = " = {unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249_pts/wpn_fps_lmg_m249_s_solid\",third_unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_m249_pts/wpn_third_lmg_m249_s_solid\",adds_type = {} }"
parts_list.m119stock = " = {unit = \"units/pd2_dlc_hotline2/weapons/wpn_fps_smg_cobray_pts/wpn_fps_smg_cobray_s_standard\",third_unit = \"units/pd2_dlc_hotline2/weapons/wpn_fps_smg_cobray_pts/wpn_third_smg_cobray_s_standard\",adds_type = {} }"
parts_list.vectorstock = " = {unit = \"units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_fps_smg_polymer_s_standard\",third_unit = \"units/pd2_dlc_turtles/weapons/wpn_fps_smg_polymer_pts/wpn_third_smg_polymer_s_standard\",adds_type = {} }"
parts_list.r870solidstock = " = {unit = \"units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_s_solid\",third_unit = \"units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_s_solid\""
parts_list.r870nostock = " = {unit = \"units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_s_nostock\",third_unit = \"units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_s_nostock\""
parts_list.r870solidstockrail = " = {unit = \"units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_s_solid_big\",third_unit = \"units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_s_solid_big\""
parts_list.r870nostockrail = " = {unit = \"units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_s_nostock_big\",third_unit = \"units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_s_nostock_big\""
parts_list.s870solidstockrail = " = {unit = \"units/payday2/weapons/wpn_fps_shot_shorty_pts/wpn_fps_shot_shorty_s_solid_short\",third_unit = \"units/payday2/weapons/wpn_third_shot_shorty_pts/wpn_third_shot_shorty_s_solid_short\""
parts_list.s870nostockrail = " = {unit = \"units/payday2/weapons/wpn_fps_shot_shorty_pts/wpn_fps_shot_shorty_s_nostock_short\",third_unit = \"units/payday2/weapons/wpn_third_shot_shorty_pts/wpn_third_shot_shorty_s_nostock_short\""
parts_list.hk417solid = " = {unit = \"units/pd2_dlc_chico/weapons/wpn_fps_ass_contraband_pts/wpn_fps_ass_contraband_s_standard\",third_unit = \"units/pd2_dlc_chico/weapons/wpn_third_ass_contraband_pts/wpn_third_ass_contraband_s_standard\",adds_type = {} }"
parts_list.ar15vltor = " = {unit = \"units/pd2_dlc_spa/weapons/wpn_fps_snp_tti_pts/wpn_fps_snp_tti_s_vltor\",third_unit = \"units/pd2_dlc_spa/weapons/wpn_third_snp_tti_pts/wpn_third_snp_tti_s_vltor\""
parts_list.ak12st = " = {unit = \"units/pd2_dlc_grv/weapons/wpn_fps_ass_flint_pts/wpn_fps_ass_flint_s_standard\",third_unit = \"units/pd2_dlc_grv/weapons/wpn_third_ass_flint_pts/wpn_third_ass_flint_s_standard\",adds_type = {} }"
parts_list.ar15addadp = ",adds_type = {\"stock_adapter\"} }"
parts_list.ar15noadp = ",adds_type = {} }"
parts_list.mpxst = " = {unit = \"units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_s_standard\",third_unit = \"units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_s_standard\",adds_type = {} }"

parts_list.akmupper = " = {unit = \"units/payday2/weapons/wpn_fps_ass_akm_pts/wpn_fps_ass_akm_body_upperreceiver\",third_unit = \"units/payday2/weapons/wpn_third_ass_akm_pts/wpn_third_ass_akm_body_upperreceiver\"}"
parts_list.ak74upper = " = {unit = \"units/payday2/weapons/wpn_fps_ass_74_pts/wpn_fps_ass_74_body_upperreceiver\",third_unit = \"units/payday2/weapons/wpn_third_ass_74_pts/wpn_third_ass_74_body_upperreceiver\"}"
parts_list.ar15uppervlto = " = {unit = \"units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_edge\",third_unit = \"units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_edge\"}"
parts_list.ar15uppercore = " = {unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_upper_reciever_core/wpn_fps_upg_ass_m4_upper_reciever_core\",third_unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_upper_reciever_core/wpn_third_upg_ass_m4_upper_reciever_core\"}"
parts_list.ar15upperbalios = " = {unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_upper_reciever_ballos/wpn_fps_upg_ass_m4_upper_reciever_ballos\",third_unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ass_m4_upper_reciever_ballos/wpn_third_upg_ass_m4_upper_reciever_ballos\"}"
parts_list.ar15boltvlto = " = {unit = \"units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_bolt_edge\"}"
parts_list.ar15boltbalios = " = {unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_bolt_ballos/wpn_fps_upg_ass_m4_bolt_ballos\"}"
parts_list.ar15boltcore = " = {unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ass_m4_bolt_core/wpn_fps_upg_ass_m4_bolt_core\"}"
parts_list.ar15handlebalios = " = {unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_fps_m4_uupg_draghandle_ballos/wpn_fps_m4_uupg_draghandle_ballos\"}"
parts_list.ar15handlecore = " = {unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_fps_m4_uupg_draghandle_core/wpn_fps_m4_uupg_draghandle_core\"}"

parts_list.m249bipod = " = {unit = \"units/pd2_dlc_cro/weapons/wpn_fps_upg_g_lmg_giraffebipod/wpn_fps_upg_g_lmg_giraffebipod\",third_unit = \"units/pd2_dlc_cro/weapons/wpn_third_upg_g_lmg_giraffebipod/wpn_third_upg_g_lmg_giraffebipod\"}"

-- Weapon IDs
ovr_ids = {}
ovr_ids.ak74 = "tweak_data.weapon.factory.wpn_fps_ass_74.override."
ovr_ids.akm = "tweak_data.weapon.factory.wpn_fps_ass_akm.override."
ovr_ids.akmgold = "tweak_data.weapon.factory.wpn_fps_ass_akm_gold.override."
ovr_ids.aug = "tweak_data.weapon.factory.wpn_fps_ass_aug.override."
ovr_ids.famas = "tweak_data.weapon.factory.wpn_fps_ass_famas.override."
ovr_ids.hk416c = "tweak_data.weapon.factory.wpn_fps_ass_tecci.override."
ovr_ids.l85 = "tweak_data.weapon.factory.wpn_fps_ass_l85a2.override."
ovr_ids.m4a1 = "tweak_data.weapon.factory.wpn_fps_ass_m4.override."
ovr_ids.m16 = "tweak_data.weapon.factory.wpn_fps_ass_m16.override."
ovr_ids.m733 = "tweak_data.weapon.factory.wpn_fps_ass_amcar.override."
ovr_ids.scarh = "tweak_data.weapon.factory.wpn_fps_ass_scar.override."
ovr_ids.sg552 = "tweak_data.weapon.factory.wpn_fps_ass_s552.override."
ovr_ids.sub2k = "tweak_data.weapon.factory.wpn_fps_ass_sub2000.override."
ovr_ids.vhs = "tweak_data.weapon.factory.wpn_fps_ass_vhs.override."
ovr_ids.mg42 = "tweak_data.weapon.factory.wpn_fps_lmg_mg42.override."
ovr_ids.m249 = "tweak_data.weapon.factory.wpn_fps_lmg_m249.override."
ovr_ids.rpk = "tweak_data.weapon.factory.wpn_fps_lmg_rpk.override."
ovr_ids.r870 = "tweak_data.weapon.factory.wpn_fps_shot_r870.override."
ovr_ids.aa12 = "tweak_data.weapon.factory.wpn_fps_sho_aa12.override."
ovr_ids.s12k = "tweak_data.weapon.factory.wpn_fps_shot_saiga.override."
ovr_ids.s870 = "tweak_data.weapon.factory.wpn_fps_shot_serbu.override."
ovr_ids.striker = "tweak_data.weapon.factory.wpn_fps_sho_striker.override."
ovr_ids.m1911 = "tweak_data.weapon.factory.wpn_fps_pis_1911.override."
ovr_ids.b92fs = "tweak_data.weapon.factory.wpn_fps_pis_beretta.override."
ovr_ids.b92fs_x = "tweak_data.weapon.factory.wpn_fps_x_b92fs.override."
ovr_ids.c96 = "tweak_data.weapon.factory.wpn_fps_pis_c96.override."
ovr_ids.deagle = "tweak_data.weapon.factory.wpn_fps_pis_deagle.override."
ovr_ids.jericho941 = "tweak_data.weapon.factory.wpn_fps_pis_sparrow.override."
ovr_ids.p30l = "tweak_data.weapon.factory.wpn_fps_pis_packrat.override."
ovr_ids.akmsu = "tweak_data.weapon.factory.wpn_fps_smg_akmsu.override."
ovr_ids.akmsu_x = "tweak_data.weapon.factory.wpn_fps_smg_x_akmsu.override."
ovr_ids.m119 = "tweak_data.weapon.factory.wpn_fps_smg_cobray.override."
ovr_ids.cz805 = "tweak_data.weapon.factory.wpn_fps_smg_hajk.override."
ovr_ids.k23 = "tweak_data.weapon.factory.wpn_fps_smg_olympic.override."
ovr_ids.l2a3 = "tweak_data.weapon.factory.wpn_fps_smg_sterling.override."
ovr_ids.mac10 = "tweak_data.weapon.factory.wpn_fps_smg_mac10.override."
ovr_ids.microuzi = "tweak_data.weapon.factory.wpn_fps_smg_baka.override."
ovr_ids.mp7 = "tweak_data.weapon.factory.wpn_fps_smg_mp7.override."
ovr_ids.mp9 = "tweak_data.weapon.factory.wpn_fps_smg_mp9.override."
ovr_ids.p90 = "tweak_data.weapon.factory.wpn_fps_smg_p90.override."
ovr_ids.sr2 = "tweak_data.weapon.factory.wpn_fps_smg_sr2.override."
ovr_ids.ump45 = "tweak_data.weapon.factory.wpn_fps_smg_schakal.override."
ovr_ids.uzi = "tweak_data.weapon.factory.wpn_fps_smg_uzi.override."
ovr_ids.vector = "tweak_data.weapon.factory.wpn_fps_smg_polymer.override."
ovr_ids.vz61 = "tweak_data.weapon.factory.wpn_fps_smg_scorpion.override."
ovr_ids.hk417 = "tweak_data.weapon.factory.wpn_fps_ass_contraband.override."
ovr_ids.six12 = "tweak_data.weapon.factory.wpn_fps_sho_rota.override."
ovr_ids.mg42 = "tweak_data.weapon.factory.wpn_fps_lmg_mg42.override."
ovr_ids.m1928 = "tweak_data.weapon.factory.wpn_fps_smg_thompson.override."
ovr_ids.ttitr1 = "tweak_data.weapon.factory.wpn_fps_snp_tti.override."
ovr_ids.g26 = "tweak_data.weapon.factory.wpn_fps_pis_g26.override."
ovr_ids.ak12 = "tweak_data.weapon.factory.wpn_fps_ass_flint.override."
ovr_ids.pp19 = "tweak_data.weapon.factory.wpn_fps_smg_coal.override."
ovr_ids.mp5 = "tweak_data.weapon.factory.wpn_fps_smg_mp5.override."
ovr_ids.g26_x = "tweak_data.weapon.factory.wpn_fps_jowi.override."
ovr_ids.sr2_x = "tweak_data.weapon.factory.wpn_fps_smg_x_sr2.override."
ovr_ids.p30l_x = "tweak_data.weapon.factory.wpn_fps_x_packrat.override."
ovr_ids.m1911_x = "tweak_data.weapon.factory.wpn_fps_x_1911.override."
ovr_ids.mp40 = "tweak_data.weapon.factory.wpn_fps_smg_erma.override."
ovr_ids.fnf2000 = "tweak_data.weapon.factory.wpn_fps_ass_corgi.override."
ovr_ids.spikex1saiga = "tweak_data.weapon.factory.wpn_fps_sho_basset.override."
ovr_ids.spikex1saiga_x = "tweak_data.weapon.factory.wpn_fps_sho_x_basset.override."
ovr_ids.c96_x = "tweak_data.weapon.factory.wpn_fps_pis_x_c96.override."
ovr_ids.jericho941_x = "tweak_data.weapon.factory.wpn_fps_pis_x_sparrow.override."
ovr_ids.m119_x = "tweak_data.weapon.factory.wpn_fps_smg_x_cobray.override."
ovr_ids.cz805_x = "tweak_data.weapon.factory.wpn_fps_smg_x_hajk.override."
ovr_ids.k23_x = "tweak_data.weapon.factory.wpn_fps_smg_x_olympic.override."
ovr_ids.l2a3_x = "tweak_data.weapon.factory.wpn_fps_smg_x_sterling.override."
ovr_ids.mac10_x = "tweak_data.weapon.factory.wpn_fps_smg_x_mac10.override."
ovr_ids.microuzi_x = "tweak_data.weapon.factory.wpn_fps_smg_x_baka.override."
ovr_ids.mp7_x = "tweak_data.weapon.factory.wpn_fps_smg_x_mp7.override."
ovr_ids.mp9_x = "tweak_data.weapon.factory.wpn_fps_smg_x_mp9.override."
ovr_ids.p90_x = "tweak_data.weapon.factory.wpn_fps_smg_x_p90.override."
ovr_ids.ump45_x = "tweak_data.weapon.factory.wpn_fps_smg_x_schakal.override."
ovr_ids.uzi_x = "tweak_data.weapon.factory.wpn_fps_smg_x_uzi.override."
ovr_ids.vector_x = "tweak_data.weapon.factory.wpn_fps_smg_x_polymer.override."
ovr_ids.vz61_x = "tweak_data.weapon.factory.wpn_fps_smg_x_scorpion.override."
ovr_ids.six12_x = "tweak_data.weapon.factory.wpn_fps_sho_x_rota.override."
ovr_ids.m1928_x = "tweak_data.weapon.factory.wpn_fps_smg_x_m1928.override."
ovr_ids.pp19_x = "tweak_data.weapon.factory.wpn_fps_smg_x_coal.override."
ovr_ids.mp40_x = "tweak_data.weapon.factory.wpn_fps_smg_x_erma.override."
ovr_ids.sigmpx = "tweak_data.weapon.factory.wpn_fps_smg_shepheard.override."
ovr_ids.sigmpx_x = "tweak_data.weapon.factory.wpn_fps_smg_x_shepheard.override."
-- AK74
if not tweak_data.weapon.factory.wpn_fps_ass_74.override.wpn_fps_upg_ass_ak_b_zastava then
log("[ERROR] WAC: Missing override table for AK-74 wpn_fps_upg_ass_ak_b_zastava - Option not executed")
	wac_no_ak_b_zastava = true
end
if WacMenu._data.replace_ak74upperrec == 2 then
assert(loadstring(ovr_ids.ak74 .. unit_list.ak74upper .. parts_list.akmupper))()
end
if WacMenu._data.replace_ak74dracob == 2 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akdracob .. parts_list.ak74b .. "}"))()
elseif WacMenu._data.replace_ak74dracob == 3 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akdracob .. parts_list.akmb .. "}"))()
elseif WacMenu._data.replace_ak74dracob == 4 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akdracob .. parts_list.rpkb .. "}"))()
end
if WacMenu._data.replace_ak74modernb == 2 then
assert(loadstring(ovr_ids.ak74 .. unit_list.ak105b .. parts_list.ak74b .. parts_list.ak105ns_forbid))()
elseif WacMenu._data.replace_ak74modernb == 3 then
assert(loadstring(ovr_ids.ak74 .. unit_list.ak105b .. parts_list.akmb .. parts_list.ak105ns_forbid))()
elseif WacMenu._data.replace_ak74modernb == 4 then
assert(loadstring(ovr_ids.ak74 .. unit_list.ak105b .. parts_list.akdracob .. parts_list.ak105ns_forbid))()
elseif WacMenu._data.replace_ak74modernb == 5 then
assert(loadstring(ovr_ids.ak74 .. unit_list.ak105b .. parts_list.rpkb .. parts_list.ak105ns_forbid))()
end
if WacMenu._data.replace_ak74zastava == 2 and not wac_no_ak_b_zastava then
assert(loadstring(ovr_ids.ak74 .. "wpn_fps_upg_ass_ak_b_zastava.unit = \"units/payday2/weapons/wpn_fps_ass_74_pts/wpn_fps_ass_74_b_standard\""))()
assert(loadstring(ovr_ids.ak74 .. "wpn_fps_upg_ass_ak_b_zastava.third_unit = \"units/payday2/weapons/wpn_third_ass_74_pts/wpn_third_ass_74_b_standard\""))()
elseif WacMenu._data.replace_ak74zastava == 3 and not wac_no_ak_b_zastava then
assert(loadstring(ovr_ids.ak74 .. "wpn_fps_upg_ass_ak_b_zastava.unit = \"units/payday2/weapons/wpn_fps_ass_akm_pts/wpn_fps_ass_akm_b_standard\""))()
assert(loadstring(ovr_ids.ak74 .. "wpn_fps_upg_ass_ak_b_zastava.third_unit = \"units/payday2/weapons/wpn_third_ass_akm_pts/wpn_third_ass_akm_b_standard\""))()
elseif WacMenu._data.replace_ak74zastava == 4 and not wac_no_ak_b_zastava then
assert(loadstring(ovr_ids.ak74 .. "wpn_fps_upg_ass_ak_b_zastava.unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_b_standard\""))()
assert(loadstring(ovr_ids.ak74 .. "wpn_fps_upg_ass_ak_b_zastava.third_unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_b_standard\""))()
end
if WacMenu._data.replace_ak74pbs1 == true and not wac_nosuppressedsnds then
assert(loadstring(ovr_ids.ak74 .. unit_list.suppsmall .. parts_list.pbs1))()
assert(loadstring(ovr_ids.ak74 .. unit_list.suppmedium .. parts_list.pbs1))()
assert(loadstring(ovr_ids.ak74 .. unit_list.supplarge .. parts_list.pbs1))()
end
if WacMenu._data.replace_ak74quad == 2 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akquad .. parts_list.rpkmag))()
elseif WacMenu._data.replace_ak74quad == 3 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akquad .. parts_list.rpkdrum))()
elseif WacMenu._data.replace_ak74quad == 4 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akquad .. parts_list.ak74mag))()
elseif WacMenu._data.replace_ak74quad == 5 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akquad .. parts_list.akmmag))()
elseif WacMenu._data.replace_ak74quad == 6 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akquad .. parts_list.uspalm_ak30))()
end
if WacMenu._data.replace_ak74uspalm == 2 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akuspalm .. parts_list.ak74mag))()
elseif WacMenu._data.replace_ak74uspalm == 3 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akuspalm .. parts_list.akmmag))()
end
if WacMenu._data.replace_ak74magpulassist == 2 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akmagpul .. parts_list.ak74mag))()
elseif WacMenu._data.replace_ak74magpulassist == 3 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akmagpul .. parts_list.akmmag))()
end
if WacMenu._data.replace_ak74stock1 == 2 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akfold .. parts_list.dummy_unit_open .. "}"))()
elseif WacMenu._data.replace_ak74stock1 == 3 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akfold .. parts_list.akskfoldable .. "}"))()
elseif WacMenu._data.replace_ak74stock1 == 4 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akfold .. parts_list.pslst))()
elseif WacMenu._data.replace_ak74stock1 == 5 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akfold .. parts_list.akwoodst .. "}"))()
elseif WacMenu._data.replace_ak74stock1 == 6 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akfold .. parts_list.ar15stndst .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_ak74stock1 == 7 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akfold .. parts_list.ar15pts .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_ak74stock1 == 8 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akfold .. parts_list.ar15vltor .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_ak74stock1 == 9 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akfold .. parts_list.galilstndst .. "}"))()
end
if WacMenu._data.replace_ak74stock4 == 2 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4crane .. parts_list.akskfoldable .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_ak74stock4 == 3 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4crane .. parts_list.akfolding .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_ak74stock4 == 4 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4crane .. parts_list.pslst))()
elseif WacMenu._data.replace_ak74stock4 == 5 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4crane .. parts_list.akwoodst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_ak74stock4 == 6 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4crane .. parts_list.rpkst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_ak74stock4 == 7 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4crane .. parts_list.rpkwoodst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_ak74stock4 == 8 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4crane .. parts_list.ar15stndst .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_ak74stock4 == 9 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4crane .. parts_list.ar15pts .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_ak74stock4 == 10 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4crane .. parts_list.ar15vltor .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_ak74stock4 == 11 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4crane .. parts_list.galilstndst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_ak74stock4 == 12 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4crane .. parts_list.dummy_unit_open .. parts_list.ak_grip_noadp))()
end
if WacMenu._data.replace_ak74stock2 == 2 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4mk46 .. parts_list.akskfoldable .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_ak74stock2 == 3 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4mk46 .. parts_list.akfolding .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_ak74stock2 == 4 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4mk46 .. parts_list.pslst))()
elseif WacMenu._data.replace_ak74stock2 == 5 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4mk46 .. parts_list.akwoodst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_ak74stock2 == 6 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4mk46 .. parts_list.rpkst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_ak74stock2 == 7 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4mk46 .. parts_list.rpkwoodst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_ak74stock2 == 8 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4mk46 .. parts_list.ar15stndst .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_ak74stock2 == 9 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4mk46 .. parts_list.ar15pts .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_ak74stock2 == 10 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4mk46 .. parts_list.ar15vltor .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_ak74stock2 == 11 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4mk46 .. parts_list.galilstndst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_ak74stock2 == 12 then
assert(loadstring(ovr_ids.ak74 .. unit_list.m4mk46 .. parts_list.dummy_unit_open .. parts_list.ak_grip_noadp))()
end
if WacMenu._data.replace_ak74stock3 == 2 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akwood .. parts_list.akskfoldable .. "}"))()
elseif WacMenu._data.replace_ak74stock3 == 3 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akwood .. parts_list.akfolding .. "}"))()
elseif WacMenu._data.replace_ak74stock3 == 4 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akwood .. parts_list.pslst))()
elseif WacMenu._data.replace_ak74stock3 == 5 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akwood .. parts_list.rpkst .. "}"))()
elseif WacMenu._data.replace_ak74stock3 == 6 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akwood .. parts_list.rpkwoodst .. "}"))()
elseif WacMenu._data.replace_ak74stock3 == 7 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akwood .. parts_list.ar15stndst .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_ak74stock3 == 8 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akwood .. parts_list.ar15pts .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_ak74stock3 == 9 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akwood .. parts_list.ar15vltor .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_ak74stock3 == 10 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akwood .. parts_list.galilstndst .. "}"))()
elseif WacMenu._data.replace_ak74stock3 == 11 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akwood .. parts_list.dummy_unit_open .. "}"))()
end
-- AKM
if not tweak_data.weapon.factory.wpn_fps_ass_akm.override then
	tweak_data.weapon.factory.wpn_fps_ass_akm.override = {}
end
if WacMenu._data.replace_akmupperrec == 2 then
assert(loadstring(ovr_ids.akm .. unit_list.akmupper .. parts_list.ak74upper))()
end
if WacMenu._data.replace_akmdracob == 2 then
assert(loadstring(ovr_ids.akm .. unit_list.akdracob .. parts_list.akmb .. "}"))()
elseif WacMenu._data.replace_akmdracob == 3 then
assert(loadstring(ovr_ids.akm .. unit_list.akdracob .. parts_list.ak74b .. "}"))()
elseif WacMenu._data.replace_akmdracob == 4 then
assert(loadstring(ovr_ids.akm .. unit_list.akdracob .. parts_list.rpkb .. "}"))()
end
if WacMenu._data.replace_akmmodernb == 2 then
assert(loadstring(ovr_ids.akm .. unit_list.ak105b .. parts_list.akmb .. parts_list.ak105ns_forbid))()
elseif WacMenu._data.replace_akmmodernb == 3 then
assert(loadstring(ovr_ids.akm .. unit_list.ak105b .. parts_list.ak74b .. parts_list.ak105ns_forbid))()
elseif WacMenu._data.replace_akmmodernb == 4 then
assert(loadstring(ovr_ids.akm .. unit_list.ak105b .. parts_list.akdracob .. parts_list.ak105ns_forbid))()
elseif WacMenu._data.replace_akmmodernb == 5 then
assert(loadstring(ovr_ids.akm .. unit_list.ak105b .. parts_list.rpkb .. parts_list.ak105ns_forbid))()
end
if WacMenu._data.replace_akmzastava == 2 then
assert(loadstring(ovr_ids.akm .. unit_list.akzastava .. parts_list.akmb .. "}"))()
elseif WacMenu._data.replace_akmzastava == 3 then
assert(loadstring(ovr_ids.akm .. unit_list.akzastava .. parts_list.ak74b .. "}"))()
elseif WacMenu._data.replace_akmzastava == 4 then
assert(loadstring(ovr_ids.akm .. unit_list.akzastava .. parts_list.rpkb .. "}"))()
end
if WacMenu._data.replace_akmpbs1 == true and not wac_nosuppressedsnds then
assert(loadstring(ovr_ids.akm .. unit_list.suppsmall .. parts_list.pbs1))()
assert(loadstring(ovr_ids.akm .. unit_list.suppmedium .. parts_list.pbs1))()
assert(loadstring(ovr_ids.akm .. unit_list.supplarge .. parts_list.pbs1))()
end
if WacMenu._data.replace_akmquad == 2 then
assert(loadstring(ovr_ids.akm .. unit_list.akquad .. parts_list.rpkmag))()
elseif WacMenu._data.replace_akmquad == 3 then
assert(loadstring(ovr_ids.akm .. unit_list.akquad .. parts_list.rpkdrum))()
elseif WacMenu._data.replace_akmquad == 4 then
assert(loadstring(ovr_ids.akm .. unit_list.akquad .. parts_list.akmmag))()
elseif WacMenu._data.replace_akmquad == 5 then
assert(loadstring(ovr_ids.akm .. unit_list.akquad .. parts_list.ak74mag))()
elseif WacMenu._data.replace_akmquad == 6 then
assert(loadstring(ovr_ids.akm .. unit_list.akquad .. parts_list.uspalm_ak30))()
end
if WacMenu._data.replace_akmuspalm == 2 then
assert(loadstring(ovr_ids.akm .. unit_list.akuspalm .. parts_list.akmmag))()
elseif WacMenu._data.replace_akmuspalm == 3 then
assert(loadstring(ovr_ids.akm .. unit_list.akuspalm .. parts_list.ak74mag))()
end
if WacMenu._data.replace_akmmagpulassist == 2 then
assert(loadstring(ovr_ids.akm .. unit_list.akmagpul .. parts_list.akmmag))()
elseif WacMenu._data.replace_akmmagpulassist == 3 then
assert(loadstring(ovr_ids.akm .. unit_list.akmagpul .. parts_list.ak74mag))()
end
if WacMenu._data.replace_akmstock1 == 2 then
assert(loadstring(ovr_ids.akm .. unit_list.akskfoldable .. parts_list.dummy_unit_open .. "}"))()
elseif WacMenu._data.replace_akmstock1 == 3 then
assert(loadstring(ovr_ids.akm .. unit_list.akskfoldable .. parts_list.akfolding .. "}"))()
elseif WacMenu._data.replace_akmstock1 == 4 then
assert(loadstring(ovr_ids.akm .. unit_list.akskfoldable .. parts_list.pslst))()
elseif WacMenu._data.replace_akmstock1 == 5 then
assert(loadstring(ovr_ids.akm .. unit_list.akskfoldable .. parts_list.akwoodst .. "}"))()
elseif WacMenu._data.replace_akmstock1 == 6 then
assert(loadstring(ovr_ids.akm .. unit_list.akskfoldable .. parts_list.ar15stndst .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmstock1 == 7 then
assert(loadstring(ovr_ids.akm .. unit_list.akskfoldable .. parts_list.ar15pts .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmstock1 == 8 then
assert(loadstring(ovr_ids.akm .. unit_list.akskfoldable .. parts_list.ar15vltor .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmstock1 == 9 then
assert(loadstring(ovr_ids.akm .. unit_list.akskfoldable .. parts_list.galilstndst .. "}"))()
end
if WacMenu._data.replace_akmstock4 == 2 then
assert(loadstring(ovr_ids.akm .. unit_list.m4crane .. parts_list.akfolding .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmstock4 == 3 then
assert(loadstring(ovr_ids.akm .. unit_list.m4crane .. parts_list.akskfoldable .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmstock4 == 4 then
assert(loadstring(ovr_ids.akm .. unit_list.m4crane .. parts_list.pslst))()
elseif WacMenu._data.replace_akmstock4 == 5 then
assert(loadstring(ovr_ids.akm .. unit_list.m4crane .. parts_list.akwoodst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmstock4 == 6 then
assert(loadstring(ovr_ids.akm .. unit_list.m4crane .. parts_list.rpkst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmstock4 == 7 then
assert(loadstring(ovr_ids.akm .. unit_list.m4crane .. parts_list.rpkwoodst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmstock4 == 8 then
assert(loadstring(ovr_ids.akm .. unit_list.m4crane .. parts_list.ar15stndst .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmstock4 == 9 then
assert(loadstring(ovr_ids.akm .. unit_list.m4crane .. parts_list.ar15pts .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmstock4 == 10 then
assert(loadstring(ovr_ids.akm .. unit_list.m4crane .. parts_list.ar15vltor .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmstock4 == 11 then
assert(loadstring(ovr_ids.akm .. unit_list.m4crane .. parts_list.galilstndst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmstock4 == 12 then
assert(loadstring(ovr_ids.akm .. unit_list.m4crane .. parts_list.dummy_unit_open .. parts_list.ak_grip_noadp))()
end
if WacMenu._data.replace_akmstock2 == 2 then
assert(loadstring(ovr_ids.akm .. unit_list.m4mk46 .. parts_list.akfolding .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmstock2 == 3 then
assert(loadstring(ovr_ids.akm .. unit_list.m4mk46 .. parts_list.akskfoldable .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmstock2 == 4 then
assert(loadstring(ovr_ids.akm .. unit_list.m4mk46 .. parts_list.pslst))()
elseif WacMenu._data.replace_akmstock2 == 5 then
assert(loadstring(ovr_ids.akm .. unit_list.m4mk46 .. parts_list.akwoodst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmstock2 == 6 then
assert(loadstring(ovr_ids.akm .. unit_list.m4mk46 .. parts_list.rpkst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmstock2 == 7 then
assert(loadstring(ovr_ids.akm .. unit_list.m4mk46 .. parts_list.rpkwoodst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmstock2 == 8 then
assert(loadstring(ovr_ids.akm .. unit_list.m4mk46 .. parts_list.ar15stndst .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmstock2 == 9 then
assert(loadstring(ovr_ids.akm .. unit_list.m4mk46 .. parts_list.ar15pts .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmstock2 == 10 then
assert(loadstring(ovr_ids.akm .. unit_list.m4mk46 .. parts_list.ar15vltor .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmstock2 == 11 then
assert(loadstring(ovr_ids.akm .. unit_list.m4mk46 .. parts_list.galilstndst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmstock2 == 12 then
assert(loadstring(ovr_ids.akm .. unit_list.m4mk46 .. parts_list.dummy_unit_open .. parts_list.ak_grip_noadp))()
end
if WacMenu._data.replace_akmstock3 == 2 then
assert(loadstring(ovr_ids.akm .. unit_list.akwood .. parts_list.akfolding .. "}"))()
elseif WacMenu._data.replace_akmstock3 == 3 then
assert(loadstring(ovr_ids.akm .. unit_list.akwood .. parts_list.akskfoldable .. "}"))()
elseif WacMenu._data.replace_akmstock3 == 4 then
assert(loadstring(ovr_ids.akm .. unit_list.akwood .. parts_list.pslst))()
elseif WacMenu._data.replace_akmstock3 == 5 then
assert(loadstring(ovr_ids.akm .. unit_list.akwood .. parts_list.rpkst .. "}"))()
elseif WacMenu._data.replace_akmstock3 == 6 then
assert(loadstring(ovr_ids.akm .. unit_list.akwood .. parts_list.rpkwoodst .. "}"))()
elseif WacMenu._data.replace_akmstock3 == 7 then
assert(loadstring(ovr_ids.akm .. unit_list.akwood .. parts_list.ar15stndst .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmstock3 == 8 then
assert(loadstring(ovr_ids.akm .. unit_list.akwood .. parts_list.ar15pts .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmstock3 == 9 then
assert(loadstring(ovr_ids.akm .. unit_list.akwood .. parts_list.ar15vltor .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmstock3 == 10 then
assert(loadstring(ovr_ids.akm .. unit_list.akwood .. parts_list.galilstndst .. "}"))()
elseif WacMenu._data.replace_akmstock3 == 11 then
assert(loadstring(ovr_ids.akm .. unit_list.akwood .. parts_list.dummy_unit_open .. "}"))()
end
-- AKM Gold
if not tweak_data.weapon.factory.wpn_fps_ass_akm_gold.override then
	tweak_data.weapon.factory.wpn_fps_ass_akm_gold.override = {}
end
if WacMenu._data.replace_akmgoldfg == true then
assert(loadstring(ovr_ids.akmgold .. unit_list.akwoodrail .. parts_list.akgoldfg))()
assert(loadstring(ovr_ids.akmgold .. unit_list.aktacfg .. parts_list.akgoldfg))()
assert(loadstring(ovr_ids.akmgold .. unit_list.akbattlefg .. parts_list.akgoldfg))()
assert(loadstring(ovr_ids.akmgold .. unit_list.aklightfg .. parts_list.akgoldfg))()
assert(loadstring(ovr_ids.akmgold .. unit_list.akkrebs .. parts_list.akgoldfg))()
assert(loadstring(ovr_ids.akmgold .. unit_list.aktrax .. parts_list.akgoldfg))()
end
if WacMenu._data.replace_akmgolddracob == 2 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akdracob .. parts_list.akmgoldb .. "}"))()
elseif WacMenu._data.replace_akmgolddracob == 3 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akdracob .. parts_list.akmb .. "}"))()
elseif WacMenu._data.replace_akmgolddracob == 4 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akdracob .. parts_list.ak74b .. "}"))()
end
if WacMenu._data.replace_akmgoldmodernb == 2 then
assert(loadstring(ovr_ids.akmgold .. unit_list.ak105b .. parts_list.akmgoldb .. parts_list.ak105ns_forbid))()
elseif WacMenu._data.replace_akmgoldmodernb == 3 then
assert(loadstring(ovr_ids.akmgold .. unit_list.ak105b .. parts_list.akmb .. parts_list.ak105ns_forbid))()
elseif WacMenu._data.replace_akmgoldmodernb == 4 then
assert(loadstring(ovr_ids.akmgold .. unit_list.ak105b .. parts_list.ak74b .. parts_list.ak105ns_forbid))()
end
if WacMenu._data.replace_akmgoldquad == 2 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akquad .. parts_list.rpkmag))()
elseif WacMenu._data.replace_akmgoldquad == 3 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akquad .. parts_list.rpkdrum))()
elseif WacMenu._data.replace_akmgoldquad == 4 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akquad .. parts_list.akmmag))()
elseif WacMenu._data.replace_akmgoldquad == 5 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akquad .. parts_list.ak74mag))()
elseif WacMenu._data.replace_akmgoldquad == 6 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akquad .. parts_list.akmgoldmag))()
elseif WacMenu._data.replace_akmgoldquad == 7 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akquad .. parts_list.uspalm_ak30))()
end
if WacMenu._data.replace_akmgolduspalm == 2 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akuspalm .. parts_list.akmgoldmag))()
elseif WacMenu._data.replace_akmgolduspalm == 3 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akuspalm .. parts_list.akmmag))()
elseif WacMenu._data.replace_akmgolduspalm == 4 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akuspalm .. parts_list.ak74mag))()
end
if WacMenu._data.replace_akmgoldmagpulassist == 2 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akmagpul .. parts_list.akmgoldmag))()
elseif WacMenu._data.replace_akmgoldmagpulassist == 3 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akmagpul .. parts_list.akmmag))()
elseif WacMenu._data.replace_akmgoldmagpulassist == 4 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akmagpul .. parts_list.ak74mag))()
end
if WacMenu._data.replace_akmgoldstock1 == 2 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akskfoldable .. parts_list.dummy_unit_open .. "}"))()
elseif WacMenu._data.replace_akmgoldstock1 == 3 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akskfoldable .. parts_list.akfoldgold .. "}"))()
elseif WacMenu._data.replace_akmgoldstock1 == 4 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akskfoldable .. parts_list.pslst))()
elseif WacMenu._data.replace_akmgoldstock1 == 5 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akskfoldable .. parts_list.akwoodst .. "}"))()
end
if WacMenu._data.replace_akmgoldstock2 == 2 then
assert(loadstring(ovr_ids.akmgold .. unit_list.m4mk46 .. parts_list.akfoldgold .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmgoldstock2 == 3 then
assert(loadstring(ovr_ids.akmgold .. unit_list.m4mk46 .. parts_list.akskfoldable .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmgoldstock2 == 4 then
assert(loadstring(ovr_ids.akmgold .. unit_list.m4mk46 .. parts_list.pslst))()
elseif WacMenu._data.replace_akmgoldstock2 == 5 then
assert(loadstring(ovr_ids.akmgold .. unit_list.m4mk46 .. parts_list.akwoodst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmgoldstock2 == 6 then
assert(loadstring(ovr_ids.akmgold .. unit_list.m4mk46 .. parts_list.rpkst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmgoldstock2 == 7 then
assert(loadstring(ovr_ids.akmgold .. unit_list.m4mk46 .. parts_list.rpkwoodst .. parts_list.ak_grip_noadp))()
end
if WacMenu._data.replace_akmgoldstock3 == 2 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akwood .. parts_list.akfoldgold .. "}"))()
elseif WacMenu._data.replace_akmgoldstock3 == 3 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akwood .. parts_list.akskfoldable .. "}"))()
elseif WacMenu._data.replace_akmgoldstock3 == 4 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akwood .. parts_list.pslst))()
elseif WacMenu._data.replace_akmgoldstock3 == 4 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akwood .. parts_list.rpkst .. "}"))()
elseif WacMenu._data.replace_akmgoldstock3 == 5 then
assert(loadstring(ovr_ids.akmgold .. unit_list.akwood .. parts_list.rpkwoodst .. "}"))()
end
-- AUG
if WacMenu._data.replace_ironsightsaug == 2 then
assert(loadstring(ovr_ids.aug .. unit_list.mrksr .. parts_list.sights_ddr .. parts_list.sights_a_or .. parts_list.sights_augoffset))()
assert(loadstring(ovr_ids.aug .. unit_list.mrksf .. parts_list.sights_ddf .. parts_list.sights_a_of))()
elseif WacMenu._data.replace_ironsightsaug == 3 then
assert(loadstring(ovr_ids.aug .. unit_list.mrksr .. parts_list.sights_mbusr .. parts_list.sights_a_or .. parts_list.sights_augoffset))()
assert(loadstring(ovr_ids.aug .. unit_list.mrksf .. parts_list.sights_mbusf .. parts_list.sights_a_of))()
end
-- FAMAS
if WacMenu._data.replace_famassuppb == true and not wac_nosuppressedsnds then
local famasparts = {}
famasparts.override	 = ", override = {" .. "wpn_fps_ass_famas_b_standard" .. parts_list.famassuppb .. "wpn_fps_ass_famas_b_long" .. parts_list.famassuppb .. "wpn_fps_ass_famas_b_short" .. parts_list.famassuppb .. "wpn_fps_ass_famas_b_sniper" .. parts_list.famassuppb .. "},"
famasparts.string = parts_list.dummy_unit_open .. famasparts.override .. "}"
assert(loadstring(ovr_ids.famas .. unit_list.suppsmall .. famasparts.string))()
assert(loadstring(ovr_ids.famas .. unit_list.suppmedium .. famasparts.string))()
assert(loadstring(ovr_ids.famas .. unit_list.supplarge .. famasparts.string))()
end
-- HK416C
if not tweak_data.weapon.factory.wpn_fps_ass_tecci.override then
	tweak_data.weapon.factory.wpn_fps_ass_tecci.override = {}
end
if WacMenu._data.replace_hk416ccomp == 2 or WacMenu._data.replace_hidebarrelextarsmg == true then
assert(loadstring(ovr_ids.hk416c .. unit_list.firepig .. parts_list.flashhider_hk416c))()
assert(loadstring(ovr_ids.hk416c .. unit_list.stubby .. parts_list.flashhider_hk416c))()
assert(loadstring(ovr_ids.hk416c .. unit_list.tank .. parts_list.flashhider_hk416c))()
assert(loadstring(ovr_ids.hk416c .. unit_list.jprifles .. parts_list.flashhider_hk416c))()
assert(loadstring(ovr_ids.hk416c .. unit_list.linear .. parts_list.flashhider_hk416c))()
assert(loadstring(ovr_ids.hk416c .. unit_list.surefire .. parts_list.flashhider_hk416c))()
assert(loadstring(ovr_ids.hk416c .. unit_list.battle .. parts_list.flashhider_hk416c))()
elseif WacMenu._data.replace_hk416ccomp == 3 then
assert(loadstring(ovr_ids.hk416c .. unit_list.firepig .. parts_list.flashhider_hk416jpre))()
assert(loadstring(ovr_ids.hk416c .. unit_list.stubby .. parts_list.flashhider_hk416jpre))()
assert(loadstring(ovr_ids.hk416c .. unit_list.tank .. parts_list.flashhider_hk416jpre))()
assert(loadstring(ovr_ids.hk416c .. unit_list.jprifles .. parts_list.flashhider_hk416jpre))()
assert(loadstring(ovr_ids.hk416c .. unit_list.linear .. parts_list.flashhider_hk416jpre))()
assert(loadstring(ovr_ids.hk416c .. unit_list.surefire .. parts_list.flashhider_hk416jpre))()
assert(loadstring(ovr_ids.hk416c .. unit_list.battle .. parts_list.flashhider_hk416jpre))()
end
if WacMenu._data.replace_hidesuppressors == true and wac_nosuppressedsnds == true then
assert(loadstring(ovr_ids.hk416c .. unit_list.suppsmall .. parts_list.flashhider_hk416c))()
assert(loadstring(ovr_ids.hk416c .. unit_list.suppmedium .. parts_list.flashhider_hk416c))()
assert(loadstring(ovr_ids.hk416c .. unit_list.supplarge .. parts_list.flashhider_hk416c))()
end
if WacMenu._data.replace_usehk416cgrip == true then
assert(loadstring(ovr_ids.hk416c .. unit_list.ar15ergogrip .. parts_list.hk416cgrip))()
assert(loadstring(ovr_ids.hk416c .. unit_list.ar15snpgrip .. parts_list.hk416cgrip))()
assert(loadstring(ovr_ids.hk416c .. unit_list.ar15hgrip .. parts_list.hk416cgrip))()
assert(loadstring(ovr_ids.hk416c .. unit_list.ar15mgrip .. parts_list.hk416cgrip))()
end
if WacMenu._data.replace_hk416stock == 2 then
assert(loadstring(ovr_ids.hk416c .. unit_list.m4pts .. parts_list.hk416cst))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4fold .. parts_list.hk416cst))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4crane .. parts_list.hk416cst))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4mk46 .. parts_list.hk416cst))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4ubr .. parts_list.hk416cst))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4vltor .. parts_list.hk416cst))()
elseif WacMenu._data.replace_hk416stock == 3 then
assert(loadstring(ovr_ids.hk416c .. unit_list.m4crane .. parts_list.ar15pts .. "}"))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4fold .. parts_list.ar15pts .. parts_list.ar15addadp))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4mk46 .. parts_list.ar15pts .. "}"))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4ubr .. parts_list.ar15pts .. "}"))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4vltor .. parts_list.ar15pts .. "}"))()
elseif WacMenu._data.replace_hk416stock == 4 then
assert(loadstring(ovr_ids.hk416c .. unit_list.m4pts .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4crane .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4mk46 .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4ubr .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4vltor .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
elseif WacMenu._data.replace_hk416stock == 5 then
assert(loadstring(ovr_ids.hk416c .. unit_list.m4pts .. parts_list.ar15crane .. "}"))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4fold .. parts_list.ar15crane .. parts_list.ar15addadp))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4mk46 .. parts_list.ar15crane .. "}"))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4ubr .. parts_list.ar15crane .. "}"))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4vltor .. parts_list.ar15crane .. "}"))()
elseif WacMenu._data.replace_hk416stock == 6 then
assert(loadstring(ovr_ids.hk416c .. unit_list.m4pts .. parts_list.m16a4solid))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4fold .. parts_list.m16a4solid))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4crane .. parts_list.m16a4solid))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4mk46 .. parts_list.m16a4solid))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4ubr .. parts_list.m16a4solid))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4vltor .. parts_list.m16a4solid))()
elseif WacMenu._data.replace_hk416stock == 7 then
assert(loadstring(ovr_ids.hk416c .. unit_list.m4pts .. parts_list.ar15stndst .. "}"))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4fold .. parts_list.ar15stndst .. parts_list.ar15addadp))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4crane .. parts_list.ar15stndst .. "}"))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4mk46 .. parts_list.ar15stndst .. "}"))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4ubr .. parts_list.ar15stndst .. "}"))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4vltor .. parts_list.ar15stndst .. "}"))()
elseif WacMenu._data.replace_hk416stock == 8 then
assert(loadstring(ovr_ids.hk416c .. unit_list.m4pts .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4fold .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4crane .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4mk46 .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4ubr .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4vltor .. parts_list.hk417solid))()
elseif WacMenu._data.replace_hk416stock == 9 then
assert(loadstring(ovr_ids.hk416c .. unit_list.m4pts .. parts_list.ar15vltor .. "}"))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4fold .. parts_list.ar15vltor .. parts_list.ar15addadp))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4crane .. parts_list.ar15vltor .. "}"))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4mk46 .. parts_list.ar15vltor .. "}"))()
assert(loadstring(ovr_ids.hk416c .. unit_list.m4ubr .. parts_list.ar15vltor .. "}"))()
end
-- L85A2
if not tweak_data.weapon.factory.wpn_fps_ass_l85a2.override then
	tweak_data.weapon.factory.wpn_fps_ass_l85a2.override = {}
end
if WacMenu._data.replace_l85flashhider == true or WacMenu._data.replace_hidebarrelextarsmg == true then
assert(loadstring(ovr_ids.l85 .. unit_list.firepig .. parts_list.flashhider_l85))()
assert(loadstring(ovr_ids.l85 .. unit_list.stubby .. parts_list.flashhider_l85))()
assert(loadstring(ovr_ids.l85 .. unit_list.tank .. parts_list.flashhider_l85))()
assert(loadstring(ovr_ids.l85 .. unit_list.jprifles .. parts_list.flashhider_l85))()
assert(loadstring(ovr_ids.l85 .. unit_list.linear .. parts_list.flashhider_l85))()
assert(loadstring(ovr_ids.l85 .. unit_list.surefire .. parts_list.flashhider_l85))()
assert(loadstring(ovr_ids.l85 .. unit_list.battle .. parts_list.flashhider_l85))()
end
if WacMenu._data.replace_hidesuppressors == true and wac_nosuppressedsnds == true then
assert(loadstring(ovr_ids.l85 .. unit_list.suppsmall .. parts_list.flashhider_l85))()
assert(loadstring(ovr_ids.l85 .. unit_list.suppmedium .. parts_list.flashhider_l85))()
assert(loadstring(ovr_ids.l85 .. unit_list.supplarge .. parts_list.flashhider_l85))()
end
-- M4A1
if WacMenu._data.replace_m4a1longb == 2 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.ar15long .. parts_list.ar15mediumb))()
elseif WacMenu._data.replace_m4a1longb == 3 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.ar15long .. parts_list.ar15shortb .. "}"))()
end
if WacMenu._data.replace_m4a1shortb == 2 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.ar15short .. parts_list.ar15mediumb))()
elseif WacMenu._data.replace_m4a1shortb == 3 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.ar15short .. parts_list.ar15longb))()
end
if WacMenu._data.replace_m4a1dmrb == 2 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.ar15beowulf .. parts_list.ar15mediumb))()
elseif WacMenu._data.replace_m4a1dmrb == 3 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.ar15beowulf .. parts_list.ar15longb))()
elseif WacMenu._data.replace_m4a1dmrb == 4 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.ar15beowulf .. parts_list.ar15shortb .. "}"))()
end
if WacMenu._data.replace_m4a1suppb == true and not wac_nosuppressedsnds then
local m4a1parts = {}
m4a1parts.override	= ", override = {" .. unit_list.ar15long .. parts_list.m4a1suppb .. unit_list.ar15short .. parts_list.m4a1suppb .. unit_list.ar15medium .. parts_list.m4a1suppb .. unit_list.ar15beowulf .. parts_list.m4a1suppb .. "}"
m4a1parts.string = parts_list.dummy_unit_open .. m4a1parts.override .. "}"
assert(loadstring(ovr_ids.m4a1 .. unit_list.suppsmall .. m4a1parts.string))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.suppmedium .. m4a1parts.string))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.supplarge .. m4a1parts.string))()
end
if WacMenu._data.replace_m4a1stndgrip == true then
assert(loadstring(ovr_ids.m4a1 .. unit_list.ar15ergogrip .. parts_list.ar15gripstnd))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.ar15snpgrip .. parts_list.ar15gripstnd))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.ar15hgrip .. parts_list.ar15gripstnd))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.ar15mgrip .. parts_list.ar15gripstnd))()
end
if WacMenu._data.replace_m4stanag20 == 2 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.stanag20 .. parts_list.stanag30))()
elseif WacMenu._data.replace_m4stanag20 == 3 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.stanag20 .. parts_list.pmag))()
elseif WacMenu._data.replace_m4stanag20 == 4 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.stanag20 .. parts_list.mag5))()
elseif WacMenu._data.replace_m4stanag20 == 5 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.stanag20 .. parts_list.emag))()
elseif WacMenu._data.replace_m4stanag20 == 6 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.stanag20 .. parts_list.l5awm))()
end
if WacMenu._data.replace_m4pmag == 2 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.pmag .. parts_list.stanag30))()
elseif WacMenu._data.replace_m4pmag == 3 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.pmag .. parts_list.stanag20))()
elseif WacMenu._data.replace_m4pmag == 4 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.pmag .. parts_list.mag5))()
elseif WacMenu._data.replace_m4pmag == 5 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.pmag .. parts_list.emag))()
elseif WacMenu._data.replace_m4pmag == 6 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.pmag .. parts_list.l5awm))()
end
if WacMenu._data.replace_m4mag5 == 2 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.mag5 .. parts_list.stanag30))()
elseif WacMenu._data.replace_m4mag5 == 3 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.mag5 .. parts_list.stanag20))()
elseif WacMenu._data.replace_m4mag5 == 4 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.mag5 .. parts_list.pmag))()
elseif WacMenu._data.replace_m4mag5 == 5 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.mag5 .. parts_list.emag))()
elseif WacMenu._data.replace_m4mag5 == 6 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.mag5 .. parts_list.l5awm))()
end
if WacMenu._data.replace_m4emag == 2 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.emag .. parts_list.stanag30))()
elseif WacMenu._data.replace_m4emag == 3 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.emag .. parts_list.stanag20))()
elseif WacMenu._data.replace_m4emag == 4 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.emag .. parts_list.pmag))()
elseif WacMenu._data.replace_m4emag == 5 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.emag .. parts_list.mag5))()
elseif WacMenu._data.replace_m4emag == 6 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.emag .. parts_list.l5awm))()
end
if WacMenu._data.replace_m4l5awm == 2 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.l5awm .. parts_list.stanag30))()
elseif WacMenu._data.replace_m4l5awm == 3 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.l5awm .. parts_list.stanag20))()
elseif WacMenu._data.replace_m4l5awm == 4 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.l5awm .. parts_list.pmag))()
elseif WacMenu._data.replace_m4l5awm == 5 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.l5awm .. parts_list.mag5))()
elseif WacMenu._data.replace_m4l5awm == 6 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.l5awm .. parts_list.emag))()
end
if WacMenu._data.replace_m4stanagmagpul == 2 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.stanagmagpul .. parts_list.stanag30))()
elseif WacMenu._data.replace_m4stanagmagpul == 3 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.stanagmagpul .. parts_list.stanag20))()
elseif WacMenu._data.replace_m4stanagmagpul == 4 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.stanagmagpul .. parts_list.pmag))()
elseif WacMenu._data.replace_m4stanagmagpul == 5 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.stanagmagpul .. parts_list.mag5))()
elseif WacMenu._data.replace_m4stanagmagpul == 6 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.stanagmagpul .. parts_list.emag))()
elseif WacMenu._data.replace_m4stanagmagpul == 7 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.stanagmagpul .. parts_list.l5awm))()
end
if WacMenu._data.replace_m4foldingst == 2 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4fold .. parts_list.dummy_unit))()
elseif WacMenu._data.replace_m4foldingst == 3 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4fold .. parts_list.k23shortstandardst))()
elseif WacMenu._data.replace_m4foldingst == 4 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4fold .. parts_list.k23shortestst))()
elseif WacMenu._data.replace_m4foldingst == 5 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4fold .. parts_list.ar15stndst .. parts_list.ar15addadp))()
elseif WacMenu._data.replace_m4foldingst == 6 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4fold .. parts_list.ar15pts .. parts_list.ar15addadp))()
elseif WacMenu._data.replace_m4foldingst == 7 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4fold .. parts_list.ar15crane .. parts_list.ar15addadp))()
elseif WacMenu._data.replace_m4foldingst == 8 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4fold .. parts_list.hk416cst))()
elseif WacMenu._data.replace_m4foldingst == 9 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4fold .. parts_list.hk417solid))()
elseif WacMenu._data.replace_m4foldingst == 10 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4fold .. parts_list.ar15vltor .. parts_list.ar15addadp))()
end
if WacMenu._data.replace_m4a1stock == 2 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4pts .. parts_list.ar15stndst .. "}"))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4crane .. parts_list.ar15stndst .. "}"))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4mk46 .. parts_list.ar15stndst .. "}"))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4ubr .. parts_list.ar15stndst .. "}"))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4vltor .. parts_list.ar15stndst .. "}"))()
elseif WacMenu._data.replace_m4a1stock == 3 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4crane .. parts_list.ar15pts .. "}"))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4mk46 .. parts_list.ar15pts .. "}"))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4ubr .. parts_list.ar15pts .. "}"))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4vltor .. parts_list.ar15pts .. "}"))()
elseif WacMenu._data.replace_m4a1stock == 4 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4pts .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4crane .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4mk46 .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4ubr .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4vltor .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
elseif WacMenu._data.replace_m4a1stock == 5 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4pts .. parts_list.ar15crane .. "}"))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4mk46 .. parts_list.ar15crane .. "}"))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4ubr .. parts_list.ar15crane .. "}"))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4vltor .. parts_list.ar15crane .. "}"))()
elseif WacMenu._data.replace_m4a1stock == 6 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4pts .. parts_list.m16a4solid))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4crane .. parts_list.m16a4solid))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4mk46 .. parts_list.m16a4solid))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4ubr .. parts_list.m16a4solid))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4vltor .. parts_list.m16a4solid))()
elseif WacMenu._data.replace_m4a1stock == 7 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4pts .. parts_list.hk416cst))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4crane .. parts_list.hk416cst))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4mk46 .. parts_list.hk416cst))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4ubr .. parts_list.hk416cst))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4vltor .. parts_list.hk416cst))()
elseif WacMenu._data.replace_m4a1stock == 8 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4pts .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4crane .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4mk46 .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4ubr .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4vltor .. parts_list.hk417solid))()
elseif WacMenu._data.replace_m4a1stock == 9 then
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4pts .. parts_list.ar15vltor .. "}"))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4crane .. parts_list.ar15vltor .. "}"))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4mk46 .. parts_list.ar15vltor .. "}"))()
assert(loadstring(ovr_ids.m4a1 .. unit_list.m4ubr .. parts_list.ar15vltor .. "}"))()
end
-- M16A4
if WacMenu._data.replace_m16longb == 2 then
assert(loadstring(ovr_ids.m16 .. unit_list.ar15long .. parts_list.ar15mediumb))()
elseif WacMenu._data.replace_m16longb == 3 then
assert(loadstring(ovr_ids.m16 .. unit_list.ar15long .. parts_list.ar15shortb .. parts_list.ar15shortbpostforbid))()
end
if not tweak_data.weapon.factory.wpn_fps_ass_m16.override.wpn_fps_upg_ass_m4_b_beowulf then
log("[ERROR] WAC: Missing override table for M16 wpn_fps_upg_ass_m4_b_beowulf - Option not executed")
	wac_no_m4_b_beowulf = true
end
if WacMenu._data.replace_m16dmrb == 2 and not wac_no_m4_b_beowulf then
assert(loadstring(ovr_ids.m16 .. "wpn_fps_upg_ass_m4_b_beowulf.unit = \"units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_medium\""))()
assert(loadstring(ovr_ids.m16 .. "wpn_fps_upg_ass_m4_b_beowulf.third_unit = \"units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_medium\""))()
elseif WacMenu._data.replace_m16dmrb == 3 and not wac_no_m4_b_beowulf then
assert(loadstring(ovr_ids.m16 .. "wpn_fps_upg_ass_m4_b_beowulf.unit = \"units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_long\""))()
assert(loadstring(ovr_ids.m16 .. "wpn_fps_upg_ass_m4_b_beowulf.third_unit = \"units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_long\""))()
elseif WacMenu._data.replace_m16dmrb == 4 and not wac_no_m4_b_beowulf then
assert(loadstring(ovr_ids.m16 .. "wpn_fps_upg_ass_m4_b_beowulf.unit = \"units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_short\""))()
assert(loadstring(ovr_ids.m16 .. "wpn_fps_upg_ass_m4_b_beowulf.third_unit = \"units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_short\""))()
assert(loadstring(ovr_ids.m16 .. "wpn_fps_upg_ass_m4_b_beowulf.forbids = {\"wpn_fps_ass_m16_os_frontsight\"}"))()
end
if WacMenu._data.replace_m16stndgrip == true then
assert(loadstring(ovr_ids.m16 .. unit_list.ar15ergogrip .. parts_list.ar15gripstnd))()
assert(loadstring(ovr_ids.m16 .. unit_list.ar15snpgrip .. parts_list.ar15gripstnd))()
assert(loadstring(ovr_ids.m16 .. unit_list.ar15hgrip .. parts_list.ar15gripstnd))()
assert(loadstring(ovr_ids.m16 .. unit_list.ar15mgrip .. parts_list.ar15gripstnd))()
end
if WacMenu._data.replace_m16stanag30 == 2 then
assert(loadstring(ovr_ids.m16 .. unit_list.stanag30 .. parts_list.stanag20))()
elseif WacMenu._data.replace_m16stanag30 == 3 then
assert(loadstring(ovr_ids.m16 .. unit_list.stanag30 .. parts_list.pmag))()
elseif WacMenu._data.replace_m16stanag30 == 4 then
assert(loadstring(ovr_ids.m16 .. unit_list.stanag30 .. parts_list.mag5))()
elseif WacMenu._data.replace_m16stanag30 == 5 then
assert(loadstring(ovr_ids.m16 .. unit_list.stanag30 .. parts_list.emag))()
elseif WacMenu._data.replace_m16stanag30 == 6 then
assert(loadstring(ovr_ids.m16 .. unit_list.stanag30 .. parts_list.l5awm))()
end
if WacMenu._data.replace_m16pmag == 2 then
assert(loadstring(ovr_ids.m16 .. unit_list.pmag .. parts_list.stanag30))()
elseif WacMenu._data.replace_m16pmag == 3 then
assert(loadstring(ovr_ids.m16 .. unit_list.pmag .. parts_list.stanag20))()
elseif WacMenu._data.replace_m16pmag == 4 then
assert(loadstring(ovr_ids.m16 .. unit_list.pmag .. parts_list.mag5))()
elseif WacMenu._data.replace_m16pmag == 5 then
assert(loadstring(ovr_ids.m16 .. unit_list.pmag .. parts_list.emag))()
elseif WacMenu._data.replace_m16pmag == 6 then
assert(loadstring(ovr_ids.m16 .. unit_list.pmag .. parts_list.l5awm))()
end
if WacMenu._data.replace_m16mag5 == 2 then
assert(loadstring(ovr_ids.m16 .. unit_list.mag5 .. parts_list.stanag30))()
elseif WacMenu._data.replace_m16mag5 == 3 then
assert(loadstring(ovr_ids.m16 .. unit_list.mag5 .. parts_list.stanag20))()
elseif WacMenu._data.replace_m16mag5 == 4 then
assert(loadstring(ovr_ids.m16 .. unit_list.mag5 .. parts_list.pmag))()
elseif WacMenu._data.replace_m16mag5 == 5 then
assert(loadstring(ovr_ids.m16 .. unit_list.mag5 .. parts_list.emag))()
elseif WacMenu._data.replace_m16mag5 == 6 then
assert(loadstring(ovr_ids.m16 .. unit_list.mag5 .. parts_list.l5awm))()
end
if WacMenu._data.replace_m16emag == 2 then
assert(loadstring(ovr_ids.m16 .. unit_list.emag .. parts_list.stanag30))()
elseif WacMenu._data.replace_m16emag == 3 then
assert(loadstring(ovr_ids.m16 .. unit_list.emag .. parts_list.stanag20))()
elseif WacMenu._data.replace_m16emag == 4 then
assert(loadstring(ovr_ids.m16 .. unit_list.emag .. parts_list.pmag))()
elseif WacMenu._data.replace_m16emag == 5 then
assert(loadstring(ovr_ids.m16 .. unit_list.emag .. parts_list.mag5))()
elseif WacMenu._data.replace_m16emag == 6 then
assert(loadstring(ovr_ids.m16 .. unit_list.emag .. parts_list.l5awm))()
end
if WacMenu._data.replace_m16l5awm == 2 then
assert(loadstring(ovr_ids.m16 .. unit_list.l5awm .. parts_list.stanag30))()
elseif WacMenu._data.replace_m16l5awm == 3 then
assert(loadstring(ovr_ids.m16 .. unit_list.l5awm .. parts_list.stanag20))()
elseif WacMenu._data.replace_m16l5awm == 4 then
assert(loadstring(ovr_ids.m16 .. unit_list.l5awm .. parts_list.pmag))()
elseif WacMenu._data.replace_m16l5awm == 5 then
assert(loadstring(ovr_ids.m16 .. unit_list.l5awm .. parts_list.mag5))()
elseif WacMenu._data.replace_m16l5awm == 6 then
assert(loadstring(ovr_ids.m16 .. unit_list.l5awm .. parts_list.emag))()
end
if WacMenu._data.replace_m16stanagmagpul == 2 then
assert(loadstring(ovr_ids.m16 .. unit_list.stanagmagpul .. parts_list.stanag30))()
elseif WacMenu._data.replace_m16stanagmagpul == 3 then
assert(loadstring(ovr_ids.m16 .. unit_list.stanagmagpul .. parts_list.stanag20))()
elseif WacMenu._data.replace_m16stanagmagpul == 4 then
assert(loadstring(ovr_ids.m16 .. unit_list.stanagmagpul .. parts_list.pmag))()
elseif WacMenu._data.replace_m16stanagmagpul == 5 then
assert(loadstring(ovr_ids.m16 .. unit_list.stanagmagpul .. parts_list.mag5))()
elseif WacMenu._data.replace_m16stanagmagpul == 6 then
assert(loadstring(ovr_ids.m16 .. unit_list.stanagmagpul .. parts_list.emag))()
elseif WacMenu._data.replace_m16stanagmagpul == 7 then
assert(loadstring(ovr_ids.m16 .. unit_list.stanagmagpul .. parts_list.l5awm))()
end
if WacMenu._data.replace_m16stock1 == 2 then
assert(loadstring(ovr_ids.m16 .. unit_list.m4crane .. parts_list.m16a4solid))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4mk46 .. parts_list.m16a4solid))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4ubr .. parts_list.m16a4solid))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4vltor .. parts_list.m16a4solid))()
elseif WacMenu._data.replace_m16stock1 == 3 then
assert(loadstring(ovr_ids.m16 .. unit_list.m4mk46 .. parts_list.ar15crane .. "}"))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4ubr .. parts_list.ar15crane .. "}"))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4vltor .. parts_list.ar15crane .. "}"))()
elseif WacMenu._data.replace_m16stock1 == 4 then
assert(loadstring(ovr_ids.m16 .. unit_list.m4crane .. parts_list.ar15stndst .. "}"))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4mk46 .. parts_list.ar15stndst .. "}"))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4ubr .. parts_list.ar15stndst .. "}"))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4vltor .. parts_list.ar15stndst .. "}"))()
elseif WacMenu._data.replace_m16stock1 == 5 then
assert(loadstring(ovr_ids.m16 .. unit_list.m4crane .. parts_list.ar15pts .. "}"))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4mk46 .. parts_list.ar15pts .. "}"))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4ubr .. parts_list.ar15pts .. "}"))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4vltor .. parts_list.ar15pts .. "}"))()
elseif WacMenu._data.replace_m16stock1 == 6 then
assert(loadstring(ovr_ids.m16 .. unit_list.m4crane .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4mk46 .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4ubr .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4vltor .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
elseif WacMenu._data.replace_m16stock1 == 7 then
assert(loadstring(ovr_ids.m16 .. unit_list.m4crane .. parts_list.hk416cst))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4mk46 .. parts_list.hk416cst))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4ubr .. parts_list.hk416cst))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4vltor .. parts_list.hk416cst))()
elseif WacMenu._data.replace_m16stock1 == 8 then
assert(loadstring(ovr_ids.m16 .. unit_list.m4crane .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4mk46 .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4ubr .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4vltor .. parts_list.hk417solid))()
elseif WacMenu._data.replace_m16stock1 == 9 then
assert(loadstring(ovr_ids.m16 .. unit_list.m4crane .. parts_list.ar15vltor .. "}"))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4mk46 .. parts_list.ar15vltor .. "}"))()
assert(loadstring(ovr_ids.m16 .. unit_list.m4ubr .. parts_list.ar15vltor .. "}"))()
end
-- M733
if not tweak_data.weapon.factory.wpn_fps_ass_amcar.override then
	tweak_data.weapon.factory.wpn_fps_ass_amcar.override = {}
end
if WacMenu._data.replace_m733grip == 2 then
assert(loadstring(ovr_ids.m733 .. unit_list.ar15stndgrip .. parts_list.ar15gripergo))()
elseif WacMenu._data.replace_m733grip == 3 then
assert(loadstring(ovr_ids.m733 .. unit_list.ar15stndgrip .. parts_list.ar15griphgrip))()
elseif WacMenu._data.replace_m733grip == 4 then
assert(loadstring(ovr_ids.m733 .. unit_list.ar15stndgrip .. parts_list.ar15gripmgrip))()
elseif WacMenu._data.replace_m733grip == 5 then
assert(loadstring(ovr_ids.m733 .. unit_list.ar15stndgrip .. parts_list.hk416cgrip))()
end
if WacMenu._data.replace_m733stock == 2 then
assert(loadstring(ovr_ids.m733 .. unit_list.m4crane .. parts_list.ar15stndst .. "}"))()
assert(loadstring(ovr_ids.m733 .. unit_list.m4mk46 .. parts_list.ar15stndst .. "}"))()
assert(loadstring(ovr_ids.m733 .. unit_list.m4ubr .. parts_list.ar15stndst .. "}"))()
assert(loadstring(ovr_ids.m733 .. unit_list.m4vltor .. parts_list.ar15stndst .. "}"))()
elseif WacMenu._data.replace_m733stock == 3 then
assert(loadstring(ovr_ids.m733 .. unit_list.m4mk46 .. parts_list.ar15crane .. "}"))()
assert(loadstring(ovr_ids.m733 .. unit_list.m4ubr .. parts_list.ar15crane .. "}"))()
assert(loadstring(ovr_ids.m733 .. unit_list.m4vltor .. parts_list.ar15crane .. "}"))()
elseif WacMenu._data.replace_m733stock == 4 then
assert(loadstring(ovr_ids.m733 .. unit_list.m4crane .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.m733 .. unit_list.m4mk46 .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.m733 .. unit_list.m4ubr .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.m733 .. unit_list.m4vltor .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
elseif WacMenu._data.replace_m733stock == 5 then
assert(loadstring(ovr_ids.m733 .. unit_list.m4crane .. parts_list.m16a4solid))()
assert(loadstring(ovr_ids.m733 .. unit_list.m4mk46 .. parts_list.m16a4solid))()
assert(loadstring(ovr_ids.m733 .. unit_list.m4ubr .. parts_list.m16a4solid))()
assert(loadstring(ovr_ids.m733 .. unit_list.m4vltor .. parts_list.m16a4solid))()
elseif WacMenu._data.replace_m733stock == 6 then
assert(loadstring(ovr_ids.m733 .. unit_list.m4crane .. parts_list.hk416cst))()
assert(loadstring(ovr_ids.m733 .. unit_list.m4mk46 .. parts_list.hk416cst))()
assert(loadstring(ovr_ids.m733 .. unit_list.m4ubr .. parts_list.hk416cst))()
assert(loadstring(ovr_ids.m733 .. unit_list.m4vltor .. parts_list.hk416cst))()
elseif WacMenu._data.replace_m733stock == 7 then
assert(loadstring(ovr_ids.m733 .. unit_list.m4crane .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.m733 .. unit_list.m4mk46 .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.m733 .. unit_list.m4ubr .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.m733 .. unit_list.m4vltor .. parts_list.hk417solid))()
elseif WacMenu._data.replace_m733stock == 8 then
assert(loadstring(ovr_ids.m733 .. unit_list.m4crane .. parts_list.ar15vltor .. "}"))()
assert(loadstring(ovr_ids.m733 .. unit_list.m4mk46 .. parts_list.ar15vltor .. "}"))()
assert(loadstring(ovr_ids.m733 .. unit_list.m4ubr .. parts_list.ar15vltor .. "}"))()
end
if WacMenu._data.replace_m733lower == 2 then
assert(loadstring(ovr_ids.m733 .. unit_list.ar15lowerstnd .. parts_list.ar15lowercore))()
end
if WacMenu._data.replace_m733upper == 2 then
assert(loadstring(ovr_ids.m733 .. unit_list.ar15upperround .. parts_list.ar15uppervlto))()
elseif WacMenu._data.replace_m733upper == 3 then
assert(loadstring(ovr_ids.m733 .. unit_list.ar15upperround .. parts_list.ar15upperbalios))()
elseif WacMenu._data.replace_m733upper == 4 then
assert(loadstring(ovr_ids.m733 .. unit_list.ar15upperround .. parts_list.ar15uppercore))()
end
if WacMenu._data.replace_m733bolt == 2 then
assert(loadstring(ovr_ids.m733 .. unit_list.ar15bolt .. parts_list.ar15boltvlto))()
elseif WacMenu._data.replace_m733bolt == 3 then
assert(loadstring(ovr_ids.m733 .. unit_list.ar15bolt .. parts_list.ar15boltbalios))()
elseif WacMenu._data.replace_m733bolt == 4 then
assert(loadstring(ovr_ids.m733 .. unit_list.ar15bolt .. parts_list.ar15boltcore))()
end
if WacMenu._data.replace_m733handle == 2 then
assert(loadstring(ovr_ids.m733 .. unit_list.ar15handle .. parts_list.ar15handlebalios))()
elseif WacMenu._data.replace_m733handle == 3 then
assert(loadstring(ovr_ids.m733 .. unit_list.ar15handle .. parts_list.ar15handlecore))()
end
-- SCAR-H
if WacMenu._data.replace_scarhflashhider == true or WacMenu._data.replace_hidebarrelextarsmg == true then
assert(loadstring(ovr_ids.scarh .. unit_list.firepig .. parts_list.flashhider_scarh))()
assert(loadstring(ovr_ids.scarh .. unit_list.stubby .. parts_list.flashhider_scarh))()
assert(loadstring(ovr_ids.scarh .. unit_list.tank .. parts_list.flashhider_scarh))()
assert(loadstring(ovr_ids.scarh .. unit_list.jprifles .. parts_list.flashhider_scarh))()
assert(loadstring(ovr_ids.scarh .. unit_list.linear .. parts_list.flashhider_scarh))()
assert(loadstring(ovr_ids.scarh .. unit_list.surefire .. parts_list.flashhider_scarh))()
assert(loadstring(ovr_ids.scarh .. unit_list.battle .. parts_list.flashhider_scarh))()
end
if WacMenu._data.replace_hidesuppressors == true and wac_nosuppressedsnds == true then
assert(loadstring(ovr_ids.scarh .. unit_list.suppsmall .. parts_list.flashhider_scarh))()
assert(loadstring(ovr_ids.scarh .. unit_list.suppmedium .. parts_list.flashhider_scarh))()
assert(loadstring(ovr_ids.scarh .. unit_list.supplarge .. parts_list.flashhider_scarh))()
end
-- SG552
if not tweak_data.weapon.factory.wpn_fps_ass_s552.override then
	tweak_data.weapon.factory.wpn_fps_ass_s552.override = {}
end
if WacMenu._data.replace_sg552stock == 2 then
assert(loadstring(ovr_ids.sg552 .. unit_list.m4pts .. parts_list.sg552st))()
assert(loadstring(ovr_ids.sg552 .. unit_list.m4crane .. parts_list.sg552st))()
assert(loadstring(ovr_ids.sg552 .. unit_list.m4mk46 .. parts_list.sg552st))()
assert(loadstring(ovr_ids.sg552 .. unit_list.m4ubr .. parts_list.sg552st))()
assert(loadstring(ovr_ids.sg552 .. unit_list.m4vltor .. parts_list.sg552st))()
assert(loadstring(ovr_ids.sg552 .. "wpn_fps_ass_s552_s_standard_green" .. parts_list.sg552st))()
elseif WacMenu._data.replace_sg552stock == 3 then
assert(loadstring(ovr_ids.sg552 .. unit_list.m4pts .. parts_list.sg552stgreen))()
assert(loadstring(ovr_ids.sg552 .. unit_list.m4crane .. parts_list.sg552stgreen))()
assert(loadstring(ovr_ids.sg552 .. unit_list.m4mk46 .. parts_list.sg552stgreen))()
assert(loadstring(ovr_ids.sg552 .. unit_list.m4ubr .. parts_list.sg552stgreen))()
assert(loadstring(ovr_ids.sg552 .. unit_list.m4vltor .. parts_list.sg552stgreen))()
assert(loadstring(ovr_ids.sg552 .. "wpn_fps_ass_s552_s_standard" .. parts_list.sg552st))()
elseif WacMenu._data.replace_sg552stock == 4 then
assert(loadstring(ovr_ids.sg552 .. unit_list.m4pts .. parts_list.dummy_unit_open .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.sg552 .. unit_list.m4crane .. parts_list.dummy_unit_open .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.sg552 .. unit_list.m4mk46 .. parts_list.dummy_unit_open .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.sg552 .. unit_list.m4ubr .. parts_list.dummy_unit_open .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.sg552 .. unit_list.m4vltor .. parts_list.dummy_unit_open .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.sg552 .. "wpn_fps_ass_s552_s_standard_green" .. parts_list.dummy_unit))()
assert(loadstring(ovr_ids.sg552 .. "wpn_fps_ass_s552_s_standard" .. parts_list.dummy_unit))()
end
-- SUB2000
if WacMenu._data.replace_sub2ksupp == true and not wac_nosuppressedsnds then
local sub2kparts = {}
sub2kparts.override	 = ",parent = \"foregrip\",override = {" .. "wpn_fps_ass_sub2000_fg_gen1" .. parts_list.sub2ksuppb .. "wpn_fps_ass_sub2000_fg_gen2" .. parts_list.sub2ksuppb .. "wpn_fps_ass_sub2000_fg_railed" .. parts_list.sub2ksuppb .. "}"
sub2kparts.string = parts_list.dummy_unit_open .. sub2kparts.override .. "}"
assert(loadstring(ovr_ids.sub2k .. unit_list.suppsmall .. sub2kparts.string))()
assert(loadstring(ovr_ids.sub2k .. unit_list.suppmedium .. sub2kparts.string))()
assert(loadstring(ovr_ids.sub2k .. unit_list.supplarge .. sub2kparts.string))()
end
-- VHS
if not tweak_data.weapon.factory.wpn_fps_ass_vhs.override then
	tweak_data.weapon.factory.wpn_fps_ass_vhs.override = {}
end
if WacMenu._data.replace_vhssuppb == true and not wac_nosuppressedsnds then
local vhsparts = {}
vhsparts.override  = ",override = {" .. "wpn_fps_ass_vhs_b_short" .. unit_list.vhssuppb .. "wpn_fps_ass_vhs_b_sniper" .. unit_list.vhssuppb .. "wpn_fps_ass_vhs_b_standard" .. unit_list.vhssuppb .. "}"
vhsparts.string = parts_list.dummy_unit_open .. vhsparts.override .. "}"
assert(loadstring(ovr_ids.vhs .. unit_list.suppsmall .. vhsparts.string))()
assert(loadstring(ovr_ids.vhs .. unit_list.suppmedium .. vhsparts.string))()
assert(loadstring(ovr_ids.vhs .. unit_list.supplarge .. vhsparts.string))()
end
if WacMenu._data.replace_vhsflashhider == true or WacMenu._data.replace_hidebarrelextarsmg == true then
assert(loadstring(ovr_ids.vhs .. unit_list.firepig .. parts_list.flashhider_vhs))()
assert(loadstring(ovr_ids.vhs .. unit_list.stubby .. parts_list.flashhider_vhs))()
assert(loadstring(ovr_ids.vhs .. unit_list.tank .. parts_list.flashhider_vhs))()
assert(loadstring(ovr_ids.vhs .. unit_list.jprifles .. parts_list.flashhider_vhs))()
assert(loadstring(ovr_ids.vhs .. unit_list.linear .. parts_list.flashhider_vhs))()
assert(loadstring(ovr_ids.vhs .. unit_list.surefire .. parts_list.flashhider_vhs))()
assert(loadstring(ovr_ids.vhs .. unit_list.battle .. parts_list.flashhider_vhs))()
end
if WacMenu._data.replace_hidesuppressors == true and wac_nosuppressedsnds == true then
assert(loadstring(ovr_ids.vhs .. unit_list.suppsmall .. parts_list.flashhider_vhs))()
assert(loadstring(ovr_ids.vhs .. unit_list.suppmedium .. parts_list.flashhider_vhs))()
assert(loadstring(ovr_ids.vhs .. unit_list.supplarge .. parts_list.flashhider_vhs))()
end
-- 870
if not tweak_data.weapon.factory.wpn_fps_shot_r870.override then
	tweak_data.weapon.factory.wpn_fps_shot_r870.override = {}
end
local replacer870 = {}
if WacMenu._data.replace_r870stock1 == 2 then
assert(loadstring(ovr_ids.r870 .. unit_list.r870nostock .. parts_list.r870solidstock .. "}"))()
elseif WacMenu._data.replace_r870stock1 == 3 then
assert(loadstring(ovr_ids.r870 .. unit_list.r870nostock .. parts_list.r870solidstockrail .. ",forbids = {\"wpn_fps_shot_r870_ris_special\"} }"))()
elseif WacMenu._data.replace_r870stock1 == 4 then
assert(loadstring(ovr_ids.r870 .. unit_list.r870nostock .. parts_list.r870nostockrail .. ",forbids = {\"wpn_fps_shot_r870_ris_special\"} }"))()
end
if WacMenu._data.replace_r870stock2 == 2 then
assert(loadstring(ovr_ids.r870 .. unit_list.r870solidstockrail .. parts_list.r870solidstock .. ",forbids = {} }"))()
elseif WacMenu._data.replace_r870stock2 == 3 then
assert(loadstring(ovr_ids.r870 .. unit_list.r870solidstockrail .. parts_list.r870nostock .. ",forbids = {} }"))()
elseif WacMenu._data.replace_r870stock2 == 4 then
assert(loadstring(ovr_ids.r870 .. unit_list.r870solidstockrail .. parts_list.r870nostockrail .. "}"))()
end
if WacMenu._data.replace_r870stock3 == 2 then
assert(loadstring(ovr_ids.r870 .. unit_list.m4mk46 .. parts_list.r870solidstock .. ",forbids = {},adds_type = {} }"))()
elseif WacMenu._data.replace_r870stock3 == 3 then
assert(loadstring(ovr_ids.r870 .. unit_list.m4mk46 .. parts_list.r870solidstockrail .. parts_list.ar15addadp))()
elseif WacMenu._data.replace_r870stock3 == 4 then
assert(loadstring(ovr_ids.r870 .. unit_list.m4mk46 .. parts_list.r870nostock .. ",forbids = {},adds_type = {} }"))()
elseif WacMenu._data.replace_r870stock3 == 5 then
assert(loadstring(ovr_ids.r870 .. unit_list.m4mk46 .. parts_list.r870nostockrail .. parts_list.ar15addadp))()
end
-- AA12
if WacMenu._data.replace_aa12suppb == true and not wac_nosuppressedsnds then
if not tweak_data.weapon.factory.wpn_fps_sho_aa12.override then
	tweak_data.weapon.factory.wpn_fps_sho_aa12.override = {}
end
local aa12parts = {}
aa12parts.override	= ",override = {" .. "wpn_fps_sho_aa12_barrel" .. parts_list.aa12suppb .. "wpn_fps_sho_aa12_barrel_long" .. parts_list.aa12suppb .. "}"
aa12parts.string = parts_list.dummy_unit_open .. aa12parts.override .. "}"
assert(loadstring(ovr_ids.aa12 .. unit_list.shsupp .. aa12parts.string))()
assert(loadstring(ovr_ids.aa12 .. unit_list.salvo12 .. aa12parts.string))()
end
-- Saiga 12K
if WacMenu._data.replace_s12kextmag == 2 then
assert(loadstring(ovr_ids.s12k .. unit_list.sgmtactmag .. parts_list.saiga5rnd))()
elseif WacMenu._data.replace_s12kextmag == 3 then
assert(loadstring(ovr_ids.s12k .. unit_list.sgmtactmag .. parts_list.saigadrum))()
end
if WacMenu._data.replace_ironsightssaiga == 2 then
assert(loadstring(ovr_ids.s12k .. unit_list.mrksr .. parts_list.sights_ddr .. parts_list.sights_a_or .. parts_list.sights_saigaoffset))()
assert(loadstring(ovr_ids.s12k .. unit_list.mrksf .. parts_list.sights_ddf .. parts_list.sights_a_of))()
elseif WacMenu._data.replace_ironsightssaiga == 3 then
assert(loadstring(ovr_ids.s12k .. unit_list.mrksr .. parts_list.sights_mbusr .. parts_list.sights_a_or .. parts_list.sights_saigaoffset))()
assert(loadstring(ovr_ids.s12k .. unit_list.mrksf .. parts_list.sights_mbusf .. parts_list.sights_a_of))()
end
if WacMenu._data.replace_s12kupperrec == 2 then
assert(loadstring(ovr_ids.s12k .. unit_list.akmupper .. parts_list.ak74upper))()
end
if WacMenu._data.replace_s12kstock1 == 2 then
assert(loadstring(ovr_ids.s12k .. unit_list.akskfoldable .. parts_list.dummy_unit))()
elseif WacMenu._data.replace_s12kstock1 == 3 then
assert(loadstring(ovr_ids.s12k .. unit_list.akskfoldable .. parts_list.akfolding .. "}"))()
elseif WacMenu._data.replace_s12kstock1 == 4 then
assert(loadstring(ovr_ids.s12k .. unit_list.akskfoldable .. parts_list.pslst))()
elseif WacMenu._data.replace_s12kstock1 == 5 then
assert(loadstring(ovr_ids.s12k .. unit_list.akskfoldable .. parts_list.akwoodst .. "}"))()
elseif WacMenu._data.replace_s12kstock1 == 6 then
assert(loadstring(ovr_ids.s12k .. unit_list.akskfoldable .. parts_list.rpkst .. "}"))()
elseif WacMenu._data.replace_s12kstock1 == 7 then
assert(loadstring(ovr_ids.s12k .. unit_list.akskfoldable .. parts_list.rpkwoodst .. "}"))()
end
if WacMenu._data.replace_s12kstock2 == 2 then
assert(loadstring(ovr_ids.s12k .. unit_list.m4mk46 .. parts_list.akskfoldable .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_s12kstock2 == 3 then
assert(loadstring(ovr_ids.s12k .. unit_list.m4mk46 .. parts_list.akfolding .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_s12kstock2 == 4 then
assert(loadstring(ovr_ids.s12k .. unit_list.m4mk46 .. parts_list.pslst))()
elseif WacMenu._data.replace_s12kstock2 == 5 then
assert(loadstring(ovr_ids.s12k .. unit_list.m4mk46 .. parts_list.akwoodst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_s12kstock2 == 6 then
assert(loadstring(ovr_ids.s12k .. unit_list.m4mk46 .. parts_list.rpkst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmstock4 == 7 then
assert(loadstring(ovr_ids.s12k .. unit_list.m4mk46 .. parts_list.rpkwoodst .. parts_list.ak_grip_noadp))()
end
if WacMenu._data.replace_s12kstock3 == 2 then
assert(loadstring(ovr_ids.s12k .. unit_list.akwood .. parts_list.akskfoldable .. "}"))()
elseif WacMenu._data.replace_s12kstock3 == 3 then
assert(loadstring(ovr_ids.s12k .. unit_list.akwood .. parts_list.akfolding .. "}"))()
elseif WacMenu._data.replace_s12kstock3 == 4 then
assert(loadstring(ovr_ids.s12k .. unit_list.akwood .. parts_list.pslst))()
elseif WacMenu._data.replace_s12kstock1 == 5 then
assert(loadstring(ovr_ids.s12k .. unit_list.akwood .. parts_list.rpkst .. "}"))()
elseif WacMenu._data.replace_s12kstock1 == 6 then
assert(loadstring(ovr_ids.s12k .. unit_list.akwood .. parts_list.rpkwoodst .. "}"))()
end
-- Short 870
if WacMenu._data.replace_short870stock1 == 2 then
assert(loadstring(ovr_ids.s870 .. unit_list.s870solidstockrail .. parts_list.r870nostock .. ",forbids = {} }"))()
elseif WacMenu._data.replace_short870stock1 == 3 then
assert(loadstring(ovr_ids.s870 .. unit_list.s870solidstockrail .. parts_list.r870solidstock .. ",forbids = {} }"))()
elseif WacMenu._data.replace_short870stock1 == 4 then
assert(loadstring(ovr_ids.s870 .. unit_list.s870solidstockrail .. parts_list.s870nostockrail .. "}"))()
end
if WacMenu._data.replace_short870stock2 == 2 then
assert(loadstring(ovr_ids.s870 .. unit_list.s870nostockrail .. parts_list.r870nostock .. ",forbids = {} }"))()
elseif WacMenu._data.replace_short870stock2 == 3 then
assert(loadstring(ovr_ids.s870 .. unit_list.s870nostockrail .. parts_list.r870solidstock .. ",forbids = {} }"))()
elseif WacMenu._data.replace_short870stock2 == 4 then
assert(loadstring(ovr_ids.s870 .. unit_list.s870nostockrail .. parts_list.s870solidstockrail .. "}"))()
end
if WacMenu._data.replace_short870stock3 == 2 then
assert(loadstring(ovr_ids.s870 .. unit_list.m4mk46 .. parts_list.r870nostock .. ",forbids = {},adds_type = {} }"))()
elseif WacMenu._data.replace_short870stock3 == 3 then
assert(loadstring(ovr_ids.s870 .. unit_list.m4mk46 .. parts_list.r870solidstock .. ",forbids = {},adds_type = {} }"))()
elseif WacMenu._data.replace_short870stock3 == 4 then
assert(loadstring(ovr_ids.s870 .. unit_list.m4mk46 .. parts_list.s870solidstockrail .. parts_list.ar15addadp))()
elseif WacMenu._data.replace_short870stock3 == 5 then
assert(loadstring(ovr_ids.s870 .. unit_list.m4mk46 .. parts_list.s870solidstockrail .. parts_list.ar15addadp))()
end
-- Striker
if WacMenu._data.replace_ironsightsstriker == 2 then
assert(loadstring(ovr_ids.striker .. unit_list.mrksr .. parts_list.sights_ddr .. ",a_obj = \"a_o_r\"," .. parts_list.sights_strikeroffset))()
assert(loadstring(ovr_ids.striker .. unit_list.mrksf .. parts_list.sights_ddf .. ",a_obj = \"a_o_f\"}"))()
elseif WacMenu._data.replace_ironsightsstriker == 3 then
assert(loadstring(ovr_ids.striker .. unit_list.mrksr .. parts_list.sights_mbusr .. ",a_obj = \"a_o_r\"," .. parts_list.sights_strikeroffset))()
assert(loadstring(ovr_ids.striker .. unit_list.mrksf .. parts_list.sights_mbusf .. ",a_obj = \"a_o_f\"}"))()
end
-- M249
if not tweak_data.weapon.factory.wpn_fps_lmg_m249.override then
	tweak_data.weapon.factory.wpn_fps_lmg_m249.override = {}
end
if WacMenu._data.replace_m249bipod == true then
assert(loadstring(ovr_ids.m249 .. unit_list.lionbipod .. parts_list.m249bipod))()
end
if WacMenu._data.replace_m249stock == 2 then
assert(loadstring(ovr_ids.m249 .. unit_list.m4standard .. parts_list.m249para))()
assert(loadstring(ovr_ids.m249 .. unit_list.m4pts .. parts_list.m249para))()
assert(loadstring(ovr_ids.m249 .. unit_list.m4crane .. parts_list.m249para))()
assert(loadstring(ovr_ids.m249 .. unit_list.m4mk46 .. parts_list.m249para))()
assert(loadstring(ovr_ids.m249 .. unit_list.m4ubr .. parts_list.m249para))()
assert(loadstring(ovr_ids.m249 .. unit_list.m4vltor .. parts_list.m249para))()
elseif WacMenu._data.replace_m249stock == 3 then
assert(loadstring(ovr_ids.m249 .. unit_list.m4standard .. parts_list.m249solid))()
assert(loadstring(ovr_ids.m249 .. unit_list.m4pts .. parts_list.m249solid))()
assert(loadstring(ovr_ids.m249 .. unit_list.m4crane .. parts_list.m249solid))()
assert(loadstring(ovr_ids.m249 .. unit_list.m4mk46 .. parts_list.m249solid))()
assert(loadstring(ovr_ids.m249 .. unit_list.m4ubr .. parts_list.m249solid))()
assert(loadstring(ovr_ids.m249 .. unit_list.m4vltor .. parts_list.m249solid))()
end
-- MG42
if not tweak_data.weapon.factory.wpn_fps_lmg_mg42.override then
	tweak_data.weapon.factory.wpn_fps_lmg_mg42.override = {}
end
if WacMenu._data.replace_mg42_dlt19 == true and not wac_nosuppressedsnds then
local mg42parts = {}
mg42parts.override	= ", override = {" .. "wpn_fps_lmg_mg42_b_mg42" .. unit_list.mg42swb .. "wpn_fps_lmg_mg42_b_mg34" .. unit_list.mg42swb .. "}"
mg42parts.string = parts_list.dummy_unit_open .. mg42parts.override .. "}"
assert(loadstring(ovr_ids.mg42 .. unit_list.suppsmall .. mg42parts.string))()
assert(loadstring(ovr_ids.mg42 .. unit_list.suppmedium .. mg42parts.string))()
assert(loadstring(ovr_ids.mg42 .. unit_list.supplarge .. mg42parts.string))()
end
-- RPK
if not tweak_data.weapon.factory.wpn_fps_lmg_rpk.override then
	tweak_data.weapon.factory.wpn_fps_lmg_rpk.override = {}
end
if WacMenu._data.replace_rpkpbs1 == true and not wac_nosuppressedsnds then
assert(loadstring(ovr_ids.rpk .. unit_list.suppsmall .. parts_list.pbs1))()
assert(loadstring(ovr_ids.rpk .. unit_list.suppmedium .. parts_list.pbs1))()
assert(loadstring(ovr_ids.rpk .. unit_list.supplarge .. parts_list.pbs1))()
end
if WacMenu._data.replace_rpkbipod == true then
assert(loadstring(ovr_ids.rpk .. unit_list.lionbipod .. parts_list.m249bipod))()
end
if WacMenu._data.replace_rpkstock1 == 2 then
assert(loadstring(ovr_ids.rpk .. unit_list.m4mk46 .. parts_list.akskfoldable .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_rpkstock1 == 3 then
assert(loadstring(ovr_ids.rpk .. unit_list.m4mk46 .. parts_list.akfolding .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_rpkstock1 == 4 then
assert(loadstring(ovr_ids.rpk .. unit_list.m4mk46 .. parts_list.pslst))()
elseif WacMenu._data.replace_rpkstock1 == 5 then
assert(loadstring(ovr_ids.rpk .. unit_list.m4mk46 .. parts_list.rpkst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_rpkstock1 == 6 then
assert(loadstring(ovr_ids.rpk .. unit_list.m4mk46 .. parts_list.rpkwoodst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_rpkstock1 == 7 then
assert(loadstring(ovr_ids.rpk .. unit_list.m4mk46 .. parts_list.akwoodst .. parts_list.ak_grip_noadp))()
end
if WacMenu._data.replace_rpkstock2 == 2 then
assert(loadstring(ovr_ids.rpk .. unit_list.akwood .. parts_list.akskfoldable .. "}"))()
elseif WacMenu._data.replace_rpkstock2 == 3 then
assert(loadstring(ovr_ids.rpk .. unit_list.akwood .. parts_list.akfolding .. "}"))()
elseif WacMenu._data.replace_rpkstock2 == 4 then
assert(loadstring(ovr_ids.rpk .. unit_list.akwood .. parts_list.pslst))()
elseif WacMenu._data.replace_rpkstock2 == 5 then
assert(loadstring(ovr_ids.rpk .. unit_list.akwood .. parts_list.rpkst .. "}"))()
elseif WacMenu._data.replace_rpkstock2 == 6 then
assert(loadstring(ovr_ids.rpk .. unit_list.akwood .. parts_list.rpkwoodst .. "}"))()
end
-- 1911
if WacMenu._data.replace_1911_ipsccomp == 2 then
assert(loadstring(ovr_ids.m1911 .. unit_list.ipsccomp .. parts_list.m1911_co1 .. "}"))()
assert(loadstring(ovr_ids.m1911_x .. unit_list.ipsccomp .. parts_list.m1911_co1 .. "}"))()
elseif WacMenu._data.replace_1911_ipsccomp == 3 then
assert(loadstring(ovr_ids.m1911 .. unit_list.ipsccomp .. parts_list.m1911_co2 .. "}"))()
assert(loadstring(ovr_ids.m1911_x .. unit_list.ipsccomp .. parts_list.m1911_co2 .. "}"))()
elseif WacMenu._data.replace_1911_ipsccomp == 4 then
assert(loadstring(ovr_ids.m1911 .. unit_list.ipsccomp .. parts_list.pis_meatgrinder .. "}"))()
assert(loadstring(ovr_ids.m1911_x .. unit_list.ipsccomp .. parts_list.pis_meatgrinder .. "}"))()
elseif WacMenu._data.replace_1911_ipsccomp == 5 then
assert(loadstring(ovr_ids.m1911 .. unit_list.ipsccomp .. parts_list.pis_flashhider .. "}"))()
assert(loadstring(ovr_ids.m1911_x .. unit_list.ipsccomp .. parts_list.pis_flashhider .. "}"))()
elseif WacMenu._data.replace_1911_ipsccomp == 6 then
assert(loadstring(ovr_ids.m1911 .. unit_list.ipsccomp .. parts_list.dummy_unit))()
assert(loadstring(ovr_ids.m1911_x .. unit_list.ipsccomp .. parts_list.dummy_unit))()
end
if WacMenu._data.replace_1911_meatgrinder == 2 then
assert(loadstring(ovr_ids.m1911 .. unit_list.meatgrinder .. parts_list.m1911_co1 .. "}"))()
assert(loadstring(ovr_ids.m1911_x .. unit_list.meatgrinder .. parts_list.m1911_co1 .. "}"))()
elseif WacMenu._data.replace_1911_meatgrinder == 3 then
assert(loadstring(ovr_ids.m1911 .. unit_list.meatgrinder .. parts_list.m1911_co2 .. "}"))()
assert(loadstring(ovr_ids.m1911_x .. unit_list.meatgrinder .. parts_list.m1911_co2 .. "}"))()
elseif WacMenu._data.replace_1911_meatgrinder == 4 then
assert(loadstring(ovr_ids.m1911 .. unit_list.meatgrinder .. parts_list.pis_ipsccomp .. "}"))()
assert(loadstring(ovr_ids.m1911_x .. unit_list.meatgrinder .. parts_list.pis_ipsccomp .. "}"))()
elseif WacMenu._data.replace_1911_meatgrinder == 5 then
assert(loadstring(ovr_ids.m1911 .. unit_list.meatgrinder .. parts_list.pis_flashhider .. "}"))()
assert(loadstring(ovr_ids.m1911_x .. unit_list.meatgrinder .. parts_list.pis_flashhider .. "}"))()
elseif WacMenu._data.replace_1911_meatgrinder == 6 then
assert(loadstring(ovr_ids.m1911 .. unit_list.meatgrinder .. parts_list.dummy_unit))()
assert(loadstring(ovr_ids.m1911_x .. unit_list.meatgrinder .. parts_list.dummy_unit))()
end
if WacMenu._data.replace_1911_pisflash == 2 then
assert(loadstring(ovr_ids.m1911 .. unit_list.pisflash .. parts_list.m1911_co1 .. "}"))()
assert(loadstring(ovr_ids.m1911_x .. unit_list.pisflash .. parts_list.m1911_co1 .. "}"))()
elseif WacMenu._data.replace_1911_pisflash == 3 then
assert(loadstring(ovr_ids.m1911 .. unit_list.pisflash .. parts_list.m1911_co2 .. "}"))()
assert(loadstring(ovr_ids.m1911_x .. unit_list.pisflash .. parts_list.m1911_co2 .. "}"))()
elseif WacMenu._data.replace_1911_pisflash == 4 then
assert(loadstring(ovr_ids.m1911 .. unit_list.pisflash .. parts_list.pis_ipsccomp .. "}"))()
assert(loadstring(ovr_ids.m1911_x .. unit_list.pisflash .. parts_list.pis_ipsccomp .. "}"))()
elseif WacMenu._data.replace_1911_pisflash == 5 then
assert(loadstring(ovr_ids.m1911 .. unit_list.pisflash .. parts_list.pis_meatgrinder .. "}"))()
assert(loadstring(ovr_ids.m1911_x .. unit_list.pisflash .. parts_list.pis_meatgrinder .. "}"))()
elseif WacMenu._data.replace_1911_pisflash == 6 then
assert(loadstring(ovr_ids.m1911 .. unit_list.pisflash .. parts_list.dummy_unit))()
assert(loadstring(ovr_ids.m1911_x .. unit_list.pisflash .. parts_list.dummy_unit))()
end
if WacMenu._data.replace_hidemarksman == true then
assert(loadstring(ovr_ids.m1911 .. unit_list.mrksr2 .. parts_list.dummy_unit_open .. ",forbids = {} }"))()
assert(loadstring(ovr_ids.m1911 .. unit_list.mrksf .. parts_list.dummy_unit))()
end
-- 92FS
if WacMenu._data.replace_92fs_ipsccomp == 2 then
assert(loadstring(ovr_ids.b92fs .. unit_list.ipsccomp .. parts_list.b92fs_co1 .. "}"))()
assert(loadstring(ovr_ids.b92fs_x .. unit_list.ipsccomp .. parts_list.b92fs_co1 .. "}"))()
elseif WacMenu._data.replace_92fs_ipsccomp == 3 then
assert(loadstring(ovr_ids.b92fs .. unit_list.ipsccomp .. parts_list.b92fs_co2 .. "}"))()
assert(loadstring(ovr_ids.b92fs_x .. unit_list.ipsccomp .. parts_list.b92fs_co2 .. "}"))()
elseif WacMenu._data.replace_92fs_ipsccomp == 4 then
assert(loadstring(ovr_ids.b92fs .. unit_list.ipsccomp .. parts_list.pis_meatgrinder .. "}"))()
assert(loadstring(ovr_ids.b92fs_x .. unit_list.ipsccomp .. parts_list.pis_meatgrinder .. "}"))()
elseif WacMenu._data.replace_92fs_ipsccomp == 5 then
assert(loadstring(ovr_ids.b92fs .. unit_list.ipsccomp .. parts_list.pis_flashhider .. "}"))()
assert(loadstring(ovr_ids.b92fs_x .. unit_list.ipsccomp .. parts_list.pis_flashhider .. "}"))()
elseif WacMenu._data.replace_92fs_ipsccomp == 6 then
assert(loadstring(ovr_ids.b92fs .. unit_list.ipsccomp .. parts_list.dummy_unit .. "}"))()
assert(loadstring(ovr_ids.b92fs_x .. unit_list.ipsccomp .. parts_list.dummy_unit .. "}"))()
end
if WacMenu._data.replace_92fs_meatgrinder == 2 then
assert(loadstring(ovr_ids.b92fs .. unit_list.meatgrinder .. parts_list.b92fs_co1 .. "}"))()
assert(loadstring(ovr_ids.b92fs_x .. unit_list.meatgrinder .. parts_list.b92fs_co1 .. "}"))()
elseif WacMenu._data.replace_92fs_meatgrinder == 3 then
assert(loadstring(ovr_ids.b92fs .. unit_list.meatgrinder .. parts_list.b92fs_co2 .. "}"))()
assert(loadstring(ovr_ids.b92fs_x .. unit_list.meatgrinder .. parts_list.b92fs_co2 .. "}"))()
elseif WacMenu._data.replace_92fs_meatgrinder == 4 then
assert(loadstring(ovr_ids.b92fs .. unit_list.meatgrinder .. parts_list.pis_ipsccomp .. "}"))()
assert(loadstring(ovr_ids.b92fs_x .. unit_list.meatgrinder .. parts_list.pis_ipsccomp .. "}"))()
elseif WacMenu._data.replace_92fs_meatgrinder == 5 then
assert(loadstring(ovr_ids.b92fs .. unit_list.meatgrinder .. parts_list.pis_flashhider .. "}"))()
assert(loadstring(ovr_ids.b92fs_x .. unit_list.meatgrinder .. parts_list.pis_flashhider .. "}"))()
elseif WacMenu._data.replace_92fs_meatgrinder == 6 then
assert(loadstring(ovr_ids.b92fs .. unit_list.meatgrinder .. parts_list.dummy_unit))()
assert(loadstring(ovr_ids.b92fs_x .. unit_list.meatgrinder .. parts_list.dummy_unit))()
end
if WacMenu._data.replace_92fs_pisflash == 2 then
assert(loadstring(ovr_ids.b92fs .. unit_list.pisflash .. parts_list.b92fs_co1 .. ",parent = \"lower_reciever\"}"))()
assert(loadstring(ovr_ids.b92fs_x .. unit_list.pisflash .. parts_list.b92fs_co1 .. ",parent = \"lower_reciever\"}"))()
elseif WacMenu._data.replace_92fs_pisflash == 3 then
assert(loadstring(ovr_ids.b92fs .. unit_list.pisflash .. parts_list.b92fs_co2 .. ",parent = \"lower_reciever\"}"))()
assert(loadstring(ovr_ids.b92fs_x .. unit_list.pisflash .. parts_list.b92fs_co2 .. ",parent = \"lower_reciever\"}"))()
elseif WacMenu._data.replace_92fs_pisflash == 4 then
assert(loadstring(ovr_ids.b92fs .. unit_list.pisflash .. parts_list.pis_ipsccomp .. ",parent = \"lower_reciever\"}"))()
assert(loadstring(ovr_ids.b92fs_x .. unit_list.pisflash .. parts_list.pis_ipsccomp .. ",parent = \"lower_reciever\"}"))()
elseif WacMenu._data.replace_92fs_pisflash == 5 then
assert(loadstring(ovr_ids.b92fs .. unit_list.pisflash .. parts_list.pis_meatgrinder .. ",parent = \"lower_reciever\"}"))()
assert(loadstring(ovr_ids.b92fs_x .. unit_list.pisflash .. parts_list.pis_meatgrinder .. ",parent = \"lower_reciever\"}"))()
elseif WacMenu._data.replace_92fs_pisflash == 6 then
assert(loadstring(ovr_ids.b92fs .. unit_list.pisflash .. parts_list.dummy_unit_open .. ",parent = \"lower_reciever\"}"))()
assert(loadstring(ovr_ids.b92fs_x .. unit_list.pisflash .. parts_list.dummy_unit_open .. ",parent = \"lower_reciever\"}"))()
end
if WacMenu._data.replace_hidemarksman == true then
assert(loadstring(ovr_ids.b92fs .. unit_list.mrksr2 .. parts_list.b92fs_rearsight))()
assert(loadstring(ovr_ids.b92fs .. unit_list.mrksf .. parts_list.dummy_unit))()
end
-- C96
if WacMenu._data.replace_c96_dl44 == true then
assert(loadstring(ovr_ids.c96 .. unit_list.pisflash .. parts_list.dl44ns))()
assert(loadstring(ovr_ids.c96 .. "wpn_fps_upg_ns_pis_large" .. parts_list.dl44ns))()
assert(loadstring(ovr_ids.c96 .. "wpn_fps_upg_ns_pis_medium" .. parts_list.dl44ns))()
assert(loadstring(ovr_ids.c96 .. "wpn_fps_upg_ns_pis_small" .. parts_list.dl44ns))()
assert(loadstring(ovr_ids.c96 .. "wpn_fps_upg_ns_pis_large_kac" .. parts_list.dl44ns))()
assert(loadstring(ovr_ids.c96 .. "wpn_fps_upg_ns_pis_medium_gem" .. parts_list.dl44ns))()
assert(loadstring(ovr_ids.c96 .. "wpn_fps_upg_ns_pis_medium_slim" .. parts_list.dl44ns))()
assert(loadstring(ovr_ids.c96 .. "wpn_fps_upg_ns_ass_filter" .. parts_list.dl44ns))()
assert(loadstring(ovr_ids.c96 .. "wpn_fps_upg_ns_pis_jungle" .. parts_list.dl44ns))()
assert(loadstring(ovr_ids.c96_x .. unit_list.pisflash .. parts_list.dl44ns))()
assert(loadstring(ovr_ids.c96_x .. "wpn_fps_upg_ns_pis_large" .. parts_list.dl44ns))()
assert(loadstring(ovr_ids.c96_x .. "wpn_fps_upg_ns_pis_medium" .. parts_list.dl44ns))()
assert(loadstring(ovr_ids.c96_x .. "wpn_fps_upg_ns_pis_small" .. parts_list.dl44ns))()
assert(loadstring(ovr_ids.c96_x .. "wpn_fps_upg_ns_pis_large_kac" .. parts_list.dl44ns))()
assert(loadstring(ovr_ids.c96_x .. "wpn_fps_upg_ns_pis_medium_gem" .. parts_list.dl44ns))()
assert(loadstring(ovr_ids.c96_x .. "wpn_fps_upg_ns_pis_medium_slim" .. parts_list.dl44ns))()
assert(loadstring(ovr_ids.c96_x .. "wpn_fps_upg_ns_ass_filter" .. parts_list.dl44ns))()
assert(loadstring(ovr_ids.c96_x .. "wpn_fps_upg_ns_pis_jungle" .. parts_list.dl44ns))()
end
-- Deagle
if WacMenu._data.replace_hidemarksman == true then
assert(loadstring(ovr_ids.deagle .. unit_list.mrksr2 .. parts_list.dummy_unit_open .. ",forbids = {} }"))()
assert(loadstring(ovr_ids.deagle .. unit_list.mrksf .. parts_list.dummy_unit_open .. ",a_obj = \"a_os\" }"))()
end
-- Jericho 941
if WacMenu._data.replace_jericho941comp == true then
local j941parts = {}
j941parts.override	= ", override = {" .. "wpn_fps_pis_sparrow_b_941" .. parts_list.jericho941comp .. "wpn_fps_pis_sparrow_b_rpl" .. parts_list.jericho941comp .. "wpn_fps_pis_sparrow_b_threaded" .. parts_list.jericho941comp .. "}"
j941parts.string = parts_list.dummy_unit_open .. j941parts.override .. "}"
assert(loadstring(ovr_ids.jericho941 .. unit_list.pisflash .. j941parts.string))()
assert(loadstring(ovr_ids.jericho941 .. unit_list.ipsccomp .. j941parts.string))()
assert(loadstring(ovr_ids.jericho941 .. unit_list.meatgrinder .. j941parts.string))()
end
-- P30L
if WacMenu._data.replace_p30lwickcomp == true then
assert(loadstring(ovr_ids.p30l .. unit_list.pisflash .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l .. unit_list.ipsccomp .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l .. unit_list.meatgrinder .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l_x .. unit_list.pisflash .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l_x .. unit_list.ipsccomp .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l_x .. unit_list.meatgrinder .. parts_list.p30lwickcomp))()
end
if WacMenu._data.replace_p30lwickcompsupp == true and wac_nosuppressedsnds == true then
assert(loadstring(ovr_ids.p30l .. unit_list.pissupplarge .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l .. unit_list.pissuppmedium .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l .. unit_list.pissuppsmall .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l .. unit_list.pissuppkac .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l .. unit_list.pissuppgem .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l .. unit_list.pissuppslim .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l .. unit_list.pissuppfilter .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l .. unit_list.pissuppsnake .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l_x .. unit_list.pissupplarge .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l_x .. unit_list.pissuppmedium .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l_x .. unit_list.pissuppsmall .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l_x .. unit_list.pissuppkac .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l_x .. unit_list.pissuppgem .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l_x .. unit_list.pissuppslim .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l_x .. unit_list.pissuppfilter .. parts_list.p30lwickcomp))()
assert(loadstring(ovr_ids.p30l_x .. unit_list.pissuppsnake .. parts_list.p30lwickcomp))()
end
-- AKMSU
if not tweak_data.weapon.factory.wpn_fps_smg_akmsu.override then
	tweak_data.weapon.factory.wpn_fps_smg_akmsu.override = {}
end
if WacMenu._data.replace_akmsuupperrec == 2 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akmupper .. parts_list.ak74upper))()
end
if WacMenu._data.replace_akmsupbs1 == true and not wac_nosuppressedsnds then
assert(loadstring(ovr_ids.akmsu .. unit_list.suppsmall .. parts_list.pbs1))()
assert(loadstring(ovr_ids.akmsu .. unit_list.suppmedium .. parts_list.pbs1))()
assert(loadstring(ovr_ids.akmsu .. unit_list.supplarge .. parts_list.pbs1))()
end
if WacMenu._data.replace_akmsuquad == 2 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akquad .. parts_list.rpkmag))()
elseif WacMenu._data.replace_akmsuquad == 3 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akquad .. parts_list.rpkdrum))()
elseif WacMenu._data.replace_akmsuquad == 4 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akquad .. parts_list.akmmag))()
elseif WacMenu._data.replace_akmsuquad == 5 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akquad .. parts_list.ak74mag))()
elseif WacMenu._data.replace_akmsuquad == 5 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akquad .. parts_list.uspalm_ak30))()
end
if WacMenu._data.replace_akmsuuspalm == 2 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akuspalm .. parts_list.akmmag))()
elseif WacMenu._data.replace_akmsuuspalm == 3 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akuspalm .. parts_list.ak74mag))()
end
if WacMenu._data.replace_akmsumagpulassist == 2 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akmagpul .. parts_list.akmmag))()
elseif WacMenu._data.replace_akmsumagpulassist == 3 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akmagpul .. parts_list.ak74mag))()
end
if WacMenu._data.replace_akmsustock1 == 2 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akskfoldable .. parts_list.dummy_unit_open .. "}"))()
elseif WacMenu._data.replace_akmsustock1 == 3 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akskfoldable .. parts_list.akfolding .. "}"))()
elseif WacMenu._data.replace_akmsustock1 == 4 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akskfoldable .. parts_list.pslst))()
elseif WacMenu._data.replace_akmsustock1 == 5 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akskfoldable .. parts_list.akwoodst .. "}"))()
elseif WacMenu._data.replace_akmsustock1 == 6 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akskfoldable .. parts_list.ar15stndst .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmsustock1 == 7 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akskfoldable .. parts_list.ar15pts .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmsustock1 == 8 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akskfoldable .. parts_list.ar15vltor .. parts_list.ak_grip_adp))()
end
if WacMenu._data.replace_akmsustock2 == 2 then
assert(loadstring(ovr_ids.akmsu .. unit_list.m4mk46 .. parts_list.akskfoldable .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmsustock2 == 3 then
assert(loadstring(ovr_ids.akmsu .. unit_list.m4mk46 .. parts_list.akfolding .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmsustock2 == 4 then
assert(loadstring(ovr_ids.akmsu .. unit_list.m4mk46 .. parts_list.pslst))()
elseif WacMenu._data.replace_akmsustock2 == 5 then
assert(loadstring(ovr_ids.akmsu .. unit_list.m4mk46 .. parts_list.akwoodst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmsustock2 == 6 then
assert(loadstring(ovr_ids.akmsu .. unit_list.m4mk46 .. parts_list.rpkst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmsustock2 == 7 then
assert(loadstring(ovr_ids.akmsu .. unit_list.m4mk46 .. parts_list.rpkwoodst .. parts_list.ak_grip_noadp))()
elseif WacMenu._data.replace_akmsustock2 == 8 then
assert(loadstring(ovr_ids.akmsu .. unit_list.m4mk46 .. parts_list.ar15stndst .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmsustock2 == 9 then
assert(loadstring(ovr_ids.akmsu .. unit_list.m4mk46 .. parts_list.ar15pts .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmsustock2 == 10 then
assert(loadstring(ovr_ids.akmsu .. unit_list.m4mk46 .. parts_list.ar15vltor .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmsustock2 == 11 then
assert(loadstring(ovr_ids.akmsu .. unit_list.m4mk46 .. parts_list.dummy_unit_open .. parts_list.ak_grip_noadp))()
end
if WacMenu._data.replace_akmsustock3 == 2 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akwood .. parts_list.akskfoldable .. "}"))()
elseif WacMenu._data.replace_akmsustock3 == 3 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akwood .. parts_list.akfolding .. "}"))()
elseif WacMenu._data.replace_akmsustock3 == 4 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akwood .. parts_list.pslst))()
elseif WacMenu._data.replace_akmsustock3 == 5 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akwood .. parts_list.rpkst .. "}"))()
elseif WacMenu._data.replace_akmsustock3 == 6 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akwood .. parts_list.rpkwoodst .. "}"))()
elseif WacMenu._data.replace_akmsustock3 == 7 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akwood .. parts_list.ar15stndst .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmsustock3 == 8 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akwood .. parts_list.ar15pts .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmsustock3 == 9 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akwood .. parts_list.ar15vltor .. parts_list.ak_grip_adp))()
elseif WacMenu._data.replace_akmsustock3 == 10 then
assert(loadstring(ovr_ids.akmsu .. unit_list.akwood .. parts_list.dummy_unit_open .. "}"))()
end
-- AKMSU Akimbo
if not tweak_data.weapon.factory.wpn_fps_smg_x_akmsu.override.wpn_fps_upg_ak_m_quad then
log("[ERROR] WAC: Missing override table for Akimbo AKMSU wpn_fps_upg_ak_m_quad - Option not executed")
	wac_no_ak_m_quad = true
end
if not tweak_data.weapon.factory.wpn_fps_smg_x_akmsu.override.wpn_fps_upg_ak_m_uspalm then
log("[ERROR] WAC: Missing override table for Akimbo AKMSU wpn_fps_upg_ak_m_uspalm - Option not executed")
	wac_no_ak_m_uspalm = true
end
if WacMenu._data.replace_akmsupbs1 == true and not wac_nosuppressedsnds then
assert(loadstring(ovr_ids.akmsu_x .. unit_list.suppsmall .. parts_list.pbs1))()
assert(loadstring(ovr_ids.akmsu_x .. unit_list.suppmedium .. parts_list.pbs1))()
assert(loadstring(ovr_ids.akmsu_x .. unit_list.supplarge .. parts_list.pbs1))()
end
if WacMenu._data.replace_akmsuquad == 2 and not wac_no_ak_m_quad then
assert(loadstring(ovr_ids.akmsu_x .. "wpn_fps_upg_ak_m_quad.unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_m_standard\""))()
assert(loadstring(ovr_ids.akmsu_x .. "wpn_fps_upg_ak_m_quad.third_unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_m_standard\""))()
elseif WacMenu._data.replace_akmsuquad == 3 and not wac_no_ak_m_quad then
assert(loadstring(ovr_ids.akmsu_x .. "wpn_fps_upg_ak_m_quad.unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_lmg_rpk_m_drum\""))()
assert(loadstring(ovr_ids.akmsu_x .. "wpn_fps_upg_ak_m_quad.third_unit = \"units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_m_drum\""))()
elseif WacMenu._data.replace_akmsuquad == 4 and not wac_no_ak_m_quad then
assert(loadstring(ovr_ids.akmsu_x .. "wpn_fps_upg_ak_m_quad.unit = \"units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_m_akm\""))()
assert(loadstring(ovr_ids.akmsu_x .. "wpn_fps_upg_ak_m_quad.third_unit = \"units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_m_akm\""))()
elseif WacMenu._data.replace_akmsuquad == 5 and not wac_no_ak_m_quad then
assert(loadstring(ovr_ids.akmsu_x .. "wpn_fps_upg_ak_m_quad.unit = \"units/payday2/weapons/wpn_fps_ass_74_pts/wpn_fps_ass_74_m_standard\""))()
assert(loadstring(ovr_ids.akmsu_x .. "wpn_fps_upg_ak_m_quad.third_unit = \"units/payday2/weapons/wpn_third_ass_74_pts/wpn_third_ass_74_m_standard\""))()
elseif WacMenu._data.replace_akmsuquad == 6 and not wac_no_ak_m_quad then
assert(loadstring(ovr_ids.akmsu_x .. "wpn_fps_upg_ak_m_quad.unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_ak_m_uspalm/wpn_fps_upg_ak_m_uspalm\""))()
assert(loadstring(ovr_ids.akmsu_x .. "wpn_fps_upg_ak_m_quad.third_unit = \"units/pd2_dlc_akm4_modpack/weapons/wpn_third_upg_ak_m_uspalm/wpn_third_upg_ak_m_uspalm\""))()
end
if WacMenu._data.replace_akmsuuspalm == 2 and not wac_no_ak_m_uspalm then
assert(loadstring(ovr_ids.akmsu_x .. "wpn_fps_upg_ak_m_uspalm.unit = \"units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_m_akm\""))()
assert(loadstring(ovr_ids.akmsu_x .. "wpn_fps_upg_ak_m_uspalm.third_unit = \"units/payday2/weapons/wpn_third_upg_ak_reusable/wpn_third_upg_ak_m_akm\""))()
elseif WacMenu._data.replace_akmsuuspalm == 3 and not wac_no_ak_m_uspalm then
assert(loadstring(ovr_ids.akmsu_x .. "wpn_fps_upg_ak_m_uspalm.unit = \"units/payday2/weapons/wpn_fps_ass_74_pts/wpn_fps_ass_74_m_standard\""))()
assert(loadstring(ovr_ids.akmsu_x .. "wpn_fps_upg_ak_m_uspalm.third_unit = \"units/payday2/weapons/wpn_third_ass_74_pts/wpn_third_ass_74_m_standard\""))()
end
if WacMenu._data.replace_akmsumagpulassist == 2 then
assert(loadstring(ovr_ids.akmsu_x .. unit_list.akmagpul .. parts_list.akmmag))()
elseif WacMenu._data.replace_akmsumagpulassist == 3 then
assert(loadstring(ovr_ids.akmsu_x .. unit_list.akmagpul .. parts_list.ak74mag))()
end
-- Cobray M-11/9
if not tweak_data.weapon.factory.wpn_fps_smg_cobray.override then
	tweak_data.weapon.factory.wpn_fps_smg_cobray.override = {}
end
if not tweak_data.weapon.factory.wpn_fps_smg_x_cobray.override then
	tweak_data.weapon.factory.wpn_fps_smg_x_cobray.override = {}
end
if WacMenu._data.replace_cobraybarrelext == true then
assert(loadstring(ovr_ids.m119 .. unit_list.firepig .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.m119 .. unit_list.stubby .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.m119 .. unit_list.tank .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.m119 .. unit_list.jprifles .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.m119 .. unit_list.linear .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.m119 .. unit_list.surefire .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.m119 .. unit_list.battle .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.m119_x .. unit_list.firepig .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.m119_x .. unit_list.stubby .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.m119_x .. unit_list.tank .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.m119_x .. unit_list.jprifles .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.m119_x .. unit_list.linear .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.m119_x .. unit_list.surefire .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.m119_x .. unit_list.battle .. parts_list.m119barrelext))()
end
if WacMenu._data.replace_cobraywerbellssup == true and not wac_nosuppressedsnds then
assert(loadstring(ovr_ids.m119 .. unit_list.suppsmall .. parts_list.werbellssupp))()
assert(loadstring(ovr_ids.m119 .. unit_list.suppmedium .. parts_list.werbellssupp))()
assert(loadstring(ovr_ids.m119 .. unit_list.supplarge .. parts_list.werbellssupp))()
assert(loadstring(ovr_ids.m119_x .. unit_list.suppsmall .. parts_list.werbellssupp))()
assert(loadstring(ovr_ids.m119_x .. unit_list.suppmedium .. parts_list.werbellssupp))()
assert(loadstring(ovr_ids.m119_x .. unit_list.supplarge .. parts_list.werbellssupp))()
end
if WacMenu._data.replace_m119stock == 2 then
assert(loadstring(ovr_ids.m119 .. unit_list.m4standard .. parts_list.m119stock))()
assert(loadstring(ovr_ids.m119 .. unit_list.m4pts .. parts_list.m119stock))()
assert(loadstring(ovr_ids.m119 .. unit_list.m4crane .. parts_list.m119stock))()
assert(loadstring(ovr_ids.m119 .. unit_list.m4mk46 .. parts_list.m119stock))()
assert(loadstring(ovr_ids.m119 .. unit_list.m4ubr .. parts_list.m119stock))()
assert(loadstring(ovr_ids.m119 .. unit_list.m4vltor .. parts_list.m119stock))()
elseif WacMenu._data.replace_m119stock == 3 then
assert(loadstring(ovr_ids.m119 .. unit_list.m4standard .. parts_list.dummy_unit_open .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.m119 .. unit_list.m4pts .. parts_list.dummy_unit_open .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.m119 .. unit_list.m4crane .. parts_list.dummy_unit_open .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.m119 .. unit_list.m4mk46 .. parts_list.dummy_unit_open .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.m119 .. unit_list.m4ubr .. parts_list.dummy_unit_open .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.m119 .. unit_list.m4vltor .. parts_list.dummy_unit_open .. parts_list.ar15noadp))()
end
-- CZ-805
if not tweak_data.weapon.factory.wpn_fps_smg_hajk.override then
	tweak_data.weapon.factory.wpn_fps_smg_hajk.override = {}
end
if WacMenu._data.replace_cz805flashhider == true or WacMenu._data.replace_hidebarrelextarsmg == true then
assert(loadstring(ovr_ids.cz805 .. unit_list.firepig .. parts_list.flashhider_cz805))()
assert(loadstring(ovr_ids.cz805 .. unit_list.stubby .. parts_list.flashhider_cz805))()
assert(loadstring(ovr_ids.cz805 .. unit_list.tank .. parts_list.flashhider_cz805))()
assert(loadstring(ovr_ids.cz805 .. unit_list.jprifles .. parts_list.flashhider_cz805))()
assert(loadstring(ovr_ids.cz805 .. unit_list.linear .. parts_list.flashhider_cz805))()
assert(loadstring(ovr_ids.cz805 .. unit_list.surefire .. parts_list.flashhider_cz805))()
assert(loadstring(ovr_ids.cz805 .. unit_list.battle .. parts_list.flashhider_cz805))()
assert(loadstring(ovr_ids.cz805_x .. unit_list.firepig .. parts_list.flashhider_cz805))()
assert(loadstring(ovr_ids.cz805_x .. unit_list.stubby .. parts_list.flashhider_cz805))()
assert(loadstring(ovr_ids.cz805_x .. unit_list.tank .. parts_list.flashhider_cz805))()
assert(loadstring(ovr_ids.cz805_x .. unit_list.jprifles .. parts_list.flashhider_cz805))()
assert(loadstring(ovr_ids.cz805_x .. unit_list.linear .. parts_list.flashhider_cz805))()
assert(loadstring(ovr_ids.cz805_x .. unit_list.surefire .. parts_list.flashhider_cz805))()
assert(loadstring(ovr_ids.cz805_x .. unit_list.battle .. parts_list.flashhider_cz805))()
end
if WacMenu._data.replace_hidesuppressors == true and wac_nosuppressedsnds == true then
assert(loadstring(ovr_ids.cz805 .. unit_list.suppsmall .. parts_list.flashhider_cz805))()
assert(loadstring(ovr_ids.cz805 .. unit_list.suppmedium .. parts_list.flashhider_cz805))()
assert(loadstring(ovr_ids.cz805 .. unit_list.supplarge .. parts_list.flashhider_cz805))()
assert(loadstring(ovr_ids.cz805_x .. unit_list.suppsmall .. parts_list.flashhider_cz805))()
assert(loadstring(ovr_ids.cz805_x .. unit_list.suppmedium .. parts_list.flashhider_cz805))()
assert(loadstring(ovr_ids.cz805_x .. unit_list.supplarge .. parts_list.flashhider_cz805))()
end
-- K23
if not tweak_data.weapon.factory.wpn_fps_smg_olympic.override then
	tweak_data.weapon.factory.wpn_fps_smg_olympic.override = {}
end
if WacMenu._data.replace_k23medimumb == 2 then
assert(loadstring(ovr_ids.k23 .. unit_list.ar15medium .. parts_list.ar15shortb .. "}"))()
elseif WacMenu._data.replace_k23medimumb == 3 then
assert(loadstring(ovr_ids.k23 .. unit_list.ar15medium .. parts_list.ar15longb))()
end
if WacMenu._data.replace_k23stock1 == 2 then
assert(loadstring(ovr_ids.k23 .. unit_list.k23short .. parts_list.k23shortstandardst))()
elseif WacMenu._data.replace_k23stock1 == 3 then
assert(loadstring(ovr_ids.k23 .. unit_list.k23short .. parts_list.ar15stndst .. parts_list.ar15addadp))()
elseif WacMenu._data.replace_k23stock1 == 4 then
assert(loadstring(ovr_ids.k23 .. unit_list.k23short .. parts_list.ar15pts .. parts_list.ar15addadp))()
elseif WacMenu._data.replace_k23stock1 == 5 then
assert(loadstring(ovr_ids.k23 .. unit_list.k23short .. parts_list.m16a4solid))()
elseif WacMenu._data.replace_k23stock1 == 6 then
assert(loadstring(ovr_ids.k23 .. unit_list.k23short .. parts_list.ar15crane .. parts_list.ar15addadp))()
elseif WacMenu._data.replace_k23stock1 == 7 then
assert(loadstring(ovr_ids.k23 .. unit_list.k23short .. parts_list.hk416cst))()
elseif WacMenu._data.replace_k23stock1 == 8 then
assert(loadstring(ovr_ids.k23 .. unit_list.k23short .. parts_list.ar15vltor .. "}"))()
end
if WacMenu._data.replace_k23stock2 == 2 then
assert(loadstring(ovr_ids.k23 .. unit_list.m4mk46 .. parts_list.k23shortestst))()
elseif WacMenu._data.replace_k23stock2 == 3 then
assert(loadstring(ovr_ids.k23 .. unit_list.m4mk46 .. parts_list.k23shortstandardst))()
elseif WacMenu._data.replace_k23stock2 == 5 then
assert(loadstring(ovr_ids.k23 .. unit_list.m4mk46 .. parts_list.ar15stndst .. "}"))()
elseif WacMenu._data.replace_k23stock2 == 6 then
assert(loadstring(ovr_ids.k23 .. unit_list.m4mk46 .. parts_list.ar15pts .. "}"))()
elseif WacMenu._data.replace_k23stock2 == 7 then
assert(loadstring(ovr_ids.k23 .. unit_list.m4mk46 .. parts_list.m16a4solid))()
elseif WacMenu._data.replace_k23stock2 == 8 then
assert(loadstring(ovr_ids.k23 .. unit_list.m4mk46 .. parts_list.ar15crane .. "}"))()
elseif WacMenu._data.replace_k23stock2 == 9 then
assert(loadstring(ovr_ids.k23 .. unit_list.m4mk46 .. parts_list.hk416cst))()
elseif WacMenu._data.replace_k23stock2 == 10 then
assert(loadstring(ovr_ids.k23 .. unit_list.m4mk46 .. parts_list.ar15vltor .. "}"))()
end
-- L2A3
if not tweak_data.weapon.factory.wpn_fps_smg_sterling.override then
	tweak_data.weapon.factory.wpn_fps_smg_sterling.override = {}
end
local l2a3parts = {}
l2a3parts.override1	 = ", override = {" .. "wpn_fps_smg_sterling_b_standard" .. unit_list.l2a3suppb .. "wpn_fps_smg_sterling_b_short" .. unit_list.l2a3suppb .. "wpn_fps_smg_sterling_b_long" .. unit_list.l2a3suppb .. "}"
l2a3parts.string1 = parts_list.dummy_unit_open .. l2a3parts.override1 .. "}"
l2a3parts.override2	 = ", override = {" .. "wpn_fps_smg_sterling_b_standard" .. unit_list.l2a3e11 .. "wpn_fps_smg_sterling_b_short" .. unit_list.l2a3e11 .. "wpn_fps_smg_sterling_b_long" .. unit_list.l2a3e11 .. "}"
l2a3parts.string2 = parts_list.dummy_unit_open .. l2a3parts.override2 .. "}"
if WacMenu._data.replace_l2a1supp == 2 and not wac_nosuppressedsnds then
assert(loadstring(ovr_ids.l2a3 .. unit_list.suppsmall .. l2a3parts.string1))()
assert(loadstring(ovr_ids.l2a3 .. unit_list.suppmedium .. l2a3parts.string1))()
assert(loadstring(ovr_ids.l2a3 .. unit_list.supplarge .. l2a3parts.string1))()
elseif WacMenu._data.replace_l2a1supp == 3 and not wac_nosuppressedsnds then
assert(loadstring(ovr_ids.l2a3 .. unit_list.suppsmall .. l2a3parts.string2))()
assert(loadstring(ovr_ids.l2a3 .. unit_list.suppmedium .. l2a3parts.string2))()
assert(loadstring(ovr_ids.l2a3 .. unit_list.supplarge .. l2a3parts.string2))()
end
-- MAC-10
if WacMenu._data.replace_mac10barrelext == true then
assert(loadstring(ovr_ids.mac10 .. unit_list.firepig .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.mac10 .. unit_list.stubby .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.mac10 .. unit_list.tank .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.mac10 .. unit_list.jprifles .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.mac10 .. unit_list.linear .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.mac10 .. unit_list.surefire .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.mac10 .. unit_list.battle .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.mac10_x .. unit_list.firepig .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.mac10_x .. unit_list.stubby .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.mac10_x .. unit_list.tank .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.mac10_x .. unit_list.jprifles .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.mac10_x .. unit_list.linear .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.mac10_x .. unit_list.surefire .. parts_list.m119barrelext))()
assert(loadstring(ovr_ids.mac10_x .. unit_list.battle .. parts_list.m119barrelext))()
end
if WacMenu._data.replace_mac10werbellssup == true and not wac_nosuppressedsnds then
assert(loadstring(ovr_ids.mac10 .. unit_list.suppsmall .. parts_list.werbellssupp))()
assert(loadstring(ovr_ids.mac10 .. unit_list.suppmedium .. parts_list.werbellssupp))()
assert(loadstring(ovr_ids.mac10 .. unit_list.supplarge .. parts_list.werbellssupp))()
assert(loadstring(ovr_ids.mac10_x .. unit_list.suppsmall .. parts_list.werbellssupp))()
assert(loadstring(ovr_ids.mac10_x .. unit_list.suppmedium .. parts_list.werbellssupp))()
assert(loadstring(ovr_ids.mac10_x .. unit_list.supplarge .. parts_list.werbellssupp))()
end
-- Micro UZI
if not tweak_data.weapon.factory.wpn_fps_smg_baka.override then
	tweak_data.weapon.factory.wpn_fps_smg_baka.override = {}
end
if not tweak_data.weapon.factory.wpn_fps_smg_x_baka.override then
	tweak_data.weapon.factory.wpn_fps_smg_x_baka.override = {}
end
if WacMenu._data.replace_microuzisupp == 2 and not wac_nosuppressedsnds then
assert(loadstring(ovr_ids.microuzi .. unit_list.suppsmall .. parts_list.microuzilongsupp))()
assert(loadstring(ovr_ids.microuzi .. unit_list.suppmedium .. parts_list.microuzilongsupp))()
assert(loadstring(ovr_ids.microuzi .. unit_list.supplarge .. parts_list.microuzilongsupp))()
assert(loadstring(ovr_ids.microuzi_x .. unit_list.suppsmall .. parts_list.microuzilongsupp))()
assert(loadstring(ovr_ids.microuzi_x .. unit_list.suppmedium .. parts_list.microuzilongsupp))()
assert(loadstring(ovr_ids.microuzi_x .. unit_list.supplarge .. parts_list.microuzilongsupp))()
elseif WacMenu._data.replace_microuzisupp == 3 and not wac_nosuppressedsnds then
assert(loadstring(ovr_ids.microuzi .. unit_list.suppsmall .. parts_list.microuzimidsupp))()
assert(loadstring(ovr_ids.microuzi .. unit_list.suppmedium .. parts_list.microuzimidsupp))()
assert(loadstring(ovr_ids.microuzi .. unit_list.supplarge .. parts_list.microuzimidsupp))()
assert(loadstring(ovr_ids.microuzi_x .. unit_list.suppsmall .. parts_list.microuzimidsupp))()
assert(loadstring(ovr_ids.microuzi_x .. unit_list.suppmedium .. parts_list.microuzimidsupp))()
assert(loadstring(ovr_ids.microuzi_x .. unit_list.supplarge .. parts_list.microuzimidsupp))()
elseif WacMenu._data.replace_microuzisupp == 4 and not wac_nosuppressedsnds then
assert(loadstring(ovr_ids.microuzi .. unit_list.suppsmall .. parts_list.microuzismallsupp))()
assert(loadstring(ovr_ids.microuzi .. unit_list.suppmedium .. parts_list.microuzismallsupp))()
assert(loadstring(ovr_ids.microuzi .. unit_list.supplarge .. parts_list.microuzismallsupp))()
assert(loadstring(ovr_ids.microuzi_x .. unit_list.suppsmall .. parts_list.microuzismallsupp))()
assert(loadstring(ovr_ids.microuzi_x .. unit_list.suppmedium .. parts_list.microuzismallsupp))()
assert(loadstring(ovr_ids.microuzi_x .. unit_list.supplarge .. parts_list.microuzismallsupp))()
end
-- MP7
if WacMenu._data.replace_mp7qd == true and not wac_nosuppressedsnds then
if not tweak_data.weapon.factory.wpn_fps_smg_mp7.override then
	tweak_data.weapon.factory.wpn_fps_smg_mp7.override = {}
end
assert(loadstring(ovr_ids.mp7 .. unit_list.suppsmall .. parts_list.mp7qd))()
assert(loadstring(ovr_ids.mp7 .. unit_list.suppmedium .. parts_list.mp7qd))()
assert(loadstring(ovr_ids.mp7 .. unit_list.supplarge .. parts_list.mp7qd))()
assert(loadstring(ovr_ids.mp7_x .. unit_list.suppsmall .. parts_list.mp7qd))()
assert(loadstring(ovr_ids.mp7_x .. unit_list.suppmedium .. parts_list.mp7qd))()
assert(loadstring(ovr_ids.mp7_x .. unit_list.supplarge .. parts_list.mp7qd))()
end
-- MP9
if WacMenu._data.replace_mp9supp == true and not wac_nosuppressedsnds then
if not tweak_data.weapon.factory.wpn_fps_smg_mp9.override then
	tweak_data.weapon.factory.wpn_fps_smg_mp9.override = {}
end
assert(loadstring(ovr_ids.mp9 .. unit_list.suppsmall .. parts_list.mp9supp))()
assert(loadstring(ovr_ids.mp9 .. unit_list.suppmedium .. parts_list.mp9supp))()
assert(loadstring(ovr_ids.mp9 .. unit_list.supplarge .. parts_list.mp9supp))()
assert(loadstring(ovr_ids.mp9_x .. unit_list.suppsmall .. parts_list.mp9supp))()
assert(loadstring(ovr_ids.mp9_x .. unit_list.suppmedium .. parts_list.mp9supp))()
assert(loadstring(ovr_ids.mp9_x .. unit_list.supplarge .. parts_list.mp9supp))()
end
-- P90
if WacMenu._data.replace_ironsightsp90 == 2 then
assert(loadstring(ovr_ids.p90 .. unit_list.mrksr .. parts_list.sights_ddr .. parts_list.sights_a_or .. parts_list.sights_p90offset))()
assert(loadstring(ovr_ids.p90 .. unit_list.mrksf .. parts_list.sights_ddf .. parts_list.sights_a_of))()
assert(loadstring(ovr_ids.p90_x .. unit_list.mrksr .. parts_list.sights_ddr .. parts_list.sights_a_or .. parts_list.sights_p90offset))()
assert(loadstring(ovr_ids.p90_x .. unit_list.mrksf .. parts_list.sights_ddf .. parts_list.sights_a_of))()
elseif WacMenu._data.replace_ironsightsp90 == 3 then
assert(loadstring(ovr_ids.p90 .. unit_list.mrksr .. parts_list.sights_mbusr .. parts_list.sights_a_or .. parts_list.sights_p90offset))()
assert(loadstring(ovr_ids.p90 .. unit_list.mrksf .. parts_list.sights_mbusf .. parts_list.sights_a_of))()
assert(loadstring(ovr_ids.p90_x .. unit_list.mrksr .. parts_list.sights_mbusr .. parts_list.sights_a_or .. parts_list.sights_p90offset))()
assert(loadstring(ovr_ids.p90_x .. unit_list.mrksf .. parts_list.sights_mbusf .. parts_list.sights_a_of))()
end
if WacMenu._data.replace_p90ninjab == true and not wac_nosuppressedsnds then
local p90parts = {}
p90parts.override  = ", override = {" .. "wpn_fps_smg_p90_b_short" .. parts_list.p90ninja .. "wpn_fps_smg_p90_b_long" .. parts_list.p90ninja .. "wpn_fps_smg_p90_b_civilian" .. parts_list.p90ninja .. "}"
p90parts.string = parts_list.dummy_unit_open .. p90parts.override .. "}"
assert(loadstring(ovr_ids.p90 .. unit_list.suppsmall .. p90parts.string))()
assert(loadstring(ovr_ids.p90 .. unit_list.suppmedium .. p90parts.string))()
assert(loadstring(ovr_ids.p90 .. unit_list.supplarge .. p90parts.string))()
assert(loadstring(ovr_ids.p90_x .. unit_list.suppsmall .. p90parts.string))()
assert(loadstring(ovr_ids.p90_x .. unit_list.suppmedium .. p90parts.string))()
assert(loadstring(ovr_ids.p90_x .. unit_list.supplarge .. p90parts.string))()
end
-- SR-2
if WacMenu._data.replace_sr2msupp == true and not wac_nosuppressedsnds then
if not tweak_data.weapon.factory.wpn_fps_smg_sr2.override then
	tweak_data.weapon.factory.wpn_fps_smg_sr2.override = {}
end
if not tweak_data.weapon.factory.wpn_fps_smg_x_sr2.override then
	tweak_data.weapon.factory.wpn_fps_smg_x_sr2.override = {}
end
assert(loadstring(ovr_ids.sr2 .. unit_list.suppsmall .. parts_list.sr2supp))()
assert(loadstring(ovr_ids.sr2 .. unit_list.suppmedium .. parts_list.sr2supp))()
assert(loadstring(ovr_ids.sr2 .. unit_list.supplarge .. parts_list.sr2supp))()
assert(loadstring(ovr_ids.sr2_x .. unit_list.suppsmall .. parts_list.sr2supp))()
assert(loadstring(ovr_ids.sr2_x .. unit_list.suppmedium .. parts_list.sr2supp))()
assert(loadstring(ovr_ids.sr2_x .. unit_list.supplarge .. parts_list.sr2supp))()
end
-- UMP45
if WacMenu._data.replace_ump45supp == true and not wac_nosuppressedsnds then
if not tweak_data.weapon.factory.wpn_fps_smg_schakal.override then
	tweak_data.weapon.factory.wpn_fps_smg_schakal.override = {}
end
assert(loadstring(ovr_ids.ump45 .. unit_list.suppsmall .. parts_list.umpgemtech))()
assert(loadstring(ovr_ids.ump45 .. unit_list.suppmedium .. parts_list.umpgemtech))()
assert(loadstring(ovr_ids.ump45 .. unit_list.supplarge .. parts_list.umpgemtech))()
assert(loadstring(ovr_ids.ump45_x .. unit_list.suppsmall .. parts_list.umpgemtech))()
assert(loadstring(ovr_ids.ump45_x .. unit_list.suppmedium .. parts_list.umpgemtech))()
assert(loadstring(ovr_ids.ump45_x .. unit_list.supplarge .. parts_list.umpgemtech))()
end
-- UZI
if not tweak_data.weapon.factory.wpn_fps_smg_uzi.override then
	tweak_data.weapon.factory.wpn_fps_smg_uzi.override = {}
end
if not tweak_data.weapon.factory.wpn_fps_smg_x_uzi.override then
	tweak_data.weapon.factory.wpn_fps_smg_x_uzi.override = {}
end
if WacMenu._data.replace_uzisuppb == true and not wac_nosuppressedsnds then
assert(loadstring(ovr_ids.uzi .. unit_list.suppsmall .. parts_list.uzisupp))()
assert(loadstring(ovr_ids.uzi .. unit_list.suppmedium .. parts_list.uzisupp))()
assert(loadstring(ovr_ids.uzi .. unit_list.supplarge .. parts_list.uzisupp))()
assert(loadstring(ovr_ids.uzi_x .. unit_list.suppsmall .. parts_list.uzisupp))()
assert(loadstring(ovr_ids.uzi_x .. unit_list.suppmedium .. parts_list.uzisupp))()
assert(loadstring(ovr_ids.uzi_x .. unit_list.supplarge .. parts_list.uzisupp))()
end
if WacMenu._data.replace_uzix_removevg == true then
assert(loadstring(ovr_ids.uzi_x .. "wpn_fps_smg_uzi_fg_rail = {adds = {}}"))()
end
-- Vector
if not tweak_data.weapon.factory.wpn_fps_smg_polymer.override then
	tweak_data.weapon.factory.wpn_fps_smg_polymer.override = {}
end
if not tweak_data.weapon.factory.wpn_fps_smg_x_polymer.override then
	tweak_data.weapon.factory.wpn_fps_smg_x_polymer.override = {}
end
if WacMenu._data.replace_vectorcrb == true then
assert(loadstring(ovr_ids.vector .. unit_list.firepig .. parts_list.vectorcrb))()
assert(loadstring(ovr_ids.vector .. unit_list.stubby .. parts_list.vectorcrb))()
assert(loadstring(ovr_ids.vector .. unit_list.tank .. parts_list.vectorcrb))()
assert(loadstring(ovr_ids.vector .. unit_list.jprifles .. parts_list.vectorcrb))()
assert(loadstring(ovr_ids.vector .. unit_list.linear .. parts_list.vectorcrb))()
assert(loadstring(ovr_ids.vector .. unit_list.surefire .. parts_list.vectorcrb))()
assert(loadstring(ovr_ids.vector .. unit_list.battle .. parts_list.vectorcrb))()
assert(loadstring(ovr_ids.vector_x .. unit_list.firepig .. parts_list.vectorcrb))()
assert(loadstring(ovr_ids.vector_x .. unit_list.stubby .. parts_list.vectorcrb))()
assert(loadstring(ovr_ids.vector_x .. unit_list.tank .. parts_list.vectorcrb))()
assert(loadstring(ovr_ids.vector_x .. unit_list.jprifles .. parts_list.vectorcrb))()
assert(loadstring(ovr_ids.vector_x .. unit_list.linear .. parts_list.vectorcrb))()
assert(loadstring(ovr_ids.vector_x .. unit_list.surefire .. parts_list.vectorcrb))()
assert(loadstring(ovr_ids.vector_x .. unit_list.battle .. parts_list.vectorcrb))()
end
if WacMenu._data.replace_vectorhps == true and not wac_nosuppressedsnds then
assert(loadstring(ovr_ids.vector .. unit_list.suppsmall .. parts_list.vectorhps))()
assert(loadstring(ovr_ids.vector .. unit_list.suppmedium .. parts_list.vectorhps))()
assert(loadstring(ovr_ids.vector .. unit_list.supplarge .. parts_list.vectorhps))()
assert(loadstring(ovr_ids.vector_x .. unit_list.suppsmall .. parts_list.vectorhps))()
assert(loadstring(ovr_ids.vector_x .. unit_list.suppmedium .. parts_list.vectorhps))()
assert(loadstring(ovr_ids.vector_x .. unit_list.supplarge .. parts_list.vectorhps))()
end
if WacMenu._data.replace_vectorstock == true then
assert(loadstring(ovr_ids.vector .. unit_list.m4standard .. parts_list.vectorstock))()
assert(loadstring(ovr_ids.vector .. unit_list.m4pts .. parts_list.vectorstock))()
assert(loadstring(ovr_ids.vector .. unit_list.m4crane .. parts_list.vectorstock))()
assert(loadstring(ovr_ids.vector .. unit_list.m4mk46 .. parts_list.vectorstock))()
assert(loadstring(ovr_ids.vector .. unit_list.m4ubr .. parts_list.vectorstock))()
assert(loadstring(ovr_ids.vector .. unit_list.m4vltor .. parts_list.vectorstock))()
end
-- VZ61
if WacMenu._data.replace_vz61suppb == true and not wac_nosuppressedsnds then
if not tweak_data.weapon.factory.wpn_fps_smg_scorpion.override then
	tweak_data.weapon.factory.wpn_fps_smg_scorpion.override = {}
end
local vz61parts = {}
vz61parts.override	= ", override = {" .. "wpn_fps_smg_scorpion_b_standard" .. parts_list.vz61supp .. "}"
vz61parts.string1 = parts_list.dummy_unit_open .. vz61parts.override .. "}"
assert(loadstring(ovr_ids.vz61 .. unit_list.suppsmall .. vz61parts.string1))()
assert(loadstring(ovr_ids.vz61 .. unit_list.suppmedium .. vz61parts.string1))()
assert(loadstring(ovr_ids.vz61 .. unit_list.supplarge .. vz61parts.string1))()
assert(loadstring(ovr_ids.vz61_x .. unit_list.suppsmall .. vz61parts.string1))()
assert(loadstring(ovr_ids.vz61_x .. unit_list.suppmedium .. vz61parts.string1))()
assert(loadstring(ovr_ids.vz61_x .. unit_list.supplarge .. vz61parts.string1))()
end
-- HK417
if not tweak_data.weapon.factory.wpn_fps_ass_contraband.override then
	tweak_data.weapon.factory.wpn_fps_ass_contraband.override = {}
end
if WacMenu._data.replace_hk417comp == true or WacMenu._data.replace_hidebarrelextarsmg == true then
assert(loadstring(ovr_ids.hk417 .. unit_list.firepig .. parts_list.flashhider_hk417))()
assert(loadstring(ovr_ids.hk417 .. unit_list.stubby .. parts_list.flashhider_hk417))()
assert(loadstring(ovr_ids.hk417 .. unit_list.tank .. parts_list.flashhider_hk417))()
assert(loadstring(ovr_ids.hk417 .. unit_list.jprifles .. parts_list.flashhider_hk417))()
assert(loadstring(ovr_ids.hk417 .. unit_list.linear .. parts_list.flashhider_hk417))()
assert(loadstring(ovr_ids.hk417 .. unit_list.surefire .. parts_list.flashhider_hk417))()
assert(loadstring(ovr_ids.hk417 .. unit_list.battle .. parts_list.flashhider_hk417))()
end
if WacMenu._data.replace_hidesuppressors == true and wac_nosuppressedsnds == true then
assert(loadstring(ovr_ids.hk417 .. unit_list.suppsmall .. parts_list.flashhider_hk417))()
assert(loadstring(ovr_ids.hk417 .. unit_list.suppmedium .. parts_list.flashhider_hk417))()
assert(loadstring(ovr_ids.hk417 .. unit_list.supplarge .. parts_list.flashhider_hk417))()
end
-- SIX12
if WacMenu._data.replace_six12suppb == true and not wac_nosuppressedsnds then
if not tweak_data.weapon.factory.wpn_fps_sho_rota.override then
	tweak_data.weapon.factory.wpn_fps_sho_rota.override = {}
end
if not tweak_data.weapon.factory.wpn_fps_sho_x_rota.override then
	tweak_data.weapon.factory.wpn_fps_sho_x_rota.override = {}
end
local six12parts = {}
six12parts.override	 = ", override = {" .. "wpn_fps_sho_rota_b_long" .. parts_list.six12suppb .. "wpn_fps_sho_rota_b_short" .. parts_list.six12suppb .. "}"
six12parts.string1 = parts_list.dummy_unit_open .. six12parts.override .. "}"
assert(loadstring(ovr_ids.six12 .. unit_list.shsupp .. six12parts.string1))()
assert(loadstring(ovr_ids.six12 .. unit_list.salvo12 .. six12parts.string1))()
assert(loadstring(ovr_ids.six12_x .. unit_list.shsupp .. six12parts.string1))()
assert(loadstring(ovr_ids.six12_x .. unit_list.salvo12 .. six12parts.string1))()
end
-- MG42
if not tweak_data.weapon.factory.wpn_fps_lmg_mg42.override then
	tweak_data.weapon.factory.wpn_fps_lmg_mg42.override = {}
end
if WacMenu._data.replace_hidebarrelextarsmg == true then
assert(loadstring(ovr_ids.mg42 .. unit_list.firepig .. parts_list.flashhider_mg42))()
assert(loadstring(ovr_ids.mg42 .. unit_list.stubby .. parts_list.flashhider_mg42))()
assert(loadstring(ovr_ids.mg42 .. unit_list.tank .. parts_list.flashhider_mg42))()
assert(loadstring(ovr_ids.mg42 .. unit_list.jprifles .. parts_list.flashhider_mg42))()
assert(loadstring(ovr_ids.mg42 .. unit_list.linear .. parts_list.flashhider_mg42))()
assert(loadstring(ovr_ids.mg42 .. unit_list.surefire .. parts_list.flashhider_mg42))()
assert(loadstring(ovr_ids.mg42 .. unit_list.battle .. parts_list.flashhider_mg42))()
end
if WacMenu._data.replace_hidesuppressors == true and wac_nosuppressedsnds == true then
assert(loadstring(ovr_ids.mg42 .. unit_list.suppsmall .. parts_list.flashhider_mg42))()
assert(loadstring(ovr_ids.mg42 .. unit_list.suppmedium .. parts_list.flashhider_mg42))()
assert(loadstring(ovr_ids.mg42 .. unit_list.supplarge .. parts_list.flashhider_mg42))()
end
-- M1928
if not tweak_data.weapon.factory.wpn_fps_smg_thompson.override then
	tweak_data.weapon.factory.wpn_fps_smg_thompson.override = {}
end
if not tweak_data.weapon.factory.wpn_fps_smg_x_m1928.override then
	tweak_data.weapon.factory.wpn_fps_smg_x_m1928.override = {}
end
if WacMenu._data.replace_hidebarrelextarsmg == true then
assert(loadstring(ovr_ids.m1928 .. unit_list.firepig .. parts_list.flashhider_m1928))()
assert(loadstring(ovr_ids.m1928 .. unit_list.stubby .. parts_list.flashhider_m1928))()
assert(loadstring(ovr_ids.m1928 .. unit_list.tank .. parts_list.flashhider_m1928))()
assert(loadstring(ovr_ids.m1928 .. unit_list.jprifles .. parts_list.flashhider_m1928))()
assert(loadstring(ovr_ids.m1928 .. unit_list.linear .. parts_list.flashhider_m1928))()
assert(loadstring(ovr_ids.m1928 .. unit_list.surefire .. parts_list.flashhider_m1928))()
assert(loadstring(ovr_ids.m1928 .. unit_list.battle .. parts_list.flashhider_m1928))()
assert(loadstring(ovr_ids.m1928_x .. unit_list.firepig .. parts_list.flashhider_m1928))()
assert(loadstring(ovr_ids.m1928_x .. unit_list.stubby .. parts_list.flashhider_m1928))()
assert(loadstring(ovr_ids.m1928_x .. unit_list.tank .. parts_list.flashhider_m1928))()
assert(loadstring(ovr_ids.m1928_x .. unit_list.jprifles .. parts_list.flashhider_m1928))()
assert(loadstring(ovr_ids.m1928_x .. unit_list.linear .. parts_list.flashhider_m1928))()
assert(loadstring(ovr_ids.m1928_x .. unit_list.surefire .. parts_list.flashhider_m1928))()
assert(loadstring(ovr_ids.m1928_x .. unit_list.battle .. parts_list.flashhider_m1928))()
end
if WacMenu._data.replace_hidesuppressors == true and wac_nosuppressedsnds == true then
assert(loadstring(ovr_ids.m1928 .. unit_list.suppsmall .. parts_list.flashhider_m1928))()
assert(loadstring(ovr_ids.m1928 .. unit_list.suppmedium .. parts_list.flashhider_m1928))()
assert(loadstring(ovr_ids.m1928 .. unit_list.supplarge .. parts_list.flashhider_m1928))()
assert(loadstring(ovr_ids.m1928_x .. unit_list.suppsmall .. parts_list.flashhider_m1928))()
assert(loadstring(ovr_ids.m1928_x .. unit_list.suppmedium .. parts_list.flashhider_m1928))()
assert(loadstring(ovr_ids.m1928_x .. unit_list.supplarge .. parts_list.flashhider_m1928))()
end
-- TTI TR-1
if not tweak_data.weapon.factory.wpn_fps_snp_tti.override then
	tweak_data.weapon.factory.wpn_fps_snp_tti.override = {}
end
if WacMenu._data.replace_ttitr1grip == true then
assert(loadstring(ovr_ids.ttitr1 .. unit_list.ar15ergogrip .. parts_list.ttitr1grip))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.ar15snpgrip .. parts_list.ttitr1grip))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.ar15hgrip .. parts_list.ttitr1grip))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.ar15mgrip .. parts_list.ttitr1grip))()
end
if WacMenu._data.replace_ttitr1stock == 2 then
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4fold .. parts_list.ar15vltor .. parts_list.ar15addadp))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4pts .. parts_list.ar15vltor .. "}"))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4crane .. parts_list.ar15vltor .. "}"))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4mk46 .. parts_list.ar15vltor .. "}"))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4ubr .. parts_list.ar15vltor .. "}"))()
elseif WacMenu._data.replace_ttitr1stock == 3 then
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4pts .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4crane .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4mk46 .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4ubr .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4vltor .. parts_list.m4a1foldingst .. parts_list.ar15noadp))()
elseif WacMenu._data.replace_ttitr1stock == 4 then
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4fold .. parts_list.ar15stndst .. parts_list.ar15addadp))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4pts .. parts_list.ar15stndst .. "}"))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4crane .. parts_list.ar15stndst .. "}"))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4mk46 .. parts_list.ar15stndst .. "}"))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4ubr .. parts_list.ar15stndst .. "}"))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4vltor .. parts_list.ar15stndst .. "}"))()
elseif WacMenu._data.replace_ttitr1stock == 5 then
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4fold .. parts_list.ar15pts .. parts_list.ar15addadp))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4pts .. parts_list.ar15pts .. "}"))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4crane .. parts_list.ar15pts .. "}"))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4mk46 .. parts_list.ar15pts .. "}"))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4ubr .. parts_list.ar15pts .. "}"))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4vltor .. parts_list.ar15pts .. "}"))()
elseif WacMenu._data.replace_ttitr1stock == 6 then
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4fold .. parts_list.ar15crane .. parts_list.ar15addadp))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4pts .. parts_list.ar15crane .. "}"))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4crane .. parts_list.ar15crane .. "}"))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4mk46 .. parts_list.ar15crane .. "}"))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4ubr .. parts_list.ar15crane .. "}"))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4vltor .. parts_list.ar15crane .. "}"))()
elseif WacMenu._data.replace_ttitr1stock == 7 then
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4fold .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4pts .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4crane .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4mk46 .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4ubr .. parts_list.hk417solid))()
assert(loadstring(ovr_ids.ttitr1 .. unit_list.m4vltor .. parts_list.hk417solid))()
end
-- Glock 26
if WacMenu._data.replace_g26ext == 2 then
assert(loadstring(ovr_ids.g26 .. "wpn_fps_pis_g18c_m_mag_33rnd = {unit = \"units/pd2_crimefest_2014/oct22/weapons/wpn_fps_pis_g26_pts/wpn_fps_pis_g26_m_standard\", third_unit = \"units/pd2_crimefest_2014/oct22/weapons/wpn_third_pis_g26_pts/wpn_third_pis_g26_m_standard\"}"))()
elseif WacMenu._data.replace_g26ext == 3 then
assert(loadstring(ovr_ids.g26 .. "wpn_fps_pis_g18c_m_mag_33rnd = {unit = \"units/pd2_crimefest_2014/oct22/weapons/wpn_fps_pis_g26_pts/wpn_fps_pis_g26_m_contour\", third_unit = \"units/pd2_crimefest_2014/oct22/weapons/wpn_third_pis_g26_pts/wpn_third_pis_g26_m_contour\"}"))()
end
-- Akimbo Glock 26
if WacMenu._data.replace_g26ext == 2 then
assert(loadstring(ovr_ids.g26_x .. "wpn_fps_pis_g18c_m_mag_33rnd = {unit = \"units/pd2_crimefest_2014/oct22/weapons/wpn_fps_pis_g26_pts/wpn_fps_pis_g26_m_standard\", third_unit = \"units/pd2_crimefest_2014/oct22/weapons/wpn_third_pis_g26_pts/wpn_third_pis_g26_m_standard\"}"))()
elseif WacMenu._data.replace_g26ext == 3 then
assert(loadstring(ovr_ids.g26_x .. "wpn_fps_pis_g18c_m_mag_33rnd = {unit = \"units/pd2_crimefest_2014/oct22/weapons/wpn_fps_pis_g26_pts/wpn_fps_pis_g26_m_contour\", third_unit = \"units/pd2_crimefest_2014/oct22/weapons/wpn_third_pis_g26_pts/wpn_third_pis_g26_m_contour\"}"))()
end
-- AK-12
if not tweak_data.weapon.factory.wpn_fps_ass_flint.override then
	tweak_data.weapon.factory.wpn_fps_ass_flint.override = {}
end
if WacMenu._data.replace_ak12pbs1 == true and not wac_nosuppressedsnds then
assert(loadstring(ovr_ids.ak12 .. unit_list.suppsmall .. parts_list.pbs1))()
assert(loadstring(ovr_ids.ak12 .. unit_list.suppmedium .. parts_list.pbs1))()
assert(loadstring(ovr_ids.ak12 .. unit_list.supplarge .. parts_list.pbs1))()
end
if WacMenu._data.replace_ak12flashhider == true or WacMenu._data.replace_hidebarrelextarsmg == true then
assert(loadstring(ovr_ids.ak12 .. unit_list.firepig .. parts_list.flashhider_ak12))()
assert(loadstring(ovr_ids.ak12 .. unit_list.stubby .. parts_list.flashhider_ak12))()
assert(loadstring(ovr_ids.ak12 .. unit_list.tank .. parts_list.flashhider_ak12))()
assert(loadstring(ovr_ids.ak12 .. unit_list.jprifles .. parts_list.flashhider_ak12))()
assert(loadstring(ovr_ids.ak12 .. unit_list.linear .. parts_list.flashhider_ak12))()
assert(loadstring(ovr_ids.ak12 .. unit_list.surefire .. parts_list.flashhider_ak12))()
assert(loadstring(ovr_ids.ak12 .. unit_list.battle .. parts_list.flashhider_ak12))()
end
if WacMenu._data.replace_hidesuppressors == true and wac_nosuppressedsnds == true then
assert(loadstring(ovr_ids.ak12 .. unit_list.suppsmall .. parts_list.flashhider_ak12))()
assert(loadstring(ovr_ids.ak12 .. unit_list.suppmedium .. parts_list.flashhider_ak12))()
assert(loadstring(ovr_ids.ak12 .. unit_list.supplarge .. parts_list.flashhider_ak12))()
assert(loadstring(ovr_ids.ak12 .. unit_list.pbs1 .. parts_list.flashhider_ak12))()
end
if WacMenu._data.replace_ak12stndgrip == true then
assert(loadstring(ovr_ids.ak12 .. unit_list.akhgrip .. parts_list.ak12grip))()
assert(loadstring(ovr_ids.ak12 .. unit_list.akwgrip .. parts_list.ak12grip))()
assert(loadstring(ovr_ids.ak12 .. unit_list.akpgrip .. parts_list.ak12grip))()
assert(loadstring(ovr_ids.ak12 .. unit_list.akrk3g .. parts_list.ak12grip))()
end
if WacMenu._data.replace_ak12quad == 2 then
assert(loadstring(ovr_ids.ak12 .. unit_list.akquad .. parts_list.rpkmag))()
elseif WacMenu._data.replace_ak12quad == 3 then
assert(loadstring(ovr_ids.ak12 .. unit_list.akquad .. parts_list.rpkdrum))()
elseif WacMenu._data.replace_ak12quad == 4 then
assert(loadstring(ovr_ids.ak12 .. unit_list.akquad .. parts_list.ak12mag))()
elseif WacMenu._data.replace_ak12quad == 5 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akquad .. parts_list.ak74mag))()
elseif WacMenu._data.replace_ak12quad == 6 then
assert(loadstring(ovr_ids.ak12 .. unit_list.akquad .. parts_list.akmmag))()
elseif WacMenu._data.replace_ak12quad == 7 then
assert(loadstring(ovr_ids.ak12 .. unit_list.akquad .. parts_list.uspalm_ak30))()
end
if WacMenu._data.replace_ak12uspalm == 2 then
assert(loadstring(ovr_ids.ak12 .. unit_list.akuspalm .. parts_list.ak12mag))()
elseif WacMenu._data.replace_ak12uspalm == 3 then
assert(loadstring(ovr_ids.ak74 .. unit_list.akuspalm .. parts_list.ak74mag))()
elseif WacMenu._data.replace_ak12uspalm == 4 then
assert(loadstring(ovr_ids.ak12 .. unit_list.akuspalm .. parts_list.akmmag))()
end
if WacMenu._data.replace_ak12magpulassist == 2 then
assert(loadstring(ovr_ids.ak12 .. unit_list.akmagpul .. parts_list.ak12mag))()
elseif WacMenu._data.replace_ak12magpulassist == 3 then
assert(loadstring(ovr_ids.ak12 .. unit_list.akmagpul .. parts_list.ak74mag))()
elseif WacMenu._data.replace_ak12magpulassist == 4 then
assert(loadstring(ovr_ids.ak12 .. unit_list.akmagpul .. parts_list.akmmag))()
end
if WacMenu._data.replace_ak12stock == true then
assert(loadstring(ovr_ids.ak12 .. unit_list.m4pts .. parts_list.ak12st))()
assert(loadstring(ovr_ids.ak12 .. unit_list.m4crane .. parts_list.ak12st))()
assert(loadstring(ovr_ids.ak12 .. unit_list.m4mk46 .. parts_list.ak12st))()
assert(loadstring(ovr_ids.ak12 .. unit_list.m4ubr .. parts_list.ak12st))()
assert(loadstring(ovr_ids.ak12 .. unit_list.m4vltor .. parts_list.ak12st))()
end
-- PP-19 Bizon
if not tweak_data.weapon.factory.wpn_fps_smg_coal.override then
	tweak_data.weapon.factory.wpn_fps_smg_coal.override = {}
end
if not tweak_data.weapon.factory.wpn_fps_smg_x_coal.override then
	tweak_data.weapon.factory.wpn_fps_smg_x_coal.override = {}
end
if WacMenu._data.replace_pp19pbs1 == true and not wac_nosuppressedsnds then
assert(loadstring(ovr_ids.pp19 .. unit_list.suppsmall .. parts_list.pbs1))()
assert(loadstring(ovr_ids.pp19 .. unit_list.suppmedium .. parts_list.pbs1))()
assert(loadstring(ovr_ids.pp19 .. unit_list.supplarge .. parts_list.pbs1))()
assert(loadstring(ovr_ids.pp19_x .. unit_list.suppsmall .. parts_list.pbs1))()
assert(loadstring(ovr_ids.pp19_x .. unit_list.suppmedium .. parts_list.pbs1))()
assert(loadstring(ovr_ids.pp19_x .. unit_list.supplarge .. parts_list.pbs1))()
end
if WacMenu._data.replace_pp19flashhider == true or WacMenu._data.replace_hidebarrelextarsmg == true then
assert(loadstring(ovr_ids.pp19 .. unit_list.firepig .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19 .. unit_list.stubby .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19 .. unit_list.tank .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19 .. unit_list.jprifles .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19 .. unit_list.linear .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19 .. unit_list.surefire .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19 .. unit_list.battle .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19_x .. unit_list.firepig .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19_x .. unit_list.stubby .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19_x .. unit_list.tank .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19_x .. unit_list.jprifles .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19_x .. unit_list.linear .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19_x .. unit_list.surefire .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19_x .. unit_list.battle .. parts_list.flashhider_pp19))()
end
if WacMenu._data.replace_hidesuppressors == true and wac_nosuppressedsnds == true then
assert(loadstring(ovr_ids.pp19 .. unit_list.suppsmall .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19 .. unit_list.suppmedium .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19 .. unit_list.supplarge .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19 .. unit_list.pbs1 .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19 .. unit_list.suppsmall .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19_x .. unit_list.suppmedium .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19_x .. unit_list.supplarge .. parts_list.flashhider_pp19))()
assert(loadstring(ovr_ids.pp19_x .. unit_list.pbs1 .. parts_list.flashhider_pp19))()
end
if WacMenu._data.replace_pp19stndgrip == true then
assert(loadstring(ovr_ids.pp19 .. unit_list.akhgrip .. parts_list.pp19grip))()
assert(loadstring(ovr_ids.pp19 .. unit_list.akwgrip .. parts_list.pp19grip))()
assert(loadstring(ovr_ids.pp19 .. unit_list.akpgrip .. parts_list.pp19grip))()
assert(loadstring(ovr_ids.pp19 .. unit_list.akrk3g .. parts_list.pp19grip))()
assert(loadstring(ovr_ids.pp19_x .. unit_list.akhgrip .. parts_list.pp19grip))()
assert(loadstring(ovr_ids.pp19_x .. unit_list.akwgrip .. parts_list.pp19grip))()
assert(loadstring(ovr_ids.pp19_x .. unit_list.akpgrip .. parts_list.pp19grip))()
assert(loadstring(ovr_ids.pp19_x .. unit_list.akrk3g .. parts_list.pp19grip))()
end
-- MP5
if WacMenu._data.replace_mp5sd == true and not wac_nosuppressedsnds then
if not tweak_data.weapon.factory.wpn_fps_smg_mp5.override then
	tweak_data.weapon.factory.wpn_fps_smg_mp5.override = {}
end
local mp5parts = {}
mp5parts.override  = ", override = {" .. "wpn_fps_smg_mp5_fg_mp5a4" .. parts_list.mp5sd .. "wpn_fps_smg_mp5_fg_mp5a5" .. parts_list.mp5sd .. "wpn_fps_smg_mp5_fg_m5k" .. parts_list.mp5sd .. "}"
mp5parts.string = parts_list.dummy_unit_open .. mp5parts.override .. "}"
assert(loadstring(ovr_ids.mp5 .. unit_list.suppsmall .. mp5parts.string))()
assert(loadstring(ovr_ids.mp5 .. unit_list.suppmedium .. mp5parts.string))()
assert(loadstring(ovr_ids.mp5 .. unit_list.supplarge .. mp5parts.string))()
end
-- MP40
if not tweak_data.weapon.factory.wpn_fps_smg_erma.override then
	tweak_data.weapon.factory.wpn_fps_smg_erma.override = {}
end
if not tweak_data.weapon.factory.wpn_fps_smg_x_erma.override then
	tweak_data.weapon.factory.wpn_fps_smg_x_erma.override = {}
end
if WacMenu._data.replace_mp40flashhider == true or WacMenu._data.replace_hidebarrelextarsmg == true then
assert(loadstring(ovr_ids.mp40 .. unit_list.firepig .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40 .. unit_list.stubby .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40 .. unit_list.tank .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40 .. unit_list.jprifles .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40 .. unit_list.linear .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40 .. unit_list.surefire .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40 .. unit_list.battle .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40_x .. unit_list.firepig .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40_x .. unit_list.stubby .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40_x .. unit_list.tank .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40_x .. unit_list.jprifles .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40_x .. unit_list.linear .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40_x .. unit_list.surefire .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40_x .. unit_list.battle .. parts_list.flashhider_mp40))()
end
if WacMenu._data.replace_hidesuppressors == true and wac_nosuppressedsnds == true then
assert(loadstring(ovr_ids.mp40 .. unit_list.suppsmall .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40 .. unit_list.suppmedium .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40 .. unit_list.supplarge .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40 .. unit_list.pbs1 .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40_x .. unit_list.suppsmall .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40_x .. unit_list.suppmedium .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40_x .. unit_list.supplarge .. parts_list.flashhider_mp40))()
assert(loadstring(ovr_ids.mp40_x .. unit_list.pbs1 .. parts_list.flashhider_mp40))()
end
-- FN F2000 Tactical
if not tweak_data.weapon.factory.wpn_fps_ass_corgi.override then
	tweak_data.weapon.factory.wpn_fps_ass_corgi.override = {}
end
if WacMenu._data.replace_fnf2000flashhider == true or WacMenu._data.replace_hidebarrelextarsmg == true then
assert(loadstring(ovr_ids.fnf2000 .. unit_list.firepig .. parts_list.flashhider_fnf2000))()
assert(loadstring(ovr_ids.fnf2000 .. unit_list.stubby .. parts_list.flashhider_fnf2000))()
assert(loadstring(ovr_ids.fnf2000 .. unit_list.tank .. parts_list.flashhider_fnf2000))()
assert(loadstring(ovr_ids.fnf2000 .. unit_list.jprifles .. parts_list.flashhider_fnf2000))()
assert(loadstring(ovr_ids.fnf2000 .. unit_list.linear .. parts_list.flashhider_fnf2000))()
assert(loadstring(ovr_ids.fnf2000 .. unit_list.surefire .. parts_list.flashhider_fnf2000))()
assert(loadstring(ovr_ids.fnf2000 .. unit_list.battle .. parts_list.flashhider_fnf2000))()
end
if WacMenu._data.replace_hidesuppressors == true and wac_nosuppressedsnds == true then
assert(loadstring(ovr_ids.fnf2000 .. unit_list.suppsmall .. parts_list.flashhider_fnf2000))()
assert(loadstring(ovr_ids.fnf2000 .. unit_list.suppmedium .. parts_list.flashhider_fnf2000))()
assert(loadstring(ovr_ids.fnf2000 .. unit_list.supplarge .. parts_list.flashhider_fnf2000))()
assert(loadstring(ovr_ids.fnf2000 .. unit_list.pbs1 .. parts_list.flashhider_fnf2000))()
end
-- Spike X1S Saiga-12K
if not tweak_data.weapon.factory.wpn_fps_sho_basset.override then
	tweak_data.weapon.factory.wpn_fps_sho_basset.override = {}
end
if not tweak_data.weapon.factory.wpn_fps_sho_x_basset.override then
	tweak_data.weapon.factory.wpn_fps_sho_x_basset.override = {}
end
if WacMenu._data.replace_spikex1saigaextmag == 2 then
assert(loadstring(ovr_ids.spikex1saiga .. unit_list.sgmtactmag .. parts_list.saiga5rnd))()
assert(loadstring(ovr_ids.spikex1saiga_x .. unit_list.sgmtactmag .. parts_list.saiga5rnd))()
elseif WacMenu._data.replace_spikex1saigaxtmag == 3 then
assert(loadstring(ovr_ids.spikex1saiga .. unit_list.sgmtactmag .. parts_list.saigadrum))()
assert(loadstring(ovr_ids.spikex1saiga_x .. unit_list.sgmtactmag .. parts_list.saigadrum))()
end
-- SIG MPX
if not tweak_data.weapon.factory.wpn_fps_smg_shepheard.override then
	tweak_data.weapon.factory.wpn_fps_smg_shepheard.override = {}
end
if WacMenu._data.replace_sigmpxflashhider == true or WacMenu._data.replace_hidebarrelextarsmg == true then
assert(loadstring(ovr_ids.sigmpx .. unit_list.firepig .. parts_list.flashhider_mpx))()
assert(loadstring(ovr_ids.sigmpx .. unit_list.stubby .. parts_list.flashhider_mpx))()
assert(loadstring(ovr_ids.sigmpx .. unit_list.tank .. parts_list.flashhider_mpx))()
assert(loadstring(ovr_ids.sigmpx .. unit_list.jprifles .. parts_list.flashhider_mpx))()
assert(loadstring(ovr_ids.sigmpx .. unit_list.linear .. parts_list.flashhider_mpx))()
assert(loadstring(ovr_ids.sigmpx .. unit_list.surefire .. parts_list.flashhider_mpx))()
assert(loadstring(ovr_ids.sigmpx .. unit_list.battle .. parts_list.flashhider_mpx))()
assert(loadstring(ovr_ids.sigmpx_x .. unit_list.firepig .. parts_list.flashhider_mpx))()
assert(loadstring(ovr_ids.sigmpx_x .. unit_list.stubby .. parts_list.flashhider_mpx))()
assert(loadstring(ovr_ids.sigmpx_x .. unit_list.tank .. parts_list.flashhider_mpx))()
assert(loadstring(ovr_ids.sigmpx_x .. unit_list.jprifles .. parts_list.flashhider_mpx))()
assert(loadstring(ovr_ids.sigmpx_x .. unit_list.linear .. parts_list.flashhider_mpx))()
assert(loadstring(ovr_ids.sigmpx_x .. unit_list.surefire .. parts_list.flashhider_mpx))()
assert(loadstring(ovr_ids.sigmpx_x .. unit_list.battle .. parts_list.flashhider_mpx))()
end
if WacMenu._data.replace_hidesuppressors == true and wac_nosuppressedsnds == true then
assert(loadstring(ovr_ids.sigmpx .. unit_list.suppsmall .. parts_list.flashhider_mpx))()
assert(loadstring(ovr_ids.sigmpx .. unit_list.suppmedium .. parts_list.flashhider_mpx))()
assert(loadstring(ovr_ids.sigmpx .. unit_list.supplarge .. parts_list.flashhider_mpx))()
assert(loadstring(ovr_ids.sigmpx_x .. unit_list.suppsmall .. parts_list.flashhider_mpx))()
assert(loadstring(ovr_ids.sigmpx_x .. unit_list.suppmedium .. parts_list.flashhider_mpx))()
assert(loadstring(ovr_ids.sigmpx_x .. unit_list.supplarge .. parts_list.flashhider_mpx))()
end
if WacMenu._data.replace_sigmpxstock == true then
assert(loadstring(ovr_ids.sigmpx .. unit_list.m4pts .. parts_list.mpxst))()
assert(loadstring(ovr_ids.sigmpx .. unit_list.m4crane .. parts_list.mpxst))()
assert(loadstring(ovr_ids.sigmpx .. unit_list.m4mk46 .. parts_list.mpxst))()
assert(loadstring(ovr_ids.sigmpx .. unit_list.m4ubr .. parts_list.mpxst))()
assert(loadstring(ovr_ids.sigmpx .. unit_list.m4vltor .. parts_list.mpxst))()
end
Hooks:PostHook(WeaponFactoryTweakData, "_init_bipods", "_init_bipods_that_work", function(self)
--self.parts.wpn_fps_upg_bp_lmg_lionbipod.stats.zoom = 1

--Galil/Gecko 7.62
	table.list_append(self.wpn_fps_ass_galil.uses_parts, {"wpn_fps_upg_bp_lmg_lionbipod"})
	table.list_append(self.wpn_fps_ass_galil_npc.uses_parts, {"wpn_fps_upg_bp_lmg_lionbipod"})
--forbids these foregrips, since they remove the bipod model
	table.map_append(self.parts.wpn_fps_ass_galil_fg_fab, {forbids = {"wpn_fps_upg_bp_lmg_lionbipod"}}) --fabulous foregrip
	table.map_append(self.parts.wpn_fps_ass_galil_fg_mar, {forbids = {"wpn_fps_upg_bp_lmg_lionbipod"}}) --cqb foregrip
	table.map_append(self.parts.wpn_fps_ass_galil_fg_sar, {forbids = {"wpn_fps_upg_bp_lmg_lionbipod"}}) --light foregrip
		
		
--M95 Barrett/Thanatos
	table.list_append(self.wpn_fps_snp_m95.uses_parts, {"wpn_fps_upg_bp_lmg_lionbipod"})
	table.list_append(self.wpn_fps_snp_m95_npc.uses_parts, {"wpn_fps_upg_bp_lmg_lionbipod"})
--no conflicting modifications against bipods
	
	
--Walther WA2000/Lebensauger .308
	table.list_append(self.wpn_fps_snp_wa2000.uses_parts, {"wpn_fps_upg_bp_lmg_lionbipod"})
	table.list_append(self.wpn_fps_snp_wa2000_npc.uses_parts, {"wpn_fps_upg_bp_lmg_lionbipod"})
--no conflicting modifications against bipods
	

--G3/Gewehr
	table.list_append(self.wpn_fps_ass_g3.uses_parts, {"wpn_fps_upg_bp_lmg_lionbipod"})
	table.list_append(self.wpn_fps_ass_g3_npc.uses_parts, {"wpn_fps_upg_bp_lmg_lionbipod"})
--forbids these foregrips, since they remove the bipod model
	table.map_append(self.parts.wpn_fps_ass_g3_fg_psg, {forbids = {"wpn_fps_upg_bp_lmg_lionbipod"}}) --precision foregrip
	table.map_append(self.parts.wpn_fps_ass_g3_fg_railed, {forbids = {"wpn_fps_upg_bp_lmg_lionbipod"}}) --tactical foregrip
	table.map_append(self.parts.wpn_fps_ass_g3_fg_retro, {forbids = {"wpn_fps_upg_bp_lmg_lionbipod"}}) --wooden foregrip
	table.map_append(self.parts.wpn_fps_ass_g3_fg_retro_plastic, {forbids = {"wpn_fps_upg_bp_lmg_lionbipod"}}) --plastic foregrip

	
--G36/JP36		
--delicious bipods
	table.list_append(self.wpn_fps_ass_g36.uses_parts, {"wpn_fps_upg_bp_lmg_lionbipod"})
	table.list_append(self.wpn_fps_ass_g36_npc.uses_parts, {"wpn_fps_upg_bp_lmg_lionbipod"})
--forbids these foregrips, since they remove the bipod model
	table.map_append(self.parts.wpn_fps_ass_g36_fg_k, {forbids = {"wpn_fps_upg_bp_lmg_lionbipod"}}) --standard foregrip (normal)
	table.map_append(self.parts.wpn_fps_ass_g36_fg_c, {forbids = {"wpn_fps_upg_bp_lmg_lionbipod"}}) --compact foregrip	
	table.map_append(self.parts.wpn_fps_ass_g36_fg_ksk, {forbids = {"wpn_fps_upg_bp_lmg_lionbipod"}}) --Polizei foregrip
--Only allowed with JP36 Long Foregrip if you have the Gage Spec Ops DLC [wpn_fps_upg_g36_fg_long]

--[[ stance changing
	--stance is changed in playertweak, i probably won't need this
	--i'll keep it here in case someone else wants to use this template data to try something dumb
	
	self.parts.wpn_fps_upg_bp_lmg_lionbipod.stance_mod = {
		wpn_fps_ass_g3 = {translation = Vector3(0.025, -8, -3.42)},
		wpn_fps_ass_galil = {translation = Vector3(-0.01, -5, -3.25)},
		wpn_fps_snp_m95 = {translation = Vector3(-0.4, 5.8, -15.075),
			rotation = Rotation(-0.4, 0, -45)
		},
		wpn_fps_snp_wa2000 = {
			translation = Vector3(-2.25, 0, -9.5),
			rotation = Rotation(0, 0, 180)
		},
		wpn_fps_ass_g36 = {
			translation = Vector3(-0.65, 0, -12.47),
			rotation = Rotation(0, 0, -45)
		},
	}
--]]
end)
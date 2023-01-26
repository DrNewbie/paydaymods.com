Hooks:PostHook(StatisticsManager,"killed","khud_statistics_killed",function(self,data)
	if not data then return end
	
	local weapon_unit = data.weapon_unit
	local weapon_id = weapon_unit and weapon_unit:base() and weapon_unit:base():get_name_id() or "bad weapon id! :("
	
	local equipped_primary = managers.blackmarket:equipped_primary()
	
	local equipped_secondary = managers.blackmarket:equipped_secondary()
	
	if weapon_id == equipped_primary.weapon_id then 
		managers.hud:set_khud_weapon_killcount(1,self:session_killed_by_weapon(weapon_id))
	end
	if weapon_id == equipped_secondary.weapon_id then 
		managers.hud:set_khud_weapon_killcount(2,self:session_killed_by_weapon(weapon_id))
	end
--[[
	local stats_name = data.stats_name or "nil"
	local name = data.name
	local name_id = data.name_id
	local _type = tweak_data.character[data.name] and tweak_data.character[data.name].challenges.type
	local variant = data.variant
	local head_shot = data.head_shot
	local weapon_id = data.weapon_id
	local weapon_custom_name = weapon_unit and weapon_unit.custom_name
	KineticHUD:c_log(KineticHUD:tbl_to_string({stats_name,name,name_id,_type,variant,head_shot,weapon_unit,weapon_id,weapon_name,weapon_custom_name}))
	KineticHUD:t_log(data)
	KineticHUD:c_log(KineticHUD:concat({stats_name,name,name_id,_type}))
	
	KineticHUD:c_log(equipped_primary.weapon_id)
	KineticHUD:c_log(equipped_primary.custom_name)
	KineticHUD:c_log(equipped_primary.name,"name1_1")
	KineticHUD:c_log(equipped_primary:base().name,"name1_2")
	KineticHUD:c_log(equipped_secondary.name,"name2_1")
	KineticHUD:c_log(equipped_secondary:base().name,"name2_2")

	local by_bullet = data.variant == "bullet"
	local by_melee = data.variant == "melee" or data.weapon_id and tweak_data.blackmarket.melee_weapons[data.weapon_id]
	local by_explosion = data.variant == "explosion"
	local by_other_variant = not by_bullet and not by_melee and not by_explosion
	
	--]]	
end)
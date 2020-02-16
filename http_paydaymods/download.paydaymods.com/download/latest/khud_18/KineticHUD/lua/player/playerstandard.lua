Hooks:PostHook(PlayerStandard,"_start_action_reload_enter","khud_start_reload_enter",function(self,t)
	managers.player:remove_buff("lock_n_load")
end)

--PlayerStandard:_update_fwd_ray() todo

Hooks:PostHook(PlayerStandard,"_start_action_steelsight","khud_start_ads",function(self,t,gadget_state)
	if KineticHUD:IsCrosshairADSOnly() then
		managers.hud:animate_fade_crosshair(false)
	end
end)

Hooks:PostHook(PlayerStandard,"_end_action_steelsight","khud_end_ads",function(self,t)
	if KineticHUD:IsCrosshairADSOnly() then 
		managers.hud:animate_fade_crosshair(true)
	end
end)

local orig_check_fire = PlayerStandard._check_action_primary_attack
function PlayerStandard:_check_action_primary_attack(t,input,...)
	if self._equipped_unit and (input.btn_primary_attack_state or input.btn_primary_attack_release) then 
		local weapon_base = self._equipped_unit:base()
		local fire_mode = weapon_base:fire_mode()	
		if fire_mode == KineticHUD.firemode_safety then  --safety?
			if input.btn_primary_attack_press then
				managers.hud:show_hint({text = managers.localization:text("khud_hint_safety_on")})
--				managers.hud:show_hint("khud_hint_safety_on")
				weapon_base:dryfire()
			end
			return
		end
	end
	return orig_check_fire(self,t,input,...)
end
function PlayerStandard:start_cook_grenade()
	if managers.player:can_throw_grenade() and not (not PlayerBase.USE_GRENADES or self:chk_action_forbidden("interact") or self._unit:base():stats_screen_visible() or self:_is_throwing_grenade() or self:_interacting() or self:is_deploying() or self:_changing_weapon() or self:_is_meleeing() or self:_is_using_bipod()) then
		TacticalGrenades.throw_grenade = true
		TacticalGrenades.start_t = Application:time()
		TacticalGrenades.cook_t	= 0
		local camera = managers.player:local_player():camera()
		if camera:anim_data().equipped then
			camera:play_redirect(self:get_animation("unequip"))
		end
		camera:play_redirect(self:get_animation("projectile_enter"), nil, 1 + math.sin(Application:time())) --comment out this line if you don't want the throw-and-hold animation for cooking grenades
		--probably completely unnecessary to sine the offset, since i can't get it to do anything different anyway
	end --todo figure out how to change grenade model offset so that it matches the "hold/cook throwable" anim?
end

function PlayerStandard:cook_grenade()
	if not TacticalGrenades.throw_grenade then 
		return
	end
	TacticalGrenades.cook_t = math.max(0,Application:time() - TacticalGrenades.start_t)
end

function PlayerStandard:do_throw_grenade()
	TacticalGrenades.throw_grenade = false
	TacticalGrenades.queued_grenade = false
	self:_start_action_throw_grenade(Application:time(),true)
end

local orig_check_throw = PlayerStandard._check_action_throw_grenade
function PlayerStandard:_check_action_throw_grenade(t, input)
	local nade_name = managers.blackmarket:equipped_grenade() or "none"
	local timer = TacticalGrenades.allowed_cook[nade_name]
	
	if timer then
		local player = managers.player:local_player()
		local player_state = player:movement()._current_state
		
		if TacticalGrenades.queued_grenade or ((player_state._controller:get_input_released("throw_grenade") or TacticalGrenades.cook_t > timer ) and TacticalGrenades.throw_grenade) then 
			player_state:do_throw_grenade()
			--if release throw_grenade button
		elseif player_state._controller:get_input_pressed("throw_grenade") then
			player_state:start_cook_grenade()
			--if start press throw_grenade button then cook
		elseif TacticalGrenades.throw_grenade then
			player_state:cook_grenade()
			--if key is held (registered key press and hasn't registered key release), continue cooking
		end
	
		return --don't allow throwing grenades normally if they can be cooked
	end
	return orig_check_throw(self,t,input)
end

function PlayerStandard:_interupt_action_throw_grenade(t, input)
	if TacticalGrenades.throw_grenade then
		TacticalGrenades.queued_grenade = true --use tacnade.throw_grenade instead?
		return
	elseif not self:_is_throwing_grenade() then
		return
	end
		

	self._ext_camera:play_redirect(self:get_animation("equip"))
	self._camera_unit:base():unspawn_grenade()
	self._camera_unit:base():show_weapon()

	self._state_data.throw_grenade_expire_t = nil

	self:_stance_entered()
end

--Hooks:PostHook(PlayerStandard,"_interupt_action_throw_grenade","tacnade_interrupt_grenade",function(self,t,input) end)
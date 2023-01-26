function PlayerStandard:_is_melee_instant()
	return tweak_data.blackmarket.melee_weapons[ managers.blackmarket:equipped_melee_weapon() ].instant
end

function PlayerStandard:_check_action_melee( t , input )
	
	if self._state_data.melee_attack_wanted or ( self._state_data.meleeing and input.btn_primary_attack_state ) then
		if not self._state_data.melee_attack_allowed_t then
			self._state_data.melee_attack_wanted = nil
			self:_do_action_melee( t , input )
		end
		return
	end
	
	local action_wanted = input.btn_melee_press or ( input.btn_melee_release and not self._state_data.melee_hold ) or input.btn_primary_attack_press or self._state_data.melee_charge_wanted or ( MeleeOverhaul:HasSetting( "MeleeHold" ) and self._state_data.melee_hold )
	
	if not action_wanted then
		return
	end
	
	if input.btn_primary_attack_press or ( input.btn_melee_release and not self._state_data.melee_hold ) then
		if self._state_data.meleeing then
			if self._state_data.melee_attack_allowed_t then
				self._state_data.melee_attack_wanted = true
				return
			end
			self:_do_action_melee( t , input )
		end
		return
	end
	
	if input.btn_melee_press then
		if self._state_data.meleeing and MeleeOverhaul:HasSetting( "MeleeHold" ) then
			if not self._state_data.melee_attack_allowed_t then
				self:_interupt_action_melee( t )
				return
			end
		end
		if self._state_data.melee_expire_t and self._state_data.melee_hold then
			self._state_data.melee_hold = nil
			return
		end
	end
	
	local action_forbidden = not self:_melee_repeat_allowed() or self._use_item_expire_t or self:_changing_weapon() or self:_interacting() or self:_is_throwing_projectile() or self:_is_using_bipod()
	
	if action_forbidden then
		return
	end
	
	if not self._state_data.melee_hold then
		self._state_data.melee_hold = MeleeOverhaul:HasSetting( "MeleeHold" ) and not MeleeOverhaul:HasSetting( "MeleeHoldTime" ) and not self:_is_melee_instant() and true
	end
	
	self:_start_action_melee( t , input , self:_is_melee_instant() )
	return true
	
end

Hooks:PostHook( PlayerStandard , "_start_action_melee" , "MeleeOverhaulPlayerStandardPostStartActionMelee" , function( self , t , input , instant )

	if MeleeOverhaul:HasSetting( "MeleeHold" ) and MeleeOverhaul:HasSetting( "MeleeHoldTime" ) then
		self._state_data.melee_hold_t = t + MeleeOverhaul:HasSetting( "MeleeHoldTimer" )
	end

end )

Hooks:PostHook( PlayerStandard , "_do_action_melee" , "MeleeOverhaulPlayerStandardPostDoActionMelee" , function( self , t , input , skip_damage )
	
	self._state_data.melee_hold_t = nil
	self._state_data.melee_voice_charged = nil

end )

Hooks:PreHook( PlayerStandard , "_do_melee_damage" , "MeleeOverhaulPlayerStandardPreDoMeleeDamage" , function( self , t , bayonet_melee , melee_hit_ray )

	if MeleeOverhaul:HasSetting( "Decapitation" ) then
		local LeftArm = {
			[ Idstring( "hit_LeftArm" ):key() ] = true,
			[ Idstring( "hit_LeftForeArm" ):key() ] = true,
			[ Idstring( "rag_LeftArm" ):key() ] = true,
			[ Idstring( "rag_LeftForeArm" ):key() ] = true
		}
		local RightArm = {
			[ Idstring( "hit_RightArm" ):key() ] = true,
			[ Idstring( "hit_RightForeArm" ):key() ] = true,
			[ Idstring( "rag_RightArm" ):key() ] = true,
			[ Idstring( "rag_RightForeArm" ):key() ] = true
		}
		local LeftLeg = {
			[ Idstring( "LeftUpLeg" ):key() ] = true,
			[ Idstring( "LeftLeg" ):key() ] = true,
			[ Idstring( "rag_LeftUpLeg" ):key() ] = true,
			[ Idstring( "rag_LeftLeg" ):key() ] = true
		}
		local RightLeg = {
			[ Idstring( "RightUpLeg" ):key() ] = true,
			[ Idstring( "RightLeg" ):key() ] = true,
			[ Idstring( "rag_RightUpLeg" ):key() ] = true,
			[ Idstring( "rag_RightLeg" ):key() ] = true
		}
		
		local BodyParts = {
			iLeftArm = {
				"LeftArm",
				"LeftForeArm",
				"LeftHand"
			},
			iRightArm = {
				"RightArm",
				"RightForeArm",
				"RightHand"
			},
			iLeftLeg = {
				"LeftLeg",
				"LeftFoot"
			},
			iRightLeg = {
				"RightLeg",
				"RightFoot"
			}
		}
		
		local function get_limb( i )
			if LeftArm[ i ] then
				return "LeftArm"
			elseif RightArm[ i ] then
				return "RightArm"
			elseif LeftLeg[ i ] then
				return "LeftLeg"
			elseif RightLeg[ i ] then
				return "RightLeg"
			else
				return nil
			end
		end
		
		local melee_entry = managers.blackmarket:equipped_melee_weapon()
		local sphere_cast_radius = 20
		local col_ray
		
		if melee_hit_ray then
			col_ray = melee_hit_ray ~= true and melee_hit_ray or nil
		else
			col_ray = self:_calc_melee_hit_ray( t , sphere_cast_radius )
		end
		
		local melee_type = tweak_data.blackmarket.melee_weapons[ melee_entry ].melee_type
		
		if col_ray and alive( col_ray.unit ) then
			if col_ray.unit and col_ray.unit:character_damage() and col_ray.unit:character_damage():dead() and col_ray.body and col_ray.body:name() then
				if not MeleeOverhaul:HasSetting( "RealisticGore" ) or ( MeleeOverhaul:HasSetting( "RealisticGore" ) and melee_type == "LargeBladed" ) then
					if get_limb( col_ray.body:name():key() ) then
						for k , v in ipairs( BodyParts[ "i" .. get_limb( col_ray.body:name():key() ) ] ) do
							col_ray.unit:body( col_ray.unit:get_object( Idstring( v ) ) ):set_enabled( false )
						end
						col_ray.unit:movement():add_dismemberment( get_limb( col_ray.body:name():key() ) )
						col_ray.unit:sound():play("split_gen_body")
					end
				end
			end
		end
	end
	
	if MeleeOverhaul:HasSetting( "ImpactEffect" ) then
		if MeleeOverhaul.MenuOptions.MultipleChoice[ "ImpactEffect" ][ 4 ][ MeleeOverhaul:HasSetting( "ImpactEffect" ) ] and MeleeOverhaul.MenuOptions.MultipleChoice[ "ImpactEffect" ][ 4 ][ MeleeOverhaul:HasSetting( "ImpactEffect" ) ][ 2 ] then
			local sphere_cast_radius = 20
			local col_ray
			
			if melee_hit_ray then
				col_ray = melee_hit_ray ~= true and melee_hit_ray or nil
			else
				col_ray = self:_calc_melee_hit_ray( t , sphere_cast_radius )
			end
			
			if col_ray then
				managers.game_play_central:play_impact_sound_and_effects({
					col_ray 	= col_ray,
					effect 		= Idstring( MeleeOverhaul.MenuOptions.MultipleChoice[ "ImpactEffect" ][ 4 ][ MeleeOverhaul:HasSetting( "ImpactEffect" ) ][ 2 ] ),
					no_decal 	= true,
					no_sound 	= true
				})
			end
		end
	end

end )

Hooks:PostHook( PlayerStandard , "_update_melee_timers" , "MeleeOverhaulPlayerStandardPostUpdateMeleeTimers" , function( self , t , input )

	if MeleeOverhaul:HasSetting( "ShakeIntensity" ) then
		if self._state_data.meleeing then
			local lerp_value = self:_get_melee_charge_lerp_value( t )
			
			if self._state_data.melee_charge_shake then
				self._ext_camera:shaker():set_parameter( self._state_data.melee_charge_shake , "amplitude" , math.bezier({
					0,
					0,
					MeleeOverhaul:HasSetting( "ShakeIntensity" ) or 1,
					MeleeOverhaul:HasSetting( "ShakeIntensity" ) or 1
				}, lerp_value ) )
			end
		end
	end
	
	if MeleeOverhaul:HasSetting( "ChargingCallout" ) then
		if self._state_data.meleeing then
			local shouts = {
				"t03x_sin",
				"g67",
				"g23",
				"g10"
			}
			
			if self:_get_melee_charge_lerp_value( t ) >= 0.9 and not self._state_data.melee_voice_charged then
				self._state_data.melee_voice_charged = true
				managers.player:player_unit():sound():say( shouts[ math.random( #shouts ) ] , nil , true )
			end
		end
	end
	
	if self._state_data.melee_hold_t and t >= self._state_data.melee_hold_t then
		self._state_data.melee_hold_t = nil
		
		if self._state_data.meleeing and input.btn_meleet_state then
			self._state_data.melee_hold = true
		end
	end

end )

Hooks:PostHook( PlayerStandard , "_interupt_action_melee" , "MeleeOverhaulPlayerStandardPostInteruptActionMelee" , function( self , t )
	
	t = t or managers.player:player_timer():time()
	
	if self._state_data.melee_hold then
		self._equip_weapon_expire_t = t + ( self._equipped_unit:base():weapon_tweak_data().timers.equip or 0.7 ) / self:_get_swap_speed_multiplier()
	end
	
	self._state_data.melee_hold = nil
	self._state_data.melee_hold_t = nil
	self._state_data.melee_voice_charged = nil

end )

Hooks:PostHook( PlayerStandard , "_check_action_interact" , "MeleeOverhaulPlayerStandardPostCheckActionInteract" , function( self , t , input )

	local new_action , timer , interact_object
	local action_forbidden = self:chk_action_forbidden( "interact" ) or self._unit:base():stats_screen_visible() or self:_interacting() or self._ext_movement:has_carry_restriction() or self:is_deploying() or self:_changing_weapon() or self:_is_throwing_projectile() or self:_on_zipline()
	
	if not self._state_data.meleeing or self._state_data.melee_repeat_expire_t or self:_is_melee_instant() then
		return
	end
	
	if input.btn_interact_press and not action_forbidden then
		new_action, timer, interact_object = self._interaction:interact( self._unit , input.data )
		
		local melee_hold = self._state_data.melee_hold
		
		if new_action then
			self:_play_interact_redirect( t , input )
		end
		
		if timer then
			new_action = true
			self:_interupt_action_melee( t )
			self._ext_camera:camera_unit():base():set_limits( 80 , 50 )
			self:_start_action_interact( t , input , timer , interact_object )
		end
		
		new_action = new_action or self:_start_action_intimidate( t )
		
		if not MeleeOverhaul:HasSetting( "MeleeHoldTime" ) or melee_hold then
			self._state_data.melee_hold = true
		end
	end

end )

Hooks:PostHook( PlayerStandard , "_check_use_item" , "MeleeOverhaulPlayerStandardPostCheckUseItem" , function( self , t , input )

	local action_wanted = input.btn_use_item_press
	
	if not self._state_data.meleeing or self._state_data.melee_expire_t or self:_is_melee_instant() then
		return
	end
	
	if action_wanted then
		local action_forbidden = self._use_item_expire_t or self:_interacting() or self:_changing_weapon() or self:_is_throwing_projectile()
		local melee_hold = self._state_data.melee_hold
		
		if not action_forbidden and managers.player:can_use_selected_equipment( self._unit ) then
			self:_interupt_action_melee( t )
			self:_start_action_use_item(t)
			
			if not MeleeOverhaul:HasSetting( "MeleeHoldTime" ) or melee_hold then
				self._state_data.melee_hold = true
			end
		end
	end

end )

Hooks:PostHook( PlayerStandard , "_check_action_equip" , "MeleeOverhaulPlayerStandardPostCheckActionEquip" , function( self , t , input )

	local new_action
	local selection_wanted = input.btn_primary_choice
	
	if not self._state_data.meleeing or self._state_data.melee_expire_t or self:_is_melee_instant() then
		return
	end
	
	if selection_wanted then
		local action_forbidden = self:chk_action_forbidden( "equip" )
		action_forbidden = action_forbidden or not self._ext_inventory:is_selection_available( selection_wanted ) or self._use_item_expire_t or self:_changing_weapon() or self:_interacting() or self:_is_throwing_projectile()
		
		if not action_forbidden then
			local new_action = not self._ext_inventory:is_equipped( selection_wanted )
			if new_action then
				self:_interupt_action_melee( t )
				self:_start_action_unequip_weapon( t , { selection_wanted = selection_wanted } )
			else
				self:_interupt_action_melee( t )
			end
		end
	end
	return new_action

end )

Hooks:PostHook( PlayerStandard , "_check_change_weapon" , "MeleeOverhaulPlayerStandardPostCheckChangeWeapon" , function( self , t , input )

	local new_action
	local action_wanted = input.btn_switch_weapon_press
	
	if not self._state_data.meleeing or self._state_data.melee_expire_t or self:_is_melee_instant() then
		return
	end
	
	if action_wanted then
		local action_forbidden = self:_changing_weapon()
		action_forbidden = action_forbidden or self._use_item_expire_t or self._change_item_expire_t
		action_forbidden = action_forbidden or self._unit:inventory():num_selections() == 1 or self:_interacting() or self:_is_throwing_projectile()
		
		if not action_forbidden then
			local data = {}
			data.next = true
			self:_interupt_action_melee( t )
			self._change_weapon_pressed_expire_t = t + 0.33
			self:_start_action_unequip_weapon( t , data )
			new_action = true
			managers.player:send_message( Message.OnSwitchWeapon )
		end
	end
	
	return new_action

end )

Hooks:PostHook( PlayerStandard , "_check_action_throw_grenade" , "MeleeOverhaulPlayerStandardPostCheckActionThrowGrenade" , function( self , t , input )

	if not self._state_data.meleeing or self._state_data.melee_expire_t or self:_is_melee_instant() then
		return
	end
	
	local action_wanted = input.btn_throw_grenade_press
	if not action_wanted then
		return
	end
	
	if not managers.player:can_throw_grenade() then
		return
	end
	
	local action_forbidden = not PlayerBase.USE_GRENADES or self:chk_action_forbidden( "interact" ) or self._unit:base():stats_screen_visible() or self:_is_throwing_grenade() or self:_interacting() or self:is_deploying() or self:_changing_weapon() or self:_is_using_bipod()
	if action_forbidden then
		return
	end
	
	local melee_hold = self._state_data.melee_hold
	
	self:_interupt_action_melee( t )
	self:_start_action_throw_grenade( t , input )
	
	if not MeleeOverhaul:HasSetting( "MeleeHoldTime" ) or melee_hold then
		self._state_data.melee_hold = true
	end
	
	return action_wanted

end )
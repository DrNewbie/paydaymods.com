local use_btw_camlimits = true

--local orig_enter = PlayerBipod._enter
function PlayerBipod:_enter(enter_data,...)
	local player = managers.player:player_unit()

	if player and self._unit:base().is_local_player then
		self._bipod = true
		local equipped_unit = self._equipped_unit
		local equipped_unit_id = equipped_unit:base().name_id

		local is_modded = not self._equipped_unit:get_object(Idstring("a_bp")) 
		--current method checks for existence of bipod alignment bone in weapon;
		--	it can reasonably be assumed that if the bone exists, then we've either reverse-engineered animation/bone/models enough that animations will be extant;
		--	otherwise, the gun is likely altered (through this mod) to allow bipodding, so we don't play the animation
		
		--previous method checked for weapons bipod-enabled by this mod, again (reverted)
		--previous previous method checked for bipod object but i guess bipod object still exists, the bone just can't be set
		--previous previous previous method checked for weapons bipod-enabled by this mod (hk21, m249, rpk, mg42, par)

		local speed_multiplier = self._equipped_unit:base():get_property("bipod_deploy_multiplier") or 1
		local tweak_data = self._equipped_unit:base():weapon_tweak_data()
		local reload_name_id = tweak_data.animations.reload_name_id or self._equipped_unit:base().name_id			
			
		self._unit_deploy_position = player:position()
		
		
		if use_btw_camlimits then 
			self._unit:camera():camera_unit():base():set_limits_btw(45,30)
		else
			self._unit:camera():camera_unit():base():set_limits(tweak_data.bipod_camera_spin_limit or 45,tweak_data.bipod_camera_pitch_limit or 45)
		end
		PlayerBipod.super:start_deploying_bipod(tweak_data.timers.deploy_bipod or 1)
		self._equipped_unit:base():tweak_data_anim_stop("undeploy")

		if not is_modded then
			self._ext_camera:play_redirect(Idstring((tweak_data.animations.bipod_enter .. "_" .. equipped_unit_id)), speed_multiplier)
			self._equipped_unit:base():tweak_data_anim_play("deploy", speed_multiplier)
		end
		
		self._headbob = 0
		self._target_headbob = 0

		self._ext_camera:set_shaker_parameter("headbob", "amplitude", 0)

		if not is_modded then 
			PlayerStandard.ANIM_STATES.bipod = {
				recoil = Idstring(tweak_data.animations.bipod_recoil .. "_" .. equipped_unit_id),
				recoil_enter = Idstring(tweak_data.animations.bipod_recoil_enter .. "_" .. equipped_unit_id),
				recoil_loop = Idstring(tweak_data.animations.bipod_recoil_loop .. "_" .. equipped_unit_id),
				recoil_exit = Idstring(tweak_data.animations.bipod_recoil_exit .. "_" .. equipped_unit_id)
			}
		end
		
		self:set_animation_state("bipod")
		self._unit:sound_source():post_event("wp_steady_in")
		self:_stance_entered()
		self:_husk_bipod_data()
	end
end


function PlayerBipod:exit(state_data, new_state_name)
	PlayerBipod.super.exit(self, state_data or self._state_data, new_state_name)

	self._bipod = nil
	
	local equipped_unit = self._equipped_unit

	local is_modded = not equipped_unit:get_object(Idstring("a_bp"))
	
	local tweak_data = equipped_unit:base():weapon_tweak_data()
	local speed_multiplier = equipped_unit:base():get_property("bipod_deploy_multiplier") or 1
	local equipped_unit_id = equipped_unit:base().name_id
	
	equipped_unit:base():tweak_data_anim_stop("deploy")

	if not is_modded then 
		local result = self._ext_camera:play_redirect(Idstring(tweak_data.animations.bipod_exit .. "_" .. equipped_unit_id), speed_multiplier)
		local result_deploy = equipped_unit:base():tweak_data_anim_play("undeploy", speed_multiplier)	
	end
	self._unit:camera():camera_unit():base():remove_limits()

	self._unit:camera():camera_unit():base().bipod_location = nil
	local exit_data = {skip_equip = true}
	self._dye_risk = nil

	self:set_animation_state("standard")
	self._unit:sound_source():post_event("wp_steady_out")

	local peer_id = managers.network:session():peer_by_unit(self._unit):id()

	managers.player:set_bipod_data_for_peer({peer_id = peer_id})

	self._state_data.previous_state = "bipod"

	return exit_data
end

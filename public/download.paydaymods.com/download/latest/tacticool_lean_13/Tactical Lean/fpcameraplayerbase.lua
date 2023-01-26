local mrot1 = Rotation()
local mrot2 = Rotation()
local mrot3 = Rotation()

local mvec1 = Vector3()
local mvec2 = Vector3()

local mrot4 = Rotation()
local mvec3 = Vector3()
local mvec4 = Vector3()
--todo try to posthook this
function FPCameraPlayerBase:_update_movement(t, dt)
	local data = self._camera_properties
	local new_head_pos = mvec2
	local new_shoulder_pos = mvec1
	local new_shoulder_rot = mrot1
	local new_head_rot = mrot2

	self._parent_unit:m_position(new_head_pos)
	mvector3.add(new_head_pos, self._head_stance.translation)

	local stick_input_x = 0
	local stick_input_y = 0
	local aim_assist_x, aim_assist_y = self:_get_aim_assist(t, dt, self._tweak_data.aim_assist_snap_speed, self._aim_assist)
	stick_input_x = stick_input_x + self:_horizonatal_recoil_kick(t, dt) + aim_assist_x
	stick_input_y = stick_input_y + self:_vertical_recoil_kick(t, dt) + aim_assist_y
	local look_polar_spin = data.spin - stick_input_x
	local look_polar_pitch = math.clamp(data.pitch + stick_input_y, -85, 85)

	if not self._limits or not self._limits.spin then
		look_polar_spin = look_polar_spin % 360
	end

	local look_polar = Polar(1, look_polar_pitch, look_polar_spin)
	local look_vec = look_polar:to_vector()
	local cam_offset_rot = mrot3

	mrotation.set_look_at(cam_offset_rot, look_vec, math.UP)
	mrotation.set_zero(new_head_rot)
	mrotation.multiply(new_head_rot, self._head_stance.rotation)
	mrotation.multiply(new_head_rot, cam_offset_rot)

	data.pitch = look_polar_pitch
	data.spin = look_polar_spin
	self._output_data.rotation = new_head_rot or self._output_data.rotation

	local lean_tilt = TacticalLean.lean_tilt
	if lean_tilt and TacticalLean.current_lean then --use custom tilt interpolation 
		local _t = Application:time() --the "t" time value passed to this function doesn't account properly for slow-motion,
		--causing levels such as hotline miami day 2, which have slowmotion mission sequences, to spaz out the rotate over time calcuation here
		lean_tilt = lean_tilt + self._camera_properties.target_tilt
		local anim_t = TacticalLean:anim_t()
		local anim_scale = math.min(1,_t - anim_t) * 2 --smooth
		local difference = (self._camera_properties.current_tilt - lean_tilt)
		local result = self._camera_properties.current_tilt - (difference * anim_scale)
		
		self._camera_properties.current_tilt = result
	elseif self._camera_properties.current_tilt ~= self._camera_properties.target_tilt then
		self._camera_properties.current_tilt = math.step(self._camera_properties.current_tilt, self._camera_properties.target_tilt, 150 * dt)
	end
	if self._camera_properties.current_tilt ~= 0 then
		self._output_data.rotation = Rotation(self._output_data.rotation:yaw(), self._output_data.rotation:pitch(), self._output_data.rotation:roll() + self._camera_properties.current_tilt)
	end
	self._output_data.position = new_head_pos

	mvector3.set(new_shoulder_pos, self._shoulder_stance.translation)
	mvector3.add(new_shoulder_pos, self._vel_overshot.translation)
	mvector3.rotate_with(new_shoulder_pos, self._output_data.rotation)

	mvector3.add(new_shoulder_pos, new_head_pos)
	mrotation.set_zero(new_shoulder_rot)
	mrotation.multiply(new_shoulder_rot, self._output_data.rotation)
	mrotation.multiply(new_shoulder_rot, self._shoulder_stance.rotation)
	mrotation.multiply(new_shoulder_rot, self._vel_overshot.rotation)
	self:set_position(new_shoulder_pos) -- these two don't seem to do anything? 
	self:set_rotation(new_shoulder_rot) -- not really sure why
end

function FPCameraPlayerBase:start_lean_transition_stance(reset_pos)
	reset_pos = false --allowing reset_pos makes the gun warp more, so i'll investigate it later
	local wpn = managers.player:local_player():movement():current_state()._equipped_unit:base()
	local stance_name = wpn:get_stance_id() or "default"
	stance_name = tweak_data.player.stances[stance_name] and stance_name or "default"
	local default_stance = tweak_data.player.stances[stance_name].standard.shoulders.translation
	local steelsight_stance = tweak_data.player.stances[stance_name].steelsight.shoulders.translation
	local stance_mod = {translation = Vector3(0, 0, 0)}
	local is_steelsight = self._parent_unit:movement()._current_state:in_steelsight()
	if is_steelsight and wpn.stance_mod then
		stance_mod = wpn:stance_mod() or stance_mod
	end	
	local lean_dist = TacticalLean:get_distance()
	local angle = TacticalLean:get_angle(TacticalLean.current_lean)
	local sign = math.sign(angle)
	local result = -2
--	angle / 2
	
	local tr_mod = Vector3(sign * lean_dist,0,result)
	
--	KineticHUD:c_log(result,"RESULT")
	--[[
	
	9, tan(9) = 7.4 = -0.452
	
	
	--]]
	self._shoulder_stance.transition = {}
	self._shoulder_stance.transition.start_translation = Vector3(0,0,0)
	self._shoulder_stance.transition.end_translation = Vector3(0,0,0)
	local transition = self._shoulder_stance.transition--{}

--[[ i have no idea why i wrote this or how it is functionally different
	if is_steelsight then 
		local orig_rot = tweak_data.player.stances[stance_name].steelsight.shoulders.rotation
		local new_rot = Rotation(orig_rot:yaw(),orig_rot:pitch(),orig_rot:roll() + 1.1)
		transition.end_rotation = new_rot --self._shoulder_stance.rotation
	else
		local orig_rot = tweak_data.player.stances[stance_name].standard.shoulders.rotation
		transition.end_rotation = orig_rot
	end
--]]
	transition.end_rotation = self._shoulder_stance.rotation
	
	transition.duration = TacticalLean:get_lean_duration() --not affected by steelsight enter time multipliers
	
	if reset_pos then 
		transition.start_translation = is_steelsight and steelsight_stance or default_stance
	else
		mvector3.set(transition.start_translation, self._shoulder_stance.translation or transition.start_translation)
	end
	transition.start_rotation = self._shoulder_stance.rotation
	transition.start_t = Application:time()
	if is_steelsight then 
		mvector3.set(transition.end_translation, steelsight_stance)
		if stance_mod then --todo fix bugged stance for leaning while transitioning while from 45 degree scope ADS to default ADS
			mvector3.add(transition.end_translation, stance_mod.translation)
		end
	else
		mvector3.set(transition.end_translation, default_stance)
	end

	if TacticalLean.current_lean and not TacticalLean.exiting_lean then 
		mvector3.add(transition.end_translation,tr_mod)
	end
end

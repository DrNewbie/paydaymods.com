if not SGO then return end

local SLIDE_DURATION = SGO.settings.use_slidy1 or 0.75 -- Max slide duration in seconds
local SLIDE_SPEED_MULTIPLIER = SGO.settings.use_slidy2 or 1.1 -- Speed multiplier
local VELOCITY_THRESHOLD = 400 -- Minimum movement speed required for slide to trigger

local enter_original = PlayerStandard.enter
local _start_action_ducking_original = PlayerStandard._start_action_ducking
local _end_action_ducking_original = PlayerStandard._end_action_ducking
local _update_foley_original = PlayerStandard._update_foley
local _determine_move_direction_original = PlayerStandard._determine_move_direction
local _get_max_walk_speed_original = PlayerStandard._get_max_walk_speed
local update_original = PlayerStandard.update

function PlayerStandard:enter(...)
	self:_stop_slide()
	return enter_original(self, ...)
end

function PlayerStandard:_start_action_ducking(...)
	if self._running and self._move_dir and not self._state_data.in_air then
		self:_start_slide()
	end
	return _start_action_ducking_original(self, ...)
end

function PlayerStandard:_end_action_ducking(...)
	self:_stop_slide()
	return _end_action_ducking_original(self, ...)
end

function PlayerStandard:_update_foley(...)
	if self._gnd_ray and self._state_data.in_air and not self._state_data.on_ladder and self._state_data.ducking then
		self:_start_slide(true)
	end
	return _update_foley_original(self, ...)
end

function PlayerStandard:_determine_move_direction(...)
	_determine_move_direction_original(self, ...)
	if self._slide_expire then
		self._move_dir = self._slide_dir
	end
end

function PlayerStandard:_get_max_walk_speed(...)
	return self._slide_speed or _get_max_walk_speed_original(self, ...)
end

function PlayerStandard:update(t, dt, ...)
	update_original(self, t, dt, ...)
	if self._slide_expire then
		self._slide_expire = self._slide_expire - dt
		if self._slide_expire <= 0 then
			self:_stop_slide()
		end
	end
end

local slide_dir = Vector3()
function PlayerStandard:_start_slide(from_air)
	if not self._slide_expire then
		mvector3.set(slide_dir, self._last_velocity_xy)
		local speed = mvector3.normalize(slide_dir) * SLIDE_SPEED_MULTIPLIER
		if speed > VELOCITY_THRESHOLD then
			self._slide_speed = speed
			self._slide_expire = SLIDE_DURATION
			self._slide_dir = slide_dir
			self._unit:camera():camera_unit():base():set_limits(100, nil)
			--printf("Start slide\n")
			--printf("\tDirection: %s\n", tostring(self._slide_dir))
			--printf("\tVelocity: %s\n", tostring(self._slide_speed))
		end
	end
end

function PlayerStandard:_stop_slide()
	if self._slide_expire then
		self._slide_expire = nil
		self._slide_speed = nil
		self._slide_dir = nil
		self._unit:camera():camera_unit():base():remove_limits()
		--printf("Stop slide\n")
	end
end
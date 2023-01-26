
-- Much of the code here was initially from lib/states/ingamewaitingforrespawn.lua

-- FIXME: If a team AI character enters a vehicle, tracking no longer updates when they leave the vehicle (i.e. the camera
-- remains at their last position on the vehicle even though they are no longer there). This does not occur for human players

if TranslucentMissionBriefingGUI_IngameWaitingForPlayersState_Hooked then
	return
else
	TranslucentMissionBriefingGUI_IngameWaitingForPlayersState_Hooked = true
end

core:import("CoreUnit")

local init_actual = IngameWaitingForPlayersState.init
function IngameWaitingForPlayersState:init(...)
	init_actual(self, ...)

	-- From IngameWaitingForRespawnState:init()
	self._slotmask = managers.slot:get_mask("world_geometry") + 39
	self._fwd = Vector3(1, 0, 0)
	self._up_offset = math.UP * 80
	self._rot = Rotation()
	self._vec_target = Vector3()
	self._vec_eye = Vector3()
	self._vec_dir = Vector3()

	-- Viewport starts disabled to prevent brief flashes of geometry just as the mission briefing GUI appears
	self._viewport_active = false
end

local update_enabled = false

local at_enter_actual = IngameWaitingForPlayersState.at_enter
function IngameWaitingForPlayersState:at_enter(...)
	at_enter_actual(self, ...)

	-- From IngameWaitingForRespawnState:_setup_camera()
	self._camera_object = World:create_camera()
	self._camera_object:set_near_range(3)
	self._camera_object:set_far_range(1000000)
	self._camera_object:set_fov(75)
	self._viewport = managers.viewport:new_vp(0, 0, 1, 1, "spectator", CoreManagerBase.PRIO_WORLDCAMERA)
	self._viewport:set_camera(self._camera_object)
	self._viewport:set_active(self._viewport_active)

	-- From IngameWaitingForRespawnState:_setup_controller()
	self._controller = managers.controller:create_controller("waiting_for_respawn", managers.controller:get_default_wrapper_index(), false)
--[[
	-- Not enabling these for now as they interfere with GUI button clicks
	self._next_player_cb = callback(self, self, "cb_next_player")
	self._prev_player_cb = callback(self, self, "cb_prev_player")
	self._controller:add_trigger("left", self._prev_player_cb)
	self._controller:add_trigger("right", self._next_player_cb)
	self._controller:add_trigger("primary_attack", self._prev_player_cb)
	self._controller:add_trigger("secondary_attack", self._next_player_cb)
]]
	self._controller:set_enabled(false)

	-- This will be called from ToggleContextCallback() instead
--	self:_setup_sound_listener()

	-- From IngameWaitingForRespawnState:at_enter()
	self:_create_spectator_data()
	self:cb_next_player()

	update_enabled = true
end

local at_exit_actual = IngameWaitingForPlayersState.at_exit
function IngameWaitingForPlayersState:at_exit(...)
	update_enabled = false

	-- Because the game does not verify the validity of self._cam_unit (which is instantiated by the game itself in
	-- IngameWaitingForPlayersState:at_enter()), ensure that a new instance is spawned if it is invalid just so the game doesn't
	-- end up deleting an invalid reference and crashing itself. It's a bit wasteful, but it's far better than crashing out
	if not alive(self._cam_unit) then
		self._cam_unit = CoreUnit.safe_spawn_unit("units/gui/background_camera_01/waiting_camera_01", Vector3(), Rotation())
	end
	at_exit_actual(self, ...)

	self:tmbgui_at_exit()
end

-- Because the game does not call IngameWaitingForPlayersState:at_exit() when restarting a heist by default, this mod forces a
-- call to IngameWaitingForPlayersState:tmbgui_at_exit() for cleanup to avoid untraceable crashes in native code (see
-- GamePlayCentralManager:stop_the_game() and Setup:load_start_menu())
function IngameWaitingForPlayersState:tmbgui_at_exit()
	-- From IngameWaitingForRespawnState:_clear_controller()
	if self._controller then
--[[
	-- Not enabling these for now as they interfere with GUI button clicks
		self._controller:remove_trigger("left", self._prev_player_cb)
		self._controller:remove_trigger("right", self._next_player_cb)
		self._controller:remove_trigger("primary_attack", self._prev_player_cb)
		self._controller:remove_trigger("secondary_attack", self._next_player_cb)
]]
		self._controller:set_enabled(false)
		self._controller:destroy()
		self._controller = nil
	end

	-- From IngameWaitingForRespawnState:_clear_camera()
	if alive(self._viewport) then
		self._viewport:set_active(false)
		-- As much as I do not like leaving native objects lying around, this line apparently causes spontaneous crashes in
		-- native code when restarting levels or returning to the menu, and also causes a crash in the Renderer thread when this
		-- function is called from GamePlayCentralManager:stop_the_game(). Might be a double-free crash? Hard to tell if that is
		-- the case, or whether the engine itself automatically calls Application:destroy_viewport() (_ScriptViewport:destroy()
		-- calls that native function to destroy the viewport)
--		self._viewport:destroy()
		self._viewport = nil
	end

	if alive(self._camera_object) then
		World:delete_camera(self._camera_object)
	end

	self._camera_object = nil

	self:_clear_sound_listener()
end

function IngameWaitingForPlayersState:set_controller_enabled(enabled)
	if self._controller then
		self._controller:set_enabled(enabled)
	end
end

function IngameWaitingForPlayersState:set_viewport_active(state)
	self._viewport_active = state
	if self._viewport then
		self._viewport:set_active(state)
	end
end

local update_actual = IngameWaitingForPlayersState.update
function IngameWaitingForPlayersState:update(t, dt, ...)
	-- Don't do anything if IngameWaitingForPlayersState:at_enter() has not been called yet or if
	-- IngameWaitingForPlayersState:at_exit() has already been called
	if not update_enabled then
		return
	end

	update_actual(self, t, dt, ...)

	self:_upd_watch(t, dt)
end

local paused_update_actual = IngameWaitingForPlayersState.paused_update
function IngameWaitingForPlayersState:paused_update(t, dt, ...)
	-- Don't do anything if IngameWaitingForPlayersState:at_enter() has not been called yet or if
	-- IngameWaitingForPlayersState:at_exit() has already been called
	if not update_enabled then
		return
	end

	if paused_update_actual ~= nil then
		paused_update_actual(self, t, dt, ...)
	end

	self:_upd_watch(t, dt)

	-- Ensure that name tags and waypoints continue to be updated while in the paused update
	local hudmanager = managers.hud
	if hudmanager ~= nil then
		-- TODO: Not sure if I should call HUDManager:update() instead of the following functions directly...
		hudmanager:_update_name_labels(t, dt)
		hudmanager:_update_waypoints(t, dt)
	end
end

-- Do not call the original function, just set self._camera_data.next_t to a valid value to resolve a crash
function IngameWaitingForPlayersState:_next_camera(...)
	self._camera_data.next_t = Application:time() + 8 + math.rand(4)
end

local head = Idstring("Head")
local mvec3_set = mvector3.set
local mvec3_add = mvector3.add
local mvec3_subtract = mvector3.subtract
local mvec3_multiply = mvector3.multiply
local mvec3_negate = mvector3.negate
local mvec3_rotate_with = mvector3.rotate_with
local mvec3_x = mvector3.x
local mvec3_y = mvector3.y
local mvec3_normalize = mvector3.normalize
local mvec3_length = mvector3.length
local mvec3_cross = mvector3.cross
local mvec3_angle = mvector3.angle
local mrot_set_axis_angle = mrotation.set_axis_angle
local mrot_set_look_at = mrotation.set_look_at
local math_up = math.UP
function IngameWaitingForPlayersState:_upd_watch(t, dt)
	-- Apparently this can occur when disconnecting from a game with TMBGUI active. Yes, even with update_enabled set to false
	if self._controller == nil then
		return
	end

	self:_refresh_teammate_list()
	if self._spectator_data.watch_u_key then
		local watch_u_record = self._spectator_data.teammate_records[self._spectator_data.watch_u_key]
		local watch_u_head = watch_u_record.unit:movement():get_object(head)
		if not watch_u_head then
			self:cb_next_player()
			return
		end
		mvec3_set(self._vec_dir, self._controller:get_input_axis("look"))
		local controller_type = self._controller:get_default_controller_id()
		local stick_input_x = mvec3_x(self._vec_dir)
		if mvec3_length(self._vec_dir) > 0.1 then
			if controller_type ~= "keyboard" then
				stick_input_x = stick_input_x / (1.3 - 0.3 * (1 - math.abs(mvec3_y(self._vec_dir))))
				stick_input_x = stick_input_x * dt * 180
			end
			mrot_set_axis_angle(self._rot, math_up, -0.5 * stick_input_x)
			mvec3_rotate_with(self._fwd, self._rot)
			mvec3_cross(self._vec_target, math_up, self._fwd)
			mrot_set_axis_angle(self._rot, self._vec_target, 0.5 * -mvec3_y(self._vec_dir))
			mvec3_rotate_with(self._fwd, self._rot)
			local angle = mvec3_angle(math_up, self._fwd)
			local rot = 0
			if angle > 145 then
				rot = 145 - angle
			elseif angle < 85 then
				rot = 85 - angle
			end
			if rot ~= 0 then
				mrot_set_axis_angle(self._rot, self._vec_target, rot)
				mvec3_rotate_with(self._fwd, self._rot)
			end
		end
		local vehicle_unit, vehicle_seat
		if managers.network and managers.network:session() and watch_u_record.unit:network() then
			if watch_u_record.unit:brain() then
				vehicle_unit = watch_u_record.unit:movement().vehicle_unit
				vehicle_seat = watch_u_record.unit:movement().vehicle_seat
			elseif watch_u_record.unit:network():peer() then
				local peer_id = watch_u_record.unit:network():peer():id()
				local vehicle_data = managers.player:get_vehicle_for_peer(peer_id)
				if vehicle_data then
					vehicle_unit = vehicle_data.vehicle_unit
					vehicle_seat = vehicle_unit:vehicle_driving()._seats[vehicle_data.seat]
				end
			end
		end
		if vehicle_unit and vehicle_seat then
			local target_pos = vehicle_unit:vehicle():object_position(vehicle_seat.object)
			mvec3_set(self._vec_target, target_pos)
			local oobb = vehicle_unit:oobb()
			local up = oobb:z() * 2.5
			mvec3_add(self._vec_target, up)
		else
			watch_u_head:m_position(self._vec_target)
		end
		mvec3_set(self._vec_eye, self._fwd)
		mvec3_multiply(self._vec_eye, 150)
		mvec3_negate(self._vec_eye)
		mvec3_add(self._vec_eye, self._vec_target)
		mrot_set_look_at(self._rot, self._fwd, math_up)
		local col_ray = World:raycast("ray", self._vec_target, self._vec_eye, "slot_mask", self._slotmask)
		local dis_new
		if col_ray then
			mvec3_set(self._vec_dir, col_ray.ray)
			dis_new = math.max(col_ray.distance - 30, 0)
		else
			mvec3_set(self._vec_dir, self._vec_eye)
			mvec3_subtract(self._vec_dir, self._vec_target)
			dis_new = mvec3_normalize(self._vec_dir)
		end
		if self._dis_curr and dis_new > self._dis_curr then
			local speed = math.max((dis_new - self._dis_curr) / 5, 1.5)
			self._dis_curr = math.lerp(self._dis_curr, dis_new, speed * dt)
		else
			self._dis_curr = dis_new
		end
		mvec3_set(self._vec_eye, self._vec_dir)
		mvec3_multiply(self._vec_eye, self._dis_curr)
		mvec3_add(self._vec_eye, self._vec_target)
		self._camera_object:set_position(self._vec_eye)
		self._camera_object:set_rotation(self._rot)
	end
end

function IngameWaitingForPlayersState:_refresh_teammate_list()
	local all_teammates = self._spectator_data.teammate_records
	local teammate_list = self._spectator_data.teammate_list
	local lost_teammate_at_i
	local i = #teammate_list
	while i > 0 do
		local u_key = teammate_list[i]
		local teammate_data = all_teammates[u_key]
		if not teammate_data then
			table.remove(teammate_list, i)
			if u_key == self._spectator_data.watch_u_key then
				lost_teammate_at_i = i
				self._spectator_data.watch_u_key = nil
			end
		end
		i = i - 1
	end
	if #teammate_list ~= table.size(all_teammates) then
		for u_key, u_data in pairs(all_teammates) do
			local add = true
			for i_key, test_u_key in ipairs(teammate_list) do
				if test_u_key == u_key then
					add = false
				else
				end
			end
			if add then
				table.insert(teammate_list, u_key)
			end
		end
	end
	if lost_teammate_at_i then
		self._spectator_data.watch_u_key = teammate_list[math.clamp(lost_teammate_at_i, 1, #teammate_list)]
	end
	if not self._spectator_data.watch_u_key and #teammate_list > 0 then
		self._spectator_data.watch_u_key = teammate_list[1]
	end
end

function IngameWaitingForPlayersState:_setup_sound_listener()
	if self._listener_id or not alive(self._camera_object) then
		return
	end
	self._listener_id = managers.listener:add_listener("spectator_camera", self._camera_object, self._camera_object, nil, false)
	managers.listener:add_set("spectator_camera", {
		"spectator_camera"
	})
	self._listener_activation_id = managers.listener:activate_set("main", "spectator_camera")
	self._sound_check_object = managers.sound_environment:add_check_object({
		object = self._camera_object,
		active = true,
		primary = true
	})
end

function IngameWaitingForPlayersState:_clear_sound_listener()
	if not self._listener_id then
		return
	end
	managers.sound_environment:remove_check_object(self._sound_check_object)
	managers.listener:remove_listener(self._listener_id)
	managers.listener:remove_set("spectator_camera")
	self._listener_id = nil
end

function IngameWaitingForPlayersState:_create_spectator_data()
	local all_teammates = managers.groupai:state():all_char_criminals()
	local teammate_list = {}
	for u_key, u_data in pairs(all_teammates) do
		table.insert(teammate_list, u_key)
	end
	self._spectator_data = {
		teammate_records = all_teammates,
		teammate_list = teammate_list,
		watch_u_key = teammate_list[1]
	}
end

function IngameWaitingForPlayersState:_get_teammate_index_by_unit_key(u_key)
	for i_key, test_u_key in ipairs(self._spectator_data.teammate_list) do
		if test_u_key == u_key then
			return i_key
		end
	end
end

function IngameWaitingForPlayersState:cb_next_player()
	self:_refresh_teammate_list()
	local watch_u_key = self._spectator_data.watch_u_key
	if not watch_u_key then
		return
	end
	local i_watch = self:_get_teammate_index_by_unit_key(watch_u_key)
	if i_watch == #self._spectator_data.teammate_list then
		i_watch = 1
	else
		i_watch = i_watch + 1
	end
	watch_u_key = self._spectator_data.teammate_list[i_watch]
	self._spectator_data.watch_u_key = watch_u_key
	self._dis_curr = nil
end

function IngameWaitingForPlayersState:cb_prev_player()
	self:_refresh_teammate_list()
	local watch_u_key = self._spectator_data.watch_u_key
	if not watch_u_key then
		return
	end
	local i_watch = self:_get_teammate_index_by_unit_key(watch_u_key)
	if i_watch == 1 then
		i_watch = #self._spectator_data.teammate_list
	else
		i_watch = i_watch - 1
	end
	watch_u_key = self._spectator_data.teammate_list[i_watch]
	self._spectator_data.watch_u_key = watch_u_key
	self._dis_curr = nil
end

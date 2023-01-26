local debug_draw = false --turn this on if you want a visualization of your bipod placement attempts



--raycast check debug colors
local brush_valid = Draw:brush(Color.green:with_alpha(0.5),5) --shapes drawn with these brushes will last 5 seconds
local brush_invalid = Draw:brush(Color.red:with_alpha(0.5),5)

local function debugdraw(from,to,valid)
	if not debug_draw then return end
	local brush = valid and brush_valid or brush_invalid
	brush:line(from,to)
	brush:sphere(to,10)
end

--prior to 1.3, this check was simply disabled except for blocked state/_is_npc
function WeaponLionGadget1:_is_deployable(...)
	if self._is_npc then --removed vanilla check for valid bipod bone
		return false
	end

	if self:_is_in_blocked_deployable_state() then
		return false
	end

	local player = managers.player:local_player():movement()
	
	if player:current_state():ducking() then -- screw the raycasts. always allow bipodding if crouched
		return true
	end
	
	local function rc(from,to) --separate function cause i used to have debug stuff in here + return empty table if invalid raycast
		return self._unit:raycast(from,to) or {}
	end
	local yaw = player:m_head_rot():yaw() --degrees -180 to +180
	
	local z_offset = -25
	local x_distance = 56 --left/right raycheck distance
	local y_distance = 36 --forward direction; closer distance allows bipodding on objects directly in front of player, such as railings on cook off/rats d1
	local z_distance = 75 --downward distance from player cam height (+ z_offset) 
	local head_pos = player:m_head_pos()
	local head_angle = player:m_head_rot():y().y
	local head_rot = mvector3.copy(player:m_head_rot():y())
	
	--head_rot.x * y_distance --can be used to make y_distance change slightly with pitch aim
	local x = math.sin(-yaw % 360) * y_distance
	local y = math.cos(-yaw % 360) * y_distance
	local from = head_pos + Vector3(x,y,z_offset)
	
	local to = from + Vector3(0,0,-z_distance)
	local ray_down = rc(from,to)
	local down_valid = ray_down.distance and ray_down.distance > 5
	debugdraw(from,to,down_valid) --doesn't seem to want to draw a vertical line, prob cause of slope calculation reasons, but whatev
	self._center_ray_to = to
	self._center_ray_from = from
	
	to = from + Vector3(x_distance * math.sin((90 + yaw) % 360),-x_distance * math.cos((90 + yaw) % 360),-z_distance)
	local ray_left = rc(from,to)
	local left_valid = ray_left.distance and ray_left.distance > 5
	debugdraw(from,to,left_valid)
	self._left_ray_to = to
	self._left_ray_from = from
	
	to = from + Vector3(x_distance * math.sin((270 + yaw) % 360),-x_distance * math.cos((270 + yaw) % 360),-z_distance)
	local ray_right = rc(from,to)
	local right_valid = ray_right.distance and ray_right.distance > 5
	debugdraw(from,to,right_valid)
	self._right_ray_to = to
	self._right_ray_from = from
	
	if (left_valid and right_valid) or down_valid then 
	
		if debug_draw then
			brush_valid:sphere(from,5)
		end
		return true
	end
	if debug_draw then 
		brush_invalid:sphere(from,5)
	end
	return false
end

function WeaponLionGadget1:is_usable() --used for update() validity check
	return true
end
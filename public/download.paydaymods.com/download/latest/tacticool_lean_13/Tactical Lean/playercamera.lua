local hard_block = false --whether or not to instantly stop leaning when invalid lean position; i don't like it
local orig_set_cam_pos = PlayerCamera.set_position --not really needed
function PlayerCamera:set_position(pos)
	local player = managers.player and managers.player:player_unit()
	if not player then
		return orig_set_cam_pos(self,pos)
	end	

	local _lean = TacticalLean.current_lean
	local _exit = TacticalLean.exiting_lean
	local duration = TacticalLean:get_lean_duration()
	local distance = TacticalLean:get_distance()
	local sign = TacticalLean:get_angle(_lean) < 0 and -1 or 1
	local start_t = TacticalLean.move_anim_t
	
	local raw_headrot = player:movement():m_head_rot()
	local headrot = Vector3()
	
	local new_pos = Vector3()
	mvector3.set(new_pos,pos)

	if _lean then 

		headrot = raw_headrot:x() * distance * sign
		if TacticalLean:collision_check_enabled() then 
			local check_pos = Vector3()
			mvector3.set(check_pos,pos)
			mvector3.add(check_pos,headrot)
			local ray = World:raycast("ray",pos,check_pos,"slot_mask",managers.slot:get_mask("world_geometry"))
			if ray then 
				TacticalLean:stop_lean()
				if hard_block then return orig_set_cam_pos(self,pos) end --would snap back instantly... gross
			end
		end
		
		local elapsed_t = Application:time() -  start_t
		local progress_smooth = 1
		
		if duration < elapsed_t then 
			TacticalLean.current_lean = (not _exit) and _lean
			--on completion: if exiting, set "current_lean" to false
			--else, keep "current_lean" value
			TacticalLean.exiting_lean = false
			--either way, done exiting lean
		else
			local progress = elapsed_t / duration
			progress_smooth = math.bezier({	0,	0,	1,	1},progress) --linear interpolation is for chumps
		end
		
		if _exit then 
			progress_smooth = 1 - progress_smooth
		end
		
		headrot = headrot * progress_smooth
		
		mvector3.add(new_pos,headrot)
	end

	self._camera_controller:set_camera(new_pos)
	mvector3.set(self._m_cam_pos, new_pos)	
end

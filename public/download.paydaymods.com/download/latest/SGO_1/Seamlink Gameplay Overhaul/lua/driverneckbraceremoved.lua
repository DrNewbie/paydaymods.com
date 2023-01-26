if not SGO or not SGO.settings.use_drive then return end
function PlayerDriving:_set_camera_limits(mode)
	--local map = managers.job:current_level_id()
	--if map and map == "shoutout_raid" then
		if mode == "driving" then
			self._camera_unit:base():set_limits(180, 20)
		elseif mode == "passenger" then
			self._camera_unit:base():set_limits(100, 30)
		elseif mode == "shooting" then
			self._camera_unit:base():set_limits(180, 40)
		end
	--else
	--	if mode == "driving" then
	--		--self._camera_unit:base():set_limits(60, 20)
	--		self._camera_unit:base():set_limits(180, 20)
	--	elseif mode == "passenger" then
	--		--self._camera_unit:base():set_limits(80, 30)
	--		self._camera_unit:base():set_limits(100, 30)
	--	elseif mode == "shooting" then
	--		--self._camera_unit:base():set_limits(180, 40)
	--		self._camera_unit:base():set_limits(180, 40)
	--	end
	--end
end

if InventoryChatAndPlayerStates_SkillTreeGui_Hooked then
	return
else
	InventoryChatAndPlayerStates_SkillTreeGui_Hooked = true
end

local function RealignSpecializationPointsText(skilltreegui)
	if skilltreegui == nil or not alive(skilltreegui._specialization_panel) then
		return
	end

	-- Move the '# perk points available' text up to avoid potential collisions with the player states text
	local points_text = skilltreegui._specialization_panel:child("points_text")
	local spec_box_panel = skilltreegui._specialization_panel:child("spec_box_panel")
	if alive(points_text) and alive(spec_box_panel) then
		points_text:set_top(spec_box_panel:bottom() + 5)
	end
end

local _setup_actual = SkillTreeGui._setup
function SkillTreeGui:_setup(...)
	_setup_actual(self, ...)

	if MenuCallbackHandler:is_multiplayer() and managers.network:session() then
		RealignSpecializationPointsText(self)
	end
end

local update_actual = SkillTreeGui.update
function SkillTreeGui:update(...)
	update_actual(self, ...)

	if self._spec_placing_points then
		if MenuCallbackHandler:is_multiplayer() and managers.network:session() then
			RealignSpecializationPointsText(self)
		end
	end
end

local stop_spec_place_points_actual = SkillTreeGui.stop_spec_place_points
function SkillTreeGui:stop_spec_place_points(...)
	stop_spec_place_points_actual(self, ...)

	if MenuCallbackHandler:is_multiplayer() and managers.network:session() then
		RealignSpecializationPointsText(self)
	end
end

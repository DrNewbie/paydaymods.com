
local blacklistedtemplates = {
	blackmarket_crafting = true,
	blackmarket_armor = true
}

local set_scene_template_actual = MenuSceneManager.set_scene_template
function MenuSceneManager:set_scene_template(template, data, custom_name, skip_transition, ...)
	if not skip_transition and (self._current_scene_template == template or self._current_scene_template == custom_name) then
		return
	end

	local should_animate = true
	if blacklistedtemplates[template] or blacklistedtemplates[self._current_scene_template] then
		-- Don't zoom through the entire universe. Thanks, but no thanks
		should_animate = false
	end

	set_scene_template_actual(self, template, data, custom_name, skip_transition, ...)

	if should_animate then
		self._transition_time = 0
	end
end

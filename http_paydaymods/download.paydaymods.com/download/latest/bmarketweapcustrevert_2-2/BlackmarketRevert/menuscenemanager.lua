
-- UPDATE 79 BEGIN MOD --
-- TODO: Should return an alias to the default blackmarket template?
function MenuSceneManager:get_crafting_custom_data(...)
	return {}
end

function MenuSceneManager:spawn_workbench_room(...)
end
-- UPDATE 79 END MOD --

-- Non-conforming GUI panels that use the "blackmarket_crafting" scene template can be discovered and corrected by hooking
-- MenuSceneManager:set_scene_template()

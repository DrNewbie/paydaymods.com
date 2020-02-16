LevelLoadingScreenGuiScript.old__init = LevelLoadingScreenGuiScript.old__init or LevelLoadingScreenGuiScript.init

function LevelLoadingScreenGuiScript:init(scene_gui, res, progress, base_layer)
	self:old__init(scene_gui, res, progress, base_layer)	
	local title_text = "로딩중"--managers.localization:text("debug_loading_level"))
	self._level_title_text:set_text(title_text)
end
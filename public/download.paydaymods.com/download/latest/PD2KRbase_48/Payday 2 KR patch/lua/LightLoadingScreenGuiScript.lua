LightLoadingScreenGuiScript.old__init = LightLoadingScreenGuiScript.old__init or LightLoadingScreenGuiScript.init

function LightLoadingScreenGuiScript:init(scene_gui, res, progress, base_layer, is_win32)
	self:old__init(scene_gui, res, progress, base_layer, is_win32)
	self._title_text:set_text("불러오는중")--managers.localization:text("debug_loading_level"))
end
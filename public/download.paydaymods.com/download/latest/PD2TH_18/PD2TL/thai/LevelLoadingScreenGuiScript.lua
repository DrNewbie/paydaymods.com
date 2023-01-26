local init =  LevelLoadingScreenGuiScript.init
function LevelLoadingScreenGuiScript:init(...)
	init(self, ...)	
	self._level_title_text:set_text("โหลด")
end
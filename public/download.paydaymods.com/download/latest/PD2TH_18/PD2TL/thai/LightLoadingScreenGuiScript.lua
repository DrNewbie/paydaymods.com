local init =  LightLoadingScreenGuiScript.init
function LightLoadingScreenGuiScript:init(...)
	init(self, ...)
	self._title_text:set_text("โหลด")
end
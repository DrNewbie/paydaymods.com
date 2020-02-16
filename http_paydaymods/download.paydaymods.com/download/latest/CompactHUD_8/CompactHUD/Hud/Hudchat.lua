
CloneClass(HUDChat)
function HUDChat:init(ws, hud)
	self.orig.init(self, ws, hud)		
	self._output_width = 300
	self._panel_width = 300		
	if BigLobbyGlobals then 
		self._panel:set_rightbottom(self._hud_panel:right() + 180, self._hud_panel:bottom() - 200)
	else
		self._panel:set_bottom(self._panel:parent():h() - 180)
	end
	self._input_panel:set_h(72)
	self._input_panel:child("input_text"):set_h(72)
	self._input_panel:child("input_text"):set_vertical("top")
	local output_bg = self._panel:child("output_panel"):child("output_bg")
	if output_bg then
		output_bg:set_alpha(0.5)
	end
	self._input_panel:child("input_bg"):hide()
	self:_layout_input_panel()
	self:_layout_output_panel()		
	self:update_caret()
end

function HUDChat:enter_text(o, s)
	if managers.hud and managers.hud:showing_stats_screen() then
		return
	end
	if self._skip_first then
		self._skip_first = false
		return
	end
	local text = self._input_panel:child("input_text")
	if type(self._typing_callback) ~= "number" then
		self._typing_callback()
	end    
	text:replace_text(s)
	local lbs = text:line_breaks()
	if #lbs > 2 then
		local s = lbs[3]
		local e = utf8.len(text:text())
		text:set_selection(s, e)
		text:replace_text("")
	end
	self:update_caret()    
end

function HUDChat:update_caret()
	local text = self._input_panel:child("input_text")
	local caret = self._input_panel:child("caret")
	local s, e = text:selection()
	local x, y, w, h = text:selection_rect()
	if s == 0 and e == 0 then
		if text:align() == "center" then
			x = text:world_x() + text:w() / 2
		else
			x = text:world_x()
		end
		y = text:world_y()
	end
	if w < 3 then
		w = 3
	end
	caret:set_world_shape(x, y + 2, w, text:font_size())
	self:set_blinking(s == e and self._focus)	
end


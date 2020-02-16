MultiProfileItemGui = MultiProfileItemGui or class()
function MultiProfileItemGui:init(ws, panel)
	self._ws = ws
	local profile_panel = self._panel or panel:panel({w = 280, h = 36})
	profile_panel:set_bottom(panel:bottom() - 4)
	profile_panel:set_center_x(panel:w() / 2)
	self._panel = profile_panel
	self._box_panel = panel:panel()
	self._box_panel:set_shape(profile_panel:shape())
	self._box = BoxGuiObject:new(self._box_panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})
	self._caret = self._panel:rect({
		name = "caret",
		x = 0,
		y = 0,
		w = 0,
		h = 0,
		color = Color(0.1, 1, 1, 1),
		blend_mode = "add"
	})
	self._max_length = 30
	self._name_editing_enabled = true
	self:update()
end
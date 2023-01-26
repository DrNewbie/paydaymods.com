Hooks:PostHook(MenuComponentManager, "init", "PDTHHudAddComponents", function(self)
    self._active_components.portrait = {create = callback(self, self, "_create_portrait_gui"), close = callback(self, self, "close_portrait_gui")}
end)

function MenuComponentManager:_create_portrait_gui()
	if self._portrait_gui then
		return
	end
    self:close_portrait_gui()
	self._portrait_gui = PortraitPreviewGUI:new(self._ws)
end

function MenuComponentManager:close_portrait_gui()
    if self._portrait_gui then
		self._portrait_gui:close()
		self._portrait_gui = nil
	end
end

function MenuComponentManager:refresh_portrait_gui()
    if self._portrait_gui then
		self._portrait_gui:refresh()
	end
end

local orig_MenuComponentManagermouse_pressed = MenuComponentManager.mouse_pressed
function MenuComponentManager:mouse_pressed(o, button, x, y)
    if self._portrait_gui and self._portrait_gui:mouse_pressed(button, x, y) then
        return true
    end

    return orig_MenuComponentManagermouse_pressed(self, o, button, x, y)
end

local orig_MenuComponentManagermouse_released = MenuComponentManager.mouse_released
function MenuComponentManager:mouse_released(o, button, x, y)
    if self._portrait_gui and self._portrait_gui:mouse_released(button, x, y) then
        return true
    end

    return orig_MenuComponentManagermouse_released(self, o, button, x, y)
end

local orig_MenuComponentManagermouse_moved = MenuComponentManager.mouse_moved
function MenuComponentManager:mouse_moved(o, x, y)
    if self._portrait_gui then
        local used, pointer = self._portrait_gui:mouse_moved(x, y)
        if used then
            return used, pointer
        end
    end

    return orig_MenuComponentManagermouse_moved(self, o, x, y)
end

Hooks:PostHook(MenuComponentManager, "update", "PDTHHudUpdateComponents", function(self, t, dt)
    if self._portrait_gui then
		self._portrait_gui:update(t, dt)
	end
end)

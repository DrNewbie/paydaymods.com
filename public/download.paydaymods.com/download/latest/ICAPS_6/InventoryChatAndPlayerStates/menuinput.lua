
if InventoryChatAndPlayerStates_MenuInput_Hooked then
	return
else
	InventoryChatAndPlayerStates_MenuInput_Hooked = true
end

local function_names = {
	mouse_press = true,
	mouse_pressed = true,
	mouse_click = true,
	mouse_clicked = true
}

-- Fix to prevent pressing the Escape key from backing out of the currently open node instead of closing the chat panel (if open)
local back_actual = MenuInput.back
function MenuInput:back(...)
	local menu_component_manager = managers.menu_component
	if menu_component_manager ~= nil then
		local chat_gui = menu_component_manager._game_chat_gui
		if chat_gui ~= nil and chat_gui.additional_data ~= nil then
			-- Restrict to keyboard-initiated events only (clicking the Back menu button should always back out of the node
			-- instead of closing the chat panel). This code is beyond hideous, though...
			local pass = true
			local info = nil
			local level = 2
			repeat
				info = debug.getinfo(level, "n")
				if info ~= nil then
					if function_names[info.name] then
						pass = false
						break
					end
				end
				level = level + 1
			until info == nil
			if pass then
				local focus = chat_gui:input_focus()
				-- Checking for focus in this manner to work around an awkward initialization issue that causes this hook to
				-- block all attempts to back out from the current node until the chat panel is opened and closed at least once
				if focus == true or focus == 1 then
					-- Not explicitly handling focus loss here as it is already handled properly by game code
					-- (ChatGui:esc_key_callback())
					menu_component_manager:post_event("menu_exit")
					return
				elseif chat_gui._crimenet_chat_state then
					chat_gui:_hide_crimenet_chat()
					menu_component_manager:post_event("menu_exit")
					return
				end
			end
		end
	end

	return back_actual(self, ...)
end

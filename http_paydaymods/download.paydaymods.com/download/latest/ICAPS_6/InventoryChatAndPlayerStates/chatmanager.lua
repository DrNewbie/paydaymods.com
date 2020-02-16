
if InventoryChatAndPlayerStates_ChatGui_Hooked then
	return
else
	InventoryChatAndPlayerStates_ChatGui_Hooked = true
end

local function CreatePlayerStatesPanel(chatgui, parent_panel)
	if chatgui == nil or parent_panel == nil or not alive(parent_panel) then
		return nil
	end

	local playerstates_panel = parent_panel:panel({
		name = "playerstates"
	})

	local tmp_panel = nil
	local flash_panel = nil

	playerstates_panel:text({
		name = "job_text",
		text = "CHOOSE NEW CONTRACT FROM CRIME.NET",
		align = "left",
		vertical = "center",
		font_size = tweak_data.menu.pd2_small_font_size - 4,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.screen_colors.text,
		blend_mode = "normal"
	})
	playerstates_panel:bitmap({
		name = "job_plan",
		texture = "guis/textures/pd2/cn_playstyle_loud",
		blend_mode = "normal"
	})

	InventoryChatAndPlayerStates:UpdateJobText(true)

	-- From HUDTeammate:init()
	local tabs_texture = "guis/textures/pd2/hud_tabs"
	local cs_rect = {
		84,
		34,
		19,
		19
	}

	local max_players = InventoryChatAndPlayerStates.DetailedMaxPlayers or 7
	local num_players = CriminalsManager ~= nil and CriminalsManager.MAX_NR_CRIMINALS or 4
	for i = 1, num_players do
		tmp_panel = playerstates_panel:bitmap({
			name = tostring(i) .. "_callsign",
			texture = tabs_texture,
			texture_rect = cs_rect,
			color = tweak_data.chat_colors[i]:with_alpha(0.35),
--			layer = tweak_data.gui.CRIMENET_CHAT_LAYER,
			blend_mode = "normal"
		})

		-- Do not show the state texts if there are too many players (otherwise the contract will be pushed offscreen)
		if num_players <= max_players then
			tmp_panel = playerstates_panel:text({
				name = tostring(i) .. "_state",
				text = "NOT CONNECTED",
				align = "left",
				vertical = "center",
				font_size = tweak_data.menu.pd2_small_font_size - 4,
				font = tweak_data.menu.pd2_small_font,
				color = tweak_data.menu.default_disabled_text_color,
--				layer = tweak_data.gui.CRIMENET_CHAT_LAYER,
				blend_mode = "normal"
			})
		end

		-- From ChatGui:init()
		flash_panel = playerstates_panel:bitmap({
			name = tostring(i) .. "_flash",
			texture = "guis/textures/pd2/crimenet_marker_glow",
			rotation = 360,
			alpha = 0,
			layer = tmp_panel:layer() - 1,
			-- Using the disabled text color instead to prevent the glow from obscuring the text on top of it
			color = tweak_data.menu.default_disabled_text_color,
			blend_mode = "add"
		})
		-- Implies a call to InventoryChatAndPlayerStates:RealignPlayerStates() as well
		InventoryChatAndPlayerStates:UpdatePlayerStates(i)
	end

	return playerstates_panel
end

local set_params_actual = ChatGui.set_params
function ChatGui:set_params(params, ...)
	set_params_actual(self, params, ...)

	local chat_button_panel = self._hud_panel:child("chat_button_panel")
	if chat_button_panel ~= nil and not alive(chat_button_panel) then
		chat_button_panel = nil
	end
	if self.previous_chat_button_panel_position ~= nil then
		if chat_button_panel ~= nil then
			chat_button_panel:set_x(self.previous_chat_button_panel_position.x)
			chat_button_panel:set_y(self.previous_chat_button_panel_position.y)
			-- Yes, retrieve this again the next time this function gets called
			self.previous_chat_button_panel_position = nil
		end
	end

	-- Yep, even if params.additional_data is nil
	self.additional_data = params.additional_data

	local playerstates = nil
	if chat_button_panel ~= nil then
		playerstates = chat_button_panel:child("playerstates")
		if not alive(playerstates) then
			playerstates = nil
		end
	end

	if self.additional_data ~= nil then
		if self.additional_data.button_panel_vert_offset then
			if chat_button_panel ~= nil then
				-- Ugly workaround to get the show/hide chat button back to its original position in Crime.net and Preplanning
				if self.previous_chat_button_panel_position == nil then
					self.previous_chat_button_panel_position = {}
					self.previous_chat_button_panel_position.x = chat_button_panel:x()
					self.previous_chat_button_panel_position.y = chat_button_panel:y()
				end

				-- Where did the magic number 11 come from? Search for the following line in lib/managers/chatmanager.lua:
				-- chat_button:set_bottom(chat_button_panel:h() - 11)
				if self.additional_data.align_to_wallet and alive(Global.wallet_panel) then
					chat_button_panel:set_bottom(Global.wallet_panel:child("wallet_skillpoint_text"):top() + 11 + self.additional_data.button_panel_vert_offset)
				else
					chat_button_panel:set_bottom(chat_button_panel:parent():h() + 11 + self.additional_data.button_panel_vert_offset)
				end
				-- Ensure that the chat panel is aligned properly from the beginning
				self._panel:set_bottom(self._hud_panel:child("chat_button_panel"):child("chat_button"):world_top())
			end
		end
		-- Yep, even if additional_data.playerstates_position_override is nil
		InventoryChatAndPlayerStates.position_override = self.additional_data.playerstates_position_override
		if playerstates == nil then
			playerstates = CreatePlayerStatesPanel(self, chat_button_panel)
		end
	else
		-- Destroy the status panel if it is present
		if chat_button_panel ~= nil and playerstates ~= nil then
			chat_button_panel:remove(playerstates)
			playerstates = nil
		end
		-- Halt any fade animations and stomp away the alpha override set in ChatGui:_hide_crimenet_chat()
		self._panel:stop()
		self._panel:set_alpha(1)
	end
end

local chatkey = Idstring("toggle_chat")
local special_btn_pressed_actual = ChatGui.special_btn_pressed
function ChatGui:special_btn_pressed(button, ...)
	if button == chatkey then
		local tmp = nil
		local menucomponentmanager = managers.menu_component
		if menucomponentmanager then
			tmp = menucomponentmanager._player_inventory_gui
			if tmp then
				-- Pressing the key assigned to toggling chat while entering a name into the multi-profile GUI text field
				-- triggers this, ensure that the chat panel is not invoked to prevent input glitching (and therefore the
				-- complete loss of keyboard and mouse functionality, requiring game termination)
				tmp = tmp._multi_profile_item
				if tmp and tmp._editing then
					return false
				end
			end

			tmp = menucomponentmanager._blackmarket_gui
			-- Consequences are far less severe for the Blackmarket custom name text field, but are still annoying nonetheless
			if tmp and tmp._renaming_item then
				return false
			end

			tmp = menucomponentmanager._skilltree_gui
			-- Consequences are far less severe for the Skilltree skillset name text field, but are still annoying nonetheless
			if tmp and tmp._renaming_skill_switch then
				return false
			end
		end
	end

	return special_btn_pressed_actual(self, button, ...)
end

local mouse_pressed_actual = ChatGui.mouse_pressed
function ChatGui:mouse_pressed(button, x, y, ...)
	if self.additional_data ~= nil and not self.additional_data.click_through_output_bg and self._crimenet_chat_state then
		local chat_bg = self._panel:child("chat_bg")
		if alive(chat_bg) then
			-- No check for the button pressed here to ensure that all mouse buttons are blocked
			if chat_bg:inside(x, y) and not self._input_panel:inside(x, y) then
				-- From ChatGui:mouse_pressed()
				if self._panel:child("output_panel"):inside(x, y) then
					if button == Idstring("mouse wheel down") then
						if self:mouse_wheel_down(x, y) then
							self:set_scroll_indicators()
							self:_on_focus()
							return true
						end
					elseif button == Idstring("mouse wheel up") then
						if self:mouse_wheel_up(x, y) then
							self:set_scroll_indicators()
							self:_on_focus()
							return true
						end
					elseif button == Idstring("0") and self:check_grab_scroll_panel(x, y) then
						self:set_scroll_indicators()
						self:_on_focus()
						return true
					end
				elseif button == Idstring("0") and self:check_grab_scroll_bar(x, y) then
					self:set_scroll_indicators()
					self:_on_focus()
					return true
				end

				-- Only left mouse clicks are allowed to deactivate the input panel
				if button == Idstring("0") then
					self:_loose_focus()
				end

				-- Return true here to prevent MenuComponentManager:mouse_pressed() from proceeding to poll the mouse_pressed()
				-- callbacks of other GUIs that may be underneath the chat GUI
				return true
			end
		end
	end

	return mouse_pressed_actual(self, button, x, y, ...)
end

local mouse_moved_actual = ChatGui.mouse_moved
function ChatGui:mouse_moved(x, y, ...)
	if self.additional_data ~= nil then
		if self._crimenet_chat_state and not self.additional_data.click_through_output_bg then
			local chat_bg = self._panel:child("chat_bg")
			if alive(chat_bg) and chat_bg:inside(x, y) and not self._input_panel:inside(x, y) then
				-- Return true here to prevent MenuComponentManager:mouse_moved() from proceeding to poll the mouse_moved()
				-- callbacks of other GUIs that may be underneath the chat GUI
				return true, "arrow"
			end
		else
			-- Referenced by the ChatGui:_animate_show_component_icaps() and ChatGui:_animate_fade_output_icaps() coroutines
			self.icaps_mouse_inside_panel = self._panel:inside(x, y)
		end
	end

	return mouse_moved_actual(self, x, y, ...)
end

-- Hooking ChatGui:_show_crimenet_chat() and ChatGui:_hide_crimenet_chat() instead of ChatGui:toggle_crimenet_chat() to ensure
-- that any game GUI components that open / close the chat panel will always trigger a call to
-- InventoryChatAndPlayerStates:RealignPlayerStates(), even if they do not call ChatGui:toggle_crimenet_chat() (such as
-- PrePlanningMapGui:toggle_drawboard())

local _show_crimenet_chat_actual = ChatGui._show_crimenet_chat
function ChatGui:_show_crimenet_chat(...)
	_show_crimenet_chat_actual(self, ...)
	-- Automatically begin accepting input
	self:_on_focus()

	if not alive(self._panel) or not alive(self._hud_panel) then
		return
	end

	-- Elementary, OVK. How did you even manage to screw this one up? Thanks for wasting several hours of my life with that
	-- oversight. Long story short, this change forces the entire chat GUI to align itself to the chat button panel's absolute
	-- (rather than relative) position. The relative position never changes regardless of where the chat button panel is
	-- positioned on screen, but the absolute position (obviously) does change
	self._panel:set_bottom(self._hud_panel:child("chat_button_panel"):child("chat_button"):world_top())

	InventoryChatAndPlayerStates:RealignPlayerStates()

	self._panel:set_alpha(1)
end

local _hide_crimenet_chat_actual = ChatGui._hide_crimenet_chat
function ChatGui:_hide_crimenet_chat(...)
	_hide_crimenet_chat_actual(self, ...)

	if not alive(self._panel) or not alive(self._hud_panel) then
		return
	end

	-- Apparently the game code 'hides' the chat panel by moving it offscreen rather than hiding it or setting its alpha to 0,
	-- revert the positioning change and do it the proper way
	self._panel:set_bottom(self._hud_panel:child("chat_button_panel"):child("chat_button"):world_top())

	-- Realigning here is fine since the following code only deals with visibility rather than positioning
	InventoryChatAndPlayerStates:RealignPlayerStates()

	-- This will be stomped in ChatGui:set_params() if necessary
	self._panel:set_alpha(0)
end

local receive_message_actual = ChatGui.receive_message
function ChatGui:receive_message(...)
	receive_message_actual(self, ...)

	-- Reveal the chat panel as a non-interactive 'ghost' panel upon receiving a message when it is closed
	local panel = self._panel
	if self.additional_data ~= nil and self._animate_fade_output_icaps ~= nil and alive(panel) and not self._crimenet_chat_state then
		local alpha = 0.55
		if InventoryChatAndPlayerStates ~= nil and InventoryChatAndPlayerStates.GhostAlpha ~= nil then
			alpha = InventoryChatAndPlayerStates.GhostAlpha
		end
		-- Snap the chat log to the most recent entry (otherwise ghosting the panel is pointless)
		local output_panel = panel:child("output_panel")
		if not alive(output_panel) then
			return
		end
		local scroll_panel = output_panel:child("scroll_panel")
		if not alive(scroll_panel) then
			return
		end
		scroll_panel:set_bottom(output_panel:h())
		self:set_scroll_indicators()
		panel:stop()
		panel:animate(callback(self, self, "_animate_show_component_icaps"), panel:alpha(), alpha)
		panel:animate(callback(self, self, "_animate_fade_output_icaps"), alpha)
	end
end

-- Derived from ChatGui:_animate_show_component() (U97.3)
function ChatGui:_animate_show_component_icaps(panel, start_alpha, target_alpha)
	-- Abort at any point in this coroutine if self._crimenet_chat_state changes to true to avoid interfering with the alpha set
	-- in ChatGui:_show_crimenet_chat(). A self._panel:stop() call could accompany every self._panel:set_alpha() call, but that
	-- would cause the ghosted panel to vanish when transitioning between nodes (screens), which this approach preserves
	if self._crimenet_chat_state then
		return
	end
	local TOTAL_T = 0.25
	local t = 0
	start_alpha = start_alpha or 0
	while TOTAL_T > t do
		local dt = coroutine.yield()
		t = t + dt
		if self._crimenet_chat_state then
			return
		end
		if self.icaps_mouse_inside_panel then
			panel:set_alpha(0)
		else
			panel:set_alpha(start_alpha + t / TOTAL_T * (target_alpha - start_alpha))
		end
	end
	if self._crimenet_chat_state then
		return
	end
	if self.icaps_mouse_inside_panel then
		panel:set_alpha(0)
	else
		panel:set_alpha(target_alpha)
	end
end

-- Derived from ChatGui:_animate_fade_output() (U97.3)
function ChatGui:_animate_fade_output_icaps(panel, hold_alpha)
	-- Abort at any point in this coroutine if self._crimenet_chat_state changes to true to avoid interfering with the alpha set
	-- in ChatGui:_show_crimenet_chat(). A self._panel:stop() call could accompany every self._panel:set_alpha() call, but that
	-- would cause the ghosted panel to vanish when transitioning between nodes (screens), which this approach preserves
	if self._crimenet_chat_state then
		return
	end
	local wait_t = 10
	local fade_t = 1
	local t = 0
	while wait_t > t do
		local dt = coroutine.yield()
		t = t + dt
		if self._crimenet_chat_state then
			return
		end
		if self.icaps_mouse_inside_panel then
			panel:set_alpha(0)
		else
			panel:set_alpha(hold_alpha)
		end
	end
	local t = 0
	local start_alpha = panel:alpha()
	while fade_t > t do
		local dt = coroutine.yield()
		t = t + dt
		if self._crimenet_chat_state then
			return
		end
		panel:set_alpha(start_alpha - t / fade_t)
	end
	if self._crimenet_chat_state then
		return
	end
	panel:set_alpha(0)
end

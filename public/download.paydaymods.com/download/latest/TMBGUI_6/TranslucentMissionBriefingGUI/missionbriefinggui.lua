
if TranslucentMissionBriefingGUI_MissionBriefingGui_Hooked then
	return
else
	TranslucentMissionBriefingGUI_MissionBriefingGui_Hooked = true
end

local function UpdatePlayerText(missionbriefinggui)
	local state = game_state_machine:current_state()
	if state._spectator_data and alive(missionbriefinggui.current_character_text) then
		local character = state._spectator_data.teammate_records[state._spectator_data.watch_u_key]
		if character and character.unit then
			missionbriefinggui.current_character_text:set_color(tweak_data.chat_colors[managers.criminals:character_color_id_by_unit(character.unit)])
			-- From HUDManager:add_mugshot_by_unit(). This works on both team AI and players
			missionbriefinggui.current_character_text:set_text(character.unit:base():nick_name())
		end

		local _, _, w, h = missionbriefinggui.current_character_text:text_rect()
		missionbriefinggui.current_character_text:set_size(w, h)
	end
end

local function FadeOutFunc(o)
	local start = o:alpha()
	over(TranslucentMissionBriefingGUI.Prefs.FadeDuration, function(p)
		o:set_alpha(math.lerp(start, 0, p))
	end)
	-- I believe there are rendering optimizations for panel:hide() that panel:set_alpha(0) does not enable, so force the
	-- panel to be hidden when its alpha has been interpolated to 0
	o:hide()
end

local function FadeInFunc(o)
	local start = o:alpha()
	if not o:visible() then
		o:show()
	end
	over(TranslucentMissionBriefingGUI.Prefs.FadeDuration, function(p)
		o:set_alpha(math.lerp(start, 1, p))
	end)
end

local controls_to_toggle = {
	"character_label",
	"toggle_panning_box",
	"current_character_label",
	"current_character_text"
}

-- Rate limit the number of toggles that can be made per second to prevent a native crash in
-- ListenerManager:_set_listener_set_active()
local togglecooldown = 0
local toggledelay = 0.3

local function TurnTranslucent(missionbriefinggui, button, instantaneous)
	local alive = _G.alive
	if not alive(button) then
		return
	end

	local now = Application:time()
	if now < togglecooldown then
		return
	end

	local should_fade = TranslucentMissionBriefingGUI.Prefs.FadeElements and not instantaneous
	for panel, __ in pairs(TranslucentMissionBriefingGUI.ElementsToHide or {}) do
		if alive(panel) then
			panel:stop()
			if should_fade then
				panel:animate(FadeOutFunc)
			else
				panel:set_alpha(0)
				panel:hide()
			end
		end
	end
	button:set_text(managers.localization:to_upper_text("TMBGUI_hide_context"))
	-- Reveal all buttons and labels
	local control = nil
	for __, name in ipairs(controls_to_toggle) do
		control = missionbriefinggui[name]
		if alive(control) then
			control:stop()
			if should_fade then
				control:animate(FadeInFunc)
			else
				control:set_alpha(1)
				control:show()
			end
		end
	end
	for name, btn in pairs(missionbriefinggui.context_buttons) do
		if btn ~= button and alive(btn) then
			btn:stop()
			if should_fade then
				btn:animate(FadeInFunc)
			else
				btn:set_alpha(1)
				btn:show()
			end
		end
	end
	local state = game_state_machine:current_state()
	if type(state._setup_sound_listener) == "function" then
		state:_setup_sound_listener()
	end
	UpdatePlayerText(missionbriefinggui)

	-- Update the bounds of the button to prevent clipping issues (when the 'Show context' and 'Hide context' strings are of
	-- different lengths)
	local _, _, w, h = button:text_rect()
	button:set_size(w, h)

	togglecooldown = now + toggledelay
end

local function TurnOpaque(missionbriefinggui, button, instantaneous)
	local alive = _G.alive
	if not alive(button) then
		return
	end

	local now = Application:time()
	if now < togglecooldown then
		return
	end

	local should_fade = TranslucentMissionBriefingGUI.Prefs.FadeElements and not instantaneous
	for panel, __ in pairs(TranslucentMissionBriefingGUI.ElementsToHide or {}) do
		if alive(panel) then
			panel:stop()
			if should_fade then
				panel:animate(FadeInFunc)
			else
				panel:set_alpha(1)
				panel:show()
			end
		end
	end
	button:set_text(managers.localization:to_upper_text("TMBGUI_show_context"))
	-- Hide all buttons and labels
	local control = nil
	for __, name in ipairs(controls_to_toggle) do
		control = missionbriefinggui[name]
		if alive(control) then
			control:stop()
			if should_fade then
				control:animate(FadeOutFunc)
			else
				control:set_alpha(0)
				control:hide()
			end
		end
	end
	for name, btn in pairs(missionbriefinggui.context_buttons) do
		if btn ~= button and alive(btn) then
			btn:stop()
			if should_fade then
				btn:animate(FadeOutFunc)
			else
				btn:set_alpha(0)
				btn:hide()
			end
		end
	end
	local state = game_state_machine:current_state()
	if type(state._clear_sound_listener) == "function" then
		-- This takes a few seconds to kick in, but it does work
		state:_clear_sound_listener()
	end

	-- Update the bounds of the button to prevent clipping issues (when the 'Show context' and 'Hide context' strings are of
	-- different lengths)
	local _, _, w, h = button:text_rect()
	button:set_size(w, h)

	togglecooldown = now + toggledelay
end

local function ToggleContextCallback(missionbriefinggui, button)
	if not missionbriefinggui or not button then
		return
	end

	if Application:time() < togglecooldown then
		return
	end

	local TranslucentMissionBriefingGUI = _G.TranslucentMissionBriefingGUI
	local hudmanager = managers.hud
	if TranslucentMissionBriefingGUI.BackgroundVisible then
		TurnTranslucent(missionbriefinggui, button)

		if hudmanager ~= nil then
			hudmanager:show(PlayerBase.PLAYER_INFO_HUD_FULLSCREEN)
			-- This enables waypoints, but also enables a lot of other junk like teammate panels
--			hudmanager:show(PlayerBase.PLAYER_INFO_HUD_PD2)
		end
	else
		TurnOpaque(missionbriefinggui, button)

		if hudmanager ~= nil then
			hudmanager:hide(PlayerBase.PLAYER_INFO_HUD_FULLSCREEN)
--			hudmanager:hide(PlayerBase.PLAYER_INFO_HUD_PD2)
		end
	end
	TranslucentMissionBriefingGUI.BackgroundVisible = not TranslucentMissionBriefingGUI.BackgroundVisible
end

local function PreviousCharacterCallback(missionbriefinggui, button)
	if not missionbriefinggui or not alive(button) then
		return
	end
	local state = game_state_machine:current_state()
	if type(state.cb_prev_player) == "function" then
		state:cb_prev_player()
		UpdatePlayerText(missionbriefinggui)
	end
end

local function NextCharacterCallback(missionbriefinggui, button)
	if not missionbriefinggui or not alive(button) then
		return
	end
	local state = game_state_machine:current_state()
	if type(state.cb_next_player) == "function" then
		state:cb_next_player()
		UpdatePlayerText(missionbriefinggui)
	end
end

local function TogglePanningCallback(missionbriefinggui, button)
	if not missionbriefinggui or not alive(button) then
		return
	end
	local state = game_state_machine:current_state()
	if state._controller ~= nil and type(state.set_controller_enabled) == "function" then
		state:set_controller_enabled(not state._controller:enabled())
		if alive(missionbriefinggui.toggle_panning_box) then
			if state._controller:enabled() then
				missionbriefinggui.toggle_panning_box:set_texture_rect(24, 24, 24, 24)
			else
				missionbriefinggui.toggle_panning_box:set_texture_rect(0, 24, 24, 24)
			end
		end
	end
end

local theme = {
	-- Offsets based upon MissionBriefingGui._panel:h()
	XOffset = 0,
	YOffset = -42,
	Colors = {
		ButtonDisabled = tweak_data.menu.default_disabled_text_color,
		ButtonNormal = tweak_data.screen_colors.button_stage_3,
		ButtonHover = tweak_data.screen_colors.button_stage_2
	},
	BlendMode = "add",
	ButtonBlendMode = "add",
	MoveProfileSelector = true
}

local function InitializeTheme()
	local TranslucentMissionBriefingGUI = _G.TranslucentMissionBriefingGUI
	if TranslucentMissionBriefingGUI == nil then
		return
	end

	local Holo = _G.Holo
	if Holo ~= nil then
		if type(Holo.ShouldModify) == "function" and Holo:ShouldModify("Menu", "Menu/Lobby") and type(Holo.GetColor) == "function" then
			-- Preferring 'Colors/Tab' over 'TextColors/Menu' for consistency with the rest of the mission briefing GUI
			theme.Colors.ButtonNormal = Holo:GetColor("Colors/Tab") or theme.Colors.ButtonNormal
			theme.Colors.ButtonHover = Holo:GetColor("Colors/TabHighlighted") or theme.Colors.ButtonHover
			theme.XOffset = 300
			theme.YOffset = -220
			-- Ensure that low-intensity colors such as black or very dark gray do not use the additive blending mode (or they
			-- will be invisible)
			local use_additive = false
			-- Disabled for now as additive blending causes colors to get tinted
--			local threshold = 0.15
--			local r, g, b = theme.Colors.ButtonNormal:unpack()
--			local use_additive = (r + g + b) >= threshold
--			if use_additive then
--				r, g, b = theme.Colors.ButtonHover:unpack()
--				use_additive = (r + g + b) >= threshold
--			end
			theme.ButtonBlendMode = use_additive and "add" or "normal"
			theme.MoveProfileSelector = false
		end
	elseif _G.PDTH_Menu ~= nil then
		-- Using Color.white instead of _G.PDTHMenu_color_normal for consistency with tabs and the heist details titles on the
		-- left panel
		theme.Colors.ButtonNormal = Color.white or theme.Colors.ButtonNormal
		theme.Colors.ButtonHover = _G.PDTHMenu_color_marker or theme.Colors.ButtonHover
		theme.ButtonBlendMode = "normal"
	end
end

-- This is necessary since MultiProfileManager:load_current() closes and opens a new instance of the mission briefing GUI each
-- time a profile change is made
local previous_background_visibility = nil

local x_offset = 41
local y_offset = 23

local next_poll = 0

-- Create new buttons to the left of the Ready button, but only when playing as a client
local init_actual = MissionBriefingGui.init
function MissionBriefingGui:init(...)
	init_actual(self, ...)

	InitializeTheme()

	if not Network:is_client() then
		-- Effectively disable polling
		next_poll = 99999999999999
		return
	end

	local basepanel = self._panel
	local basepanel_fullscreen_actual = self._fullscreen_panel
	if not alive(basepanel) then
		log("[TranslucentMissionBriefingGUI] MissionBriefingGui:init() | Error: basepanel is nil or invalid, aborting")
		return
	end
	if not alive(basepanel_fullscreen_actual) then
		log("[TranslucentMissionBriefingGUI] MissionBriefingGui:init() | Error: basepanel_fullscreen_actual is nil or invalid, aborting")
		return
	end
	if not alive(self._safe_workspace) then
		log("[TranslucentMissionBriefingGUI] MissionBriefingGui:init() | Error: self._safe_workspace is nil or invalid, aborting")
		return
	end
	local basepanel_fullscreen = basepanel_fullscreen_actual:panel({
		name = "tmbgui_basepanel_fullscreen",
		w = self._safe_workspace:panel():w() / 2
	})
	-- TODO: As much as I hate relying upon hardcoded magic numbers, managers.gui_data._saferect_data doesn't seem to work with
	-- non-720p resolutions so I can't use it. Or I could merely be using it incorrectly...
	basepanel_fullscreen:set_h(674)
	basepanel_fullscreen:set_x(x_offset + 310 + theme.XOffset)
	basepanel_fullscreen:set_y(y_offset)

	-- This is necessary since switching inventory profiles causes the mission briefing GUI to be deleted and re-instantiated
	next_poll = 0
	local font = tweak_data.menu.pd2_small_font
	local fontsize = tweak_data.menu.pd2_small_font_size
	local disabledcolor = theme.Colors.ButtonDisabled
	local normalcolor = theme.Colors.ButtonNormal
	local blendmode = theme.BlendMode
	local buttonblendmode = theme.ButtonBlendMode
	local opaque = true
	-- Do not simplify this check since each of the three states (nil, true, false) has a different meaning
	if previous_background_visibility == false then
		opaque = false
	end

	self.context_buttons = {}
	self.context_buttons_states = {}
	self.context_buttons_callbacks = {}
	self.context_buttons_linked = {}

	local panel = basepanel_fullscreen:text({
		name = "toggle_context",
		text = opaque and "SHOW CONTEXT" or "HIDE CONTEXT",
		align = "left",
		vertical = "center",
		font_size = fontsize,
		font = font,
		color = opaque and disabledcolor or normalcolor,
		layer = 2,
		blend_mode = buttonblendmode
	})
	panel:set_text(managers.localization:to_upper_text(opaque and "TMBGUI_show_context" or "TMBGUI_hide_context"))
	local _, _, w, h = panel:text_rect()
	panel:set_size(w, h)
	panel:set_bottom(basepanel_fullscreen:h() + theme.YOffset)
	self.context_buttons_states.toggle_context = {
		enabled = not opaque,
		highlighted = false
	}
	self.context_buttons_callbacks.toggle_context = ToggleContextCallback
	self.context_buttons.toggle_context = panel

	panel = basepanel_fullscreen:text({
		name = "previous_character",
		text = utf8.char(57348),
		align = "left",
		vertical = "center",
		font_size = fontsize,
		font = font,
		color = opaque and disabledcolor or normalcolor,
		alpha = opaque and 0 or 1,
		layer = 2,
		blend_mode = buttonblendmode
	})
	_, _, w, h = panel:text_rect()
	panel:set_size(w, h)
	panel:set_top(self.context_buttons.toggle_context:bottom())
	if opaque then
		panel:hide()
	else
		panel:show()
	end
	self.context_buttons_states.previous_character = {
		enabled = not opaque,
		highlighted = false
	}
	self.context_buttons_callbacks.previous_character = PreviousCharacterCallback
	self.context_buttons.previous_character = panel

	panel = basepanel_fullscreen:text({
		name = "character_label",
		text = "CHARACTER",
		align = "left",
		vertical = "center",
		font_size = fontsize,
		font = font,
		color = disabledcolor,
		alpha = opaque and 0 or 1,
		layer = 2,
		blend_mode = blendmode
	})
	panel:set_text(managers.localization:to_upper_text("TMBGUI_character"))
	_, _, w, h = panel:text_rect()
	panel:set_size(w, h)
	panel:set_bottom(self.context_buttons.previous_character:bottom())
	panel:set_left(self.context_buttons.previous_character:right() + 5)
	if opaque then
		panel:hide()
	else
		panel:show()
	end
	self.character_label = panel

	panel = basepanel_fullscreen:text({
		name = "next_character",
		text = utf8.char(57349),
		align = "left",
		vertical = "center",
		font_size = fontsize,
		font = font,
		color = opaque and disabledcolor or normalcolor,
		alpha = opaque and 0 or 1,
		layer = 2,
		blend_mode = buttonblendmode
	})
	_, _, w, h = panel:text_rect()
	panel:set_size(w, h)
	panel:set_bottom(self.character_label:bottom())
	panel:set_left(self.character_label:right() + 5)
	if opaque then
		panel:hide()
	else
		panel:show()
	end
	self.context_buttons_states.next_character = {
		enabled = not opaque,
		highlighted = false
	}
	self.context_buttons_callbacks.next_character = NextCharacterCallback
	self.context_buttons.next_character = panel

	panel = basepanel_fullscreen:text({
		name = "toggle_panning",
		text = "VIEW PANNING",
		align = "left",
		vertical = "center",
		font_size = fontsize,
		font = font,
		color = opaque and disabledcolor or normalcolor,
		alpha = opaque and 0 or 1,
		layer = 2,
		blend_mode = buttonblendmode
	})
	panel:set_text(managers.localization:to_upper_text("TMBGUI_toggle_panning"))
	_, _, w, h = panel:text_rect()
	panel:set_size(w, h)
	panel:set_bottom(self.context_buttons.next_character:bottom())
	panel:set_left(self.context_buttons.next_character:right() + 20)
	if opaque then
		panel:hide()
	else
		panel:show()
	end
	self.context_buttons_states.toggle_panning = {
		enabled = not opaque,
		highlighted = false
	}
	self.context_buttons_callbacks.toggle_panning = TogglePanningCallback
	self.context_buttons_linked.toggle_panning = {}
	self.context_buttons.toggle_panning = panel

	panel = basepanel_fullscreen:bitmap({
		name = "toggle_panning_box",
		texture = "guis/textures/menu_tickbox",
		texture_rect = {
			0,
			24,
			24,
			24
		},
		color = opaque and disabledcolor or normalcolor,
		alpha = opaque and 0 or 1,
		layer = 2,
		blend_mode = buttonblendmode
	})
	panel:set_size(h, h)
	panel:set_bottom(self.context_buttons.toggle_panning:bottom())
	panel:set_left(self.context_buttons.toggle_panning:right() + 5)
	if opaque then
		panel:hide()
	else
		panel:show()
	end
	panel:set_center_y(self.context_buttons.toggle_panning:center_y() - 1)
	table.insert(self.context_buttons_linked.toggle_panning, panel)
	self.toggle_panning_box = panel

	panel = basepanel_fullscreen:text({
		name = "current_character_label",
		text = "CURRENTLY SPECTATING:",
		align = "left",
		vertical = "center",
		font_size = fontsize,
		font = font,
		color = disabledcolor,
		alpha = opaque and 0 or 1,
		layer = 2,
		blend_mode = blendmode
	})
	panel:set_text(managers.localization:to_upper_text("TMBGUI_current_character"))
	_, _, w, h = panel:text_rect()
	panel:set_size(w, h)
	panel:set_top(self.context_buttons.previous_character:bottom())
	if opaque then
		panel:hide()
	else
		panel:show()
	end
	self.current_character_label = panel

	panel = basepanel_fullscreen:text({
		name = "current_character_text",
		text = "Nobody",
		align = "left",
		vertical = "center",
		font_size = fontsize,
		font = font,
		color = disabledcolor,
		alpha = opaque and 0 or 1,
		layer = 2,
		-- This is intentionally set to normal
		blend_mode = "normal"
	})
	panel:set_text(managers.localization:text("TMBGUI_nobody"))
	_, _, w, h = panel:text_rect()
	panel:set_size(w, h)
	panel:set_bottom(self.current_character_label:bottom())
	panel:set_left(self.current_character_label:right() + 5)
	if opaque then
		panel:hide()
	else
		panel:show()
	end
	self.current_character_text = panel

	if theme.MoveProfileSelector then
		-- Move the profile selector upward so it doesn't look as out of place next to the buttons
		local profileselector = self._multi_profile_item
		if profileselector ~= nil then
			panel = profileselector:panel()
			if alive(panel) then
				panel:set_bottom(basepanel:h() - 35)
			end
		end
	end
end

local reveal_blocked = true
local head = Idstring("Head")
local update_actual = MissionBriefingGui.update
local update_hook = function(self, t, dt, ...)
	update_actual(self, t, dt, ...)

	if t > next_poll and Network:is_client() then
		if self.context_buttons == nil then
			-- Bleh, this mod's state is now fubar due to another mod with a lower priority value mirroring
			-- MissionBriefingGui:init() and not calling the original function. Not much point in continuing, disable future
			-- polls and abort here
			-- Unhook the function since whatever happens later is of no interest to this mod anyway (but only do so if no other
			-- mod has replaced the MissionBriefingGui.update function reference)
			if MissionBriefingGui.update == update_hook then
				MissionBriefingGui.update = update_actual
			end
			next_poll = 99999999999999
			return
		end

		local TranslucentMissionBriefingGUI = _G.TranslucentMissionBriefingGUI

		-- Only enable the buttons if the game's resources have been loaded and the host or any other players are already in-game
		if not managers.dyn_resource:is_file_streamer_idle() then
			-- But only for initial loads, not reloads initiated by MultiProfileManager:load_current()
			if previous_background_visibility == nil then
				-- Only poll twice a second, not every frame
				next_poll = t + 0.5
				return
			end
		end

		-- The scene isn't ready for viewing yet, wait until the go-ahead is given
		if reveal_blocked then
			-- Only poll twice a second, not every frame
			next_poll = t + 0.5
			return
		end

		local session = managers.network:session()
		local unit = nil
		local any_in_game = false
		for __, peer in pairs(session:peers() or {}) do
			unit = peer:unit()
			if alive(unit) and unit:movement():get_object(head) ~= nil then
				any_in_game = true
				break
			end
		end
		-- Nothing to spectate, bail out here and try again later
		if not any_in_game then
			next_poll = t + 0.5
			return
		end

		local abort = false
		for name, btn in pairs(self.context_buttons) do
			if not btn:alive() or abort then
				abort = true
				break
			end
			btn:set_color(theme.Colors.ButtonNormal)
			local linked_buttons = self.context_buttons_linked[name]
			if linked_buttons ~= nil then
				for __, btn2 in ipairs(linked_buttons) do
					if not btn2:alive() then
						abort = true
						break
					end
					btn2:set_color(theme.Colors.ButtonNormal)
				end
			end
			self.context_buttons_states[name].enabled = true
		end
		if abort then
			-- The button(s) is/are not in a valid state, abort here
			next_poll = 99999999999999
			return
		end
		if TranslucentMissionBriefingGUI ~= nil and TranslucentMissionBriefingGUI.Prefs.AutoHideBackground then
			if previous_background_visibility == nil then
				self.context_buttons_callbacks.toggle_context(self, self.context_buttons.toggle_context)
			elseif previous_background_visibility then
				TurnOpaque(self, self.context_buttons.toggle_context, true)
			else
				TurnTranslucent(self, self.context_buttons.toggle_context, true)
			end
		end
		previous_background_visibility = nil
		-- Enable the viewport (which starts disabled to prevent brief flashes of geometry just as the mission briefing GUI
		-- appears)
		local state = game_state_machine:current_state()
		if state.set_viewport_active and not state._viewport_active then
			state:set_viewport_active(true)
		end
		if any_in_game then
			-- Always default to following the host player (IngameWaitingForPlayersState will automatically switch to the next
			-- character if the host is in custody)
			unit = session:server_peer()
			if unit ~= nil then
				unit = unit:unit()
			end
			if alive(unit) and type(state._refresh_teammate_list) == "function" and state._spectator_data ~= nil then
				-- From IngameWaitingForRespawnState:cb_next_player()
				state:_refresh_teammate_list()
				state._spectator_data.watch_u_key = unit:key()
				UpdatePlayerText(self)
			end
		end
		-- Effectively disable polling
		next_poll = 99999999999999
	end
end
MissionBriefingGui.update = update_hook

-- This function only gets called on clients, and it is called twice - once from GroupAIStateBase:set_whisper_mode() and again
-- from MenuComponentManager:on_whisper_mode_changed() (both calls are actually initiated from the same CoreSetup:__load() call)
local on_whisper_mode_changed_actual = MissionBriefingGui.on_whisper_mode_changed
function MissionBriefingGui:on_whisper_mode_changed(...)
	-- This prevents showing the scene before certain map elements have the chance to execute or synchronize, which causes
	-- unsightly blank spots on the map or units popping up then vanishing, until this function gets called (after which things
	-- look normal again)
	reveal_blocked = false
	return on_whisper_mode_changed_actual(self, ...)
end

local mouse_pressed_actual = MissionBriefingGui.mouse_pressed
function MissionBriefingGui:mouse_pressed(button, x, y, ...)
	-- Left-clicking or right-clicking anywhere (except the chat entry box) ends view panning since it is impossible to move the
	-- cursor back to the tickbox without messing the view up again
	if button == Idstring("0") or button == Idstring("1") then
		local state = game_state_machine:current_state()
		if state._controller ~= nil and state._controller:enabled() then
			managers.menu_component:post_event("menu_exit")
			self.context_buttons_callbacks.toggle_panning(self, self.context_buttons.toggle_panning)
			return
		end
	end

	local abort = false
	if button == Idstring("0") and TranslucentMissionBriefingGUI ~= nil and self.context_buttons ~= nil then
		local x_offsetted = x + x_offset
		local y_offsetted = y + y_offset
		for name, btn in pairs(self.context_buttons) do
			if not btn:alive() then
				-- The button(s) is/are not in a valid state, abort
				abort = true
				break
			end
			if btn:visible() and self.context_buttons_states[name].enabled then
				if btn:inside(x_offsetted, y_offsetted) then
					managers.menu_component:post_event("menu_enter")
					self.context_buttons_callbacks[name](self, btn)
					return
				else
					local linked_buttons = self.context_buttons_linked[name]
					if linked_buttons ~= nil then
						for __, btn2 in ipairs(linked_buttons) do
							if not btn2:alive() then
								-- Break out of the inner loop only
								break
							end
							if btn2:inside(x_offsetted, y_offsetted) then
								managers.menu_component:post_event("menu_enter")
								self.context_buttons_callbacks[name](self, btn)
								return
							end
						end
					end
				end
			end
		end
	end

	return mouse_pressed_actual(self, button, x, y, ...)
end

local btn_inside = false
-- Note: This function must not mutate statetable as doing so will cause statetable.highlighted to flip-flop between true / false
-- repeatedly for linked buttons (since they all share the same state table, but only one of them can be hovered upon at a given
-- point in time)
local function EvaluateHover(btn, x, y, statetable)
	btn_inside = btn:inside(x, y)
	if btn:visible() and btn_inside and statetable.enabled then
		if not statetable.highlighted then
			managers.menu_component:post_event("highlight")
			btn:set_color(theme.Colors.ButtonHover)
		end
		return true
	end
	if not btn_inside then
		if statetable.enabled then
			btn:set_color(theme.Colors.ButtonNormal)
		else
			btn:set_color(theme.Colors.ButtonDisabled)
		end
	end
	return false
end

local mouse_moved_actual = MissionBriefingGui.mouse_moved
function MissionBriefingGui:mouse_moved(x, y, ...)
	-- Block all hover events while view panning mode is active
	local game_state = game_state_machine:current_state()
	if game_state._controller ~= nil and game_state._controller:enabled() then
		return false, "arrow"
	end

	if TranslucentMissionBriefingGUI ~= nil and self.context_buttons ~= nil then
		local x_offsetted = x + x_offset
		local y_offsetted = y + y_offset
		local button_state = nil
		local result = nil
		local linked_buttons = nil
		for name, btn in pairs(self.context_buttons) do
			if not btn:alive() then
				-- The button(s) is/are not in a valid state, abort here
				break
			end
			button_state = self.context_buttons_states[name]
			result = EvaluateHover(btn, x_offsetted, y_offsetted, button_state)
			linked_buttons = self.context_buttons_linked[name]
			if linked_buttons ~= nil then
				if result then
					for __, btn2 in ipairs(linked_buttons) do
						btn2:set_color(theme.Colors.ButtonHover)
					end
				else
					local subresult = nil
					for __, btn2 in ipairs(linked_buttons) do
						subresult = EvaluateHover(btn2, x_offsetted, y_offsetted, button_state)
						if subresult then
							-- Propagate the hover color change to both the parent button and all linked buttons
							btn:set_color(theme.Colors.ButtonHover)
							for __, btn3 in ipairs(linked_buttons) do
								btn3:set_color(theme.Colors.ButtonHover)
							end
							result = subresult
							break
						end
					end
				end
			end
			button_state.highlighted = result
			if result then
				return result, "link"
			end
		end
	end

	return mouse_moved_actual(self, x, y, ...)
end

local close_actual = MissionBriefingGui.close
function MissionBriefingGui:close(...)
	close_actual(self, ...)

	-- Determine if the call was made from MultiProfileManager:load_current()
	local calledfromload_current = false
	local info = nil
	local level = 2
	repeat
		-- This is performed within a loop since a different mod storing the original function reference in a differently named
		-- variable (as is typical for mods to hook / wrap existing functions) would cause the check to fail if it were hardcoded
		-- to use a specific depth
		info = debug.getinfo(level, "n")
		if info ~= nil and info.name == "load_current" then
			calledfromload_current = true
			break
		end
		level = level + 1
	until info == nil

	if calledfromload_current then
		-- Save visibility state so it can be restored again in the MissionBriefingGui:init() hook
		previous_background_visibility = TranslucentMissionBriefingGUI.BackgroundVisible
	end
end

if not SGO or not SGO.settings.use_hold then return end
if SystemFS:exists("mods/WolfHUD/mod.txt") or SystemFS:exists("mods/WolfHUD-master/mod.txt") or SystemFS:exists("mods/PocoHud3/mod.txt") or SystemFS:exists("mods/SydneyHUD/mod.txt") or SystemFS:exists("mods/PDTH Hud/mod.txt") or SystemFS:exists("mods/MUI/mod.txt") then return end
if RequiredScript == "lib/units/beings/player/states/playerstandard" then

	PlayerStandard.MIN_TIMER_DURATION = 0 --Min interaction duration (in seconds) for the toggle behavior to activate
	PlayerStandard.EQUIPMENT_PRESS_INTERRUPT = true --Use the equipment key ('G') to toggle off active interactions

	local _update_interaction_timers_original = PlayerStandard._update_interaction_timers
	local _check_action_interact_original = PlayerStandard._check_action_interact
	
	function PlayerStandard:_update_interaction_timers(t, ...)
		self:_check_interaction_locked(t)
		return _update_interaction_timers_original(self, t, ...)
	end
	
	function PlayerStandard:_check_action_interact(t, input, ...)
		local obj = managers.interaction:active_unit()
		local use_default = alive(obj) and obj:interaction().tweak_data == "sentry_gun"

		if use_default or not self:_check_interact_toggle(t, input) then
			return _check_action_interact_original(self, t, input, ...)
		end
	end
	
	
	function PlayerStandard:_check_interaction_locked(t)
		local is_locked = self._interact_expire_t and (t - (self._interact_expire_t - self._interact_params.timer) >= PlayerStandard.MIN_TIMER_DURATION)
		
		if self._interaction_locked ~= is_locked then
			local obj = managers.interaction:active_unit()
			if alive(obj) and obj:interaction().tweak_data ~= "sentry_gun" then 
				managers.hud:set_interaction_bar_locked(is_locked)
			end
			self._interaction_locked = is_locked
		end
	end
	
	function PlayerStandard:_check_interact_toggle(t, input)
		local interrupt_key_press = input.btn_interact_press
		if PlayerStandard.EQUIPMENT_PRESS_INTERRUPT then
			interrupt_key_press = input.btn_use_item_press
		end
		
		if interrupt_key_press and self:_interacting() then
			self:_interupt_action_interact()
			return true
		elseif input.btn_interact_release and self._interact_params then
			if self._interaction_locked then
				return true
			end
		end
	end

elseif RequiredScript == "lib/units/beings/player/states/playercivilian" then

	local _update_interaction_timers_original = PlayerCivilian._update_interaction_timers
	local _check_action_interact_original = PlayerCivilian._check_action_interact
	
	function PlayerCivilian:_update_interaction_timers(t, ...)
		self:_check_interaction_locked(t)
		return _update_interaction_timers_original(self, t, ...)
	end
	
	function PlayerCivilian:_check_action_interact(t, input, ...)
		if not self:_check_interact_toggle(t, input) then
			return _check_action_interact_original(self, t, input, ...)
		end
	end
	
elseif RequiredScript == "lib/managers/hudmanagerpd2" then

	function HUDManager:set_interaction_bar_locked(status)
		self._hud_interaction:set_locked(status)
	end
	
elseif RequiredScript == "lib/managers/hud/hudinteraction" then

	local show_interaction_bar_original = HUDInteraction.show_interaction_bar
	local hide_interaction_bar_original = HUDInteraction.hide_interaction_bar

	function HUDInteraction:show_interaction_bar(...)
		if self._interact_circle_locked then
			self._interact_circle_locked:remove()
			self._interact_circle_locked = nil
		end
		self._interact_circle_locked = CircleBitmapGuiObject:new(self._hud_panel, {
			radius = self._circle_radius,
			color = Color.red,
			blend_mode = "normal",
			alpha = 0,
		})
		self._interact_circle_locked:set_position(self._hud_panel:w() / 2 - self._circle_radius, self._hud_panel:h() / 2 - self._circle_radius)
		self._interact_circle_locked._circle:set_render_template(Idstring("Text"))
		
		return show_interaction_bar_original(self, ...)
	end

	function HUDInteraction:hide_interaction_bar(...)		
		if self._interact_circle_locked then
			self._interact_circle_locked:remove()
			self._interact_circle_locked = nil
		end
		
		return hide_interaction_bar_original(self, ...)
	end

	function HUDInteraction:set_locked(status)
		if self._interact_circle_locked then
			self._interact_circle_locked._circle:set_color(status and Color.green or Color.red)
			self._interact_circle_locked._circle:set_alpha(0.25)
		end
	end
	
end
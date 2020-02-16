-- CREDIT TO: SEVEN

-- SOURCE THREAD: http://steamcommunity.com/app/218620/discussions/15/620703493329500794/

-- SOURCE COMMENT: http://steamcommunity.com/app/218620/discussions/15/620703493329500794/#c620703493330362452

local AUTO_PICK = function() return BWROptions._data.autocard end

local SKIP_BLACKSCREEN = function() return BWROptions._data.skipscreen end
local SKIP_BLACKSCREEN_STAT = function() return BWROptions._data.skipscreen_stats end
local SKIP_BLACKSCREEN_LOOT = function() return BWROptions._data.skipscreen_loot end

local SKIP_STAT_SCREEN_DELAY = function() return BWROptions._data.stats_delay end
local SKIP_LOOT_SCREEN_DELAY = function() return BWROptions._data.loot_delay end

if RequiredScript == "lib/managers/menu/stageendscreengui" then

	local update_original = StageEndScreenGui.update

	function StageEndScreenGui:update(t, ...)
		update_original(self, t, ...)
		if not self._button_not_clickable and SKIP_BLACKSCREEN_STAT() then
			if SKIP_STAT_SCREEN_DELAY() >= 0 then
				self._auto_continue_t = self._auto_continue_t or (t + SKIP_STAT_SCREEN_DELAY())
				if t >= self._auto_continue_t then
					managers.menu_component:post_event("menu_enter")
					game_state_machine:current_state()._continue_cb()
				end
			end
		end
	end

elseif RequiredScript == "lib/managers/menu/lootdropscreengui" then

	local update_original = LootDropScreenGui.update

	function LootDropScreenGui:update(t, ...)
		update_original(self, t, ...)

		if not self._card_chosen and AUTO_PICK() then
			self:_set_selected_and_sync(math.random(3))
			self:confirm_pressed()
		end
		
		if not self._button_not_clickable and SKIP_BLACKSCREEN_LOOT() then
			if SKIP_LOOT_SCREEN_DELAY() >= 0 then
				self._auto_continue_t = self._auto_continue_t or (t + SKIP_LOOT_SCREEN_DELAY())
				if t >= self._auto_continue_t then
					self:continue_to_lobby()
				end
			end
		end
	end

elseif RequiredScript == "lib/states/ingamewaitingforplayers" then

	local update_original = IngameWaitingForPlayersState.update
	
	function IngameWaitingForPlayersState:update(...)
		update_original(self, ...)
		
		if self._skip_promt_shown and SKIP_BLACKSCREEN() then
			self:_skip()
		end
	end
	
end
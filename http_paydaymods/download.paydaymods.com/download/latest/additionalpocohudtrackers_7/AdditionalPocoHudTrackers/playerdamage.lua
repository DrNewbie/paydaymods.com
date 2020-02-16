
if AdditionalPocoHudTrackers_PlayerDamage_Hooked then
	return
else
	AdditionalPocoHudTrackers_PlayerDamage_Hooked = true
end

--/////////////////--
--//  Anarchist  //--
--/////////////////--

-- This is necessary because of the incredibly awkward way OVK implemented this skill. It does not begin ticking until the very
-- first time the player takes damage, after which it ticks forever - even when the player's armor is already at its maximum
-- It does, however, get paused when the player is in bleedout, and is resumed the first time they take damage after they are
-- revived (and not immediately upon revive)
local _on_damage_armor_grinding_actual = PlayerDamage._on_damage_armor_grinding
function PlayerDamage:_on_damage_armor_grinding(...)
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	local PocoHud3 = _G.PocoHud3
	local pocohud_valid = type(PocoHud3) == "table"
	local should_show = nil
	if AdditionalPocoHudTrackers.Prefs.ShowAnarchistRegenTick then
		should_show = self._current_state == nil or self._current_state ~= self._update_armor_grinding
		if should_show == false and not AdditionalPocoHudTrackers.Prefs.ShowPersistentAnarchistRegenTick and pocohud_valid then
			-- Do not add the buff again if it is already visible (otherwise it will flicker)
			local buff = PocoHud3.buffs.AnarchistRegenTick
			if not buff or buff.dying then
				should_show = self:get_real_armor() < self:_max_armor()
			end
		end
	end
	_on_damage_armor_grinding_actual(self, ...)

	if should_show and self._current_state == self._update_armor_grinding and AdditionalPocoHudTrackers ~= nil and PocoHud3Class ~= nil and pocohud_valid then
		if not AdditionalPocoHudTrackers.Prefs.ShowAnarchistRegenTick then
			return
		end

		-- Getting downed or entering swan song pauses the timer, getting revived resumes the timer (as opposed to resetting it)
		local playertime = managers.player:player_timer():time()
		AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
			key = "AnarchistRegenTick",
			good = true,
			icon = AdditionalPocoHudTrackers.AnarchistDeckIcons,
			iconRect = {0, 0, 64, 64},
			text = tostring(AdditionalPocoHudTrackers.TrackerNames.AnarchistRegenTick),
			st = playertime - self._armor_grinding.elapsed,
			et = playertime + (self._armor_grinding.target_tick - self._armor_grinding.elapsed)
		})
	end
end

local _remove_on_damage_event_actual = PlayerDamage._remove_on_damage_event
function PlayerDamage:_remove_on_damage_event(...)
	_remove_on_damage_event_actual(self, ...)

	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	if not AdditionalPocoHudTrackers.Prefs.ShowAnarchistRegenTick then
		return
	end

	-- Getting downed or entering swan song pauses the timer, reflect this
	local PocoHud3 = _G.PocoHud3
	if type(PocoHud3) == "table" then
		PocoHud3:RemoveBuff("AnarchistRegenTick")
	end
end

local _update_armor_grinding_actual = PlayerDamage._update_armor_grinding

-- Forward declaration
local Checkless__update_armor_grinding = nil

-- Only perform the more expensive validity checks on the initial frame (since PlayerDamage:_update_armor_grinding() runs every
-- frame)
local function InitialCheck(self, t, dt, ...)
	if self._armor_grinding ~= nil and type(self._armor_grinding) == "table" and self._armor_grinding.elapsed ~= nil and self._armor_grinding.target_tick ~= nil then
		PlayerDamage._update_armor_grinding = Checkless__update_armor_grinding
		if self._current_state ~= InitialCheck then
			-- This can occur if other mods hook the same PlayerDamage:_update_armor_grinding() function
			log("[AdditionalPocoHudTrackers] InitialCheck() | Warning: Clobbering unidentified PlayerDamage._current_state reference with Checkless__update_armor_grinding, any affected mods might not function correctly after this")
		end
		self._current_state = Checkless__update_armor_grinding
		return Checkless__update_armor_grinding(self, t, dt, ...)
	else
		log("[AdditionalPocoHudTrackers] InitialCheck() | Warning: InitialCheck() failed, not tracking Anarchist's Lust for Life perk cooldown")
		PlayerDamage._update_armor_grinding = _update_armor_grinding_actual
		if self._current_state ~= InitialCheck then
			-- This can occur if other mods hook the same PlayerDamage:_update_armor_grinding() function
			log("[AdditionalPocoHudTrackers] InitialCheck() | Warning: Clobbering unidentified PlayerDamage._current_state reference with _update_armor_grinding_actual, any affected mods might not function correctly after this")
		end
		self._current_state = _update_armor_grinding_actual
		return _update_armor_grinding_actual(self, t, dt, ...)
	end
end
PlayerDamage._update_armor_grinding = InitialCheck

local armor_float_color = nil
Checkless__update_armor_grinding = function(self, t, dt, ...)
	local before = self:get_real_armor()
	_update_armor_grinding_actual(self, t, dt, ...)

	-- This can only occur once every several seconds so it doesn't need to be optimized as aggressively
	if self._armor_grinding.elapsed == 0 then
		local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
		local PocoHud3Class = _G.PocoHud3Class
		local PocoHud3 = _G.PocoHud3
		local UNDERSCORE = _G.UNDERSCORE
		if AdditionalPocoHudTrackers ~= nil and PocoHud3Class ~= nil and type(PocoHud3) == "table" and UNDERSCORE ~= nil then
			local after = self:get_real_armor()
			local delta = after - before
			if AdditionalPocoHudTrackers.Prefs.ShowAnarchistRegenTick and (delta > 0 or AdditionalPocoHudTrackers.Prefs.ShowPersistentAnarchistRegenTick) then
				local endtime = t + self._armor_grinding.target_tick
				-- Don't flicker
				local buff = PocoHud3.buffs.AnarchistRegenTick
				if buff and not buff.dying then
					buff.data.st = t
					buff.data.et = endtime
				end
				AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
					key = "AnarchistRegenTick",
					good = true,
					icon = AdditionalPocoHudTrackers.AnarchistDeckIcons,
					iconRect = {0, 0, 64, 64},
					text = tostring(AdditionalPocoHudTrackers.TrackerNames.AnarchistRegenTick),
					st = t,
					et = endtime
				})
			end

			if AdditionalPocoHudTrackers.Prefs.ShowAnarchistRegenGain then
				local option = PocoHud3Class.O:get("hit", "gainIndicator") or 0
				if PocoHud3Class.O:get("hit", "enable") and option > 1 then
					if delta > 0 then
						if option > 2 then
							managers.menu_component:post_event("menu_skill_investment")
						end
						armor_float_color = armor_float_color or PocoHud3Class.O:get("root", "colorPositive") or Color(0.6, 0.8, 0.2)
						PocoHud3:SimpleFloat({
							key = "armor",
							x = (PocoHud3.ww or 800) / 5 * 3,
							y = (PocoHud3.hh or 600) / 4 * 3,
							time = 3,
							anim = 1,
							offset = {
								0,
								-1 * (PocoHud3.hh or 600) / 2
							},
							text = {
								{
									'+',
									cl.White:with_alpha(0.6)
								},
								{
									UNDERSCORE.f(delta * 10),
									armor_float_color
								}
							},
							size = 18,
							rect = 0.5
						})
					end
				end
			end
		end
	end
end

local restore_armor_actual = PlayerDamage.restore_armor
function PlayerDamage:restore_armor(...)
	-- Disregarding validity checks present in the original function because the buff must appear even if no armor was actually
	-- restored (since the game itself doesn't care and forces a cooldown anyway, see the on_damage() closure in
	-- PlayerDamage:init())

	local playermanager = managers.player
	if playermanager:has_category_upgrade("player", "damage_to_armor") and self._damage_to_armor ~= nil then
		local now = Application:time()
		-- Yes, there is a chance that the time might have changed by the time this function gets called (especially on slow
		-- systems)
		if self._damage_to_armor.elapsed == now and AdditionalPocoHudTrackers ~= nil and PocoHud3Class ~= nil and type(PocoHud3) == "table" then
			if AdditionalPocoHudTrackers.Prefs.ShowAnarchistDmgCooldown then
				local playertime = playermanager:player_timer():time()
				AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
					key = "AnarchistDmgCooldown",
					good = false,
					icon = AdditionalPocoHudTrackers.AnarchistDeckIcons,
					iconRect = {0, 64, 64, 64},
					text = tostring(AdditionalPocoHudTrackers.TrackerNames.AnarchistDmgCooldown),
					st = playertime,
					et = playertime + self._damage_to_armor.target_tick
				})
			end
		end
	end

	return restore_armor_actual(self, ...)
end

--///////////////////////////--
--//  Armorer / Anarchist  //--
--///////////////////////////--

local _calc_armor_damage_actual = PlayerDamage._calc_armor_damage
function PlayerDamage:_calc_armor_damage(...)
	local previoustimer = self._can_take_dmg_timer

	local result = _calc_armor_damage_actual(self, ...)

	if self._can_take_dmg_timer > previoustimer and AdditionalPocoHudTrackers ~= nil and PocoHud3Class ~= nil and type(PocoHud3) == "table" then
		if not AdditionalPocoHudTrackers.Prefs.ShowArmorerInvuln then
			return result
		end

		local playertime = managers.player:player_timer():time()
		AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
			key = "ArmorerInvuln",
			good = true,
			icon = AdditionalPocoHudTrackers.DeckIcons,
			iconRect = {6 * 64, 64, 64, 64},
			text = tostring(AdditionalPocoHudTrackers.TrackerNames.ArmorerInvuln),
			st = playertime,
			et = playertime + self._can_take_dmg_timer
		})
	end

	return result
end

--//////////////////////////////--
--//  Muscle / Hostage Taker  //--
--//////////////////////////////--

local hostage_taker_icon_rect = {2 * 64, 10 * 64, 64, 64}
local muscle_icon_rect = {4 * 64, 64, 64, 64}

local _upd_health_regen_actual = PlayerDamage._upd_health_regen
function PlayerDamage:_upd_health_regen(t, dt, ...)
	local previoustimer = self._health_regen_update_timer or 0

	_upd_health_regen_actual(self, t, dt, ...)

	if not self._health_regen_update_timer or self._health_regen_update_timer <= previoustimer then
		return
	end

	-- Avoiding recurring global lookups since this function runs every frame
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	local PocoHud3Class = _G.PocoHud3Class
	local PocoHud3 = _G.PocoHud3

	if AdditionalPocoHudTrackers ~= nil and PocoHud3Class ~= nil and type(PocoHud3) == "table" then
		if not AdditionalPocoHudTrackers.Prefs.ShowHosTakerMuscleRegen then
			return
		end

		local playermanager = managers.player
		-- Yes, PlayerManager:health_regen() appears to be a rather expensive function to call, but the saving grace here is
		-- that this code only runs when self._health_regen_update_timer reaches 0, which is at most once every few seconds
		if playermanager:health_regen() <= 0 then
			-- OVK changed the function in U135 to no longer check that PlayerManager:health_regen() returns > 0, no idea
			-- exactly why they decided to make that change, but the end result is that self._health_regen_update_timer now
			-- continually ticks after the player takes health damage for the first time (similar to Anarchist) for as long
			-- as their health is not full. If the Frenzy skill is active, this means that the ticking is perpetual since
			-- they effectively take health damage immediately upon spawning, and can never heal back up to 100% (note that
			-- this behavior has not changed in U135)
			return
		end

		-- Determine which icon to use. This is fine to do here since this code only runs once every few seconds (thanks to the
		-- above checks)
		local icon, iconRect
		local hostage_taker = playermanager:has_category_upgrade("player", "hostage_health_regen_addend")
		if hostage_taker then
			-- Sure the player has the skill, but are there actually any hostages around to provide that regen benefit?
			local state = managers.groupai ~= nil and managers.groupai:state()
			hostage_taker = ((state ~= nil and state:hostage_count() or 0) + (playermanager:num_local_minions() or 0) > 0)
		end
		if hostage_taker then
			icon = AdditionalPocoHudTrackers.SkillIcons
			iconRect = hostage_taker_icon_rect
		else
			icon = AdditionalPocoHudTrackers.DeckIcons
			iconRect = muscle_icon_rect
		end

		local endtime = t + self._health_regen_update_timer
		-- Don't flicker
		local buff = PocoHud3.buffs.HosTakerMuscleRegen
		if buff and not buff.dying and buff.data.icon == icon then
			buff.data.st = t
			buff.data.et = endtime
		end
		AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
			key = "HosTakerMuscleRegen",
			good = true,
			icon = icon,
			iconRect = iconRect,
			text = tostring(AdditionalPocoHudTrackers.TrackerNames.HosTakerMuscleRegen),
			st = t,
			et = endtime
		})
	end
end

--///////////////--
--//  Grinder  //--
--///////////////--

local add_damage_to_hot_actual = PlayerDamage.add_damage_to_hot
function PlayerDamage:add_damage_to_hot(...)
	if self:got_max_doh_stacks() or self:need_revive() or self:dead() or self._check_berserker_done then
		return add_damage_to_hot_actual(self, ...)
	end

	add_damage_to_hot_actual(self, ...)

	if AdditionalPocoHudTrackers ~= nil and PocoHud3Class ~= nil and type(PocoHud3) == "table" then
		if not AdditionalPocoHudTrackers.Prefs.ShowGrinderRegenPeriod then
			return
		end

		local stack = self._damage_to_hot_stack
		local last_entry = #stack
		if last_entry < 1 then
			return
		end
		last_entry = stack[last_entry]
		local duration = last_entry.ticks_left * (self._doh_data.tick_time or 1)

		local playertime = managers.player:player_timer():time()
		local buff = PocoHud3.buffs.GrinderRegenPeriod
		if not buff or buff.dying then
			AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
				key = "GrinderRegenPeriod",
				good = true,
				icon = AdditionalPocoHudTrackers.DeckIcons,
				iconRect = {5 * 64, 6 * 64, 64, 64},
				text = tostring(AdditionalPocoHudTrackers.TrackerNames.GrinderRegenPeriod),
				st = playertime,
				et = playertime + last_entry.ticks_left * (self._doh_data.tick_time or 1)
			})
		else
			-- Don't re-create the buff since it already exists, just extend it
			buff.data.st = playertime
			buff.data.et = playertime + last_entry.ticks_left * (self._doh_data.tick_time or 1)
		end
	end
end

--/////////////////--
--//  Dire Need  //--
--/////////////////--

-- Why poll for the regeneration event instead of simply hooking PlayerDamage:set_armor() or PlayerDamage:_regenerate_armor()?
-- Because that's apparently how OVK implemented it, even when the latter is obviously easier to implement (and is much more
-- accurate, too - OVK's implementation as at U100 does not handle armor re-depleting within the 6 second extension when aced,
-- perhaps this is by design for balance reasons?). However, there is an advantage to OVK's approach in that it permits Dire Need
-- to kick in even when the player is downed (but not incapacitated), since armor does not regenerate in that state
local next_dire_need_poll = 0

local update_actual = PlayerDamage.update
function PlayerDamage:update(unit, t, dt, ...)
	update_actual(self, unit, t, dt, ...)

	if t >= next_dire_need_poll and self._dire_need then
		local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
		local PocoHud3Class = _G.PocoHud3Class
		local PocoHud3 = _G.PocoHud3

		if AdditionalPocoHudTrackers == nil or PocoHud3Class == nil or type(PocoHud3) ~= "table" then
			return
		end

		if AdditionalPocoHudTrackers.Prefs.ShowDireNeedDuration then
			local buff = PocoHud3.buffs.DireNeedDuration
			if buff and not buff.dying then
				if not self:is_regenerating_armor() then
					local extension = managers.player:upgrade_value("player", "armor_depleted_stagger_shot", 0)
					if extension > 0 and not AdditionalPocoHudTrackers.DireNeedTimerInitiated then
						extension = t + extension
						AdditionalPocoHudTrackers.DireNeedTimerInitiated = true
						-- HACK: OCD cure - don't you dare blink back defiantly at me, sonny!
						buff.data.st = t
						buff.data.et = extension
						AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
							key = "DireNeedDuration",
							good = true,
							icon = AdditionalPocoHudTrackers.U100SkillIcons,
							iconRect = {(10 * 80) + 8, (8 * 80) + 8, 64, 64},
							text = tostring(AdditionalPocoHudTrackers.TrackerNames.DireNeedDuration),
							st = t,
							et = extension
						})
					end
				end
			end
		end

		-- Poll 4 times every second. This is far less precise than the actual coroutine that implements the Dire Need skill, but
		-- it seems to provide reasonably accurate timers (polling every frame just for this buff timer feels really wasteful)
		next_dire_need_poll = t + (AdditionalPocoHudTrackers.DireNeedResolution_Actual or 0.25)
	end
end

--///////////////////--
--//  Uppers Aced  //--
--///////////////////--

local _check_bleed_out_actual = PlayerDamage._check_bleed_out
function PlayerDamage:_check_bleed_out(...)
	local previous = self._uppers_elapsed
	_check_bleed_out_actual(self, ...)

	if previous < self._uppers_elapsed then
		local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
		local PocoHud3Class = _G.PocoHud3Class
		local PocoHud3 = _G.PocoHud3

		if AdditionalPocoHudTrackers == nil or PocoHud3Class == nil or type(PocoHud3) ~= "table" then
			return
		end

		if not AdditionalPocoHudTrackers.Prefs.ShowUppersCooldown then
			return
		end

		local playertime = managers.player:player_timer():time()

		AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
			key = "UppersCooldown",
			good = false,
			icon = AdditionalPocoHudTrackers.U100SkillIcons,
			iconRect = {(2 * 80) + 10, (11 * 80) + 8, 64, 64},
			text = tostring(AdditionalPocoHudTrackers.TrackerNames.UppersCooldown),
			st = playertime,
			et = playertime + (self._UPPERS_COOLDOWN or 20)
		})
		-- It is possible to ping AdditionalPocoHudTrackers_PollUppersRange instead, but this method is much simpler (and a bit
		-- less expensive) since no extra poll is incurred (after all, it will tick again soon after this)
		PocoHud3:RemoveBuff("UppersRangeGauge")
	end
end

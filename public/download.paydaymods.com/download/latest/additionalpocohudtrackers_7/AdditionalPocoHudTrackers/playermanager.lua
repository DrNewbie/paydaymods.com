
if AdditionalPocoHudTrackers_PlayerManager_Hooked then
	return
else
	AdditionalPocoHudTrackers_PlayerManager_Hooked = true
end

--///////////////////////--
--//  Ammo Efficiency  //--
--///////////////////////--

local ammo_efficiency_color = nil
local ammo_efficiency_text_tbl = {{}, {}}
local ammo_efficiency_counter = 0

local function ResetAmmoEfficiencyStack()
	ammo_efficiency_counter = 0

	local PocoHud3 = _G.PocoHud3
	if type(PocoHud3) == "table" then
		PocoHud3:RemoveBuff("AmmoEfficiencyStack")
	end
end

--//////////////////////////////////--
--//  Bullseye / Ammo Efficiency  //--
--//////////////////////////////////--

local on_headshot_dealt_actual = PlayerManager.on_headshot_dealt
function PlayerManager:on_headshot_dealt(...)
	local previouscooldown = self._on_headshot_dealt_t or 0
	local isgametracking = self._coroutine_mgr:is_running("ammo_efficiency")

	on_headshot_dealt_actual(self, ...)

	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	local PocoHud3Class = _G.PocoHud3Class
	local PocoHud3 = _G.PocoHud3

	if AdditionalPocoHudTrackers == nil or PocoHud3Class == nil or type(PocoHud3) ~= "table" then
		return
	end

	-- Need to do some additional gymnastics here because there apparently exists a skew between Application:time() and
	-- PlayerManager:player_timer():time(). Not basing the buff timer on the latter causes the timer to seem to expire
	-- prematurely (i.e. expiring even when the game's cooldown is still in effect), which defeats its very purpose as a timer
	local playertime = self:player_timer():time()

	if self:has_category_upgrade("player", "headshot_regen_armor_bonus") then
		if AdditionalPocoHudTrackers.Prefs.ShowBullseyeCooldown then
			local t = Application:time()
			if t >= previouscooldown then
				AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
					key = "Bullseye",
					good = false,
					icon = AdditionalPocoHudTrackers.SkillIcons,
					iconRect = {6 * 64, 11 * 64, 64, 64},
					text = "",
					st = playertime,
					et = playertime + (self._on_headshot_dealt_t - t)
				})
			end
		end
	end

	-- Derived from PlayerManager:_on_enter_ammo_efficiency_event()
	if self._ammo_efficiency ~= nil then
		local showduration = AdditionalPocoHudTrackers.Prefs.ShowAmmoEfficiencyDuration
		local showstack = AdditionalPocoHudTrackers.Prefs.ShowAmmoEfficiencyStack
		if showduration or showstack then
			local weaponunit = self:equipped_weapon_unit()
			if weaponunit then
				local weaponunitbase = weaponunit:base()
				if weaponunitbase and weaponunitbase:fire_mode() == "single" and weaponunitbase:is_category("smg", "assault_rifle", "snp") then
					ammo_efficiency_counter = (ammo_efficiency_counter or 0) + 1

					if showduration then
						-- Only issue this if it is not already active (since the skill requires multiple hits)
--						local buff = PocoHud3.buffs.AmmoEfficiencyDuration
--						if not buff then
						if not isgametracking then
							AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
								key = "AmmoEfficiencyDuration",
								good = true,
								icon = AdditionalPocoHudTrackers.U100SkillIcons,
								iconRect = {(8 * 80) + 8, (4 * 80) + 12, 64, 64},
								text = tostring(AdditionalPocoHudTrackers.TrackerNames.AmmoEfficiencyDuration),
								st = playertime,
								et = playertime + (self._ammo_efficiency.time or 6)
							})
						end
					end

					if showstack then
						local style = PocoHud3Class.O:get("buff", "style")
						local text = nil
						-- The buff title must not be specified for the 'Vanilla' style when et is 1
						if style ~= 2 then
							ammo_efficiency_color = ammo_efficiency_color or PocoHud3Class.O:get("root", "colorPositive") or Color(0.6, 0.8, 0.2)
							-- Recycling tables to prevent memory wastage since this code runs frequently
							text = ammo_efficiency_text_tbl
							text[1][1] = tostring(AdditionalPocoHudTrackers.TrackerNames.AmmoEfficiencyStack)
							text[2][1] = string.format(" %s", tostring(ammo_efficiency_counter))
							text[2][2] = ammo_efficiency_color
						else
							text = tostring(ammo_efficiency_counter)
						end
						local maxheadshots = (self._ammo_efficiency.headshots or 3)
						local ratio = ammo_efficiency_counter / maxheadshots
						if ratio > 1 then
							-- Probably never, but just in case
							ratio = 1
						end
						AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
							key = "AmmoEfficiencyStack",
							good = true,
							icon = AdditionalPocoHudTrackers.U100SkillIcons,
							iconRect = {(8 * 80) + 8, (4 * 80) + 12, 64, 64},
							text = text,
							st = style == 2 and ratio or 1 - ratio,
							et = 1
						})
						-- Add only one delayed callback, not two or three
						if not isgametracking then
							DelayedCallsFix:Add("AdditionalPocoHudTrackers_ResetAmmoEfficiencyStack", (self._ammo_efficiency.time or 6), ResetAmmoEfficiencyStack)
						end
					end
				else
					PocoHud3:RemoveBuff("AmmoEfficiencyDuration")
					ResetAmmoEfficiencyStack()
				end
			end
		end
	end
end

--///////////////--
--//  Grinder  //--
--///////////////--

local _check_damage_to_hot_actual = PlayerManager._check_damage_to_hot
function PlayerManager:_check_damage_to_hot(t, unit, damage_info, ...)
	local previouscooldown = self._next_allowed_doh_t or 0

	_check_damage_to_hot_actual(self, t, unit, damage_info, ...)

	if not self._next_allowed_doh_t or not self:has_category_upgrade("player", "damage_to_hot") then
		return
	end

	-- Avoiding recurring global lookups since this function runs every frame
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	local PocoHud3Class = _G.PocoHud3Class
	local PocoHud3 = _G.PocoHud3

	if self._next_allowed_doh_t > previouscooldown and AdditionalPocoHudTrackers ~= nil and PocoHud3Class ~= nil and type(PocoHud3) == "table" then
		if not AdditionalPocoHudTrackers.Prefs.ShowGrinderStackCooldown then
			return
		end

		local playertime = self:player_timer():time()
		AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
			key = "GrinderStackCooldown",
			good = false,
			icon = AdditionalPocoHudTrackers.DeckIcons,
			iconRect = {5 * 64, 6 * 64, 64, 64},
			text = tostring(AdditionalPocoHudTrackers.TrackerNames.GrinderStackCooldown),
			st = playertime,
			et = playertime + (self._next_allowed_doh_t - t)
		})
	end
end

--//////////////////////////////////////////////////////////////////////////////////////////////////--
--//  Armorer / Aggressive Reload / Second Wind / Up You Go / Running From Death / Unseen Strike  //--
--//////////////////////////////////////////////////////////////////////////////////////////////////--

-- Forward declaration, the function body is defined in the Critical Hit Chance Gauge section below
local PollCriticalChance = nil

local activate_temporary_upgrade_actual = PlayerManager.activate_temporary_upgrade
function PlayerManager:activate_temporary_upgrade(category, upgrade, ...)
	local upgrade_value = self:upgrade_value(category, upgrade)
	if upgrade_value == 0 then
		return activate_temporary_upgrade_actual(self, category, upgrade, ...)
	end

	activate_temporary_upgrade_actual(self, category, upgrade, ...)

	if category ~= "temporary" then
		return
	end

	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	local PocoHud3Class = _G.PocoHud3Class
	local PocoHud3 = _G.PocoHud3

	if AdditionalPocoHudTrackers == nil or PocoHud3Class == nil or type(PocoHud3) ~= "table" then
		return
	end

	local playertime = self:player_timer():time()

	if upgrade == "armor_break_invulnerable" then
		if not AdditionalPocoHudTrackers.Prefs.ShowArmorerInvulnCooldown then
			return
		end

		AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
			key = "ArmorerInvulnCooldown",
			good = false,
			icon = AdditionalPocoHudTrackers.DeckIcons,
			iconRect = {6 * 64, 64, 64, 64},
			text = tostring(AdditionalPocoHudTrackers.TrackerNames.ArmorerInvulnCooldown),
			st = playertime,
			et = playertime + upgrade_value[2]
		})
	elseif upgrade == "single_shot_fast_reload" then
		if not AdditionalPocoHudTrackers.Prefs.ShowAggressiveReloadDuration then
			return
		end

		local buff = PocoHud3.buffs.AggressiveReloadDuration
		if not buff or buff.dying then
			AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
				key = "AggressiveReloadDuration",
				good = true,
				icon = AdditionalPocoHudTrackers.U100SkillIcons,
				iconRect = {(8 * 80) + 8, (3 * 80) + 8, 64, 64},
				text = tostring(AdditionalPocoHudTrackers.TrackerNames.AggressiveReloadDuration),
				st = playertime,
				et = playertime + upgrade_value[2]
			})
		else
			-- Don't re-create the buff since it already exists, just extend it
			buff.data.st = playertime
			buff.data.et = playertime + upgrade_value[2]
		end
	elseif upgrade == "damage_speed_multiplier" then
		if not AdditionalPocoHudTrackers.Prefs.ShowSecondWindDuration then
			return
		end

		-- Apparently the game keeps (re-)activating the upgrade upon suppression for as long as armor is depleted (see
		-- PlayerDamage:_on_damage_event(), PlayerDamage:_init_standard_listeners(), PlayerDamage:_add_on_damage_event() and
		-- PlayerDamage:_upd_suppression()). The result is that the buff goes missing until armor goes above 0 again because it
		-- is continually being deleted and re-created before it even has the chance to appear properly, which causes the strange
		-- looking result of a void buff among the list of active ones
		local buff = PocoHud3.buffs.SecondWindDuration
		if not buff or buff.dying then
			AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
				key = "SecondWindDuration",
				good = true,
				icon = AdditionalPocoHudTrackers.U100SkillIcons,
				iconRect = {(10 * 80) + 8, (9 * 80) + 8, 64, 64},
				text = tostring(AdditionalPocoHudTrackers.TrackerNames.SecondWindDuration),
				st = playertime,
				et = playertime + upgrade_value[2]
			})
		else
			-- Don't re-create the buff since it already exists, just extend it
			buff.data.st = playertime
			buff.data.et = playertime + upgrade_value[2]
		end
	elseif upgrade == "revived_damage_resist" then
		if not AdditionalPocoHudTrackers.Prefs.ShowUpYouGoDuration then
			return
		end

		AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
			key = "UpYouGoDuration",
			good = true,
			icon = AdditionalPocoHudTrackers.U100SkillIcons,
			iconRect = {(11 * 80) + 8, (4 * 80) + 8, 64, 64},
			text = tostring(AdditionalPocoHudTrackers.TrackerNames.UpYouGoDuration),
			st = playertime,
			et = playertime + upgrade_value[2]
		})
	elseif upgrade == "swap_weapon_faster" or upgrade == "reload_weapon_faster" then
		if not AdditionalPocoHudTrackers.Prefs.ShowRunningFromDeathWeaponDuration then
			return
		end

		AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
			key = "RunningFromDeathWeaponDuration",
			good = true,
			icon = AdditionalPocoHudTrackers.U100SkillIcons,
			iconRect = {(11 * 80) + 8, (3 * 80) + 8, 64, 64},
			text = tostring(AdditionalPocoHudTrackers.TrackerNames.RunningFromDeathWeaponDuration),
			st = playertime,
			et = playertime + upgrade_value[2]
		})
	elseif upgrade == "increased_movement_speed" then
		if not AdditionalPocoHudTrackers.Prefs.ShowRunningFromDeathMovementDuration then
			return
		end

		AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
			key = "RunningFromDeathMovementDuration",
			good = true,
			icon = AdditionalPocoHudTrackers.U100SkillIcons,
			iconRect = {(11 * 80) + 8, (3 * 80) + 8, 64, 64},
			text = tostring(AdditionalPocoHudTrackers.TrackerNames.RunningFromDeathMovementDuration),
			st = playertime,
			et = playertime + upgrade_value[2]
		})
	elseif upgrade == "unseen_strike" then
		PollCriticalChance()

		-- This is done to ensure the critical hit chance gauge updates timely to reflect the skill's expiry, instead of being
		-- late by a full second. + 0.05 delay because of the brain-dead use of coroutines to implement the skill when :update()
		-- functions exist. Congrats, OVK, you just proved that race conditions can occur within a single-threaded program, I
		-- sure hope you're utterly elated with what you've pulled off
		DelayedCallsFix:Add("AdditionalPocoHudTrackers_TriggerCritPoll", upgrade_value[2] + 0.05, PollCriticalChance)

		if not AdditionalPocoHudTrackers.Prefs.ShowUnseenStrikeCriticalBoostDuration then
			return
		end

		AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
			key = "UnseenStrikeCriticalBoostDuration",
			good = true,
			icon = AdditionalPocoHudTrackers.U100SkillIcons,
			iconRect = {(10 * 80) + 8, (11 * 80) + 8, 64, 64},
			text = tostring(AdditionalPocoHudTrackers.TrackerNames.UnseenStrikeCriticalBoostDuration),
			st = playertime,
			et = playertime + upgrade_value[2]
		})
	end
end

--///////////////////--
--//  Second Wind  //--
--///////////////////--

local activate_synced_temporary_team_upgrade_actual = PlayerManager.activate_synced_temporary_team_upgrade
function PlayerManager:activate_synced_temporary_team_upgrade(peer_id, category, upgrade, ...)
	activate_synced_temporary_team_upgrade_actual(self, peer_id, category, upgrade, ...)

	if category ~= "temporary" or upgrade ~= "team_damage_speed_multiplier_received" then
		return
	end

	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	local PocoHud3Class = _G.PocoHud3Class
	local PocoHud3 = _G.PocoHud3

	if AdditionalPocoHudTrackers == nil or PocoHud3Class == nil or type(PocoHud3) ~= "table" then
		return
	end

	if not AdditionalPocoHudTrackers.Prefs.ShowSecondWindDuration then
		return
	end

	local upgrade_value = self:upgrade_value(category, upgrade)
	if upgrade_value == 0 then
		-- Eh, even after the game's code has handled it? Still?!
		return
	end

	local playertime = self:player_timer():time()

	-- This gets called very frequently if the player who owns the skill is taking heavy suppressive fire. Read the explanation
	-- in PlayerManager:activate_temporary_upgrade() for the 'damage_speed_multiplier' upgrade
	local buff = PocoHud3.buffs.SecondWindDuration
	if not buff or buff.dying then
		AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
			key = "SecondWindDuration",
			good = true,
			icon = AdditionalPocoHudTrackers.U100SkillIcons,
			iconRect = {(10 * 80) + 8, (9 * 80) + 8, 64, 64},
			text = tostring(AdditionalPocoHudTrackers.TrackerNames.SecondWindDuration),
			st = playertime,
			et = playertime + upgrade_value[2]
		})
	else
		-- Don't re-create the buff since it already exists, just extend it
		buff.data.st = playertime
		buff.data.et = playertime + upgrade_value[2]
	end
end

--///////////////--
--//  Inspire  //--
--///////////////--

local disable_cooldown_upgrade_actual = PlayerManager.disable_cooldown_upgrade
function PlayerManager:disable_cooldown_upgrade(category, upgrade, ...)
	local upgrade_value = self:upgrade_value(category, upgrade)
	if upgrade_value == 0 then
		return disable_cooldown_upgrade_actual(self, category, upgrade, ...)
	end

	disable_cooldown_upgrade_actual(self, category, upgrade, ...)

	if category ~= "cooldown" or upgrade ~= "long_dis_revive" then
		return
	end

	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	local PocoHud3Class = _G.PocoHud3Class
	local PocoHud3 = _G.PocoHud3

	if AdditionalPocoHudTrackers == nil or PocoHud3Class == nil or type(PocoHud3) ~= "table" then
		return
	end

	if not AdditionalPocoHudTrackers.Prefs.ShowInspireReviveCooldown then
		return
	end

	local playertime = self:player_timer():time()

	AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
		key = "InspireReviveCooldown",
		good = false,
		icon = AdditionalPocoHudTrackers.U100SkillIcons,
		iconRect = {(4 * 80) + 8, (9 * 80) + 8, 64, 64},
		text = tostring(AdditionalPocoHudTrackers.TrackerNames.InspireReviveCooldown),
		st = playertime,
		et = playertime + upgrade_value[2]
	})
end

--//////////////--
--//  Maniac  //--
--//////////////--

local next_maniac_stack_poll = 0
local maniac_stack_color = nil
local maniac_stack_text_tbl = {{}, {}}

local _update_damage_dealt_actual = PlayerManager._update_damage_dealt
function PlayerManager:_update_damage_dealt(t, dt, ...)
	local previousstack = self._damage_dealt_to_cops_t or 0
	local previousdecay = self._damage_dealt_to_cops_decay_t or 0

	_update_damage_dealt_actual(self, t, dt, ...)

	if not self:has_category_upgrade("player", "cocaine_stacking") or self:local_player() == nil or self._damage_dealt_to_cops_t == nil or self._damage_dealt_to_cops_decay_t == nil then
		return
	end

	-- Avoiding recurring global lookups during this call since this function runs every frame
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	local PocoHud3Class = _G.PocoHud3Class
	local PocoHud3 = _G.PocoHud3
	local UNDERSCORE = _G.UNDERSCORE

	if AdditionalPocoHudTrackers == nil or PocoHud3Class == nil or type(PocoHud3) ~= "table" or UNDERSCORE == nil then
		return
	end

	-- t here is identical to the timestamp returned by PlayerManager:player_timer():time() so do not bother calling the latter

	if t >= previousstack and AdditionalPocoHudTrackers.Prefs.ShowManiacStackTicks then
		-- Don't flicker
		local buff = PocoHud3.buffs.ManiacStackTicks
		if buff and not buff.dying then
			buff.data.st = t
			buff.data.et = self._damage_dealt_to_cops_t
		end
		AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
			key = "ManiacStackTicks",
			good = true,
			icon = AdditionalPocoHudTrackers.ManiacDeckIcons,
			iconRect = {0, 0, 64, 64},
			text = tostring(AdditionalPocoHudTrackers.TrackerNames.ManiacStackTicks),
			st = t,
			et = self._damage_dealt_to_cops_t
		})
	end

	if t >= previousdecay and AdditionalPocoHudTrackers.Prefs.ShowManiacDecayTicks then
		-- Don't flicker
		local buff = PocoHud3.buffs.ManiacDecayTicks
		if buff and not buff.dying then
			buff.data.st = t
			buff.data.et = self._damage_dealt_to_cops_decay_t
		end
		AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
			key = "ManiacDecayTicks",
			good = false,
			icon = AdditionalPocoHudTrackers.ManiacDeckIcons,
			iconRect = {2 * 64, 0, 64, 64},
			text = tostring(AdditionalPocoHudTrackers.TrackerNames.ManiacDecayTicks),
			st = t,
			et = self._damage_dealt_to_cops_decay_t
		})
	end

	-- Poll accumulated hysteria stacks, but not every frame
	if t >= next_maniac_stack_poll and AdditionalPocoHudTrackers.Prefs.ShowManiacAccumulatedStacks then
		local newstacks = (self._damage_dealt_to_cops or 0) * (tweak_data.gui.stats_present_multiplier or 10) * self:upgrade_value("player", "cocaine_stacking", 0)
		local maxstacks = tweak_data.upgrades.max_cocaine_stacks_per_tick or 20
		if newstacks > maxstacks then
			newstacks = maxstacks
		end
		local ratio = newstacks / maxstacks
		local style = PocoHud3Class.O:get("buff", "style")
		local text = nil
		-- The buff title must not be specified for the 'Vanilla' style when et is 1
		if style ~= 2 then
			maniac_stack_color = maniac_stack_color or PocoHud3Class.O:get("root", "colorPositive") or Color(0.6, 0.8, 0.2)
			-- Recycling tables to prevent memory wastage since this code runs frequently
			text = maniac_stack_text_tbl
			text[1][1] = tostring(AdditionalPocoHudTrackers.TrackerNames.ManiacAccumulatedStacks)
			text[2][1] = string.format(" %s%%", tostring(UNDERSCORE.f(ratio * 100, 1)))
			text[2][2] = maniac_stack_color
		else
			text = string.format("%s%%", tostring(UNDERSCORE.f(ratio * 100, 1)))
		end
		if ratio > 0 then
			AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
				key = "ManiacAccumulatedStacks",
				good = true,
				icon = AdditionalPocoHudTrackers.ManiacDeckIcons,
				iconRect = {3 * 64, 0, 64, 64},
				text = text,
				st = style == 2 and ratio or 1 - ratio,
				et = 1
			})
		else
			PocoHud3:RemoveBuff("ManiacAccumulatedStacks")
		end
		next_maniac_stack_poll = t + (AdditionalPocoHudTrackers.ManiacAccumulatedStacksResolution_Actual or 0.5)
	end
end

--////////////////////////////////////////////////--
--//  Dire Need / Unseen Strike / Lock 'n Load  //--
--////////////////////////////////////////////////--

local dire_need_text_tbl = {{}, {}}

local send_message_actual = PlayerManager.send_message
function PlayerManager:send_message(message, uid, param1, param2, ...)
	send_message_actual(self, message, uid, param1, param2, ...)

	if self:local_player() == nil then
		return
	end

	local Message = _G.Message
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	local PocoHud3Class = _G.PocoHud3Class
	local PocoHud3 = _G.PocoHud3

	if AdditionalPocoHudTrackers == nil or PocoHud3Class == nil or type(PocoHud3) ~= "table" then
		return
	end

	-- Note: Message.OnEnemyKilled will /never/ be sent to this function; use PlayerManager:on_killshot() instead

	if message == Message.SetWeaponStagger then
		if not AdditionalPocoHudTrackers.Prefs.ShowDireNeedDuration or not self:has_category_upgrade("player", "armor_depleted_stagger_shot") then
			return
		end

		AdditionalPocoHudTrackers.DireNeedTimerInitiated = false
		if param1 then
			local style = PocoHud3Class.O:get("buff", "style")
			local text = nil
			-- The buff title must not be specified for the 'Vanilla' style when et is 1
			if style ~= 2 then
				-- Recycling tables to prevent memory wastage
				text = dire_need_text_tbl
				text[1][1] = tostring(AdditionalPocoHudTrackers.TrackerNames.DireNeedDuration)
				text[2][1] = ""
			else
				text = tostring(AdditionalPocoHudTrackers.TrackerNames.Active)
			end
			AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
				key = "DireNeedDuration",
				good = true,
				icon = AdditionalPocoHudTrackers.U100SkillIcons,
				iconRect = {(10 * 80) + 8, (8 * 80) + 8, 64, 64},
				text = text,
				st = style == 2 and 1 or 0,
				et = 1
			})
		else
			PocoHud3:RemoveBuff("DireNeedDuration")
		end
	elseif message == Message.OnPlayerDamage then
		if self._unseen_strike then
			PocoHud3:RemoveBuff("UnseenStrikeCriticalBoostDuration")

			-- FFS, STOP FUCKING IMPLEMENTING SKILLS ACTIVATION AND DEACTIVATION IN COROUTINES ALREADY, OVK. NO IT'S NOT FUNNY
			-- DAMMIT
			DelayedCallsFix:Add("AdditionalPocoHudTrackers_TriggerCritPoll", 0.05, PollCriticalChance)

			if AdditionalPocoHudTrackers.Prefs.ShowUnseenStrikeDamageAvoidanceDuration then
				local playertime = self:player_timer():time()

				-- Note: PlayerManager:upgrade_value() always returns a number, even if a nil fallback is specified (due to
				-- 'return default or 0')
				local data = self:upgrade_value("player", "unseen_increased_crit_chance", 0)
				if data == 0 then
					return
				end

				-- This gets called very frequently if the player is taking heavy fire, which causes the buff to flicker
				local buff = PocoHud3.buffs.UnseenStrikeDamageAvoidanceDuration
				if not buff or buff.dying then
					AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
						key = "UnseenStrikeDamageAvoidanceDuration",
						good = false,
						icon = AdditionalPocoHudTrackers.U100SkillIcons,
						iconRect = {(10 * 80) + 8, (11 * 80) + 8, 64, 64},
						text = tostring(AdditionalPocoHudTrackers.TrackerNames.UnseenStrikeDamageAvoidanceDuration),
						st = playertime,
						et = playertime + data.min_time
					})
				else
					-- Don't re-create the buff since it already exists, just extend it
					buff.data.st = playertime
					buff.data.et = playertime + data.min_time
				end

				-- Colorize the buff for the 'Vanilla' style since it does not permit any additional text to help distinguish the
				-- two distinct phases of the skill
				if PocoHud3Class.O:get("buff", "style") == 2 then
					local buff = PocoHud3.buffs.UnseenStrikeDamageAvoidanceDuration
					if buff then
						if not buff.created then
							buff:_make()
						end
						local color = PocoHud3Class.O:get("root", "colorNegative") or Color(1, 0.84, 0)
						if alive(buff.bmp) then
							buff.bmp:set_color(color)
						end
						if alive(buff.bg) then
							local children = buff.bg:children()
							if children ~= nil then
								for __, panel in ipairs(children) do
									if alive(panel) and panel.type_name == "Bitmap" then
										panel:set_color(color)
									end
								end
							end
						end
					end
				end
			end
		end
	elseif message == Message.OnSwitchWeapon then
		DelayedCallsFix:Remove("AdditionalPocoHudTrackers_TriggerLockAndLoadRepoll")
		PocoHud3:RemoveBuff("LockAndLoadReloadBoost")
	end
end

--////////////////////--
--//  Lock 'n Load  //--
--////////////////////--

local remove_property_actual = PlayerManager.remove_property
function PlayerManager:remove_property(name, ...)
	remove_property_actual(self, name, ...)

	if name == "shock_and_awe_reload_multiplier" and not self._coroutine_mgr:is_running("automatic_faster_reload") then
		DelayedCallsFix:Remove("AdditionalPocoHudTrackers_TriggerLockAndLoadRepoll")
		local PocoHud3 = _G.PocoHud3
		if type(PocoHud3) == "table" then
			PocoHud3:RemoveBuff("LockAndLoadReloadBoost")
		end
	end
end

--///////////////////--
--//  Bulletstorm  //--
--///////////////////--

local add_to_temporary_property_actual = PlayerManager.add_to_temporary_property
function PlayerManager:add_to_temporary_property(name, time, ...)
	add_to_temporary_property_actual(self, name, time, ...)

	if name == "bullet_storm" then
		local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
		local PocoHud3Class = _G.PocoHud3Class
		local PocoHud3 = _G.PocoHud3

		if AdditionalPocoHudTrackers == nil or PocoHud3Class == nil or type(PocoHud3) ~= "table" then
			return
		end

		if AdditionalPocoHudTrackers.Prefs.ShowBulletstormDuration then
			local playertime = self:player_timer():time()
			local text = PocoHud3Class.L:parse("_buff_bulletStormShort") or tostring(AdditionalPocoHudTrackers.TrackerNames.BulletstormDuration)

			local buff = PocoHud3.buffs.BulletstormDuration
			if not buff or buff.dying then
				AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
					key = "BulletstormDuration",
					good = true,
					icon = AdditionalPocoHudTrackers.U100SkillIcons,
					iconRect = {(4 * 80) + 8, (5 * 80) + 8, 64, 64},
					text = text,
					st = playertime,
					et = playertime + time
				})
			else
				-- Don't re-create the buff since it already exists, just extend it
				buff.data.st = playertime
				buff.data.et = playertime + time
			end
		end
	end
end

--//////////////////////////////////////////////--
--//  Bloodthirst / Sociopath / Lock 'n Load  //--
--//////////////////////////////////////////////--

local lockandload_boost_color = nil
local lockandload_boost_text_tbl = {{}, {}}

local function PollLockAndLoad()
	local game_state_machine = _G.game_state_machine
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	local PocoHud3Class = _G.PocoHud3Class
	local PocoHud3 = _G.PocoHud3
	local UNDERSCORE = _G.UNDERSCORE
	local playermanager = managers.player

	local gamestate = game_state_machine ~= nil and game_state_machine:current_state_name() or nil
	if not gamestate or gamestate == "menu_main" then
		return
	end

	if AdditionalPocoHudTrackers == nil or PocoHud3Class == nil or type(PocoHud3) ~= "table" or UNDERSCORE == nil or playermanager == nil then
		return
	end

	if not playermanager._coroutine_mgr:is_running("automatic_faster_reload") then
		return
	end

	if AdditionalPocoHudTrackers.Prefs.ShowLockAndLoadReloadBoost then
		-- Note: PlayerManager:upgrade_value() always returns a number, even if a nil fallback is specified (due to
		-- 'return default or 0')
		local data = playermanager:upgrade_value("player", "automatic_faster_reload", 0)
		if data ~= 0 then
			local weaponunit = playermanager:equipped_weapon_unit()
			if weaponunit then
				local weaponunitbase = weaponunit:base()
				if weaponunitbase then
					local max_reload_increase = data.max_reload_increase or 1.6
					local min_reload_increase = data.min_reload_increase or 1.2
					local min_bullets = data.min_bullets or 20
					local penalty = data.penalty or 0.99
					-- From PlayerAction.ShockAndAwe.Function()
					local reload_multiplier = max_reload_increase
					local ammo = weaponunitbase:get_ammo_remaining_in_clip()
					if playermanager:has_category_upgrade("player", "automatic_mag_increase") and weaponunitbase:is_category("smg", "assault_rifle", "lmg") then
						ammo = ammo - playermanager:upgrade_value("player", "automatic_mag_increase", 0)
					end
					if ammo > min_bullets then
						local num_bullets = ammo - min_bullets
						local math_max = math.max
						for i = 1, num_bullets do
							reload_multiplier = math_max(min_reload_increase, reload_multiplier * penalty)
						end
					end
					local ratio = (reload_multiplier - min_reload_increase) / (max_reload_increase - min_reload_increase)
					if ratio > 1 then
						ratio = 1
					end
					local style = PocoHud3Class.O:get("buff", "style")
					local text = nil
					-- The buff title must not be specified for the 'Vanilla' style when et is 1
					if style ~= 2 then
						lockandload_boost_color = lockandload_boost_color or PocoHud3Class.O:get("root", "colorPositive") or Color(0.6, 0.8, 0.2)
						-- Recycling tables to prevent memory wastage
						text = lockandload_boost_text_tbl
						text[1][1] = tostring(AdditionalPocoHudTrackers.TrackerNames.LockAndLoadReloadBoost)
						text[2][1] = string.format(" %sx", tostring(UNDERSCORE.f(reload_multiplier, 3)))
						text[2][2] = lockandload_boost_color
					else
						text = string.format("%sx", tostring(UNDERSCORE.f(reload_multiplier, 3)))
					end
					AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
						key = "LockAndLoadReloadBoost",
						good = true,
						icon = AdditionalPocoHudTrackers.U100SkillIcons,
						iconRect = {(10 * 80) + 8, 10, 64, 64},
						text = text,
						st = style == 2 and ratio or 1 - ratio,
						et = 1
					})
				end
			end
		end
		DelayedCallsFix:Add("AdditionalPocoHudTrackers_TriggerLockAndLoadRepoll", AdditionalPocoHudTrackers.LockAndLoadResolution_Actual or 0.25, PollLockAndLoad)
	end
end

function AdditionalPocoHudTrackers_TriggerLockAndLoadRepoll(...)
	PollLockAndLoad()
end

local bloodthirst_counter = 1
local bloodthirst_color = nil
local bloodthirst_text_tbl = {{}, {}}

local sociopath_tension_icon_rect = {0, 5 * 64, 64, 64}
local sociopath_cleanhit_icon_rect = {64, 5 * 64, 64, 64}
local sociopath_overdose_icon_rect = {2 * 64, 5 * 64, 64, 64}
local sociopath_showdown_icon_rect = {3 * 64, 5 * 64, 64, 64}

-- Remapping Overdose's icon to Tension's since the icon is very similar to the domination cooldown's icon and leads to confusion
sociopath_overdose_icon_rect = sociopath_tension_icon_rect

local close_combat_distance_sq = nil

local on_killshot_actual = PlayerManager.on_killshot
function PlayerManager:on_killshot(killed_unit, variant, headshot, ...)
	local playerunit = self:player_unit()
	if not playerunit or not killed_unit or CopDamage.is_civilian(killed_unit:base()._tweak_table) then
		return on_killshot_actual(self, killed_unit, variant, headshot, ...)
	end

	local isgametrackinglockandload_pre = self._coroutine_mgr:is_running("automatic_faster_reload")
	local previouskillshot = self._on_killshot_t
	local hasmaxarmor = playerunit:character_damage()
	hasmaxarmor = hasmaxarmor and hasmaxarmor:armor_ratio() >= 1

	on_killshot_actual(self, killed_unit, variant, headshot, ...)

	local isgametrackinglockandload_post = self._coroutine_mgr:is_running("automatic_faster_reload")

	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	local PocoHud3Class = _G.PocoHud3Class
	local PocoHud3 = _G.PocoHud3
	local UNDERSCORE = _G.UNDERSCORE

	if AdditionalPocoHudTrackers == nil or PocoHud3Class == nil or type(PocoHud3) ~= "table" or UNDERSCORE == nil then
		return
	end

	local playertime = self:player_timer():time()

	if AdditionalPocoHudTrackers.Prefs.ShowBloodthirstMeleeBoostGauge and self:has_category_upgrade("player", "melee_damage_stacking") then
		-- Note: PlayerManager:upgrade_value() always returns a number, even if a nil fallback is specified (due to
		-- 'return default or 0')
		local data = self:upgrade_value("player", "melee_damage_stacking", 0)
		if data == 0 then
			return
		end

		if variant ~= "melee" then
			bloodthirst_counter = (bloodthirst_counter or 1) + 1
		else
			bloodthirst_counter = 1
		end

		local maxkills = (data.max_multiplier or 3)
		local ratio = bloodthirst_counter / maxkills
		if ratio > 1 then
			ratio = 1
		end
		local style = PocoHud3Class.O:get("buff", "style")
		local text = nil
		-- The buff title must not be specified for the 'Vanilla' style when et is 1
		if style ~= 2 then
			bloodthirst_color = bloodthirst_color or PocoHud3Class.O:get("root", "colorPositive") or Color(0.6, 0.8, 0.2)
			-- Recycling tables to prevent memory wastage since this code runs frequently
			text = bloodthirst_text_tbl
			text[1][1] = tostring(AdditionalPocoHudTrackers.TrackerNames.BloodthirstMeleeBoostGauge)
			text[2][1] = string.format(" %s%%", tostring(UNDERSCORE.f(ratio * maxkills * 100, 1)))
			text[2][2] = bloodthirst_color
		else
			text = string.format("%s%%", tostring(UNDERSCORE.f(ratio * maxkills * 100, 1)))
		end
		-- Don't bother showing 100%
		if ratio > 0.34 then
			AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
				key = "BloodthirstMeleeBoostGauge",
				good = true,
				icon = AdditionalPocoHudTrackers.U100SkillIcons,
				iconRect = {(11 * 80) + 8, (6 * 80) + 8, 64, 64},
				text = text,
				st = style == 2 and ratio or 1 - ratio,
				et = 1
			})
		else
			PocoHud3:RemoveBuff("BloodthirstMeleeBoostGauge")
		end
	end

	if variant == "melee" and AdditionalPocoHudTrackers.Prefs.ShowBloodthirstReloadBoostDuration and self:has_category_upgrade("player", "melee_kill_increase_reload_speed") then
		local data = self:upgrade_value("player", "melee_kill_increase_reload_speed", 0)
		if data == 0 then
			return
		end

		local buff = PocoHud3.buffs.BloodthirstReloadBoostDuration
		if not buff or buff.dying then
			AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
				key = "BloodthirstReloadBoostDuration",
				good = true,
				icon = AdditionalPocoHudTrackers.U100SkillIcons,
				iconRect = {(11 * 80) + 8, (6 * 80) + 8, 64, 64},
				text = tostring(AdditionalPocoHudTrackers.TrackerNames.BloodthirstReloadBoostDuration),
				st = playertime,
				et = playertime + data[2]
			})
		else
			-- Don't re-create the buff since it already exists, just extend it
			buff.data.st = playertime
			buff.data.et = playertime + data[2]
		end
	end

	if AdditionalPocoHudTrackers.Prefs.ShowSociopathCooldowns then
		local t = Application:time()
		if (not previouskillshot or t >= previouskillshot) and self._on_killshot_t then
			local hastension = self:has_category_upgrade("player", "killshot_regen_armor_bonus")
			local hascleanhit = variant == "melee" and self:has_category_upgrade("player", "melee_kill_life_leech")
			local hasoverdose = self:has_category_upgrade("player", "killshot_close_regen_armor_bonus")
			local hasshowdown = self:has_category_upgrade("player", "killshot_close_panic_chance")
			local blocktension = false

			-- Priorities (1 being highest):
			-- 1) clean hit (since it is the least common)
			-- 2) overdose (less common)
			-- 3) tension (common)
			-- 4) showdown (little impact on survivability)

			if hasmaxarmor then
				hasoverdose = false
				-- Switch to panic instead if the player owns it and their armor is already full
				if hasshowdown then
					blocktension = true
				end
			end

			if hasoverdose or hasshowdown then
				local dist_sq = mvector3.distance_sq(playerunit:movement():m_pos(), killed_unit:movement():m_pos())
				local close_combat_sq = close_combat_distance_sq or ((tweak_data.upgrades.close_combat_distance or 1800) * (tweak_data.upgrades.close_combat_distance or 1800))
				if dist_sq > close_combat_sq then
					-- Does not qualify for the additional Overdose armor regen bonus nor Showdown panic chance
					hasoverdose = false
					hasshowdown = false
				end
			end

			-- If there are no relevant icons but the player owns the Tension perk, undo its block so it will be selected
			if hastension and not hascleanhit and not hasoverdose and not hasshowdown and blocktension then
				blocktension = false
			end

			local icon = nil
			local text = ""
			if hascleanhit then
				icon = sociopath_cleanhit_icon_rect
				text = tostring(AdditionalPocoHudTrackers.TrackerNames.SociopathCleanHit)
			elseif hasoverdose then
				icon = sociopath_overdose_icon_rect
				text = tostring(AdditionalPocoHudTrackers.TrackerNames.SociopathOverdose)
			elseif hastension and not blocktension then
				icon = sociopath_tension_icon_rect
				text = tostring(AdditionalPocoHudTrackers.TrackerNames.SociopathTension)
			elseif hasshowdown then
				icon = sociopath_showdown_icon_rect
				text = tostring(AdditionalPocoHudTrackers.TrackerNames.SociopathShowdown)
			end

			if icon ~= nil then
				AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
					key = "SociopathCooldowns",
					good = false,
					icon = AdditionalPocoHudTrackers.DeckIcons,
					iconRect = icon,
					text = text,
					st = playertime,
					et = playertime + (self._on_killshot_t - t)
				})
			end
		end
	end

	local haslockandloadace = self:has_category_upgrade("player", "automatic_faster_reload")
--[[
	-- I'm refusing to even bother trying to track this very sloppily written skill until OVK themselves fix it to work the way
	-- it should. The following code is unfinished so enable it at your own risk
	if AdditionalPocoHudTrackers.Prefs.ShowLockAndLoadKills and haslockandloadace then
		if isgametrackinglockandload_post then
			local kills = nil
			local maxkills = (self._SHOCK_AND_AWE_TARGET_KILLS or 2)

			-- WTF, OVK - why are you abusing modulo (a.k.a. even-odd checking in this case) for this instead of using a proper
			-- numeric check? This method is inaccurate AF
			if self._num_kills % maxkills == 0 and isgametrackinglockandload_pre then
				kills = 2
			else
				kills = 1
			end

			local ratio = kills / maxkills
			if ratio > 1 then
				ratio = 1
			end
			local style = PocoHud3Class.O:get("buff", "style")
			local text = nil
			-- The buff title must not be specified for the 'Vanilla' style when et is 1
			if style ~= 2 then
				bloodthirst_color = bloodthirst_color or PocoHud3Class.O:get("root", "colorPositive") or Color(0.6, 0.8, 0.2)
				-- Recycling tables to prevent memory wastage since this code runs frequently
				text = bloodthirst_text_tbl
				text[1][1] = tostring(AdditionalPocoHudTrackers.TrackerNames.LockAndLoadKills)
				text[2][1] = string.format(" %s", tostring(kills))
				text[2][2] = bloodthirst_color
			else
				text = string.format("%s", tostring(kills))
			end
			AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
				key = "LockAndLoadKills",
				good = true,
				icon = AdditionalPocoHudTrackers.U100SkillIcons,
				iconRect = {(10 * 80) + 8, 10, 64, 64},
				text = text,
				st = style == 2 and ratio or 1 - ratio,
				et = 1
			})
		end
	end
]]
	if AdditionalPocoHudTrackers.Prefs.ShowLockAndLoadReloadBoost and haslockandloadace and isgametrackinglockandload_post then
		PollLockAndLoad()
	end
end

--/////////////--
--//  Biker  //--
--/////////////--

-- Forward declaration
local PollBikerKills = nil

local function ShowCooldown()
	local playermanager = managers.player
	if playermanager == nil then
		return
	end

	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	local PocoHud3Class = _G.PocoHud3Class
	local PocoHud3 = _G.PocoHud3

	if AdditionalPocoHudTrackers == nil or PocoHud3Class == nil or type(PocoHud3) ~= "table" then
		return
	end

	if not AdditionalPocoHudTrackers.Prefs.ShowBikerCooldown then
		return
	end

	-- Purge expired kills. This is necessary to ensure proper functionality even when the kill count gauge is disabled
	local t = Application:time()
	while playermanager._wild_kill_triggers[1] and t >= playermanager._wild_kill_triggers[1] do
		table.remove(playermanager._wild_kill_triggers, 1)
	end

	local newkills = #playermanager._wild_kill_triggers
	local maxkills = tweak_data.upgrades.wild_max_triggers_per_time or 10
	local now = Application:time()
	local good = true
	local cooldown = nil
	if newkills < 1 then
		return
	end
	if newkills < maxkills then
		cooldown = playermanager._wild_kill_triggers[newkills] - now
	else
		cooldown = playermanager._wild_kill_triggers[1] - now
		good = false
		-- Add a delayed call to show the longest cooldown again when this one expires
		DelayedCallsFix:Add("AdditionalPocoHudTrackers_ShowCooldown", cooldown, ShowCooldown)
	end

	local playertime = playermanager:player_timer():time()

	local buff = PocoHud3.buffs.BikerCooldown
	if not buff or buff.dying or buff.data.good ~= good then
		AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
			key = "BikerCooldown",
			good = good,
			icon = AdditionalPocoHudTrackers.BikerDeckIcons,
			iconRect = {0, 0, 64, 64},
			text = tostring(AdditionalPocoHudTrackers.TrackerNames.BikerCooldown),
			st = playertime,
			et = playertime + cooldown
		})
	else
		-- Don't re-create the buff since it already exists, just extend it
		buff.data.st = playertime
		buff.data.et = playertime + cooldown
	end

	-- Colorize the buff for the 'Vanilla' style since it does not permit any additional text
	if not good and PocoHud3Class.O:get("buff", "style") == 2 then
		local buff = PocoHud3.buffs.BikerCooldown
		if buff then
			if not buff.created then
				buff:_make()
			end
			local color = PocoHud3Class.O:get("root", "colorNegative") or Color(1, 0.84, 0)
			if alive(buff.bmp) then
				buff.bmp:set_color(color)
			end
			if alive(buff.bg) then
				local children = buff.bg:children()
				if children ~= nil then
					for __, panel in ipairs(children) do
						if alive(panel) and panel.type_name == "Bitmap" then
							panel:set_color(color)
						end
					end
				end
			end
		end
	end
end

local chk_wild_kill_counter_actual = PlayerManager.chk_wild_kill_counter
function PlayerManager:chk_wild_kill_counter(killed_unit, variant, ...)
	local player_unit = self:player_unit()
	if not player_unit then
		return chk_wild_kill_counter_actual(self, killed_unit, variant, ...)
	end
	if CopDamage.is_civilian(killed_unit:base()._tweak_table) then
		return chk_wild_kill_counter_actual(self, killed_unit, variant, ...)
	end
	local damage_ext = player_unit:character_damage()
	if not damage_ext or (not self:has_category_upgrade("player", "wild_health_amount") and not self:has_category_upgrade("player", "wild_armor_amount")) then
		return chk_wild_kill_counter_actual(self, killed_unit, variant, ...)
	end

	chk_wild_kill_counter_actual(self, killed_unit, variant, ...)

	-- Update the kills gauge immediately
	PollBikerKills()

	ShowCooldown()
end

local biker_kills_color_good = nil
local biker_kills_color_bad = nil
local biker_kills_text_tbl = {{}, {}}
local biker_kills_previous = 0
-- This ensures that HideBikerKillsGauge() only gets scheduled once - upon depletion - rather than recurringly while zero
local biker_kills_latch = nil

local function HideBikerKillsGauge()
	local playermanager = managers.player
	if playermanager == nil then
		return
	end

	local newkills = 0
	if playermanager._wild_kill_triggers ~= nil then
		-- Purge expired kills
		local t = Application:time()
		while playermanager._wild_kill_triggers[1] and t >= playermanager._wild_kill_triggers[1] do
			table.remove(playermanager._wild_kill_triggers, 1)
		end

		newkills = #playermanager._wild_kill_triggers
	end

	if newkills > 0 then
		return
	end

	local PocoHud3 = _G.PocoHud3
	if type(PocoHud3) == "table" then
		PocoHud3:RemoveBuff("BikerKillsGauge")
	end
end

PollBikerKills = function()
	local game_state_machine = _G.game_state_machine
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	local PocoHud3Class = _G.PocoHud3Class
	local PocoHud3 = _G.PocoHud3
	local playermanager = managers.player

	local gamestate = game_state_machine ~= nil and game_state_machine:current_state_name() or nil
	if not gamestate or gamestate == "menu_main" then
		return
	end

	if AdditionalPocoHudTrackers == nil or PocoHud3Class == nil or type(PocoHud3) ~= "table" or playermanager == nil then
		return
	end

	if not playermanager:has_category_upgrade("player", "wild_health_amount") and not playermanager:has_category_upgrade("player", "wild_armor_amount") then
		return
	end

	if AdditionalPocoHudTrackers.Prefs.ShowBikerKillsGauge then
		if playermanager._wild_kill_triggers ~= nil then
			-- Purge expired kills
			local t = Application:time()
			while playermanager._wild_kill_triggers[1] and t >= playermanager._wild_kill_triggers[1] do
				table.remove(playermanager._wild_kill_triggers, 1)
			end

			local newkills = #playermanager._wild_kill_triggers
			local maxkills = tweak_data.upgrades.wild_max_triggers_per_time or 10
			if newkills > maxkills then
				newkills = maxkills
			end
			local ratio = newkills / maxkills
			local good = ratio < 1
			local style = PocoHud3Class.O:get("buff", "style")
			local text = nil
			-- The buff title must not be specified for the 'Vanilla' style when et is 1
			if style ~= 2 then
				biker_kills_color_good = biker_kills_color_good or PocoHud3Class.O:get("root", "colorPositive") or Color(0.6, 0.8, 0.2)
				biker_kills_color_bad = biker_kills_color_bad or PocoHud3Class.O:get("root", "colorNegative") or Color(1, 0.84, 0)
				-- Recycling tables to prevent memory wastage since this code runs frequently
				text = biker_kills_text_tbl
				text[1][1] = tostring(AdditionalPocoHudTrackers.TrackerNames.BikerKillsGauge)
				text[2][1] = string.format(" %s", tostring(newkills))
				text[2][2] = good and biker_kills_color_good or biker_kills_color_bad
			else
				text = string.format("%s", tostring(newkills))
			end
			if biker_kills_previous > 0 or biker_kills_previous < newkills then
				AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
					key = "BikerKillsGauge",
					good = good,
					icon = AdditionalPocoHudTrackers.BikerDeckIcons,
					iconRect = {0, 0, 64, 64},
					text = text,
					st = style == 2 and ratio or 1 - ratio,
					et = 1
				})

				-- Colorize the buff for the 'Vanilla' style since it does not permit any additional text
				if not good and style == 2 then
					local buff = PocoHud3.buffs.BikerKillsGauge
					if buff then
						if not buff.created then
							buff:_make()
						end
						local color = PocoHud3Class.O:get("root", "colorNegative") or Color(1, 0.84, 0)
						if alive(buff.bmp) then
							buff.bmp:set_color(color)
						end
						if alive(buff.bg) then
							local children = buff.bg:children()
							if children ~= nil then
								for __, panel in ipairs(children) do
									if alive(panel) and panel.type_name == "Bitmap" then
										panel:set_color(color)
									end
								end
							end
						end
					end
				end
				-- Disarm the latch whenever the buff is shown (so that HideBikerKillsGauge() can be scheduled again)
				biker_kills_latch = true
			end
			biker_kills_previous = newkills
			-- Allow the player one second to visually confirm that their kills have reduced to 0 before hiding the gauge
			if newkills < 1 and biker_kills_latch then
				biker_kills_latch = false
				DelayedCallsFix:Add("AdditionalPocoHudTrackers_HideBikerKillsGauge", 1, HideBikerKillsGauge)
			end
		end
		DelayedCallsFix:Add("AdditionalPocoHudTrackers_PollBikerKills", AdditionalPocoHudTrackers.BikerKillsGaugeResolution_Actual or 0.5, PollBikerKills)
	end
end

function AdditionalPocoHudTrackers_TriggerBikerKillsRepoll(...)
	PollBikerKills()
end

-- Ensure the polling function gets run at least once
DelayedCallsFix:Add("AdditionalPocoHudTrackers_InitBikerKillsPoll", 3, PollBikerKills)

--///////////////////////--
--//  Ammo Efficiency  //--
--///////////////////////--

-- This function is currently (i.e. as at U104.1) only called by PlayerAction.AmmoEfficiency.Function(). Should this exclusivity
-- change in future, the Ammo Efficiency tracker will likely need to be rethought to prevent the occurrence of false positives
local on_ammo_increase_actual = PlayerManager.on_ammo_increase
function PlayerManager:on_ammo_increase(...)
	on_ammo_increase_actual(self, ...)

	if self._ammo_efficiency == nil then
		return
	end

	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	local PocoHud3 = _G.PocoHud3

	if AdditionalPocoHudTrackers == nil or type(PocoHud3) ~= "table" then
		return
	end

	if AdditionalPocoHudTrackers.Prefs.ShowAmmoEfficiencyDuration then
		PocoHud3:RemoveBuff("AmmoEfficiencyDuration")
	end

	-- Delay the buff's removal to allow it to be updated to 3 (or 2 if aced) prior to removal (otherwise it will fade away as an
	-- incomplete buff), but reset the counter immediately to prevent it from exceeding the limit (e.g. scoring a double
	-- headshot with a sniper rifle for the final shot). This allows the player enough time to confirm that it has been procured
	ammo_efficiency_counter = 0
	DelayedCallsFix:Add("AdditionalPocoHudTrackers_ResetAmmoEfficiencyStack", 1.5, ResetAmmoEfficiencyStack)
end

--/////////////////////////////////--
--//  Critical Hit Chance Gauge  //--
--/////////////////////////////////--

local critical_gauge_color = nil
local critical_gauge_text_tbl = {{}, {}}
local critical_gauge_previous = 0
local critical_gauge_latch = nil

local function HideCriticalChanceGauge()
	local playermanager = managers.player
	if playermanager == nil or playermanager:critical_hit_chance() > 0 then
		return
	end

	local PocoHud3 = _G.PocoHud3
	if type(PocoHud3) == "table" then
		PocoHud3:RemoveBuff("CriticalChanceGauge")
	end
end

PollCriticalChance = function()
	local game_state_machine = _G.game_state_machine
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	local PocoHud3Class = _G.PocoHud3Class
	local PocoHud3 = _G.PocoHud3
	local UNDERSCORE = _G.UNDERSCORE
	local playermanager = managers.player

	local gamestate = game_state_machine ~= nil and game_state_machine:current_state_name() or nil
	if not gamestate or gamestate == "menu_main" then
		return
	end

	if AdditionalPocoHudTrackers == nil or PocoHud3Class == nil or type(PocoHud3) ~= "table" or UNDERSCORE == nil or playermanager == nil then
		return
	end

	if AdditionalPocoHudTrackers.Prefs.ShowCriticalChanceGauge then
		local chance = playermanager:critical_hit_chance()

		local style = PocoHud3Class.O:get("buff", "style")
		local text = nil
		-- The buff title must not be specified for the 'Vanilla' style when et is 1
		if style ~= 2 then
			critical_gauge_color = critical_gauge_color or PocoHud3Class.O:get("root", "colorPositive") or Color(0.6, 0.8, 0.2)
			-- Recycling tables to prevent memory wastage
			text = critical_gauge_text_tbl
			text[1][1] = tostring(AdditionalPocoHudTrackers.TrackerNames.CriticalChanceGauge)
			text[2][1] = string.format(" %s%%", tostring(UNDERSCORE.f(chance * 100, 1)))
			text[2][2] = critical_gauge_color
		else
			text = string.format("%s%%", tostring(UNDERSCORE.f(chance * 100, 1)))
		end
		-- The latter check ensures that any increases in chance are always permitted to be displayed this tick (otherwise it
		-- will only be added on the following tick, one second later)
		if critical_gauge_previous > 0 or critical_gauge_previous < chance then
			AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
				key = "CriticalChanceGauge",
				good = true,
				icon = AdditionalPocoHudTrackers.U100SkillIcons,
				iconRect = {8, 12 * 80, 64, 64},
				text = text,
				st = style == 2 and chance or 1 - chance,
				et = 1
			})
			critical_gauge_latch = true
		end
		critical_gauge_previous = chance
		-- Allow the player one second to visually confirm that their critical chance has been reduced to 0 before hiding the
		-- gauge
		if chance <= 0 and critical_gauge_latch then
			critical_gauge_latch = false
			DelayedCallsFix:Add("AdditionalPocoHudTrackers_HideCriticalChanceGauge", 1, HideCriticalChanceGauge)
		end
		DelayedCallsFix:Add("AdditionalPocoHudTrackers_PollCriticalChance", 1, PollCriticalChance)
	end
end

function AdditionalPocoHudTrackers_TriggerCritRepoll(...)
	PollCriticalChance()
end

Hooks:PostHook(PlayerManager, "add_to_crit_mul", "AdditionalPocoHudTrackers_PlayerManager_add_to_crit_mul", AdditionalPocoHudTrackers_TriggerCritRepoll)
Hooks:PostHook(PlayerManager, "sub_from_crit_mul", "AdditionalPocoHudTrackers_PlayerManager_sub_from_crit_mul", AdditionalPocoHudTrackers_TriggerCritRepoll)

-- Ensure the polling function gets run at least once
DelayedCallsFix:Add("AdditionalPocoHudTrackers_InitCritPoll", 3, PollCriticalChance)

--//////////////////////////--
--//  Dodge Chance Gauge  //--
--//////////////////////////--

local dodge_gauge_color = nil
local dodge_gauge_text_tbl = {{}, {}}
local dodge_gauge_previous = 0
local dodge_gauge_latch = nil

local function ComputeOverallDodgeChance(playermanager)
	if playermanager == nil or tweak_data == nil then
		return
	end

	local playermovement = playermanager:player_unit()
	if playermovement == nil then
		return
	end
	playermovement = playermovement:movement()
	if playermovement == nil then
		return
	end

	-- From PlayerDamage:damage_bullet()
	local basechance = tweak_data.player.damage.DODGE_INIT or 0
	local armorchance = playermanager:body_armor_value("dodge")
	local skillchance = playermanager:skill_dodge_chance(playermovement:running(), playermovement:crouching(), playermovement:zipline_unit())
	return basechance + armorchance + skillchance
end

local function HideDodgeChanceGauge()
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	if AdditionalPocoHudTrackers.Prefs.ShowPersistentDodgeChanceGauge then
		return
	end

	local playermanager = managers.player
	if playermanager == nil then
		return
	end
	local chance = ComputeOverallDodgeChance(playermanager)
	if chance == nil or chance > 0 then
		return
	end

	local PocoHud3 = _G.PocoHud3
	if type(PocoHud3) == "table" then
		PocoHud3:RemoveBuff("DodgeChanceGauge")
	end
end

local function PollDodgeChance()
	local game_state_machine = _G.game_state_machine
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	local PocoHud3Class = _G.PocoHud3Class
	local PocoHud3 = _G.PocoHud3
	local UNDERSCORE = _G.UNDERSCORE
	local playermanager = managers.player

	local gamestate = game_state_machine ~= nil and game_state_machine:current_state_name() or nil
	if not gamestate or gamestate == "menu_main" then
		return
	end

	if AdditionalPocoHudTrackers == nil or PocoHud3Class == nil or type(PocoHud3) ~= "table" or UNDERSCORE == nil or playermanager == nil then
		return
	end

	if AdditionalPocoHudTrackers.Prefs.ShowDodgeChanceGauge then
		local chance = ComputeOverallDodgeChance(playermanager)
		if chance == nil then
			PocoHud3:RemoveBuff("DodgeChanceGauge")
		else
			local style = PocoHud3Class.O:get("buff", "style")
			local text = nil
			-- The buff title must not be specified for the 'Vanilla' style when et is 1
			if style ~= 2 then
				dodge_gauge_color = dodge_gauge_color or PocoHud3Class.O:get("root", "colorPositive") or Color(0.6, 0.8, 0.2)
				-- Recycling tables to prevent memory wastage
				text = dodge_gauge_text_tbl
				text[1][1] = tostring(AdditionalPocoHudTrackers.TrackerNames.DodgeChanceGauge)
				text[2][1] = string.format(" %s%%", tostring(UNDERSCORE.f(chance * 100, 1)))
				text[2][2] = dodge_gauge_color
			else
				text = string.format("%s%%", tostring(UNDERSCORE.f(chance * 100, 1)))
			end
			-- The last check ensures that any increases in chance are always permitted to be displayed this tick (otherwise it
			-- will only be added on the following tick, one second later)
			if AdditionalPocoHudTrackers.Prefs.ShowPersistentDodgeChanceGauge or dodge_gauge_previous > 0 or dodge_gauge_previous < chance then
				AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
					key = "DodgeChanceGauge",
					good = true,
					icon = AdditionalPocoHudTrackers.U100SkillIcons,
					iconRect = {(1 * 80) + 10, 12 * 80, 64, 64},
					text = text,
					st = style == 2 and chance or 1 - chance,
					et = 1
				})
				dodge_gauge_latch = true
			end
			dodge_gauge_previous = chance
			-- Allow the player one second to visually confirm that their dodge chance has been reduced to 0 before hiding the
			-- gauge
			if chance <= 0 and dodge_gauge_latch then
				dodge_gauge_latch = false
				DelayedCallsFix:Add("AdditionalPocoHudTrackers_HideDodgeChanceGauge", 1, HideDodgeChanceGauge)
			end
		end
		DelayedCallsFix:Add("AdditionalPocoHudTrackers_PollDodgeChance", 1, PollDodgeChance)
	end
end

-- Cannot be local since it must be accessible from PlayerStandard
function AdditionalPocoHudTrackers_TriggerDodgeRepoll(...)
	PollDodgeChance()
end

-- Ensure the polling function gets run at least once
DelayedCallsFix:Add("AdditionalPocoHudTrackers_InitDodgePoll", 3, PollDodgeChance)

--///////////////////--
--//  Uppers Aced  //--
--///////////////////--

local uppers_range_color = nil
local uppers_range_text_tbl = {{}, {}}

-- Based on FirstAidKitBase.GetFirstAidKit(). As with the game's own version, this function does not guarantee that the returned
-- unit is the /closest/ one. Instead, it just returns the first instance it finds that satisfies the distance criterion, even if
-- there may be another unit that is closer to the player. There is no point in fixing this behavior until OVK does so themselves
-- since the game itself will just consume the first instance anyway
local function GetFirstApplicableFAK(pos)
	if pos ~= nil and FirstAidKitBase.List ~= nil then
		local distance_sq = mvector3.distance_sq
		local cached_limit_sq = nil
		for i, o in pairs(FirstAidKitBase.List) do
			-- Square roots are computationally expensive to execute, do not perform them in a loop (distance computation
			-- involves the Pythagorean theorem)
			local dst = distance_sq(pos, o.pos)
			if dst <= (cached_limit_sq or (o.min_distance * o.min_distance)) then
				return math.sqrt(dst), o.min_distance, o.obj
			end
		end
	end
	return 0, 0, nil
end

local function PollUppersRange()
	local game_state_machine = _G.game_state_machine
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	local PocoHud3Class = _G.PocoHud3Class
	local PocoHud3 = _G.PocoHud3
	local playermanager = managers.player

	local gamestate = game_state_machine ~= nil and game_state_machine:current_state_name() or nil
	if not gamestate or gamestate == "menu_main" then
		return
	end

	if AdditionalPocoHudTrackers == nil or PocoHud3Class == nil or type(PocoHud3) ~= "table" or playermanager == nil then
		return
	end

	if AdditionalPocoHudTrackers.Prefs.ShowUppersRangeGauge then
		local playerunit = playermanager:player_unit()
		if alive(playerunit) then
			local distance, limit, fak = GetFirstApplicableFAK(playerunit:position())
			if not fak then
				PocoHud3:RemoveBuff("UppersRangeGauge")
			else
				local ratio = distance / limit
				local style = PocoHud3Class.O:get("buff", "style")
				local text = nil
				-- The buff title must not be specified for the 'Vanilla' style when et is 1
				if style ~= 2 then
					uppers_range_color = uppers_range_color or PocoHud3Class.O:get("root", "colorPositive") or Color(0.6, 0.8, 0.2)
					-- Recycling tables to prevent memory wastage
					text = uppers_range_text_tbl
					text[1][1] = tostring(AdditionalPocoHudTrackers.TrackerNames.UppersRangeGauge)
					text[2][1] = string.format(" %sm", tostring(AdditionalPocoHudTrackers.RoundToNearest(distance * 0.01)))
					text[2][2] = uppers_range_color
				else
					text = string.format("%sm", tostring(AdditionalPocoHudTrackers.RoundToNearest(distance * 0.01)))
				end
				AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
					key = "UppersRangeGauge",
					good = true,
					icon = AdditionalPocoHudTrackers.U100SkillIcons,
					iconRect = {(2 * 80) + 10, (11 * 80) + 8, 64, 64},
					text = text,
					st = style == 2 and 1 - ratio or ratio,
					et = 1
				})
			end
		end
		DelayedCallsFix:Add("AdditionalPocoHudTrackers_PollUppersRange", AdditionalPocoHudTrackers.UppersRangeResolution_Actual or 0.25, PollUppersRange)
	end
end

function AdditionalPocoHudTrackers_TriggerUppersRangeRepoll(...)
	PollUppersRange()
end

-- Ensure the polling function gets run at least once
DelayedCallsFix:Add("AdditionalPocoHudTrackers_InitUppersRangePoll", 3, PollUppersRange)

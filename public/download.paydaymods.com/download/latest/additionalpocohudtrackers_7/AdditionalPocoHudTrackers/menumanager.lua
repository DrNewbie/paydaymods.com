
if AdditionalPocoHudTrackers == nil then
	log("[AdditionalPocoHudTrackers] menumanager.lua | Error: Failed to create Mod Options menu, aborting")
	return
end

local MenuCallbackHandler = _G.MenuCallbackHandler
if MenuCallbackHandler == nil then
	log("[AdditionalPocoHudTrackers] menumanager.lua | Error: MenuCallbackHandler is nil, aborting")
	return
end

local function AddModOptions(menu_manager)
	if menu_manager == nil then
		return
	end

	MenuHelper:LoadFromJsonFile(AdditionalPocoHudTrackers.ModOptions, AdditionalPocoHudTrackers, AdditionalPocoHudTrackers.Prefs)
end
Hooks:Add("MenuManagerInitialize", "AdditionalPocoHudTrackers_AddModOptions", AddModOptions)

function MenuCallbackHandler.AdditionalPocoHudTrackers_SaveSettings(node)
	AdditionalPocoHudTrackers:Save()
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_BuffsHeader(item)
	-- This is an improvised section header and therefore does nothing whatsoever
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowBullseyeCooldown(item)
	AdditionalPocoHudTrackers.Prefs.ShowBullseyeCooldown = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowArmorerInvuln(item)
	AdditionalPocoHudTrackers.Prefs.ShowArmorerInvuln = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowArmorerInvulnCooldown(item)
	AdditionalPocoHudTrackers.Prefs.ShowArmorerInvulnCooldown = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowManiacStackTicks(item)
	AdditionalPocoHudTrackers.Prefs.ShowManiacStackTicks = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowManiacDecayTicks(item)
	AdditionalPocoHudTrackers.Prefs.ShowManiacDecayTicks = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowManiacAccumulatedStacks(item)
	AdditionalPocoHudTrackers.Prefs.ShowManiacAccumulatedStacks = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowHosTakerMuscleRegen(item)
	AdditionalPocoHudTrackers.Prefs.ShowHosTakerMuscleRegen = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowGrinderStackCooldown(item)
	AdditionalPocoHudTrackers.Prefs.ShowGrinderStackCooldown = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowGrinderRegenPeriod(item)
	AdditionalPocoHudTrackers.Prefs.ShowGrinderRegenPeriod = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowAggressiveReloadDuration(item)
	AdditionalPocoHudTrackers.Prefs.ShowAggressiveReloadDuration = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowInspireReviveCooldown(item)
	AdditionalPocoHudTrackers.Prefs.ShowInspireReviveCooldown = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowForcedFriendshipStack(item)
	AdditionalPocoHudTrackers.Prefs.ShowForcedFriendshipStack = (item:value() == "on" and true or false)
	if type(AdditionalPocoHudTrackers_PingForcedFriendship) == "function" then
		AdditionalPocoHudTrackers_PingForcedFriendship()
	end
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowForcedFriendshipPercentage(item)
	AdditionalPocoHudTrackers.Prefs.ShowForcedFriendshipPercentage = (item:value() == "on" and true or false)
	if type(AdditionalPocoHudTrackers_PingForcedFriendship) == "function" then
		AdditionalPocoHudTrackers_PingForcedFriendship()
	end
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowDireNeedDuration(item)
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers

	local newstate = (item:value() == "on" and true or false)
	AdditionalPocoHudTrackers.Prefs.ShowDireNeedDuration = newstate

	if not newstate then
		local PocoHud3 = _G.PocoHud3
		if type(PocoHud3) == "table" then
			PocoHud3:RemoveBuff("DireNeedDuration")
		end
	end
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowAmmoEfficiencyDuration(item)
	AdditionalPocoHudTrackers.Prefs.ShowAmmoEfficiencyDuration = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowAmmoEfficiencyStack(item)
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers

	local newstate = (item:value() == "on" and true or false)
	AdditionalPocoHudTrackers.Prefs.ShowAmmoEfficiencyStack = newstate

	if not newstate then
		local PocoHud3 = _G.PocoHud3
		if type(PocoHud3) == "table" then
			PocoHud3:RemoveBuff("AmmoEfficiencyStack")
		end
	end
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowUnseenStrikeDamageAvoidanceDuration(item)
	AdditionalPocoHudTrackers.Prefs.ShowUnseenStrikeDamageAvoidanceDuration = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowUnseenStrikeCriticalBoostDuration(item)
	AdditionalPocoHudTrackers.Prefs.ShowUnseenStrikeCriticalBoostDuration = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowCriticalChanceGauge(item)
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers

	local newstate = (item:value() == "on" and true or false)
	AdditionalPocoHudTrackers.Prefs.ShowCriticalChanceGauge = newstate

	if newstate then
		if type(AdditionalPocoHudTrackers_TriggerCritRepoll) == "function" then
			AdditionalPocoHudTrackers_TriggerCritRepoll()
		end
	else
		local PocoHud3 = _G.PocoHud3
		if type(PocoHud3) == "table" then
			PocoHud3:RemoveBuff("CriticalChanceGauge")
		end
	end
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowSecondWindDuration(item)
	AdditionalPocoHudTrackers.Prefs.ShowSecondWindDuration = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowUpYouGoDuration(item)
	AdditionalPocoHudTrackers.Prefs.ShowUpYouGoDuration = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowRunningFromDeathWeaponDuration(item)
	AdditionalPocoHudTrackers.Prefs.ShowRunningFromDeathWeaponDuration = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowRunningFromDeathMovementDuration(item)
	AdditionalPocoHudTrackers.Prefs.ShowRunningFromDeathMovementDuration = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowBloodthirstMeleeBoostGauge(item)
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers

	local newstate = (item:value() == "on" and true or false)
	AdditionalPocoHudTrackers.Prefs.ShowBloodthirstMeleeBoostGauge = newstate

	if not newstate then
		local PocoHud3 = _G.PocoHud3
		if PocoHud3 and type(PocoHud3) == "table" then
			PocoHud3:RemoveBuff("BloodthirstMeleeBoostGauge")
		end
	end
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowBloodthirstReloadBoostDuration(item)
	AdditionalPocoHudTrackers.Prefs.ShowBloodthirstReloadBoostDuration = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowDodgeChanceGauge(item)
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers

	local newstate = (item:value() == "on" and true or false)
	AdditionalPocoHudTrackers.Prefs.ShowDodgeChanceGauge = newstate

	if newstate then
		if type(AdditionalPocoHudTrackers_TriggerDodgeRepoll) == "function" then
			AdditionalPocoHudTrackers_TriggerDodgeRepoll()
		end
	else
		local PocoHud3 = _G.PocoHud3
		if type(PocoHud3) == "table" then
			PocoHud3:RemoveBuff("DodgeChanceGauge")
		end
	end
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowPersistentDodgeChanceGauge(item)
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers

	AdditionalPocoHudTrackers.Prefs.ShowPersistentDodgeChanceGauge = (item:value() == "on" and true or false)

	if AdditionalPocoHudTrackers.Prefs.ShowDodgeChanceGauge then
		if type(AdditionalPocoHudTrackers_TriggerDodgeRepoll) == "function" then
			AdditionalPocoHudTrackers_TriggerDodgeRepoll()
		end
	end
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowSixthSenseInitial(item)
	AdditionalPocoHudTrackers.Prefs.ShowSixthSenseInitial = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowSixthSenseSubsequent(item)
	AdditionalPocoHudTrackers.Prefs.ShowSixthSenseSubsequent = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowSixthSenseHighlighted(item)
	AdditionalPocoHudTrackers.Prefs.ShowSixthSenseHighlighted = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowAnarchistRegenTick(item)
	AdditionalPocoHudTrackers.Prefs.ShowAnarchistRegenTick = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowPersistentAnarchistRegenTick(item)
	AdditionalPocoHudTrackers.Prefs.ShowPersistentAnarchistRegenTick = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowAnarchistDmgCooldown(item)
	AdditionalPocoHudTrackers.Prefs.ShowAnarchistDmgCooldown = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowBikerKillsGauge(item)
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers

	local newstate = (item:value() == "on" and true or false)
	AdditionalPocoHudTrackers.Prefs.ShowBikerKillsGauge = newstate

	if newstate then
		if type(AdditionalPocoHudTrackers_TriggerBikerKillsRepoll) == "function" then
			AdditionalPocoHudTrackers_TriggerBikerKillsRepoll()
		end
	else
		local PocoHud3 = _G.PocoHud3
		if type(PocoHud3) == "table" then
			PocoHud3:RemoveBuff("BikerKillsGauge")
		end
	end
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowBikerCooldown(item)
	AdditionalPocoHudTrackers.Prefs.ShowBikerCooldown = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowUppersRangeGauge(item)
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers

	local newstate = (item:value() == "on" and true or false)
	AdditionalPocoHudTrackers.Prefs.ShowUppersRangeGauge = newstate

	if newstate then
		if type(AdditionalPocoHudTrackers_TriggerUppersRangeRepoll) == "function" then
			AdditionalPocoHudTrackers_TriggerUppersRangeRepoll()
		end
	else
		local PocoHud3 = _G.PocoHud3
		if type(PocoHud3) == "table" then
			PocoHud3:RemoveBuff("UppersRangeGauge")
		end
	end
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowUppersCooldown(item)
	AdditionalPocoHudTrackers.Prefs.ShowUppersCooldown = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowLockAndLoadReloadBoost(item)
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers

	local newstate = (item:value() == "on" and true or false)
	AdditionalPocoHudTrackers.Prefs.ShowLockAndLoadReloadBoost = newstate

	if newstate then
		if type(AdditionalPocoHudTrackers_TriggerLockAndLoadRepoll) == "function" then
			AdditionalPocoHudTrackers_TriggerLockAndLoadRepoll()
		end
	else
		local PocoHud3 = _G.PocoHud3
		if type(PocoHud3) == "table" then
			PocoHud3:RemoveBuff("LockAndLoadReloadBoost")
		end
	end
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowSociopathCooldowns(item)
	AdditionalPocoHudTrackers.Prefs.ShowSociopathCooldowns = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowBulletstormDuration(item)
	AdditionalPocoHudTrackers.Prefs.ShowBulletstormDuration = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowBulletstormPotential(item)
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers

	local newstate = (item:value() == "on" and true or false)
	AdditionalPocoHudTrackers.Prefs.ShowBulletstormPotential = newstate

	if newstate then
		if type(AdditionalPocoHudTrackers_TriggerBulletstormPotentialRepoll) == "function" then
			AdditionalPocoHudTrackers_TriggerBulletstormPotentialRepoll()
		end
	else
		local PocoHud3 = _G.PocoHud3
		if type(PocoHud3) == "table" then
			PocoHud3:RemoveBuff("BulletstormPotential")
		end
	end
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ExtrasHeader(item)
	-- This is an improvised section header and therefore does nothing whatsoever
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ShowAnarchistRegenGain(item)
	AdditionalPocoHudTrackers.Prefs.ShowAnarchistRegenGain = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_PerformanceHeader(item)
	-- This is an improvised section header and therefore does nothing whatsoever
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_SetManiacAccumulatedStacksResolution(item)
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers

	local value = AdditionalPocoHudTrackers.RoundToNearest(item:value())
	AdditionalPocoHudTrackers.Prefs.ManiacAccumulatedStacksResolution = value
	AdditionalPocoHudTrackers.ManiacAccumulatedStacksResolution_Actual = 1 / value
	-- Force the slider's numeric display to always show the actual, rounded value being used
	item:set_value(value)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_SetDireNeedResolution(item)
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers

	local value = AdditionalPocoHudTrackers.RoundToNearest(item:value())
	AdditionalPocoHudTrackers.Prefs.DireNeedResolution = value
	AdditionalPocoHudTrackers.DireNeedResolution_Actual = 1 / value
	-- Force the slider's numeric display to always show the actual, rounded value being used
	item:set_value(value)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_SetBikerKillsGaugeResolution(item)
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers

	local value = AdditionalPocoHudTrackers.RoundToNearest(item:value())
	AdditionalPocoHudTrackers.Prefs.BikerKillsGaugeResolution = value
	AdditionalPocoHudTrackers.BikerKillsGaugeResolution_Actual = 1 / value
	-- Force the slider's numeric display to always show the actual, rounded value being used
	item:set_value(value)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_SetUppersRangeResolution(item)
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers

	local value = AdditionalPocoHudTrackers.RoundToNearest(item:value())
	AdditionalPocoHudTrackers.Prefs.UppersRangeResolution = value
	AdditionalPocoHudTrackers.UppersRangeResolution_Actual = 1 / value
	-- Force the slider's numeric display to always show the actual, rounded value being used
	item:set_value(value)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_SetLockAndLoadResolution(item)
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers

	local value = AdditionalPocoHudTrackers.RoundToNearest(item:value())
	AdditionalPocoHudTrackers.Prefs.LockAndLoadResolution = value
	AdditionalPocoHudTrackers.LockAndLoadResolution_Actual = 1 / value
	-- Force the slider's numeric display to always show the actual, rounded value being used
	item:set_value(value)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_SetBulletstormPotentialResolution(item)
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers

	local value = AdditionalPocoHudTrackers.RoundToNearest(item:value())
	AdditionalPocoHudTrackers.Prefs.BulletstormPotentialResolution = value
	AdditionalPocoHudTrackers.BulletstormPotentialResolution_Actual = 1 / value
	-- Force the slider's numeric display to always show the actual, rounded value being used
	item:set_value(value)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ExperimentalHeader(item)
	-- This is an improvised section header and therefore does nothing whatsoever
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_ToggleHookPocoHudReload(item)
	AdditionalPocoHudTrackers.Prefs.ToggleHookPocoHudReload = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_DisablePocoHudInterpolation(item)
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers

	local newstate = (item:value() == "on" and true or false)
	AdditionalPocoHudTrackers.Prefs.DisablePocoHudInterpolation = newstate

	-- BUG: This does not validate whether the reload event has actually been hooked, which causes the interpolation blocking
	-- hooks to be lost when PocoHud is reloaded
	if AdditionalPocoHudTrackers.Prefs.ToggleHookPocoHudReload then
		AdditionalPocoHudTrackers:TogglePocoHudInterpolation(not newstate)
	end
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_DisablePocoHudHitFlashes(item)
	AdditionalPocoHudTrackers.Prefs.DisablePocoHudHitFlashes = (item:value() == "on" and true or false)
end

function MenuCallbackHandler:AdditionalPocoHudTrackers_Reset(item)
	-- Zero everything out
	for name, __ in pairs(AdditionalPocoHudTrackers.Prefs) do
		AdditionalPocoHudTrackers.Prefs[name] = nil
	end
	-- Fill in the missing preferences with default values
	for key, value in pairs(AdditionalPocoHudTrackers.DefPrefs) do
		if AdditionalPocoHudTrackers.Prefs[key] == nil then
			AdditionalPocoHudTrackers.Prefs[key] = value
		end
	end
	-- Force the save file to be overwritten with the default values as well
	AdditionalPocoHudTrackers:Save()
	-- Update all GUI controls to match. Adapted from Menu:ResetItemsToDefaultValue() in mods/base/req/menus.lua
	for __, node in ipairs(item._parameters.gui_node.row_items) do
		for name, value in pairs(AdditionalPocoHudTrackers.Prefs) do
			-- FIXME: This does not account for cases where there is a duplicate segment within a name (e.g. one option
			-- named 'somename' and another named 'somenameextended' causes the latter's default value to get ignored)
			if node.item._parameters.name:find(utf8.to_lower(name)) ~= nil then
				if node.item.set_value then
					if node.item._type == "toggle" then
						node.item:set_value(value and "on" or "off")
					else
						node.item:set_value(value)
					end
					-- Needed for sliders that perform rounding and toggle controls that perform refreshes
					node.item:trigger()
				end
				break
			end
		end
	end
	-- Force any sliders to be redrawn
	managers.viewport:resolution_changed()
end

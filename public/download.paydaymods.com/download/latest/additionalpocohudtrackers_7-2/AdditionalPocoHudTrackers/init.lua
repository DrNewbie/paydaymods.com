
_G.AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers or {
	SkillIcons = "guis/textures/pd2/skilltree/icons_atlas",
	-- From NewSkillTreeSkillItem:init()
	U100SkillIcons = "guis/textures/pd2/skilltree_2/icons_atlas_2",
	-- From SpecializationTierItem:init()
	DeckIcons = "guis/textures/pd2/specialization/icons_atlas",
	ManiacDeckIcons = "guis/dlcs/coco/textures/pd2/specialization/icons_atlas",
	AnarchistDeckIcons = "guis/dlcs/opera/textures/pd2/specialization/icons_atlas",
	BikerDeckIcons = "guis/dlcs/wild/textures/pd2/specialization/icons_atlas",
	-- Translation fallbacks
	TrackerNames = {
		ArmorerInvuln = "Immunity",
		ArmorerInvulnCooldown = "Cooldown",
		ManiacStackTicks = "Refresh",
		ManiacDecayTicks = "Decay",
		ManiacAccumulatedStacks = "Stack",
		HosTakerMuscleRegen = "Regen",
		GrinderStackCooldown = "Cooldown",
		GrinderRegenPeriod = "Regen",
		AggressiveReloadDuration = "Aggr. Reload",
		InspireReviveCooldown = "Revive",
		ForcedFriendshipStack = "Dmg. Abs.",
		DireNeedDuration = "Dire Need",
		AmmoEfficiencyDuration = "Ammo Effcy.",
		AmmoEfficiencyStack = "Headshots",
		UnseenStrikeDamageAvoidanceDuration = "Dmg Avoid",
		UnseenStrikeCriticalBoostDuration = "Crit. Bst.",
		CriticalChanceGauge = "Crit. Chan.",
		SecondWindDuration = "Spd. Bst.",
		UpYouGoDuration = "Dmg. Red.",
		RunningFromDeathWeaponDuration = "Wpn. Spd.",
		RunningFromDeathMovementDuration = "Mov. Spd.",
		BloodthirstMeleeBoostGauge = "Mle. Bst.",
		BloodthirstReloadBoostDuration = "Rld. Spd.",
		DodgeChanceGauge = "Dodg. Chan.",
		SixthSenseInitial = "Delay",
		SixthSenseSubsequent = "Re-sense",
		SixthSenseHighlighted = "Detected",
		AnarchistRegenTick = "Regen",
		AnarchistDmgCooldown = "Cooldown",
		BikerKillsGauge = "Kills",
		BikerCooldown = "Cooldown",
		UppersRangeGauge = "Upp. Dst.",
		UppersCooldown = "Cooldown",
		LockAndLoadKills = "Kills",
		LockAndLoadReloadBoost = "Rld. Bst.",
		SociopathCleanHit = "Health",
		SociopathOverdose = "2x Armor",
		SociopathTension = "Armor",
		SociopathShowdown = "Panic",
		BulletstormDuration = "Bulletstorm",
		BulletstormPotential = "Potential",
		-- Not actually a tracker name, but whatever...
		Active = "Active"
	},
	-- Indicates whether the Dire Need buff has already been updated to add a timer (see PlayerDamage:update() and
	-- PlayerManager:send_message())
	-- FIXME: Ergh, this is an ugly workaround for state saving
	DireNeedTimerInitiated = false
}

-- Preferences
AdditionalPocoHudTrackers.Prefs = {}
AdditionalPocoHudTrackers.DefPrefs = {
	ShowBullseyeCooldown = true,
	ShowArmorerInvuln = true,
	ShowArmorerInvulnCooldown = true,
	ShowManiacStackTicks = true,
	ShowManiacDecayTicks = true,
	ShowManiacAccumulatedStacks = true,
	ManiacAccumulatedStacksResolution = 2,
	ShowHosTakerMuscleRegen = true,
	ShowGrinderStackCooldown = true,
	ShowGrinderRegenPeriod = true,
	ShowAggressiveReloadDuration = true,
	ShowInspireReviveCooldown = true,
	ShowForcedFriendshipStack = true,
	ShowForcedFriendshipPercentage = false,
	ShowDireNeedDuration = true,
	DireNeedResolution = 4,
	ShowAmmoEfficiencyDuration = true,
	ShowAmmoEfficiencyStack = true,
	ShowUnseenStrikeDamageAvoidanceDuration = true,
	ShowUnseenStrikeCriticalBoostDuration = true,
	ShowCriticalChanceGauge = true,
	ShowSecondWindDuration = true,
	ShowUpYouGoDuration = true,
	ShowRunningFromDeathWeaponDuration = true,
	ShowRunningFromDeathMovementDuration = true,
	ShowBloodthirstMeleeBoostGauge = true,
	ShowBloodthirstReloadBoostDuration = true,
	ShowDodgeChanceGauge = true,
	ShowPersistentDodgeChanceGauge = false,
	ShowSixthSenseInitial = true,
	ShowSixthSenseSubsequent = true,
	ShowSixthSenseHighlighted = true,
	ShowAnarchistRegenTick = true,
	ShowPersistentAnarchistRegenTick = false,
	ShowAnarchistRegenGain = true,
	ShowAnarchistDmgCooldown = true,
	ShowBikerKillsGauge = true,
	BikerKillsGaugeResolution = 2,
	ShowBikerCooldown = true,
	ShowUppersRangeGauge = true,
	UppersRangeResolution = 4,
	ShowUppersCooldown = true,
--	ShowLockAndLoadKills = true,
	ShowLockAndLoadReloadBoost = true,
	LockAndLoadResolution = 4,
	ShowSociopathCooldowns = true,
	ShowBulletstormDuration = true,
	ShowBulletstormPotential = true,
	BulletstormPotentialResolution = 4,
	ToggleHookPocoHudReload = false,
	DisablePocoHudInterpolation = false,
	DisablePocoHudHitFlashes = false
}

-- Paths
if AdditionalPocoHudTrackers.ModPath == nil then
	AdditionalPocoHudTrackers.ModPath = ModPath
end
AdditionalPocoHudTrackers.SaveFile = AdditionalPocoHudTrackers.SaveFile or SavePath .. "additionalpocohudtrackers.txt"
AdditionalPocoHudTrackers.ModOptions = AdditionalPocoHudTrackers.ModPath .. "menus/modoptions.txt"

-- Based upon TdlQ's Lobby Player Info mod's localizations loading code
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_AdditionalPocoHudTrackers", function(loc)
	local commonpath = AdditionalPocoHudTrackers.ModPath .. "localizations/"
	if _G.PD2KR then
		loc:load_localization_file(commonpath .. "korean.txt")
	else
		local GetFiles = _G.file.GetFiles
		local Idstring = _G.Idstring
		local activelanguagekey = SystemInfo:language():key()
		for __, filename in ipairs(GetFiles(commonpath)) do
			if Idstring(filename:match("^(.*).txt$") or ""):key() == activelanguagekey then
				loc:load_localization_file(commonpath .. filename)
				break
			end
		end
	end

	loc:load_localization_file(commonpath .. "english.txt", false)

	AdditionalPocoHudTrackers:TranslateNames(loc)
end)

-- Standard IEEE rounding to the nearest integer (round half away from zero)
function AdditionalPocoHudTrackers.RoundToNearest(real)
	return real >= 0 and math.floor(real + 0.5) or math.ceil(real - 0.5)
end

function AdditionalPocoHudTrackers:Load()
	local f = io.open(self.SaveFile, "r")
	if f ~= nil then
		for key, value in pairs(json.decode(f:read("*all"))) do
			self.Prefs[key] = value
		end
		f:close()
	end

	-- Fill in the missing preferences with default values
	for key, value in pairs(self.DefPrefs) do
		if self.Prefs[key] == nil then
			self.Prefs[key] = value
		end
	end

	-- Replace obsolete preferences with their equivalents
	local tmp = self.Prefs.ShowUnseenStrikeDurations
	if tmp ~= nil then
		self.Prefs.ShowUnseenStrikeDamageAvoidanceDuration = tmp
		self.Prefs.ShowUnseenStrikeCriticalBoostDuration = tmp
		self.Prefs.ShowUnseenStrikeDurations = nil
	end

	self.Prefs.ShowUnseenStrikeOnlyOnce = nil
	self.Prefs.U107ForceUnseenStrikeShowOnce = nil

	-- Precompute the polling intervals. The calls to RoundToNearest() are to prevent the use of decimal values

	local clamp = math.clamp

	self.Prefs.ManiacAccumulatedStacksResolution = self.RoundToNearest(clamp(self.Prefs.ManiacAccumulatedStacksResolution, 1, 10))
	self.ManiacAccumulatedStacksResolution_Actual = 1 / self.Prefs.ManiacAccumulatedStacksResolution

	self.Prefs.DireNeedResolution = self.RoundToNearest(clamp(self.Prefs.DireNeedResolution, 1, 10))
	self.DireNeedResolution_Actual = 1 / self.Prefs.DireNeedResolution

	self.Prefs.BikerKillsGaugeResolution = self.RoundToNearest(clamp(self.Prefs.BikerKillsGaugeResolution, 1, 10))
	self.BikerKillsGaugeResolution_Actual = 1 / self.Prefs.BikerKillsGaugeResolution

	self.Prefs.UppersRangeResolution = self.RoundToNearest(clamp(self.Prefs.UppersRangeResolution, 1, 25))
	self.UppersRangeResolution_Actual = 1 / self.Prefs.UppersRangeResolution

	self.Prefs.LockAndLoadResolution = self.RoundToNearest(clamp(self.Prefs.LockAndLoadResolution, 1, 15))
	self.LockAndLoadResolution_Actual = 1 / self.Prefs.LockAndLoadResolution

	self.Prefs.BulletstormPotentialResolution = self.RoundToNearest(clamp(self.Prefs.BulletstormPotentialResolution, 1, 10))
	self.BulletstormPotentialResolution_Actual = 1 / self.Prefs.BulletstormPotentialResolution
end

function AdditionalPocoHudTrackers:Save()
	local f = io.open(self.SaveFile, "w+")
	if f ~= nil then
		local output = json.encode(self.Prefs)
		-- JSON4Lua, please...  >.<
		f:write(output ~= "[]" and output or "{}")
		f:close()
	end
end

AdditionalPocoHudTrackers:Load()

function AdditionalPocoHudTrackers:TranslateNames(localizationmanager)
	if localizationmanager == nil or localizationmanager._custom_localizations == nil then
		return
	end
	local tmp = nil
	for id, name in pairs(self.TrackerNames) do
		tmp = localizationmanager._custom_localizations["additionalpocohudtrackers_" .. id]
		if not tmp then
			log(string.format("[AdditionalPocoHudTrackers] TranslateNames() | Warning: No translation found for \"%s\", falling back to default \"%s\"", id, name))
		end
		self.TrackerNames[id] = tmp or name
	end
end

--///////////////////////////--
--//  PocoHud Interfacing  //--
--///////////////////////////--

-- Based upon TPocoHud3:Buff() (latest as at r467), but without the unnecessary call to PocoHud3Class.O:get("buff", "showSomeBuff"),
-- which causes substantial amounts of log spam for PocoHud revisions beyond r451
function AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, data)
	if not PocoHud3Class.O:get("buff", "enable") then
		return
	end
	local buff = PocoHud3.buffs[data.key]
	if buff and (buff.data.et ~= data.et or buff.data.good ~= data.good) then
		buff:destroy(1)
		buff = nil
	end
	if not buff then
		buff = PocoHud3Class.TBuff:new(PocoHud3, data)
		PocoHud3.buffs[data.key] = buff
	else
		buff:set(data)
	end
end

-- Warning: The following is essentially hackland, stuff here is probably going to break / change frequently

local TBuff_draw_actual = nil
local TBuff__fade_actual = nil
local PocoHudInterpolationState = true

-- BUG: Apparently this causes Ammo and Med bag Float labels to go missing for some reason (see TPocoHud3:_scanSmoke())

local function EnablePocoHudInterpolation()
	local PocoHud3Class = _G.PocoHud3Class
	local TBuff = PocoHud3Class.TBuff

	if TBuff ~= nil then
		if TBuff_draw_actual ~= nil and type(TBuff_draw_actual) == "function" then
			TBuff.draw = TBuff_draw_actual
			TBuff_draw_actual = nil
		end

		if TBuff__fade_actual ~= nil and type(TBuff__fade_actual) == "function" then
			TBuff._fade = TBuff__fade_actual
			TBuff__fade_actual = nil
		end

		PocoHudInterpolationState = true
	end
end

local function DisablePocoHudInterpolation()
	local PocoHud3Class = _G.PocoHud3Class
	local TBuff = PocoHud3Class.TBuff

	if TBuff ~= nil then
		if TBuff_draw_actual == nil then
			TBuff_draw_actual = TBuff.draw
			function TBuff:draw(t, x, y, ...)
				TBuff_draw_actual(self, t, x, y, ...)

				if not self.dead and alive(self.pnl) and not self.owner:_isSimple(self.data.key) then
					-- Stomp the interpolated coordinates with the final ones
					self.pnl:set_center(x, y)
					self.x = x
					self.y = y
				end
			end
		end

		-- TODO: Could probably hook TBuff:destroy() instead and force the argument to always be true? Seems cleaner than this
		-- approach...
		if TBuff__fade_actual == nil then
			TBuff__fade_actual = TBuff._fade
			function TBuff:_fade(pnl, done_cb, seconds, ...)
				-- Don't call to the original function as it contains a coroutine.yield()
				local pnl = self.pnl
				if not pnl then
					return
				end
				pnl:set_visible(true)
				pnl:set_alpha(1)
				if self.dying then
					pnl:set_visible(false)
					if done_cb then done_cb(pnl) end
				end
			end
		end

		PocoHudInterpolationState = false
	end
end

function AdditionalPocoHudTrackers:TogglePocoHudInterpolation(override)
	local final = PocoHudInterpolationState
	if override ~= nil then
		-- Specifying an override of true means that interpolation should be enabled, so invert the value to ensure the correct
		-- function gets called
		final = not override
	end

	if final then
		DisablePocoHudInterpolation()
	else
		EnablePocoHudInterpolation()
	end
end

-- Forward declaration so HookPocoReload() can access the function
local QueryPoco = nil

-- Hooks TPocoHud3:Menu(). Also see PocoHud3Class._drawOptions()
local function HookPocoReload()
	local PocoHud3 = _G.PocoHud3
	if not PocoHud3 then
		return
	end

	if type(PocoHud3) ~= "table" then
		-- Attempted to hook too soon, PocoHud hasn't initialized yet
		DelayedCallsFix:Add("AdditionalPocoHudTrackers_HookPocoReload", 1, HookPocoReload)
		return
	end

	local TPocoHud3_Menu_actual = PocoHud3.Menu
	function PocoHud3:Menu(dismiss, skipAnim, ...)
		TPocoHud3_Menu_actual(self, dismiss, skipAnim, ...)

		if dismiss and skipAnim then
			-- Reset the double-hooking guard
			TBuff_draw_actual = nil
			TBuff__fade_actual = nil
			PocoHudInterpolationState = true
			DelayedCallsFix:Add("AdditionalPocoHudTrackers_QueryPoco", 3, QueryPoco)
		end
	end
end

QueryPoco = function()
	if AdditionalPocoHudTrackers == nil then
		return
	end

	if AdditionalPocoHudTrackers.Prefs.ToggleHookPocoHudReload then
		HookPocoReload()

		if AdditionalPocoHudTrackers.Prefs.DisablePocoHudInterpolation then
			DisablePocoHudInterpolation()
		end

		-- This is placed here to allow PocoHud to hook the function first (since it only applies its hooks on the first game
		-- frame, which is always after all BLT post-require hook scripts have already been called)
		if AdditionalPocoHudTrackers.Prefs.DisablePocoHudHitFlashes and PlayerDamage ~= nil then
			local _hit_direction_actual = PlayerDamage._hit_direction
			function PlayerDamage:_hit_direction(...)
				_hit_direction_actual(self, ...)

				local environmentcontrollermanager = managers.environment_controller
				if environmentcontrollermanager ~= nil then
					environmentcontrollermanager._hit_some = 0
				end
			end
		end

		-- Certain non-polling trackers require refreshes to have their buffs displayed again
		if type(AdditionalPocoHudTrackers_PingForcedFriendship) == "function" then
			AdditionalPocoHudTrackers_PingForcedFriendship()
		end
	end
end

DelayedCallsFix:Add("AdditionalPocoHudTrackers_QueryPoco", 2, QueryPoco)

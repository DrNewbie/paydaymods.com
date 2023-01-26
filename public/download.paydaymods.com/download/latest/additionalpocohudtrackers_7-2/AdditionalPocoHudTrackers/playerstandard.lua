
if AdditionalPocoHudTrackers_PlayerStandard_Hooked then
	return
else
	AdditionalPocoHudTrackers_PlayerStandard_Hooked = true
end

--//////////////////////////--
--//  Dodge Chance Gauge  //--
--//////////////////////////--

Hooks:PostHook(PlayerStandard, "_start_action_zipline", "AdditionalPocoHudTrackers_PlayerStandard__start_action_zipline", AdditionalPocoHudTrackers_TriggerDodgeRepoll)
Hooks:PostHook(PlayerStandard, "_end_action_zipline", "AdditionalPocoHudTrackers_PlayerStandard__end_action_zipline", AdditionalPocoHudTrackers_TriggerDodgeRepoll)
Hooks:PostHook(PlayerStandard, "_start_action_ducking", "AdditionalPocoHudTrackers_PlayerStandard__start_action_ducking", AdditionalPocoHudTrackers_TriggerDodgeRepoll)
Hooks:PostHook(PlayerStandard, "_end_action_ducking", "AdditionalPocoHudTrackers_PlayerStandard__end_action_ducking", AdditionalPocoHudTrackers_TriggerDodgeRepoll)
-- Sprinting continues for a short period after PlayerStandard:_end_action_running() is called, so PlayerStandard:set_running()
-- is more reliable for tracking
Hooks:PostHook(PlayerStandard, "set_running", "AdditionalPocoHudTrackers_PlayerStandard_set_running", AdditionalPocoHudTrackers_TriggerDodgeRepoll)

--///////////////////--
--//  Sixth Sense  //--
--///////////////////--

local computed_duration_civilian = nil
local computed_duration_security = nil
local target_resense_delay = nil
local sense_start = 0
local sense_latch = false

local function ResetSxSnLatch()
	sense_latch = false
end

local sxsn_highlighted_good = nil
local sxsn_highlighted_text_tbl = {{}, {}}

local _update_omniscience_actual = PlayerStandard._update_omniscience
function PlayerStandard:_update_omniscience(t, dt, ...)
	local previoustime = self._state_data.omniscience_t

	_update_omniscience_actual(self, t, dt, ...)

	if previoustime ~= nil and self._state_data.omniscience_t == nil then
		-- The game forbade the skill, kill the buffs (this does not run every frame due to the combined check in the above
		-- conditional clause)
		PocoHud3:RemoveBuff("SixthSenseInitial")
		PocoHud3:RemoveBuff("SixthSenseSubsequent")
		PocoHud3:RemoveBuff("SixthSenseHighlighted")
		ResetSxSnLatch()
		DelayedCallsFix:Remove("AdditionalPocoHudTrackers_ResetSxSnLatch")
		return
	end

	local playermanager = managers.player
	if not playermanager or not playermanager:has_category_upgrade("player", "standstill_omniscience") or not managers.groupai:state():whisper_mode() then
		return
	end

	-- Avoiding recurring global lookups during this call since this function runs every frame
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	local PocoHud3Class = _G.PocoHud3Class
	local PocoHud3 = _G.PocoHud3
	local ContourExt = _G.ContourExt

	if AdditionalPocoHudTrackers == nil or PocoHud3Class == nil or type(PocoHud3) ~= "table" or ContourExt == nil then
		return
	end

	-- Based on GamePlayCentralManager:auto_highlight_enemy()
	if not computed_duration_civilian or not computed_duration_security then
		local tmp = ContourExt._types
		if tmp ~= nil then
			local multiplier = playermanager:upgrade_value("player", "mark_enemy_time_multiplier", 1)
			local contour_type = playermanager:has_category_upgrade("player", "marked_enemy_extra_damage") and "mark_enemy_damage_bonus" or "mark_enemy"
			tmp = tmp[contour_type]
			if tmp ~= nil then
				computed_duration_civilian = tmp.fadeout ~= nil and (tmp.fadeout * multiplier) or 4.5
				computed_duration_security = tmp.fadeout_silent ~= nil and (tmp.fadeout_silent * multiplier) or 13.5
			else
				-- Assume default
				computed_duration_civilian = 4.5
				computed_duration_security = 13.5
			end
		else
			-- Assume default
			computed_duration_civilian = 4.5
			computed_duration_security = 13.5
		end
	end

	target_resense_delay = target_resense_delay or tweak_data.player.omniscience.target_resense_t or 15

	if previoustime == nil and self._state_data.omniscience_t ~= nil then
		-- Delay prior to initial poll
		if not AdditionalPocoHudTrackers.Prefs.ShowSixthSenseInitial then
			return
		end

		AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
			key = "SixthSenseInitial",
			good = false,
			icon = AdditionalPocoHudTrackers.SkillIcons,
			iconRect = {6 * 64, 10 * 64, 64, 64},
			text = tostring(AdditionalPocoHudTrackers.TrackerNames.SixthSenseInitial),
			st = t,
			et = self._state_data.omniscience_t
		})
	elseif previoustime ~= self._state_data.omniscience_t then
		-- Subsequent poll (called once every second)
		local detected = 0
		local tmp = self._state_data.omniscience_units_detected
		local civilians = managers.enemy:all_civilians() or {}
		if tmp ~= nil then
			local begin_t = 0
			local end_t = 0
			for key, data in pairs(tmp) do
				-- Since only expiry times are stored, work backwards to figure out when the start time was, and calculate the
				-- time the highlight will expire
				begin_t = data - target_resense_delay
				end_t = begin_t + (not civilians[key] and computed_duration_security or computed_duration_civilian)
				if t >= begin_t and t < end_t then
					detected = detected + 1
				end
			end
		end
		if detected > 0 and not sense_latch then
			sense_start = t
		end

		if detected > 0 and AdditionalPocoHudTrackers.Prefs.ShowSixthSenseSubsequent and not sense_latch then
			sense_latch = true
			DelayedCallsFix:Add("AdditionalPocoHudTrackers_ResetSxSnLatch", target_resense_delay, ResetSxSnLatch)

			AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
				key = "SixthSenseSubsequent",
				good = false,
				icon = AdditionalPocoHudTrackers.SkillIcons,
				iconRect = {6 * 64, 10 * 64, 64, 64},
				text = tostring(AdditionalPocoHudTrackers.TrackerNames.SixthSenseSubsequent),
				st = sense_start,
				et = sense_start + target_resense_delay
			})
		end

		if AdditionalPocoHudTrackers.Prefs.ShowSixthSenseHighlighted then
			local style = PocoHud3Class.O:get("buff", "style")
			local text = nil
			local ratio = detected > 0 and 1 or 0
			-- The buff title must not be specified for the 'Vanilla' style when et is 1
			if style ~= 2 then
				sxsn_highlighted_good = sxsn_highlighted_good or PocoHud3Class.O:get("root", "colorPositive") or Color(0.6, 0.8, 0.2)
				-- Recycling tables to prevent memory wastage since this code runs frequently
				text = sxsn_highlighted_text_tbl
				text[1][1] = tostring(AdditionalPocoHudTrackers.TrackerNames.SixthSenseHighlighted)
				text[2][1] = string.format(" %s", tostring(detected))
				text[2][2] = sxsn_highlighted_good
			else
				text = string.format("%s", tostring(detected))
			end
			AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
				key = "SixthSenseHighlighted",
				good = true,
				icon = AdditionalPocoHudTrackers.SkillIcons,
				iconRect = {6 * 64, 10 * 64, 64, 64},
				text = text,
				st = style == 2 and ratio or 1 - ratio,
				et = 1
			})
		end
	end
end

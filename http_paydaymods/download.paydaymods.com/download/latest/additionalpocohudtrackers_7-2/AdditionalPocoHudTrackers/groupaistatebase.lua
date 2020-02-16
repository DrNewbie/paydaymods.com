
if AdditionalPocoHudTrackers_GroupAIStateBase_Hooked then
	return
else
	AdditionalPocoHudTrackers_GroupAIStateBase_Hooked = true
end

--/////////////////////////--
--//  Forced Friendship  //--
--/////////////////////////--

local forced_friendship_color = nil
local forced_friendship_text_tbl = {{}, {}}

local forced_friendship_state = nil
-- Forward declaration so that AdditionalPocoHudTrackers_PingForcedFriendship can access the function (which is defined below it)
local UpdateForcedFriendshipStack = nil

-- Called from MenuCallbackHandler:AdditionalPocoHudTrackers_ShowForcedFriendshipStack(),
-- MenuCallbackHandler:AdditionalPocoHudTrackers_ShowForcedFriendshipPercentage() and QueryPoco()
function AdditionalPocoHudTrackers_PingForcedFriendship()
	local self = forced_friendship_state
	if self == nil then
		return
	end

	UpdateForcedFriendshipStack(self)
end

UpdateForcedFriendshipStack = function(groupaistatebase)
	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	local PocoHud3Class = _G.PocoHud3Class
	local PocoHud3 = _G.PocoHud3
	local UNDERSCORE = _G.UNDERSCORE

	if AdditionalPocoHudTrackers == nil or PocoHud3Class == nil or type(PocoHud3) ~= "table" or UNDERSCORE == nil then
		return
	end

	if not AdditionalPocoHudTrackers.Prefs.ShowForcedFriendshipStack then
		-- Just in case it gets disabled mid-game
		PocoHud3:RemoveBuff("ForcedFriendshipStack")
		return
	end

	local each = managers.player:team_upgrade_value("damage", "hostage_absorption", 0)
	local current = each * (groupaistatebase._hostage_headcount or 10)
	local limit = each * (tweak_data.upgrades.values.team.damage.hostage_absorption_limit or 8)
	if current > limit then
		current = limit
	end
	local ratio = current / limit
	local style = PocoHud3Class.O:get("buff", "style")
	local text = nil
	-- The buff title must not be specified for the 'Vanilla' style when et is 1
	if style ~= 2 then
		forced_friendship_color = forced_friendship_color or PocoHud3Class.O:get("root", "colorPositive") or Color(0.6, 0.8, 0.2)
		-- Recycling tables to prevent memory wastage since this code runs frequently
		text = forced_friendship_text_tbl
		text[1][1] = tostring(AdditionalPocoHudTrackers.TrackerNames.ForcedFriendshipStack)
		if AdditionalPocoHudTrackers.Prefs.ShowForcedFriendshipPercentage then
			text[2][1] = string.format(" %s%%", tostring(UNDERSCORE.f(ratio * 100, 1)))
		else
			text[2][1] = string.format(" %s", tostring(UNDERSCORE.f(current * 10, 2)))
		end
		text[2][2] = forced_friendship_color
	else
		if AdditionalPocoHudTrackers.Prefs.ShowForcedFriendshipPercentage then
			text = string.format("%s%%", tostring(UNDERSCORE.f(ratio * 100, 1)))
		else
			text = tostring(UNDERSCORE.f(current * 10, 2))
		end
	end
	if ratio > 0 then
		AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
			key = "ForcedFriendshipStack",
			good = true,
			icon = AdditionalPocoHudTrackers.U100SkillIcons,
			iconRect = {(4 * 80) + 8, (7 * 80) + 8, 64, 64},
			text = text,
			st = style == 2 and ratio or 1 - ratio,
			et = 1
		})
	else
		PocoHud3:RemoveBuff("ForcedFriendshipStack")
	end
end

local sync_hostage_headcount_actual = GroupAIStateBase.sync_hostage_headcount
function GroupAIStateBase:sync_hostage_headcount(...)
	sync_hostage_headcount_actual(self, ...)

	if not managers.player:has_team_category_upgrade("damage", "hostage_absorption") then
		return
	end

	forced_friendship_state = self

	UpdateForcedFriendshipStack(self)
end

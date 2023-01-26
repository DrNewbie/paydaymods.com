
if AdditionalPocoHudTrackers_InteractionExt_Hooked then
	return
else
	AdditionalPocoHudTrackers_InteractionExt_Hooked = true
end

--///////////////////--
--//  Bulletstorm  //--
--///////////////////--

local bulletstorm_state = {}
-- Do not allow this table to prevent the currently tracked ammo bag from being garbage collected
setmetatable(bulletstorm_state, {__mode = "v"})

local bulletstorm_duration_color_good = nil
local bulletstorm_duration_text_tbl = {{}, {}}
local bulletstorm_duration_latch = nil

-- Based on RaycastWeaponBase:add_ammo_from_bag()
local function ComputeAmmoRestoreQuantity(weapon, available)
	if not weapon or weapon:ammo_max() then
		return 0
	end
	return math.min(1 - weapon:get_ammo_total() / weapon:get_ammo_max(), available)
end

local function PollBulletstormPotential()
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

	local playerunit = playermanager:local_player()
	if not playerunit then
		return
	end

	if not AdditionalPocoHudTrackers.Prefs.ShowBulletstormPotential then
		PocoHud3:RemoveBuff("BulletstormPotential")
		return
	end

	local active_ammo_bag = bulletstorm_state.active_ammo_bag
	if not active_ammo_bag or not alive(active_ammo_bag._unit) or active_ammo_bag._empty or active_ammo_bag._ammo_amount <= 0 then
		PocoHud3:RemoveBuff("BulletstormPotential")
		return
	end

	-- Based on AmmoBagBase:_take_ammo()
	local inventory = playerunit:inventory()
	if not inventory then
		PocoHud3:RemoveBuff("BulletstormPotential")
		return
	end

	local taken = 0
	local simulated_amount = active_ammo_bag._ammo_amount
	for __, weapon in pairs(inventory:available_selections()) do
		local took = active_ammo_bag:round_value(ComputeAmmoRestoreQuantity(weapon.unit:base(), simulated_amount))
		taken = taken + took
		simulated_amount = active_ammo_bag:round_value(simulated_amount - took)
		if simulated_amount <= 0 then
			break
		end
	end

	local duration = active_ammo_bag._BULLET_STORM[active_ammo_bag._bullet_storm_level] * taken
	local ratio = taken / 2
	local style = PocoHud3Class.O:get("buff", "style")
	local text = nil
	-- The buff title must not be specified for the 'Vanilla' style when et is 1
	if style ~= 2 then
		bulletstorm_duration_color_good = bulletstorm_duration_color_good or PocoHud3Class.O:get("root", "colorPositive") or Color(0.6, 0.8, 0.2)
		-- Recycling tables to prevent memory wastage since this code runs frequently
		text = bulletstorm_duration_text_tbl
		text[1][1] = tostring(AdditionalPocoHudTrackers.TrackerNames.BulletstormPotential)
		text[2][1] = string.format(" %ss", tostring(UNDERSCORE.f(duration, 2)))
		text[2][2] = bulletstorm_duration_color_good
	else
		text = string.format("%ss", tostring(UNDERSCORE.f(duration, 2)))
	end
	AdditionalPocoHudTrackers.Buff(PocoHud3, PocoHud3Class, {
		key = "BulletstormPotential",
		good = true,
		icon = AdditionalPocoHudTrackers.U100SkillIcons,
		iconRect = {(4 * 80) + 8, (5 * 80) + 8, 64, 64},
		text = text,
		st = style == 2 and ratio or 1 - ratio,
		et = 1
	})

	DelayedCallsFix:Add("AdditionalPocoHudTrackers_PollBulletstormPotential", AdditionalPocoHudTrackers.BulletstormPotentialResolution_Actual or 0.5, PollBulletstormPotential)
end

function AdditionalPocoHudTrackers_TriggerBulletstormPotentialRepoll(...)
	PollBulletstormPotential()
end

local selected_actual = AmmoBagInteractionExt.selected
function AmmoBagInteractionExt:selected(player, ...)
	if not self:can_select(player) then
		return selected_actual(self, player, ...)
	end

	if not alive(self._unit) then
		return selected_actual(self, player, ...)
	end

	local ammobag = self._unit:base()
	if ammobag == nil or not ammobag._bullet_storm_level or ammobag._bullet_storm_level < 1 then
		return selected_actual(self, player, ...)
	end

	bulletstorm_state.active_ammo_bag = ammobag

	local result = selected_actual(self, player, ...)

	PollBulletstormPotential()

	return result
end

local unselect_actual = AmmoBagInteractionExt.unselect
function AmmoBagInteractionExt:unselect(...)
	unselect_actual(self, ...)

	bulletstorm_state.active_ammo_bag = nil

	local AdditionalPocoHudTrackers = _G.AdditionalPocoHudTrackers
	if not AdditionalPocoHudTrackers.Prefs.ShowBulletstormPotential then
		return
	end

	-- Do not remove the AdditionalPocoHudTrackers_PollBulletstormPotential delayed call here as doing so breaks polling when
	-- switching from a basic ammo bag to a Bulletstorm-enabled one (assuming both are right next to each other, a la Safe House
	-- layout)

	local PocoHud3 = _G.PocoHud3
	if type(PocoHud3) == "table" then
		PocoHud3:RemoveBuff("BulletstormPotential")
	end
end

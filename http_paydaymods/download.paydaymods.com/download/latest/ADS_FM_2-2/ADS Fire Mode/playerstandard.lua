local ADS_FIRE_MODE = Idstring("single") -- Change to "auto" to always have auto-fire when aiming down sight.

-- Blacklisted weapons, these won't automatically change fire mode.
-- You need to write the weapon_id as follow, you can either delete or comment if you want to remove them from the list.
local banned_weapons = {
	"glock_18c",	-- Stryk
	"g36",			-- JP36
	"new_m4",		-- Car-4
	"baka",			-- Micro-uzi
	"uzi"			-- etc.
}


function PlayerStandard:adsf_toggle(base)	
	local equipped_primary = managers.blackmarket:equipped_primary().weapon_id
	local equipped_secondary = managers.blackmarket:equipped_secondary().weapon_id
	
	if table.contains(banned_weapons, equipped_primary) and Utils:IsCurrentWeaponPrimary() or table.contains(banned_weapons, equipped_secondary) and Utils:IsCurrentWeaponSecondary() then
		return
	end
	
	self:_check_stop_shooting()
	base:toggle_firemode()
	managers.hud:set_teammate_weapon_firemode(HUDManager.PLAYER_PANEL, self._unit:inventory():equipped_selection(), base:fire_mode())
end

local adsf_start_action_steelsight_original = PlayerStandard._start_action_steelsight
function PlayerStandard:_start_action_steelsight(t)
	adsf_start_action_steelsight_original(self, t)
	
	if not self._steelsight_wanted then
		local adsf_base = self._equipped_unit:base()
		if adsf_base:can_toggle_firemode() and adsf_base._fire_mode ~= ADS_FIRE_MODE then
			self.adsf_mode_altered = true
			self:adsf_toggle(adsf_base)
		end
	end
end

local adsf_end_action_steelsight_original = PlayerStandard._end_action_steelsight
function PlayerStandard:_end_action_steelsight(t)
	adsf_end_action_steelsight_original(self, t)

	if self.adsf_mode_altered then
		self:adsf_toggle(self._equipped_unit:base())
		self.adsf_mode_altered = false
	end
end

local adsf_interupt_action_steelsight_original = PlayerStandard._interupt_action_steelsight
function PlayerStandard:_interupt_action_steelsight(t)
	adsf_interupt_action_steelsight_original(self, t)

	if self.adsf_mode_altered then
		self:adsf_toggle(self._equipped_unit:base())
		self.adsf_mode_altered = false
	end
end
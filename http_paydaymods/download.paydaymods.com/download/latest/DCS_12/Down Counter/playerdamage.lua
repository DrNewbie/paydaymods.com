--own down event
local DownCounter = DownCounter or _G.DownCounterStandalone

Hooks:PostHook(PlayerDamage, "on_downed", "dcs_playerdamage_ondowned", function(self, ...)
	local max_downs = self._lives_init + managers.player:upgrade_value("player", "additional_lives", 0) or 4 --DownCounter.global_max_downs not needed since self._revives are locally stored
	local revives = self:get_revives()
	local downs = max_downs - revives
	if downs == max_downs and not DownCounter:AnnounceCustodies() then
		return --don't announce anything if going into custody, and intentionally don't update downcounter's downs so that we can announce that in on_enter_custody()
	end
	
	local my_name = (managers.network and managers.network.account and managers.network.account:username()) or "ChadHeister McSexHaver"

	local message = "Player " .. my_name
	if downs >= max_downs - 1 then
		message = "Warning! " .. message .. " has been downed " .. tostring(downs) .. (downs == 1 and " time!" or " times!")
	elseif not DownCounter:IsAnnounceLowDownsOnly() and (DownCounter:IsAlertModeAll() or DownCounter:IsAlertModeSelf()) then
		message = message .. " has been downed " .. tostring(downs) .. (downs == 1 and " time." or " times.")
	else
		return --don't announce anything
	end
	
	DownCounter.counter[LuaNetworking:LocalPeerID()] = downs or 0
	
	DownCounter:Announce(message)
end)


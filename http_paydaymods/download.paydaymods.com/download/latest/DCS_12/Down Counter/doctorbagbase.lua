local DownCounter = DownCounter or _G.DownCounterStandalone

Hooks:PostHook(DoctorBagBase, "take", "dcs_docbagbase_take", function(self, unit)
--todo test prehook and PlayerDamage._revives
--should i even use direct self._revives? prob not since this is just restoring/setting to zero
	if not self._empty and DownCounter:IsAlertModeAll() and LuaNetworking:IsMultiplayer() and DownCounter:AnnounceDocBags() then
		local my_name = (managers.network and managers.network.account and managers.network.account:username()) or "ChadHeister McSexHaver"
		local downs = DownCounter.counter[LuaNetworking:LocalPeerID()] or "[ERROR]"
		local message = my_name .. " used a doctor bag and restored " .. tostring(downs) .. (downs == 1 and " down." or " downs.")

		if downs == 0 then 
			message = message .. " Sometimes, I look back at my life and regret everything."
		end
		DownCounter:Announce(message)
	end
end)

Hooks:PostHook(DoctorBagBase, "take", "khud_docbagbase_take", function(self, unit)
	if not self._empty and KineticHUD:DownCounter_IsAlertModeAll() and LuaNetworking:IsMultiplayer() and KineticHUD:DownCounter_AnnounceDocBags() then
		local my_name = (managers.network and managers.network.account and managers.network.account:username()) or "ChadHeister McSexHaver"
		local downs = KineticHUD:DownCounter_GetDowns() or "[ERROR]"
		local message = my_name .. " used a doctor bag and restored " .. tostring(downs) .. (downs == 1 and " down." or " downs.")

		if downs == 0 then 
			message = message .. " If only they were good at video games..."
		end
		KineticHUD:DownCounter_Announce(message)
	end
end)

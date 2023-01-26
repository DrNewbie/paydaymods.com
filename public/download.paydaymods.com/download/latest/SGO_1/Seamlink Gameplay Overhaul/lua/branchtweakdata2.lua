--PRO MODE, Frenzy enabled = 0 health
if not SGO or SGO.settings.use_prom ~= 2 then return end
local data = UpgradesTweakData._init_pd2_values
function UpgradesTweakData:_init_pd2_values()
	data(self, tweak_data)
	self.values.player.max_health_reduction = {	0.001 }
end

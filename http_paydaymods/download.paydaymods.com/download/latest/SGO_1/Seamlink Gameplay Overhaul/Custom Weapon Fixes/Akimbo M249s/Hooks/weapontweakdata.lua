Hooks:PostHook( WeaponTweakData, "init", "AkimbolmgInit", function(self)
	local dlc_data = Global.dlc_manager.all_dlc_data["gage_pack_lmg"]
	if not dlc_data.verified then
		self.x_m249.CLIP_AMMO_MAX = 0
		self.x_m249.AMMO_MAX = 0
		self.x_m249.name_id = "bm_w_nom249"
	end
self.x_m249.sub_category = "lmg"
self.x_m249.stats.reload = 30
self.x_m249.AMMO_MAX = 400
self.x_m249.CLIP_AMMO_MAX = 400
self.x_m249.stats.recoil= 32
self.x_m249.stats.spread= 20
self.x_m249.stats.suppression = 0
self.x_m249.stats.alert_size = 20
self.x_m249.AMMO_PICKUP = {30, 50}
end )
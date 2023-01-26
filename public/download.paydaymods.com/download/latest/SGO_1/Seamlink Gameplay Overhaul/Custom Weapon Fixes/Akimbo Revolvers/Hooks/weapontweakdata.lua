Hooks:PostHook( WeaponTweakData, "init", "AkimborevolverInit", function(self)
	local dlc_data = Global.dlc_manager.all_dlc_data["arena"]
	if not dlc_data.verified then
		self.x_mateba.CLIP_AMMO_MAX = 0
		self.x_mateba.AMMO_MAX = 0
		self.x_mateba.stats.spread = 0		
		self.x_mateba.stats.damage = 0
		self.x_mateba.stats.extra_ammo = 0
		self.x_mateba.stats.total_ammo_mod = 0		
		self.x_mateba.AMMO_PICKUP = {0, 0}	
		self.x_mateba.name_id = "bm_w_nomateba"
	end
	local dlc_data = Global.dlc_manager.all_dlc_data["west"]
	if not dlc_data.verified then
		self.x_peace.CLIP_AMMO_MAX = 0	
		self.x_peace.AMMO_MAX = 0
		self.x_peace.stats.damage = 0
		self.x_peace.stats.spread = 0
		self.x_peace.stats.extra_ammo = 0
		self.x_peace.AMMO_PICKUP = {0, 0}			
		self.x_peace.stats.total_ammo_mod = 0
		self.x_peace.name_id = "bm_w_nopeace"
	end
self.x_raging.category = "akimbo"
self.x_raging.sub_category = "revolver"
self.x_raging.upgrade_blocks = {
	weapon = {
		"clip_ammo_increase"
	}
	}
self.x_raging.stats.reload = 30
self.x_raging.use_data.selection_index = 2
self.x_raging.FIRE_MODE = "single"
self.x_raging.CAN_TOGGLE_FIREMODE = false
self.x_raging.animations.has_steelsight_stance = true
self.x_raging.AMMO_MAX = 48
self.x_raging.CLIP_AMMO_MAX = 12
self.x_raging.stats.recoil= 32
self.x_raging.stats.value = 3
self.x_raging.stats.spread= 32
self.x_raging.stats.suppression = 3
self.x_raging.stats.alert_size = 7

self.x_peace.category = "akimbo"
self.x_peace.sub_category = "revolver"
self.x_peace.upgrade_blocks = {
	weapon = {
		"clip_ammo_increase"
	}
	}
self.x_peace.stats.reload = 30
self.x_peace.use_data.selection_index = 2
self.x_peace.FIRE_MODE = "single"
self.x_peace.CAN_TOGGLE_FIREMODE = false
self.x_peace.animations.has_steelsight_stance = true
self.x_peace.AMMO_MAX = 48
self.x_peace.CLIP_AMMO_MAX = 12
self.x_peace.stats.recoil= 32
self.x_peace.stats.spread_moving = 32
self.x_peace.stats.value = 2
self.x_peace.stats.spread= 32
self.x_peace.stats.suppression = 5
self.x_peace.stats.alert_size = 7

self.x_mateba.category = "akimbo"
self.x_mateba.sub_category = "revolver"
self.x_mateba.upgrade_blocks = {
	weapon = {
		"clip_ammo_increase"
	}
	}
self.x_mateba.stats.reload = 30
self.x_mateba.use_data.selection_index = 2
self.x_mateba.FIRE_MODE = "single"
self.x_mateba.CAN_TOGGLE_FIREMODE = false
self.x_mateba.animations.has_steelsight_stance = true
self.x_mateba.AMMO_MAX = 42
self.x_mateba.CLIP_AMMO_MAX = 12
self.x_mateba.stats.recoil= 32
self.x_mateba.stats.spread= 32
self.x_mateba.stats.spread_moving = 32
self.x_mateba.stats.value = 6
self.x_mateba.stats.suppression = 7
self.x_mateba.stats.alert_size = 7
end )
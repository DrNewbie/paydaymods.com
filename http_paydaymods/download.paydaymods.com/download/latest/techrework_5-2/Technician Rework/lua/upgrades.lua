local data = UpgradesTweakData.init
function UpgradesTweakData:init(tweak_data)
	data(self, tweak_data)
	
	self.values.player.percussive_maintenance = {0.35}
	self.values.player.melee_ammo_replenish_chance = {0.1}
	self.values.player.melee_ammo_replenish = {0.1}
	self.values.player.level_interaction_timer_multiplier = {0.8}
	self.definitions.player_interaction_speed = {
		category = "feature",
		name_id = "interact_speed",
		upgrade = {
			category = "player",
			upgrade = "level_interaction_timer_multiplier",
			value = 1
		}
	}
	self.definitions.player_percussive_maintenance = {
		category = "feature",
		name_id = "percussive_maintenance",
		upgrade = {
			category = "player",
			upgrade = "percussive_maintenance",
			value = 1
		}
	}
	self.definitions.player_melee_ammo_replenish_chance = {
		category = "feature",
		name_id = "replenish_chance",
		upgrade = {
			category = "player",
			upgrade = "melee_ammo_replenish_chance",
			value = 1
		}
	}
	self.definitions.player_melee_ammo_replenish = {
		category = "feature",
		name_id = "replenish_amount",
		upgrade = {
			category = "player",
			upgrade = "melee_ammo_replenish",
			value = 1
		}
	}
	
	self.values.weapon.drop_reload = {0.85}
	self.values.team.weapon.drop_reload = {0.85}
	self.values.weapon.mag_increase = {1.22, 1.42}
	self.values.assault_rifle.spread_index_addend = {1, 3}
	self.definitions.ar_acc_increase_1 = {
		category = "feature",
		name_id = "ar_acc_increase_1",
		upgrade = {
			category = "assault_rifle",
			upgrade = "spread_index_addend",
			value = 1
		}
	}
	self.definitions.ar_acc_increase_2 = {
		category = "feature",
		name_id = "ar_acc_increase_2",
		upgrade = {
			category = "assault_rifle",
			upgrade = "spread_index_addend",
			value = 2
		}
	}
	self.definitions.weapon_mag_increase_1 = {
		category = "feature",
		name_id = "mag_increase_1",
		upgrade = {
			category = "weapon",
			upgrade = "mag_increase",
			value = 1
		}
	}
	self.definitions.weapon_mag_increase_2 = {
		category = "feature",
		name_id = "mag_increase_2",
		upgrade = {
			category = "weapon",
			upgrade = "mag_increase",
			value = 2
		}
	}
	self.definitions.weapon_drop_reload_1 = {
		category = "feature",
		name_id = "drop_reload_1",
		upgrade = {
			category = "weapon",
			upgrade = "drop_reload",
			value = 1
		}
	}
	--[[self.definitions.weapon_drop_reload_2 = {
		category = "feature",
		name_id = "drop_reload_2",
		upgrade = {
			category = "weapon",
			upgrade = "drop_reload",
			value = 2
		}
	}]]
	self.definitions.team_drop_reload = {
		category = "team",
		name_id = "drop_reload_buff",
		upgrade = {
			category = "weapon",
			upgrade = "drop_reload",
			value = 1
		}
	}
end
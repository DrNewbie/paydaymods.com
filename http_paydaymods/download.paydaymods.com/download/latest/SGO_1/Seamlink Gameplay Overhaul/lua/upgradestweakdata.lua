if not SGO or not SGO.settings.use_perkb then return end
local pd2_val = UpgradesTweakData._init_pd2_values
	 
	function UpgradesTweakData:_init_pd2_values()
		pd2_val(self)
		self.values.player.damage_to_hot = {
		0.2,
		0.3,
		0.4,
		0.5
	}
	self.values.player.damage_to_hot_extra_ticks = {6}
	self.damage_to_hot_data = {
		armors_allowed = {"level_1", "level_2"},
		works_with_armor_kit = true,
		tick_time = 0.5,
		total_ticks = 12,
		max_stacks = false,
		stacking_cooldown = 0.5,
		add_stack_sources = {
			bullet = true,
			explosion = true,
			melee = true,
			taser_tased = true,
			poison = true,
			fire = true,
			swat_van = true,
			civilian = true
		}
	}	
end


Hooks:PostHook(UpgradesTweakData, "_init_pd2_values", "ManiacBuffUpgradeValues", function(self)

	self.cocaine_stacks_convert_levels = {30, 25}
	self.cocaine_stacks_dmg_absorption_value = 0.1
	self.cocaine_stacks_tick_t = 3
	self.max_cocaine_stacks_per_tick = 240
	self.max_total_cocaine_stacks = 600
	self.cocaine_stacks_decay_t = 12
	self.cocaine_stacks_decay_amount_per_tick = 80
	self.cocaine_stacks_decay_percentage_per_tick = 0.6
	self.values.player.cocaine_stacking = {1}
	self.values.player.sync_cocaine_stacks = {true}
	self.values.player.cocaine_stacks_decay_multiplier = {0.5}
	self.values.player.sync_cocaine_upgrade_level = {2}
	self.values.player.cocaine_stack_absorption_multiplier = {1.5}

end)

Hooks:PostHook(UpgradesTweakData, "_init_pd2_values", "CrookBuffUpgradeValues", function(self)

	self.values.player.level_2_armor_multiplier = {
		1.25,
		1.50,
		1.75
	}
	self.values.player.level_3_armor_multiplier = {
		1.25,
		1.50,
		1.75
	}
	self.values.player.level_4_armor_multiplier = {
		1.25,
		1.50,
		1.75
	}

	self.values.player.level_2_dodge_addend = {
		0.10,
		0.20,
		0.30
	}
	self.values.player.level_3_dodge_addend = {
		0.10,
		0.20,
		0.30
	}
	self.values.player.level_4_dodge_addend = {
		0.10,
		0.20,
		0.30
	}

end)

if not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/assaulttweaks.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/coplogicattack.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/coplogicidle.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/coplogictravel.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/enemymanager.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/groupaistatebase.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/spooclogicattack.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/tankcoplogicattack.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/shieldlogicattack.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/rebalanceissues.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/sync.lua")
then
log("You have messed with SGO, reinstall it.")
	os.exit()
end
--]]
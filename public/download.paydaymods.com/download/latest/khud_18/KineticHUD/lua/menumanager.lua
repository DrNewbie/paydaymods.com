
_G.KineticHUD = {}

KineticHUD.ModID = "KineticHUD"

KineticHUD._path = ModPath

KineticHUD._save_path = SavePath .. "KineticHUD.txt"

KineticHUD._cartographer_data_path = KineticHUD._path .. "cartographer/"

KineticHUD.firemode_safety = "safe" --for included "weapon safety" mod

KineticHUD.msg_DownCounter = "DownCounterStandalone"
KineticHUD.msg_SyncAssault = "SyncAssaultPhase"

--=======================--
--*********DATA**********--
--=======================--

KineticHUD.buff_data = { --loosely sorted by developmental priority, in descending order
	["dmg_resist_total"] = { --aggregated
		menu_title = "Show Total Damage Resistance [autodetect]",
		icon = "juggernaut", --naut too sure about this icon. --drop_soap?
		icon_rect = {1,7},
		label = "Damage Resist",
		buff_type = "buff",
		value_type = "value",
		source = "skill",
		flash = false
	},
	["crit_chance_total"] = { --aggregated
		menu_title = "Show Total Crit Chance [autodetect]",
		icon = "backstab",
		icon_rect = {1,7},
		label = "Crit Chance",
		buff_type = "buff",
		value_type = "value",
		source = "skill",
		flash = false
	},
	["dodge_chance_total"] = {
		menu_title = "Show Total Dodge Chance [autodetect]",
		icon = "jail_diet", --'dance_instructor' is pistol mag bonus
		icon_rect = {1,7},
		label = "Dodge Chance",
		buff_type = "buff",
		value_type = "value",
		source = "skill",
		flash = false
	},
	["hp_regen"] = { --aggregated, standard timed-healing from multiple sources (muscle, hostage taker, etc)
		menu_title = "Health Regen (Aggregated)",
		icon = 17, --chico perk deck
		icon_tier = 3, --heart with hollow +  
		icon_rect = {1,1},
		persistent_timer = true,
		label = "Health Regen",
		duration = 10,
		value_type = "timer",
		source = "perk",
		text_color = Color("FFD700"),
		flash = false
	},
	["long_dis_revive"] = { --cooldown; done
		menu_title = "Inspire Aced Cooldown",
		icon = "inspire",
		icon_rect = {4,9},
		label = "Inspire Cooldown",
		value_type = "timer",
		duration = 20,
		source = "skill",
		text_color = Color("E84F4F"), --orangey-red; todo tweakdata/standardise this
		flash = true
	},
	["morale_boost"] = {
		menu_title = "Inspire Basic",
		icon = "inspire",
		icon_rect = {4,9},
		label = "Inspire Basic",
		value_type = "timer",
		duration = 4,
		source = "skill",
		flash = false
	},
	["flashbang"] = { --owww my eyes; temp disabled
		menu_title = "Flashbang",
		icon = "concussion_grenade", --if no source is specified, use this icon tweak data
		icon_rect = {1,7}, --if source is "manual" then use "icon" as path and "icon_rect" to find bitmap
		label = "Blind", --display name
		text_color = Color.black:with_alpha(0.3),
		icon_color = Color.red:with_alpha(0.5),
		value_type = "timer", --value calculation type
		source = "icon", --where to get icon (not directly related to where ingame buff came from)
		flash = true --alpha sine flash if true
	},
	["downed"] = { --bleedout;  mugshot_in_custody; done
		menu_title = "Downed",
		disabled = true,
		icon = "mugshot_downed",
		icon_rect = {240,464,48,48},
		label = "Downed",
		text_color = Color("FF2E2E"),
		value_type = "timer",
		duration = 30,
		source = "icon",
		flash = false
	},
	["tased"] = { --yellow icon?
		icon = "mugshot_electrified",--skill icon "insulation",
		icon_rect = {1,7},
		label = "Tased",
		icon_color = Color.white,
		text_color = Color("E84F4F"),
		value_type = "timer",
		source = "icon",
		flash = true
	},
	["electrocuted"] = {--not referenced, probably
		icon = "mugshot_electrified",
		icon_rect = {1,7},
		label = "Electrocuted",
		icon_color = Color.yellow,
		text_color = Color("E84F4F"),
		buff_type = "debuff",
		value_type = "timer",
		source = "icon",
		flash = true
	},
	["swan_song"] = { --state duration
		icon = "perseverance",
		icon_rect = {1,7},
		duration = 3, --6 aced
		label = "Swan Song",
		text_color = Color("FF5F5C"), --red
		buff_type = "buff",
		value_type = "timer",
		source = "skill",
		flash = false
	},
	["messiah_charge"] = { --has messiah charge left; TODO
		icon = "messiah",
		icon_rect = {1,7},
		label = "Messiah Charge",
		buff_type = "buff",
		value_type = "value", --just in case multiple messiah charges is ever implemented, or modded in
		source = "skill",
		flash = false
	},
	["bullseye"] = { --internally, "prison_wife"
		icon = "prison_wife",
		icon_rect = {6,11},
		label = "Bullseye",
		buff_type = "buff",
		value_type = "timer",
		text_color = Color("E84F4F"), --orangey-red
		duration = 2.5, --td.values.player.headshot_regen_armor_bonus[2]
		source = "skill",
		flash = true
	},
	["wild_kill_counter"] = {
		menu_title = "Biker Kills Tracker",
		icon = 16,
		icon_tier = 1,
		icon_rect = {1,7},
		label = "Prospect",
		buff_type = "buff",
		value_type = "value",
		text_color = Color.white,
		icon_color = Color.white,
		source = "perk",
		flash = true
	},
	["grinder"] = {
		menu_title = "Grinder Healing over Time",
		icon = 11,
		icon_tier = 1, --overridden by tier_floors
		tier_floors = {1,3,5,7,9},
		icon_rect = {6,1},
		label = "Grinder",
		buff_type = "buff",
		value_type = "value",
		source = "perk",
		flash = false
	},
	["uppers_aced_cooldown"] = { --20 seconds but tweakdata says 500???
		menu_title = "Uppers Aced Cooldown",
		icon = "tea_cookies",
		icon_rect = {1,7},
		label = "Uppers Cooldown",
		text_color = Color("FF5F5C"), --red
		value_type = "timer",
		source = "skill",
		flash = false
	},
	["anarchist_armor_regen"] = {
		menu_title = "Anarchist Armor Grinding",
		icon = 15,
		icon_tier = 1,
		icon_rect = {1,7},
		label = "Blitzkrieg Bop",
		persistent_timer = true,
		text_color = Color("FFD700"),
		value_type = "timer",
		source = "perk",
		flash = false
	},
	["armor_break_invulnerable"] = { --anarchist/armorer; game adds this buff as a cooldown for the invulnerability itself
		menu_title = "Armorer 7/9 & Anarchist 1/9 Invulnerability",
		icon = 15,
		icon_tier = 1,
		icon_rect = {1,7},
		label = "Invulnerable",
		text_color = Color("FF5F5C"),--red for 15s cooldown; blue for 2s invuln period
		value_type = "timer",
		source = "perk",
		flash = false
	},
	["chico_injector"] = { --DONE
		icon = 17,--"chico_injector",
		icon_tier = 1,
		icon_rect = {1,7},
		label = "Kingpin Injector",
		icon_color = Color("FFD700"), --the same yellow as tf2's "unique" quality items lol
		value_type = "timer",
		source = "perk",
		flash = true
	},
	["pocket_ecm_jammer"] = {
		icon = 21,--"pocket_ecm_jammer",
		icon_tier = 1,
		icon_rect = {1,7},
		label = "Pocket ECM Jammer",
		value_type = "timer",
		source = "perk",
		flash = true
	},
	["pocket_ecm_kill_dodge"] = {
		menu_title = "Pocket ECM Dodge Bonus",
		icon = 21,--"pocket_ecm_jammer",
		icon_tier = 7,
		icon_rect = {1,7},
		label = "Kluge",
		buff_type = "buff",
		value_type = "timer",
		source = "perk",
		flash = false
	},
	["hysteria"] = { --hysteria; internally identical to absorption, so i just called it absorption 
		icon = 14, --index for perk deck "maniac". todo recategorize
		icon_rect = {1,7},
		icon_tier = 1,
		label = "Damage Absorption",
		buff_type = "buff",
		value_type = "value",
		source = "perk",
		flash = true
	
	},
	["berserker_damage_multiplier"] = { --low health; show damage %l DONE
		menu_title = "Berserker Melee Damage Boost % [autodetect]",
		icon = "wolverine",
		icon_rect = {1,7},
		label = "Berserker",
		buff_type = "buff",
		value_type = "value",
		source = "skill",
		flash = true
	},
	["berserker_melee_damage_multiplier"] = {
		disabled = true,
		menu_title = "Berserker Hitscan Damage Boost % [autodetect]",
		icon = "wolverine",
		icon_rect = {1,7},
		label = "Berserker",
		buff_type = "buff",
		value_type = "value",
		source = "skill",
		flash = true
	},
	["throwable_cooldown"] = { --perk deck ability cooldown timer; TODO? probably best to do for every individual one
		icon = "grenade",
		icon_rect = {1,7},
		label = "Ability Cooldown",
		buff_type = "debuff",
		value_type = "timer",
		source = "special",
		flash = true
	},
	["bullet_storm"] = { --infinite ammo; DONE
		icon = "ammo_reservoir",
		icon_rect = {0,3},
		label = "Bulletstorm",
		buff_type = "buff",
		value_type = "timer",
		source = "skill",
		flash = false	
	},
	["unseen_strike"] = { --show duration; TODO remove buff when cancelled
		icon = "unseen_strike",
		icon_rect = {1,7},
		label = "Unseen Strike",
		duration = 18, --debug purposes only; t is passed
		buff_type = "buff",
		value_type = "timer",
		source = "skill",
		flash = false
	},
	["overkill_damage_multiplier"] = { -- shotgun damage buff; anything below here is probably not done
		icon = "overkill",
		icon_rect = {1,7},
		label = "Overkill",
		buff_type = "buff",
		value_type = "timer",
		source = "skill",
		flash = false
	},
	["bloodthirst_melee"] = { --gun kills increase melee damage stacks; TODO
		disabled = true, --todo
		icon = "bloodthirst", --assassin?
		icon_rect = {1,7},
		label = "Bloodthirst",
		buff_type = "buff",
		value_type = "value", --not sure
		source = "skill",
		flash = false
	},
	["bloodthirst_reload_speed"] = { --reload speed increase after melee; DONE
		icon = "bloodthirst",
		icon_rect = {1,7},
		label = "Bloodthirst Aced",
		buff_type = "buff",
		value_type = "timer",
		duration = 10,
		source = "skill",
		flash = false	
	},
	["team_damage_speed_multiplier_received"] = {
		icon = "scavenger",
		icon_rect = {10,9},
		label = "Second Wind",
		buff_type = "buff",
		value_type = "timer",
		duration = 5,
		source = "skill",
		flash = false
	},
	["damage_speed_multiplier"] = { --movespeed on armor break; DONE. procs every frame, though. should prob look into that
		icon = "scavenger",
		icon_rect = {10,9},
		label = "Second Wind",
		buff_type = "buff",
		value_type = "timer",
		duration = 5,
		source = "skill",
		flash = false
	},
	["sixth_sense"] = { --mark while still; cooldown to next use; not sure
		disabled = true,
		icon = "chameleon",
		icon_rect = {1,7},
		label = "Sixth Sense",
		buff_type = "buff",
		value_type = "timer",
		source = "skill",
		flash = false
	},
	["up_you_go"] = { --dmg resist after revive? i might be confusing two buffs
		duration = 10, --debug purposes only, as t is passed
		icon = "up_you_go",
		icon_rect = {1,7},
		label = "Up You Go",
		buff_type = "buff",
		value_type = "timer",
		source = "skill",
		flash = false
	},
	["revive_damage_reduction"] = { 
		icon = "up_you_go",
		disabled = true,
		icon_rect = {1,7},
		label = "Combat Medic",
		buff_type = "buff",
		value_type = "timer",
		duration = 5,
		source = "skill",
		flash = false
	},
	["running_from_death"] = { --reload + swap faster after revive
		icon = "running_from_death",
		icon_rect = {1,7},
		label = "Running From Death",
		buff_type = "buff",
		value_type = "timer",
		duration = 10,
		source = "skill",
		flash = false	
	},
	["running_from_death_aced"] = { --run faster after revive; not called?
		icon = "running_from_death",
		icon_rect = {1,7},
		label = "Running From Death Aced",
		buff_type = "buff",
		value_type = "timer",
		duration = 10,
		source = "skill",
		flash = true	
	},
	["trigger_happy"] = { --damage boost on pistol hit
		icon = "trigger_happy",
		icon_rect = {1,7},
		label = "Trigger Happy",
		buff_type = "buff",
		value_type = "timer",
		duration = 2, --4 aced
		source = "skill",
		flash = false
	},
	["desperado"] = { --accuracy boost on pistol hit
		icon = "expert_handling",
		icon_rect = {1,7},
		label = "Desperado",
		buff_type = "buff",
		value_type = "timer",
		duration = 10,
		source = "skill",
		flash = false
	},
	["partners_in_crime"] = { --move speed w/ hostage; todo
		icon = "control_freak",
		icon_rect = {1,7},
		label = "Partners In Crime",
		buff_type = "buff",
		value_type = "status",
		source = "skill",
		flash = false
	},
	["partners_in_crime_aced"] = { --hp+ with hostage; todo
		icon = "control_freak",
		icon_rect = {1,7},
		label = "Partners In Crime Aced",
		buff_type = "buff",
		value_type = "status",
		source = "skill",
		flash = false,
	},
	["single_shot_fast_reload"] = { --single headshot reload speed; DONE
		icon = "speedy_reload",
		icon_rect = {1,7},
		label = "Aggressive Reload",
		buff_type = "buff",
		value_type = "timer",
		duration = 4,
		source = "skill",
		flash = false
	},
	["reload_weapon_faster"] = { --revenant skill tree thing
		disabled = true,
		icon = "speedy_reload",
		icon_rect = {1,7},
		label = "reload_weapon_faster",
		buff_type = "buff",
		value_type = "timer",
		duration = 4,
		source = "skill",
		flash = false
	},
	["swap_weapon_faster"] = { --revenant skill tree thing
		disabled = true,
		icon = "speedy_reload",
		icon_rect = {1,7},
		label = "swap_weapon_faster",
		buff_type = "buff",
		value_type = "timer",
		duration = 4,
		source = "skill",
		flash = false
	},
	["revived_damage_resist"] = { --revenant skill tree thing
		disabled = true,
--		icon = "speedy_reload",
		icon_rect = {1,7},
		label = "swap_weapon_faster",
		buff_type = "buff",
		value_type = "timer",
		duration = 4,
		source = "skill",
		flash = false
	},
	["increased_movement_speed"] = { --revenant skill tree thing
		disabled = true,
		icon = "running_from_death",
		icon_rect = {1,7},
		label = "Running From Death 2",
		buff_type = "buff",
		value_type = "timer",
		duration = 4,
		source = "skill",
		flash = false
	},
	["lock_n_load"] = { --auto multikills reload speed from skilltree "lock n load"; DONE
		icon = "shock_and_awe",
		icon_rect = {1,7},
		label = "Lock N Load",
		buff_type = "buff",
		value_type = "value",
		source = "skill",
		flash = false
	},
	["dmg_multiplier_outnumbered"] = { --underdog dmg boost; DONE
		icon = "underdog",
		icon_rect = {1,7},
		label = "Underdog Basic",
		buff_type = "buff",
		value_type = "timer",
		source = "skill",
		flash = false
	},
	["dmg_dampener_outnumbered"] = { --underdog dmg resist; DONE
		icon = "underdog",
		icon_rect = {1,7},
		label = "Underdog Aced",
		buff_type = "buff",
		value_type = "timer",
		source = "skill",
		flash = false
	}, --todo stockholm syndrome aced charge
	["dmg_dampener_close_contact"] = { --dmg resist; activates in conjuction with underdog but lasts 5 seconds??? ovk y u do dis
		disabled = true,
		icon = "underdog",
		icon_rect = {1,7},
		label = "I have no idea",
		buff_type = "buff",
		value_type = "timer",
		source = "skill",
		flash = false
	},	
	["dmg_dampener_outnumbered_strong"] = { --same as above, but aced
		disabled = true,
		icon = "underdog",
		icon_rect = {1,7},
		label = "I have no idea Aced",
		buff_type = "buff",
		value_type = "timer",
		source = "skill",
		flash = false
	},
	["combat_medic_damage_multiplier"] = {
		disabled = true
	},
	["combat_medic_enter_steelsight_speed_multiplier"] = {
		disabled = true
	},
	["first_aid_damage_reduction"] = { --120s 10% damage reduction from using fak/docbag
		icon = "tea_time",
		icon_rect = { 1,11 },
		label = "Quick Fix Aced",
		value_type = "timer",
		source = "skill",
		flash = false	
	}
}

KineticHUD.quickchat_data = {
	{ --order doesn't matter
		name = "Help", --mandatory
		text = "Help!", --if "text" is present, sends "text" in chat, prepended by "(Voice) "
		sound = "f11e_plu", --if "sound" is present, plays "sound" file to all players
		anim = "cmd_come" --if "anim" is present, performs "anim" hand viewmodel animation
	},
	{
		name = "Thanks",
		text = "Thanks!",
		sound = "s05x_sin"
	},
	{
		name = "$#%!",
		text = "$#%!",
		sound = "g60" --g29
	},
	{
		name = "GET DOWN!", --note: this will not actually intimidate civilians
		sound = "f02b_sin",
		anim = "cmd_down"
	},
	{
		name = "Need Ammo!",
		text = "Need ammo!",
		sound = "g81x_plu"		
	},
	{
		name = "Need Medbag!",
		text = "Need a medbag!",
		sound = "g80x_plu"		
	},
	{
		name = "Get 'em!",
		sound = "g23",
		anim = "cmd_point"
	},
	{
		name = "Go!",
		text = "Go! Go! Go!",
		sound = "g07",
		anim = "cmd_gogo"
	},
	{
		name = "Hello",
		sound = "v56",
		anim = "cmd_stop"
	},
	{
		name = "Bain?!",
		sound = "v35"
	},
	{
		name = "Left!",
		text = "Go Left!",
		sound = "g03",
		anim = "cmd_gogo"
	},
	{
		name = "Right!",
		text = "Go Right!",
		sound = "g04",
		anim = "cmd_gogo"
	},
	{
		name = "YES!",
		sound = "v46",
		anim = "cmd_gogo"
	},
	{
		name = "[Excited yell]",
		sound = "v55",
		anim = "cmd_gogo"
	},
	{
		name = "Shoot 'em!",
		sound = "v49",
		anim = "cmd_gogo"
	},
	{
		name = "Go loud!",
		sound = "p47",
		anim = "cmd_gogo"
	}
}

KineticHUD.cartographer_data = {
	["Bank Heist"] = {
		{
			location = "Vantage Point",
			x_lower = -1975,
			y_lower = -2050,
			z_lower = 250,
			x_upper = -1175,
			y_upper = -1675,
			z_upper = 1000
		},
		{
			location = "wheeeeeeeee",
			x_lower = -1975,
			y_lower = -1650,
			z_lower = 400,
			x_upper = -1175,
			y_upper = -300, --anywhere from -300 to 0, really
			z_upper = 1000
		},
		{
			location = "Rest Area",
			x_lower = -1175,
			y_lower = 0,
			z_lower = -25,
			x_upper = 0,
			y_upper = 800,
			z_upper = 375
		},
		{
			location = "North Alley",
			x_lower = 1850,
			y_lower = 3350,
			z_lower = -25,
			x_upper = 3000,
			y_upper = 3775,
			z_upper = 1000
		},
		{
			location = "Trash Alley",
			x_lower = -5175,
			y_lower = -2400,
			z_lower = -25,
			x_upper = -4825,
			y_upper = -1750,
			z_upper = 1000
		},
		{
			location = "West Alley",
			x_lower = -4000,
			y_lower = -2625,
			z_lower = -25,
			x_upper = -3625,
			y_upper = -1750,
			z_upper = 1000
		},
		{
			location = "East Alley",
			x_lower = -1175,
			y_lower = -3000,
			z_lower = -25,
			x_upper = -825,
			y_upper = -1750,
			z_upper = 1000
		},
		{--todo: vantage point, vault inside (a/b)
			location = "Main Street",
			x_lower = -6000,
			y_lower = -1675,
			z_lower = -25,
			x_upper = 1800,
			y_upper = -35,
			z_upper = 1000
		},
		{
			location = "Second Street",
			x_lower = 25,
			y_lower = -35,
			z_lower = -25,
			x_upper = 1800,
			y_upper = 4500,
			z_upper = 1000
		},
		{
			location = "Third Street",
			x_lower = -8000,
			y_lower = -4800,
			z_lower = -25,
			x_upper = -6000,
			y_upper = 0,
			z_upper = 1000
		},
		{
			location = "Lobby", --"Customer Waiting Area"
			x_lower = -2000,
			y_lower = 0,
			z_lower = -25,
			x_upper = -1250,
			y_upper = 1575,
			z_upper = 400
		},
		{
			location = "Pre-Vault Area A",
			x_lower = -2400,
			y_lower = 1250,
			z_lower = -25,
			x_upper = -2025,
			y_upper = 1775,
			z_upper = 400
		},
		{
			location = "Vault", --location B
			x_lower = -2475,
			y_lower = 1825,
			z_lower = -25,
			x_upper = -1800, -- -1825
			y_upper = 2475,
			z_upper = 400
		},
		{
			location = "Staff Entrance",
			x_lower = -3200,
			y_lower = 800,
			z_lower = -25,
			x_upper = -2750,
			y_upper = 1200, --or 600 in stairs
			z_upper = 400
		},
		{
			location = "Tellers Area",
			x_lower = -2775,
			y_lower = 0,
			z_lower = -25,
			x_upper = -2000,
			y_upper = 1575,
			z_upper = 400
		},
		{
			location = "Supplies & Copy Room", -- "Office Supplies & Access Corridor" is too long
			x_lower = -1875,
			y_lower = 1600,
			z_lower = -25,
			x_upper = -1255,
			y_upper = 2000,
			z_upper = 400
		},
		{
			location = "Manager's Office",
			x_lower = -500,
			y_lower = 2400,
			z_lower = -25,
			x_upper = 0,
			y_upper = 3000,
			z_upper = 400
		},
		{
			location = "Pre-Vault Area B",
			x_lower = -1800,---1575,
			y_lower = 2000,
			z_lower = -25,
			x_upper = -1250,
			y_upper = 2400,
			z_upper = 400
		},
		{
			location = "Office Area",
			x_lower = -1250,
			y_lower = 825,
			z_lower = -25,
			x_upper = 0,
			y_upper = 2400,
			z_upper = 400
		},
		{
			location = "Security Room A",
			x_lower = -3125,
			y_lower = 1300,
			z_lower = -25,
			x_upper = -2775,
			y_upper = 1750,
			z_upper = 400
		},
		{
			location = "Security Room B",
			x_lower = -1550,
			y_lower = 2450,
			z_lower = -25,
			x_upper = -1224,
			y_upper = 2725,
			z_upper = 400
		},
		{
			location = "Side Roof Access",
			x_lower = -3200,
			y_lower = 0,
			z_lower = -25,
			x_upper = -2800,
			y_upper = 800,
			z_upper = 1000
		},
		{
			location = "Back Roof Access",
			x_lower = -1400,
			y_lower = 2600,
			z_lower = 120,
			x_upper = -1000,
			y_upper = 3375,
			z_upper = 1000
		},
		{
			location = "Back Entrance",
			x_lower = -1200, --1000 for just the passageway + outside
			y_lower = 2400,
			z_lower = -25,
			x_upper = -550,
			y_upper = 3375,
			z_upper = 120
		},
		{
			location = "In a tree. Weirdo.",
			x_lower = -270,
			y_lower = 200,
			z_lower = 375,
			x_upper = -110,
			y_upper = 360,
			z_upper = 1000
		},
		{
			location = "Roof",
			x_lower = -2800,
			y_lower = 0,
			z_lower = 400,
			x_upper = 100,
			y_upper = 3250,
			z_upper = 1000
		},
		{
			location = "Parking Lot",
			x_lower = -5325,
			y_lower = 0,
			z_lower = -25,
			x_upper = -25,
			y_upper = 4475,
			z_upper = 1000
		}
	},
	["Escape: Overpass"] = {
		{
			location = "Parking Lot",
			x_lower = 425,
			y_lower = 5500,
			z_lower = 5000,
			x_upper = 2425,
			y_upper = 9450,
			z_upper = 5500
		},
		{
			location = "Bridge",
			x_lower = 425,
			y_lower = 5500,
			z_lower = 5000,
			x_upper = 2425,
			y_upper = 9450,
			z_upper = 5500
		}
	},
	["heist_rat_hl"] = { --standalone and rats d1
		{
			location = "Rooftop Vantage Point",
			x_lower = 1400,
			y_lower = 200,
			z_lower = 2000,
			x_upper = 2500,
			y_upper = 1600,
			z_upper = 3000
		},
		{
			location = "Hiding",
			x_lower = 1600,
			y_lower = 1200,
			z_lower = 1900,
			x_upper = 1625,
			y_upper = 1300,
			z_upper = 1920
		},
		{
			location = "Shed Front Yard",
			x_lower = 925,
			y_lower = -650,
			z_lower = 1200,
			x_upper = 1125,
			y_upper = -200,
			z_upper = 1500
		},
		{
			location = "Shed Back Yard",
			x_lower = 2550,
			y_lower = 375,
			z_lower = 1125,
			x_upper = 2750,
			y_upper = 800,
			z_upper = 2500
		},
		{
			location = "1F Porch",
			x_lower = 1350,
			y_lower = 250,
			z_lower = 1220,
			x_upper = 1500,
			y_upper = 800,
			z_upper = 1425
		},
		{
			location = "1F Lab",
			x_lower = 1575,
			y_lower = 375,
			z_lower = 1325,
			x_upper = 2250,
			y_upper = 1500,
			z_upper = 1725
		},
		{
			location = "1F Bathroom",
			x_lower = 2100,
			y_lower = 375,
			z_lower = 1300,
			x_upper = 2250,
			y_upper = 700,
			z_upper = 1700
		},
		{
			location = "2F Balcony",
			x_lower = 2300,
			y_lower = 350,
			z_lower = 1725,
			x_upper = 2500,
			y_upper = 1000,
			z_upper = 1900
		},
		{
			location = "2F Bedroom",
			x_lower = 1575,
			y_lower = 1200,
			z_lower = 1725,
			x_upper = 2250,
			y_upper = 1450,
			z_upper = 1925
		},
		{
			location = "2F Lab",
			x_lower = 1575,
			y_lower = 375,
			z_lower = 1725,
			x_upper = 2300,
			y_upper = 1450,
			z_upper = 1925
		},
		{
			location = "Front Yard",
			x_lower = 1,
			y_lower = 1,
			z_lower = 1,
			x_upper = 1,
			y_upper = 1,
			z_upper = 1
		},
		{
			location = "Back Yard",
			x_lower = 1,
			y_lower = 1,
			z_lower = 1,
			x_upper = 1,
			y_upper = 1,
			z_upper = 1
		},
		{
			location = "Bridge",
			x_lower = -2450,
			y_lower = 1,
			z_lower = 1,
			x_upper = 500,
			y_upper = 1,
			z_upper = 1
		},
		{
			location = "Basement",
			x_lower = 1575,
			y_lower = 375,
			z_lower = 900,
			x_upper = 2250,
			y_upper = 1650,
			z_upper = 1075
		}
	},

	["Train Trade"] = { --framing frame day 2
		{
			location = "Entrance",
			x_lower = -4000,
			y_lower = -2200,
			z_lower = -100,
			x_upper = 850,
			y_upper = -125,
			z_upper = 1000
		},
		{
			location = "Trade Car",
			x_lower = -800,
			y_lower = -1650,
			z_lower = -100,
			x_upper = 1300,
			y_upper = -1400,
			z_upper = 1000
		},
		{
			location = "Riding their bicycle",
			x_lower = 2425,
			y_lower = -750,
			z_lower = 325,
			x_upper = 2300,
			y_upper = -625,
			z_upper = 450
		},
		{
			location = "Trainyard A",
			x_lower = -550,
			y_lower = -1325,
			z_lower = -50,
			x_upper = 1600,
			y_upper = 1075,
			z_upper = 1000
		},
		{
			location = "1F Warehouse",
			x_lower = 1600,
			y_lower = -2650,
			z_lower = -50,
			x_upper = 5200,
			y_upper = 1200,
			z_upper = 375
		},
		{
			location = "2F Warehouse",
			x_lower = 1600,
			y_lower = -2650,
			z_lower = 375,
			x_upper = 5200,
			y_upper = 1200,
			z_upper = 1000
		},
		{
			location = "Tunnels Access",
			x_lower = 4175,
			y_lower = -3500,
			z_lower = -700,
			x_upper = 4525,
			y_upper = -2700,
			z_upper = 1000
		},
		{
			location = "Tunnels",
			x_lower = 0,
			y_lower = -3500,
			z_lower = -900,
			x_upper = 3000,
			y_upper = -500,
			z_upper = -400
		},
		{
			location = "Escape Van",
			x_lower = 7650,
			y_lower = 900,
			z_lower = -50,
			x_upper = 9250,
			y_upper = 2200,
			z_upper = 1000
		},
		{
			location = "Street",
			x_lower = 5200,
			y_lower = -2675,
			z_lower = -50,
			x_upper = 8300,
			y_upper = 2500,
			z_upper = 1000
		}
	}
}

KineticHUD.cartographer_data_temp = {}

--todo create title/waypoint/icon thing for contributors. EVEN KOOLUR
KineticHUD.kool_kidz_data = { --special thanks
	["76561198025511599"] = { --that's me, offyerrocker, the dev
		parent_obj = "Head",--todo effect interval if effect has a lifetime? 
		effect_id = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_endless_no_light"
	}, --your name could be here if you report bugs or make significant contributions!
	["76561198056885449"] = { --gimmechocolate
		parent_obj = "Head",
		effect_id = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_endless_no_light"
	},
	["76561198158768091"] = { --seraph sans
		parent_obj = "Head",
		effect_id = "effects/payday2/environment/parts/thermal_fire" --this effect is not loaded on all maps
	},
	["76561198017334019"] = { --greenghost
		parent_obj = "Head",
		effect_id = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_endless_no_light"
	},
	["76561198092605730"] = { --mxswat
		parent_obj = "Head",
		effect_id = "effects/payday2/environment/parts/thermal_fire"
	},
	["76561198048779110"] = { --whurrhurr
		parent_obj = "Head",
		effect_id = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_endless_no_light"
	}
}

KineticHUD.quickchat_defaults = { --default example quickchat entries; additional lines will be read from saves in the future
	{ --order doesn't matter
		name = "Help", --mandatory
		text = "Help!", --if "text" is present, sends "text" in chat, prepended by "(Voice) "
		sound = "f11e_plu", --if "sound" is present, plays "sound" file to all players
		anim = "cmd_come" --if "anim" is present, performs "anim" hand viewmodel animation
	},
	{
		name = "Thanks",
		text = "Thanks!",
		sound = "s05x_sin"
	},
	{
		name = "$#%!",
		text = "$#%!",
		sound = "g60" --g29
	},
	{
		name = "GET DOWN!", --note: this will not actually intimidate civilians
		sound = "f02b_sin",
		anim = "cmd_down"
	},
	{
		name = "Need Ammo!",
		text = "Need ammo!",
		sound = "g81x_plu"		
	},
	{
		name = "Need Medbag!",
		text = "Need a medbag!",
		sound = "g80x_plu"		
	},
	{
		name = "Get 'em!",
		sound = "g23",
		anim = "cmd_point"
	},
	{
		name = "Go!",
		text = "Go! Go! Go!",
		sound = "g07",
		anim = "cmd_gogo"
	},
	{
		name = "Hello",
		sound = "v56",
		anim = "cmd_stop"
	},
	{
		name = "Bain?!",
		sound = "v35"
	},
	{
		name = "Left!",
		text = "Go Left!",
		sound = "g03",
		anim = "cmd_gogo"
	},
	{
		name = "Right!",
		text = "Go Right!",
		sound = "g04",
		anim = "cmd_gogo"
	},
	{
		name = "YES!",
		sound = "v46",
		anim = "cmd_gogo"
	},
	{
		name = "[Excited yell]",
		sound = "v55",
		anim = "cmd_gogo"
	},
	{
		name = "Shoot 'em!",
		sound = "v49",
		anim = "cmd_gogo"
	},
	{
		name = "Go loud!",
		sound = "p47",
		anim = "cmd_gogo"
	}
	
}

KineticHUD.chat_colors_dark = { --uniform 70 HSB brightness
	[1] = Color(64/255,128/255,64/255),
	[2] = Color(75/255,154/255,219/255),
	[3] = Color(212/255,75/255,75/255),
	[4] = Color(219/255,140/255,75/255),
	[5] = Color(0.2, 0.8, 1) or Color(53/255,217/255,219/255)
}
KineticHUD.chat_colors = {
	[1] = Color(194/255, 252/255, 151/255), --green
	[2] = Color(120/255, 183/255, 204/255), --blue
	[3] = Color(178/255, 104/255, 89/255), --red
	[4] = Color(204/255, 161/255, 102/255), --orange
	[5] = Color(0.2, 0.8, 1) --ai cyan
}
KineticHUD.quality_colors = { --definitely completely original
	normal = Color("B2B2B2"),
	unique = Color("FFD700"),
	vintage = Color("476291"),
	genuine = Color("4D6455"),
	strange = Color("CF6A32"),
	unusual = Color("8650AC"),
	haunted = Color("38F3AB"),
	collector = Color("AA0000"), --collector's, but i hate dealing with release + quotes in strings
	decorated = Color("FAFAFA"),
	community = Color("70B04A"), --also self-made
	valve = Color("A50F79"),
	void = Color("544071"),
	solar = Color("E1834F"),
	arc = Color("6F8EA2"),
	common = Color("43734B"),
	rare = Color("547C96"),
	legendary = Color("522F65"),
	exotic = Color("CEAE33")
}
--=======================--
--*********INIT**********--
--=======================--

KineticHUD.default_settings = {
	hud_enabled_master = true, --not a setting atm

	panel_player_enabled = true,
--	panel_player_health_enabled = true,
	panel_player_health_custom_xy = false,
	panel_player_health_x = 0,
	panel_player_health_y = 540,
	panel_player_health_w = 512, --no menu option
	panel_player_health_h = 64, --no menu option
	panel_player_health_diamond_scale = 0.75,
--	panel_player_name_x = 96,
--	panel_player_name_y = 500,
	panel_player_name_fontsize = 20,
--	panel_player_ties_x = 0,
--	panel_player_ties_y = 0,
--	panel_player_ties_fontsize = 22,
	
	panel_buffs_custom_xy = false,
	panel_buffs_x = 0,
	panel_buffs_y = 200,
	panel_team_enabled = true,
--	panel_team_health_enabled = true, --no longer used
	panel_team_health_custom_xy = false,
	panel_team_health_x = 1000,
	panel_team_health_y = 144,
	panel_team_health_align = 1, --2: horizontal or 1: vertical 
	panel_team_health_margin = 128, --gap between teammates' panels
	panel_team_health_diamond_scale = 0.75,
--	panel_team_ties_x = 64,
--	panel_team_ties_y = 500,
	panel_team_ties_fontsize = 22,
	panel_team_name_x = 64,
	panel_team_name_y = 500,
	panel_team_name_fontsize = 22,
	
	panel_chat_x = 700,
	panel_chat_y = -125,
	panel_chat_use_custom_xy = true,
	
	hud_enabled_downcounter_own = true,
	
	show_sentry_tracker = true,
	show_crosshair = false,
	show_debug = false,
	show_buffs_master = true,
	show_unusuals = true,
	show_location = true,
	hud_mission_enabled = true,
	early_supporter = true,
	crosshair_show_circle = true,
	crosshair_show_cross = true,
	crosshair_show_dot = false,
	crosshair_circle_scale = 1,
	crosshair_cross_w = 3,
	crosshair_cross_h = 8,
	crosshair_cross_offset = 6,
	crosshair_dot_scale = 4,
	crosshair_master_opacity = 0.5,
	crosshair_scanner = true,
	crosshair_fade_ads = true,
	antispam_enabled = true,
	use_nav_surfaces = false,
	quickchat_notext = false,
	use_wpn_real_ammo = false,
	panel_weapon_x = 256,
	panel_weapon_y = 560,
	panel_weapon_custom_xy = false,
	panel_weapon_scale = 0.75,
	use_wpn_name = true,
	use_wpn_nickname = true,
	wpn_name_duration = 1.5, --seconds to show weapon name/nickname before fading
	downcounter_announce_lowdowns_only_mode = true,
	downcounter_announce_docbags = false,
	downcounter_announce_custody = false,
	downcounter_announce_extras = false,
	downcounter_announce_chat_mode = 2,
	downcounter_announce_alert_mode = 1,
	use_compass = false,
	panel_compass_x = 0, --disabled
	panel_compass_y = 0,
	panel_compass_w = 3000, --disabled
	panel_compass_h = 32, --disabled
	panel_compass_alpha = 1
}


for index,buff_entry in pairs(KineticHUD.buff_data) do
	if not buff_entry.disabled then
		KineticHUD.default_settings[index] = true
	end
end

KineticHUD.settings = KineticHUD.settings or {} --or deep_clone(KineticHUD.default_settings)

KineticHUD.down_counter = {
	[1] = 0,
	[2] = 0,
	[3] = 0,
	[4] = 0,
	[5] = 0,
	[420] = 0
}

KineticHUD.downcounter_nine_lives = { --tracks extra lives, instead of just a bool for uses ninelives
	[1] = 0,
	[2] = 0,
	[3] = 0,
	[4] = 0,
	[5] = 0,
	[420] = 0
}

KineticHUD.quickchat_start_t = -420 --keep it dank, everyone
KineticHUD.quickchat_lifetime = 3 --seconds until panel starts to fade away
KineticHUD.quickchat_fadeout = nil --boolean
KineticHUD.quickchat_focus = nil --int [1,4]
KineticHUD.quickchat_fade_duration = 2 --seconds from fade start (alpha 1) to fade end (alpha 0)
--quickchat start t (memory)
--quickchat lifetime (setting)
--quickchat fade duration (setting)
--quickchat fadeout (memory)
--quickchat focus (memory)
KineticHUD.scanner_focus_duration = 3

KineticHUD.temp_cartographer_selected = 1

KineticHUD.max_tracked_ecms = 8
KineticHUD.max_tracked_sentryguns = 6

KineticHUD.assault_phase_name = "" --quick fix so that KineticHUD stops spamming logs with assault phase

--superimpose default settings over saved settings;
--this way, new settings from updates are still loaded and written into savedata
for k,v in pairs(KineticHUD.default_settings) do
	if KineticHUD.settings[k] == nil then
		KineticHUD.settings[k] = v
	end
--	KineticHUD.settings[k] = (KineticHUD.settings[k] ~= nil) and KineticHUD.settings[k] or v
end

--=======================--
--*******FUNCTIONS*******--
--=======================--

function KineticHUD:get_map_location_from_position(pos,map)
	if pos and map then 
		local pos_x = math.floor(pos.x)
		local pos_y = math.floor(pos.y)
		local pos_z = math.floor(pos.z)

		for k,v in pairs(map) do
			if (pos_x < v.x_upper) and (pos_x > v.x_lower) then
				if (pos_y < v.y_upper) and (pos_y > v.y_lower) then
					if (pos_z < v.z_upper) and (pos_z > v.z_lower) then
						return v.location
					else
--						KineticHUD:c_log("Z",k)
--						KineticHUD:c_log(v.z_upper,v.z_lower)
					end
				else
--					KineticHUD:c_log("Y",k)
--					KineticHUD:c_log(v.y_lower,v.y_upper)
				end
			else
--				KineticHUD:c_log("X",k)
--				KineticHUD:c_log(v.x_lower,v.x_upper)
			end
		end
	end
end

Hooks:Add("NetworkReceivedData", "khud_NetworkReceivedData", function(sender, message, data, ...)
	if message == KineticHUD.msg_SyncAssault then
		if sender == 1 and managers.hud and not Network:is_server() then --redundant but just in case.
			managers.hud:set_assault_phase_visible(true)
			managers.hud:set_assault_phase(data) --host can make you see any string they want. todo fix that with whitelist key
		end
	elseif message == KineticHUD.msg_DownCounter then 
		local criminals_manager = managers.criminals
		
		local split_data = string.split(data,":")
		local extra_lives = split_data and split_data[2] or 0
		local existing_downs = split_data and split_data[4] or 0

		KineticHUD.downcounter_nine_lives[sender] = tonumber(extra_lives)
		KineticHUD:DownCounter_SetDowns(existing_downs,sender)
		--TODO update downcounter hud element
	end
end)

function KineticHUD:DownCounter_SendDownsData(peer_id)
	if not peer_id then 
		return
	end
	local extra_lives = managers.player:upgrade_value("player", "additional_lives", 0) or 0
	local my_downs = KineticHUD:DownCounter_GetDowns()
	LuaNetworking:SendToPeer(peer_id,KineticHUD.msg_DownCounter, "NineLives:" .. tostring(extra_lives) .. ":ExistingDowns:" .. tostring(my_downs))
end

function KineticHUD:DownCounter_SendDownsDataToAll()
	local extra_lives = managers.player:upgrade_value("player", "additional_lives", 0) or 0
	local my_downs = KineticHUD:DownCounter_GetDowns()
	LuaNetworking:SendToPeers(KineticHUD.msg_DownCounter, "NineLives:" .. tostring(extra_lives) .. ":ExistingDowns:" .. tostring(my_downs))
end

function KineticHUD:sync_set_assault_phase(phase)
	LuaNetworking:SendToPeers(KineticHUD.msg_SyncAssault,phase)
end

function KineticHUD:DownCounter_GetGlobalMaxDowns()
	local max_downs = Global.game_settings.one_down and 2 or tweak_data.player.damage.LIVES_INIT
	max_downs = managers.modifiers:modify_value("PlayerDamage:GetMaximumLives", max_downs) 
	--non exclusive to difficulty modifiers that force one down, like pre-balance One Down
	return tonumber(max_downs) or 0
end

function KineticHUD:DownCounter_Announce(message)
	if KineticHUD:DownCounter_IsChatModeMuted() then
		return
	elseif KineticHUD:DownCounter_IsChatModeLocal() then
		KineticHUD:DownCounter_AnnounceToSelf(message)
	elseif KineticHUD:DownCounter_IsChatModeGlobal() then
		KineticHUD:DownCounter_AnnounceToAll(message)
	end
end

function KineticHUD:DownCounter_AnnounceToAll(message)
	managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "[DownCounter] " .. tostring(message))		
end

function KineticHUD:DownCounter_AnnounceToSelf(message)
	managers.chat:_receive_message(1,"[DownCounter]", tostring(message), Color('fce538'))
end

function KineticHUD:DownCounter_GetPeerExtraLives(peer_id) --NOTE! Only applies to other KineticHUD users, as this information is not networked normally
	return KineticHUD.downcounter_nine_lives[peer_id or 5]
end

function KineticHUD:DownCounter_GetDowns(peer_id)
	peer_id = peer_id or LuaNetworking:LocalPeerID() or 1
	return KineticHUD.down_counter[peer_id]
end

function KineticHUD:DownCounter_SetDowns(downs,peer_id)
	downs = tonumber(downs) or 0
	peer_id = peer_id or LuaNetworking:LocalPeerID() or 1
	KineticHUD.down_counter[peer_id] = downs
	--if downcounter hudmode then
	if managers.hud then 
		managers.hud:set_khud_downs(peer_id,downs)
	end
end

function KineticHUD:SendData(category,data)
	LuaNetworking:SendToPeers(category and tostring(category) or KineticHUD.ModID,tostring(data))
end

function KineticHUD:SendDataToPeer(peer_id,category,data)
	if peer_id and data then 
		LuaNetworking:SendToPeer(peer_id,category and tostring(category) or KineticHUD.ModID,tostring(data))
	end
end

function KineticHUD:set_quickchat_focus(id)
	KineticHUD.quickchat_focus = id
end

function KineticHUD:get_quickchat_focus()
	return KineticHUD.quickchat_focus
end

function KineticHUD:play_criminal_sound(id)	
	if Utils:IsInHeist() and Utils:IsInCustody() == false and Utils:IsInGameState() then 
		managers.player:local_player():sound():say(id,true,true) --"i'm helping you up"
	end
end

function KineticHUD:play_viewmodel_anim(id) --todo sanity checks
	if Utils:IsInHeist() and Utils:IsInGameState() and Utils:IsInCustody() == false then 
		local player = managers.player:local_player():movement()
		if not player:in_clean_state() then 
			player:current_state():_play_distance_interact_redirect(0, id) --or cmd_get_up
		end
	end
end

--not implemented
function KineticHUD:play_sound_event(id)
	local category = KineticHUD:get_sound_category_by_id(id) --todo check for setting
	if category and KineticHUD:IsSoundCategoryAllowed(category) then
		KineticHUD:play_sound(id)
	end
end

--not implemented
function KineticHUD:IsSoundCategoryAllowed(category) 
end

--not implemented
function KineticHUD:_play_sound(id) --for AI speech
	--[angry mute noises]
end

--not implemented
function KineticHUD:get_waypoint(id)
	if managers.hud then
		if managers.hud:get_waypoint(id) then
		end
	end
end

--not implemented
function KineticHUD:check_voice_chance()
--todo increase likelihood of ai speaking over time, resets when she says any random line
end


--=======================--
--*********UTILS*********--
--=======================--

function KineticHUD:trunc(str,length) --i think i was gonna do something more complex here but i forgot what
	if not str then return end
	length = length or 10
	return string.sub(str,1,length)
end

function KineticHUD:_log(data,name)
	if not self.settings.show_debug then return end
	name = name and (tostring(name) .. " : ") or ""
	log("KineticHUD: " .. name .. tostring(data))
end

function KineticHUD:t_log(tbl,name,result,tier_limit,tier,return_result)
	name = name or ("TABLE " .. (tier or ""))
	tier = tier or 1
	tier_limit = tier_limit or 10
	result = result or {
		tostring(name) .. " = {"
	}
	if type(tbl) == "table" then 
		for k,v in pairs(tbl) do
			if type(v) == "table" then 
				table.insert(result,string.rep("    ",tier) .. "{")
				result = KineticHUD:t_log(v,k,result,tier_limit,tier + 1,true)
				table.insert(result,string.rep("    ",tier) .. "}")
			else
				table.insert(result,string.rep("    ",tier) .. tostring(k) .. " = { " .. tostring(v) .. " }")
			end
		end
--		return result
	else
		table.insert(result,string.rep("    ",tier + 1) .. tostring(tbl))
		table.insert(result,string.rep("    ",tier) .. "}")
	end
	if return_result then 
		return result
	end
	table.insert(result,"}")
	for ba,na in pairs(result) do
		log("KineticHUD: |" .. tostring(na))
	end
end

function KineticHUD:t_log_2(data,name)
	if not self.settings.show_debug then return end
	if type(data) == "table" then 
		for k,v in pairs(data) do
			self:_log(v,k)
		end
	else
	
	end
end

function KineticHUD:c_log(data,name)
	if not self.settings.show_debug then return end
	name = name and tostring(name) .. " : " or ""
	local t_raw = math.floor(Application:time()*100)/100
	local t = string.format("%2i:%02i:%02i",math.floor(t_raw/360),math.floor(t_raw / 60),math.floor(t_raw % 60))
	if managers.chat then 
		managers.chat:_receive_message(1,"[KineticHUD]", t .. "|" .. name .. tostring(data), Color('F826FF'))
	else
		self:_log(data,name)
	end
end

function KineticHUD:concat(tbl,div)
	div = tostring(div or ",")
	if not type(tbl) == "table" then 
		return "{non-table value}"
	end
	local str
	for k,v in pairs(tbl) do
		str = str and (str .. div .. tostring(v or k) ) or tostring(v or k) 
	end
	return str
end

function KineticHUD:_debug(value,slot)
	slot = slot or 0
	managers.hud:set_debug_value(value,slot)
end

function KineticHUD:get_hud(id)
	managers.hud:get_criminal_hud_panel_by_panel_id(id)
end

function panel_border(panel,params) --creates rectangular border of varying color/thickness on the inside edge of a specified panel.
	
--takes parameters as table "params": values "thickness","color","margin","layer","id_prefix"
	--panel: [panel] panel to apply to (revolver ocelot [revolver ocelot])
	--thiccness: [float] border thickness (w value for left/right, or h value for top/bot)
	--color: [color] color of border (revolver ocelot [revolver {revolver ocelot} ocelot])
	--[NOT SUPPORTED] rotation: [float] (range [0-360])
	--blend mode: [string] ("add","sub","normal")
	--alpha: [float] (range [0,1]) transparency of border
	--margin: [float] offset from square outside edges. essentially scale, but using linear pixel offset. Because of parent panel boundaries, you cannot make borders outside of its parent panel area. 
	--layer: [float] panel layer. higher values are closer to the top (?)
	--id_prefix: [string] appended to internal panel names. Not needed unless you're applying multiple borders to one panel object.
	if not (panel and alive(panel)) then
		KineticHUD:c_log("Error: Invalid panel argument for function panel_border("..tostring(thiccness)..","..tostring(color)..","..tostring(margin)..").")
		return
	end
	local blend_mode = params.blend_mode or "normal"
	local thiccness = params.thickness or 1
	local color = params.color or Color.white
	local margin = params.margin or 0--and math.abs(params.margin) or 0
	--layer doesn't need to be set since it's inherited from parent panel anyhow
	local layer = params.layer
	local id_prefix = params.id_prefix or ""
	local alpha = params.alpha or 1
	local name = panel:name()
	local h = params.h or panel:h()
	local w = params.w or panel:w()
	if not (panel:child(id_prefix .. "panel_borders") and alive(panel:child(id_prefix .. "panel_borders"))) then 
		local borders = panel:panel({
			name = id_prefix .. "panel_borders",
			layer = layer,
--			rotation = rotation,
			alpha = alpha
		})
		local left = borders:rect({
			name = name .. "_border_left",
			w = thiccness,
			h = h - ((thiccness + margin ) * 2),
			x = margin,
			y = margin + thiccness,
			blend_mode = blend_mode,
			color = color
		})
		local right = borders:rect({
			name = name .. "_border_right",
			w = thiccness,
			h = h - ((thiccness + margin ) * 2),
			x = w - (margin + thiccness),
			y = margin + thiccness,
			blend_mode = blend_mode,
			color = color
		})
		local top = borders:rect({
			name = name .. "_border_top",
			w = w - (margin * 2),
			h = thiccness,
			x = margin,
			y = margin,
			blend_mode = blend_mode,
			color = color
		})
		local bottom = borders:rect({
			name = name .. "_border_bottom",
			w = w - (margin * 2),
			h = thiccness,
			x = margin,
			y = h - (margin + thiccness),
			blend_mode = blend_mode,
			color = color
		})
	else
		local borders = panel:child(id_prefix .. "panel_borders")
		local left = borders:child(name .. "_border_left")
		local right = borders:child(name .. "_border_right")
		local top = borders:child(name .. "_border_top")
		local bottom = borders:child(name .. "_border_bottom")
		if layer then
			borders:set_layer(layer)
		end
--		borders:set_rotation(rotation)
		left:set_w(thiccness)
		left:set_h(h - (margin * 2))
		left:set_x(margin)
		left:set_y(margin)
		left:set_color(color)
		
		right:set_w(thiccness)
		right:set_h(h - (margin * 2))
		right:set_x(w - (margin + thiccness))
		right:set_y(margin)
		right:set_color(color)
		
		top:set_w(w - (margin * 2))
		top:set_h(thiccness)
		top:set_x(margin)
		top:set_y(margin)
		top:set_color(color)
		
		bottom:set_w(w - (margin * 2))
		bottom:set_h(thiccness)
		bottom:set_x(margin)
		bottom:set_y(h - (margin + thiccness))
		bottom:set_color(color)
	end
	return borders --rip borders, killed by amazon. you deserved better
end

--=======================--
--********SETTINGS*******--
--=======================--

function KineticHUD:GetSettings(setting)
	if setting then 
		return KineticHUD.settings[setting]
	else
		return KineticHUD.settings
	end
end

function KineticHUD:GetColor(name,backup)
	if KineticHUD.quality_colors[name] or not backup then
		return KineticHUD.quality_colors[name]
	else
		return Color.white
	end
end

function KineticHUD:DownCounter_AnnounceLowDownsOnly()
	return KineticHUD.settings.downcounter_announce_lowdowns_only_mode --formerly only_announce_lowdowns_mode
end

function KineticHUD:DownCounter_AnnounceDocBags()
	return KineticHUD.settings.downcounter_announce_docbags
end

function KineticHUD:DownCounter_AnnounceCustodies() --why did i make this plural. it's singular "custody" everywhere else, rip consistency
	return KineticHUD.settings.downcounter_announce_custody
end

function KineticHUD:DownCounter_AnnounceExtraStates()
	return KineticHUD.settings.downcounter_announce_extras
end

function KineticHUD:DownCounter_IsChatModeMuted()
	return KineticHUD.settings.downcounter_announce_chat_mode == 1
end

function KineticHUD:DownCounter_IsChatModeLocal()
	return KineticHUD.settings.downcounter_announce_chat_mode == 2
end

function KineticHUD:DownCounter_IsChatModeGlobal()
	return KineticHUD.settings.downcounter_announce_chat_mode == 3
end

function KineticHUD:DownCounter_IsAlertModeAll()
	return KineticHUD.settings.downcounter_announce_alert_mode == 1
end

function KineticHUD:DownCounter_IsAlertModeTeammates()
	return KineticHUD.settings.downcounter_announce_alert_mode == 2
end

function KineticHUD:DownCounter_IsAlertModeSelf()
	return KineticHUD.settings.downcounter_announce_alert_mode == 3
end


function KineticHUD:HUD_Enabled_Team() --not used
	return KineticHUD:HUD_Enabled_Master() and KineticHUD.settings.panel_team_enabled
end

function KineticHUD:HUD_Enabled_Player()
	return KineticHUD:HUD_Enabled_Master() and KineticHUD.settings.panel_player_enabled
end

function KineticHUD:HUD_Enabled_Master()
	return not _G.IS_VR and KineticHUD.settings.hud_enabled_master
end

function KineticHUD:HUD_Enabled_Downcounter_Own() --not used
	return KineticHUD:HUD_Enabled_Master() and KineticHUD.settings.hud_enabled_downcounter_own
end

function KineticHUD:HUD_Enabled_Health_Player()
	return KineticHUD:HUD_Enabled_Master() and KineticHUD.settings.health_own_panel_enabled
end

function KineticHUD:UseBuffsCustomXY()
	return KineticHUD.settings.panel_buffs_custom_xy
end 
function KineticHUD:UseHealthOwnCustomXY()
	return KineticHUD.settings.panel_player_health_custom_xy
end

function KineticHUD:UseHealthTeamCustomXY()
	return KineticHUD.settings.panel_team_health_custom_xy
end

function KineticHUD:UseWeaponRealAmmo()
	return KineticHUD.settings.use_wpn_real_ammo
end

function KineticHUD:UseWeaponName()
	return KineticHUD.settings.use_wpn_name
end

function KineticHUD:UseWeaponNickname() --requires useweaponname enabled
	return KineticHUD.settings.use_wpn_nickname
end

function KineticHUD:UseCompass()
	return KineticHUD.settings.use_compass
end

function KineticHUD:UseCartographer()
	return KineticHUD.settings.show_location
end

function KineticHUD:IsQuickChatNoText()
	return KineticHUD.settings.quickchat_notext
end

function KineticHUD:UseNavSurfaces()
	return KineticHUD.settings.use_nav_surfaces
end

function KineticHUD:UseWeaponCustomXY()
	return KineticHUD.settings.panel_weapon_custom_xy
end

function KineticHUD:IsCrosshairScannerEnabled()
	return KineticHUD.settings.crosshair_scanner
end

function KineticHUD:IsCrosshairEnabled()
	return KineticHUD.settings.show_crosshair
end

function KineticHUD:IsCrosshairADSOnly()
	return self.settings.crosshair_fade_ads
end

function KineticHUD:IsAntispamEnabled()
	return KineticHUD.settings.antispam_enabled
end

function KineticHUD:IsMissionEnabled()
	return KineticHUD.settings.hud_mission_enabled
end

function KineticHUD:IsDebugEnabled()
	return KineticHUD.settings.show_debug
end

function KineticHUD:IsSentryTrackerEnabled()
	return self.settings.show_sentry_tracker
end

function KineticHUD:is_kool_kid(id64) --normally, putting numbers in arg/var names is bad practice imo. i'll make an exception here
	return KineticHUD.kool_kidz_data[id64]
end

function KineticHUD:UseUnusuals()
	return KineticHUD.settings.show_unusuals
end

function KineticHUD:GetBuffData(buffid)
	if buffid then
		return KineticHUD.buff_data[buffid]
	else
		return KineticHUD.buff_data
	end
end

function KineticHUD:GetCartographerData(map_id)
	if map_id then 
		return self.cartographer_data[map_id] or self:LoadCartographerData()
	else 
		return self.cartographer_data or self:LoadCartographerData()
	end
end

--=======================--
--***CARTOGRAPHER TOOL***--
--=======================--
--todo move location order in cartographer data list

function KineticHUD:NewCartographerLocation()
	self.temp_cartographer_selected = self.temp_cartographer_selected + 1
	local pos = managers.player:local_player():movement():m_pos()
	table.insert(self.cartographer_data_temp,self.temp_cartographer_selected,
		{
			location = "New Location " .. self.temp_cartographer_selected,
			x_lower = math.floor(pos.x) - 10,
			y_lower = math.floor(pos.y) - 10,
			z_lower = math.floor(pos.z) - 10,
			x_upper = math.floor(pos.x) + 10,
			y_upper = math.floor(pos.y) + 10,
			z_upper = math.floor(pos.z) + 10
		}
	)
end

function KineticHUD:DeleteCartographerLocation(selected)
	selected = selected or KineticHUD.temp_cartographer_selected
	KineticHUD.cartographer_data_temp[selected] = nil
	for k,v in pairs(KineticHUD.cartographer_data_temp) do 
		KineticHUD.temp_cartographer_selected = k
		break
	end
end

function KineticHUD:_SelectCartographerLocation(name)
	for k,v in ipairs(KineticHUD.cartographer_data_temp) do 
		if v.location == name then 
			KineticHUD.temp_cartographer_selected = k
			return k
		end
	end
	return false
end

function KineticHUD:SelectCartographerLocation(page)
	page = page or 0
	local max_entries_per_page = 20
	local total_entries = #KineticHUD.cartographer_data_temp
	local menu_title = "Select a location"
	local menu_msg = ":)"
	local options = {}
	for k,v in ipairs(KineticHUD.cartographer_data_temp) do 
		if k - (page * max_entries_per_page) > max_entries_per_page then 
			table.insert(options,{
				text = "[Next page]",
				callback = callback(self,self,"SelectCartographerLocation",page + 1)
			})
			break
		end
		if (k > page * max_entries_per_page) then 
			table.insert(options,{
				text = (tostring(k .. ". " .. v.location) or "[NIL]"),
				callback = callback(self,self,"_SelectCartographerLocation",v.location)
			})
		end
	end
	if page > 0 then 
		table.insert(options,{
			text = "[Previous page]",
			callback = callback(self,self,"SelectCartographerLocation",page - 1)
		})
	end

	table.insert(options,{
		text = "[Done]",
		is_cancel_button = true
	})
	
	QuickMenu:new(menu_title,menu_msg,options):show()

end

function KineticHUD:_Set_Cartographer_Location()
	local name = self
	local current_selected = KineticHUD.temp_cartographer_selected or KineticHUD:c_log(name,current_selected) or 1
	KineticHUD.cartographer_data_temp[current_selected].location = name
end

function KineticHUD:ClearCartographerData(confirmed)
	if not confirmed then 
		QuickMenu:new("Confirm data deletion","You will lose all current unsaved cartographer progress. Continue?",{
			{
				text = "Yes, clear my cartographer data",
				callback = callback(self,self,"ClearCartographerData",true)
			},
			{
				text = "Cancel",
				callback = callback(self,self,"Create_Cartographer_Menu")  --todo show last menu
			}
		}
		):show()
	else
		KineticHUD.cartographer_data_temp = {}
		QuickMenu:new("Cartographer: Success","Data cleared.",{
			{
				text = "[Press F to pay respects]",
				is_cancel_button = true
			}
		}
		):show()
	end
end

function KineticHUD:Set_Cartographer_Location(name)
	local temp = self.cartographer_data_temp
	local current_selected = self.temp_cartographer_selected
	local location = temp[current_selected].location or "NIL"
	
	if QuickKeyboardInput and not name then
		QuickKeyboardInput:new("Set Location Name", "Type a new name for location [" .. location .. "]", location, KineticHUD._Set_Cartographer_Location):show()
	elseif name then 
		self:_Set_Cartographer_Location(name)
	else
		KineticHUD:c_log("Error: No name or qki")
	end
end

function KineticHUD:_Set_Cartographer_Value()
	local value = self
	
	local current_selected = KineticHUD.temp_cartographer_selected
	local temp = KineticHUD.cartographer_data_temp
	local entry = KineticHUD.temp_cartographer_entry or "x_upper"
	
	if value and tonumber(value) then
		value = tonumber(value)
		temp[current_selected][entry] = value
	else
		local pos = managers.player:local_player():movement():m_pos()
		if entry == "x_upper" or entry == "x_lower" then
			value = math.floor(pos.x)
		elseif entry == "y_upper" or entry == "y_lower" then 
			value = math.floor(pos.y)
		elseif entry == "z_upper" or entry == "z_lower" then 
			value = math.floor(pos.z)
		end
		temp[current_selected][entry] = value
	end
end

function KineticHUD:Set_Cartographer_Value(entry)
	local current_selected = self.temp_cartographer_selected
	local temp = self.cartographer_data_temp[current_selected]
	local location = temp.location or tostring(current_selected)
	self.temp_cartographer_entry = entry
	if QuickKeyboardInput then
		QuickKeyboardInput:new("Type a new " .. entry .. " value for [" .. location .. "]", "Leave blank for current position.", temp[entry], KineticHUD._Set_Cartographer_Value):show()
	else
		KineticHUD:c_log("Error: QuickKeyboardInput is not installed!")
	end

end
					
function KineticHUD:SaveCartographerData(confirmed)
	local map_id = managers.job:current_level_data().name_id
	local data = self.cartographer_data_temp --self:GetCartographerData() --todo get temp data
	
	local path = self._cartographer_data_path 
	if map_id then 
		path = path .. tostring(map_id) .. ".txt"
	end
	
	if SystemFS:exists( Application:nice_path( path, true )) and not confirmed then
		--do confirm dialogue
		QuickMenu:new("Overwrite?","File already exists. Overwrite data for map [" .. map_id .. "]?",
			{
				{
					text = "Yes, overwrite data",
					callback = callback(self,self,"SaveCartographerData",true)
				},
				{
					text = "Cancel",
					callback = callback(self,self,"Create_Cartographer_Menu")  --todo show last menu
				}
			}
		):show()
		return
	else
		local file = io.open(path,"w+")
		if file then 
			file:write(json.encode(data))
			file:close()
--			KineticHUD:c_log("Saved file to " .. path)
			local success = QuickMenu:new("Cartographer: Success","Saved file to " .. path,
				{
					text = "Close",
					is_cancel_button = true
				}
			)
			success:show()
			return success
		else
			KineticHUD:c_log("Error! No file at location " .. path)
			return false
		end
	end
end

function KineticHUD:LoadCartographerData(map_id)
	local path = self._cartographer_data_path 
	if map_id then 
		path = path .. tostring(map_id) .. ".txt"
	end
	if SystemFS:exists( Application:nice_path( path, true )) then
		
		local file = io.open(path,"r")	
		if file then 
			for k,v in pairs(json.decode(file:read("*all"))) do
				self.cartographer_data[k] = self.cartographer_data[k] or v --probably not needed
			end
		end
		return self.cartographer_data
	else
		KineticHUD:c_log("No file for map [" .. map_id .. "]")
	end
end

--checks file at KineticHUD/cartographer/[level_name].txt
--prioritises searching for current internal level name for variant-specific cartographer data
--otherwise, searches for localized name (eg. to cover all Bank Heist variants) [NOTE: I should really not do this since it's language specific]
--loads at start
function KineticHUD:ReloadCartographerData(skip_load) 
	local path = KineticHUD._cartographer_data_path
	
	local level_name = managers.job:current_level_data().name_id
	local name_localized = managers.localization:text(level_name)
	local chosen_name = nil
	
	if SystemFS:exists( Application:nice_path( path .. level_name .. ".txt", true )) then
		chosen_name = level_name
	elseif SystemFS:exists( Application:nice_path( path .. name_localized .. ".txt", true )) then
		chosen_name = name_localized
	end
	
	if chosen_name then 
		local data = {}
		path = path .. chosen_name .. ".txt"
		local file = io.open(path,"r")	
		if file then 
			for k,v in pairs(json.decode(file:read("*all"))) do
				data[k] = v
			end
		end
		if not skip_load then 
			local cartographer_data = KineticHUD:GetCartographerData()
			cartographer_data[chosen_name] = data
		end
--		KineticHUD:t_log(data,path)
		return data
	end	
end

function KineticHUD:Create_Cartographer_Menu() --bind this to use the cartographer tool
	if not (managers.job:current_level_data() and managers.player:local_player()) then return end  
	local locations = 0
	local selected_name = "[NONE]"
	if self.cartographer_data_temp then 
		if #self.cartographer_data_temp > 0 then 
		else
		
			local level_name = managers.job:current_level_data().name_id
			local name_localized = managers.localization:text(level_name)
			local map_data = KineticHUD.cartographer_data[level_name] or KineticHUD.cartographer_data[name_localized] or KineticHUD:ReloadCartographerData(true)
			if map_data then 
				self.cartographer_data_temp = map_data
			else
				local pos = managers.player:local_player():movement():m_pos()
				table.insert(self.cartographer_data_temp,{
					location = "New Location0",
					x_lower = math.floor(pos.x) - 10,
					y_lower = math.floor(pos.y) - 10,
					z_lower = math.floor(pos.z) - 10,
					x_upper = math.floor(pos.x) + 10,
					y_upper = math.floor(pos.y) + 10,
					z_upper = math.floor(pos.z) + 10
				})
			end
		end
		locations = #self.cartographer_data_temp
		selected_name = self.cartographer_data_temp[self.temp_cartographer_selected] and self.cartographer_data_temp[self.temp_cartographer_selected].location or selected_name
	end	
	
	local options = {
		{
			text = "New location from position",
			callback = callback(self,self,"NewCartographerLocation")
		},
		{
			text = "Select location",
			callback = callback(self,self,"SelectCartographerLocation")
		},
		{
			text = "Delete location",
			callback = callback(self,self,"DeleteCartographerLocation")
		},
		{
			text = "Reload cartographer data",
			callback = callback(self,self,"ReloadCartographerData")
		},
		{
			text = "Clear Data",
			callback = callback(self,self,"ClearCartographerData")
		},
		{
			text = "Save...",
			callback = callback(self,self,"SaveCartographerData")
		}
	}
	options[#options+1] = {
		text = "[Done]",
		is_cancel_button = true
	}
	QuickMenu:new("Cartographer Menu","Selected location: " .. selected_name .. "\nNumber of locations: " .. locations .. "\nCurrent map: " .. managers.job:current_level_data().name_id,options):show()
	
end

function KineticHUD:Create_Cartograper_ToolMenu() --also bind this to use the cartographer tool
	if not (managers.job:current_level_data() and managers.player:local_player()) then return end  
	local selected_name = "."
	if self.cartographer_data_temp then 
		if #self.cartographer_data_temp > 0 then 
		else
			local level_name = managers.job:current_level_data().name_id
			local name_localized = managers.localization:text(level_name)
			local map_data = KineticHUD.cartographer_data[level_name] or KineticHUD.cartographer_data[name_localized] or KineticHUD:ReloadCartographerData(true)
			if map_data then 
				self.cartographer_data_temp = map_data
			else
				local pos = managers.player:local_player():movement():m_pos()
				table.insert(self.cartographer_data_temp,{
					location = "New Location 0",
					x_lower = math.floor(pos.x) - 10,
					y_lower = math.floor(pos.y) - 10,
					z_lower = math.floor(pos.z) - 10,
					x_upper = math.floor(pos.x) + 10,
					y_upper = math.floor(pos.y) + 10,
					z_upper = math.floor(pos.z) + 10
				})
			end
		end
		selected_name = self.cartographer_data_temp[self.temp_cartographer_selected] and self.cartographer_data_temp[self.temp_cartographer_selected].location or selected_name
	end	
	
	local options = {
		{
			text = "Rename [" .. selected_name .. "]",
			callback = callback(self,self,"Set_Cartographer_Location")
		},
		{
			text = "[" .. self.cartographer_data_temp[self.temp_cartographer_selected].x_upper .. "]Set X max",
			callback = callback(self,self,"Set_Cartographer_Value","x_upper")			
		},
		{
			text = "[" .. self.cartographer_data_temp[self.temp_cartographer_selected].y_upper .. "]Set Y max",
			callback = callback(self,self,"Set_Cartographer_Value","y_upper")
		},
		{
			text = "[" .. self.cartographer_data_temp[self.temp_cartographer_selected].z_upper .. "]Set Z max",
			callback = callback(self,self,"Set_Cartographer_Value","z_upper")
		},
		{
			text = "[" .. self.cartographer_data_temp[self.temp_cartographer_selected].x_lower .. "]Set X min",
			callback = callback(self,self,"Set_Cartographer_Value","x_lower")
		},
		{
			text = "[" .. self.cartographer_data_temp[self.temp_cartographer_selected].y_lower .. "]Set Y min",
			callback = callback(self,self,"Set_Cartographer_Value","y_lower")
		},
		{
			text = "[" .. self.cartographer_data_temp[self.temp_cartographer_selected].z_lower .. "]Set Z min",
			callback = callback(self,self,"Set_Cartographer_Value","z_lower")
		},
		{
			text = "[Close]",
			is_cancel_button = true
		}
	}
		
	QuickMenu:new("Cartographer Tool Menu","Choose an option",options):show()
end

function KineticHUD:ResetPrompt()	
	KineticHUD.settings = {}
	for k,v in pairs(KineticHUD.default_settings) do --should really do deep_clone or something but /shrug
		KineticHUD.settings[k] = v
	end	
	KineticHUD:Save()
end


--=======================--
--**********MENU*********--
--=======================--

function KineticHUD:ToggleBuffVisible(params)
	if params.id then 
		self.settings[params.id] = not self.settings[params.id]
	elseif not params.id then 
		self:c_log("No valid id for togglebuffvisible")
	end
	self:Save()
	
	self:Create_Customize_Buffs_Menu(params.page or 1)
end

function KineticHUD:Create_Customize_Buffs_Menu(page)
	page = page or 1
	local max_buffs_per_page = 20
	local total_buffs = 0
	for k,v in pairs(managers.player:get_buff_data()) do
		if not v.disabled then 
			total_buffs = total_buffs + 1
		end
	end
	local i = 0
	local total_buffs_shown = 0
	local menu_title = "Customize buffs tracker"
	local is_enabled
	local ghost_icon = "" --pacman ghost icon
	local shown_icon = "" --"" for (!) new inventory icon
	local menu_msg = "Shown = [" .. shown_icon .. "] |  Hidden = [" .. ghost_icon .."]"
	local options = {}
	for k,v in pairs(managers.player:get_buff_data()) do
		if not v.disabled then
			if total_buffs_shown < (max_buffs_per_page) and i >= ((page - 1) * max_buffs_per_page) then 
				is_enabled = self.settings[k]
--				KineticHUD:c_log(k .. " is " .. (is_enabled and "Enabled" or "Disabled"))
				options[#options + 1] = {
					text = (v.menu_title or v.label) .. " " .. (is_enabled and shown_icon or ghost_icon),
					callback = callback(self,self,"ToggleBuffVisible",{id = k,page = page})
				}
				total_buffs_shown = total_buffs_shown + 1
			end
			i = i + 1
		end
	end
	if page > 1 then 
		options[#options + 1] = {
			text = "[Previous page]",
			callback = callback(self,self,"Create_Customize_Buffs_Menu",page - 1)
		}
	end
--	KineticHUD:c_log(total_buffs - (((page - 1) * max_buffs_per_page) + total_buffs_shown),total_buffs .. " - (((" .. page .. " - 1) * " .. max_buffs_per_page .. ") + " .. total_buffs_shown ..") > " .. max_buffs_per_page)
	if total_buffs - (((page - 1) * max_buffs_per_page) + total_buffs_shown) > 0 then 
		options[#options + 1] = {
			text = "[Next page]",
			callback = callback(self,self,"Create_Customize_Buffs_Menu",page + 1)
		}
	end

	options[#options+1] = {
		text = "[Done]",
		is_cancel_button = true
	}
	
	QuickMenu:new(menu_title,menu_msg,options):show()

end

--todo use own file read method from lasersplus
Hooks:Add("LocalizationManagerPostInit", "khud_LocalizationManagerPostInit", function( loc )
	for _, filename in pairs(file.GetFiles(KineticHUD._path .. "loc/")) do
		local str = filename:match('^(.*).txt$')
		if str and Idstring(str) and Idstring(str):key() == SystemInfo:language():key() then
			loc:load_localization_file(KineticHUD._path .. "loc/" .. filename)
			break
		end
	end
	loc:load_localization_file( KineticHUD._path .. "loc/english.txt")
end)

function KineticHUD:Load()
	local file = io.open(self._save_path, "r")
	if (file) then
		for k, v in pairs(json.decode(file:read("*all"))) do
			self.settings[k] = v
		end
	else
		self:Save() --create data in case there's no mod save data
	end
	return self.settings
end

function KineticHUD:Save()
	local file = io.open(self._save_path,"w+")
	if file then
		file:write(json.encode(self:GetSettings()))
		file:close()
	end
end

local menu_id = "khud_mainmenu"
Hooks:Add("MenuManagerSetupCustomMenus", "MenuManagerSetupCustomMenus_khud", function(menu_manager, nodes)
    MenuHelper:NewMenu( menu_id )
    MenuHelper:NewMenu("khud_menu_basic")
    MenuHelper:NewMenu("khud_menu_panels")
	MenuHelper:NewMenu("khud_menu_panel_player")
	MenuHelper:NewMenu("khud_menu_panel_team")
    MenuHelper:NewMenu("khud_menu_buffs")
    MenuHelper:NewMenu("khud_menu_downcounter")
    MenuHelper:NewMenu("khud_menu_panel_weapons")
    MenuHelper:NewMenu("khud_menu_panel_crosshair")
    MenuHelper:NewMenu("khud_menu_quickchat")
    MenuHelper:NewMenu("khud_menu_keybinds")
	MenuHelper:NewMenu("khud_menu_panel_compass")
    MenuHelper:NewMenu("khud_menu_panel_player_name")
    MenuHelper:NewMenu("khud_menu_panel_player_health")
    MenuHelper:NewMenu("khud_menu_panel_team_name")
    MenuHelper:NewMenu("khud_menu_panel_team_health")
    MenuHelper:NewMenu("khud_menu_panel_chat")
end)

Hooks:Add("MenuManagerPopulateCustomMenus", "MenuManagerPopulateCustomMenus_khud", function(menu_manager, nodes)
--	MenuHelper:LoadFromJsonFile(KineticHUD._path .. "menu/menu_keybinds.txt", KineticHUD, KineticHUD:GetSettings())
	MenuHelper:LoadFromJsonFile(KineticHUD._path .. "menu/menu_quickchat.txt", KineticHUD, KineticHUD:GetSettings())
	MenuHelper:LoadFromJsonFile(KineticHUD._path .. "menu/menu_panel_crosshair.txt", KineticHUD, KineticHUD:GetSettings())
	MenuHelper:LoadFromJsonFile(KineticHUD._path .. "menu/menu_downcounter.txt", KineticHUD, KineticHUD:GetSettings())
	MenuHelper:LoadFromJsonFile(KineticHUD._path .. "menu/menu_buffs.txt", KineticHUD, KineticHUD:GetSettings())
	MenuHelper:LoadFromJsonFile(KineticHUD._path .. "menu/menu_panels.txt", KineticHUD, KineticHUD:GetSettings())
	MenuHelper:LoadFromJsonFile(KineticHUD._path .. "menu/menu_basic.txt", KineticHUD, KineticHUD:GetSettings())
	MenuHelper:LoadFromJsonFile(KineticHUD._path .. "menu/menu_panel_team.txt", KineticHUD, KineticHUD:GetSettings())
	MenuHelper:LoadFromJsonFile(KineticHUD._path .. "menu/menu_panel_player.txt", KineticHUD, KineticHUD:GetSettings())
	MenuHelper:LoadFromJsonFile(KineticHUD._path .. "menu/menu_panel_compass.txt", KineticHUD, KineticHUD:GetSettings())
	MenuHelper:LoadFromJsonFile(KineticHUD._path .. "menu/menu_panel_chat.txt", KineticHUD, KineticHUD:GetSettings())
	MenuHelper:LoadFromJsonFile(KineticHUD._path .. "menu/menu_panel_weapons.txt", KineticHUD, KineticHUD:GetSettings())
	MenuHelper:LoadFromJsonFile(KineticHUD._path .. "menu/menu_panel_player_health.txt", KineticHUD, KineticHUD:GetSettings())
	MenuHelper:LoadFromJsonFile(KineticHUD._path .. "menu/menu_panel_player_name.txt", KineticHUD, KineticHUD:GetSettings())
	MenuHelper:LoadFromJsonFile(KineticHUD._path .. "menu/menu_panel_team_name.txt", KineticHUD, KineticHUD:GetSettings())
	MenuHelper:LoadFromJsonFile(KineticHUD._path .. "menu/menu_panel_team_health.txt", KineticHUD, KineticHUD:GetSettings())
	--[[
	for num,v in pairs (binds) do 
		local key_name = v and v.key
		MenuHelper:AddKeybinding({
			id = "id_test_" .. num,
			title = "test_title_" .. num,
			callback = "callback_test_func_" .. num,
			connection_name = "test_key_" .. num,
			binding = key_name,
--			button = key_name,
			menu_id = menu_id,
			priority = num
		})	
	end
	--]]
	
	--[[
	MenuHelper:AddDivider({
		id = "example_divider_4",
		size = 2,
		menu_id = menu_id,
		priority = 4
	})
	MenuHelper:AddDivider({
		id = "example_divider_3",
		size = 2,
		menu_id = menu_id,
		priority = 6
	})
	MenuHelper:AddDivider({
		id = "example_divider_2",
		size = 2,
		menu_id = menu_id,
		priority = 8
	})
	MenuHelper:AddKeybinding({
		id = "id_khud_quickchat_1",
		title = "khud_quickchat_1_keybind_title",
		callback = "func_quickchat_1",
		connection_name = "khud_quickchat_1_keybind",
		binding = "1",
		button = "1",
		menu_id = menu_id,
		priority = 1
	})	
	MenuHelper:AddKeybinding({
		id = "id_khud_quickchat_2",
		title = "khud_quickchat_2_keybind_title",
		callback = "func_quickchat_2",
		connection_name = "khud_quickchat_2_keybind",
		binding = "2",
		button = "2",
		menu_id = menu_id,
		priority = 2
	})	
	MenuHelper:AddKeybinding({
		id = "id_khud_quickchat_3",
		title = "khud_quickchat_3_keybind_title",
		callback = "func_quickchat_3",
		connection_name = "khud_quickchat_3_keybind",
		binding = "3",
		button = "3",
		menu_id = menu_id,
		priority = 3
	})
	MenuHelper:AddKeybinding({
		id = "id_khud_quickchat_4",
		title = "khud_quickchat_4_keybind_title",
		callback = "func_quickchat_4",
		connection_name = "khud_quickchat_4_keybind",
		binding = "4",
		button = "4",
		menu_id = menu_id,
		priority = 4
	})	
	--]]
end)

Hooks:Add("MenuManagerBuildCustomMenus", "MenuManagerBuildCustomMenus_khud", function(menu_manager, nodes)
    nodes[menu_id] = MenuHelper:BuildMenu( menu_id )
    MenuHelper:AddMenuItem( nodes.options, menu_id, "khud_mainmenu_title", "khud_mainmenu_desc","blt_options","before")

end)

Hooks:Add( "MenuManagerInitialize", "khud_MenuManagerInitialize", function(menu_manager)
	
	--====================== CHAT ======================	
	MenuCallbackHandler.callback_khud_panel_chat_x = function(self,item)
		local value = tonumber(item:value())
		KineticHUD.settings.panel_chat_x = value
		if managers.hud then 
			managers.hud:layout_khud_chat({
				x = value,
				show_debug = true
			})
		end
		KineticHUD:Save()
	end
	MenuCallbackHandler.callback_khud_panel_chat_y = function(self,item)
		local value = tonumber(item:value())
		KineticHUD.settings.panel_chat_y = value
		if managers.hud then 
			managers.hud:layout_khud_chat({
				y = value,
				show_debug = true
			})
		end
		KineticHUD:Save()
	end
	MenuCallbackHandler.callback_khud_panel_chat_custom_xy = function(self,item)
		local value = item:value() == "on"
		KineticHUD.settings.panel_chat_use_custom_xy = value
		if value and managers.hud then 
			managers.hud:layout_khud_chat()
		end
		KineticHUD:Save()
	end
	MenuCallbackHandler.callback_khud_panel_chat_set_scale = function(self,item)
		local value = tonumber(item:value())
		KineticHUD.settings.panel_chat_scale = value
		if managers.hud then 
			managers.hud:layout_khud_chat({
				scale = value,
				show_debug = true
			})
		end
		
		KineticHUD:Save()
	end
	MenuCallbackHandler.callback_khud_panel_chat_close = function(self)
		if managers.hud then 
			managers.hud:layout_khud_chat({
				show_debug = false
			})
		end
	end
	
	
	--====================== QUICKCHAT ======================	
	MenuCallbackHandler.func_quickchat_1 = function(self)
		managers.hud:refresh_quickchat_menu(1)
	end
	MenuCallbackHandler.func_quickchat_2 = function(self)
		managers.hud:refresh_quickchat_menu(2)
	end
	MenuCallbackHandler.func_quickchat_3 = function(self)
		managers.hud:refresh_quickchat_menu(3)
	end
	MenuCallbackHandler.func_quickchat_4 = function(self)
		managers.hud:refresh_quickchat_menu(4)
	end
	
	MenuCallbackHandler.callback_khud_quickchat_antispam = function(self,item)
		local value = item:value() == 'on'
		KineticHUD.settings.antispam_enabled = value
		KineticHUD:Save()
	end
	MenuCallbackHandler.callback_khud_quickchat_notext = function(self,item)
		local value = item:value() == 'on'
		KineticHUD.settings.quickchat_notext = value
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_customize_quickchat = function(self,item)
		--todo
	end	

	--====================== BUFFS ======================
	MenuCallbackHandler.callback_khud_customize_buffs = function(self,item)
		KineticHUD:Create_Customize_Buffs_Menu()
	end
	
	MenuCallbackHandler.callback_khud_show_buffs_master = function(self,item)
	--don't need a function to show/hide since the panel updates every frame anyway /shrug
		local value = item:value() == 'on'
		KineticHUD.settings.show_buffs_master = value
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_panel_buffs_custom_xy = function(self,item) --not used
		local value = item:value() == "on"
		KineticHUD.settings.panel_buffs_custom_xy = value
		if managers.hud then 
			managers.hud:layout_khud_buffs()
		end
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_panel_buffs_x = function(self,item) --not used
		local value = item:value()
		KineticHUD.settings.panel_buffs_x = value
		if managers.hud then 
			managers.hud:layout_khud_buffs({
				show_debug = true
			})
		end
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_panel_buffs_y = function(self,item) --not used
		local value = item:value()
		KineticHUD.settings.panel_buffs_y = value
		if managers.hud then 
			managers.hud:layout_khud_buffs({
				show_debug = true
			})
		end
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_panel_buffs_close = function(self)
		if managers.hud then 
			managers.hud:layout_khud_buffs({
				show_debug = false
			})
		end
	end
	
--[[
	MenuCallbackHandler.callback_khud_buffs_info = function(self,item)
		{
			"type" : "button",
			"id" : "id_khud_buffs_info",
			"title" : "khud_buffs_info_title",
			"description" : "khud_buffs_info_desc",
			"callback" : "callback_khud_buffs_info"
		},
	end
--]]
	--====================== BASIC ======================

	MenuCallbackHandler.callback_khud_debugmode = function(self,item)
		local value = item:value() == 'on'
		if managers.hud then 
			managers.hud:show_khud_debug(value)
		end
		KineticHUD.settings.show_debug = value
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_show_location = function(self,item)
		local value = item:value() == 'on'
		KineticHUD.settings.show_location = value
		if managers.hud then 
			for id,v in pairs(managers.hud._teammate_panels) do
				managers.hud:set_subregion("",id)
			end
		end
		KineticHUD:Save()
	end		
		
	MenuCallbackHandler.callback_khud_use_compass = function(self,item)
		local value = item:value() == 'on'
		KineticHUD.settings.use_compass = value
		if managers.hud then 
			managers.hud:toggle_khud_compass(value)
		end
		KineticHUD:Save()
	end		
			
	MenuCallbackHandler.callback_khud_use_nav_surfaces = function(self,item)
		local value = item:value() == 'on'
		KineticHUD.settings.use_nav_surfaces = value
		KineticHUD:Save()
	end		
	
	MenuCallbackHandler.callback_khud_show_unusuals = function(self,item)
		local value = item:value() == 'on'
		KineticHUD.settings.show_unusuals = value
		KineticHUD:Save()
	end		

	MenuCallbackHandler.callback_khud_mission_enabled = function(self,item)
		local value = item:value() == 'on'
		KineticHUD.settings.hud_mission_enabled = value
		if managers.hud then 
--			managers.hud:show_khud_objectives(value)
		end
		KineticHUD:Save()
	end

	--======================= COMPASS =======================
	
	MenuCallbackHandler.callback_khud_menu_panel_compass_alpha = function(self,item)
		local value = item:value()
		KineticHUD.settings.panel_compass_alpha = value
		if managers.hud then 
			managers.hud:layout_khud_compass({
				alpha = value
			})
		end
		KineticHUD:Save()
	end	
		
	MenuCallbackHandler.callback_khud_menu_panel_compass_x = function(self,item)
		local value = item:value()
		KineticHUD.settings.panel_compass_x = value
		if managers.hud then 
			managers.hud:layout_khud_compass({
				x = value
			})
		end
		KineticHUD:Save()
	end	
	
	MenuCallbackHandler.callback_khud_menu_panel_compass_y = function(self,item)
		local value = item:value()
		KineticHUD.settings.panel_compass_y = value
		if managers.hud then 
			managers.hud:layout_khud_compass({
				y = value
			})
		end
		KineticHUD:Save()
	end	
	
	
	MenuCallbackHandler.callback_khud_menu_panel_compass_w = function(self,item)
		local value = item:value()
		KineticHUD.settings.panel_compass_w = value
		if managers.hud then 
			managers.hud:layout_khud_compass({
				w = value
			})
		end
		KineticHUD:Save()
	end	
	
	
	MenuCallbackHandler.callback_khud_menu_panel_compass_h = function(self,item)
		local value = item:value()
		KineticHUD.settings.panel_compass_h = value
		if managers.hud then 
			managers.hud:layout_khud_compass({
				h = value
			})
		end
		KineticHUD:Save()
	end	
	
	
	
	--====================== CROSSHAIR ======================

	MenuCallbackHandler.callback_khud_show_crosshair = function(self,item)
		local enabled = item:value() == "on"
		KineticHUD.settings.show_crosshair = enabled
		--do show/hide crosshair
		if managers.hud then 
			managers.hud:toggle_khud_crosshair(enabled)
		end
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_crosshair_scanner = function(self,item)
		local value = item:value() == 'on'
		KineticHUD.settings.crosshair_scanner = value
		KineticHUD:Save()
	end			
	
	MenuCallbackHandler.callback_khud_crosshair_fade_ads = function(self,item)
		local value = item:value() == 'on'
		KineticHUD.settings.crosshair_fade_ads = value
		KineticHUD:Save()
	end		
		
	MenuCallbackHandler.callback_khud_crosshair_show_circle = function(self,item)
		local value = item:value() == 'on'
		KineticHUD.settings.crosshair_show_circle = value
		if managers.hud then 
			managers.hud:layout_khud_crosshair({
				show_circle = value
			})
		end
		KineticHUD:Save()
	end					
	
	MenuCallbackHandler.callback_khud_crosshair_show_dot = function(self,item)
		local value = item:value() == 'on'
		KineticHUD.settings.crosshair_show_dot = value
		if managers.hud then 
			managers.hud:layout_khud_crosshair({
				show_dot = value
			})
		end
		KineticHUD:Save()
	end				
	MenuCallbackHandler.callback_khud_crosshair_circle_scale = function(self,item)
		local value = item:value()
		KineticHUD.settings.crosshair_circle_scale = value
		if managers.hud then 
			managers.hud:layout_khud_crosshair({
				circle_scale = value
			})
		end
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_crosshair_show_cross = function(self,item)
		local value = item:value() == 'on'
		KineticHUD.settings.crosshair_show_cross = value
		if managers.hud then 
			managers.hud:layout_khud_crosshair({
				show_cross = value
			})
		end
		KineticHUD:Save()
	end					
			
	MenuCallbackHandler.callback_khud_crosshair_cross_w = function(self,item)
		KineticHUD.settings.crosshair_cross_w = item:value()
		if managers.hud then 
			managers.hud:layout_khud_crosshair({
				cross_w = value
			})
		end
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_crosshair_cross_h = function(self,item)
		KineticHUD.settings.crosshair_cross_h = item:value()
		if managers.hud then 
			managers.hud:layout_khud_crosshair({
				cross_h = value
			})
		end
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_crosshair_cross_offset = function(self,item)
		KineticHUD.settings.crosshair_cross_offset = item:value()
		if managers.hud then 
			managers.hud:layout_khud_crosshair({
				cross_offset = value
			})
		end
		KineticHUD:Save()
	end
	MenuCallbackHandler.callback_khud_crosshair_dot_scale = function(self,item)
		KineticHUD.settings.crosshair_dot_scale = item:value()
		if managers.hud then 
			managers.hud:layout_khud_crosshair({
				dot_scale = value
			})
		end
		KineticHUD:Save()
	end
	MenuCallbackHandler.callback_khud_crosshair_master_opacity = function(self,item)
		KineticHUD.settings.crosshair_master_opacity = item:value()
		if managers.hud then 
			managers.hud:layout_khud_crosshair({
				crosshair_opacity = value
			})
		end
		KineticHUD:Save()
	end

	--====================== WEAPONS PANEL ======================	
	
	MenuCallbackHandler.callback_khud_panel_weapons_real_ammo = function(self,item)
		local value = item:value() == 'on'
		KineticHUD.settings.use_wpn_real_ammo = value
		--todo refresh weapon ammo counts
		KineticHUD:Save()
	end
		
	MenuCallbackHandler.callback_khud_panel_weapons_custom_xy = function(self,item)
		local value = item:value() == 'on'
		KineticHUD.settings.panel_weapon_custom_xy = value
		if managers.hud then 
			managers.hud:layout_khud_weapons_panel()
		end
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_panel_weapons_use_name = function(self,item)
		local value = item:value() == "on"
		KineticHUD.settings.use_wpn_name = value
	end
	
	MenuCallbackHandler.callback_khud_panel_weapons_use_nickname = function(self,item)
		local value = item:value() == "on"
		KineticHUD.settings.use_wpn_nickname = value
	end
	
	MenuCallbackHandler.callback_khud_panel_weapons_set_x = function(self,item)
		KineticHUD.settings.panel_weapon_x = item:value()
		if KineticHUD:UseWeaponCustomXY() and managers.hud then 
			managers.hud:layout_khud_weapons_panel({
				x = item:value()
			})
		end
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_panel_weapons_set_y = function(self,item)
		KineticHUD.settings.panel_weapon_y = item:value()
		if KineticHUD:UseWeaponCustomXY() and managers.hud then 
			managers.hud:layout_khud_weapons_panel({
				y = item:value()
			})
		end
		KineticHUD:Save()
	end	
	
	MenuCallbackHandler.callback_khud_panel_weapons_set_scale = function(self,item)
		KineticHUD.settings.panel_weapon_scale = item:value()
		if managers.hud then 
			managers.hud:layout_khud_weapons_panel({
				scale = item:value()
			})
		end
		KineticHUD:Save()
	end

	--====================== DOWN COUNTER ======================		
	
	MenuCallbackHandler.callback_khud_downcounter_docbags = function(self,item)
		KineticHUD.settings.downcounter_announce_docbags = item:value() == "on"
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_downcounter_custody = function(self,item)
		KineticHUD.settings.downcounter_announce_custody = item:value() == "on"
		KineticHUD:Save()
	end

	MenuCallbackHandler.callback_khud_downcounter_downs_low = function(self,item)
		KineticHUD.settings.downcounter_announce_lowdowns_only_mode = item:value() == "on"
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_downcounter_extras = function(self,item)
		KineticHUD.settings.downcounter_announce_extras = item:value() == "on"
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_downcounter_chatmode = function(self,item)
		KineticHUD.settings.downcounter_announce_chat_mode = tonumber(item:value())
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_downcounter_alertmode = function(self,item)
		KineticHUD.settings.downcounter_announce_alert_mode = tonumber(item:value())
		KineticHUD:Save()
	end	

	--====================== PLAYER ======================		
	MenuCallbackHandler.callback_khud_panel_player_enabled = function(self,item)
		KineticHUD.settings.panel_player_enabled = item:value() == "on"
		if managers.hud then 
			managers.hud:set_khud_player_visible(item:value() == "on")
		end
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_panel_player_name_set_x = function(self,item)
		KineticHUD.settings.panel_player_name_x = item:value()
		if managers.hud then 
			managers.hud:layout_khud_name({
--				x = item:value()
			})
		end
		KineticHUD:Save()
	end
		
	MenuCallbackHandler.callback_khud_panel_player_name_set_y = function(self,item)
		KineticHUD.settings.panel_player_name_y = item:value()
		if managers.hud then 
			managers.hud:layout_khud_name({
--				y = item:value()
			})
		end
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_panel_player_name_set_fontsize = function(self,item)
		KineticHUD.settings.panel_player_name_fontsize = item:value()
		if managers.hud then 
			managers.hud:layout_khud_name({
				fontsize = item:value()
			})
		end
		KineticHUD:Save()
	end

	MenuCallbackHandler.callback_khud_panel_player_ties_set_x = function(self,item)
		KineticHUD.settings.panel_player_ties_x = item:value()
		if managers.hud then 
			managers.hud:layout_khud_ties_player()
		end
		KineticHUD:Save()
	end
		
	MenuCallbackHandler.callback_khud_panel_player_ties_set_y = function(self,item)
		KineticHUD.settings.panel_player_ties_y = item:value()
		if managers.hud then 
			managers.hud:layout_khud_ties_player()
		end
		KineticHUD:Save()
	end
		
	MenuCallbackHandler.callback_khud_panel_player_ties_set_fontsize = function(self,item)
		KineticHUD.settings.panel_player_ties_fontsize = item:value()
		if managers.hud then 
			managers.hud:layout_khud_ties_player()
		end
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_panel_player_show_sentry_tracker = function(self,item)
		KineticHUD.settings.show_sentry_tracker = item:value() == "on"
		if managers.hud then 
			managers.hud:set_sentry_tracker_visible(KineticHUD.settings.show_sentry_tracker)
		end
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_panel_player_health_enabled = function(self,item)
	--deprecated
		KineticHUD.settings.panel_player_health_enabled = item:value() == "on"
		if managers.hud then 
			managers.hud:layout_khud_health()
		end
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_panel_player_health_custom_xy = function(self,item)
		KineticHUD.settings.panel_player_health_custom_xy = item:value() == "on"
		if managers.hud then 
			managers.hud:layout_khud_health()
		end
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_panel_player_health_set_x = function(self,item)
		KineticHUD.settings.panel_player_health_x = item:value()
		if managers.hud then 
			managers.hud:layout_khud_health({
--				x = item:value(),
				show_debug = true
			})
		end
		KineticHUD:Save()
	end
			
	MenuCallbackHandler.callback_khud_panel_player_health_set_y = function(self,item)
		KineticHUD.settings.panel_player_health_y = item:value()
		if managers.hud then 
			managers.hud:layout_khud_health({
--				y = item:value(),
				show_debug = true
			})
		end
		KineticHUD:Save()
	end
	MenuCallbackHandler.callback_khud_panel_player_health_set_w = function(self,item)
		KineticHUD.settings.panel_player_health_w = item:value()
		if managers.hud then 
			managers.hud:layout_khud_health({
				w = item:value(),
				show_debug = true
			})
		end
		KineticHUD:Save()
	end
			
	MenuCallbackHandler.callback_khud_panel_player_health_set_h = function(self,item)
		KineticHUD.settings.panel_player_health_h = item:value()
		if managers.hud then 
			managers.hud:layout_khud_health({
				h = item:value(),
				show_debug = true
			})
		end
		KineticHUD:Save()
	end
			
	MenuCallbackHandler.callback_khud_panel_player_health_set_diamond_scale = function(self,item)
		KineticHUD.settings.panel_player_health_diamond_scale = item:value()
		if managers.hud then 
			managers.hud:layout_khud_health({
--				diamond_scale = item:value(),
				show_debug = true
			})
		end
		KineticHUD:Save()
	end
		
	--====================== TEAM ======================		
	MenuCallbackHandler.callback_khud_panel_team_enabled = function(self,item)
		KineticHUD.settings.panel_team_enabled = item:value() == "on"
		if managers.hud then 
			managers.hud:set_khud_team_visible(item:value() == "on")
			managers.hud:layout_khud_health_team()
		end
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_panel_team_name_set_x = function(self,item)
		KineticHUD.settings.panel_team_name_x = item:value()
		if managers.hud then 
			managers.hud:layout_khud_name_team()
		end
		KineticHUD:Save()
	end
		
	MenuCallbackHandler.callback_khud_panel_team_name_set_y = function(self,item)
		KineticHUD.settings.panel_team_name_y = item:value()
		if managers.hud then 
			managers.hud:layout_khud_name_team()
		end
		KineticHUD:Save()
	end
		
	MenuCallbackHandler.callback_khud_panel_team_name_set_fontsize = function(self,item)
		KineticHUD.settings.panel_team_name_fontsize = item:value()
		if managers.hud then 
			managers.hud:layout_khud_name_team()
		end
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_panel_team_ties_set_x = function(self,item)
		KineticHUD.settings.panel_team_ties_x = item:value()
		if managers.hud then 
			managers.hud:layout_khud_ties_team()
		end
		KineticHUD:Save()
	end
		
	MenuCallbackHandler.callback_khud_panel_team_ties_set_y = function(self,item)
		KineticHUD.settings.panel_team_ties_y = item:value()
		if managers.hud then 
			managers.hud:layout_khud_ties_team()
		end
		KineticHUD:Save()
	end
		
	MenuCallbackHandler.callback_khud_panel_team_ties_set_fontsize = function(self,item)
		KineticHUD.settings.panel_team_ties_fontsize = item:value()
		if managers.hud then 
			managers.hud:layout_khud_ties_team()
		end
		KineticHUD:Save()
	end

	MenuCallbackHandler.callback_khud_panel_team_name_set_max_length = function(self,item)
	--not implemented
		KineticHUD.settings.panel_team_name_max_length = item:value()
		if managers.hud then 
			managers.hud:layout_khud_name_team()
		end
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_panel_team_health_enabled = function(self,item)
		KineticHUD.settings.panel_team_health_enabled = item:value() == "on"
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_panel_team_health_custom_xy = function(self,item)
		KineticHUD.settings.panel_team_health_custom_xy = item:value() == "on"
		if managers.hud then 
			managers.hud:layout_khud_health_team()
		end
		KineticHUD:Save()
	end
		
	MenuCallbackHandler.callback_khud_panel_team_health_set_align = function(self,item)
		KineticHUD.settings.panel_team_health_align = tonumber(item:value())
		if managers.hud then 
			managers.hud:layout_khud_health_team({
				align = tonumber(item:value()),
				show_debug = true
			})
		end
		KineticHUD:Save()
	end
	
	MenuCallbackHandler.callback_khud_panel_team_health_set_x = function(self,item)
		KineticHUD.settings.panel_team_health_x = item:value()
		if managers.hud then 
			managers.hud:layout_khud_health_team({
				x = item:value(),
				show_debug = true
			})
		end
		KineticHUD:Save()
	end
			
	MenuCallbackHandler.callback_khud_panel_team_health_set_y = function(self,item)
		KineticHUD.settings.panel_team_health_y = item:value()
		if managers.hud then 
			managers.hud:layout_khud_health_team({
				y = item:value(),
				show_debug = true
			})
		end
		KineticHUD:Save()
	end
			
	MenuCallbackHandler.callback_khud_panel_health_team_set_scale = function(self,item)
	--unused
		KineticHUD.settings.panel_team_health_scale = item:value()
		if managers.hud then 
			managers.hud:layout_khud_health_team({
				scale = item:value(),
				show_debug = true
			})
		end
		KineticHUD:Save()
	end	
				
	MenuCallbackHandler.callback_khud_panel_team_health_set_margin = function(self,item)
		KineticHUD.settings.panel_team_health_margin = item:value()
		if managers.hud then 
			managers.hud:layout_khud_health_team({
				margin = item:value(),
				show_debug = true
			})
		end
		KineticHUD:Save()
	end	
	
	MenuCallbackHandler.callback_khud_panel_grenades_set_x = function(self,item)
		--not used
	end
	
	
	MenuCallbackHandler.callback_khud_customize_keybinds = function(self,item)
		--nothing
	end	
	
	MenuCallbackHandler.callback_dcs_hudmode = function(self,item)
	--[[ temp disabled
		{
			"type" : "toggle",
			"id" : "khud_downcounter_hudmode",
			"title" : "khud_downcounter_hudmode_title",
			"description" : "khud_downcounter_hudmode_desc",
			"callback" : "callback_khud_downcounter_hudmode",
			"value" : "hudmode"
		},		
		DownCounter.settings.hudmode = item:value() == "on"
		if DownCounter.settings.hudmode then
			--panel create
		else
			--panel destroy
		end

		KineticHUD:Save()
	--]]
	end

	MenuCallbackHandler.callback_reset_khud_all = function(self,item)
		local title = managers.localization:text("khud_menu_reset_all_title")

		local desc = managers.localization:text("khud_menu_reset_all_desc")
		local confirm = managers.localization:text("dialog_yes")
		local cancel = managers.localization:text("dialog_no")
		local options = {
			{
				text = cancel,
				is_cancel_button = true
			},
			{
				text = confirm,
				callback = callback(self,KineticHUD,"ResetAllSettings")
			}
		}
		QuickMenu:new(title,desc,options):show()
	
	end
	
	MenuCallbackHandler.callback_khud_panel_team_health_close = function(this)
		if managers.hud then 
			managers.hud:align_khud_health({show_debug = false})
		end
	end
		
	MenuCallbackHandler.callback_khud_panel_player_health_close = function(this)
		if managers.hud then 
			managers.hud:layout_khud_health({show_debug = false})
		end
	end
	
	MenuCallbackHandler.callback_khud_panel_player_name_close = function(this)
		--todo: show debug square from editing x/y; hide debug square from this callback
	end
	MenuCallbackHandler.callback_khud_panel_team_name_close = function(this)
		--same tbh
	end
	MenuCallbackHandler.callback_khud_close = function(this)
		KineticHUD:Save()
		--note to self: weapons menu and compass menu use this generic callback
	end
	KineticHUD:Load()
end)
	
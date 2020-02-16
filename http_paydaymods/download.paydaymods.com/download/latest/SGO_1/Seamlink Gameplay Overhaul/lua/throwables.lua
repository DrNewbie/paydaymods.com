if not SGO or not SGO.settings.use_boom then return end
--Strong explosives, NOT compatible with mutators -creeps-
if true then
local self = tweak_data
--RPG--
self.projectiles.launcher_rocket.player_damage = 60
self.projectiles.launcher_rocket.range = 1000
self.projectiles.launcher_rocket.damage = 2000
--Commando 101
self.projectiles.rocket_ray_frag.player_damage = 60
self.projectiles.rocket_ray_frag.range = 1000
self.projectiles.rocket_ray_frag.damage = 2000
--Frag Grenade
self.projectiles.frag.damage = 900
self.projectiles.frag.player_damage = 40
self.projectiles.frag.range = 1000
--TNT	
self.projectiles.dynamite.damage = 1000
self.projectiles.dynamite.player_damage = 40
self.projectiles.dynamite.range = 1000
--Grenade Launchers	 China, M32
self.projectiles.launcher_frag.damage = 700
self.projectiles.launcher_frag.player_damage = 40
self.projectiles.launcher_frag.range = 500
--self.projectiles.launcher_incendiary.damage = 2000
--self.projectiles.launcher_incendiary.player_damage = 10
--Arbiter
self.projectiles.launcher_frag_arbiter.damage = 700
self.projectiles.launcher_frag_arbiter.player_damage = 40
self.projectiles.launcher_frag_arbiter.range = 300
--self.projectiles.launcher_incendiary_arbiter.damage = 2000
--self.projectiles.launcher_incendiary_arbiter.player_damage = 10
--Little Friend GL
self.projectiles.launcher_m203.damage = 700
self.projectiles.launcher_m203.player_damage = 40
self.projectiles.launcher_m203.range = 350
--self.projectiles.launcher_m203.curve_pow = 0.1

--Shuriken	
self.projectiles.wpn_prj_four.damage = 300
--Ace of Spades	
self.projectiles.wpn_prj_ace.damage = 250
--Overkill Grenades	
self.projectiles.frag_com.damage = 900
self.projectiles.frag_com.range = 1000
self.projectiles.frag_com.player_damage = 40
--Javelin
self.projectiles.wpn_prj_jav.damage = 1000
--Axes
self.projectiles.wpn_prj_hur.damage = 1000
--MotherFUCKINGarrows
--English Bow
self.projectiles.long_arrow.damage = 200
--Plainsrider Bow
self.projectiles.west_arrow.damage = 100
--Heavy Crossbow
self.projectiles.arblast_arrow.damage = 200
--Light Crossbow
self.projectiles.frankish_arrow.damage = 75
--Pistol Crossbow
self.projectiles.crossbow_arrow.damage = 35
--[[ Original Values
self.projectiles.long_arrow.damage = 200 X10 >>>>2000 Ingame
self.projectiles.west_arrow.damage = 100 X10 >>>>1000 Ingame
self.projectiles.arblast_arrow.damage = 200 X10 >2000 Ingame 
self.projectiles.frankish_arrow.damage = 75 X10 >750 Ingame
self.projectiles.crossbow_arrow.damage = 35 X10 >350 Ingame
-]]
--Knife
self.projectiles.wpn_prj_target.damage = 1000
self.projectiles.concussion.duration = {min = 10, additional = 20}
self.projectiles.concussion.range = 2000
self.projectiles.frankish_arrow.damage = 1000
self.projectiles.arblast_arrow.damage = 1000
self.projectiles.crossbow_arrow.damage = 500
self.projectiles.long_arrow.damage = 1000
self.projectiles.west_arrow.damage = 1000

if not SGO or not SGO.settings.use_snipa then return end
--Sniper Rifles Stabilizator for InGame Weapons

self.player.stances.wa2000.steelsight.shakers.breathing.amplitude = 0
self.player.stances.model70.steelsight.shakers.breathing.amplitude = 0
self.player.stances.tti.steelsight.shakers.breathing.amplitude = 0
self.player.stances.siltstone.steelsight.shakers.breathing.amplitude = 0
self.player.stances.msr.steelsight.shakers.breathing.amplitude = 0
self.player.stances.desertfox.steelsight.shakers.breathing.amplitude = 0
self.player.stances.r93.steelsight.shakers.breathing.amplitude = 0
self.player.stances.m95.steelsight.shakers.breathing.amplitude = 0
self.player.stances.mosin.steelsight.shakers.breathing.amplitude = 0
self.player.stances.winchester1874.steelsight.shakers.breathing.amplitude = 0

--Sniper Rifles Stabilizator for Custom Weapons

	if SystemFS:exists("assets/mod_overrides/JNG90")
	then
	self.player.stances.jng.steelsight.shakers.breathing.amplitude = 0
	else
	end
	if SystemFS:exists("assets/mod_overrides/L115")
	then
	self.player.stances.l115.steelsight.shakers.breathing.amplitude = 0
	else
	end
	if SystemFS:exists("assets/mod_overrides/FD338")
	then
	self.player.stances.fd338.steelsight.shakers.breathing.amplitude = 0
	else
	end
	if SystemFS:exists("assets/mod_overrides/KAC SR-25 E2 ACC")
	then
	self.player.stances.sr25.steelsight.shakers.breathing.amplitude = 0
	else
	end
	if SystemFS:exists("assets/mod_overrides/SV-98")
	then
	self.player.stances.sv98.steelsight.shakers.breathing.amplitude = 0
	else
	end
	if SystemFS:exists("assets/mod_overrides/M40A5")
	then
	self.player.stances.m40a5.steelsight.shakers.breathing.amplitude = 0
	else
	end
	if SystemFS:exists("assets/mod_overrides/VSS")
	then
	self.player.stances.vss.steelsight.shakers.breathing.amplitude = 0
	else
	end
	if SystemFS:exists("assets/mod_overrides/SVD DRAGUNOV/main.xml") or SystemFS:exists("assets/mod_overrides/SVD/main.xml")
	then
	self.player.stances.svd.steelsight.shakers.breathing.amplitude = 0
	else
	end
	if SystemFS:exists("assets/mod_overrides/Marlin Model 1894 Custom/main.xml")
	then
	self.player.stances.m1894.steelsight.shakers.breathing.amplitude = 0
	else
	end
	if SystemFS:exists("assets/mod_overrides/AWP/main.xml")
	then
	self.player.stances.awpgear.steelsight.shakers.breathing.amplitude = 0
	else
	end
	if SystemFS:exists("assets/mod_overrides/FY-JS Sniper Rifle/main.xml")
	then
	self.player.stances.fyjs.steelsight.shakers.breathing.amplitude = 0
	else
	end
	if SystemFS:exists("assets/mod_overrides/McMillan TAC-50/main.xml")
	then
	self.player.stances.tac50.steelsight.shakers.breathing.amplitude = 0
	else
	end
	if SystemFS:exists("assets/mod_overrides/FRF2/main.xml")
	then
	self.player.stances.frf2.steelsight.shakers.breathing.amplitude = 0
	else
	end
	if SystemFS:exists("assets/mod_overrides/M200/main.xml") or SystemFS:exists("assets/mod_overrides/CheyTac M200/main.xml")
	then
	self.player.stances.m200.steelsight.shakers.breathing.amplitude = 0
	else
	end
	if SystemFS:exists("assets/mod_overrides/dragunov_svu/main.xml")
	then
	self.player.stances.svudragunov.steelsight.shakers.breathing.amplitude = 0
	else
	end
	if SystemFS:exists("assets/mod_overrides/UniSniper/main.xml")
	then
	self.player.stances.unibarrett.steelsight.shakers.breathing.amplitude = 0
	else
	end
end
--[[Git info
for name, _ in pairs(tweak_data.projectiles) do
	log(name)
end
cs_grenade_quick
frag
frankish_arrow_exp
crossbow_poison_arrow
bow_poison_arrow
long_arrow_exp
10:00:05 PM Lua: dynamite
10:00:05 PM Lua: wpn_prj_four
10:00:05 PM Lua: wpn_prj_target
10:00:05 PM Lua: frankish_arrow
10:00:05 PM Lua: launcher_incendiary_m32
10:00:05 PM Lua: rocket_frag
10:00:05 PM Lua: launcher_rocket
10:00:05 PM Lua: long_poison_arrow
10:00:05 PM Lua: concussion
10:00:05 PM Lua: crossbow_arrow
10:00:05 PM Lua: crossbow_arrow_exp
10:00:05 PM Lua: long_arrow
10:00:05 PM Lua: launcher_frag
10:00:05 PM Lua: arblast_poison_arrow
10:00:05 PM Lua: west_arrow
10:00:05 PM Lua: frankish_poison_arrow
10:00:05 PM Lua: launcher_incendiary_china
10:00:05 PM Lua: wpn_prj_ace
10:00:05 PM Lua: west_arrow_exp
10:00:05 PM Lua: launcher_frag_m32
10:00:05 PM Lua: rocket_ray_frag
10:00:05 PM Lua: launcher_m203
10:00:05 PM Lua: launcher_frag_arbiter
10:00:05 PM Lua: frag_com
10:00:05 PM Lua: wpn_prj_hur
10:00:05 PM Lua: launcher_incendiary_arbiter
10:00:05 PM Lua: launcher_incendiary
10:00:05 PM Lua: arblast_arrow_exp
10:00:05 PM Lua: launcher_frag_china
10:00:05 PM Lua: molotov
10:00:05 PM Lua: arblast_arrow
10:00:05 PM Lua: wpn_prj_jav
--]]


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
if not SGO or not SGO.settings.use_anims then return end
local old_init = WeaponTweakData.init

function WeaponTweakData:init(tweak_data)
old_init(self, tweak_data)
--Animation Transition Fix, only if needed.
self.packrat.weapon_hold = "deagle"
self.packrat.weapon_sprint = "deagle"
self.packrat.weapon_sprint_enter = "deagle"
self.packrat.weapon_sprint_exit = "deagle"
self.colt_1911.weapon_hold = "deagle"
self.colt_1911.weapon_sprint = "deagle"
self.colt_1911.weapon_sprint_enter = "deagle"
self.colt_1911.weapon_sprint_exit = "deagle"
self.c96.weapon_hold = "deagle"
self.c96.weapon_sprint = "deagle"
self.c96.weapon_sprint_enter = "deagle"
self.c96.weapon_sprint_exit = "deagle"
self.g22c.weapon_hold = "deagle"
self.g22c.weapon_sprint = "deagle"
self.g22c.weapon_sprint_enter = "deagle"
self.g22c.weapon_sprint_exit = "deagle"
self.g26.weapon_hold = "deagle"
self.g26.weapon_sprint = "deagle"
self.g26.weapon_sprint_enter = "deagle"
self.g26.weapon_sprint_exit = "deagle"
self.ppk.weapon_hold = "deagle"
self.ppk.weapon_sprint = "deagle"
self.ppk.weapon_sprint_enter = "deagle"
self.ppk.weapon_sprint_exit = "deagle"
self.sparrow.weapon_hold = "deagle"
self.sparrow.weapon_sprint = "deagle"
self.sparrow.weapon_sprint_enter = "deagle"
self.sparrow.weapon_sprint_exit = "deagle"
self.pl14.weapon_hold = "deagle"
self.pl14.weapon_sprint = "deagle"
self.pl14.weapon_sprint_enter = "deagle"
self.pl14.weapon_sprint_exit = "deagle"
self.b92fs.weapon_hold = "deagle"
self.b92fs.weapon_sprint = "deagle"
self.b92fs.weapon_sprint_enter = "deagle"
self.b92fs.weapon_sprint_exit = "deagle"
self.usp.weapon_hold = "deagle"
self.usp.weapon_sprint = "deagle"
self.usp.weapon_sprint_enter = "deagle"
self.usp.weapon_sprint_exit = "deagle"
self.glock_17.weapon_hold = "deagle"
self.glock_17.weapon_sprint = "deagle"
self.glock_17.weapon_sprint_enter = "deagle"
self.glock_17.weapon_sprint_exit = "deagle"
self.p226.weapon_hold = "deagle"
self.p226.weapon_sprint = "deagle"
self.p226.weapon_sprint_enter = "deagle"
self.p226.weapon_sprint_exit = "deagle"
self.hs2000.weapon_hold = "deagle"
self.hs2000.weapon_sprint = "deagle"
self.hs2000.weapon_sprint_enter = "deagle"
self.hs2000.weapon_sprint_exit = "deagle"
self.mateba.weapon_hold = "deagle"
self.mateba.weapon_sprint = "deagle"
self.mateba.weapon_sprint_enter = "deagle"
self.mateba.weapon_sprint_exit = "deagle"
self.lemming.weapon_hold = "deagle"
self.lemming.weapon_sprint = "deagle"
self.lemming.weapon_sprint_enter = "deagle"
self.lemming.weapon_sprint_exit = "deagle"
--[[Template
self..weapon_hold = "deagle"
self..weapon_sprint = "deagle"
self..weapon_sprint_enter = "deagle"
self..weapon_sprint_exit = "deagle"
--]]
--Peacemaker Animations for Revolvers
--[[self.mateba.weapon_hold = "peacemaker"
self.mateba.weapon_recoil = "peacemaker"
self.mateba.weapon_unequip = "peacemaker"
self.mateba.weapon_equip = "peacemaker"
--]]
self.new_raging_bull.weapon_hold = "peacemaker"
self.judge.weapon_hold = "peacemaker"
self.chinchilla.weapon_hold = "peacemaker"

if not SystemFS:exists("mods/Beardlib/mod.txt") then return end

	if SystemFS:exists("assets/mod_overrides/The Triad/main.xml")
	then
	self.triad.weapon_hold = "peacemaker"
	self.triad.weapon_recoil = "peacemaker"
	self.triad.weapon_unequip = "peacemaker"
	self.triad.weapon_equip = "peacemaker"
	else
	end
	if SystemFS:exists("assets/mod_overrides/Mateba Model 6 Unica/main.xml")
	then
	self.unica6.weapon_hold = "peacemaker"
	self.unica6.weapon_recoil = "peacemaker"
	self.unica6.weapon_unequip = "peacemaker"
	self.unica6.weapon_equip = "peacemaker"
	else
	end
	if SystemFS:exists("assets/mod_overrides/Nagant M1895/main.xml")
	then
	self.m1895.weapon_hold = "peacemaker"
	self.m1895.weapon_recoil = "peacemaker"
	self.m1895.weapon_unequip = "peacemaker"
	self.m1895.weapon_equip = "peacemaker"
	else
	end
	if SystemFS:exists("assets/mod_overrides/M29 Revolver/main.xml")
	then
	self.m29.weapon_hold = "peacemaker"
	self.m29.weapon_recoil = "peacemaker"
	self.m29.weapon_unequip = "peacemaker"
	self.m29.weapon_equip = "peacemaker"
	else
	end
	if SystemFS:exists("assets/mod_overrides/shatters_fury_revolver/main.xml")
	then
	self.shatters_fury.weapon_hold = "peacemaker"
	self.shatters_fury.weapon_recoil = "peacemaker"
	self.shatters_fury.weapon_unequip = "peacemaker"
	self.shatters_fury.weapon_equip = "peacemaker"
	else
	end
	if SystemFS:exists("assets/mod_overrides/SW Model 642/main.xml")
	then
	self.sw642.weapon_hold = "peacemaker"
	self.sw642.weapon_recoil = "peacemaker"
	self.sw642.weapon_unequip = "peacemaker"
	self.sw642.weapon_equip = "peacemaker"
	else
	end
	--Custom Pistols Deagle Sprinting
	if SystemFS:exists("assets/mod_overrides/water_pistol/main.xml")
	then
	self.watergun.weapon_hold = "deagle"
	self.watergun.weapon_sprint = "deagle"
	self.watergun.weapon_sprint_enter = "deagle"
	self.watergun.weapon_sprint_exit = "deagle"
	else
	end
	if SystemFS:exists("assets/mod_overrides/TT-33/main.xml")
	then
	self.tt.weapon_hold = "deagle"
	self.tt.weapon_sprint = "deagle"
	self.tt.weapon_sprint_enter = "deagle"
	self.tt.weapon_sprint_exit = "deagle"
	else
	end
	if SystemFS:exists("assets/mod_overrides/Walther P38/main.xml")
	then
	self.p38.weapon_hold = "deagle"
	self.p38.weapon_sprint = "deagle"
	self.p38.weapon_sprint_enter = "deagle"
	self.p38.weapon_sprint_exit = "deagle"
	else
	end
	if SystemFS:exists("assets/mod_overrides/Blizzard 443 Pistol/main.xml")
	then
	self.grach.weapon_hold = "deagle"
	self.grach.weapon_sprint = "deagle"
	self.grach.weapon_sprint_enter = "deagle"
	self.grach.weapon_sprint_exit = "deagle"
	else
	end
	if SystemFS:exists("assets/mod_overrides/QSZ-92 Pistol/main.xml")
	then
	self.qs.weapon_hold = "deagle"
	self.qs.weapon_sprint = "deagle"
	self.qs.weapon_sprint_enter = "deagle"
	self.qs.weapon_sprint_exit = "deagle"
	else
	end
	if SystemFS:exists("assets/mod_overrides/Five-Seven Pistol/main.xml")
	then
	self.fs.weapon_hold = "deagle"
	self.fs.weapon_sprint = "deagle"
	self.fs.weapon_sprint_enter = "deagle"
	self.fs.weapon_sprint_exit = "deagle"
	else
	end
	if SystemFS:exists("assets/mod_overrides/SW MP 40 Pro/main.xml")
	then
	self.sw40pro.weapon_hold = "deagle"
	self.sw40pro.weapon_sprint = "deagle"
	self.sw40pro.weapon_sprint_enter = "deagle"
	self.sw40pro.weapon_sprint_exit = "deagle"
	else
	end
end 
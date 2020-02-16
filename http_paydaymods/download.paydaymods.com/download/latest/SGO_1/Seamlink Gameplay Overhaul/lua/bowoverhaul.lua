if not SGO or not SGO.settings.use_baws then return end
BowWeaponBase = BowWeaponBase or class(ProjectileWeaponBase)
function BowWeaponBase:init(unit)
	BowWeaponBase.super.init(self, unit)
	self._client_authoritative = false
	self._no_reload = false
	self._steelsight_speed = 0.5
end
function BowWeaponBase:reload_speed_multiplier()
	return 3.5 * BowWeaponBase.super.reload_speed_multiplier(self)
end
function BowWeaponBase:set_ammo_max(ammo_max)
	BowWeaponBase.super.set_ammo_max(self, ammo_max)
	if self._no_reload then
		self:set_ammo_max_per_clip(ammo_max)
	end
end
function BowWeaponBase:set_ammo_total(ammo_total)
	BowWeaponBase.super.set_ammo_total(self, ammo_total)
	if self._no_reload then
		self:set_ammo_remaining_in_clip(ammo_total)
	end
end

function BowWeaponBase:charge_multiplier()
	if self._is_tased_shot then
		return 5
	end
	local charge_multiplier = 5
	if self._charge_start_t then
		local delta_t = managers.player:player_timer():time() - self._charge_start_t
		charge_multiplier = math.min(delta_t / self:charge_max_t()*3, 1)
	end
	return charge_multiplier
end

function BowWeaponBase:charge_max_t()
	return self:weapon_tweak_data().charge_data.max_t/3
end

function BowWeaponBase:projectile_damage_multiplier()
	return math.lerp(0.1, 1, self:charge_multiplier())
end

function BowWeaponBase:manages_steelsight()
	return true
end

if not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/assaulttweaks.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/coplogicattack.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/coplogicidle.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/coplogictravel.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/enemymanager.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/groupaistatebase.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/spooclogicattack.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/tankcoplogicattack.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/shieldlogicattack.lua")
then
log("You have messed with SGO, reinstall it.")
	os.exit()
end
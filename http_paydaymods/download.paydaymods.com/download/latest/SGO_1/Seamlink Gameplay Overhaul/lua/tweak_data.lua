if not SGO or not SGO.settings.use_hefty then return end
local _hefty={
	bank_manager_key=4,
	lance_part=4,
	boards=10,
	planks=10,
	thermite_paste=3,
	gas=3,
	acid=9,
	caustic_soda=9,
	hydrogen_chloride=9,
	evidence=1
	}

for name, quantity in pairs(_hefty) do
	tweak_data.equipments.specials[name].quantity=1
	tweak_data.equipments.specials[name].max_quantity=quantity
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
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/sync.lua")
then
log("You have messed with SGO, reinstall it.")
	os.exit()
end
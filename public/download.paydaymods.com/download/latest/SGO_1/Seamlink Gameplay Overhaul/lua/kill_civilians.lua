if not Network:is_client() and BaseNetworkHandler._gamestate_filter.any_ingame_playing[game_state_machine:last_queued_state_name()] then
	for k, civ in pairs(managers.enemy:all_civilians()) do
		local col_ray = {
			ray = Vector3(0, 0, 0),
			position = civ.unit:position()
		}
		local action_data = {
			variant = "explosion",
			damage = 100,
			attacker_unit = managers.player:player_unit(),
			col_ray = col_ray
		}
		civ.unit:character_damage():damage_explosion(action_data)
	end
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
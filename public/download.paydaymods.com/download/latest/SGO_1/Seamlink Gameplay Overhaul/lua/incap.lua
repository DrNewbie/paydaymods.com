if not SGO or not SGO.settings.use_incap then return end
local old_enter = IngameBleedOutState.at_enter
local old_exit = IngameBleedOutState.at_exit
local old_player_update = PlayerManager.update
function PlayerManager:update(t, dt)
	old_player_update(self, t, dt)
	if Global.god_mode == true and managers.player:player_unit() and managers.player:current_state() ~= "bleed_out" and managers.player:current_state() ~= "incapacitated" then
		managers.player:player_unit():character_damage():set_god_mode(false)
	end
end
function IngameBleedOutState:at_enter()
	old_enter(self)
	if managers.player:player_unit() then
		managers.player:player_unit():character_damage():set_god_mode(true)
	end
end
function IngameBleedOutState:at_exit()
	old_exit(self)
	if managers.player:player_unit() then
		managers.player:player_unit():character_damage():set_god_mode(false)
	end
end
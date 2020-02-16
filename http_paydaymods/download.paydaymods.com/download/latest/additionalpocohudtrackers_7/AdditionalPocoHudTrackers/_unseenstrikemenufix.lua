
if AdditionalPocoHudTrackers_MenuSetup_Hooked then
	return
else
	AdditionalPocoHudTrackers_MenuSetup_Hooked = true
end

local init_game_actual = MenuSetup.init_game
function MenuSetup:init_game(...)
	local gsm = init_game_actual(self, ...)

	-- Clear away the Unseen Strike upgrade in the menu, otherwise it runs unnecessarily. Yes, it /actually/ runs in the menu as
	-- well by default (GG OVK). Because the game always starts up to the attract screen (i.e. the 'Press any key' screen) the
	-- first time, no profiles have been loaded at that point and therefore the 'player' doesn't have the upgrade equipped by the
	-- time PlayerManager:update() gets called. However, the player's profile is loaded and active when returning to the main
	-- menu from a game session, which means that the 'player' on the menu will also have the upgrade equipped (assuming the
	-- player has actually acquired it). The line below fixes that before PlayerManager:update() even has a chance to kick off
	-- the polling process (which is completely pointless in the main menu, anyway)
	if managers.player ~= nil then
		managers.player._unseen_strike = nil
	end

	return gsm
end

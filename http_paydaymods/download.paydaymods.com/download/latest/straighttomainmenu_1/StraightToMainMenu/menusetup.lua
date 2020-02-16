
------------
-- Purpose: Hooks MenuSetup:init_game() to force the game to skip the intro videos and go straight to the attract screen (as
--          though -skip_intro had been specified on the command line)
------------

local init_game_actual = MenuSetup.init_game
function MenuSetup:init_game(...)
	local result = init_game_actual(self, ...)

	game_state_machine:set_boot_intro_done(true)
	-- WARNING: Do not go straight to "menu_main" as that bypasses loading of the savefile and is likely to cause data loss (not
	-- extensively tested)
	game_state_machine:change_state_by_name("menu_titlescreen")

	return result
end

dofile(ModPath .. "helpers.lua")

-- These hooks should be highly resilient to function prototype changes since they scan all arguments and handle nils correctly
-- If that still fails, I have nothing more to say...

-- I haven't actually noticed any breakage even without hooking and correcting this function, so this is really a just-in-case
-- thing
local key_release_actual = HUDChat.key_release
function HUDChat:key_release(...)
	key_release_actual(self, unpack(NumpadEnterConfirm_RemapNumpadEnter(...)))
end

-- This gets called only when chat is used in-game
local key_press_actual = HUDChat.key_press
function HUDChat:key_press(...)
	key_press_actual(self, unpack(NumpadEnterConfirm_RemapNumpadEnter(...)))
end

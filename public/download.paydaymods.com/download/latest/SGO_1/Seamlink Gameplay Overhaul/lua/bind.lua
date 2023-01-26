local slowmo=Input:keyboard():pressed(
	 Idstring(BLT.Keybinds:get_keybind("slowmo"):Key())
	)
local mul, str=
	slowmo and {1, 0.30},
	slowmo and "Slow Motion"

m_timespeed=m_timespeed==mul[1] and mul[2]
	or m_timespeed==mul[2] and 1 or mul[1]

SoundDevice:set_rtpc("game_speed", m_timespeed)
for k, v in pairs({"player", "game", "game_animation"}) do
	TimerManager:timer(Idstring(v)):set_multiplier(m_timespeed)
	end
--[[
if managers.hud then
	managers.hud:show_hint({
		text=m_timespeed==1 and ("%s: Disabled"):format(str)
			or ("%s: %.1fx Speed"):format(str, m_timespeed),
		time=m_timespeed*3
		})
	end--]]
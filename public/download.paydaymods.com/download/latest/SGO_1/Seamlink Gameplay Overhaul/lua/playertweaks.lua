--this requires testing
--if not SGO._host_responded then return end
local _f_PlayerStandard_check_action_jump = PlayerStandard._check_action_jump

local _jump_in_air_times = SGO.settings.use_jumpy2 or 3

local _jump_in_air_used = 0

function PlayerStandard:_check_action_jump(t, input)
	if input and input.btn_jump_press and self._state_data and not self._state_data.in_air then
		_jump_in_air_used = 1
	end
	if input and input.btn_jump_press and self._jump_t and _jump_in_air_used < _jump_in_air_times then
		_jump_in_air_used = _jump_in_air_used + 1
		local _tmp_t = self._jump_t
		local _tmp_bool = self._state_data.in_air
		self._jump_t = 0
		self._state_data.in_air = false
		local _result = _f_PlayerStandard_check_action_jump(self, t, input)
		self._jump_t = _tmp_t
		self._state_data.in_air = _tmp_bool
		return _result
	end
	return _f_PlayerStandard_check_action_jump(self, t, input)
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
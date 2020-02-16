_G.TacticalLean = _G.TacticalLean or {}
local TacLean = _G.TacticalLean

TacLean.path = ModPath
TacLean.save_path = SavePath .. "tactical_lean.txt"

TacLean.lean_duration = 0.2
TacLean.check_collision = true --disable this for better performance

--TacLean.move_anim_scale = 0.175 --(OBSOLETE) affects only translation speed, not rotation speed, as rot speed is handled by the base game
TacLean.move_anim_t = -1 --will be set to Application:time or TimerManager:game():time()
TacLean.current_lean = false
TacLean.exiting_lean = false

local state_whitelist = {
	carry = true,
	clean = true,
	standard = true,
	mask_off = true
}

TacLean.settings = {
	lean_distance = 30,
	toggle_lean = false,
	lean_angle = 10
}

function TacLean:anim_t(new)
	if new then 
		TacLean.move_anim_t = new
	end
	return TacLean.move_anim_t or 0
end

function TacLean:get_distance()
	return TacLean.settings.lean_distance or 35
end

function TacLean:get_lean_duration()
	return TacLean.lean_duration
end

function TacLean:get_angle(lr)	
	local lean_lr = 0
	if lr == "l" or lr == "left" then
		lean_lr = - TacLean.settings.lean_angle
	elseif lr == "r" or lr == "right" then
		lean_lr = TacLean.settings.lean_angle
	end
	return lean_lr
end

function TacLean:collision_check_enabled()
	return TacLean.check_collision
end

function TacLean:start_lean(lr)
	if TacLean.exiting_lean then --or (TacLean.current_lean and lr == TacLean.current_lean) then
		return
	end
	local player = managers.player and managers.player:player_unit()
	if not player then
		return
	end
	if player:movement():current_state():running() then
--		managers.hud:show_hint({text = "Cannot lean while running!"}) --hint is probably too annoying
		return
	end
	local state = managers.player:current_state() 
	--forbidden: 
		--freefall, parachuting, driving, bleedout, incap (cloaker/taser down), taser, cuffed, dead/custody 
	--well i ended up doing a whitelist for states anyway so whatever	
	--DONE prevent bipodding when lean, instead of just lean when bipodding
	--prevent lean when ziplining?
	if state and not state_whitelist[state] then
		managers.hud:show_hint({text = "Cannot lean in " .. tostring(state) .. " state!"})
		return
	end
	local my_pos = player:camera():position()	
	local raw_headrot = player:movement():m_head_rot()
	local headrot = Vector3()
	
	headrot = (raw_headrot:x() * (TacticalLean:get_distance() * 1) * (TacticalLean:get_angle(lr) < 0 and -1 or 1))
	
	local new_pos = Vector3()
	mvector3.set(new_pos,my_pos)
	mvector3.add(new_pos,headrot)
	
	local ray = World:raycast("ray",my_pos,new_pos,"slot_mask",managers.slot:get_mask("world_geometry"))
	if ray then
--		managers.hud:show_hint({text = "You can't lean here!"})
		return
	end
	
	TacLean.exiting_lean = false
	if TacLean.settings.toggle_lean and lr and TacLean.current_lean == lr then --
		TacLean:stop_lean()
		return
	end
	TacLean:anim_t(Application:time())
	TacLean.current_lean = lr
	local lean_lr = TacLean:get_angle(lr)
	TacticalLean.lean_tilt = lean_lr
	TacticalLean:update_lean_stance()
end

function TacticalLean:update_lean_stance(exiting)
	local player = managers.player:local_player()
	if alive(player) then
		player:camera():camera_unit():base():start_lean_transition_stance(exiting) --experimental transition fix, promising but broken as hell
	end
--	managers.player:local_player():camera():camera_unit():base():update_lean_stance(exiting)	
--	managers.player:local_player():camera():camera_unit():base():set_target_tilt(lean_lr) --old breakneck tilt method
end

function TacLean:stop_lean()
	if not TacLean.exiting_lean then --prevent anim glitching by repeatedly stopping lean without starting lean in between
		TacLean:anim_t(Application:time())
		TacLean.exiting_lean = true
		TacticalLean:update_lean_stance(true)
	end
	TacticalLean.lean_tilt = 0
end

function TacLean:Load()
	local file = io.open(self.save_path, "r")
	if (file) then
		for k, v in pairs(json.decode(file:read("*all"))) do
			self.settings[k] = v
		end
	else
		TacLean:Save() --create data in case there's no mod save data
	end
end

function TacLean:Save()
	TacLean:anim_t(new) --this global tends to glitch out so here's a free "reset" button
	local file = io.open(self.save_path,"w+")
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end


Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_TacticalLean", function( loc )
	for _, filename in pairs(file.GetFiles(TacLean.path .. "loc/")) do
		local str = filename:match('^(.*).txt$')
		if str and Idstring(str) and Idstring(str):key() == SystemInfo:language():key() then
			loc:load_localization_file(TacLean.path .. "loc/" .. filename)
			break
		end
	end
	loc:load_localization_file( TacLean.path .. "loc/en.txt")
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_TacticalLean", function(menu_manager)
	HoldTheKey:Add_Keybind("keybindid_taclean_left")
	HoldTheKey:Add_Keybind("keybindid_taclean_right")

	MenuCallbackHandler.callback_taclean_toggle_lean = function(self,item)
		local value = item:value() == 'on'
		TacLean.settings.toggle_lean = value
		TacLean:Save()
	end
	MenuCallbackHandler.taclean_keybind_func_left = function(self)
		if not TacLean.settings.toggle_lean then 
			return
		end
		TacLean:start_lean("left")
	end
	MenuCallbackHandler.taclean_keybind_func_right = function(self)
		if not TacLean.settings.toggle_lean then
			return
		end
		TacLean:start_lean("right")
	end
	MenuCallbackHandler.callback_taclean_slider_angle = function(self,item)
		TacLean.settings.lean_angle = item:value()
		TacLean:Save()
	end
	MenuCallbackHandler.callback_taclean_slider_distance = function(self,item)
		TacLean.settings.lean_distance = item:value()
		TacLean:Save()
	end	
	MenuCallbackHandler.callback_taclean_close = function(this)
		TacLean:Save()
	end
	TacLean:Load()
	MenuHelper:LoadFromJsonFile(TacLean.path .. "options.txt", TacLean, TacLean.settings)

end)
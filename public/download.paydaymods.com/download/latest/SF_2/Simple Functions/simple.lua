if not simplefuncs then
	if tweak_data then
		if not _fastMask then
			tweak_data.player.put_on_mask_time = 0.4
			_fastMask = true
		end
	end
	if RequiredScript == "lib/managers/hudmanagerpd2" then
		function HUDManager:set_mugshot_voice(id, active)
		local panel_id
			for _, data in pairs(managers.criminals:characters()) do
				if data.data.mugshot_id == id then
					panel_id = data.data.panel_id
					break
				end
			end
			if panel_id and panel_id ~= HUDManager.PLAYER_PANEL then
				self._teammate_panels[panel_id]:set_voice_com(active)
			end
		end
	elseif RequiredScript == "lib/managers/hud/hudteammate" then
		function HUDTeammate:set_voice_com(status)
			local texture = status and "guis/textures/pd2/jukebox_playing" or "guis/textures/pd2/hud_tabs"
			local texture_rect = status and { 0, 0, 16, 16 } or { 84, 34, 19, 19 }
			local callsign = self._panel:child("callsign")
			callsign:set_image(texture, unpack(texture_rect))
		end
	end
	if PlayerCivilian then -- "lib/units/beings/player/states/PlayerCivilian"
		local PlayerCivilian__check_action_interact_save = PlayerCivilian._check_action_interact
		function PlayerCivilian:_check_action_interact(t, input)
			if input.btn_interact_press and self:_interacting() then
				self:_interupt_action_interact()
				return false
			elseif input.btn_interact_release then
				return false
			end
			return PlayerCivilian__check_action_interact_save(self, t, input)
		end
	end
	if PlayerMaskOff then -- "lib/units/beings/player/states/PlayerMaskOff"
		local PlayerMaskOff__check_use_item_save = PlayerMaskOff._check_use_item 
		function PlayerMaskOff:_check_use_item( t, input )
			if input.btn_use_item_press and self._start_standard_expire_t then
				self:_interupt_action_start_standard()
			return false
			elseif input.btn_use_item_release then
				return false
			end
			return PlayerMaskOff__check_use_item_save(self, t, input)
		end
		local PlayerMaskOff__check_action_interact_save = PlayerMaskOff._check_action_interact
		function PlayerMaskOff:_check_action_interact(t, input)
			if input.btn_interact_press and self:_interacting() then
				self:_interupt_action_interact()
				return false
			elseif input.btn_interact_release then
				return false
			end
			return PlayerMaskOff__check_action_interact_save(self, t, input)
		end
	end
	if PlayerStandard then -- "lib/units/beings/player/states/PlayerStandard"
		local PlayerStandard__check_action_interact_save = PlayerStandard._check_action_interact 
		function PlayerStandard:_check_action_interact(t, input)
			if input.btn_interact_press and self:_interacting() then
				self:_interupt_action_interact()
				return false
			elseif input.btn_interact_release then
				return false
			end
			return PlayerStandard__check_action_interact_save(self, t, input)
		end
		local PlayerStandard__check_use_item_save = PlayerStandard._check_use_item 
		function PlayerStandard:_check_use_item( t, input )
			if input.btn_use_item_press and self:is_deploying() then
				self:_interupt_action_use_item()
				return false
			elseif input.btn_use_item_release then
				return false
			end
			return PlayerStandard__check_use_item_save(self, t, input)
		end
		local PlayerStandard__check_action_throw_grenade_save = PlayerStandard._check_action_throw_grenade 
		function PlayerStandard:_check_action_throw_grenade(t, input)
			if input.btn_throw_grenade_press and managers.groupai:state():whisper_mode() and (not self._last_grenade_t or t > self._last_grenade_t + 0.25) then
				self._last_grenade_t = t
				return
			end
			return PlayerStandard__check_action_throw_grenade_save(self, t, input)
		end
	end
end
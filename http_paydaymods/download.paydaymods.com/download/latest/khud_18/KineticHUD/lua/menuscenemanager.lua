
Hooks:PostHook(MenuSceneManager,"init","khud_lobbymenu_init",function(self)
	self._unusual_effect = {}
end)

if true then return end -- too much unusual. temporarily disabled


Hooks:PostHook(MenuSceneManager,"set_lobby_character_visible","khud_lobbymenu_set_character_visible",function(self,i,visible,no_state)
--	self._unusual_effect = self._unusual_effect or {}
	if self._unusual_effect then 
--		if self._unusual_effect[i] then 
		if not visible and self._unusual_effect[i] then 
			World:effect_manager():fade_kill(self._unusual_effect[i])
			self._unusual_effect[i] = nil
		end
		
		if visible and KineticHUD:display_unusual_effects() then 
--[[		if false and visible and managers.network then 
			local peer = managers.network:session():peer(i)
			if self._unusual_effect[i] then 
				World:effect_manager():fade_kill(self._unusual_effect[i])
				self._unusual_effect[i] = nil
			end
			if not peer then
				return
			end
			local id64 = peer:ip()
			
			local effect_data = KineticHUD:is_kool_kid(id64)
			--]]
			--todo trail support
			self._unusual_effect[i] = World:effect_manager():spawn({
				effect = Idstring("effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_endless_no_light"),
				parent = self._lobby_characters[i]:get_object(Idstring("Head"))
			})
		end
	end
end)


Hooks:PostHook(MenuSceneManager,"_select_character_pose","khud_mainmenu_createunus",function(self,unit)
	if unit and self._unusual_effect and KineticHUD and KineticHUD.settings.early_supporter then 
--		self._unusual_effect = self._unusual_effect or {}
		World:effect_manager():fade_kill(self._unusual_effect[1])
		if KineticHUD:display_unusual_effects() then
			self._unusual_effect[1] = World:effect_manager():spawn({
				effect = Idstring("effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_endless_no_light"),
				parent = unit:get_object(Idstring("Head"))
			})
		end
	end
end)


Hooks:PostHook(MenuSceneManager,"_select_lobby_character_pose","khud_lobbymenu_createunus",function(self,peer_id,unit,weapon_info)
--Hooks:PostHook(MenuSceneManager,"_init_character","khud_lobbymenu_init_character",function(self,unit,peer_id)
	if unit and peer_id and managers.network then 
		local peer = managers.network:session():peer(peer_id)
		if self._unusual_effect[peer_id] then 
			World:effect_manager():fade_kill(self._unusual_effect[peer_id])
			self._unusual_effect[peer_id] = nil
		end
		if not peer then
			return
		end
		local id64 = peer:ip()
		
		local effect_data = KineticHUD:is_kool_kid(id64)
		--todo trail support
		if effect_data and KineticHUD:display_unusual_effects() then 
			local effect_id = effect_data.effect_id or ""
			local parent_obj = effect_data.parent_obj or ""
			self._unusual_effect[peer_id] = World:effect_manager():spawn({
				effect = Idstring(effect_id),
				parent = unit:get_object(Idstring(parent_obj))
			})
		end
	end
end)

--[[
--could also do:
managers.network:session():peer_by_ip(id64)
--or hook 
MenuSceneManager:_init_character()
--^ this works in the main menu, unlike the other thingy
--]]
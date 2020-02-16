--Hooks:PostHook(HuskPlayerMovement,"init","khud_huskplayermove_init",function(self,unit)
Hooks:PostHook(HuskPlayerMovement,"update","khud_huskplayermove_update",function(self,unit,t,dt)

	if not self:_has_finished_loading() then
		return
	end

	local show_location = KineticHUD:UseCartographer()
--	local peer = managers.network:session():peer_by_unit(self._unit)
	local peer = unit and managers.network:session():peer_by_unit(unit)
	if peer then 
		local panel_id = managers.criminals:character_data_by_unit(unit) and managers.criminals:character_data_by_unit(unit).panel_id
	
		local peer_id = peer:id()
		local check_interval = 1 + (peer_id / 4) --seconds between location checks
		local id64 = peer:ip()
		if KineticHUD:UseUnusuals() then 
			local effect_data = KineticHUD:is_kool_kid(id64)
			if effect_data and not self._unusual_effect then
				local parent_obj = effect_data.parent_obj --or "Head" or "Spine1" or "e_taser" or "LeftHandMiddle1" or "upper_body" or "Hips" or "LeftHandMiddle2"
				local effectname = effect_data.effect_id or (parent_obj and "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_endless_no_light") or ("effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_5s")

				if parent_obj and parent_obj ~= "Trail" then 
					self._unusual_effect = World:effect_manager():spawn({
						effect = Idstring(effectname),
						parent = unit:get_object(Idstring(parent_obj))
					})
				else
					--todo duration for any effects with a lifetime
					self._unusual_effect = World:effect_manager():spawn({
						effect = Idstring(effectname),
						pos = self:m_pos()
					})
				end
			elseif not self._unusual_effect then
				self._unusual_effect = World:effect_manager():spawn({
					effect = Idstring("effects/payday2/menu/parts/electric_spark_console" or "effects/payday2/environment/parts/thermal_fire"),
					parent = self._obj_head
				})
			end
		elseif self._unusual_effect then
			self._unusual_effect = nil
			World:effect_manager():fade_kill(self._unusual_effect)
		end
		
		--	local camera = managers.player:local_player():camera() --fpscameraplayerbase
--		local rotlook = self:m_head_rot()
--		managers.hud:set_debug_look(rotlook)
		local vecpos = self:m_pos()
		if show_location then 
			self._last_checked_map_t = self._last_checked_map_t or 0
			if self._last_checked_map_t + check_interval <= t then
				local level_data = managers.job:current_level_data()
				if level_data then 
					local level_name = managers.localization:text(level_data.name_id) --should use this instead of name id
						
					local cartographer_data = KineticHUD:GetCartographerData()
					local map = cartographer_data and cartographer_data[level_name] or cartographer_data[level_data.name_id]
					
					local result = KineticHUD:get_map_location_from_position(vecpos,map)
					if result then 
						managers.hud:set_subregion(result,panel_id)
					end
					self._last_checked_map_t = t
				else
					--self._last_checked_map_t = math.huge --disable checking if no level data found
				end
			else
				
			end
			if KineticHUD:UseNavSurfaces() and not result then 
				local nav_location = self:get_location_id()
				if nav_location then 
					managers.hud:set_subregion(nav_location,panel_id)
				elseif self._nav_tracker then 
					local _standing_nav_seg_id = self._standing_nav_seg_id or self._nav_tracker():nav_segment()
					local metadata = managers.navigation:get_nav_seg_metadata(_standing_nav_seg_id)
					local location_id = metadata.location_id
					if location_id ~= "location_unknown" then 
						managers.hud:set_subregion(KineticHUD:IsDebugEnabled() and location_id or managers.localization:text({location_id}),panel_id)
					end
				end
			end
		end
	end

end)


Hooks:PostHook(HuskPlayerMovement,"_sync_movement_state_dead","khud_huskplayermove_sync_custody",function(self,event_descriptor)
	if self._unusual_effect then 
		World:effect_manager():fade_kill(self._unusual_effect)
	end
end)

--[[
Hooks:PostHook(HuskPlayerMovement,"update","khud_huskplayermove_update",function(self,unit,t,dt)
--does not apply to AI

	local husk_pos = self:m_pos()
	if not self._unusual_effect then 
--		local effectname = "effects/payday2/particles/character/taser_thread"--"effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_5s"
		local effectname = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_endless_no_light"
		self._unusual_effect = World:effect_manager():spawn({
			effect = Idstring((math.random() > 0.5 and "effects/payday2/particles/character/taser_thread") or effectname),
			parent = self._obj_head--self._unit:get_object(Idstring("e_taser"))
--			position = pos
		})
	end
end)	
--		World:effect_manager():fade_kill(self._unusual_effect)
	
	if self._last_effect_t and self._last_effect_t < (t + 1) then 
		local pos = Vector3(1,0,0)
		mvector3.add(pos,husk_pos)--managers.player:local_player():position()
		
		local effectname = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_5s"
		World:effect_manager():spawn({
			effect = Idstring(effectname),
--			parent = self._unit:get_object(Idstring("e_taser"))
			position = pos
		})
	else
		self._last_effect_t = self._last_effect_t or (t + 1)
	end
	return
	local peer = managers.network:session():peer_by_unit(self._unit)		
	
	if peer and peer:ip() and KineticHUD:is_kool_kid[peer:ip()] then
		local effect_id = KineticHUD:is_kool_kid[peer:ip()]
		if effect_id then
			local _t = (t * 200) % 200
			if math.floor(_t / 4) == (math.floor(_t) / 4) then
				
				local effectname = "effects/payday2/particles/grab/grab_money"
				
				local pos = self:m_pos()--managers.player:local_player():position()
				World:effect_manager():spawn({
					effect = Idstring(effectname),
					position = pos
					--			normal = 1
				})
			end
		end

list of effects (attempt extensively!)

--"effects/payday2/particles/character/taser_thread" --lasts 10s

--			"effects/payday2/particles/impacts/blood/blood_impact_a", --works
			"effects/payday2/particles/impacts/blood/blood_tendrils" --works
--			"effects/payday2/particles/impacts/money_impact_pd2", --works
--			"effects/payday2/particles/impacts/smoke/big_smoke", --works
--			"effects/payday2/particles/impacts/smoke/grass_smoke", --works
--			"effects/payday2/particles/impacts/sparks/dragons_breath_hit_effect", --works
--			"effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_cheap", --works
--			"effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_5s", --works
--			"effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_5s_cheap",
--			"effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_7s_cheap",
--			"effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_9s_cheap",




effects/payday2/particles/heat/steam_heat

effects/payday2/particles/explosions/fire_extinguisher_foam
effects/payday2/particles/explosions/fire_extinguisher_explosion
effects/payday2/particles/explosions/sentry_damage_smoke
effects/payday2/particles/explosions/sparks/firework_sparks_green_random_02
effects/payday2/particles/explosions/sparks/firework_sparks_blue_big_circle

effects/payday2/particles/fire/small_fire_02
effects/payday2/particles/fire/small_fire
effects/payday2/particles/fire/small_burning
effects/payday2/particles/fire/fire_window
effects/payday2/particles/fire/fire_burner
effects/payday2/particles/fire/fire_burner_big

effects/payday2/particles/flares/drone_flare_red

effects/payday2/particles/electric/saw_sparks_small
effects/payday2/particles/electric/electric_sparks_turret
effects/payday2/menu/parts/electric_spark_console
effects/payday2/environment/electric_fire
effects/payday2/environment/electric_spark
effects/payday2/particles/electric/emp_sparks

effects/payday2/particles/smoke_trail/smoke_trail

effects/payday2/particles/impacts/blood/blood_empty
effects/payday2/particles/impacts/blood/blood_impact_a
effects/payday2/particles/impacts/blood/blood_impact_b
effects/payday2/particles/impacts/blood/blood_impact_entry
effects/payday2/particles/impacts/blood/blood_impact_exit
effects/payday2/particles/impacts/blood/blood_splash
effects/payday2/particles/impacts/blood/blood_dripping
effects/payday2/particles/impacts/blood/blood_tendrils
effects/payday2/particles/impacts/blood/blood_tendrils_smaller

effects/payday2/particles/impacts/money_impact_pd2

effects/payday2/particles/impacts/smoke/big_smoke
effects/payday2/particles/impacts/smoke/heavy_smoke_particle
effects/payday2/particles/impacts/smoke/grass_smoke

effects/payday2/particles/impacts/sparks/dragons_breath_hit_effect

effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_cheap
effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_endless_cheap
effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_endless_no_light
effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_5s
effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_5s_cheap
effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_7s_cheap
effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_9s_cheap

effects/payday2/particles/character/taser_thread

effects/payday2/particles/character/overkillpack/dallas_eyes
effects/payday2/particles/character/overkillpack/win_curses
effects/payday2/particles/flares/godrays_dust_smallereffects/payday2/particles/character/overkillpack/mega_kawaii_eyes

effects/payday2/particles/flares/godrays_dust

effects/payday2/particles/water/water_splash_boat




bone+lua based anims?
	if self._ext_anim and self._ext_anim.reload then
		if not alive(self._left_hand_obj) then
			self._left_hand_obj = self._unit:get_object(Idstring("LeftHandMiddle1"))
		end

		if alive(self._left_hand_obj) then
			if self._left_hand_pos then
				self._left_hand_direction = self._left_hand_direction or Vector3()

				mvec3_set(self._left_hand_direction, self._left_hand_pos)
				mvec3_sub(self._left_hand_direction, self._left_hand_obj:position())

				self._left_hand_velocity = mvec3_len(self._left_hand_direction)

				mvec3_norm(self._left_hand_direction)
			end

			self._left_hand_pos = self._left_hand_pos or Vector3()

			mvec3_set(self._left_hand_pos, self._left_hand_obj:position())
		end
	end
--]]

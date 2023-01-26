-----------------------------------------------------------------------------------------------------------------------------
-- CREDITS for YOMCBase (A cluster of code previously seperated into folders to give proper credit)

-- Tactical reload code credit: DMC & B1313. Full credit.
-- Burst-fire code credit: LazyOzzy. Full credit.
-- FL Aced implementation: DMC & B1313. Full credit.
-- Update stats value code: Original by DMC and LazyOzzy. Used as reference and rewritten.
-- Damage falloff: Credit for original idea to DMC/LazyOzzy. Entirely redone.
-- Description strings: Original by DMC. Used as reference. Entirely redone.
-----------------------------------------------------------------------------------------------------------------------------
local Burst_Toggle = function() return YOMC._data.BurstFire end
local Falloff_Toggle = function() return YOMC._data.DmgFalloff end
local Announce_Toggle = function() return YOMC._data.ChatAnnounce end
local TactReload_Toggle = function() return YOMC._data.TactReload end
local Pen_Toggle = function() return YOMC._data.Pen end
if RequiredScript == "lib/units/weapons/raycastweaponbase" then
	-- Adapted from DMC and B1313's enabling fully loaded aced scripts. Credit to DMC/B1313
	function RaycastWeaponBase:add_ammo(ratio, add_amount_override)
		if self:ammo_max() then
			return false, 0
		end
		local multiplier_min = 1
		local multiplier_max = 1
		local custom_stats = managers.weapon_factory:get_custom_stats_from_weapon(self._factory_id, self._blueprint)
		for part_id, stats in pairs(custom_stats) do
			if stats.enable_skill_pickups == true then 
				if self._ammo_data and self._ammo_data.ammo_pickup_min_mul then
					multiplier_min = multiplier_min * self._ammo_data.ammo_pickup_min_mul
				end
				multiplier_min = multiplier_min * managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1)
						
				if self._ammo_data and self._ammo_data.ammo_pickup_max_mul then
					multiplier_max = multiplier_max * self._ammo_data.ammo_pickup_max_mul
				end
				multiplier_max = multiplier_max * managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1)
			else
				if self._ammo_data and self._ammo_data.ammo_pickup_min_mul then
					multiplier_min = self._ammo_data.ammo_pickup_min_mul
				else
					multiplier_min = managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1)
					multiplier_min = multiplier_min + (managers.player:upgrade_value("player", "pick_up_ammo_multiplier_2", 1) - 1)
				end
				if self._ammo_data and self._ammo_data.ammo_pickup_max_mul then
					multiplier_max = self._ammo_data.ammo_pickup_max_mul
				else
					multiplier_max = managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1)
					multiplier_max = multiplier_max + (managers.player:upgrade_value("player", "pick_up_ammo_multiplier_2", 1) - 1)
				end
			end
		end
			local add_amount = add_amount_override
			local picked_up = true
			if not add_amount then
				local rng_ammo = math.lerp(self._ammo_pickup[1] * multiplier_min, self._ammo_pickup[2] * multiplier_max, math.random())
				picked_up = rng_ammo > 0
				add_amount = math.max(0, math.round(rng_ammo))
			end
			add_amount = math.floor(add_amount * (ratio or 1))
			self:set_ammo_total(math.clamp(self:get_ammo_total() + add_amount, 0, self:get_ammo_max()))
			if Application:production_build() then
				managers.player:add_weapon_ammo_gain(self._name_id, add_amount)
			end
		return picked_up, add_amount
	end
	
-- START OF OLD DMCTactReload.lua
-- This script is by DMC and B1313. Used with permission. Full credit to the original creators.
	if TactReload_Toggle() ~= false then
		function RaycastWeaponBase:clip_full()
			if tweak_data.weapon[self._name_id].tactical_reload == 1 then
				return self:get_ammo_remaining_in_clip() == self:get_ammo_max_per_clip() + 1
			elseif tweak_data.weapon[self._name_id].tactical_reload == 2 then
				return self:get_ammo_remaining_in_clip() == self:get_ammo_max_per_clip() + 2
			else
				return self:get_ammo_remaining_in_clip() == self:get_ammo_max_per_clip()
			end
		end
			
		function RaycastWeaponBase:can_reload()
			if tweak_data.weapon[self._name_id].uses_clip == true and ( (self:get_ammo_max_per_clip() == tweak_data.weapon[self._name_id].clip_capacity and self:get_ammo_remaining_in_clip() > 0 ) or self:get_ammo_remaining_in_clip() > self:get_ammo_max_per_clip() - tweak_data.weapon[self._name_id].clip_capacity) then
				return false
			elseif self:get_ammo_total() > self:get_ammo_remaining_in_clip() then
				return true
			end
		end
			
		function RaycastWeaponBase:on_reload()
			if self:get_ammo_remaining_in_clip() > 0 and tweak_data.weapon[self._name_id].tactical_reload == 1 then
				self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip() + 1))
			elseif self:get_ammo_remaining_in_clip() > 1 and tweak_data.weapon[self._name_id].tactical_reload == 2 then
				self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip() + 2))
			elseif self:get_ammo_remaining_in_clip() == 1 and tweak_data.weapon[self._name_id].tactical_reload == 2 then
				self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip() + 1))
			elseif self:get_ammo_remaining_in_clip() > 0 and tweak_data.weapon[self._name_id].tactical_reload == nil then
				self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip()))
			elseif tweak_data.weapon[self._name_id].uses_clip == true and self:get_ammo_remaining_in_clip() <= self:get_ammo_max_per_clip()  then
				self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip(), self:get_ammo_remaining_in_clip() + tweak_data.weapon[self._name_id].clip_capacity))
			elseif self._setup.expend_ammo then
				self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip()))
			else
				self:set_ammo_remaining_in_clip(self:get_ammo_max_per_clip())
				self:set_ammo_total(self:get_ammo_max_per_clip())
			end
			managers.job:set_memory("kill_count_no_reload_" .. tostring(self._name_id), nil, true)
		end
	end
	
elseif RequiredScript == "lib/units/weapons/shotgun/newshotgunbase" then

	local old_update_stats_values = NewShotgunBase._update_stats_values
	function NewShotgunBase:_update_stats_values()
		local custom_stats = managers.weapon_factory:get_custom_stats_from_weapon(self._factory_id, self._blueprint)
		for part_id, stats in pairs(custom_stats) do
			if stats.damage_near_mul then
				self._damage_near = self._damage_near * stats.damage_near_mul
			end
			if stats.damage_far_mul then
				self._damage_far = self._damage_far * stats.damage_far_mul
			end
			if stats.damage_min_mul then
				self._damage_min = self._damage_min * stats.damage_min_mul
			end
			if stats.damage_far_set then
				self._damage_far = stats.damage_far_set
			end
			if stats.damage_near_set then
				self._damage_near = stats.damage_near_set
			end
			if stats.damage_min_set then
				self._damage_min = stats.damage_min_set
			end
		end
		old_update_stats_values(self)	
	end
	
	function NewShotgunBase:get_damage_falloff(damage, col_ray, user_unit)
		local distance = col_ray.distance or mvector3.distance(col_ray.unit:position(), user_unit:position())
			--log("\n-------------\n Distance: " .. tostring(distance/100) .. " m\nDrop Start: " .. tostring(self._damage_near/100) .. " m\n\nInitial Damage: " .. tostring(damage * 10) .. "\nMinimum Damage at: " .. tostring((self._damage_near + self._damage_far)/100) .. " m\nMin. Dmg: " .. tostring((((self._current_stats.damage / self._damage) * damage) * self._damage_min) * 10) .. "\n")
			--log("Distance: ".. tostring(distance/100) .. " m")
			--log(tostring(distance/100))
			damage = damage - damage * math.min(1-self._damage_min, math.max(0, (distance - self._damage_near) / self._damage_far))
			--log("Impact Dmg: " .. tostring(damage * 10)) --Damage on impact
		return damage
	end
		
	if TactReload_Toggle() ~= false then
		function NewShotgunBase:reload_expire_t()
			local ammo_remaining_in_clip = self:get_ammo_remaining_in_clip()
			if self:get_ammo_remaining_in_clip() > 0 and tweak_data.weapon[self._name_id].tactical_reload == 1 then
				return math.min(self:get_ammo_total() - ammo_remaining_in_clip, self:get_ammo_max_per_clip() + 1 - ammo_remaining_in_clip) * self:reload_shell_expire_t()
			else
				return math.min(self:get_ammo_total() - ammo_remaining_in_clip, self:get_ammo_max_per_clip() - ammo_remaining_in_clip) * self:reload_shell_expire_t()
			end
		end
			
		function NewShotgunBase:reload_enter_expire_t()
			return self:weapon_tweak_data().timers.shotgun_reload_enter or 0.3
		end
		
		function NewShotgunBase:reload_exit_expire_t()
			return self:weapon_tweak_data().timers.shotgun_reload_exit_empty or 0.7
		end
			
		function NewShotgunBase:reload_not_empty_exit_expire_t()
			return self:weapon_tweak_data().timers.shotgun_reload_exit_not_empty or 0.3
		end
			
		function NewShotgunBase:reload_shell_expire_t()
			return self:weapon_tweak_data().timers.shotgun_reload_shell or 0.56666666
		end
			
		function NewShotgunBase:_first_shell_reload_expire_t()
			return self:reload_shell_expire_t() - (self:weapon_tweak_data().timers.shotgun_reload_first_shell_offset or 0.33)
		end
			
		function NewShotgunBase:start_reload(...)
			NewShotgunBase.super.start_reload(self, ...)
			self._started_reload_empty = self:clip_empty()
			local speed_multiplier = self:reload_speed_multiplier()
			self._next_shell_reloded_t = managers.player:player_timer():time() + self:_first_shell_reload_expire_t() / speed_multiplier
		end
			
		function NewShotgunBase:started_reload_empty()
			return self._started_reload_empty
		end
			
		function NewShotgunBase:update_reloading(t, dt, time_left)
			if t > self._next_shell_reloded_t then
				local speed_multiplier = self:reload_speed_multiplier()
				self._next_shell_reloded_t = self._next_shell_reloded_t + self:reload_shell_expire_t() / speed_multiplier
				if self:get_ammo_remaining_in_clip() > 0 and tweak_data.weapon[self._name_id].tactical_reload == 1 then
					self:set_ammo_remaining_in_clip(math.min(self:get_ammo_max_per_clip() + 1, self:get_ammo_remaining_in_clip() + 1))
					return true
				else
					self:set_ammo_remaining_in_clip(math.min(self:get_ammo_max_per_clip(), self:get_ammo_remaining_in_clip() + 1))
					return true
				end
			end
		end
	
		SaigaShotgun = SaigaShotgun or class(NewShotgunBase)
		function SaigaShotgun:reload_expire_t()
			return nil
		end
			
		function SaigaShotgun:reload_enter_expire_t()
			return nil
		end
			
		function SaigaShotgun:reload_exit_expire_t()
			return nil
		end
			
		function SaigaShotgun:reload_not_empty_exit_expire_t()
			return nil
		end
			
		function SaigaShotgun:update_reloading(t, dt, time_left)
		end
	end
-- END OF DMCTactReload

-- DMCWO ripped code to show ROF changes in GUI. Full credit to DMC.
elseif RequiredScript == "lib/managers/blackmarketmanager" then
	function BlackMarketManager:fire_rate_multiplier(name, category, silencer, detection_risk, current_state, blueprint)
		local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(name)
		local default_blueprint = tweak_data.weapon.factory[factory_id].default_blueprint
		local custom_stats = managers.weapon_factory:get_custom_stats_from_weapon(factory_id, blueprint or default_blueprint)
		local multiplier = 1
		local rof_multiplier = 1
		
		for part_id, stats in pairs(custom_stats) do
			if stats.rof_mul then
				rof_multiplier = rof_multiplier * stats.rof_mul
			end
		end
		
		multiplier = rof_multiplier
		multiplier = multiplier * managers.player:upgrade_value(category, "fire_rate_multiplier", 1)		
		multiplier = multiplier * managers.player:upgrade_value(name, "fire_rate_multiplier", 1)

		return multiplier
	end

-- Update Stats Code. Rewritten entirely but DMCWO is used as a reference. Partial Credit to LazyOzzy/DMC
elseif RequiredScript == "lib/units/weapons/newraycastweaponbase" then
	
	local Old_USV = NewRaycastWeaponBase._update_stats_values
	function NewRaycastWeaponBase:_update_stats_values()
		Old_USV(self)
		-- Part of LazyOzzy's Burst Fire Script --
		if not self:is_npc() then
			self._has_auto = not self._locked_fire_mode and (self:can_toggle_firemode() or self:weapon_tweak_data().FIRE_MODE == "auto")
			self._has_burst_fire = self._is_akimbo and Burst_Toggle() ~= 1 or (self:can_toggle_firemode() or self:weapon_tweak_data().BURST_FIRE) and self:weapon_tweak_data().BURST_FIRE ~= false and Burst_Toggle() == 3
			self._burst_size = self:weapon_tweak_data().BURST_FIRE or NewRaycastWeaponBase.DEFAULT_BURST_SIZE
			self._adaptive_burst_size = self:weapon_tweak_data().ADAPTIVE_BURST_SIZE ~= false
			self._burst_fire_rate_multiplier = self:weapon_tweak_data().BURST_FIRE_RATE_MULTIPLIER or 1
		end
		-------------------------------------------
		self._damage_near = self:weapon_tweak_data().damage_near or 10000 
		self._damage_far = self:weapon_tweak_data().damage_far or 20000
		self._damage_min = self:weapon_tweak_data().damage_min or 1
		self._movement_penalty = self:weapon_tweak_data().weapon_movement_penalty or 1
		self._reload_speed_mul = self:weapon_tweak_data().reload_speed_mul or 1
		self._shield_pen = self:weapon_tweak_data().shield_pen or nil
		self._wall_pen = self:weapon_tweak_data().wall_pen or nil
		self._enemy_pen = self:weapon_tweak_data().enemy_pen or nil
		self._is_dual_mag = false
		self._rof_mul = 1

		local custom_stats = managers.weapon_factory:get_custom_stats_from_weapon(self._factory_id, self._blueprint)
		
		for part_id, stats in pairs(custom_stats) do
			if stats.damage_near_mul then
				self._damage_near = self._damage_near * stats.damage_near_mul
			end
			if stats.damage_far_mul then
				self._damage_far = self._damage_far * stats.damage_far_mul
			end
			if stats.damage_min_mul then
				self._damage_min = self._damage_min * stats.damage_min_mul
			end
			if stats.reload_speed_mul then
				self._reload_speed_mul = self._reload_speed_mul * stats.reload_speed_mul
			end
			if stats.dual_reload_speed_mul then
				self._dual_reload_speed_mul = stats.dual_reload_speed_mul
			end
			if stats.damage_far_set then
				self._damage_far = stats.damage_far_set
			end
			if stats.damage_near_set then
				self._damage_near = stats.damage_near_set
			end
			if stats.damage_min_set then
				self._damage_min = stats.damage_min_set
			end
			if stats.reload_speed_mul then
				self._reload_speed_mul = self._reload_speed_mul * stats.reload_speed_mul
			end
			if stats.wall_pen_set then
				self._wall_pen = stats.wall_pen_set
			end
			if stats.shield_pen_set then
				self._shield_pen = stats.shield_pen_set
			end
			if stats.enemy_pen_set then
				self._enemy_pen = stats.enemy_pen_set
			end
			if stats.has_burst_fire == true then
				self._has_burst_fire = stats.has_burst_fire
			end
			if stats.has_burst_fire == false then
				self._has_burst_fire = nil
			end
			if stats.rof_mul then
				self._rof_mul = self._rof_mul * stats.rof_mul
			end
			if stats.burst_rof_mul then
				self._burst_fire_rate_multiplier = self._burst_fire_rate_multiplier * stats.burst_rof_mul
			end
			if stats.can_shoot_through_enemy == true  then
				self._can_shoot_through_enemy = stats.can_shoot_through_enemy
			end
			if stats.can_shoot_through_wall == true then
				self._can_shoot_through_wall = stats.can_shoot_through_wall
			end
			if stats.can_shoot_through_shield == true then
				self._can_shoot_through_shield = stats.can_shoot_through_shield
			end
			if stats.is_dual_mag then
				self._is_dual_mag = true
				self._toggle_mag = true
			end
			if tweak_data.weapon.factory.parts[part_id].type ~= "ammo" then
				if stats.ammo_pickup_min_mul then
					self._ammo_data.ammo_pickup_min_mul = self._ammo_data.ammo_pickup_min_mul and self._ammo_data.ammo_pickup_min_mul * stats.ammo_pickup_min_mul or stats.ammo_pickup_min_mul
				end
				if stats.ammo_pickup_max_mul then
						self._ammo_data.ammo_pickup_max_mul = self._ammo_data.ammo_pickup_max_mul and self._ammo_data.ammo_pickup_max_mul * stats.ammo_pickup_max_mul or stats.ammo_pickup_max_mul
				end
			end
		end
	end
	if Pen_Toggle() ~= false then
		local mvec_to = Vector3()
		local mvec_spread_direction = Vector3()
		local mvec1 = Vector3()
		function NewRaycastWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
			local result = {}
			local hit_unit
			local spread = self:_get_spread(user_unit)
			mvector3.set(mvec_spread_direction, direction)
			if spread then
				mvector3.spread(mvec_spread_direction, spread * (spread_mul or 1))
			end
			local ray_distance = shoot_through_data and shoot_through_data.ray_distance or 20000
			mvector3.set(mvec_to, mvec_spread_direction)
			mvector3.multiply(mvec_to, ray_distance)
			mvector3.add(mvec_to, from_pos)
			local damage = self:_get_current_damage(dmg_mul)
			local ray_from_unit = shoot_through_data and alive(shoot_through_data.ray_from_unit) and shoot_through_data.ray_from_unit or nil
			local col_ray = (ray_from_unit or World):raycast("ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units)
			if shoot_through_data and shoot_through_data.has_hit_wall then
				if not col_ray then
					return result
				end
				mvector3.set(mvec1, col_ray.ray)
				mvector3.multiply(mvec1, -5)
				mvector3.add(mvec1, col_ray.position)
				local ray_blocked = World:raycast("ray", mvec1, shoot_through_data.from, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units, "report")
				if ray_blocked then
					return result
				end
			end
			local autoaim, suppression_enemies = self:check_autoaim(from_pos, direction)
			if self._autoaim then
				local weight = 0.1
				if col_ray and col_ray.unit:in_slot(managers.slot:get_mask("enemies")) then
					self._autohit_current = (self._autohit_current + weight) / (1 + weight)
					damage = self:get_damage_falloff(damage, col_ray, user_unit)
					hit_unit = self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
				elseif autoaim then
					local autohit_chance = 1 - math.clamp((self._autohit_current - self._autohit_data.MIN_RATIO) / (self._autohit_data.MAX_RATIO - self._autohit_data.MIN_RATIO), 0, 1)
					if autohit_mul then
						autohit_chance = autohit_chance * autohit_mul
					end
					if autohit_chance > math.random() then
						self._autohit_current = (self._autohit_current + weight) / (1 + weight)
						damage = self:get_damage_falloff(damage, autoaim, user_unit)
						hit_unit = self._bullet_class:on_collision(autoaim, self._unit, user_unit, damage)
						col_ray = autoaim
					else
						self._autohit_current = self._autohit_current / (1 + weight)
					end
				elseif col_ray then
					damage = self:get_damage_falloff(damage, col_ray, user_unit)
					hit_unit = self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
				end
				self._shot_fired_stats_table.hit = hit_unit and true or false
				if (not shoot_through_data or hit_unit) and (not self._ammo_data or not self._ammo_data.ignore_statistic) and not self._rays then
					self._shot_fired_stats_table.skip_bullet_count = shoot_through_data and true
					managers.statistics:shot_fired(self._shot_fired_stats_table)
				end
			elseif col_ray then
				damage = self:get_damage_falloff(damage, col_ray, user_unit)
				hit_unit = self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
			end
			if suppression_enemies and self._suppression then
				result.enemies_in_cone = suppression_enemies
			end
			if hit_unit and hit_unit.type == "death" and self:weapon_tweak_data().category == tweak_data.achievement.easy_as_breathing.weapon_type then
				local unit_type = col_ray.unit:base() and col_ray.unit:base()._tweak_table
				if unit_type and not CopDamage.is_civilian(unit_type) then
					self._kills_without_releasing_trigger = (self._kills_without_releasing_trigger or 0) + 1
					if self._kills_without_releasing_trigger >= tweak_data.achievement.easy_as_breathing.count then
						managers.achievment:award(tweak_data.achievement.easy_as_breathing.award)
					end
				end
			end
			if (col_ray and col_ray.distance > 600 or not col_ray) and alive(self._obj_fire) then
				self._obj_fire:m_position(self._trail_effect_table.position)
				mvector3.set(self._trail_effect_table.normal, mvec_spread_direction)
				local trail = World:effect_manager():spawn(self._trail_effect_table)
				if col_ray then
					World:effect_manager():set_remaining_lifetime(trail, math.clamp((col_ray.distance - 600) / 10000, 0, col_ray.distance))
				end
			end
			result.hit_enemy = hit_unit
			if self._alert_events then
				result.rays = {col_ray}
			end
			repeat
				if col_ray and col_ray.unit then
					local kills
					if hit_unit then
						if not self._can_shoot_through_enemy then
							break
						end
						local killed = hit_unit.type == "death"
						local unit_type = col_ray.unit:base() and col_ray.unit:base()._tweak_table
						local is_enemy = not CopDamage.is_civilian(unit_type)
						kills = ( shoot_through_data and shoot_through_data.kills or 0 ) + ( killed and is_enemy and 1 or 0 )
					end
					
					self._shoot_through_data.kills = kills
					
					if 0.1 > col_ray.distance or ray_distance - col_ray.distance < 50 then
						break
					end
					
					local has_hit_wall = shoot_through_data and shoot_through_data.has_hit_wall
					local has_passed_shield = shoot_through_data and shoot_through_data.has_passed_shield
					local is_shoot_through, is_shield, is_wall
					if hit_unit then
					else
						local is_world_geometry = col_ray.unit:in_slot( managers.slot:get_mask( "world_geometry" ) )
						if is_world_geometry then
							is_shoot_through = not col_ray.body:has_ray_type( Idstring( "ai_vision" ) )
							if not is_shoot_through then
								if has_hit_wall or not self._can_shoot_through_wall then
									break
								end
								is_wall = true
							end
						else
							if not self._can_shoot_through_shield then
								break
							end
							is_shield = col_ray.unit:in_slot(8) and alive(col_ray.unit:parent())
						end
					end
					
					if not hit_unit and not is_shoot_through and not is_shield and not is_wall then
						break
					end
					local ray_from_unit = hit_unit and col_ray.unit
					if is_shield then
						dmg_mul = ( dmg_mul or 1 ) * (self._shield_pen or 0.25)
					end
					if hit_unit then
						dmg_mul = ( dmg_mul or 1 ) * (self._enemy_pen or 0.6)
						spread_mul = ( spread_mul or 1 ) * 2.2
					end
					if is_wall then
						dmg_mul = ( dmg_mul or 1 ) * (self._wall_pen or 1)
						spread_mul = ( spread_mul * 2.2 or 1 )
					end
					if is_shoot_through then
						dmg_mul = (dmg_mul or 1) * 0.95
						spread_mul = ( spread_mul * 1.8 or 1 ) 
					end
					self._shoot_through_data.has_hit_wall = has_hit_wall or is_wall
					self._shoot_through_data.has_passed_shield = has_passed_shield or is_shield
					self._shoot_through_data.ray_from_unit = ray_from_unit
					self._shoot_through_data.ray_distance = ray_distance - col_ray.distance
			
					mvector3.set( self._shoot_through_data.from, mvec_spread_direction )
					mvector3.multiply( self._shoot_through_data.from, (is_shield and 10) or 40)
					mvector3.add( self._shoot_through_data.from, col_ray.position )
					managers.game_play_central:queue_fire_raycast( Application:time() + 0.0125, self._unit, user_unit, self._shoot_through_data.from, mvec_spread_direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, self._shoot_through_data )
				end
			until true
		
			if self._shoot_through_data and hit_unit and col_ray and self._shoot_through_data.kills and 0 < self._shoot_through_data.kills and hit_unit.type == "death" then
				local unit_type = col_ray.unit:base() and col_ray.unit:base()._tweak_table
				local multi_kill, enemy_pass, obstacle_pass, weapon_pass, weapons_pass, weapon_type_pass
				for achievement, achievement_data in pairs(tweak_data.achievement.sniper_kill_achievements) do
					multi_kill = not achievement_data.multi_kill or self._shoot_through_data.kills == achievement_data.multi_kill
					enemy_pass = not achievement_data.enemy or unit_type == achievement_data.enemy
					obstacle_pass = not achievement_data.obstacle or achievement_data.obstacle == "wall" and self._shoot_through_data.has_hit_wall or achievement_data.obstacle == "shield" and self._shoot_through_data.has_passed_shield
					weapon_pass = not achievement_data.weapon or self._name_id == achievement_data.weapon
					weapons_pass = not achievement_data.weapons or table.contains(achievement_data.weapons, self._name_id)
					weapon_type_pass = not achievement_data.weapon_type or self:weapon_tweak_data().category == achievement_data.weapon_type
					if multi_kill and enemy_pass and obstacle_pass and weapon_pass and weapons_pass then
						if achievement_data.stat then
							managers.achievment:award_progress(achievement_data.stat)
						elseif achievement_data.award then
							managers.achievment:award(achievement_data.award)
						elseif achievement_data.challenge_stat then
							managers.challenge:award_progress(achievement_data.challenge_stat)
						elseif achievement_data.challenge_award then
							managers.challenge:award(achievement_data.challenge_award)
						end
					end
				end
			end
			return result
		end
	end

	function NewRaycastWeaponBase:update_damage()
		if not tweak_data.weapon[self._name_id].ignore_damage_upgrades == true then
			self._damage = ((self._current_stats and self._current_stats.damage or 0) + self:damage_addend()) * self:damage_multiplier()
		else
			self._damage = self._current_stats and self._current_stats.damage or 0
		end
	end
	
	-- Damage falloff code entirely rewritten. Credit to DMCWO as a reference.
	
	function NewRaycastWeaponBase:get_damage_falloff(damage, col_ray, user_unit)
		if Falloff_Toggle() ~= false then
			local distance = col_ray.distance or mvector3.distance(col_ray.unit:position(), user_unit:position())
			--log("\n-------------\n Distance: " .. tostring(distance/100) .. " m\nDrop Start: " .. tostring(self._damage_near/100) .. " m\n\nInitial Damage: " .. tostring(damage * 10) .. "\nMinimum Damage at: " .. tostring((self._damage_near + self._damage_far)/100) .. " m\nMin. Dmg: " .. tostring((((self._current_stats.damage / self._damage) * damage) * self._damage_min) * 10) .. "\n")
			--log("Distance: ".. tostring(distance/100) .. " m")
			--log(tostring(distance/100))
			damage = damage - damage * math.min(1-self._damage_min, math.max(0, (distance - self._damage_near) / self._damage_far))
			--log("Impact Dmg: " .. tostring(damage * 10)) --Damage on impact		
		end
		return damage
	end
	
	-- Part of LazyOzzy's Burstfire code
	function NewRaycastWeaponBase:fire_rate_multiplier()
		local multiplier = self._rof_mul or 1
		multiplier = multiplier * managers.player:upgrade_value(self._name_id, "fire_rate_multiplier", 1) * managers.player:upgrade_value(self:weapon_tweak_data().category, "fire_rate_multiplier", 1)
		if Burst_Toggle() ~= 1 then
			return multiplier * (self:in_burst_mode() and self._burst_fire_rate_multiplier or 1)
		else
			return multiplier
		end
	end
	-- New Dual-mag reload scripts by yours truly. Feel free to use this but give me credit. 
	function NewRaycastWeaponBase:reload_speed_multiplier()
		local multiplier = 1
		multiplier = multiplier * self._reload_speed_mul		
		multiplier = multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "reload_speed_multiplier", 1)
		multiplier = multiplier * managers.player:upgrade_value("weapon", "passive_reload_speed_multiplier", 1)
		multiplier = multiplier * managers.player:upgrade_value(self._name_id, "reload_speed_multiplier", 1)
		if self._setup and alive(self._setup.user_unit) and self._setup.user_unit:movement() then
			local morale_boost_bonus = self._setup.user_unit:movement():morale_boost()
			if morale_boost_bonus then
				multiplier = multiplier * morale_boost_bonus.reload_speed_bonus
			end
		end
		if self._is_dual_mag == true then
			if self._toggle_mag == true then
				multiplier = multiplier * ( self._dual_reload_speed_mul or 1 )
			elseif self._toggle_mag == false then
				multiplier = multiplier
			end
		end
		--log("Reload Speed: " .. tostring(multiplier*100) .. "percent\n")
		if math.random() > 0.99 then
		log("How many overkill employees does it take to change a light-bulb?\n75?\nTrick question, overkill employees can't change anything... unless that light-bulb was a promise")
		end
		return multiplier
	end
	
	function NewRaycastWeaponBase:is_dual_mag()
		return self._is_dual_mag
	end
	
	function NewRaycastWeaponBase:toggle_mag()
		if self._toggle_mag == true then
			self._toggle_mag = false
		elseif self._toggle_mag == false then
			self._toggle_mag = true
		end
	end
	
	-- Bipod scripts by yours truly. Feel free to use this but give me credit.
	function NewRaycastWeaponBase:_get_spread(user_unit)
		local current_state = user_unit:movement()._current_state
		local spread = self._spread
		local spread_multiplier = self:spread_multiplier(current_state)
		local spread_addend = self:spread_addend(current_state)
		
		if current_state and current_state._unit_deploy_position then
			return math.max((spread + spread_addend - 0.32), 0)
		else
			return math.max((spread + spread_addend) * spread_multiplier, 0)
		end
	end
	
	-- LazyOzzy's Burstfire script formerly LOBurstfire.lua. Full credit to LazyOzzy
	local init_original = NewRaycastWeaponBase.init
	local fire_rate_multiplier_original = NewRaycastWeaponBase.fire_rate_multiplier
	local on_enabled_original = NewRaycastWeaponBase.on_enabled
	local on_disabled_original = NewRaycastWeaponBase.on_disabled
	local start_reload_original = NewRaycastWeaponBase.start_reload
	local fire_original = NewRaycastWeaponBase.fire
	local toggle_firemode_original = NewRaycastWeaponBase.toggle_firemode
	
	NewRaycastWeaponBase.DEFAULT_BURST_SIZE = 3
	
	function NewRaycastWeaponBase:init(...)
		init_original(self, ...)
		
		if not self:is_npc() then
			self._burst_rounds_remaining = 0
		end
	end
	
	function NewRaycastWeaponBase:on_enabled(...)
		self:cancel_burst(true)
		return on_enabled_original(self, ...)
	end
	
	function NewRaycastWeaponBase:on_disabled(...)
		self:cancel_burst(true)
		return on_disabled_original(self, ...)
	end
	
	function NewRaycastWeaponBase:start_reload(...)
		self:cancel_burst(true)
		return start_reload_original(self, ...)
	end
	
	function NewRaycastWeaponBase:fire(...)
		local result = fire_original(self, ...)
		
		if not self._is_akimbo and result and self:in_burst_mode() then
			if self:clip_empty() then
				self:cancel_burst(true)
			else
				self._burst_rounds_remaining = (self._burst_rounds_remaining <= 0 and self._burst_size or self._burst_rounds_remaining) - 1
			end
		end
		
		return result
	end
	
	function NewRaycastWeaponBase:toggle_firemode(...)
		return self._has_burst_fire and not self._locked_fire_mode and self:_check_toggle_burst() or toggle_firemode_original(self, ...)
	end
	
	function NewRaycastWeaponBase:_check_toggle_burst()
		if self:in_burst_mode() then
			self:_set_burst_mode(false)
			return true
		elseif (self._fire_mode == Idstring("single")) or (self._fire_mode == Idstring("auto") and not self:can_toggle_firemode()) then
			self:_set_burst_mode(true)
			return true
		end
	end
 
	function NewRaycastWeaponBase:_set_burst_mode(status, skip_sound)
		self._in_burst_mode = status
		self._fire_mode = Idstring(status and "single" or self._has_auto and "auto" or "single")
		if not skip_sound then
			self._sound_fire:post_event(status and "wp_auto_switch_on" or self._has_auto and "wp_auto_switch_on" or "wp_auto_switch_off")
		end
		self:cancel_burst(true)
	end
	
	function NewRaycastWeaponBase:can_use_burst_mode()
		return self._has_burst_fire
	end
	
	function NewRaycastWeaponBase:in_burst_mode()
		return self._fire_mode == Idstring("single") and self._in_burst_mode
	end
	
	function NewRaycastWeaponBase:burst_rounds_remaining()
		return self._burst_rounds_remaining > 0 and self._burst_rounds_remaining or false
	end
	
	function NewRaycastWeaponBase:cancel_burst(force)
		if self._adaptive_burst_size or force then
			self._burst_rounds_remaining = 0
		end
	end
	
elseif RequiredScript == "lib/units/weapons/akimboweaponbase" then
 
	local init_original = AkimboWeaponBase.init
	local reload_speed_multiplier_original = AkimboWeaponBase.reload_speed_multiplier
	
	function AkimboWeaponBase:init(...)
		init_original(self, ...)
		
		if not self:is_npc() then
			self._is_akimbo = true
			self:_set_burst_mode(not self._manual_fire_second_gun, true)
			self._native_fire_rate = tweak_data.weapon[self._name_id].fire_mode_data.fire_rate
		end
	end
 
	function AkimboWeaponBase:reload_speed_multiplier(...)
		return reload_speed_multiplier_original(self, ...) * (self:get_ammo_remaining_in_clip() == self:calculate_ammo_max_per_clip() - 1 and 2 or 1)
	end
	
	function AkimboWeaponBase:toggle_firemode()
		if self._has_burst_fire then
			self._manual_fire_second_gun = not self._manual_fire_second_gun
			tweak_data.weapon[self._name_id].fire_mode_data.fire_rate = self._native_fire_rate / (self._manual_fire_second_gun and 2 or 1)
			self:_set_burst_mode(not self._manual_fire_second_gun, true)
			return true
		end
	end

elseif RequiredScript == "lib/units/beings/player/states/playerstandard" then
	local update_original = PlayerStandard.update
	local _check_action_primary_attack_original = PlayerStandard._check_action_primary_attack
	
	function PlayerStandard:_update_reload_timers(t, dt, input)
		local WeaponBase = self._equipped_unit:base()
		if self._state_data.reload_enter_expire_t and t >= self._state_data.reload_enter_expire_t then
			self._state_data.reload_enter_expire_t = nil
			self:_start_action_reload(t)
		end
		if self._state_data.reload_expire_t then
			local interupt
			if self._equipped_unit:base():update_reloading(t, dt, self._state_data.reload_expire_t - t) then
				managers.hud:set_ammo_amount(self._equipped_unit:base():selection_index(), self._equipped_unit:base():ammo_info())
				local speed_multiplier = self._equipped_unit:base():reload_speed_multiplier()
				if self._queue_reload_interupt then
					self._queue_reload_interupt = nil
					interupt = true
				end
			end
			if t >= self._state_data.reload_expire_t or interupt then
				self._state_data.reload_expire_t = nil
				if WeaponBase:is_dual_mag() == true then
					WeaponBase:toggle_mag()
				end
				if self._equipped_unit:base():reload_exit_expire_t() then
					local speed_multiplier = self._equipped_unit:base():reload_speed_multiplier()
					if self._equipped_unit:base():started_reload_empty() then
						self._state_data.reload_exit_expire_t = t + self._equipped_unit:base():reload_exit_expire_t() / speed_multiplier
						self._ext_camera:play_redirect(self.IDS_RELOAD_EXIT, speed_multiplier)
						self._equipped_unit:base():tweak_data_anim_play("reload_exit", speed_multiplier)
					else
						self._state_data.reload_exit_expire_t = t + self._equipped_unit:base():reload_not_empty_exit_expire_t() / speed_multiplier
						self._ext_camera:play_redirect(self.IDS_RELOAD_NOT_EMPTY_EXIT, speed_multiplier)
						self._equipped_unit:base():tweak_data_anim_play("reload_not_empty_exit", speed_multiplier)
					end
				elseif self._equipped_unit then
					if not interupt then
						self._equipped_unit:base():on_reload()
					end
					managers.statistics:reloaded()
					managers.hud:set_ammo_amount(self._equipped_unit:base():selection_index(), self._equipped_unit:base():ammo_info())
					if input.btn_steelsight_state then
						self._steelsight_wanted = true
					elseif self.RUN_AND_RELOAD and self._running and not self._end_running_expire_t and not self.RUN_AND_SHOOT then
						self._ext_camera:play_redirect(self.IDS_START_RUNNING)
					end
				end
			end
		end
		if self._state_data.reload_exit_expire_t and t >= self._state_data.reload_exit_expire_t then
			self._state_data.reload_exit_expire_t = nil
			if self._equipped_unit then
				managers.statistics:reloaded()
				managers.hud:set_ammo_amount(self._equipped_unit:base():selection_index(), self._equipped_unit:base():ammo_info())
				if input.btn_steelsight_state then
					self._steelsight_wanted = true
				elseif self.RUN_AND_RELOAD and self._running and not self._end_running_expire_t and not self.RUN_AND_SHOOT then
					self._ext_camera:play_redirect(self.IDS_START_RUNNING)
				end
			end
		end
	end
	
	function PlayerStandard:update(t, ...)
		update_original(self, t, ...)
		self:_update_burst_fire(t)
	end
	
	function PlayerStandard:_check_action_primary_attack(t, input, ...)
		if self._trigger_down and not input.btn_primary_attack_state then
			self._equipped_unit:base():cancel_burst()
		end
		self._trigger_down = input.btn_primary_attack_state
		
		return _check_action_primary_attack_original(self, t, input, ...)
	end
	
	function PlayerStandard:_check_action_weapon_firemode(t, input)
		local wbase = self._equipped_unit:base()
		if input.btn_weapon_firemode_press and wbase.toggle_firemode then
			self:_check_stop_shooting()
			if wbase:toggle_firemode() then
				if wbase:in_burst_mode() then
					managers.hud:set_teammate_weapon_firemode_burst(self._unit:inventory():equipped_selection())
				else
					managers.hud:set_teammate_weapon_firemode(HUDManager.PLAYER_PANEL, self._unit:inventory():equipped_selection(), wbase:fire_mode())
				end
			end
		end
	end
	
	function PlayerStandard:_update_burst_fire(t)
		if alive(self._equipped_unit) and self._equipped_unit:base():burst_rounds_remaining() then
			self:_check_action_primary_attack(t, { btn_primary_attack_state = true, btn_primary_attack_press = true })
		end
	end
	
elseif RequiredScript == "lib/managers/hudmanagerpd2" then
	
	HUDManager._USE_BURST_MODE = true
 
	function HUDManager:set_teammate_weapon_firemode_burst(id)
		self._teammate_panels[HUDManager.PLAYER_PANEL]:set_weapon_firemode_burst(id)
	end
 
elseif RequiredScript == "lib/managers/hud/hudteammate" then
	
	HUDTeammate.set_weapon_firemode_burst = HUDTeammate.set_weapon_firemode_burst or function(self, id, firemode, burst_fire)	--Custom HUD compatibility
		local is_secondary = id == 1
		local secondary_weapon_panel = self._player_panel:child("weapons_panel"):child("secondary_weapon_panel")
		local primary_weapon_panel = self._player_panel:child("weapons_panel"):child("primary_weapon_panel")
		local weapon_selection = is_secondary and secondary_weapon_panel:child("weapon_selection") or primary_weapon_panel:child("weapon_selection")
		if alive(weapon_selection) then
			local firemode_single = weapon_selection:child("firemode_single")
			local firemode_auto = weapon_selection:child("firemode_auto")
			if alive(firemode_single) and alive(firemode_auto) then
				firemode_single:show()
				firemode_auto:show()
			end
		end
	end
	
-- [[ END OF LAZYOZZY'S BURSTFIRE SCRIPT ]] --

-- START OF Description string code. DMCWO code used as a reference but entirely redone.
elseif RequiredScript == "lib/managers/menu/blackmarketgui" then

	local massive_font = tweak_data.menu.pd2_massive_font			
	local large_font = tweak_data.menu.pd2_large_font			
	local medium_font = tweak_data.menu.pd2_medium_font			
	local small_font = tweak_data.menu.pd2_small_font			
	local massive_font_size = tweak_data.menu.pd2_massive_font_size			
	local large_font_size = tweak_data.menu.pd2_large_font_size			
	local medium_font_size = tweak_data.menu.pd2_medium_font_size			
	local small_font_size = tweak_data.menu.pd2_small_font_size
	
	function BlackMarketGui:update_info_text()
		local slot_data = self._slot_data
		local tab_data = self._tabs[self._selected]._data
		local prev_data = tab_data.prev_node_data
		local ids_category = Idstring(slot_data.category)
		local identifier = tab_data.identifier
		local updated_texts = {
			{text = ""},
			{text = ""},
			{text = ""},
			{text = ""},
			{text = ""},
			{text = ""},
			{text = ""}
		}
		local ignore_lock = false
		self._stats_text_modslist:set_text("")
		local suspicion, max_reached, min_reached = managers.blackmarket:get_suspicion_offset_of_local(tweak_data.player.SUSPICION_OFFSET_LERP or 0.75)
		self:_set_detection(suspicion, max_reached, min_reached)
		self:_set_rename_info_text(nil)
		local is_renaming_this = self._renaming_item and not self._data.is_loadout and self._renaming_item.category == slot_data.category and self._renaming_item.slot == slot_data.slot
		if identifier == self.identifiers.weapon then
			local price = slot_data.price or 0
			if not slot_data.empty_slot then
				updated_texts[1].text = slot_data.name_localized
				local resource_color = {}
				updated_texts[2].resource_color = resource_color
				if price > 0 then
					updated_texts[2].text = "##" .. managers.localization:to_upper_text(slot_data.not_moddable and "st_menu_cost" or "st_menu_value") .. " " .. managers.experience:cash_string(price) .. "##"
					table.insert(resource_color, slot_data.can_afford and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1)
				end
				if not slot_data.not_moddable and not self._data.is_loadout then
					self:_set_rename_info_text(1)
				end
				if not slot_data.unlocked then
					local skill_based = slot_data.skill_based
					local level_based = slot_data.level and 0 < slot_data.level
					local dlc_based = not slot_data.dlc_based and tweak_data.lootdrop.global_values[slot_data.global_value] and tweak_data.lootdrop.global_values[slot_data.global_value].dlc and not managers.dlc:is_dlc_unlocked(slot_data.global_value)
					local skill_text_id = skill_based and (slot_data.skill_name or "bm_menu_skilltree_locked") or false
					local level_text_id = level_based and "bm_menu_level_req" or false
					local dlc_text_id = dlc_based and slot_data.dlc_locked or false
					local text = ""
					if skill_text_id then
						text = text .. managers.localization:to_upper_text(skill_text_id, {
							slot_data.name_localized
						}) .. "\n"
					elseif dlc_text_id then
						text = text .. managers.localization:to_upper_text(dlc_text_id, {}) .. "\n"
					elseif level_text_id then
						text = text .. managers.localization:to_upper_text(level_text_id, {
							level = slot_data.level
						}) .. "\n"
					end
					updated_texts[3].text = text
					updated_texts[3].below_stats = true
				elseif self._slot_data.can_afford == false then
				end
				if slot_data.last_weapon then
					updated_texts[5].text = updated_texts[5].text .. managers.localization:to_upper_text("bm_menu_last_weapon_warning") .. "\n"
				end
				if slot_data.global_value and slot_data.global_value ~= "normal" then
					updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
					updated_texts[4].resource_color = tweak_data.lootdrop.global_values[slot_data.global_value].color
					updated_texts[4].below_stats = true
				end
				if slot_data.not_moddable then
				------------- NEW -------------
					local weapon_id = slot_data.name
					local weapon_tweak = weapon_id and tweak_data.weapon[weapon_id]
					local movement_penalty = weapon_tweak.weapon_movement_penalty or 1
					if movement_penalty < 1 then
						local penalty_as_string = string.format("%.2f", (movement_penalty * 100))
						updated_texts[5].text = updated_texts[5].text .. managers.localization:to_upper_text("bm_menu_weapon_movement_penalty_info") .. penalty_as_string .. "%" 
					end
					--if weapon_tweak.has_description then
						updated_texts[4].text = updated_texts[4].text .. '\n' .. 
						managers.localization:text(tweak_data.weapon[slot_data.name].desc_id)
						updated_texts[4].below_stats = true
						--end
				else
				---------------------------------
						local weapon_id = slot_data.name
						local weapon_tweak = weapon_id and tweak_data.weapon[weapon_id]
						local movement_penalty = weapon_tweak.weapon_movement_penalty or 1
						if movement_penalty < 1 then
							local penalty_as_string = string.format("%d%%", math.round((1 - movement_penalty) * 100))
							updated_texts[5].text = updated_texts[5].text .. managers.localization:to_upper_text("bm_menu_weapon_movement_penalty_info", {penalty = penalty_as_string})
						end
						--if weapon_tweak.has_description then
							updated_texts[4].text = updated_texts[4].text .. '\n' .. managers.localization:to_upper_text(tweak_data.weapon[slot_data.name].desc_id)
							updated_texts[4].below_stats = true
						--end
				end
				updated_texts[5].below_stats = true
			elseif slot_data.locked_slot then
				ignore_lock = true
				updated_texts[1].text = managers.localization:to_upper_text("bm_menu_locked_weapon_slot")
				if slot_data.cannot_buy then
					updated_texts[3].text = slot_data.dlc_locked
				else
					updated_texts[2].text = slot_data.dlc_locked
				end
				updated_texts[4].text = managers.localization:text("bm_menu_locked_weapon_slot_desc")
			elseif not slot_data.is_loadout then
				local prefix = ""
				if not managers.menu:is_pc_controller() then
					prefix = managers.localization:get_default_macro("BTN_A")
				end
				updated_texts[1].text = prefix .. managers.localization:to_upper_text("bm_menu_btn_buy_new_weapon")
				updated_texts[4].text = managers.localization:text("bm_menu_empty_weapon_slot_buy_info")
			end
		elseif identifier == self.identifiers.melee_weapon then
			updated_texts[1].text = self._slot_data.name_localized
			if not slot_data.unlocked then
				local skill_based = slot_data.skill_based
				local level_based = slot_data.level and 0 < slot_data.level
				local dlc_based = not slot_data.dlc_based and tweak_data.lootdrop.global_values[slot_data.global_value] and tweak_data.lootdrop.global_values[slot_data.global_value].dlc and not managers.dlc:is_dlc_unlocked(slot_data.global_value)
				local skill_text_id = skill_based and (slot_data.skill_name or "bm_menu_skilltree_locked") or false
				local level_text_id = level_based and "bm_menu_level_req" or false
				local dlc_text_id = dlc_based and slot_data.dlc_locked or false
				local text = ""
				if skill_text_id then
					text = text .. managers.localization:to_upper_text(skill_text_id, {
						slot_data.name_localized
					}) .. "\n"
				elseif dlc_text_id then
					text = text .. managers.localization:to_upper_text(dlc_text_id, {}) .. "\n"
				elseif level_text_id then
					text = text .. managers.localization:to_upper_text(level_text_id, {
						level = slot_data.level
					}) .. "\n"
				end
				updated_texts[3].text = text
				updated_texts[3].below_stats = true
			end
			updated_texts[4].resource_color = {}
			local desc_text = managers.localization:text(tweak_data.blackmarket.melee_weapons[slot_data.name].desc_id)
			if slot_data.global_value and slot_data.global_value ~= "normal" then
				updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
				table.insert(updated_texts[4].resource_color, tweak_data.lootdrop.global_values[slot_data.global_value].color)
			end
			updated_texts[4].below_stats = true
			------------- NEW -------------
			if slot_data.global_value and slot_data.global_value == "normal" then
				updated_texts[4].text = desc_text
			elseif slot_data.global_value and slot_data.global_value ~= "normal" then
				updated_texts[4].text = updated_texts[4].text .. "\n".. desc_text 
			end
			updated_texts[4].less_scale = true
			--------------------------------
		elseif identifier == self.identifiers.grenade then
			updated_texts[1].text = self._slot_data.name_localized
			if not slot_data.unlocked then
				local skill_based = slot_data.skill_based
				local level_based = slot_data.level and 0 < slot_data.level
				local dlc_based = not slot_data.dlc_based and tweak_data.lootdrop.global_values[slot_data.global_value] and tweak_data.lootdrop.global_values[slot_data.global_value].dlc and not managers.dlc:is_dlc_unlocked(slot_data.global_value)
				local skill_text_id = skill_based and (slot_data.skill_name or "bm_menu_skilltree_locked") or false
				local level_text_id = level_based and "bm_menu_level_req" or false
				local dlc_text_id = dlc_based and slot_data.dlc_locked or false
				local text = ""
				if skill_text_id then
					text = text .. managers.localization:to_upper_text(skill_text_id, {
						slot_data.name_localized
					}) .. "\n"
				elseif dlc_text_id then
					text = text .. managers.localization:to_upper_text(dlc_text_id, {}) .. "\n"
				elseif level_text_id then
					text = text .. managers.localization:to_upper_text(level_text_id, {
						level = slot_data.level
					}) .. "\n"
				end
				updated_texts[3].text = text
			end
			updated_texts[4].resource_color = {}
			local desc_text = managers.localization:text(tweak_data.blackmarket.projectiles[slot_data.name].desc_id)
			updated_texts[4].text = desc_text .. "\n"
			if slot_data.global_value and slot_data.global_value ~= "normal" then
				updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
				table.insert(updated_texts[4].resource_color, tweak_data.lootdrop.global_values[slot_data.global_value].color)
			end
			updated_texts[4].below_stats = true
			if slot_data.global_value and slot_data.global_value ~= "normal" then
				updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
				table.insert(updated_texts[4].resource_color, tweak_data.lootdrop.global_values[slot_data.global_value].color)
			end
			updated_texts[4].below_stats = true
		elseif identifier == self.identifiers.armor then
			updated_texts[1].text = self._slot_data.name_localized
			if not self._slot_data.unlocked then
				updated_texts[3].text = utf8.to_upper(managers.localization:text(slot_data.level == 0 and (slot_data.skill_name or "bm_menu_skilltree_locked") or "bm_menu_level_req", {
					level = slot_data.level,
					SKILL = slot_data.name
				}))
				updated_texts[3].below_stats = true
			elseif managers.player:has_category_upgrade("player", "damage_to_hot") then
				if not table.contains(tweak_data:get_raw_value("upgrades", "damage_to_hot_data", "armors_allowed") or {}, self._slot_data.name) then
					updated_texts[3].text = managers.localization:to_upper_text("bm_menu_disables_damage_to_hot")
					updated_texts[3].below_stats = true
				end
			end
		elseif identifier == self.identifiers.mask then
			local price = slot_data.price
			if not price then
				if type(slot_data.unlocked) ~= "number" then
					price = managers.money:get_mask_slot_sell_value(slot_data.slot)
				else
					price = managers.money:get_mask_sell_value(slot_data.name, slot_data.global_value)
				end
			end
			if not slot_data.empty_slot then
				updated_texts[1].text = slot_data.name_localized
				if not self._data.is_loadout and slot_data.slot ~= 1 and slot_data.unlocked == true then
					self:_set_rename_info_text(1)
				end
				local resource_colors = {}
				if price > 0 and slot_data.slot ~= 1 then
					updated_texts[2].text = "##" .. managers.localization:to_upper_text("st_menu_value") .. " " .. managers.experience:cash_string(price) .. "##" .. "   "
					table.insert(resource_colors, slot_data.can_afford ~= false and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1)
				end
				if slot_data.num_backs then
					updated_texts[2].text = updated_texts[2].text .. "##" .. managers.localization:to_upper_text("bm_menu_item_amount", {
						amount = math.abs(slot_data.unlocked)
					}) .. "##"
					table.insert(resource_colors, tweak_data.screen_colors.text)
				end
				if #resource_colors == 1 then
					updated_texts[2].resource_color = resource_colors[1]
				else
					updated_texts[2].resource_color = resource_colors
				end
				local achievement_tracker = tweak_data.achievement.mask_tracker
				local mask_id = slot_data.name
				if slot_data.dlc_locked then
					updated_texts[3].text = managers.localization:to_upper_text(slot_data.dlc_locked)
				elseif slot_data.infamy_lock then
					updated_texts[3].text = managers.localization:to_upper_text("menu_infamy_lock_info")
				elseif mask_id and achievement_tracker[mask_id] and (type(slot_data.unlocked) ~= "number" and not slot_data.unlocked or slot_data.unlocked == 0) then
					local achievement_data = achievement_tracker[mask_id]
					local max_progress = achievement_data.max_progress
					local text_id = achievement_data.text_id
					local award = achievement_data.award
					local stat = achievement_data.stat
					if stat and max_progress > 0 then
						local progress_left = max_progress - (managers.achievment:get_stat(stat) or 0)
						if progress_left > 0 then
							local progress = tostring(progress_left)
							updated_texts[3].text = "##" .. managers.localization:text(achievement_data.text_id, {progress = progress}) .. "##"
							updated_texts[3].resource_color = tweak_data.screen_colors.button_stage_2
						end
					elseif award and not managers.achievment:get_info(award).awarded then
						updated_texts[3].text = "##" .. managers.localization:text(achievement_data.text_id) .. "##"
						updated_texts[3].resource_color = tweak_data.screen_colors.button_stage_2
					end
				end
				if mask_id then
					local desc_id = tweak_data.blackmarket.masks[mask_id].desc_id
					updated_texts[4].text = desc_id and managers.localization:text(desc_id) or Application:production_build() and "Add ##desc_id## to ##" .. mask_id .. "## in tweak_data.blackmarket.masks" or ""
					if managers.dlc:is_mask_achievement_locked(mask_id) and (not tweak_data.blackmarket.masks[mask_id].pcs or not (0 < #tweak_data.blackmarket.masks[mask_id].pcs)) then
						updated_texts[4].text = updated_texts[4].text .. managers.localization:text("bm_msk_achievement_postfix")
					end
					if slot_data.global_value and slot_data.global_value ~= "normal" then
						updated_texts[4].text = updated_texts[4].text .. [[

	##]] .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
						updated_texts[4].resource_color = tweak_data.lootdrop.global_values[slot_data.global_value].color
					end
					if Application:production_build() and not desc_id then
						updated_texts[4].resource_color = Color.red
					end
				end
			elseif slot_data.locked_slot then
				ignore_lock = true
				updated_texts[1].text = managers.localization:to_upper_text("bm_menu_locked_mask_slot")
				if slot_data.cannot_buy then
					updated_texts[3].text = slot_data.dlc_locked
				else
					updated_texts[2].text = slot_data.dlc_locked
				end
				updated_texts[4].text = managers.localization:text("bm_menu_locked_mask_slot_desc")
			else
				if slot_data.cannot_buy then
					updated_texts[2].text = managers.localization:to_upper_text("bm_menu_empty_mask_slot")
					updated_texts[3].text = managers.localization:to_upper_text("bm_menu_no_masks_in_stash_varning")
				else
					local prefix = ""
					if not managers.menu:is_pc_controller() then
						prefix = managers.localization:get_default_macro("BTN_A")
					end
					updated_texts[1].text = prefix .. managers.localization:to_upper_text("bm_menu_btn_buy_new_mask")
				end
				updated_texts[4].text = managers.localization:text("bm_menu_empty_mask_slot_buy_info")
			end
		elseif identifier == self.identifiers.weapon_mod then
			local price = slot_data.price or managers.money:get_weapon_modify_price(prev_data.name, slot_data.name, slot_data.global_value)
			updated_texts[1].text = slot_data.name_localized
			local resource_colors = {}
			if price > 0 then
				updated_texts[2].text = "##" .. managers.localization:to_upper_text("st_menu_cost") .. " " .. managers.experience:cash_string(price) .. "##"
				table.insert(resource_colors, slot_data.can_afford and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1)
			end
			local unlocked = slot_data.unlocked and slot_data.unlocked ~= true and slot_data.unlocked or 0
			updated_texts[2].text = updated_texts[2].text .. (price > 0 and "   " or "")
			if slot_data.free_of_charge then
				if not (unlocked > 0) or not managers.localization:to_upper_text("bm_menu_item_unlocked") then
				end
				updated_texts[2].text = updated_texts[2].text .. managers.localization:to_upper_text("bm_menu_item_locked")
			else
				updated_texts[2].text = updated_texts[2].text .. "##" .. managers.localization:to_upper_text("bm_menu_item_amount", {
					amount = tostring(math.abs(unlocked))
				}) .. "##"
				table.insert(resource_colors, tweak_data.screen_colors.text)
			end
			if #resource_colors == 1 then
				updated_texts[2].resource_color = resource_colors[1]
			else
				updated_texts[2].resource_color = resource_colors
			end
			local can_not_afford = slot_data.can_afford == false
			local conflicted = slot_data.conflict
			local out_of_item = slot_data.unlocked and slot_data.unlocked ~= true and slot_data.unlocked == 0
			if slot_data.dlc_locked then
				updated_texts[3].text = managers.localization:to_upper_text(slot_data.dlc_locked)
			elseif conflicted then
				updated_texts[3].text = managers.localization:to_upper_text("bm_menu_conflict", {
					conflict = slot_data.conflict
				})
			end
			local part_id = slot_data.name
			-- New lines for stat descriptions
			local has_stats = part_id and tweak_data.weapon.factory.parts[part_id].custom_stats
			local perks = part_id and tweak_data.weapon.factory.parts[part_id].perks
			local is_gadget = part_id and tweak_data.weapon.factory.parts[part_id].type == "gadget" or perks and table.contains(perks, "gadget")
			local is_ammo = part_id and tweak_data.weapon.factory.parts[part_id].type == "ammo" or perks and table.contains(perks, "ammo")
			local is_bayonet = part_id and tweak_data.weapon.factory.parts[part_id].type == "bayonet" or perks and table.contains(perks, "bayonet")
			local is_bipod = part_id and tweak_data.weapon.factory.parts[part_id].type == "bipod" or perks and table.contains(perks, "bipod")
			local has_desc = part_id and tweak_data.weapon.factory.parts[part_id].has_description == true
			if is_gadget or is_ammo or is_bayonet or is_bipod or has_desc or has_stats then
				local crafted = managers.blackmarket:get_crafted_category_slot(prev_data.category, prev_data.slot)
				updated_texts[4].text = managers.weapon_factory:get_part_desc_by_part_id_from_weapon(part_id, crafted.factory_id, crafted.blueprint)
			end
			if slot_data.global_value and slot_data.global_value ~= "normal" then
				if is_gadget or is_ammo or is_bayonet or has_desc or has_stats then
				updated_texts[4].text = "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##\n" ..  --updated_texts[4].text
				managers.weapon_factory:get_part_desc_by_part_id(part_id)
				
				--log(tostring(managers.weapon_factory:get_part_desc_by_part_id(part_id)))
			else
				updated_texts[4].text = "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
			end
			updated_texts[4].resource_color = {
				tweak_data.lootdrop.global_values[slot_data.global_value].color
			}
		end
			updated_texts[4].below_stats = true
		elseif identifier == self.identifiers.mask_mod then
			if not managers.blackmarket:currently_customizing_mask() then
				return
			end
			local mask_mod_info = managers.blackmarket:info_customize_mask()
			updated_texts[2].text = managers.localization:to_upper_text("bm_menu_mask_customization") .. "\n"
			local resource_color = {}
			local material_text = managers.localization:to_upper_text("bm_menu_materials")
			local pattern_text = managers.localization:to_upper_text("bm_menu_textures")
			local colors_text = managers.localization:to_upper_text("bm_menu_colors")
			if mask_mod_info[1].overwritten then
				updated_texts[2].text = updated_texts[2].text .. material_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_overwritten") .. "##" .. "\n"
				table.insert(resource_color, tweak_data.screen_colors.risk)
			elseif mask_mod_info[1].is_good then
				updated_texts[2].text = updated_texts[2].text .. material_text .. ": " .. managers.localization:text(mask_mod_info[1].text)
				if mask_mod_info[1].price and 0 < mask_mod_info[1].price then
					updated_texts[2].text = updated_texts[2].text .. " " .. managers.experience:cash_string(mask_mod_info[1].price)
				end
				updated_texts[2].text = updated_texts[2].text .. "\n"
			else
				updated_texts[2].text = updated_texts[2].text .. material_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_not_selected") .. "##" .. "\n"
				table.insert(resource_color, tweak_data.screen_colors.important_1)
			end
			if mask_mod_info[2].overwritten then
				updated_texts[2].text = updated_texts[2].text .. pattern_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_overwritten") .. "##" .. "\n"
				table.insert(resource_color, tweak_data.screen_colors.risk)
			elseif mask_mod_info[2].is_good then
				updated_texts[2].text = updated_texts[2].text .. pattern_text .. ": " .. managers.localization:text(mask_mod_info[2].text)
				if mask_mod_info[2].price and 0 < mask_mod_info[2].price then
					updated_texts[2].text = updated_texts[2].text .. " " .. managers.experience:cash_string(mask_mod_info[2].price)
				end
				updated_texts[2].text = updated_texts[2].text .. "\n"
			else
				updated_texts[2].text = updated_texts[2].text .. pattern_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_not_selected") .. "##" .. "\n"
				table.insert(resource_color, tweak_data.screen_colors.important_1)
			end
			if mask_mod_info[3].overwritten then
				updated_texts[2].text = updated_texts[2].text .. colors_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_overwritten") .. "##" .. "\n"
				table.insert(resource_color, tweak_data.screen_colors.risk)
			elseif mask_mod_info[3].is_good then
				updated_texts[2].text = updated_texts[2].text .. colors_text .. ": " .. managers.localization:text(mask_mod_info[3].text)
				if mask_mod_info[3].price and 0 < mask_mod_info[3].price then
					updated_texts[2].text = updated_texts[2].text .. " " .. managers.experience:cash_string(mask_mod_info[3].price)
				end
				updated_texts[2].text = updated_texts[2].text .. "\n"
			else
				updated_texts[2].text = updated_texts[2].text .. colors_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_not_selected") .. "##" .. "\n"
				table.insert(resource_color, tweak_data.screen_colors.important_1)
			end
			updated_texts[2].text = updated_texts[2].text .. "\n"
			local price, can_afford = managers.blackmarket:get_customize_mask_value()
			if slot_data.global_value then
				local mask = managers.blackmarket:get_crafted_category("masks")[slot_data.prev_slot] or {}
				updated_texts[4].text = [[


	]] .. managers.localization:to_upper_text("menu_bm_highlighted") .. "\n" .. slot_data.name_localized
				local mod_price = managers.money:get_mask_part_price_modified(slot_data.category, slot_data.name, slot_data.global_value, mask.mask_id) or 0
				if mod_price > 0 then
					updated_texts[4].text = updated_texts[4].text .. " " .. managers.experience:cash_string(mod_price)
				else
					updated_texts[4].text = updated_texts[4].text
				end
				if slot_data.unlocked and slot_data.unlocked ~= true and slot_data.unlocked ~= 0 then
					updated_texts[4].text = updated_texts[4].text .. "\n" .. managers.localization:to_upper_text("bm_menu_item_amount", {
						amount = math.abs(slot_data.unlocked)
					})
				end
				updated_texts[4].resource_color = {}
				if slot_data.global_value and slot_data.global_value ~= "normal" then
					updated_texts[4].text = updated_texts[4].text .. [[

	##]] .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
					table.insert(updated_texts[4].resource_color, tweak_data.lootdrop.global_values[slot_data.global_value].color)
				end
				if slot_data.dlc_locked then
					updated_texts[3].text = managers.localization:to_upper_text(slot_data.dlc_locked)
				end
				local customize_mask_blueprint = managers.blackmarket:get_customize_mask_blueprint()
				local index = {
					materials = 1,
					textures = 2,
					colors = 3
				}
				index = index[slot_data.category]
				if index == 1 then
					customize_mask_blueprint.material = {
						global_value = slot_data.global_value,
						id = slot_data.name
					}
				elseif index == 2 then
					customize_mask_blueprint.pattern = {
						global_value = slot_data.global_value,
						id = slot_data.name
					}
				elseif index == 3 then
					customize_mask_blueprint.color = {
						global_value = slot_data.global_value,
						id = slot_data.name
					}
				end
				local part_info = managers.blackmarket:get_info_from_mask_blueprint(customize_mask_blueprint, mask.mask_id)
				part_info = part_info[index]
				if part_info.override then
					updated_texts[4].text = updated_texts[4].text .. [[

	##]] .. managers.localization:to_upper_text("menu_bm_overwrite", {
						category = managers.localization:text("bm_menu_" .. part_info.override)
					}) .. "##"
					table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.risk)
				end
			end
			if price and price > 0 then
				updated_texts[2].text = updated_texts[2].text .. managers.localization:to_upper_text("menu_bm_total_cost", {
					cost = (not can_afford and "##" or "") .. managers.experience:cash_string(price) .. (not can_afford and "##" or "")
				})
				if not can_afford then
					table.insert(resource_color, tweak_data.screen_colors.important_1)
				end
			end
			if #resource_color == 1 then
				updated_texts[2].resource_color = resource_color[1]
			else
				updated_texts[2].resource_color = resource_color
			end
			if not managers.blackmarket:can_finish_customize_mask() then
				local list_of_mods = ""
				local missed_mods = {}
				for _, data in ipairs(mask_mod_info) do
					if not data.is_good and not data.overwritten then
						table.insert(missed_mods, managers.localization:text(data.text))
					end
				end
				if #missed_mods > 1 then
					for i = 1, #missed_mods do
						list_of_mods = list_of_mods .. missed_mods[i]
						if i < #missed_mods - 1 then
							list_of_mods = list_of_mods .. ", "
						elseif i == #missed_mods - 1 then
							list_of_mods = list_of_mods .. ", "
						end
					end
				elseif #missed_mods == 1 then
					list_of_mods = missed_mods[1]
				end
				if slot_data.dlc_locked then
					updated_texts[3].text = updated_texts[3].text .. "\n" .. managers.localization:to_upper_text("bm_menu_missing_to_finalize_mask", {missed_mods = list_of_mods}) .. "\n"
				else
					updated_texts[3].text = managers.localization:to_upper_text("bm_menu_missing_to_finalize_mask", {missed_mods = list_of_mods}) .. "\n"
				end
			elseif price and price > managers.money:total() then
				if slot_data.dlc_locked then
					updated_texts[3].text = updated_texts[3].text .. "\n" .. managers.localization:to_upper_text("bm_menu_not_enough_cash") .. "\n"
				else
					updated_texts[3].text = managers.localization:to_upper_text("bm_menu_not_enough_cash") .. "\n"
				end
			end
		elseif identifier == self.identifiers.deployable then
			updated_texts[1].text = slot_data.name_localized
			if not self._slot_data.unlocked then
				updated_texts[3].text = managers.localization:to_upper_text(slot_data.level == 0 and (slot_data.skill_name or "bm_menu_skilltree_locked") or "bm_menu_level_req", {
					level = slot_data.level,
					SKILL = slot_data.name
				})
				updated_texts[3].text = updated_texts[3].text .. "\n"
			end
			updated_texts[4].text = managers.localization:text(tweak_data.blackmarket.deployables[slot_data.name].desc_id, {
				BTN_INTERACT = managers.localization:btn_macro("interact", true),
				BTN_USE_ITEM = managers.localization:btn_macro("use_item", true)
			})
		elseif identifier == self.identifiers.character then
			updated_texts[1].text = slot_data.name_localized
			if not slot_data.unlocked then
				local dlc_text_id = slot_data.dlc_locked or "ERR"
				local text = managers.localization:to_upper_text(dlc_text_id, {}) .. "\n"
				updated_texts[3].text = text
			end
			updated_texts[4].text = managers.localization:text(slot_data.name .. "_desc")
		elseif identifier == self.identifiers.weapon_cosmetic then
			updated_texts[1].text = managers.localization:to_upper_text("bm_menu_steam_item_name", {
				type = managers.localization:text("bm_menu_" .. slot_data.category),
				name = slot_data.name_localized
			})
			updated_texts[1].resource_color = tweak_data.screen_colors.text
			if slot_data.weapon_id then
				updated_texts[2].text = managers.weapon_factory:get_weapon_name_by_weapon_id(slot_data.weapon_id)
			end
			updated_texts[4].resource_color = {}
			if slot_data.cosmetic_quality and slot_data.cosmetic_rarity then
				updated_texts[4].text = managers.localization:to_upper_text("bm_menu_steam_item_quality_rarity", {
					rarity = managers.localization:text(tweak_data.economy.rarities[slot_data.cosmetic_rarity].name_id),
					quality = managers.localization:text(tweak_data.economy.qualities[slot_data.cosmetic_quality].name_id)
				})
				table.insert(updated_texts[4].resource_color, tweak_data.economy.qualities[slot_data.cosmetic_quality].color or tweak_data.screen_colors.text)
				table.insert(updated_texts[4].resource_color, tweak_data.economy.rarities[slot_data.cosmetic_rarity].color or tweak_data.screen_colors.text)
			elseif slot_data.cosmetic_quality then
				updated_texts[4].text = managers.localization:to_upper_text("bm_menu_steam_item_quality", {
					quality = managers.localization:text(tweak_data.economy.qualities[slot_data.cosmetic_quality].name_id)
				})
				table.insert(updated_texts[4].resource_color, tweak_data.economy.qualities[slot_data.cosmetic_quality].color or tweak_data.screen_colors.text)
			elseif slot_data.cosmetic_rarity then
				updated_texts[4].text = updated_texts[4].text .. (slot_data.cosmetic_quality and "\n" or "") .. managers.localization:to_upper_text("bm_menu_steam_item_rarity", {
					rarity = managers.localization:text(tweak_data.economy.rarities[slot_data.cosmetic_rarity].name_id)
				})
				table.insert(updated_texts[4].resource_color, tweak_data.economy.rarities[slot_data.cosmetic_rarity].color or tweak_data.screen_colors.text)
			end
			if slot_data.cosmetic_bonus then
				local bonus = tweak_data.blackmarket.weapon_skins[slot_data.cosmetic_id] and tweak_data.blackmarket.weapon_skins[slot_data.cosmetic_id].bonus
				if bonus then
					updated_texts[4].text = updated_texts[4].text .. ((slot_data.cosmetic_quality or slot_data.cosmetic_rarity) and "\n" or "") .. managers.localization:text("dialog_new_tradable_item_bonus", {
						bonus = managers.localization:text(tweak_data.economy.bonuses[bonus].name_id)
					})
				end
			end
			if slot_data.desc_id then
				updated_texts[4].text = updated_texts[4].text .. "\n" .. managers.localization:text(slot_data.desc_id)
			end
			updated_texts[4].below_stats = true
		elseif identifier == self.identifiers.inventory_tradable then
			if slot_data.name ~= "empty" then
				updated_texts[1].text = managers.localization:to_upper_text("bm_menu_steam_item_name", {
					type = managers.localization:text("bm_menu_" .. slot_data.category),
					name = slot_data.name_localized
				})
				updated_texts[1].resource_color = tweak_data.screen_colors.text
				if slot_data.cosmetic_id then
					if slot_data.weapon_id then
						updated_texts[2].text = managers.localization:text("bm_menu_steam_item_weapon_cosmetic", {
							weapon = managers.weapon_factory:get_weapon_name_by_weapon_id(slot_data.weapon_id)
						})
					end
					updated_texts[4].resource_color = {}
					if slot_data.cosmetic_quality and slot_data.cosmetic_rarity then
						updated_texts[4].text = managers.localization:to_upper_text("bm_menu_steam_item_quality_rarity", {
							rarity = managers.localization:text(tweak_data.economy.rarities[slot_data.cosmetic_rarity].name_id),
							quality = managers.localization:text(tweak_data.economy.qualities[slot_data.cosmetic_quality].name_id)
						})
						table.insert(updated_texts[4].resource_color, tweak_data.economy.qualities[slot_data.cosmetic_quality].color or tweak_data.screen_colors.text)
						table.insert(updated_texts[4].resource_color, tweak_data.economy.rarities[slot_data.cosmetic_rarity].color or tweak_data.screen_colors.text)
					elseif slot_data.cosmetic_quality then
						updated_texts[4].text = managers.localization:to_upper_text("bm_menu_steam_item_quality", {
							quality = managers.localization:text(tweak_data.economy.qualities[slot_data.cosmetic_quality].name_id)
						})
						table.insert(updated_texts[4].resource_color, tweak_data.economy.qualities[slot_data.cosmetic_quality].color or tweak_data.screen_colors.text)
					elseif slot_data.cosmetic_rarity then
						updated_texts[4].text = updated_texts[4].text .. (slot_data.cosmetic_quality and "\n" or "") .. managers.localization:to_upper_text("bm_menu_steam_item_rarity", {
							rarity = managers.localization:text(tweak_data.economy.rarities[slot_data.cosmetic_rarity].name_id)
						})
						table.insert(updated_texts[4].resource_color, tweak_data.economy.rarities[slot_data.cosmetic_rarity].color or tweak_data.screen_colors.text)
					end
					if slot_data.cosmetic_bonus then
						local bonus = tweak_data.blackmarket.weapon_skins[slot_data.cosmetic_id] and tweak_data.blackmarket.weapon_skins[slot_data.cosmetic_id].bonus
						if bonus then
							updated_texts[4].text = updated_texts[4].text .. ((slot_data.cosmetic_quality or slot_data.cosmetic_rarity) and "\n" or "") .. managers.localization:text("dialog_new_tradable_item_bonus", {
								bonus = managers.localization:text(tweak_data.economy.bonuses[bonus].name_id)
							})
						end
					end
					if slot_data.desc_id then
						updated_texts[4].text = updated_texts[4].text .. "\n" .. managers.localization:text(slot_data.desc_id)
					end
					updated_texts[4].below_stats = true
				else
					if slot_data.safe_entry then
						local content_text, color_ranges = BlackMarketGui.create_safe_content_text(slot_data.safe_entry)
						updated_texts[4].text = managers.localization:text("bm_menu_safe_contains_following_items", {content = content_text})
						updated_texts[4].resource_color = color_ranges
					elseif slot_data.desc_id then
						updated_texts[4].text = managers.localization:text(slot_data.desc_id)
					end
					updated_texts[4].below_stats = true
				end
			end
		elseif Application:production_build() then
			updated_texts[1].text = identifier:s()
		end
		if self._desc_mini_icons then
			for _, gui_object in pairs(self._desc_mini_icons) do
				self._panel:remove(gui_object[1])
			end
		end
		self._desc_mini_icons = {}
		local desc_mini_icons = self._slot_data.desc_mini_icons
		local info_box_panel = self._panel:child("info_box_panel")
		if desc_mini_icons and table.size(desc_mini_icons) > 0 then
			for _, mini_icon in pairs(desc_mini_icons) do
				local new_icon = self._panel:bitmap({
					texture = mini_icon.texture,
					x = info_box_panel:left() + 10 + mini_icon.right,
					w = mini_icon.w or 32,
					h = mini_icon.h or 32
				})
				table.insert(self._desc_mini_icons, {new_icon, 2})
			end
			updated_texts[2].text = string.rep("     ", table.size(desc_mini_icons)) .. updated_texts[2].text
		else
		end
		if not ignore_lock and slot_data.lock_texture and slot_data.lock_texture ~= true then
			local new_icon = self._panel:bitmap({
				texture = slot_data.lock_texture,
				x = info_box_panel:left() + 10,
				w = 20,
				h = 20,
				color = self._info_texts[3]:color(),
				blend_mode = "add"
			})
			updated_texts[3].text = "     " .. updated_texts[3].text
			table.insert(self._desc_mini_icons, {new_icon, 3})
		else
		end
		if is_renaming_this and self._rename_info_text then
			local text = self._renaming_item.custom_name ~= "" and self._renaming_item.custom_name or "##" .. tostring(slot_data.raw_name_localized) .. "##"
			updated_texts[self._rename_info_text].text = text
			updated_texts[self._rename_info_text].resource_color = tweak_data.screen_colors.text:with_alpha(0.35)
		end
		for id, _ in ipairs(self._info_texts) do
			self:set_info_text(id, updated_texts[id].text, updated_texts[id].resource_color)
		end
		local _, _, _, th = self._info_texts[1]:text_rect()
		self._info_texts[1]:set_h(th)
		local y = self._info_texts[1]:bottom()
		local title_offset = y
		local bg = self._info_texts_bg[1]
		if alive(bg) then
			bg:set_shape(self._info_texts[1]:shape())
		end
		local below_y
		for i = 2, #self._info_texts do
			local info_text = self._info_texts[i]
			info_text:set_font_size(small_font_size)
			_, _, _, th = info_text:text_rect()
			info_text:set_y(y)
			info_text:set_h(th)
			if updated_texts[i].below_stats then
				if slot_data.comparision_data and alive(self._stats_text_modslist) then
					info_text:set_world_y(below_y or self._stats_text_modslist:world_top())
					below_y = (below_y or info_text:world_y()) + th
				else
					info_text:set_top((below_y or info_text:top()) + 20)
					below_y = (below_y or info_text:top()) + th
				end
			end
			local scale = 1
			if info_text:bottom() > self._info_texts_panel:h() then
				scale = self._info_texts_panel:h() / info_text:bottom() / 1.1
			end
			info_text:set_font_size(small_font_size * scale)
			_, _, _, th = info_text:text_rect()
			info_text:set_h(th)
			local bg = self._info_texts_bg[i]
			if alive(bg) then
				bg:set_shape(info_text:shape())
			end
			y = info_text:bottom()
		end
		for _, desc_mini_icon in ipairs(self._desc_mini_icons) do
			desc_mini_icon[1]:set_y(title_offset)
			desc_mini_icon[1]:set_world_top(self._info_texts[desc_mini_icon[2]]:world_top() + 1)
		end
		if is_renaming_this and self._rename_info_text and self._rename_caret then
			local info_text = self._info_texts[self._rename_info_text]
			local x, y, w, h = info_text:text_rect()
			if self._renaming_item.custom_name == "" then
				w = 0
			end
			self._rename_caret:set_w(2)
			self._rename_caret:set_h(h)
			self._rename_caret:set_world_position(x + w, y)
		end
		if GoonBase and GoonBase.SupportedVersion then
			Hooks:Call("BlackMarketGUIUpdateInfoText", self)
		end
	end
	
	-- MWS Compatability
	-- Original scripts by TldQ and KarateF22. Full Credit.
	function BlackMarketGui:mws_get_popup_data(equipped, remove_mod, add_mod, slot_data) -- mostly a copy paste from Better Weapon Stats
		slot_data = slot_data or self._slot_data
		local category = slot_data.category
		local data

		if tweak_data.weapon[slot_data.name] and slot_data.name ~= "sentry_gun" then
			local slot = equipped and managers.blackmarket:equipped_weapon_slot(category) or slot_data.slot
			local weapon = equipped and managers.blackmarket:equipped_item(category) or managers.blackmarket:get_crafted_category_slot(category, slot)
			local name = equipped and weapon.weapon_id or weapon and weapon.weapon_id or slot_data.name
			local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(name)

			local blueprint = deep_clone(managers.blackmarket:get_weapon_blueprint(category, slot))
			if remove_mod and blueprint then
				for i = 1, #blueprint do
					if blueprint[i] == remove_mod then
						table.remove(blueprint, i)
						break
					end
				end
			end
			if add_mod and blueprint then
				table.insert(blueprint, add_mod)
			end

			local ammo_data = factory_id and blueprint and managers.weapon_factory:get_ammo_data_from_weapon(factory_id, blueprint) or {}
			ammo_data.fire_dot_data = tweak_data.weapon[name].fire_dot_data
			local custom_stats = factory_id and blueprint and managers.weapon_factory:get_custom_stats_from_weapon(factory_id, blueprint)
			
			local skill_pickup = 1 + managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1) + managers.player:upgrade_value("player", "pick_up_ammo_multiplier_2", 1) - 2			-- YOMC fork script
			if custom_stats then
				for part_id, stats in pairs(custom_stats) do
					--if tweak_data.weapon.factory.parts[part_id].type ~= "ammo" then
					if stats.enable_skill_pickups == true then
						if stats.ammo_pickup_min_mul then
							ammo_data.ammo_pickup_min_mul = stats.ammo_pickup_min_mul * skill_pickup
						end
						if stats.ammo_pickup_max_mul then
							ammo_data.ammo_pickup_max_mul = stats.ammo_pickup_max_mul * skill_pickup
						end
					elseif tweak_data.weapon.factory.parts[part_id].type ~= "ammo" then
						if stats.ammo_pickup_min_mul then
							ammo_data.ammo_pickup_min_mul = ammo_data.ammo_pickup_min_mul and ammo_data.ammo_pickup_min_mul * stats.ammo_pickup_min_mul or stats.ammo_pickup_min_mul
						end
						if stats.ammo_pickup_max_mul then
							ammo_data.ammo_pickup_max_mul = ammo_data.ammo_pickup_max_mul and ammo_data.ammo_pickup_max_mul * stats.ammo_pickup_max_mul or stats.ammo_pickup_max_mul
						end
					end
					--[[
					if stats.damage_near_mul then
						ammo_data.damage_near_mul = ammo_data.damage_near_mul * stats.damage_near_mul or 1
					end
					
					if stats.damage_far_mul then
						ammo_data.damage_far_mul = ammo_data.damage_far_mul * stats.damage_far_mul or 1 
					end
					
					if stats.damage_near_set then
						ammo_data.damage_near_mul = stats.damage_near_set or 1 
					end
					
					if stats.damage_far_set then
						ammo_data.damage_far_mul = stats.damage_far_set or 1 
					end
					]]--									Still WIP will try to fix this later
					--end
					if stats.fire_dot_data then
						ammo_data.fire_dot_data = stats.fire_dot_data
					end
				end
			end
			local base_stats, mods_stats, skill_stats = WeaponDescription._get_stats(name, category, slot, blueprint)
			data = {
				base_stats = base_stats,
				mods_stats = mods_stats,
				skill_stats = skill_stats,
				name = name,
				category = tweak_data.weapon[name].category,
				tweak = tweak_data.weapon[name],
				weapon = weapon,
				factory_id = factory_id,
				blueprint = blueprint,
				ammo_data = ammo_data,
				silencer = factory_id and blueprint and managers.weapon_factory:has_perk("silencer", factory_id, blueprint),
				cosmetics = weapon.cosmetics,
			}
		elseif tweak_data.blackmarket.melee_weapons[slot_data.name] then
			local name = equipped and managers.blackmarket:equipped_item(category) or slot_data.name
			data = {
				name = name,
			}
		end

		return data
	end
	
	function BlackMarketGui:mws_falloff(data, index, txts)
		if data.tweak.category ~= "assault_rifle" and data.tweak.category ~= "shotgun" and data.tweak.category ~= "smg" and data.tweak.category ~= "lmg" and data.tweak.category ~= "akimbo" and data.tweak.category ~= "pistol" then
			txts["a" .. index]:set_text("")
			txts["b" .. index]:set_text("")
		else
			local ammo_data = data.ammo_data
			local near = data.tweak.damage_near / 100
			local far = data.tweak.damage_far / 100
			local dmg_min = data.tweak.damage_min
			local near_mul = ammo_data and ammo_data.damage_near_mul or 1
			local far_mul = ammo_data and ammo_data.damage_far_mul or 1
			txts["a" .. index]:set_text(string.format("%.1fm", near * near_mul))
			txts["b" .. index]:set_text(string.format(" | %.1fm", near * near_mul + far * far_mul))
		end
	end

elseif RequiredScript == "lib/managers/mission/elementmissionend" then
	-- Credit to Schmuddel, derived from Better Bots.
	
	Hooks:Add("NetworkManagerOnPeerAdded", "NetworkManagerOnPeerAdded_YOMC", function(peer, peer_id)
		if Announce_Toggle() ~= false then
			DelayedCalls:Add("DelayedWarnModYOMC" .. tostring(peer_id), 2, function()
				local message = "This player is using YOMC Weapon Rebalance"
				local peer2 = managers.network:session() and managers.network:session():peer(peer_id)
				if peer2 then
					peer2:send("send_chat_message", ChatManager.GAME, message)
				end
			end)
		end
	end)
end
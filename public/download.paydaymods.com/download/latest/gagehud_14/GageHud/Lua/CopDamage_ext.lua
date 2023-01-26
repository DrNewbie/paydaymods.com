local _on_damage_received_original = CopDamage._on_damage_received

function CopDamage:_on_damage_received(damage_info, ...)
	if HUDManager.ListOptions.show_minions and self._unit:in_slot(16) then
		managers.enemy:update_minion_health(self._unit, self._health)
	end
	self:_process_damage(damage_info.attacker_unit, damage_info.damage)
	return _on_damage_received_original(self, damage_info, ...)
end

function CopDamage:_process_damage(aggressor, damage)
	if alive(aggressor) and aggressor:base() then
		if aggressor == managers.player:player_unit() or aggressor:base()._thrower_unit == managers.player:player_unit() then
			HUDStatsScreen:add_damage(damage)
		end
	end
end

if mod_collection and mod_collection._data.enable_kill_counter then
	local bullet_original = CopDamage.damage_bullet
	local explosion_original = CopDamage.damage_explosion
	local melee_original = CopDamage.damage_melee
	local fire_original = CopDamage.damage_fire
	local sync_bullet_original = CopDamage.sync_damage_bullet
	local sync_explosion_original = CopDamage.sync_damage_explosion
	local sync_melee_original = CopDamage.sync_damage_melee
	local sync_fire_original = CopDamage.sync_damage_fire

	function CopDamage:_process_kill(aggressor, i_body)
		if alive(aggressor) and aggressor:base() then
			if aggressor:base().sentry_gun then
				aggressor = aggressor:base():get_owner() or managers.criminals:character_unit_by_peer_id(aggressor:base()._owner_id)
			elseif aggressor:base()._projectile_entry then
				aggressor = aggressor:base()._thrower_unit
			end
		end
		
		if alive(aggressor) then
			local panel_id
			if aggressor == managers.player:player_unit() then
				panel_id = HUDManager.PLAYER_PANEL
			else
				local char_data = managers.criminals:character_data_by_unit(aggressor)
				panel_id = char_data and char_data.panel_id
			end
			
			if panel_id then
				local body_name = i_body and self._unit:body(i_body) and self._unit:body(i_body):name()
				local headshot = self._head_body_name and body_name and body_name == self._ids_head_body_name or false
				local is_special = managers.groupai:state()._special_unit_types[self._unit:base()._tweak_table] or false
				managers.hud:increment_kill_count(panel_id, is_special, headshot)
				return
			end
		end
	end

	function CopDamage:damage_bullet(attack_data, ...)
		local result = bullet_original(self, attack_data, ...)
		if result and result.type == "death" then self:_process_kill(attack_data.attacker_unit, self._unit:get_body_index(attack_data.col_ray.body:name())) end
		return result
	end

	function CopDamage:damage_explosion(attack_data, ...)
		local result = explosion_original(self, attack_data, ...)
		if result and result.type == "death" then self:_process_kill(attack_data.attacker_unit) end
		return result
	end

	function CopDamage:damage_melee(attack_data, ...)
		local result = melee_original(self, attack_data, ...)
		if result and result.type == "death" then self:_process_kill(attack_data.attacker_unit, self._unit:get_body_index(attack_data.col_ray.body:name())) end
		return result
	end
	
	function CopDamage:damage_fire(attack_data, ...)
		--TODO: Fix this when Overkill has learned how to code
		if not self:dead() then
			fire_original(self, attack_data, ...)
			if self:dead() and alive(attack_data.attacker_unit) then
				self:_process_kill(attack_data.attacker_unit, attack_data.col_ray and attack_data.col_ray.body and self._unit:get_body_index(attack_data.col_ray.body:name())) 
			end
		end
		
		--local result = fire_original(self, attack_data, ...)
		--if result and result.type == "death" then self:_process_kill(attack_data.attacker_unit, self._unit:get_body_index(attack_data.col_ray.body:name())) end
		--return result
	end

	function CopDamage:sync_damage_bullet(attacker_unit, damage_percent, i_body, hit_offset_height, death, ...)
		if death then self:_process_kill(attacker_unit, i_body) end
		return sync_bullet_original(self, attacker_unit, damage_percent, i_body, hit_offset_height, death, ...)
	end

	function CopDamage:sync_damage_explosion(attacker_unit, damage_percent, i_attack_variant, death, ...)
		if death then self:_process_kill(attacker_unit) end
		return sync_explosion_original(self, attacker_unit, damage_percent, i_attack_variant, death, ...)
	end

	function CopDamage:sync_damage_melee(attacker_unit, damage_percent, damage_effect_percent, i_body, hit_offset_height, variant, death, ...)
		if death then
			self:_process_kill(attacker_unit, i_body)
		end
		return sync_melee_original(self, attacker_unit, damage_percent, damage_effect_percent, i_body, hit_offset_height, variant, death, ...)
	end

	function CopDamage:sync_damage_fire(attacker_unit, damage_percent, death, ...)
		if death then
			self:_process_kill(attacker_unit)
		end
		return sync_fire_original(self, attacker_unit, damage_percent, death, ...)
	end
end

if mod_collection and mod_collection._data.do_decapitations then
    if not _G.BulletDecapitations then
        BulletDecapitations = {}
    end

    BulletDecapitations.cop_decapitation = {
        t = {},
        interval = {},
        attack_data = {},
        ragdoll = {}
    }

    Hooks:Add("CopDamagePostDamageBullet", "BulletDecapitations", function(self, attack_data)

        local head = attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name

        if head and self._dead and attack_data.attacker_unit == managers.player:player_unit() then
            self._unit:movement():enable_update()
            if self._unit:movement()._active_actions[1] then
                self._unit:movement()._active_actions[1]:force_ragdoll()
            end
            
            local bone_head = self._unit:get_object(Idstring("Head"))
            local bone_body = self._unit:get_object(Idstring("Spine1"))
            
            BulletDecapitations.cop_decapitation.attack_data[self._unit] = attack_data
            BulletDecapitations.cop_decapitation.ragdoll[self._unit] = self._unit
            
            self:_spawn_head_gadget({
                position = bone_head:position(),
                rotation = bone_head:rotation(),
                dir = attack_data.attacker_unit:movement():m_head_rot():y()
            })
                
            bone_head:set_position(bone_body:position())
            bone_head:set_rotation(bone_body:rotation())
            
            BulletDecapitations.cop_decapitation.t[self._unit] = Application:time() + 10
            BulletDecapitations.cop_decapitation.interval[self._unit] = Application:time() + 0.5
        end
        
    end )

    Hooks:PostHook( PlayerManager, "update", "BD_CopDecapitationUpdate", function(self, t, dt)
        
        if Utils and Utils:IsInGameState() and Utils:IsInHeist() and not Utils:IsInCustody() then
        
            if BulletDecapitations.cop_decapitation then
                for unit, val in pairs(BulletDecapitations.cop_decapitation.ragdoll) do
                    if alive(unit) then
                        unit:get_object(Idstring("Head")):set_position(unit:get_object(Idstring("Spine1")):position())
                        unit:get_object(Idstring("Head")):set_rotation(unit:get_object(Idstring("Spine1")):rotation())
                    else
                        BulletDecapitations.cop_decapitation.ragdoll[unit] = nil
                    end
                end
                for unit, val in pairs(BulletDecapitations.cop_decapitation.t) do
                    if alive(unit) then
                        if Application:time() < val then
                            if Application:time() >= BulletDecapitations.cop_decapitation.interval[unit] then
                                BulletDecapitations.cop_decapitation.interval[unit] = Application:time() + 0.5
                                
                                World:effect_manager():spawn({
                                    effect = Idstring("effects/payday2/particles/impacts/blood/blood_impact_a"),
                                    position = unit:get_object(Idstring("Neck")):position(),
                                    rotation = unit:get_object(Idstring("Neck")):rotation():y()
                                })
                                
                                local splatter_from = unit:get_object(Idstring("Neck")):position()
                                local splatter_to = splatter_from + unit:get_object(Idstring("Neck")):rotation():y() * 100
                                local splatter_ray = unit:raycast("ray", splatter_from, splatter_to, "slot_mask", managers.slot:get_mask("world_geometry"))
                                if splatter_ray then
                                    World:project_decal(Idstring("blood_spatter"), splatter_ray.position, splatter_ray.ray, splatter_ray.unit, nil, splatter_ray.normal)
                                end
                                
                                if unit:movement()._active_actions[1] then
                                    unit:movement()._active_actions[1]:force_ragdoll()
                                end
                                local scale = 0.075
                                local height = 1
                                local twist_dir = math.random(2) == 1 and 1 or -1
                                local rot_acc = (math.UP * (0.5 * twist_dir)) * -0.5
                                local rot_time = 1 + math.rand(2)
                                local nr_u_bodies = unit:num_bodies()
                                local i_u_body = 0
                                while nr_u_bodies > i_u_body do
                                    local u_body = unit:body(i_u_body)
                                    if u_body:enabled() and u_body:dynamic() then
                                        local body_mass = u_body:mass()
                                        World:play_physic_effect(Idstring("physic_effects/shotgun_hit"), u_body, math.UP * 600 * scale, 4 * body_mass / math.random(2), rot_acc, rot_time)
                                    end
                                    i_u_body = i_u_body + 1
                                end
                            end
                        else
                            BulletDecapitations.cop_decapitation.t[unit] = nil
                            BulletDecapitations.cop_decapitation.interval[unit] = nil
                            BulletDecapitations.cop_decapitation.attack_data[unit] = nil
                        end
                    else
                        BulletDecapitations.cop_decapitation.t[unit] = nil
                        BulletDecapitations.cop_decapitation.interval[unit] = nil
                        BulletDecapitations.cop_decapitation.attack_data[unit] = nil
                    end
                end
            end
        end
        
    end )
end
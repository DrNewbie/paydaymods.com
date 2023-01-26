SniperFocusHandler = class()

SniperFocusHandler.sniper_info = {}

SniperFocusHandler.config_hone_in_mul = 1
SniperFocusHandler.config_hone_out_mul = 2
SniperFocusHandler.config_armor_drain = 40

SniperFocusHandler.NetworkID = "SniperFocusID"

function SniperFocusHandler:DrainArmor( target, amount )
	if target.character_damage then
		local char_dmg = target:character_damage()
		
		if char_dmg.get_real_armor then
		
			local drain = math.min( char_dmg:get_real_armor(), amount )
			
			char_dmg:restore_armor( -drain )
			char_dmg:set_regenerate_timer_to_max()
		end
	end
end

function SniperFocusHandler:SetupAttention( self, attention, client )
	
	if attention then
		
		local found = false
		
		for k, v in pairs( SniperFocusHandler.sniper_info ) do
			if tostring( v.sniper:key() ) == tostring( self._unit:key() ) then
				found = k
				break
			end
		end
		
		if found == false then
			table.insert( SniperFocusHandler.sniper_info, { 
				["sniper"] = self._unit, 
				["target_info"] = {} 
			} )
			found = #SniperFocusHandler.sniper_info
		end
		
		if attention.unit and SniperFocusHandler.sniper_info[found].target_info[attention.unit:key()] == nil then
			SniperFocusHandler.sniper_info[found].target_info[attention.unit:key()] = { ["unit"] = attention.unit, ["amm"] = 0 }
		end
		
		SniperFocusHandler.sniper_info[found].cur_target = attention.unit
	else
		for k, v in pairs( SniperFocusHandler.sniper_info ) do
			if v.sniper == self._unit then
				table.remove( SniperFocusHandler.sniper_info, k )
				break
			end
		end
	end
end

function SniperFocusHandler:ThinkAttention( t, dt )
	
	local LP = managers.player:local_player()
	local Is_Client = _G.LuaNetworking:IsClient()
	
	for k, v in pairs( SniperFocusHandler.sniper_info ) do
		
		local data = v.sniper:brain()._logic_data
		
		if (data or Is_Client) and v.sniper then
			local canshoot = Is_Client or (data.internal_data.shoot_action and (t >= data.internal_data.shoot_action._shoot_t))
			
			if v.cur_target and canshoot then
			
				if not Is_Client and not data.internal_data.weapon_laser_on then
					data.unit:inventory():equipped_unit():base():set_laser_enabled(true)
					data.internal_data.weapon_laser_on = true
					managers.enemy:_destroy_unit_gfx_lod_data(data.key)
					managers.network:session():send_to_peers_synched("sync_unit_event_id_16", data.unit, "brain", HuskCopBrain._NET_EVENTS.weapon_laser_on)
				end
				
				for o, p in pairs( v.target_info ) do
					if p.unit and alive( p.unit ) then
						local t_move = p.unit:movement()
						if t_move and p.unit == v.cur_target then
						
							local shoot_pos = v.sniper:movement():m_head_pos()
							local target_pos = t_move:m_head_pos()
							local mask = managers.slot:get_mask("AI_visibility")
							
							local trace = World:raycast("ray", shoot_pos, target_pos, "slot_mask", mask, "ray_type", "ai_vision")
							
							if not trace then
								v.target_info[o].amm = math.clamp( v.target_info[o].amm + dt * SniperFocusHandler.config_hone_in_mul, 0, 2.5 )
								
								local marked = v.sniper:inventory():equipped_unit() and v.sniper:inventory():equipped_unit():base()._laser_unit
								
								if marked and v.target_info[o].amm > 0.5 and p.unit == LP then
									SniperFocusHandler:DrainArmor( p.unit, (SniperFocusHandler.config_armor_drain / 10) * dt )
								end
								
								if (v.target_info[o].amm - 1.5) > 0 and (v.target_info[o].amm - 1.5) > math.random() then
									if not Is_Client then 
										data.actual_fire = true
										--v.target_info[o].amm = 0
									end
								end
							else
								v.target_info[o].amm = math.clamp( v.target_info[o].amm - dt * SniperFocusHandler.config_hone_out_mul, 0, 2.5 )
							end
						else
							v.target_info[o].amm = math.clamp( v.target_info[o].amm - dt * SniperFocusHandler.config_hone_out_mul, 0, 2.5 )
						end
					else
						v.target_info[o] = nil
					end
				end
			else
				if not Is_Client and data.internal_data.weapon_laser_on then
					if data.unit:inventory():equipped_unit() then
						data.unit:inventory():equipped_unit():base():set_laser_enabled(false)
					end
					data.internal_data.weapon_laser_on = false
					managers.enemy:_create_unit_gfx_lod_data(data.unit)
					managers.network:session():send_to_peers_synched("sync_unit_event_id_16", data.unit, "brain", HuskCopBrain._NET_EVENTS.weapon_laser_off)
				end
				
				for o, p in pairs( v.target_info ) do
					v.target_info[o].amm = math.clamp( v.target_info[o].amm - dt * SniperFocusHandler.config_hone_out_mul, 0, 2.5 )
				end
			end
		else
			for o, p in pairs( v.target_info ) do
				v.target_info[o].amm = math.clamp( v.target_info[o].amm - dt * SniperFocusHandler.config_hone_out_mul, 0, 2.5 )
			end
		end
	end
	
	local cursound = 0
	
	for k, v in pairs( SniperFocusHandler.sniper_info ) do
	
		if not v.sniper or not v.sniper.brain or not v.sniper.character_damage or v.sniper:character_damage():dead() then
			table.remove( SniperFocusHandler.sniper_info, k )
		else
			for o, p in pairs( v.target_info ) do
				if p.unit == LP and p.amm > cursound then
					cursound = p.amm
				end
			end
		end
	end
	
	if LP and LP.character_damage then
		local char_dmg = LP:character_damage()
	
		if cursound * 40 >= ( char_dmg._downed_progression or 0 ) and ( char_dmg._tinnitus_data == nil or cursound >= char_dmg._tinnitus_data.intensity ) then
			SoundDevice:set_rtpc( "downed_state_progression", math.min( 100, cursound * 40 ) )
		end
	end
end

function SniperFocusHandler:Init()
	Hooks:PostHook( CopMovement, "synch_attention", "SniperFocus_synch_attention", function( self, attention )
		if self._unit:base()._tweak_table == "sniper" then
			SniperFocusHandler:SetupAttention( self, attention, true )
		end
	end )

	Hooks:PostHook( CopMovement, "set_attention", "SniperFocus_set_attention", function( self, attention )
		if tostring( self._unit:base()._tweak_table ) == "sniper" then
			SniperFocusHandler:SetupAttention( self, attention )
		end
	end )

	Hooks:Add("GameSetupUpdate", "SniperFocus_update", function( t, dt )
		if SniperFocusHandler and t and dt then
			SniperFocusHandler:ThinkAttention( t, dt )
		end
	end )
end

Hooks:Add("NetworkReceivedData", "SniperFocus_data_recieved", function(sender, id, data)
	if SniperFocusHandler and id == SniperFocusHandler.NetworkID then
		local is_host = _G.LuaNetworking:IsHost()
		if not is_host and data == "Init" then
			SniperFocusHandler:Init()
		elseif is_host and data == "ShouldLoad" then
			_G.LuaNetworking:SendToPeer( sender, SniperFocusHandler.NetworkID, "Init" )
		end
	end
end)

if _G.LuaNetworking:IsHost() then
	SniperFocusHandler:Init()
else
	Hooks:Add("BaseNetworkSessionOnLoadComplete", "SniperFocus_player_join", function( unit, id )
		if SniperFocusHandler then
			for _, peer in pairs(managers.network:session():peers()) do
				if peer:is_host() then
					_G.LuaNetworking:SendToPeer( peer:id(), SniperFocusHandler.NetworkID, "ShouldLoad" )
					break
				end
			end
		end
	end )
end
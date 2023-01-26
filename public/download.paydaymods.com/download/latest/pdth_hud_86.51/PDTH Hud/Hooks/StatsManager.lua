CloneClass(StatisticsManager)

Hooks:PostHook(StatisticsManager, "stop_session", "PDTHHudstop_session", function(self, data)
    local success = data and data.success
	managers.challenges:session_stopped({success = success, from_beginning = self._start_session_from_beginning, drop_in = self._start_session_drop_in, last_session = self._global.last_session})
	managers.challenges:reset("session")
end)

Hooks:RegisterHook("StatisticsManagerKilledByAnyone")
Hooks:PostHook(StatisticsManager, "killed_by_anyone", "PDTHHudkilled_by_anyone", function(self, data)
    Hooks:Call("StatisticsManagerKilledByAnyone", self, data)
end)

Hooks:PostHook(StatisticsManager, "killed", "PDTHHudkilled", function(self, data)
    local success, err = pcall(function()
		local by_bullet = data.variant == "bullet"
		local by_melee = data.variant == "melee"
		local by_explosion = data.variant == "explosion"
		if by_bullet then
			local name_id = data.weapon_unit:base():get_name_id()
			self:_bullet_challenges( data )
			--[[if name_id == "sentry_gun" then
				managers.challenges:count_up( "sentry_gun_law_row_kills" )
				
				if game_state_machine:last_queued_state_name() == "ingame_waiting_for_respawn" then
					managers.challenges:count_up( "grim_reaper" )
				end
			else
				managers.challenges:reset_counter( "sentry_gun_law_row_kills" )
			end]]--
		elseif by_melee then
			self:_melee_challenges(data)
			--managers.challenges:reset_counter( "sentry_gun_law_row_kills" )
		elseif by_explosion then
			self:_explosion_challenges( data )
            self:_bullet_challenges( data )
			--managers.challenges:reset_counter( "sentry_gun_law_row_kills" )
		end
		--[[if self:session_total_law_enforcer_kills() >= 100 then
			managers.challenges:set_flag( "civil_disobedience" )
		end
		if data.name == "fbi" then
			self._fbi_kills = self._fbi_kills and self._fbi_kills + 1 or 1
			
			if self._fbi_kills >= 25 then
				managers.challenges:set_flag( "federal_crime" )
			end
		else
			self._fbi_kills = 0
		end]]--
	end)
	if not success then
		log("[Error] L92 " .. tostring(err))
	end
end)

function StatisticsManager:_bullet_challenges( data )
	local success, err = pcall(function()
		managers.challenges:count_up( data.type.."_kill" )
		managers.challenges:count_up( data.name.."_kill" )
		if data.head_shot then
			managers.challenges:count_up( data.type.."_head_shot" )
		else
			managers.challenges:count_up( data.type.."_body_shot" )
		end
		--[[if data.attacker_state then
			if data.attacker_state == "bleed_out" then
				local weapon_name_id = data.weapon_unit:base():get_name_id()
				if weapon_name_id ~= "sentry_gun" then
					managers.challenges:count_up( "bleed_out_kill" )
					managers.challenges:count_up( "bleed_out_multikill" ) -- During one bleed out session
				end
			end
		end]]--
		local name_id
		if data.weapon_unit then
			if data.weapon_unit:base() and data.weapon_unit:base().grenade_entry then
				name_id = tweak_data.blackmarket.grenades[data.weapon_unit:base():grenade_entry()].weapon_id
			else
				name_id = data.weapon_unit and data.weapon_unit:base().get_name_id and data.weapon_unit:base():get_name_id()
			end
		end

		local weapon_tweak_data
		if data.weapon_unit and data.weapon_unit:base().weapon_tweak_data and data.weapon_unit:base():weapon_tweak_data() then
			weapon_tweak_data = data.weapon_unit:base():weapon_tweak_data()
		else
			weapon_tweak_data = tweak_data.weapon[name_id]
		end

        if name_id then
            managers.challenges:count_up( name_id .."_"..data.name.."_kill" )
			managers.challenges:count_up( name_id .."_"..data.type.."_kill" )
			if data.head_shot then
				managers.challenges:count_up( name_id .."_"..data.type.."_head_shot" )
				managers.challenges:count_up( name_id .."_"..data.name.."_head_shot" )
			else
				managers.challenges:count_up( name_id .."_"..data.type.."_body_shot" )
				managers.challenges:count_up( name_id .."_"..data.name.."_body_shot" )
			end	
        end 
        
		if weapon_tweak_data and weapon_tweak_data.category then
            local category = tweak_data.gui.buy_weapon_category_groups[weapon_tweak_data.category] and tweak_data.gui.buy_weapon_category_groups[weapon_tweak_data.category] or weapon_tweak_data.category
			managers.challenges:count_up( category .."_"..data.name.."_kill" )
			managers.challenges:count_up( category .."_"..data.type.."_kill" )
			if data.head_shot then
				managers.challenges:count_up( category .."_"..data.type.."_head_shot" )
				managers.challenges:count_up( category .."_"..data.name.."_head_shot" )
			else
				managers.challenges:count_up( category .."_"..data.type.."_body_shot" )
				managers.challenges:count_up( category .."_"..data.name.."_body_shot" )
			end	
		end
	end)
	if not success then
		log("[Error] L162 " .. tostring(err))
	end
end

function StatisticsManager:_melee_challenges( data )
	if data.type == "law" then
		managers.challenges:count_up( "melee_law_kill" )
	end
end


function StatisticsManager:_explosion_challenges(data)
	local success, err = pcall(function()
		--[[if game_state_machine:last_queued_state_name() == "ingame_waiting_for_respawn" then
			managers.challenges:count_up("grim_reaper")
		end
		local weapon_id = data.weapon_unit and data.weapon_unit:base().get_name_id and data.weapon_unit:base():get_name_id()
		if weapon_id == "gre_m79" then
			managers.challenges:count_up("m79_law_simultaneous_kills")
			if data.name == "shield" or data.name == "spooc" or data.name == "tank" or data.name == "taser" then
				managers.challenges:count_up("m79_simultaneous_specials")
			end
		elseif weapon_id == "trip_mine" then
			if data.type == "law" then
				managers.challenges:count_up("trip_mine_law_kill")
			end
		end]]--
	end)
	if not success then
		log("[Error] L191 " .. tostring(err))
	end
end

Hooks:PostHook(StatisticsManager, "tied", "PDTHHudtied", function(self, data)
    --[[if data.name == "heavy_swat" then
		managers.challenges:set_flag( "intimidating" )
	end
	local type = tweak_data.character[ data.name ] and tweak_data.character[ data.name ].challenges.type
	if type then
		managers.challenges:count_up( "tiedown_"..type )
	end
	managers.challenges:count_up( "tiedown_"..data.name )]]--
end)

function StatisticsManager.revived(self, data)
	self.orig.revived(self, data)
	--managers.challenges:count_up( "revive" )
end

Hooks:PostHook(StatisticsManager, "revived", "PDTHHudrevived", function(self, data)
    --managers.challenges:count_up( "revive" )
end)

Hooks:PostHook(StatisticsManager, "downed", "PDTHHuddowned", function(self, data)
    --[[if data.bleed_out then
		managers.challenges:reset( "bleed_out" )
	end]]--
end)

function StatisticsManager:session_total_law_enforcer_kills()
	return self._global.session.killed.total.count - self._global.session.killed.civilian.count - self._global.session.killed.civilian_female.count - self._global.session.killed.gangster.count - self._global.session.killed.other.count
end

Hooks:PostHook(StatisticsManager, "use_trip_mine", "PDTHHuduse_trip_mine", function(self)
    managers.challenges:count_up("plant_tripmine")
end)

Hooks:PostHook(StatisticsManager, "use_ammo_bag", "PDTHHuduse_ammo_bag", function(self)
    managers.challenges:count_up("deploy_ammobag")
end)

Hooks:PostHook(StatisticsManager, "use_doctor_bag", "PDTHHuduse_doctor_bag", function(self)
    managers.challenges:count_up("deploy_medicbag")
end)

Hooks:PostHook(StatisticsManager, "use_ecm_jammer", "PDTHHuduse_ecm_jammer", function(self)
    managers.challenges:count_up("deploy_ecm")
end)

Hooks:PostHook(StatisticsManager, "use_sentry_gun", "PDTHHuduse_sentry_gun", function(self)
    managers.challenges:count_up("deploy_sentry")
end)

Hooks:PostHook(StatisticsManager, "use_first_aid", "PDTHHuduse_first_aid", function(self)
    managers.challenges:count_up("deploy_fak")
end)
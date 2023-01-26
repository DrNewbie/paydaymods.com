if RequiredScript == "lib/units/beings/player/playerdamage" then
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- MeleeCuffbyCop -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
	-- On WIP. Bare with my coding skill and special thank you to Luffy for repolishing my bullshi* codes :P --
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	local getting_cuffed_melee_chance = 20 -- Change this number from 0(cops won't cuff a player) up to 100(cops always cuff a player)
	local types = { -- You can add more enemies types if you want.
		["medic"] = true,
		["taser"] = true,
		["spooc"] = true,
		--[[ Excluded All dozer units. You can re-enable by delete this line and the line after tank_mini
		["tank"] = true,
		["tank_hw"] = true,
		["tank_medic"] = true,
		["tank_mini"] = true,
		]]--
		["swat"] = true,
		["city_swat"] = true,
		["cop"] = true,
		["cop_female"] = true,
		["cop_scared"] = true,
		["fbi"] = true,
		["fbi_swat"] = true,
		["fbi_heavy_swat"] = true,
		["heavy_swat"] = true,
		["gensec"] = true,
		["murky"] = true,
		--[[ Excluded All shields as well (since this one shouldn't attack using melee in a first place)
		["phalanx_minion"] = true,
		["phalanx_vip"] = true,
		]]--
		["security"] = true,
		["heavy_zeal_sniper"] = true
	}
	-- Added hook 
	Hooks:PostHook(PlayerDamage, "damage_melee", "MeleeChanceDamageMelee", function(self, attack_data)
		if not self:_chk_can_take_dmg() then
			return
		end
			
		-- preparing somee stuffs
		local getting_cuffed_chance = math.random(0,100)
		local player_can_counter_strike_cops = managers.player:has_category_upgrade("player", "counter_strike_melee")
		local player_can_counter_strike_clk =  managers.player:has_category_upgrade("player", "counter_strike_spooc")
		local enemies_attacker_types = attack_data.attacker_unit:base()._tweak_table

		-- check if enemy type key exists in the table(in our case equals to true)
		if types[enemies_attacker_types] then
			-- check if the player got tased | if so check if the player is on swan song or not.
			if self._unit:movement():tased() then
				if not self._unit:character_damage().swansong then
					-- check if the player is still alive or not.
					if alive(self._unit) then
						-- check if the player got meleed then a cop can cuff the player instantly.
						if self:_chk_can_take_dmg() then
							--[[ check the enemy unit| If alive and successfully cuff player then line i03 will be run. 
							 Works on normal and heavy swats and some types of cops. ]]--
							if attack_data.attacker_unit and attack_data.attacker_unit:alive() then
								attack_data.attacker_unit:sound():say("i03")
							end
							managers.player:set_player_state("arrested")
							return self._current_state
						end
					end
				end
			end
			
			-- run a random number | if true then the player will get cuffed by cops because of getting meleed.
			if getting_cuffed_chance < getting_cuffed_melee_chance then
				-- if the player is on swansong, bleed out or incapacitated state then the player won't get cuffed.
				if self._unit:character_damage().swansong or self._bleed_out or self:incapacitated() then
				
				-- check if the player has counterstrike skill basic or ace then cops can't cuff you (for now...)
				-- Serious bug. You gain auto counter somehow and sometimes :\ (but luckily the cloaker counter is normal so be on guard when facing him.)
				elseif player_can_counter_strike_cops and self._unit:movement():current_state().in_melee then
					if player_can_counter_strike_clk and self._unit:movement():current_state().in_melee then
						self._unit:movement():current_state():discharge_melee()
						return "countered"
					else
						self._unit:movement():current_state():discharge_melee()
						return "countered"
					end 
				-- if others states from above 	
				else
					if attack_data.attacker_unit and attack_data.attacker_unit:alive() then
						attack_data.attacker_unit:sound():say("i03")
					end
					managers.player:set_player_state("arrested")
					return self._current_state
				end
			end
		-- if enemies types are not matched in enemies_attacker_types then do nothing
 		else
			-- unless the player has counterstrike skill then it will be used
			-- It still has that serious bug. You gain auto counter somehow and sometimes :\
			if player_can_counter_strike_cops and self._unit:movement():current_state().in_melee then
				if player_can_counter_strike_clk and self._unit:movement():current_state().in_melee then
					self._unit:movement():current_state():discharge_melee()
					return "countered"
				else
					self._unit:movement():current_state():discharge_melee()
					return "countered"
				end 
			end
		end
	end)
end
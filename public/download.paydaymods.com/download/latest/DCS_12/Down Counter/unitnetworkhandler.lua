local DownCounter = DownCounter or _G.DownCounterStandalone

Hooks:Add("NetworkReceivedData", "NetworkReceivedData_patchy", function(sender, message, data, ...)
	if message == DownCounter.ModID then
		local criminals_manager = managers.criminals

	
		local split_data = string.split(data,":")
		local extra_lives = split_data and split_data[2] or 0
		local existing_downs = split_data and split_data[4] or 0

		DownCounter.nine_lives[sender] = tonumber(extra_lives)

		DownCounter.counter[sender] = tonumber(existing_downs)
	end
	
end)

Hooks:PreHook(UnitNetworkHandler, "sync_doctor_bag_taken", "dcs_unitnetworkhandler_syncdoctorbagtaken", function(self, unit, amount, sender, ...)
	local peer = self._verify_sender(sender) --gets data about player such as username, peerid, steamid64, internal char name etc.
	if not alive(unit) or not self._verify_gamestate(self._gamestate_filter.any_ingame) or not peer then
		return
	end
	local peer_id = 420 --blaze ur dongers
	local peer_name = "ChadHeister McSexHaver"
	if peer then
		peer_id = peer._id or peer_id
		peer_name = peer._name or peer_name
	else
		--log("Down Counter: Error- could not verify sender. Returning")
		return
	end
	if DownCounter:IsAlertModeAll() or DownCounter:IsAlertModeTeammates() then
		local downs = DownCounter.counter[peer_id] or "[ERROR]"
		local message = tostring(peer_name) .. " used a doctor bag. (Replenished " .. tostring(downs) .. (downs == 1 and " down.)" or " downs.)")
		if DownCounter.counter[peer_id] == 0 then 
			message = message .. " For shame!" --heal-shaming is real
		end
		DownCounter:Announce(message)
	end
	DownCounter.counter[peer_id] = 0
end)

Hooks:PreHook(UnitNetworkHandler, "sync_player_movement_state", "dcs_unitnetworkhandler_syncplayermovementstate", function(self, unit, state, ...)
	if not unit then
--		log("Error! Invalid unit in UnitNetworkHandler:sync_player_movement_state.")
		return
	end
	local peer_id = managers.criminals:character_peer_id_by_unit(unit) or 420
	local player_name = LuaNetworking:GetNameFromPeerID( peer_id ) or "ChadHeister McSexHaver"
	local rollem = math.random(100)
	local message = player_name--"Player " .. player_name
	local downs = DownCounter.counter[peer_id] or "[ERROR]" 
	if tostring(state) == "dead" then
		if not DownCounter:AnnounceCustodies() then 
			return --when teammate goes into custody, do not announce custody, and do not announce that they went down. you know, cause they went into custody
		end
		if rollem > 99 then 
			message = message .. " is in a pickle!"
		else
			message = message .. " has gone into custody."
		end
		DownCounter.counter[peer_id] = DownCounter.counter[peer_id] + 1
		message = message .. " (Downed " .. tostring(downs) .. " time" .. tostring(downs == 1 and ".)" or "s.)")
		
		DownCounter.counter[peer_id] = 0

	elseif tostring(state) == "bleed_out" then

		DownCounter.counter[peer_id] = DownCounter.counter[peer_id] + 1
		downs = DownCounter.counter[peer_id] or "[ERROR]"

		local max_downs = DownCounter.global_max_downs or 4 --todo make a global function to get #maxdowns
		if downs >= max_downs - 1 then 
			message = "Warning! " .. message .. " has been downed " .. tostring(downs) .. " times!"
		elseif not DownCounter:IsAnnounceLowDownsOnly() and (DownCounter:IsAlertModeAll() or DownCounter:IsAlertModeTeammates()) then
			message = message .. " has been downed " .. tostring(downs) .. " time" .. (downs == 1 and "." or "s.")
		else
			return --don't say anything if: 1. high revives remain and not announce low downs, and 2. DCS mode is not set to announce team downs
		end

--these are unused right now
--unused state: "jerry6" (skydive)
	elseif state == "arrested" then
		if DownCounter:AnnounceExtraStates() then 
			message = message .. " was cuffed!"
		else
			return
		end
	elseif state == "incapacitated" then 
		if DownCounter:AnnounceExtraStates() then 	
			message = message .. " was tased down/cloaked!"
			message = message .. " (Downed " .. tostring(downs) .. " time" .. (downs == 1 and ".)" or "s.)")
		else
			return
		end
	elseif state == "tased" then 
		if DownCounter:AnnounceExtraStates() then
			message = message .. " is being tased!"
		else
			return
		end
	elseif state == "fatal" then --downed and out, full bleed-out, no weapon, view tilted 90 degrees, fall to the floor, walk the dinosaur
		if DownCounter:AnnounceExtraStates() then
			message = message .. " is unconscious."
		else
			return
		end
	else
		return --don't announce anything
	end
	
	DownCounter:Announce(message)
end)

Hooks:PostHook(UnitNetworkHandler,"on_sole_criminal_respawned","dcs_unitnetworkhandler_onsolecriminalrespawned",function(self,peer_id, sender)
	DownCounter.counter[peer_id] = 0
end)
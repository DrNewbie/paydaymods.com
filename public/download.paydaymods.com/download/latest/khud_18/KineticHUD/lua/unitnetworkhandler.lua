-- /////////////// TO ADD CUSTOM VOICE LINES, DO NOT CHANGE THIS FILE \\\\\\\\\\\\\\\
-- ############### TO ADD CUSTOM VOICE LINES, DO NOT CHANGE THIS FILE ###############
-- %%%%%%%%%%%%%%% TO ADD CUSTOM VOICE LINES, DO NOT CHANGE THIS FILE %%%%%%%%%%%%%%%
-- @@@@@@@@@@@@@@@ TO ADD CUSTOM VOICE LINES, DO NOT CHANGE THIS FILE @@@@@@@@@@@@@@@
-- $$$$$$$$$$$$$$$ TO ADD CUSTOM VOICE LINES, DO NOT CHANGE THIS FILE $$$$$$$$$$$$$$$
-- =============== TO ADD CUSTOM VOICE LINES, DO NOT CHANGE THIS FILE ===============
-- *************** TO ADD CUSTOM VOICE LINES, DO NOT CHANGE THIS FILE ***************
-- [[[[[[[[[[[[[[[ TO ADD CUSTOM VOICE LINES, DO NOT CHANGE THIS FILE ]]]]]]]]]]]]]]]
-- ((((((((((((((( TO ADD CUSTOM VOICE LINES, DO NOT CHANGE THIS FILE )))))))))))))))
-- <<<<<<<<<<<<<<< TO ADD CUSTOM VOICE LINES, DO NOT CHANGE THIS FILE >>>>>>>>>>>>>>>
-- """"""""""""""" TO ADD CUSTOM VOICE LINES, DO NOT CHANGE THIS FILE """""""""""""""
-- ''''''''''''''' TO ADD CUSTOM VOICE LINES, DO NOT CHANGE THIS FILE '''''''''''''''
-- ~~~~~~~~~~~~~~~ TO ADD CUSTOM VOICE LINES, DO NOT CHANGE THIS FILE ~~~~~~~~~~~~~~~
-- --------------- TO ADD CUSTOM VOICE LINES, DO NOT CHANGE THIS FILE ---------------
-- ^^^^^^^^^^^^^^^ TO ADD CUSTOM VOICE LINES, DO NOT CHANGE THIS FILE ^^^^^^^^^^^^^^^
-- \\\\\\\\\\\\\\\ TO ADD CUSTOM VOICE LINES, DO NOT CHANGE THIS FILE ///////////////
--* I cannot stress this enough.
--* Unless you are booting for the first time or deleted your blacklist file,
--	  changing this file will not work,
--	  and BLT will think that your mod needs updating.

local banned_lines = { --most of these sounds are from the original Anti Voice Spam mod
	["play_pln_gen_count_17"] = true, --these ones are probably branch bank alarm noises
	["Play_pln_branchbank_stage1_83"] = true, --not sure if the capital "P" is a typo or not
	["play_pln_gen_urg_01"] = true,
	["play_pln_gen_dir_07"] = true,
	["play_pln_gen_dir_08"] = true,
	["diegetic_club_music"] = true, --club music
	["diegetic_club_rock_music"] = true, -- club music
	["diegetic_lounge_music"] = true, -- club music
	["cloaker_detect_mono"] = true, -- wolololo
	["cloaker_presence_loop"] = true, --wolololololololo
	["cpa_a03_01"] = true,
	["cpa_a02_01"] = true,
	["cpw_a04"] = true,
	["cpw_a05"] = true,
	["cpa_a04_01"] = true,
	["bdz_entrance"] = true,
	["bdz_entrance_elite"] = true,
	["cloaker_detect_christmas_mono"] = true, --jingle bells (christmas cloaker wololo)
	["cloaker_taunt_after_assault"] = true, --STOP HITTING YOURSELF
	["alarmbomb"] = true,
	["camera_alarm_signal"] = true, --beeeeeeeeep
	["alarm_countdown_loop"] = true,
	["alarm_countdown_ticking_down_10sec"] = true,
	["alarm_fire"] = true,
	["alarm_kosugi_on_slow_fade"] = true, --shadow raid
	["alarm_museum_on_slow_fade"] = true,
	["alarm_the_bomb_on_slow_fade"] = true,
	["hitec_lotec_alarm_slow_fade"] = true,
	["jewelry_alarm_on_slow_fade"] = true,
	["swatturret_alert"] = true,
	["swat_explosion"] = true,
	["swat_blows_window_medium"] = true,
	["shield_identification"] = true,
	["c4_beep_loop"] = true,
	["cm1_burndeath"] = true,
	["tsr_burndeath"] = true,
	["tsr_x02a_any_3p"] = true,
	["clk_burndeath"] = true,
	["clk_x02a_any_3p"] = true,
	["bdz_x02a_any_3p"] = true,
	["bdz_visor_lost"] = true,
	["santa_hoho"] = true,
	["criminals_ambition"] = true,
	["criminals_ambition_instrumental"] = true,
	["pth_criminal_intent"] = true,
	["goat_says_meh"] = true, -- G O Ts
	["goat_says_meh_loop"] = true,
	["goat_fan_woosh"] = true, 
	["goat_hang_scaffold"] = true,
	["goat_headbutt"] = true,
	["goat_kick"] = true,
	["goat_lick"] = true,
	["goat_sleep"] = true,
	["v34"] = false, --heat speech
	["v35"] = false, --BAIN!?
	["v55"] = false, --skydive screaming
	["g29"] = false, --(haha fuck lol)
	["g60"] = false, --(oh shit!)
	["whistling_attention"] = false --iirc only used in framing frame day 3 but loaded on all maps
}

local save_name = "antivoicespam2.txt"
local save_path = SavePath .. save_name

function CreateBlacklist()
	local file = io.open(save_path,"w+")
	if file then
		file:write(json.encode(banned_lines))
		file:close()
	end	
end

function LoadBlacklist()
	local file = io.open(save_path, "r")
	if (file) then
		for k, v in pairs(json.decode(file:read("*all"))) do
			banned_lines[k] = v
		end
	else
		--create data in case there's no mod save data
		KineticHUD:_log("[KHUD Anti Voice Spam] First launch or missing blacklist file. Generating new blacklist.")
		CreateBlacklist()
		--no need to read the new blacklist since it'll be the same as the one just created
	end
end

LoadBlacklist()

local banned_eventids = {}
for k,v in pairs(banned_lines) do
	--link readable string voiceline to its internal event_id
--	local status = v == true and " is banned" or " is not banned"
--	log("event " .. tostring(SoundDevice:string_to_id( k )) .. " with id " .. tostring(k) .. status)
	banned_eventids[tostring(SoundDevice:string_to_id( k ))] = k
end

local orig_say_voiceline = UnitNetworkHandler.say
function UnitNetworkHandler:say(unit,event_id,sender,...) --this function interprets/intercepts voice lines from other players
	if KineticHUD:IsAntispamEnabled() then
		if not alive(unit) or not self._verify_gamestate(self._gamestate_filter.any_ingame) or not self._verify_sender(sender) then
			return
		end
		local peer = self._verify_sender(sender)
	--	local peer_id = peer:id()
		
		if managers.chat:is_peer_muted(peer) then --muted peer with ingame players list options
			return
		elseif false then --banned_eventids[tostring(event_id)] then --muted voiceline from blacklist
			return
		end
	end
	return orig_say_voiceline(self,unit,event_id,sender,...)
end

Hooks:PreHook(UnitNetworkHandler, "sync_doctor_bag_taken", "khud_unitnetworkhandler_syncdoctorbagtaken", function(self, unit, amount, sender, ...)
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
	if KineticHUD:DownCounter_IsAlertModeAll() or KineticHUD:DownCounter_IsAlertModeTeammates() then
		local downs = KineticHUD:DownCounter_GetDowns(peer_id) or "[ERROR]"
		local message = tostring(peer_name) .. " used a doctor bag. (Replenished " .. tostring(downs) .. (downs == 1 and " down.)" or " downs.)")
		if KineticHUD:DownCounter_GetDowns(peer_id) == 0 then 
			message = message .. " For shame!" --heal-shaming is real
		end
		KineticHUD:DownCounter_Announce(message)
	end
	KineticHUD:DownCounter_SetDowns(0,peer_id)
end)

Hooks:PreHook(UnitNetworkHandler, "sync_player_movement_state", "khud_unitnetworkhandler_syncplayermovementstate", function(self, unit, state, ...)
	if not unit then
--		log("Error! Invalid unit in UnitNetworkHandler:sync_player_movement_state.")
		return
	end
	local peer_id = managers.criminals:character_peer_id_by_unit(unit) or 420
	local player_name = LuaNetworking:GetNameFromPeerID( peer_id ) or "ChadHeister McSexHaver"
	local rollem = math.random(100)
	local message = player_name--"Player " .. player_name
	local downs = KineticHUD:DownCounter_GetDowns(peer_id) or "[ERROR]" 
	if tostring(state) == "dead" then
		if not KineticHUD:DownCounter_AnnounceCustodies() then 
			return --when teammate goes into custody, do not announce custody, and do not announce that they went down. you know, cause they went into custody
		end
		if rollem > 99 then 
			message = message .. " got absolutely REKT!11!!1!1"
		else
			message = message .. " has gone into custody."
		end
		KineticHUD:DownCounter_SetDowns(KineticHUD:DownCounter_GetDowns(peer_id) + 1,peer_id)
--		KineticHUD.down_counter[peer_id] = KineticHUD.down_counter[peer_id] + 1
		message = message .. " (Downed " .. tostring(downs) .. " time" .. tostring(downs == 1 and ".)" or "s.)")
		
		KineticHUD:DownCounter_SetDowns(0,peer_id)

	elseif tostring(state) == "bleed_out" then

		KineticHUD:DownCounter_SetDowns(KineticHUD:DownCounter_GetDowns(peer_id) + 1,peer_id)
--		KineticHUD.down_counter[peer_id] = KineticHUD.down_counter[peer_id] + 1
		downs = KineticHUD:DownCounter_GetDowns(peer_id) or "[ERROR]"

		local max_downs = KineticHUD:DownCounter_GetGlobalMaxDowns() or 4 --todo make a global function to get #maxdowns
		if downs >= max_downs - 1 then 
			message = "Warning! " .. message .. " has been downed " .. tostring(downs) .. " times!"
		elseif not KineticHUD:DownCounter_AnnounceLowDownsOnly() and (KineticHUD:DownCounter_IsAlertModeAll() or KineticHUD:DownCounter_IsAlertModeTeammates()) then
			message = message .. " has been downed " .. tostring(downs) .. " time" .. (downs == 1 and "." or "s.")
		else
			return --don't say anything if: 1. high revives remain and not announce low downs, and 2. DCS mode is not set to announce team downs
		end
	elseif state == "arrested" then
		if KineticHUD:DownCounter_AnnounceExtraStates() then 
			message = message .. " was cuffed!"
		else
			return
		end
	elseif state == "incapacitated" then 
		if KineticHUD:DownCounter_AnnounceExtraStates() then 	
			message = message .. " was tased down/cloaked!"
			message = message .. " (Downed " .. tostring(downs) .. " time" .. (downs == 1 and ".)" or "s.)")
		else
			return
		end
	elseif state == "tased" then 
		if KineticHUD:DownCounter_AnnounceExtraStates() then
			message = message .. " is being tased!"
		else
			return
		end
	elseif state == "fatal" then --downed and out, full bleed-out, no weapon, view tilted 90 degrees, fall to the floor, walk the dinosaur
		if KineticHUD:DownCounter_AnnounceExtraStates() then
			message = message .. " is unconscious."
		else
			return
		end
	else
		return --don't announce anything
	end
	
	KineticHUD:DownCounter_Announce(message)
end)

Hooks:PostHook(UnitNetworkHandler,"on_sole_criminal_respawned","khud_unitnetworkhandler_onsolecriminalrespawned",function(self,peer_id, sender)
	KineticHUD:DownCounter_SetDowns(0,peer_id)
end)


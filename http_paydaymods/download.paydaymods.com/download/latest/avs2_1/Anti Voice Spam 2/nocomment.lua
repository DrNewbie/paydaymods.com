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
--* See README.txt for instructions on how to blacklist additional voice lines!

local banned_lines = { --most of these sounds are from the original Anti Voice Spam mod
	["play_pln_gen_count_17"] = true, --these ones are probably branch bank alarm noises
	["Play_pln_branchbank_stage1_83"] = true, --not sure if the capital "]P"] is a typo or not
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
	["alarm_kosugi_on_slow_fade"] = true,
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
	["v34"] = true, --heat speech
	["v35"] = true, --BAIN!?
	["v55"] = true, --skydive screaming
	["g29"] = true, --(haha fuck lol)
	["g60"] = true, --(oh shit!)
	["whistling_attention"] = true --iirc only used in framing frame day 3 but loaded on all maps
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
		log("[Anti Voice Spam] First launch or missing blacklist file. Generating new blacklist.")
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
	if not alive(unit) or not self._verify_gamestate(self._gamestate_filter.any_ingame) or not self._verify_sender(sender) then
		return
	end
	local peer = self._verify_sender(sender)
--	local peer_id = peer:id()
	
	if managers.chat:is_peer_muted(peer) then --muted peer with ingame players list options
		return
	elseif banned_eventids[tostring(event_id)] then --muted voiceline from blacklist
		return
	end
	return orig_say_voiceline(self,unit,event_id,sender,...)
end
local Net = _G.LuaNetworking

if file.DirectoryExists( "mods/CANARY/" ) and not CANARYExists then
	CANARYExists = true
elseif not file.DirectoryExists( "mods/CANARY/" )  and not CANARYExists then
	CANARYExists = false
end
local UTILS_PAGERS = function() return BWROptions._data.utils_pagers end
local HostCheck
K_ClientSideCheck = nil
KTweak_PagerNumber_C = 0

local function corpse()
	if not K_ClientSideCheck then
		KTweak_PagerNumber_C = KTweak_PagerNumber_C + 1
	end
end

local function checkpage(tweakdata)
	if tweakdata == "corpse_alarm_pager" then
		DelayedCalls:Add("mypager", 8.95, corpse)
	end
end

local function active_safe()
	local idealVersion = "1.32.0"
	local GameVersion = Application:version()
	if GameVersion ~= idealVersion then
		return managers.interaction:active_unit()
	else
		return managers.interaction:active_object()
	end
end

local function intcheck()
    if not managers.interaction or not active_safe() or not active_safe():interaction() then
            return
    end
    local tweakdata = active_safe():interaction().tweak_data
    if not K_ClientSideCheck then
    	checkpage(tweakdata)
	end
end


local pcheck = "K_Pagers"
local hcheck = "K_HostPresent"

Hooks:Add("NetworkReceivedData", "NetworkReceivedData_HostPresent", function(sender, id, data)
    if id == hcheck then
		if Net:IsClient() then
			K_ClientSideCheck = true
		end
	end
end)

Hooks:Add("NetworkReceivedData", "NetworkReceivedData_Pagers_Indep", function(sender, id, data)
    if id == pcheck then
		if Net:IsClient() and ClientSideCheck then
			KTweak_PagerNumber = tonumber(data)
			if UTILS_PAGERS() then
				if KTweak_PagerNumber == 1 then
					managers.chat:_receive_message(1, "Pagers Remaining", "3", tweak_data.screen_colors.friend_color)
				elseif KTweak_PagerNumber == 2 then
					managers.chat:_receive_message(1, "Pagers Remaining", "2", tweak_data.screen_colors.friend_color)
					ClientSideCheck = true
				elseif KTweak_PagerNumber == 3 then
					managers.chat:_receive_message(1, "Pagers Remaining", "1", tweak_data.screen_colors.friend_color)
					ClientSideCheck = true
				elseif KTweak_PagerNumber == 4 then
					managers.chat:_receive_message(1, "Pagers Remaining", "0", tweak_data.screen_colors.friend_color)
					ClientSideCheck = true
				end
			end
		end
	end
end)

if RequiredScript == 'lib/managers/group_ai_states/groupaistatebase' then

local PagerBluff_old = PagerBluff_old or GroupAIStateBase.on_successful_alarm_pager_bluff

function GroupAIStateBase:on_successful_alarm_pager_bluff()
	PagerBluff_old( self )

	if Net:IsHost() then
		KTweak_PagerNumber = self._nr_successful_alarm_pager_bluffs
	if UTILS_PAGERS() then
		if KTweak_PagerNumber == 0 then
			managers.chat:_receive_message(1, "Pagers Remaining", "4", tweak_data.screen_colors.friend_color)
		elseif KTweak_PagerNumber == 1 then
			managers.chat:_receive_message(1, "Pagers Remaining", "3", tweak_data.screen_colors.friend_color)
		elseif KTweak_PagerNumber == 2 then
			managers.chat:_receive_message(1, "Pagers Remaining", "2", tweak_data.screen_colors.friend_color)
		elseif KTweak_PagerNumber == 3 then
			managers.chat:_receive_message(1, "Pagers Remaining", "1", tweak_data.screen_colors.friend_color)
		elseif KTweak_PagerNumber == 4 then
			managers.chat:_receive_message(1, "Pagers Remaining", "0", tweak_data.screen_colors.friend_color)
		end
	end
		if Net:IsMultiplayer() then
			Net:SendToPeers( "K_HostPresent", "")
			if UTILS_PAGERS() then
			Net:SendToPeers( "K_Pagers", KTweak_PagerNumber )
			end
		end
	end
end

elseif RequiredScript == 'lib/units/interactions/interactionext' then

local AtInteractStart_old = AtInteractStart_old or BaseInteractionExt._at_interact_start

function BaseInteractionExt:_at_interact_start()
	AtInteractStart_old(self)
	intcheck()
end

local AtInteractInterrupt_old = AtInteractInterrupt_old or BaseInteractionExt._at_interact_interupt

function BaseInteractionExt:_at_interact_interupt(player, complete)
	AtInteractInterrupt_old(self, player, complete)
	DelayedCalls:Remove("mypager")
end

elseif RequiredScript == 'lib/network/handlers/unitnetworkhandler' then
function UnitNetworkHandler:alarm_pager_interaction(u_id, tweak_table, status, sender)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) then
		return
	end
	local unit_data = managers.enemy:get_corpse_unit_data_from_id(u_id)
	if unit_data and unit_data.unit:interaction():active() and unit_data.unit:interaction().tweak_data == tweak_table then
		local peer = self._verify_sender(sender)
		if peer then
			local status_str
			if status == 1 then
				status_str = "started"
			elseif status == 2 then
				status_str = "interrupted"
			else
				status_str = "complete"
				if not K_ClientSideCheck then
				if UTILS_PAGERS() then
					KTweak_PagerNumber_C = KTweak_PagerNumber_C + 1
					if KTweak_PagerNumber_C == 1 then
						managers.chat:_receive_message(1, "Pagers Remaining - CLIENT", "3", tweak_data.screen_colors.pro_color)
					elseif KTweak_PagerNumber_C == 2 then
							managers.chat:_receive_message(1, "Pagers Remaining - CLIENT", "2", tweak_data.screen_colors.pro_color)
					elseif KTweak_PagerNumber_C == 3 then
							managers.chat:_receive_message(1, "Pagers Remaining - CLIENT", "1", tweak_data.screen_colors.pro_color)
					elseif KTweak_PagerNumber_C == 4 then
							managers.chat:_receive_message(1, "Pagers Remaining - CLIENT", "0", tweak_data.screen_colors.pro_color)
					end
				end
				end
			end
			unit_data.unit:interaction():sync_interacted(peer, nil, status_str)
		end
	end
end
elseif RequiredScript == 'lib/managers/hud/hudblackscreen' then
local HUDBlack_old = HUDBlack_old or HUDBlackScreen._animate_fade_out

function HUDBlackScreen:_animate_fade_out(mid_text)
	HUDBlack_old(self, mid_text)
	if Net:IsHost() then
	Net:SendToPeers( "K_HostPresent", "")
	end
end
end
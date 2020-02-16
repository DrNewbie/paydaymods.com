--todo make local client going into custody reset downs


_G.DownCounterStandalone = _G.DownCounterStandalone or {}
local DownCounter = DownCounter or _G.DownCounterStandalone

DownCounter.ModID = "DownCounterStandalone"

DownCounter._path = ModPath
DownCounter._data_path = SavePath .. "downcounter_standalone.txt"

DownCounter.settings = DownCounter.settings or {
	hudmode = true,--if true, renders hud counter. if false, does not do that thing i just said
	
	announce_chat_mode = 2,
	--modes can be 1 (off), 2 (local only [default]), or 3 (announce in chat to all [only one client will be selected to do this])

	announce_alert_mode = 3,
	--modes can be 1 (all players' stats [default]), 2 (only your teams' stats), 3 (only your stats)
	--***design option 2:
	--   allow each individual player to announce their own instead? but so much work to manage clients who do/don't have the mod
	
		--downs and docbag replenishes, if you REALLY want to micromanage them)
	announce_custody = false,
	announce_docbags = false,
	announce_extras = false, --announces other things like being tased, cloaked, cuffed. warning: extremely annoying
	only_announce_lowdowns_mode = true
	--bool; if true, only announce downs when player is "black and white:" on their last down (cannot account for Nine Lives Aced unless that player has this mod)
}
DownCounter.king = 420 --peerid of designated announcer client
--only the king shall speak.
--re-elections are held when the current king leaves. lowest client (closest to host) is always king
--currently not fully implemented, so the election of the king will not stop all players with the mod from announcing it

DownCounter.nine_lives = DownCounter.nine_lives or {
	[1] = 0,
	[2] = 0,
	[3] = 0,
	[4] = 0,
	[420] = 0
}

DownCounter.counter = DownCounter.counter or {
	[1] = 0,
	[2] = 0,
	[3] = 0,
	[4] = 0,
	[420] = 0
}

function DownCounter:SendDownsDataToAll()
	local extra_lives = managers.player:upgrade_value("player", "additional_lives", 0) or 0
	local my_downs = DownCounter.counter[LuaNetworking:LocalPeerID()] or 0
	LuaNetworking:SendToPeers(DownCounter.ModID, "NineLives:" .. tostring(extra_lives) .. ":ExistingDowns:" .. tostring(my_downs))
end

function DownCounter:SendDownsData(peer_id)
	if not peer_id then 
		return
	end
	local extra_lives = managers.player:upgrade_value("player", "additional_lives", 0) or 0
	local my_downs = DownCounter.counter[LuaNetworking:LocalPeerID()] or 0
	LuaNetworking:SendToPeer(peer_id,DownCounter.ModID, "NineLives:" .. tostring(extra_lives) .. ":ExistingDowns:" .. tostring(my_downs))
end

function DownCounter:Announce(message)
	if DownCounter:IsChatModeMuted() then
		return
	elseif DownCounter:IsChatModeLocal() then
		DownCounter:AnnounceToSelf(message)
	elseif DownCounter:IsChatModeGlobal() then
		DownCounter:AnnounceToAll(message)
	end
end

function DownCounter:AnnounceToAll(message)
	managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "[DOWNCOUNTER] " .. tostring(message))		
end

function DownCounter:AnnounceToSelf(message)
	managers.chat:_receive_message(1,"[DownCounter]", tostring(message), Color('fce538'))
end

function DownCounter:IsAnnounceLowDownsOnly()
	return DownCounter.settings.only_announce_lowdowns_mode
end

function DownCounter:AnnounceDocBags()
	return DownCounter.settings.announce_docbags
end

function DownCounter:AnnounceCustodies() --why did i make this plural. it's singular "custody" everywhere else, rip consistency
	return DownCounter.settings.announce_custody
end

function DownCounter:AnnounceExtraStates()
	return DownCounter.settings.announce_extras
end

function DownCounter:IsChatModeMuted()
	return DownCounter.settings.announce_chat_mode == 1
end

function DownCounter:IsChatModeLocal()
	return DownCounter.settings.announce_chat_mode == 2
end

function DownCounter:IsChatModeGlobal()
	return DownCounter.settings.announce_chat_mode == 3
end

function DownCounter:IsAlertModeAll()
	return DownCounter.settings.announce_alert_mode == 1
end

function DownCounter:IsAlertModeTeammates()
	return DownCounter.settings.announce_alert_mode == 2
end

function DownCounter:IsAlertModeSelf()
	return DownCounter.settings.announce_alert_mode == 3
end

function DownCounter:IsHUDEnabled()
	return DownCounter.settings.hudmode
end

Hooks:Add("LocalizationManagerPostInit", "dcs_LocalizationManagerPostInit", function( loc )
	loc:load_localization_file( DownCounter._path .. "en.txt")
end)

function DownCounter:Load()
	local file = io.open(self._data_path, "r")
	if (file) then
		for k, v in pairs(json.decode(file:read("*all"))) do
			self.settings[k] = v
		end
	else
		DownCounter:Save() --create data in case there's no mod save data
	end
end

function DownCounter:Save()
	local file = io.open(self._data_path,"w+")
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_dcs", function(menu_manager)

	MenuCallbackHandler.callback_dcs_docbags = function(self,item)
		DownCounter.settings.announce_docbags = item:value() == "on"
		DownCounter:Save()
	end
	
	MenuCallbackHandler.callback_dcs_custody = function(self,item)
		DownCounter.settings.announce_custody = item:value() == "on"
		DownCounter:Save()
	end

	MenuCallbackHandler.callback_dcs_downs_low = function(self,item)
		DownCounter.settings.only_announce_lowdowns_mode = item:value() == "on"
		DownCounter:Save()
	end
	
	MenuCallbackHandler.callback_dcs_extras = function(self,item)
		DownCounter.settings.announce_extras = item:value() == "on"
		DownCounter:Save()
	end
	
	MenuCallbackHandler.callback_dcs_chatmode = function(self,item)
		DownCounter.settings.announce_chat_mode = tonumber(item:value())
		DownCounter:Save()
	end
	
	MenuCallbackHandler.callback_dcs_alertmode = function(self,item)
		DownCounter.settings.announce_alert_mode = tonumber(item:value())
		DownCounter:Save()
	end	
	MenuCallbackHandler.callback_dcs_hudmode = function(self,item)
		DownCounter.settings.hudmode = item:value() == "on"
		if DownCounter.settings.hudmode then
			--panel create
		else
			--panel destroy
		end

		DownCounter:Save()
	end
	
	MenuCallbackHandler.callback_dcs_close = function(this)
		DownCounter:Save()
	end
	DownCounter:Load()
	MenuHelper:LoadFromJsonFile(DownCounter._path .. "options.txt", DownCounter, DownCounter.settings)	
	
end)

	
-------------------------------------------------
--  Menu Logic
-------------------------------------------------
_G.SilentAssassin = _G.SilentAssassin or {}
SilentAssassin._path = ModPath
SilentAssassin._loc_path = ModPath .. "loc/"
SilentAssassin._data_path = SavePath .. "silentassassin.txt"
-- num_pagers -> number of pagers allowed.
-- num_pagers_per_player -> maximum number of pagers a single
--  player may use
SilentAssassin.settings = {}
-- I can't get at the player unit at the end game screen. (or at least I don't
-- know how)  So store the local pagers used here.  It'll be easier if I end
-- up having to sync the pagers used to the clients anyway.
SilentAssassin.localPagersUsed = 0

--Loads the options from blt
function SilentAssassin:Load()
    --log(debug.traceback())
    self.settings["num_pagers"] = 2
    self.settings["num_pagers_per_player"] = 2
    self.settings["enabled"] = true
    self.settings["stealth_kill_enabled"] = true
    self.settings["pager_bonus_enabled"] = false
    self.settings["matchmaking_filter"] = 1
    self.settings["pager_detection_threshold"] = 1

    local file = io.open(self._data_path, "r")
    if (file) then
        for k, v in pairs(json.decode(file:read("*all"))) do
            self.settings[k] = v
        end
    end
    --log("In Load " .. json.encode(self.settings))
end

--Saves the options
function SilentAssassin:Save()
    --log("In save " .. json.encode(self.settings))
    local file = io.open(self._data_path, "w+")
    if file then
        file:write(json.encode(self.settings))
        file:close()
    end
end

--Loads the data table for the menuing system.  Menus are
--ones based
function SilentAssassin:getCompleteTable()
    local tbl = {}
    for i, v in pairs(SilentAssassin.settings) do
        if i == "num_pagers" then
            tbl[i] = v + 1
        elseif  i == "num_pagers_per_player" then
            tbl[i] = v + 1
        elseif i == "pager_detection_threshold" then
            tbl[i] = v * 100
        else
            tbl[i] = v
        end
    end

    return tbl
end

--Sets number of pagers.  Called from the menu system.  Menus are all ones
--based
function setNumPagers(this, item)
    SilentAssassin.settings["num_pagers"] = item:value() - 1
end

function setNumPagersPerPlayer(this, item)
    SilentAssassin.settings["num_pagers_per_player"] = item:value() - 1
end

function setEnabled(this, item)
    local value = item:value() == "on" and true or false
    SilentAssassin.settings["enabled"] = value
end

function setStealthKillEnabled(this, item)
    local value = item:value() == "on" and true or false
    SilentAssassin.settings["stealth_kill_enabled"] = value
end

function setMatchmakingFilter(this, item)
    --log ("setMatchmakingFilter" .. tostring(item:value()))
    SilentAssassin.settings["matchmaking_filter"] = item:value()
end

function setEnablePagerBonusToggle(this, item)
    local value = item:value() == "on" and true or false
    SilentAssassin.settings["pager_bonus_enabled"] = value
end

function setPagerDetectionThreshold(this, item)
    local value = item:value() / 100
    SilentAssassin.settings["pager_detection_threshold"] = value
end
--this only gives you the bonus for not using your pager
function calculateStageStealthBonus()
    --and if you personally didn't use a pager at all, you get a 2% bonus
    local playerBonus
    if getLocalPagersAnswered() == 0 then
        playerBonus = .02
    else
        playerBonus = 0
    end

    return playerBonus
end

--bonus for difficulty too
function calculateLevelStealthBonus()
    --calculate an adjusted stealth bonus for the level/stage
    -- adding or removing pagers (from the default of 2) changes the bonus
    -- each pager used by the party decreases the bonus
    -- reducing pagers per player increases the bonus
    -- not using your pager increases it
    local numPagers = getNumPagers()
    --don't penalize the player for having 2 total pagers but 4 per player
    local numPagersPerPlayer = math.min(numPagers, getNumPagersPerPlayer())
    local difficultyBonus = 0;
    local parPagers

    --par for pagers is 2 when stealth kills are enabled, otherwise 
    --it is the default of 4.
    if isStealthKillEnabled() then
        parPagers = 2
    else
        parPagers = 4
    end
    -- 2% bonus for each pager below 2
    difficultyBonus = difficultyBonus + ((parPagers - numPagers) * .02)
    -- 1% bonus for each pager per player below the number of total pagers
    difficultyBonus = difficultyBonus + ((numPagers - numPagersPerPlayer) * .01)
    --log ("difficulty bonus is " .. tostring(difficultyBonus))

    --you also get a 1% bonus for each pager you had but didn't use
    local missionBonus
    --it seems like this gets called when someone joins a stealth lobby  In
    --that case groupai is undefined.  So try this hack.
    if managers.groupai and managers.groupai:state() then
        missionBonus = (numPagers - managers.groupai:state():get_nr_successful_alarm_pager_bluffs()) * .01
    else
        missionBonus = numPagers
    end
    --log ("mission bonus is " .. tostring(missionBonus))

    --and if you personally didn't use a pager at all, you get a 2% bonus
    local playerBonus
    if getLocalPagersAnswered() == 0 then
        playerBonus = .02
    else
        playerBonus = 0
    end

    --log("Player bonus is " .. tostring(playerBonus))

    local bonus = difficultyBonus + missionBonus + playerBonus
    --log("Level bonus is " .. tostring(bonus))
    return bonus
end

--Load locatization strings
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_SilentAssassin", function(loc)
    --More or less cribbed from WolfHUD
    --Detect ChnMod to select chinese (simplified) locale
    local lang
    for _, mod in pairs(BLT and BLT.Mods:Mods() or {}) do
        if mod:GetName() == "ChnMod" and mod:IsEnabled() then
            lang = "zh-cn"
        end
    end

    if not lang then
        for _, filename in pairs(file.GetFiles(SilentAssassin._loc_path )) do
            local str = filename:match('^(.*).json$')
            if str and Idstring(str) and Idstring(str):key() == SystemInfo:language():key() then
                lang = str
                break
            end
        end
    end

    if not lang then
        lang = "english"
    end

    --check to see if the locale file for the language exists.  If so, use it.
    --otherwise, default to English
    local path = SilentAssassin._loc_path .. lang .. ".json"
    --log("checking " .. path)
    if io.file_is_readable(path) then
        --log("loading " .. path)
        loc:load_localization_file(path)
    else
        --log("defaulting to english")
        loc:load_localization_file(SilentAssassin._loc_path.."english.json")
    end
end)

--Set up the menu
Hooks:Add("MenuManagerInitialize", "MenuManagerInitialize_SilentAssassin", function(menu_manager)
    MenuCallbackHandler.SilentAssassin_setNumPagers = setNumPagers
    MenuCallbackHandler.SilentAssassin_setNumPagersPerPlayer = setNumPagersPerPlayer
    MenuCallbackHandler.SilentAssassin_enabledToggle = setEnabled
    MenuCallbackHandler.SilentAssassin_killPagerEnabledToggle = setStealthKillEnabled
    MenuCallbackHandler.SilentAssassin_enablePagerBonusToggle = setEnablePagerBonusToggle
    MenuCallbackHandler.SilentAssassin_setMatchmakingFilter = setMatchmakingFilter
    MenuCallbackHandler.SilentAssassin_setPagerDetectionThreshold = setPagerDetectionThreshold

    MenuCallbackHandler.SilentAssassin_Close = function(this)
        SilentAssassin:Save()
    end

    SilentAssassin:Load()
    MenuHelper:LoadFromJsonFile(SilentAssassin._path.."options.txt", SilentAssassin, SilentAssassin:getCompleteTable())
end)

-- gets the number of pagers, triggering a load if necessary.  Called
-- by clients
function getNumPagers()
    if not SilentAssassin.settings["num_pagers"] then
        SilentAssassin:Load()
    end
    return SilentAssassin.settings["num_pagers"]
end

function getNumPagersPerPlayer()
    if not SilentAssassin.settings["num_pagers_per_player"] then
        SilentAssassin:Load()
    end
    return SilentAssassin.settings["num_pagers_per_player"]
end

function getEffectiveNumPagersPerPlayer()
    local numPerPlayer = getNumPagersPerPlayer()
    local numPagers = getNumPagers()
    local numPlayers = managers.network:session():amount_of_players()

    --If we're set to 2 pagers total, 1 per player, but there is only one
    --player, then effectively we're set to 1 pager.  But it's a pain to
    --keep changing settings based on number of players.  So set this to be
    --the larger of
    --
    --  The number of pagers per player
    --  the number of pagers total / number of players, rounded up
    --
    --log("numPerPlayer " .. tostring(numPerPlayer))
    --log("numPagers " .. tostring(numPagers))
    --log("numPlayers " .. tostring(numPlayers))
    local effectivePerPlayer = math.max(numPerPlayer, math.ceil(numPagers / numPlayers))
    --log("Effective number per player is " .. tostring(effectivePerPlayer))
    return effectivePerPlayer
end

function isSAEnabled()
    if SilentAssassin.settings["enabled"] == nil then
        SilentAssassin:Load()
    end
    return SilentAssassin.settings["enabled"]
end

function isStealthKillEnabled()
    if not SilentAssassin.settings["stealth_kill_enabled"] == nil then
        SilentAssassin:Load()
    end
    return SilentAssassin.settings["stealth_kill_enabled"]
end

function getPagerDetectionThreshold()
    if not SilentAssassin.settings["pager_detection_threshold"] == nil then
        SilentAssassin:Load()
    end
    return SilentAssassin.settings["pager_detection_threshold"]
end

function isPagerBonusEnabled()
    return false
    --local Net = _G.LuaNetworking
    --if Net:IsClient() then
        --return false
    --end
    --if not SilentAssassin.settings["pager_bonus_enabled"] then
        --SilentAssassin:Load()
    --end
    --return SilentAssassin.settings["pager_bonus_enabled"]

end

function getMatchmakingFilter()
    if not SilentAssassin.settings["matchmaking_filter"] then
        SilentAssassin:Load()
    end
    --log ("getMatchmakingFilter " .. tostring(SilentAssassin.settings["matchmaking_filter"]))
    return SilentAssassin.settings["matchmaking_filter"]
end


function addLocalPagerAnswered()
    --log("Answered pager locally")
    SilentAssassin.localPagersUsed = SilentAssassin.localPagersUsed + 1
end

function getLocalPagersAnswered()
    return SilentAssassin.localPagersUsed
end

-------------------------------------------------
--  Handler for damaged received
-------------------------------------------------

if RequiredScript == "lib/units/enemies/cop/copbrain" then
    if not _CopBrain_clbk_damage then
        _CopBrain_clbk_damage = CopBrain._clbk_damage
    end

    function CopBrain:clbk_damage(my_unit, damage_info)
        --log ("CopBrain:clbk_damage")
        if _CopBrain_clbk_damage then 
            --this seems to get called on damage but not on death
            --So if we take any non-fatal damage, the pager will go off
            --log ("non-fatal damage")
            self._cop_pager_ready = true
            _CopBrain_clbk_damage(self, my_unit, damage_info)
            --log ("made parent callback")
        end
    end

    if not _CopBrain_clbk_death then
        _CopBrain_clbk_death = CopBrain.clbk_death
    end
    function CopBrain:clbk_death(my_unit, damage_info)
        --log ("clbk_death")
        if managers.groupai:state():whisper_mode() then 
            --for i, key in pairs(self._logic_data.detected_attention_objects) do
                --log("value is " .. tostring(i) .. ", " .. tostring(key))
                --for f, s in pairs(key) do
                    --log("inner is " .. tostring(f) .. ", " .. tostring(s))
                --end
            --end
            --log ("clbk_death2")
            if isSAEnabled() and isStealthKillEnabled() then


                local head
            --log ("damage_info is " .. json.encode(damage_info))
                if damage_info.col_ray then 
                    --the idea was to require a headshot.  It turns out that col_ray is not
                    --set when the client takes the shot so I can only do OHKs on clients.
                    --I figure to make things fair it should be OHKs for everyone
                    --head = self._unit:character_damage()._head_body_name and damage_info.col_ray.body and damage_info.col_ray.body:name() == self._unit:character_damage()._ids_head_body_name
                    head = true
                else
                    --OHK keeps the pager from going ff
                    head = true
                end
                if not head then
                    --log ("enabling pager")
                    --not headshots will cause the pager to go off
                    self._cop_pager_ready = true
                end

                local notice_progress = 0;
                if self._logic_data.detected_attention_objects then
                    for key, obj in pairs(self._logic_data.detected_attention_objects) do
                        if obj.notice_progress then
                            notice_progress = math.max(notice_progress, obj.notice_progress)
                        end
                    end
                end
                --log("notice progress was " .. tostring(notice_progress))
                if notice_progress > getPagerDetectionThreshold() then
                    --log("notice was too high")
                    self._cop_pager_ready = true
                end
                --if self._cop_pager_ready then
                    --log("_cop_pager_ready is true")
                --end

                --log(tostring(self._unit:movement():stance_name()))
                --if self._unit:movement():cool() then
                    --log("unit is cool")
                --end

                --cool() doesn't work for the camera operator on First World Bank.  For
                --some reason he's in stance "cbt" (and therefore uncool) even if he's not
                --alerted.  I figure this is a bug in the map.
            --ignore the above comment.  They fixed that bug.  Hopefully it stays that way.
            --log("unit is " .. json.encode(self._logic_data))
                if not self._cop_pager_ready and self._unit:movement():cool() then
                --if not self._cop_pager_ready and self._unit:movement():stance_name() ~= "hos" then
                    --we're dead and the pager is not ready, so delete it
                    --log ("pager disabled")
                    self._unit:unit_data().has_alarm_pager = false
                end
            end
        end
        --log("clbk_death parent")
        _CopBrain_clbk_death(self, my_unit, damage_info)
    end

-------------------------------------------------
--  Setting number of pagers
-------------------------------------------------

    --This is called when a player interacts with a pager.  Swap in the
    --correct table before actually running the pager interaction
elseif RequiredScript == "lib/units/interactions/interactionext" then
    if not _IntimitateInteractionExt_at_interact_start then
        _IntimitateInteractionExt_at_interact_start = IntimitateInteractionExt._at_interact_start
    end
    function IntimitateInteractionExt:_at_interact_start(player, timer)
        --log("at_interact_start")
        if managers.groupai:state():whisper_mode() then 
        --This is eventually going to call CopBrain.on_alarm_pager_interaction.
        --However, it doesn't pass in the player.  So, if we are going to do
        --that, set up the alarm_pager tables here
            if self.tweak_data == "corpse_alarm_pager" then
                --log("corpse_alarm_pager matches")
                if Network:is_server() then
                    --log("is server")
                    if not self._in_progress then 
                        --This is where the pager really runs
                        local bluffChance = {}
                        local numPagers;
                        numPagers = getNumPagers()

                        --Track the number of pagers a player has answered in the
                        --player object
                        if not player:base().num_answered then
                            player:base().num_answered = 0
                        end

                        --log("NumAnswered" .. tostring(player:base().num_answered))

                        --If this player can answer a pager, write up to
                        --getEffectiveNumPagersPerPlayer() 1's into the table,
                        --otherwise write all 0's.  This way the real
                        --on_alarm_pager_interaction will index into the table as
                        --normal
                        player:base().num_answered = player:base().num_answered + 1
                        local tableValue
                        if player:base().num_answered <= getEffectiveNumPagersPerPlayer() then
                            tableValue = 1
                        else
                            tableValue = 0
                        end
                        --log("tableValue is " .. tostring(tableValue))
                        for i = 0, ( numPagers - 1), 1 do
                            table.insert(bluffChance, tableValue)
                        end
                        table.insert(bluffChance, 0)

                        tweak_data.player.alarm_pager["bluff_success_chance"] = bluffChance
                        tweak_data.player.alarm_pager["bluff_success_chance_w_skill"] = bluffChance
                        if player:base().is_local_player then
                            addLocalPagerAnswered()
                        end
                    end
                end
            end
        end
        _IntimitateInteractionExt_at_interact_start(self, player, timer)
    end

elseif RequiredScript == "lib/managers/crimespreemanager" then
    -- This is the last function that is called by NetworkMatchMakingSTEAM:set_attributes before calling
    -- self.lobby_handler:set_lobby_data, which is what ultimately gets sent to Steam when creating a
    -- lobby.  I can hide anything I want in this table and I'll see it in the client in
    -- NetworkMatchMakingSTEAM:_lobby_to_numbers.
    if not _CrimeSpreeManager_apply_matchmake_attributes then 
        _CrimeSpreeManager_apply_matchmake_attributes = CrimeSpreeManager.apply_matchmake_attributes
    end
    function CrimeSpreeManager.apply_matchmake_attributes(self, lobby_attributes)
        _CrimeSpreeManager_apply_matchmake_attributes(self, lobby_attributes)
        if isSAEnabled() then
            lobby_attributes.silent_assassin = 1
        end
        --log("apply_matchmake_attributes returns " .. json.encode(lobby_attributes))
    end

elseif RequiredScript == "lib/network/matchmaking/networkmatchmakingsteam" then
    if not _NetworkMatchMakingSTEAM_search_lobby then
        _NetworkMatchMakingSTEAM_search_lobby = NetworkMatchMakingSTEAM.search_lobby
    end

--This is a clone of the search_lobby function from the real code.  Current as
--of U154
    function NetworkMatchMakingSTEAM.search_lobby(self, friends_only, no_filters)
        -- *****************************************************************
        -- Attention Idiot.  Next time you update this code, make sure to grab
        -- all three of the Start SA segments and transfer them to the new
        -- version.
        -- *****************************************************************

        --Start SA
        --This mod is incompatible with Snh20's Crime Spree Rank Spread Filter
        --Fix because they both override search_lobby without delegating to
        --the real search_filter.  If you set the filter to "any" then we'll
        --delegate to the "real" search_lobby.  This will also serve as a
        --workaround if Overkill changes the body of this function
        --Also, SA needs a higher priority than CSRSF.
        local saMMFilter = getMatchmakingFilter();
        if saMMFilter == 1 then
            --log ("delegating to real search_lobby")
            _NetworkMatchMakingSTEAM_search_lobby(self, friends_only, no_filters)
            return
        end
        --End SA

        --log ("Running SA version of search_lobby")
	self._search_friends_only = friends_only

	if not self:_has_callback("search_lobby") then
		return
	end


	-- Lines: 425 to 426
	local function is_key_valid(key)
		return key ~= "value_missing" and key ~= "value_pending"
	end

	if friends_only then
		self:get_friends_lobbies()
	else

		-- Lines: 434 to 481
		local function refresh_lobby()
			if not self.browser then
				return
			end

			local lobbies = self.browser:lobbies()
			local info = {
				room_list = {},
				attribute_list = {}
			}

			if lobbies then
				for _, lobby in ipairs(lobbies) do
					if self._difficulty_filter == 0 or self._difficulty_filter == tonumber(lobby:key_value("difficulty")) then
						table.insert(info.room_list, {
							owner_id = lobby:key_value("owner_id"),
							owner_name = lobby:key_value("owner_name"),
							room_id = lobby:id(),
							owner_level = lobby:key_value("owner_level")
						})

						local attributes_data = {
							numbers = self:_lobby_to_numbers(lobby),
							mutators = self:_get_mutators_from_lobby(lobby)
						}
						local crime_spree_key = lobby:key_value("crime_spree")

						if is_key_valid(crime_spree_key) then
							attributes_data.crime_spree = tonumber(crime_spree_key)
							attributes_data.crime_spree_mission = lobby:key_value("crime_spree_mission")
						end

						local mods_key = lobby:key_value("mods")

						if is_key_valid(mods_key) then
							attributes_data.mods = mods_key
						end

						table.insert(info.attribute_list, attributes_data)
					end
				end
			end

			self:_call_callback("search_lobby", info)
		end

		self.browser = LobbyBrowser(refresh_lobby, function ()
		end)
		local interest_keys = {
			"owner_id",
			"owner_name",
			"level",
			"difficulty",
			"permission",
			"state",
			"num_players",
			"drop_in",
			"min_level",
			"kick_option",
			"job_class_min",
			"job_class_max",
			"allow_mods"
		}

		if self._BUILD_SEARCH_INTEREST_KEY then
			table.insert(interest_keys, self._BUILD_SEARCH_INTEREST_KEY)
		end

        --Start SA
        --For some reason I can't add the interest key for avoid
        --My guess is that it requires this to have some value or
        --Steam's browser won't return it.
        if saMMFilter == 2 then
            --log("Adding silent_assassin key")
            table.insert(interest_keys, "silent_assassin")
        end
        --End SA

		self.browser:set_interest_keys(interest_keys)
		self.browser:set_distance_filter(self._distance_filter)

		local use_filters = not no_filters

		if Global.game_settings.gamemode_filter == GamemodeCrimeSpree.id then
			use_filters = false
		end

		self.browser:set_lobby_filter(self._BUILD_SEARCH_INTEREST_KEY, "true", "equal")

		local filter_value, filter_type = self:get_modded_lobby_filter()

		self.browser:set_lobby_filter("mods", filter_value, filter_type)

		local filter_value, filter_type = self:get_allow_mods_filter()

		self.browser:set_lobby_filter("allow_mods", filter_value, filter_type)

		if use_filters then
			self.browser:set_lobby_filter("min_level", managers.experience:current_level(), "equalto_less_than")

			if Global.game_settings.search_appropriate_jobs then
				local min_ply_jc = managers.job:get_min_jc_for_player()
				local max_ply_jc = managers.job:get_max_jc_for_player()

				self.browser:set_lobby_filter("job_class_min", min_ply_jc, "equalto_or_greater_than")
				self.browser:set_lobby_filter("job_class_max", max_ply_jc, "equalto_less_than")
			end
		end

		if not no_filters then
			if Global.game_settings.gamemode_filter == GamemodeCrimeSpree.id then
				local min_level = 0

				if Global.game_settings.crime_spree_max_lobby_diff >= 0 then
					min_level = managers.crime_spree:spree_level() - (Global.game_settings.crime_spree_max_lobby_diff or 0)
					min_level = math.max(min_level, 0)
				end

				self.browser:set_lobby_filter("crime_spree", min_level, "equalto_or_greater_than")
			elseif Global.game_settings.gamemode_filter == GamemodeStandard.id then
				self.browser:set_lobby_filter("crime_spree", -1, "equalto_less_than")
			end
		end

		if use_filters then
			for key, data in pairs(self._lobby_filters) do
				if data.value and data.value ~= -1 then
					self.browser:set_lobby_filter(data.key, data.value, data.comparision_type)
					print(data.key, data.value, data.comparision_type)
				end
			end
		end

		self.browser:set_max_lobby_return_count(self._lobby_return_count)

        --Start SA
        --log("Adding search_lobby SA filter")
        local filter = getMatchmakingFilter();
        -- 1 -> any (no filter)
        -- 2 -> require
        -- 3 -> avoid
        if filter == 2 then
            self.browser:set_lobby_filter("silent_assassin", 1, "equal")
            --log("Adding search_lobby SA filter (require)")
        elseif filter == 3 then
            self.browser:set_lobby_filter("silent_assassin", 1, "not_equal")
            --log("Adding search_lobby SA filter (avoid)")
        else
            --log("Adding search_lobby SA filter (any)")
        end
        --End SA

		if Global.game_settings.playing_lan then
			self.browser:refresh_lan()
		else
			self.browser:refresh()
		end
	end
	
    end


    if not _NetworkMatchMakingSTEAM__lobby_to_numbers then
        _NetworkMatchMakingSTEAM__lobby_to_numbers = NetworkMatchMakingSTEAM._lobby_to_numbers
    end
    function NetworkMatchMakingSTEAM._lobby_to_numbers(self, lobby)
        local numbers = _NetworkMatchMakingSTEAM__lobby_to_numbers(self, lobby)
        local version = lobby:key_value("silent_assassin")
        --log("_lobby_to_numbers silent_assassin = " .. tostring(version))
        return numbers
    end

 
elseif RequiredScript == "lib/managers/jobmanager" then
    if not _JobManager_current_stage_data then
        _JobManager_current_stage_data = JobManager.current_stage_data
    end
    function JobManager.current_stage_data(self)
        if isSAEnabled() and isPagerBonusEnabled() then 
            return modifyGhostBonus(self, _JobManager_current_stage_data(self))
        else
            return _JobManager_current_stage_data(self)
        end
    end

    if not _JobManager_current_level_data then
        _JobManager_current_level_data = JobManager.current_level_data
    end

    function JobManager.current_level_data(self)
        if isSAEnabled() and isPagerBonusEnabled() then
            return modifyGhostBonus(self, _JobManager_current_level_data(self))
        else
            return _JobManager_current_level_data(self)
        end
    end

    function modifyGhostBonus(self, level_data)
        --when the level is completed, modify the ghost_bonus of the stage.
        --This is called from JobManager.accumulate_ghost_bonus, which sets the
        --stealth bonus
        if level_data and level_data.ghost_bonus then
            local new_data = {}
            for k, v in pairs(level_data) do
                if k == "ghost_bonus" then
                    local bonus
                    if JobManager.on_last_stage(self) then
                        bonus = calculateLevelStealthBonus()
                    else
                        bonus = calculateStageStealthBonus()
                    end
                    --make sure the total stealth bonus is never negative
                    new_data[k] = math.clamp(v + bonus, 0, 1)
                else
                    new_data[k] = v
                end
            end

            return new_data
        end
        return level_data
    end
end

function CreateSALobbyMessage()
        local message = managers.localization:text("sa_lobby_notice_1")
        if isStealthKillEnabled() then
            message = message .. managers.localization:text("sa_lobby_notice_2")
        end
            
        local params = {
            num_pagers = getNumPagers(),
            num_per_player = getNumPagersPerPlayer(),
            pager_detection_threshold_pct = getPagerDetectionThreshold() * 100
        }
        message = message .. managers.localization:text("sa_lobby_notice_3", params)
        return message
end

Hooks:Add("NetworkManagerOnPeerAdded", "NetworkManagerOnPeerAdded_SA", function(peer, peer_id)
    if Network:is_server() and isSAEnabled() then

        DelayedCalls:Add("DelayedSAAnnounce" .. tostring(peer_id), 2, function()

            local message = CreateSALobbyMessage()
            local peer2 = managers.network:session() and managers.network:session():peer(peer_id)
            if peer2 then
                peer2:send("send_chat_message", ChatManager.GAME, message)
            end
        end)
    end
end)

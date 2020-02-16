local Class = _G.StopwatchMod.Attempt
local Mod = _G.StopwatchMod.Mod
local LuaNetwork = _G.LuaNetworking

function Class.createAttempt(objective)
    local mod_info = ""
    local objective_id = ""
    if _G.SilentAssassin and _G.SilentAssassin.settings["enabled"] then mod_info = mod_info .. "SA;" end
    if objective and objective.id then
        objective_id = objective.id
    end

    local attempt = {
        level_id = managers.job:current_level_id(),
        objective_id = objective_id,
        parameter = {
            gamemode = Global.game_settings.gamemode,
            difficulty = managers.job:current_difficulty_stars(),
            one_down = Global.game_settings.one_down,
            ai_enabled = Global.game_settings.team_ai_option,
            peer_count = LuaNetwork:GetNumberOfPeers(),
            mod_info = mod_info
        },
        info = {
            needed_time = math.floor(managers.game_play_central:get_heist_timer()),
            by_username = managers.network.account:username_id(),
        }
    }

    return attempt
end

function Class:shareAttempt(attempt)
    local attempt_json = json.encode(self:compactAttempt(attempt))
    local message_length = string.len(Mod.MESSAGE.SHARE_ATTEMPT .. attempt_json) + 1

    if message_length >= Mod.MAX_MESSAGE_LENGTH then
        error("message is too long (" .. tostring(message_length) .. " chars) and won't be send")
    else
        LuaNetwork:SendToPeers(Mod.MESSAGE.SHARE_ATTEMPT, attempt_json)
    end
end

function Class:compactAttempt(attempt)
    assert(type(attempt) == "table", "variable 'attempt' is not a table")

    return {
        l = attempt.level_id,
        o = attempt.objective_id,
        p = self.compactParameter(attempt.parameter),
        i = self.compactInfo(attempt.info)
    }
end

function Class.compactParameter(parameter)
    assert(type(parameter) == "table", "variable 'parameter' is not a table")

    return {
        gm = parameter.gamemode,
        di = parameter.difficulty,
        od = parameter.one_down,
        pc = parameter.peer_count,
        ai = parameter.ai_enabled,
        mi = parameter.mod_info
    }
end

function Class.compactInfo(info)
    assert(type(info) == "table", "variable 'info' is not a table")

    return {
        ti = info.needed_time,
        by = info.by_username
    }
end

function Class:expandAttempt(compact_attempt)
    assert(type(compact_attempt) == "table", "compact_attempt is not a table")

    return {
        level_id = compact_attempt.l,
        objective_id = compact_attempt.o,
        parameter = self.expandParameter(compact_attempt.p),
        info = self.expandInfo(compact_attempt.i)
    }
end

function Class.expandParameter(compact_parameter)
    assert(type(compact_parameter) == "table", "variable 'compact_parameter' is not a table")

    return {
        gamemode = compact_parameter.gm,
        difficulty = compact_parameter.di,
        one_down = compact_parameter.od,
        peer_count = compact_parameter.pc,
        ai_enabled = compact_parameter.ai,
        mod_info = compact_parameter.mi
    }
end

function Class.expandInfo(compact_info)
    assert(type(compact_info) == "table", "variable 'compact_info' is not a table")

    return {
        needed_time = compact_info.ti,
        by_username = compact_info.by
    }
end
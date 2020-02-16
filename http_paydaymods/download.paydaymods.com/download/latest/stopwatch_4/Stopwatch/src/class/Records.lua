local Class = _G.StopwatchMod.Records
local Util = _G.StopwatchMod.Util
local Mod = _G.StopwatchMod.Mod
local Settings = _G.StopwatchMod.Settings
local Attempt = _G.StopwatchMod.Attempt

Class.RECORDS_FILE = SavePath .. "StopwatchRecords.json"

Class.records = {}
Class.pending_records = {}

function Class:completeObjective(objective)
    local attempt = Attempt.createAttempt(objective)
    Attempt:shareAttempt(attempt)
    self:checkAttempt(attempt)
end

function Class:completeLevel()
    local attempt = Attempt.createAttempt()
    Attempt:shareAttempt(attempt)
    self:checkAttempt(attempt)
end

function Class:checkAttempt(attempt)
    local objective_text, record, alltime_record, prefix, message, color

    if attempt.objective_id ~= "" then
        if managers.objectives and managers.objectives._objectives[attempt.objective_id]
        and managers.objectives._objectives[attempt.objective_id].text then
            objective_text = Util.shorten(managers.objectives._objectives[attempt.objective_id].text, 42)
        else
            objective_text = "unknown objective"
        end
    else
        objective_text = Util.localize("stopwatch_chat_level_done")
    end

    record = self:getRecord(attempt)
    alltime_record = self:getAlltimeRecord(attempt)
    if record then
        if record.info.needed_time < attempt.info.needed_time then
            prefix = "+"
			color = Mod.COLORS[Settings:get("old_record_color")]
        elseif record.info.needed_time > attempt.info.needed_time then
            prefix = "-"
            color = Mod.COLORS[Settings:get("new_record_color")]
            self:addPendingRecord(attempt)
        else
            prefix = "="
			color = Mod.COLORS[Settings:get("equal_record_color")]
        end
		prefix = prefix .. Util.formatTime(math.abs(record.info.needed_time - attempt.info.needed_time))
		message = "R=" .. Util.formatTime(record.info.needed_time)
    else
        prefix = "_"
        color = Mod.COLORS[Settings:get("init_record_color")]
		message = "R=" .. Util.formatTime(attempt.info.needed_time)
        self:addPendingRecord(attempt)
    end
    if alltime_record then
        message = message .. " AT=" .. Util.formatTime(alltime_record.info.needed_time)
    end
    message = message .. " " .. objective_text

    if not Settings:get("disable_chat") then
        Util.localChatMessage("[" .. prefix .. "]", message, color)
    end

    if attempt.objective_id == "" then
        self:savePending()
    end
end

function Class:getRecord(attempt)
    local equal_parameters

    if self.records[attempt.level_id] then
        if self.records[attempt.level_id][attempt.objective_id] then
            for i, record in ipairs(self.records[attempt.level_id][attempt.objective_id]) do
                equal_parameters = true
                for key in pairs(attempt.parameter) do
                    if record.parameter[key] ~= attempt.parameter[key] then
                        equal_parameters = false
                    end
                end
                if equal_parameters then
                    return record, i
                end
            end
        end
    end
    return nil, nil
end

function Class:getAlltimeRecord(attempt)
    local best_record = nil

    if self.records[attempt.level_id] then
        if self.records[attempt.level_id][attempt.objective_id] then
            for _, record in ipairs(self.records[attempt.level_id][attempt.objective_id]) do
                if not best_record or record.info.needed_time < best_record.info.needed_time then
                    best_record = record
                end
            end
        end
    end

    return best_record
end

function Class:addRecord(attempt)
    local parameter = {}
    local info = {}

    for key, value in pairs(attempt.parameter) do
        parameter[key] = value
    end
    for key, value in pairs(attempt.info) do
        info[key] = value
    end

    if not self.records[attempt.level_id] then
        self.records[attempt.level_id] = {}
    end
    if not self.records[attempt.level_id][attempt.objective_id] then
        self.records[attempt.level_id][attempt.objective_id] = {}
    end

    table.insert(self.records[attempt.level_id][attempt.objective_id], {
        parameter = parameter,
        info = info
    })
end

function Class:removeRecord(attempt, index)
    table.remove(self.records[attempt.level_id][attempt.objective_id], index)
end

function Class:addPendingRecord(attempt)
    table.insert(self.pending_records, attempt)
end

function Class:savePending()
    local record, index
    local pending_records_count = table.getn(self.pending_records)

    if pending_records_count > 0 then
        Util.log("Saving pending records (record count: " .. pending_records_count .. ")")

        for _, attempt in ipairs(self.pending_records) do
            record, index = self:getRecord(attempt)
            if record then
                self:removeRecord(attempt, index)
            end
            self:addRecord(attempt)
        end
    else
        Util.log("Saving pending records (nothing to save)")
    end

    self:clearPending()
    self:store()
end

function Class:clearPending()
    Util.log("Clearing pending records ")
    self.pending_records = {}
end

function Class:reset()
    Util.log("Resetting all records")
    self.records = {}
end

function Class:load()
    Util.log("Loading records from '" .. self.RECORDS_FILE .. "'")

    local compact_records = {}
	local file = io.open(self.RECORDS_FILE, "r")
	if file then
		compact_records = json.decode(file:read("*all"))
		file:close()
    end

    local record_count, objective_count, level_count = 0, 0, 0
    for level_id, objectives in pairs(compact_records) do
        level_count = level_count + 1
        for objective_id, records in pairs(objectives) do
            objective_count = objective_count + 1
            record_count = record_count + #records
            for _, record in ipairs(records) do
                if not self.records[level_id] then
                    self.records[level_id] = {}
                end
                if not self.records[level_id][objective_id] then
                    self.records[level_id][objective_id] = {}
                end
                table.insert(self.records[level_id][objective_id], {
                    info = Attempt.expandInfo(record.i),
                    parameter = Attempt.expandParameter(record.p)
                })
            end
        end
    end
    Util.log("Loaded " .. record_count .. " records ("
        .. objective_count .. " objectives; " .. level_count .. " levels)")
end

function Class:store()
    Util.log("Storing records to '" .. self.RECORDS_FILE .. "'")

    local compact_records = {}
    for level_id, objectives in pairs(self.records) do
        for objective_id, records in pairs(objectives) do
            for _, record in ipairs(records) do
                if not compact_records[level_id] then
                    compact_records[level_id] = {}
                end
                if not compact_records[level_id][objective_id] then
                    compact_records[level_id][objective_id] = {}
                end
                table.insert(compact_records[level_id][objective_id], {
                    i = Attempt.compactInfo(record.info),
                    p = Attempt.compactParameter(record.parameter)
                })
            end
        end
    end

	local file = io.open(self.RECORDS_FILE, "w+")
	if file then
		file:write(json.encode(compact_records))
		file:close()
	end
end
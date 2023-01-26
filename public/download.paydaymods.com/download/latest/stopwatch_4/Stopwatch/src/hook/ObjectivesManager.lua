local Util = _G.StopwatchMod.Util
local Settings = _G.StopwatchMod.Settings
local Records = _G.StopwatchMod.Records

Hooks:PostHook(ObjectivesManager, "activate_objective", "Stopwatch_ObjectivesManager_Post_activate_objective",
    function(ply, id)
        if Settings:get("is_active") and Network:is_server() then
            local objective = ply["_objectives"][id]

            objective.stopwatch = {
                completed = false,
                amount = nil
            }

            Util.log("Activated Objective '" .. objective.id .. "'")
        end
    end
)

Hooks:PreHook(ObjectivesManager, "complete_objective", "Stopwatch_ObjectivesManager_Pre_complete_objective",
    function(ply, id)
        if Settings:get("is_active") and Network:is_server() then
            local objective = ply["_objectives"][id]
            local objective_info = objective.stopwatch

            if objective_info and objective.amount then
                if not objective_info.amount or objective_info.amount ~= -1 then
                    objective_info.amount = objective.current_amount
                end
            end
        end
    end
)

Hooks:PostHook(ObjectivesManager, "complete_objective", "Stopwatch_ObjectivesManager_Post_complete_objective",
    function(ply, id)
        if Settings:get("is_active") and Network:is_server() then
            local objective = ply["_objectives"][id]
            local objective_info = objective.stopwatch

            if objective_info and not objective_info.completed
            and (not objective.amount or objective.current_amount == 0
            or objective.current_amount == objective_info.amount) then
                Records:completeObjective(objective)
                objective_info.completed = true
                Util.log("Completed Objective '" .. objective.id .. "'")
            end
        end
    end
)

Hooks:PostHook(ObjectivesManager, "remove_objective", "Stopwatch_ObjectivesManager_Post_remove_objective",
    function(ply, id)
        if Settings:get("is_active") and Network:is_server() then
            local objective = ply["_objectives"][id]
            local objective_info = objective.stopwatch

            if objective_info and not objective_info.completed then
                Records:completeObjective(objective)
                objective_info.completed = true
                Util.log("Removed (completed) Objective '" .. objective.id .. "'")
            end
        end
    end
)
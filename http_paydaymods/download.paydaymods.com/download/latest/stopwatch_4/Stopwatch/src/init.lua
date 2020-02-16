if not _G.StopwatchMod then
    _G.StopwatchMod = {}
    _G.StopwatchMod.Debug = false

    local classes = {
        "Mod",
        "Util",
        "Settings",
        "Attempt",
        "Records"
    }

    for _, class in ipairs(classes) do
        _G.StopwatchMod[class] = {}
        dofile(ModPath .. "/src/class/" .. class .. ".lua")
    end

    local Settings = _G.StopwatchMod.Settings
    local Util = _G.StopwatchMod.Util
    local Records = _G.StopwatchMod.Records

    local debug_file = io.open(ModPath .. "/debug", "r")
    if debug_file ~= nil then
        io.close(debug_file)
        _G.StopwatchMod.Debug = true
        Util.log("Enabled Debugging Mode")
    end

    Settings:load()
    Records:load()

    Util.log("Initialized", true)
end
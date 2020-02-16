local Class = _G.StopwatchMod.Settings
local Mod = _G.StopwatchMod.Mod
local Util = _G.StopwatchMod.Util

Class.SETTINGS_FILE = SavePath .. "StopwatchSettings.json"

Class.data = {}

function Class:get(key)
    if self.data[key] ~= nil then
        return self.data[key]
    end
    return nil
end

function Class:set(key, value)
    self.data[key] = value
end

function Class:load()
    Util.log("Loading settings from '" .. self.SETTINGS_FILE .. "'")
    local file = io.open(self.SETTINGS_FILE, "r")
    local default_settings = self.getDefaultSettings()
    local missing_setting = false

    if file then
        self.data = json.decode(file:read("*all"))
        file:close()

        for setting in pairs(default_settings) do
            if self.data[setting] == nil then
                Util.log("Missing setting '" .. setting .. "'")
                missing_setting = true
                self.data[setting] = default_settings[setting]
            end
        end

        if missing_setting then
            self:store()
        end
    end
end

function Class:store()
    Util.log("Storing records to '" .. self.SETTINGS_FILE .. "'")
    local file = io.open(self.SETTINGS_FILE, "w+")

    if file then
        file:write(json.encode(self.data))
        file:close()
    end
end

function Class.getDefaultSettings()
    return {
        is_active = true,
        disable_chat = false,
        init_record_color = Mod.COLOR_YELLOW,
        new_record_color = Mod.COLOR_GREEN,
        old_record_color = Mod.COLOR_ORANGE,
        equal_record_color = Mod.COLOR_PINK
    }
end
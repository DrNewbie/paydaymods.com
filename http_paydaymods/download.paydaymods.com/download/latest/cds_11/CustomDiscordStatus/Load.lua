if not Steam then return end

CustomDiscordStatus = CustomDiscordStatus or {}

if not CustomDiscordStatus._setup then
    CustomDiscordStatus._path = ModPath
    CustomDiscordStatus._data = {}
    CustomDiscordStatus._data_string = {}
    CustomDiscordStatus._data_string_path = SavePath .. "CustomDiscordStatusStrings.json"
    CustomDiscordStatus._data_path = SavePath .. "CustomDiscordStatus.json"
    CustomDiscordStatus._hooks = {
        ["lib/managers/platformmanager"] = "PlatformManager.lua",
        ["lib/managers/menumanager"] = "MenuManager.lua"
    }
    CustomDiscordStatus._menus = {
        "customdiscordstatus_options.json",
        "customdiscordstatus_core.json",
        "customdiscordstatus_room.json"
    }
    CustomDiscordStatus._language = {
        [1] = "english",
        [2] = "japanese"
    }
    CustomDiscordStatus._strings = {
        "strings_difficulty",
        "strings_character",
        "strings_day",
        "strings_heist_image",
        "strings_heist",
        "strings_level"
    }

    function CustomDiscordStatus:Save()
        local file = io.open(self._data_path, "w+")

        if file then
            file:write(json.encode(self._data))
            file:close()
        end
    end

    function CustomDiscordStatus:Load()
        self:LoadDefault()

        local file = io.open(self._data_path, "r")

        if file then
            local cfg = json.decode(file:read("*a"))
            file:close()
            for k, v in pairs(cfg) do
                self._data[k] = v
            end
        end

        self:Save()
    end

    function CustomDiscordStatus:LoadDefault()
        local default_file = io.open(self._path .. "menu/customdiscordstatus_default.json", "r")

        self._data = json.decode(default_file:read("*a"))
        default_file:close()
    end

    function CustomDiscordStatus:InitAllMenus()
        for _, json_file in pairs(self._menus) do
            MenuHelper:LoadFromJsonFile(self._path .. "menu/" .. json_file, self, self._data)
        end
    end

    function CustomDiscordStatus:SaveStrings()
        local file = io.open(self._data_string_path, "w+")

        if file then
            file:write(json.encode(self._data_string))
            file:close()
        end
    end

    function CustomDiscordStatus:LoadStrings(is_init)
        local save_file = io.open(self._data_string_path, "r")

        if not save_file or is_init then
            self:LoadDefaultStrings()
        else
            local json_data = json.decode(save_file:read("*a"))

            for f_key, v in pairs(json_data) do
                self._data_string[f_key] = {}
                for s_key, v_str in pairs(v) do
                    self._data_string[f_key][s_key] = v_str
                end
            end
        end

        if save_file then
            save_file:close()
        end

        for _, string_file in pairs(self._strings) do
            local detail = string.gsub(string_file, "^strings_", "")
            local file = io.open(self._path .. "strings/txt/" .. string_file .. ".txt", "r")
            local cfg = json.decode(file:read("*a"))

            for k, v in pairs(cfg) do
                if v ~= "" then
                    self._data_string[detail][k] = v
                end
            end

            file:close()
        end

        self:SaveStrings()
    end

    function CustomDiscordStatus:LoadDefaultStrings()
        local default_file = io.open(self._path .. "strings/strings_default.json", "r")
        local json_data = json.decode(default_file:read("*a"))

        for f_key, v in pairs(json_data) do
            self._data_string[f_key] = {}
            for s_key, v_str in pairs(v) do
                self._data_string[f_key][s_key] = v_str
            end
        end

        default_file:close()
    end

    function CustomDiscordStatus:GetOption(id)
        return self._data[id]
    end

    function CustomDiscordStatus:Session()
        return managers.network:session()
    end

    function CustomDiscordStatus:Peers()
        return self:Session():all_peers()
    end

    function CustomDiscordStatus:doScript(script)
        local baseScript = script:lower()
        if self._hooks[baseScript] then
            local file_name = self._path .. "lua/" .. self._hooks[baseScript]
            if io.file_is_readable(file_name) then
                dofile(file_name)
            else
                log("[Error] BLT could not open script '" .. file_name .. "'.")
            end
        else
            log("[Error] Unregistered script called: " .. baseScript)
        end
    end
    
    CustomDiscordStatus:Load()
    CustomDiscordStatus:LoadStrings(true)
    CustomDiscordStatus._setup = true

    log("[CustomDiscordStatus Info] CustomDiscordStatus was succeessfully loaded!")
end

if RequiredScript then
    CustomDiscordStatus:doScript(RequiredScript)
end

--[[
    TODO:
    Write realtime update - Low
]]
function Poser:GetSaveFile()
    return self.SavePath .. self.name .. "Options.txt"
end

local Options = Poser.loaded_options
function Poser:Save()
	local fileName = self:GetSaveFile()
	local file = io.open(fileName, "w+")
	file:write(json.encode(Options))
	file:close()
end

function Poser:LoadOptions()
	local file = io.open(self:GetSaveFile(), 'r')
	if file == nil then
		return
	end
	local file_contents = file:read("*all")
	local data = json.decode( file_contents )
	file:close()
	if data then
		Poser:OverwriteOptionValues(Options, data)
	end
end

function Poser:OverwriteOptionValues(OptionTable, NewOptionTable)
	for i, data in pairs(NewOptionTable) do
		if type(data) == "table" and OptionTable[i] then
			OptionTable[i] = self:OverwriteOptionValues(OptionTable[i], data)
		else
			OptionTable[i] = data
		end
	end
	return OptionTable

end
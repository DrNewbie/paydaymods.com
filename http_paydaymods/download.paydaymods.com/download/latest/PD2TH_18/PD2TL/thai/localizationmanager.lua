Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_THLoc", function(self)
	local texts = {}
	local file_names = {
		"mods/PD2TH/PD2TL/Menu_Main.lua"
	}
	for _,filename in pairs(file_names or {})do
		local fo = io.open(filename,"r")
		if fo then
			local txt = fo:read("*a")
			io.close(fo)
			if txt and type(txt) == "string" then
				local data = assert(loadstring("return {\n"..txt.."\n}"))()
				for i,v in pairs(data)do
					if v ~= "" then
						texts[i] = v
					end
				end
			end
		end
	end
	self:add_localized_strings(texts)
end)

function LocalizationManager.text( self, str, macros )

	-- log( "Localizer: " .. tostring(Localizer.__index) )
	-- log( "SystemInfo:language():key(): " )
	-- lang_mods[Idstring("german"):key()]
	-- lang_mods[Idstring("french"):key()]
	-- lang_mods[Idstring("italian"):key()]
	-- lang_mods[Idstring("spanish"):key()]
	-- lang_mods[Idstring("english"):key()]

	if self._custom_localizations[str] then
		local return_str = self._custom_localizations[str]
		self._macro_context = macros
		return_str = self:_localizer_post_process( return_str )
		self._macro_context = nil
		if macros and type(macros) == "table" then
			for k, v in pairs( macros ) do
				return_str = return_str:gsub( "$" .. k, v)
			end
		end
		return return_str
	end
	return self.orig.text(self, str, macros)

end

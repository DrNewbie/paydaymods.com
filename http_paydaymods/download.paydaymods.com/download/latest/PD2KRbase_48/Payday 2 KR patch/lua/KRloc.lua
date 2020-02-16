local subtitle_file = "mods/Payday 2 KR patch/menu/subtitle_KR.lua"
local PDTH_file = "mods/Payday 2 KR patch/menu/PDTH_KR.lua"
local blackmarket_file = "mods/Payday 2 KR patch/menu/blackmarket_KR.lua"
local menu_file = "mods/Payday 2 KR patch/menu/menu_KR.lua"
local everyelse_file = "mods/Payday 2 KR patch/menu/everyelse_KR.lua"
local cooksub_file = "mods/Payday 2 KR patch/menu/cooksub_KR.lua"
local cookhud_file = "mods/Payday 2 KR patch/menu/cookhud_KR.lua"
local updater_file = "mods/Payday 2 KR patch/menu/BLT_updater_KR.lua"
local achieve_file = "mods/Payday 2 KR patch/menu/achievements.lua"
KR_loc_table = {}

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_KRLoc", function(loc)
-- BLT 업데이터 불러오기
	local fo = assert(io.open(updater_file, "r"))
	local updater = fo:read("*all")
	fo:close()
	
	local data = assert(loadstring("return {"..updater.."}"))()
	
	for key,value in pairs(data) do
		if value ~= "" then
			KR_loc_table[key] = value
		end
	end
-- 자막 설정 확인
if PD2KR.options.PD2KR_suboff ~= true then
-- 자막 불러오기
	local fo = assert(io.open(subtitle_file, "r"))
	local subtitle = fo:read("*all")
	fo:close()
	
	local data = assert(loadstring("return {"..subtitle.."}"))()
	
	for key,value in pairs(data) do
		if value ~= "" then
			KR_loc_table[key] = value
		end
	end
------ 조리 대사 설정 확인
	if PD2KR.options.PD2KR_cookoff ~= true then
------ 조리 대사 불러오기
		local fo = assert(io.open(cooksub_file, "r"))
		local cooksub = fo:read("*all")
		fo:close()
	
		local data = assert(loadstring("return {"..cooksub.."}"))()
	
		for key,value in pairs(data) do
			if value ~= "" then
			KR_loc_table[key] = value
			end
		end
	end
end
-- 자막 온리 설정 확인
if PD2KR.options.PD2KR_subonly ~= true then
-- 기타 옵션 불러오기
---- 아이템 관련 파일
	local fo = assert(io.open(blackmarket_file, "r"))
	local blackmarket = fo:read("*all")
	fo:close()
	
	local data = assert(loadstring("return {"..blackmarket.."}"))()
	
	for key,value in pairs(data) do
		if value ~= "" then
			KR_loc_table[key] = value
		end
	end
---- 메뉴 관련 파일
	local fo = assert(io.open(menu_file, "r"))
	local menu = fo:read("*all")
	fo:close()
	
	local data = assert(loadstring("return {"..menu.."}"))()
	
	for key,value in pairs(data) do
		if value ~= "" then
			KR_loc_table[key] = value
		end
	end
---- PDTH 관련 파일
	local fo = assert(io.open(PDTH_file, "r"))
	local PDTH = fo:read("*all")
	fo:close()
	
	local data = assert(loadstring("return {"..PDTH.."}"))()
	
	for key,value in pairs(data) do
		if value ~= "" then
			KR_loc_table[key] = value
		end
	end	
---- 도전과제 정보 관련 파일
	local fo = assert(io.open(achieve_file, "r"))
	local achieve = fo:read("*all")
	fo:close()
	
	local data = assert(loadstring("return {"..achieve.."}"))()
	
	for key,value in pairs(data) do
		if value ~= "" then
			KR_loc_table[key] = value
		end
	end	
---- 기타 파일	
	local fo = assert(io.open(everyelse_file, "r"))
	local everyelse = fo:read("*all")
	fo:close()
	
	local data = assert(loadstring("return {"..everyelse.."}"))()
	
	for key,value in pairs(data) do
		if value ~= "" then
			KR_loc_table[key] = value
		end
	end
------ 조리 대사 설정 확인
	if PD2KR.options.PD2KR_cookoff ~= true then
------ 조리 대사 불러오기
		local fo = assert(io.open(cookhud_file, "r"))
		local cookhud = fo:read("*all")
		fo:close()

		local data = assert(loadstring("return {"..cookhud.."}"))()
	
		for key,value in pairs(data) do
			if value ~= "" then
				KR_loc_table[key] = value
			end
		end
	end	
end
-- 게임에 입력
	loc:add_localized_strings(KR_loc_table)

end)

function getHash(string_id)
	local hash = string.sub(tostring(Idstring(string_id)),11,-3)
	return hash
end


LocalizationManager.text = function(self, string_id, macros)
	local return_hash = getHash(string_id)

	if self._custom_localizations[return_hash] then
		string_id = return_hash
	end

	if self._custom_localizations[string_id] then
		local return_string = self._custom_localizations[string_id]
		if macros and type(macros) == "table" then
			for key, value in pairs( macros ) do
				if KR_loc_table[string_id] then
					return_string = return_string:gsub( "$" .. key .. ";", "$" .. key .. ";")
				else
					return_string = return_string:gsub( "$" .. key , value )
				end
			end
		end
		if KR_loc_table[string_id] then
			self._macro_context = macros
			return_string = self:_localizer_post_process(return_string)
			self._macro_context = nil
		end
		return return_string
	end
	return self.orig.text(self, string_id, macros)
end
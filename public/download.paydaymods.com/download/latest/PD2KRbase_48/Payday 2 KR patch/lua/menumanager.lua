_G.PD2KR = _G.PD2KR or {}  -- 기본 베이스
PD2KR._path = ModPath -- 이건 가만히 냅두고
PD2KR._data_path = SavePath .. "Payday_2_KR_patch.txt" -- Save폴더에 설정내용이 저장되는 파일과 경로 정의
PD2KR.options = {}  -- 옵션 내용을 정의한듯
PD2KR.options_menu = "PD2KR_menu"  -- 한글패치 옵션 메뉴를 정의한듯

function PD2KR:Save() -- 한글패치 옵션내용을 저장한다
	local file = io.open( self._data_path, "w+" )
	if file then
		file:write( json.encode( self.options ) )
		file:close()
	end
end

function PD2KR:Load() -- 한글패치 옵션 내용을 불러온다
	local file = io.open( self._data_path, "r" )

	if file then
		local saved = file:read("*all")
		if saved ~= "" then
			self.options = json.decode( saved )
		end
		file:close()
	end
end

if not PD2KR.setup then -- 한글패치내용을 불러온다(처음에는 무조건 nil값일테니...)
	PD2KR:Load()
	if PD2KR.options.PD2KR_suboff == nil then
		PD2KR.options.PD2KR_suboff = false
		PD2KR:Save()
	end
	if PD2KR.options.PD2KR_subonly == nil then
		PD2KR.options.PD2KR_subonly = false
		PD2KR:Save()
	end
	if PD2KR.options.PD2KR_cookoff == nil then
		PD2KR.options.PD2KR_cookoff = false
		PD2KR:Save()
	end
		PD2KR:Load()
		PD2KR.setup = true
end

Hooks:Add("LocalizationManagerPostInit", "PD2KR_loc", function(loc)  -- 한글패치 목록의 한글을 정의한다
	LocalizationManager:add_localized_strings({
	
	["PD2KR_options_title"] = "페이데이2 한글패치",
    ["PD2KR_options_desc"] = "페이데이2 한글패치를 설정합니다.",	
	
	["PD2KR_suboff_title"] = "모든 대사 영문 자막 사용",
    ["PD2KR_suboff_desc"] = "인게임에서 사용되는 모든 대사의 자막을 영문으로 교체합니다.",	
	
	["PD2KR_subonly_title"] = "자막을 제외한 나머지 전부 영문 사용",
    ["PD2KR_subonly_desc"] = "인게임 자막을 제외한 모든 문장을 영문으로 표시합니다.\n모드간 폰트 충돌로 인한 문제가 일어날 경우 이 옵션을 사용하십시오.",
	
    ["PD2KR_cookoff_title"] = "Rats/Cook Off 재료 영문 자막 사용",
    ["PD2KR_cookoff_desc"] = "Rats/Cook Off 하이스트에 사용되는 재료와 재료설명자막을 영문으로 교체합니다.",
	
  })
end)

Hooks:Add("MenuManagerSetupCustomMenus", "PD2KR_Options", function( menu_manager, nodes )
	MenuHelper:NewMenu( PD2KR.options_menu )
end)

Hooks:Add("MenuManagerPopulateCustomMenus", "PD2KR_Options", function( menu_manager, nodes )

MenuCallbackHandler.PD2KR_suboff = function(self, item)
	PD2KR.options.PD2KR_suboff = (item:value() == "on" and true or false) -- ???
	PD2KR:Save()
end
		MenuHelper:AddToggle({
		id = "PD2KR_suboff",
		title = "PD2KR_suboff_title",
		desc = "PD2KR_suboff_desc",
		callback = "PD2KR_suboff",
		icon_by_text = false,
		menu_id = PD2KR.options_menu,
		value = PD2KR.options.PD2KR_suboff,
		})
     
MenuCallbackHandler.PD2KR_cookoff = function(self, item)
	PD2KR.options.PD2KR_cookoff = (item:value() == "on" and true or false) -- ???
	PD2KR:Save()
end
		MenuHelper:AddToggle({
		id = "PD2KR_cookoff",
		title = "PD2KR_cookoff_title",
		desc = "PD2KR_cookoff_desc",
		callback = "PD2KR_cookoff",
		icon_by_text = false,
		menu_id = PD2KR.options_menu,
		value = PD2KR.options.PD2KR_cookoff,
		})
    
MenuCallbackHandler.PD2KR_subonly = function(self, item)
	PD2KR.options.PD2KR_subonly = (item:value() == "on" and true or false) -- ???
	PD2KR:Save()
end
		MenuHelper:AddToggle({
		id = "PD2KR_subonly",
		title = "PD2KR_subonly_title",
		desc = "PD2KR_subonly_desc",
		callback = "PD2KR_subonly",
		icon_by_text = false,
		menu_id = PD2KR.options_menu,
		value = PD2KR.options.PD2KR_subonly,
		})
      
end)

Hooks:Add("MenuManagerBuildCustomMenus", "PD2KR_Options", function(menu_manager, nodes)
	nodes[PD2KR.options_menu] = MenuHelper:BuildMenu( PD2KR.options_menu )
	MenuHelper:AddMenuItem( nodes["blt_options"], PD2KR.options_menu, "PD2KR_options_title", "PD2KR_options_desc", 1 )
end)
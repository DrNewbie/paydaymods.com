--[[
THIS IS NOT A BLACKLIST!
This mod is the opposite- any lobby that DOES NOT have the mods in the below list will be filtered out (hidden) from crime.net's lobby browser.
If you are looking to filter out any lobby WITH certain mods, you should use a different mod.
I have personally verified that this works with the following crimenet related mods:

crime.net performance improvement
StaleLobbyContractFix
Lobby Player Info

However, this mod should work in conjunction with any other filter mods. 

If you want to add or remove mods from the blacklist, I recommend that you get the mod "QuickKeyboardInput."


--]]
	
_G.LobbyFilterMods = LobbyFilterMods or {}
LobbyFilterMods.settings = {
	enabled = true,
	required_mods = {
--		["Payday 2 BLT"] = true,
--		["SuperBLT"] = true,
		["base"] = true, --superblt and blt both have this
		["Silent Assassin"] = false,
		["Carry Stacker Reloaded"] = false
	},
	exact_match = true,
	allow_nonmodded = false,
	case_sensitive = false,
	must_have_all = false
}
local MAX_ENTRIES_PER_PAGE = 20
local MAX_INPUT_LENGTH = 64

LobbyFilterMods.localization_en = {
	lfm_title = "LFM",
	lfm_desc = "LobbyFilterMods",
	lfm_options_title = "Crime.net Lobby Required Mod Filter",
	lfm_options_desc = "Change Crime.net Filter Settings",
	lfm_enable_title = "Master Enable",
	lfm_enable_desc = "If disabled, this mod will do nothing.",
	lfm_requireall_title = "Require all filters",
	lfm_requireall_desc = "If enabled, then the lobby must match every entry in your filter.",
	lfm_exact_title = "Exact filter string match",
	lfm_exact_desc = "If enabled, filter names must match the lobby's mod names precisely.",
	lfm_case_title = "Case-Sensitive",
	lfm_case_desc = "If enabled, filter name matching will be case-sensitive.",
	lfm_vanilla_title = "Allow unmodded lobbies",
	lfm_vanilla_desc = "If enabled, allows lobbies which do not have mods to appear on CrimeNet.",
	lfm_togglefilter_title = "Filters...",
	lfm_togglefilter_desc = "View or toggle filters",
	lfm_filter_remove_title = "Remove filter by name",
	lfm_filter_remove_desc = "Enter a filter's name to remove it.",
	lfm_filter_add_title = "Add filter by name",
	lfm_filter_add_desc = "Enter a filter's name to add it.",
	lfm_entry_enabled = "[ON]",
	lfm_entry_disabled = "[OFF]",
	lfm_next_page = "Next Page",
	lfm_prev_page = "Previous Page",
	lfm_success = "Success",
	lfm_done = "Done",
	lfm_missing_qki_title = "Error: QKI required",
	lfm_missing_qki_desc = "You must have QuickKeyboardInput installed to use this feature!",
	lfm_bad_filter_title = "Invalid name",
	lfm_bad_filter_desc = "\"MODNAME \" is not a valid name!",
	lfm_not_filtered_title = "Filter entry does not exists!",
	lfm_not_filtered_desc = "\"MODNAME\" is not on the filter list! Well, now it's EXTRA not on the filter list.",
	lfm_already_filtered_title = "Filter entry already exists!",
	lfm_already_filtered_desc = "\"MODNAME\" is already on the filter list! Filter is now set to enabled.",
	lfm_add_success = "Successfully added \"MODNAME\" to the filter list.",
	lfm_remove_success = "Successfully removed \"MODNAME\" from the filter list.",
	lfm_list_title = "View or toggle filters",
	lfm_list_desc = "Click on a filter to disable or re-enable it."
}
local function loc(s,mod_name) --2lazy4u
	local result = managers.localization:text(s)
	return mod_name and string.gsub(result,"MODNAME",tostring(mod_name)) or result
end

LobbyFilterMods._save_path = SavePath .. "LobbyFilterMods.txt"
LobbyFilterMods._path = ModPath


---------------------- Settings
function LobbyFilterMods:IsExactMatch()
	return self.settings.exact_match
end

function LobbyFilterMods:IsCaseSensitive()
	return self.settings.case_sensitive
end

function LobbyFilterMods:Enabled()
	return self.settings.enabled
end

function LobbyFilterMods:MustHaveAllMods()
	return self.settings.must_have_all
end

function LobbyFilterMods:AllowVanillaLobbies()
	return self.settings.allow_nonmodded
end

function LobbyFilterMods:GetModsList()
	return self.settings.required_mods
end

---------------------- QuickMenu stuff

function LobbyFilterMods:FilterNameDialogue(add)

	local clbk_func = add and "AddFilterEntryByName" or "RemoveFilterEntryByName"
	if not QuickKeyboardInput then 
		local error_title = loc("lfm_missing_qki_title")
		local error_desc = loc("lfm_missing_qki_desc")
		QuickMenu:new(error_title,error_desc,{{text = loc("lfm_done"),is_cancel_button = true}}):show()
		return
	end
	local default_entry = ""
	local menu_title = loc(add and "lfm_filter_add_title" or "lfm_filter_remove_title")
	local menu_desc = loc(add and "lfm_filter_add_desc" or "lfm_filter_remove_desc")
	QuickKeyboardInput:new(menu_title,menu_desc,default_entry,callback(self,self,clbk_func),MAX_INPUT_LENGTH,true)
end

function LobbyFilterMods:AddFilterEntryByName(name)
	if (not name) or name == "" or name == "1" then 
		QuickMenu:new(loc("lfm_bad_filter_title"),loc("lfm_bad_filter_desc",name),{{text = loc("lfm_done"),is_cancel_button = true}}):show()
		return
	end
	name = tostring(name)
	if self.settings.required_mods[name] then 
		QuickMenu:new(loc("lfm_already_filtered_title"),loc("lfm_already_filtered_desc",name),{{text = loc("lfm_done"),is_cancel_button = true}}):show()
	else
		QuickMenu:new(loc("lfm_success"),loc("lfm_add_success",name),{{text = loc("lfm_done"),is_cancel_button = true}}):show()
	end
	self.settings.required_mods[name] = true
	self.unsaved_data = true
--	self:Save() --performed on menu close
end

function LobbyFilterMods:RemoveFilterEntryByName(name)
	if (not name) or name == "" then 
		QuickMenu:new(loc("lfm_bad_filter_title"),loc("lfm_bad_filter_desc",name),{{text = loc("lfm_done"),is_cancel_button = true}}):show()
		return
	end
	name = tostring(name)
	if self.settings.required_mods[name] == nil then 
		QuickMenu:new(loc("lfm_not_filtered_title"),loc("lfm_not_filtered_desc",name),{{text = loc("lfm_done"),is_cancel_button = true}}):show()
	else
		QuickMenu:new(loc("lfm_success"),loc("lfm_remove_success",name),{{text = loc("lfm_done"),is_cancel_button = true}}):show()
	end
	self.settings.required_mods[name] = nil
	self.unsaved_data = true
--	self:Save() --performed on menu close
end


function LobbyFilterMods:ShowFilterList(page)
	page = page or 1
	local total_entries = 0
	for k,v in pairs(self.settings.required_mods) do 
		total_entries = total_entries + 1
	end
	
	local i = 0 --current entry index
	local total_entries_shown = 0
	local options = {}
	for string_id,enabled in pairs(self.settings.required_mods) do
		if (total_entries_shown < MAX_ENTRIES_PER_PAGE) and (i >= ((page - 1) * MAX_ENTRIES_PER_PAGE)) then 
			table.insert(options,{
				text = tostring(string_id) .. " " .. loc(enabled and "lfm_entry_enabled" or "lfm_entry_disabled"),
				callback = callback(self,self,"ToggleFilter",{id = string_id,enabled = enabled,page = page})
			})
			total_entries_shown = total_entries_shown + 1
		end
		i = i + 1
	end
	
	if total_entries - (((page - 1) * MAX_ENTRIES_PER_PAGE) + total_entries_shown) > 0 then  --broken
		table.insert(options,{
			text = loc("lfm_next_page"),
			callback = callback(self,self,"ShowFilterList",page+1)
		})
	end
	if page > 1 then 
		table.insert(options,{
			text = loc("lfm_prev_page"),
			callback = callback(self,self,"ShowFilterList",page-1)
		})
	end
	table.insert(options,{
		text = loc("lfm_done"),
		is_cancel_button = true
	})
	local menu_title = loc("lfm_list_title")
	local menu_desc = loc("lfm_list_desc")
	QuickMenu:new(menu_title,menu_desc,options):show()
end



function LobbyFilterMods:ToggleFilter(params)
	if not (params and params.id) then 
		log("LobbyFilterMods: Bad data to ToggleFilter()! Aborting menu...")
		return 	
	end
	local id = params.id
	local page = params.page
	local enabled = not self.settings.required_mods[id]
	if params.enabled ~= nil then 
		enabled = not params.enabled
	end
	self.settings.required_mods[id] = enabled
	self.unsaved_data = true
	self:ShowFilterList(page)
end


--generic mod save/options stuff

function LobbyFilterMods:Load()
	local file = io.open(self._save_path, "r")
	if (file) then
		for k, v in pairs(json.decode(file:read("*all"))) do
			self.settings[k] = v
		end
	else
		self:Save()
	end
end

function LobbyFilterMods:Save()
	local file = io.open(self._save_path,"w+")
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_lfm", function( loc )
	loc:add_localized_strings(LobbyFilterMods.localization_en)
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_lfm", function(menu_manager)
	MenuCallbackHandler.callback_lfm_enable = function(self,item)
		LobbyFilterMods.settings.enabled = item:value() == "on"
		LobbyFilterMods:Save()
	end

	MenuCallbackHandler.callback_lfm_all = function(self,item)
		LobbyFilterMods.settings.must_have_all = item:value() == "on"
		LobbyFilterMods:Save()
	end
	
	MenuCallbackHandler.callback_lfm_exact = function(self,item)
		LobbyFilterMods.settings.exact_match = item:value() == "on"
		LobbyFilterMods:Save()
	end
	
	MenuCallbackHandler.callback_lfm_case = function(self,item)
		LobbyFilterMods.settings.case_sensitive = item:value() == "on"
		LobbyFilterMods:Save()
	end
	MenuCallbackHandler.callback_lfm_vanilla = function(self,item)
		LobbyFilterMods.settings.allow_nonmodded = item:value() == "on"
		LobbyFilterMods:Save()
	end
	
	MenuCallbackHandler.callback_lfm_filter_toggle = function(self) --button: select and enable/disable from list
		LobbyFilterMods:ShowFilterList()
	end
	
	MenuCallbackHandler.callback_lfm_filter_remove = function(self) --button: select and delete from list
		LobbyFilterMods:FilterNameDialogue(false)
	end
	
	MenuCallbackHandler.callback_lfm_filter_add = function(self) --button: check for QKI, allow user input to add new entry
		LobbyFilterMods:FilterNameDialogue(true)
	end
	
	MenuCallbackHandler.callback_lfm_close = function(self)
		if LobbyFilterMods.unsaved_data then
			LobbyFilterMods.unsaved_data = false
			LobbyFilterMods:Save()
		end
	end
	
	LobbyFilterMods:Load()
	MenuHelper:LoadFromJsonFile(LobbyFilterMods._path .. "options.txt", LobbyFilterMods, LobbyFilterMods.settings)
end)

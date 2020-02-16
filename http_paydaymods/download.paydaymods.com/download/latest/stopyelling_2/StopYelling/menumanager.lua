
if not StopYelling then
	log("[StopYelling] Error: Failed to create Mod Options menu, aborting")
	return
end

if not MenuCallbackHandler then
	StopYelling.FailState = true
	log("[StopYelling] Error: MenuCallbackHandler is nil, aborting")
	return
end

if StopYelling.FailState then
	-- No point in continuing, bail out here
	return
end

local prefix = "stopyelling_"
local menu_id = prefix .. "menu_id"

-- Menu declaration
local function SetupCustomMenu(menu_manager, nodes)
	local StopYelling = _G.StopYelling
	if not StopYelling then
		log("[StopYelling] SetupCustomMenu() | Error: StopYelling is nil, aborting")
		return
	end
	if StopYelling.FailState then
		-- No point in continuing, bail out here
		return
	end

	MenuHelper:NewMenu(menu_id)
end
Hooks:Add("MenuManagerSetupCustomMenus", "StopYelling_MenuManagerSetupCustomMenus", SetupCustomMenu)

-- Menu population with controls
local function PopulateCustomMenu(menu_manager, nodes)
	local StopYelling = _G.StopYelling
	if not StopYelling then
		log("[StopYelling] PopulateCustomMenu() | Error: StopYelling is nil, aborting")
		return
	end
	if StopYelling.FailState then
		-- No point in continuing, bail out here
		return
	end

	local MenuHelper = _G.MenuHelper
	local menu = MenuHelper:GetMenu(menu_id)
	if not menu then
		StopYelling.FailState = true
		log("[StopYelling] PopulateCustomMenu() | Error: Failed to create Mod Options menu, aborting")
		return
	end

	local tweak_data = _G.tweak_data
	if not tweak_data then
		StopYelling.FailState = true
		log("[StopYelling] PopulateCustomMenu() | Error: Failed to create Mod Options menu since tweak_data is nil, aborting")
		return
	end
	tweak_data = tweak_data.criminals
	if not tweak_data then
		StopYelling.FailState = true
		log("[StopYelling] PopulateCustomMenu() | Error: Failed to create Mod Options menu since tweak_data.criminals is nil, aborting")
		return
	end
	local characters = tweak_data.characters
	if not characters or #characters < 1 then
		StopYelling.FailState = true
		log("[StopYelling] PopulateCustomMenu() | Error: Failed to create Mod Options menu since tweak_data.criminals.characters is nil, aborting")
		return
	end

	local lookup1 = StopYelling.VoiceCharacterLookup
	if lookup1 == nil then
		lookup1 = {}
		StopYelling.VoiceCharacterLookup = lookup1
	end
	local lookup2 = StopYelling.CharacterVoiceLookup
	if lookup2 == nil then
		lookup2 = {}
		StopYelling.CharacterVoiceLookup = lookup2
	end

	-- Common callback across all character toggles
	MenuCallbackHandler.StopYelling_ToggleCharacter = function(self, item)
		StopYelling.Prefs[tostring(item._parameters.name)] = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.StopYelling_ToggleAllowWhitelistedSounds = function(self, item)
		StopYelling.Prefs.AllowWhitelistedSounds = (item:value() == "on" and true or false)
	end

	MenuCallbackHandler.StopYelling_ToggleAffectDelayedSounds = function(self, item)
		StopYelling.Prefs.AffectDelayedSounds = (item:value() == "on" and true or false)
	end

	local control_config = {menu_id = menu_id}
	control_config.id = prefix .. "divider1"
	control_config.size = 15
	control_config.priority = 4
	MenuHelper:AddDivider(control_config)

	for key, __ in pairs(control_config) do
		control_config[key] = nil
	end

	do
		control_config.menu_id = menu_id
		control_config.localized = true
		local tmp = "tog_" .. prefix .. "allowwhitelistedsounds"
		control_config.id = tmp
		control_config.title = tmp .. "_title"
		control_config.desc = tmp .. "_desc"
		control_config.callback = "StopYelling_ToggleAllowWhitelistedSounds"
		control_config.priority = 3
		control_config.value = StopYelling.Prefs.AllowWhitelistedSounds
	end
	MenuHelper:AddToggle(control_config)

	for key, __ in pairs(control_config) do
		control_config[key] = nil
	end

	do
		control_config.menu_id = menu_id
		control_config.localized = true
		local tmp = "tog_" .. prefix .. "affectdelayedsounds"
		control_config.id = tmp
		control_config.title = tmp .. "_title"
		control_config.desc = tmp .. "_desc"
		control_config.callback = "StopYelling_ToggleAffectDelayedSounds"
		control_config.priority = 2
		control_config.value = StopYelling.Prefs.AffectDelayedSounds
	end
	MenuHelper:AddToggle(control_config)

	for key, __ in pairs(control_config) do
		control_config[key] = nil
	end

	control_config.menu_id = menu_id
	control_config.id = prefix .. "divider2"
	control_config.size = 10
	control_config.priority = 1
	MenuHelper:AddDivider(control_config)

	for key, __ in pairs(control_config) do
		control_config[key] = nil
	end

	local localizationmanager = managers.localization

	local name = nil
	local voice = nil
	control_config.menu_id = menu_id
	control_config.localized = false
	for index, data in ipairs(characters) do
		name = data.name
		voice = data.static_data.voice
		if name ~= nil and voice ~= nil then
			name = tostring(name)
			voice = tostring(voice)

			lookup1[voice] = name
			lookup2[name] = voice

			local localizedname = localizationmanager:text("menu_" .. name)

			-- Note: MenuCallbackHandler.StopYelling_ToggleCharacter depends upon the name specified here
			control_config.id = name
			control_config.title = localizedname
			control_config.desc = localizationmanager:text(prefix .. "character_desc", {character = localizedname})
			control_config.callback = "StopYelling_ToggleCharacter"
			control_config.priority = -index
			control_config.value = StopYelling.Prefs[name]
			MenuHelper:AddToggle(control_config)
			-- Because BLT's MenuHelper doesn't support the localize_help parameter, manually inject it into the control's
			-- parameters table after it has been added
			if menu._items_list ~= nil then
				for __, data2 in ipairs(menu._items_list) do
					local tmp = data2._parameters
					if tmp then
						if tmp.name == name then
							-- From NodeGui:_setup_item_rows()
							tmp.localize_help = false
						end
					end
				end
			end
		end
	end
end
Hooks:Add("MenuManagerPopulateCustomMenus", "StopYelling_MenuManagerPopulateCustomMenus", PopulateCustomMenu)

-- Build is a terrible name for this step, it's more of associating (linking) the menu with the hierarchy at the specified node...
local function AssociateCustomMenu(menu_manager, nodes)
	local StopYelling = _G.StopYelling
	if not StopYelling then
		log("[StopYelling] AssociateCustomMenu() | Error: StopYelling is nil, aborting")
		return
	end
	if StopYelling.FailState then
		-- No point in continuing, bail out here
		return
	end

	MenuCallbackHandler.StopYelling_SaveSettings = function(node)
		local StopYelling = _G.StopYelling
		StopYelling:Save()
		StopYelling:RecheckCriminals()
	end

	nodes[menu_id] = MenuHelper:BuildMenu(menu_id, {back_callback = "StopYelling_SaveSettings"})
	MenuHelper:AddMenuItem(nodes.blt_options or nodes.options, menu_id, prefix .. "menu_title", prefix .. "menu_desc")
end
Hooks:Add("MenuManagerBuildCustomMenus", "StopYelling_MenuManagerBuildCustomMenus", AssociateCustomMenu)

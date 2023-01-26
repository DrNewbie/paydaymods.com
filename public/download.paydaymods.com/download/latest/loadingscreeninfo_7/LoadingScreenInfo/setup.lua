
if LoadingScreenInfo_Setup_Hooked then
	return
else
	LoadingScreenInfo_Setup_Hooked = true
end

if LoadingScreenInfo_ModPath == nil then
	LoadingScreenInfo_ModPath = ModPath
end

-- Based upon TdlQ's Lobby Player Info mod's localizations loading code
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_LoadingScreenInfo", function(loc)
	local folders = {
		"main",
		-- Overriding stock game tips with corrected ones that do not mess text wrapping up
		"stocktips"
	}

	local commonpath = ""
	local format = string.format
	local PD2KR = _G.PD2KR
	local GetFiles = _G.file.GetFiles
	local Idstring = _G.Idstring
	local activelanguagekey = SystemInfo:language():key()
	for __, folder in ipairs(folders) do
		commonpath = format("%slocalizations/%s/", LoadingScreenInfo_ModPath, folder)
		if PD2KR then
			loc:load_localization_file(commonpath .. "korean.txt")
		else
			for __, filename in ipairs(GetFiles(commonpath)) do
				if Idstring(filename:match("^(.*).txt$") or ""):key() == activelanguagekey then
					loc:load_localization_file(commonpath .. filename)
					break
				end
			end
		end
		loc:load_localization_file(commonpath .. "english.txt", false)
	end
end)

local stock_tips = {
	"tip_tactical_reload",
	"tip_weapon_effecienty",
	"tip_switch_to_sidearm",
--	"tip_doctor_bag",
	"tip_ammo_bag",
	"tip_head_shot",
	"tip_secret_assignmnet",
	"tip_help_bleed_out",
	"tip_dont_shoot_civilians",
	"tip_trading_hostage",
	"tip_shoot_at_civilians",
	"tip_police_free_hostage",
	"tip_steelsight",
	"tip_melee_attack",
--	"tip_law_enforcers_as_hostages",
--	"tip_mask_off",
--	"tip_objectives",
	"tip_shoot_in_bleed_out"
}

local custom_tips = {
	"loadingscreeninfo_tip_doctorbagvsfak",
	"loadingscreeninfo_tip_tripledowned",
	"loadingscreeninfo_tip_perkdecks",
	"loadingscreeninfo_tip_deathwishpreparedness",
	"loadingscreeninfo_tip_ecmjammers",
	"loadingscreeninfo_tip_loudoutfit",
	"loadingscreeninfo_tip_loudghost",
	"loadingscreeninfo_tip_spotting",
	"loadingscreeninfo_tip_tripmines",
	"loadingscreeninfo_tip_usecover",
	"loadingscreeninfo_tip_pistolmessiah",
	"loadingscreeninfo_tip_inspirebasic",
	"loadingscreeninfo_tip_dominator",
	"loadingscreeninfo_tip_multipleweaponvariants",
	"loadingscreeninfo_tip_fovrule",
	"loadingscreeninfo_tip_dangerousregulars",
	"loadingscreeninfo_tip_cleanerdmgboost",
	"loadingscreeninfo_tip_safehouse",
	"loadingscreeninfo_tip_throwables",
	"loadingscreeninfo_tip_tacticalminesdmgboost",
	"loadingscreeninfo_tip_stealthnadegoof",
	"loadingscreeninfo_tip_tripledowned2",
	"loadingscreeninfo_tip_ecmatms",
	"loadingscreeninfo_tip_resourcebalancing",
	"loadingscreeninfo_tip_bagstealing",
	"loadingscreeninfo_tip_bagstealinggiveaway",
	"loadingscreeninfo_tip_sniperlasergiveaway",
	"loadingscreeninfo_tip_wankers"
}

local _start_loading_screen_actual = Setup._start_loading_screen
function Setup:_start_loading_screen(...)
	local Global = _G.Global
	local tweak_data = _G.tweak_data
	if Global.load_level then
		-- HACK: Injecting the Steam lobby attributes into LevelsTweakData so that the game's code embeds it into load_level_data
		-- and passes it indirectly to LevelLoadingScreenGuiScript:init() (as _G.arg). Since level_tweak_data.load_data.image is
		-- nil, the game code will fall back to "guis/textures/loading/loading_bg" anyway. Yes, it's an ugly hack, but it works
		-- around the need to mirror the game's code and keep that mirrored copy up to date (with potentially severe consequences
		-- when the two do go out of sync)
		-- Alternatively, store in a subtable of Global.level_data (thanks to Luffy for the suggestion)
		-- Remember that managers.* and tweak_data.* do not exist in the LoadingEnvironment thread (where
		-- LevelLoadingScreenGuiScript:init() is called). This means that all references to them or their fields must be looked
		-- up and preprocessed here instead, unless they are among the defaults already cloned and supplied to the function. Also,
		-- custom translations must be translated here instead since BLT's Hooks class / table does not exist at the time
		-- LevelLoadingScreenGuiScript:init() gets called
		local level_tweak_data = Global.level_data ~= nil and Global.level_data.level_id ~= nil and tweak_data.levels[Global.level_data.level_id] or nil
		if level_tweak_data ~= nil then
			if level_tweak_data.load_data == nil then
				level_tweak_data.load_data = {}
			end
			level_tweak_data.load_data.strings = {}
			local tmp = managers.job:current_contact_data()
			local contactname = tmp ~= nil and tmp.name_id
			if contactname ~= nil and contactname ~= "" then
				level_tweak_data.load_data.strings.contact_name = managers.localization:to_upper_text(contactname)
			else
				level_tweak_data.load_data.strings.contact_name = nil
			end
			tmp = managers.job:current_job_data()
			-- Contract, not contact
			local contractname = tmp ~= nil and tmp.name_id
			if contractname ~= nil and contractname ~= "" then
				if contractname == "heist_crime_spree" and contactname == "heist_contact_hoxton" then
					level_tweak_data.load_data.strings.contact_name = nil
					contractname = "cn_crime_spree"
				end
				level_tweak_data.load_data.strings.contract_name = managers.localization:to_upper_text(contractname)
			else
				level_tweak_data.load_data.strings.contract_name = nil
			end
			if tmp ~= nil and tmp.professional then
				level_tweak_data.load_data.strings.pro_job = managers.localization:to_upper_text("cn_menu_pro_job")
			else
				level_tweak_data.load_data.strings.pro_job = nil
			end
			level_tweak_data.load_data.strings.briefing = managers.localization:text(level_tweak_data.briefing_id)
			-- Custom translations that need to be looked up beforehand
			level_tweak_data.load_data.strings.server_info = managers.localization:to_upper_text("loadingscreeninfo_gameinfo")
			level_tweak_data.load_data.strings.host = managers.localization:to_upper_text("loadingscreeninfo_host")
			level_tweak_data.load_data.strings.players = managers.localization:to_upper_text("loadingscreeninfo_players")
			level_tweak_data.load_data.strings.state = managers.localization:to_upper_text("loadingscreeninfo_state")
			level_tweak_data.load_data.strings.hostlevel = managers.localization:to_upper_text("loadingscreeninfo_hostlevel")
			level_tweak_data.load_data.strings.unknown = managers.localization:to_upper_text("loadingscreeninfo_unknown")

			local random = math.random

			-- Custom tips
			if random() > 0.3 then
				level_tweak_data.load_data.strings.custom_tip = managers.localization:text(custom_tips[random(1, #custom_tips)])
			else
				-- Everything is a custom tip now because of OVK's messed up tip text formatting. load_level_data.tip_id will be
				-- ignored
				level_tweak_data.load_data.strings.custom_tip = managers.localization:text(stock_tips[random(1, #stock_tips)])
			end

			-- Yes, these are all stock translations, but I'm preprocessing them here instead so
			-- LevelLoadingScreenGuiScript:init() can simply index and use them directly
			level_tweak_data.load_data.strings.job_plan = {
				name = managers.localization:to_upper_text("menu_preferred_plan"),
				[-1] = managers.localization:to_upper_text("menu_any"),
				[1] = managers.localization:to_upper_text("menu_plan_loud"),
				[2] = managers.localization:to_upper_text("menu_plan_stealth")
			}
			level_tweak_data.load_data.strings.kick_option = {
				name = managers.localization:to_upper_text("menu_kicking_allowed_option"),
				[0] = managers.localization:to_upper_text("menu_kick_disabled"),
				[1] = managers.localization:to_upper_text("menu_kick_server"),
				[2] = managers.localization:to_upper_text("menu_kick_vote")
			}
			level_tweak_data.load_data.strings.permission = {
				name = managers.localization:to_upper_text("menu_permission"),
				[1] = managers.localization:to_upper_text("menu_public_game"),
				[2] = managers.localization:to_upper_text("menu_friends_only_game"),
				[3] = managers.localization:to_upper_text("menu_private_game")
			}
			level_tweak_data.load_data.strings.minrep = managers.localization:to_upper_text("menu_reputation_permission")
			-- Preprocess the risk icons since tweak_data.hud_icons is not cloned by the game's code
			level_tweak_data.load_data.icons = {}
			local texture, rect
			for __, name in ipairs({"risk_swat", "risk_fbi", "risk_death_squad", "risk_easy_wish", "risk_murder_squad", "risk_sm_wish"}) do
				texture, rect = tweak_data.hud_icons:get_icon_data(name)
				level_tweak_data.load_data.icons[name] = {
					texture = texture,
					rect = rect
				}
			end
			-- Because Idstring does not exist in the LoadingEnvironment thread, perform the conversion here instead
			level_tweak_data.load_data.circle_render_template = Idstring("VertexColorTexturedRadial")
			-- This will be stomped by lobby_attributes below if it exists (i.e. this will only be left unchanged when playing
			-- offline or loading the safe house level)
			level_tweak_data.load_data.risk = tweak_data:difficulty_to_index(Global.game_settings.difficulty or "easy")

			if not Global.game_settings.single_player and managers.network ~= nil and managers.network.matchmake ~= nil then
				if alive(managers.network.matchmake.lobby_handler) then
					if managers.network.matchmake.lobby_handler.get_lobby_data then
						level_tweak_data.load_data.lobby_attributes = clone(managers.network.matchmake.lobby_handler:get_lobby_data())
						-- Corrections for player count and server state are sometimes required when transitioning between heist
						-- days in a multi-day contract, see this mod's ClientNetworkSession:ok_to_load_level() and
						-- HostNetworkSession:load_level() hooks
						if LoadingScreenInfo_OverrideData ~= nil then
							for name, data in pairs(LoadingScreenInfo_OverrideData) do
								level_tweak_data.load_data.lobby_attributes[name] = data
							end
							LoadingScreenInfo_OverrideData = nil
						end
					else
						level_tweak_data.load_data.lobby_attributes = nil
						log("[LoadingScreenInfo] Warning: managers.network.matchmake.lobby_handler.get_lobby_data is nil")
					end
				elseif managers.network.matchmake._lobby_attributes ~= nil then
					-- Local player is hosting a game (this actually no longer gets hit since
					-- NetworkMatchMakingSTEAM.lobby_handler:get_lobby_data() exists on both clients and servers)
					level_tweak_data.load_data.lobby_attributes = clone(managers.network.matchmake._lobby_attributes)
				else
					level_tweak_data.load_data.lobby_attributes = nil
				end
			else
				-- Setting up a lobby, then leaving it (without starting the game) causes stale information to show up when
				-- loading a singleplayer level, clear it away here
				level_tweak_data.load_data.lobby_attributes = nil
			end

			if level_tweak_data.load_data.lobby_attributes ~= nil then
				-- Using tonumber() here since the fields in the table returned by lobby_handler:get_lobby_data() are all strings
				-- instead of numbers
				-- No idea why OVK renamed the difficulty field (and only that field alone) to Difficulty in U124/U125 (not sure
				-- exactly which update changed it)
				level_tweak_data.load_data.risk = tonumber(level_tweak_data.load_data.lobby_attributes.Difficulty or level_tweak_data.load_data.lobby_attributes.difficulty)

				local tmp = tweak_data:index_to_server_state(tonumber(level_tweak_data.load_data.lobby_attributes.state))
				level_tweak_data.load_data.strings.server_state_string = tmp and managers.localization:to_upper_text("menu_lobby_server_state_" .. tmp) or level_tweak_data.load_data.strings.strings.unknown
			end
		end

		-- Don't worry about polluting LevelsTweakData since the entire tweak_data table (and its subtables) are about to be
		-- flushed out and reloaded anyway (the Lua environment is going to be reset soon, which is why the game code packs
		-- references to certain tweak_data subtables into a load_level_data table (another reason is that
		-- LevelLoadingScreenGuiScript exists in a separate LoadingEnvironment thread and therefore cannot access tweak_data on
		-- the Main thread directly). Said table is likely cloned as there is no tweak_data instance at the time
		-- LevelLoadingScreenGuiScript:init() is called)
	end

	return _start_loading_screen_actual(self, ...)
end

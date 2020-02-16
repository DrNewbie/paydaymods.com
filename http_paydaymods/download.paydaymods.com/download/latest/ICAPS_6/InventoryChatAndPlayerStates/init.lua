
_G.InventoryChatAndPlayerStates = _G.InventoryChatAndPlayerStates or {
	StateValues = {
		-- This value is actually unused since disconnected players do not even have a subtable in PeerStates
		-- BaseNetworkSession:_on_peer_removed() / HUDMissionBriefing:remove_player_slot_by_peer_id()
		Disconnected = 0,
		-- After BaseNetworkSession:add_peer() is called but before BaseNetworkSession:on_drop_in_pause_request_received()
		-- (flashing Joining text)
		InitialJoin = 1,
		-- BaseNetworkSession:on_dropin_progress_received() / HUDMissionBriefing:set_dropin_progress()
		Joining = 2,
		-- BaseNetworkSession:on_streaming_progress_received() / HUDMissionBriefing:set_dropin_progress()
		Streaming = 3,
		-- Connected means to refer to PeerStates[peer_id].ready instead
		-- ConnectionNetworkHandler:lobby_info() / HUDMissionBriefing:set_player_slot()
		Connected = 4
	},
	-- This subtable will hold another subtable for each peer (including the local player). Valid fields for each subtable:
	-- state (See StateValues above)
	-- ready (Boolean)
	-- progress (A number from 0 - 100 representing join/load progress, use the state field to distinguish between the two)
	PeerStates = {},
	GhostAlpha = 0.55,
	DetailedMaxPlayers = 7
}

if InventoryChatAndPlayerStates.ModPath == nil then
	InventoryChatAndPlayerStates.ModPath = ModPath
end

-- Optimization: Cache the results of the global hashtable-based lookups in local register-based variables as the latter are much
-- faster
-- http://lua-users.org/wiki/OptimisingUsingLocalVariables
-- https://stackoverflow.com/questions/154672/what-can-i-do-to-increase-the-performance-of-a-lua-program/12865406#12865406
local alive = _G.alive

-- Based upon TdlQ's Lobby Player Info mod's localizations loading code
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_InventoryChatAndPlayerStates", function(loc)
	local commonpath = InventoryChatAndPlayerStates.ModPath .. "localizations/"
	if _G.PD2KR then
		loc:load_localization_file(commonpath .. "korean.txt")
	else
		local GetFiles = _G.file.GetFiles
		local Idstring = _G.Idstring
		local activelanguagekey = SystemInfo:language():key()
		for __, filename in ipairs(GetFiles(commonpath)) do
			if Idstring(filename:match("^(.*).txt$") or ""):key() == activelanguagekey then
				loc:load_localization_file(commonpath .. filename)
				break
			end
		end
	end

	loc:load_localization_file(commonpath .. "english.txt", false)
end)

function InventoryChatAndPlayerStates:RetrievePlayerStatesPanel()
	-- The alive() checks are very important, or unexplained crashes may occur when calling any of the panels' functions
	local game_chat_gui = managers.menu_component ~= nil and managers.menu_component._game_chat_gui or nil
	if game_chat_gui == nil or not alive(game_chat_gui._hud_panel) then
		return nil, nil
	end

	local chat_button_panel = game_chat_gui._hud_panel:child("chat_button_panel")
	if not alive(chat_button_panel) then
		return nil, nil
	end

	local playerstates_panel = chat_button_panel:child("playerstates")
	if not alive(playerstates_panel) then
		return nil, chat_button_panel
	end
	return playerstates_panel, chat_button_panel
end

-- newmenustate may occasionally be passed in since this function is also called from MenuManager:_set_peer_sync_state()
function InventoryChatAndPlayerStates:GetPeerStates(peer_id, newmenustate)
	local connected = true
	local menustate = nil
	if newmenustate ~= nil then
		menustate = newmenustate
	elseif managers.menu ~= nil then
		menustate = managers.menu:get_peer_state(peer_id)
	else
		menustate = nil
	end
	local session = managers.network:session()
	local islocalplayer = session ~= nil and session:local_peer():id() == peer_id or false
	local ready = false
	local peer = session ~= nil and session:peer(peer_id) or nil
	if peer == nil then
		menustate = managers.localization:to_upper_text("icaps_not_connected") 
		connected = false
		return menustate, connected, islocalplayer, ready
	end

	-- Two distinct codepaths, depending on whether the game session is in the lobby or the loadout (i.e. mission briefing GUI)
	-- menu

	local gamestate = game_state_machine:current_state_name()
	if gamestate == "menu_main" then
		-- Lobby
		if menustate ~= nil and type(menustate) == "string" and menustate:len() > 0 then
			-- Valid string_ids (tweak_data.menu_sync_states):
			-- menu_lobby_menu_state_lobby
			-- menu_lobby_menu_state_options
			-- menu_lobby_menu_state_crimenet
			-- menu_lobby_menu_state_skilltree
			-- menu_lobby_menu_state_blackmarket
			-- menu_lobby_menu_state_blackmarket_weapon
			-- menu_lobby_menu_state_blackmarket_mask
			-- menu_lobby_menu_state_payday
			ready = menustate == "lobby"
			menustate = managers.localization:to_upper_text("menu_lobby_menu_state_" .. menustate)
		else
			-- This occurs when players are connecting to the lobby in the "menu_main" game state (MenuManager:get_peer_state()
			-- apparently returns nil for such players)
			menustate = managers.localization:to_upper_text("menu_waiting_is_joining")
		end
	elseif gamestate == "ingame_waiting_for_players" then
		-- Mission briefing GUI
		local playerstate = self.PeerStates[peer_id]
		if playerstate ~= nil then
			if playerstate.state == self.StateValues.InitialJoin then
				menustate = managers.localization:to_upper_text("menu_waiting_is_joining")
			elseif playerstate.state == self.StateValues.Joining then
				menustate = managers.localization:to_upper_text("menu_waiting_is_joining") .. " " .. tostring(playerstate.progress) .. "%"
			elseif playerstate.state == self.StateValues.Streaming then
				menustate = managers.localization:to_upper_text("debug_loading_level") .. " " .. tostring(playerstate.progress) .. "%"
			elseif playerstate.state == self.StateValues.Connected then
				ready = playerstate.ready
				menustate = managers.localization:to_upper_text(playerstate.ready and "menu_waiting_is_ready" or "menu_waiting_is_not_ready")
			else
				log("[InventoryChatAndPlayerStates] GetPeerStates() | Warning: Unhandled playerstate.state " .. tostring(playerstate.state) .. " for peer " .. tostring(peer_id))
			end
		else
			-- Should never happen, but just in case...
			log("[InventoryChatAndPlayerStates] GetPeerStates() | Error: playerstate is nil for peer " .. tostring(peer_id))
			menustate = managers.localization:to_upper_text("icaps_not_connected")
			connected = false
		end
	else
		log("[InventoryChatAndPlayerStates] GetPeerStates() | Warning: Unhandled game state " .. tostring(gamestate))
	end

-- TODO: Remove this when it is proven to not occur
-- See also: MenuComponentManager_set_active_components_hook()
if menustate == nil then
	log("")
	log("")
	log("[InventoryChatAndPlayerStates] GetPeerStates() | Critical: menustate is /still/ nil!")
	log("peer_id: " .. tostring(peer_id))
	log("newmenustate: " .. tostring(newmenustate))
	log("gamestate: " .. tostring(gamestate))
	log(debug.traceback())
	log("")
	log("")
	menustate = "icaps_failed (please contact Snh20 on Reddit or the Last Bullet forums)"
end

	return menustate, connected, islocalplayer, ready
end

-- From HUDMissionBriefing:set_slot_joining()
local function animate_joining(panel)
	local t = 0
	local sin = math.sin
	while true do
		t = (t + coroutine.yield()) % 1
		panel:set_alpha(0.3 + 0.7 * sin(t * 180))
	end
end

-- From ChatGui:start_notify_new_message()
local function ready_pulse(panel)
	local lerp = math.lerp
	local abs = math.abs
	local cos = math.cos
	local Application = _G.Application
	local time = Application.time
	-- Don't bother with a lead-in fade since they are synchronized to Application:time() anyway. Yes, there will be
	-- an ugly pop-in for the flash, but I don't really care about that right now since they all need to be
	-- synchronized
--	over(0.1, function(p)
--		panel:set_alpha(lerp(0, 0.6, p))
--	end)
	-- Change the '3' below to actually alter the flash interval (in seconds)
	local interval = 1 / 3
	while true do
		-- Using Application:time() instead of progress to ensure that all instances are synchronized
		coroutine.yield()
		panel:set_alpha(abs(cos(time(Application) * 360 * interval)) * 0.6)
	end
end

function InventoryChatAndPlayerStates:UpdatePlayerStates(peer_id, menustate)
	local playerstates_panel = self:RetrievePlayerStatesPanel()
	if playerstates_panel == nil then
		return
	end

	local text, connected, islocalplayer, ready = self:GetPeerStates(peer_id, menustate)
	local tmp_panel = playerstates_panel:child(tostring(peer_id) .. "_callsign")
	if alive(tmp_panel) then
		tmp_panel:set_color(tweak_data.chat_colors[peer_id]:with_alpha(connected and not islocalplayer and 1 or 0.35))
	end
	tmp_panel = playerstates_panel:child(tostring(peer_id) .. "_state")
	if alive(tmp_panel) then
		tmp_panel:set_text(text)
		tmp_panel:set_color(connected and not islocalplayer and tweak_data.screen_colors.text or tweak_data.menu.default_disabled_text_color)

		local playerstate = self.PeerStates[peer_id]
		if playerstate ~= nil and playerstate.state == self.StateValues.InitialJoin then
			tmp_panel:animate(animate_joining)
		else
			tmp_panel:stop()
			tmp_panel:set_alpha(1)
		end
	end

	tmp_panel = playerstates_panel:child(tostring(peer_id) .. "_flash")
	if alive(tmp_panel) then
		if connected and not islocalplayer and ready then
			tmp_panel:stop()
			tmp_panel:animate(ready_pulse)
		else
			tmp_panel:stop()
			tmp_panel:set_alpha(0)
		end
	end

	self:RealignPlayerStates()
end

function InventoryChatAndPlayerStates:RealignPlayerStates()
	local playerstates_panel, chat_button_panel = self:RetrievePlayerStatesPanel()
	if playerstates_panel == nil or chat_button_panel == nil then
		return
	end

	local tmp_panel
	local flash_panel
	local align_bottom_coord = 0
	local align_right_coord = 0
	local override = self.position_override
	if override == nil then
		align_bottom_coord = chat_button_panel:child("chat_button"):bottom()
		align_right_coord = chat_button_panel:child("chat_button"):right() + 20
	else
		if override.parent == "chat_button_panel" then
			if not override.validated then
				-- Validate parameters
				if override.parent == "chat_button_panel" then
					if override.x ~= nil and chat_button_panel[override.x] == nil then
						log("[InventoryChatAndPlayerStates] RealignPlayerStates() | Warning: The function specified by self.position_override.x was not found on panel chat_button_panel, falling back to 0 (no offset)")
						override.x = nil
					elseif override.y ~= nil and chat_button_panel[override.y] == nil then
						log("[InventoryChatAndPlayerStates] RealignPlayerStates() | Warning: The function specified by self.position_override.y was not found on panel chat_button_panel, falling back to 0 (no offset)")
						override.y = nil
					end
				end
				-- Don't repeatedly validate every time this function gets called (which may be very frequently if multiple
				-- players are joining)
				override.validated = true
			end

			-- The following is some pretty hideous stuff  :/
			if override.y ~= nil then
				-- chat_button_panel[override.y](chat_button_panel) expands to chat_button_panel:<value of override.y>(), or
				-- chat_button_panel:bottom()
				local game_chat_gui = managers.menu_component ~= nil and managers.menu_component._game_chat_gui or nil
				if game_chat_gui ~= nil and game_chat_gui._crimenet_chat_state then
					-- Despite the name being _crimenet_chat_state, this applies to open preplanning chat GUIs as well
					if override.open_y_reference ~= nil and alive(game_chat_gui._panel) then
						local open_y_offset = override.open_y_offset or 0
						if override.open_y_reference == "chat_bg" then
							local chat_bg = game_chat_gui._panel:child("chat_bg")
							if alive(chat_bg) then
								align_bottom_coord = chat_bg:world_top() + open_y_offset
							end
						else
							log("[InventoryChatAndPlayerStates] RealignPlayerStates() | Warning: Unrecognized open_y_reference name \"" .. tostring(override.open_y_reference) .. "\"")
						end
					else
						align_bottom_coord = chat_button_panel[override.y](chat_button_panel) + override.open_y_offset
					end
				else
					align_bottom_coord = chat_button_panel[override.y](chat_button_panel) + override.y_offset
				end
			end
			if override.x ~= nil then
				-- chat_button_panel[override.x](chat_button_panel) expands to chat_button_panel:<value of override.x>(), or
				-- chat_button_panel:left()
				align_right_coord = chat_button_panel[override.x](chat_button_panel) + override.x_offset
			end
		else
			log("[InventoryChatAndPlayerStates] RealignPlayerStates() | Warning: Unrecognized parent name \"" .. tostring(override.parent) .. "\"")
		end
	end
	local _, _, w, h
	local max_players = InventoryChatAndPlayerStates.DetailedMaxPlayers or 7
	local num_players = CriminalsManager ~= nil and CriminalsManager.MAX_NR_CRIMINALS or 4
	for i = 1, num_players do
		tmp_panel = playerstates_panel:child(tostring(i) .. "_callsign")
		if alive(tmp_panel) then
			tmp_panel:set_bottom(align_bottom_coord)
			tmp_panel:set_left(align_right_coord + 10)
			align_right_coord = tmp_panel:right()
		end

		if num_players <= max_players then
			tmp_panel = playerstates_panel:child(tostring(i) .. "_state")
			if alive(tmp_panel) then
				_, _, w, h = tmp_panel:text_rect()
				tmp_panel:set_size(w, h)
				tmp_panel:set_bottom(align_bottom_coord - 1)
				tmp_panel:set_left(align_right_coord + 1)
				align_right_coord = tmp_panel:right()
			end
		elseif alive(tmp_panel) then
			w, h = tmp_panel:size()
			w = w - 15
			h = h - 5
		end

		-- Flash panel depends on state text panel for alignment
		flash_panel = playerstates_panel:child(tostring(i) .. "_flash")
		if alive(flash_panel) and alive(tmp_panel) then
			flash_panel:set_size((w + 20) * 2, (h + 10) * 2)
			flash_panel:set_center(tmp_panel:center())
		end
	end

	self:RealignJobText()
end

function InventoryChatAndPlayerStates:StoreJobData(lobby_data)
	-- From ContractBoxGui:create_contract_box()
	local jobmanager = managers.job
	if jobmanager ~= nil and jobmanager:has_active_job() then
		local localizationmanager = managers.localization
		local mutatorsmanager = managers.mutators
		local tweak_data = _G.tweak_data
		self.JobData = {
			job_name = localizationmanager:to_upper_text(jobmanager:current_contact_data().name_id) .. ": " .. localizationmanager:to_upper_text(jobmanager:current_job_data().name_id),
			difficulty = localizationmanager:to_upper_text(tweak_data.difficulty_name_ids[tweak_data.difficulties[jobmanager:current_difficulty_stars() + 2] or 1]),
			pro_job = jobmanager:is_current_job_professional(),
			mutators_active = mutatorsmanager:are_mutators_enabled() and mutatorsmanager:allow_mutators_in_level(jobmanager:current_level_id()) and true or false
		}
		if type(lobby_data) == "table" then
			local JobData = self.JobData
			local tmp = tonumber(lobby_data.job_plan) or -1
			if JobData.job_plan ~= tmp then
				JobData.job_plan = tmp
			end
		else
			-- This gets called from the ContractBoxGui:init() hook without any arguments
			if Network:is_server() then
				-- This only ever changes for hosts
				self.JobData.job_plan = Global.game_settings.job_plan
			else
				local JobData = self.JobData

				-- Note: managers.network.matchmake._lobby_attributes contains stale /local/ server information when connected to
				-- another game as a client, ignore its contents if this is the case
				-- managers.network.matchmake.lobby_handler:get_lobby_data() is far more reliable in such cases
				if JobData ~= nil and managers.network ~= nil and managers.network.matchmake ~= nil then
					local tmp = managers.network.matchmake.lobby_handler
					if alive(tmp) and type(tmp.get_lobby_data) == "function" then
						tmp = tmp:get_lobby_data()
						tmp = tonumber(tmp.job_plan) or -1
						if JobData.job_plan ~= tmp then
							JobData.job_plan = tmp
						end
					else
						-- No active lobby
						self.JobData = nil
					end
				end
			end
		end
	else
		self.JobData = nil
	end

	self:UpdateJobText()
end

function InventoryChatAndPlayerStates:UpdateJobText(block_realign)
	-- Placed here to allow the contract box GUI icon updating to occur even when the player states panel does not exist
	local contract_gui = managers.menu_component ~= nil and managers.menu_component._contract_gui or nil
	if contract_gui ~= nil and contract_gui.UpdateJobPlanIcon ~= nil then
		contract_gui:UpdateJobPlanIcon(self)
	end

	local playerstates_panel = self:RetrievePlayerStatesPanel()
	if playerstates_panel == nil then
		return
	end

	local job_text = playerstates_panel:child("job_text")
	if not alive(job_text) then
		return
	end

	local job_plan = playerstates_panel:child("job_plan")
	if not alive(job_plan) then
		job_plan = nil
	else
		job_plan:hide()
	end

	local gamestate = game_state_machine ~= nil and game_state_machine:current_state_name() or nil
	if gamestate ~= "menu_main" then
		job_text:set_text("")
		self.JobData = nil
		return
	end

	if self.JobData == nil or self.JobData.job_name == nil then
		local text = ""
		if Network:is_server() then
			text = managers.localization:to_upper_text("menu_choose_new_contract")
		else
			text = managers.localization:to_upper_text("victory_client_waiting_for_server")
		end
		local text_end = utf8.len(text)
		job_text:set_text(text)
		if managers.mutators:are_mutators_enabled() then
			job_text:set_range_color(0, text_end, tweak_data.screen_colors.mutators_color_text)
		else
			job_text:set_range_color(0, text_end, tweak_data.screen_colors.text)
		end
	else
		local text = self.JobData.job_name .. "  "
		local risk_start = nil
		local risk_end = nil
		local pro_start = nil
		local pro_end = nil
		local start = utf8.len(text)
		if self.JobData.pro_job then
			pro_start = start
			text = text .. managers.localization:to_upper_text("cn_menu_pro_job") .. "  "
			pro_end = utf8.len(text)
			start = pro_end
		end
		if self.JobData.difficulty ~= nil then
			risk_start = start
			text = text .. self.JobData.difficulty
			risk_end = utf8.len(text)
		end
		job_text:set_text(text)
		if self.JobData.mutators_active then
			job_text:set_range_color(0, start - 2, tweak_data.screen_colors.mutators_color_text)
		else
			job_text:set_range_color(0, start - 2, tweak_data.screen_colors.text)
		end
		if risk_start and risk_end then
			job_text:set_range_color(risk_start, risk_end, tweak_data.screen_colors.risk)
		end
		if pro_start and pro_end then
			job_text:set_range_color(pro_start, pro_end, tweak_data.screen_colors.pro_color)
		end
		if self.JobData.job_plan ~= nil and self.JobData.job_plan > 0 and job_plan ~= nil then
			job_plan:show()
			if self.JobData.job_plan == 1 then
				job_plan:set_image("guis/textures/pd2/cn_playstyle_loud")
			elseif self.JobData.job_plan == 2 then
				job_plan:set_image("guis/textures/pd2/cn_playstyle_stealth")
			else
				-- What, how?!
				job_plan:hide()
				log("[InventoryChatAndPlayerStates] UpdateJobText() | Warning: Unrecognized job_plan index " .. tostring(self.JobData.job_plan))
			end
		end
	end

	if not block_realign then
		self:RealignJobText()
	end
end

function InventoryChatAndPlayerStates:RealignJobText()
	local playerstates_panel = self:RetrievePlayerStatesPanel()
	if playerstates_panel == nil then
		return
	end

	local job_text = playerstates_panel:child("job_text")
	if not alive(job_text) then
		return
	end

	local max_players = InventoryChatAndPlayerStates.DetailedMaxPlayers or 7
	local last_player = CriminalsManager ~= nil and CriminalsManager.MAX_NR_CRIMINALS or 4
	local ref_panel = playerstates_panel:child(tostring(last_player) .. (last_player <= max_players and "_state" or "_callsign"))
	if not alive(ref_panel) then
		return
	end

	-- Never forget this or alignments will go awry
	local _, _, w, h = job_text:text_rect()
	job_text:set_size(w, h)

	job_text:set_leftbottom(ref_panel:right() + 20, ref_panel:bottom())

	ref_panel = playerstates_panel:child("job_plan")
	if not alive(ref_panel) then
		return
	end

	ref_panel:set_center_y(job_text:center_y())
	ref_panel:set_left(job_text:right() + 10)
end

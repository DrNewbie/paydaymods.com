
if CrimeSpreeFilterFix_NetworkMatchMakingSTEAM_Hooked then
	return
else
	CrimeSpreeFilterFix_NetworkMatchMakingSTEAM_Hooked = true
end

-- Current as at U143
function NetworkMatchMakingSTEAM:search_lobby(friends_only, no_filters)
	self._search_friends_only = friends_only
	if not self:_has_callback("search_lobby") then
		return
	end
	local is_key_valid = function(key)
		return key ~= "value_missing" and key ~= "value_pending"
	end
	if friends_only then
		self:get_friends_lobbies()
	else
		local function refresh_lobby()
			if not self.browser then
				return
			end
			local lobbies = self.browser:lobbies()
			local info = {
				room_list = {},
				attribute_list = {}
			}
			if lobbies then
				for _, lobby in ipairs(lobbies) do
					if self._difficulty_filter == 0 or self._difficulty_filter == tonumber(lobby:key_value("difficulty")) then
						table.insert(info.room_list, {
							owner_id = lobby:key_value("owner_id"),
							owner_name = lobby:key_value("owner_name"),
							room_id = lobby:id(),
							owner_level = lobby:key_value("owner_level")
						})
						local attributes_data = {
							numbers = self:_lobby_to_numbers(lobby)
						}
						attributes_data.mutators = self:_get_mutators_from_lobby(lobby)
						local crime_spree_key = lobby:key_value("crime_spree")
						if is_key_valid(crime_spree_key) then
							attributes_data.crime_spree = tonumber(crime_spree_key)
							attributes_data.crime_spree_mission = lobby:key_value("crime_spree_mission")
						end
						table.insert(info.attribute_list, attributes_data)
					end
				end
			end
			self:_call_callback("search_lobby", info)
		end
		self.browser = LobbyBrowser(refresh_lobby, function()
		end)
		local interest_keys = {
			"owner_id",
			"owner_name",
			"level",
			"difficulty",
			"permission",
			"state",
			"num_players",
			"drop_in",
			"min_level",
			"kick_option",
			"job_class_min",
			"job_class_max"
		}
		if self._BUILD_SEARCH_INTEREST_KEY then
			table.insert(interest_keys, self._BUILD_SEARCH_INTEREST_KEY)
		end
		self.browser:set_interest_keys(interest_keys)
		self.browser:set_distance_filter(self._distance_filter)
		local use_filters = not no_filters
		if Global.game_settings.gamemode_filter == GamemodeCrimeSpree.id then
			use_filters = false
		end
		self.browser:set_lobby_filter(self._BUILD_SEARCH_INTEREST_KEY, "true", "equal")
		if use_filters then
			self.browser:set_lobby_filter("min_level", managers.experience:current_level(), "equalto_less_than")
			if Global.game_settings.search_appropriate_jobs then
				local min_ply_jc = managers.job:get_min_jc_for_player()
				local max_ply_jc = managers.job:get_max_jc_for_player()
				self.browser:set_lobby_filter("job_class_min", min_ply_jc, "equalto_or_greater_than")
				self.browser:set_lobby_filter("job_class_max", max_ply_jc, "equalto_less_than")
			end
		end
		if not no_filters then
			if Global.game_settings.gamemode_filter == GamemodeCrimeSpree.id then
				-- BEGIN MOD --
--				local min_level = 0
--				if 0 <= Global.game_settings.crime_spree_max_lobby_diff then
--					min_level = managers.crime_spree:spree_level() - (Global.game_settings.crime_spree_max_lobby_diff or 0)
--					min_level = math.max(min_level, 0)
--				end
--				self.browser:set_lobby_filter("crime_spree", min_level, "equalto_or_greater_than")
				-- Don't bother with all the rank restriction crap and just use the user's settings directly. The call to
				-- math.max() is to ensure that non-Crime Spree lobbies (i.e. -1 rank) do not appear
				self.browser:set_lobby_filter("crime_spree", math.max(Global.game_settings.crime_spree_max_lobby_diff or 0, 0), "equalto_or_greater_than")
				-- END MOD --
			elseif Global.game_settings.gamemode_filter == GamemodeStandard.id then
				self.browser:set_lobby_filter("crime_spree", -1, "equalto_less_than")
			end
		end
		if use_filters then
			for key, data in pairs(self._lobby_filters) do
				if data.value and data.value ~= -1 then
					self.browser:set_lobby_filter(data.key, data.value, data.comparision_type)
					print(data.key, data.value, data.comparision_type)
				end
			end
		end
		self.browser:set_max_lobby_return_count(self._lobby_return_count)
		if Global.game_settings.playing_lan then
			self.browser:refresh_lan()
		else
			self.browser:refresh()
		end
	end
end

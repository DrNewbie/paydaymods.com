if Utils:IsInGameState() and Utils:IsInHeist() then
	local UTILS_PAGERS = function() return BWROptions._data.utils_pagers end
	local UTILS_ENEMIES = function() return BWROptions._data.utils_enemies end
	local UTILS_CONVERTS = function() return BWROptions._data.utils_converts end
	local UTILS_PACKAGES = function() return BWROptions._data.utils_packages end
	local Net = _G.LuaNetworking

	local packages = 0
	for assignment, count in pairs(managers.gage_assignment._progressed_assignments) do
	packages = packages + count
	end
	local packager = (tweak_data.gage_assignment:get_num_assignment_units() - packages)
	
	if managers.groupai:state():whisper_mode() then
		local tied_count = 0
		local cop_count = 0
		for _, guard in pairs(managers.enemy:all_enemies()) do
			if guard.unit:anim_data() and guard.unit:anim_data().hands_tied then
				tied_count = tied_count + 1
			end
			cop_count = cop_count + 1
		end
		if Net:IsHost() or K_ClientSideCheck then
			local remaining = KTweak_PagerNumber or 0
			if UTILS_PAGERS() then
			managers.chat:_receive_message(1, "Pagers Answered", tostring(remaining) .. " out of 4", tweak_data.screen_colors.regular_color)
			end
			if UTILS_ENEMIES() then
			managers.chat:_receive_message(1, "Guards left", tostring(cop_count), tweak_data.screen_colors.regular_color)
			end
			if UTILS_CONVERTS() then
			managers.chat:_receive_message(1, "Intimidated Guards", tostring(tied_count), tweak_data.screen_colors.regular_color)
			end
			if UTILS_PACKAGES() then
			managers.chat:_receive_message(1, "Packages Remaining", tostring(packager), tweak_data.screen_colors.regular_color)
			end
		else
			local remaining = KTweak_PagerNumber_C or 0
			if UTILS_PAGERS() then
			managers.chat:_receive_message(1, "Pagers Answered - CLIENT", tostring(remaining) .. " out of 4", tweak_data.screen_colors.stats_negative)
			end
			if UTILS_ENEMIES() then
			managers.chat:_receive_message(1, "Guards left", tostring(cop_count), tweak_data.screen_colors.stats_negative)
			end
			if UTILS_CONVERTS() then
			managers.chat:_receive_message(1, "Intimidated Guards", tostring(tied_count), tweak_data.screen_colors.stats_negative)
			end
			if UTILS_PACKAGES() then
			managers.chat:_receive_message(1, "Packages Remaining", tostring(packager), tweak_data.screen_colors.stats_negative)
			end
		end
	elseif not managers.groupai:state():whisper_mode() then
		if Net:IsHost() or K_ClientSideCheck then
			if UTILS_PACKAGES() then
				managers.chat:_receive_message(1, "Packages Remaining", tostring(packager), tweak_data.screen_colors.regular_color)
			end
		else
			if UTILS_PACKAGES() then
				managers.chat:_receive_message(1, "Packages Remaining", tostring(packager), tweak_data.screen_colors.stats_negative)
			end
		end
	end
end
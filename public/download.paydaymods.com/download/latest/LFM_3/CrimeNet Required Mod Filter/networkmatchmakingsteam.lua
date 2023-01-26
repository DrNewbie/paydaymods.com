
local orig_check_mm = NetworkMatchMakingSTEAM.is_server_ok
function NetworkMatchMakingSTEAM:is_server_ok(friends_only, room, attributes_list, is_invite,...)
	local result = {orig_check_mm(self,friends_only,room,attributes_list,is_invite,...)}
	local FILTER_ENABLED = LobbyFilterMods:Enabled()
	if not (FILTER_ENABLED and attributes_list) then
		return unpack(result)
	end
	if attributes_list and attributes_list.numbers and not (attributes_list.mods or attributes_list.mutators or attributes_list.crime_spree or attributes_list.crime_spree_mission) then
		return unpack(result)
	end
	if LobbyFilterMods:AllowVanillaLobbies() and (attributes_list.mods ~= "1" or attributes_list.mods ~= "") then
		return unpack(result)
	end

	local CASE_SENSITIVE = LobbyFilterMods:IsCaseSensitive()
	local MUST_HAVE_ALL_MODS = LobbyFilterMods:MustHaveAllMods()
	local REQUIRED_MODS_LIST = LobbyFilterMods:GetModsList()
	local EXACT_NAME_MATCH = LobbyFilterMods:IsExactMatch()
	
	local mods_string = attributes_list.mods
	
	if not CASE_SENSITIVE then 
		mods_string = utf8.to_upper(mods_string)
	end
	local server_mods = {}
	if EXACT_NAME_MATCH then 
		--create table of server's mods to match against
		local _m = string.split(mods_string,"|") or {}
		for i,modname in pairs(_m) do 
			local mod_name = CASE_SENSITIVE and modname or utf8.to_upper(modname)
			server_mods[mod_name] = true
		end
	end
	for modname,enabled in pairs(REQUIRED_MODS_LIST) do 
		local mod_name = CASE_SENSITIVE and modname or utf8.to_upper(modname)
		if enabled then 
			if not EXACT_NAME_MATCH then 
				local f = string.find(mods_string,mod_name)
				if f then 
					if not MUST_HAVE_ALL_MODS then 
						return unpack(result)
					end
				elseif MUST_HAVE_ALL_MODS then 
					return false
				end
			elseif server_mods[mod_name] then
				if not MUST_HAVE_ALL_MODS then 
					return unpack(result)
				end
			elseif MUST_HAVE_ALL_MODS then 
				return false
			end
		end
	end
	if MUST_HAVE_ALL_MODS then --cleared all mods from whitelist
		return unpack(result)
	else --no mod matches
		return false
	end
	return true
end

if not CommandUtilities then
	CommandUtilities = CommandUtilities or class()
	CommandUtilities.modname = "CommandUtilities"
	CommandUtilities.prefix = "[" .. CommandUtilities.modname .. "]"
	
	ChatCommands:addCommand("whoami", CommandUtilities.modname, "Returns your own peer_id.", nil, function(args, user)
		return "peer_id: " .. tostring(user:id())
	end, ChatCommands._command_types.lobbywide)
	
	ChatCommands:addCommand("whois", CommandUtilities.modname, "Returns the steam username belonging to the given peer_id.", {ChatCommands:newArgument("peer_id", "peer_id", true)}, function(args, user)
		if args and args[1] and tonumber(args[1]) then
			if tonumber(args[1]) == user:id() then
				return "The given peer_id is yours."
			end
			if tonumber(args[1]) == _G.LuaNetworking:LocalPeerID() and managers.network and managers.network:session() and managers.network:session():local_peer() then
				return "steamname: " .. tostring(managers.network:session():local_peer():name())
			end
			return "steamname: " .. tostring(_G.LuaNetworking:GetNameFromPeerID(tonumber(args[1])))
		end
	end, ChatCommands._command_types.lobbywide)
	
	ChatCommands:addCommand("help", CommandUtilities.modname, "Returns information about the given command.", {ChatCommands:newArgument("command", "string", false)}, function(args)
		if args and args[1] and ChatCommands:getCommand(args[1]) then
			local cmd = ChatCommands:getCommand(args[1])
			local args_string = ""
			for __, arg in pairs(cmd._arguments) do
				if args_string ~= "" then
					args_string = args_string .. " "
				end
				if arg._required == true then
					args_string = args_string .. "*"
				end
				args_string = args_string .. "[" .. arg._argname .. " (" .. arg._value_type .. ")]"
			end
			if args_string ~= "" then
				args_string = "\nArguments: " .. args_string
			end
			return "[" .. cmd._modname .. "] " .. cmd._commandname .. ": " .. cmd._description .. args_string
		else
			return "Usage: /help [command]. Find available commands with /commands, /mods and /modcommands [modname]"
		end
	end, ChatCommands._command_types.lobbywide)
	
	ChatCommands:addCommand("commands", CommandUtilities.modname, "Returns all available commands.", nil, function(args, user)
		local cmds = ChatCommands:getCommands(user)
		local result = ""
		for __, cmd in pairs(cmds) do
			if result ~= "" then
				result = result .. "; "
			end
			result = result .. cmd._commandname
		end
		return result
	end, ChatCommands._command_types.lobbywide)
	
	ChatCommands:addCommand("mods", CommandUtilities.modname, "Returns the commanded mods.", nil, function(args)
		local mods = ChatCommands:getCommandedMods()
		local result = ""
		for __, modname in pairs(mods) do
			if result ~= "" then
				result = result .. "; "
			end
			result = result .. modname
		end
		return result
	end, ChatCommands._command_types.lobbywide)
	
	ChatCommands:addCommand("modcommands", CommandUtilities.modname, "Returns the available commands for the given mod.", {ChatCommands:newArgument("mod", "string", true)}, function(args, user)
		if args and args[1] then
			local cmds = ChatCommands:modGetCommands(args[1], user)
			if #cmds > 0 then
				local result = ""
				for __, cmd in pairs(cmds) do
					if result ~= "" then
						result = result .. "; "
					end
					result = result .. cmd._commandname
				end
				return result
			end
		else
			return "There are no commands available for the given mod. Try /mods"
		end
	end, ChatCommands._command_types.lobbywide)
end
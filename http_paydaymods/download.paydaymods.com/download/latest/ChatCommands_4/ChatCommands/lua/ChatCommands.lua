if not ChatCommands then
	ChatCommands = ChatCommands or class()
	ChatCommands.modname = "ChatCommands"
	ChatCommands.prefix = "[" .. ChatCommands.modname .. "]"
	
	ChatCommands._value_types = {}
	ChatCommands._value_types[1] = { name = "boolean", check = function(arg) return arg == "true" or arg == "false" end }
	ChatCommands._value_types[2] = { name = "number", check = function(arg) return tonumber(arg) and true end }
	ChatCommands._value_types[3] = { name = "string", check = function(arg) return arg ~= "" end }
	ChatCommands._value_types[4] = { name = "peer_id", check = function(arg) return (tonumber(arg) and tonumber(arg) >= 0 and tonumber(arg) <= 4) end }
	
	ChatCommands._command_types = {}
	ChatCommands._command_types.clientonly = "clientonly"
	ChatCommands._command_types.hostonly = "hostonly"
	ChatCommands._command_types.lobbywide = "lobbywide"
	
	ChatCommands._commands = {}
	
	function ChatCommands:_send_message_to_peer(peer, message)
		if managers.network:session() then
			peer:send("send_chat_message", ChatManager.GAME, self.prefix .. ": " .. message)
		end
	end
	function ChatCommands:_isLocalPeer(peer)
		return not peer and true or peer:id() == _G.LuaNetworking:LocalPeerID()
	end
	function ChatCommands:_isHost(peer)
		return not peer and true or peer:is_host()
	end
	
	function ChatCommands:_validateArguments(chat_args, cmd_args)
		local check_all_required = 1
		for it = 1, #chat_args do
			if cmd_args[it] then
				for __, value_type in pairs(ChatCommands._value_types) do
					if cmd_args[it]._value_type == value_type.name then
						if not value_type.check(chat_args[it]) then
							return false
						else
							break
						end
					end
				end
			else
				return false
			end
			check_all_required = it + 1
		end
		if cmd_args[check_all_required] and cmd_args[check_all_required]._required == true then
			return false
		end
		return true
	end
	function ChatCommands:_parseChat(text)
		local cmd_type = ""
		if _G.LuaNetworking:IsHost() or not _G.LuaNetworking:IsMultiplayer() then
			cmd_type = ChatCommands._command_types.hostonly
		else
			cmd_type = ChatCommands._command_types.clientonly
		end
		local result = ChatCommands:_parseMessage(text:text(), cmd_type, managers.network:session():local_peer())
		if result and result ~= false then
			text:set_text("")
			text:set_selection(0, 0)
			return result
		else
			return false
		end
	end
	
	function ChatCommands:_parseMessage(message, allowed_command_type, peer)
		local command, command_args
		if utf8.sub(message, 1, 1) == "/" then
			local command_string = utf8.sub(message, 2, utf8.len(message))
			command_args = string.split(command_string, " ") or {}
			if #command_args > 0 then
				command = Idstring(table.remove(command_args, 1))
			end
		end
		if command and self._commands[command:key()] then
			local cmd = self._commands[command:key()]
			if cmd._command_type == ChatCommands._command_types.hostonly and allowed_command_type ~= ChatCommands._command_types.hostonly then
				return false
			elseif cmd._command_type == ChatCommands._command_types.clientonly and allowed_command_type == ChatCommands._command_types.lobbywide then
				return false
			end
			if ChatCommands:_validateArguments(command_args, cmd._arguments) then
				local ret = cmd._callback(command_args, peer)
				return ret and tostring(ret) or ""
			else
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
					args_string = " " .. args_string
				end
				return "Usage: /" .. cmd._commandname .. args_string
			end
		end
		return false
	end
	
	function ChatCommands:_stringInTable(str, tbl)
		for __, tbl_str in pairs(tbl) do
			if tbl_str == str then
				return true
			end
		end
		return false
	end
	
	function ChatCommands:_respond(message)
		if not message then
			return
		end
		message = tostring(message)
		if managers and managers.chat and managers.chat._receivers and managers.chat._receivers[1] then
			for __, rcvr in pairs(managers.chat._receivers[1]) do
				rcvr:receive_message(">>", message, Color(1, 255, 0, 0)) 
			end  
		end
	end
	
	function ChatCommands:addCommand(command, modname, cmd_description, arguments, callback, command_type)
		arguments = arguments or {}
		modname = modname or ""
		command_type = command_type or ChatCommands._command_types.clientonly
		self._commands[Idstring(command):key()] = {_commandname = command, _command_type = command_type, _callback = callback, _modname = modname, _description = cmd_description,  _arguments = arguments}
	end
	function ChatCommands:newArgument(argname, value_type, required)
		return {_argname = argname, _value_type = value_type, _required = required and true}
	end
	
	function ChatCommands:getCommand(command)
		return self._commands[Idstring(command):key()]
	end
	function ChatCommands:getCommands(peer)
		local commands = {}
		for __, cmd in pairs(self._commands) do
			if (ChatCommands:_isLocalPeer(peer) and ChatCommands:_isHost(peer)) or (ChatCommands:_isLocalPeer(peer) and cmd._command_type ~= ChatCommands._command_types.hostonly) or (cmd._command_type == ChatCommands._command_types.lobbywide) then
				table.insert(commands, cmd)
			end
		end
		return commands
		
	end
	function ChatCommands:modGetCommands(modname, peer)
		local commands = {}
		for __, cmd in pairs(self._commands) do
			if cmd._modname == modname then
				if (ChatCommands:_isLocalPeer(peer) and ChatCommands:_isHost(peer)) or (ChatCommands:_isLocalPeer(peer) and cmd._command_type ~= ChatCommands._command_types.hostonly) or (cmd._command_type == ChatCommands._command_types.lobbywide) then
					table.insert(commands, cmd)
				end
			end
		end
		return commands
	end
	function ChatCommands:getCommandedMods()
		local mods = {}
		for __, cmd in pairs(self._commands) do
			if not ChatCommands:_stringInTable(cmd._modname, mods) then
				table.insert(mods, cmd._modname)
			end
		end
		return mods
	end
	
	dofile(ModPath .. "lua/CommandUtilities.lua")
end
if RequiredScript == "lib/managers/chatmanager" then
	local CCcm_enter_key_callback_original = ChatGui.enter_key_callback
	local CCcm_receive_message_by_peer_original = ChatManager.receive_message_by_peer
	function ChatGui:enter_key_callback()
		if not self._enabled then
			return
		end
		local response = ChatCommands:_parseChat(self._input_panel:child("input_text"))
		if response ~= false then
			if response ~= "" then
				ChatCommands:_respond(response)
			end
		else
			CCcm_enter_key_callback_original(self)
		end
	end
	function ChatManager:receive_message_by_peer(channel_id, peer, message)
		if peer:id() ~= _G.LuaNetworking:LocalPeerID() and _G.LuaNetworking:IsHost() then
			local response = ChatCommands:_parseMessage(message, ChatCommands._command_types.lobbywide, peer)
			if response ~= false then
				if response ~= "" then
					ChatCommands:_send_message_to_peer(peer, ">> " .. response)
				end
				self:_receive_message(channel_id, peer:name(), message, Color(1, 255, 0, 0), (peer:level() == nil and managers.experience:current_rank() > 0 or 0 < peer:rank()) and "infamy_icon")
				return
			end
		end
		CCcm_receive_message_by_peer_original(self, channel_id, peer, message)
	end
elseif RequiredScript == "lib/managers/hud/hudchat" then
	local CChc_enter_key_callback_original = HUDChat.enter_key_callback
	function HUDChat:enter_key_callback()
		local response = ChatCommands:_parseChat(self._input_panel:child("input_text"))
		if response ~= false then
			managers.hud:set_chat_focus(false)
			if response ~= "" then
				ChatCommands:_respond(response)
			end
		else
			CChc_enter_key_callback_original(self)
		end
	end
end

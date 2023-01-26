if not IgotShreked then
	IgotShreked = {}
	local file, err = io.open("mods/Cloacked/Callouts.ini", "r")
	if not file then
		file = io.open("mods/Cloacked/Callouts.ini", "w")
		file:write("I was cloacked!\n")
		file:write("Cloacker on me!\n")
		file:write("Look out there's a cloacker on me!\n")
		file:write("I got recked by a cloacker!\n")
		file:write("Cloacker is beating me, help!\n")
		file:write("This cloacker got me!\n")
		file:write("OMG! Look at that stick. I mean cloacker on me!\n")
		file:write("Sam fisher is beating me!\n")
		file:write("I got shreked by a cloacker!\n")
		file:write("CLACKER!\n")
		file:write("I got cloacked m8!\n")
		file:write("That ninja attacked me!\n")
		file:write("Ninja sneak attack was supper effective. Cloacker got me!\n")
		file:write("OMG. That cloacker is touching me!\n")
		file:write("Ducking Ninja!\n")
		file:close()
	end
	local file, err = io.open("mods/Cloacked/Callouts.ini", "r")
	if file then
		for line in file:lines() do
			table.insert(IgotShreked, line)
		end
		file:close()
	end
end
Hooks:PostHook(PlayerMovement, "on_SPOOCed", "getshreked", function(self)
	if self._current_state_name == "incapacitated" then
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", IgotShreked[math.random(1,(table.getn(IgotShreked)))])
		managers.player:local_player():sound():say("r01x_sin",true,true)
	end
end)
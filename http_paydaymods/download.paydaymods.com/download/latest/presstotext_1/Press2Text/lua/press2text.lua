_G.Press2Text = _G.Press2Text or {}
Press2Text._path = ModPath
Press2Text._data = {}

InChat = InChat or function()
	if not managers or not managers.hud or not managers.menu_component or not managers.menu_component._game_chat_gui then
		return false
	end
	if managers.hud._chat_focus == true or managers.menu_component._game_chat_gui:input_focus() == true then
		return true
	end
	return false
end

if InChat() then
	return
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_Press2Text", function(loc)
	loc:load_localization_file(Press2Text._path .. "localization/en.txt")
end)

lines_copied="Empty"

function Press2Text:group_check(group)
	group1checked=false
	group2checked=false
	group3checked=false
	group4checked=false
	group5checked=false
	group6checked=false
	if group==1 then
		group1checked=true
	elseif group==2 then
		group2checked=true
	elseif group==3 then
		group3checked=true
	elseif group==4 then
		group4checked=true
	elseif group==5 then
		group5checked=true
	elseif group==6 then
		group6checked=true
	end
	gtvar=gtvar+1
end

--------------------------------------------------Timer
local cooldown_duration = 5
cooldown_active = cooldown_active or false
function cooldown1_callback()
	cooldown_active = false
end
--------------------------------------------------

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_Press2Text", function(menu_manager)

------------------------------------------------------Send
	Press2Text.send = function(self)
		if Utils:IsInHeist() and Utils:IsInGameState() then
			if lines_copied~="Empty" then
				if not cooldown_active then
					managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", lines_copied)
					cooldown_active = true
					DelayedCalls:Add("cooldown1_callback", cooldown_duration, cooldown1_callback)
				end
			else
				managers.hud:show_hint({text = "Please choose a text first."})
			end
		end
	end

------------------------------------------------------Group1
	Press2Text.group1 = function(self)
		if Utils:IsInHeist() and Utils:IsInGameState() then
			if gtvar==nil or gtvar>3 or group1checked~=true then
				gtvar=1
			end
			if gtvar==1 then
				lines_copied="Thanks."
				managers.hud:show_hint({text = "Thanks."})
			elseif gtvar==2 then
				lines_copied="Help!"
				managers.hud:show_hint({text = "Help!"})
			elseif gtvar==3 then
				lines_copied="Nope."
				managers.hud:show_hint({text = "Nope."})
			end
			Press2Text:group_check(1)
		end
	end

---------------------------------------------------Group2
	Press2Text.group2 = function(self)
		if Utils:IsInHeist() and Utils:IsInGameState() then
			if gtvar==nil or gtvar>6 or group2checked~=true then
				gtvar=1
			end
			if gtvar==1 then
				lines_copied="I need a medic bag please!"
				managers.hud:show_hint({text = "I need a medic bag please!"})
			elseif gtvar==2 then
				lines_copied="Need an Ammo Bag please!"
				managers.hud:show_hint({text = "Need an Ammo Bag please!"})
			elseif gtvar==3 then
				lines_copied="Need a First Aid Kit please!"
				managers.hud:show_hint({text = "Need a First Aid Kit please!"})
			elseif gtvar==4 then
				lines_copied="Medic Bag here!"
				managers.hud:show_hint({text = "Medic Bag here!"})
			elseif gtvar==5 then
				lines_copied="Ammo Bag here!"
				managers.hud:show_hint({text = "Ammo Bag here!"})
			elseif gtvar==6 then
				lines_copied="First Aid Kit here!"
				managers.hud:show_hint({text = "First Aid Kit here!"})
			end
			Press2Text:group_check(2)
		end
	end

---------------------------------------------------Group3
	Press2Text.group3 = function(self)
		if Utils:IsInHeist() and Utils:IsInGameState() then
			if gtvar==nil or gtvar>8 or group3checked~=true then
				gtvar=1
			end
			if gtvar==1 then
				lines_copied="Bulldozer!"
				managers.hud:show_hint({text = "Bulldozer!"})
			elseif gtvar==2 then
				lines_copied="Cloaker!"
				managers.hud:show_hint({text = "Cloaker!"})
			elseif gtvar==3 then
				lines_copied="Taser!"
				managers.hud:show_hint({text = "Taser!"})
			elseif gtvar==4 then
				lines_copied="Medic!"
				managers.hud:show_hint({text = "Medic!"})
			elseif gtvar==5 then
				lines_copied="Sniper!"
				managers.hud:show_hint({text = "Sniper!"})
			elseif gtvar==6 then
				lines_copied="Shield!"
				managers.hud:show_hint({text = "Shield!"})
			elseif gtvar==7 then
				lines_copied="Swat Van Turret!"
				managers.hud:show_hint({text = "Swat Van Turret!"})
			elseif gtvar==8 then
				lines_copied="Captain Winter!"
				managers.hud:show_hint({text = "Captain Winter!"})
			end
			Press2Text:group_check(3)
		end
	end

---------------------------------------------------Group4
	Press2Text.group4 = function(self)
		if Utils:IsInHeist() and Utils:IsInGameState() then
			if gtvar==nil or gtvar>3 or group4checked~=true then
				gtvar=1
			end
			if gtvar==1 then
				lines_copied="Add Muriatic Acid."
				managers.hud:show_hint({text = "Muriatic Acid"})
			elseif gtvar==2 then
				lines_copied="Add Caustic Soda."
				managers.hud:show_hint({text = "Caustic Soda"})
			elseif gtvar==3 then
				lines_copied="Add Hydrogen Chloride"
				managers.hud:show_hint({text = "Hydrogen Chloride"})
			end
			Press2Text:group_check(4)
		end
	end

---------------------------------------------------Group5
	Press2Text.group5 = function(self)
		if Utils:IsInHeist() and Utils:IsInGameState() then
			if gtvar==nil or gtvar>6 or group5checked~=true then
				gtvar=1
			end
			if gtvar==1 then
				lines_copied="Drill in place."
				managers.hud:show_hint({text = "Drill placed"})
			elseif gtvar==2 then
				lines_copied="The drill is jammed."
				managers.hud:show_hint({text = "Drill stuck."})
			elseif gtvar==3 then
				lines_copied="The thermal drill is broken."
				managers.hud:show_hint({text = "Thermal drill broken."})
			elseif gtvar==4 then
				lines_copied="The computer is stuck."
				managers.hud:show_hint({text = "Computer stuck."})
			elseif gtvar==5 then
				lines_copied="Defend the power."
				managers.hud:show_hint({text = "Defend power."})
			elseif gtvar==6 then
				lines_copied="Reactivate the power."
				managers.hud:show_hint({text = "Reactivate power."})
			end
			Press2Text:group_check(5)
		end
	end

---------------------------------------------------Group6
	Press2Text.group6 = function(self)
		if Utils:IsInHeist() and Utils:IsInGameState() then
			if gtvar==nil or gtvar>4 or group6checked~=true then
				gtvar=1
			end
			if gtvar==1 then
				lines_copied="Guard over here!"
				managers.hud:show_hint({text = "Guard!"})
			elseif gtvar==2 then
				lines_copied="Camera over there!"
				managers.hud:show_hint({text = "Camera!"})
			elseif gtvar==3 then
				lines_copied="ECM jammer placed!"
				managers.hud:show_hint({text = "ECM placed"})
			elseif gtvar==4 then
				lines_copied="Someone please kill the camera guard!"
				managers.hud:show_hint({text = "Kill camera guard"})
			end
			Press2Text:group_check(6)
		end
	end

---------------------------------------------------Menu loader
	MenuHelper:LoadFromJsonFile(Press2Text._path .. "menu/menu.txt", Press2Text, Press2Text._data)
end)

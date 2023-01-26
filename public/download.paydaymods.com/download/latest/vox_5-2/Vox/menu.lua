if not Vox then
	_G.Vox = {}
	Vox.data = {}
	Vox.data.ids = {}
	Vox.path = ModPath
	Vox.savesPath = SavePath
	
	--Save menu data
	function Vox:SaveMenu()
		local file = io.open(self.savesPath .. "vox.json", "w+")
		if file then
			file:write(json.encode(Vox.data))
			file:close()
		end
	end

	--Load menu data
	function Vox:LoadMenu()
		local file = io.open(self.savesPath .. "vox.json", "r")
		if file then
			Vox.data = json.decode(file:read("*all"))
			file:close()
		end
	end
	
	function Vox:addBind(voice_id)
		if not Vox.data.ids then
			Vox.data.ids = {}
		end
		
		table.insert(Vox.data.ids, voice_id)
		
		local mod = BLT.Mods:GetModOwnerOfFile(Vox.path .. "/menu.lua")
		local params = {
			id = "vox_" .. voice_id,
			allow_menu = false,
			allow_game = true,
			show_in_menu = true,
			name = voice_id,
			desc = "",
			localize = false,
			callback = function() Vox.Speak(voice_id) end
		}
		
		BLT.Keybinds:register_keybind(mod, params)	
		
		Vox:SaveMenu()
	end
	
	function Vox:removeBindByIndex(index)
		table.remove(Vox.data.ids, index)
		
		Vox:SaveMenu()
	end
	
	function Vox:TextInputEntered(value)
	
		Vox:addBind(value)
			
		QuickMenu:new("Bind added", "Keybind for " .. value .. " added!", {
			[1] = {
				text = "OK",
				is_cancel_button = true
			}
		}):show()
		
	end
	
	function Vox.Speak(voice_id)
		if Utils:IsInHeist() and Utils:IsInCustody() == false and Utils:IsInGameState() then
			managers.player:local_player():sound():say(voice_id, true, true)
		end
	end
	
	Vox:LoadMenu()
end

Hooks:Add("MenuManagerInitialize", "Vox_InitCallbacks", function(menu_manager)

	MenuCallbackHandler.vox_add_id = function(self, input)
		BeardLib.managers.dialog:Input():Show({
                title = "Enter a voice ID to add.", 
                text = "",
                filter = "string",
                callback = callback(Vox, Vox, "TextInputEntered")
        })
	end
	
	--This is ugly, but it's the only way around the lack of data binding for buttons
	for i, voice_id in pairs(Vox.data.ids) do
		MenuCallbackHandler["vox_remove_" .. voice_id] = function(self, input)
			Vox:removeBindByIndex(i)
			
			--Replaces current function with an empty one, to prevent removing the same index multiple times
			MenuCallbackHandler["vox_remove_" .. voice_id] = function() end
			
			QuickMenu:new("Bind removed", "Keybind for " .. voice_id .. " removed. Changes will not be visible until the next restart/loading screen.", {
				[1] = {
					text = "OK",
					is_cancel_button = true
				}
			}):show()
		end
	end
	
	MenuHelper:LoadFromJsonFile(Vox.path .. "voxmenu.json", Vox, Vox.data)
end)

Hooks:Add("MenuManagerPopulateCustomMenus", "Vox_PopulateMenu", function(menu_manager, nodes)

    if Vox.data.ids then
		for i, voice_id in pairs(Vox.data.ids) do
			
			local mod = BLT.Mods:GetModOwnerOfFile(Vox.path .. "/menu.lua")
			local params = {
				id = "vox_" .. voice_id,
				allow_menu = false,
				allow_game = true,
				show_in_menu = true,
				name = voice_id,
				desc = "",
				localize = false,
				callback = function() Vox.Speak(voice_id) end
			}
			
			BLT.Keybinds:register_keybind(mod, params)
			
			--Keybind removal button
			MenuHelper:AddButton({
				id = "vox_remove_" .. voice_id,
				title = "Remove " .. voice_id,
				desc = "Remove " .. voice_id .. " from the list of binds.",
				menu_id = "vox_menu",
				localized = false, --BLT seems to ignore this option for descriptions?
				callback = "vox_remove_" .. voice_id
			})
			
		end
	end

end)
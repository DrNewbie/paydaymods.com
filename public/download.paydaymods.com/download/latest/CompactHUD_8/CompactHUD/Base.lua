_G.CompactHUD = _G.CompactHUD or {}
CompactHUD.mod_path = ModPath
CompactHUD._data_path = SavePath .. "CompactHUD.txt"
CompactHUD.options = CompactHUD.options or {} 
CompactHUD.options_menu = "CompactHUD_options"
CompactHUD.hook_files = {
    ["lib/managers/hud/hudteammate"] = "hud/hudteammate.lua",
    ["lib/managers/hud/hudtemp"] = "hud/hudtemp.lua",
    ["lib/managers/hudmanager"] = "hud/hudmanager.lua",
    ["lib/managers/hud/hudchat"] = "hud/hudchat.lua",
    ["lib/managers/hudmanagerpd2"] = "hud/hudmanager.lua"
}
function CompactHUD:Save()
	local file = io.open( self._data_path, "w+" )
	if file then
		file:write( json.encode( self.options ) )
		file:close()
	end
end
function CompactHUD:ShowCustomColor(hide)
	local panel = managers.menu:active_menu().renderer.safe_rect_panel 
	local currnet_color = panel:child("CustomColor") or panel:rect({name = "CustomColor"})	
	
	currnet_color:configure({
		w = 420, 
		h = 25,
        visible = hide ~= false,
		color = Color(self.options.custom_color_r, self.options.custom_color_g, self.options.custom_color_b)
	})
    currnet_color:set_rightbottom(panel:right(), panel:bottom() - 365)
end
function CompactHUD:Load()
	local file = io.open( self._data_path, "r" )
	if file then
		self.options = json.decode( file:read("*all") )
		file:close()
	end
end
function CompactHUD:UpdateGame()
	self.colors[11].color = Color(self.options.custom_color_r, self.options.custom_color_g, self.options.custom_color_b)
	self.line_color = self.colors[self.options.line_color].color
	self.bg_alpha = self.options.bg_alpha 
	self.bg_color = self.colors[self.options.bg_color].color
	self.tm_cableties = self.options.tm_cableties
	self.tm_nades = self.options.tm_nades
	self.scale = self.options.hud_scale
	self.text_color = self.colors[self.options.text_color].color
	if managers.hud then
		for i=1, managers.hud.PLAYER_PANEL do
			managers.hud._teammate_panels[i]:UpdateSettings()
		end
        if managers.hud._hud_temp.UpdateSettings then
            managers.hud._hud_temp:UpdateSettings()
        end
	end	
end
if not CompactHUD.setup then
	CompactHUD.colors = { --You can add new ones
		{color = Color(0 ,0.4 ,1 ), menu_name = "Blue"},  	 
		{color = Color(0 ,1 ,0.4 ), menu_name = "Green"},	  	 
		{color = Color(1 ,1 ,1 ), menu_name = "White"},	  	 
		{color = Color(0 ,0 ,0 ), menu_name = "Black"},	  	 
		{color = Color(1 ,0.5 ,0 ), menu_name = "Orange"},	  	 
	 	{color = Color(1 ,0 ,0.6 ), menu_name = "Pink"},	  	 
		{color = Color(0.6 ,0 ,0.6 ), menu_name = "Purple"},	  	
		{color = Color(0.15, 0.15, 0.15), menu_name = "Grey"},	  	
		{color = Color(1, 0.1, 0), menu_name = "Red"},		 
		{color = Color(0, 0.9, 0.5), menu_name = "Spring Green"},
		{color = Color(1,1,1), menu_name = "Custom"},
	}
	for k, v in pairs(CompactHUD.options) do
		if k:match("color") and type(v) == "number" and v > #CompactHUD.colors then
			CompactHUD.options[k] = #CompactHUD.colors	
		end
	end	
	CompactHUD:Load()
	CompactHUD.options.Defaults = {
		line_color = 1,
		bg_alpha = 0.4,
		downed_counter = true,
		fireselector = true,
		tm_nades = false,
		true_ammototal = false,
		tm_cableties = true,
		bg_color = 4,
		hud_scale = 1,
		text_color = 3,
		custom_color_r = 1,
		custom_color_g = 1,
		custom_color_b = 1,
	}
	for option, value in pairs(CompactHUD.options.Defaults) do
		if CompactHUD.options[option] == nil then
			CompactHUD.options[option] = value
		end
	end	
	CompactHUD:Save()
	CompactHUD:UpdateGame()
	CompactHUD:Load()
	CompactHUD.setup = true
end

local CompactHUD_Colors = {}	
Hooks:Add("LocalizationManagerPostInit", "CompactHUD_loc", function(loc)
	LocalizationManager:add_localized_strings({
	    ["CompactHUD_options_title"] = "Compacthud options",
	    ["CompactHUD_options_desc"] = "Customize compacthud",
	    ["line_color_title"] = "Line color",
	    ["line_color_desc"] = "The color of the line in some backgrounds",	   	       	    
	    ["bg_alpha_title"] = "Background alpha",
	    ["bg_alpha_desc"] = "The alpha(transparency) of the main hud background",	   	    
	    ["bg_color_title"] = "Background color",
	    ["bg_color_desc"] = "The color of the main hud background",	   	       
	    ["show_tm_nades_title"] = "Show teammates throwables",	   	
	    ["show_tm_nades_desc"] = "If enabled this will add an icon near teammates name showing amount of throwables they have",	  	    
	    ["show_tm_cableties_title"] = "Show teammates cable ties",	   	
	    ["show_tm_cableties_desc"] = "If enabled this will add an icon near teammates name showing amount of cable ties they have",	   	
	    ["true_ammototal_title"] = "true ammo total",	   	
	    ["true_ammototal_desc"] = "Changes the total ammo to show only total ammo and not total + clip ammo",	   	
	    ["compact_text_color"] = "Hud text color",	   	
	    ["compact_text_color_desc"] = "",		    
	    ["compact_hud_scale"] = "Hud scale",	   	
	    ["compact_hud_scale_desc"] = "",	   	
	    ["compact_custom_color_r"] = "Custom color red",	   	
	    ["compact_custom_color_r_desc"] = "",	   		    
	    ["compact_custom_color_g"] = "Custom color green",	   	
	    ["compact_custom_color_g_desc"] = "",	   		   
	    ["compact_custom_color_b"] = "Custom color blue",	   	
	    ["compact_custom_color_b_desc"] = "",	   		   
	    ["compact_reset"] = "Reset saved options",	   	
        ["compact_reset_desc"] = "Reset all saved options to default.",     
  	})
  	for k, v in pairs(CompactHUD.colors) do
		LocalizationManager:add_localized_strings({
			["CompactHUDcolor"..k] = v.menu_name,
		})  	  
	  	table.insert(CompactHUD_Colors, "CompactHUDcolor"..k)
  	end
end)

Hooks:Add("MenuManagerSetupCustomMenus", "MenuManagerSetupCustomMenusCompactHUD", function( menu_manager, nodes )
	MenuHelper:NewMenu( CompactHUD.options_menu )
end)

Hooks:Add("MenuManagerPopulateCustomMenus", "MenuManagerPopulateCustomMenusCompactHUD", function( menu_manager, nodes )
 	 MenuCallbackHandler.compact_value_clbk = function(self, item)
		CompactHUD.options[item._parameters.name:gsub("compact_", "")] = item:value()
		CompactHUD:Save()
		CompactHUD:UpdateGame()		
		CompactHUD:ShowCustomColor()
    end      			
	MenuCallbackHandler.compact_toggle_clbk = function(self, item)
		CompactHUD.options[item._parameters.name:gsub("compact_", "")] = (item:value() == "on" and true or false)
		CompactHUD:Save()
		CompactHUD:UpdateGame()
	end				
	MenuCallbackHandler.compact_reset = function(self, item)
		local menu = MenuHelper:GetMenu( CompactHUD.options_menu )
		for _, item in pairs(menu._items_list) do
			MenuHelper:ResetItemsToDefaultValue( item, {[item._parameters.name] = true}, CompactHUD.options.Defaults[item._parameters.name:gsub("compact_", "")] )
		end
	end		
    MenuHelper:AddMultipleChoice({
        id = "line_color",
        title = "line_color_title",
        desc = "line_color_desc",
        callback = "compact_value_clbk",
        items = CompactHUD_Colors,
        menu_id = CompactHUD.options_menu,
        value = CompactHUD.options.line_color,
        priority = 999,
    })      		
	MenuHelper:AddMultipleChoice({
		id = "bg_color",
		title = "bg_color_title",
		desc = "bg_color_desc",
		callback = "compact_value_clbk",
		items = CompactHUD_Colors,
		menu_id = CompactHUD.options_menu,
		value = CompactHUD.options.bg_color,
		priority = 995,
	})			
	MenuHelper:AddMultipleChoice({
		id = "compact_text_color",
		title = "compact_text_color",
		desc = "compact_text_color_desc",
		callback = "compact_value_clbk",
		items = CompactHUD_Colors,
		menu_id = CompactHUD.options_menu,
		value = CompactHUD.options.text_color,
		priority = 995,
	})		
    MenuHelper:AddSlider({
        id = "bg_alpha",
        title = "bg_alpha_title",
        desc = "bg_alpha_desc",
        callback = "compact_value_clbk",
        value = CompactHUD.options.bg_alpha,
        min = 0,
        max = 1,
        step = 0.5,
        show_value = true,
        menu_id = CompactHUD.options_menu,
        priority = 990  
	})    
	MenuHelper:AddSlider({
        id = "compact_hud_scale",
        title = "compact_hud_scale",
        desc = "compact_hud_scale_desc",
        callback = "compact_value_clbk",
        value = CompactHUD.options.hud_scale,
        min = 0.4,
        max = 2,
        step = 0.5,
        show_value = true,
        menu_id = CompactHUD.options_menu,
        priority = 990  
	})
	MenuHelper:AddToggle({
		id = "show_tm_nades",
		title = "show_tm_nades_title",
		desc = "show_tm_nades_desc",
		callback = "compact_toggle_clbk",
		menu_id = CompactHUD.options_menu,
		value = CompactHUD.options.tm_nades,
		priority = 975,
	})	  	
	MenuHelper:AddToggle({
		id = "show_tm_cableties",
		title = "show_tm_cableties_title",
		desc = "show_tm_cableties_desc",
		callback = "compact_toggle_clbk",
		menu_id = CompactHUD.options_menu,
		value = CompactHUD.options.tm_cableties,
		priority = 970,
	})	 	
	MenuHelper:AddToggle({
		id = "true_ammototal",
		title = "true_ammototal_title",
		desc = "true_ammototal_desc",
		callback = "compact_toggle_clbk",
		menu_id = CompactHUD.options_menu,
		value = CompactHUD.options.true_ammototal,
		priority = 965,
	})	     
	MenuHelper:AddSlider({
        id = "compact_custom_color_r",
        title = "compact_custom_color_r",
        desc = "compact_custom_color_r_desc",
        callback = "compact_value_clbk",
        value = CompactHUD.options.custom_color_r,
        min = 0,
        max = 1,
        step = 0.5,
        show_value = true,
        menu_id = CompactHUD.options_menu,
        priority = 960  
	})		
	MenuHelper:AddSlider({
        id = "compact_custom_color_g",
        title = "compact_custom_color_g",
        desc = "compact_custom_color_g_desc",
        callback = "compact_value_clbk",
        value = CompactHUD.options.custom_color_g,
        min = 0,
        max = 1,
        step = 0.5,
        show_value = true,
        menu_id = CompactHUD.options_menu,
        priority = 955  
	})			
	MenuHelper:AddSlider({
        id = "compact_custom_color_b",
        title = "compact_custom_color_b",
        desc = "compact_custom_color_b_desc",
        callback = "compact_value_clbk",
        value = CompactHUD.options.custom_color_b,
        min = 0,
        max = 1,
        step = 0.5,
        show_value = true,
        menu_id = CompactHUD.options_menu,
        priority = 950 
	})			
	MenuHelper:AddDivider({
	    id = "compact_divider_reset_button",
	    size = 48,
	    menu_id = CompactHUD.options_menu,
	    priority = 945,
	})
	MenuHelper:AddButton({
        id = "compact_reset",
        title = "compact_reset",
        desc = "compact_reset_desc",
        callback = "compact_reset",
        menu_id = CompactHUD.options_menu,
        priority = 940 
	})		
end)

Hooks:Add("MenuManagerBuildCustomMenus", "MenuManagerBuildCustomMenusCompactHUD", function(menu_manager, nodes)
	nodes[CompactHUD.options_menu] = MenuHelper:BuildMenu( CompactHUD.options_menu, {back_callback =  callback(CompactHUD, CompactHUD, "ShowCustomColor", false)})
	MenuHelper:AddMenuItem( MenuHelper.menus.lua_mod_options_menu, CompactHUD.options_menu, "CompactHUD_options_title", "CompactHUD_options_desc", 1 )
	table.insert(MenuHelper.menus.lua_mod_options_menu._items[1]._parameters.callback, callback(CompactHUD, CompactHUD, "ShowCustomColor"))
end)
 
if RequiredScript then
	local requiredScript = RequiredScript:lower()
	if CompactHUD.hook_files[requiredScript] then
		dofile( ModPath .. CompactHUD.hook_files[requiredScript] )
	end
end
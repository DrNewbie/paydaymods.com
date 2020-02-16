_G.DGC = _G.DGC or {}

DGC.save_data_path = SavePath .. "DefaultGadgetColors.txt"
DGC.mod_path = ModPath

--todo find better colors for this

DGC.settings = {
--i hate you hsv you're not my real mom get out of my life
	laser_r = 0.75,
	laser_g = 0.1,
	laser_b = 0.6,
	
	flash_r = 0.47,
	flash_g = 0.52,
	flash_b = 0.73,

	sight_color = 1, --red
	sight_type = 3	--dot 3 (large)
}

function DGC:GetSettings()
	DGC:Load()
	return DGC.settings
end

function DGC:GetSightColor()
	return DGC.settings.sight_color or 1
end

function DGC:GetSightType()
	return DGC.settings.sight_type or 3
end

function DGC:GetLaserColor()
	return Color(DGC.settings.laser_r,DGC.settings.laser_g,DGC.settings.laser_b)
end

function DGC:GetFlashlightColor()
	return Color(DGC.settings.flash_r,DGC.settings.flash_g,DGC.settings.flash_b)
end


function DGC:Load()
	
	local file = io.open(self.save_data_path, "r")
	if (file) then
		for k, v in pairs(json.decode(file:read("*all"))) do
			self.settings[k] = v
		end
	else
		DGC:Save()
	end
end

function DGC:Save()
	local file = io.open(self.save_data_path,"w+")
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end

	
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_DefaultGadgetColors", function( loc )
	loc:load_localization_file( DGC.mod_path .. "en.txt")
end)
	
	
Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_DefaultGadgetColors", function(menu_manager)
				

		MenuCallbackHandler.callback_dgc_laser_r_slider = function(self,item)
			DGC.settings.laser_r = item:value()
			DGC:Save()
		end
				
		MenuCallbackHandler.callback_dgc_laser_g_slider = function(self,item)
			DGC.settings.laser_g = item:value()
			DGC:Save()
		end

		MenuCallbackHandler.callback_dgc_laser_b_slider = function(self,item)
			DGC.settings.laser_b = item:value()
			DGC:Save()
		end
		
		MenuCallbackHandler.callback_dgc_flash_r_slider = function(self,item)
			DGC.settings.flash_r = item:value()
			DGC:Save()
		end
				
		MenuCallbackHandler.callback_dgc_flash_g_slider = function(self,item)
			DGC.settings.flash_g = item:value()
			DGC:Save()
		end

		MenuCallbackHandler.callback_dgc_flash_b_slider = function(self,item)
			DGC.settings.flash_b = item:value()
			DGC:Save()
		end

	
		MenuCallbackHandler.callback_dgc_sight_type_multiplechoice = function(self,item)
			DGC.settings.sight_type = tonumber(item:value())
			DGC:Save()
		end
		
		MenuCallbackHandler.callback_dgc_sight_color_multiplechoice = function(self,item)
			DGC.settings.sight_color = tonumber(item:value())
			DGC:Save()
		end
			
		
		MenuCallbackHandler.callback_dgc_close = function(this) --not actually used, i think
			DGC:Save()
		end
		
		DGC:Load()
		MenuHelper:LoadFromJsonFile(DGC.mod_path .. "options.txt", DGC, DGC.settings)
		
	end )

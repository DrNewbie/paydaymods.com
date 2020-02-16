_G.LasersPlus = _G.LasersPlus or {}
local Lasers = Lasers or _G.LasersPlus
--[[
Lasers._path = ModPath
Lasers._datapath = Lasers._data_path or SavePath .. "lasersplus.txt"
--Lasers._data = Lasers._data or Lasers.settings or {}
--]]
--************WORLD LASERS************
CloneClass( ElementLaserTrigger )

Hooks:RegisterHook("ElementLaserTriggerPostInit")
function ElementLaserTrigger.init(self, ...)
	if self and self.orig then
		self.orig.init(self, ...)
		Hooks:Call("ElementLaserTriggerPostInit", self)
	end
end

Hooks:RegisterHook("ElementLaserTriggerUpdateDraw")
function ElementLaserTrigger.update_laser_draw(self, t, dt)
	if self and self.orig then
		self.orig.update_laser_draw(self, t, dt)
		Hooks:Call("ElementLaserTriggerUpdateDraw", self, t, dt)
	end
end

Hooks:Add("ElementLaserTriggerPostInit", "ElementLaserTriggerPostInit_LasersPlus", function(laser)
	Lasers._world_strobe = Lasers:init_strobe(Lasers.world_strobe)
	laser._t = 1
	if Lasers:IsEnabled() then 
		if laser and laser._brush then 
			if Lasers:IsWorldInvisible() then
				laser._brush:set_color(Lasers.col_invisible)
				return
			end
			laser._brush:set_color(Lasers:GetWorldLaserColor())
		end
	end
end)


Hooks:Add("ElementLaserTriggerUpdateDraw", "ElementLaserTriggerUpdateDraw_LasersPlus", function(laser, t, dt)
--	lp_log("World display mode: " .. tostring(Lasers:GetWorldDisplayMode()))
--	local select_gradient
	if Lasers:IsEnabled() and laser and laser._brush then 
		if Lasers:IsWorldInvisible() then
			laser._brush:set_color(Lasers.col_invisible)
			return
		elseif Lasers:IsWorldCustom() and not Lasers:IsWorldStrobeEnabled() then
			color = Lasers:GetWorldLaserColor()
			laser._brush:set_color(color)		
			return	
		elseif Lasers:IsWorldCustom() and Lasers:IsWorldStrobeEnabled() then --fix this
			laser._t = laser._t or 1
			laser._t = laser._t + Lasers.settings.override_speed
			if laser._t / Lasers:GetLaserQuality() == math.floor(laser._t / Lasers:GetLaserQuality()) then
	--			lp_log("Skipping this world laser frame")
				return
			end

		
		--[[
			if Lasers:GetWorldGradientMode() == 2 then
				select_gradient = Lasers.default_strobe
			else
				select_gradient = Lasers.default_strobe--Lasers.mode_list[Lasers:GetWorldGradientMode()]
			end
	--		color = GradientStep(t,select_gradient, Lasers.default_gradient_speed) --]]
	--		color = Color(math.random(255),math.random(255),math.random(255))
			color = Lasers:StrobeStep(Lasers:GetWorldStrobe(),false)
			if color then
				laser._brush:set_color( color )
				return
			end
			
			lp_log ("World Laser: Failed to create color.")
			return
		elseif Lasers:IsWorldVanilla() then --if vanilla
			laser._brush:set_color(Color(0.6,0,0):with_alpha(1))
	--		laser._brush:set_color(Lasers:GetWorldLaserColor())
			return
		end
	end
end)
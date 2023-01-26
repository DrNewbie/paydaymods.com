_G.LasersPlus = _G.LasersPlus or {}
local Lasers = Lasers or _G.LasersPlus

--[[
local check_state_orig = WeaponFlashLight._check_state
function WeaponFlashLight:_check_state(current_state)
--	local color = Lasers:ConvertToBLTColor(self._light:color())
	check_state_orig(self,current_state)
	Lasers:SaveGadgetVanillaColor(self._unit,Lasers:ConvertToBLTColor(self:color()))
end
--]]

local flash_cbk = WeaponFlashLight.init
function WeaponFlashLight:init(unit)
	flash_cbk(self, unit)
	local angle = Lasers:GetFlashlightAngle()
	local range = Lasers:GetFlashlightRange() * 100
	self._light:set_spot_angle_end(angle)
	self._light:set_far_range(range)
end


Hooks:PostHook(WeaponFlashLight,"_check_state","weaponflashlight_checkstate_lp",function(self,current_state)
	local color = Lasers:ConvertToBLTColor(self:color())
	Lasers:SaveGadgetVanillaColor(self._unit,color)
end)

function WeaponFlashLight:update(unit, t, dt)
	if Lasers:IsEnabled() then
		if not self._is_npc then
			if Lasers:IsOwnFlashlightCustom() then			
				if Lasers:IsOwnFlashlightStrobeEnabled() then
					color = Lasers:StrobeStep(Lasers:GetOwnFlashlightStrobe())
				else
					color = Lasers:GetOwnFlashlightColor()
				end
			elseif Lasers:IsOwnFlashlightVanilla() then
				color = Lasers:GetTeammateVanillaColor(unit)
			end
			self:set_color(color)
		else
			if Lasers:IsTeamFlashlightCustom() then			
				if Lasers:IsTeamFlashlightStrobeEnabled() then
					color = Lasers:StrobeStep(Lasers:GetNPCFlashlightStrobe())
				else
					color = Lasers:GetTeamFlashlightColor()
				end
			elseif Lasers:IsTeamFlashlightVanilla() then
				color = Lasers:GetTeammateVanillaColor(unit)
			elseif Lasers:IsTeamFlashlightInvisible() then
				color = Lasers.col_invisible
			elseif Lasers:IsTeamFlashlightPeerColor() then
				color = Lasers.col_generic --i'll do this later probably
			end
			self:set_color(color)
		end
		if Lasers.flag_update_flashlight then 
			local angle = Lasers:GetFlashlightAngle()
			local range = Lasers:GetFlashlightRange() * 100
			self._light:set_spot_angle_end(angle)
			self._light:set_far_range(range)
			Lasers.flag_update_flashlight = false
		end
	end
end

--may as well replace this whole function
function WeaponFlashLight:set_color(color)
	if self:is_haunted() then
		return
	end

	if not color then
		return
	end
	local a = Lasers:GetFlashlightGlowAlpha() or WeaponFlashLight.EFFECT_OPACITY_MAX --SORRY, WHAT DID YOU SAY, OVERKILL? I CAN'T HEAR YOU! YOU SHOULD TRY TYPING LOUDER!
	local opacity_ids = Idstring("opacity")
	local col_vec = Vector3(color.r, color.g, color.b)

	self._light:set_color(col_vec)

	if self._is_npc then
		World:effect_manager():set_simulator_var_float(self._light_effect, Idstring("glow base camera r"), opacity_ids, opacity_ids, color.r * WeaponFlashLight.NPC_GLOW_OPACITY_MAX)
		World:effect_manager():set_simulator_var_float(self._light_effect, Idstring("glow base camera g"), opacity_ids, opacity_ids, color.g * WeaponFlashLight.NPC_GLOW_OPACITY_MAX)
		World:effect_manager():set_simulator_var_float(self._light_effect, Idstring("glow base camera b"), opacity_ids, opacity_ids, color.b * WeaponFlashLight.NPC_GLOW_OPACITY_MAX)
		World:effect_manager():set_simulator_var_float(self._light_effect, Idstring("lightcone r"), opacity_ids, opacity_ids, color.r * WeaponFlashLight.NPC_CONE_OPACITY_MAX)
		World:effect_manager():set_simulator_var_float(self._light_effect, Idstring("lightcone g"), opacity_ids, opacity_ids, color.g * WeaponFlashLight.NPC_CONE_OPACITY_MAX)
		World:effect_manager():set_simulator_var_float(self._light_effect, Idstring("lightcone b"), opacity_ids, opacity_ids, color.b * WeaponFlashLight.NPC_CONE_OPACITY_MAX)
	else
		local r_ids = Idstring("red")
		local g_ids = Idstring("green")
		local b_ids = Idstring("blue")

		World:effect_manager():set_simulator_var_float(self._light_effect, r_ids, r_ids, opacity_ids, color.r * a)
		World:effect_manager():set_simulator_var_float(self._light_effect, g_ids, g_ids, opacity_ids, color.g * a)
		World:effect_manager():set_simulator_var_float(self._light_effect, b_ids, b_ids, opacity_ids, color.b * a)
	end
end

--[[
local color = Color.white --Color of beam (default Color.white)
--local color = Vector3(1, 0.5, 0.5) --Custom vector color beam color example (red)
local angle = 80 --Angle/width of beam, 0-160 (default 60)
local range = 2000 --Range of beam, 0+ (default 1000 -> 10m) --2750

--]]

--[[
Hooks:PostHook( WeaponFlashLight, "init", function(self, unit)
	Lasers._npc_flashlight_strobe = Lasers:init_strobe(npc_flashlight_strobe)
	Lasers._own_flashlight_strobe = Lasers:init_strobe(_own_flashlight_strobe)
end)
--]]

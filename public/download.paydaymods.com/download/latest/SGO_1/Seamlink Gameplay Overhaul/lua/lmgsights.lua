if not SGO or not SGO.settings.use_lmgs2 then return end
if SystemFS:exists("mods/Steelsights/mod.txt") then return end
--[[
Translation variables are interpreted as (lateral, depth, vertical)
Rotation variables are rotated along the above axis.

Modifying shoulder variables typically move the gun without disrupting where the point of aim should be, but can cause parts of the model to block the point of aim.
Modifying head variables will usually cause the gun model to no longer represent the point of aim properly, so be especially careful modifying these variables.

Modifying any uncommented variables is not recommended, the only one of note is overshot which could be construed as cheating if modified.
Other uncommented variables will typically have unexpected effects if directly modified.
--]]
	-- BRENNER
local default_init_hk21 = PlayerTweakData._init_hk21
function PlayerTweakData:_init_hk21()
    default_init_hk21(self)
	local pivot_shoulder_translation = Vector3(8.59464, 11.3996, -3.26142)
	local pivot_shoulder_rotation = Rotation(7.08051E-6, 0.00559065, 3.07211E-4)     
	local pivot_head_translation = Vector3(0, 10, 0) -- 8, 10, -1
	local pivot_head_rotation = Rotation(0, 0, 0) -- 0.2, 0.2, -8
	self.stances.hk21.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.hk21.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

-- KSP
local default_init_m249 = PlayerTweakData._init_m249
function PlayerTweakData:_init_m249()
    default_init_m249(self)
	local pivot_shoulder_translation = Vector3(10.7806, 4.38612, -0.718837)
	local pivot_shoulder_rotation = Rotation(0.106596, -0.0844502, 0.629187)    
	local pivot_head_translation = Vector3(0, 12, 0) -- 10, 12, -2
	local pivot_head_rotation = Rotation(0, 0, 0) -- 0, 0, -5
	self.stances.m249.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.m249.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end


-- RPK
local default_init_rpk = PlayerTweakData._init_rpk
function PlayerTweakData:_init_rpk()
    default_init_rpk(self)
	local pivot_shoulder_translation = Vector3(10.6725, 27.7166, -4.93564)
	local pivot_shoulder_rotation = Rotation(0.1067, -0.0850111, 0.629008)
	local pivot_head_translation = Vector3(0, 28, 0)  -- 6, 30, -1
	local pivot_head_rotation = Rotation(0, 0, 0)  -- 0, 0, -5
	self.stances.rpk.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.rpk.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end


-- BUZZSAW
local default_init_mg42 = PlayerTweakData._init_mg42
function PlayerTweakData:_init_mg42()
    default_init_mg42(self)
	local pivot_shoulder_translation = Vector3(10.713, 47.8277, 0.873785)
	local pivot_shoulder_rotation = Rotation(0.10662, -0.0844545, 0.629209)
	local pivot_head_translation = Vector3(0, 40, 0)  -- default = 3,40,-2
	local pivot_head_rotation = Rotation(0, 0, 0)      -- default = 0, 0, -2
	self.stances.mg42.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.mg42.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end


--M240
local default_init_par = PlayerTweakData._init_par
function PlayerTweakData:_init_par()
    default_init_par(self)
        local pivot_shoulder_translation = Vector3(10, 4, -4)
        local pivot_shoulder_rotation = Rotation(0.106596, -0.0844502, 0.629187)    
        local pivot_head_translation = Vector3(0, 12, 0) -- 10, 12, -2
        local pivot_head_rotation = Rotation(0, 0, 0) -- 0, 0, -5
        self.stances.par.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
        self.stances.par.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end
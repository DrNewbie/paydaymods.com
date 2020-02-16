local default_init_galil = PlayerTweakData._init_galil
function PlayerTweakData:_init_galil(...)
    default_init_galil(self,...)
	local pivot_shoulder_translation = Vector3(10.6632, 22.0834, -3.76603)
	local pivot_shoulder_rotation = Rotation(0.106684, -0.084986, 0.628584)
	local pivot_head_translation = Vector3(0, 8, 0)	
	local pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.galil.bipod = {
		shoulders = {},
		vel_overshot = {}
	}
	self.stances.galil.bipod.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.galil.bipod.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.galil.bipod.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, -30, 0)
	self.stances.galil.bipod.vel_overshot.yaw_neg = 0
	self.stances.galil.bipod.vel_overshot.yaw_pos = 0
	self.stances.galil.bipod.vel_overshot.pitch_neg = 0
	self.stances.galil.bipod.vel_overshot.pitch_pos = 0	
	self.stances.galil.bipod.FOV = 50
	self.stances.galil.bipod.shakers = {breathing = {}}	
	self.stances.galil.bipod.shakers.breathing.amplitude = 0
end

local default_init_m95 = PlayerTweakData._init_m95
function PlayerTweakData:_init_m95(...)
    default_init_m95(self,...)

	local pivot_shoulder_translation = Vector3(12.8734, 21.463, -2.5494)
	local pivot_shoulder_rotation = Rotation(0.113234, 0.518279, 0.627416)
	local pivot_head_translation = Vector3(0, 0, 0)	
	local pivot_head_rotation = Rotation(0, 0, 0)
		self.stances.m95.bipod = {
		shoulders = {},
		vel_overshot = {}
	}
	self.stances.m95.bipod.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.m95.bipod.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.m95.bipod.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, -30, 0)
	self.stances.m95.bipod.vel_overshot.yaw_neg = 0
	self.stances.m95.bipod.vel_overshot.yaw_pos = 0
	self.stances.m95.bipod.vel_overshot.pitch_neg = 0
	self.stances.m95.bipod.vel_overshot.pitch_pos = 0

--	self.stances.m95.bipod.FOV = 50
	self.stances.m95.bipod.shakers = {breathing = {}}
	self.stances.m95.bipod.shakers.breathing.amplitude = 0
end

local default_init_g3 = PlayerTweakData._init_g3
function PlayerTweakData:_init_g3(...)
    default_init_g3(self,...)

	local pivot_shoulder_translation = Vector3(10.6681, 21.5458, -1.73827)
	local pivot_shoulder_rotation = Rotation(0.106686, -0.0859334, 0.627737)
	local pivot_head_translation = Vector3(0, 17, 0)	
	local pivot_head_rotation = Rotation(0, 0, 0)
		self.stances.g3.bipod = {
		shoulders = {},
		vel_overshot = {}
	}
	self.stances.g3.bipod.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.g3.bipod.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.g3.bipod.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, -30, 0)
	self.stances.g3.bipod.vel_overshot.yaw_neg = 0
	self.stances.g3.bipod.vel_overshot.yaw_pos = 0
	self.stances.g3.bipod.vel_overshot.pitch_neg = 0
	self.stances.g3.bipod.vel_overshot.pitch_pos = 0

	self.stances.g3.bipod.FOV = 50
	self.stances.g3.bipod.shakers = {breathing = {}}
	self.stances.g3.bipod.shakers.breathing.amplitude = 0
end

local default_init_g36 = PlayerTweakData._init_g36
function PlayerTweakData:_init_g36(...)
    default_init_g36(self,...)

	local pivot_shoulder_translation = Vector3(10.4764, 24.8875, -1.1479)
	local pivot_shoulder_rotation = Rotation(0.157971, -0.000391207, -0.00105803)
	local pivot_head_translation = Vector3(0, 0, 0)	
	local pivot_head_rotation = Rotation(0, 0, 0)
		self.stances.g36.bipod = {
		shoulders = {},
		vel_overshot = {}
	}
	self.stances.g36.bipod.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.g36.bipod.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.g36.bipod.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, -30, 0)
	self.stances.g36.bipod.vel_overshot.yaw_neg = 0
	self.stances.g36.bipod.vel_overshot.yaw_pos = 0
	self.stances.g36.bipod.vel_overshot.pitch_neg = 0
	self.stances.g36.bipod.vel_overshot.pitch_pos = 0

	self.stances.g36.bipod.FOV = 50
	self.stances.g36.bipod.shakers = {breathing = {}}
	self.stances.g36.bipod.shakers.breathing.amplitude = 0
end

local default_init_wa2000 = PlayerTweakData._init_wa2000
function PlayerTweakData:_init_wa2000(...)
    default_init_wa2000(self,...)

	local pivot_shoulder_translation = Vector3(10.5287, 10.4677, 0.247723)
	local pivot_shoulder_rotation = Rotation(0.000398715, -0.000868289, -0.000330621)
	local pivot_head_translation = Vector3(0, 20, 0)
	local pivot_head_rotation = Rotation(0, 0, 0)
		self.stances.wa2000.bipod = {
		shoulders = {},
		vel_overshot = {}
	}
	self.stances.wa2000.bipod.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.wa2000.bipod.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.wa2000.bipod.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, -30, 0)
	self.stances.wa2000.bipod.vel_overshot.yaw_neg = 0
	self.stances.wa2000.bipod.vel_overshot.yaw_pos = 0
	self.stances.wa2000.bipod.vel_overshot.pitch_neg = 0
	self.stances.wa2000.bipod.vel_overshot.pitch_pos = 0
	self.stances.wa2000.bipod.FOV = 50
	self.stances.wa2000.bipod.shakers = {breathing = {}}
	self.stances.wa2000.bipod.shakers.breathing.amplitude = 0
end





if not SGO or not SGO.settings.use_sprinty then return end
local old_init = CarryTweakData.init
function CarryTweakData:init(tweak_data)
	old_init(self, tweak_data)
	self.types.being.can_run = true
	self.types.mega_heavy.can_run = true
	self.types.very_heavy.can_run = true
	self.types.heavy.can_run = true
	self.types.medium.can_run = true
	self.types.light.can_run = true
end
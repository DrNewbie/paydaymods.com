--CAUGHT RED HANDED BEING A DICKHEAD--

local old_init = CharacterTweakData.init
function CharacterTweakData:init(tweak_data, presets)
    old_init(self, tweak_data, presets)
	local presets = self:_presets(tweak_data)
	self.city_swat.weapon = deep_clone(presets.weapon.good)
	self.city_swat.weapon.r870.FALLOFF= {
		{
			r = 100,
			acc = {0.95, 0.95},
			dmg_mul = 3,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.7, 0.95},
			dmg_mul = 2,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {
				0,
				5,
				0.8
			},
			dmg_mul = 1.5,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.45, 0.65},
			dmg_mul = 1,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.3, 0.5},
			dmg_mul = 0.4,
			recoil = {1, 1.2},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
end

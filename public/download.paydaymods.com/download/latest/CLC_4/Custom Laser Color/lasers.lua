CustomLaser:Load()

if not CustomLaser.settings.fab_value then

	if RequiredScript == "lib/units/weapons/weaponlaser" then
	 
			local init_original = WeaponLaser.init
	 
			WeaponLaser.DEFINITIONS = {
					default = {      --Player
							color = Color(CustomLaser.settings.slider_r_value, CustomLaser.settings.slider_g_value, CustomLaser.settings.slider_b_value),
							alpha = CustomLaser.settings.slider_a_value,
					},
					cop_sniper = {  --Enemy snipers
							color = Color(CustomLaser.settings.slider_sniper_r_value, CustomLaser.settings.slider_sniper_g_value, CustomLaser.settings.slider_sniper_b_value),
							alpha = CustomLaser.settings.slider_sniper_a_value,
					},
			}
		   
			function WeaponLaser:init(...)
					init_original(self, ...)
					self:init_themes()
					self:set_color_by_theme(self._theme_type)

			end
		   
			function WeaponLaser:init_themes()
					for theme, data in pairs(WeaponLaser.DEFINITIONS) do
							self:update_theme(theme, data.color, data.alpha)
					end
			end
	 
			function WeaponLaser:update_theme(name, color, alpha)
					self._themes[name] = self._themes[name] or {}
					local color = color or self._themes[name].brush or Color.white
					local alpha = alpha or self._themes[name].brush and self._themes[name].brush.alpha or 0
	 
					self._themes[name] = {
							light = color * 10,
							glow = color / 5,
							brush = color:with_alpha(alpha)
					}
			end
		   
	end
	
else
	
	local _WeaponLaser_update = WeaponLaser.update
	function WeaponLaser:update(unit, t, dt)
		_WeaponLaser_update(self, unit, t, dt)

		local red = math.sin(135 * t + 0) / 2 + 0.5
		local green = math.sin(140 * t + 60) / 2 + 0.5
		local blue = math.sin(145 * t + 120) / 2 + 0.5

		self._themes.custom_player_laser_color = {
			light = Color(red, green, blue) * 10,
			glow = Color(red, green, blue) / 2,
			brush = Color(CustomLaser.settings.slider_a_value, red, green, blue)  
		}

		if not self._is_npc then
			self:set_color_by_theme("custom_player_laser_color")
		end
	end
	
end
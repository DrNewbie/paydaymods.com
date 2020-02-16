_G.LasersPlus = _G.LasersPlus or {}
local Lasers = Lasers or _G.LasersPlus

Lasers._path = ModPath
Lasers._data_path = Lasers._data_path or SavePath .. "lasersplus.txt"

--*****    Internal Values    *****
--Things that should not be changed
Lasers.LuaNetID = "lasersplus"
--these aren't used
Lasers.LegacyID = "nncpl"
Lasers.LegacyID2 = "gmcpwlc"
Lasers.LegacyID3 = "nncpl_gr_v1" 

--can be any turret theme_type

Lasers.SavedTeamStrobes = Lasers.SavedTeamStrobes or {}
Lasers.SavedTeamColors = Lasers.SavedTeamColors or {}
Lasers.SavedTeamFlashlights = Lasers.SavedTeamFlashlights or {}
--[[
Lasers last peer mode[peerid_num] and secondary peer_display_type can be:
"none" (triggers init)
"color" (
"peer"


--]]


--*****    Advanced Settings    *****
--Default entries for settings

Lasers.debug_logs = false

Lasers.default_opacity = 0.5

Lasers.default_max_colors = 120 
--should it be a power of 2? but it's time based so idk, probably 120, assuming 30-60 fps.
--small differences would only affect length and performance on init anyway, and people don't generally mind a small hitch at the start(?)
--change this at your own risk

Lasers.low_quality_strobes = false
--local option, does not affect what others see. instant switch instead of slow gradients. overrides default_max_colors
--not currently implemented 

Lasers.vanilla_tracker = 1
--assigned to flashlight/laser units to help with the "display vanilla color" option

Lasers.default_speed = 1
--not currently implemented


--*****    UTILS    *****
--most of these util functions are migrated to menumanager so that syntax errors (which are more likely to be in lasers.lua than menumanager.lua)
--will not consistently crash the game

--Usage: init strobe( [Correctly formatted table of: table colors, and integer max_colors],[int max_colors or false])
--Used on initiate, at heist start, or at first instance of laser turning on,
--to generate a table of [max_colors] length, rather than generating it live every time you turn on a laser.
--that was horribly inefficient and i don't know why i did that.
--regrets.lua

--[[
design for init strobe and strobe step


when using strobe step, will it use that strobes's color_count?
or will it depend on the maximum_colors value determined in init strobe?

when using init strobe, will maximum_colors value be determined by settings or custom color?
how will it react to differing settings.maximum_color and strobe_table.color_count values?

A:
settings.maximum_color is the last word in how long a laser's strobe can be
lasers can be shorter than that but not longer
so generation in init strobe should always overwrite strobe_table.color_count to math.min(strobe_table.color_count,settings.maximum_color)
and thus,
display in strobe step should always use the value of strobe_table.color_count
and use the same color_count value in [t % maximum_colors]
since there is now no conflict between strobe_table.color_count and settings.maximum_colors
--]]


--this function interpolates colors from a list of data parameters, and outputs those colors to a table from 1-(max number of colors)
--the maximum number of colors should be kept in mind when creating desired gradients,
--as creating an ultra-complex gradient with many colors will run poorly, display beautifully, and send poorly
function Lasers:init_strobe(input_strobe,max_colors_override)
	local input_strobe = input_strobe or Lasers.default_strobe

	
	if not input_strobe.colors then 
		return Lasers.default_strobe
	else
	
		local c_
		for k,v in ipairs(input_strobe.colors) do
			c_ = k
		end
	end
	
	local num_colors = c_ or input_strobe.color_count
	
	local maximum_colors = max_colors_override or (input_strobe.duration and math.min(input_strobe.duration,Lasers.default_max_colors)) or Lasers.default_max_colors
	local output_strobe = {
		colors = {},
		color_count = input_strobe.color_count,
		duration = maximum_colors
	}
	local r3, g3, b3, a3, col_1, col_2, r_diff, g_diff, b_diff, a_diff


	for i = 0, maximum_colors do
		--determining current color and next color
		local h1 = 1 + (math.floor(i / (maximum_colors / num_colors)) % num_colors)
		local h2 = 1 + (math.floor( (i + (maximum_colors / num_colors) ) / (maximum_colors / num_colors)) % num_colors) 
		col_1 = input_strobe.colors[h1]
		col_2 = input_strobe.colors[h2]
		if not (col_1 and col_2 and col_1.red and col_2.red) then
			lp_log("Invalid data input for Lasers:init_strobe. Returning default strobe.")
			return Lasers.default_strobe
		end
		r_diff = col_2.red - col_1.red
		g_diff = col_2.green - col_1.green
		b_diff = col_2.blue - col_1.blue
		a_diff = col_2.alpha - col_1.alpha

		local a = (i / (maximum_colors / num_colors)) % 1		
		
		r3 = col_1.red + (r_diff * a)
		g3 = col_1.green + (g_diff * a)
		b3 = col_1.blue + (b_diff * a)		
		a3 = col_1.alpha + (a_diff * a)
		local new_col = Color(r3,g3,b3):with_alpha(a3)
		output_strobe.colors[i] = new_col
	end
	
	return output_strobe
end


--this function is called in update, and is used to display the correct laser color in a strobe from a pre-generated list
--speed can be overridden if you gotta go fast. minimum speed of 1% normal (1/100), no max speed set,
--though it should probably stay below Lasers.default_max_colors for your own good
--Usage: strobe step( [valid formatted table containing: table colors, int color_count], float override_speed or false)
function Lasers:StrobeStep(input_table,override_speed)
	if not input_table or not type(input_table) == "table" then 
		lp_log("Invalid input table")
		return Lasers.default_strobe
	end
	if not (override_speed and type(override_speed) == "number") then 
		override_speed = input_table.override_speed or 1
	end
	
	if not input_table.color_count then
		lp_log("StrobeStep Invalid color count!")
		input_table.color_count = 1
	end
	if not input_table.colors then
		lp_log("StrobeStep Invalid colors!")
	end	
	input_table._t2 = input_table._t2 or 1
	input_table._t2 = input_table._t2 + (override_speed or 1)

	local strobe_t = input_table._t2 % (input_table.duration or input_table.color_count)
	strobe_t = math.floor(math.max(strobe_t,1)) --just in case, because somehow it managed to be a non-int and crashed before
	return input_table.colors[strobe_t]
end

--used to get things like rainbow, randomized, or other presets
--Usage: SpecialLaser( string override_type, [t], float override_speed)
--not currently implemented
function SpecialLaser(t,override_type,override_speed)
	if override_type == "rainbow" then
		local r = math.sin(135 * t + 0) / 2 + 0.5
        local g = math.sin(140 * t + 60) / 2 + 0.5
        local b = math.sin(145 * t + 120) / 2 + 0.5
		
		color = Color(r,g,b):with_alpha(Lasers.col_default.alpha)
	elseif override_type == "random" then
		local r = {}
--		for i = 0, 3 do 
--			r[i] = math.random(255)-1 / 256
--		end
		r[0] = math.random(255) - 1 / 256
		r[1] = math.random(255) - 1 / 256
		r[2] = math.random(255) - 1 / 256
--		r[3] = 1
	
		color = Color(r[0],r[1],r[2]):with_alpha(1)
--	elseif override_type == "whatever" then
	else
		lp_log("Couldn't find Laser Preset type [" .. tostring(override_type) .. "]!")
		return false
	end
	return color
end

function Lasers:GetInventoryFromLaserUnit(laser) --no longer necessary 
	self._laser_units_lookup = self._laser_units_lookup or {}
	local laser_key = nil
	if laser._unit then
		laser_key = laser._unit:key()
	end
	if laser_key and self._laser_units_lookup[laser_key] ~= nil then
		--return self._laser_units_lookup[laser_key]
	end
	
	if not managers.criminals then
		return
	end
	for id,character in pairs(managers.criminals._characters) do
		if alive(character.unit) and character.unit:inventory() and character.unit:inventory():equipped_unit() then
			
			local weapon_base = character.unit:inventory():equipped_unit():base()
			if weapon_base._second_gun then
				if Lasers:CheckWeaponForLasers(weapon_base._second_gun:base(), laser_key) then
					self._laser_units_lookup[laser_key] = character.name
					return
				end
			end
			return weapon_base
		end
	end
end

--for custom weapons to have mandatory laser colors. Currently only Alcat's "Railgun RMk-1" uses this feature
function Lasers:GetCustomWeaponLaserOverride(laser) --/r/titlegore
	local weapon = Lasers:GetWeaponBaseFromLaserUnit(laser)
	if not weapon then
		return
	end
	local weapon_name = weapon:get_name_id()
	local forced_laser = tweak_data.weapon[weapon_name] and tweak_data.weapon[weapon_name].forced_laser
	if forced_laser then
		forced_laser = LuaNetworking:StringToColour(forced_laser)
		return forced_laser
	end
end

function Lasers:GetWeaponBaseFromLaserUnit(laser)
	self._laser_weapons_lookup = self._laser_weapons_lookup or {}
	local laser_key = nil
	if laser._unit then 
		laser_key = laser._unit:key()
	end
	if laser_key and self._laser_weapons_lookup[laser_key] then
		return self._laser_weapons_lookup[laser_key] --if already indexed
	end
	
	local criminals_manager = managers.criminals
	if not criminals_manager then
		return
	end
	local weapon_base
	for id,character in pairs(criminals_manager._characters) do
		if alive(character.unit) and character.unit:inventory() and character.unit:inventory():equipped_unit() then
			weapon_base = character.unit:inventory():equipped_unit():base()
			if Lasers:CheckWeaponForLasers(weapon_base,laser_key) then
				self._laser_weapons_lookup[laser_key] = weapon_base
				--break
				return weapon_base
			end
		end
	end
	return
end

function Lasers:GetCriminalNameFromLaserUnit( laser )

	if not self._laser_units_lookup then
		self._laser_units_lookup = {}
	end

	local laser_key = nil
	if laser._unit then
		laser_key = laser._unit:key()
	end
	if laser_key and self._laser_units_lookup[laser_key] ~= nil then
		return self._laser_units_lookup[laser_key]
	end

	local criminals_manager = managers.criminals
	if not criminals_manager then
		return
	end

	for id, character in pairs(criminals_manager._characters) do
		if alive(character.unit) and character.unit:inventory() and character.unit:inventory():equipped_unit() then

			local weapon_base = character.unit:inventory():equipped_unit():base()
			if Lasers:CheckWeaponForLasers( weapon_base, laser_key ) then
				self._laser_units_lookup[laser_key] = character.name
				return
			end

			if weapon_base._second_gun then
				if Lasers:CheckWeaponForLasers( weapon_base._second_gun:base(), laser_key ) then
					self._laser_units_lookup[laser_key] = character.name
					return
				end
			end

		end
	end

	if laser_key then
		self._laser_units_lookup[laser_key] = false
	end
	return nil

end

local function recursive_table_log(table_id)
	local iter = iter or 1
	
	if type(table_id) == "table" then 
		for k,v in ipairs(table_id) do
			lp_log("Advancing in nested table logging for table " .. tostring(k) .. ". Degree: " .. tostring(iter)) 
			iter = iter + 1
			recursive_table_log(v)
		end
		
	else
		lp_log("Logging nested tables. Degrees: [" .. tostring(iter) .. "] | Result:" .. tostring(table_id))
	end

end

function Lasers:CheckWeaponForLasers( weapon_base, key )
--todo get custom color table from this
	
	if weapon_base and weapon_base._factory_id and weapon_base._blueprint then

		local gadgets = managers.weapon_factory:get_parts_from_weapon_by_type_or_perk("gadget", weapon_base._factory_id, weapon_base._blueprint)
		if gadgets then
			for _, i in ipairs(gadgets) do
				if not weapon_base._parts[i].unit then 
					lp_log("CheckWeaponForLasers: No weapon part found for unit")
					break
				else
					local gadget_key = weapon_base._parts[i].unit:key()
					if gadget_key == key then
						return true
					end
				end
			end
		end

	end
	return false

end

function Lasers:ConvertToBLTColor(col)
	return Color(col.r,col.g,col.b)
end
	
--*****    Strobe Definitions    *****

--color_count is an obsolete value, since it's always calculated with a forloop in
--strobe decompression/generation, but I'll remove it later
Lasers.col_generic = Color(0.41,0,0)--:with_alpha(1)
Lasers.col_default = Color(0,0.2,0):with_alpha(0.4)
Lasers.col_invisible = Color(0,0,0):with_alpha(0)

Lasers.default_strobe = {
	colors = { -- rainbow
		[1] = Color(1,0,0):with_alpha(0.3),
		[2] = Color(0,1,0):with_alpha(0.3),
		[3] = Color(0,0,1):with_alpha(0.3)
	},
	duration = 30,
	color_count = 3
}
lp_log("Initiating strobe from mod...")
Lasers.own_laser_strobe = Lasers.own_laser_strobe or { -- rainbow
	colors = {
		[1] = Color(1,0,0):with_alpha(0.3),
		[2] = Color(0,1,0):with_alpha(0.3),
		[3] = Color(0,0,1):with_alpha(0.3)
	},
	duration = 30,
	color_count = 3
}
Lasers.team_laser_strobe = { --rainbow
	colors = {
		[1] = Color(1,0,0):with_alpha(0.3),
		[2] = Color(0,1,0):with_alpha(0.3),
		[3] = Color(0,0,1):with_alpha(0.3)
	},
	duration = 30,
	color_count = 3
}
Lasers.own_flashlight_strobe = Lasers.own_flashlight_strobe or {
	colors = {
		[1] = Color(0,1,1):with_alpha(0.7),
		[2] = Color(1,1,1):with_alpha(0.7),
		[3] = Color(1,0,1):with_alpha(0.7),
		[4] = Color(1,1,1):with_alpha(0.7),
		[5] = Color(1,1,0):with_alpha(0.7),
		[6] = Color(1,1,1):with_alpha(0.7)
	},
	duration = 120,
	color_count = 4
}
Lasers.teammate_vanilla_lasers = Lasers.teammate_vanilla_lasers or {
	[1] = Color(0,1,0):with_alpha(1)
}
Lasers.npc_flashlight_strobe = Lasers.npc_flashlight_strobe or {
	colors = {
		[1] = Color(1,0,0):with_alpha(0.7),
		[2] = Color(1,1,1):with_alpha(0.7),
		[3] = Color(0,0,1):with_alpha(0.7),
		[4] = Color(1,1,1):with_alpha(0.7),
	},
	duration = 120,
	color_count = 4
}
Lasers.turret_active_strobe = Lasers.turret_active_strobe or {
	colors = {
		[1] = Color(1,0,0):with_alpha(0.3),
		[2] = Color(1,0.5,0):with_alpha(0.3)
	},
	duration = 10,
	color_count = 2
}
Lasers.turret_reload_strobe = Lasers.turret_reload_strobe or {
	colors = {
		[1] = Color(1,1,0):with_alpha(0.5),
		[2] = Color(0,1,0):with_alpha(0.5)
	},
	duration = 10,
	color_count = 2
}
Lasers.turret_mad_strobe = Lasers.turret_mad_strobe or {
	colors = {
		[1] = Color(0,1,1):with_alpha(0.5),
		[2] = Color(0,1,0.4):with_alpha(0.5),
		[3] = Color(0,0.4,1):with_alpha(0.5)
	},
	duration = 5,
	color_count = 3
}
Lasers.sniper_strobe = Lasers.sniper_strobe or {
	colors = {
		[1] = Color(1,0,0):with_alpha(1),
		[2] = Color(1,0,0.3):with_alpha(0.7)
	},
	duration = 10,
	color_count = 2
}
Lasers.world_strobe = Lasers.world_strobe or {
	colors = {
		[1] = Color(1,0,0):with_alpha(0.6),
		[2] = Color(0,1,0):with_alpha(0.4),
		[3] = Color(0,0,1):with_alpha(0.6),
		[4] = Color(1,0,1):with_alpha(0.3)
	},
	duration = 30,
	color_count = 4
}
Lasers.peer_strobe = {
[1] = {},
[2] = {},
[3] = {},
[4] = {}
}


Lasers.DefaultTeamColors = Lasers.DefaultTeamColors or {
	[1] = Color(0.19,0.93,0.31):with_alpha(Lasers.default_opacity),--Color("00ffdd"),
	[2] = Color(0.2,0.3,1):with_alpha(Lasers.default_opacity),
	[3] = Color(1,0.15,0.35):with_alpha(Lasers.default_opacity),
	[4] = Color(0.85,0.55,0.1):with_alpha(Lasers.default_opacity),
	[5] = Lasers.col_generic
}
--[[
default strobe definitions go here
user-customised ones are written into settings in string form,
so you can change that without BLT screaming at you
about an update
someday i'll figure out how to menu that
--]]

--*****    Get() functions    *****

--this is probably obsolete, but i haven't removed it yet
function Lasers:GetPeerLaserColor(criminal_name)
	local id = managers.criminals:character_peer_id_by_name( criminal_name )
	if not id or type(id) ~= "number" then 
		id = 5
		lp_log("No id found in GetPeerLaserColor. Spoofing to 5")
	end
	local color = Lasers.DefaultTeamColors[id] 
	if not color or not color.r then
		color = Lasers.col_default
	end
	return color
end

--not used
function Lasers:GetPeerStrobe(num)
	return Lasers.peer_strobe[num] --strobe should already initiated with init strobe(data) at this point
end

--*****    GetSettings() functions    *****

function Lasers:GetMaxColors()
	return Lasers.default_max_colors
end


	function Lasers:UpdateLaser( laser, unit, t, dt )
--		if t > 0 then --i'd love to put this in init or something but at t = 0, all lasers are (0,1,0) aka pure green, so this shoddy method will have to do
--			Lasers:SaveGadgetVanillaColor(unit,Lasers:ConvertToBLTColor(laser:color()))
--		end
		local refresh_rate = Lasers:GetLaserQuality()
		laser._t = laser._t or 1 --redundant
		laser._t = math.floor(laser._t + 1) % Lasers.default_max_colors
		if math.floor(laser._t)/refresh_rate ~= math.floor(laser._t/refresh_rate) then
			return
		end
		if not Lasers:IsEnabled() then
			return
		end

		local color
		if (laser:theme_type() == "turret_module_active" or laser:theme_type() == "turret_module_rearming" or laser:theme_type() == "turret_module_mad") then
			if Lasers:IsTurretInvisible() then
				laser:set_color(Lasers.col_invisible)
				return
			elseif Lasers:IsTurretVanilla() then
				laser:set_color_by_theme(laser:theme_type())
--				color = laser._themes[laser:theme_type() or "default"]
				if false then
					laser:set_color(color)
				end
				return
			elseif Lasers:IsTurretCustom() then
			
			--do refresh of color. 
			--todo add this to a function so that it can be called by the laser refresh button?
				if laser:theme_type() == "turret_module_active" then
					if Lasers:IsTurretStrobeEnabled() and Lasers:IsMasterLaserStrobeEnabled() then
						color = Lasers:StrobeStep(Lasers:GetTurretActiveStrobe())
					else
						color = Lasers:GetTurretActiveLaserColor()
					end
				elseif laser:theme_type() == "turret_module_rearming" then
					if Lasers:IsTurretStrobeEnabled() and Lasers:IsMasterLaserStrobeEnabled() then
						color = Lasers:StrobeStep(Lasers:GetTurretReloadStrobe())
					else
						color = Lasers:GetTurretReloadLaserColor()
					end
				elseif laser:theme_type() == "turret_module_mad" then
					if Lasers:IsTurretStrobeEnabled() and Lasers:IsMasterLaserStrobeEnabled() then
						color = Lasers:StrobeStep(Lasers:GetTurretMadStrobe())
					else
						color = Lasers:GetTurretMadLaserColor()
					end
				end
				if color then
					laser:set_color(color)
				else
					lp_log("ERROR: Invalid turret laser color!")
				end
				return
			end
		elseif laser:theme_type() == "cop_sniper" then
			if Lasers:IsSniperInvisible() then
				laser:set_color(Lasers.col_invisible)
				return
			elseif Lasers:IsSniperVanilla() then
--				color = laser._themes.cop_sniper
				laser:set_color_by_theme(laser:theme_type())
				if false then 
					laser:set_color(color)
				end
				return
			elseif Lasers:IsSniperCustom() then
				if Lasers:IsSniperStrobeEnabled() and Lasers:IsMasterLaserStrobeEnabled()  then
					color = Lasers:StrobeStep(Lasers:GetSniperStrobe())
				else
					color = Lasers:GetSniperLaserColor()
				end
				if color then
					laser:set_color(color)
				else
					lp_log("ERROR! Invalid sniper laser color!")
				end
				return
			end
		end
		local criminal_name
		if laser._is_npc then
	
			local forced_laser = Lasers:GetCustomWeaponLaserOverride(laser)
			if forced_laser then 
				laser:set_color(forced_laser)
				return
			end
			
			criminal_name = Lasers:GetCriminalNameFromLaserUnit( laser )
			if not criminal_name then
				return
			end
			peerid_num = managers.criminals:character_peer_id_by_name( criminal_name )
			
--this part should work but i'm not using it for anything so whatever
--not sure why i wrote it in the first place
--			local username = managers and managers.network and managers.network.account and managers.network.account:username() or "ChadHeister McSexHaver"
--			criminal_username = (LuaNetworking:LocalPeerID() == peerid_num and username ) or LuaNetworking:GetNameFromPeerID( peerid_num )
			
			local net_strobe = Lasers.SavedTeamStrobes[criminal_name] or Lasers.SavedTeamColors[criminal_name]
			--todo: log contents of net strobe
			if not net_strobe then 
				lp_log("No saved table for criminal " .. tostring(criminal_name))
			end
			if Lasers:IsNetworkingEnabled() and net_strobe then
--				lp_log("Entering team network section")
				
				if net_strobe and net_strobe == "rainbow" then --not currently implemented
--					lp_log("Found net_strobe is string")
					color = SpecialLaser(t,net_strobe,false)
					if color then 
						laser:set_color(color)
						return
					else 
						lp_log("String parse failed for type " .. type(color))
					end
				end --this is pointedly not else-exclusive with the rest of the function
				
				if type(net_strobe) == "table" and Lasers:IsMasterLaserStrobeEnabled() and Lasers:IsTeamLaserStrobeEnabled() then
					lp_log("Using NPC player UpdateLaser() of id " .. tostring(peerid_num))
					color = Lasers:StrobeStep(net_strobe)
					laser:set_color(color)
					return
				elseif not (type(net_strobe) == "table") then
					--assume it's type colorstring, since networking input would filter out other types
					color = net_strobe
					laser:set_color(color)
					return
				else
					lp_log("ERROR: net_strobe check failed. Laser is red-filter blacklisted or invalid strobe/color.")
--					recursive_table_log(net_strobe)
				end
			end
		
			lp_log("No viable networked settings found. Entering local custom team laser override loop.")
		--override or if no netcolor found
			if Lasers:IsTeamLaserPeerColor() then
				color = Lasers:GetPeerLaserColor(criminal_name) --todo use steamid64 instead?
			elseif Lasers:IsTeamLaserCustom() then
				if Lasers:IsMasterLaserStrobeEnabled() and Lasers:IsTeamLaserStrobeEnabled() then
					color = Lasers:StrobeStep(Lasers:GetTeamLaserStrobe())
				else
					color = Lasers:GetTeamLaserColor()
				end
			elseif Lasers:IsTeamLaserVanilla() then
				color = Lasers:GetTeammateVanillaColor(unit)
				color = (Lasers:FilterRedLasers(color)) or Lasers:GetTeamLaserColor()
				if color then
					lp_log("Using teammate vanilla laser color " .. LuaNetworking:ColourToString(color))
					laser:set_color(color)
					return
				end
			elseif Lasers:IsTeamLaserInvisible() then 
				color = Lasers.col_invisible
				laser:set_color(color)
				return
			else
				lp_log("ERROR: Somehow skipped every peer laser option in UpdateLaser!\ncriminal_name = " .. tostring(criminal_name))
			end
			if color then 
				laser:set_color(color)
				return
			else
				lp_log("ERROR: Invalid team laser color!")
			end
		
			lp_log("Reached the end of team lasers loop. Something went wrong!")
		else -- If this laser is self/player
--			laser._brush:set_render_template(Idstring("LineObject"))	
--			local me = LuaNetworking:LocalPeerID() -- no longer needed
--			criminal_name =  managers.criminals:character_name_by_peer_id(me) --no longer needed 
			--there's probably an easier way to get the local player's character name

			local forced_laser = Lasers:GetCustomWeaponLaserOverride(laser)
			if forced_laser then 
				laser:set_color(forced_laser)
				return
			end
			
			if Lasers:IsOwnLaserInvisible() then
				laser:set_color(Lasers.col_invisible)
				return
			end
			if Lasers:IsOwnLaserVanilla() then
				color = Lasers:GetTeammateVanillaColor(unit) --yes i know it says getteammatevanillacolor
				if color then 
					lp_log("Using vanilla laser color " .. tostring(color))--LuaNetworking:ColourToString(color))
					laser:set_color(color)
				end
				return
			end			
			if Lasers:IsOwnLaserCustom() then
				if Lasers:IsOwnLaserStrobeEnabled() and Lasers:IsMasterLaserStrobeEnabled() then
					color = Lasers:StrobeStep(Lasers:GetOwnLaserStrobe(),false)
				else
					color = Lasers:GetOwnLaserColor()
				end
				
				if color then
					laser:set_color(color)
					return
				else
					lp_log("ERROR: Could not set invalid color to self!")
					return
				end
			end
		end
	end
	
	Hooks:Add("WeaponLaserUpdate", "WeaponLaserUpdate_lasersplus", function(laser, unit, t, dt)
--[[		local col = laser._color
		if col and unit and not Lasers.teammate_vanilla_lasers[unit] then
			Lasers.teammate_vanilla_lasers[unit] = col
			--i absolutely hate that this works
			--i could probably use this for teammates too for consistency
			--but i'd prefer to keep as few per-frame calculations as possible for performance
		end--]]
		Lasers:UpdateLaser(laser, unit, t, dt)
	end)

	Hooks:Add("WeaponLaserInit", "WeaponLaserInit_lasersplus", function(laser, unit)
--		laser._max_distance = 6000
--makes laser dot tiny because it scales based on distance, don't want that
		lp_log("Generating player strobe in Init.")
		Lasers:GetOwnLaserStrobe()
		Lasers:UpdateLaser(laser, unit, 0, 0)
		laser._t = 1
	end)

	

	-- *****    Set On    *****
	Hooks:Add("WeaponLaserSetOn", "WeaponLaserSetOn_lasersplus", function(laser)
		if false then 
			Lasers:SaveGadgetVanillaColor(laser._unit,Lasers:ConvertToBLTColor(laser:color()))
			local own_strobe = Lasers:GetSavedPlayerStrobe()
			if Lasers:IsNetworkingEnabled() then
				LuaNetworking:SendToPeers( Lasers.LuaNetID, LuaNetworking:ColourToString(Lasers:GetOwnLaserColor()))
				if own_strobe then
					LuaNetworking:SendToPeers( Lasers.LuaNetID, own_strobe)
				end
			end
		end
	end)
	
	
	-- *****    Receive Data    *****
	Hooks:Add("NetworkReceivedData", "NetworkReceivedData_lasersplus", function(sender, message, data)
		if message == Lasers.LuaNetID or message == Lasers.LegacyID then
			local criminals_manager = managers.criminals
			if not criminals_manager then
				return
			end
			if message == Lasers.LegacyID and sender then 
				lp_log("Sender with peerid [" .. sender .. "] is running legacy Networked Lasers!")
				--should we... decode it?
			elseif message == Lasers.LuaNetID and sender then 
				if type(data) ~= "string" then
					lp_log("Wrong data type received!")
					--this shouldn't ever happen anyway, luanetworking only sends strings
					return
				end
			end

			local char = criminals_manager:character_name_by_peer_id(sender)
			local col = data
			if not data then
				lp_log("Received LuaNetworking Data is nil!")
				--again, this should never happen
				return
			end
			if string.find(data, "l") then
				if char and not Lasers.SavedTeamStrobes[char] then
					col = Lasers:init_strobe(Lasers:StringToStrobeTable(data))
					Lasers.SavedTeamStrobes[char] = col
					lp_log("Saved a team strobe to the table")
					return
				end
			elseif data ~= "nil" then
				lp_log("Found networked color data.")
				col = LuaNetworking:StringToColour(data) --LuaNetworking:StringToColour(data)
				if not Lasers:FilterRedLasers(col) then
					col = nil
					lp_log("Blocked laser " .. tostring(data) .. " from character " .. tostring(char or "nil") .. "(contained too much red)")
				end
				return
			end
			
			if char then
				Lasers.SavedTeamColors[char] = col --todo save based on steamid64 instead of heister-character name
				--i dunno though this mod is already pretty bulky, i might need to be careful that this mod doesn't impact performance too much
				lp_log("Saved networked color for character " .. tostring(char)) --or cleared if col is nil
				return
			end
		end

	end)
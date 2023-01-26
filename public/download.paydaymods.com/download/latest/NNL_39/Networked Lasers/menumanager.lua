
_G.LasersPlus = _G.LasersPlus or {}
local Lasers = Lasers or _G.LasersPlus

Lasers._path = ModPath
Lasers.savename_1 = "lasersplus.txt" --these are saved separately so i can check for filenames
Lasers.savename_2 = "lasersplus_strobe.txt"
Lasers.savename_3 = "lasersplus_test.txt" --temp file; creating this in your saves folder will generate a strobe save.

Lasers._data_path = SavePath .. Lasers.savename_1
Lasers._strobe_save_path = SavePath .. Lasers.savename_2

Lasers.default_settings = {
	enabled_mod_master = true,
	--if false, this mod does not do stuff
	--if true, this mod does stuff
	
	enabled_laser_strobes_master = true,
	--if false, this mod will not render any strobes, and will instead opt for solid-color lasers if applicable
	
	enabled_flashlight_strobes_master = false,
	--no callback yet

	enabled_networking = true,
--if true:
--* sends your custom laser strobe pattern to other clients
--* receives custom strobe patterns from other Lasers+ clients and displays them
--on by default

	override_speed = 1,
	--higher numbers will make lasers faster, at no additional performance cost
	
	quality = 5,
	--scale of 1 to 10, which is the frame interval at which the game updates lasers
	--lower quality number is lower/worse performance, ie bad
	--higher quality number is higher/better performance, ie gud
	max_red_ratio = 0.66, --currently no menu setting for this. 0.66 is quite strict, 0.5 is probably better
	own_laser_display_mode = 3,
	own_flashlight_display_mode = 2,
	team_laser_display_mode = 3,
	team_flashlight_display_mode = 2,
	cop_flashlight_display_mode = 2,
	world_display_mode = 3,
	turret_display_mode = 3,
	sniper_display_mode = 3,

	own_laser_strobe_enabled = true,
	own_flashlight_strobe_enabled = true,
	team_laser_strobe_enabled = true,
	team_flashlight_strobe_enabled = true,
	world_strobe_enabled = true,
	sniper_strobe_enabled = true,
	turret_strobe_enabled = true,
	npc_flashlight_strobe_enabled = true,
	
	own_laser_red = 0.3,
	own_laser_green = 0.3,
	own_laser_blue = 1,
	own_laser_alpha = 1,
	
	own_flash_red = 0.01,
	own_flash_green = 0.03,
	own_flash_blue = 0.3,
	own_flash_alpha = 1,
	flashlight_glow_opacity = 16, --new: light cone effect
	flashlight_range = 10,
	flashlight_angle = 60,
	
	team_laser_red = 0.9,
	team_laser_green = 0.9,
	team_laser_blue = 0.3,
	team_laser_alpha = 0.7,
	
	team_flash_red = 0.01,
	team_flash_green = 0.03,
	team_flash_blue = 0.3,
	team_flash_alpha = 0.7,
	
	npc_flash_red = 0.01,
	npc_flash_green = 0.03,
	npc_flash_blue = 0.3,
	npc_flash_alpha = 0.7,
	
	wl_red = 1,
	wl_green = 0.2,
	wl_blue = 0,
	wl_alpha = 1,
	
	snpr_red = 1,
	snpr_green = 0,
	snpr_blue = 0.3,
	snpr_alpha = 1,

	turr_att_red = 1,
	turr_att_green = 0.3,
	turr_att_blue = 0,
	turr_att_alpha = 1,

	turr_rld_red = 0.7,
	turr_rld_green = 1,
	turr_rld_blue = 0,
	turr_rld_alpha = 1,

	turr_mad_red = 0,
	turr_mad_green = 1,
	turr_mad_blue = 1,
	turr_mad_alpha = 1,
	
	enabled_redfilter = false,
	enabled_blackmarket_qol = true,
	sight_color = 3,
	sight_type = 1,
	enabled_multigadget = true,
	disabled_sight_cycle = false
}
Lasers.settings = Lasers.settings or {}
for k,v in pairs(Lasers.default_settings) do 
	Lasers.settings[k] = Lasers.settings[k] or v
end

--*****    log util function w/string identifier    *****
function lp_log(message,name,tochat)
	if Lasers.debug_logs then
		if tochat then 
			local t_raw = math.floor(Application:time()*100)/100 --or TimerManager:game():time()
			local t = (t_raw/60 < 10 and "0" or "") .. tostring(math.floor(t_raw/60)) .. ":" .. (t_raw % 60 < 10 and "0" or "") .. tostring(t_raw % 60)
			--todo string.format this
			name = name and tostring(name) .. " : " or ""
			managers.chat:_receive_message(1,"[Lasers+]", t .. "|" .. name .. tostring(message), Color('FFD700')) --tf2 unique color lol
		else
			log("Lasers+: " .. message)
		end
	end
end

--*****    GetSettings() functions    *****

--Enables the whole mod's effects
function Lasers:IsEnabled()
	return Lasers.settings.enabled_mod_master
end

function Lasers:GetLaserQuality()
	return Lasers.settings.quality or 5
end

function Lasers:FilterRedLasers(col) --todo add this check to all team playerlasers with toggle in options
--returns false if contains too much red, or invalid data
--returns true if does not contain too much red, or if filter option is off
	if not col then
		lp_log("Bad argument color to filter function")
		return false --sanity checker? i 'ardly even know 'er
	end
	if not Lasers.settings.enabled_redfilter then
		lp_log("Red Filter is not enabled")
		return col
	end
	local r = col.r or col.red
	local g = col.g or col.green
	local b = col.b or col.blue
--	local a = col.a or col.alpha
	if not (r and g and b) then
		lp_log("Bad color to filter function")
		return false --don't check for alpha, i guess
		--too many design decisions, not enough menu options :(
	end
	
	local threshold = Lasers:GetMaxRedRatio()
	if r * threshold > g + b then --if red is n% larger than green+blue
		lp_log("Filtered red laser")
		return false
		--take that you red-laser-using SCUM
	end
	lp_log("Passed test, returning")
	return col
	
end

function Lasers:GetMaxRedRatio()
	return Lasers.settings.max_red_ratio or 0.66 --currently has no menu option, not sure if it's even worth implementing. probably not.
end

function Lasers:IsQOLEnabled()
	return Lasers.settings.enabled_blackmarket_qol and Lasers:IsEnabled()
end
function Lasers:IsMultiGadgetEnabled()
	return Lasers.settings.enabled_multigadget and Lasers:IsEnabled()
end
function Lasers:SightCycleDisabled()
	return Lasers.settings.disabled_sight_cycle
end
function Lasers:GetSightType()
	if not Lasers.settings.sight_type then
--		log("Didn't find lasers sight type.")
		Lasers:Load()
	end
--	log("sight type is " .. tostring(Lasers.settings.sight_type))
	return Lasers.settings.sight_type or 2
end

function Lasers:GetSightColor()
	if not Lasers.settings.sight_color then 
--		log("Didn't find laser colors type.")
		Lasers:Load()
	end
--	log("color is " .. tostring(Lasers.settings.sight_color))
	return Lasers.settings.sight_color or 2
end

function Lasers:GetOwnLaserColor()
	return Color(Lasers.settings.own_laser_red,Lasers.settings.own_laser_green,Lasers.settings.own_laser_blue):with_alpha(Lasers.settings.own_laser_alpha) or Lasers.col_generic
end

function Lasers:GetTeammateVanillaColor(unit) --really does not matter what id is used as long as it's consistent
	local index = unit and unit:base() and unit:base()._vanilla_tracker
	--local index = unit:key()
	if not index then return end
	return Lasers.teammate_vanilla_lasers[index]
end

function Lasers:GetVanillaLaserColor(character,unit)
--[[ this is all trash. abort. abort.
	local inv = Lasers:GetInventoryFromLaserUnit(unit)
	if inv then 
		log("found inv")
--		OffyLib:t_log(inv)

		for k,v in pairs(inv) do
			if k == "" or k == "" then
				log("Logging ")
--				OffyLib:t_log(v)
			end
		end


		local gadget = inv:get_active_gadget()--		inv.get_active_gadget and inv:get_active_gadget()		
		if gadget and gadget.color then 
			log("Found gadget color")
			return gadget:color()
		end	
	end
--		
		for id, character in pairs(managers.criminals._characters) do
			
			inv = character.unit:inventory()
			
		return Lasers.col_generic
	end
	local inv = character.unit:inventory()
	if inv._equipped_selection then
		local gadget = inv:equipped_unit():base().get_active_gadget and inv:equipped_unit():base():get_active_gadget()

		if gadget and gadget.color then
			return gadget:color() or Lasers.col_generic
		end
	end	--]]
--	log("Returning. Invalid something in vanillalasercolor")
	return Lasers.col_generic
end
function Lasers:GetTeamLaserColor()
	return Color(Lasers.settings.team_laser_red,Lasers.settings.team_laser_green,Lasers.settings.team_laser_blue):with_alpha(Lasers.settings.team_laser_alpha) or Lasers.col_generic
end
function Lasers:GetSniperLaserColor()
	return Color(Lasers.settings.snpr_red,Lasers.settings.snpr_green,Lasers.settings.snpr_blue):with_alpha(Lasers.settings.snpr_alpha) or Lasers.col_generic
end
function Lasers:GetTurretActiveLaserColor()
	return Color(Lasers.settings.turr_att_red,Lasers.settings.turr_att_green,Lasers.settings.turr_att_blue):with_alpha(Lasers.settings.turr_att_alpha) or Lasers.col_generic
end
function Lasers:GetTurretReloadLaserColor()
	return Color(Lasers.settings.turr_rld_red,Lasers.settings.turr_rld_green,Lasers.settings.turr_rld_blue):with_alpha(Lasers.settings.turr_rld_alpha) or Lasers.col_generic
end
function Lasers:GetTurretMadLaserColor()
	return Color(Lasers.settings.turr_mad_red,Lasers.settings.turr_mad_green,Lasers.settings.turr_mad_blue):with_alpha(Lasers.settings.turr_mad_alpha) or Lasers.col_generic
end
function Lasers:GetWorldLaserColor()
	return Color(Lasers.settings.wl_red,Lasers.settings.wl_green,Lasers.settings.wl_blue):with_alpha(Lasers.settings.wl_alpha) or Lasers.col_generic
--	return Color(Lasers.settings.wl_red,Lasers.settings.wl_green,Lasers.settings.wl_blue):with_alpha(Lasers.settings.wl_alpha) or Lasers.col_generic
end

function Lasers:GetOwnFlashlightStrobe()
	if not Lasers._own_flashlight_strobe then
		Lasers._own_flashlight_strobe = Lasers:init_strobe(Lasers.own_flashlight_strobe)
	end
	return Lasers._own_flashlight_strobe
end

function Lasers:GetNPCFlashlightStrobe()
	if not Lasers._npc_flashlight_strobe then 
		Lasers._npc_flashlight_strobe = Lasers:init_strobe(Lasers.npc_flashlight_strobe)
	end
	return Lasers._npc_flashlight_strobe
end

function Lasers:GetOwnLaserStrobe()
	if not Lasers._own_laser_strobe then
		Lasers._own_laser_strobe = Lasers:init_strobe(Lasers.own_laser_strobe)
	end
	return Lasers._own_laser_strobe
end

function Lasers:GetSavedPlayerStrobe()
	if not (Lasers.settings.saved_strobe and type(Lasers.settings.saved_strobe) == "string") then 
		Lasers.settings.saved_strobe = Lasers:StrobeTableToString(Lasers.own_laser_strobe)
	end
	return Lasers.settings.saved_strobe
end

--generic team strobe if you choose to override your teammates' lasers to a custom strobe
function Lasers:GetTeamLaserStrobe()
	if not Lasers._team_laser_strobe then
		Lasers._team_laser_strobe = Lasers:init_strobe(Lasers.team_laser_strobe)
	end
	return Lasers._team_laser_strobe
end

function Lasers:GetWorldStrobe()
	if not Lasers._world_strobe then
		Lasers._world_strobe = Lasers:init_strobe(Lasers.world_strobe)
	end
	return Lasers._world_strobe
end
function Lasers:GetSniperStrobe()
	if not Lasers._sniper_strobe then
		Lasers._sniper_strobe = Lasers:init_strobe(Lasers.sniper_strobe)
	end
	return Lasers._sniper_strobe
end
function Lasers:GetTurretActiveStrobe()
	if not Lasers._turret_active_strobe then
		Lasers._turret_active_strobe = Lasers:init_strobe(Lasers.turret_active_strobe)
	end
	return Lasers._turret_active_strobe
end
function Lasers:GetTurretReloadStrobe()
	if not Lasers._turret_reload_strobe then
		Lasers._turret_reload_strobe = Lasers:init_strobe(Lasers.turret_reload_strobe)
	end
	return Lasers._turret_reload_strobe
end
function Lasers:GetTurretMadStrobe()
	if not Lasers._turret_mad_strobe then
		Lasers._turret_mad_strobe = Lasers:init_strobe(Lasers.turret_mad_strobe)
	end
	return Lasers._turret_mad_strobe
end

function Lasers:GetOwnLaserDisplayMode()
	return Lasers.settings.own_laser_display_mode == 1 and "off"
	or Lasers.settings.own_laser_display_mode == 2 and "vanilla"
	or Lasers:IsOwnLaserStrobeEnabled() and "strobe"
	or Lasers.settings.own_laser_display_mode == 3 and "custom"
end
function Lasers:GetTeamLaserDisplayMode()
	return Lasers.settings.team_laser_display_mode == 1 and "off"
	or Lasers.settings.team_laser_display_mode == 2 and "vanilla"
	or Lasers:IsTeamLaserStrobeEnabled() and "strobe"
	or Lasers.settings.team_laser_display_mode == 3 and "custom"
	or Lasers.settings.team_laser_display_mode == 4 and "Peer Color"
end
function Lasers:GetWorldDisplayMode()
	return Lasers.settings.world_display_mode == 1 and "off"
	or Lasers.settings.world_display_mode == 2 and "vanilla"
	or Lasers:IsWorldStrobeEnabled() and "strobe"
	or Lasers.settings.world_display_mode == 3 and "custom"
end
function Lasers:GetSniperDisplayMode()
	return Lasers.settings.sniper_display_mode == 1 and "off"
	or Lasers.settings.sniper_display_mode == 2 and "vanilla"
	or Lasers:IsSniperStrobeEnabled() and "strobe"
	or Lasers.settings.sniper_display_mode == 3 and "custom"
end
function Lasers:GetTurretDisplayMode()
	return Lasers.settings.turret_display_mode == 1 and "off"
	or Lasers.settings.turret_display_mode == 2 and "vanilla"
	or Lasers:IsTurretStrobeEnabled() and "strobe"
	or Lasers.settings.turret_display_mode == 3 and "custom"
end


function Lasers:IsNetworkingEnabled()
	return Lasers.settings.enabled_networking
end

function Lasers:IsMasterLaserStrobeEnabled()
	return Lasers.settings.enabled_laser_strobes_master
end

function Lasers:IsOwnLaserStrobeEnabled()
	return Lasers.settings.own_laser_strobe_enabled
end
function Lasers:IsOwnFlashlightStrobeEnabled()
	return Lasers.settings.own_flashlight_strobe_enabled
end
function Lasers:IsTeamFlashlightStrobeEnabled()
	return Lasers.settings.team_flashlight_strobe_enabled
end

function Lasers:GetTeamFlashlightColor()
	return Color(Lasers.settings.team_flash_red,Lasers.settings.team_flash_green,Lasers.settings.team_flash_blue):with_alpha(Lasers.settings.team_flash_alpha) or Lasers.col_generic
end
function Lasers:GetOwnFlashlightColor()
	return Color(Lasers.settings.own_flash_red,Lasers.settings.own_flash_green,Lasers.settings.own_flash_blue):with_alpha(Lasers.settings.own_flash_alpha) or Lasers.col_generic
end
function Lasers:GetFlashlightGlowAlpha()
	return Lasers.settings.flashlight_glow_opacity --or 16
end
function Lasers:GetFlashlightRange()
	return Lasers.settings.flashlight_range --or 10
end
function Lasers:GetFlashlightAngle()
	return Lasers.settings.flashlight_angle-- or 60
end

function Lasers:IsOwnLaserInvisible() 
	return Lasers.settings.own_laser_display_mode == 1
end
function Lasers:IsOwnLaserVanilla() 
	return Lasers.settings.own_laser_display_mode == 2
end
function Lasers:IsOwnLaserCustom() 
	return Lasers.settings.own_laser_display_mode == 3
end

function Lasers:IsTeamLaserInvisible() 
	return Lasers.settings.team_laser_display_mode == 1
end
function Lasers:IsTeamLaserVanilla() 
	return Lasers.settings.team_laser_display_mode == 2
end
function Lasers:IsTeamLaserCustom() 
	return Lasers.settings.team_laser_display_mode == 3
end
function Lasers:IsTeamLaserPeerColor()
	return Lasers.settings.team_laser_display_mode == 4
end
--disabled for now

function Lasers:SaveGadgetVanillaColor(unit,color)
	if not unit then return end
--	Lasers.teammate_vanilla_lasers[tostring(unit:key())] = color
	
	if not unit:base()._vanilla_tracker then 
		Lasers.vanilla_tracker = Lasers.vanilla_tracker + 1
		unit:base()._vanilla_tracker = Lasers.vanilla_tracker
		Lasers.teammate_vanilla_lasers[unit:base()._vanilla_tracker] = color
	end
end
--[[fun fact. I originally started a semi-complex
system to track lasers/flashlights by an independent unit id separate from the base game's. 
IMMEDIATELY after my final successful check before pushing this update, v2.7, i remembered the unit:key() method. 
heck.
--]]

function Lasers:IsOwnFlashlightInvisible() 
	return Lasers.settings.own_flashlight_display_mode == 1
end
function Lasers:IsOwnFlashlightVanilla() 
	return Lasers.settings.own_flashlight_display_mode == 2
end
function Lasers:IsOwnFlashlightCustom() 
	return Lasers.settings.own_flashlight_display_mode == 3
end

function Lasers:IsTeamFlashlightInvisible() 
	return Lasers.settings.team_flashlight_display_mode == 1
end
function Lasers:IsTeamFlashlightVanilla() 
	return Lasers.settings.team_flashlight_display_mode == 2
end
function Lasers:IsTeamFlashlightCustom() 
	return Lasers.settings.team_flashlight_display_mode == 3
end
function Lasers:IsTeamFlashlightPeerColor()
	return Lasers.settings.team_flashlight_display_mode == 4
end

function Lasers:IsTeamLaserInvisible() 
	return Lasers.settings.team_laser_display_mode == 1
end
function Lasers:IsTeamLaserVanilla() 
	return Lasers.settings.team_laser_display_mode == 2
end
function Lasers:IsTeamLaserCustom() 
	return Lasers.settings.team_laser_display_mode == 3
end
function Lasers:IsTeamLaserPeerColor()
	return Lasers.settings.team_laser_display_mode == 4
end

function Lasers:IsTeamLaserStrobeEnabled()
	return Lasers.settings.team_laser_strobe_enabled
end
function Lasers:IsWorldStrobeEnabled()
	return Lasers.settings.world_strobe_enabled
end
function Lasers:IsSniperStrobeEnabled()
	return Lasers.settings.sniper_strobe_enabled
end
function Lasers:IsTurretStrobeEnabled()
	return Lasers.settings.turret_strobe_enabled
end

function Lasers:IsTurretInvisible() 
	return Lasers.settings.turret_display_mode == 1
end
function Lasers:IsTurretVanilla() 
	return Lasers.settings.turret_display_mode == 2
end
function Lasers:IsTurretCustom() 
	return Lasers.settings.turret_display_mode == 3
end



function Lasers:IsSniperInvisible() 
	return Lasers.settings.sniper_display_mode == 1
end
function Lasers:IsSniperVanilla() 
	return Lasers.settings.sniper_display_mode == 2
end
function Lasers:IsSniperCustom() 
	return Lasers.settings.sniper_display_mode == 3
end

function Lasers:IsWorldInvisible() 
	return Lasers.settings.world_display_mode == 1
end
function Lasers:IsWorldVanilla() 
	return Lasers.settings.world_display_mode == 2
end
function Lasers:IsWorldCustom() 
	return Lasers.settings.world_display_mode == 3
end

function Lasers:StrobeTableToString(data)
	if not data or type(data) ~= "table" or not data.colors then
		lp_log("Invalid table data!")
		return
	end 
		
	local duration = data.duration or Lasers.default_max_colors		
	local color_count = data.color_count or 1

	local output = "l" .. duration
	
	for k,v in ipairs(data.colors) do
		output = output .. "c" .. LuaNetworking:ColourToString(v)
	end
	
	return output
end
	
--converting a table into strings with a string.split function	
function Lasers:StringToStrobeTable(data)
	local output = {
		colors = {},
		duration = Lasers.default_max_colors,
		color_count = 0
	}
	local split_strobe = string.split(data, "c")
	
	output.duration = tonumber(split_strobe[1]) or output.duration
	for k,v in ipairs(split_strobe) do
		if not v then
			lp_log("ERROR: Found invalid character in split string! Skipping...")
		elseif k == 1 then
--			lp_log("Skipping first key.")
		elseif v then
			output.color_count = k-1
			output.colors[output.color_count] = LuaNetworking:StringToColour(v)
		else
			lp_log("ERROR: Didn't find another color to add to the new strobe table...")
		end
	end
	
	return output
end

function Lasers:LoadStrobes()	
	local file = io.open(self._strobe_save_path, "r")
	if (file) then
		for k, v in pairs(json.decode(file:read("*all"))) do
			self.own_laser_strobe = Lasers:StringToStrobeTable(v)
		end
	end
	--don't create a save file here if there isn't already one

end

function Lasers:SaveStrobes(override)
	local file_exists = override or SystemFS:exists( Application:nice_path( Lasers._strobe_save_path, true ))
	if not file_exists then
		lp_log("No strobe save file found at" .. Lasers._strobe_save_path .. ".")
		return 
	end
	local compressed = {saved_strobe = Lasers:StrobeTableToString(Lasers.own_laser_strobe)}
	local file = io.open(self._strobe_save_path,"w+")
	if file then
		file:write(json.encode(compressed))
		file:close()
	end
end



--todo check against all possible settings vars so that updates introducing new settings vars won't crash people
function Lasers:Load()
	local file = io.open(self._data_path, "r")
	if (file) then
		for k, v in pairs(json.decode(file:read("*all"))) do
			self.settings[k] = v
		end
	else
		Lasers:Save() --create data in case there's no mod save data called lasersplus.txt; saves are only generated on changing any settings otherwise
	end
	if SystemFS:exists( Application:nice_path( SavePath .. Lasers.savename_3, true )) then
		os.remove( string.format("%s%s", SavePath, Lasers.savename_3) )
		Lasers:SaveStrobes(true)
	else
		Lasers:LoadStrobes()
	end
end

function Lasers:Save()
--	local result = Lasers:StrobeTableToString(Lasers.own_laser_strobe)
--	self.settings.saved_strobe = result
	Lasers:SaveStrobes()
	local file = io.open(self._data_path,"w+")
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_LasersPlus", function( loc )
	loc:load_localization_file( Lasers._path .. "en.txt")
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_LasersPlus", function(menu_manager)
	
	MenuCallbackHandler.callback_lp_master_enabled_toggle = function(self,item)
		local value = item:value() == 'on'
		Lasers.settings.enabled_mod_master = value
		Lasers:Save()
	end
	MenuCallbackHandler.callback_lp_redfilter_toggle = function(self,item)
		local value = item:value() == 'on'
		Lasers.settings.enabled_redfilter = value
		Lasers:Save()
	end
	MenuCallbackHandler.callback_lp_laser_strobes_enabled_toggle = function(self,item)
		local value = item:value() == 'on'
		Lasers.settings.enabled_laser_strobes_master = value
		Lasers:Save()
	end

	MenuCallbackHandler.callback_lp_networking_enabled_toggle = function(self,item)
		local value = item:value() == 'on'
		Lasers.settings.enabled_networking = value
		Lasers:Save()
	end
	
	MenuCallbackHandler.callback_lp_own_laser_display_mode_multiplechoice = function(self,item)
		Lasers.settings.own_laser_display_mode = tonumber(item:value())
		Lasers:Save()
	end
		MenuCallbackHandler.callback_lp_own_laser_strobe_enabled_toggle = function(self,item)
			local value = item:value() == 'on'
			Lasers.settings.own_laser_strobe_enabled = value
			Lasers:Save()
		end	
		MenuCallbackHandler.callback_lp_own_laser_r_slider = function(self,item)
			Lasers.settings.own_laser_red = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_own_laser_g_slider = function(self,item)
			Lasers.settings.own_laser_green = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_own_laser_b_slider = function(self,item)
			Lasers.settings.own_laser_blue = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_own_laser_a_slider = function(self,item)
			Lasers.settings.own_laser_alpha = item:value()
			Lasers:Save()
		end
		
	MenuCallbackHandler.callback_lp_own_flashlight_strobe_enabled_toggle = function(self,item)
		local value = item:value() == 'on'
		Lasers.settings.own_flashlight_strobe_enabled = value
		Lasers:Save()
	end	
		MenuCallbackHandler.callback_lp_own_flashlight_display_mode_multiplechoice = function(self,item)
			Lasers.settings.own_flashlight_display_mode = tonumber(item:value())
			Lasers:Save()
		end		
		MenuCallbackHandler.callback_lp_own_flashlight_r_slider = function(self,item)
			Lasers.settings.own_flash_red = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_own_flashlight_g_slider = function(self,item)
			Lasers.settings.own_flash_green = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_own_flashlight_b_slider = function(self,item)
			Lasers.settings.own_flash_blue = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_own_flashlight_a_slider = function(self,item)
			Lasers.settings.own_flash_alpha = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_flashlight_glow_a_slider = function(self,item)
			Lasers.settings.flashlight_glow_opacity = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_flashlight_range_slider = function(self,item)
			Lasers.settings.flashlight_range = item:value()
			Lasers.flag_update_flashlight = true
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_flashlight_angle_slider = function(self,item)
			Lasers.settings.flashlight_angle = item:value()
			Lasers.flag_update_flashlight = true
			Lasers:Save()
		end
	
	MenuCallbackHandler.callback_lp_team_laser_display_mode_multiplechoice = function(self,item)
		Lasers.settings.team_laser_display_mode = tonumber(item:value())
		Lasers:Save()
	end
	MenuCallbackHandler.callback_lp_team_laser_strobe_enabled_toggle = function(self,item)
		local value = item:value() == 'on'
		Lasers.settings.team_laser_strobe_enabled = value
		Lasers:Save()
	end		
		MenuCallbackHandler.callback_lp_team_laser_r_slider = function(self,item)
			Lasers.settings.team_laser_red = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_team_laser_g_slider = function(self,item)
			Lasers.settings.team_laser_green = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_team_laser_b_slider = function(self,item)
			Lasers.settings.team_laser_blue = item:value()		
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_team_laser_a_slider = function(self,item)
			Lasers.settings.team_laser_alpha = item:value()
			Lasers:Save()
		end

	MenuCallbackHandler.callback_lp_team_flashlight_strobe_enabled_toggle = function(self,item)
		local value = item:value() == 'on'
		Lasers.settings.team_flashlight_strobe_enabled = value
		Lasers:Save()
	end	
		MenuCallbackHandler.callback_lp_team_flashlight_display_mode_multiplechoice = function(self,item)
			Lasers.settings.team_flashlight_display_mode = tonumber(item:value())
			Lasers:Save()
		end		
		MenuCallbackHandler.callback_lp_team_flashlight_r_slider = function(self,item)
			Lasers.settings.team_flash_red = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_team_flashlight_g_slider = function(self,item)
			Lasers.settings.team_flash_green = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_team_flashlight_b_slider = function(self,item)
			Lasers.settings.team_flash_blue = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_team_flashlight_a_slider = function(self,item)
			Lasers.settings.team_flash_alpha = item:value()
			Lasers:Save()
		end
		
	MenuCallbackHandler.callback_lp_world_display_mode_multiplechoice = function(self,item)
		Lasers.settings.world_display_mode = tonumber(item:value())
		Lasers:Save()
	end
	MenuCallbackHandler.callback_lp_world_strobe_enabled_toggle = function(self,item)
		local value = item:value() == 'on'
		Lasers.settings.world_strobe_enabled = value
		Lasers:Save()
	end	
	
	MenuCallbackHandler.callback_lp_wl_r_slider = function(self,item)
		Lasers.settings.wl_red = item:value()
		Lasers:Save()
	end
	MenuCallbackHandler.callback_lp_wl_g_slider = function(self,item)
		Lasers.settings.wl_green = item:value()
		Lasers:Save()
	end
	MenuCallbackHandler.callback_lp_wl_b_slider = function(self,item)
		Lasers.settings.wl_blue = item:value()
		Lasers:Save()
	end
	MenuCallbackHandler.callback_lp_wl_a_slider = function(self,item)
		Lasers.settings.wl_alpha = item:value()
		Lasers:Save()
	end

	MenuCallbackHandler.callback_lp_sniper_display_mode_multiplechoice = function(self,item)
		Lasers.settings.sniper_display_mode = tonumber(item:value())
		Lasers:Save()
	end
	MenuCallbackHandler.callback_lp_sniper_strobe_enabled_toggle = function(self,item)
		local value = item:value() == 'on' and true or false
		Lasers.settings.sniper_strobe_enabled = value
		Lasers:Save()
	end
		MenuCallbackHandler.callback_lp_snpr_r_slider = function(self,item)
			Lasers.settings.snpr_red = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_snpr_g_slider = function(self,item)
			Lasers.settings.snpr_green = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_snpr_b_slider = function(self,item)
			Lasers.settings.snpr_blue = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_snpr_a_slider = function(self,item)
			Lasers.settings.snpr_alpha = item:value()
			Lasers:Save()
		end

	MenuCallbackHandler.callback_lp_turret_display_mode_multiplechoice = function(self,item)
		Lasers.settings.turret_display_mode = tonumber(item:value())
		Lasers:Save()
	end
	MenuCallbackHandler.callback_lp_turret_strobe_enabled_toggle = function(self,item)
		local value = item:value() == 'on'
		Lasers.settings.turret_strobe_enabled = value
		Lasers:Save()
	end	
		MenuCallbackHandler.callback_lp_turr_att_r_slider = function(self,item)
			Lasers.settings.turr_att_red = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_turr_att_g_slider = function(self,item)
			Lasers.settings.turr_att_green = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_turr_att_b_slider = function(self,item)
			Lasers.settings.turr_att_blue = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_turr_att_a_slider = function(self,item)
			Lasers.settings.turr_att_alpha = item:value()
			Lasers:Save()
		end
		
		MenuCallbackHandler.callback_lp_turr_rld_r_slider = function(self,item)
			Lasers.settings.turr_rld_red = item:value()
			Lasers:Save()
		end	
		MenuCallbackHandler.callback_lp_turr_rld_g_slider = function(self,item)
			Lasers.settings.turr_rld_green = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_turr_rld_b_slider = function(self,item)
			Lasers.settings.turr_rld_blue = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_turr_rld_a_slider = function(self,item)
			Lasers.settings.turr_rld_alpha = item:value()
			Lasers:Save()
		end

		MenuCallbackHandler.callback_lp_turr_ecm_r_slider = function(self,item)
			Lasers.settings.turr_ecm_red = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_turr_ecm_g_slider = function(self,item)
			Lasers.settings.turr_ecm_green = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_turr_ecm_b_slider = function(self,item)
			Lasers.settings.turr_ecm_blue = item:value()
			Lasers:Save()
		end
		MenuCallbackHandler.callback_lp_turr_ecm_a_slider = function(self,item)
			Lasers.settings.turr_ecm_alpha = item:value()
			Lasers:Save()
		end

	MenuCallbackHandler.callback_lp_blackmarket_qol_toggle = function(self,item)
		Lasers.settings.enabled_blackmarket_qol = item:value() == 'on'
		Lasers:Save()
	end
	
	MenuCallbackHandler.callback_lp_sight_type_multiplechoice = function(self,item)
		Lasers.settings.sight_type = tonumber(item:value())
		Lasers:Save()
	end
	
	MenuCallbackHandler.callback_lp_sight_color_multiplechoice = function(self,item)
		Lasers.settings.sight_color = tonumber(item:value())
		Lasers:Save()
	end
	MenuCallbackHandler.callback_lp_multigadget_toggle = function(self,item)
		Lasers.settings.enabled_multigadget = item:value() == 'on'
		Lasers:Save()
	end
	MenuCallbackHandler.callback_lp_disabled_sight_cycle_toggle = function(self,item)
		Lasers.settings.disabled_sight_cycle = item:value() == 'on'
		Lasers:Save()
	end	
	
	MenuCallbackHandler.lp_toggle_sight_gadget = function(self)
		if Utils:IsInHeist() and Utils:IsInCustody() == false and Utils:IsInGameState() then--doesn't cover all cases, but it at least shouldn't crash
			local state = managers.player:local_player():movement():current_state()
			local wpn = state._equipped_unit:base()	
			
			if not wpn._second_sight_data or not wpn._second_sight_data.unit then
				return false
			end

			local secondsight = wpn._second_sight_data.unit:base()
			secondsight:set_state( not secondsight:is_on(), wpn._sound_fire, false )
--			secondsight:toggle() --toggles the sight gadget
			state:_stance_entered() --refreshes stance
		end
	end
	
	MenuCallbackHandler.callback_lp_close = function(this)
		Lasers:Save()
	end
	Lasers:Load()
	MenuHelper:LoadFromJsonFile(Lasers._path .. "options.txt", Lasers, Lasers.settings)	
	
end)


--[[

function Lasers:GetTurretActiveColor()
	return Lasers.DefaultTeamColors[3]
end
function Lasers:GetTurretReloadStrobe()
	return Lasers.DefaultTeamColors[4]
end
function Lasers:GetTurretMadStrobe()
	return Lasers.DefaultTeamColors[2]
end
function Lasers:GetPlayerGradient()--
	return Lasers.settings.selected_gradient
end

Lasers.rainbow = {
	colors = {
		[1] = Color(1,0,0):with_alpha(Lasers.DefaultOpacity),
		[2] = Color(0,1,0):with_alpha(Lasers.DefaultOpacity),
		[3] = Color(0,0,1):with_alpha(Lasers.DefaultOpacity),
		[4] = Color(1,0,0):with_alpha(Lasers.DefaultOpacity)
	},
	locations = {
		[1] = 0,
		[2] = 33,
		[3] = 66,
		[4] = 99
	
	}
}


function lp_log(message)
	if Lasers.debugLogsEnabled then 
		log("Lasers Plus: " .. message)
	end
end
--]]
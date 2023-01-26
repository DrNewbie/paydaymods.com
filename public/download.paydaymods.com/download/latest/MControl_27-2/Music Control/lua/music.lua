-- # MUSIC CONTROL #
---------------------
if not _G.Music then
	_G.Music = _G.Music or {}
	-- ### LOCAL FILE PATHS ###
	Music._path = ModPath
	Music._luac = Music._path .. "lua/"
	Music._loca = Music._path .. "loc/"
	Music._menu = Music._path .. "menu/"
	Music._name = Music._path .. "name/"
	Music._data = Music._luac .. "tweak.lua"
	Music._base = Music._loca .. "local.txt"
	Music._song = Music._name .. "songs.txt"
	Music._memo = Music._name .. "memos.txt"
	-- #### STORES FILE IN SAVE FOLDER ###
	Music._save = SavePath .. "music_control.txt"
	Music._rootmenu = SavePath .. "music_list_a.txt"
	Music._betamenu = SavePath .. "music_list_b.txt"
	Music._gammmenu = SavePath .. "music_list_c.txt"
	Music._deltmenu = SavePath .. "music_list_d.txt"
	Music._epsimenu = SavePath .. "music_list_e.txt"
	Music._roottrak = SavePath .. "music_list_f.txt"
	Music._betatrak = SavePath .. "music_list_g.txt"
	Music._gammtrak = SavePath .. "music_list_h.txt"
	Music._delttrak = SavePath .. "music_list_i.txt"
	Music._epsitrak = SavePath .. "music_list_j.txt"
	-- #### STORES SELECTED OPTIONS ####
	Music.settings = { editor = '%windir%\\system32\\notepad.exe', }
	Music.jukebox_music_tracks = {}
	Music.jukebox_menu_tracks = {}
	Music.settings_rootmenu = {}
	Music.settings_betamenu = {}
	Music.settings_gammmenu = {}
	Music.settings_deltmenu = {}
	Music.settings_epsimenu = {}
	Music.settings_roottrak = {}
	Music.settings_betatrak = {}
	Music.settings_gammtrak = {}
	Music.settings_delttrak = {}
	Music.settings_epsitrak = {}
	-- #### STORES SELECTED MUSIC ####
	Music.list_custom_track = {}
	Music.list_custom_menu = {}
	Music.list_rootmenu = {}
	Music.list_betamenu = {}
	Music.list_gammmenu = {}
	Music.list_deltmenu = {}
	Music.list_epsimenu = {}
	Music.list_roottrak = {}
	Music.list_betatrak = {}
	Music.list_gammtrak = {}
	Music.list_delttrak = {}
	Music.list_epsitrak = {}
	-- #### STORES SETTINGS ####
	Music.juke_track = 1
	Music.juke_menu = 1
	Music.juke_rootmenu = 1
	Music.juke_betamenu = 1
	Music.juke_gammmenu = 1
	Music.juke_deltmenu = 1
	Music.juke_epsimenu = 1
	Music.juke_roottrak = 1
	Music.juke_betatrak = 1
	Music.juke_gammtrak = 1
	Music.juke_delttrak = 1
	Music.juke_epsitrak = 1
	Music.current_mode = 3
	Music.current_list = 0
	Music.songs = {}
	Music.autos = 0
	Music.clock = 0
	Music.timer = 0
	Music.block_lv = false
	Music.autowave = false
	Music.pressed = false
	Music.pause = false
end
-------- ## NOTES ##
-- managers.groupai:state():whisper_mode()
-- managers.mission:call_global_event("start_assault")
-------- ## BUILD ##
function Music:Build()
if not Music.build then
	Music.build = true
	Music.build_update = "27 June 2016"
	Music.build_version = "r27"
	Music.build_author = "Spiltmilk"
end end
-------- ## TRACK DISPLAY ##
-- NOTE: DISPLAYS PLAYLIST INFORMATION WHEN TABBING IN-GAME
if RequiredScript == "lib/managers/musicmanager" then
	local MusicManager_current_track_string_save = MusicManager.current_track_string
	function MusicManager:current_track_string()
		local level_data = Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]
		if level_data and level_data.music == "no_music" then
			Music:Label( 0, "[secs]", string.format("%.1f", Music.clock) .. " | " .. string.format("%.1f", Music.autos) )
			return utf8.to_upper( Music:MusicLocked() )
		end
		if (Music:get_list() == 0 and Music.pressed == true) or ((Music:get_list() == 0 or Music:get_list() == 1 or Music:get_list() == 2
		or Music:get_list() == 3 or Music:get_list() == 4 or Music:get_list() == 5 or Music:get_list() == 6) and Music.autowave == true and Music.pressed == true and Music:EventLock() == false) then
			Music:Label( 0, "[secs]", string.format("%.1f", Music.clock) .. " | " .. string.format("%.1f", Music.autos) )
			return utf8.to_upper( Music:List_A() )
		elseif (Music:get_list() == 7 and Music.pressed == true) or (Music:get_list() == 7 and Music.autowave == true and Music.pressed == true and Music:EventLock() == false) then
			Music:Label( 0, "[secs]", string.format("%.1f", Music.clock) .. " | " .. string.format("%.1f", Music.autos) )
			return utf8.to_upper( Music:List_H() )
		elseif (Music:get_list() == 8 and Music.pressed == true) or (Music:get_list() == 8 and Music.autowave == true and Music.pressed == true and Music:EventLock() == false) then
			Music:Label( 0, "[secs]", string.format("%.1f", Music.clock) .. " | " .. string.format("%.1f", Music.autos) )
			return utf8.to_upper( Music:List_I() )
		elseif (Music:get_list() == 9 and Music.pressed == true) or (Music:get_list() == 9 and Music.autowave == true and Music.pressed == true and Music:EventLock() == false) then
			Music:Label( 0, "[secs]", string.format("%.1f", Music.clock) .. " | " .. string.format("%.1f", Music.autos) )
			return utf8.to_upper( Music:List_J() )
		elseif (Music:get_list() == 10 and Music.pressed == true) or (Music:get_list() == 10 and Music.autowave == true and Music.pressed == true and Music:EventLock() == false) then
			Music:Label( 0, "[secs]", string.format("%.1f", Music.clock) .. " | " .. string.format("%.1f", Music.autos) )
			return utf8.to_upper( Music:List_K() )
		elseif (Music:get_list() == 11 and Music.pressed == true) or (Music:get_list() == 11 and Music.autowave == true and Music.pressed == true and Music:EventLock() == false) then
			Music:Label( 0, "[secs]", string.format("%.1f", Music.clock) .. " | " .. string.format("%.1f", Music.autos) )
			return utf8.to_upper( Music:List_L() )
		elseif ((Music:get_list() == 0 or Music:get_list() == 7 or Music:get_list() == 8 or Music:get_list() == 9 or Music:get_list() == 10 or Music:get_list() == 11) and Music.pressed == false) or (Music.autowave == true and Music.pressed == false and Music:EventLock() == false) then
			Music:Label( 0, "[secs]", string.format("%.1f", Music.clock) .. " | " .. string.format("%.1f", Music.autos) )
			return utf8.to_upper(managers.localization:text("menu_jukebox_" .. Global.music_manager.current_track))
		elseif (Music:get_list() == 1 and Music.autowave == false) or (Music:get_list() == 1 and Music:EventLock() == true) then
			Music:Label( 0, "[secs]", string.format("%.1f", Music.clock) .. " | " .. string.format("%.1f", Music.autos) )
			return utf8.to_upper( Music:List_B() )
		elseif (Music:get_list() == 2 and Music.autowave == false) or (Music:get_list() == 2 and Music:EventLock() == true) then
			Music:Label( 0, "[secs]", string.format("%.1f", Music.clock) .. " | " .. string.format("%.1f", Music.autos) )
			return utf8.to_upper( Music:List_C() )
		elseif (Music:get_list() == 3 and Music.autowave == false) or (Music:get_list() == 3 and Music:EventLock() == true) then
			Music:Label( 0, "[secs]", string.format("%.1f", Music.clock) .. " | " .. string.format("%.1f", Music.autos) )
			return utf8.to_upper( Music:List_D() )
		elseif (Music:get_list() == 4 and Music.autowave == false) or (Music:get_list() == 4 and Music:EventLock() == true) then
			Music:Label( 0, "[secs]", string.format("%.1f", Music.clock) .. " | " .. string.format("%.1f", Music.autos) )
			return utf8.to_upper( Music:List_E() )
		elseif (Music:get_list() == 5 and Music.autowave == false) or (Music:get_list() == 5 and Music:EventLock() == true) then
			Music:Label( 0, "[secs]", string.format("%.1f", Music.clock) .. " | " .. string.format("%.1f", Music.autos) )
			return utf8.to_upper( Music:List_F() )
		elseif (Music:get_list() == 6 and Music.autowave == false) or (Music:get_list() == 6 and Music:EventLock() == true) then
			Music:Label( 0, "[secs]", string.format("%.1f", Music.clock) .. " | " .. string.format("%.1f", Music.autos) )
			return utf8.to_upper( Music:List_G() )
		else
			Music:Label( 0, "[tab_display]", "error" )
			return utf8.to_upper(managers.localization:text("menu_jukebox_" .. Global.music_manager.current_track))
		end
		return MusicManager_current_track_string_save(self)
	end
end
-------- ## SHUFFLE ##
function Music:Shuffle()
	if Music.settings.mcontrol_shuffle == true then
		Music.music_call_random_func()
	else
		Music.music_call_next_func()
	end
end
-------- ## ASSAULT WAVES (DISPLAY-1) ##
if RequiredScript == "lib/tweak_data/levelstweakdata" then
	-- NOTE: ENABLES THE SOUNDTRACK TAB FOR MUSIC-LOCKED MAPS
	local stage_title = "Stage" .. " : "
	function LevelsTweakData:get_music_event(stage)
		local level_data = Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]
		local music_id = level_data and level_data.music or "default"
		local stage_id = string.upper(string.sub(stage, 1, 1)) .. string.sub(stage, 2)
		local stage = stage
		if music_id == "no_music" then
			Music:Label( 2, stage_title, stage_id )
			Music:Label( 0, music_id, stage )
			Music.block_lv = true
			return nil
		elseif music_id == "heist" then
			Music.autowave = true
			if stage == "control" and Music.settings.mcontrol_switchonwave == true then
				Music:Shuffle()
			end
			if Music:EventLock() == true then stage = nil end
			Music:Label( 2, stage_title, stage_id )
			Music:Label( 0, music_id, stage )
		else
			Music:Label( 0, "[autowave]", "error" )
			Music:Label( 0, music_id, stage )
		end
		return tweak_data.music[music_id][stage]
	end
end
-------- ## 2D TEXT DISPLAY ##
function Music:Display()
	if not Music.start_text then
	Music.loadws = Overlay:newgui():create_screen_workspace()
	Music.fonttype = tweak_data.menu.pd2_small_font
	Music.fontsize = tweak_data.menu.pd2_small_font_size
	Music.xval = RenderSettings.resolution.x
	Music.yval = RenderSettings.resolution.y
	if Music.xval >= 600 and Music.xval < 800 then
		Music.fontsize = 10
	elseif Music.xval >= 800 and Music.xval < 1024 then
		Music.fontsize = 15
	elseif Music.xval >= 1024 and Music.xval < 1280 then
		Music.fontsize = 20
	else
		Music.fontsize = 30
	end
	Music.nth = Music.loadws:panel():text
	{
		name = "nth",
		x = - (Music.xval/2.1) + 0.5 * Music.xval,
		y = - (Music.yval/4) + 4.7/9 * Music.yval,
		text = "", font = Music.fonttype,
		font_size = Music.fontsize,
		color = Color("fdf6b7"),
		layer = 1
	}
	Music.sth = Music.loadws:panel():text
	{
		name = "sth",
		x = - (Music.xval/2.1) + 0.5 * Music.xval,
		y = - (Music.yval/4) + 5.0/9 * Music.yval,
		text = "", font = Music.fonttype,
		font_size = Music.fontsize,
		color = tweak_data.system_chat_color,
		layer = 1
	}
	Music.start_text = true
	Music.nth:show() Music.sth:show()
	end
end
-------- ## LOAD ##
function Music:Load(settings, directory)
	local file = io.open(directory, "r")
	if file then
		for k, v in pairs(json.decode(file:read("*all")) or {}) do
			settings[k] = v
		end
		file:close()
	end
end
-------- ## SAVE ##
-- NOTE: DELETE BLANK FILES
function Music:Save(settings, directory)
	if next(settings) == nil then
		os.remove(directory)
	else
		local file = io.open(directory, "w+")
		if file then
			file:write(json.encode(settings))
			file:close()
		end
	end
end
-------- ## REMOVE ##
function Music:Remove(directory)
	os.remove(directory)
end
-------- ## SHUTDOWN ##
function Music:Shutdown(data, time)
	if time == nil then time = 4 end
	if data == nil then data = "shutdown" end
	DelayedCalls:Add( data, time, function() os.exit(0) end )
end
-------- ## SOUND MENU ##
function Music:SoundMenu(name)
	if name == nil then return end
	managers.menu:post_event(name)
end
-------- ## SOUND POST ##
function Music:SoundPost(name)
	if name == nil then return end
	managers.music:post_event(name)
end
-------- ## SOUND PLAY ##
function Music:SoundPlay(name, arg1, arg2)
	if name == nil then return end
	if arg1 == nil then arg1 = false end
	if arg2 == nil then arg2 = false end
	if managers.player:local_player() ~= nil then
		managers.player:local_player():sound():say(name, arg1, arg2)
	end
end
-------- ## DIALOG ##
function Music:Dialog(title, message, option)
	local menu = QuickMenu:new(title, message, option)
	menu:Show()
end
-------- ## DATASCAN ##
function Music:DataScan(datafile)
	lines = {}
	for num in io.lines(datafile) do
		lines[#lines+1] = num
	end
	return lines
end
-------- ## DATABASE ##
function Music:DataBase(datafile)
	if not io.file_is_readable(datafile) then
		local c_file = io.open(datafile, "r")
		if not c_file then return false end
	end
	if c_file then c_file:close() end
	return true
end
-------- ## DATACOPY ##
-- NOTE: COPIES CONTENT OF OLD FILE TO NEW FILE
function Music:DataCopy(oldfile, newfile)
	local subject local file = io.open(oldfile, "r")
	if Music:DataBase( oldfile ) then
		local lines = Music:DataScan( oldfile )
		subject = file:read("*all")
		subject = string.gsub( subject, subject, subject )
		file:close()
		file = io.open( newfile, "w+" )
		file:write( subject )
		file:close()
	end
end
-------- ## MUSIC RENAME ##
-- NOTE: OPENS SONGS FILE OR RUNS UPDATE IF FILE IS MISSING
function Music:MusicRename(data)
	local memo = Music._memo
	local song = Music._song
	if data == 0 then
		if io.file_is_readable(song) then
			if self:DataBase(song) then 
				os.execute(string.format('start "%s" "%s"', Music.settings.editor, song)) 
			end
			self:SoundMenu("item_buy")
			return
		else
			self:MusicRename(1)
		end
	elseif data == 1 then
		if io.file_is_readable(memo) then
			self:Remove(memo)
			self:MusicUpdate(1)
			self:MusicRename(0)
		else
			self:MusicUpdate(1)
			self:MusicRename(0)
		end
	end
end
-------- ## MUSIC UPDATE ##
-- NOTE: UPDATES OR CREATE SONGS FILE BASED ON CONDITIONS
function Music:MusicUpdate(data)
	local sub local msg
	local pass = false
	local opts = {}
	local memo = Music._memo -- LETS US KNOW IF RESTART TOOK PLACE
	local song = Music._song -- SONGS FILE
	if data == 0 then
		if io.file_is_readable(memo) then
			self:Remove(memo)
			self:MusicUpdate(1)
		else
			if io.file_is_readable(song) then
				sub = utf8.to_upper(managers.localization:text("music_musupd_name"))
				msg = utf8.to_upper(managers.localization:text("music_musupd_desc"))
				opts = {
					[1] = { text = utf8.to_upper(managers.localization:text("music_yes")), callback = function() self:MusicUpdate(2) end },
					[2] = { text = utf8.to_upper(managers.localization:text("music_no")), is_cancel_button = true }
				}
				self:Dialog(sub, msg, opts)
			else
				self:MusicUpdate(1)
			end
		end
	elseif data == 1 then
		local file = io.open(song, "w+")
		local i = 0
		file:write("{","\n")
		for id, data in ipairs(tweak_data.music.track_list) do
			if type(data.track) == "string" then
				i = i + 1
				local track_pre = "menu_jukebox_" .. tostring(data.track)
				local track_loc = managers.localization:text(track_pre)
				local track_fmt = "\t\"" .. tostring(track_pre) .. "\"" .. " : " .. "\"" .. tostring(track_loc) .. "\"\n"
				file:write(track_fmt)
			end
		end
		for id, data in ipairs(tweak_data.music.track_menu_list) do
			if type(data.track) == "string" then
				i = i + 1
				local track_pre = "menu_jukebox_screen_" .. tostring(data.track)
				local track_loc = managers.localization:text(track_pre)
				if track_pre == "menu_jukebox_screen_ode_all_avidita" then
					track_loc = "Ode All'Avidita"
				elseif track_pre == "menu_jukebox_screen_ode_all_avidita_instrumental" then
					track_loc = "Ode All'Avidita (Instrumental)"
				end
				local track_fmt = "\t\"" .. tostring(track_pre) .. "\"" .. " : " .. "\"" .. tostring(track_loc) .. "\"\n"
				file:write(track_fmt)
			end
		end
		file:write("}")
		file:close()
		sub = utf8.to_upper(managers.localization:text("music_musupd_name"))
		msg = utf8.to_upper(managers.localization:text("music_musupd_make"))
		self:Label( 3, sub, msg .. " : " .. i )
		Music.settings.total_songs = i
		self:Save(Music.settings, Music._save)
		pass = true
	elseif data == 2 then
		self:Remove(song)
		local file = io.open(memo, "w+")
		file:write(utf8.to_upper(managers.localization:text("music_update_name")))
		file:close()
		self:Shutdown("MusicUpdate", 4)
		sub = utf8.to_upper(managers.localization:text("music_musupd_name"))
		msg = utf8.to_upper(managers.localization:text("music_musupd_exit"))
		self:Label( 3, sub, msg )
	end
	self:SoundMenu(pass and "infamous_player_join_stinger" or "camera_monitor_engage")
end
-------- ## CHAT ##
function Music:Chat()
	local value = false
	if managers.hud ~= nil and managers.hud._chat_focus == true then
        value = true
    end
    if managers.menu_component ~= nil and managers.menu_component._game_chat_gui ~= nil and managers.menu_component._game_chat_gui:input_focus() == true then
        value = true
    end
	return value
end
-------- ## FORMAT ##
function Music:Format(amount)
	local left, num, right = string.match(amount,"^([^%d]*%d)(%d*)(.-)$")
	return left .. (num:reverse():gsub("(%d%d%d)","%1,"):reverse()) .. right
end
-------- ## TOTAL ##
function Music:Total()
	local m = self:Format(tostring(managers.money:total()))
	m = "$" .. m
	return m
end
-------- ## OFFSHORE ##
function Music:Offshore()
	local m = self:Format(tostring(managers.money:offshore()))
	m = "$" .. m
	return m
end
-------- ## PACKAGE ##
-- NOTE: LOADS PLAYLIST MANAGER AND SAFE MUSIC PACKAGE
function Music:Package()
	if not Music.start_menu then
	PackageManager:load("packages/start_menu")
	Music:PlaylistSetup()
	Music.start_menu = true
	end
end
-------- ## OVERRIDE ASSAULT ##
-- NOTE: IGNORE GAME REQUEST TO SWITCH MUSIC MODES DURING ASSAULT WAVES
function Music:EventLock()
	local value = false
	if Music.settings.mcontrol_eventlock == true and Utils:IsInHeist() then
		value = true
	end
	return value
end
-------- ## RESTRICT MAP ##
-- NOTE: HEISTS THAT ARE MUSIC-LOCKED BY OVERKILL (I.E. MURKY, SHADOW RAID, ALESSO)
function Music:isRestrictMap()
 local value = false
	if Music.block_lv == true then
		value = true
	end
	return value
end
-------- ## AUDIO ##
function Music:Audio()
	if Music.pause == true then
		managers.music:track_listen_start("stop_all_music")
		if Utils:IsInHeist() then
			self:SoundPlay("stop_all_music")
		end
	elseif Music.pause == false then
		managers.music:track_listen_stop()
	end
end
-------- ## LABEL ##
function Music:Label(type, sub, msg)
	self:Display() self:Update()
	-- 2D TEXT - BASE
	if Music.settings.mcontrol_label == 2 and type == 1 then
		Music.clock = 0
		Music.nth:set_text(utf8.to_upper(sub)) Music.sth:set_text(utf8.to_upper(msg))
	-- FADE TEXT - BASE
	elseif Music.settings.mcontrol_label == 3 and type == 1 then
		managers.mission._fading_debug_output:script().log(tostring(msg), tweak_data.system_chat_color)
		managers.mission._fading_debug_output:script().log(tostring(sub), Color("a7ddf4"))
	-- 2D TEXT - DISPLAY STAGE
	elseif Music.settings.mcontrol_label == 2 and type == 2 and Music.settings.mcontrol_stage == true then
		Music.clock = 0
		Music.nth:set_text(utf8.to_upper(sub)) Music.sth:set_text(utf8.to_upper(msg))
	-- FADE TEXT - DISPLAY STAGE
	elseif Music.settings.mcontrol_label == 3 and type == 2 and Music.settings.mcontrol_stage == true then
		managers.mission._fading_debug_output:script().log(tostring(msg), tweak_data.system_chat_color)
		managers.mission._fading_debug_output:script().log(tostring(sub), Color("a7ddf4"))
	-- DISABLED TEXT - DISPLAY STAGE
	elseif Music.settings.mcontrol_label == 1 and type == 2 and Music.settings.mcontrol_stage == true then
		Music.clock = 0
		Music.nth:set_text(utf8.to_upper(sub)) Music.sth:set_text(utf8.to_upper(msg))
	-- DISABLED TEXT - FORCE MESSAGE
	elseif type == 3 then
		Music.clock = 0
		Music.nth:set_text(utf8.to_upper(sub)) Music.sth:set_text(utf8.to_upper(msg))
	-- DEBUG TEXT
	elseif Music.settings.mcontrol_debug == true and type == 0 then
		managers.mission._fading_debug_output:script().log(tostring(msg), Color("ccec75"))
		managers.mission._fading_debug_output:script().log(tostring(sub), Color("ffbe4f"))
	end
end
-------- ## UPDATE ##
-- NOTE: DURATION OF TEXT AND AUTOPLAY
function Music:Update()
	if not Music.start_time then
		local original_data = DynamicResourceManager.update
		function DynamicResourceManager:update()
			original_data(self)
			if Music.clock >= 0 and Music.clock <= 8 then
				Music.clock = Music.clock + 0.01
			else
				Music.clock = 0
				Music.nth:set_text(utf8.to_upper(""))
				Music.sth:set_text(utf8.to_upper(""))
			end
			if Music.autos >= 0 and Music.autos <= Music.timer then
				Music.autos = Music.autos + 0.01
			else
				Music.autos = 0
				if Music.settings.mcontrol_switch == 2 
				or Music.settings.mcontrol_switch == 3
				or Music.settings.mcontrol_switch == 4
				or Music.settings.mcontrol_switch == 5
				or Music.settings.mcontrol_switch == 6
				or Music.settings.mcontrol_switch == 7
				or Music.settings.mcontrol_switch == 8
				or Music.settings.mcontrol_switch == 9
				and Music.pause == false then
					Music:Shuffle()
				end
			end
			if Music.settings.mcontrol_switch == 2 then
				Music.timer = 30
			elseif Music.settings.mcontrol_switch == 3 then
				Music.timer = 60
			elseif Music.settings.mcontrol_switch == 4 then
				Music.timer = 120
			elseif Music.settings.mcontrol_switch == 5 then
				Music.timer = 180
			elseif Music.settings.mcontrol_switch == 6 then
				Music.timer = 240
			elseif Music.settings.mcontrol_switch == 7 then
				Music.timer = 300
			elseif Music.settings.mcontrol_switch == 8 then
				Music.timer = 360
			elseif Music.settings.mcontrol_switch == 9 then
				Music.timer = 420
			else
				Music.timer = 0
			end
		end
		Music.start_time = true
	end
end
-------- ## ASSAULT WAVES (DISPLAY-2) ##
function Music:Stage()
	local stage_title = managers.localization:text("music_stage") .. " : "
	function LevelsTweakData:get_music_event(stage)
		local level_data = Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]
		local music_id = level_data and level_data.music or "default"
		local stage_id = string.upper(string.sub(stage, 1, 1)) .. string.sub(stage, 2)
		local stage = stage
		if music_id == "no_music" then
			Music:Label( 2, stage_title, stage_id )
			Music:Label( 0, music_id, stage )
			Music.block_lv = true
			return nil
		elseif music_id == "heist" then
			Music.autowave = true
			if stage == "control" and Music.settings.mcontrol_switchonwave == true then
				Music:Shuffle()
			end
			if Music:EventLock() == true then stage = nil end
			Music:Label( 2, stage_title, stage_id )
			Music:Label( 0, music_id, stage )
		else
			Music:Label( 0, "[autowave]", "error" )
		end
		return tweak_data.music[music_id][stage]
	end
end
-------- ## PLAY ##
function Music:Play(song)
	self:Mode(song, "play")
end
-------- ## MODE ##
function Music:Mode( song, song_change )
	if Utils:IsInHeist() and Music:isRestrictMap() == false then Music.pressed = true end
	if Music.current_mode == 0 then
		self:List( song, "setup", song_change )
	elseif Music.current_mode == 1 then
		self:List( song, "control", song_change )
	elseif Music.current_mode == 2 then
		self:List( song, "anticipation", song_change )
	elseif Music.current_mode == 3 then
		self:List( song, "assault", song_change )
	end
end
-------- ### MODE - GET MODE ###
function Music:get_mode()
local mode
	if Music.current_mode == 0 then
		mode = "setup"
	elseif Music.current_mode == 1 then
		mode = "control"
	elseif Music.current_mode == 2 then
		mode = "anticipation"
	elseif Music.current_mode == 3 then
		mode = "assault"
	end
	return mode
end
-------- ## LIST ##
function Music:List( song, mode, song_change )
	Music.autowave = false Music.autos = 0
	self:Package() self:Stage()
	if Music.current_list == 0 then
		self:Call( 1, song, Music:get_mode(), song_change )
	elseif Music.current_list == 1 then
		self:Call( 2, song, Music:get_mode(), song_change )
	elseif Music.current_list == 2 then
		self:Call( 2, song, Music:get_mode(), song_change )
	elseif Music.current_list == 3 then
		self:Call( 2, song, Music:get_mode(), song_change )
	elseif Music.current_list == 4 then
		self:Call( 2, song, Music:get_mode(), song_change )
	elseif Music.current_list == 5 then
		self:Call( 2, song, Music:get_mode(), song_change )
	elseif Music.current_list == 6 then
		self:Call( 2, song, Music:get_mode(), song_change )
	elseif Music.current_list == 7 then
		self:Call( 1, song, Music:get_mode(), song_change )
	elseif Music.current_list == 8 then
		self:Call( 1, song, Music:get_mode(), song_change )
	elseif Music.current_list == 9 then
		self:Call( 1, song, Music:get_mode(), song_change )
	elseif Music.current_list == 10 then
		self:Call( 1, song, Music:get_mode(), song_change )
	elseif Music.current_list == 11 then
		self:Call( 1, song, Music:get_mode(), song_change )
	end
end
-------- ### LIST - GET STATE ###
function Music:get_list_state()
local state = false
	if Music.current_list == 0 then
		if #Music.jukebox_music_tracks > 0 then
			state = true
		end
	elseif Music.current_list == 1 then
		if #Music.jukebox_menu_tracks > 0 then
			state = true
		end
	elseif Music.current_list == 2 then
		if #Music.list_rootmenu > 0 then
			state = true
		end
	elseif Music.current_list == 3 then
		if #Music.list_betamenu > 0 then
			state = true
		end
	elseif Music.current_list == 4 then
		if #Music.list_gammmenu > 0 then
			state = true
		end
	elseif Music.current_list == 5 then
		if #Music.list_deltmenu > 0 then
			state = true
		end
	elseif Music.current_list == 6 then
		if #Music.list_epsimenu > 0 then
			state = true
		end
	elseif Music.current_list == 7 then
		if #Music.list_roottrak > 0 then
			state = true
		end
	elseif Music.current_list == 8 then
		if #Music.list_betatrak > 0 then
			state = true
		end
	elseif Music.current_list == 9 then
		if #Music.list_gammtrak > 0 then
			state = true
		end
	elseif Music.current_list == 10 then
		if #Music.list_delttrak > 0 then
			state = true
		end
	elseif Music.current_list == 11 then
		if #Music.list_epsitrak > 0 then
			state = true
		end
	end
	return state
end
-------- ### LIST - GET LIST ###
function Music:get_list()
local list = 0
	if Music.current_list == 0 then
		list = 0
	elseif Music.current_list == 1 then
		list = 1
	elseif Music.current_list == 2 then
		list = 2
	elseif Music.current_list == 3 then
		list = 3
	elseif Music.current_list == 4 then
		list = 4
	elseif Music.current_list == 5 then
		list = 5
	elseif Music.current_list == 6 then
		list = 6
	elseif Music.current_list == 7 then
		list = 7
	elseif Music.current_list == 8 then
		list = 8
	elseif Music.current_list == 9 then
		list = 9
	elseif Music.current_list == 10 then
		list = 10
	elseif Music.current_list == 11 then
		list = 11
	end
	return list
end
-------- ### LIST - GET NAME ###
function Music:get_list_name()
local name = ""
	if Music.current_list == 0 then
		name = (managers.localization:text("music_custom_heist_name"))
	elseif Music.current_list == 1 then
		name = (managers.localization:text("music_custom_menu_name"))
	elseif Music.current_list == 2 then
		name = (managers.localization:text("music_rootmenu_name"))
	elseif Music.current_list == 3 then
		name = (managers.localization:text("music_betamenu_name"))
	elseif Music.current_list == 4 then
		name = (managers.localization:text("music_gammmenu_name"))
	elseif Music.current_list == 5 then
		name = (managers.localization:text("music_deltmenu_name"))
	elseif Music.current_list == 6 then
		name = (managers.localization:text("music_epsimenu_name"))
	elseif Music.current_list == 7 then
		name = (managers.localization:text("music_roottrak_name"))
	elseif Music.current_list == 8 then
		name = (managers.localization:text("music_betatrak_name"))
	elseif Music.current_list == 9 then
		name = (managers.localization:text("music_gammtrak_name"))
	elseif Music.current_list == 10 then
		name = (managers.localization:text("music_delttrak_name"))
	elseif Music.current_list == 11 then
		name = (managers.localization:text("music_epsitrak_name"))
	end
	return name
end
-------- ## MUSIC CALL ##
function Music:Call(type, song, mode, song_change)
	local msg_mode = string.upper(string.sub(managers.localization:text("music_mode"), 1, 1)) .. string.lower(string.sub(managers.localization:text("music_mode"), 2, -1)) .. " : "
	local msg_song = string.upper(string.sub(managers.localization:text("music_song"), 1, 1)) .. string.lower(string.sub(managers.localization:text("music_song"), 2, -1)) .. " : "
	local msg_mode_title = string.upper(string.sub(mode, 1, 1)) .. string.lower(string.sub(mode, 2, -1))
	local msg_list_title = string.upper(string.sub(Music:get_list_name(), 1, 1)) .. string.lower(string.sub(Music:get_list_name(), 2, -1))
	local msg_menu_title
	local song = song
	if type == 1 then
		managers.music:stop()
		if song == nil then
			msg_menu_title = ""
		else
			Global.music_manager.source:set_switch("music_randomizer", song)
			managers.music:post_event("music_heist_" .. mode)
			msg_menu_title = managers.localization:text("menu_jukebox_" .. song)
		end
	elseif type == 2 then
		-- NOTE: MUSIC-LOCKED HEIST
		if Music:isRestrictMap() == true then
			if Utils:IsInHeist() then
				self:SoundPost("stop_all_music")
				self:SoundPlay("stop_all_music", false, false)
				self:SoundPlay(song, false, false)
			end
		else
			if Utils:IsInHeist() then
				if song == "diegetic_club_music" or song == "diegetic_club_rock_music" then
					self:SoundPost("stop_all_music")
					self:SoundPlay("stop_all_music", false, false)
					self:SoundPlay(song, false, false)
				else
					managers.music:stop()
					self:SoundPost("stop_all_music")
					self:SoundPlay("stop_all_music", false, false)
					self:SoundPost(song)
				end
			else
				managers.music:stop()
				self:SoundPost("stop_all_music")
				self:SoundPost(song)
			end
		end
		if song == "diegetic_club_music" or song == "diegetic_club_rock_music"
		or song == "cash_safe_open_01" or song == "cash_safe_open_02"
		or song == "cash_safe_open_03" or song == "cash_safe_open_04"
		or song == "cash_safe_open_05" then
			msg_menu_title = managers.localization:text(song)
		elseif song == nil then
			msg_menu_title = ""
		else
			msg_menu_title = managers.localization:text("menu_jukebox_screen_" .. song)
		end
		
	end
	if Utils:IsInHeist() then
		self:Label( 0, "[list_manual_auto]", tostring(Music:get_list())..", "..tostring(Music.pressed)..", "..tostring(Music.autowave))
		if song_change == "mode" then
			self:Label( 1, msg_mode, msg_mode_title )
		elseif song_change == "list" then
			self:Label( 1, msg_mode, msg_list_title )
		else
			self:Label( 1, msg_song, msg_menu_title )
		end
	else
		self:Label( 0, "[last_update]", Music.build_update )
		self:Label( 0, "[version]", Music.build_version )
		self:Label( 0, "[author]", Music.build_author )
		self:Label( 0, "[list]", tostring(Music:get_list()) )
		if song_change == "mode" then
			self:Label( 1, msg_mode, msg_mode_title )
		elseif song_change == "list" then
			self:Label( 1, msg_mode, msg_list_title )
		else
			self:Label( 1, msg_song, msg_menu_title )
		end
	end
	Music.songs = msg_menu_title
end
-------- #### TRACK TITLE - N ####
function Music:MusicLocked()
	local g
	g = managers.localization:text("menu_jukebox_track_" .. Global.level_data.level_id) .. "\n" .. managers.localization:text("music_menu_entry") .. " : " .. managers.localization:text("music_lockedheist")
	return g
end
-------- #### TRACK TITLE - 0 ####
function Music:List_A()
	local song = Music.jukebox_music_tracks[Music.juke_track]
	local p, n, t
	if song == nil then
		p = ""
	else
		p = managers.localization:text("menu_jukebox_" .. song)
	end
	n = (managers.localization:text("music_custom_heist_name"))
	t = p .. " \n".. managers.localization:text("music_playlist_name") .. ": " .. n
	return t
end
-------- #### TRACK TITLE - 1 ####
function Music:List_B()
	local song = Music.jukebox_menu_tracks[Music.juke_menu]
	local p, n, t
	if song == "diegetic_club_music" or song == "diegetic_club_rock_music"
	or song == "cash_safe_open_01" or song == "cash_safe_open_02"
	or song == "cash_safe_open_03" or song == "cash_safe_open_04"
	or song == "cash_safe_open_05" then
		p = managers.localization:text(song)
	elseif song == nil then
		p = ""
	else
		p = managers.localization:text("menu_jukebox_screen_" .. song)
	end
	n = (managers.localization:text("music_custom_menu_name"))
	t = p .. " \n".. managers.localization:text("music_playlist_name") .. ": " .. n
	return t
end
-------- #### TRACK TITLE - 2 ####
function Music:List_C()
	local song = Music.list_rootmenu[Music.juke_rootmenu]
	local p, n, t
	if song == "diegetic_club_music" or song == "diegetic_club_rock_music"
	or song == "cash_safe_open_01" or song == "cash_safe_open_02"
	or song == "cash_safe_open_03" or song == "cash_safe_open_04"
	or song == "cash_safe_open_05" then
		p = managers.localization:text(song)
	elseif song == nil then
		p = ""
	else
		p = managers.localization:text("menu_jukebox_screen_" .. song)
	end
	n = (managers.localization:text("music_rootmenu_name"))
	t = p .. " \n".. managers.localization:text("music_playlist_name") .. ": " .. n
	return t
end
-------- #### TRACK TITLE - 3 ####
function Music:List_D()
	local song = Music.list_betamenu[Music.juke_betamenu]
	local p, n, t
	if song == "diegetic_club_music" or song == "diegetic_club_rock_music"
	or song == "cash_safe_open_01" or song == "cash_safe_open_02"
	or song == "cash_safe_open_03" or song == "cash_safe_open_04"
	or song == "cash_safe_open_05" then
		p = managers.localization:text(song)
	elseif song == nil then
		p = ""
	else
		p = managers.localization:text("menu_jukebox_screen_" .. song)
	end
	n = (managers.localization:text("music_betamenu_name"))
	t = p .. " \n".. managers.localization:text("music_playlist_name") .. ": " .. n
	return t
end
-------- #### TRACK TITLE - 4 ####
function Music:List_E()
	local song = Music.list_gammmenu[Music.juke_gammmenu]
	local p, n, t
	if song == "diegetic_club_music" or song == "diegetic_club_rock_music"
	or song == "cash_safe_open_01" or song == "cash_safe_open_02"
	or song == "cash_safe_open_03" or song == "cash_safe_open_04"
	or song == "cash_safe_open_05" then
		p = managers.localization:text(song)
	elseif song == nil then
		p = ""
	else
		p = managers.localization:text("menu_jukebox_screen_" .. song)
	end
	n = (managers.localization:text("music_gammmenu_name"))
	t = p .. " \n".. managers.localization:text("music_playlist_name") .. ": " .. n
	return t
end
-------- #### TRACK TITLE - 5 ####
function Music:List_F()
	local song = Music.list_deltmenu[Music.juke_deltmenu]
	local p, n, t
	if song == "diegetic_club_music" or song == "diegetic_club_rock_music"
	or song == "cash_safe_open_01" or song == "cash_safe_open_02"
	or song == "cash_safe_open_03" or song == "cash_safe_open_04"
	or song == "cash_safe_open_05" then
		p = managers.localization:text(song)
	elseif song == nil then
		p = ""
	else
		p = managers.localization:text("menu_jukebox_screen_" .. song)
	end
	n = (managers.localization:text("music_deltmenu_name"))
	t = p .. " \n".. managers.localization:text("music_playlist_name") .. ": " .. n
	return t
end
-------- #### TRACK TITLE - 6 ####
function Music:List_G()
	local song = Music.list_epsimenu[Music.juke_epsimenu]
	local p, n, t
	if song == "diegetic_club_music" or song == "diegetic_club_rock_music"
	or song == "cash_safe_open_01" or song == "cash_safe_open_02"
	or song == "cash_safe_open_03" or song == "cash_safe_open_04"
	or song == "cash_safe_open_05" then
		p = managers.localization:text(song)
	elseif song == nil then
		p = ""
	else
		p = managers.localization:text("menu_jukebox_screen_" .. song)
	end
	n = (managers.localization:text("music_epsimenu_name"))
	t = p .. " \n".. managers.localization:text("music_playlist_name") .. ": " .. n
	return t
end
-------- #### TRACK TITLE - 7 ####
function Music:List_H()
	local song = Music.list_roottrak[Music.juke_roottrak]
	local p, n, t
	if song == nil then
		p = ""
	else
		p = managers.localization:text("menu_jukebox_" .. song)
	end
	n = (managers.localization:text("music_roottrak_name"))
	t = p .. " \n".. managers.localization:text("music_playlist_name") .. ": " .. n
	return t
end
-------- #### TRACK TITLE - 8 ####
function Music:List_I()
	local song = Music.list_betatrak[Music.juke_betatrak]
	local p, n, t
	if song == nil then
		p = ""
	else
		p = managers.localization:text("menu_jukebox_" .. song)
	end
	n = (managers.localization:text("music_betatrak_name"))
	t = p .. " \n".. managers.localization:text("music_playlist_name") .. ": " .. n
	return t
end
-------- #### TRACK TITLE - 9 ####
function Music:List_J()
	local song = Music.list_gammtrak[Music.juke_gammtrak]
	local p, n, t
	if song == nil then
		p = ""
	else
		p = managers.localization:text("menu_jukebox_" .. song)
	end
	n = (managers.localization:text("music_gammtrak_name"))
	t = p .. " \n".. managers.localization:text("music_playlist_name") .. ": " .. n
	return t
end
-------- #### TRACK TITLE - 10 ####
function Music:List_K()
	local song = Music.list_delttrak[Music.juke_delttrak]
	local p, n, t
	if song == nil then
		p = ""
	else
		p = managers.localization:text("menu_jukebox_" .. song)
	end
	n = (managers.localization:text("music_delttrak_name"))
	t = p .. " \n".. managers.localization:text("music_playlist_name") .. ": " .. n
	return t
end
-------- #### TRACK TITLE - 11 ####
function Music:List_L()
	local song = Music.list_epsitrak[Music.juke_epsitrak]
	local p, n, t
	if song == nil then
		p = ""
	else
		p = managers.localization:text("menu_jukebox_" .. song)
	end
	n = (managers.localization:text("music_epsitrak_name"))
	t = p .. " \n".. managers.localization:text("music_playlist_name") .. ": " .. n
	return t
end
-------- ## TRACK FILTER ##
-- NOTE: RETRIEVES MUSIC FROM JUKEBOX AS MASTER LIST INSTEAD OF TWEAK_DATA.MUSIC.TRACK_LIST
function Music:FilterTrack()
	local tracks_list, tracks_locked = managers.music:jukebox_music_tracks()
	for _, track_name in pairs(tracks_list) do
		if not tracks_locked[track_name] then
			table.insert(Music.list_custom_track, track_name)
		end
	end
	-- NOTE: DEFAULT CUSTOM TRACK PLAYLIST (GLOBAL.MUSIC_MANAGER.CUSTOM_PLAYLIST) COPIED TO MUSIC.JUKEBOX_MUSIC_TRACKS
	for _, track_name in pairs( Global.music_manager.custom_playlist ) do
		local tracks_list, tracks_locked = managers.music:jukebox_music_tracks()
		if not tracks_locked[track_name] then
			table.insert(Music.jukebox_music_tracks, track_name)
		end
	end
end
-------- ## MENU FILTER ##
-- NOTE: RETRIEVES MUSIC FROM JUKEBOX AS MASTER LIST INSTEAD OF TWEAK_DATA.MUSIC.TRACK_LIST
function Music:FilterMenu()
	local tracks_list, tracks_locked = managers.music:jukebox_menu_tracks()
	for _, track_name in pairs(tracks_list) do
		if not tracks_locked[track_name] then
			table.insert(Music.list_custom_menu, track_name)
		end
	end
	table.insert(Music.list_custom_menu, "cash_safe_open_01")
	table.insert(Music.list_custom_menu, "cash_safe_open_02")
	table.insert(Music.list_custom_menu, "cash_safe_open_03")
	table.insert(Music.list_custom_menu, "cash_safe_open_04")
	table.insert(Music.list_custom_menu, "cash_safe_open_05")
	table.insert(Music.list_custom_menu, "diegetic_club_music")
	table.insert(Music.list_custom_menu, "diegetic_club_rock_music")
	-- NOTE: DEFAULT CUSTOM TRACK PLAYLIST (GLOBAL.MUSIC_MANAGER.CUSTOM_MENU_PLAYLIST) COPIED TO MUSIC.JUKEBOX_MENU_TRACKS
	for _, track_name in pairs( Global.music_manager.custom_menu_playlist ) do
		local tracks_list, tracks_locked = managers.music:jukebox_menu_tracks()
		if not tracks_locked[track_name] then
			table.insert(Music.jukebox_menu_tracks, track_name)
		end
	end
end
-------- ## PLAYLIST MANAGER ##
-- NOTE: RESPONSIBLE FOR FINALIZING PLAYLIST AFTER SELECTION AND REMOVES DUPLICATES
function Music:PlaylistManager(datafile, dataset, datalist)
	local file = io.open( datafile, "r" )
	if self:DataBase(datafile) then
		dataset = json.decode( file:read("*all") )
		for k, v in pairs(dataset) do
			local track_name = k
			if dataset[track_name] then
				table.insert(datalist, track_name)
			else
				table.remove(datalist, track_name)
			end
		end
		file:close()
	end
end
-------- ## PLAYLIST SETUP ##
-- NOTE: LIST PROVIDED TO PLAYLIST MANAGER
function Music:PlaylistSetup()
if not Music.sortlist then
self:PlaylistManager(Music._rootmenu, Music.settings_rootmenu, Music.list_rootmenu)
self:PlaylistManager(Music._betamenu, Music.settings_betamenu, Music.list_betamenu)
self:PlaylistManager(Music._gammmenu, Music.settings_gammmenu, Music.list_gammmenu)
self:PlaylistManager(Music._deltmenu, Music.settings_deltmenu, Music.list_deltmenu)
self:PlaylistManager(Music._epsimenu, Music.settings_epsimenu, Music.list_epsimenu)
self:PlaylistManager(Music._roottrak, Music.settings_roottrak, Music.list_roottrak)
self:PlaylistManager(Music._betatrak, Music.settings_betatrak, Music.list_betatrak)
self:PlaylistManager(Music._gammtrak, Music.settings_gammtrak, Music.list_gammtrak)
self:PlaylistManager(Music._delttrak, Music.settings_delttrak, Music.list_delttrak)
self:PlaylistManager(Music._epsitrak, Music.settings_epsitrak, Music.list_epsitrak)
end end
-------- ## PLAYLIST MENU CREATION ##
local music_rootmenu_menu = "music_playlist_rootmenu"
local music_betamenu_menu = "music_playlist_betamenu"
local music_gammmenu_menu = "music_playlist_gammmenu"
local music_deltmenu_menu = "music_playlist_deltmenu"
local music_epsimenu_menu = "music_playlist_epsimenu"
local music_roottrak_menu = "music_playlist_roottrak"
local music_betatrak_menu = "music_playlist_betatrak"
local music_gammtrak_menu = "music_playlist_gammtrak"
local music_delttrak_menu = "music_playlist_delttrak"
local music_epsitrak_menu = "music_playlist_epsitrak"
Hooks:Add("MenuManagerSetupCustomMenus", "SetupCustomMenus_Music_Playlist", function(menu_manager, nodes)
	MenuHelper:NewMenu(music_rootmenu_menu)
	MenuHelper:NewMenu(music_betamenu_menu)
	MenuHelper:NewMenu(music_gammmenu_menu)
	MenuHelper:NewMenu(music_deltmenu_menu)
	MenuHelper:NewMenu(music_epsimenu_menu)
	MenuHelper:NewMenu(music_roottrak_menu)
	MenuHelper:NewMenu(music_betatrak_menu)
	MenuHelper:NewMenu(music_gammtrak_menu)
	MenuHelper:NewMenu(music_delttrak_menu)
	MenuHelper:NewMenu(music_epsitrak_menu)
end)
Hooks:Add("MenuManagerPopulateCustomMenus", "PopulateCustomMenus_Music_Playlist", function(menu_manager, nodes)
	MenuCallbackHandler.music_rootmenu_toggle = function(self, item)
		Music.settings_rootmenu[item:name()] = (item:value() == "on") or nil
		Music:Save(Music.settings_rootmenu, Music._rootmenu)
	end
	MenuCallbackHandler.music_betamenu_toggle = function(self, item)
		Music.settings_betamenu[item:name()] = (item:value() == "on") or nil
		Music:Save(Music.settings_betamenu, Music._betamenu)
	end
	MenuCallbackHandler.music_gammmenu_toggle = function(self, item)
		Music.settings_gammmenu[item:name()] = (item:value() == "on") or nil
		Music:Save(Music.settings_gammmenu, Music._gammmenu)
	end
	MenuCallbackHandler.music_deltmenu_toggle = function(self, item)
		Music.settings_deltmenu[item:name()] = (item:value() == "on") or nil
		Music:Save(Music.settings_deltmenu, Music._deltmenu)
	end
	MenuCallbackHandler.music_epsimenu_toggle = function(self, item)
		Music.settings_epsimenu[item:name()] = (item:value() == "on") or nil
		Music:Save(Music.settings_epsimenu, Music._epsimenu)
	end
	MenuCallbackHandler.music_roottrak_toggle = function(self, item)
		Music.settings_roottrak[item:name()] = (item:value() == "on") or nil
		Music:Save(Music.settings_roottrak, Music._roottrak)
	end
	MenuCallbackHandler.music_betatrak_toggle = function(self, item)
		Music.settings_betatrak[item:name()] = (item:value() == "on") or nil
		Music:Save(Music.settings_betatrak, Music._betatrak)
	end
	MenuCallbackHandler.music_gammtrak_toggle = function(self, item)
		Music.settings_gammtrak[item:name()] = (item:value() == "on") or nil
		Music:Save(Music.settings_gammtrak, Music._gammtrak)
	end
	MenuCallbackHandler.music_delttrak_toggle = function(self, item)
		Music.settings_delttrak[item:name()] = (item:value() == "on") or nil
		Music:Save(Music.settings_delttrak, Music._delttrak)
	end
	MenuCallbackHandler.music_epsitrak_toggle = function(self, item)
		Music.settings_epsitrak[item:name()] = (item:value() == "on") or nil
		Music:Save(Music.settings_epsitrak, Music._epsitrak)
	end
	Music:Load(Music.settings_rootmenu, Music._rootmenu)
	Music:Load(Music.settings_betamenu, Music._betamenu)
	Music:Load(Music.settings_gammmenu, Music._gammmenu)
	Music:Load(Music.settings_deltmenu, Music._deltmenu)
	Music:Load(Music.settings_epsimenu, Music._epsimenu)
	Music:Load(Music.settings_roottrak, Music._roottrak)
	Music:Load(Music.settings_betatrak, Music._betatrak)
	Music:Load(Music.settings_gammtrak, Music._gammtrak)
	Music:Load(Music.settings_delttrak, Music._delttrak)
	Music:Load(Music.settings_epsitrak, Music._epsitrak)
	Music:FilterMenu() Music:FilterTrack()
	for k, v in pairs(Music.list_custom_menu) do
		local menu_name_prefix = "" local menu_name = v
		if menu_name == "diegetic_club_music" or menu_name == "diegetic_club_rock_music"
		or menu_name == "cash_safe_open_01" or menu_name == "cash_safe_open_02"
		or menu_name == "cash_safe_open_03" or menu_name == "cash_safe_open_04"
		or menu_name == "cash_safe_open_05" or menu_name == nil then
			menu_name_prefix = ""
		else
			menu_name_prefix = "menu_jukebox_screen_"
		end
		MenuHelper:AddToggle({
			id = menu_name,
			title = menu_name_prefix .. menu_name,
			desc = "music_playlist_desc",
			callback = "music_rootmenu_toggle",
			menu_id = music_rootmenu_menu,
			value = Music.settings_rootmenu[menu_name] or false
		})
		MenuHelper:AddToggle({
			id = menu_name,
			title = menu_name_prefix .. menu_name,
			desc = "music_playlist_desc",
			callback = "music_betamenu_toggle",
			menu_id = music_betamenu_menu,
			value = Music.settings_betamenu[menu_name] or false
		})
		MenuHelper:AddToggle({
			id = menu_name,
			title = menu_name_prefix .. menu_name,
			desc = "music_playlist_desc",
			callback = "music_gammmenu_toggle",
			menu_id = music_gammmenu_menu,
			value = Music.settings_gammmenu[menu_name] or false
		})
		MenuHelper:AddToggle({
			id = menu_name,
			title = menu_name_prefix .. menu_name,
			desc = "music_playlist_desc",
			callback = "music_deltmenu_toggle",
			menu_id = music_deltmenu_menu,
			value = Music.settings_deltmenu[menu_name] or false
		})
		MenuHelper:AddToggle({
			id = menu_name,
			title = menu_name_prefix .. menu_name,
			desc = "music_playlist_desc",
			callback = "music_epsimenu_toggle",
			menu_id = music_epsimenu_menu,
			value = Music.settings_epsimenu[menu_name] or false
		})
	end
	for k, v in pairs(Music.list_custom_track) do
		local track_name_prefix = "" local track_name = v
		if track_name == nil then
			track_name_prefix = ""
		else
			track_name_prefix = "menu_jukebox_"
		end
		MenuHelper:AddToggle({
			id = track_name,
			title = track_name_prefix .. track_name,
			desc = "music_playlist_desc",
			callback = "music_roottrak_toggle",
			menu_id = music_roottrak_menu,
			value = Music.settings_roottrak[track_name] or false
		})
		MenuHelper:AddToggle({
			id = track_name,
			title = track_name_prefix .. track_name,
			desc = "music_playlist_desc",
			callback = "music_betatrak_toggle",
			menu_id = music_betatrak_menu,
			value = Music.settings_betatrak[track_name] or false
		})
		MenuHelper:AddToggle({
			id = track_name,
			title = track_name_prefix .. track_name,
			desc = "music_playlist_desc",
			callback = "music_gammtrak_toggle",
			menu_id = music_gammtrak_menu,
			value = Music.settings_gammtrak[track_name] or false
		})
		MenuHelper:AddToggle({
			id = track_name,
			title = track_name_prefix .. track_name,
			desc = "music_playlist_desc",
			callback = "music_delttrak_toggle",
			menu_id = music_delttrak_menu,
			value = Music.settings_delttrak[track_name] or false
		})
		MenuHelper:AddToggle({
			id = track_name,
			title = track_name_prefix .. track_name,
			desc = "music_playlist_desc",
			callback = "music_epsitrak_toggle",
			menu_id = music_epsitrak_menu,
			value = Music.settings_epsitrak[track_name] or false
		})
	end
end)
-------- ## BUILD PLAYLISTS MENU ##
Hooks:Add("MenuManagerBuildCustomMenus", "BuildCustomMenus_Music_Playlist", function(menu_manager, nodes)
	nodes[music_rootmenu_menu] = MenuHelper:BuildMenu(music_rootmenu_menu)
	MenuHelper:AddMenuItem(nodes.sound, music_rootmenu_menu, "music_rootmenu_name", "music_playlist_menu_desc")
	nodes[music_betamenu_menu] = MenuHelper:BuildMenu(music_betamenu_menu)
	MenuHelper:AddMenuItem(nodes.sound, music_betamenu_menu, "music_betamenu_name", "music_playlist_menu_desc")
	nodes[music_gammmenu_menu] = MenuHelper:BuildMenu(music_gammmenu_menu)
	MenuHelper:AddMenuItem(nodes.sound, music_gammmenu_menu, "music_gammmenu_name", "music_playlist_menu_desc")
	nodes[music_deltmenu_menu] = MenuHelper:BuildMenu(music_deltmenu_menu)
	MenuHelper:AddMenuItem(nodes.sound, music_deltmenu_menu, "music_deltmenu_name", "music_playlist_menu_desc")
	nodes[music_epsimenu_menu] = MenuHelper:BuildMenu(music_epsimenu_menu)
	MenuHelper:AddMenuItem(nodes.sound, music_epsimenu_menu, "music_epsimenu_name", "music_playlist_menu_desc")
	nodes[music_roottrak_menu] = MenuHelper:BuildMenu(music_roottrak_menu)
	MenuHelper:AddMenuItem(nodes.sound, music_roottrak_menu, "music_roottrak_name", "music_playlist_track_desc")
	nodes[music_betatrak_menu] = MenuHelper:BuildMenu(music_betatrak_menu)
	MenuHelper:AddMenuItem(nodes.sound, music_betatrak_menu, "music_betatrak_name", "music_playlist_track_desc")
	nodes[music_gammtrak_menu] = MenuHelper:BuildMenu(music_gammtrak_menu)
	MenuHelper:AddMenuItem(nodes.sound, music_gammtrak_menu, "music_gammtrak_name", "music_playlist_track_desc")
	nodes[music_delttrak_menu] = MenuHelper:BuildMenu(music_delttrak_menu)
	MenuHelper:AddMenuItem(nodes.sound, music_delttrak_menu, "music_delttrak_name", "music_playlist_track_desc")
	nodes[music_epsitrak_menu] = MenuHelper:BuildMenu(music_epsitrak_menu)
	MenuHelper:AddMenuItem(nodes.sound, music_epsitrak_menu, "music_epsitrak_name", "music_playlist_track_desc")
end)
-------- ## LOCALIZATION ##
Hooks:Add("LocalizationManagerPostInit", "LocalizationManager_MusicLanguageInit", function(loc)
	loc:load_localization_file(Music._base)
end)
Hooks:Add("LocalizationManagerPostInit", "LocalizationManager_MusicLanguageName", function(loc)
	Music:Load(Music.settings, Music._save)
	Music._song = Music._name .. "songs.txt"
	loc:load_localization_file(Music._song)
end)
Hooks:Add("LocalizationManagerPostInit", "LocalizationManager_MusicLanguageLoad", function(loc)
	Music:Load(Music.settings, Music._save)
	local path
	if Music.settings.mcontrol_language == 2 then
		path = "french.txt"
	elseif Music.settings.mcontrol_language == 3 then
		path = "german.txt"
	elseif Music.settings.mcontrol_language == 4 then
		path = "korean.txt"
	elseif Music.settings.mcontrol_language == 5 then
		path = "russian.txt"
	elseif Music.settings.mcontrol_language == 6 then
		path = "turkish.txt"
	else
		path = "english.txt"
	end
	loc:load_localization_file(Music._loca .. path)
end)
-------- ## INITIALIZATION ##
Hooks:Add("MenuManagerInitialize", "MenuManagerInitialize_MusicManagerInit", function(menu_manager)
	---- ### MUSIC NEXT BUTTON ###
	Music.music_call_next_func = function(self)
		if Music:Chat() == false and Music:isRestrictMap() == false then
			if Music:get_list() == 0 then
				Music.juke_track = Music.juke_track + 1
				if Music.juke_track > #Music.jukebox_music_tracks then
					Music.juke_track = 1
				end
				Music:Play( Music.jukebox_music_tracks[Music.juke_track] )
			elseif Music:get_list() == 1 then
				Music.juke_menu = Music.juke_menu + 1
				if Music.juke_menu > #Music.jukebox_menu_tracks then
					Music.juke_menu = 1
				end
				Music:Play( Music.jukebox_menu_tracks[Music.juke_menu] )
			elseif Music:get_list() == 2 then
				Music.juke_rootmenu = Music.juke_rootmenu + 1
				if Music.juke_rootmenu > #Music.list_rootmenu then
					Music.juke_rootmenu = 1
				end
				Music:Play( Music.list_rootmenu[Music.juke_rootmenu] )
			elseif Music:get_list() == 3 then
				Music.juke_betamenu = Music.juke_betamenu + 1
				if Music.juke_betamenu > #Music.list_betamenu then
					Music.juke_betamenu = 1
				end
				Music:Play( Music.list_betamenu[Music.juke_betamenu] )
			elseif Music:get_list() == 4 then
				Music.juke_gammmenu = Music.juke_gammmenu + 1
				if Music.juke_gammmenu > #Music.list_gammmenu then
					Music.juke_gammmenu = 1
				end
				Music:Play( Music.list_gammmenu[Music.juke_gammmenu] )
			elseif Music:get_list() == 5 then
				Music.juke_deltmenu = Music.juke_deltmenu + 1
				if Music.juke_deltmenu > #Music.list_deltmenu then
					Music.juke_deltmenu = 1
				end
				Music:Play( Music.list_deltmenu[Music.juke_deltmenu] )
			elseif Music:get_list() == 6 then
				Music.juke_epsimenu = Music.juke_epsimenu + 1
				if Music.juke_epsimenu > #Music.list_epsimenu then
					Music.juke_epsimenu = 1
				end
				Music:Play( Music.list_epsimenu[Music.juke_epsimenu] )
			elseif Music:get_list() == 7 then
				Music.juke_roottrak = Music.juke_roottrak + 1
				if Music.juke_roottrak > #Music.list_roottrak then
					Music.juke_roottrak = 1
				end
				Music:Play( Music.list_roottrak[Music.juke_roottrak] )
			elseif Music:get_list() == 8 then
				Music.juke_betatrak = Music.juke_betatrak + 1
				if Music.juke_betatrak > #Music.list_betatrak then
					Music.juke_betatrak = 1
				end
				Music:Play( Music.list_betatrak[Music.juke_betatrak] )
			elseif Music:get_list() == 9 then
				Music.juke_gammtrak = Music.juke_gammtrak + 1
				if Music.juke_gammtrak > #Music.list_gammtrak then
					Music.juke_gammtrak = 1
				end
				Music:Play( Music.list_gammtrak[Music.juke_gammtrak] )
			elseif Music:get_list() == 10 then
				Music.juke_delttrak = Music.juke_delttrak + 1
				if Music.juke_delttrak > #Music.list_delttrak then
					Music.juke_delttrak = 1
				end
				Music:Play( Music.list_delttrak[Music.juke_delttrak] )
			elseif Music:get_list() == 11 then
				Music.juke_epsitrak = Music.juke_epsitrak + 1
				if Music.juke_epsitrak > #Music.list_epsitrak then
					Music.juke_epsitrak = 1
				end
				Music:Play( Music.list_epsitrak[Music.juke_epsitrak] )
			end
		elseif Music:Chat() == false and Music:isRestrictMap() == true then
			if Utils:IsInHeist() and Music.pause == false then
				if Music:get_list() == 1 then
					Music.juke_menu = Music.juke_menu + 1
					if Music.juke_menu > #Music.jukebox_menu_tracks then
						Music.juke_menu = 1
					end
					Music:Play( Music.jukebox_menu_tracks[Music.juke_menu] )
				elseif Music:get_list() == 2 then
					Music.juke_rootmenu = Music.juke_rootmenu + 1
					if Music.juke_rootmenu > #Music.list_rootmenu then
						Music.juke_rootmenu = 1
					end
					Music:Play( Music.list_rootmenu[Music.juke_rootmenu] )
				elseif Music:get_list() == 3 then
					Music.juke_betamenu = Music.juke_betamenu + 1
					if Music.juke_betamenu > #Music.list_betamenu then
						Music.juke_betamenu = 1
					end
					Music:Play( Music.list_betamenu[Music.juke_betamenu] )
				elseif Music:get_list() == 4 then
					Music.juke_gammmenu = Music.juke_gammmenu + 1
					if Music.juke_gammmenu > #Music.list_gammmenu then
						Music.juke_gammmenu = 1
					end
					Music:Play( Music.list_gammmenu[Music.juke_gammmenu] )
				elseif Music:get_list() == 5 then
					Music.juke_deltmenu = Music.juke_deltmenu + 1
					if Music.juke_deltmenu > #Music.list_deltmenu then
						Music.juke_deltmenu = 1
					end
					Music:Play( Music.list_deltmenu[Music.juke_deltmenu] )
				elseif Music:get_list() == 6 then
					Music.juke_epsimenu = Music.juke_epsimenu + 1
					if Music.juke_epsimenu > #Music.list_epsimenu then
						Music.juke_epsimenu = 1
					end
					Music:Play( Music.list_epsimenu[Music.juke_epsimenu] )
				else
					local sub = utf8.to_upper(managers.localization:text("music_menu_entry"))
					local msg = utf8.to_upper(managers.localization:text("music_list_name"))
					Music:Label( 3, sub, msg )
				end
			end
		end
	end
	---- ### MUSIC PREVIOUS BUTTON ###
	Music.music_call_prev_func = function(self)
		if Music:Chat() == false and Music:isRestrictMap() == false then
			if Music:get_list() == 0 then
				Music.juke_track = Music.juke_track - 1
				if Music.juke_track == 0 then
					Music.juke_track = #Music.jukebox_music_tracks
				end
				Music:Play( Music.jukebox_music_tracks[Music.juke_track] )
			elseif Music:get_list() == 1 then
				Music.juke_menu = Music.juke_menu - 1
				if Music.juke_menu == 0 then
					Music.juke_menu = #Music.jukebox_menu_tracks
				end
				Music:Play( Music.jukebox_menu_tracks[Music.juke_menu] )
			elseif Music:get_list() == 2 then
				Music.juke_rootmenu = Music.juke_rootmenu - 1
				if Music.juke_rootmenu == 0 then
					Music.juke_rootmenu = #Music.list_rootmenu
				end
				Music:Play( Music.list_rootmenu[Music.juke_rootmenu] )
			elseif Music:get_list() == 3 then
				Music.juke_betamenu = Music.juke_betamenu - 1
				if Music.juke_betamenu == 0 then
					Music.juke_betamenu = #Music.list_betamenu
				end
				Music:Play( Music.list_betamenu[Music.juke_betamenu] )
			elseif Music:get_list() == 4 then
				Music.juke_gammmenu = Music.juke_gammmenu - 1
				if Music.juke_gammmenu == 0 then
					Music.juke_gammmenu = #Music.list_gammmenu
				end
				Music:Play( Music.list_gammmenu[Music.juke_gammmenu] )
			elseif Music:get_list() == 5 then
				Music.juke_deltmenu = Music.juke_deltmenu - 1
				if Music.juke_deltmenu == 0 then
					Music.juke_deltmenu = #Music.list_deltmenu
				end
				Music:Play( Music.list_deltmenu[Music.juke_deltmenu] )
			elseif Music:get_list() == 6 then
				Music.juke_epsimenu = Music.juke_epsimenu - 1
				if Music.juke_epsimenu == 0 then
					Music.juke_epsimenu = #Music.list_epsimenu
				end
				Music:Play( Music.list_epsimenu[Music.juke_epsimenu] )
			elseif Music:get_list() == 7 then
				Music.juke_roottrak = Music.juke_roottrak - 1
				if Music.juke_roottrak == 0 then
					Music.juke_roottrak = #Music.list_roottrak
				end
				Music:Play( Music.list_roottrak[Music.juke_roottrak] )
			elseif Music:get_list() == 8 then
				Music.juke_betatrak = Music.juke_betatrak - 1
				if Music.juke_betatrak == 0 then
					Music.juke_betatrak = #Music.list_betatrak
				end
				Music:Play( Music.list_betatrak[Music.juke_betatrak] )
			elseif Music:get_list() == 9 then	
				Music.juke_gammtrak = Music.juke_gammtrak - 1
				if Music.juke_gammtrak == 0 then
					Music.juke_gammtrak = #Music.list_gammtrak
				end
				Music:Play( Music.list_gammtrak[Music.juke_gammtrak] )
			elseif Music:get_list() == 10 then	
				Music.juke_delttrak = Music.juke_delttrak - 1
				if Music.juke_delttrak == 0 then
					Music.juke_delttrak = #Music.list_delttrak
				end
				Music:Play( Music.list_delttrak[Music.juke_delttrak] )
			elseif Music:get_list() == 11 then	
				Music.juke_epsitrak = Music.juke_epsitrak - 1
				if Music.juke_epsitrak == 0 then
					Music.juke_epsitrak = #Music.list_epsitrak
				end
				Music:Play( Music.list_epsitrak[Music.juke_epsitrak] )
			end
		elseif Music:Chat() == false and Music:isRestrictMap() == true then
			if Utils:IsInHeist() and Music.pause == false then
				if Music:get_list() == 1 then
					Music.juke_menu = Music.juke_menu - 1
					if Music.juke_menu == 0 then
						Music.juke_menu = #Music.jukebox_menu_tracks
					end
					Music:Play( Music.jukebox_menu_tracks[Music.juke_menu] )
				elseif Music:get_list() == 2 then
					Music.juke_rootmenu = Music.juke_rootmenu - 1
					if Music.juke_rootmenu == 0 then
						Music.juke_rootmenu = #Music.list_rootmenu
					end
					Music:Play( Music.list_rootmenu[Music.juke_rootmenu] )
				elseif Music:get_list() == 3 then
					Music.juke_betamenu = Music.juke_betamenu - 1
					if Music.juke_betamenu == 0 then
						Music.juke_betamenu = #Music.list_betamenu
					end
					Music:Play( Music.list_betamenu[Music.juke_betamenu] )
				elseif Music:get_list() == 4 then
					Music.juke_gammmenu = Music.juke_gammmenu - 1
					if Music.juke_gammmenu == 0 then
						Music.juke_gammmenu = #Music.list_gammmenu
					end
					Music:Play( Music.list_gammmenu[Music.juke_gammmenu] )
				elseif Music:get_list() == 5 then
					Music.juke_deltmenu = Music.juke_deltmenu - 1
					if Music.juke_deltmenu == 0 then
						Music.juke_deltmenu = #Music.list_deltmenu
					end
					Music:Play( Music.list_deltmenu[Music.juke_deltmenu] )
				elseif Music:get_list() == 6 then
					Music.juke_epsimenu = Music.juke_epsimenu - 1
					if Music.juke_epsimenu == 0 then
						Music.juke_epsimenu = #Music.list_epsimenu
					end
					Music:Play( Music.list_epsimenu[Music.juke_epsimenu] )
				else
					local sub = utf8.to_upper(managers.localization:text("music_menu_entry"))
					local msg = utf8.to_upper(managers.localization:text("music_list_name"))
					Music:Label( 3, sub, msg )
				end
			end
		end
	end
	---- ### MUSIC RANDOM BUTTON ###
	Music.music_call_random_func = function(self)
		if Music:Chat() == false and Music:isRestrictMap() == false then
			if Music:get_list() == 0 then
				Music.juke_track = math.random(#Music.jukebox_music_tracks)
				Music:Play( Music.jukebox_music_tracks[Music.juke_track] )
			elseif Music:get_list() == 1 then
				Music.juke_menu = math.random(#Music.jukebox_menu_tracks)
				Music:Play( Music.jukebox_menu_tracks[Music.juke_menu] )
			elseif Music:get_list() == 2 then
				Music.juke_rootmenu = math.random(#Music.list_rootmenu)
				Music:Play( Music.list_rootmenu[Music.juke_rootmenu] )
			elseif Music:get_list() == 3 then
				Music.juke_betamenu = math.random(#Music.list_betamenu)
				Music:Play( Music.list_betamenu[Music.juke_betamenu] )
			elseif Music:get_list() == 4 then
				Music.juke_gammmenu = math.random(#Music.list_gammmenu)
				Music:Play( Music.list_gammmenu[Music.juke_gammmenu] )
			elseif Music:get_list() == 5 then
				Music.juke_deltmenu = math.random(#Music.list_deltmenu)
				Music:Play( Music.list_deltmenu[Music.juke_deltmenu] )
			elseif Music:get_list() == 6 then
				Music.juke_epsimenu = math.random(#Music.list_epsimenu)
				Music:Play( Music.list_epsimenu[Music.juke_epsimenu] )
			elseif Music:get_list() == 7 then
				Music.juke_roottrak = math.random(#Music.list_roottrak)
				Music:Play( Music.list_roottrak[Music.juke_roottrak] )
			elseif Music:get_list() == 8 then
				Music.juke_betatrak = math.random(#Music.list_betatrak)
				Music:Play( Music.list_betatrak[Music.juke_betatrak] )
			elseif Music:get_list() == 9 then
				Music.juke_gammtrak = math.random(#Music.list_gammtrak)
				Music:Play( Music.list_gammtrak[Music.juke_gammtrak] )
			elseif Music:get_list() == 10 then
				Music.juke_delttrak = math.random(#Music.list_delttrak)
				Music:Play( Music.list_delttrak[Music.juke_delttrak] )
			elseif Music:get_list() == 11 then
				Music.juke_epsitrak = math.random(#Music.list_epsitrak)
				Music:Play( Music.list_epsitrak[Music.juke_epsitrak] )
			end
		elseif Music:Chat() == false and Music:isRestrictMap() == true then
			if Utils:IsInHeist() and Music.pause == false then
				if Music:get_list() == 1 then
					Music.juke_menu = math.random(#Music.jukebox_menu_tracks)
					Music:Play( Music.jukebox_menu_tracks[Music.juke_menu] )
				elseif Music:get_list() == 2 then
					Music.juke_rootmenu = math.random(#Music.list_rootmenu)
					Music:Play( Music.list_rootmenu[Music.juke_rootmenu] )
				elseif Music:get_list() == 3 then
					Music.juke_betamenu = math.random(#Music.list_betamenu)
					Music:Play( Music.list_betamenu[Music.juke_betamenu] )
				elseif Music:get_list() == 4 then
					Music.juke_deltmenu = math.random(#Music.list_deltmenu)
					Music:Play( Music.list_deltmenu[Music.juke_deltmenu] )
				elseif Music:get_list() == 5 then
					Music.juke_gammmenu = math.random(#Music.list_gammmenu)
					Music:Play( Music.list_gammmenu[Music.juke_gammmenu] )
				elseif Music:get_list() == 6 then
					Music.juke_epsimenu = math.random(#Music.list_epsimenu)
					Music:Play( Music.list_epsimenu[Music.juke_epsimenu] )
				else
					local sub = utf8.to_upper(managers.localization:text("music_menu_entry"))
					local msg = utf8.to_upper(managers.localization:text("music_list_name"))
					Music:Label( 3, sub, msg )
				end
			end
		end
	end
	---- ### MUSIC PLAYLIST BUTTON ###
	Music.music_call_list_func = function(self)
		if Utils:IsInHeist() then 
			Music.pressed = true 
		end
		Music.current_list = Music.current_list + 1
		if Music:Chat() == false and Music:isRestrictMap() == false then
			if Music.current_list >= 12 then
				Music.current_list = 0
			end
			if Music:get_list_state() == false then
				return Music.music_call_list_func()
			end
			if Music:get_list() == 0 then
				Music:List( Music.jukebox_music_tracks[Music.juke_track], Music:get_mode(), "list" )
			elseif Music:get_list() == 1 then
				Music:List( Music.jukebox_menu_tracks[Music.juke_menu], Music:get_mode(), "list" )
			elseif Music:get_list() == 2 then
				Music:List( Music.list_rootmenu[Music.juke_rootmenu], Music:get_mode(), "list" )
			elseif Music:get_list() == 3 then
				Music:List( Music.list_betamenu[Music.juke_betamenu], Music:get_mode(), "list" )
			elseif Music:get_list() == 4 then
				Music:List( Music.list_gammmenu[Music.juke_gammmenu], Music:get_mode(), "list" )
			elseif Music:get_list() == 5 then
				Music:List( Music.list_deltmenu[Music.juke_deltmenu], Music:get_mode(), "list" )
			elseif Music:get_list() == 6 then
				Music:List( Music.list_epsimenu[Music.juke_epsimenu], Music:get_mode(), "list" )
			elseif Music:get_list() == 7 then
				Music:List( Music.list_roottrak[Music.juke_roottrak], Music:get_mode(), "list" )
			elseif Music:get_list() == 8 then
				Music:List( Music.list_betatrak[Music.juke_betatrak], Music:get_mode(), "list" )
			elseif Music:get_list() == 9 then
				Music:List( Music.list_gammtrak[Music.juke_gammtrak], Music:get_mode(), "list" )
			elseif Music:get_list() == 10 then
				Music:List( Music.list_delttrak[Music.juke_delttrak], Music:get_mode(), "list" )
			elseif Music:get_list() == 11 then
				Music:List( Music.list_epsitrak[Music.juke_epsitrak], Music:get_mode(), "list" )
			end
		elseif Music:Chat() == false and Music:isRestrictMap() == true then
			if Utils:IsInHeist() and Music.pause == false then
				if Music.current_list >= 7 then
					Music.current_list = 1
				end
				if Music:get_list_state() == false then
					return Music.music_call_list_func()
				end
				if Music:get_list() == 1 then
					Music:List( Music.jukebox_menu_tracks[Music.juke_menu], Music:get_mode(), "list" )
				elseif Music:get_list() == 2 then
					Music:List( Music.list_rootmenu[Music.juke_rootmenu], Music:get_mode(), "list" )
				elseif Music:get_list() == 3 then
					Music:List( Music.list_betamenu[Music.juke_betamenu], Music:get_mode(), "list" )
				elseif Music:get_list() == 4 then
					Music:List( Music.list_gammmenu[Music.juke_gammmenu], Music:get_mode(), "list" )
				elseif Music:get_list() == 5 then
					Music:List( Music.list_deltmenu[Music.juke_deltmenu], Music:get_mode(), "list" )
				elseif Music:get_list() == 6 then
					Music:List( Music.list_epsimenu[Music.juke_epsimenu], Music:get_mode(), "list" )
				end
			end
		end
	end
	---- ### MUSIC MODE BUTTON ###
	Music.music_call_mode_func = function(self)
		if Music:Chat() == false and Music:isRestrictMap() == false then
			Music.current_mode = Music.current_mode + 1
			if Music.current_mode >= 4 then
				Music.current_mode = 0
			end
			if Music:get_list() == 0 then
				Music:Mode( Music.jukebox_music_tracks[Music.juke_track], "mode" )
			elseif Music:get_list() == 1 then
				Music:Mode( Music.jukebox_menu_tracks[Music.juke_menu], "mode" )
			elseif Music:get_list() == 2 then
				Music:Mode( Music.list_rootmenu[Music.juke_rootmenu], "mode" )
			elseif Music:get_list() == 3 then
				Music:Mode( Music.list_betamenu[Music.juke_betamenu], "mode" )
			elseif Music:get_list() == 4 then
				Music:Mode( Music.list_gammmenu[Music.juke_gammmenu], "mode" )
			elseif Music:get_list() == 5 then
				Music:Mode( Music.list_deltmenu[Music.juke_deltmenu], "mode" )
			elseif Music:get_list() == 6 then
				Music:Mode( Music.list_epsimenu[Music.juke_epsimenu], "mode" )
			elseif Music:get_list() == 7 then
				Music:Mode( Music.list_roottrak[Music.juke_roottrak], "mode" )
			elseif Music:get_list() == 8 then
				Music:Mode( Music.list_betatrak[Music.juke_betatrak], "mode" )
			elseif Music:get_list() == 9 then
				Music:Mode( Music.list_gammtrak[Music.juke_gammtrak], "mode" )
			elseif Music:get_list() == 10 then
				Music:Mode( Music.list_delttrak[Music.juke_delttrak], "mode" )
			elseif Music:get_list() == 11 then
				Music:Mode( Music.list_epsitrak[Music.juke_epsitrak], "mode" )
			end
		elseif Music:Chat() == false and Music:isRestrictMap() == true then
			if Utils:IsInHeist() then
				local sub = utf8.to_upper(managers.localization:text("music_menu_entry"))
				local msg = utf8.to_upper(managers.localization:text("music_ua"))
				Music:Label( 3, sub, msg )
			end
		end
	end
	---- ### MUSIC UN/PAUSE BUTTON ###
	Music.music_call_stop_func = function(self)
		local music_stopped = managers.localization:text("music_stopped")
		local music_resumed = managers.localization:text("music_resumed")
		local music_disable = managers.localization:text("music_disable")
		local music_inheist = managers.localization:text("music_inheist")
		local music_inlobby = managers.localization:text("music_inlobby")
		if Music:Chat() == false and Music:isRestrictMap() == false then
			Music.pause = not (Music.pause or false)
			if Music.pause then
				managers.music:track_listen_start("stop_all_music")
				if Utils:IsInHeist() then
					Music:Label( 1, music_inheist, music_stopped )
				else
					Music:Label( 1, music_inlobby, music_stopped )
				end
			else
				managers.music:track_listen_stop()
				if Utils:IsInHeist() then
					Music:Label( 1, music_inheist, music_resumed )
				else
					Music:Label( 1, music_inlobby, music_resumed )
				end
			end
		elseif Music:Chat() == false and Music:isRestrictMap() == true then
			Music.pause = not (Music.pause or false)
			if Music.pause then
				managers.music:track_listen_start("stop_all_music")
				if Utils:IsInHeist() then
					Music:SoundPlay("stop_all_music")
					Music:Label( 1, music_inheist, music_disable )
				else
					Music:Label( 1, music_inlobby, music_disable )
				end
			else
				managers.music:track_listen_stop()
				if Utils:IsInHeist() then
					Music:Label( 1, music_inheist, music_resumed )
					if Music:get_list() == 1 then
						Music:Play( Music.jukebox_menu_tracks[Music.juke_menu] )
					elseif Music:get_list() == 2 then
						Music:Play( Music.list_rootmenu[Music.juke_rootmenu] )
					elseif Music:get_list() == 3 then
						Music:Play( Music.list_betamenu[Music.juke_betamenu] )
					elseif Music:get_list() == 4 then
						Music:Play( Music.list_gammmenu[Music.juke_gammmenu] )
					elseif Music:get_list() == 5 then
						Music:Play( Music.list_deltmenu[Music.juke_deltmenu] )
					elseif Music:get_list() == 6 then
						Music:Play( Music.list_epsimenu[Music.juke_epsimenu] )
					end
				else
					Music:Label( 1, music_inlobby, music_resumed )
				end
			end
		end
	end
	---- ### DIRECT MENU ###
	Music.music_call_direct_func = function(self)
		if Music:Chat() == false then
			dofile(Music._data)
		end
	end
	---- ### LANGUAGE SELECTION ###
	MenuCallbackHandler.music_language_call_choice = function(self, item)
		Music.settings.mcontrol_language = item:value()
		Music:Save(Music.settings, Music._save)
		Music:SoundMenu("Achievement_challenge")
	end
	---- ### LABEL ###
	MenuCallbackHandler.music_label_call_choice = function(self, item)
		Music.settings.mcontrol_label = item:value()
		Music:Save(Music.settings, Music._save)
		Music:SoundMenu("crime_net_startup")
	end
	---- ### DEBUG ###
	MenuCallbackHandler.music_debug_call_toggle = function(self, item)
		Music.settings.mcontrol_debug = (item:value() == "on" or nil)
		Music:Save(Music.settings, Music._save)
		Music:SoundMenu("camera_monitor_engage")
	end
	---- ### MUSIC RENAME ###
	MenuCallbackHandler.music_rename_call_button = function(self, item)
		Music:MusicRename(0)
	end
	---- ### MUSIC UPDATE ###
	MenuCallbackHandler.music_update_call_button = function(self, item)
		Music:MusicUpdate(0)
	end
	---- ### AUTOPLAY ON DURATION ###
	MenuCallbackHandler.music_switch_call_choice = function(self, item)
		Music.settings.mcontrol_switch = item:value()
		Music:Save(Music.settings, Music._save)
		Music:SoundMenu("crime_net_startup")
	end
	---- ### AUTOPLAY ON ASSAULT WAVE ###
	MenuCallbackHandler.music_switchonwave_call_toggle = function(self, item)
		Music.settings.mcontrol_switchonwave = (item:value() == "on" or nil)
		Music:Save(Music.settings, Music._save)
		Music:SoundMenu("highlight")
	end
	---- ### AUTOPLAY SHUFFLE ###
	MenuCallbackHandler.music_shuffle_call_toggle = function(self, item)
		Music.settings.mcontrol_shuffle = (item:value() == "on" or nil)
		Music:Save(Music.settings, Music._save)
		Music:SoundMenu("camera_monitor_engage")
	end
	---- ### LOCK MUSIC EVENT ###
	MenuCallbackHandler.music_eventlock_call_toggle = function(self, item)
		Music.settings.mcontrol_eventlock = (item:value() == "on" or nil)
		Music:Save(Music.settings, Music._save)
		Music:SoundMenu("highlight")
	end
	---- ### DISPLAY STAGE ###
	MenuCallbackHandler.music_stage_call_toggle = function(self, item)
		Music.settings.mcontrol_stage = (item:value() == "on" or nil)
		Music:Save(Music.settings, Music._save)
		Music:SoundMenu("highlight")
	end
	---- ### SAVE ###
	MenuCallbackHandler.music_save = function(self, item)
		Music:SoundMenu("Stop_all_music")
		Music:Save(Music.settings, Music._save)
	end
	---- ### LOAD ###
	Music:Load(Music.settings, Music._save)
	Music:Audio() Music:Build()
	---- ### JSON ###
	MenuHelper:LoadFromJsonFile(Music._menu .. "menu.txt", Music, Music.settings)
end)
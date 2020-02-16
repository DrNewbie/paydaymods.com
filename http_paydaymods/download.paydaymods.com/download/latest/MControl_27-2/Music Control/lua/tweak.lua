function Music:Harfatus()
	if not BaseMenu then
		BaseMenu = class()
		function BaseMenu:init(title, message, options)
			self.dialog_data = { title = title, text = message, button_list = {},
			id = tostring(math.random(0,0xFFFFFFFF)) }
			self.visible = false
			for _,opt in ipairs(options) do
				local elem = {}
				elem.text = opt.text
				opt.data = opt.data or nil
				opt.callback = opt.callback or nil
				elem.callback_func = callback( self, self, "_do_callback", {data = opt.data, callback = opt.callback} )
				elem.cancel_button = opt.is_cancel_button or false
				if opt.is_focused_button then
					self.dialog_data.focus_button = #self.dialog_data.button_list+1
				end
				table.insert(self.dialog_data.button_list, elem)
			end
			return self
		end
		function BaseMenu:_do_callback(info)
		if info.callback then
			if info.data then
				info.callback(info.data)
			else
				info.callback()
			end
		end
			self.visible = false
		end
		function BaseMenu:show()
			if self.visible then
				return
			end
			self.visible = true
			managers.system_menu:show(self.dialog_data)
		end
		function BaseMenu:hide()
			if self.visible then
				managers.system_menu:close(self.dialog_data.id)
				self.visible = false
				return
			end
		end
	end
	ChildMenu = ChildMenu or class(BaseMenu)
	function ChildMenu:init(title, message, options, mode)
		self.mode = mode or 1
		self.dialog_data = { title = title, text = message, button_list = {}, id = tostring(math.random(0,0xFFFFFFFF)) }
		self.visible = false
		for _,opt in ipairs(options) do
			local elem = {}
			elem.text = opt.text
			opt.data = opt.data or nil
			opt.callback = opt.callback or nil
			elem.callback_func = callback(self, self, "_do_callback",{ data = opt.data, callback = opt.callback, come_back = opt.switch_back })
			elem.cancel_button = opt.is_cancel_button or false
			if opt.is_focused_button then
				self.dialog_data.focus_button = #self.dialog_data.button_list+1
			end
			table.insert(self.dialog_data.button_list, elem)
		end
		return self
	end
	function ChildMenu:show()
		if ChildMenu.__current_menu then
			ChildMenu.__current_menu:hide(true)
		end
		self.super.show(self)
		ChildMenu.__current_menu = self
	end
	function ChildMenu:hide( conflict )
		if not conflict or not self.persisted then
		self.super.hide(self)
		for _,btn in pairs(self.dialog_data.button_list) do
			if btn.cancel_button then
				btn.callback_func()
			end
		end
		ChildMenu.__current_menu = nil
		end
	end
	function ChildMenu:_do_callback(info)
		if info.callback then
			local err, res = pcall(info.callback, info.data)
		end
		if info.come_back and self.mode == 1 then
			if type(info.come_back) == "function" then
				info.come_back()
			else
				self:show()
			end
		end
	end
	max_entries = 20
    insert = table.insert
    MusicMenu = function(title,text,data,fallback,mx,n)
        if not n or n < 1 then
            n = 1
        end
        local max_entries = mx or max_entries
		local t_data = { { text = "Exit", cancel_button = true } }
		local s_data = { { text = "" } }
        if fallback then
            insert(t_data, { text = "Return", callback = fallback })
        end
		if (#data - n >= max_entries) then
            insert(t_data, { text = "Next Page", callback = function() MusicMenu(title,text,data,fallback,mx,n+max_entries) end })
        end
        if n > 1 then
            insert(t_data, { text = "Previous Page", callback = function() MusicMenu(title,text,data,fallback,mx,n-max_entries) end })
        end
        insert(t_data, {})
        for i=n,(max_entries+(n-1) < #data) and max_entries+(n-1) or #data do
            insert(t_data, data[i])
        end
		insert(s_data, {})
		local menu = ChildMenu:new(title, text, t_data)
		menu:show()
    end
end

if not Music.MenuSetup then 
	Music.MenuSetup = true 
	Music:Harfatus()
end

function Music:tweak_debug()
	Music.settings.mcontrol_debug = not (Music.settings.mcontrol_debug or nil)
	Music:Save(Music.settings, Music._save)
end

function Music:tweak_label()
	Music.settings.mcontrol_label = Music.settings.mcontrol_label + 1
	if Music.settings.mcontrol_label > 3 then
		Music.settings.mcontrol_label = 1
	end
	Music:Save(Music.settings, Music._save)
end

function Music:tweak_switch()
	Music.settings.mcontrol_switch = Music.settings.mcontrol_switch + 1
	if Music.settings.mcontrol_switch > 9 then
		Music.settings.mcontrol_switch = 1
	end
	Music:Save(Music.settings, Music._save)
end

function Music:tweak_switchonwave()
	Music.settings.mcontrol_switchonwave = not (Music.settings.mcontrol_switchonwave or nil)
	Music:Save(Music.settings, Music._save)
end

function Music:tweak_shuffle()
	Music.settings.mcontrol_shuffle = not (Music.settings.mcontrol_shuffle or nil)
	Music:Save(Music.settings, Music._save)
end

function Music:tweak_eventlock()
	Music.settings.mcontrol_eventlock = not (Music.settings.mcontrol_eventlock or nil)
	Music:Save(Music.settings, Music._save)
end

function Music:tweak_stage()
	Music.settings.mcontrol_stage = not (Music.settings.mcontrol_stage or nil)
	Music:Save(Music.settings, Music._save)
end

function Music:shift_pd2_steam()
	local success = false
	if managers.network:session() then
		if not MenuCallbackHandler:is_overlay_enabled() then
			managers.menu:show_enable_steam_overlay()
			return
		end
		local host = managers.network:session():local_peer()
		local usid = host:user_id()
		Steam:overlay_activate("url", "http://steamrep.com/profiles/".. usid)
		success = true
	else
		local head = utf8.to_upper(managers.localization:text("music_menu_entry"))
		local mess = utf8.to_upper(managers.localization:text("music_ua"))
		Music:Label( 3, head, mess )
		success = false
	end
	self:SoundMenu(success and "camera_monitor_engage" or "trip_mine_sensor_alarm")
end

function Music:shift_pd2_lastbullet()
	if not MenuCallbackHandler:is_overlay_enabled() then
		managers.menu:show_enable_steam_overlay()
		return
	end
	Steam:overlay_activate("url", "http://downloads.lastbullet.net/15121")
	self:SoundMenu("item_buy")
end

function Music:shift_pd2_reddit()
	if not MenuCallbackHandler:is_overlay_enabled() then
		managers.menu:show_enable_steam_overlay()
		return
	end
	Steam:overlay_activate("url", "https://www.reddit.com/r/paydaytheheist")
	self:SoundMenu("item_buy")
end

function Music:shift_pd2_repeat()
	if not MenuCallbackHandler:is_overlay_enabled() then
		managers.menu:show_enable_steam_overlay()
		return
	end
	Steam:overlay_activate("url", "https://listenonrepeat.com/")
	self:SoundMenu("item_buy")
end

function Music:shift_build_version()
	Music:Label( 3, "version", Music.build_version )
	self:SoundMenu("trip_mine_sensor_alarm")
end

function Music:shift_total_songs()
	Music:Label( 3, "total songs", Music.settings.total_songs )
	self:SoundMenu("trip_mine_sensor_alarm")
end

function Music:DirectMenu()
	local label local songs
	if Music.settings.mcontrol_label == 2 then
		label = "music_label_type_2"
	elseif Music.settings.mcontrol_label == 3 then
		label = "music_label_type_3"
	else
		label = "music_label_type_1"
	end
	if Music.settings.mcontrol_switch == 2 then
		switch = "music_switch_mus2"
	elseif Music.settings.mcontrol_switch == 3 then
		switch = "music_switch_mus3"
	elseif Music.settings.mcontrol_switch == 4 then
		switch = "music_switch_mus4"
	elseif Music.settings.mcontrol_switch == 5 then
		switch = "music_switch_mus5"
	elseif Music.settings.mcontrol_switch == 6 then
		switch = "music_switch_mus6"
	elseif Music.settings.mcontrol_switch == 7 then
		switch = "music_switch_mus7"
	elseif Music.settings.mcontrol_switch == 8 then
		switch = "music_switch_mus8"
	elseif Music.settings.mcontrol_switch == 9 then
		switch = "music_switch_mus9"
	else
		switch = "music_switch_mus1"
	end
	if type(Music.songs) == "table" then
		songs = utf8.to_upper(managers.localization:text("music_ua"))
	else
		songs = Music.songs
	end
	local data = {}
	if shift() then
		data = {
		{ text = utf8.to_upper(managers.localization:text("music_youtube_rep")), callback = function() self:shift_pd2_repeat() end },
		{ text = utf8.to_upper(managers.localization:text("music_subredd_pd2")), callback = function() self:shift_pd2_reddit() end },
		{ text = utf8.to_upper(managers.localization:text("music_last_bullet")), callback = function() self:shift_pd2_lastbullet() end },
		{ text = utf8.to_upper(managers.localization:text("music_profile_rep")), callback = function() self:shift_pd2_steam() end },
		{},
		{ text = utf8.to_upper(managers.localization:text("music_version_mod")), callback = function() self:shift_build_version() end },
		{ text = utf8.to_upper(managers.localization:text("music_total_songs")), callback = function() self:shift_total_songs() end },
		{ text = utf8.to_upper(managers.localization:text("music_debug_name")) .. " \[".. managers.localization:text(tostring(Music.settings.mcontrol_debug)) .."\]", callback = function() self:tweak_debug() end },
		{}
		}
		MusicMenu(utf8.to_upper(managers.localization:text("music_menu_entry")), utf8.to_upper(managers.localization:text("music_song") .. " : " .. songs .. "\n" .. managers.localization:text("music_playlist_name") .. " : " .. Music:get_list_name() .. "\n" .. utf8.to_upper(managers.localization:text("music_spending_me")) .. " : " .. Music:Total() .. "    " .. utf8.to_upper(managers.localization:text("music_offshore_me")) .. " : " .. Music:Offshore()), data, nil)
		Music:SoundMenu("camera_monitor_engage")
	else
		data = {
		{ text = utf8.to_upper(managers.localization:text("music_label_name")) .. " \[".. managers.localization:text(tostring(label)) .."\]", callback = function() self:tweak_label() end },
		{ text = utf8.to_upper(managers.localization:text("music_switch_name")) .. " \[".. managers.localization:text(tostring(switch)) .."\]", callback = function() self:tweak_switch() end },
		{ text = utf8.to_upper(managers.localization:text("music_switchonwave_name")) .. " \[".. managers.localization:text(tostring(Music.settings.mcontrol_switchonwave)) .."\]", callback = function() self:tweak_switchonwave() end },
		{ text = utf8.to_upper(managers.localization:text("music_shuffle_name")) .. " \[".. managers.localization:text(tostring(Music.settings.mcontrol_shuffle)) .."\]", callback = function() self:tweak_shuffle() end },
		{ text = utf8.to_upper(managers.localization:text("music_eventlock_name")) .. " \[".. managers.localization:text(tostring(Music.settings.mcontrol_eventlock)) .."\]", callback = function() self:tweak_eventlock() end },
		{ text = utf8.to_upper(managers.localization:text("music_stage_name")) .. " \[".. managers.localization:text(tostring(Music.settings.mcontrol_stage)) .."\]", callback = function() self:tweak_stage() end },
		{}
		}
		MusicMenu(utf8.to_upper(managers.localization:text("music_menu_entry") .. " (" .. (managers.localization:text("music_shift")) .. "+" .. (managers.localization:text("music_direct_name")) .. ")"), utf8.to_upper(managers.localization:text("music_song") .. " : " .. songs .. "\n" .. managers.localization:text("music_playlist_name") .. " : " .. Music:get_list_name() .. "\n" .. utf8.to_upper(managers.localization:text("music_spending_me")) .. " : " .. Music:Total() .. "    " .. utf8.to_upper(managers.localization:text("music_offshore_me")) .. " : " .. Music:Offshore()), data, nil)
		Music:SoundMenu("camera_monitor_engage")
	end
end

Music:DirectMenu()
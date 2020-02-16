local perkdeck_atlas = "guis/textures/pd2/specialization/icons_atlas"
local weapons_dir = "guis/textures/pd2/blackmarket/icons/weapons" --folder, not file
local hud_tabs = "guis/textures/pd2/hud_tabs"
local skill_atlas = "guis/textures/pd2/skilltree/icons_atlas"
local skill_atlas_2 = "guis/textures/pd2/skilltree_2/icons_atlas_2"
local pixel_texture = "guis/textures/pd2/skilltree/icons_atlas"
local pixel_rect = {86,86,1,1} --just a single 100% alpha pixel

local ammo_font = tweak_data.hud_players.ammo_font
local font_large_mf = "fonts/font_large_mf"
local font_medium_mf = "fonts/font_medium_mf"
local font_medium_shadow_mf = "fonts/font_medium_shadow_mf"

local pad_large = 20
local pad_medium = 10
local pad_small = 5

local debug_panels_visible = false

function HUDTeammate:_add_buff(id)
	local buffs_panel = self._khud_buffs_panel
	local buff_data = managers.player:get_buff_data()[id]
	local current_buffs = managers.player:get_buffs()
	local buff = current_buffs[id]
--	local num = #buffs --can't get length of unordered tables :(
	local num = 0
	for id,buffy_the_vampire_slayer in pairs(current_buffs) do
		num = num + 1
		--heck, i hate doing this
	end
	local max_per_column = 6
	local w = 175
	local h = 32
	local icon_scale = 1
	
	local icon = buff.icon or buff_data.icon --should always use buff_data
	local source = buff.source or buff_data.source --should always use buff_data
	local icon_tier = buff.icon_tier or buff_data.icon_tier or 1 --only used for perk decks
	local tier_floors = buff.tier_floors or buff_data.tier_floors --used to get max_tier but with a whitelist
	
	local text_color = buff.text_color or buff_data.text_color
	local icon_color = buff.icon_color or buff_data.icon_color
	local label = buff.label or buff_data.label
	
	if buffs_panel:child(id) then --todo overhaul this refresh thingy
		if icon_color then 
			buffs_panel:child(id):child("icon"):set_color(icon_color)
		end
		if text_color then 
			buffs_panel:child(id):child("label"):set_color(text_color)
		end
	else

		local font_size = 16
		local rect = {0,0,64,64}
		local texture = skill_atlas
		if source == "skill" then 
			texture = skill_atlas_2
			local x,y = unpack(tweak_data.skilltree.skills[icon].icon_xy)
			rect = {x * 80,y * 80,80,80}
		elseif source == "perk" then
			texture,rect = tweak_data.skilltree:get_specialization_icon_data_with_tier_because_overkill_wouldnt_do_it(tonumber(icon),nil,icon_tier,tier_floors)
--			texture,rect = tweak_data.skilltree:get_specialization_icon_data(tonumber(buff_data.icon))
		elseif source == "icon" then
			texture,rect = tweak_data.hud_icons:get_icon_data(icon or "mugshot_normal")
		else --"manual" source i guess
		--todo throw an error or something idk
			texture,rect = tweak_data.hud_icons:get_icon_data("frag_grenade")
		end
		if not rect then 
--			KineticHUD:c_log("Bad rect!")
		end
		local buff_x = w * math.floor(num / max_per_column)
		local buff_panel = buffs_panel:panel({
			name = tostring(id),
			x = buff_x,
			y = buffs_panel:h() - (num * (h + pad_medium)),--(num * h + pad_medium),
			w = w,
			h = h,
			layer = 4
		})
		local buff_icon = buff_panel:bitmap({
			name = "icon",
			visible = true,
			w = h * icon_scale,
			h = h * icon_scale,
--			y = buffs_panel:h() - ((1 + num) * (32 + pad_medium)),
			texture = texture,
			texture_rect = rect,
			blend_mode = "add"
--			align = "center",
--			vertical = "center",
--			valign = "scale",
--			halign = "scale"
		})
		if icon_color then buff_icon:set_color(icon_color) end
		local buff_label = buff_panel:text({
			name = "label",
			layer = 3,
			font_size = font_size,
			font = ammo_font,
			text = label,
			x = (h * icon_scale) + pad_small,
			y = (h * icon_scale / 3), --not quite bottom
			color = text_color or Color.white
		})
		--[[
		local buff_value = buff_panel:text({
			name = "value",
			visible = false,
			layer = 3,
			font_size = font_size,
--			vertical = "bottom",
--			align = "left",
			font = ammo_font,--"fonts/font_medium_mf",
			text = "4:20",
			x = (string.len(buff_data.label) * (font_size / 1.5)) + pad_small, --buff_label:right(),--
			y = (h * icon_scale / 2), --bottom
			color = color or Color.white
		})
		--]]
		local debug_buffs = buff_panel:rect({
			name = "debug_buffs",
			visible = debug_panels_visible,
			layer = 0,
			color = Color.purple:with_alpha(0.3)
		})		
	end
end

function HUDTeammate:_remove_buff(id)
	local buffs_panel = self._khud_buffs_panel
	if buffs_panel:child(id) then
		buffs_panel:remove(buffs_panel:child(id))
	end
end

function HUDTeammate:update_tracked_sentryguns()
	local sentrygun_texture = tweak_data.hud_icons.equipment_sentry.texture
	local sentrygun_rect = tweak_data.hud_icons.equipment_sentry.texture_rect
	local scanner_right_panel = self._khud_scanner_right
	local tracked_sentrygun,sentrygun_label,sentrygun_icon,sentrygun_unit
	local tracked_sentryguns = managers.player:get_tracked_sentryguns()
--	scanner_right_panel:set_visible(KineticHUD:IsSentryTrackerEnabled())
	local queued_remove_sentryguns = {}
	for k = 0,KineticHUD.max_tracked_sentryguns do
		sentrygun_label = scanner_right_panel:child("scanner_right_label_" .. k)
		sentrygun_icon = scanner_right_panel:child("scanner_right_icon_" .. k)
		tracked_sentrygun = tracked_sentryguns[k]
		if sentrygun_label and tracked_sentrygun then 
			managers.hud._teammate_panels[HUDManager.PLAYER_PANEL]._khud_scanner_right:child("scanner_right_icon_" .. k):set_image(sentrygun_texture,unpack(sentrygun_rect))
			sentrygun_unit = tracked_sentrygun.unit
			if not alive(sentrygun_unit) then 
				if sentrygun_unit then 
					sentrygun_label:set_visible(false)
					sentrygun_icon:set_visible(false)
					table.insert(queued_remove_sentryguns,k)
--					KineticHUD:_debug("ERROR! NO SENTRYGUN UNIT",k)
				else
--					KineticHUD:_debug("no sentrygun unit found",k)
				end
			else
				local label = "" --could number with k?
				local sentrygun_damage = sentrygun_unit:character_damage()
				if sentrygun_damage then
					local sentry_hp 
					if (managers.network and Network and Network:is_client()) then --if not host in multiplayer game, use synced sentry hp value
						sentry_hp = sentrygun_damage._health_ratio
					else --if host or offline, use 
						sentry_hp = sentrygun_damage:health_ratio()
					end
					if sentry_hp then 
						label = label .. "  " .. string.format("%d",(sentry_hp * 100)) .. "% HP | "
					end
				end
				local sentrygun_weapon = sentrygun_unit:weapon()
				local sentry_ammo
				if sentrygun_weapon then 
					sentry_ammo = sentrygun_weapon:ammo_ratio()
					label = label .. "  " .. string.format("%d",(sentry_ammo * 100)) .. "% AMMO" --or %.1f 
				end
				
				if (sentry_ammo and sentry_ammo <= 0) then
					sentrygun_icon:set_color(KineticHUD.quality_colors.strange)
					sentrygun_label:set_visible(true)
				elseif (sentrygun_damage and sentrygun_damage:dead()) then 
					sentrygun_icon:set_color(KineticHUD.quality_colors.collector)
--					KineticHUD:_debug("Dead/No ammo",k)
					sentrygun_label:set_visible(false)
					sentrygun_icon:set_alpha(0.2)
				elseif sentrygun_weapon then
					if sentrygun_weapon._use_armor_piercing then
						sentrygun_icon:set_color(Color(0.1,1,0.1))
						sentrygun_label:set_visible(true)
--						KineticHUD:_debug("AP",k)
					else
						sentrygun_icon:set_color(Color(0.2,0.8,1))
						sentrygun_label:set_visible(true)
--						KineticHUD:_debug("Normal " .. Application:time(),k)
					end
				else
--					KineticHUD:_debug("No weapon",k)
					sentrygun_icon:set_color(Color.white)
				end
				sentrygun_label:set_color(tweak_data.chat_colors[tracked_sentrygun.owner_id or 1])
				sentrygun_label:set_text(label)
				sentrygun_icon:set_visible(true)
			end
		else
			--should not be used
			sentrygun_label:set_text("")
			sentrygun_icon:set_visible(false)
		end
	end
	
	for _,id in pairs(queued_remove_sentryguns) do 
		managers.player:remove_tracked_sentrygun(id)
	end	
end

function HUDTeammate:update_tracked_ecms()
	local ecm_texture = tweak_data.hud_icons.equipment_ecm_jammer.texture
	local ecm_rect = tweak_data.hud_icons.equipment_ecm_jammer.texture_rect
	local scanner_right_panel = self._khud_scanner_right
	local ecm_label,tracked_ecm,battery_left
	local queued_remove_ecms = {}
	local tracked_ecms = managers.player:get_tracked_ecms()
--	for k,ecm in ipairs(managers.player:get_tracked_ecms()) do
--	KineticHUD:c_log(k,"Current tracked ecm")
--	PrintTable(tracked_ecms)
	for k = 0,KineticHUD.max_tracked_ecms do
		ecm_label = scanner_right_panel:child("scanner_right_label_" .. k)
		ecm_icon = scanner_right_panel:child("scanner_right_icon_" .. k)
		tracked_ecm = tracked_ecms[k]
		if ecm_label and tracked_ecm then
			managers.hud._teammate_panels[HUDManager.PLAYER_PANEL]._khud_scanner_right:child("scanner_right_icon_" .. k):set_image(ecm_texture,unpack(ecm_rect))	
			battery_left = tracked_ecm.expire_t - Application:time()
			ecm_label:set_text(tostring(string.format("%.2fs",math.max(0,battery_left))))
			ecm_label:set_color(tweak_data.chat_colors[tracked_ecm.owner_id or 1])
			if tracked_ecm.jam_people then 
				ecm_icon:set_color(Color.yellow)
			elseif tracked_ecm.jam_pagers then 
				ecm_icon:set_color(Color("40CFFF"))
			elseif tracked_ecm.jam_cameras then 
				ecm_icon:set_color(Color.white)
			end
			if battery_left < 0 then 
				table.insert(queued_remove_ecms,k)
			end
			ecm_icon:set_visible(true)
			ecm_label:set_visible(true)
		elseif ecm_label then 
			ecm_label:set_text("")
			ecm_icon:set_visible(false)
		end
	end
	if #queued_remove_ecms > 0 then 
		managers.player:remove_tracked_ecms(queued_remove_ecms)
	end
end


--============--
--SET HUD DATA--
--============--

function HUDTeammate:set_voice_com(status)
	local indicator = self._khud_player:child("voice_indicator")	
	indicator:set_alpha(status and 1 or 0.999)
	--alpha only decays if at 0.999. what, do i look like someone who's not lazy enough to track/get last active time properly to you?
end

function HUDTeammate:set_weapon_firemode_burst(id,firemode,burst_fire) --for burstfire users
	self:set_weapon_firemode(id,"burst")
end

function HUDTeammate:_set_khud_player_visible()
	local visible = KineticHUD:GetSettings("panel_player_enabled")
	self._khud_player:set_visible(visible)
	self._player_panel:set_visible(not visible)
	
	local teammate_panel = self._panel
	local name = teammate_panel:child("name")
	local name_bg = teammate_panel:child("name_bg")
	local callsign_bg = teammate_panel:child("callsign_bg")
	local callsign = teammate_panel:child("callsign")
	name:set_visible(not visible)
	name_bg:set_visible(not visible)
	callsign:set_visible(not visible)
	callsign_bg:set_visible(not visible)
end
function HUDTeammate:_set_khud_team_visible()
	local visible = KineticHUD:GetSettings("panel_team_enabled")
	self._khud_player:set_visible(visible)
	self._player_panel:set_visible(not visible)
	
	local teammate_panel = self._panel
	local name = teammate_panel:child("name")
	local name_bg = teammate_panel:child("name_bg")
	local callsign_bg = teammate_panel:child("callsign_bg")
	local callsign = teammate_panel:child("callsign")
	name:set_visible(not visible)
	name_bg:set_visible(not visible)
	callsign:set_visible(not visible)
	callsign_bg:set_visible(not visible)
end

--local orig_set_firemode = HUDTeammate.set_weapon_firemode
--function HUDTeammate:set_weapon_firemode(id, firemode)
Hooks:PostHook(HUDTeammate,"set_weapon_firemode","khud_hudteammate_set_weapon_firemode",function(self,id,firemode)
	if self._main_player then 
		local weapons_panel = self._khud_weapons_panel
		local weapon_panel
		local firemode_parent,firemode_panel
		if id == 1 then -- local is_secondary = id == 1
			weapon_panel = weapons_panel:child("secondary_weapon_panel")
			firemode_panel = weapon_panel:child("secondary_firemode_panel"):child("firemode_secondary")
		else
			weapon_panel = weapons_panel:child("primary_weapon_panel")
			firemode_panel = weapon_panel:child("primary_firemode_panel"):child("firemode_primary")
		end
--		local firemode_panel = is_secondary and weapons_panel:child("secondary_weapon_panel"):child("secondary_firemode_panel"):child("firemode_secondary") or weapons_panel:child("primary_weapon_panel"):child("primary_firemode_panel"):child("firemode_primary")
	--	local secondary_weapon_panel = wpn_panel:child("secondary_weapon_panel")
	--	local primary_weapon_panel = wpn_panel:child("primary_weapon_panel")

		if firemode_panel and alive(firemode_panel) then 
			local color = Color.white
			local num = 32
--				firemode_parent:child("safety_text"):set_visible(false)
			weapon_panel:child("safety_text"):set_visible(false)
			if firemode == "auto" then
				num = 32
			elseif firemode == "single" then 
				num = 6 --should be 6?
			elseif firemode == "burst" then --HUDManager._USE_BURST_MODE
				num = 12
			elseif firemode == KineticHUD.firemode_safety then --no longer used
				num = 0
				color = Color.red
				weapon_panel:child("safety_text"):set_visible(true)
--				firemode_parent:child("safety_text"):set_visible(true)
			end
			firemode_panel:set_width(num)
	--		firemode_panel:set_size(num,num)
			firemode_panel:set_image(
			"guis/textures/pd2/specialization/icons_atlas",
				64 * 3.55,
				64 * 3.65,
				num,
				27
			)
		end
		return
	end
--	return orig_set_firemode(self,id,firemode) --unnecessary prob, can just posthook
end)

Hooks:PostHook(HUDTeammate,"recreate_weapon_firemode","khud_recreate_weapon_firemode",function(self)
	self:recreate_khud_weapon_firemode()
end)

function HUDTeammate:recreate_khud_weapon_firemode() --this doesn't work for some reason, but i'll keep it here anyway
	if self._main_player then 
		self:_create_khud_primary_firemode()
		self:_create_khud_secondary_firemode()
	end	
end

function HUDTeammate:_set_khud_weapon_killcount(slot,count)
	local wpn_panel
	if slot == 1 then 
		wpn_panel = self._primary_weapon_panel:child("primary_kill_counter")
		wpn_panel:set_text(" " .. tostring(count))
	elseif slot == 2 then 
		wpn_panel = self._secondary_weapon_panel:child("secondary_kill_counter")
		wpn_panel:set_text(" " .. tostring(count))
	end
end

Hooks:PostHook(HUDTeammate,"set_weapon_selected","khud_set_weapon_selected",function(self,id,hud_icon)
	if self._main_player then
		self:_set_khud_selected_weapon(id,hud_icon)
	else
		--nothing
	end
end)

function HUDTeammate:_set_khud_weapon_icons(slot) --todo set primary/secondary weapon icon by passed id, else set both icons
	local primary_weapon_panel = self._primary_weapon_panel
	local secondary_weapon_panel = self._secondary_weapon_panel
	local unit = managers.player:local_player()
	local panel = self._khud_player
	local id1 = "glock_17"
	local id2 = "amcar"
--	KineticHUD:c_log(unit:inventory():equipped_selection(),"Equipped selection")
	if alive(unit) then --put in set_weapon_selected
		if (not slot) or slot == 1 then
			local panel_1 = secondary_weapon_panel:child("secondary_icon")
			local weapon_1 = managers.blackmarket:equipped_secondary().weapon_id --unit:inventory():unit_by_selection(1)
			panel_1:set_visible(true)
			panel_1:set_image(managers.blackmarket:get_weapon_icon_path(weapon_1))
		end
		if (not slot) or slot == 2 then
			local panel_2 = primary_weapon_panel:child("primary_icon")
			local weapon_2 = managers.blackmarket:equipped_primary().weapon_id --unit:inventory():unit_by_selection(2)
			panel_2:set_visible(true)
			panel_2:set_image(managers.blackmarket:get_weapon_icon_path(weapon_2))
		end
		return
	end
end

function HUDTeammate:_set_khud_selected_weapon(id,hud_icon)
	local is_secondary = id == 1
	local bm = managers.blackmarket
	self._primary_weapon_panel:set_alpha(is_secondary and 0.5 or 0.9)
	self._secondary_weapon_panel:set_alpha(is_secondary and 0.9 or 0.5)
	--todo animate focus fade?
	
	--do animate bar movement
	KineticHUD.selected_wpn = is_secondary and 2 or 1 --"secondary" is weapon 1. "primary" is weapon 2. ovk pls
	KineticHUD.start_swap_wpn_t = Application:time()
	if KineticHUD:UseWeaponName() then 
		local weapon_id = is_secondary and bm:equipped_secondary().weapon_id or bm:equipped_primary().weapon_id
		local weapon_name = managers.weapon_factory:get_weapon_name_by_weapon_id(weapon_id)
		local weapon_nickname = (is_secondary and bm:equipped_secondary() or bm:equipped_primary()).custom_name
		if weapon_nickname and KineticHUD:UseWeaponNickname() then 
			self._khud_weapon_name:set_text(tostring(weapon_nickname))
			self._khud_weapon_name:set_color(KineticHUD:GetColor("unique"))
--			KineticHUD:c_log(weapon_nickname)
		else
--			KineticHUD:c_log(weapon_name)
			self._khud_weapon_name:set_text(tostring(weapon_name))
			self._khud_weapon_name:set_color(Color.white)
		end
			self._khud_weapon_name:set_alpha(1)
--			local category = is_secondary and "secondaries" or "primaries"
--			local slot = bm:equipped_weapon_slot(category)
--			local weapon_nickname = bm:get_crafted_custom_name(category,slot,false)
--			KineticHUD:t_log(weapon_nickname)
--			KineticHUD:c_log(weapon_name)
	end
	
--	self._khud_player:child("weapon_name"):set_text(weapon_name)
end

function HUDTeammate:_set_weapon_safety(id,safety) --actually sets the safety on, functionally as well as visually
	if not self._main_player then 
		return --should never be called from networking
	end
	self._khud_weapons_panel:child(id == 1 and "secondary_weapon_panel" or "primary_weapon_panel"):child("safety_text"):set_visible(not safety)
--		self:set_weapon_firemode(id,KineticHUD.firemode_safety)
end

function HUDTeammate:_set_khud_downs(downs)
	self._khud_downcounter_panel:child("text_revives"):set_text(tostring(downs))
end

function HUDTeammate:_set_debug_value(value,slot)
	local panel
	if slot == 0 then
		panel = self._khud_debug_info:child("value")
	else
		panel =	self._khud_debug_info:child("debug_slot_" .. tostring(slot))
	end
	if panel and alive(panel) then
		if value ~= nil then 
			panel:set_text(tostring(slot) .. ". " .. tostring(value))
		else
			panel:set_text("")
		end
	end
end

function HUDTeammate:_set_debug_look(veclook)
	local hud = self._khud_player
	local debug_info = self._khud_debug_info --hud:child("debug_info")
	local look_dir = debug_info:child("look_dir")
	
	local yaw = veclook:yaw()
	local pitch = veclook:pitch()
	local roll = veclook:roll()
--	string.format("x:%06dy:%06dz:%06d",math.floor(pos_x),math.floor(pos_y),math.floor(pos_z))	
	if KineticHUD:IsDebugEnabled() then 
		look_dir:set_text(string.format("YAW:%03d/PIT:%03d/ROL:%03d",yaw,pitch,roll))
	end
	if KineticHUD:UseCompass() then
		local compass = self._khud_compass:child("compass_strip")
		local compass_yaw = (0.5 + (math.rad(yaw * 0.5) / math.pi)) - 1
--		self:_set_debug_value(compass_yaw)
		compass:set_x(compass_yaw * hud:w())
	end
end

function HUDTeammate:_set_debug_coords(vecpos)
--	local hud = self._khud_player
	local debug_info = self._khud_debug_info --hud:child("debug_info")
	local coords = debug_info:child("coords")
	
	local pos_x = vecpos.x
	local pos_y = vecpos.y
	local pos_z = vecpos.z
	
	
	coords:set_text(string.format("x:%06d y:%06d z:%06d",math.floor(pos_x),math.floor(pos_y),math.floor(pos_z)))
end

function HUDTeammate:_set_subregion(str)
--	local hud = self._khud_player
	local region_panel = self._khud_region_panel
	if self._main_player then 
		str = utf8.to_upper(str)
	end
	
	--local subregion_panel = region_panel:child("subregion_panel")
	--local subregion_label = subregion_panel:child("subregion_label")
	
	region_panel:child("region_label"):set_text(str)
end

function HUDTeammate:_set_khud_stamina(stamina,max_stamina)
	local stamina_ratio = stamina / max_stamina
	local stamina_panel = self._khud_stamina
	local stamina_rect = stamina_panel:child("bar_stamina_rect")
	local stamina_inset = 3 --todo make this uniform with create? i guess the one in create doesn't matter, except that x value isn't updated
	local max_w = stamina_panel:w() - (stamina_inset / 2)
	local max_h = stamina_panel:h() - (stamina_inset / 2)
	local stamina_w = max_w * stamina_ratio
	stamina_rect:set_w(stamina_w)
	stamina_rect:set_color((stamina < tweak_data.player.movement_state.stamina.MIN_STAMINA_THRESHOLD) and Color("FA5252") or Color.white:with_alpha(0.7))
--	stamina_rect:set_y((stamina_panel:y() + max_h + - stamina_inset) - stamina_h)

	--TODO animate coroutine yield function
	local fade_duration = 1.5
--	local start_t = managers.game_play_central:get_heist_timer()
--	local end_t = start_t + fade_duration

	local alpha = 0

	local sign = (stamina < max_stamina) and 1 or 0

	local function animate_fadeout_stamina(o) --fadeout func
		repeat
--			local t = managers.game_play_central:get_heist_timer()
--			local progress = (end_t - t) / fade_duration 
			alpha = o:alpha()
			
			alpha = alpha - 0.02 --( alpha / 3)
			o:set_alpha(alpha)
			
			coroutine.yield()
		until alpha <= 0 --end_t <= t
	end
	
	if stamina < max_stamina then --fade in
		stamina_panel:stop()
		alpha = stamina_panel:alpha()
--		alpha = alpha + ((1 - alpha) / 3)
		alpha = alpha + 0.035
		alpha = math.clamp(alpha,0,1)
		stamina_panel:set_alpha(alpha)
	else --fadeout
		stamina_panel:stop()
		stamina_panel:animate(animate_fadeout_stamina)
	end

end

--these functions use "old posthooks" because they can set vanilla panels to visible/hidden
local orig_set_cable_tie = HUDTeammate.set_cable_tie
function HUDTeammate:set_cable_tie(data,...)
	if (self._main_player and not KineticHUD:HUD_Enabled_Player()) or not (self._main_player or KineticHUD:HUD_Enabled_Team()) then 
		return orig_set_cable_tie(self,data,...)
	else
		local cable_ties_panel = self._khud_ties_panel
		local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)
		local cable_ties_icon = cable_ties_panel:child("ties_icon")
		local icon_color = amount == 0 and Color(0.5, 1, 1, 1) or Color.white
		
		cable_ties_panel:set_visible(true)
--		cable_ties_panel:child("ties_bg"):set_visible(true)
		cable_ties_icon:set_color(icon_color)		
		cable_ties_icon:set_image(icon, unpack(texture_rect))
		cable_ties_icon:set_visible(true)
		self:set_cable_ties_amount(data.amount)

		return nil --why tho
	end
end

local orig_set_cable_ties_amount = HUDTeammate.set_cable_ties_amount
function HUDTeammate:set_cable_ties_amount(amount,...)
	if (self._main_player and not KineticHUD:HUD_Enabled_Player()) or not (self._main_player or KineticHUD:HUD_Enabled_Team()) then 
		return orig_set_cable_ties_amount(self,amount,...)
	else
		local amount_color = amount == 0 and Color(1, 0.9, 0.3, 0.3) or Color.white
		local cable_ties_panel = self._khud_ties_panel
		local cable_ties_amount = cable_ties_panel:child("ties_amount")

		if amount == -1 then
			cable_ties_amount:set_text("--") --?????
		else
			cable_ties_amount:set_text(amount) --don't want extraneous zeros clogging up my hud >:(
		end

		cable_ties_amount:set_color(amount_color)
		cable_ties_amount:set_visible(true)
	end
end


local orig_add_eq = HUDTeammate.add_special_equipment
function HUDTeammate:add_special_equipment(data,...)
	if (self._main_player and not KineticHUD:HUD_Enabled_Player()) or not (self._main_player or KineticHUD:HUD_Enabled_Team()) then 
		return orig_add_eq(self,data,...)
	else
		local special_equipment = self._special_equipment
		local id = data.id
		local parent_panel = self._khud_equipment_panel
		local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)
		
		local icon_size = self._main_player and 32 or 24
		
		local equipment_panel = parent_panel:panel({
			name = id,
			layer = 1,
			alpha = self._main_player and 0 or 1,
	--			x = 32,
			y = 0,
			w = icon_size,
			h = icon_size
		})
		local icon = equipment_panel:bitmap({
			name = "icon",
			layer = 1,
			color = Color.white,
			texture = icon,
			texture_rect = texture_rect,
			w = icon_size,
			h = icon_size
		})
		
		local debug_bg = equipment_panel:rect({
			name = "debug_bg",
			layer = 0,
			color = Color.green:with_alpha(0.3),
			visible = debug_panels_visible
		})
		
		local w = equipment_panel:w()
		
		local num_equips = #special_equipment
		
		table.insert(special_equipment, equipment_panel)

		local amount, amount_bg = nil

		if data.amount then
			amount_bg = equipment_panel:child("amount_bg") or equipment_panel:bitmap({
				texture = "guis/textures/pd2/equip_count",
				name = "amount_bg",
				rotation = 360,
				layer = 2,
				color = Color.white
			})
			amount = equipment_panel:child("amount") or equipment_panel:text({
				name = "amount",
				vertical = "center",
				font_size = 12,
				align = "center",
				font = "fonts/font_small_noshadow_mf",
				rotation = 360,
				layer = 3,
				text = tostring(data.amount),
				color = Color.black,
				w = equipment_panel:w(),
				h = equipment_panel:h()
			})

			amount_bg:set_center(icon:center())
			amount_bg:move(7, 7)
			amount_bg:set_visible(data.amount > 1)
			amount:set_center(amount_bg:center())
			amount:set_visible(data.amount > 1)
		end
	end
	if not self._main_player then 
		self:layout_special_equipments()
--		equipment_panel:set_x(0 + ((pad_small + w) * (num_equips + 0)))
--		equipment_panel:set_x(parent_panel:w() - ((pad_small + w) * (num_equips + 1))) --align from right
	end	
		--removed flash, cause i don't need it
--		return orig_add_eq(self,data)
end

local orig_set_eq_amount = HUDTeammate.set_special_equipment_amount
function HUDTeammate:set_special_equipment_amount(equipment_id, amount,...)
	if (self._main_player and not KineticHUD:HUD_Enabled_Player()) or not (self._main_player or KineticHUD:HUD_Enabled_Team()) then 
		return orig_set_eq_amount(self,equipment_id,amount,...)
	else
		local teammate_panel = self._panel
		local special_equipment = self._special_equipment
		for i, panel in ipairs(special_equipment) do
			if panel:name() == equipment_id then
				panel:child("amount"):set_text(tostring(amount))
				panel:child("amount"):set_visible(amount > 1)
				panel:child("amount_bg"):set_visible(amount > 1)

				return
			end
		end
	end
end

local orig_remove_eq = HUDTeammate.remove_special_equipment
function HUDTeammate:remove_special_equipment(equipment,...)
	if (self._main_player and not KineticHUD:HUD_Enabled_Player()) or not (self._main_player or KineticHUD:HUD_Enabled_Team()) then 
		return orig_remove_eq(self,equipment,...)
	else
		local parent_panel = self._khud_equipment_panel
		local special_equipment = self._special_equipment

		for i, panel in ipairs(special_equipment) do
			if panel:name() == equipment then
				local data = table.remove(special_equipment, i)
				parent_panel:remove(panel)
				--todo sort equipments by layout and animate() instead of hudmanager:update()
				if not self._main_player then 
					self:layout_special_equipments()
				end
				return
			end
		end
	end
end

local orig_layout_equips = HUDTeammate.layout_special_equipments
function HUDTeammate:layout_special_equipments(...)
	if (self._main_player and not KineticHUD:HUD_Enabled_Player()) or not (self._main_player or KineticHUD:HUD_Enabled_Team()) then 
		return orig_layout_equips(self,...)
	else
		local special_equipment = self._special_equipment
		local parent_panel = self._khud_equipment_panel
		local w = 32
		for i, panel in ipairs(special_equipment) do
			w = panel:w()
			panel:set_x(parent_panel:w() - ((pad_small + w) * i)) --align from right
--			panel:set_y(0)
		end
	end
end

Hooks:PostHook(HUDTeammate,"set_state","khud_set_state",function(self,state)
	local visible_team = KineticHUD:HUD_Enabled_Team()
	
	local teammate_panel = self._panel
	local is_player = state == "player"
	local name = teammate_panel:child("name")
	local name_bg = teammate_panel:child("name_bg")
	local callsign_bg = teammate_panel:child("callsign_bg")
	local callsign = teammate_panel:child("callsign")
	self:set_condition("mugshot_normal","KHUD_DEBUG")
		
	if not self._main_player then 
		self._khud_weapons_panel:hide()
		name:set_visible(not visible_team)
		name_bg:set_visible(not visible_team)
		callsign:set_visible(not visible_team)
		callsign_bg:set_visible(not visible_team)
	end
	
	if is_player then
		local visible_player = KineticHUD:HUD_Enabled_Player()
		self._player_panel:set_visible(not visible_player)
		self._khud_player:set_visible(visible_player)
		self._khud_downcounter_panel:show()
		self._khud_deployables_panel:show()
		self._khud_grenades_panel:show()
		self._khud_ties_panel:show()
	else
		if visible_team then 
			self._player_panel:hide()
		else
			self._khud_player:hide()
		end
		self._khud_player:set_visible(visible_team)
		self._player_panel:set_visible(not visible_team)
		self._khud_downcounter_panel:hide()
		self._khud_deployables_panel:hide()
		self._khud_grenades_panel:hide()
		self._khud_ties_panel:hide()
	end
	
end)

Hooks:PostHook(HUDTeammate,"set_callsign","khud_set_teammate_color",function(self,id)
	local color = KineticHUD.chat_colors_dark[id] or tweak_data.chat_colors[#tweak_data.chat_colors]
	
	self._khud_player:child("name"):set_color(tweak_data.chat_colors[id] or color)
	self._khud_health_panel:child("bar_hp"):set_color(color)
	self._khud_condition:child("condition_diamond"):set_color(color)
	self._khud_health_panel:child("hp_text"):set_color(tweak_data.chat_colors[id])
end)

local orig_set_condition = HUDTeammate.set_condition
function HUDTeammate:set_condition(icon_data,text,...)
	if self._main_player and not KineticHUD:HUD_Enabled_Player() then 
		return orig_set_condition(self,icon_data,text,...)
	elseif not (self._main_player or KineticHUD:HUD_Enabled_Team()) then 
		return orig_set_condition(self,icon_data,text,...)
	end
	local icon,texture_rect
	local condition = self._khud_condition
	local condition_icon = condition:child("condition_icon")
	local condition_diamond = condition:child("condition_diamond")
	local peer_id = self._peer_id
	local mask_id
	local character = managers.criminals:character_name_by_panel_id(self._id)
	if (icon_data == "mugshot_normal") or (icon_data == "ai") then
		if self._main_player then 
			local equipped_mask = managers.blackmarket:equipped_mask()
			mask_id = equipped_mask and equipped_mask.mask_id
			peer_id = peer_id or managers.network and managers.network:session() and managers.network:session():local_peer():id()
			condition_diamond:set_color(KineticHUD.chat_colors_dark[peer_id or 1])
		elseif peer_id then
			local peer = managers.network:session():peer(peer_id)
			if peer then 
				mask_id = peer:mask_id()
			end
			condition_diamond:set_color(KineticHUD.chat_colors_dark[peer_id or 5])
		else

			character = Global.team_ai and Global.team_ai[self._id] --this uses your ai henchmen settings i believe

--			KineticHUD:c_log(self._id,character)
--			managers.criminals:get_team_ai_character(self._id)
 --i spent literally three hours trying to add masks for ai in teammate panels and generated over 3MB of plaintext logs debugging this.
 --all because this stupid function doesn't do what i thought it would
 --AND IT STILL DOES NOT.

			--todo get mask by AI character (henchman settings)
			--todo create option "show mask icon for teammate AI"
			--todo show perkdeck icon instead of mask?
			
			mask_id = "optimist_prime"
			condition_diamond:set_color(KineticHUD.chat_colors_dark[5])
		end
		
		if (not mask_id) or mask_id == "character_locked" then
			mask_id = managers.blackmarket:get_real_mask_id("character_locked",nil,character)
		end

		icon = managers.blackmarket:get_mask_icon(mask_id)
		condition_icon:set_image(icon)
	else
		icon, texture_rect = tweak_data.hud_icons:get_icon_data(icon_data)
		condition_icon:set_image(icon, texture_rect[1], texture_rect[2], texture_rect[3], texture_rect[4])
	end
end

Hooks:PostHook(HUDTeammate,"set_health","khud_set_health",function(self,data)
	local hp_r = data.current / data.total
	local revives = data.revives
	local health_panel = self._khud_health_panel
	if not health_panel then 
		return 
	end

	health_panel:child("bar_hp"):set_w(hp_r * health_panel:child("bar_hp_bg_panel"):w())
	if revives then 
		self._khud_downcounter_panel:child("text_revives"):set_text(tostring(revives))
	end
	health_panel:child("hp_text"):set_text(tostring(math.ceil(data.current * 10)) .. " / " .. tostring(math.ceil(data.total * 10)))	
end)

Hooks:PostHook(HUDTeammate,"set_armor","khud_set_armor",function(self,data)
	local health_panel = self._khud_health_panel
	if not health_panel then 
		return
	end
	local current = data.current
	local total = data.total
	local ratio = current / total
	local max_w = 1
	local text = ""
	local condition_panel = self._khud_condition

	if total > 0 then 
		health_panel:child("bar_arm"):set_visible(true)
		health_panel:child("bar_arm_bg_panel"):set_visible(true)
--			health_panel:child("arm_text"):set_visible(true)
		
		health_panel:child("arm_floating_outline_panel"):set_visible(true)
	else
		return
	end

	max_w = health_panel:child("bar_arm_bg_panel"):w()

	if current <= 0 then 
		condition_panel:child("condition_diamond_bg"):set_color(Color.black:with_alpha(0.3))
	else
		condition_panel:child("condition_diamond_bg"):set_color(Color.white)
	end
	
	text = tostring(math.ceil(current * 10)) .. " / " .. tostring(math.ceil(total * 10))
	
	health_panel:child("bar_arm"):set_w(ratio * max_w)
	health_panel:child("arm_text"):set_text(text)

end)

Hooks:PostHook(HUDTeammate,"update_delayed_damage","khud_update_stoic_bar",function(self)
--	if self._main_player then 
		local damage = self._delayed_damage or 0

		local health_panel = self._khud_health_panel
		local hp_bar = health_panel:child("bar_hp")
		local hp_bg = health_panel:child("bar_hp_bg_panel")
		local arm_bar = health_panel:child("bar_arm")
		local arm_bg = health_panel:child("bar_arm_bg_panel")
		local stoic_arm = health_panel:child("arm_stoic_damage")
		local stoic_hp = health_panel:child("hp_stoic_damage")

		local armor_max = self._armor_data.total
		local armor_current = self._armor_data.current
		
		local health_max = self._health_data.total
		local health_current = self._health_data.current
		
		
		local armor_damage = math.min(damage,armor_current)
		local health_damage = damage - armor_current
		
			
		local hp_max_w = hp_bg:w()
		local arm_max_w = arm_bg:w()
			
		local stoic_arm_dmg = (armor_damage / armor_current) * arm_max_w
		local stoic_hp_dmg = (health_damage / health_current) * hp_max_w
		
		
		stoic_arm:set_visible(armor_damage > 0)
		stoic_arm:set_x( arm_bar:x() + arm_bar:w() + - stoic_arm_dmg)
		stoic_arm:set_w( stoic_arm_dmg )
		
		stoic_hp:set_visible(health_damage > 0)
		stoic_hp:set_x( hp_bar:x() + hp_bar:w() + - stoic_hp_dmg)
		stoic_hp:set_w( stoic_hp_dmg )

		--todo animate flash when delayed damage is more than current hp
--	end
end)

Hooks:PostHook(HUDTeammate,"set_stored_health_max","khud_set_stored_health_max",function(self,stored_health_ratio)
--	if self._main_player then 
		local health_panel = self._khud_health_panel
		local stored_hp_bar_bg = health_panel:child("bar_stored_hp_bg")
		stored_hp_bar_bg:set_visible(stored_health_ratio > 0)
		local hp_bg = health_panel:child("bar_hp_bg_panel")
		local stored_hp_max = stored_health_ratio * hp_bg:w()
		stored_hp_bar_bg:set_w(stored_hp_max)
		stored_hp_bar_bg:set_x(hp_bg:x() + hp_bg:w() + - stored_hp_max)
--	end
end)

Hooks:PostHook(HUDTeammate,"set_stored_health","khud_set_stored_health",function(self,stored_health_ratio)
--	if self._main_player then 
		local health_panel = self._khud_health_panel
		local hp_bg = health_panel:child("bar_hp_bg_panel")
		local stored_hp_bar = health_panel:child("bar_stored_hp")
		local hp_max_w = hp_bg:w()
		stored_hp_bar:set_visible(stored_health_ratio > 0)
		
		local stored_hp = stored_health_ratio * hp_max_w
		stored_hp_bar:set_x(hp_bg:x() + (hp_bg:w() + - stored_hp))
		stored_hp_bar:set_w(stored_hp)
--	end
end)

Hooks:PostHook(HUDTeammate,"set_absorb_active","khud_set_absorb",function(self,absorb_amount)
--	if self._main_player then  --this one is damage dealt
		--add to buff instead?
		local absorb_panel = self._khud_health_panel:child("bar_absorb_panel")
		local absorb_active = absorb_panel:child("bar_absorb_active_rect")
		local absorb_stacks = absorb_panel:child("bar_absorb_rect")
		local absorb_label = absorb_panel:child("absorb_label")
--		absorb_panel:set_visible(absorb_amount > 0) 
--		absorb_label:set_text(tostring(absorb_amount * 100))
		if absorb_amount > 0 then
			managers.player:add_buff("hysteria",{value = math.floor(absorb_amount * 100)})
		else 
			managers.player:remove_buff("hysteria")
		end
--		absorb_panel_active:set_w(absorb_amount
--	end
end)

Hooks:PostHook(HUDTeammate,"set_deployable_equipment","khud_set_deployable_equipment",function(self,data) 
	self:set_khud_deployable_equipment(data)
end)

function HUDTeammate:set_khud_deployable_equipment(data)
	local index = data.index or managers.player._equipment.selected_index or 1--added data.index
	local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)
	local deployable_equipment_panel = self._khud_deployables_panel:child(index == 2 and "secondary_deployable" or "primary_deployable")	
	local equipment = deployable_equipment_panel:child("icon")
	local amount = deployable_equipment_panel:child("amount")


	local color = Color.white
	if data.amount then 
		if type(data.amount) == "table" then
			color = Color(0.5,1,1,1)
			for k,v in pairs(data.amount) do
				if v ~= 0 then 
					color = Color.white
					break
				end
			end
		elseif (data.amount == 0) then 
			color = Color(0.5,1,1,1) --redundant
		end
	end
	
	equipment:set_color(color)
	equipment:set_image(icon, unpack(texture_rect))
	deployable_equipment_panel:set_visible(true)
--		amount:set_visible(true)
	
--	self:set_deployable_equipment_amount(index, data)		
end

--[[
local orig_set_deployable_equipment = HUDTeammate.set_deployable_equipment
function HUDTeammate:set_deployable_equipment(data) --overridden :(
	if self._main_player then 

		local index = data.index or managers.player._equipment.selected_index or 1--added data.index
		local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)
		local deployable_equipment_panel = self._khud_deployables_panel:child(index == 2 and "secondary_deployable" or "primary_deployable")	
		local equipment = deployable_equipment_panel:child("icon")
		local amount = deployable_equipment_panel:child("amount")

		local color = data.amount == 0 and Color(0.5, 1, 1, 1) or Color.white
		
		equipment:set_color(color)
		equipment:set_image(icon, unpack(texture_rect))
		deployable_equipment_panel:set_visible(true)
--		amount:set_visible(true)
		
		self:set_deployable_equipment_amount(index, data)--
	else
		return orig_set_deployable_equipment(self,data)
	end
end--]]

Hooks:PostHook(HUDTeammate,"set_deployable_equipment_amount","khud_set_deployable_equipment_amount",function(self,index,data)
	self:set_khud_deployable_equipment_amount(managers.player._equipment.selected_index,data)
	--ignore passed index value for reasons detailed below
end)

Hooks:PostHook(HUDTeammate,"set_deployable_equipment_from_string","khud_set_deployable_from_string",function(self,data)
	local index = data.index or managers.player._equipment.selected_index or 1
--		KineticHUD:c_log("set_deployable_equipment_from_string",KineticHUD:concat(data))
	local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)
	local deployable_equipment_panel = self._khud_deployables_panel:child(index == 2 and "secondary_deployable" or "primary_deployable")
	local equipment = deployable_equipment_panel:child("icon")--deployable_equipment_panel:child("equipment")

	equipment:set_visible(true)
	equipment:set_image(icon, unpack(texture_rect))
end)

Hooks:PostHook(HUDTeammate,"set_deployable_equipment_amount_from_string","khud_set_deployable_amount_from_string",function(self,index,data)
	self:set_khud_deployable_equipment_amount_secondary(managers.player._equipment.selected_index,data)
end)

--replacement was warranted instead of a posthook for the following two functions, 
--due to the fact that ovk calls 
--	self:set_deployable_equipment_amount(1, data)
--and
--	self:set_deployable_equipment_amount_from_string(1, data)
--thus forcing the index to 1 and causing display errors within khud
function HUDTeammate:set_khud_deployable_equipment_amount(index,data)  --counterpart for set_deployable_equipment_amount()
	index = index or managers.player._equipment.selected_index
	local deployable_equipment_panel = self._khud_deployables_panel:child(index == 2 and "secondary_deployable" or "primary_deployable")
	local amount = deployable_equipment_panel:child("amount")
	local icon_color = data.amount == 0 and Color(0.5, 1, 1, 1) or Color.white
	local text_color = data.amount == 0 and Color(1, 0.9, 0.3, 0.3) or Color.white

	deployable_equipment_panel:child("icon"):set_color(icon_color)
	deployable_equipment_panel:child("icon"):set_visible(true)
	amount:set_text(data.amount)
	amount:set_color(text_color)
	amount:set_visible(true)	
	
	--[[

	local deployable_equipment_panel = self._khud_deployables_panel:child(index == 2 and "secondary_deployable" or "primary_deployable")
	local amount_panel = deployable_equipment_panel:child("amount")
	local icon_panel = deployable_equipment_panel:child("icon")
	
	local color = Color.white
	if data.amount == 0 then 
		color = Color(0.5,1,1,1)
	end
	
	icon_panel:set_color(color)
	icon_panel:set_visible(true)
	
	self:_set_amount_string(amount,data.amount)
	amount_panel:set_visible(true)
	--]]
end	
	
	--[[
	local amount_string = tostring(data.amount)
	if data.amount_2 then 
		amount_string = amount_string .. " | " .. tostring(data.amount_2)
		if data.amount_2 == 0 then 
			color = Color(0.5,1,1,1)
		end
	elseif data.amount == 0 then 
		color = Color(0.5,1,1,1)
	end
	amount_panel:set_color(color)
	
	amount_panel:set_text(amount_string)

	icon_panel:set_color(color)
	icon_panel:set_visible(true)
	--]]

function HUDTeammate:set_khud_deployable_equipment_amount_secondary(index,data) --counterpart for set_deployable_equipment_amount_from_string() 
	index = index or managers.player._equipment.selected_index
--		local teammate_panel = self._panel:child("player")
	local deployable_equipment_panel = self._khud_deployables_panel:child(index == 2 and "secondary_deployable" or "primary_deployable")
	local icon = deployable_equipment_panel:child("icon")
	local amount = deployable_equipment_panel:child("amount")
	local amounts = ""
	local color = Color(0.5, 1, 1, 1)

	for i, amount in ipairs(data.amount) do
		local amount_str = string.format("%01d", amount)

		if i > 1 then
			amounts = amounts .. "|"
		end

		amounts = amounts .. amount_str

		if amount > 0 then
			color = Color.white
		end
	end

	icon:set_color(color)
	icon:set_visible(true)
	amount:set_text(amounts)
	amount:set_color(color)
	amount:set_visible(true)
--[[	
	
	local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)
	local equipment = self._khud_deployables_panel:child(index == 2 and "secondary_deployable" or "primary_deployable")

	equipment:set_visible(true)
	equipment:set_image(icon,unpack(texture_rect))
	self:set_khud_deployable_equipment_amount(index,data)
--]]
end

function HUDTeammate:_set_secondary_deployable(data) --custom function. deprecated. i think
	KineticHUD:c_log("Set_secondary_deployable called from hudteammate- this is a deprecated function!")
end

function HUDTeammate:_set_deployable_equipment_with_index(data) --custom function; unused
	KineticHUD:c_log(data,"Set eq with index- this is a deprecated function!")
	local index = data.index or 1
	local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)

	local deployable_equipment_panel = self._khud_deployables_panel:child("primary_deployable")
	if index == 2 then 
		deployable_equipment_panel = self._khud_deployables_panel:child("secondary_deployable")	
	end
	
	local equipment = deployable_equipment_panel:child("icon")
	local amount = deployable_equipment_panel:child("amount")

	local color = data.amount == 0 and Color(0.5, 1, 1, 1) or Color.white
	
	equipment:set_color(color)
	equipment:set_image(icon, unpack(texture_rect))
	equipment:set_visible(true)
	deployable_equipment_panel:set_visible(true)
	
		
	self:set_deployable_equipment_amount(index, data)
end


local orig_animate_absorb = HUDTeammate._animate_update_absorb
function HUDTeammate:_animate_update_absorb(o, radial_absorb_shield_name, radial_absorb_health_name, var_name, blink,...)
	if (self._main_player and not KineticHUD:HUD_Enabled_Player()) or not (self._main_player or KineticHUD:HUD_Enabled_Team()) then 
		return orig_animate_absorb(self,o, radial_absorb_shield_name, radial_absorb_health_name, var_name, blink,...)
	end
--todo clean this up a bit
	repeat
		coroutine.yield()
	until alive(self._panel) and self[var_name] and self._armor_data and self._health_data
	
	local absorb_panel = self._khud_health_panel:child("bar_absorb_panel")
	local absorb_active = absorb_panel:child("bar_absorb_active_rect")
	local absorb_stacks = absorb_panel:child("bar_absorb_rect")
	local absorb_label = absorb_panel:child("absorb_label")
	local ab1 = absorb_panel:child("ab1")
	local ab2 = absorb_panel:child("ab2")

	local teammate_panel = self._panel:child("player")
	local radial_health_panel = self._radial_health_panel
	local radial_shield = radial_health_panel:child("radial_shield")
	local radial_health = radial_health_panel:child("radial_health")
	local radial_absorb_shield = radial_health_panel:child(radial_absorb_shield_name)
	local radial_absorb_health = radial_health_panel:child(radial_absorb_health_name)
	local radial_shield_rot = radial_shield:color().r
	local radial_health_rot = radial_health:color().r

	radial_absorb_shield:set_rotation((1 - radial_shield_rot) * 360)
	radial_absorb_health:set_rotation((1 - radial_health_rot) * 360)

	local current_absorb = 0
	local current_shield, current_health = nil
	local step_speed = 1
	local lerp_speed = 1
	local dt, update_absorb = nil
	local t = 0

	while alive(teammate_panel) do
		dt = coroutine.yield()

		if self[var_name] and self._armor_data and self._health_data then
			update_absorb = false
			current_shield = self._armor_data.current
			current_health = self._health_data.current

			if radial_shield:color().r ~= radial_shield_rot or radial_health:color().r ~= radial_health_rot then
				radial_shield_rot = radial_shield:color().r
				radial_health_rot = radial_health:color().r

				radial_absorb_shield:set_rotation((1 - radial_shield_rot) * 360)
				radial_absorb_health:set_rotation((1 - radial_health_rot) * 360)

				update_absorb = true
			end

			if current_absorb ~= self[var_name] then
				current_absorb = math.lerp(current_absorb, self[var_name], lerp_speed * dt)
				current_absorb = math.step(current_absorb, self[var_name], step_speed * dt)
				update_absorb = true
			end

			if blink then
				t = (t + dt * 0.5) % 1

				radial_absorb_shield:set_alpha(math.abs(math.sin(t * 180)) * 0.25 + 0.75)
				radial_absorb_health:set_alpha(math.abs(math.sin(t * 180)) * 0.25 + 0.75)
			end

			if update_absorb and current_absorb > 0 then
				
				
				local shield_ratio = current_shield == 0 and 0 or math.min(current_absorb / current_shield, 1)
				local health_ratio = current_health == 0 and 0 or math.min((current_absorb - shield_ratio * current_shield) / current_health, 1)
				local shield = math.clamp(shield_ratio * radial_shield_rot, 0, 1)
				local health = math.clamp(health_ratio * radial_health_rot, 0, 1)

				radial_absorb_shield:set_color(Color(1, shield, 1, 1))
				radial_absorb_health:set_color(Color(1, health, 1, 1))
				radial_absorb_shield:set_visible(shield > 0)
				radial_absorb_health:set_visible(health > 0)
				
				--offy wuz hear
				absorb_active:set_w(shield * absorb_panel:w())
--				absorb_label:set_text("abs " .. tostring(math.floor(current_absorb*100)))
--				ab1:set_text("hp " .. health)--tostring(math.floor(health*100)))
--				ab2:set_text("arm " .. tostring(math.floor(shield*100)))
			end
		end
	end
end

Hooks:PostHook(HUDTeammate,"set_grenade_cooldown","khud_set_grenade_cooldown",function(self,data)
--sicario uses this instead of activate_ability
--also, this is called once at the start on use for things like stoic
	if self._main_player then
		if not PlayerBase.USE_GRENADES then
			return
		end

		local end_time = data and data.end_time
		local duration = data and data.duration	
		
		if not (end_time and duration) then 
			return
		end

		local complete_duration = 0.75
		local complete_time = end_time + complete_duration
		
		
		local grenades_panel = self._khud_grenades_panel:child("grenades_bg")
		local grenades_border = grenades_panel:child("panel_borders")
		local grenades_recharge = grenades_panel:child("grenades_recharge")
		grenades_recharge:set_visible(true)
				
		local max_w = grenades_panel:w()
		local max_h = grenades_panel:h()
		
		local function animate_recharge(o)
			repeat
				local now = managers.game_play_central:get_heist_timer()
				local time_left = end_time - now
				local progress = time_left / duration
				
	--			local streak = math.tan(now * -250)
	--			local streak_color = Color.red:with_alpha(streak > 1 and (0.5 * (1 - math.sin((now - 2) * -500))) or 1)
	--			local streak_color = Color.red:with_alpha(streak > 1 and (math.sin(now) + 0.5) or 0) 
	--			math.clamp(streak,0,1)
	--			local streak = math.clamp(math.tan(now * 100),0,1)
					
	--			local here = 1 + (progress - math.sin((100 * now) % 60))
				local here = 1 - (math.sin((60 * now) % 60) * (1 - progress))
							
				
				o:set_gradient_points({
					0,
					Color.black,
					here,
					Color.red,
					progress + 0.01,
					Color.white,
					progress,
					Color.black,
					1,
					Color.black
				})
				
	--			o:set_w(grenades_panel:w() * progress)
				
				coroutine.yield()
			until time_left <= 0
			grenades_recharge:set_visible(false)

			repeat
				local nao = managers.game_play_central:get_heist_timer()
				local thyme_left = complete_time - nao
				local pawgress = thyme_left / complete_duration

				panel_border(grenades_border,{
					thickness = 2,
					alpha = 0.7,
					layer = 3,
					margin = thyme_left * max_w
				})
			
				coroutine.yield()
			until thyme_left <= 0
		end
						
		panel_border(grenades_border,{
			thickness = 2,
			alpha = 0.7,
			layer = 3,
			margin = 0
		})
		grenades_recharge:stop()
		grenades_recharge:animate(animate_recharge)
	end
end)

Hooks:PostHook(HUDTeammate,"activate_ability_radial","khud_activate_ability_radial",function(self,time_left,time_total)
--on activation i guess
--todo some effect for this
	if self._main_player then
		local grenades_panel = self._khud_grenades_panel
		local grenades_recharge = grenades_panel:child("grenades_bg"):child("grenades_recharge")		
		local grenades_amount = grenades_panel:child("grenades_amount")	
		
		if time_total then 
			local progress = time_left / time_total

			local here = 1 - (math.sin((60 * Application:time()) % 60) * (1 - progress))
			
			grenades_recharge:set_gradient_points({
				0,
				Color.black,
				here,
				Color.red,
				progress + 0.01,
				Color.white,
				progress,
				Color.black,
				1,
				Color.black
			})	
		elseif time_left then
--			local ability = managers.player:get_specialization_ability()
			local ability = managers.blackmarket:equipped_grenade()
			if ability then 
				managers.player:add_buff(ability,{duration = time_left})
			end
		end
	end
end)

Hooks:PostHook(HUDTeammate,"set_ability_radial","khud_set_ability_radial",function(self,data)
--used for abilities' cooldowns (kingpin, stoic, tag team, hacker)
	if self._main_player then
		local current = data.current
		local total = data.total
		local progress = current / total	

		local grenades_panel = self._khud_grenades_panel
		local grenades_recharge = grenades_panel:child("grenades_bg"):child("grenades_recharge")		
		
		local here = 1 - (math.sin((60 * Application:time()) % 60) * (1 - progress))
		
		grenades_recharge:set_gradient_points({
			0,
			Color.black,
			here,
			Color.red,
			progress + 0.01,
			Color.white,
			progress,
			Color.black,
			1,
			Color.black
		})

--		grenades_recharge:set_h(grenades_panel:h() * progress)
--		grenades_recharge:set_alpha(progress)
	end
	--todo
end)

Hooks:PostHook(HUDTeammate,"set_grenades","khud_set_grenades",function(self,data)
	if PlayerBase.USE_GRENADES then
		local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon, {
			0,
			0,
			32,
			32
		})
		local grenades_panel = self._khud_grenades_panel
		local grenades_icon = grenades_panel:child("grenades_icon")

		grenades_icon:set_visible(true)
		grenades_icon:set_image(icon, unpack(texture_rect))
	end
end)

Hooks:PostHook(HUDTeammate,"set_grenades_amount","khud_set_grenades_amount",function(self,data)
	if PlayerBase.USE_GRENADES then
		local grenades_panel = self._khud_grenades_panel
		local amount = grenades_panel:child("grenades_amount")
		local icon = grenades_panel:child("grenades_icon")
		local color = data.amount == 0 and Color(0.5, 1, 1, 1) or Color.white

		icon:set_color(color)
		amount:set_text(data.amount)
		amount:set_color(data.amount == 0 and Color(1, 0.9, 0.3, 0.3) or Color.white)
	end
end)

Hooks:PostHook(HUDTeammate,"set_ammo_amount_by_type","khud_set_ammo_amount_by_type",function(self,...)
--,type,max_clip,current_clip,current_left,max,weapon_panel,
	if KineticHUD:UseWeaponRealAmmo() then 
		self:_khud_set_ammo_by_type_real(...) --too lazy to rewrite all those arguments again
	else
		self:_khud_set_ammo_by_type_default(...) --not too lazy to complain about it though
	end
end)

function HUDTeammate:_khud_set_ammo_by_type_default(type,max_clip,current_clip,current_left,max,weapon_panel)
	local weapon_panel = (type == "primary" and self._primary_weapon_panel) or (type == "secondary" and self._secondary_weapon_panel)
	weapon_panel:set_visible(self._main_player)
		
	local low_ammo = current_left <= math.round(max_clip / 2)
	local low_ammo_clip = current_clip <= math.round(max_clip / 4)
	local out_of_ammo_clip = current_clip <= 0
	local out_of_ammo = current_left <= 0
	local color_total = out_of_ammo and Color(1, 0.9, 0.3, 0.3)
	color_total = color_total or low_ammo and Color(1, 0.9, 0.9, 0.3)
	color_total = color_total or Color.white
	local color_clip = out_of_ammo_clip and Color(1, 0.9, 0.3, 0.3)
	color_clip = color_clip or low_ammo_clip and Color(1, 0.9, 0.9, 0.3)
	color_clip = color_clip or Color.white
	local ammo_clip = weapon_panel:child("mag_text")

	ammo_clip:set_text(tostring(current_clip))
	ammo_clip:set_color(color_clip)
--		ammo_clip:set_font_size(string.len(current_clip) < 4 and 32 or 24)

	local ammo_total = weapon_panel:child("ammo_text")

	ammo_total:set_text(tostring(current_left))
	ammo_total:set_color(color_total)
--		ammo_total:set_font_size(string.len(current_left) < 4 and 24 or 20)
end

function HUDTeammate:_khud_set_ammo_by_type_real(type,max_clip,current_clip,current_left,max,weapon_panel)
	local weapon_panel = (type == "primary" and self._primary_weapon_panel) or (type == "secondary" and self._secondary_weapon_panel)
	weapon_panel:set_visible(self._main_player)
	
	local total_left = current_left - current_clip
	local col
	if total_left < 0 then
		total_left = current_left
	end
	local ammo_clip = weapon_panel:child("mag_text")
	ammo_clip:set_text(tostring(current_clip))
	if current_clip <= math.round(max_clip / 4) and current_clip ~= 0 then
		col = Color(1, 0.9, 0.9, 0.3)
	elseif current_clip <= 0 then
		col = Color(1, 0.9, 0.3, 0.3)
	else
		col = Color.white
	end
	ammo_clip:set_color(col)
	local ammo_total = weapon_panel:child("ammo_text")
	if total_left <= math.round(max_clip / 2) and total_left ~= 0 then
		col = Color(1, 0.9, 0.9, 0.3)
	elseif total_left <= 0 then
		col = Color(1, 0.9, 0.3, 0.3)
	else
		col = Color.white
	end
	ammo_total:set_text(tostring(total_left))
	ammo_total:set_color(col)
end

--========================--
--CREATE KHUD PANELS--
--========================--

Hooks:PostHook(HUDTeammate,"init","khud_hudteammate_init",function(self,i,teammates_panel,is_player,width)
	local khud_player = managers.hud._khud_panels[i]
	self._khud_player = khud_player

	local margin = self._main_player and 50 or KineticHUD:GetSettings("panel_team_health_margin")
	local name = khud_player:text({
		name = "name",
		text = "RECEIVING DATA...",
		x = khud_player:h(),
		y = i * margin,
		font_size = tweak_data.hud_players.name_size,
		color = tweak_data.chat_colors[i or 5],
		font = tweak_data.hud_players.name_font
	})
	self._khud_name = name
	
	local health = self:_create_khud_health()
	
	local deployables = self:_create_khud_deployables()
	local grenades = self:_create_khud_grenades()

--	local downcounter = self:_create_khud_downcounter()
	local region = self:_create_khud_region()		
--		local converts = self:_create_khud_converts()
	local ties = self:_create_khud_ties()
	local speaking = self:_create_khud_speaking()
		
--	local name = HUDTeammate:_create_khud_name()
	local weapons = self:_create_khud_weapons()		
	if is_player then 
		local primary_firemode = self:_create_khud_primary_firemode()
		local secondary_firemode = self:_create_khud_secondary_firemode()	
		local crosshair = self:_create_khud_crosshair()
		local hostages = self:_create_khud_hostages()
		local buffs = self:_create_khud_buffs()
		local stamina = self:_create_khud_stamina()
		local debug_info = self:_create_khud_debug_info()
		local compass = self:_create_khud_compass()		
		local scanner_left = self:_create_khud_scanner_left()
		local scanner_right = self:_create_khud_scanner_right()
	else
--		weapons = self:_create_khud_team_weapons() --weapons panel is the only significant aesthetic difference between teammates panel and player panel
	end

	local missioneq = self:_create_khud_equipment()
	self:set_condition("mugshot_normal")	
end)

Hooks:PostHook(HUDTeammate,"add_panel","khud_hudteammate_addpanel",function(self,...)
	if self._panel._id == HUDManager.PLAYER_PANEL then 
		if KineticHUD:HUD_Enabled_Player() then 
			self._khud_player:show()
		end
	elseif KineticHUD:HUD_Enabled_Team() then
		self._panel:show()
--		self._khud_ties_panel:show()
	end
end)

Hooks:PostHook(HUDTeammate,"remove_panel","khud_hudteammate_removepanel",function(self,weapons_panel,...)
	local teammate_panel = self._panel
	self._khud_player:hide()
--	KineticHUD:c_log("Hiding player panel #" .. tostring(self._panel._id or ""))
--	self._khud_equipment_panel:hide()
--	self._khud_deployables_panel:hide()
--	self._khud_ties_panel:hide()
--	self._khud_grenades_panel:hide()
--	self._khud_weapons_panel:hide()
--	self._carry_panel:hide()
	--
end)


function HUDTeammate:_layout_khud_name(params)
	local name = self._khud_name or self._khud_player:child("name")
	params = params or {}
	local settings = KineticHUD:GetSettings()
	local health_panel = self._khud_health_panel
	local x = params.x
	local y = params.y
	local fontsize = params.fontsize
	if self._id == HUDManager.PLAYER_PANEL then
		if not KineticHUD:HUD_Enabled_Player() then 
			return
		else
			x = (health_panel:x() + 96) or x or 96
			y = (health_panel:y() - pad_medium) or 500
			fontsize = fontsize or settings.panel_player_name_fontsize or 24
		end
	else
		if not KineticHUD:HUD_Enabled_Team() then
			return
		else
			x = x or (health_panel:x() + 64) or x or settings.panel_team_name_x or 64
			y = y or (health_panel:y() - (name:font_size() * 0.75)) or y or settings.panel_team_name_y or 500
			--todo make this set y thingy work better
			--use text_rect() instead
			fontsize = fontsize or settings.panel_team_name_fontsize or 24
		end
	end
	name:set_font_size(fontsize)
	name:set_x(x)
	name:set_y(y)
end

Hooks:PostHook(HUDTeammate,"set_name","khud_hudteammate_set_name",function(self,teammate_name)
	local id = self._id or 5
	 
	 
	--local name = self._khud_name
	local name = managers.hud._khud_panels[id]:child("name")
	name:set_text(teammate_name)

	if true then return end
--this stuff is untested, so i should probably disable it before 1.0 release
	
--	local _,_,name_w,_ = name:text_rect()
	local alotted_space = 500 --todo condition diamond right() at healthbar
	local resize_margin = 1.25 -- % that the name can be resized
	local char_length = string.len(teammate_name)
	local _,_,name_width,_ = name:text_rect()
	for i = 1,char_length do 
		local _,_,name_w,_ = name:text_rect()
		if name_w <= alotted_space then 
			return
		end
		name:set_font_size(tweak_data.hud_players.name_size - i)
	end

	if name_width > (alotted_space * 1.33) then
		--if name is too large than can be comfortably resized, simply truncate the name
		for i = 1,char_length do 
			name:set_text(string.sub(teammate_name,1,-i))
			local _,_,name_w,_ = name:text_rect()
			if name_w <= alotted_space then 
				return
			end
		end
	end
end)

function HUDTeammate:_create_khud_health()
	local hud_panel = self._khud_player
	
	local health_w = self._main_player and 420 or 200
	local health_h = 64
	
	local health_x = 0
	local health_y = hud_panel:h() - (health_h + 96)
	
	local bar_max_w = 300
	if not self._main_player then 
		bar_max_w = 100
	end
	
	local bar_outline_margin = 3 --for hp/arm bar floating outline
	
----------------INIT
	local khud_health_panel = hud_panel:panel({
		name = "khud_health_panel",
		layer = 1,
		x = health_x,
		y = health_y,
		w = health_w,
		h = health_h
	})
----------------DOWN COUNTER
	local revives_diamond_size = 32
	local downs_fontsize = 24
	local downs_panel = khud_health_panel:panel({
		name = "downs_panel",
		x = 0,
		y = health_h - downs_fontsize,
		w = revives_diamond_size,
		h = revives_diamond_size
	})
	local text_revives = downs_panel:text({
		name = "text_revives",
		layer = 3,
		vertical = "center",
		align = "center",
		font_size = downs_fontsize,
		color = Color.white,
		font = font_medium_shadow_mf,
		text = "4"
	})
	
	local icon_revives = downs_panel:bitmap({
		name = "icon_revives",
		layer = 1,
		rotation = 45,
		texture = pixel_texture,
		color = Color.red,
		texture_rect = pixel_rect,
		w = revives_diamond_size / 2,
		h = revives_diamond_size / 2
	})
	icon_revives:set_center(downs_panel:w() / 2,downs_panel:h() / 2)
	
	self._khud_downcounter_panel = downs_panel
	
----------------CONDITION	
	local diamond_size = 48
	local diamond_margin = 2 --width of diamond outline
	local condition_x = 10
	local condition_y = (khud_health_panel:h() + diamond_size ) / 2
	local condition_panel = khud_health_panel:panel({
		name = "condition_panel",
		layer = 1,
		x = condition_x,
		y = 10,
		w = health_w,
		h = health_h --don't cut off the condition_icon if users want a diamond that takes up half the screen for some reason
	})
	local condition_diamond_bg = condition_panel:bitmap({
		name = "condition_diamond_bg",
		layer = 2,
		rotation = 45,
		texture = pixel_texture,
		color = Color.white,
		texture_rect = pixel_rect,
		w = (diamond_size + diamond_margin),
		h = (diamond_size + diamond_margin)
	})
	local condition_diamond = condition_panel:bitmap({
		name = "condition_diamond",
		layer = 3,
		x = diamond_margin / 2,
		y = diamond_margin / 2,
		rotation = 45,
		texture = pixel_texture,
		color = tweak_data.chat_colors[self._peer_id or 5],
		texture_rect = pixel_rect,
		w = diamond_size,
		h = diamond_size
	})
	local condition_icon = condition_panel:bitmap({
		name = "condition_icon",
		layer = 4,
		rotation = 0,
		texture = skill_atlas,
		texture_rect = {6 * 64,1 * 64,64,64},
		color = Color.white,
		w = diamond_size,
		h = diamond_size
	})
	self._khud_condition = condition_panel
	
	local debug_condition = condition_panel:rect({
		name = "debug_condition",
		layer = 1,
		visible = false,
		color = Color.yellow:with_alpha(0.3)
	})
	
----------------HEALTH
	local bar_margin = 4 --vertical distance from center for arm/hp bars
	local hp_bar_w = bar_max_w
	local hp_bar_h = 6
	local hp_bar_x = diamond_size
	local hp_bar_y = (khud_health_panel:h() / 2) + bar_margin-- ((khud_health_panel:h() / 2) - (hp_bar_h / 2))
	local hp_fontsize = 18
	
	local bar_hp = khud_health_panel:rect({
		name = "bar_hp",
		layer = 1,
		x = hp_bar_x,
		y = hp_bar_y,
		w = hp_bar_w,
		h = hp_bar_h,
		color = Color.green
	})
	local bar_hp_bg_panel = khud_health_panel:panel({
		name = "bar_hp_bg_panel",
		x = hp_bar_x,
		y = hp_bar_y,
		w = hp_bar_w,
		h = hp_bar_h
	})
	
	local bar_hp_bg = bar_hp_bg_panel:rect({
		name = "bar_hp_rect",
		layer = 0,
		color = Color.black:with_alpha(0.3)
	})
	
	local inset_hp = panel_border(bar_hp_bg_panel,{
		alpha = 0.3,
		thickness = 2,
		layer = 1
	})
	
	local hp_floating_outline_panel = khud_health_panel:panel({
		name = "hp_floating_outline_panel",
		x = hp_bar_x - (bar_outline_margin / 2),
		y = hp_bar_y - (bar_outline_margin / 2),
		w = hp_bar_w + bar_outline_margin,
		h = hp_bar_h + bar_outline_margin
	})
	
	local hp_floating_outline = panel_border(hp_floating_outline_panel,{
--		id_prefix = "outer_",
		alpha = 0.5,
		thickness = 0.75,
		layer = 1
	})
	
	local hp_text = khud_health_panel:text({
		name = "hp_text",
		layer = 3,
		x = bar_hp_bg_panel:right() + pad_medium,
		y = bar_hp_bg_panel:bottom() - (hp_fontsize / 2),
		font_size = hp_fontsize,
		color = Color.green,
		font = "fonts/font_medium_shadow_mf",
		text = debug_panels_visible and "hphphp" or ""
	})
	
	local hp_gradient = bar_hp_bg_panel:gradient({
		name = "hp_gradient",
		layer = 2,
		blend_mode = "add",
		x = (- bar_hp_bg_panel:h() + bar_hp_bg_panel:w()) / 2, --todo hp_gradient:set_center(x,y)
		y = (bar_hp_bg_panel:h() - bar_hp_bg_panel:w()) / 2,
		w = bar_hp_bg_panel:h(),
		h = bar_hp_bg_panel:w(),
		valign = "grow",
		rotation = 90,
		gradient_points = {
			0,
			Color(0,0,0,0), --argb
			0.66,
			Color(0.3,1,1,1),
			1,
			Color(0.5,1,1,1)
		}
	})	

----------------ARMOR
	local arm_bar_w = bar_max_w
	local arm_bar_h = 6
	local arm_bar_x = diamond_size
	local arm_bar_y = (khud_health_panel:h() / 2) - (bar_margin + arm_bar_h)
	local bar_arm = khud_health_panel:rect({
		name = "bar_arm",
		layer = 1,
		x = arm_bar_x,
		y = arm_bar_y,
		w = arm_bar_w,
		h = arm_bar_h,
		color = Color.white,
		visible = debug_panels_visible --set visible on load
	})

	local bar_arm_bg_panel = khud_health_panel:panel({
		name = "bar_arm_bg_panel",
		x = arm_bar_x,
		y = arm_bar_y,
		w = arm_bar_w,
		h = arm_bar_h,
		visible = debug_panels_visible --set visible on load
	})
	
	local arm_border_inner = panel_border(bar_arm_bg_panel,{
--		id_prefix = "inner_",
		alpha = 0.3,
		thickness = 2,
		layer = 1
	})
	
	local bar_arm_bg = bar_arm_bg_panel:rect({
		name = "bar_arm_rect",
		layer = 0,
		color = Color.black:with_alpha(0.3)
	})
	
	local arm_floating_outline_panel = khud_health_panel:panel({
		name = "arm_floating_outline_panel",
		w = arm_bar_w + bar_outline_margin,
		h = arm_bar_h + bar_outline_margin,
		x = arm_bar_x - (bar_outline_margin / 2),
		y = arm_bar_y - (bar_outline_margin / 2),
		visible = false
	})
	
	local arm_border_outer = panel_border(arm_floating_outline_panel,{
--		id_prefix = "floating_",
		alpha = 0.5,
		thickness = 0.75,
		layer = 1
	})
	
	local arm_text = khud_health_panel:text({
		name = "arm_text",
		layer = 3,
		x = bar_arm_bg_panel:right() + pad_medium,
		y = bar_arm_bg_panel:bottom() - (hp_fontsize / 2),
		font_size = hp_fontsize,
		color = Color.white,
		font = "fonts/font_medium_shadow_mf",
		text = debug_panels_visible and "armarm" or ""
	})
		
	local arm_gradient = bar_arm_bg_panel:gradient({
		name = "arm_gradient",
		layer = 2,
		x = (- bar_arm_bg_panel:h() + bar_arm_bg_panel:w()) / 2,
		y = (bar_arm_bg_panel:h() - bar_arm_bg_panel:w()) / 2,
		w = bar_arm_bg_panel:h(),
		h = bar_arm_bg_panel:w(),
		valign = "grow",
		rotation = 90,
		gradient_points = {
			0,
			Color(0.75,1,1,1), --argb
			0.2,
			Color(0.1,0,0,0),
			0.5,
			Color(0.3,0,0,0),
			0.8,
			Color(0.1,0,0,0),
			1,
			Color(0.75,1,1,1)
		}
	})	
	
----------------MANIAC	
	local absorb_panel = khud_health_panel:panel({
		name = "bar_absorb_panel",
		layer = 2,
		x = arm_bar_x,
		y = arm_bar_y,
		w = arm_bar_w,
		h = arm_bar_h,
	})
	
	local absorb_rect = absorb_panel:rect({
		name = "bar_absorb_rect",
		blend_mode = "add",
		w = 0,
		layer = 2,
		color = Color("71AAAD"):with_alpha(1)
	})
	local absorb_label = absorb_panel:text({
		name = "absorb_label",
		layer = 2,
		vertical = "center",
		x = -10,
		align = "right",
		font_size = 24,
		color = Color.white,
		font = "fonts/font_medium_shadow_mf",
		text = "asdf",
		visible = false --not currently enabled
	})
	local absorb_active_rect = absorb_panel:rect({
		name = "bar_absorb_active_rect",
		blend_mode = "add",
		w = 0,
		layer = 2,
		color = Color("00F2FF"):with_alpha(1)
	})
	
----------------EX-PRESIDENT
	local stored_health_h = hp_bar_h * 0.75
	
	local stored_health = khud_health_panel:rect({
		name = "bar_stored_hp",
		blend_mode = "add",
		layer = 3,
		x = hp_bar_x,
		y = hp_bar_y + stored_health_h,
		w = 0,
		h = stored_health_h,
		color = Color.green:with_alpha(0.7)
	})
	
	local stored_health_bg = khud_health_panel:rect({
		name = "bar_stored_hp_bg",
		layer = 1,
		x = hp_bar_x,
		y = hp_bar_y + stored_health_h,
		w = hp_bar_w,
		h = stored_health_h,
		visible = false,
		color = Color.black:with_alpha(0.7)
	})

----------------STOIC	
	local stoic_armor = khud_health_panel:rect({
		name = "arm_stoic_damage",
		layer = 3,
		blend_mode = "sub",
		x = arm_bar_x,
		y = arm_bar_y,
		w = 0,
		h = arm_bar_h,
		color = Color.red:with_alpha(0.5)
	})
	
	local stoic_health = khud_health_panel:rect({
		name = "hp_stoic_damage",
		layer = 3,
		x = hp_bar_x,
		y = hp_bar_y,
		w = 0,
		h = hp_bar_h,
		color = Color.red:with_alpha(0.7)
	})

	local debug_health_panel = khud_health_panel:rect({
		name = "debug_health_panel",
		visible = debug_panels_visible, --is reset by settings 
		layer = 0,
		color = Color.red:with_alpha(0.3)
	})
	self._khud_health_panel = khud_health_panel
	return khud_health_panel
end

function HUDTeammate:_layout_khud_health(params) --self
	local health_panel = self._khud_health_panel
	local settings = KineticHUD:GetSettings()
	params = params or {}
	local x = params.x
	local y = params.y
	local w = params.w
	local h = params.h

	local diamond_scale = params.diamond_scale 

	if self._id == HUDManager.PLAYER_PANEL then --player
		if not KineticHUD:HUD_Enabled_Player() then 
			health_panel:hide()
			return
		else
			health_panel:show()
			x = x or (KineticHUD:UseHealthOwnCustomXY() and settings.panel_player_health_x) or 64
			y = y or (KineticHUD:UseHealthOwnCustomXY() and settings.panel_player_health_y) or 500
			w = w or (KineticHUD:UseHealthOwnCustomXY() and settings.panel_player_health_w) or 256 --w/h is currently disabled
			h = h or (KineticHUD:UseHealthOwnCustomXY() and settings.panel_player_health_h) or 4
			diamond_scale = diamond_scale or settings.panel_player_health_diamond_scale or 1
		end
	else --teammate
		if not KineticHUD:HUD_Enabled_Team() then
			health_panel:hide()
			return
		else
			health_panel:show()
			x = x or (KineticHUD:UseHealthTeamCustomXY() and settings.panel_team_health_x) or (self._khud_player:right() - health_panel:w())
			y = y or (KineticHUD:UseHealthTeamCustomXY() and settings.panel_team_health_y) or 500
			w = w or (KineticHUD:UseHealthTeamCustomXY() and settings.panel_team_health_w) or 256 --w/h is currently disabled
			h = h or (KineticHUD:UseHealthTeamCustomXY() and settings.panel_team_health_h) or 4
			diamond_scale = diamond_scale or settings.panel_team_health_diamond_scale or 1
		end
	end
	
	local diamond_margin = params.diamond_margin or 2
	local bar_outline_margin = 3
	local diamond_size = (48 * diamond_scale)
	local show_debug = params.show_debug or false		
	
	local condition_panel = health_panel:child("condition_panel")
	
	local bar_arm = health_panel:child("bar_arm")
	local bar_hp = health_panel:child("bar_hp")
	local hp_bg = health_panel:child("bar_hp_bg_panel")
	local arm_bg = health_panel:child("bar_arm_bg_panel")
	local absorb_panel = health_panel:child("bar_absorb_panel")
	local arm_outline = health_panel:child("arm_floating_outline_panel")
	local hp_outline = health_panel:child("hp_floating_outline_panel")

	health_panel:child("debug_health_panel"):set_visible(show_debug)
--	params.player_color = params.player_color or Color.green
--	health_panel:set_w(w)
--	health_panel:set_h(h)
	health_panel:set_x(x)
	health_panel:set_y(y)

	
	condition_panel:set_y((health_panel:h() - condition_panel:h()) / 2)
	condition_panel:child("condition_diamond_bg"):set_size(diamond_size + diamond_margin,diamond_size + diamond_margin)
	condition_panel:child("condition_diamond"):set_size(diamond_size,diamond_size)
	condition_panel:child("condition_icon"):set_size(diamond_size,diamond_size)
--	condition_panel:child("condition_icon"):set_x(condition_panel:child("condition_diamond"):x())
--	condition_panel:child("condition_icon"):set_y(condition_panel:child("condition_diamond"):y())
	condition_panel:child("condition_icon"):set_center(diamond_size,(health_panel:h() / 2) - 0)
	condition_panel:child("condition_diamond"):set_center(diamond_size,(health_panel:h() / 2) - 0)
	condition_panel:child("condition_diamond_bg"):set_center(diamond_size,(health_panel:h() / 2) - 0)
--	condition_panel:child("condition_icon"):set_y()
	--[[
	--custom scaling/sizing is delayed because everything is heckin' broken and i just want people to be able to move hud elements around asap
	-- but not the condition panel. scaling the condition panel works fine.

		--i need somewhere to put these
		{ 
			"type" : "slider",
			"id" : "khud_panel_health_own_set_w",
			"title" : "khud_panel_health_own_set_w_title",
			"description" : "khud_panel_health_own_set_w_desc",
			"callback" : "callback_khud_panel_health_own_set_w",
			"value" : "health_own_panel_w",
			"default_value" : 1,
			"min" : 0,
			"max" : 2000,
			"step" : 1
		},
		{
			"type" : "slider",
			"id" : "khud_panel_health_own_set_h",
			"title" : "khud_panel_health_own_set_h_title",
			"description" : "khud_panel_health_own_set_h_desc",
			"callback" : "callback_khud_panel_health_own_set_h",
			"value" : "health_own_panel_h",
			"default_value" : 4,
			"min" : 0,
			"max" : 100,
			"step" : 1
		},


		
	
	health_panel:child("bar_hp"):set_w(w)
	health_panel:child("bar_hp"):set_h(h)
	
	hp_bg:set_w(w)
	hp_bg:set_h(h)
	
--	hp_bg:child("bar_hp_rect"):set_w(w)
--	hp_bg:child("bar_hp_rect"):set_h(h)
	
	panel_border(hp_bg,{
--		id_prefix = "new2_",
		alpha = 0.3,
		thickness = 2,
		layer = 1
	})
	
	hp_outline:set_w(w + bar_outline_margin)
	hp_outline:set_h(h + bar_outline_margin)
	
	panel_border(hp_outline,{
--		id_prefix = "new1_",
		alpha = 0.5,
		thickness = 0.75,
		layer = 1
	})
	
	health_panel:child("hp_text"):set_font_size(h + 1)
	hp_bg:child("hp_gradient"):set_w(h)
	hp_bg:child("hp_gradient"):set_h(w)
	hp_bg:child("hp_gradient"):set_center((hp_bg:right() - hp_bg:x()) / 2,(hp_bg:bottom() - hp_bg:y()) / 2)
	
	health_panel:child("bar_arm"):set_w(w)
	health_panel:child("bar_arm"):set_h(h)
	
	arm_bg:set_w(w)
	arm_bg:set_h(h)
--	arm_bg:set_x(bar_arm:x() - (bar_outline_margin / 2))
--	arm_bg:set_y(bar_arm:y() - (bar_outline_margin / 2))
	
	arm_bg:child("bar_arm_rect"):set_w(w)
	arm_bg:child("bar_arm_rect"):set_h(h)
	arm_bg:child("bar_arm_rect"):set_x(arm_bg:x())
	arm_bg:child("bar_arm_rect"):set_y(arm_bg:y())
	
	panel_border(arm_bg,{
		alpha = 1,
		thickness = 2,
		layer = 1
	})

	arm_outline:set_w(w)
	arm_outline:set_h(h)
	panel_border(arm_outline,{
		alpha = 1,
		thickness = 0.75,
		layer = 1
	})
	
	health_panel:child("arm_text"):set_font_size(h + 1)
--	arm_bg:child("arm_gradient"):set_y(0)
	arm_bg:child("arm_gradient"):set_w(h)
	arm_bg:child("arm_gradient"):set_h(w)
	arm_bg:child("arm_gradient"):set_center((arm_bg:right() - arm_bg:x()) / 2,(arm_bg:bottom() - arm_bg:y()) / 2)
	
	--absorb_panel:child("bar_absorb_rect"):set_w(w)
	absorb_panel:child("bar_absorb_rect"):set_h(h)
	absorb_panel:child("absorb_label"):set_font_size(h)
--	absorb_panel:child("bar_absorb_active_rect"):set_w(w)
	
--	health_panel:child("bar_stored_hp"):set_w(w)
	health_panel:child("bar_stored_hp"):set_h(h * 0.75)
	health_panel:child("bar_stored_hp"):set_y(hp_bg:y())
	health_panel:child("bar_stored_hp_bg"):set_w(w)
	health_panel:child("bar_stored_hp_bg"):set_h(h * 0.75)
	health_panel:child("bar_stored_hp_bg"):set_y(hp_bg:y())

--	health_panel:child("arm_stoic_damage")
	--]]
	
end

function HUDTeammate:_create_khud_crosshair()
	local hud_panel = self._khud_player
	local panel_w = 128
	local panel_h = 128

	local crosshair_w = 2
	local crosshair_h = 16
	local crosshair_offset = 12
	
	local circle_w = 24
	local circle_h = 24
	
	local dot_scale = 3
	
	local khud_crosshair_panel = hud_panel:panel({
		name = "khud_crosshair_panel",
		layer = 1,
		h = panel_h,
		w = panel_w,
		x = 1 + (hud_panel:w() / 2) - (panel_w / 2),
		y = 1 + (hud_panel:h() / 2) - (panel_h / 2)
	})
	self._khud_crosshair_panel = khud_crosshair_panel
	
	local h_c = panel_h / 2
	local w_c = panel_w / 2
	
	local crosshair_circle = khud_crosshair_panel:bitmap({
		name = "crosshair_circle",
		layer = 0,
		x = 0 + w_c - ((circle_w * (1)) / 2),
		y = 0 + h_c - ((circle_h  * (1)) / 2),
		texture = "guis/textures/pd2/hud_progress_active",
		blend_mode = "add",
		rotation = 360,
		color = Color.red:with_alpha(0.5),
		visible = false,
		w = circle_w,
		h = circle_h
	})
	
	local crosshair_top = khud_crosshair_panel:rect({
		name = "crosshair_top",
		layer = 0,
		x = w_c - (crosshair_w / 2),
		y = h_c - (crosshair_offset + crosshair_h), --crosshair_offset,
		color = Color.red:with_alpha(0.3),
		blend_mode = "add",
		visible = false,
		w = crosshair_w,
		h = crosshair_h
	})
	
	local crosshair_bottom = khud_crosshair_panel:rect({
		name = "crosshair_bottom",
		layer = 0,
		x = w_c - (crosshair_w / 2),
		y = h_c + crosshair_offset,
		color = Color.red:with_alpha(0.3),
		blend_mode = "add",
		visible = false,
		w = crosshair_w,
		h = crosshair_h
	})	
	local crosshair_left = khud_crosshair_panel:rect({
		name = "crosshair_left",
		layer = 0,
		x = w_c - (crosshair_offset + crosshair_h),
		y = h_c - (crosshair_w / 2),
		color = Color.red:with_alpha(0.3),
		blend_mode = "add",
		visible = false,
		w = crosshair_h,
		h = crosshair_w
	})
	local crosshair_right = khud_crosshair_panel:rect({
		name = "crosshair_right",
		layer = 0,
		x = w_c + crosshair_offset,
		y = h_c - (crosshair_w / 2),
		color = Color.red:with_alpha(0.3),
		blend_mode = "add",
		visible = false,
		w = crosshair_h,
		h = crosshair_w
	})
	
	local crosshair_dot = khud_crosshair_panel:bitmap({
		name = "crosshair_dot",
		layer = 0,
		x = 0 + w_c - (dot_scale / 2),
		y = 0 + h_c - (dot_scale / 2),
		texture = "guis/textures/pd2/hud_progress_32px",
		blend_mode = "add",
		rotation = 360,
		visible = false,
		color = Color.red:with_alpha(0.5),
		w = dot_scale,
		h = dot_scale
	})

	return khud_crosshair_panel
end

function HUDTeammate:_layout_khud_crosshair(params)
	local panel = self._khud_crosshair_panel
	
	local circle = panel:child("crosshair_circle")
	local dot = panel:child("crosshair_dot")
	local crosshair_top = panel:child("crosshair_top")
	local crosshair_bottom = panel:child("crosshair_bottom")
	local crosshair_left = panel:child("crosshair_left")
	local crosshair_right = panel:child("crosshair_right")
	
	local settings = KineticHUD:GetSettings()
	params = params or {}
	
	panel:set_visible(KineticHUD:IsCrosshairEnabled())
	
	local hud_panel = self._khud_player

	local panel_w = panel:w()
	local panel_h = panel:h()
	local h_c = panel_h / 2
	local w_c = panel_w / 2
	local bandaid_x = 0
	local bandaid_y = 1
	
	panel:set_x(bandaid_x + (hud_panel:w() / 2) - (panel_w / 2))
	panel:set_y(bandaid_y + (hud_panel:h() / 2) - (panel_h / 2))
	local show_circle = params.show_circle or settings.crosshair_show_circle --hopefully settings will always be set correctly or else it'll evaluate to true every time lol
	local circle_w = params.circle_scale or settings.crosshair_circle_scale or 32
	local circle_h = circle_w
		
	local show_cross = params.show_cross or settings.crosshair_show_cross
	local cross_w = params.cross_w or settings.crosshair_cross_w or 2
	local cross_h = params.cross_h or settings.crosshair_cross_h or 6
	local cross_offset = params.cross_offset or settings.crosshair_cross_offset or 8
	
	local show_dot = params.show_dot or settings.crosshair_show_dot
	local dot_scale = params.dot_scale or settings.crosshair_dot_scale or 4
	
	local alpha = params.crosshair_opacity or settings.crosshair_master_opacity or 0.5
	local crosshair_color = params.color or Color("80C6FF") or Color.white

	if not params.skip_alpha then 
		panel:set_alpha(alpha)
	else
		crosshair_color = crosshair_color:with_alpha(dot:alpha())
	end
	circle:set_x(w_c - (circle_w / 2))
	circle:set_y(h_c - (circle_h / 2))
	circle:set_size(circle_w,circle_h)
	circle:set_color(crosshair_color)
	circle:set_visible(show_circle)
	
	crosshair_top:set_x(w_c - (cross_w / 2))
	crosshair_top:set_y(h_c - (cross_offset + cross_h))
	crosshair_top:set_size(cross_w,cross_h)
	crosshair_top:set_color(crosshair_color)
	crosshair_top:set_visible(show_cross)
	
	crosshair_bottom:set_x(w_c - (cross_w / 2))
	crosshair_bottom:set_y(h_c + cross_offset)
	crosshair_bottom:set_size(cross_w,cross_h)
	crosshair_bottom:set_color(crosshair_color)
	crosshair_bottom:set_visible(show_cross)
	
	crosshair_left:set_x(w_c - (cross_offset + cross_h))
	crosshair_left:set_y(h_c - (cross_w / 2))
	crosshair_left:set_size(cross_h,cross_w)
	crosshair_left:set_color(crosshair_color)
	crosshair_left:set_visible(show_cross)
	
	crosshair_right:set_x(w_c + cross_offset)
	crosshair_right:set_y(h_c - (cross_w / 2))
	crosshair_right:set_size(cross_h,cross_w)
	crosshair_right:set_color(crosshair_color)
	crosshair_right:set_visible(show_cross)
	
	dot:set_x(w_c - (dot_scale / 2))
	dot:set_y(h_c - (dot_scale / 2))
	dot:set_size(dot_scale,dot_scale)
	dot:set_color(crosshair_color)
	dot:set_visible(show_dot)
end

function HUDTeammate:_create_khud_deployables(icon_name,scale)
	local hud_panel = self._khud_player
	local main_player = self._main_player
	local icon_scale = 0.5
	
	scale = (scale or 1) * (main_player and 1 or 0.75)
--	scale = scale * (main_player and 1 or 0.75)
	local single_w = 36 * scale --size of the visible box
	local single_h = 36 * scale
	local fontsize = 24 * scale
	local dep_w = (single_w * 2) + pad_small --size of the panel
	local dep_h = single_h + 24 -- extra space for label

	dep_w = dep_w
	dep_h = dep_h
	
	local icon,rect = nil
	if icon_name then
		icon,rect = tweak_data.hud_icons:get_icon_data(icon_name)
	end
	
	local khud_deployables_panel = hud_panel:panel({
		name = "khud_deployables_panel",
		layer = 1,
		x = 0,
		y = hud_panel:h() - 100,
		w = dep_w,
		h = dep_h + 24
	})
	self._khud_deployables_panel = khud_deployables_panel
	
	local primary_deployable = khud_deployables_panel:panel({
		name = "primary_deployable",
		layer = 1,
		visible = debug_panels_visible,--set visible only when deployable1 is equipped
		x = dep_w - single_w,
		y = pad_medium,
		w = single_w,
		h = dep_h
	})
	
	local primary_deployable_bg = primary_deployable:panel({
		name = "primary_deployable_bg",
		layer = 1,
		w = single_w,
		h = single_h,
	})
	local primary_deployable_rect = primary_deployable_bg:rect({
		name = "primary_deployable_rect",
		color = Color.black:with_alpha(0.3)
	})
	
	panel_border(primary_deployable_bg,{
		thickness = 2,
		alpha = 0.7,
		layer = 3
	})
		
	local primary_deployable_amount = primary_deployable:text({
		name = "amount",
		layer = 2,
		vertical = "bottom",
		align = "center",
		font_size = fontsize,
		font = ammo_font,
		color = Color.white,
		text = "0"
	})
	local primary_deployable_icon = primary_deployable:bitmap({
		name = "icon",
		layer = 2,
		texture = icon,
		texture_rect = rect,
		w = single_w * icon_scale,
		h = single_h * icon_scale,
		x = (single_w * icon_scale) / 2,
		y = (single_h * icon_scale) / 2,
		color = Color.white		
	})
	
	local secondary_deployable = khud_deployables_panel:panel({
		name = "secondary_deployable",
		layer = 1,
		visible = debug_panels_visible, --set visible only when deployable2 equipped
		y = pad_medium,
		w = single_w,
		h = dep_h
	})
	
	
	local secondary_deployable_bg = secondary_deployable:panel({
		name = "secondary_deployable_bg",
		layer = 1,
		w = single_w,
		h = single_h,
	})
	local secondary_deployable_rect = secondary_deployable_bg:rect({
		name = "secondary_deployable_rect",
		color = Color.black:with_alpha(0.3)
	})
	
	panel_border(secondary_deployable_bg,{
		thickness = 2,
		alpha = 0.7,
		layer = 3
	})

	local secondary_deployable_amount = secondary_deployable:text({
		name = "amount",
		layer = 2,
		vertical = "bottom",
		align = "center",
		font_size = fontsize,
		font = ammo_font,
		color = Color.white,
		text = "0"
	})
	local secondary_deployable_icon = secondary_deployable:bitmap({
		name = "icon",
		layer = 2,
		texture = icon,
		texture_rect = rect,
		w = single_w * icon_scale,
		h = single_h * icon_scale,
		x = (single_w * icon_scale) / 2,
		y = (single_h * icon_scale) / 2,
		color = Color.white
	})	
	
	local selected_bar = khud_deployables_panel:rect({
		name = "selected_bar",
		layer = 4,
		x = primary_deployable:x(),
		w = single_w,
		h = 6,
		visible = false, --set visible on load
		color = Color.white
	})
	
	local debug_deployables_panel = khud_deployables_panel:rect({
		name = "debug_deployables_panel",
		visible = debug_panels_visible,
		layer = 0,
		color = Color(1,0,0.8):with_alpha(0.3)
	})
	
	return khud_deployables_panel
end

function HUDTeammate:_layout_khud_deployables(params)
	local deployables = self._khud_deployables_panel
	local health_panel = self._khud_health_panel
	
	deployables:set_x(health_panel:x() + deployables:w())
	deployables:set_y(health_panel:y() + pad_medium + deployables:child("primary_deployable"):child("primary_deployable_bg"):h())
end

function HUDTeammate:_create_khud_grenades()
	local hud_panel = self._khud_player
	local scale = (self._main_player and 1 or 0.75)
	local grenades_w = 36 * scale 
	local grenades_h = 36 * scale
	local fontsize = 24 * scale
	local icon_scale = 0.5
	
	local khud_grenades_panel = hud_panel:panel({
		name = "khud_grenades_panel",
		layer = 1,
		x = hud_panel:child("khud_deployables_panel"):right() + pad_small,
		y = hud_panel:child("khud_deployables_panel"):y() + pad_medium,
		w = grenades_w,
		h = grenades_h + 24
	})
	self._khud_grenades_panel = khud_grenades_panel
	
	local texture, rect = tweak_data.hud_icons:get_icon_data("frag_grenade")
	local grenades_icon = khud_grenades_panel:bitmap({
		name = "grenades_icon",
		layer = 3,
		texture = texture,
		texture_rect = rect,
		alpha = PlayerBase.USE_GRENADES and 1 or 0.3,
		w = (grenades_w * icon_scale),
		h = (grenades_h * icon_scale),
		x = (grenades_w * icon_scale) / 2,
		y = (grenades_h * icon_scale) / 2
	})
	
	local grenades_amount = khud_grenades_panel:text({
		name = "grenades_amount",
		layer = 3,
		vertical = "bottom",
		font_size = fontsize,
		align = "center",
		font = ammo_font,
		text = "0",
		color = Color.white
	})
	local grenades_bg = khud_grenades_panel:panel({
		name = "grenades_bg",
		layer = 1,
		w = grenades_w,
		h = grenades_h,
	})
	local grenades_rect = grenades_bg:rect({
		name = "grenades_rect",
		layer = 0,
		color = Color.black:with_alpha(0.3)
	})
	local grenades_panel_borders = panel_border(grenades_bg,{
		thickness = 2,
		alpha = 0.7,
		layer = 1
	})
	
	local grenades_recharge = grenades_bg:gradient({
		name = "grenades_recharge",
		blend_mode = "add",
		visible = false, --is set visible on use
		valign = "grow",
		layer = 5,
		rotation = 90,
		gradient_points = {
			0,
			Color(1,1,0,0), --argb
			0.5,
			Color(1,0,1,0),
			1,
			Color(1,0,0,1)
		}
	})

	local debug_grenades_rect = khud_grenades_panel:rect({
		name = "debug_grenades_rect",
		visible = debug_panels_visible,
		layer = 0,
		color = Color.blue:with_alpha(0.3)
	})
	
	return khud_grenades_panel
end

function HUDTeammate:_layout_khud_grenades()
	local grenades = self._khud_grenades_panel
	local ties_panel = self._khud_ties_panel
	grenades:set_x(ties_panel:right() + pad_small)
	grenades:set_y(ties_panel:y())
end

function HUDTeammate:_create_khud_weapons() --for main player
	local hud_panel = self._khud_player
	local weapon_w = 256 --weapons panel
	local weapon_h = 100 --weapons panel
	local weapon_y = hud_panel:h() - weapon_h --weapons panel
	local wpn_h = 50 --individual primary/secondary weapon subpanel size
	local firemode_h = 32
	local firemode_w = 32

	local khud_weapons_panel = hud_panel:panel({
		name = "khud_weapons_panel",
		layer = 1,
		x = 128 + pad_medium,
		y = weapon_y,
		w = weapon_w,
		h = weapon_h
	})
	self._khud_weapons_panel = khud_weapons_panel

	local selected_bar = khud_weapons_panel:rect({
		name = "selected_bar",
		layer = 1,
		w = 6,
		h = wpn_h,
		visible = self._main_player, --visible on load for main player
		color = Color.white
	})
	local selected_div = khud_weapons_panel:rect({
		name = "selected_div",
		x = (weapon_w - 75),
		w = 1.5,
		h = wpn_h,
		layer = 0,
		visible = self._main_player, --visible on load for main player
		color = Color.white:with_alpha(0.3)
	})

	local primary_weapon_panel = khud_weapons_panel:panel({
		name = "primary_weapon_panel",
		layer = 1,
		x = pad_medium,
		w = weapon_w - pad_medium,
		h = wpn_h,
	})
	local primary_weapon_bg = primary_weapon_panel:rect({
		name = "primary_weapon_bg",
		layer = 0,
		color = Color("394A5C"):with_alpha(0.9)
	})
		
	local primary_mag_text = primary_weapon_panel:text({
		name = "mag_text",
		layer = 5,
		x = primary_weapon_panel:w() * 0.5,
		y = (primary_weapon_panel:h() - 32) * 0.5,
		font_size = 32,
		color = Color.white,
		font = ammo_font,
		text = "69"
	})
	local primary_ammo_text = primary_weapon_panel:text({
		name = "ammo_text",
		layer = 5,
		x = primary_weapon_panel:w() * 0.8,
		y = (primary_weapon_panel:h() - 16) * 0.5,
		font_size = 16,
		color = Color.white,
		font = ammo_font,
		text = "420"
	})
	self._primary_weapon_panel = primary_weapon_panel
	
	
	local primary_icon = primary_weapon_panel:bitmap({
		name = "primary_icon",
		layer = 4,
		x = 0 + pad_medium,
		w = wpn_h * 2,
		h = wpn_h,
		halign = "grow",
		valign = "grow",
		texture = managers.blackmarket:get_weapon_icon_path("amcar"),
		visible = true
	})
	local primary_firemode_panel = primary_weapon_panel:panel({
		name = "primary_firemode_panel",
		layer = 1,
		x = pad_small,
		y = 3 + pad_small + wpn_h - (firemode_h),
		w = firemode_w,
		h = firemode_h
	})
	local debug_primary_firemode = primary_firemode_panel:rect({
		name = "debug_primary_firemode",
		layer = 1,
		color = Color.red:with_alpha(0.3),
		visible = debug_panels_visible
	})
	
	local firemode_primary = primary_firemode_panel:bitmap({
		name = "firemode",
		layer = 1,
		valign = "bottom",
		texture = "guis/textures/pd2/specialization/icons_atlas",
		texture_rect = {
			64 * 3.55,	
			64 * 3.65,
			0, --6 12 32
			27
		}
	})
	local primary_safety_text = primary_weapon_panel:text({
		name = "safety_text",
		text = "SAFE",
		align = "center",
		vertical = "center",
		font = ammo_font,
		font_size = 32,
		layer = 5,
		color = Color.red,
		visible = false
	})		
	panel_border(primary_weapon_panel,{
		thickness = 1,
		alpha = 0.3,
		layer = 3
	})
			
	local secondary_weapon_panel = khud_weapons_panel:panel({
		name = "secondary_weapon_panel",
		layer = 1,
		x = pad_medium,
		y = wpn_h,
		w = weapon_w - pad_medium,
		h = wpn_h
	})
	local secondary_weapon_bg = secondary_weapon_panel:rect({
		name = "secondary_weapon_bg",
		layer = 0,
		color = Color("394A5C"):with_alpha(0.9)
	})
	local secondary_mag_text = secondary_weapon_panel:text({
		name = "mag_text",
		layer = 5,
		x = secondary_weapon_panel:w() / 2,
		y = (secondary_weapon_panel:h() - 32) * 0.5,
		font_size = 32,
		color = Color.white,
		font = ammo_font,
		text = "99"
	})
	local secondary_ammo_text = secondary_weapon_panel:text({
		name = "ammo_text",
		layer = 5,
		x = 212,
		y = (secondary_weapon_panel:h() - 16) * 0.5,
		font_size = 16,
		color = Color.white,
		font = ammo_font,
		text = "100"
	})
	self._secondary_weapon_panel = secondary_weapon_panel

	local secondary_icon = secondary_weapon_panel:bitmap({
		name = "secondary_icon",
		layer = 4,
		x = 0 + pad_medium,
		w = 2 * wpn_h * 2,
		h = wpn_h,
		halign = "grow",
		valign = "grow",
		texture = managers.blackmarket:get_weapon_icon_path("glock_17"),
		visible = true
	})
	
	local secondary_firemode_panel = secondary_weapon_panel:panel({
		name = "secondary_firemode_panel",
		layer = 1,
		x = pad_small,
		y = 3 + pad_small + wpn_h - (firemode_h),
		w = firemode_w,
		h = firemode_h
	})
	local debug_secondary_firemode = secondary_firemode_panel:rect({
		name = "debug_secondary_firemode",
		layer = 1,
		color = Color.blue:with_alpha(0.3),
		visible = debug_panels_visible
	})

	local firemode_secondary = secondary_firemode_panel:bitmap({
		name = "firemode_secondary",
		layer = 1,
		valign = "bottom",
		texture = "guis/textures/pd2/specialization/icons_atlas",
		texture_rect = {
			64 * 3.55,	
			64 * 3.65,
			0, --6 12 32
			27
		}
	})

	local secondary_safety_text = secondary_weapon_panel:text({
		name = "safety_text",
		text = "SAFE",
		align = "center",
		vertical = "center",
		font = ammo_font,
		font_size = 32,
		layer = 5,
		color = Color.red,
		visible = false
	})
	
	panel_border(secondary_weapon_panel,{
		thickness = 1,
		alpha = 0.3,
		layer = 3
	})
	
	local div_h = khud_weapons_panel:rect({ --todo bitmap instead?
		name = "div_h",
		layer = 1,
		x = pad_medium,
		y = wpn_h - 1,
		w = weapon_w - pad_medium,
		h = 2,
		visible = self._main_player,
		color = Color.white
	})
	
	local killicon_w = 12
	local killicon_h = 12
	
	local primary_kill_counter = primary_weapon_panel:text({
		name = "primary_kill_counter",
		layer = 4,
		x = pad_small + 0,
		y = pad_small,
		align = "left",
		vertical = "top",
		font_size = 16,
		font = ammo_font,
		color = Color.yellow,
		text = " 0" --that undefined box character displays as a skull icon in pd2, though you can't tell in your text editor
	})	
	
	local secondary_kill_counter = secondary_weapon_panel:text({
		name = "secondary_kill_counter",
		layer = 4,
		x = pad_small + 0,
		y = pad_small,
		align = "left",
		vertical = "top",
		font_size = 16,
		font = ammo_font,
		color = Color.yellow,
		text = " 0"	
	})
	--]]

	local kills_tex, kills_rect = tweak_data.hud_icons:get_icon_data("risk_pd")
	local primary_kills_icon = primary_weapon_panel:bitmap({
		name = "primary_kills_icon",
--		x = 0,
		y = pad_small,
		w = killicon_w,
		h = killicon_h,
		layer = 4,
		texture = kills_tex,
		texture_rect = kills_rect,
		alpha = 1,
		visible = false,
		color = Color.yellow
	})
	local secondary_kills_icon = secondary_weapon_panel:bitmap({
		name = "secondary_kills_icon",
--		x = 0,
		y = pad_small,
		w = killicon_w,
		h = killicon_h,
		layer = 4,
		texture = kills_tex,
		texture_rect = kills_rect,
		alpha = 1,
		visible = false,
		color = Color.yellow
	})
	
	
	local debug_weapons_panel = khud_weapons_panel:rect({
		name = "debug_weapons_panel",
		visible = debug_panels_visible,
		layer = 2,
		color = Color.yellow:with_alpha(0.3)
	})
--[[	
	local debug_pri = primary_weapon_panel:rect({
		name = "debug_pri",
		color = Color.red:with_alpha(0.3)
		visible = debug_panels_visible
	})
	
	local debug_sec = secondary_weapon_panel:rect({
		name = "debug_sec",
		color = Color.blue:with_alpha(0.3),
		visible = debug_panels_visible
	})
	--]]
	
	self._khud_weapon_name = hud_panel:text({ --not truly linked to weapon panel, is actually in the middle-right of the screen
		name = "weapon_name",
		layer = 5,
--		align = "right",
		x = khud_weapons_panel:left(),
		y = khud_weapons_panel:top(),
		font_size = 16, -- todo scale
		color = Color.white,
		font = ammo_font,
		alpha = 0, --start 0, set to 1 after switching weapons, fades back to 0 via update()
		visible = self._main_player, --not currently available for teammates or AI 
		text = "AMCAR"
	})
	
	return khud_weapons_panel
end

function HUDTeammate:_create_khud_secondary_firemode()
	
	local weapons_panel = self._khud_weapons_panel:child("secondary_weapon_panel")
	
	local firemode_panel = weapons_panel:child("secondary_firemode_panel")
	
	local firemode_secondary = firemode_panel:child("firemode_secondary")
	local firemode_secondary_grey = firemode_panel:child("firemode_secondary_grey")
	
	local equipped_secondary = managers.blackmarket:equipped_secondary()
	local weapon_tweak_data = tweak_data.weapon[equipped_secondary.weapon_id]
	local fire_mode = weapon_tweak_data.FIRE_MODE
	local can_toggle_firemode = weapon_tweak_data.CAN_TOGGLE_FIREMODE
	local locked_to_auto = managers.weapon_factory:has_perk("fire_mode_auto", equipped_secondary.factory_id, equipped_secondary.blueprint)
	local locked_to_single = managers.weapon_factory:has_perk("fire_mode_single", equipped_secondary.factory_id, equipped_secondary.blueprint)		

	if alive(firemode_secondary) then 
		firemode_secondary:hide()
		firemode_panel:remove(firemode_secondary)
	end
	if alive(firemode_secondary_grey) then
		firemode_secondary_grey:hide()
		firemode_panel:remove(firemode_secondary_grey)
	end

	if (locked_to_auto or locked_to_single) then
		firemode_secondary_grey = firemode_panel:bitmap({
			name = "firemode_secondary_grey",
			layer = 0,
--			blend_mode = "sub",
			color = Color("FF5959"),
			alpha = 0.3,--todo create grey rect background to make it visible during flashbangs?
			texture = "guis/textures/pd2/specialization/icons_atlas",
			texture_rect = {
				64 * 3.55,	
				64 * 3.65,
				32,
				27
			}
		})
	else
		firemode_secondary_grey = firemode_panel:bitmap({
			name = "firemode_secondary_grey",
			layer = 0,
			blend_mode = "sub",
--			color = Color.white,
			alpha = 0.1,
			texture = "guis/textures/pd2/specialization/icons_atlas",
			texture_rect = {
				64 * 3.55,	
				64 * 3.65,
				32,
				27
			}
		})
	end
	if not can_toggle_firemode then
		firemode_secondary_grey:hide()
	end
	firemode_secondary = firemode_panel:bitmap({
		name = "firemode_secondary",
		layer = 1,
--		x = 5,
		texture = "guis/textures/pd2/specialization/icons_atlas",
		texture_rect = {
			64 * 3.55,	
			64 * 3.65,
			6, --6 12 32
			27
		}
	})
end

function HUDTeammate:_create_khud_primary_firemode()
	
	local weapons_panel = self._khud_weapons_panel:child("primary_weapon_panel")
	
	local firemode_panel = weapons_panel:child("primary_firemode_panel")
	
	local firemode_primary = firemode_panel:child("firemode_primary")
	local firemode_primary_grey = firemode_panel:child("firemode_primary_grey")
	
	local equipped_primary = managers.blackmarket:equipped_primary()
	local weapon_tweak_data = tweak_data.weapon[equipped_primary.weapon_id]
	local fire_mode = weapon_tweak_data.FIRE_MODE
	local can_toggle_firemode = weapon_tweak_data.CAN_TOGGLE_FIREMODE
	local locked_to_auto = managers.weapon_factory:has_perk("fire_mode_auto", equipped_primary.factory_id, equipped_primary.blueprint)
	local locked_to_single = managers.weapon_factory:has_perk("fire_mode_single", equipped_primary.factory_id, equipped_primary.blueprint)		

	if alive(firemode_primary) then 
		firemode_primary:hide()
		firemode_panel:remove(firemode_primary)
	end
	if alive(firemode_primary_grey) then
		firemode_primary_grey:hide()
		firemode_panel:remove(firemode_primary_grey)
	end

	if (locked_to_auto or locked_to_single) then
		firemode_primary_grey = firemode_panel:bitmap({
			name = "firemode_primary_grey",
			layer = 0,
--			blend_mode = "sub",
			color = Color("FF5959"), --todo standardise/tweakdata
			alpha = 0.3,--todo create grey rect background to make it visible during flashbangs?
			texture = "guis/textures/pd2/specialization/icons_atlas",
			texture_rect = {
				64 * 3.55,	
				64 * 3.65,
				32,
				27
			}
		})
	else
		firemode_primary_grey = firemode_panel:bitmap({
			name = "firemode_primary_grey",
			layer = 0,
			blend_mode = "sub",
			alpha = 0.1,
			texture = "guis/textures/pd2/specialization/icons_atlas",
			texture_rect = {
				64 * 3.55,	
				64 * 3.65,
				32,
				27
			}
		})
	end
	if not can_toggle_firemode then
		firemode_primary_grey:hide()
	end
	
	firemode_primary = firemode_panel:bitmap({
		name = "firemode_primary",
		layer = 1,
		texture = "guis/textures/pd2/specialization/icons_atlas",
		texture_rect = {
			64 * 3.55,
			64 * 3.65,
			6, --6 12 32
			27
		}
	})
end

function HUDTeammate:_create_khud_equipment()
	local hud_panel = self._khud_player
	local equip_w = self._main_player and 320 or 240--supports 10 equipments at 32x
	local equip_h = 32
	
	local khud_equipment_panel = hud_panel:panel({
		name = "khud_equipment_panel",
		layer = 1,
		x = 64,
		y = 500,
		w = equip_w,
		h = equip_h
	})
	self._khud_equipment_panel = khud_equipment_panel
	
	local debug_equipment_panel = khud_equipment_panel:rect({
		name = "debug_equipment_panel",
		visible = debug_panels_visible,
		layer = 0,
		color = Color(1,0.75,0):with_alpha(0.3)
	})
	
	return khud_equipment_panel
end

function HUDTeammate:_layout_khud_equipment()
	local equipment = self._khud_equipment_panel
	local health_panel = self._khud_health_panel
	equipment:set_y(health_panel:y() - equipment:h())
	equipment:set_x(health_panel:right() - equipment:w())
end

function HUDTeammate:_create_khud_region() --todo duplicate to hudstatsscreen with the spacing used for region_label_text below
	local hud_panel = self._khud_player
	local main_player = self._main_player
	local region_w = main_player and 305 or 128
	local region_h = 64
	local settings = KineticHUD:GetSettings()
	local region_fontsize = main_player and 28 or settings.panel_team_name_fontsize
	
	local khud_region_panel = hud_panel:panel({
		name = "khud_region_panel",
		layer = 1,
		x = (hud_panel:w() - region_w) / 2,
		y = 32,
		w = region_w,
		h = region_h
	})
	
	local region_label
	
	if main_player then 
		region_label = khud_region_panel:text({
			name = "region_label",
			layer = 3,
	--		vertical = "center",
			font_size = region_fontsize,
			align = "center",
			font = font_large_mf,
			text = debug_panels_visible and "WASHINGTON, D.C." or "",
			color = Color.white
		})
	else
		region_label = khud_region_panel:text({
			name = "region_label",
			layer = 3,
	--		vertical = "center",
			font_size = region_fontsize,
			align = "right",
			font = font_large_mf,
			text = debug_panels_visible and "WASHINGTON, D.C." or "",
			color = Color.white
		})
	end
	
	local debug_region_rect = khud_region_panel:rect({
		name = "debug_region_rect",
		visible = debug_panels_visible,
		layer = 0,
		color = Color.blue:with_alpha(0.3)
	})
	self._khud_region_panel = khud_region_panel
	return khud_region_panel	
	
--[[	
	local hud_panel = self._khud_player
	
	if self._main_player then 
		local region_w = 305 + 2
		local region_h = 64
		local subregion_h = 36
		
		local subregion_fontsize = 28		
		local khud_region_panel = hud_panel:panel({
			name = "khud_region_panel",
			layer = 1,
			x = (hud_panel:w() - region_w) / 2,
			y = 32,
			w = region_w,
			h = region_h
		})
		self._khud_region_panel = khud_region_panel

	
		local level_data = managers.job:current_level_data()
		local level_name = managers.localization:text(level_data.name_id)

		
		local subregion_panel = khud_region_panel:panel({
			name = "subregion_panel",
			layer = 1,
			align = "center",
			w = region_w,
			h = subregion_h
		})
--		local subregion_border = panel_border(subregion_panel,{thickness = 1.5}) --no longer needed... rip, the original reason i wrote panel_border()
		
		--[
		local region_label_text = string.gsub(utf8.to_upper(level_name),"(.-)","%1 ") --add a space in between every two characters, including spaces and punctuation
		local region_label = khud_region_panel:text({
			name = "region_label",
			layer = 3,
			x = pad_large,
			font_size = 24,
			align = "left",
			vertical = "top",
			font = "fonts/font_large_mf",
			text = (debug_panels_visible and level_name) or region_label_text or "E U R O P E A N  D A R K  Z O N E",
			color = Color.white:with_alpha(0.5)
		})	
		local region_len = utf8.len(region_label:text()) --use text:w()[3] instead
		--]
	
		local subregion_label = subregion_panel:text({
			name = "subregion_label",
			layer = 3,
			x = pad_medium,
			vertical = "center",
			font_size = subregion_fontsize,
			align = "center",
			font = font_large_mf,
			text = debug_panels_visible and "WASHINGTON, D.C." or "",
			color = Color.white
		})
		
		local debug_region_rect = khud_region_panel:rect({
			name = "debug_region_rect",
			visible = debug_panels_visible,
			layer = 0,
			color = Color.blue:with_alpha(0.3)
		})
		self._khud_region_panel = khud_region_panel
		return khud_region_panel	
	else
		
		local subregion_fontsize = 18
		local subregion_y = subregion_fontsize - 1
		
		local subregion_w = 150
		local subregion_h = 1000
		
		local subregion_panel = hud_panel:panel({
			name = "khud_region_panel",
			layer = 0,
			x = 0,
			y = subregion_y,
			w = subregion_w,
			visible = true
		})
		
		local subregion_text = subregion_panel:text({
			name = "subregion_label",
			layer = 3,
			align = "right",
			Color = Color.white,
			font = ammo_font,
			font_size = subregion_fontsize,
			text = "subregion"
		})
		self._khud_region = subregion_panel
		return subregion_panel		
	end
	--]]
end

function HUDTeammate:_layout_khud_region(params)
	local region = self._khud_region_panel
--	local i = self._id or 5
	local name = self._khud_name
--	local x = 
	local health_panel = self._khud_health_panel
--	local x = health_panel:x() + health_panel:w() - region:w()  -- health_panel:right() - region:w()
	
--	local _,_,w,h = name:text_rect()
	
	region:set_x(name:x())
	local _,_,ww,hh = region:child("region_label"):text_rect()
	region:set_y(health_panel:y() - hh)
--	region:set_y(name:y() + h - hh)
--	region:set_x(name:x()) -- region:w())
--	region:set_y(name:y() + region:child("region_label"):font_size()) --font size
end

function HUDTeammate:_layout_khud_subregion(params) --i don't remember writing this, and also i don't use this???
	local subregion_panel = self._khud_subregion
	
	local settings = KineticHUD:GetSettings()
	params = params or {}

	local x = params.x
	local y = params.y
	local w = params.w
	local h = params.h	
	

	if self._id == HUDManager.PLAYER_PANEL then
		if not KineticHUD:HUD_Enabled_Player() then 
			ties_panel:hide()
			return
		else
			ties_panel:show()
			x = x or settings.panel_player_subregion_x or 64
			y = y or settings.panel_player_subregion_y or 500
			w = w or settings.panel_player_subregion_w or 256 --w/h is currently disabled
			h = h or settings.panel_player_subregion_h or 4
		end
	else --should not be called for teammates
		if not KineticHUD:HUD_Enabled_Team() then
			ties_panel:hide()
			return
		else
			ties_panel:show()
			x = x or settings.panel_team_subregion_x or 64
			y = y or settings.panel_team_subregion_y or 500
			w = w or settings.panel_team_subregion_w or 256 --w/h is currently disabled
			h = h or settings.panel_team_subregion_h or 4
		end
	end	
	
	ties_panel:set_x(x + 64)
	ties_panel:set_y(y + 50)
end

function HUDTeammate:_create_khud_converts() --todo
	local hud_panel = self._khud_player
	local converts_w = 128 + pad_small
	local converts_h = 64
	
	local khud_converts_panel = hud_panel:panel({
		name = "khud_converts_panel",
		layer = 1,
		x = 0,
		y = hud_panel:h() - ((2 * converts_h) + pad_large), --hud_panel:child("khud_region_panel"):y() - (converts_h + pad_medium),--
		w = converts_w,
		h = converts_h
	})
	--[[
	todo:
	- start hidden, set visible on convert joker
	- show keepers/enemy type nametag
	- show kills
	- show hp
	
	--]]
	self._khud_converts_panel = khud_converts_panel
	local debug_text = khud_converts_panel:text({
		name = "debug_text",
		layer = 1,
		color = Color.yellow,
		font = ammo_font,
		align = "center",
		vertical = "center",
		font_size = 18,
		text = "debug: joker info here"
	})
	
	local debug_converts_panel = khud_converts_panel:rect({
		name = "debug_converts_panel",
		visible = debug_panels_visible,
		layer = 0,
		color = Color.yellow:with_alpha(0.3)
	})
	
	return khud_converts_panel
end

function HUDTeammate:_create_khud_hostages() 
	--value is set from hudassaultcorner
	local hud_panel = self._khud_player
	local hostages_w = 36
	local hostages_h = 36
	
	local khud_hostages_panel = hud_panel:panel({
		name = "khud_hostages_panel",
		layer = 1,
		x = 420 + pad_small,
		y = 12,
		w = hostages_w,
		h = hostages_h + 24
	})
	self._khud_hostages_panel = khud_hostages_panel
	local hostages_box = khud_hostages_panel:panel({
		name = "hostages_box",
		layer = 1,
		w = hostages_w,
		h = hostages_h
	})
	local icon_scale = 0.5
	local hostages_icon = hostages_box:bitmap({ --screw you guys, i'll make my own hostages panel! with blackjack! and hookers!
		texture = "guis/textures/pd2/hud_icon_hostage",
		name = "hostages_icon",
		layer = 1,
		w = hostages_w * icon_scale,
		h = hostages_h * icon_scale,
		x = (hostages_w * icon_scale) / 2,
		y = (hostages_h * icon_scale) / 2,
		valign = "center",
		halign = "center"
	})
	
	local hostages_outline = panel_border(hostages_box,{
		thickness = 2,
		layer = 2
	})
	
	local num_hostages = khud_hostages_panel:text({
		name = "num_hostages",
		layer = 3,
		vertical = "bottom",
		align = "center",
		Color = Color.white,
		font = ammo_font,
		font_size = 22,
		text = "0"
	})
	local hostages_rect = hostages_box:rect({
		name = "hostages_rect",
		layer = 0,
		color = Color.black:with_alpha(0.3)
	})
	local debug_hostages_rect = khud_hostages_panel:rect({
		name = "debug_hostages_rect",
		visible = debug_panels_visible,
		layer = 0,
		color = Color.red:with_alpha(0.3)
	})
	return khud_hostages_panel
end

function HUDTeammate:_create_khud_ties()
	local hud_panel = self._khud_player
	local base_size = 36
	local ties_fontsize = 24
	local ties_scale = self._main_player and 1 or 0.75
	local ties_w = ties_scale * base_size
	local ties_h = ties_scale * base_size
	local icon_scale = 0.65 --distinct from ties scale
	local texture, rect = tweak_data.hud_icons:get_icon_data(tweak_data.equipments.specials.cable_tie.icon)	
	
	local khud_ties_panel = hud_panel:panel({
		name = "khud_ties_panel",
		layer = 2,
		visible = debug_panels_visible,
		x = 50, --self._khud_hostages_panel:x() + (ties_h + pad_small),
		y = 200, --self._khud_hostages_panel:y(),
		w = ties_w,
		h = ties_h + 24
	})
	self._khud_ties_panel = khud_ties_panel
	
	local ties_bg = khud_ties_panel:panel({
		name = "ties_bg",
		layer = 0,
		w = ties_w,
		h = ties_h,
	})

	local ties_border = panel_border(ties_bg,{
		thickness = 2,
		alpha = 0.7,
		blend_mode = "add"
	})	
	
	local ties_rect = ties_bg:rect({
		name = "ties_rect",
		layer = 0,
		color = Color.black:with_alpha(0.3)
	})
	
	local ties_icon = khud_ties_panel:bitmap({
		name = "ties_icon",
		layer = 3,
		visible = debug_panels_visible,--is set visible after load
		texture = texture,
		texture_rect = rect,
		color = Color.white,
		w = ties_w * icon_scale,
		h = ties_h * icon_scale,
		x = (ties_w * icon_scale) / 2,
		y = (ties_h * icon_scale) / 2
	})

	local ties_amount = khud_ties_panel:text({
		name = "ties_amount",
		layer = 4,
		visible = debug_panels_visible, --is set visible after load
		vertical = "bottom",
		font_size = ties_fontsize * ties_scale,
		align = "center",
		font = ammo_font,
		text = "0",
		color = Color.white
	})

	local debug_ties_rect = khud_ties_panel:rect({
		name = "debug_ties_rect",
		visible = debug_panels_visible,
		layer = 0,
		color = Color.purple:with_alpha(0.3)
	})
	return khud_ties_panel
end

function HUDTeammate:_layout_khud_ties(params)
	local ties_panel = self._khud_ties_panel
	
	local settings = KineticHUD:GetSettings()
	params = params or {}

	local x = params.x
	local y = params.y
	local w = params.w
	local h = params.h	
	

	if self._id == HUDManager.PLAYER_PANEL then
		if not KineticHUD:HUD_Enabled_Player() then 
			ties_panel:hide()
			return
		else
			ties_panel:show()
			x = x or settings.panel_player_health_x or 64
			y = y or settings.panel_player_health_y or 500
			w = w or settings.panel_player_health_w or 256 --w/h is currently disabled
			h = h or settings.panel_player_health_h or 4
		end
	else --should not be called for teammates
		if not KineticHUD:HUD_Enabled_Team() then
--			ties_panel:hide()
			return
		else
--			ties_panel:show()
			x = x or settings.panel_team_health_x or 64
			y = y or settings.panel_team_health_y or 500
			w = w or settings.panel_team_health_w or 256 --w/h is currently disabled
			h = h or settings.panel_team_health_h or 4
		end
	end	
	
	local deployables_panel = self._khud_deployables_panel
	
	ties_panel:set_x(deployables_panel:right() + pad_small)
	ties_panel:set_y(deployables_panel:y() + pad_medium)
--	ties_panel:set_x(x + 90)
--	ties_panel:set_y(y + 50)
	ties_panel:child("ties_icon"):set_center(ties_panel:w() / 2,ties_panel:w() / 2)
--	ties_panel:child("ties_amount"):set_x(x)
--	ties_panel:child("ties_amount"):set_y(y)
--	ties_panel:set_w(w)
--	ties_panel:set_h(h)
end

function HUDTeammate:_create_khud_buffs()
	local hud_panel = managers.hud._khud_buffs_master --self._khud_player
	local buffs_w = 400
	local buffs_h = 300
	
	local khud_buffs_panel = hud_panel:panel({
		name = "khud_buffs_panel",
		layer = 1,
		x = 32,
		y = hud_panel:h() - (buffs_h + 176), --todo top of health panel
		w = buffs_w,
		h = buffs_h
	})
	
	
	local debug_buffs = khud_buffs_panel:rect({
		name = "debug_buffs",
		visible = debug_panels_visible,
		layer = 0,
		color = Color.yellow:with_alpha(0.3)
	})
	self._khud_buffs_panel = khud_buffs_panel
	return khud_buffs_panel
end

function HUDTeammate:_layout_khud_buffs(params)
	local buffs_panel = self._khud_buffs_panel
	
	local settings = KineticHUD:GetSettings()
	params = params or {}

	local x = params.x
	local y = params.y
	local show_debug = params.show_debug or false --does nothing currently
	
	if KineticHUD:UseBuffsCustomXY() then 
		x = x or settings.panel_buffs_x or 32
		y = y or settings.panel_buffs_y or 500
	else
		x = 32
		y = managers.hud._khud_buffs_master:h() - (300 + 176)
	end
	buffs_panel:child("debug_buffs"):set_visible(show_debug)
	buffs_panel:set_x(x)
	buffs_panel:set_y(y)
end

function HUDTeammate:_create_khud_stamina()
	local hud_panel = self._khud_player
--todo allow setting to vertical bar
	local stamina_max_w = 256
	local stamina_max_h = 18
	local stamina_inset = 3
	
	local bar_stamina_panel = hud_panel:panel({
		name = "bar_stamina_panel",
		layer = 0,
		x = (hud_panel:w() / 2) - (stamina_max_w / 2),
		y = hud_panel:h() - (stamina_max_h + pad_medium),
		w = stamina_max_w,
		h = stamina_max_h,
		alpha = 0, --updated with set_stamina
		visible = true
	})
	local bar_stamina_label = bar_stamina_panel:text({
		name = "bar_stamina_label",
		align = "center",
		vertical = "center",
		y = pad_small / 2,
		layer = 1,
		font_size = 24,
		color = Color.white:with_alpha(0.7),
		font = font_medium_shadow_mf,
		text = "S T A M I N A" --B U L L E T
	})
	local bar_stamina_rect = bar_stamina_panel:rect({
		name = "bar_stamina_rect",
		layer = 0,
		x = stamina_inset / 2,
		y = stamina_inset / 2,
		w = stamina_max_w - (stamina_inset), 
		h = stamina_max_h - (stamina_inset),
		color = Color.white:with_alpha(0.7)
	})
	
	local stamina_border = panel_border(bar_stamina_panel,{
		thickness = 0.75,
		layer = 2
	})
	self._khud_stamina = bar_stamina_panel
	return bar_stamina_panel
	
end

function HUDTeammate:_create_khud_debug_info()
	local hud_panel = self._khud_player
	
	local debug_slots = 10
	
	local debug_w = 300
	local debug_h = 300
	
	local debug_info = hud_panel:panel({
		name = "debug_info",
		layer = 6,
		x = (hud_panel:w() / 2) + 50,
		y = (hud_panel:h() / 2) - (debug_h / 3),
		w = debug_w,
		h = debug_h
	})
	self._khud_debug_info = debug_info
	
	local value = debug_info:text({
		name = "value",
		align = "left",
		y = 75,
		layer = 3,
		font_size = 24,
		color = Color.blue:with_alpha(0.5),
		font = ammo_font,
		text = ""		
	})
	
	local coords = debug_info:text({
		name = "coords",
--		align = "right",
		layer = 6,
		font_size = 24,
		color = Color(1,0.74,0):with_alpha(0.3),
		font = ammo_font, --
		text = ""
	})

	for i = 1,debug_slots do 

		newtext = debug_info:text({
			name = "debug_slot_" .. tostring(i),
			y = 16 * i,
			layer = 3,
			color = Color(1,1,1):with_alpha(1),
			font = ammo_font,
			font_size = 16,
			text = ""
		})
	end
	
	local look_dir = debug_info:text({
		name = "look_dir",
		y = 40,
		layer = 6,
		font_size = 16,
		color = Color(1,0.74,0):with_alpha(0.3),
		font = ammo_font, --
		text = ""
	})
	local debug_rect = debug_info:rect({
		name = "debug_rect",
		visible = debug_panels_visible,
		color = Color.red:with_alpha(0.5)
	})
	return debug_info
end

function HUDTeammate:_create_khud_compass()
local compass_color = Color("2EA1FF") --halo reach anyone?
	local function get_cardinal(angle)
		local cardinal = {
			["0"] = "N",
			["45"] = "NW",
			["90"] = "W",
			["135"] = "SW",
			["180"] = "S",
			["225"] = "SE",
			["270"] = "E",
			["315"] = "NE",
			["360"] = "N"		
		}
		return cardinal[angle] or tostring(angle)
	end
	
	local hud_panel = self._khud_player
	local mul = 2
	local degrees = 360
	local compass_w = hud_panel:w() * mul
	local compass_h = 16
	local compass_y = hud_panel:h() - (compass_h * 2)
	
	local tick_margin = compass_w / (degrees * mul)

	local compass_panel = hud_panel:panel({
		name = "compass_panel",
		visible = true,
		layer = 0,
		x = 0,
		y = compass_y,
		w = compass_w
	})
	
	local compass_strip = compass_panel:panel({
		name = "compass_strip",
		layer = 0,
		x = (hud_panel:w() - compass_w) / 2,
--		y = compass_y,
		h = compass_h * 2
	})
	
	local ticks = math.floor(compass_w / tick_margin)
	local alpha = 0.5
	for i = 0, ticks, 1 do 
		if (i % (degrees / 4)) == 0 then --90
			alpha = 1
			compass_strip:text({
				name = "direction_" .. tostring(i),
				color = compass_color,
				layer = 2,
				font = ammo_font,
				font_size = compass_h,
				x = (i * tick_margin) - 1,
				vertical = "bottom",
				alpha = alpha,
				text = get_cardinal(tostring(i % degrees))
			})
		elseif (i % (degrees / 8)) == 0 then --45
			alpha = 0.75
			compass_strip:text({
				name = "direction_" .. tostring(i),
				color = compass_color,
				layer = 2,
				font = ammo_font,
				font_size = compass_h * 0.75,
				x = (i * tick_margin) - 1,
				vertical = "bottom",
				alpha = alpha,
				text = get_cardinal(tostring(i % degrees))
			})
		elseif (i % (degrees / 24)) == 0 then --15
			alpha = 0.5
			compass_strip:text({
				name = "direction_" .. tostring(i),
				color = compass_color,
				layer = 2,
				font = ammo_font,
				font_size = compass_h * 0.5,
				x = (i * tick_margin) + 4,
				alpha = alpha,
				text = get_cardinal(tostring(i % degrees))
			})
		else
			alpha = 0.25
		end
		compass_strip:text({
			name = "tick_" .. tostring(i),
			color = compass_color,
			layer = 1,
			font = ammo_font,
			font_size = compass_h,
			x = i * tick_margin,
			alpha = alpha,
			text = "|"
		})
	end
	local backdrop = compass_panel:rect({
		name = "backdrop",
		layer = 0,
		blend_mode = "sub",
		color = Color.black:with_alpha(0.5),
	})
	
	local shine = compass_panel:gradient({
		name = "khud_compass_shine",
		layer = 1,
		blend_mode = "add",
		w = hud_panel:w(),
		h = compass_h,
		valign = "grow",
		gradient_points = {
			0,
			Color(0,1,1,1), --argb
			0.3,
			compass_color:with_alpha(0),
			0.5,
			compass_color:with_alpha(0.2),
			0.8,
			compass_color:with_alpha(0),
			1,
			Color(0,1,1,1)
		}
	})
	local debug_compass = compass_panel:rect({
		name = "debug_compass",
		visible = debug_panels_visible,
		color = Color.red:with_alpha(0.5)
	})
	
	self._khud_compass = compass_panel
	return compass_panel
end

function HUDTeammate:_create_khud_speaking()
	local hud_panel = self._khud_player
	local speaking = hud_panel:bitmap({
		name = "voice_indicator",
		texture = "guis/textures/pd2/jukebox_playing",
		texture_rect = {0, 0, 16, 16},
		color = self._peer_id and tweak_data.chat_colors[self._peer_id] or Color.white,
		layer = 5,
		x = 0, --32 for left of name
		y = 0,
		w = 16,
		h = 16,
		alpha = 0, --sets to 1 instantly on speaking, fades out to 0 over x seconds so that there's an indicator of who was just speaking
		visible = true
	})
	self._khud_voice_indicator = speaking
	return speaking
end

function HUDTeammate:_layout_khud_speaking()
	local speaking = self._khud_voice_indicator
	local health_panel = self._khud_health_panel
	speaking:set_x(health_panel:x())
	speaking:set_y(health_panel:y())
end

function HUDTeammate:_create_khud_scanner_left()
	local hud_panel = self._khud_player
	
	local scanleft_w = 128 + 64
	local scanleft_h = 128
	local item_size = 16
	
	local scanner_left_panel = hud_panel:panel({
		name = "khud_scanner_left",
		layer = 0,
		x = (hud_panel:w() / 2) - (scanleft_w + 0),
		y = (hud_panel:h() - scanleft_h) / 2,
		w = scanleft_w,
		h = scanleft_h
	})
	self._khud_scanner_left = scanner_left_panel
	local debug_scanleft = scanner_left_panel:rect({
		name = "debug_scanleft_rect",
		layer = 0,
		visible = debug_panels_visible,
		color = Color.red:with_alpha(0.3)
	})
		
	local scanner_left_label = scanner_left_panel:text({
		name = "scanner_left_label",
		layer = 3,
		Color = Color.white,
		font = ammo_font,
		vertical = "center",
		font_size = item_size,
		align = "right",
		text = ""
	})
	
	local scanner_left_icon = scanner_left_panel:bitmap({
		name = "scanner_left_icon",
		layer = 0,
		x = 0,
		y = (scanner_left_panel:h() - item_size) / 2,
		texture = "guis/textures/pd2/hud_progress_32px",
		blend_mode = "add",
		rotation = 0, --only used for tripmines
		visible = true,
		color = Color.white,
		w = item_size,
		h = item_size
	})
	
	return scanner_left_panel
end

function HUDTeammate:_create_khud_scanner_right()
	local hud_panel = self._khud_player
	
	local scanright_w = 128 + 64
	local scanright_h = 128
	
	local scanner_right_panel = hud_panel:panel({
		name = "khud_scanner_right",
		layer = 0,
		x = (hud_panel:w() / 2) + 0,
		y = (hud_panel:h() - scanright_h) / 2,
		w = scanright_w,
		h = scanright_h
	})
	
	local scannerlabel = scanner_right_panel:text({
		name = "scanner_label",
		layer = 3,
		Color = Color.white,
		font = ammo_font,
		visible = debug_panels_visible,
		font_size = 22,
		align = "left",
		text = "right"
	})
	self._khud_scanner_right = scanner_right_panel
	
	local ecm_texture = tweak_data.hud_icons.equipment_ecm_jammer.texture
	local ecm_rect = tweak_data.hud_icons.equipment_ecm_jammer.texture_rect
	local ecm_x
	local progress
	local newtext,newicon
	for i = 0,7 do 
		progress = (i + 1) / 7
		ecm_x = - 2 * math.pow(i - 3.5,2)

		newtext = scanner_right_panel:text({
			name = "scanner_right_label_" .. tostring(i),
			x = 72 + ecm_x,--128 - (64 * ram),
--			x = 128 * (0.5 + math.cos(progress * math.pi * 2)) * 0.5,
--			x = 128 * ((1 + math.cos(math.pi * (i/6))) / 2),
			y = 16 * i,
			layer = 3,
			color = Color(math.random(),math.random(),math.random()):with_alpha(1),
--			Color = Color.white,
			font = ammo_font,
			font_size = 16,
			visible = false,
--			align = "right",
			text = i .. "."
		})
		newicon = scanner_right_panel:bitmap({
			texture = ecm_texture,
			texture_rect = ecm_rect,
			name = "scanner_right_icon_" .. i,
			layer = 1,
			x = 72 + - 16 + ecm_x,
			y = 16 * i,
			w = 16,
			h = 16,
			visible = false,
			valign = "center",
			halign = "center"	
		})
	
	end
	
	
	local debug_scanright = scanner_right_panel:rect({
		name = "debug_scanright_rect",
		layer = 0,
		visible = debug_panels_visible,
		color = Color.blue:with_alpha(0.3)
	})
	
	return scanner_right_panel
end

function HUDTeammate:_create_khud_downcounter() --no longer used
	local hud_panel = self._khud_player
	--todo diamond outline, not solid diamond
	local revives_diamond_size = 32
	local downs_fontsize = 24
	local downs_panel = hud_panel:panel({
		name = "downs_panel",
		x = 300,
		y = 200
	})
	local text_revives = downs_panel:text({
		name = "text_revives",
		layer = 3,
		font_size = downs_fontsize,
		color = Color.white,
		font = "fonts/font_medium_shadow_mf",
		text = "99"
	})
	local icon_revives = downs_panel:bitmap({
		name = "icon_revives",
		layer = 1,
		rotation = 45,
		texture = pixel_texture,
		color = tweak_data.chat_colors[self._peer_id or 5],
		texture_rect = pixel_rect,
		w = revives_diamond_size / 2,
		h = revives_diamond_size / 2
	})
	
	self._khud_downcounter_panel = downs_panel
	
	return downs_panel
end


function HUDTeammate:_create_khud_team_weapons() --for teammates? currently unused
	local hud_player = self._khud_player
	local khud_weapons_panel = hud_player:panel({
		name = "khud_weapons_panel"
	})
	self._khud_weapons_panel = khud_weapons_panel
	return khud_weapons_panel
end


--[[
--todo also use this to set grenade icon just to be sure?
Hooks:PostHook(HUDTeammate,"set_ability_icon","khud_set_ability_icon",function(self,icon)
	KineticHUD:c_log("set_ability_icon " .. tostring(icon))
	local condition = self._khud_condition
	local condition_icon = condition:child("condition_icon")
	local condition_diamond = condition:child("condition_diamond")
	local texture, texture_rect = tweak_data.hud_icons:get_icon_data(icon, {
		0,
		0,
		32,
		32
	})
	condition_icon:set_image(texture, unpack(texture_rect))
end)
--]]
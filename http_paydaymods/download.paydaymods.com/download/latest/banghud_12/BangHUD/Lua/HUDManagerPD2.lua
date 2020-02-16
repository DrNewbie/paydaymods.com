BangHUD:DoLuaFile("HUDBangHUD")

local _setup_player_info_hud_pd2_original = HUDManager._setup_player_info_hud_pd2
local set_teammate_health_original = HUDManager.set_teammate_health
local set_teammate_armor_original = HUDManager.set_teammate_armor
local set_teammate_custom_radial_original = HUDManager.set_teammate_custom_radial
local set_teammate_ability_radial_original = HUDManager.set_teammate_ability_radial
local set_teammate_condition_original = HUDManager.set_teammate_condition
local on_downed_original = HUDManager.on_downed
local on_arrested_original = HUDManager.on_arrested

function HUDManager:_setup_player_info_hud_pd2(...)
	_setup_player_info_hud_pd2_original(self, ...)
	self._hud_banghud = HUDBangHUD:new(managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2))
end

function HUDManager:set_teammate_health(i, data, ...)
	set_teammate_health_original(self, i, data, ...)
	if i == HUDManager.PLAYER_PANEL then
		self._hud_banghud:set_health(data)
	end
end

function HUDManager:set_teammate_armor(i, data, ...)
	set_teammate_armor_original(self, i, data, ...)
	if i == HUDManager.PLAYER_PANEL then
		self._hud_banghud:set_armor(data)
	end
end

function HUDManager:set_teammate_condition(i, ...)
	set_teammate_condition_original(self, i, ...)
	if i == HUDManager.PLAYER_PANEL then
		self._hud_banghud:update_status()
	end
end

function HUDManager:on_downed(...)
	on_downed_original(self, ...)
	self._hud_banghud:update_status()
end

function HUDManager:on_arrested(...)
	on_arrested_original(self, ...)
	self._hud_banghud:update_status()
end

-- This function was originally written by "GREAT BIG BUSHY BEARD" a.k.a. "Simon".
-- It is taken from his "Swan Song Effect" mod from here: https://modworkshop.net/mydownloads.php?action=view_down&did=681
-- I (BangL) just optimized the code style a little, so it fits my personal taste.
function HUDManager:set_teammate_custom_radial(i, data, ...)
	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_FULLSCREEN_PD2)
	local swan_song_left = hud.panel:child("swan_song_left")
	if not alive(swan_song_left) then
		swan_song_left = hud.panel:bitmap({
			name = "swan_song_left",
			visible = false,
			texture = "guis/textures/alphawipe_test",
			layer = 0,
			color = Color(0, 0.7, 1),
			blend_mode = "add",
			w = hud.panel:w(),
			h = hud.panel:h(),
			x = 0,
			y = 0
		})
	end
	if i == HUDManager.PLAYER_PANEL and alive(swan_song_left) then
		if data.current < data.total and data.current > 0 then
			swan_song_left:set_visible(true)
			swan_song_left:set_alpha(BangHUD:GetOption("swan_song_intensity"))
			local hudinfo = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
			swan_song_left:animate(hudinfo.flash_icon, 4000000000)
			self._hud_banghud:update_status()
		else
			swan_song_left:stop()
			swan_song_left:set_visible(false)
		end
	end
	return set_teammate_custom_radial_original(self, i, data, ...)
end

-- This function was originally written by "GREAT BIG BUSHY BEARD" a.k.a. "Simon"
-- and then got changed to work as kingpin injector effect by "centumetocto".
-- It is taken from the "KingPin Injector Effect" mod from here: https://modworkshop.net/mydownloads.php?action=view_down&did=20132
-- I (BangL) just optimized the code style a little, so it fits my personal taste.
function HUDManager:set_teammate_ability_radial(i, data, ...)
	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_FULLSCREEN_PD2)
	local chico_injector_left = hud.panel:child("chico_injector_left")
	if not alive(chico_injector_left) then
		chico_injector_left = hud.panel:bitmap({
			name = "chico_injector_left",
			visible = false,
			texture = "guis/textures/alphawipe_test",
			layer = 0,
			color = Color(1, 0.6, 0),
			blend_mode = "add",
			w = hud.panel:w(),
			h = hud.panel:h(),
			x = 0,
			y = 0
		})
	end
	if i == HUDManager.PLAYER_PANEL and alive(chico_injector_left) then
		if data.current < data.total and data.current > 0 then
			chico_injector_left:set_visible(true)
			chico_injector_left:set_alpha(BangHUD:GetOption("chico_injector_intensity"))
			local hudinfo = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
			chico_injector_left:animate(hudinfo.flash_icon, 4000000000)
		else
			chico_injector_left:stop()
			chico_injector_left:set_visible(false)
		end
	end
	return set_teammate_ability_radial_original(self, i, data, ...)
end
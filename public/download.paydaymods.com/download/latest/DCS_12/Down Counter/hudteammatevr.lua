--literally just copypasted everything from the flatscreen hudteammate.lua and added "vr" to every instance of HUDTeammate and hookids
--i'm pretty lazy
--this is unused right now

Hooks:PostHook(HUDTeammateVR,"init","dcs_hudteammate_init_vr",function(self,i,teammates_panel,is_player,width)
	local max_downs = Global.game_settings.one_down and 2 or tweak_data.player.damage.LIVES_INIT --4
	max_downs = managers.modifiers:modify_value("PlayerDamage:GetMaximumLives", max_downs)
--	max_downs = managers.crime_spree:modify_value("PlayerDamage:GetMaximumLives", max_downs) --non exclusive to difficulty modifiers that force one down, like pre-balance One Down
	DownCounterStandalone.global_max_downs = max_downs

end)

function HUDTeammateVR:_set_downs_amount_string(text,amount) --custom function so that i can set color myself
	if not text then
		return
	end
	if not DownCounterStandalone:IsHUDEnabled() then
		text:set_text("")
		return
	else
		local col = (amount and tonumber(amount) > 1 and Color.white:with_alpha(0.6)) or Color.red:with_alpha(0.8)
		amount = (amount and tostring(amount) == "-1" and "DEAD") or amount or ""
		text:set_text(amount)
		
		text:set_range_color(0,string.len(tostring(amount)),col) --I have no idea what I'm doing
	end
end
--[[
Hooks:PostHook(HUDTeammate,"add_special_equipment","decu_spec_eq_hud",function(self,data)
	OffyLib:c_log("Printing hud equipment data to console...")
	PrintTable(data)
end)
Hooks:PostHook(HUDTeammate,"remove_special_equipment","decu_rem_spec_eq_hud",function(self,name)
	OffyLib:c_log("Removed [" .. tostring(name) .. "] from hud equipment")
end)
--]]

Hooks:PostHook(HUDTeammateVR,"set_player_health","dcs_hudteammate_setplayerhealth_vr",function(self,data)
	local radial_health_panel = self._radial_health_panel
	local radial_health = radial_health_panel:child("radial_health")
	local downs_field = radial_health_panel:child("downs")
	self:_set_downs_amount_string(downs_field,data.revives)
	
--	local kevlar_icon = radial_health_panel:child("kevlar_icon")
--	kevlar_icon:set_visible(managers.player:has_kevlar_plates())
end)


Hooks:PostHook(HUDTeammateVR,"set_health","dcs_hudteammate_sethealth_vr",function(self,data)
	local radial_health_panel = self._radial_health_panel
	local radial_health = radial_health_panel:child("radial_health")
	local downs_field = radial_health_panel:child("downs")		
	
	if self._main_player then
--		local peerid = LuaNetworking:LocalPeerID() or 420	--no longer needed; game already has "revives" stat ready. how convenient 
		data.revives = data.revives or -1
	elseif data.no_hint then
		data.revives = -1 --ded
	else
		local peerid = self:peer_id() or 420
		local revives_left = 0
		local max_downs = DownCounterStandalone.global_max_downs or 4
		local downs = DownCounterStandalone.counter[peerid]
		if not downs then
			DownCounterStandalone.counter[peerid] = 0
			downs = DownCounterStandalone.counter[peerid]
		else
			revives_left = ((max_downs - downs) or revives_left) + DownCounterStandalone.nine_lives[peerid]
		end

		if data then
			data.revives = revives_left or data.revives
		end
	end
	self:_set_downs_amount_string(downs_field,data.revives)
	
--	local kevlar_icon = radial_health_panel:child("kevlar_icon")
--	kevlar_icon:set_visible(managers.player:has_kevlar_plates())
end)


Hooks:PostHook(HUDTeammateVR,"_create_radial_health","dcs_hudteammate_createradialhealth_vr",function(self,radial_health_panel)
	self._radial_health_panel = self._radial_health_panel or radial_health_panel
	local tabs_texture = "guis/textures/pd2/hud_tabs"
	local bg_color = Color.white/3
--[[
	local kevlar_icon = self._radial_health_panel:bitmap({
		name = "kevlar_icon",
		layer = 2,
--		x = radial_health_panel:x(),
--		y = radial_health_panel:y(),
--		y = 1,
--		alpha = 0.5,
		visible = true,
--		x = 1,
		align = "center",
		vertical = "center",
		texture = "guis/textures/pd2/hud_buff_shield",
		w = radial_health_panel:w(),
		h = radial_health_panel:h(),
		texture_rect = {
			64,
			0,
			-64,
			64
		},
		color = Color(0.2,0.6,0.8)--Color.white
	})
	--]]
	local downcounter_panel = self._radial_health_panel:text({ --create a subpanel of health to hold #of downs
		name = "downs", --id for reference
		vertical = "center",
		font_size = 22,
		align = "center",
		text = ";)", --almir wishes you good rng
		font = "fonts/font_medium_mf",
		layer = 1,
		visible = true,
		color = Color.white,
		w = radial_health_panel:w(),
		h = radial_health_panel:h()
	})
end)
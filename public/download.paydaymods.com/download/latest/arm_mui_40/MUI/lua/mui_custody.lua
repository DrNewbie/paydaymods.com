--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.MUICustody = _G.MUICustody or class();

local fade, flash, format_time = ArmStatic.fade_animate, ArmStatic.flash_animate, ArmStatic.format_time;

function MUICustody:init(hud)
	self.load_options();
	hud = hud or managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2);
	local local_id = ArmStatic.tunnel(managers, "network", "session", "local_peer", "id") or 1;
	local crim_color = tweak_data.chat_colors[local_id];
	self._prime_color = crim_color;
	local muiFont = ArmStatic.font_index(self._muiFont);
	local panel = hud.panel:panel({
		name = "custody_panel",
		visible = false
	});
	self._visible = false;
	self._last_res_chr = 0;
	self._last_trd_chr = 0;
	self._panel = panel;
	self._hud_panel = hud.panel;
	self._title = panel:text({
		name = "title",
		font = muiFont,
		text = utf8.to_upper(managers.localization:text("menu_spectator_being_traded_hesitant")),
		layer = 0
	});

	local info_list = AnimatedList:new(panel, {align = 1});
	self._info_list = info_list;

	local civ_panel = info_list:panel({
		name = "civilian_panel",
		visible = false
	});
	self._civ_panel = civ_panel;
	self._civ_text = civ_panel:text({
		name = "text",
		font = muiFont,
		text = utf8.to_upper(managers.localization:text("hud_civilians_killed", {AMOUNT = ""})),
		layer = 0
	});
	self._civ_amount = civ_panel:text({
		name = "amount",
		font = muiFont,
		text = "00",
		layer = 0
	});

	local trd_panel = info_list:panel({
		name = "trade_panel",
		visible = false
	});
	self._trd_panel = trd_panel;
	self._trd_text = trd_panel:text({
		name = "text",
		font = muiFont,
		text = utf8.to_upper(managers.localization:text("hud_trade_delay", {TIME = ""})),
		layer = 0
	});
	self._trd_chr = trd_panel:text({
		name = "chronos",
		font = muiFont,
		text = "00:00",
		layer = 0
	});

	local res_panel = info_list:panel({
		name = "respawn_panel",
		visible = false
	});
	self._res_panel = res_panel;
	self._res_text = res_panel:text({
		name = "text",
		font = muiFont,
		text = utf8.to_upper(managers.localization:text("hud_respawning_in") .. ": "),
		layer = 0
	});
	self._res_chr= res_panel:text({
		name = "chronos",
		font = muiFont,
		text = "00:00",
		layer = 0
	});
		
	-- Compatibility with IngameWaitingForRespawnState._upd_hud_watch_character_name
	local spechud = managers.hud:script(Idstring("guis/spectator_mode"));
	spechud.text_title = spechud.panel:text({name="text_title", visible = false, alpha = 0});
	--
		
	self:resize();
	panel:set_alpha(0);
end

function MUICustody:test_animate()
	local a = 0;
	while true do
		a = a + 1;
		local t = 0;
		while t < 2 do
			t = t + coroutine.yield();
		end
		local rand = math.random();
		if rand <= 0.20 then
			managers.hud:set_custody_timer_visibility(false)
		elseif rand <= 0.40 then
			managers.hud:set_custody_timer_visibility(true)
			managers.hud:set_custody_respawn_type(true)
			managers.hud:set_custody_respawn_time(math.random()*30);

		elseif rand <= 0.60 then
			managers.hud:set_custody_respawn_type(false)
			managers.hud:set_custody_respawn_time(math.random()*30)
		elseif rand <= 0.80 then
			managers.hud:set_custody_civilians_killed(math.random()*80)
			managers.hud:set_custody_trade_delay(math.random()*180)
		else
			managers.hud:set_custody_negotiating_visible(false)
			managers.hud:set_custody_trade_delay_visible(false)
		end
	end
end


function MUICustody:set_timer_visibility(visible)
	if self._timer_visible == visible then return; end
	self._timer_visible = visible;

	self._info_list:set_visible_panel(self._res_panel, visible);
end

function MUICustody:set_delay_visibility(visible)
	if self._delay_visible == visible then return; end
	self._delay_visible = visible;

	self._info_list:set_visible_panel(self._trd_panel, visible);
end

function MUICustody:set_trade_state(state)
	if self._state == state then return; end
	self._state = state;

	local id = state and "menu_spectator_being_traded" or "menu_spectator_being_traded_hesitant";
	self._title:set_text(managers.localization:to_upper_text(id));
end

function MUICustody:set_respawn_time(time)
	time = math.floor(time);
	if time == self._last_res_chr then return; end

	self._last_res_chr = time;
	self._res_chr:set_text( format_time(time) );
	self:set_timer_visibility(time > 0);
	self:eval_visible();
end
function MUICustody:set_trade_delay(time)
	time = math.floor(time);
	if time == self._last_trd_chr then return; end

	self._last_trd_chr = time;
	self._trd_chr:set_text( format_time(time) );
	self:set_delay_visibility(time > 0);
	self:set_trade_state(time == 0);
	self:eval_visible();
end

function MUICustody:set_civilians_killed(amount)
	self._civ_amount:set_text(string.format("%02d", amount));
	self._info_list:set_visible_panel(self._civ_panel, amount > 0);
end

function MUICustody:show(instant)
	self._panel:stop();
	self._title:stop();
	if not instant then flash(self._title, 0.8, -1) end
	fade(self._panel, self._muiAlpha, instant and 0 or 2);
end
function MUICustody:hide(instant)
	self._panel:stop();
	self._title:stop();
	if not instant then fade(self._title, 1); end
	fade(self._panel, 0, instant and 0 or 8);
end
function MUICustody:set_visible(visible, instant)
	self._visible = visible;
	if visible then self:show(instant); else self:hide(instant); end
end
function MUICustody:eval_visible(instant)
	local eval = self._last_trd_chr + self._last_res_chr > 0;
	if eval ~= self._visible then
		self:set_visible(eval, instant);
	end
end

function MUICustody.load_options(force_load)
	if MUICustody._options and not force_load then return; end
	
	local data = MUIMenu._data;
	MUICustody._muiSize = data.mui_custody_size or 60;
	MUICustody._muiAlpha = (data.mui_custody_alpha or 100)*0.01;
	MUICustody._muiHMargin = data.mui_custody_h_marg or 60;
	MUICustody._muiVMargin = data.mui_custody_v_marg or 60;
	MUICustody._muiHPos = data.mui_custody_h_pos or 1;
	MUICustody._muiVPos = data.mui_custody_v_pos or 2;
	MUICustody._muiFont = data.mui_font_pref or 4;
	MUICustody._options = true;
end

function MUICustody:resize()
	local size = self._muiSize;
	local alpha = self._muiAlpha;
	local s400 = size*4;
	local s33 = size/3;
	local hMargin = self._muiHMargin;
	local vMargin = self._muiVMargin;
	local hPos = self._muiHPos;
	local vPos = self._muiVPos;
	
	local sp = self._panel;
		local spt = self._title;
		local spil = self._info_list;
			local spcp = self._civ_panel;
			local sptp = self._trd_panel;
			local sprp = self._res_panel;

	-- Scale panel title.
	Figure(spt):shape(s400, size/2.5);
	
	-- Scale text children of civ, trade and respawn panels and adapt them to fit all children.
	local function rtl(fgr, _, s)
		fgr:rect(s33):attach(s, 2);
	end
	Figure(spcp):progeny(rtl):adapt();
	Figure(sptp):progeny(rtl):adapt();
	Figure(sprp):progeny(rtl):adapt();
	
	-- Adapt info list to fit all children (civ, trade, respawn panels), attach to bottom of title.
	-- Reposition all children in info list (AnimatedList).
	Figure(spil):adapt():attach(spt, 3); 
	spil:reposition();
	
	-- Set alpha of panel, adapt to fit all children (title, info list), align according to options.
	Figure(sp):view(alpha):adapt():align(hPos, vPos, hMargin, vMargin);
end

function MUICustody.resize_all()
	local mui_custody = managers.hud._hud_player_custody;
	if not mui_custody then
		return;
	end
	MUICustody.load_options(true);
	mui_custody:resize();
	ArmStatic.align_corners(mui_custody._panel);
end

function MUICustody.toggle_layer(force_state)
	local mui_custody = managers.hud._hud_player_custody;
	if not mui_custody then
		return;
	end
	local panel = mui_custody._panel;
	
	if force_state == false or panel:layer() > 0 then
		if not mui_custody._visible then mui_custody:hide(true); end
		ArmStatic.remove_corners(panel);
		panel:set_layer(0);
	else
		if not mui_custody._visible then mui_custody:show(true); end
		ArmStatic.create_corners(panel);
		panel:set_layer(1200);
	end
end

function MUICustody:set_respawn_type(ai_trade)
	if self._last_ai_trade ~= ai_trade then
		self._res_text:set_text(utf8.to_upper(managers.localization:text(ai_trade and "hud_ai_traded_in" or "hud_respawning_in") .. ": "));
		self._last_ai_trade = ai_trade;
		self:resize();
	end
end

--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.MUIStats = _G.MUIStats or class();
ArmStatic.void(MUIStats, { "update" });
local tunnel = ArmStatic.tunnel;
local fade, fade_c = ArmStatic.fade_animate, ArmStatic.fade_c_animate;
local lerp, sin, abs, floor = math.lerp, math.sin, math.abs, math.floor;
local format, strlen = string.format, string.len;

function MUIStats:init()
	MUIStats.load_options();
	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_FULLSCREEN_PD2);
	local muiFont = ArmStatic.font_index(self._muiFont);
	self._mui_cor = ArmStatic.correction_index(self._muiFont);
	self._hud_panel = hud.panel;
	local panel = hud.panel:panel({
		name = "stats_panel",
		visible = false
	});
	self._panel = panel;
	self._colours = {
		ass =  managers.job:is_current_job_professional() and tweak_data.screen_colors.pro_color or tweak_data.screen_colors.risk,
		vip = Color(1, 0.43, 0.63, 0.8) };
	self._assault_mode = "normal";
	self._last_time = 0;
	self._last_host = 0;
	
	
	local top_panel = panel:panel({
		layer = 1,
		name = "top_panel"
	});
	self._top_panel = top_panel;
	self._heist_time = top_panel:text({
		layer = 2,
		name = "heist_time",
		color = Color.white,
		font = muiFont,
		text = "00:00"
	});
	local assault_panel = top_panel:panel({
		layer = 1,
		name = "assault_panel",
		visible = false
	});
	self._assault_panel = assault_panel;
		local skull_text = "";
		for i = 1, managers.job:current_difficulty_stars() do
			skull_text = skull_text .. managers.localization:get_default_macro("BTN_SKULL") .. " ";
		end
		assault_panel:text({
			name = "risk",
			font = tweak_data.menu.pd2_large_font, -- skull icon exists only in standard fonts
			text = skull_text,
			color = self._colours.ass
		});
		assault_panel:text({
			name = "title",
			font = muiFont,
			text = managers.localization:to_upper_text(tweak_data.difficulty_name_id),
			color = self._colours.ass
		});
		assault_panel:bitmap({
			name = "icon",
			texture = "guis/textures/pd2/hud_buff_shield",
			visible = false,
			color = self._colours.ass
		});

	local supplements = AnimatedList:new(top_panel, { align = 3, direction = 1, aspd = 1, margin = 12 });
	self._supplement_list = supplements;
	local hostages_panel = supplements:panel({
		layer = 1,
		name = "hostages_panel"
	});
	self._hostages_panel = hostages_panel;
	hostages_panel:bitmap({
		name = "icon",
		texture = "guis/textures/pd2/hud_icon_hostage"
	});
	hostages_panel:text({
		name = "amount",
		font = muiFont,
		text = " 0"
	});

	local bb_icon, bb_rect = tweak_data.hud_icons:get_icon_data("equipment_body_bag");
	bb_rect[2] = bb_rect[2] +1; bb_rect[4] = bb_rect[4] +1;
	local bodybags_panel = supplements:panel({
		layer = 1,
		name = "bodybags_panel"
	});
	self._bodybags_panel = bodybags_panel;
	bodybags_panel:bitmap({
		name = "icon",
		texture = bb_icon,
		texture_rect = bb_rect
	});
	bodybags_panel:text({
		name = "amount",
		font = muiFont,
		text = " 0"
	});
	local wave_panel = supplements:panel({
		layer = 1,
		name = "wave_panel",
		visible = false
	});
	self._wave_panel = wave_panel;
	wave_panel:bitmap({
		name = "icon",
		texture = "guis/textures/pd2/specialization/icons_atlas",
		texture_rect = { 196, 70, 52, 52 }
	});
	wave_panel:text({
		name = "amount",
		font = muiFont,
		text = "0/0"
	});
	local objectives_panel = panel:panel({
		layer = 1,
		name = "objectives_panel"
	});
	self._objectives_panel = objectives_panel;
	objectives_panel:text({
		name = "title",
		font = muiFont,
		color = Color.white,
		text = managers.localization:to_upper_text("dialog_wait"),
	});
	objectives_panel:text({
		name = "amount",
		font = muiFont,
		color = Color.white,
		text = " "
	});
	objectives_panel:text({
		name = "description",
		font = muiFont,
		color = Color.white,
		wrap = true,
		word_wrap = true,
		text = " "
	});
	local loot_panel = panel:panel({
		layer = 1,
		name = "loot_panel"
	});
	self._loot_panel = loot_panel;
	loot_panel:text({
		layer = 1,
		name = "title",
		color = Color.white,
		font = muiFont,
		text = utf8.to_upper(managers.localization:text("hud_secured_loot"))
	});
	
	local bag_panel = loot_panel:panel({ name = "bag_panel" });
	self._bag_panel = bag_panel;
	
	b_text, b_rect = tweak_data.hud_icons:get_icon_data("wp_bag");
	b_rect[2] = b_rect[2]-1;
	bag_panel:bitmap({
		name = "icon",
		texture = b_text,
		texture_rect = b_rect
	});
	bag_panel:text({
		name = "amount",
		font = muiFont,
		text = "0"
	});
	g_text, g_rect = tweak_data.hud_icons:get_icon_data("pd2_defend");
	g_rect[2] = g_rect[2]+1;
	loot_panel:bitmap({
		name = "gage_icon",
		texture = g_text,
		texture_rect = g_rect
	});
	loot_panel:text({
		name = "gage_text",
		font = muiFont,
		text = "G"
	});
	loot_panel:text({
		name = "gage_amount",
		font = muiFont,
		text = "0"
	});
	loot_panel:text({
		layer = 1,
		name = "text",
		color = Color.white,
		font = muiFont
	});
	self:resize();
	self:hide(true);
	self:load_state();
end

function MUIStats:load_state()
	local _, active_objective = next(tunnel(managers, "objectives", "get_active_objectives"));
	if active_objective then
		self:set_objective(active_objective);
	end
	local groupai_state = tunnel(managers, "groupai", "state");
	if groupai_state then
		self:on_whisper_mode_changed(groupai_state:whisper_mode());
		self:set_wave(0);
		groupai_state:add_listener("MUIStats_whisper_mode",
			{"whisper_mode"},
			callback(self, self, "on_whisper_mode_changed"));
		if groupai_state:get_assault_mode() then
			self:sync_start_assault(groupai_state:get_assault_number());
		end
	end
	
	local hook_function = function()
		setup:add_end_frame_clbk(callback(self, self, "loot_value_updated"));
	end
	Hooks:PostHook(GageAssignmentBase, "sync_pickup", "MUIStats_sync_pickup", hook_function);
	Hooks:PostHook(GageAssignmentManager, "activate_assignments", "MUIStats_act_ass", hook_function);
	Hooks:PostHook(LootManager, "set_mandatory_bags_data", "MUIStats_man_bags", hook_function);
end

function MUIStats.load_options(force_load)
	if MUIStats._options and not force_load then return; end
	
	local data = MUIMenu._data;
	MUIStats._muiSize = data.mui_stats_size or 60;
	MUIStats._muiWMul = data.mui_stats_wmul or 5;
	MUIStats._muiDir = data.mui_stats_dir or 1;
	MUIStats._muiAnim = data.mui_stats_origin or 4;
	MUIStats._muiASPD = (data.mui_stats_aspd or 200)*0.001;
	MUIStats._muiAlpha = (data.mui_stats_alpha or 100)*0.01;
	MUIStats._muiHMargin = data.mui_stats_h_marg or 60;
	MUIStats._muiVMargin = data.mui_stats_v_marg or 60;
	MUIStats._muiHPos = data.mui_stats_h_pos or 1;
	MUIStats._muiVPos = data.mui_stats_v_pos or 1;
	MUIStats._muiFont = data.mui_font_pref or 4;
	MUIStats._options = true;
end

local function line(fgr, p, s, size)
	if fgr:get("text_rect") then fgr:rect(size):attach(s, 2, size/3);
	else fgr:shape(size):attach(s, 2, size/3); end
end

function MUIStats:resize()
	local size = self._muiSize;
	local alpha = self._muiAlpha;
	local s33 = size/3;
	local wMul = self._muiWMul;
	local hMargin = self._muiHMargin;
	local vMargin = self._muiVMargin;
	local hPos = self._muiHPos;
	local vPos = self._muiVPos;
	
	local panel = self._panel;
		local top = self._top_panel;
			local time = self._heist_time;
			local assault = self._assault_panel;
			local supplements = self._supplement_list;
				local hostages = self._hostages_panel;
				local bodybags = self._bodybags_panel;
				local wave = self._wave_panel;
		local obj = self._objectives_panel;
		local loot = self._loot_panel;
			
			
	local width = size*wMul;
	
	-- top
	Figure(top):shape(width, s33);
	Figure(time):rect(s33);
	Figure(assault):progeny(line, s33):adapt():align(2, 1);
	Figure({hostages,bodybags,wave}):progeny(line, s33):adapt();
	Figure(supplements):shape(width, s33):align(3, 1); -- TODO: elude(assault)
	supplements:set_margin(size/7)
	supplements:reposition();
	-- objectives
	Figure(obj):shape(width, size*2):attach(top, 3);
	self:resize_objectives();
	-- loot
	Figure(loot):shape(width, s33*2):attach(obj, 3);
	self:resize_loot();
		
	Figure(panel):view(alpha):adapt(loot):align(hPos, vPos, hMargin, vMargin);
	self._real_x, self._real_y = panel:position();
end

function MUIStats:resize_objectives()
	local s33 = self._muiSize / 3;
	
	local obj = self._objectives_panel;
		local title = obj:child("title");
		local amount = obj:child("amount");
		local desc = obj:child("description");
		
	local width = obj:w();
	local indent = width * 0.05;
	
	Figure(title):rect(s33);
	Figure(amount):rect(s33):attach(title, 2, s33):fill();
	Figure(desc):shape(width - indent, size, s33):attach(title, 3):shift(indent);
end

function MUIStats:resize_loot()
	local s33 = self._muiSize/3;
	
	local loot = self._loot_panel;
		local secured = loot:child("title");
		local cash = loot:child("text");
		local bag = self._bag_panel;
		local gage = loot:child("gage_icon");
		local g = loot:child("gage_text");
		local packages = loot:child("gage_amount");
	
	local indent = loot:w() * 0.05;

	Figure(secured):rect(s33);
	Figure(cash):rect(s33):attach(secured, 2, s33):fill();
	Figure(bag):progeny(line, s33):adapt():attach(secured, 3):shift(indent);
	Figure(gage):shape(s33):attach(bag, 2, s33);
	Figure(g):rect(s33*0.5):leech(gage):align(2);
	Figure(packages):rect(s33):attach(gage, 2):fill();
end

function MUIStats.resize_all()
	MUIStats.load_options(true);
	local stats = managers.hud._hud_statsscreen;
	if not stats then
		return;
	end
	stats:resize();
	ArmStatic.align_corners(stats._panel);
end


function MUIStats.toggle_layer(force_state)
	local stats = managers.hud._hud_statsscreen;
	if not stats then
		return;
	end
	
	if force_state == false or stats._panel:layer() > 1 then
		stats:hide(true);
		ArmStatic.remove_corners(stats._panel);
		stats._panel:set_layer(1);
	else
		stats:show(true);
		ArmStatic.create_corners(stats._panel);
		stats._panel:set_layer(1200);
	end
end


function MUIStats:_animate(data)
	local panel = self._panel;
	local anim = MUIStats._muiAnim;
	local state = data[1];
	local instant = data[2];
	local real_x = self._real_x;
	local real_y = self._real_y;
	local anim_dir = {
		{real_x, -panel:h()},
		{self._hud_panel:w() + panel:w(), real_y},
		{real_x, self._hud_panel:h() + panel:h()},
		{-panel:w(), real_y}
	};
	local anim_x = anim_dir[anim][1];
	local anim_y = anim_dir[anim][2];
	
	local t = 0;
	local end_t = instant and 0 or MUIStats._muiASPD;
	if state then
		-- ANIMATE IN
		panel:show();
		t = anim % 2 == 0 and (panel:x()-anim_x)/(real_x-anim_x)*end_t or (panel:y()-anim_y)/(real_y-anim_y)*end_t;
		while t < end_t do
			panel:set_alpha(math.lerp(0, 1, t / end_t));
			panel:set_position(math.lerp(anim_x, real_x, t / end_t),math.lerp(anim_y, real_y, t / end_t));
			t = t + (coroutine.yield() * (1 / TimerManager:game():multiplier()));
		end
		panel:set_position(real_x, real_y);
		panel:set_alpha(1);
	else
		-- ANIMATE OUT
		t = anim % 2 == 0 and (panel:x()-real_x)/(anim_x-real_x)*end_t or (panel:y()-real_y)/(anim_y-real_y)*end_t;
		while t < end_t do
			panel:set_alpha(math.lerp(1, 0, t / end_t));
			panel:set_position(math.lerp(real_x, anim_x, t / end_t),math.lerp(real_y, anim_y, t / end_t));
			t = t + (coroutine.yield() * (1 / TimerManager:game():multiplier()));
		end
		panel:set_position(anim_x, anim_y);
		panel:set_alpha(0);
		panel:hide();
	end
end


function MUIStats:show(instant)
	self._panel:stop();
	self._panel:animate(callback(self, self, "_animate", {true, instant}));
end
function MUIStats:hide(instant)
	self._panel:stop();
	self._panel:animate(callback(self, self, "_animate", {false, instant}));
end

function MUIStats:set_objective(data)
	local panel = self._objectives_panel;
	local objective = managers.objectives:get_objective(data.id);
	
	self:set_objective_amount(data);
	panel:child("title"):set_text(utf8.to_upper(objective.text));
	panel:child("description"):set_text(objective.description);
	self:resize_objectives();
end

function MUIStats:set_objective_amount(data)
	local panel = self._objectives_panel;
	local amount, current = data.amount, data.current_amount;
	
	local text = amount and format("%d/%d", current or 0, amount) or "";
	panel:child("amount"):set_text(text);
end

function MUIStats:get_assault_mode()
	return self._assault_mode;
end

function MUIStats:sync_set_assault_mode(mode)
	if self._assault_mode == mode then return; end
	
	local colour = mode == "phalanx" and self._colours.vip or self._colours.ass;
	local panel = self._assault_panel;
	self._assault_mode = mode or "normal";
	fade_c(panel:child("risk"), colour, 1);
	fade_c(panel:child("title"), colour, 1);
	fade_c(panel:child("icon"), colour, 1);
end


-- I'm guessing they have/had ideas of implementing more buffs, but as of right now there's only the one.
-- buff_name is not even used in the original function.
function MUIStats:set_buff_enabled(buff_name, enabled)
	local icon = self._assault_panel:child("icon");
	if icon:visible() == enabled then return; end
	icon:set_alpha(enabled and 0 or 1);
	fade(icon, enabled and 1 or 0, 1);
end

function MUIStats:on_whisper_mode_changed(enabled)
	self._supplement_list:set_visible_panel(self._bodybags_panel, enabled);
end

function MUIStats:on_ext_inventory_changed()
	local text = self._bodybags_panel:child("amount");
	local bodybags = managers.player:get_body_bags_amount();
	if bodybags then text:set_text(bodybags); end
end

local function money_tweak(id, value)
	return tweak_data:get_value("money_manager", id, value);
end

------------
-- Over a dozen functions spread out across several managers, passing random values back n' forth, looping through the same data over and over.
-- Just to get the value of loot.
-- Untangling this net didn't make it 'at much prettier to the eye but least it's processable by human beings and doesn't waste triple the CPU cycles.
function MUIStats:loot_value_updated()
	local loot = self._loot_panel;
	local bag = self._bag_panel;
	local acquired = bag:child("amount");
	local cash = loot:child("text");
	local gage = loot:child("gage_amount");

	local job = managers.job;
	local global = managers.loot._global;
	local secured = global.secured;
	local carry = tweak_data.carry;
	local carry_id = global.mandatory_bags.carry_id;
	local mandatory =  global.mandatory_bags.amount or 0;
	local required, bonus = 0, 0;
	local total_value = 0;
	local packages, remaining = self:count_gage_units();
	
	local stars = job:has_active_job() and job:current_difficulty_stars() or 0;
	local bag_mul = managers.player:upgrade_value("player", "secured_bags_money_multiplier", 1) / money_tweak("offshore_rate");
	local bonus_mul = money_tweak("difficulty_multiplier", stars + 1) or 1;
	
	for _, data in ipairs(secured) do
		local value = carry.small_loot[data.carry_id];
		if not value then
			value = money_tweak("bag_values", carry[data.carry_id].bag_value or "default");
			if (carry_id == "none" or carry_id == data.carry_id) and mandatory > required then 
				required = required + 1;
			else
				bonus = bonus + 1;
				value = value + value * bonus_mul;
			end
			value = value * bag_mul;
		end
		value = value * (data.multiplier or 1);
		total_value = total_value + value;
	end
	total_value = math.floor(total_value * 0.001);
	
	local text = tostring(bonus);
	if mandatory >= 1 then
		text = format("%d/%d %s", required, mandatory, bonus > 0 and "+" .. bonus or "");
	end

	acquired:set_text(text);
	cash:set_text(managers.experience:cash_string(total_value).."K");
	gage:set_text(format("%d/%d", packages - remaining, packages));
	self:resize_loot();
end

--[[
	Mandatory bag modifiers;
		data.multiplier
		player.secured_bags_money_multiplier
		money_manager.offshore_rate
	Bonus bag modifiers;
		[data.multiplier]
		player.secured_bags_money_multiplier
		money_manager.offshore_rate
		money_manager.difficulty_multiplier
	Small loot modifiers;
		data.multiplier
		[money_manager.max_small_loot_value]

	carry.value_multiplier is old data apparently, do not use.
]]--
	
function MUIStats:count_gage_units()
	local gage, all, active = managers.gage_assignment, 0, 0;
	if gage and gage._spawned_units then
		for _, unit in pairs(gage._spawned_units) do
			all = all +1;
			if alive(unit) and unit:base()._picked_up ~= true then
				active = active + 1;
			end
		end
	end
	return all, active;
end

function MUIStats:set_control_info(data)
	local nhost, lhost = data.nr_hostages, self._last_host;
	local hostages = self._hostages_panel;
	local captured = hostages:child("amount");
	if nhost then
		captured:set_text( format("%2d", nhost) );
		if (strlen(nhost) ~= strlen(lhost)) then
			Figure(captured):rect();
			Figure(hostages):adapt();
			self._supplement_list:dirty();
		end
		self._last_host = nhost;
	end
end

function MUIStats:set_time(time)
	time = floor(time);
	if time == self._last_time then return; end
	self._last_time = time;
	self._heist_time:set_text( ArmStatic.format_time(time) );
end

function MUIStats:set_no_return(state)
	if self._no_return == state then return; end
	self._no_return = state;
	fade_c(self._heist_time, state and Color.red or Color.white, 1);
end

function MUIStats:no_return()
	return self._no_return;
end


function MUIStats.assault_pulse(o)
	o:set_alpha(0);
	o:set_visible(true);
	local t = 0;
	local end_t = 5;
	while t < end_t do
		t = t + coroutine.yield();
		o:set_alpha(lerp(0, 1, t / end_t));
	end
	while true do
		t = t + coroutine.yield();
		o:set_alpha(0.8 + abs((sin(t * 180 * 0.50))) / 5);
	end
end

function MUIStats.assault_end(o)
	local t = 0;
	local end_t = 5;
	local a = o:alpha();
	while t < end_t do
		t = t + coroutine.yield();
		o:set_alpha(lerp(a, 0, t / end_t));
	end
	o:set_visible(false);
	o:stop();
end

function MUIStats:sync_start_assault(wave)
	local panel = self._assault_panel;
	panel:stop();
	panel:animate(callback(panel, self, "assault_pulse"));
	self:set_wave(wave);
end



function MUIStats:sync_end_assault()
	local panel = self._assault_panel;
	panel:stop();
	panel:animate(callback(panel, self, "assault_end"));
end

function MUIStats:set_wave(wave)
	local panel = self._wave_panel;
	local max_wave = managers.job:current_level_wave_count();

	panel:child("amount"):set_text( format("%d/%d", wave or 0, max_wave) );
	self._supplement_list:set_visible_panel(panel, (max_wave > 0 and max_wave < math.huge));
end

function MUIStats:modify_time(time)
	self:set_time(self._last_time + time)
end

function MUIStats:reset()
	self._last_time = 0
end

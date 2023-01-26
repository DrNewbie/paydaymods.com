--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.MUILabel = _G.MUILabel or class();
local getlt =  function(sid, mac) return managers.localization:text(sid, mac); end
local tunnel = ArmStatic.tunnel;
local action_arr = {};

function MUILabel:init(id, label_data)
	self.load_options();
	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_FULLSCREEN_PD2);
	local lblfont = ArmStatic.font_index(self._muiFont);
	local panel = hud.panel:panel({
		name = "name_label" .. id
	});
	self.id = id;
	self.panel = panel;
	self.unit = label_data.unit;
	self.vehicle = self.unit;
	self.movement = self.unit:movement();
	self.character_name = label_data.name;
	self.rank = 0;
	self.level = 0;
	
	if #action_arr < 1 then
		action_arr = { getlt("hud_starting_heist"), getlt("menu_success"), getlt("menu_failed") };
	end

	if tunnel(label_data, "unit", "base", "is_husk_player") then
		local peer = self.unit:network():peer();
		self.peer_id = peer:id();
		self.level = peer:level();
		self.rank = peer:rank();
	end
	
	
	local crim_color = tweak_data.chat_colors[managers.criminals:character_color_id_by_unit(self.unit) or 1];
	self.interact = panel:bitmap({
		name = "interact",
		texture = "guis/textures/pd2/hud_progress_active",
		blend_mode = "add",
		visible = false,
		color = Color.white,
		render_template = "VertexColorTexturedRadial",
		layer = 0
	});
	self.interact_s = panel:bitmap({
		name = "interact_s",
		texture = "guis/textures/pd2/hud_progress_active",
		blend_mode = "normal",
		visible = false,
		color = crim_color * 1.1,
		layer = 1
	});
	self.text = panel:text({
		name = "text",
		font = lblfont,
		color = crim_color,
		align = "left",
		vertical = "top",
		layer = -1
	});
	self.bag = panel:bitmap({
		name = "bag",
		texture = "guis/textures/pd2/hud_bag",
		visible = false,
		layer = 0,
		color = (crim_color * 1.1):with_alpha(1)
	});
	self.bag_number = panel:text({
		name = "bag_number",
		font = lblfont,
		color = crim_color,
		align = "left",
		vertical = "top",
		layer = -1
	});
	self.stop = panel:bitmap({
		name = "stopped",
		texture = "guis/textures/pd2/stophand_symbol",
		visible = false,
		layer = 0,
		color = (crim_color * 1.1):with_alpha(1)
	});
	self.cheater = panel:text({
		name = "cheater",
		text = utf8.to_upper(getlt("menu_hud_cheater")),
		font = lblfont,
		align = "left",
		vertical = "top",
		visible = false,
		layer = -1,
		color = tweak_data.screen_colors.pro_color
	});
	self.action = panel:text({
		name = "action",
		visible = false,
		text = "",
		font = lblfont,
		align = "left",
		vertical = "top",
		wrap = true,
		word_wrap = true,
		layer = -1,
		color = (crim_color * 1.1):with_alpha(1)
	});
	local inftex, infrec = tweak_data.hud_icons:get_icon_data("infamy_icon");
	local adjust = infrec[4] / 2;
	self.infamy = panel:bitmap({
		name = "infamy",
		visible = false,
		texture = inftex,
		texture_rect = {
			infrec[1],
			infrec[2] - adjust / 2,
			infrec[3],
			infrec[4] + adjust
		},
		layer = 0,
		color = crim_color
	});
	self:resize();
end

function MUILabel.load_options(force_load)
	if MUILabel._options and not force_load then return; end
	
	local data = MUIMenu._data;
	MUILabel._muiSize = data.mui_label_size or 36;
	MUILabel._muiMargin = data.mui_label_margin or 2;
	MUILabel._muiAlpha = (data.mui_label_alpha or 100)*0.01;
	MUILabel._muiName = data.mui_label_name ~= false;
	MUILabel._muiInfamy = data.mui_label_infamy ~= false;
	MUILabel._muiBag = data.mui_label_bag ~= false;
	MUILabel._muiLevel = data.mui_label_level ~= false;
	MUILabel._muiStop = data.mui_label_stop == true;
	MUILabel._muiUpper = data.mui_label_upper ~= false;
	MUILabel._muiClean = data.mui_label_clean or 2;
	MUILabel._muiFont = data.mui_label_font or 3;
	MUILabel._options = true;
	MUILabel._nameOpt = (MUILabel._muiLevel and 1 or 0) + (MUILabel._muiUpper and 1 or 0) + 
		(MUILabel._muiName and 1 or 0) + MUILabel._muiClean;
end

function MUILabel:set_action_text(type_index, tweak_data_id)
	if not self.action:visible() then return; end
	
	local atext = "";
	
	if type_index == 1 then
		atext = getlt(tweak_data.interaction[tweak_data_id].action_text_id or "hud_action_generic");
	elseif type_index == 2 then
		local tdEquip = tweak_data.equipments[tweak_data_id];
		atext = tdEquip.deploying_text_id
			and getlt(tdEquip.deploying_text_id)
			or getlt("hud_deploying_equipment", {EQUIPMENT = getlt(tdEquip.text_id)});
	elseif type_index == 3 then
		atext = action_arr[1];
	elseif type_index == 4 then
		atext = action_arr[2];
	elseif type_index == 5 then
		atext = action_arr[3];
	end
	if self._muiUpper then atext = utf8.to_upper(atext); end
	self.action:set_text(atext);
end

local fade = ArmStatic.fade_animate;
local visibility = function (o, v, a) o:set_visible(v); if a then o:set_alpha(a); end end
function MUILabel:set_action_progress(type_index, enabled, tweak_data_id, timer, success)
	local interact = self.interact;
	local interact_s = self.interact_s;
	local end_a = self._muiAlpha;
	
	
	visibility(interact, not success, enabled and 0);
	visibility(interact_s, success, end_a);
	visibility(self.action, true, success and end_a or enabled and 0);
	
	interact:stop();
	self.action:stop();
	if not success then
		self:set_action_text(enabled and type_index or 5, tweak_data_id);
		if enabled then interact:animate(callback(interact, ArmStatic, "animate_progress", timer)); end
		fade(interact, enabled and end_a or 0);
		fade(self.action, enabled and end_a or 0);
	else
		self:set_action_text(4, tweak_data_id);
		interact_s:stop();
		fade(interact_s, 0);
		fade(self.action, 0);
	end
end


function MUILabel:get_name()
	local result = "";
	if self._muiClean ~= 5  then
		result = self.character_name;
		if self._muiClean == 4 and self:criminal() then
			result = managers.localization:text("menu_" .. self:criminal().name);
		elseif (self._muiClean == 3) or (self._muiClean == 2 and result:len() > 20) then
			result = ArmStatic.clean_name(result);
			result = result:len() > 0 and result or "The Unparseable";
		end
	end
	if self._muiLevel and self.level > 0 then
		result = string.format("%s (%s%d)", result, self.rank > 0 and managers.experience:rank_string(self.rank) .. "-" or "",self.level);
	end
	if self._muiUpper then result = utf8.to_upper(result); end
	return result;
end

function MUILabel:criminal()
	if not self._criminal then
		local criminals = managers.criminals:characters();
		for i=1, #criminals do
			local criminal = criminals[i];
			if self.unit and (self.unit:id() == (alive(criminal.unit) and criminal.unit.id and criminal.unit:id())) then
				self._criminal = criminal;
			end
		end
	end
	return self._criminal;
end

function MUILabel:set_stop(stop)
	self.stop:set_visible(stop);
end

function MUILabel:resize()
	local panel = self.panel;
	local prog = self.interact;
	local succ = self.interact_s;
	local name = self.text;
	local bag = self.bag;
	local num = self.bag_number;
	local stop = self.stop;
	local cheat = self.cheater;
	local action = self.action;
	local infamy = self.infamy;
	
	local alpha = self._muiAlpha;
	local size = self._muiSize;
	local xxv = self.rank > 0;
	local carry = self._muiBag and 1 or 0;
	local margin = self._muiMargin;
	local s16 = size/6;
	local s33 = size/3;
	local s66 = size/1.5;
	
	if self.nameOpt ~= self._nameOpt then
		name:set_text(self:get_name());
		self.nameOpt = self._nameOpt;
	end
	
	local function view(fgr) fgr:view(alpha); end
	Figure(panel):shape(size * 5 + margin * 4, size + margin * 2):progeny(view);
	
	Figure(name):rect(s33):cusp(size*4):align(2);
	Figure(infamy):view(xxv):shape(s16, s33):attach(name, 4);
	Figure(stop):shape(s16, s33):attach(name, 4);
	local anchor = xxv and infamy or name;

	Figure(cheat):shape(size, s33):attach(anchor, 1, margin);
	Figure(action):shape(size*4, s33):attach(anchor, 3, margin);
	Figure({prog, succ}):shape(s66 + margin):attach(anchor, 4, margin);
	
	Figure({bag, num}):view(carry):shape(s33):attach(name, 2, margin);
end


function MUILabel.toggle_layer(force_state)
	local name_labels = managers.hud._hud.name_labels;
	if not name_labels or #name_labels < 1 then
		return;
	end
	
	local state = name_labels[#name_labels].panel:layer() > 0 or force_state == false;
	for _, nl in ipairs(name_labels) do
		if nl.resize then
			if state then
				nl.panel:set_layer(0);
				ArmStatic.remove_corners(nl.panel);
			else
				nl.panel:set_layer(1200);
				ArmStatic.create_corners(nl.panel);
			end
		end
	end
end

function MUILabel.resize_all()
	MUILabel.load_options(true);
	for _, ch in ipairs(managers.hud._hud.name_labels) do
		if ch.resize then
			ch:resize();
			ArmStatic.align_corners(ch.panel);
		end
	end
end

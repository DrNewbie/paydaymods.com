--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.MUITeammate = _G.MUITeammate or class(HUDTeammate);
ArmStatic.void(MUITeammate, {
	"recreate_weapon_firemode","_create_primary_weapon_firemode",
	"_create_secondary_weapon_firemode", "set_weapon_firemode",
	"_set_weapon_selected", "layout_special_equipments", "set_stored_health_max",
	"_animate_update_absorb", "animate_update_absorb_active", "_animate_timer_flash"
});


MUITeammate._mui_base = {};
MUITeammate._mui_path = ModPath;
local tunnel = ArmStatic.tunnel;
local tunnel_c = ArmStatic.tunnel_child;
local flip_tex_h = ArmStatic.flip_texture_h;
local set_pam = ArmStatic.set_padded_amount;
local set_icon_data = ArmStatic.set_icon_data;
local fade, fade_c, rotate = ArmStatic.fade_animate, ArmStatic.fade_c_animate, ArmStatic.rotate_animate;
local floor, format, abs, max, fmod = math.floor, string.format, math.abs, math.max, math.fmod;
local blk = Color(1, 0, 0, 0);

function MUITeammate:init(i, team)
	MUITeammate:load_options();
	self._id = i;
	self._parent = team;
	self:defaults();

	local crim_color = self._prime_color;
	local muiFont = ArmStatic.font_index(self._muiFont);
	
	local teammate_panel = team:panel({
		visible = false,
		name = "" .. i
	});
	--self._test_rect = teammate_panel:rect({ color = Color.red });
	self._panel = teammate_panel;
	self._player_panel = teammate_panel:panel({name = "player"});
	teammate_panel:text({
		name = "name",
		text = "#".. i,
		layer = 5,
		visible = true,
		color = crim_color,
		vertical = "bottom",
		font = muiFont
	});
	-- Poco comp
	self._name_bg = teammate_panel:panel({name = "name_bg", w = 0, h = 0, visible = false});
	--
	local radial_health_panel = self._player_panel:panel({
		name = "radial_health_panel",
		layer = 1
	});
	self._radial_health_panel = radial_health_panel;
	local radial_health = radial_health_panel:bitmap({
		name = "radial_health",
		color = blk,
		texture = "guis/textures/pd2/hud_health",
		render_template = "VertexColorTexturedRadial",
		blend_mode = "add",
		layer = 2
	});
	self._health = radial_health;
	if self._muiColor then
		radial_health:set_blend_mode("sub");
		radial_health_panel:bitmap({
			name = "radial_health_fill",
			color = crim_color,
			texture = "guis/textures/pd2/hud_health",
			blend_mode = "add",
			layer = 1
		});
	else
		flip_tex_h(radial_health);
	end
	local radial_shield = radial_health_panel:bitmap({
		name = "radial_shield",
		color = blk,
		texture = "guis/textures/pd2/hud_shield",
		render_template = "VertexColorTexturedRadial",
		blend_mode = "add",
		layer = 1,
	});
	flip_tex_h(radial_shield);
	self._shield = radial_shield;
	
	self._damage = radial_health_panel:bitmap({
		name = "damage_indicator",
		color = Color(1, 1, 1, 1),
		texture = "guis/textures/pd2/hud_radial_rim",
		blend_mode = "add",
		alpha = 0,
		layer = 1
	});
	radial_health_panel:bitmap({
		name = "radial_custom",
		visible = false,
		color = blk,
		texture = "guis/textures/pd2/hud_swansong",
		render_template = "VertexColorTexturedRadial",
		blend_mode = "add",
		layer = 2
	});
	local radial_ability = radial_health_panel:panel({
		name = "radial_ability"
	});
	radial_ability:bitmap({
		name = "ability_meter",
		color = blk,
		texture = "guis/textures/pd2/hud_fearless",
		render_template = "VertexColorTexturedRadial",
		blend_mode = "add",
		layer = 5
	});
	self._ability_icon = radial_ability:bitmap({
		blend_mode = "add",
		name = "ability_icon",
		visible = false,
		layer = 5
	});

	local radial_delayed = radial_health_panel:panel({name = "radial_delayed_damage"})
	self._rdh = radial_delayed:bitmap({
		texture = "guis/textures/pd2/hud_dot",
		name = "radial_delayed_damage_health",
		color = blk,
		render_template = "VertexColorTexturedRadialFlex",
		layer = 5
	});
	self._rds = radial_delayed:bitmap({
		texture = "guis/textures/pd2/hud_dot_shield",
		name = "radial_delayed_damage_armor",
		color = blk,
		render_template = "VertexColorTexturedRadialFlex",
		layer = 5
	});

	if self:main_player() then
		local radial_rip = radial_health_panel:bitmap({
			name = "radial_rip",
			texture = "guis/textures/pd2/hud_rip",
			render_template = "VertexColorTexturedRadial",
			blend_mode = "add",
			color = blk,
			visible = false,
			layer = 3
		});
		flip_tex_h(radial_rip);
		self._rip = radial_rip;
	end
	self._rah = radial_health_panel:bitmap({
		name = "radial_absorb_health_active",
		color = blk,
		texture = "guis/dlcs/coco/textures/pd2/hud_absorb_health",
		render_template = "VertexColorTexturedRadialFlex",
		blend_mode = "normal",
		layer = 5
	});
	self._ras = radial_health_panel:bitmap({
		name = "radial_absorb_shield_active",
		color = blk,
		texture = "guis/dlcs/coco/textures/pd2/hud_absorb_shield",
		render_template = "VertexColorTexturedRadialFlex",
		blend_mode = "normal",
		layer = 5
	});
	self._rim = radial_health_panel:bitmap({
		name = "radial_info_meter",
		visible = false,
		color = blk,
		texture = "guis/dlcs/coco/textures/pd2/hud_absorb_stack_fg",
		render_template = "VertexColorTexturedRadial",
		blend_mode = "add",
		layer = 5
	});
	self._condition_icon = teammate_panel:bitmap({
		name = "condition_icon",
		layer = 4,
		visible = false,
		color = Color.white
	});
	teammate_panel:text({
		name = "condition_timer",
		visible = false,
		text = "00",
		layer = 5,
		color = Color(0.8, 0.36,0),
		align = "center",
		vertical = "center",
		font = muiFont
	});
	local weapons_panel = self._player_panel:panel({
		name = "weapons_panel",
		visible = true,
		layer = 0
	});
	self._wpp = weapons_panel;
	local primary_weapon_panel = weapons_panel:panel({
		name = "primary_weapon_panel",
		visible = true,
		layer = 1
	});
	self._pwac = primary_weapon_panel:text({
		name = "ammo_clip",
		visible = self:main_player() and true,
		text = "000",
		color = Color.white,
		blend_mode = "normal",
		layer = 1,
		vertical = "top",
		align = "center",
		font = muiFont
	});
	self._pwat = primary_weapon_panel:text({
		name = "ammo_total",
		visible = true,
		text = "000",
		color = Color.white,
		blend_mode = "normal",
		layer = 1,
		vertical = "top",
		align = "center",
		font = muiFont
	});
	local secondary_weapon_panel = weapons_panel:panel({
		name = "secondary_weapon_panel",
		visible = true,
		layer = 1
	});
	self._swac = secondary_weapon_panel:text({
		name = "ammo_clip",
		visible = self:main_player() and true,
		text = "000",
		color = Color.white,
		blend_mode = "normal",
		layer = 1,
		vertical = "bottom",
		align = "center",
		font = muiFont
	});
	self._swat = secondary_weapon_panel:text({
		name = "ammo_total",
		visible = true,
		text = "000",
		color = Color.white,
		blend_mode = "normal",
		layer = 1,
		align = "center",
		vertical = "bottom",
		font = muiFont
	});
	local equipment_list = AnimatedList:new(self._player_panel, { align = 2, faux = true });
	self._equipment_list = equipment_list;
	
	local texture, rect = tweak_data.hud_icons:get_icon_data(tweak_data.equipments.specials.bottle.icon);
	local deployable_equipment_panel = equipment_list:panel({
		name = "deployable_equipment_panel",
		layer = 1
	});
	deployable_equipment_panel:bitmap({
		name = "equipment",
		texture = texture,
		texture_rect = rect,
		layer = 1,
		color = Color.white
	});
	deployable_equipment_panel:text({
		name = "amount",
		text = "01",
		font = muiFont,
		color = Color.white,
		align = "right",
		vertical = "center",
		layer = 2
	});
	texture, rect = tweak_data.hud_icons:get_icon_data(tweak_data.equipments.specials.cable_tie.icon);
	local cable_ties_panel = equipment_list:panel({
		name = "cable_ties_panel",
		layer = 1
	});
	self._cable_ties_panel = cable_ties_panel;
	cable_ties_panel:bitmap({
		name = "cable_ties",
		texture = texture,
		texture_rect = rect,
		layer = 1,
		color = Color.white
	});
	cable_ties_panel:text({
		name = "amount",
		text = "02",
		font = muiFont,
		color = Color.white,
		align = "right",
		vertical = "center",
		layer = 2
	});
	if PlayerBase.USE_GRENADES then -- Is there a point to this anymore?
		texture, rect = tweak_data.hud_icons:get_icon_data("frag_grenade");
		local grenades_panel = equipment_list:panel({
			name = "grenades_panel",
			layer = 1
		});
		grenades_panel:bitmap({
			name = "grenades_icon",
			texture = texture,
			texture_rect = rect,
			layer = 2,
			color = Color.white
		});
		grenades_panel:text({
			name = "amount",
			text = tostring("03"),
			font = muiFont,
			color = Color.white,
			align = "right",
			vertical = "center",
			layer = 2
		});
		grenades_panel:bitmap({
			texture = "guis/textures/pd2/hud_cooldown_timer",
			name = "grenades_radial",
			render_template = "VertexColorTexturedRadial",
			layer = 1,
			color = Color(0.5, 0, 1, 1)
		});

		grenades_panel:bitmap({
			texture = "guis/textures/pd2/hud_cooldown_timer",
			name = "grenades_radial_ghost",
			visible = false,
			rotation = 360,
			layer = 1
		});
		grenades_panel:bitmap({
			name = "grenades_icon_ghost",
			rotation = 360,
			visible = false,
			texture = texture,
			texture_rect = rect,
			layer = 2,
			color = Color.white
		});
	end
	local carry_panel = self._player_panel:panel({
		name = "carry_panel",
		visible = false,
		layer = 1
	});
	self._carry_panel = carry_panel;
	carry_panel:bitmap({
		name = "bg",
		visible = false
	});
	carry_panel:bitmap({
		name = "bag",
		texture = "guis/textures/pd2/hud_bag",
		layer = 0,
		color = crim_color
	});
	carry_panel:text({
		name = "value",
		visible = false,
		text = "",
		layer = 0,
		color = Color.white,
		vertical = "center",
		font = muiFont
	});
	local interact_panel = self._player_panel:panel({
		name = "interact_panel",
		visible = true,
		layer = 3
	});
	interact_panel:bitmap({
		name = "interact",
		texture = "guis/textures/pd2/hud_progress_active",
		blend_mode = "add",
		visible = false,
		color = blk,
		render_template = "VertexColorTexturedRadial",
		layer = 0
	});
	interact_panel:bitmap({
		name = "success",
		texture = "guis/textures/pd2/hud_progress_active",
		blend_mode = "normal",
		visible = false,
		color = crim_color,
		layer = 1
	});
	
	local info_list = AnimatedList:new(teammate_panel, {
		align = 1,
		direction = 1,
		aspd = 0.5
	});
	self._info_list = info_list;
	info_list:bitmap({
		name = "revives_icon",
		visible = false,
		texture = "guis/textures/pd2/skilltree/icons_atlas",
		texture_rect = {
			330,
			460,
			42,
			42
		},
		layer = 1,
		color = Color.red
	});
	self._stamina_icon = info_list:bitmap({
		name = "stamina_icon",
		visible = false,
		texture = "guis/textures/pd2/skilltree/drillgui_icon_restarter",
		render_template = "VertexColorTexturedRadial",
		layer = 2,
		color = Color.white
	});
	info_list:bitmap({
		name = "talk_icon",
		visible = false,
		texture = "guis/textures/hud_icons",
		texture_rect = {
			36,
			276,
			32,
			32
		},
		layer = 2,
		color = Color.white
	});
	
	
	self._special_list = AnimatedList:new(teammate_panel, {align = 2, faux = false});
	self:create_waiting_panel(teammate_panel);
	self:resize();
	--if true or self:main_player() then self._stamina_icon:animate(callback(self, self, "test_animate")); end
end

function MUITeammate:defaults()
	self._revives = 4;
	self._max_stamina = 1;
	self._stamina = 0;
	self._timer_paused = 0;
	self._absorb_active_amount, self._absorb_old = 0, 0;
	self._delayed_damage, self._delayed_old = 0, 0;

	self._custardy = false;
	self._crimedad = false;
	self._down = false;
	self._waiting = false;

	self._fade_threads = {};
	self._rot_threads = {};
	self._special_equipment = {};
	self._health_data = { current = 0, total = 0 };
	self._armor_data = { current = 0, total = 0 };
	self._ammo_data = {
		{ clip = 0, clip_m = 0, total = 0, total_m = 0 },
		{ clip = 0, clip_m = 0, total = 0, total_m = 0 }
	}

	local colors = tweak_data.chat_colors;
	self._prime_color = colors[#colors - self._id];
end

function MUITeammate:test_animate()
	local a = 0;
	log("test_animate")
	while true do
		a = a + 1;
		local t = 0;
		while t < 8 do
			t = t + coroutine.yield();
		end
		
		if self._absorb_active_amount > 0 then
			self._absorb_active_amount = 0;
			self._absorb_old = 0;
			self:update_absorb();
			self._rah:set_color(blk); self._ras:set_color(blk);
			self._rdh:set_color(blk); self._rds:set_color(blk);
		else
			self:set_absorb_active(10);
		end
	end
end

function MUITeammate:create_waiting_panel(parent_panel)
	local muiFont = ArmStatic.font_index(self._muiFont);

	local panel = parent_panel:panel({
		visible = false,
		name = "wait"
	});
	panel:text({
		name = "name",
		w = 0, h = 0,
		visible = false,
		font = muiFont
	});
	local detection = panel:panel({
		name = "detection"
	});
	detection:bitmap({
		name = "detection_left_bg",
		texture = "guis/textures/pd2/mission_briefing/inv_detection_meter",
		alpha = 0.2,
		blend_mode = "add"
	});
	local drr_bg = detection:bitmap({
		name = "detection_right_bg",
		texture = "guis/textures/pd2/mission_briefing/inv_detection_meter",
		alpha = 0.2,
		blend_mode = "add"
	});
	flip_tex_h(drr_bg);
	detection:bitmap({
		name = "detection_left",
		texture = "guis/textures/pd2/mission_briefing/inv_detection_meter",
		render_template = "VertexColorTexturedRadial",
		blend_mode = "add",
		layer = 1
	});
	local drr = detection:bitmap({
		name = "detection_right",
		texture = "guis/textures/pd2/mission_briefing/inv_detection_meter",
		render_template = "VertexColorTexturedRadial",
		blend_mode = "add",
		layer = 1
	});
	flip_tex_h(drr);
	panel:text({
		name = "detection_value",
		font = muiFont,
		align = "center",
		vertical = "center"
	});

	self:_create_equipment(panel, "deploy");
	self:_create_equipment(panel, "throw");
	self:_create_equipment(panel, "perk");
	self._wait_panel = panel;
end

function MUITeammate:main_player()
	return self._id == HUDManager.PLAYER_PANEL;
end

function MUITeammate:_create_equipment(parent, name)
	local muiFont = ArmStatic.font_index(self._muiFont);

	local panel = parent:panel({ name = name });
	panel:bitmap({
		name = "icon",
		layer = 1,
		color = Color.white
	});
	panel:text({
		name = "amount",
		text = "00",
		font = muiFont,
		color = Color.white,
		align = "center",
		vertical = "center",
		layer = 2
	});
end


function MUITeammate:set_waiting(waiting, peer)
	if self._waiting == waiting then return; end
	self._waiting = waiting;

	local my_peer = managers.network:session():peer(self._peer_id);
	local wp = self._wait_panel;
	peer = peer or my_peer;

	if peer and waiting then
		local wped = wp:child("deploy");
		local wpet = wp:child("throw");
		local wpep = wp:child("perk");
		local wpd = wp:child("detection");
			local wpdl = wpd:child("detection_left");
			local wpdr = wpd:child("detection_right");
		local wpdv = wp:child("detection_value");

		local name = peer:name();
		local profile = peer:profile();
		local grenade = peer:grenade_id();
		local outfit = profile.outfit or managers.blackmarket:unpack_outfit_from_string(profile.outfit_string) or {};

		local current, reached = managers.blackmarket:get_suspicion_offset_of_peer(peer, tweak_data.player.SUSPICION_OFFSET_LERP or 0.75);
		wpdl:set_color(Color(0.5 + current * 0.5, 1, 1));
		wpdr:set_color(Color(0.5 + current * 0.5, 1, 1));
		wpdv:set_color(reached and Color(255,255,42,0) / 255 or tweak_data.screen_colors.text);

		local has_deployable = outfit.deployable and outfit.deployable ~= "nil";

		set_pam(wped:child("amount"), has_deployable and outfit.deployable_amount or 0);
		set_pam(wpet:child("amount"), managers.player:get_max_grenades(grenade));
		set_pam(wpep:child("amount"), tonumber(outfit.skills.specializations[2]));

		set_icon_data(wped:child("icon"), has_deployable and tweak_data.equipments[outfit.deployable].icon);
		set_icon_data(wpet:child("icon"), outfit.grenade and tweak_data.blackmarket.projectiles[outfit.grenade].icon);
		set_icon_data(wpep:child("icon"), tweak_data.skilltree:get_specialization_icon_data(tonumber(outfit.skills.specializations[1])));
		self:set_callsign(peer:id());
		self:set_name(name);
	elseif not waiting then
		self:set_callsign(5);
		self:restore_name();
	end
	self:set_gear_visible(not waiting and (my_peer and my_peer:unit()));
	self:redisplay_panel();
	fade(wp, waiting and 1 or 0, 1);
end
function MUITeammate:is_waiting()
	return self._waiting;
end
function MUITeammate:add_panel()
	self._taken = true;
	self:redisplay_panel();
	self._special_list:reposition();
end

local function equip_split(fgr, p, s)
	local w, h = p:w()/2, p:h();
	local x = fgr:get("text_rect") and w or 0;
	fgr:shape(p:w()/2, p:h()):move(x):lead();
end
local function equipable(fgr, p, s) fgr:shape(p:w(), p:h() /3):progeny(equip_split); end

function MUITeammate:resize()
	local main = self:main_player();
	local size = main and self._muiSizeL or self._muiSizeS;
	local alpha = main and self._muiAlphaL or self._muiAlphaS;
	local s33, s66 = size/3, size/1.5;
	local sAmmo = size * (main and 1.5 or 0.75);
	local row = main and self._muiSpcLR or self._muiSpcSR;
	local dock = main and self._muiSpcLD or self._muiSpcSD;
	local vert = dock % 2 == 0;
	local flip = (dock == 1 or dock == 4) and 2 or 1;
	local total = s33 * row;
	self._mui_size = size;
	
	local panel = self._panel;
		local name = panel:child("name");
		local condition = panel:child("condition_icon");
		local timer = panel:child("condition_timer");
		local info = self._info_list;
			local stamina = self._stamina_icon;
		local special = self._special_list;
	
	
	local player = self._player_panel;
		local health = player:child("radial_health_panel");
			local ability = health:child("radial_ability"):child("ability_icon");
		local weapons = player:child("weapons_panel");
			local primary = weapons:child("primary_weapon_panel");
			local secondary = weapons:child("secondary_weapon_panel");
		local equipment = self._equipment_list;
		local deployable = equipment:child("deployable_equipment_panel");
		local carry = player:child("carry_panel");
		local interact = player:child("interact_panel");


	Figure(carry):shape(s33):spank();
	Figure({health,interact}):shape(size):attach(carry, 3):recur():spank();
	Figure(ability):shape(s33):align(2);
	Figure(weapons):shape(sAmmo, size):attach(health, 2);
	
	local function ammo(fgr, p, s)
		local w, h = p:w(), p:h();
		if main then w = w / 2; end
		fgr:shape(w, h):lead():attach(main and s, 2);
	end
	Figure(primary):shape(sAmmo, size/2):progeny(ammo);
	Figure(secondary):shape(sAmmo, size/2):attach(primary, 3):progeny(ammo);
	
	Figure(equipment):shape(s66, size):attach(weapons, 2):progeny(equipable);
	equipment:reposition();
	
	Figure(player):adapt():move(dock == 4 and total or 0, dock == 1 and total or 0);
	Figure(special):shape(vert and total or player:w(), vert and player:h() or total):
		attach(player, dock):recur():spank(s33, s33, s33/2);
	special:set_direction(vert and 2 or 1); special:set_flip(flip);
	special:reposition();


	Figure(name):shape(player:w() - s33, s33):leech(player):attach(carry:visible() and carry, 2);
	Figure(condition):shape(size):leech(player):attach(carry, 3);
	Figure(timer):shape(s66):leech(condition):align(2);

	Figure(info):shape(s66, s33):leech(player):align(3, 1):spank(s33);
	
	if not self._muiStam and stamina:visible() then info:set_visible_panel(stamina, false); end
	info:reposition();
	
	self:resize_wait();
	--self._test_rect:set_size(special:right(), special:bottom());
	Figure(panel):adapt();
	self._parent:set_alpha_panel(panel, alpha);
	ArmStatic.align_corners(panel);

	self:redisplay_name();
	self:redisplay_panel();
	self:redisplay_ammo(1);
	self:redisplay_ammo(2);
	self:update_absorb(true);
end

function MUITeammate:resize_wait()
	local size = self:main_player() and self._muiSizeL or self._muiSizeS;
	local s33, s66 = size/3, size/1.5;
	
	local player = self._player_panel;
		local carry = player:child("carry_panel");
	local wait = self._wait_panel;
		local detect = wait:child("detection");
		local value = wait:child("detection_value");
		local deploy = wait:child("deploy");
		local throw = wait:child("throw");
		local perk = wait:child("perk");
		
	Figure(detect):shape(size):spank();
	Figure(value):rect(s33):leech(detect):align(2);
	Figure(deploy):shape(s66, s33):attach(detect, 2):progeny(equip_split);
	Figure(throw):shape(s66, s33):attach(deploy, 3):progeny(equip_split);
	Figure(perk):shape(s66, s33):attach(throw, 3):progeny(equip_split);
	Figure(wait):adapt():attach(carry, 3);
end

function MUITeammate:add_special_equipment(data)
	local spcSize = self._mui_size/3;
	local panel = self._special_list:panel({ name = data.id, h = spcSize, w = spcSize });
	
	local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon);
	local bitmap = panel:bitmap({
		name = "bitmap",
		texture = icon,
		color = Color.white,
		h = spcSize,
		w = spcSize,
		layer = 1,
		texture_rect = texture_rect
	});
	if data.amount then
		local amount = panel:child("amount") or panel:text({
			name = "amount",
			text = tostring(data.amount),
			font = "fonts/font_medium_noshadow_mf",
			font_size = spcSize/2,
			color = (self._prime_color * 0.5):with_alpha(1),
			h = spcSize,
			w = spcSize,
			align = "center",
			vertical = "center",
			layer = 4
		});
		amount:set_visible(1 < data.amount);
		local amount_bg = panel:child("amount_bg") or panel:bitmap({
			name = "amount_bg",
			texture = "guis/textures/pd2/equip_count",
			color = Color.white,
			h = spcSize,
			w = spcSize,
			layer = 3
		});
		amount_bg:set_visible(1 < data.amount);
	end
	
	ArmStatic.flash_c_animate(bitmap, self._prime_color, 2, 4, 0.5);
end

function MUITeammate:remove_special_equipment(id)
	self._special_list:set_state_id(id, 0);
end

function MUITeammate:set_special_equipment_amount(id, no)
	local equipment = self._special_list:child(id);
	if not equipment then return; end
	local amount, bg = equipment:child("amount"), equipment:child("amount_bg");
	if amount and bg then
		amount:set_text(tostring(no));
		amount:set_visible(no > 1);
		bg:set_visible(no > 1);
	end
end

function MUITeammate:set_weapon_selected(id, hud_icon)
	local scdry = id == 1;
	local wpp = self._wpp;
	local pwpp, swpp = wpp:child("primary_weapon_panel"), wpp:child("secondary_weapon_panel");
	
	pwpp:set_alpha(scdry and 0.5 or 1);
	swpp:set_alpha(scdry and 1 or 0.5);
end

function MUITeammate:set_ammo_amount_by_type(index, max_clip, current_clip, current_left, max_left)
	if index > 2 then index = fmod(index, 2) + 1 end
	local data = self._ammo_data[index];
	
	data.clip = current_clip;
	data.clip_m = max_clip;
	data.total = current_left;
	data.total_m = max_left or max(data.total_m, current_left);
	self:redisplay_ammo(index);
end

local ooa, loa = Color(1, 0.9, 0.3, 0.3), Color(1, 0.9, 0.9, 0.3);
function MUITeammate:redisplay_ammo(index)
	local data = self._ammo_data[index];
	local col_c, col_t = Color.white, Color.white;
	local clip, clip_m, total, total_m = data.clip, data.clip_m, data.total, data.total_m;
	local wac, wat;
	if index == 1 then
		wac, wat = self._swac, self._swat;
	else
		wac, wat = self._pwac, self._pwat;
	end
	
	if self._muiAmmo > 1 and total >= clip then
			total = total - clip;
			total_m = total_m - clip_m;
		
		if self._muiAmmo == 3 then
			total = math.ceil(total / clip_m);
			total_m = math.ceil(total_m / clip_m);
		end
	end
	
	if clip <= 0 then
		col_c = ooa;
	elseif clip <= clip_m /2 then
		col_c = loa;
	end
	if total <= 0 then
		col_t = ooa;
	elseif total <= total_m /2 then
		col_t = loa;
	end
	
	wac:set_text(format("%03d", clip));
	wac:set_color(col_c);
	wat:set_text(format("%03d", total));
	wat:set_color(col_t);
end

function MUITeammate:set_callsign(id)
	local tmp = self._panel;
	local name = tmp:child("name");
	local cont = tmp:child("condition_timer");
	local bag = tunnel_c(self._player_panel, "carry_panel", "bag");
	local success = tunnel_c(self._player_panel, "interact_panel", "success");
	local color = tweak_data.chat_colors[id]:with_alpha(1);
	local comp_color = self._muiColor and ArmStatic.complement(color):with_alpha(1) or Color.black;
	name:set_color(color);
	bag:set_color(color);
	success:set_color(color);
	cont:set_color(comp_color);
	
	if self._muiColor then
		local rhf = tunnel_c(self._player_panel, "radial_health_panel", "radial_health_fill");
		if rhf then rhf:set_color(color); end
	end
	self._prime_color = color;
	self._comp_color = comp_color;
end

function MUITeammate:set_equipment_amount(panel, amount, alt)
	local text = panel:child("amount");
	alt = self:main_player() and alt or 0; amount = amount or 0;

	
	self._equipment_list:set_visible_panel(panel, amount + alt > 0);
	set_pam(text, amount, alt);
end

function MUITeammate:set_cable_ties_amount(amount)
	local ctp = self._equipment_list:child("cable_ties_panel");
	self:set_equipment_amount(ctp, amount);
end

function MUITeammate:set_cable_tie(data)
	-- Lest we get some kinnae dimeritium cable ties for sorceress civs, ain't no need to set the ruddy cable tie icon every time.
	self:set_cable_ties_amount(data.amount);
end

function MUITeammate:set_deployable_equipment(data)
	local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon);
	local dep = self._equipment_list:child("deployable_equipment_panel");
	dep:child("equipment"):set_image(icon, unpack(texture_rect));
	self:set_deployable_equipment_amount(1, data);
end
function MUITeammate:set_deployable_equipment_from_string(data)
	data.alt = data.amount[2] or 0;
	data.amount = data.amount[1] or 0;
	self:set_deployable_equipment(data);
end
function MUITeammate:set_deployable_equipment_amount(index, data)
	local dep = self._equipment_list:child("deployable_equipment_panel");
	self:set_equipment_amount(dep, data.amount, data.alt);
end
function MUITeammate:set_deployable_equipment_amount_from_string(index, data)
	data.alt = data.amount[2] or 0;
	data.amount = data.amount[1] or 0;
	self:set_deployable_equipment_amount(index, data);
end

function MUITeammate:set_grenades(data)
	if not PlayerBase.USE_GRENADES then
		return;
	end
	local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon);
	local gp = self._equipment_list:child("grenades_panel");
	gp:child("grenades_icon"):set_image(icon, unpack(texture_rect));
	gp:child("grenades_icon_ghost"):set_image(icon, unpack(texture_rect));
	self:set_grenades_amount(data);
end

function MUITeammate:set_grenades_amount(data)
	if not PlayerBase.USE_GRENADES then return; end
	
	local gp = self._equipment_list:child("grenades_panel");
	local icon = gp:child("grenades_icon");
	icon:set_color(data.amount == 0 and Color(0.5, 1, 1, 1) or Color.white);
	self:set_equipment_amount(gp, data.amount, 0);
end


MUITeammate._mui_base.set_grenade_cooldown = MUITeammate.set_grenade_cooldown;
function MUITeammate:set_grenade_cooldown(data)
	if data and data.duration and data.end_time then
		local gp = self._equipment_list:child("grenades_panel");
		self._equipment_list:set_persistent_panel(gp, true);
	end
	return self._mui_base.set_grenade_cooldown(self, data);
end

function MUITeammate:set_ai(ai)
	self._ai = ai;
	self:redisplay_panel();
end

-- Prevent this function from rearranging the name panels, they're fine where they are
function MUITeammate:set_state(state)
	local is_player = state == "player";
	self:set_gear_visible(is_player);
end

function MUITeammate.align_panels()
	local mates = managers.hud._teammate_panels;
	local gap = MUITeammate._muiGap;
	local hPos = MUITeammate._muiHPos;
	local vPos = MUITeammate._muiVPos;
	local hMarg = MUITeammate._muiHMarg;
	local vMarg = MUITeammate._muiVMarg;
	local order = MUITeammate._muiOrder;
	local jtfy = MUITeammate._muiJustify;
	local dir = MUITeammate._muiDir;
	local team = managers.hud._mui_team;

	local players = HUDManager.PLAYER_PANEL;
	local wMax = 0;
	local hMax = 0;
	local wSum = gap * (players - 1);
	local hSum = wSum;
	local vert = dir == 2;
	
	for i = players, 1, -1 do
		local w, h = mates[i]._panel:size();
		wMax = max(wMax, w);
		hMax = max(hMax, h);
		wSum = wSum + w;
		hSum = hSum + h;
	end
	
	Figure(team):shape(vert and wMax or wSum, vert and hSum or hMax):align(hPos, vPos, hMarg, vMarg);
	team:set_direction(dir);
	team:set_order(order)
	team:set_align(vert and vPos or hPos);
	team:set_justify(jtfy > 0 and jtfy or (vert and hPos or vPos));
	team:set_margin(gap);
	team:reposition();
	ArmStatic.align_corners(team);
end

--------------------- POCO_COMP ------------------------
function MUITeammate.ph_align()
	if not PocoHud3 then return; end

	local team = managers.hud._mui_team;
	local mates = managers.hud._teammate_panels;
	local players = HUDManager.PLAYER_PANEL;
	local xOff, yOff = 0, 0;

	local pho = PocoHud3Class.O;
	if pho then
		local bottom = pho:get("playerBottom");
		xOff, yOff = bottom.offsetX or 0, bottom.offset or 0;
	end

	for i = players, 1, -1 do
		local mate = mates[i];
		local ph = mate:ph_panel();
		if ph then
			local panel = mate._panel;
			local x, y = panel:world_position();
			local w, h = panel:size();
			ph:set_world_position(x + (w - ph:w()) / 2 + xOff, y + h + yOff);
		end
	end
end

function MUITeammate:ph_panel()
	if not self._ph and not self._ai and PocoHud3 then
		local peer_id = self._peer_id or (self:main_player() and ArmStatic.tunnel(managers, "network", "session", "local_peer", "id"));
		self._ph = peer_id and PocoHud3["pnl_" .. peer_id];
	end
	return self._ph;
end
------------------------------------------------------


function MUITeammate:set_name(teammate_name)
	if self._base_name == teammate_name then return; end

	self._old_name = self._base_name;
	self._base_name = teammate_name;
	self:redisplay_name(true);
end

function MUITeammate:restore_name()
	if not self._old_name then return; end

	self._base_name = self._old_name;
	self._old_name = nil;
	self:redisplay_name(true);
end

function MUITeammate:redisplay_name(force)
	local name = self._base_name;
	local waiting = self._waiting;
	local upper = self._muiUpper;
	local clean = (self:main_player() and self._muiCleanL) or self._muiCleanS or 0;
	local nameOpt = clean + (upper and 1 or 0);
	
	if (not name or self._nameOpt == nameOpt) and not force then return; end
	self._nameOpt = nameOpt;

	if not waiting and clean == 5 then
		name = "";
	elseif not waiting and clean == 4 and self:criminal() then
		name = managers.localization:text("menu_" .. self:criminal().name);
	elseif (clean == 3) or (clean == 2 and name:len() > 20) then
		name = ArmStatic.clean_name(name);
		name = name:len() > 0 and name or "The Unparseable";
	end

	if upper then name = utf8.to_upper(name); end
	self._panel:child("name"):set_text(name);
end

function MUITeammate:redisplay_panel()
	local visible = false;
	if self._waiting then
		visible = true;
	elseif self._ai then
		visible = self._muiAI;
	else
		visible = self._taken;
	end

	if visible == self._visible then return; end
	self._visible = visible;
	self._parent:set_visible_panel(self._panel, visible);
end


function MUITeammate.load_options(force_load)
	if MUITeammate._options and not force_load then return; end
	
	local data = MUIMenu._data;
	MUITeammate._muiSizeL = data.mui_player_size or 42;
	MUITeammate._muiSizeS = data.mui_team_size or 30;
	MUITeammate._muiAlphaL = (data.mui_player_alpha or 100)*0.01;
	MUITeammate._muiAlphaS = (data.mui_team_alpha or 75)*0.01;
	MUITeammate._muiCleanL = data.mui_player_clean or 2;
	MUITeammate._muiCleanS = data.mui_team_clean or 2;
	MUITeammate._muiRevL = data.mui_player_revives ~= false;
	MUITeammate._muiRevS = data.mui_team_revives ~= false;
	MUITeammate._muiAbsL = data.mui_player_absorb ~= false;
	MUITeammate._muiAbsS = data.mui_team_absorb ~= false;
	MUITeammate._muiAI = data.mui_team_ai ~= false;
	MUITeammate._muiStam = data.mui_player_stamina == true;
	MUITeammate._muiDmg = data.mui_player_damage == true;
	MUITeammate._muiDir = data.mui_direction or 1;
	MUITeammate._muiSpcLD = data.mui_player_sp_dock or 3;
	MUITeammate._muiSpcLR = data.mui_player_sp_row or 1;
	MUITeammate._muiSpcSD = data.mui_team_sp_dock or 3;
	MUITeammate._muiSpcSR = data.mui_team_sp_row or 1;
	MUITeammate._muiHPos = data.mui_gen_h_position or 3;
	MUITeammate._muiVPos = data.mui_gen_v_position or 3;
	MUITeammate._muiHMarg = data.mui_gen_h_margin or 0;
	MUITeammate._muiVMarg = data.mui_gen_v_margin or 0;
	MUITeammate._muiHPASPD = (data.mui_gen_hp_aspd or 500)*0.001;
	MUITeammate._muiSHASPD = (data.mui_gen_sh_aspd or 300)*0.001;
	MUITeammate._muiOrder = data.mui_order or 1;
	MUITeammate._muiUpper = data.mui_name_upper ~= false;
	MUITeammate._muiGap = data.mui_gap_size or 4;
	MUITeammate._muiJustify = (data.mui_gen_jtfy or 1)-1;
	MUITeammate._muiSHide = data.mui_begin_hidden ~= false;
	MUITeammate._muiFont = data.mui_font_pref or 4;
	MUITeammate._muiAmmo = data.mui_ammo or 1;
	if MUITeammate._muiColor == nil then
		MUITeammate._muiColor = MUIMenu:Assets() and data.mui_hp_color ~= false or data.mui_hp_color == true;
	end
	MUITeammate._options = true;
end

function MUITeammate.resize_all()
	MUITeammate.load_options(true);
	for _, ch in ipairs(managers.hud._teammate_panels) do
		ch:resize();
	end
	MUITeammate:align_panels();
	MUILegend.resize_all();
end

function MUITeammate.toggle_layer(force_state)
	local team = managers.hud._mui_team;
	if not team then return; end

	local panel = team._panel;
	local mates = team:children();

	if panel:layer() <= 0 or force_state then
		panel:set_layer(1200);
		ArmStatic.create_corners(panel);
		for i=1, #mates do
			ArmStatic.create_corners(mates[i], Color.green);
		end
	else
		panel:set_layer(0);
		ArmStatic.remove_corners(panel);
		for i=1, #mates do
			ArmStatic.remove_corners(mates[i]);
		end
	end
end

function MUITeammate:set_gear_visible(state)
	-- Animations on player panel are stopped on second yield, unsure why.
	-- Workaround: Placing animation on 'is bugger who's never had a useful day in his life.
	local bg = self._name_bg;
	bg:stop();
	bg:animate(callback(self._player_panel, ArmStatic, "fade", {state and 1 or 0, 1}));
end

function MUITeammate:set_talking(state)
	self._info_list:set_visible_id("talk_icon", state);
end


function MUITeammate:set_max_stamina(val)
	self._max_stamina = val;
end
function MUITeammate:set_stamina(val)
	if self._muiStam and val ~= self._stamina then
		local si, new_r = self._stamina_icon, val / self._max_stamina;
		self._stamina = val;
		
		si:set_color(Color(new_r, 1, 1));
		
		if not si:visible() and new_r < 0.5 then
			self._info_list:set_visible_panel(si, true);
		elseif si:visible() and new_r > 0.9 then
			self._info_list:set_visible_panel(si, false);
		end
	end
end

-- Set local revives variable and display warning if last life.
function MUITeammate:set_revives(revives)
	revives = revives or self._revives-1;
	self._info_list:set_visible_id("revives_icon", revives < 2);
	self._down = false;
	self._revives = revives;
end

-- Find and/or return criminal for panel
function MUITeammate:criminal()
	if not self._criminal then
		local criminals = managers.criminals:characters();
		local peer_id = self._peer_id or (self:main_player() and ArmStatic.tunnel(managers, "network", "session", "local_peer", "id"));
		for i=1, #criminals do
			local criminal = criminals[i];
			if (criminal.peer_id ~= nil and criminal.peer_id == peer_id) or (criminal.data and criminal.data.panel_id == self._id) then
				self._criminal = criminal;
			end
		end
	end
	return self._criminal;
end

function MUITeammate:remove_panel()
	self._special_list:clear();

	self:set_condition("mugshot_normal");
	self._player_panel:child("carry_panel"):set_visible(false);
	self._player_panel:child("carry_panel"):child("value"):set_text("");
	self._rah:set_color(blk); self._ras:set_color(blk);
	self._rdh:set_color(blk); self._rds:set_color(blk);
	if self._rip then self._rip:hide(); end
	self:set_cheater(false);
	self:set_info_meter({
		current = 0,
		total = 0,
		max = 1
	});

	self:stop_timer();
	self:defaults();
	self:teammate_progress(false, false, false, false);
	self._peer_id = nil;
	self._ai = nil;
	self._ph = nil;
	self._criminal = nil;
	self._taken = nil;
	self:redisplay_panel();
end

function MUITeammate:position_name()
	local player = self._player_panel;
	local carry = player:child("carry_panel");
	local name = self._panel:child("name");
	Figure(name):leech(player):attach(carry:visible() and carry, 2);
end

function MUITeammate:set_carry_info()
	self._player_panel:child("carry_panel"):set_visible(true);
	self:position_name();
end
function MUITeammate:remove_carry_info()
	self._player_panel:child("carry_panel"):set_visible(false);
	self:position_name();
end

function MUITeammate:set_health(data)
	self._health_data = data;
	local dt, dc, dr, hp, rip = data.total, data.current, data.revives, self._health, self._rip;
	--This will attempt to wean out whether a team member was downed.
	--It does not account for joining mid-game as I'm trying to keep it simple, and babysitting other players is not really your job anyway.
	if MUITeammate._muiRevL and dr and dr ~= self._revives then
		self:set_revives(dr);
	elseif MUITeammate._muiRevS and not self:main_player() then
		if not self._custardy and dc <= 0 then
			if data.no_hint then
				self._custardy = true;
				self:set_revives(4);
			else
				self._crimedad = true;
			end
		end
		if dc > 0 then
			self._custardy, self._crimedad = false, false;
			if self._down then
				self:set_revives();
			end
		end
	end
	
	if self:main_player() and rip:visible() then
		self:rot_radial(rip, dc, dt, self._muiHPASPD);
	end
	
	self:set_radial(hp, (self._muiColor and dt - dc or dc), dt, self._muiHPASPD);
	self:update_delayed_damage();
	self:update_absorb();
end

function MUITeammate:set_stored_health(shr)
	local rip = self._rip;
	if self:main_player() then
		if shr > 0 then rip:show(); end
		self:set_radial(rip, shr, 1, self._muiHPASPD);
	end
end

function MUITeammate:set_armor(data)
	self._armor_data = data;
	self:set_radial(self._shield, data.current, data.total, self._muiSHASPD);
	self:update_delayed_damage();
	self:update_absorb();
end

function MUITeammate:_damage_taken()
	if not self._muiDmg then return; end
	local damage = self._damage;
	damage:stop()
	damage:animate(callback(self, self, "_animate_damage_taken"))
end

function MUITeammate:set_radial(radial, cur, tot, aspd, flx)
	flx = flx or 0;
	local n_cur, n_flx = cur / tot, 1 - flx / tot;
	local name, clr = radial:name(), radial:color();
	local diff = abs((n_cur - clr.r) + (n_flx - clr.g));
	
	if diff == 0 then return; end
	radial:stop(self._fade_threads[name]);
	local n_col = Color(1, n_cur, n_flx, 1);
	self._fade_threads[name] = fade_c(radial, n_col, aspd);
end

function MUITeammate:rot_radial(radial, cur, tot, aspd)
	local n_rot, name = (1 - cur / tot)*360, radial:name();
	local diff = abs(n_rot - radial:rotation());
	if diff == 0 then return; end
	radial:stop(self._rot_threads[name]);
	self._rot_threads[name] = rotate(radial, n_rot, aspd);
end

local visibility = function (o, v, a) o:set_visible(v); if a then o:set_alpha(a); end end
function MUITeammate:teammate_progress(enabled, tweak_data_id, timer, complete)
	local player = self._player_panel;
		local health = player:child("radial_health_panel");
		local interact = player:child("interact_panel");
			local progress = interact:child("interact");
			local success = interact:child("success");
	
	fade(health, enabled and 0.2 or 1);
	
	progress:stop();
	visibility(progress, not complete, enabled and 0);
	visibility(success, complete, 1);
	if not complete then
		if enabled then progress:animate(callback(progress, ArmStatic, "animate_progress", timer)); end
		fade(progress, enabled and 1 or 0);
	else
		if self._revives < 4 and (tweak_data_id == "doctor_bag" or tweak_data_id == "firstaid_box") then
			self:set_revives(4);
		end
		success:stop();
		fade(success, 0);
	end
end

function MUITeammate:start_timer(time)
	local loc_player = managers.player:local_player();
	local cont = self._panel:child("condition_timer");
	self._timer, self._timer_paused = time, 0;
	
	if not self:main_player() and alive(loc_player) then
		-- "FUCK!", a buddy is out of commission. 
		-- Put this line on its own in a file and assign to a key in the mod.txt for explicit-spam, if'n that's your thing.
		loc_player:sound():say( "g29", true, true ); 
	end
	
	if self._crimedad then
		local state_name = tunnel(self, "criminal", "unit", "movement", "current_state_name");
		if state_name == "bleed_out" then
			self._down = true;
		end
	end
	cont:set_color(self._comp_color);
	cont:stop(); cont:show();
	cont:animate(callback(self, self, "countdown", time));
end

function MUITeammate:set_pause_timer(pause)
	if not self._timer_paused then return; end
	self._timer_paused = self._timer_paused + (pause and 1 or -1);
end

function MUITeammate:countdown(time)
	local t, dt, old_t = time, 0, time;
	local o = self._panel:child("condition_timer");
	o:set_text(format("%02d", old_t));
	local r, b = Color.red, o:color();
	while t > 0 do
		dt = coroutine.yield();
		if self._timer_paused == 0 then
			t = t - dt;
			if t > 0 and t < old_t then
				old_t = floor(t);
				o:set_text(format("%02d", old_t));
				if old_t <= 10 then
					o:set_color(r);
					fade_c(o, b, 0.5);
				end
			end
		end
	end
end

MUITeammate._mui_base.set_absorb_active = MUITeammate.set_absorb_active;
function MUITeammate:set_absorb_active(absorb_amount)
	local result = self._mui_base.set_absorb_active(self, absorb_amount);
	self:update_absorb();
	return result;
end

function MUITeammate:update_absorb()
	if self._absorb_old + self._absorb_active_amount ~= 0 then
		self:set_radial_overlay(self._rah, self._ras, self._absorb_active_amount or 0);
		self._absorb_old = self._absorb_active_amount;
	end
end

function MUITeammate:update_delayed_damage()
	if self._delayed_old + self._delayed_damage ~= 0 then
		self:set_radial_overlay(self._rdh, self._rds, self._delayed_damage or 0);
		self._delayed_old = self._delayed_damage;
	end
end

function MUITeammate:set_radial_overlay(roh, ros, val)
	local d_hp, d_sh = self._health_data, self._armor_data;
	local cur_sh, tot_sh = d_sh.current, d_sh.total;
	local cur_hp, tot_hp = d_hp.current, d_hp.total;
	
	local ovl_sh = val < cur_sh and val or cur_sh;
	val = val - cur_sh;
	local ovl_hp = val < cur_hp and val or cur_hp;

	self:set_radial(ros, ovl_sh, tot_sh, self._muiSHASPD, cur_sh);
	self:set_radial(roh, ovl_hp, tot_hp, self._muiHPASPD, cur_hp);
end

function MUITeammate:set_info_meter(data)
	local rim = self._rim;
	rim:set_visible(data.total > 0);
	self:set_radial(rim, data.current, data.max, self._muiHPASPD);
end

function MUITeammate:set_ability_icon(icon)
	local texture, texture_rect = tweak_data.hud_icons:get_icon_data(icon, { 0, 0, 32, 32 });
	self._ability_icon:set_image(texture, unpack(texture_rect))
end

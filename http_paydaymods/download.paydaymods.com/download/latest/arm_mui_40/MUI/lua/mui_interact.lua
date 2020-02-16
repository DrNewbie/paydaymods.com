--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.MUIInteract = _G.MUIInteract or class();
ArmStatic.void(MUIInteract, { "destroy" } );

local max = math.max;

function MUIInteract:init(hud)
	self.load_options();
	hud = hud or managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2);
	local muiFont = ArmStatic.font_index(self._muiFont);
	local local_id = ArmStatic.tunnel(managers, "network", "session", "local_peer", "id") or 1;
	local crim_color = tweak_data.chat_colors[local_id];
	local panel = hud.panel:panel({
		name = "interact_panel",
		visible = true
	});
	self._valid = true;
	self._panel = panel;
	self._hud_panel = hud.panel;
	
	self._circle = panel:bitmap({
		name = "circle",
		texture = "guis/textures/pd2/hud_progress_active",
		blend_mode = "add",
		visible = false,
		color = Color(0,1,1),
		render_template = "VertexColorTexturedRadial",
		layer = 0
	});
	self._success = panel:bitmap({
		name = "success",
		texture = "guis/textures/pd2/hud_progress_active",
		blend_mode = "normal",
		visible = false,
		color = crim_color,
		layer = 1
	});
	self._valid_text = "";
	self._invalid_text = utf8.to_upper(managers.localization:text("hud_deploy_valid_help"));
	self._text = panel:text({
		name = "text",
		font = muiFont,
		align = "center",
		wrap = true,
		word_wrap = true,
		visible = false,
		layer = 0
	});
	
	self:resize();
end

function MUIInteract:show_interact(data)
	local text = self._text;
	local valid_text =  data and data.text or "Press 'F' to interact.";
	
	self._valid_text = valid_text;
	text:set_text(utf8.to_upper(valid_text));
	text:set_visible(true);
end

function MUIInteract:remove_interact()
	self._text:set_visible(false);
end

function MUIInteract:show_interaction_bar()
	self._circle:set_visible(true);
	if self._muiTxtHide then self._text:set_alpha(0); end
end

function MUIInteract:hide_interaction_bar(completed)
	self._text:set_alpha(1);
	self._circle:stop();
	self._circle:hide();
	self:set_interaction_bar_width(0,1);
	self:set_bar_valid(true);
	if completed then
		local success = self._success;
		success:set_alpha(1);
		success:show();
		ArmStatic.fade_animate(success, 0, 0.25);
	end
end

function MUIInteract:set_interaction_bar_width(t, end_t)
	self._circle:set_color(Color(1, t / end_t, 1, 1));
end

function MUIInteract:animate(text, t, end_t)
	local animate_circle = function()
		local up_t, up_end_t = t, end_t;
		while up_t < up_end_t do
			up_t = up_t + coroutine.yield();
			self:set_interaction_bar_width(up_t, up_end_t);
		end
	end
	self:show_interaction_bar();
	self:show_interact({text = text});
	self._circle:animate(animate_circle);
end

function MUIInteract:set_bar_valid(valid)
	if self._valid == valid then return; end
	self._valid = valid;
	self._circle:set_image(valid and "guis/textures/pd2/hud_progress_active" or "guis/textures/pd2/hud_progress_invalid");
	self._text:set_text(valid and self._valid_text or self._invalid_text);
	self._text:set_color(valid and Color.white or Color(1, 0.3, 0.3));
end

function MUIInteract:show()
	self:show_interact();
	self:set_interaction_bar_width(1,1);
	self:show_interaction_bar();
	self._text:set_alpha(1);
end

function MUIInteract:hide()
	self:remove_interact();
	self:hide_interaction_bar();
end

function MUIInteract.load_options(force_load)
	if MUIInteract._options and not force_load then return; end
	
	local data = MUIMenu._data;
	MUIInteract._muiSize = data.mui_ita_size or 100;
	MUIInteract._muiGap = data.mui_ita_gap or 10;
	MUIInteract._muiTxtMul = (data.mui_ita_txt_mul or 250)*0.01;
	MUIInteract._muiTxtHide = data.mui_ita_txt_hide ~= false;
	MUIInteract._muiAlpha = (data.mui_ita_alpha or 100)*0.01;
	MUIInteract._muiHMargin = data.mui_ita_h_marg or 0;
	MUIInteract._muiVMargin = data.mui_ita_v_marg or 0;
	MUIInteract._muiHPos = data.mui_ita_h_pos or 2;
	MUIInteract._muiVPos = data.mui_ita_v_pos or 2;
	MUIInteract._muiFont = data.mui_font_pref or 4;
	MUIInteract._options = true;
end

function MUIInteract:resize()
	local panel = self._panel;
	local circle = self._circle;
	local success = self._success;
	local text = self._text;
	
	local size = self._muiSize;
	local alpha = self._muiAlpha;
	local gap = self._muiGap;
	local mulTxt = self._muiTxtMul;
	local hMargin = self._muiHMargin;
	local vMargin = self._muiVMargin;
	local hPos = self._muiHPos;
	local vPos = self._muiVPos;
	
	local wTxt, hTxt, s80 = size*mulTxt, size/10*mulTxt, size*0.8;
	
	Figure(panel):view(alpha):shape(max(s80, wTxt), s80 + hTxt + gap):align(hPos, vPos, hMargin, vMargin);
	
	Figure(text):shape(wTxt, hTxt, hTxt/2):align(2, 3);
	Figure({circle, success}):shape(s80):align(2, 1);
end

function MUIInteract.resize_all()
	local muiita = managers.hud._hud_interaction;
	if not muiita then
		return;
	end
	MUIInteract.load_options(true);
	muiita:resize();
	ArmStatic.align_corners(muiita._panel);
end

function MUIInteract.toggle_layer(force_state)
	local muiita = managers.hud._hud_interaction;
	if not muiita then
		return;
	end
	local panel = muiita._panel;
	
	if force_state == false or panel:layer() > 0 then
		muiita:hide();
		ArmStatic.remove_corners(panel);
		panel:set_layer(0);
	else
		muiita:show();
		ArmStatic.create_corners(panel);
		panel:set_layer(1200);
	end
end

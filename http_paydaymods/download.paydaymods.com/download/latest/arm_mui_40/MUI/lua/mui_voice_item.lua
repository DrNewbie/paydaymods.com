--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.MUIVoiceItem = _G.MUIVoiceItem or class();

function MUIVoiceItem:init(parent, data, vcifont)
	self._parent = parent;
	self._panel = parent._panel:text({
		name = data.sound,
		text = data.key .. ". " .. data.name,
		layer = 1,
		color = Color.white,
		vertical = "top",
		font = vcifont
	});
	self._sound = data.sound;
	self._key = data.key;
	self._name = data.name;
	self._anim = data.anim;
end

function MUIVoiceItem:inside(x, y)
	return self._panel:inside(x, y);
end

function MUIVoiceItem:set_color(color)
	return self._panel:set_color(color);
end

function MUIVoiceItem:on_click()
	local loc_pl = managers.player:local_player();
	if alive(loc_pl) then
		if self._sound then
			loc_pl:sound():stop();
			loc_pl:sound():say( self._sound, true, true );
		end
		if self._anim and self._anim:sub(1, 3) == "cmd" and ArmStatic.equals(loc_pl:movement():current_state_name(), "standard", "carry") then
			loc_pl:movement():current_state():_play_distance_interact_redirect(0, self._anim);
		end
	end
end
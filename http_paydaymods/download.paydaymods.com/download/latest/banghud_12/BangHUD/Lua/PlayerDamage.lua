
local _update_regenerate_timer_original = PlayerDamage._update_regenerate_timer
local _update_armor_grinding_original = PlayerDamage._update_armor_grinding
local _update_can_take_dmg_timer_original = PlayerDamage._update_can_take_dmg_timer

function PlayerDamage:_update_regenerate_timer(...)
	_update_regenerate_timer_original(self, ...)
	if managers.hud and managers.hud._hud_banghud then
		managers.hud._hud_banghud:update_armor_timer(BangHUD:GetOption("show_armor_timer") and self._regenerate_timer or 0)
	end
end

function PlayerDamage:_update_armor_grinding(...)
	_update_armor_grinding_original(self, ...)
	if managers.hud and managers.hud._hud_banghud then
		managers.hud._hud_banghud:update_armor_timer((BangHUD:GetOption("show_anarchist_timer") and self:get_real_armor() < self:_max_armor()) and self._armor_grinding.target_tick - self._armor_grinding.elapsed or 0)
	end
end

function PlayerDamage:_update_can_take_dmg_timer(...)
	_update_can_take_dmg_timer_original(self, ...)
	if managers.hud and managers.hud._hud_banghud then
		managers.hud._hud_banghud:update_invincibility_timer(BangHUD:GetOption("show_invincibility_timer") and self._can_take_dmg_timer or 0)
	end
end
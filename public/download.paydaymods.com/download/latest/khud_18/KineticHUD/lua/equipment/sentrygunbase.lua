local orig_sentrygunbase_setup = SentryGunBase.setup
function SentryGunBase:setup(owner, ammo_multiplier, armor_multiplier, spread_multiplier, rot_speed_multiplier, has_shield, attached_data,...)
	local result = orig_sentrygunbase_setup(self, owner, ammo_multiplier, armor_multiplier, spread_multiplier, rot_speed_multiplier, has_shield, attached_data,...)
	if result then 
		if self._owner_id == managers.network:session():local_peer():id() then
			managers.player:add_tracked_sentrygun(self._unit:key(),{
				unit = self._unit,
				key = self._unit:key(),
				ammo_amount = tweak_data.upgrades.sentry_gun_base_ammo * ammo_multiplier,
				health_amount = tweak_data.upgrades.sentry_gun_base_armor * armor_multiplier,
				owner_id = self._owner_id --not necessary
				--weapon = self._unit:weapon()
			})
		end
	end
end

--Hooks:PostHook(SentryGunBase,"pre_destroy","aui_pre_destroy_sentry",function(self)
--	managers.player:remove_tracked_sentrygun(unit:key())
--end)
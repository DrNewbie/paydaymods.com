Hooks:PostHook(GroupAIStateBase,"set_assault_mode","khud_groupaibase_detect_controlphase",function(self,is_assault)
	if not is_assault then 
		managers.hud:set_assault_phase(utf8.to_upper("control")) --todo localize
--		managers.hud:set_phase_timer()
--		KineticHUD:c_log("Assault: control")
	end
end)

Hooks:PostHook(GroupAIStateBase,"convert_hostage_to_criminal","khud_groupaibase_convert_joker",function(self,unit,peer_unit)
	local peer_id = managers.criminals:character_peer_id_by_unit(peer_unit)
	local local_id = managers.network:session():local_peer():id()
	if (unit and alive(unit)) and (not peer_unit or (local_id == peer_id)) then 
--		local char_tweak = unit:base()._char_tweak
--		local access = char_tweak and char_tweak.access or "nil access"
		local category_name = unit:base()._tweak_table
--		KineticHUD:c_log(category_name,"Local player converted unit to joker.")
		--table.insert(KineticHUD.my_minions,unit)
	end
end)

Hooks:PostHook(GroupAIStateBase,"set_fake_assault_mode","khud_groupaibase_detect_fakeassault",function(self,enabled)
	if self._fake_assault_mode then
--		KineticHUD:c_log("fake assault",enabled)
--		managers.hud:set_assault_phase(utf8.to_upper("fake assault")) --todo localize
--		managers.hud:set_phase_timer()
	end
end)
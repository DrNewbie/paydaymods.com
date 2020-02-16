if not SaveEquipment then
	SaveEquipment = SaveEquipment or class()
	SaveEquipment.modname = "SaveEquipment"
	SaveEquipment.prefix = "[" .. SaveEquipment.modname .. "]"
	SaveEquipment._downs = {0,0,0,0}
	SaveEquipment._last_state = {"", "", "", ""}
	
	
	function SaveEquipment:increaseDowns(peer_id)
		self._downs[peer_id] = self._downs[peer_id] + 1
	end

	function SaveEquipment:resetDowns(peer_id)
		self._downs[peer_id] = 0
	end
	
	function SaveEquipment:interactAllowed_unit(peer_id, unit)
		return SaveEquipment:needsHeal(peer_id) or not SaveEquipment:IsMedicBag_unit(unit)
	end
	
	function SaveEquipment:interactAllowed_tweakdata_id(peer_id, tweak_data_id)
		return SaveEquipment:needsHeal(peer_id) or not SaveEquipment:IsMedicBag_tweakdata_id(tweak_data_id)
	end
	
	function SaveEquipment:needsHeal(peer_id)
		return self._downs[peer_id] >= (SaveEquipmentMenu._data.multi_saveequipment_enable_medic_downs_value - 1)
	end
	
	function SaveEquipment:IsMedicBag_unit(unit)
		return (unit and alive(unit) and unit.name and unit:name() == Idstring("units/payday2/equipment/gen_equipment_medicbag/gen_equipment_medicbag"))
	end
	
	function SaveEquipment:IsMedicBag_tweakdata_id(tweak_data_id)
		return tweak_data.interaction[tweak_data_id].icon == "equipment_doctor_bag"
	end
	
	
	function SaveEquipment:TasePlayer(peer_id)
		local player_unit = managers.criminals:character_unit_by_peer_id(peer_id)
		managers.network:session():send_to_peers_synched("sync_player_movement_state", player_unit, "tased", player_unit:character_damage():down_time(), player_unit:id())
		self._last_state[peer_id] = player_unit:movement():current_state_name()
		player_unit:movement():sync_movement_state("tased", player_unit:character_damage():down_time())
	end
	
	function SaveEquipment:UntasePlayer(peer_id)
		local player_unit = managers.criminals:character_unit_by_peer_id(peer_id)
		if self._last_state[peer_id] ~= "" then
			managers.network:session():send_to_peers_synched("sync_player_movement_state", player_unit, self._last_state[peer_id], player_unit:character_damage():down_time(), player_unit:id())
			player_unit:movement():sync_movement_state(self._last_state[peer_id], player_unit:character_damage():down_time())
			self._last_state[peer_id] = ""
		end
	end
	
	function SaveEquipment:send_message_to_peer(peer, message)
		if managers.network:session() then
			peer:send("send_chat_message", ChatManager.GAME, self.prefix .. ": " .. message)
		end
	end
end
if RequiredScript == "lib/managers/objectinteractionmanager" then
	local SE_interact_original = ObjectInteractionManager.interact
	function ObjectInteractionManager:interact(player)
		if not SaveEquipment:interactAllowed_unit(_G.LuaNetworking:LocalPeerID(), self._active_unit) then
			managers.hud:show_hint({text = managers.localization:text("saveequipment_try_message_medic_0") .. " " .. tostring(SaveEquipmentMenu._data.multi_saveequipment_enable_medic_downs_value - 1) .. " " .. managers.localization:text("saveequipment_try_message_medic_1"),time = 3})
			return false
		else
			return SE_interact_original(self, player)
		end
	end
elseif RequiredScript == "lib/network/handlers/unitnetworkhandler" then
	Hooks:PostHook(UnitNetworkHandler, "sync_teammate_progress", "SaveEquipment_recvInteraction", function(self, type_index, enabled, tweak_data_id, timer, success, sender)
		if not _G.LuaNetworking:IsHost() or type_index ~= 1 or success == true then
			return
		end
		local peer = self._verify_sender(sender)
		local peer_id = peer and peer:id()
		if peer_id then
			if not SaveEquipment:interactAllowed_tweakdata_id(peer_id, tweak_data_id) then
				if enabled == true then
					managers.hud:show_hint({text = tostring(peer:name()) .. " " .. managers.localization:text("saveequipment_try_hint_medic_0") .. " " .. tostring(SaveEquipmentMenu._data.multi_saveequipment_enable_medic_downs_value - 1) .. " " .. managers.localization:text("saveequipment_try_hint_medic_1"),time = 3})
					SaveEquipment:send_message_to_peer(peer, managers.localization:text("saveequipment_try_message_medic_0") .. " " .. tostring(SaveEquipmentMenu._data.multi_saveequipment_enable_medic_downs_value - 1) .. " " .. managers.localization:text("saveequipment_try_message_medic_1") .. " " .. managers.localization:text("saveequipment_try_message_notallowed"))
					SaveEquipment:TasePlayer(peer_id)
				else
					SaveEquipment:UntasePlayer(peer_id)
				end
			end
		end
	end)
	Hooks:PostHook(UnitNetworkHandler, "sync_doctor_bag_taken", "SaveEquipment_resetDownsHusk", function(self, unit, amount, sender)
		local peer = self._verify_sender(sender)
		local peer_id = peer and peer:id()
		if peer_id then
			SaveEquipment:resetDowns(peer_id)
		end
	end)
	Hooks:PostHook(UnitNetworkHandler, 'set_trade_death', "SaveEquipment_custodyHusk", function(self, criminal_name, respawn_penalty, hostages_killed)
		for __, SEcriminals in pairs(managers.criminals._characters) do
			if SEcriminals.taken and criminal_name == SEcriminals.name and SEcriminals.peer_id then
				SaveEquipment:resetDowns(SEcriminals.peer_id)
				break
			end
		end
	end)
elseif RequiredScript == "lib/units/equipment/doctor_bag/doctorbagbase" then
	Hooks:PostHook(DoctorBagBase, "take", "SaveEquipment_resetDownsLocal", function(self, unit)
		SaveEquipment:resetDowns(_G.LuaNetworking:LocalPeerID())
	end)
elseif RequiredScript == "lib/units/beings/player/states/playerbleedout" then
	Hooks:PostHook(PlayerBleedOut, '_enter', "SaveEquipment_downedLocal", function(self, enter_data)
		SaveEquipment:increaseDowns(_G.LuaNetworking:LocalPeerID())
	end)
elseif RequiredScript == "lib/units/beings/player/huskplayermovement" then
	Hooks:PostHook(HuskPlayerMovement, '_start_bleedout', "SaveEquipment_downedHusk", function( self, ... )
		local peer = alive(self._unit) and self._unit:network():peer()
		local peer_id = (peer and peer:id()) or 0 
		if peer_id then
			SaveEquipment:increaseDowns(peer_id)
		end
	end)
elseif RequiredScript == "lib/network/base/networkpeer" then
	Hooks:Add("NetworkManagerOnPeerAdded", "SaveEquipment_Connect", function(peer, peer_id)
		if not _G.LuaNetworking:IsHost() then
			return
		end
		DelayedCalls:Add("SaveEquipment_Connect_PEER" .. tostring(peer_id), 2, function()
			SaveEquipment:send_message_to_peer(peer, managers.localization:text("saveequipment_join_message_medic_0") .. " " .. tostring(SaveEquipmentMenu._data.multi_saveequipment_enable_medic_downs_value - 1) .. " " .. managers.localization:text("saveequipment_join_message_medic_1"))
		end)
	end)
	Hooks:Add("BaseNetworkSessionOnPeerRemoved", "SaveEquipment_Disconnect", function(peer, peer_id, reason)
		SaveEquipment:resetDowns(peer_id)
	end)
elseif RequiredScript == "lib/managers/trademanager" then
	Hooks:PostHook(TradeManager, 'on_player_criminal_death', "SaveEquipment_custodyLocal", function(self, criminal_name, respawn_penalty, hostages_killed, skip_netsend)
		SaveEquipment:resetDowns(_G.LuaNetworking:LocalPeerID())
	end)
end
if Network:is_client() then
	return
end
if Global.game_settings.level_id ~= 'rat' and Global.game_settings.level_id ~= 'alex_1' then return end
function PlayerManager:verify_carry(peer, carry_id) return true end
function NetworkPeer:verify_bag(carry_id, pickup) return true end
local M_interaction = managers.interaction
local _interactive_units = M_interaction._interactive_units
local M_player = managers.player
local _players = M_player._players
local function true_func()
	return true
end
local M_network = managers.network
local function GetNetSession()
	return M_network._session
end
local UP = Vector3(0, 0, 1)
local spawn_meth_pos
local server_drop_carry = M_player.server_drop_carry
local clear_carry = M_player.clear_carry
local G_game_settings = Global.game_settings
local level_id = G_game_settings.level_id
local n_is_client = Network.is_client
local function is_client()
	return n_is_client(Network)
end
local random = math.random
local needed_chem = {'methlab_bubbling', 'methlab_caustic_cooler', 'methlab_gas_to_salt'}
local function cook_meth(chemical)
	local player = _players[1]
	if alive(player) then
		local interaction
		if type(chemical) == 'string' then
			for _, unit in pairs(_interactive_units) do
				interaction = unit:interaction()
				if interaction.tweak_data == chemical then
					break
				end
			end
		end
		interaction.can_interact = true_func
		interaction:interact(player)
	end
end
--Toggle: autocook_FFH global integer
--1 = Off
--2 = On
if not autocook_FFH then
	--Cooker Part
	local old_queue_dialog = DialogManager.queue_dialog
	function DialogManager:queue_dialog(id, params)
		old_queue_dialog(self, id, params)
		if autocook_FFH == 2 then
			if id == 'pln_rt1_20' then
				cook_meth(needed_chem[1])
			elseif id == 'pln_rt1_22' then
				cook_meth(needed_chem[2])
			elseif id == 'pln_rt1_24' then
				cook_meth(needed_chem[3])
			end
		end
	end
	--Bagger Part
	local old_add_unit = ObjectInteractionManager.add_unit
	function ObjectInteractionManager:add_unit(unit)
		old_add_unit(self, unit)
		DelayedCalls:Add("launchmeth", 0.4, function()
			if autocook_FFH == 2 then
				local interaction = alive(unit) and unit:interaction() --test for alive and present
				if interaction and interaction.tweak_data == 'taking_meth' then
					if not spawn_meth_pos then --prep, where to launch new meth up
						local pos = interaction:interact_position()
						spawn_meth_pos = Vector3(pos.x + (level_id == 'alex_1' and -50 or 0), pos.y, pos.z + 10)
					end
					interaction:interact(_players[1])
					if is_client() then --launch new meth directly up as client
						GetNetSession():send_to_host('server_drop_carry', 'meth', 1, false, false, 1, spawn_meth_pos, Vector3(random(-180, 180), random(-180, 180), 0), UP, 100, nil)
					else--launch new meth directly up as host
						server_drop_carry(M_player, 'meth', 1, false, false, 1, spawn_meth_pos, Vector3(random(-180, 180), random(-180, 180), 0), UP, 100, nil)
					end
					clear_carry(M_player)
				end
			end
		end)
	end
	autocook_FFH = 2
	managers.chat:_receive_message(1, "Autocooker", "ON, INITIALIZED", tweak_data.system_chat_color)
elseif autocook_FFH == 1 then
	autocook_FFH = 2
	managers.chat:_receive_message(1, "Autocooker", "ON", tweak_data.system_chat_color)
elseif autocook_FFH == 2 then
	autocook_FFH = 1
	managers.chat:_receive_message(1, "Autocooker", "OFF", tweak_data.system_chat_color)
end
if not HopLib then
  return
end

if not JokerInfo then
  _G.JokerInfo = {}
  
  JokerInfo.modded_host = false

  JokerInfo.messages = {}
  local file = io.open(ModPath .. "messages.json", "r")
  if file then
    JokerInfo.messages = json.decode(file:read("*all")) or JokerInfo.messages
    file:close()
  end

  function JokerInfo:create_text(data, index)
    local text_table = data.type == 0 and self.messages.death or self.messages.survive
    if not index then
      for i, v in ipairs(text_table) do
        if data.kills <= v.threshold or i == #text_table then
          index = i
          break
        end
      end
    end
    local fixed_rnd = ((data.rnd - 1) % #text_table[index].texts) + 1
    return text_table[index].texts[fixed_rnd]:gsub("<N>", data.name):gsub("<K>", tostring(data.kills)):gsub("<A>", data.attacker or "an unknown force")
  end
  
  Hooks:Add("HopLibOnUnitDied", "HopLibOnUnitDiedJokerInfo", function (unit, damage_info)
    if JokerInfo.modded_host then
      return
    end
    local info = HopLib:unit_info_manager():get_info(unit)
    if info and info:sub_type() == "joker" then
      local attacker_info = HopLib:unit_info_manager():get_user_info(damage_info.attacker_unit)
      if not attacker_info then
        return
      end
      for i, v in ipairs(JokerInfo.messages.death) do
        if info:kills() <= v.threshold or i == #JokerInfo.messages.death then
          local data = {
            type = 0,
            rnd = math.random(#v.texts),
            name = info:nickname(),
            kills = info:kills(),
            attacker = attacker_info and attacker_info:nickname()
          }
          managers.chat:_receive_message(1, "Joker Info", JokerInfo:create_text(data, index), tweak_data.system_chat_color)
          LuaNetworking:SendToPeers("joker_info", json.encode(data))
          break
        end
      end
    end
  end)

  Hooks:Add("BaseNetworkSessionOnLoadComplete", "BaseNetworkSessionOnLoadCompleteJokerInfo", function(local_peer, id)
    if id ~= 1 then
      LuaNetworking:SendToPeer(1, "has_joker_info", "")
    end
  end)

  Hooks:Add("NetworkReceivedData", "NetworkReceivedDataJokerInfo", function(sender, id, data)
    if id == "joker_info" then
      managers.chat:_receive_message(1, "Joker Info", JokerInfo:create_text(json.decode(data)), tweak_data.system_chat_color)
    elseif id == "has_joker_info" then
      if sender == 1 then
        JokerInfo.modded_host = true
      else
        LuaNetworking:SendToPeer(sender, "has_joker_info", "")
      end
    end
  end)
  
end

if RequiredScript == "lib/states/missionendstate" then

  local at_enter_original = MissionEndState.at_enter
  function MissionEndState:at_enter(...)
    DelayedCalls:Add("Joker Info", 1, function()
      if JokerInfo.modded_host then
        return
      end
      for _, info in pairs(HopLib:unit_info_manager():all_infos()) do
        if info:sub_type() == "joker" then
          for i, v in ipairs(JokerInfo.messages.survive) do
            if info:kills() <= v.threshold or i == #JokerInfo.messages.survive then
              local data = {
                type = 1,
                rnd = math.random(#v.texts),
                name = info:nickname(),
                kills = info:kills()
              }
              managers.chat:_receive_message(1, "Joker Info", JokerInfo:create_text(data, index), tweak_data.system_chat_color)
              LuaNetworking:SendToPeers("joker_info", json.encode(data))
              break
            end
          end
        end
      end
    end)
    return at_enter_original(self, ...)
  end

end
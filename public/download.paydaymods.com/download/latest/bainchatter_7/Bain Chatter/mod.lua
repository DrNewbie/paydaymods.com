local types = {
  --Time
  { 
    triggers = {"how long", "how short", "when", "how much time"},
    responses = {"play_pln_gen_bfr_02", "play_pln_gen_bfr_03", "play_pln_gen_bfr_04"}
  },
  --Quantitiy
  {
    triggers = {"how much", "how many", "how often"},
    responses = {"play_pln_gen_count_01", "play_pln_gen_count_02", "play_pln_gen_count_03", "play_pln_gen_count_04", "play_pln_gen_count_05", "play_pln_gen_count_06", "play_pln_gen_count_07", "play_pln_gen_count_08", "play_pln_gen_count_15", "play_pln_gen_count_16"}
  },
  --Location
  { 
    triggers = {"where", "where's"},
    responses = {"play_pln_gen_dir_01", "play_pln_gen_dir_03", "play_pln_gen_dir_04", "play_pln_gen_dir_05", "play_pln_gen_dir_06", "play_pln_gen_dir_07", "play_pln_gen_dir_11", "play_pln_gen_dir_12"}
  },
    --Yes/No
  {
    triggers = {"have", "haven't", "has", "hasn't", "can", "can't", "could", "couldn't", "would", "wouldn't", "are", "aren't", "were", "is", "isn't", "was", "wasn't", "will", "do", "does", "doesn't", "did", "didn't"},
    responses = {"play_pln_gen_dir_07", "play_pln_gen_dir_08"}
  },
  --Advice
  {
    triggers = {"advice", "tip", "help"},
    responses = {"Play_pln_drl_wrn_snd", "play_pln_gen_bfr_09", "pln_esc_pep", "play_pln_gen_bfr_10", "Play_pln_ctci_01", "Play_pln_dd_01", "Play_ban_h01x", "play_pln_gen_urg_01", "play_pln_gen_count_17", "play_pln_gen_wsd_01"}
  },
  --Insult
  { 
    triggers = {"fuck you", "fuck u", "you suck", "u suck"},
    responses = {"Play_pln_sbh_01", "play_pln_gen_bfr_12", "Play_pln_sbh_01"}
  }
}

function say(sound)
  if not managers.groupai then
    return
  end
  for _, character in pairs(managers.groupai:state():all_char_criminals()) do
    if alive(character.unit) then
      character.unit:sound():say(sound, true, true)
      return
    end
  end
end

local _receive_message_orig = ChatManager._receive_message
function ChatManager:_receive_message(channel_id, name, message, color, icon)
  _receive_message_orig(self, channel_id, name, message, color, icon)
  if not self._receivers[channel_id] or not LuaNetworking:IsHost() then
    return
  end
  local msg = message:lower()
  
  if (msg:match("^bain%p+$")) then
    DelayedCalls:Add("bain_answer", 2, function() say("play_pln_gen_fbo_01") end)
    return
  end
  
  if not msg:match("^bain[%s%p]+") and not msg:match(".+%s+bain$") then
    return
  end
  
  for _, t in ipairs(types) do
    for _, lookfor in ipairs(t.triggers) do
      if msg:find("^" .. lookfor .. "%s") or msg:find("%s" .. lookfor .. "[%s%p]") then
        local play = t.responses
        local line = play[math.random(#play)]
        log("[BainChatter] Answering with " .. line .. " in 2 seconds")
        DelayedCalls:Add("bain_answer_" .. msg, 2, function() say(line) end)
        return
      end
    end
  end
end
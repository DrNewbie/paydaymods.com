local receive_message_by_peer_original = ChatManager.receive_message_by_peer
function ChatManager:receive_message_by_peer(channel_id, peer, message)
  receive_message_by_peer_original(self, channel_id, peer, message)
  if tonumber(channel_id) == 1 then
    peer._last_typing_info_t = nil
  end
end

local init_original = ChatGui.init
function ChatGui:init(...)
  init_original(self, ...)
  self:_create_info_panel()
  self:_layout_info_panel()
  self:update_info_text()
end

function ChatGui:set_leftbottom(left, bottom)
  self._panel:set_left(left)
  self._panel:set_bottom(self._panel:parent():h() - bottom + 24)
end

function ChatGui:_create_info_panel()
  self._panel:text({
    name = "info_text",
    text = "Dallas, Wolf and Chains are typing...",
    font = tweak_data.menu.pd2_small_font,
    font_size = tweak_data.menu.pd2_small_font_size,
    x = 0,
    y = 0,
    w = self._panel:w(),
    h = 24,
    color = Color.white,
    alpha = 0.75,
    layer = 1
  })
end

local _layout_input_panel_original = ChatGui._layout_input_panel
function ChatGui:_layout_input_panel()
  _layout_input_panel_original(self)
  self._input_panel:set_y(self._input_panel:parent():h() - self._input_panel:h() - 24)
end

function ChatGui:_layout_info_panel()
  local text = self._panel:child("info_text")
  text:set_left(self._panel:left() + self._input_panel:left() + self._input_panel:child("input_text"):left())
  text:set_y(text:parent():h() - text:h())
end

function ChatGui:update_info_text()
  local info_panel_text = self._panel:child("info_text")
  local text = ""
  local amount = 0
  local t = TimerManager:game():time()
  local ranges = {}
  for _, peer in pairs(LuaNetworking:GetPeers()) do
    if peer._last_typing_info_t and t < peer._last_typing_info_t + 4 then
      text = text .. (amount > 0 and ", " or "")
      table.insert(ranges, { id = peer:id(), from = utf8.len(text), to = utf8.len(text .. peer:name()) })
      text = text .. peer:name()
      amount = amount + 1
    end
  end
  
  if amount > 0 then
    self._amount_dots = self._amount_dots and (self._amount_dots + 0.25) % 4 or 0
    text = text .. " " .. (amount > 1 and "are" or "is") .. " typing" .. string.rep(".", math.floor(self._amount_dots))
    if amount > 1 then
      text = text:gsub("(.*),", "%1 and")
      ranges[#ranges].from = ranges[#ranges].from + 3
      ranges[#ranges].to = ranges[#ranges].to + 3
    end
  else
    self._amount_dots = 0
  end

  info_panel_text:set_text(text)
  for i, range in ipairs(ranges) do
    info_panel_text:set_range_color(range.from, range.to, tweak_data.chat_colors[range.id])
  end

  DelayedCallsFix:Add("chat_info_update_info_text", 0.1, function()
    self:update_info_text()
  end)
end

local key_press_original = ChatGui.key_press
function ChatGui:key_press(o, k)
  key_press_original(self, o, k)
  local t = TimerManager:game():time()
  local valid_key = k ~= Idstring("enter") and k ~= Idstring("esc")
  if valid_key and (not self._last_press_t or t > self._last_press_t + 2) then
    LuaNetworking:SendToPeers("typing_info", "")
    self._last_press_t = t
  elseif not valid_key then
    self._last_press_t = nil
  end
end

local close_original = ChatGui.close
function ChatGui:close(...)
  DelayedCallsFix:Remove("chat_info_update_info_text")
  close_original(self, ...)
end

Hooks:Add("NetworkReceivedData", "NetworkReceivedDataTypingInfo", function(sender, id, data)
  local peer = LuaNetworking:GetPeers()[sender]
  if id == "typing_info" and peer then
    peer._last_typing_info_t = TimerManager:game():time()
  end
end)
Hooks:PreHook(NetworkPeer,"set_is_vr","idvr_setvr",function(self)
	if not self._is_vr then --if using posthook or without this check, always outputs the message twice. I don't like that.
		managers.chat:_receive_message(1,"[ID_VR]", tostring(self._name) .. " is using VR!", Color('29FFC9'))
	end
end)
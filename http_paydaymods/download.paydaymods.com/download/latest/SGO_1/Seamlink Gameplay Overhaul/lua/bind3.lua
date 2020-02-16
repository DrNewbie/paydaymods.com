mute_bain_HKF = not mute_bain_HKF
managers.dialog.old_dialog_list = managers.dialog.old_dialog_list or managers.dialog._dialog_list
if mute_bain_HKF then
	local keepMU = managers.dialog.old_dialog_list.pln_rt1_20
	local keepCS = managers.dialog.old_dialog_list.pln_rt1_22
	local keepHCL = managers.dialog.old_dialog_list.pln_rt1_24
	managers.dialog._dialog_list = {keepMU, keepCS, keepHCL}
	managers.chat:_receive_message(1, "Bain", "Muted", tweak_data.system_chat_color)
else
	managers.dialog._dialog_list = managers.dialog.old_dialog_list
	managers.chat:_receive_message(1, "Bain", "Unmuted", tweak_data.system_chat_color)
end
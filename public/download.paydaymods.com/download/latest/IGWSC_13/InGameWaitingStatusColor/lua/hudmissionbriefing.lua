IGWSC:Load()

local join_old = HUDMissionBriefing.set_slot_joining
local ready_old = HUDMissionBriefing.set_slot_ready
local unready_old = HUDMissionBriefing.set_slot_not_ready
local dropin_old = HUDMissionBriefing.set_dropin_progress

function HUDMissionBriefing:set_slot_joining(peer, peer_id)
	join_old(self, peer, peer_id)
	local slot = self._ready_slot_panel:child("slot_" .. tostring(peer_id))
	if not slot or not alive(slot) then
		return
	end
	slot:child("status"):set_text(IGWSC.settings.join_text_value)
	slot:child("status"):set_color(Color(IGWSC.settings.join_color_value))
end

function HUDMissionBriefing:set_slot_ready(peer, peer_id)
	ready_old(self, peer, peer_id)
	local slot = self._ready_slot_panel:child("slot_" .. tostring(peer_id))
	if not slot or not alive(slot) then
		return
	end
	slot:child("status"):set_text(IGWSC.settings.ready_text_value)
	slot:child("status"):set_color(Color(IGWSC.settings.ready_color_value))
end

function HUDMissionBriefing:set_slot_not_ready(peer, peer_id)
	unready_old(self, peer, peer_id)
	local slot = self._ready_slot_panel:child("slot_" .. tostring(peer_id))
	if not slot or not alive(slot) then
		return
	end
	slot:child("status"):set_text(IGWSC.settings.unready_text_value)
	slot:child("status"):set_color(Color(IGWSC.settings.unready_color_value))
end

function HUDMissionBriefing:set_dropin_progress(peer_id, progress_percentage, mode)
	dropin_old(self, peer_id, progress_percentage, mode)
	local slot = self._ready_slot_panel:child("slot_" .. tostring(peer_id))
	if not slot or not alive(slot) then
		return
	end
	slot:child("status"):set_text(IGWSC.settings.dropin_text_value .. " " .. tostring(progress_percentage) .. "%")
	slot:child("status"):set_color(Color(IGWSC.settings.dropin_color_value))
end
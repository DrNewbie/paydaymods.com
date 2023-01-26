if not SGO or not SGO.settings.use_invt then return end
if SystemFS:exists("mods/WolfHUD/mod.txt") or SystemFS:exists("mods/WolfHUD-master/mod.txt") then return end
local orig_blackmarket_gui_slot_item_select = BlackMarketGuiSlotItem.select
function BlackMarketGuiSlotItem:select(instant, no_sound)
	self._data.hide_unselected_mini_icons = false
	return orig_blackmarket_gui_slot_item_select(self, instant, no_sound)
end

local orig_blackmarket_gui_slot_item_deselect = BlackMarketGuiSlotItem.deselect
function BlackMarketGuiSlotItem:deselect(instant)
	self._data.hide_unselected_mini_icons = false
	return orig_blackmarket_gui_slot_item_deselect(self, instant)
end
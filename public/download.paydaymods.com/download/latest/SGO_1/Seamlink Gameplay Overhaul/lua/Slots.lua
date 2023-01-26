if not SGO or not SGO.settings.use_slot then return end
if SystemFS:exists("mods/MoreInventorySlots/mod.txt") then return end
--The Original creator of this script is called Noep
if not tweak_data then return end

tweak_data.gui.MAX_MASK_PAGES = 10
tweak_data.gui.MASK_ROWS_PER_PAGE = 6
tweak_data.gui.MASK_COLUMNS_PER_PAGE = 6
tweak_data.gui.MAX_WEAPON_PAGES = 10
tweak_data.gui.WEAPON_ROWS_PER_PAGE = 6
tweak_data.gui.WEAPON_COLUMNS_PER_PAGE = 6
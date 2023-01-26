if not SGO or not SGO.settings.use_skco then return end
local function expect_yes(self, params) params.yes_func() end -- This function was created by notwa, all other code is created by ReaperTeh.

-- Skills
MenuManager.show_confirm_skillpoints = expect_yes
MenuManager.show_confirm_respec_skilltree = expect_yes

-- Offshore contracts
MenuManager.show_confirm_buy_premium_contract = expect_yes

-- Weapons
MenuManager.show_confirm_blackmarket_buy = expect_yes
MenuManager.show_confirm_blackmarket_sell = expect_yes
MenuManager.show_confirm_blackmarket_mod = expect_yes

-- Slots
MenuManager.show_confirm_blackmarket_buy_mask_slot = expect_yes
MenuManager.show_confirm_blackmarket_buy_weapon_slot = expect_yes

-- Masks
MenuManager.show_confirm_blackmarket_mask_sell = expect_yes
MenuManager.show_confirm_blackmarket_mask_remove = expect_yes
MenuManager.show_confirm_blackmarket_finalize = expect_yes
MenuManager.show_confirm_blackmarket_assemble = expect_yes
-- MenuManager.show_confirm_blackmarket_abort = expect_yes (This removes the dialog when you try to abort mask customization. As it's quite easy to do this by accident, this is commented out by default, but there's no problems with uncommenting it.)

-- Assets
MenuManager.show_confirm_mission_asset_buy = expect_yes

-- Infamy
MenuManager.show_confirm_become_infamous = expect_yes
MenuManager.show_confirm_infamypoints = expect_yes


-- MenuManager.show_confirm_blackmarket_sell_no_slot = expect_yes (Don't know what this does, but should be harmless to uncomment.)
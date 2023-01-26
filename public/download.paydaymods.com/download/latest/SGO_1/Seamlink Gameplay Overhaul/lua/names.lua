if not SGO or not SGO.settings.use_invt then return end
if SystemFS:exists("mods/WolfHUD/mod.txt") or SystemFS:exists("mods/WolfHUD-master/mod.txt") then return end
--[[if BlackmarketPersistentNames_BlackMarketGui_Hooked then
	return
else
	BlackmarketPersistentNames_BlackMarketGui_Hooked = true
end
--]]
-- The following code affects only the main menu blackmarket GUI

--////////////////////////--
--//  Persistent names  //--
--////////////////////////--

local populate_characters_actual = BlackMarketGui.populate_characters
function BlackMarketGui:populate_characters(data, ...)
	populate_characters_actual(self, data, ...)

	local prefs = _G.BlackmarketPersistentNames
	prefs = prefs ~= nil and prefs.Prefs or nil
	if prefs ~= nil then
		if not prefs.CharacterNames then
			return
		end
	end

	-- The character selection screen does not display empty slots, so no checks are needed
	for index, tbl in ipairs(data) do
		-- Since custom names are always shown, trick the common GUI code into thinking all items have custom names
		tbl.custom_name_text = tbl.custom_name_text or tbl.name_localized
	end
end

local populate_grenades_actual = BlackMarketGui.populate_grenades
function BlackMarketGui:populate_grenades(data, ...)
	populate_grenades_actual(self, data, ...)

	local prefs = _G.BlackmarketPersistentNames
	prefs = prefs ~= nil and prefs.Prefs or nil
	if prefs ~= nil then
		if not prefs.ThrowableWeaponNames then
			return
		end
	end

	-- The throwable weapon selection screen does not display empty slots, so no checks are needed
	for index, tbl in ipairs(data) do
		-- Since custom names are always shown, trick the common GUI code into thinking all items have custom names
		tbl.custom_name_text = tbl.custom_name_text or tbl.name_localized
	end
end

local populate_melee_weapons_new_actual = BlackMarketGui.populate_melee_weapons_new
function BlackMarketGui:populate_melee_weapons_new(data, ...)
	populate_melee_weapons_new_actual(self, data, ...)

	local prefs = _G.BlackmarketPersistentNames
	prefs = prefs ~= nil and prefs.Prefs or nil
	if prefs ~= nil then
		if not prefs.MeleeWeaponNames then
			return
		end
	end

	-- The melee weapon selection screen does not display empty slots, so no checks are needed
	for index, tbl in ipairs(data) do
		-- Since custom names are always shown, trick the common GUI code into thinking all items have custom names
		tbl.custom_name_text = tbl.custom_name_text or tbl.name_localized
	end
end

local populate_deployables_actual = BlackMarketGui.populate_deployables
function BlackMarketGui:populate_deployables(data, ...)
	populate_deployables_actual(self, data, ...)

	local prefs = _G.BlackmarketPersistentNames
	prefs = prefs ~= nil and prefs.Prefs or nil
	if prefs ~= nil then
		if not prefs.DeployableNames then
			return
		end
	end

	-- The deployable selection screen does not display empty slots, so no checks are needed
	for index, tbl in ipairs(data) do
		-- Since custom names are always shown, trick the common GUI code into thinking all items have custom names
		tbl.custom_name_text = tbl.custom_name_text or tbl.name_localized
	end
end

local populate_armors_actual = BlackMarketGui.populate_armors
function BlackMarketGui:populate_armors(data, ...)
	populate_armors_actual(self, data, ...)

	local prefs = _G.BlackmarketPersistentNames
	prefs = prefs ~= nil and prefs.Prefs or nil
	if prefs ~= nil then
		if not prefs.ArmorNames then
			return
		end
	end

	-- The armor selection screen does not display empty slots, so no checks are needed
	for index, tbl in ipairs(data) do
		-- Since custom names are always shown, trick the common GUI code into thinking all items have custom names
		tbl.custom_name_text = tbl.custom_name_text or tbl.name_localized
	end
end

local populate_weapon_cosmetics_actual = BlackMarketGui.populate_weapon_cosmetics
function BlackMarketGui:populate_weapon_cosmetics(data, ...)
	populate_weapon_cosmetics_actual(self, data, ...)

	local prefs = _G.BlackmarketPersistentNames
	prefs = prefs ~= nil and prefs.Prefs or nil
	if prefs ~= nil then
		if not prefs.WeaponSkinNames then
			return
		end
	end

	for index, tbl in ipairs(data) do
		-- Since custom names are always shown, trick the common GUI code into thinking all items have custom names
		tbl.custom_name_text = tbl.custom_name_text or tbl.name_localized
	end
end

local populate_weapon_category_new_actual = BlackMarketGui.populate_weapon_category_new
function BlackMarketGui:populate_weapon_category_new(data, ...)
	populate_weapon_category_new_actual(self, data, ...)

	local prefs = _G.BlackmarketPersistentNames
	prefs = prefs ~= nil and prefs.Prefs or nil
	if prefs ~= nil then
		if not prefs.PriSecWeaponNames then
			return
		end
	end

	for index, tbl in ipairs(data) do
		-- Relevant table data:
		-- tbl.name: Internal name (e.g. 'glock_17'; prepend it with 'bm_w_' to form a valid string_id)
		-- tbl.name_localized: Translated name (e.g. 'Chimano 88 Pistol')
		-- tbl.raw_name_localized: If a custom name is set, tbl.custom_name_text. Otherwise, it defaults to tbl.name_localized
		-- tbl.custom_name_text: A custom name, or nil if not set

		-- Don't show the text for empty or locked slots
		if tbl.raw_name_localized ~= nil then
			-- Since custom names are always shown, trick the common GUI code into thinking all items have custom names
			tbl.custom_name_text = tbl.custom_name_text or tbl.name_localized
		end
	end
end

local populate_masks_new_actual = BlackMarketGui.populate_masks_new
function BlackMarketGui:populate_masks_new(data, ...)
	populate_masks_new_actual(self, data, ...)

	local prefs = _G.BlackmarketPersistentNames
	prefs = prefs ~= nil and prefs.Prefs or nil
	if prefs ~= nil then
		if not prefs.MaskNames then
			return
		end
	end

	for index, tbl in ipairs(data) do
		-- Don't show the text for empty or locked slots
		if tbl.raw_name_localized ~= nil then
			-- Since custom names are always shown, trick the common GUI code into thinking all items have custom names
			tbl.custom_name_text = tbl.custom_name_text or tbl.name_localized
		end
	end
end

local populate_mods_actual = BlackMarketGui.populate_mods
function BlackMarketGui:populate_mods(data, ...)
	populate_mods_actual(self, data, ...)

	local prefs = _G.BlackmarketPersistentNames
	prefs = prefs ~= nil and prefs.Prefs or nil
	if prefs ~= nil then
		if not prefs.WeaponModNames then
			return
		end
	end

	-- The weapon mod selection screen does not display empty slots, so no checks are needed
	for index, tbl in ipairs(data) do
		-- Since custom names are always shown, trick the common GUI code into thinking all items have custom names
		tbl.custom_name_text = tbl.custom_name_text or tbl.name_localized
	end
end

local populate_buy_weapon_actual = BlackMarketGui.populate_buy_weapon
function BlackMarketGui:populate_buy_weapon(data, ...)
	populate_buy_weapon_actual(self, data, ...)

	local prefs = _G.BlackmarketPersistentNames
	prefs = prefs ~= nil and prefs.Prefs or nil
	if prefs ~= nil then
		if not prefs.BuyWeaponNames then
			return
		end
	end

	-- The weapon purchase selection screen does not display empty slots, so no checks are needed
	for index, tbl in ipairs(data) do
		-- Since custom names are always shown, trick the common GUI code into thinking all items have custom names
		tbl.custom_name_text = tbl.custom_name_text or tbl.name_localized
	end
end

local populate_buy_mask_actual = BlackMarketGui.populate_buy_mask
function BlackMarketGui:populate_buy_mask(data, ...)
	populate_buy_mask_actual(self, data, ...)

	local prefs = _G.BlackmarketPersistentNames
	prefs = prefs ~= nil and prefs.Prefs or nil
	if prefs ~= nil then
		if not prefs.BuyMaskNames then
			return
		end
	end

	-- The mask purchase selection screen does not display empty slots, so no checks are needed
	for index, tbl in ipairs(data) do
		-- Since custom names are always shown, trick the common GUI code into thinking all items have custom names
		tbl.custom_name_text = tbl.custom_name_text or tbl.name_localized
	end
end

local populate_choose_mask_mod_actual = BlackMarketGui.populate_choose_mask_mod
function BlackMarketGui:populate_choose_mask_mod(data, ...)
	populate_choose_mask_mod_actual(self, data, ...)

	local prefs = _G.BlackmarketPersistentNames
	prefs = prefs ~= nil and prefs.Prefs or nil
	if prefs ~= nil then
		if not prefs.MaskModNames then
			return
		end
	end

	-- The mask mod selection screen does not display empty slots, so no checks are needed
	for index, tbl in ipairs(data) do
		-- Since custom names are always shown, trick the common GUI code into thinking all items have custom names
		tbl.custom_name_text = tbl.custom_name_text or tbl.name_localized
	end
end

local populate_inventory_tradable_actual = BlackMarketGui.populate_inventory_tradable
function BlackMarketGui:populate_inventory_tradable(data, ...)
	populate_inventory_tradable_actual(self, data, ...)

	local prefs = _G.BlackmarketPersistentNames
	prefs = prefs ~= nil and prefs.Prefs or nil
	if prefs ~= nil then
		if not prefs.SteamInventoryNames then
			return
		end
	end

	-- The mask mod selection screen does not display empty slots, so no checks are needed
	for index, tbl in ipairs(data) do
		-- Since custom names are always shown, trick the common GUI code into thinking all items have custom names
		tbl.custom_name_text = tbl.custom_name_text or tbl.name_localized
	end
end

-- The following code affects both the main menu blackmarket GUI and the mission briefing GUI loadout blackmarket GUI

--////////////////////////////--
--//  Highlight focus mode  //--
--////////////////////////////--

-- Before proceeding, it is important to be aware of the fact that item slots can be in any of three states (four if you really
-- want to be that pedantic):
-- 1) not selected, not highlighted
-- 2) not selected, highlighted
-- 3) selected, not highlighted
-- 4) selected, highlighted (doesn't really matter in most cases)
-- 5) equipped (okay, I lied; this doesn't really count)
-- A selected item slot has a full-length rectangular border enclosing it and a normal-sized icon texture
-- An equipped item slot has four open 'box corner' corners and a normal-sized icon texture
-- A highlighted item slot has no border but an enlarged icon texture
-- A completely unselected, non-highlighted item slot has no borders nor corners and a normal-sized icon texture
-- By this point you should have realized that highlighting and selection are completely independent of one another and can point
-- to completely different item slots on the same tab

local dimmed_text_alpha = 0.5
local dimmed_modicons_alpha = 0.4

local function FadeIn(object)
	if alive(object) then
		local current_alpha = object:alpha()
		over(0.3, function(progress)
			object:set_alpha(math.lerp(current_alpha, 1, progress))
		end)
	end
end

local function FadeOut(object, target_alpha, hide_upon_completion)
	if alive(object) then
		local current_alpha = object:alpha()
		if hide_upon_completion then
			target_alpha = 0
		end
		over(0.3, function(progress)
			object:set_alpha(math.lerp(current_alpha, target_alpha, progress))
		end)
		if hide_upon_completion then
			object:hide()
		end
	end
end

local set_highlight_actual = BlackMarketGuiSlotItem.set_highlight
function BlackMarketGuiSlotItem:set_highlight(highlight, instant, ...)
	set_highlight_actual(self, highlight, instant, ...)

	if self._name == "empty_slot" then
		return
	end

	local custom_name_text = self._panel
	if not alive(custom_name_text) then
		return
	end

	custom_name_text = custom_name_text:child("custom_name_text")
	if not alive(custom_name_text) then
		return
	end

	local mini_panel = self._mini_panel
	if not alive(mini_panel) then
		mini_panel = nil
	end

	custom_name_text:stop()
	if mini_panel then
		mini_panel:stop()
	end

	local data = self._data

	if not data.unlocked or data.lock_texture then
		custom_name_text:set_alpha(dimmed_text_alpha)
		if mini_panel then
			mini_panel:set_alpha(dimmed_text_alpha)
		end
		return
	end

	-- Don't fade *actual* user-customized names away. Since the game apparently loses track of the default translated name,
	-- string comparisons between custom_name_text and name_localized will always be true, even for user-customized names. But
	-- performing a string translation lookup just for this feels like a waste of performance. Instead, determine whether a
	-- custom name is user-customized by checking if the first character is "
	local is_custom = data.custom_name_text:sub(1, 1) == "\""

	local prefs = _G.BlackmarketPersistentNames
	prefs = prefs ~= nil and prefs.Prefs or nil
	if prefs ~= nil then
		if is_custom and prefs.SuppressCustomNameQuotes then
			local text = data.custom_name_text
			custom_name_text:set_text(text:sub(2, text:len() - 1))
		end

		if not prefs.NeverDimCustomNames then
			is_custom = false
		end
	end

	if not instant then
		highlight = highlight or self.blackmarketpersistentnames_currently_selected
		if not highlight and not is_custom then
			custom_name_text:animate(FadeOut, dimmed_text_alpha)
		else
			custom_name_text:animate(FadeIn)
		end

		if mini_panel then
			if not highlight then
				mini_panel:animate(FadeOut, dimmed_modicons_alpha, data.hide_unselected_mini_icons)
			else
				if data.hide_unselected_mini_icons then
					mini_panel:show()
				end
				mini_panel:animate(FadeIn)
			end
		end
	else
		custom_name_text:set_alpha((highlight or is_custom) and 1 or dimmed_text_alpha)
		if mini_panel then
			mini_panel:set_alpha(highlight and 1 or dimmed_modicons_alpha)
		end
	end
end

--////////////////////////////////////--
--//  Enhanced keyboard navigation  //--
--////////////////////////////////////--

local function UpdateSlotHighlight(self, ...)
	local current_tab = self._tabs[self._selected]
	-- Do not check current_tab._slot_highlighted as it can be nil when switching tabs with the mouse wheel. *stare* What, can't
	-- people use the keyboard and mouse simultaneously?
	if current_tab == nil or current_tab._slot_selected == nil or current_tab._slots == nil then
		return
	end

	local highlighted = current_tab._slots[current_tab._slot_highlighted]
	local selected = current_tab._slots[current_tab._slot_selected]

	if highlighted ~= nil then
		-- Remove the highlight from the currently highlighted item
		highlighted:set_highlight(false)
	end

	if selected ~= nil then
		current_tab._slot_highlighted = current_tab._slot_selected
		selected:set_highlight(true)
	end
end

-- Enhance keyboard navigation by automatically triggering a slot highlight upon slot selection (the game does not do this by
-- default, allowing current_tab._slot_highlighted and current_tab._slot_selected to point to separate slots), or switching tabs
Hooks:PostHook(BlackMarketGui, "on_slot_selected", "BlackmarketPersistentNames_BlackMarketGui_on_slot_selected", UpdateSlotHighlight)
Hooks:PostHook(BlackMarketGui, "set_selected_tab", "BlackmarketPersistentNames_BlackMarketGui_set_selected_tab", UpdateSlotHighlight)

-- HACK: Because slots do not keep track of whether they are selected, force them to here. This is referenced in
-- BlackMarketGuiSlotItem:set_highlight() above, in conjunction with self._data.hide_unselected_mini_icons

local select_actual = BlackMarketGuiItem.select
function BlackMarketGuiItem:select(instant, no_sound, ...)
	self.blackmarketpersistentnames_currently_selected = true

	return select_actual(self, instant, no_sound, ...)
end

local deselect_actual = BlackMarketGuiItem.deselect
function BlackMarketGuiItem:deselect(instant, ...)
	self.blackmarketpersistentnames_currently_selected = nil

	-- HACK: Prevent the slot's weapon mod icons from being stuck in the selected state by forcing a highlight removal now
	-- Tagging this as a hack since it calls the game code as well as the function (instead of only the latter)
	self:set_highlight(false)

	return deselect_actual(self, instant, ...)
end

-- Because the game's default action on self._data.hide_unselected_mini_icons interferes with the fading out of the mod icons,
-- force the panel to be shown again when the game code hides it upon deselection. It will automatically be hidden again upon
-- animation completion (see FadeOut() above)
local deselect_actual = BlackMarketGuiSlotItem.deselect
function BlackMarketGuiSlotItem:deselect(instant, ...)
	deselect_actual(self, instant, ...)

	if instant then
		return
	end

	local data = self._data
	if data ~= nil then
		if data.hide_unselected_mini_icons then
			self._mini_panel:show()
		end
	end
end

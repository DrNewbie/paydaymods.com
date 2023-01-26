if Holo.Options:GetValue("Menu") then
	Hooks:PostHook(BlackMarketGuiTabItem, "init", "HoloInit", function( self )
		self._tab_panel:child("tab_select_rect"):move(0, -1.5)
		self._tab_panel:child("tab_text"):show()
	end)
	function BlackMarketGuiTabItem:refresh()
		self._alpha = 1
		self._tab_panel:child("tab_text"):set_color(Holo:GetColor("TextColors/Tab"))
		self._tab_panel:child("tab_text"):set_blend_mode("normal")
		local x,y,w,h = self._tab_panel:child("tab_select_rect"):shape()
		self._tab_panel:child("tab_select_rect"):set_image("units/white_df")
		self._tab_panel:child("tab_select_rect"):set_color((self._selected or self._highlighted) and Holo:GetColor("Colors/TabHighlighted") or Holo:GetColor("Colors/Tab"))
		self._tab_panel:child("tab_select_rect"):show()
		if self._child_panel and alive(self._child_panel) then
			self._child_panel:set_visible(self._selected)
		end
		if alive(self._tab_pages_panel) then
			self._tab_pages_panel:set_visible(self._selected)
		end
	end
	BlackMarketGuiButtonItem = BlackMarketGuiButtonItem or class(BlackMarketGuiItem)
	function BlackMarketGuiButtonItem:init(main_panel, data, x)
		BlackMarketGuiButtonItem.super.init(self, main_panel, data, 0, 0, 10, 10)
		local up_font_size = (SystemInfo:platform() ~= Idstring("WIN32")) and RenderSettings.resolution.y < 720 and self._data.btn == "BTN_STICK_R" and 2 or 0
		self._btn_text = self._panel:text({
			name = "text",
			text = "",
			align = "left",
			x = 10,
			font_size = tweak_data.menu.pd2_small_font_size + up_font_size,
			font =tweak_data.menu.pd2_small_font,
			color = Holo:GetColor("TextColors/Menu"),
			blend_mode = "normal",
			layer = 1
		})
		self._btn_text_id = data.name
		self._btn_text_legends = data.legends
		BlackMarketGui.make_fine_text(self, self._btn_text)
		self._panel:set_size(main_panel:w() - x * 2, tweak_data.menu.pd2_medium_font_size)
		self._panel:rect({
			name = "select_rect",
			color = Holo:GetColor("Colors/Marker"),
			rotation = 360,
			alpha = 0,
			x = self._panel:w() + 2,
			w = 2,
			valign = "scale",
			halign = "scale"
		})
		if not managers.menu:is_pc_controller() then
			self._btn_text:set_color(tweak_data.screen_colors.text)
		end
		self._panel:set_left(x)
		self._panel:hide()
		self:set_order(data.prio)
		self._btn_text:set_right(self._panel:w())
		self:deselect(true)
		self:set_highlight(false)
	end
	function BlackMarketGuiButtonItem:refresh()
		if managers.menu:is_pc_controller() then
			self._btn_text:set_color(self._highlighted and Holo:GetColor("TextColors/MenuHighlighted") or Holo:GetColor("TextColors/Menu"))
		end
		self._panel:child("select_rect"):stop()
		QuickAnim:Work(self._panel:child("select_rect"), "alpha", self._highlighted and 1 or 0, "speed", 5)
	end
	Hooks:PostHook(BlackMarketGui, "_setup", "HoloSetup", function(self, is_start_page, component_data)
		Holo.Utils:FixBackButton(self, self._panel:child("back_button"))
		Holo.Utils:SetBlendMode(self._panel, "suspicion")
	end)
	Hooks:PostHook(BlackMarketGui, "set_weapons_stats_columns", "HoloSetWeaponsStatsColumns", function(self)
		for i, stat in ipairs(self._stats_shown) do
			self._stats_texts[stat.name].skill:set_blend_mode("normal")
			self._stats_texts[stat.name].skill:set_color(Holo:GetColor("Colors/Marker"))
		end
	end)
	Hooks:PostHook(BlackMarketGui, "set_weapon_mods_stats_columns", "HoloSetWeaponModsStatsColumns", function(self)
		for i, stat in ipairs(self._stats_shown) do
			self._stats_texts[stat.name].skill:set_blend_mode("normal")
			self._stats_texts[stat.name].skill:set_color(Holo:GetColor("Colors/Marker"))
		end
	end)
	Hooks:PostHook(BlackMarketGui, "show_stats", "HoloShowStats", function(self)
		for i, stat in ipairs(self._stats_shown) do
			self._stats_texts[stat.name].skill:set_blend_mode("normal")
			self._stats_texts[stat.name].skill:set_color(Holo:GetColor("Colors/Marker"))
		end
	end)
	Hooks:PostHook(BlackMarketGui, "set_stats_titles", "HoloSetStatsTitles", function(self, ...)
		self._stats_titles.skill:set_blend_mode("normal")
		self._stats_titles.skill:set_color(Holo:GetColor("Colors/Marker"))
	end)
	BlackMarketGuiSlotItem._init = BlackMarketGuiSlotItem._init or BlackMarketGuiSlotItem.init
	function BlackMarketGuiSlotItem:init(panel, data, ...)
		if data.lock_texture == true then
			data.lock_texture = "guis/textures/pd2/skilltree/padlock"
		end
		self:_init(panel, data, ...)
		if self._bitmap then
			self._bitmap:set_color(Color.white)
			self._bitmap:set_blend_mode("normal")
		end	
		if self._lock_bitmap then
			self._lock_bitmap:set_size(16, 16)
			self._lock_bitmap:set_leftbottom(4, self._panel:h() - 4)
		end
	end
 
	function BlackMarketGuiSlotItem:select(instant, no_sound)
		BlackMarketGuiSlotItem.super.select(self, instant, no_sound)
		if not managers.menu:is_pc_controller() then
			self:set_highlight(true, instant)
		end
		if self._text_in_mid and alive(self._panel:child("text")) then
			self._panel:child("text"):set_color(Holo:GetColor("Colors/Marker"))
			self._panel:child("text"):set_blend_mode("normal")
			self._panel:child("text"):set_text(self._data.mid_text.no_upper and self._data.mid_text.selected_text or utf8.to_upper(self._data.mid_text.selected_text or ""))
			if alive(self._lock_bitmap) and self._data.mid_text.is_lock_same_color then
				self._lock_bitmap:set_color(self._panel:child("text"):color())
			end
		end
		if self._data.new_drop_data then
			local newdrop = self._data.new_drop_data
			if newdrop[1] and newdrop[2] and newdrop[3] then
				managers.blackmarket:remove_new_drop(newdrop[1], newdrop[2], newdrop[3])
				if newdrop.icon then
					newdrop.icon:parent():remove(newdrop.icon)
				end
				self._data.new_drop_data = nil
			end
		end
		if self._panel:child("equipped_text") and self._data.selected_text and not self._data.equipped then
			self._panel:child("equipped_text"):set_text(self._data.selected_text)
		end
		if self._mini_panel and self._data.hide_unselected_mini_icons then
			self._mini_panel:show()
		end
		return self
	end
	function BlackMarketGuiSlotItem:deselect(instant)
		BlackMarketGuiSlotItem.super.deselect(self, instant)
		if not managers.menu:is_pc_controller() then
			self:set_highlight(false, instant)
		end
		if self._text_in_mid and alive(self._panel:child("text")) then
			self._panel:child("text"):set_color(Holo:GetColor("TextColors/Menu"))
			self._panel:child("text"):set_blend_mode("normal")
			self._panel:child("text"):set_text(self._data.mid_text.no_upper and self._data.mid_text.noselected_text or utf8.to_upper(self._data.mid_text.noselected_text or ""))
			if alive(self._lock_bitmap) and self._data.mid_text.is_lock_same_color then
				self._lock_bitmap:set_color(self._panel:child("text"):color())
			end
		end
		if self._panel:child("equipped_text") and self._data.selected_text and not self._data.equipped then
			self._panel:child("equipped_text"):set_text("")
		end
		if self._mini_panel and self._data.hide_unselected_mini_icons then
			self._mini_panel:hide()
		end
	end
end

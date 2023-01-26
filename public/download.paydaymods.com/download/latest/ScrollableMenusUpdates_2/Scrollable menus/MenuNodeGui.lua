local NG = CoreMenuNodeGui.NodeGui
local orig_i = NG.init
function NG:init(node, layer, parameters)
	for _, v in pairs({"video", "options", "lua"}) do
		if node:parameters().name:match(v) then
			self:setup_custom_funcs()
			self.node = node
			self.name = node:parameters().name
			self.font = "core/fonts/diesel"
			self.font_size = 28
			self.topic_font_size = 48
			self.spacing = 0
			self.height_padding = 0
			local safe_rect_pixels = managers.viewport:get_safe_rect_pixels()
			self.ws = managers.gui_data:create_saferect_workspace()
			self._item_panel_parent = self.ws:panel():panel({
				name = "item_panel_parent"
			})
		    self._scroll = ScrollablePanel:new(self._item_panel_parent, "item_panel", {padding = 8, hide_shade = true})
		    self.item_panel = self._scroll:canvas()
			self.safe_rect_panel = self.ws:panel():panel({
				name = "safe_rect_panel"
			})
			self.ws:show()
			self.layers = {}
			self.layers.first = layer
			self.layers.background = layer
			self.layers.marker = layer + 1
			self.layers.items = layer + 2
			self.layers.last = self.layers.items
			self.localize_strings = true
			self.row_item_color = self.row_item_color or Color(1, 0.5529412, 0.6901961, 0.827451)
			self.row_item_hightlight_color = self.row_item_hightlight_color or Color(1, 0.5529412, 0.6901961, 0.827451)
			self.row_item_disabled_text_color = self.row_item_disabled_text_color or Color(1, 0.5, 0.5, 0.5)
			self.corner_items = {}
			if parameters then
				for param_name, param_value in pairs(parameters) do
					self[param_name] = param_value
				end
			end
			if self.texture then
				self.texture.layer = self.layers.background
				self.texture = self.ws:panel():bitmap(self.texture)
				self.texture:set_visible(true)
			end
			self:_setup_panels(node)
			self.row_items = {}
			self:_setup_item_rows(node)
			break
		end
	end
	if self.node ~= node then
		orig_i(self, node, layer, parameters)
	end
end

function NG:setup_custom_funcs()
	function self:scroll_start() end
	function self:mouse_move(x, y) return self._scroll:mouse_moved(nil, x, y) end
	function self:mouse_release(button, x, y) return self._scroll:mouse_released(button, x, y) end

	self._mouse_pressed = self._mouse_pressed or self.mouse_pressed
	function self:mouse_pressed(button, x, y)
		if self._item_panel_parent:inside(x, y) and x > self:_mid_align() then
			if button == Idstring("0") then
				return self._scroll:mouse_pressed(button, x, y)
			elseif button == Idstring("mouse wheel down") then
		       	return self._scroll:scroll(x, y, -1)
		    elseif button == Idstring("mouse wheel up") then
		        return self._scroll:scroll(x, y, 1)
		    end
		end
		return self:_mouse_pressed(button, x, y)
	end

	function self:_setup_item_panel(safe_rect, res)
		self._scroll:set_size(self._item_panel_parent:size())
		self._scroll:set_canvas_size(safe_rect.width, self:_item_panel_height())
		self._scroll:canvas():set_world_right(self._scroll:is_scrollable() and (self._scroll._scroll_bar:world_left() - 6) or self._scroll._scroll_bar:world_right()) 
		self:_set_topic_position()
		if self._item_panel_parent:h() < self.item_panel:h() then
			self._list_arrows.up:set_visible(true)
			self._list_arrows.down:set_visible(true)
			self._list_arrows.up:set_color(self._list_arrows.up:color():with_alpha(0.5))
		end
	end
end

local orig_mm = MenuInput.mouse_moved
function MenuInput:mouse_moved(o, x, y, mouse_ws)
	if not managers.menu:active_menu() then
		return
	end
	self._keyboard_used = false
	self._mouse_moved = true
	if managers.menu_component:input_focus() ~= true then
		local node_gui = managers.menu:active_menu().renderer:active_node_gui()
		if node_gui then
			if node_gui.mouse_move and not node_gui._listening_to_input then
				if node_gui:mouse_move(self:_modified_mouse_pos(x, y)) then
					return 
				end
			end
		end
	end
	orig_mm(self, o, x, y, mouse_ws)
end

Hooks:PreHook(MenuInput, "mouse_released", "PreMouseReleasedImp", function(self, o, button, x, y)
	if not self._accept_input then
		return
	end
	x, y = self:_modified_mouse_pos(x, y)
	if managers.menu_component:input_focus() ~= true then
		local node_gui = managers.menu:active_menu().renderer:active_node_gui()
		if node_gui then
			if node_gui.mouse_release and not node_gui._listening_to_input then
				node_gui:mouse_release(button, x, y) 
			end
		end
	end
end)
 
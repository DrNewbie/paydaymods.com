--------
-- MUI <https://paydaymods.com/mods/44/arm_mui>
-- Copyright (C) 2015 Armithaig
-- License GPLv3 <https://www.gnu.org/licenses/>
--
-- Inquiries should be submitted by email to <mui@amaranth.red>.
--------
_G.MUIMenu = _G.MUIMenu or class();
MUIMenu._path = ModPath;
MUIMenu._data_path = SavePath .. "mui_options.txt";
MUIMenu._override_test_path = "assets/mod_overrides";
MUIMenu._asset_test_path = "assets/mod_overrides/MUIAssets/guis/textures/pd2/hud_health.texture";
MUIMenu._assets = nil;
MUIMenu._data = {};
MUIMenu._default_values = {};
MUIMenu._focus = false;
MUIMenu._class = nil;
MUIMenu._class_table = {};
MUIMenu._class_enabled = nil;



function MUIMenu:Save()
	local file = io.open( self._data_path, "w+" );
	if file then
		self:Clean();
		local json_enc = json.encode( self._data );
		-- Prevents BLT crash bug when trying to parse empty brackets [], empty braces {} are fine though.
		file:write( json_enc ~= "[]" and json_enc or "{}" );
		file:close();
	end
end

function MUIMenu:Load()
	if self._loaded then return self._data; end
	local file = io.open( self._data_path, "r" );
	if file then
		self._data = json.decode( file:read("*all") );
		file:close();
	end
	self._loaded = true;
	return self._data;
end

function MUIMenu:Clean()
	local dflt_val = self._default_values;
	local data = self._data;
	if not next(dflt_val) then return; end
	
	for k, _ in pairs( data ) do
		if dflt_val[k] == nil then
			data[k] = nil;
		end
	end
end

function MUIMenu:Assets()
	if self._assets == nil then
		self._assets = false;
		local file = io.open( self._asset_test_path, "r" );
		if file then
			self._assets = true;
			file:close();
		end
	end
	return self._assets;
end

-------
-- BLT will hang on "Verifying..." if mod_overrides folder doesn't exist, let's work around that and create it.
function MUIMenu.CheckOverrides()
	local path = MUIMenu._override_test_path;

	if file and file.CreateDirectory and not file.DirectoryExists(path) then
		file.CreateDirectory(MUIMenu._override_test_path); -- Linux, BLT4L
	elseif SystemFS and SystemFS.make_dir and not SystemFS:exists(path) then
		SystemFS:make_dir(MUIMenu._override_test_path); -- Windows, BLT
	else return; end
	log("[MUI] Created mod_overrides directory (BLT Verification Workaround)");
end

function MUIMenu:ClassEnabled(class)
	if not self._class_enabled then
		local data = self:Load();
		self._class_enabled = {
			MUITeammate = data.mui_team_enabled,
			MUILabel = data.mui_label_enabled,
			MUIStats = data.mui_stats_enabled,
			MUIChat = data.mui_chat_enabled,
			MUIBag = data.mui_bag_enabled,
			MUIInteract = data.mui_interact_enabled,
			MUIVoice = data.mui_voice_enabled,
			MUISubtitle = data.mui_subtitle_enabled,
			MUISuspicion = data.mui_suspicion_enabled,
			MUIPresent = data.mui_present_enabled,
			MUIHint = data.mui_hint_enabled,
			MUIWaypoint = data.mui_waypoint_enabled,
			MUICustody = data.mui_custody_enabled
		};
	end
	return self._class_enabled[class] ~= false;
end

-- Nabbed and altered from menus.lua in BLT source, allows for less boilerplate junk in json files and some extra functionality
function MUIMenu:LoadFromJsonFiles( file_paths, data_table, default_table )
	local jump_table = {
		button = function(x) MenuHelper:AddButton(x) end,
		toggle = function(x) MenuHelper:AddToggle(x) end,
		slider = function(x) MenuHelper:AddSlider(x) end,
		divider = function(x) MenuHelper:AddDivider(x) end,
		multiple_choice = function(x) MenuHelper:AddMultipleChoice(x) end,
		keybind = function(x) end
	};
		
	for i=1, #file_paths do
		local path = self._path .. file_paths[i];
		local file = io.open( path, "r" );
		if not file then
			log("[Error] Could not load file: " .. path);
			return;
		end
		local file_content = file:read("*all");
		file:close();

		local content = json.decode( file_content );
		local menu_id = content.menu_id;
		local parent_menu = content.parent_menu_id;
		local menu_position = content.position;
		local subposition = content.subposition;
		local menu_name = content.title or menu_id .. "_title";
		local menu_desc = content.description or menu_id .. "_desc";
		local items = content.items or {};
		local focus_changed_callback = content.focus_changed_callback;
		if content.focus_class then self._class_table[menu_id] = content.focus_class; end
		local back_callback = content.back_callback;
		local area_bg = content.area_bg;
		Hooks:Add("MenuManagerSetupCustomMenus", "Base_SetupCustomMenus_Json_" .. menu_id, function( menu_manager, nodes )
			MenuHelper:NewMenu( menu_id );
		end)
		Hooks:Add("MenuManagerBuildCustomMenus", "Base_BuildCustomMenus_Json_" .. menu_id, function( menu_manager, nodes )

			local data = {
				focus_changed_callback = focus_changed_callback,
				back_callback = back_callback,
				area_bg = area_bg,
			};
			nodes[menu_id] = MenuHelper:BuildMenu( menu_id, data );
			MenuHelper:AddMenuItem( nodes[parent_menu], menu_id, menu_name, menu_desc, menu_position, subposition );
		end)
		Hooks:Add("MenuManagerPopulateCustomMenus", "Base_PopulateCustomMenus_Json_" .. menu_id, function( menu_manager, nodes )
			for k, item in pairs( items ) do
				if item.default_func then
					item.default_value = MenuCallbackHandler[item.default_func]();
				end
				local type = item.type;
				local item_id = item.id or type .. "_" .. k;
				local keybind_id = item_id .. "_keybind";
				local item_value = item.value or item_id;
				local value = item.default_value;
				if self._data and self._data[item_value] ~= nil then
					value = self._data[item_value];
				end
				self._default_values[item_value] = item.default_value;
				local item_data = {
					menu_id = menu_id,
					id = item_id,
					keybind_id = keybind_id,
					connection_name = keybind_id,
					title = item.title or item_id .. "_title",
					desc = item.description or item_id .. "_desc",
					callback = item.callback,
					priority = item.priority or (#items - k),
					value = value,
					localized = item.localized,
					next_node = item.next_menu,
					min = item.min or 0,
					max = item.max or 1,
					step = item.step or 0.1,
					show_value = true,
					size = item.size,
					binding = "",
					button = "",
					disabled = item.disabled,
					items = item.items
				};
				jump_table[type](item_data);
			end
		end)
	end
end

-- Nabbed and altered from menus.lua in BLT source
function MUIMenu:ResetItemsToDefaultValues(item, items_table )
	local node_items = item._parameters.gui_node.row_items;
	for k, v in pairs( node_items ) do
		local new_val = items_table[v.item._parameters.name];
		if new_val ~= nil and v.item.set_value then
			local item_type = v.item._type;
			if item_type == "toggle" then
				v.item:set_value( new_val and "on" or "off" );
			else
				v.item:set_value( new_val );
			end
			for x, y in pairs( v.item._parameters.callback ) do
				y(v.item);
			end
		end
	end
	managers.viewport:resolution_changed();
end

function MUIMenu:RegisterKeybinds(keybind_ids)
	local mod = BLT.Mods:GetModOwnerOfFile( self._path );
	if not mod then return; end

	for _, id in pairs(keybind_ids) do
		BLT.Keybinds:register_keybind( mod, {
			id = id,
			allow_menu = false,
			allow_game = true,
			name = id .. "_title",
			desc = id .. "_desc",
			localize = true,
			callback = MenuCallbackHandler[id .. "_callback"]
		});
	end
end

function MUIMenu:OnUpdate()
	MUIMenu:MuiCall(MUIMenu._class, "resize_all");
end

function MUIMenu:MuiCall(t, f, ...)
	if t and f and _G[t] and _G[t][f] then
		local args = {...};
		_G[t][f](args[1]);
	end
end

Hooks:Add("MenuComponentManagerPreSetActiveComponents", "RemoveActiveComponents_MUIMenu", function( component_manager, components, node )
	if MUIMenu._focus then
		for i=#components, 1, -1 do
			components[i] = nil;
		end
	end
end)

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_MUIMenu", function( loc )
	local lang = BLT.Localization:get_language().language;
	if lang == "zh-cn"then loc:load_localization_file( MUIMenu._path .. "l10n/zh-cn.json");
	else loc:load_localization_file( MUIMenu._path .. "l10n/en.json"); end
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_MUIMenu", function( menu_manager )
	
	MenuCallbackHandler.mui_options_focus = function( node, focus )
		MUIMenu._focus = focus;
		MUIMenu._class = MUIMenu._class_table[node._parameters.menu_id];
		MUIMenu:MuiCall(MUIMenu._class, "toggle_layer", focus);
	end
	
	MenuCallbackHandler.mui_save_options = function( node )
		MUIMenu:Save();
	end
	
	MenuCallbackHandler.mui_floored_callback = function(self, item)
		MUIMenu._data[item._parameters.name] = math.floor(item:value());
		MUIMenu:OnUpdate();
	end
	
	MenuCallbackHandler.mui_toggle_callback = function(self, item)
		MUIMenu._data[item._parameters.name] = item:value() == "on";
		MUIMenu:OnUpdate();
	end
	
	MenuCallbackHandler.mui_info_keybind_callback = function(self)
		if ArmStatic then
			ArmStatic.toggle_info();
		end
	end
	
	MenuCallbackHandler.mui_voice_keybind_callback = function(self)
		if MUIVoice then
			MUIVoice.toggle();
		end
	end

	MenuCallbackHandler.mui_fs_exists_callback = function(self)
		return MUIMenu:Assets();
	end
	
	MenuCallbackHandler.mui_reset_callback = function (self, item)
		MUIMenu:ResetItemsToDefaultValues( item, MUIMenu._default_values );
	end
	
	MenuCallbackHandler.mui_reset_all_callback = function (self, item)
		MUIMenu._data = {};
		for _, class in pairs(MUIMenu._class_table) do
			MUIMenu:MuiCall(class, "resize_all");
		end
	end
	
	pcall(MUIMenu.CheckOverrides);
	MUIMenu:Load();
	local file_paths = {
			"menus/mui_parent_options.json",
			"menus/mui_player_options.json",
			"menus/mui_team_options.json",
			"menus/mui_general_options.json",
			"menus/mui_misc_options.json",
			"menus/mui_waypoint_options.json",
			"menus/mui_voice_options.json",
			"menus/mui_stats_options.json",
			"menus/mui_subtitle_options.json",
			"menus/mui_suspicion_options.json",
			"menus/mui_present_options.json",
			"menus/mui_label_options.json",
			"menus/mui_interact_options.json",
			"menus/mui_hint_options.json",
			"menus/mui_custody_options.json",
			"menus/mui_comp_options.json",
			"menus/mui_chat_options.json",
			"menus/mui_bag_options.json"
		};
	local keybind_ids = {"mui_voice_keybind", "mui_info_keybind"};
	
	MUIMenu:LoadFromJsonFiles(file_paths);
	MUIMenu:RegisterKeybinds(keybind_ids);
end )

--[[
MenuItemCustomizeController._mui_base = { reload = MenuItemCustomizeController.reload };
function MenuItemCustomizeController.reload(self, row_item, node)
	-- Fix: Crash on key rebind, row_item was nil.
	if not row_item then return false; end
	return self._mui_base.reload(self, row_item, node);
end
]]

MenuManager._mui_base = { push_to_talk = MenuManager.push_to_talk };
function MenuManager.push_to_talk(self, enabled)
	if managers.hud then
		managers.hud:set_mugshot_voice(HUDManager.PLAYER_PANEL, enabled);
	end
	self._mui_base.push_to_talk(self, enabled);
end

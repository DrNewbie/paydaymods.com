PD2Tools = PD2Tools or class()

function PD2Tools:init()
    self._path = ModPath
	self._db = ModPath .. 'db/'
	self._errors = false
	self._jack = false
end

function PD2Tools:setup()
    if not file then
        log( '[PD2Tools] File class not available. @' .. self._db )
        self:error( 'pd2tools_error_message_file' )
        return false
	end
	-- I have no idea why but file.DirectoryExists returns true for a missing directory on the first call
	-- Calling it again or making a prior call to a different file.* function seems to do the trick
	local _dirs = file.GetDirectories( self._path )
    if not file.DirectoryExists( self._db ) and _dirs[ 1 ] ~= 'db' then
        log( '[PD2Tools] Directory Error: Database directory does not exist @' .. self._db )
        self:error( 'pd2tools_error_message_directory' )
        return false
	end
	self._loadouts  = {}
    local _loadouts = file.GetFiles( self._db )
    if _loadouts then
        for _, path in pairs( _loadouts ) do
            if string.ends( path, "json" ) then
                local _file_path = self._db .. path
                if io.file_is_readable( _file_path ) then
                    local _file = io.open( _file_path, 'r' )
                    local _file_contents = _file:read("*all")
                    _file:close()
                    local _name = path:match('^(.*).json$')
                    if ( _name ) then
                        self._loadouts[ _name ] = json.decode( _file_contents )
                    else
                        log( '[PD2Tools] File Error: Invalid file name @' .. _file_path )
                    end
                else
                    log( '[PD2Tools] File Error: Loadout file is not readable @' .. _file_path )
                end
            end
        end
	end
    return true
end

function PD2Tools:browse()
    if not self:setup() then return end
	local dialog_data = {
		title = managers.localization:text( "pd2tools_dialog_title" ),
		text = "",
		button_list = {}
	}
	for name, _ in pairs( self._loadouts ) do
		local text = name
		table.insert( dialog_data.button_list, {
			text = text,
			callback_func = function ()
				self:import( name )
			end,
			focus_callback_func = function ()
			end
		})
	end
	local no_button = {
		text = managers.localization:text( "dialog_cancel" ),
		focus_callback_func = function ()
		end,
		cancel_button = true
	}
	table.insert( dialog_data.button_list, no_button )
	dialog_data.image_blend_mode = "normal"
	dialog_data.text_blend_mode = "add"
	dialog_data.use_text_formating = true
	dialog_data.w = 480
	dialog_data.h = 532
	dialog_data.title_font = tweak_data.menu.pd2_medium_font
	dialog_data.title_font_size = tweak_data.menu.pd2_medium_font_size
	dialog_data.font = tweak_data.menu.pd2_small_font
	dialog_data.font_size = tweak_data.menu.pd2_small_font_size
	dialog_data.text_formating_color = Color.white
	dialog_data.text_formating_color_table = {}
	dialog_data.clamp_to_screen = true
	managers.system_menu:show_buttons( dialog_data )
end

function PD2Tools:error( error )
	local _title = managers.localization:text( "pd2tools_error_title" )
	local _message = managers.localization:text( error )
    local _options = { text = managers.localization:text( "pd2tools_error_close" ), is_cancel_button = true }
	QuickMenu:new( _title, _message, _options, true )
end

function PD2Tools:import( loadout )
    self._jack = false
    local _loadout = self._loadouts[ loadout ]
    if _loadout then
        loadout = string.sub( loadout, 1, 15 )
        if _loadout.skills then
            self:import_skills( loadout, _loadout.skills )
        end
        if _loadout.perk then
            self:import_perk( _loadout.perk )
        end
        if _loadout.primary then
            self:import_weapon( loadout, 'primaries', _loadout.primary, _loadout.primary_blueprint or nil )
        end
        if _loadout.secondary then
            self:import_weapon( loadout, 'secondaries', _loadout.secondary, _loadout.secondary_blueprint or nil )
        end
        if _loadout.melee then
            self:import_melee( _loadout.melee )
        end
        if _loadout.throwable then
            self:import_throwable( _loadout.throwable )
        end
        if _loadout.armor then
            self:import_armor( _loadout.armor )
        end
        if _loadout.deployables then
            self:import_deployables( _loadout.deployables )
        end
        if self._errors then
            self:error( 'pd2tools_error_message_errors' )
            self._errors = false
        end
    else
        log( '[PD2Tools] Import Error: Loadout not found @' .. loadout )
        self:error( 'pd2tools_error_message_unknown' )
	end
	managers.multi_profile:current_profile().name = loadout
	local mcm = managers.menu_component
	if mcm._player_inventory_gui then
		local node = mcm._player_inventory_gui._node
		mcm:close_inventory_gui()
		mcm:create_inventory_gui( node )
	end
end

function PD2Tools:import_skill( tree, tier, skill )
	if managers.skilltree:has_enough_skill_points( skill ) and managers.skilltree:unlock( skill ) then
		local _points = managers.skilltree:skill_cost( tier, managers.skilltree:skill_step( skill ) )
		managers.skilltree:spend_points( _points )
		managers.skilltree:_set_points_spent( tree, managers.skilltree:points_spent( tree ) + _points )
    else
        log( '[PD2Tools] Import Error: Unable to unlock skill @' .. skill )
        self._errors = true
    end
end

function PD2Tools:import_skills( loadout, skills )
    for idx = 1, #tweak_data.skilltree.trees do
        if managers.skilltree:points_spent( idx ) > 0 then
            managers.skilltree:on_respec_tree( idx )
        end
    end
    local _skills = {}
    for tree_id, tree_data in ipairs( tweak_data.skilltree.trees ) do
        for tier_id, tier_data in ipairs( tree_data.tiers ) do
            for _, skill in ipairs( tier_data ) do
                _skills[ skill ] = {}
                _skills[ skill ].tree = tree_id
                _skills[ skill ].tier = tier_id
            end
        end
    end
    for _, skill in ipairs( skills ) do
        local _basic    = skill:match('^([%w_]+)_basic$')
        local _aced     = skill:match('^([%w_]+)_aced$')
        if _basic then
            self:import_skill( _skills[ _basic ].tree, _skills[ _basic ].tier, _basic )
        elseif _aced then
            if _aced == 'jack_of_all_trades' then
                self._jack = true
            end
            self:import_skill( _skills[ _aced ].tree, _skills[ _aced ].tier, _aced )
            self:import_skill( _skills[ _aced ].tree, _skills[ _aced ].tier, _aced )
        end
    end
    managers.skilltree:set_skill_switch_name( managers.skilltree:get_selected_skill_switch(), loadout )
    --self._gui:update_box( self._gui._boxes_by_name[ 'skilltree' ], { text = managers.localization:text( 'menu_st_skill_switch_set', { skill_switch = loadout } ) } )
end

function PD2Tools:import_perk( perk )
    if managers.skilltree:get_specialization_value( 'current_specialization' ) ~= perk then
        if managers.skilltree:set_current_specialization( perk ) then
            --self._gui:_update_info_specialization( 'specialization' )
        else
            log( '[PD2Tools] Import Error: Unable to set perk deck @' .. perk )
            self._errors = true
        end
    end
end

function PD2Tools:import_weapon( loadout, category, weapon, blueprint )

    --
    -- Init
    --

    local _weapons = managers.blackmarket:get_crafted_category( category )
    local _weapon_id = managers.weapon_factory:get_weapon_id_by_factory_id( weapon )

    --
    -- Do we have a copy of this in our inventory already? Is it unlocked?
    -- If so, equip it and we are done (Yay!). Otherwise, proceed with checks.
    --

    local _slot
    for slot, item in pairs( _weapons ) do
        if item.custom_name == loadout and item.factory_id == weapon then
            _slot = slot
        end
    end
    if _slot then
        local _unlocked = managers.blackmarket:weapon_unlocked_by_crafted( category, _slot )
        if _unlocked then
            managers.blackmarket:equip_weapon( category, _slot )
        else
            log( '[PD2Tools] Import Error: Weapon is locked @' .. weapon )
            self._errors = true
        end
        return
    elseif not managers.blackmarket:weapon_unlocked( _weapon_id ) then
        log( '[PD2Tools] Import Error: Weapon is locked @' .. weapon )
        self._errors = true
        return
    end

    --
    -- Do we have a free slot to hold the new weapon?
    -- Don't want to unlock a slot now though, maybe in the future.
    --

    _slot = managers.blackmarket:_get_free_weapon_slot( category )
    if not _slot then
        log( '[PD2Tools] Import Error: No more empty weapon slots @' .. weapon )
        self._errors = true
        return
    end

    --
    -- Blueprint checks. The hell on earth.
    -- Make sure we can afford it, and that all mods are unlocked and in our inventory.
    -- Save DLC data for subsequent crafting routine.
    --

    local _mods = {}
    local _cost = managers.money:get_weapon_price_modified( _weapon_id )
    if blueprint and blueprint.mods then
        local _mods_ = managers.blackmarket:get_dropable_mods_by_weapon_id( _weapon_id )
        for _, items in pairs( _mods_ ) do
            for _, item in ipairs( items ) do
                _mods[ item[ 1 ] ] = { locked = false, empty = false, cost = 0, dlc = nil }
                if tweak_data.lootdrop.global_values[ item[ 2 ] ] and tweak_data.lootdrop.global_values[ item[ 2 ] ].dlc and not managers.dlc:is_dlc_unlocked( item[ 2 ] ) then
                    _mods[ item[ 1 ] ].locked = true
                elseif not managers.blackmarket:get_item_amount( item[ 2 ], 'weapon_mods', item[ 1 ], true ) then
                    _mods[ item[ 1 ] ].empty = true
                else
                    _mods[ item[ 1 ] ].cost = managers.money:get_weapon_modify_price( _weapon_id, item[ 1 ], item[ 2 ] )
                    _mods[ item[ 1 ] ].dlc = item[ 2 ]
                end
            end
        end
        for _, _mod in ipairs( blueprint.mods ) do
            if _mods[ _mod ] then
                if _mods[ _mod ].locked then
                    log( '[PD2Tools] Import Error: Weapon mod is locked @' .. _mod )
                    self._errors = true
                    return
                elseif _mods[ _mod ].empty then
                    log( '[PD2Tools] Import Error: Weapon mod not in inventory @' .. _mod )
                    self._errors = true
                    return
                else
                    _cost = _cost + _mods[ _mod ].cost
                end
            else
                log( '[PD2Tools] Import Error: Invalid weapon mod @' .. _mod )
                self._errors = true
                return
            end
        end
    end
    if managers.money:total() < _cost then
        log( '[PD2Tools] Import Error: Not enough money to craft weapon @' .. weapon )
        self._errors = true
        return
    end

    --
    -- Is our weapon shiny?
    -- If so, make sure we have the skin in our inventory.
    --

    local _skin
    if blueprint and blueprint.skin then
        local _inventory = managers.blackmarket:get_inventory_tradable()
        local _skins_ = managers.blackmarket:get_cosmetics_instances_by_weapon_id( _weapon_id )
        for _, instance in ipairs( _skins_ ) do
            if _inventory[ instance ] and _inventory[ instance ].category == 'weapon_skins' and _inventory[ instance ].entry == blueprint.skin then
                _skin = instance
            end
        end
        if not _skin then
            log( '[PD2Tools] Import Error: Skin not in inventory @' .. blueprint.skin )
            self._errors = true
            return
        end
    end

    --
    -- Do it!
    -- But pray for it to work, first.
    --

    managers.blackmarket:on_buy_weapon_platform( category, _weapon_id, _slot, false )
    managers.blackmarket:set_crafted_custom_name( category, _slot, loadout )
    managers.blackmarket:equip_weapon( category, _slot )
    if blueprint then
        if blueprint.skin and _skin then
            managers.blackmarket:on_equip_weapon_cosmetics( category, _slot, _skin )
        end
        if blueprint.mods then
            for _, _mod in ipairs( blueprint.mods ) do
                managers.blackmarket:buy_and_modify_weapon( category, _slot, _mods[ _mod ].dlc, _mod, false, false )
            end
        end
    end
end

function PD2Tools:import_melee( melee )
    local _, _weapons = managers.blackmarket:get_sorted_melee_weapons( false )
    for _, _items in ipairs( _weapons ) do
		for _, _weapon in ipairs( _items ) do
			if _weapon[ 1 ] == melee then
                if _weapon[ 2 ].unlocked == false then
                    log( '[PD2Tools] Import Error: Melee weapon is locked @' .. melee )
                    self._errors = true
				elseif _weapon[ 2 ].owned == false then
                    log( '[PD2Tools] Import Error: Melee weapon not in inventory @' .. melee )
                    self._errors = true
                else
                    if _weapon[ 2 ].equipped == false then
                        managers.blackmarket:equip_melee_weapon( melee )
                    end
                end
                return
			end
		end
	end
end

function PD2Tools:import_throwable( throwable )
    local _throwables = managers.blackmarket:get_sorted_grenades( false )
    for _, _throwable in ipairs( _throwables ) do
        if _throwable[ 1 ] == throwable then
            if _throwable[ 2 ].unlocked == false then
                log( '[PD2Tools] Import Error: Throwable is locked @' .. throwable )
                self._errors = true
            else
                if _throwable[ 2 ].equipped == false then
                    managers.blackmarket:equip_grenade( throwable )
                end
            end
            return
        end
	end
end

function PD2Tools:import_armor( armor )
    local _armors = managers.blackmarket:get_sorted_armors( true )
    for _, _armor in ipairs( _armors ) do
        if _armor == armor then
            managers.blackmarket:equip_armor( armor )
            return
        end
	end
    log( '[PD2Tools] Import Error: Armor is locked @' .. armor )
    self._errors = true
end

function PD2Tools:import_deployables( deployables )
    local _equipped = 0
    local _deployables = managers.blackmarket:get_sorted_deployables( true )
    for slot = 1, #deployables do
        for _, _deployable in ipairs( _deployables ) do
            if _deployable[ 1 ] == deployables[ slot ] then
                if slot == 1 then
                    managers.blackmarket:equip_deployable( { name = deployables[ slot ], target_slot = slot }, false )
                    _equipped = _equipped + 1;
                elseif self._jack then
                    managers.blackmarket:equip_deployable( { name = deployables[ slot ], target_slot = slot }, false )
                    _equipped = _equipped + 1;
                else
                    log( '[PD2Tools] Import Error: Secondary slot is locked @' .. deployables[ slot ] )
                    self._errors = true
                end
            end
        end
    end
    if _equipped ~= #deployables then
        log( '[PD2Tools] Import Error: Unable to import deployable' )
        self._errors = true
	end
end

PD2Tools:init()
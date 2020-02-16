if not _G.Poser then
	_G.Poser = {}
    Poser.name = "PoserReborn"
	Poser.loaded_options = {}
	Poser.ModPath = ModPath
	Poser.SavePath = SavePath
	Poser.menu_name = "poser_menu"
	Poser.menu_poses_name = "poser_poses_menu"
	Poser.menu_objects_name = "poser_objects_menu"
	Poser.menu_infamy_name = "poser_infamy_menu"
	Poser.write_options = Poser.write_options or {}
	Poser.objects_vis = {}
	Poser.Currentcard = 1
	Poser.launch = 1
    
    Poser.HookPath = ModPath .. "Hooks/"
    Poser.LuaPath = ModPath .. "Lua/"
    
    Poser.SpawnedCarryBags = {}
end

Poser.dofiles = {
	"DefaultOptions.lua",
	"Options.lua"
}

Poser.hook_files = {
	["lib/managers/menu/menuscenemanager"] = "MenuScene.lua",
	--["lib/managers/menumanagerpd2"] = "MenuManager.lua",
	--["lib/managers/blackmarketmanager"] = "BlackMarketManager.lua",
	--["lib/managers/menu/blackmarketgui"] = "BlackMarketGui.lua",
	--["lib/network/networkgame"] = "NetworkGame.lua"
}

--Weaptype 1:none 2:weapon 3:card 4:card only
Poser.poses = {
	{name = "husk1", weaptype = 1},
	{name = "husk2", weaptype = 1},
	{name = "husk3", weaptype = 1},
	{name = "husk4", weaptype = 1},
    {name = "husk_rifle1", weaptype = 2},
	{name = "husk_rifle2", weaptype = 2},
	{name = "husk_generic1", weaptype = 2},
	{name = "husk_generic2", weaptype = 2},
	{name = "husk_generic3", weaptype = 2},
	{name = "husk_generic4", weaptype = 2},
	{name = "husk_pistol1", weaptype = 2},
	{name = "husk_saw1", weaptype = 2},
	{name = "husk_shotgun1", weaptype = 2},
	{name = "husk_infamous1", weaptype = 3},
	{name = "husk_infamous2", weaptype = 3},
	{name = "husk_infamous3", weaptype = 3},
	{name = "husk_card1", weaptype = 4},
	{name = "husk_card2", weaptype = 4},
	{name = "husk_card3", weaptype = 4},
	{name = "husk_card4", weaptype = 4},
	{name = "husk_bullpup", weaptype = 2},
	{name = "husk_r93", weaptype = 2},
	{name = "husk_m95", weaptype = 2},
	{name = "husk_mosconi", weaptype = 2},
	{name = "husk_lmg", weaptype = 2},
	{name = "husk_m249", weaptype = 2},
	{name = "husk_mg42", weaptype = 2},
	{name = "husk_akimbo1", weaptype = 2},
	{name = "husk_akimbo2", weaptype = 2},
    {name = "husk_minigun", weaptype = 2},
	{name = "husk_bow1", weaptype = 2},
	{name = "husk_infamous4", weaptype = 3}
}

if not Poser.setup then
	for p, d in pairs(Poser.dofiles) do
		dofile(Poser.LuaPath .. d)
	end
	Poser:LoadOptions()
	Poser.setup = true
end

if RequiredScript then
	local requiredScript = RequiredScript:lower()
	if Poser.hook_files[requiredScript] then
		dofile( Poser.HookPath .. Poser.hook_files[requiredScript] )
	end
end

Hooks:Add("LocalizationManagerPostInit", "Poser_Localization", function(loc)
	LocalizationManager:add_localized_strings({
		["poserdialogopen"] = "Toggle Menu Visibility",
		["poser_toggle_pattern_title"] = "Background Pattern",
		["poser_toggle_pattern_help"] = "Toggles the visibility of the Background Pattern",
		["poser_toggle_logo_title"] = "Logo",
		["poser_toggle_logo_help"] = "Toggles the visibility of the Logo",
		["poser_toggle_smoke_title"] = "Smoke",
		["poser_toggle_smoke_help"] = "Toggles the visibility of the Smoke",
		["poser_button"] = "Poser Options",
		["poser_button_help"] = "Customize your Main Menu!",
		["poser_cpositionx_title"] = "Character Position X",
		["poser_cpositionx_help"] = "Move your character on the X axis",
		["poser_cpositiony_title"] = "Character Position Y",
		["poser_cpositiony_help"] = "Move your character on the Y axis",
		["poser_cpositionz_title"] = "Character Position Z",
		["poser_cpositionz_help"] = "Move your character on the Z axis",
		["poser_resetpos_title"] = "Reset Character Position",
		["poser_resetpos_help"] = "Resets your character to the default position",
		["poser_poses_button"] = "Character Poses",
		["poser_poses_button_help"] = "Choose a Pose for your character",
		["poser_pose_title_husk1"] = "Lobby 1",
		["poser_pose_title_husk2"] = "Lobby 2",
		["poser_pose_title_husk3"] = "Lobby 3",
		["poser_pose_title_husk4"] = "Lobby 4",
		["poser_pose_title_husk_rifle1"] = "Rifle 1",
		["poser_pose_title_husk_rifle2"] = "Rifle 2",
		["poser_pose_title_husk_generic1"] = "Generic 1",
		["poser_pose_title_husk_generic2"] = "Generic 2",
		["poser_pose_title_husk_generic3"] = "Generic 3",
		["poser_pose_title_husk_generic4"] = "Generic 4",
		["poser_pose_title_husk_pistol1"] = "Pistol",
		["poser_pose_title_husk_saw1"] = "Saw",
		["poser_pose_title_husk_shotgun1"] = "Shotgun",
		["poser_pose_title_husk_infamous1"] = "Infamous 1",
		["poser_pose_title_husk_infamous2"] = "Infamous 2",
		["poser_pose_title_husk_infamous3"] = "Infamous 3",
		["poser_pose_title_husk_infamous4"] = "Infamous 4",
		["poser_pose_title_husk_minigun"] = "Minigun",
		["poser_pose_title_husk_card1"] = "Lobby Card 1",
		["poser_pose_title_husk_card2"] = "Lobby Card 2",
		["poser_pose_title_husk_card3"] = "Lobby Card 3",
		["poser_pose_title_husk_card4"] = "Lobby Card 4",
		["poser_pose_title_husk_bullpup"] = "Bullpup",
		["poser_pose_title_husk_r93"] = "R93",
		["poser_pose_title_husk_m95"] = "Thanatos",
		["poser_pose_title_husk_mosconi"] = "Mosconi",
		["poser_pose_title_husk_lmg"] = "LMG",
		["poser_pose_title_husk_m249"] = "M249",
		["poser_pose_title_husk_mg42"] = "MG42",
		["poser_pose_title_husk_akimbo1"] = "Akimbo 1",
		["poser_pose_title_husk_akimbo2"] = "Akimbo 2",
		["poser_pose_title_husk_bow1"] = "Bow",
		["poser_remove_all_title"] = "Remove Weapons and Infamy Card",
		["poser_remove_all_help"] = "Removes the Infamy Card and both Weapons",
		["poser_dprimary_title"] = "Double Primaries",
		["poser_dprimary_desc"] = "Gives your character two Primaries",
		["poser_dsecondary_title"] = "Double Secondaries",
		["poser_dsecondary_desc"] = "Gives your character two Secondaries",
		["poser_swap_title"] = "Swap Weapons",
		["poser_swap_desc"] = "Swap Weapon positions",
		["poser_toggle_particles_title"] = "Money Particles",
		["poser_toggle_particles_help"] = "Toggles the Visibility of the money particles",
		["poser_objects_button"] = "Toggle Objects Visibility",
		["poser_objects_button_help"] = "Allows you to toggle the visibility of different character objects",
		
		["poser_object_title_g_body_bag"] = "Body Bag",
		["poser_object_title_g_canvas_bag"] = "Canvas Bag",
		["poser_object_title_g_lootbag"] = "Loot Bag",
		["poser_object_title_g_toolbag"] = "Tool Bag",
		["poser_object_title_g_toolsbag"] = "Tools Bag",
		["poser_object_title_g_ammobag"] = "Ammo Bag",
		["poser_object_title_g_medicbag"] = "Medic Case",
		["poser_object_title_g_sentrybag"] = "Sentry Case",
		["poser_object_title_g_bodybagsbag"] = "Body Bags case",
		["poser_object_title_g_firstaidbag"] = "First Aid Bag",
		["poser_object_title_g_armorbag"] = "Armor Case",
		
        ["poser_object_title_g_chute"] = "Parachute",
        ["poser_object_title_g_cagebag"] = "Cage Bag",
        ["poser_object_title_g_toolsbag_large"] = "Large Toolsbag",
        ["poser_object_title_g_safe"] = "Sputnik Safe",
        ["poser_object_title_g_safe_ovk"] = "Overkill Safe",
        ["poser_object_title_g_explosives_bag"] = "Explosives Bag",
        
		["poser_toggle_deployable_title"] = "Show Deployables in the Lobby",
		["poser_toggle_deployable_help"] = "Allows you to see a players Equipped deployable when in the lobby",

		["poser_infamy_button"] = "Choose Infamy card",
		["poser_infamy_button_help"] = "Select any infamy card you want",
		
		["poser_infamy_title_0"] = "Infamy card 01",
		["poser_infamy_title_1"] = "Infamy card 02",
		["poser_infamy_title_2"] = "Infamy card 03",
		["poser_infamy_title_3"] = "Infamy card 04",
		["poser_infamy_title_4"] = "Infamy card 05",
		["poser_infamy_title_5"] = "Infamy card 06",
		["poser_infamy_title_6"] = "Infamy card 07",
		["poser_infamy_title_7"] = "Infamy card 08",
		["poser_infamy_title_8"] = "Infamy card 09",
		["poser_infamy_title_9"] = "Infamy card 10",
		["poser_infamy_title_10"] = "Infamy card 11",
		["poser_infamy_title_11"] = "Infamy card 12",
		["poser_infamy_title_12"] = "Infamy card 13",
		["poser_infamy_title_13"] = "Infamy card 14",
		["poser_infamy_title_14"] = "Infamy card 15",
		["poser_infamy_title_15"] = "Infamy card 16",
		["poser_infamy_title_16"] = "Infamy card 17",
		["poser_infamy_title_17"] = "Infamy card 18",
		["poser_infamy_title_18"] = "Infamy card 19",
		["poser_infamy_title_19"] = "Infamy card 20",
		["poser_infamy_title_20"] = "Infamy card 21",
		["poser_infamy_title_21"] = "Infamy card 22",
		["poser_infamy_title_22"] = "Infamy card 23",
		["poser_infamy_title_23"] = "Infamy card 24",
		["poser_infamy_title_24"] = "Infamy card 25",
		["poser_save_pos_title"] = "Save Character Position",
		["poser_save_pos_help"] = "Saves the position of the character so it stays in the same place as you set it",
		
		["poser_save_pose_title"] = "Save Character Pose",
		["poser_save_pose_help"] = "Saves the pose of the character",
		
		["poser_weap_update_title"] = "Weapon Equip updates Pose",
		["poser_weap_update_help"] = "When disabled equipping a weapon wont reset your current pose (Overridden by Save Pose, which prevents it updating when enabled)",
		
		["poser_save_yaw_title"] = "Save Character Rotation",
		["poser_save_yaw_help"] = "Saves the rotation of the character",
		
		["poser_menu_deploy_title"] = "Show character deployable in menu",
		["poser_menu_deploy_help"] = "Shows your equipped deployable in the main menu",
		["poser_toggle_cop_safe_title"] = "Toggle C.O.P Safe",
		["poser_toggle_cop_safe_help"] = "Toggles the visibility of the Completely Overkill Pack safe",
		["poser_toggle_christmas_title"] = "Toggle Christmas Effects",
		["poser_toggle_christmas_help"] = "Toggles the visibility of the Christmas stuff",
        ["poser_object_title_g_g_bag"] = "Goat bag"
	})
end)

Poser.object_types = {
	{visual_unit_name = "units/payday2/characters/npc_acc_body_bag_1/npc_acc_body_bag_1", localization_title = "poser_object_title_g_body_bag"},
    {visual_unit_name = "units/payday2/characters/npc_acc_canvas_bag_1/npc_acc_canvas_bag_1", localization_title = "poser_object_title_g_canvas_bag", package = "packages/job_kenaz"},
    {visual_unit_name = "units/payday2/characters/npc_acc_loot_bag_1/npc_acc_loot_bag_1", localization_title = "poser_object_title_g_lootbag"},
    {visual_object = "g_toolbag", localization_title = "poser_object_title_g_toolbag"},
    {visual_unit_name = "units/payday2/characters/npc_acc_tools_bag_1/npc_acc_tools_bag_1", localization_title = "poser_object_title_g_toolsbag", package = "packages/job_branchbank_deposit"},
    {visual_object = "g_ammobag", localization_title = "poser_object_title_g_ammobag"},
    {visual_object = "g_medicbag", localization_title = "poser_object_title_g_medicbag"},
    {visual_object = "g_sentrybag", localization_title = "poser_object_title_g_sentrybag"},
    {visual_object = "g_bodybagsbag", localization_title = "poser_object_title_g_bodybagsbag"},
    {visual_object = "g_armorbag", localization_title = "poser_object_title_g_armorbag"},
    {visual_object = "g_firstaidbag", localization_title = "poser_object_title_g_firstaidbag"},
    --Has issues with loading other script data within the package
    --{visual_unit_name = "units/pd2_dlc_jerry/characters/npc_acc_parachute_1/npc_acc_parachute_1", localization_title = "poser_object_title_g_chute", package = "packages/narr_jerry2"},
    {visual_unit_name = "units/payday2/characters/npc_acc_cage_bag_1/npc_acc_cage_bag_1", localization_title = "poser_object_title_g_cagebag", package = "packages/job_kenaz"},
    {visual_unit_name = "units/payday2/characters/npc_acc_tools_bag_large_1/npc_acc_tools_bag_large_1", localization_title = "poser_object_title_g_toolsbag_large", package = "packages/job_kenaz"},
    {visual_unit_name = "units/payday2/characters/npc_acc_safe_wpn_1/npc_acc_safe_wpn_1", localization_title = "poser_object_title_g_safe", package = "packages/jolly"},
    {visual_unit_name = "units/payday2/characters/npc_acc_safe_ovk_1/npc_acc_safe_ovk_1", localization_title = "poser_object_title_g_safe_ovk", package = "packages/jolly"},
    {visual_unit_name = "units/payday2/characters/npc_acc_explosives_bag_1/npc_acc_explosives_bag_1", localization_title = "poser_object_title_g_explosives_bag", package = "packages/narr_shoutout"},
    {visual_unit_name = "units/pd2_dlc_peta/characters/npc_acc_goat_bag_1/npc_acc_goat_bag_1", localization_title = "poser_object_title_g_g_bag", package = "packages/job_peta"}
}

function Poser:GetTableSubTypes(Table, varname)
    local new_table = {}
    for i, sub_table in pairs(Table) do
        new_table[i] = sub_table[varname]
    end
    return new_table
end

function Poser:ShouldUpdateWeap(WeapType)
    if Poser.loaded_options.Menu.Pose_save then
        PoseData = Poser.poses[Poser.loaded_options.Menu.SavedPose]
        if PoseData.weaptype == 1 then
            return false
        elseif PoseData.weaptype == 2 then
            return true
        elseif PoseData.weaptype == 4 then
            return false
        end
        
        if PoseData.weaptype == 3 and WeapType == "primary" then
            return true
        elseif PoseData.weaptype == 3 then
            return false
        end
        
    end
    
    return true
end

Hooks:Add("MenuManagerSetupCustomMenus", "Base_SetupPoserMenu", function( menu_manager, nodes )
	if nodes.main then
        MenuHelper:NewMenu(Poser.menu_name)
        MenuHelper:NewMenu(Poser.menu_poses_name)
        MenuHelper:NewMenu(Poser.menu_objects_name)
        MenuHelper:NewMenu(Poser.menu_infamy_name)
	end
end)
 
Hooks:Add("MenuManagerPopulateCustomMenus", "Base_PopulatePoserMenu", function( menu_manager, nodes )
	if nodes.main then
        MenuCallbackHandler.poser_toggle_pattern = function(this, item)
            Poser.loaded_options.Menu.Pattern = item:value() == "on" and true or false
            managers.menu_scene._menu_cylinder_pattern:set_enabled(Poser.loaded_options.Menu.Pattern)
            Poser:Save()
        end
        MenuHelper:AddToggle({
            id = "PoserPattern",
            title = "poser_toggle_pattern_title",
            desc = "poser_toggle_pattern_help",
            callback = "poser_toggle_pattern",
            --disabled_color = ,
            icon_by_text = false,
            menu_id = Poser.menu_name,
            value = Poser.loaded_options.Menu.Pattern,
            priority = 2
        })
        MenuCallbackHandler.poser_toggle_logo = function(this, item)
            Poser.loaded_options.Menu.Logo = item:value() == "on" and true or false
            managers.menu_scene._menu_logo:set_enabled(Poser.loaded_options.Menu.Logo)
            Poser:Save()
        end
        MenuHelper:AddToggle({
            id = "PoserLogo",
            title = "poser_toggle_logo_title",
            desc = "poser_toggle_logo_help",
            callback = "poser_toggle_logo",
            --disabled_color = ,
            icon_by_text = false,
            menu_id = Poser.menu_name,
            value = Poser.loaded_options.Menu.Logo,
            priority = 3
        })
        MenuCallbackHandler.poser_toggle_particles = function(this, item)
            Poser.loaded_options.Menu.Particles = item:value() == "on" and true or false
            local e_money = managers.menu_scene._bg_unit:effect_spawner(Idstring("e_money"))
            e_money:set_enabled(Poser.loaded_options.Menu.Particles)
            Poser:Save()
        end
        MenuHelper:AddToggle({
            id = "PoserParticles",
            title = "poser_toggle_particles_title",
            desc = "poser_toggle_particles_help",
            callback = "poser_toggle_particles",
            --disabled_color = ,
            icon_by_text = false,
            menu_id = Poser.menu_name,
            value = Poser.loaded_options.Menu.Particles,
            priority = 3
        })
        
        MenuCallbackHandler.poser_toggle_smoke = function(this, item)
            Poser.loaded_options.Menu.Smoke = item:value() == "on" and true or false
            managers.menu_scene._menu_cylinder1:set_enabled(Poser.loaded_options.Menu.Smoke)
            managers.menu_scene._menu_cylinder2:set_enabled(Poser.loaded_options.Menu.Smoke)
            managers.menu_scene._menu_cylinder3:set_enabled(Poser.loaded_options.Menu.Smoke)	
            Poser:Save()
        end
        MenuHelper:AddToggle({
            id = "PoserSmoke",
            title = "poser_toggle_smoke_title",
            desc = "poser_toggle_smoke_help",
            callback = "poser_toggle_smoke",
            --disabled_color = ,
            icon_by_text = false,
            menu_id = Poser.menu_name,
            value = Poser.loaded_options.Menu.Smoke,
            priority = 4
        })
        
        MenuCallbackHandler.poser_reset_pos = function(this, item)
            local unit = managers.menu_scene._character_unit	
            local c_ref = managers.menu_scene._bg_unit:get_object(Idstring("a_reference"))

            Poser.loaded_options.Menu.Position_x = c_ref:position().x
            Poser.loaded_options.Menu.Position_y = c_ref:position().y
            Poser.loaded_options.Menu.Position_z = c_ref:position().z
            
            managers.menu_scene._character_values.pos_target = c_ref:position()
                
            unit:set_position(c_ref:position())
            Poser:Save()
        end
        MenuHelper:AddButton({
            id = "poserresetpositioning",
            title = "poser_resetpos_title",
            desc = "poser_resetpos_help",
            callback = "poser_reset_pos",
            --back_callback = ,
            --next_node = ,
            menu_id = Poser.menu_name,
            priority = 6
        })
        MenuCallbackHandler.poser_pose = function(this, item, menu_scene, data, charunit, skip_save)
            local manager = menu_scene or managers.menu_scene
            local unit
            if managers.network then
                if managers.network:session() then
                    if managers.network:session():_local_peer_in_lobby() then
                        unit = manager._lobby_characters[managers.network:session():local_peer():id()]
                    end
                end
            end
            unit = charunit or unit or manager._character_unit
            
            partsplit = data or string.split(item:name(), "-")
            
            if tonumber(partsplit[2]) == 1 then
                manager:_delete_character_weapon(unit, "all")
                manager:destroy_infamy_card()
            elseif tonumber(partsplit[2]) == 2 then
                local secondary = managers.blackmarket:equipped_secondary()
                if secondary then
                    manager:set_character_equipped_weapon(unit, secondary.factory_id, secondary.blueprint, "secondary", secondary.cosmetics, true)
                end
                local primary = managers.blackmarket:equipped_primary()
                if primary then
                    manager:set_character_equipped_weapon(unit, primary.factory_id, primary.blueprint, "primary", primary.cosmetics, true)
                end
            elseif tonumber(partsplit[2]) == 3 then
                local primary = managers.blackmarket:equipped_primary()
                if primary then
                    manager:set_character_equipped_weapon(unit, primary.factory_id, primary.blueprint, "primary", primary.cosmetics, true)
                end
                local rank = managers.experience:current_rank()
                if rank > 0 then
                    manager:set_character_equipped_card(unit, rank - 1, true)
                end
            elseif tonumber(partsplit[2]) == 4 then
                manager:_delete_character_weapon(unit, "primary")
                local rank = managers.experience:current_rank()
                manager:set_character_equipped_card(unit, rank and rank - 1 or 5, true)
            end
            
            if Poser.loaded_options.Menu.Pose_save and manager._current_scene_template ~= "lobby" and not skip_save then
                log("switch pose")
                Poser.loaded_options.Menu.SavedPose = tonumber(partsplit[1])
            end
            Poser:Save()
            log(partsplit[1])
            manager:_set_character_unit_pose(Poser.poses[tonumber(partsplit[1])].name, unit, true)
            
        end
        
        for i, tbl in pairs(Poser.poses) do
            MenuHelper:AddButton({
                id = i .. "-" .. tbl.weaptype,
                title = "poser_pose_title_" .. tbl.name,
                --desc = "poser_pose_help_" .. Poser.poses[i],
                callback = "poser_pose",
                --back_callback = ,
                --next_node = ,
                menu_id = Poser.menu_poses_name
                --priority = 6
            })
        end
        MenuCallbackHandler.poser_remove_all = function(this, item)
            local unit 		
            if managers.network then
                if managers.network:session() then
                    if managers.network:session():_local_peer_in_lobby() then
                        unit = managers.menu_scene._lobby_characters[managers.network:session():local_peer():id()] or managers.menu_scene._character_unit
                    end
                end
            end
            unit = unit or managers.menu_scene._character_unit
            managers.menu_scene:_delete_character_weapon(unit, "all")
            managers.menu_scene:destroy_infamy_card()
        end
        
        MenuHelper:AddButton({
            id = "poserremoveall",
            title = "poser_remove_all_title",
            desc = "poser_remove_all_help",
            callback = "poser_remove_all",
            --back_callback = ,
            --next_node = ,
            menu_id = Poser.menu_name,
            --priority = 6
        })
        MenuCallbackHandler.poser_double_weap = function(this, item)
            local unit 		
            if managers.network then
                if managers.network:session() then
                    if managers.network:session():_local_peer_in_lobby() then
                        unit = managers.menu_scene._lobby_characters[managers.network:session():local_peer():id()] or managers.menu_scene._character_unit
                    end
                end
            end
            unit = unit or managers.menu_scene._character_unit
            local weapon
            if item:name() == "primary" then
                weapon = managers.blackmarket:equipped_primary()
            elseif item:name() == "secondary" then
                weapon = managers.blackmarket:equipped_secondary()
            end
            if weapon then
                managers.menu_scene:set_character_equipped_weapon(unit, weapon.factory_id, weapon.blueprint, "secondary", weapon.cosmetics, true)
                managers.menu_scene:set_character_equipped_weapon(unit, weapon.factory_id, weapon.blueprint, "primary", weapon.cosmetics, true)
            end
        end
        
        MenuHelper:AddButton({
            id = "primary",
            title = "poser_dprimary_title",
            desc = "poser_dprimary_desc",
            callback = "poser_double_weap",
            --back_callback = ,
            --next_node = ,
            menu_id = Poser.menu_name,
            --priority = 6
        })
        MenuHelper:AddButton({
            id = "secondary",
            title = "poser_dsecondary_title",
            desc = "poser_dsecondary_desc",
            callback = "poser_double_weap",
            --back_callback = ,
            --next_node = ,
            menu_id = Poser.menu_name,
            --priority = 6
        })
        MenuCallbackHandler.poser_swap_weap = function(this, item)
            Poser.weap1 = Poser.weap1 == "primary" and "secondary" or "primary"
            Poser.weap2 = Poser.weap2 == "secondary" and "primary" or "secondary"
            local unit 		
            if managers.network then
                if managers.network:session() then
                    if managers.network:session():_local_peer_in_lobby() then
                        unit = managers.menu_scene._lobby_characters[managers.network:session():local_peer():id()] or managers.menu_scene._character_unit
                    end
                end
            end
            unit = unit or managers.menu_scene._character_unit
            local secondary = managers.blackmarket:equipped_secondary()
            if secondary then
                managers.menu_scene:set_character_equipped_weapon(unit, secondary.factory_id, secondary.blueprint, Poser.weap1, secondary.cosmetics, true)
            end
            local primary = managers.blackmarket:equipped_primary()
            if primary then
                managers.menu_scene:set_character_equipped_weapon(unit, primary.factory_id, primary.blueprint, Poser.weap2, primary.cosmetics, true)
            end
        end
        MenuHelper:AddButton({
            id = "poser_swap_weapons",
            title = "poser_swap_title",
            desc = "poser_swap_desc",
            callback = "poser_swap_weap",
            --back_callback = ,
            --next_node = ,
            menu_id = Poser.menu_name,
            --priority = 6
        })
        
        MenuCallbackHandler.poser_object_toggle = function(this, item)
            local objectTbl = Poser.object_types[item:name()]
        
            local unit = managers.menu_scene._character_unit
            
            if objectTbl.visual_object then
                local object = unit:get_object(Idstring(objectTbl.visual_object))
                if object then
                    object:set_visibility(not object:visibility())
                end
            elseif objectTbl.visual_unit_name then
                if not Poser.SpawnedCarryBags[objectTbl.visual_unit_name] then
                    if objectTbl.package and PackageManager:package_exists(objectTbl.package) and not PackageManager:loaded(objectTbl.package) then
                        PackageManager:load(objectTbl.package)
                    end
                    
                    local carryUnit = safe_spawn_unit(Idstring(objectTbl.visual_unit_name), unit:position())
                    Poser.SpawnedCarryBags[objectTbl.visual_unit_name] = carryUnit
                    local objects = {
                        "Spine",
                        "Spine1",
                        "Spine2",
                        "LeftShoulder",
                        "RightShoulder",
                        "LeftUpLeg",
                        "RightUpLeg"
                    }
                    unit:link(Idstring("Hips"), carryUnit, carryUnit:orientation_object():name())
                    for _, o_name in ipairs(objects) do
                        carryUnit:get_object(Idstring(o_name)):link(unit:get_object(Idstring(o_name)))
                        carryUnit:get_object(Idstring(o_name)):set_position(unit:get_object(Idstring(o_name)):position())
                        carryUnit:get_object(Idstring(o_name)):set_rotation(unit:get_object(Idstring(o_name)):rotation())
                    end
                elseif Poser.SpawnedCarryBags[objectTbl.visual_unit_name] then
                    Poser.SpawnedCarryBags[objectTbl.visual_unit_name]:set_enabled(not Poser.SpawnedCarryBags[objectTbl.visual_unit_name]:enabled())
                end
            end
        end
        
        for i, tbl in pairs(Poser.object_types) do
            MenuHelper:AddButton({
                id = i,
                title = tbl.localization_title,
                callback = "poser_object_toggle",
                menu_id = Poser.menu_objects_name
            })
        end
        MenuCallbackHandler.poser_infamy_toggle = function(this, item)
            if managers.menu_scene._card_units and alive(managers.menu_scene._card_units[managers.menu_scene._character_unit:key()]) then
                local infamy_card = managers.menu_scene._card_units[managers.menu_scene._character_unit:key()]
                local card = item:name()
                infamy_card:damage():run_sequence_simple("enable_card_" .. (card < 10 and "0" or "") .. tostring(math.min(card, 24)))
            end
        end
        
        for i = 0, 24 do
            MenuHelper:AddButton({
                id = i,
                title = "poser_infamy_title_" .. i,
                callback = "poser_infamy_toggle",
                menu_id = Poser.menu_infamy_name
            })
        end
        MenuCallbackHandler.poser_toggle_deployable = function(this, item)
            Poser.loaded_options.Menu.Deployables = item:value() == "on" and true or false
            if managers.menu_scene._current_scene_template == "lobby" and managers.network:session() then
                managers.menu_scene._characters_deployable_visible = Poser.loaded_options.Menu.Deployables
                for i = 1, 4 do
                    local unit = managers.menu_scene._lobby_characters[i]
                    local peer = managers.network:session():peer(i)
                    if peer then
                        managers.menu_scene:set_character_deployable(peer:blackmarket_outfit().deployable, unit, i)
                    end
                end
            end
            
            managers.menu_scene._scene_templates.lobby.characters_deployable_visible = Poser.loaded_options.Menu.Deployables
            Poser:Save()
        end
        MenuHelper:AddToggle({
            id = "PoserDeployable",
            title = "poser_toggle_deployable_title",
            desc = "poser_toggle_deployable_help",
            callback = "poser_toggle_deployable",
            icon_by_text = false,
            menu_id = Poser.menu_name,
            value = Poser.loaded_options.Menu.Deployables,
            priority = 4
        })
        
        MenuCallbackHandler.poser_menu_deploy = function(this, item)
            Poser.loaded_options.Menu.menu_deploy = item:value() == "on" and true or false
            managers.menu_scene._scene_templates.inventory.characters_deployable_visible = Poser.loaded_options.Menu.menu_deploy
            managers.menu_scene._scene_templates.standard.characters_deployable_visible = Poser.loaded_options.Menu.menu_deploy
            if managers.menu_scene._current_scene_template == "standard" or managers.menu_scene._current_scene_template == "inventory" then
                managers.menu_scene._characters_deployable_visible = Poser.loaded_options.Menu.menu_deploy
                managers.menu_scene:set_character_deployable(Global.player_manager.kit.equipment_slots[1], false, 0)
            end
            Poser:Save()
        end
        MenuHelper:AddToggle({
            id = "PoserMenuDeploy",
            title = "poser_menu_deploy_title",
            desc = "poser_menu_deploy_help",
            callback = "poser_menu_deploy",
            icon_by_text = false,
            menu_id = Poser.menu_name,
            value = Poser.loaded_options.Menu.menu_deploy,
            priority = 4
        })
        
        MenuCallbackHandler.poser_save_position = function(this, item)
            Poser.loaded_options.Menu.Position_save = item:value() == "on" and true or false
            if managers.menu_scene then
                local position = managers.menu_scene._character_unit:position()
                Poser.loaded_options.Menu.Position_x = position.x
                Poser.loaded_options.Menu.Position_y = position.y
                Poser.loaded_options.Menu.Position_z = position.z
            end
            Poser:Save()
        end
        MenuHelper:AddToggle({
            id = "PoserSavePos",
            title = "poser_save_pos_title",
            desc = "poser_save_pos_help",
            callback = "poser_save_position",
            icon_by_text = false,
            menu_id = Poser.menu_name,
            value = Poser.loaded_options.Menu.Position_save
        })
        
        MenuCallbackHandler.poser_save_pose = function(this, item)
            Poser.loaded_options.Menu.Pose_save = item:value() == "on" and true or false
            for i, pose in pairs(Poser.poses) do
                if pose.name == Poser.current_pose then
                    Poser.loaded_options.Menu.SavedPose = i
                end
            end
            Poser:Save()
        end
        MenuHelper:AddToggle({
            id = "PoserSavePose",
            title = "poser_save_pose_title",
            desc = "poser_save_pose_help",
            callback = "poser_save_pose",
            icon_by_text = false,
            menu_id = Poser.menu_name,
            value = Poser.loaded_options.Menu.Pose_save
        })
        
        MenuCallbackHandler.poser_weap_update = function(this, item)
            Poser.loaded_options.Menu.Weapon_update = item:value() == "on" and true or false
            Poser:Save()
        end
        MenuHelper:AddToggle({
            id = "PoserWeapUpdate",
            title = "poser_weap_update_title",
            desc = "poser_weap_update_help",
            callback = "poser_weap_update",
            icon_by_text = false,
            menu_id = Poser.menu_name,
            value = Poser.loaded_options.Menu.Weapon_update
        })
        
        MenuCallbackHandler.poser_save_yaw = function(this, item)
            Poser.loaded_options.Menu.Save_yaw = item:value() == "on" and true or false
            Poser:Save()
        end
        MenuHelper:AddToggle({
            id = "PoserSaveYaw",
            title = "poser_save_yaw_title",
            desc = "poser_save_yaw_help",
            callback = "poser_save_yaw",
            icon_by_text = false,
            menu_id = Poser.menu_name,
            value = Poser.loaded_options.Menu.Save_yaw
        })
	end
end)
 
Hooks:Add("MenuManagerBuildCustomMenus", "Base_BuildPoserMenu", function( menu_manager, nodes )
	if nodes.main then
		nodes[Poser.menu_name] = MenuHelper:BuildMenu( Poser.menu_name )
		MenuHelper:AddMenuItem( MenuHelper.menus.lua_mod_options_menu, Poser.menu_name, "poser_button", "poser_button_help", 1 )
	
		nodes[Poser.menu_poses_name] = MenuHelper:BuildMenu(Poser.menu_poses_name)
		MenuHelper:AddMenuItem( MenuHelper.menus[Poser.menu_name], Poser.menu_poses_name, "poser_poses_button", "poser_poses_button_help" )
		
		nodes[Poser.menu_objects_name] = MenuHelper:BuildMenu(Poser.menu_objects_name)
		MenuHelper:AddMenuItem( MenuHelper.menus[Poser.menu_name], Poser.menu_objects_name, "poser_objects_button", "poser_objects_button_help" )
		
		nodes[Poser.menu_infamy_name] = MenuHelper:BuildMenu(Poser.menu_infamy_name)
		MenuHelper:AddMenuItem( MenuHelper.menus[Poser.menu_name], Poser.menu_infamy_name, "poser_infamy_button", "poser_infamy_button_help" )
	end
end)
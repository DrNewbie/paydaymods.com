Hooks:Add("MenuManagerBuildCustomMenus", "MenuManagerBuildCustomMenus_SIIL", function( menu_manager, nodes )
    if nodes.steam_inventory then
		nodes.steam_inventory:parameters().sync_state = "blackmarket"
	end

    MenuHelper:AddMenuItem( nodes.lobby, "steam_inventory", "menu_steam_inventory", "menu_steam_inventory_help", "inventory", "after" )
    MenuHelper:AddMenuItem( nodes.crime_spree_lobby, "steam_inventory", "menu_steam_inventory", "menu_steam_inventory_help", "inventory", "after" )
end)
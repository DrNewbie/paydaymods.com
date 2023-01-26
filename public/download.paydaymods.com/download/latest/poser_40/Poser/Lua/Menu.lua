if not Poser.is_closed then
	Poser.open_menu = Poser.open_menu or managers.menu:active_menu()
	Poser.opened_node = Poser.opened_node or managers.menu:active_menu().logic:selected_node()
	managers.menu:close_menu(Poser.open_menu.name)
	Poser.is_closed = true
elseif Poser.is_closed then
	managers.menu:open_menu(Poser.open_menu.name)
	if managers.network then
		if managers.network:session() then
			if managers.network:session():_local_peer_in_lobby() then
				managers.menu:open_node("lobby")
			end
		end
	end
	managers.menu:open_node(Poser.opened_node:parameters().name)
	Poser.open_menu = nil
	Poser.opened_node = nil
	Poser.is_closed = false
end

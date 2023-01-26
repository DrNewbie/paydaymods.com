function MenuSceneManager:_get_lobby_character_prio_item(rank, outfit)
	if rank and rank > 0 then
		return "rank"
	end
	return "primary"
end
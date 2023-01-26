PDTHHudChallenges = PDTHHudChallenges or class()
function PDTHHudChallenges:refresh_node(node, data)
	local selected_item = node:selected_item() and node:selected_item():name()
	node = self:modify_node(node, data)
	if selected_item then
		node:select_item(selected_item)
	end
	return node
end

PDTHHudCompletedChallenges = PDTHHudCompletedChallenges or class(PDTHHudChallenges)
function PDTHHudCompletedChallenges:modify_node(node, data)
	node:clean_items()
    for _,data in pairs(managers.challenges:get_completed()) do
        local params = {
                name = data.id,
                text_id	= string.upper(data.name),
                description_text = string.upper(data.description),
                localize = "false",
                challenge = data.id,
                awarded	= true
            }
        local new_item = node:create_item({type = "MenuItemChallenge"}, params)
        node:add_item(new_item)
    end
    managers.menu:add_back_button(node)
	return node
end

PDTHHudActiveChallenges = PDTHHudActiveChallenges or class(PDTHHudChallenges)
function PDTHHudActiveChallenges:modify_node(node, data)
	node:clean_items()
	for _,data in pairs(managers.challenges:get_near_completion()) do
		local title_text = managers.challenges:get_title_text(data.id)
		local description_text = managers.challenges:get_description_text(data.id)
		local params = {
			name = data.id,
			text_id	= string.upper(title_text),
			description_text = string.upper(description_text),
			localize = "false",
			challenge = data.id,
		}
		local new_item = node:create_item({type = "MenuItemChallenge"}, params)
		node:add_item(new_item)
	end
	managers.menu:add_back_button(node)
	return node
end

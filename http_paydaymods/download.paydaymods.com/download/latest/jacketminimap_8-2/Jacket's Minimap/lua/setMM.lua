if MiniMap._data.mm_value == true then
	if MiniMap._data.mm_stealth_only_value == true then
		if managers.groupai:state():whisper_mode() then
			if managers.hud then
				managers.hud:set_minimap_enabled(true)
			end
		else
			if managers.hud then
				managers.hud:set_minimap_enabled(false)
			end
		end
	else
		if managers.hud then
			managers.hud:set_minimap_enabled(true)
		end
	end
	--managers.hud:set_minimap_zoom(mm_zoom_value / 100)
else
	if managers.hud then
		managers.hud:set_minimap_enabled(false)
	end
end

if MiniMap._data.mm_rotate_value == true then
	if MiniMap._data.mm_value == true then
		if managers.hud then
			managers.hud:set_minimap_enabled(false)
			managers.hud:rotate_minimap(true)
			managers.hud:set_minimap_enabled(true)
		end
	else
		if managers.hud then
			managers.hud:rotate_minimap(true)
		end
	end
else
	if managers.hud then
		managers.hud:rotate_minimap(false)
	end
end

if FPSCap_MenuManager_Hooked then
	return
else
	FPSCap_MenuManager_Hooked = true
end

-- Disclaimer: I am NOT to be held responsible should you somehow kill your computer, experience (power) bill shock, meet aliens,
-- and / or somehow encounter some unfortunate situation with the following new options. Your use of the frame rate limit options
-- are entirely at your own risk; if something breaks, that's not my fault. Consider yourself warned!

local limits = {30, 45, 60, 75, 90, 105, 120, 135, 144,
-- Insanity range...
150, 175, 200, 225, 250, 275, 300}

local modify_adv_video_actual = MenuOptionInitiator.modify_adv_video
function MenuOptionInitiator:modify_adv_video(node, ...)
	if limits ~= nil then
		local fpslimit = node:item("choose_fps_cap")
		if fpslimit ~= nil then
			fpslimit:clear_options()
			for __, limit in ipairs(limits) do
				fpslimit:add_option(CoreMenuItemOption.ItemOption:new({
					_meta = "option",
					text_id = tostring(limit),
					value = limit,
					localize = false
				}))
			end
			fpslimit:_show_options(nil)
		end
	end

	return modify_adv_video_actual(self, node, ...)
end

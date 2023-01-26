if managers.hud and managers.money and managers.loot then

	local mandatory_cash = managers.money:get_secured_mandatory_bags_money()
	local bonus_cash = managers.money:get_secured_bonus_bags_money()
	local instant_cash = managers.loot:get_real_total_small_loot_value()

	local total_cash = mandatory_cash + bonus_cash + instant_cash - managers.money.catch_reduction_to_persist
	local total_cash_ncc = mandatory_cash + bonus_cash + instant_cash
	local divided_cash_ncc = total_cash_ncc * 20 / 100
	local divided_off_ncc = total_cash_ncc * 80 / 100

	local function format_int(number)

	  local i, j, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)')

	  -- reverse the int-string and append a comma to all blocks of 3 digits
	  int = int:reverse():gsub("(%d%d%d)", "%1,")

	  -- reverse the int-string back remove an optional comma and put the 
	  -- optional minus and fractional part back
	  return minus .. int:reverse():gsub("^,", "") .. fraction
	end

	if Utils:IsInHeist() then

		MH = {}
		MH.Data = {}

		function Load_Data()
		local file = io.open( SavePath .. "MIH_Options.txt" , "r")
			if file then
				for k, v in pairs(json.decode(file:read("*all")) or {}) do
					if k then
						MH.Data[k] = v
					end
				end
				file:close()
			end
		end

		Load_Data()

		local is_cash_enabled = MIH.Data["MIH_Enable_Cash_Value"]
		local correction_x = math.floor(MIH.Data["MIH_Correction_X_Value"] or 0)
		local correction_y = math.floor(MIH.Data["MIH_Correction_Y_Value"] or 0)

		if is_cash_enabled then
			managers.hud._hud_assault_corner.total_money_count:set_visible(true)
		else
			managers.hud._hud_assault_corner.total_money_count:set_visible(false)
		end

		if correction_x then
			managers.hud._hud_assault_corner.money_panel:set_left(managers.hud._hud_assault_corner._hostages_bg_box:left() + 21 + correction_x)
			
			if is_cash_enabled then
				managers.hud._hud_assault_corner.total_money_panel:set_left(managers.hud._hud_assault_corner.money_panel:left() - 8)
			end
		end

		if correction_y then
			managers.hud._hud_assault_corner.money_panel:set_top(managers.hud._hud_assault_corner._hostages_bg_box:bottom() + 30 + correction_y)

			if is_cash_enabled then
				managers.hud._hud_assault_corner.total_money_panel:set_top(managers.hud._hud_assault_corner.money_panel:bottom() - 60)
			end
		end

		if total_cash > 0 then
			managers.hud._hud_assault_corner.money_count:set_color(Color(255, 130, 190, 255) / 255)
			managers.hud._hud_assault_corner.money_count_number:set_color(Color(255, 130, 190, 255) / 255)
			managers.hud._hud_assault_corner.money_count_number:set_text("$ " .. format_int(total_cash))
		else
			managers.hud._hud_assault_corner.money_count:set_color(Color(255, 255, 120, 120) / 255)
			managers.hud._hud_assault_corner.money_count_number:set_color(Color(255, 255, 120, 120) / 255)
			managers.hud._hud_assault_corner.money_count_number:set_text("$ " .. format_int(total_cash))
		end

		local retrieve_total_spendable_nc = managers.money:total()
		local retrieve_total_offshore_nc = Application:digest_value(managers.money._global.offshore, false)

		local calc_retrieved_and_total = retrieve_total_spendable_nc + divided_cash_ncc
		local calc_retrieved_and_offshore = retrieve_total_offshore_nc + divided_off_ncc

		local total_civilian_killed = managers.statistics:session_total_civilian_kills()

		managers.hud._hud_assault_corner.total_money_count:set_text("SPENDING CASH   $ " .. format_int(calc_retrieved_and_total) .. " ( + " .. format_int(divided_cash_ncc) .. " )\nOFFSHORE CASH   $ " .. format_int(calc_retrieved_and_offshore) .. " ( + " .. format_int(divided_off_ncc) .. " )\nCIVILIANS KILLED   " .. format_int(total_civilian_killed) .. " ( - " .. format_int(managers.money.catch_reduction_to_persist) .. " )")
		managers.hud._hud_assault_corner.total_money_count:set_color(Color(1, 0.75, 0.75, 0.75))

		if managers.money.previous_stored_cash ~= total_cash then
			local bg = managers.hud._hud_assault_corner._money_panel_box:child("bg")
			bg:animate(callback(nil, _G, "HUDBGBox_animate_bg_attention"), {})
			--managers.hud._sound_source:post_event("stinger_objectivecomplete")
			
			managers.money.previous_stored_cash = total_cash
		end
	end
end
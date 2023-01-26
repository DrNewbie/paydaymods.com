
local tips_to_remove = {
	tip_help_arrested = true,
	tip_xp = true,
	tip_xp_bar = true,
	tip_select_reward = true,
	-- Consider rewriting:
	tip_doctor_bag = true,
--	tip_help_bleed_out = true,
--	tip_trading_hostage = true,
	tip_law_enforcers_as_hostages = true,
	tip_mask_off = true,
	tip_objectives = true
}

local init_actual = TipsTweakData.init
function TipsTweakData:init(...)
	init_actual(self, ...)

	-- Remove irrelevant PD:TH-specific tips
	for i = #self, 1, -1 do
		if tips_to_remove[self[i].string_id] then
			table.remove(self, i)
		end
	end
end

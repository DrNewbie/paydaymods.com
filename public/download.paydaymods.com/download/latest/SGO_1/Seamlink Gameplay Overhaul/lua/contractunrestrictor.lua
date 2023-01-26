if not expModify then
if not tweak_data then return end

tweak_data.difficulty_level_locks = {
		0,
		0,
		0,
		30,
		50,
		80,
		80,
		80
	}

expModify = true
end
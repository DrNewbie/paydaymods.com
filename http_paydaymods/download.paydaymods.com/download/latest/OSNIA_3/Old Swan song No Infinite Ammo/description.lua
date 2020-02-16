local text_original = LocalizationManager.text
local testAllStrings = false
function LocalizationManager:text(string_id, ...)

return string_id == "menu_perseverance_beta_desc"	and "BASIC: ##3 points##\nInstead of getting downed instantly, you gain the ability to keep on fighting for ##3## seconds with a ##60%## movement penalty before going down.\n\nNote: Does not trigger on fall or fire damage.\n\nACE: ##6 points##\nIncreases the duration of skill by ##6## seconds."

or testAllStrings == true and string_id
or text_original(self, string_id, ...)
end

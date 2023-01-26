
if not MainMenuStreamliner_NewHeistsGui_Hooked then
	MainMenuStreamliner_NewHeistsGui_Hooked = true
else
	return
end

local shouldgetdummy_cached = nil

-- This works around a crash that occurs whenever the 'ad_dummy' main menu entry is hidden
local try_get_dummy_actual = NewHeistsGui.try_get_dummy
function NewHeistsGui:try_get_dummy(...)
	if shouldgetdummy_cached == nil then
		local MainMenuStreamliner = _G.MainMenuStreamliner
		-- Caching the result of the following string of checks since they are invariant anyway (i.e. any changes require a level
		-- restart) to avoid doing this every frame
		shouldgetdummy_cached = MainMenuStreamliner == nil or MainMenuStreamliner.EntriesToHide == nil or MainMenuStreamliner.EntriesToHide.main == nil or not MainMenuStreamliner.EntriesToHide.main.ad_dummy
	end

	return shouldgetdummy_cached and try_get_dummy_actual(self, ...) or nil
end

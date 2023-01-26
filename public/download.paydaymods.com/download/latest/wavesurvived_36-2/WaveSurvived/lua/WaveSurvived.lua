local function LoadCustomScript(name)
	return dofile(ModPath .. "/custom_scripts/" .. name .. ".lua")
end

if WaveSurvived and WaveSurvived.options and WaveSurvived.options["WaveSurvived_compatibility"] then
	LoadCustomScript(WaveSurvivedTweakData.supported_hud[WaveSurvived.options["WaveSurvived_compatibility"]])
else
	LoadCustomScript(WaveSurvivedTweakData.supported_hud[1])
end
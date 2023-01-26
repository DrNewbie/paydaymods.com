if not ModCore then
	log("[ERROR] Unable to find ModCore from BeardLib! Is BeardLib installed correctly?")
	return
end

WaveSurvivedCore = WaveSurvivedCore or class(ModCore)

function WaveSurvivedCore:init()
	--Calling the base function for init from ModCore
	--self_tbl, config path, auto load modules, auto post init modules
	self.super.init(self, ModPath .. "Config.xml", true, true)
end
--[[
Hooks:Add("MenuManagerOnOpenMenu", "WaveSurvived_Alert_Compatibility", function( menu_manager, menu, position )
	if menu == "menu_main" then

		function WaveSurvivedCore:Compatibility_Alert_Message()
			local menu_title = managers.localization:text("WaveSurvived_alert_compatibility_title")
			local menu_message = managers.localization:text("WaveSurvived_alert_compatibility_message")
			local menu_options = {
			    [1] = {
			        text = managers.localization:text("WaveSurvived_alert_compatibility_button_ok"),
			        is_cancel_button = true,
			    },
			}
			QuickMenu:new( menu_title, menu_message, menu_options, true )
		end

		function WaveSurvivedCore:Compatibility_Alert_Check()
			local hud_lddg = SystemFS:exists("mods/LDDG Hud/mod.txt")

			if hud_lddg and WaveSurvived.options["WaveSurvived_compatibility"] ~= 5 then
				WaveSurvivedCore:Compatibility_Alert_Message()
				local hud_number = 5
				WaveSurvived.options.WaveSurvived_compatibility = hud_number
				log("[WaveSurvived] Auto-changed the HUD : " .. WaveSurvived.options.WaveSurvived_compatibility)
				WaveSurvivedCore:Save()
			end

			local nepgearsy_hud = SystemFS:exists("mods/Nepgearsy HUD/mod.txt")

			if nepgearsy_hud and WaveSurvived.options["WaveSurvived_compatibility"] ~= 2 then
				WaveSurvivedCore:Compatibility_Alert_Message()
				local hud_number = 2
				WaveSurvived.options.WaveSurvived_compatibility = hud_number
				log("[WaveSurvived] Auto-changed the HUD : " .. WaveSurvived.options.WaveSurvived_compatibility)
				WaveSurvivedCore:Save()
			end

			if restoration and restoration.Options then
				if restoration.Options:GetValue("HUD/AssaultPanel") and WaveSurvived.options["WaveSurvived_compatibility"] ~= 6 then
					WaveSurvivedCore:Compatibility_Alert_Message()
					local hud_number = 6
					WaveSurvived.options.WaveSurvived_compatibility = hud_number
					log("[WaveSurvived] Auto-changed the HUD : " .. WaveSurvived.options.WaveSurvived_compatibility)
					WaveSurvivedCore:Save()
				elseif not restoration.Options:GetValue("HUD/AssaultPanel") and WaveSurvived.options["WaveSurvived_compatibility"] ~= 1 then
					WaveSurvivedCore:Compatibility_Alert_Message()
					local hud_number = 1
					WaveSurvived.options.WaveSurvived_compatibility = hud_number
					log("[WaveSurvived] Auto-changed the HUD : " .. WaveSurvived.options.WaveSurvived_compatibility)
					WaveSurvivedCore:Save()
				end
			end

			if pdth_hud and pdth_hud.Options then
				if pdth_hud.Options:GetValue("HUD/Assault") and WaveSurvived.options["WaveSurvived_compatibility"] ~= 4 then
					WaveSurvivedCore:Compatibility_Alert_Message()
					local hud_number = 4
					WaveSurvived.options.WaveSurvived_compatibility = hud_number
					log("[WaveSurvived] Auto-changed the HUD : " .. WaveSurvived.options.WaveSurvived_compatibility)
					WaveSurvivedCore:Save()
				elseif not pdth_hud.Options:GetValue("HUD/Assault") and WaveSurvived.options["WaveSurvived_compatibility"] ~= 1 then
					WaveSurvivedCore:Compatibility_Alert_Message()
					local hud_number = 1
					WaveSurvived.options.WaveSurvived_compatibility = hud_number
					log("[WaveSurvived] Auto-changed the HUD : " .. WaveSurvived.options.WaveSurvived_compatibility)
					WaveSurvivedCore:Save()
				end
			end

			if Holo and Holo.Options then 
				if Holo.Options:GetValue("HudBox") and Holo:ShouldModify("Hud", "HudAssault") and WaveSurvived.options["WaveSurvived_compatibility"] ~= 3 then
					WaveSurvivedCore:Compatibility_Alert_Message()
					local hud_number = 3
					WaveSurvived.options.WaveSurvived_compatibility = hud_number
					log("[WaveSurvived] Auto-changed the HUD : " .. WaveSurvived.options.WaveSurvived_compatibility)
					WaveSurvivedCore:Save()
				elseif not Holo.Options:GetValue("HudBox") and not Holo:ShouldModify("Hud", "HudAssault") and WaveSurvived.options["WaveSurvived_compatibility"] ~= 1 then
					WaveSurvivedCore:Compatibility_Alert_Message()
					local hud_number = 1
					WaveSurvived.options.WaveSurvived_compatibility = hud_number
					log("[WaveSurvived] Auto-changed the HUD : " .. WaveSurvived.options.WaveSurvived_compatibility)
					WaveSurvivedCore:Save()
				end
			end

			if not pdth_hud and not hud_lddg and not restoration and not Holo and not nepgearsy_hud and WaveSurvived.options["WaveSurvived_compatibility"] ~= 1 then
				WaveSurvivedCore:Compatibility_Alert_Message()
				local hud_number = 1
				WaveSurvived.options.WaveSurvived_compatibility = hud_number
				log("[WaveSurvived] Auto-changed the HUD : " .. WaveSurvived.options.WaveSurvived_compatibility)
				WaveSurvivedCore:Save()
			end
		end

		if WaveSurvived.options["WaveSurvived_enable_checks_value"] ~= false then
			WaveSurvivedCore:Compatibility_Alert_Check()
		end
	end
end)
--]]
if not _G.WaveSurvived then
	local success, err = pcall(function() WaveSurvivedCore:new() end)
	if not success then
		log("[ERROR] An error occured on the initialization of WaveSurvived. " .. tostring(err))
	end
end

if InventoryChatAndPlayerStates_ContractBoxGui_Hooked then
	return
else
	InventoryChatAndPlayerStates_ContractBoxGui_Hooked = true
end

-- This hook is used to force an update when joining a lobby as a client
local function init_Hook(...)
	if InventoryChatAndPlayerStates ~= nil then
		InventoryChatAndPlayerStates:StoreJobData()
	end
end
Hooks:PostHook(ContractBoxGui, "init", "InventoryChatAndPlayerStates_ContractBoxGui_init_Hook", init_Hook)

-- Optimization: This is placed here so it does not get generated every single time ContractBoxGui:create_contract_box() gets
-- called (since repeatedly generating closures wastes memory)
local function Deferred_UpdateJobPlanIcon()
	if managers.menu_component ~= nil and managers.menu_component._contract_gui ~= nil and managers.menu_component._contract_gui.UpdateJobPlanIcon ~= nil and InventoryChatAndPlayerStates ~= nil then
		managers.menu_component._contract_gui:UpdateJobPlanIcon(InventoryChatAndPlayerStates)
	end
end

local function create_contract_box_Hook(self, ...)
	if not managers.network:session() then
		return
	end

	local basepanel = self._panel
	if InventoryChatAndPlayerStates ~= nil and alive(basepanel) then
		-- Create a new icon that follows the contract name (or pro job text, depending on whether the latter is visible)
		if not alive(self.job_plan) then
			self.job_plan = basepanel:bitmap({
				name = "job_plan",
				texture = "guis/textures/pd2/cn_playstyle_loud",
				blend_mode = "normal",
				visible = false
			})
		end
		-- This is needed as Lobby Player Info 1) manipulates the contract box's width, 2) does not have a priority value
		-- assigned to it (so BLT defaults its priority to 0). Since I don't feel like setting this mod's priority to -1 just to
		-- work around that (which would also effectively cause this mod to override virtually all other mods), the next possible
		-- workaround is to defer the icon update so that it only occurs after Lobby Player Info has done its thing. It's
		-- hardly ideal (since the user may notice the icon appearing after a short delay), but it works for the most part. This
		-- is placed here instead of ContractBoxGui:init() as the latter only gets called once, while
		-- ContractBoxGui:create_contract_box() gets called more often (e.g. when a player joins the lobby or changes their
		-- loadout), and also because Lobby Player Info would perform its width manipulation again on each of those calls
		DelayedCalls:Add("InventoryChatAndPlayerStates_Deferred_UpdateJobPlanIcon", 0.1, Deferred_UpdateJobPlanIcon)
	end
end
Hooks:PostHook(ContractBoxGui, "create_contract_box", "InventoryChatAndPlayerStates_ContractBoxGui_create_contract_box_Hook", create_contract_box_Hook)

-- Called from InventoryChatAndPlayerStates:UpdateJobText()
function ContractBoxGui:UpdateJobPlanIcon(icaps)
	if icaps == nil then
		return
	end

	local basepanel = self._panel
	if not alive(basepanel) then
		return
	end

	local panel = self.job_plan
	if alive(panel) then
		panel:hide()

		if icaps.JobData ~= nil then
			local job_plan_index = icaps.JobData.job_plan
			if job_plan_index ~= nil and job_plan_index > 0 then
				panel:show()
				if job_plan_index == 1 then
					panel:set_image("guis/textures/pd2/cn_playstyle_loud")
				elseif job_plan_index == 2 then
					panel:set_image("guis/textures/pd2/cn_playstyle_stealth")
				else
					panel:hide()
					log("[InventoryChatAndPlayerStates] ContractBoxGui:UpdateJobPlanIcon() | Warning: Unrecognized job_plan index " .. tostring(job_plan_index))
				end
			end

			local ref_panel = basepanel:child("pro_text")
			if not alive(ref_panel) then
				ref_panel = self._contract_text_header
				if not alive(ref_panel) then
					return
				end
			end

			panel:set_center_y(ref_panel:center_y())
			panel:set_left(ref_panel:right() + 10)
		end
	end
end

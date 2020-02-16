local dialog_ids = {
--bain's lines
	["pln_rt1_12"] = "added",
	["pln_rt1_23"] = "fail",
	["pln_rt1_20"] = "mu",
	["pln_rt1_22"] = "cs",
	["pln_rt1_24"] = "hcl",
	["pln_rt1_28"] = "added",
	["Play_pln_nai_16"] = "fail", --this and 15 both play on lab rats, not sure which i should use. 16 seems to only play on lab rats
	["pln_rat_stage1_20"] = "mu",
	["pln_rat_stage1_22"] = "cs",
	["pln_rat_stage1_24"] = "hcl",
	["pln_rat_stage1_28"] = "done",
	
--locke's lines
	["Play_loc_mex_cook_03"] = "mu",
	["Play_loc_mex_cook_04"] = "cs",
	["Play_loc_mex_cook_05"] = "hcl",
	["Play_loc_mex_cook_14"] = "done", --used when you have not stashed the requisite amount of bags
	["Play_loc_mex_cook_17"] = "done", --used when you have secured enough bags to escape
	["Play_loc_mex_cook_22"] = "added",
	["Play_loc_mex_cook_12"] = "fail"
}
Hooks:PostHook(DialogManager,"queue_dialog","DialogManagerQueueDialog_MethHelperUpdated",function(self,id,params)
	if not MethHelperUpdated:IsEnabled() then 
		--methhelper is set to disabled in mod options, so do nothing
		return
	end
	local line_type = dialog_ids[tostring(id)]
	if not line_type then 
		--line is not on the list of catalogued meth cooking lines, so do nothing
		return
	end
	local chatmode,hintmode
	local output
	if (line_type == "mu") or (line_type == "cs") or (line_type == "hcl") then
		chatmode,hintmode = MethHelperUpdated:GetOutputType("ingred")
		if (line_type ~= MethHelperUpdated._last_ingredient) or MethHelperUpdated:ShouldRepeatIngredients() then 
			output = MethHelperUpdated:LocalizeLine(line_type)
		end
		MethHelperUpdated._last_ingredient = line_type
	elseif (line_type == "fail") or (line_type == "added") or (line_type == "done") then 
		chatmode,hintmode = MethHelperUpdated:GetOutputType(line_type)
		output = MethHelperUpdated:LocalizeLine(line_type)
		MethHelperUpdated._last_ingredient = line_type
	end
	
	if output then 
		local prefix = "[" .. MethHelperUpdated:LocalizeLine("prefix") .. "]"
		local color = Color("5FE1FF") --cyan
		if chatmode == 1 then 
			managers.chat:_receive_message(1,prefix,output,color)
		elseif chatmode == 2 then 
			managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", output)
		elseif chatmode == 3 then 
			--nothing
		end
		if hintmode then 
			managers.hud:show_hint({text = output})
		end
	end
end)	

--[[	Other voicelines: (paraphrasing most)
	Play_loc_mex_cook_##:
		01 says "let's get started cooking"
		06 says "see any of that ingredient anywhere?"
		12 says "oh no, i had a feeling that was wrong" (wrong ingredient/explosion)
		13 says "first batch done"
		15 says "check the trucks for ingredients"
		16 says "that's enough loot, you can either keep cooking or leave when you want" 
		18 says "there's more ingredients around here if you look"
		19 says "hokay, let's have a look." (exact wording, no variants)
		20 says "that should get the process going" (cooking process)
		21 says "pour it in!" (generic cooking reminder)
		23 says "lost power, please restore it"
		
	Play_loc_count_gen_##:
		01 through 08 are used for counting;
		09 says "a couple more"
		10 says "one more"
		11 says "keep going"
		12 says "we have enough"
	
		13 through 15 are for post-heist, i believe
		13 says "maybe we'll get it right next time" (failure/methlab blown?)
		14 says "not bad, maybe next time we can get more (adequate amount but not extra)
		15 says "well done, this will bring a nice amount of change!" (large amount gotten)
--]]
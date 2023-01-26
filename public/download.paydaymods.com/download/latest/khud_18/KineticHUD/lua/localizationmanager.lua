-- i was disconnected from the internet, and my computer didn't have a string id revealer, so i just made one in literally 30 seconds 

local enabled = false

if enabled then 
	local orig_localize = LocalizationManager.text
	function LocalizationManager:text(arg,...)
		local result = orig_localize(self,arg,...)
		return arg or result
	end
end
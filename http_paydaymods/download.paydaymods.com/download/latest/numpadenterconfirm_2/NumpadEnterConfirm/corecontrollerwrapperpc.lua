core:module("CoreControllerWrapperPC")
core:import("CoreControllerWrapper")

-- Ergh, I have to put this here as dofile() does not work properly for this file
local function table_pack(...)
	return {n = select("#", ...), ...}
end

local virtual_connect_confirm_actual = ControllerWrapperPC.virtual_connect_confirm
function ControllerWrapperPC:virtual_connect_confirm(...)
	virtual_connect_confirm_actual(self, ...)

	local args = table_pack(...)
	args[3] = "num enter"
	self:virtual_connect2(unpack(args))
end


local init_actual = MenuNodeReticleSwitchGui.init
function MenuNodeReticleSwitchGui:init(node, ...)
	if node ~= nil and node._parameters ~= nil then
		node._parameters.scene_state = nil
	end

	return init_actual(self, node, ...)
end

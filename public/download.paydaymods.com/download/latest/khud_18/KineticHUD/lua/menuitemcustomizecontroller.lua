--[[ 
not currently hooked in mod.txt

this fixed a crash but did not fix the underlying issue
the crash occurred when the user tried to bind keybinds that were inside of menuhelper menus
the keybind would not save after the fact

local orig = MenuItemCustomizeController.reload
function MenuItemCustomizeController:reload(row_item,node,...)
	if not (row_item and row_item.controller_binding) then
		return true
	end
	return orig(self,row_item,node,...)
end
--]]
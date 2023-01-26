
-- Packs all the variable arguments into an indexed table that also keeps track of their total number. This should be used
-- instead of unpack{...} as the latter does not handle nil arguments properly (since all arguments that follow it would now be
-- nil as well). Recall that setting a nil value in a table causes the corresponding entry to be deleted, which would be an issue
-- when unpacking the table again to call the original function. Another advantage is its resilience to function prototype
-- changes in certain cases, such as when finding and replacing arguments to trick the original function into behaving
-- differently (e.g. key remapping)
--
-- From Lua 5.2
-- http://stackoverflow.com/questions/7183998/in-lua-what-is-the-right-way-to-handle-varargs-which-contains-nil/7186820#7186820
local function table_pack(...)
	return {n = select("#", ...), ...}
end

-- Lua 5.2 moved unpack to table.unpack, fix up for forward compatibility. Note that if table.pack() was used to create the table,
-- unpack will ignore the 'n' entry as it iterates the table by integer indexes
local table_unpack = table.unpack or unpack

local numpadenter = Idstring("num enter")
local normalenter = Idstring("enter")

NumpadEnterConfirm_RemapNumpadEnter = NumpadEnterConfirm_RemapNumpadEnter or function(...)
	local args = table_pack(...)
	-- Run through all arguments and substitute "num enter" with "enter" if found
	for i = 1, args.n do
		if args[i] == numpadenter then
			args[i] = normalenter
			break
		end
	end
	return args
end


if DelayedCallsFix_CoreApp_Hooked then
	return
else
	DelayedCallsFix_CoreApp_Hooked = true
end

DelayedCallsFix = DelayedCallsFix or {}
DelayedCallsFix._calls = DelayedCallsFix._calls or {}

Hooks:Add("MenuUpdate", "DelayedCallsFix_MenuUpdate", function(t, dt)
	DelayedCallsFix:Update(t, dt)
end)

Hooks:Add("GameSetupUpdate", "DelayedCallsFix_GameSetupUpdate", function(t, dt)
	DelayedCallsFix:Update(t, dt)
end)

local upcoming = {}
local incoming = {}
local removals = {}
function DelayedCallsFix:Update(time, deltaTime)
	-- Lock the table's state otherwise newly added callbacks (such as those added by a callback executed in the loop below)
	-- may be lost if they get inserted in such a way that pairs() never encounters them (actually, mutating a table being
	-- iterated upon by pairs() isn't even a good idea in the first place...). This is done by making self._calls point to an
	-- empty table instead
	local immutable = self._calls
	self._calls = incoming

	for k, v in pairs(immutable) do
		v.currentTime = v.currentTime + deltaTime
		if v.currentTime >= v.timeToWait then
			if v.functionCall then
				-- Wrap the function call in a pcall() to prevent execution failure from corrupting the table reference variables
				-- above (which have already been swapped at this point). This is really only an issue when the SNAFU mod is used,
				-- since the game terminates upon execution failure by default (in SNAFU's case, execution would have ended here
				-- and returned again the following frame from the top of the function, eventually causing the variables above to
				-- reference the same table instead of separate ones as they should)
				local status = pcall(v.functionCall)
				if not status then
					log("[DelayedCallsFix] Warning: Execution of callback \"" .. tostring(k) .. "\" has failed, skipping")
				end
			end
		else
			upcoming[k] = v
		end
	end
	-- Process all callbacks that have been added by the ones executed above, but do not call them now otherwise it defeats
	-- the entire purpose of this loop (which is to correctly handle callbacks that add new callbacks)
	for k, v in pairs(self._calls) do
		upcoming[k] = v
	end
	-- Process the removal queue
	for k, v in pairs(removals) do
		if upcoming[k] ~= nil then
			upcoming[k] = nil
		end
	end

	-- Clear away the tables' contents (recycling tables for memory efficiency)
	for key, __ in pairs(immutable) do
		immutable[key] = nil
	end
	for key, __ in pairs(self._calls) do
		self._calls[key] = nil
	end
	for key, __ in pairs(removals) do
		removals[key] = nil
	end

	-- Swap the tables' references
	self._calls, upcoming, incoming = upcoming, self._calls, immutable
end

function DelayedCallsFix:Add(id, time, func)
	local data = self._calls[id]

	if data == nil then
		self._calls[id] = {
			functionCall = func,
			timeToWait = time,
			currentTime = 0
		}
	else
		-- Do not create a new table if an entry already exists (memory efficiency)
		data.functionCall = func
		data.timeToWait = time
		data.currentTime = 0
	end
end

function DelayedCallsFix:Remove(id)
	local data = self._calls[id]

	if data == nil then
		-- The table references may have been swapped, add it to the removal queue for processing in DelayedCallsFix:Update()
		-- This can happen when DelayedCallsFix:Remove() is called within a callback that is currently being called by
		-- DelayedCallsFix:Update()
		removals[id] = true
	else
		self._calls[id] = nil
	end
end

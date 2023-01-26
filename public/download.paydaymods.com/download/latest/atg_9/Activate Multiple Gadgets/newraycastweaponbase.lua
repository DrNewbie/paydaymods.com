

--Replaced nasty case-wise forbid_toggle table with a nice gadget-type checker :)
local function forbids_toggle(id)
	if not AllTheGadgets:SightCycleDisabled() then 
		return false
	end
	local td = tweak_data.weapon.factory.parts[id]
	return (td and td.sub_type == "second_sight")
end

--local orig_toggle_gadget = NewRaycastWeaponBase.toggle_gadget
--			return orig_toggle_gadget(self,current_state)
function NewRaycastWeaponBase:toggle_gadget(current_state)
	if not self._enabled then return false end
	local gadget_on = self._gadget_on or 0
	local gadgets = self._gadgets or managers.weapon_factory:get_parts_from_weapon_by_type_or_perk("gadget", self._factory_id, self._blueprint)
	
	if gadgets then
		local has_second_sight = (AllTheGadgets:SightCycleDisabled() and self._second_sight_data and self._second_sight_data.unit) and 1 or 0
	--	local sub_type = tweak_data.weapon.factory.parts[part_id] and factory.parts[part_id].sub_type
	
		local num_gadgets = #gadgets - has_second_sight
		
		if AllTheGadgets:IsEnabled() then
			local gadget_combo_count = math.pow(num_gadgets,2) + num_gadgets --max number of combinations between any 2 of the objects

			gadget_on = (gadget_on + 1) % (gadget_combo_count) --effectively, #of gadget-toggle keypresses

			self._gadget_on = gadget_on
			self:set_gadget_on(gadget_on,false,gadgets,current_state)
			return true
		else
			gadget_on = (gadget_on + 1) % (num_gadgets + 1)
			
			self:set_gadget_on(gadget_on, false, gadgets, current_state)

			return true		
		end
	end

	return false
end

--local orig_set_gadget_on = NewRaycastWeaponBase.set_gadget_on
--		return orig_set_gadget_on(self,gadget_on,ignore_enable,gadgets,current_state)
function NewRaycastWeaponBase:set_gadget_on(gadget_on, ignore_enable, gadgets, current_state,primary,secondary)
	if not ignore_enable and not self._enabled then return end
	if not self._assembly_complete then return end
	self._gadget_on = gadget_on or self._gadget_on
	local gadget = nil
	
	gadget_on = self._gadget_on or 0 --BESTEST EFFICIENTEST CODING 2018
	gadgets = self._gadgets or gadgets or managers.weapon_factory:get_parts_from_weapon_by_type_or_perk("gadget", self._factory_id, self._blueprint)

	if gadgets then

		local has_second_sight = (AllTheGadgets:SightCycleDisabled() and self._second_sight_data and self._second_sight_data.unit) and 1 or 0
	--	local sub_type = tweak_data.weapon.factory.parts[part_id] and factory.parts[part_id].sub_type
	
		local num_gadgets = #gadgets - has_second_sight
				
		local primary = math.floor(gadget_on / (num_gadgets + 1)) --cycles from 0 to #gadgets
		local secondary = gadget_on % (num_gadgets + 1) -- +1 once every #gadgets
	
		local dontloop = 0
		while (gadget_on ~= 0) and (secondary <= primary) and (primary ~= 0) and (dontloop <= (num_gadgets * (num_gadgets - 1))) do
			gadget_on = gadget_on + 1
			primary = math.floor(gadget_on / (num_gadgets + 1))
			secondary = gadget_on % (num_gadgets + 1)			
			dontloop = dontloop + 1
		end
		self._gadget_on = gadget_on or self._gadget_on --BESTEST EFFICIENTEST CODING 2019

		
		if AllTheGadgets:IsEnabled() then
			for i, id in ipairs(gadgets or self._gadgets) do
				gadget = self._parts[id]
			
				if gadget and alive(gadget.unit) then
					if forbids_toggle(id) then
						--NEWRAYCASTWEAPONBASE used SPLASH!
					elseif i == 0 then
						gadget.unit:base():set_state(false, self._sound_fire, current_state)
					elseif (i == primary) or (i == secondary) then 
						gadget.unit:base():set_state(i, self._sound_fire, current_state)
					else
						gadget.unit:base():set_state(false, self._sound_fire, current_state)
					end
				end
			end
		else
			for i, id in ipairs(gadgets or self._gadgets) do
				gadget = self._parts[id]

				if gadget and alive(gadget.unit) and not forbids_toggle(id) then
					gadget.unit:base():set_state(self._gadget_on == i, self._sound_fire, current_state)
				end
			end
		end
	end
end

Hooks:PostHook(NewRaycastWeaponBase,"on_disabled","atg_newraycastbase_ondisabled",function(self)
	if not self._gadgets then return end
	for i, id in ipairs(self._gadgets) do 
		if forbids_toggle(id) then
			local gadget = self._parts[id]
			if gadget and alive(gadget.unit) and gadget.unit:base():is_on() then
				self:set_last_sight_gadget(id)
				return
			end
		end
	end
end)

Hooks:PostHook(NewRaycastWeaponBase,"on_enabled","atg_newraycastbase_onenabled",function(self)
	self:toggle_second_sight(self:get_last_sight_gadget())
end)

function NewRaycastWeaponBase:toggle_second_sight(id)
	if not id then return end
	local gadget = self._parts[id]
	if gadget and alive(gadget.unit) then 
		gadget.unit:base():set_off()
		gadget.unit:base():set_on()
	end
	self:set_last_sight_gadget()
end

--these two functions are from this mod
function NewRaycastWeaponBase:set_last_sight_gadget(id) 
	self._last_sight_gadget = id --includes resetting to nil with no argument
end

function NewRaycastWeaponBase:get_last_sight_gadget()
	return self._last_sight_gadget
end

local orig_sort_gadgets = NewRaycastWeaponBase._refresh_gadget_list
function NewRaycastWeaponBase:_refresh_gadget_list()
	if not AllTheGadgets:SightCycleDisabled() then
		return orig_sort_gadgets(self)
	end
	self._gadgets = managers.weapon_factory:get_parts_from_weapon_by_type_or_perk("gadget", self._factory_id, self._blueprint)

	if not self._gadgets or #self._gadgets == 0 then
		return
	end

	local part_a, part_b = nil
	
--	local part_factory = tweak_data.weapon.factory.parts --ovk why is this line here? it's not referenced anywhere anymore

	table.sort(self._gadgets, function (a, b)
		part_a = self._parts[a]
		part_b = self._parts[b]

		if not part_a then
			return false
		end

		if not part_b then
			return true
		end
		
		local ap_a = part_a.unit:base().GADGET_TYPE
		local ap_b = part_b.unit:base().GADGET_TYPE

		if ap_a == "second_sight" or ap_a == "sight_gadget" then --shouldn't ever be "sight_gadget" but i may as well keep that in
			return false
		elseif ap_b == "second_sight" or ap_b == "sight_gadget" then 
			return true
		end
		local result = ap_b < ap_a

		return result
	end)

end

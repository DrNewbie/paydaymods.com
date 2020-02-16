local init_original = ObjectInteractionManager.init
local update_original = ObjectInteractionManager.update
local add_unit_original = ObjectInteractionManager.add_unit
local remove_unit_original = ObjectInteractionManager.remove_unit
local interact_original = ObjectInteractionManager.interact
local interupt_action_interact_original = ObjectInteractionManager.interupt_action_interact

ObjectInteractionManager.LOOT_TYPE_FROM_INTERACTION_ID = {
	--If you add stuff here, make sure you add it to HUDList.LootItem.LOOT_ICON_MAP as well
	weapon_case =			"weapon",
	samurai_armor =		"armor",
	--crate_loot_crowbar =	"container",
	--crate_loot =				"container",
	--crate_loot_close =		"container",
	--Crates and suitcases etc interaction ID's here -> type "container"
}

ObjectInteractionManager.LOOT_TYPE_FROM_CARRY_ID = {
	--If you add stuff here, make sure you add it to HUDList.LootItem.LOOT_ICON_MAP as well
	gold =						"gold",
	money =					"money",
	diamonds =				"jewelry",
	painting =					"painting",
	mus_artifact_paint =	"painting",
	coke =						"coke",
	coke_pure =				"coke",
	meth =						"meth",
	weapon =					"weapon",
	circuit =					"server",
	turret =						"turret",
	ammo =					"shell",
	artifact_statue =		"artifact",
	mus_artifact =			"artifact",
	samurai_suit =			"armor",
	sandwich =				"toast",
	hope_diamond =		"diamond",
	cro_loot1 =				"bomb",
	cro_loot2 =				"bomb",
	evidence_bag =			"evidence",
	warhead =					"warhead",
}

ObjectInteractionManager.LOOT_TYPE_LEVEL_COMPENSATION = {
	framing_frame_3 = 						{ gold = 16, },
}

ObjectInteractionManager.LOOT_BAG_INTERACTION_ID = {
	painting_carry_drop = true,	--Painting
	carry_drop = true,					--Generic bag
}

ObjectInteractionManager.LOOT_IGNORE_EDITOR_ID = {
	["100054"] = true, ["100058"] = true, ["100426"] = true, ["100427"] = true, ["100428"] = true, ["100429"] = true, ["100491"] = true, ["100492"] = true, ["100494"] = true, ["100495"] = true,	--Watchdogs day 2 (8x coke)
	["100899"] = true,	--Diamond store (1x money)
	["104526"] = true,	--Hotline Miami day 1 (1x money)
	["100886"] = true, ["100872"] = true,	--Big Oil day 1 (1x money, 1x gold)
	["300047"] = true, ["300686"] = true, ["300457"] = true, ["300458"] = true, ["301343"] = true, ["301346"] = true,	--The Diamond (RNG)
	["101237"] = true, ["101238"] = true, ["101239"] = true, ["103835"] = true, ["103836"] = true, ["103837"] = true, ["103838"] = true, ["101240"] = true,	--Transport: Underpass (8x money)
	["101514"] = true,	--Ukrainian Job (1x money)
}

ObjectInteractionManager.SPECIAL_PICKUP_TYPE_FROM_INTERACTION_ID = {
	--If you add stuff here, make sure you add it to HUDList.SpecialPickupItem.SPECIAL_PICKUP_ICON_MAP as well
	gen_pku_crowbar =		"crowbar",
	pickup_keycard =			"keycard",
	gage_assignment =		"courier",
	pickup_boards =			"planks",
	stash_planks_pickup =	"planks",
	muriatic_acid =				"meth_ingredients",
	hydrogen_chloride = 		"meth_ingredients",
	caustic_soda =				"meth_ingredients",
}

ObjectInteractionManager.SPECIAL_PICKUP_IGNORE_EDITOR_ID = {
	["101499"] = true,	--Big Bank keycard
	["107208"] = true,	--Firestarter day 2 keycard
}

function ObjectInteractionManager:init(...)
	init_original(self, ...)
	
	self._queued_units = {}
	self._pager_count = 0
	self._total_loot_count = { bagged = 0, unbagged = 0 }
	self._loot_count = {}
	self._loot_units_added = {}
	self._special_pickup_count = {}
	self._active_pagers = {}
	
	for carry_id, type_id in pairs(ObjectInteractionManager.LOOT_TYPE_FROM_CARRY_ID) do
		self._loot_count[type_id] = { bagged = 0, unbagged = 0 }
	end
	for interaction_id, type_id in pairs(ObjectInteractionManager.LOOT_TYPE_FROM_INTERACTION_ID) do
		self._loot_count[type_id] = { bagged = 0, unbagged = 0 }
	end
	
	
	for interaction_id, type_id in pairs(ObjectInteractionManager.SPECIAL_PICKUP_TYPE_FROM_INTERACTION_ID) do
		self._special_pickup_count[type_id] = 0
	end
	
	self._interactive_unit_listeners = {}
end

function ObjectInteractionManager:update(t, ...)
	update_original(self, t, ...)
	self:_check_queued_units(t)
end

function ObjectInteractionManager:add_unit(unit, ...)
	table.insert(self._queued_units, unit)
	return add_unit_original(self, unit, ...)
end

function ObjectInteractionManager:remove_unit(unit, ...)
	self:_check_remove_unit(unit)
	return remove_unit_original(self, unit, ...)
end

function ObjectInteractionManager:interact(...)
	if alive(self._active_unit) and self._active_unit:interaction().tweak_data == "corpse_alarm_pager" then
		self:pager_answered(self._active_unit)
	end
	
	return interact_original(self, ...)
end

function ObjectInteractionManager:interupt_action_interact(...)
	if alive(self._active_unit) and self._active_unit:interaction() and self._active_unit:interaction().tweak_data == "corpse_alarm_pager" then
		self:pager_ended(self._active_unit)
	end
	
	return interupt_action_interact_original(self, ...)
end


function ObjectInteractionManager:_check_queued_units(t)
	for i, unit in ipairs(self._queued_units) do
		if alive(unit) then
			local carry_id = unit:carry_data() and unit:carry_data():carry_id()
			local interaction_id = unit:interaction().tweak_data
			local loot_type_id = carry_id and ObjectInteractionManager.LOOT_TYPE_FROM_CARRY_ID[carry_id] or ObjectInteractionManager.LOOT_TYPE_FROM_INTERACTION_ID[interaction_id]
			local special_pickup_type_id = ObjectInteractionManager.SPECIAL_PICKUP_TYPE_FROM_INTERACTION_ID[interaction_id]
			local editor_id = tostring(unit:editor_id())
			
			if loot_type_id then
				if not ObjectInteractionManager.LOOT_IGNORE_EDITOR_ID[editor_id] then
					self._loot_units_added[unit:key()] = loot_type_id
					self:_change_loot_count(unit, loot_type_id, 1, ObjectInteractionManager.LOOT_BAG_INTERACTION_ID[interaction_id] or false)
				end
			elseif special_pickup_type_id then
				if not ObjectInteractionManager.SPECIAL_PICKUP_IGNORE_EDITOR_ID[editor_id] then
					self:_change_special_pickup_count(unit, special_pickup_type_id, 1)
				end
			elseif interaction_id == "corpse_alarm_pager" then
				self:_pager_started(unit)
			end
			
			for name, clbk in pairs(self._interactive_unit_listeners) do
				clbk(unit, true)
			end
		end
	end
	
	self._queued_units = {}
end

function ObjectInteractionManager:_check_remove_unit(unit)
	for i, queued_unit in ipairs(self._queued_units) do
		if queued_unit == unit then
			table.remove(self._queued_units, i)
			return
		end
	end
	
	local carry_id = unit:carry_data() and unit:carry_data():carry_id()
	local interaction_id = unit:interaction().tweak_data
	local loot_type_id = carry_id and ObjectInteractionManager.LOOT_TYPE_FROM_CARRY_ID[carry_id] or ObjectInteractionManager.LOOT_TYPE_FROM_INTERACTION_ID[interaction_id]
	local special_pickup_type_id = ObjectInteractionManager.SPECIAL_PICKUP_TYPE_FROM_INTERACTION_ID[interaction_id]
	local editor_id = tostring(unit:editor_id())

	if loot_type_id or self._loot_units_added[unit:key()] then
		if not ObjectInteractionManager.LOOT_IGNORE_EDITOR_ID[editor_id] then
			loot_type_id = loot_type_id or self._loot_units_added[unit:key()]
			self:_change_loot_count(unit, loot_type_id, -1, ObjectInteractionManager.LOOT_BAG_INTERACTION_ID[interaction_id] or false)
			self._loot_units_added[unit:key()] = nil
		end
	elseif special_pickup_type_id then
		if not ObjectInteractionManager.SPECIAL_PICKUP_IGNORE_EDITOR_ID[editor_id] then
			self:_change_special_pickup_count(unit, special_pickup_type_id, -1)
		end
	elseif interaction_id == "corpse_alarm_pager" then
		self:pager_ended(unit)
	end
	
	for name, clbk in pairs(self._interactive_unit_listeners) do
		clbk(unit, false)
	end
end

function ObjectInteractionManager:_change_loot_count(unit, loot_type, change, bagged)
	self._total_loot_count.bagged = self._total_loot_count.bagged + (bagged and change or 0)
	self._loot_count[loot_type].bagged = self._loot_count[loot_type].bagged + (bagged and change or 0)
	self._total_loot_count.unbagged = self._total_loot_count.unbagged + (bagged and 0 or change)
	self._loot_count[loot_type].unbagged = self._loot_count[loot_type].unbagged + (bagged and 0 or change)
	
	if HUDManager.ListOptions.show_loot and managers.hud and managers.hud:list_initialized() then
		local item_name = HUDManager.ListOptions.aggregate_loot and "all" or loot_type
		local count_loot_type = not HUDManager.ListOptions.aggregate_loot and loot_type or nil
		managers.hud:hud_list("right_side_list"):item("loot_list"):item(item_name):set_count(self:loot_count(count_loot_type))
	end
end

function ObjectInteractionManager:_get_loot_level_compensation(loot_type)
	local count = 0
	local level_id = managers.job and managers.job:current_level_id()
	local level_data = level_id and ObjectInteractionManager.LOOT_TYPE_LEVEL_COMPENSATION[level_id]
	for id, amount in pairs(level_data or {}) do
		if not loot_type or loot_type == id then
			count = count + amount
		end
	end
	
	return count
end

function ObjectInteractionManager:loot_count(loot_type)
	local data = loot_type and self._loot_count[loot_type] or self._total_loot_count
	local compensation = self:_get_loot_level_compensation(loot_type)
	return data.unbagged - compensation, data.bagged
end

function ObjectInteractionManager:_change_special_pickup_count(unit, pickup_type, change)
	self._special_pickup_count[pickup_type] = self._special_pickup_count[pickup_type] + change
	
	if HUDManager.ListOptions.show_special_pickups and managers.hud and managers.hud:list_initialized() then
		managers.hud:hud_list("right_side_list")
			:item("special_pickup_list")
			:item(pickup_type)
			:set_count(self:special_pickup_count(pickup_type))
	end
end

function ObjectInteractionManager:special_pickup_count(pickup_type)
	return self._special_pickup_count[pickup_type]
end

function ObjectInteractionManager:_pager_started(unit)
	if not self._active_pagers[unit:key()] then
		self._pager_count = self._pager_count + 1
		self._active_pagers[unit:key()] = true
		
		if managers.hud and managers.hud:list_initialized() then
			if HUDManager.ListOptions.show_pagers then
				managers.hud:hud_list("left_side_list"):item("pagers"):register_item("pager_" .. tostring(unit:key()), HUDList.PagerItem, unit):activate()
			end
			
			if HUDManager.ListOptions.show_pager_count and managers.groupai:state():whisper_mode() then
				managers.hud:hud_list("right_side_list"):item("hostage_count_list"):item("PagerCount"):set_count(self._pager_count)
			end
		end
	end
end

function ObjectInteractionManager:pager_ended(unit)
	if self._active_pagers[unit:key()] then
		self._active_pagers[unit:key()] = nil
		
		if HUDManager.ListOptions.show_pagers and managers.hud and managers.hud:list_initialized() then
			managers.hud:hud_list("left_side_list"):item("pagers"):unregister_item("pager_" .. tostring(unit:key()))
		end
	end
end

function ObjectInteractionManager:pager_answered(unit)
	if self._active_pagers[unit:key()] then
		if HUDManager.ListOptions.show_pagers and managers.hud and managers.hud:list_initialized() then
			local item = managers.hud:hud_list("left_side_list"):item("pagers"):item("pager_" .. tostring(unit:key()))
			if item then
				item:set_answered()
			end
		end
		
		if HUDManager.ListOptions.remove_answered_pager_contour and self._active_pagers[unit:key()] then
			managers.enemy:add_delayed_clbk("contour_remove_" .. tostring(unit:key()), callback(self, self, "_remove_pager_contour", unit), Application:time() + 0.01)
		end
	end
end

function ObjectInteractionManager:_remove_pager_contour(unit)
	if alive(unit) then
		unit:contour():remove(tweak_data.interaction.corpse_alarm_pager.contour_preset)
	end
end

function ObjectInteractionManager:remove_all_pagers()
	if managers.hud and managers.hud:list_initialized() then
		managers.hud:hud_list("right_side_list"):item("hostage_count_list"):unregister_item("PagerCount")
		
		for key, unit in pairs(self._active_pagers) do
			managers.hud:hud_list("left_side_list"):item("pagers"):unregister_item("pager_" .. tostring(key))
		end
	end
	
	self._active_pagers = {}
end

function ObjectInteractionManager:used_pager_count()
	return self._pager_count
end

function ObjectInteractionManager:register_interactive_unit_listener(name, clbk)
	if not self._interactive_unit_listeners[name] then
		self._interactive_unit_listeners[name] = clbk
	end
end

function ObjectInteractionManager:unregister_interactive_unit_listener(name)
	self._interactive_unit_listeners[name] = nil
end
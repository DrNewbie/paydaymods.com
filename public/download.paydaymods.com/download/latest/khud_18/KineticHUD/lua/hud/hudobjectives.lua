--local box_speed = 1000
local ammo_font = tweak_data.hud_players.ammo_font

local is_mission_enabled = KineticHUD:IsMissionEnabled() --this way, require a restart to toggle the mission panel

--local orig_obj_init = HUDObjectives.init
--function HUDObjectives:init(hud,...)
Hooks:PostHook(HUDObjectives,"init","khud_init_objhud",function(self,hud,...)
	local objectives_panel = self._hud_panel:child("objectives_panel")
	local banner_w = 420 --keep it dank, everyone
	local banner_h = 24
	local banner_x = 0
	local banner_y = 12
	
--		local banner_sec_w = 256
	local banner_sec_h = 6
	
	local checkbox_w = 12
	local checkbox_h = checkbox_w
	local checkbox_x = 48
	local checkbox_y = 24
	
	local checkbox_container_w = checkbox_w * 2
	local checkbox_container_h = checkbox_h * 3
	
	local banner_main = objectives_panel:rect({
		name = "banner_main",
		x = banner_x,
		y = banner_y,
		w = banner_w,
		h = banner_h,
		layer = 0,
		color = Color("70939E"):with_alpha(0.5)
	})		
	local banner_sec = objectives_panel:rect({
		name = "banner_sec",
		x = banner_main:x(),
		y = banner_main:y() + banner_main:h(),
		w = banner_w,
--			w = banner_sec_w,
		h = banner_sec_h,
		layer = 1,
		color = Color.white:with_alpha(0.7)
	})

	local flash_panel = objectives_panel:gradient({
		name = "flash_panel",
		layer = 1,
		blend_mode = "add",
		x = banner_x,
		y = banner_y,
		w = banner_w,
		h = banner_h,
		valign = "grow",
		rotation = 0,
		gradient_points = {
			0,
			Color(0,1,1,1),
			0.5,
			Color(0,1,1,1),
			1,
			Color(0,1,1,1)
		}
	})
	
	
	local checkbox_panel = objectives_panel:panel({
		name = "checkbox_panel",
		x = checkbox_x,
		y = banner_sec:bottom() + ((checkbox_container_h - checkbox_h)/2), 
--			y = checkbox_y + banner_sec:y() + banner_sec:h(), 
		w = checkbox_w,
		h = checkbox_h
	})
	local checkbox_check = objectives_panel:panel({
		name = "checkbox_check",
		x = checkbox_panel:x(),
		y = checkbox_panel:y(),
		w = checkbox_panel:w(),
		h = checkbox_panel:h(),
		visible = false
	})

	self._checkbox_check = checkbox_check
	local checkbox_container = objectives_panel:panel({
		name = "checkbox_container",
		layer = 0,
		x = checkbox_panel:x() + (checkbox_panel:w() / 2) - (checkbox_container_w / 2),
		y = banner_sec:bottom(),-- + banner_sec:y(),
--			y = checkbox_panel:y() + (checkbox_panel:h() / 2) - (checkbox_container_h / 2),
		w = checkbox_container_w,
		h = checkbox_container_h
	})
	local container = panel_border(checkbox_container,{
		thickness = 1
	})
	local container_underline = objectives_panel:rect({
		name = "container_underline",
		x = checkbox_panel:x(),
		y = checkbox_container:y() + checkbox_container:h() + 4,
		w = checkbox_panel:w(),
		h = 2
	})
	
	local checkbox = panel_border(checkbox_panel,{
		thickness = 2
	})
	local level_data = managers.job:current_level_data()
	local level_name = level_data and level_data.name_id and managers.localization:text(level_data.name_id)

	local heist_name = objectives_panel:text({
		name = "heist_name",
		vertical = "top",
		align = "left",
		x = checkbox_panel:x() + checkbox_panel:w() + 16, --16 is offset
		y = banner_main:y(),
		text = utf8.to_upper(level_name or "zdann's shovel heist"),
		layer = 2,
		color = Color.white,
		font_size = tweak_data.hud.active_objective_title_font_size,
		font = ammo_font or tweak_data.hud.medium_font_noshadow			
	})
	
	local new_objective_text = objectives_panel:text({
		name = "new_objective_text",
		vertical = "top",
		align = "left",
		x = heist_name:x(),
		y = checkbox_panel:y() - (checkbox_panel:h() / 2),
		text = "Don't die",
		layer = 2,
		color = Color.white,
		font_size = tweak_data.hud.active_objective_title_font_size,
		font = ammo_font or tweak_data.hud.medium_font_noshadow			
	})		
	local new_amount_text = objectives_panel:text({
		name = "new_amount_text",
		visible = false,
		vertical = "top",
		align = "left",
		x = 0,
		y = checkbox_panel:y() - (checkbox_panel:h() / 2),
		text = "0/420",
		layer = 2,
		color = Color.white,
		font_size = tweak_data.hud.active_objective_title_font_size,
		font = ammo_font or tweak_data.hud.medium_font_noshadow			
	})
	self._bg_box:set_visible(false)
--	local enabled = KineticHUD:IsMissionEnabled()
	objectives_panel:child("icon_objectivebox"):set_visible(not is_mission_enabled)
	objectives_panel:child("amount_text"):hide()
--	objectives_panel:child("objective_text"):set_visible(not enabled)
	objectives_panel:child("objective_text"):set_alpha(is_mission_enabled and 0 or 1)
	objectives_panel:set_visible(not is_mission_enabled)
	
	objectives_panel:child("banner_main"):set_visible(is_mission_enabled)
	objectives_panel:child("banner_sec"):set_visible(is_mission_enabled)
	objectives_panel:child("checkbox_panel"):set_visible(is_mission_enabled)
	objectives_panel:child("checkbox_container"):set_visible(is_mission_enabled)
	objectives_panel:child("container_underline"):set_visible(is_mission_enabled)
	objectives_panel:child("heist_name"):set_visible(is_mission_enabled)
	objectives_panel:child("new_objective_text"):set_visible(is_mission_enabled)
	
end)

local orig_obj_activate_objective = HUDObjectives.activate_objective
function HUDObjectives:activate_objective(data,...)
	
	if is_mission_enabled then 
		local objectives_panel = self._hud_panel:child("objectives_panel")
		local objective_text = objectives_panel:child("new_objective_text")
		local amount_text = objectives_panel:child("new_amount_text")
		objective_text:set_text(data.text)
		self._active_objective_id = data.id
		if data.amount then 
			self:update_amount_objective(data)
			amount_text:set_visible(true)
		else
--			amount_text:set_visible(false)
		end
		objectives_panel:stop()
		if objectives_panel:visible() then 
			objectives_panel:animate(callback(self,self,"_animate_activate_objective"))
		else		
			objectives_panel:animate(callback(self,self,"_animate_init_objectives")) --fadein
		end
	else
		return orig_obj_activate_objective(self,data,...)
	end
end

local orig_obj_update_amount_objective = HUDObjectives.update_amount_objective
function HUDObjectives:update_amount_objective(data,...)
	if is_mission_enabled then 
		if data.id == self._active_objective_id then
			local objectives_panel = self._hud_panel:child("objectives_panel")
			local objective_text = objectives_panel:child("new_objective_text")
			local amount_text = objectives_panel:child("new_amount_text")
			local current = data.current_amount or 0
			local amount = data.amount
			local _,_,w,_ = objective_text:text_rect()
			if alive(amount_text) then
--				KineticHUD:c_log("update amount obj",amount_text:visible())
				amount_text:set_visible(true)
				amount_text:set_x(w + objective_text:x() + 4)
				amount_text:set_text(current .. "/" .. amount)
			end
		end
	else
		return orig_obj_update_amount_objective(self,data,...)
	end
end

local orig_obj_remind_objective = HUDObjectives.remind_objective
function HUDObjectives:remind_objective(id,...)
	if not is_mission_enabled then 
		return orig_obj_remind_objective(self,id,...)
	end
end

local orig_obj_complete_objective = HUDObjectives.complete_objective
function HUDObjectives:complete_objective(data,...)
	if is_mission_enabled then 
		if data.id == self._active_objective_id then
			local objectives_panel = self._hud_panel:child("objectives_panel")
			objectives_panel:stop()
			objectives_panel:animate(callback(self, self, "_animate_complete_objective"))
		end
	else
		return orig_obj_complete_objective(self,data,...)
	end
end

local orig_obj__animate_complete_objective = HUDObjectives._animate_complete_objective
function HUDObjectives:_animate_complete_objective(objectives_panel,...)
	local objective_text = objectives_panel:child("new_objective_text")
	local amount_text = objectives_panel:child("new_amount_text")
	local check = self._checkbox_check
	local flash_panel = objectives_panel:child("flash_panel")
	if is_mission_enabled then
--		KineticHUD:c_log("anim complete obj")
		local duration = 1
		local t = duration
		local _t = t
		
		local margin = 3
		local max_thickness = math.ceil(check:w() / 2)
		
		check:set_visible(true)

		while t > 0 do
			local dt = coroutine.yield()
			t = t - dt
--			flash_panel:set_alpha(math.bezier({0,0,1,1},math.max(0,1 - (t/duration))))

			if alive(amount_text) then 
				amount_text:set_alpha(t)
			end	
			
			_t = math.min(math.max(0,duration - t),1)
			
			flash_panel:set_gradient_points({
				0,
				Color.white:with_alpha(0),
				_t,
				Color.white:with_alpha(-(math.pow((2 * _t) - 1,2) - 1)),
--				Color.white:with_alpha((t/duration) * 2),
				1,
				Color.white:with_alpha(0)
			})
			
			objective_text:set_alpha(math.max(objective_text:alpha(),_t)) --0 to 1
			
			panel_border(check,{
				color = Color(0.875,0.875,0.875),
				thickness = _t * max_thickness,
				margin = _t * margin
			})
		end
		flash_panel:set_gradient_points({
			0,
			Color.white:with_alpha(0),
			0.5,
			Color.white:with_alpha(0),
			1,
			Color.white:with_alpha(0)
		})
		
		if alive(amount_text) then 
			amount_text:set_alpha(1)
			amount_text:set_visible(false)
		end
		
--		local function done_cb()
			objectives_panel:child("objective_text"):set_text(utf8.to_upper(""))
--			objectives_panel:set_visible(false)
--		end
	else
		return orig_obj__animate_complete_objective(self,objectives_panel,...)
	end
end

function HUDObjectives:_animate_clear_objective(objectives_panel) --custom anim func; unused
	local check = self._checkbox_check

	local duration = 1
	local t = duration
--	KineticHUD:c_log("anim clear obj")
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		
		check:set_alpha(t)
	end
	if alive(check) then 
		check:set_visible(false)
		check:set_alpha(1)
	end
	
end

local orig_obj__animate_activate_objective = HUDObjectives._animate_activate_objective
function HUDObjectives:_animate_activate_objective(objectives_panel,...)
	local icon_objectivebox = objectives_panel:child("icon_objectivebox")
	if is_mission_enabled then 
--		KineticHUD:c_log("anim activate obj")
		local objective_text = objectives_panel:child("new_objective_text")
		local amount_text = objectives_panel:child("new_amount_text")
		objectives_panel:set_visible(true)
		local check = self._checkbox_check
		local duration = 2
		local t = duration
		
		while t > 0 do 
			local dt = coroutine.yield()
			t = t - dt
			objective_text:set_alpha(math.max(objective_text:alpha()),1 - (t / duration)) --0 to 1
			amount_text:set_alpha(math.max(amount_text:alpha()),1 - (t / duration)) --0 to 1
			check:set_alpha(t / duration) --1 to 0
		end		
	else
		return orig_obj__animate_activate_objective(self,objectives_panel,...)
	end
end

function HUDObjectives:_animate_init_objectives(data,...) --custom anim func
	local objectives_panel = self._hud_panel:child("objectives_panel")
	objectives_panel:set_alpha(0)
	objectives_panel:set_visible(1)
--	KineticHUD:c_log("anim init")
	local duration = 1.5
	local t = duration
	local progress_smooth = 0
	
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		progress_smooth = math.bezier({0,0,1,1},math.max(0,1 - (t/duration)))
		
		objectives_panel:set_alpha(progress_smooth)
	end
	
	objectives_panel:set_alpha(1)
end

local orig_obj__animate_icon_objectivebox = HUDObjectives._animate_icon_objectivebox --should be unused
function HUDObjectives:_animate_icon_objectivebox(icon_objectivebox,...)
	local TOTAL_T = 5
	local t = TOTAL_T

	icon_objectivebox:set_y(0)

	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt

		icon_objectivebox:set_y(math.round((1 + math.sin((TOTAL_T - t) * 450 * 2)) * 12 * t / TOTAL_T))
	end

	icon_objectivebox:set_y(0)
end
--[[
function HUDObjectives:_animate_show_text(objective_text, amount_text) --override; unused
--	KineticHUD:c_log("anim show text")
	local TOTAL_T = 0.5
	local t = TOTAL_T

	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		local alpha = math.round(math.abs(math.sin(t * 360 * 3)))

		objective_text:set_alpha(alpha)

		if alive(amount_text) then
			amount_text:set_alpha(alpha)
		end
	end

	objective_text:set_alpha(1)

	if alive(amount_text) then
		amount_text:set_alpha(1)
	end
end

function HUDObjectives:open_right_done(uses_amount)
	local objectives_panel = self._hud_panel:child("objectives_panel")
	local objective_text = objectives_panel:child("new_objective_text")

	objective_text:set_visible(true)
	objective_text:stop()

	local amount_text = objectives_panel:child("new_amount_text")

	if alive(amount_text) then
		amount_text:set_visible(uses_amount)
	end

	objective_text:animate(callback(self, self, "_animate_show_text"), amount_text)
end
--]]
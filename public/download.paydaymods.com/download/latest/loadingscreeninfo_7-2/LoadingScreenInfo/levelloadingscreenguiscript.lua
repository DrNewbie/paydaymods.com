
if LoadingScreenInfo_LevelLoadingScreenGuiScript_Hooked then
	return
else
	LoadingScreenInfo_LevelLoadingScreenGuiScript_Hooked = true
end

-- Actual (blue) loading screen seen when loading a level. This runs in a separate LoadingEnvironment thread, not the Main thread

if LoadingScreenInfo_ModPath == nil then
	LoadingScreenInfo_ModPath = ModPath
end

dofile(LoadingScreenInfo_ModPath .. "boxguiobject.lua")
dofile(LoadingScreenInfo_ModPath .. "circleguiobject.lua")

-- Standard IEEE rounding to nearest integer (round half away from zero)
local floor = math.floor
local ceil = math.ceil
local function RoundToNearest(real)
	return real >= 0 and floor(real + 0.5) or ceil(real - 0.5)
end

local show_backgrounds = true

local initialized = false

local ring_texture = "guis/textures/pd2/level_ring_small"
--local ring_texture = "guis/textures/pd2/endscreen/exp_ring"
--local ring_texture = "guis/textures/pd2/hud_progress_32px"

local left_arrow = utf8.char(57348)
local right_arrow = utf8.char(57349)

-- _G.arg.load_level_data is indirectly from Setup:_start_loading_screen() (search for load_level_data in the latter function)
local init_actual = LevelLoadingScreenGuiScript.init
function LevelLoadingScreenGuiScript:init(...)
	-- Cache a direct reference to _G.arg.load_level_data.level_tweak_data.load_data
	local load_data = _G.arg.load_level_data.level_tweak_data.load_data
	if load_data == nil then
		log("[LoadingScreenInfo] LevelLoadingScreenGuiScript:init() | Warning: self._level_tweak_data.load_data is nil, nothing to display")
		return init_actual(self, ...)
	end
	if load_data.strings == nil then
		log("[LoadingScreenInfo] LevelLoadingScreenGuiScript:init() | Warning: self._level_tweak_data.load_data.strings is nil, aborting")
		return init_actual(self, ...)
	end

	-- Used by LoadingScreenInfo_CircleBitmapGuiObject:init()
	_G.circle_render_template = load_data.circle_render_template

	-- Trick the game code into thinking that there is no controller attached so it will never create the controller image and
	-- annotation text panels (would be created on background_safepanel, which does not scroll)
	local coords = _G.arg.load_level_data.controller_coords
	_G.arg.load_level_data.controller_coords = false
	-- Ditto for the hints code
	local default_tip = _G.arg.load_level_data.tip
	_G.arg.load_level_data.tip = nil

	init_actual(self, ...)

	if self._back_drop_gui == nil then
		log("[LoadingScreenInfo] LevelLoadingScreenGuiScript:init() | Error: self._back_drop_gui is nil, aborting")
		-- Can't create the default tips since there's nothing to create them on, anyway
		return
	end

	local background_fullpanel = nil
	local background_safepanel = nil

	-- Figure out which backdrop layer corresponds to which panel above by inspecting their child panels
	for __, panel in ipairs(self._back_drop_gui._panel:child("item_background_layer"):children() or {}) do
		if panel:alive() then
			for __, subpanel in ipairs(panel:children() or {}) do
				if subpanel:alive() then
					if background_safepanel == nil and subpanel.type_name == "Bitmap" and subpanel:name() == "indicator" then
						background_safepanel = panel
					elseif background_fullpanel == nil and subpanel.type_name == "Text" and RoundToNearest(subpanel:font_size()) == 80 and RoundToNearest(subpanel:height()) == 80 then
						-- Thanks for not naming your panels, OVK *shakes fist*
						background_fullpanel = panel
					end
				end
			end
		end
	end

	if background_fullpanel == nil then
		log("[LoadingScreenInfo] LevelLoadingScreenGuiScript:init() | Fatal Error: background_fullpanel is nil, aborting")
		if background_safepanel ~= nil and type(default_tip) == "table" then
			-- Well at least it's not all bad, the default hints can still be created on their intended panel
			self._loading_hint = self:_make_loading_hint(background_safepanel, default_tip)
		end
		return
	end
	if background_safepanel == nil then
		log("[LoadingScreenInfo] LevelLoadingScreenGuiScript:init() | Fatal Error: background_safepanel is nil, aborting")
		-- Yeah, yeah, I know - this deviates from the game's behavior since the default tips are normally created on
		-- background_safepanel, but that panel can't be found so I'm using the next best option
		if type(default_tip) == "table" then
			self._loading_hint = self:_make_loading_hint(background_fullpanel, default_tip)
		end
		return
	end

	self.current_page = 1
	self.pages = 2
	self.direction = 1
	self.screen_width = background_fullpanel:w()
	self.sliding_panel = background_fullpanel:panel({
		name = "slidingpanel",
		w = self.screen_width * self.pages,
		h = background_safepanel:h(),
		x = background_fullpanel:x(),
		y = background_safepanel:y(),
		layer = background_safepanel:layer()
	})
	-- Because background_safepanel does not fully extend to all edges of the screen, create a new 'fake' safepanel to make
	-- alignment of UI elements easier (otherwise UI elements will be aligned to the edge of the screen instead, which is
	-- inconsistent with the rest of the UI design)
	local safepanel_1 = self.sliding_panel:panel({
		name = "slidingpanel_safepanel_1",
		w = background_safepanel:w(),
		h = background_safepanel:h(),
		x = background_safepanel:x(),
--		y = background_safepanel:y(),
		layer = background_safepanel:layer()
	})
	safepanel_1:set_world_center_y(background_safepanel:world_center_y())
	if not coords then
		self.pages = 1
	else
		self.current_page = 2
		local safepanel_2 = self.sliding_panel:panel({
			name = "slidingpanel_safepanel_2",
			w = background_safepanel:w(),
			h = background_safepanel:h(),
			x = background_safepanel:x() + self.screen_width * (self.current_page - 1),
	--		y = background_safepanel:y(),
			layer = background_safepanel:layer()
		})
		safepanel_2:set_world_center_y(background_safepanel:world_center_y())

		-- This is misleading because LevelLoadingScreenGuiScript:_make_controller_hint() actually returns a reference to the
		-- parent container (i.e. safepanel_2) instead of the controller hint panel(s)
		self._controller = self:_make_controller_hint(safepanel_2, coords)
	end

	-- Note: Never forget to set this back before returning from the init() function
	self.current_page = 1

	local tips_font_size = self._menu_tweak_data.pd2_small_font_size
	local tips_font = self._menu_tweak_data.pd2_small_font
	local briefing_font_size = self._menu_tweak_data.pd2_small_font_size - 2
	local briefing_font = self._menu_tweak_data.pd2_small_font
	if self._res.y <= 600 then
		tips_font_size = self._menu_tweak_data.pd2_medium_font_size
		tips_font = self._menu_tweak_data.pd2_medium_font
		briefing_font_size = self._menu_tweak_data.pd2_medium_font_size
		briefing_font = self._menu_tweak_data.pd2_medium_font
		if self._res.y <= 500 then
			-- You really need a bigger screen, buddy... Or perhaps a better graphics card. Or both  >.<
			tips_font_size = tips_font_size + 4
			briefing_font_size = briefing_font_size + 4
		end
	end
	local gameinfoheading_font_size = tips_font_size
	local gameinfoheading_font = tips_font
	local gameinfo_font_size = briefing_font_size
	local gameinfo_font = briefing_font

	local tmp = nil
	-- Level title text
	-- self._level_title_text is used by OVK to show the large 'Loading' text, create another one for the actual level title
	-- From HUDMissionBriefing:init()
	local job_text = background_safepanel:text({
		name = "job_text",
		font = self._menu_tweak_data.pd2_large_font,
		font_size = self._menu_tweak_data.pd2_large_font_size,
		color = Color.white,
		align = "left",
		vertical = "center",
		layer = 0
	})

	local separator = false
-- FIXME: This chain of logic is horrendous... Especially considering the number of temporary strings that are implicitly created
	tmp = load_data.strings.contact_name
	if tmp then
		separator = true
	else
		tmp = ""
		separator = false
	end

	if separator then
		tmp = tmp .. ": "
	end

	local add_level_id = true
	local level_id = utf8.to_upper(tostring(self._level_tweak_data.name))
	if load_data.strings.contract_name ~= nil then
		tmp = tmp .. load_data.strings.contract_name
		separator = true
		-- Perform a literal search only, resolves the issue where names with non-alphanumeric characters (e.g. the - character
		-- in Brooklyn 10-10) are misinterpreted as patterns and therefore cannot be found
		if load_data.strings.contract_name:find(level_id, 1, true) ~= nil then
			-- The level_id is already in the contract name, do not append it
			add_level_id = false
			separator = false
		end
	else
		separator = false
	end

	if separator then
		tmp = tmp .. ": "
	end

	tmp = tmp .. (add_level_id and level_id or "")

	local len = 0
	if load_data.strings.pro_job ~= nil then
		len = utf8.len(tmp) + 2
		tmp = tmp .. "  " .. load_data.strings.pro_job
	end
	job_text:set_text(tmp)
	if len > 0 then
		job_text:set_range_color(len, utf8.len(tmp), Color(1, 1, 0.2, 0.2))
	end
	local _, _, w, h = job_text:text_rect()
	job_text:set_size(w, h)

	-- Large level title shadow text
	-- From HUDMissionBriefing:init()
	local big_text = background_fullpanel:text({
		name = "job_big_text",
		align = "left",
		vertical = "top",
		font_size = self._menu_tweak_data.pd2_massive_font_size,
		font = self._menu_tweak_data.pd2_massive_font,
		color = Color(255, 0, 0, 0) / 255,
		alpha = 0.4
	})
	big_text:set_text(tmp)
	_, _, w, h = big_text:text_rect()
	big_text:set_size(w, h)
	big_text:set_world_center_y(job_text:world_center_y())
	big_text:set_world_x(job_text:world_x())
	big_text:move(-13, 9)
	self._back_drop_gui:animate_bg_text(big_text)

	-- Risk text
	-- From HUDMissionBriefing:init()
	local padding_y = 60
	local paygrade_panel = background_safepanel:panel({
		name = "paygrade_panel",
		h = 70,
		w = 210,
		y = padding_y
	})
	local risk_text = background_safepanel:text({
		name = "risk_text",
		text_id = "menu_risk",
		y = padding_y,
		align = "right",
		vertical = "center",
		font = self._menu_tweak_data.pd2_medium_font,
		font_size = self._menu_tweak_data.pd2_medium_font_size,
		color = Color.white,
	})
	risk_text:set_text(utf8.to_upper(risk_text:text()))
	_, _, w, h = risk_text:text_rect()
	risk_text:set_size(w, h)

	-- Risk icons
	-- From HUDMissionBriefing:init()
	-- -2 to ignore easy and normal difficulties (which have no stars)
	local difficulty_stars = (tonumber(load_data.risk) or 1) - 2
	local filled_star_rect = {
		0,
		32,
		32,
		32
	}
	local empty_star_rect = {
		32,
		32,
		32,
		32
	}
	local num_stars = 0
	local x = 0
	local y = -2.5
	local star_size = 18
	local panel_w = 0
	local panel_h = 0
	local risk_color = Color(1, 1, 0.8, 0)
	local risks = {
		"risk_swat",
		"risk_fbi",
		"risk_death_squad",
		"risk_easy_wish",
		"risk_murder_squad",
		"risk_sm_wish"
	}
	for i, name in ipairs(risks) do
		local active = i <= difficulty_stars
		local color = active and risk_color or Color.white
		local alpha = active and 1 or 0.25
		local risk = paygrade_panel:bitmap({
			name = name,
			texture = load_data.icons[name].texture,
			texture_rect = load_data.icons[name].rect,
			x = 0,
			y = 0,
			alpha = alpha,
			color = color
		})
		risk:set_position(x, y)
		x = x + risk:w() + 0
		panel_w = math.max(panel_w, risk:right())
		panel_h = math.max(panel_h, risk:h())
	end
	risk_text:set_color(risk_color)
	paygrade_panel:set_h(panel_h)
	paygrade_panel:set_w(panel_w)
	paygrade_panel:set_right(background_safepanel:w())
	risk_text:set_right(paygrade_panel:left())

	-- Briefing panel
	local briefing_panel = safepanel_1:panel({
		name = "briefing_panel"
	})

	-- Briefing text
	self._briefing_text = briefing_panel:text({
		name = "briefing_text",
		font = briefing_font,
		font_size = briefing_font_size,
		color = Color.white,
		align = "left",
		vertical = "bottom",
		wrap = true,
		word_wrap = true,
		layer = 0
	})
	-- Compatibility with custom campaigns
	self._briefing_text:set_text(tostring(load_data.strings.briefing))
	-- From LevelLoadingScreenGuiScript:setup()
	self._saferect_bottom_y = self._briefing_text:parent():h() - self._gui_tweak_data.upper_saferect_border
	self._briefing_text:set_w(self._briefing_text:parent():w() * (default_tip and 0.425 or 0.5))
	_, _, _, h = self._briefing_text:text_rect()
	self._briefing_text:set_height(h)
	self._briefing_text:set_lefttop(self._gui_tweak_data.border_pad, self._gui_tweak_data.border_pad)

	briefing_panel:set_size(self._briefing_text:width() + self._gui_tweak_data.border_pad * 2, h + self._gui_tweak_data.border_pad * 2)
	briefing_panel:set_rightbottom(briefing_panel:parent():w(), self._saferect_bottom_y)
	LoadingScreenInfo_BoxGuiObject:create_sides(briefing_panel, 1)

	if show_backgrounds then
		briefing_panel:rect({
			name = "briefing_panel_bg",
			color = Color.black:with_alpha(0.3),
			valign = "grow",
			halign = "grow",
			layer = briefing_panel:layer() - 1
		})
	end

	local server_info_panel = nil
	local lobby_attributes = load_data.lobby_attributes
	-- This may be nil when playing offline, or loading the safe house level
	if lobby_attributes ~= nil then
		-- Some games have nil job_plan values, assume 'any' for such cases
		if lobby_attributes.job_plan == nil or tonumber(lobby_attributes.job_plan) == 0 then
			lobby_attributes.job_plan = -1
		end

		-- Game information panel
		server_info_panel = safepanel_1:panel({
			name = "server_info_panel"
		})

		-- Game information heading text
		local server_info_heading_text = server_info_panel:text({
			name = "server_info_heading_text",
			font = gameinfoheading_font,
			font_size = gameinfoheading_font_size,
			color = Color.white,
			align = "left"
		})
		server_info_heading_text:set_text(tostring(load_data.strings.server_info))
		server_info_heading_text:set_lefttop(self._gui_tweak_data.border_pad, self._gui_tweak_data.border_pad)
		server_info_panel:set_top(self._gui_tweak_data.upper_saferect_border + 14 + 15)
		_, _, w, h = server_info_heading_text:text_rect()
		server_info_heading_text:set_size(w, h)

		local spacing = 10
		local title_texts = {}
		local body_texts = {}
		local longest_title = nil
		local longest_title_len = 0
		local longest_body = nil
		local longest_body_len = 0

		-- For the following text panels, I'm intentionally placing all text within a call to tostring() to prevent any potential
		-- nils from crashing the game (and causing lots of problems for users of this mod)

		local params = {
			-- Host name
			{
				name = "servername",
				title = tostring(load_data.strings.host) .. ":",
				body = tostring(lobby_attributes.owner_name or load_data.strings.unknown)
			},
			-- Host reputation level
			{
				check = (lobby_attributes.owner_level ~= nil),
				name = "hostlevel",
				title = tostring(load_data.strings.hostlevel) .. ":",
				body = tostring(lobby_attributes.owner_level)
			},
			-- Players on server, including the local player
			{
				name = "playercount",
				title = tostring(load_data.strings.players) .. ":",
				body = tostring(lobby_attributes.num_players)
			},
			-- Tactic
			{
				name = "jobplan",
				title = tostring(load_data.strings.job_plan.name) .. ":",
				body = tostring(load_data.strings.job_plan[tonumber(lobby_attributes.job_plan)]),
				value = tonumber(lobby_attributes.job_plan),
				icons = {
					[1] = "guis/textures/pd2/cn_playstyle_loud",
					[2] = "guis/textures/pd2/cn_playstyle_stealth"
				}
			},
			-- Reputation limit
			{
				name = "minrep",
				title = tostring(load_data.strings.minrep) .. ":",
				body = tostring(lobby_attributes.min_level)
			},
			-- Kick option
			{
				name = "kickoption",
				title = tostring(load_data.strings.kick_option.name) .. ":",
				body = tostring(load_data.strings.kick_option[tonumber(lobby_attributes.kick_option)]),
				value = tonumber(lobby_attributes.kick_option),
				icons = {
					[0] = "guis/textures/pd2/cn_kick_marker",
					[2] = "guis/textures/pd2/cn_votekick_marker"
				}
			},
			-- Join permission
			{
				name = "permission",
				title = tostring(load_data.strings.permission.name) .. ":",
				body = tostring(load_data.strings.permission[tonumber(lobby_attributes.permission)])
			},
			-- Game state
			{
				check = (load_data.strings.server_state_string ~= nil),
				name = "state",
				title = tostring(load_data.strings.state) .. ":",
				body = tostring(load_data.strings.server_state_string)
			}
		}

		local tmp_title = nil
		local tmp_body = nil
		-- This table associates icon bitmap panels with their corresponding body text panels for alignment
		local body_icons = {}
		local title_align_left = server_info_heading_text:left() + 10
		local title_align_top = server_info_heading_text:bottom() + 10
		for index, data in ipairs(params) do
			if data.check == nil or data.check == true then
				tmp_title = server_info_panel:text({
					name = tostring(data.name) .. "_title",
					text = data.title,
					font = gameinfo_font,
					font_size = gameinfo_font_size,
					color = Color.white:with_alpha(0.7),
					align = "right"
				})
				tmp_title:set_left(title_align_left)
				tmp_title:set_top(title_align_top)
				_, _, w, h = tmp_title:text_rect()
				tmp_title:set_size(w, h)
				title_texts[index] = tmp_title
				if w > longest_title_len then
					longest_title_len = w
					longest_title = tmp_title
				end
				title_align_top = tmp_title:bottom() + 5

				tmp_body = server_info_panel:text({
					name = tostring(data.name) .. "_body",
					text = data.body,
					font = gameinfo_font,
					font_size = gameinfo_font_size,
					color = Color.white,
					align = "left"
				})
				tmp_body:set_left(tmp_title:right() + spacing)
				tmp_body:set_top(tmp_title:top())
				_, _, w, h = tmp_body:text_rect()
				tmp_body:set_size(w, h)
				body_texts[index] = tmp_body
				if w > longest_body_len then
					longest_body_len = w
					longest_body = tmp_body
				end

				if data.icons ~= nil and data.value ~= nil then
					local texture = data.icons[data.value]
					if texture ~= nil then
						table.insert(body_icons, {
							body = tmp_body,
							icon = server_info_panel:bitmap({
								name = tostring(data.name) .. "_icon",
								texture = texture,
								blend_mode = "normal"
							})
						})
					end
				end
			end
		end

		-- Reposition everything based on the longest title and body text panels, aligning everything by the colon separator

		local align_coord = RoundToNearest(longest_title:right())
		for index, panel in ipairs(title_texts) do
			if panel ~= longest_title then
				panel:set_right(align_coord)
				-- Also realign the corresponding text panel
				if body_texts[index] ~= nil then
					body_texts[index]:set_left(align_coord + spacing)
				else
					log("[LoadingScreenInfo] LevelLoadingScreenGuiScript:init() | Warning: " .. panel:name() .. " does not have a corresponding entry in texts, skipping")
				end
			end
		end

		align_coord = RoundToNearest(longest_body:left())
		for index, panel in ipairs(body_texts) do
			panel:set_left(align_coord)
		end

		for index, data in ipairs(body_icons) do
			if data.body ~= nil and data.icon ~= nil then
				data.icon:set_center_y(data.body:center_y())
				data.icon:set_left(data.body:right() + 5)
			end
		end

		server_info_panel:set_size(math.max(longest_body:world_right() - server_info_heading_text:world_left() + self._gui_tweak_data.border_pad * 2, 300), title_texts[#title_texts]:world_bottom() - server_info_heading_text:world_top() + self._gui_tweak_data.border_pad * 2)
		server_info_panel:set_world_left(server_info_heading_text:world_left() - self._gui_tweak_data.border_pad)
		server_info_panel:set_world_top(server_info_heading_text:world_top() - self._gui_tweak_data.border_pad)
		LoadingScreenInfo_BoxGuiObject:create_sides(server_info_panel, 1)

		if show_backgrounds then
			server_info_panel:rect({
				name = "server_info_panel_bg",
				color = Color.black:with_alpha(0.3),
				valign = "grow",
				halign = "grow",
				layer = server_info_panel:layer() - 1
			})
		end
	end		-- lobby_attributes ~= nil

	-- Tips panel
	local tips_panel = safepanel_1:panel({
		name = "tips_panel"
	})

	-- Tips heading and body text
	local offset = 20
	self._tips_head_line = tips_panel:text({
		name = "tips_head_line",
		text_id = "tip_tips",
		font = tips_font,
		font_size = tips_font_size,
		color = Color.white,
		align = "right",
		vertical = "top",
		layer = 0
	})
	-- NOTE: Ensure that text_id always points to a valid string_id, or the game will later crash with a nil text error in
	-- LocalizationManager:_text_format() (core/lib/managers/corelocalizationmanager.lua)
	self._tips_text = tips_panel:text({
		name = "tips_text",
--		text_id = _G.arg.load_level_data.tip_id or "tip_police_free_hostage",
		font = tips_font,
		font_size = tips_font_size,
		color = Color.white,
		align = "left",
		vertical = "top",
		wrap = true,
		word_wrap = true,
		layer = 0
	})
	-- Custom tips must be translated beforehand in Setup:_start_loading_screen() since BLT's localization manager hook will
	-- not be functional at this stage in the loading process (in fact, its Hooks class / table doesn't even exist yet)
	self._tips_text:set_text(tostring(load_data.strings.custom_tip))
	-- From LevelLoadingScreenGuiScript:setup()
	tips_panel:set_top(self._gui_tweak_data.upper_saferect_border + 14 + 15)
	_, _, w, h = self._tips_head_line:text_rect()
	self._tips_head_line:set_size(w, h)
	self._tips_head_line:set_lefttop(self._gui_tweak_data.border_pad, self._gui_tweak_data.border_pad)
	-- Working around wrap messing up certain translation strings (tip_police_free_hostage, tip_melee_attack) and causing them to
	-- appear truncated
	-- UPDATE: Resolved by correcting the translation strings themselves (removed trailing whitespace)
	local tip_width = (self._tips_text:parent():w() - self._tips_head_line:w() - offset) * 0.8
	local tipheightlimit = 0
	if server_info_panel ~= nil then
		-- Reposition the custom tips panel to the right of the server information panel and adjust its size so the two do not
		-- collide
		tips_panel:set_left(server_info_panel:right() + 10)
		tip_width = tip_width - server_info_panel:width() - 20
		tipheightlimit = server_info_panel:height() - self._gui_tweak_data.border_pad * 2
	else
		-- 8 lines of text
		tipheightlimit = 21 * 8
	end

	self._tips_text:set_w(tip_width)
	_, _, w, h = self._tips_text:text_rect()
	local overflow = h > tipheightlimit
	local clampedtipheight = math.clamp(h, 65, tipheightlimit)
	self._tips_text:set_size(math.max(w, tip_width), h)
	self._tips_text:set_top(self._gui_tweak_data.border_pad)
	self._tips_text:set_left(self._tips_head_line:right() + offset)
	if overflow then
		self._tips_text:animate(function(o)
			local dt = 0
			local yield = coroutine.yield
			-- -1 = move upward, 0 = stay, 1 = move downward
			local motioncurrent = 0
			-- This should never be 0, always -1 or 1
			local motionintent = -1
			local holdtime = 4
			local timeremaining = holdtime
			-- Move one line's worth of pixels per second
			local speed = 21
			local difference = h - clampedtipheight
			local distanceremaining = difference
			local latched = false
			while true do
				dt = yield()
				timeremaining = timeremaining - dt
				if timeremaining <= 0 then
					if motioncurrent ~= motionintent then
						motioncurrent = motionintent
					end
					latched = false
				end

				if motioncurrent == 0 then
					-- Just stay put there
				else
					if distanceremaining > 0 then
						local step = speed * dt
						local remaining = distanceremaining - step
						-- Do not move beyond the outer bound
						if remaining < 0 then
							step = step + remaining
						end
						o:move(0, (motioncurrent < 0) and -step or step)
						distanceremaining = distanceremaining - step
					elseif not latched then
						timeremaining = holdtime
						distanceremaining = difference
						motionintent = motionintent * -1
						motioncurrent = 0
						latched = true
					end
				end
			end
		end)
	end

	tips_panel:set_size(self._tips_text:world_right() - self._tips_head_line:world_left() + self._gui_tweak_data.border_pad * 2, clampedtipheight + self._gui_tweak_data.border_pad * 2)
	LoadingScreenInfo_BoxGuiObject:create_sides(tips_panel, 1)

	if show_backgrounds then
		tips_panel:rect({
			name = "tips_panel_bg",
			color = Color.black:with_alpha(0.3),
			valign = "grow",
			halign = "grow",
			layer = tips_panel:layer() - 1
		})
	end

	-- Game's default tips panel (introduced in U140)
	if default_tip then
		local loading_hint_panel = self:_make_loading_hint(safepanel_1, default_tip)
		if loading_hint_panel ~= nil and loading_hint_panel:alive() then
			-- The following code moves the hint title and hint panel upward relative to the bitmap on the left. This is
			-- preferred over moving the bitmap downward since the latter would cause certain images to be clipped at the bottom
			-- The chosen approach ensures adequate 'buffer' space above and below the panel so images will never be clipped (add
			-- a valign = "grow", halign = "grow" colored rect panel to loading_hint_panel to see what I mean)

			-- I've forgotten how this number came about, so I'm just going to treat it as a magic number obtained through
			-- experimentation
			local loading_hint_yoffset = 20
			loading_hint_panel:set_name("default_loading_hint_panel")
			loading_hint_panel:set_leftbottom(self._gui_tweak_data.border_pad, self._saferect_bottom_y + loading_hint_yoffset)
			local hint_title = nil
			local hint_box_panel = nil
			for __, panel in ipairs(loading_hint_panel:children() or {}) do
				if panel:alive() then
					if hint_title == nil and panel.type_name == "Text" and panel:text() == default_tip.title then
						hint_title = panel
					elseif hint_box_panel == nil and panel.type_name == "Panel" then
						-- Thanks, once again, for not naming your panels, OVK. Is it really that hard? *shakes fist*
						hint_box_panel = panel
						break
					end
				end
			end
			if hint_title ~= nil and hint_box_panel ~= nil then
				-- Pretend that the hint panel is shorter than it actually is. In effect, this causes the tip title and text to
				-- be moved upward relative to the bitmap on the left
				local compensatedheight = loading_hint_panel:height() - loading_hint_yoffset
				local hint_yoffset = compensatedheight - hint_box_panel:bottom()
				hint_box_panel:set_bottom(compensatedheight)
				hint_title:set_bottom(hint_title:bottom() + hint_yoffset)
			end
			self._loading_hint = loading_hint_panel

			if show_backgrounds and hint_box_panel ~= nil then
				hint_box_panel:rect({
					name = "default_loading_hint_panel_bg",
					color = Color.black:with_alpha(0.3),
					valign = "grow",
					halign = "grow",
					layer = hint_box_panel:layer() - 1
				})
			end
		end
	end

	-- Add a black fullscreen overlay that makes the loading screen appear to fade in
	background_fullpanel:rect({
		name = "fadein",
		color = Color.black:with_alpha(1),
		layer = 99999,
		valign = "grow",
		halign = "grow"
	}):animate(function(o)
		over(0.5, function(p)
			o:set_alpha(math.lerp(1, 0, p))
		end)
	end)

	if self.pages > 1 then
		-- Page timer ring
		local circle_radius = 32
		local sides = 64
		self.timer_ring = LoadingScreenInfo_CircleBitmapGuiObject:new(background_fullpanel, {
			image = ring_texture,
			radius = circle_radius,
			sides = sides,
			current = sides,
			total = sides,
			blend_mode = "normal",
			color = Color.white,
			layer = 99995,
			use_bg = true,
			bg_color = Color.black:with_alpha(0.4)
		})
		if not self.timer_ring.failed then
			self.timer_ring:set_position(background_fullpanel:w() - circle_radius * 3, background_fullpanel:h() * 0.5 - circle_radius)
			self.timer_data = {total = 1, current = 0}
		else
			self.timer_ring = nil
		end

		if self.timer_ring ~= nil then
			self.timer_ring_arrow = background_fullpanel:text({
				name = "timer_ring_arrow",
				text = right_arrow,
				align = "right",
				vertical = "center",
				font_size = self._menu_tweak_data.pd2_small_font_size,
				font = self._menu_tweak_data.pd2_small_font,
				color = Color(1, 1, 1, 1),
				layer = self.timer_ring:layer()
			})
			_, _, w, h = self.timer_ring_arrow:text_rect()
			self.timer_ring_arrow:set_size(w, h)
			self.timer_ring_arrow:set_center(self.timer_ring._circle:center())
		end
	end

	initialized = true
end

local framerate = 30
local count = 0
-- The loading screen caps framerate to 30 fps (so 30 * 1 means check once every second)
local interval = framerate * 1

-- Determines the duration in seconds that a page remains displayed before transitioning to the next one
local page_hold = 10
local page_counter = 0
local page_counter_increment = 1
local page_delay = framerate * page_hold

local bezier_setting = {
	0,
	0,
	1,
	1
}

local update_actual = LevelLoadingScreenGuiScript.update
function LevelLoadingScreenGuiScript:update(progress, t, dt, ...)
	if not initialized then
		return update_actual(self, progress, t, dt, ...)
	end

	update_actual(self, progress, t, dt, ...)

	if self.pages > 1 then
		if not self.transitioning then
			page_counter_increment = 1
		end

		if self.timer_data ~= nil then
			page_counter = page_counter + page_counter_increment
			self.timer_data.current = page_counter / page_delay
			if page_counter >= page_delay then
				page_counter = 0
				if self.screen_width ~= nil and self.sliding_panel ~= nil and not self.transitioning then
					local target_page = self.current_page + self.direction
					if target_page > self.pages then
						target_page = self.pages - 1
						self.direction = -1
					end
					if target_page < 1 then
						target_page = 2
						self.direction = 1
					end
					local beginpos = self.screen_width * (self.current_page - 1) * -1
					local endpos = self.screen_width * (target_page - 1) * -1

					self.sliding_panel:animate(callback(self, self, "clbk_animate_sliding_panel"), beginpos, endpos)
					self.current_page = target_page
				end
			end
		end

		if self.timer_ring ~= nil then
			self.timer_ring:set_current(self.timer_data.current, self.timer_data.total)
		end
	end
end

function LevelLoadingScreenGuiScript:clbk_animate_sliding_panel(sliding_panel, beginpos, endpos)
	self.transitioning = true
	page_counter_increment = 0

	if self.timer_ring ~= nil then
		-- From HUDInteraction:hide_interaction_bar()
		local bitmap = self.timer_ring._panel:bitmap({
			texture = ring_texture,
			blend_mode = "normal",
			align = "center",
			valign = "center",
			layer = self.timer_ring:layer()
		})
		bitmap:set_size(self.timer_ring:size())
		bitmap:set_position(self.timer_ring:position())
		local circle = LoadingScreenInfo_CircleBitmapGuiObject:new(self.timer_ring._panel, {
			image = ring_texture,
			radius = 32,
			sides = 64,
			current = 64,
			total = 64,
			color = Color.white,
			blend_mode = "normal",
			layer = self.timer_ring:layer() + 1
		})
		circle:set_position(self.timer_ring:position())
		bitmap:animate(callback(self, self, "clbk_animate_ring_complete"), circle)

		self.timer_ring._bg_circle:set_alpha(0)
		self.timer_ring._bg_circle:stop()
		self.timer_ring._bg_circle:animate(function(o)
			over(0.65, function(progress)
				o:set_alpha(math.lerp(0, 1, progress))
			end)
		end)

		self.timer_data.current = 0
	end

	over(0.65, function(progress)
		sliding_panel:set_x(math.lerp(beginpos, endpos, math.bezier(bezier_setting, progress)))
	end)

	if self.timer_ring_arrow ~= nil then
		if self.direction == 1 then
			self.timer_ring_arrow:set_text(left_arrow)
		elseif self.direction == -1 then
			self.timer_ring_arrow:set_text(right_arrow)
		end
	end

	self.transitioning = false
	page_counter_increment = 1
end

-- From HUDInteraction:_animate_interaction_complete() (U94.1)
function LevelLoadingScreenGuiScript:clbk_animate_ring_complete(bitmap, circle)
	local TOTAL_T = 0.6
	local t = TOTAL_T
	local mul = 1
	local c_x, c_y = bitmap:center()
	local size = bitmap:w()
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		mul = mul + dt * 0.75
		bitmap:set_size(size * mul, size * mul)
		bitmap:set_center(c_x, c_y)
		bitmap:set_alpha(math.max(t / TOTAL_T, 0))
		circle._circle:set_size(size * mul, size * mul)
		circle._circle:set_center(c_x, c_y)
		circle:set_current(1 - t / TOTAL_T)
		circle:set_alpha(math.max(t / TOTAL_T, 0))
	end
	bitmap:parent():remove(bitmap)
	circle:remove()
end

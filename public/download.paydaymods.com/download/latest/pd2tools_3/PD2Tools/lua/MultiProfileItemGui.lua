dofile( ModPath .. "Base.lua" )

local _pd2tools_mpigi = MultiProfileItemGui.init
function MultiProfileItemGui:init( ... )
	_pd2tools_mpigi( self, ... )
    if managers.menu:is_pc_controller() then
		self._panel:set_w( self._panel:w() + self._profile_panel:h() )
		self._pd2tools_panel = self._pd2tools_panel or self._panel:panel( { w = self._profile_panel:h(), h = self._profile_panel:h() } )
		self._pd2tools_panel:set_left( self._quick_select_panel:right() )
		self._pd2tools_panel:set_top( self._quick_select_panel:top() )
        self._pd2tools_panel_icon = self._pd2tools_panel_icon or self._pd2tools_panel:bitmap( { texture = "guis/textures/pd2/pd2_waypoints", name = "pd2tools", size = 32, rotation = 0, texture_rect = { 192, 64, 32, 32 }, color = tweak_data.screen_colors.button_stage_3, y = 1 } )
		self._pd2tools_panel:rect( { alpha = 0.4, layer = -100, color = Color.black } )
		BoxGuiObject:new( self._pd2tools_panel:panel(), { sides = { 0, 1, 4, 4 } } )
    end
end

local _pd2tools_mpigmm = MultiProfileItemGui.mouse_moved
function MultiProfileItemGui:mouse_moved( x, y )
	local used, pointer = _pd2tools_mpigmm( self, x, y )
    if alive( self._pd2tools_panel ) then
		if self._pd2tools_panel:inside( x, y ) then
            self._pd2tools_panel_icon:set_color( tweak_data.screen_colors.button_stage_2 )
            self._arrow_selection = "pd2tools"
			pointer = "link"
			used = true
        else
            self._pd2tools_panel_icon:set_color( tweak_data.screen_colors.button_stage_3 )
			if self._arrow_selection == "pd2tools" then
				self._arrow_selection = nil
			end
        end
    end
    return used, pointer
end

local _pd2tools_mpigmp = MultiProfileItemGui.mouse_pressed
function MultiProfileItemGui:mouse_pressed( button, x, y )
	if button == Idstring( "0" ) then
		if self:arrow_selection() == "pd2tools" then
			PD2Tools:browse()
			managers.menu_component:post_event( "menu_enter" )
        else
            _pd2tools_mpigmp( self, button, x, y )
        end
	end
end

Hooks:Add('LocalizationManagerPostInit', 'LocalizationManagerPostInit_PD2Tools', function( loc )
	for _, filename in pairs( file.GetFiles( PD2Tools._path .. 'loc/' ) ) do
		local str = filename:match( '^(.+).txt$' )
		if str and Idstring( str ) and Idstring( str ):key() == SystemInfo:language():key() then
			loc:load_localization_file( PD2Tools._path .. 'loc/' .. filename )
			break
		end
    end
	loc:load_localization_file( PD2Tools._path .. 'loc/english.txt', false )
end)
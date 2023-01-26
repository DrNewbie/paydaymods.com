function MeleeOverhaul:ShowMessageOfTheDay()

	if not managers.menu_component then
		return
	end
	
	self._panel = managers.menu_component._ws:panel():panel()
	
	self._motd_t = self._panel:text({
		name 		= "motd_t",
		text 		= managers.localization:text( "more_options_motd" ),
		blend_mode 	= "add",
		w 			= self._panel:w() * 0.35,
		h 			= self._panel:h(),
		font 		= "fonts/font_medium_shadow_mf",
		font_size 	= 30,
		color 		= Color.white,
		vertical 	= "top",
		align 		= "center",
		wrap 		= true,
		word_wrap 	= true,
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._motd_d = self._panel:text({
		name 		= "motd_d",
		text 		= managers.localization:text( "more_options_motd_unavailable" ),
		blend_mode 	= "add",
		w 			= self._panel:w() * 0.35 - 10,
		h 			= self._panel:h(),
		font 		= "fonts/font_medium_shadow_mf",
		font_size 	= 22,
		color 		= Color.white,
		vertical 	= "top",
		align 		= "left",
		wrap 		= true,
		word_wrap 	= true,
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._motd_bg = self._panel:bitmap({
		name 			= "motd_bg",
		texture 		= "guis/textures/pd2/hud_tabs",
		texture_rect 	= {
							84,
							0,
							44,
							32
						},
		visible 		= true,
		layer 			= tweak_data.gui.MOUSE_LAYER - 51,
		color 			= Color.white / 2,
		w 				= self._panel:w() * 0.35,
		h 				= self._panel:h()
	})
	
	self._motd_bg2 = self._panel:bitmap({
		name 			= "motd_bg2",
		texture 		= "guis/textures/pd2/hud_tabs",
		texture_rect 	= {
							84,
							0,
							44,
							32
						},
		visible 		= true,
		layer 			= tweak_data.gui.MOUSE_LAYER - 51,
		color 			= Color.white / 2,
		w 				= self._panel:w() * 0.35,
		h 				= self._panel:h()
	})
	
	if self.MOTD then
		self._motd_d:set_text( self.MOTD )
	end
	
	local _ , _ , _ , h1 = self._motd_t:text_rect()
	local _ , _ , _ , h2 = self._motd_d:text_rect()
	local divider = 7
	local tab = 0.35
	
	self._motd_t:set_h( h1 )
	self._motd_t:set_right( self._panel:right() )
	self._motd_t:set_top( self._panel:h() * tab )
	self._motd_d:set_h( h2 )
	self._motd_d:set_right( self._panel:right() )
	self._motd_d:set_top( self._motd_t:bottom() + divider )
	
	self._motd_bg:set_h( h1 + h2 + divider + 10 )
	self._motd_bg:set_right( self._panel:right() )
	self._motd_bg:set_top( self._panel:h() * tab )
	self._motd_bg2:set_h( h1 )
	self._motd_bg2:set_right( self._panel:right() )
	self._motd_bg2:set_top( self._panel:h() * tab )

end

function MeleeOverhaul:DestroyMessageOfTheDay()

	if alive( self._panel ) then

		self._panel:remove( self._motd_t )
		self._panel:remove( self._motd_d )
		self._panel:remove( self._motd_bg )
		self._panel:remove( self._motd_bg2 )
		self._panel:remove( self._panel )

		self._motd_t = nil
		self._motd_d = nil
		self._motd_bg = nil
		self._motd_bg2 = nil
		self._panel = nil

	end

end

function MeleeOverhaul:ShowStatistics()

	if not managers.menu_component then
		return
	end
	
	self._panel = managers.menu_component._ws:panel():panel()
	
	self._stat1_t = self._panel:text({
		name 		= "stat1_t",
		text 		= managers.localization:text( "more_options_stats_most_used" ),
		blend_mode 	= "add",
		w 			= self._panel:w() * 0.35,
		h 			= self._panel:h(),
		font 		= "fonts/font_medium_shadow_mf",
		font_size 	= 30,
		color 		= Color.white,
		vertical 	= "top",
		align 		= "center",
		wrap 		= true,
		word_wrap 	= true,
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._stat1_d1 = self._panel:text({
		name 		= "stat1_d1",
		text 		= managers.localization:text( MeleeOverhaul.Stats.used.type and tweak_data.blackmarket.melee_weapons[ MeleeOverhaul.Stats.used.type ].name_id or "more_options_stats_unavailable" ),
		blend_mode 	= "add",
		w 			= self._panel:w() * 0.35,
		h 			= self._panel:h(),
		font 		= "fonts/font_medium_shadow_mf",
		font_size 	= 28,
		color 		= Color.white,
		alpha 		= 0.8,
		vertical 	= "top",
		align 		= "left",
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._stat1_d2 = self._panel:text({
		name 		= "stat1_d2",
		text 		= ( MeleeOverhaul.Stats.used.value and tostring( MeleeOverhaul.Stats.used.value ) or "0" ) .. " " .. managers.localization:text( "more_options_stats_times_used" ),
		blend_mode 	= "add",
		w 			= self._panel:w() * 0.35,
		h 			= self._panel:h(),
		font 		= "fonts/font_medium_shadow_mf",
		alpha 		= 0.8,
		font_size 	= 22,
		color 		= Color.white,
		vertical 	= "top",
		align 		= "right",
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._stat1_g = self._panel:bitmap({
		name 		= "stat1_g",
		texture 	= MeleeOverhaul.Stats.used.gui,
		layer 		= tweak_data.gui.MOUSE_LAYER - 50,
		blend_mode 	= "normal",
		w 			= 192,
		h 			= 96
	})
	
	self._stat1_bg = self._panel:bitmap({
		name 			= "stat1_bg",
		texture 		= "guis/textures/pd2/hud_tabs",
		texture_rect 	= {
							84,
							0,
							44,
							32
						},
		visible 		= true,
		layer 			= tweak_data.gui.MOUSE_LAYER - 51,
		color 			= Color.white / 2,
		w 				= self._panel:w() * 0.35,
		h 				= self._panel:h()
	})
	
	self._stat1_bg2 = self._panel:bitmap({
		name 			= "stat1_bg2",
		texture 		= "guis/textures/pd2/hud_tabs",
		texture_rect 	= {
							84,
							0,
							44,
							32
						},
		visible 		= true,
		layer 			= tweak_data.gui.MOUSE_LAYER - 51,
		color 			= Color.white / 2,
		w 				= self._panel:w() * 0.35,
		h 				= self._panel:h()
	})
	
	self._stat2_t = self._panel:text({
		name 		= "stat2_t",
		text 		= managers.localization:text( "more_options_stats_most_killed" ),
		blend_mode 	= "add",
		w 			= self._panel:w() * 0.35,
		h 			= self._panel:h(),
		font 		= "fonts/font_medium_shadow_mf",
		font_size 	= 30,
		color 		= Color.white,
		vertical 	= "top",
		align 		= "center",
		wrap 		= true,
		word_wrap 	= true,
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._stat2_d1 = self._panel:text({
		name 		= "stat2_d1",
		text 		= managers.localization:text( MeleeOverhaul.Stats.killed.type and tweak_data.blackmarket.melee_weapons[ MeleeOverhaul.Stats.killed.type ].name_id or "more_options_stats_unavailable" ),
		blend_mode 	= "add",
		w 			= self._panel:w() * 0.35,
		h 			= self._panel:h(),
		font 		= "fonts/font_medium_shadow_mf",
		font_size 	= 28,
		color 		= Color.white,
		alpha 		= 0.8,
		vertical 	= "top",
		align 		= "left",
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._stat2_d2 = self._panel:text({
		name 		= "stat2_d2",
		text 		= ( MeleeOverhaul.Stats.killed.value and tostring( MeleeOverhaul.Stats.killed.value ) or "0" ) .. " " .. managers.localization:text( "more_options_stats_killed" ),
		blend_mode 	= "add",
		w 			= self._panel:w() * 0.35,
		h 			= self._panel:h(),
		font 		= "fonts/font_medium_shadow_mf",
		font_size 	= 22,
		color 		= Color.white,
		alpha 		= 0.8,
		vertical 	= "top",
		align 		= "right",
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._stat2_g = self._panel:bitmap({
		name 		= "stat2_g",
		texture 	= MeleeOverhaul.Stats.killed.gui,
		layer 		= tweak_data.gui.MOUSE_LAYER - 50,
		blend_mode 	= "normal",
		w 			= 192,
		h 			= 96
	})
	
	self._stat2_bg = self._panel:bitmap({
		name 			= "stat2_bg",
		texture 		= "guis/textures/pd2/hud_tabs",
		texture_rect 	= {
							84,
							0,
							44,
							32
						},
		visible 		= true,
		layer 			= tweak_data.gui.MOUSE_LAYER - 51,
		color 			= Color.white / 2,
		w 				= self._panel:w() * 0.35,
		h 				= self._panel:h()
	})
	
	self._stat2_bg2 = self._panel:bitmap({
		name 			= "stat2_bg2",
		texture 		= "guis/textures/pd2/hud_tabs",
		texture_rect 	= {
							84,
							0,
							44,
							32
						},
		visible 		= true,
		layer 			= tweak_data.gui.MOUSE_LAYER - 51,
		color 			= Color.white / 2,
		w 				= self._panel:w() * 0.35,
		h 				= self._panel:h()
	})
	
	local _ , _ , _ , h1 = self._stat1_t:text_rect()
	local _ , _ , _ , h1d1 = self._stat1_d1:text_rect()
	local _ , _ , _ , h1d2 = self._stat1_d2:text_rect()
	local _ , _ , _ , h2 = self._stat2_t:text_rect()
	local _ , _ , _ , h2d1 = self._stat2_d1:text_rect()
	local _ , _ , _ , h2d2 = self._stat2_d2:text_rect()
	local tab = 0.01
	
	self._stat1_t:set_h( h1 )
	self._stat1_t:set_right( self._panel:right() )
	self._stat1_t:set_top( self._panel:h() * tab )
	self._stat1_d1:set_h( h1d1 )
	self._stat1_d2:set_h( h1d2 )
	
	self._stat1_bg:set_h( h1 + 128 )
	self._stat1_bg:set_right( self._panel:right() )
	self._stat1_bg:set_top( self._panel:h() * tab )
	self._stat1_bg2:set_h( h1 )
	self._stat1_bg2:set_right( self._panel:right() )
	self._stat1_bg2:set_top( self._panel:h() * tab )
	
	self._stat1_g:set_center( self._stat1_bg:center_x() , self._stat1_bg:center_y() * 1.075 )
	
	self._stat1_d1:set_leftbottom( self._stat1_bg:left() + 4 , self._stat1_bg:bottom() - 1 )
	self._stat1_d2:set_rightbottom( self._stat1_bg:right() - 4 , self._stat1_bg:bottom() - 1 )
	
	self._stat2_t:set_h( h2 )
	self._stat2_t:set_right( self._panel:right() )
	self._stat2_t:set_top( self._stat1_bg:bottom() + 4 )
	self._stat2_d1:set_h( h2d1 )
	self._stat2_d2:set_h( h2d2 )
	
	self._stat2_bg:set_h( h2 + 128 )
	self._stat2_bg:set_right( self._panel:right() )
	self._stat2_bg:set_top( self._stat1_bg:bottom() + 4 )
	self._stat2_bg2:set_h( h2 )
	self._stat2_bg2:set_right( self._panel:right() )
	self._stat2_bg2:set_top( self._stat1_bg:bottom() + 4 )
	
	self._stat2_g:set_center( self._stat2_bg:center_x() , self._stat2_bg:center_y() * 1.025 )
	
	self._stat2_d1:set_leftbottom( self._stat2_bg:left() + 4 , self._stat2_bg:bottom() - 1 )
	self._stat2_d2:set_rightbottom( self._stat2_bg:right() - 4 , self._stat2_bg:bottom() - 1 )

end

function MeleeOverhaul:DestroyStatistics()

	if alive( self._panel ) then

		self._panel:remove( self._stat1_t )
		self._panel:remove( self._stat1_bg )
		self._panel:remove( self._stat1_bg2 )
		self._panel:remove( self._stat1_g )
		self._panel:remove( self._stat1_d1 )
		self._panel:remove( self._stat1_d2 )
		self._panel:remove( self._stat2_t )
		self._panel:remove( self._stat2_bg )
		self._panel:remove( self._stat2_bg2 )
		self._panel:remove( self._stat2_g )
		self._panel:remove( self._stat2_d1 )
		self._panel:remove( self._stat2_d2 )
		self._panel:remove( self._panel )

		self._stat1_t = nil
		self._stat1_bg = nil
		self._stat1_bg2 = nil
		self._stat1_g = nil
		self._stat1_d1 = nil
		self._stat1_d2 = nil
		self._stat2_t = nil
		self._stat2_bg = nil
		self._stat2_bg2 = nil
		self._stat2_g = nil
		self._stat2_d1 = nil
		self._stat2_d2 = nil
		self._panel = nil

	end

end

MeleeOverhaul.DynamicResources = {
	{ "effect" , "effects/payday2/particles/character/flyes_plague" },
	{ "effect" , "effects/payday2/particles/character/overkillpack/chains_eyes" },
	{ "effect" , "effects/payday2/particles/character/overkillpack/hoxton_eyes" }
}

MeleeOverhaul.MenuOptions = MeleeOverhaul.MenuOptions or {}
MeleeOverhaul.MenuOptions.Menu = {

	[ "MeleeOverhaulMenuMainOptions" ] = {
		"more_options_main_options_menu_title",
		"more_options_main_options_menu_desc",
		1
	},
	
	[ "MeleeOverhaulMenuGoreOptions" ] = {
		"more_options_gore_options_menu_title",
		"more_options_gore_options_menu_desc"
	},
	
	[ "MeleeOverhaulMenuCalloutOptions" ] = {
		"more_options_callout_options_menu_title",
		"more_options_callout_options_menu_desc"
	},
	
	[ "MeleeOverhaulMenuEffectsOptions" ] = {
		"more_options_effects_options_menu_title",
		"more_options_effects_options_menu_desc"
	},
	
	[ "MeleeOverhaulMenuMiscellaneousOptions" ] = {
		"more_options_miscellaneous_options_menu_title",
		"more_options_miscellaneous_options_menu_desc"
	},
	
	[ "MeleeOverhaulMenuStatistics" ] = {
		"more_options_statistics_menu_title",
		"more_options_statistics_menu_desc",
		3,
		{ focus_changed_callback = "MeleeOverhaulMenuStatisticsFocus" }
	}

}
MeleeOverhaul.MenuOptions.Toggle = {

	[ "MeleeHold" ] = {
		"MeleeOverhaulMenuMainOptions",
		"more_options_toggle_melee_hold_title",
		"more_options_toggle_melee_hold_desc",
		true
	},
	
	[ "MeleeHoldTime" ] = {
		"MeleeOverhaulMenuMainOptions",
		"more_options_toggle_melee_hold_timer_title",
		"more_options_toggle_melee_hold_timer_desc",
		false
	},
	
	[ "TaseEffect" ] = {
		"MeleeOverhaulMenuMiscellaneousOptions",
		"more_options_toggle_tase_visual_title",
		"more_options_toggle_tase_visual_desc",
		false
	},
	
	[ "MessageOfTheDay" ] = {
		"MeleeOverhaulMenuMiscellaneousOptions",
		"more_options_toggle_motd_title",
		"more_options_toggle_motd_desc",
		true
	},
	
	[ "Decapitation" ] = {
		"MeleeOverhaulMenuGoreOptions",
		"more_options_toggle_decapitation_title",
		"more_options_toggle_decapitation_desc",
		false
	},
	
	[ "TrueDecapitation" ] = {
		"MeleeOverhaulMenuGoreOptions",
		"more_options_toggle_true_decapitation_title",
		"more_options_toggle_true_decapitation_desc",
		false
	},
	
	[ "RealisticGore" ] = {
		"MeleeOverhaulMenuGoreOptions",
		"more_options_toggle_realistic_gore_title",
		"more_options_toggle_realistic_gore_desc",
		false
	},
	
	[ "BluntForceTrauma" ] = {
		"MeleeOverhaulMenuGoreOptions",
		"more_options_toggle_blunt_force_trauma_title",
		"more_options_toggle_blunt_force_trauma_desc",
		false
	},
	
	[ "KillingCallout" ] = {
		"MeleeOverhaulMenuCalloutOptions",
		"more_options_toggle_killing_callout_title",
		"more_options_toggle_killing_callout_desc",
		false
	},
	
	[ "ChargingCallout" ] = {
		"MeleeOverhaulMenuCalloutOptions",
		"more_options_toggle_charging_callout_title",
		"more_options_toggle_charging_callout_desc",
		false
	}

}
MeleeOverhaul.MenuOptions.Slider = {

	[ "MeleeHoldTimer" ] = {
		"MeleeOverhaulMenuMainOptions",
		"more_options_slider_melee_hold_time_title",
		"more_options_slider_melee_hold_time_desc",
		0,
		5,
		0.5,
		1
	},
	
	[ "BluntForceMultiplier" ] = {
		"MeleeOverhaulMenuGoreOptions",
		"more_options_slider_blunt_force_multiplier_title",
		"more_options_slider_blunt_force_multiplier_desc",
		1,
		10,
		0.5,
		1
	},
	
	[ "ShakeIntensity" ] = {
		"MeleeOverhaulMenuMiscellaneousOptions",
		"more_options_slider_shake_intensity_title",
		"more_options_slider_shake_intensity_desc",
		0,
		1,
		0.25,
		1
	}

}
MeleeOverhaul.MenuOptions.MultipleChoice = {

	[ "HandEffect" ] = {
		"MeleeOverhaulMenuEffectsOptions",
		"more_options_choice_hand_effect_title",
		"more_options_choice_hand_effect_desc",
		{
			{ "more_options_choice_hand_effect_a" },
			{ "more_options_choice_hand_effect_b" , "effects/particles/fire/small_light_fire" },
			{ "more_options_choice_hand_effect_c" , "effects/payday2/particles/character/taser_hittarget" },
			{ "more_options_choice_hand_effect_d" , "effects/payday2/particles/character/taser_stop" },
			{ "more_options_choice_hand_effect_e" , "effects/payday2/particles/character/taser_thread" },
			{ "more_options_choice_hand_effect_f" , "effects/payday2/particles/weapons/saw/sawing" },
			{ "more_options_choice_hand_effect_g" , "effects/payday2/environment/drill" },
			{ "more_options_choice_hand_effect_h" , "effects/payday2/environment/drill_jammed" },
			{ "more_options_choice_hand_effect_i" , "effects/payday2/particles/character/flyes_plague" },
			{ "more_options_choice_hand_effect_j" , "effects/payday2/particles/character/overkillpack/hoxton_eyes" },
			{ "more_options_choice_hand_effect_k" , "effects/payday2/particles/character/overkillpack/chains_eyes" }
		},
		1
	},
	
	[ "ImpactEffect" ] = {
		"MeleeOverhaulMenuEffectsOptions",
		"more_options_choice_impact_effect_title",
		"more_options_choice_impact_effect_desc",
		{
			{ "more_options_choice_impact_effect_a" },
			{ "more_options_choice_impact_effect_b" , "effects/payday2/particles/impacts/blood/blood_impact_a" },
			{ "more_options_choice_impact_effect_c" , "effects/payday2/particles/impacts/shotgun_explosive_round" },
			{ "more_options_choice_impact_effect_d" , "effects/particles/dest/security_camera_dest" }
		},
		1
	},
	
	[ "SpurtEffect" ] = {
		"MeleeOverhaulMenuGoreOptions",
		"more_options_choice_spurt_effect_title",
		"more_options_choice_spurt_effect_desc",
		{
			{ "more_options_choice_spurt_effect_a" },
			{ "more_options_choice_spurt_effect_b" , "effects/payday2/particles/impacts/blood/blood_tendrils" , 1 },
			{ "more_options_choice_spurt_effect_c" , "effects/particles/bullet_hit/flesh/bullet_impact_flesh_04" , 2 }
		},
		1
	}

}

MeleeOverhaul.BluntWeapons = {
	"weapon",
	"fists",
	"brass_knuckles",
	"moneybundle",
	"barbedwire",
	"boxing_gloves",
	"whiskey",
	"alien_maul",
	"shovel",
	"baton",
	"dingdong",
	"baseballbat",
	"briefcase",
	"model24",
	"shillelagh",
	"hammer",
	"spatula",
	"tenderizer",
	"branding_iron",
	"microphone",
	"oldbaton",
	"detector",
	"micstand",
	"hockey",
	"slot_lever",
	"croupier_rake",
	"taser",
	"fight",
	"buck",
	"morning",
	"cutters",
	"selfie",
	"stick",
	"zeus",
	"road"
}

MeleeOverhaul.SmallBladedWeapons = {
	"kabartanto",
	"toothbrush",
	"chef",
	"kabar",
	"rambo",
	"kampfmesser",
	"gerber",
	"becker",
	"x46",
	"bayonet",
	"bullseye",
	"cleaver",
	"fairbair",
	"meat_cleaver",
	"fork",
	"poker",
	"scalper",
	"bowie",
	"switchblade",
	"tiger",
	"cqc",
	"twins",
	"pugio",
	"boxcutter",
	"shawn",
	"scoutknife",
	"nin",
	"ballistic",
	"wing"
}
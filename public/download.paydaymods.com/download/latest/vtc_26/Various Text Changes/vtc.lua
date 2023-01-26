Hooks:Add("LocalizationManagerPostInit", "vtc_main", function(loc)
	LocalizationManager:add_localized_strings({
		hud_instruct_mask_on = "",  --Put on mask prompt
		hud_skip_blackscreen = "$BTN_ACCEPT",  --Hold to skip intro
		hud_suspicion_detected = "- ALERTED -",  --Detection

		savefile_saving = "Saving",

		--SAFEHOUSE--
		menu_cn_chill_combat_defend = "Defend",  --Defend Safehouse
		menu_cn_chill_combat_ignore_defend = "Ignore",  --Defend Safehouse


		--INFAMY--
		menu_infamy_name_root = "The Infamous",  --Infamy I
		menu_infamy_name_ghost = "The Assassin",  --Infamy Ghost
		menu_infamy_name_mastermind = "The Plague",  --Infamy Mastermind
		menu_infamy_name_technician = "The Ingenious",  --Infamy Technician
		menu_infamy_name_enforcer = "The Slaughterhouse",  --Infamy Enforcer
		menu_infamy_name_balaclava = "The Classic",  --Infamy Balaclava
		menu_infamy_name_pain = "The Bane",  --Infamy Bane Mask
		menu_infamy_name_hood = "The Dishonored",  --Infamy Dishonored Mask
		menu_infamy_name_daft = "The Punk",  --Infamy Daft Punk
		menu_infamy_name_destroyer = "The Apocalypse",  --Infamy Anubis Mask
		menu_infamy_name_lurker = "The Hellspawn",  --Infamy Demon Mask
		menu_infamy_name_ranger = "The Jaws of Crime",  --Infamy Archery Mask
		menu_infamy_name_punk = "The Inventor",  --Infamy Steampunk Mask
		menu_infamy_name_xp = "XP Boost",  --Infamy XP Bonus


		--LOBBY--
		menu_waiting_is_ready = "[X]",  --Lobby Ready String
		menu_waiting_is_not_ready = "[  ]", --Lobby Not Ready String

		cn_menu_community = "",  --Community heist

		menu_specialization = "Perks",  --Perk Decks
		menu_st_skilltree = "Skills",  --Skill Trees
		
		menu_st_activate_spec = "Equip Perks",
		menu_st_max_perk_deck = "Unlock Perks",

		menu_clear_progress = "Delete Savefile",  --Reset Progress
		menu_clear_progress_help = "Deletes your savefile. Only do this if you're 100% sure this is what you want to do.",  --Reset Progress
		dialog_are_you_sure_you_want_to_clear_progress = "This process is irreversible. It will delete everything that you currently have and start you back at level 0, infamy 0. Are you 100% certain you want to do this?",


		--MENU BUTTONS--
		fast_net_title = "Play Online (Lobby Browser)",  --FAST.NET
		fast_net_friends_title = "Play Online (Friend Browser)",  --FAST.NET Friends
		
		menu_crimenet = "Play Online",  --CRIME.NET
		menu_crimenet_help = "Play online with other players.",  --CRIME.NET Description
		menu_crimenet_offline = "Play Offline",  --CRIME.NET Offline
		menu_crimenet_offline_help = "Play offline with bots.",  --CRIME.NET Offline Description
		
		menu_debug = "",  --If you have the Fast.net mod or the freecam mod this hides the debug button
		debug_start_the_game = "",  --If you have the Fast.net mod or the freecam mod this hides the debug button
		
		menu_player_inventory = "Loadout",  --New Inventory
		menu_player_inventory_help = "Opens the loadout. Contains weapons, skills, and perks.",  --New Inventory
		menu_player_column_one_title = "Player",  --New Inventory
		menu_player_column_two_title = "Weapons",  --New Inventory
		menu_player_column_three_title = "Items & Skills",  --New Inventory
		menu_button_hide = "[X]",  --New Inventory
		menu_button_show = "[  ]",  --New Inventory
		bm_menu_btn_sell_tradeable = "Sell",
		
		menu_choose_new_contract = "Pick a heist to start the game.",  --CRIME.NET
		
		menu_visit_gamehub = "Steam Community",
		menu_crew_management = "AI Loadout",
		
		menu_visit_gamehub_help = "Opens the PAYDAY 2 Steam Community page in the Steam overlay.",
		menu_content_updates = "Announcements",
		menu_content_updates_help = "View the Steam announcements.",
		menu_skilltree = "Skills / Perks",
		menu_skilltree_help = "Allows you to unlock and equip skills / perks.",
		menu_option_default = "Reset Options",
		menu_option_default_help = "Resets all of your options to the defaults.",
		dialog_default_options_message = "This will reset all of your settings to the default. If you have messed up something this may fix your issue. Are you certain you want to do this?",
		menu_visit_fbi_files = "Open FBI Files",  --Characters
		menu_visit_fbi_files_help = "Opens the FBI files in the Steam overlay.",  --Characters
		menu_custom_safehouse = "Safe House",  --Characters
		
		--PAUSE SCREEN--
		menu_resume_game = "Resume",
		menu_restart_game = "Restart",
		menu_players_list = "Players",
		menu_end_game = "Quit",
		menu_abort_mission = "Quit Heist",
		
		--CRIME.NET SIDEBAR--
		cn_crime_spree = "Crime Spree",
		menu_cn_shortcuts = "Close Navigation",
		menu_cn_short = "Tutorial Heists",
		menu_contact_info_short = "Tutorial Heists",
		short_basics_header = "Choose A Tutorial",
		short_basics_desc = "Before playing the game you should learn to play, although if you're using this mod you're likely experienced already.",
		
		heist_short1 = "Stealth",
		heist_short2 = "Loud",
		
		menu_cn_story_missions = "Missions",
		menu_cn_chill = "Safe House",
		menu_cn_chill_combat = "Safe House Raid",
		menu_chill_combat_under_attack = "- SAFE HOUSE RAID -",
		menu_chill_combat_under_attack_desc = "",
		menu_cn_premium_buy = "Heist Select",
		menu_cn_premium_buy_accept = "Play",
		menu_contract_broker = "Heist Select",
		menu_cn_contact_info = "Character Profiles",
		menu_cn_casino = "Offshore Casino",
		menu_cn_gage_assignment = "Gage Packages",
		menu_gage_assignment_title = "Gage Packages",
		menu_mutators = "Mutators",
		
		menu_filter_time = "Heist Length",
		
		menu_cs_enter_safehouse = "Enter",
		menu_cs_map = "Map",
		menu_cs_change_floor = "Floor",
		menu_trophy_display_all = "Display All",
		menu_trophy_displayed = "Displayed",
		menu_trophy_hide_all = "Hide All",
		menu_trophy_not_displayed = "Hidden",
		menu_cs_cant_afford = "Not enough Continental Coins.",
		menu_cs_rooms_help_hover_no_upgrade = "Room fully upgraded",
		menu_cs_rooms_help_hover = "Room is upgradeable",
		menu_cn_filters_sidebar = "Lobby Filters",
		menu_cn_legend_risk = "Difficulty",
		menu_cn_legend_mutated = "Mutators",
		menu_cn_legend_host = "Heist",
		menu_cn_legend_join = "Public Lobby",
		menu_cn_legend_friends = "Friend Lobby",
		menu_risk = "Difficulty",
		menu_new = "",
		menu_permission = "Privacy",
		menu_kicking_allowed_option = "Kick Mode",
		menu_kick_server = "Host",
		menu_kick_vote = "Vote",
		menu_kick_disabled = "Disabled",
		
		menu_contact_info_title = "Character Profiles",
		
		menu_cs_upgrade_max = "This room is fully upgraded.",
		
		menu_back = "BACK",
		
		menu_ultimate_edition_short = "",
		menu_mutators_reset_all = "Reset All",
		menu_toggle_ai = "AI Teammates",
		
		
		--LOBBY 2: ELECTRIC BOOGALOO--
		menu_dlc_buy_ecp = "",
		menu_lobby_menu_state_lobby = "",
		menu_edit_game_settings = "Lobby Settings",
		menu_reputation_permission = "Level Limit",
		menu_toggle_drop_in = "Drop-in",
		menu_toggle_auto_kick = "Auto-kick",
		menu_lobby_menu_state_options = "Options",
		menu_invite_friends = "Invite",
		menu_story_missions = "Missions",
		menu_loading_progress = "$prog%",
		menu_ghost_bonus = "Stealth Bonus: $exp_bonus%",
		menu_jukebox_playlist_all = "Random",
		menu_jukebox_random_heist_playlist = "Random From Playlist",
		menu_jukebox_playlist_heist = "Heist Track",
		menu_jukebox_your_choice = "Custom",
		menu_choose_contract = "Select Heist",
		menu_leave_lobby = "Leave",
		menu_start_the_game = "Start",
		cn_menu_decline_contract = "Back",
		cn_menu_accept_contract = "Play",
		menu_end_crime_spree = "End Spree",
		
		menu_l_lootscreen = "Loot Drop",
		menu_l_choose_card_local = "",
		menu_l_choose_card_chosen_suspense = "",
		menu_l_waiting_for_all = "",
		failed_disconnected_continue = "Continue",
		
		menu_asset_gage_assignment = "Gage Packages",
		
		menu_asset_risklevel_6 = "Death Sentence",
		menu_asset_risklevel_5 = "Deathwish",
		menu_asset_risklevel_4 = "Mayhem",
		menu_asset_risklevel_3 = "Overkill",
		menu_asset_risklevel_2 = "Very Hard",
		menu_asset_risklevel_1 = "Hard",
		menu_asset_risklevel_0 = "Normal",
		
		
		--PREPLANNING--
		menu_preplanning_enter = "Preplanning",
		menu_preplanning_title = "",
		menu_pp_sub_voting = "Required",
		menu_pp_sub_place = "Optional",
		menu_pp_sub_info = "Info",
		menu_pp_cat_mission_equipment = "Equipment",
		menu_pp_cat_vault_plan = "Drill Location / Alternatives",
		menu_pp_cat_escape_plan = "Escape",
		menu_pp_cat_entry_plan = "Entry",
		menu_pp_free_of_charge = "No cost.",
		menu_pp_asset_drill_parts = "Drill Bits",
		menu_pp_asset_highlight_keybox = "Mark Keys",
		menu_pp_vault_big_drill = "The Beast (Default)",
		menu_pp_escape_helicopter_loud = "Airlift (Default)",
		menu_pp_asset_delay_police_10 = "Alarm 10s. Delay",
		menu_pp_asset_delay_police_20 = "Alarm 20s. Delay",
		menu_pp_asset_delay_police_30 = "Alarm 30s. Delay",
		menu_pp_asset_reduce_timelock_60 = "Faster Timelock",
		menu_pp_asset_kenaz_loud_entry_with_c4 = "Loud (C4)",
		menu_pp_asset_kenaz_loud_entry = "Loud",
		menu_pp_asset_kenaz_silent_entry = "Silent",
		menu_pp_asset_kenaz_vault_gate_key = "Keys",
		menu_pp_asset_branchbank_vault_key = "Keys",
		menu_pp_asset_kenaz_limo_escape = "Limo (Default)",
		menu_pp_asset_kenaz_zeppelin_escape = "Blimp",
		menu_pp_asset_kenaz_van_escape = "Van",
		
		
		--CASINO--
		menu_casino_title_main = "Offshore Casino",
		menu_casino_choice_bet = "Place Bet",
		menu_casino_choice_exit = "Back",
		menu_offshore_account = "Offshore",
		menu_casino_option_prefer_title = "Card Type",
		menu_casino_option_infamous_title = "Infamous",
		menu_casino_option_safecard_title = "Card Safety",
		menu_casino_option_safecard1 = "1/3 Cards",
		menu_casino_option_safecard2 = "2/3 Cards",
		menu_casino_option_safecard3 = "3/3 Cards",
		menu_casino_title_breakdown = "Total Cost",
		menu_casino_title_stats = "Drop Chance",
		menu_casino_cost_fee = "Base Cost",
		menu_cn_casino_pay_accept = "Yes",
		
		
		--INTERACTIONS--
		hud_int_equipment_drill = "$BTN_INTERACT Place Drill",
		debug_interact_saw = "$BTN_INTERACT Place Saw",
		hud_int_equipment_no_keycard = "",
		hud_int_equipment_keycard = "$BTN_INTERACT Use Keycard",
		hud_int_pickup_keycard = "$BTN_INTERACT Take Keycard",
		hud_int_pick_lock = "$BTN_INTERACT Pick Lock",
		hud_int_hold_pickup_lance = "$BTN_INTERACT Pickup Drill",
		debug_interact_intimidate = "$BTN_INTERACT Take Hostage",
		debug_interact_hostage_move = "$BTN_INTERACT Stand Up",
		debug_interact_hostage_stay = "$BTN_INTERACT Sit Down",
		debug_interact_equipment_cable_tie = "",
		hud_int_equipment_drill_jammed = "$BTN_INTERACT Fix Drill",
		hud_int_equipment_lance = "$BTN_INTERACT Start Drill",
		hud_int_equipment_lance_jammed = "$BTN_INTERACT Fix Drill",
		hud_int_hostage_convert = "$BTN_INTERACT Convert",
		hud_int_barrier_numpad = "$BTN_INTERACT Activate Barrier",
		hud_int_access_camera = "$BTN_INTERACT View Cameras",
		debug_interact_equipment_stash_planks = "",
		debug_interact_stash_planks_pickup = "$BTN_INTERACT Take Planks",
		debug_interact_stash_planks = "$BTN_INTERACT Use Planks",
		debug_interact_money_wrap_single_bundle_take_money = "$BTN_INTERACT Take Money",
		debug_interact_being_revived = "Being Revived",
		hud_starting_heist = "Masking Up",
		debug_interact_gage_assignment_take = "$BTN_INTERACT Take Package",
		hud_int_hold_cut_fence = "$BTN_INTERACT Cut Fence",
		hud_access_camera_feed_lost = "- CAMERA OUT OF OPERATION -",
		hud_action_try_keys_no_keys = "No Keys",
		hud_deploy_valid_help = "",
		hud_deploying_equipment = "",
		hud_int_take = "$BTN_INTERACT Take Item",
		debug_interact_money_wrap_take_money = "$BTN_INTERACT Bag Money",
		debug_interact_gold_pile_take_money = "$BTN_INTERACT Bag Gold",
		hud_int_hold_grab_the_bag = "$BTN_INTERACT Pickup Bag",
		hud_int_hold_grab_the_painting = "$BTN_INTERACT Pickup Painting",
		hud_int_cut_glass = "$BTN_INTERACT Cut Glass",
		debug_interact_temp_interact_box_press = "$BTN_INTERACT Interact",
		hud_int_type_in_password = "$BTN_INTERACT Type Password",
		debug_interact_hack_ipad = "$BTN_INTERACT Hack Device",
		hud_int_take_jewelry = "$BTN_INTERACT Take Jewelry",
		hud_int_equipment_shaped_charge = "$BTN_INTERACT Use C4",
		hud_int_disable_alarm_pager = "$BTN_INTERACT Use Pager",
		hud_int_dispose_corpse = "$BTN_INTERACT Bag Corpse",
		hud_int_take_diamonds_dah = "$BTN_INTERACT Bag Diamonds",
		hud_cas_take_gear = "$BTN_INTERACT Take Gear",
		hud_cas_open_guitar_case = "$BTN_INTERACT Open Case",
		hud_take_sleeping_gas = "$BTN_INTERACT Take Gas",
		hud_cas_open_door = "$BTN_INTERACT Open Door",
		hud_int_hold_take_safe = "$BTN_INTERACT Pickup Safe",
		hud_cas_close_door = "$BTN_INTERACT Close Door",
		hud_int_hold_play_slots = "$BTN_INTERACT Play Slots",
		debug_interact_equipment_crowbar = "",
		debug_interact_equipment_saw = "",
		debug_interact_saw_jammed = "$BTN_INTERACT Fix Saw",
		hud_int_hold_take_saw = "$BTN_INTERACT Take Saw",
		hud_int_hold_crack_crate = "$BTN_INTERACT Open Crate",
		hud_int_hold_born_untie = "$BTN_INTERACT Set Free",
		hud_int_hold_search_computer = "$BTN_INTERACT Search Computer",
		hud_int_hold_take_shoes = "$BTN_INTERACT Pickup Heels",
		hud_int_hold_open_xmas_present = "$BTN_INTERACT Open Present",
		hud_int_hold_take_toy = "$BTN_INTERACT Pickup Toy",
		hud_int_use_ecm_jammer = "$BTN_INTERACT Use ECM",
		hud_int_invisible_interaction_open = "$BTN_INTERACT Open",
		hud_int_tape_loop = "$BTN_INTERACT Loop Camera",
		hud_int_hold_take_painting = "$BTN_INTERACT Pickup Painting",
		debug_interact_security_station = "$BTN_INTERACT Security Override",
		present_obtained_mission_equipment_title = "Item Obtained:",
		debug_interact_circuit_breaker = "$BTN_INTERACT Use Circuit Breaker",
		hud_int_hold_grab_goat = "$BTN_INTERACT Pickup Goat",
		hud_int_hold_remove_debris = "$BTN_INTERACT Move Debris",
		hud_int_hold_activate_sprinklers = "$BTN_INTERACT Activate Sprinklers",
		hud_int_setup_zipline = "$BTN_INTERACT Setup Zipline",
		hud_int_use_zipline = "$BTN_INTERACT Use Zipline",
		hud_carry_cloaker_cocaine = "Cloakaine",
		mission_objective_activated = "New Objective",
		hud_int_hold_take_handcuffs = "$BTN_INTERACT Take Handcuffs",
		
		hud_int_hold_to_choose_mask = "$BTN_INTERACT Choose Mask",
		hud_int_hold_take_mask = "$BTN_INTERACT Take Mask",
		
		hud_int_vehicle_drive = "$BTN_INTERACT Drive",
		hud_int_vehicle_enter = "$BTN_INTERACT Passenger",
		hud_int_vehicle_open_trunk = "$BTN_INTERACT Open Trunk",
		hud_int_vehicle_loot = "$BTN_INTERACT Pickup From Trunk",
		hud_int_vehicle_close_trunk = "$BTN_INTERACT Close Trunk",
		
		hud_int_take_hydrogen_chloride = "$BTN_INTERACT Take Hydrogen",
		hud_int_methlab_gas_to_salt = "$BTN_INTERACT Hydrogen Chloride",
		hud_int_no_hydrogen_chloride = "",
		
		hud_int_take_caustic_soda = "$BTN_INTERACT Take Caustic Soda",
		hud_int_methlab_caustic_cooler = "$BTN_INTERACT Caustic Soda",
		hud_int_no_caustic_soda = "",
		
		hud_int_take_acid = "$BTN_INTERACT Take Muriatic Acid",
		hud_int_methlab_bubbling = "$BTN_INTERACT Muriatic Acid",
		hud_int_no_acid = "",
		
		hud_int_hold_take_meth = "$BTN_INTERACT Bag Meth",
		
		debug_interact_c4 = "$BTN_INTERACT Place C4",
		debug_interact_gas = "$BTN_INTERACT Place Gas",
		debug_interact_equipment_gas = "",
		hud_int_hold_take_gas = "$BTN_INTERACT Take Gas",
		hud_int_hold_start_crane = "$BTN_INTERACT Start Crane",
		hud_int_hold_ignite_trap = "$BTN_INTERACT Ignite Trap",
		
		hud_int_play_tape = "$BTN_INTERACT Play",
		hud_int_hold_take_evidence = "$BTN_INTERACT Pickup Evidence",
		hud_int_break_planks = "$BTN_INTERACT Break Planks",
		hud_int_hold_open_slash_close_sec_box = "$BTN_INTERACT Open/Close",
		debug_interact_hospital_security_cable = "$BTN_INTERACT Cut Cable",
		
		debug_interact_c4_bag = "$BTN_INTERACT Take C4",
		hud_int_hold_roll_carpet = "$BTN_INTERACT Move Carpet",
		hud_int_hold_connect_equip = "$BTN_INTERACT Connect Cable",
		hud_int_hold_start_motor = "$BTN_INTERACT Start Engine",
		hud_int_hold_read_barcode = "$BTN_INTERACT Read Barcode",
		hud_int_hold_barcode = "$BTN_INTERACT Take Barcode",
		hud_int_take_weapons = "$BTN_INTERACT Bag Weapons",
		hud_int_hold_open_circuitbreaker = "$BTN_INTERACT Open Breaker",
		hud_int_hold_remove_cover = "$BTN_INTERACT Remove Cover",
		hud_int_hold_cut_cable = "$BTN_INTERACT Cut Cable",
		hud_int_hold_take_cocaine = "$BTN_INTERACT Bag Cocaine",
		hud_int_hold_connect_hose = "$BTN_INTERACT Connect Hose",
		hud_generator_start = "$BTN_INTERACT Start Generator",
		hud_int_remove_rope = "$BTN_INTERACT Remove Rope",
		hud_int_hold_detach_hose = "$BTN_INTERACT Detach Hose",
		hud_int_move_gangplank = "$BTN_INTERACT Move Gangplank",
		
		hud_int_hold_take_jewelry = "$BTN_INTERACT Bag Jewelry",
		
		hud_int_hold_move_car = "$BTN_INTERACT Move Car",
		hud_int_signal_driver = "$BTN_INTERACT Signal Driver",
		hud_int_take_bridge = "$BTN_INTERACT Take Sheets",
		hud_int_use_bridge = "$BTN_INTERACT Make Bridge",
		hud_int_take_ticket = "$BTN_INTERACT Take Ticket",
		hud_int_keyboard_hox_1 = "$BTN_INTERACT Lower Bollards",
		hud_int_hold_remove_armor_plating = "$BTN_INTERACT Remove Armor",
		hud_int_use_ticket = "$BTN_INTERACT Use Ticket",
		hud_int_invisible_interaction_close = "$BTN_INTERACT Close",
		
		hud_int_hold_hack_computer = "$BTN_INTERACT Hack Computer",
		hud_int_hold_approve_request = "$BTN_INTERACT Approve Request",
		hud_int_hold_download_keys = "$BTN_INTERACT Download Keys",
		hud_int_place_harddrive = "$BTN_INTERACT Place HDD",
		hud_int_hold_gather_evidence = "$BTN_INTERACT Take Evidence",
		hud_int_hold_check_evidence = "$BTN_INTERACT Scan Evidence",
		hud_int_hold_take_server = "$BTN_INTERACT Bag Server",
		
		hud_equipment_need_car_keys = "",
		debug_interact_open_door = "$BTN_INTERACT Open Door",
		hud_int_take_keys = "$BTN_INTERACT Take Keys",
		hud_int_hold_unlock_car = "$BTN_INTERACT Unlock Car",
		
		hud_int_hold_take_pills = "$BTN_INTERACT Bag Pills",
		hud_int_bag_zipline = "$BTN_INTERACT Attach to Zipline",
		
		hud_int_equipment_hydrogen_chloride = "Hydrogen",
		hud_int_equipment_caustic_soda = "Caustic Soda",
		hud_int_equipment_acid = "Muriatic Acid",
		
		hud_int_push_button = "$BTN_INTERACT Press Button",
		hud_int_hold_grab_parachute = "$BTN_INTERACT Pickup Parachute",
		
		hud_int_hold_take_blow_torch = "$BTN_INTERACT Take Blow Torch",
		hud_int_hold_open_vent = "$BTN_INTERACT Open Vent",
		hud_int_take_harddrive = "$BTN_INTERACT Take HDD",
		hud_int_big_computer_hackable = "$BTN_INTERACT Hack",
		hud_int_need_thermite_paste = "",
		hud_int_hold_ignite_thermal_paste = "$BTN_INTERACT Use Paste",
		hud_int_take_thermal_paste = "$BTN_INTERACT Take Paste",
		
		hud_int_hold_bag_present = "$BTN_INTERACT Bag Present",
		
		hud_int_hold_raise_balloon = "$BTN_INTERACT Raise Balloon",
		
		hud_int_insert_flash_dive = "$BTN_INTERACT Use USB",
		hud_int_hack_laptop = "$BTN_INTERACT Hack Laptop",
		hud_take_usb_key = "$BTN_INTERACT Take USB",
		hud_int_hold_rewire_fuse_box = "$BTN_INTERACT Cut Wires",
		debug_interact_hack_ipad_jammed = "$BTN_INTERACT Reboot",
		hud_int_hold_open_coke = "$BTN_INTERACT Search Coke",
		hud_mil_hold_remove_bug = "$BTN_INTERACT Take Recorder",
		hud_int_hold_phone_office = "$BTN_INTERACT Call Office",
		hud_int_hold_open_lid = "$BTN_INTERACT Open",
		hud_int_hold_take_yayo = "$BTN_INTERACT Bag Cocaine",
		
		debug_interact_sewer_manhole = "$BTN_INTERACT Open Manhole",
		hud_int_hold_ignite_thermal_paste = "$BTN_INTERACT Use Paste",
		hud_int_take_thermite_paste = "$BTN_INTERACT Take Paste",
		hud_int_take_crowbar = "$BTN_INTERACT Take Crowbar",
		hud_int_set_off_alarm = "$BTN_INTERACT Trigger Alarm",
		hud_int_hold_take_artifact = "$BTN_INTERACT Bag Artifact",
		
		hud_int_hold_born_take_bike_part = "$BTN_INTERACT Pickup Part",
		hud_int_hold_born_receive_item_blow_torch = "$BTN_INTERACT Take Blowtorch",
		hud_int_hold_cut = "$BTN_INTERACT Cut",
		hud_int_hold_hand_over_chrome_skull = "$BTN_INTERACT Give Skull",
		hud_int_hold_release_hatch = "$BTN_INTERACT Release Hatch",
		hud_int_hold_open_case = "$BTN_INTERACT Open Case",
		hud_int_hold_take_helmet = "$BTN_INTERACT Pickup Helmet",
		hud_int_timelock_panel = "$BTN_INTERACT Use Keycard",
		
		menu_victory_goto_payday = "Loot Drop",
		
		hud_int_hold_pku_breaching_charges = "$BTN_INTERACT Pickup Charges",
		hud_int_hold_plant_breaching_charge = "$BTN_INTERACT Plant Charge",
		hud_int_hold_place_breaching_detonator = "$BTN_INTERACT Place Detonator",
		hud_int_open_panicroom = "$BTN_INTERACT Use Keycard",
		hud_int_rewire_box = "$BTN_INTERACT Rewire",
		hud_int_hold_open_vault = "$BTN_INTERACT Open Vault",
		debug_c4_diffusible = "$BTN_INTERACT Defuse C4",
		hud_int_hold_take_prototype = "$BTN_INTERACT Pickup Prototype",
		debug_interact_grenade_crate_take_grenades = "$BTN_INTERACT Take Throwable",
		
		hud_int_hold_open_display = "$BTN_INTERACT Open Display",
		debug_interact_diamond = "$BTN_INTERACT Pickup Diamond",
		hud_int_hold_turn_on_power = "$BTN_INTERACT Turn Power On",
		hud_int_hack_timelock = "$BTN_INTERACT Hack Timelock",
		
		hud_int_hold_open_shopping_bag = "$BTN_INTERACT Open Bag",
		
		hud_int_hold_unlock_display_ares = "Ares",
		hud_int_hold_unlock_display_demeter = "Demeter",
		hud_int_hold_unlock_display_poseidon = "Poseidon",
		hud_int_hold_unlock_display_zeus = "Zeus",
		hud_int_hold_unlock_display_hades = "Hades",
		hud_int_hold_unlock_display_chronos = "Chronos",
		
		debug_interact_trade = "$BTN_INTERACT Trade",
		debug_interact_revive = "$BTN_INTERACT Revive",
		
		menu_cs_suspend_spree = "Exit",
		menu_cs_get_rewards = "End Spree",
		
		debug_interact_numpad = "$BTN_INTERACT Enter Code",
		hud_int_hold_take_necklace = "$BTN_INTERACT Pickup Necklace",
		hud_int_hold_moon_attach_winch = "$BTN_INTERACT Attach Winch",
		
		debug_interact_equiptment_apartment_key = "",
		hud_int_take_chavez_keys = "$BTN_INTERACT Take Keys",
		debug_interact_apartment_key = "$BTN_INTERACT Use Key",
		hud_int_hold_take_toothbrush = "$BTN_INTERACT Pickup Toothbrush",
		debug_interact_apartment_helicopter = "$BTN_INTERACT Attach Magnet",
		
		debug_interact_crowbar = "$BTN_INTERACT Breach Door",
		debug_interact_interaction_ball = "$BTN_INTERACT Pull Hose",
		hud_int_take_paper_roll = "$BTN_INTERACT Take Roll",
		hud_int_take_printer_ink = "$BTN_INTERACT Take Ink",
		hud_int_equipment_printer_ink = "Ink",
		debug_interact_water_tap = "$BTN_INTERACT Turn Tap",
		hud_int_take_plates = "$BTN_INTERACT Take Plates",
		hud_int_hold_insert_plates = "$BTN_INTERACT Insert Plates",
		hud_int_hold_insert_printer_ink = "$BTN_INTERACT Insert Ink",
		hud_int_hold_insert_paper_roll = "$BTN_INTERACT Insert Roll",
		hud_int_hold_start_printer = "$BTN_INTERACT Start Printer",
		debug_interact_transformer_box = "$BTN_INTERACT Turn On",
		hud_int_hold_take_counterfeit_money = "$BTN_INTERACT Bag Money",
		
		debug_interact_stash_server_cord = "$BTN_INTERACT Plug In",
		hud_int_grab_server = "$BTN_INTERACT Take Server",
		debug_interact_stash_server = "$BTN_INTERACT Connect Server",
		hud_man_apply_tape = "$BTN_INTERACT Tape Up",
		debug_interact_thermite = "$BTN_INTERACT Place Thermite",
		hud_int_take_thermite = "$BTN_INTERACT Take Thermite",
		
		hud_int_hack_box = "$BTN_INTERACT Hack Electrical Box",
		hud_int_numpad_keycard = "$BTN_INTERACT Disable Alarms",
		hud_int_numpad_no_keycard = "",
		hud_int_hold_cut_wires = "$BTN_INTERACT Cut Wires",
		hud_int_take_liquid_nitrogen = "$BTN_INTERACT Take Nitrogen",
		hud_int_hold_place_liquid_nitrogen = "$BTN_INTERACT Place Nitrogen",
		hud_equipment_liquid_nitrogen = "",

		hud_int_hold_search_dumpster = "$BTN_INTERACT Open Dumpster",
		hud_int_hold_take_medallion = "$BTN_INTERACT Take Medallion", 
		
		hud_int_equipment_lance_upgrade = "$BTN_INTERACT Upgrade Drill",
		
		hud_int_press_0  = "0",
		hud_int_press_01 = "1",
		hud_int_press_02 = "2",
		hud_int_press_03 = "3",
		hud_int_press_04 = "4",
		hud_int_press_05 = "5",
		hud_int_press_06 = "6",
		hud_int_press_07 = "7",
		hud_int_press_08 = "8",
		hud_int_press_09 = "9",
		hud_int_press_clear = "RESET",
		hud_int_press_enter = "ENTER",
		
		hud_custody_in = "BLEEDOUT",
		hud_civilian_killed_title = "Civilian Killed",
		hud_civilian_killed_message = "-$AMOUNT",
		
		--DEPLOYABLES--
		debug_interact_doctor_bag_heal = "$BTN_INTERACT Heal",
		debug_interact_ammo_bag_take_ammo = "$BTN_INTERACT Take Ammo",
		hud_int_equipment_normal_mode_trip_mine = "Switch to Explosive",
		hud_int_equipment_sensor_mode_trip_mine = "Switch to Sensor",
		hud_int_equipment_ecm_feedback = "$BTN_INTERACT ECM Feedback",
		debug_interact_bodybags_bag_take_bodybag = "$BTN_INTERACT Take Bodybag",
		hud_interact_pickup_sentry_gun = "$BTN_INTERACT Pickup Sentry Gun",
		hud_interact_sentry_gun_switch_fire_mode = "$BTN_INTERACT Switch Fire Mode",
		
		--SAFEHOUSE INTERACTIONS--
		hud_int_talk_butler = "$BTN_INTERACT Talk",
		hud_int_talk_wild = "$BTN_INTERACT Talk",
		hud_int_talk_hoxton = "$BTN_INTERACT Talk",
		hud_int_talk_sydney = "$BTN_INTERACT Talk",
		hud_int_talk_sokol = "$BTN_INTERACT Talk",
		hud_int_talk_jacket = "$BTN_INTERACT Talk",
		hud_int_talk_bodhi = "$BTN_INTERACT Talk",
		hud_int_talk_wolf = "$BTN_INTERACT Talk",
		hud_int_talk_jowi = "$BTN_INTERACT Talk",
		hud_int_talk_chains = "$BTN_INTERACT Talk",
		hud_int_talk_bonnie = "$BTN_INTERACT Talk",
		hud_int_talk_dragon = "$BTN_INTERACT Talk",
		hud_int_talk_jimmy = "$BTN_INTERACT Talk",
		hud_int_talk_terry = "$BTN_INTERACT Talk",
		hud_int_talk_old_hoxton = "$BTN_INTERACT Talk",
		hud_int_talk_clover = "$BTN_INTERACT Talk",
		hud_int_talk_dallas = "$BTN_INTERACT Talk",
		hud_int_talk_max = "$BTN_INTERACT Talk",
		hud_int_talk_myh = "$BTN_INTERACT Talk",
		hud_int_talk_dragan = "$BTN_INTERACT Talk",
		hud_int_talk_ecp_male = "$BTN_INTERACT Talk",
		hud_int_talk_ecp_female = "$BTN_INTERACT Talk",
		
		hud_press_play_music = "$BTN_INTERACT Play",
		hud_press_stop_music = "$BTN_INTERACT Stop",
		hud_press_new_paintjob = "$BTN_INTERACT Change Paint",
		hud_press_answering_play = "$BTN_INTERACT Play Message",
		hud_int_hold_to_help_turtle = "$BTN_INTERACT Help Turtle",
		hud_hold_bet_slotmachine_chl = "$BTN_INTERACT Play Slots ($10,000)",
		hud_press_bet_red = "$BTN_INTERACT Red",
		hud_press_bet_black = "$BTN_INTERACT Black",
		hud_int_spin_wheel = "$BTN_INTERACT Spin",
		hud_int_press_shoot_puck = "$BTN_INTERACT Shoot",
		hud_press_play_jacket_sound = "$BTN_INTERACT Play",
		hud_press_reset_damage_counter = "$BTN_INTERACT Reset Counter",
		hud_press_start_weapon_course = "$BTN_INTERACT Start Timer",
		hud_chill_access_pd2stash = "$BTN_INTERACT Open PD2Stash",
		hud_int_exit_to_crimenet = "$BTN_INTERACT Crime.net",
		hud_chill_access_fbi = "$BTN_INTERACT Open FBI Files",
		hud_int_open_slash_close = "$BTN_INTERACT Open/Close",
		
		
		--HUD HINTS--
		hint_been_tasered = "Being tased",
		hud_hint_clean_block_interact = "Find your equipment",
		hud_hint_mask_off_block_interact = "Mask up",
		hud_hint_tape_loop_limit_reached = "Camera already looped",
		hud_hint_convert_enemy_failed = "Enemy can't be converted",
		hud_hint_new_mask = "Mask unlocked",
		hint_been_electrocuted = "Being electrocuted",
		hint_cant_stand = "Can't stand",
		hint_full_bodybags = "Carrying max bodybags",
		hint_sentry_set_ap_rounds = "Using AP rounds",
		hint_sentry_normal_ammo = "Using normal rounds",
		
		--TICKER--
		hud_casing_mode_ticker = "CASING MODE",
		hud_assault_assault = "ASSAULT",
		hud_casing_mode_ticker_clean = "CIVILIAN MODE",
		
		
		--BAG TYPES--
		hud_carry_lance_bag = "Drill",
		hud_carry_person = "Corpse",
		
		
		--OPTIONS--
		menu_controller_normal = "Normal",
		menu_controller_vehicle = "Vehicle",
		
		
		--INVENTORY--
		bm_menu_grenades = "Consumable",
		bm_menu_deployables = "Deployable",  --Characters
		bm_menu_characters = "Characters",  --Characters
		menu_preferred_character = "Character",  --Characters
		menu_preferred_character_lobby_error = "You cannot change your character while in a lobby.",  --Characters

		menu_lobby_player_slot_available = "",  --Characters

		menu_steam_inventory = "Steam Inventory",  --Microtransactions
		menu_steam_inventory_help = "The inventory contains all items handled by Steam.",  --Microtransactions
		bm_menu_btn_open_container = "Open",  --Characters
		bm_menu_inventory_tradable_all = "All",  --Characters
		bm_menu_inventory_tradable_safes = "Safes",  --Characters
		bm_menu_btn_sell_tradable = "Sell",
		bm_menu_inventory_tradable_weapon_skins = "Weapon Skins",  --Characters
		bm_menu_inventory_tradable_weapon_drills = "Drills",  --Characters
		bm_menu_inventory_tradable_armor_skins = "Armor Skins",  --Characte
		bm_menu_mod_preview = "Preview",
		bm_menu_buy_mask_title = "Mask Inventory",
		bm_menu_btn_buy_tradable = "Buy Skin",
		bm_menu_btn_craft_mod = "Apply Mod",
		bm_menu_btn_remove_mod = "Remove Mod",
		bm_menu_btn_buy_mod = "Buy With Coins",
		bm_menu_btn_preview_with_mod = "Preview Mod",
		bm_menu_btn_preview_no_mod = "Preview Without Mod",
		bm_menu_btn_clear_mod_preview = "Reset Preview",
		bm_menu_btn_stop_preview_weapon_cosmetic = "Preview Without Skin",
		menu_steam_market_title = "Item Collections",
		bm_menu_btn_preview_weapon_cosmetic = "Preview",  --Characters
		bm_menu_btn_preview = "Preview",  --Characters
		bm_menu_btn_preview_mask = "Preview",  --Characters
		bm_menu_btn_preview_melee_weapon = "Preview", --Characters
		bm_menu_btn_preview_grenade = "Preview",  --Characters
		bm_menu_btn_mod = "Modify",  --Characters
		bm_menu_btn_mod_mask = "Modify",  --Characters
		bm_menu_btn_sell = "Sell",  --Characters
		bm_menu_btn_sell_mask = "Sell",  --Characters
		bm_menu_btn_buy_selected_mask = "Buy",
		bm_menu_btn_choose_mask_mod = "Apply",
		bm_menu_btn_customize_mask = "Create",
		bm_menu_btn_buy_new_mask = "Buy Mask",
		bm_menu_empty_mask_slot = "- EMPTY -",
		bm_menu_btn_buy_new_weapon = "Buy Weapon",
		bm_menu_empty_weapon_slot = "- EMPTY -",
		bm_menu_primaries = "1",
		bm_menu_secondaries = "2",
		bm_menu_btn_remove_mask = "Remove",  --Characters
		bm_menu_btn_equip_mask = "Equip",  --Characters
		bm_menu_btn_equip_weapon = "Equip",  --Characters
		bm_menu_btn_equip_melee_weapon = "Equip",  --Characters
		bm_menu_btn_equip_grenade = "Equip",  --Characters
		bm_menu_btn_equip_deployable = "Equip",  --Characters
		bm_menu_btn_equip_primary_deployable = "Equip [1]",  --Characters
		bm_menu_btn_equip_secondary_deployable = "Equip [2]",  --Characters
		bm_menu_btn_unequip_deployable = "Remove",
		bm_menu_btn_equip_armor = "Equip",  --Characters
		bm_menu_btn_customize_armor = "Skins",
		bm_askn_none = "Default",
		bm_menu_btn_move_weapon = "Move",  --Characters
		bm_menu_btn_move_mask = "Move",  --Characters
		bm_menu_equipped = "[X]",  --Characters
		bm_menu_customize_weapon = "Skins",  --Characters
		mel_modify_weapon = "Modify",  --Characters
		bm_menu_stats_max_detection = "",
		bm_menu_stats_detection = "",
		bm_menu_stats_min_detection = "",
		
		menu_preferred_character_title = "Character Hierarchy",
		bm_menu_btn_clear_preferred = "Reset",
		bm_menu_btn_swap_preferred_slots = "Swap",
		bm_menu_btn_set_preferred_to_slot = "Select",
		
		loading_trivia_96 = "Various Text Changes was first uploaded in September of 2015. Development stopped during Crimefest, but two years later it recieved a surprise update.",

		bm_armor_level_1 = "Suit",  --Characters
		bm_armor_level_2 = "LBV",  --Characters
		bm_armor_level_3 = "Vest",  --Characters
		bm_armor_level_4 = "Heavy Vest",  --Characters
		bm_armor_level_5 = "Flak",  --Characters
		bm_armor_level_6 = "CTV",  --Characters
		bm_armor_level_7 = "ICTV",  --Characters

		menu_ti_steam_buy_drills_title = "Buy Drills",  --Characters
		menu_ti_steam_open_safe_title = "Safe Preview",  --Characters
		menu_ti_steam_open_container = "Open",  --Characters

		menu_description = "Briefing",
		menu_assets = "Assets",
		menu_loadout = "Loadout",
		menu_team_loadout = "Crew Loadout",
		menu_jukebox = "Music",

		bm_msk_character_locked = "Default",  --Default Mask
		bm_msk_character_locked_desc = "Equips the default mask for the character you are playing as.",  --Default Mask

		prop_timer_gui_malfunction = "//ERROR//",  --Drill Broke Top Text
		prop_timer_gui_error = "//UNKNOWN//",  --Drill Broke Timer Text

		hud_offshore_account = "Offshore",  --Offshore Name

		hud_carrying = "Bagged:" --Carrying bag
	})
end)
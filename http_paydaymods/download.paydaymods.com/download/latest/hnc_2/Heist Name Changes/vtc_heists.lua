Hooks:Add("LocalizationManagerPostInit", "vtc_heists", function(loc)
	LocalizationManager:add_localized_strings({
		heist_branchbank = "Bank: Random",  --Bank Heist (Pro Job)
		heist_branchbank_cash = "Bank: Money",  --Bank Heist (Cash)
		heist_branchbank_deposit = "Bank: Deposit",  --Bank Heist (Deposit)
		heist_branchbank_gold = "Bank: Gold",  --Bank Heist (Gold)
		heist_branchbank_hl = "Harvest & Trustee",

		heist_born = "Born To Be Wild",
		heist_born_hl = "Born To Be Wild - Bar",
		heist_chew = "Born To Be Wild - Train",
		heist_chew_hl = "Born To Be Wild - Train",

		heist_arm_for = "Turret Trouble",  --AT: Train Heist
		heist_arm_for_hl = "Turret Trouble",  --AT: Train Heist

		heist_arm_und = "Transport: Underpass",  --AT: Underpass
		heist_arm_und_hl = "Underpass", --AT: Underpass

		heist_arm_par = "Transport: Park",  --AT: Park
		heist_arm_par_hl = "Park",  --AT: Park

		heist_arm_cro = "Transport: Crossroads",  --AT: Crossroads
		heist_arm_cro_hl = "Crossroads",  --AT: Crossroads

		heist_arm_fac = "Transport: Harbor",  --AT: Downtown
		heist_arm_fac_hl = "Harbor",  --AT: Downtown

		heist_arm_hcm = "Transport: Downtown",  --AT: Harbor
		heist_arm_hcm_hl = "Downtown",  --AT: Harbor

		heist_gallery = "Artistic Intervention",  --Art Gallery
		heist_gallery_hl = "Artistic Intervention",  --Art Gallery

		heist_jewelry_store = "Jewel Inspection",  --Jewelry Store
		heist_jewelry_store_hl = "Jewel Inspection",  --Jewelry Store

		heist_roberts = "Robbing Roberts",  --GO Bank
		heist_roberts_hl = "Robbing Roberts",  --GO Bank

		heist_arena = "Showtime",  --Alesso
		heist_arena_hl = "Showtime",  --Alesso

		heist_family = "Diamonds Are Forever",  --Diamond Store
		heist_family_hl = "Diamonds Are Forever",  --Diamond Store

		heist_cage = "Pedal to the Metal",  --Car Shop
		heist_cage_hl = "Pedal to the Metal",  --Car Shop

		heist_hox_3 = "Payback",  --Hoxton Revenge
		heist_hox_3_hl = "Payback",  --Hoxton Revenge

		heist_big = "Benevolence",  --Big Bank
		heist_big_hl = "Benevolence",  --Big Bank

		heist_hox = "Breaking Bars",  --Hoxton Breakout
		heist_hox_1_hl = "Breaking Bars - Street",  --Hoxton Breakout
		heist_hox_2_hl = "Breaking Bars - FBI",  --Hoxton Breakout

		heist_mia = "Knock Knock",  --Hotline Miami
		heist_mia_1_hl = "Knock Knock - Motel",  --Hotline Miami
		heist_mia_2_hl = "Knock Knock - Commisar",  --Hotline Miami

		heist_mus = "Blood Diamond",  --The Diamond
		heist_mus_hl = "Blood Diamond",  --The Diamond

		heist_fish = "International Waters",  --yacht heist
		heist_fish_hl = "International Waters",  --yacht heist

		heist_kenaz_full = "Bain's 21", --Golden Grin
		heist_kenaz_full_hl = "Bain's 21", --Golden Grin
		heist_kenaz_hl = "Bain's 21", --Golden Grin

		heist_crojob1 = "Bomb: Docked",  --Bomb: Dockyard
		heist_crojob1_hl = "Docked",  --Bomb: Dockyard

		heist_crojob2 = "Bomb: Derailed",  --Bomb: Forest
		heist_crojob2_hl = "Derailed",  --Bomb: Forest

		heist_friend = "The World Is Yours",  --scarface
		heist_friend_hl = "The World Is Yours",  --scarface

		heist_alex_1_hl = "Rats - Meth",  --Rats
		heist_alex_2_hl = "Rats - Deal",  --Rats
		heist_alex_3_hl = "Rats - Bridge",  --Rats

		heist_firestarter = "Firestarter",  --Firestarter
		heist_firestarter_1_hl = "Firestarter - Airport",  --Firestarter
		heist_firestarter_2_hl = "Firestarter - FBI",  --Firestarter
		heist_firestarter_3_hl = "Firestarter - Bank",  --Firestarter

		heist_watchdogs = "Watchdogs",  --Watchdogs
		heist_watchdogs_1_hl = "Watchdogs - Truck",  --Watchdogs
		heist_watchdogs_2_hl = "Watchdogs - Harbor",  --Watchdogs

		heist_welcome_to_the_jungle = "Cold Fusion",  --Big Oil
		heist_welcome_to_the_jungle_1_hl = "Cold Fusion - Clubhouse",  --Big Oil
		heist_welcome_to_the_jungle_2_hl = "Cold Fusion - Engines",  --Big Oil

		heist_framing_frame_1_hl = "Framing Frame - Gallery",  --Framing Frame
		heist_framing_frame_2_hl = "Framing Frame - Trade",  --Framing Frame
		heist_framing_frame_3_hl = "Framing Frame - Apartment",  --Framing Frame

		heist_election_day_1_hl = "Election Day - Pier 39",  --Election Day
		heist_election_day_2_hl = "Election Day - Goose Island",  --Election Day
		heist_election_day_3_hl = "Election Day - Bank",  --Election Day

		heist_four_stores = "Grocery Shopping",  --Four Stores
		heist_four_stores_hl = "Grocery Shopping",  --Four Stores

		heist_nightclub = "Night Out",  --Nightclub
		heist_nightclub_hl = "Night Out",  --Nightclub

		heist_pines = "White Christmas",  --White XMas
		heist_pines_hl = "White Christmas",  --White XMas

		heist_ukrainian_job = "Wedding Crashers",  --Ukrainian Job
		heist_ukrainian_job_hl = "Wedding Crashers",  --Ukrainian Job

		heist_peta = "Coke Goats",  --Ukrainian Job
		heist_peta_1_hl = "Coke Goats - City",  --Ukrainian Job
		heist_peta_2_hl = "Coke Goats - Barn",  --Ukrainian Job

		heist_brb = "Brooklyn's Treasure",
		heist_brb_hl = "Brooklyn's Treasure",
		
		heist_rvd = "The Cabot Caper"
	})
end)
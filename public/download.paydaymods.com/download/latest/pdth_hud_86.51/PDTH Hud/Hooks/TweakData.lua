local success, err = pcall(function()

pdth_hud.Options:post_init()

--Experimenting



--Experimenting End

if Global.level_data and Global.level_data.level_id then
    local level_id = Global.level_data.level_id
    local val = pdth_hud.Options:GetValue("Gradings/"..level_id, true)
    if val and tweak_data.levels[level_id] ~= nil then
        local colour_grading_val = (val == pdth_hud.definitions.heist_colour_gradings[1] and pdth_hud.Options:GetValue("Grading", true) or val)
        if not table.contains(pdth_hud.definitions.colour_gradings, colour_grading_val) then
            pdth_hud:log("[ERROR] Colour grading for heist, %s is invalid! (%s). Defaulting to PAYDAY+", level_id, colour_grading_val)
            colour_grading_val = pdth_hud.definitions.colour_gradings[1]
        end

        tweak_data.levels[level_id].env_params = tweak_data.levels[level_id].env_params or {}
        tweak_data.levels[level_id].env_params.color_grading = colour_grading_val
    end
end

if pdth_hud.Options:GetValue("HUD/MainHud") then
    tweak_data.contour.character.standard_color = Vector3(0.1, 1, 0.5)
    tweak_data.contour.character.friendly_color = Vector3(0.2, 0.8, 1)
    tweak_data.contour.character.downed_color = Vector3(1, 0.5, 0)
    tweak_data.contour.character.dead_color = Vector3(1, 0.1, 0.1)
    tweak_data.contour.character.dangerous_color = Vector3(0.6, 0.2, 0.2)
    tweak_data.contour.character.more_dangerous_color = Vector3(1, 0.1, 0.1)
    tweak_data.contour.character.standard_opacity = 0
    tweak_data.contour.character_interactable.standard_color = Vector3(1, 0.5, 0)
    tweak_data.contour.character_interactable.selected_color = Vector3(1, 1, 1)
    tweak_data.contour.interactable.standard_color = Vector3(1, 0.4, 0)
    tweak_data.contour.interactable.selected_color = Vector3(1, 1, 1)
    tweak_data.contour.contour_off.standard_color = Vector3(0, 0, 0)
    tweak_data.contour.contour_off.selected_color = Vector3(0, 0, 0)
    tweak_data.contour.contour_off.standard_opacity = 0
    tweak_data.contour.deployable.standard_color = Vector3(0.1, 1, 0.5)
    tweak_data.contour.deployable.selected_color = Vector3(1, 1, 1)
    tweak_data.contour.deployable.active_color = Vector3(0.1, 0.5, 1)
    tweak_data.contour.deployable.interact_color = Vector3(0.1, 1, 0.1)
    tweak_data.contour.deployable.disabled_color = Vector3(1, 0.1, 0.1)
    tweak_data.contour.upgradable.standard_color = Vector3(0.1, 0.5, 1)
    tweak_data.contour.upgradable.selected_color = Vector3(1, 1, 1)
    tweak_data.contour.pickup.standard_color = Vector3(0.1, 1, 0.5)
    tweak_data.contour.pickup.selected_color = Vector3(1, 1, 1)
    tweak_data.contour.pickup.standard_opacity = 1
    tweak_data.contour.interactable_icon.standard_color = Vector3(0, 0, 0)
    tweak_data.contour.interactable_icon.selected_color = Vector3(0, 1, 0)
    tweak_data.contour.interactable_icon.standard_opacity = 0

    tweak_data.blackmarket.projectiles.frag_com.icon = "com_frag_grenade"
    pdth_hud.textures:apply_tweak_data_icons()

    tweak_data.hud_icons.cable = {
        texture = "guis/textures/pd2/hud_pickups",
        texture_rect = {
            32,
            96,
            32,
            32
        }
    }

    tweak_data.hud_icons.repair = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            48,
            48,
            48,
            48
        }
    }

    tweak_data.hud_icons.grenade_pdth = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            416,
            384,
            48,
            48
        }
    }

    tweak_data.hud_icons.agressor = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            0,
            48,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_drill = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            240,
            96,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_bank_manager_key = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            288,
            144,
            48,
            48
        }
    }
    tweak_data.hud_icons.equipment_chavez_key = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            192,
            96,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_generic_key = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            192,
            96,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_planks = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            144,
            288,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_cable_ties = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            384,
            96,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_saw = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            336,
            144,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_thermite = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            560,
            49,
            48,
            48
        }
    }

    --[[tweak_data.hud_icons.equipment_glasscutter = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            384,
            192,
            48,
            48
        }
    }]]--

    tweak_data.hud_icons.equipment_harddrive = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            272,
            288,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_crowbar = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            192,
            240,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_c4 = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            336,
            96,
            48,
            48
        }
    }

    --[[tweak_data.hud_icons.pd2_c4 = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            336,
            96,
            48,
            48
        }
    }]]--

    --[[tweak_data.hud_icons.wp_c4 = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            336,
            96,
            48,
            48
        }
    }]]--

    tweak_data.hud_icons.equipment_gasoline = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            288,
            96,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_muriatic_acid = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            512,
            1,
            48,
            48
        }
    }
    tweak_data.hud_icons.equipment_hydrogen_chloride = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            560,
            1,
            48,
            48
        }
    }
    tweak_data.hud_icons.equipment_caustic_soda = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            608,
            1,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_barcode = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            848,
            1,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_glasscutter = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            944,
            1,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_ticket = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            800,
            1,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_files = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            896,
            1,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_harddrive = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            752,
            1,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_evidence = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            656,
            1,
            48,
            48
        }
    }
    tweak_data.hud_icons.equipment_chainsaw = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            704,
            1,
            48,
            48
        }
    }
    tweak_data.hud_icons.equipment_manifest = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            432,
            192,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_drillfix = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            608,
            49,
            48,
            48
        }
    }


    tweak_data.hud_icons.equipment_fire_extinguisher = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            656,
            49,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_winch_hook = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            704,
            49,
            48,
            48
        }
    }
    tweak_data.hud_icons.equipment_bottle = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            752,
            49,
            48,
            48
        }
    }
    tweak_data.hud_icons.equipment_sleeping_gas = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            800,
            49,
            48,
            48
        }
    }
    tweak_data.hud_icons.equipment_usb_with_data = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            896,
            49,
            48,
            48
        }
    }
    tweak_data.hud_icons.equipment_usb_no_data = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            848,
            49,
            48,
            48
        }
    }
    --[[tweak_data.hud_icons.equipment_empty_cooling_bottle = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            0,
            160,
            32,
            32
        }
    }
    tweak_data.hud_icons.equipment_cooling_bottle = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            0,
            128,
            32,
            32
        }
    }]]--
    tweak_data.hud_icons.equipment_bfd_tool = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            240,
            96,
            48,
            48
        }
    }
    tweak_data.hud_icons.equipment_elevator_key = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            192,
            96,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_blow_torch = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            944,
            49,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_saw = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            336,
            144,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_printer_ink = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            512,
            97,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_plates = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            560,
            97,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_paper_roll = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            608,
            97,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_stash_server = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            656,
            97,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_hand = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            704,
            97,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_briefcase = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            752,
            97,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_chrome_mask = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            800,
            97,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_soda = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            848,
            97,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_born_tool = tweak_data.hud_icons.equipment_drillfix

    local conversion = {
        ["guis/textures/hud_icons"] = "guis/textures/pdth_hud/hud_icons",
        ["guis/textures/pd2/hud_swansong"] = "guis/textures/pdth_hud/hud_swansong",
        ["guis/textures/pd2/pd2_waypoints"] = "guis/textures/pdth_hud/pd2_waypoints",
    }

    for k, icon in pairs(tweak_data.hud_icons) do
        if conversion[icon.texture] then
            icon.texture = conversion[icon.texture]
        end
    end

    local self = tweak_data.weapon
    self.ak74.ammo = "rifle_762"
    self.akm.ammo = "rifle_762"
    self.ak5.ammo = "rifle_556"
    self.amcar.ammo = "rifle_556"
    self.m16.ammo = "rifle_556"
    self.tecci.ammo = "rifle_556"
    self.new_m4.ammo = "rifle_556"
    self.sub2000.ammo = "pistol_40"
    self.famas.ammo = "rifle_556"
    self.s552.ammo = "rifle_556"
    self.scar.ammo = "rifle_762"
    self.fal.ammo = "rifle_762"
    self.galil.ammo = "rifle_556"
    self.g3.ammo = "rifle_762"
    self.akm_gold.ammo = "rifle_762"
    self.g36.ammo = "rifle_556"
    self.vhs.ammo = "rifle_556"
    self.new_m14.ammo = "rifle_762"
    self.l85a2.ammo = "rifle_556"
    self.aug.ammo = "rifle_556"
    self.asval.ammo = "rifle_762"
    self.saiga.ammo = "shotgun_shell"
    self.b682.ammo = "shotgun_shell"
    self.benelli.ammo = "shotgun_shell"
    self.ksg.ammo = "shotgun_shell"
    self.r870.ammo = "shotgun_shell"
    self.aa12.ammo = "shotgun_shell"
    self.wa2000.ammo = "rifle_762"
    self.mosin.ammo = "rifle_762"
    self.model70.ammo = "rifle_762"
    self.r93.ammo = "snp_44"
    self.msr.ammo = "rifle_762"
    self.winchester1874.ammo = "snp_44"
    self.m95.ammo = "snp_50"
    self.long.ammo = "arrow"
    self.flamethrower_mk2.ammo = "fuel_tank"
    self.gre_m79.ammo = "grenade"
    self.arblast.ammo = "crossbow_bolt"
    self.frankish.ammo = "crossbow_bolt"
    self.saw.ammo = "saw_blade"
    self.m32.ammo = "grenade"
    self.plainsrider.ammo = "arrow"
    --self.m134.ammo = "rifle_762"
    self.hk21.ammo = "rifle_762"
    self.mg42.ammo = "rifle_762"
    self.m249.ammo = "rifle_556"
    self.par.ammo = "rifle_762"
    self.rpk.ammo = "rifle_762"
    self.x_b92fs.ammo = "pistol_9mm"
    self.x_g17.ammo = "pistol_9mm"
    self.jowi.ammo = "pistol_9mm"
    self.x_g22c.ammo = "pistol_9mm"
    self.x_mp5.ammo = "pistol_9mm"
    self.x_1911.ammo = "pistol_45"
    self.x_deagle.ammo = "snp_44"
    self.x_sr2.ammo = "pistol_9mm"
    self.x_usp.ammo = "pistol_9mm"
    self.x_akmsu.ammo = "rifle_762"
    self.china.ammo = "grenade"
    self.rpg7.ammo = "rpg"
    self.hunter.ammo = "crossbow_bolt"
    self.m37.ammo = "shotgun_shell"
    self.serbu.ammo = "shotgun_shell"
    self.striker.ammo = "shotgun_shell"
    self.judge.ammo = "shotgun_shell"
    self.sparrow.ammo = "pistol_9mm"
    self.b92fs.ammo = "pistol_9mm"
    self.new_raging_bull.ammo = "snp_44"
    self.c96.ammo = "pistol_9mm"
    self.glock_17.ammo = "pistol_9mm"
    self.g26.ammo = "pistol_9mm"
    self.g22c.ammo = "pistol_9mm"
    self.colt_1911.ammo = "pistol_45"
    self.deagle.ammo = "snp_44"
    self.ppk.ammo = "pistol_9mm"
    self.usp.ammo = "pistol_9mm"
    self.hs2000.ammo = "pistol_9mm"
    self.mateba.ammo = "snp_44"
    self.peacemaker.ammo = "snp_44"
    self.p226.ammo = "pistol_40"
    self.glock_18c.ammo = "pistol_9mm"
    self.pl14.ammo = "pistol_9mm"
    self.tec9.ammo = "pistol_9mm"
    self.m1928.ammo = "pistol_45"
    self.mp9.ammo = "pistol_9mm"
    self.scorpion.ammo = "pistol_9mm"
    self.new_mp5.ammo = "pistol_9mm"
    self.sr2.ammo = "pistol_9mm"
    self.cobray.ammo = "pistol_9mm"
    self.p90.ammo = "rifle_556"
    self.akmsu.ammo = "rifle_762"
    self.polymer.ammo = "pistol_9mm"
    self.mac10.ammo = "pistol_9mm"
    self.baka.ammo = "pistol_45"
    self.olympic.ammo = "rifle_556"
    self.sterling.ammo = "pistol_9mm"
    self.mp7.ammo = "rifle_556"
    self.m45.ammo = "pistol_9mm"
    self.uzi.ammo = "pistol_9mm"
end
local self = tweak_data.interaction

self.copy_machine_smuggle.icon = "equipment_gasoline"
self.safety_deposit.icon = "develop"
self.paper_pickup.icon = "develop"
self.thermite.icon = "equipment_thermite"
self.gasoline.icon = "equipment_gasoline"
self.gasoline_engine.icon = "equipment_gasoline"
self.train_car.icon = "develop"
self.walkout_van.icon = "develop"
self.alaska_plane.icon = "develop"
self.suburbia_door_crowbar.icon = "equipment_crowbar"
self.secret_stash_trunk_crowbar.icon = "equipment_crowbar"
self.requires_saw_blade.icon = "equipment_saw"
self.saw_blade.icon = "equipment_saw"
self.open_slash_close_sec_box.icon = "develop"
self.activate_camera.icon = "interaction_powercord"
self.requires_ecm_jammer_double.icon = "equipment_ecm_jammer"
self.muriatic_acid.icon = "equipment_muriatic_acid"
self.pickup_keycard.icon = "equipment_bank_manager_key"
self.weapon_cache_drop_zone.icon = "develop"
self.secret_stash_limo_roof_crowbar.icon = "equipment_crowbar"
self.suburbia_iron_gate_crowbar.icon = "equipment_crowbar"
self.apartment_key.icon = "equipment_chavez_key"
self.hospital_sample_validation_machine.icon = "equipment_vial"
self.methlab_bubbling.icon = "equipment_muriatic_acid"
self.methlab_caustic_cooler.icon = "equipment_caustic_soda"
self.methlab_gas_to_salt.icon = "equipment_hydrogen_chloride"
self.methlab_drying_meth.icon = "pd2_methlab"
self.caustic_soda.icon = "equipment_caustic_soda"
self.hydrogen_chloride.icon = "equipment_hydrogen_chloride"
self.elevator_button.icon = "interaction_elevator"
self.use_computer.icon = "interaction_keyboard"
self.elevator_button_roof.icon = "interaction_elevator"
self.key_double.icon = "equipment_chavez_key"
self.numpad.icon = "develop"
self.numpad_keycard.icon = "equipment_bank_manager_key"
self.timelock_panel.icon = "develop"
self.take_weapons.icon = "develop"
self.pick_lock_easy.icon = "locked"
self.pick_lock_easy_no_skill.icon = "locked"
self.pick_lock_hard.icon = "locked"
self.pick_lock_hard_no_skill.icon = "locked"
self.open_door_with_keys.icon = "equipment_chavez_key"
self.cant_pick_lock.icon = "locked"
self.hospital_veil_container.icon = "equipment_vialOK"
self.hospital_security_cable.icon = "cable"
self.hospital_veil.icon = "equipment_vial"
self.hospital_sentry.icon = "interaction_sentrygun"
self.drill.icon = "equipment_drill"
self.drill_upgrade.icon = "repair"
self.drill_jammed.icon = "repair"
self.lance.icon = "equipment_drill"
self.lance_jammed.icon = "repair"
self.lance_upgrade.icon = "repair"
self.glass_cutter.icon = "equipment_cutter"
self.glass_cutter_jammed.icon = "repair"
self.hack_ipad.icon = "equipment_hack_ipad"
self.hack_ipad_jammed.icon = "repair"
self.hack_suburbia.icon = "equipment_hack_ipad"
self.hack_suburbia_jammed.icon = "repair"
self.security_station.icon = "equipment_hack_ipad"
self.security_station_keyboard.icon = "interaction_keyboard"
self.big_computer_hackable.icon = "interaction_keyboard"
self.big_computer_not_hackable.icon = "interaction_keyboard"
self.big_computer_server.icon = "interaction_keyboard"
self.security_station_jammed.icon = "interaction_keyboard"
self.apartment_drill.icon = "equipment_drill"
self.apartment_drill_jammed.icon = "repair"
self.suburbia_drill.icon = "equipment_drill"
self.suburbia_drill_jammed.icon = "repair"
self.goldheist_drill.icon = "equipment_drill"
self.goldheist_drill_jammed.icon = "repair"
self.hospital_saw_teddy.icon = "equipment_saw"
self.hospital_saw.icon = "equipment_saw"
self.hospital_saw_jammed.icon = "repair"
self.apartment_saw.icon = "equipment_saw"
self.apartment_saw_jammed.icon = "repair"
self.secret_stash_saw.icon = "equipment_saw"
self.secret_stash_saw_jammed.icon = "repair"
self.revive.icon = "interaction_help"
self.free.icon = "interaction_free"
self.hostage_trade.icon = "interaction_trade"
self.hostage_move.icon = "interaction_trade"
self.hostage_stay.icon = "interaction_trade"
self.trip_mine.icon = "equipment_trip_mine"
self.sentry_gun_refill.icon = "equipment_ammo_bag"
self.sentry_gun_revive.icon = "equipment_ammo_bag"
self.bodybags_bag.icon = "equipment_body_bag"
self.grenade_crate.icon = "grenade_pdth"
self.ammo_bag.icon = "equipment_ammo_bag"
self.doctor_bag.icon = "equipment_doctor_bag"
self.ecm_jammer.icon = "equipment_ecm_jammer"
self.laptop_objective.icon = "laptop_objective"
self.money_bag.icon = "equipment_money_bag"
self.apartment_helicopter.icon = "develop"
self.test_interactive_door.icon = "interaction_open_door"
self.temp_interact_box.icon = "develop"
self.requires_cable_ties.icon = "equipment_cable_ties"
self.temp_interact_box_no_timer.icon = "develop"
self.access_camera.icon = "laptop_objective"
self.interaction_ball.icon = "develop"
self.invisible_interaction_open.icon = "develop"
self.fork_lift_sound.icon = "develop"
self.money_briefcase.icon = "develop"
self.grenade_briefcase.icon = "develop"
self.cash_register.icon = "develop"
self.atm_interaction.icon = "develop"
self.weapon_case.icon = "develop"
self.invisible_interaction_close.icon = "develop"
self.interact_gen_pku_loot_take.icon = "develop"
self.water_tap.icon = "wp_watersupply"
self.water_manhole.icon = "develop"
self.sewer_manhole.icon = "develop"
self.circuit_breaker.icon = "interaction_powerbox"
self.hold_circuit_breaker.icon = "interaction_powerbox"
self.transformer_box.icon = "interaction_powerbox"
self.stash_server_cord.icon = "interaction_powercord"
self.stash_planks.icon = "equipment_planks"
self.stash_planks_pickup.icon = "equipment_planks"
self.stash_server.icon = "equipment_stash_server"
self.stash_server_pickup.icon = "equipment_stash_server"
self.shelf_sliding_suburbia.icon = "develop"
self.tear_painting.icon = "develop"
self.ejection_seat_interact.icon = "equipment_ejection_seat"
self.diamond_pickup.icon = "interaction_diamond"
self.safe_loot_pickup.icon = "develop"
self.mus_pku_artifact.icon = "develop"
self.tiara_pickup.icon = "interaction_diamond"
self.patientpaper_pickup.icon = "interaction_patientfile"
self.diamond_case.icon = "interaction_diamond"
self.diamond_single_pickup.icon = "interaction_diamond"
self.suburbia_necklace_pickup.icon = "develop"
self.temp_interact_box2.icon = "develop"
self.printing_plates.icon = "develop"
self.c4.icon = "equipment_c4"
self.c4_mission_door.icon = "equipment_c4"
self.c4_diffusible.icon = "equipment_c4"
self.open_trunk.icon = "develop"
self.open_door.icon = "interaction_open_door"
self.embassy_door.icon = "interaction_open_door"
self.c4_special.icon = "equipment_c4"
self.c4_bag.icon = "equipment_c4"
self.money_wrap.icon = "interaction_money_wrap"
self.suburbia_money_wrap.icon = "interaction_money_wrap"
self.money_wrap_single_bundle.icon = "interaction_money_wrap"
self.christmas_present.icon = "interaction_christmas_present"
self.gold_pile.icon = "interaction_gold"
self.gold_bag.icon = "interaction_gold"
self.requires_gold_bag.icon = "interaction_gold"
self.intimidate.icon = "equipment_cable_ties"
self.intimidate_and_search.icon = "equipment_cable_ties"
self.computer_test.icon = "develop"
self.carry_drop.icon = "equipment_money_bag"
self.painting_carry_drop.icon = "equipment_money_bag"
self.corpse_alarm_pager.icon = "develop"
self.corpse_dispose.icon = "develop"
self.shaped_sharge.icon = "equipment_c4"
self.hostage_convert.icon = "interaction_trade"
self.break_open.icon = "interaction_wirecutter"
self.cut_fence.icon = "interaction_wirecutter"
self.burning_money.icon = "agressor"
self.hold_take_painting.icon = "develop"
self.barricade_fence.icon = "equipment_planks"
self.hack_numpad.icon = "develop"
self.pickup_phone.icon = "interaction_answerphone"
self.hold_take_server.icon = "equipment_ecm_jammer"
self.hold_take_blueprints.icon = "develop"
self.take_confidential_folder.icon = "develop"
self.hold_take_gas_can.icon = "equipment_gasoline"
self.gen_ladyjustice_statue.icon = "develop"

self.hold_place_gps_tracker.icon = "develop"

self.hold_use_computer.icon = "interaction_keyboard"
self.use_server_device.icon = "equipment_ecm_jammer"
self.iphone_answer.icon = "interaction_answerphone"
self.use_flare.icon = "develop"
self.steal_methbag.icon = "equipment_money_bag"
self.open_from_inside.icon = "develop"
self.hold_pickup_lance.icon = "develop"
self.barrier_numpad.icon = "develop"
self.timelock_numpad.icon = "develop"
self.pickup_asset.icon = "develop"
self.open_slash_close.icon = "develop"
self.raise_balloon.icon = "develop"
self.stn_int_place_camera.icon = "develop"
self.stn_int_take_camera.icon = "develop"
self.exit_to_crimenet.icon = "develop"
self.gage_assignment.icon = "develop"
self.gen_pku_fusion_reactor.icon = "develop"
self.gen_pku_cocaine.icon = "develop"
self.gen_pku_artifact_statue.icon = "develop"
self.gen_pku_artifact.icon = "develop"
self.gen_pku_artifact_painting.icon = "develop"
self.gen_pku_jewelry.icon = "equipment_money_bag"
self.taking_meth.icon = "develop"
self.gen_pku_crowbar.icon = "equipment_crowbar"
self.gen_pku_thermite.icon = "equipment_thermite"
self.gen_pku_thermite_paste.icon = "equipment_thermite"
self.button_infopad.icon = "develop"
self.crate_loot.icon = "develop"
self.crate_loot_crowbar.icon = "equipment_crowbar"
self.crate_loot_close.icon = "develop"
self.halloween_trick.icon = "develop"
self.disassemble_turret.icon = "develop"
self.take_ammo.icon = "equipment_ammo_bag"
self.bank_note.icon = "develop"
self.pickup_boards.icon = "equipment_planks"
self.need_boards.icon = "equipment_planks"
self.uload_database.icon = "develop"
self.uload_database_jammed.icon = "develop"
self.votingmachine2.icon = "develop"
self.votingmachine2_jammed.icon = "develop"
self.sc_tape_loop.icon = "equipment_stash_server" --"interaction_help"
self.shape_charge_plantable.icon = "equipment_c4"
self.player_zipline.icon = "develop"
self.bag_zipline.icon = "develop"
self.huge_lance.icon = "equipment_drill"
self.huge_lance_jammed.icon = "repair"
self.gen_pku_lance_part.icon = "develop"
self.crane_joystick_left.icon = "develop"
self.crane_joystick_lift.icon = "develop"
self.crane_joystick_right.icon = "develop"
self.crane_joystick_release.icon = "develop"
self.gen_int_thermite_rig.icon = "equipment_thermite"
self.gen_int_thermite_apply.icon = "equipment_thermite"
self.apply_thermite_paste.icon = "equipment_thermite"
self.set_off_alarm.icon = "develop"
self.hold_open_vault.icon = "develop"
self.samurai_armor.icon = "develop"
self.fingerprint_scanner.icon = "develop"
self.enter_code.icon = "develop"
self.take_keys.icon = "equipment_chavez_key"
self.push_button.icon = "develop"
self.breach_door.icon = "develop"
self.bus_wall_phone.icon = "interaction_answerphone"
self.zipline_mount.icon = "develop"
self.rewire_timelock.icon = "develop"
self.pick_lock_x_axis.icon = "develop"
self.pku_barcode_downtown.icon = "equipment_barcode"
self.pku_barcode_brickell.icon = "equipment_barcode"
self.pku_barcode_edgewater.icon = "equipment_barcode"
self.pku_barcode_isles_beach.icon = "equipment_barcode"
self.pku_barcode_opa_locka.icon = "equipment_barcode"
self.read_barcode_downtown.icon = "equipment_barcode"
self.read_barcode_brickell.icon = "equipment_barcode"
self.read_barcode_edgewater.icon = "equipment_barcode"
self.read_barcode_isles_beach.icon = "equipment_barcode"
self.read_barcode_opa_locka.icon = "equipment_barcode"
self.read_barcode_activate.icon = "equipment_barcode"
self.hlm_motor_start.icon = "develop"
self.hlm_connect_equip.icon = "develop"
self.hlm_roll_carpet.icon = "develop"
self.hold_pku_equipmentbag.icon = "equipment_c4"
self.disarm_bomb.icon = "equipment_c4"
self.pku_take_mask.icon = "develop"
self.hold_activate_sprinklers.icon = "develop"
self.hold_hlm_open_circuitbreaker.icon = "develop"
self.hold_remove_cover.icon = "develop"
self.hold_cut_cable.icon = "develop"
self.firstaid_box.icon = "interaction_help"
self.first_aid_kit.icon = "equipment_first_aid_kit"
self.road_spikes.icon = "develop"
self.grab_server.icon = "develop"
self.pickup_harddrive.icon = "equipment_harddrive"
self.place_harddrive.icon = "equipment_harddrive"
self.invisible_interaction_searching.icon = "develop"
self.invisible_interaction_gathering.icon = "develop"
self.invisible_interaction_checking.icon = "develop"
self.take_medical_supplies.icon = "interaction_help"
self.search_files_false.icon = "develop"
self.use_files.icon = "equipment_evidence"
self.hack_electric_box.icon = "interaction_powerbox"
self.take_ticket.icon = "equipment_ticket"
self.use_ticket.icon = "equipment_ticket"
self.hold_signal_driver.icon = "pd2_talk"
self.hold_hack_comp.icon = "interaction_keyboard"
self.hold_approve_req.icon = "interaction_keyboard"
self.hold_download_keys.icon = "equipment_harddrive"
self.hold_analyze_evidence.icon = "develop"
self.take_bridge.icon = "equipment_planks"
self.use_bridge.icon = "equipment_planks"
self.hold_close_keycard.icon = "equipment_bank_manager_key"
self.hold_close.icon = "interaction_open_door"
self.hold_open.icon = "interaction_open_door"
self.hold_move_car.icon = "develop"
self.hold_remove_armor_plating.icon = "develop"
self.gen_pku_sandwich.icon = "develop"
self.place_flare.icon = "develop"
self.ignite_flare.icon = "develop"
self.hold_open_xmas_present.icon = "interaction_christmas_present"
self.cut_glass.icon = "equipment_glasscutter"
self.mus_hold_open_display.icon = "develop"
self.mus_take_diamond.icon = "develop"
self.rewire_electric_box.icon = "interaction_powerbox"
self.timelock_hack.icon = "equipment_hack_ipad"

end)

if not success then
    log(tostring(err))
end

Hooks:Add("LocalizationManagerPostInit", "VoxLoadLocalization", function(loc)

    loc:add_localized_strings({
        ["vox_menu_title"] = "Vox Options",
        ["vox_menu_desc"] = "Open the Vox options menu.",
		["vox_btn_add_id"] = "Add Voice ID",
		["vox_btn_add_id_desc"] = "Add a voice ID to be bound to a key."
    })

end)
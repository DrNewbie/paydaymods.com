PDTHHudCoreTextures = PDTHHudCoreTextures or class()

function PDTHHudCoreTextures:init(parent)
	self._parent = parent
	self.portraits = {}

	self.portraits.fallback = {}
	self.portraits.fallback.bg = {
		texture = "guis/textures/pdth_hud/portraits/default",
		texture_rect = {
			0,
	        780,
	        192,
	        390
		}
	}

	self.portraits.fallback.health = {
		texture = "guis/textures/pdth_hud/portraits/default",
		texture_rect = {
			0,
	        0,
	        192,
	        390
		}
	}

	self.portraits.fallback.armor = {
		texture = "guis/textures/pdth_hud/portraits/default",
		texture_rect = {
			0,
	        390,
	        192,
	        390
		}
	}

	self.portraits.fallback.tm = {
		texture = "guis/textures/pdth_hud/portraits/default",
		texture_rect = {
			0,
	        1170,
	        192,
	        192
		}
	}

	self.portraits.teammate = {}

	self.portraits.teammate.health = {
	    texture = "guis/textures/pdth_hud/hud_icons",
		texture_rect = {
			264,
			240,
			12,
			48
		}
	}

	self.portraits.teammate.armor = {
	    texture = "guis/textures/pdth_hud/hud_icons",
		texture_rect = {
			252,
			240,
			12,
			48
		}
	}

	self.portraits.teammate.bg = {
	    texture = "guis/textures/pdth_hud/hud_icons",
		texture_rect = {
			240,
			240,
			12,
			48
		}
	}

	local pistol = {
		texture_rect = {
			0,
			0,
			30,
			148
		},
		style = 1,
		gap = 1,
        h_multi = 0.8
	}

	self.bullets = {
		textures = {
			[2] = "guis/textures/pdth_hud/ammo_white",
			[3] = "guis/textures/pdth_hud/ammo_coloured"
		},
		pistol_9mm = pistol,
		pistol_45 = pistol,
		pistol_40 = pistol,
		shotgun_shell = {
			texture_rect = {
				192,
				0,
				61,
				148
			},
			style = 1
		},
		rifle_556 = {
			texture_rect = {
				254,
				0,
				32,
				148
			},
			style = 1,
            h_multi = 0.75,
            min_height = 100
		},
		rifle_762 = {
			texture_rect = {
				32,
				0,
				27,
				148
			},
			style = 1,
            h_multi = 0.75,
            max = 120
		},
		snp_44 = {
			texture_rect = {
				61,
				0,
				45,
				148
			},
			style = 1
		},
		snp_50 = {
			texture_rect = {
				108,
				0,
				27,
				148
			},
			style = 1
		},
		grenade = {
			texture_rect = {
				137,
				0,
				54,
				148
			},
			style = 1
		},
		rpg = {
			texture_rect = {
				288,
				113,
				148,
				35
			},
			style = 1
		},
		arrow = {
			texture_rect = {
				288,
				84,
				148,
				27
			},
			style = 1,
			h_multi = 0.75
		},
		crossbow_bolt = {
			texture_rect = {
				288,
				69,
				148,
				13
			},
			style = 1,
			h_multi = 0.5
		},
		saw_blade = {
			texture_rect = {
				438,
				0,
				148,
				148
			},
			style = 3
		},
		fuel_tank = {
			texture_rect = {
				288,
				1,
				148,
				66
			},
			style = 3
		}
	}

	self.weapons = {}


	self.pdth = {
		equipment_body_bag = {
	        texture = "guis/textures/pd2/equipment",
	        texture_rect = {
	            96,
	            32,
	            32,
	            32
	        }
		},
	    equipment_ammo_bag = {
	        texture = "guis/textures/pdth_hud/hud_icons",
	        texture_rect = {
	            48,
	            96,
	            48,
	            48
	        }
	    },
	    equipment_doctor_bag = {
	        texture = "guis/textures/pdth_hud/hud_icons",
	        texture_rect = {
	            96,
	            96,
	            48,
	            48
	        }
	    },
	    --[[equipment_sentry = {
	        texture = "guis/textures/pdth_hud/hud_icons",
	        texture_rect = {
	            320,
	            288,
	            48,
	            48
	        }
	    },]]--
	    equipment_trip_mine = {
	        texture = "guis/textures/pdth_hud/hud_icons",
	        texture_rect = {
	            0,
	            96,
	            48,
	            48
	        }
	    },
	    equipment_ecm_jammer = {
	        texture = "guis/textures/pdth_hud/hud_icons",
	        texture_rect = {
	            143,
	            464,
	            48,
	            48
	        }
	    },
	    equipment_armor_kit = {
	        texture = "guis/textures/pdth_hud/hud_icons",
	        texture_rect = {
	            95,
	            464,
	            48,
	            48
	        }
	    },
	    equipment_first_aid_kit = {
	        texture = "guis/textures/pdth_hud/hud_icons",
	        texture_rect = {
	            1,
	            464,
	            47,
	            48
	        }
	    },
	    equipment_bodybags_bag = {
	        texture = "guis/textures/pdth_hud/hud_icons",
	        texture_rect = {
	            48,
	            464,
	            48,
	            48
	        }
	    }
	}
end

function PDTHHudCoreTextures:get_icon_data(icon_id)
	local icon = self[icon_id] and self[icon_id].texture or icon_id
	local texture_rect = self[icon_id] and self[icon_id].texture_rect or {
		384,
		260,
		64,
		130
	}
	return icon, texture_rect
end

function PDTHHudCoreTextures:get_bullet_details(weapon_id, category)
    local option = self._parent.Options:GetValue("HUD/Bullet")

    local texture = self.bullets.textures[option]
	local details = self.bullets.pistol_9mm

    if tweak_data.weapon[weapon_id].ammo then
		details = self.bullets[tweak_data.weapon[weapon_id].ammo]
	elseif self._parent.definitions.ammo[category] then
		details = self.bullets[self._parent.definitions.ammo[category]]
	end

    return texture, details
end

function PDTHHudCoreTextures:apply_tweak_data_icons()
	local icons = tweak_data.hud_icons
	local icon_replacement_tbl = {
		"equipment_ammo_bag",
		"equipment_doctor_bag",
		"equipment_sentry",
		"equipment_sentry_silent",
		"equipment_trip_mine",
		"equipment_ecm_jammer",
		"equipment_armor_kit",
		"equipment_first_aid_kit",
		"equipment_bodybags_bag",
		"frag_grenade",
		"com_frag_grenade",
		"molotov_grenade",
		"dynamite_grenade",
		"four_projectile",
		"ace_projectile",
		"jav_projectile",
		"throwing_axe",
		"chico_injector",
		"concussion_grenade",
		"hobby_knife"
	}
	for _, icon in pairs(icon_replacement_tbl) do
		if self._parent.Options:GetValue("HUD/PDTHEquipmentIcons") and self.pdth[icon] then
			icons[icon] = self.pdth[icon]
		else
			icons[icon] = self:get_weapon_texture(icon, nil, nil, true)
		end
	end
end

function PDTHHudCoreTextures:get_weapon_texture(weapon_id, category, sub_category, ret_tbl)
	local def = self._parent.definitions.weapon_texture
	local texture = def.textures[self._parent.Options:GetValue("HUD/WeaponIcon")]
	local rectangle = {0,0,0,0}

	if self.weapons[weapon_id] then
		rectangle = self.weapons[weapon_id]
	else
		local weap_index = table.index_of(self._parent.definitions.weapon_texture.weapon_order, weapon_id)
		if weap_index == -1 and (self._parent.definitions.weapon_texture.category_conversion[category] or self._parent.definitions.weapon_texture.category_conversion[sub_category]) then
			weap_index = table.index_of(self._parent.definitions.weapon_texture.weapon_order, self._parent.definitions.weapon_texture.category_conversion[category] or self._parent.definitions.weapon_texture.category_conversion[sub_category])
		end
		if weap_index == -1 then
			if ret_tbl then
				return {texture = texture, texture_rect = rectangle}
			else
				return texture, rectangle
			end
		end

		local row = math.floor((weap_index-1) / (def.texture_size.w / def.icon_size.w))
		local column = (weap_index-1) % (def.texture_size.w / def.icon_size.w)
		row = math.floor(row)
		rectangle = {
			column * def.icon_size.w,
			row * def.icon_size.h,
			def.icon_size.w,
			def.icon_size.h
		}
		self.weapons[weapon_id] = rectangle
	end

	if ret_tbl then
		return {texture = texture, texture_rect = rectangle}
	else
		return texture, rectangle
	end
end

function PDTHHudCoreTextures:get_portrait_texture(character, section, main_player)
	if not character then
		return nil
	end

    if not main_player and section ~= "tm" and self._parent.Options:GetValue("HUD/OGTMHealth") then
        local icon = self.portraits.teammate[section].texture
        local texture_rect = self.portraits.teammate[section].texture_rect
        return icon, texture_rect
    end

	local portrait_id = self._parent.Options:GetValue("HUD/portraits/" .. character, true)

	portrait_id = portrait_id or "fallback"

	local icon = self.portraits[portrait_id][character] and self.portraits[portrait_id][character][section] and self.portraits[portrait_id][character][section].texture or self.portraits["default"][character] and self.portraits["default"][character][section] and self.portraits["default"][character][section].texture or self.portraits["fallback"][section].texture or nil
	local texture_rect = self.portraits[portrait_id][character] and self.portraits[portrait_id][character][section] and self.portraits[portrait_id][character][section].texture_rect or self.portraits["default"][character] and self.portraits["default"][character][section] and self.portraits["default"][character][section].texture_rect or self.portraits["fallback"][section].texture_rect or nil

	return icon, texture_rect
end

local portrait_parts = { "health", "armor", "bg", "tm" }
function PDTHHudCoreTextures:ProcessAddon(data, portrait_tbl)
    if data.portraits then
        for _, portait_set in pairs(data.portraits) do
            local name = portait_set.name
            local display_name = portait_set.display_name
            local main_texture = portait_set.main_texture
			local ret_tbl = {name = name, characters = {}}
            if display_name then

                Hooks:Add("LocalizationManagerPostInit", "PDTHHudPortrait" .. name, function(loc)
                    LocalizationManager:add_localized_strings({
                        [name] = display_name
                    })
                end)
            end
            self.portraits[name] = {}
			if portait_set.portraits then
	            for _, portrait in pairs(portait_set.portraits) do
	                local character_id = portrait.character_id
					table.insert(ret_tbl.characters, character_id)
	                self.portraits[name][character_id] = {}
	                for ptype, rect in pairs(portrait.texture_rects) do
	                    self.portraits[name][character_id][ptype] = {
	                        texture = portait_set.texture or main_texture,
	                        texture_rect = rect
	                    }
	                end
	            end
			elseif portait_set.portraits_info then
				local info = portait_set.portraits_info
				local w = info.w
				local h = info.h
				local current_x = 0

				for _, character in pairs(info.included_characters) do
					table.insert(ret_tbl.characters, character)
					self.portraits[name][character] = self.portraits[name][character] or {}
					local current_y = 0
					for _, part in pairs(portrait_parts) do
						self.portraits[name][character][part] = {
							texture = main_texture,
							texture_rect = {
								current_x,
								current_y,
								w,
								part == "tm" and w or h
							}
						}
						current_y = current_y + h + (info.gap or 0)
					end
					current_x = current_x + w + (info.gap or 0)
				end
			end
			table.insert(portrait_tbl, ret_tbl)
		end
    end
end

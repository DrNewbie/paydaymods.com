if not SGO or not SGO.settings.use_bolt then return end
if SystemFS:exists("mods/Slide and Bolt Catch/mod.txt") then return end
--Made by Kolpen/Noep
if not DMCWO then
	if RequiredScript == "lib/units/beings/player/states/playerstandard" then
	
		Hooks:PostHook( PlayerStandard, "update", "slide_lock", function(self)
			local weap_base = self._equipped_unit:base()
			if weap_base and weap_base:weapon_tweak_data().lock_slide then
				if (weap_base.AKIMBO and weap_base:ammo_base():get_ammo_remaining_in_clip() > 1) or (not weap_base.AKIMBO and not weap_base:clip_empty()) then
					weap_base:tweak_data_anim_stop("magazine_empty")
					weap_base:tweak_data_anim_stop("reload")
					weap_base:tweak_data_anim_stop("reload_left")
					if weap_base.AKIMBO then
						weap_base._second_gun:base():tweak_data_anim_stop("magazine_empty")
						weap_base._second_gun:base():tweak_data_anim_stop("reload")
						weap_base._second_gun:base():tweak_data_anim_stop("reload_left")
					end
				end
				if not weap_base._starwars and not self:_is_reloading() then
					if weap_base.AKIMBO and weap_base:ammo_base():get_ammo_remaining_in_clip() == 1 then
						weap_base:tweak_data_anim_stop("fire")
						weap_base:tweak_data_anim_stop("magazine_empty") --should stop OVKs base game lock
						weap_base._second_gun:base():tweak_data_anim_stop("magazine_empty") --ditto
						if weap_base._fire_second_gun_next == false then
							weap_base:tweak_data_anim_offset("reload_left", 0.033, true)
						else
							weap_base:tweak_data_anim_offset("reload_left", 0.033)
						end
					elseif weap_base:clip_empty() then
						weap_base:tweak_data_anim_stop("fire")
						weap_base:tweak_data_anim_stop("magazine_empty")
						weap_base:tweak_data_anim_stop("reload")
						weap_base:tweak_data_anim_stop("reload_left")
						if weap_base.AKIMBO then
							weap_base._second_gun:base():tweak_data_anim_stop("magazine_empty")
							weap_base:tweak_data_anim_offset("reload", 0.033)
							weap_base:tweak_data_anim_offset("reload_left", 0.033, true)
						else
							if (weap_base:weapon_tweak_data().animations and weap_base:weapon_tweak_data().animations.magazine_empty and weap_base:weapon_tweak_data().lock_slide_alt) then
								--Currently the M1 Garand is the only gun that should have the bolt/slide lock done this way due to the En-Bloc clip hovering in midair when using the "reload" animation
								weap_base:tweak_data_anim_offset("magazine_empty", 1)
							else 
								weap_base:tweak_data_anim_offset("reload", 0.033)
							end
						end
					end
				end
			end
		end)
	
	elseif RequiredScript == "lib/units/weapons/newraycastweaponbase" then
	
	function NewRaycastWeaponBase:tweak_data_anim_offset(anim, offset, second_gun)
		local unit_anim = anim
		local data = tweak_data.weapon.factory[self._factory_id]
		if second_gun and alive(self._second_gun) then
			if data.animations and data.animations[unit_anim] then
				local anim_name = data.animations[unit_anim]
				local ids_anim_name = Idstring(anim_name)
				self._second_gun:base()._unit:anim_set_time(ids_anim_name, offset)
			end
			for part_id, data in pairs(self._second_gun:base()._parts) do
				if data.animations and data.animations[unit_anim] then
					local anim_name = data.animations[unit_anim]
					local ids_anim_name = Idstring(anim_name)
					data.unit:anim_set_time(ids_anim_name, offset)
				end
			end
		else
			if data.animations and data.animations[unit_anim] then
				local anim_name = data.animations[unit_anim]
				local ids_anim_name = Idstring(anim_name)
				self._unit:anim_set_time(ids_anim_name, offset)
			end
		
			for part_id, data in pairs(self._parts) do
				if data.animations and data.animations[unit_anim] then
					local anim_name = data.animations[unit_anim]
					local ids_anim_name = Idstring(anim_name)
					data.unit:anim_set_time(ids_anim_name, offset)
				end
			end
		end
		return true
	end
	
	elseif RequiredScript == "lib/tweak_data/weapontweakdata" then
	
		Hooks:PostHook( WeaponTweakData, "init", "slide_lock", function(self)
			local var = {'colt_1911','usp','p226','g22c','glock_17','glock_18c','b92fs','ppk','mac10','s552','new_m14','deagle','x_deagle','x_1911','x_b92fs','jowi','g26','c96','sterling','m1928','hs2000','rpg7','cobray','x_usp','x_g17','x_g22c','hunter','frankish','arblast','sparrow','pl14','hajk','packrat','arbiter','siltstone','x_packrat','lemming','ching','breech','erma'}
			for i, wep_id in ipairs(var) do
				self[ wep_id ].lock_slide = true
			end
			self.ching.lock_slide_alt = true
			
			var = {'mac10','uzi','s552','new_m14','sterling','m1928','cobray','hajk','arbiter','siltstone','mp7','new_m4','amcar','m16','tti','olympic','polymer','tecci','contraband','fal','aa12'}
			for i, wep_id in ipairs(var) do
				self[ wep_id ].sounds.magazine_empty = "wp_rifle_slide_lock"
			end
		end)
	
	end
end
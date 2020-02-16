-- Header comment that will likely be deleted. This was made by 90e.

-- Don't play a sound conventionally (unless using the saw which lacks a single fire sound)

local base_fire_sound = RaycastWeaponBase._fire_sound

function RaycastWeaponBase:_fire_sound()
    if self:get_name_id() == "saw" or self:get_name_id() == "saw_secondary" or self:get_name_id() == "m134" or self:get_name_id() == "flamethrower_mk2" or self:get_name_id() == "mg42" then
        base_fire_sound(self)
    end
end

-- Instead play the single fire noise here

local old_fire = RaycastWeaponBase.fire
function RaycastWeaponBase:fire(...)
    local result = old_fire(self, ...)

    -- Don't try playing the single fire sound with the saw
    if self:get_name_id() == "saw" or self:get_name_id() == "saw_secondary" or self:get_name_id() == "m134" or self:get_name_id() == "flamethrower_mk2" or self:get_name_id() == "mg42" then
        return result
    end

    if result then
        self:play_tweak_data_sound("fire_single", "fire")
    end

    return result
end
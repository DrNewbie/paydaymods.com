
if BlackmarketPersistentNames_SkillTreeGUINew_Hooked then
	return
else
	BlackmarketPersistentNames_SkillTreeGUINew_Hooked = true
end

local function FadeIn(object)
	if alive(object) then
		local current_alpha = object:alpha()
		local lerp = math.lerp
		over(0.3, function(progress)
			object:set_alpha(lerp(current_alpha, 1, progress))
		end)
	end
end

local function FadeOut(object)
	if alive(object) then
		local current_alpha = object:alpha()
		local lerp = math.lerp
		over(0.3, function(progress)
			object:set_alpha(lerp(current_alpha, 0.4, progress))
		end)
	end
end

local refresh_actual = NewSkillTreeSkillItem.refresh
function NewSkillTreeSkillItem:refresh(...)
	refresh_actual(self, ...)

	local prefs = _G.BlackmarketPersistentNames
	prefs = prefs ~= nil and prefs.Prefs or nil
	if prefs ~= nil then
		if not prefs.SkillNames then
			return
		end
	end

	local alive = _G.alive

	local tmp = self._skill_panel
	if not alive(tmp) then
		return
	end

	tmp = tmp:child("SkillName")
	if not alive(tmp) then
		return
	end

	tmp:set_visible(true)

	tmp:stop()
	tmp:animate((not self._selected) and FadeOut or FadeIn)
end


local BLTUIButton_init = BLTUIButton.init
local BLTModItem_init = BLTModItem.init
local BLTDownloadControl_init = BLTDownloadControl.init
local BLTModsGui_setup = BLTModsGui._setup

local box_height = 128
local icon_size = 32
local padding = 10

function BLTMod:HasModImage()
	-- suppress image loading
	return false
end

function BLTUIButton:init(panel, parameters, ...)

	local found

	-- identify download manager button
	if parameters and parameters.text and parameters.text == managers.localization:text("blt_download_manager_help") then
		found = true
		-- fix height param
		parameters.h = box_height
		-- delete image param
		parameters.image = nil
	end

	-- let the button be generated
	local result = BLTUIButton_init(self, panel, parameters, ...)

	if found then
		-- fix text positioning
		local title = self._panel:child("title")
		local desc = self._panel:child("desc")
		if title and desc then

			-- center y
			local full_height = title:h() + desc:h() + 5
			title:set_top((self._panel:h() - full_height) * 0.5)
			desc:set_top(title:bottom() + 5)

		end
	end

	return result
end

function BLTModItem:init(panel, index, ...)

	-- let the item be generated
	local result = BLTModItem_init(self, panel, index, ...)

	-- fix box positioning
	local w = (panel:w() - (self.layout.x + 1) * padding) / self.layout.x
	local column, row = self:_get_col_row(index)
	self._panel:set_x((w + padding) * (column - 1))
	self._panel:set_y((box_height + padding) * (row - 1))

	-- fix box height
	self._panel:set_height(box_height)

	-- scan for child panels and remove them. these are:
	-- 1. the "no image" box and
	-- 2. the 4 white corners - their alignments are set to "grow", so they got stretched by the box resizing
	-- also check if there are icons
	local icons = 0
	for _, child in pairs(self._panel:children()) do
		if alive(child) then
			if child.type_name == "Panel" then
				self._panel:remove(child)
			elseif child.type_name == "Bitmap" and child.texture ~= "guis/textures/test_blur_df" then -- ignore the background
				icons = icons + 1
			end
		end
	end

	-- recreate the white corners with correct size
	BoxGuiObject:new(self._panel, {sides = {1, 1, 1, 1}})

	-- remove description panel
	local mod_desc = self._panel:child("mod_desc")
	if mod_desc then
		self._panel:remove(mod_desc)
	end

	-- fix text positions / sizes
	local mod_name = self._panel:child("mod_name")
	if mod_name then

		-- fix width (prevent overlapping with icons)
		if icons > 1 then
			mod_name:set_w(self._panel:w() - padding * 4 - icon_size * 2)
		end

		-- fix height
		mod_name:set_h(self._panel:h() - padding * 2)

		-- center text
		mod_name:set_vertical("center")

		-- center
		mod_name:set_center_x(self._panel:w() * 0.5)
		mod_name:set_center_y(self._panel:h() * 0.5)

	end

	return result
end

function BLTDownloadControl:init(...)

	-- let the control be generated
	local result = BLTDownloadControl_init(self, ...)

	-- scan for the "no image" panel and remove it
	for _, child in pairs(self._info_panel:children()) do
		if alive(child) and child.type_name == "Panel" then
			self._info_panel:remove(child)
		end
	end

	-- fix download info position & size
	local title = self._info_panel:child("title")
	local state = self._info_panel:child("state")
	local download_progress = self._info_panel:child("download_progress")
	for _, obj in pairs({title, state, download_progress}) do
		if alive(obj) then
			obj:set_x(padding * 2)
			obj:set_w(self._info_panel:w() - padding * 3)
		end
	end

	return result
end

function BLTModsGui:_setup(...)

	-- Get mod list
	local mods = BLT.Mods:Mods()

	-- Take BLT base mod out of the list
	local blt_mod
	for key, mod in pairs(mods) do
		if mod:GetId() == "base" then
			blt_mod = table.remove(mods, key)
			break
		end
	end

	-- Sort mod list
	table.sort(mods, function(a, b)
		return a:GetName():lower() < b:GetName():lower()
	end)

	-- Recreate mod list
	local sorted_mods = {}
	table.insert(sorted_mods, blt_mod)
	for _, mod in pairs(mods) do
		table.insert(sorted_mods, mod)
	end

	-- Replace mod list
	BLT.Mods.mods = sorted_mods

	return BLTModsGui_setup(self, ...)
end
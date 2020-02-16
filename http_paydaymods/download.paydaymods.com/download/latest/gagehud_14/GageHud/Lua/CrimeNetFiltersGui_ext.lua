if mod_collection and mod_collection._data.enable_filtersettings then
	local settings_file = SavePath .. "CrimeNetFilter.ini"

	local filter_close_cbk = CrimeNetFiltersGui.close
	function CrimeNetFiltersGui:close()
		filter_close_cbk(self)
		managers.network.matchmake:save_persistent_settings()
	end
end
local i_td = InfamyTweakData.init
function InfamyTweakData:init(tweak_data)
	i_td(self)
	
	table.insert(self.items.infamy_technician.upgrades.skilltree.trees, "t_unlock")
	
end
Hooks:PostHook(FragGrenade,"_setup_from_tweak_data","frag_setup_tacnade",function(self)
	self._init_timer = math.max(0.0001,self._init_timer - TacticalGrenades.cook_t)
end)
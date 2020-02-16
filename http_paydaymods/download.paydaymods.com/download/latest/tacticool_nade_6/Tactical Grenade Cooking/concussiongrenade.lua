Hooks:PostHook(ConcussionGrenade,"_setup_from_tweak_data","conc_setup_tacnade",function(self)
	self._init_timer = math.max(0.0001,self._init_timer - TacticalGrenades.cook_t)
end)
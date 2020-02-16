function PlayerTweakData:_set_easy_wish()
	self.damage.DOWNED_TIME_DEC = 20
	self.damage.DOWNED_TIME_MIN = 1
	self.suspicion.max_value = 8
	self.suspicion.range_mul = 1
	self.suspicion.buildup_mul = 1
	self.damage.BLEED_OT_TIME = 10
	self.damage.LIVES_INIT = 4
	self.damage.MIN_DAMAGE_INTERVAL = 0.45
	self.damage.REVIVE_HEALTH_STEPS = {0.1}
end

function PlayerTweakData:_set_overkill_290()
	self.damage.DOWNED_TIME_DEC = 20
	self.damage.DOWNED_TIME_MIN = 1
	self.suspicion.max_value = 12
	self.suspicion.range_mul = 1.4
	self.suspicion.buildup_mul = 1.4
	self.damage.BLEED_OT_TIME = 10
	self.damage.LIVES_INIT = 4
	self.damage.MIN_DAMAGE_INTERVAL = 0.35
	self.damage.REVIVE_HEALTH_STEPS = {0.1}
end

function PlayerTweakData:_set_sm_wish()
	self.damage.DOWNED_TIME_DEC = 20
	self.damage.DOWNED_TIME_MIN = 1
	self.suspicion.max_value = 16
	self.suspicion.range_mul = 1.8
	self.suspicion.buildup_mul = 1.8
	self.damage.BLEED_OT_TIME = 10
	self.damage.LIVES_INIT = 2
	self.damage.MIN_DAMAGE_INTERVAL = 0.2
	self.damage.REVIVE_HEALTH_STEPS = {0.1}
end

function PlayerTweakData:_set_singleplayer()
	if is_console then
		self.damage.REGENERATE_TIME = 2.35
	else
		self.damage.REGENERATE_TIME = 3
	end
end
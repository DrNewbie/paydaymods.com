Hooks:PostHook( FPCameraPlayerBase , "spawn_melee_item" , "MeleeOverhaulFPCameraPlayerBasePostSpawnMeleeItem" , function( self )

	if MeleeOverhaul:HasSetting( "HandEffect" ) then
		if MeleeOverhaul.MenuOptions.MultipleChoice[ "HandEffect" ][ 4 ][ MeleeOverhaul:HasSetting( "HandEffect" ) ] and MeleeOverhaul.MenuOptions.MultipleChoice[ "HandEffect" ][ 4 ][ MeleeOverhaul:HasSetting( "HandEffect" ) ][ 2 ] then
			self._lhand_effect = World:effect_manager():spawn({
				effect = Idstring( MeleeOverhaul.MenuOptions.MultipleChoice[ "HandEffect" ][ 4 ][ MeleeOverhaul:HasSetting( "HandEffect" ) ][ 2 ] ),
				parent = self._parent_unit:camera()._camera_unit:get_object( Idstring( "a_weapon_left" ) )
			})
			self._rhand_effect = World:effect_manager():spawn({
				effect = Idstring( MeleeOverhaul.MenuOptions.MultipleChoice[ "HandEffect" ][ 4 ][ MeleeOverhaul:HasSetting( "HandEffect" ) ][ 2 ] ),
				parent = self._parent_unit:camera()._camera_unit:get_object( Idstring( "a_weapon_right" ) )
			})
		end
	end

end )

Hooks:PostHook( FPCameraPlayerBase , "unspawn_melee_item" , "MeleeOverhaulFPCameraPlayerBasePostUnspawnMeleeItem" , function( self )

	if self._lhand_effect then
		World:effect_manager():fade_kill( self._lhand_effect )
		self._lhand_effect = nil
	end
	if self._rhand_effect then
		World:effect_manager():fade_kill( self._rhand_effect )
		self._rhand_effect = nil
	end

end )
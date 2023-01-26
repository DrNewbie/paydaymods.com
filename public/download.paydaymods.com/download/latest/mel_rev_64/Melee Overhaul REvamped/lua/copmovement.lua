function CopMovement:add_dismemberment( part , variant )

	self._dismemberments = self._dismemberments or {}
	self._dismemberments[ part ] = true
	
	if variant then
		self._dismemberments.variant = variant
	end
	
	self._unit:set_extension_update_enabled( Idstring( "movement" ) , true )

end

Hooks:PreHook( CopMovement , "update" , "MeleeOverhaulCopMovementPreUpdate" , function( self , unit , t , dt )

	if self._dismemberments then
		if self._dismemberments.Head then
			if not self._dismemberments.t then self._dismemberments.t = t + 5 end
			
			if MeleeOverhaul.MenuOptions.MultipleChoice[ "SpurtEffect" ][ 4 ][ MeleeOverhaul:HasSetting( "SpurtEffect" ) ] and MeleeOverhaul.MenuOptions.MultipleChoice[ "SpurtEffect" ][ 4 ][ MeleeOverhaul:HasSetting( "SpurtEffect" ) ][ 2 ] then
				local l = {
					[ 1 ] = unit:get_object( Idstring( "Neck" ) ):rotation(),
					[ 2 ] = unit:get_object( Idstring( "Neck" ) ):rotation():y()
				}
				local s = {
					[ 1 ] = unit:get_object( Idstring( "Neck" ) ):rotation(),
					[ 2 ] = unit:movement():m_head_rot():x()
				}
				
				self._dismemberments.fx = World:effect_manager():spawn({
					effect = Idstring( MeleeOverhaul.MenuOptions.MultipleChoice[ "SpurtEffect" ][ 4 ][ MeleeOverhaul:HasSetting( "SpurtEffect" ) ][ 2 ] ),
					position = unit:get_object( Idstring( "Neck" ) ):position(),
					rotation = self._dismemberments.variant == "LargeBladed" and l[ MeleeOverhaul.MenuOptions.MultipleChoice[ "SpurtEffect" ][ 4 ][ MeleeOverhaul:HasSetting( "SpurtEffect" ) ][ 3 ] ] or self._dismemberments.variant == "SmallBladed" and s[ MeleeOverhaul.MenuOptions.MultipleChoice[ "SpurtEffect" ][ 4 ][ MeleeOverhaul:HasSetting( "SpurtEffect" ) ][ 3 ] ] or l[ MeleeOverhaul.MenuOptions.MultipleChoice[ "SpurtEffect" ][ 4 ][ MeleeOverhaul:HasSetting( "SpurtEffect" ) ][ 3 ] ]
				})
			end
			
			local splatter_from = unit:get_object( Idstring( "Neck" ) ):position()
			local splatter_to = splatter_from + unit:get_object( Idstring( "Neck" ) ):rotation():y() * 100
			local splatter_ray = unit:raycast( "ray" , splatter_from , splatter_to , "slot_mask" , managers.slot:get_mask( "world_geometry" ) )
			
			if splatter_ray then
				self._dismemberments.splatter = World:project_decal( Idstring( "blood_spatter" ) , splatter_ray.position , splatter_ray.ray , splatter_ray.unit , nil , splatter_ray.normal )
			end
		end
		if self._dismemberments.LeftArm then
			self._unit:get_object( Idstring( "LeftArm") ):m_position( self._unit:get_object( Idstring( "LeftShoulder" ) ):position() )
			self._unit:get_object( Idstring( "LeftArm" ) ):set_position( self._unit:get_object( Idstring( "LeftShoulder" ) ):position() )
			self._unit:get_object( Idstring( "LeftArm" ) ):set_rotation( self._unit:get_object( Idstring( "LeftShoulder" ) ):rotation() )
			self._unit:get_object( Idstring( "LeftForeArm" ) ):m_position( self._unit:get_object( Idstring( "LeftArm" ) ):position() )
			self._unit:get_object( Idstring( "LeftForeArm" ) ):set_position( self._unit:get_object( Idstring( "LeftArm" ) ):position() )
			self._unit:get_object( Idstring( "LeftForeArm" ) ):set_rotation( self._unit:get_object( Idstring( "Spine1" ) ):rotation() )
			self._unit:get_object( Idstring( "LeftHand" ) ):m_position( self._unit:get_object( Idstring( "Spine1" ) ):position() )
			self._unit:get_object( Idstring( "LeftHand" ) ):set_position( self._unit:get_object( Idstring( "Spine1" ) ):position() )
			self._unit:get_object( Idstring( "LeftHand" ) ):set_rotation( self._unit:get_object( Idstring( "Spine1" ) ):rotation() )
		end
		if self._dismemberments.RightArm then
			self._unit:get_object( Idstring( "RightArm") ):m_position( self._unit:get_object( Idstring( "RightShoulder" ) ):position() )
			self._unit:get_object( Idstring( "RightArm" ) ):set_position( self._unit:get_object( Idstring( "RightShoulder" ) ):position() )
			self._unit:get_object( Idstring( "RightArm" ) ):set_rotation( self._unit:get_object( Idstring( "RightShoulder" ) ):rotation() )
			self._unit:get_object( Idstring( "RightForeArm" ) ):m_position( self._unit:get_object( Idstring( "RightArm" ) ):position() )
			self._unit:get_object( Idstring( "RightForeArm" ) ):set_position( self._unit:get_object( Idstring( "RightArm" ) ):position() )
			self._unit:get_object( Idstring( "RightForeArm" ) ):set_rotation( self._unit:get_object( Idstring( "Spine1" ) ):rotation() )
			self._unit:get_object( Idstring( "RightHand" ) ):m_position( self._unit:get_object( Idstring( "Spine1" ) ):position() )
			self._unit:get_object( Idstring( "RightHand" ) ):set_position( self._unit:get_object( Idstring( "Spine1" ) ):position() )
			self._unit:get_object( Idstring( "RightHand" ) ):set_rotation( self._unit:get_object( Idstring( "Spine1" ) ):rotation() )
		end
		if self._dismemberments.LeftLeg then
			self._unit:get_object( Idstring( "LeftLeg" ) ):m_position( self._unit:get_object( Idstring( "LeftUpLeg" ) ):position() )
			self._unit:get_object( Idstring( "LeftLeg" ) ):set_position( self._unit:get_object( Idstring( "LeftUpLeg" ) ):position() )
			self._unit:get_object( Idstring( "LeftLeg" ) ):set_rotation( self._unit:get_object( Idstring( "LeftUpLeg" ) ):rotation() )
			self._unit:get_object( Idstring( "LeftFoot" ) ):m_position( self._unit:get_object( Idstring( "Hips" ) ):position() )
			self._unit:get_object( Idstring( "LeftFoot" ) ):set_position( self._unit:get_object( Idstring( "Hips" ) ):position() )
			self._unit:get_object( Idstring( "LeftFoot" ) ):set_rotation( self._unit:get_object( Idstring( "Hips" ) ):rotation() )
		end
		if self._dismemberments.RightLeg then
			self._unit:get_object( Idstring( "RightLeg" ) ):m_position( self._unit:get_object( Idstring( "RightUpLeg" ) ):position() )
			self._unit:get_object( Idstring( "RightLeg" ) ):set_position( self._unit:get_object( Idstring( "RightUpLeg" ) ):position() )
			self._unit:get_object( Idstring( "RightLeg" ) ):set_rotation( self._unit:get_object( Idstring( "RightUpLeg" ) ):rotation() )
			self._unit:get_object( Idstring( "RightFoot" ) ):m_position( self._unit:get_object( Idstring( "Hips" ) ):position() )
			self._unit:get_object( Idstring( "RightFoot" ) ):set_position( self._unit:get_object( Idstring( "Hips" ) ):position() )
			self._unit:get_object( Idstring( "RightFoot" ) ):set_rotation( self._unit:get_object( Idstring( "Hips" ) ):rotation() )
		end
	end
	
	if self._dismemberments and self._dismemberments.t and t >= self._dismemberments.t then
		self._dismemberments = nil
	end

end )
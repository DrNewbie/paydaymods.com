Hooks:PostHook( DynamicResourceManager , "post_init" , "MeleeOverhaulDynamicResourceManagerPostPostInit" , function( self )

	for k , v in ipairs( MeleeOverhaul.DynamicResources ) do
		self:load( Idstring( v[ 1 ] ) , Idstring( v[ 2 ] ) , self.DYN_RESOURCES_PACKAGE , false )
	end

end )
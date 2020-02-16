if not SGO or SGO.settings.use_screw ~= 3 then SetVideoWithout = true return end-- Without Outlines OPTION 3
for _, vp in ipairs(managers.viewport:viewports()) do
	vp:vp():set_post_processor_effect("World", Idstring("hdr_post_processor"), Idstring("empty"))
	vp:vp():set_post_processor_effect("World", Idstring("post_SSAO"), Idstring("empty"))
	vp:vp():set_post_processor_effect("World", Idstring("bloom_combine_post_processor"), Idstring("bloom_combine_empty"))
	vp:vp():set_post_processor_effect("World", Idstring("bloom_combine"), Idstring("bloom_combine_empty"))
	
	--vp:vp():set_post_processor_effect("World", Idstring("shadow_processor"), Idstring("empty"))
	vp:vp():set_post_processor_effect("World", Idstring("shadow_modifier"), Idstring("empty"))
	
	vp:vp():set_post_processor_effect("World", Idstring("video_anti_alias"), Idstring("AA_off"))
	vp:vp():set_post_processor_effect("World", Idstring("shadow_rendering"), Idstring("empty"))
	vp:vp():set_post_processor_effect("World", Idstring("light_adaption"), Idstring("no_light_adaption"))
	vp:vp():set_post_processor_effect("World", Idstring("post_LEX_composite"), Idstring("empty"))
	vp:vp():set_post_processor_effect("World", Idstring("post_DOF"), Idstring("empty"))
	
	vp:vp():set_post_processor_effect("World", Idstring("depth_projection"), Idstring("depth_project_empty"))
	vp:vp():set_post_processor_effect("World", Idstring("shadow_slice_depths"), Vector3(0, 0, 0))
	vp:vp():set_post_processor_effect("World", Idstring("shadow_slice_overlap"), Vector3(0, 0, 0))
	
	vp:vp():set_post_processor_effect("World", Idstring("deferred_lighting"), Idstring("empty"))
	vp:vp():set_post_processor_effect("World", Idstring("apply_ambient"), Idstring("empty"))
	vp:vp():set_post_processor_effect("World", Idstring("color_grading_post"), Idstring("empty"))
	vp:vp():set_post_processor_effect("World", Idstring("reflection_visualization"), Idstring("empty"))
	vp:vp():set_post_processor_effect("World", Idstring("glossiness_visualization"), Idstring("empty"))
	vp:vp():set_post_processor_effect("World", Idstring("specular_visualization"), Idstring("empty"))
end
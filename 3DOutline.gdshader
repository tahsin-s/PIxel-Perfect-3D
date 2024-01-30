shader_type spatial;
render_mode unshaded;

uniform sampler2D screen_texture: source_color, hint_screen_texture, filter_nearest_mipmap;
uniform sampler2D depth_texture: source_color, hint_depth_texture, filter_nearest_mipmap;

float get_depth(mat4 inv_proj_matrix, vec2 screen_uv){
	float depth = texture(depth_texture, screen_uv).r;
	vec3 ndc = vec3(screen_uv * 2.0 - 1.0, depth);
	vec4 view = inv_proj_matrix * vec4(ndc, 1.0);
	view.xyz /= view.w;
	return -view.z;
}

void vertex() {
	POSITION = vec4(VERTEX, 1.0);
}

void fragment() {
	float depth = get_depth(INV_PROJECTION_MATRIX, SCREEN_UV);
	ALBEDO = vec3( depth/ 20.0);
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}

shader_type spatial;

uniform sampler2D uv_texture: filter_nearest_mipmap, hint_default_black;
void vertex() {
	VERTEX.y = VERTEX.y * 2.0;
	VERTEX.x = VERTEX.x * 1.3;
}

void fragment() {
	ALBEDO = texture(uv_texture, UV).rgb;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}

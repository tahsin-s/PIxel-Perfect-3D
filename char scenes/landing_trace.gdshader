shader_type spatial;

const float pixel_bias = 5.0;
const float time_bias = 8.0;
const float opacity = 0.5;
uniform sampler2D screen_texture: hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
	ALBEDO =  1.0 - texture(screen_texture, SCREEN_UV).rgb;
	ALPHA = opacity * step(2, mod(VERTEX.y * pixel_bias + TIME * time_bias,3.2));
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}

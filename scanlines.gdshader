shader_type canvas_item;

uniform vec2 resolution = vec2(320, 180);
uniform sampler2D screen_texture: hint_screen_texture, repeat_disable, filter_nearest_mipmap;
uniform float scanline_opacity:hint_range(0.0, 1.0, 0.05) = 0.3;
uniform float bloom_level:hint_range(0.0, 10.0, 0.05) = 0.2;
uniform float scanline_thickness:hint_range(0.0, 1.0, 0.05) = 0.3;

void fragment() {
	float thisline = SCREEN_UV.y * resolution.y;
	float scanline_level = thisline - floor(thisline);
	
	COLOR = texture(screen_texture, SCREEN_UV);
	COLOR.rgb += COLOR.rgb * (
		scanline_level > scanline_thickness? 
		bloom_level : -scanline_opacity
	);
}
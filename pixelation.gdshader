shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform vec2 resolution = vec2(320.0, 180.0);

vec2 pixelate (vec2 uv){
	return floor(uv * resolution) / resolution;
}
void fragment() {
	COLOR = texture(screen_texture, pixelate(SCREEN_UV));
}

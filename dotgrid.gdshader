shader_type canvas_item;

uniform vec2 screen_res = vec2(1920, 1080);
uniform vec2 game_res = vec2(320, 180);
uniform float dark_level: hint_range(-1.0, 1.0, 0.05) = 0.5;
uniform sampler2D screen_texture: hint_screen_texture, repeat_disable, filter_nearest_mipmap;

const float SIN_1 = 2.0 - cos((1.0 - 3.0) / 2.3);
const float SIN_2 = 2.0 - cos((2.0 - 3.0) / 2.3);
const float SIN_3 = 2.0 - cos((3.0 - 3.0) / 2.3);
const float SIN_4 = 2.0 - cos((4.0 - 3.0) / 2.3);
const float SIN_5 = 2.0 - cos((5.0 - 3.0) / 2.3);
const float SIN_0 = 2.0 - cos((6.0 - 3.0) / 2.3);

void fragment() {
	vec2 pixel_dist = SCREEN_UV * screen_res;
	pixel_dist = mod(pixel_dist, screen_res * 1.0 / game_res);
	
	float multiply = 1.0 - 2.0 * dark_level;
	switch(int(pixel_dist.x)){
		case 0:
			multiply += dark_level * SIN_0;
			break;
		case 1:
			multiply += dark_level * SIN_1;
			break;
		case 2:
			multiply += dark_level * SIN_2;
			break;
		case 3:
			multiply += dark_level * SIN_3;
			break;
		case 4:
			multiply += dark_level * SIN_4;
			break;
		case 5:
			multiply += dark_level * SIN_5;
			break;
	}
	
	switch(int(pixel_dist.y)){
		case 0:
			multiply += dark_level * SIN_0;
			break;
		case 1:
			multiply += dark_level * SIN_1;
			break;
		case 2:
			multiply += dark_level * SIN_2;
			break;
		case 3:
			multiply += dark_level * SIN_3;
			break;
		case 4:
			multiply += dark_level * SIN_4;
			break;
		case 5:
			multiply += dark_level * SIN_5;
			break;
	}
	
	COLOR.rgb = texture(screen_texture, SCREEN_UV).rgb * multiply;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}

shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform vec3 pixel_radius = vec3(1, 1, 1);
// Blurs the screen in the X-direction.
void fragment() {
	vec3 gauss_radius = pixel_radius * SCREEN_PIXEL_SIZE.x;
    vec3 col = texture(screen_texture, SCREEN_UV).xyz * 0.16;
    col.r += texture(screen_texture, SCREEN_UV + vec2(gauss_radius.x, 0.0)).r * 0.15;
    col.r += texture(screen_texture, SCREEN_UV + vec2(-gauss_radius.x, 0.0)).r * 0.15;
    col.r += texture(screen_texture, SCREEN_UV + vec2(2.0 * gauss_radius.x, 0.0)).r * 0.12;
    col.r += texture(screen_texture, SCREEN_UV + vec2(2.0 * -gauss_radius.x, 0.0)).r * 0.12;
    col.r += texture(screen_texture, SCREEN_UV + vec2(3.0 * gauss_radius.x, 0.0)).r * 0.09;
    col.r += texture(screen_texture, SCREEN_UV + vec2(3.0 * -gauss_radius.x, 0.0)).r * 0.09;
    col.r += texture(screen_texture, SCREEN_UV + vec2(4.0 * gauss_radius.x, 0.0)).r * 0.05;
    col.r += texture(screen_texture, SCREEN_UV + vec2(4.0 * -gauss_radius.x, 0.0)).r * 0.05;
	
    col.g += texture(screen_texture, SCREEN_UV + vec2(gauss_radius.y, 0.0)).g * 0.15;
    col.g += texture(screen_texture, SCREEN_UV + vec2(-gauss_radius.y, 0.0)).g * 0.15;
    col.g += texture(screen_texture, SCREEN_UV + vec2(2.0 * gauss_radius.y, 0.0)).g * 0.12;
    col.g += texture(screen_texture, SCREEN_UV + vec2(2.0 * -gauss_radius.y, 0.0)).g * 0.12;
    col.g += texture(screen_texture, SCREEN_UV + vec2(3.0 * gauss_radius.y, 0.0)).g * 0.09;
    col.g += texture(screen_texture, SCREEN_UV + vec2(3.0 * -gauss_radius.y, 0.0)).g * 0.09;
    col.g += texture(screen_texture, SCREEN_UV + vec2(4.0 * gauss_radius.y, 0.0)).g * 0.05;
    col.g += texture(screen_texture, SCREEN_UV + vec2(4.0 * -gauss_radius.y, 0.0)).g * 0.05;
	
    col.b += texture(screen_texture, SCREEN_UV + vec2(gauss_radius.z, 0.0)).b * 0.15;
    col.b += texture(screen_texture, SCREEN_UV + vec2(-gauss_radius.z, 0.0)).b * 0.15;
    col.b += texture(screen_texture, SCREEN_UV + vec2(2.0 * gauss_radius.z, 0.0)).b * 0.12;
    col.b += texture(screen_texture, SCREEN_UV + vec2(2.0 * -gauss_radius.z, 0.0)).b * 0.12;
    col.b += texture(screen_texture, SCREEN_UV + vec2(3.0 * gauss_radius.z, 0.0)).b * 0.09;
    col.b += texture(screen_texture, SCREEN_UV + vec2(3.0 * -gauss_radius.z, 0.0)).b * 0.09;
    col.b += texture(screen_texture, SCREEN_UV + vec2(4.0 * gauss_radius.z, 0.0)).b * 0.05;
    col.b += texture(screen_texture, SCREEN_UV + vec2(4.0 * -gauss_radius.z, 0.0)).b * 0.05;
    COLOR.rgb = col;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}

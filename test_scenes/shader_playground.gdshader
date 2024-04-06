shader_type canvas_item;
// UV/FRAGCOOD.xy?
// TEXTURE
// COLOR

void fragment() {
	vec2 uv = FRAGCOORD.xy * SCREEN_PIXEL_SIZE * 2.0 - 1.0;
	uv = fract(uv*1.5*cos(TIME))-0.5;
	float d = length(uv);
	vec2 m = vec2(0.5,0.0);
	vec4 c = texture(TEXTURE, UV+(TIME*m));
	vec3 r = c.xyz + (d/(2.0+sin(TIME)));
	COLOR = vec4(r,c.w);
}

shader_type canvas_item;
uniform vec2 u_resolution;

void fragment() {
	vec2 shifteduv = UV;
	vec2 fcoord = FRAGCOORD.xy+vec2(-u_resolution.x/2.0,-u_resolution.y/2.0);
	float n_time = TIME*0.0001;
	vec2 res = SCREEN_PIXEL_SIZE;
	float dist = distance(normalize(fcoord), u_resolution);
	shifteduv.x = dist*(abs(sin(n_time))+2.5)*2.0;
	shifteduv.y = dist*(cos(n_time)+2.5)*1.0;
	COLOR = texture(TEXTURE, shifteduv);
}

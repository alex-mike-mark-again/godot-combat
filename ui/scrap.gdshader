shader_type canvas_item;
uniform float x_scroll;
uniform float y_scroll;

void fragment() {
	vec2 shifteduv = UV;
    shifteduv .x += TIME * x_scroll + UV.y;
	if(int(UV.y*20.0)%10 < 5){
    	shifteduv .y += sin(TIME) * y_scroll;
	} else {
    	shifteduv .y += cos(TIME) * y_scroll;
	}
	
    vec4 color = texture(TEXTURE, shifteduv);
    COLOR = color;
}

shader_type canvas_item;
uniform float scroll_speed;
uniform vec2 direction;

void fragment() {
	vec2 shifteduv = UV;
    shifteduv .x += direction.x * TIME * scroll_speed;
    shifteduv .y += direction.y * TIME * scroll_speed;
    vec4 color = texture(TEXTURE, shifteduv);
    COLOR = color;
}

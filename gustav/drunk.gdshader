shader_type canvas_item;

uniform bool active = false;

void fragment() {
	vec3 blue = vec3(0.2,0.3,1) * 1.0;
	if (active) {
		COLOR.rgb *= blue;
	}
}


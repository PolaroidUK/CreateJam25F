shader_type canvas_item;

uniform float intensity = 0.0;

void fragment() {
	vec3 hue = vec3(sin(TIME * 1.5)*intensity*0.2, cos(TIME)*intensity*0.2, sin(TIME *0.5)*intensity*0.2);
	COLOR.rgb += hue;
}
void vertex() {
	VERTEX.x += sin( (UV.y * 2.0) + (TIME * 2.0) ) * 4.0 * intensity;
	VERTEX.y += sin( (UV.y * 5.0) + (TIME * 2.0) ) * 2.0 * intensity;
	
}
shader_type canvas_item;

void vertex() {
}

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform vec2 mouse_position;
uniform float innerRad = .04;

void fragment() {
	float darkScale = .5;
	float lightDial = .5;
	vec4 lightBoost = vec4(.2,.2,.2,.2);
	float innerRad = .04;
	float spread = .02;
	float aspect = 800./500.;

	vec4 prev = textureLod(screen_texture, SCREEN_UV, 0.0);
	vec4 dark = prev * vec4(0.,0.,0., darkScale);
	vec4 light = prev * vec4(1.,1.,1., lightDial) + lightBoost;
	float d = length((UV - mouse_position)*vec2(aspect,1));
	float dCurved = smoothstep(innerRad+spread, innerRad, d);
    COLOR = mix(dark, light, dCurved);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}

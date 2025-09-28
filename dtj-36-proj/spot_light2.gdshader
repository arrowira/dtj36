shader_type canvas_item;

void vertex() {
}

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
	float darkScale = .5;
	float lightDial = .5;
	vec4 lightBoost = vec4(.2,.2,.2,.2);
	float innerRad = .004;
	float outerRad = .005;
	
	vec4 prev = textureLod(screen_texture, SCREEN_UV, 0.0);
	vec4 dark = prev * vec4(0.,0.,0.,darkScale);
	vec4 light = prev * vec4(1.,1.,1.,lightDial) + lightBoost;
	float d = distance(UV, vec2(.50,.50));
	float dCurved = smoothstep(outerRad, innerRad, d);
    COLOR = mix(dark, light, dCurved);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}

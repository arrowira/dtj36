shader_type canvas_item;

void vertex() {
}

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
	vec4 prev = textureLod(screen_texture, SCREEN_UV, 0.0);
	vec4 dark = prev *vec4(0.,0.,0.,.7);
	vec4 light = prev*vec4(1.,1.,1.,.5)+vec4(.2,.2,.2,.2);
	//dark = vec4(1,0,0,1);light=vec4(0,1,0,1);
	float d = distance(UV, vec2(.50,.50));
	float d2 = smoothstep(.005,.002,d);
    COLOR = mix(dark,  light, d2);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
